; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38362 () Bool)

(assert start!38362)

(declare-fun b!395700 () Bool)

(declare-fun res!226892 () Bool)

(declare-fun e!239542 () Bool)

(assert (=> b!395700 (=> (not res!226892) (not e!239542))))

(declare-datatypes ((array!23565 0))(
  ( (array!23566 (arr!11235 (Array (_ BitVec 32) (_ BitVec 64))) (size!11587 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23565)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23565 (_ BitVec 32)) Bool)

(assert (=> b!395700 (= res!226892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23566 (store (arr!11235 _keys!709) i!563 k!794) (size!11587 _keys!709)) mask!1025))))

(declare-fun b!395701 () Bool)

(declare-fun e!239539 () Bool)

(declare-fun e!239538 () Bool)

(declare-fun mapRes!16356 () Bool)

(assert (=> b!395701 (= e!239539 (and e!239538 mapRes!16356))))

(declare-fun condMapEmpty!16356 () Bool)

(declare-datatypes ((V!14211 0))(
  ( (V!14212 (val!4959 Int)) )
))
(declare-datatypes ((ValueCell!4571 0))(
  ( (ValueCellFull!4571 (v!7205 V!14211)) (EmptyCell!4571) )
))
(declare-datatypes ((array!23567 0))(
  ( (array!23568 (arr!11236 (Array (_ BitVec 32) ValueCell!4571)) (size!11588 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23567)

(declare-fun mapDefault!16356 () ValueCell!4571)

