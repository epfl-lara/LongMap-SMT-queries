; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104972 () Bool)

(assert start!104972)

(declare-fun b_free!26741 () Bool)

(declare-fun b_next!26741 () Bool)

(assert (=> start!104972 (= b_free!26741 (not b_next!26741))))

(declare-fun tp!93718 () Bool)

(declare-fun b_and!44527 () Bool)

(assert (=> start!104972 (= tp!93718 b_and!44527)))

(declare-fun b!1251153 () Bool)

(declare-fun e!710411 () Bool)

(declare-fun e!710413 () Bool)

(assert (=> b!1251153 (= e!710411 e!710413)))

(declare-fun res!834504 () Bool)

(assert (=> b!1251153 (=> res!834504 e!710413)))

(declare-datatypes ((V!47555 0))(
  ( (V!47556 (val!15884 Int)) )
))
(declare-datatypes ((tuple2!20474 0))(
  ( (tuple2!20475 (_1!10248 (_ BitVec 64)) (_2!10248 V!47555)) )
))
(declare-datatypes ((List!27709 0))(
  ( (Nil!27706) (Cons!27705 (h!28914 tuple2!20474) (t!41184 List!27709)) )
))
(declare-datatypes ((ListLongMap!18347 0))(
  ( (ListLongMap!18348 (toList!9189 List!27709)) )
))
(declare-fun lt!564666 () ListLongMap!18347)

(declare-fun contains!7501 (ListLongMap!18347 (_ BitVec 64)) Bool)

(assert (=> b!1251153 (= res!834504 (contains!7501 lt!564666 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47555)

(declare-datatypes ((array!80950 0))(
  ( (array!80951 (arr!39040 (Array (_ BitVec 32) (_ BitVec 64))) (size!39576 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80950)

(declare-datatypes ((ValueCell!15058 0))(
  ( (ValueCellFull!15058 (v!18581 V!47555)) (EmptyCell!15058) )
))
(declare-datatypes ((array!80952 0))(
  ( (array!80953 (arr!39041 (Array (_ BitVec 32) ValueCell!15058)) (size!39577 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80952)

(declare-fun minValueBefore!43 () V!47555)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun getCurrentListMap!4461 (array!80950 array!80952 (_ BitVec 32) (_ BitVec 32) V!47555 V!47555 (_ BitVec 32) Int) ListLongMap!18347)

(assert (=> b!1251153 (= lt!564666 (getCurrentListMap!4461 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49231 () Bool)

(declare-fun mapRes!49231 () Bool)

(declare-fun tp!93719 () Bool)

(declare-fun e!710415 () Bool)

(assert (=> mapNonEmpty!49231 (= mapRes!49231 (and tp!93719 e!710415))))

(declare-fun mapRest!49231 () (Array (_ BitVec 32) ValueCell!15058))

(declare-fun mapValue!49231 () ValueCell!15058)

(declare-fun mapKey!49231 () (_ BitVec 32))

(assert (=> mapNonEmpty!49231 (= (arr!39041 _values!914) (store mapRest!49231 mapKey!49231 mapValue!49231))))

(declare-fun b!1251154 () Bool)

(declare-fun res!834506 () Bool)

(declare-fun e!710409 () Bool)

(assert (=> b!1251154 (=> (not res!834506) (not e!710409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80950 (_ BitVec 32)) Bool)

(assert (=> b!1251154 (= res!834506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834501 () Bool)

(assert (=> start!104972 (=> (not res!834501) (not e!710409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104972 (= res!834501 (validMask!0 mask!1466))))

(assert (=> start!104972 e!710409))

(assert (=> start!104972 true))

(assert (=> start!104972 tp!93718))

(declare-fun tp_is_empty!31643 () Bool)

(assert (=> start!104972 tp_is_empty!31643))

(declare-fun array_inv!29781 (array!80950) Bool)

(assert (=> start!104972 (array_inv!29781 _keys!1118)))

(declare-fun e!710410 () Bool)

(declare-fun array_inv!29782 (array!80952) Bool)

(assert (=> start!104972 (and (array_inv!29782 _values!914) e!710410)))

(declare-fun mapIsEmpty!49231 () Bool)

(assert (=> mapIsEmpty!49231 mapRes!49231))

(declare-fun b!1251155 () Bool)

(declare-fun res!834502 () Bool)

(assert (=> b!1251155 (=> (not res!834502) (not e!710409))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251155 (= res!834502 (and (= (size!39577 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39576 _keys!1118) (size!39577 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251156 () Bool)

(assert (=> b!1251156 (= e!710415 tp_is_empty!31643)))

(declare-fun b!1251157 () Bool)

(declare-fun e!710412 () Bool)

(assert (=> b!1251157 (= e!710412 tp_is_empty!31643)))

(declare-fun b!1251158 () Bool)

(assert (=> b!1251158 (= e!710409 (not e!710411))))

(declare-fun res!834503 () Bool)

(assert (=> b!1251158 (=> res!834503 e!710411)))

(assert (=> b!1251158 (= res!834503 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564663 () ListLongMap!18347)

(declare-fun lt!564665 () ListLongMap!18347)

(assert (=> b!1251158 (= lt!564663 lt!564665)))

(declare-datatypes ((Unit!41567 0))(
  ( (Unit!41568) )
))
(declare-fun lt!564662 () Unit!41567)

(declare-fun minValueAfter!43 () V!47555)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!952 (array!80950 array!80952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47555 V!47555 V!47555 V!47555 (_ BitVec 32) Int) Unit!41567)

(assert (=> b!1251158 (= lt!564662 (lemmaNoChangeToArrayThenSameMapNoExtras!952 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5588 (array!80950 array!80952 (_ BitVec 32) (_ BitVec 32) V!47555 V!47555 (_ BitVec 32) Int) ListLongMap!18347)

(assert (=> b!1251158 (= lt!564665 (getCurrentListMapNoExtraKeys!5588 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251158 (= lt!564663 (getCurrentListMapNoExtraKeys!5588 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251159 () Bool)

(assert (=> b!1251159 (= e!710410 (and e!710412 mapRes!49231))))

(declare-fun condMapEmpty!49231 () Bool)

(declare-fun mapDefault!49231 () ValueCell!15058)

