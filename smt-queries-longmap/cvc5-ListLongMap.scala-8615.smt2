; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104956 () Bool)

(assert start!104956)

(declare-fun b_free!26725 () Bool)

(declare-fun b_next!26725 () Bool)

(assert (=> start!104956 (= b_free!26725 (not b_next!26725))))

(declare-fun tp!93670 () Bool)

(declare-fun b_and!44511 () Bool)

(assert (=> start!104956 (= tp!93670 b_and!44511)))

(declare-fun b!1250937 () Bool)

(declare-fun res!834361 () Bool)

(declare-fun e!710247 () Bool)

(assert (=> b!1250937 (=> (not res!834361) (not e!710247))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80922 0))(
  ( (array!80923 (arr!39026 (Array (_ BitVec 32) (_ BitVec 64))) (size!39562 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80922)

(declare-datatypes ((V!47535 0))(
  ( (V!47536 (val!15876 Int)) )
))
(declare-datatypes ((ValueCell!15050 0))(
  ( (ValueCellFull!15050 (v!18573 V!47535)) (EmptyCell!15050) )
))
(declare-datatypes ((array!80924 0))(
  ( (array!80925 (arr!39027 (Array (_ BitVec 32) ValueCell!15050)) (size!39563 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80924)

(assert (=> b!1250937 (= res!834361 (and (= (size!39563 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39562 _keys!1118) (size!39563 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49207 () Bool)

(declare-fun mapRes!49207 () Bool)

(assert (=> mapIsEmpty!49207 mapRes!49207))

(declare-fun res!834362 () Bool)

(assert (=> start!104956 (=> (not res!834362) (not e!710247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104956 (= res!834362 (validMask!0 mask!1466))))

(assert (=> start!104956 e!710247))

(assert (=> start!104956 true))

(assert (=> start!104956 tp!93670))

(declare-fun tp_is_empty!31627 () Bool)

(assert (=> start!104956 tp_is_empty!31627))

(declare-fun array_inv!29769 (array!80922) Bool)

(assert (=> start!104956 (array_inv!29769 _keys!1118)))

(declare-fun e!710245 () Bool)

(declare-fun array_inv!29770 (array!80924) Bool)

(assert (=> start!104956 (and (array_inv!29770 _values!914) e!710245)))

(declare-fun b!1250938 () Bool)

(declare-fun e!710241 () Bool)

(declare-fun e!710246 () Bool)

(assert (=> b!1250938 (= e!710241 e!710246)))

(declare-fun res!834357 () Bool)

(assert (=> b!1250938 (=> res!834357 e!710246)))

(declare-datatypes ((tuple2!20462 0))(
  ( (tuple2!20463 (_1!10242 (_ BitVec 64)) (_2!10242 V!47535)) )
))
(declare-datatypes ((List!27699 0))(
  ( (Nil!27696) (Cons!27695 (h!28904 tuple2!20462) (t!41174 List!27699)) )
))
(declare-datatypes ((ListLongMap!18335 0))(
  ( (ListLongMap!18336 (toList!9183 List!27699)) )
))
(declare-fun lt!564543 () ListLongMap!18335)

(declare-fun contains!7496 (ListLongMap!18335 (_ BitVec 64)) Bool)

(assert (=> b!1250938 (= res!834357 (contains!7496 lt!564543 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47535)

(declare-fun minValueBefore!43 () V!47535)

(declare-fun getCurrentListMap!4456 (array!80922 array!80924 (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 (_ BitVec 32) Int) ListLongMap!18335)

(assert (=> b!1250938 (= lt!564543 (getCurrentListMap!4456 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250939 () Bool)

(declare-fun e!710242 () Bool)

(assert (=> b!1250939 (= e!710245 (and e!710242 mapRes!49207))))

(declare-fun condMapEmpty!49207 () Bool)

(declare-fun mapDefault!49207 () ValueCell!15050)

