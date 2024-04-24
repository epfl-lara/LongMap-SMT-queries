; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38176 () Bool)

(assert start!38176)

(declare-fun b_free!9049 () Bool)

(declare-fun b_next!9049 () Bool)

(assert (=> start!38176 (= b_free!9049 (not b_next!9049))))

(declare-fun tp!31932 () Bool)

(declare-fun b_and!16437 () Bool)

(assert (=> start!38176 (= tp!31932 b_and!16437)))

(declare-fun b!393735 () Bool)

(declare-fun res!225627 () Bool)

(declare-fun e!238370 () Bool)

(assert (=> b!393735 (=> (not res!225627) (not e!238370))))

(declare-datatypes ((array!23338 0))(
  ( (array!23339 (arr!11126 (Array (_ BitVec 32) (_ BitVec 64))) (size!11478 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23338)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393735 (= res!225627 (or (= (select (arr!11126 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11126 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393736 () Bool)

(declare-fun res!225633 () Bool)

(assert (=> b!393736 (=> (not res!225633) (not e!238370))))

(declare-datatypes ((List!6334 0))(
  ( (Nil!6331) (Cons!6330 (h!7186 (_ BitVec 64)) (t!11498 List!6334)) )
))
(declare-fun arrayNoDuplicates!0 (array!23338 (_ BitVec 32) List!6334) Bool)

(assert (=> b!393736 (= res!225633 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6331))))

(declare-fun b!393737 () Bool)

(declare-fun res!225629 () Bool)

(assert (=> b!393737 (=> (not res!225629) (not e!238370))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393737 (= res!225629 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393738 () Bool)

(declare-fun res!225630 () Bool)

(assert (=> b!393738 (=> (not res!225630) (not e!238370))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14067 0))(
  ( (V!14068 (val!4905 Int)) )
))
(declare-datatypes ((ValueCell!4517 0))(
  ( (ValueCellFull!4517 (v!7147 V!14067)) (EmptyCell!4517) )
))
(declare-datatypes ((array!23340 0))(
  ( (array!23341 (arr!11127 (Array (_ BitVec 32) ValueCell!4517)) (size!11479 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23340)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!393738 (= res!225630 (and (= (size!11479 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11478 _keys!658) (size!11479 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393739 () Bool)

(declare-fun res!225634 () Bool)

(assert (=> b!393739 (=> (not res!225634) (not e!238370))))

(assert (=> b!393739 (= res!225634 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11478 _keys!658))))))

(declare-fun b!393740 () Bool)

(declare-fun e!238373 () Bool)

(declare-fun tp_is_empty!9721 () Bool)

(assert (=> b!393740 (= e!238373 tp_is_empty!9721)))

(declare-fun b!393741 () Bool)

(declare-fun e!238376 () Bool)

(assert (=> b!393741 (= e!238376 (bvslt i!548 (size!11479 _values!506)))))

(declare-datatypes ((tuple2!6486 0))(
  ( (tuple2!6487 (_1!3254 (_ BitVec 64)) (_2!3254 V!14067)) )
))
(declare-datatypes ((List!6335 0))(
  ( (Nil!6332) (Cons!6331 (h!7187 tuple2!6486) (t!11499 List!6335)) )
))
(declare-datatypes ((ListLongMap!5401 0))(
  ( (ListLongMap!5402 (toList!2716 List!6335)) )
))
(declare-fun lt!186459 () ListLongMap!5401)

(declare-fun lt!186458 () ListLongMap!5401)

(assert (=> b!393741 (= lt!186459 lt!186458)))

(declare-fun mapNonEmpty!16179 () Bool)

(declare-fun mapRes!16179 () Bool)

(declare-fun tp!31931 () Bool)

(declare-fun e!238374 () Bool)

(assert (=> mapNonEmpty!16179 (= mapRes!16179 (and tp!31931 e!238374))))

(declare-fun mapValue!16179 () ValueCell!4517)

(declare-fun mapRest!16179 () (Array (_ BitVec 32) ValueCell!4517))

(declare-fun mapKey!16179 () (_ BitVec 32))

(assert (=> mapNonEmpty!16179 (= (arr!11127 _values!506) (store mapRest!16179 mapKey!16179 mapValue!16179))))

(declare-fun mapIsEmpty!16179 () Bool)

(assert (=> mapIsEmpty!16179 mapRes!16179))

(declare-fun res!225635 () Bool)

(assert (=> start!38176 (=> (not res!225635) (not e!238370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38176 (= res!225635 (validMask!0 mask!970))))

(assert (=> start!38176 e!238370))

(declare-fun e!238375 () Bool)

(declare-fun array_inv!8224 (array!23340) Bool)

(assert (=> start!38176 (and (array_inv!8224 _values!506) e!238375)))

(assert (=> start!38176 tp!31932))

(assert (=> start!38176 true))

(assert (=> start!38176 tp_is_empty!9721))

(declare-fun array_inv!8225 (array!23338) Bool)

(assert (=> start!38176 (array_inv!8225 _keys!658)))

(declare-fun b!393742 () Bool)

(declare-fun res!225631 () Bool)

(assert (=> b!393742 (=> (not res!225631) (not e!238370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23338 (_ BitVec 32)) Bool)

(assert (=> b!393742 (= res!225631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393743 () Bool)

(declare-fun e!238371 () Bool)

(assert (=> b!393743 (= e!238370 e!238371)))

(declare-fun res!225636 () Bool)

(assert (=> b!393743 (=> (not res!225636) (not e!238371))))

(declare-fun lt!186465 () array!23338)

(assert (=> b!393743 (= res!225636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186465 mask!970))))

(assert (=> b!393743 (= lt!186465 (array!23339 (store (arr!11126 _keys!658) i!548 k0!778) (size!11478 _keys!658)))))

(declare-fun b!393744 () Bool)

(assert (=> b!393744 (= e!238371 (not e!238376))))

(declare-fun res!225632 () Bool)

(assert (=> b!393744 (=> res!225632 e!238376)))

(declare-fun lt!186466 () Bool)

(assert (=> b!393744 (= res!225632 (or (and (not lt!186466) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186466) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186466)))))

(assert (=> b!393744 (= lt!186466 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14067)

(declare-fun lt!186461 () ListLongMap!5401)

(declare-fun minValue!472 () V!14067)

(declare-fun getCurrentListMap!2089 (array!23338 array!23340 (_ BitVec 32) (_ BitVec 32) V!14067 V!14067 (_ BitVec 32) Int) ListLongMap!5401)

(assert (=> b!393744 (= lt!186461 (getCurrentListMap!2089 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186463 () array!23340)

(assert (=> b!393744 (= lt!186459 (getCurrentListMap!2089 lt!186465 lt!186463 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186460 () ListLongMap!5401)

(assert (=> b!393744 (and (= lt!186458 lt!186460) (= lt!186460 lt!186458))))

(declare-fun v!373 () V!14067)

(declare-fun lt!186464 () ListLongMap!5401)

(declare-fun +!1070 (ListLongMap!5401 tuple2!6486) ListLongMap!5401)

(assert (=> b!393744 (= lt!186460 (+!1070 lt!186464 (tuple2!6487 k0!778 v!373)))))

(declare-datatypes ((Unit!12009 0))(
  ( (Unit!12010) )
))
(declare-fun lt!186462 () Unit!12009)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 (array!23338 array!23340 (_ BitVec 32) (_ BitVec 32) V!14067 V!14067 (_ BitVec 32) (_ BitVec 64) V!14067 (_ BitVec 32) Int) Unit!12009)

(assert (=> b!393744 (= lt!186462 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!280 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!978 (array!23338 array!23340 (_ BitVec 32) (_ BitVec 32) V!14067 V!14067 (_ BitVec 32) Int) ListLongMap!5401)

(assert (=> b!393744 (= lt!186458 (getCurrentListMapNoExtraKeys!978 lt!186465 lt!186463 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393744 (= lt!186463 (array!23341 (store (arr!11127 _values!506) i!548 (ValueCellFull!4517 v!373)) (size!11479 _values!506)))))

(assert (=> b!393744 (= lt!186464 (getCurrentListMapNoExtraKeys!978 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393745 () Bool)

(declare-fun res!225628 () Bool)

(assert (=> b!393745 (=> (not res!225628) (not e!238371))))

(assert (=> b!393745 (= res!225628 (arrayNoDuplicates!0 lt!186465 #b00000000000000000000000000000000 Nil!6331))))

(declare-fun b!393746 () Bool)

(declare-fun res!225626 () Bool)

(assert (=> b!393746 (=> (not res!225626) (not e!238370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393746 (= res!225626 (validKeyInArray!0 k0!778))))

(declare-fun b!393747 () Bool)

(assert (=> b!393747 (= e!238374 tp_is_empty!9721)))

(declare-fun b!393748 () Bool)

(assert (=> b!393748 (= e!238375 (and e!238373 mapRes!16179))))

(declare-fun condMapEmpty!16179 () Bool)

(declare-fun mapDefault!16179 () ValueCell!4517)

(assert (=> b!393748 (= condMapEmpty!16179 (= (arr!11127 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4517)) mapDefault!16179)))))

(assert (= (and start!38176 res!225635) b!393738))

(assert (= (and b!393738 res!225630) b!393742))

(assert (= (and b!393742 res!225631) b!393736))

(assert (= (and b!393736 res!225633) b!393739))

(assert (= (and b!393739 res!225634) b!393746))

(assert (= (and b!393746 res!225626) b!393735))

(assert (= (and b!393735 res!225627) b!393737))

(assert (= (and b!393737 res!225629) b!393743))

(assert (= (and b!393743 res!225636) b!393745))

(assert (= (and b!393745 res!225628) b!393744))

(assert (= (and b!393744 (not res!225632)) b!393741))

(assert (= (and b!393748 condMapEmpty!16179) mapIsEmpty!16179))

(assert (= (and b!393748 (not condMapEmpty!16179)) mapNonEmpty!16179))

(get-info :version)

(assert (= (and mapNonEmpty!16179 ((_ is ValueCellFull!4517) mapValue!16179)) b!393747))

(assert (= (and b!393748 ((_ is ValueCellFull!4517) mapDefault!16179)) b!393740))

(assert (= start!38176 b!393748))

(declare-fun m!390467 () Bool)

(assert (=> mapNonEmpty!16179 m!390467))

(declare-fun m!390469 () Bool)

(assert (=> b!393743 m!390469))

(declare-fun m!390471 () Bool)

(assert (=> b!393743 m!390471))

(declare-fun m!390473 () Bool)

(assert (=> b!393735 m!390473))

(declare-fun m!390475 () Bool)

(assert (=> b!393745 m!390475))

(declare-fun m!390477 () Bool)

(assert (=> b!393742 m!390477))

(declare-fun m!390479 () Bool)

(assert (=> start!38176 m!390479))

(declare-fun m!390481 () Bool)

(assert (=> start!38176 m!390481))

(declare-fun m!390483 () Bool)

(assert (=> start!38176 m!390483))

(declare-fun m!390485 () Bool)

(assert (=> b!393744 m!390485))

(declare-fun m!390487 () Bool)

(assert (=> b!393744 m!390487))

(declare-fun m!390489 () Bool)

(assert (=> b!393744 m!390489))

(declare-fun m!390491 () Bool)

(assert (=> b!393744 m!390491))

(declare-fun m!390493 () Bool)

(assert (=> b!393744 m!390493))

(declare-fun m!390495 () Bool)

(assert (=> b!393744 m!390495))

(declare-fun m!390497 () Bool)

(assert (=> b!393744 m!390497))

(declare-fun m!390499 () Bool)

(assert (=> b!393737 m!390499))

(declare-fun m!390501 () Bool)

(assert (=> b!393736 m!390501))

(declare-fun m!390503 () Bool)

(assert (=> b!393746 m!390503))

(check-sat b_and!16437 (not start!38176) (not b!393737) (not b!393744) (not b!393746) (not b!393742) (not b!393743) (not b!393745) (not b_next!9049) (not mapNonEmpty!16179) tp_is_empty!9721 (not b!393736))
(check-sat b_and!16437 (not b_next!9049))
