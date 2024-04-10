; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37724 () Bool)

(assert start!37724)

(declare-fun b_free!8827 () Bool)

(declare-fun b_next!8827 () Bool)

(assert (=> start!37724 (= b_free!8827 (not b_next!8827))))

(declare-fun tp!31232 () Bool)

(declare-fun b_and!16069 () Bool)

(assert (=> start!37724 (= tp!31232 b_and!16069)))

(declare-fun b!386831 () Bool)

(declare-fun e!234609 () Bool)

(declare-fun e!234610 () Bool)

(declare-fun mapRes!15813 () Bool)

(assert (=> b!386831 (= e!234609 (and e!234610 mapRes!15813))))

(declare-fun condMapEmpty!15813 () Bool)

(declare-datatypes ((V!13771 0))(
  ( (V!13772 (val!4794 Int)) )
))
(declare-datatypes ((ValueCell!4406 0))(
  ( (ValueCellFull!4406 (v!6991 V!13771)) (EmptyCell!4406) )
))
(declare-datatypes ((array!22893 0))(
  ( (array!22894 (arr!10915 (Array (_ BitVec 32) ValueCell!4406)) (size!11267 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22893)

(declare-fun mapDefault!15813 () ValueCell!4406)

