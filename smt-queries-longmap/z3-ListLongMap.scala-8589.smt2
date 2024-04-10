; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104766 () Bool)

(assert start!104766)

(declare-fun b_free!26571 () Bool)

(declare-fun b_next!26571 () Bool)

(assert (=> start!104766 (= b_free!26571 (not b_next!26571))))

(declare-fun tp!93203 () Bool)

(declare-fun b_and!44339 () Bool)

(assert (=> start!104766 (= tp!93203 b_and!44339)))

(declare-fun b!1248885 () Bool)

(declare-fun e!708741 () Bool)

(declare-fun tp_is_empty!31473 () Bool)

(assert (=> b!1248885 (= e!708741 tp_is_empty!31473)))

(declare-fun b!1248886 () Bool)

(declare-fun e!708738 () Bool)

(assert (=> b!1248886 (= e!708738 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47329 0))(
  ( (V!47330 (val!15799 Int)) )
))
(declare-fun minValueAfter!43 () V!47329)

(declare-fun zeroValue!871 () V!47329)

(declare-datatypes ((array!80632 0))(
  ( (array!80633 (arr!38883 (Array (_ BitVec 32) (_ BitVec 64))) (size!39419 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80632)

(declare-datatypes ((ValueCell!14973 0))(
  ( (ValueCellFull!14973 (v!18495 V!47329)) (EmptyCell!14973) )
))
(declare-datatypes ((array!80634 0))(
  ( (array!80635 (arr!38884 (Array (_ BitVec 32) ValueCell!14973)) (size!39420 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80634)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((tuple2!20346 0))(
  ( (tuple2!20347 (_1!10184 (_ BitVec 64)) (_2!10184 V!47329)) )
))
(declare-datatypes ((List!27593 0))(
  ( (Nil!27590) (Cons!27589 (h!28798 tuple2!20346) (t!41064 List!27593)) )
))
(declare-datatypes ((ListLongMap!18219 0))(
  ( (ListLongMap!18220 (toList!9125 List!27593)) )
))
(declare-fun lt!563541 () ListLongMap!18219)

(declare-fun getCurrentListMapNoExtraKeys!5532 (array!80632 array!80634 (_ BitVec 32) (_ BitVec 32) V!47329 V!47329 (_ BitVec 32) Int) ListLongMap!18219)

(assert (=> b!1248886 (= lt!563541 (getCurrentListMapNoExtraKeys!5532 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47329)

(declare-fun lt!563542 () ListLongMap!18219)

(assert (=> b!1248886 (= lt!563542 (getCurrentListMapNoExtraKeys!5532 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248887 () Bool)

(declare-fun res!833149 () Bool)

(assert (=> b!1248887 (=> (not res!833149) (not e!708738))))

(assert (=> b!1248887 (= res!833149 (and (= (size!39420 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39419 _keys!1118) (size!39420 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248888 () Bool)

(declare-fun e!708740 () Bool)

(assert (=> b!1248888 (= e!708740 tp_is_empty!31473)))

(declare-fun mapNonEmpty!48970 () Bool)

(declare-fun mapRes!48970 () Bool)

(declare-fun tp!93202 () Bool)

(assert (=> mapNonEmpty!48970 (= mapRes!48970 (and tp!93202 e!708740))))

(declare-fun mapValue!48970 () ValueCell!14973)

(declare-fun mapKey!48970 () (_ BitVec 32))

(declare-fun mapRest!48970 () (Array (_ BitVec 32) ValueCell!14973))

(assert (=> mapNonEmpty!48970 (= (arr!38884 _values!914) (store mapRest!48970 mapKey!48970 mapValue!48970))))

(declare-fun res!833148 () Bool)

(assert (=> start!104766 (=> (not res!833148) (not e!708738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104766 (= res!833148 (validMask!0 mask!1466))))

(assert (=> start!104766 e!708738))

(assert (=> start!104766 true))

(assert (=> start!104766 tp!93203))

(assert (=> start!104766 tp_is_empty!31473))

(declare-fun array_inv!29671 (array!80632) Bool)

(assert (=> start!104766 (array_inv!29671 _keys!1118)))

(declare-fun e!708742 () Bool)

(declare-fun array_inv!29672 (array!80634) Bool)

(assert (=> start!104766 (and (array_inv!29672 _values!914) e!708742)))

(declare-fun b!1248889 () Bool)

(declare-fun res!833151 () Bool)

(assert (=> b!1248889 (=> (not res!833151) (not e!708738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80632 (_ BitVec 32)) Bool)

(assert (=> b!1248889 (= res!833151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48970 () Bool)

(assert (=> mapIsEmpty!48970 mapRes!48970))

(declare-fun b!1248890 () Bool)

(declare-fun res!833150 () Bool)

(assert (=> b!1248890 (=> (not res!833150) (not e!708738))))

(declare-datatypes ((List!27594 0))(
  ( (Nil!27591) (Cons!27590 (h!28799 (_ BitVec 64)) (t!41065 List!27594)) )
))
(declare-fun arrayNoDuplicates!0 (array!80632 (_ BitVec 32) List!27594) Bool)

(assert (=> b!1248890 (= res!833150 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27591))))

(declare-fun b!1248891 () Bool)

(assert (=> b!1248891 (= e!708742 (and e!708741 mapRes!48970))))

(declare-fun condMapEmpty!48970 () Bool)

(declare-fun mapDefault!48970 () ValueCell!14973)

(assert (=> b!1248891 (= condMapEmpty!48970 (= (arr!38884 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14973)) mapDefault!48970)))))

(assert (= (and start!104766 res!833148) b!1248887))

(assert (= (and b!1248887 res!833149) b!1248889))

(assert (= (and b!1248889 res!833151) b!1248890))

(assert (= (and b!1248890 res!833150) b!1248886))

(assert (= (and b!1248891 condMapEmpty!48970) mapIsEmpty!48970))

(assert (= (and b!1248891 (not condMapEmpty!48970)) mapNonEmpty!48970))

(get-info :version)

(assert (= (and mapNonEmpty!48970 ((_ is ValueCellFull!14973) mapValue!48970)) b!1248888))

(assert (= (and b!1248891 ((_ is ValueCellFull!14973) mapDefault!48970)) b!1248885))

(assert (= start!104766 b!1248891))

(declare-fun m!1149927 () Bool)

(assert (=> b!1248889 m!1149927))

(declare-fun m!1149929 () Bool)

(assert (=> start!104766 m!1149929))

(declare-fun m!1149931 () Bool)

(assert (=> start!104766 m!1149931))

(declare-fun m!1149933 () Bool)

(assert (=> start!104766 m!1149933))

(declare-fun m!1149935 () Bool)

(assert (=> b!1248886 m!1149935))

(declare-fun m!1149937 () Bool)

(assert (=> b!1248886 m!1149937))

(declare-fun m!1149939 () Bool)

(assert (=> b!1248890 m!1149939))

(declare-fun m!1149941 () Bool)

(assert (=> mapNonEmpty!48970 m!1149941))

(check-sat (not b_next!26571) (not b!1248890) (not start!104766) (not b!1248889) tp_is_empty!31473 (not mapNonEmpty!48970) b_and!44339 (not b!1248886))
(check-sat b_and!44339 (not b_next!26571))
