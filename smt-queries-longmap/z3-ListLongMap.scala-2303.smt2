; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37266 () Bool)

(assert start!37266)

(declare-fun b_free!8407 () Bool)

(declare-fun b_next!8407 () Bool)

(assert (=> start!37266 (= b_free!8407 (not b_next!8407))))

(declare-fun tp!29936 () Bool)

(declare-fun b_and!15663 () Bool)

(assert (=> start!37266 (= tp!29936 b_and!15663)))

(declare-fun b!377552 () Bool)

(declare-fun e!229848 () Bool)

(declare-fun e!229849 () Bool)

(declare-fun mapRes!15147 () Bool)

(assert (=> b!377552 (= e!229848 (and e!229849 mapRes!15147))))

(declare-fun condMapEmpty!15147 () Bool)

(declare-datatypes ((V!13179 0))(
  ( (V!13180 (val!4572 Int)) )
))
(declare-datatypes ((ValueCell!4184 0))(
  ( (ValueCellFull!4184 (v!6770 V!13179)) (EmptyCell!4184) )
))
(declare-datatypes ((array!22026 0))(
  ( (array!22027 (arr!10481 (Array (_ BitVec 32) ValueCell!4184)) (size!10833 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22026)

(declare-fun mapDefault!15147 () ValueCell!4184)

(assert (=> b!377552 (= condMapEmpty!15147 (= (arr!10481 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4184)) mapDefault!15147)))))

(declare-fun mapIsEmpty!15147 () Bool)

(assert (=> mapIsEmpty!15147 mapRes!15147))

(declare-fun b!377554 () Bool)

(declare-fun e!229854 () Bool)

(declare-fun e!229847 () Bool)

(assert (=> b!377554 (= e!229854 e!229847)))

(declare-fun res!213680 () Bool)

(assert (=> b!377554 (=> (not res!213680) (not e!229847))))

(declare-datatypes ((array!22028 0))(
  ( (array!22029 (arr!10482 (Array (_ BitVec 32) (_ BitVec 64))) (size!10834 (_ BitVec 32))) )
))
(declare-fun lt!175662 () array!22028)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22028 (_ BitVec 32)) Bool)

(assert (=> b!377554 (= res!213680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175662 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22028)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377554 (= lt!175662 (array!22029 (store (arr!10482 _keys!658) i!548 k0!778) (size!10834 _keys!658)))))

(declare-fun b!377555 () Bool)

(declare-fun e!229851 () Bool)

(assert (=> b!377555 (= e!229847 (not e!229851))))

(declare-fun res!213679 () Bool)

(assert (=> b!377555 (=> res!213679 e!229851)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377555 (= res!213679 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6004 0))(
  ( (tuple2!6005 (_1!3013 (_ BitVec 64)) (_2!3013 V!13179)) )
))
(declare-datatypes ((List!5843 0))(
  ( (Nil!5840) (Cons!5839 (h!6695 tuple2!6004) (t!10985 List!5843)) )
))
(declare-datatypes ((ListLongMap!4919 0))(
  ( (ListLongMap!4920 (toList!2475 List!5843)) )
))
(declare-fun lt!175655 () ListLongMap!4919)

(declare-fun zeroValue!472 () V!13179)

(declare-fun minValue!472 () V!13179)

(declare-fun getCurrentListMap!1920 (array!22028 array!22026 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) Int) ListLongMap!4919)

(assert (=> b!377555 (= lt!175655 (getCurrentListMap!1920 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175661 () array!22026)

(declare-fun lt!175663 () ListLongMap!4919)

(assert (=> b!377555 (= lt!175663 (getCurrentListMap!1920 lt!175662 lt!175661 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175658 () ListLongMap!4919)

(declare-fun lt!175654 () ListLongMap!4919)

(assert (=> b!377555 (and (= lt!175658 lt!175654) (= lt!175654 lt!175658))))

(declare-fun lt!175665 () ListLongMap!4919)

(declare-fun lt!175656 () tuple2!6004)

(declare-fun +!871 (ListLongMap!4919 tuple2!6004) ListLongMap!4919)

(assert (=> b!377555 (= lt!175654 (+!871 lt!175665 lt!175656))))

(declare-fun v!373 () V!13179)

(assert (=> b!377555 (= lt!175656 (tuple2!6005 k0!778 v!373))))

(declare-datatypes ((Unit!11625 0))(
  ( (Unit!11626) )
))
(declare-fun lt!175657 () Unit!11625)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!107 (array!22028 array!22026 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) (_ BitVec 64) V!13179 (_ BitVec 32) Int) Unit!11625)

(assert (=> b!377555 (= lt!175657 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!107 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!767 (array!22028 array!22026 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) Int) ListLongMap!4919)

(assert (=> b!377555 (= lt!175658 (getCurrentListMapNoExtraKeys!767 lt!175662 lt!175661 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377555 (= lt!175661 (array!22027 (store (arr!10481 _values!506) i!548 (ValueCellFull!4184 v!373)) (size!10833 _values!506)))))

(assert (=> b!377555 (= lt!175665 (getCurrentListMapNoExtraKeys!767 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377556 () Bool)

(declare-fun res!213682 () Bool)

(assert (=> b!377556 (=> (not res!213682) (not e!229854))))

(assert (=> b!377556 (= res!213682 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10834 _keys!658))))))

(declare-fun b!377557 () Bool)

(declare-fun res!213677 () Bool)

(assert (=> b!377557 (=> (not res!213677) (not e!229854))))

(declare-datatypes ((List!5844 0))(
  ( (Nil!5841) (Cons!5840 (h!6696 (_ BitVec 64)) (t!10986 List!5844)) )
))
(declare-fun arrayNoDuplicates!0 (array!22028 (_ BitVec 32) List!5844) Bool)

(assert (=> b!377557 (= res!213677 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5841))))

(declare-fun b!377558 () Bool)

(declare-fun res!213681 () Bool)

(assert (=> b!377558 (=> (not res!213681) (not e!229854))))

(assert (=> b!377558 (= res!213681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377559 () Bool)

(declare-fun res!213672 () Bool)

(assert (=> b!377559 (=> (not res!213672) (not e!229854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377559 (= res!213672 (validKeyInArray!0 k0!778))))

(declare-fun b!377560 () Bool)

(declare-fun e!229850 () Bool)

(declare-fun tp_is_empty!9055 () Bool)

(assert (=> b!377560 (= e!229850 tp_is_empty!9055)))

(declare-fun mapNonEmpty!15147 () Bool)

(declare-fun tp!29937 () Bool)

(assert (=> mapNonEmpty!15147 (= mapRes!15147 (and tp!29937 e!229850))))

(declare-fun mapKey!15147 () (_ BitVec 32))

(declare-fun mapValue!15147 () ValueCell!4184)

(declare-fun mapRest!15147 () (Array (_ BitVec 32) ValueCell!4184))

(assert (=> mapNonEmpty!15147 (= (arr!10481 _values!506) (store mapRest!15147 mapKey!15147 mapValue!15147))))

(declare-fun res!213674 () Bool)

(assert (=> start!37266 (=> (not res!213674) (not e!229854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37266 (= res!213674 (validMask!0 mask!970))))

(assert (=> start!37266 e!229854))

(declare-fun array_inv!7772 (array!22026) Bool)

(assert (=> start!37266 (and (array_inv!7772 _values!506) e!229848)))

(assert (=> start!37266 tp!29936))

(assert (=> start!37266 true))

(assert (=> start!37266 tp_is_empty!9055))

(declare-fun array_inv!7773 (array!22028) Bool)

(assert (=> start!37266 (array_inv!7773 _keys!658)))

(declare-fun b!377553 () Bool)

(declare-fun e!229853 () Bool)

(assert (=> b!377553 (= e!229851 e!229853)))

(declare-fun res!213675 () Bool)

(assert (=> b!377553 (=> res!213675 e!229853)))

(assert (=> b!377553 (= res!213675 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175659 () ListLongMap!4919)

(assert (=> b!377553 (= lt!175663 lt!175659)))

(declare-fun lt!175666 () tuple2!6004)

(assert (=> b!377553 (= lt!175659 (+!871 lt!175654 lt!175666))))

(declare-fun lt!175664 () ListLongMap!4919)

(assert (=> b!377553 (= lt!175655 lt!175664)))

(assert (=> b!377553 (= lt!175664 (+!871 lt!175665 lt!175666))))

(assert (=> b!377553 (= lt!175663 (+!871 lt!175658 lt!175666))))

(assert (=> b!377553 (= lt!175666 (tuple2!6005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377561 () Bool)

(declare-fun res!213678 () Bool)

(assert (=> b!377561 (=> (not res!213678) (not e!229847))))

(assert (=> b!377561 (= res!213678 (arrayNoDuplicates!0 lt!175662 #b00000000000000000000000000000000 Nil!5841))))

(declare-fun b!377562 () Bool)

(declare-fun res!213683 () Bool)

(assert (=> b!377562 (=> (not res!213683) (not e!229854))))

(assert (=> b!377562 (= res!213683 (or (= (select (arr!10482 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10482 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377563 () Bool)

(declare-fun res!213673 () Bool)

(assert (=> b!377563 (=> (not res!213673) (not e!229854))))

(assert (=> b!377563 (= res!213673 (and (= (size!10833 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10834 _keys!658) (size!10833 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377564 () Bool)

(assert (=> b!377564 (= e!229849 tp_is_empty!9055)))

(declare-fun b!377565 () Bool)

(declare-fun res!213676 () Bool)

(assert (=> b!377565 (=> (not res!213676) (not e!229854))))

(declare-fun arrayContainsKey!0 (array!22028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377565 (= res!213676 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377566 () Bool)

(assert (=> b!377566 (= e!229853 true)))

(assert (=> b!377566 (= lt!175659 (+!871 lt!175664 lt!175656))))

(declare-fun lt!175660 () Unit!11625)

(declare-fun addCommutativeForDiffKeys!287 (ListLongMap!4919 (_ BitVec 64) V!13179 (_ BitVec 64) V!13179) Unit!11625)

(assert (=> b!377566 (= lt!175660 (addCommutativeForDiffKeys!287 lt!175665 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37266 res!213674) b!377563))

(assert (= (and b!377563 res!213673) b!377558))

(assert (= (and b!377558 res!213681) b!377557))

(assert (= (and b!377557 res!213677) b!377556))

(assert (= (and b!377556 res!213682) b!377559))

(assert (= (and b!377559 res!213672) b!377562))

(assert (= (and b!377562 res!213683) b!377565))

(assert (= (and b!377565 res!213676) b!377554))

(assert (= (and b!377554 res!213680) b!377561))

(assert (= (and b!377561 res!213678) b!377555))

(assert (= (and b!377555 (not res!213679)) b!377553))

(assert (= (and b!377553 (not res!213675)) b!377566))

(assert (= (and b!377552 condMapEmpty!15147) mapIsEmpty!15147))

(assert (= (and b!377552 (not condMapEmpty!15147)) mapNonEmpty!15147))

(get-info :version)

(assert (= (and mapNonEmpty!15147 ((_ is ValueCellFull!4184) mapValue!15147)) b!377560))

(assert (= (and b!377552 ((_ is ValueCellFull!4184) mapDefault!15147)) b!377564))

(assert (= start!37266 b!377552))

(declare-fun m!374609 () Bool)

(assert (=> b!377553 m!374609))

(declare-fun m!374611 () Bool)

(assert (=> b!377553 m!374611))

(declare-fun m!374613 () Bool)

(assert (=> b!377553 m!374613))

(declare-fun m!374615 () Bool)

(assert (=> b!377555 m!374615))

(declare-fun m!374617 () Bool)

(assert (=> b!377555 m!374617))

(declare-fun m!374619 () Bool)

(assert (=> b!377555 m!374619))

(declare-fun m!374621 () Bool)

(assert (=> b!377555 m!374621))

(declare-fun m!374623 () Bool)

(assert (=> b!377555 m!374623))

(declare-fun m!374625 () Bool)

(assert (=> b!377555 m!374625))

(declare-fun m!374627 () Bool)

(assert (=> b!377555 m!374627))

(declare-fun m!374629 () Bool)

(assert (=> b!377554 m!374629))

(declare-fun m!374631 () Bool)

(assert (=> b!377554 m!374631))

(declare-fun m!374633 () Bool)

(assert (=> b!377559 m!374633))

(declare-fun m!374635 () Bool)

(assert (=> b!377557 m!374635))

(declare-fun m!374637 () Bool)

(assert (=> start!37266 m!374637))

(declare-fun m!374639 () Bool)

(assert (=> start!37266 m!374639))

(declare-fun m!374641 () Bool)

(assert (=> start!37266 m!374641))

(declare-fun m!374643 () Bool)

(assert (=> b!377562 m!374643))

(declare-fun m!374645 () Bool)

(assert (=> mapNonEmpty!15147 m!374645))

(declare-fun m!374647 () Bool)

(assert (=> b!377558 m!374647))

(declare-fun m!374649 () Bool)

(assert (=> b!377561 m!374649))

(declare-fun m!374651 () Bool)

(assert (=> b!377565 m!374651))

(declare-fun m!374653 () Bool)

(assert (=> b!377566 m!374653))

(declare-fun m!374655 () Bool)

(assert (=> b!377566 m!374655))

(check-sat (not mapNonEmpty!15147) (not b!377561) (not b!377558) (not b!377565) (not start!37266) (not b_next!8407) (not b!377554) (not b!377553) (not b!377557) tp_is_empty!9055 (not b!377559) (not b!377566) b_and!15663 (not b!377555))
(check-sat b_and!15663 (not b_next!8407))
