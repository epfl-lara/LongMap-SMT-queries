; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112658 () Bool)

(assert start!112658)

(declare-fun b_free!30829 () Bool)

(declare-fun b_next!30829 () Bool)

(assert (=> start!112658 (= b_free!30829 (not b_next!30829))))

(declare-fun tp!108123 () Bool)

(declare-fun b_and!49673 () Bool)

(assert (=> start!112658 (= tp!108123 b_and!49673)))

(declare-fun mapIsEmpty!56782 () Bool)

(declare-fun mapRes!56782 () Bool)

(assert (=> mapIsEmpty!56782 mapRes!56782))

(declare-fun b!1334310 () Bool)

(declare-fun res!885110 () Bool)

(declare-fun e!760262 () Bool)

(assert (=> b!1334310 (=> (not res!885110) (not e!760262))))

(declare-datatypes ((array!90455 0))(
  ( (array!90456 (arr!43689 (Array (_ BitVec 32) (_ BitVec 64))) (size!44240 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90455)

(declare-datatypes ((List!30959 0))(
  ( (Nil!30956) (Cons!30955 (h!32173 (_ BitVec 64)) (t!45149 List!30959)) )
))
(declare-fun arrayNoDuplicates!0 (array!90455 (_ BitVec 32) List!30959) Bool)

(assert (=> b!1334310 (= res!885110 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30956))))

(declare-fun b!1334311 () Bool)

(declare-fun res!885109 () Bool)

(assert (=> b!1334311 (=> (not res!885109) (not e!760262))))

(declare-datatypes ((V!54089 0))(
  ( (V!54090 (val!18444 Int)) )
))
(declare-datatypes ((ValueCell!17471 0))(
  ( (ValueCellFull!17471 (v!21076 V!54089)) (EmptyCell!17471) )
))
(declare-datatypes ((array!90457 0))(
  ( (array!90458 (arr!43690 (Array (_ BitVec 32) ValueCell!17471)) (size!44241 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90457)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334311 (= res!885109 (and (= (size!44241 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44240 _keys!1590) (size!44241 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334312 () Bool)

(declare-fun e!760261 () Bool)

(declare-fun e!760264 () Bool)

(assert (=> b!1334312 (= e!760261 (and e!760264 mapRes!56782))))

(declare-fun condMapEmpty!56782 () Bool)

(declare-fun mapDefault!56782 () ValueCell!17471)

(assert (=> b!1334312 (= condMapEmpty!56782 (= (arr!43690 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17471)) mapDefault!56782)))))

(declare-fun res!885108 () Bool)

(assert (=> start!112658 (=> (not res!885108) (not e!760262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112658 (= res!885108 (validMask!0 mask!1998))))

(assert (=> start!112658 e!760262))

(declare-fun array_inv!33227 (array!90457) Bool)

(assert (=> start!112658 (and (array_inv!33227 _values!1320) e!760261)))

(assert (=> start!112658 true))

(declare-fun array_inv!33228 (array!90455) Bool)

(assert (=> start!112658 (array_inv!33228 _keys!1590)))

(assert (=> start!112658 tp!108123))

(declare-fun tp_is_empty!36739 () Bool)

(assert (=> start!112658 tp_is_empty!36739))

(declare-fun b!1334313 () Bool)

(assert (=> b!1334313 (= e!760264 tp_is_empty!36739)))

(declare-fun b!1334314 () Bool)

(declare-fun res!885106 () Bool)

(assert (=> b!1334314 (=> (not res!885106) (not e!760262))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334314 (= res!885106 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44240 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56782 () Bool)

(declare-fun tp!108124 () Bool)

(declare-fun e!760260 () Bool)

(assert (=> mapNonEmpty!56782 (= mapRes!56782 (and tp!108124 e!760260))))

(declare-fun mapKey!56782 () (_ BitVec 32))

(declare-fun mapValue!56782 () ValueCell!17471)

(declare-fun mapRest!56782 () (Array (_ BitVec 32) ValueCell!17471))

(assert (=> mapNonEmpty!56782 (= (arr!43690 _values!1320) (store mapRest!56782 mapKey!56782 mapValue!56782))))

(declare-fun b!1334315 () Bool)

(assert (=> b!1334315 (= e!760262 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54089)

(declare-fun zeroValue!1262 () V!54089)

(declare-fun lt!592572 () Bool)

(declare-datatypes ((tuple2!23802 0))(
  ( (tuple2!23803 (_1!11912 (_ BitVec 64)) (_2!11912 V!54089)) )
))
(declare-datatypes ((List!30960 0))(
  ( (Nil!30957) (Cons!30956 (h!32174 tuple2!23802) (t!45150 List!30960)) )
))
(declare-datatypes ((ListLongMap!21467 0))(
  ( (ListLongMap!21468 (toList!10749 List!30960)) )
))
(declare-fun contains!8925 (ListLongMap!21467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5713 (array!90455 array!90457 (_ BitVec 32) (_ BitVec 32) V!54089 V!54089 (_ BitVec 32) Int) ListLongMap!21467)

(assert (=> b!1334315 (= lt!592572 (contains!8925 (getCurrentListMap!5713 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334316 () Bool)

(declare-fun res!885107 () Bool)

(assert (=> b!1334316 (=> (not res!885107) (not e!760262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90455 (_ BitVec 32)) Bool)

(assert (=> b!1334316 (= res!885107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334317 () Bool)

(assert (=> b!1334317 (= e!760260 tp_is_empty!36739)))

(assert (= (and start!112658 res!885108) b!1334311))

(assert (= (and b!1334311 res!885109) b!1334316))

(assert (= (and b!1334316 res!885107) b!1334310))

(assert (= (and b!1334310 res!885110) b!1334314))

(assert (= (and b!1334314 res!885106) b!1334315))

(assert (= (and b!1334312 condMapEmpty!56782) mapIsEmpty!56782))

(assert (= (and b!1334312 (not condMapEmpty!56782)) mapNonEmpty!56782))

(get-info :version)

(assert (= (and mapNonEmpty!56782 ((_ is ValueCellFull!17471) mapValue!56782)) b!1334317))

(assert (= (and b!1334312 ((_ is ValueCellFull!17471) mapDefault!56782)) b!1334313))

(assert (= start!112658 b!1334312))

(declare-fun m!1223273 () Bool)

(assert (=> mapNonEmpty!56782 m!1223273))

(declare-fun m!1223275 () Bool)

(assert (=> b!1334310 m!1223275))

(declare-fun m!1223277 () Bool)

(assert (=> start!112658 m!1223277))

(declare-fun m!1223279 () Bool)

(assert (=> start!112658 m!1223279))

(declare-fun m!1223281 () Bool)

(assert (=> start!112658 m!1223281))

(declare-fun m!1223283 () Bool)

(assert (=> b!1334315 m!1223283))

(assert (=> b!1334315 m!1223283))

(declare-fun m!1223285 () Bool)

(assert (=> b!1334315 m!1223285))

(declare-fun m!1223287 () Bool)

(assert (=> b!1334316 m!1223287))

(check-sat b_and!49673 (not mapNonEmpty!56782) (not b!1334310) (not b_next!30829) tp_is_empty!36739 (not b!1334316) (not start!112658) (not b!1334315))
(check-sat b_and!49673 (not b_next!30829))
