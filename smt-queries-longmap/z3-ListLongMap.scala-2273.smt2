; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37102 () Bool)

(assert start!37102)

(declare-fun b_free!8229 () Bool)

(declare-fun b_next!8229 () Bool)

(assert (=> start!37102 (= b_free!8229 (not b_next!8229))))

(declare-fun tp!29402 () Bool)

(declare-fun b_and!15471 () Bool)

(assert (=> start!37102 (= tp!29402 b_and!15471)))

(declare-fun b!373587 () Bool)

(declare-fun res!210469 () Bool)

(declare-fun e!227749 () Bool)

(assert (=> b!373587 (=> (not res!210469) (not e!227749))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373587 (= res!210469 (validKeyInArray!0 k0!778))))

(declare-fun res!210472 () Bool)

(assert (=> start!37102 (=> (not res!210472) (not e!227749))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37102 (= res!210472 (validMask!0 mask!970))))

(assert (=> start!37102 e!227749))

(declare-datatypes ((V!12941 0))(
  ( (V!12942 (val!4483 Int)) )
))
(declare-datatypes ((ValueCell!4095 0))(
  ( (ValueCellFull!4095 (v!6680 V!12941)) (EmptyCell!4095) )
))
(declare-datatypes ((array!21695 0))(
  ( (array!21696 (arr!10316 (Array (_ BitVec 32) ValueCell!4095)) (size!10668 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21695)

(declare-fun e!227745 () Bool)

(declare-fun array_inv!7604 (array!21695) Bool)

(assert (=> start!37102 (and (array_inv!7604 _values!506) e!227745)))

(assert (=> start!37102 tp!29402))

(assert (=> start!37102 true))

(declare-fun tp_is_empty!8877 () Bool)

(assert (=> start!37102 tp_is_empty!8877))

(declare-datatypes ((array!21697 0))(
  ( (array!21698 (arr!10317 (Array (_ BitVec 32) (_ BitVec 64))) (size!10669 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21697)

(declare-fun array_inv!7605 (array!21697) Bool)

(assert (=> start!37102 (array_inv!7605 _keys!658)))

(declare-fun b!373588 () Bool)

(declare-fun res!210473 () Bool)

(assert (=> b!373588 (=> (not res!210473) (not e!227749))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373588 (= res!210473 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10669 _keys!658))))))

(declare-fun b!373589 () Bool)

(declare-fun res!210466 () Bool)

(assert (=> b!373589 (=> (not res!210466) (not e!227749))))

(declare-datatypes ((List!5799 0))(
  ( (Nil!5796) (Cons!5795 (h!6651 (_ BitVec 64)) (t!10949 List!5799)) )
))
(declare-fun arrayNoDuplicates!0 (array!21697 (_ BitVec 32) List!5799) Bool)

(assert (=> b!373589 (= res!210466 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5796))))

(declare-fun mapNonEmpty!14880 () Bool)

(declare-fun mapRes!14880 () Bool)

(declare-fun tp!29403 () Bool)

(declare-fun e!227746 () Bool)

(assert (=> mapNonEmpty!14880 (= mapRes!14880 (and tp!29403 e!227746))))

(declare-fun mapRest!14880 () (Array (_ BitVec 32) ValueCell!4095))

(declare-fun mapKey!14880 () (_ BitVec 32))

(declare-fun mapValue!14880 () ValueCell!4095)

(assert (=> mapNonEmpty!14880 (= (arr!10316 _values!506) (store mapRest!14880 mapKey!14880 mapValue!14880))))

(declare-fun mapIsEmpty!14880 () Bool)

(assert (=> mapIsEmpty!14880 mapRes!14880))

(declare-fun b!373590 () Bool)

(declare-fun e!227747 () Bool)

(assert (=> b!373590 (= e!227747 tp_is_empty!8877)))

(declare-fun b!373591 () Bool)

(declare-fun res!210468 () Bool)

(declare-fun e!227748 () Bool)

(assert (=> b!373591 (=> (not res!210468) (not e!227748))))

(declare-fun lt!171654 () array!21697)

(assert (=> b!373591 (= res!210468 (arrayNoDuplicates!0 lt!171654 #b00000000000000000000000000000000 Nil!5796))))

(declare-fun b!373592 () Bool)

(declare-fun e!227743 () Bool)

(declare-fun e!227750 () Bool)

(assert (=> b!373592 (= e!227743 e!227750)))

(declare-fun res!210465 () Bool)

(assert (=> b!373592 (=> res!210465 e!227750)))

(assert (=> b!373592 (= res!210465 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5954 0))(
  ( (tuple2!5955 (_1!2988 (_ BitVec 64)) (_2!2988 V!12941)) )
))
(declare-datatypes ((List!5800 0))(
  ( (Nil!5797) (Cons!5796 (h!6652 tuple2!5954) (t!10950 List!5800)) )
))
(declare-datatypes ((ListLongMap!4867 0))(
  ( (ListLongMap!4868 (toList!2449 List!5800)) )
))
(declare-fun lt!171646 () ListLongMap!4867)

(declare-fun lt!171647 () ListLongMap!4867)

(assert (=> b!373592 (= lt!171646 lt!171647)))

(declare-fun lt!171658 () ListLongMap!4867)

(declare-fun lt!171645 () tuple2!5954)

(declare-fun +!795 (ListLongMap!4867 tuple2!5954) ListLongMap!4867)

(assert (=> b!373592 (= lt!171647 (+!795 lt!171658 lt!171645))))

(declare-datatypes ((Unit!11496 0))(
  ( (Unit!11497) )
))
(declare-fun lt!171657 () Unit!11496)

(declare-fun v!373 () V!12941)

(declare-fun lt!171650 () ListLongMap!4867)

(declare-fun zeroValue!472 () V!12941)

(declare-fun addCommutativeForDiffKeys!219 (ListLongMap!4867 (_ BitVec 64) V!12941 (_ BitVec 64) V!12941) Unit!11496)

(assert (=> b!373592 (= lt!171657 (addCommutativeForDiffKeys!219 lt!171650 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171653 () ListLongMap!4867)

(declare-fun lt!171652 () tuple2!5954)

(assert (=> b!373592 (= lt!171653 (+!795 lt!171646 lt!171652))))

(declare-fun lt!171648 () ListLongMap!4867)

(declare-fun lt!171660 () tuple2!5954)

(assert (=> b!373592 (= lt!171646 (+!795 lt!171648 lt!171660))))

(declare-fun lt!171649 () ListLongMap!4867)

(declare-fun lt!171659 () ListLongMap!4867)

(assert (=> b!373592 (= lt!171649 lt!171659)))

(assert (=> b!373592 (= lt!171659 (+!795 lt!171658 lt!171652))))

(assert (=> b!373592 (= lt!171658 (+!795 lt!171650 lt!171660))))

(declare-fun lt!171655 () ListLongMap!4867)

(assert (=> b!373592 (= lt!171653 (+!795 (+!795 lt!171655 lt!171660) lt!171652))))

(declare-fun minValue!472 () V!12941)

(assert (=> b!373592 (= lt!171652 (tuple2!5955 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373592 (= lt!171660 (tuple2!5955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373593 () Bool)

(assert (=> b!373593 (= e!227745 (and e!227747 mapRes!14880))))

(declare-fun condMapEmpty!14880 () Bool)

(declare-fun mapDefault!14880 () ValueCell!4095)

(assert (=> b!373593 (= condMapEmpty!14880 (= (arr!10316 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4095)) mapDefault!14880)))))

(declare-fun b!373594 () Bool)

(assert (=> b!373594 (= e!227750 true)))

(assert (=> b!373594 (= (+!795 lt!171647 lt!171652) (+!795 lt!171659 lt!171645))))

(declare-fun lt!171651 () Unit!11496)

(assert (=> b!373594 (= lt!171651 (addCommutativeForDiffKeys!219 lt!171658 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373595 () Bool)

(declare-fun res!210471 () Bool)

(assert (=> b!373595 (=> (not res!210471) (not e!227749))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373595 (= res!210471 (and (= (size!10668 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10669 _keys!658) (size!10668 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373596 () Bool)

(declare-fun res!210463 () Bool)

(assert (=> b!373596 (=> (not res!210463) (not e!227749))))

(assert (=> b!373596 (= res!210463 (or (= (select (arr!10317 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10317 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373597 () Bool)

(declare-fun res!210464 () Bool)

(assert (=> b!373597 (=> (not res!210464) (not e!227749))))

(declare-fun arrayContainsKey!0 (array!21697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373597 (= res!210464 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373598 () Bool)

(declare-fun res!210470 () Bool)

(assert (=> b!373598 (=> (not res!210470) (not e!227749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21697 (_ BitVec 32)) Bool)

(assert (=> b!373598 (= res!210470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373599 () Bool)

(assert (=> b!373599 (= e!227746 tp_is_empty!8877)))

(declare-fun b!373600 () Bool)

(assert (=> b!373600 (= e!227749 e!227748)))

(declare-fun res!210462 () Bool)

(assert (=> b!373600 (=> (not res!210462) (not e!227748))))

(assert (=> b!373600 (= res!210462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171654 mask!970))))

(assert (=> b!373600 (= lt!171654 (array!21698 (store (arr!10317 _keys!658) i!548 k0!778) (size!10669 _keys!658)))))

(declare-fun b!373601 () Bool)

(assert (=> b!373601 (= e!227748 (not e!227743))))

(declare-fun res!210467 () Bool)

(assert (=> b!373601 (=> res!210467 e!227743)))

(assert (=> b!373601 (= res!210467 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1890 (array!21697 array!21695 (_ BitVec 32) (_ BitVec 32) V!12941 V!12941 (_ BitVec 32) Int) ListLongMap!4867)

(assert (=> b!373601 (= lt!171649 (getCurrentListMap!1890 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171656 () array!21695)

(assert (=> b!373601 (= lt!171653 (getCurrentListMap!1890 lt!171654 lt!171656 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373601 (and (= lt!171655 lt!171648) (= lt!171648 lt!171655))))

(assert (=> b!373601 (= lt!171648 (+!795 lt!171650 lt!171645))))

(assert (=> b!373601 (= lt!171645 (tuple2!5955 k0!778 v!373))))

(declare-fun lt!171644 () Unit!11496)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!48 (array!21697 array!21695 (_ BitVec 32) (_ BitVec 32) V!12941 V!12941 (_ BitVec 32) (_ BitVec 64) V!12941 (_ BitVec 32) Int) Unit!11496)

(assert (=> b!373601 (= lt!171644 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!48 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!724 (array!21697 array!21695 (_ BitVec 32) (_ BitVec 32) V!12941 V!12941 (_ BitVec 32) Int) ListLongMap!4867)

(assert (=> b!373601 (= lt!171655 (getCurrentListMapNoExtraKeys!724 lt!171654 lt!171656 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373601 (= lt!171656 (array!21696 (store (arr!10316 _values!506) i!548 (ValueCellFull!4095 v!373)) (size!10668 _values!506)))))

(assert (=> b!373601 (= lt!171650 (getCurrentListMapNoExtraKeys!724 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37102 res!210472) b!373595))

(assert (= (and b!373595 res!210471) b!373598))

(assert (= (and b!373598 res!210470) b!373589))

(assert (= (and b!373589 res!210466) b!373588))

(assert (= (and b!373588 res!210473) b!373587))

(assert (= (and b!373587 res!210469) b!373596))

(assert (= (and b!373596 res!210463) b!373597))

(assert (= (and b!373597 res!210464) b!373600))

(assert (= (and b!373600 res!210462) b!373591))

(assert (= (and b!373591 res!210468) b!373601))

(assert (= (and b!373601 (not res!210467)) b!373592))

(assert (= (and b!373592 (not res!210465)) b!373594))

(assert (= (and b!373593 condMapEmpty!14880) mapIsEmpty!14880))

(assert (= (and b!373593 (not condMapEmpty!14880)) mapNonEmpty!14880))

(get-info :version)

(assert (= (and mapNonEmpty!14880 ((_ is ValueCellFull!4095) mapValue!14880)) b!373599))

(assert (= (and b!373593 ((_ is ValueCellFull!4095) mapDefault!14880)) b!373590))

(assert (= start!37102 b!373593))

(declare-fun m!369555 () Bool)

(assert (=> b!373589 m!369555))

(declare-fun m!369557 () Bool)

(assert (=> b!373594 m!369557))

(declare-fun m!369559 () Bool)

(assert (=> b!373594 m!369559))

(declare-fun m!369561 () Bool)

(assert (=> b!373594 m!369561))

(declare-fun m!369563 () Bool)

(assert (=> mapNonEmpty!14880 m!369563))

(declare-fun m!369565 () Bool)

(assert (=> b!373592 m!369565))

(declare-fun m!369567 () Bool)

(assert (=> b!373592 m!369567))

(declare-fun m!369569 () Bool)

(assert (=> b!373592 m!369569))

(declare-fun m!369571 () Bool)

(assert (=> b!373592 m!369571))

(declare-fun m!369573 () Bool)

(assert (=> b!373592 m!369573))

(declare-fun m!369575 () Bool)

(assert (=> b!373592 m!369575))

(assert (=> b!373592 m!369571))

(declare-fun m!369577 () Bool)

(assert (=> b!373592 m!369577))

(declare-fun m!369579 () Bool)

(assert (=> b!373592 m!369579))

(declare-fun m!369581 () Bool)

(assert (=> b!373596 m!369581))

(declare-fun m!369583 () Bool)

(assert (=> b!373587 m!369583))

(declare-fun m!369585 () Bool)

(assert (=> b!373591 m!369585))

(declare-fun m!369587 () Bool)

(assert (=> b!373597 m!369587))

(declare-fun m!369589 () Bool)

(assert (=> start!37102 m!369589))

(declare-fun m!369591 () Bool)

(assert (=> start!37102 m!369591))

(declare-fun m!369593 () Bool)

(assert (=> start!37102 m!369593))

(declare-fun m!369595 () Bool)

(assert (=> b!373600 m!369595))

(declare-fun m!369597 () Bool)

(assert (=> b!373600 m!369597))

(declare-fun m!369599 () Bool)

(assert (=> b!373598 m!369599))

(declare-fun m!369601 () Bool)

(assert (=> b!373601 m!369601))

(declare-fun m!369603 () Bool)

(assert (=> b!373601 m!369603))

(declare-fun m!369605 () Bool)

(assert (=> b!373601 m!369605))

(declare-fun m!369607 () Bool)

(assert (=> b!373601 m!369607))

(declare-fun m!369609 () Bool)

(assert (=> b!373601 m!369609))

(declare-fun m!369611 () Bool)

(assert (=> b!373601 m!369611))

(declare-fun m!369613 () Bool)

(assert (=> b!373601 m!369613))

(check-sat (not b!373591) (not b!373592) (not b_next!8229) (not mapNonEmpty!14880) b_and!15471 (not b!373589) (not b!373587) (not b!373600) (not b!373598) (not b!373601) (not start!37102) tp_is_empty!8877 (not b!373594) (not b!373597))
(check-sat b_and!15471 (not b_next!8229))
