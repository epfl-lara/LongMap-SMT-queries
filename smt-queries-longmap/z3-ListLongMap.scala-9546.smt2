; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113362 () Bool)

(assert start!113362)

(declare-fun b_free!31189 () Bool)

(declare-fun b_next!31189 () Bool)

(assert (=> start!113362 (= b_free!31189 (not b_next!31189))))

(declare-fun tp!109371 () Bool)

(declare-fun b_and!50287 () Bool)

(assert (=> start!113362 (= tp!109371 b_and!50287)))

(declare-fun b!1342784 () Bool)

(declare-fun res!890474 () Bool)

(declare-fun e!764741 () Bool)

(assert (=> b!1342784 (=> (not res!890474) (not e!764741))))

(declare-datatypes ((array!91349 0))(
  ( (array!91350 (arr!44126 (Array (_ BitVec 32) (_ BitVec 64))) (size!44677 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91349)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54689 0))(
  ( (V!54690 (val!18669 Int)) )
))
(declare-datatypes ((ValueCell!17696 0))(
  ( (ValueCellFull!17696 (v!21312 V!54689)) (EmptyCell!17696) )
))
(declare-datatypes ((array!91351 0))(
  ( (array!91352 (arr!44127 (Array (_ BitVec 32) ValueCell!17696)) (size!44678 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91351)

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1342784 (= res!890474 (and (= (size!44678 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44677 _keys!1571) (size!44678 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890472 () Bool)

(assert (=> start!113362 (=> (not res!890472) (not e!764741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113362 (= res!890472 (validMask!0 mask!1977))))

(assert (=> start!113362 e!764741))

(declare-fun tp_is_empty!37189 () Bool)

(assert (=> start!113362 tp_is_empty!37189))

(assert (=> start!113362 true))

(declare-fun array_inv!33533 (array!91349) Bool)

(assert (=> start!113362 (array_inv!33533 _keys!1571)))

(declare-fun e!764738 () Bool)

(declare-fun array_inv!33534 (array!91351) Bool)

(assert (=> start!113362 (and (array_inv!33534 _values!1303) e!764738)))

(assert (=> start!113362 tp!109371))

(declare-fun b!1342785 () Bool)

(declare-fun res!890473 () Bool)

(assert (=> b!1342785 (=> (not res!890473) (not e!764741))))

(declare-datatypes ((List!31248 0))(
  ( (Nil!31245) (Cons!31244 (h!32462 (_ BitVec 64)) (t!45640 List!31248)) )
))
(declare-fun arrayNoDuplicates!0 (array!91349 (_ BitVec 32) List!31248) Bool)

(assert (=> b!1342785 (= res!890473 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31245))))

(declare-fun b!1342786 () Bool)

(declare-fun res!890471 () Bool)

(assert (=> b!1342786 (=> (not res!890471) (not e!764741))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342786 (= res!890471 (validKeyInArray!0 (select (arr!44126 _keys!1571) from!1960)))))

(declare-fun b!1342787 () Bool)

(declare-fun res!890468 () Bool)

(assert (=> b!1342787 (=> (not res!890468) (not e!764741))))

(declare-fun minValue!1245 () V!54689)

(declare-fun zeroValue!1245 () V!54689)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24094 0))(
  ( (tuple2!24095 (_1!12058 (_ BitVec 64)) (_2!12058 V!54689)) )
))
(declare-datatypes ((List!31249 0))(
  ( (Nil!31246) (Cons!31245 (h!32463 tuple2!24094) (t!45641 List!31249)) )
))
(declare-datatypes ((ListLongMap!21759 0))(
  ( (ListLongMap!21760 (toList!10895 List!31249)) )
))
(declare-fun contains!9083 (ListLongMap!21759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5844 (array!91349 array!91351 (_ BitVec 32) (_ BitVec 32) V!54689 V!54689 (_ BitVec 32) Int) ListLongMap!21759)

(assert (=> b!1342787 (= res!890468 (contains!9083 (getCurrentListMap!5844 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342788 () Bool)

(declare-fun res!890467 () Bool)

(assert (=> b!1342788 (=> (not res!890467) (not e!764741))))

(assert (=> b!1342788 (= res!890467 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57490 () Bool)

(declare-fun mapRes!57490 () Bool)

(assert (=> mapIsEmpty!57490 mapRes!57490))

(declare-fun b!1342789 () Bool)

(declare-fun res!890469 () Bool)

(assert (=> b!1342789 (=> (not res!890469) (not e!764741))))

(assert (=> b!1342789 (= res!890469 (not (= (select (arr!44126 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342790 () Bool)

(declare-fun res!890466 () Bool)

(assert (=> b!1342790 (=> (not res!890466) (not e!764741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91349 (_ BitVec 32)) Bool)

(assert (=> b!1342790 (= res!890466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342791 () Bool)

(declare-fun e!764739 () Bool)

(assert (=> b!1342791 (= e!764739 tp_is_empty!37189)))

(declare-fun b!1342792 () Bool)

(assert (=> b!1342792 (= e!764741 (not true))))

(declare-fun lt!594629 () ListLongMap!21759)

(assert (=> b!1342792 (contains!9083 lt!594629 k0!1142)))

(declare-datatypes ((Unit!43966 0))(
  ( (Unit!43967) )
))
(declare-fun lt!594628 () Unit!43966)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!339 ((_ BitVec 64) (_ BitVec 64) V!54689 ListLongMap!21759) Unit!43966)

(assert (=> b!1342792 (= lt!594628 (lemmaInListMapAfterAddingDiffThenInBefore!339 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594629))))

(declare-fun +!4813 (ListLongMap!21759 tuple2!24094) ListLongMap!21759)

(declare-fun getCurrentListMapNoExtraKeys!6462 (array!91349 array!91351 (_ BitVec 32) (_ BitVec 32) V!54689 V!54689 (_ BitVec 32) Int) ListLongMap!21759)

(declare-fun get!22285 (ValueCell!17696 V!54689) V!54689)

(declare-fun dynLambda!3767 (Int (_ BitVec 64)) V!54689)

(assert (=> b!1342792 (= lt!594629 (+!4813 (getCurrentListMapNoExtraKeys!6462 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24095 (select (arr!44126 _keys!1571) from!1960) (get!22285 (select (arr!44127 _values!1303) from!1960) (dynLambda!3767 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342793 () Bool)

(declare-fun res!890470 () Bool)

(assert (=> b!1342793 (=> (not res!890470) (not e!764741))))

(assert (=> b!1342793 (= res!890470 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44677 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342794 () Bool)

(declare-fun e!764737 () Bool)

(assert (=> b!1342794 (= e!764737 tp_is_empty!37189)))

(declare-fun mapNonEmpty!57490 () Bool)

(declare-fun tp!109372 () Bool)

(assert (=> mapNonEmpty!57490 (= mapRes!57490 (and tp!109372 e!764737))))

(declare-fun mapValue!57490 () ValueCell!17696)

(declare-fun mapKey!57490 () (_ BitVec 32))

(declare-fun mapRest!57490 () (Array (_ BitVec 32) ValueCell!17696))

(assert (=> mapNonEmpty!57490 (= (arr!44127 _values!1303) (store mapRest!57490 mapKey!57490 mapValue!57490))))

(declare-fun b!1342795 () Bool)

(assert (=> b!1342795 (= e!764738 (and e!764739 mapRes!57490))))

(declare-fun condMapEmpty!57490 () Bool)

(declare-fun mapDefault!57490 () ValueCell!17696)

(assert (=> b!1342795 (= condMapEmpty!57490 (= (arr!44127 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17696)) mapDefault!57490)))))

(assert (= (and start!113362 res!890472) b!1342784))

(assert (= (and b!1342784 res!890474) b!1342790))

(assert (= (and b!1342790 res!890466) b!1342785))

(assert (= (and b!1342785 res!890473) b!1342793))

(assert (= (and b!1342793 res!890470) b!1342787))

(assert (= (and b!1342787 res!890468) b!1342789))

(assert (= (and b!1342789 res!890469) b!1342786))

(assert (= (and b!1342786 res!890471) b!1342788))

(assert (= (and b!1342788 res!890467) b!1342792))

(assert (= (and b!1342795 condMapEmpty!57490) mapIsEmpty!57490))

(assert (= (and b!1342795 (not condMapEmpty!57490)) mapNonEmpty!57490))

(get-info :version)

(assert (= (and mapNonEmpty!57490 ((_ is ValueCellFull!17696) mapValue!57490)) b!1342794))

(assert (= (and b!1342795 ((_ is ValueCellFull!17696) mapDefault!57490)) b!1342791))

(assert (= start!113362 b!1342795))

(declare-fun b_lambda!24359 () Bool)

(assert (=> (not b_lambda!24359) (not b!1342792)))

(declare-fun t!45639 () Bool)

(declare-fun tb!12195 () Bool)

(assert (=> (and start!113362 (= defaultEntry!1306 defaultEntry!1306) t!45639) tb!12195))

(declare-fun result!25489 () Bool)

(assert (=> tb!12195 (= result!25489 tp_is_empty!37189)))

(assert (=> b!1342792 t!45639))

(declare-fun b_and!50289 () Bool)

(assert (= b_and!50287 (and (=> t!45639 result!25489) b_and!50289)))

(declare-fun m!1230729 () Bool)

(assert (=> b!1342789 m!1230729))

(declare-fun m!1230731 () Bool)

(assert (=> mapNonEmpty!57490 m!1230731))

(declare-fun m!1230733 () Bool)

(assert (=> b!1342785 m!1230733))

(declare-fun m!1230735 () Bool)

(assert (=> b!1342790 m!1230735))

(assert (=> b!1342786 m!1230729))

(assert (=> b!1342786 m!1230729))

(declare-fun m!1230737 () Bool)

(assert (=> b!1342786 m!1230737))

(declare-fun m!1230739 () Bool)

(assert (=> b!1342792 m!1230739))

(declare-fun m!1230741 () Bool)

(assert (=> b!1342792 m!1230741))

(declare-fun m!1230743 () Bool)

(assert (=> b!1342792 m!1230743))

(declare-fun m!1230745 () Bool)

(assert (=> b!1342792 m!1230745))

(assert (=> b!1342792 m!1230739))

(declare-fun m!1230747 () Bool)

(assert (=> b!1342792 m!1230747))

(assert (=> b!1342792 m!1230741))

(declare-fun m!1230749 () Bool)

(assert (=> b!1342792 m!1230749))

(assert (=> b!1342792 m!1230743))

(declare-fun m!1230751 () Bool)

(assert (=> b!1342792 m!1230751))

(assert (=> b!1342792 m!1230729))

(declare-fun m!1230753 () Bool)

(assert (=> b!1342787 m!1230753))

(assert (=> b!1342787 m!1230753))

(declare-fun m!1230755 () Bool)

(assert (=> b!1342787 m!1230755))

(declare-fun m!1230757 () Bool)

(assert (=> start!113362 m!1230757))

(declare-fun m!1230759 () Bool)

(assert (=> start!113362 m!1230759))

(declare-fun m!1230761 () Bool)

(assert (=> start!113362 m!1230761))

(check-sat (not b!1342787) tp_is_empty!37189 (not b!1342786) (not b!1342785) (not start!113362) (not b!1342790) (not b!1342792) (not b_lambda!24359) b_and!50289 (not mapNonEmpty!57490) (not b_next!31189))
(check-sat b_and!50289 (not b_next!31189))
