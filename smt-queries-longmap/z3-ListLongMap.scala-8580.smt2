; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104694 () Bool)

(assert start!104694)

(declare-fun b_free!26515 () Bool)

(declare-fun b_next!26515 () Bool)

(assert (=> start!104694 (= b_free!26515 (not b_next!26515))))

(declare-fun tp!93032 () Bool)

(declare-fun b_and!44261 () Bool)

(assert (=> start!104694 (= tp!93032 b_and!44261)))

(declare-fun b!1248142 () Bool)

(declare-fun e!708227 () Bool)

(declare-fun tp_is_empty!31417 () Bool)

(assert (=> b!1248142 (= e!708227 tp_is_empty!31417)))

(declare-fun mapIsEmpty!48883 () Bool)

(declare-fun mapRes!48883 () Bool)

(assert (=> mapIsEmpty!48883 mapRes!48883))

(declare-fun b!1248143 () Bool)

(declare-fun e!708229 () Bool)

(assert (=> b!1248143 (= e!708229 (and e!708227 mapRes!48883))))

(declare-fun condMapEmpty!48883 () Bool)

(declare-datatypes ((V!47255 0))(
  ( (V!47256 (val!15771 Int)) )
))
(declare-datatypes ((ValueCell!14945 0))(
  ( (ValueCellFull!14945 (v!18466 V!47255)) (EmptyCell!14945) )
))
(declare-datatypes ((array!80443 0))(
  ( (array!80444 (arr!38790 (Array (_ BitVec 32) ValueCell!14945)) (size!39328 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80443)

(declare-fun mapDefault!48883 () ValueCell!14945)

(assert (=> b!1248143 (= condMapEmpty!48883 (= (arr!38790 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14945)) mapDefault!48883)))))

(declare-fun b!1248144 () Bool)

(declare-fun res!832746 () Bool)

(declare-fun e!708226 () Bool)

(assert (=> b!1248144 (=> (not res!832746) (not e!708226))))

(declare-datatypes ((array!80445 0))(
  ( (array!80446 (arr!38791 (Array (_ BitVec 32) (_ BitVec 64))) (size!39329 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80445)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80445 (_ BitVec 32)) Bool)

(assert (=> b!1248144 (= res!832746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248145 () Bool)

(assert (=> b!1248145 (= e!708226 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20396 0))(
  ( (tuple2!20397 (_1!10209 (_ BitVec 64)) (_2!10209 V!47255)) )
))
(declare-datatypes ((List!27624 0))(
  ( (Nil!27621) (Cons!27620 (h!28829 tuple2!20396) (t!41084 List!27624)) )
))
(declare-datatypes ((ListLongMap!18269 0))(
  ( (ListLongMap!18270 (toList!9150 List!27624)) )
))
(declare-fun lt!563198 () ListLongMap!18269)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47255)

(declare-fun minValueBefore!43 () V!47255)

(declare-fun getCurrentListMapNoExtraKeys!5567 (array!80445 array!80443 (_ BitVec 32) (_ BitVec 32) V!47255 V!47255 (_ BitVec 32) Int) ListLongMap!18269)

(assert (=> b!1248145 (= lt!563198 (getCurrentListMapNoExtraKeys!5567 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248147 () Bool)

(declare-fun res!832748 () Bool)

(assert (=> b!1248147 (=> (not res!832748) (not e!708226))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248147 (= res!832748 (and (= (size!39328 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39329 _keys!1118) (size!39328 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248148 () Bool)

(declare-fun res!832747 () Bool)

(assert (=> b!1248148 (=> (not res!832747) (not e!708226))))

(declare-datatypes ((List!27625 0))(
  ( (Nil!27622) (Cons!27621 (h!28830 (_ BitVec 64)) (t!41085 List!27625)) )
))
(declare-fun arrayNoDuplicates!0 (array!80445 (_ BitVec 32) List!27625) Bool)

(assert (=> b!1248148 (= res!832747 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27622))))

(declare-fun mapNonEmpty!48883 () Bool)

(declare-fun tp!93031 () Bool)

(declare-fun e!708225 () Bool)

(assert (=> mapNonEmpty!48883 (= mapRes!48883 (and tp!93031 e!708225))))

(declare-fun mapRest!48883 () (Array (_ BitVec 32) ValueCell!14945))

(declare-fun mapValue!48883 () ValueCell!14945)

(declare-fun mapKey!48883 () (_ BitVec 32))

(assert (=> mapNonEmpty!48883 (= (arr!38790 _values!914) (store mapRest!48883 mapKey!48883 mapValue!48883))))

(declare-fun res!832745 () Bool)

(assert (=> start!104694 (=> (not res!832745) (not e!708226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104694 (= res!832745 (validMask!0 mask!1466))))

(assert (=> start!104694 e!708226))

(assert (=> start!104694 true))

(assert (=> start!104694 tp!93032))

(assert (=> start!104694 tp_is_empty!31417))

(declare-fun array_inv!29741 (array!80445) Bool)

(assert (=> start!104694 (array_inv!29741 _keys!1118)))

(declare-fun array_inv!29742 (array!80443) Bool)

(assert (=> start!104694 (and (array_inv!29742 _values!914) e!708229)))

(declare-fun b!1248146 () Bool)

(assert (=> b!1248146 (= e!708225 tp_is_empty!31417)))

(assert (= (and start!104694 res!832745) b!1248147))

(assert (= (and b!1248147 res!832748) b!1248144))

(assert (= (and b!1248144 res!832746) b!1248148))

(assert (= (and b!1248148 res!832747) b!1248145))

(assert (= (and b!1248143 condMapEmpty!48883) mapIsEmpty!48883))

(assert (= (and b!1248143 (not condMapEmpty!48883)) mapNonEmpty!48883))

(get-info :version)

(assert (= (and mapNonEmpty!48883 ((_ is ValueCellFull!14945) mapValue!48883)) b!1248146))

(assert (= (and b!1248143 ((_ is ValueCellFull!14945) mapDefault!48883)) b!1248142))

(assert (= start!104694 b!1248143))

(declare-fun m!1148939 () Bool)

(assert (=> b!1248145 m!1148939))

(declare-fun m!1148941 () Bool)

(assert (=> b!1248148 m!1148941))

(declare-fun m!1148943 () Bool)

(assert (=> b!1248144 m!1148943))

(declare-fun m!1148945 () Bool)

(assert (=> start!104694 m!1148945))

(declare-fun m!1148947 () Bool)

(assert (=> start!104694 m!1148947))

(declare-fun m!1148949 () Bool)

(assert (=> start!104694 m!1148949))

(declare-fun m!1148951 () Bool)

(assert (=> mapNonEmpty!48883 m!1148951))

(check-sat (not mapNonEmpty!48883) (not b!1248148) b_and!44261 (not b!1248144) tp_is_empty!31417 (not b!1248145) (not b_next!26515) (not start!104694))
(check-sat b_and!44261 (not b_next!26515))
