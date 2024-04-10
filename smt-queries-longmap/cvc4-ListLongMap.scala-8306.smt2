; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101188 () Bool)

(assert start!101188)

(declare-fun b_free!26111 () Bool)

(declare-fun b_next!26111 () Bool)

(assert (=> start!101188 (= b_free!26111 (not b_next!26111))))

(declare-fun tp!91355 () Bool)

(declare-fun b_and!43339 () Bool)

(assert (=> start!101188 (= tp!91355 b_and!43339)))

(declare-fun mapIsEmpty!48097 () Bool)

(declare-fun mapRes!48097 () Bool)

(assert (=> mapIsEmpty!48097 mapRes!48097))

(declare-fun b!1214716 () Bool)

(declare-fun e!689800 () Bool)

(assert (=> b!1214716 (= e!689800 true)))

(declare-datatypes ((V!46213 0))(
  ( (V!46214 (val!15464 Int)) )
))
(declare-fun zeroValue!944 () V!46213)

(declare-datatypes ((tuple2!19878 0))(
  ( (tuple2!19879 (_1!9950 (_ BitVec 64)) (_2!9950 V!46213)) )
))
(declare-datatypes ((List!26677 0))(
  ( (Nil!26674) (Cons!26673 (h!27882 tuple2!19878) (t!39768 List!26677)) )
))
(declare-datatypes ((ListLongMap!17847 0))(
  ( (ListLongMap!17848 (toList!8939 List!26677)) )
))
(declare-fun lt!552417 () ListLongMap!17847)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78409 0))(
  ( (array!78410 (arr!37839 (Array (_ BitVec 32) (_ BitVec 64))) (size!38375 (_ BitVec 32))) )
))
(declare-fun lt!552418 () array!78409)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14698 0))(
  ( (ValueCellFull!14698 (v!18117 V!46213)) (EmptyCell!14698) )
))
(declare-datatypes ((array!78411 0))(
  ( (array!78412 (arr!37840 (Array (_ BitVec 32) ValueCell!14698)) (size!38376 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78411)

(declare-fun minValue!944 () V!46213)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5366 (array!78409 array!78411 (_ BitVec 32) (_ BitVec 32) V!46213 V!46213 (_ BitVec 32) Int) ListLongMap!17847)

(declare-fun dynLambda!3255 (Int (_ BitVec 64)) V!46213)

(assert (=> b!1214716 (= lt!552417 (getCurrentListMapNoExtraKeys!5366 lt!552418 (array!78412 (store (arr!37840 _values!996) i!673 (ValueCellFull!14698 (dynLambda!3255 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38376 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!78409)

(declare-fun lt!552420 () ListLongMap!17847)

(assert (=> b!1214716 (= lt!552420 (getCurrentListMapNoExtraKeys!5366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48097 () Bool)

(declare-fun tp!91354 () Bool)

(declare-fun e!689803 () Bool)

(assert (=> mapNonEmpty!48097 (= mapRes!48097 (and tp!91354 e!689803))))

(declare-fun mapValue!48097 () ValueCell!14698)

(declare-fun mapRest!48097 () (Array (_ BitVec 32) ValueCell!14698))

(declare-fun mapKey!48097 () (_ BitVec 32))

(assert (=> mapNonEmpty!48097 (= (arr!37840 _values!996) (store mapRest!48097 mapKey!48097 mapValue!48097))))

(declare-fun b!1214717 () Bool)

(declare-fun res!806462 () Bool)

(declare-fun e!689802 () Bool)

(assert (=> b!1214717 (=> (not res!806462) (not e!689802))))

(assert (=> b!1214717 (= res!806462 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38375 _keys!1208))))))

(declare-fun b!1214718 () Bool)

(declare-fun res!806469 () Bool)

(assert (=> b!1214718 (=> (not res!806469) (not e!689802))))

(declare-datatypes ((List!26678 0))(
  ( (Nil!26675) (Cons!26674 (h!27883 (_ BitVec 64)) (t!39769 List!26678)) )
))
(declare-fun arrayNoDuplicates!0 (array!78409 (_ BitVec 32) List!26678) Bool)

(assert (=> b!1214718 (= res!806469 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26675))))

(declare-fun b!1214719 () Bool)

(declare-fun res!806468 () Bool)

(declare-fun e!689799 () Bool)

(assert (=> b!1214719 (=> (not res!806468) (not e!689799))))

(assert (=> b!1214719 (= res!806468 (arrayNoDuplicates!0 lt!552418 #b00000000000000000000000000000000 Nil!26675))))

(declare-fun res!806471 () Bool)

(assert (=> start!101188 (=> (not res!806471) (not e!689802))))

(assert (=> start!101188 (= res!806471 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38375 _keys!1208))))))

(assert (=> start!101188 e!689802))

(declare-fun tp_is_empty!30815 () Bool)

(assert (=> start!101188 tp_is_empty!30815))

(declare-fun array_inv!28812 (array!78409) Bool)

(assert (=> start!101188 (array_inv!28812 _keys!1208)))

(assert (=> start!101188 true))

(assert (=> start!101188 tp!91355))

(declare-fun e!689798 () Bool)

(declare-fun array_inv!28813 (array!78411) Bool)

(assert (=> start!101188 (and (array_inv!28813 _values!996) e!689798)))

(declare-fun b!1214720 () Bool)

(declare-fun res!806461 () Bool)

(assert (=> b!1214720 (=> (not res!806461) (not e!689802))))

(assert (=> b!1214720 (= res!806461 (and (= (size!38376 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38375 _keys!1208) (size!38376 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214721 () Bool)

(declare-fun e!689801 () Bool)

(assert (=> b!1214721 (= e!689798 (and e!689801 mapRes!48097))))

(declare-fun condMapEmpty!48097 () Bool)

(declare-fun mapDefault!48097 () ValueCell!14698)

