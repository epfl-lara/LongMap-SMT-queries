; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70644 () Bool)

(assert start!70644)

(declare-fun b_free!12805 () Bool)

(declare-fun b_next!12805 () Bool)

(assert (=> start!70644 (= b_free!12805 (not b_next!12805))))

(declare-fun tp!45148 () Bool)

(declare-fun b_and!21645 () Bool)

(assert (=> start!70644 (= tp!45148 b_and!21645)))

(declare-fun b!819519 () Bool)

(declare-fun res!558997 () Bool)

(declare-fun e!455027 () Bool)

(assert (=> b!819519 (=> (not res!558997) (not e!455027))))

(declare-datatypes ((array!45231 0))(
  ( (array!45232 (arr!21665 (Array (_ BitVec 32) (_ BitVec 64))) (size!22085 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45231)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24355 0))(
  ( (V!24356 (val!7305 Int)) )
))
(declare-datatypes ((ValueCell!6842 0))(
  ( (ValueCellFull!6842 (v!9734 V!24355)) (EmptyCell!6842) )
))
(declare-datatypes ((array!45233 0))(
  ( (array!45234 (arr!21666 (Array (_ BitVec 32) ValueCell!6842)) (size!22086 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45233)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819519 (= res!558997 (and (= (size!22086 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22085 _keys!976) (size!22086 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819520 () Bool)

(declare-fun e!455028 () Bool)

(declare-fun e!455029 () Bool)

(declare-fun mapRes!23371 () Bool)

(assert (=> b!819520 (= e!455028 (and e!455029 mapRes!23371))))

(declare-fun condMapEmpty!23371 () Bool)

(declare-fun mapDefault!23371 () ValueCell!6842)

(assert (=> b!819520 (= condMapEmpty!23371 (= (arr!21666 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6842)) mapDefault!23371)))))

(declare-fun b!819522 () Bool)

(declare-fun res!558998 () Bool)

(assert (=> b!819522 (=> (not res!558998) (not e!455027))))

(declare-datatypes ((List!15325 0))(
  ( (Nil!15322) (Cons!15321 (h!16456 (_ BitVec 64)) (t!21646 List!15325)) )
))
(declare-fun arrayNoDuplicates!0 (array!45231 (_ BitVec 32) List!15325) Bool)

(assert (=> b!819522 (= res!558998 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15322))))

(declare-fun b!819523 () Bool)

(declare-fun res!558996 () Bool)

(assert (=> b!819523 (=> (not res!558996) (not e!455027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45231 (_ BitVec 32)) Bool)

(assert (=> b!819523 (= res!558996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819524 () Bool)

(declare-fun tp_is_empty!14515 () Bool)

(assert (=> b!819524 (= e!455029 tp_is_empty!14515)))

(declare-fun b!819525 () Bool)

(declare-fun e!455026 () Bool)

(assert (=> b!819525 (= e!455026 true)))

(declare-datatypes ((tuple2!9514 0))(
  ( (tuple2!9515 (_1!4768 (_ BitVec 64)) (_2!4768 V!24355)) )
))
(declare-datatypes ((List!15326 0))(
  ( (Nil!15323) (Cons!15322 (h!16457 tuple2!9514) (t!21647 List!15326)) )
))
(declare-datatypes ((ListLongMap!8339 0))(
  ( (ListLongMap!8340 (toList!4185 List!15326)) )
))
(declare-fun lt!367221 () ListLongMap!8339)

(declare-fun lt!367222 () tuple2!9514)

(declare-fun lt!367225 () ListLongMap!8339)

(declare-fun lt!367218 () tuple2!9514)

(declare-fun +!1824 (ListLongMap!8339 tuple2!9514) ListLongMap!8339)

(assert (=> b!819525 (= lt!367225 (+!1824 (+!1824 lt!367221 lt!367222) lt!367218))))

(declare-fun lt!367224 () ListLongMap!8339)

(declare-fun lt!367223 () ListLongMap!8339)

(assert (=> b!819525 (= (+!1824 lt!367224 lt!367218) (+!1824 lt!367223 lt!367218))))

(declare-datatypes ((Unit!27922 0))(
  ( (Unit!27923) )
))
(declare-fun lt!367220 () Unit!27922)

(declare-fun zeroValueBefore!34 () V!24355)

(declare-fun zeroValueAfter!34 () V!24355)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!167 (ListLongMap!8339 (_ BitVec 64) V!24355 V!24355) Unit!27922)

(assert (=> b!819525 (= lt!367220 (addSameAsAddTwiceSameKeyDiffValues!167 lt!367224 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819525 (= lt!367218 (tuple2!9515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455023 () Bool)

(assert (=> b!819525 e!455023))

(declare-fun res!558999 () Bool)

(assert (=> b!819525 (=> (not res!558999) (not e!455023))))

(declare-fun lt!367219 () ListLongMap!8339)

(assert (=> b!819525 (= res!558999 (= lt!367219 lt!367223))))

(assert (=> b!819525 (= lt!367223 (+!1824 lt!367224 lt!367222))))

(assert (=> b!819525 (= lt!367222 (tuple2!9515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367217 () ListLongMap!8339)

(declare-fun minValue!754 () V!24355)

(declare-fun getCurrentListMap!2380 (array!45231 array!45233 (_ BitVec 32) (_ BitVec 32) V!24355 V!24355 (_ BitVec 32) Int) ListLongMap!8339)

(assert (=> b!819525 (= lt!367217 (getCurrentListMap!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819525 (= lt!367219 (getCurrentListMap!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23371 () Bool)

(declare-fun tp!45147 () Bool)

(declare-fun e!455025 () Bool)

(assert (=> mapNonEmpty!23371 (= mapRes!23371 (and tp!45147 e!455025))))

(declare-fun mapValue!23371 () ValueCell!6842)

(declare-fun mapKey!23371 () (_ BitVec 32))

(declare-fun mapRest!23371 () (Array (_ BitVec 32) ValueCell!6842))

(assert (=> mapNonEmpty!23371 (= (arr!21666 _values!788) (store mapRest!23371 mapKey!23371 mapValue!23371))))

(declare-fun b!819526 () Bool)

(assert (=> b!819526 (= e!455027 (not e!455026))))

(declare-fun res!559000 () Bool)

(assert (=> b!819526 (=> res!559000 e!455026)))

(assert (=> b!819526 (= res!559000 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819526 (= lt!367224 lt!367221)))

(declare-fun lt!367226 () Unit!27922)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!370 (array!45231 array!45233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24355 V!24355 V!24355 V!24355 (_ BitVec 32) Int) Unit!27922)

(assert (=> b!819526 (= lt!367226 (lemmaNoChangeToArrayThenSameMapNoExtras!370 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2282 (array!45231 array!45233 (_ BitVec 32) (_ BitVec 32) V!24355 V!24355 (_ BitVec 32) Int) ListLongMap!8339)

(assert (=> b!819526 (= lt!367221 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819526 (= lt!367224 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819521 () Bool)

(assert (=> b!819521 (= e!455023 (= lt!367217 (+!1824 lt!367221 (tuple2!9515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!558995 () Bool)

(assert (=> start!70644 (=> (not res!558995) (not e!455027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70644 (= res!558995 (validMask!0 mask!1312))))

(assert (=> start!70644 e!455027))

(assert (=> start!70644 tp_is_empty!14515))

(declare-fun array_inv!17351 (array!45231) Bool)

(assert (=> start!70644 (array_inv!17351 _keys!976)))

(assert (=> start!70644 true))

(declare-fun array_inv!17352 (array!45233) Bool)

(assert (=> start!70644 (and (array_inv!17352 _values!788) e!455028)))

(assert (=> start!70644 tp!45148))

(declare-fun mapIsEmpty!23371 () Bool)

(assert (=> mapIsEmpty!23371 mapRes!23371))

(declare-fun b!819527 () Bool)

(assert (=> b!819527 (= e!455025 tp_is_empty!14515)))

(assert (= (and start!70644 res!558995) b!819519))

(assert (= (and b!819519 res!558997) b!819523))

(assert (= (and b!819523 res!558996) b!819522))

(assert (= (and b!819522 res!558998) b!819526))

(assert (= (and b!819526 (not res!559000)) b!819525))

(assert (= (and b!819525 res!558999) b!819521))

(assert (= (and b!819520 condMapEmpty!23371) mapIsEmpty!23371))

(assert (= (and b!819520 (not condMapEmpty!23371)) mapNonEmpty!23371))

(get-info :version)

(assert (= (and mapNonEmpty!23371 ((_ is ValueCellFull!6842) mapValue!23371)) b!819527))

(assert (= (and b!819520 ((_ is ValueCellFull!6842) mapDefault!23371)) b!819524))

(assert (= start!70644 b!819520))

(declare-fun m!761279 () Bool)

(assert (=> b!819526 m!761279))

(declare-fun m!761281 () Bool)

(assert (=> b!819526 m!761281))

(declare-fun m!761283 () Bool)

(assert (=> b!819526 m!761283))

(declare-fun m!761285 () Bool)

(assert (=> b!819523 m!761285))

(declare-fun m!761287 () Bool)

(assert (=> b!819525 m!761287))

(declare-fun m!761289 () Bool)

(assert (=> b!819525 m!761289))

(declare-fun m!761291 () Bool)

(assert (=> b!819525 m!761291))

(declare-fun m!761293 () Bool)

(assert (=> b!819525 m!761293))

(assert (=> b!819525 m!761287))

(declare-fun m!761295 () Bool)

(assert (=> b!819525 m!761295))

(declare-fun m!761297 () Bool)

(assert (=> b!819525 m!761297))

(declare-fun m!761299 () Bool)

(assert (=> b!819525 m!761299))

(declare-fun m!761301 () Bool)

(assert (=> b!819525 m!761301))

(declare-fun m!761303 () Bool)

(assert (=> mapNonEmpty!23371 m!761303))

(declare-fun m!761305 () Bool)

(assert (=> b!819522 m!761305))

(declare-fun m!761307 () Bool)

(assert (=> start!70644 m!761307))

(declare-fun m!761309 () Bool)

(assert (=> start!70644 m!761309))

(declare-fun m!761311 () Bool)

(assert (=> start!70644 m!761311))

(declare-fun m!761313 () Bool)

(assert (=> b!819521 m!761313))

(check-sat b_and!21645 (not b!819525) tp_is_empty!14515 (not b_next!12805) (not b!819522) (not b!819523) (not start!70644) (not b!819526) (not mapNonEmpty!23371) (not b!819521))
(check-sat b_and!21645 (not b_next!12805))
