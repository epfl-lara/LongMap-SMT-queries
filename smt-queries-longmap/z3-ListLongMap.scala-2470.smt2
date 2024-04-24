; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38624 () Bool)

(assert start!38624)

(declare-fun b_free!9175 () Bool)

(declare-fun b_next!9175 () Bool)

(assert (=> start!38624 (= b_free!9175 (not b_next!9175))))

(declare-fun tp!32648 () Bool)

(declare-fun b_and!16575 () Bool)

(assert (=> start!38624 (= tp!32648 b_and!16575)))

(declare-fun b!400872 () Bool)

(declare-fun res!230725 () Bool)

(declare-fun e!241811 () Bool)

(assert (=> b!400872 (=> (not res!230725) (not e!241811))))

(declare-datatypes ((array!24000 0))(
  ( (array!24001 (arr!11449 (Array (_ BitVec 32) (_ BitVec 64))) (size!11801 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24000)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!14515 0))(
  ( (V!14516 (val!5073 Int)) )
))
(declare-datatypes ((ValueCell!4685 0))(
  ( (ValueCellFull!4685 (v!7321 V!14515)) (EmptyCell!4685) )
))
(declare-datatypes ((array!24002 0))(
  ( (array!24003 (arr!11450 (Array (_ BitVec 32) ValueCell!4685)) (size!11802 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24002)

(assert (=> b!400872 (= res!230725 (and (= (size!11802 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11801 _keys!709) (size!11802 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400873 () Bool)

(declare-fun e!241812 () Bool)

(declare-fun tp_is_empty!10057 () Bool)

(assert (=> b!400873 (= e!241812 tp_is_empty!10057)))

(declare-fun b!400874 () Bool)

(declare-fun e!241808 () Bool)

(assert (=> b!400874 (= e!241808 tp_is_empty!10057)))

(declare-fun b!400875 () Bool)

(declare-fun e!241807 () Bool)

(assert (=> b!400875 (= e!241807 (not true))))

(declare-fun e!241813 () Bool)

(assert (=> b!400875 e!241813))

(declare-fun c!54696 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400875 (= c!54696 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14515)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14515)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12117 0))(
  ( (Unit!12118) )
))
(declare-fun lt!187769 () Unit!12117)

(declare-fun v!412 () V!14515)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!326 (array!24000 array!24002 (_ BitVec 32) (_ BitVec 32) V!14515 V!14515 (_ BitVec 32) (_ BitVec 64) V!14515 (_ BitVec 32) Int) Unit!12117)

(assert (=> b!400875 (= lt!187769 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400876 () Bool)

(declare-fun res!230720 () Bool)

(assert (=> b!400876 (=> (not res!230720) (not e!241811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24000 (_ BitVec 32)) Bool)

(assert (=> b!400876 (= res!230720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230722 () Bool)

(assert (=> start!38624 (=> (not res!230722) (not e!241811))))

(assert (=> start!38624 (= res!230722 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11801 _keys!709))))))

(assert (=> start!38624 e!241811))

(assert (=> start!38624 tp_is_empty!10057))

(assert (=> start!38624 tp!32648))

(assert (=> start!38624 true))

(declare-fun e!241809 () Bool)

(declare-fun array_inv!8454 (array!24002) Bool)

(assert (=> start!38624 (and (array_inv!8454 _values!549) e!241809)))

(declare-fun array_inv!8455 (array!24000) Bool)

(assert (=> start!38624 (array_inv!8455 _keys!709)))

(declare-fun mapNonEmpty!16707 () Bool)

(declare-fun mapRes!16707 () Bool)

(declare-fun tp!32649 () Bool)

(assert (=> mapNonEmpty!16707 (= mapRes!16707 (and tp!32649 e!241812))))

(declare-fun mapRest!16707 () (Array (_ BitVec 32) ValueCell!4685))

(declare-fun mapKey!16707 () (_ BitVec 32))

(declare-fun mapValue!16707 () ValueCell!4685)

(assert (=> mapNonEmpty!16707 (= (arr!11450 _values!549) (store mapRest!16707 mapKey!16707 mapValue!16707))))

(declare-fun b!400877 () Bool)

(assert (=> b!400877 (= e!241811 e!241807)))

(declare-fun res!230719 () Bool)

(assert (=> b!400877 (=> (not res!230719) (not e!241807))))

(declare-fun lt!187770 () array!24000)

(assert (=> b!400877 (= res!230719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187770 mask!1025))))

(assert (=> b!400877 (= lt!187770 (array!24001 (store (arr!11449 _keys!709) i!563 k0!794) (size!11801 _keys!709)))))

(declare-fun b!400878 () Bool)

(declare-fun res!230727 () Bool)

(assert (=> b!400878 (=> (not res!230727) (not e!241811))))

(assert (=> b!400878 (= res!230727 (or (= (select (arr!11449 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11449 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400879 () Bool)

(declare-fun res!230723 () Bool)

(assert (=> b!400879 (=> (not res!230723) (not e!241811))))

(declare-fun arrayContainsKey!0 (array!24000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400879 (= res!230723 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28173 () Bool)

(declare-datatypes ((tuple2!6594 0))(
  ( (tuple2!6595 (_1!3308 (_ BitVec 64)) (_2!3308 V!14515)) )
))
(declare-datatypes ((List!6514 0))(
  ( (Nil!6511) (Cons!6510 (h!7366 tuple2!6594) (t!11680 List!6514)) )
))
(declare-datatypes ((ListLongMap!5509 0))(
  ( (ListLongMap!5510 (toList!2770 List!6514)) )
))
(declare-fun call!28176 () ListLongMap!5509)

(declare-fun getCurrentListMapNoExtraKeys!1027 (array!24000 array!24002 (_ BitVec 32) (_ BitVec 32) V!14515 V!14515 (_ BitVec 32) Int) ListLongMap!5509)

(assert (=> bm!28173 (= call!28176 (getCurrentListMapNoExtraKeys!1027 (ite c!54696 lt!187770 _keys!709) (ite c!54696 (array!24003 (store (arr!11450 _values!549) i!563 (ValueCellFull!4685 v!412)) (size!11802 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400880 () Bool)

(declare-fun res!230724 () Bool)

(assert (=> b!400880 (=> (not res!230724) (not e!241807))))

(declare-datatypes ((List!6515 0))(
  ( (Nil!6512) (Cons!6511 (h!7367 (_ BitVec 64)) (t!11681 List!6515)) )
))
(declare-fun arrayNoDuplicates!0 (array!24000 (_ BitVec 32) List!6515) Bool)

(assert (=> b!400880 (= res!230724 (arrayNoDuplicates!0 lt!187770 #b00000000000000000000000000000000 Nil!6512))))

(declare-fun mapIsEmpty!16707 () Bool)

(assert (=> mapIsEmpty!16707 mapRes!16707))

(declare-fun b!400881 () Bool)

(declare-fun call!28177 () ListLongMap!5509)

(assert (=> b!400881 (= e!241813 (= call!28177 call!28176))))

(declare-fun b!400882 () Bool)

(declare-fun res!230726 () Bool)

(assert (=> b!400882 (=> (not res!230726) (not e!241811))))

(assert (=> b!400882 (= res!230726 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11801 _keys!709))))))

(declare-fun b!400883 () Bool)

(assert (=> b!400883 (= e!241809 (and e!241808 mapRes!16707))))

(declare-fun condMapEmpty!16707 () Bool)

(declare-fun mapDefault!16707 () ValueCell!4685)

(assert (=> b!400883 (= condMapEmpty!16707 (= (arr!11450 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4685)) mapDefault!16707)))))

(declare-fun b!400884 () Bool)

(declare-fun +!1116 (ListLongMap!5509 tuple2!6594) ListLongMap!5509)

(assert (=> b!400884 (= e!241813 (= call!28176 (+!1116 call!28177 (tuple2!6595 k0!794 v!412))))))

(declare-fun b!400885 () Bool)

(declare-fun res!230730 () Bool)

(assert (=> b!400885 (=> (not res!230730) (not e!241811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400885 (= res!230730 (validKeyInArray!0 k0!794))))

(declare-fun b!400886 () Bool)

(declare-fun res!230729 () Bool)

(assert (=> b!400886 (=> (not res!230729) (not e!241811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400886 (= res!230729 (validMask!0 mask!1025))))

(declare-fun bm!28174 () Bool)

(assert (=> bm!28174 (= call!28177 (getCurrentListMapNoExtraKeys!1027 (ite c!54696 _keys!709 lt!187770) (ite c!54696 _values!549 (array!24003 (store (arr!11450 _values!549) i!563 (ValueCellFull!4685 v!412)) (size!11802 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400887 () Bool)

(declare-fun res!230728 () Bool)

(assert (=> b!400887 (=> (not res!230728) (not e!241811))))

(assert (=> b!400887 (= res!230728 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6512))))

(declare-fun b!400888 () Bool)

(declare-fun res!230721 () Bool)

(assert (=> b!400888 (=> (not res!230721) (not e!241807))))

(assert (=> b!400888 (= res!230721 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11801 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38624 res!230722) b!400886))

(assert (= (and b!400886 res!230729) b!400872))

(assert (= (and b!400872 res!230725) b!400876))

(assert (= (and b!400876 res!230720) b!400887))

(assert (= (and b!400887 res!230728) b!400882))

(assert (= (and b!400882 res!230726) b!400885))

(assert (= (and b!400885 res!230730) b!400878))

(assert (= (and b!400878 res!230727) b!400879))

(assert (= (and b!400879 res!230723) b!400877))

(assert (= (and b!400877 res!230719) b!400880))

(assert (= (and b!400880 res!230724) b!400888))

(assert (= (and b!400888 res!230721) b!400875))

(assert (= (and b!400875 c!54696) b!400884))

(assert (= (and b!400875 (not c!54696)) b!400881))

(assert (= (or b!400884 b!400881) bm!28173))

(assert (= (or b!400884 b!400881) bm!28174))

(assert (= (and b!400883 condMapEmpty!16707) mapIsEmpty!16707))

(assert (= (and b!400883 (not condMapEmpty!16707)) mapNonEmpty!16707))

(get-info :version)

(assert (= (and mapNonEmpty!16707 ((_ is ValueCellFull!4685) mapValue!16707)) b!400873))

(assert (= (and b!400883 ((_ is ValueCellFull!4685) mapDefault!16707)) b!400874))

(assert (= start!38624 b!400883))

(declare-fun m!395181 () Bool)

(assert (=> b!400876 m!395181))

(declare-fun m!395183 () Bool)

(assert (=> mapNonEmpty!16707 m!395183))

(declare-fun m!395185 () Bool)

(assert (=> b!400885 m!395185))

(declare-fun m!395187 () Bool)

(assert (=> bm!28173 m!395187))

(declare-fun m!395189 () Bool)

(assert (=> bm!28173 m!395189))

(declare-fun m!395191 () Bool)

(assert (=> b!400886 m!395191))

(declare-fun m!395193 () Bool)

(assert (=> b!400879 m!395193))

(declare-fun m!395195 () Bool)

(assert (=> b!400880 m!395195))

(declare-fun m!395197 () Bool)

(assert (=> start!38624 m!395197))

(declare-fun m!395199 () Bool)

(assert (=> start!38624 m!395199))

(assert (=> bm!28174 m!395187))

(declare-fun m!395201 () Bool)

(assert (=> bm!28174 m!395201))

(declare-fun m!395203 () Bool)

(assert (=> b!400875 m!395203))

(declare-fun m!395205 () Bool)

(assert (=> b!400884 m!395205))

(declare-fun m!395207 () Bool)

(assert (=> b!400877 m!395207))

(declare-fun m!395209 () Bool)

(assert (=> b!400877 m!395209))

(declare-fun m!395211 () Bool)

(assert (=> b!400887 m!395211))

(declare-fun m!395213 () Bool)

(assert (=> b!400878 m!395213))

(check-sat b_and!16575 (not b!400879) (not start!38624) (not b_next!9175) (not mapNonEmpty!16707) (not b!400875) (not b!400887) (not b!400884) (not b!400880) (not bm!28174) (not b!400885) (not b!400877) tp_is_empty!10057 (not bm!28173) (not b!400886) (not b!400876))
(check-sat b_and!16575 (not b_next!9175))
