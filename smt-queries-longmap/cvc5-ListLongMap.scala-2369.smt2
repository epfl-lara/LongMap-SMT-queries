; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37676 () Bool)

(assert start!37676)

(declare-fun b_free!8779 () Bool)

(declare-fun b_next!8779 () Bool)

(assert (=> start!37676 (= b_free!8779 (not b_next!8779))))

(declare-fun tp!31089 () Bool)

(declare-fun b_and!16021 () Bool)

(assert (=> start!37676 (= tp!31089 b_and!16021)))

(declare-fun b!385895 () Bool)

(declare-fun res!220190 () Bool)

(declare-fun e!234182 () Bool)

(assert (=> b!385895 (=> (not res!220190) (not e!234182))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22801 0))(
  ( (array!22802 (arr!10869 (Array (_ BitVec 32) (_ BitVec 64))) (size!11221 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22801)

(assert (=> b!385895 (= res!220190 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11221 _keys!658))))))

(declare-fun b!385896 () Bool)

(declare-fun e!234180 () Bool)

(declare-fun tp_is_empty!9451 () Bool)

(assert (=> b!385896 (= e!234180 tp_is_empty!9451)))

(declare-fun b!385897 () Bool)

(declare-fun e!234179 () Bool)

(declare-fun mapRes!15741 () Bool)

(assert (=> b!385897 (= e!234179 (and e!234180 mapRes!15741))))

(declare-fun condMapEmpty!15741 () Bool)

(declare-datatypes ((V!13707 0))(
  ( (V!13708 (val!4770 Int)) )
))
(declare-datatypes ((ValueCell!4382 0))(
  ( (ValueCellFull!4382 (v!6967 V!13707)) (EmptyCell!4382) )
))
(declare-datatypes ((array!22803 0))(
  ( (array!22804 (arr!10870 (Array (_ BitVec 32) ValueCell!4382)) (size!11222 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22803)

(declare-fun mapDefault!15741 () ValueCell!4382)

