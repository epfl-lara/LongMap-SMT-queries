; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78040 () Bool)

(assert start!78040)

(declare-fun b_free!16567 () Bool)

(declare-fun b_next!16567 () Bool)

(assert (=> start!78040 (= b_free!16567 (not b_next!16567))))

(declare-fun tp!57971 () Bool)

(declare-fun b_and!27139 () Bool)

(assert (=> start!78040 (= tp!57971 b_and!27139)))

(declare-fun res!614664 () Bool)

(declare-fun e!510837 () Bool)

(assert (=> start!78040 (=> (not res!614664) (not e!510837))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78040 (= res!614664 (validMask!0 mask!1756))))

(assert (=> start!78040 e!510837))

(declare-datatypes ((V!30279 0))(
  ( (V!30280 (val!9543 Int)) )
))
(declare-datatypes ((ValueCell!9011 0))(
  ( (ValueCellFull!9011 (v!12052 V!30279)) (EmptyCell!9011) )
))
(declare-datatypes ((array!53976 0))(
  ( (array!53977 (arr!25944 (Array (_ BitVec 32) ValueCell!9011)) (size!26403 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53976)

(declare-fun e!510839 () Bool)

(declare-fun array_inv!20282 (array!53976) Bool)

(assert (=> start!78040 (and (array_inv!20282 _values!1152) e!510839)))

(assert (=> start!78040 tp!57971))

(assert (=> start!78040 true))

(declare-fun tp_is_empty!18985 () Bool)

(assert (=> start!78040 tp_is_empty!18985))

(declare-datatypes ((array!53978 0))(
  ( (array!53979 (arr!25945 (Array (_ BitVec 32) (_ BitVec 64))) (size!26404 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53978)

(declare-fun array_inv!20283 (array!53978) Bool)

(assert (=> start!78040 (array_inv!20283 _keys!1386)))

(declare-fun b!910968 () Bool)

(declare-fun res!614665 () Bool)

(assert (=> b!910968 (=> (not res!614665) (not e!510837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53978 (_ BitVec 32)) Bool)

(assert (=> b!910968 (= res!614665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910969 () Bool)

(declare-fun e!510840 () Bool)

(declare-fun mapRes!30199 () Bool)

(assert (=> b!910969 (= e!510839 (and e!510840 mapRes!30199))))

(declare-fun condMapEmpty!30199 () Bool)

(declare-fun mapDefault!30199 () ValueCell!9011)

