; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39422 () Bool)

(assert start!39422)

(declare-fun b_free!9703 () Bool)

(declare-fun b_next!9703 () Bool)

(assert (=> start!39422 (= b_free!9703 (not b_next!9703))))

(declare-fun tp!34638 () Bool)

(declare-fun b_and!17255 () Bool)

(assert (=> start!39422 (= tp!34638 b_and!17255)))

(declare-fun b!419756 () Bool)

(declare-fun e!250068 () Bool)

(declare-fun e!250069 () Bool)

(declare-fun mapRes!17904 () Bool)

(assert (=> b!419756 (= e!250068 (and e!250069 mapRes!17904))))

(declare-fun condMapEmpty!17904 () Bool)

(declare-datatypes ((V!15579 0))(
  ( (V!15580 (val!5472 Int)) )
))
(declare-datatypes ((ValueCell!5084 0))(
  ( (ValueCellFull!5084 (v!7713 V!15579)) (EmptyCell!5084) )
))
(declare-datatypes ((array!25543 0))(
  ( (array!25544 (arr!12221 (Array (_ BitVec 32) ValueCell!5084)) (size!12574 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25543)

(declare-fun mapDefault!17904 () ValueCell!5084)

(assert (=> b!419756 (= condMapEmpty!17904 (= (arr!12221 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5084)) mapDefault!17904)))))

(declare-fun mapIsEmpty!17904 () Bool)

(assert (=> mapIsEmpty!17904 mapRes!17904))

(declare-fun b!419757 () Bool)

(declare-fun res!244824 () Bool)

(declare-fun e!250067 () Bool)

(assert (=> b!419757 (=> (not res!244824) (not e!250067))))

(declare-datatypes ((array!25545 0))(
  ( (array!25546 (arr!12222 (Array (_ BitVec 32) (_ BitVec 64))) (size!12575 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25545)

(declare-datatypes ((List!7147 0))(
  ( (Nil!7144) (Cons!7143 (h!7999 (_ BitVec 64)) (t!12506 List!7147)) )
))
(declare-fun arrayNoDuplicates!0 (array!25545 (_ BitVec 32) List!7147) Bool)

(assert (=> b!419757 (= res!244824 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7144))))

(declare-fun c!55197 () Bool)

(declare-fun minValue!515 () V!15579)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192439 () array!25545)

(declare-fun zeroValue!515 () V!15579)

(declare-fun bm!29259 () Bool)

(declare-fun lt!192448 () array!25543)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7150 0))(
  ( (tuple2!7151 (_1!3586 (_ BitVec 64)) (_2!3586 V!15579)) )
))
(declare-datatypes ((List!7148 0))(
  ( (Nil!7145) (Cons!7144 (h!8000 tuple2!7150) (t!12507 List!7148)) )
))
(declare-datatypes ((ListLongMap!6053 0))(
  ( (ListLongMap!6054 (toList!3042 List!7148)) )
))
(declare-fun call!29262 () ListLongMap!6053)

(declare-fun getCurrentListMapNoExtraKeys!1252 (array!25545 array!25543 (_ BitVec 32) (_ BitVec 32) V!15579 V!15579 (_ BitVec 32) Int) ListLongMap!6053)

(assert (=> bm!29259 (= call!29262 (getCurrentListMapNoExtraKeys!1252 (ite c!55197 lt!192439 _keys!709) (ite c!55197 lt!192448 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29263 () ListLongMap!6053)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!419758 () Bool)

(declare-fun e!250073 () Bool)

(declare-fun v!412 () V!15579)

(declare-fun +!1267 (ListLongMap!6053 tuple2!7150) ListLongMap!6053)

(assert (=> b!419758 (= e!250073 (= call!29262 (+!1267 call!29263 (tuple2!7151 k0!794 v!412))))))

(declare-fun b!419759 () Bool)

(assert (=> b!419759 (= e!250073 (= call!29263 call!29262))))

(declare-fun b!419760 () Bool)

(declare-fun res!244820 () Bool)

(assert (=> b!419760 (=> (not res!244820) (not e!250067))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419760 (= res!244820 (or (= (select (arr!12222 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12222 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419761 () Bool)

(declare-fun res!244825 () Bool)

(assert (=> b!419761 (=> (not res!244825) (not e!250067))))

(assert (=> b!419761 (= res!244825 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12575 _keys!709))))))

(declare-fun bm!29260 () Bool)

(assert (=> bm!29260 (= call!29263 (getCurrentListMapNoExtraKeys!1252 (ite c!55197 _keys!709 lt!192439) (ite c!55197 _values!549 lt!192448) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419762 () Bool)

(declare-fun e!250066 () Bool)

(declare-fun tp_is_empty!10855 () Bool)

(assert (=> b!419762 (= e!250066 tp_is_empty!10855)))

(declare-fun b!419763 () Bool)

(declare-fun e!250070 () Bool)

(declare-fun e!250071 () Bool)

(assert (=> b!419763 (= e!250070 (not e!250071))))

(declare-fun res!244818 () Bool)

(assert (=> b!419763 (=> res!244818 e!250071)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419763 (= res!244818 (validKeyInArray!0 (select (arr!12222 _keys!709) from!863)))))

(assert (=> b!419763 e!250073))

(assert (=> b!419763 (= c!55197 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12378 0))(
  ( (Unit!12379) )
))
(declare-fun lt!192446 () Unit!12378)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!442 (array!25545 array!25543 (_ BitVec 32) (_ BitVec 32) V!15579 V!15579 (_ BitVec 32) (_ BitVec 64) V!15579 (_ BitVec 32) Int) Unit!12378)

(assert (=> b!419763 (= lt!192446 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!442 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419764 () Bool)

(declare-fun res!244829 () Bool)

(declare-fun e!250072 () Bool)

(assert (=> b!419764 (=> (not res!244829) (not e!250072))))

(assert (=> b!419764 (= res!244829 (arrayNoDuplicates!0 lt!192439 #b00000000000000000000000000000000 Nil!7144))))

(declare-fun b!419765 () Bool)

(assert (=> b!419765 (= e!250069 tp_is_empty!10855)))

(declare-fun b!419766 () Bool)

(declare-fun res!244823 () Bool)

(assert (=> b!419766 (=> (not res!244823) (not e!250067))))

(assert (=> b!419766 (= res!244823 (and (= (size!12574 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12575 _keys!709) (size!12574 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!244830 () Bool)

(assert (=> start!39422 (=> (not res!244830) (not e!250067))))

(assert (=> start!39422 (= res!244830 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12575 _keys!709))))))

(assert (=> start!39422 e!250067))

(assert (=> start!39422 tp_is_empty!10855))

(assert (=> start!39422 tp!34638))

(assert (=> start!39422 true))

(declare-fun array_inv!8952 (array!25543) Bool)

(assert (=> start!39422 (and (array_inv!8952 _values!549) e!250068)))

(declare-fun array_inv!8953 (array!25545) Bool)

(assert (=> start!39422 (array_inv!8953 _keys!709)))

(declare-fun b!419755 () Bool)

(declare-fun res!244827 () Bool)

(assert (=> b!419755 (=> (not res!244827) (not e!250067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25545 (_ BitVec 32)) Bool)

(assert (=> b!419755 (= res!244827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419767 () Bool)

(declare-fun res!244826 () Bool)

(assert (=> b!419767 (=> (not res!244826) (not e!250067))))

(declare-fun arrayContainsKey!0 (array!25545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419767 (= res!244826 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419768 () Bool)

(assert (=> b!419768 (= e!250071 true)))

(declare-fun lt!192447 () ListLongMap!6053)

(declare-fun lt!192441 () V!15579)

(declare-fun lt!192449 () tuple2!7150)

(assert (=> b!419768 (= (+!1267 lt!192447 lt!192449) (+!1267 (+!1267 lt!192447 (tuple2!7151 k0!794 lt!192441)) lt!192449))))

(declare-fun lt!192440 () V!15579)

(assert (=> b!419768 (= lt!192449 (tuple2!7151 k0!794 lt!192440))))

(declare-fun lt!192443 () Unit!12378)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!51 (ListLongMap!6053 (_ BitVec 64) V!15579 V!15579) Unit!12378)

(assert (=> b!419768 (= lt!192443 (addSameAsAddTwiceSameKeyDiffValues!51 lt!192447 k0!794 lt!192441 lt!192440))))

(declare-fun lt!192442 () V!15579)

(declare-fun get!6060 (ValueCell!5084 V!15579) V!15579)

(assert (=> b!419768 (= lt!192441 (get!6060 (select (arr!12221 _values!549) from!863) lt!192442))))

(declare-fun lt!192444 () ListLongMap!6053)

(assert (=> b!419768 (= lt!192444 (+!1267 lt!192447 (tuple2!7151 (select (arr!12222 lt!192439) from!863) lt!192440)))))

(assert (=> b!419768 (= lt!192440 (get!6060 (select (store (arr!12221 _values!549) i!563 (ValueCellFull!5084 v!412)) from!863) lt!192442))))

(declare-fun dynLambda!708 (Int (_ BitVec 64)) V!15579)

(assert (=> b!419768 (= lt!192442 (dynLambda!708 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419768 (= lt!192447 (getCurrentListMapNoExtraKeys!1252 lt!192439 lt!192448 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419769 () Bool)

(declare-fun res!244828 () Bool)

(assert (=> b!419769 (=> (not res!244828) (not e!250072))))

(assert (=> b!419769 (= res!244828 (bvsle from!863 i!563))))

(declare-fun b!419770 () Bool)

(assert (=> b!419770 (= e!250072 e!250070)))

(declare-fun res!244817 () Bool)

(assert (=> b!419770 (=> (not res!244817) (not e!250070))))

(assert (=> b!419770 (= res!244817 (= from!863 i!563))))

(assert (=> b!419770 (= lt!192444 (getCurrentListMapNoExtraKeys!1252 lt!192439 lt!192448 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419770 (= lt!192448 (array!25544 (store (arr!12221 _values!549) i!563 (ValueCellFull!5084 v!412)) (size!12574 _values!549)))))

(declare-fun lt!192445 () ListLongMap!6053)

(assert (=> b!419770 (= lt!192445 (getCurrentListMapNoExtraKeys!1252 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419771 () Bool)

(declare-fun res!244821 () Bool)

(assert (=> b!419771 (=> (not res!244821) (not e!250067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419771 (= res!244821 (validMask!0 mask!1025))))

(declare-fun b!419772 () Bool)

(assert (=> b!419772 (= e!250067 e!250072)))

(declare-fun res!244819 () Bool)

(assert (=> b!419772 (=> (not res!244819) (not e!250072))))

(assert (=> b!419772 (= res!244819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192439 mask!1025))))

(assert (=> b!419772 (= lt!192439 (array!25546 (store (arr!12222 _keys!709) i!563 k0!794) (size!12575 _keys!709)))))

(declare-fun mapNonEmpty!17904 () Bool)

(declare-fun tp!34637 () Bool)

(assert (=> mapNonEmpty!17904 (= mapRes!17904 (and tp!34637 e!250066))))

(declare-fun mapValue!17904 () ValueCell!5084)

(declare-fun mapRest!17904 () (Array (_ BitVec 32) ValueCell!5084))

(declare-fun mapKey!17904 () (_ BitVec 32))

(assert (=> mapNonEmpty!17904 (= (arr!12221 _values!549) (store mapRest!17904 mapKey!17904 mapValue!17904))))

(declare-fun b!419773 () Bool)

(declare-fun res!244822 () Bool)

(assert (=> b!419773 (=> (not res!244822) (not e!250067))))

(assert (=> b!419773 (= res!244822 (validKeyInArray!0 k0!794))))

(assert (= (and start!39422 res!244830) b!419771))

(assert (= (and b!419771 res!244821) b!419766))

(assert (= (and b!419766 res!244823) b!419755))

(assert (= (and b!419755 res!244827) b!419757))

(assert (= (and b!419757 res!244824) b!419761))

(assert (= (and b!419761 res!244825) b!419773))

(assert (= (and b!419773 res!244822) b!419760))

(assert (= (and b!419760 res!244820) b!419767))

(assert (= (and b!419767 res!244826) b!419772))

(assert (= (and b!419772 res!244819) b!419764))

(assert (= (and b!419764 res!244829) b!419769))

(assert (= (and b!419769 res!244828) b!419770))

(assert (= (and b!419770 res!244817) b!419763))

(assert (= (and b!419763 c!55197) b!419758))

(assert (= (and b!419763 (not c!55197)) b!419759))

(assert (= (or b!419758 b!419759) bm!29259))

(assert (= (or b!419758 b!419759) bm!29260))

(assert (= (and b!419763 (not res!244818)) b!419768))

(assert (= (and b!419756 condMapEmpty!17904) mapIsEmpty!17904))

(assert (= (and b!419756 (not condMapEmpty!17904)) mapNonEmpty!17904))

(get-info :version)

(assert (= (and mapNonEmpty!17904 ((_ is ValueCellFull!5084) mapValue!17904)) b!419762))

(assert (= (and b!419756 ((_ is ValueCellFull!5084) mapDefault!17904)) b!419765))

(assert (= start!39422 b!419756))

(declare-fun b_lambda!8989 () Bool)

(assert (=> (not b_lambda!8989) (not b!419768)))

(declare-fun t!12505 () Bool)

(declare-fun tb!3317 () Bool)

(assert (=> (and start!39422 (= defaultEntry!557 defaultEntry!557) t!12505) tb!3317))

(declare-fun result!6169 () Bool)

(assert (=> tb!3317 (= result!6169 tp_is_empty!10855)))

(assert (=> b!419768 t!12505))

(declare-fun b_and!17257 () Bool)

(assert (= b_and!17255 (and (=> t!12505 result!6169) b_and!17257)))

(declare-fun m!408867 () Bool)

(assert (=> start!39422 m!408867))

(declare-fun m!408869 () Bool)

(assert (=> start!39422 m!408869))

(declare-fun m!408871 () Bool)

(assert (=> b!419771 m!408871))

(declare-fun m!408873 () Bool)

(assert (=> b!419758 m!408873))

(declare-fun m!408875 () Bool)

(assert (=> b!419760 m!408875))

(declare-fun m!408877 () Bool)

(assert (=> b!419767 m!408877))

(declare-fun m!408879 () Bool)

(assert (=> mapNonEmpty!17904 m!408879))

(declare-fun m!408881 () Bool)

(assert (=> bm!29260 m!408881))

(declare-fun m!408883 () Bool)

(assert (=> b!419768 m!408883))

(declare-fun m!408885 () Bool)

(assert (=> b!419768 m!408885))

(declare-fun m!408887 () Bool)

(assert (=> b!419768 m!408887))

(declare-fun m!408889 () Bool)

(assert (=> b!419768 m!408889))

(declare-fun m!408891 () Bool)

(assert (=> b!419768 m!408891))

(declare-fun m!408893 () Bool)

(assert (=> b!419768 m!408893))

(declare-fun m!408895 () Bool)

(assert (=> b!419768 m!408895))

(assert (=> b!419768 m!408895))

(declare-fun m!408897 () Bool)

(assert (=> b!419768 m!408897))

(declare-fun m!408899 () Bool)

(assert (=> b!419768 m!408899))

(declare-fun m!408901 () Bool)

(assert (=> b!419768 m!408901))

(assert (=> b!419768 m!408891))

(declare-fun m!408903 () Bool)

(assert (=> b!419768 m!408903))

(declare-fun m!408905 () Bool)

(assert (=> b!419768 m!408905))

(assert (=> b!419768 m!408899))

(declare-fun m!408907 () Bool)

(assert (=> b!419768 m!408907))

(declare-fun m!408909 () Bool)

(assert (=> b!419755 m!408909))

(declare-fun m!408911 () Bool)

(assert (=> b!419772 m!408911))

(declare-fun m!408913 () Bool)

(assert (=> b!419772 m!408913))

(declare-fun m!408915 () Bool)

(assert (=> b!419763 m!408915))

(assert (=> b!419763 m!408915))

(declare-fun m!408917 () Bool)

(assert (=> b!419763 m!408917))

(declare-fun m!408919 () Bool)

(assert (=> b!419763 m!408919))

(declare-fun m!408921 () Bool)

(assert (=> b!419770 m!408921))

(assert (=> b!419770 m!408905))

(declare-fun m!408923 () Bool)

(assert (=> b!419770 m!408923))

(declare-fun m!408925 () Bool)

(assert (=> b!419757 m!408925))

(declare-fun m!408927 () Bool)

(assert (=> b!419764 m!408927))

(declare-fun m!408929 () Bool)

(assert (=> bm!29259 m!408929))

(declare-fun m!408931 () Bool)

(assert (=> b!419773 m!408931))

(check-sat (not b!419773) (not bm!29259) (not mapNonEmpty!17904) tp_is_empty!10855 (not b!419772) (not bm!29260) (not b!419770) (not b!419771) (not b_lambda!8989) b_and!17257 (not b!419767) (not start!39422) (not b!419764) (not b_next!9703) (not b!419768) (not b!419758) (not b!419763) (not b!419757) (not b!419755))
(check-sat b_and!17257 (not b_next!9703))
