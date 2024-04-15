; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36858 () Bool)

(assert start!36858)

(declare-fun b_free!7999 () Bool)

(declare-fun b_next!7999 () Bool)

(assert (=> start!36858 (= b_free!7999 (not b_next!7999))))

(declare-fun tp!28712 () Bool)

(declare-fun b_and!15215 () Bool)

(assert (=> start!36858 (= tp!28712 b_and!15215)))

(declare-fun b!368749 () Bool)

(declare-fun res!206806 () Bool)

(declare-fun e!225430 () Bool)

(assert (=> b!368749 (=> (not res!206806) (not e!225430))))

(declare-datatypes ((array!21231 0))(
  ( (array!21232 (arr!10084 (Array (_ BitVec 32) (_ BitVec 64))) (size!10437 (_ BitVec 32))) )
))
(declare-fun lt!169407 () array!21231)

(declare-datatypes ((List!5591 0))(
  ( (Nil!5588) (Cons!5587 (h!6443 (_ BitVec 64)) (t!10732 List!5591)) )
))
(declare-fun arrayNoDuplicates!0 (array!21231 (_ BitVec 32) List!5591) Bool)

(assert (=> b!368749 (= res!206806 (arrayNoDuplicates!0 lt!169407 #b00000000000000000000000000000000 Nil!5588))))

(declare-fun b!368750 () Bool)

(declare-fun res!206803 () Bool)

(declare-fun e!225429 () Bool)

(assert (=> b!368750 (=> (not res!206803) (not e!225429))))

(declare-fun _keys!658 () array!21231)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21231 (_ BitVec 32)) Bool)

(assert (=> b!368750 (= res!206803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368751 () Bool)

(assert (=> b!368751 (= e!225430 false)))

(declare-datatypes ((V!12635 0))(
  ( (V!12636 (val!4368 Int)) )
))
(declare-datatypes ((ValueCell!3980 0))(
  ( (ValueCellFull!3980 (v!6559 V!12635)) (EmptyCell!3980) )
))
(declare-datatypes ((array!21233 0))(
  ( (array!21234 (arr!10085 (Array (_ BitVec 32) ValueCell!3980)) (size!10438 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21233)

(declare-datatypes ((tuple2!5762 0))(
  ( (tuple2!5763 (_1!2892 (_ BitVec 64)) (_2!2892 V!12635)) )
))
(declare-datatypes ((List!5592 0))(
  ( (Nil!5589) (Cons!5588 (h!6444 tuple2!5762) (t!10733 List!5592)) )
))
(declare-datatypes ((ListLongMap!4665 0))(
  ( (ListLongMap!4666 (toList!2348 List!5592)) )
))
(declare-fun lt!169406 () ListLongMap!4665)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12635)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12635)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12635)

(declare-fun getCurrentListMapNoExtraKeys!639 (array!21231 array!21233 (_ BitVec 32) (_ BitVec 32) V!12635 V!12635 (_ BitVec 32) Int) ListLongMap!4665)

(assert (=> b!368751 (= lt!169406 (getCurrentListMapNoExtraKeys!639 lt!169407 (array!21234 (store (arr!10085 _values!506) i!548 (ValueCellFull!3980 v!373)) (size!10438 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169405 () ListLongMap!4665)

(assert (=> b!368751 (= lt!169405 (getCurrentListMapNoExtraKeys!639 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368752 () Bool)

(declare-fun e!225427 () Bool)

(declare-fun e!225426 () Bool)

(declare-fun mapRes!14535 () Bool)

(assert (=> b!368752 (= e!225427 (and e!225426 mapRes!14535))))

(declare-fun condMapEmpty!14535 () Bool)

(declare-fun mapDefault!14535 () ValueCell!3980)

(assert (=> b!368752 (= condMapEmpty!14535 (= (arr!10085 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3980)) mapDefault!14535)))))

(declare-fun b!368753 () Bool)

(declare-fun res!206801 () Bool)

(assert (=> b!368753 (=> (not res!206801) (not e!225429))))

(assert (=> b!368753 (= res!206801 (or (= (select (arr!10084 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10084 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368754 () Bool)

(declare-fun res!206808 () Bool)

(assert (=> b!368754 (=> (not res!206808) (not e!225429))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368754 (= res!206808 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368755 () Bool)

(assert (=> b!368755 (= e!225429 e!225430)))

(declare-fun res!206809 () Bool)

(assert (=> b!368755 (=> (not res!206809) (not e!225430))))

(assert (=> b!368755 (= res!206809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169407 mask!970))))

(assert (=> b!368755 (= lt!169407 (array!21232 (store (arr!10084 _keys!658) i!548 k0!778) (size!10437 _keys!658)))))

(declare-fun b!368756 () Bool)

(declare-fun e!225428 () Bool)

(declare-fun tp_is_empty!8647 () Bool)

(assert (=> b!368756 (= e!225428 tp_is_empty!8647)))

(declare-fun b!368757 () Bool)

(declare-fun res!206810 () Bool)

(assert (=> b!368757 (=> (not res!206810) (not e!225429))))

(assert (=> b!368757 (= res!206810 (and (= (size!10438 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10437 _keys!658) (size!10438 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14535 () Bool)

(declare-fun tp!28713 () Bool)

(assert (=> mapNonEmpty!14535 (= mapRes!14535 (and tp!28713 e!225428))))

(declare-fun mapKey!14535 () (_ BitVec 32))

(declare-fun mapRest!14535 () (Array (_ BitVec 32) ValueCell!3980))

(declare-fun mapValue!14535 () ValueCell!3980)

(assert (=> mapNonEmpty!14535 (= (arr!10085 _values!506) (store mapRest!14535 mapKey!14535 mapValue!14535))))

(declare-fun b!368758 () Bool)

(assert (=> b!368758 (= e!225426 tp_is_empty!8647)))

(declare-fun b!368759 () Bool)

(declare-fun res!206805 () Bool)

(assert (=> b!368759 (=> (not res!206805) (not e!225429))))

(assert (=> b!368759 (= res!206805 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5588))))

(declare-fun res!206804 () Bool)

(assert (=> start!36858 (=> (not res!206804) (not e!225429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36858 (= res!206804 (validMask!0 mask!970))))

(assert (=> start!36858 e!225429))

(declare-fun array_inv!7468 (array!21233) Bool)

(assert (=> start!36858 (and (array_inv!7468 _values!506) e!225427)))

(assert (=> start!36858 tp!28712))

(assert (=> start!36858 true))

(assert (=> start!36858 tp_is_empty!8647))

(declare-fun array_inv!7469 (array!21231) Bool)

(assert (=> start!36858 (array_inv!7469 _keys!658)))

(declare-fun b!368760 () Bool)

(declare-fun res!206802 () Bool)

(assert (=> b!368760 (=> (not res!206802) (not e!225429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368760 (= res!206802 (validKeyInArray!0 k0!778))))

(declare-fun b!368761 () Bool)

(declare-fun res!206807 () Bool)

(assert (=> b!368761 (=> (not res!206807) (not e!225429))))

(assert (=> b!368761 (= res!206807 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10437 _keys!658))))))

(declare-fun mapIsEmpty!14535 () Bool)

(assert (=> mapIsEmpty!14535 mapRes!14535))

(assert (= (and start!36858 res!206804) b!368757))

(assert (= (and b!368757 res!206810) b!368750))

(assert (= (and b!368750 res!206803) b!368759))

(assert (= (and b!368759 res!206805) b!368761))

(assert (= (and b!368761 res!206807) b!368760))

(assert (= (and b!368760 res!206802) b!368753))

(assert (= (and b!368753 res!206801) b!368754))

(assert (= (and b!368754 res!206808) b!368755))

(assert (= (and b!368755 res!206809) b!368749))

(assert (= (and b!368749 res!206806) b!368751))

(assert (= (and b!368752 condMapEmpty!14535) mapIsEmpty!14535))

(assert (= (and b!368752 (not condMapEmpty!14535)) mapNonEmpty!14535))

(get-info :version)

(assert (= (and mapNonEmpty!14535 ((_ is ValueCellFull!3980) mapValue!14535)) b!368756))

(assert (= (and b!368752 ((_ is ValueCellFull!3980) mapDefault!14535)) b!368758))

(assert (= start!36858 b!368752))

(declare-fun m!364769 () Bool)

(assert (=> b!368755 m!364769))

(declare-fun m!364771 () Bool)

(assert (=> b!368755 m!364771))

(declare-fun m!364773 () Bool)

(assert (=> start!36858 m!364773))

(declare-fun m!364775 () Bool)

(assert (=> start!36858 m!364775))

(declare-fun m!364777 () Bool)

(assert (=> start!36858 m!364777))

(declare-fun m!364779 () Bool)

(assert (=> b!368749 m!364779))

(declare-fun m!364781 () Bool)

(assert (=> b!368750 m!364781))

(declare-fun m!364783 () Bool)

(assert (=> mapNonEmpty!14535 m!364783))

(declare-fun m!364785 () Bool)

(assert (=> b!368759 m!364785))

(declare-fun m!364787 () Bool)

(assert (=> b!368753 m!364787))

(declare-fun m!364789 () Bool)

(assert (=> b!368760 m!364789))

(declare-fun m!364791 () Bool)

(assert (=> b!368751 m!364791))

(declare-fun m!364793 () Bool)

(assert (=> b!368751 m!364793))

(declare-fun m!364795 () Bool)

(assert (=> b!368751 m!364795))

(declare-fun m!364797 () Bool)

(assert (=> b!368754 m!364797))

(check-sat (not start!36858) (not mapNonEmpty!14535) (not b!368750) (not b!368760) (not b!368759) (not b!368754) tp_is_empty!8647 (not b!368755) (not b!368749) (not b_next!7999) (not b!368751) b_and!15215)
(check-sat b_and!15215 (not b_next!7999))
