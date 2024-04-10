; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70372 () Bool)

(assert start!70372)

(declare-fun b_free!12729 () Bool)

(declare-fun b_next!12729 () Bool)

(assert (=> start!70372 (= b_free!12729 (not b_next!12729))))

(declare-fun tp!44914 () Bool)

(declare-fun b_and!21541 () Bool)

(assert (=> start!70372 (= tp!44914 b_and!21541)))

(declare-fun mapIsEmpty!23251 () Bool)

(declare-fun mapRes!23251 () Bool)

(assert (=> mapIsEmpty!23251 mapRes!23251))

(declare-fun b!817509 () Bool)

(declare-fun e!453642 () Bool)

(declare-fun tp_is_empty!14439 () Bool)

(assert (=> b!817509 (= e!453642 tp_is_empty!14439)))

(declare-fun b!817510 () Bool)

(declare-fun e!453645 () Bool)

(assert (=> b!817510 (= e!453645 tp_is_empty!14439)))

(declare-fun b!817511 () Bool)

(declare-fun e!453641 () Bool)

(assert (=> b!817511 (= e!453641 (and e!453642 mapRes!23251))))

(declare-fun condMapEmpty!23251 () Bool)

(declare-datatypes ((V!24253 0))(
  ( (V!24254 (val!7267 Int)) )
))
(declare-datatypes ((ValueCell!6804 0))(
  ( (ValueCellFull!6804 (v!9696 V!24253)) (EmptyCell!6804) )
))
(declare-datatypes ((array!45078 0))(
  ( (array!45079 (arr!21595 (Array (_ BitVec 32) ValueCell!6804)) (size!22016 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45078)

(declare-fun mapDefault!23251 () ValueCell!6804)

(assert (=> b!817511 (= condMapEmpty!23251 (= (arr!21595 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6804)) mapDefault!23251)))))

(declare-fun res!558020 () Bool)

(declare-fun e!453644 () Bool)

(assert (=> start!70372 (=> (not res!558020) (not e!453644))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70372 (= res!558020 (validMask!0 mask!1312))))

(assert (=> start!70372 e!453644))

(assert (=> start!70372 tp_is_empty!14439))

(declare-datatypes ((array!45080 0))(
  ( (array!45081 (arr!21596 (Array (_ BitVec 32) (_ BitVec 64))) (size!22017 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45080)

(declare-fun array_inv!17277 (array!45080) Bool)

(assert (=> start!70372 (array_inv!17277 _keys!976)))

(assert (=> start!70372 true))

(declare-fun array_inv!17278 (array!45078) Bool)

(assert (=> start!70372 (and (array_inv!17278 _values!788) e!453641)))

(assert (=> start!70372 tp!44914))

(declare-fun b!817512 () Bool)

(assert (=> b!817512 (= e!453644 (not true))))

(declare-datatypes ((tuple2!9548 0))(
  ( (tuple2!9549 (_1!4785 (_ BitVec 64)) (_2!4785 V!24253)) )
))
(declare-datatypes ((List!15380 0))(
  ( (Nil!15377) (Cons!15376 (h!16505 tuple2!9548) (t!21705 List!15380)) )
))
(declare-datatypes ((ListLongMap!8371 0))(
  ( (ListLongMap!8372 (toList!4201 List!15380)) )
))
(declare-fun lt!366281 () ListLongMap!8371)

(declare-fun lt!366282 () ListLongMap!8371)

(assert (=> b!817512 (= lt!366281 lt!366282)))

(declare-fun zeroValueBefore!34 () V!24253)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24253)

(declare-fun minValue!754 () V!24253)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27886 0))(
  ( (Unit!27887) )
))
(declare-fun lt!366280 () Unit!27886)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!352 (array!45080 array!45078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24253 V!24253 V!24253 V!24253 (_ BitVec 32) Int) Unit!27886)

(assert (=> b!817512 (= lt!366280 (lemmaNoChangeToArrayThenSameMapNoExtras!352 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2242 (array!45080 array!45078 (_ BitVec 32) (_ BitVec 32) V!24253 V!24253 (_ BitVec 32) Int) ListLongMap!8371)

(assert (=> b!817512 (= lt!366282 (getCurrentListMapNoExtraKeys!2242 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817512 (= lt!366281 (getCurrentListMapNoExtraKeys!2242 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23251 () Bool)

(declare-fun tp!44913 () Bool)

(assert (=> mapNonEmpty!23251 (= mapRes!23251 (and tp!44913 e!453645))))

(declare-fun mapValue!23251 () ValueCell!6804)

(declare-fun mapRest!23251 () (Array (_ BitVec 32) ValueCell!6804))

(declare-fun mapKey!23251 () (_ BitVec 32))

(assert (=> mapNonEmpty!23251 (= (arr!21595 _values!788) (store mapRest!23251 mapKey!23251 mapValue!23251))))

(declare-fun b!817513 () Bool)

(declare-fun res!558019 () Bool)

(assert (=> b!817513 (=> (not res!558019) (not e!453644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45080 (_ BitVec 32)) Bool)

(assert (=> b!817513 (= res!558019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817514 () Bool)

(declare-fun res!558022 () Bool)

(assert (=> b!817514 (=> (not res!558022) (not e!453644))))

(declare-datatypes ((List!15381 0))(
  ( (Nil!15378) (Cons!15377 (h!16506 (_ BitVec 64)) (t!21706 List!15381)) )
))
(declare-fun arrayNoDuplicates!0 (array!45080 (_ BitVec 32) List!15381) Bool)

(assert (=> b!817514 (= res!558022 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15378))))

(declare-fun b!817515 () Bool)

(declare-fun res!558021 () Bool)

(assert (=> b!817515 (=> (not res!558021) (not e!453644))))

(assert (=> b!817515 (= res!558021 (and (= (size!22016 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22017 _keys!976) (size!22016 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70372 res!558020) b!817515))

(assert (= (and b!817515 res!558021) b!817513))

(assert (= (and b!817513 res!558019) b!817514))

(assert (= (and b!817514 res!558022) b!817512))

(assert (= (and b!817511 condMapEmpty!23251) mapIsEmpty!23251))

(assert (= (and b!817511 (not condMapEmpty!23251)) mapNonEmpty!23251))

(get-info :version)

(assert (= (and mapNonEmpty!23251 ((_ is ValueCellFull!6804) mapValue!23251)) b!817510))

(assert (= (and b!817511 ((_ is ValueCellFull!6804) mapDefault!23251)) b!817509))

(assert (= start!70372 b!817511))

(declare-fun m!759081 () Bool)

(assert (=> mapNonEmpty!23251 m!759081))

(declare-fun m!759083 () Bool)

(assert (=> start!70372 m!759083))

(declare-fun m!759085 () Bool)

(assert (=> start!70372 m!759085))

(declare-fun m!759087 () Bool)

(assert (=> start!70372 m!759087))

(declare-fun m!759089 () Bool)

(assert (=> b!817512 m!759089))

(declare-fun m!759091 () Bool)

(assert (=> b!817512 m!759091))

(declare-fun m!759093 () Bool)

(assert (=> b!817512 m!759093))

(declare-fun m!759095 () Bool)

(assert (=> b!817514 m!759095))

(declare-fun m!759097 () Bool)

(assert (=> b!817513 m!759097))

(check-sat (not b!817514) tp_is_empty!14439 (not mapNonEmpty!23251) (not b!817513) (not b_next!12729) (not start!70372) (not b!817512) b_and!21541)
(check-sat b_and!21541 (not b_next!12729))
