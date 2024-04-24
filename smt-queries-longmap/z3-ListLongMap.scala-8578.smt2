; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104910 () Bool)

(assert start!104910)

(declare-fun b_free!26503 () Bool)

(declare-fun b_next!26503 () Bool)

(assert (=> start!104910 (= b_free!26503 (not b_next!26503))))

(declare-fun tp!92996 () Bool)

(declare-fun b_and!44269 () Bool)

(assert (=> start!104910 (= tp!92996 b_and!44269)))

(declare-fun res!833234 () Bool)

(declare-fun e!709027 () Bool)

(assert (=> start!104910 (=> (not res!833234) (not e!709027))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104910 (= res!833234 (validMask!0 mask!1466))))

(assert (=> start!104910 e!709027))

(assert (=> start!104910 true))

(assert (=> start!104910 tp!92996))

(declare-fun tp_is_empty!31405 () Bool)

(assert (=> start!104910 tp_is_empty!31405))

(declare-datatypes ((array!80535 0))(
  ( (array!80536 (arr!38831 (Array (_ BitVec 32) (_ BitVec 64))) (size!39368 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80535)

(declare-fun array_inv!29743 (array!80535) Bool)

(assert (=> start!104910 (array_inv!29743 _keys!1118)))

(declare-datatypes ((V!47239 0))(
  ( (V!47240 (val!15765 Int)) )
))
(declare-datatypes ((ValueCell!14939 0))(
  ( (ValueCellFull!14939 (v!18457 V!47239)) (EmptyCell!14939) )
))
(declare-datatypes ((array!80537 0))(
  ( (array!80538 (arr!38832 (Array (_ BitVec 32) ValueCell!14939)) (size!39369 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80537)

(declare-fun e!709028 () Bool)

(declare-fun array_inv!29744 (array!80537) Bool)

(assert (=> start!104910 (and (array_inv!29744 _values!914) e!709028)))

(declare-fun b!1249403 () Bool)

(declare-fun e!709029 () Bool)

(assert (=> b!1249403 (= e!709029 tp_is_empty!31405)))

(declare-fun b!1249404 () Bool)

(declare-fun e!709031 () Bool)

(declare-fun mapRes!48865 () Bool)

(assert (=> b!1249404 (= e!709028 (and e!709031 mapRes!48865))))

(declare-fun condMapEmpty!48865 () Bool)

(declare-fun mapDefault!48865 () ValueCell!14939)

(assert (=> b!1249404 (= condMapEmpty!48865 (= (arr!38832 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14939)) mapDefault!48865)))))

(declare-fun b!1249405 () Bool)

(assert (=> b!1249405 (= e!709031 tp_is_empty!31405)))

(declare-fun mapNonEmpty!48865 () Bool)

(declare-fun tp!92995 () Bool)

(assert (=> mapNonEmpty!48865 (= mapRes!48865 (and tp!92995 e!709029))))

(declare-fun mapRest!48865 () (Array (_ BitVec 32) ValueCell!14939))

(declare-fun mapValue!48865 () ValueCell!14939)

(declare-fun mapKey!48865 () (_ BitVec 32))

(assert (=> mapNonEmpty!48865 (= (arr!38832 _values!914) (store mapRest!48865 mapKey!48865 mapValue!48865))))

(declare-fun b!1249406 () Bool)

(declare-fun res!833233 () Bool)

(assert (=> b!1249406 (=> (not res!833233) (not e!709027))))

(declare-datatypes ((List!27578 0))(
  ( (Nil!27575) (Cons!27574 (h!28792 (_ BitVec 64)) (t!41039 List!27578)) )
))
(declare-fun arrayNoDuplicates!0 (array!80535 (_ BitVec 32) List!27578) Bool)

(assert (=> b!1249406 (= res!833233 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27575))))

(declare-fun b!1249407 () Bool)

(declare-fun res!833236 () Bool)

(assert (=> b!1249407 (=> (not res!833236) (not e!709027))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249407 (= res!833236 (and (= (size!39369 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39368 _keys!1118) (size!39369 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48865 () Bool)

(assert (=> mapIsEmpty!48865 mapRes!48865))

(declare-fun b!1249408 () Bool)

(assert (=> b!1249408 (= e!709027 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20322 0))(
  ( (tuple2!20323 (_1!10172 (_ BitVec 64)) (_2!10172 V!47239)) )
))
(declare-datatypes ((List!27579 0))(
  ( (Nil!27576) (Cons!27575 (h!28793 tuple2!20322) (t!41040 List!27579)) )
))
(declare-datatypes ((ListLongMap!18203 0))(
  ( (ListLongMap!18204 (toList!9117 List!27579)) )
))
(declare-fun lt!563843 () ListLongMap!18203)

(declare-fun zeroValue!871 () V!47239)

(declare-fun minValueBefore!43 () V!47239)

(declare-fun getCurrentListMapNoExtraKeys!5552 (array!80535 array!80537 (_ BitVec 32) (_ BitVec 32) V!47239 V!47239 (_ BitVec 32) Int) ListLongMap!18203)

(assert (=> b!1249408 (= lt!563843 (getCurrentListMapNoExtraKeys!5552 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249409 () Bool)

(declare-fun res!833235 () Bool)

(assert (=> b!1249409 (=> (not res!833235) (not e!709027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80535 (_ BitVec 32)) Bool)

(assert (=> b!1249409 (= res!833235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104910 res!833234) b!1249407))

(assert (= (and b!1249407 res!833236) b!1249409))

(assert (= (and b!1249409 res!833235) b!1249406))

(assert (= (and b!1249406 res!833233) b!1249408))

(assert (= (and b!1249404 condMapEmpty!48865) mapIsEmpty!48865))

(assert (= (and b!1249404 (not condMapEmpty!48865)) mapNonEmpty!48865))

(get-info :version)

(assert (= (and mapNonEmpty!48865 ((_ is ValueCellFull!14939) mapValue!48865)) b!1249403))

(assert (= (and b!1249404 ((_ is ValueCellFull!14939) mapDefault!48865)) b!1249405))

(assert (= start!104910 b!1249404))

(declare-fun m!1150987 () Bool)

(assert (=> start!104910 m!1150987))

(declare-fun m!1150989 () Bool)

(assert (=> start!104910 m!1150989))

(declare-fun m!1150991 () Bool)

(assert (=> start!104910 m!1150991))

(declare-fun m!1150993 () Bool)

(assert (=> b!1249406 m!1150993))

(declare-fun m!1150995 () Bool)

(assert (=> b!1249409 m!1150995))

(declare-fun m!1150997 () Bool)

(assert (=> b!1249408 m!1150997))

(declare-fun m!1150999 () Bool)

(assert (=> mapNonEmpty!48865 m!1150999))

(check-sat (not b!1249406) (not b!1249408) (not b_next!26503) tp_is_empty!31405 (not start!104910) (not b!1249409) (not mapNonEmpty!48865) b_and!44269)
(check-sat b_and!44269 (not b_next!26503))
