; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112406 () Bool)

(assert start!112406)

(declare-fun b_free!30577 () Bool)

(declare-fun b_next!30577 () Bool)

(assert (=> start!112406 (= b_free!30577 (not b_next!30577))))

(declare-fun tp!107368 () Bool)

(declare-fun b_and!49229 () Bool)

(assert (=> start!112406 (= tp!107368 b_and!49229)))

(declare-fun b!1329915 () Bool)

(declare-fun e!758373 () Bool)

(assert (=> b!1329915 (= e!758373 false)))

(declare-datatypes ((V!53753 0))(
  ( (V!53754 (val!18318 Int)) )
))
(declare-datatypes ((ValueCell!17345 0))(
  ( (ValueCellFull!17345 (v!20950 V!53753)) (EmptyCell!17345) )
))
(declare-datatypes ((array!89975 0))(
  ( (array!89976 (arr!43449 (Array (_ BitVec 32) ValueCell!17345)) (size!44000 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89975)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89977 0))(
  ( (array!89978 (arr!43450 (Array (_ BitVec 32) (_ BitVec 64))) (size!44001 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89977)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!591339 () Bool)

(declare-fun minValue!1262 () V!53753)

(declare-fun zeroValue!1262 () V!53753)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23604 0))(
  ( (tuple2!23605 (_1!11813 (_ BitVec 64)) (_2!11813 V!53753)) )
))
(declare-datatypes ((List!30780 0))(
  ( (Nil!30777) (Cons!30776 (h!31994 tuple2!23604) (t!44778 List!30780)) )
))
(declare-datatypes ((ListLongMap!21269 0))(
  ( (ListLongMap!21270 (toList!10650 List!30780)) )
))
(declare-fun contains!8826 (ListLongMap!21269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5627 (array!89977 array!89975 (_ BitVec 32) (_ BitVec 32) V!53753 V!53753 (_ BitVec 32) Int) ListLongMap!21269)

(assert (=> b!1329915 (= lt!591339 (contains!8826 (getCurrentListMap!5627 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329916 () Bool)

(declare-fun res!882039 () Bool)

(assert (=> b!1329916 (=> (not res!882039) (not e!758373))))

(assert (=> b!1329916 (= res!882039 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44001 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329917 () Bool)

(declare-fun res!882037 () Bool)

(assert (=> b!1329917 (=> (not res!882037) (not e!758373))))

(declare-datatypes ((List!30781 0))(
  ( (Nil!30778) (Cons!30777 (h!31995 (_ BitVec 64)) (t!44779 List!30781)) )
))
(declare-fun arrayNoDuplicates!0 (array!89977 (_ BitVec 32) List!30781) Bool)

(assert (=> b!1329917 (= res!882037 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30778))))

(declare-fun b!1329918 () Bool)

(declare-fun e!758374 () Bool)

(declare-fun e!758372 () Bool)

(declare-fun mapRes!56404 () Bool)

(assert (=> b!1329918 (= e!758374 (and e!758372 mapRes!56404))))

(declare-fun condMapEmpty!56404 () Bool)

(declare-fun mapDefault!56404 () ValueCell!17345)

(assert (=> b!1329918 (= condMapEmpty!56404 (= (arr!43449 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17345)) mapDefault!56404)))))

(declare-fun b!1329919 () Bool)

(declare-fun tp_is_empty!36487 () Bool)

(assert (=> b!1329919 (= e!758372 tp_is_empty!36487)))

(declare-fun res!882040 () Bool)

(assert (=> start!112406 (=> (not res!882040) (not e!758373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112406 (= res!882040 (validMask!0 mask!1998))))

(assert (=> start!112406 e!758373))

(declare-fun array_inv!33063 (array!89975) Bool)

(assert (=> start!112406 (and (array_inv!33063 _values!1320) e!758374)))

(assert (=> start!112406 true))

(declare-fun array_inv!33064 (array!89977) Bool)

(assert (=> start!112406 (array_inv!33064 _keys!1590)))

(assert (=> start!112406 tp!107368))

(assert (=> start!112406 tp_is_empty!36487))

(declare-fun b!1329920 () Bool)

(declare-fun e!758371 () Bool)

(assert (=> b!1329920 (= e!758371 tp_is_empty!36487)))

(declare-fun b!1329921 () Bool)

(declare-fun res!882041 () Bool)

(assert (=> b!1329921 (=> (not res!882041) (not e!758373))))

(assert (=> b!1329921 (= res!882041 (and (= (size!44000 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44001 _keys!1590) (size!44000 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56404 () Bool)

(declare-fun tp!107367 () Bool)

(assert (=> mapNonEmpty!56404 (= mapRes!56404 (and tp!107367 e!758371))))

(declare-fun mapValue!56404 () ValueCell!17345)

(declare-fun mapKey!56404 () (_ BitVec 32))

(declare-fun mapRest!56404 () (Array (_ BitVec 32) ValueCell!17345))

(assert (=> mapNonEmpty!56404 (= (arr!43449 _values!1320) (store mapRest!56404 mapKey!56404 mapValue!56404))))

(declare-fun mapIsEmpty!56404 () Bool)

(assert (=> mapIsEmpty!56404 mapRes!56404))

(declare-fun b!1329922 () Bool)

(declare-fun res!882038 () Bool)

(assert (=> b!1329922 (=> (not res!882038) (not e!758373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89977 (_ BitVec 32)) Bool)

(assert (=> b!1329922 (= res!882038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112406 res!882040) b!1329921))

(assert (= (and b!1329921 res!882041) b!1329922))

(assert (= (and b!1329922 res!882038) b!1329917))

(assert (= (and b!1329917 res!882037) b!1329916))

(assert (= (and b!1329916 res!882039) b!1329915))

(assert (= (and b!1329918 condMapEmpty!56404) mapIsEmpty!56404))

(assert (= (and b!1329918 (not condMapEmpty!56404)) mapNonEmpty!56404))

(get-info :version)

(assert (= (and mapNonEmpty!56404 ((_ is ValueCellFull!17345) mapValue!56404)) b!1329920))

(assert (= (and b!1329918 ((_ is ValueCellFull!17345) mapDefault!56404)) b!1329919))

(assert (= start!112406 b!1329918))

(declare-fun m!1219127 () Bool)

(assert (=> b!1329915 m!1219127))

(assert (=> b!1329915 m!1219127))

(declare-fun m!1219129 () Bool)

(assert (=> b!1329915 m!1219129))

(declare-fun m!1219131 () Bool)

(assert (=> mapNonEmpty!56404 m!1219131))

(declare-fun m!1219133 () Bool)

(assert (=> b!1329922 m!1219133))

(declare-fun m!1219135 () Bool)

(assert (=> start!112406 m!1219135))

(declare-fun m!1219137 () Bool)

(assert (=> start!112406 m!1219137))

(declare-fun m!1219139 () Bool)

(assert (=> start!112406 m!1219139))

(declare-fun m!1219141 () Bool)

(assert (=> b!1329917 m!1219141))

(check-sat tp_is_empty!36487 (not b!1329917) (not mapNonEmpty!56404) (not start!112406) (not b!1329922) (not b!1329915) b_and!49229 (not b_next!30577))
(check-sat b_and!49229 (not b_next!30577))
