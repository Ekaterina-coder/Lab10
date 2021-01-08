require 'open-uri'

class IndexController < ApplicationController
  def input
  end

  def view
    parse_params
    url = URL + "/#{@val}"
    api_response = open(url)
    if @side == 'server'
      @result = xslt_transform(api_response).to_html
    elsif @side == 'client-with-xslt'
      browser = insert_browser_xslt(api_response)
      render xml: browser.to_xml
    else
      render xml: api_response
    end
  end

  private
  URL = 'http://localhost:3001/'.freeze
  SERV_TRANS = "#{Rails.root}/public/converter.xslt".freeze
  BROWS_TRANS = 'browser_transform.xslt'.freeze

  def parse_params
    @val = params[:n]
    @side = params[:side]
  end

  def xslt_transform(data, transform: SERV_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: BROWS_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,'xml-stylesheet', 'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
