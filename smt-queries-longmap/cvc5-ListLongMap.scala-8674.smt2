; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105420 () Bool)

(assert start!105420)

(declare-fun b_free!27079 () Bool)

(declare-fun b_next!27079 () Bool)

(assert (=> start!105420 (= b_free!27079 (not b_next!27079))))

(declare-fun tp!94750 () Bool)

(declare-fun b_and!44925 () Bool)

(assert (=> start!105420 (= tp!94750 b_and!44925)))

(declare-fun b!1255983 () Bool)

(declare-fun e!713925 () Bool)

(declare-fun e!713926 () Bool)

(assert (=> b!1255983 (= e!713925 e!713926)))

(declare-fun res!837316 () Bool)

(assert (=> b!1255983 (=> res!837316 e!713926)))

(declare-datatypes ((V!48007 0))(
  ( (V!48008 (val!16053 Int)) )
))
(declare-datatypes ((tuple2!20734 0))(
  ( (tuple2!20735 (_1!10378 (_ BitVec 64)) (_2!10378 V!48007)) )
))
(declare-datatypes ((List!27953 0))(
  ( (Nil!27950) (Cons!27949 (h!29158 tuple2!20734) (t!41440 List!27953)) )
))
(declare-datatypes ((ListLongMap!18607 0))(
  ( (ListLongMap!18608 (toList!9319 List!27953)) )
))
(declare-fun lt!567868 () ListLongMap!18607)

(declare-fun contains!7536 (ListLongMap!18607 (_ BitVec 64)) Bool)

(assert (=> b!1255983 (= res!837316 (contains!7536 lt!567868 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48007)

(declare-datatypes ((array!81604 0))(
  ( (array!81605 (arr!39361 (Array (_ BitVec 32) (_ BitVec 64))) (size!39897 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81604)

(declare-datatypes ((ValueCell!15227 0))(
  ( (ValueCellFull!15227 (v!18753 V!48007)) (EmptyCell!15227) )
))
(declare-datatypes ((array!81606 0))(
  ( (array!81607 (arr!39362 (Array (_ BitVec 32) ValueCell!15227)) (size!39898 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81606)

(declare-fun minValueBefore!43 () V!48007)

(declare-fun getCurrentListMap!4542 (array!81604 array!81606 (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 (_ BitVec 32) Int) ListLongMap!18607)

(assert (=> b!1255983 (= lt!567868 (getCurrentListMap!4542 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255984 () Bool)

(declare-fun res!837317 () Bool)

(declare-fun e!713928 () Bool)

(assert (=> b!1255984 (=> (not res!837317) (not e!713928))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255984 (= res!837317 (and (= (size!39898 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39897 _keys!1118) (size!39898 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255985 () Bool)

(declare-fun res!837312 () Bool)

(assert (=> b!1255985 (=> (not res!837312) (not e!713928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81604 (_ BitVec 32)) Bool)

(assert (=> b!1255985 (= res!837312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255986 () Bool)

(declare-fun e!713930 () Bool)

(declare-fun tp_is_empty!31981 () Bool)

(assert (=> b!1255986 (= e!713930 tp_is_empty!31981)))

(declare-fun b!1255987 () Bool)

(declare-fun e!713927 () Bool)

(declare-fun mapRes!49756 () Bool)

(assert (=> b!1255987 (= e!713927 (and e!713930 mapRes!49756))))

(declare-fun condMapEmpty!49756 () Bool)

(declare-fun mapDefault!49756 () ValueCell!15227)

