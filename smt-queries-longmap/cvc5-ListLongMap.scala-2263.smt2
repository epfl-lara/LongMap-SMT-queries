; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37040 () Bool)

(assert start!37040)

(declare-fun b_free!8167 () Bool)

(declare-fun b_next!8167 () Bool)

(assert (=> start!37040 (= b_free!8167 (not b_next!8167))))

(declare-fun tp!29216 () Bool)

(declare-fun b_and!15409 () Bool)

(assert (=> start!37040 (= tp!29216 b_and!15409)))

(declare-fun b!372296 () Bool)

(declare-fun res!209457 () Bool)

(declare-fun e!227116 () Bool)

(assert (=> b!372296 (=> (not res!209457) (not e!227116))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12859 0))(
  ( (V!12860 (val!4452 Int)) )
))
(declare-datatypes ((ValueCell!4064 0))(
  ( (ValueCellFull!4064 (v!6649 V!12859)) (EmptyCell!4064) )
))
(declare-datatypes ((array!21571 0))(
  ( (array!21572 (arr!10254 (Array (_ BitVec 32) ValueCell!4064)) (size!10606 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21571)

(declare-datatypes ((array!21573 0))(
  ( (array!21574 (arr!10255 (Array (_ BitVec 32) (_ BitVec 64))) (size!10607 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21573)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!372296 (= res!209457 (and (= (size!10606 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10607 _keys!658) (size!10606 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372297 () Bool)

(declare-fun res!209453 () Bool)

(assert (=> b!372297 (=> (not res!209453) (not e!227116))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372297 (= res!209453 (or (= (select (arr!10255 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10255 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372298 () Bool)

(declare-fun e!227112 () Bool)

(declare-fun e!227115 () Bool)

(declare-fun mapRes!14787 () Bool)

(assert (=> b!372298 (= e!227112 (and e!227115 mapRes!14787))))

(declare-fun condMapEmpty!14787 () Bool)

(declare-fun mapDefault!14787 () ValueCell!4064)

