; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38750 () Bool)

(assert start!38750)

(declare-fun b_free!9287 () Bool)

(declare-fun b_next!9287 () Bool)

(assert (=> start!38750 (= b_free!9287 (not b_next!9287))))

(declare-fun tp!32985 () Bool)

(declare-fun b_and!16673 () Bool)

(assert (=> start!38750 (= tp!32985 b_and!16673)))

(declare-fun b!403777 () Bool)

(declare-fun e!243020 () Bool)

(declare-fun e!243017 () Bool)

(declare-fun mapRes!16875 () Bool)

(assert (=> b!403777 (= e!243020 (and e!243017 mapRes!16875))))

(declare-fun condMapEmpty!16875 () Bool)

(declare-datatypes ((V!14663 0))(
  ( (V!14664 (val!5129 Int)) )
))
(declare-datatypes ((ValueCell!4741 0))(
  ( (ValueCellFull!4741 (v!7376 V!14663)) (EmptyCell!4741) )
))
(declare-datatypes ((array!24237 0))(
  ( (array!24238 (arr!11568 (Array (_ BitVec 32) ValueCell!4741)) (size!11920 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24237)

(declare-fun mapDefault!16875 () ValueCell!4741)

