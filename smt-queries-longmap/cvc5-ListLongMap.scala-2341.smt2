; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37508 () Bool)

(assert start!37508)

(declare-fun b_free!8635 () Bool)

(declare-fun b_next!8635 () Bool)

(assert (=> start!37508 (= b_free!8635 (not b_next!8635))))

(declare-fun tp!30620 () Bool)

(declare-fun b_and!15877 () Bool)

(assert (=> start!37508 (= tp!30620 b_and!15877)))

(declare-fun b!382612 () Bool)

(declare-fun res!217663 () Bool)

(declare-fun e!232493 () Bool)

(assert (=> b!382612 (=> (not res!217663) (not e!232493))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13483 0))(
  ( (V!13484 (val!4686 Int)) )
))
(declare-datatypes ((ValueCell!4298 0))(
  ( (ValueCellFull!4298 (v!6883 V!13483)) (EmptyCell!4298) )
))
(declare-datatypes ((array!22475 0))(
  ( (array!22476 (arr!10706 (Array (_ BitVec 32) ValueCell!4298)) (size!11058 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22475)

(declare-datatypes ((array!22477 0))(
  ( (array!22478 (arr!10707 (Array (_ BitVec 32) (_ BitVec 64))) (size!11059 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22477)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382612 (= res!217663 (and (= (size!11058 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11059 _keys!658) (size!11058 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382613 () Bool)

(declare-fun res!217661 () Bool)

(declare-fun e!232487 () Bool)

(assert (=> b!382613 (=> (not res!217661) (not e!232487))))

(declare-fun lt!179536 () array!22477)

(declare-datatypes ((List!6133 0))(
  ( (Nil!6130) (Cons!6129 (h!6985 (_ BitVec 64)) (t!11283 List!6133)) )
))
(declare-fun arrayNoDuplicates!0 (array!22477 (_ BitVec 32) List!6133) Bool)

(assert (=> b!382613 (= res!217661 (arrayNoDuplicates!0 lt!179536 #b00000000000000000000000000000000 Nil!6130))))

(declare-fun b!382614 () Bool)

(declare-fun res!217668 () Bool)

(assert (=> b!382614 (=> (not res!217668) (not e!232493))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382614 (= res!217668 (or (= (select (arr!10707 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10707 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382615 () Bool)

(declare-fun res!217664 () Bool)

(assert (=> b!382615 (=> (not res!217664) (not e!232493))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382615 (= res!217664 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382616 () Bool)

(declare-fun res!217666 () Bool)

(assert (=> b!382616 (=> (not res!217666) (not e!232493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382616 (= res!217666 (validKeyInArray!0 k!778))))

(declare-fun b!382617 () Bool)

(declare-fun res!217660 () Bool)

(assert (=> b!382617 (=> (not res!217660) (not e!232493))))

(assert (=> b!382617 (= res!217660 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11059 _keys!658))))))

(declare-fun mapNonEmpty!15489 () Bool)

(declare-fun mapRes!15489 () Bool)

(declare-fun tp!30621 () Bool)

(declare-fun e!232491 () Bool)

(assert (=> mapNonEmpty!15489 (= mapRes!15489 (and tp!30621 e!232491))))

(declare-fun mapRest!15489 () (Array (_ BitVec 32) ValueCell!4298))

(declare-fun mapKey!15489 () (_ BitVec 32))

(declare-fun mapValue!15489 () ValueCell!4298)

(assert (=> mapNonEmpty!15489 (= (arr!10706 _values!506) (store mapRest!15489 mapKey!15489 mapValue!15489))))

(declare-fun b!382618 () Bool)

(declare-fun tp_is_empty!9283 () Bool)

(assert (=> b!382618 (= e!232491 tp_is_empty!9283)))

(declare-fun b!382620 () Bool)

(declare-fun res!217669 () Bool)

(assert (=> b!382620 (=> (not res!217669) (not e!232493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22477 (_ BitVec 32)) Bool)

(assert (=> b!382620 (= res!217669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382621 () Bool)

(declare-fun e!232490 () Bool)

(assert (=> b!382621 (= e!232490 tp_is_empty!9283)))

(declare-fun b!382622 () Bool)

(assert (=> b!382622 (= e!232493 e!232487)))

(declare-fun res!217662 () Bool)

(assert (=> b!382622 (=> (not res!217662) (not e!232487))))

(assert (=> b!382622 (= res!217662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179536 mask!970))))

(assert (=> b!382622 (= lt!179536 (array!22478 (store (arr!10707 _keys!658) i!548 k!778) (size!11059 _keys!658)))))

(declare-fun b!382623 () Bool)

(declare-fun e!232489 () Bool)

(assert (=> b!382623 (= e!232489 (and e!232490 mapRes!15489))))

(declare-fun condMapEmpty!15489 () Bool)

(declare-fun mapDefault!15489 () ValueCell!4298)

