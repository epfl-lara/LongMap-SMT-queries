; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37646 () Bool)

(assert start!37646)

(declare-fun res!219867 () Bool)

(declare-fun e!233932 () Bool)

(assert (=> start!37646 (=> (not res!219867) (not e!233932))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37646 (= res!219867 (validMask!0 mask!970))))

(assert (=> start!37646 e!233932))

(assert (=> start!37646 true))

(declare-datatypes ((V!13667 0))(
  ( (V!13668 (val!4755 Int)) )
))
(declare-datatypes ((ValueCell!4367 0))(
  ( (ValueCellFull!4367 (v!6952 V!13667)) (EmptyCell!4367) )
))
(declare-datatypes ((array!22743 0))(
  ( (array!22744 (arr!10840 (Array (_ BitVec 32) ValueCell!4367)) (size!11192 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22743)

(declare-fun e!233934 () Bool)

(declare-fun array_inv!7978 (array!22743) Bool)

(assert (=> start!37646 (and (array_inv!7978 _values!506) e!233934)))

(declare-datatypes ((array!22745 0))(
  ( (array!22746 (arr!10841 (Array (_ BitVec 32) (_ BitVec 64))) (size!11193 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22745)

(declare-fun array_inv!7979 (array!22745) Bool)

(assert (=> start!37646 (array_inv!7979 _keys!658)))

(declare-fun b!385440 () Bool)

(declare-fun e!233936 () Bool)

(declare-fun tp_is_empty!9421 () Bool)

(assert (=> b!385440 (= e!233936 tp_is_empty!9421)))

(declare-fun b!385441 () Bool)

(assert (=> b!385441 (= e!233932 false)))

(declare-fun lt!181614 () Bool)

(declare-datatypes ((List!6242 0))(
  ( (Nil!6239) (Cons!6238 (h!7094 (_ BitVec 64)) (t!11392 List!6242)) )
))
(declare-fun arrayNoDuplicates!0 (array!22745 (_ BitVec 32) List!6242) Bool)

(assert (=> b!385441 (= lt!181614 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6239))))

(declare-fun b!385442 () Bool)

(declare-fun mapRes!15696 () Bool)

(assert (=> b!385442 (= e!233934 (and e!233936 mapRes!15696))))

(declare-fun condMapEmpty!15696 () Bool)

(declare-fun mapDefault!15696 () ValueCell!4367)

