; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98082 () Bool)

(assert start!98082)

(declare-fun b_free!23783 () Bool)

(declare-fun b_next!23783 () Bool)

(assert (=> start!98082 (= b_free!23783 (not b_next!23783))))

(declare-fun tp!84052 () Bool)

(declare-fun b_and!38349 () Bool)

(assert (=> start!98082 (= tp!84052 b_and!38349)))

(declare-fun mapIsEmpty!44287 () Bool)

(declare-fun mapRes!44287 () Bool)

(assert (=> mapIsEmpty!44287 mapRes!44287))

(declare-fun b!1126514 () Bool)

(declare-fun e!641216 () Bool)

(declare-fun tp_is_empty!28313 () Bool)

(assert (=> b!1126514 (= e!641216 tp_is_empty!28313)))

(declare-fun b!1126515 () Bool)

(declare-fun e!641208 () Bool)

(assert (=> b!1126515 (= e!641208 true)))

(declare-datatypes ((V!42877 0))(
  ( (V!42878 (val!14213 Int)) )
))
(declare-fun zeroValue!944 () V!42877)

(declare-datatypes ((array!73489 0))(
  ( (array!73490 (arr!35397 (Array (_ BitVec 32) (_ BitVec 64))) (size!35933 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!500252 () Bool)

(declare-datatypes ((ValueCell!13447 0))(
  ( (ValueCellFull!13447 (v!16846 V!42877)) (EmptyCell!13447) )
))
(declare-datatypes ((array!73491 0))(
  ( (array!73492 (arr!35398 (Array (_ BitVec 32) ValueCell!13447)) (size!35934 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73491)

(declare-fun minValue!944 () V!42877)

(declare-datatypes ((tuple2!17872 0))(
  ( (tuple2!17873 (_1!8947 (_ BitVec 64)) (_2!8947 V!42877)) )
))
(declare-datatypes ((List!24648 0))(
  ( (Nil!24645) (Cons!24644 (h!25853 tuple2!17872) (t!35423 List!24648)) )
))
(declare-datatypes ((ListLongMap!15841 0))(
  ( (ListLongMap!15842 (toList!7936 List!24648)) )
))
(declare-fun contains!6469 (ListLongMap!15841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4424 (array!73489 array!73491 (_ BitVec 32) (_ BitVec 32) V!42877 V!42877 (_ BitVec 32) Int) ListLongMap!15841)

(assert (=> b!1126515 (= lt!500252 (contains!6469 (getCurrentListMapNoExtraKeys!4424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1126516 () Bool)

(declare-fun res!752774 () Bool)

(declare-fun e!641209 () Bool)

(assert (=> b!1126516 (=> (not res!752774) (not e!641209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126516 (= res!752774 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!44287 () Bool)

(declare-fun tp!84053 () Bool)

(declare-fun e!641212 () Bool)

(assert (=> mapNonEmpty!44287 (= mapRes!44287 (and tp!84053 e!641212))))

(declare-fun mapRest!44287 () (Array (_ BitVec 32) ValueCell!13447))

(declare-fun mapValue!44287 () ValueCell!13447)

(declare-fun mapKey!44287 () (_ BitVec 32))

(assert (=> mapNonEmpty!44287 (= (arr!35398 _values!996) (store mapRest!44287 mapKey!44287 mapValue!44287))))

(declare-fun b!1126517 () Bool)

(declare-fun res!752781 () Bool)

(assert (=> b!1126517 (=> (not res!752781) (not e!641209))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126517 (= res!752781 (= (select (arr!35397 _keys!1208) i!673) k!934))))

(declare-fun b!1126518 () Bool)

(assert (=> b!1126518 (= e!641212 tp_is_empty!28313)))

(declare-fun b!1126519 () Bool)

(declare-fun res!752772 () Bool)

(declare-fun e!641214 () Bool)

(assert (=> b!1126519 (=> (not res!752772) (not e!641214))))

(declare-fun lt!500255 () array!73489)

(declare-datatypes ((List!24649 0))(
  ( (Nil!24646) (Cons!24645 (h!25854 (_ BitVec 64)) (t!35424 List!24649)) )
))
(declare-fun arrayNoDuplicates!0 (array!73489 (_ BitVec 32) List!24649) Bool)

(assert (=> b!1126519 (= res!752772 (arrayNoDuplicates!0 lt!500255 #b00000000000000000000000000000000 Nil!24646))))

(declare-fun b!1126520 () Bool)

(declare-fun e!641215 () Bool)

(declare-fun call!47631 () ListLongMap!15841)

(declare-fun call!47632 () ListLongMap!15841)

(assert (=> b!1126520 (= e!641215 (= call!47631 call!47632))))

(declare-fun b!1126521 () Bool)

(declare-fun res!752773 () Bool)

(assert (=> b!1126521 (=> (not res!752773) (not e!641209))))

(assert (=> b!1126521 (= res!752773 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35933 _keys!1208))))))

(declare-fun b!1126522 () Bool)

(declare-fun -!1130 (ListLongMap!15841 (_ BitVec 64)) ListLongMap!15841)

(assert (=> b!1126522 (= e!641215 (= call!47631 (-!1130 call!47632 k!934)))))

(declare-fun b!1126523 () Bool)

(declare-fun e!641210 () Bool)

(assert (=> b!1126523 (= e!641210 (and e!641216 mapRes!44287))))

(declare-fun condMapEmpty!44287 () Bool)

(declare-fun mapDefault!44287 () ValueCell!13447)

