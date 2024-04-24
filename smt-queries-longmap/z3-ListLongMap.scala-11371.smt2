; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132542 () Bool)

(assert start!132542)

(declare-fun b_free!31843 () Bool)

(declare-fun b_next!31843 () Bool)

(assert (=> start!132542 (= b_free!31843 (not b_next!31843))))

(declare-fun tp!111781 () Bool)

(declare-fun b_and!51255 () Bool)

(assert (=> start!132542 (= tp!111781 b_and!51255)))

(declare-fun b!1552137 () Bool)

(declare-datatypes ((V!59269 0))(
  ( (V!59270 (val!19137 Int)) )
))
(declare-datatypes ((tuple2!24712 0))(
  ( (tuple2!24713 (_1!12367 (_ BitVec 64)) (_2!12367 V!59269)) )
))
(declare-datatypes ((List!36173 0))(
  ( (Nil!36170) (Cons!36169 (h!37632 tuple2!24712) (t!50861 List!36173)) )
))
(declare-datatypes ((ListLongMap!22329 0))(
  ( (ListLongMap!22330 (toList!11180 List!36173)) )
))
(declare-fun e!864138 () ListLongMap!22329)

(declare-fun call!70701 () ListLongMap!22329)

(assert (=> b!1552137 (= e!864138 call!70701)))

(declare-fun b!1552138 () Bool)

(declare-fun e!864147 () ListLongMap!22329)

(declare-fun call!70703 () ListLongMap!22329)

(assert (=> b!1552138 (= e!864147 call!70703)))

(declare-datatypes ((array!103562 0))(
  ( (array!103563 (arr!49976 (Array (_ BitVec 32) (_ BitVec 64))) (size!50527 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103562)

(declare-fun zeroValue!436 () V!59269)

(declare-fun bm!70697 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18149 0))(
  ( (ValueCellFull!18149 (v!21930 V!59269)) (EmptyCell!18149) )
))
(declare-datatypes ((array!103564 0))(
  ( (array!103565 (arr!49977 (Array (_ BitVec 32) ValueCell!18149)) (size!50528 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103564)

(declare-fun minValue!436 () V!59269)

(declare-fun call!70700 () ListLongMap!22329)

(declare-fun getCurrentListMapNoExtraKeys!6647 (array!103562 array!103564 (_ BitVec 32) (_ BitVec 32) V!59269 V!59269 (_ BitVec 32) Int) ListLongMap!22329)

(assert (=> bm!70697 (= call!70700 (getCurrentListMapNoExtraKeys!6647 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70698 () Bool)

(declare-fun call!70702 () ListLongMap!22329)

(assert (=> bm!70698 (= call!70702 call!70700)))

(declare-fun b!1552139 () Bool)

(declare-fun e!864150 () ListLongMap!22329)

(declare-fun call!70704 () ListLongMap!22329)

(declare-fun +!5014 (ListLongMap!22329 tuple2!24712) ListLongMap!22329)

(assert (=> b!1552139 (= e!864150 (+!5014 call!70704 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552140 () Bool)

(declare-fun res!1062527 () Bool)

(declare-fun e!864148 () Bool)

(assert (=> b!1552140 (=> (not res!1062527) (not e!864148))))

(assert (=> b!1552140 (= res!1062527 (and (= (size!50528 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50527 _keys!618) (size!50528 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70699 () Bool)

(assert (=> bm!70699 (= call!70701 call!70704)))

(declare-fun b!1552141 () Bool)

(declare-datatypes ((Unit!51550 0))(
  ( (Unit!51551) )
))
(declare-fun e!864141 () Unit!51550)

(declare-fun Unit!51552 () Unit!51550)

(assert (=> b!1552141 (= e!864141 Unit!51552)))

(declare-fun mapNonEmpty!58882 () Bool)

(declare-fun mapRes!58882 () Bool)

(declare-fun tp!111780 () Bool)

(declare-fun e!864149 () Bool)

(assert (=> mapNonEmpty!58882 (= mapRes!58882 (and tp!111780 e!864149))))

(declare-fun mapValue!58882 () ValueCell!18149)

(declare-fun mapKey!58882 () (_ BitVec 32))

(declare-fun mapRest!58882 () (Array (_ BitVec 32) ValueCell!18149))

(assert (=> mapNonEmpty!58882 (= (arr!49977 _values!470) (store mapRest!58882 mapKey!58882 mapValue!58882))))

(declare-fun b!1552142 () Bool)

(declare-fun tp_is_empty!38119 () Bool)

(assert (=> b!1552142 (= e!864149 tp_is_empty!38119)))

(declare-fun lt!668936 () ListLongMap!22329)

(declare-fun e!864139 () Bool)

(declare-fun b!1552143 () Bool)

(declare-fun apply!1092 (ListLongMap!22329 (_ BitVec 64)) V!59269)

(declare-fun get!26038 (ValueCell!18149 V!59269) V!59269)

(declare-fun dynLambda!3851 (Int (_ BitVec 64)) V!59269)

(assert (=> b!1552143 (= e!864139 (= (apply!1092 lt!668936 (select (arr!49976 _keys!618) from!762)) (get!26038 (select (arr!49977 _values!470) from!762) (dynLambda!3851 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552144 () Bool)

(declare-fun res!1062531 () Bool)

(assert (=> b!1552144 (=> (not res!1062531) (not e!864148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103562 (_ BitVec 32)) Bool)

(assert (=> b!1552144 (= res!1062531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552145 () Bool)

(declare-fun lt!668937 () Unit!51550)

(assert (=> b!1552145 (= e!864141 lt!668937)))

(declare-fun lt!668943 () ListLongMap!22329)

(assert (=> b!1552145 (= lt!668943 (getCurrentListMapNoExtraKeys!6647 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668945 () Unit!51550)

(declare-fun addStillContains!1282 (ListLongMap!22329 (_ BitVec 64) V!59269 (_ BitVec 64)) Unit!51550)

(assert (=> b!1552145 (= lt!668945 (addStillContains!1282 lt!668943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49976 _keys!618) from!762)))))

(declare-fun lt!668942 () ListLongMap!22329)

(assert (=> b!1552145 (= lt!668942 (+!5014 lt!668943 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10140 (ListLongMap!22329 (_ BitVec 64)) Bool)

(assert (=> b!1552145 (contains!10140 lt!668942 (select (arr!49976 _keys!618) from!762))))

(declare-fun addApplyDifferent!621 (ListLongMap!22329 (_ BitVec 64) V!59269 (_ BitVec 64)) Unit!51550)

(assert (=> b!1552145 (= lt!668937 (addApplyDifferent!621 lt!668943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49976 _keys!618) from!762)))))

(declare-fun lt!668944 () V!59269)

(assert (=> b!1552145 (= lt!668944 (apply!1092 (+!5014 lt!668943 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49976 _keys!618) from!762)))))

(declare-fun lt!668946 () V!59269)

(assert (=> b!1552145 (= lt!668946 (apply!1092 lt!668943 (select (arr!49976 _keys!618) from!762)))))

(assert (=> b!1552145 (= lt!668944 lt!668946)))

(declare-fun lt!668940 () Unit!51550)

(assert (=> b!1552145 (= lt!668940 (addApplyDifferent!621 lt!668943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49976 _keys!618) from!762)))))

(assert (=> b!1552145 (= (apply!1092 lt!668942 (select (arr!49976 _keys!618) from!762)) lt!668946)))

(declare-fun b!1552146 () Bool)

(assert (=> b!1552146 (= e!864150 e!864138)))

(declare-fun c!143233 () Bool)

(declare-fun lt!668938 () Bool)

(assert (=> b!1552146 (= c!143233 (and (not lt!668938) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1062529 () Bool)

(assert (=> start!132542 (=> (not res!1062529) (not e!864148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132542 (= res!1062529 (validMask!0 mask!926))))

(assert (=> start!132542 e!864148))

(declare-fun array_inv!39117 (array!103562) Bool)

(assert (=> start!132542 (array_inv!39117 _keys!618)))

(assert (=> start!132542 tp_is_empty!38119))

(assert (=> start!132542 true))

(assert (=> start!132542 tp!111781))

(declare-fun e!864146 () Bool)

(declare-fun array_inv!39118 (array!103564) Bool)

(assert (=> start!132542 (and (array_inv!39118 _values!470) e!864146)))

(declare-fun bm!70700 () Bool)

(assert (=> bm!70700 (= call!70703 call!70702)))

(declare-fun b!1552147 () Bool)

(declare-fun res!1062525 () Bool)

(declare-fun e!864145 () Bool)

(assert (=> b!1552147 (=> (not res!1062525) (not e!864145))))

(assert (=> b!1552147 (= res!1062525 (not lt!668938))))

(declare-fun b!1552148 () Bool)

(declare-fun res!1062532 () Bool)

(assert (=> b!1552148 (=> (not res!1062532) (not e!864148))))

(declare-datatypes ((List!36174 0))(
  ( (Nil!36171) (Cons!36170 (h!37633 (_ BitVec 64)) (t!50862 List!36174)) )
))
(declare-fun arrayNoDuplicates!0 (array!103562 (_ BitVec 32) List!36174) Bool)

(assert (=> b!1552148 (= res!1062532 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36171))))

(declare-fun bm!70701 () Bool)

(declare-fun c!143236 () Bool)

(assert (=> bm!70701 (= call!70704 (+!5014 (ite c!143236 call!70700 (ite c!143233 call!70702 call!70703)) (ite (or c!143236 c!143233) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552149 () Bool)

(declare-fun c!143234 () Bool)

(assert (=> b!1552149 (= c!143234 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668938))))

(assert (=> b!1552149 (= e!864138 e!864147)))

(declare-fun b!1552150 () Bool)

(assert (=> b!1552150 (= e!864148 e!864145)))

(declare-fun res!1062533 () Bool)

(assert (=> b!1552150 (=> (not res!1062533) (not e!864145))))

(declare-fun e!864143 () Bool)

(assert (=> b!1552150 (= res!1062533 e!864143)))

(declare-fun res!1062526 () Bool)

(assert (=> b!1552150 (=> res!1062526 e!864143)))

(declare-fun lt!668947 () Bool)

(assert (=> b!1552150 (= res!1062526 lt!668947)))

(declare-fun lt!668939 () Unit!51550)

(assert (=> b!1552150 (= lt!668939 e!864141)))

(declare-fun c!143235 () Bool)

(assert (=> b!1552150 (= c!143235 (not lt!668947))))

(declare-fun e!864140 () Bool)

(assert (=> b!1552150 (= lt!668947 e!864140)))

(declare-fun res!1062530 () Bool)

(assert (=> b!1552150 (=> res!1062530 e!864140)))

(assert (=> b!1552150 (= res!1062530 (bvsge from!762 (size!50527 _keys!618)))))

(assert (=> b!1552150 (= lt!668936 e!864150)))

(assert (=> b!1552150 (= c!143236 (and (not lt!668938) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552150 (= lt!668938 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552151 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552151 (= e!864140 (not (validKeyInArray!0 (select (arr!49976 _keys!618) from!762))))))

(declare-fun b!1552152 () Bool)

(assert (=> b!1552152 (= e!864147 call!70701)))

(declare-fun b!1552153 () Bool)

(declare-fun e!864144 () Bool)

(assert (=> b!1552153 (= e!864144 tp_is_empty!38119)))

(declare-fun b!1552154 () Bool)

(assert (=> b!1552154 (= e!864146 (and e!864144 mapRes!58882))))

(declare-fun condMapEmpty!58882 () Bool)

(declare-fun mapDefault!58882 () ValueCell!18149)

(assert (=> b!1552154 (= condMapEmpty!58882 (= (arr!49977 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18149)) mapDefault!58882)))))

(declare-fun b!1552155 () Bool)

(assert (=> b!1552155 (= e!864143 e!864139)))

(declare-fun res!1062524 () Bool)

(assert (=> b!1552155 (=> (not res!1062524) (not e!864139))))

(assert (=> b!1552155 (= res!1062524 (contains!10140 lt!668936 (select (arr!49976 _keys!618) from!762)))))

(declare-fun b!1552156 () Bool)

(declare-fun res!1062528 () Bool)

(assert (=> b!1552156 (=> (not res!1062528) (not e!864148))))

(assert (=> b!1552156 (= res!1062528 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50527 _keys!618))))))

(declare-fun b!1552157 () Bool)

(assert (=> b!1552157 (= e!864145 false)))

(declare-fun lt!668941 () Bool)

(assert (=> b!1552157 (= lt!668941 (contains!10140 lt!668936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!58882 () Bool)

(assert (=> mapIsEmpty!58882 mapRes!58882))

(assert (= (and start!132542 res!1062529) b!1552140))

(assert (= (and b!1552140 res!1062527) b!1552144))

(assert (= (and b!1552144 res!1062531) b!1552148))

(assert (= (and b!1552148 res!1062532) b!1552156))

(assert (= (and b!1552156 res!1062528) b!1552150))

(assert (= (and b!1552150 c!143236) b!1552139))

(assert (= (and b!1552150 (not c!143236)) b!1552146))

(assert (= (and b!1552146 c!143233) b!1552137))

(assert (= (and b!1552146 (not c!143233)) b!1552149))

(assert (= (and b!1552149 c!143234) b!1552152))

(assert (= (and b!1552149 (not c!143234)) b!1552138))

(assert (= (or b!1552152 b!1552138) bm!70700))

(assert (= (or b!1552137 bm!70700) bm!70698))

(assert (= (or b!1552137 b!1552152) bm!70699))

(assert (= (or b!1552139 bm!70698) bm!70697))

(assert (= (or b!1552139 bm!70699) bm!70701))

(assert (= (and b!1552150 (not res!1062530)) b!1552151))

(assert (= (and b!1552150 c!143235) b!1552145))

(assert (= (and b!1552150 (not c!143235)) b!1552141))

(assert (= (and b!1552150 (not res!1062526)) b!1552155))

(assert (= (and b!1552155 res!1062524) b!1552143))

(assert (= (and b!1552150 res!1062533) b!1552147))

(assert (= (and b!1552147 res!1062525) b!1552157))

(assert (= (and b!1552154 condMapEmpty!58882) mapIsEmpty!58882))

(assert (= (and b!1552154 (not condMapEmpty!58882)) mapNonEmpty!58882))

(get-info :version)

(assert (= (and mapNonEmpty!58882 ((_ is ValueCellFull!18149) mapValue!58882)) b!1552142))

(assert (= (and b!1552154 ((_ is ValueCellFull!18149) mapDefault!58882)) b!1552153))

(assert (= start!132542 b!1552154))

(declare-fun b_lambda!24737 () Bool)

(assert (=> (not b_lambda!24737) (not b!1552143)))

(declare-fun t!50860 () Bool)

(declare-fun tb!12455 () Bool)

(assert (=> (and start!132542 (= defaultEntry!478 defaultEntry!478) t!50860) tb!12455))

(declare-fun result!26029 () Bool)

(assert (=> tb!12455 (= result!26029 tp_is_empty!38119)))

(assert (=> b!1552143 t!50860))

(declare-fun b_and!51257 () Bool)

(assert (= b_and!51255 (and (=> t!50860 result!26029) b_and!51257)))

(declare-fun m!1431141 () Bool)

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431143 () Bool)

(assert (=> b!1552145 m!1431143))

(declare-fun m!1431145 () Bool)

(assert (=> b!1552145 m!1431145))

(assert (=> b!1552145 m!1431141))

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431147 () Bool)

(assert (=> b!1552145 m!1431147))

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431149 () Bool)

(assert (=> b!1552145 m!1431149))

(declare-fun m!1431151 () Bool)

(assert (=> b!1552145 m!1431151))

(assert (=> b!1552145 m!1431151))

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431153 () Bool)

(assert (=> b!1552145 m!1431153))

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431155 () Bool)

(assert (=> b!1552145 m!1431155))

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431157 () Bool)

(assert (=> b!1552145 m!1431157))

(assert (=> b!1552145 m!1431141))

(declare-fun m!1431159 () Bool)

(assert (=> b!1552145 m!1431159))

(declare-fun m!1431161 () Bool)

(assert (=> b!1552145 m!1431161))

(declare-fun m!1431163 () Bool)

(assert (=> b!1552148 m!1431163))

(declare-fun m!1431165 () Bool)

(assert (=> b!1552144 m!1431165))

(declare-fun m!1431167 () Bool)

(assert (=> mapNonEmpty!58882 m!1431167))

(declare-fun m!1431169 () Bool)

(assert (=> b!1552157 m!1431169))

(assert (=> b!1552155 m!1431141))

(assert (=> b!1552155 m!1431141))

(declare-fun m!1431171 () Bool)

(assert (=> b!1552155 m!1431171))

(declare-fun m!1431173 () Bool)

(assert (=> bm!70701 m!1431173))

(declare-fun m!1431175 () Bool)

(assert (=> b!1552139 m!1431175))

(assert (=> bm!70697 m!1431145))

(declare-fun m!1431177 () Bool)

(assert (=> start!132542 m!1431177))

(declare-fun m!1431179 () Bool)

(assert (=> start!132542 m!1431179))

(declare-fun m!1431181 () Bool)

(assert (=> start!132542 m!1431181))

(declare-fun m!1431183 () Bool)

(assert (=> b!1552143 m!1431183))

(declare-fun m!1431185 () Bool)

(assert (=> b!1552143 m!1431185))

(assert (=> b!1552143 m!1431183))

(assert (=> b!1552143 m!1431185))

(declare-fun m!1431187 () Bool)

(assert (=> b!1552143 m!1431187))

(assert (=> b!1552143 m!1431141))

(assert (=> b!1552143 m!1431141))

(declare-fun m!1431189 () Bool)

(assert (=> b!1552143 m!1431189))

(assert (=> b!1552151 m!1431141))

(assert (=> b!1552151 m!1431141))

(declare-fun m!1431191 () Bool)

(assert (=> b!1552151 m!1431191))

(check-sat (not b!1552155) tp_is_empty!38119 (not mapNonEmpty!58882) b_and!51257 (not b_lambda!24737) (not b!1552144) (not bm!70697) (not start!132542) (not b!1552143) (not b!1552139) (not b!1552148) (not b!1552145) (not bm!70701) (not b!1552151) (not b_next!31843) (not b!1552157))
(check-sat b_and!51257 (not b_next!31843))
