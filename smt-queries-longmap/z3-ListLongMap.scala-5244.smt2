; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70566 () Bool)

(assert start!70566)

(declare-fun b_free!12873 () Bool)

(declare-fun b_next!12873 () Bool)

(assert (=> start!70566 (= b_free!12873 (not b_next!12873))))

(declare-fun tp!45354 () Bool)

(declare-fun b_and!21715 () Bool)

(assert (=> start!70566 (= tp!45354 b_and!21715)))

(declare-fun b!819737 () Bool)

(declare-fun e!455289 () Bool)

(assert (=> b!819737 (= e!455289 true)))

(declare-datatypes ((V!24445 0))(
  ( (V!24446 (val!7339 Int)) )
))
(declare-datatypes ((tuple2!9662 0))(
  ( (tuple2!9663 (_1!4842 (_ BitVec 64)) (_2!4842 V!24445)) )
))
(declare-datatypes ((List!15486 0))(
  ( (Nil!15483) (Cons!15482 (h!16611 tuple2!9662) (t!21817 List!15486)) )
))
(declare-datatypes ((ListLongMap!8485 0))(
  ( (ListLongMap!8486 (toList!4258 List!15486)) )
))
(declare-fun lt!368043 () ListLongMap!8485)

(declare-fun lt!368040 () tuple2!9662)

(declare-fun lt!368044 () tuple2!9662)

(declare-fun lt!368038 () ListLongMap!8485)

(declare-fun +!1853 (ListLongMap!8485 tuple2!9662) ListLongMap!8485)

(assert (=> b!819737 (= lt!368038 (+!1853 (+!1853 lt!368043 lt!368044) lt!368040))))

(declare-fun lt!368041 () ListLongMap!8485)

(declare-fun lt!368045 () ListLongMap!8485)

(assert (=> b!819737 (= (+!1853 lt!368041 lt!368040) (+!1853 lt!368045 lt!368040))))

(declare-datatypes ((Unit!27995 0))(
  ( (Unit!27996) )
))
(declare-fun lt!368046 () Unit!27995)

(declare-fun zeroValueBefore!34 () V!24445)

(declare-fun zeroValueAfter!34 () V!24445)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!191 (ListLongMap!8485 (_ BitVec 64) V!24445 V!24445) Unit!27995)

(assert (=> b!819737 (= lt!368046 (addSameAsAddTwiceSameKeyDiffValues!191 lt!368041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819737 (= lt!368040 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455287 () Bool)

(assert (=> b!819737 e!455287))

(declare-fun res!559355 () Bool)

(assert (=> b!819737 (=> (not res!559355) (not e!455287))))

(declare-fun lt!368042 () ListLongMap!8485)

(assert (=> b!819737 (= res!559355 (= lt!368042 lt!368045))))

(assert (=> b!819737 (= lt!368045 (+!1853 lt!368041 lt!368044))))

(assert (=> b!819737 (= lt!368044 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!368039 () ListLongMap!8485)

(declare-datatypes ((array!45364 0))(
  ( (array!45365 (arr!21735 (Array (_ BitVec 32) (_ BitVec 64))) (size!22156 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45364)

(declare-fun minValue!754 () V!24445)

(declare-datatypes ((ValueCell!6876 0))(
  ( (ValueCellFull!6876 (v!9769 V!24445)) (EmptyCell!6876) )
))
(declare-datatypes ((array!45366 0))(
  ( (array!45367 (arr!21736 (Array (_ BitVec 32) ValueCell!6876)) (size!22157 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45366)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2457 (array!45364 array!45366 (_ BitVec 32) (_ BitVec 32) V!24445 V!24445 (_ BitVec 32) Int) ListLongMap!8485)

(assert (=> b!819737 (= lt!368039 (getCurrentListMap!2457 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819737 (= lt!368042 (getCurrentListMap!2457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819738 () Bool)

(declare-fun e!455285 () Bool)

(declare-fun e!455286 () Bool)

(declare-fun mapRes!23476 () Bool)

(assert (=> b!819738 (= e!455285 (and e!455286 mapRes!23476))))

(declare-fun condMapEmpty!23476 () Bool)

(declare-fun mapDefault!23476 () ValueCell!6876)

(assert (=> b!819738 (= condMapEmpty!23476 (= (arr!21736 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6876)) mapDefault!23476)))))

(declare-fun mapNonEmpty!23476 () Bool)

(declare-fun tp!45355 () Bool)

(declare-fun e!455288 () Bool)

(assert (=> mapNonEmpty!23476 (= mapRes!23476 (and tp!45355 e!455288))))

(declare-fun mapKey!23476 () (_ BitVec 32))

(declare-fun mapRest!23476 () (Array (_ BitVec 32) ValueCell!6876))

(declare-fun mapValue!23476 () ValueCell!6876)

(assert (=> mapNonEmpty!23476 (= (arr!21736 _values!788) (store mapRest!23476 mapKey!23476 mapValue!23476))))

(declare-fun b!819739 () Bool)

(declare-fun res!559354 () Bool)

(declare-fun e!455283 () Bool)

(assert (=> b!819739 (=> (not res!559354) (not e!455283))))

(assert (=> b!819739 (= res!559354 (and (= (size!22157 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22156 _keys!976) (size!22157 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819740 () Bool)

(declare-fun res!559358 () Bool)

(assert (=> b!819740 (=> (not res!559358) (not e!455283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45364 (_ BitVec 32)) Bool)

(assert (=> b!819740 (= res!559358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819741 () Bool)

(assert (=> b!819741 (= e!455287 (= lt!368039 (+!1853 lt!368043 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!559356 () Bool)

(assert (=> start!70566 (=> (not res!559356) (not e!455283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70566 (= res!559356 (validMask!0 mask!1312))))

(assert (=> start!70566 e!455283))

(declare-fun tp_is_empty!14583 () Bool)

(assert (=> start!70566 tp_is_empty!14583))

(declare-fun array_inv!17373 (array!45364) Bool)

(assert (=> start!70566 (array_inv!17373 _keys!976)))

(assert (=> start!70566 true))

(declare-fun array_inv!17374 (array!45366) Bool)

(assert (=> start!70566 (and (array_inv!17374 _values!788) e!455285)))

(assert (=> start!70566 tp!45354))

(declare-fun mapIsEmpty!23476 () Bool)

(assert (=> mapIsEmpty!23476 mapRes!23476))

(declare-fun b!819742 () Bool)

(assert (=> b!819742 (= e!455286 tp_is_empty!14583)))

(declare-fun b!819743 () Bool)

(declare-fun res!559353 () Bool)

(assert (=> b!819743 (=> (not res!559353) (not e!455283))))

(declare-datatypes ((List!15487 0))(
  ( (Nil!15484) (Cons!15483 (h!16612 (_ BitVec 64)) (t!21818 List!15487)) )
))
(declare-fun arrayNoDuplicates!0 (array!45364 (_ BitVec 32) List!15487) Bool)

(assert (=> b!819743 (= res!559353 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15484))))

(declare-fun b!819744 () Bool)

(assert (=> b!819744 (= e!455288 tp_is_empty!14583)))

(declare-fun b!819745 () Bool)

(assert (=> b!819745 (= e!455283 (not e!455289))))

(declare-fun res!559357 () Bool)

(assert (=> b!819745 (=> res!559357 e!455289)))

(assert (=> b!819745 (= res!559357 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819745 (= lt!368041 lt!368043)))

(declare-fun lt!368037 () Unit!27995)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!399 (array!45364 array!45366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24445 V!24445 V!24445 V!24445 (_ BitVec 32) Int) Unit!27995)

(assert (=> b!819745 (= lt!368037 (lemmaNoChangeToArrayThenSameMapNoExtras!399 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2289 (array!45364 array!45366 (_ BitVec 32) (_ BitVec 32) V!24445 V!24445 (_ BitVec 32) Int) ListLongMap!8485)

(assert (=> b!819745 (= lt!368043 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819745 (= lt!368041 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70566 res!559356) b!819739))

(assert (= (and b!819739 res!559354) b!819740))

(assert (= (and b!819740 res!559358) b!819743))

(assert (= (and b!819743 res!559353) b!819745))

(assert (= (and b!819745 (not res!559357)) b!819737))

(assert (= (and b!819737 res!559355) b!819741))

(assert (= (and b!819738 condMapEmpty!23476) mapIsEmpty!23476))

(assert (= (and b!819738 (not condMapEmpty!23476)) mapNonEmpty!23476))

(get-info :version)

(assert (= (and mapNonEmpty!23476 ((_ is ValueCellFull!6876) mapValue!23476)) b!819744))

(assert (= (and b!819738 ((_ is ValueCellFull!6876) mapDefault!23476)) b!819742))

(assert (= start!70566 b!819738))

(declare-fun m!761459 () Bool)

(assert (=> b!819745 m!761459))

(declare-fun m!761461 () Bool)

(assert (=> b!819745 m!761461))

(declare-fun m!761463 () Bool)

(assert (=> b!819745 m!761463))

(declare-fun m!761465 () Bool)

(assert (=> b!819737 m!761465))

(declare-fun m!761467 () Bool)

(assert (=> b!819737 m!761467))

(declare-fun m!761469 () Bool)

(assert (=> b!819737 m!761469))

(declare-fun m!761471 () Bool)

(assert (=> b!819737 m!761471))

(declare-fun m!761473 () Bool)

(assert (=> b!819737 m!761473))

(declare-fun m!761475 () Bool)

(assert (=> b!819737 m!761475))

(assert (=> b!819737 m!761473))

(declare-fun m!761477 () Bool)

(assert (=> b!819737 m!761477))

(declare-fun m!761479 () Bool)

(assert (=> b!819737 m!761479))

(declare-fun m!761481 () Bool)

(assert (=> b!819743 m!761481))

(declare-fun m!761483 () Bool)

(assert (=> start!70566 m!761483))

(declare-fun m!761485 () Bool)

(assert (=> start!70566 m!761485))

(declare-fun m!761487 () Bool)

(assert (=> start!70566 m!761487))

(declare-fun m!761489 () Bool)

(assert (=> mapNonEmpty!23476 m!761489))

(declare-fun m!761491 () Bool)

(assert (=> b!819741 m!761491))

(declare-fun m!761493 () Bool)

(assert (=> b!819740 m!761493))

(check-sat tp_is_empty!14583 (not mapNonEmpty!23476) (not start!70566) (not b!819741) (not b!819737) b_and!21715 (not b!819745) (not b_next!12873) (not b!819740) (not b!819743))
(check-sat b_and!21715 (not b_next!12873))
