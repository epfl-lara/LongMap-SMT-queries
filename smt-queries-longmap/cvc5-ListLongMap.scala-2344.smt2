; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37526 () Bool)

(assert start!37526)

(declare-fun b_free!8653 () Bool)

(declare-fun b_next!8653 () Bool)

(assert (=> start!37526 (= b_free!8653 (not b_next!8653))))

(declare-fun tp!30674 () Bool)

(declare-fun b_and!15895 () Bool)

(assert (=> start!37526 (= tp!30674 b_and!15895)))

(declare-fun b!382990 () Bool)

(declare-fun e!232680 () Bool)

(declare-fun e!232678 () Bool)

(declare-fun mapRes!15516 () Bool)

(assert (=> b!382990 (= e!232680 (and e!232678 mapRes!15516))))

(declare-fun condMapEmpty!15516 () Bool)

(declare-datatypes ((V!13507 0))(
  ( (V!13508 (val!4695 Int)) )
))
(declare-datatypes ((ValueCell!4307 0))(
  ( (ValueCellFull!4307 (v!6892 V!13507)) (EmptyCell!4307) )
))
(declare-datatypes ((array!22511 0))(
  ( (array!22512 (arr!10724 (Array (_ BitVec 32) ValueCell!4307)) (size!11076 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22511)

(declare-fun mapDefault!15516 () ValueCell!4307)

