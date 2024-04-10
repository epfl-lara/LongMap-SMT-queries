; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38356 () Bool)

(assert start!38356)

(declare-fun b!395590 () Bool)

(declare-fun res!226802 () Bool)

(declare-fun e!239494 () Bool)

(assert (=> b!395590 (=> (not res!226802) (not e!239494))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395590 (= res!226802 (validKeyInArray!0 k!794))))

(declare-fun b!395591 () Bool)

(declare-fun res!226807 () Bool)

(assert (=> b!395591 (=> (not res!226807) (not e!239494))))

(declare-datatypes ((array!23553 0))(
  ( (array!23554 (arr!11229 (Array (_ BitVec 32) (_ BitVec 64))) (size!11581 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23553)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23553 (_ BitVec 32)) Bool)

(assert (=> b!395591 (= res!226807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395592 () Bool)

(declare-fun e!239496 () Bool)

(declare-fun e!239497 () Bool)

(declare-fun mapRes!16347 () Bool)

(assert (=> b!395592 (= e!239496 (and e!239497 mapRes!16347))))

(declare-fun condMapEmpty!16347 () Bool)

(declare-datatypes ((V!14203 0))(
  ( (V!14204 (val!4956 Int)) )
))
(declare-datatypes ((ValueCell!4568 0))(
  ( (ValueCellFull!4568 (v!7202 V!14203)) (EmptyCell!4568) )
))
(declare-datatypes ((array!23555 0))(
  ( (array!23556 (arr!11230 (Array (_ BitVec 32) ValueCell!4568)) (size!11582 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23555)

(declare-fun mapDefault!16347 () ValueCell!4568)

