; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38414 () Bool)

(assert start!38414)

(declare-fun b!396258 () Bool)

(declare-fun res!227310 () Bool)

(declare-fun e!239792 () Bool)

(assert (=> b!396258 (=> (not res!227310) (not e!239792))))

(declare-datatypes ((array!23613 0))(
  ( (array!23614 (arr!11257 (Array (_ BitVec 32) (_ BitVec 64))) (size!11609 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23613)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23613 (_ BitVec 32)) Bool)

(assert (=> b!396258 (= res!227310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396259 () Bool)

(declare-fun e!239789 () Bool)

(declare-fun e!239794 () Bool)

(declare-fun mapRes!16395 () Bool)

(assert (=> b!396259 (= e!239789 (and e!239794 mapRes!16395))))

(declare-fun condMapEmpty!16395 () Bool)

(declare-datatypes ((V!14239 0))(
  ( (V!14240 (val!4970 Int)) )
))
(declare-datatypes ((ValueCell!4582 0))(
  ( (ValueCellFull!4582 (v!7216 V!14239)) (EmptyCell!4582) )
))
(declare-datatypes ((array!23615 0))(
  ( (array!23616 (arr!11258 (Array (_ BitVec 32) ValueCell!4582)) (size!11610 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23615)

(declare-fun mapDefault!16395 () ValueCell!4582)

