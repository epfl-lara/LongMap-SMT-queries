; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38634 () Bool)

(assert start!38634)

(declare-fun b_free!9171 () Bool)

(declare-fun b_next!9171 () Bool)

(assert (=> start!38634 (= b_free!9171 (not b_next!9171))))

(declare-fun tp!32637 () Bool)

(declare-fun b_and!16557 () Bool)

(assert (=> start!38634 (= tp!32637 b_and!16557)))

(declare-fun b!400819 () Bool)

(declare-fun res!230654 () Bool)

(declare-fun e!241802 () Bool)

(assert (=> b!400819 (=> (not res!230654) (not e!241802))))

(declare-datatypes ((array!24015 0))(
  ( (array!24016 (arr!11457 (Array (_ BitVec 32) (_ BitVec 64))) (size!11809 (_ BitVec 32))) )
))
(declare-fun lt!187739 () array!24015)

(declare-datatypes ((List!6649 0))(
  ( (Nil!6646) (Cons!6645 (h!7501 (_ BitVec 64)) (t!11823 List!6649)) )
))
(declare-fun arrayNoDuplicates!0 (array!24015 (_ BitVec 32) List!6649) Bool)

(assert (=> b!400819 (= res!230654 (arrayNoDuplicates!0 lt!187739 #b00000000000000000000000000000000 Nil!6646))))

(declare-fun mapNonEmpty!16701 () Bool)

(declare-fun mapRes!16701 () Bool)

(declare-fun tp!32636 () Bool)

(declare-fun e!241798 () Bool)

(assert (=> mapNonEmpty!16701 (= mapRes!16701 (and tp!32636 e!241798))))

(declare-datatypes ((V!14509 0))(
  ( (V!14510 (val!5071 Int)) )
))
(declare-datatypes ((ValueCell!4683 0))(
  ( (ValueCellFull!4683 (v!7318 V!14509)) (EmptyCell!4683) )
))
(declare-fun mapValue!16701 () ValueCell!4683)

(declare-datatypes ((array!24017 0))(
  ( (array!24018 (arr!11458 (Array (_ BitVec 32) ValueCell!4683)) (size!11810 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24017)

(declare-fun mapKey!16701 () (_ BitVec 32))

(declare-fun mapRest!16701 () (Array (_ BitVec 32) ValueCell!4683))

(assert (=> mapNonEmpty!16701 (= (arr!11458 _values!549) (store mapRest!16701 mapKey!16701 mapValue!16701))))

(declare-fun res!230651 () Bool)

(declare-fun e!241801 () Bool)

(assert (=> start!38634 (=> (not res!230651) (not e!241801))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!24015)

(assert (=> start!38634 (= res!230651 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11809 _keys!709))))))

(assert (=> start!38634 e!241801))

(declare-fun tp_is_empty!10053 () Bool)

(assert (=> start!38634 tp_is_empty!10053))

(assert (=> start!38634 tp!32637))

(assert (=> start!38634 true))

(declare-fun e!241797 () Bool)

(declare-fun array_inv!8388 (array!24017) Bool)

(assert (=> start!38634 (and (array_inv!8388 _values!549) e!241797)))

(declare-fun array_inv!8389 (array!24015) Bool)

(assert (=> start!38634 (array_inv!8389 _keys!709)))

(declare-fun e!241800 () Bool)

(declare-fun b!400820 () Bool)

(declare-datatypes ((tuple2!6726 0))(
  ( (tuple2!6727 (_1!3374 (_ BitVec 64)) (_2!3374 V!14509)) )
))
(declare-datatypes ((List!6650 0))(
  ( (Nil!6647) (Cons!6646 (h!7502 tuple2!6726) (t!11824 List!6650)) )
))
(declare-datatypes ((ListLongMap!5639 0))(
  ( (ListLongMap!5640 (toList!2835 List!6650)) )
))
(declare-fun call!28177 () ListLongMap!5639)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14509)

(declare-fun call!28178 () ListLongMap!5639)

(declare-fun +!1120 (ListLongMap!5639 tuple2!6726) ListLongMap!5639)

(assert (=> b!400820 (= e!241800 (= call!28177 (+!1120 call!28178 (tuple2!6727 k0!794 v!412))))))

(declare-fun b!400821 () Bool)

(declare-fun res!230650 () Bool)

(assert (=> b!400821 (=> (not res!230650) (not e!241801))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24015 (_ BitVec 32)) Bool)

(assert (=> b!400821 (= res!230650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400822 () Bool)

(declare-fun e!241799 () Bool)

(assert (=> b!400822 (= e!241799 tp_is_empty!10053)))

(declare-fun b!400823 () Bool)

(declare-fun res!230659 () Bool)

(assert (=> b!400823 (=> (not res!230659) (not e!241801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400823 (= res!230659 (validMask!0 mask!1025))))

(declare-fun b!400824 () Bool)

(declare-fun res!230652 () Bool)

(assert (=> b!400824 (=> (not res!230652) (not e!241801))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400824 (= res!230652 (or (= (select (arr!11457 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11457 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400825 () Bool)

(assert (=> b!400825 (= e!241802 (not true))))

(assert (=> b!400825 e!241800))

(declare-fun c!54713 () Bool)

(assert (=> b!400825 (= c!54713 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14509)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14509)

(declare-datatypes ((Unit!12142 0))(
  ( (Unit!12143) )
))
(declare-fun lt!187738 () Unit!12142)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!329 (array!24015 array!24017 (_ BitVec 32) (_ BitVec 32) V!14509 V!14509 (_ BitVec 32) (_ BitVec 64) V!14509 (_ BitVec 32) Int) Unit!12142)

(assert (=> b!400825 (= lt!187738 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!329 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400826 () Bool)

(declare-fun res!230660 () Bool)

(assert (=> b!400826 (=> (not res!230660) (not e!241801))))

(assert (=> b!400826 (= res!230660 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11809 _keys!709))))))

(declare-fun b!400827 () Bool)

(assert (=> b!400827 (= e!241800 (= call!28178 call!28177))))

(declare-fun b!400828 () Bool)

(declare-fun res!230661 () Bool)

(assert (=> b!400828 (=> (not res!230661) (not e!241801))))

(assert (=> b!400828 (= res!230661 (and (= (size!11810 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11809 _keys!709) (size!11810 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400829 () Bool)

(assert (=> b!400829 (= e!241797 (and e!241799 mapRes!16701))))

(declare-fun condMapEmpty!16701 () Bool)

(declare-fun mapDefault!16701 () ValueCell!4683)

(assert (=> b!400829 (= condMapEmpty!16701 (= (arr!11458 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4683)) mapDefault!16701)))))

(declare-fun b!400830 () Bool)

(assert (=> b!400830 (= e!241801 e!241802)))

(declare-fun res!230656 () Bool)

(assert (=> b!400830 (=> (not res!230656) (not e!241802))))

(assert (=> b!400830 (= res!230656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187739 mask!1025))))

(assert (=> b!400830 (= lt!187739 (array!24016 (store (arr!11457 _keys!709) i!563 k0!794) (size!11809 _keys!709)))))

(declare-fun b!400831 () Bool)

(declare-fun res!230657 () Bool)

(assert (=> b!400831 (=> (not res!230657) (not e!241801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400831 (= res!230657 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16701 () Bool)

(assert (=> mapIsEmpty!16701 mapRes!16701))

(declare-fun b!400832 () Bool)

(assert (=> b!400832 (= e!241798 tp_is_empty!10053)))

(declare-fun b!400833 () Bool)

(declare-fun res!230655 () Bool)

(assert (=> b!400833 (=> (not res!230655) (not e!241801))))

(declare-fun arrayContainsKey!0 (array!24015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400833 (= res!230655 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400834 () Bool)

(declare-fun res!230653 () Bool)

(assert (=> b!400834 (=> (not res!230653) (not e!241801))))

(assert (=> b!400834 (= res!230653 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6646))))

(declare-fun b!400835 () Bool)

(declare-fun res!230658 () Bool)

(assert (=> b!400835 (=> (not res!230658) (not e!241802))))

(assert (=> b!400835 (= res!230658 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11809 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28174 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1048 (array!24015 array!24017 (_ BitVec 32) (_ BitVec 32) V!14509 V!14509 (_ BitVec 32) Int) ListLongMap!5639)

(assert (=> bm!28174 (= call!28177 (getCurrentListMapNoExtraKeys!1048 (ite c!54713 lt!187739 _keys!709) (ite c!54713 (array!24018 (store (arr!11458 _values!549) i!563 (ValueCellFull!4683 v!412)) (size!11810 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28175 () Bool)

(assert (=> bm!28175 (= call!28178 (getCurrentListMapNoExtraKeys!1048 (ite c!54713 _keys!709 lt!187739) (ite c!54713 _values!549 (array!24018 (store (arr!11458 _values!549) i!563 (ValueCellFull!4683 v!412)) (size!11810 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38634 res!230651) b!400823))

(assert (= (and b!400823 res!230659) b!400828))

(assert (= (and b!400828 res!230661) b!400821))

(assert (= (and b!400821 res!230650) b!400834))

(assert (= (and b!400834 res!230653) b!400826))

(assert (= (and b!400826 res!230660) b!400831))

(assert (= (and b!400831 res!230657) b!400824))

(assert (= (and b!400824 res!230652) b!400833))

(assert (= (and b!400833 res!230655) b!400830))

(assert (= (and b!400830 res!230656) b!400819))

(assert (= (and b!400819 res!230654) b!400835))

(assert (= (and b!400835 res!230658) b!400825))

(assert (= (and b!400825 c!54713) b!400820))

(assert (= (and b!400825 (not c!54713)) b!400827))

(assert (= (or b!400820 b!400827) bm!28174))

(assert (= (or b!400820 b!400827) bm!28175))

(assert (= (and b!400829 condMapEmpty!16701) mapIsEmpty!16701))

(assert (= (and b!400829 (not condMapEmpty!16701)) mapNonEmpty!16701))

(get-info :version)

(assert (= (and mapNonEmpty!16701 ((_ is ValueCellFull!4683) mapValue!16701)) b!400832))

(assert (= (and b!400829 ((_ is ValueCellFull!4683) mapDefault!16701)) b!400822))

(assert (= start!38634 b!400829))

(declare-fun m!394883 () Bool)

(assert (=> b!400833 m!394883))

(declare-fun m!394885 () Bool)

(assert (=> b!400825 m!394885))

(declare-fun m!394887 () Bool)

(assert (=> bm!28174 m!394887))

(declare-fun m!394889 () Bool)

(assert (=> bm!28174 m!394889))

(declare-fun m!394891 () Bool)

(assert (=> b!400834 m!394891))

(declare-fun m!394893 () Bool)

(assert (=> b!400824 m!394893))

(declare-fun m!394895 () Bool)

(assert (=> b!400820 m!394895))

(declare-fun m!394897 () Bool)

(assert (=> b!400821 m!394897))

(assert (=> bm!28175 m!394887))

(declare-fun m!394899 () Bool)

(assert (=> bm!28175 m!394899))

(declare-fun m!394901 () Bool)

(assert (=> b!400823 m!394901))

(declare-fun m!394903 () Bool)

(assert (=> b!400831 m!394903))

(declare-fun m!394905 () Bool)

(assert (=> start!38634 m!394905))

(declare-fun m!394907 () Bool)

(assert (=> start!38634 m!394907))

(declare-fun m!394909 () Bool)

(assert (=> mapNonEmpty!16701 m!394909))

(declare-fun m!394911 () Bool)

(assert (=> b!400819 m!394911))

(declare-fun m!394913 () Bool)

(assert (=> b!400830 m!394913))

(declare-fun m!394915 () Bool)

(assert (=> b!400830 m!394915))

(check-sat (not b!400830) (not b!400825) (not b!400831) b_and!16557 (not b!400834) (not b!400819) (not bm!28175) (not b!400823) (not bm!28174) (not b!400833) (not b!400821) (not b!400820) (not b_next!9171) tp_is_empty!10053 (not mapNonEmpty!16701) (not start!38634))
(check-sat b_and!16557 (not b_next!9171))
