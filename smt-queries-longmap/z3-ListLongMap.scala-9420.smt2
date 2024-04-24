; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112352 () Bool)

(assert start!112352)

(declare-fun res!881673 () Bool)

(declare-fun e!757965 () Bool)

(assert (=> start!112352 (=> (not res!881673) (not e!757965))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112352 (= res!881673 (validMask!0 mask!1998))))

(assert (=> start!112352 e!757965))

(assert (=> start!112352 true))

(declare-datatypes ((V!53681 0))(
  ( (V!53682 (val!18291 Int)) )
))
(declare-datatypes ((ValueCell!17318 0))(
  ( (ValueCellFull!17318 (v!20923 V!53681)) (EmptyCell!17318) )
))
(declare-datatypes ((array!89873 0))(
  ( (array!89874 (arr!43398 (Array (_ BitVec 32) ValueCell!17318)) (size!43949 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89873)

(declare-fun e!757968 () Bool)

(declare-fun array_inv!33023 (array!89873) Bool)

(assert (=> start!112352 (and (array_inv!33023 _values!1320) e!757968)))

(declare-datatypes ((array!89875 0))(
  ( (array!89876 (arr!43399 (Array (_ BitVec 32) (_ BitVec 64))) (size!43950 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89875)

(declare-fun array_inv!33024 (array!89875) Bool)

(assert (=> start!112352 (array_inv!33024 _keys!1590)))

(declare-fun b!1329308 () Bool)

(declare-fun e!757967 () Bool)

(declare-fun mapRes!56323 () Bool)

(assert (=> b!1329308 (= e!757968 (and e!757967 mapRes!56323))))

(declare-fun condMapEmpty!56323 () Bool)

(declare-fun mapDefault!56323 () ValueCell!17318)

(assert (=> b!1329308 (= condMapEmpty!56323 (= (arr!43398 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17318)) mapDefault!56323)))))

(declare-fun b!1329309 () Bool)

(assert (=> b!1329309 (= e!757965 false)))

(declare-fun lt!591267 () Bool)

(declare-datatypes ((List!30750 0))(
  ( (Nil!30747) (Cons!30746 (h!31964 (_ BitVec 64)) (t!44748 List!30750)) )
))
(declare-fun arrayNoDuplicates!0 (array!89875 (_ BitVec 32) List!30750) Bool)

(assert (=> b!1329309 (= lt!591267 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30747))))

(declare-fun b!1329310 () Bool)

(declare-fun res!881675 () Bool)

(assert (=> b!1329310 (=> (not res!881675) (not e!757965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89875 (_ BitVec 32)) Bool)

(assert (=> b!1329310 (= res!881675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56323 () Bool)

(assert (=> mapIsEmpty!56323 mapRes!56323))

(declare-fun mapNonEmpty!56323 () Bool)

(declare-fun tp!107230 () Bool)

(declare-fun e!757966 () Bool)

(assert (=> mapNonEmpty!56323 (= mapRes!56323 (and tp!107230 e!757966))))

(declare-fun mapValue!56323 () ValueCell!17318)

(declare-fun mapKey!56323 () (_ BitVec 32))

(declare-fun mapRest!56323 () (Array (_ BitVec 32) ValueCell!17318))

(assert (=> mapNonEmpty!56323 (= (arr!43398 _values!1320) (store mapRest!56323 mapKey!56323 mapValue!56323))))

(declare-fun b!1329311 () Bool)

(declare-fun res!881674 () Bool)

(assert (=> b!1329311 (=> (not res!881674) (not e!757965))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329311 (= res!881674 (and (= (size!43949 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43950 _keys!1590) (size!43949 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329312 () Bool)

(declare-fun tp_is_empty!36433 () Bool)

(assert (=> b!1329312 (= e!757966 tp_is_empty!36433)))

(declare-fun b!1329313 () Bool)

(assert (=> b!1329313 (= e!757967 tp_is_empty!36433)))

(assert (= (and start!112352 res!881673) b!1329311))

(assert (= (and b!1329311 res!881674) b!1329310))

(assert (= (and b!1329310 res!881675) b!1329309))

(assert (= (and b!1329308 condMapEmpty!56323) mapIsEmpty!56323))

(assert (= (and b!1329308 (not condMapEmpty!56323)) mapNonEmpty!56323))

(get-info :version)

(assert (= (and mapNonEmpty!56323 ((_ is ValueCellFull!17318) mapValue!56323)) b!1329312))

(assert (= (and b!1329308 ((_ is ValueCellFull!17318) mapDefault!56323)) b!1329313))

(assert (= start!112352 b!1329308))

(declare-fun m!1218731 () Bool)

(assert (=> start!112352 m!1218731))

(declare-fun m!1218733 () Bool)

(assert (=> start!112352 m!1218733))

(declare-fun m!1218735 () Bool)

(assert (=> start!112352 m!1218735))

(declare-fun m!1218737 () Bool)

(assert (=> b!1329309 m!1218737))

(declare-fun m!1218739 () Bool)

(assert (=> b!1329310 m!1218739))

(declare-fun m!1218741 () Bool)

(assert (=> mapNonEmpty!56323 m!1218741))

(check-sat (not mapNonEmpty!56323) (not b!1329310) tp_is_empty!36433 (not b!1329309) (not start!112352))
(check-sat)
