; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112434 () Bool)

(assert start!112434)

(declare-fun b_free!30829 () Bool)

(declare-fun b_next!30829 () Bool)

(assert (=> start!112434 (= b_free!30829 (not b_next!30829))))

(declare-fun tp!108124 () Bool)

(declare-fun b_and!49653 () Bool)

(assert (=> start!112434 (= tp!108124 b_and!49653)))

(declare-fun mapIsEmpty!56782 () Bool)

(declare-fun mapRes!56782 () Bool)

(assert (=> mapIsEmpty!56782 mapRes!56782))

(declare-fun b!1332941 () Bool)

(declare-fun res!884562 () Bool)

(declare-fun e!759387 () Bool)

(assert (=> b!1332941 (=> (not res!884562) (not e!759387))))

(declare-datatypes ((array!90293 0))(
  ( (array!90294 (arr!43613 (Array (_ BitVec 32) (_ BitVec 64))) (size!44165 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90293)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90293 (_ BitVec 32)) Bool)

(assert (=> b!1332941 (= res!884562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332943 () Bool)

(declare-fun res!884560 () Bool)

(assert (=> b!1332943 (=> (not res!884560) (not e!759387))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332943 (= res!884560 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44165 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332944 () Bool)

(declare-fun res!884559 () Bool)

(assert (=> b!1332944 (=> (not res!884559) (not e!759387))))

(declare-datatypes ((List!30975 0))(
  ( (Nil!30972) (Cons!30971 (h!32180 (_ BitVec 64)) (t!45165 List!30975)) )
))
(declare-fun arrayNoDuplicates!0 (array!90293 (_ BitVec 32) List!30975) Bool)

(assert (=> b!1332944 (= res!884559 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30972))))

(declare-fun b!1332945 () Bool)

(declare-fun e!759388 () Bool)

(declare-fun tp_is_empty!36739 () Bool)

(assert (=> b!1332945 (= e!759388 tp_is_empty!36739)))

(declare-fun b!1332946 () Bool)

(declare-fun e!759386 () Bool)

(assert (=> b!1332946 (= e!759386 tp_is_empty!36739)))

(declare-fun mapNonEmpty!56782 () Bool)

(declare-fun tp!108125 () Bool)

(assert (=> mapNonEmpty!56782 (= mapRes!56782 (and tp!108125 e!759388))))

(declare-datatypes ((V!54089 0))(
  ( (V!54090 (val!18444 Int)) )
))
(declare-datatypes ((ValueCell!17471 0))(
  ( (ValueCellFull!17471 (v!21080 V!54089)) (EmptyCell!17471) )
))
(declare-fun mapValue!56782 () ValueCell!17471)

(declare-datatypes ((array!90295 0))(
  ( (array!90296 (arr!43614 (Array (_ BitVec 32) ValueCell!17471)) (size!44166 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90295)

(declare-fun mapKey!56782 () (_ BitVec 32))

(declare-fun mapRest!56782 () (Array (_ BitVec 32) ValueCell!17471))

(assert (=> mapNonEmpty!56782 (= (arr!43614 _values!1320) (store mapRest!56782 mapKey!56782 mapValue!56782))))

(declare-fun b!1332947 () Bool)

(declare-fun e!759384 () Bool)

(assert (=> b!1332947 (= e!759384 (and e!759386 mapRes!56782))))

(declare-fun condMapEmpty!56782 () Bool)

(declare-fun mapDefault!56782 () ValueCell!17471)

(assert (=> b!1332947 (= condMapEmpty!56782 (= (arr!43614 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17471)) mapDefault!56782)))))

(declare-fun b!1332948 () Bool)

(declare-fun res!884561 () Bool)

(assert (=> b!1332948 (=> (not res!884561) (not e!759387))))

(assert (=> b!1332948 (= res!884561 (and (= (size!44166 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44165 _keys!1590) (size!44166 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!884563 () Bool)

(assert (=> start!112434 (=> (not res!884563) (not e!759387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112434 (= res!884563 (validMask!0 mask!1998))))

(assert (=> start!112434 e!759387))

(declare-fun array_inv!33087 (array!90295) Bool)

(assert (=> start!112434 (and (array_inv!33087 _values!1320) e!759384)))

(assert (=> start!112434 true))

(declare-fun array_inv!33088 (array!90293) Bool)

(assert (=> start!112434 (array_inv!33088 _keys!1590)))

(assert (=> start!112434 tp!108124))

(assert (=> start!112434 tp_is_empty!36739))

(declare-fun b!1332942 () Bool)

(assert (=> b!1332942 (= e!759387 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!591910 () Bool)

(declare-fun minValue!1262 () V!54089)

(declare-fun zeroValue!1262 () V!54089)

(declare-datatypes ((tuple2!23838 0))(
  ( (tuple2!23839 (_1!11930 (_ BitVec 64)) (_2!11930 V!54089)) )
))
(declare-datatypes ((List!30976 0))(
  ( (Nil!30973) (Cons!30972 (h!32181 tuple2!23838) (t!45166 List!30976)) )
))
(declare-datatypes ((ListLongMap!21495 0))(
  ( (ListLongMap!21496 (toList!10763 List!30976)) )
))
(declare-fun contains!8855 (ListLongMap!21495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5623 (array!90293 array!90295 (_ BitVec 32) (_ BitVec 32) V!54089 V!54089 (_ BitVec 32) Int) ListLongMap!21495)

(assert (=> b!1332942 (= lt!591910 (contains!8855 (getCurrentListMap!5623 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112434 res!884563) b!1332948))

(assert (= (and b!1332948 res!884561) b!1332941))

(assert (= (and b!1332941 res!884562) b!1332944))

(assert (= (and b!1332944 res!884559) b!1332943))

(assert (= (and b!1332943 res!884560) b!1332942))

(assert (= (and b!1332947 condMapEmpty!56782) mapIsEmpty!56782))

(assert (= (and b!1332947 (not condMapEmpty!56782)) mapNonEmpty!56782))

(get-info :version)

(assert (= (and mapNonEmpty!56782 ((_ is ValueCellFull!17471) mapValue!56782)) b!1332945))

(assert (= (and b!1332947 ((_ is ValueCellFull!17471) mapDefault!56782)) b!1332946))

(assert (= start!112434 b!1332947))

(declare-fun m!1221159 () Bool)

(assert (=> b!1332941 m!1221159))

(declare-fun m!1221161 () Bool)

(assert (=> b!1332944 m!1221161))

(declare-fun m!1221163 () Bool)

(assert (=> start!112434 m!1221163))

(declare-fun m!1221165 () Bool)

(assert (=> start!112434 m!1221165))

(declare-fun m!1221167 () Bool)

(assert (=> start!112434 m!1221167))

(declare-fun m!1221169 () Bool)

(assert (=> mapNonEmpty!56782 m!1221169))

(declare-fun m!1221171 () Bool)

(assert (=> b!1332942 m!1221171))

(assert (=> b!1332942 m!1221171))

(declare-fun m!1221173 () Bool)

(assert (=> b!1332942 m!1221173))

(check-sat (not b!1332941) (not b!1332942) b_and!49653 tp_is_empty!36739 (not b!1332944) (not start!112434) (not b_next!30829) (not mapNonEmpty!56782))
(check-sat b_and!49653 (not b_next!30829))
