; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112428 () Bool)

(assert start!112428)

(declare-fun b_free!30823 () Bool)

(declare-fun b_next!30823 () Bool)

(assert (=> start!112428 (= b_free!30823 (not b_next!30823))))

(declare-fun tp!108106 () Bool)

(declare-fun b_and!49647 () Bool)

(assert (=> start!112428 (= tp!108106 b_and!49647)))

(declare-fun mapNonEmpty!56773 () Bool)

(declare-fun mapRes!56773 () Bool)

(declare-fun tp!108107 () Bool)

(declare-fun e!759341 () Bool)

(assert (=> mapNonEmpty!56773 (= mapRes!56773 (and tp!108107 e!759341))))

(declare-datatypes ((V!54081 0))(
  ( (V!54082 (val!18441 Int)) )
))
(declare-datatypes ((ValueCell!17468 0))(
  ( (ValueCellFull!17468 (v!21077 V!54081)) (EmptyCell!17468) )
))
(declare-datatypes ((array!90281 0))(
  ( (array!90282 (arr!43607 (Array (_ BitVec 32) ValueCell!17468)) (size!44159 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90281)

(declare-fun mapRest!56773 () (Array (_ BitVec 32) ValueCell!17468))

(declare-fun mapValue!56773 () ValueCell!17468)

(declare-fun mapKey!56773 () (_ BitVec 32))

(assert (=> mapNonEmpty!56773 (= (arr!43607 _values!1320) (store mapRest!56773 mapKey!56773 mapValue!56773))))

(declare-fun res!884514 () Bool)

(declare-fun e!759342 () Bool)

(assert (=> start!112428 (=> (not res!884514) (not e!759342))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112428 (= res!884514 (validMask!0 mask!1998))))

(assert (=> start!112428 e!759342))

(declare-fun e!759339 () Bool)

(declare-fun array_inv!33081 (array!90281) Bool)

(assert (=> start!112428 (and (array_inv!33081 _values!1320) e!759339)))

(assert (=> start!112428 true))

(declare-datatypes ((array!90283 0))(
  ( (array!90284 (arr!43608 (Array (_ BitVec 32) (_ BitVec 64))) (size!44160 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90283)

(declare-fun array_inv!33082 (array!90283) Bool)

(assert (=> start!112428 (array_inv!33082 _keys!1590)))

(assert (=> start!112428 tp!108106))

(declare-fun tp_is_empty!36733 () Bool)

(assert (=> start!112428 tp_is_empty!36733))

(declare-fun b!1332869 () Bool)

(declare-fun res!884518 () Bool)

(assert (=> b!1332869 (=> (not res!884518) (not e!759342))))

(declare-datatypes ((List!30970 0))(
  ( (Nil!30967) (Cons!30966 (h!32175 (_ BitVec 64)) (t!45160 List!30970)) )
))
(declare-fun arrayNoDuplicates!0 (array!90283 (_ BitVec 32) List!30970) Bool)

(assert (=> b!1332869 (= res!884518 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30967))))

(declare-fun b!1332870 () Bool)

(assert (=> b!1332870 (= e!759342 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54081)

(declare-fun zeroValue!1262 () V!54081)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun lt!591901 () Bool)

(declare-datatypes ((tuple2!23834 0))(
  ( (tuple2!23835 (_1!11928 (_ BitVec 64)) (_2!11928 V!54081)) )
))
(declare-datatypes ((List!30971 0))(
  ( (Nil!30968) (Cons!30967 (h!32176 tuple2!23834) (t!45161 List!30971)) )
))
(declare-datatypes ((ListLongMap!21491 0))(
  ( (ListLongMap!21492 (toList!10761 List!30971)) )
))
(declare-fun contains!8853 (ListLongMap!21491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5621 (array!90283 array!90281 (_ BitVec 32) (_ BitVec 32) V!54081 V!54081 (_ BitVec 32) Int) ListLongMap!21491)

(assert (=> b!1332870 (= lt!591901 (contains!8853 (getCurrentListMap!5621 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332871 () Bool)

(declare-fun res!884516 () Bool)

(assert (=> b!1332871 (=> (not res!884516) (not e!759342))))

(assert (=> b!1332871 (= res!884516 (and (= (size!44159 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44160 _keys!1590) (size!44159 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332872 () Bool)

(declare-fun res!884517 () Bool)

(assert (=> b!1332872 (=> (not res!884517) (not e!759342))))

(assert (=> b!1332872 (= res!884517 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44160 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332873 () Bool)

(assert (=> b!1332873 (= e!759341 tp_is_empty!36733)))

(declare-fun b!1332874 () Bool)

(declare-fun e!759340 () Bool)

(assert (=> b!1332874 (= e!759340 tp_is_empty!36733)))

(declare-fun mapIsEmpty!56773 () Bool)

(assert (=> mapIsEmpty!56773 mapRes!56773))

(declare-fun b!1332875 () Bool)

(declare-fun res!884515 () Bool)

(assert (=> b!1332875 (=> (not res!884515) (not e!759342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90283 (_ BitVec 32)) Bool)

(assert (=> b!1332875 (= res!884515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332876 () Bool)

(assert (=> b!1332876 (= e!759339 (and e!759340 mapRes!56773))))

(declare-fun condMapEmpty!56773 () Bool)

(declare-fun mapDefault!56773 () ValueCell!17468)

(assert (=> b!1332876 (= condMapEmpty!56773 (= (arr!43607 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17468)) mapDefault!56773)))))

(assert (= (and start!112428 res!884514) b!1332871))

(assert (= (and b!1332871 res!884516) b!1332875))

(assert (= (and b!1332875 res!884515) b!1332869))

(assert (= (and b!1332869 res!884518) b!1332872))

(assert (= (and b!1332872 res!884517) b!1332870))

(assert (= (and b!1332876 condMapEmpty!56773) mapIsEmpty!56773))

(assert (= (and b!1332876 (not condMapEmpty!56773)) mapNonEmpty!56773))

(get-info :version)

(assert (= (and mapNonEmpty!56773 ((_ is ValueCellFull!17468) mapValue!56773)) b!1332873))

(assert (= (and b!1332876 ((_ is ValueCellFull!17468) mapDefault!56773)) b!1332874))

(assert (= start!112428 b!1332876))

(declare-fun m!1221111 () Bool)

(assert (=> mapNonEmpty!56773 m!1221111))

(declare-fun m!1221113 () Bool)

(assert (=> start!112428 m!1221113))

(declare-fun m!1221115 () Bool)

(assert (=> start!112428 m!1221115))

(declare-fun m!1221117 () Bool)

(assert (=> start!112428 m!1221117))

(declare-fun m!1221119 () Bool)

(assert (=> b!1332869 m!1221119))

(declare-fun m!1221121 () Bool)

(assert (=> b!1332875 m!1221121))

(declare-fun m!1221123 () Bool)

(assert (=> b!1332870 m!1221123))

(assert (=> b!1332870 m!1221123))

(declare-fun m!1221125 () Bool)

(assert (=> b!1332870 m!1221125))

(check-sat b_and!49647 (not start!112428) tp_is_empty!36733 (not b!1332870) (not mapNonEmpty!56773) (not b!1332869) (not b_next!30823) (not b!1332875))
(check-sat b_and!49647 (not b_next!30823))
