; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98006 () Bool)

(assert start!98006)

(declare-fun b_free!23707 () Bool)

(declare-fun b_next!23707 () Bool)

(assert (=> start!98006 (= b_free!23707 (not b_next!23707))))

(declare-fun tp!83824 () Bool)

(declare-fun b_and!38197 () Bool)

(assert (=> start!98006 (= tp!83824 b_and!38197)))

(declare-fun b!1124264 () Bool)

(declare-fun res!751174 () Bool)

(declare-fun e!640009 () Bool)

(assert (=> b!1124264 (=> (not res!751174) (not e!640009))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73341 0))(
  ( (array!73342 (arr!35323 (Array (_ BitVec 32) (_ BitVec 64))) (size!35859 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73341)

(assert (=> b!1124264 (= res!751174 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35859 _keys!1208))))))

(declare-fun b!1124265 () Bool)

(declare-fun e!640015 () Bool)

(declare-fun e!640012 () Bool)

(assert (=> b!1124265 (= e!640015 e!640012)))

(declare-fun res!751167 () Bool)

(assert (=> b!1124265 (=> res!751167 e!640012)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1124265 (= res!751167 (not (= (select (arr!35323 _keys!1208) from!1455) k!934)))))

(declare-fun e!640008 () Bool)

(assert (=> b!1124265 e!640008))

(declare-fun c!109551 () Bool)

(assert (=> b!1124265 (= c!109551 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42777 0))(
  ( (V!42778 (val!14175 Int)) )
))
(declare-fun zeroValue!944 () V!42777)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13409 0))(
  ( (ValueCellFull!13409 (v!16808 V!42777)) (EmptyCell!13409) )
))
(declare-datatypes ((array!73343 0))(
  ( (array!73344 (arr!35324 (Array (_ BitVec 32) ValueCell!13409)) (size!35860 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73343)

(declare-fun minValue!944 () V!42777)

(declare-datatypes ((Unit!36856 0))(
  ( (Unit!36857) )
))
(declare-fun lt!499398 () Unit!36856)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!353 (array!73341 array!73343 (_ BitVec 32) (_ BitVec 32) V!42777 V!42777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36856)

(assert (=> b!1124265 (= lt!499398 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124266 () Bool)

(declare-fun e!640014 () Bool)

(declare-fun e!640013 () Bool)

(declare-fun mapRes!44173 () Bool)

(assert (=> b!1124266 (= e!640014 (and e!640013 mapRes!44173))))

(declare-fun condMapEmpty!44173 () Bool)

(declare-fun mapDefault!44173 () ValueCell!13409)

