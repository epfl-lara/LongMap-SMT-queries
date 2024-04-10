; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112436 () Bool)

(assert start!112436)

(declare-fun b_free!30831 () Bool)

(declare-fun b_next!30831 () Bool)

(assert (=> start!112436 (= b_free!30831 (not b_next!30831))))

(declare-fun tp!108130 () Bool)

(declare-fun b_and!49673 () Bool)

(assert (=> start!112436 (= tp!108130 b_and!49673)))

(declare-fun b!1333035 () Bool)

(declare-fun e!759432 () Bool)

(declare-fun tp_is_empty!36741 () Bool)

(assert (=> b!1333035 (= e!759432 tp_is_empty!36741)))

(declare-fun b!1333036 () Bool)

(declare-fun e!759433 () Bool)

(declare-fun mapRes!56785 () Bool)

(assert (=> b!1333036 (= e!759433 (and e!759432 mapRes!56785))))

(declare-fun condMapEmpty!56785 () Bool)

(declare-datatypes ((V!54091 0))(
  ( (V!54092 (val!18445 Int)) )
))
(declare-datatypes ((ValueCell!17472 0))(
  ( (ValueCellFull!17472 (v!21082 V!54091)) (EmptyCell!17472) )
))
(declare-datatypes ((array!90356 0))(
  ( (array!90357 (arr!43644 (Array (_ BitVec 32) ValueCell!17472)) (size!44194 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90356)

(declare-fun mapDefault!56785 () ValueCell!17472)

(assert (=> b!1333036 (= condMapEmpty!56785 (= (arr!43644 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17472)) mapDefault!56785)))))

(declare-fun b!1333037 () Bool)

(declare-fun e!759436 () Bool)

(assert (=> b!1333037 (= e!759436 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90358 0))(
  ( (array!90359 (arr!43645 (Array (_ BitVec 32) (_ BitVec 64))) (size!44195 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90358)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592099 () Bool)

(declare-fun minValue!1262 () V!54091)

(declare-fun zeroValue!1262 () V!54091)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23772 0))(
  ( (tuple2!23773 (_1!11897 (_ BitVec 64)) (_2!11897 V!54091)) )
))
(declare-datatypes ((List!30917 0))(
  ( (Nil!30914) (Cons!30913 (h!32122 tuple2!23772) (t!45115 List!30917)) )
))
(declare-datatypes ((ListLongMap!21429 0))(
  ( (ListLongMap!21430 (toList!10730 List!30917)) )
))
(declare-fun contains!8894 (ListLongMap!21429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5711 (array!90358 array!90356 (_ BitVec 32) (_ BitVec 32) V!54091 V!54091 (_ BitVec 32) Int) ListLongMap!21429)

(assert (=> b!1333037 (= lt!592099 (contains!8894 (getCurrentListMap!5711 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56785 () Bool)

(assert (=> mapIsEmpty!56785 mapRes!56785))

(declare-fun b!1333038 () Bool)

(declare-fun res!884603 () Bool)

(assert (=> b!1333038 (=> (not res!884603) (not e!759436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90358 (_ BitVec 32)) Bool)

(assert (=> b!1333038 (= res!884603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!884606 () Bool)

(assert (=> start!112436 (=> (not res!884606) (not e!759436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112436 (= res!884606 (validMask!0 mask!1998))))

(assert (=> start!112436 e!759436))

(declare-fun array_inv!32919 (array!90356) Bool)

(assert (=> start!112436 (and (array_inv!32919 _values!1320) e!759433)))

(assert (=> start!112436 true))

(declare-fun array_inv!32920 (array!90358) Bool)

(assert (=> start!112436 (array_inv!32920 _keys!1590)))

(assert (=> start!112436 tp!108130))

(assert (=> start!112436 tp_is_empty!36741))

(declare-fun mapNonEmpty!56785 () Bool)

(declare-fun tp!108129 () Bool)

(declare-fun e!759434 () Bool)

(assert (=> mapNonEmpty!56785 (= mapRes!56785 (and tp!108129 e!759434))))

(declare-fun mapKey!56785 () (_ BitVec 32))

(declare-fun mapValue!56785 () ValueCell!17472)

(declare-fun mapRest!56785 () (Array (_ BitVec 32) ValueCell!17472))

(assert (=> mapNonEmpty!56785 (= (arr!43644 _values!1320) (store mapRest!56785 mapKey!56785 mapValue!56785))))

(declare-fun b!1333039 () Bool)

(assert (=> b!1333039 (= e!759434 tp_is_empty!36741)))

(declare-fun b!1333040 () Bool)

(declare-fun res!884605 () Bool)

(assert (=> b!1333040 (=> (not res!884605) (not e!759436))))

(assert (=> b!1333040 (= res!884605 (and (= (size!44194 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44195 _keys!1590) (size!44194 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333041 () Bool)

(declare-fun res!884607 () Bool)

(assert (=> b!1333041 (=> (not res!884607) (not e!759436))))

(declare-datatypes ((List!30918 0))(
  ( (Nil!30915) (Cons!30914 (h!32123 (_ BitVec 64)) (t!45116 List!30918)) )
))
(declare-fun arrayNoDuplicates!0 (array!90358 (_ BitVec 32) List!30918) Bool)

(assert (=> b!1333041 (= res!884607 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30915))))

(declare-fun b!1333042 () Bool)

(declare-fun res!884604 () Bool)

(assert (=> b!1333042 (=> (not res!884604) (not e!759436))))

(assert (=> b!1333042 (= res!884604 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44195 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112436 res!884606) b!1333040))

(assert (= (and b!1333040 res!884605) b!1333038))

(assert (= (and b!1333038 res!884603) b!1333041))

(assert (= (and b!1333041 res!884607) b!1333042))

(assert (= (and b!1333042 res!884604) b!1333037))

(assert (= (and b!1333036 condMapEmpty!56785) mapIsEmpty!56785))

(assert (= (and b!1333036 (not condMapEmpty!56785)) mapNonEmpty!56785))

(get-info :version)

(assert (= (and mapNonEmpty!56785 ((_ is ValueCellFull!17472) mapValue!56785)) b!1333039))

(assert (= (and b!1333036 ((_ is ValueCellFull!17472) mapDefault!56785)) b!1333035))

(assert (= start!112436 b!1333036))

(declare-fun m!1221691 () Bool)

(assert (=> b!1333041 m!1221691))

(declare-fun m!1221693 () Bool)

(assert (=> mapNonEmpty!56785 m!1221693))

(declare-fun m!1221695 () Bool)

(assert (=> b!1333037 m!1221695))

(assert (=> b!1333037 m!1221695))

(declare-fun m!1221697 () Bool)

(assert (=> b!1333037 m!1221697))

(declare-fun m!1221699 () Bool)

(assert (=> start!112436 m!1221699))

(declare-fun m!1221701 () Bool)

(assert (=> start!112436 m!1221701))

(declare-fun m!1221703 () Bool)

(assert (=> start!112436 m!1221703))

(declare-fun m!1221705 () Bool)

(assert (=> b!1333038 m!1221705))

(check-sat (not mapNonEmpty!56785) (not b_next!30831) (not start!112436) tp_is_empty!36741 (not b!1333041) (not b!1333038) b_and!49673 (not b!1333037))
(check-sat b_and!49673 (not b_next!30831))
