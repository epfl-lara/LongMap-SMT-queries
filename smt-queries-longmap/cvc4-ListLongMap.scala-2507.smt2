; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38864 () Bool)

(assert start!38864)

(declare-fun b!406040 () Bool)

(declare-fun e!244051 () Bool)

(declare-fun e!244052 () Bool)

(assert (=> b!406040 (= e!244051 e!244052)))

(declare-fun res!234477 () Bool)

(assert (=> b!406040 (=> (not res!234477) (not e!244052))))

(declare-datatypes ((array!24457 0))(
  ( (array!24458 (arr!11678 (Array (_ BitVec 32) (_ BitVec 64))) (size!12030 (_ BitVec 32))) )
))
(declare-fun lt!188429 () array!24457)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24457 (_ BitVec 32)) Bool)

(assert (=> b!406040 (= res!234477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188429 mask!1025))))

(declare-fun _keys!709 () array!24457)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406040 (= lt!188429 (array!24458 (store (arr!11678 _keys!709) i!563 k!794) (size!12030 _keys!709)))))

(declare-fun b!406041 () Bool)

(declare-fun res!234475 () Bool)

(assert (=> b!406041 (=> (not res!234475) (not e!244051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406041 (= res!234475 (validMask!0 mask!1025))))

(declare-fun b!406042 () Bool)

(declare-fun e!244056 () Bool)

(declare-fun tp_is_empty!10283 () Bool)

(assert (=> b!406042 (= e!244056 tp_is_empty!10283)))

(declare-fun b!406043 () Bool)

(declare-fun res!234472 () Bool)

(assert (=> b!406043 (=> (not res!234472) (not e!244051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406043 (= res!234472 (validKeyInArray!0 k!794))))

(declare-fun b!406044 () Bool)

(declare-fun e!244055 () Bool)

(declare-fun e!244054 () Bool)

(declare-fun mapRes!17046 () Bool)

(assert (=> b!406044 (= e!244055 (and e!244054 mapRes!17046))))

(declare-fun condMapEmpty!17046 () Bool)

(declare-datatypes ((V!14815 0))(
  ( (V!14816 (val!5186 Int)) )
))
(declare-datatypes ((ValueCell!4798 0))(
  ( (ValueCellFull!4798 (v!7433 V!14815)) (EmptyCell!4798) )
))
(declare-datatypes ((array!24459 0))(
  ( (array!24460 (arr!11679 (Array (_ BitVec 32) ValueCell!4798)) (size!12031 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24459)

(declare-fun mapDefault!17046 () ValueCell!4798)

