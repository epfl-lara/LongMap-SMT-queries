; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37012 () Bool)

(assert start!37012)

(declare-fun b_free!8139 () Bool)

(declare-fun b_next!8139 () Bool)

(assert (=> start!37012 (= b_free!8139 (not b_next!8139))))

(declare-fun tp!29132 () Bool)

(declare-fun b_and!15381 () Bool)

(assert (=> start!37012 (= tp!29132 b_and!15381)))

(declare-fun b!371750 () Bool)

(declare-fun res!209038 () Bool)

(declare-fun e!226860 () Bool)

(assert (=> b!371750 (=> (not res!209038) (not e!226860))))

(declare-datatypes ((array!21515 0))(
  ( (array!21516 (arr!10226 (Array (_ BitVec 32) (_ BitVec 64))) (size!10578 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21515)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21515 (_ BitVec 32)) Bool)

(assert (=> b!371750 (= res!209038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371751 () Bool)

(declare-fun res!209037 () Bool)

(assert (=> b!371751 (=> (not res!209037) (not e!226860))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371751 (= res!209037 (validKeyInArray!0 k0!778))))

(declare-fun b!371752 () Bool)

(declare-fun res!209032 () Bool)

(assert (=> b!371752 (=> (not res!209032) (not e!226860))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371752 (= res!209032 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10578 _keys!658))))))

(declare-fun b!371753 () Bool)

(declare-fun e!226861 () Bool)

(declare-fun tp_is_empty!8787 () Bool)

(assert (=> b!371753 (= e!226861 tp_is_empty!8787)))

(declare-fun b!371754 () Bool)

(declare-fun e!226863 () Bool)

(assert (=> b!371754 (= e!226860 e!226863)))

(declare-fun res!209036 () Bool)

(assert (=> b!371754 (=> (not res!209036) (not e!226863))))

(declare-fun lt!170409 () array!21515)

(assert (=> b!371754 (= res!209036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170409 mask!970))))

(assert (=> b!371754 (= lt!170409 (array!21516 (store (arr!10226 _keys!658) i!548 k0!778) (size!10578 _keys!658)))))

(declare-fun mapIsEmpty!14745 () Bool)

(declare-fun mapRes!14745 () Bool)

(assert (=> mapIsEmpty!14745 mapRes!14745))

(declare-fun b!371755 () Bool)

(assert (=> b!371755 (= e!226863 (not true))))

(declare-datatypes ((V!12821 0))(
  ( (V!12822 (val!4438 Int)) )
))
(declare-datatypes ((tuple2!5888 0))(
  ( (tuple2!5889 (_1!2955 (_ BitVec 64)) (_2!2955 V!12821)) )
))
(declare-datatypes ((List!5729 0))(
  ( (Nil!5726) (Cons!5725 (h!6581 tuple2!5888) (t!10879 List!5729)) )
))
(declare-datatypes ((ListLongMap!4801 0))(
  ( (ListLongMap!4802 (toList!2416 List!5729)) )
))
(declare-fun lt!170408 () ListLongMap!4801)

(declare-fun lt!170407 () ListLongMap!4801)

(assert (=> b!371755 (and (= lt!170408 lt!170407) (= lt!170407 lt!170408))))

(declare-fun v!373 () V!12821)

(declare-fun lt!170405 () ListLongMap!4801)

(declare-fun +!762 (ListLongMap!4801 tuple2!5888) ListLongMap!4801)

(assert (=> b!371755 (= lt!170407 (+!762 lt!170405 (tuple2!5889 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4050 0))(
  ( (ValueCellFull!4050 (v!6635 V!12821)) (EmptyCell!4050) )
))
(declare-datatypes ((array!21517 0))(
  ( (array!21518 (arr!10227 (Array (_ BitVec 32) ValueCell!4050)) (size!10579 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21517)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12821)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11430 0))(
  ( (Unit!11431) )
))
(declare-fun lt!170406 () Unit!11430)

(declare-fun minValue!472 () V!12821)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!17 (array!21515 array!21517 (_ BitVec 32) (_ BitVec 32) V!12821 V!12821 (_ BitVec 32) (_ BitVec 64) V!12821 (_ BitVec 32) Int) Unit!11430)

(assert (=> b!371755 (= lt!170406 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!17 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!693 (array!21515 array!21517 (_ BitVec 32) (_ BitVec 32) V!12821 V!12821 (_ BitVec 32) Int) ListLongMap!4801)

(assert (=> b!371755 (= lt!170408 (getCurrentListMapNoExtraKeys!693 lt!170409 (array!21518 (store (arr!10227 _values!506) i!548 (ValueCellFull!4050 v!373)) (size!10579 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371755 (= lt!170405 (getCurrentListMapNoExtraKeys!693 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14745 () Bool)

(declare-fun tp!29133 () Bool)

(declare-fun e!226864 () Bool)

(assert (=> mapNonEmpty!14745 (= mapRes!14745 (and tp!29133 e!226864))))

(declare-fun mapValue!14745 () ValueCell!4050)

(declare-fun mapRest!14745 () (Array (_ BitVec 32) ValueCell!4050))

(declare-fun mapKey!14745 () (_ BitVec 32))

(assert (=> mapNonEmpty!14745 (= (arr!10227 _values!506) (store mapRest!14745 mapKey!14745 mapValue!14745))))

(declare-fun b!371757 () Bool)

(declare-fun res!209035 () Bool)

(assert (=> b!371757 (=> (not res!209035) (not e!226863))))

(declare-datatypes ((List!5730 0))(
  ( (Nil!5727) (Cons!5726 (h!6582 (_ BitVec 64)) (t!10880 List!5730)) )
))
(declare-fun arrayNoDuplicates!0 (array!21515 (_ BitVec 32) List!5730) Bool)

(assert (=> b!371757 (= res!209035 (arrayNoDuplicates!0 lt!170409 #b00000000000000000000000000000000 Nil!5727))))

(declare-fun b!371758 () Bool)

(declare-fun res!209034 () Bool)

(assert (=> b!371758 (=> (not res!209034) (not e!226860))))

(assert (=> b!371758 (= res!209034 (or (= (select (arr!10226 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10226 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371759 () Bool)

(declare-fun res!209030 () Bool)

(assert (=> b!371759 (=> (not res!209030) (not e!226860))))

(assert (=> b!371759 (= res!209030 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5727))))

(declare-fun b!371760 () Bool)

(assert (=> b!371760 (= e!226864 tp_is_empty!8787)))

(declare-fun b!371761 () Bool)

(declare-fun res!209033 () Bool)

(assert (=> b!371761 (=> (not res!209033) (not e!226860))))

(declare-fun arrayContainsKey!0 (array!21515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371761 (= res!209033 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371762 () Bool)

(declare-fun res!209031 () Bool)

(assert (=> b!371762 (=> (not res!209031) (not e!226860))))

(assert (=> b!371762 (= res!209031 (and (= (size!10579 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10578 _keys!658) (size!10579 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!209039 () Bool)

(assert (=> start!37012 (=> (not res!209039) (not e!226860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37012 (= res!209039 (validMask!0 mask!970))))

(assert (=> start!37012 e!226860))

(declare-fun e!226862 () Bool)

(declare-fun array_inv!7548 (array!21517) Bool)

(assert (=> start!37012 (and (array_inv!7548 _values!506) e!226862)))

(assert (=> start!37012 tp!29132))

(assert (=> start!37012 true))

(assert (=> start!37012 tp_is_empty!8787))

(declare-fun array_inv!7549 (array!21515) Bool)

(assert (=> start!37012 (array_inv!7549 _keys!658)))

(declare-fun b!371756 () Bool)

(assert (=> b!371756 (= e!226862 (and e!226861 mapRes!14745))))

(declare-fun condMapEmpty!14745 () Bool)

(declare-fun mapDefault!14745 () ValueCell!4050)

(assert (=> b!371756 (= condMapEmpty!14745 (= (arr!10227 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4050)) mapDefault!14745)))))

(assert (= (and start!37012 res!209039) b!371762))

(assert (= (and b!371762 res!209031) b!371750))

(assert (= (and b!371750 res!209038) b!371759))

(assert (= (and b!371759 res!209030) b!371752))

(assert (= (and b!371752 res!209032) b!371751))

(assert (= (and b!371751 res!209037) b!371758))

(assert (= (and b!371758 res!209034) b!371761))

(assert (= (and b!371761 res!209033) b!371754))

(assert (= (and b!371754 res!209036) b!371757))

(assert (= (and b!371757 res!209035) b!371755))

(assert (= (and b!371756 condMapEmpty!14745) mapIsEmpty!14745))

(assert (= (and b!371756 (not condMapEmpty!14745)) mapNonEmpty!14745))

(get-info :version)

(assert (= (and mapNonEmpty!14745 ((_ is ValueCellFull!4050) mapValue!14745)) b!371760))

(assert (= (and b!371756 ((_ is ValueCellFull!4050) mapDefault!14745)) b!371753))

(assert (= start!37012 b!371756))

(declare-fun m!367681 () Bool)

(assert (=> b!371759 m!367681))

(declare-fun m!367683 () Bool)

(assert (=> b!371761 m!367683))

(declare-fun m!367685 () Bool)

(assert (=> b!371750 m!367685))

(declare-fun m!367687 () Bool)

(assert (=> mapNonEmpty!14745 m!367687))

(declare-fun m!367689 () Bool)

(assert (=> b!371751 m!367689))

(declare-fun m!367691 () Bool)

(assert (=> b!371758 m!367691))

(declare-fun m!367693 () Bool)

(assert (=> b!371755 m!367693))

(declare-fun m!367695 () Bool)

(assert (=> b!371755 m!367695))

(declare-fun m!367697 () Bool)

(assert (=> b!371755 m!367697))

(declare-fun m!367699 () Bool)

(assert (=> b!371755 m!367699))

(declare-fun m!367701 () Bool)

(assert (=> b!371755 m!367701))

(declare-fun m!367703 () Bool)

(assert (=> b!371757 m!367703))

(declare-fun m!367705 () Bool)

(assert (=> b!371754 m!367705))

(declare-fun m!367707 () Bool)

(assert (=> b!371754 m!367707))

(declare-fun m!367709 () Bool)

(assert (=> start!37012 m!367709))

(declare-fun m!367711 () Bool)

(assert (=> start!37012 m!367711))

(declare-fun m!367713 () Bool)

(assert (=> start!37012 m!367713))

(check-sat (not b!371755) (not start!37012) (not mapNonEmpty!14745) (not b!371761) (not b!371754) (not b!371759) b_and!15381 (not b!371751) tp_is_empty!8787 (not b_next!8139) (not b!371750) (not b!371757))
(check-sat b_and!15381 (not b_next!8139))
