; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113150 () Bool)

(assert start!113150)

(declare-fun b_free!31201 () Bool)

(declare-fun b_next!31201 () Bool)

(assert (=> start!113150 (= b_free!31201 (not b_next!31201))))

(declare-fun tp!109409 () Bool)

(declare-fun b_and!50291 () Bool)

(assert (=> start!113150 (= tp!109409 b_and!50291)))

(declare-fun b!1341644 () Bool)

(declare-fun e!763951 () Bool)

(declare-fun e!763953 () Bool)

(declare-fun mapRes!57508 () Bool)

(assert (=> b!1341644 (= e!763951 (and e!763953 mapRes!57508))))

(declare-fun condMapEmpty!57508 () Bool)

(declare-datatypes ((V!54705 0))(
  ( (V!54706 (val!18675 Int)) )
))
(declare-datatypes ((ValueCell!17702 0))(
  ( (ValueCellFull!17702 (v!21322 V!54705)) (EmptyCell!17702) )
))
(declare-datatypes ((array!91195 0))(
  ( (array!91196 (arr!44054 (Array (_ BitVec 32) ValueCell!17702)) (size!44606 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91195)

(declare-fun mapDefault!57508 () ValueCell!17702)

(assert (=> b!1341644 (= condMapEmpty!57508 (= (arr!44054 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17702)) mapDefault!57508)))))

(declare-fun b!1341645 () Bool)

(declare-fun res!890086 () Bool)

(declare-fun e!763955 () Bool)

(assert (=> b!1341645 (=> (not res!890086) (not e!763955))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91197 0))(
  ( (array!91198 (arr!44055 (Array (_ BitVec 32) (_ BitVec 64))) (size!44607 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91197)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341645 (= res!890086 (and (= (size!44606 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44607 _keys!1571) (size!44606 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341646 () Bool)

(declare-fun res!890089 () Bool)

(assert (=> b!1341646 (=> (not res!890089) (not e!763955))))

(assert (=> b!1341646 (= res!890089 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341647 () Bool)

(declare-fun res!890082 () Bool)

(assert (=> b!1341647 (=> (not res!890082) (not e!763955))))

(declare-datatypes ((List!31251 0))(
  ( (Nil!31248) (Cons!31247 (h!32456 (_ BitVec 64)) (t!45655 List!31251)) )
))
(declare-fun arrayNoDuplicates!0 (array!91197 (_ BitVec 32) List!31251) Bool)

(assert (=> b!1341647 (= res!890082 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31248))))

(declare-fun b!1341648 () Bool)

(declare-fun res!890088 () Bool)

(assert (=> b!1341648 (=> (not res!890088) (not e!763955))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341648 (= res!890088 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44607 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341649 () Bool)

(declare-fun res!890085 () Bool)

(assert (=> b!1341649 (=> (not res!890085) (not e!763955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91197 (_ BitVec 32)) Bool)

(assert (=> b!1341649 (= res!890085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341650 () Bool)

(declare-fun res!890087 () Bool)

(assert (=> b!1341650 (=> (not res!890087) (not e!763955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341650 (= res!890087 (validKeyInArray!0 (select (arr!44055 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57508 () Bool)

(declare-fun tp!109408 () Bool)

(declare-fun e!763952 () Bool)

(assert (=> mapNonEmpty!57508 (= mapRes!57508 (and tp!109408 e!763952))))

(declare-fun mapRest!57508 () (Array (_ BitVec 32) ValueCell!17702))

(declare-fun mapValue!57508 () ValueCell!17702)

(declare-fun mapKey!57508 () (_ BitVec 32))

(assert (=> mapNonEmpty!57508 (= (arr!44054 _values!1303) (store mapRest!57508 mapKey!57508 mapValue!57508))))

(declare-fun b!1341651 () Bool)

(assert (=> b!1341651 (= e!763955 (not true))))

(declare-datatypes ((tuple2!24102 0))(
  ( (tuple2!24103 (_1!12062 (_ BitVec 64)) (_2!12062 V!54705)) )
))
(declare-datatypes ((List!31252 0))(
  ( (Nil!31249) (Cons!31248 (h!32457 tuple2!24102) (t!45656 List!31252)) )
))
(declare-datatypes ((ListLongMap!21759 0))(
  ( (ListLongMap!21760 (toList!10895 List!31252)) )
))
(declare-fun lt!594012 () ListLongMap!21759)

(declare-fun contains!9000 (ListLongMap!21759 (_ BitVec 64)) Bool)

(assert (=> b!1341651 (contains!9000 lt!594012 k0!1142)))

(declare-datatypes ((Unit!43840 0))(
  ( (Unit!43841) )
))
(declare-fun lt!594008 () Unit!43840)

(declare-fun lt!594010 () V!54705)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!338 ((_ BitVec 64) (_ BitVec 64) V!54705 ListLongMap!21759) Unit!43840)

(assert (=> b!1341651 (= lt!594008 (lemmaInListMapAfterAddingDiffThenInBefore!338 k0!1142 (select (arr!44055 _keys!1571) from!1960) lt!594010 lt!594012))))

(declare-fun lt!594009 () ListLongMap!21759)

(assert (=> b!1341651 (contains!9000 lt!594009 k0!1142)))

(declare-fun zeroValue!1245 () V!54705)

(declare-fun lt!594011 () Unit!43840)

(assert (=> b!1341651 (= lt!594011 (lemmaInListMapAfterAddingDiffThenInBefore!338 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594009))))

(declare-fun +!4799 (ListLongMap!21759 tuple2!24102) ListLongMap!21759)

(assert (=> b!1341651 (= lt!594009 (+!4799 lt!594012 (tuple2!24103 (select (arr!44055 _keys!1571) from!1960) lt!594010)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22239 (ValueCell!17702 V!54705) V!54705)

(declare-fun dynLambda!3729 (Int (_ BitVec 64)) V!54705)

(assert (=> b!1341651 (= lt!594010 (get!22239 (select (arr!44054 _values!1303) from!1960) (dynLambda!3729 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54705)

(declare-fun getCurrentListMapNoExtraKeys!6442 (array!91197 array!91195 (_ BitVec 32) (_ BitVec 32) V!54705 V!54705 (_ BitVec 32) Int) ListLongMap!21759)

(assert (=> b!1341651 (= lt!594012 (getCurrentListMapNoExtraKeys!6442 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun res!890084 () Bool)

(assert (=> start!113150 (=> (not res!890084) (not e!763955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113150 (= res!890084 (validMask!0 mask!1977))))

(assert (=> start!113150 e!763955))

(declare-fun tp_is_empty!37201 () Bool)

(assert (=> start!113150 tp_is_empty!37201))

(assert (=> start!113150 true))

(declare-fun array_inv!33399 (array!91197) Bool)

(assert (=> start!113150 (array_inv!33399 _keys!1571)))

(declare-fun array_inv!33400 (array!91195) Bool)

(assert (=> start!113150 (and (array_inv!33400 _values!1303) e!763951)))

(assert (=> start!113150 tp!109409))

(declare-fun b!1341643 () Bool)

(declare-fun res!890083 () Bool)

(assert (=> b!1341643 (=> (not res!890083) (not e!763955))))

(declare-fun getCurrentListMap!5747 (array!91197 array!91195 (_ BitVec 32) (_ BitVec 32) V!54705 V!54705 (_ BitVec 32) Int) ListLongMap!21759)

(assert (=> b!1341643 (= res!890083 (contains!9000 (getCurrentListMap!5747 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57508 () Bool)

(assert (=> mapIsEmpty!57508 mapRes!57508))

(declare-fun b!1341652 () Bool)

(declare-fun res!890081 () Bool)

(assert (=> b!1341652 (=> (not res!890081) (not e!763955))))

(assert (=> b!1341652 (= res!890081 (not (= (select (arr!44055 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341653 () Bool)

(assert (=> b!1341653 (= e!763953 tp_is_empty!37201)))

(declare-fun b!1341654 () Bool)

(assert (=> b!1341654 (= e!763952 tp_is_empty!37201)))

(assert (= (and start!113150 res!890084) b!1341645))

(assert (= (and b!1341645 res!890086) b!1341649))

(assert (= (and b!1341649 res!890085) b!1341647))

(assert (= (and b!1341647 res!890082) b!1341648))

(assert (= (and b!1341648 res!890088) b!1341643))

(assert (= (and b!1341643 res!890083) b!1341652))

(assert (= (and b!1341652 res!890081) b!1341650))

(assert (= (and b!1341650 res!890087) b!1341646))

(assert (= (and b!1341646 res!890089) b!1341651))

(assert (= (and b!1341644 condMapEmpty!57508) mapIsEmpty!57508))

(assert (= (and b!1341644 (not condMapEmpty!57508)) mapNonEmpty!57508))

(get-info :version)

(assert (= (and mapNonEmpty!57508 ((_ is ValueCellFull!17702) mapValue!57508)) b!1341654))

(assert (= (and b!1341644 ((_ is ValueCellFull!17702) mapDefault!57508)) b!1341653))

(assert (= start!113150 b!1341644))

(declare-fun b_lambda!24367 () Bool)

(assert (=> (not b_lambda!24367) (not b!1341651)))

(declare-fun t!45654 () Bool)

(declare-fun tb!12207 () Bool)

(assert (=> (and start!113150 (= defaultEntry!1306 defaultEntry!1306) t!45654) tb!12207))

(declare-fun result!25513 () Bool)

(assert (=> tb!12207 (= result!25513 tp_is_empty!37201)))

(assert (=> b!1341651 t!45654))

(declare-fun b_and!50293 () Bool)

(assert (= b_and!50291 (and (=> t!45654 result!25513) b_and!50293)))

(declare-fun m!1228819 () Bool)

(assert (=> b!1341651 m!1228819))

(declare-fun m!1228821 () Bool)

(assert (=> b!1341651 m!1228821))

(declare-fun m!1228823 () Bool)

(assert (=> b!1341651 m!1228823))

(declare-fun m!1228825 () Bool)

(assert (=> b!1341651 m!1228825))

(declare-fun m!1228827 () Bool)

(assert (=> b!1341651 m!1228827))

(assert (=> b!1341651 m!1228821))

(declare-fun m!1228829 () Bool)

(assert (=> b!1341651 m!1228829))

(declare-fun m!1228831 () Bool)

(assert (=> b!1341651 m!1228831))

(assert (=> b!1341651 m!1228823))

(declare-fun m!1228833 () Bool)

(assert (=> b!1341651 m!1228833))

(declare-fun m!1228835 () Bool)

(assert (=> b!1341651 m!1228835))

(declare-fun m!1228837 () Bool)

(assert (=> b!1341651 m!1228837))

(assert (=> b!1341651 m!1228833))

(assert (=> b!1341650 m!1228833))

(assert (=> b!1341650 m!1228833))

(declare-fun m!1228839 () Bool)

(assert (=> b!1341650 m!1228839))

(assert (=> b!1341652 m!1228833))

(declare-fun m!1228841 () Bool)

(assert (=> b!1341643 m!1228841))

(assert (=> b!1341643 m!1228841))

(declare-fun m!1228843 () Bool)

(assert (=> b!1341643 m!1228843))

(declare-fun m!1228845 () Bool)

(assert (=> b!1341649 m!1228845))

(declare-fun m!1228847 () Bool)

(assert (=> b!1341647 m!1228847))

(declare-fun m!1228849 () Bool)

(assert (=> mapNonEmpty!57508 m!1228849))

(declare-fun m!1228851 () Bool)

(assert (=> start!113150 m!1228851))

(declare-fun m!1228853 () Bool)

(assert (=> start!113150 m!1228853))

(declare-fun m!1228855 () Bool)

(assert (=> start!113150 m!1228855))

(check-sat (not start!113150) b_and!50293 (not b!1341647) (not b!1341651) (not b_next!31201) (not mapNonEmpty!57508) (not b!1341650) (not b!1341649) (not b!1341643) (not b_lambda!24367) tp_is_empty!37201)
(check-sat b_and!50293 (not b_next!31201))
