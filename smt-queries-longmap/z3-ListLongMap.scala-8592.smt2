; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104784 () Bool)

(assert start!104784)

(declare-fun b_free!26589 () Bool)

(declare-fun b_next!26589 () Bool)

(assert (=> start!104784 (= b_free!26589 (not b_next!26589))))

(declare-fun tp!93257 () Bool)

(declare-fun b_and!44357 () Bool)

(assert (=> start!104784 (= tp!93257 b_and!44357)))

(declare-fun res!833257 () Bool)

(declare-fun e!708876 () Bool)

(assert (=> start!104784 (=> (not res!833257) (not e!708876))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104784 (= res!833257 (validMask!0 mask!1466))))

(assert (=> start!104784 e!708876))

(assert (=> start!104784 true))

(assert (=> start!104784 tp!93257))

(declare-fun tp_is_empty!31491 () Bool)

(assert (=> start!104784 tp_is_empty!31491))

(declare-datatypes ((array!80666 0))(
  ( (array!80667 (arr!38900 (Array (_ BitVec 32) (_ BitVec 64))) (size!39436 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80666)

(declare-fun array_inv!29687 (array!80666) Bool)

(assert (=> start!104784 (array_inv!29687 _keys!1118)))

(declare-datatypes ((V!47353 0))(
  ( (V!47354 (val!15808 Int)) )
))
(declare-datatypes ((ValueCell!14982 0))(
  ( (ValueCellFull!14982 (v!18504 V!47353)) (EmptyCell!14982) )
))
(declare-datatypes ((array!80668 0))(
  ( (array!80669 (arr!38901 (Array (_ BitVec 32) ValueCell!14982)) (size!39437 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80668)

(declare-fun e!708874 () Bool)

(declare-fun array_inv!29688 (array!80668) Bool)

(assert (=> start!104784 (and (array_inv!29688 _values!914) e!708874)))

(declare-fun b!1249074 () Bool)

(declare-fun res!833258 () Bool)

(assert (=> b!1249074 (=> (not res!833258) (not e!708876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80666 (_ BitVec 32)) Bool)

(assert (=> b!1249074 (= res!833258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48997 () Bool)

(declare-fun mapRes!48997 () Bool)

(assert (=> mapIsEmpty!48997 mapRes!48997))

(declare-fun b!1249075 () Bool)

(declare-fun res!833256 () Bool)

(assert (=> b!1249075 (=> (not res!833256) (not e!708876))))

(declare-datatypes ((List!27609 0))(
  ( (Nil!27606) (Cons!27605 (h!28814 (_ BitVec 64)) (t!41080 List!27609)) )
))
(declare-fun arrayNoDuplicates!0 (array!80666 (_ BitVec 32) List!27609) Bool)

(assert (=> b!1249075 (= res!833256 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27606))))

(declare-fun b!1249076 () Bool)

(declare-fun res!833259 () Bool)

(assert (=> b!1249076 (=> (not res!833259) (not e!708876))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249076 (= res!833259 (and (= (size!39437 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39436 _keys!1118) (size!39437 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249077 () Bool)

(declare-fun e!708877 () Bool)

(assert (=> b!1249077 (= e!708877 tp_is_empty!31491)))

(declare-fun b!1249078 () Bool)

(declare-fun e!708873 () Bool)

(assert (=> b!1249078 (= e!708874 (and e!708873 mapRes!48997))))

(declare-fun condMapEmpty!48997 () Bool)

(declare-fun mapDefault!48997 () ValueCell!14982)

(assert (=> b!1249078 (= condMapEmpty!48997 (= (arr!38901 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14982)) mapDefault!48997)))))

(declare-fun b!1249079 () Bool)

(assert (=> b!1249079 (= e!708873 tp_is_empty!31491)))

(declare-fun b!1249080 () Bool)

(assert (=> b!1249080 (= e!708876 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47353)

(declare-fun zeroValue!871 () V!47353)

(declare-datatypes ((tuple2!20362 0))(
  ( (tuple2!20363 (_1!10192 (_ BitVec 64)) (_2!10192 V!47353)) )
))
(declare-datatypes ((List!27610 0))(
  ( (Nil!27607) (Cons!27606 (h!28815 tuple2!20362) (t!41081 List!27610)) )
))
(declare-datatypes ((ListLongMap!18235 0))(
  ( (ListLongMap!18236 (toList!9133 List!27610)) )
))
(declare-fun lt!563595 () ListLongMap!18235)

(declare-fun getCurrentListMapNoExtraKeys!5540 (array!80666 array!80668 (_ BitVec 32) (_ BitVec 32) V!47353 V!47353 (_ BitVec 32) Int) ListLongMap!18235)

(assert (=> b!1249080 (= lt!563595 (getCurrentListMapNoExtraKeys!5540 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563596 () ListLongMap!18235)

(declare-fun minValueBefore!43 () V!47353)

(assert (=> b!1249080 (= lt!563596 (getCurrentListMapNoExtraKeys!5540 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48997 () Bool)

(declare-fun tp!93256 () Bool)

(assert (=> mapNonEmpty!48997 (= mapRes!48997 (and tp!93256 e!708877))))

(declare-fun mapValue!48997 () ValueCell!14982)

(declare-fun mapKey!48997 () (_ BitVec 32))

(declare-fun mapRest!48997 () (Array (_ BitVec 32) ValueCell!14982))

(assert (=> mapNonEmpty!48997 (= (arr!38901 _values!914) (store mapRest!48997 mapKey!48997 mapValue!48997))))

(assert (= (and start!104784 res!833257) b!1249076))

(assert (= (and b!1249076 res!833259) b!1249074))

(assert (= (and b!1249074 res!833258) b!1249075))

(assert (= (and b!1249075 res!833256) b!1249080))

(assert (= (and b!1249078 condMapEmpty!48997) mapIsEmpty!48997))

(assert (= (and b!1249078 (not condMapEmpty!48997)) mapNonEmpty!48997))

(get-info :version)

(assert (= (and mapNonEmpty!48997 ((_ is ValueCellFull!14982) mapValue!48997)) b!1249077))

(assert (= (and b!1249078 ((_ is ValueCellFull!14982) mapDefault!48997)) b!1249079))

(assert (= start!104784 b!1249078))

(declare-fun m!1150071 () Bool)

(assert (=> start!104784 m!1150071))

(declare-fun m!1150073 () Bool)

(assert (=> start!104784 m!1150073))

(declare-fun m!1150075 () Bool)

(assert (=> start!104784 m!1150075))

(declare-fun m!1150077 () Bool)

(assert (=> b!1249074 m!1150077))

(declare-fun m!1150079 () Bool)

(assert (=> b!1249075 m!1150079))

(declare-fun m!1150081 () Bool)

(assert (=> b!1249080 m!1150081))

(declare-fun m!1150083 () Bool)

(assert (=> b!1249080 m!1150083))

(declare-fun m!1150085 () Bool)

(assert (=> mapNonEmpty!48997 m!1150085))

(check-sat b_and!44357 (not b!1249080) (not b!1249074) tp_is_empty!31491 (not b!1249075) (not start!104784) (not mapNonEmpty!48997) (not b_next!26589))
(check-sat b_and!44357 (not b_next!26589))
