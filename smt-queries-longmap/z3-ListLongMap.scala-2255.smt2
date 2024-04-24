; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36978 () Bool)

(assert start!36978)

(declare-fun b_free!8119 () Bool)

(declare-fun b_next!8119 () Bool)

(assert (=> start!36978 (= b_free!8119 (not b_next!8119))))

(declare-fun tp!29072 () Bool)

(declare-fun b_and!15375 () Bool)

(assert (=> start!36978 (= tp!29072 b_and!15375)))

(declare-fun res!208728 () Bool)

(declare-fun e!226653 () Bool)

(assert (=> start!36978 (=> (not res!208728) (not e!226653))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36978 (= res!208728 (validMask!0 mask!970))))

(assert (=> start!36978 e!226653))

(declare-datatypes ((V!12795 0))(
  ( (V!12796 (val!4428 Int)) )
))
(declare-datatypes ((ValueCell!4040 0))(
  ( (ValueCellFull!4040 (v!6626 V!12795)) (EmptyCell!4040) )
))
(declare-datatypes ((array!21460 0))(
  ( (array!21461 (arr!10198 (Array (_ BitVec 32) ValueCell!4040)) (size!10550 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21460)

(declare-fun e!226649 () Bool)

(declare-fun array_inv!7560 (array!21460) Bool)

(assert (=> start!36978 (and (array_inv!7560 _values!506) e!226649)))

(assert (=> start!36978 tp!29072))

(assert (=> start!36978 true))

(declare-fun tp_is_empty!8767 () Bool)

(assert (=> start!36978 tp_is_empty!8767))

(declare-datatypes ((array!21462 0))(
  ( (array!21463 (arr!10199 (Array (_ BitVec 32) (_ BitVec 64))) (size!10551 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21462)

(declare-fun array_inv!7561 (array!21462) Bool)

(assert (=> start!36978 (array_inv!7561 _keys!658)))

(declare-fun b!371311 () Bool)

(declare-fun res!208731 () Bool)

(declare-fun e!226652 () Bool)

(assert (=> b!371311 (=> (not res!208731) (not e!226652))))

(declare-fun lt!170278 () array!21462)

(declare-datatypes ((List!5611 0))(
  ( (Nil!5608) (Cons!5607 (h!6463 (_ BitVec 64)) (t!10753 List!5611)) )
))
(declare-fun arrayNoDuplicates!0 (array!21462 (_ BitVec 32) List!5611) Bool)

(assert (=> b!371311 (= res!208731 (arrayNoDuplicates!0 lt!170278 #b00000000000000000000000000000000 Nil!5608))))

(declare-fun b!371312 () Bool)

(declare-fun res!208736 () Bool)

(assert (=> b!371312 (=> (not res!208736) (not e!226653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21462 (_ BitVec 32)) Bool)

(assert (=> b!371312 (= res!208736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371313 () Bool)

(declare-fun res!208734 () Bool)

(assert (=> b!371313 (=> (not res!208734) (not e!226653))))

(assert (=> b!371313 (= res!208734 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5608))))

(declare-fun b!371314 () Bool)

(assert (=> b!371314 (= e!226653 e!226652)))

(declare-fun res!208733 () Bool)

(assert (=> b!371314 (=> (not res!208733) (not e!226652))))

(assert (=> b!371314 (= res!208733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170278 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371314 (= lt!170278 (array!21463 (store (arr!10199 _keys!658) i!548 k0!778) (size!10551 _keys!658)))))

(declare-fun b!371315 () Bool)

(declare-fun res!208727 () Bool)

(assert (=> b!371315 (=> (not res!208727) (not e!226653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371315 (= res!208727 (validKeyInArray!0 k0!778))))

(declare-fun b!371316 () Bool)

(declare-fun res!208729 () Bool)

(assert (=> b!371316 (=> (not res!208729) (not e!226653))))

(declare-fun arrayContainsKey!0 (array!21462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371316 (= res!208729 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14715 () Bool)

(declare-fun mapRes!14715 () Bool)

(declare-fun tp!29073 () Bool)

(declare-fun e!226648 () Bool)

(assert (=> mapNonEmpty!14715 (= mapRes!14715 (and tp!29073 e!226648))))

(declare-fun mapRest!14715 () (Array (_ BitVec 32) ValueCell!4040))

(declare-fun mapKey!14715 () (_ BitVec 32))

(declare-fun mapValue!14715 () ValueCell!4040)

(assert (=> mapNonEmpty!14715 (= (arr!10198 _values!506) (store mapRest!14715 mapKey!14715 mapValue!14715))))

(declare-fun b!371317 () Bool)

(declare-fun e!226650 () Bool)

(assert (=> b!371317 (= e!226649 (and e!226650 mapRes!14715))))

(declare-fun condMapEmpty!14715 () Bool)

(declare-fun mapDefault!14715 () ValueCell!4040)

(assert (=> b!371317 (= condMapEmpty!14715 (= (arr!10198 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4040)) mapDefault!14715)))))

(declare-fun b!371318 () Bool)

(assert (=> b!371318 (= e!226650 tp_is_empty!8767)))

(declare-fun b!371319 () Bool)

(assert (=> b!371319 (= e!226652 (not true))))

(declare-datatypes ((tuple2!5772 0))(
  ( (tuple2!5773 (_1!2897 (_ BitVec 64)) (_2!2897 V!12795)) )
))
(declare-datatypes ((List!5612 0))(
  ( (Nil!5609) (Cons!5608 (h!6464 tuple2!5772) (t!10754 List!5612)) )
))
(declare-datatypes ((ListLongMap!4687 0))(
  ( (ListLongMap!4688 (toList!2359 List!5612)) )
))
(declare-fun lt!170277 () ListLongMap!4687)

(declare-fun lt!170274 () ListLongMap!4687)

(assert (=> b!371319 (and (= lt!170277 lt!170274) (= lt!170274 lt!170277))))

(declare-fun v!373 () V!12795)

(declare-fun lt!170276 () ListLongMap!4687)

(declare-fun +!755 (ListLongMap!4687 tuple2!5772) ListLongMap!4687)

(assert (=> b!371319 (= lt!170274 (+!755 lt!170276 (tuple2!5773 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12795)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11401 0))(
  ( (Unit!11402) )
))
(declare-fun lt!170275 () Unit!11401)

(declare-fun minValue!472 () V!12795)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!8 (array!21462 array!21460 (_ BitVec 32) (_ BitVec 32) V!12795 V!12795 (_ BitVec 32) (_ BitVec 64) V!12795 (_ BitVec 32) Int) Unit!11401)

(assert (=> b!371319 (= lt!170275 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!8 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!668 (array!21462 array!21460 (_ BitVec 32) (_ BitVec 32) V!12795 V!12795 (_ BitVec 32) Int) ListLongMap!4687)

(assert (=> b!371319 (= lt!170277 (getCurrentListMapNoExtraKeys!668 lt!170278 (array!21461 (store (arr!10198 _values!506) i!548 (ValueCellFull!4040 v!373)) (size!10550 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371319 (= lt!170276 (getCurrentListMapNoExtraKeys!668 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14715 () Bool)

(assert (=> mapIsEmpty!14715 mapRes!14715))

(declare-fun b!371320 () Bool)

(declare-fun res!208735 () Bool)

(assert (=> b!371320 (=> (not res!208735) (not e!226653))))

(assert (=> b!371320 (= res!208735 (or (= (select (arr!10199 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10199 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371321 () Bool)

(declare-fun res!208732 () Bool)

(assert (=> b!371321 (=> (not res!208732) (not e!226653))))

(assert (=> b!371321 (= res!208732 (and (= (size!10550 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10551 _keys!658) (size!10550 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371322 () Bool)

(declare-fun res!208730 () Bool)

(assert (=> b!371322 (=> (not res!208730) (not e!226653))))

(assert (=> b!371322 (= res!208730 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10551 _keys!658))))))

(declare-fun b!371323 () Bool)

(assert (=> b!371323 (= e!226648 tp_is_empty!8767)))

(assert (= (and start!36978 res!208728) b!371321))

(assert (= (and b!371321 res!208732) b!371312))

(assert (= (and b!371312 res!208736) b!371313))

(assert (= (and b!371313 res!208734) b!371322))

(assert (= (and b!371322 res!208730) b!371315))

(assert (= (and b!371315 res!208727) b!371320))

(assert (= (and b!371320 res!208735) b!371316))

(assert (= (and b!371316 res!208729) b!371314))

(assert (= (and b!371314 res!208733) b!371311))

(assert (= (and b!371311 res!208731) b!371319))

(assert (= (and b!371317 condMapEmpty!14715) mapIsEmpty!14715))

(assert (= (and b!371317 (not condMapEmpty!14715)) mapNonEmpty!14715))

(get-info :version)

(assert (= (and mapNonEmpty!14715 ((_ is ValueCellFull!4040) mapValue!14715)) b!371323))

(assert (= (and b!371317 ((_ is ValueCellFull!4040) mapDefault!14715)) b!371318))

(assert (= start!36978 b!371317))

(declare-fun m!367571 () Bool)

(assert (=> b!371315 m!367571))

(declare-fun m!367573 () Bool)

(assert (=> start!36978 m!367573))

(declare-fun m!367575 () Bool)

(assert (=> start!36978 m!367575))

(declare-fun m!367577 () Bool)

(assert (=> start!36978 m!367577))

(declare-fun m!367579 () Bool)

(assert (=> b!371311 m!367579))

(declare-fun m!367581 () Bool)

(assert (=> b!371316 m!367581))

(declare-fun m!367583 () Bool)

(assert (=> b!371313 m!367583))

(declare-fun m!367585 () Bool)

(assert (=> mapNonEmpty!14715 m!367585))

(declare-fun m!367587 () Bool)

(assert (=> b!371319 m!367587))

(declare-fun m!367589 () Bool)

(assert (=> b!371319 m!367589))

(declare-fun m!367591 () Bool)

(assert (=> b!371319 m!367591))

(declare-fun m!367593 () Bool)

(assert (=> b!371319 m!367593))

(declare-fun m!367595 () Bool)

(assert (=> b!371319 m!367595))

(declare-fun m!367597 () Bool)

(assert (=> b!371314 m!367597))

(declare-fun m!367599 () Bool)

(assert (=> b!371314 m!367599))

(declare-fun m!367601 () Bool)

(assert (=> b!371320 m!367601))

(declare-fun m!367603 () Bool)

(assert (=> b!371312 m!367603))

(check-sat (not b!371311) b_and!15375 (not b_next!8119) (not b!371314) (not b!371316) (not b!371313) (not b!371315) (not start!36978) (not b!371312) (not mapNonEmpty!14715) (not b!371319) tp_is_empty!8767)
(check-sat b_and!15375 (not b_next!8119))
