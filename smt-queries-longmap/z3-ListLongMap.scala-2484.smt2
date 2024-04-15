; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38708 () Bool)

(assert start!38708)

(declare-fun b_free!9259 () Bool)

(declare-fun b_next!9259 () Bool)

(assert (=> start!38708 (= b_free!9259 (not b_next!9259))))

(declare-fun tp!32901 () Bool)

(declare-fun b_and!16619 () Bool)

(assert (=> start!38708 (= tp!32901 b_and!16619)))

(declare-fun b!402792 () Bool)

(declare-fun res!232113 () Bool)

(declare-fun e!242550 () Bool)

(assert (=> b!402792 (=> (not res!232113) (not e!242550))))

(declare-datatypes ((array!24163 0))(
  ( (array!24164 (arr!11531 (Array (_ BitVec 32) (_ BitVec 64))) (size!11884 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24163)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402792 (= res!232113 (or (= (select (arr!11531 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11531 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402793 () Bool)

(declare-fun e!242553 () Bool)

(assert (=> b!402793 (= e!242553 (not true))))

(declare-fun e!242547 () Bool)

(assert (=> b!402793 e!242547))

(declare-fun c!54774 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402793 (= c!54774 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14627 0))(
  ( (V!14628 (val!5115 Int)) )
))
(declare-fun minValue!515 () V!14627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4727 0))(
  ( (ValueCellFull!4727 (v!7356 V!14627)) (EmptyCell!4727) )
))
(declare-datatypes ((array!24165 0))(
  ( (array!24166 (arr!11532 (Array (_ BitVec 32) ValueCell!4727)) (size!11885 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24165)

(declare-fun zeroValue!515 () V!14627)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12164 0))(
  ( (Unit!12165) )
))
(declare-fun lt!187768 () Unit!12164)

(declare-fun v!412 () V!14627)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!345 (array!24163 array!24165 (_ BitVec 32) (_ BitVec 32) V!14627 V!14627 (_ BitVec 32) (_ BitVec 64) V!14627 (_ BitVec 32) Int) Unit!12164)

(assert (=> b!402793 (= lt!187768 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!345 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402794 () Bool)

(declare-datatypes ((tuple2!6778 0))(
  ( (tuple2!6779 (_1!3400 (_ BitVec 64)) (_2!3400 V!14627)) )
))
(declare-datatypes ((List!6682 0))(
  ( (Nil!6679) (Cons!6678 (h!7534 tuple2!6778) (t!11847 List!6682)) )
))
(declare-datatypes ((ListLongMap!5681 0))(
  ( (ListLongMap!5682 (toList!2856 List!6682)) )
))
(declare-fun call!28417 () ListLongMap!5681)

(declare-fun call!28416 () ListLongMap!5681)

(declare-fun +!1159 (ListLongMap!5681 tuple2!6778) ListLongMap!5681)

(assert (=> b!402794 (= e!242547 (= call!28417 (+!1159 call!28416 (tuple2!6779 k0!794 v!412))))))

(declare-fun b!402795 () Bool)

(declare-fun res!232116 () Bool)

(assert (=> b!402795 (=> (not res!232116) (not e!242550))))

(assert (=> b!402795 (= res!232116 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11884 _keys!709))))))

(declare-fun lt!187769 () array!24163)

(declare-fun bm!28413 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1072 (array!24163 array!24165 (_ BitVec 32) (_ BitVec 32) V!14627 V!14627 (_ BitVec 32) Int) ListLongMap!5681)

(assert (=> bm!28413 (= call!28416 (getCurrentListMapNoExtraKeys!1072 (ite c!54774 _keys!709 lt!187769) (ite c!54774 _values!549 (array!24166 (store (arr!11532 _values!549) i!563 (ValueCellFull!4727 v!412)) (size!11885 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!232111 () Bool)

(assert (=> start!38708 (=> (not res!232111) (not e!242550))))

(assert (=> start!38708 (= res!232111 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11884 _keys!709))))))

(assert (=> start!38708 e!242550))

(declare-fun tp_is_empty!10141 () Bool)

(assert (=> start!38708 tp_is_empty!10141))

(assert (=> start!38708 tp!32901))

(assert (=> start!38708 true))

(declare-fun e!242551 () Bool)

(declare-fun array_inv!8454 (array!24165) Bool)

(assert (=> start!38708 (and (array_inv!8454 _values!549) e!242551)))

(declare-fun array_inv!8455 (array!24163) Bool)

(assert (=> start!38708 (array_inv!8455 _keys!709)))

(declare-fun b!402796 () Bool)

(declare-fun e!242549 () Bool)

(assert (=> b!402796 (= e!242549 tp_is_empty!10141)))

(declare-fun b!402797 () Bool)

(declare-fun mapRes!16833 () Bool)

(assert (=> b!402797 (= e!242551 (and e!242549 mapRes!16833))))

(declare-fun condMapEmpty!16833 () Bool)

(declare-fun mapDefault!16833 () ValueCell!4727)

(assert (=> b!402797 (= condMapEmpty!16833 (= (arr!11532 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4727)) mapDefault!16833)))))

(declare-fun b!402798 () Bool)

(assert (=> b!402798 (= e!242550 e!242553)))

(declare-fun res!232108 () Bool)

(assert (=> b!402798 (=> (not res!232108) (not e!242553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24163 (_ BitVec 32)) Bool)

(assert (=> b!402798 (= res!232108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187769 mask!1025))))

(assert (=> b!402798 (= lt!187769 (array!24164 (store (arr!11531 _keys!709) i!563 k0!794) (size!11884 _keys!709)))))

(declare-fun b!402799 () Bool)

(declare-fun res!232105 () Bool)

(assert (=> b!402799 (=> (not res!232105) (not e!242550))))

(assert (=> b!402799 (= res!232105 (and (= (size!11885 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11884 _keys!709) (size!11885 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402800 () Bool)

(declare-fun res!232112 () Bool)

(assert (=> b!402800 (=> (not res!232112) (not e!242553))))

(assert (=> b!402800 (= res!232112 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11884 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16833 () Bool)

(assert (=> mapIsEmpty!16833 mapRes!16833))

(declare-fun b!402801 () Bool)

(declare-fun res!232110 () Bool)

(assert (=> b!402801 (=> (not res!232110) (not e!242550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402801 (= res!232110 (validKeyInArray!0 k0!794))))

(declare-fun b!402802 () Bool)

(declare-fun res!232109 () Bool)

(assert (=> b!402802 (=> (not res!232109) (not e!242550))))

(declare-fun arrayContainsKey!0 (array!24163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402802 (= res!232109 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28414 () Bool)

(assert (=> bm!28414 (= call!28417 (getCurrentListMapNoExtraKeys!1072 (ite c!54774 lt!187769 _keys!709) (ite c!54774 (array!24166 (store (arr!11532 _values!549) i!563 (ValueCellFull!4727 v!412)) (size!11885 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402803 () Bool)

(assert (=> b!402803 (= e!242547 (= call!28416 call!28417))))

(declare-fun b!402804 () Bool)

(declare-fun res!232114 () Bool)

(assert (=> b!402804 (=> (not res!232114) (not e!242550))))

(assert (=> b!402804 (= res!232114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402805 () Bool)

(declare-fun e!242548 () Bool)

(assert (=> b!402805 (= e!242548 tp_is_empty!10141)))

(declare-fun mapNonEmpty!16833 () Bool)

(declare-fun tp!32900 () Bool)

(assert (=> mapNonEmpty!16833 (= mapRes!16833 (and tp!32900 e!242548))))

(declare-fun mapValue!16833 () ValueCell!4727)

(declare-fun mapKey!16833 () (_ BitVec 32))

(declare-fun mapRest!16833 () (Array (_ BitVec 32) ValueCell!4727))

(assert (=> mapNonEmpty!16833 (= (arr!11532 _values!549) (store mapRest!16833 mapKey!16833 mapValue!16833))))

(declare-fun b!402806 () Bool)

(declare-fun res!232106 () Bool)

(assert (=> b!402806 (=> (not res!232106) (not e!242553))))

(declare-datatypes ((List!6683 0))(
  ( (Nil!6680) (Cons!6679 (h!7535 (_ BitVec 64)) (t!11848 List!6683)) )
))
(declare-fun arrayNoDuplicates!0 (array!24163 (_ BitVec 32) List!6683) Bool)

(assert (=> b!402806 (= res!232106 (arrayNoDuplicates!0 lt!187769 #b00000000000000000000000000000000 Nil!6680))))

(declare-fun b!402807 () Bool)

(declare-fun res!232115 () Bool)

(assert (=> b!402807 (=> (not res!232115) (not e!242550))))

(assert (=> b!402807 (= res!232115 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6680))))

(declare-fun b!402808 () Bool)

(declare-fun res!232107 () Bool)

(assert (=> b!402808 (=> (not res!232107) (not e!242550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402808 (= res!232107 (validMask!0 mask!1025))))

(assert (= (and start!38708 res!232111) b!402808))

(assert (= (and b!402808 res!232107) b!402799))

(assert (= (and b!402799 res!232105) b!402804))

(assert (= (and b!402804 res!232114) b!402807))

(assert (= (and b!402807 res!232115) b!402795))

(assert (= (and b!402795 res!232116) b!402801))

(assert (= (and b!402801 res!232110) b!402792))

(assert (= (and b!402792 res!232113) b!402802))

(assert (= (and b!402802 res!232109) b!402798))

(assert (= (and b!402798 res!232108) b!402806))

(assert (= (and b!402806 res!232106) b!402800))

(assert (= (and b!402800 res!232112) b!402793))

(assert (= (and b!402793 c!54774) b!402794))

(assert (= (and b!402793 (not c!54774)) b!402803))

(assert (= (or b!402794 b!402803) bm!28414))

(assert (= (or b!402794 b!402803) bm!28413))

(assert (= (and b!402797 condMapEmpty!16833) mapIsEmpty!16833))

(assert (= (and b!402797 (not condMapEmpty!16833)) mapNonEmpty!16833))

(get-info :version)

(assert (= (and mapNonEmpty!16833 ((_ is ValueCellFull!4727) mapValue!16833)) b!402805))

(assert (= (and b!402797 ((_ is ValueCellFull!4727) mapDefault!16833)) b!402796))

(assert (= start!38708 b!402797))

(declare-fun m!395655 () Bool)

(assert (=> b!402792 m!395655))

(declare-fun m!395657 () Bool)

(assert (=> b!402808 m!395657))

(declare-fun m!395659 () Bool)

(assert (=> b!402793 m!395659))

(declare-fun m!395661 () Bool)

(assert (=> b!402801 m!395661))

(declare-fun m!395663 () Bool)

(assert (=> b!402806 m!395663))

(declare-fun m!395665 () Bool)

(assert (=> start!38708 m!395665))

(declare-fun m!395667 () Bool)

(assert (=> start!38708 m!395667))

(declare-fun m!395669 () Bool)

(assert (=> b!402807 m!395669))

(declare-fun m!395671 () Bool)

(assert (=> b!402802 m!395671))

(declare-fun m!395673 () Bool)

(assert (=> bm!28414 m!395673))

(declare-fun m!395675 () Bool)

(assert (=> bm!28414 m!395675))

(assert (=> bm!28413 m!395673))

(declare-fun m!395677 () Bool)

(assert (=> bm!28413 m!395677))

(declare-fun m!395679 () Bool)

(assert (=> mapNonEmpty!16833 m!395679))

(declare-fun m!395681 () Bool)

(assert (=> b!402794 m!395681))

(declare-fun m!395683 () Bool)

(assert (=> b!402798 m!395683))

(declare-fun m!395685 () Bool)

(assert (=> b!402798 m!395685))

(declare-fun m!395687 () Bool)

(assert (=> b!402804 m!395687))

(check-sat b_and!16619 (not bm!28413) (not b!402798) (not b!402801) (not b!402806) (not mapNonEmpty!16833) (not b!402802) (not b!402793) (not b!402807) (not bm!28414) (not b!402794) tp_is_empty!10141 (not b_next!9259) (not b!402808) (not b!402804) (not start!38708))
(check-sat b_and!16619 (not b_next!9259))
