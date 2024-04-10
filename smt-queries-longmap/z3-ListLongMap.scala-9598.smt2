; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113452 () Bool)

(assert start!113452)

(declare-fun b_free!31503 () Bool)

(declare-fun b_next!31503 () Bool)

(assert (=> start!113452 (= b_free!31503 (not b_next!31503))))

(declare-fun tp!110314 () Bool)

(declare-fun b_and!50791 () Bool)

(assert (=> start!113452 (= tp!110314 b_and!50791)))

(declare-fun mapIsEmpty!57961 () Bool)

(declare-fun mapRes!57961 () Bool)

(assert (=> mapIsEmpty!57961 mapRes!57961))

(declare-fun b!1346825 () Bool)

(declare-fun res!893686 () Bool)

(declare-fun e!766332 () Bool)

(assert (=> b!1346825 (=> (not res!893686) (not e!766332))))

(declare-datatypes ((V!55107 0))(
  ( (V!55108 (val!18826 Int)) )
))
(declare-fun minValue!1245 () V!55107)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91838 0))(
  ( (array!91839 (arr!44375 (Array (_ BitVec 32) (_ BitVec 64))) (size!44925 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91838)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17853 0))(
  ( (ValueCellFull!17853 (v!21474 V!55107)) (EmptyCell!17853) )
))
(declare-datatypes ((array!91840 0))(
  ( (array!91841 (arr!44376 (Array (_ BitVec 32) ValueCell!17853)) (size!44926 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91840)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun zeroValue!1245 () V!55107)

(declare-datatypes ((tuple2!24266 0))(
  ( (tuple2!24267 (_1!12144 (_ BitVec 64)) (_2!12144 V!55107)) )
))
(declare-datatypes ((List!31421 0))(
  ( (Nil!31418) (Cons!31417 (h!32626 tuple2!24266) (t!46011 List!31421)) )
))
(declare-datatypes ((ListLongMap!21923 0))(
  ( (ListLongMap!21924 (toList!10977 List!31421)) )
))
(declare-fun contains!9153 (ListLongMap!21923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5929 (array!91838 array!91840 (_ BitVec 32) (_ BitVec 32) V!55107 V!55107 (_ BitVec 32) Int) ListLongMap!21923)

(assert (=> b!1346825 (= res!893686 (contains!9153 (getCurrentListMap!5929 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346826 () Bool)

(declare-fun e!766330 () Bool)

(declare-fun tp_is_empty!37503 () Bool)

(assert (=> b!1346826 (= e!766330 tp_is_empty!37503)))

(declare-fun res!893684 () Bool)

(assert (=> start!113452 (=> (not res!893684) (not e!766332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113452 (= res!893684 (validMask!0 mask!1977))))

(assert (=> start!113452 e!766332))

(assert (=> start!113452 tp_is_empty!37503))

(assert (=> start!113452 true))

(declare-fun array_inv!33429 (array!91838) Bool)

(assert (=> start!113452 (array_inv!33429 _keys!1571)))

(declare-fun e!766334 () Bool)

(declare-fun array_inv!33430 (array!91840) Bool)

(assert (=> start!113452 (and (array_inv!33430 _values!1303) e!766334)))

(assert (=> start!113452 tp!110314))

(declare-fun b!1346827 () Bool)

(declare-fun e!766331 () Bool)

(assert (=> b!1346827 (= e!766331 tp_is_empty!37503)))

(declare-fun b!1346828 () Bool)

(declare-fun res!893685 () Bool)

(assert (=> b!1346828 (=> (not res!893685) (not e!766332))))

(assert (=> b!1346828 (= res!893685 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1346829 () Bool)

(declare-fun res!893683 () Bool)

(assert (=> b!1346829 (=> (not res!893683) (not e!766332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91838 (_ BitVec 32)) Bool)

(assert (=> b!1346829 (= res!893683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346830 () Bool)

(declare-fun res!893688 () Bool)

(assert (=> b!1346830 (=> (not res!893688) (not e!766332))))

(declare-datatypes ((List!31422 0))(
  ( (Nil!31419) (Cons!31418 (h!32627 (_ BitVec 64)) (t!46012 List!31422)) )
))
(declare-fun arrayNoDuplicates!0 (array!91838 (_ BitVec 32) List!31422) Bool)

(assert (=> b!1346830 (= res!893688 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31419))))

(declare-fun b!1346831 () Bool)

(declare-fun res!893687 () Bool)

(assert (=> b!1346831 (=> (not res!893687) (not e!766332))))

(assert (=> b!1346831 (= res!893687 (not (= (select (arr!44375 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57961 () Bool)

(declare-fun tp!110313 () Bool)

(assert (=> mapNonEmpty!57961 (= mapRes!57961 (and tp!110313 e!766330))))

(declare-fun mapValue!57961 () ValueCell!17853)

(declare-fun mapKey!57961 () (_ BitVec 32))

(declare-fun mapRest!57961 () (Array (_ BitVec 32) ValueCell!17853))

(assert (=> mapNonEmpty!57961 (= (arr!44376 _values!1303) (store mapRest!57961 mapKey!57961 mapValue!57961))))

(declare-fun b!1346832 () Bool)

(declare-fun res!893690 () Bool)

(assert (=> b!1346832 (=> (not res!893690) (not e!766332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346832 (= res!893690 (validKeyInArray!0 (select (arr!44375 _keys!1571) from!1960)))))

(declare-fun b!1346833 () Bool)

(assert (=> b!1346833 (= e!766332 false)))

(declare-fun lt!595548 () ListLongMap!21923)

(declare-fun getCurrentListMapNoExtraKeys!6479 (array!91838 array!91840 (_ BitVec 32) (_ BitVec 32) V!55107 V!55107 (_ BitVec 32) Int) ListLongMap!21923)

(assert (=> b!1346833 (= lt!595548 (getCurrentListMapNoExtraKeys!6479 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1346834 () Bool)

(declare-fun res!893691 () Bool)

(assert (=> b!1346834 (=> (not res!893691) (not e!766332))))

(assert (=> b!1346834 (= res!893691 (and (= (size!44926 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44925 _keys!1571) (size!44926 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346835 () Bool)

(assert (=> b!1346835 (= e!766334 (and e!766331 mapRes!57961))))

(declare-fun condMapEmpty!57961 () Bool)

(declare-fun mapDefault!57961 () ValueCell!17853)

(assert (=> b!1346835 (= condMapEmpty!57961 (= (arr!44376 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17853)) mapDefault!57961)))))

(declare-fun b!1346836 () Bool)

(declare-fun res!893689 () Bool)

(assert (=> b!1346836 (=> (not res!893689) (not e!766332))))

(assert (=> b!1346836 (= res!893689 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44925 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113452 res!893684) b!1346834))

(assert (= (and b!1346834 res!893691) b!1346829))

(assert (= (and b!1346829 res!893683) b!1346830))

(assert (= (and b!1346830 res!893688) b!1346836))

(assert (= (and b!1346836 res!893689) b!1346825))

(assert (= (and b!1346825 res!893686) b!1346831))

(assert (= (and b!1346831 res!893687) b!1346832))

(assert (= (and b!1346832 res!893690) b!1346828))

(assert (= (and b!1346828 res!893685) b!1346833))

(assert (= (and b!1346835 condMapEmpty!57961) mapIsEmpty!57961))

(assert (= (and b!1346835 (not condMapEmpty!57961)) mapNonEmpty!57961))

(get-info :version)

(assert (= (and mapNonEmpty!57961 ((_ is ValueCellFull!17853) mapValue!57961)) b!1346826))

(assert (= (and b!1346835 ((_ is ValueCellFull!17853) mapDefault!57961)) b!1346827))

(assert (= start!113452 b!1346835))

(declare-fun m!1233833 () Bool)

(assert (=> b!1346830 m!1233833))

(declare-fun m!1233835 () Bool)

(assert (=> b!1346832 m!1233835))

(assert (=> b!1346832 m!1233835))

(declare-fun m!1233837 () Bool)

(assert (=> b!1346832 m!1233837))

(assert (=> b!1346831 m!1233835))

(declare-fun m!1233839 () Bool)

(assert (=> b!1346825 m!1233839))

(assert (=> b!1346825 m!1233839))

(declare-fun m!1233841 () Bool)

(assert (=> b!1346825 m!1233841))

(declare-fun m!1233843 () Bool)

(assert (=> b!1346829 m!1233843))

(declare-fun m!1233845 () Bool)

(assert (=> b!1346833 m!1233845))

(declare-fun m!1233847 () Bool)

(assert (=> start!113452 m!1233847))

(declare-fun m!1233849 () Bool)

(assert (=> start!113452 m!1233849))

(declare-fun m!1233851 () Bool)

(assert (=> start!113452 m!1233851))

(declare-fun m!1233853 () Bool)

(assert (=> mapNonEmpty!57961 m!1233853))

(check-sat (not b!1346832) (not b!1346829) (not start!113452) (not mapNonEmpty!57961) b_and!50791 (not b!1346833) (not b!1346825) (not b_next!31503) tp_is_empty!37503 (not b!1346830))
(check-sat b_and!50791 (not b_next!31503))
