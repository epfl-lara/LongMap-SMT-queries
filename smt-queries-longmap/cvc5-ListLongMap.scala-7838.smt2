; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97772 () Bool)

(assert start!97772)

(declare-fun b_free!23473 () Bool)

(declare-fun b_next!23473 () Bool)

(assert (=> start!97772 (= b_free!23473 (not b_next!23473))))

(declare-fun tp!83122 () Bool)

(declare-fun b_and!37747 () Bool)

(assert (=> start!97772 (= tp!83122 b_and!37747)))

(declare-fun b!1118348 () Bool)

(declare-fun res!746920 () Bool)

(declare-fun e!637003 () Bool)

(assert (=> b!1118348 (=> (not res!746920) (not e!637003))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72897 0))(
  ( (array!72898 (arr!35101 (Array (_ BitVec 32) (_ BitVec 64))) (size!35637 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72897)

(assert (=> b!1118348 (= res!746920 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35637 _keys!1208))))))

(declare-fun b!1118349 () Bool)

(declare-fun e!637007 () Bool)

(assert (=> b!1118349 (= e!637007 true)))

(declare-datatypes ((V!42465 0))(
  ( (V!42466 (val!14058 Int)) )
))
(declare-fun zeroValue!944 () V!42465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17630 0))(
  ( (tuple2!17631 (_1!8826 (_ BitVec 64)) (_2!8826 V!42465)) )
))
(declare-datatypes ((List!24416 0))(
  ( (Nil!24413) (Cons!24412 (h!25621 tuple2!17630) (t!34897 List!24416)) )
))
(declare-datatypes ((ListLongMap!15599 0))(
  ( (ListLongMap!15600 (toList!7815 List!24416)) )
))
(declare-fun lt!497476 () ListLongMap!15599)

(declare-datatypes ((ValueCell!13292 0))(
  ( (ValueCellFull!13292 (v!16691 V!42465)) (EmptyCell!13292) )
))
(declare-datatypes ((array!72899 0))(
  ( (array!72900 (arr!35102 (Array (_ BitVec 32) ValueCell!13292)) (size!35638 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72899)

(declare-fun minValue!944 () V!42465)

(declare-fun getCurrentListMapNoExtraKeys!4305 (array!72897 array!72899 (_ BitVec 32) (_ BitVec 32) V!42465 V!42465 (_ BitVec 32) Int) ListLongMap!15599)

(assert (=> b!1118349 (= lt!497476 (getCurrentListMapNoExtraKeys!4305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118350 () Bool)

(declare-fun res!746919 () Bool)

(assert (=> b!1118350 (=> (not res!746919) (not e!637003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118350 (= res!746919 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43822 () Bool)

(declare-fun mapRes!43822 () Bool)

(assert (=> mapIsEmpty!43822 mapRes!43822))

(declare-fun res!746927 () Bool)

(assert (=> start!97772 (=> (not res!746927) (not e!637003))))

(assert (=> start!97772 (= res!746927 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35637 _keys!1208))))))

(assert (=> start!97772 e!637003))

(declare-fun tp_is_empty!28003 () Bool)

(assert (=> start!97772 tp_is_empty!28003))

(declare-fun array_inv!26968 (array!72897) Bool)

(assert (=> start!97772 (array_inv!26968 _keys!1208)))

(assert (=> start!97772 true))

(assert (=> start!97772 tp!83122))

(declare-fun e!637005 () Bool)

(declare-fun array_inv!26969 (array!72899) Bool)

(assert (=> start!97772 (and (array_inv!26969 _values!996) e!637005)))

(declare-fun b!1118351 () Bool)

(declare-fun res!746928 () Bool)

(assert (=> b!1118351 (=> (not res!746928) (not e!637003))))

(assert (=> b!1118351 (= res!746928 (and (= (size!35638 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35637 _keys!1208) (size!35638 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118352 () Bool)

(declare-fun e!637008 () Bool)

(assert (=> b!1118352 (= e!637003 e!637008)))

(declare-fun res!746929 () Bool)

(assert (=> b!1118352 (=> (not res!746929) (not e!637008))))

(declare-fun lt!497475 () array!72897)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72897 (_ BitVec 32)) Bool)

(assert (=> b!1118352 (= res!746929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497475 mask!1564))))

(assert (=> b!1118352 (= lt!497475 (array!72898 (store (arr!35101 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35637 _keys!1208)))))

(declare-fun b!1118353 () Bool)

(declare-fun res!746921 () Bool)

(assert (=> b!1118353 (=> (not res!746921) (not e!637003))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118353 (= res!746921 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43822 () Bool)

(declare-fun tp!83123 () Bool)

(declare-fun e!637002 () Bool)

(assert (=> mapNonEmpty!43822 (= mapRes!43822 (and tp!83123 e!637002))))

(declare-fun mapKey!43822 () (_ BitVec 32))

(declare-fun mapValue!43822 () ValueCell!13292)

(declare-fun mapRest!43822 () (Array (_ BitVec 32) ValueCell!13292))

(assert (=> mapNonEmpty!43822 (= (arr!35102 _values!996) (store mapRest!43822 mapKey!43822 mapValue!43822))))

(declare-fun b!1118354 () Bool)

(declare-fun res!746925 () Bool)

(assert (=> b!1118354 (=> (not res!746925) (not e!637003))))

(declare-datatypes ((List!24417 0))(
  ( (Nil!24414) (Cons!24413 (h!25622 (_ BitVec 64)) (t!34898 List!24417)) )
))
(declare-fun arrayNoDuplicates!0 (array!72897 (_ BitVec 32) List!24417) Bool)

(assert (=> b!1118354 (= res!746925 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24414))))

(declare-fun b!1118355 () Bool)

(assert (=> b!1118355 (= e!637008 (not e!637007))))

(declare-fun res!746924 () Bool)

(assert (=> b!1118355 (=> res!746924 e!637007)))

(assert (=> b!1118355 (= res!746924 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118355 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36704 0))(
  ( (Unit!36705) )
))
(declare-fun lt!497477 () Unit!36704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72897 (_ BitVec 64) (_ BitVec 32)) Unit!36704)

(assert (=> b!1118355 (= lt!497477 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118356 () Bool)

(declare-fun e!637004 () Bool)

(assert (=> b!1118356 (= e!637004 tp_is_empty!28003)))

(declare-fun b!1118357 () Bool)

(assert (=> b!1118357 (= e!637002 tp_is_empty!28003)))

(declare-fun b!1118358 () Bool)

(assert (=> b!1118358 (= e!637005 (and e!637004 mapRes!43822))))

(declare-fun condMapEmpty!43822 () Bool)

(declare-fun mapDefault!43822 () ValueCell!13292)

