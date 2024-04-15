; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70532 () Bool)

(assert start!70532)

(declare-fun b_free!12859 () Bool)

(declare-fun b_next!12859 () Bool)

(assert (=> start!70532 (= b_free!12859 (not b_next!12859))))

(declare-fun tp!45312 () Bool)

(declare-fun b_and!21675 () Bool)

(assert (=> start!70532 (= tp!45312 b_and!21675)))

(declare-fun b!819302 () Bool)

(declare-fun e!454988 () Bool)

(declare-fun tp_is_empty!14569 () Bool)

(assert (=> b!819302 (= e!454988 tp_is_empty!14569)))

(declare-fun b!819303 () Bool)

(declare-fun e!454987 () Bool)

(declare-fun mapRes!23455 () Bool)

(assert (=> b!819303 (= e!454987 (and e!454988 mapRes!23455))))

(declare-fun condMapEmpty!23455 () Bool)

(declare-datatypes ((V!24427 0))(
  ( (V!24428 (val!7332 Int)) )
))
(declare-datatypes ((ValueCell!6869 0))(
  ( (ValueCellFull!6869 (v!9756 V!24427)) (EmptyCell!6869) )
))
(declare-datatypes ((array!45311 0))(
  ( (array!45312 (arr!21709 (Array (_ BitVec 32) ValueCell!6869)) (size!22130 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45311)

(declare-fun mapDefault!23455 () ValueCell!6869)

(assert (=> b!819303 (= condMapEmpty!23455 (= (arr!21709 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6869)) mapDefault!23455)))))

(declare-fun b!819304 () Bool)

(declare-fun res!559123 () Bool)

(declare-fun e!454986 () Bool)

(assert (=> b!819304 (=> (not res!559123) (not e!454986))))

(declare-datatypes ((array!45313 0))(
  ( (array!45314 (arr!21710 (Array (_ BitVec 32) (_ BitVec 64))) (size!22131 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45313)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819304 (= res!559123 (and (= (size!22130 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22131 _keys!976) (size!22130 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!454991 () Bool)

(declare-fun zeroValueAfter!34 () V!24427)

(declare-fun b!819305 () Bool)

(declare-datatypes ((tuple2!9666 0))(
  ( (tuple2!9667 (_1!4844 (_ BitVec 64)) (_2!4844 V!24427)) )
))
(declare-datatypes ((List!15486 0))(
  ( (Nil!15483) (Cons!15482 (h!16611 tuple2!9666) (t!21808 List!15486)) )
))
(declare-datatypes ((ListLongMap!8479 0))(
  ( (ListLongMap!8480 (toList!4255 List!15486)) )
))
(declare-fun lt!367589 () ListLongMap!8479)

(declare-fun lt!367590 () ListLongMap!8479)

(declare-fun +!1876 (ListLongMap!8479 tuple2!9666) ListLongMap!8479)

(assert (=> b!819305 (= e!454991 (= lt!367589 (+!1876 lt!367590 (tuple2!9667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819306 () Bool)

(declare-fun e!454989 () Bool)

(assert (=> b!819306 (= e!454986 (not e!454989))))

(declare-fun res!559124 () Bool)

(assert (=> b!819306 (=> res!559124 e!454989)))

(assert (=> b!819306 (= res!559124 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!367586 () ListLongMap!8479)

(assert (=> b!819306 (= lt!367586 lt!367590)))

(declare-fun zeroValueBefore!34 () V!24427)

(declare-fun minValue!754 () V!24427)

(declare-datatypes ((Unit!27937 0))(
  ( (Unit!27938) )
))
(declare-fun lt!367592 () Unit!27937)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!403 (array!45313 array!45311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 V!24427 V!24427 (_ BitVec 32) Int) Unit!27937)

(assert (=> b!819306 (= lt!367592 (lemmaNoChangeToArrayThenSameMapNoExtras!403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2310 (array!45313 array!45311 (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 (_ BitVec 32) Int) ListLongMap!8479)

(assert (=> b!819306 (= lt!367590 (getCurrentListMapNoExtraKeys!2310 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819306 (= lt!367586 (getCurrentListMapNoExtraKeys!2310 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819307 () Bool)

(declare-fun res!559126 () Bool)

(assert (=> b!819307 (=> (not res!559126) (not e!454986))))

(declare-datatypes ((List!15487 0))(
  ( (Nil!15484) (Cons!15483 (h!16612 (_ BitVec 64)) (t!21809 List!15487)) )
))
(declare-fun arrayNoDuplicates!0 (array!45313 (_ BitVec 32) List!15487) Bool)

(assert (=> b!819307 (= res!559126 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15484))))

(declare-fun mapIsEmpty!23455 () Bool)

(assert (=> mapIsEmpty!23455 mapRes!23455))

(declare-fun res!559122 () Bool)

(assert (=> start!70532 (=> (not res!559122) (not e!454986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70532 (= res!559122 (validMask!0 mask!1312))))

(assert (=> start!70532 e!454986))

(assert (=> start!70532 tp_is_empty!14569))

(declare-fun array_inv!17417 (array!45313) Bool)

(assert (=> start!70532 (array_inv!17417 _keys!976)))

(assert (=> start!70532 true))

(declare-fun array_inv!17418 (array!45311) Bool)

(assert (=> start!70532 (and (array_inv!17418 _values!788) e!454987)))

(assert (=> start!70532 tp!45312))

(declare-fun mapNonEmpty!23455 () Bool)

(declare-fun tp!45313 () Bool)

(declare-fun e!454990 () Bool)

(assert (=> mapNonEmpty!23455 (= mapRes!23455 (and tp!45313 e!454990))))

(declare-fun mapRest!23455 () (Array (_ BitVec 32) ValueCell!6869))

(declare-fun mapKey!23455 () (_ BitVec 32))

(declare-fun mapValue!23455 () ValueCell!6869)

(assert (=> mapNonEmpty!23455 (= (arr!21709 _values!788) (store mapRest!23455 mapKey!23455 mapValue!23455))))

(declare-fun b!819308 () Bool)

(assert (=> b!819308 (= e!454989 true)))

(declare-fun lt!367584 () ListLongMap!8479)

(declare-fun lt!367588 () tuple2!9666)

(declare-fun lt!367591 () tuple2!9666)

(assert (=> b!819308 (= lt!367584 (+!1876 (+!1876 lt!367590 lt!367591) lt!367588))))

(declare-fun lt!367585 () ListLongMap!8479)

(assert (=> b!819308 (= (+!1876 lt!367586 lt!367588) (+!1876 lt!367585 lt!367588))))

(declare-fun lt!367587 () Unit!27937)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!191 (ListLongMap!8479 (_ BitVec 64) V!24427 V!24427) Unit!27937)

(assert (=> b!819308 (= lt!367587 (addSameAsAddTwiceSameKeyDiffValues!191 lt!367586 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819308 (= lt!367588 (tuple2!9667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819308 e!454991))

(declare-fun res!559121 () Bool)

(assert (=> b!819308 (=> (not res!559121) (not e!454991))))

(declare-fun lt!367593 () ListLongMap!8479)

(assert (=> b!819308 (= res!559121 (= lt!367593 lt!367585))))

(assert (=> b!819308 (= lt!367585 (+!1876 lt!367586 lt!367591))))

(assert (=> b!819308 (= lt!367591 (tuple2!9667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2404 (array!45313 array!45311 (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 (_ BitVec 32) Int) ListLongMap!8479)

(assert (=> b!819308 (= lt!367589 (getCurrentListMap!2404 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819308 (= lt!367593 (getCurrentListMap!2404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819309 () Bool)

(assert (=> b!819309 (= e!454990 tp_is_empty!14569)))

(declare-fun b!819310 () Bool)

(declare-fun res!559125 () Bool)

(assert (=> b!819310 (=> (not res!559125) (not e!454986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45313 (_ BitVec 32)) Bool)

(assert (=> b!819310 (= res!559125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70532 res!559122) b!819304))

(assert (= (and b!819304 res!559123) b!819310))

(assert (= (and b!819310 res!559125) b!819307))

(assert (= (and b!819307 res!559126) b!819306))

(assert (= (and b!819306 (not res!559124)) b!819308))

(assert (= (and b!819308 res!559121) b!819305))

(assert (= (and b!819303 condMapEmpty!23455) mapIsEmpty!23455))

(assert (= (and b!819303 (not condMapEmpty!23455)) mapNonEmpty!23455))

(get-info :version)

(assert (= (and mapNonEmpty!23455 ((_ is ValueCellFull!6869) mapValue!23455)) b!819309))

(assert (= (and b!819303 ((_ is ValueCellFull!6869) mapDefault!23455)) b!819302))

(assert (= start!70532 b!819303))

(declare-fun m!760455 () Bool)

(assert (=> b!819305 m!760455))

(declare-fun m!760457 () Bool)

(assert (=> mapNonEmpty!23455 m!760457))

(declare-fun m!760459 () Bool)

(assert (=> b!819308 m!760459))

(declare-fun m!760461 () Bool)

(assert (=> b!819308 m!760461))

(declare-fun m!760463 () Bool)

(assert (=> b!819308 m!760463))

(declare-fun m!760465 () Bool)

(assert (=> b!819308 m!760465))

(declare-fun m!760467 () Bool)

(assert (=> b!819308 m!760467))

(declare-fun m!760469 () Bool)

(assert (=> b!819308 m!760469))

(declare-fun m!760471 () Bool)

(assert (=> b!819308 m!760471))

(assert (=> b!819308 m!760471))

(declare-fun m!760473 () Bool)

(assert (=> b!819308 m!760473))

(declare-fun m!760475 () Bool)

(assert (=> b!819307 m!760475))

(declare-fun m!760477 () Bool)

(assert (=> start!70532 m!760477))

(declare-fun m!760479 () Bool)

(assert (=> start!70532 m!760479))

(declare-fun m!760481 () Bool)

(assert (=> start!70532 m!760481))

(declare-fun m!760483 () Bool)

(assert (=> b!819306 m!760483))

(declare-fun m!760485 () Bool)

(assert (=> b!819306 m!760485))

(declare-fun m!760487 () Bool)

(assert (=> b!819306 m!760487))

(declare-fun m!760489 () Bool)

(assert (=> b!819310 m!760489))

(check-sat b_and!21675 (not mapNonEmpty!23455) (not b!819308) (not b!819306) (not b!819305) tp_is_empty!14569 (not start!70532) (not b!819310) (not b_next!12859) (not b!819307))
(check-sat b_and!21675 (not b_next!12859))
