; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74272 () Bool)

(assert start!74272)

(declare-fun b!872768 () Bool)

(declare-fun res!592972 () Bool)

(declare-fun e!486022 () Bool)

(assert (=> b!872768 (=> (not res!592972) (not e!486022))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50505 0))(
  ( (array!50506 (arr!24279 (Array (_ BitVec 32) (_ BitVec 64))) (size!24720 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50505)

(assert (=> b!872768 (= res!592972 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24720 _keys!868))))))

(declare-fun b!872769 () Bool)

(declare-fun res!592969 () Bool)

(assert (=> b!872769 (=> (not res!592969) (not e!486022))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50505 (_ BitVec 32)) Bool)

(assert (=> b!872769 (= res!592969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592966 () Bool)

(assert (=> start!74272 (=> (not res!592966) (not e!486022))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74272 (= res!592966 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24720 _keys!868))))))

(assert (=> start!74272 e!486022))

(assert (=> start!74272 true))

(declare-fun array_inv!19222 (array!50505) Bool)

(assert (=> start!74272 (array_inv!19222 _keys!868)))

(declare-datatypes ((V!27921 0))(
  ( (V!27922 (val!8625 Int)) )
))
(declare-datatypes ((ValueCell!8138 0))(
  ( (ValueCellFull!8138 (v!11050 V!27921)) (EmptyCell!8138) )
))
(declare-datatypes ((array!50507 0))(
  ( (array!50508 (arr!24280 (Array (_ BitVec 32) ValueCell!8138)) (size!24721 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50507)

(declare-fun e!486025 () Bool)

(declare-fun array_inv!19223 (array!50507) Bool)

(assert (=> start!74272 (and (array_inv!19223 _values!688) e!486025)))

(declare-fun b!872770 () Bool)

(declare-fun e!486021 () Bool)

(declare-fun tp_is_empty!17155 () Bool)

(assert (=> b!872770 (= e!486021 tp_is_empty!17155)))

(declare-fun b!872771 () Bool)

(declare-fun res!592971 () Bool)

(assert (=> b!872771 (=> (not res!592971) (not e!486022))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872771 (= res!592971 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27332 () Bool)

(declare-fun mapRes!27332 () Bool)

(assert (=> mapIsEmpty!27332 mapRes!27332))

(declare-fun b!872772 () Bool)

(declare-fun e!486023 () Bool)

(assert (=> b!872772 (= e!486025 (and e!486023 mapRes!27332))))

(declare-fun condMapEmpty!27332 () Bool)

(declare-fun mapDefault!27332 () ValueCell!8138)

(assert (=> b!872772 (= condMapEmpty!27332 (= (arr!24280 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8138)) mapDefault!27332)))))

(declare-fun mapNonEmpty!27332 () Bool)

(declare-fun tp!52532 () Bool)

(assert (=> mapNonEmpty!27332 (= mapRes!27332 (and tp!52532 e!486021))))

(declare-fun mapValue!27332 () ValueCell!8138)

(declare-fun mapKey!27332 () (_ BitVec 32))

(declare-fun mapRest!27332 () (Array (_ BitVec 32) ValueCell!8138))

(assert (=> mapNonEmpty!27332 (= (arr!24280 _values!688) (store mapRest!27332 mapKey!27332 mapValue!27332))))

(declare-fun b!872773 () Bool)

(declare-fun res!592967 () Bool)

(assert (=> b!872773 (=> (not res!592967) (not e!486022))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872773 (= res!592967 (and (= (size!24721 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24720 _keys!868) (size!24721 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872774 () Bool)

(assert (=> b!872774 (= e!486023 tp_is_empty!17155)))

(declare-fun b!872775 () Bool)

(declare-fun res!592968 () Bool)

(assert (=> b!872775 (=> (not res!592968) (not e!486022))))

(declare-datatypes ((List!17201 0))(
  ( (Nil!17198) (Cons!17197 (h!18334 (_ BitVec 64)) (t!24230 List!17201)) )
))
(declare-fun arrayNoDuplicates!0 (array!50505 (_ BitVec 32) List!17201) Bool)

(assert (=> b!872775 (= res!592968 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17198))))

(declare-fun b!872776 () Bool)

(assert (=> b!872776 (= e!486022 (and (= (select (arr!24279 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24720 _keys!868)) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!872777 () Bool)

(declare-fun res!592970 () Bool)

(assert (=> b!872777 (=> (not res!592970) (not e!486022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872777 (= res!592970 (validMask!0 mask!1196))))

(assert (= (and start!74272 res!592966) b!872777))

(assert (= (and b!872777 res!592970) b!872773))

(assert (= (and b!872773 res!592967) b!872769))

(assert (= (and b!872769 res!592969) b!872775))

(assert (= (and b!872775 res!592968) b!872768))

(assert (= (and b!872768 res!592972) b!872771))

(assert (= (and b!872771 res!592971) b!872776))

(assert (= (and b!872772 condMapEmpty!27332) mapIsEmpty!27332))

(assert (= (and b!872772 (not condMapEmpty!27332)) mapNonEmpty!27332))

(get-info :version)

(assert (= (and mapNonEmpty!27332 ((_ is ValueCellFull!8138) mapValue!27332)) b!872770))

(assert (= (and b!872772 ((_ is ValueCellFull!8138) mapDefault!27332)) b!872774))

(assert (= start!74272 b!872772))

(declare-fun m!814223 () Bool)

(assert (=> mapNonEmpty!27332 m!814223))

(declare-fun m!814225 () Bool)

(assert (=> b!872771 m!814225))

(declare-fun m!814227 () Bool)

(assert (=> b!872769 m!814227))

(declare-fun m!814229 () Bool)

(assert (=> b!872775 m!814229))

(declare-fun m!814231 () Bool)

(assert (=> b!872776 m!814231))

(declare-fun m!814233 () Bool)

(assert (=> start!74272 m!814233))

(declare-fun m!814235 () Bool)

(assert (=> start!74272 m!814235))

(declare-fun m!814237 () Bool)

(assert (=> b!872777 m!814237))

(check-sat (not start!74272) (not b!872771) (not b!872777) (not b!872775) (not mapNonEmpty!27332) tp_is_empty!17155 (not b!872769))
(check-sat)
(get-model)

(declare-fun d!108771 () Bool)

(assert (=> d!108771 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!872771 d!108771))

(declare-fun d!108773 () Bool)

(declare-fun res!593021 () Bool)

(declare-fun e!486065 () Bool)

(assert (=> d!108773 (=> res!593021 e!486065)))

(assert (=> d!108773 (= res!593021 (bvsge #b00000000000000000000000000000000 (size!24720 _keys!868)))))

(assert (=> d!108773 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17198) e!486065)))

(declare-fun b!872848 () Bool)

(declare-fun e!486066 () Bool)

(declare-fun e!486067 () Bool)

(assert (=> b!872848 (= e!486066 e!486067)))

(declare-fun c!92671 () Bool)

(assert (=> b!872848 (= c!92671 (validKeyInArray!0 (select (arr!24279 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38504 () Bool)

(declare-fun call!38507 () Bool)

(assert (=> bm!38504 (= call!38507 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92671 (Cons!17197 (select (arr!24279 _keys!868) #b00000000000000000000000000000000) Nil!17198) Nil!17198)))))

(declare-fun b!872849 () Bool)

(assert (=> b!872849 (= e!486065 e!486066)))

(declare-fun res!593022 () Bool)

(assert (=> b!872849 (=> (not res!593022) (not e!486066))))

(declare-fun e!486064 () Bool)

(assert (=> b!872849 (= res!593022 (not e!486064))))

(declare-fun res!593023 () Bool)

(assert (=> b!872849 (=> (not res!593023) (not e!486064))))

(assert (=> b!872849 (= res!593023 (validKeyInArray!0 (select (arr!24279 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!872850 () Bool)

(assert (=> b!872850 (= e!486067 call!38507)))

(declare-fun b!872851 () Bool)

(assert (=> b!872851 (= e!486067 call!38507)))

(declare-fun b!872852 () Bool)

(declare-fun contains!4217 (List!17201 (_ BitVec 64)) Bool)

(assert (=> b!872852 (= e!486064 (contains!4217 Nil!17198 (select (arr!24279 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108773 (not res!593021)) b!872849))

(assert (= (and b!872849 res!593023) b!872852))

(assert (= (and b!872849 res!593022) b!872848))

(assert (= (and b!872848 c!92671) b!872850))

(assert (= (and b!872848 (not c!92671)) b!872851))

(assert (= (or b!872850 b!872851) bm!38504))

(declare-fun m!814271 () Bool)

(assert (=> b!872848 m!814271))

(assert (=> b!872848 m!814271))

(declare-fun m!814273 () Bool)

(assert (=> b!872848 m!814273))

(assert (=> bm!38504 m!814271))

(declare-fun m!814275 () Bool)

(assert (=> bm!38504 m!814275))

(assert (=> b!872849 m!814271))

(assert (=> b!872849 m!814271))

(assert (=> b!872849 m!814273))

(assert (=> b!872852 m!814271))

(assert (=> b!872852 m!814271))

(declare-fun m!814277 () Bool)

(assert (=> b!872852 m!814277))

(assert (=> b!872775 d!108773))

(declare-fun d!108775 () Bool)

(assert (=> d!108775 (= (array_inv!19222 _keys!868) (bvsge (size!24720 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74272 d!108775))

(declare-fun d!108777 () Bool)

(assert (=> d!108777 (= (array_inv!19223 _values!688) (bvsge (size!24721 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74272 d!108777))

(declare-fun d!108779 () Bool)

(assert (=> d!108779 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!872777 d!108779))

(declare-fun b!872861 () Bool)

(declare-fun e!486076 () Bool)

(declare-fun e!486075 () Bool)

(assert (=> b!872861 (= e!486076 e!486075)))

(declare-fun c!92674 () Bool)

(assert (=> b!872861 (= c!92674 (validKeyInArray!0 (select (arr!24279 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!872862 () Bool)

(declare-fun e!486074 () Bool)

(assert (=> b!872862 (= e!486075 e!486074)))

(declare-fun lt!395913 () (_ BitVec 64))

(assert (=> b!872862 (= lt!395913 (select (arr!24279 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!29900 0))(
  ( (Unit!29901) )
))
(declare-fun lt!395914 () Unit!29900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50505 (_ BitVec 64) (_ BitVec 32)) Unit!29900)

(assert (=> b!872862 (= lt!395914 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395913 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!872862 (arrayContainsKey!0 _keys!868 lt!395913 #b00000000000000000000000000000000)))

(declare-fun lt!395915 () Unit!29900)

(assert (=> b!872862 (= lt!395915 lt!395914)))

(declare-fun res!593028 () Bool)

(declare-datatypes ((SeekEntryResult!8700 0))(
  ( (MissingZero!8700 (index!37171 (_ BitVec 32))) (Found!8700 (index!37172 (_ BitVec 32))) (Intermediate!8700 (undefined!9512 Bool) (index!37173 (_ BitVec 32)) (x!73815 (_ BitVec 32))) (Undefined!8700) (MissingVacant!8700 (index!37174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50505 (_ BitVec 32)) SeekEntryResult!8700)

(assert (=> b!872862 (= res!593028 (= (seekEntryOrOpen!0 (select (arr!24279 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8700 #b00000000000000000000000000000000)))))

(assert (=> b!872862 (=> (not res!593028) (not e!486074))))

(declare-fun bm!38507 () Bool)

(declare-fun call!38510 () Bool)

(assert (=> bm!38507 (= call!38510 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!872863 () Bool)

(assert (=> b!872863 (= e!486075 call!38510)))

(declare-fun d!108781 () Bool)

(declare-fun res!593029 () Bool)

(assert (=> d!108781 (=> res!593029 e!486076)))

(assert (=> d!108781 (= res!593029 (bvsge #b00000000000000000000000000000000 (size!24720 _keys!868)))))

(assert (=> d!108781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!486076)))

(declare-fun b!872864 () Bool)

(assert (=> b!872864 (= e!486074 call!38510)))

(assert (= (and d!108781 (not res!593029)) b!872861))

(assert (= (and b!872861 c!92674) b!872862))

(assert (= (and b!872861 (not c!92674)) b!872863))

(assert (= (and b!872862 res!593028) b!872864))

(assert (= (or b!872864 b!872863) bm!38507))

(assert (=> b!872861 m!814271))

(assert (=> b!872861 m!814271))

(assert (=> b!872861 m!814273))

(assert (=> b!872862 m!814271))

(declare-fun m!814279 () Bool)

(assert (=> b!872862 m!814279))

(declare-fun m!814281 () Bool)

(assert (=> b!872862 m!814281))

(assert (=> b!872862 m!814271))

(declare-fun m!814283 () Bool)

(assert (=> b!872862 m!814283))

(declare-fun m!814285 () Bool)

(assert (=> bm!38507 m!814285))

(assert (=> b!872769 d!108781))

(declare-fun mapNonEmpty!27341 () Bool)

(declare-fun mapRes!27341 () Bool)

(declare-fun tp!52541 () Bool)

(declare-fun e!486082 () Bool)

(assert (=> mapNonEmpty!27341 (= mapRes!27341 (and tp!52541 e!486082))))

(declare-fun mapRest!27341 () (Array (_ BitVec 32) ValueCell!8138))

(declare-fun mapValue!27341 () ValueCell!8138)

(declare-fun mapKey!27341 () (_ BitVec 32))

(assert (=> mapNonEmpty!27341 (= mapRest!27332 (store mapRest!27341 mapKey!27341 mapValue!27341))))

(declare-fun b!872871 () Bool)

(assert (=> b!872871 (= e!486082 tp_is_empty!17155)))

(declare-fun mapIsEmpty!27341 () Bool)

(assert (=> mapIsEmpty!27341 mapRes!27341))

(declare-fun b!872872 () Bool)

(declare-fun e!486081 () Bool)

(assert (=> b!872872 (= e!486081 tp_is_empty!17155)))

(declare-fun condMapEmpty!27341 () Bool)

(declare-fun mapDefault!27341 () ValueCell!8138)

(assert (=> mapNonEmpty!27332 (= condMapEmpty!27341 (= mapRest!27332 ((as const (Array (_ BitVec 32) ValueCell!8138)) mapDefault!27341)))))

(assert (=> mapNonEmpty!27332 (= tp!52532 (and e!486081 mapRes!27341))))

(assert (= (and mapNonEmpty!27332 condMapEmpty!27341) mapIsEmpty!27341))

(assert (= (and mapNonEmpty!27332 (not condMapEmpty!27341)) mapNonEmpty!27341))

(assert (= (and mapNonEmpty!27341 ((_ is ValueCellFull!8138) mapValue!27341)) b!872871))

(assert (= (and mapNonEmpty!27332 ((_ is ValueCellFull!8138) mapDefault!27341)) b!872872))

(declare-fun m!814287 () Bool)

(assert (=> mapNonEmpty!27341 m!814287))

(check-sat (not b!872852) (not b!872849) (not b!872862) (not b!872848) (not bm!38504) (not mapNonEmpty!27341) tp_is_empty!17155 (not bm!38507) (not b!872861))
(check-sat)
