; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78780 () Bool)

(assert start!78780)

(declare-fun b_free!17011 () Bool)

(declare-fun b_next!17011 () Bool)

(assert (=> start!78780 (= b_free!17011 (not b_next!17011))))

(declare-fun tp!59475 () Bool)

(declare-fun b_and!27733 () Bool)

(assert (=> start!78780 (= tp!59475 b_and!27733)))

(declare-fun b!919566 () Bool)

(declare-fun e!516127 () Bool)

(assert (=> b!919566 (= e!516127 (not true))))

(declare-datatypes ((array!54999 0))(
  ( (array!55000 (arr!26445 (Array (_ BitVec 32) (_ BitVec 64))) (size!26906 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54999)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18590 0))(
  ( (Nil!18587) (Cons!18586 (h!19732 (_ BitVec 64)) (t!26322 List!18590)) )
))
(declare-fun arrayNoDuplicates!0 (array!54999 (_ BitVec 32) List!18590) Bool)

(assert (=> b!919566 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18587)))

(declare-datatypes ((Unit!30966 0))(
  ( (Unit!30967) )
))
(declare-fun lt!412660 () Unit!30966)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54999 (_ BitVec 32) (_ BitVec 32)) Unit!30966)

(assert (=> b!919566 (= lt!412660 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!30991 0))(
  ( (V!30992 (val!9810 Int)) )
))
(declare-datatypes ((tuple2!12806 0))(
  ( (tuple2!12807 (_1!6414 (_ BitVec 64)) (_2!6414 V!30991)) )
))
(declare-datatypes ((List!18591 0))(
  ( (Nil!18588) (Cons!18587 (h!19733 tuple2!12806) (t!26323 List!18591)) )
))
(declare-datatypes ((ListLongMap!11493 0))(
  ( (ListLongMap!11494 (toList!5762 List!18591)) )
))
(declare-fun lt!412655 () ListLongMap!11493)

(declare-fun lt!412658 () tuple2!12806)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4761 (ListLongMap!11493 (_ BitVec 64)) Bool)

(declare-fun +!2677 (ListLongMap!11493 tuple2!12806) ListLongMap!11493)

(assert (=> b!919566 (contains!4761 (+!2677 lt!412655 lt!412658) k0!1099)))

(declare-fun lt!412657 () Unit!30966)

(declare-fun lt!412656 () V!30991)

(declare-fun lt!412659 () (_ BitVec 64))

(declare-fun addStillContains!374 (ListLongMap!11493 (_ BitVec 64) V!30991 (_ BitVec 64)) Unit!30966)

(assert (=> b!919566 (= lt!412657 (addStillContains!374 lt!412655 lt!412659 lt!412656 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9278 0))(
  ( (ValueCellFull!9278 (v!12327 V!30991)) (EmptyCell!9278) )
))
(declare-datatypes ((array!55001 0))(
  ( (array!55002 (arr!26446 (Array (_ BitVec 32) ValueCell!9278)) (size!26907 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55001)

(declare-fun zeroValue!1173 () V!30991)

(declare-fun minValue!1173 () V!30991)

(declare-fun getCurrentListMap!2953 (array!54999 array!55001 (_ BitVec 32) (_ BitVec 32) V!30991 V!30991 (_ BitVec 32) Int) ListLongMap!11493)

(assert (=> b!919566 (= (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2677 (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412658))))

(assert (=> b!919566 (= lt!412658 (tuple2!12807 lt!412659 lt!412656))))

(declare-fun get!13876 (ValueCell!9278 V!30991) V!30991)

(declare-fun dynLambda!1433 (Int (_ BitVec 64)) V!30991)

(assert (=> b!919566 (= lt!412656 (get!13876 (select (arr!26446 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1433 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412661 () Unit!30966)

(declare-fun lemmaListMapRecursiveValidKeyArray!41 (array!54999 array!55001 (_ BitVec 32) (_ BitVec 32) V!30991 V!30991 (_ BitVec 32) Int) Unit!30966)

(assert (=> b!919566 (= lt!412661 (lemmaListMapRecursiveValidKeyArray!41 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919567 () Bool)

(declare-fun e!516129 () Bool)

(declare-fun tp_is_empty!19519 () Bool)

(assert (=> b!919567 (= e!516129 tp_is_empty!19519)))

(declare-fun b!919568 () Bool)

(declare-fun e!516130 () Bool)

(assert (=> b!919568 (= e!516130 e!516127)))

(declare-fun res!620125 () Bool)

(assert (=> b!919568 (=> (not res!620125) (not e!516127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919568 (= res!620125 (validKeyInArray!0 lt!412659))))

(assert (=> b!919568 (= lt!412659 (select (arr!26445 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919569 () Bool)

(declare-fun res!620126 () Bool)

(declare-fun e!516126 () Bool)

(assert (=> b!919569 (=> (not res!620126) (not e!516126))))

(assert (=> b!919569 (= res!620126 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18587))))

(declare-fun mapNonEmpty!31035 () Bool)

(declare-fun mapRes!31035 () Bool)

(declare-fun tp!59474 () Bool)

(assert (=> mapNonEmpty!31035 (= mapRes!31035 (and tp!59474 e!516129))))

(declare-fun mapKey!31035 () (_ BitVec 32))

(declare-fun mapRest!31035 () (Array (_ BitVec 32) ValueCell!9278))

(declare-fun mapValue!31035 () ValueCell!9278)

(assert (=> mapNonEmpty!31035 (= (arr!26446 _values!1231) (store mapRest!31035 mapKey!31035 mapValue!31035))))

(declare-fun res!620120 () Bool)

(assert (=> start!78780 (=> (not res!620120) (not e!516126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78780 (= res!620120 (validMask!0 mask!1881))))

(assert (=> start!78780 e!516126))

(assert (=> start!78780 true))

(assert (=> start!78780 tp_is_empty!19519))

(declare-fun e!516128 () Bool)

(declare-fun array_inv!20692 (array!55001) Bool)

(assert (=> start!78780 (and (array_inv!20692 _values!1231) e!516128)))

(assert (=> start!78780 tp!59475))

(declare-fun array_inv!20693 (array!54999) Bool)

(assert (=> start!78780 (array_inv!20693 _keys!1487)))

(declare-fun b!919570 () Bool)

(declare-fun e!516131 () Bool)

(assert (=> b!919570 (= e!516131 tp_is_empty!19519)))

(declare-fun b!919571 () Bool)

(declare-fun res!620129 () Bool)

(assert (=> b!919571 (=> (not res!620129) (not e!516126))))

(assert (=> b!919571 (= res!620129 (and (= (size!26907 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26906 _keys!1487) (size!26907 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919572 () Bool)

(assert (=> b!919572 (= e!516128 (and e!516131 mapRes!31035))))

(declare-fun condMapEmpty!31035 () Bool)

(declare-fun mapDefault!31035 () ValueCell!9278)

(assert (=> b!919572 (= condMapEmpty!31035 (= (arr!26446 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9278)) mapDefault!31035)))))

(declare-fun b!919573 () Bool)

(declare-fun res!620122 () Bool)

(assert (=> b!919573 (=> (not res!620122) (not e!516126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54999 (_ BitVec 32)) Bool)

(assert (=> b!919573 (= res!620122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919574 () Bool)

(declare-fun res!620124 () Bool)

(assert (=> b!919574 (=> (not res!620124) (not e!516130))))

(declare-fun v!791 () V!30991)

(declare-fun apply!588 (ListLongMap!11493 (_ BitVec 64)) V!30991)

(assert (=> b!919574 (= res!620124 (= (apply!588 lt!412655 k0!1099) v!791))))

(declare-fun b!919575 () Bool)

(declare-fun res!620128 () Bool)

(assert (=> b!919575 (=> (not res!620128) (not e!516126))))

(assert (=> b!919575 (= res!620128 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26906 _keys!1487))))))

(declare-fun b!919576 () Bool)

(declare-fun res!620123 () Bool)

(assert (=> b!919576 (=> (not res!620123) (not e!516130))))

(assert (=> b!919576 (= res!620123 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919577 () Bool)

(assert (=> b!919577 (= e!516126 e!516130)))

(declare-fun res!620127 () Bool)

(assert (=> b!919577 (=> (not res!620127) (not e!516130))))

(assert (=> b!919577 (= res!620127 (contains!4761 lt!412655 k0!1099))))

(assert (=> b!919577 (= lt!412655 (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919578 () Bool)

(declare-fun res!620121 () Bool)

(assert (=> b!919578 (=> (not res!620121) (not e!516130))))

(assert (=> b!919578 (= res!620121 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31035 () Bool)

(assert (=> mapIsEmpty!31035 mapRes!31035))

(assert (= (and start!78780 res!620120) b!919571))

(assert (= (and b!919571 res!620129) b!919573))

(assert (= (and b!919573 res!620122) b!919569))

(assert (= (and b!919569 res!620126) b!919575))

(assert (= (and b!919575 res!620128) b!919577))

(assert (= (and b!919577 res!620127) b!919574))

(assert (= (and b!919574 res!620124) b!919576))

(assert (= (and b!919576 res!620123) b!919578))

(assert (= (and b!919578 res!620121) b!919568))

(assert (= (and b!919568 res!620125) b!919566))

(assert (= (and b!919572 condMapEmpty!31035) mapIsEmpty!31035))

(assert (= (and b!919572 (not condMapEmpty!31035)) mapNonEmpty!31035))

(get-info :version)

(assert (= (and mapNonEmpty!31035 ((_ is ValueCellFull!9278) mapValue!31035)) b!919567))

(assert (= (and b!919572 ((_ is ValueCellFull!9278) mapDefault!31035)) b!919570))

(assert (= start!78780 b!919572))

(declare-fun b_lambda!13495 () Bool)

(assert (=> (not b_lambda!13495) (not b!919566)))

(declare-fun t!26321 () Bool)

(declare-fun tb!5583 () Bool)

(assert (=> (and start!78780 (= defaultEntry!1235 defaultEntry!1235) t!26321) tb!5583))

(declare-fun result!10997 () Bool)

(assert (=> tb!5583 (= result!10997 tp_is_empty!19519)))

(assert (=> b!919566 t!26321))

(declare-fun b_and!27735 () Bool)

(assert (= b_and!27733 (and (=> t!26321 result!10997) b_and!27735)))

(declare-fun m!852889 () Bool)

(assert (=> b!919578 m!852889))

(declare-fun m!852891 () Bool)

(assert (=> b!919568 m!852891))

(declare-fun m!852893 () Bool)

(assert (=> b!919568 m!852893))

(declare-fun m!852895 () Bool)

(assert (=> b!919574 m!852895))

(declare-fun m!852897 () Bool)

(assert (=> b!919566 m!852897))

(declare-fun m!852899 () Bool)

(assert (=> b!919566 m!852899))

(declare-fun m!852901 () Bool)

(assert (=> b!919566 m!852901))

(declare-fun m!852903 () Bool)

(assert (=> b!919566 m!852903))

(assert (=> b!919566 m!852901))

(declare-fun m!852905 () Bool)

(assert (=> b!919566 m!852905))

(declare-fun m!852907 () Bool)

(assert (=> b!919566 m!852907))

(declare-fun m!852909 () Bool)

(assert (=> b!919566 m!852909))

(declare-fun m!852911 () Bool)

(assert (=> b!919566 m!852911))

(declare-fun m!852913 () Bool)

(assert (=> b!919566 m!852913))

(declare-fun m!852915 () Bool)

(assert (=> b!919566 m!852915))

(declare-fun m!852917 () Bool)

(assert (=> b!919566 m!852917))

(assert (=> b!919566 m!852911))

(assert (=> b!919566 m!852905))

(assert (=> b!919566 m!852897))

(declare-fun m!852919 () Bool)

(assert (=> b!919566 m!852919))

(declare-fun m!852921 () Bool)

(assert (=> b!919569 m!852921))

(declare-fun m!852923 () Bool)

(assert (=> b!919577 m!852923))

(declare-fun m!852925 () Bool)

(assert (=> b!919577 m!852925))

(declare-fun m!852927 () Bool)

(assert (=> start!78780 m!852927))

(declare-fun m!852929 () Bool)

(assert (=> start!78780 m!852929))

(declare-fun m!852931 () Bool)

(assert (=> start!78780 m!852931))

(declare-fun m!852933 () Bool)

(assert (=> mapNonEmpty!31035 m!852933))

(declare-fun m!852935 () Bool)

(assert (=> b!919573 m!852935))

(check-sat (not b_next!17011) (not b!919578) tp_is_empty!19519 (not b_lambda!13495) (not b!919574) (not start!78780) (not b!919573) b_and!27735 (not b!919577) (not b!919568) (not b!919566) (not b!919569) (not mapNonEmpty!31035))
(check-sat b_and!27735 (not b_next!17011))
