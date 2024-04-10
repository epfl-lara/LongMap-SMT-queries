; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104898 () Bool)

(assert start!104898)

(declare-fun b_free!26689 () Bool)

(declare-fun b_next!26689 () Bool)

(assert (=> start!104898 (= b_free!26689 (not b_next!26689))))

(declare-fun tp!93560 () Bool)

(declare-fun b_and!44465 () Bool)

(assert (=> start!104898 (= tp!93560 b_and!44465)))

(declare-fun b!1250294 () Bool)

(declare-fun e!709763 () Bool)

(declare-fun tp_is_empty!31591 () Bool)

(assert (=> b!1250294 (= e!709763 tp_is_empty!31591)))

(declare-fun b!1250295 () Bool)

(declare-fun e!709768 () Bool)

(declare-fun e!709766 () Bool)

(assert (=> b!1250295 (= e!709768 (not e!709766))))

(declare-fun res!833976 () Bool)

(assert (=> b!1250295 (=> res!833976 e!709766)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250295 (= res!833976 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47487 0))(
  ( (V!47488 (val!15858 Int)) )
))
(declare-datatypes ((tuple2!20430 0))(
  ( (tuple2!20431 (_1!10226 (_ BitVec 64)) (_2!10226 V!47487)) )
))
(declare-datatypes ((List!27672 0))(
  ( (Nil!27669) (Cons!27668 (h!28877 tuple2!20430) (t!41145 List!27672)) )
))
(declare-datatypes ((ListLongMap!18303 0))(
  ( (ListLongMap!18304 (toList!9167 List!27672)) )
))
(declare-fun lt!564150 () ListLongMap!18303)

(declare-fun lt!564149 () ListLongMap!18303)

(assert (=> b!1250295 (= lt!564150 lt!564149)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47487)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47487)

(declare-datatypes ((array!80852 0))(
  ( (array!80853 (arr!38992 (Array (_ BitVec 32) (_ BitVec 64))) (size!39528 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80852)

(declare-datatypes ((ValueCell!15032 0))(
  ( (ValueCellFull!15032 (v!18554 V!47487)) (EmptyCell!15032) )
))
(declare-datatypes ((array!80854 0))(
  ( (array!80855 (arr!38993 (Array (_ BitVec 32) ValueCell!15032)) (size!39529 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80854)

(declare-datatypes ((Unit!41527 0))(
  ( (Unit!41528) )
))
(declare-fun lt!564152 () Unit!41527)

(declare-fun minValueBefore!43 () V!47487)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!935 (array!80852 array!80854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 V!47487 V!47487 (_ BitVec 32) Int) Unit!41527)

(assert (=> b!1250295 (= lt!564152 (lemmaNoChangeToArrayThenSameMapNoExtras!935 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5571 (array!80852 array!80854 (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 (_ BitVec 32) Int) ListLongMap!18303)

(assert (=> b!1250295 (= lt!564149 (getCurrentListMapNoExtraKeys!5571 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250295 (= lt!564150 (getCurrentListMapNoExtraKeys!5571 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49150 () Bool)

(declare-fun mapRes!49150 () Bool)

(assert (=> mapIsEmpty!49150 mapRes!49150))

(declare-fun b!1250296 () Bool)

(declare-fun e!709764 () Bool)

(assert (=> b!1250296 (= e!709764 true)))

(declare-fun lt!564148 () ListLongMap!18303)

(declare-fun -!1996 (ListLongMap!18303 (_ BitVec 64)) ListLongMap!18303)

(assert (=> b!1250296 (= (-!1996 lt!564148 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564148)))

(declare-fun lt!564151 () Unit!41527)

(declare-fun removeNotPresentStillSame!91 (ListLongMap!18303 (_ BitVec 64)) Unit!41527)

(assert (=> b!1250296 (= lt!564151 (removeNotPresentStillSame!91 lt!564148 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250297 () Bool)

(declare-fun res!833974 () Bool)

(assert (=> b!1250297 (=> (not res!833974) (not e!709768))))

(assert (=> b!1250297 (= res!833974 (and (= (size!39529 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39528 _keys!1118) (size!39529 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49150 () Bool)

(declare-fun tp!93559 () Bool)

(assert (=> mapNonEmpty!49150 (= mapRes!49150 (and tp!93559 e!709763))))

(declare-fun mapKey!49150 () (_ BitVec 32))

(declare-fun mapRest!49150 () (Array (_ BitVec 32) ValueCell!15032))

(declare-fun mapValue!49150 () ValueCell!15032)

(assert (=> mapNonEmpty!49150 (= (arr!38993 _values!914) (store mapRest!49150 mapKey!49150 mapValue!49150))))

(declare-fun b!1250298 () Bool)

(declare-fun res!833972 () Bool)

(assert (=> b!1250298 (=> (not res!833972) (not e!709768))))

(declare-datatypes ((List!27673 0))(
  ( (Nil!27670) (Cons!27669 (h!28878 (_ BitVec 64)) (t!41146 List!27673)) )
))
(declare-fun arrayNoDuplicates!0 (array!80852 (_ BitVec 32) List!27673) Bool)

(assert (=> b!1250298 (= res!833972 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27670))))

(declare-fun res!833973 () Bool)

(assert (=> start!104898 (=> (not res!833973) (not e!709768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104898 (= res!833973 (validMask!0 mask!1466))))

(assert (=> start!104898 e!709768))

(assert (=> start!104898 true))

(assert (=> start!104898 tp!93560))

(assert (=> start!104898 tp_is_empty!31591))

(declare-fun array_inv!29749 (array!80852) Bool)

(assert (=> start!104898 (array_inv!29749 _keys!1118)))

(declare-fun e!709767 () Bool)

(declare-fun array_inv!29750 (array!80854) Bool)

(assert (=> start!104898 (and (array_inv!29750 _values!914) e!709767)))

(declare-fun b!1250299 () Bool)

(assert (=> b!1250299 (= e!709766 e!709764)))

(declare-fun res!833977 () Bool)

(assert (=> b!1250299 (=> res!833977 e!709764)))

(declare-fun contains!7483 (ListLongMap!18303 (_ BitVec 64)) Bool)

(assert (=> b!1250299 (= res!833977 (contains!7483 lt!564148 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4444 (array!80852 array!80854 (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 (_ BitVec 32) Int) ListLongMap!18303)

(assert (=> b!1250299 (= lt!564148 (getCurrentListMap!4444 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250300 () Bool)

(declare-fun e!709765 () Bool)

(assert (=> b!1250300 (= e!709767 (and e!709765 mapRes!49150))))

(declare-fun condMapEmpty!49150 () Bool)

(declare-fun mapDefault!49150 () ValueCell!15032)

