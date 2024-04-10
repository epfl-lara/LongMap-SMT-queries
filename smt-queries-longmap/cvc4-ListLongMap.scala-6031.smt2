; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78074 () Bool)

(assert start!78074)

(declare-fun b_free!16601 () Bool)

(declare-fun b_next!16601 () Bool)

(assert (=> start!78074 (= b_free!16601 (not b_next!16601))))

(declare-fun tp!58073 () Bool)

(declare-fun b_and!27173 () Bool)

(assert (=> start!78074 (= tp!58073 b_and!27173)))

(declare-fun b!911325 () Bool)

(declare-fun res!614870 () Bool)

(declare-fun e!511093 () Bool)

(assert (=> b!911325 (=> (not res!614870) (not e!511093))))

(declare-datatypes ((array!54038 0))(
  ( (array!54039 (arr!25975 (Array (_ BitVec 32) (_ BitVec 64))) (size!26434 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54038)

(declare-datatypes ((List!18245 0))(
  ( (Nil!18242) (Cons!18241 (h!19387 (_ BitVec 64)) (t!25830 List!18245)) )
))
(declare-fun arrayNoDuplicates!0 (array!54038 (_ BitVec 32) List!18245) Bool)

(assert (=> b!911325 (= res!614870 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18242))))

(declare-fun b!911326 () Bool)

(declare-fun res!614868 () Bool)

(assert (=> b!911326 (=> (not res!614868) (not e!511093))))

(declare-datatypes ((V!30323 0))(
  ( (V!30324 (val!9560 Int)) )
))
(declare-datatypes ((ValueCell!9028 0))(
  ( (ValueCellFull!9028 (v!12069 V!30323)) (EmptyCell!9028) )
))
(declare-datatypes ((array!54040 0))(
  ( (array!54041 (arr!25976 (Array (_ BitVec 32) ValueCell!9028)) (size!26435 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54040)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!911326 (= res!614868 (and (= (size!26435 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26434 _keys!1386) (size!26435 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911327 () Bool)

(declare-fun res!614869 () Bool)

(assert (=> b!911327 (=> (not res!614869) (not e!511093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54038 (_ BitVec 32)) Bool)

(assert (=> b!911327 (= res!614869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30250 () Bool)

(declare-fun mapRes!30250 () Bool)

(declare-fun tp!58074 () Bool)

(declare-fun e!511094 () Bool)

(assert (=> mapNonEmpty!30250 (= mapRes!30250 (and tp!58074 e!511094))))

(declare-fun mapValue!30250 () ValueCell!9028)

(declare-fun mapRest!30250 () (Array (_ BitVec 32) ValueCell!9028))

(declare-fun mapKey!30250 () (_ BitVec 32))

(assert (=> mapNonEmpty!30250 (= (arr!25976 _values!1152) (store mapRest!30250 mapKey!30250 mapValue!30250))))

(declare-fun b!911329 () Bool)

(declare-fun e!511092 () Bool)

(declare-fun e!511091 () Bool)

(assert (=> b!911329 (= e!511092 (and e!511091 mapRes!30250))))

(declare-fun condMapEmpty!30250 () Bool)

(declare-fun mapDefault!30250 () ValueCell!9028)

