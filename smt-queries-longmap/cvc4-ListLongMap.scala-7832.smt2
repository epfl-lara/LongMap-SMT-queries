; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97740 () Bool)

(assert start!97740)

(declare-fun b_free!23441 () Bool)

(declare-fun b_next!23441 () Bool)

(assert (=> start!97740 (= b_free!23441 (not b_next!23441))))

(declare-fun tp!83027 () Bool)

(declare-fun b_and!37715 () Bool)

(assert (=> start!97740 (= tp!83027 b_and!37715)))

(declare-fun b!1117676 () Bool)

(declare-fun e!636672 () Bool)

(declare-fun tp_is_empty!27971 () Bool)

(assert (=> b!1117676 (= e!636672 tp_is_empty!27971)))

(declare-fun b!1117677 () Bool)

(declare-fun e!636666 () Bool)

(assert (=> b!1117677 (= e!636666 tp_is_empty!27971)))

(declare-fun b!1117678 () Bool)

(declare-fun res!746393 () Bool)

(declare-fun e!636668 () Bool)

(assert (=> b!1117678 (=> (not res!746393) (not e!636668))))

(declare-datatypes ((array!72833 0))(
  ( (array!72834 (arr!35069 (Array (_ BitVec 32) (_ BitVec 64))) (size!35605 (_ BitVec 32))) )
))
(declare-fun lt!497333 () array!72833)

(declare-datatypes ((List!24392 0))(
  ( (Nil!24389) (Cons!24388 (h!25597 (_ BitVec 64)) (t!34873 List!24392)) )
))
(declare-fun arrayNoDuplicates!0 (array!72833 (_ BitVec 32) List!24392) Bool)

(assert (=> b!1117678 (= res!746393 (arrayNoDuplicates!0 lt!497333 #b00000000000000000000000000000000 Nil!24389))))

(declare-fun b!1117679 () Bool)

(declare-fun e!636669 () Bool)

(assert (=> b!1117679 (= e!636669 e!636668)))

(declare-fun res!746397 () Bool)

(assert (=> b!1117679 (=> (not res!746397) (not e!636668))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72833 (_ BitVec 32)) Bool)

(assert (=> b!1117679 (= res!746397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497333 mask!1564))))

(declare-fun _keys!1208 () array!72833)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117679 (= lt!497333 (array!72834 (store (arr!35069 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35605 _keys!1208)))))

(declare-fun b!1117680 () Bool)

(declare-fun res!746401 () Bool)

(assert (=> b!1117680 (=> (not res!746401) (not e!636669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117680 (= res!746401 (validMask!0 mask!1564))))

(declare-fun res!746398 () Bool)

(assert (=> start!97740 (=> (not res!746398) (not e!636669))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97740 (= res!746398 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35605 _keys!1208))))))

(assert (=> start!97740 e!636669))

(assert (=> start!97740 tp_is_empty!27971))

(declare-fun array_inv!26946 (array!72833) Bool)

(assert (=> start!97740 (array_inv!26946 _keys!1208)))

(assert (=> start!97740 true))

(assert (=> start!97740 tp!83027))

(declare-datatypes ((V!42421 0))(
  ( (V!42422 (val!14042 Int)) )
))
(declare-datatypes ((ValueCell!13276 0))(
  ( (ValueCellFull!13276 (v!16675 V!42421)) (EmptyCell!13276) )
))
(declare-datatypes ((array!72835 0))(
  ( (array!72836 (arr!35070 (Array (_ BitVec 32) ValueCell!13276)) (size!35606 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72835)

(declare-fun e!636670 () Bool)

(declare-fun array_inv!26947 (array!72835) Bool)

(assert (=> start!97740 (and (array_inv!26947 _values!996) e!636670)))

(declare-fun b!1117681 () Bool)

(declare-fun res!746399 () Bool)

(assert (=> b!1117681 (=> (not res!746399) (not e!636669))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117681 (= res!746399 (and (= (size!35606 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35605 _keys!1208) (size!35606 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117682 () Bool)

(declare-fun res!746392 () Bool)

(assert (=> b!1117682 (=> (not res!746392) (not e!636669))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1117682 (= res!746392 (= (select (arr!35069 _keys!1208) i!673) k!934))))

(declare-fun b!1117683 () Bool)

(declare-fun res!746400 () Bool)

(assert (=> b!1117683 (=> (not res!746400) (not e!636669))))

(assert (=> b!1117683 (= res!746400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117684 () Bool)

(declare-fun e!636667 () Bool)

(assert (=> b!1117684 (= e!636667 true)))

(declare-fun zeroValue!944 () V!42421)

(declare-datatypes ((tuple2!17606 0))(
  ( (tuple2!17607 (_1!8814 (_ BitVec 64)) (_2!8814 V!42421)) )
))
(declare-datatypes ((List!24393 0))(
  ( (Nil!24390) (Cons!24389 (h!25598 tuple2!17606) (t!34874 List!24393)) )
))
(declare-datatypes ((ListLongMap!15575 0))(
  ( (ListLongMap!15576 (toList!7803 List!24393)) )
))
(declare-fun lt!497331 () ListLongMap!15575)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42421)

(declare-fun getCurrentListMapNoExtraKeys!4293 (array!72833 array!72835 (_ BitVec 32) (_ BitVec 32) V!42421 V!42421 (_ BitVec 32) Int) ListLongMap!15575)

(assert (=> b!1117684 (= lt!497331 (getCurrentListMapNoExtraKeys!4293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43774 () Bool)

(declare-fun mapRes!43774 () Bool)

(declare-fun tp!83026 () Bool)

(assert (=> mapNonEmpty!43774 (= mapRes!43774 (and tp!83026 e!636672))))

(declare-fun mapRest!43774 () (Array (_ BitVec 32) ValueCell!13276))

(declare-fun mapValue!43774 () ValueCell!13276)

(declare-fun mapKey!43774 () (_ BitVec 32))

(assert (=> mapNonEmpty!43774 (= (arr!35070 _values!996) (store mapRest!43774 mapKey!43774 mapValue!43774))))

(declare-fun b!1117685 () Bool)

(assert (=> b!1117685 (= e!636668 (not e!636667))))

(declare-fun res!746396 () Bool)

(assert (=> b!1117685 (=> res!746396 e!636667)))

(assert (=> b!1117685 (= res!746396 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117685 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36678 0))(
  ( (Unit!36679) )
))
(declare-fun lt!497332 () Unit!36678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72833 (_ BitVec 64) (_ BitVec 32)) Unit!36678)

(assert (=> b!1117685 (= lt!497332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43774 () Bool)

(assert (=> mapIsEmpty!43774 mapRes!43774))

(declare-fun b!1117686 () Bool)

(assert (=> b!1117686 (= e!636670 (and e!636666 mapRes!43774))))

(declare-fun condMapEmpty!43774 () Bool)

(declare-fun mapDefault!43774 () ValueCell!13276)

