; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70548 () Bool)

(assert start!70548)

(declare-fun b_free!12739 () Bool)

(declare-fun b_next!12739 () Bool)

(assert (=> start!70548 (= b_free!12739 (not b_next!12739))))

(declare-fun tp!44943 () Bool)

(declare-fun b_and!21561 () Bool)

(assert (=> start!70548 (= tp!44943 b_and!21561)))

(declare-fun res!558427 () Bool)

(declare-fun e!454296 () Bool)

(assert (=> start!70548 (=> (not res!558427) (not e!454296))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70548 (= res!558427 (validMask!0 mask!1312))))

(assert (=> start!70548 e!454296))

(declare-fun tp_is_empty!14449 () Bool)

(assert (=> start!70548 tp_is_empty!14449))

(declare-datatypes ((array!45095 0))(
  ( (array!45096 (arr!21599 (Array (_ BitVec 32) (_ BitVec 64))) (size!22019 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45095)

(declare-fun array_inv!17303 (array!45095) Bool)

(assert (=> start!70548 (array_inv!17303 _keys!976)))

(assert (=> start!70548 true))

(declare-datatypes ((V!24267 0))(
  ( (V!24268 (val!7272 Int)) )
))
(declare-datatypes ((ValueCell!6809 0))(
  ( (ValueCellFull!6809 (v!9701 V!24267)) (EmptyCell!6809) )
))
(declare-datatypes ((array!45097 0))(
  ( (array!45098 (arr!21600 (Array (_ BitVec 32) ValueCell!6809)) (size!22020 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45097)

(declare-fun e!454295 () Bool)

(declare-fun array_inv!17304 (array!45097) Bool)

(assert (=> start!70548 (and (array_inv!17304 _values!788) e!454295)))

(assert (=> start!70548 tp!44943))

(declare-fun b!818508 () Bool)

(declare-fun e!454294 () Bool)

(assert (=> b!818508 (= e!454294 tp_is_empty!14449)))

(declare-fun mapNonEmpty!23266 () Bool)

(declare-fun mapRes!23266 () Bool)

(declare-fun tp!44944 () Bool)

(assert (=> mapNonEmpty!23266 (= mapRes!23266 (and tp!44944 e!454294))))

(declare-fun mapKey!23266 () (_ BitVec 32))

(declare-fun mapRest!23266 () (Array (_ BitVec 32) ValueCell!6809))

(declare-fun mapValue!23266 () ValueCell!6809)

(assert (=> mapNonEmpty!23266 (= (arr!21600 _values!788) (store mapRest!23266 mapKey!23266 mapValue!23266))))

(declare-fun mapIsEmpty!23266 () Bool)

(assert (=> mapIsEmpty!23266 mapRes!23266))

(declare-fun b!818509 () Bool)

(declare-fun res!558425 () Bool)

(assert (=> b!818509 (=> (not res!558425) (not e!454296))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818509 (= res!558425 (and (= (size!22020 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22019 _keys!976) (size!22020 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818510 () Bool)

(assert (=> b!818510 (= e!454296 (not true))))

(declare-datatypes ((tuple2!9464 0))(
  ( (tuple2!9465 (_1!4743 (_ BitVec 64)) (_2!4743 V!24267)) )
))
(declare-datatypes ((List!15276 0))(
  ( (Nil!15273) (Cons!15272 (h!16407 tuple2!9464) (t!21593 List!15276)) )
))
(declare-datatypes ((ListLongMap!8289 0))(
  ( (ListLongMap!8290 (toList!4160 List!15276)) )
))
(declare-fun lt!366681 () ListLongMap!8289)

(declare-fun lt!366680 () ListLongMap!8289)

(assert (=> b!818510 (= lt!366681 lt!366680)))

(declare-fun zeroValueBefore!34 () V!24267)

(declare-fun zeroValueAfter!34 () V!24267)

(declare-fun minValue!754 () V!24267)

(declare-datatypes ((Unit!27875 0))(
  ( (Unit!27876) )
))
(declare-fun lt!366679 () Unit!27875)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!347 (array!45095 array!45097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24267 V!24267 V!24267 V!24267 (_ BitVec 32) Int) Unit!27875)

(assert (=> b!818510 (= lt!366679 (lemmaNoChangeToArrayThenSameMapNoExtras!347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2259 (array!45095 array!45097 (_ BitVec 32) (_ BitVec 32) V!24267 V!24267 (_ BitVec 32) Int) ListLongMap!8289)

(assert (=> b!818510 (= lt!366680 (getCurrentListMapNoExtraKeys!2259 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818510 (= lt!366681 (getCurrentListMapNoExtraKeys!2259 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818511 () Bool)

(declare-fun res!558428 () Bool)

(assert (=> b!818511 (=> (not res!558428) (not e!454296))))

(declare-datatypes ((List!15277 0))(
  ( (Nil!15274) (Cons!15273 (h!16408 (_ BitVec 64)) (t!21594 List!15277)) )
))
(declare-fun arrayNoDuplicates!0 (array!45095 (_ BitVec 32) List!15277) Bool)

(assert (=> b!818511 (= res!558428 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15274))))

(declare-fun b!818512 () Bool)

(declare-fun e!454297 () Bool)

(assert (=> b!818512 (= e!454295 (and e!454297 mapRes!23266))))

(declare-fun condMapEmpty!23266 () Bool)

(declare-fun mapDefault!23266 () ValueCell!6809)

(assert (=> b!818512 (= condMapEmpty!23266 (= (arr!21600 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6809)) mapDefault!23266)))))

(declare-fun b!818513 () Bool)

(assert (=> b!818513 (= e!454297 tp_is_empty!14449)))

(declare-fun b!818514 () Bool)

(declare-fun res!558426 () Bool)

(assert (=> b!818514 (=> (not res!558426) (not e!454296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45095 (_ BitVec 32)) Bool)

(assert (=> b!818514 (= res!558426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70548 res!558427) b!818509))

(assert (= (and b!818509 res!558425) b!818514))

(assert (= (and b!818514 res!558426) b!818511))

(assert (= (and b!818511 res!558428) b!818510))

(assert (= (and b!818512 condMapEmpty!23266) mapIsEmpty!23266))

(assert (= (and b!818512 (not condMapEmpty!23266)) mapNonEmpty!23266))

(get-info :version)

(assert (= (and mapNonEmpty!23266 ((_ is ValueCellFull!6809) mapValue!23266)) b!818508))

(assert (= (and b!818512 ((_ is ValueCellFull!6809) mapDefault!23266)) b!818513))

(assert (= start!70548 b!818512))

(declare-fun m!760453 () Bool)

(assert (=> start!70548 m!760453))

(declare-fun m!760455 () Bool)

(assert (=> start!70548 m!760455))

(declare-fun m!760457 () Bool)

(assert (=> start!70548 m!760457))

(declare-fun m!760459 () Bool)

(assert (=> mapNonEmpty!23266 m!760459))

(declare-fun m!760461 () Bool)

(assert (=> b!818514 m!760461))

(declare-fun m!760463 () Bool)

(assert (=> b!818510 m!760463))

(declare-fun m!760465 () Bool)

(assert (=> b!818510 m!760465))

(declare-fun m!760467 () Bool)

(assert (=> b!818510 m!760467))

(declare-fun m!760469 () Bool)

(assert (=> b!818511 m!760469))

(check-sat (not b!818510) (not mapNonEmpty!23266) (not b_next!12739) (not start!70548) (not b!818511) tp_is_empty!14449 b_and!21561 (not b!818514))
(check-sat b_and!21561 (not b_next!12739))
