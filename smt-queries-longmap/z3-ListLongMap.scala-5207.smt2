; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70254 () Bool)

(assert start!70254)

(declare-fun b_free!12649 () Bool)

(declare-fun b_next!12649 () Bool)

(assert (=> start!70254 (= b_free!12649 (not b_next!12649))))

(declare-fun tp!44670 () Bool)

(declare-fun b_and!21423 () Bool)

(assert (=> start!70254 (= tp!44670 b_and!21423)))

(declare-fun b!816169 () Bool)

(declare-fun res!557285 () Bool)

(declare-fun e!452712 () Bool)

(assert (=> b!816169 (=> (not res!557285) (not e!452712))))

(declare-datatypes ((array!44899 0))(
  ( (array!44900 (arr!21507 (Array (_ BitVec 32) (_ BitVec 64))) (size!21928 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44899)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24147 0))(
  ( (V!24148 (val!7227 Int)) )
))
(declare-datatypes ((ValueCell!6764 0))(
  ( (ValueCellFull!6764 (v!9649 V!24147)) (EmptyCell!6764) )
))
(declare-datatypes ((array!44901 0))(
  ( (array!44902 (arr!21508 (Array (_ BitVec 32) ValueCell!6764)) (size!21929 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44901)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816169 (= res!557285 (and (= (size!21929 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21928 _keys!976) (size!21929 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23128 () Bool)

(declare-fun mapRes!23128 () Bool)

(declare-fun tp!44671 () Bool)

(declare-fun e!452715 () Bool)

(assert (=> mapNonEmpty!23128 (= mapRes!23128 (and tp!44671 e!452715))))

(declare-fun mapRest!23128 () (Array (_ BitVec 32) ValueCell!6764))

(declare-fun mapKey!23128 () (_ BitVec 32))

(declare-fun mapValue!23128 () ValueCell!6764)

(assert (=> mapNonEmpty!23128 (= (arr!21508 _values!788) (store mapRest!23128 mapKey!23128 mapValue!23128))))

(declare-fun b!816170 () Bool)

(declare-fun e!452713 () Bool)

(declare-fun e!452714 () Bool)

(assert (=> b!816170 (= e!452713 (and e!452714 mapRes!23128))))

(declare-fun condMapEmpty!23128 () Bool)

(declare-fun mapDefault!23128 () ValueCell!6764)

(assert (=> b!816170 (= condMapEmpty!23128 (= (arr!21508 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6764)) mapDefault!23128)))))

(declare-fun b!816171 () Bool)

(declare-fun tp_is_empty!14359 () Bool)

(assert (=> b!816171 (= e!452714 tp_is_empty!14359)))

(declare-fun res!557281 () Bool)

(assert (=> start!70254 (=> (not res!557281) (not e!452712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70254 (= res!557281 (validMask!0 mask!1312))))

(assert (=> start!70254 e!452712))

(assert (=> start!70254 tp_is_empty!14359))

(declare-fun array_inv!17287 (array!44899) Bool)

(assert (=> start!70254 (array_inv!17287 _keys!976)))

(assert (=> start!70254 true))

(declare-fun array_inv!17288 (array!44901) Bool)

(assert (=> start!70254 (and (array_inv!17288 _values!788) e!452713)))

(assert (=> start!70254 tp!44670))

(declare-fun b!816172 () Bool)

(declare-fun res!557283 () Bool)

(assert (=> b!816172 (=> (not res!557283) (not e!452712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44899 (_ BitVec 32)) Bool)

(assert (=> b!816172 (= res!557283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816173 () Bool)

(declare-fun e!452716 () Bool)

(assert (=> b!816173 (= e!452712 (not e!452716))))

(declare-fun res!557284 () Bool)

(assert (=> b!816173 (=> res!557284 e!452716)))

(assert (=> b!816173 (= res!557284 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9508 0))(
  ( (tuple2!9509 (_1!4765 (_ BitVec 64)) (_2!4765 V!24147)) )
))
(declare-datatypes ((List!15333 0))(
  ( (Nil!15330) (Cons!15329 (h!16458 tuple2!9508) (t!21647 List!15333)) )
))
(declare-datatypes ((ListLongMap!8321 0))(
  ( (ListLongMap!8322 (toList!4176 List!15333)) )
))
(declare-fun lt!365419 () ListLongMap!8321)

(declare-fun lt!365417 () ListLongMap!8321)

(assert (=> b!816173 (= lt!365419 lt!365417)))

(declare-fun zeroValueBefore!34 () V!24147)

(declare-datatypes ((Unit!27782 0))(
  ( (Unit!27783) )
))
(declare-fun lt!365415 () Unit!27782)

(declare-fun zeroValueAfter!34 () V!24147)

(declare-fun minValue!754 () V!24147)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!331 (array!44899 array!44901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 V!24147 V!24147 (_ BitVec 32) Int) Unit!27782)

(assert (=> b!816173 (= lt!365415 (lemmaNoChangeToArrayThenSameMapNoExtras!331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2238 (array!44899 array!44901 (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 (_ BitVec 32) Int) ListLongMap!8321)

(assert (=> b!816173 (= lt!365417 (getCurrentListMapNoExtraKeys!2238 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816173 (= lt!365419 (getCurrentListMapNoExtraKeys!2238 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816174 () Bool)

(assert (=> b!816174 (= e!452716 true)))

(declare-fun lt!365418 () ListLongMap!8321)

(declare-fun getCurrentListMap!2351 (array!44899 array!44901 (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 (_ BitVec 32) Int) ListLongMap!8321)

(assert (=> b!816174 (= lt!365418 (getCurrentListMap!2351 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365416 () ListLongMap!8321)

(declare-fun +!1839 (ListLongMap!8321 tuple2!9508) ListLongMap!8321)

(assert (=> b!816174 (= lt!365416 (+!1839 (getCurrentListMap!2351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816175 () Bool)

(assert (=> b!816175 (= e!452715 tp_is_empty!14359)))

(declare-fun mapIsEmpty!23128 () Bool)

(assert (=> mapIsEmpty!23128 mapRes!23128))

(declare-fun b!816176 () Bool)

(declare-fun res!557282 () Bool)

(assert (=> b!816176 (=> (not res!557282) (not e!452712))))

(declare-datatypes ((List!15334 0))(
  ( (Nil!15331) (Cons!15330 (h!16459 (_ BitVec 64)) (t!21648 List!15334)) )
))
(declare-fun arrayNoDuplicates!0 (array!44899 (_ BitVec 32) List!15334) Bool)

(assert (=> b!816176 (= res!557282 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15331))))

(assert (= (and start!70254 res!557281) b!816169))

(assert (= (and b!816169 res!557285) b!816172))

(assert (= (and b!816172 res!557283) b!816176))

(assert (= (and b!816176 res!557282) b!816173))

(assert (= (and b!816173 (not res!557284)) b!816174))

(assert (= (and b!816170 condMapEmpty!23128) mapIsEmpty!23128))

(assert (= (and b!816170 (not condMapEmpty!23128)) mapNonEmpty!23128))

(get-info :version)

(assert (= (and mapNonEmpty!23128 ((_ is ValueCellFull!6764) mapValue!23128)) b!816175))

(assert (= (and b!816170 ((_ is ValueCellFull!6764) mapDefault!23128)) b!816171))

(assert (= start!70254 b!816170))

(declare-fun m!757295 () Bool)

(assert (=> b!816173 m!757295))

(declare-fun m!757297 () Bool)

(assert (=> b!816173 m!757297))

(declare-fun m!757299 () Bool)

(assert (=> b!816173 m!757299))

(declare-fun m!757301 () Bool)

(assert (=> b!816176 m!757301))

(declare-fun m!757303 () Bool)

(assert (=> b!816172 m!757303))

(declare-fun m!757305 () Bool)

(assert (=> b!816174 m!757305))

(declare-fun m!757307 () Bool)

(assert (=> b!816174 m!757307))

(assert (=> b!816174 m!757307))

(declare-fun m!757309 () Bool)

(assert (=> b!816174 m!757309))

(declare-fun m!757311 () Bool)

(assert (=> mapNonEmpty!23128 m!757311))

(declare-fun m!757313 () Bool)

(assert (=> start!70254 m!757313))

(declare-fun m!757315 () Bool)

(assert (=> start!70254 m!757315))

(declare-fun m!757317 () Bool)

(assert (=> start!70254 m!757317))

(check-sat (not b!816174) (not start!70254) (not b!816172) (not b!816173) tp_is_empty!14359 (not b_next!12649) b_and!21423 (not b!816176) (not mapNonEmpty!23128))
(check-sat b_and!21423 (not b_next!12649))
