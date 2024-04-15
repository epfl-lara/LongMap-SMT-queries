; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38624 () Bool)

(assert start!38624)

(declare-fun b_free!9175 () Bool)

(declare-fun b_next!9175 () Bool)

(assert (=> start!38624 (= b_free!9175 (not b_next!9175))))

(declare-fun tp!32649 () Bool)

(declare-fun b_and!16535 () Bool)

(assert (=> start!38624 (= tp!32649 b_and!16535)))

(declare-fun res!230597 () Bool)

(declare-fun e!241668 () Bool)

(assert (=> start!38624 (=> (not res!230597) (not e!241668))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24001 0))(
  ( (array!24002 (arr!11450 (Array (_ BitVec 32) (_ BitVec 64))) (size!11803 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24001)

(assert (=> start!38624 (= res!230597 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11803 _keys!709))))))

(assert (=> start!38624 e!241668))

(declare-fun tp_is_empty!10057 () Bool)

(assert (=> start!38624 tp_is_empty!10057))

(assert (=> start!38624 tp!32649))

(assert (=> start!38624 true))

(declare-datatypes ((V!14515 0))(
  ( (V!14516 (val!5073 Int)) )
))
(declare-datatypes ((ValueCell!4685 0))(
  ( (ValueCellFull!4685 (v!7314 V!14515)) (EmptyCell!4685) )
))
(declare-datatypes ((array!24003 0))(
  ( (array!24004 (arr!11451 (Array (_ BitVec 32) ValueCell!4685)) (size!11804 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24003)

(declare-fun e!241671 () Bool)

(declare-fun array_inv!8400 (array!24003) Bool)

(assert (=> start!38624 (and (array_inv!8400 _values!549) e!241671)))

(declare-fun array_inv!8401 (array!24001) Bool)

(assert (=> start!38624 (array_inv!8401 _keys!709)))

(declare-fun b!400650 () Bool)

(declare-fun e!241669 () Bool)

(assert (=> b!400650 (= e!241669 tp_is_empty!10057)))

(declare-fun b!400651 () Bool)

(declare-fun e!241665 () Bool)

(assert (=> b!400651 (= e!241665 tp_is_empty!10057)))

(declare-fun b!400652 () Bool)

(declare-datatypes ((tuple2!6706 0))(
  ( (tuple2!6707 (_1!3364 (_ BitVec 64)) (_2!3364 V!14515)) )
))
(declare-datatypes ((List!6612 0))(
  ( (Nil!6609) (Cons!6608 (h!7464 tuple2!6706) (t!11777 List!6612)) )
))
(declare-datatypes ((ListLongMap!5609 0))(
  ( (ListLongMap!5610 (toList!2820 List!6612)) )
))
(declare-fun call!28164 () ListLongMap!5609)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!241666 () Bool)

(declare-fun v!412 () V!14515)

(declare-fun call!28165 () ListLongMap!5609)

(declare-fun +!1128 (ListLongMap!5609 tuple2!6706) ListLongMap!5609)

(assert (=> b!400652 (= e!241666 (= call!28165 (+!1128 call!28164 (tuple2!6707 k0!794 v!412))))))

(declare-fun b!400653 () Bool)

(declare-fun e!241667 () Bool)

(assert (=> b!400653 (= e!241667 (not true))))

(assert (=> b!400653 e!241666))

(declare-fun c!54648 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400653 (= c!54648 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14515)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14515)

(declare-datatypes ((Unit!12114 0))(
  ( (Unit!12115) )
))
(declare-fun lt!187516 () Unit!12114)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!320 (array!24001 array!24003 (_ BitVec 32) (_ BitVec 32) V!14515 V!14515 (_ BitVec 32) (_ BitVec 64) V!14515 (_ BitVec 32) Int) Unit!12114)

(assert (=> b!400653 (= lt!187516 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!320 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16707 () Bool)

(declare-fun mapRes!16707 () Bool)

(declare-fun tp!32648 () Bool)

(assert (=> mapNonEmpty!16707 (= mapRes!16707 (and tp!32648 e!241665))))

(declare-fun mapKey!16707 () (_ BitVec 32))

(declare-fun mapRest!16707 () (Array (_ BitVec 32) ValueCell!4685))

(declare-fun mapValue!16707 () ValueCell!4685)

(assert (=> mapNonEmpty!16707 (= (arr!11451 _values!549) (store mapRest!16707 mapKey!16707 mapValue!16707))))

(declare-fun b!400654 () Bool)

(declare-fun res!230603 () Bool)

(assert (=> b!400654 (=> (not res!230603) (not e!241668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400654 (= res!230603 (validMask!0 mask!1025))))

(declare-fun b!400655 () Bool)

(assert (=> b!400655 (= e!241668 e!241667)))

(declare-fun res!230593 () Bool)

(assert (=> b!400655 (=> (not res!230593) (not e!241667))))

(declare-fun lt!187517 () array!24001)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24001 (_ BitVec 32)) Bool)

(assert (=> b!400655 (= res!230593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187517 mask!1025))))

(assert (=> b!400655 (= lt!187517 (array!24002 (store (arr!11450 _keys!709) i!563 k0!794) (size!11803 _keys!709)))))

(declare-fun b!400656 () Bool)

(declare-fun res!230595 () Bool)

(assert (=> b!400656 (=> (not res!230595) (not e!241668))))

(assert (=> b!400656 (= res!230595 (or (= (select (arr!11450 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11450 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400657 () Bool)

(assert (=> b!400657 (= e!241671 (and e!241669 mapRes!16707))))

(declare-fun condMapEmpty!16707 () Bool)

(declare-fun mapDefault!16707 () ValueCell!4685)

(assert (=> b!400657 (= condMapEmpty!16707 (= (arr!11451 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4685)) mapDefault!16707)))))

(declare-fun b!400658 () Bool)

(declare-fun res!230600 () Bool)

(assert (=> b!400658 (=> (not res!230600) (not e!241668))))

(assert (=> b!400658 (= res!230600 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11803 _keys!709))))))

(declare-fun mapIsEmpty!16707 () Bool)

(assert (=> mapIsEmpty!16707 mapRes!16707))

(declare-fun b!400659 () Bool)

(declare-fun res!230602 () Bool)

(assert (=> b!400659 (=> (not res!230602) (not e!241668))))

(declare-fun arrayContainsKey!0 (array!24001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400659 (= res!230602 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400660 () Bool)

(declare-fun res!230594 () Bool)

(assert (=> b!400660 (=> (not res!230594) (not e!241668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400660 (= res!230594 (validKeyInArray!0 k0!794))))

(declare-fun b!400661 () Bool)

(declare-fun res!230599 () Bool)

(assert (=> b!400661 (=> (not res!230599) (not e!241668))))

(assert (=> b!400661 (= res!230599 (and (= (size!11804 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11803 _keys!709) (size!11804 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400662 () Bool)

(assert (=> b!400662 (= e!241666 (= call!28164 call!28165))))

(declare-fun b!400663 () Bool)

(declare-fun res!230604 () Bool)

(assert (=> b!400663 (=> (not res!230604) (not e!241667))))

(declare-datatypes ((List!6613 0))(
  ( (Nil!6610) (Cons!6609 (h!7465 (_ BitVec 64)) (t!11778 List!6613)) )
))
(declare-fun arrayNoDuplicates!0 (array!24001 (_ BitVec 32) List!6613) Bool)

(assert (=> b!400663 (= res!230604 (arrayNoDuplicates!0 lt!187517 #b00000000000000000000000000000000 Nil!6610))))

(declare-fun bm!28161 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1038 (array!24001 array!24003 (_ BitVec 32) (_ BitVec 32) V!14515 V!14515 (_ BitVec 32) Int) ListLongMap!5609)

(assert (=> bm!28161 (= call!28164 (getCurrentListMapNoExtraKeys!1038 (ite c!54648 _keys!709 lt!187517) (ite c!54648 _values!549 (array!24004 (store (arr!11451 _values!549) i!563 (ValueCellFull!4685 v!412)) (size!11804 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400664 () Bool)

(declare-fun res!230601 () Bool)

(assert (=> b!400664 (=> (not res!230601) (not e!241667))))

(assert (=> b!400664 (= res!230601 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11803 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400665 () Bool)

(declare-fun res!230596 () Bool)

(assert (=> b!400665 (=> (not res!230596) (not e!241668))))

(assert (=> b!400665 (= res!230596 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6610))))

(declare-fun bm!28162 () Bool)

(assert (=> bm!28162 (= call!28165 (getCurrentListMapNoExtraKeys!1038 (ite c!54648 lt!187517 _keys!709) (ite c!54648 (array!24004 (store (arr!11451 _values!549) i!563 (ValueCellFull!4685 v!412)) (size!11804 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400666 () Bool)

(declare-fun res!230598 () Bool)

(assert (=> b!400666 (=> (not res!230598) (not e!241668))))

(assert (=> b!400666 (= res!230598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38624 res!230597) b!400654))

(assert (= (and b!400654 res!230603) b!400661))

(assert (= (and b!400661 res!230599) b!400666))

(assert (= (and b!400666 res!230598) b!400665))

(assert (= (and b!400665 res!230596) b!400658))

(assert (= (and b!400658 res!230600) b!400660))

(assert (= (and b!400660 res!230594) b!400656))

(assert (= (and b!400656 res!230595) b!400659))

(assert (= (and b!400659 res!230602) b!400655))

(assert (= (and b!400655 res!230593) b!400663))

(assert (= (and b!400663 res!230604) b!400664))

(assert (= (and b!400664 res!230601) b!400653))

(assert (= (and b!400653 c!54648) b!400652))

(assert (= (and b!400653 (not c!54648)) b!400662))

(assert (= (or b!400652 b!400662) bm!28162))

(assert (= (or b!400652 b!400662) bm!28161))

(assert (= (and b!400657 condMapEmpty!16707) mapIsEmpty!16707))

(assert (= (and b!400657 (not condMapEmpty!16707)) mapNonEmpty!16707))

(get-info :version)

(assert (= (and mapNonEmpty!16707 ((_ is ValueCellFull!4685) mapValue!16707)) b!400651))

(assert (= (and b!400657 ((_ is ValueCellFull!4685) mapDefault!16707)) b!400650))

(assert (= start!38624 b!400657))

(declare-fun m!394227 () Bool)

(assert (=> b!400663 m!394227))

(declare-fun m!394229 () Bool)

(assert (=> b!400660 m!394229))

(declare-fun m!394231 () Bool)

(assert (=> start!38624 m!394231))

(declare-fun m!394233 () Bool)

(assert (=> start!38624 m!394233))

(declare-fun m!394235 () Bool)

(assert (=> b!400654 m!394235))

(declare-fun m!394237 () Bool)

(assert (=> b!400666 m!394237))

(declare-fun m!394239 () Bool)

(assert (=> mapNonEmpty!16707 m!394239))

(declare-fun m!394241 () Bool)

(assert (=> b!400655 m!394241))

(declare-fun m!394243 () Bool)

(assert (=> b!400655 m!394243))

(declare-fun m!394245 () Bool)

(assert (=> b!400656 m!394245))

(declare-fun m!394247 () Bool)

(assert (=> bm!28161 m!394247))

(declare-fun m!394249 () Bool)

(assert (=> bm!28161 m!394249))

(declare-fun m!394251 () Bool)

(assert (=> b!400653 m!394251))

(declare-fun m!394253 () Bool)

(assert (=> b!400665 m!394253))

(declare-fun m!394255 () Bool)

(assert (=> b!400652 m!394255))

(assert (=> bm!28162 m!394247))

(declare-fun m!394257 () Bool)

(assert (=> bm!28162 m!394257))

(declare-fun m!394259 () Bool)

(assert (=> b!400659 m!394259))

(check-sat (not start!38624) (not b!400665) (not b!400652) (not b!400666) (not bm!28162) (not bm!28161) (not b!400659) (not b!400663) (not b!400653) tp_is_empty!10057 (not b!400654) (not b!400655) (not b!400660) (not b_next!9175) (not mapNonEmpty!16707) b_and!16535)
(check-sat b_and!16535 (not b_next!9175))
