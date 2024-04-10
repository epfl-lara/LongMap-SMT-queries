; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104682 () Bool)

(assert start!104682)

(declare-fun b_free!26499 () Bool)

(declare-fun b_next!26499 () Bool)

(assert (=> start!104682 (= b_free!26499 (not b_next!26499))))

(declare-fun tp!92983 () Bool)

(declare-fun b_and!44263 () Bool)

(assert (=> start!104682 (= tp!92983 b_and!44263)))

(declare-fun res!832690 () Bool)

(declare-fun e!708152 () Bool)

(assert (=> start!104682 (=> (not res!832690) (not e!708152))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104682 (= res!832690 (validMask!0 mask!1466))))

(assert (=> start!104682 e!708152))

(assert (=> start!104682 true))

(assert (=> start!104682 tp!92983))

(declare-fun tp_is_empty!31401 () Bool)

(assert (=> start!104682 tp_is_empty!31401))

(declare-datatypes ((array!80494 0))(
  ( (array!80495 (arr!38815 (Array (_ BitVec 32) (_ BitVec 64))) (size!39351 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80494)

(declare-fun array_inv!29631 (array!80494) Bool)

(assert (=> start!104682 (array_inv!29631 _keys!1118)))

(declare-datatypes ((V!47233 0))(
  ( (V!47234 (val!15763 Int)) )
))
(declare-datatypes ((ValueCell!14937 0))(
  ( (ValueCellFull!14937 (v!18459 V!47233)) (EmptyCell!14937) )
))
(declare-datatypes ((array!80496 0))(
  ( (array!80497 (arr!38816 (Array (_ BitVec 32) ValueCell!14937)) (size!39352 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80496)

(declare-fun e!708150 () Bool)

(declare-fun array_inv!29632 (array!80496) Bool)

(assert (=> start!104682 (and (array_inv!29632 _values!914) e!708150)))

(declare-fun b!1248056 () Bool)

(declare-fun e!708151 () Bool)

(assert (=> b!1248056 (= e!708151 tp_is_empty!31401)))

(declare-fun b!1248057 () Bool)

(declare-fun res!832691 () Bool)

(assert (=> b!1248057 (=> (not res!832691) (not e!708152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80494 (_ BitVec 32)) Bool)

(assert (=> b!1248057 (= res!832691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48859 () Bool)

(declare-fun mapRes!48859 () Bool)

(declare-fun tp!92984 () Bool)

(assert (=> mapNonEmpty!48859 (= mapRes!48859 (and tp!92984 e!708151))))

(declare-fun mapValue!48859 () ValueCell!14937)

(declare-fun mapKey!48859 () (_ BitVec 32))

(declare-fun mapRest!48859 () (Array (_ BitVec 32) ValueCell!14937))

(assert (=> mapNonEmpty!48859 (= (arr!38816 _values!914) (store mapRest!48859 mapKey!48859 mapValue!48859))))

(declare-fun b!1248058 () Bool)

(declare-fun res!832689 () Bool)

(assert (=> b!1248058 (=> (not res!832689) (not e!708152))))

(declare-datatypes ((List!27551 0))(
  ( (Nil!27548) (Cons!27547 (h!28756 (_ BitVec 64)) (t!41020 List!27551)) )
))
(declare-fun arrayNoDuplicates!0 (array!80494 (_ BitVec 32) List!27551) Bool)

(assert (=> b!1248058 (= res!832689 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27548))))

(declare-fun b!1248059 () Bool)

(declare-fun e!708154 () Bool)

(assert (=> b!1248059 (= e!708150 (and e!708154 mapRes!48859))))

(declare-fun condMapEmpty!48859 () Bool)

(declare-fun mapDefault!48859 () ValueCell!14937)

(assert (=> b!1248059 (= condMapEmpty!48859 (= (arr!38816 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14937)) mapDefault!48859)))))

(declare-fun b!1248060 () Bool)

(assert (=> b!1248060 (= e!708154 tp_is_empty!31401)))

(declare-fun b!1248061 () Bool)

(assert (=> b!1248061 (= e!708152 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20304 0))(
  ( (tuple2!20305 (_1!10163 (_ BitVec 64)) (_2!10163 V!47233)) )
))
(declare-datatypes ((List!27552 0))(
  ( (Nil!27549) (Cons!27548 (h!28757 tuple2!20304) (t!41021 List!27552)) )
))
(declare-datatypes ((ListLongMap!18177 0))(
  ( (ListLongMap!18178 (toList!9104 List!27552)) )
))
(declare-fun lt!563353 () ListLongMap!18177)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47233)

(declare-fun minValueBefore!43 () V!47233)

(declare-fun getCurrentListMapNoExtraKeys!5511 (array!80494 array!80496 (_ BitVec 32) (_ BitVec 32) V!47233 V!47233 (_ BitVec 32) Int) ListLongMap!18177)

(assert (=> b!1248061 (= lt!563353 (getCurrentListMapNoExtraKeys!5511 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48859 () Bool)

(assert (=> mapIsEmpty!48859 mapRes!48859))

(declare-fun b!1248062 () Bool)

(declare-fun res!832692 () Bool)

(assert (=> b!1248062 (=> (not res!832692) (not e!708152))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248062 (= res!832692 (and (= (size!39352 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39351 _keys!1118) (size!39352 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104682 res!832690) b!1248062))

(assert (= (and b!1248062 res!832692) b!1248057))

(assert (= (and b!1248057 res!832691) b!1248058))

(assert (= (and b!1248058 res!832689) b!1248061))

(assert (= (and b!1248059 condMapEmpty!48859) mapIsEmpty!48859))

(assert (= (and b!1248059 (not condMapEmpty!48859)) mapNonEmpty!48859))

(get-info :version)

(assert (= (and mapNonEmpty!48859 ((_ is ValueCellFull!14937) mapValue!48859)) b!1248056))

(assert (= (and b!1248059 ((_ is ValueCellFull!14937) mapDefault!48859)) b!1248060))

(assert (= start!104682 b!1248059))

(declare-fun m!1149347 () Bool)

(assert (=> b!1248061 m!1149347))

(declare-fun m!1149349 () Bool)

(assert (=> start!104682 m!1149349))

(declare-fun m!1149351 () Bool)

(assert (=> start!104682 m!1149351))

(declare-fun m!1149353 () Bool)

(assert (=> start!104682 m!1149353))

(declare-fun m!1149355 () Bool)

(assert (=> mapNonEmpty!48859 m!1149355))

(declare-fun m!1149357 () Bool)

(assert (=> b!1248058 m!1149357))

(declare-fun m!1149359 () Bool)

(assert (=> b!1248057 m!1149359))

(check-sat (not mapNonEmpty!48859) (not b_next!26499) (not b!1248057) b_and!44263 (not b!1248058) (not b!1248061) tp_is_empty!31401 (not start!104682))
(check-sat b_and!44263 (not b_next!26499))
