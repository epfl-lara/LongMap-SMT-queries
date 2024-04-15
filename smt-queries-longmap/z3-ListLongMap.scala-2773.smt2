; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40476 () Bool)

(assert start!40476)

(declare-fun b_free!10561 () Bool)

(declare-fun b_next!10561 () Bool)

(assert (=> start!40476 (= b_free!10561 (not b_next!10561))))

(declare-fun tp!37460 () Bool)

(declare-fun b_and!18519 () Bool)

(assert (=> start!40476 (= tp!37460 b_and!18519)))

(declare-fun b!445792 () Bool)

(declare-fun res!264623 () Bool)

(declare-fun e!261913 () Bool)

(assert (=> b!445792 (=> (not res!264623) (not e!261913))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27561 0))(
  ( (array!27562 (arr!13228 (Array (_ BitVec 32) (_ BitVec 64))) (size!13581 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27561)

(assert (=> b!445792 (= res!264623 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13581 _keys!709))))))

(declare-fun b!445793 () Bool)

(declare-fun res!264624 () Bool)

(assert (=> b!445793 (=> (not res!264624) (not e!261913))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27561 (_ BitVec 32)) Bool)

(assert (=> b!445793 (= res!264624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445794 () Bool)

(declare-fun res!264621 () Bool)

(assert (=> b!445794 (=> (not res!264621) (not e!261913))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16939 0))(
  ( (V!16940 (val!5982 Int)) )
))
(declare-datatypes ((ValueCell!5594 0))(
  ( (ValueCellFull!5594 (v!8227 V!16939)) (EmptyCell!5594) )
))
(declare-datatypes ((array!27563 0))(
  ( (array!27564 (arr!13229 (Array (_ BitVec 32) ValueCell!5594)) (size!13582 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27563)

(assert (=> b!445794 (= res!264621 (and (= (size!13582 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13581 _keys!709) (size!13582 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445795 () Bool)

(declare-fun res!264627 () Bool)

(assert (=> b!445795 (=> (not res!264627) (not e!261913))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445795 (= res!264627 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445796 () Bool)

(declare-fun e!261916 () Bool)

(declare-fun tp_is_empty!11875 () Bool)

(assert (=> b!445796 (= e!261916 tp_is_empty!11875)))

(declare-fun b!445797 () Bool)

(declare-fun res!264617 () Bool)

(declare-fun e!261911 () Bool)

(assert (=> b!445797 (=> (not res!264617) (not e!261911))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!445797 (= res!264617 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13581 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445798 () Bool)

(declare-fun res!264619 () Bool)

(assert (=> b!445798 (=> (not res!264619) (not e!261911))))

(declare-fun lt!203473 () array!27561)

(declare-datatypes ((List!7919 0))(
  ( (Nil!7916) (Cons!7915 (h!8771 (_ BitVec 64)) (t!13668 List!7919)) )
))
(declare-fun arrayNoDuplicates!0 (array!27561 (_ BitVec 32) List!7919) Bool)

(assert (=> b!445798 (= res!264619 (arrayNoDuplicates!0 lt!203473 #b00000000000000000000000000000000 Nil!7916))))

(declare-fun b!445799 () Bool)

(declare-fun e!261912 () Bool)

(declare-datatypes ((tuple2!7870 0))(
  ( (tuple2!7871 (_1!3946 (_ BitVec 64)) (_2!3946 V!16939)) )
))
(declare-datatypes ((List!7920 0))(
  ( (Nil!7917) (Cons!7916 (h!8772 tuple2!7870) (t!13669 List!7920)) )
))
(declare-datatypes ((ListLongMap!6773 0))(
  ( (ListLongMap!6774 (toList!3402 List!7920)) )
))
(declare-fun call!29614 () ListLongMap!6773)

(declare-fun call!29615 () ListLongMap!6773)

(assert (=> b!445799 (= e!261912 (= call!29614 call!29615))))

(declare-fun mapNonEmpty!19440 () Bool)

(declare-fun mapRes!19440 () Bool)

(declare-fun tp!37461 () Bool)

(declare-fun e!261915 () Bool)

(assert (=> mapNonEmpty!19440 (= mapRes!19440 (and tp!37461 e!261915))))

(declare-fun mapRest!19440 () (Array (_ BitVec 32) ValueCell!5594))

(declare-fun mapValue!19440 () ValueCell!5594)

(declare-fun mapKey!19440 () (_ BitVec 32))

(assert (=> mapNonEmpty!19440 (= (arr!13229 _values!549) (store mapRest!19440 mapKey!19440 mapValue!19440))))

(declare-fun b!445800 () Bool)

(declare-fun res!264618 () Bool)

(assert (=> b!445800 (=> (not res!264618) (not e!261913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445800 (= res!264618 (validMask!0 mask!1025))))

(declare-fun b!445801 () Bool)

(declare-fun res!264620 () Bool)

(assert (=> b!445801 (=> (not res!264620) (not e!261913))))

(assert (=> b!445801 (= res!264620 (or (= (select (arr!13228 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13228 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19440 () Bool)

(assert (=> mapIsEmpty!19440 mapRes!19440))

(declare-fun b!445791 () Bool)

(declare-fun res!264622 () Bool)

(assert (=> b!445791 (=> (not res!264622) (not e!261913))))

(assert (=> b!445791 (= res!264622 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7916))))

(declare-fun res!264625 () Bool)

(assert (=> start!40476 (=> (not res!264625) (not e!261913))))

(assert (=> start!40476 (= res!264625 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13581 _keys!709))))))

(assert (=> start!40476 e!261913))

(assert (=> start!40476 tp_is_empty!11875))

(assert (=> start!40476 tp!37460))

(assert (=> start!40476 true))

(declare-fun e!261914 () Bool)

(declare-fun array_inv!9644 (array!27563) Bool)

(assert (=> start!40476 (and (array_inv!9644 _values!549) e!261914)))

(declare-fun array_inv!9645 (array!27561) Bool)

(assert (=> start!40476 (array_inv!9645 _keys!709)))

(declare-fun b!445802 () Bool)

(declare-fun v!412 () V!16939)

(declare-fun +!1557 (ListLongMap!6773 tuple2!7870) ListLongMap!6773)

(assert (=> b!445802 (= e!261912 (= call!29615 (+!1557 call!29614 (tuple2!7871 k0!794 v!412))))))

(declare-fun b!445803 () Bool)

(declare-fun res!264626 () Bool)

(assert (=> b!445803 (=> (not res!264626) (not e!261913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445803 (= res!264626 (validKeyInArray!0 k0!794))))

(declare-fun b!445804 () Bool)

(assert (=> b!445804 (= e!261913 e!261911)))

(declare-fun res!264628 () Bool)

(assert (=> b!445804 (=> (not res!264628) (not e!261911))))

(assert (=> b!445804 (= res!264628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203473 mask!1025))))

(assert (=> b!445804 (= lt!203473 (array!27562 (store (arr!13228 _keys!709) i!563 k0!794) (size!13581 _keys!709)))))

(declare-fun minValue!515 () V!16939)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16939)

(declare-fun bm!29611 () Bool)

(declare-fun c!55816 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1601 (array!27561 array!27563 (_ BitVec 32) (_ BitVec 32) V!16939 V!16939 (_ BitVec 32) Int) ListLongMap!6773)

(assert (=> bm!29611 (= call!29614 (getCurrentListMapNoExtraKeys!1601 (ite c!55816 _keys!709 lt!203473) (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29612 () Bool)

(assert (=> bm!29612 (= call!29615 (getCurrentListMapNoExtraKeys!1601 (ite c!55816 lt!203473 _keys!709) (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445805 () Bool)

(assert (=> b!445805 (= e!261914 (and e!261916 mapRes!19440))))

(declare-fun condMapEmpty!19440 () Bool)

(declare-fun mapDefault!19440 () ValueCell!5594)

(assert (=> b!445805 (= condMapEmpty!19440 (= (arr!13229 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5594)) mapDefault!19440)))))

(declare-fun b!445806 () Bool)

(assert (=> b!445806 (= e!261915 tp_is_empty!11875)))

(declare-fun b!445807 () Bool)

(assert (=> b!445807 (= e!261911 (not (= (getCurrentListMapNoExtraKeys!1601 lt!203473 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(assert (=> b!445807 e!261912))

(assert (=> b!445807 (= c!55816 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13133 0))(
  ( (Unit!13134) )
))
(declare-fun lt!203474 () Unit!13133)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 (array!27561 array!27563 (_ BitVec 32) (_ BitVec 32) V!16939 V!16939 (_ BitVec 32) (_ BitVec 64) V!16939 (_ BitVec 32) Int) Unit!13133)

(assert (=> b!445807 (= lt!203474 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40476 res!264625) b!445800))

(assert (= (and b!445800 res!264618) b!445794))

(assert (= (and b!445794 res!264621) b!445793))

(assert (= (and b!445793 res!264624) b!445791))

(assert (= (and b!445791 res!264622) b!445792))

(assert (= (and b!445792 res!264623) b!445803))

(assert (= (and b!445803 res!264626) b!445801))

(assert (= (and b!445801 res!264620) b!445795))

(assert (= (and b!445795 res!264627) b!445804))

(assert (= (and b!445804 res!264628) b!445798))

(assert (= (and b!445798 res!264619) b!445797))

(assert (= (and b!445797 res!264617) b!445807))

(assert (= (and b!445807 c!55816) b!445802))

(assert (= (and b!445807 (not c!55816)) b!445799))

(assert (= (or b!445802 b!445799) bm!29612))

(assert (= (or b!445802 b!445799) bm!29611))

(assert (= (and b!445805 condMapEmpty!19440) mapIsEmpty!19440))

(assert (= (and b!445805 (not condMapEmpty!19440)) mapNonEmpty!19440))

(get-info :version)

(assert (= (and mapNonEmpty!19440 ((_ is ValueCellFull!5594) mapValue!19440)) b!445806))

(assert (= (and b!445805 ((_ is ValueCellFull!5594) mapDefault!19440)) b!445796))

(assert (= start!40476 b!445805))

(declare-fun m!430609 () Bool)

(assert (=> b!445798 m!430609))

(declare-fun m!430611 () Bool)

(assert (=> bm!29612 m!430611))

(declare-fun m!430613 () Bool)

(assert (=> bm!29612 m!430613))

(declare-fun m!430615 () Bool)

(assert (=> b!445793 m!430615))

(assert (=> bm!29611 m!430611))

(declare-fun m!430617 () Bool)

(assert (=> bm!29611 m!430617))

(declare-fun m!430619 () Bool)

(assert (=> b!445800 m!430619))

(declare-fun m!430621 () Bool)

(assert (=> start!40476 m!430621))

(declare-fun m!430623 () Bool)

(assert (=> start!40476 m!430623))

(declare-fun m!430625 () Bool)

(assert (=> b!445791 m!430625))

(declare-fun m!430627 () Bool)

(assert (=> b!445804 m!430627))

(declare-fun m!430629 () Bool)

(assert (=> b!445804 m!430629))

(declare-fun m!430631 () Bool)

(assert (=> mapNonEmpty!19440 m!430631))

(declare-fun m!430633 () Bool)

(assert (=> b!445803 m!430633))

(declare-fun m!430635 () Bool)

(assert (=> b!445802 m!430635))

(assert (=> b!445807 m!430611))

(declare-fun m!430637 () Bool)

(assert (=> b!445807 m!430637))

(declare-fun m!430639 () Bool)

(assert (=> b!445807 m!430639))

(declare-fun m!430641 () Bool)

(assert (=> b!445807 m!430641))

(declare-fun m!430643 () Bool)

(assert (=> b!445795 m!430643))

(declare-fun m!430645 () Bool)

(assert (=> b!445801 m!430645))

(check-sat (not b!445803) (not b!445791) (not b!445793) tp_is_empty!11875 (not b_next!10561) (not b!445804) (not b!445800) (not bm!29611) (not b!445795) (not bm!29612) (not b!445798) (not start!40476) (not b!445802) b_and!18519 (not b!445807) (not mapNonEmpty!19440))
(check-sat b_and!18519 (not b_next!10561))
(get-model)

(declare-fun d!73939 () Bool)

(declare-fun res!264705 () Bool)

(declare-fun e!261964 () Bool)

(assert (=> d!73939 (=> res!264705 e!261964)))

(assert (=> d!73939 (= res!264705 (= (select (arr!13228 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73939 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!261964)))

(declare-fun b!445914 () Bool)

(declare-fun e!261965 () Bool)

(assert (=> b!445914 (= e!261964 e!261965)))

(declare-fun res!264706 () Bool)

(assert (=> b!445914 (=> (not res!264706) (not e!261965))))

(assert (=> b!445914 (= res!264706 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13581 _keys!709)))))

(declare-fun b!445915 () Bool)

(assert (=> b!445915 (= e!261965 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73939 (not res!264705)) b!445914))

(assert (= (and b!445914 res!264706) b!445915))

(declare-fun m!430723 () Bool)

(assert (=> d!73939 m!430723))

(declare-fun m!430725 () Bool)

(assert (=> b!445915 m!430725))

(assert (=> b!445795 d!73939))

(declare-fun b!445924 () Bool)

(declare-fun e!261974 () Bool)

(declare-fun call!29630 () Bool)

(assert (=> b!445924 (= e!261974 call!29630)))

(declare-fun b!445925 () Bool)

(declare-fun e!261972 () Bool)

(assert (=> b!445925 (= e!261972 e!261974)))

(declare-fun c!55825 () Bool)

(assert (=> b!445925 (= c!55825 (validKeyInArray!0 (select (arr!13228 lt!203473) #b00000000000000000000000000000000)))))

(declare-fun d!73941 () Bool)

(declare-fun res!264712 () Bool)

(assert (=> d!73941 (=> res!264712 e!261972)))

(assert (=> d!73941 (= res!264712 (bvsge #b00000000000000000000000000000000 (size!13581 lt!203473)))))

(assert (=> d!73941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203473 mask!1025) e!261972)))

(declare-fun b!445926 () Bool)

(declare-fun e!261973 () Bool)

(assert (=> b!445926 (= e!261973 call!29630)))

(declare-fun bm!29627 () Bool)

(assert (=> bm!29627 (= call!29630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203473 mask!1025))))

(declare-fun b!445927 () Bool)

(assert (=> b!445927 (= e!261974 e!261973)))

(declare-fun lt!203494 () (_ BitVec 64))

(assert (=> b!445927 (= lt!203494 (select (arr!13228 lt!203473) #b00000000000000000000000000000000))))

(declare-fun lt!203495 () Unit!13133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27561 (_ BitVec 64) (_ BitVec 32)) Unit!13133)

(assert (=> b!445927 (= lt!203495 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203473 lt!203494 #b00000000000000000000000000000000))))

(assert (=> b!445927 (arrayContainsKey!0 lt!203473 lt!203494 #b00000000000000000000000000000000)))

(declare-fun lt!203493 () Unit!13133)

(assert (=> b!445927 (= lt!203493 lt!203495)))

(declare-fun res!264711 () Bool)

(declare-datatypes ((SeekEntryResult!3524 0))(
  ( (MissingZero!3524 (index!16275 (_ BitVec 32))) (Found!3524 (index!16276 (_ BitVec 32))) (Intermediate!3524 (undefined!4336 Bool) (index!16277 (_ BitVec 32)) (x!41997 (_ BitVec 32))) (Undefined!3524) (MissingVacant!3524 (index!16278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27561 (_ BitVec 32)) SeekEntryResult!3524)

(assert (=> b!445927 (= res!264711 (= (seekEntryOrOpen!0 (select (arr!13228 lt!203473) #b00000000000000000000000000000000) lt!203473 mask!1025) (Found!3524 #b00000000000000000000000000000000)))))

(assert (=> b!445927 (=> (not res!264711) (not e!261973))))

(assert (= (and d!73941 (not res!264712)) b!445925))

(assert (= (and b!445925 c!55825) b!445927))

(assert (= (and b!445925 (not c!55825)) b!445924))

(assert (= (and b!445927 res!264711) b!445926))

(assert (= (or b!445926 b!445924) bm!29627))

(declare-fun m!430727 () Bool)

(assert (=> b!445925 m!430727))

(assert (=> b!445925 m!430727))

(declare-fun m!430729 () Bool)

(assert (=> b!445925 m!430729))

(declare-fun m!430731 () Bool)

(assert (=> bm!29627 m!430731))

(assert (=> b!445927 m!430727))

(declare-fun m!430733 () Bool)

(assert (=> b!445927 m!430733))

(declare-fun m!430735 () Bool)

(assert (=> b!445927 m!430735))

(assert (=> b!445927 m!430727))

(declare-fun m!430737 () Bool)

(assert (=> b!445927 m!430737))

(assert (=> b!445804 d!73941))

(declare-fun b!445952 () Bool)

(declare-fun res!264723 () Bool)

(declare-fun e!261993 () Bool)

(assert (=> b!445952 (=> (not res!264723) (not e!261993))))

(declare-fun lt!203510 () ListLongMap!6773)

(declare-fun contains!2478 (ListLongMap!6773 (_ BitVec 64)) Bool)

(assert (=> b!445952 (= res!264723 (not (contains!2478 lt!203510 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445953 () Bool)

(declare-fun e!261991 () Bool)

(assert (=> b!445953 (= e!261991 (= lt!203510 (getCurrentListMapNoExtraKeys!1601 (ite c!55816 lt!203473 _keys!709) (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!445954 () Bool)

(declare-fun isEmpty!560 (ListLongMap!6773) Bool)

(assert (=> b!445954 (= e!261991 (isEmpty!560 lt!203510))))

(declare-fun b!445955 () Bool)

(declare-fun lt!203512 () Unit!13133)

(declare-fun lt!203514 () Unit!13133)

(assert (=> b!445955 (= lt!203512 lt!203514)))

(declare-fun lt!203511 () V!16939)

(declare-fun lt!203516 () ListLongMap!6773)

(declare-fun lt!203513 () (_ BitVec 64))

(declare-fun lt!203515 () (_ BitVec 64))

(assert (=> b!445955 (not (contains!2478 (+!1557 lt!203516 (tuple2!7871 lt!203513 lt!203511)) lt!203515))))

(declare-fun addStillNotContains!144 (ListLongMap!6773 (_ BitVec 64) V!16939 (_ BitVec 64)) Unit!13133)

(assert (=> b!445955 (= lt!203514 (addStillNotContains!144 lt!203516 lt!203513 lt!203511 lt!203515))))

(assert (=> b!445955 (= lt!203515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6540 (ValueCell!5594 V!16939) V!16939)

(declare-fun dynLambda!848 (Int (_ BitVec 64)) V!16939)

(assert (=> b!445955 (= lt!203511 (get!6540 (select (arr!13229 (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!445955 (= lt!203513 (select (arr!13228 (ite c!55816 lt!203473 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29633 () ListLongMap!6773)

(assert (=> b!445955 (= lt!203516 call!29633)))

(declare-fun e!261989 () ListLongMap!6773)

(assert (=> b!445955 (= e!261989 (+!1557 call!29633 (tuple2!7871 (select (arr!13228 (ite c!55816 lt!203473 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6540 (select (arr!13229 (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!261994 () Bool)

(declare-fun b!445956 () Bool)

(assert (=> b!445956 (= e!261994 (validKeyInArray!0 (select (arr!13228 (ite c!55816 lt!203473 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!445956 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!445957 () Bool)

(declare-fun e!261995 () Bool)

(assert (=> b!445957 (= e!261993 e!261995)))

(declare-fun c!55834 () Bool)

(assert (=> b!445957 (= c!55834 e!261994)))

(declare-fun res!264724 () Bool)

(assert (=> b!445957 (=> (not res!264724) (not e!261994))))

(assert (=> b!445957 (= res!264724 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 lt!203473 _keys!709))))))

(declare-fun d!73943 () Bool)

(assert (=> d!73943 e!261993))

(declare-fun res!264721 () Bool)

(assert (=> d!73943 (=> (not res!264721) (not e!261993))))

(assert (=> d!73943 (= res!264721 (not (contains!2478 lt!203510 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!261990 () ListLongMap!6773)

(assert (=> d!73943 (= lt!203510 e!261990)))

(declare-fun c!55835 () Bool)

(assert (=> d!73943 (= c!55835 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 lt!203473 _keys!709))))))

(assert (=> d!73943 (validMask!0 mask!1025)))

(assert (=> d!73943 (= (getCurrentListMapNoExtraKeys!1601 (ite c!55816 lt!203473 _keys!709) (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203510)))

(declare-fun b!445958 () Bool)

(assert (=> b!445958 (= e!261990 (ListLongMap!6774 Nil!7917))))

(declare-fun b!445959 () Bool)

(assert (=> b!445959 (= e!261995 e!261991)))

(declare-fun c!55836 () Bool)

(assert (=> b!445959 (= c!55836 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 lt!203473 _keys!709))))))

(declare-fun bm!29630 () Bool)

(assert (=> bm!29630 (= call!29633 (getCurrentListMapNoExtraKeys!1601 (ite c!55816 lt!203473 _keys!709) (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!445960 () Bool)

(assert (=> b!445960 (= e!261989 call!29633)))

(declare-fun b!445961 () Bool)

(assert (=> b!445961 (= e!261990 e!261989)))

(declare-fun c!55837 () Bool)

(assert (=> b!445961 (= c!55837 (validKeyInArray!0 (select (arr!13228 (ite c!55816 lt!203473 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!445962 () Bool)

(declare-fun e!261992 () Bool)

(assert (=> b!445962 (= e!261995 e!261992)))

(assert (=> b!445962 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 lt!203473 _keys!709))))))

(declare-fun res!264722 () Bool)

(assert (=> b!445962 (= res!264722 (contains!2478 lt!203510 (select (arr!13228 (ite c!55816 lt!203473 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!445962 (=> (not res!264722) (not e!261992))))

(declare-fun b!445963 () Bool)

(assert (=> b!445963 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 lt!203473 _keys!709))))))

(assert (=> b!445963 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13582 (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549))))))

(declare-fun apply!310 (ListLongMap!6773 (_ BitVec 64)) V!16939)

(assert (=> b!445963 (= e!261992 (= (apply!310 lt!203510 (select (arr!13228 (ite c!55816 lt!203473 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6540 (select (arr!13229 (ite c!55816 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!73943 c!55835) b!445958))

(assert (= (and d!73943 (not c!55835)) b!445961))

(assert (= (and b!445961 c!55837) b!445955))

(assert (= (and b!445961 (not c!55837)) b!445960))

(assert (= (or b!445955 b!445960) bm!29630))

(assert (= (and d!73943 res!264721) b!445952))

(assert (= (and b!445952 res!264723) b!445957))

(assert (= (and b!445957 res!264724) b!445956))

(assert (= (and b!445957 c!55834) b!445962))

(assert (= (and b!445957 (not c!55834)) b!445959))

(assert (= (and b!445962 res!264722) b!445963))

(assert (= (and b!445959 c!55836) b!445953))

(assert (= (and b!445959 (not c!55836)) b!445954))

(declare-fun b_lambda!9411 () Bool)

(assert (=> (not b_lambda!9411) (not b!445955)))

(declare-fun t!13673 () Bool)

(declare-fun tb!3709 () Bool)

(assert (=> (and start!40476 (= defaultEntry!557 defaultEntry!557) t!13673) tb!3709))

(declare-fun result!6957 () Bool)

(assert (=> tb!3709 (= result!6957 tp_is_empty!11875)))

(assert (=> b!445955 t!13673))

(declare-fun b_and!18525 () Bool)

(assert (= b_and!18519 (and (=> t!13673 result!6957) b_and!18525)))

(declare-fun b_lambda!9413 () Bool)

(assert (=> (not b_lambda!9413) (not b!445963)))

(assert (=> b!445963 t!13673))

(declare-fun b_and!18527 () Bool)

(assert (= b_and!18525 (and (=> t!13673 result!6957) b_and!18527)))

(declare-fun m!430739 () Bool)

(assert (=> b!445963 m!430739))

(declare-fun m!430741 () Bool)

(assert (=> b!445963 m!430741))

(declare-fun m!430743 () Bool)

(assert (=> b!445963 m!430743))

(declare-fun m!430745 () Bool)

(assert (=> b!445963 m!430745))

(assert (=> b!445963 m!430743))

(declare-fun m!430747 () Bool)

(assert (=> b!445963 m!430747))

(assert (=> b!445963 m!430739))

(assert (=> b!445963 m!430745))

(declare-fun m!430749 () Bool)

(assert (=> bm!29630 m!430749))

(declare-fun m!430751 () Bool)

(assert (=> b!445952 m!430751))

(declare-fun m!430753 () Bool)

(assert (=> d!73943 m!430753))

(assert (=> d!73943 m!430619))

(assert (=> b!445953 m!430749))

(assert (=> b!445961 m!430739))

(assert (=> b!445961 m!430739))

(declare-fun m!430755 () Bool)

(assert (=> b!445961 m!430755))

(assert (=> b!445956 m!430739))

(assert (=> b!445956 m!430739))

(assert (=> b!445956 m!430755))

(assert (=> b!445962 m!430739))

(assert (=> b!445962 m!430739))

(declare-fun m!430757 () Bool)

(assert (=> b!445962 m!430757))

(assert (=> b!445955 m!430743))

(declare-fun m!430759 () Bool)

(assert (=> b!445955 m!430759))

(assert (=> b!445955 m!430745))

(assert (=> b!445955 m!430743))

(assert (=> b!445955 m!430747))

(declare-fun m!430761 () Bool)

(assert (=> b!445955 m!430761))

(declare-fun m!430763 () Bool)

(assert (=> b!445955 m!430763))

(declare-fun m!430765 () Bool)

(assert (=> b!445955 m!430765))

(assert (=> b!445955 m!430739))

(assert (=> b!445955 m!430761))

(assert (=> b!445955 m!430745))

(declare-fun m!430767 () Bool)

(assert (=> b!445954 m!430767))

(assert (=> bm!29612 d!73943))

(declare-fun b!445966 () Bool)

(declare-fun res!264727 () Bool)

(declare-fun e!262000 () Bool)

(assert (=> b!445966 (=> (not res!264727) (not e!262000))))

(declare-fun lt!203517 () ListLongMap!6773)

(assert (=> b!445966 (= res!264727 (not (contains!2478 lt!203517 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!261998 () Bool)

(declare-fun b!445967 () Bool)

(assert (=> b!445967 (= e!261998 (= lt!203517 (getCurrentListMapNoExtraKeys!1601 (ite c!55816 _keys!709 lt!203473) (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!445968 () Bool)

(assert (=> b!445968 (= e!261998 (isEmpty!560 lt!203517))))

(declare-fun b!445969 () Bool)

(declare-fun lt!203519 () Unit!13133)

(declare-fun lt!203521 () Unit!13133)

(assert (=> b!445969 (= lt!203519 lt!203521)))

(declare-fun lt!203522 () (_ BitVec 64))

(declare-fun lt!203518 () V!16939)

(declare-fun lt!203523 () ListLongMap!6773)

(declare-fun lt!203520 () (_ BitVec 64))

(assert (=> b!445969 (not (contains!2478 (+!1557 lt!203523 (tuple2!7871 lt!203520 lt!203518)) lt!203522))))

(assert (=> b!445969 (= lt!203521 (addStillNotContains!144 lt!203523 lt!203520 lt!203518 lt!203522))))

(assert (=> b!445969 (= lt!203522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!445969 (= lt!203518 (get!6540 (select (arr!13229 (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!445969 (= lt!203520 (select (arr!13228 (ite c!55816 _keys!709 lt!203473)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29634 () ListLongMap!6773)

(assert (=> b!445969 (= lt!203523 call!29634)))

(declare-fun e!261996 () ListLongMap!6773)

(assert (=> b!445969 (= e!261996 (+!1557 call!29634 (tuple2!7871 (select (arr!13228 (ite c!55816 _keys!709 lt!203473)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6540 (select (arr!13229 (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!445970 () Bool)

(declare-fun e!262001 () Bool)

(assert (=> b!445970 (= e!262001 (validKeyInArray!0 (select (arr!13228 (ite c!55816 _keys!709 lt!203473)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!445970 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!445971 () Bool)

(declare-fun e!262002 () Bool)

(assert (=> b!445971 (= e!262000 e!262002)))

(declare-fun c!55838 () Bool)

(assert (=> b!445971 (= c!55838 e!262001)))

(declare-fun res!264728 () Bool)

(assert (=> b!445971 (=> (not res!264728) (not e!262001))))

(assert (=> b!445971 (= res!264728 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 _keys!709 lt!203473))))))

(declare-fun d!73945 () Bool)

(assert (=> d!73945 e!262000))

(declare-fun res!264725 () Bool)

(assert (=> d!73945 (=> (not res!264725) (not e!262000))))

(assert (=> d!73945 (= res!264725 (not (contains!2478 lt!203517 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!261997 () ListLongMap!6773)

(assert (=> d!73945 (= lt!203517 e!261997)))

(declare-fun c!55839 () Bool)

(assert (=> d!73945 (= c!55839 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 _keys!709 lt!203473))))))

(assert (=> d!73945 (validMask!0 mask!1025)))

(assert (=> d!73945 (= (getCurrentListMapNoExtraKeys!1601 (ite c!55816 _keys!709 lt!203473) (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203517)))

(declare-fun b!445972 () Bool)

(assert (=> b!445972 (= e!261997 (ListLongMap!6774 Nil!7917))))

(declare-fun b!445973 () Bool)

(assert (=> b!445973 (= e!262002 e!261998)))

(declare-fun c!55840 () Bool)

(assert (=> b!445973 (= c!55840 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 _keys!709 lt!203473))))))

(declare-fun bm!29631 () Bool)

(assert (=> bm!29631 (= call!29634 (getCurrentListMapNoExtraKeys!1601 (ite c!55816 _keys!709 lt!203473) (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!445974 () Bool)

(assert (=> b!445974 (= e!261996 call!29634)))

(declare-fun b!445975 () Bool)

(assert (=> b!445975 (= e!261997 e!261996)))

(declare-fun c!55841 () Bool)

(assert (=> b!445975 (= c!55841 (validKeyInArray!0 (select (arr!13228 (ite c!55816 _keys!709 lt!203473)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!445976 () Bool)

(declare-fun e!261999 () Bool)

(assert (=> b!445976 (= e!262002 e!261999)))

(assert (=> b!445976 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 _keys!709 lt!203473))))))

(declare-fun res!264726 () Bool)

(assert (=> b!445976 (= res!264726 (contains!2478 lt!203517 (select (arr!13228 (ite c!55816 _keys!709 lt!203473)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!445976 (=> (not res!264726) (not e!261999))))

(declare-fun b!445977 () Bool)

(assert (=> b!445977 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55816 _keys!709 lt!203473))))))

(assert (=> b!445977 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13582 (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))))))))

(assert (=> b!445977 (= e!261999 (= (apply!310 lt!203517 (select (arr!13228 (ite c!55816 _keys!709 lt!203473)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6540 (select (arr!13229 (ite c!55816 _values!549 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!73945 c!55839) b!445972))

(assert (= (and d!73945 (not c!55839)) b!445975))

(assert (= (and b!445975 c!55841) b!445969))

(assert (= (and b!445975 (not c!55841)) b!445974))

(assert (= (or b!445969 b!445974) bm!29631))

(assert (= (and d!73945 res!264725) b!445966))

(assert (= (and b!445966 res!264727) b!445971))

(assert (= (and b!445971 res!264728) b!445970))

(assert (= (and b!445971 c!55838) b!445976))

(assert (= (and b!445971 (not c!55838)) b!445973))

(assert (= (and b!445976 res!264726) b!445977))

(assert (= (and b!445973 c!55840) b!445967))

(assert (= (and b!445973 (not c!55840)) b!445968))

(declare-fun b_lambda!9415 () Bool)

(assert (=> (not b_lambda!9415) (not b!445969)))

(assert (=> b!445969 t!13673))

(declare-fun b_and!18529 () Bool)

(assert (= b_and!18527 (and (=> t!13673 result!6957) b_and!18529)))

(declare-fun b_lambda!9417 () Bool)

(assert (=> (not b_lambda!9417) (not b!445977)))

(assert (=> b!445977 t!13673))

(declare-fun b_and!18531 () Bool)

(assert (= b_and!18529 (and (=> t!13673 result!6957) b_and!18531)))

(declare-fun m!430769 () Bool)

(assert (=> b!445977 m!430769))

(declare-fun m!430771 () Bool)

(assert (=> b!445977 m!430771))

(assert (=> b!445977 m!430743))

(declare-fun m!430773 () Bool)

(assert (=> b!445977 m!430773))

(assert (=> b!445977 m!430743))

(declare-fun m!430775 () Bool)

(assert (=> b!445977 m!430775))

(assert (=> b!445977 m!430769))

(assert (=> b!445977 m!430773))

(declare-fun m!430777 () Bool)

(assert (=> bm!29631 m!430777))

(declare-fun m!430779 () Bool)

(assert (=> b!445966 m!430779))

(declare-fun m!430781 () Bool)

(assert (=> d!73945 m!430781))

(assert (=> d!73945 m!430619))

(assert (=> b!445967 m!430777))

(assert (=> b!445975 m!430769))

(assert (=> b!445975 m!430769))

(declare-fun m!430783 () Bool)

(assert (=> b!445975 m!430783))

(assert (=> b!445970 m!430769))

(assert (=> b!445970 m!430769))

(assert (=> b!445970 m!430783))

(assert (=> b!445976 m!430769))

(assert (=> b!445976 m!430769))

(declare-fun m!430785 () Bool)

(assert (=> b!445976 m!430785))

(assert (=> b!445969 m!430743))

(declare-fun m!430787 () Bool)

(assert (=> b!445969 m!430787))

(assert (=> b!445969 m!430773))

(assert (=> b!445969 m!430743))

(assert (=> b!445969 m!430775))

(declare-fun m!430789 () Bool)

(assert (=> b!445969 m!430789))

(declare-fun m!430791 () Bool)

(assert (=> b!445969 m!430791))

(declare-fun m!430793 () Bool)

(assert (=> b!445969 m!430793))

(assert (=> b!445969 m!430769))

(assert (=> b!445969 m!430789))

(assert (=> b!445969 m!430773))

(declare-fun m!430795 () Bool)

(assert (=> b!445968 m!430795))

(assert (=> bm!29611 d!73945))

(declare-fun d!73947 () Bool)

(declare-fun res!264736 () Bool)

(declare-fun e!262012 () Bool)

(assert (=> d!73947 (=> res!264736 e!262012)))

(assert (=> d!73947 (= res!264736 (bvsge #b00000000000000000000000000000000 (size!13581 lt!203473)))))

(assert (=> d!73947 (= (arrayNoDuplicates!0 lt!203473 #b00000000000000000000000000000000 Nil!7916) e!262012)))

(declare-fun b!445988 () Bool)

(declare-fun e!262011 () Bool)

(declare-fun contains!2479 (List!7919 (_ BitVec 64)) Bool)

(assert (=> b!445988 (= e!262011 (contains!2479 Nil!7916 (select (arr!13228 lt!203473) #b00000000000000000000000000000000)))))

(declare-fun b!445989 () Bool)

(declare-fun e!262014 () Bool)

(declare-fun e!262013 () Bool)

(assert (=> b!445989 (= e!262014 e!262013)))

(declare-fun c!55844 () Bool)

(assert (=> b!445989 (= c!55844 (validKeyInArray!0 (select (arr!13228 lt!203473) #b00000000000000000000000000000000)))))

(declare-fun b!445990 () Bool)

(declare-fun call!29637 () Bool)

(assert (=> b!445990 (= e!262013 call!29637)))

(declare-fun b!445991 () Bool)

(assert (=> b!445991 (= e!262013 call!29637)))

(declare-fun bm!29634 () Bool)

(assert (=> bm!29634 (= call!29637 (arrayNoDuplicates!0 lt!203473 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55844 (Cons!7915 (select (arr!13228 lt!203473) #b00000000000000000000000000000000) Nil!7916) Nil!7916)))))

(declare-fun b!445992 () Bool)

(assert (=> b!445992 (= e!262012 e!262014)))

(declare-fun res!264735 () Bool)

(assert (=> b!445992 (=> (not res!264735) (not e!262014))))

(assert (=> b!445992 (= res!264735 (not e!262011))))

(declare-fun res!264737 () Bool)

(assert (=> b!445992 (=> (not res!264737) (not e!262011))))

(assert (=> b!445992 (= res!264737 (validKeyInArray!0 (select (arr!13228 lt!203473) #b00000000000000000000000000000000)))))

(assert (= (and d!73947 (not res!264736)) b!445992))

(assert (= (and b!445992 res!264737) b!445988))

(assert (= (and b!445992 res!264735) b!445989))

(assert (= (and b!445989 c!55844) b!445991))

(assert (= (and b!445989 (not c!55844)) b!445990))

(assert (= (or b!445991 b!445990) bm!29634))

(assert (=> b!445988 m!430727))

(assert (=> b!445988 m!430727))

(declare-fun m!430797 () Bool)

(assert (=> b!445988 m!430797))

(assert (=> b!445989 m!430727))

(assert (=> b!445989 m!430727))

(assert (=> b!445989 m!430729))

(assert (=> bm!29634 m!430727))

(declare-fun m!430799 () Bool)

(assert (=> bm!29634 m!430799))

(assert (=> b!445992 m!430727))

(assert (=> b!445992 m!430727))

(assert (=> b!445992 m!430729))

(assert (=> b!445798 d!73947))

(declare-fun d!73949 () Bool)

(assert (=> d!73949 (= (array_inv!9644 _values!549) (bvsge (size!13582 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40476 d!73949))

(declare-fun d!73951 () Bool)

(assert (=> d!73951 (= (array_inv!9645 _keys!709) (bvsge (size!13581 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40476 d!73951))

(declare-fun d!73953 () Bool)

(assert (=> d!73953 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!445800 d!73953))

(declare-fun b!445993 () Bool)

(declare-fun res!264740 () Bool)

(declare-fun e!262019 () Bool)

(assert (=> b!445993 (=> (not res!264740) (not e!262019))))

(declare-fun lt!203524 () ListLongMap!6773)

(assert (=> b!445993 (= res!264740 (not (contains!2478 lt!203524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445994 () Bool)

(declare-fun e!262017 () Bool)

(assert (=> b!445994 (= e!262017 (= lt!203524 (getCurrentListMapNoExtraKeys!1601 lt!203473 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!445995 () Bool)

(assert (=> b!445995 (= e!262017 (isEmpty!560 lt!203524))))

(declare-fun b!445996 () Bool)

(declare-fun lt!203526 () Unit!13133)

(declare-fun lt!203528 () Unit!13133)

(assert (=> b!445996 (= lt!203526 lt!203528)))

(declare-fun lt!203525 () V!16939)

(declare-fun lt!203529 () (_ BitVec 64))

(declare-fun lt!203527 () (_ BitVec 64))

(declare-fun lt!203530 () ListLongMap!6773)

(assert (=> b!445996 (not (contains!2478 (+!1557 lt!203530 (tuple2!7871 lt!203527 lt!203525)) lt!203529))))

(assert (=> b!445996 (= lt!203528 (addStillNotContains!144 lt!203530 lt!203527 lt!203525 lt!203529))))

(assert (=> b!445996 (= lt!203529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!445996 (= lt!203525 (get!6540 (select (arr!13229 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!445996 (= lt!203527 (select (arr!13228 lt!203473) from!863))))

(declare-fun call!29638 () ListLongMap!6773)

(assert (=> b!445996 (= lt!203530 call!29638)))

(declare-fun e!262015 () ListLongMap!6773)

(assert (=> b!445996 (= e!262015 (+!1557 call!29638 (tuple2!7871 (select (arr!13228 lt!203473) from!863) (get!6540 (select (arr!13229 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!445997 () Bool)

(declare-fun e!262020 () Bool)

(assert (=> b!445997 (= e!262020 (validKeyInArray!0 (select (arr!13228 lt!203473) from!863)))))

(assert (=> b!445997 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!445998 () Bool)

(declare-fun e!262021 () Bool)

(assert (=> b!445998 (= e!262019 e!262021)))

(declare-fun c!55845 () Bool)

(assert (=> b!445998 (= c!55845 e!262020)))

(declare-fun res!264741 () Bool)

(assert (=> b!445998 (=> (not res!264741) (not e!262020))))

(assert (=> b!445998 (= res!264741 (bvslt from!863 (size!13581 lt!203473)))))

(declare-fun d!73955 () Bool)

(assert (=> d!73955 e!262019))

(declare-fun res!264738 () Bool)

(assert (=> d!73955 (=> (not res!264738) (not e!262019))))

(assert (=> d!73955 (= res!264738 (not (contains!2478 lt!203524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!262016 () ListLongMap!6773)

(assert (=> d!73955 (= lt!203524 e!262016)))

(declare-fun c!55846 () Bool)

(assert (=> d!73955 (= c!55846 (bvsge from!863 (size!13581 lt!203473)))))

(assert (=> d!73955 (validMask!0 mask!1025)))

(assert (=> d!73955 (= (getCurrentListMapNoExtraKeys!1601 lt!203473 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203524)))

(declare-fun b!445999 () Bool)

(assert (=> b!445999 (= e!262016 (ListLongMap!6774 Nil!7917))))

(declare-fun b!446000 () Bool)

(assert (=> b!446000 (= e!262021 e!262017)))

(declare-fun c!55847 () Bool)

(assert (=> b!446000 (= c!55847 (bvslt from!863 (size!13581 lt!203473)))))

(declare-fun bm!29635 () Bool)

(assert (=> bm!29635 (= call!29638 (getCurrentListMapNoExtraKeys!1601 lt!203473 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446001 () Bool)

(assert (=> b!446001 (= e!262015 call!29638)))

(declare-fun b!446002 () Bool)

(assert (=> b!446002 (= e!262016 e!262015)))

(declare-fun c!55848 () Bool)

(assert (=> b!446002 (= c!55848 (validKeyInArray!0 (select (arr!13228 lt!203473) from!863)))))

(declare-fun b!446003 () Bool)

(declare-fun e!262018 () Bool)

(assert (=> b!446003 (= e!262021 e!262018)))

(assert (=> b!446003 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 lt!203473)))))

(declare-fun res!264739 () Bool)

(assert (=> b!446003 (= res!264739 (contains!2478 lt!203524 (select (arr!13228 lt!203473) from!863)))))

(assert (=> b!446003 (=> (not res!264739) (not e!262018))))

(declare-fun b!446004 () Bool)

(assert (=> b!446004 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 lt!203473)))))

(assert (=> b!446004 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13582 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)))))))

(assert (=> b!446004 (= e!262018 (= (apply!310 lt!203524 (select (arr!13228 lt!203473) from!863)) (get!6540 (select (arr!13229 (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549))) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!73955 c!55846) b!445999))

(assert (= (and d!73955 (not c!55846)) b!446002))

(assert (= (and b!446002 c!55848) b!445996))

(assert (= (and b!446002 (not c!55848)) b!446001))

(assert (= (or b!445996 b!446001) bm!29635))

(assert (= (and d!73955 res!264738) b!445993))

(assert (= (and b!445993 res!264740) b!445998))

(assert (= (and b!445998 res!264741) b!445997))

(assert (= (and b!445998 c!55845) b!446003))

(assert (= (and b!445998 (not c!55845)) b!446000))

(assert (= (and b!446003 res!264739) b!446004))

(assert (= (and b!446000 c!55847) b!445994))

(assert (= (and b!446000 (not c!55847)) b!445995))

(declare-fun b_lambda!9419 () Bool)

(assert (=> (not b_lambda!9419) (not b!445996)))

(assert (=> b!445996 t!13673))

(declare-fun b_and!18533 () Bool)

(assert (= b_and!18531 (and (=> t!13673 result!6957) b_and!18533)))

(declare-fun b_lambda!9421 () Bool)

(assert (=> (not b_lambda!9421) (not b!446004)))

(assert (=> b!446004 t!13673))

(declare-fun b_and!18535 () Bool)

(assert (= b_and!18533 (and (=> t!13673 result!6957) b_and!18535)))

(declare-fun m!430801 () Bool)

(assert (=> b!446004 m!430801))

(declare-fun m!430803 () Bool)

(assert (=> b!446004 m!430803))

(assert (=> b!446004 m!430743))

(declare-fun m!430805 () Bool)

(assert (=> b!446004 m!430805))

(assert (=> b!446004 m!430743))

(declare-fun m!430807 () Bool)

(assert (=> b!446004 m!430807))

(assert (=> b!446004 m!430801))

(assert (=> b!446004 m!430805))

(declare-fun m!430809 () Bool)

(assert (=> bm!29635 m!430809))

(declare-fun m!430811 () Bool)

(assert (=> b!445993 m!430811))

(declare-fun m!430813 () Bool)

(assert (=> d!73955 m!430813))

(assert (=> d!73955 m!430619))

(assert (=> b!445994 m!430809))

(assert (=> b!446002 m!430801))

(assert (=> b!446002 m!430801))

(declare-fun m!430815 () Bool)

(assert (=> b!446002 m!430815))

(assert (=> b!445997 m!430801))

(assert (=> b!445997 m!430801))

(assert (=> b!445997 m!430815))

(assert (=> b!446003 m!430801))

(assert (=> b!446003 m!430801))

(declare-fun m!430817 () Bool)

(assert (=> b!446003 m!430817))

(assert (=> b!445996 m!430743))

(declare-fun m!430819 () Bool)

(assert (=> b!445996 m!430819))

(assert (=> b!445996 m!430805))

(assert (=> b!445996 m!430743))

(assert (=> b!445996 m!430807))

(declare-fun m!430821 () Bool)

(assert (=> b!445996 m!430821))

(declare-fun m!430823 () Bool)

(assert (=> b!445996 m!430823))

(declare-fun m!430825 () Bool)

(assert (=> b!445996 m!430825))

(assert (=> b!445996 m!430801))

(assert (=> b!445996 m!430821))

(assert (=> b!445996 m!430805))

(declare-fun m!430827 () Bool)

(assert (=> b!445995 m!430827))

(assert (=> b!445807 d!73955))

(declare-fun b!446005 () Bool)

(declare-fun res!264744 () Bool)

(declare-fun e!262026 () Bool)

(assert (=> b!446005 (=> (not res!264744) (not e!262026))))

(declare-fun lt!203531 () ListLongMap!6773)

(assert (=> b!446005 (= res!264744 (not (contains!2478 lt!203531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!262024 () Bool)

(declare-fun b!446006 () Bool)

(assert (=> b!446006 (= e!262024 (= lt!203531 (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446007 () Bool)

(assert (=> b!446007 (= e!262024 (isEmpty!560 lt!203531))))

(declare-fun b!446008 () Bool)

(declare-fun lt!203533 () Unit!13133)

(declare-fun lt!203535 () Unit!13133)

(assert (=> b!446008 (= lt!203533 lt!203535)))

(declare-fun lt!203534 () (_ BitVec 64))

(declare-fun lt!203536 () (_ BitVec 64))

(declare-fun lt!203537 () ListLongMap!6773)

(declare-fun lt!203532 () V!16939)

(assert (=> b!446008 (not (contains!2478 (+!1557 lt!203537 (tuple2!7871 lt!203534 lt!203532)) lt!203536))))

(assert (=> b!446008 (= lt!203535 (addStillNotContains!144 lt!203537 lt!203534 lt!203532 lt!203536))))

(assert (=> b!446008 (= lt!203536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446008 (= lt!203532 (get!6540 (select (arr!13229 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446008 (= lt!203534 (select (arr!13228 _keys!709) from!863))))

(declare-fun call!29639 () ListLongMap!6773)

(assert (=> b!446008 (= lt!203537 call!29639)))

(declare-fun e!262022 () ListLongMap!6773)

(assert (=> b!446008 (= e!262022 (+!1557 call!29639 (tuple2!7871 (select (arr!13228 _keys!709) from!863) (get!6540 (select (arr!13229 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446009 () Bool)

(declare-fun e!262027 () Bool)

(assert (=> b!446009 (= e!262027 (validKeyInArray!0 (select (arr!13228 _keys!709) from!863)))))

(assert (=> b!446009 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446010 () Bool)

(declare-fun e!262028 () Bool)

(assert (=> b!446010 (= e!262026 e!262028)))

(declare-fun c!55849 () Bool)

(assert (=> b!446010 (= c!55849 e!262027)))

(declare-fun res!264745 () Bool)

(assert (=> b!446010 (=> (not res!264745) (not e!262027))))

(assert (=> b!446010 (= res!264745 (bvslt from!863 (size!13581 _keys!709)))))

(declare-fun d!73957 () Bool)

(assert (=> d!73957 e!262026))

(declare-fun res!264742 () Bool)

(assert (=> d!73957 (=> (not res!264742) (not e!262026))))

(assert (=> d!73957 (= res!264742 (not (contains!2478 lt!203531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!262023 () ListLongMap!6773)

(assert (=> d!73957 (= lt!203531 e!262023)))

(declare-fun c!55850 () Bool)

(assert (=> d!73957 (= c!55850 (bvsge from!863 (size!13581 _keys!709)))))

(assert (=> d!73957 (validMask!0 mask!1025)))

(assert (=> d!73957 (= (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203531)))

(declare-fun b!446011 () Bool)

(assert (=> b!446011 (= e!262023 (ListLongMap!6774 Nil!7917))))

(declare-fun b!446012 () Bool)

(assert (=> b!446012 (= e!262028 e!262024)))

(declare-fun c!55851 () Bool)

(assert (=> b!446012 (= c!55851 (bvslt from!863 (size!13581 _keys!709)))))

(declare-fun bm!29636 () Bool)

(assert (=> bm!29636 (= call!29639 (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446013 () Bool)

(assert (=> b!446013 (= e!262022 call!29639)))

(declare-fun b!446014 () Bool)

(assert (=> b!446014 (= e!262023 e!262022)))

(declare-fun c!55852 () Bool)

(assert (=> b!446014 (= c!55852 (validKeyInArray!0 (select (arr!13228 _keys!709) from!863)))))

(declare-fun b!446015 () Bool)

(declare-fun e!262025 () Bool)

(assert (=> b!446015 (= e!262028 e!262025)))

(assert (=> b!446015 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 _keys!709)))))

(declare-fun res!264743 () Bool)

(assert (=> b!446015 (= res!264743 (contains!2478 lt!203531 (select (arr!13228 _keys!709) from!863)))))

(assert (=> b!446015 (=> (not res!264743) (not e!262025))))

(declare-fun b!446016 () Bool)

(assert (=> b!446016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 _keys!709)))))

(assert (=> b!446016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13582 _values!549)))))

(assert (=> b!446016 (= e!262025 (= (apply!310 lt!203531 (select (arr!13228 _keys!709) from!863)) (get!6540 (select (arr!13229 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!73957 c!55850) b!446011))

(assert (= (and d!73957 (not c!55850)) b!446014))

(assert (= (and b!446014 c!55852) b!446008))

(assert (= (and b!446014 (not c!55852)) b!446013))

(assert (= (or b!446008 b!446013) bm!29636))

(assert (= (and d!73957 res!264742) b!446005))

(assert (= (and b!446005 res!264744) b!446010))

(assert (= (and b!446010 res!264745) b!446009))

(assert (= (and b!446010 c!55849) b!446015))

(assert (= (and b!446010 (not c!55849)) b!446012))

(assert (= (and b!446015 res!264743) b!446016))

(assert (= (and b!446012 c!55851) b!446006))

(assert (= (and b!446012 (not c!55851)) b!446007))

(declare-fun b_lambda!9423 () Bool)

(assert (=> (not b_lambda!9423) (not b!446008)))

(assert (=> b!446008 t!13673))

(declare-fun b_and!18537 () Bool)

(assert (= b_and!18535 (and (=> t!13673 result!6957) b_and!18537)))

(declare-fun b_lambda!9425 () Bool)

(assert (=> (not b_lambda!9425) (not b!446016)))

(assert (=> b!446016 t!13673))

(declare-fun b_and!18539 () Bool)

(assert (= b_and!18537 (and (=> t!13673 result!6957) b_and!18539)))

(declare-fun m!430829 () Bool)

(assert (=> b!446016 m!430829))

(declare-fun m!430831 () Bool)

(assert (=> b!446016 m!430831))

(assert (=> b!446016 m!430743))

(declare-fun m!430833 () Bool)

(assert (=> b!446016 m!430833))

(assert (=> b!446016 m!430743))

(declare-fun m!430835 () Bool)

(assert (=> b!446016 m!430835))

(assert (=> b!446016 m!430829))

(assert (=> b!446016 m!430833))

(declare-fun m!430837 () Bool)

(assert (=> bm!29636 m!430837))

(declare-fun m!430839 () Bool)

(assert (=> b!446005 m!430839))

(declare-fun m!430841 () Bool)

(assert (=> d!73957 m!430841))

(assert (=> d!73957 m!430619))

(assert (=> b!446006 m!430837))

(assert (=> b!446014 m!430829))

(assert (=> b!446014 m!430829))

(declare-fun m!430843 () Bool)

(assert (=> b!446014 m!430843))

(assert (=> b!446009 m!430829))

(assert (=> b!446009 m!430829))

(assert (=> b!446009 m!430843))

(assert (=> b!446015 m!430829))

(assert (=> b!446015 m!430829))

(declare-fun m!430845 () Bool)

(assert (=> b!446015 m!430845))

(assert (=> b!446008 m!430743))

(declare-fun m!430847 () Bool)

(assert (=> b!446008 m!430847))

(assert (=> b!446008 m!430833))

(assert (=> b!446008 m!430743))

(assert (=> b!446008 m!430835))

(declare-fun m!430849 () Bool)

(assert (=> b!446008 m!430849))

(declare-fun m!430851 () Bool)

(assert (=> b!446008 m!430851))

(declare-fun m!430853 () Bool)

(assert (=> b!446008 m!430853))

(assert (=> b!446008 m!430829))

(assert (=> b!446008 m!430849))

(assert (=> b!446008 m!430833))

(declare-fun m!430855 () Bool)

(assert (=> b!446007 m!430855))

(assert (=> b!445807 d!73957))

(declare-fun call!29645 () ListLongMap!6773)

(declare-fun bm!29641 () Bool)

(assert (=> bm!29641 (= call!29645 (getCurrentListMapNoExtraKeys!1601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!262034 () Bool)

(declare-fun call!29644 () ListLongMap!6773)

(declare-fun b!446023 () Bool)

(assert (=> b!446023 (= e!262034 (= call!29644 (+!1557 call!29645 (tuple2!7871 k0!794 v!412))))))

(declare-fun d!73959 () Bool)

(declare-fun e!262033 () Bool)

(assert (=> d!73959 e!262033))

(declare-fun res!264748 () Bool)

(assert (=> d!73959 (=> (not res!264748) (not e!262033))))

(assert (=> d!73959 (= res!264748 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13581 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13582 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13581 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13582 _values!549))))))))

(declare-fun lt!203540 () Unit!13133)

(declare-fun choose!1332 (array!27561 array!27563 (_ BitVec 32) (_ BitVec 32) V!16939 V!16939 (_ BitVec 32) (_ BitVec 64) V!16939 (_ BitVec 32) Int) Unit!13133)

(assert (=> d!73959 (= lt!203540 (choose!1332 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!73959 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13581 _keys!709)))))

(assert (=> d!73959 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203540)))

(declare-fun b!446024 () Bool)

(assert (=> b!446024 (= e!262033 e!262034)))

(declare-fun c!55855 () Bool)

(assert (=> b!446024 (= c!55855 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!446025 () Bool)

(assert (=> b!446025 (= e!262034 (= call!29644 call!29645))))

(declare-fun bm!29642 () Bool)

(assert (=> bm!29642 (= call!29644 (getCurrentListMapNoExtraKeys!1601 (array!27562 (store (arr!13228 _keys!709) i!563 k0!794) (size!13581 _keys!709)) (array!27564 (store (arr!13229 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13582 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!73959 res!264748) b!446024))

(assert (= (and b!446024 c!55855) b!446023))

(assert (= (and b!446024 (not c!55855)) b!446025))

(assert (= (or b!446023 b!446025) bm!29641))

(assert (= (or b!446023 b!446025) bm!29642))

(declare-fun m!430857 () Bool)

(assert (=> bm!29641 m!430857))

(declare-fun m!430859 () Bool)

(assert (=> b!446023 m!430859))

(declare-fun m!430861 () Bool)

(assert (=> d!73959 m!430861))

(assert (=> bm!29642 m!430629))

(assert (=> bm!29642 m!430611))

(declare-fun m!430863 () Bool)

(assert (=> bm!29642 m!430863))

(assert (=> b!445807 d!73959))

(declare-fun d!73961 () Bool)

(declare-fun res!264750 () Bool)

(declare-fun e!262036 () Bool)

(assert (=> d!73961 (=> res!264750 e!262036)))

(assert (=> d!73961 (= res!264750 (bvsge #b00000000000000000000000000000000 (size!13581 _keys!709)))))

(assert (=> d!73961 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7916) e!262036)))

(declare-fun b!446026 () Bool)

(declare-fun e!262035 () Bool)

(assert (=> b!446026 (= e!262035 (contains!2479 Nil!7916 (select (arr!13228 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446027 () Bool)

(declare-fun e!262038 () Bool)

(declare-fun e!262037 () Bool)

(assert (=> b!446027 (= e!262038 e!262037)))

(declare-fun c!55856 () Bool)

(assert (=> b!446027 (= c!55856 (validKeyInArray!0 (select (arr!13228 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446028 () Bool)

(declare-fun call!29646 () Bool)

(assert (=> b!446028 (= e!262037 call!29646)))

(declare-fun b!446029 () Bool)

(assert (=> b!446029 (= e!262037 call!29646)))

(declare-fun bm!29643 () Bool)

(assert (=> bm!29643 (= call!29646 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55856 (Cons!7915 (select (arr!13228 _keys!709) #b00000000000000000000000000000000) Nil!7916) Nil!7916)))))

(declare-fun b!446030 () Bool)

(assert (=> b!446030 (= e!262036 e!262038)))

(declare-fun res!264749 () Bool)

(assert (=> b!446030 (=> (not res!264749) (not e!262038))))

(assert (=> b!446030 (= res!264749 (not e!262035))))

(declare-fun res!264751 () Bool)

(assert (=> b!446030 (=> (not res!264751) (not e!262035))))

(assert (=> b!446030 (= res!264751 (validKeyInArray!0 (select (arr!13228 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73961 (not res!264750)) b!446030))

(assert (= (and b!446030 res!264751) b!446026))

(assert (= (and b!446030 res!264749) b!446027))

(assert (= (and b!446027 c!55856) b!446029))

(assert (= (and b!446027 (not c!55856)) b!446028))

(assert (= (or b!446029 b!446028) bm!29643))

(assert (=> b!446026 m!430723))

(assert (=> b!446026 m!430723))

(declare-fun m!430865 () Bool)

(assert (=> b!446026 m!430865))

(assert (=> b!446027 m!430723))

(assert (=> b!446027 m!430723))

(declare-fun m!430867 () Bool)

(assert (=> b!446027 m!430867))

(assert (=> bm!29643 m!430723))

(declare-fun m!430869 () Bool)

(assert (=> bm!29643 m!430869))

(assert (=> b!446030 m!430723))

(assert (=> b!446030 m!430723))

(assert (=> b!446030 m!430867))

(assert (=> b!445791 d!73961))

(declare-fun b!446031 () Bool)

(declare-fun e!262041 () Bool)

(declare-fun call!29647 () Bool)

(assert (=> b!446031 (= e!262041 call!29647)))

(declare-fun b!446032 () Bool)

(declare-fun e!262039 () Bool)

(assert (=> b!446032 (= e!262039 e!262041)))

(declare-fun c!55857 () Bool)

(assert (=> b!446032 (= c!55857 (validKeyInArray!0 (select (arr!13228 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73963 () Bool)

(declare-fun res!264753 () Bool)

(assert (=> d!73963 (=> res!264753 e!262039)))

(assert (=> d!73963 (= res!264753 (bvsge #b00000000000000000000000000000000 (size!13581 _keys!709)))))

(assert (=> d!73963 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!262039)))

(declare-fun b!446033 () Bool)

(declare-fun e!262040 () Bool)

(assert (=> b!446033 (= e!262040 call!29647)))

(declare-fun bm!29644 () Bool)

(assert (=> bm!29644 (= call!29647 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!446034 () Bool)

(assert (=> b!446034 (= e!262041 e!262040)))

(declare-fun lt!203542 () (_ BitVec 64))

(assert (=> b!446034 (= lt!203542 (select (arr!13228 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203543 () Unit!13133)

(assert (=> b!446034 (= lt!203543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203542 #b00000000000000000000000000000000))))

(assert (=> b!446034 (arrayContainsKey!0 _keys!709 lt!203542 #b00000000000000000000000000000000)))

(declare-fun lt!203541 () Unit!13133)

(assert (=> b!446034 (= lt!203541 lt!203543)))

(declare-fun res!264752 () Bool)

(assert (=> b!446034 (= res!264752 (= (seekEntryOrOpen!0 (select (arr!13228 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3524 #b00000000000000000000000000000000)))))

(assert (=> b!446034 (=> (not res!264752) (not e!262040))))

(assert (= (and d!73963 (not res!264753)) b!446032))

(assert (= (and b!446032 c!55857) b!446034))

(assert (= (and b!446032 (not c!55857)) b!446031))

(assert (= (and b!446034 res!264752) b!446033))

(assert (= (or b!446033 b!446031) bm!29644))

(assert (=> b!446032 m!430723))

(assert (=> b!446032 m!430723))

(assert (=> b!446032 m!430867))

(declare-fun m!430871 () Bool)

(assert (=> bm!29644 m!430871))

(assert (=> b!446034 m!430723))

(declare-fun m!430873 () Bool)

(assert (=> b!446034 m!430873))

(declare-fun m!430875 () Bool)

(assert (=> b!446034 m!430875))

(assert (=> b!446034 m!430723))

(declare-fun m!430877 () Bool)

(assert (=> b!446034 m!430877))

(assert (=> b!445793 d!73963))

(declare-fun d!73965 () Bool)

(declare-fun e!262044 () Bool)

(assert (=> d!73965 e!262044))

(declare-fun res!264759 () Bool)

(assert (=> d!73965 (=> (not res!264759) (not e!262044))))

(declare-fun lt!203555 () ListLongMap!6773)

(assert (=> d!73965 (= res!264759 (contains!2478 lt!203555 (_1!3946 (tuple2!7871 k0!794 v!412))))))

(declare-fun lt!203552 () List!7920)

(assert (=> d!73965 (= lt!203555 (ListLongMap!6774 lt!203552))))

(declare-fun lt!203553 () Unit!13133)

(declare-fun lt!203554 () Unit!13133)

(assert (=> d!73965 (= lt!203553 lt!203554)))

(declare-datatypes ((Option!372 0))(
  ( (Some!371 (v!8233 V!16939)) (None!370) )
))
(declare-fun getValueByKey!366 (List!7920 (_ BitVec 64)) Option!372)

(assert (=> d!73965 (= (getValueByKey!366 lt!203552 (_1!3946 (tuple2!7871 k0!794 v!412))) (Some!371 (_2!3946 (tuple2!7871 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!191 (List!7920 (_ BitVec 64) V!16939) Unit!13133)

(assert (=> d!73965 (= lt!203554 (lemmaContainsTupThenGetReturnValue!191 lt!203552 (_1!3946 (tuple2!7871 k0!794 v!412)) (_2!3946 (tuple2!7871 k0!794 v!412))))))

(declare-fun insertStrictlySorted!194 (List!7920 (_ BitVec 64) V!16939) List!7920)

(assert (=> d!73965 (= lt!203552 (insertStrictlySorted!194 (toList!3402 call!29614) (_1!3946 (tuple2!7871 k0!794 v!412)) (_2!3946 (tuple2!7871 k0!794 v!412))))))

(assert (=> d!73965 (= (+!1557 call!29614 (tuple2!7871 k0!794 v!412)) lt!203555)))

(declare-fun b!446039 () Bool)

(declare-fun res!264758 () Bool)

(assert (=> b!446039 (=> (not res!264758) (not e!262044))))

(assert (=> b!446039 (= res!264758 (= (getValueByKey!366 (toList!3402 lt!203555) (_1!3946 (tuple2!7871 k0!794 v!412))) (Some!371 (_2!3946 (tuple2!7871 k0!794 v!412)))))))

(declare-fun b!446040 () Bool)

(declare-fun contains!2480 (List!7920 tuple2!7870) Bool)

(assert (=> b!446040 (= e!262044 (contains!2480 (toList!3402 lt!203555) (tuple2!7871 k0!794 v!412)))))

(assert (= (and d!73965 res!264759) b!446039))

(assert (= (and b!446039 res!264758) b!446040))

(declare-fun m!430879 () Bool)

(assert (=> d!73965 m!430879))

(declare-fun m!430881 () Bool)

(assert (=> d!73965 m!430881))

(declare-fun m!430883 () Bool)

(assert (=> d!73965 m!430883))

(declare-fun m!430885 () Bool)

(assert (=> d!73965 m!430885))

(declare-fun m!430887 () Bool)

(assert (=> b!446039 m!430887))

(declare-fun m!430889 () Bool)

(assert (=> b!446040 m!430889))

(assert (=> b!445802 d!73965))

(declare-fun d!73967 () Bool)

(assert (=> d!73967 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!445803 d!73967))

(declare-fun b!446047 () Bool)

(declare-fun e!262050 () Bool)

(assert (=> b!446047 (= e!262050 tp_is_empty!11875)))

(declare-fun mapNonEmpty!19449 () Bool)

(declare-fun mapRes!19449 () Bool)

(declare-fun tp!37476 () Bool)

(assert (=> mapNonEmpty!19449 (= mapRes!19449 (and tp!37476 e!262050))))

(declare-fun mapKey!19449 () (_ BitVec 32))

(declare-fun mapRest!19449 () (Array (_ BitVec 32) ValueCell!5594))

(declare-fun mapValue!19449 () ValueCell!5594)

(assert (=> mapNonEmpty!19449 (= mapRest!19440 (store mapRest!19449 mapKey!19449 mapValue!19449))))

(declare-fun mapIsEmpty!19449 () Bool)

(assert (=> mapIsEmpty!19449 mapRes!19449))

(declare-fun b!446048 () Bool)

(declare-fun e!262049 () Bool)

(assert (=> b!446048 (= e!262049 tp_is_empty!11875)))

(declare-fun condMapEmpty!19449 () Bool)

(declare-fun mapDefault!19449 () ValueCell!5594)

(assert (=> mapNonEmpty!19440 (= condMapEmpty!19449 (= mapRest!19440 ((as const (Array (_ BitVec 32) ValueCell!5594)) mapDefault!19449)))))

(assert (=> mapNonEmpty!19440 (= tp!37461 (and e!262049 mapRes!19449))))

(assert (= (and mapNonEmpty!19440 condMapEmpty!19449) mapIsEmpty!19449))

(assert (= (and mapNonEmpty!19440 (not condMapEmpty!19449)) mapNonEmpty!19449))

(assert (= (and mapNonEmpty!19449 ((_ is ValueCellFull!5594) mapValue!19449)) b!446047))

(assert (= (and mapNonEmpty!19440 ((_ is ValueCellFull!5594) mapDefault!19449)) b!446048))

(declare-fun m!430891 () Bool)

(assert (=> mapNonEmpty!19449 m!430891))

(declare-fun b_lambda!9427 () Bool)

(assert (= b_lambda!9425 (or (and start!40476 b_free!10561) b_lambda!9427)))

(declare-fun b_lambda!9429 () Bool)

(assert (= b_lambda!9417 (or (and start!40476 b_free!10561) b_lambda!9429)))

(declare-fun b_lambda!9431 () Bool)

(assert (= b_lambda!9415 (or (and start!40476 b_free!10561) b_lambda!9431)))

(declare-fun b_lambda!9433 () Bool)

(assert (= b_lambda!9411 (or (and start!40476 b_free!10561) b_lambda!9433)))

(declare-fun b_lambda!9435 () Bool)

(assert (= b_lambda!9421 (or (and start!40476 b_free!10561) b_lambda!9435)))

(declare-fun b_lambda!9437 () Bool)

(assert (= b_lambda!9413 (or (and start!40476 b_free!10561) b_lambda!9437)))

(declare-fun b_lambda!9439 () Bool)

(assert (= b_lambda!9423 (or (and start!40476 b_free!10561) b_lambda!9439)))

(declare-fun b_lambda!9441 () Bool)

(assert (= b_lambda!9419 (or (and start!40476 b_free!10561) b_lambda!9441)))

(check-sat (not b!446003) (not b!445976) (not b_lambda!9435) (not bm!29641) (not b!445961) (not bm!29642) (not b!446026) (not b!445962) (not bm!29635) (not mapNonEmpty!19449) (not d!73943) b_and!18539 (not b!446023) (not b_lambda!9437) (not b_lambda!9429) (not b!445996) (not b!446005) (not b!445994) (not b!446004) (not b!446014) (not b!446007) (not d!73945) (not b!446040) (not b!446032) (not bm!29644) (not b!445993) (not b!445927) (not b!446039) (not b_lambda!9441) tp_is_empty!11875 (not b!446030) (not b_next!10561) (not b!445988) (not b!445967) (not bm!29634) (not b!445953) (not b!445969) (not b!445977) (not b!445995) (not b!446008) (not b_lambda!9427) (not b!445970) (not bm!29630) (not b!446034) (not b!446027) (not bm!29631) (not b!445966) (not bm!29636) (not b!445963) (not b!446016) (not b!446006) (not d!73965) (not b!446015) (not d!73957) (not b!445952) (not b!445997) (not b!445975) (not b!445955) (not b_lambda!9439) (not b!445968) (not b!445915) (not b!445954) (not b!445956) (not b_lambda!9431) (not bm!29643) (not b!446002) (not d!73955) (not b!445992) (not bm!29627) (not b_lambda!9433) (not b!445989) (not b!445925) (not d!73959) (not b!446009))
(check-sat b_and!18539 (not b_next!10561))
