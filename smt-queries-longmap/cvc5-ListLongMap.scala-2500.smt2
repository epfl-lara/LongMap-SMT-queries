; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38818 () Bool)

(assert start!38818)

(declare-fun b!405143 () Bool)

(declare-fun res!233778 () Bool)

(declare-fun e!243638 () Bool)

(assert (=> b!405143 (=> (not res!233778) (not e!243638))))

(declare-datatypes ((array!24367 0))(
  ( (array!24368 (arr!11633 (Array (_ BitVec 32) (_ BitVec 64))) (size!11985 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24367)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405143 (= res!233778 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16977 () Bool)

(declare-fun mapRes!16977 () Bool)

(assert (=> mapIsEmpty!16977 mapRes!16977))

(declare-fun b!405144 () Bool)

(declare-fun res!233783 () Bool)

(assert (=> b!405144 (=> (not res!233783) (not e!243638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405144 (= res!233783 (validKeyInArray!0 k!794))))

(declare-fun b!405145 () Bool)

(declare-fun e!243639 () Bool)

(declare-fun e!243642 () Bool)

(assert (=> b!405145 (= e!243639 (and e!243642 mapRes!16977))))

(declare-fun condMapEmpty!16977 () Bool)

(declare-datatypes ((V!14755 0))(
  ( (V!14756 (val!5163 Int)) )
))
(declare-datatypes ((ValueCell!4775 0))(
  ( (ValueCellFull!4775 (v!7410 V!14755)) (EmptyCell!4775) )
))
(declare-datatypes ((array!24369 0))(
  ( (array!24370 (arr!11634 (Array (_ BitVec 32) ValueCell!4775)) (size!11986 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24369)

(declare-fun mapDefault!16977 () ValueCell!4775)

