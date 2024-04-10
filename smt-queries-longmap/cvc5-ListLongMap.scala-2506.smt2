; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38854 () Bool)

(assert start!38854)

(declare-fun mapIsEmpty!17031 () Bool)

(declare-fun mapRes!17031 () Bool)

(assert (=> mapIsEmpty!17031 mapRes!17031))

(declare-fun b!405845 () Bool)

(declare-fun res!234319 () Bool)

(declare-fun e!243961 () Bool)

(assert (=> b!405845 (=> (not res!234319) (not e!243961))))

(declare-datatypes ((array!24437 0))(
  ( (array!24438 (arr!11668 (Array (_ BitVec 32) (_ BitVec 64))) (size!12020 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24437)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405845 (= res!234319 (or (= (select (arr!11668 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11668 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405846 () Bool)

(declare-fun e!243963 () Bool)

(assert (=> b!405846 (= e!243963 false)))

(declare-fun lt!188399 () Bool)

(declare-fun lt!188398 () array!24437)

(declare-datatypes ((List!6781 0))(
  ( (Nil!6778) (Cons!6777 (h!7633 (_ BitVec 64)) (t!11955 List!6781)) )
))
(declare-fun arrayNoDuplicates!0 (array!24437 (_ BitVec 32) List!6781) Bool)

(assert (=> b!405846 (= lt!188399 (arrayNoDuplicates!0 lt!188398 #b00000000000000000000000000000000 Nil!6778))))

(declare-fun b!405847 () Bool)

(declare-fun e!243965 () Bool)

(declare-fun e!243966 () Bool)

(assert (=> b!405847 (= e!243965 (and e!243966 mapRes!17031))))

(declare-fun condMapEmpty!17031 () Bool)

(declare-datatypes ((V!14803 0))(
  ( (V!14804 (val!5181 Int)) )
))
(declare-datatypes ((ValueCell!4793 0))(
  ( (ValueCellFull!4793 (v!7428 V!14803)) (EmptyCell!4793) )
))
(declare-datatypes ((array!24439 0))(
  ( (array!24440 (arr!11669 (Array (_ BitVec 32) ValueCell!4793)) (size!12021 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24439)

(declare-fun mapDefault!17031 () ValueCell!4793)

