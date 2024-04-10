; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37104 () Bool)

(assert start!37104)

(declare-fun b_free!8231 () Bool)

(declare-fun b_next!8231 () Bool)

(assert (=> start!37104 (= b_free!8231 (not b_next!8231))))

(declare-fun tp!29409 () Bool)

(declare-fun b_and!15473 () Bool)

(assert (=> start!37104 (= tp!29409 b_and!15473)))

(declare-fun b!373632 () Bool)

(declare-fun e!227767 () Bool)

(declare-fun e!227771 () Bool)

(declare-fun mapRes!14883 () Bool)

(assert (=> b!373632 (= e!227767 (and e!227771 mapRes!14883))))

(declare-fun condMapEmpty!14883 () Bool)

(declare-datatypes ((V!12943 0))(
  ( (V!12944 (val!4484 Int)) )
))
(declare-datatypes ((ValueCell!4096 0))(
  ( (ValueCellFull!4096 (v!6681 V!12943)) (EmptyCell!4096) )
))
(declare-datatypes ((array!21699 0))(
  ( (array!21700 (arr!10318 (Array (_ BitVec 32) ValueCell!4096)) (size!10670 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21699)

(declare-fun mapDefault!14883 () ValueCell!4096)

