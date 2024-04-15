; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112446 () Bool)

(assert start!112446)

(declare-fun b_free!30841 () Bool)

(declare-fun b_next!30841 () Bool)

(assert (=> start!112446 (= b_free!30841 (not b_next!30841))))

(declare-fun tp!108160 () Bool)

(declare-fun b_and!49665 () Bool)

(assert (=> start!112446 (= tp!108160 b_and!49665)))

(declare-fun b!1333120 () Bool)

(declare-fun res!884687 () Bool)

(declare-fun e!759477 () Bool)

(assert (=> b!1333120 (=> (not res!884687) (not e!759477))))

(declare-datatypes ((array!90317 0))(
  ( (array!90318 (arr!43625 (Array (_ BitVec 32) (_ BitVec 64))) (size!44177 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90317)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90317 (_ BitVec 32)) Bool)

(assert (=> b!1333120 (= res!884687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333121 () Bool)

(declare-fun e!759478 () Bool)

(declare-fun tp_is_empty!36751 () Bool)

(assert (=> b!1333121 (= e!759478 tp_is_empty!36751)))

(declare-fun b!1333122 () Bool)

(declare-fun e!759474 () Bool)

(declare-fun mapRes!56800 () Bool)

(assert (=> b!1333122 (= e!759474 (and e!759478 mapRes!56800))))

(declare-fun condMapEmpty!56800 () Bool)

(declare-datatypes ((V!54105 0))(
  ( (V!54106 (val!18450 Int)) )
))
(declare-datatypes ((ValueCell!17477 0))(
  ( (ValueCellFull!17477 (v!21086 V!54105)) (EmptyCell!17477) )
))
(declare-datatypes ((array!90319 0))(
  ( (array!90320 (arr!43626 (Array (_ BitVec 32) ValueCell!17477)) (size!44178 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90319)

(declare-fun mapDefault!56800 () ValueCell!17477)

(assert (=> b!1333122 (= condMapEmpty!56800 (= (arr!43626 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17477)) mapDefault!56800)))))

(declare-fun b!1333124 () Bool)

(declare-fun e!759475 () Bool)

(assert (=> b!1333124 (= e!759475 tp_is_empty!36751)))

(declare-fun b!1333125 () Bool)

(declare-fun res!884686 () Bool)

(assert (=> b!1333125 (=> (not res!884686) (not e!759477))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333125 (= res!884686 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44177 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333126 () Bool)

(declare-fun res!884690 () Bool)

(assert (=> b!1333126 (=> (not res!884690) (not e!759477))))

(assert (=> b!1333126 (= res!884690 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun res!884688 () Bool)

(assert (=> start!112446 (=> (not res!884688) (not e!759477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112446 (= res!884688 (validMask!0 mask!1998))))

(assert (=> start!112446 e!759477))

(declare-fun array_inv!33099 (array!90319) Bool)

(assert (=> start!112446 (and (array_inv!33099 _values!1320) e!759474)))

(assert (=> start!112446 true))

(declare-fun array_inv!33100 (array!90317) Bool)

(assert (=> start!112446 (array_inv!33100 _keys!1590)))

(assert (=> start!112446 tp!108160))

(assert (=> start!112446 tp_is_empty!36751))

(declare-fun b!1333123 () Bool)

(declare-fun res!884684 () Bool)

(assert (=> b!1333123 (=> (not res!884684) (not e!759477))))

(assert (=> b!1333123 (= res!884684 (not (= (select (arr!43625 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333127 () Bool)

(declare-fun res!884685 () Bool)

(assert (=> b!1333127 (=> (not res!884685) (not e!759477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333127 (= res!884685 (validKeyInArray!0 (select (arr!43625 _keys!1590) from!1980)))))

(declare-fun b!1333128 () Bool)

(assert (=> b!1333128 (= e!759477 false)))

(declare-fun minValue!1262 () V!54105)

(declare-fun zeroValue!1262 () V!54105)

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!591919 () Bool)

(declare-datatypes ((tuple2!23844 0))(
  ( (tuple2!23845 (_1!11933 (_ BitVec 64)) (_2!11933 V!54105)) )
))
(declare-datatypes ((List!30984 0))(
  ( (Nil!30981) (Cons!30980 (h!32189 tuple2!23844) (t!45176 List!30984)) )
))
(declare-datatypes ((ListLongMap!21501 0))(
  ( (ListLongMap!21502 (toList!10766 List!30984)) )
))
(declare-fun contains!8858 (ListLongMap!21501 (_ BitVec 64)) Bool)

(declare-fun +!4729 (ListLongMap!21501 tuple2!23844) ListLongMap!21501)

(declare-fun getCurrentListMapNoExtraKeys!6367 (array!90317 array!90319 (_ BitVec 32) (_ BitVec 32) V!54105 V!54105 (_ BitVec 32) Int) ListLongMap!21501)

(declare-fun get!22006 (ValueCell!17477 V!54105) V!54105)

(declare-fun dynLambda!3659 (Int (_ BitVec 64)) V!54105)

(assert (=> b!1333128 (= lt!591919 (contains!8858 (+!4729 (getCurrentListMapNoExtraKeys!6367 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23845 (select (arr!43625 _keys!1590) from!1980) (get!22006 (select (arr!43626 _values!1320) from!1980) (dynLambda!3659 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1333129 () Bool)

(declare-fun res!884692 () Bool)

(assert (=> b!1333129 (=> (not res!884692) (not e!759477))))

(declare-datatypes ((List!30985 0))(
  ( (Nil!30982) (Cons!30981 (h!32190 (_ BitVec 64)) (t!45177 List!30985)) )
))
(declare-fun arrayNoDuplicates!0 (array!90317 (_ BitVec 32) List!30985) Bool)

(assert (=> b!1333129 (= res!884692 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30982))))

(declare-fun b!1333130 () Bool)

(declare-fun res!884689 () Bool)

(assert (=> b!1333130 (=> (not res!884689) (not e!759477))))

(declare-fun getCurrentListMap!5626 (array!90317 array!90319 (_ BitVec 32) (_ BitVec 32) V!54105 V!54105 (_ BitVec 32) Int) ListLongMap!21501)

(assert (=> b!1333130 (= res!884689 (contains!8858 (getCurrentListMap!5626 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56800 () Bool)

(declare-fun tp!108161 () Bool)

(assert (=> mapNonEmpty!56800 (= mapRes!56800 (and tp!108161 e!759475))))

(declare-fun mapRest!56800 () (Array (_ BitVec 32) ValueCell!17477))

(declare-fun mapKey!56800 () (_ BitVec 32))

(declare-fun mapValue!56800 () ValueCell!17477)

(assert (=> mapNonEmpty!56800 (= (arr!43626 _values!1320) (store mapRest!56800 mapKey!56800 mapValue!56800))))

(declare-fun mapIsEmpty!56800 () Bool)

(assert (=> mapIsEmpty!56800 mapRes!56800))

(declare-fun b!1333131 () Bool)

(declare-fun res!884691 () Bool)

(assert (=> b!1333131 (=> (not res!884691) (not e!759477))))

(assert (=> b!1333131 (= res!884691 (and (= (size!44178 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44177 _keys!1590) (size!44178 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112446 res!884688) b!1333131))

(assert (= (and b!1333131 res!884691) b!1333120))

(assert (= (and b!1333120 res!884687) b!1333129))

(assert (= (and b!1333129 res!884692) b!1333125))

(assert (= (and b!1333125 res!884686) b!1333130))

(assert (= (and b!1333130 res!884689) b!1333123))

(assert (= (and b!1333123 res!884684) b!1333127))

(assert (= (and b!1333127 res!884685) b!1333126))

(assert (= (and b!1333126 res!884690) b!1333128))

(assert (= (and b!1333122 condMapEmpty!56800) mapIsEmpty!56800))

(assert (= (and b!1333122 (not condMapEmpty!56800)) mapNonEmpty!56800))

(get-info :version)

(assert (= (and mapNonEmpty!56800 ((_ is ValueCellFull!17477) mapValue!56800)) b!1333124))

(assert (= (and b!1333122 ((_ is ValueCellFull!17477) mapDefault!56800)) b!1333121))

(assert (= start!112446 b!1333122))

(declare-fun b_lambda!24037 () Bool)

(assert (=> (not b_lambda!24037) (not b!1333128)))

(declare-fun t!45175 () Bool)

(declare-fun tb!11995 () Bool)

(assert (=> (and start!112446 (= defaultEntry!1323 defaultEntry!1323) t!45175) tb!11995))

(declare-fun result!25069 () Bool)

(assert (=> tb!11995 (= result!25069 tp_is_empty!36751)))

(assert (=> b!1333128 t!45175))

(declare-fun b_and!49667 () Bool)

(assert (= b_and!49665 (and (=> t!45175 result!25069) b_and!49667)))

(declare-fun m!1221267 () Bool)

(assert (=> start!112446 m!1221267))

(declare-fun m!1221269 () Bool)

(assert (=> start!112446 m!1221269))

(declare-fun m!1221271 () Bool)

(assert (=> start!112446 m!1221271))

(declare-fun m!1221273 () Bool)

(assert (=> b!1333129 m!1221273))

(declare-fun m!1221275 () Bool)

(assert (=> mapNonEmpty!56800 m!1221275))

(declare-fun m!1221277 () Bool)

(assert (=> b!1333123 m!1221277))

(declare-fun m!1221279 () Bool)

(assert (=> b!1333128 m!1221279))

(declare-fun m!1221281 () Bool)

(assert (=> b!1333128 m!1221281))

(declare-fun m!1221283 () Bool)

(assert (=> b!1333128 m!1221283))

(declare-fun m!1221285 () Bool)

(assert (=> b!1333128 m!1221285))

(assert (=> b!1333128 m!1221279))

(declare-fun m!1221287 () Bool)

(assert (=> b!1333128 m!1221287))

(assert (=> b!1333128 m!1221283))

(declare-fun m!1221289 () Bool)

(assert (=> b!1333128 m!1221289))

(assert (=> b!1333128 m!1221281))

(assert (=> b!1333128 m!1221285))

(assert (=> b!1333128 m!1221277))

(declare-fun m!1221291 () Bool)

(assert (=> b!1333130 m!1221291))

(assert (=> b!1333130 m!1221291))

(declare-fun m!1221293 () Bool)

(assert (=> b!1333130 m!1221293))

(assert (=> b!1333127 m!1221277))

(assert (=> b!1333127 m!1221277))

(declare-fun m!1221295 () Bool)

(assert (=> b!1333127 m!1221295))

(declare-fun m!1221297 () Bool)

(assert (=> b!1333120 m!1221297))

(check-sat (not b_lambda!24037) (not b!1333129) (not mapNonEmpty!56800) (not b!1333128) (not start!112446) (not b_next!30841) (not b!1333120) b_and!49667 (not b!1333130) tp_is_empty!36751 (not b!1333127))
(check-sat b_and!49667 (not b_next!30841))
