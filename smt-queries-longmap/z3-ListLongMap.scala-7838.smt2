; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98008 () Bool)

(assert start!98008)

(declare-fun b_free!23473 () Bool)

(declare-fun b_next!23473 () Bool)

(assert (=> start!98008 (= b_free!23473 (not b_next!23473))))

(declare-fun tp!83122 () Bool)

(declare-fun b_and!37757 () Bool)

(assert (=> start!98008 (= tp!83122 b_and!37757)))

(declare-fun b!1119675 () Bool)

(declare-fun res!747449 () Bool)

(declare-fun e!637859 () Bool)

(assert (=> b!1119675 (=> (not res!747449) (not e!637859))))

(declare-datatypes ((array!72943 0))(
  ( (array!72944 (arr!35118 (Array (_ BitVec 32) (_ BitVec 64))) (size!35655 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72943)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72943 (_ BitVec 32)) Bool)

(assert (=> b!1119675 (= res!747449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119676 () Bool)

(declare-fun res!747446 () Bool)

(assert (=> b!1119676 (=> (not res!747446) (not e!637859))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119676 (= res!747446 (= (select (arr!35118 _keys!1208) i!673) k0!934))))

(declare-fun b!1119677 () Bool)

(declare-fun e!637860 () Bool)

(declare-fun tp_is_empty!28003 () Bool)

(assert (=> b!1119677 (= e!637860 tp_is_empty!28003)))

(declare-fun b!1119678 () Bool)

(declare-fun res!747441 () Bool)

(assert (=> b!1119678 (=> (not res!747441) (not e!637859))))

(assert (=> b!1119678 (= res!747441 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35655 _keys!1208))))))

(declare-fun b!1119679 () Bool)

(declare-fun res!747444 () Bool)

(assert (=> b!1119679 (=> (not res!747444) (not e!637859))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42465 0))(
  ( (V!42466 (val!14058 Int)) )
))
(declare-datatypes ((ValueCell!13292 0))(
  ( (ValueCellFull!13292 (v!16687 V!42465)) (EmptyCell!13292) )
))
(declare-datatypes ((array!72945 0))(
  ( (array!72946 (arr!35119 (Array (_ BitVec 32) ValueCell!13292)) (size!35656 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72945)

(assert (=> b!1119679 (= res!747444 (and (= (size!35656 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35655 _keys!1208) (size!35656 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119680 () Bool)

(declare-fun e!637858 () Bool)

(assert (=> b!1119680 (= e!637858 tp_is_empty!28003)))

(declare-fun res!747450 () Bool)

(assert (=> start!98008 (=> (not res!747450) (not e!637859))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98008 (= res!747450 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35655 _keys!1208))))))

(assert (=> start!98008 e!637859))

(assert (=> start!98008 tp_is_empty!28003))

(declare-fun array_inv!27046 (array!72943) Bool)

(assert (=> start!98008 (array_inv!27046 _keys!1208)))

(assert (=> start!98008 true))

(assert (=> start!98008 tp!83122))

(declare-fun e!637857 () Bool)

(declare-fun array_inv!27047 (array!72945) Bool)

(assert (=> start!98008 (and (array_inv!27047 _values!996) e!637857)))

(declare-fun b!1119681 () Bool)

(declare-fun e!637861 () Bool)

(assert (=> b!1119681 (= e!637859 e!637861)))

(declare-fun res!747448 () Bool)

(assert (=> b!1119681 (=> (not res!747448) (not e!637861))))

(declare-fun lt!497991 () array!72943)

(assert (=> b!1119681 (= res!747448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497991 mask!1564))))

(assert (=> b!1119681 (= lt!497991 (array!72944 (store (arr!35118 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35655 _keys!1208)))))

(declare-fun b!1119682 () Bool)

(declare-fun mapRes!43822 () Bool)

(assert (=> b!1119682 (= e!637857 (and e!637858 mapRes!43822))))

(declare-fun condMapEmpty!43822 () Bool)

(declare-fun mapDefault!43822 () ValueCell!13292)

(assert (=> b!1119682 (= condMapEmpty!43822 (= (arr!35119 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13292)) mapDefault!43822)))))

(declare-fun mapIsEmpty!43822 () Bool)

(assert (=> mapIsEmpty!43822 mapRes!43822))

(declare-fun b!1119683 () Bool)

(declare-fun e!637863 () Bool)

(assert (=> b!1119683 (= e!637863 true)))

(declare-fun zeroValue!944 () V!42465)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42465)

(declare-datatypes ((tuple2!17650 0))(
  ( (tuple2!17651 (_1!8836 (_ BitVec 64)) (_2!8836 V!42465)) )
))
(declare-datatypes ((List!24439 0))(
  ( (Nil!24436) (Cons!24435 (h!25653 tuple2!17650) (t!34912 List!24439)) )
))
(declare-datatypes ((ListLongMap!15627 0))(
  ( (ListLongMap!15628 (toList!7829 List!24439)) )
))
(declare-fun lt!497992 () ListLongMap!15627)

(declare-fun getCurrentListMapNoExtraKeys!4359 (array!72943 array!72945 (_ BitVec 32) (_ BitVec 32) V!42465 V!42465 (_ BitVec 32) Int) ListLongMap!15627)

(assert (=> b!1119683 (= lt!497992 (getCurrentListMapNoExtraKeys!4359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119684 () Bool)

(declare-fun res!747447 () Bool)

(assert (=> b!1119684 (=> (not res!747447) (not e!637859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119684 (= res!747447 (validMask!0 mask!1564))))

(declare-fun b!1119685 () Bool)

(declare-fun res!747443 () Bool)

(assert (=> b!1119685 (=> (not res!747443) (not e!637859))))

(declare-datatypes ((List!24440 0))(
  ( (Nil!24437) (Cons!24436 (h!25654 (_ BitVec 64)) (t!34913 List!24440)) )
))
(declare-fun arrayNoDuplicates!0 (array!72943 (_ BitVec 32) List!24440) Bool)

(assert (=> b!1119685 (= res!747443 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24437))))

(declare-fun mapNonEmpty!43822 () Bool)

(declare-fun tp!83123 () Bool)

(assert (=> mapNonEmpty!43822 (= mapRes!43822 (and tp!83123 e!637860))))

(declare-fun mapKey!43822 () (_ BitVec 32))

(declare-fun mapRest!43822 () (Array (_ BitVec 32) ValueCell!13292))

(declare-fun mapValue!43822 () ValueCell!13292)

(assert (=> mapNonEmpty!43822 (= (arr!35119 _values!996) (store mapRest!43822 mapKey!43822 mapValue!43822))))

(declare-fun b!1119686 () Bool)

(declare-fun res!747442 () Bool)

(assert (=> b!1119686 (=> (not res!747442) (not e!637859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119686 (= res!747442 (validKeyInArray!0 k0!934))))

(declare-fun b!1119687 () Bool)

(declare-fun res!747445 () Bool)

(assert (=> b!1119687 (=> (not res!747445) (not e!637861))))

(assert (=> b!1119687 (= res!747445 (arrayNoDuplicates!0 lt!497991 #b00000000000000000000000000000000 Nil!24437))))

(declare-fun b!1119688 () Bool)

(assert (=> b!1119688 (= e!637861 (not e!637863))))

(declare-fun res!747451 () Bool)

(assert (=> b!1119688 (=> res!747451 e!637863)))

(assert (=> b!1119688 (= res!747451 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119688 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36687 0))(
  ( (Unit!36688) )
))
(declare-fun lt!497990 () Unit!36687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72943 (_ BitVec 64) (_ BitVec 32)) Unit!36687)

(assert (=> b!1119688 (= lt!497990 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98008 res!747450) b!1119684))

(assert (= (and b!1119684 res!747447) b!1119679))

(assert (= (and b!1119679 res!747444) b!1119675))

(assert (= (and b!1119675 res!747449) b!1119685))

(assert (= (and b!1119685 res!747443) b!1119678))

(assert (= (and b!1119678 res!747441) b!1119686))

(assert (= (and b!1119686 res!747442) b!1119676))

(assert (= (and b!1119676 res!747446) b!1119681))

(assert (= (and b!1119681 res!747448) b!1119687))

(assert (= (and b!1119687 res!747445) b!1119688))

(assert (= (and b!1119688 (not res!747451)) b!1119683))

(assert (= (and b!1119682 condMapEmpty!43822) mapIsEmpty!43822))

(assert (= (and b!1119682 (not condMapEmpty!43822)) mapNonEmpty!43822))

(get-info :version)

(assert (= (and mapNonEmpty!43822 ((_ is ValueCellFull!13292) mapValue!43822)) b!1119677))

(assert (= (and b!1119682 ((_ is ValueCellFull!13292) mapDefault!43822)) b!1119680))

(assert (= start!98008 b!1119682))

(declare-fun m!1035591 () Bool)

(assert (=> b!1119688 m!1035591))

(declare-fun m!1035593 () Bool)

(assert (=> b!1119688 m!1035593))

(declare-fun m!1035595 () Bool)

(assert (=> start!98008 m!1035595))

(declare-fun m!1035597 () Bool)

(assert (=> start!98008 m!1035597))

(declare-fun m!1035599 () Bool)

(assert (=> b!1119687 m!1035599))

(declare-fun m!1035601 () Bool)

(assert (=> mapNonEmpty!43822 m!1035601))

(declare-fun m!1035603 () Bool)

(assert (=> b!1119681 m!1035603))

(declare-fun m!1035605 () Bool)

(assert (=> b!1119681 m!1035605))

(declare-fun m!1035607 () Bool)

(assert (=> b!1119683 m!1035607))

(declare-fun m!1035609 () Bool)

(assert (=> b!1119686 m!1035609))

(declare-fun m!1035611 () Bool)

(assert (=> b!1119684 m!1035611))

(declare-fun m!1035613 () Bool)

(assert (=> b!1119685 m!1035613))

(declare-fun m!1035615 () Bool)

(assert (=> b!1119676 m!1035615))

(declare-fun m!1035617 () Bool)

(assert (=> b!1119675 m!1035617))

(check-sat tp_is_empty!28003 (not b!1119688) (not b!1119686) (not mapNonEmpty!43822) (not b!1119683) (not b!1119681) (not b!1119685) (not b!1119684) (not b!1119687) (not b!1119675) b_and!37757 (not b_next!23473) (not start!98008))
(check-sat b_and!37757 (not b_next!23473))
