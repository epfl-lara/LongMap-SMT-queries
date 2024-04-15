; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70338 () Bool)

(assert start!70338)

(declare-fun b_free!12715 () Bool)

(declare-fun b_next!12715 () Bool)

(assert (=> start!70338 (= b_free!12715 (not b_next!12715))))

(declare-fun tp!44872 () Bool)

(declare-fun b_and!21501 () Bool)

(assert (=> start!70338 (= tp!44872 b_and!21501)))

(declare-fun b!817117 () Bool)

(declare-fun res!557832 () Bool)

(declare-fun e!453390 () Bool)

(assert (=> b!817117 (=> (not res!557832) (not e!453390))))

(declare-datatypes ((array!45029 0))(
  ( (array!45030 (arr!21571 (Array (_ BitVec 32) (_ BitVec 64))) (size!21992 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45029)

(declare-datatypes ((List!15381 0))(
  ( (Nil!15378) (Cons!15377 (h!16506 (_ BitVec 64)) (t!21697 List!15381)) )
))
(declare-fun arrayNoDuplicates!0 (array!45029 (_ BitVec 32) List!15381) Bool)

(assert (=> b!817117 (= res!557832 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15378))))

(declare-fun b!817118 () Bool)

(assert (=> b!817118 (= e!453390 (not true))))

(declare-datatypes ((V!24235 0))(
  ( (V!24236 (val!7260 Int)) )
))
(declare-datatypes ((tuple2!9560 0))(
  ( (tuple2!9561 (_1!4791 (_ BitVec 64)) (_2!4791 V!24235)) )
))
(declare-datatypes ((List!15382 0))(
  ( (Nil!15379) (Cons!15378 (h!16507 tuple2!9560) (t!21698 List!15382)) )
))
(declare-datatypes ((ListLongMap!8373 0))(
  ( (ListLongMap!8374 (toList!4202 List!15382)) )
))
(declare-fun lt!365976 () ListLongMap!8373)

(declare-fun lt!365975 () ListLongMap!8373)

(assert (=> b!817118 (= lt!365976 lt!365975)))

(declare-fun zeroValueBefore!34 () V!24235)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24235)

(declare-fun minValue!754 () V!24235)

(declare-datatypes ((ValueCell!6797 0))(
  ( (ValueCellFull!6797 (v!9683 V!24235)) (EmptyCell!6797) )
))
(declare-datatypes ((array!45031 0))(
  ( (array!45032 (arr!21572 (Array (_ BitVec 32) ValueCell!6797)) (size!21993 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45031)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27832 0))(
  ( (Unit!27833) )
))
(declare-fun lt!365974 () Unit!27832)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!355 (array!45029 array!45031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24235 V!24235 V!24235 V!24235 (_ BitVec 32) Int) Unit!27832)

(assert (=> b!817118 (= lt!365974 (lemmaNoChangeToArrayThenSameMapNoExtras!355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2262 (array!45029 array!45031 (_ BitVec 32) (_ BitVec 32) V!24235 V!24235 (_ BitVec 32) Int) ListLongMap!8373)

(assert (=> b!817118 (= lt!365975 (getCurrentListMapNoExtraKeys!2262 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817118 (= lt!365976 (getCurrentListMapNoExtraKeys!2262 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23230 () Bool)

(declare-fun mapRes!23230 () Bool)

(assert (=> mapIsEmpty!23230 mapRes!23230))

(declare-fun mapNonEmpty!23230 () Bool)

(declare-fun tp!44871 () Bool)

(declare-fun e!453389 () Bool)

(assert (=> mapNonEmpty!23230 (= mapRes!23230 (and tp!44871 e!453389))))

(declare-fun mapValue!23230 () ValueCell!6797)

(declare-fun mapKey!23230 () (_ BitVec 32))

(declare-fun mapRest!23230 () (Array (_ BitVec 32) ValueCell!6797))

(assert (=> mapNonEmpty!23230 (= (arr!21572 _values!788) (store mapRest!23230 mapKey!23230 mapValue!23230))))

(declare-fun b!817119 () Bool)

(declare-fun res!557830 () Bool)

(assert (=> b!817119 (=> (not res!557830) (not e!453390))))

(assert (=> b!817119 (= res!557830 (and (= (size!21993 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21992 _keys!976) (size!21993 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817120 () Bool)

(declare-fun res!557829 () Bool)

(assert (=> b!817120 (=> (not res!557829) (not e!453390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45029 (_ BitVec 32)) Bool)

(assert (=> b!817120 (= res!557829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817121 () Bool)

(declare-fun tp_is_empty!14425 () Bool)

(assert (=> b!817121 (= e!453389 tp_is_empty!14425)))

(declare-fun b!817122 () Bool)

(declare-fun e!453387 () Bool)

(declare-fun e!453386 () Bool)

(assert (=> b!817122 (= e!453387 (and e!453386 mapRes!23230))))

(declare-fun condMapEmpty!23230 () Bool)

(declare-fun mapDefault!23230 () ValueCell!6797)

(assert (=> b!817122 (= condMapEmpty!23230 (= (arr!21572 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6797)) mapDefault!23230)))))

(declare-fun b!817116 () Bool)

(assert (=> b!817116 (= e!453386 tp_is_empty!14425)))

(declare-fun res!557831 () Bool)

(assert (=> start!70338 (=> (not res!557831) (not e!453390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70338 (= res!557831 (validMask!0 mask!1312))))

(assert (=> start!70338 e!453390))

(assert (=> start!70338 tp_is_empty!14425))

(declare-fun array_inv!17325 (array!45029) Bool)

(assert (=> start!70338 (array_inv!17325 _keys!976)))

(assert (=> start!70338 true))

(declare-fun array_inv!17326 (array!45031) Bool)

(assert (=> start!70338 (and (array_inv!17326 _values!788) e!453387)))

(assert (=> start!70338 tp!44872))

(assert (= (and start!70338 res!557831) b!817119))

(assert (= (and b!817119 res!557830) b!817120))

(assert (= (and b!817120 res!557829) b!817117))

(assert (= (and b!817117 res!557832) b!817118))

(assert (= (and b!817122 condMapEmpty!23230) mapIsEmpty!23230))

(assert (= (and b!817122 (not condMapEmpty!23230)) mapNonEmpty!23230))

(get-info :version)

(assert (= (and mapNonEmpty!23230 ((_ is ValueCellFull!6797) mapValue!23230)) b!817121))

(assert (= (and b!817122 ((_ is ValueCellFull!6797) mapDefault!23230)) b!817116))

(assert (= start!70338 b!817122))

(declare-fun m!758203 () Bool)

(assert (=> start!70338 m!758203))

(declare-fun m!758205 () Bool)

(assert (=> start!70338 m!758205))

(declare-fun m!758207 () Bool)

(assert (=> start!70338 m!758207))

(declare-fun m!758209 () Bool)

(assert (=> b!817117 m!758209))

(declare-fun m!758211 () Bool)

(assert (=> b!817118 m!758211))

(declare-fun m!758213 () Bool)

(assert (=> b!817118 m!758213))

(declare-fun m!758215 () Bool)

(assert (=> b!817118 m!758215))

(declare-fun m!758217 () Bool)

(assert (=> b!817120 m!758217))

(declare-fun m!758219 () Bool)

(assert (=> mapNonEmpty!23230 m!758219))

(check-sat (not b_next!12715) (not b!817118) b_and!21501 (not b!817117) (not mapNonEmpty!23230) tp_is_empty!14425 (not start!70338) (not b!817120))
(check-sat b_and!21501 (not b_next!12715))
