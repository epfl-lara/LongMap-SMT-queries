; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104700 () Bool)

(assert start!104700)

(declare-fun b_free!26517 () Bool)

(declare-fun b_next!26517 () Bool)

(assert (=> start!104700 (= b_free!26517 (not b_next!26517))))

(declare-fun tp!93037 () Bool)

(declare-fun b_and!44281 () Bool)

(assert (=> start!104700 (= tp!93037 b_and!44281)))

(declare-fun b!1248245 () Bool)

(declare-fun e!708287 () Bool)

(declare-fun tp_is_empty!31419 () Bool)

(assert (=> b!1248245 (= e!708287 tp_is_empty!31419)))

(declare-fun b!1248246 () Bool)

(declare-fun res!832797 () Bool)

(declare-fun e!708285 () Bool)

(assert (=> b!1248246 (=> (not res!832797) (not e!708285))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80530 0))(
  ( (array!80531 (arr!38833 (Array (_ BitVec 32) (_ BitVec 64))) (size!39369 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80530)

(declare-datatypes ((V!47257 0))(
  ( (V!47258 (val!15772 Int)) )
))
(declare-datatypes ((ValueCell!14946 0))(
  ( (ValueCellFull!14946 (v!18468 V!47257)) (EmptyCell!14946) )
))
(declare-datatypes ((array!80532 0))(
  ( (array!80533 (arr!38834 (Array (_ BitVec 32) ValueCell!14946)) (size!39370 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80532)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1248246 (= res!832797 (and (= (size!39370 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39369 _keys!1118) (size!39370 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832800 () Bool)

(assert (=> start!104700 (=> (not res!832800) (not e!708285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104700 (= res!832800 (validMask!0 mask!1466))))

(assert (=> start!104700 e!708285))

(assert (=> start!104700 true))

(assert (=> start!104700 tp!93037))

(assert (=> start!104700 tp_is_empty!31419))

(declare-fun array_inv!29641 (array!80530) Bool)

(assert (=> start!104700 (array_inv!29641 _keys!1118)))

(declare-fun e!708289 () Bool)

(declare-fun array_inv!29642 (array!80532) Bool)

(assert (=> start!104700 (and (array_inv!29642 _values!914) e!708289)))

(declare-fun b!1248247 () Bool)

(declare-fun res!832799 () Bool)

(assert (=> b!1248247 (=> (not res!832799) (not e!708285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80530 (_ BitVec 32)) Bool)

(assert (=> b!1248247 (= res!832799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248248 () Bool)

(declare-fun res!832798 () Bool)

(assert (=> b!1248248 (=> (not res!832798) (not e!708285))))

(declare-datatypes ((List!27564 0))(
  ( (Nil!27561) (Cons!27560 (h!28769 (_ BitVec 64)) (t!41033 List!27564)) )
))
(declare-fun arrayNoDuplicates!0 (array!80530 (_ BitVec 32) List!27564) Bool)

(assert (=> b!1248248 (= res!832798 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27561))))

(declare-fun b!1248249 () Bool)

(assert (=> b!1248249 (= e!708285 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47257)

(declare-fun minValueBefore!43 () V!47257)

(declare-datatypes ((tuple2!20316 0))(
  ( (tuple2!20317 (_1!10169 (_ BitVec 64)) (_2!10169 V!47257)) )
))
(declare-datatypes ((List!27565 0))(
  ( (Nil!27562) (Cons!27561 (h!28770 tuple2!20316) (t!41034 List!27565)) )
))
(declare-datatypes ((ListLongMap!18189 0))(
  ( (ListLongMap!18190 (toList!9110 List!27565)) )
))
(declare-fun lt!563380 () ListLongMap!18189)

(declare-fun getCurrentListMapNoExtraKeys!5517 (array!80530 array!80532 (_ BitVec 32) (_ BitVec 32) V!47257 V!47257 (_ BitVec 32) Int) ListLongMap!18189)

(assert (=> b!1248249 (= lt!563380 (getCurrentListMapNoExtraKeys!5517 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48886 () Bool)

(declare-fun mapRes!48886 () Bool)

(assert (=> mapIsEmpty!48886 mapRes!48886))

(declare-fun b!1248250 () Bool)

(assert (=> b!1248250 (= e!708289 (and e!708287 mapRes!48886))))

(declare-fun condMapEmpty!48886 () Bool)

(declare-fun mapDefault!48886 () ValueCell!14946)

(assert (=> b!1248250 (= condMapEmpty!48886 (= (arr!38834 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14946)) mapDefault!48886)))))

(declare-fun mapNonEmpty!48886 () Bool)

(declare-fun tp!93038 () Bool)

(declare-fun e!708288 () Bool)

(assert (=> mapNonEmpty!48886 (= mapRes!48886 (and tp!93038 e!708288))))

(declare-fun mapRest!48886 () (Array (_ BitVec 32) ValueCell!14946))

(declare-fun mapValue!48886 () ValueCell!14946)

(declare-fun mapKey!48886 () (_ BitVec 32))

(assert (=> mapNonEmpty!48886 (= (arr!38834 _values!914) (store mapRest!48886 mapKey!48886 mapValue!48886))))

(declare-fun b!1248251 () Bool)

(assert (=> b!1248251 (= e!708288 tp_is_empty!31419)))

(assert (= (and start!104700 res!832800) b!1248246))

(assert (= (and b!1248246 res!832797) b!1248247))

(assert (= (and b!1248247 res!832799) b!1248248))

(assert (= (and b!1248248 res!832798) b!1248249))

(assert (= (and b!1248250 condMapEmpty!48886) mapIsEmpty!48886))

(assert (= (and b!1248250 (not condMapEmpty!48886)) mapNonEmpty!48886))

(get-info :version)

(assert (= (and mapNonEmpty!48886 ((_ is ValueCellFull!14946) mapValue!48886)) b!1248251))

(assert (= (and b!1248250 ((_ is ValueCellFull!14946) mapDefault!48886)) b!1248245))

(assert (= start!104700 b!1248250))

(declare-fun m!1149473 () Bool)

(assert (=> mapNonEmpty!48886 m!1149473))

(declare-fun m!1149475 () Bool)

(assert (=> start!104700 m!1149475))

(declare-fun m!1149477 () Bool)

(assert (=> start!104700 m!1149477))

(declare-fun m!1149479 () Bool)

(assert (=> start!104700 m!1149479))

(declare-fun m!1149481 () Bool)

(assert (=> b!1248248 m!1149481))

(declare-fun m!1149483 () Bool)

(assert (=> b!1248247 m!1149483))

(declare-fun m!1149485 () Bool)

(assert (=> b!1248249 m!1149485))

(check-sat (not b_next!26517) tp_is_empty!31419 (not b!1248249) (not b!1248248) (not start!104700) (not b!1248247) (not mapNonEmpty!48886) b_and!44281)
(check-sat b_and!44281 (not b_next!26517))
