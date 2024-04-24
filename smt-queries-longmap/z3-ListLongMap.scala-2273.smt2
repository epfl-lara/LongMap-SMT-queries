; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37086 () Bool)

(assert start!37086)

(declare-fun b_free!8227 () Bool)

(declare-fun b_next!8227 () Bool)

(assert (=> start!37086 (= b_free!8227 (not b_next!8227))))

(declare-fun tp!29397 () Bool)

(declare-fun b_and!15483 () Bool)

(assert (=> start!37086 (= tp!29397 b_and!15483)))

(declare-fun b!373493 () Bool)

(declare-fun res!210432 () Bool)

(declare-fun e!227689 () Bool)

(assert (=> b!373493 (=> (not res!210432) (not e!227689))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373493 (= res!210432 (validKeyInArray!0 k0!778))))

(declare-fun b!373494 () Bool)

(declare-fun res!210426 () Bool)

(declare-fun e!227692 () Bool)

(assert (=> b!373494 (=> (not res!210426) (not e!227692))))

(declare-datatypes ((array!21672 0))(
  ( (array!21673 (arr!10304 (Array (_ BitVec 32) (_ BitVec 64))) (size!10656 (_ BitVec 32))) )
))
(declare-fun lt!171628 () array!21672)

(declare-datatypes ((List!5700 0))(
  ( (Nil!5697) (Cons!5696 (h!6552 (_ BitVec 64)) (t!10842 List!5700)) )
))
(declare-fun arrayNoDuplicates!0 (array!21672 (_ BitVec 32) List!5700) Bool)

(assert (=> b!373494 (= res!210426 (arrayNoDuplicates!0 lt!171628 #b00000000000000000000000000000000 Nil!5697))))

(declare-fun b!373495 () Bool)

(declare-fun e!227691 () Bool)

(assert (=> b!373495 (= e!227692 (not e!227691))))

(declare-fun res!210423 () Bool)

(assert (=> b!373495 (=> res!210423 e!227691)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373495 (= res!210423 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!12939 0))(
  ( (V!12940 (val!4482 Int)) )
))
(declare-datatypes ((tuple2!5856 0))(
  ( (tuple2!5857 (_1!2939 (_ BitVec 64)) (_2!2939 V!12939)) )
))
(declare-datatypes ((List!5701 0))(
  ( (Nil!5698) (Cons!5697 (h!6553 tuple2!5856) (t!10843 List!5701)) )
))
(declare-datatypes ((ListLongMap!4771 0))(
  ( (ListLongMap!4772 (toList!2401 List!5701)) )
))
(declare-fun lt!171613 () ListLongMap!4771)

(declare-datatypes ((ValueCell!4094 0))(
  ( (ValueCellFull!4094 (v!6680 V!12939)) (EmptyCell!4094) )
))
(declare-datatypes ((array!21674 0))(
  ( (array!21675 (arr!10305 (Array (_ BitVec 32) ValueCell!4094)) (size!10657 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21674)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12939)

(declare-fun _keys!658 () array!21672)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12939)

(declare-fun getCurrentListMap!1862 (array!21672 array!21674 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) Int) ListLongMap!4771)

(assert (=> b!373495 (= lt!171613 (getCurrentListMap!1862 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171626 () ListLongMap!4771)

(declare-fun lt!171625 () array!21674)

(assert (=> b!373495 (= lt!171626 (getCurrentListMap!1862 lt!171628 lt!171625 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171617 () ListLongMap!4771)

(declare-fun lt!171619 () ListLongMap!4771)

(assert (=> b!373495 (and (= lt!171617 lt!171619) (= lt!171619 lt!171617))))

(declare-fun lt!171616 () ListLongMap!4771)

(declare-fun lt!171612 () tuple2!5856)

(declare-fun +!797 (ListLongMap!4771 tuple2!5856) ListLongMap!4771)

(assert (=> b!373495 (= lt!171619 (+!797 lt!171616 lt!171612))))

(declare-fun v!373 () V!12939)

(assert (=> b!373495 (= lt!171612 (tuple2!5857 k0!778 v!373))))

(declare-datatypes ((Unit!11483 0))(
  ( (Unit!11484) )
))
(declare-fun lt!171621 () Unit!11483)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!49 (array!21672 array!21674 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) (_ BitVec 64) V!12939 (_ BitVec 32) Int) Unit!11483)

(assert (=> b!373495 (= lt!171621 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!49 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!709 (array!21672 array!21674 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) Int) ListLongMap!4771)

(assert (=> b!373495 (= lt!171617 (getCurrentListMapNoExtraKeys!709 lt!171628 lt!171625 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373495 (= lt!171625 (array!21675 (store (arr!10305 _values!506) i!548 (ValueCellFull!4094 v!373)) (size!10657 _values!506)))))

(assert (=> b!373495 (= lt!171616 (getCurrentListMapNoExtraKeys!709 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373496 () Bool)

(declare-fun res!210424 () Bool)

(assert (=> b!373496 (=> (not res!210424) (not e!227689))))

(assert (=> b!373496 (= res!210424 (or (= (select (arr!10304 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10304 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14877 () Bool)

(declare-fun mapRes!14877 () Bool)

(assert (=> mapIsEmpty!14877 mapRes!14877))

(declare-fun b!373497 () Bool)

(assert (=> b!373497 (= e!227689 e!227692)))

(declare-fun res!210431 () Bool)

(assert (=> b!373497 (=> (not res!210431) (not e!227692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21672 (_ BitVec 32)) Bool)

(assert (=> b!373497 (= res!210431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171628 mask!970))))

(assert (=> b!373497 (= lt!171628 (array!21673 (store (arr!10304 _keys!658) i!548 k0!778) (size!10656 _keys!658)))))

(declare-fun b!373498 () Bool)

(declare-fun e!227690 () Bool)

(assert (=> b!373498 (= e!227690 true)))

(declare-fun lt!171623 () ListLongMap!4771)

(declare-fun lt!171622 () ListLongMap!4771)

(declare-fun lt!171627 () tuple2!5856)

(assert (=> b!373498 (= (+!797 lt!171623 lt!171627) (+!797 lt!171622 lt!171612))))

(declare-fun lt!171624 () ListLongMap!4771)

(declare-fun lt!171620 () Unit!11483)

(declare-fun addCommutativeForDiffKeys!225 (ListLongMap!4771 (_ BitVec 64) V!12939 (_ BitVec 64) V!12939) Unit!11483)

(assert (=> b!373498 (= lt!171620 (addCommutativeForDiffKeys!225 lt!171624 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373499 () Bool)

(declare-fun res!210425 () Bool)

(assert (=> b!373499 (=> (not res!210425) (not e!227689))))

(assert (=> b!373499 (= res!210425 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10656 _keys!658))))))

(declare-fun b!373501 () Bool)

(declare-fun res!210429 () Bool)

(assert (=> b!373501 (=> (not res!210429) (not e!227689))))

(assert (=> b!373501 (= res!210429 (and (= (size!10657 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10656 _keys!658) (size!10657 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373502 () Bool)

(declare-fun res!210427 () Bool)

(assert (=> b!373502 (=> (not res!210427) (not e!227689))))

(assert (=> b!373502 (= res!210427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373503 () Bool)

(declare-fun e!227688 () Bool)

(declare-fun tp_is_empty!8875 () Bool)

(assert (=> b!373503 (= e!227688 tp_is_empty!8875)))

(declare-fun b!373504 () Bool)

(declare-fun res!210430 () Bool)

(assert (=> b!373504 (=> (not res!210430) (not e!227689))))

(declare-fun arrayContainsKey!0 (array!21672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373504 (= res!210430 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373505 () Bool)

(declare-fun e!227693 () Bool)

(assert (=> b!373505 (= e!227693 tp_is_empty!8875)))

(declare-fun b!373506 () Bool)

(assert (=> b!373506 (= e!227691 e!227690)))

(declare-fun res!210434 () Bool)

(assert (=> b!373506 (=> res!210434 e!227690)))

(assert (=> b!373506 (= res!210434 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171615 () ListLongMap!4771)

(assert (=> b!373506 (= lt!171615 lt!171623)))

(assert (=> b!373506 (= lt!171623 (+!797 lt!171624 lt!171612))))

(declare-fun lt!171618 () Unit!11483)

(assert (=> b!373506 (= lt!171618 (addCommutativeForDiffKeys!225 lt!171616 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373506 (= lt!171626 (+!797 lt!171615 lt!171627))))

(declare-fun lt!171614 () tuple2!5856)

(assert (=> b!373506 (= lt!171615 (+!797 lt!171619 lt!171614))))

(assert (=> b!373506 (= lt!171613 lt!171622)))

(assert (=> b!373506 (= lt!171622 (+!797 lt!171624 lt!171627))))

(assert (=> b!373506 (= lt!171624 (+!797 lt!171616 lt!171614))))

(assert (=> b!373506 (= lt!171626 (+!797 (+!797 lt!171617 lt!171614) lt!171627))))

(assert (=> b!373506 (= lt!171627 (tuple2!5857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373506 (= lt!171614 (tuple2!5857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373507 () Bool)

(declare-fun e!227687 () Bool)

(assert (=> b!373507 (= e!227687 (and e!227688 mapRes!14877))))

(declare-fun condMapEmpty!14877 () Bool)

(declare-fun mapDefault!14877 () ValueCell!4094)

(assert (=> b!373507 (= condMapEmpty!14877 (= (arr!10305 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4094)) mapDefault!14877)))))

(declare-fun mapNonEmpty!14877 () Bool)

(declare-fun tp!29396 () Bool)

(assert (=> mapNonEmpty!14877 (= mapRes!14877 (and tp!29396 e!227693))))

(declare-fun mapRest!14877 () (Array (_ BitVec 32) ValueCell!4094))

(declare-fun mapValue!14877 () ValueCell!4094)

(declare-fun mapKey!14877 () (_ BitVec 32))

(assert (=> mapNonEmpty!14877 (= (arr!10305 _values!506) (store mapRest!14877 mapKey!14877 mapValue!14877))))

(declare-fun b!373500 () Bool)

(declare-fun res!210433 () Bool)

(assert (=> b!373500 (=> (not res!210433) (not e!227689))))

(assert (=> b!373500 (= res!210433 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5697))))

(declare-fun res!210428 () Bool)

(assert (=> start!37086 (=> (not res!210428) (not e!227689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37086 (= res!210428 (validMask!0 mask!970))))

(assert (=> start!37086 e!227689))

(declare-fun array_inv!7652 (array!21674) Bool)

(assert (=> start!37086 (and (array_inv!7652 _values!506) e!227687)))

(assert (=> start!37086 tp!29397))

(assert (=> start!37086 true))

(assert (=> start!37086 tp_is_empty!8875))

(declare-fun array_inv!7653 (array!21672) Bool)

(assert (=> start!37086 (array_inv!7653 _keys!658)))

(assert (= (and start!37086 res!210428) b!373501))

(assert (= (and b!373501 res!210429) b!373502))

(assert (= (and b!373502 res!210427) b!373500))

(assert (= (and b!373500 res!210433) b!373499))

(assert (= (and b!373499 res!210425) b!373493))

(assert (= (and b!373493 res!210432) b!373496))

(assert (= (and b!373496 res!210424) b!373504))

(assert (= (and b!373504 res!210430) b!373497))

(assert (= (and b!373497 res!210431) b!373494))

(assert (= (and b!373494 res!210426) b!373495))

(assert (= (and b!373495 (not res!210423)) b!373506))

(assert (= (and b!373506 (not res!210434)) b!373498))

(assert (= (and b!373507 condMapEmpty!14877) mapIsEmpty!14877))

(assert (= (and b!373507 (not condMapEmpty!14877)) mapNonEmpty!14877))

(get-info :version)

(assert (= (and mapNonEmpty!14877 ((_ is ValueCellFull!4094) mapValue!14877)) b!373505))

(assert (= (and b!373507 ((_ is ValueCellFull!4094) mapDefault!14877)) b!373503))

(assert (= start!37086 b!373507))

(declare-fun m!369725 () Bool)

(assert (=> b!373497 m!369725))

(declare-fun m!369727 () Bool)

(assert (=> b!373497 m!369727))

(declare-fun m!369729 () Bool)

(assert (=> b!373502 m!369729))

(declare-fun m!369731 () Bool)

(assert (=> b!373506 m!369731))

(declare-fun m!369733 () Bool)

(assert (=> b!373506 m!369733))

(declare-fun m!369735 () Bool)

(assert (=> b!373506 m!369735))

(declare-fun m!369737 () Bool)

(assert (=> b!373506 m!369737))

(declare-fun m!369739 () Bool)

(assert (=> b!373506 m!369739))

(declare-fun m!369741 () Bool)

(assert (=> b!373506 m!369741))

(declare-fun m!369743 () Bool)

(assert (=> b!373506 m!369743))

(assert (=> b!373506 m!369739))

(declare-fun m!369745 () Bool)

(assert (=> b!373506 m!369745))

(declare-fun m!369747 () Bool)

(assert (=> b!373504 m!369747))

(declare-fun m!369749 () Bool)

(assert (=> b!373498 m!369749))

(declare-fun m!369751 () Bool)

(assert (=> b!373498 m!369751))

(declare-fun m!369753 () Bool)

(assert (=> b!373498 m!369753))

(declare-fun m!369755 () Bool)

(assert (=> b!373493 m!369755))

(declare-fun m!369757 () Bool)

(assert (=> b!373500 m!369757))

(declare-fun m!369759 () Bool)

(assert (=> mapNonEmpty!14877 m!369759))

(declare-fun m!369761 () Bool)

(assert (=> start!37086 m!369761))

(declare-fun m!369763 () Bool)

(assert (=> start!37086 m!369763))

(declare-fun m!369765 () Bool)

(assert (=> start!37086 m!369765))

(declare-fun m!369767 () Bool)

(assert (=> b!373495 m!369767))

(declare-fun m!369769 () Bool)

(assert (=> b!373495 m!369769))

(declare-fun m!369771 () Bool)

(assert (=> b!373495 m!369771))

(declare-fun m!369773 () Bool)

(assert (=> b!373495 m!369773))

(declare-fun m!369775 () Bool)

(assert (=> b!373495 m!369775))

(declare-fun m!369777 () Bool)

(assert (=> b!373495 m!369777))

(declare-fun m!369779 () Bool)

(assert (=> b!373495 m!369779))

(declare-fun m!369781 () Bool)

(assert (=> b!373496 m!369781))

(declare-fun m!369783 () Bool)

(assert (=> b!373494 m!369783))

(check-sat (not b!373504) (not b!373502) (not mapNonEmpty!14877) (not b!373497) (not b!373506) (not start!37086) (not b_next!8227) (not b!373495) (not b!373493) tp_is_empty!8875 b_and!15483 (not b!373494) (not b!373498) (not b!373500))
(check-sat b_and!15483 (not b_next!8227))
