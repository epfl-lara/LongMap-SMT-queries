; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78132 () Bool)

(assert start!78132)

(declare-fun b_free!16643 () Bool)

(declare-fun b_next!16643 () Bool)

(assert (=> start!78132 (= b_free!16643 (not b_next!16643))))

(declare-fun tp!58203 () Bool)

(declare-fun b_and!27217 () Bool)

(assert (=> start!78132 (= tp!58203 b_and!27217)))

(declare-fun b!911894 () Bool)

(declare-fun res!615185 () Bool)

(declare-fun e!511482 () Bool)

(assert (=> b!911894 (=> (not res!615185) (not e!511482))))

(declare-datatypes ((array!54122 0))(
  ( (array!54123 (arr!26016 (Array (_ BitVec 32) (_ BitVec 64))) (size!26475 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54122)

(declare-datatypes ((List!18273 0))(
  ( (Nil!18270) (Cons!18269 (h!19415 (_ BitVec 64)) (t!25860 List!18273)) )
))
(declare-fun arrayNoDuplicates!0 (array!54122 (_ BitVec 32) List!18273) Bool)

(assert (=> b!911894 (= res!615185 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18270))))

(declare-fun mapNonEmpty!30316 () Bool)

(declare-fun mapRes!30316 () Bool)

(declare-fun tp!58202 () Bool)

(declare-fun e!511478 () Bool)

(assert (=> mapNonEmpty!30316 (= mapRes!30316 (and tp!58202 e!511478))))

(declare-datatypes ((V!30379 0))(
  ( (V!30380 (val!9581 Int)) )
))
(declare-datatypes ((ValueCell!9049 0))(
  ( (ValueCellFull!9049 (v!12091 V!30379)) (EmptyCell!9049) )
))
(declare-datatypes ((array!54124 0))(
  ( (array!54125 (arr!26017 (Array (_ BitVec 32) ValueCell!9049)) (size!26476 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54124)

(declare-fun mapValue!30316 () ValueCell!9049)

(declare-fun mapRest!30316 () (Array (_ BitVec 32) ValueCell!9049))

(declare-fun mapKey!30316 () (_ BitVec 32))

(assert (=> mapNonEmpty!30316 (= (arr!26017 _values!1152) (store mapRest!30316 mapKey!30316 mapValue!30316))))

(declare-fun mapIsEmpty!30316 () Bool)

(assert (=> mapIsEmpty!30316 mapRes!30316))

(declare-fun b!911895 () Bool)

(declare-fun e!511479 () Bool)

(declare-fun e!511481 () Bool)

(assert (=> b!911895 (= e!511479 (and e!511481 mapRes!30316))))

(declare-fun condMapEmpty!30316 () Bool)

(declare-fun mapDefault!30316 () ValueCell!9049)

