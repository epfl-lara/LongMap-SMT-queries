; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104958 () Bool)

(assert start!104958)

(declare-fun b_free!26731 () Bool)

(declare-fun b_next!26731 () Bool)

(assert (=> start!104958 (= b_free!26731 (not b_next!26731))))

(declare-fun tp!93688 () Bool)

(declare-fun b_and!44499 () Bool)

(assert (=> start!104958 (= tp!93688 b_and!44499)))

(declare-fun b!1250936 () Bool)

(declare-fun res!834372 () Bool)

(declare-fun e!710259 () Bool)

(assert (=> b!1250936 (=> (not res!834372) (not e!710259))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80853 0))(
  ( (array!80854 (arr!38992 (Array (_ BitVec 32) (_ BitVec 64))) (size!39530 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80853)

(declare-datatypes ((V!47543 0))(
  ( (V!47544 (val!15879 Int)) )
))
(declare-datatypes ((ValueCell!15053 0))(
  ( (ValueCellFull!15053 (v!18575 V!47543)) (EmptyCell!15053) )
))
(declare-datatypes ((array!80855 0))(
  ( (array!80856 (arr!38993 (Array (_ BitVec 32) ValueCell!15053)) (size!39531 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80855)

(assert (=> b!1250936 (= res!834372 (and (= (size!39531 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39530 _keys!1118) (size!39531 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250937 () Bool)

(declare-fun e!710264 () Bool)

(declare-fun tp_is_empty!31633 () Bool)

(assert (=> b!1250937 (= e!710264 tp_is_empty!31633)))

(declare-fun b!1250938 () Bool)

(declare-fun e!710263 () Bool)

(assert (=> b!1250938 (= e!710263 true)))

(declare-datatypes ((tuple2!20552 0))(
  ( (tuple2!20553 (_1!10287 (_ BitVec 64)) (_2!10287 V!47543)) )
))
(declare-datatypes ((List!27773 0))(
  ( (Nil!27770) (Cons!27769 (h!28978 tuple2!20552) (t!41239 List!27773)) )
))
(declare-datatypes ((ListLongMap!18425 0))(
  ( (ListLongMap!18426 (toList!9228 List!27773)) )
))
(declare-fun lt!564412 () ListLongMap!18425)

(declare-fun -!1974 (ListLongMap!18425 (_ BitVec 64)) ListLongMap!18425)

(assert (=> b!1250938 (= (-!1974 lt!564412 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564412)))

(declare-datatypes ((Unit!41422 0))(
  ( (Unit!41423) )
))
(declare-fun lt!564409 () Unit!41422)

(declare-fun removeNotPresentStillSame!102 (ListLongMap!18425 (_ BitVec 64)) Unit!41422)

(assert (=> b!1250938 (= lt!564409 (removeNotPresentStillSame!102 lt!564412 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250939 () Bool)

(declare-fun e!710260 () Bool)

(assert (=> b!1250939 (= e!710259 (not e!710260))))

(declare-fun res!834373 () Bool)

(assert (=> b!1250939 (=> res!834373 e!710260)))

(assert (=> b!1250939 (= res!834373 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564411 () ListLongMap!18425)

(declare-fun lt!564410 () ListLongMap!18425)

(assert (=> b!1250939 (= lt!564411 lt!564410)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47543)

(declare-fun zeroValue!871 () V!47543)

(declare-fun minValueBefore!43 () V!47543)

(declare-fun lt!564408 () Unit!41422)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!959 (array!80853 array!80855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47543 V!47543 V!47543 V!47543 (_ BitVec 32) Int) Unit!41422)

(assert (=> b!1250939 (= lt!564408 (lemmaNoChangeToArrayThenSameMapNoExtras!959 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5637 (array!80853 array!80855 (_ BitVec 32) (_ BitVec 32) V!47543 V!47543 (_ BitVec 32) Int) ListLongMap!18425)

(assert (=> b!1250939 (= lt!564410 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250939 (= lt!564411 (getCurrentListMapNoExtraKeys!5637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250940 () Bool)

(declare-fun res!834376 () Bool)

(assert (=> b!1250940 (=> (not res!834376) (not e!710259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80853 (_ BitVec 32)) Bool)

(assert (=> b!1250940 (= res!834376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834374 () Bool)

(assert (=> start!104958 (=> (not res!834374) (not e!710259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104958 (= res!834374 (validMask!0 mask!1466))))

(assert (=> start!104958 e!710259))

(assert (=> start!104958 true))

(assert (=> start!104958 tp!93688))

(assert (=> start!104958 tp_is_empty!31633))

(declare-fun array_inv!29875 (array!80853) Bool)

(assert (=> start!104958 (array_inv!29875 _keys!1118)))

(declare-fun e!710265 () Bool)

(declare-fun array_inv!29876 (array!80855) Bool)

(assert (=> start!104958 (and (array_inv!29876 _values!914) e!710265)))

(declare-fun b!1250941 () Bool)

(declare-fun mapRes!49216 () Bool)

(assert (=> b!1250941 (= e!710265 (and e!710264 mapRes!49216))))

(declare-fun condMapEmpty!49216 () Bool)

(declare-fun mapDefault!49216 () ValueCell!15053)

(assert (=> b!1250941 (= condMapEmpty!49216 (= (arr!38993 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15053)) mapDefault!49216)))))

(declare-fun b!1250942 () Bool)

(declare-fun e!710261 () Bool)

(assert (=> b!1250942 (= e!710261 tp_is_empty!31633)))

(declare-fun b!1250943 () Bool)

(declare-fun res!834371 () Bool)

(assert (=> b!1250943 (=> (not res!834371) (not e!710259))))

(declare-datatypes ((List!27774 0))(
  ( (Nil!27771) (Cons!27770 (h!28979 (_ BitVec 64)) (t!41240 List!27774)) )
))
(declare-fun arrayNoDuplicates!0 (array!80853 (_ BitVec 32) List!27774) Bool)

(assert (=> b!1250943 (= res!834371 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27771))))

(declare-fun b!1250944 () Bool)

(assert (=> b!1250944 (= e!710260 e!710263)))

(declare-fun res!834375 () Bool)

(assert (=> b!1250944 (=> res!834375 e!710263)))

(declare-fun contains!7473 (ListLongMap!18425 (_ BitVec 64)) Bool)

(assert (=> b!1250944 (= res!834375 (contains!7473 lt!564412 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4399 (array!80853 array!80855 (_ BitVec 32) (_ BitVec 32) V!47543 V!47543 (_ BitVec 32) Int) ListLongMap!18425)

(assert (=> b!1250944 (= lt!564412 (getCurrentListMap!4399 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49216 () Bool)

(declare-fun tp!93689 () Bool)

(assert (=> mapNonEmpty!49216 (= mapRes!49216 (and tp!93689 e!710261))))

(declare-fun mapRest!49216 () (Array (_ BitVec 32) ValueCell!15053))

(declare-fun mapKey!49216 () (_ BitVec 32))

(declare-fun mapValue!49216 () ValueCell!15053)

(assert (=> mapNonEmpty!49216 (= (arr!38993 _values!914) (store mapRest!49216 mapKey!49216 mapValue!49216))))

(declare-fun mapIsEmpty!49216 () Bool)

(assert (=> mapIsEmpty!49216 mapRes!49216))

(assert (= (and start!104958 res!834374) b!1250936))

(assert (= (and b!1250936 res!834372) b!1250940))

(assert (= (and b!1250940 res!834376) b!1250943))

(assert (= (and b!1250943 res!834371) b!1250939))

(assert (= (and b!1250939 (not res!834373)) b!1250944))

(assert (= (and b!1250944 (not res!834375)) b!1250938))

(assert (= (and b!1250941 condMapEmpty!49216) mapIsEmpty!49216))

(assert (= (and b!1250941 (not condMapEmpty!49216)) mapNonEmpty!49216))

(get-info :version)

(assert (= (and mapNonEmpty!49216 ((_ is ValueCellFull!15053) mapValue!49216)) b!1250942))

(assert (= (and b!1250941 ((_ is ValueCellFull!15053) mapDefault!49216)) b!1250937))

(assert (= start!104958 b!1250941))

(declare-fun m!1151281 () Bool)

(assert (=> mapNonEmpty!49216 m!1151281))

(declare-fun m!1151283 () Bool)

(assert (=> b!1250940 m!1151283))

(declare-fun m!1151285 () Bool)

(assert (=> b!1250943 m!1151285))

(declare-fun m!1151287 () Bool)

(assert (=> b!1250938 m!1151287))

(declare-fun m!1151289 () Bool)

(assert (=> b!1250938 m!1151289))

(declare-fun m!1151291 () Bool)

(assert (=> b!1250939 m!1151291))

(declare-fun m!1151293 () Bool)

(assert (=> b!1250939 m!1151293))

(declare-fun m!1151295 () Bool)

(assert (=> b!1250939 m!1151295))

(declare-fun m!1151297 () Bool)

(assert (=> start!104958 m!1151297))

(declare-fun m!1151299 () Bool)

(assert (=> start!104958 m!1151299))

(declare-fun m!1151301 () Bool)

(assert (=> start!104958 m!1151301))

(declare-fun m!1151303 () Bool)

(assert (=> b!1250944 m!1151303))

(declare-fun m!1151305 () Bool)

(assert (=> b!1250944 m!1151305))

(check-sat (not b!1250944) tp_is_empty!31633 b_and!44499 (not b!1250938) (not b!1250943) (not start!104958) (not b_next!26731) (not mapNonEmpty!49216) (not b!1250939) (not b!1250940))
(check-sat b_and!44499 (not b_next!26731))
