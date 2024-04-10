; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104834 () Bool)

(assert start!104834)

(declare-fun b_free!26639 () Bool)

(declare-fun b_next!26639 () Bool)

(assert (=> start!104834 (= b_free!26639 (not b_next!26639))))

(declare-fun tp!93406 () Bool)

(declare-fun b_and!44407 () Bool)

(assert (=> start!104834 (= tp!93406 b_and!44407)))

(declare-fun b!1249599 () Bool)

(declare-fun e!709249 () Bool)

(declare-fun tp_is_empty!31541 () Bool)

(assert (=> b!1249599 (= e!709249 tp_is_empty!31541)))

(declare-fun b!1249600 () Bool)

(declare-fun e!709251 () Bool)

(assert (=> b!1249600 (= e!709251 tp_is_empty!31541)))

(declare-fun b!1249601 () Bool)

(declare-fun e!709252 () Bool)

(assert (=> b!1249601 (= e!709252 (not true))))

(declare-datatypes ((V!47419 0))(
  ( (V!47420 (val!15833 Int)) )
))
(declare-datatypes ((tuple2!20396 0))(
  ( (tuple2!20397 (_1!10209 (_ BitVec 64)) (_2!10209 V!47419)) )
))
(declare-datatypes ((List!27639 0))(
  ( (Nil!27636) (Cons!27635 (h!28844 tuple2!20396) (t!41110 List!27639)) )
))
(declare-datatypes ((ListLongMap!18269 0))(
  ( (ListLongMap!18270 (toList!9150 List!27639)) )
))
(declare-fun lt!563799 () ListLongMap!18269)

(declare-fun lt!563798 () ListLongMap!18269)

(assert (=> b!1249601 (= lt!563799 lt!563798)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47419)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47419)

(declare-datatypes ((array!80760 0))(
  ( (array!80761 (arr!38947 (Array (_ BitVec 32) (_ BitVec 64))) (size!39483 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80760)

(declare-datatypes ((ValueCell!15007 0))(
  ( (ValueCellFull!15007 (v!18529 V!47419)) (EmptyCell!15007) )
))
(declare-datatypes ((array!80762 0))(
  ( (array!80763 (arr!38948 (Array (_ BitVec 32) ValueCell!15007)) (size!39484 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80762)

(declare-datatypes ((Unit!41497 0))(
  ( (Unit!41498) )
))
(declare-fun lt!563800 () Unit!41497)

(declare-fun minValueBefore!43 () V!47419)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!921 (array!80760 array!80762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47419 V!47419 V!47419 V!47419 (_ BitVec 32) Int) Unit!41497)

(assert (=> b!1249601 (= lt!563800 (lemmaNoChangeToArrayThenSameMapNoExtras!921 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5557 (array!80760 array!80762 (_ BitVec 32) (_ BitVec 32) V!47419 V!47419 (_ BitVec 32) Int) ListLongMap!18269)

(assert (=> b!1249601 (= lt!563798 (getCurrentListMapNoExtraKeys!5557 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249601 (= lt!563799 (getCurrentListMapNoExtraKeys!5557 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833559 () Bool)

(assert (=> start!104834 (=> (not res!833559) (not e!709252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104834 (= res!833559 (validMask!0 mask!1466))))

(assert (=> start!104834 e!709252))

(assert (=> start!104834 true))

(assert (=> start!104834 tp!93406))

(assert (=> start!104834 tp_is_empty!31541))

(declare-fun array_inv!29721 (array!80760) Bool)

(assert (=> start!104834 (array_inv!29721 _keys!1118)))

(declare-fun e!709248 () Bool)

(declare-fun array_inv!29722 (array!80762) Bool)

(assert (=> start!104834 (and (array_inv!29722 _values!914) e!709248)))

(declare-fun b!1249602 () Bool)

(declare-fun res!833556 () Bool)

(assert (=> b!1249602 (=> (not res!833556) (not e!709252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80760 (_ BitVec 32)) Bool)

(assert (=> b!1249602 (= res!833556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49072 () Bool)

(declare-fun mapRes!49072 () Bool)

(declare-fun tp!93407 () Bool)

(assert (=> mapNonEmpty!49072 (= mapRes!49072 (and tp!93407 e!709251))))

(declare-fun mapKey!49072 () (_ BitVec 32))

(declare-fun mapValue!49072 () ValueCell!15007)

(declare-fun mapRest!49072 () (Array (_ BitVec 32) ValueCell!15007))

(assert (=> mapNonEmpty!49072 (= (arr!38948 _values!914) (store mapRest!49072 mapKey!49072 mapValue!49072))))

(declare-fun b!1249603 () Bool)

(declare-fun res!833558 () Bool)

(assert (=> b!1249603 (=> (not res!833558) (not e!709252))))

(declare-datatypes ((List!27640 0))(
  ( (Nil!27637) (Cons!27636 (h!28845 (_ BitVec 64)) (t!41111 List!27640)) )
))
(declare-fun arrayNoDuplicates!0 (array!80760 (_ BitVec 32) List!27640) Bool)

(assert (=> b!1249603 (= res!833558 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27637))))

(declare-fun mapIsEmpty!49072 () Bool)

(assert (=> mapIsEmpty!49072 mapRes!49072))

(declare-fun b!1249604 () Bool)

(assert (=> b!1249604 (= e!709248 (and e!709249 mapRes!49072))))

(declare-fun condMapEmpty!49072 () Bool)

(declare-fun mapDefault!49072 () ValueCell!15007)

