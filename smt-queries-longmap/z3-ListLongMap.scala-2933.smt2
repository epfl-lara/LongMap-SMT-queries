; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41788 () Bool)

(assert start!41788)

(declare-fun b_free!11409 () Bool)

(declare-fun b_next!11409 () Bool)

(assert (=> start!41788 (= b_free!11409 (not b_next!11409))))

(declare-fun tp!40233 () Bool)

(declare-fun b_and!19777 () Bool)

(assert (=> start!41788 (= tp!40233 b_and!19777)))

(declare-fun b!466626 () Bool)

(declare-fun e!272868 () Bool)

(declare-fun e!272867 () Bool)

(assert (=> b!466626 (= e!272868 (not e!272867))))

(declare-fun res!278922 () Bool)

(assert (=> b!466626 (=> res!278922 e!272867)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466626 (= res!278922 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18221 0))(
  ( (V!18222 (val!6463 Int)) )
))
(declare-datatypes ((tuple2!8476 0))(
  ( (tuple2!8477 (_1!4249 (_ BitVec 64)) (_2!4249 V!18221)) )
))
(declare-datatypes ((List!8566 0))(
  ( (Nil!8563) (Cons!8562 (h!9418 tuple2!8476) (t!14518 List!8566)) )
))
(declare-datatypes ((ListLongMap!7389 0))(
  ( (ListLongMap!7390 (toList!3710 List!8566)) )
))
(declare-fun lt!210912 () ListLongMap!7389)

(declare-fun lt!210908 () ListLongMap!7389)

(assert (=> b!466626 (= lt!210912 lt!210908)))

(declare-fun minValueBefore!38 () V!18221)

(declare-fun zeroValue!794 () V!18221)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13582 0))(
  ( (Unit!13583) )
))
(declare-fun lt!210911 () Unit!13582)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29455 0))(
  ( (array!29456 (arr!14156 (Array (_ BitVec 32) (_ BitVec 64))) (size!14508 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29455)

(declare-datatypes ((ValueCell!6075 0))(
  ( (ValueCellFull!6075 (v!8751 V!18221)) (EmptyCell!6075) )
))
(declare-datatypes ((array!29457 0))(
  ( (array!29458 (arr!14157 (Array (_ BitVec 32) ValueCell!6075)) (size!14509 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29457)

(declare-fun minValueAfter!38 () V!18221)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!66 (array!29455 array!29457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18221 V!18221 V!18221 V!18221 (_ BitVec 32) Int) Unit!13582)

(assert (=> b!466626 (= lt!210911 (lemmaNoChangeToArrayThenSameMapNoExtras!66 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1886 (array!29455 array!29457 (_ BitVec 32) (_ BitVec 32) V!18221 V!18221 (_ BitVec 32) Int) ListLongMap!7389)

(assert (=> b!466626 (= lt!210908 (getCurrentListMapNoExtraKeys!1886 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466626 (= lt!210912 (getCurrentListMapNoExtraKeys!1886 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466627 () Bool)

(assert (=> b!466627 (= e!272867 true)))

(declare-fun lt!210910 () ListLongMap!7389)

(declare-fun getCurrentListMap!2160 (array!29455 array!29457 (_ BitVec 32) (_ BitVec 32) V!18221 V!18221 (_ BitVec 32) Int) ListLongMap!7389)

(assert (=> b!466627 (= lt!210910 (getCurrentListMap!2160 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210909 () ListLongMap!7389)

(declare-fun +!1666 (ListLongMap!7389 tuple2!8476) ListLongMap!7389)

(assert (=> b!466627 (= lt!210909 (+!1666 (getCurrentListMap!2160 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8477 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466628 () Bool)

(declare-fun e!272866 () Bool)

(declare-fun tp_is_empty!12837 () Bool)

(assert (=> b!466628 (= e!272866 tp_is_empty!12837)))

(declare-fun b!466629 () Bool)

(declare-fun res!278920 () Bool)

(assert (=> b!466629 (=> (not res!278920) (not e!272868))))

(declare-datatypes ((List!8567 0))(
  ( (Nil!8564) (Cons!8563 (h!9419 (_ BitVec 64)) (t!14519 List!8567)) )
))
(declare-fun arrayNoDuplicates!0 (array!29455 (_ BitVec 32) List!8567) Bool)

(assert (=> b!466629 (= res!278920 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8564))))

(declare-fun res!278921 () Bool)

(assert (=> start!41788 (=> (not res!278921) (not e!272868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41788 (= res!278921 (validMask!0 mask!1365))))

(assert (=> start!41788 e!272868))

(assert (=> start!41788 tp_is_empty!12837))

(assert (=> start!41788 tp!40233))

(assert (=> start!41788 true))

(declare-fun array_inv!10222 (array!29455) Bool)

(assert (=> start!41788 (array_inv!10222 _keys!1025)))

(declare-fun e!272864 () Bool)

(declare-fun array_inv!10223 (array!29457) Bool)

(assert (=> start!41788 (and (array_inv!10223 _values!833) e!272864)))

(declare-fun b!466630 () Bool)

(declare-fun mapRes!20941 () Bool)

(assert (=> b!466630 (= e!272864 (and e!272866 mapRes!20941))))

(declare-fun condMapEmpty!20941 () Bool)

(declare-fun mapDefault!20941 () ValueCell!6075)

(assert (=> b!466630 (= condMapEmpty!20941 (= (arr!14157 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6075)) mapDefault!20941)))))

(declare-fun b!466631 () Bool)

(declare-fun res!278923 () Bool)

(assert (=> b!466631 (=> (not res!278923) (not e!272868))))

(assert (=> b!466631 (= res!278923 (and (= (size!14509 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14508 _keys!1025) (size!14509 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20941 () Bool)

(assert (=> mapIsEmpty!20941 mapRes!20941))

(declare-fun b!466632 () Bool)

(declare-fun res!278924 () Bool)

(assert (=> b!466632 (=> (not res!278924) (not e!272868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29455 (_ BitVec 32)) Bool)

(assert (=> b!466632 (= res!278924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466633 () Bool)

(declare-fun e!272865 () Bool)

(assert (=> b!466633 (= e!272865 tp_is_empty!12837)))

(declare-fun mapNonEmpty!20941 () Bool)

(declare-fun tp!40234 () Bool)

(assert (=> mapNonEmpty!20941 (= mapRes!20941 (and tp!40234 e!272865))))

(declare-fun mapValue!20941 () ValueCell!6075)

(declare-fun mapRest!20941 () (Array (_ BitVec 32) ValueCell!6075))

(declare-fun mapKey!20941 () (_ BitVec 32))

(assert (=> mapNonEmpty!20941 (= (arr!14157 _values!833) (store mapRest!20941 mapKey!20941 mapValue!20941))))

(assert (= (and start!41788 res!278921) b!466631))

(assert (= (and b!466631 res!278923) b!466632))

(assert (= (and b!466632 res!278924) b!466629))

(assert (= (and b!466629 res!278920) b!466626))

(assert (= (and b!466626 (not res!278922)) b!466627))

(assert (= (and b!466630 condMapEmpty!20941) mapIsEmpty!20941))

(assert (= (and b!466630 (not condMapEmpty!20941)) mapNonEmpty!20941))

(get-info :version)

(assert (= (and mapNonEmpty!20941 ((_ is ValueCellFull!6075) mapValue!20941)) b!466633))

(assert (= (and b!466630 ((_ is ValueCellFull!6075) mapDefault!20941)) b!466628))

(assert (= start!41788 b!466630))

(declare-fun m!448843 () Bool)

(assert (=> b!466632 m!448843))

(declare-fun m!448845 () Bool)

(assert (=> b!466626 m!448845))

(declare-fun m!448847 () Bool)

(assert (=> b!466626 m!448847))

(declare-fun m!448849 () Bool)

(assert (=> b!466626 m!448849))

(declare-fun m!448851 () Bool)

(assert (=> mapNonEmpty!20941 m!448851))

(declare-fun m!448853 () Bool)

(assert (=> start!41788 m!448853))

(declare-fun m!448855 () Bool)

(assert (=> start!41788 m!448855))

(declare-fun m!448857 () Bool)

(assert (=> start!41788 m!448857))

(declare-fun m!448859 () Bool)

(assert (=> b!466629 m!448859))

(declare-fun m!448861 () Bool)

(assert (=> b!466627 m!448861))

(declare-fun m!448863 () Bool)

(assert (=> b!466627 m!448863))

(assert (=> b!466627 m!448863))

(declare-fun m!448865 () Bool)

(assert (=> b!466627 m!448865))

(check-sat (not b_next!11409) (not b!466626) b_and!19777 (not b!466632) tp_is_empty!12837 (not b!466627) (not start!41788) (not b!466629) (not mapNonEmpty!20941))
(check-sat b_and!19777 (not b_next!11409))
