; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37736 () Bool)

(assert start!37736)

(declare-fun b_free!8839 () Bool)

(declare-fun b_next!8839 () Bool)

(assert (=> start!37736 (= b_free!8839 (not b_next!8839))))

(declare-fun tp!31268 () Bool)

(declare-fun b_and!16081 () Bool)

(assert (=> start!37736 (= tp!31268 b_and!16081)))

(declare-fun b!387065 () Bool)

(declare-fun res!221093 () Bool)

(declare-fun e!234721 () Bool)

(assert (=> b!387065 (=> (not res!221093) (not e!234721))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387065 (= res!221093 (validKeyInArray!0 k!778))))

(declare-fun b!387066 () Bool)

(declare-fun res!221089 () Bool)

(assert (=> b!387066 (=> (not res!221089) (not e!234721))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22915 0))(
  ( (array!22916 (arr!10926 (Array (_ BitVec 32) (_ BitVec 64))) (size!11278 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22915)

(assert (=> b!387066 (= res!221089 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11278 _keys!658))))))

(declare-fun b!387067 () Bool)

(declare-fun e!234722 () Bool)

(declare-fun e!234718 () Bool)

(declare-fun mapRes!15831 () Bool)

(assert (=> b!387067 (= e!234722 (and e!234718 mapRes!15831))))

(declare-fun condMapEmpty!15831 () Bool)

(declare-datatypes ((V!13787 0))(
  ( (V!13788 (val!4800 Int)) )
))
(declare-datatypes ((ValueCell!4412 0))(
  ( (ValueCellFull!4412 (v!6997 V!13787)) (EmptyCell!4412) )
))
(declare-datatypes ((array!22917 0))(
  ( (array!22918 (arr!10927 (Array (_ BitVec 32) ValueCell!4412)) (size!11279 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22917)

(declare-fun mapDefault!15831 () ValueCell!4412)

