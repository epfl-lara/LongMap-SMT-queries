; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38936 () Bool)

(assert start!38936)

(declare-fun b!407444 () Bool)

(declare-fun e!244699 () Bool)

(declare-fun e!244701 () Bool)

(assert (=> b!407444 (= e!244699 e!244701)))

(declare-fun res!235550 () Bool)

(assert (=> b!407444 (=> (not res!235550) (not e!244701))))

(declare-datatypes ((array!24591 0))(
  ( (array!24592 (arr!11745 (Array (_ BitVec 32) (_ BitVec 64))) (size!12097 (_ BitVec 32))) )
))
(declare-fun lt!188645 () array!24591)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24591 (_ BitVec 32)) Bool)

(assert (=> b!407444 (= res!235550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188645 mask!1025))))

(declare-fun _keys!709 () array!24591)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407444 (= lt!188645 (array!24592 (store (arr!11745 _keys!709) i!563 k!794) (size!12097 _keys!709)))))

(declare-fun b!407445 () Bool)

(declare-fun e!244702 () Bool)

(declare-fun tp_is_empty!10355 () Bool)

(assert (=> b!407445 (= e!244702 tp_is_empty!10355)))

(declare-fun mapIsEmpty!17154 () Bool)

(declare-fun mapRes!17154 () Bool)

(assert (=> mapIsEmpty!17154 mapRes!17154))

(declare-fun b!407446 () Bool)

(declare-fun e!244704 () Bool)

(declare-fun e!244700 () Bool)

(assert (=> b!407446 (= e!244704 (and e!244700 mapRes!17154))))

(declare-fun condMapEmpty!17154 () Bool)

(declare-datatypes ((V!14911 0))(
  ( (V!14912 (val!5222 Int)) )
))
(declare-datatypes ((ValueCell!4834 0))(
  ( (ValueCellFull!4834 (v!7469 V!14911)) (EmptyCell!4834) )
))
(declare-datatypes ((array!24593 0))(
  ( (array!24594 (arr!11746 (Array (_ BitVec 32) ValueCell!4834)) (size!12098 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24593)

(declare-fun mapDefault!17154 () ValueCell!4834)

