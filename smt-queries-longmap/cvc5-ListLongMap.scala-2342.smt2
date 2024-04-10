; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37514 () Bool)

(assert start!37514)

(declare-fun b_free!8641 () Bool)

(declare-fun b_next!8641 () Bool)

(assert (=> start!37514 (= b_free!8641 (not b_next!8641))))

(declare-fun tp!30638 () Bool)

(declare-fun b_and!15883 () Bool)

(assert (=> start!37514 (= tp!30638 b_and!15883)))

(declare-fun b!382738 () Bool)

(declare-fun e!232554 () Bool)

(declare-fun e!232556 () Bool)

(assert (=> b!382738 (= e!232554 (not e!232556))))

(declare-fun res!217768 () Bool)

(assert (=> b!382738 (=> res!217768 e!232556)))

(declare-fun lt!179622 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382738 (= res!217768 (or (and (not lt!179622) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179622) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179622)))))

(assert (=> b!382738 (= lt!179622 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13491 0))(
  ( (V!13492 (val!4689 Int)) )
))
(declare-datatypes ((ValueCell!4301 0))(
  ( (ValueCellFull!4301 (v!6886 V!13491)) (EmptyCell!4301) )
))
(declare-datatypes ((array!22487 0))(
  ( (array!22488 (arr!10712 (Array (_ BitVec 32) ValueCell!4301)) (size!11064 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22487)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13491)

(declare-datatypes ((array!22489 0))(
  ( (array!22490 (arr!10713 (Array (_ BitVec 32) (_ BitVec 64))) (size!11065 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22489)

(declare-datatypes ((tuple2!6306 0))(
  ( (tuple2!6307 (_1!3164 (_ BitVec 64)) (_2!3164 V!13491)) )
))
(declare-datatypes ((List!6138 0))(
  ( (Nil!6135) (Cons!6134 (h!6990 tuple2!6306) (t!11288 List!6138)) )
))
(declare-datatypes ((ListLongMap!5219 0))(
  ( (ListLongMap!5220 (toList!2625 List!6138)) )
))
(declare-fun lt!179619 () ListLongMap!5219)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13491)

(declare-fun getCurrentListMap!2030 (array!22489 array!22487 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) Int) ListLongMap!5219)

(assert (=> b!382738 (= lt!179619 (getCurrentListMap!2030 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179620 () array!22489)

(declare-fun lt!179616 () array!22487)

(declare-fun lt!179614 () ListLongMap!5219)

(assert (=> b!382738 (= lt!179614 (getCurrentListMap!2030 lt!179620 lt!179616 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179615 () ListLongMap!5219)

(declare-fun lt!179618 () ListLongMap!5219)

(assert (=> b!382738 (and (= lt!179615 lt!179618) (= lt!179618 lt!179615))))

(declare-fun v!373 () V!13491)

(declare-fun lt!179621 () ListLongMap!5219)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!960 (ListLongMap!5219 tuple2!6306) ListLongMap!5219)

(assert (=> b!382738 (= lt!179618 (+!960 lt!179621 (tuple2!6307 k!778 v!373)))))

(declare-datatypes ((Unit!11814 0))(
  ( (Unit!11815) )
))
(declare-fun lt!179617 () Unit!11814)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!188 (array!22489 array!22487 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) (_ BitVec 64) V!13491 (_ BitVec 32) Int) Unit!11814)

(assert (=> b!382738 (= lt!179617 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!188 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!864 (array!22489 array!22487 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) Int) ListLongMap!5219)

(assert (=> b!382738 (= lt!179615 (getCurrentListMapNoExtraKeys!864 lt!179620 lt!179616 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382738 (= lt!179616 (array!22488 (store (arr!10712 _values!506) i!548 (ValueCellFull!4301 v!373)) (size!11064 _values!506)))))

(assert (=> b!382738 (= lt!179621 (getCurrentListMapNoExtraKeys!864 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382739 () Bool)

(declare-fun res!217766 () Bool)

(declare-fun e!232553 () Bool)

(assert (=> b!382739 (=> (not res!217766) (not e!232553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22489 (_ BitVec 32)) Bool)

(assert (=> b!382739 (= res!217766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382740 () Bool)

(declare-fun res!217763 () Bool)

(assert (=> b!382740 (=> (not res!217763) (not e!232553))))

(assert (=> b!382740 (= res!217763 (and (= (size!11064 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11065 _keys!658) (size!11064 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382741 () Bool)

(declare-fun res!217759 () Bool)

(assert (=> b!382741 (=> (not res!217759) (not e!232553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382741 (= res!217759 (validKeyInArray!0 k!778))))

(declare-fun b!382742 () Bool)

(assert (=> b!382742 (= e!232556 true)))

(assert (=> b!382742 (= lt!179614 lt!179615)))

(declare-fun res!217769 () Bool)

(assert (=> start!37514 (=> (not res!217769) (not e!232553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37514 (= res!217769 (validMask!0 mask!970))))

(assert (=> start!37514 e!232553))

(declare-fun e!232551 () Bool)

(declare-fun array_inv!7886 (array!22487) Bool)

(assert (=> start!37514 (and (array_inv!7886 _values!506) e!232551)))

(assert (=> start!37514 tp!30638))

(assert (=> start!37514 true))

(declare-fun tp_is_empty!9289 () Bool)

(assert (=> start!37514 tp_is_empty!9289))

(declare-fun array_inv!7887 (array!22489) Bool)

(assert (=> start!37514 (array_inv!7887 _keys!658)))

(declare-fun b!382743 () Bool)

(declare-fun res!217761 () Bool)

(assert (=> b!382743 (=> (not res!217761) (not e!232553))))

(declare-datatypes ((List!6139 0))(
  ( (Nil!6136) (Cons!6135 (h!6991 (_ BitVec 64)) (t!11289 List!6139)) )
))
(declare-fun arrayNoDuplicates!0 (array!22489 (_ BitVec 32) List!6139) Bool)

(assert (=> b!382743 (= res!217761 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6136))))

(declare-fun mapNonEmpty!15498 () Bool)

(declare-fun mapRes!15498 () Bool)

(declare-fun tp!30639 () Bool)

(declare-fun e!232550 () Bool)

(assert (=> mapNonEmpty!15498 (= mapRes!15498 (and tp!30639 e!232550))))

(declare-fun mapValue!15498 () ValueCell!4301)

(declare-fun mapKey!15498 () (_ BitVec 32))

(declare-fun mapRest!15498 () (Array (_ BitVec 32) ValueCell!4301))

(assert (=> mapNonEmpty!15498 (= (arr!10712 _values!506) (store mapRest!15498 mapKey!15498 mapValue!15498))))

(declare-fun b!382744 () Bool)

(declare-fun res!217762 () Bool)

(assert (=> b!382744 (=> (not res!217762) (not e!232553))))

(declare-fun arrayContainsKey!0 (array!22489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382744 (= res!217762 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382745 () Bool)

(assert (=> b!382745 (= e!232553 e!232554)))

(declare-fun res!217764 () Bool)

(assert (=> b!382745 (=> (not res!217764) (not e!232554))))

(assert (=> b!382745 (= res!217764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179620 mask!970))))

(assert (=> b!382745 (= lt!179620 (array!22490 (store (arr!10713 _keys!658) i!548 k!778) (size!11065 _keys!658)))))

(declare-fun mapIsEmpty!15498 () Bool)

(assert (=> mapIsEmpty!15498 mapRes!15498))

(declare-fun b!382746 () Bool)

(declare-fun e!232552 () Bool)

(assert (=> b!382746 (= e!232552 tp_is_empty!9289)))

(declare-fun b!382747 () Bool)

(assert (=> b!382747 (= e!232551 (and e!232552 mapRes!15498))))

(declare-fun condMapEmpty!15498 () Bool)

(declare-fun mapDefault!15498 () ValueCell!4301)

