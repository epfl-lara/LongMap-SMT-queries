; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132166 () Bool)

(assert start!132166)

(declare-fun b_free!31891 () Bool)

(declare-fun b_next!31891 () Bool)

(assert (=> start!132166 (= b_free!31891 (not b_next!31891))))

(declare-fun tp!111932 () Bool)

(declare-fun b_and!51303 () Bool)

(assert (=> start!132166 (= tp!111932 b_and!51303)))

(declare-datatypes ((array!103456 0))(
  ( (array!103457 (arr!49929 (Array (_ BitVec 32) (_ BitVec 64))) (size!50481 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103456)

(declare-datatypes ((V!59333 0))(
  ( (V!59334 (val!19161 Int)) )
))
(declare-fun zeroValue!436 () V!59333)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18173 0))(
  ( (ValueCellFull!18173 (v!21960 V!59333)) (EmptyCell!18173) )
))
(declare-datatypes ((array!103458 0))(
  ( (array!103459 (arr!49930 (Array (_ BitVec 32) ValueCell!18173)) (size!50482 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103458)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((tuple2!24772 0))(
  ( (tuple2!24773 (_1!12397 (_ BitVec 64)) (_2!12397 V!59333)) )
))
(declare-datatypes ((List!36223 0))(
  ( (Nil!36220) (Cons!36219 (h!37665 tuple2!24772) (t!50925 List!36223)) )
))
(declare-datatypes ((ListLongMap!22381 0))(
  ( (ListLongMap!22382 (toList!11206 List!36223)) )
))
(declare-fun call!70904 () ListLongMap!22381)

(declare-fun minValue!436 () V!59333)

(declare-fun bm!70899 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6646 (array!103456 array!103458 (_ BitVec 32) (_ BitVec 32) V!59333 V!59333 (_ BitVec 32) Int) ListLongMap!22381)

(assert (=> bm!70899 (= call!70904 (getCurrentListMapNoExtraKeys!6646 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550847 () Bool)

(declare-fun res!1062178 () Bool)

(declare-fun e!863285 () Bool)

(assert (=> b!1550847 (=> (not res!1062178) (not e!863285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550847 (= res!1062178 (validKeyInArray!0 (select (arr!49929 _keys!618) from!762)))))

(declare-fun b!1550848 () Bool)

(declare-fun e!863286 () Bool)

(assert (=> b!1550848 (= e!863286 e!863285)))

(declare-fun res!1062180 () Bool)

(assert (=> b!1550848 (=> (not res!1062180) (not e!863285))))

(assert (=> b!1550848 (= res!1062180 (bvslt from!762 (size!50481 _keys!618)))))

(declare-fun lt!668253 () ListLongMap!22381)

(declare-fun e!863282 () ListLongMap!22381)

(assert (=> b!1550848 (= lt!668253 e!863282)))

(declare-fun c!142630 () Bool)

(declare-fun lt!668255 () Bool)

(assert (=> b!1550848 (= c!142630 (and (not lt!668255) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550848 (= lt!668255 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550849 () Bool)

(declare-fun e!863288 () Bool)

(declare-fun tp_is_empty!38167 () Bool)

(assert (=> b!1550849 (= e!863288 tp_is_empty!38167)))

(declare-fun b!1550850 () Bool)

(declare-fun res!1062182 () Bool)

(assert (=> b!1550850 (=> (not res!1062182) (not e!863286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103456 (_ BitVec 32)) Bool)

(assert (=> b!1550850 (= res!1062182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550851 () Bool)

(declare-fun e!863291 () ListLongMap!22381)

(declare-fun call!70906 () ListLongMap!22381)

(assert (=> b!1550851 (= e!863291 call!70906)))

(declare-fun b!1550852 () Bool)

(declare-fun res!1062179 () Bool)

(assert (=> b!1550852 (=> (not res!1062179) (not e!863286))))

(declare-datatypes ((List!36224 0))(
  ( (Nil!36221) (Cons!36220 (h!37666 (_ BitVec 64)) (t!50926 List!36224)) )
))
(declare-fun arrayNoDuplicates!0 (array!103456 (_ BitVec 32) List!36224) Bool)

(assert (=> b!1550852 (= res!1062179 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36221))))

(declare-fun b!1550853 () Bool)

(declare-fun e!863287 () Bool)

(assert (=> b!1550853 (= e!863285 (not e!863287))))

(declare-fun res!1062181 () Bool)

(assert (=> b!1550853 (=> (not res!1062181) (not e!863287))))

(declare-fun lt!668251 () ListLongMap!22381)

(declare-fun contains!10070 (ListLongMap!22381 (_ BitVec 64)) Bool)

(assert (=> b!1550853 (= res!1062181 (contains!10070 lt!668251 (select (arr!49929 _keys!618) from!762)))))

(declare-fun apply!1084 (ListLongMap!22381 (_ BitVec 64)) V!59333)

(declare-fun +!5022 (ListLongMap!22381 tuple2!24772) ListLongMap!22381)

(assert (=> b!1550853 (= (apply!1084 (+!5022 lt!668251 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49929 _keys!618) from!762)) (apply!1084 lt!668251 (select (arr!49929 _keys!618) from!762)))))

(declare-datatypes ((Unit!51482 0))(
  ( (Unit!51483) )
))
(declare-fun lt!668254 () Unit!51482)

(declare-fun addApplyDifferent!620 (ListLongMap!22381 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51482)

(assert (=> b!1550853 (= lt!668254 (addApplyDifferent!620 lt!668251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49929 _keys!618) from!762)))))

(assert (=> b!1550853 (contains!10070 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49929 _keys!618) from!762))))

(declare-fun lt!668252 () Unit!51482)

(declare-fun addStillContains!1285 (ListLongMap!22381 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51482)

(assert (=> b!1550853 (= lt!668252 (addStillContains!1285 lt!668251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49929 _keys!618) from!762)))))

(assert (=> b!1550853 (= lt!668251 (getCurrentListMapNoExtraKeys!6646 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun call!70902 () ListLongMap!22381)

(declare-fun call!70905 () ListLongMap!22381)

(declare-fun call!70903 () ListLongMap!22381)

(declare-fun c!142629 () Bool)

(declare-fun bm!70900 () Bool)

(assert (=> bm!70900 (= call!70905 (+!5022 (ite c!142630 call!70904 (ite c!142629 call!70903 call!70902)) (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70901 () Bool)

(assert (=> bm!70901 (= call!70906 call!70905)))

(declare-fun b!1550854 () Bool)

(declare-fun res!1062183 () Bool)

(assert (=> b!1550854 (=> (not res!1062183) (not e!863286))))

(assert (=> b!1550854 (= res!1062183 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50481 _keys!618))))))

(declare-fun b!1550855 () Bool)

(assert (=> b!1550855 (= e!863287 (not (= (select (arr!49929 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1550856 () Bool)

(declare-fun e!863283 () ListLongMap!22381)

(assert (=> b!1550856 (= e!863283 call!70902)))

(declare-fun bm!70902 () Bool)

(assert (=> bm!70902 (= call!70902 call!70903)))

(declare-fun b!1550857 () Bool)

(assert (=> b!1550857 (= e!863282 (+!5022 call!70905 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550858 () Bool)

(assert (=> b!1550858 (= e!863283 call!70906)))

(declare-fun bm!70903 () Bool)

(assert (=> bm!70903 (= call!70903 call!70904)))

(declare-fun mapIsEmpty!58960 () Bool)

(declare-fun mapRes!58960 () Bool)

(assert (=> mapIsEmpty!58960 mapRes!58960))

(declare-fun b!1550859 () Bool)

(assert (=> b!1550859 (= e!863282 e!863291)))

(assert (=> b!1550859 (= c!142629 (and (not lt!668255) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1062184 () Bool)

(assert (=> start!132166 (=> (not res!1062184) (not e!863286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132166 (= res!1062184 (validMask!0 mask!926))))

(assert (=> start!132166 e!863286))

(declare-fun array_inv!39017 (array!103456) Bool)

(assert (=> start!132166 (array_inv!39017 _keys!618)))

(assert (=> start!132166 tp_is_empty!38167))

(assert (=> start!132166 true))

(assert (=> start!132166 tp!111932))

(declare-fun e!863289 () Bool)

(declare-fun array_inv!39018 (array!103458) Bool)

(assert (=> start!132166 (and (array_inv!39018 _values!470) e!863289)))

(declare-fun b!1550860 () Bool)

(declare-fun e!863284 () Bool)

(assert (=> b!1550860 (= e!863289 (and e!863284 mapRes!58960))))

(declare-fun condMapEmpty!58960 () Bool)

(declare-fun mapDefault!58960 () ValueCell!18173)

(assert (=> b!1550860 (= condMapEmpty!58960 (= (arr!49930 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18173)) mapDefault!58960)))))

(declare-fun b!1550861 () Bool)

(declare-fun c!142628 () Bool)

(assert (=> b!1550861 (= c!142628 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668255))))

(assert (=> b!1550861 (= e!863291 e!863283)))

(declare-fun b!1550862 () Bool)

(declare-fun res!1062177 () Bool)

(assert (=> b!1550862 (=> (not res!1062177) (not e!863286))))

(assert (=> b!1550862 (= res!1062177 (and (= (size!50482 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50481 _keys!618) (size!50482 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550863 () Bool)

(assert (=> b!1550863 (= e!863284 tp_is_empty!38167)))

(declare-fun mapNonEmpty!58960 () Bool)

(declare-fun tp!111931 () Bool)

(assert (=> mapNonEmpty!58960 (= mapRes!58960 (and tp!111931 e!863288))))

(declare-fun mapKey!58960 () (_ BitVec 32))

(declare-fun mapValue!58960 () ValueCell!18173)

(declare-fun mapRest!58960 () (Array (_ BitVec 32) ValueCell!18173))

(assert (=> mapNonEmpty!58960 (= (arr!49930 _values!470) (store mapRest!58960 mapKey!58960 mapValue!58960))))

(assert (= (and start!132166 res!1062184) b!1550862))

(assert (= (and b!1550862 res!1062177) b!1550850))

(assert (= (and b!1550850 res!1062182) b!1550852))

(assert (= (and b!1550852 res!1062179) b!1550854))

(assert (= (and b!1550854 res!1062183) b!1550848))

(assert (= (and b!1550848 c!142630) b!1550857))

(assert (= (and b!1550848 (not c!142630)) b!1550859))

(assert (= (and b!1550859 c!142629) b!1550851))

(assert (= (and b!1550859 (not c!142629)) b!1550861))

(assert (= (and b!1550861 c!142628) b!1550858))

(assert (= (and b!1550861 (not c!142628)) b!1550856))

(assert (= (or b!1550858 b!1550856) bm!70902))

(assert (= (or b!1550851 bm!70902) bm!70903))

(assert (= (or b!1550851 b!1550858) bm!70901))

(assert (= (or b!1550857 bm!70903) bm!70899))

(assert (= (or b!1550857 bm!70901) bm!70900))

(assert (= (and b!1550848 res!1062180) b!1550847))

(assert (= (and b!1550847 res!1062178) b!1550853))

(assert (= (and b!1550853 res!1062181) b!1550855))

(assert (= (and b!1550860 condMapEmpty!58960) mapIsEmpty!58960))

(assert (= (and b!1550860 (not condMapEmpty!58960)) mapNonEmpty!58960))

(get-info :version)

(assert (= (and mapNonEmpty!58960 ((_ is ValueCellFull!18173) mapValue!58960)) b!1550849))

(assert (= (and b!1550860 ((_ is ValueCellFull!18173) mapDefault!58960)) b!1550863))

(assert (= start!132166 b!1550860))

(declare-fun m!1428963 () Bool)

(assert (=> b!1550853 m!1428963))

(assert (=> b!1550853 m!1428963))

(declare-fun m!1428965 () Bool)

(assert (=> b!1550853 m!1428965))

(declare-fun m!1428967 () Bool)

(assert (=> b!1550853 m!1428967))

(assert (=> b!1550853 m!1428963))

(declare-fun m!1428969 () Bool)

(assert (=> b!1550853 m!1428969))

(declare-fun m!1428971 () Bool)

(assert (=> b!1550853 m!1428971))

(declare-fun m!1428973 () Bool)

(assert (=> b!1550853 m!1428973))

(assert (=> b!1550853 m!1428963))

(declare-fun m!1428975 () Bool)

(assert (=> b!1550853 m!1428975))

(assert (=> b!1550853 m!1428963))

(declare-fun m!1428977 () Bool)

(assert (=> b!1550853 m!1428977))

(assert (=> b!1550853 m!1428971))

(assert (=> b!1550853 m!1428963))

(declare-fun m!1428979 () Bool)

(assert (=> b!1550853 m!1428979))

(assert (=> b!1550853 m!1428967))

(assert (=> b!1550853 m!1428963))

(declare-fun m!1428981 () Bool)

(assert (=> b!1550853 m!1428981))

(declare-fun m!1428983 () Bool)

(assert (=> start!132166 m!1428983))

(declare-fun m!1428985 () Bool)

(assert (=> start!132166 m!1428985))

(declare-fun m!1428987 () Bool)

(assert (=> start!132166 m!1428987))

(assert (=> b!1550847 m!1428963))

(assert (=> b!1550847 m!1428963))

(declare-fun m!1428989 () Bool)

(assert (=> b!1550847 m!1428989))

(declare-fun m!1428991 () Bool)

(assert (=> b!1550857 m!1428991))

(declare-fun m!1428993 () Bool)

(assert (=> b!1550850 m!1428993))

(declare-fun m!1428995 () Bool)

(assert (=> bm!70900 m!1428995))

(assert (=> b!1550855 m!1428963))

(declare-fun m!1428997 () Bool)

(assert (=> b!1550852 m!1428997))

(assert (=> bm!70899 m!1428973))

(declare-fun m!1428999 () Bool)

(assert (=> mapNonEmpty!58960 m!1428999))

(check-sat b_and!51303 (not b!1550853) tp_is_empty!38167 (not bm!70900) (not b_next!31891) (not bm!70899) (not start!132166) (not mapNonEmpty!58960) (not b!1550857) (not b!1550847) (not b!1550852) (not b!1550850))
(check-sat b_and!51303 (not b_next!31891))
(get-model)

(declare-fun b!1550990 () Bool)

(declare-fun e!863368 () Bool)

(declare-fun e!863367 () Bool)

(assert (=> b!1550990 (= e!863368 e!863367)))

(declare-fun c!142660 () Bool)

(assert (=> b!1550990 (= c!142660 (bvslt from!762 (size!50481 _keys!618)))))

(declare-fun bm!70936 () Bool)

(declare-fun call!70939 () ListLongMap!22381)

(assert (=> bm!70936 (= call!70939 (getCurrentListMapNoExtraKeys!6646 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1550991 () Bool)

(declare-fun e!863369 () Bool)

(assert (=> b!1550991 (= e!863369 e!863368)))

(declare-fun c!142658 () Bool)

(declare-fun e!863370 () Bool)

(assert (=> b!1550991 (= c!142658 e!863370)))

(declare-fun res!1062243 () Bool)

(assert (=> b!1550991 (=> (not res!1062243) (not e!863370))))

(assert (=> b!1550991 (= res!1062243 (bvslt from!762 (size!50481 _keys!618)))))

(declare-fun b!1550992 () Bool)

(assert (=> b!1550992 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50481 _keys!618)))))

(assert (=> b!1550992 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50482 _values!470)))))

(declare-fun lt!668304 () ListLongMap!22381)

(declare-fun e!863366 () Bool)

(declare-fun get!26017 (ValueCell!18173 V!59333) V!59333)

(declare-fun dynLambda!3826 (Int (_ BitVec 64)) V!59333)

(assert (=> b!1550992 (= e!863366 (= (apply!1084 lt!668304 (select (arr!49929 _keys!618) from!762)) (get!26017 (select (arr!49930 _values!470) from!762) (dynLambda!3826 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1550993 () Bool)

(declare-fun e!863372 () ListLongMap!22381)

(assert (=> b!1550993 (= e!863372 call!70939)))

(declare-fun b!1550994 () Bool)

(declare-fun isEmpty!1135 (ListLongMap!22381) Bool)

(assert (=> b!1550994 (= e!863367 (isEmpty!1135 lt!668304))))

(declare-fun b!1550995 () Bool)

(declare-fun lt!668303 () Unit!51482)

(declare-fun lt!668306 () Unit!51482)

(assert (=> b!1550995 (= lt!668303 lt!668306)))

(declare-fun lt!668305 () (_ BitVec 64))

(declare-fun lt!668300 () (_ BitVec 64))

(declare-fun lt!668302 () ListLongMap!22381)

(declare-fun lt!668301 () V!59333)

(assert (=> b!1550995 (not (contains!10070 (+!5022 lt!668302 (tuple2!24773 lt!668300 lt!668301)) lt!668305))))

(declare-fun addStillNotContains!499 (ListLongMap!22381 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51482)

(assert (=> b!1550995 (= lt!668306 (addStillNotContains!499 lt!668302 lt!668300 lt!668301 lt!668305))))

(assert (=> b!1550995 (= lt!668305 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1550995 (= lt!668301 (get!26017 (select (arr!49930 _values!470) from!762) (dynLambda!3826 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1550995 (= lt!668300 (select (arr!49929 _keys!618) from!762))))

(assert (=> b!1550995 (= lt!668302 call!70939)))

(assert (=> b!1550995 (= e!863372 (+!5022 call!70939 (tuple2!24773 (select (arr!49929 _keys!618) from!762) (get!26017 (select (arr!49930 _values!470) from!762) (dynLambda!3826 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!160705 () Bool)

(assert (=> d!160705 e!863369))

(declare-fun res!1062244 () Bool)

(assert (=> d!160705 (=> (not res!1062244) (not e!863369))))

(assert (=> d!160705 (= res!1062244 (not (contains!10070 lt!668304 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!863371 () ListLongMap!22381)

(assert (=> d!160705 (= lt!668304 e!863371)))

(declare-fun c!142657 () Bool)

(assert (=> d!160705 (= c!142657 (bvsge from!762 (size!50481 _keys!618)))))

(assert (=> d!160705 (validMask!0 mask!926)))

(assert (=> d!160705 (= (getCurrentListMapNoExtraKeys!6646 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668304)))

(declare-fun b!1550996 () Bool)

(assert (=> b!1550996 (= e!863368 e!863366)))

(assert (=> b!1550996 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50481 _keys!618)))))

(declare-fun res!1062242 () Bool)

(assert (=> b!1550996 (= res!1062242 (contains!10070 lt!668304 (select (arr!49929 _keys!618) from!762)))))

(assert (=> b!1550996 (=> (not res!1062242) (not e!863366))))

(declare-fun b!1550997 () Bool)

(assert (=> b!1550997 (= e!863367 (= lt!668304 (getCurrentListMapNoExtraKeys!6646 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1550998 () Bool)

(assert (=> b!1550998 (= e!863371 e!863372)))

(declare-fun c!142659 () Bool)

(assert (=> b!1550998 (= c!142659 (validKeyInArray!0 (select (arr!49929 _keys!618) from!762)))))

(declare-fun b!1550999 () Bool)

(assert (=> b!1550999 (= e!863371 (ListLongMap!22382 Nil!36220))))

(declare-fun b!1551000 () Bool)

(declare-fun res!1062241 () Bool)

(assert (=> b!1551000 (=> (not res!1062241) (not e!863369))))

(assert (=> b!1551000 (= res!1062241 (not (contains!10070 lt!668304 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1551001 () Bool)

(assert (=> b!1551001 (= e!863370 (validKeyInArray!0 (select (arr!49929 _keys!618) from!762)))))

(assert (=> b!1551001 (bvsge from!762 #b00000000000000000000000000000000)))

(assert (= (and d!160705 c!142657) b!1550999))

(assert (= (and d!160705 (not c!142657)) b!1550998))

(assert (= (and b!1550998 c!142659) b!1550995))

(assert (= (and b!1550998 (not c!142659)) b!1550993))

(assert (= (or b!1550995 b!1550993) bm!70936))

(assert (= (and d!160705 res!1062244) b!1551000))

(assert (= (and b!1551000 res!1062241) b!1550991))

(assert (= (and b!1550991 res!1062243) b!1551001))

(assert (= (and b!1550991 c!142658) b!1550996))

(assert (= (and b!1550991 (not c!142658)) b!1550990))

(assert (= (and b!1550996 res!1062242) b!1550992))

(assert (= (and b!1550990 c!142660) b!1550997))

(assert (= (and b!1550990 (not c!142660)) b!1550994))

(declare-fun b_lambda!24761 () Bool)

(assert (=> (not b_lambda!24761) (not b!1550992)))

(declare-fun t!50931 () Bool)

(declare-fun tb!12471 () Bool)

(assert (=> (and start!132166 (= defaultEntry!478 defaultEntry!478) t!50931) tb!12471))

(declare-fun result!26065 () Bool)

(assert (=> tb!12471 (= result!26065 tp_is_empty!38167)))

(assert (=> b!1550992 t!50931))

(declare-fun b_and!51309 () Bool)

(assert (= b_and!51303 (and (=> t!50931 result!26065) b_and!51309)))

(declare-fun b_lambda!24763 () Bool)

(assert (=> (not b_lambda!24763) (not b!1550995)))

(assert (=> b!1550995 t!50931))

(declare-fun b_and!51311 () Bool)

(assert (= b_and!51309 (and (=> t!50931 result!26065) b_and!51311)))

(declare-fun m!1429077 () Bool)

(assert (=> b!1550997 m!1429077))

(declare-fun m!1429079 () Bool)

(assert (=> d!160705 m!1429079))

(assert (=> d!160705 m!1428983))

(declare-fun m!1429081 () Bool)

(assert (=> b!1550995 m!1429081))

(declare-fun m!1429083 () Bool)

(assert (=> b!1550995 m!1429083))

(declare-fun m!1429085 () Bool)

(assert (=> b!1550995 m!1429085))

(declare-fun m!1429087 () Bool)

(assert (=> b!1550995 m!1429087))

(declare-fun m!1429089 () Bool)

(assert (=> b!1550995 m!1429089))

(assert (=> b!1550995 m!1428963))

(assert (=> b!1550995 m!1429083))

(assert (=> b!1550995 m!1429087))

(declare-fun m!1429091 () Bool)

(assert (=> b!1550995 m!1429091))

(assert (=> b!1550995 m!1429081))

(declare-fun m!1429093 () Bool)

(assert (=> b!1550995 m!1429093))

(assert (=> b!1550998 m!1428963))

(assert (=> b!1550998 m!1428963))

(assert (=> b!1550998 m!1428989))

(assert (=> bm!70936 m!1429077))

(assert (=> b!1550992 m!1429081))

(assert (=> b!1550992 m!1429083))

(assert (=> b!1550992 m!1429085))

(assert (=> b!1550992 m!1428963))

(declare-fun m!1429095 () Bool)

(assert (=> b!1550992 m!1429095))

(assert (=> b!1550992 m!1428963))

(assert (=> b!1550992 m!1429083))

(assert (=> b!1550992 m!1429081))

(declare-fun m!1429097 () Bool)

(assert (=> b!1550994 m!1429097))

(declare-fun m!1429099 () Bool)

(assert (=> b!1551000 m!1429099))

(assert (=> b!1550996 m!1428963))

(assert (=> b!1550996 m!1428963))

(declare-fun m!1429101 () Bool)

(assert (=> b!1550996 m!1429101))

(assert (=> b!1551001 m!1428963))

(assert (=> b!1551001 m!1428963))

(assert (=> b!1551001 m!1428989))

(assert (=> bm!70899 d!160705))

(declare-fun d!160707 () Bool)

(declare-fun res!1062251 () Bool)

(declare-fun e!863381 () Bool)

(assert (=> d!160707 (=> res!1062251 e!863381)))

(assert (=> d!160707 (= res!1062251 (bvsge #b00000000000000000000000000000000 (size!50481 _keys!618)))))

(assert (=> d!160707 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36221) e!863381)))

(declare-fun b!1551014 () Bool)

(declare-fun e!863382 () Bool)

(declare-fun e!863383 () Bool)

(assert (=> b!1551014 (= e!863382 e!863383)))

(declare-fun c!142663 () Bool)

(assert (=> b!1551014 (= c!142663 (validKeyInArray!0 (select (arr!49929 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551015 () Bool)

(declare-fun call!70942 () Bool)

(assert (=> b!1551015 (= e!863383 call!70942)))

(declare-fun bm!70939 () Bool)

(assert (=> bm!70939 (= call!70942 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142663 (Cons!36220 (select (arr!49929 _keys!618) #b00000000000000000000000000000000) Nil!36221) Nil!36221)))))

(declare-fun b!1551016 () Bool)

(declare-fun e!863384 () Bool)

(declare-fun contains!10072 (List!36224 (_ BitVec 64)) Bool)

(assert (=> b!1551016 (= e!863384 (contains!10072 Nil!36221 (select (arr!49929 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551017 () Bool)

(assert (=> b!1551017 (= e!863383 call!70942)))

(declare-fun b!1551018 () Bool)

(assert (=> b!1551018 (= e!863381 e!863382)))

(declare-fun res!1062253 () Bool)

(assert (=> b!1551018 (=> (not res!1062253) (not e!863382))))

(assert (=> b!1551018 (= res!1062253 (not e!863384))))

(declare-fun res!1062252 () Bool)

(assert (=> b!1551018 (=> (not res!1062252) (not e!863384))))

(assert (=> b!1551018 (= res!1062252 (validKeyInArray!0 (select (arr!49929 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160707 (not res!1062251)) b!1551018))

(assert (= (and b!1551018 res!1062252) b!1551016))

(assert (= (and b!1551018 res!1062253) b!1551014))

(assert (= (and b!1551014 c!142663) b!1551017))

(assert (= (and b!1551014 (not c!142663)) b!1551015))

(assert (= (or b!1551017 b!1551015) bm!70939))

(declare-fun m!1429103 () Bool)

(assert (=> b!1551014 m!1429103))

(assert (=> b!1551014 m!1429103))

(declare-fun m!1429105 () Bool)

(assert (=> b!1551014 m!1429105))

(assert (=> bm!70939 m!1429103))

(declare-fun m!1429107 () Bool)

(assert (=> bm!70939 m!1429107))

(assert (=> b!1551016 m!1429103))

(assert (=> b!1551016 m!1429103))

(declare-fun m!1429109 () Bool)

(assert (=> b!1551016 m!1429109))

(assert (=> b!1551018 m!1429103))

(assert (=> b!1551018 m!1429103))

(assert (=> b!1551018 m!1429105))

(assert (=> b!1550852 d!160707))

(declare-fun d!160709 () Bool)

(assert (=> d!160709 (= (validKeyInArray!0 (select (arr!49929 _keys!618) from!762)) (and (not (= (select (arr!49929 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49929 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1550847 d!160709))

(declare-fun d!160711 () Bool)

(declare-datatypes ((Option!808 0))(
  ( (Some!807 (v!21963 V!59333)) (None!806) )
))
(declare-fun get!26018 (Option!808) V!59333)

(declare-fun getValueByKey!733 (List!36223 (_ BitVec 64)) Option!808)

(assert (=> d!160711 (= (apply!1084 (+!5022 lt!668251 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49929 _keys!618) from!762)) (get!26018 (getValueByKey!733 (toList!11206 (+!5022 lt!668251 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49929 _keys!618) from!762))))))

(declare-fun bs!44527 () Bool)

(assert (= bs!44527 d!160711))

(assert (=> bs!44527 m!1428963))

(declare-fun m!1429111 () Bool)

(assert (=> bs!44527 m!1429111))

(assert (=> bs!44527 m!1429111))

(declare-fun m!1429113 () Bool)

(assert (=> bs!44527 m!1429113))

(assert (=> b!1550853 d!160711))

(declare-fun d!160713 () Bool)

(assert (=> d!160713 (contains!10070 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49929 _keys!618) from!762))))

(declare-fun lt!668309 () Unit!51482)

(declare-fun choose!2040 (ListLongMap!22381 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51482)

(assert (=> d!160713 (= lt!668309 (choose!2040 lt!668251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49929 _keys!618) from!762)))))

(assert (=> d!160713 (contains!10070 lt!668251 (select (arr!49929 _keys!618) from!762))))

(assert (=> d!160713 (= (addStillContains!1285 lt!668251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49929 _keys!618) from!762)) lt!668309)))

(declare-fun bs!44528 () Bool)

(assert (= bs!44528 d!160713))

(assert (=> bs!44528 m!1428971))

(assert (=> bs!44528 m!1428971))

(assert (=> bs!44528 m!1428963))

(assert (=> bs!44528 m!1428979))

(assert (=> bs!44528 m!1428963))

(declare-fun m!1429115 () Bool)

(assert (=> bs!44528 m!1429115))

(assert (=> bs!44528 m!1428963))

(assert (=> bs!44528 m!1428977))

(assert (=> b!1550853 d!160713))

(declare-fun d!160715 () Bool)

(declare-fun e!863390 () Bool)

(assert (=> d!160715 e!863390))

(declare-fun res!1062256 () Bool)

(assert (=> d!160715 (=> res!1062256 e!863390)))

(declare-fun lt!668319 () Bool)

(assert (=> d!160715 (= res!1062256 (not lt!668319))))

(declare-fun lt!668320 () Bool)

(assert (=> d!160715 (= lt!668319 lt!668320)))

(declare-fun lt!668321 () Unit!51482)

(declare-fun e!863389 () Unit!51482)

(assert (=> d!160715 (= lt!668321 e!863389)))

(declare-fun c!142666 () Bool)

(assert (=> d!160715 (= c!142666 lt!668320)))

(declare-fun containsKey!750 (List!36223 (_ BitVec 64)) Bool)

(assert (=> d!160715 (= lt!668320 (containsKey!750 (toList!11206 lt!668251) (select (arr!49929 _keys!618) from!762)))))

(assert (=> d!160715 (= (contains!10070 lt!668251 (select (arr!49929 _keys!618) from!762)) lt!668319)))

(declare-fun b!1551026 () Bool)

(declare-fun lt!668318 () Unit!51482)

(assert (=> b!1551026 (= e!863389 lt!668318)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!497 (List!36223 (_ BitVec 64)) Unit!51482)

(assert (=> b!1551026 (= lt!668318 (lemmaContainsKeyImpliesGetValueByKeyDefined!497 (toList!11206 lt!668251) (select (arr!49929 _keys!618) from!762)))))

(declare-fun isDefined!549 (Option!808) Bool)

(assert (=> b!1551026 (isDefined!549 (getValueByKey!733 (toList!11206 lt!668251) (select (arr!49929 _keys!618) from!762)))))

(declare-fun b!1551027 () Bool)

(declare-fun Unit!51486 () Unit!51482)

(assert (=> b!1551027 (= e!863389 Unit!51486)))

(declare-fun b!1551028 () Bool)

(assert (=> b!1551028 (= e!863390 (isDefined!549 (getValueByKey!733 (toList!11206 lt!668251) (select (arr!49929 _keys!618) from!762))))))

(assert (= (and d!160715 c!142666) b!1551026))

(assert (= (and d!160715 (not c!142666)) b!1551027))

(assert (= (and d!160715 (not res!1062256)) b!1551028))

(assert (=> d!160715 m!1428963))

(declare-fun m!1429117 () Bool)

(assert (=> d!160715 m!1429117))

(assert (=> b!1551026 m!1428963))

(declare-fun m!1429119 () Bool)

(assert (=> b!1551026 m!1429119))

(assert (=> b!1551026 m!1428963))

(declare-fun m!1429121 () Bool)

(assert (=> b!1551026 m!1429121))

(assert (=> b!1551026 m!1429121))

(declare-fun m!1429123 () Bool)

(assert (=> b!1551026 m!1429123))

(assert (=> b!1551028 m!1428963))

(assert (=> b!1551028 m!1429121))

(assert (=> b!1551028 m!1429121))

(assert (=> b!1551028 m!1429123))

(assert (=> b!1550853 d!160715))

(declare-fun d!160717 () Bool)

(assert (=> d!160717 (= (apply!1084 lt!668251 (select (arr!49929 _keys!618) from!762)) (get!26018 (getValueByKey!733 (toList!11206 lt!668251) (select (arr!49929 _keys!618) from!762))))))

(declare-fun bs!44529 () Bool)

(assert (= bs!44529 d!160717))

(assert (=> bs!44529 m!1428963))

(assert (=> bs!44529 m!1429121))

(assert (=> bs!44529 m!1429121))

(declare-fun m!1429125 () Bool)

(assert (=> bs!44529 m!1429125))

(assert (=> b!1550853 d!160717))

(declare-fun d!160719 () Bool)

(assert (=> d!160719 (= (apply!1084 (+!5022 lt!668251 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49929 _keys!618) from!762)) (apply!1084 lt!668251 (select (arr!49929 _keys!618) from!762)))))

(declare-fun lt!668324 () Unit!51482)

(declare-fun choose!2041 (ListLongMap!22381 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51482)

(assert (=> d!160719 (= lt!668324 (choose!2041 lt!668251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49929 _keys!618) from!762)))))

(declare-fun e!863393 () Bool)

(assert (=> d!160719 e!863393))

(declare-fun res!1062259 () Bool)

(assert (=> d!160719 (=> (not res!1062259) (not e!863393))))

(assert (=> d!160719 (= res!1062259 (contains!10070 lt!668251 (select (arr!49929 _keys!618) from!762)))))

(assert (=> d!160719 (= (addApplyDifferent!620 lt!668251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49929 _keys!618) from!762)) lt!668324)))

(declare-fun b!1551032 () Bool)

(assert (=> b!1551032 (= e!863393 (not (= (select (arr!49929 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160719 res!1062259) b!1551032))

(assert (=> d!160719 m!1428967))

(assert (=> d!160719 m!1428963))

(assert (=> d!160719 m!1428981))

(assert (=> d!160719 m!1428963))

(assert (=> d!160719 m!1428965))

(assert (=> d!160719 m!1428963))

(assert (=> d!160719 m!1428977))

(assert (=> d!160719 m!1428963))

(declare-fun m!1429127 () Bool)

(assert (=> d!160719 m!1429127))

(assert (=> d!160719 m!1428967))

(assert (=> b!1550853 d!160719))

(assert (=> b!1550853 d!160705))

(declare-fun d!160721 () Bool)

(declare-fun e!863396 () Bool)

(assert (=> d!160721 e!863396))

(declare-fun res!1062265 () Bool)

(assert (=> d!160721 (=> (not res!1062265) (not e!863396))))

(declare-fun lt!668333 () ListLongMap!22381)

(assert (=> d!160721 (= res!1062265 (contains!10070 lt!668333 (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668336 () List!36223)

(assert (=> d!160721 (= lt!668333 (ListLongMap!22382 lt!668336))))

(declare-fun lt!668335 () Unit!51482)

(declare-fun lt!668334 () Unit!51482)

(assert (=> d!160721 (= lt!668335 lt!668334)))

(assert (=> d!160721 (= (getValueByKey!733 lt!668336 (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!373 (List!36223 (_ BitVec 64) V!59333) Unit!51482)

(assert (=> d!160721 (= lt!668334 (lemmaContainsTupThenGetReturnValue!373 lt!668336 (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!502 (List!36223 (_ BitVec 64) V!59333) List!36223)

(assert (=> d!160721 (= lt!668336 (insertStrictlySorted!502 (toList!11206 lt!668251) (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160721 (= (+!5022 lt!668251 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668333)))

(declare-fun b!1551037 () Bool)

(declare-fun res!1062264 () Bool)

(assert (=> b!1551037 (=> (not res!1062264) (not e!863396))))

(assert (=> b!1551037 (= res!1062264 (= (getValueByKey!733 (toList!11206 lt!668333) (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551038 () Bool)

(declare-fun contains!10073 (List!36223 tuple2!24772) Bool)

(assert (=> b!1551038 (= e!863396 (contains!10073 (toList!11206 lt!668333) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160721 res!1062265) b!1551037))

(assert (= (and b!1551037 res!1062264) b!1551038))

(declare-fun m!1429129 () Bool)

(assert (=> d!160721 m!1429129))

(declare-fun m!1429131 () Bool)

(assert (=> d!160721 m!1429131))

(declare-fun m!1429133 () Bool)

(assert (=> d!160721 m!1429133))

(declare-fun m!1429135 () Bool)

(assert (=> d!160721 m!1429135))

(declare-fun m!1429137 () Bool)

(assert (=> b!1551037 m!1429137))

(declare-fun m!1429139 () Bool)

(assert (=> b!1551038 m!1429139))

(assert (=> b!1550853 d!160721))

(declare-fun d!160723 () Bool)

(declare-fun e!863398 () Bool)

(assert (=> d!160723 e!863398))

(declare-fun res!1062266 () Bool)

(assert (=> d!160723 (=> res!1062266 e!863398)))

(declare-fun lt!668338 () Bool)

(assert (=> d!160723 (= res!1062266 (not lt!668338))))

(declare-fun lt!668339 () Bool)

(assert (=> d!160723 (= lt!668338 lt!668339)))

(declare-fun lt!668340 () Unit!51482)

(declare-fun e!863397 () Unit!51482)

(assert (=> d!160723 (= lt!668340 e!863397)))

(declare-fun c!142667 () Bool)

(assert (=> d!160723 (= c!142667 lt!668339)))

(assert (=> d!160723 (= lt!668339 (containsKey!750 (toList!11206 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49929 _keys!618) from!762)))))

(assert (=> d!160723 (= (contains!10070 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49929 _keys!618) from!762)) lt!668338)))

(declare-fun b!1551039 () Bool)

(declare-fun lt!668337 () Unit!51482)

(assert (=> b!1551039 (= e!863397 lt!668337)))

(assert (=> b!1551039 (= lt!668337 (lemmaContainsKeyImpliesGetValueByKeyDefined!497 (toList!11206 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49929 _keys!618) from!762)))))

(assert (=> b!1551039 (isDefined!549 (getValueByKey!733 (toList!11206 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49929 _keys!618) from!762)))))

(declare-fun b!1551040 () Bool)

(declare-fun Unit!51487 () Unit!51482)

(assert (=> b!1551040 (= e!863397 Unit!51487)))

(declare-fun b!1551041 () Bool)

(assert (=> b!1551041 (= e!863398 (isDefined!549 (getValueByKey!733 (toList!11206 (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49929 _keys!618) from!762))))))

(assert (= (and d!160723 c!142667) b!1551039))

(assert (= (and d!160723 (not c!142667)) b!1551040))

(assert (= (and d!160723 (not res!1062266)) b!1551041))

(assert (=> d!160723 m!1428963))

(declare-fun m!1429141 () Bool)

(assert (=> d!160723 m!1429141))

(assert (=> b!1551039 m!1428963))

(declare-fun m!1429143 () Bool)

(assert (=> b!1551039 m!1429143))

(assert (=> b!1551039 m!1428963))

(declare-fun m!1429145 () Bool)

(assert (=> b!1551039 m!1429145))

(assert (=> b!1551039 m!1429145))

(declare-fun m!1429147 () Bool)

(assert (=> b!1551039 m!1429147))

(assert (=> b!1551041 m!1428963))

(assert (=> b!1551041 m!1429145))

(assert (=> b!1551041 m!1429145))

(assert (=> b!1551041 m!1429147))

(assert (=> b!1550853 d!160723))

(declare-fun d!160725 () Bool)

(declare-fun e!863399 () Bool)

(assert (=> d!160725 e!863399))

(declare-fun res!1062268 () Bool)

(assert (=> d!160725 (=> (not res!1062268) (not e!863399))))

(declare-fun lt!668341 () ListLongMap!22381)

(assert (=> d!160725 (= res!1062268 (contains!10070 lt!668341 (_1!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!668344 () List!36223)

(assert (=> d!160725 (= lt!668341 (ListLongMap!22382 lt!668344))))

(declare-fun lt!668343 () Unit!51482)

(declare-fun lt!668342 () Unit!51482)

(assert (=> d!160725 (= lt!668343 lt!668342)))

(assert (=> d!160725 (= (getValueByKey!733 lt!668344 (_1!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!807 (_2!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160725 (= lt!668342 (lemmaContainsTupThenGetReturnValue!373 lt!668344 (_1!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160725 (= lt!668344 (insertStrictlySorted!502 (toList!11206 lt!668251) (_1!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160725 (= (+!5022 lt!668251 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!668341)))

(declare-fun b!1551042 () Bool)

(declare-fun res!1062267 () Bool)

(assert (=> b!1551042 (=> (not res!1062267) (not e!863399))))

(assert (=> b!1551042 (= res!1062267 (= (getValueByKey!733 (toList!11206 lt!668341) (_1!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!807 (_2!12397 (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1551043 () Bool)

(assert (=> b!1551043 (= e!863399 (contains!10073 (toList!11206 lt!668341) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160725 res!1062268) b!1551042))

(assert (= (and b!1551042 res!1062267) b!1551043))

(declare-fun m!1429149 () Bool)

(assert (=> d!160725 m!1429149))

(declare-fun m!1429151 () Bool)

(assert (=> d!160725 m!1429151))

(declare-fun m!1429153 () Bool)

(assert (=> d!160725 m!1429153))

(declare-fun m!1429155 () Bool)

(assert (=> d!160725 m!1429155))

(declare-fun m!1429157 () Bool)

(assert (=> b!1551042 m!1429157))

(declare-fun m!1429159 () Bool)

(assert (=> b!1551043 m!1429159))

(assert (=> b!1550853 d!160725))

(declare-fun d!160727 () Bool)

(declare-fun e!863400 () Bool)

(assert (=> d!160727 e!863400))

(declare-fun res!1062270 () Bool)

(assert (=> d!160727 (=> (not res!1062270) (not e!863400))))

(declare-fun lt!668345 () ListLongMap!22381)

(assert (=> d!160727 (= res!1062270 (contains!10070 lt!668345 (_1!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668348 () List!36223)

(assert (=> d!160727 (= lt!668345 (ListLongMap!22382 lt!668348))))

(declare-fun lt!668347 () Unit!51482)

(declare-fun lt!668346 () Unit!51482)

(assert (=> d!160727 (= lt!668347 lt!668346)))

(assert (=> d!160727 (= (getValueByKey!733 lt!668348 (_1!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!807 (_2!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160727 (= lt!668346 (lemmaContainsTupThenGetReturnValue!373 lt!668348 (_1!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160727 (= lt!668348 (insertStrictlySorted!502 (toList!11206 (ite c!142630 call!70904 (ite c!142629 call!70903 call!70902))) (_1!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160727 (= (+!5022 (ite c!142630 call!70904 (ite c!142629 call!70903 call!70902)) (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668345)))

(declare-fun b!1551044 () Bool)

(declare-fun res!1062269 () Bool)

(assert (=> b!1551044 (=> (not res!1062269) (not e!863400))))

(assert (=> b!1551044 (= res!1062269 (= (getValueByKey!733 (toList!11206 lt!668345) (_1!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!807 (_2!12397 (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1551045 () Bool)

(assert (=> b!1551045 (= e!863400 (contains!10073 (toList!11206 lt!668345) (ite (or c!142630 c!142629) (tuple2!24773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160727 res!1062270) b!1551044))

(assert (= (and b!1551044 res!1062269) b!1551045))

(declare-fun m!1429161 () Bool)

(assert (=> d!160727 m!1429161))

(declare-fun m!1429163 () Bool)

(assert (=> d!160727 m!1429163))

(declare-fun m!1429165 () Bool)

(assert (=> d!160727 m!1429165))

(declare-fun m!1429167 () Bool)

(assert (=> d!160727 m!1429167))

(declare-fun m!1429169 () Bool)

(assert (=> b!1551044 m!1429169))

(declare-fun m!1429171 () Bool)

(assert (=> b!1551045 m!1429171))

(assert (=> bm!70900 d!160727))

(declare-fun d!160729 () Bool)

(assert (=> d!160729 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132166 d!160729))

(declare-fun d!160731 () Bool)

(assert (=> d!160731 (= (array_inv!39017 _keys!618) (bvsge (size!50481 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132166 d!160731))

(declare-fun d!160733 () Bool)

(assert (=> d!160733 (= (array_inv!39018 _values!470) (bvsge (size!50482 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132166 d!160733))

(declare-fun d!160735 () Bool)

(declare-fun e!863401 () Bool)

(assert (=> d!160735 e!863401))

(declare-fun res!1062272 () Bool)

(assert (=> d!160735 (=> (not res!1062272) (not e!863401))))

(declare-fun lt!668349 () ListLongMap!22381)

(assert (=> d!160735 (= res!1062272 (contains!10070 lt!668349 (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668352 () List!36223)

(assert (=> d!160735 (= lt!668349 (ListLongMap!22382 lt!668352))))

(declare-fun lt!668351 () Unit!51482)

(declare-fun lt!668350 () Unit!51482)

(assert (=> d!160735 (= lt!668351 lt!668350)))

(assert (=> d!160735 (= (getValueByKey!733 lt!668352 (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160735 (= lt!668350 (lemmaContainsTupThenGetReturnValue!373 lt!668352 (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160735 (= lt!668352 (insertStrictlySorted!502 (toList!11206 call!70905) (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160735 (= (+!5022 call!70905 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668349)))

(declare-fun b!1551046 () Bool)

(declare-fun res!1062271 () Bool)

(assert (=> b!1551046 (=> (not res!1062271) (not e!863401))))

(assert (=> b!1551046 (= res!1062271 (= (getValueByKey!733 (toList!11206 lt!668349) (_1!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12397 (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551047 () Bool)

(assert (=> b!1551047 (= e!863401 (contains!10073 (toList!11206 lt!668349) (tuple2!24773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160735 res!1062272) b!1551046))

(assert (= (and b!1551046 res!1062271) b!1551047))

(declare-fun m!1429173 () Bool)

(assert (=> d!160735 m!1429173))

(declare-fun m!1429175 () Bool)

(assert (=> d!160735 m!1429175))

(declare-fun m!1429177 () Bool)

(assert (=> d!160735 m!1429177))

(declare-fun m!1429179 () Bool)

(assert (=> d!160735 m!1429179))

(declare-fun m!1429181 () Bool)

(assert (=> b!1551046 m!1429181))

(declare-fun m!1429183 () Bool)

(assert (=> b!1551047 m!1429183))

(assert (=> b!1550857 d!160735))

(declare-fun d!160737 () Bool)

(declare-fun res!1062277 () Bool)

(declare-fun e!863410 () Bool)

(assert (=> d!160737 (=> res!1062277 e!863410)))

(assert (=> d!160737 (= res!1062277 (bvsge #b00000000000000000000000000000000 (size!50481 _keys!618)))))

(assert (=> d!160737 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863410)))

(declare-fun b!1551056 () Bool)

(declare-fun e!863408 () Bool)

(declare-fun call!70945 () Bool)

(assert (=> b!1551056 (= e!863408 call!70945)))

(declare-fun b!1551057 () Bool)

(declare-fun e!863409 () Bool)

(assert (=> b!1551057 (= e!863409 call!70945)))

(declare-fun bm!70942 () Bool)

(assert (=> bm!70942 (= call!70945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1551058 () Bool)

(assert (=> b!1551058 (= e!863410 e!863409)))

(declare-fun c!142670 () Bool)

(assert (=> b!1551058 (= c!142670 (validKeyInArray!0 (select (arr!49929 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551059 () Bool)

(assert (=> b!1551059 (= e!863409 e!863408)))

(declare-fun lt!668361 () (_ BitVec 64))

(assert (=> b!1551059 (= lt!668361 (select (arr!49929 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668360 () Unit!51482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103456 (_ BitVec 64) (_ BitVec 32)) Unit!51482)

(assert (=> b!1551059 (= lt!668360 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668361 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1551059 (arrayContainsKey!0 _keys!618 lt!668361 #b00000000000000000000000000000000)))

(declare-fun lt!668359 () Unit!51482)

(assert (=> b!1551059 (= lt!668359 lt!668360)))

(declare-fun res!1062278 () Bool)

(declare-datatypes ((SeekEntryResult!13514 0))(
  ( (MissingZero!13514 (index!56454 (_ BitVec 32))) (Found!13514 (index!56455 (_ BitVec 32))) (Intermediate!13514 (undefined!14326 Bool) (index!56456 (_ BitVec 32)) (x!139124 (_ BitVec 32))) (Undefined!13514) (MissingVacant!13514 (index!56457 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103456 (_ BitVec 32)) SeekEntryResult!13514)

(assert (=> b!1551059 (= res!1062278 (= (seekEntryOrOpen!0 (select (arr!49929 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13514 #b00000000000000000000000000000000)))))

(assert (=> b!1551059 (=> (not res!1062278) (not e!863408))))

(assert (= (and d!160737 (not res!1062277)) b!1551058))

(assert (= (and b!1551058 c!142670) b!1551059))

(assert (= (and b!1551058 (not c!142670)) b!1551057))

(assert (= (and b!1551059 res!1062278) b!1551056))

(assert (= (or b!1551056 b!1551057) bm!70942))

(declare-fun m!1429185 () Bool)

(assert (=> bm!70942 m!1429185))

(assert (=> b!1551058 m!1429103))

(assert (=> b!1551058 m!1429103))

(assert (=> b!1551058 m!1429105))

(assert (=> b!1551059 m!1429103))

(declare-fun m!1429187 () Bool)

(assert (=> b!1551059 m!1429187))

(declare-fun m!1429189 () Bool)

(assert (=> b!1551059 m!1429189))

(assert (=> b!1551059 m!1429103))

(declare-fun m!1429191 () Bool)

(assert (=> b!1551059 m!1429191))

(assert (=> b!1550850 d!160737))

(declare-fun condMapEmpty!58969 () Bool)

(declare-fun mapDefault!58969 () ValueCell!18173)

(assert (=> mapNonEmpty!58960 (= condMapEmpty!58969 (= mapRest!58960 ((as const (Array (_ BitVec 32) ValueCell!18173)) mapDefault!58969)))))

(declare-fun e!863415 () Bool)

(declare-fun mapRes!58969 () Bool)

(assert (=> mapNonEmpty!58960 (= tp!111931 (and e!863415 mapRes!58969))))

(declare-fun mapIsEmpty!58969 () Bool)

(assert (=> mapIsEmpty!58969 mapRes!58969))

(declare-fun b!1551066 () Bool)

(declare-fun e!863416 () Bool)

(assert (=> b!1551066 (= e!863416 tp_is_empty!38167)))

(declare-fun b!1551067 () Bool)

(assert (=> b!1551067 (= e!863415 tp_is_empty!38167)))

(declare-fun mapNonEmpty!58969 () Bool)

(declare-fun tp!111947 () Bool)

(assert (=> mapNonEmpty!58969 (= mapRes!58969 (and tp!111947 e!863416))))

(declare-fun mapValue!58969 () ValueCell!18173)

(declare-fun mapRest!58969 () (Array (_ BitVec 32) ValueCell!18173))

(declare-fun mapKey!58969 () (_ BitVec 32))

(assert (=> mapNonEmpty!58969 (= mapRest!58960 (store mapRest!58969 mapKey!58969 mapValue!58969))))

(assert (= (and mapNonEmpty!58960 condMapEmpty!58969) mapIsEmpty!58969))

(assert (= (and mapNonEmpty!58960 (not condMapEmpty!58969)) mapNonEmpty!58969))

(assert (= (and mapNonEmpty!58969 ((_ is ValueCellFull!18173) mapValue!58969)) b!1551066))

(assert (= (and mapNonEmpty!58960 ((_ is ValueCellFull!18173) mapDefault!58969)) b!1551067))

(declare-fun m!1429193 () Bool)

(assert (=> mapNonEmpty!58969 m!1429193))

(declare-fun b_lambda!24765 () Bool)

(assert (= b_lambda!24761 (or (and start!132166 b_free!31891) b_lambda!24765)))

(declare-fun b_lambda!24767 () Bool)

(assert (= b_lambda!24763 (or (and start!132166 b_free!31891) b_lambda!24767)))

(check-sat (not d!160711) (not b!1551039) (not b!1551028) (not b!1551014) b_and!51311 (not b_next!31891) (not b!1551038) (not b!1550997) (not d!160705) (not d!160719) (not bm!70942) (not b!1551059) (not bm!70936) (not b!1551041) (not b!1550994) (not d!160727) (not b!1551016) tp_is_empty!38167 (not d!160717) (not b!1551046) (not b_lambda!24765) (not b_lambda!24767) (not d!160723) (not d!160735) (not d!160715) (not d!160721) (not b!1551047) (not d!160713) (not b!1551042) (not b!1551018) (not d!160725) (not b!1550998) (not b!1551045) (not b!1551001) (not b!1551037) (not mapNonEmpty!58969) (not b!1551044) (not b!1551000) (not b!1550996) (not b!1550992) (not b!1550995) (not bm!70939) (not b!1551058) (not b!1551026) (not b!1551043))
(check-sat b_and!51311 (not b_next!31891))
