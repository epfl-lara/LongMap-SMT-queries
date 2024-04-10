; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38458 () Bool)

(assert start!38458)

(declare-fun b!396827 () Bool)

(declare-fun e!240075 () Bool)

(declare-fun tp_is_empty!9877 () Bool)

(assert (=> b!396827 (= e!240075 tp_is_empty!9877)))

(declare-fun b!396828 () Bool)

(declare-fun res!227737 () Bool)

(declare-fun e!240077 () Bool)

(assert (=> b!396828 (=> (not res!227737) (not e!240077))))

(declare-datatypes ((array!23667 0))(
  ( (array!23668 (arr!11283 (Array (_ BitVec 32) (_ BitVec 64))) (size!11635 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23667)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396828 (= res!227737 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396829 () Bool)

(declare-fun e!240074 () Bool)

(declare-fun mapRes!16437 () Bool)

(assert (=> b!396829 (= e!240074 (and e!240075 mapRes!16437))))

(declare-fun condMapEmpty!16437 () Bool)

(declare-datatypes ((V!14275 0))(
  ( (V!14276 (val!4983 Int)) )
))
(declare-datatypes ((ValueCell!4595 0))(
  ( (ValueCellFull!4595 (v!7230 V!14275)) (EmptyCell!4595) )
))
(declare-datatypes ((array!23669 0))(
  ( (array!23670 (arr!11284 (Array (_ BitVec 32) ValueCell!4595)) (size!11636 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23669)

(declare-fun mapDefault!16437 () ValueCell!4595)

