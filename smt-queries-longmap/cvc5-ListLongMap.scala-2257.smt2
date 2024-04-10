; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37004 () Bool)

(assert start!37004)

(declare-fun b_free!8131 () Bool)

(declare-fun b_next!8131 () Bool)

(assert (=> start!37004 (= b_free!8131 (not b_next!8131))))

(declare-fun tp!29109 () Bool)

(declare-fun b_and!15373 () Bool)

(assert (=> start!37004 (= tp!29109 b_and!15373)))

(declare-fun b!371594 () Bool)

(declare-fun res!208917 () Bool)

(declare-fun e!226791 () Bool)

(assert (=> b!371594 (=> (not res!208917) (not e!226791))))

(declare-datatypes ((array!21499 0))(
  ( (array!21500 (arr!10218 (Array (_ BitVec 32) (_ BitVec 64))) (size!10570 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21499)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371594 (= res!208917 (or (= (select (arr!10218 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10218 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14733 () Bool)

(declare-fun mapRes!14733 () Bool)

(assert (=> mapIsEmpty!14733 mapRes!14733))

(declare-fun b!371595 () Bool)

(declare-fun e!226793 () Bool)

(declare-fun e!226790 () Bool)

(assert (=> b!371595 (= e!226793 (and e!226790 mapRes!14733))))

(declare-fun condMapEmpty!14733 () Bool)

(declare-datatypes ((V!12811 0))(
  ( (V!12812 (val!4434 Int)) )
))
(declare-datatypes ((ValueCell!4046 0))(
  ( (ValueCellFull!4046 (v!6631 V!12811)) (EmptyCell!4046) )
))
(declare-datatypes ((array!21501 0))(
  ( (array!21502 (arr!10219 (Array (_ BitVec 32) ValueCell!4046)) (size!10571 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21501)

(declare-fun mapDefault!14733 () ValueCell!4046)

