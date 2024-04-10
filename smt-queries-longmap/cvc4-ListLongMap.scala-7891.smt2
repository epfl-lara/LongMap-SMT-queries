; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98094 () Bool)

(assert start!98094)

(declare-fun b_free!23795 () Bool)

(declare-fun b_next!23795 () Bool)

(assert (=> start!98094 (= b_free!23795 (not b_next!23795))))

(declare-fun tp!84088 () Bool)

(declare-fun b_and!38373 () Bool)

(assert (=> start!98094 (= tp!84088 b_and!38373)))

(declare-fun b!1126850 () Bool)

(declare-fun e!641394 () Bool)

(declare-fun tp_is_empty!28325 () Bool)

(assert (=> b!1126850 (= e!641394 tp_is_empty!28325)))

(declare-fun b!1126851 () Bool)

(declare-fun e!641389 () Bool)

(declare-fun e!641388 () Bool)

(assert (=> b!1126851 (= e!641389 e!641388)))

(declare-fun res!753014 () Bool)

(assert (=> b!1126851 (=> res!753014 e!641388)))

(declare-datatypes ((array!73511 0))(
  ( (array!73512 (arr!35408 (Array (_ BitVec 32) (_ BitVec 64))) (size!35944 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73511)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1126851 (= res!753014 (not (= (select (arr!35408 _keys!1208) from!1455) k!934)))))

(declare-fun e!641393 () Bool)

(assert (=> b!1126851 e!641393))

(declare-fun c!109683 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126851 (= c!109683 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42893 0))(
  ( (V!42894 (val!14219 Int)) )
))
(declare-fun zeroValue!944 () V!42893)

(declare-datatypes ((Unit!36924 0))(
  ( (Unit!36925) )
))
(declare-fun lt!500380 () Unit!36924)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13453 0))(
  ( (ValueCellFull!13453 (v!16852 V!42893)) (EmptyCell!13453) )
))
(declare-datatypes ((array!73513 0))(
  ( (array!73514 (arr!35409 (Array (_ BitVec 32) ValueCell!13453)) (size!35945 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73513)

(declare-fun minValue!944 () V!42893)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!383 (array!73511 array!73513 (_ BitVec 32) (_ BitVec 32) V!42893 V!42893 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36924)

(assert (=> b!1126851 (= lt!500380 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44305 () Bool)

(declare-fun mapRes!44305 () Bool)

(declare-fun tp!84089 () Bool)

(declare-fun e!641391 () Bool)

(assert (=> mapNonEmpty!44305 (= mapRes!44305 (and tp!84089 e!641391))))

(declare-fun mapValue!44305 () ValueCell!13453)

(declare-fun mapRest!44305 () (Array (_ BitVec 32) ValueCell!13453))

(declare-fun mapKey!44305 () (_ BitVec 32))

(assert (=> mapNonEmpty!44305 (= (arr!35409 _values!996) (store mapRest!44305 mapKey!44305 mapValue!44305))))

(declare-fun res!753011 () Bool)

(declare-fun e!641397 () Bool)

(assert (=> start!98094 (=> (not res!753011) (not e!641397))))

(assert (=> start!98094 (= res!753011 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35944 _keys!1208))))))

(assert (=> start!98094 e!641397))

(assert (=> start!98094 tp_is_empty!28325))

(declare-fun array_inv!27174 (array!73511) Bool)

(assert (=> start!98094 (array_inv!27174 _keys!1208)))

(assert (=> start!98094 true))

(assert (=> start!98094 tp!84088))

(declare-fun e!641390 () Bool)

(declare-fun array_inv!27175 (array!73513) Bool)

(assert (=> start!98094 (and (array_inv!27175 _values!996) e!641390)))

(declare-fun b!1126852 () Bool)

(declare-fun res!753013 () Bool)

(assert (=> b!1126852 (=> (not res!753013) (not e!641397))))

(assert (=> b!1126852 (= res!753013 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35944 _keys!1208))))))

(declare-fun b!1126853 () Bool)

(assert (=> b!1126853 (= e!641390 (and e!641394 mapRes!44305))))

(declare-fun condMapEmpty!44305 () Bool)

(declare-fun mapDefault!44305 () ValueCell!13453)

