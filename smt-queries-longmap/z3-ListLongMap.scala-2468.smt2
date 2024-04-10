; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38628 () Bool)

(assert start!38628)

(declare-fun b_free!9165 () Bool)

(declare-fun b_next!9165 () Bool)

(assert (=> start!38628 (= b_free!9165 (not b_next!9165))))

(declare-fun tp!32618 () Bool)

(declare-fun b_and!16551 () Bool)

(assert (=> start!38628 (= tp!32618 b_and!16551)))

(declare-fun b!400666 () Bool)

(declare-fun e!241736 () Bool)

(declare-fun tp_is_empty!10047 () Bool)

(assert (=> b!400666 (= e!241736 tp_is_empty!10047)))

(declare-fun b!400667 () Bool)

(declare-fun res!230543 () Bool)

(declare-fun e!241739 () Bool)

(assert (=> b!400667 (=> (not res!230543) (not e!241739))))

(declare-datatypes ((array!24003 0))(
  ( (array!24004 (arr!11451 (Array (_ BitVec 32) (_ BitVec 64))) (size!11803 (_ BitVec 32))) )
))
(declare-fun lt!187721 () array!24003)

(declare-datatypes ((List!6646 0))(
  ( (Nil!6643) (Cons!6642 (h!7498 (_ BitVec 64)) (t!11820 List!6646)) )
))
(declare-fun arrayNoDuplicates!0 (array!24003 (_ BitVec 32) List!6646) Bool)

(assert (=> b!400667 (= res!230543 (arrayNoDuplicates!0 lt!187721 #b00000000000000000000000000000000 Nil!6643))))

(declare-fun b!400668 () Bool)

(declare-fun res!230551 () Bool)

(assert (=> b!400668 (=> (not res!230551) (not e!241739))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24003)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400668 (= res!230551 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11803 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400670 () Bool)

(declare-fun res!230542 () Bool)

(declare-fun e!241735 () Bool)

(assert (=> b!400670 (=> (not res!230542) (not e!241735))))

(assert (=> b!400670 (= res!230542 (or (= (select (arr!11451 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11451 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16692 () Bool)

(declare-fun mapRes!16692 () Bool)

(declare-fun tp!32619 () Bool)

(assert (=> mapNonEmpty!16692 (= mapRes!16692 (and tp!32619 e!241736))))

(declare-fun mapKey!16692 () (_ BitVec 32))

(declare-datatypes ((V!14501 0))(
  ( (V!14502 (val!5068 Int)) )
))
(declare-datatypes ((ValueCell!4680 0))(
  ( (ValueCellFull!4680 (v!7315 V!14501)) (EmptyCell!4680) )
))
(declare-datatypes ((array!24005 0))(
  ( (array!24006 (arr!11452 (Array (_ BitVec 32) ValueCell!4680)) (size!11804 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24005)

(declare-fun mapValue!16692 () ValueCell!4680)

(declare-fun mapRest!16692 () (Array (_ BitVec 32) ValueCell!4680))

(assert (=> mapNonEmpty!16692 (= (arr!11452 _values!549) (store mapRest!16692 mapKey!16692 mapValue!16692))))

(declare-fun b!400671 () Bool)

(declare-fun e!241738 () Bool)

(declare-datatypes ((tuple2!6724 0))(
  ( (tuple2!6725 (_1!3373 (_ BitVec 64)) (_2!3373 V!14501)) )
))
(declare-datatypes ((List!6647 0))(
  ( (Nil!6644) (Cons!6643 (h!7499 tuple2!6724) (t!11821 List!6647)) )
))
(declare-datatypes ((ListLongMap!5637 0))(
  ( (ListLongMap!5638 (toList!2834 List!6647)) )
))
(declare-fun call!28159 () ListLongMap!5637)

(declare-fun call!28160 () ListLongMap!5637)

(assert (=> b!400671 (= e!241738 (= call!28159 call!28160))))

(declare-fun b!400672 () Bool)

(assert (=> b!400672 (= e!241735 e!241739)))

(declare-fun res!230548 () Bool)

(assert (=> b!400672 (=> (not res!230548) (not e!241739))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24003 (_ BitVec 32)) Bool)

(assert (=> b!400672 (= res!230548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187721 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!400672 (= lt!187721 (array!24004 (store (arr!11451 _keys!709) i!563 k0!794) (size!11803 _keys!709)))))

(declare-fun mapIsEmpty!16692 () Bool)

(assert (=> mapIsEmpty!16692 mapRes!16692))

(declare-fun b!400673 () Bool)

(declare-fun v!412 () V!14501)

(declare-fun +!1119 (ListLongMap!5637 tuple2!6724) ListLongMap!5637)

(assert (=> b!400673 (= e!241738 (= call!28160 (+!1119 call!28159 (tuple2!6725 k0!794 v!412))))))

(declare-fun b!400674 () Bool)

(declare-fun e!241740 () Bool)

(assert (=> b!400674 (= e!241740 tp_is_empty!10047)))

(declare-fun minValue!515 () V!14501)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14501)

(declare-fun bm!28156 () Bool)

(declare-fun c!54704 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1047 (array!24003 array!24005 (_ BitVec 32) (_ BitVec 32) V!14501 V!14501 (_ BitVec 32) Int) ListLongMap!5637)

(assert (=> bm!28156 (= call!28159 (getCurrentListMapNoExtraKeys!1047 (ite c!54704 _keys!709 lt!187721) (ite c!54704 _values!549 (array!24006 (store (arr!11452 _values!549) i!563 (ValueCellFull!4680 v!412)) (size!11804 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400675 () Bool)

(assert (=> b!400675 (= e!241739 (not true))))

(assert (=> b!400675 e!241738))

(assert (=> b!400675 (= c!54704 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12136 0))(
  ( (Unit!12137) )
))
(declare-fun lt!187720 () Unit!12136)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!326 (array!24003 array!24005 (_ BitVec 32) (_ BitVec 32) V!14501 V!14501 (_ BitVec 32) (_ BitVec 64) V!14501 (_ BitVec 32) Int) Unit!12136)

(assert (=> b!400675 (= lt!187720 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400676 () Bool)

(declare-fun res!230547 () Bool)

(assert (=> b!400676 (=> (not res!230547) (not e!241735))))

(assert (=> b!400676 (= res!230547 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11803 _keys!709))))))

(declare-fun b!400677 () Bool)

(declare-fun res!230553 () Bool)

(assert (=> b!400677 (=> (not res!230553) (not e!241735))))

(assert (=> b!400677 (= res!230553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400669 () Bool)

(declare-fun res!230552 () Bool)

(assert (=> b!400669 (=> (not res!230552) (not e!241735))))

(declare-fun arrayContainsKey!0 (array!24003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400669 (= res!230552 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!230550 () Bool)

(assert (=> start!38628 (=> (not res!230550) (not e!241735))))

(assert (=> start!38628 (= res!230550 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11803 _keys!709))))))

(assert (=> start!38628 e!241735))

(assert (=> start!38628 tp_is_empty!10047))

(assert (=> start!38628 tp!32618))

(assert (=> start!38628 true))

(declare-fun e!241734 () Bool)

(declare-fun array_inv!8386 (array!24005) Bool)

(assert (=> start!38628 (and (array_inv!8386 _values!549) e!241734)))

(declare-fun array_inv!8387 (array!24003) Bool)

(assert (=> start!38628 (array_inv!8387 _keys!709)))

(declare-fun bm!28157 () Bool)

(assert (=> bm!28157 (= call!28160 (getCurrentListMapNoExtraKeys!1047 (ite c!54704 lt!187721 _keys!709) (ite c!54704 (array!24006 (store (arr!11452 _values!549) i!563 (ValueCellFull!4680 v!412)) (size!11804 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400678 () Bool)

(declare-fun res!230545 () Bool)

(assert (=> b!400678 (=> (not res!230545) (not e!241735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400678 (= res!230545 (validKeyInArray!0 k0!794))))

(declare-fun b!400679 () Bool)

(declare-fun res!230544 () Bool)

(assert (=> b!400679 (=> (not res!230544) (not e!241735))))

(assert (=> b!400679 (= res!230544 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6643))))

(declare-fun b!400680 () Bool)

(declare-fun res!230549 () Bool)

(assert (=> b!400680 (=> (not res!230549) (not e!241735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400680 (= res!230549 (validMask!0 mask!1025))))

(declare-fun b!400681 () Bool)

(assert (=> b!400681 (= e!241734 (and e!241740 mapRes!16692))))

(declare-fun condMapEmpty!16692 () Bool)

(declare-fun mapDefault!16692 () ValueCell!4680)

(assert (=> b!400681 (= condMapEmpty!16692 (= (arr!11452 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4680)) mapDefault!16692)))))

(declare-fun b!400682 () Bool)

(declare-fun res!230546 () Bool)

(assert (=> b!400682 (=> (not res!230546) (not e!241735))))

(assert (=> b!400682 (= res!230546 (and (= (size!11804 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11803 _keys!709) (size!11804 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38628 res!230550) b!400680))

(assert (= (and b!400680 res!230549) b!400682))

(assert (= (and b!400682 res!230546) b!400677))

(assert (= (and b!400677 res!230553) b!400679))

(assert (= (and b!400679 res!230544) b!400676))

(assert (= (and b!400676 res!230547) b!400678))

(assert (= (and b!400678 res!230545) b!400670))

(assert (= (and b!400670 res!230542) b!400669))

(assert (= (and b!400669 res!230552) b!400672))

(assert (= (and b!400672 res!230548) b!400667))

(assert (= (and b!400667 res!230543) b!400668))

(assert (= (and b!400668 res!230551) b!400675))

(assert (= (and b!400675 c!54704) b!400673))

(assert (= (and b!400675 (not c!54704)) b!400671))

(assert (= (or b!400673 b!400671) bm!28157))

(assert (= (or b!400673 b!400671) bm!28156))

(assert (= (and b!400681 condMapEmpty!16692) mapIsEmpty!16692))

(assert (= (and b!400681 (not condMapEmpty!16692)) mapNonEmpty!16692))

(get-info :version)

(assert (= (and mapNonEmpty!16692 ((_ is ValueCellFull!4680) mapValue!16692)) b!400666))

(assert (= (and b!400681 ((_ is ValueCellFull!4680) mapDefault!16692)) b!400674))

(assert (= start!38628 b!400681))

(declare-fun m!394781 () Bool)

(assert (=> b!400673 m!394781))

(declare-fun m!394783 () Bool)

(assert (=> mapNonEmpty!16692 m!394783))

(declare-fun m!394785 () Bool)

(assert (=> b!400675 m!394785))

(declare-fun m!394787 () Bool)

(assert (=> b!400669 m!394787))

(declare-fun m!394789 () Bool)

(assert (=> b!400672 m!394789))

(declare-fun m!394791 () Bool)

(assert (=> b!400672 m!394791))

(declare-fun m!394793 () Bool)

(assert (=> b!400677 m!394793))

(declare-fun m!394795 () Bool)

(assert (=> start!38628 m!394795))

(declare-fun m!394797 () Bool)

(assert (=> start!38628 m!394797))

(declare-fun m!394799 () Bool)

(assert (=> b!400679 m!394799))

(declare-fun m!394801 () Bool)

(assert (=> bm!28157 m!394801))

(declare-fun m!394803 () Bool)

(assert (=> bm!28157 m!394803))

(declare-fun m!394805 () Bool)

(assert (=> b!400667 m!394805))

(declare-fun m!394807 () Bool)

(assert (=> b!400678 m!394807))

(declare-fun m!394809 () Bool)

(assert (=> b!400670 m!394809))

(assert (=> bm!28156 m!394801))

(declare-fun m!394811 () Bool)

(assert (=> bm!28156 m!394811))

(declare-fun m!394813 () Bool)

(assert (=> b!400680 m!394813))

(check-sat (not start!38628) b_and!16551 (not b!400673) (not b_next!9165) tp_is_empty!10047 (not bm!28157) (not b!400680) (not b!400669) (not bm!28156) (not b!400678) (not b!400667) (not b!400679) (not b!400672) (not b!400677) (not mapNonEmpty!16692) (not b!400675))
(check-sat b_and!16551 (not b_next!9165))
