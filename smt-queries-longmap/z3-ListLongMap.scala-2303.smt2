; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37266 () Bool)

(assert start!37266)

(declare-fun b_free!8407 () Bool)

(declare-fun b_next!8407 () Bool)

(assert (=> start!37266 (= b_free!8407 (not b_next!8407))))

(declare-fun tp!29937 () Bool)

(declare-fun b_and!15623 () Bool)

(assert (=> start!37266 (= tp!29937 b_and!15623)))

(declare-fun b!377330 () Bool)

(declare-fun res!213551 () Bool)

(declare-fun e!229710 () Bool)

(assert (=> b!377330 (=> (not res!213551) (not e!229710))))

(declare-datatypes ((array!22021 0))(
  ( (array!22022 (arr!10479 (Array (_ BitVec 32) (_ BitVec 64))) (size!10832 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22021)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22021 (_ BitVec 32)) Bool)

(assert (=> b!377330 (= res!213551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377331 () Bool)

(declare-fun res!213555 () Bool)

(assert (=> b!377331 (=> (not res!213555) (not e!229710))))

(declare-datatypes ((List!5907 0))(
  ( (Nil!5904) (Cons!5903 (h!6759 (_ BitVec 64)) (t!11048 List!5907)) )
))
(declare-fun arrayNoDuplicates!0 (array!22021 (_ BitVec 32) List!5907) Bool)

(assert (=> b!377331 (= res!213555 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5904))))

(declare-fun b!377333 () Bool)

(declare-fun res!213550 () Bool)

(assert (=> b!377333 (=> (not res!213550) (not e!229710))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377333 (= res!213550 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377334 () Bool)

(declare-fun res!213548 () Bool)

(assert (=> b!377334 (=> (not res!213548) (not e!229710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377334 (= res!213548 (validKeyInArray!0 k0!778))))

(declare-fun b!377335 () Bool)

(declare-fun e!229707 () Bool)

(declare-fun e!229709 () Bool)

(assert (=> b!377335 (= e!229707 (not e!229709))))

(declare-fun res!213556 () Bool)

(assert (=> b!377335 (=> res!213556 e!229709)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377335 (= res!213556 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13179 0))(
  ( (V!13180 (val!4572 Int)) )
))
(declare-datatypes ((tuple2!6078 0))(
  ( (tuple2!6079 (_1!3050 (_ BitVec 64)) (_2!3050 V!13179)) )
))
(declare-datatypes ((List!5908 0))(
  ( (Nil!5905) (Cons!5904 (h!6760 tuple2!6078) (t!11049 List!5908)) )
))
(declare-datatypes ((ListLongMap!4981 0))(
  ( (ListLongMap!4982 (toList!2506 List!5908)) )
))
(declare-fun lt!175409 () ListLongMap!4981)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13179)

(declare-datatypes ((ValueCell!4184 0))(
  ( (ValueCellFull!4184 (v!6763 V!13179)) (EmptyCell!4184) )
))
(declare-datatypes ((array!22023 0))(
  ( (array!22024 (arr!10480 (Array (_ BitVec 32) ValueCell!4184)) (size!10833 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22023)

(declare-fun minValue!472 () V!13179)

(declare-fun getCurrentListMap!1914 (array!22021 array!22023 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) Int) ListLongMap!4981)

(assert (=> b!377335 (= lt!175409 (getCurrentListMap!1914 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175410 () ListLongMap!4981)

(declare-fun lt!175406 () array!22021)

(declare-fun lt!175411 () array!22023)

(assert (=> b!377335 (= lt!175410 (getCurrentListMap!1914 lt!175406 lt!175411 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175402 () ListLongMap!4981)

(declare-fun lt!175401 () ListLongMap!4981)

(assert (=> b!377335 (and (= lt!175402 lt!175401) (= lt!175401 lt!175402))))

(declare-fun lt!175408 () ListLongMap!4981)

(declare-fun lt!175407 () tuple2!6078)

(declare-fun +!874 (ListLongMap!4981 tuple2!6078) ListLongMap!4981)

(assert (=> b!377335 (= lt!175401 (+!874 lt!175408 lt!175407))))

(declare-fun v!373 () V!13179)

(assert (=> b!377335 (= lt!175407 (tuple2!6079 k0!778 v!373))))

(declare-datatypes ((Unit!11616 0))(
  ( (Unit!11617) )
))
(declare-fun lt!175405 () Unit!11616)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!107 (array!22021 array!22023 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) (_ BitVec 64) V!13179 (_ BitVec 32) Int) Unit!11616)

(assert (=> b!377335 (= lt!175405 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!107 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!779 (array!22021 array!22023 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) Int) ListLongMap!4981)

(assert (=> b!377335 (= lt!175402 (getCurrentListMapNoExtraKeys!779 lt!175406 lt!175411 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377335 (= lt!175411 (array!22024 (store (arr!10480 _values!506) i!548 (ValueCellFull!4184 v!373)) (size!10833 _values!506)))))

(assert (=> b!377335 (= lt!175408 (getCurrentListMapNoExtraKeys!779 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377336 () Bool)

(declare-fun e!229706 () Bool)

(assert (=> b!377336 (= e!229709 e!229706)))

(declare-fun res!213549 () Bool)

(assert (=> b!377336 (=> res!213549 e!229706)))

(assert (=> b!377336 (= res!213549 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175403 () ListLongMap!4981)

(assert (=> b!377336 (= lt!175410 lt!175403)))

(declare-fun lt!175413 () tuple2!6078)

(assert (=> b!377336 (= lt!175403 (+!874 lt!175401 lt!175413))))

(declare-fun lt!175404 () ListLongMap!4981)

(assert (=> b!377336 (= lt!175409 lt!175404)))

(assert (=> b!377336 (= lt!175404 (+!874 lt!175408 lt!175413))))

(assert (=> b!377336 (= lt!175410 (+!874 lt!175402 lt!175413))))

(assert (=> b!377336 (= lt!175413 (tuple2!6079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377337 () Bool)

(declare-fun res!213547 () Bool)

(assert (=> b!377337 (=> (not res!213547) (not e!229710))))

(assert (=> b!377337 (= res!213547 (and (= (size!10833 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10832 _keys!658) (size!10833 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15147 () Bool)

(declare-fun mapRes!15147 () Bool)

(declare-fun tp!29936 () Bool)

(declare-fun e!229705 () Bool)

(assert (=> mapNonEmpty!15147 (= mapRes!15147 (and tp!29936 e!229705))))

(declare-fun mapRest!15147 () (Array (_ BitVec 32) ValueCell!4184))

(declare-fun mapKey!15147 () (_ BitVec 32))

(declare-fun mapValue!15147 () ValueCell!4184)

(assert (=> mapNonEmpty!15147 (= (arr!10480 _values!506) (store mapRest!15147 mapKey!15147 mapValue!15147))))

(declare-fun b!377338 () Bool)

(declare-fun e!229712 () Bool)

(declare-fun tp_is_empty!9055 () Bool)

(assert (=> b!377338 (= e!229712 tp_is_empty!9055)))

(declare-fun b!377339 () Bool)

(declare-fun res!213553 () Bool)

(assert (=> b!377339 (=> (not res!213553) (not e!229710))))

(assert (=> b!377339 (= res!213553 (or (= (select (arr!10479 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10479 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377340 () Bool)

(assert (=> b!377340 (= e!229710 e!229707)))

(declare-fun res!213557 () Bool)

(assert (=> b!377340 (=> (not res!213557) (not e!229707))))

(assert (=> b!377340 (= res!213557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175406 mask!970))))

(assert (=> b!377340 (= lt!175406 (array!22022 (store (arr!10479 _keys!658) i!548 k0!778) (size!10832 _keys!658)))))

(declare-fun b!377341 () Bool)

(assert (=> b!377341 (= e!229705 tp_is_empty!9055)))

(declare-fun b!377342 () Bool)

(assert (=> b!377342 (= e!229706 true)))

(assert (=> b!377342 (= lt!175403 (+!874 lt!175404 lt!175407))))

(declare-fun lt!175412 () Unit!11616)

(declare-fun addCommutativeForDiffKeys!280 (ListLongMap!4981 (_ BitVec 64) V!13179 (_ BitVec 64) V!13179) Unit!11616)

(assert (=> b!377342 (= lt!175412 (addCommutativeForDiffKeys!280 lt!175408 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!213546 () Bool)

(assert (=> start!37266 (=> (not res!213546) (not e!229710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37266 (= res!213546 (validMask!0 mask!970))))

(assert (=> start!37266 e!229710))

(declare-fun e!229708 () Bool)

(declare-fun array_inv!7722 (array!22023) Bool)

(assert (=> start!37266 (and (array_inv!7722 _values!506) e!229708)))

(assert (=> start!37266 tp!29937))

(assert (=> start!37266 true))

(assert (=> start!37266 tp_is_empty!9055))

(declare-fun array_inv!7723 (array!22021) Bool)

(assert (=> start!37266 (array_inv!7723 _keys!658)))

(declare-fun b!377332 () Bool)

(assert (=> b!377332 (= e!229708 (and e!229712 mapRes!15147))))

(declare-fun condMapEmpty!15147 () Bool)

(declare-fun mapDefault!15147 () ValueCell!4184)

(assert (=> b!377332 (= condMapEmpty!15147 (= (arr!10480 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4184)) mapDefault!15147)))))

(declare-fun mapIsEmpty!15147 () Bool)

(assert (=> mapIsEmpty!15147 mapRes!15147))

(declare-fun b!377343 () Bool)

(declare-fun res!213552 () Bool)

(assert (=> b!377343 (=> (not res!213552) (not e!229707))))

(assert (=> b!377343 (= res!213552 (arrayNoDuplicates!0 lt!175406 #b00000000000000000000000000000000 Nil!5904))))

(declare-fun b!377344 () Bool)

(declare-fun res!213554 () Bool)

(assert (=> b!377344 (=> (not res!213554) (not e!229710))))

(assert (=> b!377344 (= res!213554 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10832 _keys!658))))))

(assert (= (and start!37266 res!213546) b!377337))

(assert (= (and b!377337 res!213547) b!377330))

(assert (= (and b!377330 res!213551) b!377331))

(assert (= (and b!377331 res!213555) b!377344))

(assert (= (and b!377344 res!213554) b!377334))

(assert (= (and b!377334 res!213548) b!377339))

(assert (= (and b!377339 res!213553) b!377333))

(assert (= (and b!377333 res!213550) b!377340))

(assert (= (and b!377340 res!213557) b!377343))

(assert (= (and b!377343 res!213552) b!377335))

(assert (= (and b!377335 (not res!213556)) b!377336))

(assert (= (and b!377336 (not res!213549)) b!377342))

(assert (= (and b!377332 condMapEmpty!15147) mapIsEmpty!15147))

(assert (= (and b!377332 (not condMapEmpty!15147)) mapNonEmpty!15147))

(get-info :version)

(assert (= (and mapNonEmpty!15147 ((_ is ValueCellFull!4184) mapValue!15147)) b!377341))

(assert (= (and b!377332 ((_ is ValueCellFull!4184) mapDefault!15147)) b!377338))

(assert (= start!37266 b!377332))

(declare-fun m!373655 () Bool)

(assert (=> b!377330 m!373655))

(declare-fun m!373657 () Bool)

(assert (=> b!377335 m!373657))

(declare-fun m!373659 () Bool)

(assert (=> b!377335 m!373659))

(declare-fun m!373661 () Bool)

(assert (=> b!377335 m!373661))

(declare-fun m!373663 () Bool)

(assert (=> b!377335 m!373663))

(declare-fun m!373665 () Bool)

(assert (=> b!377335 m!373665))

(declare-fun m!373667 () Bool)

(assert (=> b!377335 m!373667))

(declare-fun m!373669 () Bool)

(assert (=> b!377335 m!373669))

(declare-fun m!373671 () Bool)

(assert (=> b!377340 m!373671))

(declare-fun m!373673 () Bool)

(assert (=> b!377340 m!373673))

(declare-fun m!373675 () Bool)

(assert (=> b!377331 m!373675))

(declare-fun m!373677 () Bool)

(assert (=> b!377343 m!373677))

(declare-fun m!373679 () Bool)

(assert (=> b!377333 m!373679))

(declare-fun m!373681 () Bool)

(assert (=> mapNonEmpty!15147 m!373681))

(declare-fun m!373683 () Bool)

(assert (=> b!377336 m!373683))

(declare-fun m!373685 () Bool)

(assert (=> b!377336 m!373685))

(declare-fun m!373687 () Bool)

(assert (=> b!377336 m!373687))

(declare-fun m!373689 () Bool)

(assert (=> b!377339 m!373689))

(declare-fun m!373691 () Bool)

(assert (=> b!377334 m!373691))

(declare-fun m!373693 () Bool)

(assert (=> start!37266 m!373693))

(declare-fun m!373695 () Bool)

(assert (=> start!37266 m!373695))

(declare-fun m!373697 () Bool)

(assert (=> start!37266 m!373697))

(declare-fun m!373699 () Bool)

(assert (=> b!377342 m!373699))

(declare-fun m!373701 () Bool)

(assert (=> b!377342 m!373701))

(check-sat (not b!377336) (not b!377331) (not b!377335) (not b!377334) (not b_next!8407) (not b!377340) tp_is_empty!9055 (not b!377342) (not b!377333) (not mapNonEmpty!15147) (not b!377330) (not start!37266) (not b!377343) b_and!15623)
(check-sat b_and!15623 (not b_next!8407))
