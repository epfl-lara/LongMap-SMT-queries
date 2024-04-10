; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70068 () Bool)

(assert start!70068)

(declare-fun b_free!12489 () Bool)

(declare-fun b_next!12489 () Bool)

(assert (=> start!70068 (= b_free!12489 (not b_next!12489))))

(declare-fun tp!44181 () Bool)

(declare-fun b_and!21261 () Bool)

(assert (=> start!70068 (= tp!44181 b_and!21261)))

(declare-fun b!814289 () Bool)

(declare-fun res!556191 () Bool)

(declare-fun e!451351 () Bool)

(assert (=> b!814289 (=> (not res!556191) (not e!451351))))

(declare-datatypes ((array!44602 0))(
  ( (array!44603 (arr!21361 (Array (_ BitVec 32) (_ BitVec 64))) (size!21782 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44602)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44602 (_ BitVec 32)) Bool)

(assert (=> b!814289 (= res!556191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814290 () Bool)

(declare-fun e!451353 () Bool)

(declare-fun e!451350 () Bool)

(declare-fun mapRes!22879 () Bool)

(assert (=> b!814290 (= e!451353 (and e!451350 mapRes!22879))))

(declare-fun condMapEmpty!22879 () Bool)

(declare-datatypes ((V!23933 0))(
  ( (V!23934 (val!7147 Int)) )
))
(declare-datatypes ((ValueCell!6684 0))(
  ( (ValueCellFull!6684 (v!9574 V!23933)) (EmptyCell!6684) )
))
(declare-datatypes ((array!44604 0))(
  ( (array!44605 (arr!21362 (Array (_ BitVec 32) ValueCell!6684)) (size!21783 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44604)

(declare-fun mapDefault!22879 () ValueCell!6684)

(assert (=> b!814290 (= condMapEmpty!22879 (= (arr!21362 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6684)) mapDefault!22879)))))

(declare-fun res!556193 () Bool)

(assert (=> start!70068 (=> (not res!556193) (not e!451351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70068 (= res!556193 (validMask!0 mask!1312))))

(assert (=> start!70068 e!451351))

(declare-fun tp_is_empty!14199 () Bool)

(assert (=> start!70068 tp_is_empty!14199))

(declare-fun array_inv!17095 (array!44602) Bool)

(assert (=> start!70068 (array_inv!17095 _keys!976)))

(assert (=> start!70068 true))

(declare-fun array_inv!17096 (array!44604) Bool)

(assert (=> start!70068 (and (array_inv!17096 _values!788) e!451353)))

(assert (=> start!70068 tp!44181))

(declare-fun b!814291 () Bool)

(declare-fun res!556192 () Bool)

(assert (=> b!814291 (=> (not res!556192) (not e!451351))))

(declare-datatypes ((List!15200 0))(
  ( (Nil!15197) (Cons!15196 (h!16325 (_ BitVec 64)) (t!21517 List!15200)) )
))
(declare-fun arrayNoDuplicates!0 (array!44602 (_ BitVec 32) List!15200) Bool)

(assert (=> b!814291 (= res!556192 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15197))))

(declare-fun b!814292 () Bool)

(assert (=> b!814292 (= e!451350 tp_is_empty!14199)))

(declare-fun b!814293 () Bool)

(declare-fun e!451349 () Bool)

(assert (=> b!814293 (= e!451349 tp_is_empty!14199)))

(declare-fun b!814294 () Bool)

(assert (=> b!814294 (= e!451351 (not true))))

(declare-datatypes ((tuple2!9368 0))(
  ( (tuple2!9369 (_1!4695 (_ BitVec 64)) (_2!4695 V!23933)) )
))
(declare-datatypes ((List!15201 0))(
  ( (Nil!15198) (Cons!15197 (h!16326 tuple2!9368) (t!21518 List!15201)) )
))
(declare-datatypes ((ListLongMap!8191 0))(
  ( (ListLongMap!8192 (toList!4111 List!15201)) )
))
(declare-fun lt!364554 () ListLongMap!8191)

(declare-fun lt!364553 () ListLongMap!8191)

(assert (=> b!814294 (= lt!364554 lt!364553)))

(declare-fun zeroValueBefore!34 () V!23933)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23933)

(declare-fun minValue!754 () V!23933)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27720 0))(
  ( (Unit!27721) )
))
(declare-fun lt!364552 () Unit!27720)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!271 (array!44602 array!44604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23933 V!23933 V!23933 V!23933 (_ BitVec 32) Int) Unit!27720)

(assert (=> b!814294 (= lt!364552 (lemmaNoChangeToArrayThenSameMapNoExtras!271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2161 (array!44602 array!44604 (_ BitVec 32) (_ BitVec 32) V!23933 V!23933 (_ BitVec 32) Int) ListLongMap!8191)

(assert (=> b!814294 (= lt!364553 (getCurrentListMapNoExtraKeys!2161 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814294 (= lt!364554 (getCurrentListMapNoExtraKeys!2161 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22879 () Bool)

(declare-fun tp!44182 () Bool)

(assert (=> mapNonEmpty!22879 (= mapRes!22879 (and tp!44182 e!451349))))

(declare-fun mapRest!22879 () (Array (_ BitVec 32) ValueCell!6684))

(declare-fun mapKey!22879 () (_ BitVec 32))

(declare-fun mapValue!22879 () ValueCell!6684)

(assert (=> mapNonEmpty!22879 (= (arr!21362 _values!788) (store mapRest!22879 mapKey!22879 mapValue!22879))))

(declare-fun b!814295 () Bool)

(declare-fun res!556194 () Bool)

(assert (=> b!814295 (=> (not res!556194) (not e!451351))))

(assert (=> b!814295 (= res!556194 (and (= (size!21783 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21782 _keys!976) (size!21783 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22879 () Bool)

(assert (=> mapIsEmpty!22879 mapRes!22879))

(assert (= (and start!70068 res!556193) b!814295))

(assert (= (and b!814295 res!556194) b!814289))

(assert (= (and b!814289 res!556191) b!814291))

(assert (= (and b!814291 res!556192) b!814294))

(assert (= (and b!814290 condMapEmpty!22879) mapIsEmpty!22879))

(assert (= (and b!814290 (not condMapEmpty!22879)) mapNonEmpty!22879))

(get-info :version)

(assert (= (and mapNonEmpty!22879 ((_ is ValueCellFull!6684) mapValue!22879)) b!814293))

(assert (= (and b!814290 ((_ is ValueCellFull!6684) mapDefault!22879)) b!814292))

(assert (= start!70068 b!814290))

(declare-fun m!756125 () Bool)

(assert (=> start!70068 m!756125))

(declare-fun m!756127 () Bool)

(assert (=> start!70068 m!756127))

(declare-fun m!756129 () Bool)

(assert (=> start!70068 m!756129))

(declare-fun m!756131 () Bool)

(assert (=> b!814289 m!756131))

(declare-fun m!756133 () Bool)

(assert (=> b!814291 m!756133))

(declare-fun m!756135 () Bool)

(assert (=> mapNonEmpty!22879 m!756135))

(declare-fun m!756137 () Bool)

(assert (=> b!814294 m!756137))

(declare-fun m!756139 () Bool)

(assert (=> b!814294 m!756139))

(declare-fun m!756141 () Bool)

(assert (=> b!814294 m!756141))

(check-sat (not b_next!12489) (not start!70068) tp_is_empty!14199 (not b!814294) (not b!814289) (not mapNonEmpty!22879) (not b!814291) b_and!21261)
(check-sat b_and!21261 (not b_next!12489))
