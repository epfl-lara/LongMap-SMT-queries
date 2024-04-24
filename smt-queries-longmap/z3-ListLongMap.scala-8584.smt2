; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104958 () Bool)

(assert start!104958)

(declare-fun b_free!26539 () Bool)

(declare-fun b_next!26539 () Bool)

(assert (=> start!104958 (= b_free!26539 (not b_next!26539))))

(declare-fun tp!93107 () Bool)

(declare-fun b_and!44309 () Bool)

(assert (=> start!104958 (= tp!93107 b_and!44309)))

(declare-fun mapIsEmpty!48922 () Bool)

(declare-fun mapRes!48922 () Bool)

(assert (=> mapIsEmpty!48922 mapRes!48922))

(declare-fun b!1249854 () Bool)

(declare-fun res!833478 () Bool)

(declare-fun e!709349 () Bool)

(assert (=> b!1249854 (=> (not res!833478) (not e!709349))))

(declare-datatypes ((array!80607 0))(
  ( (array!80608 (arr!38866 (Array (_ BitVec 32) (_ BitVec 64))) (size!39403 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80607)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80607 (_ BitVec 32)) Bool)

(assert (=> b!1249854 (= res!833478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48922 () Bool)

(declare-fun tp!93106 () Bool)

(declare-fun e!709346 () Bool)

(assert (=> mapNonEmpty!48922 (= mapRes!48922 (and tp!93106 e!709346))))

(declare-datatypes ((V!47287 0))(
  ( (V!47288 (val!15783 Int)) )
))
(declare-datatypes ((ValueCell!14957 0))(
  ( (ValueCellFull!14957 (v!18475 V!47287)) (EmptyCell!14957) )
))
(declare-fun mapRest!48922 () (Array (_ BitVec 32) ValueCell!14957))

(declare-fun mapValue!48922 () ValueCell!14957)

(declare-datatypes ((array!80609 0))(
  ( (array!80610 (arr!38867 (Array (_ BitVec 32) ValueCell!14957)) (size!39404 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80609)

(declare-fun mapKey!48922 () (_ BitVec 32))

(assert (=> mapNonEmpty!48922 (= (arr!38867 _values!914) (store mapRest!48922 mapKey!48922 mapValue!48922))))

(declare-fun b!1249855 () Bool)

(declare-fun e!709347 () Bool)

(declare-fun e!709345 () Bool)

(assert (=> b!1249855 (= e!709347 (and e!709345 mapRes!48922))))

(declare-fun condMapEmpty!48922 () Bool)

(declare-fun mapDefault!48922 () ValueCell!14957)

(assert (=> b!1249855 (= condMapEmpty!48922 (= (arr!38867 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14957)) mapDefault!48922)))))

(declare-fun res!833476 () Bool)

(assert (=> start!104958 (=> (not res!833476) (not e!709349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104958 (= res!833476 (validMask!0 mask!1466))))

(assert (=> start!104958 e!709349))

(assert (=> start!104958 true))

(assert (=> start!104958 tp!93107))

(declare-fun tp_is_empty!31441 () Bool)

(assert (=> start!104958 tp_is_empty!31441))

(declare-fun array_inv!29771 (array!80607) Bool)

(assert (=> start!104958 (array_inv!29771 _keys!1118)))

(declare-fun array_inv!29772 (array!80609) Bool)

(assert (=> start!104958 (and (array_inv!29772 _values!914) e!709347)))

(declare-fun b!1249856 () Bool)

(assert (=> b!1249856 (= e!709346 tp_is_empty!31441)))

(declare-fun b!1249857 () Bool)

(declare-fun res!833479 () Bool)

(assert (=> b!1249857 (=> (not res!833479) (not e!709349))))

(declare-datatypes ((List!27605 0))(
  ( (Nil!27602) (Cons!27601 (h!28819 (_ BitVec 64)) (t!41068 List!27605)) )
))
(declare-fun arrayNoDuplicates!0 (array!80607 (_ BitVec 32) List!27605) Bool)

(assert (=> b!1249857 (= res!833479 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27602))))

(declare-fun b!1249858 () Bool)

(declare-fun res!833477 () Bool)

(assert (=> b!1249858 (=> (not res!833477) (not e!709349))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1249858 (= res!833477 (and (= (size!39404 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39403 _keys!1118) (size!39404 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249859 () Bool)

(assert (=> b!1249859 (= e!709345 tp_is_empty!31441)))

(declare-fun b!1249860 () Bool)

(assert (=> b!1249860 (= e!709349 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20348 0))(
  ( (tuple2!20349 (_1!10185 (_ BitVec 64)) (_2!10185 V!47287)) )
))
(declare-datatypes ((List!27606 0))(
  ( (Nil!27603) (Cons!27602 (h!28820 tuple2!20348) (t!41069 List!27606)) )
))
(declare-datatypes ((ListLongMap!18229 0))(
  ( (ListLongMap!18230 (toList!9130 List!27606)) )
))
(declare-fun lt!563929 () ListLongMap!18229)

(declare-fun minValueAfter!43 () V!47287)

(declare-fun zeroValue!871 () V!47287)

(declare-fun getCurrentListMapNoExtraKeys!5565 (array!80607 array!80609 (_ BitVec 32) (_ BitVec 32) V!47287 V!47287 (_ BitVec 32) Int) ListLongMap!18229)

(assert (=> b!1249860 (= lt!563929 (getCurrentListMapNoExtraKeys!5565 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563930 () ListLongMap!18229)

(declare-fun minValueBefore!43 () V!47287)

(assert (=> b!1249860 (= lt!563930 (getCurrentListMapNoExtraKeys!5565 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104958 res!833476) b!1249858))

(assert (= (and b!1249858 res!833477) b!1249854))

(assert (= (and b!1249854 res!833478) b!1249857))

(assert (= (and b!1249857 res!833479) b!1249860))

(assert (= (and b!1249855 condMapEmpty!48922) mapIsEmpty!48922))

(assert (= (and b!1249855 (not condMapEmpty!48922)) mapNonEmpty!48922))

(get-info :version)

(assert (= (and mapNonEmpty!48922 ((_ is ValueCellFull!14957) mapValue!48922)) b!1249856))

(assert (= (and b!1249855 ((_ is ValueCellFull!14957) mapDefault!48922)) b!1249859))

(assert (= start!104958 b!1249855))

(declare-fun m!1151283 () Bool)

(assert (=> b!1249857 m!1151283))

(declare-fun m!1151285 () Bool)

(assert (=> start!104958 m!1151285))

(declare-fun m!1151287 () Bool)

(assert (=> start!104958 m!1151287))

(declare-fun m!1151289 () Bool)

(assert (=> start!104958 m!1151289))

(declare-fun m!1151291 () Bool)

(assert (=> b!1249860 m!1151291))

(declare-fun m!1151293 () Bool)

(assert (=> b!1249860 m!1151293))

(declare-fun m!1151295 () Bool)

(assert (=> mapNonEmpty!48922 m!1151295))

(declare-fun m!1151297 () Bool)

(assert (=> b!1249854 m!1151297))

(check-sat (not b_next!26539) tp_is_empty!31441 (not b!1249857) b_and!44309 (not b!1249854) (not start!104958) (not b!1249860) (not mapNonEmpty!48922))
(check-sat b_and!44309 (not b_next!26539))
