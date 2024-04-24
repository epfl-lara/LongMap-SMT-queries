; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112370 () Bool)

(assert start!112370)

(declare-fun b_free!30541 () Bool)

(declare-fun b_next!30541 () Bool)

(assert (=> start!112370 (= b_free!30541 (not b_next!30541))))

(declare-fun tp!107259 () Bool)

(declare-fun b_and!49193 () Bool)

(assert (=> start!112370 (= tp!107259 b_and!49193)))

(declare-fun res!881769 () Bool)

(declare-fun e!758102 () Bool)

(assert (=> start!112370 (=> (not res!881769) (not e!758102))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112370 (= res!881769 (validMask!0 mask!1998))))

(assert (=> start!112370 e!758102))

(declare-datatypes ((V!53705 0))(
  ( (V!53706 (val!18300 Int)) )
))
(declare-datatypes ((ValueCell!17327 0))(
  ( (ValueCellFull!17327 (v!20932 V!53705)) (EmptyCell!17327) )
))
(declare-datatypes ((array!89907 0))(
  ( (array!89908 (arr!43415 (Array (_ BitVec 32) ValueCell!17327)) (size!43966 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89907)

(declare-fun e!758101 () Bool)

(declare-fun array_inv!33037 (array!89907) Bool)

(assert (=> start!112370 (and (array_inv!33037 _values!1320) e!758101)))

(assert (=> start!112370 true))

(declare-datatypes ((array!89909 0))(
  ( (array!89910 (arr!43416 (Array (_ BitVec 32) (_ BitVec 64))) (size!43967 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89909)

(declare-fun array_inv!33038 (array!89909) Bool)

(assert (=> start!112370 (array_inv!33038 _keys!1590)))

(assert (=> start!112370 tp!107259))

(declare-fun tp_is_empty!36451 () Bool)

(assert (=> start!112370 tp_is_empty!36451))

(declare-fun b!1329483 () Bool)

(declare-fun e!758103 () Bool)

(declare-fun mapRes!56350 () Bool)

(assert (=> b!1329483 (= e!758101 (and e!758103 mapRes!56350))))

(declare-fun condMapEmpty!56350 () Bool)

(declare-fun mapDefault!56350 () ValueCell!17327)

(assert (=> b!1329483 (= condMapEmpty!56350 (= (arr!43415 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17327)) mapDefault!56350)))))

(declare-fun b!1329484 () Bool)

(declare-fun res!881767 () Bool)

(assert (=> b!1329484 (=> (not res!881767) (not e!758102))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329484 (= res!881767 (and (= (size!43966 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43967 _keys!1590) (size!43966 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329485 () Bool)

(assert (=> b!1329485 (= e!758103 tp_is_empty!36451)))

(declare-fun mapNonEmpty!56350 () Bool)

(declare-fun tp!107260 () Bool)

(declare-fun e!758104 () Bool)

(assert (=> mapNonEmpty!56350 (= mapRes!56350 (and tp!107260 e!758104))))

(declare-fun mapRest!56350 () (Array (_ BitVec 32) ValueCell!17327))

(declare-fun mapValue!56350 () ValueCell!17327)

(declare-fun mapKey!56350 () (_ BitVec 32))

(assert (=> mapNonEmpty!56350 (= (arr!43415 _values!1320) (store mapRest!56350 mapKey!56350 mapValue!56350))))

(declare-fun b!1329486 () Bool)

(declare-fun res!881768 () Bool)

(assert (=> b!1329486 (=> (not res!881768) (not e!758102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89909 (_ BitVec 32)) Bool)

(assert (=> b!1329486 (= res!881768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329487 () Bool)

(assert (=> b!1329487 (= e!758102 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53705)

(declare-fun zeroValue!1262 () V!53705)

(declare-fun lt!591285 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23580 0))(
  ( (tuple2!23581 (_1!11801 (_ BitVec 64)) (_2!11801 V!53705)) )
))
(declare-datatypes ((List!30756 0))(
  ( (Nil!30753) (Cons!30752 (h!31970 tuple2!23580) (t!44754 List!30756)) )
))
(declare-datatypes ((ListLongMap!21245 0))(
  ( (ListLongMap!21246 (toList!10638 List!30756)) )
))
(declare-fun contains!8814 (ListLongMap!21245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5615 (array!89909 array!89907 (_ BitVec 32) (_ BitVec 32) V!53705 V!53705 (_ BitVec 32) Int) ListLongMap!21245)

(assert (=> b!1329487 (= lt!591285 (contains!8814 (getCurrentListMap!5615 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329488 () Bool)

(declare-fun res!881770 () Bool)

(assert (=> b!1329488 (=> (not res!881770) (not e!758102))))

(declare-datatypes ((List!30757 0))(
  ( (Nil!30754) (Cons!30753 (h!31971 (_ BitVec 64)) (t!44755 List!30757)) )
))
(declare-fun arrayNoDuplicates!0 (array!89909 (_ BitVec 32) List!30757) Bool)

(assert (=> b!1329488 (= res!881770 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30754))))

(declare-fun mapIsEmpty!56350 () Bool)

(assert (=> mapIsEmpty!56350 mapRes!56350))

(declare-fun b!1329489 () Bool)

(assert (=> b!1329489 (= e!758104 tp_is_empty!36451)))

(declare-fun b!1329490 () Bool)

(declare-fun res!881771 () Bool)

(assert (=> b!1329490 (=> (not res!881771) (not e!758102))))

(assert (=> b!1329490 (= res!881771 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43967 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112370 res!881769) b!1329484))

(assert (= (and b!1329484 res!881767) b!1329486))

(assert (= (and b!1329486 res!881768) b!1329488))

(assert (= (and b!1329488 res!881770) b!1329490))

(assert (= (and b!1329490 res!881771) b!1329487))

(assert (= (and b!1329483 condMapEmpty!56350) mapIsEmpty!56350))

(assert (= (and b!1329483 (not condMapEmpty!56350)) mapNonEmpty!56350))

(get-info :version)

(assert (= (and mapNonEmpty!56350 ((_ is ValueCellFull!17327) mapValue!56350)) b!1329489))

(assert (= (and b!1329483 ((_ is ValueCellFull!17327) mapDefault!56350)) b!1329485))

(assert (= start!112370 b!1329483))

(declare-fun m!1218839 () Bool)

(assert (=> b!1329487 m!1218839))

(assert (=> b!1329487 m!1218839))

(declare-fun m!1218841 () Bool)

(assert (=> b!1329487 m!1218841))

(declare-fun m!1218843 () Bool)

(assert (=> b!1329488 m!1218843))

(declare-fun m!1218845 () Bool)

(assert (=> mapNonEmpty!56350 m!1218845))

(declare-fun m!1218847 () Bool)

(assert (=> start!112370 m!1218847))

(declare-fun m!1218849 () Bool)

(assert (=> start!112370 m!1218849))

(declare-fun m!1218851 () Bool)

(assert (=> start!112370 m!1218851))

(declare-fun m!1218853 () Bool)

(assert (=> b!1329486 m!1218853))

(check-sat (not b!1329488) (not mapNonEmpty!56350) (not start!112370) (not b_next!30541) b_and!49193 tp_is_empty!36451 (not b!1329486) (not b!1329487))
(check-sat b_and!49193 (not b_next!30541))
