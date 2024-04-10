; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20622 () Bool)

(assert start!20622)

(declare-fun b_free!5281 () Bool)

(declare-fun b_next!5281 () Bool)

(assert (=> start!20622 (= b_free!5281 (not b_next!5281))))

(declare-fun tp!18875 () Bool)

(declare-fun b_and!12027 () Bool)

(assert (=> start!20622 (= tp!18875 b_and!12027)))

(declare-fun b!205704 () Bool)

(declare-fun res!99461 () Bool)

(declare-fun e!134502 () Bool)

(assert (=> b!205704 (=> (not res!99461) (not e!134502))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205704 (= res!99461 (validKeyInArray!0 k!843))))

(declare-fun b!205705 () Bool)

(declare-fun e!134503 () Bool)

(declare-fun e!134504 () Bool)

(declare-fun mapRes!8774 () Bool)

(assert (=> b!205705 (= e!134503 (and e!134504 mapRes!8774))))

(declare-fun condMapEmpty!8774 () Bool)

(declare-datatypes ((V!6497 0))(
  ( (V!6498 (val!2613 Int)) )
))
(declare-datatypes ((ValueCell!2225 0))(
  ( (ValueCellFull!2225 (v!4583 V!6497)) (EmptyCell!2225) )
))
(declare-datatypes ((array!9487 0))(
  ( (array!9488 (arr!4494 (Array (_ BitVec 32) ValueCell!2225)) (size!4819 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9487)

(declare-fun mapDefault!8774 () ValueCell!2225)

