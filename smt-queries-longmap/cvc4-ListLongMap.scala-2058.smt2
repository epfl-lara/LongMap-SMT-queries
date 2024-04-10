; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35520 () Bool)

(assert start!35520)

(declare-fun b!355952 () Bool)

(declare-fun e!218095 () Bool)

(declare-fun e!218093 () Bool)

(declare-fun mapRes!13467 () Bool)

(assert (=> b!355952 (= e!218095 (and e!218093 mapRes!13467))))

(declare-fun condMapEmpty!13467 () Bool)

(declare-datatypes ((V!11607 0))(
  ( (V!11608 (val!4031 Int)) )
))
(declare-datatypes ((ValueCell!3643 0))(
  ( (ValueCellFull!3643 (v!6225 V!11607)) (EmptyCell!3643) )
))
(declare-datatypes ((array!19523 0))(
  ( (array!19524 (arr!9255 (Array (_ BitVec 32) ValueCell!3643)) (size!9607 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19523)

(declare-fun mapDefault!13467 () ValueCell!3643)

