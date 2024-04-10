; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37530 () Bool)

(assert start!37530)

(declare-fun b_free!8657 () Bool)

(declare-fun b_next!8657 () Bool)

(assert (=> start!37530 (= b_free!8657 (not b_next!8657))))

(declare-fun tp!30687 () Bool)

(declare-fun b_and!15899 () Bool)

(assert (=> start!37530 (= tp!30687 b_and!15899)))

(declare-fun b!383074 () Bool)

(declare-fun res!218026 () Bool)

(declare-fun e!232722 () Bool)

(assert (=> b!383074 (=> (not res!218026) (not e!232722))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22517 0))(
  ( (array!22518 (arr!10727 (Array (_ BitVec 32) (_ BitVec 64))) (size!11079 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22517)

(assert (=> b!383074 (= res!218026 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11079 _keys!658))))))

(declare-fun b!383075 () Bool)

(declare-fun res!218033 () Bool)

(assert (=> b!383075 (=> (not res!218033) (not e!232722))))

(declare-datatypes ((List!6150 0))(
  ( (Nil!6147) (Cons!6146 (h!7002 (_ BitVec 64)) (t!11300 List!6150)) )
))
(declare-fun arrayNoDuplicates!0 (array!22517 (_ BitVec 32) List!6150) Bool)

(assert (=> b!383075 (= res!218033 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6147))))

(declare-fun b!383076 () Bool)

(declare-fun res!218023 () Bool)

(declare-fun e!232718 () Bool)

(assert (=> b!383076 (=> (not res!218023) (not e!232718))))

(declare-fun lt!179836 () array!22517)

(assert (=> b!383076 (= res!218023 (arrayNoDuplicates!0 lt!179836 #b00000000000000000000000000000000 Nil!6147))))

(declare-fun b!383077 () Bool)

(declare-fun e!232724 () Bool)

(declare-fun e!232721 () Bool)

(declare-fun mapRes!15522 () Bool)

(assert (=> b!383077 (= e!232724 (and e!232721 mapRes!15522))))

(declare-fun condMapEmpty!15522 () Bool)

(declare-datatypes ((V!13511 0))(
  ( (V!13512 (val!4697 Int)) )
))
(declare-datatypes ((ValueCell!4309 0))(
  ( (ValueCellFull!4309 (v!6894 V!13511)) (EmptyCell!4309) )
))
(declare-datatypes ((array!22519 0))(
  ( (array!22520 (arr!10728 (Array (_ BitVec 32) ValueCell!4309)) (size!11080 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22519)

(declare-fun mapDefault!15522 () ValueCell!4309)

