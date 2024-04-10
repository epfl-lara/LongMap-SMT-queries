; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84742 () Bool)

(assert start!84742)

(declare-fun b_free!20097 () Bool)

(declare-fun b_next!20097 () Bool)

(assert (=> start!84742 (= b_free!20097 (not b_next!20097))))

(declare-fun tp!70090 () Bool)

(declare-fun b_and!32269 () Bool)

(assert (=> start!84742 (= tp!70090 b_and!32269)))

(declare-fun res!662566 () Bool)

(declare-fun e!558826 () Bool)

(assert (=> start!84742 (=> (not res!662566) (not e!558826))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84742 (= res!662566 (validMask!0 mask!1948))))

(assert (=> start!84742 e!558826))

(assert (=> start!84742 true))

(declare-fun tp_is_empty!23313 () Bool)

(assert (=> start!84742 tp_is_empty!23313))

(declare-datatypes ((V!36067 0))(
  ( (V!36068 (val!11707 Int)) )
))
(declare-datatypes ((ValueCell!11175 0))(
  ( (ValueCellFull!11175 (v!14280 V!36067)) (EmptyCell!11175) )
))
(declare-datatypes ((array!62589 0))(
  ( (array!62590 (arr!30145 (Array (_ BitVec 32) ValueCell!11175)) (size!30624 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62589)

(declare-fun e!558827 () Bool)

(declare-fun array_inv!23279 (array!62589) Bool)

(assert (=> start!84742 (and (array_inv!23279 _values!1278) e!558827)))

(assert (=> start!84742 tp!70090))

(declare-datatypes ((array!62591 0))(
  ( (array!62592 (arr!30146 (Array (_ BitVec 32) (_ BitVec 64))) (size!30625 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62591)

(declare-fun array_inv!23280 (array!62591) Bool)

(assert (=> start!84742 (array_inv!23280 _keys!1544)))

(declare-fun b!991010 () Bool)

(declare-fun res!662570 () Bool)

(assert (=> b!991010 (=> (not res!662570) (not e!558826))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!991010 (= res!662570 (and (= (size!30624 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30625 _keys!1544) (size!30624 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!991011 () Bool)

(declare-fun res!662569 () Bool)

(assert (=> b!991011 (=> (not res!662569) (not e!558826))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991011 (= res!662569 (validKeyInArray!0 (select (arr!30146 _keys!1544) from!1932)))))

(declare-fun b!991012 () Bool)

(declare-fun e!558824 () Bool)

(assert (=> b!991012 (= e!558826 e!558824)))

(declare-fun res!662567 () Bool)

(assert (=> b!991012 (=> (not res!662567) (not e!558824))))

(declare-fun lt!439712 () Bool)

(assert (=> b!991012 (= res!662567 (and (or lt!439712 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439712 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439712))))))

(assert (=> b!991012 (= lt!439712 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!991013 () Bool)

(declare-fun res!662565 () Bool)

(assert (=> b!991013 (=> (not res!662565) (not e!558826))))

(assert (=> b!991013 (= res!662565 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30625 _keys!1544))))))

(declare-fun mapNonEmpty!37022 () Bool)

(declare-fun mapRes!37022 () Bool)

(declare-fun tp!70089 () Bool)

(declare-fun e!558822 () Bool)

(assert (=> mapNonEmpty!37022 (= mapRes!37022 (and tp!70089 e!558822))))

(declare-fun mapRest!37022 () (Array (_ BitVec 32) ValueCell!11175))

(declare-fun mapValue!37022 () ValueCell!11175)

(declare-fun mapKey!37022 () (_ BitVec 32))

(assert (=> mapNonEmpty!37022 (= (arr!30145 _values!1278) (store mapRest!37022 mapKey!37022 mapValue!37022))))

(declare-fun b!991014 () Bool)

(declare-fun res!662568 () Bool)

(assert (=> b!991014 (=> (not res!662568) (not e!558826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62591 (_ BitVec 32)) Bool)

(assert (=> b!991014 (= res!662568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!37022 () Bool)

(assert (=> mapIsEmpty!37022 mapRes!37022))

(declare-fun b!991015 () Bool)

(declare-fun e!558825 () Bool)

(assert (=> b!991015 (= e!558827 (and e!558825 mapRes!37022))))

(declare-fun condMapEmpty!37022 () Bool)

(declare-fun mapDefault!37022 () ValueCell!11175)

(assert (=> b!991015 (= condMapEmpty!37022 (= (arr!30145 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11175)) mapDefault!37022)))))

(declare-fun b!991016 () Bool)

(assert (=> b!991016 (= e!558825 tp_is_empty!23313)))

(declare-fun b!991017 () Bool)

(declare-fun res!662571 () Bool)

(assert (=> b!991017 (=> (not res!662571) (not e!558826))))

(declare-datatypes ((List!20857 0))(
  ( (Nil!20854) (Cons!20853 (h!22015 (_ BitVec 64)) (t!29838 List!20857)) )
))
(declare-fun arrayNoDuplicates!0 (array!62591 (_ BitVec 32) List!20857) Bool)

(assert (=> b!991017 (= res!662571 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20854))))

(declare-fun b!991018 () Bool)

(assert (=> b!991018 (= e!558822 tp_is_empty!23313)))

(declare-fun minValue!1220 () V!36067)

(declare-fun b!991019 () Bool)

(declare-fun zeroValue!1220 () V!36067)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14930 0))(
  ( (tuple2!14931 (_1!7476 (_ BitVec 64)) (_2!7476 V!36067)) )
))
(declare-datatypes ((List!20858 0))(
  ( (Nil!20855) (Cons!20854 (h!22016 tuple2!14930) (t!29839 List!20858)) )
))
(declare-datatypes ((ListLongMap!13627 0))(
  ( (ListLongMap!13628 (toList!6829 List!20858)) )
))
(declare-fun getCurrentListMap!3879 (array!62591 array!62589 (_ BitVec 32) (_ BitVec 32) V!36067 V!36067 (_ BitVec 32) Int) ListLongMap!13627)

(declare-fun +!3095 (ListLongMap!13627 tuple2!14930) ListLongMap!13627)

(declare-fun get!15652 (ValueCell!11175 V!36067) V!36067)

(declare-fun dynLambda!1876 (Int (_ BitVec 64)) V!36067)

(assert (=> b!991019 (= e!558824 (not (= (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3095 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and start!84742 res!662566) b!991010))

(assert (= (and b!991010 res!662570) b!991014))

(assert (= (and b!991014 res!662568) b!991017))

(assert (= (and b!991017 res!662571) b!991013))

(assert (= (and b!991013 res!662565) b!991011))

(assert (= (and b!991011 res!662569) b!991012))

(assert (= (and b!991012 res!662567) b!991019))

(assert (= (and b!991015 condMapEmpty!37022) mapIsEmpty!37022))

(assert (= (and b!991015 (not condMapEmpty!37022)) mapNonEmpty!37022))

(get-info :version)

(assert (= (and mapNonEmpty!37022 ((_ is ValueCellFull!11175) mapValue!37022)) b!991018))

(assert (= (and b!991015 ((_ is ValueCellFull!11175) mapDefault!37022)) b!991016))

(assert (= start!84742 b!991015))

(declare-fun b_lambda!15199 () Bool)

(assert (=> (not b_lambda!15199) (not b!991019)))

(declare-fun t!29837 () Bool)

(declare-fun tb!6831 () Bool)

(assert (=> (and start!84742 (= defaultEntry!1281 defaultEntry!1281) t!29837) tb!6831))

(declare-fun result!13665 () Bool)

(assert (=> tb!6831 (= result!13665 tp_is_empty!23313)))

(assert (=> b!991019 t!29837))

(declare-fun b_and!32271 () Bool)

(assert (= b_and!32269 (and (=> t!29837 result!13665) b_and!32271)))

(declare-fun m!918757 () Bool)

(assert (=> b!991019 m!918757))

(declare-fun m!918759 () Bool)

(assert (=> b!991019 m!918759))

(declare-fun m!918761 () Bool)

(assert (=> b!991019 m!918761))

(assert (=> b!991019 m!918761))

(declare-fun m!918763 () Bool)

(assert (=> b!991019 m!918763))

(declare-fun m!918765 () Bool)

(assert (=> b!991019 m!918765))

(declare-fun m!918767 () Bool)

(assert (=> b!991019 m!918767))

(assert (=> b!991019 m!918759))

(assert (=> b!991019 m!918767))

(declare-fun m!918769 () Bool)

(assert (=> b!991019 m!918769))

(declare-fun m!918771 () Bool)

(assert (=> start!84742 m!918771))

(declare-fun m!918773 () Bool)

(assert (=> start!84742 m!918773))

(declare-fun m!918775 () Bool)

(assert (=> start!84742 m!918775))

(assert (=> b!991011 m!918757))

(assert (=> b!991011 m!918757))

(declare-fun m!918777 () Bool)

(assert (=> b!991011 m!918777))

(declare-fun m!918779 () Bool)

(assert (=> mapNonEmpty!37022 m!918779))

(declare-fun m!918781 () Bool)

(assert (=> b!991017 m!918781))

(declare-fun m!918783 () Bool)

(assert (=> b!991014 m!918783))

(check-sat (not b!991017) (not b!991011) (not b_lambda!15199) (not b_next!20097) (not mapNonEmpty!37022) tp_is_empty!23313 (not start!84742) (not b!991019) (not b!991014) b_and!32271)
(check-sat b_and!32271 (not b_next!20097))
(get-model)

(declare-fun b_lambda!15203 () Bool)

(assert (= b_lambda!15199 (or (and start!84742 b_free!20097) b_lambda!15203)))

(check-sat (not b!991017) (not b!991011) (not b_next!20097) (not mapNonEmpty!37022) tp_is_empty!23313 (not start!84742) (not b_lambda!15203) (not b!991019) (not b!991014) b_and!32271)
(check-sat b_and!32271 (not b_next!20097))
(get-model)

(declare-fun d!117785 () Bool)

(assert (=> d!117785 (= (validKeyInArray!0 (select (arr!30146 _keys!1544) from!1932)) (and (not (= (select (arr!30146 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30146 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991011 d!117785))

(declare-fun b!991062 () Bool)

(declare-fun e!558852 () Bool)

(declare-fun e!558853 () Bool)

(assert (=> b!991062 (= e!558852 e!558853)))

(declare-fun lt!439724 () (_ BitVec 64))

(assert (=> b!991062 (= lt!439724 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32881 0))(
  ( (Unit!32882) )
))
(declare-fun lt!439722 () Unit!32881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62591 (_ BitVec 64) (_ BitVec 32)) Unit!32881)

(assert (=> b!991062 (= lt!439722 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439724 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991062 (arrayContainsKey!0 _keys!1544 lt!439724 #b00000000000000000000000000000000)))

(declare-fun lt!439723 () Unit!32881)

(assert (=> b!991062 (= lt!439723 lt!439722)))

(declare-fun res!662597 () Bool)

(declare-datatypes ((SeekEntryResult!9213 0))(
  ( (MissingZero!9213 (index!39223 (_ BitVec 32))) (Found!9213 (index!39224 (_ BitVec 32))) (Intermediate!9213 (undefined!10025 Bool) (index!39225 (_ BitVec 32)) (x!86231 (_ BitVec 32))) (Undefined!9213) (MissingVacant!9213 (index!39226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62591 (_ BitVec 32)) SeekEntryResult!9213)

(assert (=> b!991062 (= res!662597 (= (seekEntryOrOpen!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9213 #b00000000000000000000000000000000)))))

(assert (=> b!991062 (=> (not res!662597) (not e!558853))))

(declare-fun bm!42024 () Bool)

(declare-fun call!42027 () Bool)

(assert (=> bm!42024 (= call!42027 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!991063 () Bool)

(assert (=> b!991063 (= e!558853 call!42027)))

(declare-fun b!991065 () Bool)

(assert (=> b!991065 (= e!558852 call!42027)))

(declare-fun b!991064 () Bool)

(declare-fun e!558854 () Bool)

(assert (=> b!991064 (= e!558854 e!558852)))

(declare-fun c!100535 () Bool)

(assert (=> b!991064 (= c!100535 (validKeyInArray!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117787 () Bool)

(declare-fun res!662598 () Bool)

(assert (=> d!117787 (=> res!662598 e!558854)))

(assert (=> d!117787 (= res!662598 (bvsge #b00000000000000000000000000000000 (size!30625 _keys!1544)))))

(assert (=> d!117787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558854)))

(assert (= (and d!117787 (not res!662598)) b!991064))

(assert (= (and b!991064 c!100535) b!991062))

(assert (= (and b!991064 (not c!100535)) b!991065))

(assert (= (and b!991062 res!662597) b!991063))

(assert (= (or b!991063 b!991065) bm!42024))

(declare-fun m!918813 () Bool)

(assert (=> b!991062 m!918813))

(declare-fun m!918815 () Bool)

(assert (=> b!991062 m!918815))

(declare-fun m!918817 () Bool)

(assert (=> b!991062 m!918817))

(assert (=> b!991062 m!918813))

(declare-fun m!918819 () Bool)

(assert (=> b!991062 m!918819))

(declare-fun m!918821 () Bool)

(assert (=> bm!42024 m!918821))

(assert (=> b!991064 m!918813))

(assert (=> b!991064 m!918813))

(declare-fun m!918823 () Bool)

(assert (=> b!991064 m!918823))

(assert (=> b!991014 d!117787))

(declare-fun b!991108 () Bool)

(declare-fun e!558886 () Unit!32881)

(declare-fun lt!439780 () Unit!32881)

(assert (=> b!991108 (= e!558886 lt!439780)))

(declare-fun lt!439774 () ListLongMap!13627)

(declare-fun getCurrentListMapNoExtraKeys!3512 (array!62591 array!62589 (_ BitVec 32) (_ BitVec 32) V!36067 V!36067 (_ BitVec 32) Int) ListLongMap!13627)

(assert (=> b!991108 (= lt!439774 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439777 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439775 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439775 (select (arr!30146 _keys!1544) from!1932))))

(declare-fun lt!439782 () Unit!32881)

(declare-fun addStillContains!617 (ListLongMap!13627 (_ BitVec 64) V!36067 (_ BitVec 64)) Unit!32881)

(assert (=> b!991108 (= lt!439782 (addStillContains!617 lt!439774 lt!439777 zeroValue!1220 lt!439775))))

(declare-fun contains!5726 (ListLongMap!13627 (_ BitVec 64)) Bool)

(assert (=> b!991108 (contains!5726 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220)) lt!439775)))

(declare-fun lt!439786 () Unit!32881)

(assert (=> b!991108 (= lt!439786 lt!439782)))

(declare-fun lt!439773 () ListLongMap!13627)

(assert (=> b!991108 (= lt!439773 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439788 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439788 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439776 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439776 (select (arr!30146 _keys!1544) from!1932))))

(declare-fun lt!439784 () Unit!32881)

(declare-fun addApplyDifferent!477 (ListLongMap!13627 (_ BitVec 64) V!36067 (_ BitVec 64)) Unit!32881)

(assert (=> b!991108 (= lt!439784 (addApplyDifferent!477 lt!439773 lt!439788 minValue!1220 lt!439776))))

(declare-fun apply!898 (ListLongMap!13627 (_ BitVec 64)) V!36067)

(assert (=> b!991108 (= (apply!898 (+!3095 lt!439773 (tuple2!14931 lt!439788 minValue!1220)) lt!439776) (apply!898 lt!439773 lt!439776))))

(declare-fun lt!439772 () Unit!32881)

(assert (=> b!991108 (= lt!439772 lt!439784)))

(declare-fun lt!439769 () ListLongMap!13627)

(assert (=> b!991108 (= lt!439769 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439771 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439787 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439787 (select (arr!30146 _keys!1544) from!1932))))

(declare-fun lt!439789 () Unit!32881)

(assert (=> b!991108 (= lt!439789 (addApplyDifferent!477 lt!439769 lt!439771 zeroValue!1220 lt!439787))))

(assert (=> b!991108 (= (apply!898 (+!3095 lt!439769 (tuple2!14931 lt!439771 zeroValue!1220)) lt!439787) (apply!898 lt!439769 lt!439787))))

(declare-fun lt!439770 () Unit!32881)

(assert (=> b!991108 (= lt!439770 lt!439789)))

(declare-fun lt!439785 () ListLongMap!13627)

(assert (=> b!991108 (= lt!439785 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439781 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439781 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439783 () (_ BitVec 64))

(assert (=> b!991108 (= lt!439783 (select (arr!30146 _keys!1544) from!1932))))

(assert (=> b!991108 (= lt!439780 (addApplyDifferent!477 lt!439785 lt!439781 minValue!1220 lt!439783))))

(assert (=> b!991108 (= (apply!898 (+!3095 lt!439785 (tuple2!14931 lt!439781 minValue!1220)) lt!439783) (apply!898 lt!439785 lt!439783))))

(declare-fun b!991109 () Bool)

(declare-fun e!558885 () ListLongMap!13627)

(declare-fun e!558890 () ListLongMap!13627)

(assert (=> b!991109 (= e!558885 e!558890)))

(declare-fun c!100553 () Bool)

(assert (=> b!991109 (= c!100553 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991110 () Bool)

(declare-fun c!100552 () Bool)

(assert (=> b!991110 (= c!100552 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!558892 () ListLongMap!13627)

(assert (=> b!991110 (= e!558890 e!558892)))

(declare-fun b!991111 () Bool)

(declare-fun call!42045 () ListLongMap!13627)

(assert (=> b!991111 (= e!558885 (+!3095 call!42045 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!991112 () Bool)

(declare-fun res!662619 () Bool)

(declare-fun e!558891 () Bool)

(assert (=> b!991112 (=> (not res!662619) (not e!558891))))

(declare-fun e!558884 () Bool)

(assert (=> b!991112 (= res!662619 e!558884)))

(declare-fun c!100548 () Bool)

(assert (=> b!991112 (= c!100548 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!991113 () Bool)

(declare-fun e!558881 () Bool)

(assert (=> b!991113 (= e!558881 (validKeyInArray!0 (select (arr!30146 _keys!1544) from!1932)))))

(declare-fun b!991114 () Bool)

(declare-fun e!558882 () Bool)

(assert (=> b!991114 (= e!558882 (validKeyInArray!0 (select (arr!30146 _keys!1544) from!1932)))))

(declare-fun call!42048 () ListLongMap!13627)

(declare-fun bm!42039 () Bool)

(assert (=> bm!42039 (= call!42048 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun b!991115 () Bool)

(declare-fun e!558887 () Bool)

(assert (=> b!991115 (= e!558891 e!558887)))

(declare-fun c!100549 () Bool)

(assert (=> b!991115 (= c!100549 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991116 () Bool)

(declare-fun call!42044 () ListLongMap!13627)

(assert (=> b!991116 (= e!558892 call!42044)))

(declare-fun bm!42040 () Bool)

(declare-fun call!42043 () ListLongMap!13627)

(assert (=> bm!42040 (= call!42044 call!42043)))

(declare-fun b!991117 () Bool)

(declare-fun e!558889 () Bool)

(declare-fun lt!439790 () ListLongMap!13627)

(assert (=> b!991117 (= e!558889 (= (apply!898 lt!439790 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!991118 () Bool)

(declare-fun e!558888 () Bool)

(assert (=> b!991118 (= e!558884 e!558888)))

(declare-fun res!662618 () Bool)

(declare-fun call!42046 () Bool)

(assert (=> b!991118 (= res!662618 call!42046)))

(assert (=> b!991118 (=> (not res!662618) (not e!558888))))

(declare-fun b!991119 () Bool)

(declare-fun call!42047 () ListLongMap!13627)

(assert (=> b!991119 (= e!558890 call!42047)))

(declare-fun bm!42041 () Bool)

(assert (=> bm!42041 (= call!42046 (contains!5726 lt!439790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!100551 () Bool)

(declare-fun bm!42042 () Bool)

(assert (=> bm!42042 (= call!42045 (+!3095 (ite c!100551 call!42048 (ite c!100553 call!42043 call!42044)) (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!42043 () Bool)

(declare-fun call!42042 () Bool)

(assert (=> bm!42043 (= call!42042 (contains!5726 lt!439790 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991120 () Bool)

(assert (=> b!991120 (= e!558884 (not call!42046))))

(declare-fun b!991121 () Bool)

(declare-fun e!558893 () Bool)

(declare-fun e!558883 () Bool)

(assert (=> b!991121 (= e!558893 e!558883)))

(declare-fun res!662625 () Bool)

(assert (=> b!991121 (=> (not res!662625) (not e!558883))))

(assert (=> b!991121 (= res!662625 (contains!5726 lt!439790 (select (arr!30146 _keys!1544) from!1932)))))

(assert (=> b!991121 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30625 _keys!1544)))))

(declare-fun d!117789 () Bool)

(assert (=> d!117789 e!558891))

(declare-fun res!662621 () Bool)

(assert (=> d!117789 (=> (not res!662621) (not e!558891))))

(assert (=> d!117789 (= res!662621 (or (bvsge from!1932 (size!30625 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30625 _keys!1544)))))))

(declare-fun lt!439779 () ListLongMap!13627)

(assert (=> d!117789 (= lt!439790 lt!439779)))

(declare-fun lt!439778 () Unit!32881)

(assert (=> d!117789 (= lt!439778 e!558886)))

(declare-fun c!100550 () Bool)

(assert (=> d!117789 (= c!100550 e!558881)))

(declare-fun res!662623 () Bool)

(assert (=> d!117789 (=> (not res!662623) (not e!558881))))

(assert (=> d!117789 (= res!662623 (bvslt from!1932 (size!30625 _keys!1544)))))

(assert (=> d!117789 (= lt!439779 e!558885)))

(assert (=> d!117789 (= c!100551 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117789 (validMask!0 mask!1948)))

(assert (=> d!117789 (= (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439790)))

(declare-fun b!991122 () Bool)

(assert (=> b!991122 (= e!558883 (= (apply!898 lt!439790 (select (arr!30146 _keys!1544) from!1932)) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991122 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _values!1278)))))

(assert (=> b!991122 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30625 _keys!1544)))))

(declare-fun b!991123 () Bool)

(assert (=> b!991123 (= e!558887 e!558889)))

(declare-fun res!662617 () Bool)

(assert (=> b!991123 (= res!662617 call!42042)))

(assert (=> b!991123 (=> (not res!662617) (not e!558889))))

(declare-fun b!991124 () Bool)

(assert (=> b!991124 (= e!558888 (= (apply!898 lt!439790 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun bm!42044 () Bool)

(assert (=> bm!42044 (= call!42047 call!42045)))

(declare-fun bm!42045 () Bool)

(assert (=> bm!42045 (= call!42043 call!42048)))

(declare-fun b!991125 () Bool)

(declare-fun Unit!32883 () Unit!32881)

(assert (=> b!991125 (= e!558886 Unit!32883)))

(declare-fun b!991126 () Bool)

(declare-fun res!662622 () Bool)

(assert (=> b!991126 (=> (not res!662622) (not e!558891))))

(assert (=> b!991126 (= res!662622 e!558893)))

(declare-fun res!662620 () Bool)

(assert (=> b!991126 (=> res!662620 e!558893)))

(assert (=> b!991126 (= res!662620 (not e!558882))))

(declare-fun res!662624 () Bool)

(assert (=> b!991126 (=> (not res!662624) (not e!558882))))

(assert (=> b!991126 (= res!662624 (bvslt from!1932 (size!30625 _keys!1544)))))

(declare-fun b!991127 () Bool)

(assert (=> b!991127 (= e!558892 call!42047)))

(declare-fun b!991128 () Bool)

(assert (=> b!991128 (= e!558887 (not call!42042))))

(assert (= (and d!117789 c!100551) b!991111))

(assert (= (and d!117789 (not c!100551)) b!991109))

(assert (= (and b!991109 c!100553) b!991119))

(assert (= (and b!991109 (not c!100553)) b!991110))

(assert (= (and b!991110 c!100552) b!991127))

(assert (= (and b!991110 (not c!100552)) b!991116))

(assert (= (or b!991127 b!991116) bm!42040))

(assert (= (or b!991119 bm!42040) bm!42045))

(assert (= (or b!991119 b!991127) bm!42044))

(assert (= (or b!991111 bm!42045) bm!42039))

(assert (= (or b!991111 bm!42044) bm!42042))

(assert (= (and d!117789 res!662623) b!991113))

(assert (= (and d!117789 c!100550) b!991108))

(assert (= (and d!117789 (not c!100550)) b!991125))

(assert (= (and d!117789 res!662621) b!991126))

(assert (= (and b!991126 res!662624) b!991114))

(assert (= (and b!991126 (not res!662620)) b!991121))

(assert (= (and b!991121 res!662625) b!991122))

(assert (= (and b!991126 res!662622) b!991112))

(assert (= (and b!991112 c!100548) b!991118))

(assert (= (and b!991112 (not c!100548)) b!991120))

(assert (= (and b!991118 res!662618) b!991124))

(assert (= (or b!991118 b!991120) bm!42041))

(assert (= (and b!991112 res!662619) b!991115))

(assert (= (and b!991115 c!100549) b!991123))

(assert (= (and b!991115 (not c!100549)) b!991128))

(assert (= (and b!991123 res!662617) b!991117))

(assert (= (or b!991123 b!991128) bm!42043))

(declare-fun b_lambda!15205 () Bool)

(assert (=> (not b_lambda!15205) (not b!991122)))

(assert (=> b!991122 t!29837))

(declare-fun b_and!32277 () Bool)

(assert (= b_and!32271 (and (=> t!29837 result!13665) b_and!32277)))

(declare-fun m!918825 () Bool)

(assert (=> b!991111 m!918825))

(assert (=> b!991122 m!918757))

(declare-fun m!918827 () Bool)

(assert (=> b!991122 m!918827))

(assert (=> b!991122 m!918757))

(assert (=> b!991122 m!918767))

(assert (=> b!991122 m!918759))

(assert (=> b!991122 m!918759))

(assert (=> b!991122 m!918767))

(assert (=> b!991122 m!918769))

(assert (=> b!991113 m!918757))

(assert (=> b!991113 m!918757))

(assert (=> b!991113 m!918777))

(declare-fun m!918829 () Bool)

(assert (=> bm!42041 m!918829))

(declare-fun m!918831 () Bool)

(assert (=> bm!42043 m!918831))

(declare-fun m!918833 () Bool)

(assert (=> bm!42042 m!918833))

(declare-fun m!918835 () Bool)

(assert (=> b!991124 m!918835))

(assert (=> d!117789 m!918771))

(declare-fun m!918837 () Bool)

(assert (=> b!991117 m!918837))

(assert (=> b!991114 m!918757))

(assert (=> b!991114 m!918757))

(assert (=> b!991114 m!918777))

(declare-fun m!918839 () Bool)

(assert (=> bm!42039 m!918839))

(assert (=> b!991121 m!918757))

(assert (=> b!991121 m!918757))

(declare-fun m!918841 () Bool)

(assert (=> b!991121 m!918841))

(declare-fun m!918843 () Bool)

(assert (=> b!991108 m!918843))

(declare-fun m!918845 () Bool)

(assert (=> b!991108 m!918845))

(declare-fun m!918847 () Bool)

(assert (=> b!991108 m!918847))

(declare-fun m!918849 () Bool)

(assert (=> b!991108 m!918849))

(declare-fun m!918851 () Bool)

(assert (=> b!991108 m!918851))

(assert (=> b!991108 m!918839))

(assert (=> b!991108 m!918757))

(declare-fun m!918853 () Bool)

(assert (=> b!991108 m!918853))

(assert (=> b!991108 m!918847))

(declare-fun m!918855 () Bool)

(assert (=> b!991108 m!918855))

(declare-fun m!918857 () Bool)

(assert (=> b!991108 m!918857))

(assert (=> b!991108 m!918857))

(declare-fun m!918859 () Bool)

(assert (=> b!991108 m!918859))

(declare-fun m!918861 () Bool)

(assert (=> b!991108 m!918861))

(declare-fun m!918863 () Bool)

(assert (=> b!991108 m!918863))

(declare-fun m!918865 () Bool)

(assert (=> b!991108 m!918865))

(assert (=> b!991108 m!918861))

(declare-fun m!918867 () Bool)

(assert (=> b!991108 m!918867))

(declare-fun m!918869 () Bool)

(assert (=> b!991108 m!918869))

(assert (=> b!991108 m!918869))

(declare-fun m!918871 () Bool)

(assert (=> b!991108 m!918871))

(assert (=> b!991019 d!117789))

(declare-fun d!117791 () Bool)

(declare-fun e!558896 () Bool)

(assert (=> d!117791 e!558896))

(declare-fun res!662631 () Bool)

(assert (=> d!117791 (=> (not res!662631) (not e!558896))))

(declare-fun lt!439800 () ListLongMap!13627)

(assert (=> d!117791 (= res!662631 (contains!5726 lt!439800 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439802 () List!20858)

(assert (=> d!117791 (= lt!439800 (ListLongMap!13628 lt!439802))))

(declare-fun lt!439801 () Unit!32881)

(declare-fun lt!439799 () Unit!32881)

(assert (=> d!117791 (= lt!439801 lt!439799)))

(declare-datatypes ((Option!521 0))(
  ( (Some!520 (v!14282 V!36067)) (None!519) )
))
(declare-fun getValueByKey!515 (List!20858 (_ BitVec 64)) Option!521)

(assert (=> d!117791 (= (getValueByKey!515 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!520 (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!274 (List!20858 (_ BitVec 64) V!36067) Unit!32881)

(assert (=> d!117791 (= lt!439799 (lemmaContainsTupThenGetReturnValue!274 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!331 (List!20858 (_ BitVec 64) V!36067) List!20858)

(assert (=> d!117791 (= lt!439802 (insertStrictlySorted!331 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117791 (= (+!3095 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439800)))

(declare-fun b!991133 () Bool)

(declare-fun res!662630 () Bool)

(assert (=> b!991133 (=> (not res!662630) (not e!558896))))

(assert (=> b!991133 (= res!662630 (= (getValueByKey!515 (toList!6829 lt!439800) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!520 (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!991134 () Bool)

(declare-fun contains!5727 (List!20858 tuple2!14930) Bool)

(assert (=> b!991134 (= e!558896 (contains!5727 (toList!6829 lt!439800) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117791 res!662631) b!991133))

(assert (= (and b!991133 res!662630) b!991134))

(declare-fun m!918873 () Bool)

(assert (=> d!117791 m!918873))

(declare-fun m!918875 () Bool)

(assert (=> d!117791 m!918875))

(declare-fun m!918877 () Bool)

(assert (=> d!117791 m!918877))

(declare-fun m!918879 () Bool)

(assert (=> d!117791 m!918879))

(declare-fun m!918881 () Bool)

(assert (=> b!991133 m!918881))

(declare-fun m!918883 () Bool)

(assert (=> b!991134 m!918883))

(assert (=> b!991019 d!117791))

(declare-fun b!991135 () Bool)

(declare-fun e!558902 () Unit!32881)

(declare-fun lt!439814 () Unit!32881)

(assert (=> b!991135 (= e!558902 lt!439814)))

(declare-fun lt!439808 () ListLongMap!13627)

(assert (=> b!991135 (= lt!439808 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439811 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439809 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439809 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439816 () Unit!32881)

(assert (=> b!991135 (= lt!439816 (addStillContains!617 lt!439808 lt!439811 zeroValue!1220 lt!439809))))

(assert (=> b!991135 (contains!5726 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220)) lt!439809)))

(declare-fun lt!439820 () Unit!32881)

(assert (=> b!991135 (= lt!439820 lt!439816)))

(declare-fun lt!439807 () ListLongMap!13627)

(assert (=> b!991135 (= lt!439807 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439822 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439822 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439810 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439810 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439818 () Unit!32881)

(assert (=> b!991135 (= lt!439818 (addApplyDifferent!477 lt!439807 lt!439822 minValue!1220 lt!439810))))

(assert (=> b!991135 (= (apply!898 (+!3095 lt!439807 (tuple2!14931 lt!439822 minValue!1220)) lt!439810) (apply!898 lt!439807 lt!439810))))

(declare-fun lt!439806 () Unit!32881)

(assert (=> b!991135 (= lt!439806 lt!439818)))

(declare-fun lt!439803 () ListLongMap!13627)

(assert (=> b!991135 (= lt!439803 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439805 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439821 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439821 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439823 () Unit!32881)

(assert (=> b!991135 (= lt!439823 (addApplyDifferent!477 lt!439803 lt!439805 zeroValue!1220 lt!439821))))

(assert (=> b!991135 (= (apply!898 (+!3095 lt!439803 (tuple2!14931 lt!439805 zeroValue!1220)) lt!439821) (apply!898 lt!439803 lt!439821))))

(declare-fun lt!439804 () Unit!32881)

(assert (=> b!991135 (= lt!439804 lt!439823)))

(declare-fun lt!439819 () ListLongMap!13627)

(assert (=> b!991135 (= lt!439819 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439815 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439815 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439817 () (_ BitVec 64))

(assert (=> b!991135 (= lt!439817 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!991135 (= lt!439814 (addApplyDifferent!477 lt!439819 lt!439815 minValue!1220 lt!439817))))

(assert (=> b!991135 (= (apply!898 (+!3095 lt!439819 (tuple2!14931 lt!439815 minValue!1220)) lt!439817) (apply!898 lt!439819 lt!439817))))

(declare-fun b!991136 () Bool)

(declare-fun e!558901 () ListLongMap!13627)

(declare-fun e!558906 () ListLongMap!13627)

(assert (=> b!991136 (= e!558901 e!558906)))

(declare-fun c!100559 () Bool)

(assert (=> b!991136 (= c!100559 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991137 () Bool)

(declare-fun c!100558 () Bool)

(assert (=> b!991137 (= c!100558 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!558908 () ListLongMap!13627)

(assert (=> b!991137 (= e!558906 e!558908)))

(declare-fun b!991138 () Bool)

(declare-fun call!42052 () ListLongMap!13627)

(assert (=> b!991138 (= e!558901 (+!3095 call!42052 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!991139 () Bool)

(declare-fun res!662634 () Bool)

(declare-fun e!558907 () Bool)

(assert (=> b!991139 (=> (not res!662634) (not e!558907))))

(declare-fun e!558900 () Bool)

(assert (=> b!991139 (= res!662634 e!558900)))

(declare-fun c!100554 () Bool)

(assert (=> b!991139 (= c!100554 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!991140 () Bool)

(declare-fun e!558897 () Bool)

(assert (=> b!991140 (= e!558897 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991141 () Bool)

(declare-fun e!558898 () Bool)

(assert (=> b!991141 (= e!558898 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun bm!42046 () Bool)

(declare-fun call!42055 () ListLongMap!13627)

(assert (=> bm!42046 (= call!42055 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!991142 () Bool)

(declare-fun e!558903 () Bool)

(assert (=> b!991142 (= e!558907 e!558903)))

(declare-fun c!100555 () Bool)

(assert (=> b!991142 (= c!100555 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991143 () Bool)

(declare-fun call!42051 () ListLongMap!13627)

(assert (=> b!991143 (= e!558908 call!42051)))

(declare-fun bm!42047 () Bool)

(declare-fun call!42050 () ListLongMap!13627)

(assert (=> bm!42047 (= call!42051 call!42050)))

(declare-fun b!991144 () Bool)

(declare-fun e!558905 () Bool)

(declare-fun lt!439824 () ListLongMap!13627)

(assert (=> b!991144 (= e!558905 (= (apply!898 lt!439824 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!991145 () Bool)

(declare-fun e!558904 () Bool)

(assert (=> b!991145 (= e!558900 e!558904)))

(declare-fun res!662633 () Bool)

(declare-fun call!42053 () Bool)

(assert (=> b!991145 (= res!662633 call!42053)))

(assert (=> b!991145 (=> (not res!662633) (not e!558904))))

(declare-fun b!991146 () Bool)

(declare-fun call!42054 () ListLongMap!13627)

(assert (=> b!991146 (= e!558906 call!42054)))

(declare-fun bm!42048 () Bool)

(assert (=> bm!42048 (= call!42053 (contains!5726 lt!439824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!100557 () Bool)

(declare-fun bm!42049 () Bool)

(assert (=> bm!42049 (= call!42052 (+!3095 (ite c!100557 call!42055 (ite c!100559 call!42050 call!42051)) (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!42050 () Bool)

(declare-fun call!42049 () Bool)

(assert (=> bm!42050 (= call!42049 (contains!5726 lt!439824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991147 () Bool)

(assert (=> b!991147 (= e!558900 (not call!42053))))

(declare-fun b!991148 () Bool)

(declare-fun e!558909 () Bool)

(declare-fun e!558899 () Bool)

(assert (=> b!991148 (= e!558909 e!558899)))

(declare-fun res!662640 () Bool)

(assert (=> b!991148 (=> (not res!662640) (not e!558899))))

(assert (=> b!991148 (= res!662640 (contains!5726 lt!439824 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991148 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(declare-fun d!117793 () Bool)

(assert (=> d!117793 e!558907))

(declare-fun res!662636 () Bool)

(assert (=> d!117793 (=> (not res!662636) (not e!558907))))

(assert (=> d!117793 (= res!662636 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))))

(declare-fun lt!439813 () ListLongMap!13627)

(assert (=> d!117793 (= lt!439824 lt!439813)))

(declare-fun lt!439812 () Unit!32881)

(assert (=> d!117793 (= lt!439812 e!558902)))

(declare-fun c!100556 () Bool)

(assert (=> d!117793 (= c!100556 e!558897)))

(declare-fun res!662638 () Bool)

(assert (=> d!117793 (=> (not res!662638) (not e!558897))))

(assert (=> d!117793 (= res!662638 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(assert (=> d!117793 (= lt!439813 e!558901)))

(assert (=> d!117793 (= c!100557 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117793 (validMask!0 mask!1948)))

(assert (=> d!117793 (= (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439824)))

(declare-fun b!991149 () Bool)

(assert (=> b!991149 (= e!558899 (= (apply!898 lt!439824 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15652 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _values!1278)))))

(assert (=> b!991149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(declare-fun b!991150 () Bool)

(assert (=> b!991150 (= e!558903 e!558905)))

(declare-fun res!662632 () Bool)

(assert (=> b!991150 (= res!662632 call!42049)))

(assert (=> b!991150 (=> (not res!662632) (not e!558905))))

(declare-fun b!991151 () Bool)

(assert (=> b!991151 (= e!558904 (= (apply!898 lt!439824 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun bm!42051 () Bool)

(assert (=> bm!42051 (= call!42054 call!42052)))

(declare-fun bm!42052 () Bool)

(assert (=> bm!42052 (= call!42050 call!42055)))

(declare-fun b!991152 () Bool)

(declare-fun Unit!32884 () Unit!32881)

(assert (=> b!991152 (= e!558902 Unit!32884)))

(declare-fun b!991153 () Bool)

(declare-fun res!662637 () Bool)

(assert (=> b!991153 (=> (not res!662637) (not e!558907))))

(assert (=> b!991153 (= res!662637 e!558909)))

(declare-fun res!662635 () Bool)

(assert (=> b!991153 (=> res!662635 e!558909)))

(assert (=> b!991153 (= res!662635 (not e!558898))))

(declare-fun res!662639 () Bool)

(assert (=> b!991153 (=> (not res!662639) (not e!558898))))

(assert (=> b!991153 (= res!662639 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(declare-fun b!991154 () Bool)

(assert (=> b!991154 (= e!558908 call!42054)))

(declare-fun b!991155 () Bool)

(assert (=> b!991155 (= e!558903 (not call!42049))))

(assert (= (and d!117793 c!100557) b!991138))

(assert (= (and d!117793 (not c!100557)) b!991136))

(assert (= (and b!991136 c!100559) b!991146))

(assert (= (and b!991136 (not c!100559)) b!991137))

(assert (= (and b!991137 c!100558) b!991154))

(assert (= (and b!991137 (not c!100558)) b!991143))

(assert (= (or b!991154 b!991143) bm!42047))

(assert (= (or b!991146 bm!42047) bm!42052))

(assert (= (or b!991146 b!991154) bm!42051))

(assert (= (or b!991138 bm!42052) bm!42046))

(assert (= (or b!991138 bm!42051) bm!42049))

(assert (= (and d!117793 res!662638) b!991140))

(assert (= (and d!117793 c!100556) b!991135))

(assert (= (and d!117793 (not c!100556)) b!991152))

(assert (= (and d!117793 res!662636) b!991153))

(assert (= (and b!991153 res!662639) b!991141))

(assert (= (and b!991153 (not res!662635)) b!991148))

(assert (= (and b!991148 res!662640) b!991149))

(assert (= (and b!991153 res!662637) b!991139))

(assert (= (and b!991139 c!100554) b!991145))

(assert (= (and b!991139 (not c!100554)) b!991147))

(assert (= (and b!991145 res!662633) b!991151))

(assert (= (or b!991145 b!991147) bm!42048))

(assert (= (and b!991139 res!662634) b!991142))

(assert (= (and b!991142 c!100555) b!991150))

(assert (= (and b!991142 (not c!100555)) b!991155))

(assert (= (and b!991150 res!662632) b!991144))

(assert (= (or b!991150 b!991155) bm!42050))

(declare-fun b_lambda!15207 () Bool)

(assert (=> (not b_lambda!15207) (not b!991149)))

(assert (=> b!991149 t!29837))

(declare-fun b_and!32279 () Bool)

(assert (= b_and!32277 (and (=> t!29837 result!13665) b_and!32279)))

(declare-fun m!918885 () Bool)

(assert (=> b!991138 m!918885))

(declare-fun m!918887 () Bool)

(assert (=> b!991149 m!918887))

(declare-fun m!918889 () Bool)

(assert (=> b!991149 m!918889))

(assert (=> b!991149 m!918887))

(assert (=> b!991149 m!918767))

(declare-fun m!918891 () Bool)

(assert (=> b!991149 m!918891))

(assert (=> b!991149 m!918891))

(assert (=> b!991149 m!918767))

(declare-fun m!918893 () Bool)

(assert (=> b!991149 m!918893))

(assert (=> b!991140 m!918887))

(assert (=> b!991140 m!918887))

(declare-fun m!918895 () Bool)

(assert (=> b!991140 m!918895))

(declare-fun m!918897 () Bool)

(assert (=> bm!42048 m!918897))

(declare-fun m!918899 () Bool)

(assert (=> bm!42050 m!918899))

(declare-fun m!918901 () Bool)

(assert (=> bm!42049 m!918901))

(declare-fun m!918903 () Bool)

(assert (=> b!991151 m!918903))

(assert (=> d!117793 m!918771))

(declare-fun m!918905 () Bool)

(assert (=> b!991144 m!918905))

(assert (=> b!991141 m!918887))

(assert (=> b!991141 m!918887))

(assert (=> b!991141 m!918895))

(declare-fun m!918907 () Bool)

(assert (=> bm!42046 m!918907))

(assert (=> b!991148 m!918887))

(assert (=> b!991148 m!918887))

(declare-fun m!918909 () Bool)

(assert (=> b!991148 m!918909))

(declare-fun m!918911 () Bool)

(assert (=> b!991135 m!918911))

(declare-fun m!918913 () Bool)

(assert (=> b!991135 m!918913))

(declare-fun m!918915 () Bool)

(assert (=> b!991135 m!918915))

(declare-fun m!918917 () Bool)

(assert (=> b!991135 m!918917))

(declare-fun m!918919 () Bool)

(assert (=> b!991135 m!918919))

(assert (=> b!991135 m!918907))

(assert (=> b!991135 m!918887))

(declare-fun m!918921 () Bool)

(assert (=> b!991135 m!918921))

(assert (=> b!991135 m!918915))

(declare-fun m!918923 () Bool)

(assert (=> b!991135 m!918923))

(declare-fun m!918925 () Bool)

(assert (=> b!991135 m!918925))

(assert (=> b!991135 m!918925))

(declare-fun m!918927 () Bool)

(assert (=> b!991135 m!918927))

(declare-fun m!918929 () Bool)

(assert (=> b!991135 m!918929))

(declare-fun m!918931 () Bool)

(assert (=> b!991135 m!918931))

(declare-fun m!918933 () Bool)

(assert (=> b!991135 m!918933))

(assert (=> b!991135 m!918929))

(declare-fun m!918935 () Bool)

(assert (=> b!991135 m!918935))

(declare-fun m!918937 () Bool)

(assert (=> b!991135 m!918937))

(assert (=> b!991135 m!918937))

(declare-fun m!918939 () Bool)

(assert (=> b!991135 m!918939))

(assert (=> b!991019 d!117793))

(declare-fun d!117795 () Bool)

(declare-fun c!100562 () Bool)

(assert (=> d!117795 (= c!100562 ((_ is ValueCellFull!11175) (select (arr!30145 _values!1278) from!1932)))))

(declare-fun e!558912 () V!36067)

(assert (=> d!117795 (= (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558912)))

(declare-fun b!991160 () Bool)

(declare-fun get!15654 (ValueCell!11175 V!36067) V!36067)

(assert (=> b!991160 (= e!558912 (get!15654 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991161 () Bool)

(declare-fun get!15655 (ValueCell!11175 V!36067) V!36067)

(assert (=> b!991161 (= e!558912 (get!15655 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117795 c!100562) b!991160))

(assert (= (and d!117795 (not c!100562)) b!991161))

(assert (=> b!991160 m!918759))

(assert (=> b!991160 m!918767))

(declare-fun m!918941 () Bool)

(assert (=> b!991160 m!918941))

(assert (=> b!991161 m!918759))

(assert (=> b!991161 m!918767))

(declare-fun m!918943 () Bool)

(assert (=> b!991161 m!918943))

(assert (=> b!991019 d!117795))

(declare-fun b!991172 () Bool)

(declare-fun e!558924 () Bool)

(declare-fun call!42058 () Bool)

(assert (=> b!991172 (= e!558924 call!42058)))

(declare-fun b!991173 () Bool)

(declare-fun e!558922 () Bool)

(assert (=> b!991173 (= e!558922 e!558924)))

(declare-fun c!100565 () Bool)

(assert (=> b!991173 (= c!100565 (validKeyInArray!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117797 () Bool)

(declare-fun res!662647 () Bool)

(declare-fun e!558923 () Bool)

(assert (=> d!117797 (=> res!662647 e!558923)))

(assert (=> d!117797 (= res!662647 (bvsge #b00000000000000000000000000000000 (size!30625 _keys!1544)))))

(assert (=> d!117797 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20854) e!558923)))

(declare-fun b!991174 () Bool)

(assert (=> b!991174 (= e!558923 e!558922)))

(declare-fun res!662648 () Bool)

(assert (=> b!991174 (=> (not res!662648) (not e!558922))))

(declare-fun e!558921 () Bool)

(assert (=> b!991174 (= res!662648 (not e!558921))))

(declare-fun res!662649 () Bool)

(assert (=> b!991174 (=> (not res!662649) (not e!558921))))

(assert (=> b!991174 (= res!662649 (validKeyInArray!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991175 () Bool)

(assert (=> b!991175 (= e!558924 call!42058)))

(declare-fun b!991176 () Bool)

(declare-fun contains!5728 (List!20857 (_ BitVec 64)) Bool)

(assert (=> b!991176 (= e!558921 (contains!5728 Nil!20854 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!42055 () Bool)

(assert (=> bm!42055 (= call!42058 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100565 (Cons!20853 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) Nil!20854) Nil!20854)))))

(assert (= (and d!117797 (not res!662647)) b!991174))

(assert (= (and b!991174 res!662649) b!991176))

(assert (= (and b!991174 res!662648) b!991173))

(assert (= (and b!991173 c!100565) b!991172))

(assert (= (and b!991173 (not c!100565)) b!991175))

(assert (= (or b!991172 b!991175) bm!42055))

(assert (=> b!991173 m!918813))

(assert (=> b!991173 m!918813))

(assert (=> b!991173 m!918823))

(assert (=> b!991174 m!918813))

(assert (=> b!991174 m!918813))

(assert (=> b!991174 m!918823))

(assert (=> b!991176 m!918813))

(assert (=> b!991176 m!918813))

(declare-fun m!918945 () Bool)

(assert (=> b!991176 m!918945))

(assert (=> bm!42055 m!918813))

(declare-fun m!918947 () Bool)

(assert (=> bm!42055 m!918947))

(assert (=> b!991017 d!117797))

(declare-fun d!117799 () Bool)

(assert (=> d!117799 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84742 d!117799))

(declare-fun d!117801 () Bool)

(assert (=> d!117801 (= (array_inv!23279 _values!1278) (bvsge (size!30624 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84742 d!117801))

(declare-fun d!117803 () Bool)

(assert (=> d!117803 (= (array_inv!23280 _keys!1544) (bvsge (size!30625 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84742 d!117803))

(declare-fun b!991184 () Bool)

(declare-fun e!558929 () Bool)

(assert (=> b!991184 (= e!558929 tp_is_empty!23313)))

(declare-fun mapIsEmpty!37028 () Bool)

(declare-fun mapRes!37028 () Bool)

(assert (=> mapIsEmpty!37028 mapRes!37028))

(declare-fun b!991183 () Bool)

(declare-fun e!558930 () Bool)

(assert (=> b!991183 (= e!558930 tp_is_empty!23313)))

(declare-fun mapNonEmpty!37028 () Bool)

(declare-fun tp!70099 () Bool)

(assert (=> mapNonEmpty!37028 (= mapRes!37028 (and tp!70099 e!558930))))

(declare-fun mapKey!37028 () (_ BitVec 32))

(declare-fun mapValue!37028 () ValueCell!11175)

(declare-fun mapRest!37028 () (Array (_ BitVec 32) ValueCell!11175))

(assert (=> mapNonEmpty!37028 (= mapRest!37022 (store mapRest!37028 mapKey!37028 mapValue!37028))))

(declare-fun condMapEmpty!37028 () Bool)

(declare-fun mapDefault!37028 () ValueCell!11175)

(assert (=> mapNonEmpty!37022 (= condMapEmpty!37028 (= mapRest!37022 ((as const (Array (_ BitVec 32) ValueCell!11175)) mapDefault!37028)))))

(assert (=> mapNonEmpty!37022 (= tp!70089 (and e!558929 mapRes!37028))))

(assert (= (and mapNonEmpty!37022 condMapEmpty!37028) mapIsEmpty!37028))

(assert (= (and mapNonEmpty!37022 (not condMapEmpty!37028)) mapNonEmpty!37028))

(assert (= (and mapNonEmpty!37028 ((_ is ValueCellFull!11175) mapValue!37028)) b!991183))

(assert (= (and mapNonEmpty!37022 ((_ is ValueCellFull!11175) mapDefault!37028)) b!991184))

(declare-fun m!918949 () Bool)

(assert (=> mapNonEmpty!37028 m!918949))

(declare-fun b_lambda!15209 () Bool)

(assert (= b_lambda!15207 (or (and start!84742 b_free!20097) b_lambda!15209)))

(declare-fun b_lambda!15211 () Bool)

(assert (= b_lambda!15205 (or (and start!84742 b_free!20097) b_lambda!15211)))

(check-sat (not bm!42048) (not b_lambda!15211) (not b!991176) (not b_next!20097) (not b!991122) (not b_lambda!15209) (not b!991113) (not b!991144) (not b!991149) (not bm!42046) (not bm!42043) (not b!991148) (not b!991114) (not b!991064) (not b!991151) (not bm!42039) (not b!991174) (not b!991124) (not b!991117) (not d!117791) (not b!991133) (not b!991062) (not b!991173) b_and!32279 (not bm!42041) (not b!991121) (not b!991141) tp_is_empty!23313 (not b!991140) (not b!991134) (not b!991111) (not bm!42055) (not b!991135) (not b!991160) (not bm!42049) (not b!991138) (not bm!42024) (not bm!42050) (not b_lambda!15203) (not d!117789) (not bm!42042) (not d!117793) (not mapNonEmpty!37028) (not b!991161) (not b!991108))
(check-sat b_and!32279 (not b_next!20097))
(get-model)

(declare-fun d!117805 () Bool)

(declare-fun get!15656 (Option!521) V!36067)

(assert (=> d!117805 (= (apply!898 lt!439790 (select (arr!30146 _keys!1544) from!1932)) (get!15656 (getValueByKey!515 (toList!6829 lt!439790) (select (arr!30146 _keys!1544) from!1932))))))

(declare-fun bs!28153 () Bool)

(assert (= bs!28153 d!117805))

(assert (=> bs!28153 m!918757))

(declare-fun m!918951 () Bool)

(assert (=> bs!28153 m!918951))

(assert (=> bs!28153 m!918951))

(declare-fun m!918953 () Bool)

(assert (=> bs!28153 m!918953))

(assert (=> b!991122 d!117805))

(assert (=> b!991122 d!117795))

(declare-fun d!117807 () Bool)

(assert (=> d!117807 (= (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991141 d!117807))

(assert (=> d!117793 d!117799))

(assert (=> b!991140 d!117807))

(declare-fun d!117809 () Bool)

(declare-fun e!558936 () Bool)

(assert (=> d!117809 e!558936))

(declare-fun res!662652 () Bool)

(assert (=> d!117809 (=> res!662652 e!558936)))

(declare-fun lt!439836 () Bool)

(assert (=> d!117809 (= res!662652 (not lt!439836))))

(declare-fun lt!439833 () Bool)

(assert (=> d!117809 (= lt!439836 lt!439833)))

(declare-fun lt!439834 () Unit!32881)

(declare-fun e!558935 () Unit!32881)

(assert (=> d!117809 (= lt!439834 e!558935)))

(declare-fun c!100568 () Bool)

(assert (=> d!117809 (= c!100568 lt!439833)))

(declare-fun containsKey!480 (List!20858 (_ BitVec 64)) Bool)

(assert (=> d!117809 (= lt!439833 (containsKey!480 (toList!6829 lt!439790) (select (arr!30146 _keys!1544) from!1932)))))

(assert (=> d!117809 (= (contains!5726 lt!439790 (select (arr!30146 _keys!1544) from!1932)) lt!439836)))

(declare-fun b!991191 () Bool)

(declare-fun lt!439835 () Unit!32881)

(assert (=> b!991191 (= e!558935 lt!439835)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!376 (List!20858 (_ BitVec 64)) Unit!32881)

(assert (=> b!991191 (= lt!439835 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439790) (select (arr!30146 _keys!1544) from!1932)))))

(declare-fun isDefined!385 (Option!521) Bool)

(assert (=> b!991191 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439790) (select (arr!30146 _keys!1544) from!1932)))))

(declare-fun b!991192 () Bool)

(declare-fun Unit!32885 () Unit!32881)

(assert (=> b!991192 (= e!558935 Unit!32885)))

(declare-fun b!991193 () Bool)

(assert (=> b!991193 (= e!558936 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439790) (select (arr!30146 _keys!1544) from!1932))))))

(assert (= (and d!117809 c!100568) b!991191))

(assert (= (and d!117809 (not c!100568)) b!991192))

(assert (= (and d!117809 (not res!662652)) b!991193))

(assert (=> d!117809 m!918757))

(declare-fun m!918955 () Bool)

(assert (=> d!117809 m!918955))

(assert (=> b!991191 m!918757))

(declare-fun m!918957 () Bool)

(assert (=> b!991191 m!918957))

(assert (=> b!991191 m!918757))

(assert (=> b!991191 m!918951))

(assert (=> b!991191 m!918951))

(declare-fun m!918959 () Bool)

(assert (=> b!991191 m!918959))

(assert (=> b!991193 m!918757))

(assert (=> b!991193 m!918951))

(assert (=> b!991193 m!918951))

(assert (=> b!991193 m!918959))

(assert (=> b!991121 d!117809))

(assert (=> d!117789 d!117799))

(declare-fun d!117811 () Bool)

(declare-fun e!558937 () Bool)

(assert (=> d!117811 e!558937))

(declare-fun res!662654 () Bool)

(assert (=> d!117811 (=> (not res!662654) (not e!558937))))

(declare-fun lt!439838 () ListLongMap!13627)

(assert (=> d!117811 (= res!662654 (contains!5726 lt!439838 (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439840 () List!20858)

(assert (=> d!117811 (= lt!439838 (ListLongMap!13628 lt!439840))))

(declare-fun lt!439839 () Unit!32881)

(declare-fun lt!439837 () Unit!32881)

(assert (=> d!117811 (= lt!439839 lt!439837)))

(assert (=> d!117811 (= (getValueByKey!515 lt!439840 (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117811 (= lt!439837 (lemmaContainsTupThenGetReturnValue!274 lt!439840 (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117811 (= lt!439840 (insertStrictlySorted!331 (toList!6829 call!42052) (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117811 (= (+!3095 call!42052 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439838)))

(declare-fun b!991194 () Bool)

(declare-fun res!662653 () Bool)

(assert (=> b!991194 (=> (not res!662653) (not e!558937))))

(assert (=> b!991194 (= res!662653 (= (getValueByKey!515 (toList!6829 lt!439838) (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991195 () Bool)

(assert (=> b!991195 (= e!558937 (contains!5727 (toList!6829 lt!439838) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117811 res!662654) b!991194))

(assert (= (and b!991194 res!662653) b!991195))

(declare-fun m!918961 () Bool)

(assert (=> d!117811 m!918961))

(declare-fun m!918963 () Bool)

(assert (=> d!117811 m!918963))

(declare-fun m!918965 () Bool)

(assert (=> d!117811 m!918965))

(declare-fun m!918967 () Bool)

(assert (=> d!117811 m!918967))

(declare-fun m!918969 () Bool)

(assert (=> b!991194 m!918969))

(declare-fun m!918971 () Bool)

(assert (=> b!991195 m!918971))

(assert (=> b!991138 d!117811))

(declare-fun d!117813 () Bool)

(declare-fun e!558939 () Bool)

(assert (=> d!117813 e!558939))

(declare-fun res!662655 () Bool)

(assert (=> d!117813 (=> res!662655 e!558939)))

(declare-fun lt!439844 () Bool)

(assert (=> d!117813 (= res!662655 (not lt!439844))))

(declare-fun lt!439841 () Bool)

(assert (=> d!117813 (= lt!439844 lt!439841)))

(declare-fun lt!439842 () Unit!32881)

(declare-fun e!558938 () Unit!32881)

(assert (=> d!117813 (= lt!439842 e!558938)))

(declare-fun c!100569 () Bool)

(assert (=> d!117813 (= c!100569 lt!439841)))

(assert (=> d!117813 (= lt!439841 (containsKey!480 (toList!6829 lt!439790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117813 (= (contains!5726 lt!439790 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439844)))

(declare-fun b!991196 () Bool)

(declare-fun lt!439843 () Unit!32881)

(assert (=> b!991196 (= e!558938 lt!439843)))

(assert (=> b!991196 (= lt!439843 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991196 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991197 () Bool)

(declare-fun Unit!32886 () Unit!32881)

(assert (=> b!991197 (= e!558938 Unit!32886)))

(declare-fun b!991198 () Bool)

(assert (=> b!991198 (= e!558939 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117813 c!100569) b!991196))

(assert (= (and d!117813 (not c!100569)) b!991197))

(assert (= (and d!117813 (not res!662655)) b!991198))

(declare-fun m!918973 () Bool)

(assert (=> d!117813 m!918973))

(declare-fun m!918975 () Bool)

(assert (=> b!991196 m!918975))

(declare-fun m!918977 () Bool)

(assert (=> b!991196 m!918977))

(assert (=> b!991196 m!918977))

(declare-fun m!918979 () Bool)

(assert (=> b!991196 m!918979))

(assert (=> b!991198 m!918977))

(assert (=> b!991198 m!918977))

(assert (=> b!991198 m!918979))

(assert (=> bm!42043 d!117813))

(declare-fun d!117815 () Bool)

(declare-fun e!558941 () Bool)

(assert (=> d!117815 e!558941))

(declare-fun res!662656 () Bool)

(assert (=> d!117815 (=> res!662656 e!558941)))

(declare-fun lt!439848 () Bool)

(assert (=> d!117815 (= res!662656 (not lt!439848))))

(declare-fun lt!439845 () Bool)

(assert (=> d!117815 (= lt!439848 lt!439845)))

(declare-fun lt!439846 () Unit!32881)

(declare-fun e!558940 () Unit!32881)

(assert (=> d!117815 (= lt!439846 e!558940)))

(declare-fun c!100570 () Bool)

(assert (=> d!117815 (= c!100570 lt!439845)))

(assert (=> d!117815 (= lt!439845 (containsKey!480 (toList!6829 lt!439800) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117815 (= (contains!5726 lt!439800 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!439848)))

(declare-fun b!991199 () Bool)

(declare-fun lt!439847 () Unit!32881)

(assert (=> b!991199 (= e!558940 lt!439847)))

(assert (=> b!991199 (= lt!439847 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439800) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!991199 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439800) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!991200 () Bool)

(declare-fun Unit!32887 () Unit!32881)

(assert (=> b!991200 (= e!558940 Unit!32887)))

(declare-fun b!991201 () Bool)

(assert (=> b!991201 (= e!558941 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439800) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!117815 c!100570) b!991199))

(assert (= (and d!117815 (not c!100570)) b!991200))

(assert (= (and d!117815 (not res!662656)) b!991201))

(declare-fun m!918981 () Bool)

(assert (=> d!117815 m!918981))

(declare-fun m!918983 () Bool)

(assert (=> b!991199 m!918983))

(assert (=> b!991199 m!918881))

(assert (=> b!991199 m!918881))

(declare-fun m!918985 () Bool)

(assert (=> b!991199 m!918985))

(assert (=> b!991201 m!918881))

(assert (=> b!991201 m!918881))

(assert (=> b!991201 m!918985))

(assert (=> d!117791 d!117815))

(declare-fun b!991211 () Bool)

(declare-fun e!558946 () Option!521)

(declare-fun e!558947 () Option!521)

(assert (=> b!991211 (= e!558946 e!558947)))

(declare-fun c!100576 () Bool)

(assert (=> b!991211 (= c!100576 (and ((_ is Cons!20854) lt!439802) (not (= (_1!7476 (h!22016 lt!439802)) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!991213 () Bool)

(assert (=> b!991213 (= e!558947 None!519)))

(declare-fun b!991210 () Bool)

(assert (=> b!991210 (= e!558946 (Some!520 (_2!7476 (h!22016 lt!439802))))))

(declare-fun c!100575 () Bool)

(declare-fun d!117817 () Bool)

(assert (=> d!117817 (= c!100575 (and ((_ is Cons!20854) lt!439802) (= (_1!7476 (h!22016 lt!439802)) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!117817 (= (getValueByKey!515 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!558946)))

(declare-fun b!991212 () Bool)

(assert (=> b!991212 (= e!558947 (getValueByKey!515 (t!29839 lt!439802) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!117817 c!100575) b!991210))

(assert (= (and d!117817 (not c!100575)) b!991211))

(assert (= (and b!991211 c!100576) b!991212))

(assert (= (and b!991211 (not c!100576)) b!991213))

(declare-fun m!918987 () Bool)

(assert (=> b!991212 m!918987))

(assert (=> d!117791 d!117817))

(declare-fun d!117819 () Bool)

(assert (=> d!117819 (= (getValueByKey!515 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!520 (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439851 () Unit!32881)

(declare-fun choose!1620 (List!20858 (_ BitVec 64) V!36067) Unit!32881)

(assert (=> d!117819 (= lt!439851 (choose!1620 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!558950 () Bool)

(assert (=> d!117819 e!558950))

(declare-fun res!662661 () Bool)

(assert (=> d!117819 (=> (not res!662661) (not e!558950))))

(declare-fun isStrictlySorted!518 (List!20858) Bool)

(assert (=> d!117819 (= res!662661 (isStrictlySorted!518 lt!439802))))

(assert (=> d!117819 (= (lemmaContainsTupThenGetReturnValue!274 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!439851)))

(declare-fun b!991218 () Bool)

(declare-fun res!662662 () Bool)

(assert (=> b!991218 (=> (not res!662662) (not e!558950))))

(assert (=> b!991218 (= res!662662 (containsKey!480 lt!439802 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!991219 () Bool)

(assert (=> b!991219 (= e!558950 (contains!5727 lt!439802 (tuple2!14931 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!117819 res!662661) b!991218))

(assert (= (and b!991218 res!662662) b!991219))

(assert (=> d!117819 m!918875))

(declare-fun m!918989 () Bool)

(assert (=> d!117819 m!918989))

(declare-fun m!918991 () Bool)

(assert (=> d!117819 m!918991))

(declare-fun m!918993 () Bool)

(assert (=> b!991218 m!918993))

(declare-fun m!918995 () Bool)

(assert (=> b!991219 m!918995))

(assert (=> d!117791 d!117819))

(declare-fun e!558964 () List!20858)

(declare-fun b!991240 () Bool)

(assert (=> b!991240 (= e!558964 (insertStrictlySorted!331 (t!29839 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun call!42067 () List!20858)

(declare-fun bm!42062 () Bool)

(declare-fun c!100585 () Bool)

(declare-fun $colon$colon!557 (List!20858 tuple2!14930) List!20858)

(assert (=> bm!42062 (= call!42067 ($colon$colon!557 e!558964 (ite c!100585 (h!22016 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14931 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!100588 () Bool)

(assert (=> bm!42062 (= c!100588 c!100585)))

(declare-fun b!991241 () Bool)

(declare-fun lt!439854 () List!20858)

(declare-fun e!558965 () Bool)

(assert (=> b!991241 (= e!558965 (contains!5727 lt!439854 (tuple2!14931 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!117821 () Bool)

(assert (=> d!117821 e!558965))

(declare-fun res!662668 () Bool)

(assert (=> d!117821 (=> (not res!662668) (not e!558965))))

(assert (=> d!117821 (= res!662668 (isStrictlySorted!518 lt!439854))))

(declare-fun e!558961 () List!20858)

(assert (=> d!117821 (= lt!439854 e!558961)))

(assert (=> d!117821 (= c!100585 (and ((_ is Cons!20854) (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7476 (h!22016 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!117821 (isStrictlySorted!518 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117821 (= (insertStrictlySorted!331 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!439854)))

(declare-fun b!991242 () Bool)

(declare-fun e!558963 () List!20858)

(declare-fun call!42066 () List!20858)

(assert (=> b!991242 (= e!558963 call!42066)))

(declare-fun c!100586 () Bool)

(declare-fun c!100587 () Bool)

(declare-fun b!991243 () Bool)

(assert (=> b!991243 (= e!558964 (ite c!100586 (t!29839 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100587 (Cons!20854 (h!22016 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29839 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20855)))))

(declare-fun b!991244 () Bool)

(declare-fun e!558962 () List!20858)

(declare-fun call!42065 () List!20858)

(assert (=> b!991244 (= e!558962 call!42065)))

(declare-fun b!991245 () Bool)

(assert (=> b!991245 (= c!100587 (and ((_ is Cons!20854) (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7476 (h!22016 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!991245 (= e!558962 e!558963)))

(declare-fun b!991246 () Bool)

(declare-fun res!662667 () Bool)

(assert (=> b!991246 (=> (not res!662667) (not e!558965))))

(assert (=> b!991246 (= res!662667 (containsKey!480 lt!439854 (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!991247 () Bool)

(assert (=> b!991247 (= e!558963 call!42066)))

(declare-fun bm!42063 () Bool)

(assert (=> bm!42063 (= call!42065 call!42067)))

(declare-fun bm!42064 () Bool)

(assert (=> bm!42064 (= call!42066 call!42065)))

(declare-fun b!991248 () Bool)

(assert (=> b!991248 (= e!558961 call!42067)))

(declare-fun b!991249 () Bool)

(assert (=> b!991249 (= e!558961 e!558962)))

(assert (=> b!991249 (= c!100586 (and ((_ is Cons!20854) (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7476 (h!22016 (toList!6829 (getCurrentListMap!3879 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!117821 c!100585) b!991248))

(assert (= (and d!117821 (not c!100585)) b!991249))

(assert (= (and b!991249 c!100586) b!991244))

(assert (= (and b!991249 (not c!100586)) b!991245))

(assert (= (and b!991245 c!100587) b!991242))

(assert (= (and b!991245 (not c!100587)) b!991247))

(assert (= (or b!991242 b!991247) bm!42064))

(assert (= (or b!991244 bm!42064) bm!42063))

(assert (= (or b!991248 bm!42063) bm!42062))

(assert (= (and bm!42062 c!100588) b!991240))

(assert (= (and bm!42062 (not c!100588)) b!991243))

(assert (= (and d!117821 res!662668) b!991246))

(assert (= (and b!991246 res!662667) b!991241))

(declare-fun m!918997 () Bool)

(assert (=> d!117821 m!918997))

(declare-fun m!918999 () Bool)

(assert (=> d!117821 m!918999))

(declare-fun m!919001 () Bool)

(assert (=> b!991240 m!919001))

(declare-fun m!919003 () Bool)

(assert (=> bm!42062 m!919003))

(declare-fun m!919005 () Bool)

(assert (=> b!991246 m!919005))

(declare-fun m!919007 () Bool)

(assert (=> b!991241 m!919007))

(assert (=> d!117791 d!117821))

(declare-fun d!117823 () Bool)

(declare-fun e!558966 () Bool)

(assert (=> d!117823 e!558966))

(declare-fun res!662670 () Bool)

(assert (=> d!117823 (=> (not res!662670) (not e!558966))))

(declare-fun lt!439856 () ListLongMap!13627)

(assert (=> d!117823 (= res!662670 (contains!5726 lt!439856 (_1!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439858 () List!20858)

(assert (=> d!117823 (= lt!439856 (ListLongMap!13628 lt!439858))))

(declare-fun lt!439857 () Unit!32881)

(declare-fun lt!439855 () Unit!32881)

(assert (=> d!117823 (= lt!439857 lt!439855)))

(assert (=> d!117823 (= (getValueByKey!515 lt!439858 (_1!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117823 (= lt!439855 (lemmaContainsTupThenGetReturnValue!274 lt!439858 (_1!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117823 (= lt!439858 (insertStrictlySorted!331 (toList!6829 (ite c!100551 call!42048 (ite c!100553 call!42043 call!42044))) (_1!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117823 (= (+!3095 (ite c!100551 call!42048 (ite c!100553 call!42043 call!42044)) (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439856)))

(declare-fun b!991250 () Bool)

(declare-fun res!662669 () Bool)

(assert (=> b!991250 (=> (not res!662669) (not e!558966))))

(assert (=> b!991250 (= res!662669 (= (getValueByKey!515 (toList!6829 lt!439856) (_1!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7476 (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!991251 () Bool)

(assert (=> b!991251 (= e!558966 (contains!5727 (toList!6829 lt!439856) (ite (or c!100551 c!100553) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117823 res!662670) b!991250))

(assert (= (and b!991250 res!662669) b!991251))

(declare-fun m!919009 () Bool)

(assert (=> d!117823 m!919009))

(declare-fun m!919011 () Bool)

(assert (=> d!117823 m!919011))

(declare-fun m!919013 () Bool)

(assert (=> d!117823 m!919013))

(declare-fun m!919015 () Bool)

(assert (=> d!117823 m!919015))

(declare-fun m!919017 () Bool)

(assert (=> b!991250 m!919017))

(declare-fun m!919019 () Bool)

(assert (=> b!991251 m!919019))

(assert (=> bm!42042 d!117823))

(declare-fun d!117825 () Bool)

(assert (=> d!117825 (= (apply!898 (+!3095 lt!439819 (tuple2!14931 lt!439815 minValue!1220)) lt!439817) (get!15656 (getValueByKey!515 (toList!6829 (+!3095 lt!439819 (tuple2!14931 lt!439815 minValue!1220))) lt!439817)))))

(declare-fun bs!28154 () Bool)

(assert (= bs!28154 d!117825))

(declare-fun m!919021 () Bool)

(assert (=> bs!28154 m!919021))

(assert (=> bs!28154 m!919021))

(declare-fun m!919023 () Bool)

(assert (=> bs!28154 m!919023))

(assert (=> b!991135 d!117825))

(declare-fun d!117827 () Bool)

(declare-fun e!558967 () Bool)

(assert (=> d!117827 e!558967))

(declare-fun res!662672 () Bool)

(assert (=> d!117827 (=> (not res!662672) (not e!558967))))

(declare-fun lt!439860 () ListLongMap!13627)

(assert (=> d!117827 (= res!662672 (contains!5726 lt!439860 (_1!7476 (tuple2!14931 lt!439815 minValue!1220))))))

(declare-fun lt!439862 () List!20858)

(assert (=> d!117827 (= lt!439860 (ListLongMap!13628 lt!439862))))

(declare-fun lt!439861 () Unit!32881)

(declare-fun lt!439859 () Unit!32881)

(assert (=> d!117827 (= lt!439861 lt!439859)))

(assert (=> d!117827 (= (getValueByKey!515 lt!439862 (_1!7476 (tuple2!14931 lt!439815 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439815 minValue!1220))))))

(assert (=> d!117827 (= lt!439859 (lemmaContainsTupThenGetReturnValue!274 lt!439862 (_1!7476 (tuple2!14931 lt!439815 minValue!1220)) (_2!7476 (tuple2!14931 lt!439815 minValue!1220))))))

(assert (=> d!117827 (= lt!439862 (insertStrictlySorted!331 (toList!6829 lt!439819) (_1!7476 (tuple2!14931 lt!439815 minValue!1220)) (_2!7476 (tuple2!14931 lt!439815 minValue!1220))))))

(assert (=> d!117827 (= (+!3095 lt!439819 (tuple2!14931 lt!439815 minValue!1220)) lt!439860)))

(declare-fun b!991252 () Bool)

(declare-fun res!662671 () Bool)

(assert (=> b!991252 (=> (not res!662671) (not e!558967))))

(assert (=> b!991252 (= res!662671 (= (getValueByKey!515 (toList!6829 lt!439860) (_1!7476 (tuple2!14931 lt!439815 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439815 minValue!1220)))))))

(declare-fun b!991253 () Bool)

(assert (=> b!991253 (= e!558967 (contains!5727 (toList!6829 lt!439860) (tuple2!14931 lt!439815 minValue!1220)))))

(assert (= (and d!117827 res!662672) b!991252))

(assert (= (and b!991252 res!662671) b!991253))

(declare-fun m!919025 () Bool)

(assert (=> d!117827 m!919025))

(declare-fun m!919027 () Bool)

(assert (=> d!117827 m!919027))

(declare-fun m!919029 () Bool)

(assert (=> d!117827 m!919029))

(declare-fun m!919031 () Bool)

(assert (=> d!117827 m!919031))

(declare-fun m!919033 () Bool)

(assert (=> b!991252 m!919033))

(declare-fun m!919035 () Bool)

(assert (=> b!991253 m!919035))

(assert (=> b!991135 d!117827))

(declare-fun d!117829 () Bool)

(assert (=> d!117829 (= (apply!898 lt!439807 lt!439810) (get!15656 (getValueByKey!515 (toList!6829 lt!439807) lt!439810)))))

(declare-fun bs!28155 () Bool)

(assert (= bs!28155 d!117829))

(declare-fun m!919037 () Bool)

(assert (=> bs!28155 m!919037))

(assert (=> bs!28155 m!919037))

(declare-fun m!919039 () Bool)

(assert (=> bs!28155 m!919039))

(assert (=> b!991135 d!117829))

(declare-fun d!117831 () Bool)

(declare-fun e!558968 () Bool)

(assert (=> d!117831 e!558968))

(declare-fun res!662674 () Bool)

(assert (=> d!117831 (=> (not res!662674) (not e!558968))))

(declare-fun lt!439864 () ListLongMap!13627)

(assert (=> d!117831 (= res!662674 (contains!5726 lt!439864 (_1!7476 (tuple2!14931 lt!439805 zeroValue!1220))))))

(declare-fun lt!439866 () List!20858)

(assert (=> d!117831 (= lt!439864 (ListLongMap!13628 lt!439866))))

(declare-fun lt!439865 () Unit!32881)

(declare-fun lt!439863 () Unit!32881)

(assert (=> d!117831 (= lt!439865 lt!439863)))

(assert (=> d!117831 (= (getValueByKey!515 lt!439866 (_1!7476 (tuple2!14931 lt!439805 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439805 zeroValue!1220))))))

(assert (=> d!117831 (= lt!439863 (lemmaContainsTupThenGetReturnValue!274 lt!439866 (_1!7476 (tuple2!14931 lt!439805 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439805 zeroValue!1220))))))

(assert (=> d!117831 (= lt!439866 (insertStrictlySorted!331 (toList!6829 lt!439803) (_1!7476 (tuple2!14931 lt!439805 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439805 zeroValue!1220))))))

(assert (=> d!117831 (= (+!3095 lt!439803 (tuple2!14931 lt!439805 zeroValue!1220)) lt!439864)))

(declare-fun b!991254 () Bool)

(declare-fun res!662673 () Bool)

(assert (=> b!991254 (=> (not res!662673) (not e!558968))))

(assert (=> b!991254 (= res!662673 (= (getValueByKey!515 (toList!6829 lt!439864) (_1!7476 (tuple2!14931 lt!439805 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439805 zeroValue!1220)))))))

(declare-fun b!991255 () Bool)

(assert (=> b!991255 (= e!558968 (contains!5727 (toList!6829 lt!439864) (tuple2!14931 lt!439805 zeroValue!1220)))))

(assert (= (and d!117831 res!662674) b!991254))

(assert (= (and b!991254 res!662673) b!991255))

(declare-fun m!919041 () Bool)

(assert (=> d!117831 m!919041))

(declare-fun m!919043 () Bool)

(assert (=> d!117831 m!919043))

(declare-fun m!919045 () Bool)

(assert (=> d!117831 m!919045))

(declare-fun m!919047 () Bool)

(assert (=> d!117831 m!919047))

(declare-fun m!919049 () Bool)

(assert (=> b!991254 m!919049))

(declare-fun m!919051 () Bool)

(assert (=> b!991255 m!919051))

(assert (=> b!991135 d!117831))

(declare-fun d!117833 () Bool)

(assert (=> d!117833 (= (apply!898 (+!3095 lt!439803 (tuple2!14931 lt!439805 zeroValue!1220)) lt!439821) (get!15656 (getValueByKey!515 (toList!6829 (+!3095 lt!439803 (tuple2!14931 lt!439805 zeroValue!1220))) lt!439821)))))

(declare-fun bs!28156 () Bool)

(assert (= bs!28156 d!117833))

(declare-fun m!919053 () Bool)

(assert (=> bs!28156 m!919053))

(assert (=> bs!28156 m!919053))

(declare-fun m!919055 () Bool)

(assert (=> bs!28156 m!919055))

(assert (=> b!991135 d!117833))

(declare-fun d!117835 () Bool)

(assert (=> d!117835 (contains!5726 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220)) lt!439809)))

(declare-fun lt!439869 () Unit!32881)

(declare-fun choose!1621 (ListLongMap!13627 (_ BitVec 64) V!36067 (_ BitVec 64)) Unit!32881)

(assert (=> d!117835 (= lt!439869 (choose!1621 lt!439808 lt!439811 zeroValue!1220 lt!439809))))

(assert (=> d!117835 (contains!5726 lt!439808 lt!439809)))

(assert (=> d!117835 (= (addStillContains!617 lt!439808 lt!439811 zeroValue!1220 lt!439809) lt!439869)))

(declare-fun bs!28157 () Bool)

(assert (= bs!28157 d!117835))

(assert (=> bs!28157 m!918929))

(assert (=> bs!28157 m!918929))

(assert (=> bs!28157 m!918931))

(declare-fun m!919057 () Bool)

(assert (=> bs!28157 m!919057))

(declare-fun m!919059 () Bool)

(assert (=> bs!28157 m!919059))

(assert (=> b!991135 d!117835))

(declare-fun b!991281 () Bool)

(declare-fun e!558983 () Bool)

(declare-fun e!558984 () Bool)

(assert (=> b!991281 (= e!558983 e!558984)))

(declare-fun c!100600 () Bool)

(assert (=> b!991281 (= c!100600 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(declare-fun b!991282 () Bool)

(declare-fun lt!439886 () ListLongMap!13627)

(assert (=> b!991282 (= e!558984 (= lt!439886 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991283 () Bool)

(declare-fun e!558985 () ListLongMap!13627)

(declare-fun e!558989 () ListLongMap!13627)

(assert (=> b!991283 (= e!558985 e!558989)))

(declare-fun c!100599 () Bool)

(assert (=> b!991283 (= c!100599 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991284 () Bool)

(declare-fun e!558988 () Bool)

(assert (=> b!991284 (= e!558988 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991284 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun d!117837 () Bool)

(declare-fun e!558986 () Bool)

(assert (=> d!117837 e!558986))

(declare-fun res!662685 () Bool)

(assert (=> d!117837 (=> (not res!662685) (not e!558986))))

(assert (=> d!117837 (= res!662685 (not (contains!5726 lt!439886 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117837 (= lt!439886 e!558985)))

(declare-fun c!100598 () Bool)

(assert (=> d!117837 (= c!100598 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(assert (=> d!117837 (validMask!0 mask!1948)))

(assert (=> d!117837 (= (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439886)))

(declare-fun b!991285 () Bool)

(assert (=> b!991285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(assert (=> b!991285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _values!1278)))))

(declare-fun e!558987 () Bool)

(assert (=> b!991285 (= e!558987 (= (apply!898 lt!439886 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15652 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!991286 () Bool)

(declare-fun lt!439884 () Unit!32881)

(declare-fun lt!439885 () Unit!32881)

(assert (=> b!991286 (= lt!439884 lt!439885)))

(declare-fun lt!439890 () (_ BitVec 64))

(declare-fun lt!439889 () V!36067)

(declare-fun lt!439887 () (_ BitVec 64))

(declare-fun lt!439888 () ListLongMap!13627)

(assert (=> b!991286 (not (contains!5726 (+!3095 lt!439888 (tuple2!14931 lt!439887 lt!439889)) lt!439890))))

(declare-fun addStillNotContains!237 (ListLongMap!13627 (_ BitVec 64) V!36067 (_ BitVec 64)) Unit!32881)

(assert (=> b!991286 (= lt!439885 (addStillNotContains!237 lt!439888 lt!439887 lt!439889 lt!439890))))

(assert (=> b!991286 (= lt!439890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991286 (= lt!439889 (get!15652 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991286 (= lt!439887 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!42070 () ListLongMap!13627)

(assert (=> b!991286 (= lt!439888 call!42070)))

(assert (=> b!991286 (= e!558989 (+!3095 call!42070 (tuple2!14931 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991287 () Bool)

(assert (=> b!991287 (= e!558986 e!558983)))

(declare-fun c!100597 () Bool)

(assert (=> b!991287 (= c!100597 e!558988)))

(declare-fun res!662686 () Bool)

(assert (=> b!991287 (=> (not res!662686) (not e!558988))))

(assert (=> b!991287 (= res!662686 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(declare-fun b!991288 () Bool)

(declare-fun res!662684 () Bool)

(assert (=> b!991288 (=> (not res!662684) (not e!558986))))

(assert (=> b!991288 (= res!662684 (not (contains!5726 lt!439886 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991289 () Bool)

(assert (=> b!991289 (= e!558983 e!558987)))

(assert (=> b!991289 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30625 _keys!1544)))))

(declare-fun res!662683 () Bool)

(assert (=> b!991289 (= res!662683 (contains!5726 lt!439886 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991289 (=> (not res!662683) (not e!558987))))

(declare-fun b!991290 () Bool)

(declare-fun isEmpty!728 (ListLongMap!13627) Bool)

(assert (=> b!991290 (= e!558984 (isEmpty!728 lt!439886))))

(declare-fun bm!42067 () Bool)

(assert (=> bm!42067 (= call!42070 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991291 () Bool)

(assert (=> b!991291 (= e!558985 (ListLongMap!13628 Nil!20855))))

(declare-fun b!991292 () Bool)

(assert (=> b!991292 (= e!558989 call!42070)))

(assert (= (and d!117837 c!100598) b!991291))

(assert (= (and d!117837 (not c!100598)) b!991283))

(assert (= (and b!991283 c!100599) b!991286))

(assert (= (and b!991283 (not c!100599)) b!991292))

(assert (= (or b!991286 b!991292) bm!42067))

(assert (= (and d!117837 res!662685) b!991288))

(assert (= (and b!991288 res!662684) b!991287))

(assert (= (and b!991287 res!662686) b!991284))

(assert (= (and b!991287 c!100597) b!991289))

(assert (= (and b!991287 (not c!100597)) b!991281))

(assert (= (and b!991289 res!662683) b!991285))

(assert (= (and b!991281 c!100600) b!991282))

(assert (= (and b!991281 (not c!100600)) b!991290))

(declare-fun b_lambda!15213 () Bool)

(assert (=> (not b_lambda!15213) (not b!991285)))

(assert (=> b!991285 t!29837))

(declare-fun b_and!32281 () Bool)

(assert (= b_and!32279 (and (=> t!29837 result!13665) b_and!32281)))

(declare-fun b_lambda!15215 () Bool)

(assert (=> (not b_lambda!15215) (not b!991286)))

(assert (=> b!991286 t!29837))

(declare-fun b_and!32283 () Bool)

(assert (= b_and!32281 (and (=> t!29837 result!13665) b_and!32283)))

(assert (=> b!991284 m!918887))

(assert (=> b!991284 m!918887))

(assert (=> b!991284 m!918895))

(declare-fun m!919061 () Bool)

(assert (=> b!991288 m!919061))

(declare-fun m!919063 () Bool)

(assert (=> d!117837 m!919063))

(assert (=> d!117837 m!918771))

(declare-fun m!919065 () Bool)

(assert (=> b!991282 m!919065))

(assert (=> b!991283 m!918887))

(assert (=> b!991283 m!918887))

(assert (=> b!991283 m!918895))

(assert (=> b!991285 m!918891))

(assert (=> b!991285 m!918767))

(assert (=> b!991285 m!918893))

(assert (=> b!991285 m!918767))

(assert (=> b!991285 m!918891))

(assert (=> b!991285 m!918887))

(declare-fun m!919067 () Bool)

(assert (=> b!991285 m!919067))

(assert (=> b!991285 m!918887))

(declare-fun m!919069 () Bool)

(assert (=> b!991286 m!919069))

(assert (=> b!991286 m!918891))

(assert (=> b!991286 m!918767))

(assert (=> b!991286 m!918893))

(declare-fun m!919071 () Bool)

(assert (=> b!991286 m!919071))

(assert (=> b!991286 m!918887))

(assert (=> b!991286 m!918767))

(declare-fun m!919073 () Bool)

(assert (=> b!991286 m!919073))

(assert (=> b!991286 m!919073))

(declare-fun m!919075 () Bool)

(assert (=> b!991286 m!919075))

(assert (=> b!991286 m!918891))

(assert (=> bm!42067 m!919065))

(declare-fun m!919077 () Bool)

(assert (=> b!991290 m!919077))

(assert (=> b!991289 m!918887))

(assert (=> b!991289 m!918887))

(declare-fun m!919079 () Bool)

(assert (=> b!991289 m!919079))

(assert (=> b!991135 d!117837))

(declare-fun d!117839 () Bool)

(declare-fun e!558990 () Bool)

(assert (=> d!117839 e!558990))

(declare-fun res!662688 () Bool)

(assert (=> d!117839 (=> (not res!662688) (not e!558990))))

(declare-fun lt!439892 () ListLongMap!13627)

(assert (=> d!117839 (= res!662688 (contains!5726 lt!439892 (_1!7476 (tuple2!14931 lt!439822 minValue!1220))))))

(declare-fun lt!439894 () List!20858)

(assert (=> d!117839 (= lt!439892 (ListLongMap!13628 lt!439894))))

(declare-fun lt!439893 () Unit!32881)

(declare-fun lt!439891 () Unit!32881)

(assert (=> d!117839 (= lt!439893 lt!439891)))

(assert (=> d!117839 (= (getValueByKey!515 lt!439894 (_1!7476 (tuple2!14931 lt!439822 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439822 minValue!1220))))))

(assert (=> d!117839 (= lt!439891 (lemmaContainsTupThenGetReturnValue!274 lt!439894 (_1!7476 (tuple2!14931 lt!439822 minValue!1220)) (_2!7476 (tuple2!14931 lt!439822 minValue!1220))))))

(assert (=> d!117839 (= lt!439894 (insertStrictlySorted!331 (toList!6829 lt!439807) (_1!7476 (tuple2!14931 lt!439822 minValue!1220)) (_2!7476 (tuple2!14931 lt!439822 minValue!1220))))))

(assert (=> d!117839 (= (+!3095 lt!439807 (tuple2!14931 lt!439822 minValue!1220)) lt!439892)))

(declare-fun b!991293 () Bool)

(declare-fun res!662687 () Bool)

(assert (=> b!991293 (=> (not res!662687) (not e!558990))))

(assert (=> b!991293 (= res!662687 (= (getValueByKey!515 (toList!6829 lt!439892) (_1!7476 (tuple2!14931 lt!439822 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439822 minValue!1220)))))))

(declare-fun b!991294 () Bool)

(assert (=> b!991294 (= e!558990 (contains!5727 (toList!6829 lt!439892) (tuple2!14931 lt!439822 minValue!1220)))))

(assert (= (and d!117839 res!662688) b!991293))

(assert (= (and b!991293 res!662687) b!991294))

(declare-fun m!919081 () Bool)

(assert (=> d!117839 m!919081))

(declare-fun m!919083 () Bool)

(assert (=> d!117839 m!919083))

(declare-fun m!919085 () Bool)

(assert (=> d!117839 m!919085))

(declare-fun m!919087 () Bool)

(assert (=> d!117839 m!919087))

(declare-fun m!919089 () Bool)

(assert (=> b!991293 m!919089))

(declare-fun m!919091 () Bool)

(assert (=> b!991294 m!919091))

(assert (=> b!991135 d!117839))

(declare-fun d!117841 () Bool)

(assert (=> d!117841 (= (apply!898 (+!3095 lt!439807 (tuple2!14931 lt!439822 minValue!1220)) lt!439810) (apply!898 lt!439807 lt!439810))))

(declare-fun lt!439897 () Unit!32881)

(declare-fun choose!1622 (ListLongMap!13627 (_ BitVec 64) V!36067 (_ BitVec 64)) Unit!32881)

(assert (=> d!117841 (= lt!439897 (choose!1622 lt!439807 lt!439822 minValue!1220 lt!439810))))

(declare-fun e!558993 () Bool)

(assert (=> d!117841 e!558993))

(declare-fun res!662691 () Bool)

(assert (=> d!117841 (=> (not res!662691) (not e!558993))))

(assert (=> d!117841 (= res!662691 (contains!5726 lt!439807 lt!439810))))

(assert (=> d!117841 (= (addApplyDifferent!477 lt!439807 lt!439822 minValue!1220 lt!439810) lt!439897)))

(declare-fun b!991298 () Bool)

(assert (=> b!991298 (= e!558993 (not (= lt!439810 lt!439822)))))

(assert (= (and d!117841 res!662691) b!991298))

(assert (=> d!117841 m!918937))

(assert (=> d!117841 m!918937))

(assert (=> d!117841 m!918939))

(assert (=> d!117841 m!918913))

(declare-fun m!919093 () Bool)

(assert (=> d!117841 m!919093))

(declare-fun m!919095 () Bool)

(assert (=> d!117841 m!919095))

(assert (=> b!991135 d!117841))

(declare-fun d!117843 () Bool)

(declare-fun e!558994 () Bool)

(assert (=> d!117843 e!558994))

(declare-fun res!662693 () Bool)

(assert (=> d!117843 (=> (not res!662693) (not e!558994))))

(declare-fun lt!439899 () ListLongMap!13627)

(assert (=> d!117843 (= res!662693 (contains!5726 lt!439899 (_1!7476 (tuple2!14931 lt!439811 zeroValue!1220))))))

(declare-fun lt!439901 () List!20858)

(assert (=> d!117843 (= lt!439899 (ListLongMap!13628 lt!439901))))

(declare-fun lt!439900 () Unit!32881)

(declare-fun lt!439898 () Unit!32881)

(assert (=> d!117843 (= lt!439900 lt!439898)))

(assert (=> d!117843 (= (getValueByKey!515 lt!439901 (_1!7476 (tuple2!14931 lt!439811 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439811 zeroValue!1220))))))

(assert (=> d!117843 (= lt!439898 (lemmaContainsTupThenGetReturnValue!274 lt!439901 (_1!7476 (tuple2!14931 lt!439811 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439811 zeroValue!1220))))))

(assert (=> d!117843 (= lt!439901 (insertStrictlySorted!331 (toList!6829 lt!439808) (_1!7476 (tuple2!14931 lt!439811 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439811 zeroValue!1220))))))

(assert (=> d!117843 (= (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220)) lt!439899)))

(declare-fun b!991299 () Bool)

(declare-fun res!662692 () Bool)

(assert (=> b!991299 (=> (not res!662692) (not e!558994))))

(assert (=> b!991299 (= res!662692 (= (getValueByKey!515 (toList!6829 lt!439899) (_1!7476 (tuple2!14931 lt!439811 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439811 zeroValue!1220)))))))

(declare-fun b!991300 () Bool)

(assert (=> b!991300 (= e!558994 (contains!5727 (toList!6829 lt!439899) (tuple2!14931 lt!439811 zeroValue!1220)))))

(assert (= (and d!117843 res!662693) b!991299))

(assert (= (and b!991299 res!662692) b!991300))

(declare-fun m!919097 () Bool)

(assert (=> d!117843 m!919097))

(declare-fun m!919099 () Bool)

(assert (=> d!117843 m!919099))

(declare-fun m!919101 () Bool)

(assert (=> d!117843 m!919101))

(declare-fun m!919103 () Bool)

(assert (=> d!117843 m!919103))

(declare-fun m!919105 () Bool)

(assert (=> b!991299 m!919105))

(declare-fun m!919107 () Bool)

(assert (=> b!991300 m!919107))

(assert (=> b!991135 d!117843))

(declare-fun d!117845 () Bool)

(assert (=> d!117845 (= (apply!898 (+!3095 lt!439819 (tuple2!14931 lt!439815 minValue!1220)) lt!439817) (apply!898 lt!439819 lt!439817))))

(declare-fun lt!439902 () Unit!32881)

(assert (=> d!117845 (= lt!439902 (choose!1622 lt!439819 lt!439815 minValue!1220 lt!439817))))

(declare-fun e!558995 () Bool)

(assert (=> d!117845 e!558995))

(declare-fun res!662694 () Bool)

(assert (=> d!117845 (=> (not res!662694) (not e!558995))))

(assert (=> d!117845 (= res!662694 (contains!5726 lt!439819 lt!439817))))

(assert (=> d!117845 (= (addApplyDifferent!477 lt!439819 lt!439815 minValue!1220 lt!439817) lt!439902)))

(declare-fun b!991301 () Bool)

(assert (=> b!991301 (= e!558995 (not (= lt!439817 lt!439815)))))

(assert (= (and d!117845 res!662694) b!991301))

(assert (=> d!117845 m!918915))

(assert (=> d!117845 m!918915))

(assert (=> d!117845 m!918917))

(assert (=> d!117845 m!918919))

(declare-fun m!919109 () Bool)

(assert (=> d!117845 m!919109))

(declare-fun m!919111 () Bool)

(assert (=> d!117845 m!919111))

(assert (=> b!991135 d!117845))

(declare-fun d!117847 () Bool)

(assert (=> d!117847 (= (apply!898 (+!3095 lt!439803 (tuple2!14931 lt!439805 zeroValue!1220)) lt!439821) (apply!898 lt!439803 lt!439821))))

(declare-fun lt!439903 () Unit!32881)

(assert (=> d!117847 (= lt!439903 (choose!1622 lt!439803 lt!439805 zeroValue!1220 lt!439821))))

(declare-fun e!558996 () Bool)

(assert (=> d!117847 e!558996))

(declare-fun res!662695 () Bool)

(assert (=> d!117847 (=> (not res!662695) (not e!558996))))

(assert (=> d!117847 (= res!662695 (contains!5726 lt!439803 lt!439821))))

(assert (=> d!117847 (= (addApplyDifferent!477 lt!439803 lt!439805 zeroValue!1220 lt!439821) lt!439903)))

(declare-fun b!991302 () Bool)

(assert (=> b!991302 (= e!558996 (not (= lt!439821 lt!439805)))))

(assert (= (and d!117847 res!662695) b!991302))

(assert (=> d!117847 m!918925))

(assert (=> d!117847 m!918925))

(assert (=> d!117847 m!918927))

(assert (=> d!117847 m!918935))

(declare-fun m!919113 () Bool)

(assert (=> d!117847 m!919113))

(declare-fun m!919115 () Bool)

(assert (=> d!117847 m!919115))

(assert (=> b!991135 d!117847))

(declare-fun d!117849 () Bool)

(assert (=> d!117849 (= (apply!898 (+!3095 lt!439807 (tuple2!14931 lt!439822 minValue!1220)) lt!439810) (get!15656 (getValueByKey!515 (toList!6829 (+!3095 lt!439807 (tuple2!14931 lt!439822 minValue!1220))) lt!439810)))))

(declare-fun bs!28158 () Bool)

(assert (= bs!28158 d!117849))

(declare-fun m!919117 () Bool)

(assert (=> bs!28158 m!919117))

(assert (=> bs!28158 m!919117))

(declare-fun m!919119 () Bool)

(assert (=> bs!28158 m!919119))

(assert (=> b!991135 d!117849))

(declare-fun d!117851 () Bool)

(assert (=> d!117851 (= (apply!898 lt!439803 lt!439821) (get!15656 (getValueByKey!515 (toList!6829 lt!439803) lt!439821)))))

(declare-fun bs!28159 () Bool)

(assert (= bs!28159 d!117851))

(declare-fun m!919121 () Bool)

(assert (=> bs!28159 m!919121))

(assert (=> bs!28159 m!919121))

(declare-fun m!919123 () Bool)

(assert (=> bs!28159 m!919123))

(assert (=> b!991135 d!117851))

(declare-fun d!117853 () Bool)

(declare-fun e!558998 () Bool)

(assert (=> d!117853 e!558998))

(declare-fun res!662696 () Bool)

(assert (=> d!117853 (=> res!662696 e!558998)))

(declare-fun lt!439907 () Bool)

(assert (=> d!117853 (= res!662696 (not lt!439907))))

(declare-fun lt!439904 () Bool)

(assert (=> d!117853 (= lt!439907 lt!439904)))

(declare-fun lt!439905 () Unit!32881)

(declare-fun e!558997 () Unit!32881)

(assert (=> d!117853 (= lt!439905 e!558997)))

(declare-fun c!100601 () Bool)

(assert (=> d!117853 (= c!100601 lt!439904)))

(assert (=> d!117853 (= lt!439904 (containsKey!480 (toList!6829 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220))) lt!439809))))

(assert (=> d!117853 (= (contains!5726 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220)) lt!439809) lt!439907)))

(declare-fun b!991303 () Bool)

(declare-fun lt!439906 () Unit!32881)

(assert (=> b!991303 (= e!558997 lt!439906)))

(assert (=> b!991303 (= lt!439906 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220))) lt!439809))))

(assert (=> b!991303 (isDefined!385 (getValueByKey!515 (toList!6829 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220))) lt!439809))))

(declare-fun b!991304 () Bool)

(declare-fun Unit!32888 () Unit!32881)

(assert (=> b!991304 (= e!558997 Unit!32888)))

(declare-fun b!991305 () Bool)

(assert (=> b!991305 (= e!558998 (isDefined!385 (getValueByKey!515 (toList!6829 (+!3095 lt!439808 (tuple2!14931 lt!439811 zeroValue!1220))) lt!439809)))))

(assert (= (and d!117853 c!100601) b!991303))

(assert (= (and d!117853 (not c!100601)) b!991304))

(assert (= (and d!117853 (not res!662696)) b!991305))

(declare-fun m!919125 () Bool)

(assert (=> d!117853 m!919125))

(declare-fun m!919127 () Bool)

(assert (=> b!991303 m!919127))

(declare-fun m!919129 () Bool)

(assert (=> b!991303 m!919129))

(assert (=> b!991303 m!919129))

(declare-fun m!919131 () Bool)

(assert (=> b!991303 m!919131))

(assert (=> b!991305 m!919129))

(assert (=> b!991305 m!919129))

(assert (=> b!991305 m!919131))

(assert (=> b!991135 d!117853))

(declare-fun d!117855 () Bool)

(assert (=> d!117855 (= (apply!898 lt!439819 lt!439817) (get!15656 (getValueByKey!515 (toList!6829 lt!439819) lt!439817)))))

(declare-fun bs!28160 () Bool)

(assert (= bs!28160 d!117855))

(declare-fun m!919133 () Bool)

(assert (=> bs!28160 m!919133))

(assert (=> bs!28160 m!919133))

(declare-fun m!919135 () Bool)

(assert (=> bs!28160 m!919135))

(assert (=> b!991135 d!117855))

(declare-fun d!117857 () Bool)

(declare-fun e!559000 () Bool)

(assert (=> d!117857 e!559000))

(declare-fun res!662697 () Bool)

(assert (=> d!117857 (=> res!662697 e!559000)))

(declare-fun lt!439911 () Bool)

(assert (=> d!117857 (= res!662697 (not lt!439911))))

(declare-fun lt!439908 () Bool)

(assert (=> d!117857 (= lt!439911 lt!439908)))

(declare-fun lt!439909 () Unit!32881)

(declare-fun e!558999 () Unit!32881)

(assert (=> d!117857 (= lt!439909 e!558999)))

(declare-fun c!100602 () Bool)

(assert (=> d!117857 (= c!100602 lt!439908)))

(assert (=> d!117857 (= lt!439908 (containsKey!480 (toList!6829 lt!439790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117857 (= (contains!5726 lt!439790 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439911)))

(declare-fun b!991306 () Bool)

(declare-fun lt!439910 () Unit!32881)

(assert (=> b!991306 (= e!558999 lt!439910)))

(assert (=> b!991306 (= lt!439910 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991306 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991307 () Bool)

(declare-fun Unit!32889 () Unit!32881)

(assert (=> b!991307 (= e!558999 Unit!32889)))

(declare-fun b!991308 () Bool)

(assert (=> b!991308 (= e!559000 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117857 c!100602) b!991306))

(assert (= (and d!117857 (not c!100602)) b!991307))

(assert (= (and d!117857 (not res!662697)) b!991308))

(declare-fun m!919137 () Bool)

(assert (=> d!117857 m!919137))

(declare-fun m!919139 () Bool)

(assert (=> b!991306 m!919139))

(declare-fun m!919141 () Bool)

(assert (=> b!991306 m!919141))

(assert (=> b!991306 m!919141))

(declare-fun m!919143 () Bool)

(assert (=> b!991306 m!919143))

(assert (=> b!991308 m!919141))

(assert (=> b!991308 m!919141))

(assert (=> b!991308 m!919143))

(assert (=> bm!42041 d!117857))

(declare-fun d!117859 () Bool)

(assert (=> d!117859 (= (apply!898 lt!439824 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15656 (getValueByKey!515 (toList!6829 lt!439824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28161 () Bool)

(assert (= bs!28161 d!117859))

(declare-fun m!919145 () Bool)

(assert (=> bs!28161 m!919145))

(assert (=> bs!28161 m!919145))

(declare-fun m!919147 () Bool)

(assert (=> bs!28161 m!919147))

(assert (=> b!991151 d!117859))

(declare-fun d!117861 () Bool)

(assert (=> d!117861 (= (apply!898 lt!439824 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15656 (getValueByKey!515 (toList!6829 lt!439824) (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28162 () Bool)

(assert (= bs!28162 d!117861))

(assert (=> bs!28162 m!918887))

(declare-fun m!919149 () Bool)

(assert (=> bs!28162 m!919149))

(assert (=> bs!28162 m!919149))

(declare-fun m!919151 () Bool)

(assert (=> bs!28162 m!919151))

(assert (=> b!991149 d!117861))

(declare-fun d!117863 () Bool)

(declare-fun c!100603 () Bool)

(assert (=> d!117863 (= c!100603 ((_ is ValueCellFull!11175) (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!559001 () V!36067)

(assert (=> d!117863 (= (get!15652 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!559001)))

(declare-fun b!991309 () Bool)

(assert (=> b!991309 (= e!559001 (get!15654 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991310 () Bool)

(assert (=> b!991310 (= e!559001 (get!15655 (select (arr!30145 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117863 c!100603) b!991309))

(assert (= (and d!117863 (not c!100603)) b!991310))

(assert (=> b!991309 m!918891))

(assert (=> b!991309 m!918767))

(declare-fun m!919153 () Bool)

(assert (=> b!991309 m!919153))

(assert (=> b!991310 m!918891))

(assert (=> b!991310 m!918767))

(declare-fun m!919155 () Bool)

(assert (=> b!991310 m!919155))

(assert (=> b!991149 d!117863))

(declare-fun d!117865 () Bool)

(assert (=> d!117865 (= (apply!898 lt!439790 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15656 (getValueByKey!515 (toList!6829 lt!439790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28163 () Bool)

(assert (= bs!28163 d!117865))

(assert (=> bs!28163 m!918977))

(assert (=> bs!28163 m!918977))

(declare-fun m!919157 () Bool)

(assert (=> bs!28163 m!919157))

(assert (=> b!991117 d!117865))

(declare-fun d!117867 () Bool)

(assert (=> d!117867 (= (get!15654 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14280 (select (arr!30145 _values!1278) from!1932)))))

(assert (=> b!991160 d!117867))

(declare-fun d!117869 () Bool)

(assert (=> d!117869 (= (get!15655 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991161 d!117869))

(declare-fun d!117871 () Bool)

(declare-fun e!559003 () Bool)

(assert (=> d!117871 e!559003))

(declare-fun res!662698 () Bool)

(assert (=> d!117871 (=> res!662698 e!559003)))

(declare-fun lt!439915 () Bool)

(assert (=> d!117871 (= res!662698 (not lt!439915))))

(declare-fun lt!439912 () Bool)

(assert (=> d!117871 (= lt!439915 lt!439912)))

(declare-fun lt!439913 () Unit!32881)

(declare-fun e!559002 () Unit!32881)

(assert (=> d!117871 (= lt!439913 e!559002)))

(declare-fun c!100604 () Bool)

(assert (=> d!117871 (= c!100604 lt!439912)))

(assert (=> d!117871 (= lt!439912 (containsKey!480 (toList!6829 lt!439824) (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117871 (= (contains!5726 lt!439824 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439915)))

(declare-fun b!991311 () Bool)

(declare-fun lt!439914 () Unit!32881)

(assert (=> b!991311 (= e!559002 lt!439914)))

(assert (=> b!991311 (= lt!439914 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439824) (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991311 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439824) (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991312 () Bool)

(declare-fun Unit!32890 () Unit!32881)

(assert (=> b!991312 (= e!559002 Unit!32890)))

(declare-fun b!991313 () Bool)

(assert (=> b!991313 (= e!559003 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439824) (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117871 c!100604) b!991311))

(assert (= (and d!117871 (not c!100604)) b!991312))

(assert (= (and d!117871 (not res!662698)) b!991313))

(assert (=> d!117871 m!918887))

(declare-fun m!919159 () Bool)

(assert (=> d!117871 m!919159))

(assert (=> b!991311 m!918887))

(declare-fun m!919161 () Bool)

(assert (=> b!991311 m!919161))

(assert (=> b!991311 m!918887))

(assert (=> b!991311 m!919149))

(assert (=> b!991311 m!919149))

(declare-fun m!919163 () Bool)

(assert (=> b!991311 m!919163))

(assert (=> b!991313 m!918887))

(assert (=> b!991313 m!919149))

(assert (=> b!991313 m!919149))

(assert (=> b!991313 m!919163))

(assert (=> b!991148 d!117871))

(declare-fun d!117873 () Bool)

(declare-fun e!559005 () Bool)

(assert (=> d!117873 e!559005))

(declare-fun res!662699 () Bool)

(assert (=> d!117873 (=> res!662699 e!559005)))

(declare-fun lt!439919 () Bool)

(assert (=> d!117873 (= res!662699 (not lt!439919))))

(declare-fun lt!439916 () Bool)

(assert (=> d!117873 (= lt!439919 lt!439916)))

(declare-fun lt!439917 () Unit!32881)

(declare-fun e!559004 () Unit!32881)

(assert (=> d!117873 (= lt!439917 e!559004)))

(declare-fun c!100605 () Bool)

(assert (=> d!117873 (= c!100605 lt!439916)))

(assert (=> d!117873 (= lt!439916 (containsKey!480 (toList!6829 lt!439824) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117873 (= (contains!5726 lt!439824 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439919)))

(declare-fun b!991314 () Bool)

(declare-fun lt!439918 () Unit!32881)

(assert (=> b!991314 (= e!559004 lt!439918)))

(assert (=> b!991314 (= lt!439918 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439824) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991314 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439824) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991315 () Bool)

(declare-fun Unit!32891 () Unit!32881)

(assert (=> b!991315 (= e!559004 Unit!32891)))

(declare-fun b!991316 () Bool)

(assert (=> b!991316 (= e!559005 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117873 c!100605) b!991314))

(assert (= (and d!117873 (not c!100605)) b!991315))

(assert (= (and d!117873 (not res!662699)) b!991316))

(declare-fun m!919165 () Bool)

(assert (=> d!117873 m!919165))

(declare-fun m!919167 () Bool)

(assert (=> b!991314 m!919167))

(declare-fun m!919169 () Bool)

(assert (=> b!991314 m!919169))

(assert (=> b!991314 m!919169))

(declare-fun m!919171 () Bool)

(assert (=> b!991314 m!919171))

(assert (=> b!991316 m!919169))

(assert (=> b!991316 m!919169))

(assert (=> b!991316 m!919171))

(assert (=> bm!42050 d!117873))

(declare-fun d!117875 () Bool)

(declare-fun e!559006 () Bool)

(assert (=> d!117875 e!559006))

(declare-fun res!662701 () Bool)

(assert (=> d!117875 (=> (not res!662701) (not e!559006))))

(declare-fun lt!439921 () ListLongMap!13627)

(assert (=> d!117875 (= res!662701 (contains!5726 lt!439921 (_1!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439923 () List!20858)

(assert (=> d!117875 (= lt!439921 (ListLongMap!13628 lt!439923))))

(declare-fun lt!439922 () Unit!32881)

(declare-fun lt!439920 () Unit!32881)

(assert (=> d!117875 (= lt!439922 lt!439920)))

(assert (=> d!117875 (= (getValueByKey!515 lt!439923 (_1!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117875 (= lt!439920 (lemmaContainsTupThenGetReturnValue!274 lt!439923 (_1!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117875 (= lt!439923 (insertStrictlySorted!331 (toList!6829 (ite c!100557 call!42055 (ite c!100559 call!42050 call!42051))) (_1!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117875 (= (+!3095 (ite c!100557 call!42055 (ite c!100559 call!42050 call!42051)) (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439921)))

(declare-fun b!991317 () Bool)

(declare-fun res!662700 () Bool)

(assert (=> b!991317 (=> (not res!662700) (not e!559006))))

(assert (=> b!991317 (= res!662700 (= (getValueByKey!515 (toList!6829 lt!439921) (_1!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7476 (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!991318 () Bool)

(assert (=> b!991318 (= e!559006 (contains!5727 (toList!6829 lt!439921) (ite (or c!100557 c!100559) (tuple2!14931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117875 res!662701) b!991317))

(assert (= (and b!991317 res!662700) b!991318))

(declare-fun m!919173 () Bool)

(assert (=> d!117875 m!919173))

(declare-fun m!919175 () Bool)

(assert (=> d!117875 m!919175))

(declare-fun m!919177 () Bool)

(assert (=> d!117875 m!919177))

(declare-fun m!919179 () Bool)

(assert (=> d!117875 m!919179))

(declare-fun m!919181 () Bool)

(assert (=> b!991317 m!919181))

(declare-fun m!919183 () Bool)

(assert (=> b!991318 m!919183))

(assert (=> bm!42049 d!117875))

(declare-fun b!991319 () Bool)

(declare-fun e!559007 () Bool)

(declare-fun e!559008 () Bool)

(assert (=> b!991319 (= e!559007 e!559008)))

(declare-fun c!100609 () Bool)

(assert (=> b!991319 (= c!100609 (bvslt from!1932 (size!30625 _keys!1544)))))

(declare-fun b!991320 () Bool)

(declare-fun lt!439926 () ListLongMap!13627)

(assert (=> b!991320 (= e!559008 (= lt!439926 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991321 () Bool)

(declare-fun e!559009 () ListLongMap!13627)

(declare-fun e!559013 () ListLongMap!13627)

(assert (=> b!991321 (= e!559009 e!559013)))

(declare-fun c!100608 () Bool)

(assert (=> b!991321 (= c!100608 (validKeyInArray!0 (select (arr!30146 _keys!1544) from!1932)))))

(declare-fun b!991322 () Bool)

(declare-fun e!559012 () Bool)

(assert (=> b!991322 (= e!559012 (validKeyInArray!0 (select (arr!30146 _keys!1544) from!1932)))))

(assert (=> b!991322 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun d!117877 () Bool)

(declare-fun e!559010 () Bool)

(assert (=> d!117877 e!559010))

(declare-fun res!662704 () Bool)

(assert (=> d!117877 (=> (not res!662704) (not e!559010))))

(assert (=> d!117877 (= res!662704 (not (contains!5726 lt!439926 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117877 (= lt!439926 e!559009)))

(declare-fun c!100607 () Bool)

(assert (=> d!117877 (= c!100607 (bvsge from!1932 (size!30625 _keys!1544)))))

(assert (=> d!117877 (validMask!0 mask!1948)))

(assert (=> d!117877 (= (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439926)))

(declare-fun b!991323 () Bool)

(assert (=> b!991323 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30625 _keys!1544)))))

(assert (=> b!991323 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _values!1278)))))

(declare-fun e!559011 () Bool)

(assert (=> b!991323 (= e!559011 (= (apply!898 lt!439926 (select (arr!30146 _keys!1544) from!1932)) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!991324 () Bool)

(declare-fun lt!439924 () Unit!32881)

(declare-fun lt!439925 () Unit!32881)

(assert (=> b!991324 (= lt!439924 lt!439925)))

(declare-fun lt!439930 () (_ BitVec 64))

(declare-fun lt!439929 () V!36067)

(declare-fun lt!439927 () (_ BitVec 64))

(declare-fun lt!439928 () ListLongMap!13627)

(assert (=> b!991324 (not (contains!5726 (+!3095 lt!439928 (tuple2!14931 lt!439927 lt!439929)) lt!439930))))

(assert (=> b!991324 (= lt!439925 (addStillNotContains!237 lt!439928 lt!439927 lt!439929 lt!439930))))

(assert (=> b!991324 (= lt!439930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991324 (= lt!439929 (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991324 (= lt!439927 (select (arr!30146 _keys!1544) from!1932))))

(declare-fun call!42071 () ListLongMap!13627)

(assert (=> b!991324 (= lt!439928 call!42071)))

(assert (=> b!991324 (= e!559013 (+!3095 call!42071 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991325 () Bool)

(assert (=> b!991325 (= e!559010 e!559007)))

(declare-fun c!100606 () Bool)

(assert (=> b!991325 (= c!100606 e!559012)))

(declare-fun res!662705 () Bool)

(assert (=> b!991325 (=> (not res!662705) (not e!559012))))

(assert (=> b!991325 (= res!662705 (bvslt from!1932 (size!30625 _keys!1544)))))

(declare-fun b!991326 () Bool)

(declare-fun res!662703 () Bool)

(assert (=> b!991326 (=> (not res!662703) (not e!559010))))

(assert (=> b!991326 (= res!662703 (not (contains!5726 lt!439926 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991327 () Bool)

(assert (=> b!991327 (= e!559007 e!559011)))

(assert (=> b!991327 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30625 _keys!1544)))))

(declare-fun res!662702 () Bool)

(assert (=> b!991327 (= res!662702 (contains!5726 lt!439926 (select (arr!30146 _keys!1544) from!1932)))))

(assert (=> b!991327 (=> (not res!662702) (not e!559011))))

(declare-fun b!991328 () Bool)

(assert (=> b!991328 (= e!559008 (isEmpty!728 lt!439926))))

(declare-fun bm!42068 () Bool)

(assert (=> bm!42068 (= call!42071 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991329 () Bool)

(assert (=> b!991329 (= e!559009 (ListLongMap!13628 Nil!20855))))

(declare-fun b!991330 () Bool)

(assert (=> b!991330 (= e!559013 call!42071)))

(assert (= (and d!117877 c!100607) b!991329))

(assert (= (and d!117877 (not c!100607)) b!991321))

(assert (= (and b!991321 c!100608) b!991324))

(assert (= (and b!991321 (not c!100608)) b!991330))

(assert (= (or b!991324 b!991330) bm!42068))

(assert (= (and d!117877 res!662704) b!991326))

(assert (= (and b!991326 res!662703) b!991325))

(assert (= (and b!991325 res!662705) b!991322))

(assert (= (and b!991325 c!100606) b!991327))

(assert (= (and b!991325 (not c!100606)) b!991319))

(assert (= (and b!991327 res!662702) b!991323))

(assert (= (and b!991319 c!100609) b!991320))

(assert (= (and b!991319 (not c!100609)) b!991328))

(declare-fun b_lambda!15217 () Bool)

(assert (=> (not b_lambda!15217) (not b!991323)))

(assert (=> b!991323 t!29837))

(declare-fun b_and!32285 () Bool)

(assert (= b_and!32283 (and (=> t!29837 result!13665) b_and!32285)))

(declare-fun b_lambda!15219 () Bool)

(assert (=> (not b_lambda!15219) (not b!991324)))

(assert (=> b!991324 t!29837))

(declare-fun b_and!32287 () Bool)

(assert (= b_and!32285 (and (=> t!29837 result!13665) b_and!32287)))

(assert (=> b!991322 m!918757))

(assert (=> b!991322 m!918757))

(assert (=> b!991322 m!918777))

(declare-fun m!919185 () Bool)

(assert (=> b!991326 m!919185))

(declare-fun m!919187 () Bool)

(assert (=> d!117877 m!919187))

(assert (=> d!117877 m!918771))

(declare-fun m!919189 () Bool)

(assert (=> b!991320 m!919189))

(assert (=> b!991321 m!918757))

(assert (=> b!991321 m!918757))

(assert (=> b!991321 m!918777))

(assert (=> b!991323 m!918759))

(assert (=> b!991323 m!918767))

(assert (=> b!991323 m!918769))

(assert (=> b!991323 m!918767))

(assert (=> b!991323 m!918759))

(assert (=> b!991323 m!918757))

(declare-fun m!919191 () Bool)

(assert (=> b!991323 m!919191))

(assert (=> b!991323 m!918757))

(declare-fun m!919193 () Bool)

(assert (=> b!991324 m!919193))

(assert (=> b!991324 m!918759))

(assert (=> b!991324 m!918767))

(assert (=> b!991324 m!918769))

(declare-fun m!919195 () Bool)

(assert (=> b!991324 m!919195))

(assert (=> b!991324 m!918757))

(assert (=> b!991324 m!918767))

(declare-fun m!919197 () Bool)

(assert (=> b!991324 m!919197))

(assert (=> b!991324 m!919197))

(declare-fun m!919199 () Bool)

(assert (=> b!991324 m!919199))

(assert (=> b!991324 m!918759))

(assert (=> bm!42068 m!919189))

(declare-fun m!919201 () Bool)

(assert (=> b!991328 m!919201))

(assert (=> b!991327 m!918757))

(assert (=> b!991327 m!918757))

(declare-fun m!919203 () Bool)

(assert (=> b!991327 m!919203))

(assert (=> bm!42039 d!117877))

(declare-fun lt!439933 () Bool)

(declare-fun d!117879 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!424 (List!20858) (InoxSet tuple2!14930))

(assert (=> d!117879 (= lt!439933 (select (content!424 (toList!6829 lt!439800)) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!559018 () Bool)

(assert (=> d!117879 (= lt!439933 e!559018)))

(declare-fun res!662710 () Bool)

(assert (=> d!117879 (=> (not res!662710) (not e!559018))))

(assert (=> d!117879 (= res!662710 ((_ is Cons!20854) (toList!6829 lt!439800)))))

(assert (=> d!117879 (= (contains!5727 (toList!6829 lt!439800) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439933)))

(declare-fun b!991335 () Bool)

(declare-fun e!559019 () Bool)

(assert (=> b!991335 (= e!559018 e!559019)))

(declare-fun res!662711 () Bool)

(assert (=> b!991335 (=> res!662711 e!559019)))

(assert (=> b!991335 (= res!662711 (= (h!22016 (toList!6829 lt!439800)) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991336 () Bool)

(assert (=> b!991336 (= e!559019 (contains!5727 (t!29839 (toList!6829 lt!439800)) (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117879 res!662710) b!991335))

(assert (= (and b!991335 (not res!662711)) b!991336))

(declare-fun m!919205 () Bool)

(assert (=> d!117879 m!919205))

(declare-fun m!919207 () Bool)

(assert (=> d!117879 m!919207))

(declare-fun m!919209 () Bool)

(assert (=> b!991336 m!919209))

(assert (=> b!991134 d!117879))

(declare-fun d!117881 () Bool)

(declare-fun e!559021 () Bool)

(assert (=> d!117881 e!559021))

(declare-fun res!662712 () Bool)

(assert (=> d!117881 (=> res!662712 e!559021)))

(declare-fun lt!439937 () Bool)

(assert (=> d!117881 (= res!662712 (not lt!439937))))

(declare-fun lt!439934 () Bool)

(assert (=> d!117881 (= lt!439937 lt!439934)))

(declare-fun lt!439935 () Unit!32881)

(declare-fun e!559020 () Unit!32881)

(assert (=> d!117881 (= lt!439935 e!559020)))

(declare-fun c!100610 () Bool)

(assert (=> d!117881 (= c!100610 lt!439934)))

(assert (=> d!117881 (= lt!439934 (containsKey!480 (toList!6829 lt!439824) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117881 (= (contains!5726 lt!439824 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439937)))

(declare-fun b!991337 () Bool)

(declare-fun lt!439936 () Unit!32881)

(assert (=> b!991337 (= e!559020 lt!439936)))

(assert (=> b!991337 (= lt!439936 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 lt!439824) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991337 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439824) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991338 () Bool)

(declare-fun Unit!32892 () Unit!32881)

(assert (=> b!991338 (= e!559020 Unit!32892)))

(declare-fun b!991339 () Bool)

(assert (=> b!991339 (= e!559021 (isDefined!385 (getValueByKey!515 (toList!6829 lt!439824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117881 c!100610) b!991337))

(assert (= (and d!117881 (not c!100610)) b!991338))

(assert (= (and d!117881 (not res!662712)) b!991339))

(declare-fun m!919211 () Bool)

(assert (=> d!117881 m!919211))

(declare-fun m!919213 () Bool)

(assert (=> b!991337 m!919213))

(assert (=> b!991337 m!919145))

(assert (=> b!991337 m!919145))

(declare-fun m!919215 () Bool)

(assert (=> b!991337 m!919215))

(assert (=> b!991339 m!919145))

(assert (=> b!991339 m!919145))

(assert (=> b!991339 m!919215))

(assert (=> bm!42048 d!117881))

(assert (=> b!991114 d!117785))

(declare-fun b!991341 () Bool)

(declare-fun e!559022 () Option!521)

(declare-fun e!559023 () Option!521)

(assert (=> b!991341 (= e!559022 e!559023)))

(declare-fun c!100612 () Bool)

(assert (=> b!991341 (= c!100612 (and ((_ is Cons!20854) (toList!6829 lt!439800)) (not (= (_1!7476 (h!22016 (toList!6829 lt!439800))) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!991343 () Bool)

(assert (=> b!991343 (= e!559023 None!519)))

(declare-fun b!991340 () Bool)

(assert (=> b!991340 (= e!559022 (Some!520 (_2!7476 (h!22016 (toList!6829 lt!439800)))))))

(declare-fun d!117883 () Bool)

(declare-fun c!100611 () Bool)

(assert (=> d!117883 (= c!100611 (and ((_ is Cons!20854) (toList!6829 lt!439800)) (= (_1!7476 (h!22016 (toList!6829 lt!439800))) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!117883 (= (getValueByKey!515 (toList!6829 lt!439800) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!559022)))

(declare-fun b!991342 () Bool)

(assert (=> b!991342 (= e!559023 (getValueByKey!515 (t!29839 (toList!6829 lt!439800)) (_1!7476 (tuple2!14931 (select (arr!30146 _keys!1544) from!1932) (get!15652 (select (arr!30145 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!117883 c!100611) b!991340))

(assert (= (and d!117883 (not c!100611)) b!991341))

(assert (= (and b!991341 c!100612) b!991342))

(assert (= (and b!991341 (not c!100612)) b!991343))

(declare-fun m!919217 () Bool)

(assert (=> b!991342 m!919217))

(assert (=> b!991133 d!117883))

(assert (=> b!991113 d!117785))

(declare-fun d!117885 () Bool)

(assert (=> d!117885 (= (apply!898 lt!439824 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15656 (getValueByKey!515 (toList!6829 lt!439824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28164 () Bool)

(assert (= bs!28164 d!117885))

(assert (=> bs!28164 m!919169))

(assert (=> bs!28164 m!919169))

(declare-fun m!919219 () Bool)

(assert (=> bs!28164 m!919219))

(assert (=> b!991144 d!117885))

(declare-fun d!117887 () Bool)

(declare-fun e!559024 () Bool)

(assert (=> d!117887 e!559024))

(declare-fun res!662714 () Bool)

(assert (=> d!117887 (=> (not res!662714) (not e!559024))))

(declare-fun lt!439939 () ListLongMap!13627)

(assert (=> d!117887 (= res!662714 (contains!5726 lt!439939 (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439941 () List!20858)

(assert (=> d!117887 (= lt!439939 (ListLongMap!13628 lt!439941))))

(declare-fun lt!439940 () Unit!32881)

(declare-fun lt!439938 () Unit!32881)

(assert (=> d!117887 (= lt!439940 lt!439938)))

(assert (=> d!117887 (= (getValueByKey!515 lt!439941 (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117887 (= lt!439938 (lemmaContainsTupThenGetReturnValue!274 lt!439941 (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117887 (= lt!439941 (insertStrictlySorted!331 (toList!6829 call!42045) (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117887 (= (+!3095 call!42045 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439939)))

(declare-fun b!991344 () Bool)

(declare-fun res!662713 () Bool)

(assert (=> b!991344 (=> (not res!662713) (not e!559024))))

(assert (=> b!991344 (= res!662713 (= (getValueByKey!515 (toList!6829 lt!439939) (_1!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991345 () Bool)

(assert (=> b!991345 (= e!559024 (contains!5727 (toList!6829 lt!439939) (tuple2!14931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117887 res!662714) b!991344))

(assert (= (and b!991344 res!662713) b!991345))

(declare-fun m!919221 () Bool)

(assert (=> d!117887 m!919221))

(declare-fun m!919223 () Bool)

(assert (=> d!117887 m!919223))

(declare-fun m!919225 () Bool)

(assert (=> d!117887 m!919225))

(declare-fun m!919227 () Bool)

(assert (=> d!117887 m!919227))

(declare-fun m!919229 () Bool)

(assert (=> b!991344 m!919229))

(declare-fun m!919231 () Bool)

(assert (=> b!991345 m!919231))

(assert (=> b!991111 d!117887))

(declare-fun d!117889 () Bool)

(assert (=> d!117889 (= (validKeyInArray!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991064 d!117889))

(declare-fun d!117891 () Bool)

(declare-fun lt!439944 () Bool)

(declare-fun content!425 (List!20857) (InoxSet (_ BitVec 64)))

(assert (=> d!117891 (= lt!439944 (select (content!425 Nil!20854) (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!559029 () Bool)

(assert (=> d!117891 (= lt!439944 e!559029)))

(declare-fun res!662719 () Bool)

(assert (=> d!117891 (=> (not res!662719) (not e!559029))))

(assert (=> d!117891 (= res!662719 ((_ is Cons!20853) Nil!20854))))

(assert (=> d!117891 (= (contains!5728 Nil!20854 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)) lt!439944)))

(declare-fun b!991350 () Bool)

(declare-fun e!559030 () Bool)

(assert (=> b!991350 (= e!559029 e!559030)))

(declare-fun res!662720 () Bool)

(assert (=> b!991350 (=> res!662720 e!559030)))

(assert (=> b!991350 (= res!662720 (= (h!22015 Nil!20854) (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991351 () Bool)

(assert (=> b!991351 (= e!559030 (contains!5728 (t!29838 Nil!20854) (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117891 res!662719) b!991350))

(assert (= (and b!991350 (not res!662720)) b!991351))

(declare-fun m!919233 () Bool)

(assert (=> d!117891 m!919233))

(assert (=> d!117891 m!918813))

(declare-fun m!919235 () Bool)

(assert (=> d!117891 m!919235))

(assert (=> b!991351 m!918813))

(declare-fun m!919237 () Bool)

(assert (=> b!991351 m!919237))

(assert (=> b!991176 d!117891))

(declare-fun b!991352 () Bool)

(declare-fun e!559034 () Bool)

(declare-fun call!42072 () Bool)

(assert (=> b!991352 (= e!559034 call!42072)))

(declare-fun b!991353 () Bool)

(declare-fun e!559032 () Bool)

(assert (=> b!991353 (= e!559032 e!559034)))

(declare-fun c!100613 () Bool)

(assert (=> b!991353 (= c!100613 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117893 () Bool)

(declare-fun res!662721 () Bool)

(declare-fun e!559033 () Bool)

(assert (=> d!117893 (=> res!662721 e!559033)))

(assert (=> d!117893 (= res!662721 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30625 _keys!1544)))))

(assert (=> d!117893 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100565 (Cons!20853 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) Nil!20854) Nil!20854)) e!559033)))

(declare-fun b!991354 () Bool)

(assert (=> b!991354 (= e!559033 e!559032)))

(declare-fun res!662722 () Bool)

(assert (=> b!991354 (=> (not res!662722) (not e!559032))))

(declare-fun e!559031 () Bool)

(assert (=> b!991354 (= res!662722 (not e!559031))))

(declare-fun res!662723 () Bool)

(assert (=> b!991354 (=> (not res!662723) (not e!559031))))

(assert (=> b!991354 (= res!662723 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!991355 () Bool)

(assert (=> b!991355 (= e!559034 call!42072)))

(declare-fun b!991356 () Bool)

(assert (=> b!991356 (= e!559031 (contains!5728 (ite c!100565 (Cons!20853 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) Nil!20854) Nil!20854) (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!42069 () Bool)

(assert (=> bm!42069 (= call!42072 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100613 (Cons!20853 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100565 (Cons!20853 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) Nil!20854) Nil!20854)) (ite c!100565 (Cons!20853 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) Nil!20854) Nil!20854))))))

(assert (= (and d!117893 (not res!662721)) b!991354))

(assert (= (and b!991354 res!662723) b!991356))

(assert (= (and b!991354 res!662722) b!991353))

(assert (= (and b!991353 c!100613) b!991352))

(assert (= (and b!991353 (not c!100613)) b!991355))

(assert (= (or b!991352 b!991355) bm!42069))

(declare-fun m!919239 () Bool)

(assert (=> b!991353 m!919239))

(assert (=> b!991353 m!919239))

(declare-fun m!919241 () Bool)

(assert (=> b!991353 m!919241))

(assert (=> b!991354 m!919239))

(assert (=> b!991354 m!919239))

(assert (=> b!991354 m!919241))

(assert (=> b!991356 m!919239))

(assert (=> b!991356 m!919239))

(declare-fun m!919243 () Bool)

(assert (=> b!991356 m!919243))

(assert (=> bm!42069 m!919239))

(declare-fun m!919245 () Bool)

(assert (=> bm!42069 m!919245))

(assert (=> bm!42055 d!117893))

(declare-fun d!117895 () Bool)

(declare-fun e!559036 () Bool)

(assert (=> d!117895 e!559036))

(declare-fun res!662724 () Bool)

(assert (=> d!117895 (=> res!662724 e!559036)))

(declare-fun lt!439948 () Bool)

(assert (=> d!117895 (= res!662724 (not lt!439948))))

(declare-fun lt!439945 () Bool)

(assert (=> d!117895 (= lt!439948 lt!439945)))

(declare-fun lt!439946 () Unit!32881)

(declare-fun e!559035 () Unit!32881)

(assert (=> d!117895 (= lt!439946 e!559035)))

(declare-fun c!100614 () Bool)

(assert (=> d!117895 (= c!100614 lt!439945)))

(assert (=> d!117895 (= lt!439945 (containsKey!480 (toList!6829 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220))) lt!439775))))

(assert (=> d!117895 (= (contains!5726 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220)) lt!439775) lt!439948)))

(declare-fun b!991357 () Bool)

(declare-fun lt!439947 () Unit!32881)

(assert (=> b!991357 (= e!559035 lt!439947)))

(assert (=> b!991357 (= lt!439947 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6829 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220))) lt!439775))))

(assert (=> b!991357 (isDefined!385 (getValueByKey!515 (toList!6829 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220))) lt!439775))))

(declare-fun b!991358 () Bool)

(declare-fun Unit!32893 () Unit!32881)

(assert (=> b!991358 (= e!559035 Unit!32893)))

(declare-fun b!991359 () Bool)

(assert (=> b!991359 (= e!559036 (isDefined!385 (getValueByKey!515 (toList!6829 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220))) lt!439775)))))

(assert (= (and d!117895 c!100614) b!991357))

(assert (= (and d!117895 (not c!100614)) b!991358))

(assert (= (and d!117895 (not res!662724)) b!991359))

(declare-fun m!919247 () Bool)

(assert (=> d!117895 m!919247))

(declare-fun m!919249 () Bool)

(assert (=> b!991357 m!919249))

(declare-fun m!919251 () Bool)

(assert (=> b!991357 m!919251))

(assert (=> b!991357 m!919251))

(declare-fun m!919253 () Bool)

(assert (=> b!991357 m!919253))

(assert (=> b!991359 m!919251))

(assert (=> b!991359 m!919251))

(assert (=> b!991359 m!919253))

(assert (=> b!991108 d!117895))

(assert (=> b!991108 d!117877))

(declare-fun d!117897 () Bool)

(assert (=> d!117897 (= (apply!898 (+!3095 lt!439773 (tuple2!14931 lt!439788 minValue!1220)) lt!439776) (apply!898 lt!439773 lt!439776))))

(declare-fun lt!439949 () Unit!32881)

(assert (=> d!117897 (= lt!439949 (choose!1622 lt!439773 lt!439788 minValue!1220 lt!439776))))

(declare-fun e!559037 () Bool)

(assert (=> d!117897 e!559037))

(declare-fun res!662725 () Bool)

(assert (=> d!117897 (=> (not res!662725) (not e!559037))))

(assert (=> d!117897 (= res!662725 (contains!5726 lt!439773 lt!439776))))

(assert (=> d!117897 (= (addApplyDifferent!477 lt!439773 lt!439788 minValue!1220 lt!439776) lt!439949)))

(declare-fun b!991360 () Bool)

(assert (=> b!991360 (= e!559037 (not (= lt!439776 lt!439788)))))

(assert (= (and d!117897 res!662725) b!991360))

(assert (=> d!117897 m!918869))

(assert (=> d!117897 m!918869))

(assert (=> d!117897 m!918871))

(assert (=> d!117897 m!918845))

(declare-fun m!919255 () Bool)

(assert (=> d!117897 m!919255))

(declare-fun m!919257 () Bool)

(assert (=> d!117897 m!919257))

(assert (=> b!991108 d!117897))

(declare-fun d!117899 () Bool)

(declare-fun e!559038 () Bool)

(assert (=> d!117899 e!559038))

(declare-fun res!662727 () Bool)

(assert (=> d!117899 (=> (not res!662727) (not e!559038))))

(declare-fun lt!439951 () ListLongMap!13627)

(assert (=> d!117899 (= res!662727 (contains!5726 lt!439951 (_1!7476 (tuple2!14931 lt!439771 zeroValue!1220))))))

(declare-fun lt!439953 () List!20858)

(assert (=> d!117899 (= lt!439951 (ListLongMap!13628 lt!439953))))

(declare-fun lt!439952 () Unit!32881)

(declare-fun lt!439950 () Unit!32881)

(assert (=> d!117899 (= lt!439952 lt!439950)))

(assert (=> d!117899 (= (getValueByKey!515 lt!439953 (_1!7476 (tuple2!14931 lt!439771 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439771 zeroValue!1220))))))

(assert (=> d!117899 (= lt!439950 (lemmaContainsTupThenGetReturnValue!274 lt!439953 (_1!7476 (tuple2!14931 lt!439771 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439771 zeroValue!1220))))))

(assert (=> d!117899 (= lt!439953 (insertStrictlySorted!331 (toList!6829 lt!439769) (_1!7476 (tuple2!14931 lt!439771 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439771 zeroValue!1220))))))

(assert (=> d!117899 (= (+!3095 lt!439769 (tuple2!14931 lt!439771 zeroValue!1220)) lt!439951)))

(declare-fun b!991361 () Bool)

(declare-fun res!662726 () Bool)

(assert (=> b!991361 (=> (not res!662726) (not e!559038))))

(assert (=> b!991361 (= res!662726 (= (getValueByKey!515 (toList!6829 lt!439951) (_1!7476 (tuple2!14931 lt!439771 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439771 zeroValue!1220)))))))

(declare-fun b!991362 () Bool)

(assert (=> b!991362 (= e!559038 (contains!5727 (toList!6829 lt!439951) (tuple2!14931 lt!439771 zeroValue!1220)))))

(assert (= (and d!117899 res!662727) b!991361))

(assert (= (and b!991361 res!662726) b!991362))

(declare-fun m!919259 () Bool)

(assert (=> d!117899 m!919259))

(declare-fun m!919261 () Bool)

(assert (=> d!117899 m!919261))

(declare-fun m!919263 () Bool)

(assert (=> d!117899 m!919263))

(declare-fun m!919265 () Bool)

(assert (=> d!117899 m!919265))

(declare-fun m!919267 () Bool)

(assert (=> b!991361 m!919267))

(declare-fun m!919269 () Bool)

(assert (=> b!991362 m!919269))

(assert (=> b!991108 d!117899))

(declare-fun d!117901 () Bool)

(assert (=> d!117901 (= (apply!898 (+!3095 lt!439769 (tuple2!14931 lt!439771 zeroValue!1220)) lt!439787) (get!15656 (getValueByKey!515 (toList!6829 (+!3095 lt!439769 (tuple2!14931 lt!439771 zeroValue!1220))) lt!439787)))))

(declare-fun bs!28165 () Bool)

(assert (= bs!28165 d!117901))

(declare-fun m!919271 () Bool)

(assert (=> bs!28165 m!919271))

(assert (=> bs!28165 m!919271))

(declare-fun m!919273 () Bool)

(assert (=> bs!28165 m!919273))

(assert (=> b!991108 d!117901))

(declare-fun d!117903 () Bool)

(assert (=> d!117903 (= (apply!898 (+!3095 lt!439785 (tuple2!14931 lt!439781 minValue!1220)) lt!439783) (apply!898 lt!439785 lt!439783))))

(declare-fun lt!439954 () Unit!32881)

(assert (=> d!117903 (= lt!439954 (choose!1622 lt!439785 lt!439781 minValue!1220 lt!439783))))

(declare-fun e!559039 () Bool)

(assert (=> d!117903 e!559039))

(declare-fun res!662728 () Bool)

(assert (=> d!117903 (=> (not res!662728) (not e!559039))))

(assert (=> d!117903 (= res!662728 (contains!5726 lt!439785 lt!439783))))

(assert (=> d!117903 (= (addApplyDifferent!477 lt!439785 lt!439781 minValue!1220 lt!439783) lt!439954)))

(declare-fun b!991363 () Bool)

(assert (=> b!991363 (= e!559039 (not (= lt!439783 lt!439781)))))

(assert (= (and d!117903 res!662728) b!991363))

(assert (=> d!117903 m!918847))

(assert (=> d!117903 m!918847))

(assert (=> d!117903 m!918849))

(assert (=> d!117903 m!918851))

(declare-fun m!919275 () Bool)

(assert (=> d!117903 m!919275))

(declare-fun m!919277 () Bool)

(assert (=> d!117903 m!919277))

(assert (=> b!991108 d!117903))

(declare-fun d!117905 () Bool)

(assert (=> d!117905 (= (apply!898 (+!3095 lt!439769 (tuple2!14931 lt!439771 zeroValue!1220)) lt!439787) (apply!898 lt!439769 lt!439787))))

(declare-fun lt!439955 () Unit!32881)

(assert (=> d!117905 (= lt!439955 (choose!1622 lt!439769 lt!439771 zeroValue!1220 lt!439787))))

(declare-fun e!559040 () Bool)

(assert (=> d!117905 e!559040))

(declare-fun res!662729 () Bool)

(assert (=> d!117905 (=> (not res!662729) (not e!559040))))

(assert (=> d!117905 (= res!662729 (contains!5726 lt!439769 lt!439787))))

(assert (=> d!117905 (= (addApplyDifferent!477 lt!439769 lt!439771 zeroValue!1220 lt!439787) lt!439955)))

(declare-fun b!991364 () Bool)

(assert (=> b!991364 (= e!559040 (not (= lt!439787 lt!439771)))))

(assert (= (and d!117905 res!662729) b!991364))

(assert (=> d!117905 m!918857))

(assert (=> d!117905 m!918857))

(assert (=> d!117905 m!918859))

(assert (=> d!117905 m!918867))

(declare-fun m!919279 () Bool)

(assert (=> d!117905 m!919279))

(declare-fun m!919281 () Bool)

(assert (=> d!117905 m!919281))

(assert (=> b!991108 d!117905))

(declare-fun d!117907 () Bool)

(assert (=> d!117907 (= (apply!898 lt!439785 lt!439783) (get!15656 (getValueByKey!515 (toList!6829 lt!439785) lt!439783)))))

(declare-fun bs!28166 () Bool)

(assert (= bs!28166 d!117907))

(declare-fun m!919283 () Bool)

(assert (=> bs!28166 m!919283))

(assert (=> bs!28166 m!919283))

(declare-fun m!919285 () Bool)

(assert (=> bs!28166 m!919285))

(assert (=> b!991108 d!117907))

(declare-fun d!117909 () Bool)

(assert (=> d!117909 (= (apply!898 lt!439769 lt!439787) (get!15656 (getValueByKey!515 (toList!6829 lt!439769) lt!439787)))))

(declare-fun bs!28167 () Bool)

(assert (= bs!28167 d!117909))

(declare-fun m!919287 () Bool)

(assert (=> bs!28167 m!919287))

(assert (=> bs!28167 m!919287))

(declare-fun m!919289 () Bool)

(assert (=> bs!28167 m!919289))

(assert (=> b!991108 d!117909))

(declare-fun d!117911 () Bool)

(declare-fun e!559041 () Bool)

(assert (=> d!117911 e!559041))

(declare-fun res!662731 () Bool)

(assert (=> d!117911 (=> (not res!662731) (not e!559041))))

(declare-fun lt!439957 () ListLongMap!13627)

(assert (=> d!117911 (= res!662731 (contains!5726 lt!439957 (_1!7476 (tuple2!14931 lt!439788 minValue!1220))))))

(declare-fun lt!439959 () List!20858)

(assert (=> d!117911 (= lt!439957 (ListLongMap!13628 lt!439959))))

(declare-fun lt!439958 () Unit!32881)

(declare-fun lt!439956 () Unit!32881)

(assert (=> d!117911 (= lt!439958 lt!439956)))

(assert (=> d!117911 (= (getValueByKey!515 lt!439959 (_1!7476 (tuple2!14931 lt!439788 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439788 minValue!1220))))))

(assert (=> d!117911 (= lt!439956 (lemmaContainsTupThenGetReturnValue!274 lt!439959 (_1!7476 (tuple2!14931 lt!439788 minValue!1220)) (_2!7476 (tuple2!14931 lt!439788 minValue!1220))))))

(assert (=> d!117911 (= lt!439959 (insertStrictlySorted!331 (toList!6829 lt!439773) (_1!7476 (tuple2!14931 lt!439788 minValue!1220)) (_2!7476 (tuple2!14931 lt!439788 minValue!1220))))))

(assert (=> d!117911 (= (+!3095 lt!439773 (tuple2!14931 lt!439788 minValue!1220)) lt!439957)))

(declare-fun b!991365 () Bool)

(declare-fun res!662730 () Bool)

(assert (=> b!991365 (=> (not res!662730) (not e!559041))))

(assert (=> b!991365 (= res!662730 (= (getValueByKey!515 (toList!6829 lt!439957) (_1!7476 (tuple2!14931 lt!439788 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439788 minValue!1220)))))))

(declare-fun b!991366 () Bool)

(assert (=> b!991366 (= e!559041 (contains!5727 (toList!6829 lt!439957) (tuple2!14931 lt!439788 minValue!1220)))))

(assert (= (and d!117911 res!662731) b!991365))

(assert (= (and b!991365 res!662730) b!991366))

(declare-fun m!919291 () Bool)

(assert (=> d!117911 m!919291))

(declare-fun m!919293 () Bool)

(assert (=> d!117911 m!919293))

(declare-fun m!919295 () Bool)

(assert (=> d!117911 m!919295))

(declare-fun m!919297 () Bool)

(assert (=> d!117911 m!919297))

(declare-fun m!919299 () Bool)

(assert (=> b!991365 m!919299))

(declare-fun m!919301 () Bool)

(assert (=> b!991366 m!919301))

(assert (=> b!991108 d!117911))

(declare-fun d!117913 () Bool)

(assert (=> d!117913 (= (apply!898 (+!3095 lt!439773 (tuple2!14931 lt!439788 minValue!1220)) lt!439776) (get!15656 (getValueByKey!515 (toList!6829 (+!3095 lt!439773 (tuple2!14931 lt!439788 minValue!1220))) lt!439776)))))

(declare-fun bs!28168 () Bool)

(assert (= bs!28168 d!117913))

(declare-fun m!919303 () Bool)

(assert (=> bs!28168 m!919303))

(assert (=> bs!28168 m!919303))

(declare-fun m!919305 () Bool)

(assert (=> bs!28168 m!919305))

(assert (=> b!991108 d!117913))

(declare-fun d!117915 () Bool)

(assert (=> d!117915 (= (apply!898 (+!3095 lt!439785 (tuple2!14931 lt!439781 minValue!1220)) lt!439783) (get!15656 (getValueByKey!515 (toList!6829 (+!3095 lt!439785 (tuple2!14931 lt!439781 minValue!1220))) lt!439783)))))

(declare-fun bs!28169 () Bool)

(assert (= bs!28169 d!117915))

(declare-fun m!919307 () Bool)

(assert (=> bs!28169 m!919307))

(assert (=> bs!28169 m!919307))

(declare-fun m!919309 () Bool)

(assert (=> bs!28169 m!919309))

(assert (=> b!991108 d!117915))

(declare-fun d!117917 () Bool)

(assert (=> d!117917 (= (apply!898 lt!439773 lt!439776) (get!15656 (getValueByKey!515 (toList!6829 lt!439773) lt!439776)))))

(declare-fun bs!28170 () Bool)

(assert (= bs!28170 d!117917))

(declare-fun m!919311 () Bool)

(assert (=> bs!28170 m!919311))

(assert (=> bs!28170 m!919311))

(declare-fun m!919313 () Bool)

(assert (=> bs!28170 m!919313))

(assert (=> b!991108 d!117917))

(declare-fun d!117919 () Bool)

(declare-fun e!559042 () Bool)

(assert (=> d!117919 e!559042))

(declare-fun res!662733 () Bool)

(assert (=> d!117919 (=> (not res!662733) (not e!559042))))

(declare-fun lt!439961 () ListLongMap!13627)

(assert (=> d!117919 (= res!662733 (contains!5726 lt!439961 (_1!7476 (tuple2!14931 lt!439777 zeroValue!1220))))))

(declare-fun lt!439963 () List!20858)

(assert (=> d!117919 (= lt!439961 (ListLongMap!13628 lt!439963))))

(declare-fun lt!439962 () Unit!32881)

(declare-fun lt!439960 () Unit!32881)

(assert (=> d!117919 (= lt!439962 lt!439960)))

(assert (=> d!117919 (= (getValueByKey!515 lt!439963 (_1!7476 (tuple2!14931 lt!439777 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439777 zeroValue!1220))))))

(assert (=> d!117919 (= lt!439960 (lemmaContainsTupThenGetReturnValue!274 lt!439963 (_1!7476 (tuple2!14931 lt!439777 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439777 zeroValue!1220))))))

(assert (=> d!117919 (= lt!439963 (insertStrictlySorted!331 (toList!6829 lt!439774) (_1!7476 (tuple2!14931 lt!439777 zeroValue!1220)) (_2!7476 (tuple2!14931 lt!439777 zeroValue!1220))))))

(assert (=> d!117919 (= (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220)) lt!439961)))

(declare-fun b!991367 () Bool)

(declare-fun res!662732 () Bool)

(assert (=> b!991367 (=> (not res!662732) (not e!559042))))

(assert (=> b!991367 (= res!662732 (= (getValueByKey!515 (toList!6829 lt!439961) (_1!7476 (tuple2!14931 lt!439777 zeroValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439777 zeroValue!1220)))))))

(declare-fun b!991368 () Bool)

(assert (=> b!991368 (= e!559042 (contains!5727 (toList!6829 lt!439961) (tuple2!14931 lt!439777 zeroValue!1220)))))

(assert (= (and d!117919 res!662733) b!991367))

(assert (= (and b!991367 res!662732) b!991368))

(declare-fun m!919315 () Bool)

(assert (=> d!117919 m!919315))

(declare-fun m!919317 () Bool)

(assert (=> d!117919 m!919317))

(declare-fun m!919319 () Bool)

(assert (=> d!117919 m!919319))

(declare-fun m!919321 () Bool)

(assert (=> d!117919 m!919321))

(declare-fun m!919323 () Bool)

(assert (=> b!991367 m!919323))

(declare-fun m!919325 () Bool)

(assert (=> b!991368 m!919325))

(assert (=> b!991108 d!117919))

(declare-fun d!117921 () Bool)

(assert (=> d!117921 (contains!5726 (+!3095 lt!439774 (tuple2!14931 lt!439777 zeroValue!1220)) lt!439775)))

(declare-fun lt!439964 () Unit!32881)

(assert (=> d!117921 (= lt!439964 (choose!1621 lt!439774 lt!439777 zeroValue!1220 lt!439775))))

(assert (=> d!117921 (contains!5726 lt!439774 lt!439775)))

(assert (=> d!117921 (= (addStillContains!617 lt!439774 lt!439777 zeroValue!1220 lt!439775) lt!439964)))

(declare-fun bs!28171 () Bool)

(assert (= bs!28171 d!117921))

(assert (=> bs!28171 m!918861))

(assert (=> bs!28171 m!918861))

(assert (=> bs!28171 m!918863))

(declare-fun m!919327 () Bool)

(assert (=> bs!28171 m!919327))

(declare-fun m!919329 () Bool)

(assert (=> bs!28171 m!919329))

(assert (=> b!991108 d!117921))

(declare-fun d!117923 () Bool)

(declare-fun e!559043 () Bool)

(assert (=> d!117923 e!559043))

(declare-fun res!662735 () Bool)

(assert (=> d!117923 (=> (not res!662735) (not e!559043))))

(declare-fun lt!439966 () ListLongMap!13627)

(assert (=> d!117923 (= res!662735 (contains!5726 lt!439966 (_1!7476 (tuple2!14931 lt!439781 minValue!1220))))))

(declare-fun lt!439968 () List!20858)

(assert (=> d!117923 (= lt!439966 (ListLongMap!13628 lt!439968))))

(declare-fun lt!439967 () Unit!32881)

(declare-fun lt!439965 () Unit!32881)

(assert (=> d!117923 (= lt!439967 lt!439965)))

(assert (=> d!117923 (= (getValueByKey!515 lt!439968 (_1!7476 (tuple2!14931 lt!439781 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439781 minValue!1220))))))

(assert (=> d!117923 (= lt!439965 (lemmaContainsTupThenGetReturnValue!274 lt!439968 (_1!7476 (tuple2!14931 lt!439781 minValue!1220)) (_2!7476 (tuple2!14931 lt!439781 minValue!1220))))))

(assert (=> d!117923 (= lt!439968 (insertStrictlySorted!331 (toList!6829 lt!439785) (_1!7476 (tuple2!14931 lt!439781 minValue!1220)) (_2!7476 (tuple2!14931 lt!439781 minValue!1220))))))

(assert (=> d!117923 (= (+!3095 lt!439785 (tuple2!14931 lt!439781 minValue!1220)) lt!439966)))

(declare-fun b!991369 () Bool)

(declare-fun res!662734 () Bool)

(assert (=> b!991369 (=> (not res!662734) (not e!559043))))

(assert (=> b!991369 (= res!662734 (= (getValueByKey!515 (toList!6829 lt!439966) (_1!7476 (tuple2!14931 lt!439781 minValue!1220))) (Some!520 (_2!7476 (tuple2!14931 lt!439781 minValue!1220)))))))

(declare-fun b!991370 () Bool)

(assert (=> b!991370 (= e!559043 (contains!5727 (toList!6829 lt!439966) (tuple2!14931 lt!439781 minValue!1220)))))

(assert (= (and d!117923 res!662735) b!991369))

(assert (= (and b!991369 res!662734) b!991370))

(declare-fun m!919331 () Bool)

(assert (=> d!117923 m!919331))

(declare-fun m!919333 () Bool)

(assert (=> d!117923 m!919333))

(declare-fun m!919335 () Bool)

(assert (=> d!117923 m!919335))

(declare-fun m!919337 () Bool)

(assert (=> d!117923 m!919337))

(declare-fun m!919339 () Bool)

(assert (=> b!991369 m!919339))

(declare-fun m!919341 () Bool)

(assert (=> b!991370 m!919341))

(assert (=> b!991108 d!117923))

(declare-fun d!117925 () Bool)

(assert (=> d!117925 (arrayContainsKey!0 _keys!1544 lt!439724 #b00000000000000000000000000000000)))

(declare-fun lt!439971 () Unit!32881)

(declare-fun choose!13 (array!62591 (_ BitVec 64) (_ BitVec 32)) Unit!32881)

(assert (=> d!117925 (= lt!439971 (choose!13 _keys!1544 lt!439724 #b00000000000000000000000000000000))))

(assert (=> d!117925 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117925 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439724 #b00000000000000000000000000000000) lt!439971)))

(declare-fun bs!28172 () Bool)

(assert (= bs!28172 d!117925))

(assert (=> bs!28172 m!918817))

(declare-fun m!919343 () Bool)

(assert (=> bs!28172 m!919343))

(assert (=> b!991062 d!117925))

(declare-fun d!117927 () Bool)

(declare-fun res!662740 () Bool)

(declare-fun e!559048 () Bool)

(assert (=> d!117927 (=> res!662740 e!559048)))

(assert (=> d!117927 (= res!662740 (= (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) lt!439724))))

(assert (=> d!117927 (= (arrayContainsKey!0 _keys!1544 lt!439724 #b00000000000000000000000000000000) e!559048)))

(declare-fun b!991375 () Bool)

(declare-fun e!559049 () Bool)

(assert (=> b!991375 (= e!559048 e!559049)))

(declare-fun res!662741 () Bool)

(assert (=> b!991375 (=> (not res!662741) (not e!559049))))

(assert (=> b!991375 (= res!662741 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30625 _keys!1544)))))

(declare-fun b!991376 () Bool)

(assert (=> b!991376 (= e!559049 (arrayContainsKey!0 _keys!1544 lt!439724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117927 (not res!662740)) b!991375))

(assert (= (and b!991375 res!662741) b!991376))

(assert (=> d!117927 m!918813))

(declare-fun m!919345 () Bool)

(assert (=> b!991376 m!919345))

(assert (=> b!991062 d!117927))

(declare-fun d!117929 () Bool)

(declare-fun lt!439978 () SeekEntryResult!9213)

(assert (=> d!117929 (and (or ((_ is Undefined!9213) lt!439978) (not ((_ is Found!9213) lt!439978)) (and (bvsge (index!39224 lt!439978) #b00000000000000000000000000000000) (bvslt (index!39224 lt!439978) (size!30625 _keys!1544)))) (or ((_ is Undefined!9213) lt!439978) ((_ is Found!9213) lt!439978) (not ((_ is MissingZero!9213) lt!439978)) (and (bvsge (index!39223 lt!439978) #b00000000000000000000000000000000) (bvslt (index!39223 lt!439978) (size!30625 _keys!1544)))) (or ((_ is Undefined!9213) lt!439978) ((_ is Found!9213) lt!439978) ((_ is MissingZero!9213) lt!439978) (not ((_ is MissingVacant!9213) lt!439978)) (and (bvsge (index!39226 lt!439978) #b00000000000000000000000000000000) (bvslt (index!39226 lt!439978) (size!30625 _keys!1544)))) (or ((_ is Undefined!9213) lt!439978) (ite ((_ is Found!9213) lt!439978) (= (select (arr!30146 _keys!1544) (index!39224 lt!439978)) (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9213) lt!439978) (= (select (arr!30146 _keys!1544) (index!39223 lt!439978)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9213) lt!439978) (= (select (arr!30146 _keys!1544) (index!39226 lt!439978)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!559057 () SeekEntryResult!9213)

(assert (=> d!117929 (= lt!439978 e!559057)))

(declare-fun c!100623 () Bool)

(declare-fun lt!439979 () SeekEntryResult!9213)

(assert (=> d!117929 (= c!100623 (and ((_ is Intermediate!9213) lt!439979) (undefined!10025 lt!439979)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62591 (_ BitVec 32)) SeekEntryResult!9213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117929 (= lt!439979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117929 (validMask!0 mask!1948)))

(assert (=> d!117929 (= (seekEntryOrOpen!0 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!439978)))

(declare-fun b!991389 () Bool)

(assert (=> b!991389 (= e!559057 Undefined!9213)))

(declare-fun b!991390 () Bool)

(declare-fun e!559056 () SeekEntryResult!9213)

(assert (=> b!991390 (= e!559056 (Found!9213 (index!39225 lt!439979)))))

(declare-fun b!991391 () Bool)

(declare-fun e!559058 () SeekEntryResult!9213)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62591 (_ BitVec 32)) SeekEntryResult!9213)

(assert (=> b!991391 (= e!559058 (seekKeyOrZeroReturnVacant!0 (x!86231 lt!439979) (index!39225 lt!439979) (index!39225 lt!439979) (select (arr!30146 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!991392 () Bool)

(assert (=> b!991392 (= e!559058 (MissingZero!9213 (index!39225 lt!439979)))))

(declare-fun b!991393 () Bool)

(declare-fun c!100622 () Bool)

(declare-fun lt!439980 () (_ BitVec 64))

(assert (=> b!991393 (= c!100622 (= lt!439980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991393 (= e!559056 e!559058)))

(declare-fun b!991394 () Bool)

(assert (=> b!991394 (= e!559057 e!559056)))

(assert (=> b!991394 (= lt!439980 (select (arr!30146 _keys!1544) (index!39225 lt!439979)))))

(declare-fun c!100621 () Bool)

(assert (=> b!991394 (= c!100621 (= lt!439980 (select (arr!30146 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117929 c!100623) b!991389))

(assert (= (and d!117929 (not c!100623)) b!991394))

(assert (= (and b!991394 c!100621) b!991390))

(assert (= (and b!991394 (not c!100621)) b!991393))

(assert (= (and b!991393 c!100622) b!991392))

(assert (= (and b!991393 (not c!100622)) b!991391))

(declare-fun m!919347 () Bool)

(assert (=> d!117929 m!919347))

(assert (=> d!117929 m!918813))

(declare-fun m!919349 () Bool)

(assert (=> d!117929 m!919349))

(assert (=> d!117929 m!918771))

(declare-fun m!919351 () Bool)

(assert (=> d!117929 m!919351))

(assert (=> d!117929 m!919349))

(assert (=> d!117929 m!918813))

(declare-fun m!919353 () Bool)

(assert (=> d!117929 m!919353))

(declare-fun m!919355 () Bool)

(assert (=> d!117929 m!919355))

(assert (=> b!991391 m!918813))

(declare-fun m!919357 () Bool)

(assert (=> b!991391 m!919357))

(declare-fun m!919359 () Bool)

(assert (=> b!991394 m!919359))

(assert (=> b!991062 d!117929))

(declare-fun b!991395 () Bool)

(declare-fun e!559059 () Bool)

(declare-fun e!559060 () Bool)

(assert (=> b!991395 (= e!559059 e!559060)))

(declare-fun lt!439983 () (_ BitVec 64))

(assert (=> b!991395 (= lt!439983 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!439981 () Unit!32881)

(assert (=> b!991395 (= lt!439981 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439983 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!991395 (arrayContainsKey!0 _keys!1544 lt!439983 #b00000000000000000000000000000000)))

(declare-fun lt!439982 () Unit!32881)

(assert (=> b!991395 (= lt!439982 lt!439981)))

(declare-fun res!662742 () Bool)

(assert (=> b!991395 (= res!662742 (= (seekEntryOrOpen!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9213 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!991395 (=> (not res!662742) (not e!559060))))

(declare-fun bm!42070 () Bool)

(declare-fun call!42073 () Bool)

(assert (=> bm!42070 (= call!42073 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!991396 () Bool)

(assert (=> b!991396 (= e!559060 call!42073)))

(declare-fun b!991398 () Bool)

(assert (=> b!991398 (= e!559059 call!42073)))

(declare-fun b!991397 () Bool)

(declare-fun e!559061 () Bool)

(assert (=> b!991397 (= e!559061 e!559059)))

(declare-fun c!100624 () Bool)

(assert (=> b!991397 (= c!100624 (validKeyInArray!0 (select (arr!30146 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117931 () Bool)

(declare-fun res!662743 () Bool)

(assert (=> d!117931 (=> res!662743 e!559061)))

(assert (=> d!117931 (= res!662743 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30625 _keys!1544)))))

(assert (=> d!117931 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!559061)))

(assert (= (and d!117931 (not res!662743)) b!991397))

(assert (= (and b!991397 c!100624) b!991395))

(assert (= (and b!991397 (not c!100624)) b!991398))

(assert (= (and b!991395 res!662742) b!991396))

(assert (= (or b!991396 b!991398) bm!42070))

(assert (=> b!991395 m!919239))

(declare-fun m!919361 () Bool)

(assert (=> b!991395 m!919361))

(declare-fun m!919363 () Bool)

(assert (=> b!991395 m!919363))

(assert (=> b!991395 m!919239))

(declare-fun m!919365 () Bool)

(assert (=> b!991395 m!919365))

(declare-fun m!919367 () Bool)

(assert (=> bm!42070 m!919367))

(assert (=> b!991397 m!919239))

(assert (=> b!991397 m!919239))

(assert (=> b!991397 m!919241))

(assert (=> bm!42024 d!117931))

(assert (=> b!991174 d!117889))

(assert (=> bm!42046 d!117837))

(assert (=> b!991173 d!117889))

(declare-fun d!117933 () Bool)

(assert (=> d!117933 (= (apply!898 lt!439790 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15656 (getValueByKey!515 (toList!6829 lt!439790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28173 () Bool)

(assert (= bs!28173 d!117933))

(assert (=> bs!28173 m!919141))

(assert (=> bs!28173 m!919141))

(declare-fun m!919369 () Bool)

(assert (=> bs!28173 m!919369))

(assert (=> b!991124 d!117933))

(declare-fun b!991400 () Bool)

(declare-fun e!559062 () Bool)

(assert (=> b!991400 (= e!559062 tp_is_empty!23313)))

(declare-fun mapIsEmpty!37029 () Bool)

(declare-fun mapRes!37029 () Bool)

(assert (=> mapIsEmpty!37029 mapRes!37029))

(declare-fun b!991399 () Bool)

(declare-fun e!559063 () Bool)

(assert (=> b!991399 (= e!559063 tp_is_empty!23313)))

(declare-fun mapNonEmpty!37029 () Bool)

(declare-fun tp!70100 () Bool)

(assert (=> mapNonEmpty!37029 (= mapRes!37029 (and tp!70100 e!559063))))

(declare-fun mapKey!37029 () (_ BitVec 32))

(declare-fun mapRest!37029 () (Array (_ BitVec 32) ValueCell!11175))

(declare-fun mapValue!37029 () ValueCell!11175)

(assert (=> mapNonEmpty!37029 (= mapRest!37028 (store mapRest!37029 mapKey!37029 mapValue!37029))))

(declare-fun condMapEmpty!37029 () Bool)

(declare-fun mapDefault!37029 () ValueCell!11175)

(assert (=> mapNonEmpty!37028 (= condMapEmpty!37029 (= mapRest!37028 ((as const (Array (_ BitVec 32) ValueCell!11175)) mapDefault!37029)))))

(assert (=> mapNonEmpty!37028 (= tp!70099 (and e!559062 mapRes!37029))))

(assert (= (and mapNonEmpty!37028 condMapEmpty!37029) mapIsEmpty!37029))

(assert (= (and mapNonEmpty!37028 (not condMapEmpty!37029)) mapNonEmpty!37029))

(assert (= (and mapNonEmpty!37029 ((_ is ValueCellFull!11175) mapValue!37029)) b!991399))

(assert (= (and mapNonEmpty!37028 ((_ is ValueCellFull!11175) mapDefault!37029)) b!991400))

(declare-fun m!919371 () Bool)

(assert (=> mapNonEmpty!37029 m!919371))

(declare-fun b_lambda!15221 () Bool)

(assert (= b_lambda!15215 (or (and start!84742 b_free!20097) b_lambda!15221)))

(declare-fun b_lambda!15223 () Bool)

(assert (= b_lambda!15217 (or (and start!84742 b_free!20097) b_lambda!15223)))

(declare-fun b_lambda!15225 () Bool)

(assert (= b_lambda!15219 (or (and start!84742 b_free!20097) b_lambda!15225)))

(declare-fun b_lambda!15227 () Bool)

(assert (= b_lambda!15213 (or (and start!84742 b_free!20097) b_lambda!15227)))

(check-sat (not d!117809) (not b!991218) (not b!991293) (not b!991365) (not d!117895) (not d!117925) (not bm!42067) (not b!991308) (not d!117877) (not d!117907) (not d!117857) (not d!117919) (not d!117917) (not d!117933) (not b!991251) (not b_lambda!15227) (not d!117835) (not b!991397) (not b!991246) (not b!991323) (not d!117913) (not d!117891) (not b!991362) (not d!117823) (not b!991305) (not b_lambda!15211) (not d!117875) (not b!991351) (not b!991321) (not b!991194) (not b!991356) (not d!117915) (not d!117827) (not b!991253) (not b!991303) (not b!991316) (not b!991359) (not b!991367) (not b!991369) (not b!991357) (not b!991252) (not b!991337) (not b_next!20097) (not b!991285) (not d!117833) (not d!117911) (not b!991353) (not b!991311) (not b!991320) (not b!991250) (not mapNonEmpty!37029) (not b!991283) (not b!991191) (not d!117921) (not b!991201) (not d!117811) (not d!117819) (not b!991195) (not b!991324) (not b!991368) (not d!117805) (not d!117841) (not bm!42070) (not b!991255) (not b!991282) (not b!991326) (not b!991254) (not b!991219) (not b!991306) (not b!991309) (not b_lambda!15225) (not d!117909) (not d!117859) (not d!117897) (not d!117829) (not b!991391) (not b!991199) (not d!117821) (not d!117899) (not b!991327) (not b!991288) (not b!991342) (not d!117929) (not d!117847) (not d!117881) (not b_lambda!15209) (not b!991395) tp_is_empty!23313 (not b!991284) (not d!117855) (not b!991294) (not bm!42069) (not b!991212) (not d!117839) (not b!991345) (not b!991336) (not b!991354) (not bm!42068) (not d!117845) (not d!117843) (not b!991286) b_and!32287 (not d!117825) (not d!117901) (not d!117885) (not d!117887) (not b!991193) (not d!117865) (not d!117837) (not b!991240) (not b!991299) (not b!991361) (not d!117849) (not b!991196) (not bm!42062) (not b_lambda!15221) (not b!991310) (not b!991328) (not b_lambda!15223) (not d!117861) (not b_lambda!15203) (not d!117851) (not b!991289) (not b!991317) (not d!117853) (not b!991370) (not d!117831) (not d!117873) (not b!991314) (not d!117903) (not b!991318) (not d!117905) (not b!991198) (not b!991241) (not b!991290) (not b!991300) (not b!991313) (not b!991376) (not b!991366) (not d!117879) (not b!991344) (not b!991339) (not d!117923) (not b!991322) (not d!117813) (not d!117815) (not d!117871))
(check-sat b_and!32287 (not b_next!20097))
