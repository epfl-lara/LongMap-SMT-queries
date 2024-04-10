; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37138 () Bool)

(assert start!37138)

(declare-fun b_free!8265 () Bool)

(declare-fun b_next!8265 () Bool)

(assert (=> start!37138 (= b_free!8265 (not b_next!8265))))

(declare-fun tp!29511 () Bool)

(declare-fun b_and!15507 () Bool)

(assert (=> start!37138 (= tp!29511 b_and!15507)))

(declare-fun b!374397 () Bool)

(declare-fun e!228178 () Bool)

(declare-fun e!228175 () Bool)

(assert (=> b!374397 (= e!228178 e!228175)))

(declare-fun res!211119 () Bool)

(assert (=> b!374397 (=> (not res!211119) (not e!228175))))

(declare-datatypes ((array!21765 0))(
  ( (array!21766 (arr!10351 (Array (_ BitVec 32) (_ BitVec 64))) (size!10703 (_ BitVec 32))) )
))
(declare-fun lt!172563 () array!21765)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21765 (_ BitVec 32)) Bool)

(assert (=> b!374397 (= res!211119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172563 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21765)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374397 (= lt!172563 (array!21766 (store (arr!10351 _keys!658) i!548 k0!778) (size!10703 _keys!658)))))

(declare-fun b!374398 () Bool)

(declare-fun e!228176 () Bool)

(assert (=> b!374398 (= e!228176 (bvsle #b00000000000000000000000000000000 (size!10703 _keys!658)))))

(declare-datatypes ((V!12989 0))(
  ( (V!12990 (val!4501 Int)) )
))
(declare-datatypes ((tuple2!5984 0))(
  ( (tuple2!5985 (_1!3003 (_ BitVec 64)) (_2!3003 V!12989)) )
))
(declare-fun lt!172572 () tuple2!5984)

(declare-datatypes ((List!5829 0))(
  ( (Nil!5826) (Cons!5825 (h!6681 tuple2!5984) (t!10979 List!5829)) )
))
(declare-datatypes ((ListLongMap!4897 0))(
  ( (ListLongMap!4898 (toList!2464 List!5829)) )
))
(declare-fun lt!172565 () ListLongMap!4897)

(declare-fun lt!172562 () ListLongMap!4897)

(declare-fun lt!172575 () tuple2!5984)

(declare-fun +!810 (ListLongMap!4897 tuple2!5984) ListLongMap!4897)

(assert (=> b!374398 (= (+!810 lt!172565 lt!172572) (+!810 lt!172562 lt!172575))))

(declare-fun v!373 () V!12989)

(declare-datatypes ((Unit!11526 0))(
  ( (Unit!11527) )
))
(declare-fun lt!172566 () Unit!11526)

(declare-fun lt!172577 () ListLongMap!4897)

(declare-fun minValue!472 () V!12989)

(declare-fun addCommutativeForDiffKeys!233 (ListLongMap!4897 (_ BitVec 64) V!12989 (_ BitVec 64) V!12989) Unit!11526)

(assert (=> b!374398 (= lt!172566 (addCommutativeForDiffKeys!233 lt!172577 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!14934 () Bool)

(declare-fun mapRes!14934 () Bool)

(assert (=> mapIsEmpty!14934 mapRes!14934))

(declare-fun b!374399 () Bool)

(declare-fun res!211114 () Bool)

(assert (=> b!374399 (=> (not res!211114) (not e!228178))))

(assert (=> b!374399 (= res!211114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!211118 () Bool)

(assert (=> start!37138 (=> (not res!211118) (not e!228178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37138 (= res!211118 (validMask!0 mask!970))))

(assert (=> start!37138 e!228178))

(declare-datatypes ((ValueCell!4113 0))(
  ( (ValueCellFull!4113 (v!6698 V!12989)) (EmptyCell!4113) )
))
(declare-datatypes ((array!21767 0))(
  ( (array!21768 (arr!10352 (Array (_ BitVec 32) ValueCell!4113)) (size!10704 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21767)

(declare-fun e!228179 () Bool)

(declare-fun array_inv!7634 (array!21767) Bool)

(assert (=> start!37138 (and (array_inv!7634 _values!506) e!228179)))

(assert (=> start!37138 tp!29511))

(assert (=> start!37138 true))

(declare-fun tp_is_empty!8913 () Bool)

(assert (=> start!37138 tp_is_empty!8913))

(declare-fun array_inv!7635 (array!21765) Bool)

(assert (=> start!37138 (array_inv!7635 _keys!658)))

(declare-fun b!374400 () Bool)

(declare-fun res!211116 () Bool)

(assert (=> b!374400 (=> (not res!211116) (not e!228178))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374400 (= res!211116 (and (= (size!10704 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10703 _keys!658) (size!10704 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374401 () Bool)

(declare-fun res!211113 () Bool)

(assert (=> b!374401 (=> (not res!211113) (not e!228178))))

(declare-fun arrayContainsKey!0 (array!21765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374401 (= res!211113 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374402 () Bool)

(declare-fun e!228182 () Bool)

(assert (=> b!374402 (= e!228179 (and e!228182 mapRes!14934))))

(declare-fun condMapEmpty!14934 () Bool)

(declare-fun mapDefault!14934 () ValueCell!4113)

(assert (=> b!374402 (= condMapEmpty!14934 (= (arr!10352 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4113)) mapDefault!14934)))))

(declare-fun b!374403 () Bool)

(declare-fun res!211120 () Bool)

(assert (=> b!374403 (=> (not res!211120) (not e!228178))))

(declare-datatypes ((List!5830 0))(
  ( (Nil!5827) (Cons!5826 (h!6682 (_ BitVec 64)) (t!10980 List!5830)) )
))
(declare-fun arrayNoDuplicates!0 (array!21765 (_ BitVec 32) List!5830) Bool)

(assert (=> b!374403 (= res!211120 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5827))))

(declare-fun b!374404 () Bool)

(declare-fun res!211121 () Bool)

(assert (=> b!374404 (=> (not res!211121) (not e!228175))))

(assert (=> b!374404 (= res!211121 (arrayNoDuplicates!0 lt!172563 #b00000000000000000000000000000000 Nil!5827))))

(declare-fun b!374405 () Bool)

(declare-fun res!211112 () Bool)

(assert (=> b!374405 (=> (not res!211112) (not e!228178))))

(assert (=> b!374405 (= res!211112 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10703 _keys!658))))))

(declare-fun b!374406 () Bool)

(assert (=> b!374406 (= e!228182 tp_is_empty!8913)))

(declare-fun b!374407 () Bool)

(declare-fun e!228181 () Bool)

(assert (=> b!374407 (= e!228175 (not e!228181))))

(declare-fun res!211111 () Bool)

(assert (=> b!374407 (=> res!211111 e!228181)))

(assert (=> b!374407 (= res!211111 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12989)

(declare-fun lt!172567 () ListLongMap!4897)

(declare-fun getCurrentListMap!1902 (array!21765 array!21767 (_ BitVec 32) (_ BitVec 32) V!12989 V!12989 (_ BitVec 32) Int) ListLongMap!4897)

(assert (=> b!374407 (= lt!172567 (getCurrentListMap!1902 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172574 () ListLongMap!4897)

(declare-fun lt!172571 () array!21767)

(assert (=> b!374407 (= lt!172574 (getCurrentListMap!1902 lt!172563 lt!172571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172568 () ListLongMap!4897)

(declare-fun lt!172576 () ListLongMap!4897)

(assert (=> b!374407 (and (= lt!172568 lt!172576) (= lt!172576 lt!172568))))

(declare-fun lt!172564 () ListLongMap!4897)

(assert (=> b!374407 (= lt!172576 (+!810 lt!172564 lt!172575))))

(assert (=> b!374407 (= lt!172575 (tuple2!5985 k0!778 v!373))))

(declare-fun lt!172570 () Unit!11526)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!60 (array!21765 array!21767 (_ BitVec 32) (_ BitVec 32) V!12989 V!12989 (_ BitVec 32) (_ BitVec 64) V!12989 (_ BitVec 32) Int) Unit!11526)

(assert (=> b!374407 (= lt!172570 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!60 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!736 (array!21765 array!21767 (_ BitVec 32) (_ BitVec 32) V!12989 V!12989 (_ BitVec 32) Int) ListLongMap!4897)

(assert (=> b!374407 (= lt!172568 (getCurrentListMapNoExtraKeys!736 lt!172563 lt!172571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374407 (= lt!172571 (array!21768 (store (arr!10352 _values!506) i!548 (ValueCellFull!4113 v!373)) (size!10704 _values!506)))))

(assert (=> b!374407 (= lt!172564 (getCurrentListMapNoExtraKeys!736 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374408 () Bool)

(assert (=> b!374408 (= e!228181 e!228176)))

(declare-fun res!211115 () Bool)

(assert (=> b!374408 (=> res!211115 e!228176)))

(assert (=> b!374408 (= res!211115 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172573 () ListLongMap!4897)

(assert (=> b!374408 (= lt!172573 lt!172565)))

(assert (=> b!374408 (= lt!172565 (+!810 lt!172577 lt!172575))))

(declare-fun lt!172578 () Unit!11526)

(assert (=> b!374408 (= lt!172578 (addCommutativeForDiffKeys!233 lt!172564 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374408 (= lt!172574 (+!810 lt!172573 lt!172572))))

(declare-fun lt!172569 () tuple2!5984)

(assert (=> b!374408 (= lt!172573 (+!810 lt!172576 lt!172569))))

(assert (=> b!374408 (= lt!172567 lt!172562)))

(assert (=> b!374408 (= lt!172562 (+!810 lt!172577 lt!172572))))

(assert (=> b!374408 (= lt!172577 (+!810 lt!172564 lt!172569))))

(assert (=> b!374408 (= lt!172574 (+!810 (+!810 lt!172568 lt!172569) lt!172572))))

(assert (=> b!374408 (= lt!172572 (tuple2!5985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374408 (= lt!172569 (tuple2!5985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14934 () Bool)

(declare-fun tp!29510 () Bool)

(declare-fun e!228180 () Bool)

(assert (=> mapNonEmpty!14934 (= mapRes!14934 (and tp!29510 e!228180))))

(declare-fun mapRest!14934 () (Array (_ BitVec 32) ValueCell!4113))

(declare-fun mapValue!14934 () ValueCell!4113)

(declare-fun mapKey!14934 () (_ BitVec 32))

(assert (=> mapNonEmpty!14934 (= (arr!10352 _values!506) (store mapRest!14934 mapKey!14934 mapValue!14934))))

(declare-fun b!374409 () Bool)

(declare-fun res!211117 () Bool)

(assert (=> b!374409 (=> (not res!211117) (not e!228178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374409 (= res!211117 (validKeyInArray!0 k0!778))))

(declare-fun b!374410 () Bool)

(declare-fun res!211110 () Bool)

(assert (=> b!374410 (=> (not res!211110) (not e!228178))))

(assert (=> b!374410 (= res!211110 (or (= (select (arr!10351 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10351 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374411 () Bool)

(assert (=> b!374411 (= e!228180 tp_is_empty!8913)))

(assert (= (and start!37138 res!211118) b!374400))

(assert (= (and b!374400 res!211116) b!374399))

(assert (= (and b!374399 res!211114) b!374403))

(assert (= (and b!374403 res!211120) b!374405))

(assert (= (and b!374405 res!211112) b!374409))

(assert (= (and b!374409 res!211117) b!374410))

(assert (= (and b!374410 res!211110) b!374401))

(assert (= (and b!374401 res!211113) b!374397))

(assert (= (and b!374397 res!211119) b!374404))

(assert (= (and b!374404 res!211121) b!374407))

(assert (= (and b!374407 (not res!211111)) b!374408))

(assert (= (and b!374408 (not res!211115)) b!374398))

(assert (= (and b!374402 condMapEmpty!14934) mapIsEmpty!14934))

(assert (= (and b!374402 (not condMapEmpty!14934)) mapNonEmpty!14934))

(get-info :version)

(assert (= (and mapNonEmpty!14934 ((_ is ValueCellFull!4113) mapValue!14934)) b!374411))

(assert (= (and b!374402 ((_ is ValueCellFull!4113) mapDefault!14934)) b!374406))

(assert (= start!37138 b!374402))

(declare-fun m!370635 () Bool)

(assert (=> b!374397 m!370635))

(declare-fun m!370637 () Bool)

(assert (=> b!374397 m!370637))

(declare-fun m!370639 () Bool)

(assert (=> b!374398 m!370639))

(declare-fun m!370641 () Bool)

(assert (=> b!374398 m!370641))

(declare-fun m!370643 () Bool)

(assert (=> b!374398 m!370643))

(declare-fun m!370645 () Bool)

(assert (=> mapNonEmpty!14934 m!370645))

(declare-fun m!370647 () Bool)

(assert (=> start!37138 m!370647))

(declare-fun m!370649 () Bool)

(assert (=> start!37138 m!370649))

(declare-fun m!370651 () Bool)

(assert (=> start!37138 m!370651))

(declare-fun m!370653 () Bool)

(assert (=> b!374410 m!370653))

(declare-fun m!370655 () Bool)

(assert (=> b!374399 m!370655))

(declare-fun m!370657 () Bool)

(assert (=> b!374404 m!370657))

(declare-fun m!370659 () Bool)

(assert (=> b!374408 m!370659))

(declare-fun m!370661 () Bool)

(assert (=> b!374408 m!370661))

(declare-fun m!370663 () Bool)

(assert (=> b!374408 m!370663))

(declare-fun m!370665 () Bool)

(assert (=> b!374408 m!370665))

(declare-fun m!370667 () Bool)

(assert (=> b!374408 m!370667))

(declare-fun m!370669 () Bool)

(assert (=> b!374408 m!370669))

(assert (=> b!374408 m!370665))

(declare-fun m!370671 () Bool)

(assert (=> b!374408 m!370671))

(declare-fun m!370673 () Bool)

(assert (=> b!374408 m!370673))

(declare-fun m!370675 () Bool)

(assert (=> b!374401 m!370675))

(declare-fun m!370677 () Bool)

(assert (=> b!374403 m!370677))

(declare-fun m!370679 () Bool)

(assert (=> b!374409 m!370679))

(declare-fun m!370681 () Bool)

(assert (=> b!374407 m!370681))

(declare-fun m!370683 () Bool)

(assert (=> b!374407 m!370683))

(declare-fun m!370685 () Bool)

(assert (=> b!374407 m!370685))

(declare-fun m!370687 () Bool)

(assert (=> b!374407 m!370687))

(declare-fun m!370689 () Bool)

(assert (=> b!374407 m!370689))

(declare-fun m!370691 () Bool)

(assert (=> b!374407 m!370691))

(declare-fun m!370693 () Bool)

(assert (=> b!374407 m!370693))

(check-sat (not b!374398) (not b!374408) (not b!374409) (not b!374403) (not start!37138) (not mapNonEmpty!14934) (not b_next!8265) tp_is_empty!8913 (not b!374404) (not b!374401) (not b!374399) b_and!15507 (not b!374397) (not b!374407))
(check-sat b_and!15507 (not b_next!8265))
