; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37504 () Bool)

(assert start!37504)

(declare-fun b_free!8631 () Bool)

(declare-fun b_next!8631 () Bool)

(assert (=> start!37504 (= b_free!8631 (not b_next!8631))))

(declare-fun tp!30608 () Bool)

(declare-fun b_and!15873 () Bool)

(assert (=> start!37504 (= tp!30608 b_and!15873)))

(declare-fun b!382528 () Bool)

(declare-fun e!232449 () Bool)

(declare-fun e!232446 () Bool)

(declare-fun mapRes!15483 () Bool)

(assert (=> b!382528 (= e!232449 (and e!232446 mapRes!15483))))

(declare-fun condMapEmpty!15483 () Bool)

(declare-datatypes ((V!13477 0))(
  ( (V!13478 (val!4684 Int)) )
))
(declare-datatypes ((ValueCell!4296 0))(
  ( (ValueCellFull!4296 (v!6881 V!13477)) (EmptyCell!4296) )
))
(declare-datatypes ((array!22467 0))(
  ( (array!22468 (arr!10702 (Array (_ BitVec 32) ValueCell!4296)) (size!11054 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22467)

(declare-fun mapDefault!15483 () ValueCell!4296)

(assert (=> b!382528 (= condMapEmpty!15483 (= (arr!10702 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4296)) mapDefault!15483)))))

(declare-fun b!382529 () Bool)

(declare-fun res!217600 () Bool)

(declare-fun e!232447 () Bool)

(assert (=> b!382529 (=> (not res!217600) (not e!232447))))

(declare-datatypes ((array!22469 0))(
  ( (array!22470 (arr!10703 (Array (_ BitVec 32) (_ BitVec 64))) (size!11055 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22469)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382529 (= res!217600 (or (= (select (arr!10703 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10703 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382530 () Bool)

(declare-fun e!232451 () Bool)

(declare-fun tp_is_empty!9279 () Bool)

(assert (=> b!382530 (= e!232451 tp_is_empty!9279)))

(declare-fun mapIsEmpty!15483 () Bool)

(assert (=> mapIsEmpty!15483 mapRes!15483))

(declare-fun res!217599 () Bool)

(assert (=> start!37504 (=> (not res!217599) (not e!232447))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37504 (= res!217599 (validMask!0 mask!970))))

(assert (=> start!37504 e!232447))

(declare-fun array_inv!7880 (array!22467) Bool)

(assert (=> start!37504 (and (array_inv!7880 _values!506) e!232449)))

(assert (=> start!37504 tp!30608))

(assert (=> start!37504 true))

(assert (=> start!37504 tp_is_empty!9279))

(declare-fun array_inv!7881 (array!22469) Bool)

(assert (=> start!37504 (array_inv!7881 _keys!658)))

(declare-fun b!382531 () Bool)

(declare-fun res!217602 () Bool)

(assert (=> b!382531 (=> (not res!217602) (not e!232447))))

(assert (=> b!382531 (= res!217602 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11055 _keys!658))))))

(declare-fun mapNonEmpty!15483 () Bool)

(declare-fun tp!30609 () Bool)

(assert (=> mapNonEmpty!15483 (= mapRes!15483 (and tp!30609 e!232451))))

(declare-fun mapValue!15483 () ValueCell!4296)

(declare-fun mapRest!15483 () (Array (_ BitVec 32) ValueCell!4296))

(declare-fun mapKey!15483 () (_ BitVec 32))

(assert (=> mapNonEmpty!15483 (= (arr!10702 _values!506) (store mapRest!15483 mapKey!15483 mapValue!15483))))

(declare-fun b!382532 () Bool)

(declare-fun res!217598 () Bool)

(assert (=> b!382532 (=> (not res!217598) (not e!232447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22469 (_ BitVec 32)) Bool)

(assert (=> b!382532 (= res!217598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382533 () Bool)

(declare-fun res!217595 () Bool)

(assert (=> b!382533 (=> (not res!217595) (not e!232447))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382533 (= res!217595 (and (= (size!11054 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11055 _keys!658) (size!11054 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382534 () Bool)

(declare-fun e!232450 () Bool)

(declare-fun e!232445 () Bool)

(assert (=> b!382534 (= e!232450 (not e!232445))))

(declare-fun res!217601 () Bool)

(assert (=> b!382534 (=> res!217601 e!232445)))

(declare-fun lt!179487 () Bool)

(assert (=> b!382534 (= res!217601 (or (and (not lt!179487) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179487) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179487)))))

(assert (=> b!382534 (= lt!179487 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13477)

(declare-datatypes ((tuple2!6298 0))(
  ( (tuple2!6299 (_1!3160 (_ BitVec 64)) (_2!3160 V!13477)) )
))
(declare-datatypes ((List!6129 0))(
  ( (Nil!6126) (Cons!6125 (h!6981 tuple2!6298) (t!11279 List!6129)) )
))
(declare-datatypes ((ListLongMap!5211 0))(
  ( (ListLongMap!5212 (toList!2621 List!6129)) )
))
(declare-fun lt!179481 () ListLongMap!5211)

(declare-fun minValue!472 () V!13477)

(declare-fun getCurrentListMap!2026 (array!22469 array!22467 (_ BitVec 32) (_ BitVec 32) V!13477 V!13477 (_ BitVec 32) Int) ListLongMap!5211)

(assert (=> b!382534 (= lt!179481 (getCurrentListMap!2026 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179484 () ListLongMap!5211)

(declare-fun lt!179485 () array!22467)

(declare-fun lt!179480 () array!22469)

(assert (=> b!382534 (= lt!179484 (getCurrentListMap!2026 lt!179480 lt!179485 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179479 () ListLongMap!5211)

(declare-fun lt!179486 () ListLongMap!5211)

(assert (=> b!382534 (and (= lt!179479 lt!179486) (= lt!179486 lt!179479))))

(declare-fun v!373 () V!13477)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!179483 () ListLongMap!5211)

(declare-fun +!956 (ListLongMap!5211 tuple2!6298) ListLongMap!5211)

(assert (=> b!382534 (= lt!179486 (+!956 lt!179483 (tuple2!6299 k0!778 v!373)))))

(declare-datatypes ((Unit!11806 0))(
  ( (Unit!11807) )
))
(declare-fun lt!179482 () Unit!11806)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!184 (array!22469 array!22467 (_ BitVec 32) (_ BitVec 32) V!13477 V!13477 (_ BitVec 32) (_ BitVec 64) V!13477 (_ BitVec 32) Int) Unit!11806)

(assert (=> b!382534 (= lt!179482 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!184 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!860 (array!22469 array!22467 (_ BitVec 32) (_ BitVec 32) V!13477 V!13477 (_ BitVec 32) Int) ListLongMap!5211)

(assert (=> b!382534 (= lt!179479 (getCurrentListMapNoExtraKeys!860 lt!179480 lt!179485 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382534 (= lt!179485 (array!22468 (store (arr!10702 _values!506) i!548 (ValueCellFull!4296 v!373)) (size!11054 _values!506)))))

(assert (=> b!382534 (= lt!179483 (getCurrentListMapNoExtraKeys!860 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382535 () Bool)

(assert (=> b!382535 (= e!232446 tp_is_empty!9279)))

(declare-fun b!382536 () Bool)

(assert (=> b!382536 (= e!232447 e!232450)))

(declare-fun res!217597 () Bool)

(assert (=> b!382536 (=> (not res!217597) (not e!232450))))

(assert (=> b!382536 (= res!217597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179480 mask!970))))

(assert (=> b!382536 (= lt!179480 (array!22470 (store (arr!10703 _keys!658) i!548 k0!778) (size!11055 _keys!658)))))

(declare-fun b!382537 () Bool)

(declare-fun res!217604 () Bool)

(assert (=> b!382537 (=> (not res!217604) (not e!232447))))

(declare-datatypes ((List!6130 0))(
  ( (Nil!6127) (Cons!6126 (h!6982 (_ BitVec 64)) (t!11280 List!6130)) )
))
(declare-fun arrayNoDuplicates!0 (array!22469 (_ BitVec 32) List!6130) Bool)

(assert (=> b!382537 (= res!217604 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6127))))

(declare-fun b!382538 () Bool)

(declare-fun res!217596 () Bool)

(assert (=> b!382538 (=> (not res!217596) (not e!232447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382538 (= res!217596 (validKeyInArray!0 k0!778))))

(declare-fun b!382539 () Bool)

(declare-fun res!217594 () Bool)

(assert (=> b!382539 (=> (not res!217594) (not e!232450))))

(assert (=> b!382539 (= res!217594 (arrayNoDuplicates!0 lt!179480 #b00000000000000000000000000000000 Nil!6127))))

(declare-fun b!382540 () Bool)

(declare-fun res!217603 () Bool)

(assert (=> b!382540 (=> (not res!217603) (not e!232447))))

(declare-fun arrayContainsKey!0 (array!22469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382540 (= res!217603 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382541 () Bool)

(assert (=> b!382541 (= e!232445 true)))

(assert (=> b!382541 (= lt!179484 lt!179479)))

(assert (= (and start!37504 res!217599) b!382533))

(assert (= (and b!382533 res!217595) b!382532))

(assert (= (and b!382532 res!217598) b!382537))

(assert (= (and b!382537 res!217604) b!382531))

(assert (= (and b!382531 res!217602) b!382538))

(assert (= (and b!382538 res!217596) b!382529))

(assert (= (and b!382529 res!217600) b!382540))

(assert (= (and b!382540 res!217603) b!382536))

(assert (= (and b!382536 res!217597) b!382539))

(assert (= (and b!382539 res!217594) b!382534))

(assert (= (and b!382534 (not res!217601)) b!382541))

(assert (= (and b!382528 condMapEmpty!15483) mapIsEmpty!15483))

(assert (= (and b!382528 (not condMapEmpty!15483)) mapNonEmpty!15483))

(get-info :version)

(assert (= (and mapNonEmpty!15483 ((_ is ValueCellFull!4296) mapValue!15483)) b!382530))

(assert (= (and b!382528 ((_ is ValueCellFull!4296) mapDefault!15483)) b!382535))

(assert (= start!37504 b!382528))

(declare-fun m!379343 () Bool)

(assert (=> b!382539 m!379343))

(declare-fun m!379345 () Bool)

(assert (=> b!382538 m!379345))

(declare-fun m!379347 () Bool)

(assert (=> b!382529 m!379347))

(declare-fun m!379349 () Bool)

(assert (=> mapNonEmpty!15483 m!379349))

(declare-fun m!379351 () Bool)

(assert (=> b!382534 m!379351))

(declare-fun m!379353 () Bool)

(assert (=> b!382534 m!379353))

(declare-fun m!379355 () Bool)

(assert (=> b!382534 m!379355))

(declare-fun m!379357 () Bool)

(assert (=> b!382534 m!379357))

(declare-fun m!379359 () Bool)

(assert (=> b!382534 m!379359))

(declare-fun m!379361 () Bool)

(assert (=> b!382534 m!379361))

(declare-fun m!379363 () Bool)

(assert (=> b!382534 m!379363))

(declare-fun m!379365 () Bool)

(assert (=> b!382536 m!379365))

(declare-fun m!379367 () Bool)

(assert (=> b!382536 m!379367))

(declare-fun m!379369 () Bool)

(assert (=> b!382540 m!379369))

(declare-fun m!379371 () Bool)

(assert (=> start!37504 m!379371))

(declare-fun m!379373 () Bool)

(assert (=> start!37504 m!379373))

(declare-fun m!379375 () Bool)

(assert (=> start!37504 m!379375))

(declare-fun m!379377 () Bool)

(assert (=> b!382537 m!379377))

(declare-fun m!379379 () Bool)

(assert (=> b!382532 m!379379))

(check-sat (not b!382536) tp_is_empty!9279 (not start!37504) (not b!382539) b_and!15873 (not b!382537) (not b!382534) (not b!382540) (not mapNonEmpty!15483) (not b_next!8631) (not b!382532) (not b!382538))
(check-sat b_and!15873 (not b_next!8631))
