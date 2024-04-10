; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39230 () Bool)

(assert start!39230)

(declare-fun b_free!9497 () Bool)

(declare-fun b_next!9497 () Bool)

(assert (=> start!39230 (= b_free!9497 (not b_next!9497))))

(declare-fun tp!34019 () Bool)

(declare-fun b_and!16883 () Bool)

(assert (=> start!39230 (= tp!34019 b_and!16883)))

(declare-fun b!413973 () Bool)

(declare-fun res!240630 () Bool)

(declare-fun e!247472 () Bool)

(assert (=> b!413973 (=> (not res!240630) (not e!247472))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413973 (= res!240630 (bvsle from!863 i!563))))

(declare-fun b!413974 () Bool)

(declare-fun res!240639 () Bool)

(declare-fun e!247473 () Bool)

(assert (=> b!413974 (=> (not res!240639) (not e!247473))))

(declare-datatypes ((array!25155 0))(
  ( (array!25156 (arr!12027 (Array (_ BitVec 32) (_ BitVec 64))) (size!12379 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25155)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413974 (= res!240639 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413975 () Bool)

(declare-fun res!240633 () Bool)

(assert (=> b!413975 (=> (not res!240633) (not e!247473))))

(declare-datatypes ((List!7004 0))(
  ( (Nil!7001) (Cons!7000 (h!7856 (_ BitVec 64)) (t!12178 List!7004)) )
))
(declare-fun arrayNoDuplicates!0 (array!25155 (_ BitVec 32) List!7004) Bool)

(assert (=> b!413975 (= res!240633 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7001))))

(declare-fun b!413976 () Bool)

(declare-fun e!247476 () Bool)

(declare-fun e!247471 () Bool)

(declare-fun mapRes!17595 () Bool)

(assert (=> b!413976 (= e!247476 (and e!247471 mapRes!17595))))

(declare-fun condMapEmpty!17595 () Bool)

(declare-datatypes ((V!15303 0))(
  ( (V!15304 (val!5369 Int)) )
))
(declare-datatypes ((ValueCell!4981 0))(
  ( (ValueCellFull!4981 (v!7616 V!15303)) (EmptyCell!4981) )
))
(declare-datatypes ((array!25157 0))(
  ( (array!25158 (arr!12028 (Array (_ BitVec 32) ValueCell!4981)) (size!12380 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25157)

(declare-fun mapDefault!17595 () ValueCell!4981)

