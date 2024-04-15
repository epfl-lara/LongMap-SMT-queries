; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112416 () Bool)

(assert start!112416)

(declare-fun b_free!30811 () Bool)

(declare-fun b_next!30811 () Bool)

(assert (=> start!112416 (= b_free!30811 (not b_next!30811))))

(declare-fun tp!108070 () Bool)

(declare-fun b_and!49635 () Bool)

(assert (=> start!112416 (= tp!108070 b_and!49635)))

(declare-fun mapIsEmpty!56755 () Bool)

(declare-fun mapRes!56755 () Bool)

(assert (=> mapIsEmpty!56755 mapRes!56755))

(declare-fun b!1332725 () Bool)

(declare-fun res!884427 () Bool)

(declare-fun e!759251 () Bool)

(assert (=> b!1332725 (=> (not res!884427) (not e!759251))))

(declare-datatypes ((array!90259 0))(
  ( (array!90260 (arr!43596 (Array (_ BitVec 32) (_ BitVec 64))) (size!44148 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90259)

(declare-datatypes ((List!30964 0))(
  ( (Nil!30961) (Cons!30960 (h!32169 (_ BitVec 64)) (t!45154 List!30964)) )
))
(declare-fun arrayNoDuplicates!0 (array!90259 (_ BitVec 32) List!30964) Bool)

(assert (=> b!1332725 (= res!884427 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30961))))

(declare-fun b!1332726 () Bool)

(declare-fun res!884424 () Bool)

(assert (=> b!1332726 (=> (not res!884424) (not e!759251))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90259 (_ BitVec 32)) Bool)

(assert (=> b!1332726 (= res!884424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332727 () Bool)

(declare-fun res!884425 () Bool)

(assert (=> b!1332727 (=> (not res!884425) (not e!759251))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332727 (= res!884425 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44148 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332728 () Bool)

(assert (=> b!1332728 (= e!759251 false)))

(declare-datatypes ((V!54065 0))(
  ( (V!54066 (val!18435 Int)) )
))
(declare-datatypes ((ValueCell!17462 0))(
  ( (ValueCellFull!17462 (v!21071 V!54065)) (EmptyCell!17462) )
))
(declare-datatypes ((array!90261 0))(
  ( (array!90262 (arr!43597 (Array (_ BitVec 32) ValueCell!17462)) (size!44149 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90261)

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!591883 () Bool)

(declare-fun minValue!1262 () V!54065)

(declare-fun zeroValue!1262 () V!54065)

(declare-datatypes ((tuple2!23828 0))(
  ( (tuple2!23829 (_1!11925 (_ BitVec 64)) (_2!11925 V!54065)) )
))
(declare-datatypes ((List!30965 0))(
  ( (Nil!30962) (Cons!30961 (h!32170 tuple2!23828) (t!45155 List!30965)) )
))
(declare-datatypes ((ListLongMap!21485 0))(
  ( (ListLongMap!21486 (toList!10758 List!30965)) )
))
(declare-fun contains!8850 (ListLongMap!21485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5618 (array!90259 array!90261 (_ BitVec 32) (_ BitVec 32) V!54065 V!54065 (_ BitVec 32) Int) ListLongMap!21485)

(assert (=> b!1332728 (= lt!591883 (contains!8850 (getCurrentListMap!5618 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332729 () Bool)

(declare-fun e!759249 () Bool)

(declare-fun tp_is_empty!36721 () Bool)

(assert (=> b!1332729 (= e!759249 tp_is_empty!36721)))

(declare-fun res!884426 () Bool)

(assert (=> start!112416 (=> (not res!884426) (not e!759251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112416 (= res!884426 (validMask!0 mask!1998))))

(assert (=> start!112416 e!759251))

(declare-fun e!759253 () Bool)

(declare-fun array_inv!33075 (array!90261) Bool)

(assert (=> start!112416 (and (array_inv!33075 _values!1320) e!759253)))

(assert (=> start!112416 true))

(declare-fun array_inv!33076 (array!90259) Bool)

(assert (=> start!112416 (array_inv!33076 _keys!1590)))

(assert (=> start!112416 tp!108070))

(assert (=> start!112416 tp_is_empty!36721))

(declare-fun mapNonEmpty!56755 () Bool)

(declare-fun tp!108071 () Bool)

(assert (=> mapNonEmpty!56755 (= mapRes!56755 (and tp!108071 e!759249))))

(declare-fun mapKey!56755 () (_ BitVec 32))

(declare-fun mapValue!56755 () ValueCell!17462)

(declare-fun mapRest!56755 () (Array (_ BitVec 32) ValueCell!17462))

(assert (=> mapNonEmpty!56755 (= (arr!43597 _values!1320) (store mapRest!56755 mapKey!56755 mapValue!56755))))

(declare-fun b!1332730 () Bool)

(declare-fun e!759252 () Bool)

(assert (=> b!1332730 (= e!759252 tp_is_empty!36721)))

(declare-fun b!1332731 () Bool)

(assert (=> b!1332731 (= e!759253 (and e!759252 mapRes!56755))))

(declare-fun condMapEmpty!56755 () Bool)

(declare-fun mapDefault!56755 () ValueCell!17462)

(assert (=> b!1332731 (= condMapEmpty!56755 (= (arr!43597 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17462)) mapDefault!56755)))))

(declare-fun b!1332732 () Bool)

(declare-fun res!884428 () Bool)

(assert (=> b!1332732 (=> (not res!884428) (not e!759251))))

(assert (=> b!1332732 (= res!884428 (and (= (size!44149 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44148 _keys!1590) (size!44149 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112416 res!884426) b!1332732))

(assert (= (and b!1332732 res!884428) b!1332726))

(assert (= (and b!1332726 res!884424) b!1332725))

(assert (= (and b!1332725 res!884427) b!1332727))

(assert (= (and b!1332727 res!884425) b!1332728))

(assert (= (and b!1332731 condMapEmpty!56755) mapIsEmpty!56755))

(assert (= (and b!1332731 (not condMapEmpty!56755)) mapNonEmpty!56755))

(get-info :version)

(assert (= (and mapNonEmpty!56755 ((_ is ValueCellFull!17462) mapValue!56755)) b!1332729))

(assert (= (and b!1332731 ((_ is ValueCellFull!17462) mapDefault!56755)) b!1332730))

(assert (= start!112416 b!1332731))

(declare-fun m!1221015 () Bool)

(assert (=> b!1332728 m!1221015))

(assert (=> b!1332728 m!1221015))

(declare-fun m!1221017 () Bool)

(assert (=> b!1332728 m!1221017))

(declare-fun m!1221019 () Bool)

(assert (=> b!1332726 m!1221019))

(declare-fun m!1221021 () Bool)

(assert (=> b!1332725 m!1221021))

(declare-fun m!1221023 () Bool)

(assert (=> start!112416 m!1221023))

(declare-fun m!1221025 () Bool)

(assert (=> start!112416 m!1221025))

(declare-fun m!1221027 () Bool)

(assert (=> start!112416 m!1221027))

(declare-fun m!1221029 () Bool)

(assert (=> mapNonEmpty!56755 m!1221029))

(check-sat (not b!1332725) (not start!112416) (not b!1332726) (not b_next!30811) b_and!49635 (not b!1332728) tp_is_empty!36721 (not mapNonEmpty!56755))
(check-sat b_and!49635 (not b_next!30811))
