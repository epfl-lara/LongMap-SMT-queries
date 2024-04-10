; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77852 () Bool)

(assert start!77852)

(declare-fun b_free!16411 () Bool)

(declare-fun b_next!16411 () Bool)

(assert (=> start!77852 (= b_free!16411 (not b_next!16411))))

(declare-fun tp!57498 () Bool)

(declare-fun b_and!26979 () Bool)

(assert (=> start!77852 (= tp!57498 b_and!26979)))

(declare-fun b!909076 () Bool)

(declare-fun e!509523 () Bool)

(assert (=> b!909076 (= e!509523 false)))

(declare-datatypes ((V!30071 0))(
  ( (V!30072 (val!9465 Int)) )
))
(declare-datatypes ((ValueCell!8933 0))(
  ( (ValueCellFull!8933 (v!11972 V!30071)) (EmptyCell!8933) )
))
(declare-datatypes ((array!53686 0))(
  ( (array!53687 (arr!25801 (Array (_ BitVec 32) ValueCell!8933)) (size!26260 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53686)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30071)

(declare-datatypes ((array!53688 0))(
  ( (array!53689 (arr!25802 (Array (_ BitVec 32) (_ BitVec 64))) (size!26261 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53688)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!409943 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30071)

(declare-datatypes ((tuple2!12336 0))(
  ( (tuple2!12337 (_1!6179 (_ BitVec 64)) (_2!6179 V!30071)) )
))
(declare-datatypes ((List!18128 0))(
  ( (Nil!18125) (Cons!18124 (h!19270 tuple2!12336) (t!25709 List!18128)) )
))
(declare-datatypes ((ListLongMap!11033 0))(
  ( (ListLongMap!11034 (toList!5532 List!18128)) )
))
(declare-fun contains!4574 (ListLongMap!11033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2794 (array!53688 array!53686 (_ BitVec 32) (_ BitVec 32) V!30071 V!30071 (_ BitVec 32) Int) ListLongMap!11033)

(assert (=> b!909076 (= lt!409943 (contains!4574 (getCurrentListMap!2794 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909077 () Bool)

(declare-fun e!509522 () Bool)

(declare-fun tp_is_empty!18829 () Bool)

(assert (=> b!909077 (= e!509522 tp_is_empty!18829)))

(declare-fun b!909078 () Bool)

(declare-fun res!613603 () Bool)

(assert (=> b!909078 (=> (not res!613603) (not e!509523))))

(assert (=> b!909078 (= res!613603 (and (= (size!26260 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26261 _keys!1386) (size!26260 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909079 () Bool)

(declare-fun e!509526 () Bool)

(assert (=> b!909079 (= e!509526 tp_is_empty!18829)))

(declare-fun mapNonEmpty!29959 () Bool)

(declare-fun mapRes!29959 () Bool)

(declare-fun tp!57497 () Bool)

(assert (=> mapNonEmpty!29959 (= mapRes!29959 (and tp!57497 e!509526))))

(declare-fun mapRest!29959 () (Array (_ BitVec 32) ValueCell!8933))

(declare-fun mapValue!29959 () ValueCell!8933)

(declare-fun mapKey!29959 () (_ BitVec 32))

(assert (=> mapNonEmpty!29959 (= (arr!25801 _values!1152) (store mapRest!29959 mapKey!29959 mapValue!29959))))

(declare-fun b!909080 () Bool)

(declare-fun res!613605 () Bool)

(assert (=> b!909080 (=> (not res!613605) (not e!509523))))

(declare-datatypes ((List!18129 0))(
  ( (Nil!18126) (Cons!18125 (h!19271 (_ BitVec 64)) (t!25710 List!18129)) )
))
(declare-fun arrayNoDuplicates!0 (array!53688 (_ BitVec 32) List!18129) Bool)

(assert (=> b!909080 (= res!613605 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18126))))

(declare-fun mapIsEmpty!29959 () Bool)

(assert (=> mapIsEmpty!29959 mapRes!29959))

(declare-fun b!909081 () Bool)

(declare-fun e!509524 () Bool)

(assert (=> b!909081 (= e!509524 (and e!509522 mapRes!29959))))

(declare-fun condMapEmpty!29959 () Bool)

(declare-fun mapDefault!29959 () ValueCell!8933)

