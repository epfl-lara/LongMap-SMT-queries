; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37558 () Bool)

(assert start!37558)

(declare-fun b_free!8685 () Bool)

(declare-fun b_next!8685 () Bool)

(assert (=> start!37558 (= b_free!8685 (not b_next!8685))))

(declare-fun tp!30770 () Bool)

(declare-fun b_and!15927 () Bool)

(assert (=> start!37558 (= tp!30770 b_and!15927)))

(declare-fun b!383662 () Bool)

(declare-fun e!233017 () Bool)

(declare-fun e!233014 () Bool)

(declare-fun mapRes!15564 () Bool)

(assert (=> b!383662 (= e!233017 (and e!233014 mapRes!15564))))

(declare-fun condMapEmpty!15564 () Bool)

(declare-datatypes ((V!13549 0))(
  ( (V!13550 (val!4711 Int)) )
))
(declare-datatypes ((ValueCell!4323 0))(
  ( (ValueCellFull!4323 (v!6908 V!13549)) (EmptyCell!4323) )
))
(declare-datatypes ((array!22573 0))(
  ( (array!22574 (arr!10755 (Array (_ BitVec 32) ValueCell!4323)) (size!11107 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22573)

(declare-fun mapDefault!15564 () ValueCell!4323)

(assert (=> b!383662 (= condMapEmpty!15564 (= (arr!10755 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4323)) mapDefault!15564)))))

(declare-fun b!383663 () Bool)

(declare-fun res!218485 () Bool)

(declare-fun e!233013 () Bool)

(assert (=> b!383663 (=> (not res!218485) (not e!233013))))

(declare-datatypes ((array!22575 0))(
  ( (array!22576 (arr!10756 (Array (_ BitVec 32) (_ BitVec 64))) (size!11108 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22575)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22575 (_ BitVec 32)) Bool)

(assert (=> b!383663 (= res!218485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383664 () Bool)

(declare-fun res!218486 () Bool)

(declare-fun e!233015 () Bool)

(assert (=> b!383664 (=> (not res!218486) (not e!233015))))

(declare-fun lt!180300 () array!22575)

(declare-datatypes ((List!6173 0))(
  ( (Nil!6170) (Cons!6169 (h!7025 (_ BitVec 64)) (t!11323 List!6173)) )
))
(declare-fun arrayNoDuplicates!0 (array!22575 (_ BitVec 32) List!6173) Bool)

(assert (=> b!383664 (= res!218486 (arrayNoDuplicates!0 lt!180300 #b00000000000000000000000000000000 Nil!6170))))

(declare-fun b!383665 () Bool)

(declare-fun res!218489 () Bool)

(assert (=> b!383665 (=> (not res!218489) (not e!233013))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383665 (= res!218489 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11108 _keys!658))))))

(declare-fun b!383667 () Bool)

(declare-fun e!233016 () Bool)

(assert (=> b!383667 (= e!233016 true)))

(declare-datatypes ((tuple2!6338 0))(
  ( (tuple2!6339 (_1!3180 (_ BitVec 64)) (_2!3180 V!13549)) )
))
(declare-datatypes ((List!6174 0))(
  ( (Nil!6171) (Cons!6170 (h!7026 tuple2!6338) (t!11324 List!6174)) )
))
(declare-datatypes ((ListLongMap!5251 0))(
  ( (ListLongMap!5252 (toList!2641 List!6174)) )
))
(declare-fun lt!180291 () ListLongMap!5251)

(declare-fun lt!180290 () ListLongMap!5251)

(declare-fun lt!180296 () tuple2!6338)

(declare-fun +!976 (ListLongMap!5251 tuple2!6338) ListLongMap!5251)

(assert (=> b!383667 (= lt!180291 (+!976 lt!180290 lt!180296))))

(declare-fun lt!180293 () ListLongMap!5251)

(declare-fun lt!180297 () ListLongMap!5251)

(assert (=> b!383667 (= lt!180293 lt!180297)))

(declare-fun b!383668 () Bool)

(declare-fun res!218492 () Bool)

(assert (=> b!383668 (=> (not res!218492) (not e!233013))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383668 (= res!218492 (validKeyInArray!0 k0!778))))

(declare-fun b!383669 () Bool)

(declare-fun res!218493 () Bool)

(assert (=> b!383669 (=> (not res!218493) (not e!233013))))

(assert (=> b!383669 (= res!218493 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6170))))

(declare-fun mapIsEmpty!15564 () Bool)

(assert (=> mapIsEmpty!15564 mapRes!15564))

(declare-fun b!383670 () Bool)

(assert (=> b!383670 (= e!233013 e!233015)))

(declare-fun res!218488 () Bool)

(assert (=> b!383670 (=> (not res!218488) (not e!233015))))

(assert (=> b!383670 (= res!218488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180300 mask!970))))

(assert (=> b!383670 (= lt!180300 (array!22576 (store (arr!10756 _keys!658) i!548 k0!778) (size!11108 _keys!658)))))

(declare-fun b!383671 () Bool)

(declare-fun e!233018 () Bool)

(declare-fun tp_is_empty!9333 () Bool)

(assert (=> b!383671 (= e!233018 tp_is_empty!9333)))

(declare-fun mapNonEmpty!15564 () Bool)

(declare-fun tp!30771 () Bool)

(assert (=> mapNonEmpty!15564 (= mapRes!15564 (and tp!30771 e!233018))))

(declare-fun mapRest!15564 () (Array (_ BitVec 32) ValueCell!4323))

(declare-fun mapValue!15564 () ValueCell!4323)

(declare-fun mapKey!15564 () (_ BitVec 32))

(assert (=> mapNonEmpty!15564 (= (arr!10755 _values!506) (store mapRest!15564 mapKey!15564 mapValue!15564))))

(declare-fun res!218495 () Bool)

(assert (=> start!37558 (=> (not res!218495) (not e!233013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37558 (= res!218495 (validMask!0 mask!970))))

(assert (=> start!37558 e!233013))

(declare-fun array_inv!7914 (array!22573) Bool)

(assert (=> start!37558 (and (array_inv!7914 _values!506) e!233017)))

(assert (=> start!37558 tp!30770))

(assert (=> start!37558 true))

(assert (=> start!37558 tp_is_empty!9333))

(declare-fun array_inv!7915 (array!22575) Bool)

(assert (=> start!37558 (array_inv!7915 _keys!658)))

(declare-fun b!383666 () Bool)

(declare-fun res!218490 () Bool)

(assert (=> b!383666 (=> (not res!218490) (not e!233013))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383666 (= res!218490 (and (= (size!11107 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11108 _keys!658) (size!11107 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383672 () Bool)

(assert (=> b!383672 (= e!233014 tp_is_empty!9333)))

(declare-fun b!383673 () Bool)

(declare-fun res!218487 () Bool)

(assert (=> b!383673 (=> (not res!218487) (not e!233013))))

(declare-fun arrayContainsKey!0 (array!22575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383673 (= res!218487 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383674 () Bool)

(declare-fun res!218494 () Bool)

(assert (=> b!383674 (=> (not res!218494) (not e!233013))))

(assert (=> b!383674 (= res!218494 (or (= (select (arr!10756 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10756 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383675 () Bool)

(assert (=> b!383675 (= e!233015 (not e!233016))))

(declare-fun res!218491 () Bool)

(assert (=> b!383675 (=> res!218491 e!233016)))

(declare-fun lt!180294 () Bool)

(assert (=> b!383675 (= res!218491 (or (and (not lt!180294) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180294) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180294)))))

(assert (=> b!383675 (= lt!180294 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13549)

(declare-fun minValue!472 () V!13549)

(declare-fun getCurrentListMap!2045 (array!22575 array!22573 (_ BitVec 32) (_ BitVec 32) V!13549 V!13549 (_ BitVec 32) Int) ListLongMap!5251)

(assert (=> b!383675 (= lt!180290 (getCurrentListMap!2045 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180295 () array!22573)

(assert (=> b!383675 (= lt!180293 (getCurrentListMap!2045 lt!180300 lt!180295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180292 () ListLongMap!5251)

(assert (=> b!383675 (and (= lt!180297 lt!180292) (= lt!180292 lt!180297))))

(declare-fun lt!180299 () ListLongMap!5251)

(assert (=> b!383675 (= lt!180292 (+!976 lt!180299 lt!180296))))

(declare-fun v!373 () V!13549)

(assert (=> b!383675 (= lt!180296 (tuple2!6339 k0!778 v!373))))

(declare-datatypes ((Unit!11844 0))(
  ( (Unit!11845) )
))
(declare-fun lt!180298 () Unit!11844)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!203 (array!22575 array!22573 (_ BitVec 32) (_ BitVec 32) V!13549 V!13549 (_ BitVec 32) (_ BitVec 64) V!13549 (_ BitVec 32) Int) Unit!11844)

(assert (=> b!383675 (= lt!180298 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!203 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!879 (array!22575 array!22573 (_ BitVec 32) (_ BitVec 32) V!13549 V!13549 (_ BitVec 32) Int) ListLongMap!5251)

(assert (=> b!383675 (= lt!180297 (getCurrentListMapNoExtraKeys!879 lt!180300 lt!180295 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383675 (= lt!180295 (array!22574 (store (arr!10755 _values!506) i!548 (ValueCellFull!4323 v!373)) (size!11107 _values!506)))))

(assert (=> b!383675 (= lt!180299 (getCurrentListMapNoExtraKeys!879 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37558 res!218495) b!383666))

(assert (= (and b!383666 res!218490) b!383663))

(assert (= (and b!383663 res!218485) b!383669))

(assert (= (and b!383669 res!218493) b!383665))

(assert (= (and b!383665 res!218489) b!383668))

(assert (= (and b!383668 res!218492) b!383674))

(assert (= (and b!383674 res!218494) b!383673))

(assert (= (and b!383673 res!218487) b!383670))

(assert (= (and b!383670 res!218488) b!383664))

(assert (= (and b!383664 res!218486) b!383675))

(assert (= (and b!383675 (not res!218491)) b!383667))

(assert (= (and b!383662 condMapEmpty!15564) mapIsEmpty!15564))

(assert (= (and b!383662 (not condMapEmpty!15564)) mapNonEmpty!15564))

(get-info :version)

(assert (= (and mapNonEmpty!15564 ((_ is ValueCellFull!4323) mapValue!15564)) b!383671))

(assert (= (and b!383662 ((_ is ValueCellFull!4323) mapDefault!15564)) b!383672))

(assert (= start!37558 b!383662))

(declare-fun m!380395 () Bool)

(assert (=> b!383669 m!380395))

(declare-fun m!380397 () Bool)

(assert (=> b!383670 m!380397))

(declare-fun m!380399 () Bool)

(assert (=> b!383670 m!380399))

(declare-fun m!380401 () Bool)

(assert (=> mapNonEmpty!15564 m!380401))

(declare-fun m!380403 () Bool)

(assert (=> start!37558 m!380403))

(declare-fun m!380405 () Bool)

(assert (=> start!37558 m!380405))

(declare-fun m!380407 () Bool)

(assert (=> start!37558 m!380407))

(declare-fun m!380409 () Bool)

(assert (=> b!383667 m!380409))

(declare-fun m!380411 () Bool)

(assert (=> b!383673 m!380411))

(declare-fun m!380413 () Bool)

(assert (=> b!383674 m!380413))

(declare-fun m!380415 () Bool)

(assert (=> b!383663 m!380415))

(declare-fun m!380417 () Bool)

(assert (=> b!383668 m!380417))

(declare-fun m!380419 () Bool)

(assert (=> b!383675 m!380419))

(declare-fun m!380421 () Bool)

(assert (=> b!383675 m!380421))

(declare-fun m!380423 () Bool)

(assert (=> b!383675 m!380423))

(declare-fun m!380425 () Bool)

(assert (=> b!383675 m!380425))

(declare-fun m!380427 () Bool)

(assert (=> b!383675 m!380427))

(declare-fun m!380429 () Bool)

(assert (=> b!383675 m!380429))

(declare-fun m!380431 () Bool)

(assert (=> b!383675 m!380431))

(declare-fun m!380433 () Bool)

(assert (=> b!383664 m!380433))

(check-sat b_and!15927 (not mapNonEmpty!15564) (not start!37558) (not b!383667) (not b!383675) (not b!383663) (not b!383670) (not b!383673) tp_is_empty!9333 (not b!383669) (not b_next!8685) (not b!383668) (not b!383664))
(check-sat b_and!15927 (not b_next!8685))
