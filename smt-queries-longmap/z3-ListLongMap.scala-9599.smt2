; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113456 () Bool)

(assert start!113456)

(declare-fun b_free!31507 () Bool)

(declare-fun b_next!31507 () Bool)

(assert (=> start!113456 (= b_free!31507 (not b_next!31507))))

(declare-fun tp!110326 () Bool)

(declare-fun b_and!50777 () Bool)

(assert (=> start!113456 (= tp!110326 b_and!50777)))

(declare-fun b!1346827 () Bool)

(declare-fun res!893714 () Bool)

(declare-fun e!766328 () Bool)

(assert (=> b!1346827 (=> (not res!893714) (not e!766328))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91793 0))(
  ( (array!91794 (arr!44353 (Array (_ BitVec 32) (_ BitVec 64))) (size!44905 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91793)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55113 0))(
  ( (V!55114 (val!18828 Int)) )
))
(declare-datatypes ((ValueCell!17855 0))(
  ( (ValueCellFull!17855 (v!21475 V!55113)) (EmptyCell!17855) )
))
(declare-datatypes ((array!91795 0))(
  ( (array!91796 (arr!44354 (Array (_ BitVec 32) ValueCell!17855)) (size!44906 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91795)

(assert (=> b!1346827 (= res!893714 (and (= (size!44906 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44905 _keys!1571) (size!44906 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346828 () Bool)

(declare-fun res!893716 () Bool)

(assert (=> b!1346828 (=> (not res!893716) (not e!766328))))

(declare-fun minValue!1245 () V!55113)

(declare-fun zeroValue!1245 () V!55113)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24342 0))(
  ( (tuple2!24343 (_1!12182 (_ BitVec 64)) (_2!12182 V!55113)) )
))
(declare-datatypes ((List!31477 0))(
  ( (Nil!31474) (Cons!31473 (h!32682 tuple2!24342) (t!46059 List!31477)) )
))
(declare-datatypes ((ListLongMap!21999 0))(
  ( (ListLongMap!22000 (toList!11015 List!31477)) )
))
(declare-fun contains!9118 (ListLongMap!21999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5852 (array!91793 array!91795 (_ BitVec 32) (_ BitVec 32) V!55113 V!55113 (_ BitVec 32) Int) ListLongMap!21999)

(assert (=> b!1346828 (= res!893716 (contains!9118 (getCurrentListMap!5852 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346829 () Bool)

(declare-fun res!893715 () Bool)

(assert (=> b!1346829 (=> (not res!893715) (not e!766328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346829 (= res!893715 (validKeyInArray!0 (select (arr!44353 _keys!1571) from!1960)))))

(declare-fun b!1346830 () Bool)

(declare-fun res!893711 () Bool)

(assert (=> b!1346830 (=> (not res!893711) (not e!766328))))

(assert (=> b!1346830 (= res!893711 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57967 () Bool)

(declare-fun mapRes!57967 () Bool)

(declare-fun tp!110327 () Bool)

(declare-fun e!766331 () Bool)

(assert (=> mapNonEmpty!57967 (= mapRes!57967 (and tp!110327 e!766331))))

(declare-fun mapValue!57967 () ValueCell!17855)

(declare-fun mapKey!57967 () (_ BitVec 32))

(declare-fun mapRest!57967 () (Array (_ BitVec 32) ValueCell!17855))

(assert (=> mapNonEmpty!57967 (= (arr!44354 _values!1303) (store mapRest!57967 mapKey!57967 mapValue!57967))))

(declare-fun b!1346831 () Bool)

(declare-fun tp_is_empty!37507 () Bool)

(assert (=> b!1346831 (= e!766331 tp_is_empty!37507)))

(declare-fun b!1346832 () Bool)

(declare-fun e!766327 () Bool)

(assert (=> b!1346832 (= e!766327 tp_is_empty!37507)))

(declare-fun b!1346834 () Bool)

(declare-fun res!893713 () Bool)

(assert (=> b!1346834 (=> (not res!893713) (not e!766328))))

(assert (=> b!1346834 (= res!893713 (not (= (select (arr!44353 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346835 () Bool)

(declare-fun e!766330 () Bool)

(assert (=> b!1346835 (= e!766330 (and e!766327 mapRes!57967))))

(declare-fun condMapEmpty!57967 () Bool)

(declare-fun mapDefault!57967 () ValueCell!17855)

(assert (=> b!1346835 (= condMapEmpty!57967 (= (arr!44354 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17855)) mapDefault!57967)))))

(declare-fun b!1346836 () Bool)

(declare-fun res!893712 () Bool)

(assert (=> b!1346836 (=> (not res!893712) (not e!766328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91793 (_ BitVec 32)) Bool)

(assert (=> b!1346836 (= res!893712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346837 () Bool)

(declare-fun res!893710 () Bool)

(assert (=> b!1346837 (=> (not res!893710) (not e!766328))))

(declare-datatypes ((List!31478 0))(
  ( (Nil!31475) (Cons!31474 (h!32683 (_ BitVec 64)) (t!46060 List!31478)) )
))
(declare-fun arrayNoDuplicates!0 (array!91793 (_ BitVec 32) List!31478) Bool)

(assert (=> b!1346837 (= res!893710 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31475))))

(declare-fun b!1346833 () Bool)

(assert (=> b!1346833 (= e!766328 (bvsge from!1960 (size!44906 _values!1303)))))

(declare-fun lt!595368 () ListLongMap!21999)

(declare-fun getCurrentListMapNoExtraKeys!6511 (array!91793 array!91795 (_ BitVec 32) (_ BitVec 32) V!55113 V!55113 (_ BitVec 32) Int) ListLongMap!21999)

(assert (=> b!1346833 (= lt!595368 (getCurrentListMapNoExtraKeys!6511 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun res!893708 () Bool)

(assert (=> start!113456 (=> (not res!893708) (not e!766328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113456 (= res!893708 (validMask!0 mask!1977))))

(assert (=> start!113456 e!766328))

(assert (=> start!113456 tp_is_empty!37507))

(assert (=> start!113456 true))

(declare-fun array_inv!33613 (array!91793) Bool)

(assert (=> start!113456 (array_inv!33613 _keys!1571)))

(declare-fun array_inv!33614 (array!91795) Bool)

(assert (=> start!113456 (and (array_inv!33614 _values!1303) e!766330)))

(assert (=> start!113456 tp!110326))

(declare-fun mapIsEmpty!57967 () Bool)

(assert (=> mapIsEmpty!57967 mapRes!57967))

(declare-fun b!1346838 () Bool)

(declare-fun res!893709 () Bool)

(assert (=> b!1346838 (=> (not res!893709) (not e!766328))))

(assert (=> b!1346838 (= res!893709 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44905 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113456 res!893708) b!1346827))

(assert (= (and b!1346827 res!893714) b!1346836))

(assert (= (and b!1346836 res!893712) b!1346837))

(assert (= (and b!1346837 res!893710) b!1346838))

(assert (= (and b!1346838 res!893709) b!1346828))

(assert (= (and b!1346828 res!893716) b!1346834))

(assert (= (and b!1346834 res!893713) b!1346829))

(assert (= (and b!1346829 res!893715) b!1346830))

(assert (= (and b!1346830 res!893711) b!1346833))

(assert (= (and b!1346835 condMapEmpty!57967) mapIsEmpty!57967))

(assert (= (and b!1346835 (not condMapEmpty!57967)) mapNonEmpty!57967))

(get-info :version)

(assert (= (and mapNonEmpty!57967 ((_ is ValueCellFull!17855) mapValue!57967)) b!1346831))

(assert (= (and b!1346835 ((_ is ValueCellFull!17855) mapDefault!57967)) b!1346832))

(assert (= start!113456 b!1346835))

(declare-fun m!1233361 () Bool)

(assert (=> start!113456 m!1233361))

(declare-fun m!1233363 () Bool)

(assert (=> start!113456 m!1233363))

(declare-fun m!1233365 () Bool)

(assert (=> start!113456 m!1233365))

(declare-fun m!1233367 () Bool)

(assert (=> b!1346828 m!1233367))

(assert (=> b!1346828 m!1233367))

(declare-fun m!1233369 () Bool)

(assert (=> b!1346828 m!1233369))

(declare-fun m!1233371 () Bool)

(assert (=> b!1346837 m!1233371))

(declare-fun m!1233373 () Bool)

(assert (=> b!1346834 m!1233373))

(declare-fun m!1233375 () Bool)

(assert (=> b!1346833 m!1233375))

(declare-fun m!1233377 () Bool)

(assert (=> b!1346836 m!1233377))

(assert (=> b!1346829 m!1233373))

(assert (=> b!1346829 m!1233373))

(declare-fun m!1233379 () Bool)

(assert (=> b!1346829 m!1233379))

(declare-fun m!1233381 () Bool)

(assert (=> mapNonEmpty!57967 m!1233381))

(check-sat (not b!1346829) (not b!1346828) (not b!1346836) (not b_next!31507) (not b!1346837) (not start!113456) tp_is_empty!37507 b_and!50777 (not b!1346833) (not mapNonEmpty!57967))
(check-sat b_and!50777 (not b_next!31507))
