; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37866 () Bool)

(assert start!37866)

(declare-fun b_free!8925 () Bool)

(declare-fun b_next!8925 () Bool)

(assert (=> start!37866 (= b_free!8925 (not b_next!8925))))

(declare-fun tp!31532 () Bool)

(declare-fun b_and!16191 () Bool)

(assert (=> start!37866 (= tp!31532 b_and!16191)))

(declare-fun b!389203 () Bool)

(declare-fun res!222626 () Bool)

(declare-fun e!235804 () Bool)

(assert (=> b!389203 (=> (not res!222626) (not e!235804))))

(declare-datatypes ((array!23087 0))(
  ( (array!23088 (arr!11010 (Array (_ BitVec 32) (_ BitVec 64))) (size!11362 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23087)

(declare-datatypes ((List!6365 0))(
  ( (Nil!6362) (Cons!6361 (h!7217 (_ BitVec 64)) (t!11519 List!6365)) )
))
(declare-fun arrayNoDuplicates!0 (array!23087 (_ BitVec 32) List!6365) Bool)

(assert (=> b!389203 (= res!222626 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6362))))

(declare-fun b!389204 () Bool)

(declare-fun res!222614 () Bool)

(assert (=> b!389204 (=> (not res!222614) (not e!235804))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13901 0))(
  ( (V!13902 (val!4843 Int)) )
))
(declare-datatypes ((ValueCell!4455 0))(
  ( (ValueCellFull!4455 (v!7048 V!13901)) (EmptyCell!4455) )
))
(declare-datatypes ((array!23089 0))(
  ( (array!23090 (arr!11011 (Array (_ BitVec 32) ValueCell!4455)) (size!11363 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23089)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!389204 (= res!222614 (and (= (size!11363 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11362 _keys!658) (size!11363 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6512 0))(
  ( (tuple2!6513 (_1!3267 (_ BitVec 64)) (_2!3267 V!13901)) )
))
(declare-datatypes ((List!6366 0))(
  ( (Nil!6363) (Cons!6362 (h!7218 tuple2!6512) (t!11520 List!6366)) )
))
(declare-datatypes ((ListLongMap!5425 0))(
  ( (ListLongMap!5426 (toList!2728 List!6366)) )
))
(declare-fun lt!182917 () ListLongMap!5425)

(declare-fun lt!182914 () tuple2!6512)

(declare-fun lt!182910 () ListLongMap!5425)

(declare-fun lt!182908 () tuple2!6512)

(declare-fun b!389205 () Bool)

(declare-fun e!235806 () Bool)

(declare-fun +!1023 (ListLongMap!5425 tuple2!6512) ListLongMap!5425)

(assert (=> b!389205 (= e!235806 (= lt!182917 (+!1023 (+!1023 lt!182910 lt!182908) lt!182914)))))

(declare-fun mapNonEmpty!15966 () Bool)

(declare-fun mapRes!15966 () Bool)

(declare-fun tp!31533 () Bool)

(declare-fun e!235802 () Bool)

(assert (=> mapNonEmpty!15966 (= mapRes!15966 (and tp!31533 e!235802))))

(declare-fun mapRest!15966 () (Array (_ BitVec 32) ValueCell!4455))

(declare-fun mapValue!15966 () ValueCell!4455)

(declare-fun mapKey!15966 () (_ BitVec 32))

(assert (=> mapNonEmpty!15966 (= (arr!11011 _values!506) (store mapRest!15966 mapKey!15966 mapValue!15966))))

(declare-fun b!389206 () Bool)

(declare-fun res!222619 () Bool)

(assert (=> b!389206 (=> (not res!222619) (not e!235804))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389206 (= res!222619 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11362 _keys!658))))))

(declare-fun b!389207 () Bool)

(declare-fun tp_is_empty!9597 () Bool)

(assert (=> b!389207 (= e!235802 tp_is_empty!9597)))

(declare-fun res!222616 () Bool)

(assert (=> start!37866 (=> (not res!222616) (not e!235804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37866 (= res!222616 (validMask!0 mask!970))))

(assert (=> start!37866 e!235804))

(declare-fun e!235803 () Bool)

(declare-fun array_inv!8094 (array!23089) Bool)

(assert (=> start!37866 (and (array_inv!8094 _values!506) e!235803)))

(assert (=> start!37866 tp!31532))

(assert (=> start!37866 true))

(assert (=> start!37866 tp_is_empty!9597))

(declare-fun array_inv!8095 (array!23087) Bool)

(assert (=> start!37866 (array_inv!8095 _keys!658)))

(declare-fun b!389208 () Bool)

(declare-fun res!222620 () Bool)

(assert (=> b!389208 (=> (not res!222620) (not e!235804))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389208 (= res!222620 (validKeyInArray!0 k0!778))))

(declare-fun b!389209 () Bool)

(declare-fun e!235808 () Bool)

(assert (=> b!389209 (= e!235803 (and e!235808 mapRes!15966))))

(declare-fun condMapEmpty!15966 () Bool)

(declare-fun mapDefault!15966 () ValueCell!4455)

(assert (=> b!389209 (= condMapEmpty!15966 (= (arr!11011 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4455)) mapDefault!15966)))))

(declare-fun b!389210 () Bool)

(declare-fun res!222624 () Bool)

(declare-fun e!235805 () Bool)

(assert (=> b!389210 (=> (not res!222624) (not e!235805))))

(declare-fun lt!182913 () array!23087)

(assert (=> b!389210 (= res!222624 (arrayNoDuplicates!0 lt!182913 #b00000000000000000000000000000000 Nil!6362))))

(declare-fun b!389211 () Bool)

(declare-fun e!235801 () Bool)

(assert (=> b!389211 (= e!235805 (not e!235801))))

(declare-fun res!222622 () Bool)

(assert (=> b!389211 (=> res!222622 e!235801)))

(assert (=> b!389211 (= res!222622 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!182909 () ListLongMap!5425)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13901)

(declare-fun minValue!472 () V!13901)

(declare-fun getCurrentListMap!2077 (array!23087 array!23089 (_ BitVec 32) (_ BitVec 32) V!13901 V!13901 (_ BitVec 32) Int) ListLongMap!5425)

(assert (=> b!389211 (= lt!182909 (getCurrentListMap!2077 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182915 () array!23089)

(assert (=> b!389211 (= lt!182917 (getCurrentListMap!2077 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182911 () ListLongMap!5425)

(assert (=> b!389211 (and (= lt!182911 lt!182910) (= lt!182910 lt!182911))))

(declare-fun v!373 () V!13901)

(declare-fun lt!182912 () ListLongMap!5425)

(assert (=> b!389211 (= lt!182910 (+!1023 lt!182912 (tuple2!6513 k0!778 v!373)))))

(declare-datatypes ((Unit!11924 0))(
  ( (Unit!11925) )
))
(declare-fun lt!182916 () Unit!11924)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!241 (array!23087 array!23089 (_ BitVec 32) (_ BitVec 32) V!13901 V!13901 (_ BitVec 32) (_ BitVec 64) V!13901 (_ BitVec 32) Int) Unit!11924)

(assert (=> b!389211 (= lt!182916 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!241 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!957 (array!23087 array!23089 (_ BitVec 32) (_ BitVec 32) V!13901 V!13901 (_ BitVec 32) Int) ListLongMap!5425)

(assert (=> b!389211 (= lt!182911 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389211 (= lt!182915 (array!23090 (store (arr!11011 _values!506) i!548 (ValueCellFull!4455 v!373)) (size!11363 _values!506)))))

(assert (=> b!389211 (= lt!182912 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15966 () Bool)

(assert (=> mapIsEmpty!15966 mapRes!15966))

(declare-fun b!389212 () Bool)

(declare-fun res!222618 () Bool)

(assert (=> b!389212 (=> (not res!222618) (not e!235804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23087 (_ BitVec 32)) Bool)

(assert (=> b!389212 (= res!222618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389213 () Bool)

(assert (=> b!389213 (= e!235804 e!235805)))

(declare-fun res!222623 () Bool)

(assert (=> b!389213 (=> (not res!222623) (not e!235805))))

(assert (=> b!389213 (= res!222623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182913 mask!970))))

(assert (=> b!389213 (= lt!182913 (array!23088 (store (arr!11010 _keys!658) i!548 k0!778) (size!11362 _keys!658)))))

(declare-fun b!389214 () Bool)

(assert (=> b!389214 (= e!235808 tp_is_empty!9597)))

(declare-fun b!389215 () Bool)

(declare-fun res!222617 () Bool)

(assert (=> b!389215 (=> (not res!222617) (not e!235804))))

(assert (=> b!389215 (= res!222617 (or (= (select (arr!11010 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11010 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389216 () Bool)

(declare-fun res!222621 () Bool)

(assert (=> b!389216 (=> (not res!222621) (not e!235804))))

(declare-fun arrayContainsKey!0 (array!23087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389216 (= res!222621 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389217 () Bool)

(declare-fun res!222615 () Bool)

(assert (=> b!389217 (=> (not res!222615) (not e!235806))))

(assert (=> b!389217 (= res!222615 (= lt!182909 (+!1023 (+!1023 lt!182912 lt!182908) lt!182914)))))

(declare-fun b!389218 () Bool)

(assert (=> b!389218 (= e!235801 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389218 e!235806))

(declare-fun res!222625 () Bool)

(assert (=> b!389218 (=> (not res!222625) (not e!235806))))

(assert (=> b!389218 (= res!222625 (= lt!182917 (+!1023 (+!1023 lt!182911 lt!182908) lt!182914)))))

(assert (=> b!389218 (= lt!182914 (tuple2!6513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389218 (= lt!182908 (tuple2!6513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37866 res!222616) b!389204))

(assert (= (and b!389204 res!222614) b!389212))

(assert (= (and b!389212 res!222618) b!389203))

(assert (= (and b!389203 res!222626) b!389206))

(assert (= (and b!389206 res!222619) b!389208))

(assert (= (and b!389208 res!222620) b!389215))

(assert (= (and b!389215 res!222617) b!389216))

(assert (= (and b!389216 res!222621) b!389213))

(assert (= (and b!389213 res!222623) b!389210))

(assert (= (and b!389210 res!222624) b!389211))

(assert (= (and b!389211 (not res!222622)) b!389218))

(assert (= (and b!389218 res!222625) b!389217))

(assert (= (and b!389217 res!222615) b!389205))

(assert (= (and b!389209 condMapEmpty!15966) mapIsEmpty!15966))

(assert (= (and b!389209 (not condMapEmpty!15966)) mapNonEmpty!15966))

(get-info :version)

(assert (= (and mapNonEmpty!15966 ((_ is ValueCellFull!4455) mapValue!15966)) b!389207))

(assert (= (and b!389209 ((_ is ValueCellFull!4455) mapDefault!15966)) b!389214))

(assert (= start!37866 b!389209))

(declare-fun m!385219 () Bool)

(assert (=> mapNonEmpty!15966 m!385219))

(declare-fun m!385221 () Bool)

(assert (=> start!37866 m!385221))

(declare-fun m!385223 () Bool)

(assert (=> start!37866 m!385223))

(declare-fun m!385225 () Bool)

(assert (=> start!37866 m!385225))

(declare-fun m!385227 () Bool)

(assert (=> b!389218 m!385227))

(assert (=> b!389218 m!385227))

(declare-fun m!385229 () Bool)

(assert (=> b!389218 m!385229))

(declare-fun m!385231 () Bool)

(assert (=> b!389211 m!385231))

(declare-fun m!385233 () Bool)

(assert (=> b!389211 m!385233))

(declare-fun m!385235 () Bool)

(assert (=> b!389211 m!385235))

(declare-fun m!385237 () Bool)

(assert (=> b!389211 m!385237))

(declare-fun m!385239 () Bool)

(assert (=> b!389211 m!385239))

(declare-fun m!385241 () Bool)

(assert (=> b!389211 m!385241))

(declare-fun m!385243 () Bool)

(assert (=> b!389211 m!385243))

(declare-fun m!385245 () Bool)

(assert (=> b!389205 m!385245))

(assert (=> b!389205 m!385245))

(declare-fun m!385247 () Bool)

(assert (=> b!389205 m!385247))

(declare-fun m!385249 () Bool)

(assert (=> b!389213 m!385249))

(declare-fun m!385251 () Bool)

(assert (=> b!389213 m!385251))

(declare-fun m!385253 () Bool)

(assert (=> b!389208 m!385253))

(declare-fun m!385255 () Bool)

(assert (=> b!389216 m!385255))

(declare-fun m!385257 () Bool)

(assert (=> b!389203 m!385257))

(declare-fun m!385259 () Bool)

(assert (=> b!389210 m!385259))

(declare-fun m!385261 () Bool)

(assert (=> b!389215 m!385261))

(declare-fun m!385263 () Bool)

(assert (=> b!389217 m!385263))

(assert (=> b!389217 m!385263))

(declare-fun m!385265 () Bool)

(assert (=> b!389217 m!385265))

(declare-fun m!385267 () Bool)

(assert (=> b!389212 m!385267))

(check-sat (not b!389212) (not b!389205) (not b!389217) (not b_next!8925) (not b!389203) (not b!389210) tp_is_empty!9597 (not start!37866) b_and!16191 (not b!389213) (not b!389216) (not mapNonEmpty!15966) (not b!389218) (not b!389208) (not b!389211))
(check-sat b_and!16191 (not b_next!8925))
(get-model)

(declare-fun d!72877 () Bool)

(assert (=> d!72877 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37866 d!72877))

(declare-fun d!72879 () Bool)

(assert (=> d!72879 (= (array_inv!8094 _values!506) (bvsge (size!11363 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37866 d!72879))

(declare-fun d!72881 () Bool)

(assert (=> d!72881 (= (array_inv!8095 _keys!658) (bvsge (size!11362 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37866 d!72881))

(declare-fun d!72883 () Bool)

(declare-fun res!222670 () Bool)

(declare-fun e!235837 () Bool)

(assert (=> d!72883 (=> res!222670 e!235837)))

(assert (=> d!72883 (= res!222670 (= (select (arr!11010 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72883 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235837)))

(declare-fun b!389271 () Bool)

(declare-fun e!235838 () Bool)

(assert (=> b!389271 (= e!235837 e!235838)))

(declare-fun res!222671 () Bool)

(assert (=> b!389271 (=> (not res!222671) (not e!235838))))

(assert (=> b!389271 (= res!222671 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11362 _keys!658)))))

(declare-fun b!389272 () Bool)

(assert (=> b!389272 (= e!235838 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72883 (not res!222670)) b!389271))

(assert (= (and b!389271 res!222671) b!389272))

(declare-fun m!385319 () Bool)

(assert (=> d!72883 m!385319))

(declare-fun m!385321 () Bool)

(assert (=> b!389272 m!385321))

(assert (=> b!389216 d!72883))

(declare-fun d!72885 () Bool)

(assert (=> d!72885 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389208 d!72885))

(declare-fun d!72887 () Bool)

(declare-fun e!235841 () Bool)

(assert (=> d!72887 e!235841))

(declare-fun res!222677 () Bool)

(assert (=> d!72887 (=> (not res!222677) (not e!235841))))

(declare-fun lt!182956 () ListLongMap!5425)

(declare-fun contains!2446 (ListLongMap!5425 (_ BitVec 64)) Bool)

(assert (=> d!72887 (= res!222677 (contains!2446 lt!182956 (_1!3267 lt!182914)))))

(declare-fun lt!182959 () List!6366)

(assert (=> d!72887 (= lt!182956 (ListLongMap!5426 lt!182959))))

(declare-fun lt!182957 () Unit!11924)

(declare-fun lt!182958 () Unit!11924)

(assert (=> d!72887 (= lt!182957 lt!182958)))

(declare-datatypes ((Option!363 0))(
  ( (Some!362 (v!7053 V!13901)) (None!361) )
))
(declare-fun getValueByKey!357 (List!6366 (_ BitVec 64)) Option!363)

(assert (=> d!72887 (= (getValueByKey!357 lt!182959 (_1!3267 lt!182914)) (Some!362 (_2!3267 lt!182914)))))

(declare-fun lemmaContainsTupThenGetReturnValue!179 (List!6366 (_ BitVec 64) V!13901) Unit!11924)

(assert (=> d!72887 (= lt!182958 (lemmaContainsTupThenGetReturnValue!179 lt!182959 (_1!3267 lt!182914) (_2!3267 lt!182914)))))

(declare-fun insertStrictlySorted!182 (List!6366 (_ BitVec 64) V!13901) List!6366)

(assert (=> d!72887 (= lt!182959 (insertStrictlySorted!182 (toList!2728 (+!1023 lt!182911 lt!182908)) (_1!3267 lt!182914) (_2!3267 lt!182914)))))

(assert (=> d!72887 (= (+!1023 (+!1023 lt!182911 lt!182908) lt!182914) lt!182956)))

(declare-fun b!389277 () Bool)

(declare-fun res!222676 () Bool)

(assert (=> b!389277 (=> (not res!222676) (not e!235841))))

(assert (=> b!389277 (= res!222676 (= (getValueByKey!357 (toList!2728 lt!182956) (_1!3267 lt!182914)) (Some!362 (_2!3267 lt!182914))))))

(declare-fun b!389278 () Bool)

(declare-fun contains!2447 (List!6366 tuple2!6512) Bool)

(assert (=> b!389278 (= e!235841 (contains!2447 (toList!2728 lt!182956) lt!182914))))

(assert (= (and d!72887 res!222677) b!389277))

(assert (= (and b!389277 res!222676) b!389278))

(declare-fun m!385323 () Bool)

(assert (=> d!72887 m!385323))

(declare-fun m!385325 () Bool)

(assert (=> d!72887 m!385325))

(declare-fun m!385327 () Bool)

(assert (=> d!72887 m!385327))

(declare-fun m!385329 () Bool)

(assert (=> d!72887 m!385329))

(declare-fun m!385331 () Bool)

(assert (=> b!389277 m!385331))

(declare-fun m!385333 () Bool)

(assert (=> b!389278 m!385333))

(assert (=> b!389218 d!72887))

(declare-fun d!72889 () Bool)

(declare-fun e!235842 () Bool)

(assert (=> d!72889 e!235842))

(declare-fun res!222679 () Bool)

(assert (=> d!72889 (=> (not res!222679) (not e!235842))))

(declare-fun lt!182960 () ListLongMap!5425)

(assert (=> d!72889 (= res!222679 (contains!2446 lt!182960 (_1!3267 lt!182908)))))

(declare-fun lt!182963 () List!6366)

(assert (=> d!72889 (= lt!182960 (ListLongMap!5426 lt!182963))))

(declare-fun lt!182961 () Unit!11924)

(declare-fun lt!182962 () Unit!11924)

(assert (=> d!72889 (= lt!182961 lt!182962)))

(assert (=> d!72889 (= (getValueByKey!357 lt!182963 (_1!3267 lt!182908)) (Some!362 (_2!3267 lt!182908)))))

(assert (=> d!72889 (= lt!182962 (lemmaContainsTupThenGetReturnValue!179 lt!182963 (_1!3267 lt!182908) (_2!3267 lt!182908)))))

(assert (=> d!72889 (= lt!182963 (insertStrictlySorted!182 (toList!2728 lt!182911) (_1!3267 lt!182908) (_2!3267 lt!182908)))))

(assert (=> d!72889 (= (+!1023 lt!182911 lt!182908) lt!182960)))

(declare-fun b!389279 () Bool)

(declare-fun res!222678 () Bool)

(assert (=> b!389279 (=> (not res!222678) (not e!235842))))

(assert (=> b!389279 (= res!222678 (= (getValueByKey!357 (toList!2728 lt!182960) (_1!3267 lt!182908)) (Some!362 (_2!3267 lt!182908))))))

(declare-fun b!389280 () Bool)

(assert (=> b!389280 (= e!235842 (contains!2447 (toList!2728 lt!182960) lt!182908))))

(assert (= (and d!72889 res!222679) b!389279))

(assert (= (and b!389279 res!222678) b!389280))

(declare-fun m!385335 () Bool)

(assert (=> d!72889 m!385335))

(declare-fun m!385337 () Bool)

(assert (=> d!72889 m!385337))

(declare-fun m!385339 () Bool)

(assert (=> d!72889 m!385339))

(declare-fun m!385341 () Bool)

(assert (=> d!72889 m!385341))

(declare-fun m!385343 () Bool)

(assert (=> b!389279 m!385343))

(declare-fun m!385345 () Bool)

(assert (=> b!389280 m!385345))

(assert (=> b!389218 d!72889))

(declare-fun d!72891 () Bool)

(declare-fun e!235843 () Bool)

(assert (=> d!72891 e!235843))

(declare-fun res!222681 () Bool)

(assert (=> d!72891 (=> (not res!222681) (not e!235843))))

(declare-fun lt!182964 () ListLongMap!5425)

(assert (=> d!72891 (= res!222681 (contains!2446 lt!182964 (_1!3267 lt!182914)))))

(declare-fun lt!182967 () List!6366)

(assert (=> d!72891 (= lt!182964 (ListLongMap!5426 lt!182967))))

(declare-fun lt!182965 () Unit!11924)

(declare-fun lt!182966 () Unit!11924)

(assert (=> d!72891 (= lt!182965 lt!182966)))

(assert (=> d!72891 (= (getValueByKey!357 lt!182967 (_1!3267 lt!182914)) (Some!362 (_2!3267 lt!182914)))))

(assert (=> d!72891 (= lt!182966 (lemmaContainsTupThenGetReturnValue!179 lt!182967 (_1!3267 lt!182914) (_2!3267 lt!182914)))))

(assert (=> d!72891 (= lt!182967 (insertStrictlySorted!182 (toList!2728 (+!1023 lt!182912 lt!182908)) (_1!3267 lt!182914) (_2!3267 lt!182914)))))

(assert (=> d!72891 (= (+!1023 (+!1023 lt!182912 lt!182908) lt!182914) lt!182964)))

(declare-fun b!389281 () Bool)

(declare-fun res!222680 () Bool)

(assert (=> b!389281 (=> (not res!222680) (not e!235843))))

(assert (=> b!389281 (= res!222680 (= (getValueByKey!357 (toList!2728 lt!182964) (_1!3267 lt!182914)) (Some!362 (_2!3267 lt!182914))))))

(declare-fun b!389282 () Bool)

(assert (=> b!389282 (= e!235843 (contains!2447 (toList!2728 lt!182964) lt!182914))))

(assert (= (and d!72891 res!222681) b!389281))

(assert (= (and b!389281 res!222680) b!389282))

(declare-fun m!385347 () Bool)

(assert (=> d!72891 m!385347))

(declare-fun m!385349 () Bool)

(assert (=> d!72891 m!385349))

(declare-fun m!385351 () Bool)

(assert (=> d!72891 m!385351))

(declare-fun m!385353 () Bool)

(assert (=> d!72891 m!385353))

(declare-fun m!385355 () Bool)

(assert (=> b!389281 m!385355))

(declare-fun m!385357 () Bool)

(assert (=> b!389282 m!385357))

(assert (=> b!389217 d!72891))

(declare-fun d!72893 () Bool)

(declare-fun e!235844 () Bool)

(assert (=> d!72893 e!235844))

(declare-fun res!222683 () Bool)

(assert (=> d!72893 (=> (not res!222683) (not e!235844))))

(declare-fun lt!182968 () ListLongMap!5425)

(assert (=> d!72893 (= res!222683 (contains!2446 lt!182968 (_1!3267 lt!182908)))))

(declare-fun lt!182971 () List!6366)

(assert (=> d!72893 (= lt!182968 (ListLongMap!5426 lt!182971))))

(declare-fun lt!182969 () Unit!11924)

(declare-fun lt!182970 () Unit!11924)

(assert (=> d!72893 (= lt!182969 lt!182970)))

(assert (=> d!72893 (= (getValueByKey!357 lt!182971 (_1!3267 lt!182908)) (Some!362 (_2!3267 lt!182908)))))

(assert (=> d!72893 (= lt!182970 (lemmaContainsTupThenGetReturnValue!179 lt!182971 (_1!3267 lt!182908) (_2!3267 lt!182908)))))

(assert (=> d!72893 (= lt!182971 (insertStrictlySorted!182 (toList!2728 lt!182912) (_1!3267 lt!182908) (_2!3267 lt!182908)))))

(assert (=> d!72893 (= (+!1023 lt!182912 lt!182908) lt!182968)))

(declare-fun b!389283 () Bool)

(declare-fun res!222682 () Bool)

(assert (=> b!389283 (=> (not res!222682) (not e!235844))))

(assert (=> b!389283 (= res!222682 (= (getValueByKey!357 (toList!2728 lt!182968) (_1!3267 lt!182908)) (Some!362 (_2!3267 lt!182908))))))

(declare-fun b!389284 () Bool)

(assert (=> b!389284 (= e!235844 (contains!2447 (toList!2728 lt!182968) lt!182908))))

(assert (= (and d!72893 res!222683) b!389283))

(assert (= (and b!389283 res!222682) b!389284))

(declare-fun m!385359 () Bool)

(assert (=> d!72893 m!385359))

(declare-fun m!385361 () Bool)

(assert (=> d!72893 m!385361))

(declare-fun m!385363 () Bool)

(assert (=> d!72893 m!385363))

(declare-fun m!385365 () Bool)

(assert (=> d!72893 m!385365))

(declare-fun m!385367 () Bool)

(assert (=> b!389283 m!385367))

(declare-fun m!385369 () Bool)

(assert (=> b!389284 m!385369))

(assert (=> b!389217 d!72893))

(declare-fun d!72895 () Bool)

(declare-fun e!235845 () Bool)

(assert (=> d!72895 e!235845))

(declare-fun res!222685 () Bool)

(assert (=> d!72895 (=> (not res!222685) (not e!235845))))

(declare-fun lt!182972 () ListLongMap!5425)

(assert (=> d!72895 (= res!222685 (contains!2446 lt!182972 (_1!3267 lt!182914)))))

(declare-fun lt!182975 () List!6366)

(assert (=> d!72895 (= lt!182972 (ListLongMap!5426 lt!182975))))

(declare-fun lt!182973 () Unit!11924)

(declare-fun lt!182974 () Unit!11924)

(assert (=> d!72895 (= lt!182973 lt!182974)))

(assert (=> d!72895 (= (getValueByKey!357 lt!182975 (_1!3267 lt!182914)) (Some!362 (_2!3267 lt!182914)))))

(assert (=> d!72895 (= lt!182974 (lemmaContainsTupThenGetReturnValue!179 lt!182975 (_1!3267 lt!182914) (_2!3267 lt!182914)))))

(assert (=> d!72895 (= lt!182975 (insertStrictlySorted!182 (toList!2728 (+!1023 lt!182910 lt!182908)) (_1!3267 lt!182914) (_2!3267 lt!182914)))))

(assert (=> d!72895 (= (+!1023 (+!1023 lt!182910 lt!182908) lt!182914) lt!182972)))

(declare-fun b!389285 () Bool)

(declare-fun res!222684 () Bool)

(assert (=> b!389285 (=> (not res!222684) (not e!235845))))

(assert (=> b!389285 (= res!222684 (= (getValueByKey!357 (toList!2728 lt!182972) (_1!3267 lt!182914)) (Some!362 (_2!3267 lt!182914))))))

(declare-fun b!389286 () Bool)

(assert (=> b!389286 (= e!235845 (contains!2447 (toList!2728 lt!182972) lt!182914))))

(assert (= (and d!72895 res!222685) b!389285))

(assert (= (and b!389285 res!222684) b!389286))

(declare-fun m!385371 () Bool)

(assert (=> d!72895 m!385371))

(declare-fun m!385373 () Bool)

(assert (=> d!72895 m!385373))

(declare-fun m!385375 () Bool)

(assert (=> d!72895 m!385375))

(declare-fun m!385377 () Bool)

(assert (=> d!72895 m!385377))

(declare-fun m!385379 () Bool)

(assert (=> b!389285 m!385379))

(declare-fun m!385381 () Bool)

(assert (=> b!389286 m!385381))

(assert (=> b!389205 d!72895))

(declare-fun d!72897 () Bool)

(declare-fun e!235846 () Bool)

(assert (=> d!72897 e!235846))

(declare-fun res!222687 () Bool)

(assert (=> d!72897 (=> (not res!222687) (not e!235846))))

(declare-fun lt!182976 () ListLongMap!5425)

(assert (=> d!72897 (= res!222687 (contains!2446 lt!182976 (_1!3267 lt!182908)))))

(declare-fun lt!182979 () List!6366)

(assert (=> d!72897 (= lt!182976 (ListLongMap!5426 lt!182979))))

(declare-fun lt!182977 () Unit!11924)

(declare-fun lt!182978 () Unit!11924)

(assert (=> d!72897 (= lt!182977 lt!182978)))

(assert (=> d!72897 (= (getValueByKey!357 lt!182979 (_1!3267 lt!182908)) (Some!362 (_2!3267 lt!182908)))))

(assert (=> d!72897 (= lt!182978 (lemmaContainsTupThenGetReturnValue!179 lt!182979 (_1!3267 lt!182908) (_2!3267 lt!182908)))))

(assert (=> d!72897 (= lt!182979 (insertStrictlySorted!182 (toList!2728 lt!182910) (_1!3267 lt!182908) (_2!3267 lt!182908)))))

(assert (=> d!72897 (= (+!1023 lt!182910 lt!182908) lt!182976)))

(declare-fun b!389287 () Bool)

(declare-fun res!222686 () Bool)

(assert (=> b!389287 (=> (not res!222686) (not e!235846))))

(assert (=> b!389287 (= res!222686 (= (getValueByKey!357 (toList!2728 lt!182976) (_1!3267 lt!182908)) (Some!362 (_2!3267 lt!182908))))))

(declare-fun b!389288 () Bool)

(assert (=> b!389288 (= e!235846 (contains!2447 (toList!2728 lt!182976) lt!182908))))

(assert (= (and d!72897 res!222687) b!389287))

(assert (= (and b!389287 res!222686) b!389288))

(declare-fun m!385383 () Bool)

(assert (=> d!72897 m!385383))

(declare-fun m!385385 () Bool)

(assert (=> d!72897 m!385385))

(declare-fun m!385387 () Bool)

(assert (=> d!72897 m!385387))

(declare-fun m!385389 () Bool)

(assert (=> d!72897 m!385389))

(declare-fun m!385391 () Bool)

(assert (=> b!389287 m!385391))

(declare-fun m!385393 () Bool)

(assert (=> b!389288 m!385393))

(assert (=> b!389205 d!72897))

(declare-fun b!389297 () Bool)

(declare-fun e!235853 () Bool)

(declare-fun call!27403 () Bool)

(assert (=> b!389297 (= e!235853 call!27403)))

(declare-fun b!389298 () Bool)

(declare-fun e!235855 () Bool)

(declare-fun e!235854 () Bool)

(assert (=> b!389298 (= e!235855 e!235854)))

(declare-fun c!54029 () Bool)

(assert (=> b!389298 (= c!54029 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389299 () Bool)

(assert (=> b!389299 (= e!235854 e!235853)))

(declare-fun lt!182988 () (_ BitVec 64))

(assert (=> b!389299 (= lt!182988 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!182987 () Unit!11924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23087 (_ BitVec 64) (_ BitVec 32)) Unit!11924)

(assert (=> b!389299 (= lt!182987 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182913 lt!182988 #b00000000000000000000000000000000))))

(assert (=> b!389299 (arrayContainsKey!0 lt!182913 lt!182988 #b00000000000000000000000000000000)))

(declare-fun lt!182986 () Unit!11924)

(assert (=> b!389299 (= lt!182986 lt!182987)))

(declare-fun res!222693 () Bool)

(declare-datatypes ((SeekEntryResult!3510 0))(
  ( (MissingZero!3510 (index!16219 (_ BitVec 32))) (Found!3510 (index!16220 (_ BitVec 32))) (Intermediate!3510 (undefined!4322 Bool) (index!16221 (_ BitVec 32)) (x!38229 (_ BitVec 32))) (Undefined!3510) (MissingVacant!3510 (index!16222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23087 (_ BitVec 32)) SeekEntryResult!3510)

(assert (=> b!389299 (= res!222693 (= (seekEntryOrOpen!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000) lt!182913 mask!970) (Found!3510 #b00000000000000000000000000000000)))))

(assert (=> b!389299 (=> (not res!222693) (not e!235853))))

(declare-fun d!72899 () Bool)

(declare-fun res!222692 () Bool)

(assert (=> d!72899 (=> res!222692 e!235855)))

(assert (=> d!72899 (= res!222692 (bvsge #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(assert (=> d!72899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182913 mask!970) e!235855)))

(declare-fun bm!27400 () Bool)

(assert (=> bm!27400 (= call!27403 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182913 mask!970))))

(declare-fun b!389300 () Bool)

(assert (=> b!389300 (= e!235854 call!27403)))

(assert (= (and d!72899 (not res!222692)) b!389298))

(assert (= (and b!389298 c!54029) b!389299))

(assert (= (and b!389298 (not c!54029)) b!389300))

(assert (= (and b!389299 res!222693) b!389297))

(assert (= (or b!389297 b!389300) bm!27400))

(declare-fun m!385395 () Bool)

(assert (=> b!389298 m!385395))

(assert (=> b!389298 m!385395))

(declare-fun m!385397 () Bool)

(assert (=> b!389298 m!385397))

(assert (=> b!389299 m!385395))

(declare-fun m!385399 () Bool)

(assert (=> b!389299 m!385399))

(declare-fun m!385401 () Bool)

(assert (=> b!389299 m!385401))

(assert (=> b!389299 m!385395))

(declare-fun m!385403 () Bool)

(assert (=> b!389299 m!385403))

(declare-fun m!385405 () Bool)

(assert (=> bm!27400 m!385405))

(assert (=> b!389213 d!72899))

(declare-fun b!389311 () Bool)

(declare-fun e!235867 () Bool)

(declare-fun call!27406 () Bool)

(assert (=> b!389311 (= e!235867 call!27406)))

(declare-fun d!72901 () Bool)

(declare-fun res!222700 () Bool)

(declare-fun e!235865 () Bool)

(assert (=> d!72901 (=> res!222700 e!235865)))

(assert (=> d!72901 (= res!222700 (bvsge #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(assert (=> d!72901 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6362) e!235865)))

(declare-fun b!389312 () Bool)

(declare-fun e!235866 () Bool)

(assert (=> b!389312 (= e!235866 e!235867)))

(declare-fun c!54032 () Bool)

(assert (=> b!389312 (= c!54032 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27403 () Bool)

(assert (=> bm!27403 (= call!27406 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54032 (Cons!6361 (select (arr!11010 _keys!658) #b00000000000000000000000000000000) Nil!6362) Nil!6362)))))

(declare-fun b!389313 () Bool)

(declare-fun e!235864 () Bool)

(declare-fun contains!2448 (List!6365 (_ BitVec 64)) Bool)

(assert (=> b!389313 (= e!235864 (contains!2448 Nil!6362 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389314 () Bool)

(assert (=> b!389314 (= e!235867 call!27406)))

(declare-fun b!389315 () Bool)

(assert (=> b!389315 (= e!235865 e!235866)))

(declare-fun res!222702 () Bool)

(assert (=> b!389315 (=> (not res!222702) (not e!235866))))

(assert (=> b!389315 (= res!222702 (not e!235864))))

(declare-fun res!222701 () Bool)

(assert (=> b!389315 (=> (not res!222701) (not e!235864))))

(assert (=> b!389315 (= res!222701 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72901 (not res!222700)) b!389315))

(assert (= (and b!389315 res!222701) b!389313))

(assert (= (and b!389315 res!222702) b!389312))

(assert (= (and b!389312 c!54032) b!389314))

(assert (= (and b!389312 (not c!54032)) b!389311))

(assert (= (or b!389314 b!389311) bm!27403))

(assert (=> b!389312 m!385319))

(assert (=> b!389312 m!385319))

(declare-fun m!385407 () Bool)

(assert (=> b!389312 m!385407))

(assert (=> bm!27403 m!385319))

(declare-fun m!385409 () Bool)

(assert (=> bm!27403 m!385409))

(assert (=> b!389313 m!385319))

(assert (=> b!389313 m!385319))

(declare-fun m!385411 () Bool)

(assert (=> b!389313 m!385411))

(assert (=> b!389315 m!385319))

(assert (=> b!389315 m!385319))

(assert (=> b!389315 m!385407))

(assert (=> b!389203 d!72901))

(declare-fun b!389316 () Bool)

(declare-fun e!235868 () Bool)

(declare-fun call!27407 () Bool)

(assert (=> b!389316 (= e!235868 call!27407)))

(declare-fun b!389317 () Bool)

(declare-fun e!235870 () Bool)

(declare-fun e!235869 () Bool)

(assert (=> b!389317 (= e!235870 e!235869)))

(declare-fun c!54033 () Bool)

(assert (=> b!389317 (= c!54033 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389318 () Bool)

(assert (=> b!389318 (= e!235869 e!235868)))

(declare-fun lt!182991 () (_ BitVec 64))

(assert (=> b!389318 (= lt!182991 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182990 () Unit!11924)

(assert (=> b!389318 (= lt!182990 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182991 #b00000000000000000000000000000000))))

(assert (=> b!389318 (arrayContainsKey!0 _keys!658 lt!182991 #b00000000000000000000000000000000)))

(declare-fun lt!182989 () Unit!11924)

(assert (=> b!389318 (= lt!182989 lt!182990)))

(declare-fun res!222704 () Bool)

(assert (=> b!389318 (= res!222704 (= (seekEntryOrOpen!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3510 #b00000000000000000000000000000000)))))

(assert (=> b!389318 (=> (not res!222704) (not e!235868))))

(declare-fun d!72903 () Bool)

(declare-fun res!222703 () Bool)

(assert (=> d!72903 (=> res!222703 e!235870)))

(assert (=> d!72903 (= res!222703 (bvsge #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(assert (=> d!72903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235870)))

(declare-fun bm!27404 () Bool)

(assert (=> bm!27404 (= call!27407 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!389319 () Bool)

(assert (=> b!389319 (= e!235869 call!27407)))

(assert (= (and d!72903 (not res!222703)) b!389317))

(assert (= (and b!389317 c!54033) b!389318))

(assert (= (and b!389317 (not c!54033)) b!389319))

(assert (= (and b!389318 res!222704) b!389316))

(assert (= (or b!389316 b!389319) bm!27404))

(assert (=> b!389317 m!385319))

(assert (=> b!389317 m!385319))

(assert (=> b!389317 m!385407))

(assert (=> b!389318 m!385319))

(declare-fun m!385413 () Bool)

(assert (=> b!389318 m!385413))

(declare-fun m!385415 () Bool)

(assert (=> b!389318 m!385415))

(assert (=> b!389318 m!385319))

(declare-fun m!385417 () Bool)

(assert (=> b!389318 m!385417))

(declare-fun m!385419 () Bool)

(assert (=> bm!27404 m!385419))

(assert (=> b!389212 d!72903))

(declare-fun b!389344 () Bool)

(declare-fun e!235890 () Bool)

(declare-fun e!235886 () Bool)

(assert (=> b!389344 (= e!235890 e!235886)))

(declare-fun c!54042 () Bool)

(assert (=> b!389344 (= c!54042 (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(declare-fun d!72905 () Bool)

(declare-fun e!235889 () Bool)

(assert (=> d!72905 e!235889))

(declare-fun res!222716 () Bool)

(assert (=> d!72905 (=> (not res!222716) (not e!235889))))

(declare-fun lt!183011 () ListLongMap!5425)

(assert (=> d!72905 (= res!222716 (not (contains!2446 lt!183011 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235891 () ListLongMap!5425)

(assert (=> d!72905 (= lt!183011 e!235891)))

(declare-fun c!54043 () Bool)

(assert (=> d!72905 (= c!54043 (bvsge #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(assert (=> d!72905 (validMask!0 mask!970)))

(assert (=> d!72905 (= (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183011)))

(declare-fun b!389345 () Bool)

(declare-fun lt!183012 () Unit!11924)

(declare-fun lt!183007 () Unit!11924)

(assert (=> b!389345 (= lt!183012 lt!183007)))

(declare-fun lt!183008 () V!13901)

(declare-fun lt!183006 () ListLongMap!5425)

(declare-fun lt!183010 () (_ BitVec 64))

(declare-fun lt!183009 () (_ BitVec 64))

(assert (=> b!389345 (not (contains!2446 (+!1023 lt!183006 (tuple2!6513 lt!183010 lt!183008)) lt!183009))))

(declare-fun addStillNotContains!132 (ListLongMap!5425 (_ BitVec 64) V!13901 (_ BitVec 64)) Unit!11924)

(assert (=> b!389345 (= lt!183007 (addStillNotContains!132 lt!183006 lt!183010 lt!183008 lt!183009))))

(assert (=> b!389345 (= lt!183009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5571 (ValueCell!4455 V!13901) V!13901)

(declare-fun dynLambda!642 (Int (_ BitVec 64)) V!13901)

(assert (=> b!389345 (= lt!183008 (get!5571 (select (arr!11011 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389345 (= lt!183010 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27410 () ListLongMap!5425)

(assert (=> b!389345 (= lt!183006 call!27410)))

(declare-fun e!235887 () ListLongMap!5425)

(assert (=> b!389345 (= e!235887 (+!1023 call!27410 (tuple2!6513 (select (arr!11010 _keys!658) #b00000000000000000000000000000000) (get!5571 (select (arr!11011 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389346 () Bool)

(assert (=> b!389346 (= e!235886 (= lt!183011 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27407 () Bool)

(assert (=> bm!27407 (= call!27410 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389347 () Bool)

(assert (=> b!389347 (= e!235889 e!235890)))

(declare-fun c!54045 () Bool)

(declare-fun e!235885 () Bool)

(assert (=> b!389347 (= c!54045 e!235885)))

(declare-fun res!222713 () Bool)

(assert (=> b!389347 (=> (not res!222713) (not e!235885))))

(assert (=> b!389347 (= res!222713 (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(declare-fun b!389348 () Bool)

(assert (=> b!389348 (= e!235891 e!235887)))

(declare-fun c!54044 () Bool)

(assert (=> b!389348 (= c!54044 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389349 () Bool)

(declare-fun isEmpty!545 (ListLongMap!5425) Bool)

(assert (=> b!389349 (= e!235886 (isEmpty!545 lt!183011))))

(declare-fun b!389350 () Bool)

(assert (=> b!389350 (= e!235885 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389350 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389351 () Bool)

(assert (=> b!389351 (= e!235887 call!27410)))

(declare-fun b!389352 () Bool)

(declare-fun e!235888 () Bool)

(assert (=> b!389352 (= e!235890 e!235888)))

(assert (=> b!389352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(declare-fun res!222715 () Bool)

(assert (=> b!389352 (= res!222715 (contains!2446 lt!183011 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389352 (=> (not res!222715) (not e!235888))))

(declare-fun b!389353 () Bool)

(assert (=> b!389353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(assert (=> b!389353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _values!506)))))

(declare-fun apply!299 (ListLongMap!5425 (_ BitVec 64)) V!13901)

(assert (=> b!389353 (= e!235888 (= (apply!299 lt!183011 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)) (get!5571 (select (arr!11011 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389354 () Bool)

(declare-fun res!222714 () Bool)

(assert (=> b!389354 (=> (not res!222714) (not e!235889))))

(assert (=> b!389354 (= res!222714 (not (contains!2446 lt!183011 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389355 () Bool)

(assert (=> b!389355 (= e!235891 (ListLongMap!5426 Nil!6363))))

(assert (= (and d!72905 c!54043) b!389355))

(assert (= (and d!72905 (not c!54043)) b!389348))

(assert (= (and b!389348 c!54044) b!389345))

(assert (= (and b!389348 (not c!54044)) b!389351))

(assert (= (or b!389345 b!389351) bm!27407))

(assert (= (and d!72905 res!222716) b!389354))

(assert (= (and b!389354 res!222714) b!389347))

(assert (= (and b!389347 res!222713) b!389350))

(assert (= (and b!389347 c!54045) b!389352))

(assert (= (and b!389347 (not c!54045)) b!389344))

(assert (= (and b!389352 res!222715) b!389353))

(assert (= (and b!389344 c!54042) b!389346))

(assert (= (and b!389344 (not c!54042)) b!389349))

(declare-fun b_lambda!8575 () Bool)

(assert (=> (not b_lambda!8575) (not b!389345)))

(declare-fun t!11524 () Bool)

(declare-fun tb!3113 () Bool)

(assert (=> (and start!37866 (= defaultEntry!514 defaultEntry!514) t!11524) tb!3113))

(declare-fun result!5719 () Bool)

(assert (=> tb!3113 (= result!5719 tp_is_empty!9597)))

(assert (=> b!389345 t!11524))

(declare-fun b_and!16195 () Bool)

(assert (= b_and!16191 (and (=> t!11524 result!5719) b_and!16195)))

(declare-fun b_lambda!8577 () Bool)

(assert (=> (not b_lambda!8577) (not b!389353)))

(assert (=> b!389353 t!11524))

(declare-fun b_and!16197 () Bool)

(assert (= b_and!16195 (and (=> t!11524 result!5719) b_and!16197)))

(declare-fun m!385421 () Bool)

(assert (=> d!72905 m!385421))

(assert (=> d!72905 m!385221))

(assert (=> b!389350 m!385319))

(assert (=> b!389350 m!385319))

(assert (=> b!389350 m!385407))

(declare-fun m!385423 () Bool)

(assert (=> bm!27407 m!385423))

(assert (=> b!389348 m!385319))

(assert (=> b!389348 m!385319))

(assert (=> b!389348 m!385407))

(assert (=> b!389346 m!385423))

(declare-fun m!385425 () Bool)

(assert (=> b!389345 m!385425))

(declare-fun m!385427 () Bool)

(assert (=> b!389345 m!385427))

(declare-fun m!385429 () Bool)

(assert (=> b!389345 m!385429))

(assert (=> b!389345 m!385427))

(assert (=> b!389345 m!385429))

(declare-fun m!385431 () Bool)

(assert (=> b!389345 m!385431))

(assert (=> b!389345 m!385319))

(declare-fun m!385433 () Bool)

(assert (=> b!389345 m!385433))

(assert (=> b!389345 m!385433))

(declare-fun m!385435 () Bool)

(assert (=> b!389345 m!385435))

(declare-fun m!385437 () Bool)

(assert (=> b!389345 m!385437))

(assert (=> b!389352 m!385319))

(assert (=> b!389352 m!385319))

(declare-fun m!385439 () Bool)

(assert (=> b!389352 m!385439))

(declare-fun m!385441 () Bool)

(assert (=> b!389349 m!385441))

(declare-fun m!385443 () Bool)

(assert (=> b!389354 m!385443))

(assert (=> b!389353 m!385427))

(assert (=> b!389353 m!385429))

(assert (=> b!389353 m!385319))

(declare-fun m!385445 () Bool)

(assert (=> b!389353 m!385445))

(assert (=> b!389353 m!385427))

(assert (=> b!389353 m!385429))

(assert (=> b!389353 m!385431))

(assert (=> b!389353 m!385319))

(assert (=> b!389211 d!72905))

(declare-fun bm!27422 () Bool)

(declare-fun call!27426 () ListLongMap!5425)

(assert (=> bm!27422 (= call!27426 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389401 () Bool)

(declare-fun e!235927 () Bool)

(declare-fun lt!183074 () ListLongMap!5425)

(assert (=> b!389401 (= e!235927 (= (apply!299 lt!183074 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389402 () Bool)

(declare-fun res!222740 () Bool)

(declare-fun e!235920 () Bool)

(assert (=> b!389402 (=> (not res!222740) (not e!235920))))

(declare-fun e!235929 () Bool)

(assert (=> b!389402 (= res!222740 e!235929)))

(declare-fun res!222735 () Bool)

(assert (=> b!389402 (=> res!222735 e!235929)))

(declare-fun e!235930 () Bool)

(assert (=> b!389402 (= res!222735 (not e!235930))))

(declare-fun res!222743 () Bool)

(assert (=> b!389402 (=> (not res!222743) (not e!235930))))

(assert (=> b!389402 (= res!222743 (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(declare-fun b!389403 () Bool)

(declare-fun c!54060 () Bool)

(assert (=> b!389403 (= c!54060 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235928 () ListLongMap!5425)

(declare-fun e!235921 () ListLongMap!5425)

(assert (=> b!389403 (= e!235928 e!235921)))

(declare-fun bm!27423 () Bool)

(declare-fun call!27430 () Bool)

(assert (=> bm!27423 (= call!27430 (contains!2446 lt!183074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389404 () Bool)

(declare-fun e!235925 () Bool)

(assert (=> b!389404 (= e!235925 (not call!27430))))

(declare-fun call!27431 () ListLongMap!5425)

(declare-fun bm!27424 () Bool)

(declare-fun c!54059 () Bool)

(declare-fun call!27429 () ListLongMap!5425)

(declare-fun call!27427 () ListLongMap!5425)

(declare-fun c!54063 () Bool)

(assert (=> bm!27424 (= call!27431 (+!1023 (ite c!54059 call!27426 (ite c!54063 call!27427 call!27429)) (ite (or c!54059 c!54063) (tuple2!6513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun e!235924 () Bool)

(declare-fun b!389405 () Bool)

(assert (=> b!389405 (= e!235924 (= (apply!299 lt!183074 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)) (get!5571 (select (arr!11011 _values!506) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389405 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 _values!506)))))

(assert (=> b!389405 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(declare-fun b!389406 () Bool)

(declare-fun e!235922 () Bool)

(declare-fun e!235923 () Bool)

(assert (=> b!389406 (= e!235922 e!235923)))

(declare-fun res!222737 () Bool)

(declare-fun call!27425 () Bool)

(assert (=> b!389406 (= res!222737 call!27425)))

(assert (=> b!389406 (=> (not res!222737) (not e!235923))))

(declare-fun b!389407 () Bool)

(assert (=> b!389407 (= e!235923 (= (apply!299 lt!183074 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389408 () Bool)

(declare-fun e!235919 () ListLongMap!5425)

(assert (=> b!389408 (= e!235919 e!235928)))

(assert (=> b!389408 (= c!54063 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389409 () Bool)

(assert (=> b!389409 (= e!235925 e!235927)))

(declare-fun res!222739 () Bool)

(assert (=> b!389409 (= res!222739 call!27430)))

(assert (=> b!389409 (=> (not res!222739) (not e!235927))))

(declare-fun b!389410 () Bool)

(declare-fun e!235926 () Unit!11924)

(declare-fun Unit!11928 () Unit!11924)

(assert (=> b!389410 (= e!235926 Unit!11928)))

(declare-fun b!389411 () Bool)

(declare-fun call!27428 () ListLongMap!5425)

(assert (=> b!389411 (= e!235921 call!27428)))

(declare-fun d!72907 () Bool)

(assert (=> d!72907 e!235920))

(declare-fun res!222738 () Bool)

(assert (=> d!72907 (=> (not res!222738) (not e!235920))))

(assert (=> d!72907 (= res!222738 (or (bvsge #b00000000000000000000000000000000 (size!11362 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))))

(declare-fun lt!183058 () ListLongMap!5425)

(assert (=> d!72907 (= lt!183074 lt!183058)))

(declare-fun lt!183069 () Unit!11924)

(assert (=> d!72907 (= lt!183069 e!235926)))

(declare-fun c!54062 () Bool)

(declare-fun e!235918 () Bool)

(assert (=> d!72907 (= c!54062 e!235918)))

(declare-fun res!222741 () Bool)

(assert (=> d!72907 (=> (not res!222741) (not e!235918))))

(assert (=> d!72907 (= res!222741 (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(assert (=> d!72907 (= lt!183058 e!235919)))

(assert (=> d!72907 (= c!54059 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72907 (validMask!0 mask!970)))

(assert (=> d!72907 (= (getCurrentListMap!2077 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183074)))

(declare-fun b!389400 () Bool)

(assert (=> b!389400 (= e!235922 (not call!27425))))

(declare-fun b!389412 () Bool)

(assert (=> b!389412 (= e!235928 call!27428)))

(declare-fun b!389413 () Bool)

(assert (=> b!389413 (= e!235930 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27425 () Bool)

(assert (=> bm!27425 (= call!27427 call!27426)))

(declare-fun b!389414 () Bool)

(assert (=> b!389414 (= e!235918 (validKeyInArray!0 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389415 () Bool)

(assert (=> b!389415 (= e!235929 e!235924)))

(declare-fun res!222742 () Bool)

(assert (=> b!389415 (=> (not res!222742) (not e!235924))))

(assert (=> b!389415 (= res!222742 (contains!2446 lt!183074 (select (arr!11010 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(declare-fun bm!27426 () Bool)

(assert (=> bm!27426 (= call!27425 (contains!2446 lt!183074 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389416 () Bool)

(assert (=> b!389416 (= e!235920 e!235922)))

(declare-fun c!54058 () Bool)

(assert (=> b!389416 (= c!54058 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389417 () Bool)

(declare-fun res!222736 () Bool)

(assert (=> b!389417 (=> (not res!222736) (not e!235920))))

(assert (=> b!389417 (= res!222736 e!235925)))

(declare-fun c!54061 () Bool)

(assert (=> b!389417 (= c!54061 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389418 () Bool)

(assert (=> b!389418 (= e!235919 (+!1023 call!27431 (tuple2!6513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27427 () Bool)

(assert (=> bm!27427 (= call!27428 call!27431)))

(declare-fun bm!27428 () Bool)

(assert (=> bm!27428 (= call!27429 call!27427)))

(declare-fun b!389419 () Bool)

(assert (=> b!389419 (= e!235921 call!27429)))

(declare-fun b!389420 () Bool)

(declare-fun lt!183071 () Unit!11924)

(assert (=> b!389420 (= e!235926 lt!183071)))

(declare-fun lt!183078 () ListLongMap!5425)

(assert (=> b!389420 (= lt!183078 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183059 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183068 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183068 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183070 () Unit!11924)

(declare-fun addStillContains!275 (ListLongMap!5425 (_ BitVec 64) V!13901 (_ BitVec 64)) Unit!11924)

(assert (=> b!389420 (= lt!183070 (addStillContains!275 lt!183078 lt!183059 zeroValue!472 lt!183068))))

(assert (=> b!389420 (contains!2446 (+!1023 lt!183078 (tuple2!6513 lt!183059 zeroValue!472)) lt!183068)))

(declare-fun lt!183073 () Unit!11924)

(assert (=> b!389420 (= lt!183073 lt!183070)))

(declare-fun lt!183062 () ListLongMap!5425)

(assert (=> b!389420 (= lt!183062 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183060 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183076 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183076 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183072 () Unit!11924)

(declare-fun addApplyDifferent!275 (ListLongMap!5425 (_ BitVec 64) V!13901 (_ BitVec 64)) Unit!11924)

(assert (=> b!389420 (= lt!183072 (addApplyDifferent!275 lt!183062 lt!183060 minValue!472 lt!183076))))

(assert (=> b!389420 (= (apply!299 (+!1023 lt!183062 (tuple2!6513 lt!183060 minValue!472)) lt!183076) (apply!299 lt!183062 lt!183076))))

(declare-fun lt!183065 () Unit!11924)

(assert (=> b!389420 (= lt!183065 lt!183072)))

(declare-fun lt!183063 () ListLongMap!5425)

(assert (=> b!389420 (= lt!183063 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183077 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183061 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183061 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183075 () Unit!11924)

(assert (=> b!389420 (= lt!183075 (addApplyDifferent!275 lt!183063 lt!183077 zeroValue!472 lt!183061))))

(assert (=> b!389420 (= (apply!299 (+!1023 lt!183063 (tuple2!6513 lt!183077 zeroValue!472)) lt!183061) (apply!299 lt!183063 lt!183061))))

(declare-fun lt!183067 () Unit!11924)

(assert (=> b!389420 (= lt!183067 lt!183075)))

(declare-fun lt!183066 () ListLongMap!5425)

(assert (=> b!389420 (= lt!183066 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183064 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183064 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183057 () (_ BitVec 64))

(assert (=> b!389420 (= lt!183057 (select (arr!11010 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389420 (= lt!183071 (addApplyDifferent!275 lt!183066 lt!183064 minValue!472 lt!183057))))

(assert (=> b!389420 (= (apply!299 (+!1023 lt!183066 (tuple2!6513 lt!183064 minValue!472)) lt!183057) (apply!299 lt!183066 lt!183057))))

(assert (= (and d!72907 c!54059) b!389418))

(assert (= (and d!72907 (not c!54059)) b!389408))

(assert (= (and b!389408 c!54063) b!389412))

(assert (= (and b!389408 (not c!54063)) b!389403))

(assert (= (and b!389403 c!54060) b!389411))

(assert (= (and b!389403 (not c!54060)) b!389419))

(assert (= (or b!389411 b!389419) bm!27428))

(assert (= (or b!389412 bm!27428) bm!27425))

(assert (= (or b!389412 b!389411) bm!27427))

(assert (= (or b!389418 bm!27425) bm!27422))

(assert (= (or b!389418 bm!27427) bm!27424))

(assert (= (and d!72907 res!222741) b!389414))

(assert (= (and d!72907 c!54062) b!389420))

(assert (= (and d!72907 (not c!54062)) b!389410))

(assert (= (and d!72907 res!222738) b!389402))

(assert (= (and b!389402 res!222743) b!389413))

(assert (= (and b!389402 (not res!222735)) b!389415))

(assert (= (and b!389415 res!222742) b!389405))

(assert (= (and b!389402 res!222740) b!389417))

(assert (= (and b!389417 c!54061) b!389409))

(assert (= (and b!389417 (not c!54061)) b!389404))

(assert (= (and b!389409 res!222739) b!389401))

(assert (= (or b!389409 b!389404) bm!27423))

(assert (= (and b!389417 res!222736) b!389416))

(assert (= (and b!389416 c!54058) b!389406))

(assert (= (and b!389416 (not c!54058)) b!389400))

(assert (= (and b!389406 res!222737) b!389407))

(assert (= (or b!389406 b!389400) bm!27426))

(declare-fun b_lambda!8579 () Bool)

(assert (=> (not b_lambda!8579) (not b!389405)))

(assert (=> b!389405 t!11524))

(declare-fun b_and!16199 () Bool)

(assert (= b_and!16197 (and (=> t!11524 result!5719) b_and!16199)))

(declare-fun m!385447 () Bool)

(assert (=> bm!27426 m!385447))

(declare-fun m!385449 () Bool)

(assert (=> b!389401 m!385449))

(assert (=> bm!27422 m!385241))

(assert (=> b!389415 m!385319))

(assert (=> b!389415 m!385319))

(declare-fun m!385451 () Bool)

(assert (=> b!389415 m!385451))

(declare-fun m!385453 () Bool)

(assert (=> b!389418 m!385453))

(declare-fun m!385455 () Bool)

(assert (=> b!389420 m!385455))

(declare-fun m!385457 () Bool)

(assert (=> b!389420 m!385457))

(declare-fun m!385459 () Bool)

(assert (=> b!389420 m!385459))

(declare-fun m!385461 () Bool)

(assert (=> b!389420 m!385461))

(declare-fun m!385463 () Bool)

(assert (=> b!389420 m!385463))

(assert (=> b!389420 m!385241))

(declare-fun m!385465 () Bool)

(assert (=> b!389420 m!385465))

(declare-fun m!385467 () Bool)

(assert (=> b!389420 m!385467))

(declare-fun m!385469 () Bool)

(assert (=> b!389420 m!385469))

(assert (=> b!389420 m!385457))

(declare-fun m!385471 () Bool)

(assert (=> b!389420 m!385471))

(assert (=> b!389420 m!385467))

(assert (=> b!389420 m!385319))

(declare-fun m!385473 () Bool)

(assert (=> b!389420 m!385473))

(declare-fun m!385475 () Bool)

(assert (=> b!389420 m!385475))

(declare-fun m!385477 () Bool)

(assert (=> b!389420 m!385477))

(assert (=> b!389420 m!385473))

(assert (=> b!389420 m!385455))

(declare-fun m!385479 () Bool)

(assert (=> b!389420 m!385479))

(declare-fun m!385481 () Bool)

(assert (=> b!389420 m!385481))

(declare-fun m!385483 () Bool)

(assert (=> b!389420 m!385483))

(assert (=> b!389405 m!385427))

(assert (=> b!389405 m!385427))

(assert (=> b!389405 m!385429))

(assert (=> b!389405 m!385431))

(assert (=> b!389405 m!385319))

(assert (=> b!389405 m!385319))

(declare-fun m!385485 () Bool)

(assert (=> b!389405 m!385485))

(assert (=> b!389405 m!385429))

(assert (=> b!389413 m!385319))

(assert (=> b!389413 m!385319))

(assert (=> b!389413 m!385407))

(assert (=> d!72907 m!385221))

(declare-fun m!385487 () Bool)

(assert (=> bm!27423 m!385487))

(declare-fun m!385489 () Bool)

(assert (=> b!389407 m!385489))

(assert (=> b!389414 m!385319))

(assert (=> b!389414 m!385319))

(assert (=> b!389414 m!385407))

(declare-fun m!385491 () Bool)

(assert (=> bm!27424 m!385491))

(assert (=> b!389211 d!72907))

(declare-fun d!72909 () Bool)

(declare-fun e!235931 () Bool)

(assert (=> d!72909 e!235931))

(declare-fun res!222745 () Bool)

(assert (=> d!72909 (=> (not res!222745) (not e!235931))))

(declare-fun lt!183079 () ListLongMap!5425)

(assert (=> d!72909 (= res!222745 (contains!2446 lt!183079 (_1!3267 (tuple2!6513 k0!778 v!373))))))

(declare-fun lt!183082 () List!6366)

(assert (=> d!72909 (= lt!183079 (ListLongMap!5426 lt!183082))))

(declare-fun lt!183080 () Unit!11924)

(declare-fun lt!183081 () Unit!11924)

(assert (=> d!72909 (= lt!183080 lt!183081)))

(assert (=> d!72909 (= (getValueByKey!357 lt!183082 (_1!3267 (tuple2!6513 k0!778 v!373))) (Some!362 (_2!3267 (tuple2!6513 k0!778 v!373))))))

(assert (=> d!72909 (= lt!183081 (lemmaContainsTupThenGetReturnValue!179 lt!183082 (_1!3267 (tuple2!6513 k0!778 v!373)) (_2!3267 (tuple2!6513 k0!778 v!373))))))

(assert (=> d!72909 (= lt!183082 (insertStrictlySorted!182 (toList!2728 lt!182912) (_1!3267 (tuple2!6513 k0!778 v!373)) (_2!3267 (tuple2!6513 k0!778 v!373))))))

(assert (=> d!72909 (= (+!1023 lt!182912 (tuple2!6513 k0!778 v!373)) lt!183079)))

(declare-fun b!389421 () Bool)

(declare-fun res!222744 () Bool)

(assert (=> b!389421 (=> (not res!222744) (not e!235931))))

(assert (=> b!389421 (= res!222744 (= (getValueByKey!357 (toList!2728 lt!183079) (_1!3267 (tuple2!6513 k0!778 v!373))) (Some!362 (_2!3267 (tuple2!6513 k0!778 v!373)))))))

(declare-fun b!389422 () Bool)

(assert (=> b!389422 (= e!235931 (contains!2447 (toList!2728 lt!183079) (tuple2!6513 k0!778 v!373)))))

(assert (= (and d!72909 res!222745) b!389421))

(assert (= (and b!389421 res!222744) b!389422))

(declare-fun m!385493 () Bool)

(assert (=> d!72909 m!385493))

(declare-fun m!385495 () Bool)

(assert (=> d!72909 m!385495))

(declare-fun m!385497 () Bool)

(assert (=> d!72909 m!385497))

(declare-fun m!385499 () Bool)

(assert (=> d!72909 m!385499))

(declare-fun m!385501 () Bool)

(assert (=> b!389421 m!385501))

(declare-fun m!385503 () Bool)

(assert (=> b!389422 m!385503))

(assert (=> b!389211 d!72909))

(declare-fun b!389429 () Bool)

(declare-fun e!235937 () Bool)

(declare-fun call!27437 () ListLongMap!5425)

(declare-fun call!27436 () ListLongMap!5425)

(assert (=> b!389429 (= e!235937 (= call!27437 call!27436))))

(declare-fun bm!27433 () Bool)

(assert (=> bm!27433 (= call!27437 (getCurrentListMapNoExtraKeys!957 (array!23088 (store (arr!11010 _keys!658) i!548 k0!778) (size!11362 _keys!658)) (array!23090 (store (arr!11011 _values!506) i!548 (ValueCellFull!4455 v!373)) (size!11363 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27434 () Bool)

(assert (=> bm!27434 (= call!27436 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!72911 () Bool)

(declare-fun e!235936 () Bool)

(assert (=> d!72911 e!235936))

(declare-fun res!222748 () Bool)

(assert (=> d!72911 (=> (not res!222748) (not e!235936))))

(assert (=> d!72911 (= res!222748 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11362 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11363 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11362 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11363 _values!506))))))))

(declare-fun lt!183085 () Unit!11924)

(declare-fun choose!1313 (array!23087 array!23089 (_ BitVec 32) (_ BitVec 32) V!13901 V!13901 (_ BitVec 32) (_ BitVec 64) V!13901 (_ BitVec 32) Int) Unit!11924)

(assert (=> d!72911 (= lt!183085 (choose!1313 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11362 _keys!658)))))

(assert (=> d!72911 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!241 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183085)))

(declare-fun b!389430 () Bool)

(assert (=> b!389430 (= e!235937 (= call!27437 (+!1023 call!27436 (tuple2!6513 k0!778 v!373))))))

(declare-fun b!389431 () Bool)

(assert (=> b!389431 (= e!235936 e!235937)))

(declare-fun c!54066 () Bool)

(assert (=> b!389431 (= c!54066 (bvsle #b00000000000000000000000000000000 i!548))))

(assert (= (and d!72911 res!222748) b!389431))

(assert (= (and b!389431 c!54066) b!389430))

(assert (= (and b!389431 (not c!54066)) b!389429))

(assert (= (or b!389430 b!389429) bm!27434))

(assert (= (or b!389430 b!389429) bm!27433))

(assert (=> bm!27433 m!385251))

(assert (=> bm!27433 m!385239))

(declare-fun m!385505 () Bool)

(assert (=> bm!27433 m!385505))

(assert (=> bm!27434 m!385241))

(declare-fun m!385507 () Bool)

(assert (=> d!72911 m!385507))

(declare-fun m!385509 () Bool)

(assert (=> b!389430 m!385509))

(assert (=> b!389211 d!72911))

(declare-fun bm!27435 () Bool)

(declare-fun call!27439 () ListLongMap!5425)

(assert (=> bm!27435 (= call!27439 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389433 () Bool)

(declare-fun e!235947 () Bool)

(declare-fun lt!183103 () ListLongMap!5425)

(assert (=> b!389433 (= e!235947 (= (apply!299 lt!183103 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389434 () Bool)

(declare-fun res!222754 () Bool)

(declare-fun e!235940 () Bool)

(assert (=> b!389434 (=> (not res!222754) (not e!235940))))

(declare-fun e!235949 () Bool)

(assert (=> b!389434 (= res!222754 e!235949)))

(declare-fun res!222749 () Bool)

(assert (=> b!389434 (=> res!222749 e!235949)))

(declare-fun e!235950 () Bool)

(assert (=> b!389434 (= res!222749 (not e!235950))))

(declare-fun res!222757 () Bool)

(assert (=> b!389434 (=> (not res!222757) (not e!235950))))

(assert (=> b!389434 (= res!222757 (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(declare-fun b!389435 () Bool)

(declare-fun c!54069 () Bool)

(assert (=> b!389435 (= c!54069 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235948 () ListLongMap!5425)

(declare-fun e!235941 () ListLongMap!5425)

(assert (=> b!389435 (= e!235948 e!235941)))

(declare-fun bm!27436 () Bool)

(declare-fun call!27443 () Bool)

(assert (=> bm!27436 (= call!27443 (contains!2446 lt!183103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389436 () Bool)

(declare-fun e!235945 () Bool)

(assert (=> b!389436 (= e!235945 (not call!27443))))

(declare-fun bm!27437 () Bool)

(declare-fun call!27444 () ListLongMap!5425)

(declare-fun c!54072 () Bool)

(declare-fun c!54068 () Bool)

(declare-fun call!27442 () ListLongMap!5425)

(declare-fun call!27440 () ListLongMap!5425)

(assert (=> bm!27437 (= call!27444 (+!1023 (ite c!54068 call!27439 (ite c!54072 call!27440 call!27442)) (ite (or c!54068 c!54072) (tuple2!6513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389437 () Bool)

(declare-fun e!235944 () Bool)

(assert (=> b!389437 (= e!235944 (= (apply!299 lt!183103 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)) (get!5571 (select (arr!11011 lt!182915) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182915)))))

(assert (=> b!389437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(declare-fun b!389438 () Bool)

(declare-fun e!235942 () Bool)

(declare-fun e!235943 () Bool)

(assert (=> b!389438 (= e!235942 e!235943)))

(declare-fun res!222751 () Bool)

(declare-fun call!27438 () Bool)

(assert (=> b!389438 (= res!222751 call!27438)))

(assert (=> b!389438 (=> (not res!222751) (not e!235943))))

(declare-fun b!389439 () Bool)

(assert (=> b!389439 (= e!235943 (= (apply!299 lt!183103 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389440 () Bool)

(declare-fun e!235939 () ListLongMap!5425)

(assert (=> b!389440 (= e!235939 e!235948)))

(assert (=> b!389440 (= c!54072 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389441 () Bool)

(assert (=> b!389441 (= e!235945 e!235947)))

(declare-fun res!222753 () Bool)

(assert (=> b!389441 (= res!222753 call!27443)))

(assert (=> b!389441 (=> (not res!222753) (not e!235947))))

(declare-fun b!389442 () Bool)

(declare-fun e!235946 () Unit!11924)

(declare-fun Unit!11929 () Unit!11924)

(assert (=> b!389442 (= e!235946 Unit!11929)))

(declare-fun b!389443 () Bool)

(declare-fun call!27441 () ListLongMap!5425)

(assert (=> b!389443 (= e!235941 call!27441)))

(declare-fun d!72913 () Bool)

(assert (=> d!72913 e!235940))

(declare-fun res!222752 () Bool)

(assert (=> d!72913 (=> (not res!222752) (not e!235940))))

(assert (=> d!72913 (= res!222752 (or (bvsge #b00000000000000000000000000000000 (size!11362 lt!182913)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))))

(declare-fun lt!183087 () ListLongMap!5425)

(assert (=> d!72913 (= lt!183103 lt!183087)))

(declare-fun lt!183098 () Unit!11924)

(assert (=> d!72913 (= lt!183098 e!235946)))

(declare-fun c!54071 () Bool)

(declare-fun e!235938 () Bool)

(assert (=> d!72913 (= c!54071 e!235938)))

(declare-fun res!222755 () Bool)

(assert (=> d!72913 (=> (not res!222755) (not e!235938))))

(assert (=> d!72913 (= res!222755 (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(assert (=> d!72913 (= lt!183087 e!235939)))

(assert (=> d!72913 (= c!54068 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72913 (validMask!0 mask!970)))

(assert (=> d!72913 (= (getCurrentListMap!2077 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183103)))

(declare-fun b!389432 () Bool)

(assert (=> b!389432 (= e!235942 (not call!27438))))

(declare-fun b!389444 () Bool)

(assert (=> b!389444 (= e!235948 call!27441)))

(declare-fun b!389445 () Bool)

(assert (=> b!389445 (= e!235950 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun bm!27438 () Bool)

(assert (=> bm!27438 (= call!27440 call!27439)))

(declare-fun b!389446 () Bool)

(assert (=> b!389446 (= e!235938 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389447 () Bool)

(assert (=> b!389447 (= e!235949 e!235944)))

(declare-fun res!222756 () Bool)

(assert (=> b!389447 (=> (not res!222756) (not e!235944))))

(assert (=> b!389447 (= res!222756 (contains!2446 lt!183103 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (=> b!389447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(declare-fun bm!27439 () Bool)

(assert (=> bm!27439 (= call!27438 (contains!2446 lt!183103 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389448 () Bool)

(assert (=> b!389448 (= e!235940 e!235942)))

(declare-fun c!54067 () Bool)

(assert (=> b!389448 (= c!54067 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389449 () Bool)

(declare-fun res!222750 () Bool)

(assert (=> b!389449 (=> (not res!222750) (not e!235940))))

(assert (=> b!389449 (= res!222750 e!235945)))

(declare-fun c!54070 () Bool)

(assert (=> b!389449 (= c!54070 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389450 () Bool)

(assert (=> b!389450 (= e!235939 (+!1023 call!27444 (tuple2!6513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27440 () Bool)

(assert (=> bm!27440 (= call!27441 call!27444)))

(declare-fun bm!27441 () Bool)

(assert (=> bm!27441 (= call!27442 call!27440)))

(declare-fun b!389451 () Bool)

(assert (=> b!389451 (= e!235941 call!27442)))

(declare-fun b!389452 () Bool)

(declare-fun lt!183100 () Unit!11924)

(assert (=> b!389452 (= e!235946 lt!183100)))

(declare-fun lt!183107 () ListLongMap!5425)

(assert (=> b!389452 (= lt!183107 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183088 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183097 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183097 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183099 () Unit!11924)

(assert (=> b!389452 (= lt!183099 (addStillContains!275 lt!183107 lt!183088 zeroValue!472 lt!183097))))

(assert (=> b!389452 (contains!2446 (+!1023 lt!183107 (tuple2!6513 lt!183088 zeroValue!472)) lt!183097)))

(declare-fun lt!183102 () Unit!11924)

(assert (=> b!389452 (= lt!183102 lt!183099)))

(declare-fun lt!183091 () ListLongMap!5425)

(assert (=> b!389452 (= lt!183091 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183089 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183089 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183105 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183105 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183101 () Unit!11924)

(assert (=> b!389452 (= lt!183101 (addApplyDifferent!275 lt!183091 lt!183089 minValue!472 lt!183105))))

(assert (=> b!389452 (= (apply!299 (+!1023 lt!183091 (tuple2!6513 lt!183089 minValue!472)) lt!183105) (apply!299 lt!183091 lt!183105))))

(declare-fun lt!183094 () Unit!11924)

(assert (=> b!389452 (= lt!183094 lt!183101)))

(declare-fun lt!183092 () ListLongMap!5425)

(assert (=> b!389452 (= lt!183092 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183106 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183090 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183090 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun lt!183104 () Unit!11924)

(assert (=> b!389452 (= lt!183104 (addApplyDifferent!275 lt!183092 lt!183106 zeroValue!472 lt!183090))))

(assert (=> b!389452 (= (apply!299 (+!1023 lt!183092 (tuple2!6513 lt!183106 zeroValue!472)) lt!183090) (apply!299 lt!183092 lt!183090))))

(declare-fun lt!183096 () Unit!11924)

(assert (=> b!389452 (= lt!183096 lt!183104)))

(declare-fun lt!183095 () ListLongMap!5425)

(assert (=> b!389452 (= lt!183095 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183093 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183086 () (_ BitVec 64))

(assert (=> b!389452 (= lt!183086 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(assert (=> b!389452 (= lt!183100 (addApplyDifferent!275 lt!183095 lt!183093 minValue!472 lt!183086))))

(assert (=> b!389452 (= (apply!299 (+!1023 lt!183095 (tuple2!6513 lt!183093 minValue!472)) lt!183086) (apply!299 lt!183095 lt!183086))))

(assert (= (and d!72913 c!54068) b!389450))

(assert (= (and d!72913 (not c!54068)) b!389440))

(assert (= (and b!389440 c!54072) b!389444))

(assert (= (and b!389440 (not c!54072)) b!389435))

(assert (= (and b!389435 c!54069) b!389443))

(assert (= (and b!389435 (not c!54069)) b!389451))

(assert (= (or b!389443 b!389451) bm!27441))

(assert (= (or b!389444 bm!27441) bm!27438))

(assert (= (or b!389444 b!389443) bm!27440))

(assert (= (or b!389450 bm!27438) bm!27435))

(assert (= (or b!389450 bm!27440) bm!27437))

(assert (= (and d!72913 res!222755) b!389446))

(assert (= (and d!72913 c!54071) b!389452))

(assert (= (and d!72913 (not c!54071)) b!389442))

(assert (= (and d!72913 res!222752) b!389434))

(assert (= (and b!389434 res!222757) b!389445))

(assert (= (and b!389434 (not res!222749)) b!389447))

(assert (= (and b!389447 res!222756) b!389437))

(assert (= (and b!389434 res!222754) b!389449))

(assert (= (and b!389449 c!54070) b!389441))

(assert (= (and b!389449 (not c!54070)) b!389436))

(assert (= (and b!389441 res!222753) b!389433))

(assert (= (or b!389441 b!389436) bm!27436))

(assert (= (and b!389449 res!222750) b!389448))

(assert (= (and b!389448 c!54067) b!389438))

(assert (= (and b!389448 (not c!54067)) b!389432))

(assert (= (and b!389438 res!222751) b!389439))

(assert (= (or b!389438 b!389432) bm!27439))

(declare-fun b_lambda!8581 () Bool)

(assert (=> (not b_lambda!8581) (not b!389437)))

(assert (=> b!389437 t!11524))

(declare-fun b_and!16201 () Bool)

(assert (= b_and!16199 (and (=> t!11524 result!5719) b_and!16201)))

(declare-fun m!385511 () Bool)

(assert (=> bm!27439 m!385511))

(declare-fun m!385513 () Bool)

(assert (=> b!389433 m!385513))

(assert (=> bm!27435 m!385231))

(assert (=> b!389447 m!385395))

(assert (=> b!389447 m!385395))

(declare-fun m!385515 () Bool)

(assert (=> b!389447 m!385515))

(declare-fun m!385517 () Bool)

(assert (=> b!389450 m!385517))

(declare-fun m!385519 () Bool)

(assert (=> b!389452 m!385519))

(declare-fun m!385521 () Bool)

(assert (=> b!389452 m!385521))

(declare-fun m!385523 () Bool)

(assert (=> b!389452 m!385523))

(declare-fun m!385525 () Bool)

(assert (=> b!389452 m!385525))

(declare-fun m!385527 () Bool)

(assert (=> b!389452 m!385527))

(assert (=> b!389452 m!385231))

(declare-fun m!385529 () Bool)

(assert (=> b!389452 m!385529))

(declare-fun m!385531 () Bool)

(assert (=> b!389452 m!385531))

(declare-fun m!385533 () Bool)

(assert (=> b!389452 m!385533))

(assert (=> b!389452 m!385521))

(declare-fun m!385535 () Bool)

(assert (=> b!389452 m!385535))

(assert (=> b!389452 m!385531))

(assert (=> b!389452 m!385395))

(declare-fun m!385537 () Bool)

(assert (=> b!389452 m!385537))

(declare-fun m!385539 () Bool)

(assert (=> b!389452 m!385539))

(declare-fun m!385541 () Bool)

(assert (=> b!389452 m!385541))

(assert (=> b!389452 m!385537))

(assert (=> b!389452 m!385519))

(declare-fun m!385543 () Bool)

(assert (=> b!389452 m!385543))

(declare-fun m!385545 () Bool)

(assert (=> b!389452 m!385545))

(declare-fun m!385547 () Bool)

(assert (=> b!389452 m!385547))

(declare-fun m!385549 () Bool)

(assert (=> b!389437 m!385549))

(assert (=> b!389437 m!385549))

(assert (=> b!389437 m!385429))

(declare-fun m!385551 () Bool)

(assert (=> b!389437 m!385551))

(assert (=> b!389437 m!385395))

(assert (=> b!389437 m!385395))

(declare-fun m!385553 () Bool)

(assert (=> b!389437 m!385553))

(assert (=> b!389437 m!385429))

(assert (=> b!389445 m!385395))

(assert (=> b!389445 m!385395))

(assert (=> b!389445 m!385397))

(assert (=> d!72913 m!385221))

(declare-fun m!385555 () Bool)

(assert (=> bm!27436 m!385555))

(declare-fun m!385557 () Bool)

(assert (=> b!389439 m!385557))

(assert (=> b!389446 m!385395))

(assert (=> b!389446 m!385395))

(assert (=> b!389446 m!385397))

(declare-fun m!385559 () Bool)

(assert (=> bm!27437 m!385559))

(assert (=> b!389211 d!72913))

(declare-fun b!389453 () Bool)

(declare-fun e!235956 () Bool)

(declare-fun e!235952 () Bool)

(assert (=> b!389453 (= e!235956 e!235952)))

(declare-fun c!54073 () Bool)

(assert (=> b!389453 (= c!54073 (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(declare-fun d!72915 () Bool)

(declare-fun e!235955 () Bool)

(assert (=> d!72915 e!235955))

(declare-fun res!222761 () Bool)

(assert (=> d!72915 (=> (not res!222761) (not e!235955))))

(declare-fun lt!183113 () ListLongMap!5425)

(assert (=> d!72915 (= res!222761 (not (contains!2446 lt!183113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235957 () ListLongMap!5425)

(assert (=> d!72915 (= lt!183113 e!235957)))

(declare-fun c!54074 () Bool)

(assert (=> d!72915 (= c!54074 (bvsge #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(assert (=> d!72915 (validMask!0 mask!970)))

(assert (=> d!72915 (= (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183113)))

(declare-fun b!389454 () Bool)

(declare-fun lt!183114 () Unit!11924)

(declare-fun lt!183109 () Unit!11924)

(assert (=> b!389454 (= lt!183114 lt!183109)))

(declare-fun lt!183111 () (_ BitVec 64))

(declare-fun lt!183112 () (_ BitVec 64))

(declare-fun lt!183110 () V!13901)

(declare-fun lt!183108 () ListLongMap!5425)

(assert (=> b!389454 (not (contains!2446 (+!1023 lt!183108 (tuple2!6513 lt!183112 lt!183110)) lt!183111))))

(assert (=> b!389454 (= lt!183109 (addStillNotContains!132 lt!183108 lt!183112 lt!183110 lt!183111))))

(assert (=> b!389454 (= lt!183111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389454 (= lt!183110 (get!5571 (select (arr!11011 lt!182915) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389454 (= lt!183112 (select (arr!11010 lt!182913) #b00000000000000000000000000000000))))

(declare-fun call!27445 () ListLongMap!5425)

(assert (=> b!389454 (= lt!183108 call!27445)))

(declare-fun e!235953 () ListLongMap!5425)

(assert (=> b!389454 (= e!235953 (+!1023 call!27445 (tuple2!6513 (select (arr!11010 lt!182913) #b00000000000000000000000000000000) (get!5571 (select (arr!11011 lt!182915) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389455 () Bool)

(assert (=> b!389455 (= e!235952 (= lt!183113 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27442 () Bool)

(assert (=> bm!27442 (= call!27445 (getCurrentListMapNoExtraKeys!957 lt!182913 lt!182915 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389456 () Bool)

(assert (=> b!389456 (= e!235955 e!235956)))

(declare-fun c!54076 () Bool)

(declare-fun e!235951 () Bool)

(assert (=> b!389456 (= c!54076 e!235951)))

(declare-fun res!222758 () Bool)

(assert (=> b!389456 (=> (not res!222758) (not e!235951))))

(assert (=> b!389456 (= res!222758 (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(declare-fun b!389457 () Bool)

(assert (=> b!389457 (= e!235957 e!235953)))

(declare-fun c!54075 () Bool)

(assert (=> b!389457 (= c!54075 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389458 () Bool)

(assert (=> b!389458 (= e!235952 (isEmpty!545 lt!183113))))

(declare-fun b!389459 () Bool)

(assert (=> b!389459 (= e!235951 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (=> b!389459 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389460 () Bool)

(assert (=> b!389460 (= e!235953 call!27445)))

(declare-fun b!389461 () Bool)

(declare-fun e!235954 () Bool)

(assert (=> b!389461 (= e!235956 e!235954)))

(assert (=> b!389461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(declare-fun res!222760 () Bool)

(assert (=> b!389461 (= res!222760 (contains!2446 lt!183113 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (=> b!389461 (=> (not res!222760) (not e!235954))))

(declare-fun b!389462 () Bool)

(assert (=> b!389462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(assert (=> b!389462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11363 lt!182915)))))

(assert (=> b!389462 (= e!235954 (= (apply!299 lt!183113 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)) (get!5571 (select (arr!11011 lt!182915) #b00000000000000000000000000000000) (dynLambda!642 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389463 () Bool)

(declare-fun res!222759 () Bool)

(assert (=> b!389463 (=> (not res!222759) (not e!235955))))

(assert (=> b!389463 (= res!222759 (not (contains!2446 lt!183113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389464 () Bool)

(assert (=> b!389464 (= e!235957 (ListLongMap!5426 Nil!6363))))

(assert (= (and d!72915 c!54074) b!389464))

(assert (= (and d!72915 (not c!54074)) b!389457))

(assert (= (and b!389457 c!54075) b!389454))

(assert (= (and b!389457 (not c!54075)) b!389460))

(assert (= (or b!389454 b!389460) bm!27442))

(assert (= (and d!72915 res!222761) b!389463))

(assert (= (and b!389463 res!222759) b!389456))

(assert (= (and b!389456 res!222758) b!389459))

(assert (= (and b!389456 c!54076) b!389461))

(assert (= (and b!389456 (not c!54076)) b!389453))

(assert (= (and b!389461 res!222760) b!389462))

(assert (= (and b!389453 c!54073) b!389455))

(assert (= (and b!389453 (not c!54073)) b!389458))

(declare-fun b_lambda!8583 () Bool)

(assert (=> (not b_lambda!8583) (not b!389454)))

(assert (=> b!389454 t!11524))

(declare-fun b_and!16203 () Bool)

(assert (= b_and!16201 (and (=> t!11524 result!5719) b_and!16203)))

(declare-fun b_lambda!8585 () Bool)

(assert (=> (not b_lambda!8585) (not b!389462)))

(assert (=> b!389462 t!11524))

(declare-fun b_and!16205 () Bool)

(assert (= b_and!16203 (and (=> t!11524 result!5719) b_and!16205)))

(declare-fun m!385561 () Bool)

(assert (=> d!72915 m!385561))

(assert (=> d!72915 m!385221))

(assert (=> b!389459 m!385395))

(assert (=> b!389459 m!385395))

(assert (=> b!389459 m!385397))

(declare-fun m!385563 () Bool)

(assert (=> bm!27442 m!385563))

(assert (=> b!389457 m!385395))

(assert (=> b!389457 m!385395))

(assert (=> b!389457 m!385397))

(assert (=> b!389455 m!385563))

(declare-fun m!385565 () Bool)

(assert (=> b!389454 m!385565))

(assert (=> b!389454 m!385549))

(assert (=> b!389454 m!385429))

(assert (=> b!389454 m!385549))

(assert (=> b!389454 m!385429))

(assert (=> b!389454 m!385551))

(assert (=> b!389454 m!385395))

(declare-fun m!385567 () Bool)

(assert (=> b!389454 m!385567))

(assert (=> b!389454 m!385567))

(declare-fun m!385569 () Bool)

(assert (=> b!389454 m!385569))

(declare-fun m!385571 () Bool)

(assert (=> b!389454 m!385571))

(assert (=> b!389461 m!385395))

(assert (=> b!389461 m!385395))

(declare-fun m!385573 () Bool)

(assert (=> b!389461 m!385573))

(declare-fun m!385575 () Bool)

(assert (=> b!389458 m!385575))

(declare-fun m!385577 () Bool)

(assert (=> b!389463 m!385577))

(assert (=> b!389462 m!385549))

(assert (=> b!389462 m!385429))

(assert (=> b!389462 m!385395))

(declare-fun m!385579 () Bool)

(assert (=> b!389462 m!385579))

(assert (=> b!389462 m!385549))

(assert (=> b!389462 m!385429))

(assert (=> b!389462 m!385551))

(assert (=> b!389462 m!385395))

(assert (=> b!389211 d!72915))

(declare-fun b!389465 () Bool)

(declare-fun e!235961 () Bool)

(declare-fun call!27446 () Bool)

(assert (=> b!389465 (= e!235961 call!27446)))

(declare-fun d!72917 () Bool)

(declare-fun res!222762 () Bool)

(declare-fun e!235959 () Bool)

(assert (=> d!72917 (=> res!222762 e!235959)))

(assert (=> d!72917 (= res!222762 (bvsge #b00000000000000000000000000000000 (size!11362 lt!182913)))))

(assert (=> d!72917 (= (arrayNoDuplicates!0 lt!182913 #b00000000000000000000000000000000 Nil!6362) e!235959)))

(declare-fun b!389466 () Bool)

(declare-fun e!235960 () Bool)

(assert (=> b!389466 (= e!235960 e!235961)))

(declare-fun c!54077 () Bool)

(assert (=> b!389466 (= c!54077 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun bm!27443 () Bool)

(assert (=> bm!27443 (= call!27446 (arrayNoDuplicates!0 lt!182913 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54077 (Cons!6361 (select (arr!11010 lt!182913) #b00000000000000000000000000000000) Nil!6362) Nil!6362)))))

(declare-fun b!389467 () Bool)

(declare-fun e!235958 () Bool)

(assert (=> b!389467 (= e!235958 (contains!2448 Nil!6362 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(declare-fun b!389468 () Bool)

(assert (=> b!389468 (= e!235961 call!27446)))

(declare-fun b!389469 () Bool)

(assert (=> b!389469 (= e!235959 e!235960)))

(declare-fun res!222764 () Bool)

(assert (=> b!389469 (=> (not res!222764) (not e!235960))))

(assert (=> b!389469 (= res!222764 (not e!235958))))

(declare-fun res!222763 () Bool)

(assert (=> b!389469 (=> (not res!222763) (not e!235958))))

(assert (=> b!389469 (= res!222763 (validKeyInArray!0 (select (arr!11010 lt!182913) #b00000000000000000000000000000000)))))

(assert (= (and d!72917 (not res!222762)) b!389469))

(assert (= (and b!389469 res!222763) b!389467))

(assert (= (and b!389469 res!222764) b!389466))

(assert (= (and b!389466 c!54077) b!389468))

(assert (= (and b!389466 (not c!54077)) b!389465))

(assert (= (or b!389468 b!389465) bm!27443))

(assert (=> b!389466 m!385395))

(assert (=> b!389466 m!385395))

(assert (=> b!389466 m!385397))

(assert (=> bm!27443 m!385395))

(declare-fun m!385581 () Bool)

(assert (=> bm!27443 m!385581))

(assert (=> b!389467 m!385395))

(assert (=> b!389467 m!385395))

(declare-fun m!385583 () Bool)

(assert (=> b!389467 m!385583))

(assert (=> b!389469 m!385395))

(assert (=> b!389469 m!385395))

(assert (=> b!389469 m!385397))

(assert (=> b!389210 d!72917))

(declare-fun mapIsEmpty!15972 () Bool)

(declare-fun mapRes!15972 () Bool)

(assert (=> mapIsEmpty!15972 mapRes!15972))

(declare-fun b!389477 () Bool)

(declare-fun e!235967 () Bool)

(assert (=> b!389477 (= e!235967 tp_is_empty!9597)))

(declare-fun b!389476 () Bool)

(declare-fun e!235966 () Bool)

(assert (=> b!389476 (= e!235966 tp_is_empty!9597)))

(declare-fun mapNonEmpty!15972 () Bool)

(declare-fun tp!31542 () Bool)

(assert (=> mapNonEmpty!15972 (= mapRes!15972 (and tp!31542 e!235966))))

(declare-fun mapKey!15972 () (_ BitVec 32))

(declare-fun mapRest!15972 () (Array (_ BitVec 32) ValueCell!4455))

(declare-fun mapValue!15972 () ValueCell!4455)

(assert (=> mapNonEmpty!15972 (= mapRest!15966 (store mapRest!15972 mapKey!15972 mapValue!15972))))

(declare-fun condMapEmpty!15972 () Bool)

(declare-fun mapDefault!15972 () ValueCell!4455)

(assert (=> mapNonEmpty!15966 (= condMapEmpty!15972 (= mapRest!15966 ((as const (Array (_ BitVec 32) ValueCell!4455)) mapDefault!15972)))))

(assert (=> mapNonEmpty!15966 (= tp!31533 (and e!235967 mapRes!15972))))

(assert (= (and mapNonEmpty!15966 condMapEmpty!15972) mapIsEmpty!15972))

(assert (= (and mapNonEmpty!15966 (not condMapEmpty!15972)) mapNonEmpty!15972))

(assert (= (and mapNonEmpty!15972 ((_ is ValueCellFull!4455) mapValue!15972)) b!389476))

(assert (= (and mapNonEmpty!15966 ((_ is ValueCellFull!4455) mapDefault!15972)) b!389477))

(declare-fun m!385585 () Bool)

(assert (=> mapNonEmpty!15972 m!385585))

(declare-fun b_lambda!8587 () Bool)

(assert (= b_lambda!8585 (or (and start!37866 b_free!8925) b_lambda!8587)))

(declare-fun b_lambda!8589 () Bool)

(assert (= b_lambda!8581 (or (and start!37866 b_free!8925) b_lambda!8589)))

(declare-fun b_lambda!8591 () Bool)

(assert (= b_lambda!8577 (or (and start!37866 b_free!8925) b_lambda!8591)))

(declare-fun b_lambda!8593 () Bool)

(assert (= b_lambda!8575 (or (and start!37866 b_free!8925) b_lambda!8593)))

(declare-fun b_lambda!8595 () Bool)

(assert (= b_lambda!8579 (or (and start!37866 b_free!8925) b_lambda!8595)))

(declare-fun b_lambda!8597 () Bool)

(assert (= b_lambda!8583 (or (and start!37866 b_free!8925) b_lambda!8597)))

(check-sat (not b!389439) (not b!389285) (not b!389315) (not b!389422) (not b!389298) (not b!389458) (not b!389421) (not b_lambda!8587) (not b!389433) (not b!389299) (not b!389345) (not d!72897) (not b_lambda!8589) (not bm!27422) (not b!389287) (not b_lambda!8597) (not bm!27404) (not b!389312) (not b!389279) (not bm!27436) (not b!389284) (not b!389466) (not b!389445) (not b!389318) (not b!389414) (not b!389281) (not b!389437) (not d!72905) (not b!389446) (not b!389454) (not b!389461) (not b!389288) (not d!72913) (not mapNonEmpty!15972) (not b!389352) (not b!389401) (not b!389348) (not b_lambda!8595) (not b!389353) (not bm!27434) (not b!389282) (not b!389350) (not d!72907) (not bm!27400) (not d!72911) (not bm!27443) (not b!389467) (not b!389418) (not b!389286) (not bm!27442) (not b!389452) (not b!389405) (not b!389277) (not b!389447) (not bm!27426) (not bm!27435) (not b!389354) (not bm!27433) (not b!389457) (not bm!27439) (not b_next!8925) (not b!389469) (not d!72915) (not d!72887) (not d!72891) (not b!389455) (not b!389278) (not d!72889) (not b!389420) (not d!72909) (not bm!27423) (not bm!27437) (not bm!27403) (not d!72893) (not b!389407) (not b!389459) (not bm!27424) (not b!389462) (not b!389415) tp_is_empty!9597 (not b!389450) (not b!389430) (not bm!27407) (not b!389317) (not b!389463) (not b!389280) (not b_lambda!8593) (not b!389349) (not b_lambda!8591) (not b!389313) (not d!72895) (not b!389272) b_and!16205 (not b!389283) (not b!389413) (not b!389346))
(check-sat b_and!16205 (not b_next!8925))
