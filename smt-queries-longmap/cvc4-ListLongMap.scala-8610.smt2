; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104908 () Bool)

(assert start!104908)

(declare-fun b_free!26699 () Bool)

(declare-fun b_next!26699 () Bool)

(assert (=> start!104908 (= b_free!26699 (not b_next!26699))))

(declare-fun tp!93590 () Bool)

(declare-fun b_and!44475 () Bool)

(assert (=> start!104908 (= tp!93590 b_and!44475)))

(declare-fun b!1250430 () Bool)

(declare-fun res!834065 () Bool)

(declare-fun e!709874 () Bool)

(assert (=> b!1250430 (=> (not res!834065) (not e!709874))))

(declare-datatypes ((array!80870 0))(
  ( (array!80871 (arr!39001 (Array (_ BitVec 32) (_ BitVec 64))) (size!39537 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80870)

(declare-datatypes ((List!27679 0))(
  ( (Nil!27676) (Cons!27675 (h!28884 (_ BitVec 64)) (t!41152 List!27679)) )
))
(declare-fun arrayNoDuplicates!0 (array!80870 (_ BitVec 32) List!27679) Bool)

(assert (=> b!1250430 (= res!834065 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27676))))

(declare-fun b!1250431 () Bool)

(declare-fun e!709869 () Bool)

(declare-fun tp_is_empty!31601 () Bool)

(assert (=> b!1250431 (= e!709869 tp_is_empty!31601)))

(declare-fun b!1250432 () Bool)

(declare-fun e!709871 () Bool)

(assert (=> b!1250432 (= e!709871 tp_is_empty!31601)))

(declare-fun b!1250433 () Bool)

(declare-fun res!834063 () Bool)

(assert (=> b!1250433 (=> (not res!834063) (not e!709874))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80870 (_ BitVec 32)) Bool)

(assert (=> b!1250433 (= res!834063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250434 () Bool)

(declare-fun res!834062 () Bool)

(assert (=> b!1250434 (=> (not res!834062) (not e!709874))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47499 0))(
  ( (V!47500 (val!15863 Int)) )
))
(declare-datatypes ((ValueCell!15037 0))(
  ( (ValueCellFull!15037 (v!18559 V!47499)) (EmptyCell!15037) )
))
(declare-datatypes ((array!80872 0))(
  ( (array!80873 (arr!39002 (Array (_ BitVec 32) ValueCell!15037)) (size!39538 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80872)

(assert (=> b!1250434 (= res!834062 (and (= (size!39538 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39537 _keys!1118) (size!39538 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250435 () Bool)

(declare-fun e!709870 () Bool)

(assert (=> b!1250435 (= e!709874 (not e!709870))))

(declare-fun res!834067 () Bool)

(assert (=> b!1250435 (=> res!834067 e!709870)))

(assert (=> b!1250435 (= res!834067 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20438 0))(
  ( (tuple2!20439 (_1!10230 (_ BitVec 64)) (_2!10230 V!47499)) )
))
(declare-datatypes ((List!27680 0))(
  ( (Nil!27677) (Cons!27676 (h!28885 tuple2!20438) (t!41153 List!27680)) )
))
(declare-datatypes ((ListLongMap!18311 0))(
  ( (ListLongMap!18312 (toList!9171 List!27680)) )
))
(declare-fun lt!564224 () ListLongMap!18311)

(declare-fun lt!564227 () ListLongMap!18311)

(assert (=> b!1250435 (= lt!564224 lt!564227)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47499)

(declare-datatypes ((Unit!41533 0))(
  ( (Unit!41534) )
))
(declare-fun lt!564226 () Unit!41533)

(declare-fun zeroValue!871 () V!47499)

(declare-fun minValueBefore!43 () V!47499)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!938 (array!80870 array!80872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47499 V!47499 V!47499 V!47499 (_ BitVec 32) Int) Unit!41533)

(assert (=> b!1250435 (= lt!564226 (lemmaNoChangeToArrayThenSameMapNoExtras!938 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5574 (array!80870 array!80872 (_ BitVec 32) (_ BitVec 32) V!47499 V!47499 (_ BitVec 32) Int) ListLongMap!18311)

(assert (=> b!1250435 (= lt!564227 (getCurrentListMapNoExtraKeys!5574 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250435 (= lt!564224 (getCurrentListMapNoExtraKeys!5574 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250436 () Bool)

(declare-fun e!709868 () Bool)

(declare-fun mapRes!49165 () Bool)

(assert (=> b!1250436 (= e!709868 (and e!709869 mapRes!49165))))

(declare-fun condMapEmpty!49165 () Bool)

(declare-fun mapDefault!49165 () ValueCell!15037)

