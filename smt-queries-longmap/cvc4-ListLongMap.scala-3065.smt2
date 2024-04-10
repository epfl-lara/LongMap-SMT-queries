; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43236 () Bool)

(assert start!43236)

(declare-fun b!479118 () Bool)

(declare-fun res!285811 () Bool)

(declare-fun e!281838 () Bool)

(assert (=> b!479118 (=> (not res!285811) (not e!281838))))

(declare-datatypes ((array!30923 0))(
  ( (array!30924 (arr!14869 (Array (_ BitVec 32) (_ BitVec 64))) (size!15227 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30923)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30923 (_ BitVec 32)) Bool)

(assert (=> b!479118 (= res!285811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22132 () Bool)

(declare-fun mapRes!22132 () Bool)

(assert (=> mapIsEmpty!22132 mapRes!22132))

(declare-fun mapNonEmpty!22132 () Bool)

(declare-fun tp!42607 () Bool)

(declare-fun e!281834 () Bool)

(assert (=> mapNonEmpty!22132 (= mapRes!22132 (and tp!42607 e!281834))))

(declare-datatypes ((V!19237 0))(
  ( (V!19238 (val!6860 Int)) )
))
(declare-datatypes ((ValueCell!6451 0))(
  ( (ValueCellFull!6451 (v!9149 V!19237)) (EmptyCell!6451) )
))
(declare-fun mapValue!22132 () ValueCell!6451)

(declare-fun mapRest!22132 () (Array (_ BitVec 32) ValueCell!6451))

(declare-fun mapKey!22132 () (_ BitVec 32))

(declare-datatypes ((array!30925 0))(
  ( (array!30926 (arr!14870 (Array (_ BitVec 32) ValueCell!6451)) (size!15228 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30925)

(assert (=> mapNonEmpty!22132 (= (arr!14870 _values!1516) (store mapRest!22132 mapKey!22132 mapValue!22132))))

(declare-fun b!479119 () Bool)

(declare-fun e!281835 () Bool)

(declare-fun e!281836 () Bool)

(assert (=> b!479119 (= e!281835 (and e!281836 mapRes!22132))))

(declare-fun condMapEmpty!22132 () Bool)

(declare-fun mapDefault!22132 () ValueCell!6451)

