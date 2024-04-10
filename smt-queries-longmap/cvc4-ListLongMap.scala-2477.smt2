; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38684 () Bool)

(assert start!38684)

(declare-fun b_free!9221 () Bool)

(declare-fun b_next!9221 () Bool)

(assert (=> start!38684 (= b_free!9221 (not b_next!9221))))

(declare-fun tp!32787 () Bool)

(declare-fun b_and!16607 () Bool)

(assert (=> start!38684 (= tp!32787 b_and!16607)))

(declare-fun b!402094 () Bool)

(declare-fun e!242325 () Bool)

(declare-fun e!242322 () Bool)

(declare-fun mapRes!16776 () Bool)

(assert (=> b!402094 (= e!242325 (and e!242322 mapRes!16776))))

(declare-fun condMapEmpty!16776 () Bool)

(declare-datatypes ((V!14575 0))(
  ( (V!14576 (val!5096 Int)) )
))
(declare-datatypes ((ValueCell!4708 0))(
  ( (ValueCellFull!4708 (v!7343 V!14575)) (EmptyCell!4708) )
))
(declare-datatypes ((array!24113 0))(
  ( (array!24114 (arr!11506 (Array (_ BitVec 32) ValueCell!4708)) (size!11858 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24113)

(declare-fun mapDefault!16776 () ValueCell!4708)

