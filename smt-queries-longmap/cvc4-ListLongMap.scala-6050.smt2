; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78224 () Bool)

(assert start!78224)

(declare-fun b_free!16715 () Bool)

(declare-fun b_next!16715 () Bool)

(assert (=> start!78224 (= b_free!16715 (not b_next!16715))))

(declare-fun tp!58421 () Bool)

(declare-fun b_and!27291 () Bool)

(assert (=> start!78224 (= tp!58421 b_and!27291)))

(declare-fun res!615881 () Bool)

(declare-fun e!512102 () Bool)

(assert (=> start!78224 (=> (not res!615881) (not e!512102))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78224 (= res!615881 (validMask!0 mask!1756))))

(assert (=> start!78224 e!512102))

(declare-datatypes ((V!30475 0))(
  ( (V!30476 (val!9617 Int)) )
))
(declare-datatypes ((ValueCell!9085 0))(
  ( (ValueCellFull!9085 (v!12128 V!30475)) (EmptyCell!9085) )
))
(declare-datatypes ((array!54258 0))(
  ( (array!54259 (arr!26083 (Array (_ BitVec 32) ValueCell!9085)) (size!26542 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54258)

(declare-fun e!512101 () Bool)

(declare-fun array_inv!20374 (array!54258) Bool)

(assert (=> start!78224 (and (array_inv!20374 _values!1152) e!512101)))

(assert (=> start!78224 tp!58421))

(assert (=> start!78224 true))

(declare-fun tp_is_empty!19133 () Bool)

(assert (=> start!78224 tp_is_empty!19133))

(declare-datatypes ((array!54260 0))(
  ( (array!54261 (arr!26084 (Array (_ BitVec 32) (_ BitVec 64))) (size!26543 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54260)

(declare-fun array_inv!20375 (array!54260) Bool)

(assert (=> start!78224 (array_inv!20375 _keys!1386)))

(declare-fun mapIsEmpty!30427 () Bool)

(declare-fun mapRes!30427 () Bool)

(assert (=> mapIsEmpty!30427 mapRes!30427))

(declare-fun b!912983 () Bool)

(declare-fun res!615885 () Bool)

(assert (=> b!912983 (=> (not res!615885) (not e!512102))))

(declare-datatypes ((List!18320 0))(
  ( (Nil!18317) (Cons!18316 (h!19462 (_ BitVec 64)) (t!25909 List!18320)) )
))
(declare-fun arrayNoDuplicates!0 (array!54260 (_ BitVec 32) List!18320) Bool)

(assert (=> b!912983 (= res!615885 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18317))))

(declare-fun b!912984 () Bool)

(declare-fun res!615879 () Bool)

(assert (=> b!912984 (=> (not res!615879) (not e!512102))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912984 (= res!615879 (inRange!0 i!717 mask!1756))))

(declare-fun b!912985 () Bool)

(declare-fun res!615882 () Bool)

(assert (=> b!912985 (=> (not res!615882) (not e!512102))))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912985 (= res!615882 (and (= (select (arr!26084 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912986 () Bool)

(assert (=> b!912986 (= e!512102 (not true))))

(declare-fun arrayContainsKey!0 (array!54260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912986 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30475)

(declare-datatypes ((Unit!30904 0))(
  ( (Unit!30905) )
))
(declare-fun lt!410723 () Unit!30904)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30475)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaKeyInListMapIsInArray!277 (array!54260 array!54258 (_ BitVec 32) (_ BitVec 32) V!30475 V!30475 (_ BitVec 64) Int) Unit!30904)

(assert (=> b!912986 (= lt!410723 (lemmaKeyInListMapIsInArray!277 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912987 () Bool)

(declare-fun e!512100 () Bool)

(assert (=> b!912987 (= e!512100 tp_is_empty!19133)))

(declare-fun b!912988 () Bool)

(declare-fun res!615884 () Bool)

(assert (=> b!912988 (=> (not res!615884) (not e!512102))))

(assert (=> b!912988 (= res!615884 (and (= (size!26542 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26543 _keys!1386) (size!26542 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30427 () Bool)

(declare-fun tp!58422 () Bool)

(assert (=> mapNonEmpty!30427 (= mapRes!30427 (and tp!58422 e!512100))))

(declare-fun mapValue!30427 () ValueCell!9085)

(declare-fun mapKey!30427 () (_ BitVec 32))

(declare-fun mapRest!30427 () (Array (_ BitVec 32) ValueCell!9085))

(assert (=> mapNonEmpty!30427 (= (arr!26083 _values!1152) (store mapRest!30427 mapKey!30427 mapValue!30427))))

(declare-fun b!912989 () Bool)

(declare-fun res!615883 () Bool)

(assert (=> b!912989 (=> (not res!615883) (not e!512102))))

(declare-datatypes ((tuple2!12532 0))(
  ( (tuple2!12533 (_1!6277 (_ BitVec 64)) (_2!6277 V!30475)) )
))
(declare-datatypes ((List!18321 0))(
  ( (Nil!18318) (Cons!18317 (h!19463 tuple2!12532) (t!25910 List!18321)) )
))
(declare-datatypes ((ListLongMap!11229 0))(
  ( (ListLongMap!11230 (toList!5630 List!18321)) )
))
(declare-fun contains!4676 (ListLongMap!11229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2892 (array!54260 array!54258 (_ BitVec 32) (_ BitVec 32) V!30475 V!30475 (_ BitVec 32) Int) ListLongMap!11229)

(assert (=> b!912989 (= res!615883 (contains!4676 (getCurrentListMap!2892 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!912990 () Bool)

(declare-fun res!615880 () Bool)

(assert (=> b!912990 (=> (not res!615880) (not e!512102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54260 (_ BitVec 32)) Bool)

(assert (=> b!912990 (= res!615880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912991 () Bool)

(declare-fun e!512099 () Bool)

(assert (=> b!912991 (= e!512099 tp_is_empty!19133)))

(declare-fun b!912992 () Bool)

(assert (=> b!912992 (= e!512101 (and e!512099 mapRes!30427))))

(declare-fun condMapEmpty!30427 () Bool)

(declare-fun mapDefault!30427 () ValueCell!9085)

