; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78138 () Bool)

(assert start!78138)

(declare-fun b_free!16649 () Bool)

(declare-fun b_next!16649 () Bool)

(assert (=> start!78138 (= b_free!16649 (not b_next!16649))))

(declare-fun tp!58220 () Bool)

(declare-fun b_and!27223 () Bool)

(assert (=> start!78138 (= tp!58220 b_and!27223)))

(declare-fun mapIsEmpty!30325 () Bool)

(declare-fun mapRes!30325 () Bool)

(assert (=> mapIsEmpty!30325 mapRes!30325))

(declare-fun b!911956 () Bool)

(declare-fun e!511526 () Bool)

(assert (=> b!911956 (= e!511526 false)))

(declare-datatypes ((V!30387 0))(
  ( (V!30388 (val!9584 Int)) )
))
(declare-datatypes ((ValueCell!9052 0))(
  ( (ValueCellFull!9052 (v!12094 V!30387)) (EmptyCell!9052) )
))
(declare-datatypes ((array!54134 0))(
  ( (array!54135 (arr!26022 (Array (_ BitVec 32) ValueCell!9052)) (size!26481 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54134)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30387)

(declare-datatypes ((array!54136 0))(
  ( (array!54137 (arr!26023 (Array (_ BitVec 32) (_ BitVec 64))) (size!26482 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54136)

(declare-fun lt!410534 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30387)

(declare-datatypes ((tuple2!12486 0))(
  ( (tuple2!12487 (_1!6254 (_ BitVec 64)) (_2!6254 V!30387)) )
))
(declare-datatypes ((List!18277 0))(
  ( (Nil!18274) (Cons!18273 (h!19419 tuple2!12486) (t!25864 List!18277)) )
))
(declare-datatypes ((ListLongMap!11183 0))(
  ( (ListLongMap!11184 (toList!5607 List!18277)) )
))
(declare-fun contains!4652 (ListLongMap!11183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2869 (array!54136 array!54134 (_ BitVec 32) (_ BitVec 32) V!30387 V!30387 (_ BitVec 32) Int) ListLongMap!11183)

(assert (=> b!911956 (= lt!410534 (contains!4652 (getCurrentListMap!2869 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911957 () Bool)

(declare-fun res!615219 () Bool)

(assert (=> b!911957 (=> (not res!615219) (not e!511526))))

(assert (=> b!911957 (= res!615219 (and (= (size!26481 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26482 _keys!1386) (size!26481 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911958 () Bool)

(declare-fun res!615220 () Bool)

(assert (=> b!911958 (=> (not res!615220) (not e!511526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54136 (_ BitVec 32)) Bool)

(assert (=> b!911958 (= res!615220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30325 () Bool)

(declare-fun tp!58221 () Bool)

(declare-fun e!511527 () Bool)

(assert (=> mapNonEmpty!30325 (= mapRes!30325 (and tp!58221 e!511527))))

(declare-fun mapKey!30325 () (_ BitVec 32))

(declare-fun mapValue!30325 () ValueCell!9052)

(declare-fun mapRest!30325 () (Array (_ BitVec 32) ValueCell!9052))

(assert (=> mapNonEmpty!30325 (= (arr!26022 _values!1152) (store mapRest!30325 mapKey!30325 mapValue!30325))))

(declare-fun b!911959 () Bool)

(declare-fun res!615221 () Bool)

(assert (=> b!911959 (=> (not res!615221) (not e!511526))))

(declare-datatypes ((List!18278 0))(
  ( (Nil!18275) (Cons!18274 (h!19420 (_ BitVec 64)) (t!25865 List!18278)) )
))
(declare-fun arrayNoDuplicates!0 (array!54136 (_ BitVec 32) List!18278) Bool)

(assert (=> b!911959 (= res!615221 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18275))))

(declare-fun b!911960 () Bool)

(declare-fun e!511525 () Bool)

(declare-fun e!511523 () Bool)

(assert (=> b!911960 (= e!511525 (and e!511523 mapRes!30325))))

(declare-fun condMapEmpty!30325 () Bool)

(declare-fun mapDefault!30325 () ValueCell!9052)

