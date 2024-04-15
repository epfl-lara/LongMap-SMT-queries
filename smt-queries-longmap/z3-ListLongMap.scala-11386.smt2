; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132256 () Bool)

(assert start!132256)

(declare-fun b_free!31933 () Bool)

(declare-fun b_next!31933 () Bool)

(assert (=> start!132256 (= b_free!31933 (not b_next!31933))))

(declare-fun tp!112064 () Bool)

(declare-fun b_and!51353 () Bool)

(assert (=> start!132256 (= tp!112064 b_and!51353)))

(declare-fun b!1552161 () Bool)

(declare-fun e!864069 () Bool)

(declare-datatypes ((V!59389 0))(
  ( (V!59390 (val!19182 Int)) )
))
(declare-datatypes ((tuple2!24812 0))(
  ( (tuple2!24813 (_1!12417 (_ BitVec 64)) (_2!12417 V!59389)) )
))
(declare-datatypes ((List!36259 0))(
  ( (Nil!36256) (Cons!36255 (h!37701 tuple2!24812) (t!50967 List!36259)) )
))
(declare-datatypes ((ListLongMap!22421 0))(
  ( (ListLongMap!22422 (toList!11226 List!36259)) )
))
(declare-fun lt!669012 () ListLongMap!22421)

(declare-fun zeroValue!436 () V!59389)

(declare-fun apply!1097 (ListLongMap!22421 (_ BitVec 64)) V!59389)

(assert (=> b!1552161 (= e!864069 (not (= (apply!1097 lt!669012 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436)))))

(declare-fun b!1552162 () Bool)

(declare-datatypes ((Unit!51522 0))(
  ( (Unit!51523) )
))
(declare-fun e!864080 () Unit!51522)

(declare-fun lt!669019 () Unit!51522)

(assert (=> b!1552162 (= e!864080 lt!669019)))

(declare-datatypes ((array!103542 0))(
  ( (array!103543 (arr!49970 (Array (_ BitVec 32) (_ BitVec 64))) (size!50522 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103542)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun lt!669010 () ListLongMap!22421)

(declare-datatypes ((ValueCell!18194 0))(
  ( (ValueCellFull!18194 (v!21983 V!59389)) (EmptyCell!18194) )
))
(declare-datatypes ((array!103544 0))(
  ( (array!103545 (arr!49971 (Array (_ BitVec 32) ValueCell!18194)) (size!50523 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103544)

(declare-fun minValue!436 () V!59389)

(declare-fun getCurrentListMapNoExtraKeys!6660 (array!103542 array!103544 (_ BitVec 32) (_ BitVec 32) V!59389 V!59389 (_ BitVec 32) Int) ListLongMap!22421)

(assert (=> b!1552162 (= lt!669010 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669017 () Unit!51522)

(declare-fun addStillContains!1298 (ListLongMap!22421 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51522)

(assert (=> b!1552162 (= lt!669017 (addStillContains!1298 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669015 () ListLongMap!22421)

(declare-fun +!5040 (ListLongMap!22421 tuple2!24812) ListLongMap!22421)

(assert (=> b!1552162 (= lt!669015 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10087 (ListLongMap!22421 (_ BitVec 64)) Bool)

(assert (=> b!1552162 (contains!10087 lt!669015 (select (arr!49970 _keys!618) from!762))))

(declare-fun addApplyDifferent!633 (ListLongMap!22421 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51522)

(assert (=> b!1552162 (= lt!669019 (addApplyDifferent!633 lt!669010 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669016 () V!59389)

(assert (=> b!1552162 (= lt!669016 (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669020 () V!59389)

(assert (=> b!1552162 (= lt!669020 (apply!1097 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552162 (= lt!669016 lt!669020)))

(declare-fun lt!669014 () Unit!51522)

(assert (=> b!1552162 (= lt!669014 (addApplyDifferent!633 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552162 (= (apply!1097 lt!669015 (select (arr!49970 _keys!618) from!762)) lt!669020)))

(declare-fun bm!71236 () Bool)

(declare-fun call!71239 () ListLongMap!22421)

(declare-fun call!71241 () ListLongMap!22421)

(assert (=> bm!71236 (= call!71239 call!71241)))

(declare-fun res!1062730 () Bool)

(declare-fun e!864074 () Bool)

(assert (=> start!132256 (=> (not res!1062730) (not e!864074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132256 (= res!1062730 (validMask!0 mask!926))))

(assert (=> start!132256 e!864074))

(declare-fun array_inv!39049 (array!103542) Bool)

(assert (=> start!132256 (array_inv!39049 _keys!618)))

(declare-fun tp_is_empty!38209 () Bool)

(assert (=> start!132256 tp_is_empty!38209))

(assert (=> start!132256 true))

(assert (=> start!132256 tp!112064))

(declare-fun e!864073 () Bool)

(declare-fun array_inv!39050 (array!103544) Bool)

(assert (=> start!132256 (and (array_inv!39050 _values!470) e!864073)))

(declare-fun b!1552163 () Bool)

(declare-fun e!864081 () ListLongMap!22421)

(declare-fun e!864068 () ListLongMap!22421)

(assert (=> b!1552163 (= e!864081 e!864068)))

(declare-fun c!142905 () Bool)

(declare-fun lt!669018 () Bool)

(assert (=> b!1552163 (= c!142905 (and (not lt!669018) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552164 () Bool)

(declare-fun e!864066 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552164 (= e!864066 (not (validKeyInArray!0 (select (arr!49970 _keys!618) from!762))))))

(declare-fun mapNonEmpty!59029 () Bool)

(declare-fun mapRes!59029 () Bool)

(declare-fun tp!112063 () Bool)

(declare-fun e!864067 () Bool)

(assert (=> mapNonEmpty!59029 (= mapRes!59029 (and tp!112063 e!864067))))

(declare-fun mapKey!59029 () (_ BitVec 32))

(declare-fun mapValue!59029 () ValueCell!18194)

(declare-fun mapRest!59029 () (Array (_ BitVec 32) ValueCell!18194))

(assert (=> mapNonEmpty!59029 (= (arr!49971 _values!470) (store mapRest!59029 mapKey!59029 mapValue!59029))))

(declare-fun b!1552165 () Bool)

(declare-fun e!864075 () Bool)

(assert (=> b!1552165 (= e!864074 e!864075)))

(declare-fun res!1062736 () Bool)

(assert (=> b!1552165 (=> res!1062736 e!864075)))

(declare-fun e!864071 () Bool)

(assert (=> b!1552165 (= res!1062736 e!864071)))

(declare-fun res!1062731 () Bool)

(assert (=> b!1552165 (=> (not res!1062731) (not e!864071))))

(declare-fun lt!669011 () Bool)

(assert (=> b!1552165 (= res!1062731 (not lt!669011))))

(declare-fun lt!669013 () Unit!51522)

(assert (=> b!1552165 (= lt!669013 e!864080)))

(declare-fun c!142903 () Bool)

(assert (=> b!1552165 (= c!142903 (not lt!669011))))

(assert (=> b!1552165 (= lt!669011 e!864066)))

(declare-fun res!1062739 () Bool)

(assert (=> b!1552165 (=> res!1062739 e!864066)))

(assert (=> b!1552165 (= res!1062739 (bvsge from!762 (size!50522 _keys!618)))))

(assert (=> b!1552165 (= lt!669012 e!864081)))

(declare-fun c!142906 () Bool)

(assert (=> b!1552165 (= c!142906 (and (not lt!669018) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552165 (= lt!669018 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552166 () Bool)

(declare-fun e!864079 () ListLongMap!22421)

(declare-fun call!71244 () ListLongMap!22421)

(assert (=> b!1552166 (= e!864079 call!71244)))

(declare-fun b!1552167 () Bool)

(declare-fun e!864077 () Bool)

(assert (=> b!1552167 (= e!864071 e!864077)))

(declare-fun res!1062729 () Bool)

(assert (=> b!1552167 (=> res!1062729 e!864077)))

(assert (=> b!1552167 (= res!1062729 (not (contains!10087 lt!669012 (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552168 () Bool)

(declare-fun res!1062733 () Bool)

(assert (=> b!1552168 (=> (not res!1062733) (not e!864074))))

(assert (=> b!1552168 (= res!1062733 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50522 _keys!618))))))

(declare-fun b!1552169 () Bool)

(declare-fun res!1062734 () Bool)

(assert (=> b!1552169 (=> (not res!1062734) (not e!864074))))

(declare-datatypes ((List!36260 0))(
  ( (Nil!36257) (Cons!36256 (h!37702 (_ BitVec 64)) (t!50968 List!36260)) )
))
(declare-fun arrayNoDuplicates!0 (array!103542 (_ BitVec 32) List!36260) Bool)

(assert (=> b!1552169 (= res!1062734 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36257))))

(declare-fun b!1552170 () Bool)

(declare-fun res!1062732 () Bool)

(assert (=> b!1552170 (=> res!1062732 e!864075)))

(declare-fun e!864072 () Bool)

(assert (=> b!1552170 (= res!1062732 e!864072)))

(declare-fun c!142904 () Bool)

(assert (=> b!1552170 (= c!142904 (not lt!669018))))

(declare-fun b!1552171 () Bool)

(declare-fun e!864082 () Bool)

(assert (=> b!1552171 (= e!864075 e!864082)))

(declare-fun c!142907 () Bool)

(assert (=> b!1552171 (= c!142907 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552172 () Bool)

(declare-fun e!864078 () Bool)

(assert (=> b!1552172 (= e!864073 (and e!864078 mapRes!59029))))

(declare-fun condMapEmpty!59029 () Bool)

(declare-fun mapDefault!59029 () ValueCell!18194)

(assert (=> b!1552172 (= condMapEmpty!59029 (= (arr!49971 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59029)))))

(declare-fun b!1552173 () Bool)

(declare-fun get!26035 (ValueCell!18194 V!59389) V!59389)

(declare-fun dynLambda!3828 (Int (_ BitVec 64)) V!59389)

(assert (=> b!1552173 (= e!864077 (not (= (apply!1097 lt!669012 (select (arr!49970 _keys!618) from!762)) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552174 () Bool)

(declare-fun e!864070 () Bool)

(assert (=> b!1552174 (= e!864070 (not (= (apply!1097 lt!669012 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!436)))))

(declare-fun mapIsEmpty!59029 () Bool)

(assert (=> mapIsEmpty!59029 mapRes!59029))

(declare-fun b!1552175 () Bool)

(declare-fun c!142908 () Bool)

(assert (=> b!1552175 (= c!142908 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669018))))

(assert (=> b!1552175 (= e!864068 e!864079)))

(declare-fun bm!71237 () Bool)

(declare-fun call!71243 () ListLongMap!22421)

(assert (=> bm!71237 (= call!71244 call!71243)))

(declare-fun b!1552176 () Bool)

(assert (=> b!1552176 (= e!864072 e!864069)))

(declare-fun res!1062737 () Bool)

(declare-fun call!71240 () Bool)

(assert (=> b!1552176 (= res!1062737 (not call!71240))))

(assert (=> b!1552176 (=> res!1062737 e!864069)))

(declare-fun b!1552177 () Bool)

(assert (=> b!1552177 (= e!864072 call!71240)))

(declare-fun b!1552178 () Bool)

(assert (=> b!1552178 (= e!864078 tp_is_empty!38209)))

(declare-fun b!1552179 () Bool)

(declare-fun call!71245 () Bool)

(assert (=> b!1552179 (= e!864082 call!71245)))

(declare-fun b!1552180 () Bool)

(assert (=> b!1552180 (= e!864081 (+!5040 call!71243 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!71238 () Bool)

(assert (=> bm!71238 (= call!71245 (contains!10087 lt!669012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!71239 () Bool)

(declare-fun call!71242 () ListLongMap!22421)

(assert (=> bm!71239 (= call!71243 (+!5040 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552181 () Bool)

(assert (=> b!1552181 (= e!864067 tp_is_empty!38209)))

(declare-fun bm!71240 () Bool)

(assert (=> bm!71240 (= call!71241 call!71242)))

(declare-fun b!1552182 () Bool)

(declare-fun res!1062728 () Bool)

(assert (=> b!1552182 (=> (not res!1062728) (not e!864074))))

(assert (=> b!1552182 (= res!1062728 (and (= (size!50523 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50522 _keys!618) (size!50523 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552183 () Bool)

(assert (=> b!1552183 (= e!864079 call!71239)))

(declare-fun b!1552184 () Bool)

(declare-fun Unit!51524 () Unit!51522)

(assert (=> b!1552184 (= e!864080 Unit!51524)))

(declare-fun bm!71241 () Bool)

(assert (=> bm!71241 (= call!71242 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552185 () Bool)

(assert (=> b!1552185 (= e!864082 e!864070)))

(declare-fun res!1062735 () Bool)

(assert (=> b!1552185 (= res!1062735 (not call!71245))))

(assert (=> b!1552185 (=> res!1062735 e!864070)))

(declare-fun b!1552186 () Bool)

(declare-fun res!1062738 () Bool)

(assert (=> b!1552186 (=> (not res!1062738) (not e!864074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103542 (_ BitVec 32)) Bool)

(assert (=> b!1552186 (= res!1062738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552187 () Bool)

(assert (=> b!1552187 (= e!864068 call!71244)))

(declare-fun bm!71242 () Bool)

(assert (=> bm!71242 (= call!71240 (contains!10087 lt!669012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!132256 res!1062730) b!1552182))

(assert (= (and b!1552182 res!1062728) b!1552186))

(assert (= (and b!1552186 res!1062738) b!1552169))

(assert (= (and b!1552169 res!1062734) b!1552168))

(assert (= (and b!1552168 res!1062733) b!1552165))

(assert (= (and b!1552165 c!142906) b!1552180))

(assert (= (and b!1552165 (not c!142906)) b!1552163))

(assert (= (and b!1552163 c!142905) b!1552187))

(assert (= (and b!1552163 (not c!142905)) b!1552175))

(assert (= (and b!1552175 c!142908) b!1552166))

(assert (= (and b!1552175 (not c!142908)) b!1552183))

(assert (= (or b!1552166 b!1552183) bm!71236))

(assert (= (or b!1552187 bm!71236) bm!71240))

(assert (= (or b!1552187 b!1552166) bm!71237))

(assert (= (or b!1552180 bm!71240) bm!71241))

(assert (= (or b!1552180 bm!71237) bm!71239))

(assert (= (and b!1552165 (not res!1062739)) b!1552164))

(assert (= (and b!1552165 c!142903) b!1552162))

(assert (= (and b!1552165 (not c!142903)) b!1552184))

(assert (= (and b!1552165 res!1062731) b!1552167))

(assert (= (and b!1552167 (not res!1062729)) b!1552173))

(assert (= (and b!1552165 (not res!1062736)) b!1552170))

(assert (= (and b!1552170 c!142904) b!1552176))

(assert (= (and b!1552170 (not c!142904)) b!1552177))

(assert (= (and b!1552176 (not res!1062737)) b!1552161))

(assert (= (or b!1552176 b!1552177) bm!71242))

(assert (= (and b!1552170 (not res!1062732)) b!1552171))

(assert (= (and b!1552171 c!142907) b!1552185))

(assert (= (and b!1552171 (not c!142907)) b!1552179))

(assert (= (and b!1552185 (not res!1062735)) b!1552174))

(assert (= (or b!1552185 b!1552179) bm!71238))

(assert (= (and b!1552172 condMapEmpty!59029) mapIsEmpty!59029))

(assert (= (and b!1552172 (not condMapEmpty!59029)) mapNonEmpty!59029))

(get-info :version)

(assert (= (and mapNonEmpty!59029 ((_ is ValueCellFull!18194) mapValue!59029)) b!1552181))

(assert (= (and b!1552172 ((_ is ValueCellFull!18194) mapDefault!59029)) b!1552178))

(assert (= start!132256 b!1552172))

(declare-fun b_lambda!24777 () Bool)

(assert (=> (not b_lambda!24777) (not b!1552173)))

(declare-fun t!50966 () Bool)

(declare-fun tb!12475 () Bool)

(assert (=> (and start!132256 (= defaultEntry!478 defaultEntry!478) t!50966) tb!12475))

(declare-fun result!26077 () Bool)

(assert (=> tb!12475 (= result!26077 tp_is_empty!38209)))

(assert (=> b!1552173 t!50966))

(declare-fun b_and!51355 () Bool)

(assert (= b_and!51353 (and (=> t!50966 result!26077) b_and!51355)))

(declare-fun m!1430059 () Bool)

(assert (=> b!1552164 m!1430059))

(assert (=> b!1552164 m!1430059))

(declare-fun m!1430061 () Bool)

(assert (=> b!1552164 m!1430061))

(declare-fun m!1430063 () Bool)

(assert (=> bm!71238 m!1430063))

(declare-fun m!1430065 () Bool)

(assert (=> bm!71241 m!1430065))

(declare-fun m!1430067 () Bool)

(assert (=> b!1552180 m!1430067))

(declare-fun m!1430069 () Bool)

(assert (=> bm!71242 m!1430069))

(declare-fun m!1430071 () Bool)

(assert (=> b!1552169 m!1430071))

(declare-fun m!1430073 () Bool)

(assert (=> start!132256 m!1430073))

(declare-fun m!1430075 () Bool)

(assert (=> start!132256 m!1430075))

(declare-fun m!1430077 () Bool)

(assert (=> start!132256 m!1430077))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430079 () Bool)

(assert (=> b!1552162 m!1430079))

(assert (=> b!1552162 m!1430065))

(declare-fun m!1430081 () Bool)

(assert (=> b!1552162 m!1430081))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430083 () Bool)

(assert (=> b!1552162 m!1430083))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430085 () Bool)

(assert (=> b!1552162 m!1430085))

(assert (=> b!1552162 m!1430081))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430087 () Bool)

(assert (=> b!1552162 m!1430087))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430089 () Bool)

(assert (=> b!1552162 m!1430089))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430091 () Bool)

(assert (=> b!1552162 m!1430091))

(declare-fun m!1430093 () Bool)

(assert (=> b!1552162 m!1430093))

(assert (=> b!1552162 m!1430059))

(assert (=> b!1552162 m!1430059))

(declare-fun m!1430095 () Bool)

(assert (=> b!1552162 m!1430095))

(declare-fun m!1430097 () Bool)

(assert (=> b!1552174 m!1430097))

(declare-fun m!1430099 () Bool)

(assert (=> mapNonEmpty!59029 m!1430099))

(declare-fun m!1430101 () Bool)

(assert (=> b!1552161 m!1430101))

(declare-fun m!1430103 () Bool)

(assert (=> bm!71239 m!1430103))

(declare-fun m!1430105 () Bool)

(assert (=> b!1552186 m!1430105))

(assert (=> b!1552167 m!1430059))

(assert (=> b!1552167 m!1430059))

(declare-fun m!1430107 () Bool)

(assert (=> b!1552167 m!1430107))

(declare-fun m!1430109 () Bool)

(assert (=> b!1552173 m!1430109))

(assert (=> b!1552173 m!1430059))

(declare-fun m!1430111 () Bool)

(assert (=> b!1552173 m!1430111))

(assert (=> b!1552173 m!1430109))

(assert (=> b!1552173 m!1430111))

(declare-fun m!1430113 () Bool)

(assert (=> b!1552173 m!1430113))

(assert (=> b!1552173 m!1430059))

(declare-fun m!1430115 () Bool)

(assert (=> b!1552173 m!1430115))

(check-sat (not b!1552164) (not b_next!31933) (not b_lambda!24777) (not bm!71239) tp_is_empty!38209 (not b!1552169) (not b!1552173) (not start!132256) (not b!1552180) (not b!1552174) (not b!1552162) (not b!1552161) (not bm!71241) (not b!1552167) (not mapNonEmpty!59029) (not bm!71242) (not b!1552186) (not bm!71238) b_and!51355)
(check-sat b_and!51355 (not b_next!31933))
(get-model)

(declare-fun b_lambda!24783 () Bool)

(assert (= b_lambda!24777 (or (and start!132256 b_free!31933) b_lambda!24783)))

(check-sat (not b!1552164) (not b_next!31933) (not bm!71239) tp_is_empty!38209 (not b!1552169) (not b!1552173) (not start!132256) (not b!1552180) (not b!1552174) (not b!1552162) (not b!1552161) (not bm!71241) (not b!1552167) (not mapNonEmpty!59029) (not b_lambda!24783) (not bm!71242) (not b!1552186) (not bm!71238) b_and!51355)
(check-sat b_and!51355 (not b_next!31933))
(get-model)

(declare-fun b!1552364 () Bool)

(declare-fun e!864192 () Bool)

(declare-fun call!71290 () Bool)

(assert (=> b!1552364 (= e!864192 call!71290)))

(declare-fun b!1552365 () Bool)

(declare-fun e!864193 () Bool)

(assert (=> b!1552365 (= e!864193 e!864192)))

(declare-fun c!142947 () Bool)

(assert (=> b!1552365 (= c!142947 (validKeyInArray!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1552366 () Bool)

(declare-fun e!864191 () Bool)

(assert (=> b!1552366 (= e!864192 e!864191)))

(declare-fun lt!669093 () (_ BitVec 64))

(assert (=> b!1552366 (= lt!669093 (select (arr!49970 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!669095 () Unit!51522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103542 (_ BitVec 64) (_ BitVec 32)) Unit!51522)

(assert (=> b!1552366 (= lt!669095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669093 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1552366 (arrayContainsKey!0 _keys!618 lt!669093 #b00000000000000000000000000000000)))

(declare-fun lt!669094 () Unit!51522)

(assert (=> b!1552366 (= lt!669094 lt!669095)))

(declare-fun res!1062816 () Bool)

(declare-datatypes ((SeekEntryResult!13516 0))(
  ( (MissingZero!13516 (index!56462 (_ BitVec 32))) (Found!13516 (index!56463 (_ BitVec 32))) (Intermediate!13516 (undefined!14328 Bool) (index!56464 (_ BitVec 32)) (x!139210 (_ BitVec 32))) (Undefined!13516) (MissingVacant!13516 (index!56465 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103542 (_ BitVec 32)) SeekEntryResult!13516)

(assert (=> b!1552366 (= res!1062816 (= (seekEntryOrOpen!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13516 #b00000000000000000000000000000000)))))

(assert (=> b!1552366 (=> (not res!1062816) (not e!864191))))

(declare-fun b!1552367 () Bool)

(assert (=> b!1552367 (= e!864191 call!71290)))

(declare-fun d!160791 () Bool)

(declare-fun res!1062817 () Bool)

(assert (=> d!160791 (=> res!1062817 e!864193)))

(assert (=> d!160791 (= res!1062817 (bvsge #b00000000000000000000000000000000 (size!50522 _keys!618)))))

(assert (=> d!160791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!864193)))

(declare-fun bm!71287 () Bool)

(assert (=> bm!71287 (= call!71290 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!160791 (not res!1062817)) b!1552365))

(assert (= (and b!1552365 c!142947) b!1552366))

(assert (= (and b!1552365 (not c!142947)) b!1552364))

(assert (= (and b!1552366 res!1062816) b!1552367))

(assert (= (or b!1552367 b!1552364) bm!71287))

(declare-fun m!1430233 () Bool)

(assert (=> b!1552365 m!1430233))

(assert (=> b!1552365 m!1430233))

(declare-fun m!1430235 () Bool)

(assert (=> b!1552365 m!1430235))

(assert (=> b!1552366 m!1430233))

(declare-fun m!1430237 () Bool)

(assert (=> b!1552366 m!1430237))

(declare-fun m!1430239 () Bool)

(assert (=> b!1552366 m!1430239))

(assert (=> b!1552366 m!1430233))

(declare-fun m!1430241 () Bool)

(assert (=> b!1552366 m!1430241))

(declare-fun m!1430243 () Bool)

(assert (=> bm!71287 m!1430243))

(assert (=> b!1552186 d!160791))

(declare-fun d!160793 () Bool)

(declare-datatypes ((Option!810 0))(
  ( (Some!809 (v!21986 V!59389)) (None!808) )
))
(declare-fun get!26038 (Option!810) V!59389)

(declare-fun getValueByKey!735 (List!36259 (_ BitVec 64)) Option!810)

(assert (=> d!160793 (= (apply!1097 lt!669015 (select (arr!49970 _keys!618) from!762)) (get!26038 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762))))))

(declare-fun bs!44555 () Bool)

(assert (= bs!44555 d!160793))

(assert (=> bs!44555 m!1430059))

(declare-fun m!1430245 () Bool)

(assert (=> bs!44555 m!1430245))

(assert (=> bs!44555 m!1430245))

(declare-fun m!1430247 () Bool)

(assert (=> bs!44555 m!1430247))

(assert (=> b!1552162 d!160793))

(declare-fun d!160795 () Bool)

(assert (=> d!160795 (contains!10087 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49970 _keys!618) from!762))))

(declare-fun lt!669098 () Unit!51522)

(declare-fun choose!2044 (ListLongMap!22421 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51522)

(assert (=> d!160795 (= lt!669098 (choose!2044 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160795 (contains!10087 lt!669010 (select (arr!49970 _keys!618) from!762))))

(assert (=> d!160795 (= (addStillContains!1298 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)) lt!669098)))

(declare-fun bs!44556 () Bool)

(assert (= bs!44556 d!160795))

(assert (=> bs!44556 m!1430093))

(assert (=> bs!44556 m!1430093))

(assert (=> bs!44556 m!1430059))

(declare-fun m!1430249 () Bool)

(assert (=> bs!44556 m!1430249))

(assert (=> bs!44556 m!1430059))

(declare-fun m!1430251 () Bool)

(assert (=> bs!44556 m!1430251))

(assert (=> bs!44556 m!1430059))

(declare-fun m!1430253 () Bool)

(assert (=> bs!44556 m!1430253))

(assert (=> b!1552162 d!160795))

(declare-fun d!160797 () Bool)

(assert (=> d!160797 (= (apply!1097 lt!669010 (select (arr!49970 _keys!618) from!762)) (get!26038 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762))))))

(declare-fun bs!44557 () Bool)

(assert (= bs!44557 d!160797))

(assert (=> bs!44557 m!1430059))

(declare-fun m!1430255 () Bool)

(assert (=> bs!44557 m!1430255))

(assert (=> bs!44557 m!1430255))

(declare-fun m!1430257 () Bool)

(assert (=> bs!44557 m!1430257))

(assert (=> b!1552162 d!160797))

(declare-fun d!160799 () Bool)

(assert (=> d!160799 (= (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49970 _keys!618) from!762)) (get!26038 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun bs!44558 () Bool)

(assert (= bs!44558 d!160799))

(assert (=> bs!44558 m!1430059))

(declare-fun m!1430259 () Bool)

(assert (=> bs!44558 m!1430259))

(assert (=> bs!44558 m!1430259))

(declare-fun m!1430261 () Bool)

(assert (=> bs!44558 m!1430261))

(assert (=> b!1552162 d!160799))

(declare-fun b!1552393 () Bool)

(declare-fun e!864214 () Bool)

(declare-fun lt!669115 () ListLongMap!22421)

(declare-fun isEmpty!1137 (ListLongMap!22421) Bool)

(assert (=> b!1552393 (= e!864214 (isEmpty!1137 lt!669115))))

(declare-fun b!1552394 () Bool)

(declare-fun e!864209 () Bool)

(declare-fun e!864211 () Bool)

(assert (=> b!1552394 (= e!864209 e!864211)))

(declare-fun c!142956 () Bool)

(declare-fun e!864208 () Bool)

(assert (=> b!1552394 (= c!142956 e!864208)))

(declare-fun res!1062827 () Bool)

(assert (=> b!1552394 (=> (not res!1062827) (not e!864208))))

(assert (=> b!1552394 (= res!1062827 (bvslt from!762 (size!50522 _keys!618)))))

(declare-fun b!1552395 () Bool)

(declare-fun lt!669119 () Unit!51522)

(declare-fun lt!669113 () Unit!51522)

(assert (=> b!1552395 (= lt!669119 lt!669113)))

(declare-fun lt!669118 () (_ BitVec 64))

(declare-fun lt!669114 () (_ BitVec 64))

(declare-fun lt!669117 () V!59389)

(declare-fun lt!669116 () ListLongMap!22421)

(assert (=> b!1552395 (not (contains!10087 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)) lt!669118))))

(declare-fun addStillNotContains!501 (ListLongMap!22421 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51522)

(assert (=> b!1552395 (= lt!669113 (addStillNotContains!501 lt!669116 lt!669114 lt!669117 lt!669118))))

(assert (=> b!1552395 (= lt!669118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1552395 (= lt!669117 (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1552395 (= lt!669114 (select (arr!49970 _keys!618) from!762))))

(declare-fun call!71293 () ListLongMap!22421)

(assert (=> b!1552395 (= lt!669116 call!71293)))

(declare-fun e!864213 () ListLongMap!22421)

(assert (=> b!1552395 (= e!864213 (+!5040 call!71293 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552396 () Bool)

(assert (=> b!1552396 (= e!864214 (= lt!669115 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1552397 () Bool)

(declare-fun e!864212 () ListLongMap!22421)

(assert (=> b!1552397 (= e!864212 e!864213)))

(declare-fun c!142959 () Bool)

(assert (=> b!1552397 (= c!142959 (validKeyInArray!0 (select (arr!49970 _keys!618) from!762)))))

(declare-fun d!160801 () Bool)

(assert (=> d!160801 e!864209))

(declare-fun res!1062826 () Bool)

(assert (=> d!160801 (=> (not res!1062826) (not e!864209))))

(assert (=> d!160801 (= res!1062826 (not (contains!10087 lt!669115 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160801 (= lt!669115 e!864212)))

(declare-fun c!142958 () Bool)

(assert (=> d!160801 (= c!142958 (bvsge from!762 (size!50522 _keys!618)))))

(assert (=> d!160801 (validMask!0 mask!926)))

(assert (=> d!160801 (= (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!669115)))

(declare-fun bm!71290 () Bool)

(assert (=> bm!71290 (= call!71293 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1552398 () Bool)

(assert (=> b!1552398 (= e!864211 e!864214)))

(declare-fun c!142957 () Bool)

(assert (=> b!1552398 (= c!142957 (bvslt from!762 (size!50522 _keys!618)))))

(declare-fun b!1552399 () Bool)

(declare-fun res!1062828 () Bool)

(assert (=> b!1552399 (=> (not res!1062828) (not e!864209))))

(assert (=> b!1552399 (= res!1062828 (not (contains!10087 lt!669115 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552400 () Bool)

(assert (=> b!1552400 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50522 _keys!618)))))

(assert (=> b!1552400 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50523 _values!470)))))

(declare-fun e!864210 () Bool)

(assert (=> b!1552400 (= e!864210 (= (apply!1097 lt!669115 (select (arr!49970 _keys!618) from!762)) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552401 () Bool)

(assert (=> b!1552401 (= e!864208 (validKeyInArray!0 (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552401 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1552402 () Bool)

(assert (=> b!1552402 (= e!864213 call!71293)))

(declare-fun b!1552403 () Bool)

(assert (=> b!1552403 (= e!864211 e!864210)))

(assert (=> b!1552403 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50522 _keys!618)))))

(declare-fun res!1062829 () Bool)

(assert (=> b!1552403 (= res!1062829 (contains!10087 lt!669115 (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552403 (=> (not res!1062829) (not e!864210))))

(declare-fun b!1552404 () Bool)

(assert (=> b!1552404 (= e!864212 (ListLongMap!22422 Nil!36256))))

(assert (= (and d!160801 c!142958) b!1552404))

(assert (= (and d!160801 (not c!142958)) b!1552397))

(assert (= (and b!1552397 c!142959) b!1552395))

(assert (= (and b!1552397 (not c!142959)) b!1552402))

(assert (= (or b!1552395 b!1552402) bm!71290))

(assert (= (and d!160801 res!1062826) b!1552399))

(assert (= (and b!1552399 res!1062828) b!1552394))

(assert (= (and b!1552394 res!1062827) b!1552401))

(assert (= (and b!1552394 c!142956) b!1552403))

(assert (= (and b!1552394 (not c!142956)) b!1552398))

(assert (= (and b!1552403 res!1062829) b!1552400))

(assert (= (and b!1552398 c!142957) b!1552396))

(assert (= (and b!1552398 (not c!142957)) b!1552393))

(declare-fun b_lambda!24785 () Bool)

(assert (=> (not b_lambda!24785) (not b!1552395)))

(assert (=> b!1552395 t!50966))

(declare-fun b_and!51365 () Bool)

(assert (= b_and!51355 (and (=> t!50966 result!26077) b_and!51365)))

(declare-fun b_lambda!24787 () Bool)

(assert (=> (not b_lambda!24787) (not b!1552400)))

(assert (=> b!1552400 t!50966))

(declare-fun b_and!51367 () Bool)

(assert (= b_and!51365 (and (=> t!50966 result!26077) b_and!51367)))

(assert (=> b!1552400 m!1430109))

(assert (=> b!1552400 m!1430111))

(assert (=> b!1552400 m!1430113))

(assert (=> b!1552400 m!1430111))

(assert (=> b!1552400 m!1430059))

(declare-fun m!1430263 () Bool)

(assert (=> b!1552400 m!1430263))

(assert (=> b!1552400 m!1430109))

(assert (=> b!1552400 m!1430059))

(declare-fun m!1430265 () Bool)

(assert (=> d!160801 m!1430265))

(assert (=> d!160801 m!1430073))

(assert (=> b!1552401 m!1430059))

(assert (=> b!1552401 m!1430059))

(assert (=> b!1552401 m!1430061))

(declare-fun m!1430267 () Bool)

(assert (=> b!1552396 m!1430267))

(assert (=> bm!71290 m!1430267))

(assert (=> b!1552395 m!1430109))

(assert (=> b!1552395 m!1430111))

(assert (=> b!1552395 m!1430113))

(declare-fun m!1430269 () Bool)

(assert (=> b!1552395 m!1430269))

(assert (=> b!1552395 m!1430111))

(declare-fun m!1430271 () Bool)

(assert (=> b!1552395 m!1430271))

(assert (=> b!1552395 m!1430271))

(declare-fun m!1430273 () Bool)

(assert (=> b!1552395 m!1430273))

(declare-fun m!1430275 () Bool)

(assert (=> b!1552395 m!1430275))

(assert (=> b!1552395 m!1430109))

(assert (=> b!1552395 m!1430059))

(assert (=> b!1552397 m!1430059))

(assert (=> b!1552397 m!1430059))

(assert (=> b!1552397 m!1430061))

(declare-fun m!1430277 () Bool)

(assert (=> b!1552393 m!1430277))

(assert (=> b!1552403 m!1430059))

(assert (=> b!1552403 m!1430059))

(declare-fun m!1430279 () Bool)

(assert (=> b!1552403 m!1430279))

(declare-fun m!1430281 () Bool)

(assert (=> b!1552399 m!1430281))

(assert (=> b!1552162 d!160801))

(declare-fun d!160803 () Bool)

(assert (=> d!160803 (= (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49970 _keys!618) from!762)) (apply!1097 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669122 () Unit!51522)

(declare-fun choose!2045 (ListLongMap!22421 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51522)

(assert (=> d!160803 (= lt!669122 (choose!2045 lt!669010 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864217 () Bool)

(assert (=> d!160803 e!864217))

(declare-fun res!1062832 () Bool)

(assert (=> d!160803 (=> (not res!1062832) (not e!864217))))

(assert (=> d!160803 (= res!1062832 (contains!10087 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160803 (= (addApplyDifferent!633 lt!669010 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49970 _keys!618) from!762)) lt!669122)))

(declare-fun b!1552408 () Bool)

(assert (=> b!1552408 (= e!864217 (not (= (select (arr!49970 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160803 res!1062832) b!1552408))

(assert (=> d!160803 m!1430059))

(assert (=> d!160803 m!1430095))

(assert (=> d!160803 m!1430059))

(assert (=> d!160803 m!1430253))

(assert (=> d!160803 m!1430081))

(assert (=> d!160803 m!1430081))

(assert (=> d!160803 m!1430059))

(assert (=> d!160803 m!1430083))

(assert (=> d!160803 m!1430059))

(declare-fun m!1430283 () Bool)

(assert (=> d!160803 m!1430283))

(assert (=> b!1552162 d!160803))

(declare-fun d!160805 () Bool)

(declare-fun e!864222 () Bool)

(assert (=> d!160805 e!864222))

(declare-fun res!1062835 () Bool)

(assert (=> d!160805 (=> res!1062835 e!864222)))

(declare-fun lt!669133 () Bool)

(assert (=> d!160805 (= res!1062835 (not lt!669133))))

(declare-fun lt!669131 () Bool)

(assert (=> d!160805 (= lt!669133 lt!669131)))

(declare-fun lt!669134 () Unit!51522)

(declare-fun e!864223 () Unit!51522)

(assert (=> d!160805 (= lt!669134 e!864223)))

(declare-fun c!142962 () Bool)

(assert (=> d!160805 (= c!142962 lt!669131)))

(declare-fun containsKey!752 (List!36259 (_ BitVec 64)) Bool)

(assert (=> d!160805 (= lt!669131 (containsKey!752 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160805 (= (contains!10087 lt!669015 (select (arr!49970 _keys!618) from!762)) lt!669133)))

(declare-fun b!1552415 () Bool)

(declare-fun lt!669132 () Unit!51522)

(assert (=> b!1552415 (= e!864223 lt!669132)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!499 (List!36259 (_ BitVec 64)) Unit!51522)

(assert (=> b!1552415 (= lt!669132 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(declare-fun isDefined!551 (Option!810) Bool)

(assert (=> b!1552415 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(declare-fun b!1552416 () Bool)

(declare-fun Unit!51530 () Unit!51522)

(assert (=> b!1552416 (= e!864223 Unit!51530)))

(declare-fun b!1552417 () Bool)

(assert (=> b!1552417 (= e!864222 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762))))))

(assert (= (and d!160805 c!142962) b!1552415))

(assert (= (and d!160805 (not c!142962)) b!1552416))

(assert (= (and d!160805 (not res!1062835)) b!1552417))

(assert (=> d!160805 m!1430059))

(declare-fun m!1430285 () Bool)

(assert (=> d!160805 m!1430285))

(assert (=> b!1552415 m!1430059))

(declare-fun m!1430287 () Bool)

(assert (=> b!1552415 m!1430287))

(assert (=> b!1552415 m!1430059))

(assert (=> b!1552415 m!1430245))

(assert (=> b!1552415 m!1430245))

(declare-fun m!1430289 () Bool)

(assert (=> b!1552415 m!1430289))

(assert (=> b!1552417 m!1430059))

(assert (=> b!1552417 m!1430245))

(assert (=> b!1552417 m!1430245))

(assert (=> b!1552417 m!1430289))

(assert (=> b!1552162 d!160805))

(declare-fun d!160807 () Bool)

(assert (=> d!160807 (= (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49970 _keys!618) from!762)) (apply!1097 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669135 () Unit!51522)

(assert (=> d!160807 (= lt!669135 (choose!2045 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864224 () Bool)

(assert (=> d!160807 e!864224))

(declare-fun res!1062836 () Bool)

(assert (=> d!160807 (=> (not res!1062836) (not e!864224))))

(assert (=> d!160807 (= res!1062836 (contains!10087 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160807 (= (addApplyDifferent!633 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)) lt!669135)))

(declare-fun b!1552418 () Bool)

(assert (=> b!1552418 (= e!864224 (not (= (select (arr!49970 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160807 res!1062836) b!1552418))

(assert (=> d!160807 m!1430059))

(assert (=> d!160807 m!1430095))

(assert (=> d!160807 m!1430059))

(assert (=> d!160807 m!1430253))

(assert (=> d!160807 m!1430093))

(assert (=> d!160807 m!1430093))

(assert (=> d!160807 m!1430059))

(declare-fun m!1430291 () Bool)

(assert (=> d!160807 m!1430291))

(assert (=> d!160807 m!1430059))

(declare-fun m!1430293 () Bool)

(assert (=> d!160807 m!1430293))

(assert (=> b!1552162 d!160807))

(declare-fun d!160809 () Bool)

(declare-fun e!864227 () Bool)

(assert (=> d!160809 e!864227))

(declare-fun res!1062842 () Bool)

(assert (=> d!160809 (=> (not res!1062842) (not e!864227))))

(declare-fun lt!669144 () ListLongMap!22421)

(assert (=> d!160809 (= res!1062842 (contains!10087 lt!669144 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669146 () List!36259)

(assert (=> d!160809 (= lt!669144 (ListLongMap!22422 lt!669146))))

(declare-fun lt!669147 () Unit!51522)

(declare-fun lt!669145 () Unit!51522)

(assert (=> d!160809 (= lt!669147 lt!669145)))

(assert (=> d!160809 (= (getValueByKey!735 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!375 (List!36259 (_ BitVec 64) V!59389) Unit!51522)

(assert (=> d!160809 (= lt!669145 (lemmaContainsTupThenGetReturnValue!375 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!504 (List!36259 (_ BitVec 64) V!59389) List!36259)

(assert (=> d!160809 (= lt!669146 (insertStrictlySorted!504 (toList!11226 lt!669010) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160809 (= (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669144)))

(declare-fun b!1552423 () Bool)

(declare-fun res!1062841 () Bool)

(assert (=> b!1552423 (=> (not res!1062841) (not e!864227))))

(assert (=> b!1552423 (= res!1062841 (= (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552424 () Bool)

(declare-fun contains!10090 (List!36259 tuple2!24812) Bool)

(assert (=> b!1552424 (= e!864227 (contains!10090 (toList!11226 lt!669144) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160809 res!1062842) b!1552423))

(assert (= (and b!1552423 res!1062841) b!1552424))

(declare-fun m!1430295 () Bool)

(assert (=> d!160809 m!1430295))

(declare-fun m!1430297 () Bool)

(assert (=> d!160809 m!1430297))

(declare-fun m!1430299 () Bool)

(assert (=> d!160809 m!1430299))

(declare-fun m!1430301 () Bool)

(assert (=> d!160809 m!1430301))

(declare-fun m!1430303 () Bool)

(assert (=> b!1552423 m!1430303))

(declare-fun m!1430305 () Bool)

(assert (=> b!1552424 m!1430305))

(assert (=> b!1552162 d!160809))

(declare-fun d!160811 () Bool)

(declare-fun e!864228 () Bool)

(assert (=> d!160811 e!864228))

(declare-fun res!1062844 () Bool)

(assert (=> d!160811 (=> (not res!1062844) (not e!864228))))

(declare-fun lt!669148 () ListLongMap!22421)

(assert (=> d!160811 (= res!1062844 (contains!10087 lt!669148 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669150 () List!36259)

(assert (=> d!160811 (= lt!669148 (ListLongMap!22422 lt!669150))))

(declare-fun lt!669151 () Unit!51522)

(declare-fun lt!669149 () Unit!51522)

(assert (=> d!160811 (= lt!669151 lt!669149)))

(assert (=> d!160811 (= (getValueByKey!735 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160811 (= lt!669149 (lemmaContainsTupThenGetReturnValue!375 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160811 (= lt!669150 (insertStrictlySorted!504 (toList!11226 lt!669010) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160811 (= (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669148)))

(declare-fun b!1552425 () Bool)

(declare-fun res!1062843 () Bool)

(assert (=> b!1552425 (=> (not res!1062843) (not e!864228))))

(assert (=> b!1552425 (= res!1062843 (= (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552426 () Bool)

(assert (=> b!1552426 (= e!864228 (contains!10090 (toList!11226 lt!669148) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160811 res!1062844) b!1552425))

(assert (= (and b!1552425 res!1062843) b!1552426))

(declare-fun m!1430307 () Bool)

(assert (=> d!160811 m!1430307))

(declare-fun m!1430309 () Bool)

(assert (=> d!160811 m!1430309))

(declare-fun m!1430311 () Bool)

(assert (=> d!160811 m!1430311))

(declare-fun m!1430313 () Bool)

(assert (=> d!160811 m!1430313))

(declare-fun m!1430315 () Bool)

(assert (=> b!1552425 m!1430315))

(declare-fun m!1430317 () Bool)

(assert (=> b!1552426 m!1430317))

(assert (=> b!1552162 d!160811))

(declare-fun d!160813 () Bool)

(declare-fun e!864229 () Bool)

(assert (=> d!160813 e!864229))

(declare-fun res!1062846 () Bool)

(assert (=> d!160813 (=> (not res!1062846) (not e!864229))))

(declare-fun lt!669152 () ListLongMap!22421)

(assert (=> d!160813 (= res!1062846 (contains!10087 lt!669152 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669154 () List!36259)

(assert (=> d!160813 (= lt!669152 (ListLongMap!22422 lt!669154))))

(declare-fun lt!669155 () Unit!51522)

(declare-fun lt!669153 () Unit!51522)

(assert (=> d!160813 (= lt!669155 lt!669153)))

(assert (=> d!160813 (= (getValueByKey!735 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160813 (= lt!669153 (lemmaContainsTupThenGetReturnValue!375 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160813 (= lt!669154 (insertStrictlySorted!504 (toList!11226 call!71243) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160813 (= (+!5040 call!71243 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669152)))

(declare-fun b!1552427 () Bool)

(declare-fun res!1062845 () Bool)

(assert (=> b!1552427 (=> (not res!1062845) (not e!864229))))

(assert (=> b!1552427 (= res!1062845 (= (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552428 () Bool)

(assert (=> b!1552428 (= e!864229 (contains!10090 (toList!11226 lt!669152) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160813 res!1062846) b!1552427))

(assert (= (and b!1552427 res!1062845) b!1552428))

(declare-fun m!1430319 () Bool)

(assert (=> d!160813 m!1430319))

(declare-fun m!1430321 () Bool)

(assert (=> d!160813 m!1430321))

(declare-fun m!1430323 () Bool)

(assert (=> d!160813 m!1430323))

(declare-fun m!1430325 () Bool)

(assert (=> d!160813 m!1430325))

(declare-fun m!1430327 () Bool)

(assert (=> b!1552427 m!1430327))

(declare-fun m!1430329 () Bool)

(assert (=> b!1552428 m!1430329))

(assert (=> b!1552180 d!160813))

(declare-fun d!160815 () Bool)

(declare-fun e!864230 () Bool)

(assert (=> d!160815 e!864230))

(declare-fun res!1062847 () Bool)

(assert (=> d!160815 (=> res!1062847 e!864230)))

(declare-fun lt!669158 () Bool)

(assert (=> d!160815 (= res!1062847 (not lt!669158))))

(declare-fun lt!669156 () Bool)

(assert (=> d!160815 (= lt!669158 lt!669156)))

(declare-fun lt!669159 () Unit!51522)

(declare-fun e!864231 () Unit!51522)

(assert (=> d!160815 (= lt!669159 e!864231)))

(declare-fun c!142963 () Bool)

(assert (=> d!160815 (= c!142963 lt!669156)))

(assert (=> d!160815 (= lt!669156 (containsKey!752 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!160815 (= (contains!10087 lt!669012 #b1000000000000000000000000000000000000000000000000000000000000000) lt!669158)))

(declare-fun b!1552429 () Bool)

(declare-fun lt!669157 () Unit!51522)

(assert (=> b!1552429 (= e!864231 lt!669157)))

(assert (=> b!1552429 (= lt!669157 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552429 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552430 () Bool)

(declare-fun Unit!51531 () Unit!51522)

(assert (=> b!1552430 (= e!864231 Unit!51531)))

(declare-fun b!1552431 () Bool)

(assert (=> b!1552431 (= e!864230 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160815 c!142963) b!1552429))

(assert (= (and d!160815 (not c!142963)) b!1552430))

(assert (= (and d!160815 (not res!1062847)) b!1552431))

(declare-fun m!1430331 () Bool)

(assert (=> d!160815 m!1430331))

(declare-fun m!1430333 () Bool)

(assert (=> b!1552429 m!1430333))

(declare-fun m!1430335 () Bool)

(assert (=> b!1552429 m!1430335))

(assert (=> b!1552429 m!1430335))

(declare-fun m!1430337 () Bool)

(assert (=> b!1552429 m!1430337))

(assert (=> b!1552431 m!1430335))

(assert (=> b!1552431 m!1430335))

(assert (=> b!1552431 m!1430337))

(assert (=> bm!71238 d!160815))

(declare-fun d!160817 () Bool)

(assert (=> d!160817 (= (apply!1097 lt!669012 (select (arr!49970 _keys!618) from!762)) (get!26038 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762))))))

(declare-fun bs!44559 () Bool)

(assert (= bs!44559 d!160817))

(assert (=> bs!44559 m!1430059))

(declare-fun m!1430339 () Bool)

(assert (=> bs!44559 m!1430339))

(assert (=> bs!44559 m!1430339))

(declare-fun m!1430341 () Bool)

(assert (=> bs!44559 m!1430341))

(assert (=> b!1552173 d!160817))

(declare-fun d!160819 () Bool)

(declare-fun c!142966 () Bool)

(assert (=> d!160819 (= c!142966 ((_ is ValueCellFull!18194) (select (arr!49971 _values!470) from!762)))))

(declare-fun e!864234 () V!59389)

(assert (=> d!160819 (= (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) e!864234)))

(declare-fun b!1552436 () Bool)

(declare-fun get!26039 (ValueCell!18194 V!59389) V!59389)

(assert (=> b!1552436 (= e!864234 (get!26039 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552437 () Bool)

(declare-fun get!26040 (ValueCell!18194 V!59389) V!59389)

(assert (=> b!1552437 (= e!864234 (get!26040 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160819 c!142966) b!1552436))

(assert (= (and d!160819 (not c!142966)) b!1552437))

(assert (=> b!1552436 m!1430109))

(assert (=> b!1552436 m!1430111))

(declare-fun m!1430343 () Bool)

(assert (=> b!1552436 m!1430343))

(assert (=> b!1552437 m!1430109))

(assert (=> b!1552437 m!1430111))

(declare-fun m!1430345 () Bool)

(assert (=> b!1552437 m!1430345))

(assert (=> b!1552173 d!160819))

(declare-fun d!160821 () Bool)

(declare-fun e!864235 () Bool)

(assert (=> d!160821 e!864235))

(declare-fun res!1062848 () Bool)

(assert (=> d!160821 (=> res!1062848 e!864235)))

(declare-fun lt!669162 () Bool)

(assert (=> d!160821 (= res!1062848 (not lt!669162))))

(declare-fun lt!669160 () Bool)

(assert (=> d!160821 (= lt!669162 lt!669160)))

(declare-fun lt!669163 () Unit!51522)

(declare-fun e!864236 () Unit!51522)

(assert (=> d!160821 (= lt!669163 e!864236)))

(declare-fun c!142967 () Bool)

(assert (=> d!160821 (= c!142967 lt!669160)))

(assert (=> d!160821 (= lt!669160 (containsKey!752 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!160821 (= (contains!10087 lt!669012 #b0000000000000000000000000000000000000000000000000000000000000000) lt!669162)))

(declare-fun b!1552438 () Bool)

(declare-fun lt!669161 () Unit!51522)

(assert (=> b!1552438 (= e!864236 lt!669161)))

(assert (=> b!1552438 (= lt!669161 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552438 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552439 () Bool)

(declare-fun Unit!51532 () Unit!51522)

(assert (=> b!1552439 (= e!864236 Unit!51532)))

(declare-fun b!1552440 () Bool)

(assert (=> b!1552440 (= e!864235 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160821 c!142967) b!1552438))

(assert (= (and d!160821 (not c!142967)) b!1552439))

(assert (= (and d!160821 (not res!1062848)) b!1552440))

(declare-fun m!1430347 () Bool)

(assert (=> d!160821 m!1430347))

(declare-fun m!1430349 () Bool)

(assert (=> b!1552438 m!1430349))

(declare-fun m!1430351 () Bool)

(assert (=> b!1552438 m!1430351))

(assert (=> b!1552438 m!1430351))

(declare-fun m!1430353 () Bool)

(assert (=> b!1552438 m!1430353))

(assert (=> b!1552440 m!1430351))

(assert (=> b!1552440 m!1430351))

(assert (=> b!1552440 m!1430353))

(assert (=> bm!71242 d!160821))

(declare-fun bm!71293 () Bool)

(declare-fun call!71296 () Bool)

(declare-fun c!142970 () Bool)

(assert (=> bm!71293 (= call!71296 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)))))

(declare-fun b!1552451 () Bool)

(declare-fun e!864246 () Bool)

(assert (=> b!1552451 (= e!864246 call!71296)))

(declare-fun b!1552452 () Bool)

(declare-fun e!864245 () Bool)

(declare-fun e!864248 () Bool)

(assert (=> b!1552452 (= e!864245 e!864248)))

(declare-fun res!1062857 () Bool)

(assert (=> b!1552452 (=> (not res!1062857) (not e!864248))))

(declare-fun e!864247 () Bool)

(assert (=> b!1552452 (= res!1062857 (not e!864247))))

(declare-fun res!1062856 () Bool)

(assert (=> b!1552452 (=> (not res!1062856) (not e!864247))))

(assert (=> b!1552452 (= res!1062856 (validKeyInArray!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160823 () Bool)

(declare-fun res!1062855 () Bool)

(assert (=> d!160823 (=> res!1062855 e!864245)))

(assert (=> d!160823 (= res!1062855 (bvsge #b00000000000000000000000000000000 (size!50522 _keys!618)))))

(assert (=> d!160823 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36257) e!864245)))

(declare-fun b!1552453 () Bool)

(declare-fun contains!10091 (List!36260 (_ BitVec 64)) Bool)

(assert (=> b!1552453 (= e!864247 (contains!10091 Nil!36257 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1552454 () Bool)

(assert (=> b!1552454 (= e!864246 call!71296)))

(declare-fun b!1552455 () Bool)

(assert (=> b!1552455 (= e!864248 e!864246)))

(assert (=> b!1552455 (= c!142970 (validKeyInArray!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160823 (not res!1062855)) b!1552452))

(assert (= (and b!1552452 res!1062856) b!1552453))

(assert (= (and b!1552452 res!1062857) b!1552455))

(assert (= (and b!1552455 c!142970) b!1552454))

(assert (= (and b!1552455 (not c!142970)) b!1552451))

(assert (= (or b!1552454 b!1552451) bm!71293))

(assert (=> bm!71293 m!1430233))

(declare-fun m!1430355 () Bool)

(assert (=> bm!71293 m!1430355))

(assert (=> b!1552452 m!1430233))

(assert (=> b!1552452 m!1430233))

(assert (=> b!1552452 m!1430235))

(assert (=> b!1552453 m!1430233))

(assert (=> b!1552453 m!1430233))

(declare-fun m!1430357 () Bool)

(assert (=> b!1552453 m!1430357))

(assert (=> b!1552455 m!1430233))

(assert (=> b!1552455 m!1430233))

(assert (=> b!1552455 m!1430235))

(assert (=> b!1552169 d!160823))

(assert (=> bm!71241 d!160801))

(declare-fun d!160825 () Bool)

(assert (=> d!160825 (= (apply!1097 lt!669012 #b0000000000000000000000000000000000000000000000000000000000000000) (get!26038 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!44560 () Bool)

(assert (= bs!44560 d!160825))

(assert (=> bs!44560 m!1430351))

(assert (=> bs!44560 m!1430351))

(declare-fun m!1430359 () Bool)

(assert (=> bs!44560 m!1430359))

(assert (=> b!1552161 d!160825))

(declare-fun d!160827 () Bool)

(declare-fun e!864249 () Bool)

(assert (=> d!160827 e!864249))

(declare-fun res!1062858 () Bool)

(assert (=> d!160827 (=> res!1062858 e!864249)))

(declare-fun lt!669166 () Bool)

(assert (=> d!160827 (= res!1062858 (not lt!669166))))

(declare-fun lt!669164 () Bool)

(assert (=> d!160827 (= lt!669166 lt!669164)))

(declare-fun lt!669167 () Unit!51522)

(declare-fun e!864250 () Unit!51522)

(assert (=> d!160827 (= lt!669167 e!864250)))

(declare-fun c!142971 () Bool)

(assert (=> d!160827 (= c!142971 lt!669164)))

(assert (=> d!160827 (= lt!669164 (containsKey!752 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160827 (= (contains!10087 lt!669012 (select (arr!49970 _keys!618) from!762)) lt!669166)))

(declare-fun b!1552456 () Bool)

(declare-fun lt!669165 () Unit!51522)

(assert (=> b!1552456 (= e!864250 lt!669165)))

(assert (=> b!1552456 (= lt!669165 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552456 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(declare-fun b!1552457 () Bool)

(declare-fun Unit!51533 () Unit!51522)

(assert (=> b!1552457 (= e!864250 Unit!51533)))

(declare-fun b!1552458 () Bool)

(assert (=> b!1552458 (= e!864249 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762))))))

(assert (= (and d!160827 c!142971) b!1552456))

(assert (= (and d!160827 (not c!142971)) b!1552457))

(assert (= (and d!160827 (not res!1062858)) b!1552458))

(assert (=> d!160827 m!1430059))

(declare-fun m!1430361 () Bool)

(assert (=> d!160827 m!1430361))

(assert (=> b!1552456 m!1430059))

(declare-fun m!1430363 () Bool)

(assert (=> b!1552456 m!1430363))

(assert (=> b!1552456 m!1430059))

(assert (=> b!1552456 m!1430339))

(assert (=> b!1552456 m!1430339))

(declare-fun m!1430365 () Bool)

(assert (=> b!1552456 m!1430365))

(assert (=> b!1552458 m!1430059))

(assert (=> b!1552458 m!1430339))

(assert (=> b!1552458 m!1430339))

(assert (=> b!1552458 m!1430365))

(assert (=> b!1552167 d!160827))

(declare-fun d!160829 () Bool)

(assert (=> d!160829 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132256 d!160829))

(declare-fun d!160831 () Bool)

(assert (=> d!160831 (= (array_inv!39049 _keys!618) (bvsge (size!50522 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132256 d!160831))

(declare-fun d!160833 () Bool)

(assert (=> d!160833 (= (array_inv!39050 _values!470) (bvsge (size!50523 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132256 d!160833))

(declare-fun d!160835 () Bool)

(assert (=> d!160835 (= (validKeyInArray!0 (select (arr!49970 _keys!618) from!762)) (and (not (= (select (arr!49970 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49970 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552164 d!160835))

(declare-fun d!160837 () Bool)

(declare-fun e!864251 () Bool)

(assert (=> d!160837 e!864251))

(declare-fun res!1062860 () Bool)

(assert (=> d!160837 (=> (not res!1062860) (not e!864251))))

(declare-fun lt!669168 () ListLongMap!22421)

(assert (=> d!160837 (= res!1062860 (contains!10087 lt!669168 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669170 () List!36259)

(assert (=> d!160837 (= lt!669168 (ListLongMap!22422 lt!669170))))

(declare-fun lt!669171 () Unit!51522)

(declare-fun lt!669169 () Unit!51522)

(assert (=> d!160837 (= lt!669171 lt!669169)))

(assert (=> d!160837 (= (getValueByKey!735 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!809 (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160837 (= lt!669169 (lemmaContainsTupThenGetReturnValue!375 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160837 (= lt!669170 (insertStrictlySorted!504 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160837 (= (+!5040 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669168)))

(declare-fun b!1552459 () Bool)

(declare-fun res!1062859 () Bool)

(assert (=> b!1552459 (=> (not res!1062859) (not e!864251))))

(assert (=> b!1552459 (= res!1062859 (= (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!809 (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552460 () Bool)

(assert (=> b!1552460 (= e!864251 (contains!10090 (toList!11226 lt!669168) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160837 res!1062860) b!1552459))

(assert (= (and b!1552459 res!1062859) b!1552460))

(declare-fun m!1430367 () Bool)

(assert (=> d!160837 m!1430367))

(declare-fun m!1430369 () Bool)

(assert (=> d!160837 m!1430369))

(declare-fun m!1430371 () Bool)

(assert (=> d!160837 m!1430371))

(declare-fun m!1430373 () Bool)

(assert (=> d!160837 m!1430373))

(declare-fun m!1430375 () Bool)

(assert (=> b!1552459 m!1430375))

(declare-fun m!1430377 () Bool)

(assert (=> b!1552460 m!1430377))

(assert (=> bm!71239 d!160837))

(declare-fun d!160839 () Bool)

(assert (=> d!160839 (= (apply!1097 lt!669012 #b1000000000000000000000000000000000000000000000000000000000000000) (get!26038 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!44561 () Bool)

(assert (= bs!44561 d!160839))

(assert (=> bs!44561 m!1430335))

(assert (=> bs!44561 m!1430335))

(declare-fun m!1430379 () Bool)

(assert (=> bs!44561 m!1430379))

(assert (=> b!1552174 d!160839))

(declare-fun condMapEmpty!59038 () Bool)

(declare-fun mapDefault!59038 () ValueCell!18194)

(assert (=> mapNonEmpty!59029 (= condMapEmpty!59038 (= mapRest!59029 ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59038)))))

(declare-fun e!864257 () Bool)

(declare-fun mapRes!59038 () Bool)

(assert (=> mapNonEmpty!59029 (= tp!112063 (and e!864257 mapRes!59038))))

(declare-fun b!1552467 () Bool)

(declare-fun e!864256 () Bool)

(assert (=> b!1552467 (= e!864256 tp_is_empty!38209)))

(declare-fun b!1552468 () Bool)

(assert (=> b!1552468 (= e!864257 tp_is_empty!38209)))

(declare-fun mapIsEmpty!59038 () Bool)

(assert (=> mapIsEmpty!59038 mapRes!59038))

(declare-fun mapNonEmpty!59038 () Bool)

(declare-fun tp!112079 () Bool)

(assert (=> mapNonEmpty!59038 (= mapRes!59038 (and tp!112079 e!864256))))

(declare-fun mapValue!59038 () ValueCell!18194)

(declare-fun mapKey!59038 () (_ BitVec 32))

(declare-fun mapRest!59038 () (Array (_ BitVec 32) ValueCell!18194))

(assert (=> mapNonEmpty!59038 (= mapRest!59029 (store mapRest!59038 mapKey!59038 mapValue!59038))))

(assert (= (and mapNonEmpty!59029 condMapEmpty!59038) mapIsEmpty!59038))

(assert (= (and mapNonEmpty!59029 (not condMapEmpty!59038)) mapNonEmpty!59038))

(assert (= (and mapNonEmpty!59038 ((_ is ValueCellFull!18194) mapValue!59038)) b!1552467))

(assert (= (and mapNonEmpty!59029 ((_ is ValueCellFull!18194) mapDefault!59038)) b!1552468))

(declare-fun m!1430381 () Bool)

(assert (=> mapNonEmpty!59038 m!1430381))

(declare-fun b_lambda!24789 () Bool)

(assert (= b_lambda!24787 (or (and start!132256 b_free!31933) b_lambda!24789)))

(declare-fun b_lambda!24791 () Bool)

(assert (= b_lambda!24785 (or (and start!132256 b_free!31933) b_lambda!24791)))

(check-sat (not b!1552452) (not mapNonEmpty!59038) (not d!160795) (not d!160803) (not d!160797) (not b!1552423) (not b!1552429) (not d!160793) (not d!160809) (not b_lambda!24789) (not b!1552395) b_and!51367 (not b!1552366) (not b!1552415) (not b!1552455) (not d!160799) (not b!1552426) (not b_next!31933) (not d!160815) (not b!1552393) (not d!160801) (not b!1552401) (not b!1552459) (not b!1552399) (not b!1552456) (not b!1552403) (not b!1552437) (not b_lambda!24783) (not d!160811) (not b!1552424) (not d!160813) (not b!1552365) tp_is_empty!38209 (not d!160825) (not bm!71287) (not b!1552458) (not b!1552396) (not d!160839) (not b!1552431) (not d!160807) (not d!160817) (not b!1552428) (not b!1552438) (not d!160821) (not b!1552417) (not bm!71290) (not b!1552397) (not b!1552460) (not b_lambda!24791) (not d!160837) (not b!1552425) (not b!1552453) (not b!1552436) (not b!1552440) (not b!1552400) (not d!160805) (not d!160827) (not b!1552427) (not bm!71293))
(check-sat b_and!51367 (not b_next!31933))
(get-model)

(declare-fun d!160841 () Bool)

(declare-fun res!1062865 () Bool)

(declare-fun e!864262 () Bool)

(assert (=> d!160841 (=> res!1062865 e!864262)))

(assert (=> d!160841 (= res!1062865 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (= (_1!12417 (h!37701 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160841 (= (containsKey!752 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000) e!864262)))

(declare-fun b!1552473 () Bool)

(declare-fun e!864263 () Bool)

(assert (=> b!1552473 (= e!864262 e!864263)))

(declare-fun res!1062866 () Bool)

(assert (=> b!1552473 (=> (not res!1062866) (not e!864263))))

(assert (=> b!1552473 (= res!1062866 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669012))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36255) (toList!11226 lt!669012)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552474 () Bool)

(assert (=> b!1552474 (= e!864263 (containsKey!752 (t!50967 (toList!11226 lt!669012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160841 (not res!1062865)) b!1552473))

(assert (= (and b!1552473 res!1062866) b!1552474))

(declare-fun m!1430383 () Bool)

(assert (=> b!1552474 m!1430383))

(assert (=> d!160815 d!160841))

(declare-fun d!160843 () Bool)

(assert (=> d!160843 (= (get!26038 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762))) (v!21986 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160817 d!160843))

(declare-fun c!142976 () Bool)

(declare-fun d!160845 () Bool)

(assert (=> d!160845 (= c!142976 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (= (_1!12417 (h!37701 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864268 () Option!810)

(assert (=> d!160845 (= (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)) e!864268)))

(declare-fun b!1552484 () Bool)

(declare-fun e!864269 () Option!810)

(assert (=> b!1552484 (= e!864268 e!864269)))

(declare-fun c!142977 () Bool)

(assert (=> b!1552484 (= c!142977 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552486 () Bool)

(assert (=> b!1552486 (= e!864269 None!808)))

(declare-fun b!1552483 () Bool)

(assert (=> b!1552483 (= e!864268 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669012)))))))

(declare-fun b!1552485 () Bool)

(assert (=> b!1552485 (= e!864269 (getValueByKey!735 (t!50967 (toList!11226 lt!669012)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160845 c!142976) b!1552483))

(assert (= (and d!160845 (not c!142976)) b!1552484))

(assert (= (and b!1552484 c!142977) b!1552485))

(assert (= (and b!1552484 (not c!142977)) b!1552486))

(assert (=> b!1552485 m!1430059))

(declare-fun m!1430385 () Bool)

(assert (=> b!1552485 m!1430385))

(assert (=> d!160817 d!160845))

(declare-fun d!160847 () Bool)

(declare-fun e!864270 () Bool)

(assert (=> d!160847 e!864270))

(declare-fun res!1062867 () Bool)

(assert (=> d!160847 (=> res!1062867 e!864270)))

(declare-fun lt!669174 () Bool)

(assert (=> d!160847 (= res!1062867 (not lt!669174))))

(declare-fun lt!669172 () Bool)

(assert (=> d!160847 (= lt!669174 lt!669172)))

(declare-fun lt!669175 () Unit!51522)

(declare-fun e!864271 () Unit!51522)

(assert (=> d!160847 (= lt!669175 e!864271)))

(declare-fun c!142978 () Bool)

(assert (=> d!160847 (= c!142978 lt!669172)))

(assert (=> d!160847 (= lt!669172 (containsKey!752 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160847 (= (contains!10087 lt!669152 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669174)))

(declare-fun b!1552487 () Bool)

(declare-fun lt!669173 () Unit!51522)

(assert (=> b!1552487 (= e!864271 lt!669173)))

(assert (=> b!1552487 (= lt!669173 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> b!1552487 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552488 () Bool)

(declare-fun Unit!51534 () Unit!51522)

(assert (=> b!1552488 (= e!864271 Unit!51534)))

(declare-fun b!1552489 () Bool)

(assert (=> b!1552489 (= e!864270 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!160847 c!142978) b!1552487))

(assert (= (and d!160847 (not c!142978)) b!1552488))

(assert (= (and d!160847 (not res!1062867)) b!1552489))

(declare-fun m!1430387 () Bool)

(assert (=> d!160847 m!1430387))

(declare-fun m!1430389 () Bool)

(assert (=> b!1552487 m!1430389))

(assert (=> b!1552487 m!1430327))

(assert (=> b!1552487 m!1430327))

(declare-fun m!1430391 () Bool)

(assert (=> b!1552487 m!1430391))

(assert (=> b!1552489 m!1430327))

(assert (=> b!1552489 m!1430327))

(assert (=> b!1552489 m!1430391))

(assert (=> d!160813 d!160847))

(declare-fun d!160849 () Bool)

(declare-fun c!142979 () Bool)

(assert (=> d!160849 (= c!142979 (and ((_ is Cons!36255) lt!669154) (= (_1!12417 (h!37701 lt!669154)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864272 () Option!810)

(assert (=> d!160849 (= (getValueByKey!735 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864272)))

(declare-fun b!1552491 () Bool)

(declare-fun e!864273 () Option!810)

(assert (=> b!1552491 (= e!864272 e!864273)))

(declare-fun c!142980 () Bool)

(assert (=> b!1552491 (= c!142980 (and ((_ is Cons!36255) lt!669154) (not (= (_1!12417 (h!37701 lt!669154)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552493 () Bool)

(assert (=> b!1552493 (= e!864273 None!808)))

(declare-fun b!1552490 () Bool)

(assert (=> b!1552490 (= e!864272 (Some!809 (_2!12417 (h!37701 lt!669154))))))

(declare-fun b!1552492 () Bool)

(assert (=> b!1552492 (= e!864273 (getValueByKey!735 (t!50967 lt!669154) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160849 c!142979) b!1552490))

(assert (= (and d!160849 (not c!142979)) b!1552491))

(assert (= (and b!1552491 c!142980) b!1552492))

(assert (= (and b!1552491 (not c!142980)) b!1552493))

(declare-fun m!1430393 () Bool)

(assert (=> b!1552492 m!1430393))

(assert (=> d!160813 d!160849))

(declare-fun d!160851 () Bool)

(assert (=> d!160851 (= (getValueByKey!735 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669178 () Unit!51522)

(declare-fun choose!2046 (List!36259 (_ BitVec 64) V!59389) Unit!51522)

(assert (=> d!160851 (= lt!669178 (choose!2046 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864276 () Bool)

(assert (=> d!160851 e!864276))

(declare-fun res!1062872 () Bool)

(assert (=> d!160851 (=> (not res!1062872) (not e!864276))))

(declare-fun isStrictlySorted!884 (List!36259) Bool)

(assert (=> d!160851 (= res!1062872 (isStrictlySorted!884 lt!669154))))

(assert (=> d!160851 (= (lemmaContainsTupThenGetReturnValue!375 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669178)))

(declare-fun b!1552498 () Bool)

(declare-fun res!1062873 () Bool)

(assert (=> b!1552498 (=> (not res!1062873) (not e!864276))))

(assert (=> b!1552498 (= res!1062873 (containsKey!752 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552499 () Bool)

(assert (=> b!1552499 (= e!864276 (contains!10090 lt!669154 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!160851 res!1062872) b!1552498))

(assert (= (and b!1552498 res!1062873) b!1552499))

(assert (=> d!160851 m!1430321))

(declare-fun m!1430395 () Bool)

(assert (=> d!160851 m!1430395))

(declare-fun m!1430397 () Bool)

(assert (=> d!160851 m!1430397))

(declare-fun m!1430399 () Bool)

(assert (=> b!1552498 m!1430399))

(declare-fun m!1430401 () Bool)

(assert (=> b!1552499 m!1430401))

(assert (=> d!160813 d!160851))

(declare-fun b!1552520 () Bool)

(declare-fun res!1062878 () Bool)

(declare-fun e!864289 () Bool)

(assert (=> b!1552520 (=> (not res!1062878) (not e!864289))))

(declare-fun lt!669181 () List!36259)

(assert (=> b!1552520 (= res!1062878 (containsKey!752 lt!669181 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552521 () Bool)

(assert (=> b!1552521 (= e!864289 (contains!10090 lt!669181 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552522 () Bool)

(declare-fun e!864290 () List!36259)

(assert (=> b!1552522 (= e!864290 (insertStrictlySorted!504 (t!50967 (toList!11226 call!71243)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun c!142992 () Bool)

(declare-fun c!142990 () Bool)

(declare-fun b!1552523 () Bool)

(assert (=> b!1552523 (= e!864290 (ite c!142992 (t!50967 (toList!11226 call!71243)) (ite c!142990 (Cons!36255 (h!37701 (toList!11226 call!71243)) (t!50967 (toList!11226 call!71243))) Nil!36256)))))

(declare-fun b!1552524 () Bool)

(declare-fun e!864288 () List!36259)

(declare-fun call!71304 () List!36259)

(assert (=> b!1552524 (= e!864288 call!71304)))

(declare-fun d!160853 () Bool)

(assert (=> d!160853 e!864289))

(declare-fun res!1062879 () Bool)

(assert (=> d!160853 (=> (not res!1062879) (not e!864289))))

(assert (=> d!160853 (= res!1062879 (isStrictlySorted!884 lt!669181))))

(declare-fun e!864287 () List!36259)

(assert (=> d!160853 (= lt!669181 e!864287)))

(declare-fun c!142989 () Bool)

(assert (=> d!160853 (= c!142989 (and ((_ is Cons!36255) (toList!11226 call!71243)) (bvslt (_1!12417 (h!37701 (toList!11226 call!71243))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160853 (isStrictlySorted!884 (toList!11226 call!71243))))

(assert (=> d!160853 (= (insertStrictlySorted!504 (toList!11226 call!71243) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669181)))

(declare-fun b!1552525 () Bool)

(declare-fun e!864291 () List!36259)

(assert (=> b!1552525 (= e!864287 e!864291)))

(assert (=> b!1552525 (= c!142992 (and ((_ is Cons!36255) (toList!11226 call!71243)) (= (_1!12417 (h!37701 (toList!11226 call!71243))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71300 () Bool)

(declare-fun call!71305 () List!36259)

(assert (=> bm!71300 (= call!71304 call!71305)))

(declare-fun b!1552526 () Bool)

(declare-fun call!71303 () List!36259)

(assert (=> b!1552526 (= e!864287 call!71303)))

(declare-fun b!1552527 () Bool)

(assert (=> b!1552527 (= e!864288 call!71304)))

(declare-fun bm!71301 () Bool)

(declare-fun $colon$colon!946 (List!36259 tuple2!24812) List!36259)

(assert (=> bm!71301 (= call!71303 ($colon$colon!946 e!864290 (ite c!142989 (h!37701 (toList!11226 call!71243)) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!142991 () Bool)

(assert (=> bm!71301 (= c!142991 c!142989)))

(declare-fun b!1552528 () Bool)

(assert (=> b!1552528 (= c!142990 (and ((_ is Cons!36255) (toList!11226 call!71243)) (bvsgt (_1!12417 (h!37701 (toList!11226 call!71243))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552528 (= e!864291 e!864288)))

(declare-fun b!1552529 () Bool)

(assert (=> b!1552529 (= e!864291 call!71305)))

(declare-fun bm!71302 () Bool)

(assert (=> bm!71302 (= call!71305 call!71303)))

(assert (= (and d!160853 c!142989) b!1552526))

(assert (= (and d!160853 (not c!142989)) b!1552525))

(assert (= (and b!1552525 c!142992) b!1552529))

(assert (= (and b!1552525 (not c!142992)) b!1552528))

(assert (= (and b!1552528 c!142990) b!1552524))

(assert (= (and b!1552528 (not c!142990)) b!1552527))

(assert (= (or b!1552524 b!1552527) bm!71300))

(assert (= (or b!1552529 bm!71300) bm!71302))

(assert (= (or b!1552526 bm!71302) bm!71301))

(assert (= (and bm!71301 c!142991) b!1552522))

(assert (= (and bm!71301 (not c!142991)) b!1552523))

(assert (= (and d!160853 res!1062879) b!1552520))

(assert (= (and b!1552520 res!1062878) b!1552521))

(declare-fun m!1430403 () Bool)

(assert (=> b!1552522 m!1430403))

(declare-fun m!1430405 () Bool)

(assert (=> bm!71301 m!1430405))

(declare-fun m!1430407 () Bool)

(assert (=> b!1552520 m!1430407))

(declare-fun m!1430409 () Bool)

(assert (=> b!1552521 m!1430409))

(declare-fun m!1430411 () Bool)

(assert (=> d!160853 m!1430411))

(declare-fun m!1430413 () Bool)

(assert (=> d!160853 m!1430413))

(assert (=> d!160813 d!160853))

(declare-fun d!160855 () Bool)

(declare-fun isEmpty!1138 (List!36259) Bool)

(assert (=> d!160855 (= (isEmpty!1137 lt!669115) (isEmpty!1138 (toList!11226 lt!669115)))))

(declare-fun bs!44562 () Bool)

(assert (= bs!44562 d!160855))

(declare-fun m!1430415 () Bool)

(assert (=> bs!44562 m!1430415))

(assert (=> b!1552393 d!160855))

(declare-fun d!160857 () Bool)

(declare-fun e!864292 () Bool)

(assert (=> d!160857 e!864292))

(declare-fun res!1062880 () Bool)

(assert (=> d!160857 (=> res!1062880 e!864292)))

(declare-fun lt!669184 () Bool)

(assert (=> d!160857 (= res!1062880 (not lt!669184))))

(declare-fun lt!669182 () Bool)

(assert (=> d!160857 (= lt!669184 lt!669182)))

(declare-fun lt!669185 () Unit!51522)

(declare-fun e!864293 () Unit!51522)

(assert (=> d!160857 (= lt!669185 e!864293)))

(declare-fun c!142993 () Bool)

(assert (=> d!160857 (= c!142993 lt!669182)))

(assert (=> d!160857 (= lt!669182 (containsKey!752 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!160857 (= (contains!10087 lt!669115 #b0000000000000000000000000000000000000000000000000000000000000000) lt!669184)))

(declare-fun b!1552530 () Bool)

(declare-fun lt!669183 () Unit!51522)

(assert (=> b!1552530 (= e!864293 lt!669183)))

(assert (=> b!1552530 (= lt!669183 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552530 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552531 () Bool)

(declare-fun Unit!51535 () Unit!51522)

(assert (=> b!1552531 (= e!864293 Unit!51535)))

(declare-fun b!1552532 () Bool)

(assert (=> b!1552532 (= e!864292 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160857 c!142993) b!1552530))

(assert (= (and d!160857 (not c!142993)) b!1552531))

(assert (= (and d!160857 (not res!1062880)) b!1552532))

(declare-fun m!1430417 () Bool)

(assert (=> d!160857 m!1430417))

(declare-fun m!1430419 () Bool)

(assert (=> b!1552530 m!1430419))

(declare-fun m!1430421 () Bool)

(assert (=> b!1552530 m!1430421))

(assert (=> b!1552530 m!1430421))

(declare-fun m!1430423 () Bool)

(assert (=> b!1552530 m!1430423))

(assert (=> b!1552532 m!1430421))

(assert (=> b!1552532 m!1430421))

(assert (=> b!1552532 m!1430423))

(assert (=> d!160801 d!160857))

(assert (=> d!160801 d!160829))

(declare-fun d!160859 () Bool)

(declare-fun c!142994 () Bool)

(assert (=> d!160859 (= c!142994 (and ((_ is Cons!36255) (toList!11226 lt!669144)) (= (_1!12417 (h!37701 (toList!11226 lt!669144))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864294 () Option!810)

(assert (=> d!160859 (= (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864294)))

(declare-fun b!1552534 () Bool)

(declare-fun e!864295 () Option!810)

(assert (=> b!1552534 (= e!864294 e!864295)))

(declare-fun c!142995 () Bool)

(assert (=> b!1552534 (= c!142995 (and ((_ is Cons!36255) (toList!11226 lt!669144)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669144))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552536 () Bool)

(assert (=> b!1552536 (= e!864295 None!808)))

(declare-fun b!1552533 () Bool)

(assert (=> b!1552533 (= e!864294 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669144)))))))

(declare-fun b!1552535 () Bool)

(assert (=> b!1552535 (= e!864295 (getValueByKey!735 (t!50967 (toList!11226 lt!669144)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160859 c!142994) b!1552533))

(assert (= (and d!160859 (not c!142994)) b!1552534))

(assert (= (and b!1552534 c!142995) b!1552535))

(assert (= (and b!1552534 (not c!142995)) b!1552536))

(declare-fun m!1430425 () Bool)

(assert (=> b!1552535 m!1430425))

(assert (=> b!1552423 d!160859))

(assert (=> d!160803 d!160797))

(declare-fun d!160861 () Bool)

(assert (=> d!160861 (= (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49970 _keys!618) from!762)) (apply!1097 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160861 true))

(declare-fun _$34!1191 () Unit!51522)

(assert (=> d!160861 (= (choose!2045 lt!669010 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49970 _keys!618) from!762)) _$34!1191)))

(declare-fun bs!44563 () Bool)

(assert (= bs!44563 d!160861))

(assert (=> bs!44563 m!1430081))

(assert (=> bs!44563 m!1430081))

(assert (=> bs!44563 m!1430059))

(assert (=> bs!44563 m!1430083))

(assert (=> bs!44563 m!1430059))

(assert (=> bs!44563 m!1430095))

(assert (=> d!160803 d!160861))

(assert (=> d!160803 d!160799))

(declare-fun d!160863 () Bool)

(declare-fun e!864296 () Bool)

(assert (=> d!160863 e!864296))

(declare-fun res!1062881 () Bool)

(assert (=> d!160863 (=> res!1062881 e!864296)))

(declare-fun lt!669188 () Bool)

(assert (=> d!160863 (= res!1062881 (not lt!669188))))

(declare-fun lt!669186 () Bool)

(assert (=> d!160863 (= lt!669188 lt!669186)))

(declare-fun lt!669189 () Unit!51522)

(declare-fun e!864297 () Unit!51522)

(assert (=> d!160863 (= lt!669189 e!864297)))

(declare-fun c!142996 () Bool)

(assert (=> d!160863 (= c!142996 lt!669186)))

(assert (=> d!160863 (= lt!669186 (containsKey!752 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160863 (= (contains!10087 lt!669010 (select (arr!49970 _keys!618) from!762)) lt!669188)))

(declare-fun b!1552538 () Bool)

(declare-fun lt!669187 () Unit!51522)

(assert (=> b!1552538 (= e!864297 lt!669187)))

(assert (=> b!1552538 (= lt!669187 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552538 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))

(declare-fun b!1552539 () Bool)

(declare-fun Unit!51536 () Unit!51522)

(assert (=> b!1552539 (= e!864297 Unit!51536)))

(declare-fun b!1552540 () Bool)

(assert (=> b!1552540 (= e!864296 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762))))))

(assert (= (and d!160863 c!142996) b!1552538))

(assert (= (and d!160863 (not c!142996)) b!1552539))

(assert (= (and d!160863 (not res!1062881)) b!1552540))

(assert (=> d!160863 m!1430059))

(declare-fun m!1430427 () Bool)

(assert (=> d!160863 m!1430427))

(assert (=> b!1552538 m!1430059))

(declare-fun m!1430429 () Bool)

(assert (=> b!1552538 m!1430429))

(assert (=> b!1552538 m!1430059))

(assert (=> b!1552538 m!1430255))

(assert (=> b!1552538 m!1430255))

(declare-fun m!1430431 () Bool)

(assert (=> b!1552538 m!1430431))

(assert (=> b!1552540 m!1430059))

(assert (=> b!1552540 m!1430255))

(assert (=> b!1552540 m!1430255))

(assert (=> b!1552540 m!1430431))

(assert (=> d!160803 d!160863))

(assert (=> d!160803 d!160809))

(declare-fun d!160865 () Bool)

(assert (=> d!160865 (= (get!26040 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552437 d!160865))

(assert (=> d!160807 d!160797))

(declare-fun d!160867 () Bool)

(assert (=> d!160867 (= (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49970 _keys!618) from!762)) (apply!1097 lt!669010 (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160867 true))

(declare-fun _$34!1192 () Unit!51522)

(assert (=> d!160867 (= (choose!2045 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)) _$34!1192)))

(declare-fun bs!44564 () Bool)

(assert (= bs!44564 d!160867))

(assert (=> bs!44564 m!1430093))

(assert (=> bs!44564 m!1430093))

(assert (=> bs!44564 m!1430059))

(assert (=> bs!44564 m!1430291))

(assert (=> bs!44564 m!1430059))

(assert (=> bs!44564 m!1430095))

(assert (=> d!160807 d!160867))

(assert (=> d!160807 d!160863))

(declare-fun d!160869 () Bool)

(assert (=> d!160869 (= (apply!1097 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49970 _keys!618) from!762)) (get!26038 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun bs!44565 () Bool)

(assert (= bs!44565 d!160869))

(assert (=> bs!44565 m!1430059))

(declare-fun m!1430433 () Bool)

(assert (=> bs!44565 m!1430433))

(assert (=> bs!44565 m!1430433))

(declare-fun m!1430435 () Bool)

(assert (=> bs!44565 m!1430435))

(assert (=> d!160807 d!160869))

(assert (=> d!160807 d!160811))

(declare-fun d!160871 () Bool)

(declare-fun e!864298 () Bool)

(assert (=> d!160871 e!864298))

(declare-fun res!1062883 () Bool)

(assert (=> d!160871 (=> (not res!1062883) (not e!864298))))

(declare-fun lt!669190 () ListLongMap!22421)

(assert (=> d!160871 (= res!1062883 (contains!10087 lt!669190 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!669192 () List!36259)

(assert (=> d!160871 (= lt!669190 (ListLongMap!22422 lt!669192))))

(declare-fun lt!669193 () Unit!51522)

(declare-fun lt!669191 () Unit!51522)

(assert (=> d!160871 (= lt!669193 lt!669191)))

(assert (=> d!160871 (= (getValueByKey!735 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!809 (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160871 (= lt!669191 (lemmaContainsTupThenGetReturnValue!375 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160871 (= lt!669192 (insertStrictlySorted!504 (toList!11226 call!71293) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160871 (= (+!5040 call!71293 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!669190)))

(declare-fun b!1552541 () Bool)

(declare-fun res!1062882 () Bool)

(assert (=> b!1552541 (=> (not res!1062882) (not e!864298))))

(assert (=> b!1552541 (= res!1062882 (= (getValueByKey!735 (toList!11226 lt!669190) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!809 (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1552542 () Bool)

(assert (=> b!1552542 (= e!864298 (contains!10090 (toList!11226 lt!669190) (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!160871 res!1062883) b!1552541))

(assert (= (and b!1552541 res!1062882) b!1552542))

(declare-fun m!1430437 () Bool)

(assert (=> d!160871 m!1430437))

(declare-fun m!1430439 () Bool)

(assert (=> d!160871 m!1430439))

(declare-fun m!1430441 () Bool)

(assert (=> d!160871 m!1430441))

(declare-fun m!1430443 () Bool)

(assert (=> d!160871 m!1430443))

(declare-fun m!1430445 () Bool)

(assert (=> b!1552541 m!1430445))

(declare-fun m!1430447 () Bool)

(assert (=> b!1552542 m!1430447))

(assert (=> b!1552395 d!160871))

(assert (=> b!1552395 d!160819))

(declare-fun d!160873 () Bool)

(declare-fun e!864299 () Bool)

(assert (=> d!160873 e!864299))

(declare-fun res!1062885 () Bool)

(assert (=> d!160873 (=> (not res!1062885) (not e!864299))))

(declare-fun lt!669194 () ListLongMap!22421)

(assert (=> d!160873 (= res!1062885 (contains!10087 lt!669194 (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun lt!669196 () List!36259)

(assert (=> d!160873 (= lt!669194 (ListLongMap!22422 lt!669196))))

(declare-fun lt!669197 () Unit!51522)

(declare-fun lt!669195 () Unit!51522)

(assert (=> d!160873 (= lt!669197 lt!669195)))

(assert (=> d!160873 (= (getValueByKey!735 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117))) (Some!809 (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (=> d!160873 (= lt!669195 (lemmaContainsTupThenGetReturnValue!375 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (=> d!160873 (= lt!669196 (insertStrictlySorted!504 (toList!11226 lt!669116) (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (=> d!160873 (= (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)) lt!669194)))

(declare-fun b!1552543 () Bool)

(declare-fun res!1062884 () Bool)

(assert (=> b!1552543 (=> (not res!1062884) (not e!864299))))

(assert (=> b!1552543 (= res!1062884 (= (getValueByKey!735 (toList!11226 lt!669194) (_1!12417 (tuple2!24813 lt!669114 lt!669117))) (Some!809 (_2!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(declare-fun b!1552544 () Bool)

(assert (=> b!1552544 (= e!864299 (contains!10090 (toList!11226 lt!669194) (tuple2!24813 lt!669114 lt!669117)))))

(assert (= (and d!160873 res!1062885) b!1552543))

(assert (= (and b!1552543 res!1062884) b!1552544))

(declare-fun m!1430449 () Bool)

(assert (=> d!160873 m!1430449))

(declare-fun m!1430451 () Bool)

(assert (=> d!160873 m!1430451))

(declare-fun m!1430453 () Bool)

(assert (=> d!160873 m!1430453))

(declare-fun m!1430455 () Bool)

(assert (=> d!160873 m!1430455))

(declare-fun m!1430457 () Bool)

(assert (=> b!1552543 m!1430457))

(declare-fun m!1430459 () Bool)

(assert (=> b!1552544 m!1430459))

(assert (=> b!1552395 d!160873))

(declare-fun d!160875 () Bool)

(declare-fun e!864300 () Bool)

(assert (=> d!160875 e!864300))

(declare-fun res!1062886 () Bool)

(assert (=> d!160875 (=> res!1062886 e!864300)))

(declare-fun lt!669200 () Bool)

(assert (=> d!160875 (= res!1062886 (not lt!669200))))

(declare-fun lt!669198 () Bool)

(assert (=> d!160875 (= lt!669200 lt!669198)))

(declare-fun lt!669201 () Unit!51522)

(declare-fun e!864301 () Unit!51522)

(assert (=> d!160875 (= lt!669201 e!864301)))

(declare-fun c!142997 () Bool)

(assert (=> d!160875 (= c!142997 lt!669198)))

(assert (=> d!160875 (= lt!669198 (containsKey!752 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))

(assert (=> d!160875 (= (contains!10087 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)) lt!669118) lt!669200)))

(declare-fun b!1552545 () Bool)

(declare-fun lt!669199 () Unit!51522)

(assert (=> b!1552545 (= e!864301 lt!669199)))

(assert (=> b!1552545 (= lt!669199 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))

(assert (=> b!1552545 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))

(declare-fun b!1552546 () Bool)

(declare-fun Unit!51537 () Unit!51522)

(assert (=> b!1552546 (= e!864301 Unit!51537)))

(declare-fun b!1552547 () Bool)

(assert (=> b!1552547 (= e!864300 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118)))))

(assert (= (and d!160875 c!142997) b!1552545))

(assert (= (and d!160875 (not c!142997)) b!1552546))

(assert (= (and d!160875 (not res!1062886)) b!1552547))

(declare-fun m!1430461 () Bool)

(assert (=> d!160875 m!1430461))

(declare-fun m!1430463 () Bool)

(assert (=> b!1552545 m!1430463))

(declare-fun m!1430465 () Bool)

(assert (=> b!1552545 m!1430465))

(assert (=> b!1552545 m!1430465))

(declare-fun m!1430467 () Bool)

(assert (=> b!1552545 m!1430467))

(assert (=> b!1552547 m!1430465))

(assert (=> b!1552547 m!1430465))

(assert (=> b!1552547 m!1430467))

(assert (=> b!1552395 d!160875))

(declare-fun d!160877 () Bool)

(assert (=> d!160877 (not (contains!10087 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)) lt!669118))))

(declare-fun lt!669204 () Unit!51522)

(declare-fun choose!2047 (ListLongMap!22421 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51522)

(assert (=> d!160877 (= lt!669204 (choose!2047 lt!669116 lt!669114 lt!669117 lt!669118))))

(declare-fun e!864304 () Bool)

(assert (=> d!160877 e!864304))

(declare-fun res!1062889 () Bool)

(assert (=> d!160877 (=> (not res!1062889) (not e!864304))))

(assert (=> d!160877 (= res!1062889 (not (contains!10087 lt!669116 lt!669118)))))

(assert (=> d!160877 (= (addStillNotContains!501 lt!669116 lt!669114 lt!669117 lt!669118) lt!669204)))

(declare-fun b!1552551 () Bool)

(assert (=> b!1552551 (= e!864304 (not (= lt!669114 lt!669118)))))

(assert (= (and d!160877 res!1062889) b!1552551))

(assert (=> d!160877 m!1430271))

(assert (=> d!160877 m!1430271))

(assert (=> d!160877 m!1430273))

(declare-fun m!1430469 () Bool)

(assert (=> d!160877 m!1430469))

(declare-fun m!1430471 () Bool)

(assert (=> d!160877 m!1430471))

(assert (=> b!1552395 d!160877))

(declare-fun d!160879 () Bool)

(declare-fun c!142998 () Bool)

(assert (=> d!160879 (= c!142998 (and ((_ is Cons!36255) (toList!11226 lt!669148)) (= (_1!12417 (h!37701 (toList!11226 lt!669148))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864305 () Option!810)

(assert (=> d!160879 (= (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864305)))

(declare-fun b!1552553 () Bool)

(declare-fun e!864306 () Option!810)

(assert (=> b!1552553 (= e!864305 e!864306)))

(declare-fun c!142999 () Bool)

(assert (=> b!1552553 (= c!142999 (and ((_ is Cons!36255) (toList!11226 lt!669148)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669148))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1552555 () Bool)

(assert (=> b!1552555 (= e!864306 None!808)))

(declare-fun b!1552552 () Bool)

(assert (=> b!1552552 (= e!864305 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669148)))))))

(declare-fun b!1552554 () Bool)

(assert (=> b!1552554 (= e!864306 (getValueByKey!735 (t!50967 (toList!11226 lt!669148)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!160879 c!142998) b!1552552))

(assert (= (and d!160879 (not c!142998)) b!1552553))

(assert (= (and b!1552553 c!142999) b!1552554))

(assert (= (and b!1552553 (not c!142999)) b!1552555))

(declare-fun m!1430473 () Bool)

(assert (=> b!1552554 m!1430473))

(assert (=> b!1552425 d!160879))

(declare-fun d!160881 () Bool)

(assert (=> d!160881 (arrayContainsKey!0 _keys!618 lt!669093 #b00000000000000000000000000000000)))

(declare-fun lt!669207 () Unit!51522)

(declare-fun choose!13 (array!103542 (_ BitVec 64) (_ BitVec 32)) Unit!51522)

(assert (=> d!160881 (= lt!669207 (choose!13 _keys!618 lt!669093 #b00000000000000000000000000000000))))

(assert (=> d!160881 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!160881 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669093 #b00000000000000000000000000000000) lt!669207)))

(declare-fun bs!44566 () Bool)

(assert (= bs!44566 d!160881))

(assert (=> bs!44566 m!1430239))

(declare-fun m!1430475 () Bool)

(assert (=> bs!44566 m!1430475))

(assert (=> b!1552366 d!160881))

(declare-fun d!160883 () Bool)

(declare-fun res!1062894 () Bool)

(declare-fun e!864311 () Bool)

(assert (=> d!160883 (=> res!1062894 e!864311)))

(assert (=> d!160883 (= res!1062894 (= (select (arr!49970 _keys!618) #b00000000000000000000000000000000) lt!669093))))

(assert (=> d!160883 (= (arrayContainsKey!0 _keys!618 lt!669093 #b00000000000000000000000000000000) e!864311)))

(declare-fun b!1552560 () Bool)

(declare-fun e!864312 () Bool)

(assert (=> b!1552560 (= e!864311 e!864312)))

(declare-fun res!1062895 () Bool)

(assert (=> b!1552560 (=> (not res!1062895) (not e!864312))))

(assert (=> b!1552560 (= res!1062895 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1552561 () Bool)

(assert (=> b!1552561 (= e!864312 (arrayContainsKey!0 _keys!618 lt!669093 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!160883 (not res!1062894)) b!1552560))

(assert (= (and b!1552560 res!1062895) b!1552561))

(assert (=> d!160883 m!1430233))

(declare-fun m!1430477 () Bool)

(assert (=> b!1552561 m!1430477))

(assert (=> b!1552366 d!160883))

(declare-fun b!1552574 () Bool)

(declare-fun e!864321 () SeekEntryResult!13516)

(declare-fun lt!669215 () SeekEntryResult!13516)

(assert (=> b!1552574 (= e!864321 (MissingZero!13516 (index!56464 lt!669215)))))

(declare-fun b!1552575 () Bool)

(declare-fun e!864319 () SeekEntryResult!13516)

(assert (=> b!1552575 (= e!864319 (Found!13516 (index!56464 lt!669215)))))

(declare-fun d!160885 () Bool)

(declare-fun lt!669214 () SeekEntryResult!13516)

(assert (=> d!160885 (and (or ((_ is Undefined!13516) lt!669214) (not ((_ is Found!13516) lt!669214)) (and (bvsge (index!56463 lt!669214) #b00000000000000000000000000000000) (bvslt (index!56463 lt!669214) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669214) ((_ is Found!13516) lt!669214) (not ((_ is MissingZero!13516) lt!669214)) (and (bvsge (index!56462 lt!669214) #b00000000000000000000000000000000) (bvslt (index!56462 lt!669214) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669214) ((_ is Found!13516) lt!669214) ((_ is MissingZero!13516) lt!669214) (not ((_ is MissingVacant!13516) lt!669214)) (and (bvsge (index!56465 lt!669214) #b00000000000000000000000000000000) (bvslt (index!56465 lt!669214) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669214) (ite ((_ is Found!13516) lt!669214) (= (select (arr!49970 _keys!618) (index!56463 lt!669214)) (select (arr!49970 _keys!618) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13516) lt!669214) (= (select (arr!49970 _keys!618) (index!56462 lt!669214)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13516) lt!669214) (= (select (arr!49970 _keys!618) (index!56465 lt!669214)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!864320 () SeekEntryResult!13516)

(assert (=> d!160885 (= lt!669214 e!864320)))

(declare-fun c!143008 () Bool)

(assert (=> d!160885 (= c!143008 (and ((_ is Intermediate!13516) lt!669215) (undefined!14328 lt!669215)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!103542 (_ BitVec 32)) SeekEntryResult!13516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160885 (= lt!669215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926) (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(assert (=> d!160885 (validMask!0 mask!926)))

(assert (=> d!160885 (= (seekEntryOrOpen!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!669214)))

(declare-fun b!1552576 () Bool)

(declare-fun c!143006 () Bool)

(declare-fun lt!669216 () (_ BitVec 64))

(assert (=> b!1552576 (= c!143006 (= lt!669216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552576 (= e!864319 e!864321)))

(declare-fun b!1552577 () Bool)

(assert (=> b!1552577 (= e!864320 Undefined!13516)))

(declare-fun b!1552578 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!103542 (_ BitVec 32)) SeekEntryResult!13516)

(assert (=> b!1552578 (= e!864321 (seekKeyOrZeroReturnVacant!0 (x!139210 lt!669215) (index!56464 lt!669215) (index!56464 lt!669215) (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1552579 () Bool)

(assert (=> b!1552579 (= e!864320 e!864319)))

(assert (=> b!1552579 (= lt!669216 (select (arr!49970 _keys!618) (index!56464 lt!669215)))))

(declare-fun c!143007 () Bool)

(assert (=> b!1552579 (= c!143007 (= lt!669216 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160885 c!143008) b!1552577))

(assert (= (and d!160885 (not c!143008)) b!1552579))

(assert (= (and b!1552579 c!143007) b!1552575))

(assert (= (and b!1552579 (not c!143007)) b!1552576))

(assert (= (and b!1552576 c!143006) b!1552574))

(assert (= (and b!1552576 (not c!143006)) b!1552578))

(assert (=> d!160885 m!1430233))

(declare-fun m!1430479 () Bool)

(assert (=> d!160885 m!1430479))

(assert (=> d!160885 m!1430073))

(declare-fun m!1430481 () Bool)

(assert (=> d!160885 m!1430481))

(declare-fun m!1430483 () Bool)

(assert (=> d!160885 m!1430483))

(declare-fun m!1430485 () Bool)

(assert (=> d!160885 m!1430485))

(assert (=> d!160885 m!1430479))

(assert (=> d!160885 m!1430233))

(declare-fun m!1430487 () Bool)

(assert (=> d!160885 m!1430487))

(assert (=> b!1552578 m!1430233))

(declare-fun m!1430489 () Bool)

(assert (=> b!1552578 m!1430489))

(declare-fun m!1430491 () Bool)

(assert (=> b!1552579 m!1430491))

(assert (=> b!1552366 d!160885))

(declare-fun d!160887 () Bool)

(declare-fun res!1062896 () Bool)

(declare-fun e!864322 () Bool)

(assert (=> d!160887 (=> res!1062896 e!864322)))

(assert (=> d!160887 (= res!1062896 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (= (_1!12417 (h!37701 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160887 (= (containsKey!752 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)) e!864322)))

(declare-fun b!1552580 () Bool)

(declare-fun e!864323 () Bool)

(assert (=> b!1552580 (= e!864322 e!864323)))

(declare-fun res!1062897 () Bool)

(assert (=> b!1552580 (=> (not res!1062897) (not e!864323))))

(assert (=> b!1552580 (= res!1062897 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669012))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (toList!11226 lt!669012)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552581 () Bool)

(assert (=> b!1552581 (= e!864323 (containsKey!752 (t!50967 (toList!11226 lt!669012)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160887 (not res!1062896)) b!1552580))

(assert (= (and b!1552580 res!1062897) b!1552581))

(assert (=> b!1552581 m!1430059))

(declare-fun m!1430493 () Bool)

(assert (=> b!1552581 m!1430493))

(assert (=> d!160827 d!160887))

(assert (=> b!1552397 d!160835))

(declare-fun d!160889 () Bool)

(declare-fun res!1062898 () Bool)

(declare-fun e!864324 () Bool)

(assert (=> d!160889 (=> res!1062898 e!864324)))

(assert (=> d!160889 (= res!1062898 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (= (_1!12417 (h!37701 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160889 (= (containsKey!752 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000) e!864324)))

(declare-fun b!1552582 () Bool)

(declare-fun e!864325 () Bool)

(assert (=> b!1552582 (= e!864324 e!864325)))

(declare-fun res!1062899 () Bool)

(assert (=> b!1552582 (=> (not res!1062899) (not e!864325))))

(assert (=> b!1552582 (= res!1062899 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669012))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36255) (toList!11226 lt!669012)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552583 () Bool)

(assert (=> b!1552583 (= e!864325 (containsKey!752 (t!50967 (toList!11226 lt!669012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160889 (not res!1062898)) b!1552582))

(assert (= (and b!1552582 res!1062899) b!1552583))

(declare-fun m!1430495 () Bool)

(assert (=> b!1552583 m!1430495))

(assert (=> d!160821 d!160889))

(declare-fun d!160891 () Bool)

(declare-fun c!143009 () Bool)

(assert (=> d!160891 (= c!143009 (and ((_ is Cons!36255) (toList!11226 lt!669152)) (= (_1!12417 (h!37701 (toList!11226 lt!669152))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864326 () Option!810)

(assert (=> d!160891 (= (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864326)))

(declare-fun b!1552585 () Bool)

(declare-fun e!864327 () Option!810)

(assert (=> b!1552585 (= e!864326 e!864327)))

(declare-fun c!143010 () Bool)

(assert (=> b!1552585 (= c!143010 (and ((_ is Cons!36255) (toList!11226 lt!669152)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669152))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552587 () Bool)

(assert (=> b!1552587 (= e!864327 None!808)))

(declare-fun b!1552584 () Bool)

(assert (=> b!1552584 (= e!864326 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669152)))))))

(declare-fun b!1552586 () Bool)

(assert (=> b!1552586 (= e!864327 (getValueByKey!735 (t!50967 (toList!11226 lt!669152)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160891 c!143009) b!1552584))

(assert (= (and d!160891 (not c!143009)) b!1552585))

(assert (= (and b!1552585 c!143010) b!1552586))

(assert (= (and b!1552585 (not c!143010)) b!1552587))

(declare-fun m!1430497 () Bool)

(assert (=> b!1552586 m!1430497))

(assert (=> b!1552427 d!160891))

(declare-fun d!160893 () Bool)

(assert (=> d!160893 (= (apply!1097 lt!669115 (select (arr!49970 _keys!618) from!762)) (get!26038 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762))))))

(declare-fun bs!44567 () Bool)

(assert (= bs!44567 d!160893))

(assert (=> bs!44567 m!1430059))

(declare-fun m!1430499 () Bool)

(assert (=> bs!44567 m!1430499))

(assert (=> bs!44567 m!1430499))

(declare-fun m!1430501 () Bool)

(assert (=> bs!44567 m!1430501))

(assert (=> b!1552400 d!160893))

(assert (=> b!1552400 d!160819))

(declare-fun d!160895 () Bool)

(declare-fun e!864328 () Bool)

(assert (=> d!160895 e!864328))

(declare-fun res!1062900 () Bool)

(assert (=> d!160895 (=> res!1062900 e!864328)))

(declare-fun lt!669219 () Bool)

(assert (=> d!160895 (= res!1062900 (not lt!669219))))

(declare-fun lt!669217 () Bool)

(assert (=> d!160895 (= lt!669219 lt!669217)))

(declare-fun lt!669220 () Unit!51522)

(declare-fun e!864329 () Unit!51522)

(assert (=> d!160895 (= lt!669220 e!864329)))

(declare-fun c!143011 () Bool)

(assert (=> d!160895 (= c!143011 lt!669217)))

(assert (=> d!160895 (= lt!669217 (containsKey!752 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160895 (= (contains!10087 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49970 _keys!618) from!762)) lt!669219)))

(declare-fun b!1552588 () Bool)

(declare-fun lt!669218 () Unit!51522)

(assert (=> b!1552588 (= e!864329 lt!669218)))

(assert (=> b!1552588 (= lt!669218 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552588 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))

(declare-fun b!1552589 () Bool)

(declare-fun Unit!51538 () Unit!51522)

(assert (=> b!1552589 (= e!864329 Unit!51538)))

(declare-fun b!1552590 () Bool)

(assert (=> b!1552590 (= e!864328 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762))))))

(assert (= (and d!160895 c!143011) b!1552588))

(assert (= (and d!160895 (not c!143011)) b!1552589))

(assert (= (and d!160895 (not res!1062900)) b!1552590))

(assert (=> d!160895 m!1430059))

(declare-fun m!1430503 () Bool)

(assert (=> d!160895 m!1430503))

(assert (=> b!1552588 m!1430059))

(declare-fun m!1430505 () Bool)

(assert (=> b!1552588 m!1430505))

(assert (=> b!1552588 m!1430059))

(assert (=> b!1552588 m!1430433))

(assert (=> b!1552588 m!1430433))

(declare-fun m!1430507 () Bool)

(assert (=> b!1552588 m!1430507))

(assert (=> b!1552590 m!1430059))

(assert (=> b!1552590 m!1430433))

(assert (=> b!1552590 m!1430433))

(assert (=> b!1552590 m!1430507))

(assert (=> d!160795 d!160895))

(assert (=> d!160795 d!160811))

(declare-fun d!160897 () Bool)

(assert (=> d!160897 (contains!10087 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49970 _keys!618) from!762))))

(assert (=> d!160897 true))

(declare-fun _$35!463 () Unit!51522)

(assert (=> d!160897 (= (choose!2044 lt!669010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)) _$35!463)))

(declare-fun bs!44568 () Bool)

(assert (= bs!44568 d!160897))

(assert (=> bs!44568 m!1430093))

(assert (=> bs!44568 m!1430093))

(assert (=> bs!44568 m!1430059))

(assert (=> bs!44568 m!1430249))

(assert (=> d!160795 d!160897))

(assert (=> d!160795 d!160863))

(declare-fun lt!669223 () Bool)

(declare-fun d!160899 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!783 (List!36259) (InoxSet tuple2!24812))

(assert (=> d!160899 (= lt!669223 (select (content!783 (toList!11226 lt!669168)) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864334 () Bool)

(assert (=> d!160899 (= lt!669223 e!864334)))

(declare-fun res!1062906 () Bool)

(assert (=> d!160899 (=> (not res!1062906) (not e!864334))))

(assert (=> d!160899 (= res!1062906 ((_ is Cons!36255) (toList!11226 lt!669168)))))

(assert (=> d!160899 (= (contains!10090 (toList!11226 lt!669168) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669223)))

(declare-fun b!1552596 () Bool)

(declare-fun e!864335 () Bool)

(assert (=> b!1552596 (= e!864334 e!864335)))

(declare-fun res!1062905 () Bool)

(assert (=> b!1552596 (=> res!1062905 e!864335)))

(assert (=> b!1552596 (= res!1062905 (= (h!37701 (toList!11226 lt!669168)) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552597 () Bool)

(assert (=> b!1552597 (= e!864335 (contains!10090 (t!50967 (toList!11226 lt!669168)) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160899 res!1062906) b!1552596))

(assert (= (and b!1552596 (not res!1062905)) b!1552597))

(declare-fun m!1430509 () Bool)

(assert (=> d!160899 m!1430509))

(declare-fun m!1430511 () Bool)

(assert (=> d!160899 m!1430511))

(declare-fun m!1430513 () Bool)

(assert (=> b!1552597 m!1430513))

(assert (=> b!1552460 d!160899))

(declare-fun b!1552598 () Bool)

(declare-fun e!864337 () Bool)

(declare-fun call!71306 () Bool)

(assert (=> b!1552598 (= e!864337 call!71306)))

(declare-fun b!1552599 () Bool)

(declare-fun e!864338 () Bool)

(assert (=> b!1552599 (= e!864338 e!864337)))

(declare-fun c!143012 () Bool)

(assert (=> b!1552599 (= c!143012 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1552600 () Bool)

(declare-fun e!864336 () Bool)

(assert (=> b!1552600 (= e!864337 e!864336)))

(declare-fun lt!669224 () (_ BitVec 64))

(assert (=> b!1552600 (= lt!669224 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!669226 () Unit!51522)

(assert (=> b!1552600 (= lt!669226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1552600 (arrayContainsKey!0 _keys!618 lt!669224 #b00000000000000000000000000000000)))

(declare-fun lt!669225 () Unit!51522)

(assert (=> b!1552600 (= lt!669225 lt!669226)))

(declare-fun res!1062907 () Bool)

(assert (=> b!1552600 (= res!1062907 (= (seekEntryOrOpen!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926) (Found!13516 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1552600 (=> (not res!1062907) (not e!864336))))

(declare-fun b!1552601 () Bool)

(assert (=> b!1552601 (= e!864336 call!71306)))

(declare-fun d!160901 () Bool)

(declare-fun res!1062908 () Bool)

(assert (=> d!160901 (=> res!1062908 e!864338)))

(assert (=> d!160901 (= res!1062908 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> d!160901 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926) e!864338)))

(declare-fun bm!71303 () Bool)

(assert (=> bm!71303 (= call!71306 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!160901 (not res!1062908)) b!1552599))

(assert (= (and b!1552599 c!143012) b!1552600))

(assert (= (and b!1552599 (not c!143012)) b!1552598))

(assert (= (and b!1552600 res!1062907) b!1552601))

(assert (= (or b!1552601 b!1552598) bm!71303))

(declare-fun m!1430515 () Bool)

(assert (=> b!1552599 m!1430515))

(assert (=> b!1552599 m!1430515))

(declare-fun m!1430517 () Bool)

(assert (=> b!1552599 m!1430517))

(assert (=> b!1552600 m!1430515))

(declare-fun m!1430519 () Bool)

(assert (=> b!1552600 m!1430519))

(declare-fun m!1430521 () Bool)

(assert (=> b!1552600 m!1430521))

(assert (=> b!1552600 m!1430515))

(declare-fun m!1430523 () Bool)

(assert (=> b!1552600 m!1430523))

(declare-fun m!1430525 () Bool)

(assert (=> bm!71303 m!1430525))

(assert (=> bm!71287 d!160901))

(declare-fun d!160903 () Bool)

(declare-fun lt!669229 () Bool)

(declare-fun content!784 (List!36260) (InoxSet (_ BitVec 64)))

(assert (=> d!160903 (= lt!669229 (select (content!784 Nil!36257) (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun e!864343 () Bool)

(assert (=> d!160903 (= lt!669229 e!864343)))

(declare-fun res!1062914 () Bool)

(assert (=> d!160903 (=> (not res!1062914) (not e!864343))))

(assert (=> d!160903 (= res!1062914 ((_ is Cons!36256) Nil!36257))))

(assert (=> d!160903 (= (contains!10091 Nil!36257 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)) lt!669229)))

(declare-fun b!1552606 () Bool)

(declare-fun e!864344 () Bool)

(assert (=> b!1552606 (= e!864343 e!864344)))

(declare-fun res!1062913 () Bool)

(assert (=> b!1552606 (=> res!1062913 e!864344)))

(assert (=> b!1552606 (= res!1062913 (= (h!37702 Nil!36257) (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1552607 () Bool)

(assert (=> b!1552607 (= e!864344 (contains!10091 (t!50968 Nil!36257) (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160903 res!1062914) b!1552606))

(assert (= (and b!1552606 (not res!1062913)) b!1552607))

(declare-fun m!1430527 () Bool)

(assert (=> d!160903 m!1430527))

(assert (=> d!160903 m!1430233))

(declare-fun m!1430529 () Bool)

(assert (=> d!160903 m!1430529))

(assert (=> b!1552607 m!1430233))

(declare-fun m!1430531 () Bool)

(assert (=> b!1552607 m!1430531))

(assert (=> b!1552453 d!160903))

(declare-fun d!160905 () Bool)

(assert (=> d!160905 (= (get!26038 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49970 _keys!618) from!762))) (v!21986 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160799 d!160905))

(declare-fun c!143013 () Bool)

(declare-fun d!160907 () Bool)

(assert (=> d!160907 (= c!143013 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864345 () Option!810)

(assert (=> d!160907 (= (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49970 _keys!618) from!762)) e!864345)))

(declare-fun b!1552609 () Bool)

(declare-fun e!864346 () Option!810)

(assert (=> b!1552609 (= e!864345 e!864346)))

(declare-fun c!143014 () Bool)

(assert (=> b!1552609 (= c!143014 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552611 () Bool)

(assert (=> b!1552611 (= e!864346 None!808)))

(declare-fun b!1552608 () Bool)

(assert (=> b!1552608 (= e!864345 (Some!809 (_2!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1552610 () Bool)

(assert (=> b!1552610 (= e!864346 (getValueByKey!735 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160907 c!143013) b!1552608))

(assert (= (and d!160907 (not c!143013)) b!1552609))

(assert (= (and b!1552609 c!143014) b!1552610))

(assert (= (and b!1552609 (not c!143014)) b!1552611))

(assert (=> b!1552610 m!1430059))

(declare-fun m!1430533 () Bool)

(assert (=> b!1552610 m!1430533))

(assert (=> d!160799 d!160907))

(declare-fun d!160909 () Bool)

(declare-fun e!864347 () Bool)

(assert (=> d!160909 e!864347))

(declare-fun res!1062915 () Bool)

(assert (=> d!160909 (=> res!1062915 e!864347)))

(declare-fun lt!669232 () Bool)

(assert (=> d!160909 (= res!1062915 (not lt!669232))))

(declare-fun lt!669230 () Bool)

(assert (=> d!160909 (= lt!669232 lt!669230)))

(declare-fun lt!669233 () Unit!51522)

(declare-fun e!864348 () Unit!51522)

(assert (=> d!160909 (= lt!669233 e!864348)))

(declare-fun c!143015 () Bool)

(assert (=> d!160909 (= c!143015 lt!669230)))

(assert (=> d!160909 (= lt!669230 (containsKey!752 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160909 (= (contains!10087 lt!669144 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669232)))

(declare-fun b!1552612 () Bool)

(declare-fun lt!669231 () Unit!51522)

(assert (=> b!1552612 (= e!864348 lt!669231)))

(assert (=> b!1552612 (= lt!669231 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> b!1552612 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552613 () Bool)

(declare-fun Unit!51539 () Unit!51522)

(assert (=> b!1552613 (= e!864348 Unit!51539)))

(declare-fun b!1552614 () Bool)

(assert (=> b!1552614 (= e!864347 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!160909 c!143015) b!1552612))

(assert (= (and d!160909 (not c!143015)) b!1552613))

(assert (= (and d!160909 (not res!1062915)) b!1552614))

(declare-fun m!1430535 () Bool)

(assert (=> d!160909 m!1430535))

(declare-fun m!1430537 () Bool)

(assert (=> b!1552612 m!1430537))

(assert (=> b!1552612 m!1430303))

(assert (=> b!1552612 m!1430303))

(declare-fun m!1430539 () Bool)

(assert (=> b!1552612 m!1430539))

(assert (=> b!1552614 m!1430303))

(assert (=> b!1552614 m!1430303))

(assert (=> b!1552614 m!1430539))

(assert (=> d!160809 d!160909))

(declare-fun d!160911 () Bool)

(declare-fun c!143016 () Bool)

(assert (=> d!160911 (= c!143016 (and ((_ is Cons!36255) lt!669146) (= (_1!12417 (h!37701 lt!669146)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864349 () Option!810)

(assert (=> d!160911 (= (getValueByKey!735 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864349)))

(declare-fun b!1552616 () Bool)

(declare-fun e!864350 () Option!810)

(assert (=> b!1552616 (= e!864349 e!864350)))

(declare-fun c!143017 () Bool)

(assert (=> b!1552616 (= c!143017 (and ((_ is Cons!36255) lt!669146) (not (= (_1!12417 (h!37701 lt!669146)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552618 () Bool)

(assert (=> b!1552618 (= e!864350 None!808)))

(declare-fun b!1552615 () Bool)

(assert (=> b!1552615 (= e!864349 (Some!809 (_2!12417 (h!37701 lt!669146))))))

(declare-fun b!1552617 () Bool)

(assert (=> b!1552617 (= e!864350 (getValueByKey!735 (t!50967 lt!669146) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160911 c!143016) b!1552615))

(assert (= (and d!160911 (not c!143016)) b!1552616))

(assert (= (and b!1552616 c!143017) b!1552617))

(assert (= (and b!1552616 (not c!143017)) b!1552618))

(declare-fun m!1430541 () Bool)

(assert (=> b!1552617 m!1430541))

(assert (=> d!160809 d!160911))

(declare-fun d!160913 () Bool)

(assert (=> d!160913 (= (getValueByKey!735 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669234 () Unit!51522)

(assert (=> d!160913 (= lt!669234 (choose!2046 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864351 () Bool)

(assert (=> d!160913 e!864351))

(declare-fun res!1062916 () Bool)

(assert (=> d!160913 (=> (not res!1062916) (not e!864351))))

(assert (=> d!160913 (= res!1062916 (isStrictlySorted!884 lt!669146))))

(assert (=> d!160913 (= (lemmaContainsTupThenGetReturnValue!375 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669234)))

(declare-fun b!1552619 () Bool)

(declare-fun res!1062917 () Bool)

(assert (=> b!1552619 (=> (not res!1062917) (not e!864351))))

(assert (=> b!1552619 (= res!1062917 (containsKey!752 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552620 () Bool)

(assert (=> b!1552620 (= e!864351 (contains!10090 lt!669146 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!160913 res!1062916) b!1552619))

(assert (= (and b!1552619 res!1062917) b!1552620))

(assert (=> d!160913 m!1430297))

(declare-fun m!1430543 () Bool)

(assert (=> d!160913 m!1430543))

(declare-fun m!1430545 () Bool)

(assert (=> d!160913 m!1430545))

(declare-fun m!1430547 () Bool)

(assert (=> b!1552619 m!1430547))

(declare-fun m!1430549 () Bool)

(assert (=> b!1552620 m!1430549))

(assert (=> d!160809 d!160913))

(declare-fun b!1552621 () Bool)

(declare-fun res!1062918 () Bool)

(declare-fun e!864354 () Bool)

(assert (=> b!1552621 (=> (not res!1062918) (not e!864354))))

(declare-fun lt!669235 () List!36259)

(assert (=> b!1552621 (= res!1062918 (containsKey!752 lt!669235 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552622 () Bool)

(assert (=> b!1552622 (= e!864354 (contains!10090 lt!669235 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552623 () Bool)

(declare-fun e!864355 () List!36259)

(assert (=> b!1552623 (= e!864355 (insertStrictlySorted!504 (t!50967 (toList!11226 lt!669010)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552624 () Bool)

(declare-fun c!143019 () Bool)

(declare-fun c!143021 () Bool)

(assert (=> b!1552624 (= e!864355 (ite c!143021 (t!50967 (toList!11226 lt!669010)) (ite c!143019 (Cons!36255 (h!37701 (toList!11226 lt!669010)) (t!50967 (toList!11226 lt!669010))) Nil!36256)))))

(declare-fun b!1552625 () Bool)

(declare-fun e!864353 () List!36259)

(declare-fun call!71308 () List!36259)

(assert (=> b!1552625 (= e!864353 call!71308)))

(declare-fun d!160915 () Bool)

(assert (=> d!160915 e!864354))

(declare-fun res!1062919 () Bool)

(assert (=> d!160915 (=> (not res!1062919) (not e!864354))))

(assert (=> d!160915 (= res!1062919 (isStrictlySorted!884 lt!669235))))

(declare-fun e!864352 () List!36259)

(assert (=> d!160915 (= lt!669235 e!864352)))

(declare-fun c!143018 () Bool)

(assert (=> d!160915 (= c!143018 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160915 (isStrictlySorted!884 (toList!11226 lt!669010))))

(assert (=> d!160915 (= (insertStrictlySorted!504 (toList!11226 lt!669010) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669235)))

(declare-fun b!1552626 () Bool)

(declare-fun e!864356 () List!36259)

(assert (=> b!1552626 (= e!864352 e!864356)))

(assert (=> b!1552626 (= c!143021 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (= (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71304 () Bool)

(declare-fun call!71309 () List!36259)

(assert (=> bm!71304 (= call!71308 call!71309)))

(declare-fun b!1552627 () Bool)

(declare-fun call!71307 () List!36259)

(assert (=> b!1552627 (= e!864352 call!71307)))

(declare-fun b!1552628 () Bool)

(assert (=> b!1552628 (= e!864353 call!71308)))

(declare-fun bm!71305 () Bool)

(assert (=> bm!71305 (= call!71307 ($colon$colon!946 e!864355 (ite c!143018 (h!37701 (toList!11226 lt!669010)) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143020 () Bool)

(assert (=> bm!71305 (= c!143020 c!143018)))

(declare-fun b!1552629 () Bool)

(assert (=> b!1552629 (= c!143019 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (bvsgt (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552629 (= e!864356 e!864353)))

(declare-fun b!1552630 () Bool)

(assert (=> b!1552630 (= e!864356 call!71309)))

(declare-fun bm!71306 () Bool)

(assert (=> bm!71306 (= call!71309 call!71307)))

(assert (= (and d!160915 c!143018) b!1552627))

(assert (= (and d!160915 (not c!143018)) b!1552626))

(assert (= (and b!1552626 c!143021) b!1552630))

(assert (= (and b!1552626 (not c!143021)) b!1552629))

(assert (= (and b!1552629 c!143019) b!1552625))

(assert (= (and b!1552629 (not c!143019)) b!1552628))

(assert (= (or b!1552625 b!1552628) bm!71304))

(assert (= (or b!1552630 bm!71304) bm!71306))

(assert (= (or b!1552627 bm!71306) bm!71305))

(assert (= (and bm!71305 c!143020) b!1552623))

(assert (= (and bm!71305 (not c!143020)) b!1552624))

(assert (= (and d!160915 res!1062919) b!1552621))

(assert (= (and b!1552621 res!1062918) b!1552622))

(declare-fun m!1430551 () Bool)

(assert (=> b!1552623 m!1430551))

(declare-fun m!1430553 () Bool)

(assert (=> bm!71305 m!1430553))

(declare-fun m!1430555 () Bool)

(assert (=> b!1552621 m!1430555))

(declare-fun m!1430557 () Bool)

(assert (=> b!1552622 m!1430557))

(declare-fun m!1430559 () Bool)

(assert (=> d!160915 m!1430559))

(declare-fun m!1430561 () Bool)

(assert (=> d!160915 m!1430561))

(assert (=> d!160809 d!160915))

(declare-fun d!160917 () Bool)

(assert (=> d!160917 (= (validKeyInArray!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)) (and (not (= (select (arr!49970 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49970 _keys!618) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552455 d!160917))

(declare-fun d!160919 () Bool)

(assert (=> d!160919 (= (get!26039 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21983 (select (arr!49971 _values!470) from!762)))))

(assert (=> b!1552436 d!160919))

(declare-fun d!160921 () Bool)

(declare-fun e!864357 () Bool)

(assert (=> d!160921 e!864357))

(declare-fun res!1062920 () Bool)

(assert (=> d!160921 (=> res!1062920 e!864357)))

(declare-fun lt!669238 () Bool)

(assert (=> d!160921 (= res!1062920 (not lt!669238))))

(declare-fun lt!669236 () Bool)

(assert (=> d!160921 (= lt!669238 lt!669236)))

(declare-fun lt!669239 () Unit!51522)

(declare-fun e!864358 () Unit!51522)

(assert (=> d!160921 (= lt!669239 e!864358)))

(declare-fun c!143022 () Bool)

(assert (=> d!160921 (= c!143022 lt!669236)))

(assert (=> d!160921 (= lt!669236 (containsKey!752 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160921 (= (contains!10087 lt!669168 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669238)))

(declare-fun b!1552631 () Bool)

(declare-fun lt!669237 () Unit!51522)

(assert (=> b!1552631 (= e!864358 lt!669237)))

(assert (=> b!1552631 (= lt!669237 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552631 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552632 () Bool)

(declare-fun Unit!51540 () Unit!51522)

(assert (=> b!1552632 (= e!864358 Unit!51540)))

(declare-fun b!1552633 () Bool)

(assert (=> b!1552633 (= e!864357 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!160921 c!143022) b!1552631))

(assert (= (and d!160921 (not c!143022)) b!1552632))

(assert (= (and d!160921 (not res!1062920)) b!1552633))

(declare-fun m!1430563 () Bool)

(assert (=> d!160921 m!1430563))

(declare-fun m!1430565 () Bool)

(assert (=> b!1552631 m!1430565))

(assert (=> b!1552631 m!1430375))

(assert (=> b!1552631 m!1430375))

(declare-fun m!1430567 () Bool)

(assert (=> b!1552631 m!1430567))

(assert (=> b!1552633 m!1430375))

(assert (=> b!1552633 m!1430375))

(assert (=> b!1552633 m!1430567))

(assert (=> d!160837 d!160921))

(declare-fun c!143023 () Bool)

(declare-fun d!160923 () Bool)

(assert (=> d!160923 (= c!143023 (and ((_ is Cons!36255) lt!669170) (= (_1!12417 (h!37701 lt!669170)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864359 () Option!810)

(assert (=> d!160923 (= (getValueByKey!735 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864359)))

(declare-fun b!1552635 () Bool)

(declare-fun e!864360 () Option!810)

(assert (=> b!1552635 (= e!864359 e!864360)))

(declare-fun c!143024 () Bool)

(assert (=> b!1552635 (= c!143024 (and ((_ is Cons!36255) lt!669170) (not (= (_1!12417 (h!37701 lt!669170)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1552637 () Bool)

(assert (=> b!1552637 (= e!864360 None!808)))

(declare-fun b!1552634 () Bool)

(assert (=> b!1552634 (= e!864359 (Some!809 (_2!12417 (h!37701 lt!669170))))))

(declare-fun b!1552636 () Bool)

(assert (=> b!1552636 (= e!864360 (getValueByKey!735 (t!50967 lt!669170) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!160923 c!143023) b!1552634))

(assert (= (and d!160923 (not c!143023)) b!1552635))

(assert (= (and b!1552635 c!143024) b!1552636))

(assert (= (and b!1552635 (not c!143024)) b!1552637))

(declare-fun m!1430569 () Bool)

(assert (=> b!1552636 m!1430569))

(assert (=> d!160837 d!160923))

(declare-fun d!160925 () Bool)

(assert (=> d!160925 (= (getValueByKey!735 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!809 (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669240 () Unit!51522)

(assert (=> d!160925 (= lt!669240 (choose!2046 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864361 () Bool)

(assert (=> d!160925 e!864361))

(declare-fun res!1062921 () Bool)

(assert (=> d!160925 (=> (not res!1062921) (not e!864361))))

(assert (=> d!160925 (= res!1062921 (isStrictlySorted!884 lt!669170))))

(assert (=> d!160925 (= (lemmaContainsTupThenGetReturnValue!375 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669240)))

(declare-fun b!1552638 () Bool)

(declare-fun res!1062922 () Bool)

(assert (=> b!1552638 (=> (not res!1062922) (not e!864361))))

(assert (=> b!1552638 (= res!1062922 (containsKey!752 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552639 () Bool)

(assert (=> b!1552639 (= e!864361 (contains!10090 lt!669170 (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!160925 res!1062921) b!1552638))

(assert (= (and b!1552638 res!1062922) b!1552639))

(assert (=> d!160925 m!1430369))

(declare-fun m!1430571 () Bool)

(assert (=> d!160925 m!1430571))

(declare-fun m!1430573 () Bool)

(assert (=> d!160925 m!1430573))

(declare-fun m!1430575 () Bool)

(assert (=> b!1552638 m!1430575))

(declare-fun m!1430577 () Bool)

(assert (=> b!1552639 m!1430577))

(assert (=> d!160837 d!160925))

(declare-fun b!1552640 () Bool)

(declare-fun res!1062923 () Bool)

(declare-fun e!864364 () Bool)

(assert (=> b!1552640 (=> (not res!1062923) (not e!864364))))

(declare-fun lt!669241 () List!36259)

(assert (=> b!1552640 (= res!1062923 (containsKey!752 lt!669241 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552641 () Bool)

(assert (=> b!1552641 (= e!864364 (contains!10090 lt!669241 (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864365 () List!36259)

(declare-fun b!1552642 () Bool)

(assert (=> b!1552642 (= e!864365 (insertStrictlySorted!504 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun c!143028 () Bool)

(declare-fun c!143026 () Bool)

(declare-fun b!1552643 () Bool)

(assert (=> b!1552643 (= e!864365 (ite c!143028 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (ite c!143026 (Cons!36255 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) Nil!36256)))))

(declare-fun b!1552644 () Bool)

(declare-fun e!864363 () List!36259)

(declare-fun call!71311 () List!36259)

(assert (=> b!1552644 (= e!864363 call!71311)))

(declare-fun d!160927 () Bool)

(assert (=> d!160927 e!864364))

(declare-fun res!1062924 () Bool)

(assert (=> d!160927 (=> (not res!1062924) (not e!864364))))

(assert (=> d!160927 (= res!1062924 (isStrictlySorted!884 lt!669241))))

(declare-fun e!864362 () List!36259)

(assert (=> d!160927 (= lt!669241 e!864362)))

(declare-fun c!143025 () Bool)

(assert (=> d!160927 (= c!143025 (and ((_ is Cons!36255) (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (bvslt (_1!12417 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!160927 (isStrictlySorted!884 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))))

(assert (=> d!160927 (= (insertStrictlySorted!504 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669241)))

(declare-fun b!1552645 () Bool)

(declare-fun e!864366 () List!36259)

(assert (=> b!1552645 (= e!864362 e!864366)))

(assert (=> b!1552645 (= c!143028 (and ((_ is Cons!36255) (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (= (_1!12417 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bm!71307 () Bool)

(declare-fun call!71312 () List!36259)

(assert (=> bm!71307 (= call!71311 call!71312)))

(declare-fun b!1552646 () Bool)

(declare-fun call!71310 () List!36259)

(assert (=> b!1552646 (= e!864362 call!71310)))

(declare-fun b!1552647 () Bool)

(assert (=> b!1552647 (= e!864363 call!71311)))

(declare-fun bm!71308 () Bool)

(assert (=> bm!71308 (= call!71310 ($colon$colon!946 e!864365 (ite c!143025 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun c!143027 () Bool)

(assert (=> bm!71308 (= c!143027 c!143025)))

(declare-fun b!1552648 () Bool)

(assert (=> b!1552648 (= c!143026 (and ((_ is Cons!36255) (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (bvsgt (_1!12417 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> b!1552648 (= e!864366 e!864363)))

(declare-fun b!1552649 () Bool)

(assert (=> b!1552649 (= e!864366 call!71312)))

(declare-fun bm!71309 () Bool)

(assert (=> bm!71309 (= call!71312 call!71310)))

(assert (= (and d!160927 c!143025) b!1552646))

(assert (= (and d!160927 (not c!143025)) b!1552645))

(assert (= (and b!1552645 c!143028) b!1552649))

(assert (= (and b!1552645 (not c!143028)) b!1552648))

(assert (= (and b!1552648 c!143026) b!1552644))

(assert (= (and b!1552648 (not c!143026)) b!1552647))

(assert (= (or b!1552644 b!1552647) bm!71307))

(assert (= (or b!1552649 bm!71307) bm!71309))

(assert (= (or b!1552646 bm!71309) bm!71308))

(assert (= (and bm!71308 c!143027) b!1552642))

(assert (= (and bm!71308 (not c!143027)) b!1552643))

(assert (= (and d!160927 res!1062924) b!1552640))

(assert (= (and b!1552640 res!1062923) b!1552641))

(declare-fun m!1430579 () Bool)

(assert (=> b!1552642 m!1430579))

(declare-fun m!1430581 () Bool)

(assert (=> bm!71308 m!1430581))

(declare-fun m!1430583 () Bool)

(assert (=> b!1552640 m!1430583))

(declare-fun m!1430585 () Bool)

(assert (=> b!1552641 m!1430585))

(declare-fun m!1430587 () Bool)

(assert (=> d!160927 m!1430587))

(declare-fun m!1430589 () Bool)

(assert (=> d!160927 m!1430589))

(assert (=> d!160837 d!160927))

(declare-fun d!160929 () Bool)

(assert (=> d!160929 (= (get!26038 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762))) (v!21986 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160793 d!160929))

(declare-fun c!143029 () Bool)

(declare-fun d!160931 () Bool)

(assert (=> d!160931 (= c!143029 (and ((_ is Cons!36255) (toList!11226 lt!669015)) (= (_1!12417 (h!37701 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864367 () Option!810)

(assert (=> d!160931 (= (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)) e!864367)))

(declare-fun b!1552651 () Bool)

(declare-fun e!864368 () Option!810)

(assert (=> b!1552651 (= e!864367 e!864368)))

(declare-fun c!143030 () Bool)

(assert (=> b!1552651 (= c!143030 (and ((_ is Cons!36255) (toList!11226 lt!669015)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552653 () Bool)

(assert (=> b!1552653 (= e!864368 None!808)))

(declare-fun b!1552650 () Bool)

(assert (=> b!1552650 (= e!864367 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669015)))))))

(declare-fun b!1552652 () Bool)

(assert (=> b!1552652 (= e!864368 (getValueByKey!735 (t!50967 (toList!11226 lt!669015)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160931 c!143029) b!1552650))

(assert (= (and d!160931 (not c!143029)) b!1552651))

(assert (= (and b!1552651 c!143030) b!1552652))

(assert (= (and b!1552651 (not c!143030)) b!1552653))

(assert (=> b!1552652 m!1430059))

(declare-fun m!1430591 () Bool)

(assert (=> b!1552652 m!1430591))

(assert (=> d!160793 d!160931))

(declare-fun d!160933 () Bool)

(assert (=> d!160933 (= (get!26038 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21986 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160825 d!160933))

(declare-fun d!160935 () Bool)

(declare-fun c!143031 () Bool)

(assert (=> d!160935 (= c!143031 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (= (_1!12417 (h!37701 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864369 () Option!810)

(assert (=> d!160935 (= (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000) e!864369)))

(declare-fun b!1552655 () Bool)

(declare-fun e!864370 () Option!810)

(assert (=> b!1552655 (= e!864369 e!864370)))

(declare-fun c!143032 () Bool)

(assert (=> b!1552655 (= c!143032 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552657 () Bool)

(assert (=> b!1552657 (= e!864370 None!808)))

(declare-fun b!1552654 () Bool)

(assert (=> b!1552654 (= e!864369 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669012)))))))

(declare-fun b!1552656 () Bool)

(assert (=> b!1552656 (= e!864370 (getValueByKey!735 (t!50967 (toList!11226 lt!669012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160935 c!143031) b!1552654))

(assert (= (and d!160935 (not c!143031)) b!1552655))

(assert (= (and b!1552655 c!143032) b!1552656))

(assert (= (and b!1552655 (not c!143032)) b!1552657))

(declare-fun m!1430593 () Bool)

(assert (=> b!1552656 m!1430593))

(assert (=> d!160825 d!160935))

(declare-fun d!160937 () Bool)

(declare-fun res!1062925 () Bool)

(declare-fun e!864371 () Bool)

(assert (=> d!160937 (=> res!1062925 e!864371)))

(assert (=> d!160937 (= res!1062925 (and ((_ is Cons!36255) (toList!11226 lt!669015)) (= (_1!12417 (h!37701 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160937 (= (containsKey!752 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)) e!864371)))

(declare-fun b!1552658 () Bool)

(declare-fun e!864372 () Bool)

(assert (=> b!1552658 (= e!864371 e!864372)))

(declare-fun res!1062926 () Bool)

(assert (=> b!1552658 (=> (not res!1062926) (not e!864372))))

(assert (=> b!1552658 (= res!1062926 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669015))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (toList!11226 lt!669015)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552659 () Bool)

(assert (=> b!1552659 (= e!864372 (containsKey!752 (t!50967 (toList!11226 lt!669015)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160937 (not res!1062925)) b!1552658))

(assert (= (and b!1552658 res!1062926) b!1552659))

(assert (=> b!1552659 m!1430059))

(declare-fun m!1430595 () Bool)

(assert (=> b!1552659 m!1430595))

(assert (=> d!160805 d!160937))

(declare-fun d!160939 () Bool)

(assert (=> d!160939 (= (get!26038 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!21986 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160839 d!160939))

(declare-fun d!160941 () Bool)

(declare-fun c!143033 () Bool)

(assert (=> d!160941 (= c!143033 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (= (_1!12417 (h!37701 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864373 () Option!810)

(assert (=> d!160941 (= (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000) e!864373)))

(declare-fun b!1552661 () Bool)

(declare-fun e!864374 () Option!810)

(assert (=> b!1552661 (= e!864373 e!864374)))

(declare-fun c!143034 () Bool)

(assert (=> b!1552661 (= c!143034 (and ((_ is Cons!36255) (toList!11226 lt!669012)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552663 () Bool)

(assert (=> b!1552663 (= e!864374 None!808)))

(declare-fun b!1552660 () Bool)

(assert (=> b!1552660 (= e!864373 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669012)))))))

(declare-fun b!1552662 () Bool)

(assert (=> b!1552662 (= e!864374 (getValueByKey!735 (t!50967 (toList!11226 lt!669012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160941 c!143033) b!1552660))

(assert (= (and d!160941 (not c!143033)) b!1552661))

(assert (= (and b!1552661 c!143034) b!1552662))

(assert (= (and b!1552661 (not c!143034)) b!1552663))

(declare-fun m!1430597 () Bool)

(assert (=> b!1552662 m!1430597))

(assert (=> d!160839 d!160941))

(declare-fun d!160943 () Bool)

(declare-fun lt!669242 () Bool)

(assert (=> d!160943 (= lt!669242 (select (content!783 (toList!11226 lt!669148)) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun e!864375 () Bool)

(assert (=> d!160943 (= lt!669242 e!864375)))

(declare-fun res!1062928 () Bool)

(assert (=> d!160943 (=> (not res!1062928) (not e!864375))))

(assert (=> d!160943 (= res!1062928 ((_ is Cons!36255) (toList!11226 lt!669148)))))

(assert (=> d!160943 (= (contains!10090 (toList!11226 lt!669148) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669242)))

(declare-fun b!1552664 () Bool)

(declare-fun e!864376 () Bool)

(assert (=> b!1552664 (= e!864375 e!864376)))

(declare-fun res!1062927 () Bool)

(assert (=> b!1552664 (=> res!1062927 e!864376)))

(assert (=> b!1552664 (= res!1062927 (= (h!37701 (toList!11226 lt!669148)) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun b!1552665 () Bool)

(assert (=> b!1552665 (= e!864376 (contains!10090 (t!50967 (toList!11226 lt!669148)) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160943 res!1062928) b!1552664))

(assert (= (and b!1552664 (not res!1062927)) b!1552665))

(declare-fun m!1430599 () Bool)

(assert (=> d!160943 m!1430599))

(declare-fun m!1430601 () Bool)

(assert (=> d!160943 m!1430601))

(declare-fun m!1430603 () Bool)

(assert (=> b!1552665 m!1430603))

(assert (=> b!1552426 d!160943))

(assert (=> b!1552365 d!160917))

(declare-fun d!160945 () Bool)

(declare-fun lt!669243 () Bool)

(assert (=> d!160945 (= lt!669243 (select (content!783 (toList!11226 lt!669144)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864377 () Bool)

(assert (=> d!160945 (= lt!669243 e!864377)))

(declare-fun res!1062930 () Bool)

(assert (=> d!160945 (=> (not res!1062930) (not e!864377))))

(assert (=> d!160945 (= res!1062930 ((_ is Cons!36255) (toList!11226 lt!669144)))))

(assert (=> d!160945 (= (contains!10090 (toList!11226 lt!669144) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669243)))

(declare-fun b!1552666 () Bool)

(declare-fun e!864378 () Bool)

(assert (=> b!1552666 (= e!864377 e!864378)))

(declare-fun res!1062929 () Bool)

(assert (=> b!1552666 (=> res!1062929 e!864378)))

(assert (=> b!1552666 (= res!1062929 (= (h!37701 (toList!11226 lt!669144)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552667 () Bool)

(assert (=> b!1552667 (= e!864378 (contains!10090 (t!50967 (toList!11226 lt!669144)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160945 res!1062930) b!1552666))

(assert (= (and b!1552666 (not res!1062929)) b!1552667))

(declare-fun m!1430605 () Bool)

(assert (=> d!160945 m!1430605))

(declare-fun m!1430607 () Bool)

(assert (=> d!160945 m!1430607))

(declare-fun m!1430609 () Bool)

(assert (=> b!1552667 m!1430609))

(assert (=> b!1552424 d!160945))

(declare-fun b!1552668 () Bool)

(declare-fun e!864385 () Bool)

(declare-fun lt!669246 () ListLongMap!22421)

(assert (=> b!1552668 (= e!864385 (isEmpty!1137 lt!669246))))

(declare-fun b!1552669 () Bool)

(declare-fun e!864380 () Bool)

(declare-fun e!864382 () Bool)

(assert (=> b!1552669 (= e!864380 e!864382)))

(declare-fun c!143035 () Bool)

(declare-fun e!864379 () Bool)

(assert (=> b!1552669 (= c!143035 e!864379)))

(declare-fun res!1062932 () Bool)

(assert (=> b!1552669 (=> (not res!1062932) (not e!864379))))

(assert (=> b!1552669 (= res!1062932 (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1552670 () Bool)

(declare-fun lt!669250 () Unit!51522)

(declare-fun lt!669244 () Unit!51522)

(assert (=> b!1552670 (= lt!669250 lt!669244)))

(declare-fun lt!669247 () ListLongMap!22421)

(declare-fun lt!669249 () (_ BitVec 64))

(declare-fun lt!669245 () (_ BitVec 64))

(declare-fun lt!669248 () V!59389)

(assert (=> b!1552670 (not (contains!10087 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248)) lt!669249))))

(assert (=> b!1552670 (= lt!669244 (addStillNotContains!501 lt!669247 lt!669245 lt!669248 lt!669249))))

(assert (=> b!1552670 (= lt!669249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1552670 (= lt!669248 (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1552670 (= lt!669245 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))

(declare-fun call!71313 () ListLongMap!22421)

(assert (=> b!1552670 (= lt!669247 call!71313)))

(declare-fun e!864384 () ListLongMap!22421)

(assert (=> b!1552670 (= e!864384 (+!5040 call!71313 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552671 () Bool)

(assert (=> b!1552671 (= e!864385 (= lt!669246 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1552672 () Bool)

(declare-fun e!864383 () ListLongMap!22421)

(assert (=> b!1552672 (= e!864383 e!864384)))

(declare-fun c!143038 () Bool)

(assert (=> b!1552672 (= c!143038 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun d!160947 () Bool)

(assert (=> d!160947 e!864380))

(declare-fun res!1062931 () Bool)

(assert (=> d!160947 (=> (not res!1062931) (not e!864380))))

(assert (=> d!160947 (= res!1062931 (not (contains!10087 lt!669246 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160947 (= lt!669246 e!864383)))

(declare-fun c!143037 () Bool)

(assert (=> d!160947 (= c!143037 (bvsge (bvadd from!762 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> d!160947 (validMask!0 mask!926)))

(assert (=> d!160947 (= (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478) lt!669246)))

(declare-fun bm!71310 () Bool)

(assert (=> bm!71310 (= call!71313 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1552673 () Bool)

(assert (=> b!1552673 (= e!864382 e!864385)))

(declare-fun c!143036 () Bool)

(assert (=> b!1552673 (= c!143036 (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1552674 () Bool)

(declare-fun res!1062933 () Bool)

(assert (=> b!1552674 (=> (not res!1062933) (not e!864380))))

(assert (=> b!1552674 (= res!1062933 (not (contains!10087 lt!669246 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552675 () Bool)

(assert (=> b!1552675 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> b!1552675 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50523 _values!470)))))

(declare-fun e!864381 () Bool)

(assert (=> b!1552675 (= e!864381 (= (apply!1097 lt!669246 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552676 () Bool)

(assert (=> b!1552676 (= e!864379 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1552676 (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1552677 () Bool)

(assert (=> b!1552677 (= e!864384 call!71313)))

(declare-fun b!1552678 () Bool)

(assert (=> b!1552678 (= e!864382 e!864381)))

(assert (=> b!1552678 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun res!1062934 () Bool)

(assert (=> b!1552678 (= res!1062934 (contains!10087 lt!669246 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1552678 (=> (not res!1062934) (not e!864381))))

(declare-fun b!1552679 () Bool)

(assert (=> b!1552679 (= e!864383 (ListLongMap!22422 Nil!36256))))

(assert (= (and d!160947 c!143037) b!1552679))

(assert (= (and d!160947 (not c!143037)) b!1552672))

(assert (= (and b!1552672 c!143038) b!1552670))

(assert (= (and b!1552672 (not c!143038)) b!1552677))

(assert (= (or b!1552670 b!1552677) bm!71310))

(assert (= (and d!160947 res!1062931) b!1552674))

(assert (= (and b!1552674 res!1062933) b!1552669))

(assert (= (and b!1552669 res!1062932) b!1552676))

(assert (= (and b!1552669 c!143035) b!1552678))

(assert (= (and b!1552669 (not c!143035)) b!1552673))

(assert (= (and b!1552678 res!1062934) b!1552675))

(assert (= (and b!1552673 c!143036) b!1552671))

(assert (= (and b!1552673 (not c!143036)) b!1552668))

(declare-fun b_lambda!24793 () Bool)

(assert (=> (not b_lambda!24793) (not b!1552670)))

(assert (=> b!1552670 t!50966))

(declare-fun b_and!51369 () Bool)

(assert (= b_and!51367 (and (=> t!50966 result!26077) b_and!51369)))

(declare-fun b_lambda!24795 () Bool)

(assert (=> (not b_lambda!24795) (not b!1552675)))

(assert (=> b!1552675 t!50966))

(declare-fun b_and!51371 () Bool)

(assert (= b_and!51369 (and (=> t!50966 result!26077) b_and!51371)))

(declare-fun m!1430611 () Bool)

(assert (=> b!1552675 m!1430611))

(assert (=> b!1552675 m!1430111))

(declare-fun m!1430613 () Bool)

(assert (=> b!1552675 m!1430613))

(assert (=> b!1552675 m!1430111))

(declare-fun m!1430615 () Bool)

(assert (=> b!1552675 m!1430615))

(declare-fun m!1430617 () Bool)

(assert (=> b!1552675 m!1430617))

(assert (=> b!1552675 m!1430611))

(assert (=> b!1552675 m!1430615))

(declare-fun m!1430619 () Bool)

(assert (=> d!160947 m!1430619))

(assert (=> d!160947 m!1430073))

(assert (=> b!1552676 m!1430615))

(assert (=> b!1552676 m!1430615))

(declare-fun m!1430621 () Bool)

(assert (=> b!1552676 m!1430621))

(declare-fun m!1430623 () Bool)

(assert (=> b!1552671 m!1430623))

(assert (=> bm!71310 m!1430623))

(assert (=> b!1552670 m!1430611))

(assert (=> b!1552670 m!1430111))

(assert (=> b!1552670 m!1430613))

(declare-fun m!1430625 () Bool)

(assert (=> b!1552670 m!1430625))

(assert (=> b!1552670 m!1430111))

(declare-fun m!1430627 () Bool)

(assert (=> b!1552670 m!1430627))

(assert (=> b!1552670 m!1430627))

(declare-fun m!1430629 () Bool)

(assert (=> b!1552670 m!1430629))

(declare-fun m!1430631 () Bool)

(assert (=> b!1552670 m!1430631))

(assert (=> b!1552670 m!1430611))

(assert (=> b!1552670 m!1430615))

(assert (=> b!1552672 m!1430615))

(assert (=> b!1552672 m!1430615))

(assert (=> b!1552672 m!1430621))

(declare-fun m!1430633 () Bool)

(assert (=> b!1552668 m!1430633))

(assert (=> b!1552678 m!1430615))

(assert (=> b!1552678 m!1430615))

(declare-fun m!1430635 () Bool)

(assert (=> b!1552678 m!1430635))

(declare-fun m!1430637 () Bool)

(assert (=> b!1552674 m!1430637))

(assert (=> bm!71290 d!160947))

(declare-fun c!143039 () Bool)

(declare-fun d!160949 () Bool)

(assert (=> d!160949 (= c!143039 (and ((_ is Cons!36255) (toList!11226 lt!669168)) (= (_1!12417 (h!37701 (toList!11226 lt!669168))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864386 () Option!810)

(assert (=> d!160949 (= (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864386)))

(declare-fun b!1552681 () Bool)

(declare-fun e!864387 () Option!810)

(assert (=> b!1552681 (= e!864386 e!864387)))

(declare-fun c!143040 () Bool)

(assert (=> b!1552681 (= c!143040 (and ((_ is Cons!36255) (toList!11226 lt!669168)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669168))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1552683 () Bool)

(assert (=> b!1552683 (= e!864387 None!808)))

(declare-fun b!1552680 () Bool)

(assert (=> b!1552680 (= e!864386 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669168)))))))

(declare-fun b!1552682 () Bool)

(assert (=> b!1552682 (= e!864387 (getValueByKey!735 (t!50967 (toList!11226 lt!669168)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!160949 c!143039) b!1552680))

(assert (= (and d!160949 (not c!143039)) b!1552681))

(assert (= (and b!1552681 c!143040) b!1552682))

(assert (= (and b!1552681 (not c!143040)) b!1552683))

(declare-fun m!1430639 () Bool)

(assert (=> b!1552682 m!1430639))

(assert (=> b!1552459 d!160949))

(declare-fun d!160951 () Bool)

(declare-fun lt!669251 () Bool)

(assert (=> d!160951 (= lt!669251 (select (content!783 (toList!11226 lt!669152)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864388 () Bool)

(assert (=> d!160951 (= lt!669251 e!864388)))

(declare-fun res!1062936 () Bool)

(assert (=> d!160951 (=> (not res!1062936) (not e!864388))))

(assert (=> d!160951 (= res!1062936 ((_ is Cons!36255) (toList!11226 lt!669152)))))

(assert (=> d!160951 (= (contains!10090 (toList!11226 lt!669152) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669251)))

(declare-fun b!1552684 () Bool)

(declare-fun e!864389 () Bool)

(assert (=> b!1552684 (= e!864388 e!864389)))

(declare-fun res!1062935 () Bool)

(assert (=> b!1552684 (=> res!1062935 e!864389)))

(assert (=> b!1552684 (= res!1062935 (= (h!37701 (toList!11226 lt!669152)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552685 () Bool)

(assert (=> b!1552685 (= e!864389 (contains!10090 (t!50967 (toList!11226 lt!669152)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160951 res!1062936) b!1552684))

(assert (= (and b!1552684 (not res!1062935)) b!1552685))

(declare-fun m!1430641 () Bool)

(assert (=> d!160951 m!1430641))

(declare-fun m!1430643 () Bool)

(assert (=> d!160951 m!1430643))

(declare-fun m!1430645 () Bool)

(assert (=> b!1552685 m!1430645))

(assert (=> b!1552428 d!160951))

(assert (=> b!1552396 d!160947))

(assert (=> b!1552452 d!160917))

(declare-fun d!160953 () Bool)

(declare-fun isEmpty!1139 (Option!810) Bool)

(assert (=> d!160953 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44569 () Bool)

(assert (= bs!44569 d!160953))

(assert (=> bs!44569 m!1430335))

(declare-fun m!1430647 () Bool)

(assert (=> bs!44569 m!1430647))

(assert (=> b!1552431 d!160953))

(assert (=> b!1552431 d!160941))

(declare-fun d!160955 () Bool)

(declare-fun e!864390 () Bool)

(assert (=> d!160955 e!864390))

(declare-fun res!1062937 () Bool)

(assert (=> d!160955 (=> res!1062937 e!864390)))

(declare-fun lt!669254 () Bool)

(assert (=> d!160955 (= res!1062937 (not lt!669254))))

(declare-fun lt!669252 () Bool)

(assert (=> d!160955 (= lt!669254 lt!669252)))

(declare-fun lt!669255 () Unit!51522)

(declare-fun e!864391 () Unit!51522)

(assert (=> d!160955 (= lt!669255 e!864391)))

(declare-fun c!143041 () Bool)

(assert (=> d!160955 (= c!143041 lt!669252)))

(assert (=> d!160955 (= lt!669252 (containsKey!752 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!160955 (= (contains!10087 lt!669115 #b1000000000000000000000000000000000000000000000000000000000000000) lt!669254)))

(declare-fun b!1552686 () Bool)

(declare-fun lt!669253 () Unit!51522)

(assert (=> b!1552686 (= e!864391 lt!669253)))

(assert (=> b!1552686 (= lt!669253 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552686 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552687 () Bool)

(declare-fun Unit!51541 () Unit!51522)

(assert (=> b!1552687 (= e!864391 Unit!51541)))

(declare-fun b!1552688 () Bool)

(assert (=> b!1552688 (= e!864390 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160955 c!143041) b!1552686))

(assert (= (and d!160955 (not c!143041)) b!1552687))

(assert (= (and d!160955 (not res!1062937)) b!1552688))

(declare-fun m!1430649 () Bool)

(assert (=> d!160955 m!1430649))

(declare-fun m!1430651 () Bool)

(assert (=> b!1552686 m!1430651))

(declare-fun m!1430653 () Bool)

(assert (=> b!1552686 m!1430653))

(assert (=> b!1552686 m!1430653))

(declare-fun m!1430655 () Bool)

(assert (=> b!1552686 m!1430655))

(assert (=> b!1552688 m!1430653))

(assert (=> b!1552688 m!1430653))

(assert (=> b!1552688 m!1430655))

(assert (=> b!1552399 d!160955))

(declare-fun call!71314 () Bool)

(declare-fun c!143042 () Bool)

(declare-fun bm!71311 () Bool)

(assert (=> bm!71311 (= call!71314 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143042 (Cons!36256 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257))))))

(declare-fun b!1552689 () Bool)

(declare-fun e!864393 () Bool)

(assert (=> b!1552689 (= e!864393 call!71314)))

(declare-fun b!1552690 () Bool)

(declare-fun e!864392 () Bool)

(declare-fun e!864395 () Bool)

(assert (=> b!1552690 (= e!864392 e!864395)))

(declare-fun res!1062940 () Bool)

(assert (=> b!1552690 (=> (not res!1062940) (not e!864395))))

(declare-fun e!864394 () Bool)

(assert (=> b!1552690 (= res!1062940 (not e!864394))))

(declare-fun res!1062939 () Bool)

(assert (=> b!1552690 (=> (not res!1062939) (not e!864394))))

(assert (=> b!1552690 (= res!1062939 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!160957 () Bool)

(declare-fun res!1062938 () Bool)

(assert (=> d!160957 (=> res!1062938 e!864392)))

(assert (=> d!160957 (= res!1062938 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> d!160957 (= (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) e!864392)))

(declare-fun b!1552691 () Bool)

(assert (=> b!1552691 (= e!864394 (contains!10091 (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1552692 () Bool)

(assert (=> b!1552692 (= e!864393 call!71314)))

(declare-fun b!1552693 () Bool)

(assert (=> b!1552693 (= e!864395 e!864393)))

(assert (=> b!1552693 (= c!143042 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!160957 (not res!1062938)) b!1552690))

(assert (= (and b!1552690 res!1062939) b!1552691))

(assert (= (and b!1552690 res!1062940) b!1552693))

(assert (= (and b!1552693 c!143042) b!1552692))

(assert (= (and b!1552693 (not c!143042)) b!1552689))

(assert (= (or b!1552692 b!1552689) bm!71311))

(assert (=> bm!71311 m!1430515))

(declare-fun m!1430657 () Bool)

(assert (=> bm!71311 m!1430657))

(assert (=> b!1552690 m!1430515))

(assert (=> b!1552690 m!1430515))

(assert (=> b!1552690 m!1430517))

(assert (=> b!1552691 m!1430515))

(assert (=> b!1552691 m!1430515))

(declare-fun m!1430659 () Bool)

(assert (=> b!1552691 m!1430659))

(assert (=> b!1552693 m!1430515))

(assert (=> b!1552693 m!1430515))

(assert (=> b!1552693 m!1430517))

(assert (=> bm!71293 d!160957))

(declare-fun d!160959 () Bool)

(assert (=> d!160959 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669258 () Unit!51522)

(declare-fun choose!2048 (List!36259 (_ BitVec 64)) Unit!51522)

(assert (=> d!160959 (= lt!669258 (choose!2048 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864398 () Bool)

(assert (=> d!160959 e!864398))

(declare-fun res!1062943 () Bool)

(assert (=> d!160959 (=> (not res!1062943) (not e!864398))))

(assert (=> d!160959 (= res!1062943 (isStrictlySorted!884 (toList!11226 lt!669012)))))

(assert (=> d!160959 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000) lt!669258)))

(declare-fun b!1552696 () Bool)

(assert (=> b!1552696 (= e!864398 (containsKey!752 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160959 res!1062943) b!1552696))

(assert (=> d!160959 m!1430335))

(assert (=> d!160959 m!1430335))

(assert (=> d!160959 m!1430337))

(declare-fun m!1430661 () Bool)

(assert (=> d!160959 m!1430661))

(declare-fun m!1430663 () Bool)

(assert (=> d!160959 m!1430663))

(assert (=> b!1552696 m!1430331))

(assert (=> b!1552429 d!160959))

(assert (=> b!1552429 d!160953))

(assert (=> b!1552429 d!160941))

(declare-fun d!160961 () Bool)

(assert (=> d!160961 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669259 () Unit!51522)

(assert (=> d!160961 (= lt!669259 (choose!2048 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864399 () Bool)

(assert (=> d!160961 e!864399))

(declare-fun res!1062944 () Bool)

(assert (=> d!160961 (=> (not res!1062944) (not e!864399))))

(assert (=> d!160961 (= res!1062944 (isStrictlySorted!884 (toList!11226 lt!669012)))))

(assert (=> d!160961 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)) lt!669259)))

(declare-fun b!1552697 () Bool)

(assert (=> b!1552697 (= e!864399 (containsKey!752 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160961 res!1062944) b!1552697))

(assert (=> d!160961 m!1430059))

(assert (=> d!160961 m!1430339))

(assert (=> d!160961 m!1430339))

(assert (=> d!160961 m!1430365))

(assert (=> d!160961 m!1430059))

(declare-fun m!1430665 () Bool)

(assert (=> d!160961 m!1430665))

(assert (=> d!160961 m!1430663))

(assert (=> b!1552697 m!1430059))

(assert (=> b!1552697 m!1430361))

(assert (=> b!1552456 d!160961))

(declare-fun d!160963 () Bool)

(assert (=> d!160963 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun bs!44570 () Bool)

(assert (= bs!44570 d!160963))

(assert (=> bs!44570 m!1430339))

(declare-fun m!1430667 () Bool)

(assert (=> bs!44570 m!1430667))

(assert (=> b!1552456 d!160963))

(assert (=> b!1552456 d!160845))

(declare-fun d!160965 () Bool)

(assert (=> d!160965 (= (get!26038 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762))) (v!21986 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160797 d!160965))

(declare-fun d!160967 () Bool)

(declare-fun c!143043 () Bool)

(assert (=> d!160967 (= c!143043 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (= (_1!12417 (h!37701 (toList!11226 lt!669010))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864400 () Option!810)

(assert (=> d!160967 (= (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)) e!864400)))

(declare-fun b!1552699 () Bool)

(declare-fun e!864401 () Option!810)

(assert (=> b!1552699 (= e!864400 e!864401)))

(declare-fun c!143044 () Bool)

(assert (=> b!1552699 (= c!143044 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669010))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552701 () Bool)

(assert (=> b!1552701 (= e!864401 None!808)))

(declare-fun b!1552698 () Bool)

(assert (=> b!1552698 (= e!864400 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669010)))))))

(declare-fun b!1552700 () Bool)

(assert (=> b!1552700 (= e!864401 (getValueByKey!735 (t!50967 (toList!11226 lt!669010)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160967 c!143043) b!1552698))

(assert (= (and d!160967 (not c!143043)) b!1552699))

(assert (= (and b!1552699 c!143044) b!1552700))

(assert (= (and b!1552699 (not c!143044)) b!1552701))

(assert (=> b!1552700 m!1430059))

(declare-fun m!1430669 () Bool)

(assert (=> b!1552700 m!1430669))

(assert (=> d!160797 d!160967))

(assert (=> b!1552401 d!160835))

(declare-fun d!160969 () Bool)

(assert (=> d!160969 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669260 () Unit!51522)

(assert (=> d!160969 (= lt!669260 (choose!2048 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864402 () Bool)

(assert (=> d!160969 e!864402))

(declare-fun res!1062945 () Bool)

(assert (=> d!160969 (=> (not res!1062945) (not e!864402))))

(assert (=> d!160969 (= res!1062945 (isStrictlySorted!884 (toList!11226 lt!669012)))))

(assert (=> d!160969 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000) lt!669260)))

(declare-fun b!1552702 () Bool)

(assert (=> b!1552702 (= e!864402 (containsKey!752 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160969 res!1062945) b!1552702))

(assert (=> d!160969 m!1430351))

(assert (=> d!160969 m!1430351))

(assert (=> d!160969 m!1430353))

(declare-fun m!1430671 () Bool)

(assert (=> d!160969 m!1430671))

(assert (=> d!160969 m!1430663))

(assert (=> b!1552702 m!1430347))

(assert (=> b!1552438 d!160969))

(declare-fun d!160971 () Bool)

(assert (=> d!160971 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44571 () Bool)

(assert (= bs!44571 d!160971))

(assert (=> bs!44571 m!1430351))

(declare-fun m!1430673 () Bool)

(assert (=> bs!44571 m!1430673))

(assert (=> b!1552438 d!160971))

(assert (=> b!1552438 d!160935))

(assert (=> b!1552458 d!160963))

(assert (=> b!1552458 d!160845))

(declare-fun d!160973 () Bool)

(declare-fun e!864403 () Bool)

(assert (=> d!160973 e!864403))

(declare-fun res!1062946 () Bool)

(assert (=> d!160973 (=> res!1062946 e!864403)))

(declare-fun lt!669263 () Bool)

(assert (=> d!160973 (= res!1062946 (not lt!669263))))

(declare-fun lt!669261 () Bool)

(assert (=> d!160973 (= lt!669263 lt!669261)))

(declare-fun lt!669264 () Unit!51522)

(declare-fun e!864404 () Unit!51522)

(assert (=> d!160973 (= lt!669264 e!864404)))

(declare-fun c!143045 () Bool)

(assert (=> d!160973 (= c!143045 lt!669261)))

(assert (=> d!160973 (= lt!669261 (containsKey!752 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!160973 (= (contains!10087 lt!669115 (select (arr!49970 _keys!618) from!762)) lt!669263)))

(declare-fun b!1552703 () Bool)

(declare-fun lt!669262 () Unit!51522)

(assert (=> b!1552703 (= e!864404 lt!669262)))

(assert (=> b!1552703 (= lt!669262 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1552703 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))

(declare-fun b!1552704 () Bool)

(declare-fun Unit!51542 () Unit!51522)

(assert (=> b!1552704 (= e!864404 Unit!51542)))

(declare-fun b!1552705 () Bool)

(assert (=> b!1552705 (= e!864403 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762))))))

(assert (= (and d!160973 c!143045) b!1552703))

(assert (= (and d!160973 (not c!143045)) b!1552704))

(assert (= (and d!160973 (not res!1062946)) b!1552705))

(assert (=> d!160973 m!1430059))

(declare-fun m!1430675 () Bool)

(assert (=> d!160973 m!1430675))

(assert (=> b!1552703 m!1430059))

(declare-fun m!1430677 () Bool)

(assert (=> b!1552703 m!1430677))

(assert (=> b!1552703 m!1430059))

(assert (=> b!1552703 m!1430499))

(assert (=> b!1552703 m!1430499))

(declare-fun m!1430679 () Bool)

(assert (=> b!1552703 m!1430679))

(assert (=> b!1552705 m!1430059))

(assert (=> b!1552705 m!1430499))

(assert (=> b!1552705 m!1430499))

(assert (=> b!1552705 m!1430679))

(assert (=> b!1552403 d!160973))

(declare-fun d!160975 () Bool)

(assert (=> d!160975 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun bs!44572 () Bool)

(assert (= bs!44572 d!160975))

(assert (=> bs!44572 m!1430245))

(declare-fun m!1430681 () Bool)

(assert (=> bs!44572 m!1430681))

(assert (=> b!1552417 d!160975))

(assert (=> b!1552417 d!160931))

(assert (=> b!1552440 d!160971))

(assert (=> b!1552440 d!160935))

(declare-fun d!160977 () Bool)

(declare-fun e!864405 () Bool)

(assert (=> d!160977 e!864405))

(declare-fun res!1062947 () Bool)

(assert (=> d!160977 (=> res!1062947 e!864405)))

(declare-fun lt!669267 () Bool)

(assert (=> d!160977 (= res!1062947 (not lt!669267))))

(declare-fun lt!669265 () Bool)

(assert (=> d!160977 (= lt!669267 lt!669265)))

(declare-fun lt!669268 () Unit!51522)

(declare-fun e!864406 () Unit!51522)

(assert (=> d!160977 (= lt!669268 e!864406)))

(declare-fun c!143046 () Bool)

(assert (=> d!160977 (= c!143046 lt!669265)))

(assert (=> d!160977 (= lt!669265 (containsKey!752 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160977 (= (contains!10087 lt!669148 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669267)))

(declare-fun b!1552706 () Bool)

(declare-fun lt!669266 () Unit!51522)

(assert (=> b!1552706 (= e!864406 lt!669266)))

(assert (=> b!1552706 (= lt!669266 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> b!1552706 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1552707 () Bool)

(declare-fun Unit!51543 () Unit!51522)

(assert (=> b!1552707 (= e!864406 Unit!51543)))

(declare-fun b!1552708 () Bool)

(assert (=> b!1552708 (= e!864405 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!160977 c!143046) b!1552706))

(assert (= (and d!160977 (not c!143046)) b!1552707))

(assert (= (and d!160977 (not res!1062947)) b!1552708))

(declare-fun m!1430683 () Bool)

(assert (=> d!160977 m!1430683))

(declare-fun m!1430685 () Bool)

(assert (=> b!1552706 m!1430685))

(assert (=> b!1552706 m!1430315))

(assert (=> b!1552706 m!1430315))

(declare-fun m!1430687 () Bool)

(assert (=> b!1552706 m!1430687))

(assert (=> b!1552708 m!1430315))

(assert (=> b!1552708 m!1430315))

(assert (=> b!1552708 m!1430687))

(assert (=> d!160811 d!160977))

(declare-fun d!160979 () Bool)

(declare-fun c!143047 () Bool)

(assert (=> d!160979 (= c!143047 (and ((_ is Cons!36255) lt!669150) (= (_1!12417 (h!37701 lt!669150)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864407 () Option!810)

(assert (=> d!160979 (= (getValueByKey!735 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864407)))

(declare-fun b!1552710 () Bool)

(declare-fun e!864408 () Option!810)

(assert (=> b!1552710 (= e!864407 e!864408)))

(declare-fun c!143048 () Bool)

(assert (=> b!1552710 (= c!143048 (and ((_ is Cons!36255) lt!669150) (not (= (_1!12417 (h!37701 lt!669150)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1552712 () Bool)

(assert (=> b!1552712 (= e!864408 None!808)))

(declare-fun b!1552709 () Bool)

(assert (=> b!1552709 (= e!864407 (Some!809 (_2!12417 (h!37701 lt!669150))))))

(declare-fun b!1552711 () Bool)

(assert (=> b!1552711 (= e!864408 (getValueByKey!735 (t!50967 lt!669150) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!160979 c!143047) b!1552709))

(assert (= (and d!160979 (not c!143047)) b!1552710))

(assert (= (and b!1552710 c!143048) b!1552711))

(assert (= (and b!1552710 (not c!143048)) b!1552712))

(declare-fun m!1430689 () Bool)

(assert (=> b!1552711 m!1430689))

(assert (=> d!160811 d!160979))

(declare-fun d!160981 () Bool)

(assert (=> d!160981 (= (getValueByKey!735 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669269 () Unit!51522)

(assert (=> d!160981 (= lt!669269 (choose!2046 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun e!864409 () Bool)

(assert (=> d!160981 e!864409))

(declare-fun res!1062948 () Bool)

(assert (=> d!160981 (=> (not res!1062948) (not e!864409))))

(assert (=> d!160981 (= res!1062948 (isStrictlySorted!884 lt!669150))))

(assert (=> d!160981 (= (lemmaContainsTupThenGetReturnValue!375 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669269)))

(declare-fun b!1552713 () Bool)

(declare-fun res!1062949 () Bool)

(assert (=> b!1552713 (=> (not res!1062949) (not e!864409))))

(assert (=> b!1552713 (= res!1062949 (containsKey!752 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1552714 () Bool)

(assert (=> b!1552714 (= e!864409 (contains!10090 lt!669150 (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!160981 res!1062948) b!1552713))

(assert (= (and b!1552713 res!1062949) b!1552714))

(assert (=> d!160981 m!1430309))

(declare-fun m!1430691 () Bool)

(assert (=> d!160981 m!1430691))

(declare-fun m!1430693 () Bool)

(assert (=> d!160981 m!1430693))

(declare-fun m!1430695 () Bool)

(assert (=> b!1552713 m!1430695))

(declare-fun m!1430697 () Bool)

(assert (=> b!1552714 m!1430697))

(assert (=> d!160811 d!160981))

(declare-fun b!1552715 () Bool)

(declare-fun res!1062950 () Bool)

(declare-fun e!864412 () Bool)

(assert (=> b!1552715 (=> (not res!1062950) (not e!864412))))

(declare-fun lt!669270 () List!36259)

(assert (=> b!1552715 (= res!1062950 (containsKey!752 lt!669270 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1552716 () Bool)

(assert (=> b!1552716 (= e!864412 (contains!10090 lt!669270 (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552717 () Bool)

(declare-fun e!864413 () List!36259)

(assert (=> b!1552717 (= e!864413 (insertStrictlySorted!504 (t!50967 (toList!11226 lt!669010)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun c!143052 () Bool)

(declare-fun b!1552718 () Bool)

(declare-fun c!143050 () Bool)

(assert (=> b!1552718 (= e!864413 (ite c!143052 (t!50967 (toList!11226 lt!669010)) (ite c!143050 (Cons!36255 (h!37701 (toList!11226 lt!669010)) (t!50967 (toList!11226 lt!669010))) Nil!36256)))))

(declare-fun b!1552719 () Bool)

(declare-fun e!864411 () List!36259)

(declare-fun call!71316 () List!36259)

(assert (=> b!1552719 (= e!864411 call!71316)))

(declare-fun d!160983 () Bool)

(assert (=> d!160983 e!864412))

(declare-fun res!1062951 () Bool)

(assert (=> d!160983 (=> (not res!1062951) (not e!864412))))

(assert (=> d!160983 (= res!1062951 (isStrictlySorted!884 lt!669270))))

(declare-fun e!864410 () List!36259)

(assert (=> d!160983 (= lt!669270 e!864410)))

(declare-fun c!143049 () Bool)

(assert (=> d!160983 (= c!143049 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!160983 (isStrictlySorted!884 (toList!11226 lt!669010))))

(assert (=> d!160983 (= (insertStrictlySorted!504 (toList!11226 lt!669010) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669270)))

(declare-fun b!1552720 () Bool)

(declare-fun e!864414 () List!36259)

(assert (=> b!1552720 (= e!864410 e!864414)))

(assert (=> b!1552720 (= c!143052 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (= (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun bm!71312 () Bool)

(declare-fun call!71317 () List!36259)

(assert (=> bm!71312 (= call!71316 call!71317)))

(declare-fun b!1552721 () Bool)

(declare-fun call!71315 () List!36259)

(assert (=> b!1552721 (= e!864410 call!71315)))

(declare-fun b!1552722 () Bool)

(assert (=> b!1552722 (= e!864411 call!71316)))

(declare-fun bm!71313 () Bool)

(assert (=> bm!71313 (= call!71315 ($colon$colon!946 e!864413 (ite c!143049 (h!37701 (toList!11226 lt!669010)) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun c!143051 () Bool)

(assert (=> bm!71313 (= c!143051 c!143049)))

(declare-fun b!1552723 () Bool)

(assert (=> b!1552723 (= c!143050 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (bvsgt (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> b!1552723 (= e!864414 e!864411)))

(declare-fun b!1552724 () Bool)

(assert (=> b!1552724 (= e!864414 call!71317)))

(declare-fun bm!71314 () Bool)

(assert (=> bm!71314 (= call!71317 call!71315)))

(assert (= (and d!160983 c!143049) b!1552721))

(assert (= (and d!160983 (not c!143049)) b!1552720))

(assert (= (and b!1552720 c!143052) b!1552724))

(assert (= (and b!1552720 (not c!143052)) b!1552723))

(assert (= (and b!1552723 c!143050) b!1552719))

(assert (= (and b!1552723 (not c!143050)) b!1552722))

(assert (= (or b!1552719 b!1552722) bm!71312))

(assert (= (or b!1552724 bm!71312) bm!71314))

(assert (= (or b!1552721 bm!71314) bm!71313))

(assert (= (and bm!71313 c!143051) b!1552717))

(assert (= (and bm!71313 (not c!143051)) b!1552718))

(assert (= (and d!160983 res!1062951) b!1552715))

(assert (= (and b!1552715 res!1062950) b!1552716))

(declare-fun m!1430699 () Bool)

(assert (=> b!1552717 m!1430699))

(declare-fun m!1430701 () Bool)

(assert (=> bm!71313 m!1430701))

(declare-fun m!1430703 () Bool)

(assert (=> b!1552715 m!1430703))

(declare-fun m!1430705 () Bool)

(assert (=> b!1552716 m!1430705))

(declare-fun m!1430707 () Bool)

(assert (=> d!160983 m!1430707))

(assert (=> d!160983 m!1430561))

(assert (=> d!160811 d!160983))

(declare-fun d!160985 () Bool)

(assert (=> d!160985 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669271 () Unit!51522)

(assert (=> d!160985 (= lt!669271 (choose!2048 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864415 () Bool)

(assert (=> d!160985 e!864415))

(declare-fun res!1062952 () Bool)

(assert (=> d!160985 (=> (not res!1062952) (not e!864415))))

(assert (=> d!160985 (= res!1062952 (isStrictlySorted!884 (toList!11226 lt!669015)))))

(assert (=> d!160985 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)) lt!669271)))

(declare-fun b!1552725 () Bool)

(assert (=> b!1552725 (= e!864415 (containsKey!752 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160985 res!1062952) b!1552725))

(assert (=> d!160985 m!1430059))

(assert (=> d!160985 m!1430245))

(assert (=> d!160985 m!1430245))

(assert (=> d!160985 m!1430289))

(assert (=> d!160985 m!1430059))

(declare-fun m!1430709 () Bool)

(assert (=> d!160985 m!1430709))

(declare-fun m!1430711 () Bool)

(assert (=> d!160985 m!1430711))

(assert (=> b!1552725 m!1430059))

(assert (=> b!1552725 m!1430285))

(assert (=> b!1552415 d!160985))

(assert (=> b!1552415 d!160975))

(assert (=> b!1552415 d!160931))

(declare-fun condMapEmpty!59039 () Bool)

(declare-fun mapDefault!59039 () ValueCell!18194)

(assert (=> mapNonEmpty!59038 (= condMapEmpty!59039 (= mapRest!59038 ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59039)))))

(declare-fun e!864417 () Bool)

(declare-fun mapRes!59039 () Bool)

(assert (=> mapNonEmpty!59038 (= tp!112079 (and e!864417 mapRes!59039))))

(declare-fun b!1552726 () Bool)

(declare-fun e!864416 () Bool)

(assert (=> b!1552726 (= e!864416 tp_is_empty!38209)))

(declare-fun b!1552727 () Bool)

(assert (=> b!1552727 (= e!864417 tp_is_empty!38209)))

(declare-fun mapIsEmpty!59039 () Bool)

(assert (=> mapIsEmpty!59039 mapRes!59039))

(declare-fun mapNonEmpty!59039 () Bool)

(declare-fun tp!112080 () Bool)

(assert (=> mapNonEmpty!59039 (= mapRes!59039 (and tp!112080 e!864416))))

(declare-fun mapValue!59039 () ValueCell!18194)

(declare-fun mapKey!59039 () (_ BitVec 32))

(declare-fun mapRest!59039 () (Array (_ BitVec 32) ValueCell!18194))

(assert (=> mapNonEmpty!59039 (= mapRest!59038 (store mapRest!59039 mapKey!59039 mapValue!59039))))

(assert (= (and mapNonEmpty!59038 condMapEmpty!59039) mapIsEmpty!59039))

(assert (= (and mapNonEmpty!59038 (not condMapEmpty!59039)) mapNonEmpty!59039))

(assert (= (and mapNonEmpty!59039 ((_ is ValueCellFull!18194) mapValue!59039)) b!1552726))

(assert (= (and mapNonEmpty!59038 ((_ is ValueCellFull!18194) mapDefault!59039)) b!1552727))

(declare-fun m!1430713 () Bool)

(assert (=> mapNonEmpty!59039 m!1430713))

(declare-fun b_lambda!24797 () Bool)

(assert (= b_lambda!24795 (or (and start!132256 b_free!31933) b_lambda!24797)))

(declare-fun b_lambda!24799 () Bool)

(assert (= b_lambda!24793 (or (and start!132256 b_free!31933) b_lambda!24799)))

(check-sat (not bm!71313) (not d!160871) (not b!1552597) (not d!160927) (not b!1552715) (not d!160959) (not d!160909) (not d!160899) (not b!1552691) (not b!1552725) (not b!1552538) (not b!1552535) (not b!1552711) (not b!1552612) (not d!160985) (not b!1552671) (not b_lambda!24789) (not d!160903) (not b!1552690) (not d!160921) (not b!1552716) (not b!1552659) (not d!160895) (not d!160873) (not d!160913) (not b!1552541) (not b!1552678) (not b!1552696) (not b!1552665) (not b!1552639) (not d!160885) (not bm!71305) (not bm!71310) (not d!160945) (not d!160969) (not d!160853) (not b!1552638) (not b!1552586) (not b!1552532) (not d!160869) (not b!1552578) (not b!1552636) (not b!1552703) (not b!1552674) b_and!51371 (not b_next!31933) (not b!1552641) (not b!1552668) (not b!1552714) (not d!160983) (not d!160963) (not b!1552599) (not b!1552588) (not b!1552489) (not b!1552672) (not b!1552705) (not d!160847) (not d!160953) (not b_lambda!24799) (not b!1552540) (not b!1552708) (not b!1552676) (not b!1552498) (not b_lambda!24783) (not b!1552656) (not b!1552619) (not b!1552545) (not b!1552652) (not b!1552614) (not mapNonEmpty!59039) (not d!160915) (not b!1552633) (not d!160893) (not b!1552700) (not b!1552717) (not d!160897) (not b!1552520) (not b!1552706) tp_is_empty!38209 (not b!1552697) (not d!160981) (not b!1552522) (not b!1552554) (not d!160925) (not b!1552610) (not b!1552702) (not b!1552686) (not d!160943) (not b!1552675) (not b!1552623) (not b!1552631) (not d!160875) (not d!160977) (not d!160973) (not bm!71311) (not b!1552682) (not b!1552499) (not b!1552485) (not d!160881) (not d!160863) (not d!160877) (not b!1552544) (not bm!71301) (not b!1552667) (not b!1552617) (not d!160857) (not d!160971) (not d!160861) (not b!1552688) (not b!1552474) (not d!160961) (not b!1552583) (not b!1552642) (not b!1552492) (not b!1552547) (not b!1552622) (not b_lambda!24791) (not b!1552620) (not d!160951) (not b!1552600) (not b!1552530) (not b!1552685) (not b!1552713) (not b_lambda!24797) (not d!160851) (not b!1552621) (not b!1552607) (not d!160955) (not b!1552543) (not b!1552590) (not b!1552561) (not b!1552662) (not b!1552487) (not b!1552670) (not b!1552640) (not d!160975) (not d!160855) (not b!1552542) (not bm!71303) (not d!160947) (not b!1552521) (not b!1552693) (not d!160867) (not b!1552581) (not bm!71308))
(check-sat b_and!51371 (not b_next!31933))
(get-model)

(declare-fun d!160987 () Bool)

(assert (not d!160987))

(assert (=> b!1552607 d!160987))

(declare-fun d!160989 () Bool)

(assert (=> d!160989 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669272 () Unit!51522)

(assert (=> d!160989 (= lt!669272 (choose!2048 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864418 () Bool)

(assert (=> d!160989 e!864418))

(declare-fun res!1062953 () Bool)

(assert (=> d!160989 (=> (not res!1062953) (not e!864418))))

(assert (=> d!160989 (= res!1062953 (isStrictlySorted!884 (toList!11226 lt!669115)))))

(assert (=> d!160989 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)) lt!669272)))

(declare-fun b!1552728 () Bool)

(assert (=> b!1552728 (= e!864418 (containsKey!752 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160989 res!1062953) b!1552728))

(assert (=> d!160989 m!1430059))

(assert (=> d!160989 m!1430499))

(assert (=> d!160989 m!1430499))

(assert (=> d!160989 m!1430679))

(assert (=> d!160989 m!1430059))

(declare-fun m!1430715 () Bool)

(assert (=> d!160989 m!1430715))

(declare-fun m!1430717 () Bool)

(assert (=> d!160989 m!1430717))

(assert (=> b!1552728 m!1430059))

(assert (=> b!1552728 m!1430675))

(assert (=> b!1552703 d!160989))

(declare-fun d!160991 () Bool)

(assert (=> d!160991 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun bs!44573 () Bool)

(assert (= bs!44573 d!160991))

(assert (=> bs!44573 m!1430499))

(declare-fun m!1430719 () Bool)

(assert (=> bs!44573 m!1430719))

(assert (=> b!1552703 d!160991))

(declare-fun d!160993 () Bool)

(declare-fun c!143053 () Bool)

(assert (=> d!160993 (= c!143053 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (= (_1!12417 (h!37701 (toList!11226 lt!669115))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864419 () Option!810)

(assert (=> d!160993 (= (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)) e!864419)))

(declare-fun b!1552730 () Bool)

(declare-fun e!864420 () Option!810)

(assert (=> b!1552730 (= e!864419 e!864420)))

(declare-fun c!143054 () Bool)

(assert (=> b!1552730 (= c!143054 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669115))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552732 () Bool)

(assert (=> b!1552732 (= e!864420 None!808)))

(declare-fun b!1552729 () Bool)

(assert (=> b!1552729 (= e!864419 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669115)))))))

(declare-fun b!1552731 () Bool)

(assert (=> b!1552731 (= e!864420 (getValueByKey!735 (t!50967 (toList!11226 lt!669115)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160993 c!143053) b!1552729))

(assert (= (and d!160993 (not c!143053)) b!1552730))

(assert (= (and b!1552730 c!143054) b!1552731))

(assert (= (and b!1552730 (not c!143054)) b!1552732))

(assert (=> b!1552731 m!1430059))

(declare-fun m!1430721 () Bool)

(assert (=> b!1552731 m!1430721))

(assert (=> b!1552703 d!160993))

(declare-fun b!1552733 () Bool)

(declare-fun e!864427 () Bool)

(declare-fun lt!669275 () ListLongMap!22421)

(assert (=> b!1552733 (= e!864427 (isEmpty!1137 lt!669275))))

(declare-fun b!1552734 () Bool)

(declare-fun e!864422 () Bool)

(declare-fun e!864424 () Bool)

(assert (=> b!1552734 (= e!864422 e!864424)))

(declare-fun c!143055 () Bool)

(declare-fun e!864421 () Bool)

(assert (=> b!1552734 (= c!143055 e!864421)))

(declare-fun res!1062955 () Bool)

(assert (=> b!1552734 (=> (not res!1062955) (not e!864421))))

(assert (=> b!1552734 (= res!1062955 (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1552735 () Bool)

(declare-fun lt!669279 () Unit!51522)

(declare-fun lt!669273 () Unit!51522)

(assert (=> b!1552735 (= lt!669279 lt!669273)))

(declare-fun lt!669278 () (_ BitVec 64))

(declare-fun lt!669274 () (_ BitVec 64))

(declare-fun lt!669276 () ListLongMap!22421)

(declare-fun lt!669277 () V!59389)

(assert (=> b!1552735 (not (contains!10087 (+!5040 lt!669276 (tuple2!24813 lt!669274 lt!669277)) lt!669278))))

(assert (=> b!1552735 (= lt!669273 (addStillNotContains!501 lt!669276 lt!669274 lt!669277 lt!669278))))

(assert (=> b!1552735 (= lt!669278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1552735 (= lt!669277 (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1552735 (= lt!669274 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun call!71318 () ListLongMap!22421)

(assert (=> b!1552735 (= lt!669276 call!71318)))

(declare-fun e!864426 () ListLongMap!22421)

(assert (=> b!1552735 (= e!864426 (+!5040 call!71318 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552736 () Bool)

(assert (=> b!1552736 (= e!864427 (= lt!669275 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1552737 () Bool)

(declare-fun e!864425 () ListLongMap!22421)

(assert (=> b!1552737 (= e!864425 e!864426)))

(declare-fun c!143058 () Bool)

(assert (=> b!1552737 (= c!143058 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!160995 () Bool)

(assert (=> d!160995 e!864422))

(declare-fun res!1062954 () Bool)

(assert (=> d!160995 (=> (not res!1062954) (not e!864422))))

(assert (=> d!160995 (= res!1062954 (not (contains!10087 lt!669275 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160995 (= lt!669275 e!864425)))

(declare-fun c!143057 () Bool)

(assert (=> d!160995 (= c!143057 (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> d!160995 (validMask!0 mask!926)))

(assert (=> d!160995 (= (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478) lt!669275)))

(declare-fun bm!71315 () Bool)

(assert (=> bm!71315 (= call!71318 (getCurrentListMapNoExtraKeys!6660 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1552738 () Bool)

(assert (=> b!1552738 (= e!864424 e!864427)))

(declare-fun c!143056 () Bool)

(assert (=> b!1552738 (= c!143056 (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1552739 () Bool)

(declare-fun res!1062956 () Bool)

(assert (=> b!1552739 (=> (not res!1062956) (not e!864422))))

(assert (=> b!1552739 (= res!1062956 (not (contains!10087 lt!669275 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552740 () Bool)

(assert (=> b!1552740 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> b!1552740 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50523 _values!470)))))

(declare-fun e!864423 () Bool)

(assert (=> b!1552740 (= e!864423 (= (apply!1097 lt!669275 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552741 () Bool)

(assert (=> b!1552741 (= e!864421 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1552741 (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1552742 () Bool)

(assert (=> b!1552742 (= e!864426 call!71318)))

(declare-fun b!1552743 () Bool)

(assert (=> b!1552743 (= e!864424 e!864423)))

(assert (=> b!1552743 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun res!1062957 () Bool)

(assert (=> b!1552743 (= res!1062957 (contains!10087 lt!669275 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1552743 (=> (not res!1062957) (not e!864423))))

(declare-fun b!1552744 () Bool)

(assert (=> b!1552744 (= e!864425 (ListLongMap!22422 Nil!36256))))

(assert (= (and d!160995 c!143057) b!1552744))

(assert (= (and d!160995 (not c!143057)) b!1552737))

(assert (= (and b!1552737 c!143058) b!1552735))

(assert (= (and b!1552737 (not c!143058)) b!1552742))

(assert (= (or b!1552735 b!1552742) bm!71315))

(assert (= (and d!160995 res!1062954) b!1552739))

(assert (= (and b!1552739 res!1062956) b!1552734))

(assert (= (and b!1552734 res!1062955) b!1552741))

(assert (= (and b!1552734 c!143055) b!1552743))

(assert (= (and b!1552734 (not c!143055)) b!1552738))

(assert (= (and b!1552743 res!1062957) b!1552740))

(assert (= (and b!1552738 c!143056) b!1552736))

(assert (= (and b!1552738 (not c!143056)) b!1552733))

(declare-fun b_lambda!24801 () Bool)

(assert (=> (not b_lambda!24801) (not b!1552735)))

(assert (=> b!1552735 t!50966))

(declare-fun b_and!51373 () Bool)

(assert (= b_and!51371 (and (=> t!50966 result!26077) b_and!51373)))

(declare-fun b_lambda!24803 () Bool)

(assert (=> (not b_lambda!24803) (not b!1552740)))

(assert (=> b!1552740 t!50966))

(declare-fun b_and!51375 () Bool)

(assert (= b_and!51373 (and (=> t!50966 result!26077) b_and!51375)))

(declare-fun m!1430723 () Bool)

(assert (=> b!1552740 m!1430723))

(assert (=> b!1552740 m!1430111))

(declare-fun m!1430725 () Bool)

(assert (=> b!1552740 m!1430725))

(assert (=> b!1552740 m!1430111))

(declare-fun m!1430727 () Bool)

(assert (=> b!1552740 m!1430727))

(declare-fun m!1430729 () Bool)

(assert (=> b!1552740 m!1430729))

(assert (=> b!1552740 m!1430723))

(assert (=> b!1552740 m!1430727))

(declare-fun m!1430731 () Bool)

(assert (=> d!160995 m!1430731))

(assert (=> d!160995 m!1430073))

(assert (=> b!1552741 m!1430727))

(assert (=> b!1552741 m!1430727))

(declare-fun m!1430733 () Bool)

(assert (=> b!1552741 m!1430733))

(declare-fun m!1430735 () Bool)

(assert (=> b!1552736 m!1430735))

(assert (=> bm!71315 m!1430735))

(assert (=> b!1552735 m!1430723))

(assert (=> b!1552735 m!1430111))

(assert (=> b!1552735 m!1430725))

(declare-fun m!1430737 () Bool)

(assert (=> b!1552735 m!1430737))

(assert (=> b!1552735 m!1430111))

(declare-fun m!1430739 () Bool)

(assert (=> b!1552735 m!1430739))

(assert (=> b!1552735 m!1430739))

(declare-fun m!1430741 () Bool)

(assert (=> b!1552735 m!1430741))

(declare-fun m!1430743 () Bool)

(assert (=> b!1552735 m!1430743))

(assert (=> b!1552735 m!1430723))

(assert (=> b!1552735 m!1430727))

(assert (=> b!1552737 m!1430727))

(assert (=> b!1552737 m!1430727))

(assert (=> b!1552737 m!1430733))

(declare-fun m!1430745 () Bool)

(assert (=> b!1552733 m!1430745))

(assert (=> b!1552743 m!1430727))

(assert (=> b!1552743 m!1430727))

(declare-fun m!1430747 () Bool)

(assert (=> b!1552743 m!1430747))

(declare-fun m!1430749 () Bool)

(assert (=> b!1552739 m!1430749))

(assert (=> bm!71310 d!160995))

(declare-fun d!160997 () Bool)

(declare-fun res!1062958 () Bool)

(declare-fun e!864428 () Bool)

(assert (=> d!160997 (=> res!1062958 e!864428)))

(assert (=> d!160997 (= res!1062958 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160997 (= (containsKey!752 (t!50967 (toList!11226 lt!669012)) (select (arr!49970 _keys!618) from!762)) e!864428)))

(declare-fun b!1552745 () Bool)

(declare-fun e!864429 () Bool)

(assert (=> b!1552745 (= e!864428 e!864429)))

(declare-fun res!1062959 () Bool)

(assert (=> b!1552745 (=> (not res!1062959) (not e!864429))))

(assert (=> b!1552745 (= res!1062959 (and (or (not ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012)))) (bvsle (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552746 () Bool)

(assert (=> b!1552746 (= e!864429 (containsKey!752 (t!50967 (t!50967 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160997 (not res!1062958)) b!1552745))

(assert (= (and b!1552745 res!1062959) b!1552746))

(assert (=> b!1552746 m!1430059))

(declare-fun m!1430751 () Bool)

(assert (=> b!1552746 m!1430751))

(assert (=> b!1552581 d!160997))

(declare-fun d!160999 () Bool)

(assert (=> d!160999 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669280 () Unit!51522)

(assert (=> d!160999 (= lt!669280 (choose!2048 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864430 () Bool)

(assert (=> d!160999 e!864430))

(declare-fun res!1062960 () Bool)

(assert (=> d!160999 (=> (not res!1062960) (not e!864430))))

(assert (=> d!160999 (= res!1062960 (isStrictlySorted!884 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!160999 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)) lt!669280)))

(declare-fun b!1552747 () Bool)

(assert (=> b!1552747 (= e!864430 (containsKey!752 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!160999 res!1062960) b!1552747))

(assert (=> d!160999 m!1430059))

(assert (=> d!160999 m!1430433))

(assert (=> d!160999 m!1430433))

(assert (=> d!160999 m!1430507))

(assert (=> d!160999 m!1430059))

(declare-fun m!1430753 () Bool)

(assert (=> d!160999 m!1430753))

(declare-fun m!1430755 () Bool)

(assert (=> d!160999 m!1430755))

(assert (=> b!1552747 m!1430059))

(assert (=> b!1552747 m!1430503))

(assert (=> b!1552588 d!160999))

(declare-fun d!161001 () Bool)

(assert (=> d!161001 (= (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun bs!44574 () Bool)

(assert (= bs!44574 d!161001))

(assert (=> bs!44574 m!1430433))

(declare-fun m!1430757 () Bool)

(assert (=> bs!44574 m!1430757))

(assert (=> b!1552588 d!161001))

(declare-fun d!161003 () Bool)

(declare-fun c!143059 () Bool)

(assert (=> d!161003 (= c!143059 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864431 () Option!810)

(assert (=> d!161003 (= (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)) e!864431)))

(declare-fun b!1552749 () Bool)

(declare-fun e!864432 () Option!810)

(assert (=> b!1552749 (= e!864431 e!864432)))

(declare-fun c!143060 () Bool)

(assert (=> b!1552749 (= c!143060 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (not (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552751 () Bool)

(assert (=> b!1552751 (= e!864432 None!808)))

(declare-fun b!1552748 () Bool)

(assert (=> b!1552748 (= e!864431 (Some!809 (_2!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))))

(declare-fun b!1552750 () Bool)

(assert (=> b!1552750 (= e!864432 (getValueByKey!735 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161003 c!143059) b!1552748))

(assert (= (and d!161003 (not c!143059)) b!1552749))

(assert (= (and b!1552749 c!143060) b!1552750))

(assert (= (and b!1552749 (not c!143060)) b!1552751))

(assert (=> b!1552750 m!1430059))

(declare-fun m!1430759 () Bool)

(assert (=> b!1552750 m!1430759))

(assert (=> b!1552588 d!161003))

(declare-fun d!161005 () Bool)

(declare-fun c!143061 () Bool)

(assert (=> d!161005 (= c!143061 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669152))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669152)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864433 () Option!810)

(assert (=> d!161005 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669152)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864433)))

(declare-fun b!1552753 () Bool)

(declare-fun e!864434 () Option!810)

(assert (=> b!1552753 (= e!864433 e!864434)))

(declare-fun c!143062 () Bool)

(assert (=> b!1552753 (= c!143062 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669152))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669152)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552755 () Bool)

(assert (=> b!1552755 (= e!864434 None!808)))

(declare-fun b!1552752 () Bool)

(assert (=> b!1552752 (= e!864433 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669152))))))))

(declare-fun b!1552754 () Bool)

(assert (=> b!1552754 (= e!864434 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669152))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161005 c!143061) b!1552752))

(assert (= (and d!161005 (not c!143061)) b!1552753))

(assert (= (and b!1552753 c!143062) b!1552754))

(assert (= (and b!1552753 (not c!143062)) b!1552755))

(declare-fun m!1430761 () Bool)

(assert (=> b!1552754 m!1430761))

(assert (=> b!1552586 d!161005))

(declare-fun c!143063 () Bool)

(declare-fun d!161007 () Bool)

(assert (=> d!161007 (= c!143063 (and ((_ is Cons!36255) (toList!11226 lt!669190)) (= (_1!12417 (h!37701 (toList!11226 lt!669190))) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!864435 () Option!810)

(assert (=> d!161007 (= (getValueByKey!735 (toList!11226 lt!669190) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!864435)))

(declare-fun b!1552757 () Bool)

(declare-fun e!864436 () Option!810)

(assert (=> b!1552757 (= e!864435 e!864436)))

(declare-fun c!143064 () Bool)

(assert (=> b!1552757 (= c!143064 (and ((_ is Cons!36255) (toList!11226 lt!669190)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669190))) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1552759 () Bool)

(assert (=> b!1552759 (= e!864436 None!808)))

(declare-fun b!1552756 () Bool)

(assert (=> b!1552756 (= e!864435 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669190)))))))

(declare-fun b!1552758 () Bool)

(assert (=> b!1552758 (= e!864436 (getValueByKey!735 (t!50967 (toList!11226 lt!669190)) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!161007 c!143063) b!1552756))

(assert (= (and d!161007 (not c!143063)) b!1552757))

(assert (= (and b!1552757 c!143064) b!1552758))

(assert (= (and b!1552757 (not c!143064)) b!1552759))

(declare-fun m!1430763 () Bool)

(assert (=> b!1552758 m!1430763))

(assert (=> b!1552541 d!161007))

(declare-fun d!161009 () Bool)

(assert (=> d!161009 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun bs!44575 () Bool)

(assert (= bs!44575 d!161009))

(assert (=> bs!44575 m!1430375))

(declare-fun m!1430765 () Bool)

(assert (=> bs!44575 m!1430765))

(assert (=> b!1552633 d!161009))

(assert (=> b!1552633 d!160949))

(declare-fun d!161011 () Bool)

(assert (=> d!161011 (= (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552599 d!161011))

(declare-fun d!161013 () Bool)

(declare-fun lt!669281 () Bool)

(assert (=> d!161013 (= lt!669281 (select (content!783 lt!669154) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864437 () Bool)

(assert (=> d!161013 (= lt!669281 e!864437)))

(declare-fun res!1062962 () Bool)

(assert (=> d!161013 (=> (not res!1062962) (not e!864437))))

(assert (=> d!161013 (= res!1062962 ((_ is Cons!36255) lt!669154))))

(assert (=> d!161013 (= (contains!10090 lt!669154 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669281)))

(declare-fun b!1552760 () Bool)

(declare-fun e!864438 () Bool)

(assert (=> b!1552760 (= e!864437 e!864438)))

(declare-fun res!1062961 () Bool)

(assert (=> b!1552760 (=> res!1062961 e!864438)))

(assert (=> b!1552760 (= res!1062961 (= (h!37701 lt!669154) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552761 () Bool)

(assert (=> b!1552761 (= e!864438 (contains!10090 (t!50967 lt!669154) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161013 res!1062962) b!1552760))

(assert (= (and b!1552760 (not res!1062961)) b!1552761))

(declare-fun m!1430767 () Bool)

(assert (=> d!161013 m!1430767))

(declare-fun m!1430769 () Bool)

(assert (=> d!161013 m!1430769))

(declare-fun m!1430771 () Bool)

(assert (=> b!1552761 m!1430771))

(assert (=> b!1552499 d!161013))

(assert (=> b!1552690 d!161011))

(declare-fun d!161015 () Bool)

(declare-fun c!143067 () Bool)

(assert (=> d!161015 (= c!143067 ((_ is Nil!36256) (toList!11226 lt!669148)))))

(declare-fun e!864441 () (InoxSet tuple2!24812))

(assert (=> d!161015 (= (content!783 (toList!11226 lt!669148)) e!864441)))

(declare-fun b!1552766 () Bool)

(assert (=> b!1552766 (= e!864441 ((as const (Array tuple2!24812 Bool)) false))))

(declare-fun b!1552767 () Bool)

(assert (=> b!1552767 (= e!864441 ((_ map or) (store ((as const (Array tuple2!24812 Bool)) false) (h!37701 (toList!11226 lt!669148)) true) (content!783 (t!50967 (toList!11226 lt!669148)))))))

(assert (= (and d!161015 c!143067) b!1552766))

(assert (= (and d!161015 (not c!143067)) b!1552767))

(declare-fun m!1430773 () Bool)

(assert (=> b!1552767 m!1430773))

(declare-fun m!1430775 () Bool)

(assert (=> b!1552767 m!1430775))

(assert (=> d!160943 d!161015))

(declare-fun d!161017 () Bool)

(assert (=> d!161017 (= (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (and (not (= (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552676 d!161017))

(assert (=> d!160981 d!160979))

(declare-fun d!161019 () Bool)

(assert (=> d!161019 (= (getValueByKey!735 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161019 true))

(declare-fun _$22!586 () Unit!51522)

(assert (=> d!161019 (= (choose!2046 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) _$22!586)))

(declare-fun bs!44576 () Bool)

(assert (= bs!44576 d!161019))

(assert (=> bs!44576 m!1430309))

(assert (=> d!160981 d!161019))

(declare-fun d!161021 () Bool)

(declare-fun res!1062967 () Bool)

(declare-fun e!864446 () Bool)

(assert (=> d!161021 (=> res!1062967 e!864446)))

(assert (=> d!161021 (= res!1062967 (or ((_ is Nil!36256) lt!669150) ((_ is Nil!36256) (t!50967 lt!669150))))))

(assert (=> d!161021 (= (isStrictlySorted!884 lt!669150) e!864446)))

(declare-fun b!1552772 () Bool)

(declare-fun e!864447 () Bool)

(assert (=> b!1552772 (= e!864446 e!864447)))

(declare-fun res!1062968 () Bool)

(assert (=> b!1552772 (=> (not res!1062968) (not e!864447))))

(assert (=> b!1552772 (= res!1062968 (bvslt (_1!12417 (h!37701 lt!669150)) (_1!12417 (h!37701 (t!50967 lt!669150)))))))

(declare-fun b!1552773 () Bool)

(assert (=> b!1552773 (= e!864447 (isStrictlySorted!884 (t!50967 lt!669150)))))

(assert (= (and d!161021 (not res!1062967)) b!1552772))

(assert (= (and b!1552772 res!1062968) b!1552773))

(declare-fun m!1430777 () Bool)

(assert (=> b!1552773 m!1430777))

(assert (=> d!160981 d!161021))

(declare-fun d!161023 () Bool)

(declare-fun lt!669282 () Bool)

(assert (=> d!161023 (= lt!669282 (select (content!783 lt!669181) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864448 () Bool)

(assert (=> d!161023 (= lt!669282 e!864448)))

(declare-fun res!1062970 () Bool)

(assert (=> d!161023 (=> (not res!1062970) (not e!864448))))

(assert (=> d!161023 (= res!1062970 ((_ is Cons!36255) lt!669181))))

(assert (=> d!161023 (= (contains!10090 lt!669181 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669282)))

(declare-fun b!1552774 () Bool)

(declare-fun e!864449 () Bool)

(assert (=> b!1552774 (= e!864448 e!864449)))

(declare-fun res!1062969 () Bool)

(assert (=> b!1552774 (=> res!1062969 e!864449)))

(assert (=> b!1552774 (= res!1062969 (= (h!37701 lt!669181) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552775 () Bool)

(assert (=> b!1552775 (= e!864449 (contains!10090 (t!50967 lt!669181) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161023 res!1062970) b!1552774))

(assert (= (and b!1552774 (not res!1062969)) b!1552775))

(declare-fun m!1430779 () Bool)

(assert (=> d!161023 m!1430779))

(declare-fun m!1430781 () Bool)

(assert (=> d!161023 m!1430781))

(declare-fun m!1430783 () Bool)

(assert (=> b!1552775 m!1430783))

(assert (=> b!1552521 d!161023))

(declare-fun d!161025 () Bool)

(assert (=> d!161025 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669283 () Unit!51522)

(assert (=> d!161025 (= lt!669283 (choose!2048 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864450 () Bool)

(assert (=> d!161025 e!864450))

(declare-fun res!1062971 () Bool)

(assert (=> d!161025 (=> (not res!1062971) (not e!864450))))

(assert (=> d!161025 (= res!1062971 (isStrictlySorted!884 (toList!11226 lt!669115)))))

(assert (=> d!161025 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000) lt!669283)))

(declare-fun b!1552776 () Bool)

(assert (=> b!1552776 (= e!864450 (containsKey!752 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161025 res!1062971) b!1552776))

(assert (=> d!161025 m!1430421))

(assert (=> d!161025 m!1430421))

(assert (=> d!161025 m!1430423))

(declare-fun m!1430785 () Bool)

(assert (=> d!161025 m!1430785))

(assert (=> d!161025 m!1430717))

(assert (=> b!1552776 m!1430417))

(assert (=> b!1552530 d!161025))

(declare-fun d!161027 () Bool)

(assert (=> d!161027 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44577 () Bool)

(assert (= bs!44577 d!161027))

(assert (=> bs!44577 m!1430421))

(declare-fun m!1430787 () Bool)

(assert (=> bs!44577 m!1430787))

(assert (=> b!1552530 d!161027))

(declare-fun d!161029 () Bool)

(declare-fun c!143068 () Bool)

(assert (=> d!161029 (= c!143068 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (= (_1!12417 (h!37701 (toList!11226 lt!669115))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864451 () Option!810)

(assert (=> d!161029 (= (getValueByKey!735 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000) e!864451)))

(declare-fun b!1552778 () Bool)

(declare-fun e!864452 () Option!810)

(assert (=> b!1552778 (= e!864451 e!864452)))

(declare-fun c!143069 () Bool)

(assert (=> b!1552778 (= c!143069 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669115))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552780 () Bool)

(assert (=> b!1552780 (= e!864452 None!808)))

(declare-fun b!1552777 () Bool)

(assert (=> b!1552777 (= e!864451 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669115)))))))

(declare-fun b!1552779 () Bool)

(assert (=> b!1552779 (= e!864452 (getValueByKey!735 (t!50967 (toList!11226 lt!669115)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161029 c!143068) b!1552777))

(assert (= (and d!161029 (not c!143068)) b!1552778))

(assert (= (and b!1552778 c!143069) b!1552779))

(assert (= (and b!1552778 (not c!143069)) b!1552780))

(declare-fun m!1430789 () Bool)

(assert (=> b!1552779 m!1430789))

(assert (=> b!1552530 d!161029))

(declare-fun d!161031 () Bool)

(declare-fun res!1062972 () Bool)

(declare-fun e!864453 () Bool)

(assert (=> d!161031 (=> res!1062972 e!864453)))

(assert (=> d!161031 (= res!1062972 (and ((_ is Cons!36255) lt!669170) (= (_1!12417 (h!37701 lt!669170)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161031 (= (containsKey!752 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864453)))

(declare-fun b!1552781 () Bool)

(declare-fun e!864454 () Bool)

(assert (=> b!1552781 (= e!864453 e!864454)))

(declare-fun res!1062973 () Bool)

(assert (=> b!1552781 (=> (not res!1062973) (not e!864454))))

(assert (=> b!1552781 (= res!1062973 (and (or (not ((_ is Cons!36255) lt!669170)) (bvsle (_1!12417 (h!37701 lt!669170)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36255) lt!669170) (bvslt (_1!12417 (h!37701 lt!669170)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552782 () Bool)

(assert (=> b!1552782 (= e!864454 (containsKey!752 (t!50967 lt!669170) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161031 (not res!1062972)) b!1552781))

(assert (= (and b!1552781 res!1062973) b!1552782))

(declare-fun m!1430791 () Bool)

(assert (=> b!1552782 m!1430791))

(assert (=> b!1552638 d!161031))

(declare-fun c!143070 () Bool)

(declare-fun d!161033 () Bool)

(assert (=> d!161033 (= c!143070 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864455 () Option!810)

(assert (=> d!161033 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669012)) (select (arr!49970 _keys!618) from!762)) e!864455)))

(declare-fun b!1552784 () Bool)

(declare-fun e!864456 () Option!810)

(assert (=> b!1552784 (= e!864455 e!864456)))

(declare-fun c!143071 () Bool)

(assert (=> b!1552784 (= c!143071 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552786 () Bool)

(assert (=> b!1552786 (= e!864456 None!808)))

(declare-fun b!1552783 () Bool)

(assert (=> b!1552783 (= e!864455 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669012))))))))

(declare-fun b!1552785 () Bool)

(assert (=> b!1552785 (= e!864456 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669012))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161033 c!143070) b!1552783))

(assert (= (and d!161033 (not c!143070)) b!1552784))

(assert (= (and b!1552784 c!143071) b!1552785))

(assert (= (and b!1552784 (not c!143071)) b!1552786))

(assert (=> b!1552785 m!1430059))

(declare-fun m!1430793 () Bool)

(assert (=> b!1552785 m!1430793))

(assert (=> b!1552485 d!161033))

(declare-fun d!161035 () Bool)

(declare-fun res!1062974 () Bool)

(declare-fun e!864457 () Bool)

(assert (=> d!161035 (=> res!1062974 e!864457)))

(assert (=> d!161035 (= res!1062974 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!161035 (= (containsKey!752 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762)) e!864457)))

(declare-fun b!1552787 () Bool)

(declare-fun e!864458 () Bool)

(assert (=> b!1552787 (= e!864457 e!864458)))

(declare-fun res!1062975 () Bool)

(assert (=> b!1552787 (=> (not res!1062975) (not e!864458))))

(assert (=> b!1552787 (= res!1062975 (and (or (not ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (bvsle (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (bvslt (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552788 () Bool)

(assert (=> b!1552788 (= e!864458 (containsKey!752 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161035 (not res!1062974)) b!1552787))

(assert (= (and b!1552787 res!1062975) b!1552788))

(assert (=> b!1552788 m!1430059))

(declare-fun m!1430795 () Bool)

(assert (=> b!1552788 m!1430795))

(assert (=> d!160895 d!161035))

(assert (=> b!1552696 d!160841))

(declare-fun b!1552789 () Bool)

(declare-fun res!1062976 () Bool)

(declare-fun e!864461 () Bool)

(assert (=> b!1552789 (=> (not res!1062976) (not e!864461))))

(declare-fun lt!669284 () List!36259)

(assert (=> b!1552789 (= res!1062976 (containsKey!752 lt!669284 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552790 () Bool)

(assert (=> b!1552790 (= e!864461 (contains!10090 lt!669284 (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864462 () List!36259)

(declare-fun b!1552791 () Bool)

(assert (=> b!1552791 (= e!864462 (insertStrictlySorted!504 (t!50967 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun c!143075 () Bool)

(declare-fun c!143073 () Bool)

(declare-fun b!1552792 () Bool)

(assert (=> b!1552792 (= e!864462 (ite c!143075 (t!50967 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (ite c!143073 (Cons!36255 (h!37701 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (t!50967 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))))) Nil!36256)))))

(declare-fun b!1552793 () Bool)

(declare-fun e!864460 () List!36259)

(declare-fun call!71320 () List!36259)

(assert (=> b!1552793 (= e!864460 call!71320)))

(declare-fun d!161037 () Bool)

(assert (=> d!161037 e!864461))

(declare-fun res!1062977 () Bool)

(assert (=> d!161037 (=> (not res!1062977) (not e!864461))))

(assert (=> d!161037 (= res!1062977 (isStrictlySorted!884 lt!669284))))

(declare-fun e!864459 () List!36259)

(assert (=> d!161037 (= lt!669284 e!864459)))

(declare-fun c!143072 () Bool)

(assert (=> d!161037 (= c!143072 (and ((_ is Cons!36255) (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161037 (isStrictlySorted!884 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))))))

(assert (=> d!161037 (= (insertStrictlySorted!504 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669284)))

(declare-fun b!1552794 () Bool)

(declare-fun e!864463 () List!36259)

(assert (=> b!1552794 (= e!864459 e!864463)))

(assert (=> b!1552794 (= c!143075 (and ((_ is Cons!36255) (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bm!71316 () Bool)

(declare-fun call!71321 () List!36259)

(assert (=> bm!71316 (= call!71320 call!71321)))

(declare-fun b!1552795 () Bool)

(declare-fun call!71319 () List!36259)

(assert (=> b!1552795 (= e!864459 call!71319)))

(declare-fun b!1552796 () Bool)

(assert (=> b!1552796 (= e!864460 call!71320)))

(declare-fun bm!71317 () Bool)

(assert (=> bm!71317 (= call!71319 ($colon$colon!946 e!864462 (ite c!143072 (h!37701 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun c!143074 () Bool)

(assert (=> bm!71317 (= c!143074 c!143072)))

(declare-fun b!1552797 () Bool)

(assert (=> b!1552797 (= c!143073 (and ((_ is Cons!36255) (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (bvsgt (_1!12417 (h!37701 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> b!1552797 (= e!864463 e!864460)))

(declare-fun b!1552798 () Bool)

(assert (=> b!1552798 (= e!864463 call!71321)))

(declare-fun bm!71318 () Bool)

(assert (=> bm!71318 (= call!71321 call!71319)))

(assert (= (and d!161037 c!143072) b!1552795))

(assert (= (and d!161037 (not c!143072)) b!1552794))

(assert (= (and b!1552794 c!143075) b!1552798))

(assert (= (and b!1552794 (not c!143075)) b!1552797))

(assert (= (and b!1552797 c!143073) b!1552793))

(assert (= (and b!1552797 (not c!143073)) b!1552796))

(assert (= (or b!1552793 b!1552796) bm!71316))

(assert (= (or b!1552798 bm!71316) bm!71318))

(assert (= (or b!1552795 bm!71318) bm!71317))

(assert (= (and bm!71317 c!143074) b!1552791))

(assert (= (and bm!71317 (not c!143074)) b!1552792))

(assert (= (and d!161037 res!1062977) b!1552789))

(assert (= (and b!1552789 res!1062976) b!1552790))

(declare-fun m!1430797 () Bool)

(assert (=> b!1552791 m!1430797))

(declare-fun m!1430799 () Bool)

(assert (=> bm!71317 m!1430799))

(declare-fun m!1430801 () Bool)

(assert (=> b!1552789 m!1430801))

(declare-fun m!1430803 () Bool)

(assert (=> b!1552790 m!1430803))

(declare-fun m!1430805 () Bool)

(assert (=> d!161037 m!1430805))

(declare-fun m!1430807 () Bool)

(assert (=> d!161037 m!1430807))

(assert (=> b!1552642 d!161037))

(declare-fun d!161039 () Bool)

(declare-fun res!1062978 () Bool)

(declare-fun e!864464 () Bool)

(assert (=> d!161039 (=> res!1062978 e!864464)))

(assert (=> d!161039 (= res!1062978 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (= (_1!12417 (h!37701 (toList!11226 lt!669115))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!161039 (= (containsKey!752 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762)) e!864464)))

(declare-fun b!1552799 () Bool)

(declare-fun e!864465 () Bool)

(assert (=> b!1552799 (= e!864464 e!864465)))

(declare-fun res!1062979 () Bool)

(assert (=> b!1552799 (=> (not res!1062979) (not e!864465))))

(assert (=> b!1552799 (= res!1062979 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669115))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669115))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (toList!11226 lt!669115)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669115))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552800 () Bool)

(assert (=> b!1552800 (= e!864465 (containsKey!752 (t!50967 (toList!11226 lt!669115)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161039 (not res!1062978)) b!1552799))

(assert (= (and b!1552799 res!1062979) b!1552800))

(assert (=> b!1552800 m!1430059))

(declare-fun m!1430809 () Bool)

(assert (=> b!1552800 m!1430809))

(assert (=> d!160973 d!161039))

(declare-fun d!161041 () Bool)

(assert (=> d!161041 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bs!44578 () Bool)

(assert (= bs!44578 d!161041))

(assert (=> bs!44578 m!1430303))

(declare-fun m!1430811 () Bool)

(assert (=> bs!44578 m!1430811))

(assert (=> b!1552614 d!161041))

(assert (=> b!1552614 d!160859))

(declare-fun d!161043 () Bool)

(assert (=> d!161043 (= (isEmpty!1138 (toList!11226 lt!669115)) ((_ is Nil!36256) (toList!11226 lt!669115)))))

(assert (=> d!160855 d!161043))

(declare-fun d!161045 () Bool)

(assert (=> d!161045 (= ($colon$colon!946 e!864290 (ite c!142989 (h!37701 (toList!11226 call!71243)) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (Cons!36255 (ite c!142989 (h!37701 (toList!11226 call!71243)) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864290))))

(assert (=> bm!71301 d!161045))

(declare-fun d!161047 () Bool)

(declare-fun lt!669285 () Bool)

(assert (=> d!161047 (= lt!669285 (select (content!783 lt!669270) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864466 () Bool)

(assert (=> d!161047 (= lt!669285 e!864466)))

(declare-fun res!1062981 () Bool)

(assert (=> d!161047 (=> (not res!1062981) (not e!864466))))

(assert (=> d!161047 (= res!1062981 ((_ is Cons!36255) lt!669270))))

(assert (=> d!161047 (= (contains!10090 lt!669270 (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) lt!669285)))

(declare-fun b!1552801 () Bool)

(declare-fun e!864467 () Bool)

(assert (=> b!1552801 (= e!864466 e!864467)))

(declare-fun res!1062980 () Bool)

(assert (=> b!1552801 (=> res!1062980 e!864467)))

(assert (=> b!1552801 (= res!1062980 (= (h!37701 lt!669270) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552802 () Bool)

(assert (=> b!1552802 (= e!864467 (contains!10090 (t!50967 lt!669270) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161047 res!1062981) b!1552801))

(assert (= (and b!1552801 (not res!1062980)) b!1552802))

(declare-fun m!1430813 () Bool)

(assert (=> d!161047 m!1430813))

(declare-fun m!1430815 () Bool)

(assert (=> d!161047 m!1430815))

(declare-fun m!1430817 () Bool)

(assert (=> b!1552802 m!1430817))

(assert (=> b!1552716 d!161047))

(declare-fun d!161049 () Bool)

(declare-fun res!1062982 () Bool)

(declare-fun e!864468 () Bool)

(assert (=> d!161049 (=> res!1062982 e!864468)))

(assert (=> d!161049 (= res!1062982 (and ((_ is Cons!36255) lt!669146) (= (_1!12417 (h!37701 lt!669146)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161049 (= (containsKey!752 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864468)))

(declare-fun b!1552803 () Bool)

(declare-fun e!864469 () Bool)

(assert (=> b!1552803 (= e!864468 e!864469)))

(declare-fun res!1062983 () Bool)

(assert (=> b!1552803 (=> (not res!1062983) (not e!864469))))

(assert (=> b!1552803 (= res!1062983 (and (or (not ((_ is Cons!36255) lt!669146)) (bvsle (_1!12417 (h!37701 lt!669146)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36255) lt!669146) (bvslt (_1!12417 (h!37701 lt!669146)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552804 () Bool)

(assert (=> b!1552804 (= e!864469 (containsKey!752 (t!50967 lt!669146) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161049 (not res!1062982)) b!1552803))

(assert (= (and b!1552803 res!1062983) b!1552804))

(declare-fun m!1430819 () Bool)

(assert (=> b!1552804 m!1430819))

(assert (=> b!1552619 d!161049))

(declare-fun d!161051 () Bool)

(assert (=> d!161051 (= (isEmpty!1137 lt!669246) (isEmpty!1138 (toList!11226 lt!669246)))))

(declare-fun bs!44579 () Bool)

(assert (= bs!44579 d!161051))

(declare-fun m!1430821 () Bool)

(assert (=> bs!44579 m!1430821))

(assert (=> b!1552668 d!161051))

(declare-fun d!161053 () Bool)

(declare-fun c!143076 () Bool)

(assert (=> d!161053 (= c!143076 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864470 () Option!810)

(assert (=> d!161053 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669012)) #b1000000000000000000000000000000000000000000000000000000000000000) e!864470)))

(declare-fun b!1552806 () Bool)

(declare-fun e!864471 () Option!810)

(assert (=> b!1552806 (= e!864470 e!864471)))

(declare-fun c!143077 () Bool)

(assert (=> b!1552806 (= c!143077 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552808 () Bool)

(assert (=> b!1552808 (= e!864471 None!808)))

(declare-fun b!1552805 () Bool)

(assert (=> b!1552805 (= e!864470 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669012))))))))

(declare-fun b!1552807 () Bool)

(assert (=> b!1552807 (= e!864471 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161053 c!143076) b!1552805))

(assert (= (and d!161053 (not c!143076)) b!1552806))

(assert (= (and b!1552806 c!143077) b!1552807))

(assert (= (and b!1552806 (not c!143077)) b!1552808))

(declare-fun m!1430823 () Bool)

(assert (=> b!1552807 m!1430823))

(assert (=> b!1552662 d!161053))

(assert (=> d!160969 d!160971))

(assert (=> d!160969 d!160935))

(declare-fun d!161055 () Bool)

(assert (=> d!161055 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161055 true))

(declare-fun _$12!483 () Unit!51522)

(assert (=> d!161055 (= (choose!2048 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000) _$12!483)))

(declare-fun bs!44580 () Bool)

(assert (= bs!44580 d!161055))

(assert (=> bs!44580 m!1430351))

(assert (=> bs!44580 m!1430351))

(assert (=> bs!44580 m!1430353))

(assert (=> d!160969 d!161055))

(declare-fun d!161057 () Bool)

(declare-fun res!1062984 () Bool)

(declare-fun e!864472 () Bool)

(assert (=> d!161057 (=> res!1062984 e!864472)))

(assert (=> d!161057 (= res!1062984 (or ((_ is Nil!36256) (toList!11226 lt!669012)) ((_ is Nil!36256) (t!50967 (toList!11226 lt!669012)))))))

(assert (=> d!161057 (= (isStrictlySorted!884 (toList!11226 lt!669012)) e!864472)))

(declare-fun b!1552809 () Bool)

(declare-fun e!864473 () Bool)

(assert (=> b!1552809 (= e!864472 e!864473)))

(declare-fun res!1062985 () Bool)

(assert (=> b!1552809 (=> (not res!1062985) (not e!864473))))

(assert (=> b!1552809 (= res!1062985 (bvslt (_1!12417 (h!37701 (toList!11226 lt!669012))) (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012))))))))

(declare-fun b!1552810 () Bool)

(assert (=> b!1552810 (= e!864473 (isStrictlySorted!884 (t!50967 (toList!11226 lt!669012))))))

(assert (= (and d!161057 (not res!1062984)) b!1552809))

(assert (= (and b!1552809 res!1062985) b!1552810))

(declare-fun m!1430825 () Bool)

(assert (=> b!1552810 m!1430825))

(assert (=> d!160969 d!161057))

(declare-fun d!161059 () Bool)

(declare-fun c!143078 () Bool)

(assert (=> d!161059 (= c!143078 (and ((_ is Cons!36255) (t!50967 lt!669150)) (= (_1!12417 (h!37701 (t!50967 lt!669150))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864474 () Option!810)

(assert (=> d!161059 (= (getValueByKey!735 (t!50967 lt!669150) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864474)))

(declare-fun b!1552812 () Bool)

(declare-fun e!864475 () Option!810)

(assert (=> b!1552812 (= e!864474 e!864475)))

(declare-fun c!143079 () Bool)

(assert (=> b!1552812 (= c!143079 (and ((_ is Cons!36255) (t!50967 lt!669150)) (not (= (_1!12417 (h!37701 (t!50967 lt!669150))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1552814 () Bool)

(assert (=> b!1552814 (= e!864475 None!808)))

(declare-fun b!1552811 () Bool)

(assert (=> b!1552811 (= e!864474 (Some!809 (_2!12417 (h!37701 (t!50967 lt!669150)))))))

(declare-fun b!1552813 () Bool)

(assert (=> b!1552813 (= e!864475 (getValueByKey!735 (t!50967 (t!50967 lt!669150)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161059 c!143078) b!1552811))

(assert (= (and d!161059 (not c!143078)) b!1552812))

(assert (= (and b!1552812 c!143079) b!1552813))

(assert (= (and b!1552812 (not c!143079)) b!1552814))

(declare-fun m!1430827 () Bool)

(assert (=> b!1552813 m!1430827))

(assert (=> b!1552711 d!161059))

(declare-fun d!161061 () Bool)

(declare-fun res!1062986 () Bool)

(declare-fun e!864476 () Bool)

(assert (=> d!161061 (=> res!1062986 e!864476)))

(assert (=> d!161061 (= res!1062986 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (= (_1!12417 (h!37701 (toList!11226 lt!669115))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161061 (= (containsKey!752 (toList!11226 lt!669115) #b0000000000000000000000000000000000000000000000000000000000000000) e!864476)))

(declare-fun b!1552815 () Bool)

(declare-fun e!864477 () Bool)

(assert (=> b!1552815 (= e!864476 e!864477)))

(declare-fun res!1062987 () Bool)

(assert (=> b!1552815 (=> (not res!1062987) (not e!864477))))

(assert (=> b!1552815 (= res!1062987 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669115))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669115))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36255) (toList!11226 lt!669115)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669115))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552816 () Bool)

(assert (=> b!1552816 (= e!864477 (containsKey!752 (t!50967 (toList!11226 lt!669115)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161061 (not res!1062986)) b!1552815))

(assert (= (and b!1552815 res!1062987) b!1552816))

(declare-fun m!1430829 () Bool)

(assert (=> b!1552816 m!1430829))

(assert (=> d!160857 d!161061))

(assert (=> b!1552672 d!161017))

(declare-fun d!161063 () Bool)

(declare-fun res!1062988 () Bool)

(declare-fun e!864478 () Bool)

(assert (=> d!161063 (=> res!1062988 e!864478)))

(assert (=> d!161063 (= res!1062988 (or ((_ is Nil!36256) lt!669270) ((_ is Nil!36256) (t!50967 lt!669270))))))

(assert (=> d!161063 (= (isStrictlySorted!884 lt!669270) e!864478)))

(declare-fun b!1552817 () Bool)

(declare-fun e!864479 () Bool)

(assert (=> b!1552817 (= e!864478 e!864479)))

(declare-fun res!1062989 () Bool)

(assert (=> b!1552817 (=> (not res!1062989) (not e!864479))))

(assert (=> b!1552817 (= res!1062989 (bvslt (_1!12417 (h!37701 lt!669270)) (_1!12417 (h!37701 (t!50967 lt!669270)))))))

(declare-fun b!1552818 () Bool)

(assert (=> b!1552818 (= e!864479 (isStrictlySorted!884 (t!50967 lt!669270)))))

(assert (= (and d!161063 (not res!1062988)) b!1552817))

(assert (= (and b!1552817 res!1062989) b!1552818))

(declare-fun m!1430831 () Bool)

(assert (=> b!1552818 m!1430831))

(assert (=> d!160983 d!161063))

(declare-fun d!161065 () Bool)

(declare-fun res!1062990 () Bool)

(declare-fun e!864480 () Bool)

(assert (=> d!161065 (=> res!1062990 e!864480)))

(assert (=> d!161065 (= res!1062990 (or ((_ is Nil!36256) (toList!11226 lt!669010)) ((_ is Nil!36256) (t!50967 (toList!11226 lt!669010)))))))

(assert (=> d!161065 (= (isStrictlySorted!884 (toList!11226 lt!669010)) e!864480)))

(declare-fun b!1552819 () Bool)

(declare-fun e!864481 () Bool)

(assert (=> b!1552819 (= e!864480 e!864481)))

(declare-fun res!1062991 () Bool)

(assert (=> b!1552819 (=> (not res!1062991) (not e!864481))))

(assert (=> b!1552819 (= res!1062991 (bvslt (_1!12417 (h!37701 (toList!11226 lt!669010))) (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010))))))))

(declare-fun b!1552820 () Bool)

(assert (=> b!1552820 (= e!864481 (isStrictlySorted!884 (t!50967 (toList!11226 lt!669010))))))

(assert (= (and d!161065 (not res!1062990)) b!1552819))

(assert (= (and b!1552819 res!1062991) b!1552820))

(declare-fun m!1430833 () Bool)

(assert (=> b!1552820 m!1430833))

(assert (=> d!160983 d!161065))

(declare-fun d!161067 () Bool)

(assert (=> d!161067 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669286 () Unit!51522)

(assert (=> d!161067 (= lt!669286 (choose!2048 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun e!864482 () Bool)

(assert (=> d!161067 e!864482))

(declare-fun res!1062992 () Bool)

(assert (=> d!161067 (=> (not res!1062992) (not e!864482))))

(assert (=> d!161067 (= res!1062992 (isStrictlySorted!884 (toList!11226 lt!669148)))))

(assert (=> d!161067 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669286)))

(declare-fun b!1552821 () Bool)

(assert (=> b!1552821 (= e!864482 (containsKey!752 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161067 res!1062992) b!1552821))

(assert (=> d!161067 m!1430315))

(assert (=> d!161067 m!1430315))

(assert (=> d!161067 m!1430687))

(declare-fun m!1430835 () Bool)

(assert (=> d!161067 m!1430835))

(declare-fun m!1430837 () Bool)

(assert (=> d!161067 m!1430837))

(assert (=> b!1552821 m!1430683))

(assert (=> b!1552706 d!161067))

(declare-fun d!161069 () Bool)

(assert (=> d!161069 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun bs!44581 () Bool)

(assert (= bs!44581 d!161069))

(assert (=> bs!44581 m!1430315))

(declare-fun m!1430839 () Bool)

(assert (=> bs!44581 m!1430839))

(assert (=> b!1552706 d!161069))

(assert (=> b!1552706 d!160879))

(declare-fun b!1552822 () Bool)

(declare-fun res!1062993 () Bool)

(declare-fun e!864485 () Bool)

(assert (=> b!1552822 (=> (not res!1062993) (not e!864485))))

(declare-fun lt!669287 () List!36259)

(assert (=> b!1552822 (= res!1062993 (containsKey!752 lt!669287 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552823 () Bool)

(assert (=> b!1552823 (= e!864485 (contains!10090 lt!669287 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552824 () Bool)

(declare-fun e!864486 () List!36259)

(assert (=> b!1552824 (= e!864486 (insertStrictlySorted!504 (t!50967 (t!50967 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun c!143081 () Bool)

(declare-fun b!1552825 () Bool)

(declare-fun c!143083 () Bool)

(assert (=> b!1552825 (= e!864486 (ite c!143083 (t!50967 (t!50967 (toList!11226 lt!669010))) (ite c!143081 (Cons!36255 (h!37701 (t!50967 (toList!11226 lt!669010))) (t!50967 (t!50967 (toList!11226 lt!669010)))) Nil!36256)))))

(declare-fun b!1552826 () Bool)

(declare-fun e!864484 () List!36259)

(declare-fun call!71323 () List!36259)

(assert (=> b!1552826 (= e!864484 call!71323)))

(declare-fun d!161071 () Bool)

(assert (=> d!161071 e!864485))

(declare-fun res!1062994 () Bool)

(assert (=> d!161071 (=> (not res!1062994) (not e!864485))))

(assert (=> d!161071 (= res!1062994 (isStrictlySorted!884 lt!669287))))

(declare-fun e!864483 () List!36259)

(assert (=> d!161071 (= lt!669287 e!864483)))

(declare-fun c!143080 () Bool)

(assert (=> d!161071 (= c!143080 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161071 (isStrictlySorted!884 (t!50967 (toList!11226 lt!669010)))))

(assert (=> d!161071 (= (insertStrictlySorted!504 (t!50967 (toList!11226 lt!669010)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669287)))

(declare-fun b!1552827 () Bool)

(declare-fun e!864487 () List!36259)

(assert (=> b!1552827 (= e!864483 e!864487)))

(assert (=> b!1552827 (= c!143083 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71319 () Bool)

(declare-fun call!71324 () List!36259)

(assert (=> bm!71319 (= call!71323 call!71324)))

(declare-fun b!1552828 () Bool)

(declare-fun call!71322 () List!36259)

(assert (=> b!1552828 (= e!864483 call!71322)))

(declare-fun b!1552829 () Bool)

(assert (=> b!1552829 (= e!864484 call!71323)))

(declare-fun bm!71320 () Bool)

(assert (=> bm!71320 (= call!71322 ($colon$colon!946 e!864486 (ite c!143080 (h!37701 (t!50967 (toList!11226 lt!669010))) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143082 () Bool)

(assert (=> bm!71320 (= c!143082 c!143080)))

(declare-fun b!1552830 () Bool)

(assert (=> b!1552830 (= c!143081 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (bvsgt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552830 (= e!864487 e!864484)))

(declare-fun b!1552831 () Bool)

(assert (=> b!1552831 (= e!864487 call!71324)))

(declare-fun bm!71321 () Bool)

(assert (=> bm!71321 (= call!71324 call!71322)))

(assert (= (and d!161071 c!143080) b!1552828))

(assert (= (and d!161071 (not c!143080)) b!1552827))

(assert (= (and b!1552827 c!143083) b!1552831))

(assert (= (and b!1552827 (not c!143083)) b!1552830))

(assert (= (and b!1552830 c!143081) b!1552826))

(assert (= (and b!1552830 (not c!143081)) b!1552829))

(assert (= (or b!1552826 b!1552829) bm!71319))

(assert (= (or b!1552831 bm!71319) bm!71321))

(assert (= (or b!1552828 bm!71321) bm!71320))

(assert (= (and bm!71320 c!143082) b!1552824))

(assert (= (and bm!71320 (not c!143082)) b!1552825))

(assert (= (and d!161071 res!1062994) b!1552822))

(assert (= (and b!1552822 res!1062993) b!1552823))

(declare-fun m!1430841 () Bool)

(assert (=> b!1552824 m!1430841))

(declare-fun m!1430843 () Bool)

(assert (=> bm!71320 m!1430843))

(declare-fun m!1430845 () Bool)

(assert (=> b!1552822 m!1430845))

(declare-fun m!1430847 () Bool)

(assert (=> b!1552823 m!1430847))

(declare-fun m!1430849 () Bool)

(assert (=> d!161071 m!1430849))

(assert (=> d!161071 m!1430833))

(assert (=> b!1552623 d!161071))

(declare-fun d!161073 () Bool)

(assert (=> d!161073 (= ($colon$colon!946 e!864413 (ite c!143049 (h!37701 (toList!11226 lt!669010)) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (Cons!36255 (ite c!143049 (h!37701 (toList!11226 lt!669010)) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) e!864413))))

(assert (=> bm!71313 d!161073))

(declare-fun d!161075 () Bool)

(assert (=> d!161075 (= (apply!1097 lt!669246 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (get!26038 (getValueByKey!735 (toList!11226 lt!669246) (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))))

(declare-fun bs!44582 () Bool)

(assert (= bs!44582 d!161075))

(assert (=> bs!44582 m!1430615))

(declare-fun m!1430851 () Bool)

(assert (=> bs!44582 m!1430851))

(assert (=> bs!44582 m!1430851))

(declare-fun m!1430853 () Bool)

(assert (=> bs!44582 m!1430853))

(assert (=> b!1552675 d!161075))

(declare-fun d!161077 () Bool)

(declare-fun c!143084 () Bool)

(assert (=> d!161077 (= c!143084 ((_ is ValueCellFull!18194) (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun e!864488 () V!59389)

(assert (=> d!161077 (= (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) e!864488)))

(declare-fun b!1552832 () Bool)

(assert (=> b!1552832 (= e!864488 (get!26039 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552833 () Bool)

(assert (=> b!1552833 (= e!864488 (get!26040 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161077 c!143084) b!1552832))

(assert (= (and d!161077 (not c!143084)) b!1552833))

(assert (=> b!1552832 m!1430611))

(assert (=> b!1552832 m!1430111))

(declare-fun m!1430855 () Bool)

(assert (=> b!1552832 m!1430855))

(assert (=> b!1552833 m!1430611))

(assert (=> b!1552833 m!1430111))

(declare-fun m!1430857 () Bool)

(assert (=> b!1552833 m!1430857))

(assert (=> b!1552675 d!161077))

(assert (=> d!160925 d!160923))

(declare-fun d!161079 () Bool)

(assert (=> d!161079 (= (getValueByKey!735 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!809 (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161079 true))

(declare-fun _$22!587 () Unit!51522)

(assert (=> d!161079 (= (choose!2046 lt!669170 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) _$22!587)))

(declare-fun bs!44583 () Bool)

(assert (= bs!44583 d!161079))

(assert (=> bs!44583 m!1430369))

(assert (=> d!160925 d!161079))

(declare-fun d!161081 () Bool)

(declare-fun res!1062995 () Bool)

(declare-fun e!864489 () Bool)

(assert (=> d!161081 (=> res!1062995 e!864489)))

(assert (=> d!161081 (= res!1062995 (or ((_ is Nil!36256) lt!669170) ((_ is Nil!36256) (t!50967 lt!669170))))))

(assert (=> d!161081 (= (isStrictlySorted!884 lt!669170) e!864489)))

(declare-fun b!1552834 () Bool)

(declare-fun e!864490 () Bool)

(assert (=> b!1552834 (= e!864489 e!864490)))

(declare-fun res!1062996 () Bool)

(assert (=> b!1552834 (=> (not res!1062996) (not e!864490))))

(assert (=> b!1552834 (= res!1062996 (bvslt (_1!12417 (h!37701 lt!669170)) (_1!12417 (h!37701 (t!50967 lt!669170)))))))

(declare-fun b!1552835 () Bool)

(assert (=> b!1552835 (= e!864490 (isStrictlySorted!884 (t!50967 lt!669170)))))

(assert (= (and d!161081 (not res!1062995)) b!1552834))

(assert (= (and b!1552834 res!1062996) b!1552835))

(declare-fun m!1430859 () Bool)

(assert (=> b!1552835 m!1430859))

(assert (=> d!160925 d!161081))

(declare-fun d!161083 () Bool)

(assert (=> d!161083 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bs!44584 () Bool)

(assert (= bs!44584 d!161083))

(assert (=> bs!44584 m!1430327))

(declare-fun m!1430861 () Bool)

(assert (=> bs!44584 m!1430861))

(assert (=> b!1552489 d!161083))

(assert (=> b!1552489 d!160891))

(declare-fun lt!669288 () Bool)

(declare-fun d!161085 () Bool)

(assert (=> d!161085 (= lt!669288 (select (content!783 (toList!11226 lt!669194)) (tuple2!24813 lt!669114 lt!669117)))))

(declare-fun e!864491 () Bool)

(assert (=> d!161085 (= lt!669288 e!864491)))

(declare-fun res!1062998 () Bool)

(assert (=> d!161085 (=> (not res!1062998) (not e!864491))))

(assert (=> d!161085 (= res!1062998 ((_ is Cons!36255) (toList!11226 lt!669194)))))

(assert (=> d!161085 (= (contains!10090 (toList!11226 lt!669194) (tuple2!24813 lt!669114 lt!669117)) lt!669288)))

(declare-fun b!1552836 () Bool)

(declare-fun e!864492 () Bool)

(assert (=> b!1552836 (= e!864491 e!864492)))

(declare-fun res!1062997 () Bool)

(assert (=> b!1552836 (=> res!1062997 e!864492)))

(assert (=> b!1552836 (= res!1062997 (= (h!37701 (toList!11226 lt!669194)) (tuple2!24813 lt!669114 lt!669117)))))

(declare-fun b!1552837 () Bool)

(assert (=> b!1552837 (= e!864492 (contains!10090 (t!50967 (toList!11226 lt!669194)) (tuple2!24813 lt!669114 lt!669117)))))

(assert (= (and d!161085 res!1062998) b!1552836))

(assert (= (and b!1552836 (not res!1062997)) b!1552837))

(declare-fun m!1430863 () Bool)

(assert (=> d!161085 m!1430863))

(declare-fun m!1430865 () Bool)

(assert (=> d!161085 m!1430865))

(declare-fun m!1430867 () Bool)

(assert (=> b!1552837 m!1430867))

(assert (=> b!1552544 d!161085))

(declare-fun d!161087 () Bool)

(assert (=> d!161087 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44585 () Bool)

(assert (= bs!44585 d!161087))

(assert (=> bs!44585 m!1430653))

(declare-fun m!1430869 () Bool)

(assert (=> bs!44585 m!1430869))

(assert (=> b!1552688 d!161087))

(declare-fun d!161089 () Bool)

(declare-fun c!143085 () Bool)

(assert (=> d!161089 (= c!143085 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (= (_1!12417 (h!37701 (toList!11226 lt!669115))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864493 () Option!810)

(assert (=> d!161089 (= (getValueByKey!735 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000) e!864493)))

(declare-fun b!1552839 () Bool)

(declare-fun e!864494 () Option!810)

(assert (=> b!1552839 (= e!864493 e!864494)))

(declare-fun c!143086 () Bool)

(assert (=> b!1552839 (= c!143086 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669115))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552841 () Bool)

(assert (=> b!1552841 (= e!864494 None!808)))

(declare-fun b!1552838 () Bool)

(assert (=> b!1552838 (= e!864493 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669115)))))))

(declare-fun b!1552840 () Bool)

(assert (=> b!1552840 (= e!864494 (getValueByKey!735 (t!50967 (toList!11226 lt!669115)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161089 c!143085) b!1552838))

(assert (= (and d!161089 (not c!143085)) b!1552839))

(assert (= (and b!1552839 c!143086) b!1552840))

(assert (= (and b!1552839 (not c!143086)) b!1552841))

(declare-fun m!1430871 () Bool)

(assert (=> b!1552840 m!1430871))

(assert (=> b!1552688 d!161089))

(declare-fun d!161091 () Bool)

(declare-fun res!1062999 () Bool)

(declare-fun e!864495 () Bool)

(assert (=> d!161091 (=> res!1062999 e!864495)))

(assert (=> d!161091 (= res!1062999 (and ((_ is Cons!36255) lt!669154) (= (_1!12417 (h!37701 lt!669154)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161091 (= (containsKey!752 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864495)))

(declare-fun b!1552842 () Bool)

(declare-fun e!864496 () Bool)

(assert (=> b!1552842 (= e!864495 e!864496)))

(declare-fun res!1063000 () Bool)

(assert (=> b!1552842 (=> (not res!1063000) (not e!864496))))

(assert (=> b!1552842 (= res!1063000 (and (or (not ((_ is Cons!36255) lt!669154)) (bvsle (_1!12417 (h!37701 lt!669154)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36255) lt!669154) (bvslt (_1!12417 (h!37701 lt!669154)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552843 () Bool)

(assert (=> b!1552843 (= e!864496 (containsKey!752 (t!50967 lt!669154) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161091 (not res!1062999)) b!1552842))

(assert (= (and b!1552842 res!1063000) b!1552843))

(declare-fun m!1430873 () Bool)

(assert (=> b!1552843 m!1430873))

(assert (=> b!1552498 d!161091))

(declare-fun b!1552844 () Bool)

(declare-fun e!864498 () Bool)

(declare-fun call!71325 () Bool)

(assert (=> b!1552844 (= e!864498 call!71325)))

(declare-fun b!1552845 () Bool)

(declare-fun e!864499 () Bool)

(assert (=> b!1552845 (= e!864499 e!864498)))

(declare-fun c!143087 () Bool)

(assert (=> b!1552845 (= c!143087 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1552846 () Bool)

(declare-fun e!864497 () Bool)

(assert (=> b!1552846 (= e!864498 e!864497)))

(declare-fun lt!669289 () (_ BitVec 64))

(assert (=> b!1552846 (= lt!669289 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!669291 () Unit!51522)

(assert (=> b!1552846 (= lt!669291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669289 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1552846 (arrayContainsKey!0 _keys!618 lt!669289 #b00000000000000000000000000000000)))

(declare-fun lt!669290 () Unit!51522)

(assert (=> b!1552846 (= lt!669290 lt!669291)))

(declare-fun res!1063001 () Bool)

(assert (=> b!1552846 (= res!1063001 (= (seekEntryOrOpen!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!618 mask!926) (Found!13516 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1552846 (=> (not res!1063001) (not e!864497))))

(declare-fun b!1552847 () Bool)

(assert (=> b!1552847 (= e!864497 call!71325)))

(declare-fun d!161093 () Bool)

(declare-fun res!1063002 () Bool)

(assert (=> d!161093 (=> res!1063002 e!864499)))

(assert (=> d!161093 (= res!1063002 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> d!161093 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926) e!864499)))

(declare-fun bm!71322 () Bool)

(assert (=> bm!71322 (= call!71325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!161093 (not res!1063002)) b!1552845))

(assert (= (and b!1552845 c!143087) b!1552846))

(assert (= (and b!1552845 (not c!143087)) b!1552844))

(assert (= (and b!1552846 res!1063001) b!1552847))

(assert (= (or b!1552847 b!1552844) bm!71322))

(declare-fun m!1430875 () Bool)

(assert (=> b!1552845 m!1430875))

(assert (=> b!1552845 m!1430875))

(declare-fun m!1430877 () Bool)

(assert (=> b!1552845 m!1430877))

(assert (=> b!1552846 m!1430875))

(declare-fun m!1430879 () Bool)

(assert (=> b!1552846 m!1430879))

(declare-fun m!1430881 () Bool)

(assert (=> b!1552846 m!1430881))

(assert (=> b!1552846 m!1430875))

(declare-fun m!1430883 () Bool)

(assert (=> b!1552846 m!1430883))

(declare-fun m!1430885 () Bool)

(assert (=> bm!71322 m!1430885))

(assert (=> bm!71303 d!161093))

(declare-fun c!143088 () Bool)

(declare-fun d!161095 () Bool)

(assert (=> d!161095 (= c!143088 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669015))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669015)))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864500 () Option!810)

(assert (=> d!161095 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669015)) (select (arr!49970 _keys!618) from!762)) e!864500)))

(declare-fun b!1552849 () Bool)

(declare-fun e!864501 () Option!810)

(assert (=> b!1552849 (= e!864500 e!864501)))

(declare-fun c!143089 () Bool)

(assert (=> b!1552849 (= c!143089 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669015))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669015)))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552851 () Bool)

(assert (=> b!1552851 (= e!864501 None!808)))

(declare-fun b!1552848 () Bool)

(assert (=> b!1552848 (= e!864500 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669015))))))))

(declare-fun b!1552850 () Bool)

(assert (=> b!1552850 (= e!864501 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161095 c!143088) b!1552848))

(assert (= (and d!161095 (not c!143088)) b!1552849))

(assert (= (and b!1552849 c!143089) b!1552850))

(assert (= (and b!1552849 (not c!143089)) b!1552851))

(assert (=> b!1552850 m!1430059))

(declare-fun m!1430887 () Bool)

(assert (=> b!1552850 m!1430887))

(assert (=> b!1552652 d!161095))

(assert (=> b!1552702 d!160889))

(declare-fun d!161097 () Bool)

(assert (=> d!161097 (= (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118)) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))))

(declare-fun bs!44586 () Bool)

(assert (= bs!44586 d!161097))

(assert (=> bs!44586 m!1430465))

(declare-fun m!1430889 () Bool)

(assert (=> bs!44586 m!1430889))

(assert (=> b!1552547 d!161097))

(declare-fun d!161099 () Bool)

(declare-fun c!143090 () Bool)

(assert (=> d!161099 (= c!143090 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))) (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))))) lt!669118)))))

(declare-fun e!864502 () Option!810)

(assert (=> d!161099 (= (getValueByKey!735 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118) e!864502)))

(declare-fun b!1552853 () Bool)

(declare-fun e!864503 () Option!810)

(assert (=> b!1552853 (= e!864502 e!864503)))

(declare-fun c!143091 () Bool)

(assert (=> b!1552853 (= c!143091 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))) (not (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))))) lt!669118))))))

(declare-fun b!1552855 () Bool)

(assert (=> b!1552855 (= e!864503 None!808)))

(declare-fun b!1552852 () Bool)

(assert (=> b!1552852 (= e!864502 (Some!809 (_2!12417 (h!37701 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))))))))

(declare-fun b!1552854 () Bool)

(assert (=> b!1552854 (= e!864503 (getValueByKey!735 (t!50967 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))) lt!669118))))

(assert (= (and d!161099 c!143090) b!1552852))

(assert (= (and d!161099 (not c!143090)) b!1552853))

(assert (= (and b!1552853 c!143091) b!1552854))

(assert (= (and b!1552853 (not c!143091)) b!1552855))

(declare-fun m!1430891 () Bool)

(assert (=> b!1552854 m!1430891))

(assert (=> b!1552547 d!161099))

(declare-fun d!161101 () Bool)

(declare-fun res!1063003 () Bool)

(declare-fun e!864504 () Bool)

(assert (=> d!161101 (=> res!1063003 e!864504)))

(assert (=> d!161101 (= res!1063003 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669015))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669015)))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!161101 (= (containsKey!752 (t!50967 (toList!11226 lt!669015)) (select (arr!49970 _keys!618) from!762)) e!864504)))

(declare-fun b!1552856 () Bool)

(declare-fun e!864505 () Bool)

(assert (=> b!1552856 (= e!864504 e!864505)))

(declare-fun res!1063004 () Bool)

(assert (=> b!1552856 (=> (not res!1063004) (not e!864505))))

(assert (=> b!1552856 (= res!1063004 (and (or (not ((_ is Cons!36255) (t!50967 (toList!11226 lt!669015)))) (bvsle (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669015)))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (t!50967 (toList!11226 lt!669015))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669015)))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552857 () Bool)

(assert (=> b!1552857 (= e!864505 (containsKey!752 (t!50967 (t!50967 (toList!11226 lt!669015))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161101 (not res!1063003)) b!1552856))

(assert (= (and b!1552856 res!1063004) b!1552857))

(assert (=> b!1552857 m!1430059))

(declare-fun m!1430893 () Bool)

(assert (=> b!1552857 m!1430893))

(assert (=> b!1552659 d!161101))

(declare-fun d!161103 () Bool)

(assert (=> d!161103 (= (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!809) (getValueByKey!735 (toList!11226 lt!669012) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!160971 d!161103))

(declare-fun d!161105 () Bool)

(declare-fun res!1063005 () Bool)

(declare-fun e!864506 () Bool)

(assert (=> d!161105 (=> res!1063005 e!864506)))

(assert (=> d!161105 (= res!1063005 (and ((_ is Cons!36255) lt!669181) (= (_1!12417 (h!37701 lt!669181)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161105 (= (containsKey!752 lt!669181 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864506)))

(declare-fun b!1552858 () Bool)

(declare-fun e!864507 () Bool)

(assert (=> b!1552858 (= e!864506 e!864507)))

(declare-fun res!1063006 () Bool)

(assert (=> b!1552858 (=> (not res!1063006) (not e!864507))))

(assert (=> b!1552858 (= res!1063006 (and (or (not ((_ is Cons!36255) lt!669181)) (bvsle (_1!12417 (h!37701 lt!669181)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36255) lt!669181) (bvslt (_1!12417 (h!37701 lt!669181)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552859 () Bool)

(assert (=> b!1552859 (= e!864507 (containsKey!752 (t!50967 lt!669181) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161105 (not res!1063005)) b!1552858))

(assert (= (and b!1552858 res!1063006) b!1552859))

(declare-fun m!1430895 () Bool)

(assert (=> b!1552859 m!1430895))

(assert (=> b!1552520 d!161105))

(assert (=> d!160913 d!160911))

(declare-fun d!161107 () Bool)

(assert (=> d!161107 (= (getValueByKey!735 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161107 true))

(declare-fun _$22!588 () Unit!51522)

(assert (=> d!161107 (= (choose!2046 lt!669146 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) _$22!588)))

(declare-fun bs!44587 () Bool)

(assert (= bs!44587 d!161107))

(assert (=> bs!44587 m!1430297))

(assert (=> d!160913 d!161107))

(declare-fun d!161109 () Bool)

(declare-fun res!1063007 () Bool)

(declare-fun e!864508 () Bool)

(assert (=> d!161109 (=> res!1063007 e!864508)))

(assert (=> d!161109 (= res!1063007 (or ((_ is Nil!36256) lt!669146) ((_ is Nil!36256) (t!50967 lt!669146))))))

(assert (=> d!161109 (= (isStrictlySorted!884 lt!669146) e!864508)))

(declare-fun b!1552860 () Bool)

(declare-fun e!864509 () Bool)

(assert (=> b!1552860 (= e!864508 e!864509)))

(declare-fun res!1063008 () Bool)

(assert (=> b!1552860 (=> (not res!1063008) (not e!864509))))

(assert (=> b!1552860 (= res!1063008 (bvslt (_1!12417 (h!37701 lt!669146)) (_1!12417 (h!37701 (t!50967 lt!669146)))))))

(declare-fun b!1552861 () Bool)

(assert (=> b!1552861 (= e!864509 (isStrictlySorted!884 (t!50967 lt!669146)))))

(assert (= (and d!161109 (not res!1063007)) b!1552860))

(assert (= (and b!1552860 res!1063008) b!1552861))

(declare-fun m!1430897 () Bool)

(assert (=> b!1552861 m!1430897))

(assert (=> d!160913 d!161109))

(assert (=> d!160861 d!160799))

(assert (=> d!160861 d!160809))

(assert (=> d!160861 d!160797))

(declare-fun d!161111 () Bool)

(assert (=> d!161111 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!669292 () Unit!51522)

(assert (=> d!161111 (= lt!669292 (choose!2048 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))

(declare-fun e!864510 () Bool)

(assert (=> d!161111 e!864510))

(declare-fun res!1063009 () Bool)

(assert (=> d!161111 (=> (not res!1063009) (not e!864510))))

(assert (=> d!161111 (= res!1063009 (isStrictlySorted!884 (toList!11226 lt!669010)))))

(assert (=> d!161111 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)) lt!669292)))

(declare-fun b!1552862 () Bool)

(assert (=> b!1552862 (= e!864510 (containsKey!752 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161111 res!1063009) b!1552862))

(assert (=> d!161111 m!1430059))

(assert (=> d!161111 m!1430255))

(assert (=> d!161111 m!1430255))

(assert (=> d!161111 m!1430431))

(assert (=> d!161111 m!1430059))

(declare-fun m!1430899 () Bool)

(assert (=> d!161111 m!1430899))

(assert (=> d!161111 m!1430561))

(assert (=> b!1552862 m!1430059))

(assert (=> b!1552862 m!1430427))

(assert (=> b!1552538 d!161111))

(declare-fun d!161113 () Bool)

(assert (=> d!161113 (= (isDefined!551 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762))) (not (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun bs!44588 () Bool)

(assert (= bs!44588 d!161113))

(assert (=> bs!44588 m!1430255))

(declare-fun m!1430901 () Bool)

(assert (=> bs!44588 m!1430901))

(assert (=> b!1552538 d!161113))

(assert (=> b!1552538 d!160967))

(assert (=> b!1552693 d!161011))

(declare-fun d!161115 () Bool)

(declare-fun c!143092 () Bool)

(assert (=> d!161115 (= c!143092 ((_ is Nil!36256) (toList!11226 lt!669152)))))

(declare-fun e!864511 () (InoxSet tuple2!24812))

(assert (=> d!161115 (= (content!783 (toList!11226 lt!669152)) e!864511)))

(declare-fun b!1552863 () Bool)

(assert (=> b!1552863 (= e!864511 ((as const (Array tuple2!24812 Bool)) false))))

(declare-fun b!1552864 () Bool)

(assert (=> b!1552864 (= e!864511 ((_ map or) (store ((as const (Array tuple2!24812 Bool)) false) (h!37701 (toList!11226 lt!669152)) true) (content!783 (t!50967 (toList!11226 lt!669152)))))))

(assert (= (and d!161115 c!143092) b!1552863))

(assert (= (and d!161115 (not c!143092)) b!1552864))

(declare-fun m!1430903 () Bool)

(assert (=> b!1552864 m!1430903))

(declare-fun m!1430905 () Bool)

(assert (=> b!1552864 m!1430905))

(assert (=> d!160951 d!161115))

(declare-fun lt!669293 () Bool)

(declare-fun d!161117 () Bool)

(assert (=> d!161117 (= lt!669293 (select (content!783 lt!669241) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864512 () Bool)

(assert (=> d!161117 (= lt!669293 e!864512)))

(declare-fun res!1063011 () Bool)

(assert (=> d!161117 (=> (not res!1063011) (not e!864512))))

(assert (=> d!161117 (= res!1063011 ((_ is Cons!36255) lt!669241))))

(assert (=> d!161117 (= (contains!10090 lt!669241 (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) lt!669293)))

(declare-fun b!1552865 () Bool)

(declare-fun e!864513 () Bool)

(assert (=> b!1552865 (= e!864512 e!864513)))

(declare-fun res!1063010 () Bool)

(assert (=> b!1552865 (=> res!1063010 e!864513)))

(assert (=> b!1552865 (= res!1063010 (= (h!37701 lt!669241) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552866 () Bool)

(assert (=> b!1552866 (= e!864513 (contains!10090 (t!50967 lt!669241) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161117 res!1063011) b!1552865))

(assert (= (and b!1552865 (not res!1063010)) b!1552866))

(declare-fun m!1430907 () Bool)

(assert (=> d!161117 m!1430907))

(declare-fun m!1430909 () Bool)

(assert (=> d!161117 m!1430909))

(declare-fun m!1430911 () Bool)

(assert (=> b!1552866 m!1430911))

(assert (=> b!1552641 d!161117))

(assert (=> d!160881 d!160883))

(declare-fun d!161119 () Bool)

(assert (=> d!161119 (arrayContainsKey!0 _keys!618 lt!669093 #b00000000000000000000000000000000)))

(assert (=> d!161119 true))

(declare-fun _$60!451 () Unit!51522)

(assert (=> d!161119 (= (choose!13 _keys!618 lt!669093 #b00000000000000000000000000000000) _$60!451)))

(declare-fun bs!44589 () Bool)

(assert (= bs!44589 d!161119))

(assert (=> bs!44589 m!1430239))

(assert (=> d!160881 d!161119))

(declare-fun d!161121 () Bool)

(declare-fun lt!669294 () Bool)

(assert (=> d!161121 (= lt!669294 (select (content!783 (t!50967 (toList!11226 lt!669148))) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun e!864514 () Bool)

(assert (=> d!161121 (= lt!669294 e!864514)))

(declare-fun res!1063013 () Bool)

(assert (=> d!161121 (=> (not res!1063013) (not e!864514))))

(assert (=> d!161121 (= res!1063013 ((_ is Cons!36255) (t!50967 (toList!11226 lt!669148))))))

(assert (=> d!161121 (= (contains!10090 (t!50967 (toList!11226 lt!669148)) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669294)))

(declare-fun b!1552867 () Bool)

(declare-fun e!864515 () Bool)

(assert (=> b!1552867 (= e!864514 e!864515)))

(declare-fun res!1063012 () Bool)

(assert (=> b!1552867 (=> res!1063012 e!864515)))

(assert (=> b!1552867 (= res!1063012 (= (h!37701 (t!50967 (toList!11226 lt!669148))) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun b!1552868 () Bool)

(assert (=> b!1552868 (= e!864515 (contains!10090 (t!50967 (t!50967 (toList!11226 lt!669148))) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161121 res!1063013) b!1552867))

(assert (= (and b!1552867 (not res!1063012)) b!1552868))

(assert (=> d!161121 m!1430775))

(declare-fun m!1430913 () Bool)

(assert (=> d!161121 m!1430913))

(declare-fun m!1430915 () Bool)

(assert (=> b!1552868 m!1430915))

(assert (=> b!1552665 d!161121))

(declare-fun c!143093 () Bool)

(declare-fun d!161123 () Bool)

(assert (=> d!161123 (= c!143093 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864516 () Option!810)

(assert (=> d!161123 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669010)) (select (arr!49970 _keys!618) from!762)) e!864516)))

(declare-fun b!1552870 () Bool)

(declare-fun e!864517 () Option!810)

(assert (=> b!1552870 (= e!864516 e!864517)))

(declare-fun c!143094 () Bool)

(assert (=> b!1552870 (= c!143094 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1552872 () Bool)

(assert (=> b!1552872 (= e!864517 None!808)))

(declare-fun b!1552869 () Bool)

(assert (=> b!1552869 (= e!864516 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669010))))))))

(declare-fun b!1552871 () Bool)

(assert (=> b!1552871 (= e!864517 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669010))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161123 c!143093) b!1552869))

(assert (= (and d!161123 (not c!143093)) b!1552870))

(assert (= (and b!1552870 c!143094) b!1552871))

(assert (= (and b!1552870 (not c!143094)) b!1552872))

(assert (=> b!1552871 m!1430059))

(declare-fun m!1430917 () Bool)

(assert (=> b!1552871 m!1430917))

(assert (=> b!1552700 d!161123))

(declare-fun d!161125 () Bool)

(declare-fun res!1063014 () Bool)

(declare-fun e!864518 () Bool)

(assert (=> d!161125 (=> res!1063014 e!864518)))

(assert (=> d!161125 (= res!1063014 (and ((_ is Cons!36255) (toList!11226 lt!669148)) (= (_1!12417 (h!37701 (toList!11226 lt!669148))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161125 (= (containsKey!752 (toList!11226 lt!669148) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864518)))

(declare-fun b!1552873 () Bool)

(declare-fun e!864519 () Bool)

(assert (=> b!1552873 (= e!864518 e!864519)))

(declare-fun res!1063015 () Bool)

(assert (=> b!1552873 (=> (not res!1063015) (not e!864519))))

(assert (=> b!1552873 (= res!1063015 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669148))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669148))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36255) (toList!11226 lt!669148)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669148))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552874 () Bool)

(assert (=> b!1552874 (= e!864519 (containsKey!752 (t!50967 (toList!11226 lt!669148)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161125 (not res!1063014)) b!1552873))

(assert (= (and b!1552873 res!1063015) b!1552874))

(declare-fun m!1430919 () Bool)

(assert (=> b!1552874 m!1430919))

(assert (=> d!160977 d!161125))

(declare-fun d!161127 () Bool)

(declare-fun res!1063016 () Bool)

(declare-fun e!864520 () Bool)

(assert (=> d!161127 (=> res!1063016 e!864520)))

(assert (=> d!161127 (= res!1063016 (and ((_ is Cons!36255) lt!669270) (= (_1!12417 (h!37701 lt!669270)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161127 (= (containsKey!752 lt!669270 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864520)))

(declare-fun b!1552875 () Bool)

(declare-fun e!864521 () Bool)

(assert (=> b!1552875 (= e!864520 e!864521)))

(declare-fun res!1063017 () Bool)

(assert (=> b!1552875 (=> (not res!1063017) (not e!864521))))

(assert (=> b!1552875 (= res!1063017 (and (or (not ((_ is Cons!36255) lt!669270)) (bvsle (_1!12417 (h!37701 lt!669270)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36255) lt!669270) (bvslt (_1!12417 (h!37701 lt!669270)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552876 () Bool)

(assert (=> b!1552876 (= e!864521 (containsKey!752 (t!50967 lt!669270) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161127 (not res!1063016)) b!1552875))

(assert (= (and b!1552875 res!1063017) b!1552876))

(declare-fun m!1430921 () Bool)

(assert (=> b!1552876 m!1430921))

(assert (=> b!1552715 d!161127))

(assert (=> b!1552671 d!160995))

(declare-fun b!1552889 () Bool)

(declare-fun e!864528 () SeekEntryResult!13516)

(declare-fun e!864529 () SeekEntryResult!13516)

(assert (=> b!1552889 (= e!864528 e!864529)))

(declare-fun c!143103 () Bool)

(declare-fun lt!669300 () (_ BitVec 64))

(assert (=> b!1552889 (= c!143103 (= lt!669300 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161129 () Bool)

(declare-fun lt!669299 () SeekEntryResult!13516)

(assert (=> d!161129 (and (or ((_ is Undefined!13516) lt!669299) (not ((_ is Found!13516) lt!669299)) (and (bvsge (index!56463 lt!669299) #b00000000000000000000000000000000) (bvslt (index!56463 lt!669299) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669299) ((_ is Found!13516) lt!669299) (not ((_ is MissingVacant!13516) lt!669299)) (not (= (index!56465 lt!669299) (index!56464 lt!669215))) (and (bvsge (index!56465 lt!669299) #b00000000000000000000000000000000) (bvslt (index!56465 lt!669299) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669299) (ite ((_ is Found!13516) lt!669299) (= (select (arr!49970 _keys!618) (index!56463 lt!669299)) (select (arr!49970 _keys!618) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!13516) lt!669299) (= (index!56465 lt!669299) (index!56464 lt!669215)) (= (select (arr!49970 _keys!618) (index!56465 lt!669299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161129 (= lt!669299 e!864528)))

(declare-fun c!143102 () Bool)

(assert (=> d!161129 (= c!143102 (bvsge (x!139210 lt!669215) #b01111111111111111111111111111110))))

(assert (=> d!161129 (= lt!669300 (select (arr!49970 _keys!618) (index!56464 lt!669215)))))

(assert (=> d!161129 (validMask!0 mask!926)))

(assert (=> d!161129 (= (seekKeyOrZeroReturnVacant!0 (x!139210 lt!669215) (index!56464 lt!669215) (index!56464 lt!669215) (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!669299)))

(declare-fun b!1552890 () Bool)

(declare-fun c!143101 () Bool)

(assert (=> b!1552890 (= c!143101 (= lt!669300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864530 () SeekEntryResult!13516)

(assert (=> b!1552890 (= e!864529 e!864530)))

(declare-fun b!1552891 () Bool)

(assert (=> b!1552891 (= e!864528 Undefined!13516)))

(declare-fun b!1552892 () Bool)

(assert (=> b!1552892 (= e!864530 (MissingVacant!13516 (index!56464 lt!669215)))))

(declare-fun b!1552893 () Bool)

(assert (=> b!1552893 (= e!864529 (Found!13516 (index!56464 lt!669215)))))

(declare-fun b!1552894 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1552894 (= e!864530 (seekKeyOrZeroReturnVacant!0 (bvadd (x!139210 lt!669215) #b00000000000000000000000000000001) (nextIndex!0 (index!56464 lt!669215) (x!139210 lt!669215) mask!926) (index!56464 lt!669215) (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(assert (= (and d!161129 c!143102) b!1552891))

(assert (= (and d!161129 (not c!143102)) b!1552889))

(assert (= (and b!1552889 c!143103) b!1552893))

(assert (= (and b!1552889 (not c!143103)) b!1552890))

(assert (= (and b!1552890 c!143101) b!1552892))

(assert (= (and b!1552890 (not c!143101)) b!1552894))

(declare-fun m!1430923 () Bool)

(assert (=> d!161129 m!1430923))

(declare-fun m!1430925 () Bool)

(assert (=> d!161129 m!1430925))

(assert (=> d!161129 m!1430491))

(assert (=> d!161129 m!1430073))

(declare-fun m!1430927 () Bool)

(assert (=> b!1552894 m!1430927))

(assert (=> b!1552894 m!1430927))

(assert (=> b!1552894 m!1430233))

(declare-fun m!1430929 () Bool)

(assert (=> b!1552894 m!1430929))

(assert (=> b!1552578 d!161129))

(declare-fun c!143104 () Bool)

(declare-fun d!161131 () Bool)

(assert (=> d!161131 (= c!143104 (and ((_ is Cons!36255) (t!50967 lt!669170)) (= (_1!12417 (h!37701 (t!50967 lt!669170))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864531 () Option!810)

(assert (=> d!161131 (= (getValueByKey!735 (t!50967 lt!669170) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864531)))

(declare-fun b!1552896 () Bool)

(declare-fun e!864532 () Option!810)

(assert (=> b!1552896 (= e!864531 e!864532)))

(declare-fun c!143105 () Bool)

(assert (=> b!1552896 (= c!143105 (and ((_ is Cons!36255) (t!50967 lt!669170)) (not (= (_1!12417 (h!37701 (t!50967 lt!669170))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1552898 () Bool)

(assert (=> b!1552898 (= e!864532 None!808)))

(declare-fun b!1552895 () Bool)

(assert (=> b!1552895 (= e!864531 (Some!809 (_2!12417 (h!37701 (t!50967 lt!669170)))))))

(declare-fun b!1552897 () Bool)

(assert (=> b!1552897 (= e!864532 (getValueByKey!735 (t!50967 (t!50967 lt!669170)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161131 c!143104) b!1552895))

(assert (= (and d!161131 (not c!143104)) b!1552896))

(assert (= (and b!1552896 c!143105) b!1552897))

(assert (= (and b!1552896 (not c!143105)) b!1552898))

(declare-fun m!1430931 () Bool)

(assert (=> b!1552897 m!1430931))

(assert (=> b!1552636 d!161131))

(declare-fun d!161133 () Bool)

(declare-fun e!864533 () Bool)

(assert (=> d!161133 e!864533))

(declare-fun res!1063018 () Bool)

(assert (=> d!161133 (=> res!1063018 e!864533)))

(declare-fun lt!669303 () Bool)

(assert (=> d!161133 (= res!1063018 (not lt!669303))))

(declare-fun lt!669301 () Bool)

(assert (=> d!161133 (= lt!669303 lt!669301)))

(declare-fun lt!669304 () Unit!51522)

(declare-fun e!864534 () Unit!51522)

(assert (=> d!161133 (= lt!669304 e!864534)))

(declare-fun c!143106 () Bool)

(assert (=> d!161133 (= c!143106 lt!669301)))

(assert (=> d!161133 (= lt!669301 (containsKey!752 (toList!11226 lt!669194) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (=> d!161133 (= (contains!10087 lt!669194 (_1!12417 (tuple2!24813 lt!669114 lt!669117))) lt!669303)))

(declare-fun b!1552899 () Bool)

(declare-fun lt!669302 () Unit!51522)

(assert (=> b!1552899 (= e!864534 lt!669302)))

(assert (=> b!1552899 (= lt!669302 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669194) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (=> b!1552899 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669194) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun b!1552900 () Bool)

(declare-fun Unit!51544 () Unit!51522)

(assert (=> b!1552900 (= e!864534 Unit!51544)))

(declare-fun b!1552901 () Bool)

(assert (=> b!1552901 (= e!864533 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669194) (_1!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(assert (= (and d!161133 c!143106) b!1552899))

(assert (= (and d!161133 (not c!143106)) b!1552900))

(assert (= (and d!161133 (not res!1063018)) b!1552901))

(declare-fun m!1430933 () Bool)

(assert (=> d!161133 m!1430933))

(declare-fun m!1430935 () Bool)

(assert (=> b!1552899 m!1430935))

(assert (=> b!1552899 m!1430457))

(assert (=> b!1552899 m!1430457))

(declare-fun m!1430937 () Bool)

(assert (=> b!1552899 m!1430937))

(assert (=> b!1552901 m!1430457))

(assert (=> b!1552901 m!1430457))

(assert (=> b!1552901 m!1430937))

(assert (=> d!160873 d!161133))

(declare-fun c!143107 () Bool)

(declare-fun d!161135 () Bool)

(assert (=> d!161135 (= c!143107 (and ((_ is Cons!36255) lt!669196) (= (_1!12417 (h!37701 lt!669196)) (_1!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(declare-fun e!864535 () Option!810)

(assert (=> d!161135 (= (getValueByKey!735 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117))) e!864535)))

(declare-fun b!1552903 () Bool)

(declare-fun e!864536 () Option!810)

(assert (=> b!1552903 (= e!864535 e!864536)))

(declare-fun c!143108 () Bool)

(assert (=> b!1552903 (= c!143108 (and ((_ is Cons!36255) lt!669196) (not (= (_1!12417 (h!37701 lt!669196)) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))))

(declare-fun b!1552905 () Bool)

(assert (=> b!1552905 (= e!864536 None!808)))

(declare-fun b!1552902 () Bool)

(assert (=> b!1552902 (= e!864535 (Some!809 (_2!12417 (h!37701 lt!669196))))))

(declare-fun b!1552904 () Bool)

(assert (=> b!1552904 (= e!864536 (getValueByKey!735 (t!50967 lt!669196) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (= (and d!161135 c!143107) b!1552902))

(assert (= (and d!161135 (not c!143107)) b!1552903))

(assert (= (and b!1552903 c!143108) b!1552904))

(assert (= (and b!1552903 (not c!143108)) b!1552905))

(declare-fun m!1430939 () Bool)

(assert (=> b!1552904 m!1430939))

(assert (=> d!160873 d!161135))

(declare-fun d!161137 () Bool)

(assert (=> d!161137 (= (getValueByKey!735 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117))) (Some!809 (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun lt!669305 () Unit!51522)

(assert (=> d!161137 (= lt!669305 (choose!2046 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun e!864537 () Bool)

(assert (=> d!161137 e!864537))

(declare-fun res!1063019 () Bool)

(assert (=> d!161137 (=> (not res!1063019) (not e!864537))))

(assert (=> d!161137 (= res!1063019 (isStrictlySorted!884 lt!669196))))

(assert (=> d!161137 (= (lemmaContainsTupThenGetReturnValue!375 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))) lt!669305)))

(declare-fun b!1552906 () Bool)

(declare-fun res!1063020 () Bool)

(assert (=> b!1552906 (=> (not res!1063020) (not e!864537))))

(assert (=> b!1552906 (= res!1063020 (containsKey!752 lt!669196 (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun b!1552907 () Bool)

(assert (=> b!1552907 (= e!864537 (contains!10090 lt!669196 (tuple2!24813 (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(assert (= (and d!161137 res!1063019) b!1552906))

(assert (= (and b!1552906 res!1063020) b!1552907))

(assert (=> d!161137 m!1430451))

(declare-fun m!1430941 () Bool)

(assert (=> d!161137 m!1430941))

(declare-fun m!1430943 () Bool)

(assert (=> d!161137 m!1430943))

(declare-fun m!1430945 () Bool)

(assert (=> b!1552906 m!1430945))

(declare-fun m!1430947 () Bool)

(assert (=> b!1552907 m!1430947))

(assert (=> d!160873 d!161137))

(declare-fun b!1552908 () Bool)

(declare-fun res!1063021 () Bool)

(declare-fun e!864540 () Bool)

(assert (=> b!1552908 (=> (not res!1063021) (not e!864540))))

(declare-fun lt!669306 () List!36259)

(assert (=> b!1552908 (= res!1063021 (containsKey!752 lt!669306 (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun b!1552909 () Bool)

(assert (=> b!1552909 (= e!864540 (contains!10090 lt!669306 (tuple2!24813 (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(declare-fun b!1552910 () Bool)

(declare-fun e!864541 () List!36259)

(assert (=> b!1552910 (= e!864541 (insertStrictlySorted!504 (t!50967 (toList!11226 lt!669116)) (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))

(declare-fun c!143112 () Bool)

(declare-fun b!1552911 () Bool)

(declare-fun c!143110 () Bool)

(assert (=> b!1552911 (= e!864541 (ite c!143112 (t!50967 (toList!11226 lt!669116)) (ite c!143110 (Cons!36255 (h!37701 (toList!11226 lt!669116)) (t!50967 (toList!11226 lt!669116))) Nil!36256)))))

(declare-fun b!1552912 () Bool)

(declare-fun e!864539 () List!36259)

(declare-fun call!71327 () List!36259)

(assert (=> b!1552912 (= e!864539 call!71327)))

(declare-fun d!161139 () Bool)

(assert (=> d!161139 e!864540))

(declare-fun res!1063022 () Bool)

(assert (=> d!161139 (=> (not res!1063022) (not e!864540))))

(assert (=> d!161139 (= res!1063022 (isStrictlySorted!884 lt!669306))))

(declare-fun e!864538 () List!36259)

(assert (=> d!161139 (= lt!669306 e!864538)))

(declare-fun c!143109 () Bool)

(assert (=> d!161139 (= c!143109 (and ((_ is Cons!36255) (toList!11226 lt!669116)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669116))) (_1!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(assert (=> d!161139 (isStrictlySorted!884 (toList!11226 lt!669116))))

(assert (=> d!161139 (= (insertStrictlySorted!504 (toList!11226 lt!669116) (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))) lt!669306)))

(declare-fun b!1552913 () Bool)

(declare-fun e!864542 () List!36259)

(assert (=> b!1552913 (= e!864538 e!864542)))

(assert (=> b!1552913 (= c!143112 (and ((_ is Cons!36255) (toList!11226 lt!669116)) (= (_1!12417 (h!37701 (toList!11226 lt!669116))) (_1!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(declare-fun bm!71323 () Bool)

(declare-fun call!71328 () List!36259)

(assert (=> bm!71323 (= call!71327 call!71328)))

(declare-fun b!1552914 () Bool)

(declare-fun call!71326 () List!36259)

(assert (=> b!1552914 (= e!864538 call!71326)))

(declare-fun b!1552915 () Bool)

(assert (=> b!1552915 (= e!864539 call!71327)))

(declare-fun bm!71324 () Bool)

(assert (=> bm!71324 (= call!71326 ($colon$colon!946 e!864541 (ite c!143109 (h!37701 (toList!11226 lt!669116)) (tuple2!24813 (_1!12417 (tuple2!24813 lt!669114 lt!669117)) (_2!12417 (tuple2!24813 lt!669114 lt!669117))))))))

(declare-fun c!143111 () Bool)

(assert (=> bm!71324 (= c!143111 c!143109)))

(declare-fun b!1552916 () Bool)

(assert (=> b!1552916 (= c!143110 (and ((_ is Cons!36255) (toList!11226 lt!669116)) (bvsgt (_1!12417 (h!37701 (toList!11226 lt!669116))) (_1!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(assert (=> b!1552916 (= e!864542 e!864539)))

(declare-fun b!1552917 () Bool)

(assert (=> b!1552917 (= e!864542 call!71328)))

(declare-fun bm!71325 () Bool)

(assert (=> bm!71325 (= call!71328 call!71326)))

(assert (= (and d!161139 c!143109) b!1552914))

(assert (= (and d!161139 (not c!143109)) b!1552913))

(assert (= (and b!1552913 c!143112) b!1552917))

(assert (= (and b!1552913 (not c!143112)) b!1552916))

(assert (= (and b!1552916 c!143110) b!1552912))

(assert (= (and b!1552916 (not c!143110)) b!1552915))

(assert (= (or b!1552912 b!1552915) bm!71323))

(assert (= (or b!1552917 bm!71323) bm!71325))

(assert (= (or b!1552914 bm!71325) bm!71324))

(assert (= (and bm!71324 c!143111) b!1552910))

(assert (= (and bm!71324 (not c!143111)) b!1552911))

(assert (= (and d!161139 res!1063022) b!1552908))

(assert (= (and b!1552908 res!1063021) b!1552909))

(declare-fun m!1430949 () Bool)

(assert (=> b!1552910 m!1430949))

(declare-fun m!1430951 () Bool)

(assert (=> bm!71324 m!1430951))

(declare-fun m!1430953 () Bool)

(assert (=> b!1552908 m!1430953))

(declare-fun m!1430955 () Bool)

(assert (=> b!1552909 m!1430955))

(declare-fun m!1430957 () Bool)

(assert (=> d!161139 m!1430957))

(declare-fun m!1430959 () Bool)

(assert (=> d!161139 m!1430959))

(assert (=> d!160873 d!161139))

(declare-fun d!161141 () Bool)

(declare-fun res!1063023 () Bool)

(declare-fun e!864543 () Bool)

(assert (=> d!161141 (=> res!1063023 e!864543)))

(assert (=> d!161141 (= res!1063023 (or ((_ is Nil!36256) lt!669241) ((_ is Nil!36256) (t!50967 lt!669241))))))

(assert (=> d!161141 (= (isStrictlySorted!884 lt!669241) e!864543)))

(declare-fun b!1552918 () Bool)

(declare-fun e!864544 () Bool)

(assert (=> b!1552918 (= e!864543 e!864544)))

(declare-fun res!1063024 () Bool)

(assert (=> b!1552918 (=> (not res!1063024) (not e!864544))))

(assert (=> b!1552918 (= res!1063024 (bvslt (_1!12417 (h!37701 lt!669241)) (_1!12417 (h!37701 (t!50967 lt!669241)))))))

(declare-fun b!1552919 () Bool)

(assert (=> b!1552919 (= e!864544 (isStrictlySorted!884 (t!50967 lt!669241)))))

(assert (= (and d!161141 (not res!1063023)) b!1552918))

(assert (= (and b!1552918 res!1063024) b!1552919))

(declare-fun m!1430961 () Bool)

(assert (=> b!1552919 m!1430961))

(assert (=> d!160927 d!161141))

(declare-fun d!161143 () Bool)

(declare-fun res!1063025 () Bool)

(declare-fun e!864545 () Bool)

(assert (=> d!161143 (=> res!1063025 e!864545)))

(assert (=> d!161143 (= res!1063025 (or ((_ is Nil!36256) (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) ((_ is Nil!36256) (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))))))))

(assert (=> d!161143 (= (isStrictlySorted!884 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) e!864545)))

(declare-fun b!1552920 () Bool)

(declare-fun e!864546 () Bool)

(assert (=> b!1552920 (= e!864545 e!864546)))

(declare-fun res!1063026 () Bool)

(assert (=> b!1552920 (=> (not res!1063026) (not e!864546))))

(assert (=> b!1552920 (= res!1063026 (bvslt (_1!12417 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))) (_1!12417 (h!37701 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))))))))

(declare-fun b!1552921 () Bool)

(assert (=> b!1552921 (= e!864546 (isStrictlySorted!884 (t!50967 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239))))))))

(assert (= (and d!161143 (not res!1063025)) b!1552920))

(assert (= (and b!1552920 res!1063026) b!1552921))

(assert (=> b!1552921 m!1430807))

(assert (=> d!160927 d!161143))

(assert (=> b!1552590 d!161001))

(assert (=> b!1552590 d!161003))

(declare-fun d!161145 () Bool)

(assert (=> d!161145 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669307 () Unit!51522)

(assert (=> d!161145 (= lt!669307 (choose!2048 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864547 () Bool)

(assert (=> d!161145 e!864547))

(declare-fun res!1063027 () Bool)

(assert (=> d!161145 (=> (not res!1063027) (not e!864547))))

(assert (=> d!161145 (= res!1063027 (isStrictlySorted!884 (toList!11226 lt!669168)))))

(assert (=> d!161145 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669307)))

(declare-fun b!1552922 () Bool)

(assert (=> b!1552922 (= e!864547 (containsKey!752 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161145 res!1063027) b!1552922))

(assert (=> d!161145 m!1430375))

(assert (=> d!161145 m!1430375))

(assert (=> d!161145 m!1430567))

(declare-fun m!1430963 () Bool)

(assert (=> d!161145 m!1430963))

(declare-fun m!1430965 () Bool)

(assert (=> d!161145 m!1430965))

(assert (=> b!1552922 m!1430563))

(assert (=> b!1552631 d!161145))

(assert (=> b!1552631 d!161009))

(assert (=> b!1552631 d!160949))

(declare-fun d!161147 () Bool)

(assert (=> d!161147 (= ($colon$colon!946 e!864365 (ite c!143025 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (Cons!36255 (ite c!143025 (h!37701 (toList!11226 (ite c!142906 call!71242 (ite c!142905 call!71241 call!71239)))) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) e!864365))))

(assert (=> bm!71308 d!161147))

(declare-fun d!161149 () Bool)

(declare-fun c!143113 () Bool)

(assert (=> d!161149 (= c!143113 ((_ is Nil!36256) (toList!11226 lt!669144)))))

(declare-fun e!864548 () (InoxSet tuple2!24812))

(assert (=> d!161149 (= (content!783 (toList!11226 lt!669144)) e!864548)))

(declare-fun b!1552923 () Bool)

(assert (=> b!1552923 (= e!864548 ((as const (Array tuple2!24812 Bool)) false))))

(declare-fun b!1552924 () Bool)

(assert (=> b!1552924 (= e!864548 ((_ map or) (store ((as const (Array tuple2!24812 Bool)) false) (h!37701 (toList!11226 lt!669144)) true) (content!783 (t!50967 (toList!11226 lt!669144)))))))

(assert (= (and d!161149 c!143113) b!1552923))

(assert (= (and d!161149 (not c!143113)) b!1552924))

(declare-fun m!1430967 () Bool)

(assert (=> b!1552924 m!1430967))

(declare-fun m!1430969 () Bool)

(assert (=> b!1552924 m!1430969))

(assert (=> d!160945 d!161149))

(assert (=> b!1552705 d!160991))

(assert (=> b!1552705 d!160993))

(declare-fun d!161151 () Bool)

(declare-fun e!864549 () Bool)

(assert (=> d!161151 e!864549))

(declare-fun res!1063028 () Bool)

(assert (=> d!161151 (=> res!1063028 e!864549)))

(declare-fun lt!669310 () Bool)

(assert (=> d!161151 (= res!1063028 (not lt!669310))))

(declare-fun lt!669308 () Bool)

(assert (=> d!161151 (= lt!669310 lt!669308)))

(declare-fun lt!669311 () Unit!51522)

(declare-fun e!864550 () Unit!51522)

(assert (=> d!161151 (= lt!669311 e!864550)))

(declare-fun c!143114 () Bool)

(assert (=> d!161151 (= c!143114 lt!669308)))

(assert (=> d!161151 (= lt!669308 (containsKey!752 (toList!11226 lt!669246) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161151 (= (contains!10087 lt!669246 #b1000000000000000000000000000000000000000000000000000000000000000) lt!669310)))

(declare-fun b!1552925 () Bool)

(declare-fun lt!669309 () Unit!51522)

(assert (=> b!1552925 (= e!864550 lt!669309)))

(assert (=> b!1552925 (= lt!669309 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669246) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552925 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669246) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552926 () Bool)

(declare-fun Unit!51545 () Unit!51522)

(assert (=> b!1552926 (= e!864550 Unit!51545)))

(declare-fun b!1552927 () Bool)

(assert (=> b!1552927 (= e!864549 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161151 c!143114) b!1552925))

(assert (= (and d!161151 (not c!143114)) b!1552926))

(assert (= (and d!161151 (not res!1063028)) b!1552927))

(declare-fun m!1430971 () Bool)

(assert (=> d!161151 m!1430971))

(declare-fun m!1430973 () Bool)

(assert (=> b!1552925 m!1430973))

(declare-fun m!1430975 () Bool)

(assert (=> b!1552925 m!1430975))

(assert (=> b!1552925 m!1430975))

(declare-fun m!1430977 () Bool)

(assert (=> b!1552925 m!1430977))

(assert (=> b!1552927 m!1430975))

(assert (=> b!1552927 m!1430975))

(assert (=> b!1552927 m!1430977))

(assert (=> b!1552674 d!161151))

(declare-fun d!161153 () Bool)

(declare-fun res!1063029 () Bool)

(declare-fun e!864551 () Bool)

(assert (=> d!161153 (=> res!1063029 e!864551)))

(assert (=> d!161153 (= res!1063029 (and ((_ is Cons!36255) (toList!11226 lt!669010)) (= (_1!12417 (h!37701 (toList!11226 lt!669010))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!161153 (= (containsKey!752 (toList!11226 lt!669010) (select (arr!49970 _keys!618) from!762)) e!864551)))

(declare-fun b!1552928 () Bool)

(declare-fun e!864552 () Bool)

(assert (=> b!1552928 (= e!864551 e!864552)))

(declare-fun res!1063030 () Bool)

(assert (=> b!1552928 (=> (not res!1063030) (not e!864552))))

(assert (=> b!1552928 (= res!1063030 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669010))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669010))) (select (arr!49970 _keys!618) from!762))) ((_ is Cons!36255) (toList!11226 lt!669010)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669010))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun b!1552929 () Bool)

(assert (=> b!1552929 (= e!864552 (containsKey!752 (t!50967 (toList!11226 lt!669010)) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161153 (not res!1063029)) b!1552928))

(assert (= (and b!1552928 res!1063030) b!1552929))

(assert (=> b!1552929 m!1430059))

(declare-fun m!1430979 () Bool)

(assert (=> b!1552929 m!1430979))

(assert (=> d!160863 d!161153))

(declare-fun d!161155 () Bool)

(declare-fun lt!669312 () Bool)

(assert (=> d!161155 (= lt!669312 (select (content!783 lt!669235) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864553 () Bool)

(assert (=> d!161155 (= lt!669312 e!864553)))

(declare-fun res!1063032 () Bool)

(assert (=> d!161155 (=> (not res!1063032) (not e!864553))))

(assert (=> d!161155 (= res!1063032 ((_ is Cons!36255) lt!669235))))

(assert (=> d!161155 (= (contains!10090 lt!669235 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669312)))

(declare-fun b!1552930 () Bool)

(declare-fun e!864554 () Bool)

(assert (=> b!1552930 (= e!864553 e!864554)))

(declare-fun res!1063031 () Bool)

(assert (=> b!1552930 (=> res!1063031 e!864554)))

(assert (=> b!1552930 (= res!1063031 (= (h!37701 lt!669235) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552931 () Bool)

(assert (=> b!1552931 (= e!864554 (contains!10090 (t!50967 lt!669235) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161155 res!1063032) b!1552930))

(assert (= (and b!1552930 (not res!1063031)) b!1552931))

(declare-fun m!1430981 () Bool)

(assert (=> d!161155 m!1430981))

(declare-fun m!1430983 () Bool)

(assert (=> d!161155 m!1430983))

(declare-fun m!1430985 () Bool)

(assert (=> b!1552931 m!1430985))

(assert (=> b!1552622 d!161155))

(declare-fun d!161157 () Bool)

(declare-fun res!1063033 () Bool)

(declare-fun e!864555 () Bool)

(assert (=> d!161157 (=> res!1063033 e!864555)))

(assert (=> d!161157 (= res!1063033 (or ((_ is Nil!36256) lt!669235) ((_ is Nil!36256) (t!50967 lt!669235))))))

(assert (=> d!161157 (= (isStrictlySorted!884 lt!669235) e!864555)))

(declare-fun b!1552932 () Bool)

(declare-fun e!864556 () Bool)

(assert (=> b!1552932 (= e!864555 e!864556)))

(declare-fun res!1063034 () Bool)

(assert (=> b!1552932 (=> (not res!1063034) (not e!864556))))

(assert (=> b!1552932 (= res!1063034 (bvslt (_1!12417 (h!37701 lt!669235)) (_1!12417 (h!37701 (t!50967 lt!669235)))))))

(declare-fun b!1552933 () Bool)

(assert (=> b!1552933 (= e!864556 (isStrictlySorted!884 (t!50967 lt!669235)))))

(assert (= (and d!161157 (not res!1063033)) b!1552932))

(assert (= (and b!1552932 res!1063034) b!1552933))

(declare-fun m!1430987 () Bool)

(assert (=> b!1552933 m!1430987))

(assert (=> d!160915 d!161157))

(assert (=> d!160915 d!161065))

(declare-fun d!161159 () Bool)

(declare-fun e!864557 () Bool)

(assert (=> d!161159 e!864557))

(declare-fun res!1063035 () Bool)

(assert (=> d!161159 (=> res!1063035 e!864557)))

(declare-fun lt!669315 () Bool)

(assert (=> d!161159 (= res!1063035 (not lt!669315))))

(declare-fun lt!669313 () Bool)

(assert (=> d!161159 (= lt!669315 lt!669313)))

(declare-fun lt!669316 () Unit!51522)

(declare-fun e!864558 () Unit!51522)

(assert (=> d!161159 (= lt!669316 e!864558)))

(declare-fun c!143115 () Bool)

(assert (=> d!161159 (= c!143115 lt!669313)))

(assert (=> d!161159 (= lt!669313 (containsKey!752 (toList!11226 lt!669246) (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> d!161159 (= (contains!10087 lt!669246 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) lt!669315)))

(declare-fun b!1552934 () Bool)

(declare-fun lt!669314 () Unit!51522)

(assert (=> b!1552934 (= e!864558 lt!669314)))

(assert (=> b!1552934 (= lt!669314 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669246) (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1552934 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669246) (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun b!1552935 () Bool)

(declare-fun Unit!51546 () Unit!51522)

(assert (=> b!1552935 (= e!864558 Unit!51546)))

(declare-fun b!1552936 () Bool)

(assert (=> b!1552936 (= e!864557 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669246) (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))))

(assert (= (and d!161159 c!143115) b!1552934))

(assert (= (and d!161159 (not c!143115)) b!1552935))

(assert (= (and d!161159 (not res!1063035)) b!1552936))

(assert (=> d!161159 m!1430615))

(declare-fun m!1430989 () Bool)

(assert (=> d!161159 m!1430989))

(assert (=> b!1552934 m!1430615))

(declare-fun m!1430991 () Bool)

(assert (=> b!1552934 m!1430991))

(assert (=> b!1552934 m!1430615))

(assert (=> b!1552934 m!1430851))

(assert (=> b!1552934 m!1430851))

(declare-fun m!1430993 () Bool)

(assert (=> b!1552934 m!1430993))

(assert (=> b!1552936 m!1430615))

(assert (=> b!1552936 m!1430851))

(assert (=> b!1552936 m!1430851))

(assert (=> b!1552936 m!1430993))

(assert (=> b!1552678 d!161159))

(declare-fun d!161161 () Bool)

(declare-fun c!143116 () Bool)

(assert (=> d!161161 (= c!143116 (and ((_ is Cons!36255) (t!50967 lt!669146)) (= (_1!12417 (h!37701 (t!50967 lt!669146))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864559 () Option!810)

(assert (=> d!161161 (= (getValueByKey!735 (t!50967 lt!669146) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864559)))

(declare-fun b!1552938 () Bool)

(declare-fun e!864560 () Option!810)

(assert (=> b!1552938 (= e!864559 e!864560)))

(declare-fun c!143117 () Bool)

(assert (=> b!1552938 (= c!143117 (and ((_ is Cons!36255) (t!50967 lt!669146)) (not (= (_1!12417 (h!37701 (t!50967 lt!669146))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552940 () Bool)

(assert (=> b!1552940 (= e!864560 None!808)))

(declare-fun b!1552937 () Bool)

(assert (=> b!1552937 (= e!864559 (Some!809 (_2!12417 (h!37701 (t!50967 lt!669146)))))))

(declare-fun b!1552939 () Bool)

(assert (=> b!1552939 (= e!864560 (getValueByKey!735 (t!50967 (t!50967 lt!669146)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161161 c!143116) b!1552937))

(assert (= (and d!161161 (not c!143116)) b!1552938))

(assert (= (and b!1552938 c!143117) b!1552939))

(assert (= (and b!1552938 (not c!143117)) b!1552940))

(declare-fun m!1430995 () Bool)

(assert (=> b!1552939 m!1430995))

(assert (=> b!1552617 d!161161))

(declare-fun d!161163 () Bool)

(declare-fun c!143118 () Bool)

(assert (=> d!161163 (= c!143118 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669144))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669144)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864561 () Option!810)

(assert (=> d!161163 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669144)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864561)))

(declare-fun b!1552942 () Bool)

(declare-fun e!864562 () Option!810)

(assert (=> b!1552942 (= e!864561 e!864562)))

(declare-fun c!143119 () Bool)

(assert (=> b!1552942 (= c!143119 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669144))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669144)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552944 () Bool)

(assert (=> b!1552944 (= e!864562 None!808)))

(declare-fun b!1552941 () Bool)

(assert (=> b!1552941 (= e!864561 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669144))))))))

(declare-fun b!1552943 () Bool)

(assert (=> b!1552943 (= e!864562 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669144))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161163 c!143118) b!1552941))

(assert (= (and d!161163 (not c!143118)) b!1552942))

(assert (= (and b!1552942 c!143119) b!1552943))

(assert (= (and b!1552942 (not c!143119)) b!1552944))

(declare-fun m!1430997 () Bool)

(assert (=> b!1552943 m!1430997))

(assert (=> b!1552535 d!161163))

(assert (=> d!160867 d!160869))

(assert (=> d!160867 d!160811))

(assert (=> d!160867 d!160797))

(assert (=> d!160851 d!160849))

(declare-fun d!161165 () Bool)

(assert (=> d!161165 (= (getValueByKey!735 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!809 (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161165 true))

(declare-fun _$22!589 () Unit!51522)

(assert (=> d!161165 (= (choose!2046 lt!669154 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) _$22!589)))

(declare-fun bs!44590 () Bool)

(assert (= bs!44590 d!161165))

(assert (=> bs!44590 m!1430321))

(assert (=> d!160851 d!161165))

(declare-fun d!161167 () Bool)

(declare-fun res!1063036 () Bool)

(declare-fun e!864563 () Bool)

(assert (=> d!161167 (=> res!1063036 e!864563)))

(assert (=> d!161167 (= res!1063036 (or ((_ is Nil!36256) lt!669154) ((_ is Nil!36256) (t!50967 lt!669154))))))

(assert (=> d!161167 (= (isStrictlySorted!884 lt!669154) e!864563)))

(declare-fun b!1552945 () Bool)

(declare-fun e!864564 () Bool)

(assert (=> b!1552945 (= e!864563 e!864564)))

(declare-fun res!1063037 () Bool)

(assert (=> b!1552945 (=> (not res!1063037) (not e!864564))))

(assert (=> b!1552945 (= res!1063037 (bvslt (_1!12417 (h!37701 lt!669154)) (_1!12417 (h!37701 (t!50967 lt!669154)))))))

(declare-fun b!1552946 () Bool)

(assert (=> b!1552946 (= e!864564 (isStrictlySorted!884 (t!50967 lt!669154)))))

(assert (= (and d!161167 (not res!1063036)) b!1552945))

(assert (= (and b!1552945 res!1063037) b!1552946))

(declare-fun m!1430999 () Bool)

(assert (=> b!1552946 m!1430999))

(assert (=> d!160851 d!161167))

(declare-fun d!161169 () Bool)

(declare-fun c!143120 () Bool)

(assert (=> d!161169 (= c!143120 (and ((_ is Cons!36255) (toList!11226 lt!669194)) (= (_1!12417 (h!37701 (toList!11226 lt!669194))) (_1!12417 (tuple2!24813 lt!669114 lt!669117)))))))

(declare-fun e!864565 () Option!810)

(assert (=> d!161169 (= (getValueByKey!735 (toList!11226 lt!669194) (_1!12417 (tuple2!24813 lt!669114 lt!669117))) e!864565)))

(declare-fun b!1552948 () Bool)

(declare-fun e!864566 () Option!810)

(assert (=> b!1552948 (= e!864565 e!864566)))

(declare-fun c!143121 () Bool)

(assert (=> b!1552948 (= c!143121 (and ((_ is Cons!36255) (toList!11226 lt!669194)) (not (= (_1!12417 (h!37701 (toList!11226 lt!669194))) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))))

(declare-fun b!1552950 () Bool)

(assert (=> b!1552950 (= e!864566 None!808)))

(declare-fun b!1552947 () Bool)

(assert (=> b!1552947 (= e!864565 (Some!809 (_2!12417 (h!37701 (toList!11226 lt!669194)))))))

(declare-fun b!1552949 () Bool)

(assert (=> b!1552949 (= e!864566 (getValueByKey!735 (t!50967 (toList!11226 lt!669194)) (_1!12417 (tuple2!24813 lt!669114 lt!669117))))))

(assert (= (and d!161169 c!143120) b!1552947))

(assert (= (and d!161169 (not c!143120)) b!1552948))

(assert (= (and b!1552948 c!143121) b!1552949))

(assert (= (and b!1552948 (not c!143121)) b!1552950))

(declare-fun m!1431001 () Bool)

(assert (=> b!1552949 m!1431001))

(assert (=> b!1552543 d!161169))

(declare-fun call!71329 () Bool)

(declare-fun c!143122 () Bool)

(declare-fun bm!71326 () Bool)

(assert (=> bm!71326 (= call!71329 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143122 (Cons!36256 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!143042 (Cons!36256 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257))) (ite c!143042 (Cons!36256 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)))))))

(declare-fun b!1552951 () Bool)

(declare-fun e!864568 () Bool)

(assert (=> b!1552951 (= e!864568 call!71329)))

(declare-fun b!1552952 () Bool)

(declare-fun e!864567 () Bool)

(declare-fun e!864570 () Bool)

(assert (=> b!1552952 (= e!864567 e!864570)))

(declare-fun res!1063040 () Bool)

(assert (=> b!1552952 (=> (not res!1063040) (not e!864570))))

(declare-fun e!864569 () Bool)

(assert (=> b!1552952 (= res!1063040 (not e!864569))))

(declare-fun res!1063039 () Bool)

(assert (=> b!1552952 (=> (not res!1063039) (not e!864569))))

(assert (=> b!1552952 (= res!1063039 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!161171 () Bool)

(declare-fun res!1063038 () Bool)

(assert (=> d!161171 (=> res!1063038 e!864567)))

(assert (=> d!161171 (= res!1063038 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(assert (=> d!161171 (= (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143042 (Cons!36256 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257))) e!864567)))

(declare-fun b!1552953 () Bool)

(assert (=> b!1552953 (= e!864569 (contains!10091 (ite c!143042 (Cons!36256 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1552954 () Bool)

(assert (=> b!1552954 (= e!864568 call!71329)))

(declare-fun b!1552955 () Bool)

(assert (=> b!1552955 (= e!864570 e!864568)))

(assert (=> b!1552955 (= c!143122 (validKeyInArray!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!161171 (not res!1063038)) b!1552952))

(assert (= (and b!1552952 res!1063039) b!1552953))

(assert (= (and b!1552952 res!1063040) b!1552955))

(assert (= (and b!1552955 c!143122) b!1552954))

(assert (= (and b!1552955 (not c!143122)) b!1552951))

(assert (= (or b!1552954 b!1552951) bm!71326))

(assert (=> bm!71326 m!1430875))

(declare-fun m!1431003 () Bool)

(assert (=> bm!71326 m!1431003))

(assert (=> b!1552952 m!1430875))

(assert (=> b!1552952 m!1430875))

(assert (=> b!1552952 m!1430877))

(assert (=> b!1552953 m!1430875))

(assert (=> b!1552953 m!1430875))

(declare-fun m!1431005 () Bool)

(assert (=> b!1552953 m!1431005))

(assert (=> b!1552955 m!1430875))

(assert (=> b!1552955 m!1430875))

(assert (=> b!1552955 m!1430877))

(assert (=> bm!71311 d!161171))

(declare-fun d!161173 () Bool)

(assert (=> d!161173 (= (get!26038 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762))) (v!21986 (getValueByKey!735 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160869 d!161173))

(assert (=> d!160869 d!161003))

(assert (=> d!160897 d!160895))

(assert (=> d!160897 d!160811))

(declare-fun d!161175 () Bool)

(declare-fun c!143123 () Bool)

(assert (=> d!161175 (= c!143123 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669148))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669148)))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864571 () Option!810)

(assert (=> d!161175 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669148)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864571)))

(declare-fun b!1552957 () Bool)

(declare-fun e!864572 () Option!810)

(assert (=> b!1552957 (= e!864571 e!864572)))

(declare-fun c!143124 () Bool)

(assert (=> b!1552957 (= c!143124 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669148))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669148)))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun b!1552959 () Bool)

(assert (=> b!1552959 (= e!864572 None!808)))

(declare-fun b!1552956 () Bool)

(assert (=> b!1552956 (= e!864571 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669148))))))))

(declare-fun b!1552958 () Bool)

(assert (=> b!1552958 (= e!864572 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669148))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161175 c!143123) b!1552956))

(assert (= (and d!161175 (not c!143123)) b!1552957))

(assert (= (and b!1552957 c!143124) b!1552958))

(assert (= (and b!1552957 (not c!143124)) b!1552959))

(declare-fun m!1431007 () Bool)

(assert (=> b!1552958 m!1431007))

(assert (=> b!1552554 d!161175))

(declare-fun d!161177 () Bool)

(assert (=> d!161177 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669317 () Unit!51522)

(assert (=> d!161177 (= lt!669317 (choose!2048 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864573 () Bool)

(assert (=> d!161177 e!864573))

(declare-fun res!1063041 () Bool)

(assert (=> d!161177 (=> (not res!1063041) (not e!864573))))

(assert (=> d!161177 (= res!1063041 (isStrictlySorted!884 (toList!11226 lt!669144)))))

(assert (=> d!161177 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669317)))

(declare-fun b!1552960 () Bool)

(assert (=> b!1552960 (= e!864573 (containsKey!752 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161177 res!1063041) b!1552960))

(assert (=> d!161177 m!1430303))

(assert (=> d!161177 m!1430303))

(assert (=> d!161177 m!1430539))

(declare-fun m!1431009 () Bool)

(assert (=> d!161177 m!1431009))

(declare-fun m!1431011 () Bool)

(assert (=> d!161177 m!1431011))

(assert (=> b!1552960 m!1430535))

(assert (=> b!1552612 d!161177))

(assert (=> b!1552612 d!161041))

(assert (=> b!1552612 d!160859))

(declare-fun d!161179 () Bool)

(assert (=> d!161179 (= (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762))) (not ((_ is Some!809) (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))))

(assert (=> d!160975 d!161179))

(assert (=> b!1552532 d!161027))

(assert (=> b!1552532 d!161029))

(declare-fun d!161181 () Bool)

(declare-fun lt!669318 () Bool)

(assert (=> d!161181 (= lt!669318 (select (content!783 lt!669150) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864574 () Bool)

(assert (=> d!161181 (= lt!669318 e!864574)))

(declare-fun res!1063043 () Bool)

(assert (=> d!161181 (=> (not res!1063043) (not e!864574))))

(assert (=> d!161181 (= res!1063043 ((_ is Cons!36255) lt!669150))))

(assert (=> d!161181 (= (contains!10090 lt!669150 (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) lt!669318)))

(declare-fun b!1552961 () Bool)

(declare-fun e!864575 () Bool)

(assert (=> b!1552961 (= e!864574 e!864575)))

(declare-fun res!1063042 () Bool)

(assert (=> b!1552961 (=> res!1063042 e!864575)))

(assert (=> b!1552961 (= res!1063042 (= (h!37701 lt!669150) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552962 () Bool)

(assert (=> b!1552962 (= e!864575 (contains!10090 (t!50967 lt!669150) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161181 res!1063043) b!1552961))

(assert (= (and b!1552961 (not res!1063042)) b!1552962))

(declare-fun m!1431013 () Bool)

(assert (=> d!161181 m!1431013))

(declare-fun m!1431015 () Bool)

(assert (=> d!161181 m!1431015))

(declare-fun m!1431017 () Bool)

(assert (=> b!1552962 m!1431017))

(assert (=> b!1552714 d!161181))

(declare-fun d!161183 () Bool)

(declare-fun res!1063044 () Bool)

(declare-fun e!864576 () Bool)

(assert (=> d!161183 (=> res!1063044 e!864576)))

(assert (=> d!161183 (= res!1063044 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161183 (= (containsKey!752 (t!50967 (toList!11226 lt!669012)) #b0000000000000000000000000000000000000000000000000000000000000000) e!864576)))

(declare-fun b!1552963 () Bool)

(declare-fun e!864577 () Bool)

(assert (=> b!1552963 (= e!864576 e!864577)))

(declare-fun res!1063045 () Bool)

(assert (=> b!1552963 (=> (not res!1063045) (not e!864577))))

(assert (=> b!1552963 (= res!1063045 (and (or (not ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012)))) (bvsle (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552964 () Bool)

(assert (=> b!1552964 (= e!864577 (containsKey!752 (t!50967 (t!50967 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161183 (not res!1063044)) b!1552963))

(assert (= (and b!1552963 res!1063045) b!1552964))

(declare-fun m!1431019 () Bool)

(assert (=> b!1552964 m!1431019))

(assert (=> b!1552583 d!161183))

(declare-fun d!161185 () Bool)

(declare-fun c!143125 () Bool)

(assert (=> d!161185 (= c!143125 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669168))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669168)))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864578 () Option!810)

(assert (=> d!161185 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669168)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864578)))

(declare-fun b!1552966 () Bool)

(declare-fun e!864579 () Option!810)

(assert (=> b!1552966 (= e!864578 e!864579)))

(declare-fun c!143126 () Bool)

(assert (=> b!1552966 (= c!143126 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669168))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669168)))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1552968 () Bool)

(assert (=> b!1552968 (= e!864579 None!808)))

(declare-fun b!1552965 () Bool)

(assert (=> b!1552965 (= e!864578 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669168))))))))

(declare-fun b!1552967 () Bool)

(assert (=> b!1552967 (= e!864579 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669168))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161185 c!143125) b!1552965))

(assert (= (and d!161185 (not c!143125)) b!1552966))

(assert (= (and b!1552966 c!143126) b!1552967))

(assert (= (and b!1552966 (not c!143126)) b!1552968))

(declare-fun m!1431021 () Bool)

(assert (=> b!1552967 m!1431021))

(assert (=> b!1552682 d!161185))

(declare-fun d!161187 () Bool)

(assert (=> d!161187 (= ($colon$colon!946 e!864355 (ite c!143018 (h!37701 (toList!11226 lt!669010)) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (Cons!36255 (ite c!143018 (h!37701 (toList!11226 lt!669010)) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864355))))

(assert (=> bm!71305 d!161187))

(declare-fun d!161189 () Bool)

(declare-fun res!1063046 () Bool)

(declare-fun e!864580 () Bool)

(assert (=> d!161189 (=> res!1063046 e!864580)))

(assert (=> d!161189 (= res!1063046 (and ((_ is Cons!36255) (toList!11226 lt!669168)) (= (_1!12417 (h!37701 (toList!11226 lt!669168))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161189 (= (containsKey!752 (toList!11226 lt!669168) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864580)))

(declare-fun b!1552969 () Bool)

(declare-fun e!864581 () Bool)

(assert (=> b!1552969 (= e!864580 e!864581)))

(declare-fun res!1063047 () Bool)

(assert (=> b!1552969 (=> (not res!1063047) (not e!864581))))

(assert (=> b!1552969 (= res!1063047 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669168))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669168))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36255) (toList!11226 lt!669168)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669168))) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552970 () Bool)

(assert (=> b!1552970 (= e!864581 (containsKey!752 (t!50967 (toList!11226 lt!669168)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161189 (not res!1063046)) b!1552969))

(assert (= (and b!1552969 res!1063047) b!1552970))

(declare-fun m!1431023 () Bool)

(assert (=> b!1552970 m!1431023))

(assert (=> d!160921 d!161189))

(declare-fun d!161191 () Bool)

(declare-fun res!1063048 () Bool)

(declare-fun e!864582 () Bool)

(assert (=> d!161191 (=> res!1063048 e!864582)))

(assert (=> d!161191 (= res!1063048 (and ((_ is Cons!36255) lt!669241) (= (_1!12417 (h!37701 lt!669241)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161191 (= (containsKey!752 lt!669241 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864582)))

(declare-fun b!1552971 () Bool)

(declare-fun e!864583 () Bool)

(assert (=> b!1552971 (= e!864582 e!864583)))

(declare-fun res!1063049 () Bool)

(assert (=> b!1552971 (=> (not res!1063049) (not e!864583))))

(assert (=> b!1552971 (= res!1063049 (and (or (not ((_ is Cons!36255) lt!669241)) (bvsle (_1!12417 (h!37701 lt!669241)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36255) lt!669241) (bvslt (_1!12417 (h!37701 lt!669241)) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552972 () Bool)

(assert (=> b!1552972 (= e!864583 (containsKey!752 (t!50967 lt!669241) (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161191 (not res!1063048)) b!1552971))

(assert (= (and b!1552971 res!1063049) b!1552972))

(declare-fun m!1431025 () Bool)

(assert (=> b!1552972 m!1431025))

(assert (=> b!1552640 d!161191))

(assert (=> d!160961 d!160963))

(assert (=> d!160961 d!160845))

(declare-fun d!161193 () Bool)

(assert (=> d!161193 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!161193 true))

(declare-fun _$12!484 () Unit!51522)

(assert (=> d!161193 (= (choose!2048 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)) _$12!484)))

(declare-fun bs!44591 () Bool)

(assert (= bs!44591 d!161193))

(assert (=> bs!44591 m!1430059))

(assert (=> bs!44591 m!1430339))

(assert (=> bs!44591 m!1430339))

(assert (=> bs!44591 m!1430365))

(assert (=> d!160961 d!161193))

(assert (=> d!160961 d!161057))

(declare-fun d!161195 () Bool)

(declare-fun res!1063050 () Bool)

(declare-fun e!864584 () Bool)

(assert (=> d!161195 (=> res!1063050 e!864584)))

(assert (=> d!161195 (= res!1063050 (or ((_ is Nil!36256) lt!669181) ((_ is Nil!36256) (t!50967 lt!669181))))))

(assert (=> d!161195 (= (isStrictlySorted!884 lt!669181) e!864584)))

(declare-fun b!1552973 () Bool)

(declare-fun e!864585 () Bool)

(assert (=> b!1552973 (= e!864584 e!864585)))

(declare-fun res!1063051 () Bool)

(assert (=> b!1552973 (=> (not res!1063051) (not e!864585))))

(assert (=> b!1552973 (= res!1063051 (bvslt (_1!12417 (h!37701 lt!669181)) (_1!12417 (h!37701 (t!50967 lt!669181)))))))

(declare-fun b!1552974 () Bool)

(assert (=> b!1552974 (= e!864585 (isStrictlySorted!884 (t!50967 lt!669181)))))

(assert (= (and d!161195 (not res!1063050)) b!1552973))

(assert (= (and b!1552973 res!1063051) b!1552974))

(declare-fun m!1431027 () Bool)

(assert (=> b!1552974 m!1431027))

(assert (=> d!160853 d!161195))

(declare-fun d!161197 () Bool)

(declare-fun res!1063052 () Bool)

(declare-fun e!864586 () Bool)

(assert (=> d!161197 (=> res!1063052 e!864586)))

(assert (=> d!161197 (= res!1063052 (or ((_ is Nil!36256) (toList!11226 call!71243)) ((_ is Nil!36256) (t!50967 (toList!11226 call!71243)))))))

(assert (=> d!161197 (= (isStrictlySorted!884 (toList!11226 call!71243)) e!864586)))

(declare-fun b!1552975 () Bool)

(declare-fun e!864587 () Bool)

(assert (=> b!1552975 (= e!864586 e!864587)))

(declare-fun res!1063053 () Bool)

(assert (=> b!1552975 (=> (not res!1063053) (not e!864587))))

(assert (=> b!1552975 (= res!1063053 (bvslt (_1!12417 (h!37701 (toList!11226 call!71243))) (_1!12417 (h!37701 (t!50967 (toList!11226 call!71243))))))))

(declare-fun b!1552976 () Bool)

(assert (=> b!1552976 (= e!864587 (isStrictlySorted!884 (t!50967 (toList!11226 call!71243))))))

(assert (= (and d!161197 (not res!1063052)) b!1552975))

(assert (= (and b!1552975 res!1063053) b!1552976))

(declare-fun m!1431029 () Bool)

(assert (=> b!1552976 m!1431029))

(assert (=> d!160853 d!161197))

(assert (=> b!1552670 d!161077))

(declare-fun d!161199 () Bool)

(declare-fun e!864588 () Bool)

(assert (=> d!161199 e!864588))

(declare-fun res!1063054 () Bool)

(assert (=> d!161199 (=> res!1063054 e!864588)))

(declare-fun lt!669321 () Bool)

(assert (=> d!161199 (= res!1063054 (not lt!669321))))

(declare-fun lt!669319 () Bool)

(assert (=> d!161199 (= lt!669321 lt!669319)))

(declare-fun lt!669322 () Unit!51522)

(declare-fun e!864589 () Unit!51522)

(assert (=> d!161199 (= lt!669322 e!864589)))

(declare-fun c!143127 () Bool)

(assert (=> d!161199 (= c!143127 lt!669319)))

(assert (=> d!161199 (= lt!669319 (containsKey!752 (toList!11226 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248))) lt!669249))))

(assert (=> d!161199 (= (contains!10087 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248)) lt!669249) lt!669321)))

(declare-fun b!1552977 () Bool)

(declare-fun lt!669320 () Unit!51522)

(assert (=> b!1552977 (= e!864589 lt!669320)))

(assert (=> b!1552977 (= lt!669320 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248))) lt!669249))))

(assert (=> b!1552977 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248))) lt!669249))))

(declare-fun b!1552978 () Bool)

(declare-fun Unit!51547 () Unit!51522)

(assert (=> b!1552978 (= e!864589 Unit!51547)))

(declare-fun b!1552979 () Bool)

(assert (=> b!1552979 (= e!864588 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248))) lt!669249)))))

(assert (= (and d!161199 c!143127) b!1552977))

(assert (= (and d!161199 (not c!143127)) b!1552978))

(assert (= (and d!161199 (not res!1063054)) b!1552979))

(declare-fun m!1431031 () Bool)

(assert (=> d!161199 m!1431031))

(declare-fun m!1431033 () Bool)

(assert (=> b!1552977 m!1431033))

(declare-fun m!1431035 () Bool)

(assert (=> b!1552977 m!1431035))

(assert (=> b!1552977 m!1431035))

(declare-fun m!1431037 () Bool)

(assert (=> b!1552977 m!1431037))

(assert (=> b!1552979 m!1431035))

(assert (=> b!1552979 m!1431035))

(assert (=> b!1552979 m!1431037))

(assert (=> b!1552670 d!161199))

(declare-fun d!161201 () Bool)

(declare-fun e!864590 () Bool)

(assert (=> d!161201 e!864590))

(declare-fun res!1063056 () Bool)

(assert (=> d!161201 (=> (not res!1063056) (not e!864590))))

(declare-fun lt!669323 () ListLongMap!22421)

(assert (=> d!161201 (= res!1063056 (contains!10087 lt!669323 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!669325 () List!36259)

(assert (=> d!161201 (= lt!669323 (ListLongMap!22422 lt!669325))))

(declare-fun lt!669326 () Unit!51522)

(declare-fun lt!669324 () Unit!51522)

(assert (=> d!161201 (= lt!669326 lt!669324)))

(assert (=> d!161201 (= (getValueByKey!735 lt!669325 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!809 (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161201 (= lt!669324 (lemmaContainsTupThenGetReturnValue!375 lt!669325 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161201 (= lt!669325 (insertStrictlySorted!504 (toList!11226 call!71313) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161201 (= (+!5040 call!71313 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!669323)))

(declare-fun b!1552980 () Bool)

(declare-fun res!1063055 () Bool)

(assert (=> b!1552980 (=> (not res!1063055) (not e!864590))))

(assert (=> b!1552980 (= res!1063055 (= (getValueByKey!735 (toList!11226 lt!669323) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!809 (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1552981 () Bool)

(assert (=> b!1552981 (= e!864590 (contains!10090 (toList!11226 lt!669323) (tuple2!24813 (select (arr!49970 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26035 (select (arr!49971 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!161201 res!1063056) b!1552980))

(assert (= (and b!1552980 res!1063055) b!1552981))

(declare-fun m!1431039 () Bool)

(assert (=> d!161201 m!1431039))

(declare-fun m!1431041 () Bool)

(assert (=> d!161201 m!1431041))

(declare-fun m!1431043 () Bool)

(assert (=> d!161201 m!1431043))

(declare-fun m!1431045 () Bool)

(assert (=> d!161201 m!1431045))

(declare-fun m!1431047 () Bool)

(assert (=> b!1552980 m!1431047))

(declare-fun m!1431049 () Bool)

(assert (=> b!1552981 m!1431049))

(assert (=> b!1552670 d!161201))

(declare-fun d!161203 () Bool)

(declare-fun e!864591 () Bool)

(assert (=> d!161203 e!864591))

(declare-fun res!1063058 () Bool)

(assert (=> d!161203 (=> (not res!1063058) (not e!864591))))

(declare-fun lt!669327 () ListLongMap!22421)

(assert (=> d!161203 (= res!1063058 (contains!10087 lt!669327 (_1!12417 (tuple2!24813 lt!669245 lt!669248))))))

(declare-fun lt!669329 () List!36259)

(assert (=> d!161203 (= lt!669327 (ListLongMap!22422 lt!669329))))

(declare-fun lt!669330 () Unit!51522)

(declare-fun lt!669328 () Unit!51522)

(assert (=> d!161203 (= lt!669330 lt!669328)))

(assert (=> d!161203 (= (getValueByKey!735 lt!669329 (_1!12417 (tuple2!24813 lt!669245 lt!669248))) (Some!809 (_2!12417 (tuple2!24813 lt!669245 lt!669248))))))

(assert (=> d!161203 (= lt!669328 (lemmaContainsTupThenGetReturnValue!375 lt!669329 (_1!12417 (tuple2!24813 lt!669245 lt!669248)) (_2!12417 (tuple2!24813 lt!669245 lt!669248))))))

(assert (=> d!161203 (= lt!669329 (insertStrictlySorted!504 (toList!11226 lt!669247) (_1!12417 (tuple2!24813 lt!669245 lt!669248)) (_2!12417 (tuple2!24813 lt!669245 lt!669248))))))

(assert (=> d!161203 (= (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248)) lt!669327)))

(declare-fun b!1552982 () Bool)

(declare-fun res!1063057 () Bool)

(assert (=> b!1552982 (=> (not res!1063057) (not e!864591))))

(assert (=> b!1552982 (= res!1063057 (= (getValueByKey!735 (toList!11226 lt!669327) (_1!12417 (tuple2!24813 lt!669245 lt!669248))) (Some!809 (_2!12417 (tuple2!24813 lt!669245 lt!669248)))))))

(declare-fun b!1552983 () Bool)

(assert (=> b!1552983 (= e!864591 (contains!10090 (toList!11226 lt!669327) (tuple2!24813 lt!669245 lt!669248)))))

(assert (= (and d!161203 res!1063058) b!1552982))

(assert (= (and b!1552982 res!1063057) b!1552983))

(declare-fun m!1431051 () Bool)

(assert (=> d!161203 m!1431051))

(declare-fun m!1431053 () Bool)

(assert (=> d!161203 m!1431053))

(declare-fun m!1431055 () Bool)

(assert (=> d!161203 m!1431055))

(declare-fun m!1431057 () Bool)

(assert (=> d!161203 m!1431057))

(declare-fun m!1431059 () Bool)

(assert (=> b!1552982 m!1431059))

(declare-fun m!1431061 () Bool)

(assert (=> b!1552983 m!1431061))

(assert (=> b!1552670 d!161203))

(declare-fun d!161205 () Bool)

(assert (=> d!161205 (not (contains!10087 (+!5040 lt!669247 (tuple2!24813 lt!669245 lt!669248)) lt!669249))))

(declare-fun lt!669331 () Unit!51522)

(assert (=> d!161205 (= lt!669331 (choose!2047 lt!669247 lt!669245 lt!669248 lt!669249))))

(declare-fun e!864592 () Bool)

(assert (=> d!161205 e!864592))

(declare-fun res!1063059 () Bool)

(assert (=> d!161205 (=> (not res!1063059) (not e!864592))))

(assert (=> d!161205 (= res!1063059 (not (contains!10087 lt!669247 lt!669249)))))

(assert (=> d!161205 (= (addStillNotContains!501 lt!669247 lt!669245 lt!669248 lt!669249) lt!669331)))

(declare-fun b!1552984 () Bool)

(assert (=> b!1552984 (= e!864592 (not (= lt!669245 lt!669249)))))

(assert (= (and d!161205 res!1063059) b!1552984))

(assert (=> d!161205 m!1430627))

(assert (=> d!161205 m!1430627))

(assert (=> d!161205 m!1430629))

(declare-fun m!1431063 () Bool)

(assert (=> d!161205 m!1431063))

(declare-fun m!1431065 () Bool)

(assert (=> d!161205 m!1431065))

(assert (=> b!1552670 d!161205))

(declare-fun d!161207 () Bool)

(declare-fun res!1063060 () Bool)

(declare-fun e!864593 () Bool)

(assert (=> d!161207 (=> res!1063060 e!864593)))

(assert (=> d!161207 (= res!1063060 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161207 (= (containsKey!752 (t!50967 (toList!11226 lt!669012)) #b1000000000000000000000000000000000000000000000000000000000000000) e!864593)))

(declare-fun b!1552985 () Bool)

(declare-fun e!864594 () Bool)

(assert (=> b!1552985 (= e!864593 e!864594)))

(declare-fun res!1063061 () Bool)

(assert (=> b!1552985 (=> (not res!1063061) (not e!864594))))

(assert (=> b!1552985 (= res!1063061 (and (or (not ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012)))) (bvsle (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552986 () Bool)

(assert (=> b!1552986 (= e!864594 (containsKey!752 (t!50967 (t!50967 (toList!11226 lt!669012))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161207 (not res!1063060)) b!1552985))

(assert (= (and b!1552985 res!1063061) b!1552986))

(declare-fun m!1431067 () Bool)

(assert (=> b!1552986 m!1431067))

(assert (=> b!1552474 d!161207))

(assert (=> d!160985 d!160975))

(assert (=> d!160985 d!160931))

(declare-fun d!161209 () Bool)

(assert (=> d!161209 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)))))

(assert (=> d!161209 true))

(declare-fun _$12!485 () Unit!51522)

(assert (=> d!161209 (= (choose!2048 (toList!11226 lt!669015) (select (arr!49970 _keys!618) from!762)) _$12!485)))

(declare-fun bs!44592 () Bool)

(assert (= bs!44592 d!161209))

(assert (=> bs!44592 m!1430059))

(assert (=> bs!44592 m!1430245))

(assert (=> bs!44592 m!1430245))

(assert (=> bs!44592 m!1430289))

(assert (=> d!160985 d!161209))

(declare-fun d!161211 () Bool)

(declare-fun res!1063062 () Bool)

(declare-fun e!864595 () Bool)

(assert (=> d!161211 (=> res!1063062 e!864595)))

(assert (=> d!161211 (= res!1063062 (or ((_ is Nil!36256) (toList!11226 lt!669015)) ((_ is Nil!36256) (t!50967 (toList!11226 lt!669015)))))))

(assert (=> d!161211 (= (isStrictlySorted!884 (toList!11226 lt!669015)) e!864595)))

(declare-fun b!1552987 () Bool)

(declare-fun e!864596 () Bool)

(assert (=> b!1552987 (= e!864595 e!864596)))

(declare-fun res!1063063 () Bool)

(assert (=> b!1552987 (=> (not res!1063063) (not e!864596))))

(assert (=> b!1552987 (= res!1063063 (bvslt (_1!12417 (h!37701 (toList!11226 lt!669015))) (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669015))))))))

(declare-fun b!1552988 () Bool)

(assert (=> b!1552988 (= e!864596 (isStrictlySorted!884 (t!50967 (toList!11226 lt!669015))))))

(assert (= (and d!161211 (not res!1063062)) b!1552987))

(assert (= (and b!1552987 res!1063063) b!1552988))

(declare-fun m!1431069 () Bool)

(assert (=> b!1552988 m!1431069))

(assert (=> d!160985 d!161211))

(declare-fun d!161213 () Bool)

(declare-fun res!1063064 () Bool)

(declare-fun e!864597 () Bool)

(assert (=> d!161213 (=> res!1063064 e!864597)))

(assert (=> d!161213 (= res!1063064 (and ((_ is Cons!36255) lt!669235) (= (_1!12417 (h!37701 lt!669235)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161213 (= (containsKey!752 lt!669235 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864597)))

(declare-fun b!1552989 () Bool)

(declare-fun e!864598 () Bool)

(assert (=> b!1552989 (= e!864597 e!864598)))

(declare-fun res!1063065 () Bool)

(assert (=> b!1552989 (=> (not res!1063065) (not e!864598))))

(assert (=> b!1552989 (= res!1063065 (and (or (not ((_ is Cons!36255) lt!669235)) (bvsle (_1!12417 (h!37701 lt!669235)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36255) lt!669235) (bvslt (_1!12417 (h!37701 lt!669235)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552990 () Bool)

(assert (=> b!1552990 (= e!864598 (containsKey!752 (t!50967 lt!669235) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161213 (not res!1063064)) b!1552989))

(assert (= (and b!1552989 res!1063065) b!1552990))

(declare-fun m!1431071 () Bool)

(assert (=> b!1552990 m!1431071))

(assert (=> b!1552621 d!161213))

(declare-fun d!161215 () Bool)

(declare-fun lt!669332 () Bool)

(assert (=> d!161215 (= lt!669332 (select (content!783 (t!50967 (toList!11226 lt!669152))) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864599 () Bool)

(assert (=> d!161215 (= lt!669332 e!864599)))

(declare-fun res!1063067 () Bool)

(assert (=> d!161215 (=> (not res!1063067) (not e!864599))))

(assert (=> d!161215 (= res!1063067 ((_ is Cons!36255) (t!50967 (toList!11226 lt!669152))))))

(assert (=> d!161215 (= (contains!10090 (t!50967 (toList!11226 lt!669152)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669332)))

(declare-fun b!1552991 () Bool)

(declare-fun e!864600 () Bool)

(assert (=> b!1552991 (= e!864599 e!864600)))

(declare-fun res!1063066 () Bool)

(assert (=> b!1552991 (=> res!1063066 e!864600)))

(assert (=> b!1552991 (= res!1063066 (= (h!37701 (t!50967 (toList!11226 lt!669152))) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552992 () Bool)

(assert (=> b!1552992 (= e!864600 (contains!10090 (t!50967 (t!50967 (toList!11226 lt!669152))) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161215 res!1063067) b!1552991))

(assert (= (and b!1552991 (not res!1063066)) b!1552992))

(assert (=> d!161215 m!1430905))

(declare-fun m!1431073 () Bool)

(assert (=> d!161215 m!1431073))

(declare-fun m!1431075 () Bool)

(assert (=> b!1552992 m!1431075))

(assert (=> b!1552685 d!161215))

(assert (=> b!1552725 d!160937))

(declare-fun d!161217 () Bool)

(declare-fun c!143128 () Bool)

(assert (=> d!161217 (= c!143128 ((_ is Nil!36256) (toList!11226 lt!669168)))))

(declare-fun e!864601 () (InoxSet tuple2!24812))

(assert (=> d!161217 (= (content!783 (toList!11226 lt!669168)) e!864601)))

(declare-fun b!1552993 () Bool)

(assert (=> b!1552993 (= e!864601 ((as const (Array tuple2!24812 Bool)) false))))

(declare-fun b!1552994 () Bool)

(assert (=> b!1552994 (= e!864601 ((_ map or) (store ((as const (Array tuple2!24812 Bool)) false) (h!37701 (toList!11226 lt!669168)) true) (content!783 (t!50967 (toList!11226 lt!669168)))))))

(assert (= (and d!161217 c!143128) b!1552993))

(assert (= (and d!161217 (not c!143128)) b!1552994))

(declare-fun m!1431077 () Bool)

(assert (=> b!1552994 m!1431077))

(declare-fun m!1431079 () Bool)

(assert (=> b!1552994 m!1431079))

(assert (=> d!160899 d!161217))

(declare-fun d!161219 () Bool)

(declare-fun c!143129 () Bool)

(assert (=> d!161219 (= c!143129 (and ((_ is Cons!36255) (t!50967 lt!669154)) (= (_1!12417 (h!37701 (t!50967 lt!669154))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864602 () Option!810)

(assert (=> d!161219 (= (getValueByKey!735 (t!50967 lt!669154) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864602)))

(declare-fun b!1552996 () Bool)

(declare-fun e!864603 () Option!810)

(assert (=> b!1552996 (= e!864602 e!864603)))

(declare-fun c!143130 () Bool)

(assert (=> b!1552996 (= c!143130 (and ((_ is Cons!36255) (t!50967 lt!669154)) (not (= (_1!12417 (h!37701 (t!50967 lt!669154))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552998 () Bool)

(assert (=> b!1552998 (= e!864603 None!808)))

(declare-fun b!1552995 () Bool)

(assert (=> b!1552995 (= e!864602 (Some!809 (_2!12417 (h!37701 (t!50967 lt!669154)))))))

(declare-fun b!1552997 () Bool)

(assert (=> b!1552997 (= e!864603 (getValueByKey!735 (t!50967 (t!50967 lt!669154)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161219 c!143129) b!1552995))

(assert (= (and d!161219 (not c!143129)) b!1552996))

(assert (= (and b!1552996 c!143130) b!1552997))

(assert (= (and b!1552996 (not c!143130)) b!1552998))

(declare-fun m!1431081 () Bool)

(assert (=> b!1552997 m!1431081))

(assert (=> b!1552492 d!161219))

(assert (=> b!1552697 d!160887))

(declare-fun d!161221 () Bool)

(assert (=> d!161221 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669333 () Unit!51522)

(assert (=> d!161221 (= lt!669333 (choose!2048 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864604 () Bool)

(assert (=> d!161221 e!864604))

(declare-fun res!1063068 () Bool)

(assert (=> d!161221 (=> (not res!1063068) (not e!864604))))

(assert (=> d!161221 (= res!1063068 (isStrictlySorted!884 (toList!11226 lt!669152)))))

(assert (=> d!161221 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669333)))

(declare-fun b!1552999 () Bool)

(assert (=> b!1552999 (= e!864604 (containsKey!752 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161221 res!1063068) b!1552999))

(assert (=> d!161221 m!1430327))

(assert (=> d!161221 m!1430327))

(assert (=> d!161221 m!1430391))

(declare-fun m!1431083 () Bool)

(assert (=> d!161221 m!1431083))

(declare-fun m!1431085 () Bool)

(assert (=> d!161221 m!1431085))

(assert (=> b!1552999 m!1430387))

(assert (=> b!1552487 d!161221))

(assert (=> b!1552487 d!161083))

(assert (=> b!1552487 d!160891))

(declare-fun lt!669334 () Bool)

(declare-fun d!161223 () Bool)

(assert (=> d!161223 (= lt!669334 (select (content!783 (toList!11226 lt!669190)) (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!864605 () Bool)

(assert (=> d!161223 (= lt!669334 e!864605)))

(declare-fun res!1063070 () Bool)

(assert (=> d!161223 (=> (not res!1063070) (not e!864605))))

(assert (=> d!161223 (= res!1063070 ((_ is Cons!36255) (toList!11226 lt!669190)))))

(assert (=> d!161223 (= (contains!10090 (toList!11226 lt!669190) (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!669334)))

(declare-fun b!1553000 () Bool)

(declare-fun e!864606 () Bool)

(assert (=> b!1553000 (= e!864605 e!864606)))

(declare-fun res!1063069 () Bool)

(assert (=> b!1553000 (=> res!1063069 e!864606)))

(assert (=> b!1553000 (= res!1063069 (= (h!37701 (toList!11226 lt!669190)) (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1553001 () Bool)

(assert (=> b!1553001 (= e!864606 (contains!10090 (t!50967 (toList!11226 lt!669190)) (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!161223 res!1063070) b!1553000))

(assert (= (and b!1553000 (not res!1063069)) b!1553001))

(declare-fun m!1431087 () Bool)

(assert (=> d!161223 m!1431087))

(declare-fun m!1431089 () Bool)

(assert (=> d!161223 m!1431089))

(declare-fun m!1431091 () Bool)

(assert (=> b!1553001 m!1431091))

(assert (=> b!1552542 d!161223))

(declare-fun d!161225 () Bool)

(assert (=> d!161225 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669335 () Unit!51522)

(assert (=> d!161225 (= lt!669335 (choose!2048 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864607 () Bool)

(assert (=> d!161225 e!864607))

(declare-fun res!1063071 () Bool)

(assert (=> d!161225 (=> (not res!1063071) (not e!864607))))

(assert (=> d!161225 (= res!1063071 (isStrictlySorted!884 (toList!11226 lt!669115)))))

(assert (=> d!161225 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000) lt!669335)))

(declare-fun b!1553002 () Bool)

(assert (=> b!1553002 (= e!864607 (containsKey!752 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161225 res!1063071) b!1553002))

(assert (=> d!161225 m!1430653))

(assert (=> d!161225 m!1430653))

(assert (=> d!161225 m!1430655))

(declare-fun m!1431093 () Bool)

(assert (=> d!161225 m!1431093))

(assert (=> d!161225 m!1430717))

(assert (=> b!1553002 m!1430649))

(assert (=> b!1552686 d!161225))

(assert (=> b!1552686 d!161087))

(assert (=> b!1552686 d!161089))

(declare-fun d!161227 () Bool)

(assert (=> d!161227 (arrayContainsKey!0 _keys!618 lt!669224 #b00000000000000000000000000000000)))

(declare-fun lt!669336 () Unit!51522)

(assert (=> d!161227 (= lt!669336 (choose!13 _keys!618 lt!669224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!161227 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!161227 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!669336)))

(declare-fun bs!44593 () Bool)

(assert (= bs!44593 d!161227))

(assert (=> bs!44593 m!1430521))

(declare-fun m!1431095 () Bool)

(assert (=> bs!44593 m!1431095))

(assert (=> b!1552600 d!161227))

(declare-fun d!161229 () Bool)

(declare-fun res!1063072 () Bool)

(declare-fun e!864608 () Bool)

(assert (=> d!161229 (=> res!1063072 e!864608)))

(assert (=> d!161229 (= res!1063072 (= (select (arr!49970 _keys!618) #b00000000000000000000000000000000) lt!669224))))

(assert (=> d!161229 (= (arrayContainsKey!0 _keys!618 lt!669224 #b00000000000000000000000000000000) e!864608)))

(declare-fun b!1553003 () Bool)

(declare-fun e!864609 () Bool)

(assert (=> b!1553003 (= e!864608 e!864609)))

(declare-fun res!1063073 () Bool)

(assert (=> b!1553003 (=> (not res!1063073) (not e!864609))))

(assert (=> b!1553003 (= res!1063073 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1553004 () Bool)

(assert (=> b!1553004 (= e!864609 (arrayContainsKey!0 _keys!618 lt!669224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!161229 (not res!1063072)) b!1553003))

(assert (= (and b!1553003 res!1063073) b!1553004))

(assert (=> d!161229 m!1430233))

(declare-fun m!1431097 () Bool)

(assert (=> b!1553004 m!1431097))

(assert (=> b!1552600 d!161229))

(declare-fun b!1553005 () Bool)

(declare-fun e!864612 () SeekEntryResult!13516)

(declare-fun lt!669338 () SeekEntryResult!13516)

(assert (=> b!1553005 (= e!864612 (MissingZero!13516 (index!56464 lt!669338)))))

(declare-fun b!1553006 () Bool)

(declare-fun e!864610 () SeekEntryResult!13516)

(assert (=> b!1553006 (= e!864610 (Found!13516 (index!56464 lt!669338)))))

(declare-fun d!161231 () Bool)

(declare-fun lt!669337 () SeekEntryResult!13516)

(assert (=> d!161231 (and (or ((_ is Undefined!13516) lt!669337) (not ((_ is Found!13516) lt!669337)) (and (bvsge (index!56463 lt!669337) #b00000000000000000000000000000000) (bvslt (index!56463 lt!669337) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669337) ((_ is Found!13516) lt!669337) (not ((_ is MissingZero!13516) lt!669337)) (and (bvsge (index!56462 lt!669337) #b00000000000000000000000000000000) (bvslt (index!56462 lt!669337) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669337) ((_ is Found!13516) lt!669337) ((_ is MissingZero!13516) lt!669337) (not ((_ is MissingVacant!13516) lt!669337)) (and (bvsge (index!56465 lt!669337) #b00000000000000000000000000000000) (bvslt (index!56465 lt!669337) (size!50522 _keys!618)))) (or ((_ is Undefined!13516) lt!669337) (ite ((_ is Found!13516) lt!669337) (= (select (arr!49970 _keys!618) (index!56463 lt!669337)) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!13516) lt!669337) (= (select (arr!49970 _keys!618) (index!56462 lt!669337)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13516) lt!669337) (= (select (arr!49970 _keys!618) (index!56465 lt!669337)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!864611 () SeekEntryResult!13516)

(assert (=> d!161231 (= lt!669337 e!864611)))

(declare-fun c!143133 () Bool)

(assert (=> d!161231 (= c!143133 (and ((_ is Intermediate!13516) lt!669338) (undefined!14328 lt!669338)))))

(assert (=> d!161231 (= lt!669338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!926) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926))))

(assert (=> d!161231 (validMask!0 mask!926)))

(assert (=> d!161231 (= (seekEntryOrOpen!0 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926) lt!669337)))

(declare-fun b!1553007 () Bool)

(declare-fun c!143131 () Bool)

(declare-fun lt!669339 () (_ BitVec 64))

(assert (=> b!1553007 (= c!143131 (= lt!669339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553007 (= e!864610 e!864612)))

(declare-fun b!1553008 () Bool)

(assert (=> b!1553008 (= e!864611 Undefined!13516)))

(declare-fun b!1553009 () Bool)

(assert (=> b!1553009 (= e!864612 (seekKeyOrZeroReturnVacant!0 (x!139210 lt!669338) (index!56464 lt!669338) (index!56464 lt!669338) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926))))

(declare-fun b!1553010 () Bool)

(assert (=> b!1553010 (= e!864611 e!864610)))

(assert (=> b!1553010 (= lt!669339 (select (arr!49970 _keys!618) (index!56464 lt!669338)))))

(declare-fun c!143132 () Bool)

(assert (=> b!1553010 (= c!143132 (= lt!669339 (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!161231 c!143133) b!1553008))

(assert (= (and d!161231 (not c!143133)) b!1553010))

(assert (= (and b!1553010 c!143132) b!1553006))

(assert (= (and b!1553010 (not c!143132)) b!1553007))

(assert (= (and b!1553007 c!143131) b!1553005))

(assert (= (and b!1553007 (not c!143131)) b!1553009))

(assert (=> d!161231 m!1430515))

(declare-fun m!1431099 () Bool)

(assert (=> d!161231 m!1431099))

(assert (=> d!161231 m!1430073))

(declare-fun m!1431101 () Bool)

(assert (=> d!161231 m!1431101))

(declare-fun m!1431103 () Bool)

(assert (=> d!161231 m!1431103))

(declare-fun m!1431105 () Bool)

(assert (=> d!161231 m!1431105))

(assert (=> d!161231 m!1431099))

(assert (=> d!161231 m!1430515))

(declare-fun m!1431107 () Bool)

(assert (=> d!161231 m!1431107))

(assert (=> b!1553009 m!1430515))

(declare-fun m!1431109 () Bool)

(assert (=> b!1553009 m!1431109))

(declare-fun m!1431111 () Bool)

(assert (=> b!1553010 m!1431111))

(assert (=> b!1552600 d!161231))

(declare-fun d!161233 () Bool)

(assert (=> d!161233 (= (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762))) (not ((_ is Some!809) (getValueByKey!735 (toList!11226 lt!669012) (select (arr!49970 _keys!618) from!762)))))))

(assert (=> d!160963 d!161233))

(declare-fun d!161235 () Bool)

(declare-fun lt!669340 () Bool)

(assert (=> d!161235 (= lt!669340 (select (content!783 (t!50967 (toList!11226 lt!669168))) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864613 () Bool)

(assert (=> d!161235 (= lt!669340 e!864613)))

(declare-fun res!1063075 () Bool)

(assert (=> d!161235 (=> (not res!1063075) (not e!864613))))

(assert (=> d!161235 (= res!1063075 ((_ is Cons!36255) (t!50967 (toList!11226 lt!669168))))))

(assert (=> d!161235 (= (contains!10090 (t!50967 (toList!11226 lt!669168)) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669340)))

(declare-fun b!1553011 () Bool)

(declare-fun e!864614 () Bool)

(assert (=> b!1553011 (= e!864613 e!864614)))

(declare-fun res!1063074 () Bool)

(assert (=> b!1553011 (=> res!1063074 e!864614)))

(assert (=> b!1553011 (= res!1063074 (= (h!37701 (t!50967 (toList!11226 lt!669168))) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553012 () Bool)

(assert (=> b!1553012 (= e!864614 (contains!10090 (t!50967 (t!50967 (toList!11226 lt!669168))) (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161235 res!1063075) b!1553011))

(assert (= (and b!1553011 (not res!1063074)) b!1553012))

(assert (=> d!161235 m!1431079))

(declare-fun m!1431113 () Bool)

(assert (=> d!161235 m!1431113))

(declare-fun m!1431115 () Bool)

(assert (=> b!1553012 m!1431115))

(assert (=> b!1552597 d!161235))

(declare-fun d!161237 () Bool)

(declare-fun res!1063076 () Bool)

(declare-fun e!864615 () Bool)

(assert (=> d!161237 (=> res!1063076 e!864615)))

(assert (=> d!161237 (= res!1063076 (and ((_ is Cons!36255) (toList!11226 lt!669144)) (= (_1!12417 (h!37701 (toList!11226 lt!669144))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161237 (= (containsKey!752 (toList!11226 lt!669144) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864615)))

(declare-fun b!1553013 () Bool)

(declare-fun e!864616 () Bool)

(assert (=> b!1553013 (= e!864615 e!864616)))

(declare-fun res!1063077 () Bool)

(assert (=> b!1553013 (=> (not res!1063077) (not e!864616))))

(assert (=> b!1553013 (= res!1063077 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669144))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669144))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36255) (toList!11226 lt!669144)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669144))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553014 () Bool)

(assert (=> b!1553014 (= e!864616 (containsKey!752 (t!50967 (toList!11226 lt!669144)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161237 (not res!1063076)) b!1553013))

(assert (= (and b!1553013 res!1063077) b!1553014))

(declare-fun m!1431117 () Bool)

(assert (=> b!1553014 m!1431117))

(assert (=> d!160909 d!161237))

(declare-fun d!161239 () Bool)

(declare-fun res!1063078 () Bool)

(declare-fun e!864617 () Bool)

(assert (=> d!161239 (=> res!1063078 e!864617)))

(assert (=> d!161239 (= res!1063078 (= (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!669093))))

(assert (=> d!161239 (= (arrayContainsKey!0 _keys!618 lt!669093 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!864617)))

(declare-fun b!1553015 () Bool)

(declare-fun e!864618 () Bool)

(assert (=> b!1553015 (= e!864617 e!864618)))

(declare-fun res!1063079 () Bool)

(assert (=> b!1553015 (=> (not res!1063079) (not e!864618))))

(assert (=> b!1553015 (= res!1063079 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50522 _keys!618)))))

(declare-fun b!1553016 () Bool)

(assert (=> b!1553016 (= e!864618 (arrayContainsKey!0 _keys!618 lt!669093 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!161239 (not res!1063078)) b!1553015))

(assert (= (and b!1553015 res!1063079) b!1553016))

(assert (=> d!161239 m!1430515))

(declare-fun m!1431119 () Bool)

(assert (=> b!1553016 m!1431119))

(assert (=> b!1552561 d!161239))

(declare-fun d!161241 () Bool)

(declare-fun lt!669341 () Bool)

(assert (=> d!161241 (= lt!669341 (select (content!783 (t!50967 (toList!11226 lt!669144))) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864619 () Bool)

(assert (=> d!161241 (= lt!669341 e!864619)))

(declare-fun res!1063081 () Bool)

(assert (=> d!161241 (=> (not res!1063081) (not e!864619))))

(assert (=> d!161241 (= res!1063081 ((_ is Cons!36255) (t!50967 (toList!11226 lt!669144))))))

(assert (=> d!161241 (= (contains!10090 (t!50967 (toList!11226 lt!669144)) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669341)))

(declare-fun b!1553017 () Bool)

(declare-fun e!864620 () Bool)

(assert (=> b!1553017 (= e!864619 e!864620)))

(declare-fun res!1063080 () Bool)

(assert (=> b!1553017 (=> res!1063080 e!864620)))

(assert (=> b!1553017 (= res!1063080 (= (h!37701 (t!50967 (toList!11226 lt!669144))) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1553018 () Bool)

(assert (=> b!1553018 (= e!864620 (contains!10090 (t!50967 (t!50967 (toList!11226 lt!669144))) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161241 res!1063081) b!1553017))

(assert (= (and b!1553017 (not res!1063080)) b!1553018))

(assert (=> d!161241 m!1430969))

(declare-fun m!1431121 () Bool)

(assert (=> d!161241 m!1431121))

(declare-fun m!1431123 () Bool)

(assert (=> b!1553018 m!1431123))

(assert (=> b!1552667 d!161241))

(assert (=> b!1552708 d!161069))

(assert (=> b!1552708 d!160879))

(declare-fun d!161243 () Bool)

(assert (=> d!161243 (= (get!26038 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762))) (v!21986 (getValueByKey!735 (toList!11226 lt!669115) (select (arr!49970 _keys!618) from!762))))))

(assert (=> d!160893 d!161243))

(assert (=> d!160893 d!160993))

(declare-fun d!161245 () Bool)

(assert (=> d!161245 (= (isEmpty!1139 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!809) (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!160953 d!161245))

(declare-fun d!161247 () Bool)

(declare-fun lt!669342 () Bool)

(assert (=> d!161247 (= lt!669342 (select (content!784 (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!864621 () Bool)

(assert (=> d!161247 (= lt!669342 e!864621)))

(declare-fun res!1063083 () Bool)

(assert (=> d!161247 (=> (not res!1063083) (not e!864621))))

(assert (=> d!161247 (= res!1063083 ((_ is Cons!36256) (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)))))

(assert (=> d!161247 (= (contains!10091 (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!669342)))

(declare-fun b!1553019 () Bool)

(declare-fun e!864622 () Bool)

(assert (=> b!1553019 (= e!864621 e!864622)))

(declare-fun res!1063082 () Bool)

(assert (=> b!1553019 (=> res!1063082 e!864622)))

(assert (=> b!1553019 (= res!1063082 (= (h!37702 (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1553020 () Bool)

(assert (=> b!1553020 (= e!864622 (contains!10091 (t!50968 (ite c!142970 (Cons!36256 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) Nil!36257) Nil!36257)) (select (arr!49970 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!161247 res!1063083) b!1553019))

(assert (= (and b!1553019 (not res!1063082)) b!1553020))

(declare-fun m!1431125 () Bool)

(assert (=> d!161247 m!1431125))

(assert (=> d!161247 m!1430515))

(declare-fun m!1431127 () Bool)

(assert (=> d!161247 m!1431127))

(assert (=> b!1553020 m!1430515))

(declare-fun m!1431129 () Bool)

(assert (=> b!1553020 m!1431129))

(assert (=> b!1552691 d!161247))

(declare-fun d!161249 () Bool)

(declare-fun lt!669343 () Bool)

(assert (=> d!161249 (= lt!669343 (select (content!783 lt!669170) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864623 () Bool)

(assert (=> d!161249 (= lt!669343 e!864623)))

(declare-fun res!1063085 () Bool)

(assert (=> d!161249 (=> (not res!1063085) (not e!864623))))

(assert (=> d!161249 (= res!1063085 ((_ is Cons!36255) lt!669170))))

(assert (=> d!161249 (= (contains!10090 lt!669170 (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) lt!669343)))

(declare-fun b!1553021 () Bool)

(declare-fun e!864624 () Bool)

(assert (=> b!1553021 (= e!864623 e!864624)))

(declare-fun res!1063084 () Bool)

(assert (=> b!1553021 (=> res!1063084 e!864624)))

(assert (=> b!1553021 (= res!1063084 (= (h!37701 lt!669170) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553022 () Bool)

(assert (=> b!1553022 (= e!864624 (contains!10090 (t!50967 lt!669170) (tuple2!24813 (_1!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12417 (ite (or c!142906 c!142905) (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161249 res!1063085) b!1553021))

(assert (= (and b!1553021 (not res!1063084)) b!1553022))

(declare-fun m!1431131 () Bool)

(assert (=> d!161249 m!1431131))

(declare-fun m!1431133 () Bool)

(assert (=> d!161249 m!1431133))

(declare-fun m!1431135 () Bool)

(assert (=> b!1553022 m!1431135))

(assert (=> b!1552639 d!161249))

(declare-fun d!161251 () Bool)

(assert (=> d!161251 (isDefined!551 (getValueByKey!735 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))

(declare-fun lt!669344 () Unit!51522)

(assert (=> d!161251 (= lt!669344 (choose!2048 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))

(declare-fun e!864625 () Bool)

(assert (=> d!161251 e!864625))

(declare-fun res!1063086 () Bool)

(assert (=> d!161251 (=> (not res!1063086) (not e!864625))))

(assert (=> d!161251 (= res!1063086 (isStrictlySorted!884 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))))))

(assert (=> d!161251 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118) lt!669344)))

(declare-fun b!1553023 () Bool)

(assert (=> b!1553023 (= e!864625 (containsKey!752 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118))))

(assert (= (and d!161251 res!1063086) b!1553023))

(assert (=> d!161251 m!1430465))

(assert (=> d!161251 m!1430465))

(assert (=> d!161251 m!1430467))

(declare-fun m!1431137 () Bool)

(assert (=> d!161251 m!1431137))

(declare-fun m!1431139 () Bool)

(assert (=> d!161251 m!1431139))

(assert (=> b!1553023 m!1430461))

(assert (=> b!1552545 d!161251))

(assert (=> b!1552545 d!161097))

(assert (=> b!1552545 d!161099))

(declare-fun b!1553024 () Bool)

(declare-fun res!1063087 () Bool)

(declare-fun e!864628 () Bool)

(assert (=> b!1553024 (=> (not res!1063087) (not e!864628))))

(declare-fun lt!669345 () List!36259)

(assert (=> b!1553024 (= res!1063087 (containsKey!752 lt!669345 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553025 () Bool)

(assert (=> b!1553025 (= e!864628 (contains!10090 lt!669345 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553026 () Bool)

(declare-fun e!864629 () List!36259)

(assert (=> b!1553026 (= e!864629 (insertStrictlySorted!504 (t!50967 (t!50967 (toList!11226 call!71243))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun c!143137 () Bool)

(declare-fun b!1553027 () Bool)

(declare-fun c!143135 () Bool)

(assert (=> b!1553027 (= e!864629 (ite c!143137 (t!50967 (t!50967 (toList!11226 call!71243))) (ite c!143135 (Cons!36255 (h!37701 (t!50967 (toList!11226 call!71243))) (t!50967 (t!50967 (toList!11226 call!71243)))) Nil!36256)))))

(declare-fun b!1553028 () Bool)

(declare-fun e!864627 () List!36259)

(declare-fun call!71331 () List!36259)

(assert (=> b!1553028 (= e!864627 call!71331)))

(declare-fun d!161253 () Bool)

(assert (=> d!161253 e!864628))

(declare-fun res!1063088 () Bool)

(assert (=> d!161253 (=> (not res!1063088) (not e!864628))))

(assert (=> d!161253 (= res!1063088 (isStrictlySorted!884 lt!669345))))

(declare-fun e!864626 () List!36259)

(assert (=> d!161253 (= lt!669345 e!864626)))

(declare-fun c!143134 () Bool)

(assert (=> d!161253 (= c!143134 (and ((_ is Cons!36255) (t!50967 (toList!11226 call!71243))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 call!71243)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161253 (isStrictlySorted!884 (t!50967 (toList!11226 call!71243)))))

(assert (=> d!161253 (= (insertStrictlySorted!504 (t!50967 (toList!11226 call!71243)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669345)))

(declare-fun b!1553029 () Bool)

(declare-fun e!864630 () List!36259)

(assert (=> b!1553029 (= e!864626 e!864630)))

(assert (=> b!1553029 (= c!143137 (and ((_ is Cons!36255) (t!50967 (toList!11226 call!71243))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 call!71243)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71327 () Bool)

(declare-fun call!71332 () List!36259)

(assert (=> bm!71327 (= call!71331 call!71332)))

(declare-fun b!1553030 () Bool)

(declare-fun call!71330 () List!36259)

(assert (=> b!1553030 (= e!864626 call!71330)))

(declare-fun b!1553031 () Bool)

(assert (=> b!1553031 (= e!864627 call!71331)))

(declare-fun bm!71328 () Bool)

(assert (=> bm!71328 (= call!71330 ($colon$colon!946 e!864629 (ite c!143134 (h!37701 (t!50967 (toList!11226 call!71243))) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143136 () Bool)

(assert (=> bm!71328 (= c!143136 c!143134)))

(declare-fun b!1553032 () Bool)

(assert (=> b!1553032 (= c!143135 (and ((_ is Cons!36255) (t!50967 (toList!11226 call!71243))) (bvsgt (_1!12417 (h!37701 (t!50967 (toList!11226 call!71243)))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1553032 (= e!864630 e!864627)))

(declare-fun b!1553033 () Bool)

(assert (=> b!1553033 (= e!864630 call!71332)))

(declare-fun bm!71329 () Bool)

(assert (=> bm!71329 (= call!71332 call!71330)))

(assert (= (and d!161253 c!143134) b!1553030))

(assert (= (and d!161253 (not c!143134)) b!1553029))

(assert (= (and b!1553029 c!143137) b!1553033))

(assert (= (and b!1553029 (not c!143137)) b!1553032))

(assert (= (and b!1553032 c!143135) b!1553028))

(assert (= (and b!1553032 (not c!143135)) b!1553031))

(assert (= (or b!1553028 b!1553031) bm!71327))

(assert (= (or b!1553033 bm!71327) bm!71329))

(assert (= (or b!1553030 bm!71329) bm!71328))

(assert (= (and bm!71328 c!143136) b!1553026))

(assert (= (and bm!71328 (not c!143136)) b!1553027))

(assert (= (and d!161253 res!1063088) b!1553024))

(assert (= (and b!1553024 res!1063087) b!1553025))

(declare-fun m!1431141 () Bool)

(assert (=> b!1553026 m!1431141))

(declare-fun m!1431143 () Bool)

(assert (=> bm!71328 m!1431143))

(declare-fun m!1431145 () Bool)

(assert (=> b!1553024 m!1431145))

(declare-fun m!1431147 () Bool)

(assert (=> b!1553025 m!1431147))

(declare-fun m!1431149 () Bool)

(assert (=> d!161253 m!1431149))

(assert (=> d!161253 m!1431029))

(assert (=> b!1552522 d!161253))

(declare-fun d!161255 () Bool)

(declare-fun res!1063089 () Bool)

(declare-fun e!864631 () Bool)

(assert (=> d!161255 (=> res!1063089 e!864631)))

(assert (=> d!161255 (= res!1063089 (and ((_ is Cons!36255) lt!669150) (= (_1!12417 (h!37701 lt!669150)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161255 (= (containsKey!752 lt!669150 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864631)))

(declare-fun b!1553034 () Bool)

(declare-fun e!864632 () Bool)

(assert (=> b!1553034 (= e!864631 e!864632)))

(declare-fun res!1063090 () Bool)

(assert (=> b!1553034 (=> (not res!1063090) (not e!864632))))

(assert (=> b!1553034 (= res!1063090 (and (or (not ((_ is Cons!36255) lt!669150)) (bvsle (_1!12417 (h!37701 lt!669150)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36255) lt!669150) (bvslt (_1!12417 (h!37701 lt!669150)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553035 () Bool)

(assert (=> b!1553035 (= e!864632 (containsKey!752 (t!50967 lt!669150) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161255 (not res!1063089)) b!1553034))

(assert (= (and b!1553034 res!1063090) b!1553035))

(declare-fun m!1431151 () Bool)

(assert (=> b!1553035 m!1431151))

(assert (=> b!1552713 d!161255))

(declare-fun b!1553054 () Bool)

(declare-fun e!864644 () SeekEntryResult!13516)

(declare-fun e!864647 () SeekEntryResult!13516)

(assert (=> b!1553054 (= e!864644 e!864647)))

(declare-fun c!143145 () Bool)

(declare-fun lt!669351 () (_ BitVec 64))

(assert (=> b!1553054 (= c!143145 (or (= lt!669351 (select (arr!49970 _keys!618) #b00000000000000000000000000000000)) (= (bvadd lt!669351 lt!669351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!161257 () Bool)

(declare-fun e!864646 () Bool)

(assert (=> d!161257 e!864646))

(declare-fun c!143144 () Bool)

(declare-fun lt!669350 () SeekEntryResult!13516)

(assert (=> d!161257 (= c!143144 (and ((_ is Intermediate!13516) lt!669350) (undefined!14328 lt!669350)))))

(assert (=> d!161257 (= lt!669350 e!864644)))

(declare-fun c!143146 () Bool)

(assert (=> d!161257 (= c!143146 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!161257 (= lt!669351 (select (arr!49970 _keys!618) (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926)))))

(assert (=> d!161257 (validMask!0 mask!926)))

(assert (=> d!161257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926) (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!669350)))

(declare-fun b!1553055 () Bool)

(assert (=> b!1553055 (and (bvsge (index!56464 lt!669350) #b00000000000000000000000000000000) (bvslt (index!56464 lt!669350) (size!50522 _keys!618)))))

(declare-fun res!1063097 () Bool)

(assert (=> b!1553055 (= res!1063097 (= (select (arr!49970 _keys!618) (index!56464 lt!669350)) (select (arr!49970 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun e!864643 () Bool)

(assert (=> b!1553055 (=> res!1063097 e!864643)))

(declare-fun e!864645 () Bool)

(assert (=> b!1553055 (= e!864645 e!864643)))

(declare-fun b!1553056 () Bool)

(assert (=> b!1553056 (= e!864646 (bvsge (x!139210 lt!669350) #b01111111111111111111111111111110))))

(declare-fun b!1553057 () Bool)

(assert (=> b!1553057 (= e!864644 (Intermediate!13516 true (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000))))

(declare-fun b!1553058 () Bool)

(assert (=> b!1553058 (and (bvsge (index!56464 lt!669350) #b00000000000000000000000000000000) (bvslt (index!56464 lt!669350) (size!50522 _keys!618)))))

(assert (=> b!1553058 (= e!864643 (= (select (arr!49970 _keys!618) (index!56464 lt!669350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553059 () Bool)

(assert (=> b!1553059 (= e!864646 e!864645)))

(declare-fun res!1063099 () Bool)

(assert (=> b!1553059 (= res!1063099 (and ((_ is Intermediate!13516) lt!669350) (not (undefined!14328 lt!669350)) (bvslt (x!139210 lt!669350) #b01111111111111111111111111111110) (bvsge (x!139210 lt!669350) #b00000000000000000000000000000000) (bvsge (x!139210 lt!669350) #b00000000000000000000000000000000)))))

(assert (=> b!1553059 (=> (not res!1063099) (not e!864645))))

(declare-fun b!1553060 () Bool)

(assert (=> b!1553060 (and (bvsge (index!56464 lt!669350) #b00000000000000000000000000000000) (bvslt (index!56464 lt!669350) (size!50522 _keys!618)))))

(declare-fun res!1063098 () Bool)

(assert (=> b!1553060 (= res!1063098 (= (select (arr!49970 _keys!618) (index!56464 lt!669350)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553060 (=> res!1063098 e!864643)))

(declare-fun b!1553061 () Bool)

(assert (=> b!1553061 (= e!864647 (Intermediate!13516 false (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000))))

(declare-fun b!1553062 () Bool)

(assert (=> b!1553062 (= e!864647 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000 mask!926) (select (arr!49970 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(assert (= (and d!161257 c!143146) b!1553057))

(assert (= (and d!161257 (not c!143146)) b!1553054))

(assert (= (and b!1553054 c!143145) b!1553061))

(assert (= (and b!1553054 (not c!143145)) b!1553062))

(assert (= (and d!161257 c!143144) b!1553056))

(assert (= (and d!161257 (not c!143144)) b!1553059))

(assert (= (and b!1553059 res!1063099) b!1553055))

(assert (= (and b!1553055 (not res!1063097)) b!1553060))

(assert (= (and b!1553060 (not res!1063098)) b!1553058))

(declare-fun m!1431153 () Bool)

(assert (=> b!1553058 m!1431153))

(assert (=> b!1553062 m!1430479))

(declare-fun m!1431155 () Bool)

(assert (=> b!1553062 m!1431155))

(assert (=> b!1553062 m!1431155))

(assert (=> b!1553062 m!1430233))

(declare-fun m!1431157 () Bool)

(assert (=> b!1553062 m!1431157))

(assert (=> d!161257 m!1430479))

(declare-fun m!1431159 () Bool)

(assert (=> d!161257 m!1431159))

(assert (=> d!161257 m!1430073))

(assert (=> b!1553055 m!1431153))

(assert (=> b!1553060 m!1431153))

(assert (=> d!160885 d!161257))

(declare-fun d!161259 () Bool)

(declare-fun lt!669357 () (_ BitVec 32))

(declare-fun lt!669356 () (_ BitVec 32))

(assert (=> d!161259 (= lt!669357 (bvmul (bvxor lt!669356 (bvlshr lt!669356 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!161259 (= lt!669356 ((_ extract 31 0) (bvand (bvxor (select (arr!49970 _keys!618) #b00000000000000000000000000000000) (bvlshr (select (arr!49970 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!161259 (and (bvsge mask!926 #b00000000000000000000000000000000) (let ((res!1063100 (let ((h!37706 ((_ extract 31 0) (bvand (bvxor (select (arr!49970 _keys!618) #b00000000000000000000000000000000) (bvlshr (select (arr!49970 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!139221 (bvmul (bvxor h!37706 (bvlshr h!37706 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!139221 (bvlshr x!139221 #b00000000000000000000000000001101)) mask!926))))) (and (bvslt res!1063100 (bvadd mask!926 #b00000000000000000000000000000001)) (bvsge res!1063100 #b00000000000000000000000000000000))))))

(assert (=> d!161259 (= (toIndex!0 (select (arr!49970 _keys!618) #b00000000000000000000000000000000) mask!926) (bvand (bvxor lt!669357 (bvlshr lt!669357 #b00000000000000000000000000001101)) mask!926))))

(assert (=> d!160885 d!161259))

(assert (=> d!160885 d!160829))

(declare-fun d!161261 () Bool)

(declare-fun e!864648 () Bool)

(assert (=> d!161261 e!864648))

(declare-fun res!1063101 () Bool)

(assert (=> d!161261 (=> res!1063101 e!864648)))

(declare-fun lt!669360 () Bool)

(assert (=> d!161261 (= res!1063101 (not lt!669360))))

(declare-fun lt!669358 () Bool)

(assert (=> d!161261 (= lt!669360 lt!669358)))

(declare-fun lt!669361 () Unit!51522)

(declare-fun e!864649 () Unit!51522)

(assert (=> d!161261 (= lt!669361 e!864649)))

(declare-fun c!143147 () Bool)

(assert (=> d!161261 (= c!143147 lt!669358)))

(assert (=> d!161261 (= lt!669358 (containsKey!752 (toList!11226 lt!669246) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161261 (= (contains!10087 lt!669246 #b0000000000000000000000000000000000000000000000000000000000000000) lt!669360)))

(declare-fun b!1553063 () Bool)

(declare-fun lt!669359 () Unit!51522)

(assert (=> b!1553063 (= e!864649 lt!669359)))

(assert (=> b!1553063 (= lt!669359 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669246) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553063 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669246) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553064 () Bool)

(declare-fun Unit!51548 () Unit!51522)

(assert (=> b!1553064 (= e!864649 Unit!51548)))

(declare-fun b!1553065 () Bool)

(assert (=> b!1553065 (= e!864648 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669246) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161261 c!143147) b!1553063))

(assert (= (and d!161261 (not c!143147)) b!1553064))

(assert (= (and d!161261 (not res!1063101)) b!1553065))

(declare-fun m!1431161 () Bool)

(assert (=> d!161261 m!1431161))

(declare-fun m!1431163 () Bool)

(assert (=> b!1553063 m!1431163))

(declare-fun m!1431165 () Bool)

(assert (=> b!1553063 m!1431165))

(assert (=> b!1553063 m!1431165))

(declare-fun m!1431167 () Bool)

(assert (=> b!1553063 m!1431167))

(assert (=> b!1553065 m!1431165))

(assert (=> b!1553065 m!1431165))

(assert (=> b!1553065 m!1431167))

(assert (=> d!160947 d!161261))

(assert (=> d!160947 d!160829))

(assert (=> b!1552540 d!161113))

(assert (=> b!1552540 d!160967))

(declare-fun b!1553066 () Bool)

(declare-fun res!1063102 () Bool)

(declare-fun e!864652 () Bool)

(assert (=> b!1553066 (=> (not res!1063102) (not e!864652))))

(declare-fun lt!669362 () List!36259)

(assert (=> b!1553066 (= res!1063102 (containsKey!752 lt!669362 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1553067 () Bool)

(assert (=> b!1553067 (= e!864652 (contains!10090 lt!669362 (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553068 () Bool)

(declare-fun e!864653 () List!36259)

(assert (=> b!1553068 (= e!864653 (insertStrictlySorted!504 (t!50967 (t!50967 (toList!11226 lt!669010))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun c!143149 () Bool)

(declare-fun b!1553069 () Bool)

(declare-fun c!143151 () Bool)

(assert (=> b!1553069 (= e!864653 (ite c!143151 (t!50967 (t!50967 (toList!11226 lt!669010))) (ite c!143149 (Cons!36255 (h!37701 (t!50967 (toList!11226 lt!669010))) (t!50967 (t!50967 (toList!11226 lt!669010)))) Nil!36256)))))

(declare-fun b!1553070 () Bool)

(declare-fun e!864651 () List!36259)

(declare-fun call!71334 () List!36259)

(assert (=> b!1553070 (= e!864651 call!71334)))

(declare-fun d!161263 () Bool)

(assert (=> d!161263 e!864652))

(declare-fun res!1063103 () Bool)

(assert (=> d!161263 (=> (not res!1063103) (not e!864652))))

(assert (=> d!161263 (= res!1063103 (isStrictlySorted!884 lt!669362))))

(declare-fun e!864650 () List!36259)

(assert (=> d!161263 (= lt!669362 e!864650)))

(declare-fun c!143148 () Bool)

(assert (=> d!161263 (= c!143148 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (bvslt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161263 (isStrictlySorted!884 (t!50967 (toList!11226 lt!669010)))))

(assert (=> d!161263 (= (insertStrictlySorted!504 (t!50967 (toList!11226 lt!669010)) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669362)))

(declare-fun b!1553071 () Bool)

(declare-fun e!864654 () List!36259)

(assert (=> b!1553071 (= e!864650 e!864654)))

(assert (=> b!1553071 (= c!143151 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun bm!71330 () Bool)

(declare-fun call!71335 () List!36259)

(assert (=> bm!71330 (= call!71334 call!71335)))

(declare-fun b!1553072 () Bool)

(declare-fun call!71333 () List!36259)

(assert (=> b!1553072 (= e!864650 call!71333)))

(declare-fun b!1553073 () Bool)

(assert (=> b!1553073 (= e!864651 call!71334)))

(declare-fun bm!71331 () Bool)

(assert (=> bm!71331 (= call!71333 ($colon$colon!946 e!864653 (ite c!143148 (h!37701 (t!50967 (toList!11226 lt!669010))) (tuple2!24813 (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun c!143150 () Bool)

(assert (=> bm!71331 (= c!143150 c!143148)))

(declare-fun b!1553074 () Bool)

(assert (=> b!1553074 (= c!143149 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669010))) (bvsgt (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669010)))) (_1!12417 (tuple2!24813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> b!1553074 (= e!864654 e!864651)))

(declare-fun b!1553075 () Bool)

(assert (=> b!1553075 (= e!864654 call!71335)))

(declare-fun bm!71332 () Bool)

(assert (=> bm!71332 (= call!71335 call!71333)))

(assert (= (and d!161263 c!143148) b!1553072))

(assert (= (and d!161263 (not c!143148)) b!1553071))

(assert (= (and b!1553071 c!143151) b!1553075))

(assert (= (and b!1553071 (not c!143151)) b!1553074))

(assert (= (and b!1553074 c!143149) b!1553070))

(assert (= (and b!1553074 (not c!143149)) b!1553073))

(assert (= (or b!1553070 b!1553073) bm!71330))

(assert (= (or b!1553075 bm!71330) bm!71332))

(assert (= (or b!1553072 bm!71332) bm!71331))

(assert (= (and bm!71331 c!143150) b!1553068))

(assert (= (and bm!71331 (not c!143150)) b!1553069))

(assert (= (and d!161263 res!1063103) b!1553066))

(assert (= (and b!1553066 res!1063102) b!1553067))

(declare-fun m!1431169 () Bool)

(assert (=> b!1553068 m!1431169))

(declare-fun m!1431171 () Bool)

(assert (=> bm!71331 m!1431171))

(declare-fun m!1431173 () Bool)

(assert (=> b!1553066 m!1431173))

(declare-fun m!1431175 () Bool)

(assert (=> b!1553067 m!1431175))

(declare-fun m!1431177 () Bool)

(assert (=> d!161263 m!1431177))

(assert (=> d!161263 m!1430833))

(assert (=> b!1552717 d!161263))

(declare-fun d!161265 () Bool)

(declare-fun res!1063104 () Bool)

(declare-fun e!864655 () Bool)

(assert (=> d!161265 (=> res!1063104 e!864655)))

(assert (=> d!161265 (= res!1063104 (and ((_ is Cons!36255) (toList!11226 lt!669115)) (= (_1!12417 (h!37701 (toList!11226 lt!669115))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161265 (= (containsKey!752 (toList!11226 lt!669115) #b1000000000000000000000000000000000000000000000000000000000000000) e!864655)))

(declare-fun b!1553076 () Bool)

(declare-fun e!864656 () Bool)

(assert (=> b!1553076 (= e!864655 e!864656)))

(declare-fun res!1063105 () Bool)

(assert (=> b!1553076 (=> (not res!1063105) (not e!864656))))

(assert (=> b!1553076 (= res!1063105 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669115))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669115))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36255) (toList!11226 lt!669115)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669115))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553077 () Bool)

(assert (=> b!1553077 (= e!864656 (containsKey!752 (t!50967 (toList!11226 lt!669115)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161265 (not res!1063104)) b!1553076))

(assert (= (and b!1553076 res!1063105) b!1553077))

(declare-fun m!1431179 () Bool)

(assert (=> b!1553077 m!1431179))

(assert (=> d!160955 d!161265))

(declare-fun d!161267 () Bool)

(declare-fun res!1063106 () Bool)

(declare-fun e!864657 () Bool)

(assert (=> d!161267 (=> res!1063106 e!864657)))

(assert (=> d!161267 (= res!1063106 (and ((_ is Cons!36255) (toList!11226 lt!669152)) (= (_1!12417 (h!37701 (toList!11226 lt!669152))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161267 (= (containsKey!752 (toList!11226 lt!669152) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864657)))

(declare-fun b!1553078 () Bool)

(declare-fun e!864658 () Bool)

(assert (=> b!1553078 (= e!864657 e!864658)))

(declare-fun res!1063107 () Bool)

(assert (=> b!1553078 (=> (not res!1063107) (not e!864658))))

(assert (=> b!1553078 (= res!1063107 (and (or (not ((_ is Cons!36255) (toList!11226 lt!669152))) (bvsle (_1!12417 (h!37701 (toList!11226 lt!669152))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36255) (toList!11226 lt!669152)) (bvslt (_1!12417 (h!37701 (toList!11226 lt!669152))) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553079 () Bool)

(assert (=> b!1553079 (= e!864658 (containsKey!752 (t!50967 (toList!11226 lt!669152)) (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161267 (not res!1063106)) b!1553078))

(assert (= (and b!1553078 res!1063107) b!1553079))

(declare-fun m!1431181 () Bool)

(assert (=> b!1553079 m!1431181))

(assert (=> d!160847 d!161267))

(declare-fun d!161269 () Bool)

(declare-fun e!864659 () Bool)

(assert (=> d!161269 e!864659))

(declare-fun res!1063108 () Bool)

(assert (=> d!161269 (=> res!1063108 e!864659)))

(declare-fun lt!669365 () Bool)

(assert (=> d!161269 (= res!1063108 (not lt!669365))))

(declare-fun lt!669363 () Bool)

(assert (=> d!161269 (= lt!669365 lt!669363)))

(declare-fun lt!669366 () Unit!51522)

(declare-fun e!864660 () Unit!51522)

(assert (=> d!161269 (= lt!669366 e!864660)))

(declare-fun c!143152 () Bool)

(assert (=> d!161269 (= c!143152 lt!669363)))

(assert (=> d!161269 (= lt!669363 (containsKey!752 (toList!11226 lt!669190) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161269 (= (contains!10087 lt!669190 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!669365)))

(declare-fun b!1553080 () Bool)

(declare-fun lt!669364 () Unit!51522)

(assert (=> b!1553080 (= e!864660 lt!669364)))

(assert (=> b!1553080 (= lt!669364 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669190) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1553080 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669190) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1553081 () Bool)

(declare-fun Unit!51549 () Unit!51522)

(assert (=> b!1553081 (= e!864660 Unit!51549)))

(declare-fun b!1553082 () Bool)

(assert (=> b!1553082 (= e!864659 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669190) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!161269 c!143152) b!1553080))

(assert (= (and d!161269 (not c!143152)) b!1553081))

(assert (= (and d!161269 (not res!1063108)) b!1553082))

(declare-fun m!1431183 () Bool)

(assert (=> d!161269 m!1431183))

(declare-fun m!1431185 () Bool)

(assert (=> b!1553080 m!1431185))

(assert (=> b!1553080 m!1430445))

(assert (=> b!1553080 m!1430445))

(declare-fun m!1431187 () Bool)

(assert (=> b!1553080 m!1431187))

(assert (=> b!1553082 m!1430445))

(assert (=> b!1553082 m!1430445))

(assert (=> b!1553082 m!1431187))

(assert (=> d!160871 d!161269))

(declare-fun c!143153 () Bool)

(declare-fun d!161271 () Bool)

(assert (=> d!161271 (= c!143153 (and ((_ is Cons!36255) lt!669192) (= (_1!12417 (h!37701 lt!669192)) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!864661 () Option!810)

(assert (=> d!161271 (= (getValueByKey!735 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!864661)))

(declare-fun b!1553084 () Bool)

(declare-fun e!864662 () Option!810)

(assert (=> b!1553084 (= e!864661 e!864662)))

(declare-fun c!143154 () Bool)

(assert (=> b!1553084 (= c!143154 (and ((_ is Cons!36255) lt!669192) (not (= (_1!12417 (h!37701 lt!669192)) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1553086 () Bool)

(assert (=> b!1553086 (= e!864662 None!808)))

(declare-fun b!1553083 () Bool)

(assert (=> b!1553083 (= e!864661 (Some!809 (_2!12417 (h!37701 lt!669192))))))

(declare-fun b!1553085 () Bool)

(assert (=> b!1553085 (= e!864662 (getValueByKey!735 (t!50967 lt!669192) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!161271 c!143153) b!1553083))

(assert (= (and d!161271 (not c!143153)) b!1553084))

(assert (= (and b!1553084 c!143154) b!1553085))

(assert (= (and b!1553084 (not c!143154)) b!1553086))

(declare-fun m!1431189 () Bool)

(assert (=> b!1553085 m!1431189))

(assert (=> d!160871 d!161271))

(declare-fun d!161273 () Bool)

(assert (=> d!161273 (= (getValueByKey!735 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!809 (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!669367 () Unit!51522)

(assert (=> d!161273 (= lt!669367 (choose!2046 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!864663 () Bool)

(assert (=> d!161273 e!864663))

(declare-fun res!1063109 () Bool)

(assert (=> d!161273 (=> (not res!1063109) (not e!864663))))

(assert (=> d!161273 (= res!1063109 (isStrictlySorted!884 lt!669192))))

(assert (=> d!161273 (= (lemmaContainsTupThenGetReturnValue!375 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!669367)))

(declare-fun b!1553087 () Bool)

(declare-fun res!1063110 () Bool)

(assert (=> b!1553087 (=> (not res!1063110) (not e!864663))))

(assert (=> b!1553087 (= res!1063110 (containsKey!752 lt!669192 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1553088 () Bool)

(assert (=> b!1553088 (= e!864663 (contains!10090 lt!669192 (tuple2!24813 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!161273 res!1063109) b!1553087))

(assert (= (and b!1553087 res!1063110) b!1553088))

(assert (=> d!161273 m!1430439))

(declare-fun m!1431191 () Bool)

(assert (=> d!161273 m!1431191))

(declare-fun m!1431193 () Bool)

(assert (=> d!161273 m!1431193))

(declare-fun m!1431195 () Bool)

(assert (=> b!1553087 m!1431195))

(declare-fun m!1431197 () Bool)

(assert (=> b!1553088 m!1431197))

(assert (=> d!160871 d!161273))

(declare-fun b!1553089 () Bool)

(declare-fun res!1063111 () Bool)

(declare-fun e!864666 () Bool)

(assert (=> b!1553089 (=> (not res!1063111) (not e!864666))))

(declare-fun lt!669368 () List!36259)

(assert (=> b!1553089 (= res!1063111 (containsKey!752 lt!669368 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1553090 () Bool)

(assert (=> b!1553090 (= e!864666 (contains!10090 lt!669368 (tuple2!24813 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1553091 () Bool)

(declare-fun e!864667 () List!36259)

(assert (=> b!1553091 (= e!864667 (insertStrictlySorted!504 (t!50967 (toList!11226 call!71293)) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!143156 () Bool)

(declare-fun b!1553092 () Bool)

(declare-fun c!143158 () Bool)

(assert (=> b!1553092 (= e!864667 (ite c!143158 (t!50967 (toList!11226 call!71293)) (ite c!143156 (Cons!36255 (h!37701 (toList!11226 call!71293)) (t!50967 (toList!11226 call!71293))) Nil!36256)))))

(declare-fun b!1553093 () Bool)

(declare-fun e!864665 () List!36259)

(declare-fun call!71337 () List!36259)

(assert (=> b!1553093 (= e!864665 call!71337)))

(declare-fun d!161275 () Bool)

(assert (=> d!161275 e!864666))

(declare-fun res!1063112 () Bool)

(assert (=> d!161275 (=> (not res!1063112) (not e!864666))))

(assert (=> d!161275 (= res!1063112 (isStrictlySorted!884 lt!669368))))

(declare-fun e!864664 () List!36259)

(assert (=> d!161275 (= lt!669368 e!864664)))

(declare-fun c!143155 () Bool)

(assert (=> d!161275 (= c!143155 (and ((_ is Cons!36255) (toList!11226 call!71293)) (bvslt (_1!12417 (h!37701 (toList!11226 call!71293))) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!161275 (isStrictlySorted!884 (toList!11226 call!71293))))

(assert (=> d!161275 (= (insertStrictlySorted!504 (toList!11226 call!71293) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!669368)))

(declare-fun b!1553094 () Bool)

(declare-fun e!864668 () List!36259)

(assert (=> b!1553094 (= e!864664 e!864668)))

(assert (=> b!1553094 (= c!143158 (and ((_ is Cons!36255) (toList!11226 call!71293)) (= (_1!12417 (h!37701 (toList!11226 call!71293))) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!71333 () Bool)

(declare-fun call!71338 () List!36259)

(assert (=> bm!71333 (= call!71337 call!71338)))

(declare-fun b!1553095 () Bool)

(declare-fun call!71336 () List!36259)

(assert (=> b!1553095 (= e!864664 call!71336)))

(declare-fun b!1553096 () Bool)

(assert (=> b!1553096 (= e!864665 call!71337)))

(declare-fun bm!71334 () Bool)

(assert (=> bm!71334 (= call!71336 ($colon$colon!946 e!864667 (ite c!143155 (h!37701 (toList!11226 call!71293)) (tuple2!24813 (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!143157 () Bool)

(assert (=> bm!71334 (= c!143157 c!143155)))

(declare-fun b!1553097 () Bool)

(assert (=> b!1553097 (= c!143156 (and ((_ is Cons!36255) (toList!11226 call!71293)) (bvsgt (_1!12417 (h!37701 (toList!11226 call!71293))) (_1!12417 (tuple2!24813 (select (arr!49970 _keys!618) from!762) (get!26035 (select (arr!49971 _values!470) from!762) (dynLambda!3828 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1553097 (= e!864668 e!864665)))

(declare-fun b!1553098 () Bool)

(assert (=> b!1553098 (= e!864668 call!71338)))

(declare-fun bm!71335 () Bool)

(assert (=> bm!71335 (= call!71338 call!71336)))

(assert (= (and d!161275 c!143155) b!1553095))

(assert (= (and d!161275 (not c!143155)) b!1553094))

(assert (= (and b!1553094 c!143158) b!1553098))

(assert (= (and b!1553094 (not c!143158)) b!1553097))

(assert (= (and b!1553097 c!143156) b!1553093))

(assert (= (and b!1553097 (not c!143156)) b!1553096))

(assert (= (or b!1553093 b!1553096) bm!71333))

(assert (= (or b!1553098 bm!71333) bm!71335))

(assert (= (or b!1553095 bm!71335) bm!71334))

(assert (= (and bm!71334 c!143157) b!1553091))

(assert (= (and bm!71334 (not c!143157)) b!1553092))

(assert (= (and d!161275 res!1063112) b!1553089))

(assert (= (and b!1553089 res!1063111) b!1553090))

(declare-fun m!1431199 () Bool)

(assert (=> b!1553091 m!1431199))

(declare-fun m!1431201 () Bool)

(assert (=> bm!71334 m!1431201))

(declare-fun m!1431203 () Bool)

(assert (=> b!1553089 m!1431203))

(declare-fun m!1431205 () Bool)

(assert (=> b!1553090 m!1431205))

(declare-fun m!1431207 () Bool)

(assert (=> d!161275 m!1431207))

(declare-fun m!1431209 () Bool)

(assert (=> d!161275 m!1431209))

(assert (=> d!160871 d!161275))

(assert (=> d!160959 d!160953))

(assert (=> d!160959 d!160941))

(declare-fun d!161277 () Bool)

(assert (=> d!161277 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161277 true))

(declare-fun _$12!486 () Unit!51522)

(assert (=> d!161277 (= (choose!2048 (toList!11226 lt!669012) #b1000000000000000000000000000000000000000000000000000000000000000) _$12!486)))

(declare-fun bs!44594 () Bool)

(assert (= bs!44594 d!161277))

(assert (=> bs!44594 m!1430335))

(assert (=> bs!44594 m!1430335))

(assert (=> bs!44594 m!1430337))

(assert (=> d!160959 d!161277))

(assert (=> d!160959 d!161057))

(declare-fun d!161279 () Bool)

(declare-fun res!1063113 () Bool)

(declare-fun e!864669 () Bool)

(assert (=> d!161279 (=> res!1063113 e!864669)))

(assert (=> d!161279 (= res!1063113 (and ((_ is Cons!36255) (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))) (= (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))))) lt!669118)))))

(assert (=> d!161279 (= (containsKey!752 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))) lt!669118) e!864669)))

(declare-fun b!1553099 () Bool)

(declare-fun e!864670 () Bool)

(assert (=> b!1553099 (= e!864669 e!864670)))

(declare-fun res!1063114 () Bool)

(assert (=> b!1553099 (=> (not res!1063114) (not e!864670))))

(assert (=> b!1553099 (= res!1063114 (and (or (not ((_ is Cons!36255) (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))))) (bvsle (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))))) lt!669118)) ((_ is Cons!36255) (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))) (bvslt (_1!12417 (h!37701 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117))))) lt!669118)))))

(declare-fun b!1553100 () Bool)

(assert (=> b!1553100 (= e!864670 (containsKey!752 (t!50967 (toList!11226 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)))) lt!669118))))

(assert (= (and d!161279 (not res!1063113)) b!1553099))

(assert (= (and b!1553099 res!1063114) b!1553100))

(declare-fun m!1431211 () Bool)

(assert (=> b!1553100 m!1431211))

(assert (=> d!160875 d!161279))

(assert (=> d!160877 d!160875))

(assert (=> d!160877 d!160873))

(declare-fun d!161281 () Bool)

(assert (=> d!161281 (not (contains!10087 (+!5040 lt!669116 (tuple2!24813 lt!669114 lt!669117)) lt!669118))))

(assert (=> d!161281 true))

(declare-fun _$36!385 () Unit!51522)

(assert (=> d!161281 (= (choose!2047 lt!669116 lt!669114 lt!669117 lt!669118) _$36!385)))

(declare-fun bs!44595 () Bool)

(assert (= bs!44595 d!161281))

(assert (=> bs!44595 m!1430271))

(assert (=> bs!44595 m!1430271))

(assert (=> bs!44595 m!1430273))

(assert (=> d!160877 d!161281))

(declare-fun d!161283 () Bool)

(declare-fun e!864671 () Bool)

(assert (=> d!161283 e!864671))

(declare-fun res!1063115 () Bool)

(assert (=> d!161283 (=> res!1063115 e!864671)))

(declare-fun lt!669371 () Bool)

(assert (=> d!161283 (= res!1063115 (not lt!669371))))

(declare-fun lt!669369 () Bool)

(assert (=> d!161283 (= lt!669371 lt!669369)))

(declare-fun lt!669372 () Unit!51522)

(declare-fun e!864672 () Unit!51522)

(assert (=> d!161283 (= lt!669372 e!864672)))

(declare-fun c!143159 () Bool)

(assert (=> d!161283 (= c!143159 lt!669369)))

(assert (=> d!161283 (= lt!669369 (containsKey!752 (toList!11226 lt!669116) lt!669118))))

(assert (=> d!161283 (= (contains!10087 lt!669116 lt!669118) lt!669371)))

(declare-fun b!1553102 () Bool)

(declare-fun lt!669370 () Unit!51522)

(assert (=> b!1553102 (= e!864672 lt!669370)))

(assert (=> b!1553102 (= lt!669370 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11226 lt!669116) lt!669118))))

(assert (=> b!1553102 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669116) lt!669118))))

(declare-fun b!1553103 () Bool)

(declare-fun Unit!51550 () Unit!51522)

(assert (=> b!1553103 (= e!864672 Unit!51550)))

(declare-fun b!1553104 () Bool)

(assert (=> b!1553104 (= e!864671 (isDefined!551 (getValueByKey!735 (toList!11226 lt!669116) lt!669118)))))

(assert (= (and d!161283 c!143159) b!1553102))

(assert (= (and d!161283 (not c!143159)) b!1553103))

(assert (= (and d!161283 (not res!1063115)) b!1553104))

(declare-fun m!1431213 () Bool)

(assert (=> d!161283 m!1431213))

(declare-fun m!1431215 () Bool)

(assert (=> b!1553102 m!1431215))

(declare-fun m!1431217 () Bool)

(assert (=> b!1553102 m!1431217))

(assert (=> b!1553102 m!1431217))

(declare-fun m!1431219 () Bool)

(assert (=> b!1553102 m!1431219))

(assert (=> b!1553104 m!1431217))

(assert (=> b!1553104 m!1431217))

(assert (=> b!1553104 m!1431219))

(assert (=> d!160877 d!161283))

(declare-fun d!161285 () Bool)

(assert (=> d!161285 (= (content!784 Nil!36257) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!160903 d!161285))

(declare-fun d!161287 () Bool)

(declare-fun c!143160 () Bool)

(assert (=> d!161287 (= c!143160 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!864673 () Option!810)

(assert (=> d!161287 (= (getValueByKey!735 (t!50967 (toList!11226 lt!669012)) #b0000000000000000000000000000000000000000000000000000000000000000) e!864673)))

(declare-fun b!1553106 () Bool)

(declare-fun e!864674 () Option!810)

(assert (=> b!1553106 (= e!864673 e!864674)))

(declare-fun c!143161 () Bool)

(assert (=> b!1553106 (= c!143161 (and ((_ is Cons!36255) (t!50967 (toList!11226 lt!669012))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 lt!669012)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1553108 () Bool)

(assert (=> b!1553108 (= e!864674 None!808)))

(declare-fun b!1553105 () Bool)

(assert (=> b!1553105 (= e!864673 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 lt!669012))))))))

(declare-fun b!1553107 () Bool)

(assert (=> b!1553107 (= e!864674 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 lt!669012))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161287 c!143160) b!1553105))

(assert (= (and d!161287 (not c!143160)) b!1553106))

(assert (= (and b!1553106 c!143161) b!1553107))

(assert (= (and b!1553106 (not c!143161)) b!1553108))

(declare-fun m!1431221 () Bool)

(assert (=> b!1553107 m!1431221))

(assert (=> b!1552656 d!161287))

(declare-fun d!161289 () Bool)

(declare-fun c!143162 () Bool)

(assert (=> d!161289 (= c!143162 (and ((_ is Cons!36255) (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (= (_1!12417 (h!37701 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (select (arr!49970 _keys!618) from!762))))))

(declare-fun e!864675 () Option!810)

(assert (=> d!161289 (= (getValueByKey!735 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (select (arr!49970 _keys!618) from!762)) e!864675)))

(declare-fun b!1553110 () Bool)

(declare-fun e!864676 () Option!810)

(assert (=> b!1553110 (= e!864675 e!864676)))

(declare-fun c!143163 () Bool)

(assert (=> b!1553110 (= c!143163 (and ((_ is Cons!36255) (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (not (= (_1!12417 (h!37701 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (select (arr!49970 _keys!618) from!762)))))))

(declare-fun b!1553112 () Bool)

(assert (=> b!1553112 (= e!864676 None!808)))

(declare-fun b!1553109 () Bool)

(assert (=> b!1553109 (= e!864675 (Some!809 (_2!12417 (h!37701 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))))

(declare-fun b!1553111 () Bool)

(assert (=> b!1553111 (= e!864676 (getValueByKey!735 (t!50967 (t!50967 (toList!11226 (+!5040 lt!669010 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!49970 _keys!618) from!762)))))

(assert (= (and d!161289 c!143162) b!1553109))

(assert (= (and d!161289 (not c!143162)) b!1553110))

(assert (= (and b!1553110 c!143163) b!1553111))

(assert (= (and b!1553110 (not c!143163)) b!1553112))

(assert (=> b!1553111 m!1430059))

(declare-fun m!1431223 () Bool)

(assert (=> b!1553111 m!1431223))

(assert (=> b!1552610 d!161289))

(declare-fun d!161291 () Bool)

(declare-fun lt!669373 () Bool)

(assert (=> d!161291 (= lt!669373 (select (content!783 lt!669146) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864677 () Bool)

(assert (=> d!161291 (= lt!669373 e!864677)))

(declare-fun res!1063117 () Bool)

(assert (=> d!161291 (=> (not res!1063117) (not e!864677))))

(assert (=> d!161291 (= res!1063117 ((_ is Cons!36255) lt!669146))))

(assert (=> d!161291 (= (contains!10090 lt!669146 (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669373)))

(declare-fun b!1553113 () Bool)

(declare-fun e!864678 () Bool)

(assert (=> b!1553113 (= e!864677 e!864678)))

(declare-fun res!1063116 () Bool)

(assert (=> b!1553113 (=> res!1063116 e!864678)))

(assert (=> b!1553113 (= res!1063116 (= (h!37701 lt!669146) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553114 () Bool)

(assert (=> b!1553114 (= e!864678 (contains!10090 (t!50967 lt!669146) (tuple2!24813 (_1!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12417 (tuple2!24813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161291 res!1063117) b!1553113))

(assert (= (and b!1553113 (not res!1063116)) b!1553114))

(declare-fun m!1431225 () Bool)

(assert (=> d!161291 m!1431225))

(declare-fun m!1431227 () Bool)

(assert (=> d!161291 m!1431227))

(declare-fun m!1431229 () Bool)

(assert (=> b!1553114 m!1431229))

(assert (=> b!1552620 d!161291))

(declare-fun condMapEmpty!59040 () Bool)

(declare-fun mapDefault!59040 () ValueCell!18194)

(assert (=> mapNonEmpty!59039 (= condMapEmpty!59040 (= mapRest!59039 ((as const (Array (_ BitVec 32) ValueCell!18194)) mapDefault!59040)))))

(declare-fun e!864680 () Bool)

(declare-fun mapRes!59040 () Bool)

(assert (=> mapNonEmpty!59039 (= tp!112080 (and e!864680 mapRes!59040))))

(declare-fun b!1553115 () Bool)

(declare-fun e!864679 () Bool)

(assert (=> b!1553115 (= e!864679 tp_is_empty!38209)))

(declare-fun b!1553116 () Bool)

(assert (=> b!1553116 (= e!864680 tp_is_empty!38209)))

(declare-fun mapIsEmpty!59040 () Bool)

(assert (=> mapIsEmpty!59040 mapRes!59040))

(declare-fun mapNonEmpty!59040 () Bool)

(declare-fun tp!112081 () Bool)

(assert (=> mapNonEmpty!59040 (= mapRes!59040 (and tp!112081 e!864679))))

(declare-fun mapRest!59040 () (Array (_ BitVec 32) ValueCell!18194))

(declare-fun mapKey!59040 () (_ BitVec 32))

(declare-fun mapValue!59040 () ValueCell!18194)

(assert (=> mapNonEmpty!59040 (= mapRest!59039 (store mapRest!59040 mapKey!59040 mapValue!59040))))

(assert (= (and mapNonEmpty!59039 condMapEmpty!59040) mapIsEmpty!59040))

(assert (= (and mapNonEmpty!59039 (not condMapEmpty!59040)) mapNonEmpty!59040))

(assert (= (and mapNonEmpty!59040 ((_ is ValueCellFull!18194) mapValue!59040)) b!1553115))

(assert (= (and mapNonEmpty!59039 ((_ is ValueCellFull!18194) mapDefault!59040)) b!1553116))

(declare-fun m!1431231 () Bool)

(assert (=> mapNonEmpty!59040 m!1431231))

(declare-fun b_lambda!24805 () Bool)

(assert (= b_lambda!24801 (or (and start!132256 b_free!31933) b_lambda!24805)))

(declare-fun b_lambda!24807 () Bool)

(assert (= b_lambda!24803 (or (and start!132256 b_free!31933) b_lambda!24807)))

(check-sat (not b!1552907) (not b!1552924) (not b!1552767) (not d!161083) (not b!1552802) (not d!161177) (not b!1552866) (not d!161231) (not b!1552921) (not b!1552776) (not b!1552979) (not b!1552970) (not d!161069) (not b!1552960) (not b!1552850) (not b!1552986) (not b!1553079) (not b!1553104) (not d!161253) (not d!161001) (not b_lambda!24789) (not b!1553107) (not d!161139) (not b!1552790) (not b!1553009) (not b!1552813) (not b!1552974) (not b!1552909) (not d!161247) (not d!161203) (not d!161215) (not b!1552904) (not bm!71322) (not b!1553001) (not d!161047) (not b!1553082) (not b!1552733) (not d!161129) (not d!161281) (not d!161085) (not b!1552927) (not b!1552761) (not b!1552977) (not b!1552871) b_and!51375 (not b!1552894) (not bm!71320) (not bm!71326) (not d!161113) (not b!1552824) (not b!1552936) (not b!1552788) (not b!1553091) (not b!1553026) (not bm!71315) (not d!161209) (not b!1553085) (not b!1552931) (not b!1552901) (not b!1552775) (not d!160999) (not b!1552999) (not d!161037) (not b!1552736) (not d!161193) (not b!1552946) (not b!1552854) (not d!161097) (not b!1552754) (not b!1552919) (not b!1552823) (not d!160991) (not b!1553089) (not b!1552843) (not b!1553022) (not d!161055) (not b_next!31933) (not b!1552741) (not d!161227) (not d!161137) (not d!161225) (not d!161009) (not d!161019) (not b!1553024) (not b!1552994) (not b!1553063) (not b!1552785) (not b!1552939) (not b!1552955) (not d!161067) (not b_lambda!24799) (not b!1553114) (not d!161241) (not b!1553102) (not b!1552980) (not b!1553062) (not b!1553020) (not d!161273) (not d!161275) (not b_lambda!24783) (not d!161235) (not d!161277) (not b!1552810) (not b!1552952) (not d!160989) (not b!1552908) (not b!1552922) (not b!1553035) (not b!1552864) (not b!1553014) (not b!1552982) (not d!161151) (not d!161075) (not b!1552731) (not b!1552906) (not b!1552988) (not b!1552846) (not d!161269) (not b!1552833) (not b!1552899) (not b!1552897) tp_is_empty!38209 (not b!1552837) (not b!1553080) (not bm!71331) (not b!1552934) (not d!161261) (not b!1552816) (not b!1553004) (not d!160995) (not b!1553088) (not d!161223) (not b_lambda!24805) (not b!1552743) (not b!1553068) (not bm!71324) (not b!1553067) (not b!1552967) (not b!1553100) (not b_lambda!24807) (not b!1552962) (not d!161155) (not b!1552997) (not d!161205) (not d!161027) (not b!1552958) (not b!1553111) (not d!161201) (not d!161079) (not d!161107) (not b!1552972) (not b!1552859) (not b!1553065) (not b!1552953) (not b!1552840) (not b!1552758) (not b!1553066) (not d!161119) (not b!1553018) (not b!1552832) (not b!1552821) (not d!161087) (not b!1552835) (not b!1552910) (not b!1552804) (not b!1552992) (not b!1552857) (not b!1553023) (not d!161111) (not d!161013) (not b!1553016) (not b!1552740) (not b!1552925) (not b!1552983) (not d!161159) (not bm!71317) (not d!161121) (not d!161071) (not b!1552773) (not b!1552728) (not d!161165) (not b!1552949) (not b_lambda!24791) (not b!1552943) (not d!161041) (not b!1552981) (not d!161117) (not d!161133) (not d!161251) (not b!1553002) (not b!1552964) (not b!1552929) (not d!161283) (not b!1552750) (not d!161257) (not d!161291) (not b_lambda!24797) (not b!1552845) (not d!161263) (not b!1552782) (not b!1552868) (not b!1553012) (not d!161199) (not b!1553087) (not b!1552822) (not d!161025) (not b!1552807) (not b!1552933) (not b!1552800) (not b!1552791) (not bm!71334) (not b!1552818) (not d!161145) (not b!1553090) (not b!1553025) (not b!1552739) (not d!161051) (not b!1552990) (not d!161023) (not b!1552735) (not b!1552876) (not d!161181) (not b!1552820) (not b!1552861) (not b!1552779) (not b!1552874) (not b!1552789) (not mapNonEmpty!59040) (not b!1552976) (not b!1552862) (not bm!71328) (not b!1553077) (not b!1552746) (not b!1552737) (not d!161249) (not d!161221) (not b!1552747))
(check-sat b_and!51375 (not b_next!31933))
