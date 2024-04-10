; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104706 () Bool)

(assert start!104706)

(declare-fun b_free!26523 () Bool)

(declare-fun b_next!26523 () Bool)

(assert (=> start!104706 (= b_free!26523 (not b_next!26523))))

(declare-fun tp!93055 () Bool)

(declare-fun b_and!44287 () Bool)

(assert (=> start!104706 (= tp!93055 b_and!44287)))

(declare-fun b!1248308 () Bool)

(declare-fun res!832833 () Bool)

(declare-fun e!708331 () Bool)

(assert (=> b!1248308 (=> (not res!832833) (not e!708331))))

(declare-datatypes ((array!80542 0))(
  ( (array!80543 (arr!38839 (Array (_ BitVec 32) (_ BitVec 64))) (size!39375 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80542)

(declare-datatypes ((List!27569 0))(
  ( (Nil!27566) (Cons!27565 (h!28774 (_ BitVec 64)) (t!41038 List!27569)) )
))
(declare-fun arrayNoDuplicates!0 (array!80542 (_ BitVec 32) List!27569) Bool)

(assert (=> b!1248308 (= res!832833 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27566))))

(declare-fun b!1248309 () Bool)

(declare-fun res!832836 () Bool)

(assert (=> b!1248309 (=> (not res!832836) (not e!708331))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47265 0))(
  ( (V!47266 (val!15775 Int)) )
))
(declare-datatypes ((ValueCell!14949 0))(
  ( (ValueCellFull!14949 (v!18471 V!47265)) (EmptyCell!14949) )
))
(declare-datatypes ((array!80544 0))(
  ( (array!80545 (arr!38840 (Array (_ BitVec 32) ValueCell!14949)) (size!39376 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80544)

(assert (=> b!1248309 (= res!832836 (and (= (size!39376 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39375 _keys!1118) (size!39376 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48895 () Bool)

(declare-fun mapRes!48895 () Bool)

(assert (=> mapIsEmpty!48895 mapRes!48895))

(declare-fun b!1248311 () Bool)

(declare-fun res!832835 () Bool)

(assert (=> b!1248311 (=> (not res!832835) (not e!708331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80542 (_ BitVec 32)) Bool)

(assert (=> b!1248311 (= res!832835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248312 () Bool)

(declare-fun e!708333 () Bool)

(declare-fun tp_is_empty!31425 () Bool)

(assert (=> b!1248312 (= e!708333 tp_is_empty!31425)))

(declare-fun mapNonEmpty!48895 () Bool)

(declare-fun tp!93056 () Bool)

(declare-fun e!708334 () Bool)

(assert (=> mapNonEmpty!48895 (= mapRes!48895 (and tp!93056 e!708334))))

(declare-fun mapKey!48895 () (_ BitVec 32))

(declare-fun mapRest!48895 () (Array (_ BitVec 32) ValueCell!14949))

(declare-fun mapValue!48895 () ValueCell!14949)

(assert (=> mapNonEmpty!48895 (= (arr!38840 _values!914) (store mapRest!48895 mapKey!48895 mapValue!48895))))

(declare-fun b!1248310 () Bool)

(declare-fun e!708332 () Bool)

(assert (=> b!1248310 (= e!708332 (and e!708333 mapRes!48895))))

(declare-fun condMapEmpty!48895 () Bool)

(declare-fun mapDefault!48895 () ValueCell!14949)

(assert (=> b!1248310 (= condMapEmpty!48895 (= (arr!38840 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14949)) mapDefault!48895)))))

(declare-fun res!832834 () Bool)

(assert (=> start!104706 (=> (not res!832834) (not e!708331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104706 (= res!832834 (validMask!0 mask!1466))))

(assert (=> start!104706 e!708331))

(assert (=> start!104706 true))

(assert (=> start!104706 tp!93055))

(assert (=> start!104706 tp_is_empty!31425))

(declare-fun array_inv!29645 (array!80542) Bool)

(assert (=> start!104706 (array_inv!29645 _keys!1118)))

(declare-fun array_inv!29646 (array!80544) Bool)

(assert (=> start!104706 (and (array_inv!29646 _values!914) e!708332)))

(declare-fun b!1248313 () Bool)

(assert (=> b!1248313 (= e!708331 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20322 0))(
  ( (tuple2!20323 (_1!10172 (_ BitVec 64)) (_2!10172 V!47265)) )
))
(declare-datatypes ((List!27570 0))(
  ( (Nil!27567) (Cons!27566 (h!28775 tuple2!20322) (t!41039 List!27570)) )
))
(declare-datatypes ((ListLongMap!18195 0))(
  ( (ListLongMap!18196 (toList!9113 List!27570)) )
))
(declare-fun lt!563389 () ListLongMap!18195)

(declare-fun zeroValue!871 () V!47265)

(declare-fun minValueBefore!43 () V!47265)

(declare-fun getCurrentListMapNoExtraKeys!5520 (array!80542 array!80544 (_ BitVec 32) (_ BitVec 32) V!47265 V!47265 (_ BitVec 32) Int) ListLongMap!18195)

(assert (=> b!1248313 (= lt!563389 (getCurrentListMapNoExtraKeys!5520 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248314 () Bool)

(assert (=> b!1248314 (= e!708334 tp_is_empty!31425)))

(assert (= (and start!104706 res!832834) b!1248309))

(assert (= (and b!1248309 res!832836) b!1248311))

(assert (= (and b!1248311 res!832835) b!1248308))

(assert (= (and b!1248308 res!832833) b!1248313))

(assert (= (and b!1248310 condMapEmpty!48895) mapIsEmpty!48895))

(assert (= (and b!1248310 (not condMapEmpty!48895)) mapNonEmpty!48895))

(get-info :version)

(assert (= (and mapNonEmpty!48895 ((_ is ValueCellFull!14949) mapValue!48895)) b!1248314))

(assert (= (and b!1248310 ((_ is ValueCellFull!14949) mapDefault!48895)) b!1248312))

(assert (= start!104706 b!1248310))

(declare-fun m!1149515 () Bool)

(assert (=> b!1248313 m!1149515))

(declare-fun m!1149517 () Bool)

(assert (=> mapNonEmpty!48895 m!1149517))

(declare-fun m!1149519 () Bool)

(assert (=> start!104706 m!1149519))

(declare-fun m!1149521 () Bool)

(assert (=> start!104706 m!1149521))

(declare-fun m!1149523 () Bool)

(assert (=> start!104706 m!1149523))

(declare-fun m!1149525 () Bool)

(assert (=> b!1248308 m!1149525))

(declare-fun m!1149527 () Bool)

(assert (=> b!1248311 m!1149527))

(check-sat (not b!1248313) (not start!104706) (not b!1248308) tp_is_empty!31425 (not mapNonEmpty!48895) (not b_next!26523) (not b!1248311) b_and!44287)
(check-sat b_and!44287 (not b_next!26523))
