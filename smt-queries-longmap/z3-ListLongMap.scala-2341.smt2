; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37494 () Bool)

(assert start!37494)

(declare-fun b_free!8635 () Bool)

(declare-fun b_next!8635 () Bool)

(assert (=> start!37494 (= b_free!8635 (not b_next!8635))))

(declare-fun tp!30620 () Bool)

(declare-fun b_and!15891 () Bool)

(assert (=> start!37494 (= tp!30620 b_and!15891)))

(declare-fun b!382563 () Bool)

(declare-fun res!217667 () Bool)

(declare-fun e!232455 () Bool)

(assert (=> b!382563 (=> (not res!217667) (not e!232455))))

(declare-datatypes ((array!22464 0))(
  ( (array!22465 (arr!10700 (Array (_ BitVec 32) (_ BitVec 64))) (size!11052 (_ BitVec 32))) )
))
(declare-fun lt!179558 () array!22464)

(declare-datatypes ((List!6014 0))(
  ( (Nil!6011) (Cons!6010 (h!6866 (_ BitVec 64)) (t!11156 List!6014)) )
))
(declare-fun arrayNoDuplicates!0 (array!22464 (_ BitVec 32) List!6014) Bool)

(assert (=> b!382563 (= res!217667 (arrayNoDuplicates!0 lt!179558 #b00000000000000000000000000000000 Nil!6011))))

(declare-fun b!382565 () Bool)

(declare-fun e!232461 () Bool)

(declare-fun tp_is_empty!9283 () Bool)

(assert (=> b!382565 (= e!232461 tp_is_empty!9283)))

(declare-fun mapIsEmpty!15489 () Bool)

(declare-fun mapRes!15489 () Bool)

(assert (=> mapIsEmpty!15489 mapRes!15489))

(declare-fun b!382566 () Bool)

(declare-fun e!232457 () Bool)

(assert (=> b!382566 (= e!232455 (not e!232457))))

(declare-fun res!217664 () Bool)

(assert (=> b!382566 (=> res!217664 e!232457)))

(declare-fun lt!179552 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382566 (= res!217664 (or (and (not lt!179552) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179552) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179552)))))

(assert (=> b!382566 (= lt!179552 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13483 0))(
  ( (V!13484 (val!4686 Int)) )
))
(declare-datatypes ((ValueCell!4298 0))(
  ( (ValueCellFull!4298 (v!6884 V!13483)) (EmptyCell!4298) )
))
(declare-datatypes ((array!22466 0))(
  ( (array!22467 (arr!10701 (Array (_ BitVec 32) ValueCell!4298)) (size!11053 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22466)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13483)

(declare-datatypes ((tuple2!6178 0))(
  ( (tuple2!6179 (_1!3100 (_ BitVec 64)) (_2!3100 V!13483)) )
))
(declare-datatypes ((List!6015 0))(
  ( (Nil!6012) (Cons!6011 (h!6867 tuple2!6178) (t!11157 List!6015)) )
))
(declare-datatypes ((ListLongMap!5093 0))(
  ( (ListLongMap!5094 (toList!2562 List!6015)) )
))
(declare-fun lt!179555 () ListLongMap!5093)

(declare-fun _keys!658 () array!22464)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13483)

(declare-fun getCurrentListMap!1997 (array!22464 array!22466 (_ BitVec 32) (_ BitVec 32) V!13483 V!13483 (_ BitVec 32) Int) ListLongMap!5093)

(assert (=> b!382566 (= lt!179555 (getCurrentListMap!1997 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179560 () ListLongMap!5093)

(declare-fun lt!179559 () array!22466)

(assert (=> b!382566 (= lt!179560 (getCurrentListMap!1997 lt!179558 lt!179559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179553 () ListLongMap!5093)

(declare-fun lt!179557 () ListLongMap!5093)

(assert (=> b!382566 (and (= lt!179553 lt!179557) (= lt!179557 lt!179553))))

(declare-fun v!373 () V!13483)

(declare-fun lt!179556 () ListLongMap!5093)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!955 (ListLongMap!5093 tuple2!6178) ListLongMap!5093)

(assert (=> b!382566 (= lt!179557 (+!955 lt!179556 (tuple2!6179 k0!778 v!373)))))

(declare-datatypes ((Unit!11789 0))(
  ( (Unit!11790) )
))
(declare-fun lt!179554 () Unit!11789)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!184 (array!22464 array!22466 (_ BitVec 32) (_ BitVec 32) V!13483 V!13483 (_ BitVec 32) (_ BitVec 64) V!13483 (_ BitVec 32) Int) Unit!11789)

(assert (=> b!382566 (= lt!179554 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!184 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!844 (array!22464 array!22466 (_ BitVec 32) (_ BitVec 32) V!13483 V!13483 (_ BitVec 32) Int) ListLongMap!5093)

(assert (=> b!382566 (= lt!179553 (getCurrentListMapNoExtraKeys!844 lt!179558 lt!179559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382566 (= lt!179559 (array!22467 (store (arr!10701 _values!506) i!548 (ValueCellFull!4298 v!373)) (size!11053 _values!506)))))

(assert (=> b!382566 (= lt!179556 (getCurrentListMapNoExtraKeys!844 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382567 () Bool)

(declare-fun res!217661 () Bool)

(declare-fun e!232460 () Bool)

(assert (=> b!382567 (=> (not res!217661) (not e!232460))))

(assert (=> b!382567 (= res!217661 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11052 _keys!658))))))

(declare-fun b!382568 () Bool)

(declare-fun e!232458 () Bool)

(declare-fun e!232456 () Bool)

(assert (=> b!382568 (= e!232458 (and e!232456 mapRes!15489))))

(declare-fun condMapEmpty!15489 () Bool)

(declare-fun mapDefault!15489 () ValueCell!4298)

(assert (=> b!382568 (= condMapEmpty!15489 (= (arr!10701 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4298)) mapDefault!15489)))))

(declare-fun b!382569 () Bool)

(declare-fun res!217657 () Bool)

(assert (=> b!382569 (=> (not res!217657) (not e!232460))))

(assert (=> b!382569 (= res!217657 (or (= (select (arr!10700 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10700 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382570 () Bool)

(declare-fun res!217660 () Bool)

(assert (=> b!382570 (=> (not res!217660) (not e!232460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382570 (= res!217660 (validKeyInArray!0 k0!778))))

(declare-fun b!382571 () Bool)

(declare-fun res!217666 () Bool)

(assert (=> b!382571 (=> (not res!217666) (not e!232460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22464 (_ BitVec 32)) Bool)

(assert (=> b!382571 (= res!217666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382572 () Bool)

(declare-fun res!217662 () Bool)

(assert (=> b!382572 (=> (not res!217662) (not e!232460))))

(declare-fun arrayContainsKey!0 (array!22464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382572 (= res!217662 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!217659 () Bool)

(assert (=> start!37494 (=> (not res!217659) (not e!232460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37494 (= res!217659 (validMask!0 mask!970))))

(assert (=> start!37494 e!232460))

(declare-fun array_inv!7922 (array!22466) Bool)

(assert (=> start!37494 (and (array_inv!7922 _values!506) e!232458)))

(assert (=> start!37494 tp!30620))

(assert (=> start!37494 true))

(assert (=> start!37494 tp_is_empty!9283))

(declare-fun array_inv!7923 (array!22464) Bool)

(assert (=> start!37494 (array_inv!7923 _keys!658)))

(declare-fun b!382564 () Bool)

(assert (=> b!382564 (= e!232457 true)))

(assert (=> b!382564 (= lt!179560 lt!179553)))

(declare-fun b!382573 () Bool)

(assert (=> b!382573 (= e!232460 e!232455)))

(declare-fun res!217665 () Bool)

(assert (=> b!382573 (=> (not res!217665) (not e!232455))))

(assert (=> b!382573 (= res!217665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179558 mask!970))))

(assert (=> b!382573 (= lt!179558 (array!22465 (store (arr!10700 _keys!658) i!548 k0!778) (size!11052 _keys!658)))))

(declare-fun mapNonEmpty!15489 () Bool)

(declare-fun tp!30621 () Bool)

(assert (=> mapNonEmpty!15489 (= mapRes!15489 (and tp!30621 e!232461))))

(declare-fun mapKey!15489 () (_ BitVec 32))

(declare-fun mapValue!15489 () ValueCell!4298)

(declare-fun mapRest!15489 () (Array (_ BitVec 32) ValueCell!4298))

(assert (=> mapNonEmpty!15489 (= (arr!10701 _values!506) (store mapRest!15489 mapKey!15489 mapValue!15489))))

(declare-fun b!382574 () Bool)

(assert (=> b!382574 (= e!232456 tp_is_empty!9283)))

(declare-fun b!382575 () Bool)

(declare-fun res!217658 () Bool)

(assert (=> b!382575 (=> (not res!217658) (not e!232460))))

(assert (=> b!382575 (= res!217658 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6011))))

(declare-fun b!382576 () Bool)

(declare-fun res!217663 () Bool)

(assert (=> b!382576 (=> (not res!217663) (not e!232460))))

(assert (=> b!382576 (= res!217663 (and (= (size!11053 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11052 _keys!658) (size!11053 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37494 res!217659) b!382576))

(assert (= (and b!382576 res!217663) b!382571))

(assert (= (and b!382571 res!217666) b!382575))

(assert (= (and b!382575 res!217658) b!382567))

(assert (= (and b!382567 res!217661) b!382570))

(assert (= (and b!382570 res!217660) b!382569))

(assert (= (and b!382569 res!217657) b!382572))

(assert (= (and b!382572 res!217662) b!382573))

(assert (= (and b!382573 res!217665) b!382563))

(assert (= (and b!382563 res!217667) b!382566))

(assert (= (and b!382566 (not res!217664)) b!382564))

(assert (= (and b!382568 condMapEmpty!15489) mapIsEmpty!15489))

(assert (= (and b!382568 (not condMapEmpty!15489)) mapNonEmpty!15489))

(get-info :version)

(assert (= (and mapNonEmpty!15489 ((_ is ValueCellFull!4298) mapValue!15489)) b!382565))

(assert (= (and b!382568 ((_ is ValueCellFull!4298) mapDefault!15489)) b!382574))

(assert (= start!37494 b!382568))

(declare-fun m!379649 () Bool)

(assert (=> b!382575 m!379649))

(declare-fun m!379651 () Bool)

(assert (=> b!382566 m!379651))

(declare-fun m!379653 () Bool)

(assert (=> b!382566 m!379653))

(declare-fun m!379655 () Bool)

(assert (=> b!382566 m!379655))

(declare-fun m!379657 () Bool)

(assert (=> b!382566 m!379657))

(declare-fun m!379659 () Bool)

(assert (=> b!382566 m!379659))

(declare-fun m!379661 () Bool)

(assert (=> b!382566 m!379661))

(declare-fun m!379663 () Bool)

(assert (=> b!382566 m!379663))

(declare-fun m!379665 () Bool)

(assert (=> mapNonEmpty!15489 m!379665))

(declare-fun m!379667 () Bool)

(assert (=> b!382571 m!379667))

(declare-fun m!379669 () Bool)

(assert (=> b!382572 m!379669))

(declare-fun m!379671 () Bool)

(assert (=> start!37494 m!379671))

(declare-fun m!379673 () Bool)

(assert (=> start!37494 m!379673))

(declare-fun m!379675 () Bool)

(assert (=> start!37494 m!379675))

(declare-fun m!379677 () Bool)

(assert (=> b!382569 m!379677))

(declare-fun m!379679 () Bool)

(assert (=> b!382570 m!379679))

(declare-fun m!379681 () Bool)

(assert (=> b!382563 m!379681))

(declare-fun m!379683 () Bool)

(assert (=> b!382573 m!379683))

(declare-fun m!379685 () Bool)

(assert (=> b!382573 m!379685))

(check-sat b_and!15891 (not b!382570) (not mapNonEmpty!15489) (not b!382575) (not b!382573) (not b!382571) (not b!382572) tp_is_empty!9283 (not b!382566) (not b!382563) (not b_next!8635) (not start!37494))
(check-sat b_and!15891 (not b_next!8635))
