; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112736 () Bool)

(assert start!112736)

(declare-fun b_free!30907 () Bool)

(declare-fun b_next!30907 () Bool)

(assert (=> start!112736 (= b_free!30907 (not b_next!30907))))

(declare-fun tp!108358 () Bool)

(declare-fun b_and!49817 () Bool)

(assert (=> start!112736 (= tp!108358 b_and!49817)))

(declare-fun b!1335897 () Bool)

(declare-fun res!886276 () Bool)

(declare-fun e!760930 () Bool)

(assert (=> b!1335897 (=> (not res!886276) (not e!760930))))

(declare-datatypes ((array!90605 0))(
  ( (array!90606 (arr!43764 (Array (_ BitVec 32) (_ BitVec 64))) (size!44315 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90605)

(declare-datatypes ((List!31006 0))(
  ( (Nil!31003) (Cons!31002 (h!32220 (_ BitVec 64)) (t!45262 List!31006)) )
))
(declare-fun arrayNoDuplicates!0 (array!90605 (_ BitVec 32) List!31006) Bool)

(assert (=> b!1335897 (= res!886276 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31003))))

(declare-fun b!1335898 () Bool)

(declare-fun res!886277 () Bool)

(assert (=> b!1335898 (=> (not res!886277) (not e!760930))))

(declare-datatypes ((V!54193 0))(
  ( (V!54194 (val!18483 Int)) )
))
(declare-datatypes ((ValueCell!17510 0))(
  ( (ValueCellFull!17510 (v!21115 V!54193)) (EmptyCell!17510) )
))
(declare-datatypes ((array!90607 0))(
  ( (array!90608 (arr!43765 (Array (_ BitVec 32) ValueCell!17510)) (size!44316 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90607)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335898 (= res!886277 (and (= (size!44316 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44315 _keys!1590) (size!44316 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56899 () Bool)

(declare-fun mapRes!56899 () Bool)

(declare-fun tp!108357 () Bool)

(declare-fun e!760927 () Bool)

(assert (=> mapNonEmpty!56899 (= mapRes!56899 (and tp!108357 e!760927))))

(declare-fun mapKey!56899 () (_ BitVec 32))

(declare-fun mapValue!56899 () ValueCell!17510)

(declare-fun mapRest!56899 () (Array (_ BitVec 32) ValueCell!17510))

(assert (=> mapNonEmpty!56899 (= (arr!43765 _values!1320) (store mapRest!56899 mapKey!56899 mapValue!56899))))

(declare-fun res!886280 () Bool)

(assert (=> start!112736 (=> (not res!886280) (not e!760930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112736 (= res!886280 (validMask!0 mask!1998))))

(assert (=> start!112736 e!760930))

(declare-fun e!760928 () Bool)

(declare-fun array_inv!33273 (array!90607) Bool)

(assert (=> start!112736 (and (array_inv!33273 _values!1320) e!760928)))

(assert (=> start!112736 true))

(declare-fun array_inv!33274 (array!90605) Bool)

(assert (=> start!112736 (array_inv!33274 _keys!1590)))

(assert (=> start!112736 tp!108358))

(declare-fun tp_is_empty!36817 () Bool)

(assert (=> start!112736 tp_is_empty!36817))

(declare-fun b!1335899 () Bool)

(declare-fun res!886278 () Bool)

(assert (=> b!1335899 (=> (not res!886278) (not e!760930))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335899 (= res!886278 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44315 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335900 () Bool)

(declare-fun res!886279 () Bool)

(assert (=> b!1335900 (=> (not res!886279) (not e!760930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90605 (_ BitVec 32)) Bool)

(assert (=> b!1335900 (= res!886279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335901 () Bool)

(assert (=> b!1335901 (= e!760930 false)))

(declare-fun lt!592842 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54193)

(declare-fun zeroValue!1262 () V!54193)

(declare-datatypes ((tuple2!23854 0))(
  ( (tuple2!23855 (_1!11938 (_ BitVec 64)) (_2!11938 V!54193)) )
))
(declare-datatypes ((List!31007 0))(
  ( (Nil!31004) (Cons!31003 (h!32221 tuple2!23854) (t!45263 List!31007)) )
))
(declare-datatypes ((ListLongMap!21519 0))(
  ( (ListLongMap!21520 (toList!10775 List!31007)) )
))
(declare-fun contains!8951 (ListLongMap!21519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5734 (array!90605 array!90607 (_ BitVec 32) (_ BitVec 32) V!54193 V!54193 (_ BitVec 32) Int) ListLongMap!21519)

(assert (=> b!1335901 (= lt!592842 (contains!8951 (getCurrentListMap!5734 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335902 () Bool)

(declare-fun e!760926 () Bool)

(assert (=> b!1335902 (= e!760928 (and e!760926 mapRes!56899))))

(declare-fun condMapEmpty!56899 () Bool)

(declare-fun mapDefault!56899 () ValueCell!17510)

(assert (=> b!1335902 (= condMapEmpty!56899 (= (arr!43765 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17510)) mapDefault!56899)))))

(declare-fun b!1335903 () Bool)

(assert (=> b!1335903 (= e!760926 tp_is_empty!36817)))

(declare-fun mapIsEmpty!56899 () Bool)

(assert (=> mapIsEmpty!56899 mapRes!56899))

(declare-fun b!1335904 () Bool)

(assert (=> b!1335904 (= e!760927 tp_is_empty!36817)))

(assert (= (and start!112736 res!886280) b!1335898))

(assert (= (and b!1335898 res!886277) b!1335900))

(assert (= (and b!1335900 res!886279) b!1335897))

(assert (= (and b!1335897 res!886276) b!1335899))

(assert (= (and b!1335899 res!886278) b!1335901))

(assert (= (and b!1335902 condMapEmpty!56899) mapIsEmpty!56899))

(assert (= (and b!1335902 (not condMapEmpty!56899)) mapNonEmpty!56899))

(get-info :version)

(assert (= (and mapNonEmpty!56899 ((_ is ValueCellFull!17510) mapValue!56899)) b!1335904))

(assert (= (and b!1335902 ((_ is ValueCellFull!17510) mapDefault!56899)) b!1335903))

(assert (= start!112736 b!1335902))

(declare-fun m!1224545 () Bool)

(assert (=> mapNonEmpty!56899 m!1224545))

(declare-fun m!1224547 () Bool)

(assert (=> b!1335901 m!1224547))

(assert (=> b!1335901 m!1224547))

(declare-fun m!1224549 () Bool)

(assert (=> b!1335901 m!1224549))

(declare-fun m!1224551 () Bool)

(assert (=> b!1335900 m!1224551))

(declare-fun m!1224553 () Bool)

(assert (=> b!1335897 m!1224553))

(declare-fun m!1224555 () Bool)

(assert (=> start!112736 m!1224555))

(declare-fun m!1224557 () Bool)

(assert (=> start!112736 m!1224557))

(declare-fun m!1224559 () Bool)

(assert (=> start!112736 m!1224559))

(check-sat (not mapNonEmpty!56899) (not start!112736) tp_is_empty!36817 b_and!49817 (not b!1335897) (not b_next!30907) (not b!1335901) (not b!1335900))
(check-sat b_and!49817 (not b_next!30907))
