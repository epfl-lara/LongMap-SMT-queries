; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132596 () Bool)

(assert start!132596)

(declare-fun b_free!31879 () Bool)

(declare-fun b_next!31879 () Bool)

(assert (=> start!132596 (= b_free!31879 (not b_next!31879))))

(declare-fun tp!111892 () Bool)

(declare-fun b_and!51307 () Bool)

(assert (=> start!132596 (= tp!111892 b_and!51307)))

(declare-fun b!1553203 () Bool)

(declare-datatypes ((V!59317 0))(
  ( (V!59318 (val!19155 Int)) )
))
(declare-datatypes ((tuple2!24740 0))(
  ( (tuple2!24741 (_1!12381 (_ BitVec 64)) (_2!12381 V!59317)) )
))
(declare-datatypes ((List!36197 0))(
  ( (Nil!36194) (Cons!36193 (h!37656 tuple2!24740) (t!50897 List!36197)) )
))
(declare-datatypes ((ListLongMap!22357 0))(
  ( (ListLongMap!22358 (toList!11194 List!36197)) )
))
(declare-fun e!864759 () ListLongMap!22357)

(declare-fun call!70991 () ListLongMap!22357)

(assert (=> b!1553203 (= e!864759 call!70991)))

(declare-fun mapIsEmpty!58939 () Bool)

(declare-fun mapRes!58939 () Bool)

(assert (=> mapIsEmpty!58939 mapRes!58939))

(declare-fun call!70990 () ListLongMap!22357)

(declare-fun zeroValue!436 () V!59317)

(declare-fun call!70988 () ListLongMap!22357)

(declare-fun call!70992 () ListLongMap!22357)

(declare-fun bm!70985 () Bool)

(declare-fun minValue!436 () V!59317)

(declare-fun c!143442 () Bool)

(declare-fun call!70989 () ListLongMap!22357)

(declare-fun c!143443 () Bool)

(declare-fun +!5025 (ListLongMap!22357 tuple2!24740) ListLongMap!22357)

(assert (=> bm!70985 (= call!70988 (+!5025 (ite c!143442 call!70992 (ite c!143443 call!70990 call!70989)) (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553204 () Bool)

(declare-fun c!143441 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!669295 () Bool)

(assert (=> b!1553204 (= c!143441 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669295))))

(declare-fun e!864757 () ListLongMap!22357)

(assert (=> b!1553204 (= e!864759 e!864757)))

(declare-fun b!1553205 () Bool)

(declare-fun res!1062995 () Bool)

(declare-fun e!864765 () Bool)

(assert (=> b!1553205 (=> (not res!1062995) (not e!864765))))

(declare-datatypes ((array!103634 0))(
  ( (array!103635 (arr!50011 (Array (_ BitVec 32) (_ BitVec 64))) (size!50562 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103634)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103634 (_ BitVec 32)) Bool)

(assert (=> b!1553205 (= res!1062995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58939 () Bool)

(declare-fun tp!111891 () Bool)

(declare-fun e!864766 () Bool)

(assert (=> mapNonEmpty!58939 (= mapRes!58939 (and tp!111891 e!864766))))

(declare-fun mapKey!58939 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18167 0))(
  ( (ValueCellFull!18167 (v!21949 V!59317)) (EmptyCell!18167) )
))
(declare-fun mapValue!58939 () ValueCell!18167)

(declare-datatypes ((array!103636 0))(
  ( (array!103637 (arr!50012 (Array (_ BitVec 32) ValueCell!18167)) (size!50563 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103636)

(declare-fun mapRest!58939 () (Array (_ BitVec 32) ValueCell!18167))

(assert (=> mapNonEmpty!58939 (= (arr!50012 _values!470) (store mapRest!58939 mapKey!58939 mapValue!58939))))

(declare-fun b!1553206 () Bool)

(declare-fun e!864762 () Bool)

(declare-fun e!864758 () Bool)

(assert (=> b!1553206 (= e!864762 (not e!864758))))

(declare-fun res!1062997 () Bool)

(assert (=> b!1553206 (=> (not res!1062997) (not e!864758))))

(declare-fun lt!669296 () ListLongMap!22357)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun contains!10150 (ListLongMap!22357 (_ BitVec 64)) Bool)

(assert (=> b!1553206 (= res!1062997 (contains!10150 lt!669296 (select (arr!50011 _keys!618) from!762)))))

(assert (=> b!1553206 (contains!10150 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50011 _keys!618) from!762))))

(declare-datatypes ((Unit!51567 0))(
  ( (Unit!51568) )
))
(declare-fun lt!669294 () Unit!51567)

(declare-fun addStillContains!1287 (ListLongMap!22357 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51567)

(assert (=> b!1553206 (= lt!669294 (addStillContains!1287 lt!669296 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50011 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6658 (array!103634 array!103636 (_ BitVec 32) (_ BitVec 32) V!59317 V!59317 (_ BitVec 32) Int) ListLongMap!22357)

(assert (=> b!1553206 (= lt!669296 (getCurrentListMapNoExtraKeys!6658 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553207 () Bool)

(declare-fun res!1062992 () Bool)

(assert (=> b!1553207 (=> (not res!1062992) (not e!864765))))

(declare-datatypes ((List!36198 0))(
  ( (Nil!36195) (Cons!36194 (h!37657 (_ BitVec 64)) (t!50898 List!36198)) )
))
(declare-fun arrayNoDuplicates!0 (array!103634 (_ BitVec 32) List!36198) Bool)

(assert (=> b!1553207 (= res!1062992 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36195))))

(declare-fun b!1553208 () Bool)

(declare-fun tp_is_empty!38155 () Bool)

(assert (=> b!1553208 (= e!864766 tp_is_empty!38155)))

(declare-fun b!1553209 () Bool)

(declare-fun e!864760 () ListLongMap!22357)

(assert (=> b!1553209 (= e!864760 (+!5025 call!70988 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70986 () Bool)

(assert (=> bm!70986 (= call!70991 call!70988)))

(declare-fun b!1553210 () Bool)

(declare-fun res!1062991 () Bool)

(assert (=> b!1553210 (=> (not res!1062991) (not e!864762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1553210 (= res!1062991 (validKeyInArray!0 (select (arr!50011 _keys!618) from!762)))))

(declare-fun res!1062993 () Bool)

(assert (=> start!132596 (=> (not res!1062993) (not e!864765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132596 (= res!1062993 (validMask!0 mask!926))))

(assert (=> start!132596 e!864765))

(declare-fun array_inv!39143 (array!103634) Bool)

(assert (=> start!132596 (array_inv!39143 _keys!618)))

(assert (=> start!132596 tp_is_empty!38155))

(assert (=> start!132596 true))

(assert (=> start!132596 tp!111892))

(declare-fun e!864763 () Bool)

(declare-fun array_inv!39144 (array!103636) Bool)

(assert (=> start!132596 (and (array_inv!39144 _values!470) e!864763)))

(declare-fun b!1553211 () Bool)

(assert (=> b!1553211 (= e!864765 e!864762)))

(declare-fun res!1062996 () Bool)

(assert (=> b!1553211 (=> (not res!1062996) (not e!864762))))

(assert (=> b!1553211 (= res!1062996 (bvslt from!762 (size!50562 _keys!618)))))

(declare-fun lt!669293 () ListLongMap!22357)

(assert (=> b!1553211 (= lt!669293 e!864760)))

(assert (=> b!1553211 (= c!143442 (and (not lt!669295) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1553211 (= lt!669295 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1553212 () Bool)

(assert (=> b!1553212 (= e!864757 call!70991)))

(declare-fun b!1553213 () Bool)

(assert (=> b!1553213 (= e!864760 e!864759)))

(assert (=> b!1553213 (= c!143443 (and (not lt!669295) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1553214 () Bool)

(declare-fun res!1062990 () Bool)

(assert (=> b!1553214 (=> (not res!1062990) (not e!864765))))

(assert (=> b!1553214 (= res!1062990 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50562 _keys!618))))))

(declare-fun bm!70987 () Bool)

(assert (=> bm!70987 (= call!70989 call!70990)))

(declare-fun b!1553215 () Bool)

(declare-fun res!1062994 () Bool)

(assert (=> b!1553215 (=> (not res!1062994) (not e!864765))))

(assert (=> b!1553215 (= res!1062994 (and (= (size!50563 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50562 _keys!618) (size!50563 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1553216 () Bool)

(declare-fun e!864761 () Bool)

(assert (=> b!1553216 (= e!864763 (and e!864761 mapRes!58939))))

(declare-fun condMapEmpty!58939 () Bool)

(declare-fun mapDefault!58939 () ValueCell!18167)

(assert (=> b!1553216 (= condMapEmpty!58939 (= (arr!50012 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18167)) mapDefault!58939)))))

(declare-fun bm!70988 () Bool)

(assert (=> bm!70988 (= call!70992 (getCurrentListMapNoExtraKeys!6658 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553217 () Bool)

(assert (=> b!1553217 (= e!864757 call!70989)))

(declare-fun b!1553218 () Bool)

(assert (=> b!1553218 (= e!864761 tp_is_empty!38155)))

(declare-fun bm!70989 () Bool)

(assert (=> bm!70989 (= call!70990 call!70992)))

(declare-fun b!1553219 () Bool)

(assert (=> b!1553219 (= e!864758 (not (= (select (arr!50011 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!132596 res!1062993) b!1553215))

(assert (= (and b!1553215 res!1062994) b!1553205))

(assert (= (and b!1553205 res!1062995) b!1553207))

(assert (= (and b!1553207 res!1062992) b!1553214))

(assert (= (and b!1553214 res!1062990) b!1553211))

(assert (= (and b!1553211 c!143442) b!1553209))

(assert (= (and b!1553211 (not c!143442)) b!1553213))

(assert (= (and b!1553213 c!143443) b!1553203))

(assert (= (and b!1553213 (not c!143443)) b!1553204))

(assert (= (and b!1553204 c!143441) b!1553212))

(assert (= (and b!1553204 (not c!143441)) b!1553217))

(assert (= (or b!1553212 b!1553217) bm!70987))

(assert (= (or b!1553203 bm!70987) bm!70989))

(assert (= (or b!1553203 b!1553212) bm!70986))

(assert (= (or b!1553209 bm!70989) bm!70988))

(assert (= (or b!1553209 bm!70986) bm!70985))

(assert (= (and b!1553211 res!1062996) b!1553210))

(assert (= (and b!1553210 res!1062991) b!1553206))

(assert (= (and b!1553206 res!1062997) b!1553219))

(assert (= (and b!1553216 condMapEmpty!58939) mapIsEmpty!58939))

(assert (= (and b!1553216 (not condMapEmpty!58939)) mapNonEmpty!58939))

(get-info :version)

(assert (= (and mapNonEmpty!58939 ((_ is ValueCellFull!18167) mapValue!58939)) b!1553208))

(assert (= (and b!1553216 ((_ is ValueCellFull!18167) mapDefault!58939)) b!1553218))

(assert (= start!132596 b!1553216))

(declare-fun m!1431817 () Bool)

(assert (=> mapNonEmpty!58939 m!1431817))

(declare-fun m!1431819 () Bool)

(assert (=> start!132596 m!1431819))

(declare-fun m!1431821 () Bool)

(assert (=> start!132596 m!1431821))

(declare-fun m!1431823 () Bool)

(assert (=> start!132596 m!1431823))

(declare-fun m!1431825 () Bool)

(assert (=> b!1553210 m!1431825))

(assert (=> b!1553210 m!1431825))

(declare-fun m!1431827 () Bool)

(assert (=> b!1553210 m!1431827))

(declare-fun m!1431829 () Bool)

(assert (=> bm!70988 m!1431829))

(declare-fun m!1431831 () Bool)

(assert (=> b!1553207 m!1431831))

(declare-fun m!1431833 () Bool)

(assert (=> b!1553206 m!1431833))

(assert (=> b!1553206 m!1431825))

(declare-fun m!1431835 () Bool)

(assert (=> b!1553206 m!1431835))

(assert (=> b!1553206 m!1431829))

(assert (=> b!1553206 m!1431825))

(assert (=> b!1553206 m!1431833))

(assert (=> b!1553206 m!1431825))

(declare-fun m!1431837 () Bool)

(assert (=> b!1553206 m!1431837))

(assert (=> b!1553206 m!1431825))

(declare-fun m!1431839 () Bool)

(assert (=> b!1553206 m!1431839))

(declare-fun m!1431841 () Bool)

(assert (=> bm!70985 m!1431841))

(declare-fun m!1431843 () Bool)

(assert (=> b!1553205 m!1431843))

(assert (=> b!1553219 m!1431825))

(declare-fun m!1431845 () Bool)

(assert (=> b!1553209 m!1431845))

(check-sat b_and!51307 (not mapNonEmpty!58939) (not b!1553206) (not bm!70985) (not b!1553205) (not b!1553209) tp_is_empty!38155 (not b!1553207) (not b!1553210) (not start!132596) (not bm!70988) (not b_next!31879))
(check-sat b_and!51307 (not b_next!31879))
(get-model)

(declare-fun d!161629 () Bool)

(declare-fun e!864831 () Bool)

(assert (=> d!161629 e!864831))

(declare-fun res!1063048 () Bool)

(assert (=> d!161629 (=> res!1063048 e!864831)))

(declare-fun lt!669332 () Bool)

(assert (=> d!161629 (= res!1063048 (not lt!669332))))

(declare-fun lt!669329 () Bool)

(assert (=> d!161629 (= lt!669332 lt!669329)))

(declare-fun lt!669331 () Unit!51567)

(declare-fun e!864832 () Unit!51567)

(assert (=> d!161629 (= lt!669331 e!864832)))

(declare-fun c!143464 () Bool)

(assert (=> d!161629 (= c!143464 lt!669329)))

(declare-fun containsKey!751 (List!36197 (_ BitVec 64)) Bool)

(assert (=> d!161629 (= lt!669329 (containsKey!751 (toList!11194 lt!669296) (select (arr!50011 _keys!618) from!762)))))

(assert (=> d!161629 (= (contains!10150 lt!669296 (select (arr!50011 _keys!618) from!762)) lt!669332)))

(declare-fun b!1553328 () Bool)

(declare-fun lt!669330 () Unit!51567)

(assert (=> b!1553328 (= e!864832 lt!669330)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!497 (List!36197 (_ BitVec 64)) Unit!51567)

(assert (=> b!1553328 (= lt!669330 (lemmaContainsKeyImpliesGetValueByKeyDefined!497 (toList!11194 lt!669296) (select (arr!50011 _keys!618) from!762)))))

(declare-datatypes ((Option!800 0))(
  ( (Some!799 (v!21952 V!59317)) (None!798) )
))
(declare-fun isDefined!543 (Option!800) Bool)

(declare-fun getValueByKey!725 (List!36197 (_ BitVec 64)) Option!800)

(assert (=> b!1553328 (isDefined!543 (getValueByKey!725 (toList!11194 lt!669296) (select (arr!50011 _keys!618) from!762)))))

(declare-fun b!1553329 () Bool)

(declare-fun Unit!51573 () Unit!51567)

(assert (=> b!1553329 (= e!864832 Unit!51573)))

(declare-fun b!1553330 () Bool)

(assert (=> b!1553330 (= e!864831 (isDefined!543 (getValueByKey!725 (toList!11194 lt!669296) (select (arr!50011 _keys!618) from!762))))))

(assert (= (and d!161629 c!143464) b!1553328))

(assert (= (and d!161629 (not c!143464)) b!1553329))

(assert (= (and d!161629 (not res!1063048)) b!1553330))

(assert (=> d!161629 m!1431825))

(declare-fun m!1431907 () Bool)

(assert (=> d!161629 m!1431907))

(assert (=> b!1553328 m!1431825))

(declare-fun m!1431909 () Bool)

(assert (=> b!1553328 m!1431909))

(assert (=> b!1553328 m!1431825))

(declare-fun m!1431911 () Bool)

(assert (=> b!1553328 m!1431911))

(assert (=> b!1553328 m!1431911))

(declare-fun m!1431913 () Bool)

(assert (=> b!1553328 m!1431913))

(assert (=> b!1553330 m!1431825))

(assert (=> b!1553330 m!1431911))

(assert (=> b!1553330 m!1431911))

(assert (=> b!1553330 m!1431913))

(assert (=> b!1553206 d!161629))

(declare-fun b!1553355 () Bool)

(declare-fun e!864852 () Bool)

(declare-fun e!864850 () Bool)

(assert (=> b!1553355 (= e!864852 e!864850)))

(assert (=> b!1553355 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50562 _keys!618)))))

(declare-fun res!1063057 () Bool)

(declare-fun lt!669351 () ListLongMap!22357)

(assert (=> b!1553355 (= res!1063057 (contains!10150 lt!669351 (select (arr!50011 _keys!618) from!762)))))

(assert (=> b!1553355 (=> (not res!1063057) (not e!864850))))

(declare-fun b!1553356 () Bool)

(assert (=> b!1553356 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50562 _keys!618)))))

(assert (=> b!1553356 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50563 _values!470)))))

(declare-fun apply!1097 (ListLongMap!22357 (_ BitVec 64)) V!59317)

(declare-fun get!26055 (ValueCell!18167 V!59317) V!59317)

(declare-fun dynLambda!3856 (Int (_ BitVec 64)) V!59317)

(assert (=> b!1553356 (= e!864850 (= (apply!1097 lt!669351 (select (arr!50011 _keys!618) from!762)) (get!26055 (select (arr!50012 _values!470) from!762) (dynLambda!3856 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1553357 () Bool)

(declare-fun e!864848 () ListLongMap!22357)

(declare-fun call!71025 () ListLongMap!22357)

(assert (=> b!1553357 (= e!864848 call!71025)))

(declare-fun d!161631 () Bool)

(declare-fun e!864847 () Bool)

(assert (=> d!161631 e!864847))

(declare-fun res!1063058 () Bool)

(assert (=> d!161631 (=> (not res!1063058) (not e!864847))))

(assert (=> d!161631 (= res!1063058 (not (contains!10150 lt!669351 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864851 () ListLongMap!22357)

(assert (=> d!161631 (= lt!669351 e!864851)))

(declare-fun c!143476 () Bool)

(assert (=> d!161631 (= c!143476 (bvsge from!762 (size!50562 _keys!618)))))

(assert (=> d!161631 (validMask!0 mask!926)))

(assert (=> d!161631 (= (getCurrentListMapNoExtraKeys!6658 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!669351)))

(declare-fun b!1553358 () Bool)

(declare-fun e!864849 () Bool)

(assert (=> b!1553358 (= e!864849 (validKeyInArray!0 (select (arr!50011 _keys!618) from!762)))))

(assert (=> b!1553358 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1553359 () Bool)

(declare-fun e!864853 () Bool)

(assert (=> b!1553359 (= e!864852 e!864853)))

(declare-fun c!143473 () Bool)

(assert (=> b!1553359 (= c!143473 (bvslt from!762 (size!50562 _keys!618)))))

(declare-fun b!1553360 () Bool)

(assert (=> b!1553360 (= e!864853 (= lt!669351 (getCurrentListMapNoExtraKeys!6658 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun bm!71022 () Bool)

(assert (=> bm!71022 (= call!71025 (getCurrentListMapNoExtraKeys!6658 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1553361 () Bool)

(declare-fun lt!669349 () Unit!51567)

(declare-fun lt!669352 () Unit!51567)

(assert (=> b!1553361 (= lt!669349 lt!669352)))

(declare-fun lt!669348 () ListLongMap!22357)

(declare-fun lt!669353 () (_ BitVec 64))

(declare-fun lt!669347 () V!59317)

(declare-fun lt!669350 () (_ BitVec 64))

(assert (=> b!1553361 (not (contains!10150 (+!5025 lt!669348 (tuple2!24741 lt!669350 lt!669347)) lt!669353))))

(declare-fun addStillNotContains!511 (ListLongMap!22357 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51567)

(assert (=> b!1553361 (= lt!669352 (addStillNotContains!511 lt!669348 lt!669350 lt!669347 lt!669353))))

(assert (=> b!1553361 (= lt!669353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1553361 (= lt!669347 (get!26055 (select (arr!50012 _values!470) from!762) (dynLambda!3856 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1553361 (= lt!669350 (select (arr!50011 _keys!618) from!762))))

(assert (=> b!1553361 (= lt!669348 call!71025)))

(assert (=> b!1553361 (= e!864848 (+!5025 call!71025 (tuple2!24741 (select (arr!50011 _keys!618) from!762) (get!26055 (select (arr!50012 _values!470) from!762) (dynLambda!3856 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1553362 () Bool)

(assert (=> b!1553362 (= e!864847 e!864852)))

(declare-fun c!143474 () Bool)

(assert (=> b!1553362 (= c!143474 e!864849)))

(declare-fun res!1063059 () Bool)

(assert (=> b!1553362 (=> (not res!1063059) (not e!864849))))

(assert (=> b!1553362 (= res!1063059 (bvslt from!762 (size!50562 _keys!618)))))

(declare-fun b!1553363 () Bool)

(declare-fun res!1063060 () Bool)

(assert (=> b!1553363 (=> (not res!1063060) (not e!864847))))

(assert (=> b!1553363 (= res!1063060 (not (contains!10150 lt!669351 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553364 () Bool)

(assert (=> b!1553364 (= e!864851 (ListLongMap!22358 Nil!36194))))

(declare-fun b!1553365 () Bool)

(declare-fun isEmpty!1132 (ListLongMap!22357) Bool)

(assert (=> b!1553365 (= e!864853 (isEmpty!1132 lt!669351))))

(declare-fun b!1553366 () Bool)

(assert (=> b!1553366 (= e!864851 e!864848)))

(declare-fun c!143475 () Bool)

(assert (=> b!1553366 (= c!143475 (validKeyInArray!0 (select (arr!50011 _keys!618) from!762)))))

(assert (= (and d!161631 c!143476) b!1553364))

(assert (= (and d!161631 (not c!143476)) b!1553366))

(assert (= (and b!1553366 c!143475) b!1553361))

(assert (= (and b!1553366 (not c!143475)) b!1553357))

(assert (= (or b!1553361 b!1553357) bm!71022))

(assert (= (and d!161631 res!1063058) b!1553363))

(assert (= (and b!1553363 res!1063060) b!1553362))

(assert (= (and b!1553362 res!1063059) b!1553358))

(assert (= (and b!1553362 c!143474) b!1553355))

(assert (= (and b!1553362 (not c!143474)) b!1553359))

(assert (= (and b!1553355 res!1063057) b!1553356))

(assert (= (and b!1553359 c!143473) b!1553360))

(assert (= (and b!1553359 (not c!143473)) b!1553365))

(declare-fun b_lambda!24757 () Bool)

(assert (=> (not b_lambda!24757) (not b!1553356)))

(declare-fun t!50903 () Bool)

(declare-fun tb!12469 () Bool)

(assert (=> (and start!132596 (= defaultEntry!478 defaultEntry!478) t!50903) tb!12469))

(declare-fun result!26059 () Bool)

(assert (=> tb!12469 (= result!26059 tp_is_empty!38155)))

(assert (=> b!1553356 t!50903))

(declare-fun b_and!51313 () Bool)

(assert (= b_and!51307 (and (=> t!50903 result!26059) b_and!51313)))

(declare-fun b_lambda!24759 () Bool)

(assert (=> (not b_lambda!24759) (not b!1553361)))

(assert (=> b!1553361 t!50903))

(declare-fun b_and!51315 () Bool)

(assert (= b_and!51313 (and (=> t!50903 result!26059) b_and!51315)))

(declare-fun m!1431915 () Bool)

(assert (=> b!1553356 m!1431915))

(declare-fun m!1431917 () Bool)

(assert (=> b!1553356 m!1431917))

(declare-fun m!1431919 () Bool)

(assert (=> b!1553356 m!1431919))

(assert (=> b!1553356 m!1431825))

(assert (=> b!1553356 m!1431915))

(assert (=> b!1553356 m!1431917))

(assert (=> b!1553356 m!1431825))

(declare-fun m!1431921 () Bool)

(assert (=> b!1553356 m!1431921))

(declare-fun m!1431923 () Bool)

(assert (=> b!1553360 m!1431923))

(assert (=> b!1553358 m!1431825))

(assert (=> b!1553358 m!1431825))

(assert (=> b!1553358 m!1431827))

(declare-fun m!1431925 () Bool)

(assert (=> b!1553365 m!1431925))

(declare-fun m!1431927 () Bool)

(assert (=> b!1553363 m!1431927))

(declare-fun m!1431929 () Bool)

(assert (=> d!161631 m!1431929))

(assert (=> d!161631 m!1431819))

(declare-fun m!1431931 () Bool)

(assert (=> b!1553361 m!1431931))

(declare-fun m!1431933 () Bool)

(assert (=> b!1553361 m!1431933))

(declare-fun m!1431935 () Bool)

(assert (=> b!1553361 m!1431935))

(assert (=> b!1553361 m!1431825))

(assert (=> b!1553361 m!1431915))

(assert (=> b!1553361 m!1431917))

(assert (=> b!1553361 m!1431933))

(declare-fun m!1431937 () Bool)

(assert (=> b!1553361 m!1431937))

(assert (=> b!1553361 m!1431915))

(assert (=> b!1553361 m!1431917))

(assert (=> b!1553361 m!1431919))

(assert (=> b!1553366 m!1431825))

(assert (=> b!1553366 m!1431825))

(assert (=> b!1553366 m!1431827))

(assert (=> b!1553355 m!1431825))

(assert (=> b!1553355 m!1431825))

(declare-fun m!1431939 () Bool)

(assert (=> b!1553355 m!1431939))

(assert (=> bm!71022 m!1431923))

(assert (=> b!1553206 d!161631))

(declare-fun d!161633 () Bool)

(declare-fun e!864856 () Bool)

(assert (=> d!161633 e!864856))

(declare-fun res!1063065 () Bool)

(assert (=> d!161633 (=> (not res!1063065) (not e!864856))))

(declare-fun lt!669365 () ListLongMap!22357)

(assert (=> d!161633 (= res!1063065 (contains!10150 lt!669365 (_1!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669362 () List!36197)

(assert (=> d!161633 (= lt!669365 (ListLongMap!22358 lt!669362))))

(declare-fun lt!669363 () Unit!51567)

(declare-fun lt!669364 () Unit!51567)

(assert (=> d!161633 (= lt!669363 lt!669364)))

(assert (=> d!161633 (= (getValueByKey!725 lt!669362 (_1!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!799 (_2!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!372 (List!36197 (_ BitVec 64) V!59317) Unit!51567)

(assert (=> d!161633 (= lt!669364 (lemmaContainsTupThenGetReturnValue!372 lt!669362 (_1!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun insertStrictlySorted!501 (List!36197 (_ BitVec 64) V!59317) List!36197)

(assert (=> d!161633 (= lt!669362 (insertStrictlySorted!501 (toList!11194 lt!669296) (_1!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161633 (= (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669365)))

(declare-fun b!1553373 () Bool)

(declare-fun res!1063066 () Bool)

(assert (=> b!1553373 (=> (not res!1063066) (not e!864856))))

(assert (=> b!1553373 (= res!1063066 (= (getValueByKey!725 (toList!11194 lt!669365) (_1!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!799 (_2!12381 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553374 () Bool)

(declare-fun contains!10153 (List!36197 tuple2!24740) Bool)

(assert (=> b!1553374 (= e!864856 (contains!10153 (toList!11194 lt!669365) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161633 res!1063065) b!1553373))

(assert (= (and b!1553373 res!1063066) b!1553374))

(declare-fun m!1431941 () Bool)

(assert (=> d!161633 m!1431941))

(declare-fun m!1431943 () Bool)

(assert (=> d!161633 m!1431943))

(declare-fun m!1431945 () Bool)

(assert (=> d!161633 m!1431945))

(declare-fun m!1431947 () Bool)

(assert (=> d!161633 m!1431947))

(declare-fun m!1431949 () Bool)

(assert (=> b!1553373 m!1431949))

(declare-fun m!1431951 () Bool)

(assert (=> b!1553374 m!1431951))

(assert (=> b!1553206 d!161633))

(declare-fun d!161635 () Bool)

(assert (=> d!161635 (contains!10150 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50011 _keys!618) from!762))))

(declare-fun lt!669368 () Unit!51567)

(declare-fun choose!2025 (ListLongMap!22357 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51567)

(assert (=> d!161635 (= lt!669368 (choose!2025 lt!669296 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50011 _keys!618) from!762)))))

(assert (=> d!161635 (contains!10150 lt!669296 (select (arr!50011 _keys!618) from!762))))

(assert (=> d!161635 (= (addStillContains!1287 lt!669296 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50011 _keys!618) from!762)) lt!669368)))

(declare-fun bs!44584 () Bool)

(assert (= bs!44584 d!161635))

(assert (=> bs!44584 m!1431833))

(assert (=> bs!44584 m!1431833))

(assert (=> bs!44584 m!1431825))

(assert (=> bs!44584 m!1431835))

(assert (=> bs!44584 m!1431825))

(declare-fun m!1431953 () Bool)

(assert (=> bs!44584 m!1431953))

(assert (=> bs!44584 m!1431825))

(assert (=> bs!44584 m!1431837))

(assert (=> b!1553206 d!161635))

(declare-fun d!161637 () Bool)

(declare-fun e!864857 () Bool)

(assert (=> d!161637 e!864857))

(declare-fun res!1063067 () Bool)

(assert (=> d!161637 (=> res!1063067 e!864857)))

(declare-fun lt!669372 () Bool)

(assert (=> d!161637 (= res!1063067 (not lt!669372))))

(declare-fun lt!669369 () Bool)

(assert (=> d!161637 (= lt!669372 lt!669369)))

(declare-fun lt!669371 () Unit!51567)

(declare-fun e!864858 () Unit!51567)

(assert (=> d!161637 (= lt!669371 e!864858)))

(declare-fun c!143477 () Bool)

(assert (=> d!161637 (= c!143477 lt!669369)))

(assert (=> d!161637 (= lt!669369 (containsKey!751 (toList!11194 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50011 _keys!618) from!762)))))

(assert (=> d!161637 (= (contains!10150 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50011 _keys!618) from!762)) lt!669372)))

(declare-fun b!1553376 () Bool)

(declare-fun lt!669370 () Unit!51567)

(assert (=> b!1553376 (= e!864858 lt!669370)))

(assert (=> b!1553376 (= lt!669370 (lemmaContainsKeyImpliesGetValueByKeyDefined!497 (toList!11194 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50011 _keys!618) from!762)))))

(assert (=> b!1553376 (isDefined!543 (getValueByKey!725 (toList!11194 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50011 _keys!618) from!762)))))

(declare-fun b!1553377 () Bool)

(declare-fun Unit!51574 () Unit!51567)

(assert (=> b!1553377 (= e!864858 Unit!51574)))

(declare-fun b!1553378 () Bool)

(assert (=> b!1553378 (= e!864857 (isDefined!543 (getValueByKey!725 (toList!11194 (+!5025 lt!669296 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50011 _keys!618) from!762))))))

(assert (= (and d!161637 c!143477) b!1553376))

(assert (= (and d!161637 (not c!143477)) b!1553377))

(assert (= (and d!161637 (not res!1063067)) b!1553378))

(assert (=> d!161637 m!1431825))

(declare-fun m!1431955 () Bool)

(assert (=> d!161637 m!1431955))

(assert (=> b!1553376 m!1431825))

(declare-fun m!1431957 () Bool)

(assert (=> b!1553376 m!1431957))

(assert (=> b!1553376 m!1431825))

(declare-fun m!1431959 () Bool)

(assert (=> b!1553376 m!1431959))

(assert (=> b!1553376 m!1431959))

(declare-fun m!1431961 () Bool)

(assert (=> b!1553376 m!1431961))

(assert (=> b!1553378 m!1431825))

(assert (=> b!1553378 m!1431959))

(assert (=> b!1553378 m!1431959))

(assert (=> b!1553378 m!1431961))

(assert (=> b!1553206 d!161637))

(declare-fun d!161639 () Bool)

(assert (=> d!161639 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132596 d!161639))

(declare-fun d!161641 () Bool)

(assert (=> d!161641 (= (array_inv!39143 _keys!618) (bvsge (size!50562 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132596 d!161641))

(declare-fun d!161643 () Bool)

(assert (=> d!161643 (= (array_inv!39144 _values!470) (bvsge (size!50563 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132596 d!161643))

(declare-fun d!161645 () Bool)

(assert (=> d!161645 (= (validKeyInArray!0 (select (arr!50011 _keys!618) from!762)) (and (not (= (select (arr!50011 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50011 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1553210 d!161645))

(declare-fun b!1553387 () Bool)

(declare-fun e!864865 () Bool)

(declare-fun call!71028 () Bool)

(assert (=> b!1553387 (= e!864865 call!71028)))

(declare-fun bm!71025 () Bool)

(assert (=> bm!71025 (= call!71028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1553389 () Bool)

(declare-fun e!864866 () Bool)

(assert (=> b!1553389 (= e!864866 call!71028)))

(declare-fun b!1553390 () Bool)

(assert (=> b!1553390 (= e!864866 e!864865)))

(declare-fun lt!669380 () (_ BitVec 64))

(assert (=> b!1553390 (= lt!669380 (select (arr!50011 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!669381 () Unit!51567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103634 (_ BitVec 64) (_ BitVec 32)) Unit!51567)

(assert (=> b!1553390 (= lt!669381 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669380 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1553390 (arrayContainsKey!0 _keys!618 lt!669380 #b00000000000000000000000000000000)))

(declare-fun lt!669379 () Unit!51567)

(assert (=> b!1553390 (= lt!669379 lt!669381)))

(declare-fun res!1063072 () Bool)

(declare-datatypes ((SeekEntryResult!13461 0))(
  ( (MissingZero!13461 (index!56242 (_ BitVec 32))) (Found!13461 (index!56243 (_ BitVec 32))) (Intermediate!13461 (undefined!14273 Bool) (index!56244 (_ BitVec 32)) (x!139098 (_ BitVec 32))) (Undefined!13461) (MissingVacant!13461 (index!56245 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103634 (_ BitVec 32)) SeekEntryResult!13461)

(assert (=> b!1553390 (= res!1063072 (= (seekEntryOrOpen!0 (select (arr!50011 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13461 #b00000000000000000000000000000000)))))

(assert (=> b!1553390 (=> (not res!1063072) (not e!864865))))

(declare-fun b!1553388 () Bool)

(declare-fun e!864867 () Bool)

(assert (=> b!1553388 (= e!864867 e!864866)))

(declare-fun c!143480 () Bool)

(assert (=> b!1553388 (= c!143480 (validKeyInArray!0 (select (arr!50011 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161647 () Bool)

(declare-fun res!1063073 () Bool)

(assert (=> d!161647 (=> res!1063073 e!864867)))

(assert (=> d!161647 (= res!1063073 (bvsge #b00000000000000000000000000000000 (size!50562 _keys!618)))))

(assert (=> d!161647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!864867)))

(assert (= (and d!161647 (not res!1063073)) b!1553388))

(assert (= (and b!1553388 c!143480) b!1553390))

(assert (= (and b!1553388 (not c!143480)) b!1553389))

(assert (= (and b!1553390 res!1063072) b!1553387))

(assert (= (or b!1553387 b!1553389) bm!71025))

(declare-fun m!1431963 () Bool)

(assert (=> bm!71025 m!1431963))

(declare-fun m!1431965 () Bool)

(assert (=> b!1553390 m!1431965))

(declare-fun m!1431967 () Bool)

(assert (=> b!1553390 m!1431967))

(declare-fun m!1431969 () Bool)

(assert (=> b!1553390 m!1431969))

(assert (=> b!1553390 m!1431965))

(declare-fun m!1431971 () Bool)

(assert (=> b!1553390 m!1431971))

(assert (=> b!1553388 m!1431965))

(assert (=> b!1553388 m!1431965))

(declare-fun m!1431973 () Bool)

(assert (=> b!1553388 m!1431973))

(assert (=> b!1553205 d!161647))

(declare-fun d!161649 () Bool)

(declare-fun e!864868 () Bool)

(assert (=> d!161649 e!864868))

(declare-fun res!1063074 () Bool)

(assert (=> d!161649 (=> (not res!1063074) (not e!864868))))

(declare-fun lt!669385 () ListLongMap!22357)

(assert (=> d!161649 (= res!1063074 (contains!10150 lt!669385 (_1!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669382 () List!36197)

(assert (=> d!161649 (= lt!669385 (ListLongMap!22358 lt!669382))))

(declare-fun lt!669383 () Unit!51567)

(declare-fun lt!669384 () Unit!51567)

(assert (=> d!161649 (= lt!669383 lt!669384)))

(assert (=> d!161649 (= (getValueByKey!725 lt!669382 (_1!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!799 (_2!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161649 (= lt!669384 (lemmaContainsTupThenGetReturnValue!372 lt!669382 (_1!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161649 (= lt!669382 (insertStrictlySorted!501 (toList!11194 call!70988) (_1!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161649 (= (+!5025 call!70988 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669385)))

(declare-fun b!1553391 () Bool)

(declare-fun res!1063075 () Bool)

(assert (=> b!1553391 (=> (not res!1063075) (not e!864868))))

(assert (=> b!1553391 (= res!1063075 (= (getValueByKey!725 (toList!11194 lt!669385) (_1!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!799 (_2!12381 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553392 () Bool)

(assert (=> b!1553392 (= e!864868 (contains!10153 (toList!11194 lt!669385) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161649 res!1063074) b!1553391))

(assert (= (and b!1553391 res!1063075) b!1553392))

(declare-fun m!1431975 () Bool)

(assert (=> d!161649 m!1431975))

(declare-fun m!1431977 () Bool)

(assert (=> d!161649 m!1431977))

(declare-fun m!1431979 () Bool)

(assert (=> d!161649 m!1431979))

(declare-fun m!1431981 () Bool)

(assert (=> d!161649 m!1431981))

(declare-fun m!1431983 () Bool)

(assert (=> b!1553391 m!1431983))

(declare-fun m!1431985 () Bool)

(assert (=> b!1553392 m!1431985))

(assert (=> b!1553209 d!161649))

(assert (=> bm!70988 d!161631))

(declare-fun d!161651 () Bool)

(declare-fun e!864869 () Bool)

(assert (=> d!161651 e!864869))

(declare-fun res!1063076 () Bool)

(assert (=> d!161651 (=> (not res!1063076) (not e!864869))))

(declare-fun lt!669389 () ListLongMap!22357)

(assert (=> d!161651 (= res!1063076 (contains!10150 lt!669389 (_1!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669386 () List!36197)

(assert (=> d!161651 (= lt!669389 (ListLongMap!22358 lt!669386))))

(declare-fun lt!669387 () Unit!51567)

(declare-fun lt!669388 () Unit!51567)

(assert (=> d!161651 (= lt!669387 lt!669388)))

(assert (=> d!161651 (= (getValueByKey!725 lt!669386 (_1!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!799 (_2!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161651 (= lt!669388 (lemmaContainsTupThenGetReturnValue!372 lt!669386 (_1!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161651 (= lt!669386 (insertStrictlySorted!501 (toList!11194 (ite c!143442 call!70992 (ite c!143443 call!70990 call!70989))) (_1!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161651 (= (+!5025 (ite c!143442 call!70992 (ite c!143443 call!70990 call!70989)) (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669389)))

(declare-fun b!1553393 () Bool)

(declare-fun res!1063077 () Bool)

(assert (=> b!1553393 (=> (not res!1063077) (not e!864869))))

(assert (=> b!1553393 (= res!1063077 (= (getValueByKey!725 (toList!11194 lt!669389) (_1!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!799 (_2!12381 (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553394 () Bool)

(assert (=> b!1553394 (= e!864869 (contains!10153 (toList!11194 lt!669389) (ite (or c!143442 c!143443) (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161651 res!1063076) b!1553393))

(assert (= (and b!1553393 res!1063077) b!1553394))

(declare-fun m!1431987 () Bool)

(assert (=> d!161651 m!1431987))

(declare-fun m!1431989 () Bool)

(assert (=> d!161651 m!1431989))

(declare-fun m!1431991 () Bool)

(assert (=> d!161651 m!1431991))

(declare-fun m!1431993 () Bool)

(assert (=> d!161651 m!1431993))

(declare-fun m!1431995 () Bool)

(assert (=> b!1553393 m!1431995))

(declare-fun m!1431997 () Bool)

(assert (=> b!1553394 m!1431997))

(assert (=> bm!70985 d!161651))

(declare-fun b!1553405 () Bool)

(declare-fun e!864879 () Bool)

(declare-fun e!864880 () Bool)

(assert (=> b!1553405 (= e!864879 e!864880)))

(declare-fun res!1063086 () Bool)

(assert (=> b!1553405 (=> (not res!1063086) (not e!864880))))

(declare-fun e!864881 () Bool)

(assert (=> b!1553405 (= res!1063086 (not e!864881))))

(declare-fun res!1063085 () Bool)

(assert (=> b!1553405 (=> (not res!1063085) (not e!864881))))

(assert (=> b!1553405 (= res!1063085 (validKeyInArray!0 (select (arr!50011 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553406 () Bool)

(declare-fun e!864878 () Bool)

(declare-fun call!71031 () Bool)

(assert (=> b!1553406 (= e!864878 call!71031)))

(declare-fun d!161653 () Bool)

(declare-fun res!1063084 () Bool)

(assert (=> d!161653 (=> res!1063084 e!864879)))

(assert (=> d!161653 (= res!1063084 (bvsge #b00000000000000000000000000000000 (size!50562 _keys!618)))))

(assert (=> d!161653 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36195) e!864879)))

(declare-fun b!1553407 () Bool)

(assert (=> b!1553407 (= e!864878 call!71031)))

(declare-fun b!1553408 () Bool)

(declare-fun contains!10154 (List!36198 (_ BitVec 64)) Bool)

(assert (=> b!1553408 (= e!864881 (contains!10154 Nil!36195 (select (arr!50011 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!71028 () Bool)

(declare-fun c!143483 () Bool)

(assert (=> bm!71028 (= call!71031 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143483 (Cons!36194 (select (arr!50011 _keys!618) #b00000000000000000000000000000000) Nil!36195) Nil!36195)))))

(declare-fun b!1553409 () Bool)

(assert (=> b!1553409 (= e!864880 e!864878)))

(assert (=> b!1553409 (= c!143483 (validKeyInArray!0 (select (arr!50011 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161653 (not res!1063084)) b!1553405))

(assert (= (and b!1553405 res!1063085) b!1553408))

(assert (= (and b!1553405 res!1063086) b!1553409))

(assert (= (and b!1553409 c!143483) b!1553407))

(assert (= (and b!1553409 (not c!143483)) b!1553406))

(assert (= (or b!1553407 b!1553406) bm!71028))

(assert (=> b!1553405 m!1431965))

(assert (=> b!1553405 m!1431965))

(assert (=> b!1553405 m!1431973))

(assert (=> b!1553408 m!1431965))

(assert (=> b!1553408 m!1431965))

(declare-fun m!1431999 () Bool)

(assert (=> b!1553408 m!1431999))

(assert (=> bm!71028 m!1431965))

(declare-fun m!1432001 () Bool)

(assert (=> bm!71028 m!1432001))

(assert (=> b!1553409 m!1431965))

(assert (=> b!1553409 m!1431965))

(assert (=> b!1553409 m!1431973))

(assert (=> b!1553207 d!161653))

(declare-fun b!1553417 () Bool)

(declare-fun e!864887 () Bool)

(assert (=> b!1553417 (= e!864887 tp_is_empty!38155)))

(declare-fun mapIsEmpty!58948 () Bool)

(declare-fun mapRes!58948 () Bool)

(assert (=> mapIsEmpty!58948 mapRes!58948))

(declare-fun condMapEmpty!58948 () Bool)

(declare-fun mapDefault!58948 () ValueCell!18167)

(assert (=> mapNonEmpty!58939 (= condMapEmpty!58948 (= mapRest!58939 ((as const (Array (_ BitVec 32) ValueCell!18167)) mapDefault!58948)))))

(assert (=> mapNonEmpty!58939 (= tp!111891 (and e!864887 mapRes!58948))))

(declare-fun b!1553416 () Bool)

(declare-fun e!864886 () Bool)

(assert (=> b!1553416 (= e!864886 tp_is_empty!38155)))

(declare-fun mapNonEmpty!58948 () Bool)

(declare-fun tp!111907 () Bool)

(assert (=> mapNonEmpty!58948 (= mapRes!58948 (and tp!111907 e!864886))))

(declare-fun mapValue!58948 () ValueCell!18167)

(declare-fun mapRest!58948 () (Array (_ BitVec 32) ValueCell!18167))

(declare-fun mapKey!58948 () (_ BitVec 32))

(assert (=> mapNonEmpty!58948 (= mapRest!58939 (store mapRest!58948 mapKey!58948 mapValue!58948))))

(assert (= (and mapNonEmpty!58939 condMapEmpty!58948) mapIsEmpty!58948))

(assert (= (and mapNonEmpty!58939 (not condMapEmpty!58948)) mapNonEmpty!58948))

(assert (= (and mapNonEmpty!58948 ((_ is ValueCellFull!18167) mapValue!58948)) b!1553416))

(assert (= (and mapNonEmpty!58939 ((_ is ValueCellFull!18167) mapDefault!58948)) b!1553417))

(declare-fun m!1432003 () Bool)

(assert (=> mapNonEmpty!58948 m!1432003))

(declare-fun b_lambda!24761 () Bool)

(assert (= b_lambda!24757 (or (and start!132596 b_free!31879) b_lambda!24761)))

(declare-fun b_lambda!24763 () Bool)

(assert (= b_lambda!24759 (or (and start!132596 b_free!31879) b_lambda!24763)))

(check-sat (not bm!71028) (not bm!71022) (not b!1553330) (not b!1553394) (not d!161629) (not b!1553363) (not b_lambda!24763) (not b!1553373) (not b!1553388) (not b!1553408) (not b!1553405) (not d!161637) (not b!1553393) (not b!1553360) (not b_lambda!24761) (not b!1553392) (not b_next!31879) (not b!1553391) (not b!1553366) (not b!1553378) (not mapNonEmpty!58948) (not b!1553361) (not b!1553356) tp_is_empty!38155 (not bm!71025) (not b!1553365) (not d!161651) (not b!1553409) (not b!1553390) (not b!1553358) b_and!51315 (not d!161649) (not d!161633) (not b!1553328) (not d!161631) (not b!1553376) (not b!1553374) (not b!1553355) (not d!161635))
(check-sat b_and!51315 (not b_next!31879))
