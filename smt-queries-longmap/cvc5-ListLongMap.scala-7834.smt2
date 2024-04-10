; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97748 () Bool)

(assert start!97748)

(declare-fun b_free!23449 () Bool)

(declare-fun b_next!23449 () Bool)

(assert (=> start!97748 (= b_free!23449 (not b_next!23449))))

(declare-fun tp!83050 () Bool)

(declare-fun b_and!37723 () Bool)

(assert (=> start!97748 (= tp!83050 b_and!37723)))

(declare-fun b!1117844 () Bool)

(declare-fun res!746525 () Bool)

(declare-fun e!636751 () Bool)

(assert (=> b!1117844 (=> (not res!746525) (not e!636751))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117844 (= res!746525 (validMask!0 mask!1564))))

(declare-fun res!746529 () Bool)

(assert (=> start!97748 (=> (not res!746529) (not e!636751))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72849 0))(
  ( (array!72850 (arr!35077 (Array (_ BitVec 32) (_ BitVec 64))) (size!35613 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72849)

(assert (=> start!97748 (= res!746529 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35613 _keys!1208))))))

(assert (=> start!97748 e!636751))

(declare-fun tp_is_empty!27979 () Bool)

(assert (=> start!97748 tp_is_empty!27979))

(declare-fun array_inv!26950 (array!72849) Bool)

(assert (=> start!97748 (array_inv!26950 _keys!1208)))

(assert (=> start!97748 true))

(assert (=> start!97748 tp!83050))

(declare-datatypes ((V!42433 0))(
  ( (V!42434 (val!14046 Int)) )
))
(declare-datatypes ((ValueCell!13280 0))(
  ( (ValueCellFull!13280 (v!16679 V!42433)) (EmptyCell!13280) )
))
(declare-datatypes ((array!72851 0))(
  ( (array!72852 (arr!35078 (Array (_ BitVec 32) ValueCell!13280)) (size!35614 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72851)

(declare-fun e!636755 () Bool)

(declare-fun array_inv!26951 (array!72851) Bool)

(assert (=> start!97748 (and (array_inv!26951 _values!996) e!636755)))

(declare-fun b!1117845 () Bool)

(declare-fun e!636750 () Bool)

(assert (=> b!1117845 (= e!636750 tp_is_empty!27979)))

(declare-fun mapIsEmpty!43786 () Bool)

(declare-fun mapRes!43786 () Bool)

(assert (=> mapIsEmpty!43786 mapRes!43786))

(declare-fun b!1117846 () Bool)

(declare-fun e!636752 () Bool)

(assert (=> b!1117846 (= e!636752 tp_is_empty!27979)))

(declare-fun b!1117847 () Bool)

(declare-fun e!636753 () Bool)

(declare-fun e!636754 () Bool)

(assert (=> b!1117847 (= e!636753 (not e!636754))))

(declare-fun res!746526 () Bool)

(assert (=> b!1117847 (=> res!746526 e!636754)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117847 (= res!746526 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117847 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36686 0))(
  ( (Unit!36687) )
))
(declare-fun lt!497367 () Unit!36686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72849 (_ BitVec 64) (_ BitVec 32)) Unit!36686)

(assert (=> b!1117847 (= lt!497367 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117848 () Bool)

(declare-fun res!746530 () Bool)

(assert (=> b!1117848 (=> (not res!746530) (not e!636751))))

(declare-datatypes ((List!24397 0))(
  ( (Nil!24394) (Cons!24393 (h!25602 (_ BitVec 64)) (t!34878 List!24397)) )
))
(declare-fun arrayNoDuplicates!0 (array!72849 (_ BitVec 32) List!24397) Bool)

(assert (=> b!1117848 (= res!746530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24394))))

(declare-fun b!1117849 () Bool)

(declare-fun res!746528 () Bool)

(assert (=> b!1117849 (=> (not res!746528) (not e!636751))))

(assert (=> b!1117849 (= res!746528 (= (select (arr!35077 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43786 () Bool)

(declare-fun tp!83051 () Bool)

(assert (=> mapNonEmpty!43786 (= mapRes!43786 (and tp!83051 e!636750))))

(declare-fun mapValue!43786 () ValueCell!13280)

(declare-fun mapRest!43786 () (Array (_ BitVec 32) ValueCell!13280))

(declare-fun mapKey!43786 () (_ BitVec 32))

(assert (=> mapNonEmpty!43786 (= (arr!35078 _values!996) (store mapRest!43786 mapKey!43786 mapValue!43786))))

(declare-fun b!1117850 () Bool)

(declare-fun res!746524 () Bool)

(assert (=> b!1117850 (=> (not res!746524) (not e!636751))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117850 (= res!746524 (and (= (size!35614 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35613 _keys!1208) (size!35614 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117851 () Bool)

(declare-fun res!746533 () Bool)

(assert (=> b!1117851 (=> (not res!746533) (not e!636751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72849 (_ BitVec 32)) Bool)

(assert (=> b!1117851 (= res!746533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117852 () Bool)

(declare-fun res!746532 () Bool)

(assert (=> b!1117852 (=> (not res!746532) (not e!636751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117852 (= res!746532 (validKeyInArray!0 k!934))))

(declare-fun b!1117853 () Bool)

(declare-fun res!746531 () Bool)

(assert (=> b!1117853 (=> (not res!746531) (not e!636751))))

(assert (=> b!1117853 (= res!746531 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35613 _keys!1208))))))

(declare-fun b!1117854 () Bool)

(assert (=> b!1117854 (= e!636751 e!636753)))

(declare-fun res!746527 () Bool)

(assert (=> b!1117854 (=> (not res!746527) (not e!636753))))

(declare-fun lt!497369 () array!72849)

(assert (=> b!1117854 (= res!746527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497369 mask!1564))))

(assert (=> b!1117854 (= lt!497369 (array!72850 (store (arr!35077 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35613 _keys!1208)))))

(declare-fun b!1117855 () Bool)

(assert (=> b!1117855 (= e!636754 true)))

(declare-fun zeroValue!944 () V!42433)

(declare-datatypes ((tuple2!17610 0))(
  ( (tuple2!17611 (_1!8816 (_ BitVec 64)) (_2!8816 V!42433)) )
))
(declare-datatypes ((List!24398 0))(
  ( (Nil!24395) (Cons!24394 (h!25603 tuple2!17610) (t!34879 List!24398)) )
))
(declare-datatypes ((ListLongMap!15579 0))(
  ( (ListLongMap!15580 (toList!7805 List!24398)) )
))
(declare-fun lt!497368 () ListLongMap!15579)

(declare-fun minValue!944 () V!42433)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4295 (array!72849 array!72851 (_ BitVec 32) (_ BitVec 32) V!42433 V!42433 (_ BitVec 32) Int) ListLongMap!15579)

(assert (=> b!1117855 (= lt!497368 (getCurrentListMapNoExtraKeys!4295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117856 () Bool)

(declare-fun res!746523 () Bool)

(assert (=> b!1117856 (=> (not res!746523) (not e!636753))))

(assert (=> b!1117856 (= res!746523 (arrayNoDuplicates!0 lt!497369 #b00000000000000000000000000000000 Nil!24394))))

(declare-fun b!1117857 () Bool)

(assert (=> b!1117857 (= e!636755 (and e!636752 mapRes!43786))))

(declare-fun condMapEmpty!43786 () Bool)

(declare-fun mapDefault!43786 () ValueCell!13280)

