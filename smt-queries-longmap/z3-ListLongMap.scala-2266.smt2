; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37044 () Bool)

(assert start!37044)

(declare-fun b_free!8185 () Bool)

(declare-fun b_next!8185 () Bool)

(assert (=> start!37044 (= b_free!8185 (not b_next!8185))))

(declare-fun tp!29271 () Bool)

(declare-fun b_and!15401 () Bool)

(assert (=> start!37044 (= tp!29271 b_and!15401)))

(declare-fun b!372376 () Bool)

(declare-fun res!209598 () Bool)

(declare-fun e!227100 () Bool)

(assert (=> b!372376 (=> (not res!209598) (not e!227100))))

(declare-datatypes ((array!21589 0))(
  ( (array!21590 (arr!10263 (Array (_ BitVec 32) (_ BitVec 64))) (size!10616 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21589)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21589 (_ BitVec 32)) Bool)

(assert (=> b!372376 (= res!209598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!209600 () Bool)

(assert (=> start!37044 (=> (not res!209600) (not e!227100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37044 (= res!209600 (validMask!0 mask!970))))

(assert (=> start!37044 e!227100))

(declare-datatypes ((V!12883 0))(
  ( (V!12884 (val!4461 Int)) )
))
(declare-datatypes ((ValueCell!4073 0))(
  ( (ValueCellFull!4073 (v!6652 V!12883)) (EmptyCell!4073) )
))
(declare-datatypes ((array!21591 0))(
  ( (array!21592 (arr!10264 (Array (_ BitVec 32) ValueCell!4073)) (size!10617 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21591)

(declare-fun e!227104 () Bool)

(declare-fun array_inv!7580 (array!21591) Bool)

(assert (=> start!37044 (and (array_inv!7580 _values!506) e!227104)))

(assert (=> start!37044 tp!29271))

(assert (=> start!37044 true))

(declare-fun tp_is_empty!8833 () Bool)

(assert (=> start!37044 tp_is_empty!8833))

(declare-fun array_inv!7581 (array!21589) Bool)

(assert (=> start!37044 (array_inv!7581 _keys!658)))

(declare-fun mapIsEmpty!14814 () Bool)

(declare-fun mapRes!14814 () Bool)

(assert (=> mapIsEmpty!14814 mapRes!14814))

(declare-fun b!372377 () Bool)

(declare-fun res!209599 () Bool)

(assert (=> b!372377 (=> (not res!209599) (not e!227100))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372377 (= res!209599 (and (= (size!10617 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10616 _keys!658) (size!10617 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372378 () Bool)

(declare-fun e!227102 () Bool)

(assert (=> b!372378 (= e!227102 tp_is_empty!8833)))

(declare-fun b!372379 () Bool)

(declare-fun res!209594 () Bool)

(assert (=> b!372379 (=> (not res!209594) (not e!227100))))

(declare-datatypes ((List!5728 0))(
  ( (Nil!5725) (Cons!5724 (h!6580 (_ BitVec 64)) (t!10869 List!5728)) )
))
(declare-fun arrayNoDuplicates!0 (array!21589 (_ BitVec 32) List!5728) Bool)

(assert (=> b!372379 (= res!209594 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5725))))

(declare-fun b!372380 () Bool)

(declare-fun res!209597 () Bool)

(assert (=> b!372380 (=> (not res!209597) (not e!227100))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372380 (= res!209597 (or (= (select (arr!10263 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10263 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372381 () Bool)

(declare-fun e!227105 () Bool)

(assert (=> b!372381 (= e!227104 (and e!227105 mapRes!14814))))

(declare-fun condMapEmpty!14814 () Bool)

(declare-fun mapDefault!14814 () ValueCell!4073)

(assert (=> b!372381 (= condMapEmpty!14814 (= (arr!10264 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4073)) mapDefault!14814)))))

(declare-fun b!372382 () Bool)

(assert (=> b!372382 (= e!227105 tp_is_empty!8833)))

(declare-fun b!372383 () Bool)

(declare-fun res!209595 () Bool)

(assert (=> b!372383 (=> (not res!209595) (not e!227100))))

(assert (=> b!372383 (= res!209595 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10616 _keys!658))))))

(declare-fun b!372384 () Bool)

(declare-fun res!209593 () Bool)

(assert (=> b!372384 (=> (not res!209593) (not e!227100))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372384 (= res!209593 (validKeyInArray!0 k0!778))))

(declare-fun b!372385 () Bool)

(declare-fun e!227103 () Bool)

(assert (=> b!372385 (= e!227100 e!227103)))

(declare-fun res!209596 () Bool)

(assert (=> b!372385 (=> (not res!209596) (not e!227103))))

(declare-fun lt!170633 () array!21589)

(assert (=> b!372385 (= res!209596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170633 mask!970))))

(assert (=> b!372385 (= lt!170633 (array!21590 (store (arr!10263 _keys!658) i!548 k0!778) (size!10616 _keys!658)))))

(declare-fun b!372386 () Bool)

(assert (=> b!372386 (= e!227103 (not true))))

(declare-datatypes ((tuple2!5890 0))(
  ( (tuple2!5891 (_1!2956 (_ BitVec 64)) (_2!2956 V!12883)) )
))
(declare-datatypes ((List!5729 0))(
  ( (Nil!5726) (Cons!5725 (h!6581 tuple2!5890) (t!10870 List!5729)) )
))
(declare-datatypes ((ListLongMap!4793 0))(
  ( (ListLongMap!4794 (toList!2412 List!5729)) )
))
(declare-fun lt!170630 () ListLongMap!4793)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12883)

(declare-fun lt!170632 () array!21591)

(declare-fun minValue!472 () V!12883)

(declare-fun getCurrentListMap!1838 (array!21589 array!21591 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) Int) ListLongMap!4793)

(assert (=> b!372386 (= lt!170630 (getCurrentListMap!1838 lt!170633 lt!170632 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170634 () ListLongMap!4793)

(declare-fun lt!170629 () ListLongMap!4793)

(assert (=> b!372386 (and (= lt!170634 lt!170629) (= lt!170629 lt!170634))))

(declare-fun v!373 () V!12883)

(declare-fun lt!170628 () ListLongMap!4793)

(declare-fun +!780 (ListLongMap!4793 tuple2!5890) ListLongMap!4793)

(assert (=> b!372386 (= lt!170629 (+!780 lt!170628 (tuple2!5891 k0!778 v!373)))))

(declare-datatypes ((Unit!11436 0))(
  ( (Unit!11437) )
))
(declare-fun lt!170631 () Unit!11436)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!31 (array!21589 array!21591 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) (_ BitVec 64) V!12883 (_ BitVec 32) Int) Unit!11436)

(assert (=> b!372386 (= lt!170631 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!31 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!703 (array!21589 array!21591 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) Int) ListLongMap!4793)

(assert (=> b!372386 (= lt!170634 (getCurrentListMapNoExtraKeys!703 lt!170633 lt!170632 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372386 (= lt!170632 (array!21592 (store (arr!10264 _values!506) i!548 (ValueCellFull!4073 v!373)) (size!10617 _values!506)))))

(assert (=> b!372386 (= lt!170628 (getCurrentListMapNoExtraKeys!703 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372387 () Bool)

(declare-fun res!209592 () Bool)

(assert (=> b!372387 (=> (not res!209592) (not e!227103))))

(assert (=> b!372387 (= res!209592 (arrayNoDuplicates!0 lt!170633 #b00000000000000000000000000000000 Nil!5725))))

(declare-fun mapNonEmpty!14814 () Bool)

(declare-fun tp!29270 () Bool)

(assert (=> mapNonEmpty!14814 (= mapRes!14814 (and tp!29270 e!227102))))

(declare-fun mapKey!14814 () (_ BitVec 32))

(declare-fun mapValue!14814 () ValueCell!4073)

(declare-fun mapRest!14814 () (Array (_ BitVec 32) ValueCell!4073))

(assert (=> mapNonEmpty!14814 (= (arr!10264 _values!506) (store mapRest!14814 mapKey!14814 mapValue!14814))))

(declare-fun b!372388 () Bool)

(declare-fun res!209591 () Bool)

(assert (=> b!372388 (=> (not res!209591) (not e!227100))))

(declare-fun arrayContainsKey!0 (array!21589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372388 (= res!209591 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37044 res!209600) b!372377))

(assert (= (and b!372377 res!209599) b!372376))

(assert (= (and b!372376 res!209598) b!372379))

(assert (= (and b!372379 res!209594) b!372383))

(assert (= (and b!372383 res!209595) b!372384))

(assert (= (and b!372384 res!209593) b!372380))

(assert (= (and b!372380 res!209597) b!372388))

(assert (= (and b!372388 res!209591) b!372385))

(assert (= (and b!372385 res!209596) b!372387))

(assert (= (and b!372387 res!209592) b!372386))

(assert (= (and b!372381 condMapEmpty!14814) mapIsEmpty!14814))

(assert (= (and b!372381 (not condMapEmpty!14814)) mapNonEmpty!14814))

(get-info :version)

(assert (= (and mapNonEmpty!14814 ((_ is ValueCellFull!4073) mapValue!14814)) b!372378))

(assert (= (and b!372381 ((_ is ValueCellFull!4073) mapDefault!14814)) b!372382))

(assert (= start!37044 b!372381))

(declare-fun m!367775 () Bool)

(assert (=> b!372380 m!367775))

(declare-fun m!367777 () Bool)

(assert (=> mapNonEmpty!14814 m!367777))

(declare-fun m!367779 () Bool)

(assert (=> b!372376 m!367779))

(declare-fun m!367781 () Bool)

(assert (=> b!372386 m!367781))

(declare-fun m!367783 () Bool)

(assert (=> b!372386 m!367783))

(declare-fun m!367785 () Bool)

(assert (=> b!372386 m!367785))

(declare-fun m!367787 () Bool)

(assert (=> b!372386 m!367787))

(declare-fun m!367789 () Bool)

(assert (=> b!372386 m!367789))

(declare-fun m!367791 () Bool)

(assert (=> b!372386 m!367791))

(declare-fun m!367793 () Bool)

(assert (=> b!372384 m!367793))

(declare-fun m!367795 () Bool)

(assert (=> start!37044 m!367795))

(declare-fun m!367797 () Bool)

(assert (=> start!37044 m!367797))

(declare-fun m!367799 () Bool)

(assert (=> start!37044 m!367799))

(declare-fun m!367801 () Bool)

(assert (=> b!372388 m!367801))

(declare-fun m!367803 () Bool)

(assert (=> b!372385 m!367803))

(declare-fun m!367805 () Bool)

(assert (=> b!372385 m!367805))

(declare-fun m!367807 () Bool)

(assert (=> b!372379 m!367807))

(declare-fun m!367809 () Bool)

(assert (=> b!372387 m!367809))

(check-sat tp_is_empty!8833 b_and!15401 (not start!37044) (not b!372376) (not b!372379) (not b!372384) (not b_next!8185) (not b!372388) (not b!372385) (not b!372386) (not b!372387) (not mapNonEmpty!14814))
(check-sat b_and!15401 (not b_next!8185))
