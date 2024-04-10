; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38782 () Bool)

(assert start!38782)

(declare-fun b!404441 () Bool)

(declare-fun e!243318 () Bool)

(declare-fun e!243315 () Bool)

(assert (=> b!404441 (= e!243318 e!243315)))

(declare-fun res!233247 () Bool)

(assert (=> b!404441 (=> (not res!233247) (not e!243315))))

(declare-datatypes ((array!24297 0))(
  ( (array!24298 (arr!11598 (Array (_ BitVec 32) (_ BitVec 64))) (size!11950 (_ BitVec 32))) )
))
(declare-fun lt!188183 () array!24297)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24297 (_ BitVec 32)) Bool)

(assert (=> b!404441 (= res!233247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188183 mask!1025))))

(declare-fun _keys!709 () array!24297)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404441 (= lt!188183 (array!24298 (store (arr!11598 _keys!709) i!563 k!794) (size!11950 _keys!709)))))

(declare-fun b!404442 () Bool)

(declare-fun e!243316 () Bool)

(declare-fun e!243313 () Bool)

(declare-fun mapRes!16923 () Bool)

(assert (=> b!404442 (= e!243316 (and e!243313 mapRes!16923))))

(declare-fun condMapEmpty!16923 () Bool)

(declare-datatypes ((V!14707 0))(
  ( (V!14708 (val!5145 Int)) )
))
(declare-datatypes ((ValueCell!4757 0))(
  ( (ValueCellFull!4757 (v!7392 V!14707)) (EmptyCell!4757) )
))
(declare-datatypes ((array!24299 0))(
  ( (array!24300 (arr!11599 (Array (_ BitVec 32) ValueCell!4757)) (size!11951 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24299)

(declare-fun mapDefault!16923 () ValueCell!4757)

