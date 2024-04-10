; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38848 () Bool)

(assert start!38848)

(declare-fun mapIsEmpty!17022 () Bool)

(declare-fun mapRes!17022 () Bool)

(assert (=> mapIsEmpty!17022 mapRes!17022))

(declare-fun b!405728 () Bool)

(declare-fun res!234237 () Bool)

(declare-fun e!243907 () Bool)

(assert (=> b!405728 (=> (not res!234237) (not e!243907))))

(declare-datatypes ((array!24425 0))(
  ( (array!24426 (arr!11662 (Array (_ BitVec 32) (_ BitVec 64))) (size!12014 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24425)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405728 (= res!234237 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405729 () Bool)

(declare-fun e!243910 () Bool)

(declare-fun tp_is_empty!10267 () Bool)

(assert (=> b!405729 (= e!243910 tp_is_empty!10267)))

(declare-fun b!405730 () Bool)

(declare-fun e!243911 () Bool)

(assert (=> b!405730 (= e!243911 (and e!243910 mapRes!17022))))

(declare-fun condMapEmpty!17022 () Bool)

(declare-datatypes ((V!14795 0))(
  ( (V!14796 (val!5178 Int)) )
))
(declare-datatypes ((ValueCell!4790 0))(
  ( (ValueCellFull!4790 (v!7425 V!14795)) (EmptyCell!4790) )
))
(declare-datatypes ((array!24427 0))(
  ( (array!24428 (arr!11663 (Array (_ BitVec 32) ValueCell!4790)) (size!12015 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24427)

(declare-fun mapDefault!17022 () ValueCell!4790)

