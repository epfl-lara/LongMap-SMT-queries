; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104736 () Bool)

(assert start!104736)

(declare-fun b_free!26545 () Bool)

(declare-fun b_next!26545 () Bool)

(assert (=> start!104736 (= b_free!26545 (not b_next!26545))))

(declare-fun tp!93125 () Bool)

(declare-fun b_and!44295 () Bool)

(assert (=> start!104736 (= tp!93125 b_and!44295)))

(declare-fun b!1248530 () Bool)

(declare-fun e!708502 () Bool)

(declare-fun e!708499 () Bool)

(declare-fun mapRes!48931 () Bool)

(assert (=> b!1248530 (= e!708502 (and e!708499 mapRes!48931))))

(declare-fun condMapEmpty!48931 () Bool)

(declare-datatypes ((V!47295 0))(
  ( (V!47296 (val!15786 Int)) )
))
(declare-datatypes ((ValueCell!14960 0))(
  ( (ValueCellFull!14960 (v!18481 V!47295)) (EmptyCell!14960) )
))
(declare-datatypes ((array!80497 0))(
  ( (array!80498 (arr!38816 (Array (_ BitVec 32) ValueCell!14960)) (size!39354 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80497)

(declare-fun mapDefault!48931 () ValueCell!14960)

(assert (=> b!1248530 (= condMapEmpty!48931 (= (arr!38816 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14960)) mapDefault!48931)))))

(declare-fun b!1248531 () Bool)

(declare-fun res!832955 () Bool)

(declare-fun e!708498 () Bool)

(assert (=> b!1248531 (=> (not res!832955) (not e!708498))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80499 0))(
  ( (array!80500 (arr!38817 (Array (_ BitVec 32) (_ BitVec 64))) (size!39355 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80499)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1248531 (= res!832955 (and (= (size!39354 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39355 _keys!1118) (size!39354 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248532 () Bool)

(declare-fun e!708501 () Bool)

(declare-fun tp_is_empty!31447 () Bool)

(assert (=> b!1248532 (= e!708501 tp_is_empty!31447)))

(declare-fun mapNonEmpty!48931 () Bool)

(declare-fun tp!93124 () Bool)

(assert (=> mapNonEmpty!48931 (= mapRes!48931 (and tp!93124 e!708501))))

(declare-fun mapKey!48931 () (_ BitVec 32))

(declare-fun mapRest!48931 () (Array (_ BitVec 32) ValueCell!14960))

(declare-fun mapValue!48931 () ValueCell!14960)

(assert (=> mapNonEmpty!48931 (= (arr!38816 _values!914) (store mapRest!48931 mapKey!48931 mapValue!48931))))

(declare-fun b!1248533 () Bool)

(assert (=> b!1248533 (= e!708498 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47295)

(declare-fun zeroValue!871 () V!47295)

(declare-datatypes ((tuple2!20412 0))(
  ( (tuple2!20413 (_1!10217 (_ BitVec 64)) (_2!10217 V!47295)) )
))
(declare-datatypes ((List!27642 0))(
  ( (Nil!27639) (Cons!27638 (h!28847 tuple2!20412) (t!41104 List!27642)) )
))
(declare-datatypes ((ListLongMap!18285 0))(
  ( (ListLongMap!18286 (toList!9158 List!27642)) )
))
(declare-fun lt!563285 () ListLongMap!18285)

(declare-fun getCurrentListMapNoExtraKeys!5575 (array!80499 array!80497 (_ BitVec 32) (_ BitVec 32) V!47295 V!47295 (_ BitVec 32) Int) ListLongMap!18285)

(assert (=> b!1248533 (= lt!563285 (getCurrentListMapNoExtraKeys!5575 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563284 () ListLongMap!18285)

(declare-fun minValueBefore!43 () V!47295)

(assert (=> b!1248533 (= lt!563284 (getCurrentListMapNoExtraKeys!5575 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!832954 () Bool)

(assert (=> start!104736 (=> (not res!832954) (not e!708498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104736 (= res!832954 (validMask!0 mask!1466))))

(assert (=> start!104736 e!708498))

(assert (=> start!104736 true))

(assert (=> start!104736 tp!93125))

(assert (=> start!104736 tp_is_empty!31447))

(declare-fun array_inv!29759 (array!80499) Bool)

(assert (=> start!104736 (array_inv!29759 _keys!1118)))

(declare-fun array_inv!29760 (array!80497) Bool)

(assert (=> start!104736 (and (array_inv!29760 _values!914) e!708502)))

(declare-fun b!1248534 () Bool)

(assert (=> b!1248534 (= e!708499 tp_is_empty!31447)))

(declare-fun b!1248535 () Bool)

(declare-fun res!832952 () Bool)

(assert (=> b!1248535 (=> (not res!832952) (not e!708498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80499 (_ BitVec 32)) Bool)

(assert (=> b!1248535 (= res!832952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248536 () Bool)

(declare-fun res!832953 () Bool)

(assert (=> b!1248536 (=> (not res!832953) (not e!708498))))

(declare-datatypes ((List!27643 0))(
  ( (Nil!27640) (Cons!27639 (h!28848 (_ BitVec 64)) (t!41105 List!27643)) )
))
(declare-fun arrayNoDuplicates!0 (array!80499 (_ BitVec 32) List!27643) Bool)

(assert (=> b!1248536 (= res!832953 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27640))))

(declare-fun mapIsEmpty!48931 () Bool)

(assert (=> mapIsEmpty!48931 mapRes!48931))

(assert (= (and start!104736 res!832954) b!1248531))

(assert (= (and b!1248531 res!832955) b!1248535))

(assert (= (and b!1248535 res!832952) b!1248536))

(assert (= (and b!1248536 res!832953) b!1248533))

(assert (= (and b!1248530 condMapEmpty!48931) mapIsEmpty!48931))

(assert (= (and b!1248530 (not condMapEmpty!48931)) mapNonEmpty!48931))

(get-info :version)

(assert (= (and mapNonEmpty!48931 ((_ is ValueCellFull!14960) mapValue!48931)) b!1248532))

(assert (= (and b!1248530 ((_ is ValueCellFull!14960) mapDefault!48931)) b!1248534))

(assert (= start!104736 b!1248530))

(declare-fun m!1149199 () Bool)

(assert (=> mapNonEmpty!48931 m!1149199))

(declare-fun m!1149201 () Bool)

(assert (=> b!1248533 m!1149201))

(declare-fun m!1149203 () Bool)

(assert (=> b!1248533 m!1149203))

(declare-fun m!1149205 () Bool)

(assert (=> b!1248535 m!1149205))

(declare-fun m!1149207 () Bool)

(assert (=> start!104736 m!1149207))

(declare-fun m!1149209 () Bool)

(assert (=> start!104736 m!1149209))

(declare-fun m!1149211 () Bool)

(assert (=> start!104736 m!1149211))

(declare-fun m!1149213 () Bool)

(assert (=> b!1248536 m!1149213))

(check-sat (not b!1248535) (not b!1248533) (not b_next!26545) (not mapNonEmpty!48931) (not start!104736) (not b!1248536) tp_is_empty!31447 b_and!44295)
(check-sat b_and!44295 (not b_next!26545))
