; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41826 () Bool)

(assert start!41826)

(declare-fun b_free!11443 () Bool)

(declare-fun b_next!11443 () Bool)

(assert (=> start!41826 (= b_free!11443 (not b_next!11443))))

(declare-fun tp!40339 () Bool)

(declare-fun b_and!19797 () Bool)

(assert (=> start!41826 (= tp!40339 b_and!19797)))

(declare-fun b!466927 () Bool)

(declare-fun res!279110 () Bool)

(declare-fun e!273090 () Bool)

(assert (=> b!466927 (=> (not res!279110) (not e!273090))))

(declare-datatypes ((array!29517 0))(
  ( (array!29518 (arr!14186 (Array (_ BitVec 32) (_ BitVec 64))) (size!14539 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29517)

(declare-datatypes ((List!8625 0))(
  ( (Nil!8622) (Cons!8621 (h!9477 (_ BitVec 64)) (t!14570 List!8625)) )
))
(declare-fun arrayNoDuplicates!0 (array!29517 (_ BitVec 32) List!8625) Bool)

(assert (=> b!466927 (= res!279110 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8622))))

(declare-fun b!466928 () Bool)

(declare-fun res!279108 () Bool)

(assert (=> b!466928 (=> (not res!279108) (not e!273090))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29517 (_ BitVec 32)) Bool)

(assert (=> b!466928 (= res!279108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466929 () Bool)

(assert (=> b!466929 (= e!273090 (not true))))

(declare-datatypes ((V!18267 0))(
  ( (V!18268 (val!6480 Int)) )
))
(declare-datatypes ((tuple2!8544 0))(
  ( (tuple2!8545 (_1!4283 (_ BitVec 64)) (_2!4283 V!18267)) )
))
(declare-datatypes ((List!8626 0))(
  ( (Nil!8623) (Cons!8622 (h!9478 tuple2!8544) (t!14571 List!8626)) )
))
(declare-datatypes ((ListLongMap!7447 0))(
  ( (ListLongMap!7448 (toList!3739 List!8626)) )
))
(declare-fun lt!211012 () ListLongMap!7447)

(declare-fun lt!211013 () ListLongMap!7447)

(assert (=> b!466929 (= lt!211012 lt!211013)))

(declare-fun minValueBefore!38 () V!18267)

(declare-datatypes ((Unit!13582 0))(
  ( (Unit!13583) )
))
(declare-fun lt!211011 () Unit!13582)

(declare-fun zeroValue!794 () V!18267)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6092 0))(
  ( (ValueCellFull!6092 (v!8763 V!18267)) (EmptyCell!6092) )
))
(declare-datatypes ((array!29519 0))(
  ( (array!29520 (arr!14187 (Array (_ BitVec 32) ValueCell!6092)) (size!14540 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29519)

(declare-fun minValueAfter!38 () V!18267)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!80 (array!29517 array!29519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18267 V!18267 V!18267 V!18267 (_ BitVec 32) Int) Unit!13582)

(assert (=> b!466929 (= lt!211011 (lemmaNoChangeToArrayThenSameMapNoExtras!80 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1923 (array!29517 array!29519 (_ BitVec 32) (_ BitVec 32) V!18267 V!18267 (_ BitVec 32) Int) ListLongMap!7447)

(assert (=> b!466929 (= lt!211013 (getCurrentListMapNoExtraKeys!1923 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466929 (= lt!211012 (getCurrentListMapNoExtraKeys!1923 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20995 () Bool)

(declare-fun mapRes!20995 () Bool)

(assert (=> mapIsEmpty!20995 mapRes!20995))

(declare-fun mapNonEmpty!20995 () Bool)

(declare-fun tp!40338 () Bool)

(declare-fun e!273089 () Bool)

(assert (=> mapNonEmpty!20995 (= mapRes!20995 (and tp!40338 e!273089))))

(declare-fun mapValue!20995 () ValueCell!6092)

(declare-fun mapRest!20995 () (Array (_ BitVec 32) ValueCell!6092))

(declare-fun mapKey!20995 () (_ BitVec 32))

(assert (=> mapNonEmpty!20995 (= (arr!14187 _values!833) (store mapRest!20995 mapKey!20995 mapValue!20995))))

(declare-fun b!466931 () Bool)

(declare-fun e!273087 () Bool)

(declare-fun e!273088 () Bool)

(assert (=> b!466931 (= e!273087 (and e!273088 mapRes!20995))))

(declare-fun condMapEmpty!20995 () Bool)

(declare-fun mapDefault!20995 () ValueCell!6092)

(assert (=> b!466931 (= condMapEmpty!20995 (= (arr!14187 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6092)) mapDefault!20995)))))

(declare-fun b!466932 () Bool)

(declare-fun tp_is_empty!12871 () Bool)

(assert (=> b!466932 (= e!273089 tp_is_empty!12871)))

(declare-fun b!466933 () Bool)

(declare-fun res!279111 () Bool)

(assert (=> b!466933 (=> (not res!279111) (not e!273090))))

(assert (=> b!466933 (= res!279111 (and (= (size!14540 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14539 _keys!1025) (size!14540 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279109 () Bool)

(assert (=> start!41826 (=> (not res!279109) (not e!273090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41826 (= res!279109 (validMask!0 mask!1365))))

(assert (=> start!41826 e!273090))

(assert (=> start!41826 tp_is_empty!12871))

(assert (=> start!41826 tp!40339))

(assert (=> start!41826 true))

(declare-fun array_inv!10326 (array!29517) Bool)

(assert (=> start!41826 (array_inv!10326 _keys!1025)))

(declare-fun array_inv!10327 (array!29519) Bool)

(assert (=> start!41826 (and (array_inv!10327 _values!833) e!273087)))

(declare-fun b!466930 () Bool)

(assert (=> b!466930 (= e!273088 tp_is_empty!12871)))

(assert (= (and start!41826 res!279109) b!466933))

(assert (= (and b!466933 res!279111) b!466928))

(assert (= (and b!466928 res!279108) b!466927))

(assert (= (and b!466927 res!279110) b!466929))

(assert (= (and b!466931 condMapEmpty!20995) mapIsEmpty!20995))

(assert (= (and b!466931 (not condMapEmpty!20995)) mapNonEmpty!20995))

(get-info :version)

(assert (= (and mapNonEmpty!20995 ((_ is ValueCellFull!6092) mapValue!20995)) b!466932))

(assert (= (and b!466931 ((_ is ValueCellFull!6092) mapDefault!20995)) b!466930))

(assert (= start!41826 b!466931))

(declare-fun m!448651 () Bool)

(assert (=> start!41826 m!448651))

(declare-fun m!448653 () Bool)

(assert (=> start!41826 m!448653))

(declare-fun m!448655 () Bool)

(assert (=> start!41826 m!448655))

(declare-fun m!448657 () Bool)

(assert (=> mapNonEmpty!20995 m!448657))

(declare-fun m!448659 () Bool)

(assert (=> b!466927 m!448659))

(declare-fun m!448661 () Bool)

(assert (=> b!466929 m!448661))

(declare-fun m!448663 () Bool)

(assert (=> b!466929 m!448663))

(declare-fun m!448665 () Bool)

(assert (=> b!466929 m!448665))

(declare-fun m!448667 () Bool)

(assert (=> b!466928 m!448667))

(check-sat (not b!466929) (not mapNonEmpty!20995) tp_is_empty!12871 b_and!19797 (not start!41826) (not b_next!11443) (not b!466927) (not b!466928))
(check-sat b_and!19797 (not b_next!11443))
