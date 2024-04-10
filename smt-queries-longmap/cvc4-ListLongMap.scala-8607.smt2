; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104890 () Bool)

(assert start!104890)

(declare-fun b_free!26681 () Bool)

(declare-fun b_next!26681 () Bool)

(assert (=> start!104890 (= b_free!26681 (not b_next!26681))))

(declare-fun tp!93536 () Bool)

(declare-fun b_and!44457 () Bool)

(assert (=> start!104890 (= tp!93536 b_and!44457)))

(declare-fun b!1250186 () Bool)

(declare-fun e!709679 () Bool)

(declare-fun e!709680 () Bool)

(assert (=> b!1250186 (= e!709679 e!709680)))

(declare-fun res!833901 () Bool)

(assert (=> b!1250186 (=> res!833901 e!709680)))

(declare-datatypes ((V!47475 0))(
  ( (V!47476 (val!15854 Int)) )
))
(declare-datatypes ((tuple2!20424 0))(
  ( (tuple2!20425 (_1!10223 (_ BitVec 64)) (_2!10223 V!47475)) )
))
(declare-datatypes ((List!27667 0))(
  ( (Nil!27664) (Cons!27663 (h!28872 tuple2!20424) (t!41140 List!27667)) )
))
(declare-datatypes ((ListLongMap!18297 0))(
  ( (ListLongMap!18298 (toList!9164 List!27667)) )
))
(declare-fun lt!564092 () ListLongMap!18297)

(declare-fun contains!7480 (ListLongMap!18297 (_ BitVec 64)) Bool)

(assert (=> b!1250186 (= res!833901 (contains!7480 lt!564092 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47475)

(declare-datatypes ((array!80836 0))(
  ( (array!80837 (arr!38984 (Array (_ BitVec 32) (_ BitVec 64))) (size!39520 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80836)

(declare-datatypes ((ValueCell!15028 0))(
  ( (ValueCellFull!15028 (v!18550 V!47475)) (EmptyCell!15028) )
))
(declare-datatypes ((array!80838 0))(
  ( (array!80839 (arr!38985 (Array (_ BitVec 32) ValueCell!15028)) (size!39521 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80838)

(declare-fun minValueBefore!43 () V!47475)

(declare-fun getCurrentListMap!4441 (array!80836 array!80838 (_ BitVec 32) (_ BitVec 32) V!47475 V!47475 (_ BitVec 32) Int) ListLongMap!18297)

(assert (=> b!1250186 (= lt!564092 (getCurrentListMap!4441 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250187 () Bool)

(declare-fun res!833905 () Bool)

(declare-fun e!709683 () Bool)

(assert (=> b!1250187 (=> (not res!833905) (not e!709683))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250187 (= res!833905 (and (= (size!39521 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39520 _keys!1118) (size!39521 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250188 () Bool)

(declare-fun e!709684 () Bool)

(declare-fun e!709685 () Bool)

(declare-fun mapRes!49138 () Bool)

(assert (=> b!1250188 (= e!709684 (and e!709685 mapRes!49138))))

(declare-fun condMapEmpty!49138 () Bool)

(declare-fun mapDefault!49138 () ValueCell!15028)

