; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37500 () Bool)

(assert start!37500)

(declare-fun b_free!8641 () Bool)

(declare-fun b_next!8641 () Bool)

(assert (=> start!37500 (= b_free!8641 (not b_next!8641))))

(declare-fun tp!30639 () Bool)

(declare-fun b_and!15857 () Bool)

(assert (=> start!37500 (= tp!30639 b_and!15857)))

(declare-fun res!217638 () Bool)

(declare-fun e!232377 () Bool)

(assert (=> start!37500 (=> (not res!217638) (not e!232377))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37500 (= res!217638 (validMask!0 mask!970))))

(assert (=> start!37500 e!232377))

(declare-datatypes ((V!13491 0))(
  ( (V!13492 (val!4689 Int)) )
))
(declare-datatypes ((ValueCell!4301 0))(
  ( (ValueCellFull!4301 (v!6880 V!13491)) (EmptyCell!4301) )
))
(declare-datatypes ((array!22473 0))(
  ( (array!22474 (arr!10705 (Array (_ BitVec 32) ValueCell!4301)) (size!11058 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22473)

(declare-fun e!232379 () Bool)

(declare-fun array_inv!7884 (array!22473) Bool)

(assert (=> start!37500 (and (array_inv!7884 _values!506) e!232379)))

(assert (=> start!37500 tp!30639))

(assert (=> start!37500 true))

(declare-fun tp_is_empty!9289 () Bool)

(assert (=> start!37500 tp_is_empty!9289))

(declare-datatypes ((array!22475 0))(
  ( (array!22476 (arr!10706 (Array (_ BitVec 32) (_ BitVec 64))) (size!11059 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22475)

(declare-fun array_inv!7885 (array!22475) Bool)

(assert (=> start!37500 (array_inv!7885 _keys!658)))

(declare-fun b!382467 () Bool)

(declare-fun e!232382 () Bool)

(declare-fun e!232378 () Bool)

(assert (=> b!382467 (= e!232382 (not e!232378))))

(declare-fun res!217632 () Bool)

(assert (=> b!382467 (=> res!217632 e!232378)))

(declare-fun lt!179382 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382467 (= res!217632 (or (and (not lt!179382) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179382) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179382)))))

(assert (=> b!382467 (= lt!179382 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6282 0))(
  ( (tuple2!6283 (_1!3152 (_ BitVec 64)) (_2!3152 V!13491)) )
))
(declare-datatypes ((List!6108 0))(
  ( (Nil!6105) (Cons!6104 (h!6960 tuple2!6282) (t!11249 List!6108)) )
))
(declare-datatypes ((ListLongMap!5185 0))(
  ( (ListLongMap!5186 (toList!2608 List!6108)) )
))
(declare-fun lt!179384 () ListLongMap!5185)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13491)

(declare-fun minValue!472 () V!13491)

(declare-fun getCurrentListMap!1993 (array!22475 array!22473 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) Int) ListLongMap!5185)

(assert (=> b!382467 (= lt!179384 (getCurrentListMap!1993 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179385 () array!22475)

(declare-fun lt!179386 () array!22473)

(declare-fun lt!179388 () ListLongMap!5185)

(assert (=> b!382467 (= lt!179388 (getCurrentListMap!1993 lt!179385 lt!179386 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179380 () ListLongMap!5185)

(declare-fun lt!179381 () ListLongMap!5185)

(assert (=> b!382467 (and (= lt!179380 lt!179381) (= lt!179381 lt!179380))))

(declare-fun v!373 () V!13491)

(declare-fun lt!179383 () ListLongMap!5185)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!967 (ListLongMap!5185 tuple2!6282) ListLongMap!5185)

(assert (=> b!382467 (= lt!179381 (+!967 lt!179383 (tuple2!6283 k0!778 v!373)))))

(declare-datatypes ((Unit!11792 0))(
  ( (Unit!11793) )
))
(declare-fun lt!179387 () Unit!11792)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!186 (array!22475 array!22473 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) (_ BitVec 64) V!13491 (_ BitVec 32) Int) Unit!11792)

(assert (=> b!382467 (= lt!179387 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!186 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!858 (array!22475 array!22473 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) Int) ListLongMap!5185)

(assert (=> b!382467 (= lt!179380 (getCurrentListMapNoExtraKeys!858 lt!179385 lt!179386 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382467 (= lt!179386 (array!22474 (store (arr!10705 _values!506) i!548 (ValueCellFull!4301 v!373)) (size!11058 _values!506)))))

(assert (=> b!382467 (= lt!179383 (getCurrentListMapNoExtraKeys!858 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382468 () Bool)

(declare-fun e!232376 () Bool)

(declare-fun mapRes!15498 () Bool)

(assert (=> b!382468 (= e!232379 (and e!232376 mapRes!15498))))

(declare-fun condMapEmpty!15498 () Bool)

(declare-fun mapDefault!15498 () ValueCell!4301)

(assert (=> b!382468 (= condMapEmpty!15498 (= (arr!10705 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4301)) mapDefault!15498)))))

(declare-fun mapIsEmpty!15498 () Bool)

(assert (=> mapIsEmpty!15498 mapRes!15498))

(declare-fun b!382469 () Bool)

(declare-fun e!232380 () Bool)

(assert (=> b!382469 (= e!232380 tp_is_empty!9289)))

(declare-fun b!382470 () Bool)

(assert (=> b!382470 (= e!232376 tp_is_empty!9289)))

(declare-fun b!382471 () Bool)

(declare-fun res!217633 () Bool)

(assert (=> b!382471 (=> (not res!217633) (not e!232377))))

(declare-fun arrayContainsKey!0 (array!22475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382471 (= res!217633 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382472 () Bool)

(declare-fun res!217631 () Bool)

(assert (=> b!382472 (=> (not res!217631) (not e!232377))))

(assert (=> b!382472 (= res!217631 (and (= (size!11058 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11059 _keys!658) (size!11058 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382473 () Bool)

(assert (=> b!382473 (= e!232377 e!232382)))

(declare-fun res!217637 () Bool)

(assert (=> b!382473 (=> (not res!217637) (not e!232382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22475 (_ BitVec 32)) Bool)

(assert (=> b!382473 (= res!217637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179385 mask!970))))

(assert (=> b!382473 (= lt!179385 (array!22476 (store (arr!10706 _keys!658) i!548 k0!778) (size!11059 _keys!658)))))

(declare-fun b!382474 () Bool)

(declare-fun res!217640 () Bool)

(assert (=> b!382474 (=> (not res!217640) (not e!232377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382474 (= res!217640 (validKeyInArray!0 k0!778))))

(declare-fun b!382475 () Bool)

(declare-fun res!217634 () Bool)

(assert (=> b!382475 (=> (not res!217634) (not e!232382))))

(declare-datatypes ((List!6109 0))(
  ( (Nil!6106) (Cons!6105 (h!6961 (_ BitVec 64)) (t!11250 List!6109)) )
))
(declare-fun arrayNoDuplicates!0 (array!22475 (_ BitVec 32) List!6109) Bool)

(assert (=> b!382475 (= res!217634 (arrayNoDuplicates!0 lt!179385 #b00000000000000000000000000000000 Nil!6106))))

(declare-fun mapNonEmpty!15498 () Bool)

(declare-fun tp!30638 () Bool)

(assert (=> mapNonEmpty!15498 (= mapRes!15498 (and tp!30638 e!232380))))

(declare-fun mapValue!15498 () ValueCell!4301)

(declare-fun mapKey!15498 () (_ BitVec 32))

(declare-fun mapRest!15498 () (Array (_ BitVec 32) ValueCell!4301))

(assert (=> mapNonEmpty!15498 (= (arr!10705 _values!506) (store mapRest!15498 mapKey!15498 mapValue!15498))))

(declare-fun b!382476 () Bool)

(declare-fun res!217636 () Bool)

(assert (=> b!382476 (=> (not res!217636) (not e!232377))))

(assert (=> b!382476 (= res!217636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382477 () Bool)

(declare-fun res!217630 () Bool)

(assert (=> b!382477 (=> (not res!217630) (not e!232377))))

(assert (=> b!382477 (= res!217630 (or (= (select (arr!10706 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10706 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382478 () Bool)

(declare-fun res!217635 () Bool)

(assert (=> b!382478 (=> (not res!217635) (not e!232377))))

(assert (=> b!382478 (= res!217635 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11059 _keys!658))))))

(declare-fun b!382479 () Bool)

(declare-fun res!217639 () Bool)

(assert (=> b!382479 (=> (not res!217639) (not e!232377))))

(assert (=> b!382479 (= res!217639 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6106))))

(declare-fun b!382480 () Bool)

(assert (=> b!382480 (= e!232378 true)))

(assert (=> b!382480 (= lt!179388 lt!179380)))

(assert (= (and start!37500 res!217638) b!382472))

(assert (= (and b!382472 res!217631) b!382476))

(assert (= (and b!382476 res!217636) b!382479))

(assert (= (and b!382479 res!217639) b!382478))

(assert (= (and b!382478 res!217635) b!382474))

(assert (= (and b!382474 res!217640) b!382477))

(assert (= (and b!382477 res!217630) b!382471))

(assert (= (and b!382471 res!217633) b!382473))

(assert (= (and b!382473 res!217637) b!382475))

(assert (= (and b!382475 res!217634) b!382467))

(assert (= (and b!382467 (not res!217632)) b!382480))

(assert (= (and b!382468 condMapEmpty!15498) mapIsEmpty!15498))

(assert (= (and b!382468 (not condMapEmpty!15498)) mapNonEmpty!15498))

(get-info :version)

(assert (= (and mapNonEmpty!15498 ((_ is ValueCellFull!4301) mapValue!15498)) b!382469))

(assert (= (and b!382468 ((_ is ValueCellFull!4301) mapDefault!15498)) b!382470))

(assert (= start!37500 b!382468))

(declare-fun m!378809 () Bool)

(assert (=> b!382473 m!378809))

(declare-fun m!378811 () Bool)

(assert (=> b!382473 m!378811))

(declare-fun m!378813 () Bool)

(assert (=> b!382467 m!378813))

(declare-fun m!378815 () Bool)

(assert (=> b!382467 m!378815))

(declare-fun m!378817 () Bool)

(assert (=> b!382467 m!378817))

(declare-fun m!378819 () Bool)

(assert (=> b!382467 m!378819))

(declare-fun m!378821 () Bool)

(assert (=> b!382467 m!378821))

(declare-fun m!378823 () Bool)

(assert (=> b!382467 m!378823))

(declare-fun m!378825 () Bool)

(assert (=> b!382467 m!378825))

(declare-fun m!378827 () Bool)

(assert (=> b!382477 m!378827))

(declare-fun m!378829 () Bool)

(assert (=> start!37500 m!378829))

(declare-fun m!378831 () Bool)

(assert (=> start!37500 m!378831))

(declare-fun m!378833 () Bool)

(assert (=> start!37500 m!378833))

(declare-fun m!378835 () Bool)

(assert (=> b!382475 m!378835))

(declare-fun m!378837 () Bool)

(assert (=> b!382476 m!378837))

(declare-fun m!378839 () Bool)

(assert (=> b!382471 m!378839))

(declare-fun m!378841 () Bool)

(assert (=> b!382479 m!378841))

(declare-fun m!378843 () Bool)

(assert (=> mapNonEmpty!15498 m!378843))

(declare-fun m!378845 () Bool)

(assert (=> b!382474 m!378845))

(check-sat (not mapNonEmpty!15498) (not b!382474) (not b_next!8641) (not b!382473) (not b!382479) (not b!382476) (not start!37500) (not b!382475) (not b!382471) (not b!382467) tp_is_empty!9289 b_and!15857)
(check-sat b_and!15857 (not b_next!8641))
