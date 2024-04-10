; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104758 () Bool)

(assert start!104758)

(declare-fun b_free!26563 () Bool)

(declare-fun b_next!26563 () Bool)

(assert (=> start!104758 (= b_free!26563 (not b_next!26563))))

(declare-fun tp!93178 () Bool)

(declare-fun b_and!44331 () Bool)

(assert (=> start!104758 (= tp!93178 b_and!44331)))

(declare-fun b!1248801 () Bool)

(declare-fun e!708679 () Bool)

(declare-fun tp_is_empty!31465 () Bool)

(assert (=> b!1248801 (= e!708679 tp_is_empty!31465)))

(declare-fun b!1248802 () Bool)

(declare-fun res!833102 () Bool)

(declare-fun e!708678 () Bool)

(assert (=> b!1248802 (=> (not res!833102) (not e!708678))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80616 0))(
  ( (array!80617 (arr!38875 (Array (_ BitVec 32) (_ BitVec 64))) (size!39411 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80616)

(declare-datatypes ((V!47319 0))(
  ( (V!47320 (val!15795 Int)) )
))
(declare-datatypes ((ValueCell!14969 0))(
  ( (ValueCellFull!14969 (v!18491 V!47319)) (EmptyCell!14969) )
))
(declare-datatypes ((array!80618 0))(
  ( (array!80619 (arr!38876 (Array (_ BitVec 32) ValueCell!14969)) (size!39412 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80618)

(assert (=> b!1248802 (= res!833102 (and (= (size!39412 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39411 _keys!1118) (size!39412 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48958 () Bool)

(declare-fun mapRes!48958 () Bool)

(assert (=> mapIsEmpty!48958 mapRes!48958))

(declare-fun b!1248803 () Bool)

(declare-fun e!708682 () Bool)

(assert (=> b!1248803 (= e!708682 tp_is_empty!31465)))

(declare-fun b!1248804 () Bool)

(declare-fun res!833100 () Bool)

(assert (=> b!1248804 (=> (not res!833100) (not e!708678))))

(declare-datatypes ((List!27587 0))(
  ( (Nil!27584) (Cons!27583 (h!28792 (_ BitVec 64)) (t!41058 List!27587)) )
))
(declare-fun arrayNoDuplicates!0 (array!80616 (_ BitVec 32) List!27587) Bool)

(assert (=> b!1248804 (= res!833100 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27584))))

(declare-fun b!1248805 () Bool)

(assert (=> b!1248805 (= e!708678 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20340 0))(
  ( (tuple2!20341 (_1!10181 (_ BitVec 64)) (_2!10181 V!47319)) )
))
(declare-datatypes ((List!27588 0))(
  ( (Nil!27585) (Cons!27584 (h!28793 tuple2!20340) (t!41059 List!27588)) )
))
(declare-datatypes ((ListLongMap!18213 0))(
  ( (ListLongMap!18214 (toList!9122 List!27588)) )
))
(declare-fun lt!563518 () ListLongMap!18213)

(declare-fun minValueAfter!43 () V!47319)

(declare-fun zeroValue!871 () V!47319)

(declare-fun getCurrentListMapNoExtraKeys!5529 (array!80616 array!80618 (_ BitVec 32) (_ BitVec 32) V!47319 V!47319 (_ BitVec 32) Int) ListLongMap!18213)

(assert (=> b!1248805 (= lt!563518 (getCurrentListMapNoExtraKeys!5529 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563517 () ListLongMap!18213)

(declare-fun minValueBefore!43 () V!47319)

(assert (=> b!1248805 (= lt!563517 (getCurrentListMapNoExtraKeys!5529 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248806 () Bool)

(declare-fun e!708681 () Bool)

(assert (=> b!1248806 (= e!708681 (and e!708682 mapRes!48958))))

(declare-fun condMapEmpty!48958 () Bool)

(declare-fun mapDefault!48958 () ValueCell!14969)

