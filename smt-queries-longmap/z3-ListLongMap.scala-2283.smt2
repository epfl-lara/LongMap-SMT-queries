; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37146 () Bool)

(assert start!37146)

(declare-fun b_free!8287 () Bool)

(declare-fun b_next!8287 () Bool)

(assert (=> start!37146 (= b_free!8287 (not b_next!8287))))

(declare-fun tp!29577 () Bool)

(declare-fun b_and!15503 () Bool)

(assert (=> start!37146 (= tp!29577 b_and!15503)))

(declare-fun b!374621 () Bool)

(declare-fun e!228269 () Bool)

(declare-fun e!228270 () Bool)

(assert (=> b!374621 (= e!228269 e!228270)))

(declare-fun res!211384 () Bool)

(assert (=> b!374621 (=> res!211384 e!228270)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!374621 (= res!211384 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13019 0))(
  ( (V!13020 (val!4512 Int)) )
))
(declare-datatypes ((tuple2!5974 0))(
  ( (tuple2!5975 (_1!2998 (_ BitVec 64)) (_2!2998 V!13019)) )
))
(declare-datatypes ((List!5807 0))(
  ( (Nil!5804) (Cons!5803 (h!6659 tuple2!5974) (t!10948 List!5807)) )
))
(declare-datatypes ((ListLongMap!4877 0))(
  ( (ListLongMap!4878 (toList!2454 List!5807)) )
))
(declare-fun lt!172898 () ListLongMap!4877)

(declare-fun lt!172890 () ListLongMap!4877)

(assert (=> b!374621 (= lt!172898 lt!172890)))

(declare-fun lt!172899 () ListLongMap!4877)

(declare-fun lt!172896 () tuple2!5974)

(declare-fun +!822 (ListLongMap!4877 tuple2!5974) ListLongMap!4877)

(assert (=> b!374621 (= lt!172890 (+!822 lt!172899 lt!172896))))

(declare-fun zeroValue!472 () V!13019)

(declare-fun lt!172901 () ListLongMap!4877)

(declare-datatypes ((Unit!11516 0))(
  ( (Unit!11517) )
))
(declare-fun lt!172893 () Unit!11516)

(declare-fun v!373 () V!13019)

(declare-fun addCommutativeForDiffKeys!238 (ListLongMap!4877 (_ BitVec 64) V!13019 (_ BitVec 64) V!13019) Unit!11516)

(assert (=> b!374621 (= lt!172893 (addCommutativeForDiffKeys!238 lt!172901 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172905 () ListLongMap!4877)

(declare-fun lt!172895 () tuple2!5974)

(assert (=> b!374621 (= lt!172905 (+!822 lt!172898 lt!172895))))

(declare-fun lt!172891 () ListLongMap!4877)

(declare-fun lt!172889 () tuple2!5974)

(assert (=> b!374621 (= lt!172898 (+!822 lt!172891 lt!172889))))

(declare-fun lt!172900 () ListLongMap!4877)

(declare-fun lt!172902 () ListLongMap!4877)

(assert (=> b!374621 (= lt!172900 lt!172902)))

(assert (=> b!374621 (= lt!172902 (+!822 lt!172899 lt!172895))))

(assert (=> b!374621 (= lt!172899 (+!822 lt!172901 lt!172889))))

(declare-fun lt!172892 () ListLongMap!4877)

(assert (=> b!374621 (= lt!172905 (+!822 (+!822 lt!172892 lt!172889) lt!172895))))

(declare-fun minValue!472 () V!13019)

(assert (=> b!374621 (= lt!172895 (tuple2!5975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374621 (= lt!172889 (tuple2!5975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374622 () Bool)

(declare-fun e!228268 () Bool)

(declare-fun e!228272 () Bool)

(assert (=> b!374622 (= e!228268 e!228272)))

(declare-fun res!211387 () Bool)

(assert (=> b!374622 (=> (not res!211387) (not e!228272))))

(declare-datatypes ((array!21787 0))(
  ( (array!21788 (arr!10362 (Array (_ BitVec 32) (_ BitVec 64))) (size!10715 (_ BitVec 32))) )
))
(declare-fun lt!172903 () array!21787)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21787 (_ BitVec 32)) Bool)

(assert (=> b!374622 (= res!211387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172903 mask!970))))

(declare-fun _keys!658 () array!21787)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374622 (= lt!172903 (array!21788 (store (arr!10362 _keys!658) i!548 k0!778) (size!10715 _keys!658)))))

(declare-fun b!374623 () Bool)

(declare-fun e!228271 () Bool)

(declare-fun tp_is_empty!8935 () Bool)

(assert (=> b!374623 (= e!228271 tp_is_empty!8935)))

(declare-fun mapIsEmpty!14967 () Bool)

(declare-fun mapRes!14967 () Bool)

(assert (=> mapIsEmpty!14967 mapRes!14967))

(declare-fun b!374624 () Bool)

(declare-fun res!211381 () Bool)

(assert (=> b!374624 (=> (not res!211381) (not e!228268))))

(assert (=> b!374624 (= res!211381 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10715 _keys!658))))))

(declare-fun b!374625 () Bool)

(declare-fun res!211378 () Bool)

(assert (=> b!374625 (=> (not res!211378) (not e!228268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374625 (= res!211378 (validKeyInArray!0 k0!778))))

(declare-fun b!374626 () Bool)

(declare-fun res!211388 () Bool)

(assert (=> b!374626 (=> (not res!211388) (not e!228268))))

(assert (=> b!374626 (= res!211388 (or (= (select (arr!10362 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10362 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374627 () Bool)

(assert (=> b!374627 (= e!228270 true)))

(assert (=> b!374627 (= (+!822 lt!172890 lt!172895) (+!822 lt!172902 lt!172896))))

(declare-fun lt!172894 () Unit!11516)

(assert (=> b!374627 (= lt!172894 (addCommutativeForDiffKeys!238 lt!172899 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374628 () Bool)

(declare-fun e!228267 () Bool)

(assert (=> b!374628 (= e!228267 tp_is_empty!8935)))

(declare-fun b!374629 () Bool)

(declare-fun res!211385 () Bool)

(assert (=> b!374629 (=> (not res!211385) (not e!228268))))

(declare-fun arrayContainsKey!0 (array!21787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374629 (= res!211385 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374630 () Bool)

(declare-fun res!211386 () Bool)

(assert (=> b!374630 (=> (not res!211386) (not e!228268))))

(assert (=> b!374630 (= res!211386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374631 () Bool)

(declare-fun res!211377 () Bool)

(assert (=> b!374631 (=> (not res!211377) (not e!228268))))

(declare-datatypes ((List!5808 0))(
  ( (Nil!5805) (Cons!5804 (h!6660 (_ BitVec 64)) (t!10949 List!5808)) )
))
(declare-fun arrayNoDuplicates!0 (array!21787 (_ BitVec 32) List!5808) Bool)

(assert (=> b!374631 (= res!211377 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5805))))

(declare-fun res!211379 () Bool)

(assert (=> start!37146 (=> (not res!211379) (not e!228268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37146 (= res!211379 (validMask!0 mask!970))))

(assert (=> start!37146 e!228268))

(declare-datatypes ((ValueCell!4124 0))(
  ( (ValueCellFull!4124 (v!6703 V!13019)) (EmptyCell!4124) )
))
(declare-datatypes ((array!21789 0))(
  ( (array!21790 (arr!10363 (Array (_ BitVec 32) ValueCell!4124)) (size!10716 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21789)

(declare-fun e!228266 () Bool)

(declare-fun array_inv!7646 (array!21789) Bool)

(assert (=> start!37146 (and (array_inv!7646 _values!506) e!228266)))

(assert (=> start!37146 tp!29577))

(assert (=> start!37146 true))

(assert (=> start!37146 tp_is_empty!8935))

(declare-fun array_inv!7647 (array!21787) Bool)

(assert (=> start!37146 (array_inv!7647 _keys!658)))

(declare-fun b!374632 () Bool)

(assert (=> b!374632 (= e!228272 (not e!228269))))

(declare-fun res!211383 () Bool)

(assert (=> b!374632 (=> res!211383 e!228269)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374632 (= res!211383 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1871 (array!21787 array!21789 (_ BitVec 32) (_ BitVec 32) V!13019 V!13019 (_ BitVec 32) Int) ListLongMap!4877)

(assert (=> b!374632 (= lt!172900 (getCurrentListMap!1871 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172904 () array!21789)

(assert (=> b!374632 (= lt!172905 (getCurrentListMap!1871 lt!172903 lt!172904 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374632 (and (= lt!172892 lt!172891) (= lt!172891 lt!172892))))

(assert (=> b!374632 (= lt!172891 (+!822 lt!172901 lt!172896))))

(assert (=> b!374632 (= lt!172896 (tuple2!5975 k0!778 v!373))))

(declare-fun lt!172897 () Unit!11516)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!64 (array!21787 array!21789 (_ BitVec 32) (_ BitVec 32) V!13019 V!13019 (_ BitVec 32) (_ BitVec 64) V!13019 (_ BitVec 32) Int) Unit!11516)

(assert (=> b!374632 (= lt!172897 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!64 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!736 (array!21787 array!21789 (_ BitVec 32) (_ BitVec 32) V!13019 V!13019 (_ BitVec 32) Int) ListLongMap!4877)

(assert (=> b!374632 (= lt!172892 (getCurrentListMapNoExtraKeys!736 lt!172903 lt!172904 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374632 (= lt!172904 (array!21790 (store (arr!10363 _values!506) i!548 (ValueCellFull!4124 v!373)) (size!10716 _values!506)))))

(assert (=> b!374632 (= lt!172901 (getCurrentListMapNoExtraKeys!736 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374633 () Bool)

(declare-fun res!211380 () Bool)

(assert (=> b!374633 (=> (not res!211380) (not e!228268))))

(assert (=> b!374633 (= res!211380 (and (= (size!10716 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10715 _keys!658) (size!10716 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374634 () Bool)

(assert (=> b!374634 (= e!228266 (and e!228267 mapRes!14967))))

(declare-fun condMapEmpty!14967 () Bool)

(declare-fun mapDefault!14967 () ValueCell!4124)

(assert (=> b!374634 (= condMapEmpty!14967 (= (arr!10363 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4124)) mapDefault!14967)))))

(declare-fun b!374635 () Bool)

(declare-fun res!211382 () Bool)

(assert (=> b!374635 (=> (not res!211382) (not e!228272))))

(assert (=> b!374635 (= res!211382 (arrayNoDuplicates!0 lt!172903 #b00000000000000000000000000000000 Nil!5805))))

(declare-fun mapNonEmpty!14967 () Bool)

(declare-fun tp!29576 () Bool)

(assert (=> mapNonEmpty!14967 (= mapRes!14967 (and tp!29576 e!228271))))

(declare-fun mapKey!14967 () (_ BitVec 32))

(declare-fun mapValue!14967 () ValueCell!4124)

(declare-fun mapRest!14967 () (Array (_ BitVec 32) ValueCell!4124))

(assert (=> mapNonEmpty!14967 (= (arr!10363 _values!506) (store mapRest!14967 mapKey!14967 mapValue!14967))))

(assert (= (and start!37146 res!211379) b!374633))

(assert (= (and b!374633 res!211380) b!374630))

(assert (= (and b!374630 res!211386) b!374631))

(assert (= (and b!374631 res!211377) b!374624))

(assert (= (and b!374624 res!211381) b!374625))

(assert (= (and b!374625 res!211378) b!374626))

(assert (= (and b!374626 res!211388) b!374629))

(assert (= (and b!374629 res!211385) b!374622))

(assert (= (and b!374622 res!211387) b!374635))

(assert (= (and b!374635 res!211382) b!374632))

(assert (= (and b!374632 (not res!211383)) b!374621))

(assert (= (and b!374621 (not res!211384)) b!374627))

(assert (= (and b!374634 condMapEmpty!14967) mapIsEmpty!14967))

(assert (= (and b!374634 (not condMapEmpty!14967)) mapNonEmpty!14967))

(get-info :version)

(assert (= (and mapNonEmpty!14967 ((_ is ValueCellFull!4124) mapValue!14967)) b!374623))

(assert (= (and b!374634 ((_ is ValueCellFull!4124) mapDefault!14967)) b!374628))

(assert (= start!37146 b!374634))

(declare-fun m!370571 () Bool)

(assert (=> mapNonEmpty!14967 m!370571))

(declare-fun m!370573 () Bool)

(assert (=> b!374627 m!370573))

(declare-fun m!370575 () Bool)

(assert (=> b!374627 m!370575))

(declare-fun m!370577 () Bool)

(assert (=> b!374627 m!370577))

(declare-fun m!370579 () Bool)

(assert (=> b!374630 m!370579))

(declare-fun m!370581 () Bool)

(assert (=> b!374635 m!370581))

(declare-fun m!370583 () Bool)

(assert (=> b!374629 m!370583))

(declare-fun m!370585 () Bool)

(assert (=> b!374631 m!370585))

(declare-fun m!370587 () Bool)

(assert (=> b!374625 m!370587))

(declare-fun m!370589 () Bool)

(assert (=> start!37146 m!370589))

(declare-fun m!370591 () Bool)

(assert (=> start!37146 m!370591))

(declare-fun m!370593 () Bool)

(assert (=> start!37146 m!370593))

(declare-fun m!370595 () Bool)

(assert (=> b!374622 m!370595))

(declare-fun m!370597 () Bool)

(assert (=> b!374622 m!370597))

(declare-fun m!370599 () Bool)

(assert (=> b!374626 m!370599))

(declare-fun m!370601 () Bool)

(assert (=> b!374632 m!370601))

(declare-fun m!370603 () Bool)

(assert (=> b!374632 m!370603))

(declare-fun m!370605 () Bool)

(assert (=> b!374632 m!370605))

(declare-fun m!370607 () Bool)

(assert (=> b!374632 m!370607))

(declare-fun m!370609 () Bool)

(assert (=> b!374632 m!370609))

(declare-fun m!370611 () Bool)

(assert (=> b!374632 m!370611))

(declare-fun m!370613 () Bool)

(assert (=> b!374632 m!370613))

(declare-fun m!370615 () Bool)

(assert (=> b!374621 m!370615))

(declare-fun m!370617 () Bool)

(assert (=> b!374621 m!370617))

(declare-fun m!370619 () Bool)

(assert (=> b!374621 m!370619))

(declare-fun m!370621 () Bool)

(assert (=> b!374621 m!370621))

(assert (=> b!374621 m!370621))

(declare-fun m!370623 () Bool)

(assert (=> b!374621 m!370623))

(declare-fun m!370625 () Bool)

(assert (=> b!374621 m!370625))

(declare-fun m!370627 () Bool)

(assert (=> b!374621 m!370627))

(declare-fun m!370629 () Bool)

(assert (=> b!374621 m!370629))

(check-sat (not b!374630) tp_is_empty!8935 (not b_next!8287) (not start!37146) (not b!374632) (not b!374625) (not b!374631) (not b!374635) (not b!374629) (not b!374627) (not mapNonEmpty!14967) (not b!374621) b_and!15503 (not b!374622))
(check-sat b_and!15503 (not b_next!8287))
