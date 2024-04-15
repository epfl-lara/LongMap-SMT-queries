; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37182 () Bool)

(assert start!37182)

(declare-fun b_free!8323 () Bool)

(declare-fun b_next!8323 () Bool)

(assert (=> start!37182 (= b_free!8323 (not b_next!8323))))

(declare-fun tp!29684 () Bool)

(declare-fun b_and!15539 () Bool)

(assert (=> start!37182 (= tp!29684 b_and!15539)))

(declare-fun b!375433 () Bool)

(declare-fun e!228703 () Bool)

(assert (=> b!375433 (= e!228703 true)))

(declare-fun e!228701 () Bool)

(assert (=> b!375433 e!228701))

(declare-fun res!212027 () Bool)

(assert (=> b!375433 (=> (not res!212027) (not e!228701))))

(declare-datatypes ((V!13067 0))(
  ( (V!13068 (val!4530 Int)) )
))
(declare-datatypes ((tuple2!6008 0))(
  ( (tuple2!6009 (_1!3015 (_ BitVec 64)) (_2!3015 V!13067)) )
))
(declare-fun lt!173791 () tuple2!6008)

(declare-datatypes ((List!5839 0))(
  ( (Nil!5836) (Cons!5835 (h!6691 tuple2!6008) (t!10980 List!5839)) )
))
(declare-datatypes ((ListLongMap!4911 0))(
  ( (ListLongMap!4912 (toList!2471 List!5839)) )
))
(declare-fun lt!173793 () ListLongMap!4911)

(declare-fun lt!173797 () ListLongMap!4911)

(declare-fun +!839 (ListLongMap!4911 tuple2!6008) ListLongMap!4911)

(assert (=> b!375433 (= res!212027 (= lt!173797 (+!839 lt!173793 lt!173791)))))

(declare-fun zeroValue!472 () V!13067)

(assert (=> b!375433 (= lt!173791 (tuple2!6009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375434 () Bool)

(declare-fun e!228697 () Bool)

(declare-fun e!228699 () Bool)

(assert (=> b!375434 (= e!228697 e!228699)))

(declare-fun res!212028 () Bool)

(assert (=> b!375434 (=> (not res!212028) (not e!228699))))

(declare-datatypes ((array!21859 0))(
  ( (array!21860 (arr!10398 (Array (_ BitVec 32) (_ BitVec 64))) (size!10751 (_ BitVec 32))) )
))
(declare-fun lt!173792 () array!21859)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21859 (_ BitVec 32)) Bool)

(assert (=> b!375434 (= res!212028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173792 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21859)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375434 (= lt!173792 (array!21860 (store (arr!10398 _keys!658) i!548 k0!778) (size!10751 _keys!658)))))

(declare-fun res!212034 () Bool)

(assert (=> start!37182 (=> (not res!212034) (not e!228697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37182 (= res!212034 (validMask!0 mask!970))))

(assert (=> start!37182 e!228697))

(declare-datatypes ((ValueCell!4142 0))(
  ( (ValueCellFull!4142 (v!6721 V!13067)) (EmptyCell!4142) )
))
(declare-datatypes ((array!21861 0))(
  ( (array!21862 (arr!10399 (Array (_ BitVec 32) ValueCell!4142)) (size!10752 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21861)

(declare-fun e!228704 () Bool)

(declare-fun array_inv!7670 (array!21861) Bool)

(assert (=> start!37182 (and (array_inv!7670 _values!506) e!228704)))

(assert (=> start!37182 tp!29684))

(assert (=> start!37182 true))

(declare-fun tp_is_empty!8971 () Bool)

(assert (=> start!37182 tp_is_empty!8971))

(declare-fun array_inv!7671 (array!21859) Bool)

(assert (=> start!37182 (array_inv!7671 _keys!658)))

(declare-fun mapNonEmpty!15021 () Bool)

(declare-fun mapRes!15021 () Bool)

(declare-fun tp!29685 () Bool)

(declare-fun e!228702 () Bool)

(assert (=> mapNonEmpty!15021 (= mapRes!15021 (and tp!29685 e!228702))))

(declare-fun mapKey!15021 () (_ BitVec 32))

(declare-fun mapValue!15021 () ValueCell!4142)

(declare-fun mapRest!15021 () (Array (_ BitVec 32) ValueCell!4142))

(assert (=> mapNonEmpty!15021 (= (arr!10399 _values!506) (store mapRest!15021 mapKey!15021 mapValue!15021))))

(declare-fun b!375435 () Bool)

(declare-fun res!212037 () Bool)

(assert (=> b!375435 (=> (not res!212037) (not e!228697))))

(assert (=> b!375435 (= res!212037 (or (= (select (arr!10398 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10398 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15021 () Bool)

(assert (=> mapIsEmpty!15021 mapRes!15021))

(declare-fun b!375436 () Bool)

(declare-fun res!212033 () Bool)

(assert (=> b!375436 (=> (not res!212033) (not e!228701))))

(declare-fun lt!173794 () ListLongMap!4911)

(declare-fun lt!173799 () ListLongMap!4911)

(assert (=> b!375436 (= res!212033 (= lt!173799 (+!839 lt!173794 lt!173791)))))

(declare-fun b!375437 () Bool)

(declare-fun e!228700 () Bool)

(assert (=> b!375437 (= e!228704 (and e!228700 mapRes!15021))))

(declare-fun condMapEmpty!15021 () Bool)

(declare-fun mapDefault!15021 () ValueCell!4142)

(assert (=> b!375437 (= condMapEmpty!15021 (= (arr!10399 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4142)) mapDefault!15021)))))

(declare-fun b!375438 () Bool)

(declare-fun res!212031 () Bool)

(assert (=> b!375438 (=> (not res!212031) (not e!228697))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375438 (= res!212031 (and (= (size!10752 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10751 _keys!658) (size!10752 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375439 () Bool)

(declare-fun res!212029 () Bool)

(assert (=> b!375439 (=> (not res!212029) (not e!228697))))

(assert (=> b!375439 (= res!212029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375440 () Bool)

(assert (=> b!375440 (= e!228702 tp_is_empty!8971)))

(declare-fun b!375441 () Bool)

(assert (=> b!375441 (= e!228699 (not e!228703))))

(declare-fun res!212030 () Bool)

(assert (=> b!375441 (=> res!212030 e!228703)))

(assert (=> b!375441 (= res!212030 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13067)

(declare-fun getCurrentListMap!1885 (array!21859 array!21861 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) Int) ListLongMap!4911)

(assert (=> b!375441 (= lt!173799 (getCurrentListMap!1885 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173796 () array!21861)

(assert (=> b!375441 (= lt!173797 (getCurrentListMap!1885 lt!173792 lt!173796 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173795 () ListLongMap!4911)

(assert (=> b!375441 (and (= lt!173793 lt!173795) (= lt!173795 lt!173793))))

(declare-fun v!373 () V!13067)

(assert (=> b!375441 (= lt!173795 (+!839 lt!173794 (tuple2!6009 k0!778 v!373)))))

(declare-datatypes ((Unit!11550 0))(
  ( (Unit!11551) )
))
(declare-fun lt!173798 () Unit!11550)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!78 (array!21859 array!21861 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) (_ BitVec 64) V!13067 (_ BitVec 32) Int) Unit!11550)

(assert (=> b!375441 (= lt!173798 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!78 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!750 (array!21859 array!21861 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) Int) ListLongMap!4911)

(assert (=> b!375441 (= lt!173793 (getCurrentListMapNoExtraKeys!750 lt!173792 lt!173796 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375441 (= lt!173796 (array!21862 (store (arr!10399 _values!506) i!548 (ValueCellFull!4142 v!373)) (size!10752 _values!506)))))

(assert (=> b!375441 (= lt!173794 (getCurrentListMapNoExtraKeys!750 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375442 () Bool)

(declare-fun res!212038 () Bool)

(assert (=> b!375442 (=> (not res!212038) (not e!228697))))

(assert (=> b!375442 (= res!212038 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10751 _keys!658))))))

(declare-fun b!375443 () Bool)

(declare-fun res!212039 () Bool)

(assert (=> b!375443 (=> (not res!212039) (not e!228697))))

(declare-datatypes ((List!5840 0))(
  ( (Nil!5837) (Cons!5836 (h!6692 (_ BitVec 64)) (t!10981 List!5840)) )
))
(declare-fun arrayNoDuplicates!0 (array!21859 (_ BitVec 32) List!5840) Bool)

(assert (=> b!375443 (= res!212039 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5837))))

(declare-fun b!375444 () Bool)

(declare-fun res!212032 () Bool)

(assert (=> b!375444 (=> (not res!212032) (not e!228697))))

(declare-fun arrayContainsKey!0 (array!21859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375444 (= res!212032 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375445 () Bool)

(assert (=> b!375445 (= e!228701 (= lt!173797 (+!839 lt!173795 lt!173791)))))

(declare-fun b!375446 () Bool)

(assert (=> b!375446 (= e!228700 tp_is_empty!8971)))

(declare-fun b!375447 () Bool)

(declare-fun res!212035 () Bool)

(assert (=> b!375447 (=> (not res!212035) (not e!228699))))

(assert (=> b!375447 (= res!212035 (arrayNoDuplicates!0 lt!173792 #b00000000000000000000000000000000 Nil!5837))))

(declare-fun b!375448 () Bool)

(declare-fun res!212036 () Bool)

(assert (=> b!375448 (=> (not res!212036) (not e!228697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375448 (= res!212036 (validKeyInArray!0 k0!778))))

(assert (= (and start!37182 res!212034) b!375438))

(assert (= (and b!375438 res!212031) b!375439))

(assert (= (and b!375439 res!212029) b!375443))

(assert (= (and b!375443 res!212039) b!375442))

(assert (= (and b!375442 res!212038) b!375448))

(assert (= (and b!375448 res!212036) b!375435))

(assert (= (and b!375435 res!212037) b!375444))

(assert (= (and b!375444 res!212032) b!375434))

(assert (= (and b!375434 res!212028) b!375447))

(assert (= (and b!375447 res!212035) b!375441))

(assert (= (and b!375441 (not res!212030)) b!375433))

(assert (= (and b!375433 res!212027) b!375436))

(assert (= (and b!375436 res!212033) b!375445))

(assert (= (and b!375437 condMapEmpty!15021) mapIsEmpty!15021))

(assert (= (and b!375437 (not condMapEmpty!15021)) mapNonEmpty!15021))

(get-info :version)

(assert (= (and mapNonEmpty!15021 ((_ is ValueCellFull!4142) mapValue!15021)) b!375440))

(assert (= (and b!375437 ((_ is ValueCellFull!4142) mapDefault!15021)) b!375446))

(assert (= start!37182 b!375437))

(declare-fun m!371651 () Bool)

(assert (=> b!375448 m!371651))

(declare-fun m!371653 () Bool)

(assert (=> b!375439 m!371653))

(declare-fun m!371655 () Bool)

(assert (=> b!375433 m!371655))

(declare-fun m!371657 () Bool)

(assert (=> b!375435 m!371657))

(declare-fun m!371659 () Bool)

(assert (=> b!375441 m!371659))

(declare-fun m!371661 () Bool)

(assert (=> b!375441 m!371661))

(declare-fun m!371663 () Bool)

(assert (=> b!375441 m!371663))

(declare-fun m!371665 () Bool)

(assert (=> b!375441 m!371665))

(declare-fun m!371667 () Bool)

(assert (=> b!375441 m!371667))

(declare-fun m!371669 () Bool)

(assert (=> b!375441 m!371669))

(declare-fun m!371671 () Bool)

(assert (=> b!375441 m!371671))

(declare-fun m!371673 () Bool)

(assert (=> b!375445 m!371673))

(declare-fun m!371675 () Bool)

(assert (=> b!375443 m!371675))

(declare-fun m!371677 () Bool)

(assert (=> b!375434 m!371677))

(declare-fun m!371679 () Bool)

(assert (=> b!375434 m!371679))

(declare-fun m!371681 () Bool)

(assert (=> b!375444 m!371681))

(declare-fun m!371683 () Bool)

(assert (=> b!375447 m!371683))

(declare-fun m!371685 () Bool)

(assert (=> start!37182 m!371685))

(declare-fun m!371687 () Bool)

(assert (=> start!37182 m!371687))

(declare-fun m!371689 () Bool)

(assert (=> start!37182 m!371689))

(declare-fun m!371691 () Bool)

(assert (=> b!375436 m!371691))

(declare-fun m!371693 () Bool)

(assert (=> mapNonEmpty!15021 m!371693))

(check-sat (not b!375436) (not b!375433) (not b!375448) (not b!375441) (not b!375445) (not b!375443) (not b!375439) (not b!375447) b_and!15539 (not mapNonEmpty!15021) tp_is_empty!8971 (not start!37182) (not b_next!8323) (not b!375434) (not b!375444))
(check-sat b_and!15539 (not b_next!8323))
