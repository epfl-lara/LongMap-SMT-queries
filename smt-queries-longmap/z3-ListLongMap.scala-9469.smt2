; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112646 () Bool)

(assert start!112646)

(declare-fun b_free!30817 () Bool)

(declare-fun b_next!30817 () Bool)

(assert (=> start!112646 (= b_free!30817 (not b_next!30817))))

(declare-fun tp!108087 () Bool)

(declare-fun b_and!49661 () Bool)

(assert (=> start!112646 (= tp!108087 b_and!49661)))

(declare-fun b!1334166 () Bool)

(declare-fun res!885016 () Bool)

(declare-fun e!760171 () Bool)

(assert (=> b!1334166 (=> (not res!885016) (not e!760171))))

(declare-datatypes ((array!90431 0))(
  ( (array!90432 (arr!43677 (Array (_ BitVec 32) (_ BitVec 64))) (size!44228 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90431)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90431 (_ BitVec 32)) Bool)

(assert (=> b!1334166 (= res!885016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334167 () Bool)

(declare-fun res!885020 () Bool)

(assert (=> b!1334167 (=> (not res!885020) (not e!760171))))

(declare-datatypes ((V!54073 0))(
  ( (V!54074 (val!18438 Int)) )
))
(declare-datatypes ((ValueCell!17465 0))(
  ( (ValueCellFull!17465 (v!21070 V!54073)) (EmptyCell!17465) )
))
(declare-datatypes ((array!90433 0))(
  ( (array!90434 (arr!43678 (Array (_ BitVec 32) ValueCell!17465)) (size!44229 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90433)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334167 (= res!885020 (and (= (size!44229 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44228 _keys!1590) (size!44229 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334168 () Bool)

(declare-fun e!760173 () Bool)

(declare-fun e!760170 () Bool)

(declare-fun mapRes!56764 () Bool)

(assert (=> b!1334168 (= e!760173 (and e!760170 mapRes!56764))))

(declare-fun condMapEmpty!56764 () Bool)

(declare-fun mapDefault!56764 () ValueCell!17465)

(assert (=> b!1334168 (= condMapEmpty!56764 (= (arr!43678 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17465)) mapDefault!56764)))))

(declare-fun b!1334169 () Bool)

(declare-fun tp_is_empty!36727 () Bool)

(assert (=> b!1334169 (= e!760170 tp_is_empty!36727)))

(declare-fun mapNonEmpty!56764 () Bool)

(declare-fun tp!108088 () Bool)

(declare-fun e!760172 () Bool)

(assert (=> mapNonEmpty!56764 (= mapRes!56764 (and tp!108088 e!760172))))

(declare-fun mapKey!56764 () (_ BitVec 32))

(declare-fun mapRest!56764 () (Array (_ BitVec 32) ValueCell!17465))

(declare-fun mapValue!56764 () ValueCell!17465)

(assert (=> mapNonEmpty!56764 (= (arr!43678 _values!1320) (store mapRest!56764 mapKey!56764 mapValue!56764))))

(declare-fun b!1334170 () Bool)

(declare-fun res!885017 () Bool)

(assert (=> b!1334170 (=> (not res!885017) (not e!760171))))

(declare-datatypes ((List!30951 0))(
  ( (Nil!30948) (Cons!30947 (h!32165 (_ BitVec 64)) (t!45141 List!30951)) )
))
(declare-fun arrayNoDuplicates!0 (array!90431 (_ BitVec 32) List!30951) Bool)

(assert (=> b!1334170 (= res!885017 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30948))))

(declare-fun b!1334171 () Bool)

(assert (=> b!1334171 (= e!760171 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592554 () Bool)

(declare-fun minValue!1262 () V!54073)

(declare-fun zeroValue!1262 () V!54073)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23794 0))(
  ( (tuple2!23795 (_1!11908 (_ BitVec 64)) (_2!11908 V!54073)) )
))
(declare-datatypes ((List!30952 0))(
  ( (Nil!30949) (Cons!30948 (h!32166 tuple2!23794) (t!45142 List!30952)) )
))
(declare-datatypes ((ListLongMap!21459 0))(
  ( (ListLongMap!21460 (toList!10745 List!30952)) )
))
(declare-fun contains!8921 (ListLongMap!21459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5709 (array!90431 array!90433 (_ BitVec 32) (_ BitVec 32) V!54073 V!54073 (_ BitVec 32) Int) ListLongMap!21459)

(assert (=> b!1334171 (= lt!592554 (contains!8921 (getCurrentListMap!5709 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334172 () Bool)

(declare-fun res!885019 () Bool)

(assert (=> b!1334172 (=> (not res!885019) (not e!760171))))

(assert (=> b!1334172 (= res!885019 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44228 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334173 () Bool)

(assert (=> b!1334173 (= e!760172 tp_is_empty!36727)))

(declare-fun mapIsEmpty!56764 () Bool)

(assert (=> mapIsEmpty!56764 mapRes!56764))

(declare-fun res!885018 () Bool)

(assert (=> start!112646 (=> (not res!885018) (not e!760171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112646 (= res!885018 (validMask!0 mask!1998))))

(assert (=> start!112646 e!760171))

(declare-fun array_inv!33217 (array!90433) Bool)

(assert (=> start!112646 (and (array_inv!33217 _values!1320) e!760173)))

(assert (=> start!112646 true))

(declare-fun array_inv!33218 (array!90431) Bool)

(assert (=> start!112646 (array_inv!33218 _keys!1590)))

(assert (=> start!112646 tp!108087))

(assert (=> start!112646 tp_is_empty!36727))

(assert (= (and start!112646 res!885018) b!1334167))

(assert (= (and b!1334167 res!885020) b!1334166))

(assert (= (and b!1334166 res!885016) b!1334170))

(assert (= (and b!1334170 res!885017) b!1334172))

(assert (= (and b!1334172 res!885019) b!1334171))

(assert (= (and b!1334168 condMapEmpty!56764) mapIsEmpty!56764))

(assert (= (and b!1334168 (not condMapEmpty!56764)) mapNonEmpty!56764))

(get-info :version)

(assert (= (and mapNonEmpty!56764 ((_ is ValueCellFull!17465) mapValue!56764)) b!1334173))

(assert (= (and b!1334168 ((_ is ValueCellFull!17465) mapDefault!56764)) b!1334169))

(assert (= start!112646 b!1334168))

(declare-fun m!1223177 () Bool)

(assert (=> b!1334171 m!1223177))

(assert (=> b!1334171 m!1223177))

(declare-fun m!1223179 () Bool)

(assert (=> b!1334171 m!1223179))

(declare-fun m!1223181 () Bool)

(assert (=> start!112646 m!1223181))

(declare-fun m!1223183 () Bool)

(assert (=> start!112646 m!1223183))

(declare-fun m!1223185 () Bool)

(assert (=> start!112646 m!1223185))

(declare-fun m!1223187 () Bool)

(assert (=> mapNonEmpty!56764 m!1223187))

(declare-fun m!1223189 () Bool)

(assert (=> b!1334170 m!1223189))

(declare-fun m!1223191 () Bool)

(assert (=> b!1334166 m!1223191))

(check-sat (not b_next!30817) (not start!112646) (not b!1334166) (not mapNonEmpty!56764) (not b!1334170) tp_is_empty!36727 b_and!49661 (not b!1334171))
(check-sat b_and!49661 (not b_next!30817))
