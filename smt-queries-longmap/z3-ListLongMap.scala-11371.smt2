; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132132 () Bool)

(assert start!132132)

(declare-fun b_free!31845 () Bool)

(declare-fun b_next!31845 () Bool)

(assert (=> start!132132 (= b_free!31845 (not b_next!31845))))

(declare-fun tp!111786 () Bool)

(declare-fun b_and!51257 () Bool)

(assert (=> start!132132 (= tp!111786 b_and!51257)))

(declare-fun bm!70562 () Bool)

(declare-datatypes ((V!59271 0))(
  ( (V!59272 (val!19138 Int)) )
))
(declare-datatypes ((tuple2!24654 0))(
  ( (tuple2!24655 (_1!12338 (_ BitVec 64)) (_2!12338 V!59271)) )
))
(declare-datatypes ((List!36138 0))(
  ( (Nil!36135) (Cons!36134 (h!37579 tuple2!24654) (t!50836 List!36138)) )
))
(declare-datatypes ((ListLongMap!22263 0))(
  ( (ListLongMap!22264 (toList!11147 List!36138)) )
))
(declare-fun call!70567 () ListLongMap!22263)

(declare-fun call!70566 () ListLongMap!22263)

(assert (=> bm!70562 (= call!70567 call!70566)))

(declare-fun b!1549766 () Bool)

(declare-datatypes ((Unit!51628 0))(
  ( (Unit!51629) )
))
(declare-fun e!862674 () Unit!51628)

(declare-fun lt!668071 () Unit!51628)

(assert (=> b!1549766 (= e!862674 lt!668071)))

(declare-datatypes ((array!103438 0))(
  ( (array!103439 (arr!49921 (Array (_ BitVec 32) (_ BitVec 64))) (size!50471 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103438)

(declare-fun zeroValue!436 () V!59271)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun lt!668070 () ListLongMap!22263)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18150 0))(
  ( (ValueCellFull!18150 (v!21939 V!59271)) (EmptyCell!18150) )
))
(declare-datatypes ((array!103440 0))(
  ( (array!103441 (arr!49922 (Array (_ BitVec 32) ValueCell!18150)) (size!50472 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103440)

(declare-fun minValue!436 () V!59271)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6597 (array!103438 array!103440 (_ BitVec 32) (_ BitVec 32) V!59271 V!59271 (_ BitVec 32) Int) ListLongMap!22263)

(assert (=> b!1549766 (= lt!668070 (getCurrentListMapNoExtraKeys!6597 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668066 () Unit!51628)

(declare-fun addStillContains!1280 (ListLongMap!22263 (_ BitVec 64) V!59271 (_ BitVec 64)) Unit!51628)

(assert (=> b!1549766 (= lt!668066 (addStillContains!1280 lt!668070 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49921 _keys!618) from!762)))))

(declare-fun lt!668073 () ListLongMap!22263)

(declare-fun +!4972 (ListLongMap!22263 tuple2!24654) ListLongMap!22263)

(assert (=> b!1549766 (= lt!668073 (+!4972 lt!668070 (tuple2!24655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10093 (ListLongMap!22263 (_ BitVec 64)) Bool)

(assert (=> b!1549766 (contains!10093 lt!668073 (select (arr!49921 _keys!618) from!762))))

(declare-fun addApplyDifferent!627 (ListLongMap!22263 (_ BitVec 64) V!59271 (_ BitVec 64)) Unit!51628)

(assert (=> b!1549766 (= lt!668071 (addApplyDifferent!627 lt!668070 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49921 _keys!618) from!762)))))

(declare-fun lt!668064 () V!59271)

(declare-fun apply!1086 (ListLongMap!22263 (_ BitVec 64)) V!59271)

(assert (=> b!1549766 (= lt!668064 (apply!1086 (+!4972 lt!668070 (tuple2!24655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49921 _keys!618) from!762)))))

(declare-fun lt!668068 () V!59271)

(assert (=> b!1549766 (= lt!668068 (apply!1086 lt!668070 (select (arr!49921 _keys!618) from!762)))))

(assert (=> b!1549766 (= lt!668064 lt!668068)))

(declare-fun lt!668069 () Unit!51628)

(assert (=> b!1549766 (= lt!668069 (addApplyDifferent!627 lt!668070 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49921 _keys!618) from!762)))))

(assert (=> b!1549766 (= (apply!1086 lt!668073 (select (arr!49921 _keys!618) from!762)) lt!668068)))

(declare-fun b!1549767 () Bool)

(declare-fun e!862680 () ListLongMap!22263)

(declare-fun call!70565 () ListLongMap!22263)

(assert (=> b!1549767 (= e!862680 call!70565)))

(declare-fun bm!70563 () Bool)

(declare-fun call!70569 () ListLongMap!22263)

(assert (=> bm!70563 (= call!70569 (getCurrentListMapNoExtraKeys!6597 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549768 () Bool)

(declare-fun e!862678 () Bool)

(declare-fun e!862669 () Bool)

(assert (=> b!1549768 (= e!862678 e!862669)))

(declare-fun res!1061703 () Bool)

(assert (=> b!1549768 (=> (not res!1061703) (not e!862669))))

(declare-fun e!862670 () Bool)

(assert (=> b!1549768 (= res!1061703 e!862670)))

(declare-fun res!1061698 () Bool)

(assert (=> b!1549768 (=> res!1061698 e!862670)))

(declare-fun lt!668074 () Bool)

(assert (=> b!1549768 (= res!1061698 lt!668074)))

(declare-fun lt!668072 () Unit!51628)

(assert (=> b!1549768 (= lt!668072 e!862674)))

(declare-fun c!142445 () Bool)

(assert (=> b!1549768 (= c!142445 (not lt!668074))))

(declare-fun e!862672 () Bool)

(assert (=> b!1549768 (= lt!668074 e!862672)))

(declare-fun res!1061694 () Bool)

(assert (=> b!1549768 (=> res!1061694 e!862672)))

(assert (=> b!1549768 (= res!1061694 (bvsge from!762 (size!50471 _keys!618)))))

(declare-fun lt!668067 () ListLongMap!22263)

(declare-fun e!862679 () ListLongMap!22263)

(assert (=> b!1549768 (= lt!668067 e!862679)))

(declare-fun c!142447 () Bool)

(declare-fun lt!668065 () Bool)

(assert (=> b!1549768 (= c!142447 (and (not lt!668065) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549768 (= lt!668065 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549769 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549769 (= e!862672 (not (validKeyInArray!0 (select (arr!49921 _keys!618) from!762))))))

(declare-fun b!1549770 () Bool)

(declare-fun res!1061695 () Bool)

(assert (=> b!1549770 (=> (not res!1061695) (not e!862678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103438 (_ BitVec 32)) Bool)

(assert (=> b!1549770 (= res!1061695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549771 () Bool)

(declare-fun e!862671 () Bool)

(declare-fun e!862675 () Bool)

(declare-fun mapRes!58885 () Bool)

(assert (=> b!1549771 (= e!862671 (and e!862675 mapRes!58885))))

(declare-fun condMapEmpty!58885 () Bool)

(declare-fun mapDefault!58885 () ValueCell!18150)

(assert (=> b!1549771 (= condMapEmpty!58885 (= (arr!49922 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18150)) mapDefault!58885)))))

(declare-fun mapNonEmpty!58885 () Bool)

(declare-fun tp!111787 () Bool)

(declare-fun e!862668 () Bool)

(assert (=> mapNonEmpty!58885 (= mapRes!58885 (and tp!111787 e!862668))))

(declare-fun mapKey!58885 () (_ BitVec 32))

(declare-fun mapRest!58885 () (Array (_ BitVec 32) ValueCell!18150))

(declare-fun mapValue!58885 () ValueCell!18150)

(assert (=> mapNonEmpty!58885 (= (arr!49922 _values!470) (store mapRest!58885 mapKey!58885 mapValue!58885))))

(declare-fun b!1549772 () Bool)

(declare-fun res!1061699 () Bool)

(assert (=> b!1549772 (=> (not res!1061699) (not e!862678))))

(assert (=> b!1549772 (= res!1061699 (and (= (size!50472 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50471 _keys!618) (size!50472 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549773 () Bool)

(declare-fun res!1061696 () Bool)

(assert (=> b!1549773 (=> (not res!1061696) (not e!862678))))

(declare-datatypes ((List!36139 0))(
  ( (Nil!36136) (Cons!36135 (h!37580 (_ BitVec 64)) (t!50837 List!36139)) )
))
(declare-fun arrayNoDuplicates!0 (array!103438 (_ BitVec 32) List!36139) Bool)

(assert (=> b!1549773 (= res!1061696 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36136))))

(declare-fun b!1549774 () Bool)

(assert (=> b!1549774 (= e!862680 call!70567)))

(declare-fun b!1549775 () Bool)

(declare-fun res!1061701 () Bool)

(assert (=> b!1549775 (=> (not res!1061701) (not e!862669))))

(assert (=> b!1549775 (= res!1061701 (not lt!668065))))

(declare-fun b!1549777 () Bool)

(declare-fun e!862676 () Bool)

(assert (=> b!1549777 (= e!862670 e!862676)))

(declare-fun res!1061702 () Bool)

(assert (=> b!1549777 (=> (not res!1061702) (not e!862676))))

(assert (=> b!1549777 (= res!1061702 (contains!10093 lt!668067 (select (arr!49921 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58885 () Bool)

(assert (=> mapIsEmpty!58885 mapRes!58885))

(declare-fun b!1549778 () Bool)

(declare-fun res!1061697 () Bool)

(assert (=> b!1549778 (=> (not res!1061697) (not e!862678))))

(assert (=> b!1549778 (= res!1061697 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50471 _keys!618))))))

(declare-fun bm!70564 () Bool)

(declare-fun call!70568 () ListLongMap!22263)

(assert (=> bm!70564 (= call!70565 call!70568)))

(declare-fun b!1549779 () Bool)

(assert (=> b!1549779 (= e!862669 false)))

(declare-fun lt!668075 () Bool)

(assert (=> b!1549779 (= lt!668075 (contains!10093 lt!668067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549780 () Bool)

(declare-fun e!862673 () ListLongMap!22263)

(assert (=> b!1549780 (= e!862673 call!70567)))

(declare-fun b!1549781 () Bool)

(assert (=> b!1549781 (= e!862679 e!862673)))

(declare-fun c!142446 () Bool)

(assert (=> b!1549781 (= c!142446 (and (not lt!668065) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549782 () Bool)

(declare-fun Unit!51630 () Unit!51628)

(assert (=> b!1549782 (= e!862674 Unit!51630)))

(declare-fun bm!70565 () Bool)

(assert (=> bm!70565 (= call!70566 (+!4972 (ite c!142447 call!70569 (ite c!142446 call!70568 call!70565)) (ite (or c!142447 c!142446) (tuple2!24655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70566 () Bool)

(assert (=> bm!70566 (= call!70568 call!70569)))

(declare-fun b!1549783 () Bool)

(declare-fun tp_is_empty!38121 () Bool)

(assert (=> b!1549783 (= e!862668 tp_is_empty!38121)))

(declare-fun b!1549784 () Bool)

(assert (=> b!1549784 (= e!862675 tp_is_empty!38121)))

(declare-fun b!1549776 () Bool)

(assert (=> b!1549776 (= e!862679 (+!4972 call!70566 (tuple2!24655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1061700 () Bool)

(assert (=> start!132132 (=> (not res!1061700) (not e!862678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132132 (= res!1061700 (validMask!0 mask!926))))

(assert (=> start!132132 e!862678))

(declare-fun array_inv!38811 (array!103438) Bool)

(assert (=> start!132132 (array_inv!38811 _keys!618)))

(assert (=> start!132132 tp_is_empty!38121))

(assert (=> start!132132 true))

(assert (=> start!132132 tp!111786))

(declare-fun array_inv!38812 (array!103440) Bool)

(assert (=> start!132132 (and (array_inv!38812 _values!470) e!862671)))

(declare-fun b!1549785 () Bool)

(declare-fun get!25995 (ValueCell!18150 V!59271) V!59271)

(declare-fun dynLambda!3796 (Int (_ BitVec 64)) V!59271)

(assert (=> b!1549785 (= e!862676 (= (apply!1086 lt!668067 (select (arr!49921 _keys!618) from!762)) (get!25995 (select (arr!49922 _values!470) from!762) (dynLambda!3796 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1549786 () Bool)

(declare-fun c!142448 () Bool)

(assert (=> b!1549786 (= c!142448 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668065))))

(assert (=> b!1549786 (= e!862673 e!862680)))

(assert (= (and start!132132 res!1061700) b!1549772))

(assert (= (and b!1549772 res!1061699) b!1549770))

(assert (= (and b!1549770 res!1061695) b!1549773))

(assert (= (and b!1549773 res!1061696) b!1549778))

(assert (= (and b!1549778 res!1061697) b!1549768))

(assert (= (and b!1549768 c!142447) b!1549776))

(assert (= (and b!1549768 (not c!142447)) b!1549781))

(assert (= (and b!1549781 c!142446) b!1549780))

(assert (= (and b!1549781 (not c!142446)) b!1549786))

(assert (= (and b!1549786 c!142448) b!1549774))

(assert (= (and b!1549786 (not c!142448)) b!1549767))

(assert (= (or b!1549774 b!1549767) bm!70564))

(assert (= (or b!1549780 bm!70564) bm!70566))

(assert (= (or b!1549780 b!1549774) bm!70562))

(assert (= (or b!1549776 bm!70566) bm!70563))

(assert (= (or b!1549776 bm!70562) bm!70565))

(assert (= (and b!1549768 (not res!1061694)) b!1549769))

(assert (= (and b!1549768 c!142445) b!1549766))

(assert (= (and b!1549768 (not c!142445)) b!1549782))

(assert (= (and b!1549768 (not res!1061698)) b!1549777))

(assert (= (and b!1549777 res!1061702) b!1549785))

(assert (= (and b!1549768 res!1061703) b!1549775))

(assert (= (and b!1549775 res!1061701) b!1549779))

(assert (= (and b!1549771 condMapEmpty!58885) mapIsEmpty!58885))

(assert (= (and b!1549771 (not condMapEmpty!58885)) mapNonEmpty!58885))

(get-info :version)

(assert (= (and mapNonEmpty!58885 ((_ is ValueCellFull!18150) mapValue!58885)) b!1549783))

(assert (= (and b!1549771 ((_ is ValueCellFull!18150) mapDefault!58885)) b!1549784))

(assert (= start!132132 b!1549771))

(declare-fun b_lambda!24745 () Bool)

(assert (=> (not b_lambda!24745) (not b!1549785)))

(declare-fun t!50835 () Bool)

(declare-fun tb!12465 () Bool)

(assert (=> (and start!132132 (= defaultEntry!478 defaultEntry!478) t!50835) tb!12465))

(declare-fun result!26041 () Bool)

(assert (=> tb!12465 (= result!26041 tp_is_empty!38121)))

(assert (=> b!1549785 t!50835))

(declare-fun b_and!51259 () Bool)

(assert (= b_and!51257 (and (=> t!50835 result!26041) b_and!51259)))

(declare-fun m!1428935 () Bool)

(assert (=> b!1549770 m!1428935))

(declare-fun m!1428937 () Bool)

(assert (=> b!1549779 m!1428937))

(declare-fun m!1428939 () Bool)

(assert (=> b!1549777 m!1428939))

(assert (=> b!1549777 m!1428939))

(declare-fun m!1428941 () Bool)

(assert (=> b!1549777 m!1428941))

(declare-fun m!1428943 () Bool)

(assert (=> bm!70565 m!1428943))

(declare-fun m!1428945 () Bool)

(assert (=> bm!70563 m!1428945))

(declare-fun m!1428947 () Bool)

(assert (=> mapNonEmpty!58885 m!1428947))

(declare-fun m!1428949 () Bool)

(assert (=> b!1549773 m!1428949))

(declare-fun m!1428951 () Bool)

(assert (=> b!1549785 m!1428951))

(assert (=> b!1549785 m!1428939))

(declare-fun m!1428953 () Bool)

(assert (=> b!1549785 m!1428953))

(assert (=> b!1549785 m!1428951))

(assert (=> b!1549785 m!1428953))

(declare-fun m!1428955 () Bool)

(assert (=> b!1549785 m!1428955))

(assert (=> b!1549785 m!1428939))

(declare-fun m!1428957 () Bool)

(assert (=> b!1549785 m!1428957))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428959 () Bool)

(assert (=> b!1549766 m!1428959))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428961 () Bool)

(assert (=> b!1549766 m!1428961))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428963 () Bool)

(assert (=> b!1549766 m!1428963))

(assert (=> b!1549766 m!1428945))

(assert (=> b!1549766 m!1428939))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428965 () Bool)

(assert (=> b!1549766 m!1428965))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428967 () Bool)

(assert (=> b!1549766 m!1428967))

(declare-fun m!1428969 () Bool)

(assert (=> b!1549766 m!1428969))

(declare-fun m!1428971 () Bool)

(assert (=> b!1549766 m!1428971))

(assert (=> b!1549766 m!1428969))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428973 () Bool)

(assert (=> b!1549766 m!1428973))

(assert (=> b!1549766 m!1428939))

(declare-fun m!1428975 () Bool)

(assert (=> b!1549766 m!1428975))

(declare-fun m!1428977 () Bool)

(assert (=> b!1549776 m!1428977))

(assert (=> b!1549769 m!1428939))

(assert (=> b!1549769 m!1428939))

(declare-fun m!1428979 () Bool)

(assert (=> b!1549769 m!1428979))

(declare-fun m!1428981 () Bool)

(assert (=> start!132132 m!1428981))

(declare-fun m!1428983 () Bool)

(assert (=> start!132132 m!1428983))

(declare-fun m!1428985 () Bool)

(assert (=> start!132132 m!1428985))

(check-sat (not b!1549777) (not mapNonEmpty!58885) (not bm!70563) (not b_next!31845) (not b_lambda!24745) b_and!51259 (not b!1549766) (not start!132132) (not b!1549773) tp_is_empty!38121 (not bm!70565) (not b!1549779) (not b!1549769) (not b!1549785) (not b!1549770) (not b!1549776))
(check-sat b_and!51259 (not b_next!31845))
