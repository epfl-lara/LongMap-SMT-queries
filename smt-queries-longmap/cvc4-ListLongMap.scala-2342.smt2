; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37518 () Bool)

(assert start!37518)

(declare-fun b_free!8645 () Bool)

(declare-fun b_next!8645 () Bool)

(assert (=> start!37518 (= b_free!8645 (not b_next!8645))))

(declare-fun tp!30650 () Bool)

(declare-fun b_and!15887 () Bool)

(assert (=> start!37518 (= tp!30650 b_and!15887)))

(declare-fun b!382822 () Bool)

(declare-fun res!217830 () Bool)

(declare-fun e!232592 () Bool)

(assert (=> b!382822 (=> (not res!217830) (not e!232592))))

(declare-datatypes ((array!22495 0))(
  ( (array!22496 (arr!10716 (Array (_ BitVec 32) (_ BitVec 64))) (size!11068 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22495)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382822 (= res!217830 (or (= (select (arr!10716 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10716 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!217826 () Bool)

(assert (=> start!37518 (=> (not res!217826) (not e!232592))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37518 (= res!217826 (validMask!0 mask!970))))

(assert (=> start!37518 e!232592))

(declare-datatypes ((V!13495 0))(
  ( (V!13496 (val!4691 Int)) )
))
(declare-datatypes ((ValueCell!4303 0))(
  ( (ValueCellFull!4303 (v!6888 V!13495)) (EmptyCell!4303) )
))
(declare-datatypes ((array!22497 0))(
  ( (array!22498 (arr!10717 (Array (_ BitVec 32) ValueCell!4303)) (size!11069 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22497)

(declare-fun e!232593 () Bool)

(declare-fun array_inv!7890 (array!22497) Bool)

(assert (=> start!37518 (and (array_inv!7890 _values!506) e!232593)))

(assert (=> start!37518 tp!30650))

(assert (=> start!37518 true))

(declare-fun tp_is_empty!9293 () Bool)

(assert (=> start!37518 tp_is_empty!9293))

(declare-fun array_inv!7891 (array!22495) Bool)

(assert (=> start!37518 (array_inv!7891 _keys!658)))

(declare-fun b!382823 () Bool)

(declare-fun e!232596 () Bool)

(assert (=> b!382823 (= e!232592 e!232596)))

(declare-fun res!217828 () Bool)

(assert (=> b!382823 (=> (not res!217828) (not e!232596))))

(declare-fun lt!179672 () array!22495)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22495 (_ BitVec 32)) Bool)

(assert (=> b!382823 (= res!217828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179672 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!382823 (= lt!179672 (array!22496 (store (arr!10716 _keys!658) i!548 k!778) (size!11068 _keys!658)))))

(declare-fun b!382824 () Bool)

(declare-fun e!232594 () Bool)

(assert (=> b!382824 (= e!232594 tp_is_empty!9293)))

(declare-fun b!382825 () Bool)

(declare-fun res!217831 () Bool)

(assert (=> b!382825 (=> (not res!217831) (not e!232592))))

(declare-fun arrayContainsKey!0 (array!22495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382825 (= res!217831 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382826 () Bool)

(declare-fun res!217835 () Bool)

(assert (=> b!382826 (=> (not res!217835) (not e!232592))))

(assert (=> b!382826 (= res!217835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382827 () Bool)

(declare-fun res!217832 () Bool)

(assert (=> b!382827 (=> (not res!217832) (not e!232592))))

(assert (=> b!382827 (= res!217832 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11068 _keys!658))))))

(declare-fun b!382828 () Bool)

(declare-fun mapRes!15504 () Bool)

(assert (=> b!382828 (= e!232593 (and e!232594 mapRes!15504))))

(declare-fun condMapEmpty!15504 () Bool)

(declare-fun mapDefault!15504 () ValueCell!4303)

