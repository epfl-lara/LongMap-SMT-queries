; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134114 () Bool)

(assert start!134114)

(declare-fun b_free!32065 () Bool)

(declare-fun b_next!32065 () Bool)

(assert (=> start!134114 (= b_free!32065 (not b_next!32065))))

(declare-fun tp!113400 () Bool)

(declare-fun b_and!51637 () Bool)

(assert (=> start!134114 (= tp!113400 b_and!51637)))

(declare-fun b!1565682 () Bool)

(declare-fun e!872748 () Bool)

(declare-fun tp_is_empty!38785 () Bool)

(assert (=> b!1565682 (= e!872748 tp_is_empty!38785)))

(declare-fun b!1565683 () Bool)

(declare-fun res!1069573 () Bool)

(declare-fun e!872747 () Bool)

(assert (=> b!1565683 (=> (not res!1069573) (not e!872747))))

(declare-datatypes ((array!104392 0))(
  ( (array!104393 (arr!50381 (Array (_ BitVec 32) (_ BitVec 64))) (size!50932 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104392)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104392 (_ BitVec 32)) Bool)

(assert (=> b!1565683 (= res!1069573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565684 () Bool)

(declare-fun res!1069574 () Bool)

(assert (=> b!1565684 (=> (not res!1069574) (not e!872747))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59921 0))(
  ( (V!59922 (val!19476 Int)) )
))
(declare-datatypes ((ValueCell!18362 0))(
  ( (ValueCellFull!18362 (v!22220 V!59921)) (EmptyCell!18362) )
))
(declare-datatypes ((array!104394 0))(
  ( (array!104395 (arr!50382 (Array (_ BitVec 32) ValueCell!18362)) (size!50933 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104394)

(assert (=> b!1565684 (= res!1069574 (and (= (size!50933 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50932 _keys!637) (size!50933 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565681 () Bool)

(declare-fun e!872745 () Bool)

(assert (=> b!1565681 (= e!872747 e!872745)))

(declare-fun res!1069571 () Bool)

(assert (=> b!1565681 (=> (not res!1069571) (not e!872745))))

(declare-datatypes ((tuple2!25186 0))(
  ( (tuple2!25187 (_1!12604 (_ BitVec 64)) (_2!12604 V!59921)) )
))
(declare-datatypes ((List!36550 0))(
  ( (Nil!36547) (Cons!36546 (h!38010 tuple2!25186) (t!51389 List!36550)) )
))
(declare-datatypes ((ListLongMap!22629 0))(
  ( (ListLongMap!22630 (toList!11330 List!36550)) )
))
(declare-fun lt!672757 () ListLongMap!22629)

(declare-fun contains!10331 (ListLongMap!22629 (_ BitVec 64)) Bool)

(assert (=> b!1565681 (= res!1069571 (not (contains!10331 lt!672757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59921)

(declare-fun minValue!453 () V!59921)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6728 (array!104392 array!104394 (_ BitVec 32) (_ BitVec 32) V!59921 V!59921 (_ BitVec 32) Int) ListLongMap!22629)

(assert (=> b!1565681 (= lt!672757 (getCurrentListMapNoExtraKeys!6728 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1069569 () Bool)

(assert (=> start!134114 (=> (not res!1069569) (not e!872747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134114 (= res!1069569 (validMask!0 mask!947))))

(assert (=> start!134114 e!872747))

(assert (=> start!134114 tp!113400))

(assert (=> start!134114 tp_is_empty!38785))

(assert (=> start!134114 true))

(declare-fun array_inv!39399 (array!104392) Bool)

(assert (=> start!134114 (array_inv!39399 _keys!637)))

(declare-fun e!872744 () Bool)

(declare-fun array_inv!39400 (array!104394) Bool)

(assert (=> start!134114 (and (array_inv!39400 _values!487) e!872744)))

(declare-fun mapIsEmpty!59553 () Bool)

(declare-fun mapRes!59553 () Bool)

(assert (=> mapIsEmpty!59553 mapRes!59553))

(declare-fun b!1565685 () Bool)

(declare-fun res!1069572 () Bool)

(assert (=> b!1565685 (=> (not res!1069572) (not e!872747))))

(declare-datatypes ((List!36551 0))(
  ( (Nil!36548) (Cons!36547 (h!38011 (_ BitVec 64)) (t!51390 List!36551)) )
))
(declare-fun arrayNoDuplicates!0 (array!104392 (_ BitVec 32) List!36551) Bool)

(assert (=> b!1565685 (= res!1069572 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36548))))

(declare-fun b!1565686 () Bool)

(declare-fun e!872746 () Bool)

(assert (=> b!1565686 (= e!872746 tp_is_empty!38785)))

(declare-fun b!1565687 () Bool)

(assert (=> b!1565687 (= e!872745 false)))

(declare-fun lt!672758 () Bool)

(assert (=> b!1565687 (= lt!672758 (contains!10331 lt!672757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565688 () Bool)

(declare-fun res!1069570 () Bool)

(assert (=> b!1565688 (=> (not res!1069570) (not e!872747))))

(assert (=> b!1565688 (= res!1069570 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50932 _keys!637)) (bvslt from!782 (size!50932 _keys!637))))))

(declare-fun mapNonEmpty!59553 () Bool)

(declare-fun tp!113399 () Bool)

(assert (=> mapNonEmpty!59553 (= mapRes!59553 (and tp!113399 e!872746))))

(declare-fun mapRest!59553 () (Array (_ BitVec 32) ValueCell!18362))

(declare-fun mapKey!59553 () (_ BitVec 32))

(declare-fun mapValue!59553 () ValueCell!18362)

(assert (=> mapNonEmpty!59553 (= (arr!50382 _values!487) (store mapRest!59553 mapKey!59553 mapValue!59553))))

(declare-fun b!1565689 () Bool)

(declare-fun res!1069568 () Bool)

(assert (=> b!1565689 (=> (not res!1069568) (not e!872747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565689 (= res!1069568 (not (validKeyInArray!0 (select (arr!50381 _keys!637) from!782))))))

(declare-fun b!1565690 () Bool)

(assert (=> b!1565690 (= e!872744 (and e!872748 mapRes!59553))))

(declare-fun condMapEmpty!59553 () Bool)

(declare-fun mapDefault!59553 () ValueCell!18362)

(assert (=> b!1565690 (= condMapEmpty!59553 (= (arr!50382 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18362)) mapDefault!59553)))))

(assert (= (and start!134114 res!1069569) b!1565684))

(assert (= (and b!1565684 res!1069574) b!1565683))

(assert (= (and b!1565683 res!1069573) b!1565685))

(assert (= (and b!1565685 res!1069572) b!1565688))

(assert (= (and b!1565688 res!1069570) b!1565689))

(assert (= (and b!1565689 res!1069568) b!1565681))

(assert (= (and b!1565681 res!1069571) b!1565687))

(assert (= (and b!1565690 condMapEmpty!59553) mapIsEmpty!59553))

(assert (= (and b!1565690 (not condMapEmpty!59553)) mapNonEmpty!59553))

(get-info :version)

(assert (= (and mapNonEmpty!59553 ((_ is ValueCellFull!18362) mapValue!59553)) b!1565686))

(assert (= (and b!1565690 ((_ is ValueCellFull!18362) mapDefault!59553)) b!1565682))

(assert (= start!134114 b!1565690))

(declare-fun m!1441077 () Bool)

(assert (=> b!1565681 m!1441077))

(declare-fun m!1441079 () Bool)

(assert (=> b!1565681 m!1441079))

(declare-fun m!1441081 () Bool)

(assert (=> b!1565683 m!1441081))

(declare-fun m!1441083 () Bool)

(assert (=> b!1565685 m!1441083))

(declare-fun m!1441085 () Bool)

(assert (=> b!1565687 m!1441085))

(declare-fun m!1441087 () Bool)

(assert (=> b!1565689 m!1441087))

(assert (=> b!1565689 m!1441087))

(declare-fun m!1441089 () Bool)

(assert (=> b!1565689 m!1441089))

(declare-fun m!1441091 () Bool)

(assert (=> mapNonEmpty!59553 m!1441091))

(declare-fun m!1441093 () Bool)

(assert (=> start!134114 m!1441093))

(declare-fun m!1441095 () Bool)

(assert (=> start!134114 m!1441095))

(declare-fun m!1441097 () Bool)

(assert (=> start!134114 m!1441097))

(check-sat (not b!1565681) (not b!1565687) (not b!1565689) (not b!1565685) (not b!1565683) tp_is_empty!38785 (not start!134114) (not b_next!32065) b_and!51637 (not mapNonEmpty!59553))
(check-sat b_and!51637 (not b_next!32065))
