; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104992 () Bool)

(assert start!104992)

(declare-fun b_free!26761 () Bool)

(declare-fun b_next!26761 () Bool)

(assert (=> start!104992 (= b_free!26761 (not b_next!26761))))

(declare-fun tp!93778 () Bool)

(declare-fun b_and!44547 () Bool)

(assert (=> start!104992 (= tp!93778 b_and!44547)))

(declare-fun b!1251423 () Bool)

(declare-fun e!710624 () Bool)

(declare-fun e!710623 () Bool)

(assert (=> b!1251423 (= e!710624 (not e!710623))))

(declare-fun res!834686 () Bool)

(assert (=> b!1251423 (=> res!834686 e!710623)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251423 (= res!834686 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47583 0))(
  ( (V!47584 (val!15894 Int)) )
))
(declare-datatypes ((tuple2!20492 0))(
  ( (tuple2!20493 (_1!10257 (_ BitVec 64)) (_2!10257 V!47583)) )
))
(declare-datatypes ((List!27726 0))(
  ( (Nil!27723) (Cons!27722 (h!28931 tuple2!20492) (t!41201 List!27726)) )
))
(declare-datatypes ((ListLongMap!18365 0))(
  ( (ListLongMap!18366 (toList!9198 List!27726)) )
))
(declare-fun lt!564816 () ListLongMap!18365)

(declare-fun lt!564814 () ListLongMap!18365)

(assert (=> b!1251423 (= lt!564816 lt!564814)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47583)

(declare-datatypes ((array!80990 0))(
  ( (array!80991 (arr!39060 (Array (_ BitVec 32) (_ BitVec 64))) (size!39596 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80990)

(declare-fun minValueBefore!43 () V!47583)

(declare-datatypes ((Unit!41583 0))(
  ( (Unit!41584) )
))
(declare-fun lt!564813 () Unit!41583)

(declare-fun minValueAfter!43 () V!47583)

(declare-datatypes ((ValueCell!15068 0))(
  ( (ValueCellFull!15068 (v!18591 V!47583)) (EmptyCell!15068) )
))
(declare-datatypes ((array!80992 0))(
  ( (array!80993 (arr!39061 (Array (_ BitVec 32) ValueCell!15068)) (size!39597 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80992)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!959 (array!80990 array!80992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 V!47583 V!47583 (_ BitVec 32) Int) Unit!41583)

(assert (=> b!1251423 (= lt!564813 (lemmaNoChangeToArrayThenSameMapNoExtras!959 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5595 (array!80990 array!80992 (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 (_ BitVec 32) Int) ListLongMap!18365)

(assert (=> b!1251423 (= lt!564814 (getCurrentListMapNoExtraKeys!5595 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251423 (= lt!564816 (getCurrentListMapNoExtraKeys!5595 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251424 () Bool)

(declare-fun e!710625 () Bool)

(declare-fun e!710622 () Bool)

(declare-fun mapRes!49261 () Bool)

(assert (=> b!1251424 (= e!710625 (and e!710622 mapRes!49261))))

(declare-fun condMapEmpty!49261 () Bool)

(declare-fun mapDefault!49261 () ValueCell!15068)

