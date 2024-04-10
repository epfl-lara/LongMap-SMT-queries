; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132290 () Bool)

(assert start!132290)

(declare-fun b_free!31917 () Bool)

(declare-fun b_next!31917 () Bool)

(assert (=> start!132290 (= b_free!31917 (not b_next!31917))))

(declare-fun tp!112014 () Bool)

(declare-fun b_and!51355 () Bool)

(assert (=> start!132290 (= tp!112014 b_and!51355)))

(declare-fun b!1552019 () Bool)

(declare-fun e!864001 () Bool)

(assert (=> b!1552019 (= e!864001 false)))

(declare-datatypes ((Unit!51688 0))(
  ( (Unit!51689) )
))
(declare-fun lt!669031 () Unit!51688)

(declare-fun e!864000 () Unit!51688)

(assert (=> b!1552019 (= lt!669031 e!864000)))

(declare-fun c!142894 () Bool)

(declare-fun e!863993 () Bool)

(assert (=> b!1552019 (= c!142894 e!863993)))

(declare-fun res!1062679 () Bool)

(assert (=> b!1552019 (=> (not res!1062679) (not e!863993))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103590 0))(
  ( (array!103591 (arr!49993 (Array (_ BitVec 32) (_ BitVec 64))) (size!50543 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103590)

(assert (=> b!1552019 (= res!1062679 (bvslt from!762 (size!50543 _keys!618)))))

(declare-datatypes ((V!59367 0))(
  ( (V!59368 (val!19174 Int)) )
))
(declare-datatypes ((tuple2!24724 0))(
  ( (tuple2!24725 (_1!12373 (_ BitVec 64)) (_2!12373 V!59367)) )
))
(declare-datatypes ((List!36201 0))(
  ( (Nil!36198) (Cons!36197 (h!37642 tuple2!24724) (t!50915 List!36201)) )
))
(declare-datatypes ((ListLongMap!22333 0))(
  ( (ListLongMap!22334 (toList!11182 List!36201)) )
))
(declare-fun lt!669029 () ListLongMap!22333)

(declare-fun e!863997 () ListLongMap!22333)

(assert (=> b!1552019 (= lt!669029 e!863997)))

(declare-fun c!142893 () Bool)

(declare-fun lt!669030 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552019 (= c!142893 (and (not lt!669030) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552019 (= lt!669030 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552020 () Bool)

(declare-fun call!71152 () ListLongMap!22333)

(declare-fun minValue!436 () V!59367)

(declare-fun +!5003 (ListLongMap!22333 tuple2!24724) ListLongMap!22333)

(assert (=> b!1552020 (= e!863997 (+!5003 call!71152 (tuple2!24725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552021 () Bool)

(declare-fun Unit!51690 () Unit!51688)

(assert (=> b!1552021 (= e!864000 Unit!51690)))

(declare-fun zeroValue!436 () V!59367)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18186 0))(
  ( (ValueCellFull!18186 (v!21979 V!59367)) (EmptyCell!18186) )
))
(declare-datatypes ((array!103592 0))(
  ( (array!103593 (arr!49994 (Array (_ BitVec 32) ValueCell!18186)) (size!50544 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103592)

(declare-fun call!71153 () ListLongMap!22333)

(declare-fun bm!71147 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6629 (array!103590 array!103592 (_ BitVec 32) (_ BitVec 32) V!59367 V!59367 (_ BitVec 32) Int) ListLongMap!22333)

(assert (=> bm!71147 (= call!71153 (getCurrentListMapNoExtraKeys!6629 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1062678 () Bool)

(assert (=> start!132290 (=> (not res!1062678) (not e!864001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132290 (= res!1062678 (validMask!0 mask!926))))

(assert (=> start!132290 e!864001))

(declare-fun array_inv!38865 (array!103590) Bool)

(assert (=> start!132290 (array_inv!38865 _keys!618)))

(declare-fun tp_is_empty!38193 () Bool)

(assert (=> start!132290 tp_is_empty!38193))

(assert (=> start!132290 true))

(assert (=> start!132290 tp!112014))

(declare-fun e!863992 () Bool)

(declare-fun array_inv!38866 (array!103592) Bool)

(assert (=> start!132290 (and (array_inv!38866 _values!470) e!863992)))

(declare-fun mapIsEmpty!59005 () Bool)

(declare-fun mapRes!59005 () Bool)

(assert (=> mapIsEmpty!59005 mapRes!59005))

(declare-fun b!1552022 () Bool)

(declare-fun c!142892 () Bool)

(assert (=> b!1552022 (= c!142892 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669030))))

(declare-fun e!863995 () ListLongMap!22333)

(declare-fun e!863998 () ListLongMap!22333)

(assert (=> b!1552022 (= e!863995 e!863998)))

(declare-fun b!1552023 () Bool)

(declare-fun res!1062674 () Bool)

(assert (=> b!1552023 (=> (not res!1062674) (not e!864001))))

(declare-datatypes ((List!36202 0))(
  ( (Nil!36199) (Cons!36198 (h!37643 (_ BitVec 64)) (t!50916 List!36202)) )
))
(declare-fun arrayNoDuplicates!0 (array!103590 (_ BitVec 32) List!36202) Bool)

(assert (=> b!1552023 (= res!1062674 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36199))))

(declare-fun bm!71148 () Bool)

(declare-fun call!71151 () ListLongMap!22333)

(assert (=> bm!71148 (= call!71151 call!71153)))

(declare-fun call!71150 () ListLongMap!22333)

(declare-fun bm!71149 () Bool)

(declare-fun c!142895 () Bool)

(assert (=> bm!71149 (= call!71152 (+!5003 (ite c!142893 call!71153 (ite c!142895 call!71151 call!71150)) (ite (or c!142893 c!142895) (tuple2!24725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552024 () Bool)

(assert (=> b!1552024 (= e!863997 e!863995)))

(assert (=> b!1552024 (= c!142895 (and (not lt!669030) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552025 () Bool)

(assert (=> b!1552025 (= e!863998 call!71150)))

(declare-fun b!1552026 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552026 (= e!863993 (validKeyInArray!0 (select (arr!49993 _keys!618) from!762)))))

(declare-fun b!1552027 () Bool)

(declare-fun lt!669027 () Unit!51688)

(assert (=> b!1552027 (= e!864000 lt!669027)))

(declare-fun lt!669035 () ListLongMap!22333)

(assert (=> b!1552027 (= lt!669035 (getCurrentListMapNoExtraKeys!6629 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669033 () Unit!51688)

(declare-fun addStillContains!1300 (ListLongMap!22333 (_ BitVec 64) V!59367 (_ BitVec 64)) Unit!51688)

(assert (=> b!1552027 (= lt!669033 (addStillContains!1300 lt!669035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49993 _keys!618) from!762)))))

(declare-fun lt!669032 () ListLongMap!22333)

(assert (=> b!1552027 (= lt!669032 (+!5003 lt!669035 (tuple2!24725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10124 (ListLongMap!22333 (_ BitVec 64)) Bool)

(assert (=> b!1552027 (contains!10124 lt!669032 (select (arr!49993 _keys!618) from!762))))

(declare-fun addApplyDifferent!642 (ListLongMap!22333 (_ BitVec 64) V!59367 (_ BitVec 64)) Unit!51688)

(assert (=> b!1552027 (= lt!669027 (addApplyDifferent!642 lt!669035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49993 _keys!618) from!762)))))

(declare-fun lt!669028 () V!59367)

(declare-fun apply!1104 (ListLongMap!22333 (_ BitVec 64)) V!59367)

(assert (=> b!1552027 (= lt!669028 (apply!1104 (+!5003 lt!669035 (tuple2!24725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49993 _keys!618) from!762)))))

(declare-fun lt!669036 () V!59367)

(assert (=> b!1552027 (= lt!669036 (apply!1104 lt!669035 (select (arr!49993 _keys!618) from!762)))))

(assert (=> b!1552027 (= lt!669028 lt!669036)))

(declare-fun lt!669034 () Unit!51688)

(assert (=> b!1552027 (= lt!669034 (addApplyDifferent!642 lt!669035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49993 _keys!618) from!762)))))

(assert (=> b!1552027 (= (apply!1104 lt!669032 (select (arr!49993 _keys!618) from!762)) lt!669036)))

(declare-fun bm!71150 () Bool)

(assert (=> bm!71150 (= call!71150 call!71151)))

(declare-fun b!1552028 () Bool)

(declare-fun e!863996 () Bool)

(assert (=> b!1552028 (= e!863996 tp_is_empty!38193)))

(declare-fun b!1552029 () Bool)

(declare-fun res!1062675 () Bool)

(assert (=> b!1552029 (=> (not res!1062675) (not e!864001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103590 (_ BitVec 32)) Bool)

(assert (=> b!1552029 (= res!1062675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552030 () Bool)

(declare-fun call!71154 () ListLongMap!22333)

(assert (=> b!1552030 (= e!863998 call!71154)))

(declare-fun b!1552031 () Bool)

(declare-fun res!1062676 () Bool)

(assert (=> b!1552031 (=> (not res!1062676) (not e!864001))))

(assert (=> b!1552031 (= res!1062676 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50543 _keys!618))))))

(declare-fun b!1552032 () Bool)

(declare-fun e!863999 () Bool)

(assert (=> b!1552032 (= e!863992 (and e!863999 mapRes!59005))))

(declare-fun condMapEmpty!59005 () Bool)

(declare-fun mapDefault!59005 () ValueCell!18186)

(assert (=> b!1552032 (= condMapEmpty!59005 (= (arr!49994 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18186)) mapDefault!59005)))))

(declare-fun bm!71151 () Bool)

(assert (=> bm!71151 (= call!71154 call!71152)))

(declare-fun b!1552033 () Bool)

(assert (=> b!1552033 (= e!863995 call!71154)))

(declare-fun b!1552034 () Bool)

(declare-fun res!1062677 () Bool)

(assert (=> b!1552034 (=> (not res!1062677) (not e!864001))))

(assert (=> b!1552034 (= res!1062677 (and (= (size!50544 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50543 _keys!618) (size!50544 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59005 () Bool)

(declare-fun tp!112015 () Bool)

(assert (=> mapNonEmpty!59005 (= mapRes!59005 (and tp!112015 e!863996))))

(declare-fun mapValue!59005 () ValueCell!18186)

(declare-fun mapKey!59005 () (_ BitVec 32))

(declare-fun mapRest!59005 () (Array (_ BitVec 32) ValueCell!18186))

(assert (=> mapNonEmpty!59005 (= (arr!49994 _values!470) (store mapRest!59005 mapKey!59005 mapValue!59005))))

(declare-fun b!1552035 () Bool)

(assert (=> b!1552035 (= e!863999 tp_is_empty!38193)))

(assert (= (and start!132290 res!1062678) b!1552034))

(assert (= (and b!1552034 res!1062677) b!1552029))

(assert (= (and b!1552029 res!1062675) b!1552023))

(assert (= (and b!1552023 res!1062674) b!1552031))

(assert (= (and b!1552031 res!1062676) b!1552019))

(assert (= (and b!1552019 c!142893) b!1552020))

(assert (= (and b!1552019 (not c!142893)) b!1552024))

(assert (= (and b!1552024 c!142895) b!1552033))

(assert (= (and b!1552024 (not c!142895)) b!1552022))

(assert (= (and b!1552022 c!142892) b!1552030))

(assert (= (and b!1552022 (not c!142892)) b!1552025))

(assert (= (or b!1552030 b!1552025) bm!71150))

(assert (= (or b!1552033 bm!71150) bm!71148))

(assert (= (or b!1552033 b!1552030) bm!71151))

(assert (= (or b!1552020 bm!71148) bm!71147))

(assert (= (or b!1552020 bm!71151) bm!71149))

(assert (= (and b!1552019 res!1062679) b!1552026))

(assert (= (and b!1552019 c!142894) b!1552027))

(assert (= (and b!1552019 (not c!142894)) b!1552021))

(assert (= (and b!1552032 condMapEmpty!59005) mapIsEmpty!59005))

(assert (= (and b!1552032 (not condMapEmpty!59005)) mapNonEmpty!59005))

(get-info :version)

(assert (= (and mapNonEmpty!59005 ((_ is ValueCellFull!18186) mapValue!59005)) b!1552028))

(assert (= (and b!1552032 ((_ is ValueCellFull!18186) mapDefault!59005)) b!1552035))

(assert (= start!132290 b!1552032))

(declare-fun m!1430619 () Bool)

(assert (=> b!1552023 m!1430619))

(declare-fun m!1430621 () Bool)

(assert (=> bm!71149 m!1430621))

(declare-fun m!1430623 () Bool)

(assert (=> b!1552020 m!1430623))

(declare-fun m!1430625 () Bool)

(assert (=> bm!71147 m!1430625))

(declare-fun m!1430627 () Bool)

(assert (=> b!1552029 m!1430627))

(declare-fun m!1430629 () Bool)

(assert (=> b!1552026 m!1430629))

(assert (=> b!1552026 m!1430629))

(declare-fun m!1430631 () Bool)

(assert (=> b!1552026 m!1430631))

(declare-fun m!1430633 () Bool)

(assert (=> mapNonEmpty!59005 m!1430633))

(declare-fun m!1430635 () Bool)

(assert (=> start!132290 m!1430635))

(declare-fun m!1430637 () Bool)

(assert (=> start!132290 m!1430637))

(declare-fun m!1430639 () Bool)

(assert (=> start!132290 m!1430639))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430641 () Bool)

(assert (=> b!1552027 m!1430641))

(assert (=> b!1552027 m!1430625))

(assert (=> b!1552027 m!1430629))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430643 () Bool)

(assert (=> b!1552027 m!1430643))

(declare-fun m!1430645 () Bool)

(assert (=> b!1552027 m!1430645))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430647 () Bool)

(assert (=> b!1552027 m!1430647))

(declare-fun m!1430649 () Bool)

(assert (=> b!1552027 m!1430649))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430651 () Bool)

(assert (=> b!1552027 m!1430651))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430653 () Bool)

(assert (=> b!1552027 m!1430653))

(assert (=> b!1552027 m!1430649))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430655 () Bool)

(assert (=> b!1552027 m!1430655))

(assert (=> b!1552027 m!1430629))

(declare-fun m!1430657 () Bool)

(assert (=> b!1552027 m!1430657))

(check-sat (not b!1552020) (not b!1552026) (not mapNonEmpty!59005) (not b!1552023) (not b!1552029) (not bm!71147) (not b!1552027) b_and!51355 (not start!132290) (not b_next!31917) tp_is_empty!38193 (not bm!71149))
(check-sat b_and!51355 (not b_next!31917))
