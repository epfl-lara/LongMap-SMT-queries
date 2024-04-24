; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112772 () Bool)

(assert start!112772)

(declare-fun b_free!30943 () Bool)

(declare-fun b_next!30943 () Bool)

(assert (=> start!112772 (= b_free!30943 (not b_next!30943))))

(declare-fun tp!108465 () Bool)

(declare-fun b_and!49853 () Bool)

(assert (=> start!112772 (= tp!108465 b_and!49853)))

(declare-fun mapIsEmpty!56953 () Bool)

(declare-fun mapRes!56953 () Bool)

(assert (=> mapIsEmpty!56953 mapRes!56953))

(declare-fun b!1336329 () Bool)

(declare-fun e!761197 () Bool)

(declare-fun tp_is_empty!36853 () Bool)

(assert (=> b!1336329 (= e!761197 tp_is_empty!36853)))

(declare-fun b!1336330 () Bool)

(declare-fun e!761199 () Bool)

(assert (=> b!1336330 (= e!761199 (and e!761197 mapRes!56953))))

(declare-fun condMapEmpty!56953 () Bool)

(declare-datatypes ((V!54241 0))(
  ( (V!54242 (val!18501 Int)) )
))
(declare-datatypes ((ValueCell!17528 0))(
  ( (ValueCellFull!17528 (v!21133 V!54241)) (EmptyCell!17528) )
))
(declare-datatypes ((array!90677 0))(
  ( (array!90678 (arr!43800 (Array (_ BitVec 32) ValueCell!17528)) (size!44351 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90677)

(declare-fun mapDefault!56953 () ValueCell!17528)

(assert (=> b!1336330 (= condMapEmpty!56953 (= (arr!43800 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17528)) mapDefault!56953)))))

(declare-fun b!1336331 () Bool)

(declare-fun e!761198 () Bool)

(assert (=> b!1336331 (= e!761198 tp_is_empty!36853)))

(declare-fun b!1336332 () Bool)

(declare-fun res!886548 () Bool)

(declare-fun e!761200 () Bool)

(assert (=> b!1336332 (=> (not res!886548) (not e!761200))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90679 0))(
  ( (array!90680 (arr!43801 (Array (_ BitVec 32) (_ BitVec 64))) (size!44352 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90679)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336332 (= res!886548 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44352 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336333 () Bool)

(assert (=> b!1336333 (= e!761200 false)))

(declare-fun lt!592896 () Bool)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54241)

(declare-fun zeroValue!1262 () V!54241)

(declare-datatypes ((tuple2!23882 0))(
  ( (tuple2!23883 (_1!11952 (_ BitVec 64)) (_2!11952 V!54241)) )
))
(declare-datatypes ((List!31029 0))(
  ( (Nil!31026) (Cons!31025 (h!32243 tuple2!23882) (t!45285 List!31029)) )
))
(declare-datatypes ((ListLongMap!21547 0))(
  ( (ListLongMap!21548 (toList!10789 List!31029)) )
))
(declare-fun contains!8965 (ListLongMap!21547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5748 (array!90679 array!90677 (_ BitVec 32) (_ BitVec 32) V!54241 V!54241 (_ BitVec 32) Int) ListLongMap!21547)

(assert (=> b!1336333 (= lt!592896 (contains!8965 (getCurrentListMap!5748 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336334 () Bool)

(declare-fun res!886546 () Bool)

(assert (=> b!1336334 (=> (not res!886546) (not e!761200))))

(assert (=> b!1336334 (= res!886546 (and (= (size!44351 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44352 _keys!1590) (size!44351 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336335 () Bool)

(declare-fun res!886547 () Bool)

(assert (=> b!1336335 (=> (not res!886547) (not e!761200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90679 (_ BitVec 32)) Bool)

(assert (=> b!1336335 (= res!886547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336336 () Bool)

(declare-fun res!886550 () Bool)

(assert (=> b!1336336 (=> (not res!886550) (not e!761200))))

(declare-datatypes ((List!31030 0))(
  ( (Nil!31027) (Cons!31026 (h!32244 (_ BitVec 64)) (t!45286 List!31030)) )
))
(declare-fun arrayNoDuplicates!0 (array!90679 (_ BitVec 32) List!31030) Bool)

(assert (=> b!1336336 (= res!886550 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31027))))

(declare-fun res!886549 () Bool)

(assert (=> start!112772 (=> (not res!886549) (not e!761200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112772 (= res!886549 (validMask!0 mask!1998))))

(assert (=> start!112772 e!761200))

(declare-fun array_inv!33297 (array!90677) Bool)

(assert (=> start!112772 (and (array_inv!33297 _values!1320) e!761199)))

(assert (=> start!112772 true))

(declare-fun array_inv!33298 (array!90679) Bool)

(assert (=> start!112772 (array_inv!33298 _keys!1590)))

(assert (=> start!112772 tp!108465))

(assert (=> start!112772 tp_is_empty!36853))

(declare-fun mapNonEmpty!56953 () Bool)

(declare-fun tp!108466 () Bool)

(assert (=> mapNonEmpty!56953 (= mapRes!56953 (and tp!108466 e!761198))))

(declare-fun mapValue!56953 () ValueCell!17528)

(declare-fun mapKey!56953 () (_ BitVec 32))

(declare-fun mapRest!56953 () (Array (_ BitVec 32) ValueCell!17528))

(assert (=> mapNonEmpty!56953 (= (arr!43800 _values!1320) (store mapRest!56953 mapKey!56953 mapValue!56953))))

(assert (= (and start!112772 res!886549) b!1336334))

(assert (= (and b!1336334 res!886546) b!1336335))

(assert (= (and b!1336335 res!886547) b!1336336))

(assert (= (and b!1336336 res!886550) b!1336332))

(assert (= (and b!1336332 res!886548) b!1336333))

(assert (= (and b!1336330 condMapEmpty!56953) mapIsEmpty!56953))

(assert (= (and b!1336330 (not condMapEmpty!56953)) mapNonEmpty!56953))

(get-info :version)

(assert (= (and mapNonEmpty!56953 ((_ is ValueCellFull!17528) mapValue!56953)) b!1336331))

(assert (= (and b!1336330 ((_ is ValueCellFull!17528) mapDefault!56953)) b!1336329))

(assert (= start!112772 b!1336330))

(declare-fun m!1224833 () Bool)

(assert (=> b!1336336 m!1224833))

(declare-fun m!1224835 () Bool)

(assert (=> mapNonEmpty!56953 m!1224835))

(declare-fun m!1224837 () Bool)

(assert (=> b!1336333 m!1224837))

(assert (=> b!1336333 m!1224837))

(declare-fun m!1224839 () Bool)

(assert (=> b!1336333 m!1224839))

(declare-fun m!1224841 () Bool)

(assert (=> start!112772 m!1224841))

(declare-fun m!1224843 () Bool)

(assert (=> start!112772 m!1224843))

(declare-fun m!1224845 () Bool)

(assert (=> start!112772 m!1224845))

(declare-fun m!1224847 () Bool)

(assert (=> b!1336335 m!1224847))

(check-sat tp_is_empty!36853 (not b!1336333) b_and!49853 (not mapNonEmpty!56953) (not start!112772) (not b_next!30943) (not b!1336335) (not b!1336336))
(check-sat b_and!49853 (not b_next!30943))
