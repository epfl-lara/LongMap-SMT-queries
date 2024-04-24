; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112778 () Bool)

(assert start!112778)

(declare-fun b_free!30949 () Bool)

(declare-fun b_next!30949 () Bool)

(assert (=> start!112778 (= b_free!30949 (not b_next!30949))))

(declare-fun tp!108484 () Bool)

(declare-fun b_and!49859 () Bool)

(assert (=> start!112778 (= tp!108484 b_and!49859)))

(declare-fun b!1336401 () Bool)

(declare-fun res!886591 () Bool)

(declare-fun e!761244 () Bool)

(assert (=> b!1336401 (=> (not res!886591) (not e!761244))))

(declare-datatypes ((array!90689 0))(
  ( (array!90690 (arr!43806 (Array (_ BitVec 32) (_ BitVec 64))) (size!44357 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90689)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90689 (_ BitVec 32)) Bool)

(assert (=> b!1336401 (= res!886591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336402 () Bool)

(declare-fun res!886594 () Bool)

(assert (=> b!1336402 (=> (not res!886594) (not e!761244))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336402 (= res!886594 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44357 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336403 () Bool)

(assert (=> b!1336403 (= e!761244 false)))

(declare-datatypes ((V!54249 0))(
  ( (V!54250 (val!18504 Int)) )
))
(declare-datatypes ((ValueCell!17531 0))(
  ( (ValueCellFull!17531 (v!21136 V!54249)) (EmptyCell!17531) )
))
(declare-datatypes ((array!90691 0))(
  ( (array!90692 (arr!43807 (Array (_ BitVec 32) ValueCell!17531)) (size!44358 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90691)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54249)

(declare-fun zeroValue!1262 () V!54249)

(declare-fun lt!592905 () Bool)

(declare-datatypes ((tuple2!23888 0))(
  ( (tuple2!23889 (_1!11955 (_ BitVec 64)) (_2!11955 V!54249)) )
))
(declare-datatypes ((List!31035 0))(
  ( (Nil!31032) (Cons!31031 (h!32249 tuple2!23888) (t!45291 List!31035)) )
))
(declare-datatypes ((ListLongMap!21553 0))(
  ( (ListLongMap!21554 (toList!10792 List!31035)) )
))
(declare-fun contains!8968 (ListLongMap!21553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5751 (array!90689 array!90691 (_ BitVec 32) (_ BitVec 32) V!54249 V!54249 (_ BitVec 32) Int) ListLongMap!21553)

(assert (=> b!1336403 (= lt!592905 (contains!8968 (getCurrentListMap!5751 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336404 () Bool)

(declare-fun res!886592 () Bool)

(assert (=> b!1336404 (=> (not res!886592) (not e!761244))))

(assert (=> b!1336404 (= res!886592 (and (= (size!44358 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44357 _keys!1590) (size!44358 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336406 () Bool)

(declare-fun e!761245 () Bool)

(declare-fun tp_is_empty!36859 () Bool)

(assert (=> b!1336406 (= e!761245 tp_is_empty!36859)))

(declare-fun mapIsEmpty!56962 () Bool)

(declare-fun mapRes!56962 () Bool)

(assert (=> mapIsEmpty!56962 mapRes!56962))

(declare-fun b!1336407 () Bool)

(declare-fun e!761241 () Bool)

(assert (=> b!1336407 (= e!761241 tp_is_empty!36859)))

(declare-fun mapNonEmpty!56962 () Bool)

(declare-fun tp!108483 () Bool)

(assert (=> mapNonEmpty!56962 (= mapRes!56962 (and tp!108483 e!761241))))

(declare-fun mapRest!56962 () (Array (_ BitVec 32) ValueCell!17531))

(declare-fun mapValue!56962 () ValueCell!17531)

(declare-fun mapKey!56962 () (_ BitVec 32))

(assert (=> mapNonEmpty!56962 (= (arr!43807 _values!1320) (store mapRest!56962 mapKey!56962 mapValue!56962))))

(declare-fun b!1336408 () Bool)

(declare-fun e!761242 () Bool)

(assert (=> b!1336408 (= e!761242 (and e!761245 mapRes!56962))))

(declare-fun condMapEmpty!56962 () Bool)

(declare-fun mapDefault!56962 () ValueCell!17531)

(assert (=> b!1336408 (= condMapEmpty!56962 (= (arr!43807 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17531)) mapDefault!56962)))))

(declare-fun b!1336405 () Bool)

(declare-fun res!886593 () Bool)

(assert (=> b!1336405 (=> (not res!886593) (not e!761244))))

(declare-datatypes ((List!31036 0))(
  ( (Nil!31033) (Cons!31032 (h!32250 (_ BitVec 64)) (t!45292 List!31036)) )
))
(declare-fun arrayNoDuplicates!0 (array!90689 (_ BitVec 32) List!31036) Bool)

(assert (=> b!1336405 (= res!886593 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31033))))

(declare-fun res!886595 () Bool)

(assert (=> start!112778 (=> (not res!886595) (not e!761244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112778 (= res!886595 (validMask!0 mask!1998))))

(assert (=> start!112778 e!761244))

(declare-fun array_inv!33301 (array!90691) Bool)

(assert (=> start!112778 (and (array_inv!33301 _values!1320) e!761242)))

(assert (=> start!112778 true))

(declare-fun array_inv!33302 (array!90689) Bool)

(assert (=> start!112778 (array_inv!33302 _keys!1590)))

(assert (=> start!112778 tp!108484))

(assert (=> start!112778 tp_is_empty!36859))

(assert (= (and start!112778 res!886595) b!1336404))

(assert (= (and b!1336404 res!886592) b!1336401))

(assert (= (and b!1336401 res!886591) b!1336405))

(assert (= (and b!1336405 res!886593) b!1336402))

(assert (= (and b!1336402 res!886594) b!1336403))

(assert (= (and b!1336408 condMapEmpty!56962) mapIsEmpty!56962))

(assert (= (and b!1336408 (not condMapEmpty!56962)) mapNonEmpty!56962))

(get-info :version)

(assert (= (and mapNonEmpty!56962 ((_ is ValueCellFull!17531) mapValue!56962)) b!1336407))

(assert (= (and b!1336408 ((_ is ValueCellFull!17531) mapDefault!56962)) b!1336406))

(assert (= start!112778 b!1336408))

(declare-fun m!1224881 () Bool)

(assert (=> start!112778 m!1224881))

(declare-fun m!1224883 () Bool)

(assert (=> start!112778 m!1224883))

(declare-fun m!1224885 () Bool)

(assert (=> start!112778 m!1224885))

(declare-fun m!1224887 () Bool)

(assert (=> b!1336401 m!1224887))

(declare-fun m!1224889 () Bool)

(assert (=> b!1336403 m!1224889))

(assert (=> b!1336403 m!1224889))

(declare-fun m!1224891 () Bool)

(assert (=> b!1336403 m!1224891))

(declare-fun m!1224893 () Bool)

(assert (=> mapNonEmpty!56962 m!1224893))

(declare-fun m!1224895 () Bool)

(assert (=> b!1336405 m!1224895))

(check-sat (not b_next!30949) (not b!1336401) (not mapNonEmpty!56962) tp_is_empty!36859 (not start!112778) b_and!49859 (not b!1336403) (not b!1336405))
(check-sat b_and!49859 (not b_next!30949))
