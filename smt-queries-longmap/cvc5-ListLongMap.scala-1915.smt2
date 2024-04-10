; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34080 () Bool)

(assert start!34080)

(declare-fun b_free!7159 () Bool)

(declare-fun b_next!7159 () Bool)

(assert (=> start!34080 (= b_free!7159 (not b_next!7159))))

(declare-fun tp!25001 () Bool)

(declare-fun b_and!14353 () Bool)

(assert (=> start!34080 (= tp!25001 b_and!14353)))

(declare-fun res!187611 () Bool)

(declare-fun e!208377 () Bool)

(assert (=> start!34080 (=> (not res!187611) (not e!208377))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34080 (= res!187611 (validMask!0 mask!2385))))

(assert (=> start!34080 e!208377))

(assert (=> start!34080 true))

(declare-fun tp_is_empty!7111 () Bool)

(assert (=> start!34080 tp_is_empty!7111))

(assert (=> start!34080 tp!25001))

(declare-datatypes ((V!10459 0))(
  ( (V!10460 (val!3600 Int)) )
))
(declare-datatypes ((ValueCell!3212 0))(
  ( (ValueCellFull!3212 (v!5769 V!10459)) (EmptyCell!3212) )
))
(declare-datatypes ((array!17821 0))(
  ( (array!17822 (arr!8434 (Array (_ BitVec 32) ValueCell!3212)) (size!8786 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17821)

(declare-fun e!208378 () Bool)

(declare-fun array_inv!6252 (array!17821) Bool)

(assert (=> start!34080 (and (array_inv!6252 _values!1525) e!208378)))

(declare-datatypes ((array!17823 0))(
  ( (array!17824 (arr!8435 (Array (_ BitVec 32) (_ BitVec 64))) (size!8787 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17823)

(declare-fun array_inv!6253 (array!17823) Bool)

(assert (=> start!34080 (array_inv!6253 _keys!1895)))

(declare-fun b!339648 () Bool)

(declare-fun e!208376 () Bool)

(declare-fun mapRes!12084 () Bool)

(assert (=> b!339648 (= e!208378 (and e!208376 mapRes!12084))))

(declare-fun condMapEmpty!12084 () Bool)

(declare-fun mapDefault!12084 () ValueCell!3212)

