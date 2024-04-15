; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37926 () Bool)

(assert start!37926)

(declare-fun b_free!8953 () Bool)

(declare-fun b_next!8953 () Bool)

(assert (=> start!37926 (= b_free!8953 (not b_next!8953))))

(declare-fun tp!31622 () Bool)

(declare-fun b_and!16217 () Bool)

(assert (=> start!37926 (= tp!31622 b_and!16217)))

(declare-fun b!389979 () Bool)

(declare-fun res!223188 () Bool)

(declare-fun e!236223 () Bool)

(assert (=> b!389979 (=> (not res!223188) (not e!236223))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23133 0))(
  ( (array!23134 (arr!11031 (Array (_ BitVec 32) (_ BitVec 64))) (size!11384 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23133)

(assert (=> b!389979 (= res!223188 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11384 _keys!658))))))

(declare-fun b!389980 () Bool)

(declare-fun e!236225 () Bool)

(declare-fun tp_is_empty!9625 () Bool)

(assert (=> b!389980 (= e!236225 tp_is_empty!9625)))

(declare-fun b!389981 () Bool)

(declare-fun e!236227 () Bool)

(declare-fun e!236229 () Bool)

(assert (=> b!389981 (= e!236227 (not e!236229))))

(declare-fun res!223184 () Bool)

(assert (=> b!389981 (=> res!223184 e!236229)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389981 (= res!223184 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13939 0))(
  ( (V!13940 (val!4857 Int)) )
))
(declare-datatypes ((tuple2!6508 0))(
  ( (tuple2!6509 (_1!3265 (_ BitVec 64)) (_2!3265 V!13939)) )
))
(declare-datatypes ((List!6354 0))(
  ( (Nil!6351) (Cons!6350 (h!7206 tuple2!6508) (t!11503 List!6354)) )
))
(declare-datatypes ((ListLongMap!5411 0))(
  ( (ListLongMap!5412 (toList!2721 List!6354)) )
))
(declare-fun lt!183660 () ListLongMap!5411)

(declare-datatypes ((ValueCell!4469 0))(
  ( (ValueCellFull!4469 (v!7064 V!13939)) (EmptyCell!4469) )
))
(declare-datatypes ((array!23135 0))(
  ( (array!23136 (arr!11032 (Array (_ BitVec 32) ValueCell!4469)) (size!11385 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23135)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13939)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13939)

(declare-fun getCurrentListMap!2047 (array!23133 array!23135 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) Int) ListLongMap!5411)

(assert (=> b!389981 (= lt!183660 (getCurrentListMap!2047 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183662 () array!23133)

(declare-fun lt!183663 () array!23135)

(declare-fun lt!183658 () ListLongMap!5411)

(assert (=> b!389981 (= lt!183658 (getCurrentListMap!2047 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183659 () ListLongMap!5411)

(declare-fun lt!183661 () ListLongMap!5411)

(assert (=> b!389981 (and (= lt!183659 lt!183661) (= lt!183661 lt!183659))))

(declare-fun v!373 () V!13939)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!183656 () ListLongMap!5411)

(declare-fun +!1041 (ListLongMap!5411 tuple2!6508) ListLongMap!5411)

(assert (=> b!389981 (= lt!183661 (+!1041 lt!183656 (tuple2!6509 k0!778 v!373)))))

(declare-datatypes ((Unit!11926 0))(
  ( (Unit!11927) )
))
(declare-fun lt!183657 () Unit!11926)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!248 (array!23133 array!23135 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) (_ BitVec 64) V!13939 (_ BitVec 32) Int) Unit!11926)

(assert (=> b!389981 (= lt!183657 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!248 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!957 (array!23133 array!23135 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) Int) ListLongMap!5411)

(assert (=> b!389981 (= lt!183659 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389981 (= lt!183663 (array!23136 (store (arr!11032 _values!506) i!548 (ValueCellFull!4469 v!373)) (size!11385 _values!506)))))

(assert (=> b!389981 (= lt!183656 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!16014 () Bool)

(declare-fun mapRes!16014 () Bool)

(declare-fun tp!31623 () Bool)

(declare-fun e!236226 () Bool)

(assert (=> mapNonEmpty!16014 (= mapRes!16014 (and tp!31623 e!236226))))

(declare-fun mapValue!16014 () ValueCell!4469)

(declare-fun mapRest!16014 () (Array (_ BitVec 32) ValueCell!4469))

(declare-fun mapKey!16014 () (_ BitVec 32))

(assert (=> mapNonEmpty!16014 (= (arr!11032 _values!506) (store mapRest!16014 mapKey!16014 mapValue!16014))))

(declare-fun b!389983 () Bool)

(assert (=> b!389983 (= e!236229 (= lt!183658 (+!1041 lt!183659 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun b!389984 () Bool)

(declare-fun res!223191 () Bool)

(assert (=> b!389984 (=> (not res!223191) (not e!236223))))

(declare-datatypes ((List!6355 0))(
  ( (Nil!6352) (Cons!6351 (h!7207 (_ BitVec 64)) (t!11504 List!6355)) )
))
(declare-fun arrayNoDuplicates!0 (array!23133 (_ BitVec 32) List!6355) Bool)

(assert (=> b!389984 (= res!223191 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6352))))

(declare-fun b!389985 () Bool)

(assert (=> b!389985 (= e!236226 tp_is_empty!9625)))

(declare-fun res!223186 () Bool)

(assert (=> start!37926 (=> (not res!223186) (not e!236223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37926 (= res!223186 (validMask!0 mask!970))))

(assert (=> start!37926 e!236223))

(declare-fun e!236224 () Bool)

(declare-fun array_inv!8104 (array!23135) Bool)

(assert (=> start!37926 (and (array_inv!8104 _values!506) e!236224)))

(assert (=> start!37926 tp!31622))

(assert (=> start!37926 true))

(assert (=> start!37926 tp_is_empty!9625))

(declare-fun array_inv!8105 (array!23133) Bool)

(assert (=> start!37926 (array_inv!8105 _keys!658)))

(declare-fun b!389982 () Bool)

(declare-fun res!223182 () Bool)

(assert (=> b!389982 (=> (not res!223182) (not e!236223))))

(assert (=> b!389982 (= res!223182 (and (= (size!11385 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11384 _keys!658) (size!11385 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389986 () Bool)

(assert (=> b!389986 (= e!236224 (and e!236225 mapRes!16014))))

(declare-fun condMapEmpty!16014 () Bool)

(declare-fun mapDefault!16014 () ValueCell!4469)

(assert (=> b!389986 (= condMapEmpty!16014 (= (arr!11032 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4469)) mapDefault!16014)))))

(declare-fun b!389987 () Bool)

(declare-fun res!223185 () Bool)

(assert (=> b!389987 (=> (not res!223185) (not e!236223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23133 (_ BitVec 32)) Bool)

(assert (=> b!389987 (= res!223185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389988 () Bool)

(assert (=> b!389988 (= e!236223 e!236227)))

(declare-fun res!223189 () Bool)

(assert (=> b!389988 (=> (not res!223189) (not e!236227))))

(assert (=> b!389988 (= res!223189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183662 mask!970))))

(assert (=> b!389988 (= lt!183662 (array!23134 (store (arr!11031 _keys!658) i!548 k0!778) (size!11384 _keys!658)))))

(declare-fun b!389989 () Bool)

(declare-fun res!223183 () Bool)

(assert (=> b!389989 (=> (not res!223183) (not e!236223))))

(declare-fun arrayContainsKey!0 (array!23133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389989 (= res!223183 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389990 () Bool)

(declare-fun res!223192 () Bool)

(assert (=> b!389990 (=> (not res!223192) (not e!236227))))

(assert (=> b!389990 (= res!223192 (arrayNoDuplicates!0 lt!183662 #b00000000000000000000000000000000 Nil!6352))))

(declare-fun b!389991 () Bool)

(declare-fun res!223187 () Bool)

(assert (=> b!389991 (=> (not res!223187) (not e!236223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389991 (= res!223187 (validKeyInArray!0 k0!778))))

(declare-fun b!389992 () Bool)

(declare-fun res!223190 () Bool)

(assert (=> b!389992 (=> (not res!223190) (not e!236223))))

(assert (=> b!389992 (= res!223190 (or (= (select (arr!11031 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11031 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16014 () Bool)

(assert (=> mapIsEmpty!16014 mapRes!16014))

(assert (= (and start!37926 res!223186) b!389982))

(assert (= (and b!389982 res!223182) b!389987))

(assert (= (and b!389987 res!223185) b!389984))

(assert (= (and b!389984 res!223191) b!389979))

(assert (= (and b!389979 res!223188) b!389991))

(assert (= (and b!389991 res!223187) b!389992))

(assert (= (and b!389992 res!223190) b!389989))

(assert (= (and b!389989 res!223183) b!389988))

(assert (= (and b!389988 res!223189) b!389990))

(assert (= (and b!389990 res!223192) b!389981))

(assert (= (and b!389981 (not res!223184)) b!389983))

(assert (= (and b!389986 condMapEmpty!16014) mapIsEmpty!16014))

(assert (= (and b!389986 (not condMapEmpty!16014)) mapNonEmpty!16014))

(get-info :version)

(assert (= (and mapNonEmpty!16014 ((_ is ValueCellFull!4469) mapValue!16014)) b!389985))

(assert (= (and b!389986 ((_ is ValueCellFull!4469) mapDefault!16014)) b!389980))

(assert (= start!37926 b!389986))

(declare-fun m!385861 () Bool)

(assert (=> b!389981 m!385861))

(declare-fun m!385863 () Bool)

(assert (=> b!389981 m!385863))

(declare-fun m!385865 () Bool)

(assert (=> b!389981 m!385865))

(declare-fun m!385867 () Bool)

(assert (=> b!389981 m!385867))

(declare-fun m!385869 () Bool)

(assert (=> b!389981 m!385869))

(declare-fun m!385871 () Bool)

(assert (=> b!389981 m!385871))

(declare-fun m!385873 () Bool)

(assert (=> b!389981 m!385873))

(declare-fun m!385875 () Bool)

(assert (=> b!389990 m!385875))

(declare-fun m!385877 () Bool)

(assert (=> start!37926 m!385877))

(declare-fun m!385879 () Bool)

(assert (=> start!37926 m!385879))

(declare-fun m!385881 () Bool)

(assert (=> start!37926 m!385881))

(declare-fun m!385883 () Bool)

(assert (=> b!389983 m!385883))

(declare-fun m!385885 () Bool)

(assert (=> b!389984 m!385885))

(declare-fun m!385887 () Bool)

(assert (=> b!389988 m!385887))

(declare-fun m!385889 () Bool)

(assert (=> b!389988 m!385889))

(declare-fun m!385891 () Bool)

(assert (=> b!389991 m!385891))

(declare-fun m!385893 () Bool)

(assert (=> mapNonEmpty!16014 m!385893))

(declare-fun m!385895 () Bool)

(assert (=> b!389987 m!385895))

(declare-fun m!385897 () Bool)

(assert (=> b!389992 m!385897))

(declare-fun m!385899 () Bool)

(assert (=> b!389989 m!385899))

(check-sat (not b!389991) (not start!37926) b_and!16217 (not mapNonEmpty!16014) tp_is_empty!9625 (not b!389988) (not b!389983) (not b!389990) (not b_next!8953) (not b!389989) (not b!389984) (not b!389981) (not b!389987))
(check-sat b_and!16217 (not b_next!8953))
(get-model)

(declare-fun d!72771 () Bool)

(declare-fun e!236274 () Bool)

(assert (=> d!72771 e!236274))

(declare-fun res!223263 () Bool)

(assert (=> d!72771 (=> (not res!223263) (not e!236274))))

(declare-fun lt!183720 () ListLongMap!5411)

(declare-fun contains!2442 (ListLongMap!5411 (_ BitVec 64)) Bool)

(assert (=> d!72771 (= res!223263 (contains!2442 lt!183720 (_1!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lt!183721 () List!6354)

(assert (=> d!72771 (= lt!183720 (ListLongMap!5412 lt!183721))))

(declare-fun lt!183723 () Unit!11926)

(declare-fun lt!183722 () Unit!11926)

(assert (=> d!72771 (= lt!183723 lt!183722)))

(declare-datatypes ((Option!363 0))(
  ( (Some!362 (v!7070 V!13939)) (None!361) )
))
(declare-fun getValueByKey!357 (List!6354 (_ BitVec 64)) Option!363)

(assert (=> d!72771 (= (getValueByKey!357 lt!183721 (_1!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!362 (_2!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lemmaContainsTupThenGetReturnValue!182 (List!6354 (_ BitVec 64) V!13939) Unit!11926)

(assert (=> d!72771 (= lt!183722 (lemmaContainsTupThenGetReturnValue!182 lt!183721 (_1!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun insertStrictlySorted!185 (List!6354 (_ BitVec 64) V!13939) List!6354)

(assert (=> d!72771 (= lt!183721 (insertStrictlySorted!185 (toList!2721 lt!183659) (_1!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72771 (= (+!1041 lt!183659 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) lt!183720)))

(declare-fun b!390081 () Bool)

(declare-fun res!223264 () Bool)

(assert (=> b!390081 (=> (not res!223264) (not e!236274))))

(assert (=> b!390081 (= res!223264 (= (getValueByKey!357 (toList!2721 lt!183720) (_1!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!362 (_2!3265 (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))))

(declare-fun b!390082 () Bool)

(declare-fun contains!2443 (List!6354 tuple2!6508) Bool)

(assert (=> b!390082 (= e!236274 (contains!2443 (toList!2721 lt!183720) (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))

(assert (= (and d!72771 res!223263) b!390081))

(assert (= (and b!390081 res!223264) b!390082))

(declare-fun m!385981 () Bool)

(assert (=> d!72771 m!385981))

(declare-fun m!385983 () Bool)

(assert (=> d!72771 m!385983))

(declare-fun m!385985 () Bool)

(assert (=> d!72771 m!385985))

(declare-fun m!385987 () Bool)

(assert (=> d!72771 m!385987))

(declare-fun m!385989 () Bool)

(assert (=> b!390081 m!385989))

(declare-fun m!385991 () Bool)

(assert (=> b!390082 m!385991))

(assert (=> b!389983 d!72771))

(declare-fun b!390093 () Bool)

(declare-fun e!236285 () Bool)

(declare-fun call!27470 () Bool)

(assert (=> b!390093 (= e!236285 call!27470)))

(declare-fun b!390094 () Bool)

(declare-fun e!236286 () Bool)

(declare-fun contains!2444 (List!6355 (_ BitVec 64)) Bool)

(assert (=> b!390094 (= e!236286 (contains!2444 Nil!6352 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390095 () Bool)

(assert (=> b!390095 (= e!236285 call!27470)))

(declare-fun b!390096 () Bool)

(declare-fun e!236284 () Bool)

(assert (=> b!390096 (= e!236284 e!236285)))

(declare-fun c!54060 () Bool)

(assert (=> b!390096 (= c!54060 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390097 () Bool)

(declare-fun e!236283 () Bool)

(assert (=> b!390097 (= e!236283 e!236284)))

(declare-fun res!223273 () Bool)

(assert (=> b!390097 (=> (not res!223273) (not e!236284))))

(assert (=> b!390097 (= res!223273 (not e!236286))))

(declare-fun res!223272 () Bool)

(assert (=> b!390097 (=> (not res!223272) (not e!236286))))

(assert (=> b!390097 (= res!223272 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27467 () Bool)

(assert (=> bm!27467 (= call!27470 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54060 (Cons!6351 (select (arr!11031 _keys!658) #b00000000000000000000000000000000) Nil!6352) Nil!6352)))))

(declare-fun d!72773 () Bool)

(declare-fun res!223271 () Bool)

(assert (=> d!72773 (=> res!223271 e!236283)))

(assert (=> d!72773 (= res!223271 (bvsge #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(assert (=> d!72773 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6352) e!236283)))

(assert (= (and d!72773 (not res!223271)) b!390097))

(assert (= (and b!390097 res!223272) b!390094))

(assert (= (and b!390097 res!223273) b!390096))

(assert (= (and b!390096 c!54060) b!390093))

(assert (= (and b!390096 (not c!54060)) b!390095))

(assert (= (or b!390093 b!390095) bm!27467))

(declare-fun m!385993 () Bool)

(assert (=> b!390094 m!385993))

(assert (=> b!390094 m!385993))

(declare-fun m!385995 () Bool)

(assert (=> b!390094 m!385995))

(assert (=> b!390096 m!385993))

(assert (=> b!390096 m!385993))

(declare-fun m!385997 () Bool)

(assert (=> b!390096 m!385997))

(assert (=> b!390097 m!385993))

(assert (=> b!390097 m!385993))

(assert (=> b!390097 m!385997))

(assert (=> bm!27467 m!385993))

(declare-fun m!385999 () Bool)

(assert (=> bm!27467 m!385999))

(assert (=> b!389984 d!72773))

(declare-fun d!72775 () Bool)

(declare-fun res!223278 () Bool)

(declare-fun e!236291 () Bool)

(assert (=> d!72775 (=> res!223278 e!236291)))

(assert (=> d!72775 (= res!223278 (= (select (arr!11031 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72775 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236291)))

(declare-fun b!390102 () Bool)

(declare-fun e!236292 () Bool)

(assert (=> b!390102 (= e!236291 e!236292)))

(declare-fun res!223279 () Bool)

(assert (=> b!390102 (=> (not res!223279) (not e!236292))))

(assert (=> b!390102 (= res!223279 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11384 _keys!658)))))

(declare-fun b!390103 () Bool)

(assert (=> b!390103 (= e!236292 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72775 (not res!223278)) b!390102))

(assert (= (and b!390102 res!223279) b!390103))

(assert (=> d!72775 m!385993))

(declare-fun m!386001 () Bool)

(assert (=> b!390103 m!386001))

(assert (=> b!389989 d!72775))

(declare-fun d!72777 () Bool)

(declare-fun res!223285 () Bool)

(declare-fun e!236301 () Bool)

(assert (=> d!72777 (=> res!223285 e!236301)))

(assert (=> d!72777 (= res!223285 (bvsge #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(assert (=> d!72777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236301)))

(declare-fun b!390112 () Bool)

(declare-fun e!236300 () Bool)

(assert (=> b!390112 (= e!236301 e!236300)))

(declare-fun c!54063 () Bool)

(assert (=> b!390112 (= c!54063 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390113 () Bool)

(declare-fun call!27473 () Bool)

(assert (=> b!390113 (= e!236300 call!27473)))

(declare-fun b!390114 () Bool)

(declare-fun e!236299 () Bool)

(assert (=> b!390114 (= e!236299 call!27473)))

(declare-fun bm!27470 () Bool)

(assert (=> bm!27470 (= call!27473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!390115 () Bool)

(assert (=> b!390115 (= e!236300 e!236299)))

(declare-fun lt!183732 () (_ BitVec 64))

(assert (=> b!390115 (= lt!183732 (select (arr!11031 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183730 () Unit!11926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23133 (_ BitVec 64) (_ BitVec 32)) Unit!11926)

(assert (=> b!390115 (= lt!183730 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!183732 #b00000000000000000000000000000000))))

(assert (=> b!390115 (arrayContainsKey!0 _keys!658 lt!183732 #b00000000000000000000000000000000)))

(declare-fun lt!183731 () Unit!11926)

(assert (=> b!390115 (= lt!183731 lt!183730)))

(declare-fun res!223284 () Bool)

(declare-datatypes ((SeekEntryResult!3507 0))(
  ( (MissingZero!3507 (index!16207 (_ BitVec 32))) (Found!3507 (index!16208 (_ BitVec 32))) (Intermediate!3507 (undefined!4319 Bool) (index!16209 (_ BitVec 32)) (x!38283 (_ BitVec 32))) (Undefined!3507) (MissingVacant!3507 (index!16210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23133 (_ BitVec 32)) SeekEntryResult!3507)

(assert (=> b!390115 (= res!223284 (= (seekEntryOrOpen!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3507 #b00000000000000000000000000000000)))))

(assert (=> b!390115 (=> (not res!223284) (not e!236299))))

(assert (= (and d!72777 (not res!223285)) b!390112))

(assert (= (and b!390112 c!54063) b!390115))

(assert (= (and b!390112 (not c!54063)) b!390113))

(assert (= (and b!390115 res!223284) b!390114))

(assert (= (or b!390114 b!390113) bm!27470))

(assert (=> b!390112 m!385993))

(assert (=> b!390112 m!385993))

(assert (=> b!390112 m!385997))

(declare-fun m!386003 () Bool)

(assert (=> bm!27470 m!386003))

(assert (=> b!390115 m!385993))

(declare-fun m!386005 () Bool)

(assert (=> b!390115 m!386005))

(declare-fun m!386007 () Bool)

(assert (=> b!390115 m!386007))

(assert (=> b!390115 m!385993))

(declare-fun m!386009 () Bool)

(assert (=> b!390115 m!386009))

(assert (=> b!389987 d!72777))

(declare-fun d!72779 () Bool)

(declare-fun res!223287 () Bool)

(declare-fun e!236304 () Bool)

(assert (=> d!72779 (=> res!223287 e!236304)))

(assert (=> d!72779 (= res!223287 (bvsge #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(assert (=> d!72779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183662 mask!970) e!236304)))

(declare-fun b!390116 () Bool)

(declare-fun e!236303 () Bool)

(assert (=> b!390116 (= e!236304 e!236303)))

(declare-fun c!54064 () Bool)

(assert (=> b!390116 (= c!54064 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(declare-fun b!390117 () Bool)

(declare-fun call!27474 () Bool)

(assert (=> b!390117 (= e!236303 call!27474)))

(declare-fun b!390118 () Bool)

(declare-fun e!236302 () Bool)

(assert (=> b!390118 (= e!236302 call!27474)))

(declare-fun bm!27471 () Bool)

(assert (=> bm!27471 (= call!27474 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!183662 mask!970))))

(declare-fun b!390119 () Bool)

(assert (=> b!390119 (= e!236303 e!236302)))

(declare-fun lt!183735 () (_ BitVec 64))

(assert (=> b!390119 (= lt!183735 (select (arr!11031 lt!183662) #b00000000000000000000000000000000))))

(declare-fun lt!183733 () Unit!11926)

(assert (=> b!390119 (= lt!183733 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!183662 lt!183735 #b00000000000000000000000000000000))))

(assert (=> b!390119 (arrayContainsKey!0 lt!183662 lt!183735 #b00000000000000000000000000000000)))

(declare-fun lt!183734 () Unit!11926)

(assert (=> b!390119 (= lt!183734 lt!183733)))

(declare-fun res!223286 () Bool)

(assert (=> b!390119 (= res!223286 (= (seekEntryOrOpen!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000) lt!183662 mask!970) (Found!3507 #b00000000000000000000000000000000)))))

(assert (=> b!390119 (=> (not res!223286) (not e!236302))))

(assert (= (and d!72779 (not res!223287)) b!390116))

(assert (= (and b!390116 c!54064) b!390119))

(assert (= (and b!390116 (not c!54064)) b!390117))

(assert (= (and b!390119 res!223286) b!390118))

(assert (= (or b!390118 b!390117) bm!27471))

(declare-fun m!386011 () Bool)

(assert (=> b!390116 m!386011))

(assert (=> b!390116 m!386011))

(declare-fun m!386013 () Bool)

(assert (=> b!390116 m!386013))

(declare-fun m!386015 () Bool)

(assert (=> bm!27471 m!386015))

(assert (=> b!390119 m!386011))

(declare-fun m!386017 () Bool)

(assert (=> b!390119 m!386017))

(declare-fun m!386019 () Bool)

(assert (=> b!390119 m!386019))

(assert (=> b!390119 m!386011))

(declare-fun m!386021 () Bool)

(assert (=> b!390119 m!386021))

(assert (=> b!389988 d!72779))

(declare-fun d!72781 () Bool)

(assert (=> d!72781 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389991 d!72781))

(declare-fun d!72783 () Bool)

(assert (=> d!72783 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37926 d!72783))

(declare-fun d!72785 () Bool)

(assert (=> d!72785 (= (array_inv!8104 _values!506) (bvsge (size!11385 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37926 d!72785))

(declare-fun d!72787 () Bool)

(assert (=> d!72787 (= (array_inv!8105 _keys!658) (bvsge (size!11384 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37926 d!72787))

(declare-fun b!390120 () Bool)

(declare-fun e!236307 () Bool)

(declare-fun call!27475 () Bool)

(assert (=> b!390120 (= e!236307 call!27475)))

(declare-fun b!390121 () Bool)

(declare-fun e!236308 () Bool)

(assert (=> b!390121 (= e!236308 (contains!2444 Nil!6352 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(declare-fun b!390122 () Bool)

(assert (=> b!390122 (= e!236307 call!27475)))

(declare-fun b!390123 () Bool)

(declare-fun e!236306 () Bool)

(assert (=> b!390123 (= e!236306 e!236307)))

(declare-fun c!54065 () Bool)

(assert (=> b!390123 (= c!54065 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(declare-fun b!390124 () Bool)

(declare-fun e!236305 () Bool)

(assert (=> b!390124 (= e!236305 e!236306)))

(declare-fun res!223290 () Bool)

(assert (=> b!390124 (=> (not res!223290) (not e!236306))))

(assert (=> b!390124 (= res!223290 (not e!236308))))

(declare-fun res!223289 () Bool)

(assert (=> b!390124 (=> (not res!223289) (not e!236308))))

(assert (=> b!390124 (= res!223289 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(declare-fun bm!27472 () Bool)

(assert (=> bm!27472 (= call!27475 (arrayNoDuplicates!0 lt!183662 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54065 (Cons!6351 (select (arr!11031 lt!183662) #b00000000000000000000000000000000) Nil!6352) Nil!6352)))))

(declare-fun d!72789 () Bool)

(declare-fun res!223288 () Bool)

(assert (=> d!72789 (=> res!223288 e!236305)))

(assert (=> d!72789 (= res!223288 (bvsge #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(assert (=> d!72789 (= (arrayNoDuplicates!0 lt!183662 #b00000000000000000000000000000000 Nil!6352) e!236305)))

(assert (= (and d!72789 (not res!223288)) b!390124))

(assert (= (and b!390124 res!223289) b!390121))

(assert (= (and b!390124 res!223290) b!390123))

(assert (= (and b!390123 c!54065) b!390120))

(assert (= (and b!390123 (not c!54065)) b!390122))

(assert (= (or b!390120 b!390122) bm!27472))

(assert (=> b!390121 m!386011))

(assert (=> b!390121 m!386011))

(declare-fun m!386023 () Bool)

(assert (=> b!390121 m!386023))

(assert (=> b!390123 m!386011))

(assert (=> b!390123 m!386011))

(assert (=> b!390123 m!386013))

(assert (=> b!390124 m!386011))

(assert (=> b!390124 m!386011))

(assert (=> b!390124 m!386013))

(assert (=> bm!27472 m!386011))

(declare-fun m!386025 () Bool)

(assert (=> bm!27472 m!386025))

(assert (=> b!389990 d!72789))

(declare-fun b!390149 () Bool)

(declare-fun e!236329 () Bool)

(declare-fun lt!183754 () ListLongMap!5411)

(declare-fun isEmpty!551 (ListLongMap!5411) Bool)

(assert (=> b!390149 (= e!236329 (isEmpty!551 lt!183754))))

(declare-fun d!72791 () Bool)

(declare-fun e!236326 () Bool)

(assert (=> d!72791 e!236326))

(declare-fun res!223300 () Bool)

(assert (=> d!72791 (=> (not res!223300) (not e!236326))))

(assert (=> d!72791 (= res!223300 (not (contains!2442 lt!183754 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236323 () ListLongMap!5411)

(assert (=> d!72791 (= lt!183754 e!236323)))

(declare-fun c!54074 () Bool)

(assert (=> d!72791 (= c!54074 (bvsge #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(assert (=> d!72791 (validMask!0 mask!970)))

(assert (=> d!72791 (= (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183754)))

(declare-fun b!390150 () Bool)

(assert (=> b!390150 (= e!236323 (ListLongMap!5412 Nil!6351))))

(declare-fun b!390151 () Bool)

(declare-fun e!236328 () Bool)

(declare-fun e!236327 () Bool)

(assert (=> b!390151 (= e!236328 e!236327)))

(assert (=> b!390151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(declare-fun res!223299 () Bool)

(assert (=> b!390151 (= res!223299 (contains!2442 lt!183754 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390151 (=> (not res!223299) (not e!236327))))

(declare-fun b!390152 () Bool)

(declare-fun res!223302 () Bool)

(assert (=> b!390152 (=> (not res!223302) (not e!236326))))

(assert (=> b!390152 (= res!223302 (not (contains!2442 lt!183754 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390153 () Bool)

(assert (=> b!390153 (= e!236326 e!236328)))

(declare-fun c!54075 () Bool)

(declare-fun e!236324 () Bool)

(assert (=> b!390153 (= c!54075 e!236324)))

(declare-fun res!223301 () Bool)

(assert (=> b!390153 (=> (not res!223301) (not e!236324))))

(assert (=> b!390153 (= res!223301 (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(declare-fun b!390154 () Bool)

(assert (=> b!390154 (= e!236329 (= lt!183754 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390155 () Bool)

(assert (=> b!390155 (= e!236324 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390155 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390156 () Bool)

(declare-fun lt!183756 () Unit!11926)

(declare-fun lt!183752 () Unit!11926)

(assert (=> b!390156 (= lt!183756 lt!183752)))

(declare-fun lt!183751 () (_ BitVec 64))

(declare-fun lt!183755 () (_ BitVec 64))

(declare-fun lt!183750 () ListLongMap!5411)

(declare-fun lt!183753 () V!13939)

(assert (=> b!390156 (not (contains!2442 (+!1041 lt!183750 (tuple2!6509 lt!183751 lt!183753)) lt!183755))))

(declare-fun addStillNotContains!135 (ListLongMap!5411 (_ BitVec 64) V!13939 (_ BitVec 64)) Unit!11926)

(assert (=> b!390156 (= lt!183752 (addStillNotContains!135 lt!183750 lt!183751 lt!183753 lt!183755))))

(assert (=> b!390156 (= lt!183755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5577 (ValueCell!4469 V!13939) V!13939)

(declare-fun dynLambda!635 (Int (_ BitVec 64)) V!13939)

(assert (=> b!390156 (= lt!183753 (get!5577 (select (arr!11032 _values!506) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390156 (= lt!183751 (select (arr!11031 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27478 () ListLongMap!5411)

(assert (=> b!390156 (= lt!183750 call!27478)))

(declare-fun e!236325 () ListLongMap!5411)

(assert (=> b!390156 (= e!236325 (+!1041 call!27478 (tuple2!6509 (select (arr!11031 _keys!658) #b00000000000000000000000000000000) (get!5577 (select (arr!11032 _values!506) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390157 () Bool)

(assert (=> b!390157 (= e!236325 call!27478)))

(declare-fun b!390158 () Bool)

(assert (=> b!390158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(assert (=> b!390158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11385 _values!506)))))

(declare-fun apply!301 (ListLongMap!5411 (_ BitVec 64)) V!13939)

(assert (=> b!390158 (= e!236327 (= (apply!301 lt!183754 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)) (get!5577 (select (arr!11032 _values!506) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390159 () Bool)

(assert (=> b!390159 (= e!236328 e!236329)))

(declare-fun c!54076 () Bool)

(assert (=> b!390159 (= c!54076 (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(declare-fun bm!27475 () Bool)

(assert (=> bm!27475 (= call!27478 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390160 () Bool)

(assert (=> b!390160 (= e!236323 e!236325)))

(declare-fun c!54077 () Bool)

(assert (=> b!390160 (= c!54077 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72791 c!54074) b!390150))

(assert (= (and d!72791 (not c!54074)) b!390160))

(assert (= (and b!390160 c!54077) b!390156))

(assert (= (and b!390160 (not c!54077)) b!390157))

(assert (= (or b!390156 b!390157) bm!27475))

(assert (= (and d!72791 res!223300) b!390152))

(assert (= (and b!390152 res!223302) b!390153))

(assert (= (and b!390153 res!223301) b!390155))

(assert (= (and b!390153 c!54075) b!390151))

(assert (= (and b!390153 (not c!54075)) b!390159))

(assert (= (and b!390151 res!223299) b!390158))

(assert (= (and b!390159 c!54076) b!390154))

(assert (= (and b!390159 (not c!54076)) b!390149))

(declare-fun b_lambda!8605 () Bool)

(assert (=> (not b_lambda!8605) (not b!390156)))

(declare-fun t!11509 () Bool)

(declare-fun tb!3109 () Bool)

(assert (=> (and start!37926 (= defaultEntry!514 defaultEntry!514) t!11509) tb!3109))

(declare-fun result!5723 () Bool)

(assert (=> tb!3109 (= result!5723 tp_is_empty!9625)))

(assert (=> b!390156 t!11509))

(declare-fun b_and!16223 () Bool)

(assert (= b_and!16217 (and (=> t!11509 result!5723) b_and!16223)))

(declare-fun b_lambda!8607 () Bool)

(assert (=> (not b_lambda!8607) (not b!390158)))

(assert (=> b!390158 t!11509))

(declare-fun b_and!16225 () Bool)

(assert (= b_and!16223 (and (=> t!11509 result!5723) b_and!16225)))

(assert (=> b!390155 m!385993))

(assert (=> b!390155 m!385993))

(assert (=> b!390155 m!385997))

(declare-fun m!386027 () Bool)

(assert (=> b!390156 m!386027))

(declare-fun m!386029 () Bool)

(assert (=> b!390156 m!386029))

(declare-fun m!386031 () Bool)

(assert (=> b!390156 m!386031))

(declare-fun m!386033 () Bool)

(assert (=> b!390156 m!386033))

(assert (=> b!390156 m!386031))

(declare-fun m!386035 () Bool)

(assert (=> b!390156 m!386035))

(declare-fun m!386037 () Bool)

(assert (=> b!390156 m!386037))

(declare-fun m!386039 () Bool)

(assert (=> b!390156 m!386039))

(assert (=> b!390156 m!385993))

(assert (=> b!390156 m!386033))

(assert (=> b!390156 m!386037))

(declare-fun m!386041 () Bool)

(assert (=> b!390152 m!386041))

(assert (=> b!390151 m!385993))

(assert (=> b!390151 m!385993))

(declare-fun m!386043 () Bool)

(assert (=> b!390151 m!386043))

(assert (=> b!390158 m!386031))

(assert (=> b!390158 m!386033))

(assert (=> b!390158 m!386031))

(assert (=> b!390158 m!386035))

(assert (=> b!390158 m!385993))

(assert (=> b!390158 m!386033))

(assert (=> b!390158 m!385993))

(declare-fun m!386045 () Bool)

(assert (=> b!390158 m!386045))

(declare-fun m!386047 () Bool)

(assert (=> d!72791 m!386047))

(assert (=> d!72791 m!385877))

(assert (=> b!390160 m!385993))

(assert (=> b!390160 m!385993))

(assert (=> b!390160 m!385997))

(declare-fun m!386049 () Bool)

(assert (=> b!390154 m!386049))

(assert (=> bm!27475 m!386049))

(declare-fun m!386051 () Bool)

(assert (=> b!390149 m!386051))

(assert (=> b!389981 d!72791))

(declare-fun b!390205 () Bool)

(declare-fun e!236363 () Unit!11926)

(declare-fun Unit!11932 () Unit!11926)

(assert (=> b!390205 (= e!236363 Unit!11932)))

(declare-fun b!390206 () Bool)

(declare-fun res!223326 () Bool)

(declare-fun e!236368 () Bool)

(assert (=> b!390206 (=> (not res!223326) (not e!236368))))

(declare-fun e!236361 () Bool)

(assert (=> b!390206 (= res!223326 e!236361)))

(declare-fun c!54095 () Bool)

(assert (=> b!390206 (= c!54095 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27490 () Bool)

(declare-fun call!27495 () ListLongMap!5411)

(declare-fun call!27499 () ListLongMap!5411)

(assert (=> bm!27490 (= call!27495 call!27499)))

(declare-fun b!390207 () Bool)

(declare-fun e!236367 () ListLongMap!5411)

(assert (=> b!390207 (= e!236367 call!27495)))

(declare-fun b!390208 () Bool)

(declare-fun e!236358 () Bool)

(assert (=> b!390208 (= e!236358 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun e!236359 () Bool)

(declare-fun b!390209 () Bool)

(declare-fun lt!183808 () ListLongMap!5411)

(assert (=> b!390209 (= e!236359 (= (apply!301 lt!183808 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)) (get!5577 (select (arr!11032 _values!506) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11385 _values!506)))))

(assert (=> b!390209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(declare-fun bm!27491 () Bool)

(declare-fun call!27497 () ListLongMap!5411)

(declare-fun call!27493 () ListLongMap!5411)

(assert (=> bm!27491 (= call!27497 call!27493)))

(declare-fun b!390210 () Bool)

(declare-fun lt!183803 () Unit!11926)

(assert (=> b!390210 (= e!236363 lt!183803)))

(declare-fun lt!183817 () ListLongMap!5411)

(assert (=> b!390210 (= lt!183817 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183814 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183816 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183816 (select (arr!11031 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183822 () Unit!11926)

(declare-fun addStillContains!277 (ListLongMap!5411 (_ BitVec 64) V!13939 (_ BitVec 64)) Unit!11926)

(assert (=> b!390210 (= lt!183822 (addStillContains!277 lt!183817 lt!183814 zeroValue!472 lt!183816))))

(assert (=> b!390210 (contains!2442 (+!1041 lt!183817 (tuple2!6509 lt!183814 zeroValue!472)) lt!183816)))

(declare-fun lt!183811 () Unit!11926)

(assert (=> b!390210 (= lt!183811 lt!183822)))

(declare-fun lt!183802 () ListLongMap!5411)

(assert (=> b!390210 (= lt!183802 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183820 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183820 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183819 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183819 (select (arr!11031 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183806 () Unit!11926)

(declare-fun addApplyDifferent!277 (ListLongMap!5411 (_ BitVec 64) V!13939 (_ BitVec 64)) Unit!11926)

(assert (=> b!390210 (= lt!183806 (addApplyDifferent!277 lt!183802 lt!183820 minValue!472 lt!183819))))

(assert (=> b!390210 (= (apply!301 (+!1041 lt!183802 (tuple2!6509 lt!183820 minValue!472)) lt!183819) (apply!301 lt!183802 lt!183819))))

(declare-fun lt!183801 () Unit!11926)

(assert (=> b!390210 (= lt!183801 lt!183806)))

(declare-fun lt!183810 () ListLongMap!5411)

(assert (=> b!390210 (= lt!183810 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183818 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183818 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183804 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183804 (select (arr!11031 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183812 () Unit!11926)

(assert (=> b!390210 (= lt!183812 (addApplyDifferent!277 lt!183810 lt!183818 zeroValue!472 lt!183804))))

(assert (=> b!390210 (= (apply!301 (+!1041 lt!183810 (tuple2!6509 lt!183818 zeroValue!472)) lt!183804) (apply!301 lt!183810 lt!183804))))

(declare-fun lt!183815 () Unit!11926)

(assert (=> b!390210 (= lt!183815 lt!183812)))

(declare-fun lt!183821 () ListLongMap!5411)

(assert (=> b!390210 (= lt!183821 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183807 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183813 () (_ BitVec 64))

(assert (=> b!390210 (= lt!183813 (select (arr!11031 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390210 (= lt!183803 (addApplyDifferent!277 lt!183821 lt!183807 minValue!472 lt!183813))))

(assert (=> b!390210 (= (apply!301 (+!1041 lt!183821 (tuple2!6509 lt!183807 minValue!472)) lt!183813) (apply!301 lt!183821 lt!183813))))

(declare-fun b!390211 () Bool)

(declare-fun e!236364 () Bool)

(assert (=> b!390211 (= e!236364 (= (apply!301 lt!183808 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390212 () Bool)

(declare-fun e!236356 () ListLongMap!5411)

(assert (=> b!390212 (= e!236356 call!27495)))

(declare-fun b!390213 () Bool)

(declare-fun e!236360 () Bool)

(assert (=> b!390213 (= e!236368 e!236360)))

(declare-fun c!54090 () Bool)

(assert (=> b!390213 (= c!54090 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390214 () Bool)

(declare-fun res!223323 () Bool)

(assert (=> b!390214 (=> (not res!223323) (not e!236368))))

(declare-fun e!236366 () Bool)

(assert (=> b!390214 (= res!223323 e!236366)))

(declare-fun res!223322 () Bool)

(assert (=> b!390214 (=> res!223322 e!236366)))

(assert (=> b!390214 (= res!223322 (not e!236358))))

(declare-fun res!223324 () Bool)

(assert (=> b!390214 (=> (not res!223324) (not e!236358))))

(assert (=> b!390214 (= res!223324 (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(declare-fun bm!27492 () Bool)

(declare-fun c!54092 () Bool)

(declare-fun call!27494 () ListLongMap!5411)

(declare-fun c!54093 () Bool)

(assert (=> bm!27492 (= call!27499 (+!1041 (ite c!54093 call!27494 (ite c!54092 call!27493 call!27497)) (ite (or c!54093 c!54092) (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390215 () Bool)

(declare-fun e!236362 () Bool)

(assert (=> b!390215 (= e!236361 e!236362)))

(declare-fun res!223325 () Bool)

(declare-fun call!27498 () Bool)

(assert (=> b!390215 (= res!223325 call!27498)))

(assert (=> b!390215 (=> (not res!223325) (not e!236362))))

(declare-fun b!390216 () Bool)

(declare-fun call!27496 () Bool)

(assert (=> b!390216 (= e!236360 (not call!27496))))

(declare-fun b!390217 () Bool)

(declare-fun c!54094 () Bool)

(assert (=> b!390217 (= c!54094 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!390217 (= e!236356 e!236367)))

(declare-fun b!390218 () Bool)

(assert (=> b!390218 (= e!236360 e!236364)))

(declare-fun res!223329 () Bool)

(assert (=> b!390218 (= res!223329 call!27496)))

(assert (=> b!390218 (=> (not res!223329) (not e!236364))))

(declare-fun b!390219 () Bool)

(assert (=> b!390219 (= e!236362 (= (apply!301 lt!183808 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390220 () Bool)

(declare-fun e!236357 () ListLongMap!5411)

(assert (=> b!390220 (= e!236357 (+!1041 call!27499 (tuple2!6509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390221 () Bool)

(assert (=> b!390221 (= e!236357 e!236356)))

(assert (=> b!390221 (= c!54092 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390222 () Bool)

(assert (=> b!390222 (= e!236361 (not call!27498))))

(declare-fun bm!27493 () Bool)

(assert (=> bm!27493 (= call!27498 (contains!2442 lt!183808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390223 () Bool)

(assert (=> b!390223 (= e!236366 e!236359)))

(declare-fun res!223321 () Bool)

(assert (=> b!390223 (=> (not res!223321) (not e!236359))))

(assert (=> b!390223 (= res!223321 (contains!2442 lt!183808 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390223 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(declare-fun bm!27494 () Bool)

(assert (=> bm!27494 (= call!27494 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390224 () Bool)

(assert (=> b!390224 (= e!236367 call!27497)))

(declare-fun d!72793 () Bool)

(assert (=> d!72793 e!236368))

(declare-fun res!223328 () Bool)

(assert (=> d!72793 (=> (not res!223328) (not e!236368))))

(assert (=> d!72793 (= res!223328 (or (bvsge #b00000000000000000000000000000000 (size!11384 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))))

(declare-fun lt!183805 () ListLongMap!5411)

(assert (=> d!72793 (= lt!183808 lt!183805)))

(declare-fun lt!183809 () Unit!11926)

(assert (=> d!72793 (= lt!183809 e!236363)))

(declare-fun c!54091 () Bool)

(declare-fun e!236365 () Bool)

(assert (=> d!72793 (= c!54091 e!236365)))

(declare-fun res!223327 () Bool)

(assert (=> d!72793 (=> (not res!223327) (not e!236365))))

(assert (=> d!72793 (= res!223327 (bvslt #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(assert (=> d!72793 (= lt!183805 e!236357)))

(assert (=> d!72793 (= c!54093 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72793 (validMask!0 mask!970)))

(assert (=> d!72793 (= (getCurrentListMap!2047 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183808)))

(declare-fun bm!27495 () Bool)

(assert (=> bm!27495 (= call!27493 call!27494)))

(declare-fun b!390225 () Bool)

(assert (=> b!390225 (= e!236365 (validKeyInArray!0 (select (arr!11031 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27496 () Bool)

(assert (=> bm!27496 (= call!27496 (contains!2442 lt!183808 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72793 c!54093) b!390220))

(assert (= (and d!72793 (not c!54093)) b!390221))

(assert (= (and b!390221 c!54092) b!390212))

(assert (= (and b!390221 (not c!54092)) b!390217))

(assert (= (and b!390217 c!54094) b!390207))

(assert (= (and b!390217 (not c!54094)) b!390224))

(assert (= (or b!390207 b!390224) bm!27491))

(assert (= (or b!390212 bm!27491) bm!27495))

(assert (= (or b!390212 b!390207) bm!27490))

(assert (= (or b!390220 bm!27495) bm!27494))

(assert (= (or b!390220 bm!27490) bm!27492))

(assert (= (and d!72793 res!223327) b!390225))

(assert (= (and d!72793 c!54091) b!390210))

(assert (= (and d!72793 (not c!54091)) b!390205))

(assert (= (and d!72793 res!223328) b!390214))

(assert (= (and b!390214 res!223324) b!390208))

(assert (= (and b!390214 (not res!223322)) b!390223))

(assert (= (and b!390223 res!223321) b!390209))

(assert (= (and b!390214 res!223323) b!390206))

(assert (= (and b!390206 c!54095) b!390215))

(assert (= (and b!390206 (not c!54095)) b!390222))

(assert (= (and b!390215 res!223325) b!390219))

(assert (= (or b!390215 b!390222) bm!27493))

(assert (= (and b!390206 res!223326) b!390213))

(assert (= (and b!390213 c!54090) b!390218))

(assert (= (and b!390213 (not c!54090)) b!390216))

(assert (= (and b!390218 res!223329) b!390211))

(assert (= (or b!390218 b!390216) bm!27496))

(declare-fun b_lambda!8609 () Bool)

(assert (=> (not b_lambda!8609) (not b!390209)))

(assert (=> b!390209 t!11509))

(declare-fun b_and!16227 () Bool)

(assert (= b_and!16225 (and (=> t!11509 result!5723) b_and!16227)))

(declare-fun m!386053 () Bool)

(assert (=> b!390220 m!386053))

(assert (=> b!390225 m!385993))

(assert (=> b!390225 m!385993))

(assert (=> b!390225 m!385997))

(assert (=> d!72793 m!385877))

(assert (=> b!390209 m!385993))

(assert (=> b!390209 m!386033))

(assert (=> b!390209 m!386031))

(assert (=> b!390209 m!386035))

(assert (=> b!390209 m!385993))

(declare-fun m!386055 () Bool)

(assert (=> b!390209 m!386055))

(assert (=> b!390209 m!386031))

(assert (=> b!390209 m!386033))

(assert (=> bm!27494 m!385863))

(declare-fun m!386057 () Bool)

(assert (=> b!390219 m!386057))

(declare-fun m!386059 () Bool)

(assert (=> bm!27493 m!386059))

(assert (=> b!390208 m!385993))

(assert (=> b!390208 m!385993))

(assert (=> b!390208 m!385997))

(declare-fun m!386061 () Bool)

(assert (=> bm!27492 m!386061))

(declare-fun m!386063 () Bool)

(assert (=> b!390210 m!386063))

(declare-fun m!386065 () Bool)

(assert (=> b!390210 m!386065))

(declare-fun m!386067 () Bool)

(assert (=> b!390210 m!386067))

(declare-fun m!386069 () Bool)

(assert (=> b!390210 m!386069))

(declare-fun m!386071 () Bool)

(assert (=> b!390210 m!386071))

(assert (=> b!390210 m!386065))

(declare-fun m!386073 () Bool)

(assert (=> b!390210 m!386073))

(assert (=> b!390210 m!385863))

(assert (=> b!390210 m!386069))

(declare-fun m!386075 () Bool)

(assert (=> b!390210 m!386075))

(declare-fun m!386077 () Bool)

(assert (=> b!390210 m!386077))

(declare-fun m!386079 () Bool)

(assert (=> b!390210 m!386079))

(declare-fun m!386081 () Bool)

(assert (=> b!390210 m!386081))

(declare-fun m!386083 () Bool)

(assert (=> b!390210 m!386083))

(assert (=> b!390210 m!386077))

(declare-fun m!386085 () Bool)

(assert (=> b!390210 m!386085))

(assert (=> b!390210 m!385993))

(declare-fun m!386087 () Bool)

(assert (=> b!390210 m!386087))

(declare-fun m!386089 () Bool)

(assert (=> b!390210 m!386089))

(assert (=> b!390210 m!386067))

(declare-fun m!386091 () Bool)

(assert (=> b!390210 m!386091))

(assert (=> b!390223 m!385993))

(assert (=> b!390223 m!385993))

(declare-fun m!386093 () Bool)

(assert (=> b!390223 m!386093))

(declare-fun m!386095 () Bool)

(assert (=> b!390211 m!386095))

(declare-fun m!386097 () Bool)

(assert (=> bm!27496 m!386097))

(assert (=> b!389981 d!72793))

(declare-fun b!390226 () Bool)

(declare-fun e!236375 () Bool)

(declare-fun lt!183827 () ListLongMap!5411)

(assert (=> b!390226 (= e!236375 (isEmpty!551 lt!183827))))

(declare-fun d!72795 () Bool)

(declare-fun e!236372 () Bool)

(assert (=> d!72795 e!236372))

(declare-fun res!223331 () Bool)

(assert (=> d!72795 (=> (not res!223331) (not e!236372))))

(assert (=> d!72795 (= res!223331 (not (contains!2442 lt!183827 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236369 () ListLongMap!5411)

(assert (=> d!72795 (= lt!183827 e!236369)))

(declare-fun c!54096 () Bool)

(assert (=> d!72795 (= c!54096 (bvsge #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(assert (=> d!72795 (validMask!0 mask!970)))

(assert (=> d!72795 (= (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183827)))

(declare-fun b!390227 () Bool)

(assert (=> b!390227 (= e!236369 (ListLongMap!5412 Nil!6351))))

(declare-fun b!390228 () Bool)

(declare-fun e!236374 () Bool)

(declare-fun e!236373 () Bool)

(assert (=> b!390228 (= e!236374 e!236373)))

(assert (=> b!390228 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(declare-fun res!223330 () Bool)

(assert (=> b!390228 (= res!223330 (contains!2442 lt!183827 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(assert (=> b!390228 (=> (not res!223330) (not e!236373))))

(declare-fun b!390229 () Bool)

(declare-fun res!223333 () Bool)

(assert (=> b!390229 (=> (not res!223333) (not e!236372))))

(assert (=> b!390229 (= res!223333 (not (contains!2442 lt!183827 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390230 () Bool)

(assert (=> b!390230 (= e!236372 e!236374)))

(declare-fun c!54097 () Bool)

(declare-fun e!236370 () Bool)

(assert (=> b!390230 (= c!54097 e!236370)))

(declare-fun res!223332 () Bool)

(assert (=> b!390230 (=> (not res!223332) (not e!236370))))

(assert (=> b!390230 (= res!223332 (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(declare-fun b!390231 () Bool)

(assert (=> b!390231 (= e!236375 (= lt!183827 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390232 () Bool)

(assert (=> b!390232 (= e!236370 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(assert (=> b!390232 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390233 () Bool)

(declare-fun lt!183829 () Unit!11926)

(declare-fun lt!183825 () Unit!11926)

(assert (=> b!390233 (= lt!183829 lt!183825)))

(declare-fun lt!183826 () V!13939)

(declare-fun lt!183824 () (_ BitVec 64))

(declare-fun lt!183823 () ListLongMap!5411)

(declare-fun lt!183828 () (_ BitVec 64))

(assert (=> b!390233 (not (contains!2442 (+!1041 lt!183823 (tuple2!6509 lt!183824 lt!183826)) lt!183828))))

(assert (=> b!390233 (= lt!183825 (addStillNotContains!135 lt!183823 lt!183824 lt!183826 lt!183828))))

(assert (=> b!390233 (= lt!183828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390233 (= lt!183826 (get!5577 (select (arr!11032 lt!183663) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390233 (= lt!183824 (select (arr!11031 lt!183662) #b00000000000000000000000000000000))))

(declare-fun call!27500 () ListLongMap!5411)

(assert (=> b!390233 (= lt!183823 call!27500)))

(declare-fun e!236371 () ListLongMap!5411)

(assert (=> b!390233 (= e!236371 (+!1041 call!27500 (tuple2!6509 (select (arr!11031 lt!183662) #b00000000000000000000000000000000) (get!5577 (select (arr!11032 lt!183663) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390234 () Bool)

(assert (=> b!390234 (= e!236371 call!27500)))

(declare-fun b!390235 () Bool)

(assert (=> b!390235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(assert (=> b!390235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11385 lt!183663)))))

(assert (=> b!390235 (= e!236373 (= (apply!301 lt!183827 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)) (get!5577 (select (arr!11032 lt!183663) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390236 () Bool)

(assert (=> b!390236 (= e!236374 e!236375)))

(declare-fun c!54098 () Bool)

(assert (=> b!390236 (= c!54098 (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(declare-fun bm!27497 () Bool)

(assert (=> bm!27497 (= call!27500 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390237 () Bool)

(assert (=> b!390237 (= e!236369 e!236371)))

(declare-fun c!54099 () Bool)

(assert (=> b!390237 (= c!54099 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(assert (= (and d!72795 c!54096) b!390227))

(assert (= (and d!72795 (not c!54096)) b!390237))

(assert (= (and b!390237 c!54099) b!390233))

(assert (= (and b!390237 (not c!54099)) b!390234))

(assert (= (or b!390233 b!390234) bm!27497))

(assert (= (and d!72795 res!223331) b!390229))

(assert (= (and b!390229 res!223333) b!390230))

(assert (= (and b!390230 res!223332) b!390232))

(assert (= (and b!390230 c!54097) b!390228))

(assert (= (and b!390230 (not c!54097)) b!390236))

(assert (= (and b!390228 res!223330) b!390235))

(assert (= (and b!390236 c!54098) b!390231))

(assert (= (and b!390236 (not c!54098)) b!390226))

(declare-fun b_lambda!8611 () Bool)

(assert (=> (not b_lambda!8611) (not b!390233)))

(assert (=> b!390233 t!11509))

(declare-fun b_and!16229 () Bool)

(assert (= b_and!16227 (and (=> t!11509 result!5723) b_and!16229)))

(declare-fun b_lambda!8613 () Bool)

(assert (=> (not b_lambda!8613) (not b!390235)))

(assert (=> b!390235 t!11509))

(declare-fun b_and!16231 () Bool)

(assert (= b_and!16229 (and (=> t!11509 result!5723) b_and!16231)))

(assert (=> b!390232 m!386011))

(assert (=> b!390232 m!386011))

(assert (=> b!390232 m!386013))

(declare-fun m!386099 () Bool)

(assert (=> b!390233 m!386099))

(declare-fun m!386101 () Bool)

(assert (=> b!390233 m!386101))

(assert (=> b!390233 m!386031))

(declare-fun m!386103 () Bool)

(assert (=> b!390233 m!386103))

(assert (=> b!390233 m!386031))

(declare-fun m!386105 () Bool)

(assert (=> b!390233 m!386105))

(declare-fun m!386107 () Bool)

(assert (=> b!390233 m!386107))

(declare-fun m!386109 () Bool)

(assert (=> b!390233 m!386109))

(assert (=> b!390233 m!386011))

(assert (=> b!390233 m!386103))

(assert (=> b!390233 m!386107))

(declare-fun m!386111 () Bool)

(assert (=> b!390229 m!386111))

(assert (=> b!390228 m!386011))

(assert (=> b!390228 m!386011))

(declare-fun m!386113 () Bool)

(assert (=> b!390228 m!386113))

(assert (=> b!390235 m!386031))

(assert (=> b!390235 m!386103))

(assert (=> b!390235 m!386031))

(assert (=> b!390235 m!386105))

(assert (=> b!390235 m!386011))

(assert (=> b!390235 m!386103))

(assert (=> b!390235 m!386011))

(declare-fun m!386115 () Bool)

(assert (=> b!390235 m!386115))

(declare-fun m!386117 () Bool)

(assert (=> d!72795 m!386117))

(assert (=> d!72795 m!385877))

(assert (=> b!390237 m!386011))

(assert (=> b!390237 m!386011))

(assert (=> b!390237 m!386013))

(declare-fun m!386119 () Bool)

(assert (=> b!390231 m!386119))

(assert (=> bm!27497 m!386119))

(declare-fun m!386121 () Bool)

(assert (=> b!390226 m!386121))

(assert (=> b!389981 d!72795))

(declare-fun b!390244 () Bool)

(declare-fun e!236381 () Bool)

(declare-fun e!236380 () Bool)

(assert (=> b!390244 (= e!236381 e!236380)))

(declare-fun c!54102 () Bool)

(assert (=> b!390244 (= c!54102 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!390245 () Bool)

(declare-fun call!27505 () ListLongMap!5411)

(declare-fun call!27506 () ListLongMap!5411)

(assert (=> b!390245 (= e!236380 (= call!27505 call!27506))))

(declare-fun bm!27502 () Bool)

(assert (=> bm!27502 (= call!27505 (getCurrentListMapNoExtraKeys!957 (array!23134 (store (arr!11031 _keys!658) i!548 k0!778) (size!11384 _keys!658)) (array!23136 (store (arr!11032 _values!506) i!548 (ValueCellFull!4469 v!373)) (size!11385 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!72797 () Bool)

(assert (=> d!72797 e!236381))

(declare-fun res!223336 () Bool)

(assert (=> d!72797 (=> (not res!223336) (not e!236381))))

(assert (=> d!72797 (= res!223336 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11384 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11385 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11384 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11385 _values!506))))))))

(declare-fun lt!183832 () Unit!11926)

(declare-fun choose!1323 (array!23133 array!23135 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) (_ BitVec 64) V!13939 (_ BitVec 32) Int) Unit!11926)

(assert (=> d!72797 (= lt!183832 (choose!1323 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11384 _keys!658)))))

(assert (=> d!72797 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!248 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183832)))

(declare-fun b!390246 () Bool)

(assert (=> b!390246 (= e!236380 (= call!27505 (+!1041 call!27506 (tuple2!6509 k0!778 v!373))))))

(declare-fun bm!27503 () Bool)

(assert (=> bm!27503 (= call!27506 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72797 res!223336) b!390244))

(assert (= (and b!390244 c!54102) b!390246))

(assert (= (and b!390244 (not c!54102)) b!390245))

(assert (= (or b!390246 b!390245) bm!27503))

(assert (= (or b!390246 b!390245) bm!27502))

(assert (=> bm!27502 m!385889))

(assert (=> bm!27502 m!385873))

(declare-fun m!386123 () Bool)

(assert (=> bm!27502 m!386123))

(declare-fun m!386125 () Bool)

(assert (=> d!72797 m!386125))

(declare-fun m!386127 () Bool)

(assert (=> b!390246 m!386127))

(assert (=> bm!27503 m!385863))

(assert (=> b!389981 d!72797))

(declare-fun d!72799 () Bool)

(declare-fun e!236382 () Bool)

(assert (=> d!72799 e!236382))

(declare-fun res!223337 () Bool)

(assert (=> d!72799 (=> (not res!223337) (not e!236382))))

(declare-fun lt!183833 () ListLongMap!5411)

(assert (=> d!72799 (= res!223337 (contains!2442 lt!183833 (_1!3265 (tuple2!6509 k0!778 v!373))))))

(declare-fun lt!183834 () List!6354)

(assert (=> d!72799 (= lt!183833 (ListLongMap!5412 lt!183834))))

(declare-fun lt!183836 () Unit!11926)

(declare-fun lt!183835 () Unit!11926)

(assert (=> d!72799 (= lt!183836 lt!183835)))

(assert (=> d!72799 (= (getValueByKey!357 lt!183834 (_1!3265 (tuple2!6509 k0!778 v!373))) (Some!362 (_2!3265 (tuple2!6509 k0!778 v!373))))))

(assert (=> d!72799 (= lt!183835 (lemmaContainsTupThenGetReturnValue!182 lt!183834 (_1!3265 (tuple2!6509 k0!778 v!373)) (_2!3265 (tuple2!6509 k0!778 v!373))))))

(assert (=> d!72799 (= lt!183834 (insertStrictlySorted!185 (toList!2721 lt!183656) (_1!3265 (tuple2!6509 k0!778 v!373)) (_2!3265 (tuple2!6509 k0!778 v!373))))))

(assert (=> d!72799 (= (+!1041 lt!183656 (tuple2!6509 k0!778 v!373)) lt!183833)))

(declare-fun b!390247 () Bool)

(declare-fun res!223338 () Bool)

(assert (=> b!390247 (=> (not res!223338) (not e!236382))))

(assert (=> b!390247 (= res!223338 (= (getValueByKey!357 (toList!2721 lt!183833) (_1!3265 (tuple2!6509 k0!778 v!373))) (Some!362 (_2!3265 (tuple2!6509 k0!778 v!373)))))))

(declare-fun b!390248 () Bool)

(assert (=> b!390248 (= e!236382 (contains!2443 (toList!2721 lt!183833) (tuple2!6509 k0!778 v!373)))))

(assert (= (and d!72799 res!223337) b!390247))

(assert (= (and b!390247 res!223338) b!390248))

(declare-fun m!386129 () Bool)

(assert (=> d!72799 m!386129))

(declare-fun m!386131 () Bool)

(assert (=> d!72799 m!386131))

(declare-fun m!386133 () Bool)

(assert (=> d!72799 m!386133))

(declare-fun m!386135 () Bool)

(assert (=> d!72799 m!386135))

(declare-fun m!386137 () Bool)

(assert (=> b!390247 m!386137))

(declare-fun m!386139 () Bool)

(assert (=> b!390248 m!386139))

(assert (=> b!389981 d!72799))

(declare-fun b!390249 () Bool)

(declare-fun e!236390 () Unit!11926)

(declare-fun Unit!11933 () Unit!11926)

(assert (=> b!390249 (= e!236390 Unit!11933)))

(declare-fun b!390250 () Bool)

(declare-fun res!223344 () Bool)

(declare-fun e!236395 () Bool)

(assert (=> b!390250 (=> (not res!223344) (not e!236395))))

(declare-fun e!236388 () Bool)

(assert (=> b!390250 (= res!223344 e!236388)))

(declare-fun c!54108 () Bool)

(assert (=> b!390250 (= c!54108 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27504 () Bool)

(declare-fun call!27509 () ListLongMap!5411)

(declare-fun call!27513 () ListLongMap!5411)

(assert (=> bm!27504 (= call!27509 call!27513)))

(declare-fun b!390251 () Bool)

(declare-fun e!236394 () ListLongMap!5411)

(assert (=> b!390251 (= e!236394 call!27509)))

(declare-fun b!390252 () Bool)

(declare-fun e!236385 () Bool)

(assert (=> b!390252 (= e!236385 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(declare-fun b!390253 () Bool)

(declare-fun e!236386 () Bool)

(declare-fun lt!183844 () ListLongMap!5411)

(assert (=> b!390253 (= e!236386 (= (apply!301 lt!183844 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)) (get!5577 (select (arr!11032 lt!183663) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11385 lt!183663)))))

(assert (=> b!390253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(declare-fun bm!27505 () Bool)

(declare-fun call!27511 () ListLongMap!5411)

(declare-fun call!27507 () ListLongMap!5411)

(assert (=> bm!27505 (= call!27511 call!27507)))

(declare-fun b!390254 () Bool)

(declare-fun lt!183839 () Unit!11926)

(assert (=> b!390254 (= e!236390 lt!183839)))

(declare-fun lt!183853 () ListLongMap!5411)

(assert (=> b!390254 (= lt!183853 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183850 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183852 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183852 (select (arr!11031 lt!183662) #b00000000000000000000000000000000))))

(declare-fun lt!183858 () Unit!11926)

(assert (=> b!390254 (= lt!183858 (addStillContains!277 lt!183853 lt!183850 zeroValue!472 lt!183852))))

(assert (=> b!390254 (contains!2442 (+!1041 lt!183853 (tuple2!6509 lt!183850 zeroValue!472)) lt!183852)))

(declare-fun lt!183847 () Unit!11926)

(assert (=> b!390254 (= lt!183847 lt!183858)))

(declare-fun lt!183838 () ListLongMap!5411)

(assert (=> b!390254 (= lt!183838 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183856 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183855 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183855 (select (arr!11031 lt!183662) #b00000000000000000000000000000000))))

(declare-fun lt!183842 () Unit!11926)

(assert (=> b!390254 (= lt!183842 (addApplyDifferent!277 lt!183838 lt!183856 minValue!472 lt!183855))))

(assert (=> b!390254 (= (apply!301 (+!1041 lt!183838 (tuple2!6509 lt!183856 minValue!472)) lt!183855) (apply!301 lt!183838 lt!183855))))

(declare-fun lt!183837 () Unit!11926)

(assert (=> b!390254 (= lt!183837 lt!183842)))

(declare-fun lt!183846 () ListLongMap!5411)

(assert (=> b!390254 (= lt!183846 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183854 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183840 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183840 (select (arr!11031 lt!183662) #b00000000000000000000000000000000))))

(declare-fun lt!183848 () Unit!11926)

(assert (=> b!390254 (= lt!183848 (addApplyDifferent!277 lt!183846 lt!183854 zeroValue!472 lt!183840))))

(assert (=> b!390254 (= (apply!301 (+!1041 lt!183846 (tuple2!6509 lt!183854 zeroValue!472)) lt!183840) (apply!301 lt!183846 lt!183840))))

(declare-fun lt!183851 () Unit!11926)

(assert (=> b!390254 (= lt!183851 lt!183848)))

(declare-fun lt!183857 () ListLongMap!5411)

(assert (=> b!390254 (= lt!183857 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183843 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183849 () (_ BitVec 64))

(assert (=> b!390254 (= lt!183849 (select (arr!11031 lt!183662) #b00000000000000000000000000000000))))

(assert (=> b!390254 (= lt!183839 (addApplyDifferent!277 lt!183857 lt!183843 minValue!472 lt!183849))))

(assert (=> b!390254 (= (apply!301 (+!1041 lt!183857 (tuple2!6509 lt!183843 minValue!472)) lt!183849) (apply!301 lt!183857 lt!183849))))

(declare-fun b!390255 () Bool)

(declare-fun e!236391 () Bool)

(assert (=> b!390255 (= e!236391 (= (apply!301 lt!183844 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390256 () Bool)

(declare-fun e!236383 () ListLongMap!5411)

(assert (=> b!390256 (= e!236383 call!27509)))

(declare-fun b!390257 () Bool)

(declare-fun e!236387 () Bool)

(assert (=> b!390257 (= e!236395 e!236387)))

(declare-fun c!54103 () Bool)

(assert (=> b!390257 (= c!54103 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390258 () Bool)

(declare-fun res!223341 () Bool)

(assert (=> b!390258 (=> (not res!223341) (not e!236395))))

(declare-fun e!236393 () Bool)

(assert (=> b!390258 (= res!223341 e!236393)))

(declare-fun res!223340 () Bool)

(assert (=> b!390258 (=> res!223340 e!236393)))

(assert (=> b!390258 (= res!223340 (not e!236385))))

(declare-fun res!223342 () Bool)

(assert (=> b!390258 (=> (not res!223342) (not e!236385))))

(assert (=> b!390258 (= res!223342 (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(declare-fun call!27508 () ListLongMap!5411)

(declare-fun c!54106 () Bool)

(declare-fun c!54105 () Bool)

(declare-fun bm!27506 () Bool)

(assert (=> bm!27506 (= call!27513 (+!1041 (ite c!54106 call!27508 (ite c!54105 call!27507 call!27511)) (ite (or c!54106 c!54105) (tuple2!6509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390259 () Bool)

(declare-fun e!236389 () Bool)

(assert (=> b!390259 (= e!236388 e!236389)))

(declare-fun res!223343 () Bool)

(declare-fun call!27512 () Bool)

(assert (=> b!390259 (= res!223343 call!27512)))

(assert (=> b!390259 (=> (not res!223343) (not e!236389))))

(declare-fun b!390260 () Bool)

(declare-fun call!27510 () Bool)

(assert (=> b!390260 (= e!236387 (not call!27510))))

(declare-fun b!390261 () Bool)

(declare-fun c!54107 () Bool)

(assert (=> b!390261 (= c!54107 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!390261 (= e!236383 e!236394)))

(declare-fun b!390262 () Bool)

(assert (=> b!390262 (= e!236387 e!236391)))

(declare-fun res!223347 () Bool)

(assert (=> b!390262 (= res!223347 call!27510)))

(assert (=> b!390262 (=> (not res!223347) (not e!236391))))

(declare-fun b!390263 () Bool)

(assert (=> b!390263 (= e!236389 (= (apply!301 lt!183844 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390264 () Bool)

(declare-fun e!236384 () ListLongMap!5411)

(assert (=> b!390264 (= e!236384 (+!1041 call!27513 (tuple2!6509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390265 () Bool)

(assert (=> b!390265 (= e!236384 e!236383)))

(assert (=> b!390265 (= c!54105 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390266 () Bool)

(assert (=> b!390266 (= e!236388 (not call!27512))))

(declare-fun bm!27507 () Bool)

(assert (=> bm!27507 (= call!27512 (contains!2442 lt!183844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390267 () Bool)

(assert (=> b!390267 (= e!236393 e!236386)))

(declare-fun res!223339 () Bool)

(assert (=> b!390267 (=> (not res!223339) (not e!236386))))

(assert (=> b!390267 (= res!223339 (contains!2442 lt!183844 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(assert (=> b!390267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(declare-fun bm!27508 () Bool)

(assert (=> bm!27508 (= call!27508 (getCurrentListMapNoExtraKeys!957 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390268 () Bool)

(assert (=> b!390268 (= e!236394 call!27511)))

(declare-fun d!72801 () Bool)

(assert (=> d!72801 e!236395))

(declare-fun res!223346 () Bool)

(assert (=> d!72801 (=> (not res!223346) (not e!236395))))

(assert (=> d!72801 (= res!223346 (or (bvsge #b00000000000000000000000000000000 (size!11384 lt!183662)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))))

(declare-fun lt!183841 () ListLongMap!5411)

(assert (=> d!72801 (= lt!183844 lt!183841)))

(declare-fun lt!183845 () Unit!11926)

(assert (=> d!72801 (= lt!183845 e!236390)))

(declare-fun c!54104 () Bool)

(declare-fun e!236392 () Bool)

(assert (=> d!72801 (= c!54104 e!236392)))

(declare-fun res!223345 () Bool)

(assert (=> d!72801 (=> (not res!223345) (not e!236392))))

(assert (=> d!72801 (= res!223345 (bvslt #b00000000000000000000000000000000 (size!11384 lt!183662)))))

(assert (=> d!72801 (= lt!183841 e!236384)))

(assert (=> d!72801 (= c!54106 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72801 (validMask!0 mask!970)))

(assert (=> d!72801 (= (getCurrentListMap!2047 lt!183662 lt!183663 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183844)))

(declare-fun bm!27509 () Bool)

(assert (=> bm!27509 (= call!27507 call!27508)))

(declare-fun b!390269 () Bool)

(assert (=> b!390269 (= e!236392 (validKeyInArray!0 (select (arr!11031 lt!183662) #b00000000000000000000000000000000)))))

(declare-fun bm!27510 () Bool)

(assert (=> bm!27510 (= call!27510 (contains!2442 lt!183844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72801 c!54106) b!390264))

(assert (= (and d!72801 (not c!54106)) b!390265))

(assert (= (and b!390265 c!54105) b!390256))

(assert (= (and b!390265 (not c!54105)) b!390261))

(assert (= (and b!390261 c!54107) b!390251))

(assert (= (and b!390261 (not c!54107)) b!390268))

(assert (= (or b!390251 b!390268) bm!27505))

(assert (= (or b!390256 bm!27505) bm!27509))

(assert (= (or b!390256 b!390251) bm!27504))

(assert (= (or b!390264 bm!27509) bm!27508))

(assert (= (or b!390264 bm!27504) bm!27506))

(assert (= (and d!72801 res!223345) b!390269))

(assert (= (and d!72801 c!54104) b!390254))

(assert (= (and d!72801 (not c!54104)) b!390249))

(assert (= (and d!72801 res!223346) b!390258))

(assert (= (and b!390258 res!223342) b!390252))

(assert (= (and b!390258 (not res!223340)) b!390267))

(assert (= (and b!390267 res!223339) b!390253))

(assert (= (and b!390258 res!223341) b!390250))

(assert (= (and b!390250 c!54108) b!390259))

(assert (= (and b!390250 (not c!54108)) b!390266))

(assert (= (and b!390259 res!223343) b!390263))

(assert (= (or b!390259 b!390266) bm!27507))

(assert (= (and b!390250 res!223344) b!390257))

(assert (= (and b!390257 c!54103) b!390262))

(assert (= (and b!390257 (not c!54103)) b!390260))

(assert (= (and b!390262 res!223347) b!390255))

(assert (= (or b!390262 b!390260) bm!27510))

(declare-fun b_lambda!8615 () Bool)

(assert (=> (not b_lambda!8615) (not b!390253)))

(assert (=> b!390253 t!11509))

(declare-fun b_and!16233 () Bool)

(assert (= b_and!16231 (and (=> t!11509 result!5723) b_and!16233)))

(declare-fun m!386141 () Bool)

(assert (=> b!390264 m!386141))

(assert (=> b!390269 m!386011))

(assert (=> b!390269 m!386011))

(assert (=> b!390269 m!386013))

(assert (=> d!72801 m!385877))

(assert (=> b!390253 m!386011))

(assert (=> b!390253 m!386103))

(assert (=> b!390253 m!386031))

(assert (=> b!390253 m!386105))

(assert (=> b!390253 m!386011))

(declare-fun m!386143 () Bool)

(assert (=> b!390253 m!386143))

(assert (=> b!390253 m!386031))

(assert (=> b!390253 m!386103))

(assert (=> bm!27508 m!385861))

(declare-fun m!386145 () Bool)

(assert (=> b!390263 m!386145))

(declare-fun m!386147 () Bool)

(assert (=> bm!27507 m!386147))

(assert (=> b!390252 m!386011))

(assert (=> b!390252 m!386011))

(assert (=> b!390252 m!386013))

(declare-fun m!386149 () Bool)

(assert (=> bm!27506 m!386149))

(declare-fun m!386151 () Bool)

(assert (=> b!390254 m!386151))

(declare-fun m!386153 () Bool)

(assert (=> b!390254 m!386153))

(declare-fun m!386155 () Bool)

(assert (=> b!390254 m!386155))

(declare-fun m!386157 () Bool)

(assert (=> b!390254 m!386157))

(declare-fun m!386159 () Bool)

(assert (=> b!390254 m!386159))

(assert (=> b!390254 m!386153))

(declare-fun m!386161 () Bool)

(assert (=> b!390254 m!386161))

(assert (=> b!390254 m!385861))

(assert (=> b!390254 m!386157))

(declare-fun m!386163 () Bool)

(assert (=> b!390254 m!386163))

(declare-fun m!386165 () Bool)

(assert (=> b!390254 m!386165))

(declare-fun m!386167 () Bool)

(assert (=> b!390254 m!386167))

(declare-fun m!386169 () Bool)

(assert (=> b!390254 m!386169))

(declare-fun m!386171 () Bool)

(assert (=> b!390254 m!386171))

(assert (=> b!390254 m!386165))

(declare-fun m!386173 () Bool)

(assert (=> b!390254 m!386173))

(assert (=> b!390254 m!386011))

(declare-fun m!386175 () Bool)

(assert (=> b!390254 m!386175))

(declare-fun m!386177 () Bool)

(assert (=> b!390254 m!386177))

(assert (=> b!390254 m!386155))

(declare-fun m!386179 () Bool)

(assert (=> b!390254 m!386179))

(assert (=> b!390267 m!386011))

(assert (=> b!390267 m!386011))

(declare-fun m!386181 () Bool)

(assert (=> b!390267 m!386181))

(declare-fun m!386183 () Bool)

(assert (=> b!390255 m!386183))

(declare-fun m!386185 () Bool)

(assert (=> bm!27510 m!386185))

(assert (=> b!389981 d!72801))

(declare-fun b!390276 () Bool)

(declare-fun e!236400 () Bool)

(assert (=> b!390276 (= e!236400 tp_is_empty!9625)))

(declare-fun b!390277 () Bool)

(declare-fun e!236401 () Bool)

(assert (=> b!390277 (= e!236401 tp_is_empty!9625)))

(declare-fun mapIsEmpty!16023 () Bool)

(declare-fun mapRes!16023 () Bool)

(assert (=> mapIsEmpty!16023 mapRes!16023))

(declare-fun mapNonEmpty!16023 () Bool)

(declare-fun tp!31638 () Bool)

(assert (=> mapNonEmpty!16023 (= mapRes!16023 (and tp!31638 e!236400))))

(declare-fun mapValue!16023 () ValueCell!4469)

(declare-fun mapKey!16023 () (_ BitVec 32))

(declare-fun mapRest!16023 () (Array (_ BitVec 32) ValueCell!4469))

(assert (=> mapNonEmpty!16023 (= mapRest!16014 (store mapRest!16023 mapKey!16023 mapValue!16023))))

(declare-fun condMapEmpty!16023 () Bool)

(declare-fun mapDefault!16023 () ValueCell!4469)

(assert (=> mapNonEmpty!16014 (= condMapEmpty!16023 (= mapRest!16014 ((as const (Array (_ BitVec 32) ValueCell!4469)) mapDefault!16023)))))

(assert (=> mapNonEmpty!16014 (= tp!31623 (and e!236401 mapRes!16023))))

(assert (= (and mapNonEmpty!16014 condMapEmpty!16023) mapIsEmpty!16023))

(assert (= (and mapNonEmpty!16014 (not condMapEmpty!16023)) mapNonEmpty!16023))

(assert (= (and mapNonEmpty!16023 ((_ is ValueCellFull!4469) mapValue!16023)) b!390276))

(assert (= (and mapNonEmpty!16014 ((_ is ValueCellFull!4469) mapDefault!16023)) b!390277))

(declare-fun m!386187 () Bool)

(assert (=> mapNonEmpty!16023 m!386187))

(declare-fun b_lambda!8617 () Bool)

(assert (= b_lambda!8605 (or (and start!37926 b_free!8953) b_lambda!8617)))

(declare-fun b_lambda!8619 () Bool)

(assert (= b_lambda!8611 (or (and start!37926 b_free!8953) b_lambda!8619)))

(declare-fun b_lambda!8621 () Bool)

(assert (= b_lambda!8607 (or (and start!37926 b_free!8953) b_lambda!8621)))

(declare-fun b_lambda!8623 () Bool)

(assert (= b_lambda!8615 (or (and start!37926 b_free!8953) b_lambda!8623)))

(declare-fun b_lambda!8625 () Bool)

(assert (= b_lambda!8609 (or (and start!37926 b_free!8953) b_lambda!8625)))

(declare-fun b_lambda!8627 () Bool)

(assert (= b_lambda!8613 (or (and start!37926 b_free!8953) b_lambda!8627)))

(check-sat (not b!390096) (not b!390123) (not d!72791) (not bm!27508) (not d!72799) (not b!390209) (not bm!27493) (not bm!27467) (not bm!27472) (not b!390231) (not b!390149) (not b!390229) (not b!390208) (not b!390252) (not bm!27497) (not d!72793) (not b!390255) (not b!390223) (not b!390097) (not b!390103) (not b!390124) (not b!390263) (not b_lambda!8621) (not b!390116) (not b!390121) (not bm!27475) (not b!390158) (not bm!27502) (not bm!27506) (not bm!27470) (not b!390211) (not d!72797) (not b!390219) (not b!390226) (not b!390253) (not b!390267) (not bm!27494) (not b!390155) b_and!16233 (not b_lambda!8625) (not b!390160) (not b!390228) (not b!390081) (not b_lambda!8627) (not b!390115) (not b!390254) tp_is_empty!9625 (not b!390233) (not b!390119) (not bm!27510) (not b!390210) (not b!390094) (not d!72771) (not bm!27507) (not bm!27496) (not bm!27492) (not b!390232) (not d!72801) (not b!390248) (not b!390269) (not b!390152) (not b!390225) (not b!390235) (not b!390082) (not b!390247) (not b!390246) (not b!390156) (not b!390264) (not b!390154) (not b!390237) (not b!390112) (not b!390151) (not b_lambda!8617) (not bm!27471) (not b_lambda!8623) (not b_lambda!8619) (not d!72795) (not mapNonEmpty!16023) (not bm!27503) (not b_next!8953) (not b!390220))
(check-sat b_and!16233 (not b_next!8953))
