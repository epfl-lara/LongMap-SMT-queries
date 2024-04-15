; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37572 () Bool)

(assert start!37572)

(declare-fun b_free!8713 () Bool)

(declare-fun b_next!8713 () Bool)

(assert (=> start!37572 (= b_free!8713 (not b_next!8713))))

(declare-fun tp!30854 () Bool)

(declare-fun b_and!15929 () Bool)

(assert (=> start!37572 (= tp!30854 b_and!15929)))

(declare-fun b!383988 () Bool)

(declare-fun e!233146 () Bool)

(assert (=> b!383988 (= e!233146 true)))

(declare-datatypes ((V!13587 0))(
  ( (V!13588 (val!4725 Int)) )
))
(declare-datatypes ((tuple2!6340 0))(
  ( (tuple2!6341 (_1!3181 (_ BitVec 64)) (_2!3181 V!13587)) )
))
(declare-datatypes ((List!6163 0))(
  ( (Nil!6160) (Cons!6159 (h!7015 tuple2!6340) (t!11304 List!6163)) )
))
(declare-datatypes ((ListLongMap!5243 0))(
  ( (ListLongMap!5244 (toList!2637 List!6163)) )
))
(declare-fun lt!180509 () ListLongMap!5243)

(declare-fun lt!180510 () ListLongMap!5243)

(declare-fun lt!180518 () tuple2!6340)

(declare-fun +!994 (ListLongMap!5243 tuple2!6340) ListLongMap!5243)

(assert (=> b!383988 (= lt!180509 (+!994 lt!180510 lt!180518))))

(declare-fun lt!180514 () ListLongMap!5243)

(declare-fun lt!180516 () ListLongMap!5243)

(assert (=> b!383988 (= lt!180514 lt!180516)))

(declare-fun mapNonEmpty!15606 () Bool)

(declare-fun mapRes!15606 () Bool)

(declare-fun tp!30855 () Bool)

(declare-fun e!233144 () Bool)

(assert (=> mapNonEmpty!15606 (= mapRes!15606 (and tp!30855 e!233144))))

(declare-datatypes ((ValueCell!4337 0))(
  ( (ValueCellFull!4337 (v!6916 V!13587)) (EmptyCell!4337) )
))
(declare-datatypes ((array!22611 0))(
  ( (array!22612 (arr!10774 (Array (_ BitVec 32) ValueCell!4337)) (size!11127 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22611)

(declare-fun mapKey!15606 () (_ BitVec 32))

(declare-fun mapValue!15606 () ValueCell!4337)

(declare-fun mapRest!15606 () (Array (_ BitVec 32) ValueCell!4337))

(assert (=> mapNonEmpty!15606 (= (arr!10774 _values!506) (store mapRest!15606 mapKey!15606 mapValue!15606))))

(declare-fun b!383989 () Bool)

(declare-fun res!218827 () Bool)

(declare-fun e!233147 () Bool)

(assert (=> b!383989 (=> (not res!218827) (not e!233147))))

(declare-datatypes ((array!22613 0))(
  ( (array!22614 (arr!10775 (Array (_ BitVec 32) (_ BitVec 64))) (size!11128 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22613)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383989 (= res!218827 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383990 () Bool)

(declare-fun tp_is_empty!9361 () Bool)

(assert (=> b!383990 (= e!233144 tp_is_empty!9361)))

(declare-fun b!383991 () Bool)

(declare-fun res!218828 () Bool)

(assert (=> b!383991 (=> (not res!218828) (not e!233147))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383991 (= res!218828 (or (= (select (arr!10775 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10775 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!218829 () Bool)

(assert (=> start!37572 (=> (not res!218829) (not e!233147))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37572 (= res!218829 (validMask!0 mask!970))))

(assert (=> start!37572 e!233147))

(declare-fun e!233142 () Bool)

(declare-fun array_inv!7932 (array!22611) Bool)

(assert (=> start!37572 (and (array_inv!7932 _values!506) e!233142)))

(assert (=> start!37572 tp!30854))

(assert (=> start!37572 true))

(assert (=> start!37572 tp_is_empty!9361))

(declare-fun array_inv!7933 (array!22613) Bool)

(assert (=> start!37572 (array_inv!7933 _keys!658)))

(declare-fun b!383992 () Bool)

(declare-fun e!233145 () Bool)

(assert (=> b!383992 (= e!233147 e!233145)))

(declare-fun res!218837 () Bool)

(assert (=> b!383992 (=> (not res!218837) (not e!233145))))

(declare-fun lt!180515 () array!22613)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22613 (_ BitVec 32)) Bool)

(assert (=> b!383992 (= res!218837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180515 mask!970))))

(assert (=> b!383992 (= lt!180515 (array!22614 (store (arr!10775 _keys!658) i!548 k0!778) (size!11128 _keys!658)))))

(declare-fun b!383993 () Bool)

(declare-fun e!233141 () Bool)

(assert (=> b!383993 (= e!233142 (and e!233141 mapRes!15606))))

(declare-fun condMapEmpty!15606 () Bool)

(declare-fun mapDefault!15606 () ValueCell!4337)

(assert (=> b!383993 (= condMapEmpty!15606 (= (arr!10774 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4337)) mapDefault!15606)))))

(declare-fun mapIsEmpty!15606 () Bool)

(assert (=> mapIsEmpty!15606 mapRes!15606))

(declare-fun b!383994 () Bool)

(declare-fun res!218834 () Bool)

(assert (=> b!383994 (=> (not res!218834) (not e!233147))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383994 (= res!218834 (and (= (size!11127 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11128 _keys!658) (size!11127 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383995 () Bool)

(assert (=> b!383995 (= e!233141 tp_is_empty!9361)))

(declare-fun b!383996 () Bool)

(declare-fun res!218835 () Bool)

(assert (=> b!383996 (=> (not res!218835) (not e!233145))))

(declare-datatypes ((List!6164 0))(
  ( (Nil!6161) (Cons!6160 (h!7016 (_ BitVec 64)) (t!11305 List!6164)) )
))
(declare-fun arrayNoDuplicates!0 (array!22613 (_ BitVec 32) List!6164) Bool)

(assert (=> b!383996 (= res!218835 (arrayNoDuplicates!0 lt!180515 #b00000000000000000000000000000000 Nil!6161))))

(declare-fun b!383997 () Bool)

(declare-fun res!218833 () Bool)

(assert (=> b!383997 (=> (not res!218833) (not e!233147))))

(assert (=> b!383997 (= res!218833 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11128 _keys!658))))))

(declare-fun b!383998 () Bool)

(assert (=> b!383998 (= e!233145 (not e!233146))))

(declare-fun res!218830 () Bool)

(assert (=> b!383998 (=> res!218830 e!233146)))

(declare-fun lt!180513 () Bool)

(assert (=> b!383998 (= res!218830 (or (and (not lt!180513) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180513) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180513)))))

(assert (=> b!383998 (= lt!180513 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13587)

(declare-fun minValue!472 () V!13587)

(declare-fun getCurrentListMap!2015 (array!22613 array!22611 (_ BitVec 32) (_ BitVec 32) V!13587 V!13587 (_ BitVec 32) Int) ListLongMap!5243)

(assert (=> b!383998 (= lt!180510 (getCurrentListMap!2015 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180519 () array!22611)

(assert (=> b!383998 (= lt!180514 (getCurrentListMap!2015 lt!180515 lt!180519 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180517 () ListLongMap!5243)

(assert (=> b!383998 (and (= lt!180516 lt!180517) (= lt!180517 lt!180516))))

(declare-fun lt!180512 () ListLongMap!5243)

(assert (=> b!383998 (= lt!180517 (+!994 lt!180512 lt!180518))))

(declare-fun v!373 () V!13587)

(assert (=> b!383998 (= lt!180518 (tuple2!6341 k0!778 v!373))))

(declare-datatypes ((Unit!11836 0))(
  ( (Unit!11837) )
))
(declare-fun lt!180511 () Unit!11836)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!208 (array!22613 array!22611 (_ BitVec 32) (_ BitVec 32) V!13587 V!13587 (_ BitVec 32) (_ BitVec 64) V!13587 (_ BitVec 32) Int) Unit!11836)

(assert (=> b!383998 (= lt!180511 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!208 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!880 (array!22613 array!22611 (_ BitVec 32) (_ BitVec 32) V!13587 V!13587 (_ BitVec 32) Int) ListLongMap!5243)

(assert (=> b!383998 (= lt!180516 (getCurrentListMapNoExtraKeys!880 lt!180515 lt!180519 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383998 (= lt!180519 (array!22612 (store (arr!10774 _values!506) i!548 (ValueCellFull!4337 v!373)) (size!11127 _values!506)))))

(assert (=> b!383998 (= lt!180512 (getCurrentListMapNoExtraKeys!880 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383999 () Bool)

(declare-fun res!218836 () Bool)

(assert (=> b!383999 (=> (not res!218836) (not e!233147))))

(assert (=> b!383999 (= res!218836 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6161))))

(declare-fun b!384000 () Bool)

(declare-fun res!218831 () Bool)

(assert (=> b!384000 (=> (not res!218831) (not e!233147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384000 (= res!218831 (validKeyInArray!0 k0!778))))

(declare-fun b!384001 () Bool)

(declare-fun res!218832 () Bool)

(assert (=> b!384001 (=> (not res!218832) (not e!233147))))

(assert (=> b!384001 (= res!218832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37572 res!218829) b!383994))

(assert (= (and b!383994 res!218834) b!384001))

(assert (= (and b!384001 res!218832) b!383999))

(assert (= (and b!383999 res!218836) b!383997))

(assert (= (and b!383997 res!218833) b!384000))

(assert (= (and b!384000 res!218831) b!383991))

(assert (= (and b!383991 res!218828) b!383989))

(assert (= (and b!383989 res!218827) b!383992))

(assert (= (and b!383992 res!218837) b!383996))

(assert (= (and b!383996 res!218835) b!383998))

(assert (= (and b!383998 (not res!218830)) b!383988))

(assert (= (and b!383993 condMapEmpty!15606) mapIsEmpty!15606))

(assert (= (and b!383993 (not condMapEmpty!15606)) mapNonEmpty!15606))

(get-info :version)

(assert (= (and mapNonEmpty!15606 ((_ is ValueCellFull!4337) mapValue!15606)) b!383990))

(assert (= (and b!383993 ((_ is ValueCellFull!4337) mapDefault!15606)) b!383995))

(assert (= start!37572 b!383993))

(declare-fun m!380231 () Bool)

(assert (=> b!384000 m!380231))

(declare-fun m!380233 () Bool)

(assert (=> start!37572 m!380233))

(declare-fun m!380235 () Bool)

(assert (=> start!37572 m!380235))

(declare-fun m!380237 () Bool)

(assert (=> start!37572 m!380237))

(declare-fun m!380239 () Bool)

(assert (=> b!383999 m!380239))

(declare-fun m!380241 () Bool)

(assert (=> b!383991 m!380241))

(declare-fun m!380243 () Bool)

(assert (=> mapNonEmpty!15606 m!380243))

(declare-fun m!380245 () Bool)

(assert (=> b!383996 m!380245))

(declare-fun m!380247 () Bool)

(assert (=> b!383989 m!380247))

(declare-fun m!380249 () Bool)

(assert (=> b!383998 m!380249))

(declare-fun m!380251 () Bool)

(assert (=> b!383998 m!380251))

(declare-fun m!380253 () Bool)

(assert (=> b!383998 m!380253))

(declare-fun m!380255 () Bool)

(assert (=> b!383998 m!380255))

(declare-fun m!380257 () Bool)

(assert (=> b!383998 m!380257))

(declare-fun m!380259 () Bool)

(assert (=> b!383998 m!380259))

(declare-fun m!380261 () Bool)

(assert (=> b!383998 m!380261))

(declare-fun m!380263 () Bool)

(assert (=> b!384001 m!380263))

(declare-fun m!380265 () Bool)

(assert (=> b!383988 m!380265))

(declare-fun m!380267 () Bool)

(assert (=> b!383992 m!380267))

(declare-fun m!380269 () Bool)

(assert (=> b!383992 m!380269))

(check-sat (not b!383998) tp_is_empty!9361 (not b!383999) (not mapNonEmpty!15606) (not start!37572) b_and!15929 (not b!383989) (not b!384000) (not b!383988) (not b_next!8713) (not b!383992) (not b!383996) (not b!384001))
(check-sat b_and!15929 (not b_next!8713))
