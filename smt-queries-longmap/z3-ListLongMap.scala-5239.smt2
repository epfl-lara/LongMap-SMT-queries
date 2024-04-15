; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70494 () Bool)

(assert start!70494)

(declare-fun b_free!12841 () Bool)

(declare-fun b_next!12841 () Bool)

(assert (=> start!70494 (= b_free!12841 (not b_next!12841))))

(declare-fun tp!45256 () Bool)

(declare-fun b_and!21645 () Bool)

(assert (=> start!70494 (= tp!45256 b_and!21645)))

(declare-fun b!818865 () Bool)

(declare-fun e!454679 () Bool)

(declare-fun tp_is_empty!14551 () Bool)

(assert (=> b!818865 (= e!454679 tp_is_empty!14551)))

(declare-fun b!818866 () Bool)

(declare-fun res!558871 () Bool)

(declare-fun e!454674 () Bool)

(assert (=> b!818866 (=> (not res!558871) (not e!454674))))

(declare-datatypes ((array!45275 0))(
  ( (array!45276 (arr!21692 (Array (_ BitVec 32) (_ BitVec 64))) (size!22113 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45275)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45275 (_ BitVec 32)) Bool)

(assert (=> b!818866 (= res!558871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818867 () Bool)

(declare-fun e!454676 () Bool)

(declare-fun mapRes!23425 () Bool)

(assert (=> b!818867 (= e!454676 (and e!454679 mapRes!23425))))

(declare-fun condMapEmpty!23425 () Bool)

(declare-datatypes ((V!24403 0))(
  ( (V!24404 (val!7323 Int)) )
))
(declare-datatypes ((ValueCell!6860 0))(
  ( (ValueCellFull!6860 (v!9746 V!24403)) (EmptyCell!6860) )
))
(declare-datatypes ((array!45277 0))(
  ( (array!45278 (arr!21693 (Array (_ BitVec 32) ValueCell!6860)) (size!22114 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45277)

(declare-fun mapDefault!23425 () ValueCell!6860)

(assert (=> b!818867 (= condMapEmpty!23425 (= (arr!21693 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6860)) mapDefault!23425)))))

(declare-fun b!818868 () Bool)

(declare-datatypes ((tuple2!9654 0))(
  ( (tuple2!9655 (_1!4838 (_ BitVec 64)) (_2!4838 V!24403)) )
))
(declare-datatypes ((List!15475 0))(
  ( (Nil!15472) (Cons!15471 (h!16600 tuple2!9654) (t!21795 List!15475)) )
))
(declare-datatypes ((ListLongMap!8467 0))(
  ( (ListLongMap!8468 (toList!4249 List!15475)) )
))
(declare-fun lt!367169 () ListLongMap!8467)

(declare-fun zeroValueAfter!34 () V!24403)

(declare-fun lt!367162 () ListLongMap!8467)

(declare-fun e!454673 () Bool)

(declare-fun +!1870 (ListLongMap!8467 tuple2!9654) ListLongMap!8467)

(assert (=> b!818868 (= e!454673 (= lt!367162 (+!1870 lt!367169 (tuple2!9655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!558869 () Bool)

(assert (=> start!70494 (=> (not res!558869) (not e!454674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70494 (= res!558869 (validMask!0 mask!1312))))

(assert (=> start!70494 e!454674))

(assert (=> start!70494 tp_is_empty!14551))

(declare-fun array_inv!17407 (array!45275) Bool)

(assert (=> start!70494 (array_inv!17407 _keys!976)))

(assert (=> start!70494 true))

(declare-fun array_inv!17408 (array!45277) Bool)

(assert (=> start!70494 (and (array_inv!17408 _values!788) e!454676)))

(assert (=> start!70494 tp!45256))

(declare-fun b!818869 () Bool)

(declare-fun e!454678 () Bool)

(assert (=> b!818869 (= e!454678 true)))

(declare-fun lt!367164 () tuple2!9654)

(declare-fun lt!367160 () ListLongMap!8467)

(declare-fun lt!367161 () tuple2!9654)

(assert (=> b!818869 (= lt!367160 (+!1870 (+!1870 lt!367169 lt!367164) lt!367161))))

(declare-fun lt!367165 () ListLongMap!8467)

(declare-fun lt!367167 () ListLongMap!8467)

(assert (=> b!818869 (= (+!1870 lt!367165 lt!367161) (+!1870 lt!367167 lt!367161))))

(declare-fun zeroValueBefore!34 () V!24403)

(declare-datatypes ((Unit!27923 0))(
  ( (Unit!27924) )
))
(declare-fun lt!367168 () Unit!27923)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!185 (ListLongMap!8467 (_ BitVec 64) V!24403 V!24403) Unit!27923)

(assert (=> b!818869 (= lt!367168 (addSameAsAddTwiceSameKeyDiffValues!185 lt!367165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818869 (= lt!367161 (tuple2!9655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!818869 e!454673))

(declare-fun res!558870 () Bool)

(assert (=> b!818869 (=> (not res!558870) (not e!454673))))

(declare-fun lt!367163 () ListLongMap!8467)

(assert (=> b!818869 (= res!558870 (= lt!367163 lt!367167))))

(assert (=> b!818869 (= lt!367167 (+!1870 lt!367165 lt!367164))))

(assert (=> b!818869 (= lt!367164 (tuple2!9655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24403)

(declare-fun getCurrentListMap!2398 (array!45275 array!45277 (_ BitVec 32) (_ BitVec 32) V!24403 V!24403 (_ BitVec 32) Int) ListLongMap!8467)

(assert (=> b!818869 (= lt!367162 (getCurrentListMap!2398 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818869 (= lt!367163 (getCurrentListMap!2398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818870 () Bool)

(declare-fun res!558867 () Bool)

(assert (=> b!818870 (=> (not res!558867) (not e!454674))))

(assert (=> b!818870 (= res!558867 (and (= (size!22114 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22113 _keys!976) (size!22114 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818871 () Bool)

(declare-fun res!558872 () Bool)

(assert (=> b!818871 (=> (not res!558872) (not e!454674))))

(declare-datatypes ((List!15476 0))(
  ( (Nil!15473) (Cons!15472 (h!16601 (_ BitVec 64)) (t!21796 List!15476)) )
))
(declare-fun arrayNoDuplicates!0 (array!45275 (_ BitVec 32) List!15476) Bool)

(assert (=> b!818871 (= res!558872 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15473))))

(declare-fun b!818872 () Bool)

(declare-fun e!454677 () Bool)

(assert (=> b!818872 (= e!454677 tp_is_empty!14551)))

(declare-fun mapIsEmpty!23425 () Bool)

(assert (=> mapIsEmpty!23425 mapRes!23425))

(declare-fun b!818873 () Bool)

(assert (=> b!818873 (= e!454674 (not e!454678))))

(declare-fun res!558868 () Bool)

(assert (=> b!818873 (=> res!558868 e!454678)))

(assert (=> b!818873 (= res!558868 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818873 (= lt!367165 lt!367169)))

(declare-fun lt!367166 () Unit!27923)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!398 (array!45275 array!45277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24403 V!24403 V!24403 V!24403 (_ BitVec 32) Int) Unit!27923)

(assert (=> b!818873 (= lt!367166 (lemmaNoChangeToArrayThenSameMapNoExtras!398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2305 (array!45275 array!45277 (_ BitVec 32) (_ BitVec 32) V!24403 V!24403 (_ BitVec 32) Int) ListLongMap!8467)

(assert (=> b!818873 (= lt!367169 (getCurrentListMapNoExtraKeys!2305 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818873 (= lt!367165 (getCurrentListMapNoExtraKeys!2305 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23425 () Bool)

(declare-fun tp!45255 () Bool)

(assert (=> mapNonEmpty!23425 (= mapRes!23425 (and tp!45255 e!454677))))

(declare-fun mapKey!23425 () (_ BitVec 32))

(declare-fun mapRest!23425 () (Array (_ BitVec 32) ValueCell!6860))

(declare-fun mapValue!23425 () ValueCell!6860)

(assert (=> mapNonEmpty!23425 (= (arr!21693 _values!788) (store mapRest!23425 mapKey!23425 mapValue!23425))))

(assert (= (and start!70494 res!558869) b!818870))

(assert (= (and b!818870 res!558867) b!818866))

(assert (= (and b!818866 res!558871) b!818871))

(assert (= (and b!818871 res!558872) b!818873))

(assert (= (and b!818873 (not res!558868)) b!818869))

(assert (= (and b!818869 res!558870) b!818868))

(assert (= (and b!818867 condMapEmpty!23425) mapIsEmpty!23425))

(assert (= (and b!818867 (not condMapEmpty!23425)) mapNonEmpty!23425))

(get-info :version)

(assert (= (and mapNonEmpty!23425 ((_ is ValueCellFull!6860) mapValue!23425)) b!818872))

(assert (= (and b!818867 ((_ is ValueCellFull!6860) mapDefault!23425)) b!818865))

(assert (= start!70494 b!818867))

(declare-fun m!759893 () Bool)

(assert (=> mapNonEmpty!23425 m!759893))

(declare-fun m!759895 () Bool)

(assert (=> b!818871 m!759895))

(declare-fun m!759897 () Bool)

(assert (=> b!818866 m!759897))

(declare-fun m!759899 () Bool)

(assert (=> b!818868 m!759899))

(declare-fun m!759901 () Bool)

(assert (=> start!70494 m!759901))

(declare-fun m!759903 () Bool)

(assert (=> start!70494 m!759903))

(declare-fun m!759905 () Bool)

(assert (=> start!70494 m!759905))

(declare-fun m!759907 () Bool)

(assert (=> b!818869 m!759907))

(declare-fun m!759909 () Bool)

(assert (=> b!818869 m!759909))

(assert (=> b!818869 m!759909))

(declare-fun m!759911 () Bool)

(assert (=> b!818869 m!759911))

(declare-fun m!759913 () Bool)

(assert (=> b!818869 m!759913))

(declare-fun m!759915 () Bool)

(assert (=> b!818869 m!759915))

(declare-fun m!759917 () Bool)

(assert (=> b!818869 m!759917))

(declare-fun m!759919 () Bool)

(assert (=> b!818869 m!759919))

(declare-fun m!759921 () Bool)

(assert (=> b!818869 m!759921))

(declare-fun m!759923 () Bool)

(assert (=> b!818873 m!759923))

(declare-fun m!759925 () Bool)

(assert (=> b!818873 m!759925))

(declare-fun m!759927 () Bool)

(assert (=> b!818873 m!759927))

(check-sat (not b!818873) (not b!818869) b_and!21645 (not b!818866) (not b_next!12841) (not b!818868) (not start!70494) tp_is_empty!14551 (not mapNonEmpty!23425) (not b!818871))
(check-sat b_and!21645 (not b_next!12841))
