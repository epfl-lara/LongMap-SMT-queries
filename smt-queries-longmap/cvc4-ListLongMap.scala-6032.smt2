; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78080 () Bool)

(assert start!78080)

(declare-fun b_free!16607 () Bool)

(declare-fun b_next!16607 () Bool)

(assert (=> start!78080 (= b_free!16607 (not b_next!16607))))

(declare-fun tp!58091 () Bool)

(declare-fun b_and!27179 () Bool)

(assert (=> start!78080 (= tp!58091 b_and!27179)))

(declare-fun mapNonEmpty!30259 () Bool)

(declare-fun mapRes!30259 () Bool)

(declare-fun tp!58092 () Bool)

(declare-fun e!511137 () Bool)

(assert (=> mapNonEmpty!30259 (= mapRes!30259 (and tp!58092 e!511137))))

(declare-datatypes ((V!30331 0))(
  ( (V!30332 (val!9563 Int)) )
))
(declare-datatypes ((ValueCell!9031 0))(
  ( (ValueCellFull!9031 (v!12072 V!30331)) (EmptyCell!9031) )
))
(declare-datatypes ((array!54050 0))(
  ( (array!54051 (arr!25981 (Array (_ BitVec 32) ValueCell!9031)) (size!26440 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54050)

(declare-fun mapRest!30259 () (Array (_ BitVec 32) ValueCell!9031))

(declare-fun mapKey!30259 () (_ BitVec 32))

(declare-fun mapValue!30259 () ValueCell!9031)

(assert (=> mapNonEmpty!30259 (= (arr!25981 _values!1152) (store mapRest!30259 mapKey!30259 mapValue!30259))))

(declare-fun b!911388 () Bool)

(declare-fun res!614905 () Bool)

(declare-fun e!511140 () Bool)

(assert (=> b!911388 (=> (not res!614905) (not e!511140))))

(declare-datatypes ((array!54052 0))(
  ( (array!54053 (arr!25982 (Array (_ BitVec 32) (_ BitVec 64))) (size!26441 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54052)

(declare-datatypes ((List!18250 0))(
  ( (Nil!18247) (Cons!18246 (h!19392 (_ BitVec 64)) (t!25835 List!18250)) )
))
(declare-fun arrayNoDuplicates!0 (array!54052 (_ BitVec 32) List!18250) Bool)

(assert (=> b!911388 (= res!614905 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18247))))

(declare-fun b!911389 () Bool)

(declare-fun e!511138 () Bool)

(declare-fun e!511139 () Bool)

(assert (=> b!911389 (= e!511138 (and e!511139 mapRes!30259))))

(declare-fun condMapEmpty!30259 () Bool)

(declare-fun mapDefault!30259 () ValueCell!9031)

