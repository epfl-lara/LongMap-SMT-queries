; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84722 () Bool)

(assert start!84722)

(declare-fun b_free!20095 () Bool)

(declare-fun b_next!20095 () Bool)

(assert (=> start!84722 (= b_free!20095 (not b_next!20095))))

(declare-fun tp!70084 () Bool)

(declare-fun b_and!32239 () Bool)

(assert (=> start!84722 (= tp!70084 b_and!32239)))

(declare-fun b!990739 () Bool)

(declare-fun res!662438 () Bool)

(declare-fun e!558658 () Bool)

(assert (=> b!990739 (=> (not res!662438) (not e!558658))))

(declare-datatypes ((array!62516 0))(
  ( (array!62517 (arr!30109 (Array (_ BitVec 32) (_ BitVec 64))) (size!30590 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62516)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990739 (= res!662438 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990740 () Bool)

(declare-fun res!662437 () Bool)

(assert (=> b!990740 (=> (not res!662437) (not e!558658))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36065 0))(
  ( (V!36066 (val!11706 Int)) )
))
(declare-datatypes ((ValueCell!11174 0))(
  ( (ValueCellFull!11174 (v!14278 V!36065)) (EmptyCell!11174) )
))
(declare-datatypes ((array!62518 0))(
  ( (array!62519 (arr!30110 (Array (_ BitVec 32) ValueCell!11174)) (size!30591 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62518)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990740 (= res!662437 (and (= (size!30591 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30590 _keys!1544) (size!30591 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990741 () Bool)

(declare-fun res!662440 () Bool)

(assert (=> b!990741 (=> (not res!662440) (not e!558658))))

(assert (=> b!990741 (= res!662440 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544))))))

(declare-fun b!990742 () Bool)

(declare-fun e!558660 () Bool)

(assert (=> b!990742 (= e!558658 e!558660)))

(declare-fun res!662439 () Bool)

(assert (=> b!990742 (=> (not res!662439) (not e!558660))))

(declare-fun lt!439473 () Bool)

(assert (=> b!990742 (= res!662439 (and (or lt!439473 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439473 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439473))))))

(assert (=> b!990742 (= lt!439473 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!37019 () Bool)

(declare-fun mapRes!37019 () Bool)

(assert (=> mapIsEmpty!37019 mapRes!37019))

(declare-fun b!990743 () Bool)

(declare-fun e!558659 () Bool)

(declare-fun tp_is_empty!23311 () Bool)

(assert (=> b!990743 (= e!558659 tp_is_empty!23311)))

(declare-fun minValue!1220 () V!36065)

(declare-fun b!990744 () Bool)

(declare-fun zeroValue!1220 () V!36065)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!15010 0))(
  ( (tuple2!15011 (_1!7516 (_ BitVec 64)) (_2!7516 V!36065)) )
))
(declare-datatypes ((List!20890 0))(
  ( (Nil!20887) (Cons!20886 (h!22048 tuple2!15010) (t!29860 List!20890)) )
))
(declare-datatypes ((ListLongMap!13697 0))(
  ( (ListLongMap!13698 (toList!6864 List!20890)) )
))
(declare-fun getCurrentListMap!3833 (array!62516 array!62518 (_ BitVec 32) (_ BitVec 32) V!36065 V!36065 (_ BitVec 32) Int) ListLongMap!13697)

(declare-fun +!3121 (ListLongMap!13697 tuple2!15010) ListLongMap!13697)

(declare-fun get!15647 (ValueCell!11174 V!36065) V!36065)

(declare-fun dynLambda!1866 (Int (_ BitVec 64)) V!36065)

(assert (=> b!990744 (= e!558660 (not (= (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3121 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!990745 () Bool)

(declare-fun res!662436 () Bool)

(assert (=> b!990745 (=> (not res!662436) (not e!558658))))

(declare-datatypes ((List!20891 0))(
  ( (Nil!20888) (Cons!20887 (h!22049 (_ BitVec 64)) (t!29861 List!20891)) )
))
(declare-fun arrayNoDuplicates!0 (array!62516 (_ BitVec 32) List!20891) Bool)

(assert (=> b!990745 (= res!662436 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20888))))

(declare-fun res!662434 () Bool)

(assert (=> start!84722 (=> (not res!662434) (not e!558658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84722 (= res!662434 (validMask!0 mask!1948))))

(assert (=> start!84722 e!558658))

(assert (=> start!84722 true))

(assert (=> start!84722 tp_is_empty!23311))

(declare-fun e!558656 () Bool)

(declare-fun array_inv!23267 (array!62518) Bool)

(assert (=> start!84722 (and (array_inv!23267 _values!1278) e!558656)))

(assert (=> start!84722 tp!70084))

(declare-fun array_inv!23268 (array!62516) Bool)

(assert (=> start!84722 (array_inv!23268 _keys!1544)))

(declare-fun b!990746 () Bool)

(declare-fun e!558661 () Bool)

(assert (=> b!990746 (= e!558661 tp_is_empty!23311)))

(declare-fun mapNonEmpty!37019 () Bool)

(declare-fun tp!70085 () Bool)

(assert (=> mapNonEmpty!37019 (= mapRes!37019 (and tp!70085 e!558659))))

(declare-fun mapValue!37019 () ValueCell!11174)

(declare-fun mapRest!37019 () (Array (_ BitVec 32) ValueCell!11174))

(declare-fun mapKey!37019 () (_ BitVec 32))

(assert (=> mapNonEmpty!37019 (= (arr!30110 _values!1278) (store mapRest!37019 mapKey!37019 mapValue!37019))))

(declare-fun b!990747 () Bool)

(assert (=> b!990747 (= e!558656 (and e!558661 mapRes!37019))))

(declare-fun condMapEmpty!37019 () Bool)

(declare-fun mapDefault!37019 () ValueCell!11174)

(assert (=> b!990747 (= condMapEmpty!37019 (= (arr!30110 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11174)) mapDefault!37019)))))

(declare-fun b!990748 () Bool)

(declare-fun res!662435 () Bool)

(assert (=> b!990748 (=> (not res!662435) (not e!558658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62516 (_ BitVec 32)) Bool)

(assert (=> b!990748 (= res!662435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84722 res!662434) b!990740))

(assert (= (and b!990740 res!662437) b!990748))

(assert (= (and b!990748 res!662435) b!990745))

(assert (= (and b!990745 res!662436) b!990741))

(assert (= (and b!990741 res!662440) b!990739))

(assert (= (and b!990739 res!662438) b!990742))

(assert (= (and b!990742 res!662439) b!990744))

(assert (= (and b!990747 condMapEmpty!37019) mapIsEmpty!37019))

(assert (= (and b!990747 (not condMapEmpty!37019)) mapNonEmpty!37019))

(get-info :version)

(assert (= (and mapNonEmpty!37019 ((_ is ValueCellFull!11174) mapValue!37019)) b!990743))

(assert (= (and b!990747 ((_ is ValueCellFull!11174) mapDefault!37019)) b!990746))

(assert (= start!84722 b!990747))

(declare-fun b_lambda!15179 () Bool)

(assert (=> (not b_lambda!15179) (not b!990744)))

(declare-fun t!29859 () Bool)

(declare-fun tb!6821 () Bool)

(assert (=> (and start!84722 (= defaultEntry!1281 defaultEntry!1281) t!29859) tb!6821))

(declare-fun result!13653 () Bool)

(assert (=> tb!6821 (= result!13653 tp_is_empty!23311)))

(assert (=> b!990744 t!29859))

(declare-fun b_and!32241 () Bool)

(assert (= b_and!32239 (and (=> t!29859 result!13653) b_and!32241)))

(declare-fun m!917971 () Bool)

(assert (=> b!990748 m!917971))

(declare-fun m!917973 () Bool)

(assert (=> start!84722 m!917973))

(declare-fun m!917975 () Bool)

(assert (=> start!84722 m!917975))

(declare-fun m!917977 () Bool)

(assert (=> start!84722 m!917977))

(declare-fun m!917979 () Bool)

(assert (=> b!990744 m!917979))

(declare-fun m!917981 () Bool)

(assert (=> b!990744 m!917981))

(declare-fun m!917983 () Bool)

(assert (=> b!990744 m!917983))

(assert (=> b!990744 m!917983))

(declare-fun m!917985 () Bool)

(assert (=> b!990744 m!917985))

(declare-fun m!917987 () Bool)

(assert (=> b!990744 m!917987))

(declare-fun m!917989 () Bool)

(assert (=> b!990744 m!917989))

(assert (=> b!990744 m!917981))

(assert (=> b!990744 m!917989))

(declare-fun m!917991 () Bool)

(assert (=> b!990744 m!917991))

(declare-fun m!917993 () Bool)

(assert (=> mapNonEmpty!37019 m!917993))

(assert (=> b!990739 m!917979))

(assert (=> b!990739 m!917979))

(declare-fun m!917995 () Bool)

(assert (=> b!990739 m!917995))

(declare-fun m!917997 () Bool)

(assert (=> b!990745 m!917997))

(check-sat (not b_next!20095) tp_is_empty!23311 (not b!990744) (not b!990748) (not start!84722) b_and!32241 (not b!990739) (not b_lambda!15179) (not mapNonEmpty!37019) (not b!990745))
(check-sat b_and!32241 (not b_next!20095))
(get-model)

(declare-fun b_lambda!15185 () Bool)

(assert (= b_lambda!15179 (or (and start!84722 b_free!20095) b_lambda!15185)))

(check-sat (not b_next!20095) tp_is_empty!23311 (not b!990744) (not b!990748) (not start!84722) (not b!990739) (not mapNonEmpty!37019) (not b!990745) b_and!32241 (not b_lambda!15185))
(check-sat b_and!32241 (not b_next!20095))
(get-model)

(declare-fun b!990857 () Bool)

(declare-fun res!662501 () Bool)

(declare-fun e!558735 () Bool)

(assert (=> b!990857 (=> (not res!662501) (not e!558735))))

(declare-fun e!558726 () Bool)

(assert (=> b!990857 (= res!662501 e!558726)))

(declare-fun c!100485 () Bool)

(assert (=> b!990857 (= c!100485 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!42010 () Bool)

(declare-fun call!42014 () ListLongMap!13697)

(declare-fun call!42017 () ListLongMap!13697)

(assert (=> bm!42010 (= call!42014 call!42017)))

(declare-fun b!990858 () Bool)

(declare-fun e!558731 () Bool)

(declare-fun lt!439539 () ListLongMap!13697)

(declare-fun apply!891 (ListLongMap!13697 (_ BitVec 64)) V!36065)

(assert (=> b!990858 (= e!558731 (= (apply!891 lt!439539 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun bm!42011 () Bool)

(declare-fun call!42015 () ListLongMap!13697)

(declare-fun call!42019 () ListLongMap!13697)

(assert (=> bm!42011 (= call!42015 call!42019)))

(declare-fun b!990859 () Bool)

(declare-fun e!558724 () ListLongMap!13697)

(assert (=> b!990859 (= e!558724 call!42015)))

(declare-fun b!990860 () Bool)

(declare-fun res!662505 () Bool)

(assert (=> b!990860 (=> (not res!662505) (not e!558735))))

(declare-fun e!558736 () Bool)

(assert (=> b!990860 (= res!662505 e!558736)))

(declare-fun res!662503 () Bool)

(assert (=> b!990860 (=> res!662503 e!558736)))

(declare-fun e!558733 () Bool)

(assert (=> b!990860 (= res!662503 (not e!558733))))

(declare-fun res!662506 () Bool)

(assert (=> b!990860 (=> (not res!662506) (not e!558733))))

(assert (=> b!990860 (= res!662506 (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun b!990861 () Bool)

(declare-datatypes ((Unit!32754 0))(
  ( (Unit!32755) )
))
(declare-fun e!558729 () Unit!32754)

(declare-fun Unit!32756 () Unit!32754)

(assert (=> b!990861 (= e!558729 Unit!32756)))

(declare-fun b!990862 () Bool)

(declare-fun e!558732 () Bool)

(declare-fun call!42013 () Bool)

(assert (=> b!990862 (= e!558732 (not call!42013))))

(declare-fun bm!42012 () Bool)

(declare-fun call!42016 () Bool)

(declare-fun contains!5698 (ListLongMap!13697 (_ BitVec 64)) Bool)

(assert (=> bm!42012 (= call!42016 (contains!5698 lt!439539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!117587 () Bool)

(assert (=> d!117587 e!558735))

(declare-fun res!662509 () Bool)

(assert (=> d!117587 (=> (not res!662509) (not e!558735))))

(assert (=> d!117587 (= res!662509 (or (bvsge from!1932 (size!30590 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544)))))))

(declare-fun lt!439535 () ListLongMap!13697)

(assert (=> d!117587 (= lt!439539 lt!439535)))

(declare-fun lt!439538 () Unit!32754)

(assert (=> d!117587 (= lt!439538 e!558729)))

(declare-fun c!100480 () Bool)

(declare-fun e!558730 () Bool)

(assert (=> d!117587 (= c!100480 e!558730)))

(declare-fun res!662502 () Bool)

(assert (=> d!117587 (=> (not res!662502) (not e!558730))))

(assert (=> d!117587 (= res!662502 (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun e!558725 () ListLongMap!13697)

(assert (=> d!117587 (= lt!439535 e!558725)))

(declare-fun c!100483 () Bool)

(assert (=> d!117587 (= c!100483 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117587 (validMask!0 mask!1948)))

(assert (=> d!117587 (= (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439539)))

(declare-fun bm!42013 () Bool)

(declare-fun call!42018 () ListLongMap!13697)

(assert (=> bm!42013 (= call!42017 call!42018)))

(declare-fun b!990863 () Bool)

(declare-fun e!558734 () Bool)

(assert (=> b!990863 (= e!558736 e!558734)))

(declare-fun res!662504 () Bool)

(assert (=> b!990863 (=> (not res!662504) (not e!558734))))

(assert (=> b!990863 (= res!662504 (contains!5698 lt!439539 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!990863 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun b!990864 () Bool)

(assert (=> b!990864 (= e!558734 (= (apply!891 lt!439539 (select (arr!30109 _keys!1544) from!1932)) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990864 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30591 _values!1278)))))

(assert (=> b!990864 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun b!990865 () Bool)

(declare-fun e!558727 () ListLongMap!13697)

(assert (=> b!990865 (= e!558725 e!558727)))

(declare-fun c!100484 () Bool)

(assert (=> b!990865 (= c!100484 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990866 () Bool)

(declare-fun e!558728 () Bool)

(assert (=> b!990866 (= e!558728 (= (apply!891 lt!439539 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990867 () Bool)

(assert (=> b!990867 (= e!558727 call!42015)))

(declare-fun b!990868 () Bool)

(assert (=> b!990868 (= e!558724 call!42014)))

(declare-fun b!990869 () Bool)

(declare-fun lt!439544 () Unit!32754)

(assert (=> b!990869 (= e!558729 lt!439544)))

(declare-fun lt!439529 () ListLongMap!13697)

(declare-fun getCurrentListMapNoExtraKeys!3557 (array!62516 array!62518 (_ BitVec 32) (_ BitVec 32) V!36065 V!36065 (_ BitVec 32) Int) ListLongMap!13697)

(assert (=> b!990869 (= lt!439529 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439541 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439542 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439542 (select (arr!30109 _keys!1544) from!1932))))

(declare-fun lt!439530 () Unit!32754)

(declare-fun addStillContains!610 (ListLongMap!13697 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32754)

(assert (=> b!990869 (= lt!439530 (addStillContains!610 lt!439529 lt!439541 zeroValue!1220 lt!439542))))

(assert (=> b!990869 (contains!5698 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220)) lt!439542)))

(declare-fun lt!439528 () Unit!32754)

(assert (=> b!990869 (= lt!439528 lt!439530)))

(declare-fun lt!439545 () ListLongMap!13697)

(assert (=> b!990869 (= lt!439545 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439533 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439537 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439537 (select (arr!30109 _keys!1544) from!1932))))

(declare-fun lt!439527 () Unit!32754)

(declare-fun addApplyDifferent!466 (ListLongMap!13697 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32754)

(assert (=> b!990869 (= lt!439527 (addApplyDifferent!466 lt!439545 lt!439533 minValue!1220 lt!439537))))

(assert (=> b!990869 (= (apply!891 (+!3121 lt!439545 (tuple2!15011 lt!439533 minValue!1220)) lt!439537) (apply!891 lt!439545 lt!439537))))

(declare-fun lt!439534 () Unit!32754)

(assert (=> b!990869 (= lt!439534 lt!439527)))

(declare-fun lt!439532 () ListLongMap!13697)

(assert (=> b!990869 (= lt!439532 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439540 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439526 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439526 (select (arr!30109 _keys!1544) from!1932))))

(declare-fun lt!439525 () Unit!32754)

(assert (=> b!990869 (= lt!439525 (addApplyDifferent!466 lt!439532 lt!439540 zeroValue!1220 lt!439526))))

(assert (=> b!990869 (= (apply!891 (+!3121 lt!439532 (tuple2!15011 lt!439540 zeroValue!1220)) lt!439526) (apply!891 lt!439532 lt!439526))))

(declare-fun lt!439524 () Unit!32754)

(assert (=> b!990869 (= lt!439524 lt!439525)))

(declare-fun lt!439536 () ListLongMap!13697)

(assert (=> b!990869 (= lt!439536 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439531 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439531 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439543 () (_ BitVec 64))

(assert (=> b!990869 (= lt!439543 (select (arr!30109 _keys!1544) from!1932))))

(assert (=> b!990869 (= lt!439544 (addApplyDifferent!466 lt!439536 lt!439531 minValue!1220 lt!439543))))

(assert (=> b!990869 (= (apply!891 (+!3121 lt!439536 (tuple2!15011 lt!439531 minValue!1220)) lt!439543) (apply!891 lt!439536 lt!439543))))

(declare-fun b!990870 () Bool)

(assert (=> b!990870 (= e!558733 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990871 () Bool)

(assert (=> b!990871 (= e!558726 (not call!42016))))

(declare-fun b!990872 () Bool)

(assert (=> b!990872 (= e!558726 e!558728)))

(declare-fun res!662507 () Bool)

(assert (=> b!990872 (= res!662507 call!42016)))

(assert (=> b!990872 (=> (not res!662507) (not e!558728))))

(declare-fun b!990873 () Bool)

(assert (=> b!990873 (= e!558732 e!558731)))

(declare-fun res!662508 () Bool)

(assert (=> b!990873 (= res!662508 call!42013)))

(assert (=> b!990873 (=> (not res!662508) (not e!558731))))

(declare-fun b!990874 () Bool)

(assert (=> b!990874 (= e!558730 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990875 () Bool)

(declare-fun c!100481 () Bool)

(assert (=> b!990875 (= c!100481 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!990875 (= e!558727 e!558724)))

(declare-fun bm!42014 () Bool)

(assert (=> bm!42014 (= call!42019 (+!3121 (ite c!100483 call!42018 (ite c!100484 call!42017 call!42014)) (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!990876 () Bool)

(assert (=> b!990876 (= e!558725 (+!3121 call!42019 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!42015 () Bool)

(assert (=> bm!42015 (= call!42013 (contains!5698 lt!439539 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990877 () Bool)

(assert (=> b!990877 (= e!558735 e!558732)))

(declare-fun c!100482 () Bool)

(assert (=> b!990877 (= c!100482 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!42016 () Bool)

(assert (=> bm!42016 (= call!42018 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(assert (= (and d!117587 c!100483) b!990876))

(assert (= (and d!117587 (not c!100483)) b!990865))

(assert (= (and b!990865 c!100484) b!990867))

(assert (= (and b!990865 (not c!100484)) b!990875))

(assert (= (and b!990875 c!100481) b!990859))

(assert (= (and b!990875 (not c!100481)) b!990868))

(assert (= (or b!990859 b!990868) bm!42010))

(assert (= (or b!990867 bm!42010) bm!42013))

(assert (= (or b!990867 b!990859) bm!42011))

(assert (= (or b!990876 bm!42013) bm!42016))

(assert (= (or b!990876 bm!42011) bm!42014))

(assert (= (and d!117587 res!662502) b!990874))

(assert (= (and d!117587 c!100480) b!990869))

(assert (= (and d!117587 (not c!100480)) b!990861))

(assert (= (and d!117587 res!662509) b!990860))

(assert (= (and b!990860 res!662506) b!990870))

(assert (= (and b!990860 (not res!662503)) b!990863))

(assert (= (and b!990863 res!662504) b!990864))

(assert (= (and b!990860 res!662505) b!990857))

(assert (= (and b!990857 c!100485) b!990872))

(assert (= (and b!990857 (not c!100485)) b!990871))

(assert (= (and b!990872 res!662507) b!990866))

(assert (= (or b!990872 b!990871) bm!42012))

(assert (= (and b!990857 res!662501) b!990877))

(assert (= (and b!990877 c!100482) b!990873))

(assert (= (and b!990877 (not c!100482)) b!990862))

(assert (= (and b!990873 res!662508) b!990858))

(assert (= (or b!990873 b!990862) bm!42015))

(declare-fun b_lambda!15187 () Bool)

(assert (=> (not b_lambda!15187) (not b!990864)))

(assert (=> b!990864 t!29859))

(declare-fun b_and!32251 () Bool)

(assert (= b_and!32241 (and (=> t!29859 result!13653) b_and!32251)))

(declare-fun m!918055 () Bool)

(assert (=> bm!42012 m!918055))

(assert (=> b!990864 m!917981))

(assert (=> b!990864 m!917989))

(assert (=> b!990864 m!917979))

(declare-fun m!918057 () Bool)

(assert (=> b!990864 m!918057))

(assert (=> b!990864 m!917981))

(assert (=> b!990864 m!917989))

(assert (=> b!990864 m!917991))

(assert (=> b!990864 m!917979))

(declare-fun m!918059 () Bool)

(assert (=> b!990858 m!918059))

(declare-fun m!918061 () Bool)

(assert (=> bm!42015 m!918061))

(assert (=> b!990870 m!917979))

(assert (=> b!990870 m!917979))

(assert (=> b!990870 m!917995))

(assert (=> d!117587 m!917973))

(declare-fun m!918063 () Bool)

(assert (=> b!990866 m!918063))

(declare-fun m!918065 () Bool)

(assert (=> b!990876 m!918065))

(declare-fun m!918067 () Bool)

(assert (=> b!990869 m!918067))

(declare-fun m!918069 () Bool)

(assert (=> b!990869 m!918069))

(declare-fun m!918071 () Bool)

(assert (=> b!990869 m!918071))

(declare-fun m!918073 () Bool)

(assert (=> b!990869 m!918073))

(declare-fun m!918075 () Bool)

(assert (=> b!990869 m!918075))

(assert (=> b!990869 m!918073))

(declare-fun m!918077 () Bool)

(assert (=> b!990869 m!918077))

(declare-fun m!918079 () Bool)

(assert (=> b!990869 m!918079))

(declare-fun m!918081 () Bool)

(assert (=> b!990869 m!918081))

(assert (=> b!990869 m!918069))

(declare-fun m!918083 () Bool)

(assert (=> b!990869 m!918083))

(declare-fun m!918085 () Bool)

(assert (=> b!990869 m!918085))

(declare-fun m!918087 () Bool)

(assert (=> b!990869 m!918087))

(assert (=> b!990869 m!918079))

(declare-fun m!918089 () Bool)

(assert (=> b!990869 m!918089))

(declare-fun m!918091 () Bool)

(assert (=> b!990869 m!918091))

(declare-fun m!918093 () Bool)

(assert (=> b!990869 m!918093))

(declare-fun m!918095 () Bool)

(assert (=> b!990869 m!918095))

(assert (=> b!990869 m!917979))

(declare-fun m!918097 () Bool)

(assert (=> b!990869 m!918097))

(assert (=> b!990869 m!918091))

(assert (=> bm!42016 m!918067))

(declare-fun m!918099 () Bool)

(assert (=> bm!42014 m!918099))

(assert (=> b!990874 m!917979))

(assert (=> b!990874 m!917979))

(assert (=> b!990874 m!917995))

(assert (=> b!990863 m!917979))

(assert (=> b!990863 m!917979))

(declare-fun m!918101 () Bool)

(assert (=> b!990863 m!918101))

(assert (=> b!990744 d!117587))

(declare-fun d!117589 () Bool)

(declare-fun e!558739 () Bool)

(assert (=> d!117589 e!558739))

(declare-fun res!662515 () Bool)

(assert (=> d!117589 (=> (not res!662515) (not e!558739))))

(declare-fun lt!439557 () ListLongMap!13697)

(assert (=> d!117589 (= res!662515 (contains!5698 lt!439557 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439554 () List!20890)

(assert (=> d!117589 (= lt!439557 (ListLongMap!13698 lt!439554))))

(declare-fun lt!439556 () Unit!32754)

(declare-fun lt!439555 () Unit!32754)

(assert (=> d!117589 (= lt!439556 lt!439555)))

(declare-datatypes ((Option!524 0))(
  ( (Some!523 (v!14281 V!36065)) (None!522) )
))
(declare-fun getValueByKey!518 (List!20890 (_ BitVec 64)) Option!524)

(assert (=> d!117589 (= (getValueByKey!518 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!523 (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!275 (List!20890 (_ BitVec 64) V!36065) Unit!32754)

(assert (=> d!117589 (= lt!439555 (lemmaContainsTupThenGetReturnValue!275 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!332 (List!20890 (_ BitVec 64) V!36065) List!20890)

(assert (=> d!117589 (= lt!439554 (insertStrictlySorted!332 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117589 (= (+!3121 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439557)))

(declare-fun b!990882 () Bool)

(declare-fun res!662514 () Bool)

(assert (=> b!990882 (=> (not res!662514) (not e!558739))))

(assert (=> b!990882 (= res!662514 (= (getValueByKey!518 (toList!6864 lt!439557) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!523 (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!990883 () Bool)

(declare-fun contains!5699 (List!20890 tuple2!15010) Bool)

(assert (=> b!990883 (= e!558739 (contains!5699 (toList!6864 lt!439557) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117589 res!662515) b!990882))

(assert (= (and b!990882 res!662514) b!990883))

(declare-fun m!918103 () Bool)

(assert (=> d!117589 m!918103))

(declare-fun m!918105 () Bool)

(assert (=> d!117589 m!918105))

(declare-fun m!918107 () Bool)

(assert (=> d!117589 m!918107))

(declare-fun m!918109 () Bool)

(assert (=> d!117589 m!918109))

(declare-fun m!918111 () Bool)

(assert (=> b!990882 m!918111))

(declare-fun m!918113 () Bool)

(assert (=> b!990883 m!918113))

(assert (=> b!990744 d!117589))

(declare-fun b!990884 () Bool)

(declare-fun res!662516 () Bool)

(declare-fun e!558751 () Bool)

(assert (=> b!990884 (=> (not res!662516) (not e!558751))))

(declare-fun e!558742 () Bool)

(assert (=> b!990884 (= res!662516 e!558742)))

(declare-fun c!100491 () Bool)

(assert (=> b!990884 (= c!100491 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!42017 () Bool)

(declare-fun call!42021 () ListLongMap!13697)

(declare-fun call!42024 () ListLongMap!13697)

(assert (=> bm!42017 (= call!42021 call!42024)))

(declare-fun b!990885 () Bool)

(declare-fun e!558747 () Bool)

(declare-fun lt!439573 () ListLongMap!13697)

(assert (=> b!990885 (= e!558747 (= (apply!891 lt!439573 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun bm!42018 () Bool)

(declare-fun call!42022 () ListLongMap!13697)

(declare-fun call!42026 () ListLongMap!13697)

(assert (=> bm!42018 (= call!42022 call!42026)))

(declare-fun b!990886 () Bool)

(declare-fun e!558740 () ListLongMap!13697)

(assert (=> b!990886 (= e!558740 call!42022)))

(declare-fun b!990887 () Bool)

(declare-fun res!662520 () Bool)

(assert (=> b!990887 (=> (not res!662520) (not e!558751))))

(declare-fun e!558752 () Bool)

(assert (=> b!990887 (= res!662520 e!558752)))

(declare-fun res!662518 () Bool)

(assert (=> b!990887 (=> res!662518 e!558752)))

(declare-fun e!558749 () Bool)

(assert (=> b!990887 (= res!662518 (not e!558749))))

(declare-fun res!662521 () Bool)

(assert (=> b!990887 (=> (not res!662521) (not e!558749))))

(assert (=> b!990887 (= res!662521 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun b!990888 () Bool)

(declare-fun e!558745 () Unit!32754)

(declare-fun Unit!32757 () Unit!32754)

(assert (=> b!990888 (= e!558745 Unit!32757)))

(declare-fun b!990889 () Bool)

(declare-fun e!558748 () Bool)

(declare-fun call!42020 () Bool)

(assert (=> b!990889 (= e!558748 (not call!42020))))

(declare-fun bm!42019 () Bool)

(declare-fun call!42023 () Bool)

(assert (=> bm!42019 (= call!42023 (contains!5698 lt!439573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!117591 () Bool)

(assert (=> d!117591 e!558751))

(declare-fun res!662524 () Bool)

(assert (=> d!117591 (=> (not res!662524) (not e!558751))))

(assert (=> d!117591 (= res!662524 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))))

(declare-fun lt!439569 () ListLongMap!13697)

(assert (=> d!117591 (= lt!439573 lt!439569)))

(declare-fun lt!439572 () Unit!32754)

(assert (=> d!117591 (= lt!439572 e!558745)))

(declare-fun c!100486 () Bool)

(declare-fun e!558746 () Bool)

(assert (=> d!117591 (= c!100486 e!558746)))

(declare-fun res!662517 () Bool)

(assert (=> d!117591 (=> (not res!662517) (not e!558746))))

(assert (=> d!117591 (= res!662517 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun e!558741 () ListLongMap!13697)

(assert (=> d!117591 (= lt!439569 e!558741)))

(declare-fun c!100489 () Bool)

(assert (=> d!117591 (= c!100489 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117591 (validMask!0 mask!1948)))

(assert (=> d!117591 (= (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439573)))

(declare-fun bm!42020 () Bool)

(declare-fun call!42025 () ListLongMap!13697)

(assert (=> bm!42020 (= call!42024 call!42025)))

(declare-fun b!990890 () Bool)

(declare-fun e!558750 () Bool)

(assert (=> b!990890 (= e!558752 e!558750)))

(declare-fun res!662519 () Bool)

(assert (=> b!990890 (=> (not res!662519) (not e!558750))))

(assert (=> b!990890 (= res!662519 (contains!5698 lt!439573 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990890 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun b!990891 () Bool)

(assert (=> b!990891 (= e!558750 (= (apply!891 lt!439573 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15647 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990891 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30591 _values!1278)))))

(assert (=> b!990891 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun b!990892 () Bool)

(declare-fun e!558743 () ListLongMap!13697)

(assert (=> b!990892 (= e!558741 e!558743)))

(declare-fun c!100490 () Bool)

(assert (=> b!990892 (= c!100490 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990893 () Bool)

(declare-fun e!558744 () Bool)

(assert (=> b!990893 (= e!558744 (= (apply!891 lt!439573 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990894 () Bool)

(assert (=> b!990894 (= e!558743 call!42022)))

(declare-fun b!990895 () Bool)

(assert (=> b!990895 (= e!558740 call!42021)))

(declare-fun b!990896 () Bool)

(declare-fun lt!439578 () Unit!32754)

(assert (=> b!990896 (= e!558745 lt!439578)))

(declare-fun lt!439563 () ListLongMap!13697)

(assert (=> b!990896 (= lt!439563 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439575 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439576 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439576 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439564 () Unit!32754)

(assert (=> b!990896 (= lt!439564 (addStillContains!610 lt!439563 lt!439575 zeroValue!1220 lt!439576))))

(assert (=> b!990896 (contains!5698 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220)) lt!439576)))

(declare-fun lt!439562 () Unit!32754)

(assert (=> b!990896 (= lt!439562 lt!439564)))

(declare-fun lt!439579 () ListLongMap!13697)

(assert (=> b!990896 (= lt!439579 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439567 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439571 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439571 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439561 () Unit!32754)

(assert (=> b!990896 (= lt!439561 (addApplyDifferent!466 lt!439579 lt!439567 minValue!1220 lt!439571))))

(assert (=> b!990896 (= (apply!891 (+!3121 lt!439579 (tuple2!15011 lt!439567 minValue!1220)) lt!439571) (apply!891 lt!439579 lt!439571))))

(declare-fun lt!439568 () Unit!32754)

(assert (=> b!990896 (= lt!439568 lt!439561)))

(declare-fun lt!439566 () ListLongMap!13697)

(assert (=> b!990896 (= lt!439566 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439574 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439560 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439560 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439559 () Unit!32754)

(assert (=> b!990896 (= lt!439559 (addApplyDifferent!466 lt!439566 lt!439574 zeroValue!1220 lt!439560))))

(assert (=> b!990896 (= (apply!891 (+!3121 lt!439566 (tuple2!15011 lt!439574 zeroValue!1220)) lt!439560) (apply!891 lt!439566 lt!439560))))

(declare-fun lt!439558 () Unit!32754)

(assert (=> b!990896 (= lt!439558 lt!439559)))

(declare-fun lt!439570 () ListLongMap!13697)

(assert (=> b!990896 (= lt!439570 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439565 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439565 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439577 () (_ BitVec 64))

(assert (=> b!990896 (= lt!439577 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!990896 (= lt!439578 (addApplyDifferent!466 lt!439570 lt!439565 minValue!1220 lt!439577))))

(assert (=> b!990896 (= (apply!891 (+!3121 lt!439570 (tuple2!15011 lt!439565 minValue!1220)) lt!439577) (apply!891 lt!439570 lt!439577))))

(declare-fun b!990897 () Bool)

(assert (=> b!990897 (= e!558749 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990898 () Bool)

(assert (=> b!990898 (= e!558742 (not call!42023))))

(declare-fun b!990899 () Bool)

(assert (=> b!990899 (= e!558742 e!558744)))

(declare-fun res!662522 () Bool)

(assert (=> b!990899 (= res!662522 call!42023)))

(assert (=> b!990899 (=> (not res!662522) (not e!558744))))

(declare-fun b!990900 () Bool)

(assert (=> b!990900 (= e!558748 e!558747)))

(declare-fun res!662523 () Bool)

(assert (=> b!990900 (= res!662523 call!42020)))

(assert (=> b!990900 (=> (not res!662523) (not e!558747))))

(declare-fun b!990901 () Bool)

(assert (=> b!990901 (= e!558746 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990902 () Bool)

(declare-fun c!100487 () Bool)

(assert (=> b!990902 (= c!100487 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!990902 (= e!558743 e!558740)))

(declare-fun bm!42021 () Bool)

(assert (=> bm!42021 (= call!42026 (+!3121 (ite c!100489 call!42025 (ite c!100490 call!42024 call!42021)) (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!990903 () Bool)

(assert (=> b!990903 (= e!558741 (+!3121 call!42026 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!42022 () Bool)

(assert (=> bm!42022 (= call!42020 (contains!5698 lt!439573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990904 () Bool)

(assert (=> b!990904 (= e!558751 e!558748)))

(declare-fun c!100488 () Bool)

(assert (=> b!990904 (= c!100488 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!42023 () Bool)

(assert (=> bm!42023 (= call!42025 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and d!117591 c!100489) b!990903))

(assert (= (and d!117591 (not c!100489)) b!990892))

(assert (= (and b!990892 c!100490) b!990894))

(assert (= (and b!990892 (not c!100490)) b!990902))

(assert (= (and b!990902 c!100487) b!990886))

(assert (= (and b!990902 (not c!100487)) b!990895))

(assert (= (or b!990886 b!990895) bm!42017))

(assert (= (or b!990894 bm!42017) bm!42020))

(assert (= (or b!990894 b!990886) bm!42018))

(assert (= (or b!990903 bm!42020) bm!42023))

(assert (= (or b!990903 bm!42018) bm!42021))

(assert (= (and d!117591 res!662517) b!990901))

(assert (= (and d!117591 c!100486) b!990896))

(assert (= (and d!117591 (not c!100486)) b!990888))

(assert (= (and d!117591 res!662524) b!990887))

(assert (= (and b!990887 res!662521) b!990897))

(assert (= (and b!990887 (not res!662518)) b!990890))

(assert (= (and b!990890 res!662519) b!990891))

(assert (= (and b!990887 res!662520) b!990884))

(assert (= (and b!990884 c!100491) b!990899))

(assert (= (and b!990884 (not c!100491)) b!990898))

(assert (= (and b!990899 res!662522) b!990893))

(assert (= (or b!990899 b!990898) bm!42019))

(assert (= (and b!990884 res!662516) b!990904))

(assert (= (and b!990904 c!100488) b!990900))

(assert (= (and b!990904 (not c!100488)) b!990889))

(assert (= (and b!990900 res!662523) b!990885))

(assert (= (or b!990900 b!990889) bm!42022))

(declare-fun b_lambda!15189 () Bool)

(assert (=> (not b_lambda!15189) (not b!990891)))

(assert (=> b!990891 t!29859))

(declare-fun b_and!32253 () Bool)

(assert (= b_and!32251 (and (=> t!29859 result!13653) b_and!32253)))

(declare-fun m!918115 () Bool)

(assert (=> bm!42019 m!918115))

(declare-fun m!918117 () Bool)

(assert (=> b!990891 m!918117))

(assert (=> b!990891 m!917989))

(declare-fun m!918119 () Bool)

(assert (=> b!990891 m!918119))

(declare-fun m!918121 () Bool)

(assert (=> b!990891 m!918121))

(assert (=> b!990891 m!918117))

(assert (=> b!990891 m!917989))

(declare-fun m!918123 () Bool)

(assert (=> b!990891 m!918123))

(assert (=> b!990891 m!918119))

(declare-fun m!918125 () Bool)

(assert (=> b!990885 m!918125))

(declare-fun m!918127 () Bool)

(assert (=> bm!42022 m!918127))

(assert (=> b!990897 m!918119))

(assert (=> b!990897 m!918119))

(declare-fun m!918129 () Bool)

(assert (=> b!990897 m!918129))

(assert (=> d!117591 m!917973))

(declare-fun m!918131 () Bool)

(assert (=> b!990893 m!918131))

(declare-fun m!918133 () Bool)

(assert (=> b!990903 m!918133))

(declare-fun m!918135 () Bool)

(assert (=> b!990896 m!918135))

(declare-fun m!918137 () Bool)

(assert (=> b!990896 m!918137))

(declare-fun m!918139 () Bool)

(assert (=> b!990896 m!918139))

(declare-fun m!918141 () Bool)

(assert (=> b!990896 m!918141))

(declare-fun m!918143 () Bool)

(assert (=> b!990896 m!918143))

(assert (=> b!990896 m!918141))

(declare-fun m!918145 () Bool)

(assert (=> b!990896 m!918145))

(declare-fun m!918147 () Bool)

(assert (=> b!990896 m!918147))

(declare-fun m!918149 () Bool)

(assert (=> b!990896 m!918149))

(assert (=> b!990896 m!918137))

(declare-fun m!918151 () Bool)

(assert (=> b!990896 m!918151))

(declare-fun m!918153 () Bool)

(assert (=> b!990896 m!918153))

(declare-fun m!918155 () Bool)

(assert (=> b!990896 m!918155))

(assert (=> b!990896 m!918147))

(declare-fun m!918157 () Bool)

(assert (=> b!990896 m!918157))

(declare-fun m!918159 () Bool)

(assert (=> b!990896 m!918159))

(declare-fun m!918161 () Bool)

(assert (=> b!990896 m!918161))

(declare-fun m!918163 () Bool)

(assert (=> b!990896 m!918163))

(assert (=> b!990896 m!918119))

(declare-fun m!918165 () Bool)

(assert (=> b!990896 m!918165))

(assert (=> b!990896 m!918159))

(assert (=> bm!42023 m!918135))

(declare-fun m!918167 () Bool)

(assert (=> bm!42021 m!918167))

(assert (=> b!990901 m!918119))

(assert (=> b!990901 m!918119))

(assert (=> b!990901 m!918129))

(assert (=> b!990890 m!918119))

(assert (=> b!990890 m!918119))

(declare-fun m!918169 () Bool)

(assert (=> b!990890 m!918169))

(assert (=> b!990744 d!117591))

(declare-fun d!117593 () Bool)

(declare-fun c!100494 () Bool)

(assert (=> d!117593 (= c!100494 ((_ is ValueCellFull!11174) (select (arr!30110 _values!1278) from!1932)))))

(declare-fun e!558755 () V!36065)

(assert (=> d!117593 (= (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558755)))

(declare-fun b!990909 () Bool)

(declare-fun get!15649 (ValueCell!11174 V!36065) V!36065)

(assert (=> b!990909 (= e!558755 (get!15649 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990910 () Bool)

(declare-fun get!15650 (ValueCell!11174 V!36065) V!36065)

(assert (=> b!990910 (= e!558755 (get!15650 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117593 c!100494) b!990909))

(assert (= (and d!117593 (not c!100494)) b!990910))

(assert (=> b!990909 m!917981))

(assert (=> b!990909 m!917989))

(declare-fun m!918171 () Bool)

(assert (=> b!990909 m!918171))

(assert (=> b!990910 m!917981))

(assert (=> b!990910 m!917989))

(declare-fun m!918173 () Bool)

(assert (=> b!990910 m!918173))

(assert (=> b!990744 d!117593))

(declare-fun b!990919 () Bool)

(declare-fun e!558764 () Bool)

(declare-fun call!42029 () Bool)

(assert (=> b!990919 (= e!558764 call!42029)))

(declare-fun b!990921 () Bool)

(declare-fun e!558763 () Bool)

(assert (=> b!990921 (= e!558763 call!42029)))

(declare-fun bm!42026 () Bool)

(assert (=> bm!42026 (= call!42029 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990922 () Bool)

(declare-fun e!558762 () Bool)

(assert (=> b!990922 (= e!558762 e!558764)))

(declare-fun c!100497 () Bool)

(assert (=> b!990922 (= c!100497 (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117595 () Bool)

(declare-fun res!662530 () Bool)

(assert (=> d!117595 (=> res!662530 e!558762)))

(assert (=> d!117595 (= res!662530 (bvsge #b00000000000000000000000000000000 (size!30590 _keys!1544)))))

(assert (=> d!117595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558762)))

(declare-fun b!990920 () Bool)

(assert (=> b!990920 (= e!558764 e!558763)))

(declare-fun lt!439586 () (_ BitVec 64))

(assert (=> b!990920 (= lt!439586 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!439587 () Unit!32754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62516 (_ BitVec 64) (_ BitVec 32)) Unit!32754)

(assert (=> b!990920 (= lt!439587 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439586 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!990920 (arrayContainsKey!0 _keys!1544 lt!439586 #b00000000000000000000000000000000)))

(declare-fun lt!439588 () Unit!32754)

(assert (=> b!990920 (= lt!439588 lt!439587)))

(declare-fun res!662529 () Bool)

(declare-datatypes ((SeekEntryResult!9208 0))(
  ( (MissingZero!9208 (index!39203 (_ BitVec 32))) (Found!9208 (index!39204 (_ BitVec 32))) (Intermediate!9208 (undefined!10020 Bool) (index!39205 (_ BitVec 32)) (x!86221 (_ BitVec 32))) (Undefined!9208) (MissingVacant!9208 (index!39206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62516 (_ BitVec 32)) SeekEntryResult!9208)

(assert (=> b!990920 (= res!662529 (= (seekEntryOrOpen!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9208 #b00000000000000000000000000000000)))))

(assert (=> b!990920 (=> (not res!662529) (not e!558763))))

(assert (= (and d!117595 (not res!662530)) b!990922))

(assert (= (and b!990922 c!100497) b!990920))

(assert (= (and b!990922 (not c!100497)) b!990919))

(assert (= (and b!990920 res!662529) b!990921))

(assert (= (or b!990921 b!990919) bm!42026))

(declare-fun m!918175 () Bool)

(assert (=> bm!42026 m!918175))

(declare-fun m!918177 () Bool)

(assert (=> b!990922 m!918177))

(assert (=> b!990922 m!918177))

(declare-fun m!918179 () Bool)

(assert (=> b!990922 m!918179))

(assert (=> b!990920 m!918177))

(declare-fun m!918181 () Bool)

(assert (=> b!990920 m!918181))

(declare-fun m!918183 () Bool)

(assert (=> b!990920 m!918183))

(assert (=> b!990920 m!918177))

(declare-fun m!918185 () Bool)

(assert (=> b!990920 m!918185))

(assert (=> b!990748 d!117595))

(declare-fun d!117597 () Bool)

(assert (=> d!117597 (= (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)) (and (not (= (select (arr!30109 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30109 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990739 d!117597))

(declare-fun d!117599 () Bool)

(assert (=> d!117599 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84722 d!117599))

(declare-fun d!117601 () Bool)

(assert (=> d!117601 (= (array_inv!23267 _values!1278) (bvsge (size!30591 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84722 d!117601))

(declare-fun d!117603 () Bool)

(assert (=> d!117603 (= (array_inv!23268 _keys!1544) (bvsge (size!30590 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84722 d!117603))

(declare-fun b!990933 () Bool)

(declare-fun e!558773 () Bool)

(declare-fun contains!5700 (List!20891 (_ BitVec 64)) Bool)

(assert (=> b!990933 (= e!558773 (contains!5700 Nil!20888 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990934 () Bool)

(declare-fun e!558774 () Bool)

(declare-fun call!42032 () Bool)

(assert (=> b!990934 (= e!558774 call!42032)))

(declare-fun bm!42029 () Bool)

(declare-fun c!100500 () Bool)

(assert (=> bm!42029 (= call!42032 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100500 (Cons!20887 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20888) Nil!20888)))))

(declare-fun d!117605 () Bool)

(declare-fun res!662539 () Bool)

(declare-fun e!558776 () Bool)

(assert (=> d!117605 (=> res!662539 e!558776)))

(assert (=> d!117605 (= res!662539 (bvsge #b00000000000000000000000000000000 (size!30590 _keys!1544)))))

(assert (=> d!117605 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20888) e!558776)))

(declare-fun b!990935 () Bool)

(declare-fun e!558775 () Bool)

(assert (=> b!990935 (= e!558776 e!558775)))

(declare-fun res!662537 () Bool)

(assert (=> b!990935 (=> (not res!662537) (not e!558775))))

(assert (=> b!990935 (= res!662537 (not e!558773))))

(declare-fun res!662538 () Bool)

(assert (=> b!990935 (=> (not res!662538) (not e!558773))))

(assert (=> b!990935 (= res!662538 (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990936 () Bool)

(assert (=> b!990936 (= e!558775 e!558774)))

(assert (=> b!990936 (= c!100500 (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990937 () Bool)

(assert (=> b!990937 (= e!558774 call!42032)))

(assert (= (and d!117605 (not res!662539)) b!990935))

(assert (= (and b!990935 res!662538) b!990933))

(assert (= (and b!990935 res!662537) b!990936))

(assert (= (and b!990936 c!100500) b!990934))

(assert (= (and b!990936 (not c!100500)) b!990937))

(assert (= (or b!990934 b!990937) bm!42029))

(assert (=> b!990933 m!918177))

(assert (=> b!990933 m!918177))

(declare-fun m!918187 () Bool)

(assert (=> b!990933 m!918187))

(assert (=> bm!42029 m!918177))

(declare-fun m!918189 () Bool)

(assert (=> bm!42029 m!918189))

(assert (=> b!990935 m!918177))

(assert (=> b!990935 m!918177))

(assert (=> b!990935 m!918179))

(assert (=> b!990936 m!918177))

(assert (=> b!990936 m!918177))

(assert (=> b!990936 m!918179))

(assert (=> b!990745 d!117605))

(declare-fun mapIsEmpty!37028 () Bool)

(declare-fun mapRes!37028 () Bool)

(assert (=> mapIsEmpty!37028 mapRes!37028))

(declare-fun mapNonEmpty!37028 () Bool)

(declare-fun tp!70100 () Bool)

(declare-fun e!558782 () Bool)

(assert (=> mapNonEmpty!37028 (= mapRes!37028 (and tp!70100 e!558782))))

(declare-fun mapValue!37028 () ValueCell!11174)

(declare-fun mapRest!37028 () (Array (_ BitVec 32) ValueCell!11174))

(declare-fun mapKey!37028 () (_ BitVec 32))

(assert (=> mapNonEmpty!37028 (= mapRest!37019 (store mapRest!37028 mapKey!37028 mapValue!37028))))

(declare-fun b!990945 () Bool)

(declare-fun e!558781 () Bool)

(assert (=> b!990945 (= e!558781 tp_is_empty!23311)))

(declare-fun b!990944 () Bool)

(assert (=> b!990944 (= e!558782 tp_is_empty!23311)))

(declare-fun condMapEmpty!37028 () Bool)

(declare-fun mapDefault!37028 () ValueCell!11174)

(assert (=> mapNonEmpty!37019 (= condMapEmpty!37028 (= mapRest!37019 ((as const (Array (_ BitVec 32) ValueCell!11174)) mapDefault!37028)))))

(assert (=> mapNonEmpty!37019 (= tp!70085 (and e!558781 mapRes!37028))))

(assert (= (and mapNonEmpty!37019 condMapEmpty!37028) mapIsEmpty!37028))

(assert (= (and mapNonEmpty!37019 (not condMapEmpty!37028)) mapNonEmpty!37028))

(assert (= (and mapNonEmpty!37028 ((_ is ValueCellFull!11174) mapValue!37028)) b!990944))

(assert (= (and mapNonEmpty!37019 ((_ is ValueCellFull!11174) mapDefault!37028)) b!990945))

(declare-fun m!918191 () Bool)

(assert (=> mapNonEmpty!37028 m!918191))

(declare-fun b_lambda!15191 () Bool)

(assert (= b_lambda!15187 (or (and start!84722 b_free!20095) b_lambda!15191)))

(declare-fun b_lambda!15193 () Bool)

(assert (= b_lambda!15189 (or (and start!84722 b_free!20095) b_lambda!15193)))

(check-sat (not mapNonEmpty!37028) (not b!990869) (not b!990874) (not bm!42012) (not b!990922) (not b!990864) b_and!32253 (not b!990866) (not d!117591) (not bm!42021) (not d!117587) (not bm!42022) (not b_lambda!15191) (not b_next!20095) (not d!117589) (not b!990882) (not b!990920) (not b!990896) (not b!990890) (not b!990885) tp_is_empty!23311 (not b!990909) (not bm!42015) (not b!990870) (not b!990858) (not b!990901) (not b!990910) (not bm!42016) (not b!990883) (not b!990935) (not b!990891) (not b!990897) (not b!990933) (not b!990893) (not bm!42014) (not b!990903) (not bm!42023) (not b!990936) (not bm!42029) (not bm!42026) (not b_lambda!15193) (not b!990876) (not b_lambda!15185) (not b!990863) (not bm!42019))
(check-sat b_and!32253 (not b_next!20095))
(get-model)

(declare-fun d!117607 () Bool)

(declare-fun e!558787 () Bool)

(assert (=> d!117607 e!558787))

(declare-fun res!662542 () Bool)

(assert (=> d!117607 (=> res!662542 e!558787)))

(declare-fun lt!439598 () Bool)

(assert (=> d!117607 (= res!662542 (not lt!439598))))

(declare-fun lt!439599 () Bool)

(assert (=> d!117607 (= lt!439598 lt!439599)))

(declare-fun lt!439597 () Unit!32754)

(declare-fun e!558788 () Unit!32754)

(assert (=> d!117607 (= lt!439597 e!558788)))

(declare-fun c!100503 () Bool)

(assert (=> d!117607 (= c!100503 lt!439599)))

(declare-fun containsKey!480 (List!20890 (_ BitVec 64)) Bool)

(assert (=> d!117607 (= lt!439599 (containsKey!480 (toList!6864 lt!439573) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117607 (= (contains!5698 lt!439573 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439598)))

(declare-fun b!990952 () Bool)

(declare-fun lt!439600 () Unit!32754)

(assert (=> b!990952 (= e!558788 lt!439600)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!375 (List!20890 (_ BitVec 64)) Unit!32754)

(assert (=> b!990952 (= lt!439600 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439573) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!388 (Option!524) Bool)

(assert (=> b!990952 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439573) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990953 () Bool)

(declare-fun Unit!32758 () Unit!32754)

(assert (=> b!990953 (= e!558788 Unit!32758)))

(declare-fun b!990954 () Bool)

(assert (=> b!990954 (= e!558787 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117607 c!100503) b!990952))

(assert (= (and d!117607 (not c!100503)) b!990953))

(assert (= (and d!117607 (not res!662542)) b!990954))

(declare-fun m!918193 () Bool)

(assert (=> d!117607 m!918193))

(declare-fun m!918195 () Bool)

(assert (=> b!990952 m!918195))

(declare-fun m!918197 () Bool)

(assert (=> b!990952 m!918197))

(assert (=> b!990952 m!918197))

(declare-fun m!918199 () Bool)

(assert (=> b!990952 m!918199))

(assert (=> b!990954 m!918197))

(assert (=> b!990954 m!918197))

(assert (=> b!990954 m!918199))

(assert (=> bm!42022 d!117607))

(declare-fun d!117609 () Bool)

(declare-fun e!558789 () Bool)

(assert (=> d!117609 e!558789))

(declare-fun res!662543 () Bool)

(assert (=> d!117609 (=> res!662543 e!558789)))

(declare-fun lt!439602 () Bool)

(assert (=> d!117609 (= res!662543 (not lt!439602))))

(declare-fun lt!439603 () Bool)

(assert (=> d!117609 (= lt!439602 lt!439603)))

(declare-fun lt!439601 () Unit!32754)

(declare-fun e!558790 () Unit!32754)

(assert (=> d!117609 (= lt!439601 e!558790)))

(declare-fun c!100504 () Bool)

(assert (=> d!117609 (= c!100504 lt!439603)))

(assert (=> d!117609 (= lt!439603 (containsKey!480 (toList!6864 lt!439557) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117609 (= (contains!5698 lt!439557 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!439602)))

(declare-fun b!990955 () Bool)

(declare-fun lt!439604 () Unit!32754)

(assert (=> b!990955 (= e!558790 lt!439604)))

(assert (=> b!990955 (= lt!439604 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439557) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!990955 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439557) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!990956 () Bool)

(declare-fun Unit!32759 () Unit!32754)

(assert (=> b!990956 (= e!558790 Unit!32759)))

(declare-fun b!990957 () Bool)

(assert (=> b!990957 (= e!558789 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439557) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!117609 c!100504) b!990955))

(assert (= (and d!117609 (not c!100504)) b!990956))

(assert (= (and d!117609 (not res!662543)) b!990957))

(declare-fun m!918201 () Bool)

(assert (=> d!117609 m!918201))

(declare-fun m!918203 () Bool)

(assert (=> b!990955 m!918203))

(assert (=> b!990955 m!918111))

(assert (=> b!990955 m!918111))

(declare-fun m!918205 () Bool)

(assert (=> b!990955 m!918205))

(assert (=> b!990957 m!918111))

(assert (=> b!990957 m!918111))

(assert (=> b!990957 m!918205))

(assert (=> d!117589 d!117609))

(declare-fun b!990967 () Bool)

(declare-fun e!558795 () Option!524)

(declare-fun e!558796 () Option!524)

(assert (=> b!990967 (= e!558795 e!558796)))

(declare-fun c!100510 () Bool)

(assert (=> b!990967 (= c!100510 (and ((_ is Cons!20886) lt!439554) (not (= (_1!7516 (h!22048 lt!439554)) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!100509 () Bool)

(declare-fun d!117611 () Bool)

(assert (=> d!117611 (= c!100509 (and ((_ is Cons!20886) lt!439554) (= (_1!7516 (h!22048 lt!439554)) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!117611 (= (getValueByKey!518 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!558795)))

(declare-fun b!990968 () Bool)

(assert (=> b!990968 (= e!558796 (getValueByKey!518 (t!29860 lt!439554) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!990966 () Bool)

(assert (=> b!990966 (= e!558795 (Some!523 (_2!7516 (h!22048 lt!439554))))))

(declare-fun b!990969 () Bool)

(assert (=> b!990969 (= e!558796 None!522)))

(assert (= (and d!117611 c!100509) b!990966))

(assert (= (and d!117611 (not c!100509)) b!990967))

(assert (= (and b!990967 c!100510) b!990968))

(assert (= (and b!990967 (not c!100510)) b!990969))

(declare-fun m!918207 () Bool)

(assert (=> b!990968 m!918207))

(assert (=> d!117589 d!117611))

(declare-fun d!117613 () Bool)

(assert (=> d!117613 (= (getValueByKey!518 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!523 (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439607 () Unit!32754)

(declare-fun choose!1629 (List!20890 (_ BitVec 64) V!36065) Unit!32754)

(assert (=> d!117613 (= lt!439607 (choose!1629 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!558799 () Bool)

(assert (=> d!117613 e!558799))

(declare-fun res!662548 () Bool)

(assert (=> d!117613 (=> (not res!662548) (not e!558799))))

(declare-fun isStrictlySorted!514 (List!20890) Bool)

(assert (=> d!117613 (= res!662548 (isStrictlySorted!514 lt!439554))))

(assert (=> d!117613 (= (lemmaContainsTupThenGetReturnValue!275 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!439607)))

(declare-fun b!990974 () Bool)

(declare-fun res!662549 () Bool)

(assert (=> b!990974 (=> (not res!662549) (not e!558799))))

(assert (=> b!990974 (= res!662549 (containsKey!480 lt!439554 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!990975 () Bool)

(assert (=> b!990975 (= e!558799 (contains!5699 lt!439554 (tuple2!15011 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!117613 res!662548) b!990974))

(assert (= (and b!990974 res!662549) b!990975))

(assert (=> d!117613 m!918105))

(declare-fun m!918209 () Bool)

(assert (=> d!117613 m!918209))

(declare-fun m!918211 () Bool)

(assert (=> d!117613 m!918211))

(declare-fun m!918213 () Bool)

(assert (=> b!990974 m!918213))

(declare-fun m!918215 () Bool)

(assert (=> b!990975 m!918215))

(assert (=> d!117589 d!117613))

(declare-fun b!990996 () Bool)

(declare-fun e!558811 () List!20890)

(declare-fun call!42041 () List!20890)

(assert (=> b!990996 (= e!558811 call!42041)))

(declare-fun bm!42036 () Bool)

(declare-fun call!42039 () List!20890)

(assert (=> bm!42036 (= call!42039 call!42041)))

(declare-fun e!558813 () List!20890)

(declare-fun b!990997 () Bool)

(assert (=> b!990997 (= e!558813 (insertStrictlySorted!332 (t!29860 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!100520 () Bool)

(declare-fun b!990998 () Bool)

(assert (=> b!990998 (= c!100520 (and ((_ is Cons!20886) (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7516 (h!22048 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!558810 () List!20890)

(assert (=> b!990998 (= e!558811 e!558810)))

(declare-fun b!990999 () Bool)

(declare-fun e!558812 () List!20890)

(declare-fun call!42040 () List!20890)

(assert (=> b!990999 (= e!558812 call!42040)))

(declare-fun b!991000 () Bool)

(declare-fun res!662554 () Bool)

(declare-fun e!558814 () Bool)

(assert (=> b!991000 (=> (not res!662554) (not e!558814))))

(declare-fun lt!439610 () List!20890)

(assert (=> b!991000 (= res!662554 (containsKey!480 lt!439610 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!991001 () Bool)

(assert (=> b!991001 (= e!558810 call!42039)))

(declare-fun b!991002 () Bool)

(assert (=> b!991002 (= e!558812 e!558811)))

(declare-fun c!100519 () Bool)

(assert (=> b!991002 (= c!100519 (and ((_ is Cons!20886) (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7516 (h!22048 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!42037 () Bool)

(assert (=> bm!42037 (= call!42041 call!42040)))

(declare-fun d!117615 () Bool)

(assert (=> d!117615 e!558814))

(declare-fun res!662555 () Bool)

(assert (=> d!117615 (=> (not res!662555) (not e!558814))))

(assert (=> d!117615 (= res!662555 (isStrictlySorted!514 lt!439610))))

(assert (=> d!117615 (= lt!439610 e!558812)))

(declare-fun c!100521 () Bool)

(assert (=> d!117615 (= c!100521 (and ((_ is Cons!20886) (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7516 (h!22048 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!117615 (isStrictlySorted!514 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117615 (= (insertStrictlySorted!332 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!439610)))

(declare-fun b!991003 () Bool)

(assert (=> b!991003 (= e!558813 (ite c!100519 (t!29860 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100520 (Cons!20886 (h!22048 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29860 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20887)))))

(declare-fun bm!42038 () Bool)

(declare-fun $colon$colon!558 (List!20890 tuple2!15010) List!20890)

(assert (=> bm!42038 (= call!42040 ($colon$colon!558 e!558813 (ite c!100521 (h!22048 (toList!6864 (getCurrentListMap!3833 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!15011 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!100522 () Bool)

(assert (=> bm!42038 (= c!100522 c!100521)))

(declare-fun b!991004 () Bool)

(assert (=> b!991004 (= e!558814 (contains!5699 lt!439610 (tuple2!15011 (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!991005 () Bool)

(assert (=> b!991005 (= e!558810 call!42039)))

(assert (= (and d!117615 c!100521) b!990999))

(assert (= (and d!117615 (not c!100521)) b!991002))

(assert (= (and b!991002 c!100519) b!990996))

(assert (= (and b!991002 (not c!100519)) b!990998))

(assert (= (and b!990998 c!100520) b!991001))

(assert (= (and b!990998 (not c!100520)) b!991005))

(assert (= (or b!991001 b!991005) bm!42036))

(assert (= (or b!990996 bm!42036) bm!42037))

(assert (= (or b!990999 bm!42037) bm!42038))

(assert (= (and bm!42038 c!100522) b!990997))

(assert (= (and bm!42038 (not c!100522)) b!991003))

(assert (= (and d!117615 res!662555) b!991000))

(assert (= (and b!991000 res!662554) b!991004))

(declare-fun m!918217 () Bool)

(assert (=> b!991000 m!918217))

(declare-fun m!918219 () Bool)

(assert (=> b!991004 m!918219))

(declare-fun m!918221 () Bool)

(assert (=> d!117615 m!918221))

(declare-fun m!918223 () Bool)

(assert (=> d!117615 m!918223))

(declare-fun m!918225 () Bool)

(assert (=> bm!42038 m!918225))

(declare-fun m!918227 () Bool)

(assert (=> b!990997 m!918227))

(assert (=> d!117589 d!117615))

(assert (=> b!990870 d!117597))

(declare-fun d!117617 () Bool)

(declare-fun e!558815 () Bool)

(assert (=> d!117617 e!558815))

(declare-fun res!662557 () Bool)

(assert (=> d!117617 (=> (not res!662557) (not e!558815))))

(declare-fun lt!439614 () ListLongMap!13697)

(assert (=> d!117617 (= res!662557 (contains!5698 lt!439614 (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439611 () List!20890)

(assert (=> d!117617 (= lt!439614 (ListLongMap!13698 lt!439611))))

(declare-fun lt!439613 () Unit!32754)

(declare-fun lt!439612 () Unit!32754)

(assert (=> d!117617 (= lt!439613 lt!439612)))

(assert (=> d!117617 (= (getValueByKey!518 lt!439611 (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117617 (= lt!439612 (lemmaContainsTupThenGetReturnValue!275 lt!439611 (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117617 (= lt!439611 (insertStrictlySorted!332 (toList!6864 call!42026) (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117617 (= (+!3121 call!42026 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439614)))

(declare-fun b!991006 () Bool)

(declare-fun res!662556 () Bool)

(assert (=> b!991006 (=> (not res!662556) (not e!558815))))

(assert (=> b!991006 (= res!662556 (= (getValueByKey!518 (toList!6864 lt!439614) (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991007 () Bool)

(assert (=> b!991007 (= e!558815 (contains!5699 (toList!6864 lt!439614) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117617 res!662557) b!991006))

(assert (= (and b!991006 res!662556) b!991007))

(declare-fun m!918229 () Bool)

(assert (=> d!117617 m!918229))

(declare-fun m!918231 () Bool)

(assert (=> d!117617 m!918231))

(declare-fun m!918233 () Bool)

(assert (=> d!117617 m!918233))

(declare-fun m!918235 () Bool)

(assert (=> d!117617 m!918235))

(declare-fun m!918237 () Bool)

(assert (=> b!991006 m!918237))

(declare-fun m!918239 () Bool)

(assert (=> b!991007 m!918239))

(assert (=> b!990903 d!117617))

(declare-fun d!117619 () Bool)

(declare-fun e!558816 () Bool)

(assert (=> d!117619 e!558816))

(declare-fun res!662559 () Bool)

(assert (=> d!117619 (=> (not res!662559) (not e!558816))))

(declare-fun lt!439618 () ListLongMap!13697)

(assert (=> d!117619 (= res!662559 (contains!5698 lt!439618 (_1!7516 (tuple2!15011 lt!439541 zeroValue!1220))))))

(declare-fun lt!439615 () List!20890)

(assert (=> d!117619 (= lt!439618 (ListLongMap!13698 lt!439615))))

(declare-fun lt!439617 () Unit!32754)

(declare-fun lt!439616 () Unit!32754)

(assert (=> d!117619 (= lt!439617 lt!439616)))

(assert (=> d!117619 (= (getValueByKey!518 lt!439615 (_1!7516 (tuple2!15011 lt!439541 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439541 zeroValue!1220))))))

(assert (=> d!117619 (= lt!439616 (lemmaContainsTupThenGetReturnValue!275 lt!439615 (_1!7516 (tuple2!15011 lt!439541 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439541 zeroValue!1220))))))

(assert (=> d!117619 (= lt!439615 (insertStrictlySorted!332 (toList!6864 lt!439529) (_1!7516 (tuple2!15011 lt!439541 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439541 zeroValue!1220))))))

(assert (=> d!117619 (= (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220)) lt!439618)))

(declare-fun b!991008 () Bool)

(declare-fun res!662558 () Bool)

(assert (=> b!991008 (=> (not res!662558) (not e!558816))))

(assert (=> b!991008 (= res!662558 (= (getValueByKey!518 (toList!6864 lt!439618) (_1!7516 (tuple2!15011 lt!439541 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439541 zeroValue!1220)))))))

(declare-fun b!991009 () Bool)

(assert (=> b!991009 (= e!558816 (contains!5699 (toList!6864 lt!439618) (tuple2!15011 lt!439541 zeroValue!1220)))))

(assert (= (and d!117619 res!662559) b!991008))

(assert (= (and b!991008 res!662558) b!991009))

(declare-fun m!918241 () Bool)

(assert (=> d!117619 m!918241))

(declare-fun m!918243 () Bool)

(assert (=> d!117619 m!918243))

(declare-fun m!918245 () Bool)

(assert (=> d!117619 m!918245))

(declare-fun m!918247 () Bool)

(assert (=> d!117619 m!918247))

(declare-fun m!918249 () Bool)

(assert (=> b!991008 m!918249))

(declare-fun m!918251 () Bool)

(assert (=> b!991009 m!918251))

(assert (=> b!990869 d!117619))

(declare-fun d!117621 () Bool)

(declare-fun get!15651 (Option!524) V!36065)

(assert (=> d!117621 (= (apply!891 lt!439545 lt!439537) (get!15651 (getValueByKey!518 (toList!6864 lt!439545) lt!439537)))))

(declare-fun bs!28120 () Bool)

(assert (= bs!28120 d!117621))

(declare-fun m!918253 () Bool)

(assert (=> bs!28120 m!918253))

(assert (=> bs!28120 m!918253))

(declare-fun m!918255 () Bool)

(assert (=> bs!28120 m!918255))

(assert (=> b!990869 d!117621))

(declare-fun d!117623 () Bool)

(assert (=> d!117623 (= (apply!891 (+!3121 lt!439532 (tuple2!15011 lt!439540 zeroValue!1220)) lt!439526) (get!15651 (getValueByKey!518 (toList!6864 (+!3121 lt!439532 (tuple2!15011 lt!439540 zeroValue!1220))) lt!439526)))))

(declare-fun bs!28121 () Bool)

(assert (= bs!28121 d!117623))

(declare-fun m!918257 () Bool)

(assert (=> bs!28121 m!918257))

(assert (=> bs!28121 m!918257))

(declare-fun m!918259 () Bool)

(assert (=> bs!28121 m!918259))

(assert (=> b!990869 d!117623))

(declare-fun d!117625 () Bool)

(assert (=> d!117625 (= (apply!891 (+!3121 lt!439545 (tuple2!15011 lt!439533 minValue!1220)) lt!439537) (apply!891 lt!439545 lt!439537))))

(declare-fun lt!439621 () Unit!32754)

(declare-fun choose!1630 (ListLongMap!13697 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32754)

(assert (=> d!117625 (= lt!439621 (choose!1630 lt!439545 lt!439533 minValue!1220 lt!439537))))

(declare-fun e!558819 () Bool)

(assert (=> d!117625 e!558819))

(declare-fun res!662562 () Bool)

(assert (=> d!117625 (=> (not res!662562) (not e!558819))))

(assert (=> d!117625 (= res!662562 (contains!5698 lt!439545 lt!439537))))

(assert (=> d!117625 (= (addApplyDifferent!466 lt!439545 lt!439533 minValue!1220 lt!439537) lt!439621)))

(declare-fun b!991013 () Bool)

(assert (=> b!991013 (= e!558819 (not (= lt!439537 lt!439533)))))

(assert (= (and d!117625 res!662562) b!991013))

(assert (=> d!117625 m!918073))

(assert (=> d!117625 m!918073))

(assert (=> d!117625 m!918075))

(declare-fun m!918261 () Bool)

(assert (=> d!117625 m!918261))

(assert (=> d!117625 m!918087))

(declare-fun m!918263 () Bool)

(assert (=> d!117625 m!918263))

(assert (=> b!990869 d!117625))

(declare-fun d!117627 () Bool)

(declare-fun e!558820 () Bool)

(assert (=> d!117627 e!558820))

(declare-fun res!662564 () Bool)

(assert (=> d!117627 (=> (not res!662564) (not e!558820))))

(declare-fun lt!439625 () ListLongMap!13697)

(assert (=> d!117627 (= res!662564 (contains!5698 lt!439625 (_1!7516 (tuple2!15011 lt!439531 minValue!1220))))))

(declare-fun lt!439622 () List!20890)

(assert (=> d!117627 (= lt!439625 (ListLongMap!13698 lt!439622))))

(declare-fun lt!439624 () Unit!32754)

(declare-fun lt!439623 () Unit!32754)

(assert (=> d!117627 (= lt!439624 lt!439623)))

(assert (=> d!117627 (= (getValueByKey!518 lt!439622 (_1!7516 (tuple2!15011 lt!439531 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439531 minValue!1220))))))

(assert (=> d!117627 (= lt!439623 (lemmaContainsTupThenGetReturnValue!275 lt!439622 (_1!7516 (tuple2!15011 lt!439531 minValue!1220)) (_2!7516 (tuple2!15011 lt!439531 minValue!1220))))))

(assert (=> d!117627 (= lt!439622 (insertStrictlySorted!332 (toList!6864 lt!439536) (_1!7516 (tuple2!15011 lt!439531 minValue!1220)) (_2!7516 (tuple2!15011 lt!439531 minValue!1220))))))

(assert (=> d!117627 (= (+!3121 lt!439536 (tuple2!15011 lt!439531 minValue!1220)) lt!439625)))

(declare-fun b!991014 () Bool)

(declare-fun res!662563 () Bool)

(assert (=> b!991014 (=> (not res!662563) (not e!558820))))

(assert (=> b!991014 (= res!662563 (= (getValueByKey!518 (toList!6864 lt!439625) (_1!7516 (tuple2!15011 lt!439531 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439531 minValue!1220)))))))

(declare-fun b!991015 () Bool)

(assert (=> b!991015 (= e!558820 (contains!5699 (toList!6864 lt!439625) (tuple2!15011 lt!439531 minValue!1220)))))

(assert (= (and d!117627 res!662564) b!991014))

(assert (= (and b!991014 res!662563) b!991015))

(declare-fun m!918265 () Bool)

(assert (=> d!117627 m!918265))

(declare-fun m!918267 () Bool)

(assert (=> d!117627 m!918267))

(declare-fun m!918269 () Bool)

(assert (=> d!117627 m!918269))

(declare-fun m!918271 () Bool)

(assert (=> d!117627 m!918271))

(declare-fun m!918273 () Bool)

(assert (=> b!991014 m!918273))

(declare-fun m!918275 () Bool)

(assert (=> b!991015 m!918275))

(assert (=> b!990869 d!117627))

(declare-fun d!117629 () Bool)

(assert (=> d!117629 (= (apply!891 (+!3121 lt!439536 (tuple2!15011 lt!439531 minValue!1220)) lt!439543) (get!15651 (getValueByKey!518 (toList!6864 (+!3121 lt!439536 (tuple2!15011 lt!439531 minValue!1220))) lt!439543)))))

(declare-fun bs!28122 () Bool)

(assert (= bs!28122 d!117629))

(declare-fun m!918277 () Bool)

(assert (=> bs!28122 m!918277))

(assert (=> bs!28122 m!918277))

(declare-fun m!918279 () Bool)

(assert (=> bs!28122 m!918279))

(assert (=> b!990869 d!117629))

(declare-fun d!117631 () Bool)

(assert (=> d!117631 (= (apply!891 lt!439536 lt!439543) (get!15651 (getValueByKey!518 (toList!6864 lt!439536) lt!439543)))))

(declare-fun bs!28123 () Bool)

(assert (= bs!28123 d!117631))

(declare-fun m!918281 () Bool)

(assert (=> bs!28123 m!918281))

(assert (=> bs!28123 m!918281))

(declare-fun m!918283 () Bool)

(assert (=> bs!28123 m!918283))

(assert (=> b!990869 d!117631))

(declare-fun d!117633 () Bool)

(assert (=> d!117633 (= (apply!891 lt!439532 lt!439526) (get!15651 (getValueByKey!518 (toList!6864 lt!439532) lt!439526)))))

(declare-fun bs!28124 () Bool)

(assert (= bs!28124 d!117633))

(declare-fun m!918285 () Bool)

(assert (=> bs!28124 m!918285))

(assert (=> bs!28124 m!918285))

(declare-fun m!918287 () Bool)

(assert (=> bs!28124 m!918287))

(assert (=> b!990869 d!117633))

(declare-fun d!117635 () Bool)

(assert (=> d!117635 (= (apply!891 (+!3121 lt!439532 (tuple2!15011 lt!439540 zeroValue!1220)) lt!439526) (apply!891 lt!439532 lt!439526))))

(declare-fun lt!439626 () Unit!32754)

(assert (=> d!117635 (= lt!439626 (choose!1630 lt!439532 lt!439540 zeroValue!1220 lt!439526))))

(declare-fun e!558821 () Bool)

(assert (=> d!117635 e!558821))

(declare-fun res!662565 () Bool)

(assert (=> d!117635 (=> (not res!662565) (not e!558821))))

(assert (=> d!117635 (= res!662565 (contains!5698 lt!439532 lt!439526))))

(assert (=> d!117635 (= (addApplyDifferent!466 lt!439532 lt!439540 zeroValue!1220 lt!439526) lt!439626)))

(declare-fun b!991016 () Bool)

(assert (=> b!991016 (= e!558821 (not (= lt!439526 lt!439540)))))

(assert (= (and d!117635 res!662565) b!991016))

(assert (=> d!117635 m!918069))

(assert (=> d!117635 m!918069))

(assert (=> d!117635 m!918083))

(declare-fun m!918289 () Bool)

(assert (=> d!117635 m!918289))

(assert (=> d!117635 m!918095))

(declare-fun m!918291 () Bool)

(assert (=> d!117635 m!918291))

(assert (=> b!990869 d!117635))

(declare-fun d!117637 () Bool)

(declare-fun e!558822 () Bool)

(assert (=> d!117637 e!558822))

(declare-fun res!662566 () Bool)

(assert (=> d!117637 (=> res!662566 e!558822)))

(declare-fun lt!439628 () Bool)

(assert (=> d!117637 (= res!662566 (not lt!439628))))

(declare-fun lt!439629 () Bool)

(assert (=> d!117637 (= lt!439628 lt!439629)))

(declare-fun lt!439627 () Unit!32754)

(declare-fun e!558823 () Unit!32754)

(assert (=> d!117637 (= lt!439627 e!558823)))

(declare-fun c!100523 () Bool)

(assert (=> d!117637 (= c!100523 lt!439629)))

(assert (=> d!117637 (= lt!439629 (containsKey!480 (toList!6864 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220))) lt!439542))))

(assert (=> d!117637 (= (contains!5698 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220)) lt!439542) lt!439628)))

(declare-fun b!991017 () Bool)

(declare-fun lt!439630 () Unit!32754)

(assert (=> b!991017 (= e!558823 lt!439630)))

(assert (=> b!991017 (= lt!439630 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220))) lt!439542))))

(assert (=> b!991017 (isDefined!388 (getValueByKey!518 (toList!6864 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220))) lt!439542))))

(declare-fun b!991018 () Bool)

(declare-fun Unit!32760 () Unit!32754)

(assert (=> b!991018 (= e!558823 Unit!32760)))

(declare-fun b!991019 () Bool)

(assert (=> b!991019 (= e!558822 (isDefined!388 (getValueByKey!518 (toList!6864 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220))) lt!439542)))))

(assert (= (and d!117637 c!100523) b!991017))

(assert (= (and d!117637 (not c!100523)) b!991018))

(assert (= (and d!117637 (not res!662566)) b!991019))

(declare-fun m!918293 () Bool)

(assert (=> d!117637 m!918293))

(declare-fun m!918295 () Bool)

(assert (=> b!991017 m!918295))

(declare-fun m!918297 () Bool)

(assert (=> b!991017 m!918297))

(assert (=> b!991017 m!918297))

(declare-fun m!918299 () Bool)

(assert (=> b!991017 m!918299))

(assert (=> b!991019 m!918297))

(assert (=> b!991019 m!918297))

(assert (=> b!991019 m!918299))

(assert (=> b!990869 d!117637))

(declare-fun d!117639 () Bool)

(assert (=> d!117639 (= (apply!891 (+!3121 lt!439545 (tuple2!15011 lt!439533 minValue!1220)) lt!439537) (get!15651 (getValueByKey!518 (toList!6864 (+!3121 lt!439545 (tuple2!15011 lt!439533 minValue!1220))) lt!439537)))))

(declare-fun bs!28125 () Bool)

(assert (= bs!28125 d!117639))

(declare-fun m!918301 () Bool)

(assert (=> bs!28125 m!918301))

(assert (=> bs!28125 m!918301))

(declare-fun m!918303 () Bool)

(assert (=> bs!28125 m!918303))

(assert (=> b!990869 d!117639))

(declare-fun b!991044 () Bool)

(declare-fun e!558839 () Bool)

(assert (=> b!991044 (= e!558839 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!991044 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!991045 () Bool)

(assert (=> b!991045 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544)))))

(assert (=> b!991045 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30591 _values!1278)))))

(declare-fun e!558844 () Bool)

(declare-fun lt!439645 () ListLongMap!13697)

(assert (=> b!991045 (= e!558844 (= (apply!891 lt!439645 (select (arr!30109 _keys!1544) from!1932)) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!991046 () Bool)

(declare-fun e!558841 () Bool)

(assert (=> b!991046 (= e!558841 e!558844)))

(assert (=> b!991046 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun res!662577 () Bool)

(assert (=> b!991046 (= res!662577 (contains!5698 lt!439645 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!991046 (=> (not res!662577) (not e!558844))))

(declare-fun d!117641 () Bool)

(declare-fun e!558843 () Bool)

(assert (=> d!117641 e!558843))

(declare-fun res!662576 () Bool)

(assert (=> d!117641 (=> (not res!662576) (not e!558843))))

(assert (=> d!117641 (= res!662576 (not (contains!5698 lt!439645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!558838 () ListLongMap!13697)

(assert (=> d!117641 (= lt!439645 e!558838)))

(declare-fun c!100532 () Bool)

(assert (=> d!117641 (= c!100532 (bvsge from!1932 (size!30590 _keys!1544)))))

(assert (=> d!117641 (validMask!0 mask!1948)))

(assert (=> d!117641 (= (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439645)))

(declare-fun bm!42041 () Bool)

(declare-fun call!42044 () ListLongMap!13697)

(assert (=> bm!42041 (= call!42044 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991047 () Bool)

(assert (=> b!991047 (= e!558843 e!558841)))

(declare-fun c!100534 () Bool)

(assert (=> b!991047 (= c!100534 e!558839)))

(declare-fun res!662575 () Bool)

(assert (=> b!991047 (=> (not res!662575) (not e!558839))))

(assert (=> b!991047 (= res!662575 (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun b!991048 () Bool)

(declare-fun e!558842 () Bool)

(declare-fun isEmpty!733 (ListLongMap!13697) Bool)

(assert (=> b!991048 (= e!558842 (isEmpty!733 lt!439645))))

(declare-fun b!991049 () Bool)

(assert (=> b!991049 (= e!558838 (ListLongMap!13698 Nil!20887))))

(declare-fun b!991050 () Bool)

(declare-fun lt!439646 () Unit!32754)

(declare-fun lt!439651 () Unit!32754)

(assert (=> b!991050 (= lt!439646 lt!439651)))

(declare-fun lt!439647 () (_ BitVec 64))

(declare-fun lt!439648 () V!36065)

(declare-fun lt!439649 () ListLongMap!13697)

(declare-fun lt!439650 () (_ BitVec 64))

(assert (=> b!991050 (not (contains!5698 (+!3121 lt!439649 (tuple2!15011 lt!439650 lt!439648)) lt!439647))))

(declare-fun addStillNotContains!238 (ListLongMap!13697 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32754)

(assert (=> b!991050 (= lt!439651 (addStillNotContains!238 lt!439649 lt!439650 lt!439648 lt!439647))))

(assert (=> b!991050 (= lt!439647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991050 (= lt!439648 (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991050 (= lt!439650 (select (arr!30109 _keys!1544) from!1932))))

(assert (=> b!991050 (= lt!439649 call!42044)))

(declare-fun e!558840 () ListLongMap!13697)

(assert (=> b!991050 (= e!558840 (+!3121 call!42044 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991051 () Bool)

(declare-fun res!662578 () Bool)

(assert (=> b!991051 (=> (not res!662578) (not e!558843))))

(assert (=> b!991051 (= res!662578 (not (contains!5698 lt!439645 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991052 () Bool)

(assert (=> b!991052 (= e!558838 e!558840)))

(declare-fun c!100535 () Bool)

(assert (=> b!991052 (= c!100535 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!991053 () Bool)

(assert (=> b!991053 (= e!558842 (= lt!439645 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991054 () Bool)

(assert (=> b!991054 (= e!558841 e!558842)))

(declare-fun c!100533 () Bool)

(assert (=> b!991054 (= c!100533 (bvslt from!1932 (size!30590 _keys!1544)))))

(declare-fun b!991055 () Bool)

(assert (=> b!991055 (= e!558840 call!42044)))

(assert (= (and d!117641 c!100532) b!991049))

(assert (= (and d!117641 (not c!100532)) b!991052))

(assert (= (and b!991052 c!100535) b!991050))

(assert (= (and b!991052 (not c!100535)) b!991055))

(assert (= (or b!991050 b!991055) bm!42041))

(assert (= (and d!117641 res!662576) b!991051))

(assert (= (and b!991051 res!662578) b!991047))

(assert (= (and b!991047 res!662575) b!991044))

(assert (= (and b!991047 c!100534) b!991046))

(assert (= (and b!991047 (not c!100534)) b!991054))

(assert (= (and b!991046 res!662577) b!991045))

(assert (= (and b!991054 c!100533) b!991053))

(assert (= (and b!991054 (not c!100533)) b!991048))

(declare-fun b_lambda!15195 () Bool)

(assert (=> (not b_lambda!15195) (not b!991045)))

(assert (=> b!991045 t!29859))

(declare-fun b_and!32255 () Bool)

(assert (= b_and!32253 (and (=> t!29859 result!13653) b_and!32255)))

(declare-fun b_lambda!15197 () Bool)

(assert (=> (not b_lambda!15197) (not b!991050)))

(assert (=> b!991050 t!29859))

(declare-fun b_and!32257 () Bool)

(assert (= b_and!32255 (and (=> t!29859 result!13653) b_and!32257)))

(assert (=> b!991044 m!917979))

(assert (=> b!991044 m!917979))

(assert (=> b!991044 m!917995))

(declare-fun m!918305 () Bool)

(assert (=> b!991050 m!918305))

(assert (=> b!991050 m!917981))

(assert (=> b!991050 m!917989))

(assert (=> b!991050 m!917979))

(assert (=> b!991050 m!917981))

(assert (=> b!991050 m!917989))

(assert (=> b!991050 m!917991))

(declare-fun m!918307 () Bool)

(assert (=> b!991050 m!918307))

(assert (=> b!991050 m!918307))

(declare-fun m!918309 () Bool)

(assert (=> b!991050 m!918309))

(declare-fun m!918311 () Bool)

(assert (=> b!991050 m!918311))

(declare-fun m!918313 () Bool)

(assert (=> b!991048 m!918313))

(declare-fun m!918315 () Bool)

(assert (=> d!117641 m!918315))

(assert (=> d!117641 m!917973))

(declare-fun m!918317 () Bool)

(assert (=> b!991053 m!918317))

(declare-fun m!918319 () Bool)

(assert (=> b!991051 m!918319))

(assert (=> b!991046 m!917979))

(assert (=> b!991046 m!917979))

(declare-fun m!918321 () Bool)

(assert (=> b!991046 m!918321))

(assert (=> bm!42041 m!918317))

(assert (=> b!991045 m!917981))

(assert (=> b!991045 m!917989))

(assert (=> b!991045 m!917979))

(assert (=> b!991045 m!917981))

(assert (=> b!991045 m!917989))

(assert (=> b!991045 m!917991))

(assert (=> b!991045 m!917979))

(declare-fun m!918323 () Bool)

(assert (=> b!991045 m!918323))

(assert (=> b!991052 m!917979))

(assert (=> b!991052 m!917979))

(assert (=> b!991052 m!917995))

(assert (=> b!990869 d!117641))

(declare-fun d!117643 () Bool)

(declare-fun e!558845 () Bool)

(assert (=> d!117643 e!558845))

(declare-fun res!662580 () Bool)

(assert (=> d!117643 (=> (not res!662580) (not e!558845))))

(declare-fun lt!439655 () ListLongMap!13697)

(assert (=> d!117643 (= res!662580 (contains!5698 lt!439655 (_1!7516 (tuple2!15011 lt!439533 minValue!1220))))))

(declare-fun lt!439652 () List!20890)

(assert (=> d!117643 (= lt!439655 (ListLongMap!13698 lt!439652))))

(declare-fun lt!439654 () Unit!32754)

(declare-fun lt!439653 () Unit!32754)

(assert (=> d!117643 (= lt!439654 lt!439653)))

(assert (=> d!117643 (= (getValueByKey!518 lt!439652 (_1!7516 (tuple2!15011 lt!439533 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439533 minValue!1220))))))

(assert (=> d!117643 (= lt!439653 (lemmaContainsTupThenGetReturnValue!275 lt!439652 (_1!7516 (tuple2!15011 lt!439533 minValue!1220)) (_2!7516 (tuple2!15011 lt!439533 minValue!1220))))))

(assert (=> d!117643 (= lt!439652 (insertStrictlySorted!332 (toList!6864 lt!439545) (_1!7516 (tuple2!15011 lt!439533 minValue!1220)) (_2!7516 (tuple2!15011 lt!439533 minValue!1220))))))

(assert (=> d!117643 (= (+!3121 lt!439545 (tuple2!15011 lt!439533 minValue!1220)) lt!439655)))

(declare-fun b!991056 () Bool)

(declare-fun res!662579 () Bool)

(assert (=> b!991056 (=> (not res!662579) (not e!558845))))

(assert (=> b!991056 (= res!662579 (= (getValueByKey!518 (toList!6864 lt!439655) (_1!7516 (tuple2!15011 lt!439533 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439533 minValue!1220)))))))

(declare-fun b!991057 () Bool)

(assert (=> b!991057 (= e!558845 (contains!5699 (toList!6864 lt!439655) (tuple2!15011 lt!439533 minValue!1220)))))

(assert (= (and d!117643 res!662580) b!991056))

(assert (= (and b!991056 res!662579) b!991057))

(declare-fun m!918325 () Bool)

(assert (=> d!117643 m!918325))

(declare-fun m!918327 () Bool)

(assert (=> d!117643 m!918327))

(declare-fun m!918329 () Bool)

(assert (=> d!117643 m!918329))

(declare-fun m!918331 () Bool)

(assert (=> d!117643 m!918331))

(declare-fun m!918333 () Bool)

(assert (=> b!991056 m!918333))

(declare-fun m!918335 () Bool)

(assert (=> b!991057 m!918335))

(assert (=> b!990869 d!117643))

(declare-fun d!117645 () Bool)

(assert (=> d!117645 (contains!5698 (+!3121 lt!439529 (tuple2!15011 lt!439541 zeroValue!1220)) lt!439542)))

(declare-fun lt!439658 () Unit!32754)

(declare-fun choose!1631 (ListLongMap!13697 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32754)

(assert (=> d!117645 (= lt!439658 (choose!1631 lt!439529 lt!439541 zeroValue!1220 lt!439542))))

(assert (=> d!117645 (contains!5698 lt!439529 lt!439542)))

(assert (=> d!117645 (= (addStillContains!610 lt!439529 lt!439541 zeroValue!1220 lt!439542) lt!439658)))

(declare-fun bs!28126 () Bool)

(assert (= bs!28126 d!117645))

(assert (=> bs!28126 m!918091))

(assert (=> bs!28126 m!918091))

(assert (=> bs!28126 m!918093))

(declare-fun m!918337 () Bool)

(assert (=> bs!28126 m!918337))

(declare-fun m!918339 () Bool)

(assert (=> bs!28126 m!918339))

(assert (=> b!990869 d!117645))

(declare-fun d!117647 () Bool)

(declare-fun e!558846 () Bool)

(assert (=> d!117647 e!558846))

(declare-fun res!662582 () Bool)

(assert (=> d!117647 (=> (not res!662582) (not e!558846))))

(declare-fun lt!439662 () ListLongMap!13697)

(assert (=> d!117647 (= res!662582 (contains!5698 lt!439662 (_1!7516 (tuple2!15011 lt!439540 zeroValue!1220))))))

(declare-fun lt!439659 () List!20890)

(assert (=> d!117647 (= lt!439662 (ListLongMap!13698 lt!439659))))

(declare-fun lt!439661 () Unit!32754)

(declare-fun lt!439660 () Unit!32754)

(assert (=> d!117647 (= lt!439661 lt!439660)))

(assert (=> d!117647 (= (getValueByKey!518 lt!439659 (_1!7516 (tuple2!15011 lt!439540 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439540 zeroValue!1220))))))

(assert (=> d!117647 (= lt!439660 (lemmaContainsTupThenGetReturnValue!275 lt!439659 (_1!7516 (tuple2!15011 lt!439540 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439540 zeroValue!1220))))))

(assert (=> d!117647 (= lt!439659 (insertStrictlySorted!332 (toList!6864 lt!439532) (_1!7516 (tuple2!15011 lt!439540 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439540 zeroValue!1220))))))

(assert (=> d!117647 (= (+!3121 lt!439532 (tuple2!15011 lt!439540 zeroValue!1220)) lt!439662)))

(declare-fun b!991059 () Bool)

(declare-fun res!662581 () Bool)

(assert (=> b!991059 (=> (not res!662581) (not e!558846))))

(assert (=> b!991059 (= res!662581 (= (getValueByKey!518 (toList!6864 lt!439662) (_1!7516 (tuple2!15011 lt!439540 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439540 zeroValue!1220)))))))

(declare-fun b!991060 () Bool)

(assert (=> b!991060 (= e!558846 (contains!5699 (toList!6864 lt!439662) (tuple2!15011 lt!439540 zeroValue!1220)))))

(assert (= (and d!117647 res!662582) b!991059))

(assert (= (and b!991059 res!662581) b!991060))

(declare-fun m!918341 () Bool)

(assert (=> d!117647 m!918341))

(declare-fun m!918343 () Bool)

(assert (=> d!117647 m!918343))

(declare-fun m!918345 () Bool)

(assert (=> d!117647 m!918345))

(declare-fun m!918347 () Bool)

(assert (=> d!117647 m!918347))

(declare-fun m!918349 () Bool)

(assert (=> b!991059 m!918349))

(declare-fun m!918351 () Bool)

(assert (=> b!991060 m!918351))

(assert (=> b!990869 d!117647))

(declare-fun d!117649 () Bool)

(assert (=> d!117649 (= (apply!891 (+!3121 lt!439536 (tuple2!15011 lt!439531 minValue!1220)) lt!439543) (apply!891 lt!439536 lt!439543))))

(declare-fun lt!439663 () Unit!32754)

(assert (=> d!117649 (= lt!439663 (choose!1630 lt!439536 lt!439531 minValue!1220 lt!439543))))

(declare-fun e!558847 () Bool)

(assert (=> d!117649 e!558847))

(declare-fun res!662583 () Bool)

(assert (=> d!117649 (=> (not res!662583) (not e!558847))))

(assert (=> d!117649 (= res!662583 (contains!5698 lt!439536 lt!439543))))

(assert (=> d!117649 (= (addApplyDifferent!466 lt!439536 lt!439531 minValue!1220 lt!439543) lt!439663)))

(declare-fun b!991061 () Bool)

(assert (=> b!991061 (= e!558847 (not (= lt!439543 lt!439531)))))

(assert (= (and d!117649 res!662583) b!991061))

(assert (=> d!117649 m!918079))

(assert (=> d!117649 m!918079))

(assert (=> d!117649 m!918089))

(declare-fun m!918353 () Bool)

(assert (=> d!117649 m!918353))

(assert (=> d!117649 m!918097))

(declare-fun m!918355 () Bool)

(assert (=> d!117649 m!918355))

(assert (=> b!990869 d!117649))

(declare-fun d!117651 () Bool)

(assert (=> d!117651 (= (apply!891 lt!439573 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15651 (getValueByKey!518 (toList!6864 lt!439573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28127 () Bool)

(assert (= bs!28127 d!117651))

(assert (=> bs!28127 m!918197))

(assert (=> bs!28127 m!918197))

(declare-fun m!918357 () Bool)

(assert (=> bs!28127 m!918357))

(assert (=> b!990885 d!117651))

(declare-fun d!117653 () Bool)

(declare-fun e!558848 () Bool)

(assert (=> d!117653 e!558848))

(declare-fun res!662585 () Bool)

(assert (=> d!117653 (=> (not res!662585) (not e!558848))))

(declare-fun lt!439667 () ListLongMap!13697)

(assert (=> d!117653 (= res!662585 (contains!5698 lt!439667 (_1!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439664 () List!20890)

(assert (=> d!117653 (= lt!439667 (ListLongMap!13698 lt!439664))))

(declare-fun lt!439666 () Unit!32754)

(declare-fun lt!439665 () Unit!32754)

(assert (=> d!117653 (= lt!439666 lt!439665)))

(assert (=> d!117653 (= (getValueByKey!518 lt!439664 (_1!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!523 (_2!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117653 (= lt!439665 (lemmaContainsTupThenGetReturnValue!275 lt!439664 (_1!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117653 (= lt!439664 (insertStrictlySorted!332 (toList!6864 (ite c!100489 call!42025 (ite c!100490 call!42024 call!42021))) (_1!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117653 (= (+!3121 (ite c!100489 call!42025 (ite c!100490 call!42024 call!42021)) (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439667)))

(declare-fun b!991062 () Bool)

(declare-fun res!662584 () Bool)

(assert (=> b!991062 (=> (not res!662584) (not e!558848))))

(assert (=> b!991062 (= res!662584 (= (getValueByKey!518 (toList!6864 lt!439667) (_1!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!523 (_2!7516 (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!991063 () Bool)

(assert (=> b!991063 (= e!558848 (contains!5699 (toList!6864 lt!439667) (ite (or c!100489 c!100490) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117653 res!662585) b!991062))

(assert (= (and b!991062 res!662584) b!991063))

(declare-fun m!918359 () Bool)

(assert (=> d!117653 m!918359))

(declare-fun m!918361 () Bool)

(assert (=> d!117653 m!918361))

(declare-fun m!918363 () Bool)

(assert (=> d!117653 m!918363))

(declare-fun m!918365 () Bool)

(assert (=> d!117653 m!918365))

(declare-fun m!918367 () Bool)

(assert (=> b!991062 m!918367))

(declare-fun m!918369 () Bool)

(assert (=> b!991063 m!918369))

(assert (=> bm!42021 d!117653))

(declare-fun d!117655 () Bool)

(assert (=> d!117655 (= (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990901 d!117655))

(declare-fun d!117657 () Bool)

(assert (=> d!117657 (= (apply!891 lt!439539 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15651 (getValueByKey!518 (toList!6864 lt!439539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28128 () Bool)

(assert (= bs!28128 d!117657))

(declare-fun m!918371 () Bool)

(assert (=> bs!28128 m!918371))

(assert (=> bs!28128 m!918371))

(declare-fun m!918373 () Bool)

(assert (=> bs!28128 m!918373))

(assert (=> b!990866 d!117657))

(declare-fun d!117659 () Bool)

(assert (=> d!117659 (= (get!15650 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990910 d!117659))

(declare-fun d!117661 () Bool)

(assert (=> d!117661 (= (apply!891 lt!439539 (select (arr!30109 _keys!1544) from!1932)) (get!15651 (getValueByKey!518 (toList!6864 lt!439539) (select (arr!30109 _keys!1544) from!1932))))))

(declare-fun bs!28129 () Bool)

(assert (= bs!28129 d!117661))

(assert (=> bs!28129 m!917979))

(declare-fun m!918375 () Bool)

(assert (=> bs!28129 m!918375))

(assert (=> bs!28129 m!918375))

(declare-fun m!918377 () Bool)

(assert (=> bs!28129 m!918377))

(assert (=> b!990864 d!117661))

(assert (=> b!990864 d!117593))

(declare-fun d!117663 () Bool)

(assert (=> d!117663 (= (get!15649 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14278 (select (arr!30110 _values!1278) from!1932)))))

(assert (=> b!990909 d!117663))

(declare-fun d!117665 () Bool)

(declare-fun e!558849 () Bool)

(assert (=> d!117665 e!558849))

(declare-fun res!662586 () Bool)

(assert (=> d!117665 (=> res!662586 e!558849)))

(declare-fun lt!439669 () Bool)

(assert (=> d!117665 (= res!662586 (not lt!439669))))

(declare-fun lt!439670 () Bool)

(assert (=> d!117665 (= lt!439669 lt!439670)))

(declare-fun lt!439668 () Unit!32754)

(declare-fun e!558850 () Unit!32754)

(assert (=> d!117665 (= lt!439668 e!558850)))

(declare-fun c!100536 () Bool)

(assert (=> d!117665 (= c!100536 lt!439670)))

(assert (=> d!117665 (= lt!439670 (containsKey!480 (toList!6864 lt!439539) (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> d!117665 (= (contains!5698 lt!439539 (select (arr!30109 _keys!1544) from!1932)) lt!439669)))

(declare-fun b!991064 () Bool)

(declare-fun lt!439671 () Unit!32754)

(assert (=> b!991064 (= e!558850 lt!439671)))

(assert (=> b!991064 (= lt!439671 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439539) (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!991064 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439539) (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!991065 () Bool)

(declare-fun Unit!32761 () Unit!32754)

(assert (=> b!991065 (= e!558850 Unit!32761)))

(declare-fun b!991066 () Bool)

(assert (=> b!991066 (= e!558849 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439539) (select (arr!30109 _keys!1544) from!1932))))))

(assert (= (and d!117665 c!100536) b!991064))

(assert (= (and d!117665 (not c!100536)) b!991065))

(assert (= (and d!117665 (not res!662586)) b!991066))

(assert (=> d!117665 m!917979))

(declare-fun m!918379 () Bool)

(assert (=> d!117665 m!918379))

(assert (=> b!991064 m!917979))

(declare-fun m!918381 () Bool)

(assert (=> b!991064 m!918381))

(assert (=> b!991064 m!917979))

(assert (=> b!991064 m!918375))

(assert (=> b!991064 m!918375))

(declare-fun m!918383 () Bool)

(assert (=> b!991064 m!918383))

(assert (=> b!991066 m!917979))

(assert (=> b!991066 m!918375))

(assert (=> b!991066 m!918375))

(assert (=> b!991066 m!918383))

(assert (=> b!990863 d!117665))

(assert (=> b!990897 d!117655))

(declare-fun d!117667 () Bool)

(assert (=> d!117667 (contains!5698 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220)) lt!439576)))

(declare-fun lt!439672 () Unit!32754)

(assert (=> d!117667 (= lt!439672 (choose!1631 lt!439563 lt!439575 zeroValue!1220 lt!439576))))

(assert (=> d!117667 (contains!5698 lt!439563 lt!439576)))

(assert (=> d!117667 (= (addStillContains!610 lt!439563 lt!439575 zeroValue!1220 lt!439576) lt!439672)))

(declare-fun bs!28130 () Bool)

(assert (= bs!28130 d!117667))

(assert (=> bs!28130 m!918159))

(assert (=> bs!28130 m!918159))

(assert (=> bs!28130 m!918161))

(declare-fun m!918385 () Bool)

(assert (=> bs!28130 m!918385))

(declare-fun m!918387 () Bool)

(assert (=> bs!28130 m!918387))

(assert (=> b!990896 d!117667))

(declare-fun d!117669 () Bool)

(declare-fun e!558851 () Bool)

(assert (=> d!117669 e!558851))

(declare-fun res!662587 () Bool)

(assert (=> d!117669 (=> res!662587 e!558851)))

(declare-fun lt!439674 () Bool)

(assert (=> d!117669 (= res!662587 (not lt!439674))))

(declare-fun lt!439675 () Bool)

(assert (=> d!117669 (= lt!439674 lt!439675)))

(declare-fun lt!439673 () Unit!32754)

(declare-fun e!558852 () Unit!32754)

(assert (=> d!117669 (= lt!439673 e!558852)))

(declare-fun c!100537 () Bool)

(assert (=> d!117669 (= c!100537 lt!439675)))

(assert (=> d!117669 (= lt!439675 (containsKey!480 (toList!6864 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220))) lt!439576))))

(assert (=> d!117669 (= (contains!5698 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220)) lt!439576) lt!439674)))

(declare-fun b!991067 () Bool)

(declare-fun lt!439676 () Unit!32754)

(assert (=> b!991067 (= e!558852 lt!439676)))

(assert (=> b!991067 (= lt!439676 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220))) lt!439576))))

(assert (=> b!991067 (isDefined!388 (getValueByKey!518 (toList!6864 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220))) lt!439576))))

(declare-fun b!991068 () Bool)

(declare-fun Unit!32762 () Unit!32754)

(assert (=> b!991068 (= e!558852 Unit!32762)))

(declare-fun b!991069 () Bool)

(assert (=> b!991069 (= e!558851 (isDefined!388 (getValueByKey!518 (toList!6864 (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220))) lt!439576)))))

(assert (= (and d!117669 c!100537) b!991067))

(assert (= (and d!117669 (not c!100537)) b!991068))

(assert (= (and d!117669 (not res!662587)) b!991069))

(declare-fun m!918389 () Bool)

(assert (=> d!117669 m!918389))

(declare-fun m!918391 () Bool)

(assert (=> b!991067 m!918391))

(declare-fun m!918393 () Bool)

(assert (=> b!991067 m!918393))

(assert (=> b!991067 m!918393))

(declare-fun m!918395 () Bool)

(assert (=> b!991067 m!918395))

(assert (=> b!991069 m!918393))

(assert (=> b!991069 m!918393))

(assert (=> b!991069 m!918395))

(assert (=> b!990896 d!117669))

(declare-fun d!117671 () Bool)

(assert (=> d!117671 (= (apply!891 (+!3121 lt!439579 (tuple2!15011 lt!439567 minValue!1220)) lt!439571) (apply!891 lt!439579 lt!439571))))

(declare-fun lt!439677 () Unit!32754)

(assert (=> d!117671 (= lt!439677 (choose!1630 lt!439579 lt!439567 minValue!1220 lt!439571))))

(declare-fun e!558853 () Bool)

(assert (=> d!117671 e!558853))

(declare-fun res!662588 () Bool)

(assert (=> d!117671 (=> (not res!662588) (not e!558853))))

(assert (=> d!117671 (= res!662588 (contains!5698 lt!439579 lt!439571))))

(assert (=> d!117671 (= (addApplyDifferent!466 lt!439579 lt!439567 minValue!1220 lt!439571) lt!439677)))

(declare-fun b!991070 () Bool)

(assert (=> b!991070 (= e!558853 (not (= lt!439571 lt!439567)))))

(assert (= (and d!117671 res!662588) b!991070))

(assert (=> d!117671 m!918141))

(assert (=> d!117671 m!918141))

(assert (=> d!117671 m!918143))

(declare-fun m!918397 () Bool)

(assert (=> d!117671 m!918397))

(assert (=> d!117671 m!918155))

(declare-fun m!918399 () Bool)

(assert (=> d!117671 m!918399))

(assert (=> b!990896 d!117671))

(declare-fun d!117673 () Bool)

(declare-fun e!558854 () Bool)

(assert (=> d!117673 e!558854))

(declare-fun res!662590 () Bool)

(assert (=> d!117673 (=> (not res!662590) (not e!558854))))

(declare-fun lt!439681 () ListLongMap!13697)

(assert (=> d!117673 (= res!662590 (contains!5698 lt!439681 (_1!7516 (tuple2!15011 lt!439575 zeroValue!1220))))))

(declare-fun lt!439678 () List!20890)

(assert (=> d!117673 (= lt!439681 (ListLongMap!13698 lt!439678))))

(declare-fun lt!439680 () Unit!32754)

(declare-fun lt!439679 () Unit!32754)

(assert (=> d!117673 (= lt!439680 lt!439679)))

(assert (=> d!117673 (= (getValueByKey!518 lt!439678 (_1!7516 (tuple2!15011 lt!439575 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439575 zeroValue!1220))))))

(assert (=> d!117673 (= lt!439679 (lemmaContainsTupThenGetReturnValue!275 lt!439678 (_1!7516 (tuple2!15011 lt!439575 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439575 zeroValue!1220))))))

(assert (=> d!117673 (= lt!439678 (insertStrictlySorted!332 (toList!6864 lt!439563) (_1!7516 (tuple2!15011 lt!439575 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439575 zeroValue!1220))))))

(assert (=> d!117673 (= (+!3121 lt!439563 (tuple2!15011 lt!439575 zeroValue!1220)) lt!439681)))

(declare-fun b!991071 () Bool)

(declare-fun res!662589 () Bool)

(assert (=> b!991071 (=> (not res!662589) (not e!558854))))

(assert (=> b!991071 (= res!662589 (= (getValueByKey!518 (toList!6864 lt!439681) (_1!7516 (tuple2!15011 lt!439575 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439575 zeroValue!1220)))))))

(declare-fun b!991072 () Bool)

(assert (=> b!991072 (= e!558854 (contains!5699 (toList!6864 lt!439681) (tuple2!15011 lt!439575 zeroValue!1220)))))

(assert (= (and d!117673 res!662590) b!991071))

(assert (= (and b!991071 res!662589) b!991072))

(declare-fun m!918401 () Bool)

(assert (=> d!117673 m!918401))

(declare-fun m!918403 () Bool)

(assert (=> d!117673 m!918403))

(declare-fun m!918405 () Bool)

(assert (=> d!117673 m!918405))

(declare-fun m!918407 () Bool)

(assert (=> d!117673 m!918407))

(declare-fun m!918409 () Bool)

(assert (=> b!991071 m!918409))

(declare-fun m!918411 () Bool)

(assert (=> b!991072 m!918411))

(assert (=> b!990896 d!117673))

(declare-fun d!117675 () Bool)

(assert (=> d!117675 (= (apply!891 (+!3121 lt!439579 (tuple2!15011 lt!439567 minValue!1220)) lt!439571) (get!15651 (getValueByKey!518 (toList!6864 (+!3121 lt!439579 (tuple2!15011 lt!439567 minValue!1220))) lt!439571)))))

(declare-fun bs!28131 () Bool)

(assert (= bs!28131 d!117675))

(declare-fun m!918413 () Bool)

(assert (=> bs!28131 m!918413))

(assert (=> bs!28131 m!918413))

(declare-fun m!918415 () Bool)

(assert (=> bs!28131 m!918415))

(assert (=> b!990896 d!117675))

(declare-fun d!117677 () Bool)

(assert (=> d!117677 (= (apply!891 lt!439566 lt!439560) (get!15651 (getValueByKey!518 (toList!6864 lt!439566) lt!439560)))))

(declare-fun bs!28132 () Bool)

(assert (= bs!28132 d!117677))

(declare-fun m!918417 () Bool)

(assert (=> bs!28132 m!918417))

(assert (=> bs!28132 m!918417))

(declare-fun m!918419 () Bool)

(assert (=> bs!28132 m!918419))

(assert (=> b!990896 d!117677))

(declare-fun d!117679 () Bool)

(assert (=> d!117679 (= (apply!891 (+!3121 lt!439570 (tuple2!15011 lt!439565 minValue!1220)) lt!439577) (get!15651 (getValueByKey!518 (toList!6864 (+!3121 lt!439570 (tuple2!15011 lt!439565 minValue!1220))) lt!439577)))))

(declare-fun bs!28133 () Bool)

(assert (= bs!28133 d!117679))

(declare-fun m!918421 () Bool)

(assert (=> bs!28133 m!918421))

(assert (=> bs!28133 m!918421))

(declare-fun m!918423 () Bool)

(assert (=> bs!28133 m!918423))

(assert (=> b!990896 d!117679))

(declare-fun d!117681 () Bool)

(assert (=> d!117681 (= (apply!891 (+!3121 lt!439566 (tuple2!15011 lt!439574 zeroValue!1220)) lt!439560) (get!15651 (getValueByKey!518 (toList!6864 (+!3121 lt!439566 (tuple2!15011 lt!439574 zeroValue!1220))) lt!439560)))))

(declare-fun bs!28134 () Bool)

(assert (= bs!28134 d!117681))

(declare-fun m!918425 () Bool)

(assert (=> bs!28134 m!918425))

(assert (=> bs!28134 m!918425))

(declare-fun m!918427 () Bool)

(assert (=> bs!28134 m!918427))

(assert (=> b!990896 d!117681))

(declare-fun d!117683 () Bool)

(declare-fun e!558855 () Bool)

(assert (=> d!117683 e!558855))

(declare-fun res!662592 () Bool)

(assert (=> d!117683 (=> (not res!662592) (not e!558855))))

(declare-fun lt!439685 () ListLongMap!13697)

(assert (=> d!117683 (= res!662592 (contains!5698 lt!439685 (_1!7516 (tuple2!15011 lt!439565 minValue!1220))))))

(declare-fun lt!439682 () List!20890)

(assert (=> d!117683 (= lt!439685 (ListLongMap!13698 lt!439682))))

(declare-fun lt!439684 () Unit!32754)

(declare-fun lt!439683 () Unit!32754)

(assert (=> d!117683 (= lt!439684 lt!439683)))

(assert (=> d!117683 (= (getValueByKey!518 lt!439682 (_1!7516 (tuple2!15011 lt!439565 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439565 minValue!1220))))))

(assert (=> d!117683 (= lt!439683 (lemmaContainsTupThenGetReturnValue!275 lt!439682 (_1!7516 (tuple2!15011 lt!439565 minValue!1220)) (_2!7516 (tuple2!15011 lt!439565 minValue!1220))))))

(assert (=> d!117683 (= lt!439682 (insertStrictlySorted!332 (toList!6864 lt!439570) (_1!7516 (tuple2!15011 lt!439565 minValue!1220)) (_2!7516 (tuple2!15011 lt!439565 minValue!1220))))))

(assert (=> d!117683 (= (+!3121 lt!439570 (tuple2!15011 lt!439565 minValue!1220)) lt!439685)))

(declare-fun b!991073 () Bool)

(declare-fun res!662591 () Bool)

(assert (=> b!991073 (=> (not res!662591) (not e!558855))))

(assert (=> b!991073 (= res!662591 (= (getValueByKey!518 (toList!6864 lt!439685) (_1!7516 (tuple2!15011 lt!439565 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439565 minValue!1220)))))))

(declare-fun b!991074 () Bool)

(assert (=> b!991074 (= e!558855 (contains!5699 (toList!6864 lt!439685) (tuple2!15011 lt!439565 minValue!1220)))))

(assert (= (and d!117683 res!662592) b!991073))

(assert (= (and b!991073 res!662591) b!991074))

(declare-fun m!918429 () Bool)

(assert (=> d!117683 m!918429))

(declare-fun m!918431 () Bool)

(assert (=> d!117683 m!918431))

(declare-fun m!918433 () Bool)

(assert (=> d!117683 m!918433))

(declare-fun m!918435 () Bool)

(assert (=> d!117683 m!918435))

(declare-fun m!918437 () Bool)

(assert (=> b!991073 m!918437))

(declare-fun m!918439 () Bool)

(assert (=> b!991074 m!918439))

(assert (=> b!990896 d!117683))

(declare-fun d!117685 () Bool)

(assert (=> d!117685 (= (apply!891 (+!3121 lt!439566 (tuple2!15011 lt!439574 zeroValue!1220)) lt!439560) (apply!891 lt!439566 lt!439560))))

(declare-fun lt!439686 () Unit!32754)

(assert (=> d!117685 (= lt!439686 (choose!1630 lt!439566 lt!439574 zeroValue!1220 lt!439560))))

(declare-fun e!558856 () Bool)

(assert (=> d!117685 e!558856))

(declare-fun res!662593 () Bool)

(assert (=> d!117685 (=> (not res!662593) (not e!558856))))

(assert (=> d!117685 (= res!662593 (contains!5698 lt!439566 lt!439560))))

(assert (=> d!117685 (= (addApplyDifferent!466 lt!439566 lt!439574 zeroValue!1220 lt!439560) lt!439686)))

(declare-fun b!991075 () Bool)

(assert (=> b!991075 (= e!558856 (not (= lt!439560 lt!439574)))))

(assert (= (and d!117685 res!662593) b!991075))

(assert (=> d!117685 m!918137))

(assert (=> d!117685 m!918137))

(assert (=> d!117685 m!918151))

(declare-fun m!918441 () Bool)

(assert (=> d!117685 m!918441))

(assert (=> d!117685 m!918163))

(declare-fun m!918443 () Bool)

(assert (=> d!117685 m!918443))

(assert (=> b!990896 d!117685))

(declare-fun d!117687 () Bool)

(declare-fun e!558857 () Bool)

(assert (=> d!117687 e!558857))

(declare-fun res!662595 () Bool)

(assert (=> d!117687 (=> (not res!662595) (not e!558857))))

(declare-fun lt!439690 () ListLongMap!13697)

(assert (=> d!117687 (= res!662595 (contains!5698 lt!439690 (_1!7516 (tuple2!15011 lt!439567 minValue!1220))))))

(declare-fun lt!439687 () List!20890)

(assert (=> d!117687 (= lt!439690 (ListLongMap!13698 lt!439687))))

(declare-fun lt!439689 () Unit!32754)

(declare-fun lt!439688 () Unit!32754)

(assert (=> d!117687 (= lt!439689 lt!439688)))

(assert (=> d!117687 (= (getValueByKey!518 lt!439687 (_1!7516 (tuple2!15011 lt!439567 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439567 minValue!1220))))))

(assert (=> d!117687 (= lt!439688 (lemmaContainsTupThenGetReturnValue!275 lt!439687 (_1!7516 (tuple2!15011 lt!439567 minValue!1220)) (_2!7516 (tuple2!15011 lt!439567 minValue!1220))))))

(assert (=> d!117687 (= lt!439687 (insertStrictlySorted!332 (toList!6864 lt!439579) (_1!7516 (tuple2!15011 lt!439567 minValue!1220)) (_2!7516 (tuple2!15011 lt!439567 minValue!1220))))))

(assert (=> d!117687 (= (+!3121 lt!439579 (tuple2!15011 lt!439567 minValue!1220)) lt!439690)))

(declare-fun b!991076 () Bool)

(declare-fun res!662594 () Bool)

(assert (=> b!991076 (=> (not res!662594) (not e!558857))))

(assert (=> b!991076 (= res!662594 (= (getValueByKey!518 (toList!6864 lt!439690) (_1!7516 (tuple2!15011 lt!439567 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439567 minValue!1220)))))))

(declare-fun b!991077 () Bool)

(assert (=> b!991077 (= e!558857 (contains!5699 (toList!6864 lt!439690) (tuple2!15011 lt!439567 minValue!1220)))))

(assert (= (and d!117687 res!662595) b!991076))

(assert (= (and b!991076 res!662594) b!991077))

(declare-fun m!918445 () Bool)

(assert (=> d!117687 m!918445))

(declare-fun m!918447 () Bool)

(assert (=> d!117687 m!918447))

(declare-fun m!918449 () Bool)

(assert (=> d!117687 m!918449))

(declare-fun m!918451 () Bool)

(assert (=> d!117687 m!918451))

(declare-fun m!918453 () Bool)

(assert (=> b!991076 m!918453))

(declare-fun m!918455 () Bool)

(assert (=> b!991077 m!918455))

(assert (=> b!990896 d!117687))

(declare-fun b!991078 () Bool)

(declare-fun e!558859 () Bool)

(assert (=> b!991078 (= e!558859 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991078 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!991079 () Bool)

(assert (=> b!991079 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(assert (=> b!991079 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30591 _values!1278)))))

(declare-fun e!558864 () Bool)

(declare-fun lt!439691 () ListLongMap!13697)

(assert (=> b!991079 (= e!558864 (= (apply!891 lt!439691 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15647 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!991080 () Bool)

(declare-fun e!558861 () Bool)

(assert (=> b!991080 (= e!558861 e!558864)))

(assert (=> b!991080 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun res!662598 () Bool)

(assert (=> b!991080 (= res!662598 (contains!5698 lt!439691 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991080 (=> (not res!662598) (not e!558864))))

(declare-fun d!117689 () Bool)

(declare-fun e!558863 () Bool)

(assert (=> d!117689 e!558863))

(declare-fun res!662597 () Bool)

(assert (=> d!117689 (=> (not res!662597) (not e!558863))))

(assert (=> d!117689 (= res!662597 (not (contains!5698 lt!439691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!558858 () ListLongMap!13697)

(assert (=> d!117689 (= lt!439691 e!558858)))

(declare-fun c!100538 () Bool)

(assert (=> d!117689 (= c!100538 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(assert (=> d!117689 (validMask!0 mask!1948)))

(assert (=> d!117689 (= (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439691)))

(declare-fun bm!42042 () Bool)

(declare-fun call!42045 () ListLongMap!13697)

(assert (=> bm!42042 (= call!42045 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991081 () Bool)

(assert (=> b!991081 (= e!558863 e!558861)))

(declare-fun c!100540 () Bool)

(assert (=> b!991081 (= c!100540 e!558859)))

(declare-fun res!662596 () Bool)

(assert (=> b!991081 (=> (not res!662596) (not e!558859))))

(assert (=> b!991081 (= res!662596 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun b!991082 () Bool)

(declare-fun e!558862 () Bool)

(assert (=> b!991082 (= e!558862 (isEmpty!733 lt!439691))))

(declare-fun b!991083 () Bool)

(assert (=> b!991083 (= e!558858 (ListLongMap!13698 Nil!20887))))

(declare-fun b!991084 () Bool)

(declare-fun lt!439692 () Unit!32754)

(declare-fun lt!439697 () Unit!32754)

(assert (=> b!991084 (= lt!439692 lt!439697)))

(declare-fun lt!439695 () ListLongMap!13697)

(declare-fun lt!439693 () (_ BitVec 64))

(declare-fun lt!439696 () (_ BitVec 64))

(declare-fun lt!439694 () V!36065)

(assert (=> b!991084 (not (contains!5698 (+!3121 lt!439695 (tuple2!15011 lt!439696 lt!439694)) lt!439693))))

(assert (=> b!991084 (= lt!439697 (addStillNotContains!238 lt!439695 lt!439696 lt!439694 lt!439693))))

(assert (=> b!991084 (= lt!439693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991084 (= lt!439694 (get!15647 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991084 (= lt!439696 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!991084 (= lt!439695 call!42045)))

(declare-fun e!558860 () ListLongMap!13697)

(assert (=> b!991084 (= e!558860 (+!3121 call!42045 (tuple2!15011 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15647 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991085 () Bool)

(declare-fun res!662599 () Bool)

(assert (=> b!991085 (=> (not res!662599) (not e!558863))))

(assert (=> b!991085 (= res!662599 (not (contains!5698 lt!439691 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991086 () Bool)

(assert (=> b!991086 (= e!558858 e!558860)))

(declare-fun c!100541 () Bool)

(assert (=> b!991086 (= c!100541 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991087 () Bool)

(assert (=> b!991087 (= e!558862 (= lt!439691 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991088 () Bool)

(assert (=> b!991088 (= e!558861 e!558862)))

(declare-fun c!100539 () Bool)

(assert (=> b!991088 (= c!100539 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30590 _keys!1544)))))

(declare-fun b!991089 () Bool)

(assert (=> b!991089 (= e!558860 call!42045)))

(assert (= (and d!117689 c!100538) b!991083))

(assert (= (and d!117689 (not c!100538)) b!991086))

(assert (= (and b!991086 c!100541) b!991084))

(assert (= (and b!991086 (not c!100541)) b!991089))

(assert (= (or b!991084 b!991089) bm!42042))

(assert (= (and d!117689 res!662597) b!991085))

(assert (= (and b!991085 res!662599) b!991081))

(assert (= (and b!991081 res!662596) b!991078))

(assert (= (and b!991081 c!100540) b!991080))

(assert (= (and b!991081 (not c!100540)) b!991088))

(assert (= (and b!991080 res!662598) b!991079))

(assert (= (and b!991088 c!100539) b!991087))

(assert (= (and b!991088 (not c!100539)) b!991082))

(declare-fun b_lambda!15199 () Bool)

(assert (=> (not b_lambda!15199) (not b!991079)))

(assert (=> b!991079 t!29859))

(declare-fun b_and!32259 () Bool)

(assert (= b_and!32257 (and (=> t!29859 result!13653) b_and!32259)))

(declare-fun b_lambda!15201 () Bool)

(assert (=> (not b_lambda!15201) (not b!991084)))

(assert (=> b!991084 t!29859))

(declare-fun b_and!32261 () Bool)

(assert (= b_and!32259 (and (=> t!29859 result!13653) b_and!32261)))

(assert (=> b!991078 m!918119))

(assert (=> b!991078 m!918119))

(assert (=> b!991078 m!918129))

(declare-fun m!918457 () Bool)

(assert (=> b!991084 m!918457))

(assert (=> b!991084 m!918117))

(assert (=> b!991084 m!917989))

(assert (=> b!991084 m!918119))

(assert (=> b!991084 m!918117))

(assert (=> b!991084 m!917989))

(assert (=> b!991084 m!918123))

(declare-fun m!918459 () Bool)

(assert (=> b!991084 m!918459))

(assert (=> b!991084 m!918459))

(declare-fun m!918461 () Bool)

(assert (=> b!991084 m!918461))

(declare-fun m!918463 () Bool)

(assert (=> b!991084 m!918463))

(declare-fun m!918465 () Bool)

(assert (=> b!991082 m!918465))

(declare-fun m!918467 () Bool)

(assert (=> d!117689 m!918467))

(assert (=> d!117689 m!917973))

(declare-fun m!918469 () Bool)

(assert (=> b!991087 m!918469))

(declare-fun m!918471 () Bool)

(assert (=> b!991085 m!918471))

(assert (=> b!991080 m!918119))

(assert (=> b!991080 m!918119))

(declare-fun m!918473 () Bool)

(assert (=> b!991080 m!918473))

(assert (=> bm!42042 m!918469))

(assert (=> b!991079 m!918117))

(assert (=> b!991079 m!917989))

(assert (=> b!991079 m!918119))

(assert (=> b!991079 m!918117))

(assert (=> b!991079 m!917989))

(assert (=> b!991079 m!918123))

(assert (=> b!991079 m!918119))

(declare-fun m!918475 () Bool)

(assert (=> b!991079 m!918475))

(assert (=> b!991086 m!918119))

(assert (=> b!991086 m!918119))

(assert (=> b!991086 m!918129))

(assert (=> b!990896 d!117689))

(declare-fun d!117691 () Bool)

(assert (=> d!117691 (= (apply!891 lt!439570 lt!439577) (get!15651 (getValueByKey!518 (toList!6864 lt!439570) lt!439577)))))

(declare-fun bs!28135 () Bool)

(assert (= bs!28135 d!117691))

(declare-fun m!918477 () Bool)

(assert (=> bs!28135 m!918477))

(assert (=> bs!28135 m!918477))

(declare-fun m!918479 () Bool)

(assert (=> bs!28135 m!918479))

(assert (=> b!990896 d!117691))

(declare-fun d!117693 () Bool)

(declare-fun e!558865 () Bool)

(assert (=> d!117693 e!558865))

(declare-fun res!662601 () Bool)

(assert (=> d!117693 (=> (not res!662601) (not e!558865))))

(declare-fun lt!439701 () ListLongMap!13697)

(assert (=> d!117693 (= res!662601 (contains!5698 lt!439701 (_1!7516 (tuple2!15011 lt!439574 zeroValue!1220))))))

(declare-fun lt!439698 () List!20890)

(assert (=> d!117693 (= lt!439701 (ListLongMap!13698 lt!439698))))

(declare-fun lt!439700 () Unit!32754)

(declare-fun lt!439699 () Unit!32754)

(assert (=> d!117693 (= lt!439700 lt!439699)))

(assert (=> d!117693 (= (getValueByKey!518 lt!439698 (_1!7516 (tuple2!15011 lt!439574 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439574 zeroValue!1220))))))

(assert (=> d!117693 (= lt!439699 (lemmaContainsTupThenGetReturnValue!275 lt!439698 (_1!7516 (tuple2!15011 lt!439574 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439574 zeroValue!1220))))))

(assert (=> d!117693 (= lt!439698 (insertStrictlySorted!332 (toList!6864 lt!439566) (_1!7516 (tuple2!15011 lt!439574 zeroValue!1220)) (_2!7516 (tuple2!15011 lt!439574 zeroValue!1220))))))

(assert (=> d!117693 (= (+!3121 lt!439566 (tuple2!15011 lt!439574 zeroValue!1220)) lt!439701)))

(declare-fun b!991090 () Bool)

(declare-fun res!662600 () Bool)

(assert (=> b!991090 (=> (not res!662600) (not e!558865))))

(assert (=> b!991090 (= res!662600 (= (getValueByKey!518 (toList!6864 lt!439701) (_1!7516 (tuple2!15011 lt!439574 zeroValue!1220))) (Some!523 (_2!7516 (tuple2!15011 lt!439574 zeroValue!1220)))))))

(declare-fun b!991091 () Bool)

(assert (=> b!991091 (= e!558865 (contains!5699 (toList!6864 lt!439701) (tuple2!15011 lt!439574 zeroValue!1220)))))

(assert (= (and d!117693 res!662601) b!991090))

(assert (= (and b!991090 res!662600) b!991091))

(declare-fun m!918481 () Bool)

(assert (=> d!117693 m!918481))

(declare-fun m!918483 () Bool)

(assert (=> d!117693 m!918483))

(declare-fun m!918485 () Bool)

(assert (=> d!117693 m!918485))

(declare-fun m!918487 () Bool)

(assert (=> d!117693 m!918487))

(declare-fun m!918489 () Bool)

(assert (=> b!991090 m!918489))

(declare-fun m!918491 () Bool)

(assert (=> b!991091 m!918491))

(assert (=> b!990896 d!117693))

(declare-fun d!117695 () Bool)

(assert (=> d!117695 (= (apply!891 (+!3121 lt!439570 (tuple2!15011 lt!439565 minValue!1220)) lt!439577) (apply!891 lt!439570 lt!439577))))

(declare-fun lt!439702 () Unit!32754)

(assert (=> d!117695 (= lt!439702 (choose!1630 lt!439570 lt!439565 minValue!1220 lt!439577))))

(declare-fun e!558866 () Bool)

(assert (=> d!117695 e!558866))

(declare-fun res!662602 () Bool)

(assert (=> d!117695 (=> (not res!662602) (not e!558866))))

(assert (=> d!117695 (= res!662602 (contains!5698 lt!439570 lt!439577))))

(assert (=> d!117695 (= (addApplyDifferent!466 lt!439570 lt!439565 minValue!1220 lt!439577) lt!439702)))

(declare-fun b!991092 () Bool)

(assert (=> b!991092 (= e!558866 (not (= lt!439577 lt!439565)))))

(assert (= (and d!117695 res!662602) b!991092))

(assert (=> d!117695 m!918147))

(assert (=> d!117695 m!918147))

(assert (=> d!117695 m!918157))

(declare-fun m!918493 () Bool)

(assert (=> d!117695 m!918493))

(assert (=> d!117695 m!918165))

(declare-fun m!918495 () Bool)

(assert (=> d!117695 m!918495))

(assert (=> b!990896 d!117695))

(declare-fun d!117697 () Bool)

(assert (=> d!117697 (= (apply!891 lt!439579 lt!439571) (get!15651 (getValueByKey!518 (toList!6864 lt!439579) lt!439571)))))

(declare-fun bs!28136 () Bool)

(assert (= bs!28136 d!117697))

(declare-fun m!918497 () Bool)

(assert (=> bs!28136 m!918497))

(assert (=> bs!28136 m!918497))

(declare-fun m!918499 () Bool)

(assert (=> bs!28136 m!918499))

(assert (=> b!990896 d!117697))

(declare-fun d!117699 () Bool)

(declare-fun e!558867 () Bool)

(assert (=> d!117699 e!558867))

(declare-fun res!662603 () Bool)

(assert (=> d!117699 (=> res!662603 e!558867)))

(declare-fun lt!439704 () Bool)

(assert (=> d!117699 (= res!662603 (not lt!439704))))

(declare-fun lt!439705 () Bool)

(assert (=> d!117699 (= lt!439704 lt!439705)))

(declare-fun lt!439703 () Unit!32754)

(declare-fun e!558868 () Unit!32754)

(assert (=> d!117699 (= lt!439703 e!558868)))

(declare-fun c!100542 () Bool)

(assert (=> d!117699 (= c!100542 lt!439705)))

(assert (=> d!117699 (= lt!439705 (containsKey!480 (toList!6864 lt!439539) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117699 (= (contains!5698 lt!439539 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439704)))

(declare-fun b!991093 () Bool)

(declare-fun lt!439706 () Unit!32754)

(assert (=> b!991093 (= e!558868 lt!439706)))

(assert (=> b!991093 (= lt!439706 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439539) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991093 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439539) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991094 () Bool)

(declare-fun Unit!32763 () Unit!32754)

(assert (=> b!991094 (= e!558868 Unit!32763)))

(declare-fun b!991095 () Bool)

(assert (=> b!991095 (= e!558867 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117699 c!100542) b!991093))

(assert (= (and d!117699 (not c!100542)) b!991094))

(assert (= (and d!117699 (not res!662603)) b!991095))

(declare-fun m!918501 () Bool)

(assert (=> d!117699 m!918501))

(declare-fun m!918503 () Bool)

(assert (=> b!991093 m!918503))

(assert (=> b!991093 m!918371))

(assert (=> b!991093 m!918371))

(declare-fun m!918505 () Bool)

(assert (=> b!991093 m!918505))

(assert (=> b!991095 m!918371))

(assert (=> b!991095 m!918371))

(assert (=> b!991095 m!918505))

(assert (=> bm!42012 d!117699))

(assert (=> bm!42016 d!117641))

(declare-fun lt!439709 () Bool)

(declare-fun d!117701 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!422 (List!20890) (InoxSet tuple2!15010))

(assert (=> d!117701 (= lt!439709 (select (content!422 (toList!6864 lt!439557)) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!558874 () Bool)

(assert (=> d!117701 (= lt!439709 e!558874)))

(declare-fun res!662609 () Bool)

(assert (=> d!117701 (=> (not res!662609) (not e!558874))))

(assert (=> d!117701 (= res!662609 ((_ is Cons!20886) (toList!6864 lt!439557)))))

(assert (=> d!117701 (= (contains!5699 (toList!6864 lt!439557) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439709)))

(declare-fun b!991100 () Bool)

(declare-fun e!558873 () Bool)

(assert (=> b!991100 (= e!558874 e!558873)))

(declare-fun res!662608 () Bool)

(assert (=> b!991100 (=> res!662608 e!558873)))

(assert (=> b!991100 (= res!662608 (= (h!22048 (toList!6864 lt!439557)) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991101 () Bool)

(assert (=> b!991101 (= e!558873 (contains!5699 (t!29860 (toList!6864 lt!439557)) (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117701 res!662609) b!991100))

(assert (= (and b!991100 (not res!662608)) b!991101))

(declare-fun m!918507 () Bool)

(assert (=> d!117701 m!918507))

(declare-fun m!918509 () Bool)

(assert (=> d!117701 m!918509))

(declare-fun m!918511 () Bool)

(assert (=> b!991101 m!918511))

(assert (=> b!990883 d!117701))

(declare-fun d!117703 () Bool)

(assert (=> d!117703 (= (apply!891 lt!439573 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15651 (getValueByKey!518 (toList!6864 lt!439573) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28137 () Bool)

(assert (= bs!28137 d!117703))

(declare-fun m!918513 () Bool)

(assert (=> bs!28137 m!918513))

(assert (=> bs!28137 m!918513))

(declare-fun m!918515 () Bool)

(assert (=> bs!28137 m!918515))

(assert (=> b!990893 d!117703))

(declare-fun b!991103 () Bool)

(declare-fun e!558875 () Option!524)

(declare-fun e!558876 () Option!524)

(assert (=> b!991103 (= e!558875 e!558876)))

(declare-fun c!100544 () Bool)

(assert (=> b!991103 (= c!100544 (and ((_ is Cons!20886) (toList!6864 lt!439557)) (not (= (_1!7516 (h!22048 (toList!6864 lt!439557))) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!117705 () Bool)

(declare-fun c!100543 () Bool)

(assert (=> d!117705 (= c!100543 (and ((_ is Cons!20886) (toList!6864 lt!439557)) (= (_1!7516 (h!22048 (toList!6864 lt!439557))) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!117705 (= (getValueByKey!518 (toList!6864 lt!439557) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!558875)))

(declare-fun b!991104 () Bool)

(assert (=> b!991104 (= e!558876 (getValueByKey!518 (t!29860 (toList!6864 lt!439557)) (_1!7516 (tuple2!15011 (select (arr!30109 _keys!1544) from!1932) (get!15647 (select (arr!30110 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!991102 () Bool)

(assert (=> b!991102 (= e!558875 (Some!523 (_2!7516 (h!22048 (toList!6864 lt!439557)))))))

(declare-fun b!991105 () Bool)

(assert (=> b!991105 (= e!558876 None!522)))

(assert (= (and d!117705 c!100543) b!991102))

(assert (= (and d!117705 (not c!100543)) b!991103))

(assert (= (and b!991103 c!100544) b!991104))

(assert (= (and b!991103 (not c!100544)) b!991105))

(declare-fun m!918517 () Bool)

(assert (=> b!991104 m!918517))

(assert (=> b!990882 d!117705))

(declare-fun d!117707 () Bool)

(assert (=> d!117707 (= (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990922 d!117707))

(declare-fun d!117709 () Bool)

(declare-fun e!558877 () Bool)

(assert (=> d!117709 e!558877))

(declare-fun res!662610 () Bool)

(assert (=> d!117709 (=> res!662610 e!558877)))

(declare-fun lt!439711 () Bool)

(assert (=> d!117709 (= res!662610 (not lt!439711))))

(declare-fun lt!439712 () Bool)

(assert (=> d!117709 (= lt!439711 lt!439712)))

(declare-fun lt!439710 () Unit!32754)

(declare-fun e!558878 () Unit!32754)

(assert (=> d!117709 (= lt!439710 e!558878)))

(declare-fun c!100545 () Bool)

(assert (=> d!117709 (= c!100545 lt!439712)))

(assert (=> d!117709 (= lt!439712 (containsKey!480 (toList!6864 lt!439539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117709 (= (contains!5698 lt!439539 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439711)))

(declare-fun b!991106 () Bool)

(declare-fun lt!439713 () Unit!32754)

(assert (=> b!991106 (= e!558878 lt!439713)))

(assert (=> b!991106 (= lt!439713 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991106 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991107 () Bool)

(declare-fun Unit!32764 () Unit!32754)

(assert (=> b!991107 (= e!558878 Unit!32764)))

(declare-fun b!991108 () Bool)

(assert (=> b!991108 (= e!558877 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117709 c!100545) b!991106))

(assert (= (and d!117709 (not c!100545)) b!991107))

(assert (= (and d!117709 (not res!662610)) b!991108))

(declare-fun m!918519 () Bool)

(assert (=> d!117709 m!918519))

(declare-fun m!918521 () Bool)

(assert (=> b!991106 m!918521))

(declare-fun m!918523 () Bool)

(assert (=> b!991106 m!918523))

(assert (=> b!991106 m!918523))

(declare-fun m!918525 () Bool)

(assert (=> b!991106 m!918525))

(assert (=> b!991108 m!918523))

(assert (=> b!991108 m!918523))

(assert (=> b!991108 m!918525))

(assert (=> bm!42015 d!117709))

(declare-fun d!117711 () Bool)

(assert (=> d!117711 (= (apply!891 lt!439573 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15651 (getValueByKey!518 (toList!6864 lt!439573) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28138 () Bool)

(assert (= bs!28138 d!117711))

(assert (=> bs!28138 m!918119))

(declare-fun m!918527 () Bool)

(assert (=> bs!28138 m!918527))

(assert (=> bs!28138 m!918527))

(declare-fun m!918529 () Bool)

(assert (=> bs!28138 m!918529))

(assert (=> b!990891 d!117711))

(declare-fun d!117713 () Bool)

(declare-fun c!100546 () Bool)

(assert (=> d!117713 (= c!100546 ((_ is ValueCellFull!11174) (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!558879 () V!36065)

(assert (=> d!117713 (= (get!15647 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558879)))

(declare-fun b!991109 () Bool)

(assert (=> b!991109 (= e!558879 (get!15649 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991110 () Bool)

(assert (=> b!991110 (= e!558879 (get!15650 (select (arr!30110 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117713 c!100546) b!991109))

(assert (= (and d!117713 (not c!100546)) b!991110))

(assert (=> b!991109 m!918117))

(assert (=> b!991109 m!917989))

(declare-fun m!918531 () Bool)

(assert (=> b!991109 m!918531))

(assert (=> b!991110 m!918117))

(assert (=> b!991110 m!917989))

(declare-fun m!918533 () Bool)

(assert (=> b!991110 m!918533))

(assert (=> b!990891 d!117713))

(declare-fun d!117715 () Bool)

(declare-fun e!558880 () Bool)

(assert (=> d!117715 e!558880))

(declare-fun res!662612 () Bool)

(assert (=> d!117715 (=> (not res!662612) (not e!558880))))

(declare-fun lt!439717 () ListLongMap!13697)

(assert (=> d!117715 (= res!662612 (contains!5698 lt!439717 (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439714 () List!20890)

(assert (=> d!117715 (= lt!439717 (ListLongMap!13698 lt!439714))))

(declare-fun lt!439716 () Unit!32754)

(declare-fun lt!439715 () Unit!32754)

(assert (=> d!117715 (= lt!439716 lt!439715)))

(assert (=> d!117715 (= (getValueByKey!518 lt!439714 (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117715 (= lt!439715 (lemmaContainsTupThenGetReturnValue!275 lt!439714 (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117715 (= lt!439714 (insertStrictlySorted!332 (toList!6864 call!42019) (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117715 (= (+!3121 call!42019 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439717)))

(declare-fun b!991111 () Bool)

(declare-fun res!662611 () Bool)

(assert (=> b!991111 (=> (not res!662611) (not e!558880))))

(assert (=> b!991111 (= res!662611 (= (getValueByKey!518 (toList!6864 lt!439717) (_1!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!523 (_2!7516 (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991112 () Bool)

(assert (=> b!991112 (= e!558880 (contains!5699 (toList!6864 lt!439717) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117715 res!662612) b!991111))

(assert (= (and b!991111 res!662611) b!991112))

(declare-fun m!918535 () Bool)

(assert (=> d!117715 m!918535))

(declare-fun m!918537 () Bool)

(assert (=> d!117715 m!918537))

(declare-fun m!918539 () Bool)

(assert (=> d!117715 m!918539))

(declare-fun m!918541 () Bool)

(assert (=> d!117715 m!918541))

(declare-fun m!918543 () Bool)

(assert (=> b!991111 m!918543))

(declare-fun m!918545 () Bool)

(assert (=> b!991112 m!918545))

(assert (=> b!990876 d!117715))

(declare-fun b!991113 () Bool)

(declare-fun e!558883 () Bool)

(declare-fun call!42046 () Bool)

(assert (=> b!991113 (= e!558883 call!42046)))

(declare-fun b!991115 () Bool)

(declare-fun e!558882 () Bool)

(assert (=> b!991115 (= e!558882 call!42046)))

(declare-fun bm!42043 () Bool)

(assert (=> bm!42043 (= call!42046 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!991116 () Bool)

(declare-fun e!558881 () Bool)

(assert (=> b!991116 (= e!558881 e!558883)))

(declare-fun c!100547 () Bool)

(assert (=> b!991116 (= c!100547 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117717 () Bool)

(declare-fun res!662614 () Bool)

(assert (=> d!117717 (=> res!662614 e!558881)))

(assert (=> d!117717 (= res!662614 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30590 _keys!1544)))))

(assert (=> d!117717 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!558881)))

(declare-fun b!991114 () Bool)

(assert (=> b!991114 (= e!558883 e!558882)))

(declare-fun lt!439718 () (_ BitVec 64))

(assert (=> b!991114 (= lt!439718 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!439719 () Unit!32754)

(assert (=> b!991114 (= lt!439719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439718 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!991114 (arrayContainsKey!0 _keys!1544 lt!439718 #b00000000000000000000000000000000)))

(declare-fun lt!439720 () Unit!32754)

(assert (=> b!991114 (= lt!439720 lt!439719)))

(declare-fun res!662613 () Bool)

(assert (=> b!991114 (= res!662613 (= (seekEntryOrOpen!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!991114 (=> (not res!662613) (not e!558882))))

(assert (= (and d!117717 (not res!662614)) b!991116))

(assert (= (and b!991116 c!100547) b!991114))

(assert (= (and b!991116 (not c!100547)) b!991113))

(assert (= (and b!991114 res!662613) b!991115))

(assert (= (or b!991115 b!991113) bm!42043))

(declare-fun m!918547 () Bool)

(assert (=> bm!42043 m!918547))

(declare-fun m!918549 () Bool)

(assert (=> b!991116 m!918549))

(assert (=> b!991116 m!918549))

(declare-fun m!918551 () Bool)

(assert (=> b!991116 m!918551))

(assert (=> b!991114 m!918549))

(declare-fun m!918553 () Bool)

(assert (=> b!991114 m!918553))

(declare-fun m!918555 () Bool)

(assert (=> b!991114 m!918555))

(assert (=> b!991114 m!918549))

(declare-fun m!918557 () Bool)

(assert (=> b!991114 m!918557))

(assert (=> bm!42026 d!117717))

(declare-fun d!117719 () Bool)

(declare-fun e!558884 () Bool)

(assert (=> d!117719 e!558884))

(declare-fun res!662615 () Bool)

(assert (=> d!117719 (=> res!662615 e!558884)))

(declare-fun lt!439722 () Bool)

(assert (=> d!117719 (= res!662615 (not lt!439722))))

(declare-fun lt!439723 () Bool)

(assert (=> d!117719 (= lt!439722 lt!439723)))

(declare-fun lt!439721 () Unit!32754)

(declare-fun e!558885 () Unit!32754)

(assert (=> d!117719 (= lt!439721 e!558885)))

(declare-fun c!100548 () Bool)

(assert (=> d!117719 (= c!100548 lt!439723)))

(assert (=> d!117719 (= lt!439723 (containsKey!480 (toList!6864 lt!439573) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117719 (= (contains!5698 lt!439573 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439722)))

(declare-fun b!991117 () Bool)

(declare-fun lt!439724 () Unit!32754)

(assert (=> b!991117 (= e!558885 lt!439724)))

(assert (=> b!991117 (= lt!439724 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439573) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991117 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439573) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991118 () Bool)

(declare-fun Unit!32765 () Unit!32754)

(assert (=> b!991118 (= e!558885 Unit!32765)))

(declare-fun b!991119 () Bool)

(assert (=> b!991119 (= e!558884 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439573) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117719 c!100548) b!991117))

(assert (= (and d!117719 (not c!100548)) b!991118))

(assert (= (and d!117719 (not res!662615)) b!991119))

(assert (=> d!117719 m!918119))

(declare-fun m!918559 () Bool)

(assert (=> d!117719 m!918559))

(assert (=> b!991117 m!918119))

(declare-fun m!918561 () Bool)

(assert (=> b!991117 m!918561))

(assert (=> b!991117 m!918119))

(assert (=> b!991117 m!918527))

(assert (=> b!991117 m!918527))

(declare-fun m!918563 () Bool)

(assert (=> b!991117 m!918563))

(assert (=> b!991119 m!918119))

(assert (=> b!991119 m!918527))

(assert (=> b!991119 m!918527))

(assert (=> b!991119 m!918563))

(assert (=> b!990890 d!117719))

(declare-fun d!117721 () Bool)

(assert (=> d!117721 (= (apply!891 lt!439539 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15651 (getValueByKey!518 (toList!6864 lt!439539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28139 () Bool)

(assert (= bs!28139 d!117721))

(assert (=> bs!28139 m!918523))

(assert (=> bs!28139 m!918523))

(declare-fun m!918565 () Bool)

(assert (=> bs!28139 m!918565))

(assert (=> b!990858 d!117721))

(declare-fun d!117723 () Bool)

(declare-fun e!558886 () Bool)

(assert (=> d!117723 e!558886))

(declare-fun res!662617 () Bool)

(assert (=> d!117723 (=> (not res!662617) (not e!558886))))

(declare-fun lt!439728 () ListLongMap!13697)

(assert (=> d!117723 (= res!662617 (contains!5698 lt!439728 (_1!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439725 () List!20890)

(assert (=> d!117723 (= lt!439728 (ListLongMap!13698 lt!439725))))

(declare-fun lt!439727 () Unit!32754)

(declare-fun lt!439726 () Unit!32754)

(assert (=> d!117723 (= lt!439727 lt!439726)))

(assert (=> d!117723 (= (getValueByKey!518 lt!439725 (_1!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!523 (_2!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117723 (= lt!439726 (lemmaContainsTupThenGetReturnValue!275 lt!439725 (_1!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117723 (= lt!439725 (insertStrictlySorted!332 (toList!6864 (ite c!100483 call!42018 (ite c!100484 call!42017 call!42014))) (_1!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117723 (= (+!3121 (ite c!100483 call!42018 (ite c!100484 call!42017 call!42014)) (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439728)))

(declare-fun b!991120 () Bool)

(declare-fun res!662616 () Bool)

(assert (=> b!991120 (=> (not res!662616) (not e!558886))))

(assert (=> b!991120 (= res!662616 (= (getValueByKey!518 (toList!6864 lt!439728) (_1!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!523 (_2!7516 (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!991121 () Bool)

(assert (=> b!991121 (= e!558886 (contains!5699 (toList!6864 lt!439728) (ite (or c!100483 c!100484) (tuple2!15011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!15011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117723 res!662617) b!991120))

(assert (= (and b!991120 res!662616) b!991121))

(declare-fun m!918567 () Bool)

(assert (=> d!117723 m!918567))

(declare-fun m!918569 () Bool)

(assert (=> d!117723 m!918569))

(declare-fun m!918571 () Bool)

(assert (=> d!117723 m!918571))

(declare-fun m!918573 () Bool)

(assert (=> d!117723 m!918573))

(declare-fun m!918575 () Bool)

(assert (=> b!991120 m!918575))

(declare-fun m!918577 () Bool)

(assert (=> b!991121 m!918577))

(assert (=> bm!42014 d!117723))

(assert (=> b!990936 d!117707))

(assert (=> b!990935 d!117707))

(declare-fun d!117725 () Bool)

(assert (=> d!117725 (arrayContainsKey!0 _keys!1544 lt!439586 #b00000000000000000000000000000000)))

(declare-fun lt!439731 () Unit!32754)

(declare-fun choose!13 (array!62516 (_ BitVec 64) (_ BitVec 32)) Unit!32754)

(assert (=> d!117725 (= lt!439731 (choose!13 _keys!1544 lt!439586 #b00000000000000000000000000000000))))

(assert (=> d!117725 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117725 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439586 #b00000000000000000000000000000000) lt!439731)))

(declare-fun bs!28140 () Bool)

(assert (= bs!28140 d!117725))

(assert (=> bs!28140 m!918183))

(declare-fun m!918579 () Bool)

(assert (=> bs!28140 m!918579))

(assert (=> b!990920 d!117725))

(declare-fun d!117727 () Bool)

(declare-fun res!662622 () Bool)

(declare-fun e!558891 () Bool)

(assert (=> d!117727 (=> res!662622 e!558891)))

(assert (=> d!117727 (= res!662622 (= (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) lt!439586))))

(assert (=> d!117727 (= (arrayContainsKey!0 _keys!1544 lt!439586 #b00000000000000000000000000000000) e!558891)))

(declare-fun b!991126 () Bool)

(declare-fun e!558892 () Bool)

(assert (=> b!991126 (= e!558891 e!558892)))

(declare-fun res!662623 () Bool)

(assert (=> b!991126 (=> (not res!662623) (not e!558892))))

(assert (=> b!991126 (= res!662623 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30590 _keys!1544)))))

(declare-fun b!991127 () Bool)

(assert (=> b!991127 (= e!558892 (arrayContainsKey!0 _keys!1544 lt!439586 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117727 (not res!662622)) b!991126))

(assert (= (and b!991126 res!662623) b!991127))

(assert (=> d!117727 m!918177))

(declare-fun m!918581 () Bool)

(assert (=> b!991127 m!918581))

(assert (=> b!990920 d!117727))

(declare-fun b!991140 () Bool)

(declare-fun e!558900 () SeekEntryResult!9208)

(assert (=> b!991140 (= e!558900 Undefined!9208)))

(declare-fun b!991141 () Bool)

(declare-fun c!100555 () Bool)

(declare-fun lt!439740 () (_ BitVec 64))

(assert (=> b!991141 (= c!100555 (= lt!439740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!558901 () SeekEntryResult!9208)

(declare-fun e!558899 () SeekEntryResult!9208)

(assert (=> b!991141 (= e!558901 e!558899)))

(declare-fun b!991142 () Bool)

(declare-fun lt!439738 () SeekEntryResult!9208)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62516 (_ BitVec 32)) SeekEntryResult!9208)

(assert (=> b!991142 (= e!558899 (seekKeyOrZeroReturnVacant!0 (x!86221 lt!439738) (index!39205 lt!439738) (index!39205 lt!439738) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!991143 () Bool)

(assert (=> b!991143 (= e!558899 (MissingZero!9208 (index!39205 lt!439738)))))

(declare-fun b!991144 () Bool)

(assert (=> b!991144 (= e!558901 (Found!9208 (index!39205 lt!439738)))))

(declare-fun d!117729 () Bool)

(declare-fun lt!439739 () SeekEntryResult!9208)

(assert (=> d!117729 (and (or ((_ is Undefined!9208) lt!439739) (not ((_ is Found!9208) lt!439739)) (and (bvsge (index!39204 lt!439739) #b00000000000000000000000000000000) (bvslt (index!39204 lt!439739) (size!30590 _keys!1544)))) (or ((_ is Undefined!9208) lt!439739) ((_ is Found!9208) lt!439739) (not ((_ is MissingZero!9208) lt!439739)) (and (bvsge (index!39203 lt!439739) #b00000000000000000000000000000000) (bvslt (index!39203 lt!439739) (size!30590 _keys!1544)))) (or ((_ is Undefined!9208) lt!439739) ((_ is Found!9208) lt!439739) ((_ is MissingZero!9208) lt!439739) (not ((_ is MissingVacant!9208) lt!439739)) (and (bvsge (index!39206 lt!439739) #b00000000000000000000000000000000) (bvslt (index!39206 lt!439739) (size!30590 _keys!1544)))) (or ((_ is Undefined!9208) lt!439739) (ite ((_ is Found!9208) lt!439739) (= (select (arr!30109 _keys!1544) (index!39204 lt!439739)) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9208) lt!439739) (= (select (arr!30109 _keys!1544) (index!39203 lt!439739)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9208) lt!439739) (= (select (arr!30109 _keys!1544) (index!39206 lt!439739)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117729 (= lt!439739 e!558900)))

(declare-fun c!100557 () Bool)

(assert (=> d!117729 (= c!100557 (and ((_ is Intermediate!9208) lt!439738) (undefined!10020 lt!439738)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62516 (_ BitVec 32)) SeekEntryResult!9208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117729 (= lt!439738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117729 (validMask!0 mask!1948)))

(assert (=> d!117729 (= (seekEntryOrOpen!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!439739)))

(declare-fun b!991145 () Bool)

(assert (=> b!991145 (= e!558900 e!558901)))

(assert (=> b!991145 (= lt!439740 (select (arr!30109 _keys!1544) (index!39205 lt!439738)))))

(declare-fun c!100556 () Bool)

(assert (=> b!991145 (= c!100556 (= lt!439740 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117729 c!100557) b!991140))

(assert (= (and d!117729 (not c!100557)) b!991145))

(assert (= (and b!991145 c!100556) b!991144))

(assert (= (and b!991145 (not c!100556)) b!991141))

(assert (= (and b!991141 c!100555) b!991143))

(assert (= (and b!991141 (not c!100555)) b!991142))

(assert (=> b!991142 m!918177))

(declare-fun m!918583 () Bool)

(assert (=> b!991142 m!918583))

(assert (=> d!117729 m!917973))

(declare-fun m!918585 () Bool)

(assert (=> d!117729 m!918585))

(declare-fun m!918587 () Bool)

(assert (=> d!117729 m!918587))

(declare-fun m!918589 () Bool)

(assert (=> d!117729 m!918589))

(assert (=> d!117729 m!918177))

(declare-fun m!918591 () Bool)

(assert (=> d!117729 m!918591))

(declare-fun m!918593 () Bool)

(assert (=> d!117729 m!918593))

(assert (=> d!117729 m!918177))

(assert (=> d!117729 m!918589))

(declare-fun m!918595 () Bool)

(assert (=> b!991145 m!918595))

(assert (=> b!990920 d!117729))

(declare-fun d!117731 () Bool)

(declare-fun e!558902 () Bool)

(assert (=> d!117731 e!558902))

(declare-fun res!662624 () Bool)

(assert (=> d!117731 (=> res!662624 e!558902)))

(declare-fun lt!439742 () Bool)

(assert (=> d!117731 (= res!662624 (not lt!439742))))

(declare-fun lt!439743 () Bool)

(assert (=> d!117731 (= lt!439742 lt!439743)))

(declare-fun lt!439741 () Unit!32754)

(declare-fun e!558903 () Unit!32754)

(assert (=> d!117731 (= lt!439741 e!558903)))

(declare-fun c!100558 () Bool)

(assert (=> d!117731 (= c!100558 lt!439743)))

(assert (=> d!117731 (= lt!439743 (containsKey!480 (toList!6864 lt!439573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117731 (= (contains!5698 lt!439573 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439742)))

(declare-fun b!991146 () Bool)

(declare-fun lt!439744 () Unit!32754)

(assert (=> b!991146 (= e!558903 lt!439744)))

(assert (=> b!991146 (= lt!439744 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6864 lt!439573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991146 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991147 () Bool)

(declare-fun Unit!32766 () Unit!32754)

(assert (=> b!991147 (= e!558903 Unit!32766)))

(declare-fun b!991148 () Bool)

(assert (=> b!991148 (= e!558902 (isDefined!388 (getValueByKey!518 (toList!6864 lt!439573) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117731 c!100558) b!991146))

(assert (= (and d!117731 (not c!100558)) b!991147))

(assert (= (and d!117731 (not res!662624)) b!991148))

(declare-fun m!918597 () Bool)

(assert (=> d!117731 m!918597))

(declare-fun m!918599 () Bool)

(assert (=> b!991146 m!918599))

(assert (=> b!991146 m!918513))

(assert (=> b!991146 m!918513))

(declare-fun m!918601 () Bool)

(assert (=> b!991146 m!918601))

(assert (=> b!991148 m!918513))

(assert (=> b!991148 m!918513))

(assert (=> b!991148 m!918601))

(assert (=> bm!42019 d!117731))

(assert (=> b!990874 d!117597))

(declare-fun b!991149 () Bool)

(declare-fun e!558904 () Bool)

(assert (=> b!991149 (= e!558904 (contains!5700 (ite c!100500 (Cons!20887 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20888) Nil!20888) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!991150 () Bool)

(declare-fun e!558905 () Bool)

(declare-fun call!42047 () Bool)

(assert (=> b!991150 (= e!558905 call!42047)))

(declare-fun c!100559 () Bool)

(declare-fun bm!42044 () Bool)

(assert (=> bm!42044 (= call!42047 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100559 (Cons!20887 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100500 (Cons!20887 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20888) Nil!20888)) (ite c!100500 (Cons!20887 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20888) Nil!20888))))))

(declare-fun d!117733 () Bool)

(declare-fun res!662627 () Bool)

(declare-fun e!558907 () Bool)

(assert (=> d!117733 (=> res!662627 e!558907)))

(assert (=> d!117733 (= res!662627 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30590 _keys!1544)))))

(assert (=> d!117733 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100500 (Cons!20887 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20888) Nil!20888)) e!558907)))

(declare-fun b!991151 () Bool)

(declare-fun e!558906 () Bool)

(assert (=> b!991151 (= e!558907 e!558906)))

(declare-fun res!662625 () Bool)

(assert (=> b!991151 (=> (not res!662625) (not e!558906))))

(assert (=> b!991151 (= res!662625 (not e!558904))))

(declare-fun res!662626 () Bool)

(assert (=> b!991151 (=> (not res!662626) (not e!558904))))

(assert (=> b!991151 (= res!662626 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!991152 () Bool)

(assert (=> b!991152 (= e!558906 e!558905)))

(assert (=> b!991152 (= c!100559 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!991153 () Bool)

(assert (=> b!991153 (= e!558905 call!42047)))

(assert (= (and d!117733 (not res!662627)) b!991151))

(assert (= (and b!991151 res!662626) b!991149))

(assert (= (and b!991151 res!662625) b!991152))

(assert (= (and b!991152 c!100559) b!991150))

(assert (= (and b!991152 (not c!100559)) b!991153))

(assert (= (or b!991150 b!991153) bm!42044))

(assert (=> b!991149 m!918549))

(assert (=> b!991149 m!918549))

(declare-fun m!918603 () Bool)

(assert (=> b!991149 m!918603))

(assert (=> bm!42044 m!918549))

(declare-fun m!918605 () Bool)

(assert (=> bm!42044 m!918605))

(assert (=> b!991151 m!918549))

(assert (=> b!991151 m!918549))

(assert (=> b!991151 m!918551))

(assert (=> b!991152 m!918549))

(assert (=> b!991152 m!918549))

(assert (=> b!991152 m!918551))

(assert (=> bm!42029 d!117733))

(assert (=> d!117591 d!117599))

(assert (=> bm!42023 d!117689))

(declare-fun d!117735 () Bool)

(declare-fun lt!439747 () Bool)

(declare-fun content!423 (List!20891) (InoxSet (_ BitVec 64)))

(assert (=> d!117735 (= lt!439747 (select (content!423 Nil!20888) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!558913 () Bool)

(assert (=> d!117735 (= lt!439747 e!558913)))

(declare-fun res!662633 () Bool)

(assert (=> d!117735 (=> (not res!662633) (not e!558913))))

(assert (=> d!117735 (= res!662633 ((_ is Cons!20887) Nil!20888))))

(assert (=> d!117735 (= (contains!5700 Nil!20888 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)) lt!439747)))

(declare-fun b!991158 () Bool)

(declare-fun e!558912 () Bool)

(assert (=> b!991158 (= e!558913 e!558912)))

(declare-fun res!662632 () Bool)

(assert (=> b!991158 (=> res!662632 e!558912)))

(assert (=> b!991158 (= res!662632 (= (h!22049 Nil!20888) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991159 () Bool)

(assert (=> b!991159 (= e!558912 (contains!5700 (t!29861 Nil!20888) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117735 res!662633) b!991158))

(assert (= (and b!991158 (not res!662632)) b!991159))

(declare-fun m!918607 () Bool)

(assert (=> d!117735 m!918607))

(assert (=> d!117735 m!918177))

(declare-fun m!918609 () Bool)

(assert (=> d!117735 m!918609))

(assert (=> b!991159 m!918177))

(declare-fun m!918611 () Bool)

(assert (=> b!991159 m!918611))

(assert (=> b!990933 d!117735))

(assert (=> d!117587 d!117599))

(declare-fun mapIsEmpty!37029 () Bool)

(declare-fun mapRes!37029 () Bool)

(assert (=> mapIsEmpty!37029 mapRes!37029))

(declare-fun mapNonEmpty!37029 () Bool)

(declare-fun tp!70101 () Bool)

(declare-fun e!558915 () Bool)

(assert (=> mapNonEmpty!37029 (= mapRes!37029 (and tp!70101 e!558915))))

(declare-fun mapValue!37029 () ValueCell!11174)

(declare-fun mapKey!37029 () (_ BitVec 32))

(declare-fun mapRest!37029 () (Array (_ BitVec 32) ValueCell!11174))

(assert (=> mapNonEmpty!37029 (= mapRest!37028 (store mapRest!37029 mapKey!37029 mapValue!37029))))

(declare-fun b!991161 () Bool)

(declare-fun e!558914 () Bool)

(assert (=> b!991161 (= e!558914 tp_is_empty!23311)))

(declare-fun b!991160 () Bool)

(assert (=> b!991160 (= e!558915 tp_is_empty!23311)))

(declare-fun condMapEmpty!37029 () Bool)

(declare-fun mapDefault!37029 () ValueCell!11174)

(assert (=> mapNonEmpty!37028 (= condMapEmpty!37029 (= mapRest!37028 ((as const (Array (_ BitVec 32) ValueCell!11174)) mapDefault!37029)))))

(assert (=> mapNonEmpty!37028 (= tp!70100 (and e!558914 mapRes!37029))))

(assert (= (and mapNonEmpty!37028 condMapEmpty!37029) mapIsEmpty!37029))

(assert (= (and mapNonEmpty!37028 (not condMapEmpty!37029)) mapNonEmpty!37029))

(assert (= (and mapNonEmpty!37029 ((_ is ValueCellFull!11174) mapValue!37029)) b!991160))

(assert (= (and mapNonEmpty!37028 ((_ is ValueCellFull!11174) mapDefault!37029)) b!991161))

(declare-fun m!918613 () Bool)

(assert (=> mapNonEmpty!37029 m!918613))

(declare-fun b_lambda!15203 () Bool)

(assert (= b_lambda!15199 (or (and start!84722 b_free!20095) b_lambda!15203)))

(declare-fun b_lambda!15205 () Bool)

(assert (= b_lambda!15201 (or (and start!84722 b_free!20095) b_lambda!15205)))

(declare-fun b_lambda!15207 () Bool)

(assert (= b_lambda!15195 (or (and start!84722 b_free!20095) b_lambda!15207)))

(declare-fun b_lambda!15209 () Bool)

(assert (= b_lambda!15197 (or (and start!84722 b_free!20095) b_lambda!15209)))

(check-sat (not d!117721) (not bm!42043) (not d!117627) (not d!117731) (not d!117711) (not b_lambda!15191) (not d!117651) (not d!117661) (not b!991057) (not b_next!20095) (not bm!42042) (not d!117725) (not b!991110) (not b!991114) (not b!991052) (not b!991085) (not b!991008) (not b!991142) (not b!991095) (not b!991121) tp_is_empty!23311 (not b!991151) (not b!991079) (not b!991007) (not d!117657) (not b!991019) (not d!117719) (not b!991112) (not d!117633) (not d!117639) (not d!117623) (not d!117653) (not b!991148) (not b!991093) (not d!117671) (not d!117695) (not b!990954) (not d!117693) (not d!117629) (not b!991062) (not b!991059) (not b!991004) (not b!990952) (not d!117723) (not d!117697) (not b!991149) (not b!991000) (not d!117683) (not d!117665) (not d!117645) (not bm!42038) (not b!991067) (not d!117643) (not b!991091) (not bm!42041) (not b!991080) (not d!117625) (not d!117703) (not d!117607) (not b!991073) (not d!117689) (not b!991056) (not d!117677) (not d!117613) (not d!117729) (not b!991116) (not d!117621) (not b!991015) (not b_lambda!15207) (not d!117635) (not b!990974) (not b!991086) (not d!117637) (not b!991060) (not bm!42044) (not d!117691) (not d!117685) (not b!991071) (not b!990968) b_and!32261 (not b!990975) (not d!117715) (not b_lambda!15203) (not b!991074) (not b!991104) (not b!991077) (not b!991159) (not d!117681) (not d!117649) (not b!991064) (not d!117647) (not b!991009) (not b!991066) (not b!990997) (not b!991044) (not b_lambda!15209) (not b_lambda!15193) (not b!991152) (not b!991069) (not b!991051) (not b!991119) (not d!117615) (not b!991017) (not b!991045) (not b!991006) (not b!991120) (not b!991109) (not d!117619) (not b!991082) (not b!991053) (not b!991106) (not b!991111) (not b!991084) (not b!990955) (not b_lambda!15185) (not d!117609) (not b!991046) (not d!117701) (not b!991101) (not d!117641) (not b!991127) (not b!991072) (not d!117699) (not d!117631) (not b!991146) (not d!117687) (not b!991014) (not b!991078) (not d!117669) (not mapNonEmpty!37029) (not b!990957) (not b_lambda!15205) (not d!117709) (not d!117673) (not b!991090) (not b!991076) (not d!117735) (not b!991048) (not d!117679) (not b!991087) (not d!117675) (not b!991108) (not d!117617) (not b!991050) (not b!991063) (not b!991117) (not d!117667))
(check-sat b_and!32261 (not b_next!20095))
