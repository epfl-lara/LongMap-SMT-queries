; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112554 () Bool)

(assert start!112554)

(declare-fun b_free!30949 () Bool)

(declare-fun b_next!30949 () Bool)

(assert (=> start!112554 (= b_free!30949 (not b_next!30949))))

(declare-fun tp!108485 () Bool)

(declare-fun b_and!49839 () Bool)

(assert (=> start!112554 (= tp!108485 b_and!49839)))

(declare-fun b!1335032 () Bool)

(declare-fun e!760366 () Bool)

(declare-fun e!760367 () Bool)

(declare-fun mapRes!56962 () Bool)

(assert (=> b!1335032 (= e!760366 (and e!760367 mapRes!56962))))

(declare-fun condMapEmpty!56962 () Bool)

(declare-datatypes ((V!54249 0))(
  ( (V!54250 (val!18504 Int)) )
))
(declare-datatypes ((ValueCell!17531 0))(
  ( (ValueCellFull!17531 (v!21140 V!54249)) (EmptyCell!17531) )
))
(declare-datatypes ((array!90525 0))(
  ( (array!90526 (arr!43729 (Array (_ BitVec 32) ValueCell!17531)) (size!44281 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90525)

(declare-fun mapDefault!56962 () ValueCell!17531)

(assert (=> b!1335032 (= condMapEmpty!56962 (= (arr!43729 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17531)) mapDefault!56962)))))

(declare-fun b!1335033 () Bool)

(declare-fun res!886044 () Bool)

(declare-fun e!760365 () Bool)

(assert (=> b!1335033 (=> (not res!886044) (not e!760365))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90527 0))(
  ( (array!90528 (arr!43730 (Array (_ BitVec 32) (_ BitVec 64))) (size!44282 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90527)

(assert (=> b!1335033 (= res!886044 (and (= (size!44281 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44282 _keys!1590) (size!44281 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335034 () Bool)

(declare-fun res!886048 () Bool)

(assert (=> b!1335034 (=> (not res!886048) (not e!760365))))

(declare-datatypes ((List!31059 0))(
  ( (Nil!31056) (Cons!31055 (h!32264 (_ BitVec 64)) (t!45315 List!31059)) )
))
(declare-fun arrayNoDuplicates!0 (array!90527 (_ BitVec 32) List!31059) Bool)

(assert (=> b!1335034 (= res!886048 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31056))))

(declare-fun b!1335035 () Bool)

(declare-fun tp_is_empty!36859 () Bool)

(assert (=> b!1335035 (= e!760367 tp_is_empty!36859)))

(declare-fun mapNonEmpty!56962 () Bool)

(declare-fun tp!108484 () Bool)

(declare-fun e!760368 () Bool)

(assert (=> mapNonEmpty!56962 (= mapRes!56962 (and tp!108484 e!760368))))

(declare-fun mapValue!56962 () ValueCell!17531)

(declare-fun mapKey!56962 () (_ BitVec 32))

(declare-fun mapRest!56962 () (Array (_ BitVec 32) ValueCell!17531))

(assert (=> mapNonEmpty!56962 (= (arr!43729 _values!1320) (store mapRest!56962 mapKey!56962 mapValue!56962))))

(declare-fun b!1335036 () Bool)

(declare-fun res!886045 () Bool)

(assert (=> b!1335036 (=> (not res!886045) (not e!760365))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335036 (= res!886045 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44282 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335037 () Bool)

(assert (=> b!1335037 (= e!760368 tp_is_empty!36859)))

(declare-fun b!1335038 () Bool)

(declare-fun res!886047 () Bool)

(assert (=> b!1335038 (=> (not res!886047) (not e!760365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90527 (_ BitVec 32)) Bool)

(assert (=> b!1335038 (= res!886047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335039 () Bool)

(assert (=> b!1335039 (= e!760365 false)))

(declare-fun minValue!1262 () V!54249)

(declare-fun zeroValue!1262 () V!54249)

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592243 () Bool)

(declare-datatypes ((tuple2!23922 0))(
  ( (tuple2!23923 (_1!11972 (_ BitVec 64)) (_2!11972 V!54249)) )
))
(declare-datatypes ((List!31060 0))(
  ( (Nil!31057) (Cons!31056 (h!32265 tuple2!23922) (t!45316 List!31060)) )
))
(declare-datatypes ((ListLongMap!21579 0))(
  ( (ListLongMap!21580 (toList!10805 List!31060)) )
))
(declare-fun contains!8897 (ListLongMap!21579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5659 (array!90527 array!90525 (_ BitVec 32) (_ BitVec 32) V!54249 V!54249 (_ BitVec 32) Int) ListLongMap!21579)

(assert (=> b!1335039 (= lt!592243 (contains!8897 (getCurrentListMap!5659 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!886046 () Bool)

(assert (=> start!112554 (=> (not res!886046) (not e!760365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112554 (= res!886046 (validMask!0 mask!1998))))

(assert (=> start!112554 e!760365))

(declare-fun array_inv!33179 (array!90525) Bool)

(assert (=> start!112554 (and (array_inv!33179 _values!1320) e!760366)))

(assert (=> start!112554 true))

(declare-fun array_inv!33180 (array!90527) Bool)

(assert (=> start!112554 (array_inv!33180 _keys!1590)))

(assert (=> start!112554 tp!108485))

(assert (=> start!112554 tp_is_empty!36859))

(declare-fun mapIsEmpty!56962 () Bool)

(assert (=> mapIsEmpty!56962 mapRes!56962))

(assert (= (and start!112554 res!886046) b!1335033))

(assert (= (and b!1335033 res!886044) b!1335038))

(assert (= (and b!1335038 res!886047) b!1335034))

(assert (= (and b!1335034 res!886048) b!1335036))

(assert (= (and b!1335036 res!886045) b!1335039))

(assert (= (and b!1335032 condMapEmpty!56962) mapIsEmpty!56962))

(assert (= (and b!1335032 (not condMapEmpty!56962)) mapNonEmpty!56962))

(get-info :version)

(assert (= (and mapNonEmpty!56962 ((_ is ValueCellFull!17531) mapValue!56962)) b!1335037))

(assert (= (and b!1335032 ((_ is ValueCellFull!17531) mapDefault!56962)) b!1335035))

(assert (= start!112554 b!1335032))

(declare-fun m!1222767 () Bool)

(assert (=> b!1335034 m!1222767))

(declare-fun m!1222769 () Bool)

(assert (=> mapNonEmpty!56962 m!1222769))

(declare-fun m!1222771 () Bool)

(assert (=> start!112554 m!1222771))

(declare-fun m!1222773 () Bool)

(assert (=> start!112554 m!1222773))

(declare-fun m!1222775 () Bool)

(assert (=> start!112554 m!1222775))

(declare-fun m!1222777 () Bool)

(assert (=> b!1335038 m!1222777))

(declare-fun m!1222779 () Bool)

(assert (=> b!1335039 m!1222779))

(assert (=> b!1335039 m!1222779))

(declare-fun m!1222781 () Bool)

(assert (=> b!1335039 m!1222781))

(check-sat (not b!1335038) (not mapNonEmpty!56962) (not b_next!30949) (not b!1335034) b_and!49839 (not b!1335039) (not start!112554) tp_is_empty!36859)
(check-sat b_and!49839 (not b_next!30949))
