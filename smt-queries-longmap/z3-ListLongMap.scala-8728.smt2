; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106086 () Bool)

(assert start!106086)

(declare-fun b_free!27403 () Bool)

(declare-fun b_next!27403 () Bool)

(assert (=> start!106086 (= b_free!27403 (not b_next!27403))))

(declare-fun tp!95741 () Bool)

(declare-fun b_and!45313 () Bool)

(assert (=> start!106086 (= tp!95741 b_and!45313)))

(declare-fun mapNonEmpty!50260 () Bool)

(declare-fun mapRes!50260 () Bool)

(declare-fun tp!95740 () Bool)

(declare-fun e!718464 () Bool)

(assert (=> mapNonEmpty!50260 (= mapRes!50260 (and tp!95740 e!718464))))

(declare-datatypes ((V!48439 0))(
  ( (V!48440 (val!16215 Int)) )
))
(declare-datatypes ((ValueCell!15389 0))(
  ( (ValueCellFull!15389 (v!18915 V!48439)) (EmptyCell!15389) )
))
(declare-fun mapValue!50260 () ValueCell!15389)

(declare-datatypes ((array!82275 0))(
  ( (array!82276 (arr!39686 (Array (_ BitVec 32) ValueCell!15389)) (size!40223 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82275)

(declare-fun mapRest!50260 () (Array (_ BitVec 32) ValueCell!15389))

(declare-fun mapKey!50260 () (_ BitVec 32))

(assert (=> mapNonEmpty!50260 (= (arr!39686 _values!914) (store mapRest!50260 mapKey!50260 mapValue!50260))))

(declare-fun b!1262284 () Bool)

(declare-fun res!840833 () Bool)

(declare-fun e!718467 () Bool)

(assert (=> b!1262284 (=> (not res!840833) (not e!718467))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82277 0))(
  ( (array!82278 (arr!39687 (Array (_ BitVec 32) (_ BitVec 64))) (size!40224 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82277)

(assert (=> b!1262284 (= res!840833 (and (= (size!40223 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40224 _keys!1118) (size!40223 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50260 () Bool)

(assert (=> mapIsEmpty!50260 mapRes!50260))

(declare-fun res!840831 () Bool)

(assert (=> start!106086 (=> (not res!840831) (not e!718467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106086 (= res!840831 (validMask!0 mask!1466))))

(assert (=> start!106086 e!718467))

(assert (=> start!106086 true))

(assert (=> start!106086 tp!95741))

(declare-fun tp_is_empty!32305 () Bool)

(assert (=> start!106086 tp_is_empty!32305))

(declare-fun array_inv!30361 (array!82277) Bool)

(assert (=> start!106086 (array_inv!30361 _keys!1118)))

(declare-fun e!718466 () Bool)

(declare-fun array_inv!30362 (array!82275) Bool)

(assert (=> start!106086 (and (array_inv!30362 _values!914) e!718466)))

(declare-fun b!1262285 () Bool)

(assert (=> b!1262285 (= e!718464 tp_is_empty!32305)))

(declare-fun b!1262286 () Bool)

(declare-fun res!840830 () Bool)

(assert (=> b!1262286 (=> (not res!840830) (not e!718467))))

(declare-datatypes ((List!28217 0))(
  ( (Nil!28214) (Cons!28213 (h!29431 (_ BitVec 64)) (t!41708 List!28217)) )
))
(declare-fun arrayNoDuplicates!0 (array!82277 (_ BitVec 32) List!28217) Bool)

(assert (=> b!1262286 (= res!840830 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28214))))

(declare-fun b!1262287 () Bool)

(assert (=> b!1262287 (= e!718467 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20994 0))(
  ( (tuple2!20995 (_1!10508 (_ BitVec 64)) (_2!10508 V!48439)) )
))
(declare-datatypes ((List!28218 0))(
  ( (Nil!28215) (Cons!28214 (h!29432 tuple2!20994) (t!41709 List!28218)) )
))
(declare-datatypes ((ListLongMap!18875 0))(
  ( (ListLongMap!18876 (toList!9453 List!28218)) )
))
(declare-fun lt!571980 () ListLongMap!18875)

(declare-fun zeroValue!871 () V!48439)

(declare-fun minValueAfter!43 () V!48439)

(declare-fun getCurrentListMapNoExtraKeys!5859 (array!82277 array!82275 (_ BitVec 32) (_ BitVec 32) V!48439 V!48439 (_ BitVec 32) Int) ListLongMap!18875)

(assert (=> b!1262287 (= lt!571980 (getCurrentListMapNoExtraKeys!5859 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571981 () ListLongMap!18875)

(declare-fun minValueBefore!43 () V!48439)

(assert (=> b!1262287 (= lt!571981 (getCurrentListMapNoExtraKeys!5859 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262288 () Bool)

(declare-fun res!840832 () Bool)

(assert (=> b!1262288 (=> (not res!840832) (not e!718467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82277 (_ BitVec 32)) Bool)

(assert (=> b!1262288 (= res!840832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262289 () Bool)

(declare-fun e!718463 () Bool)

(assert (=> b!1262289 (= e!718463 tp_is_empty!32305)))

(declare-fun b!1262290 () Bool)

(assert (=> b!1262290 (= e!718466 (and e!718463 mapRes!50260))))

(declare-fun condMapEmpty!50260 () Bool)

(declare-fun mapDefault!50260 () ValueCell!15389)

(assert (=> b!1262290 (= condMapEmpty!50260 (= (arr!39686 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15389)) mapDefault!50260)))))

(assert (= (and start!106086 res!840831) b!1262284))

(assert (= (and b!1262284 res!840833) b!1262288))

(assert (= (and b!1262288 res!840832) b!1262286))

(assert (= (and b!1262286 res!840830) b!1262287))

(assert (= (and b!1262290 condMapEmpty!50260) mapIsEmpty!50260))

(assert (= (and b!1262290 (not condMapEmpty!50260)) mapNonEmpty!50260))

(get-info :version)

(assert (= (and mapNonEmpty!50260 ((_ is ValueCellFull!15389) mapValue!50260)) b!1262285))

(assert (= (and b!1262290 ((_ is ValueCellFull!15389) mapDefault!50260)) b!1262289))

(assert (= start!106086 b!1262290))

(declare-fun m!1163325 () Bool)

(assert (=> b!1262286 m!1163325))

(declare-fun m!1163327 () Bool)

(assert (=> start!106086 m!1163327))

(declare-fun m!1163329 () Bool)

(assert (=> start!106086 m!1163329))

(declare-fun m!1163331 () Bool)

(assert (=> start!106086 m!1163331))

(declare-fun m!1163333 () Bool)

(assert (=> mapNonEmpty!50260 m!1163333))

(declare-fun m!1163335 () Bool)

(assert (=> b!1262287 m!1163335))

(declare-fun m!1163337 () Bool)

(assert (=> b!1262287 m!1163337))

(declare-fun m!1163339 () Bool)

(assert (=> b!1262288 m!1163339))

(check-sat (not b!1262286) b_and!45313 (not b_next!27403) (not b!1262288) (not start!106086) (not b!1262287) tp_is_empty!32305 (not mapNonEmpty!50260))
(check-sat b_and!45313 (not b_next!27403))
