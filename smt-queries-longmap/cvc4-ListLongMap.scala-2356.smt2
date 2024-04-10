; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37602 () Bool)

(assert start!37602)

(declare-fun b_free!8729 () Bool)

(declare-fun b_next!8729 () Bool)

(assert (=> start!37602 (= b_free!8729 (not b_next!8729))))

(declare-fun tp!30903 () Bool)

(declare-fun b_and!15971 () Bool)

(assert (=> start!37602 (= tp!30903 b_and!15971)))

(declare-fun b!384595 () Bool)

(declare-fun res!219224 () Bool)

(declare-fun e!233488 () Bool)

(assert (=> b!384595 (=> (not res!219224) (not e!233488))))

(declare-datatypes ((array!22657 0))(
  ( (array!22658 (arr!10797 (Array (_ BitVec 32) (_ BitVec 64))) (size!11149 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22657)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384595 (= res!219224 (or (= (select (arr!10797 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10797 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384596 () Bool)

(declare-fun e!233485 () Bool)

(declare-fun e!233489 () Bool)

(declare-fun mapRes!15630 () Bool)

(assert (=> b!384596 (= e!233485 (and e!233489 mapRes!15630))))

(declare-fun condMapEmpty!15630 () Bool)

(declare-datatypes ((V!13607 0))(
  ( (V!13608 (val!4733 Int)) )
))
(declare-datatypes ((ValueCell!4345 0))(
  ( (ValueCellFull!4345 (v!6930 V!13607)) (EmptyCell!4345) )
))
(declare-datatypes ((array!22659 0))(
  ( (array!22660 (arr!10798 (Array (_ BitVec 32) ValueCell!4345)) (size!11150 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22659)

(declare-fun mapDefault!15630 () ValueCell!4345)

