; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78068 () Bool)

(assert start!78068)

(declare-fun b_free!16595 () Bool)

(declare-fun b_next!16595 () Bool)

(assert (=> start!78068 (= b_free!16595 (not b_next!16595))))

(declare-fun tp!58056 () Bool)

(declare-fun b_and!27167 () Bool)

(assert (=> start!78068 (= tp!58056 b_and!27167)))

(declare-fun b!911262 () Bool)

(declare-fun e!511049 () Bool)

(declare-fun tp_is_empty!19013 () Bool)

(assert (=> b!911262 (= e!511049 tp_is_empty!19013)))

(declare-fun b!911263 () Bool)

(declare-fun res!614833 () Bool)

(declare-fun e!511047 () Bool)

(assert (=> b!911263 (=> (not res!614833) (not e!511047))))

(declare-datatypes ((array!54028 0))(
  ( (array!54029 (arr!25970 (Array (_ BitVec 32) (_ BitVec 64))) (size!26429 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54028)

(declare-datatypes ((List!18242 0))(
  ( (Nil!18239) (Cons!18238 (h!19384 (_ BitVec 64)) (t!25827 List!18242)) )
))
(declare-fun arrayNoDuplicates!0 (array!54028 (_ BitVec 32) List!18242) Bool)

(assert (=> b!911263 (= res!614833 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18239))))

(declare-fun mapIsEmpty!30241 () Bool)

(declare-fun mapRes!30241 () Bool)

(assert (=> mapIsEmpty!30241 mapRes!30241))

(declare-fun b!911264 () Bool)

(declare-fun e!511050 () Bool)

(assert (=> b!911264 (= e!511050 tp_is_empty!19013)))

(declare-fun mapNonEmpty!30241 () Bool)

(declare-fun tp!58055 () Bool)

(assert (=> mapNonEmpty!30241 (= mapRes!30241 (and tp!58055 e!511050))))

(declare-datatypes ((V!30315 0))(
  ( (V!30316 (val!9557 Int)) )
))
(declare-datatypes ((ValueCell!9025 0))(
  ( (ValueCellFull!9025 (v!12066 V!30315)) (EmptyCell!9025) )
))
(declare-datatypes ((array!54030 0))(
  ( (array!54031 (arr!25971 (Array (_ BitVec 32) ValueCell!9025)) (size!26430 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54030)

(declare-fun mapRest!30241 () (Array (_ BitVec 32) ValueCell!9025))

(declare-fun mapKey!30241 () (_ BitVec 32))

(declare-fun mapValue!30241 () ValueCell!9025)

(assert (=> mapNonEmpty!30241 (= (arr!25971 _values!1152) (store mapRest!30241 mapKey!30241 mapValue!30241))))

(declare-fun res!614835 () Bool)

(assert (=> start!78068 (=> (not res!614835) (not e!511047))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78068 (= res!614835 (validMask!0 mask!1756))))

(assert (=> start!78068 e!511047))

(declare-fun e!511046 () Bool)

(declare-fun array_inv!20302 (array!54030) Bool)

(assert (=> start!78068 (and (array_inv!20302 _values!1152) e!511046)))

(assert (=> start!78068 tp!58056))

(assert (=> start!78068 true))

(assert (=> start!78068 tp_is_empty!19013))

(declare-fun array_inv!20303 (array!54028) Bool)

(assert (=> start!78068 (array_inv!20303 _keys!1386)))

(declare-fun b!911265 () Bool)

(declare-fun res!614832 () Bool)

(assert (=> b!911265 (=> (not res!614832) (not e!511047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54028 (_ BitVec 32)) Bool)

(assert (=> b!911265 (= res!614832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911266 () Bool)

(declare-fun res!614834 () Bool)

(assert (=> b!911266 (=> (not res!614834) (not e!511047))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911266 (= res!614834 (and (= (size!26430 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26429 _keys!1386) (size!26430 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911267 () Bool)

(assert (=> b!911267 (= e!511046 (and e!511049 mapRes!30241))))

(declare-fun condMapEmpty!30241 () Bool)

(declare-fun mapDefault!30241 () ValueCell!9025)

