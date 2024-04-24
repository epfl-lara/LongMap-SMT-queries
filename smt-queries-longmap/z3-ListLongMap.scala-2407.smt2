; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38068 () Bool)

(assert start!38068)

(declare-fun b_free!9007 () Bool)

(declare-fun b_next!9007 () Bool)

(assert (=> start!38068 (= b_free!9007 (not b_next!9007))))

(declare-fun tp!31797 () Bool)

(declare-fun b_and!16359 () Bool)

(assert (=> start!38068 (= tp!31797 b_and!16359)))

(declare-fun b!392201 () Bool)

(declare-fun res!224625 () Bool)

(declare-fun e!237503 () Bool)

(assert (=> b!392201 (=> (not res!224625) (not e!237503))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23248 0))(
  ( (array!23249 (arr!11084 (Array (_ BitVec 32) (_ BitVec 64))) (size!11436 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23248)

(assert (=> b!392201 (= res!224625 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11436 _keys!658))))))

(declare-fun b!392202 () Bool)

(declare-fun res!224623 () Bool)

(assert (=> b!392202 (=> (not res!224623) (not e!237503))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14011 0))(
  ( (V!14012 (val!4884 Int)) )
))
(declare-datatypes ((ValueCell!4496 0))(
  ( (ValueCellFull!4496 (v!7114 V!14011)) (EmptyCell!4496) )
))
(declare-datatypes ((array!23250 0))(
  ( (array!23251 (arr!11085 (Array (_ BitVec 32) ValueCell!4496)) (size!11437 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23250)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!392202 (= res!224623 (and (= (size!11437 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11436 _keys!658) (size!11437 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392203 () Bool)

(declare-fun res!224619 () Bool)

(declare-fun e!237502 () Bool)

(assert (=> b!392203 (=> (not res!224619) (not e!237502))))

(declare-fun lt!185332 () array!23248)

(declare-datatypes ((List!6297 0))(
  ( (Nil!6294) (Cons!6293 (h!7149 (_ BitVec 64)) (t!11455 List!6297)) )
))
(declare-fun arrayNoDuplicates!0 (array!23248 (_ BitVec 32) List!6297) Bool)

(assert (=> b!392203 (= res!224619 (arrayNoDuplicates!0 lt!185332 #b00000000000000000000000000000000 Nil!6294))))

(declare-datatypes ((tuple2!6450 0))(
  ( (tuple2!6451 (_1!3236 (_ BitVec 64)) (_2!3236 V!14011)) )
))
(declare-datatypes ((List!6298 0))(
  ( (Nil!6295) (Cons!6294 (h!7150 tuple2!6450) (t!11456 List!6298)) )
))
(declare-datatypes ((ListLongMap!5365 0))(
  ( (ListLongMap!5366 (toList!2698 List!6298)) )
))
(declare-fun lt!185330 () ListLongMap!5365)

(declare-fun b!392205 () Bool)

(declare-fun lt!185335 () tuple2!6450)

(declare-fun lt!185334 () ListLongMap!5365)

(declare-fun e!237509 () Bool)

(declare-fun +!1052 (ListLongMap!5365 tuple2!6450) ListLongMap!5365)

(assert (=> b!392205 (= e!237509 (= lt!185330 (+!1052 lt!185334 lt!185335)))))

(declare-fun b!392206 () Bool)

(declare-fun e!237508 () Bool)

(declare-fun tp_is_empty!9679 () Bool)

(assert (=> b!392206 (= e!237508 tp_is_empty!9679)))

(declare-fun b!392207 () Bool)

(declare-fun res!224617 () Bool)

(assert (=> b!392207 (=> (not res!224617) (not e!237503))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392207 (= res!224617 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun lt!185331 () ListLongMap!5365)

(declare-fun lt!185333 () ListLongMap!5365)

(declare-fun b!392208 () Bool)

(declare-fun e!237505 () Bool)

(assert (=> b!392208 (= e!237505 (= lt!185333 (+!1052 lt!185331 lt!185335)))))

(assert (=> b!392208 e!237509))

(declare-fun res!224628 () Bool)

(assert (=> b!392208 (=> (not res!224628) (not e!237509))))

(declare-fun lt!185338 () ListLongMap!5365)

(assert (=> b!392208 (= res!224628 (= lt!185330 (+!1052 lt!185338 lt!185335)))))

(declare-fun minValue!472 () V!14011)

(assert (=> b!392208 (= lt!185335 (tuple2!6451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392209 () Bool)

(declare-fun e!237504 () Bool)

(declare-fun mapRes!16107 () Bool)

(assert (=> b!392209 (= e!237504 (and e!237508 mapRes!16107))))

(declare-fun condMapEmpty!16107 () Bool)

(declare-fun mapDefault!16107 () ValueCell!4496)

(assert (=> b!392209 (= condMapEmpty!16107 (= (arr!11085 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4496)) mapDefault!16107)))))

(declare-fun b!392210 () Bool)

(declare-fun res!224624 () Bool)

(assert (=> b!392210 (=> (not res!224624) (not e!237503))))

(assert (=> b!392210 (= res!224624 (or (= (select (arr!11084 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11084 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392204 () Bool)

(declare-fun res!224622 () Bool)

(assert (=> b!392204 (=> (not res!224622) (not e!237503))))

(assert (=> b!392204 (= res!224622 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6294))))

(declare-fun res!224627 () Bool)

(assert (=> start!38068 (=> (not res!224627) (not e!237503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38068 (= res!224627 (validMask!0 mask!970))))

(assert (=> start!38068 e!237503))

(declare-fun array_inv!8192 (array!23250) Bool)

(assert (=> start!38068 (and (array_inv!8192 _values!506) e!237504)))

(assert (=> start!38068 tp!31797))

(assert (=> start!38068 true))

(assert (=> start!38068 tp_is_empty!9679))

(declare-fun array_inv!8193 (array!23248) Bool)

(assert (=> start!38068 (array_inv!8193 _keys!658)))

(declare-fun b!392211 () Bool)

(declare-fun e!237507 () Bool)

(assert (=> b!392211 (= e!237507 tp_is_empty!9679)))

(declare-fun b!392212 () Bool)

(assert (=> b!392212 (= e!237502 (not e!237505))))

(declare-fun res!224620 () Bool)

(assert (=> b!392212 (=> res!224620 e!237505)))

(assert (=> b!392212 (= res!224620 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14011)

(declare-fun getCurrentListMap!2076 (array!23248 array!23250 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) Int) ListLongMap!5365)

(assert (=> b!392212 (= lt!185333 (getCurrentListMap!2076 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185337 () array!23250)

(assert (=> b!392212 (= lt!185330 (getCurrentListMap!2076 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392212 (and (= lt!185338 lt!185334) (= lt!185334 lt!185338))))

(declare-fun v!373 () V!14011)

(assert (=> b!392212 (= lt!185334 (+!1052 lt!185331 (tuple2!6451 k0!778 v!373)))))

(declare-datatypes ((Unit!11975 0))(
  ( (Unit!11976) )
))
(declare-fun lt!185336 () Unit!11975)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 (array!23248 array!23250 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) (_ BitVec 64) V!14011 (_ BitVec 32) Int) Unit!11975)

(assert (=> b!392212 (= lt!185336 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!965 (array!23248 array!23250 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) Int) ListLongMap!5365)

(assert (=> b!392212 (= lt!185338 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392212 (= lt!185337 (array!23251 (store (arr!11085 _values!506) i!548 (ValueCellFull!4496 v!373)) (size!11437 _values!506)))))

(assert (=> b!392212 (= lt!185331 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392213 () Bool)

(assert (=> b!392213 (= e!237503 e!237502)))

(declare-fun res!224621 () Bool)

(assert (=> b!392213 (=> (not res!224621) (not e!237502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23248 (_ BitVec 32)) Bool)

(assert (=> b!392213 (= res!224621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185332 mask!970))))

(assert (=> b!392213 (= lt!185332 (array!23249 (store (arr!11084 _keys!658) i!548 k0!778) (size!11436 _keys!658)))))

(declare-fun b!392214 () Bool)

(declare-fun res!224618 () Bool)

(assert (=> b!392214 (=> (not res!224618) (not e!237503))))

(assert (=> b!392214 (= res!224618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!16107 () Bool)

(assert (=> mapIsEmpty!16107 mapRes!16107))

(declare-fun b!392215 () Bool)

(declare-fun res!224626 () Bool)

(assert (=> b!392215 (=> (not res!224626) (not e!237503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392215 (= res!224626 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16107 () Bool)

(declare-fun tp!31796 () Bool)

(assert (=> mapNonEmpty!16107 (= mapRes!16107 (and tp!31796 e!237507))))

(declare-fun mapValue!16107 () ValueCell!4496)

(declare-fun mapKey!16107 () (_ BitVec 32))

(declare-fun mapRest!16107 () (Array (_ BitVec 32) ValueCell!4496))

(assert (=> mapNonEmpty!16107 (= (arr!11085 _values!506) (store mapRest!16107 mapKey!16107 mapValue!16107))))

(assert (= (and start!38068 res!224627) b!392202))

(assert (= (and b!392202 res!224623) b!392214))

(assert (= (and b!392214 res!224618) b!392204))

(assert (= (and b!392204 res!224622) b!392201))

(assert (= (and b!392201 res!224625) b!392215))

(assert (= (and b!392215 res!224626) b!392210))

(assert (= (and b!392210 res!224624) b!392207))

(assert (= (and b!392207 res!224617) b!392213))

(assert (= (and b!392213 res!224621) b!392203))

(assert (= (and b!392203 res!224619) b!392212))

(assert (= (and b!392212 (not res!224620)) b!392208))

(assert (= (and b!392208 res!224628) b!392205))

(assert (= (and b!392209 condMapEmpty!16107) mapIsEmpty!16107))

(assert (= (and b!392209 (not condMapEmpty!16107)) mapNonEmpty!16107))

(get-info :version)

(assert (= (and mapNonEmpty!16107 ((_ is ValueCellFull!4496) mapValue!16107)) b!392211))

(assert (= (and b!392209 ((_ is ValueCellFull!4496) mapDefault!16107)) b!392206))

(assert (= start!38068 b!392209))

(declare-fun m!388877 () Bool)

(assert (=> b!392207 m!388877))

(declare-fun m!388879 () Bool)

(assert (=> b!392210 m!388879))

(declare-fun m!388881 () Bool)

(assert (=> mapNonEmpty!16107 m!388881))

(declare-fun m!388883 () Bool)

(assert (=> b!392208 m!388883))

(declare-fun m!388885 () Bool)

(assert (=> b!392208 m!388885))

(declare-fun m!388887 () Bool)

(assert (=> b!392205 m!388887))

(declare-fun m!388889 () Bool)

(assert (=> b!392204 m!388889))

(declare-fun m!388891 () Bool)

(assert (=> b!392214 m!388891))

(declare-fun m!388893 () Bool)

(assert (=> b!392212 m!388893))

(declare-fun m!388895 () Bool)

(assert (=> b!392212 m!388895))

(declare-fun m!388897 () Bool)

(assert (=> b!392212 m!388897))

(declare-fun m!388899 () Bool)

(assert (=> b!392212 m!388899))

(declare-fun m!388901 () Bool)

(assert (=> b!392212 m!388901))

(declare-fun m!388903 () Bool)

(assert (=> b!392212 m!388903))

(declare-fun m!388905 () Bool)

(assert (=> b!392212 m!388905))

(declare-fun m!388907 () Bool)

(assert (=> b!392213 m!388907))

(declare-fun m!388909 () Bool)

(assert (=> b!392213 m!388909))

(declare-fun m!388911 () Bool)

(assert (=> start!38068 m!388911))

(declare-fun m!388913 () Bool)

(assert (=> start!38068 m!388913))

(declare-fun m!388915 () Bool)

(assert (=> start!38068 m!388915))

(declare-fun m!388917 () Bool)

(assert (=> b!392215 m!388917))

(declare-fun m!388919 () Bool)

(assert (=> b!392203 m!388919))

(check-sat (not b!392204) (not b!392215) (not b!392208) (not mapNonEmpty!16107) tp_is_empty!9679 (not b!392205) (not b!392203) (not b_next!9007) (not b!392213) (not start!38068) (not b!392214) (not b!392207) b_and!16359 (not b!392212))
(check-sat b_and!16359 (not b_next!9007))
(get-model)

(declare-fun b!392316 () Bool)

(declare-fun e!237568 () Bool)

(declare-fun call!27666 () Bool)

(assert (=> b!392316 (= e!237568 call!27666)))

(declare-fun b!392317 () Bool)

(assert (=> b!392317 (= e!237568 call!27666)))

(declare-fun bm!27663 () Bool)

(declare-fun c!54312 () Bool)

(assert (=> bm!27663 (= call!27666 (arrayNoDuplicates!0 lt!185332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54312 (Cons!6293 (select (arr!11084 lt!185332) #b00000000000000000000000000000000) Nil!6294) Nil!6294)))))

(declare-fun b!392318 () Bool)

(declare-fun e!237567 () Bool)

(declare-fun e!237566 () Bool)

(assert (=> b!392318 (= e!237567 e!237566)))

(declare-fun res!224709 () Bool)

(assert (=> b!392318 (=> (not res!224709) (not e!237566))))

(declare-fun e!237569 () Bool)

(assert (=> b!392318 (= res!224709 (not e!237569))))

(declare-fun res!224708 () Bool)

(assert (=> b!392318 (=> (not res!224708) (not e!237569))))

(assert (=> b!392318 (= res!224708 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(declare-fun d!73157 () Bool)

(declare-fun res!224707 () Bool)

(assert (=> d!73157 (=> res!224707 e!237567)))

(assert (=> d!73157 (= res!224707 (bvsge #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(assert (=> d!73157 (= (arrayNoDuplicates!0 lt!185332 #b00000000000000000000000000000000 Nil!6294) e!237567)))

(declare-fun b!392319 () Bool)

(declare-fun contains!2443 (List!6297 (_ BitVec 64)) Bool)

(assert (=> b!392319 (= e!237569 (contains!2443 Nil!6294 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(declare-fun b!392320 () Bool)

(assert (=> b!392320 (= e!237566 e!237568)))

(assert (=> b!392320 (= c!54312 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(assert (= (and d!73157 (not res!224707)) b!392318))

(assert (= (and b!392318 res!224708) b!392319))

(assert (= (and b!392318 res!224709) b!392320))

(assert (= (and b!392320 c!54312) b!392316))

(assert (= (and b!392320 (not c!54312)) b!392317))

(assert (= (or b!392316 b!392317) bm!27663))

(declare-fun m!389009 () Bool)

(assert (=> bm!27663 m!389009))

(declare-fun m!389011 () Bool)

(assert (=> bm!27663 m!389011))

(assert (=> b!392318 m!389009))

(assert (=> b!392318 m!389009))

(declare-fun m!389013 () Bool)

(assert (=> b!392318 m!389013))

(assert (=> b!392319 m!389009))

(assert (=> b!392319 m!389009))

(declare-fun m!389015 () Bool)

(assert (=> b!392319 m!389015))

(assert (=> b!392320 m!389009))

(assert (=> b!392320 m!389009))

(assert (=> b!392320 m!389013))

(assert (=> b!392203 d!73157))

(declare-fun d!73159 () Bool)

(declare-fun e!237572 () Bool)

(assert (=> d!73159 e!237572))

(declare-fun res!224715 () Bool)

(assert (=> d!73159 (=> (not res!224715) (not e!237572))))

(declare-fun lt!185401 () ListLongMap!5365)

(declare-fun contains!2444 (ListLongMap!5365 (_ BitVec 64)) Bool)

(assert (=> d!73159 (= res!224715 (contains!2444 lt!185401 (_1!3236 lt!185335)))))

(declare-fun lt!185402 () List!6298)

(assert (=> d!73159 (= lt!185401 (ListLongMap!5366 lt!185402))))

(declare-fun lt!185404 () Unit!11975)

(declare-fun lt!185403 () Unit!11975)

(assert (=> d!73159 (= lt!185404 lt!185403)))

(declare-datatypes ((Option!370 0))(
  ( (Some!369 (v!7120 V!14011)) (None!368) )
))
(declare-fun getValueByKey!364 (List!6298 (_ BitVec 64)) Option!370)

(assert (=> d!73159 (= (getValueByKey!364 lt!185402 (_1!3236 lt!185335)) (Some!369 (_2!3236 lt!185335)))))

(declare-fun lemmaContainsTupThenGetReturnValue!186 (List!6298 (_ BitVec 64) V!14011) Unit!11975)

(assert (=> d!73159 (= lt!185403 (lemmaContainsTupThenGetReturnValue!186 lt!185402 (_1!3236 lt!185335) (_2!3236 lt!185335)))))

(declare-fun insertStrictlySorted!189 (List!6298 (_ BitVec 64) V!14011) List!6298)

(assert (=> d!73159 (= lt!185402 (insertStrictlySorted!189 (toList!2698 lt!185331) (_1!3236 lt!185335) (_2!3236 lt!185335)))))

(assert (=> d!73159 (= (+!1052 lt!185331 lt!185335) lt!185401)))

(declare-fun b!392325 () Bool)

(declare-fun res!224714 () Bool)

(assert (=> b!392325 (=> (not res!224714) (not e!237572))))

(assert (=> b!392325 (= res!224714 (= (getValueByKey!364 (toList!2698 lt!185401) (_1!3236 lt!185335)) (Some!369 (_2!3236 lt!185335))))))

(declare-fun b!392326 () Bool)

(declare-fun contains!2445 (List!6298 tuple2!6450) Bool)

(assert (=> b!392326 (= e!237572 (contains!2445 (toList!2698 lt!185401) lt!185335))))

(assert (= (and d!73159 res!224715) b!392325))

(assert (= (and b!392325 res!224714) b!392326))

(declare-fun m!389017 () Bool)

(assert (=> d!73159 m!389017))

(declare-fun m!389019 () Bool)

(assert (=> d!73159 m!389019))

(declare-fun m!389021 () Bool)

(assert (=> d!73159 m!389021))

(declare-fun m!389023 () Bool)

(assert (=> d!73159 m!389023))

(declare-fun m!389025 () Bool)

(assert (=> b!392325 m!389025))

(declare-fun m!389027 () Bool)

(assert (=> b!392326 m!389027))

(assert (=> b!392208 d!73159))

(declare-fun d!73161 () Bool)

(declare-fun e!237573 () Bool)

(assert (=> d!73161 e!237573))

(declare-fun res!224717 () Bool)

(assert (=> d!73161 (=> (not res!224717) (not e!237573))))

(declare-fun lt!185405 () ListLongMap!5365)

(assert (=> d!73161 (= res!224717 (contains!2444 lt!185405 (_1!3236 lt!185335)))))

(declare-fun lt!185406 () List!6298)

(assert (=> d!73161 (= lt!185405 (ListLongMap!5366 lt!185406))))

(declare-fun lt!185408 () Unit!11975)

(declare-fun lt!185407 () Unit!11975)

(assert (=> d!73161 (= lt!185408 lt!185407)))

(assert (=> d!73161 (= (getValueByKey!364 lt!185406 (_1!3236 lt!185335)) (Some!369 (_2!3236 lt!185335)))))

(assert (=> d!73161 (= lt!185407 (lemmaContainsTupThenGetReturnValue!186 lt!185406 (_1!3236 lt!185335) (_2!3236 lt!185335)))))

(assert (=> d!73161 (= lt!185406 (insertStrictlySorted!189 (toList!2698 lt!185338) (_1!3236 lt!185335) (_2!3236 lt!185335)))))

(assert (=> d!73161 (= (+!1052 lt!185338 lt!185335) lt!185405)))

(declare-fun b!392327 () Bool)

(declare-fun res!224716 () Bool)

(assert (=> b!392327 (=> (not res!224716) (not e!237573))))

(assert (=> b!392327 (= res!224716 (= (getValueByKey!364 (toList!2698 lt!185405) (_1!3236 lt!185335)) (Some!369 (_2!3236 lt!185335))))))

(declare-fun b!392328 () Bool)

(assert (=> b!392328 (= e!237573 (contains!2445 (toList!2698 lt!185405) lt!185335))))

(assert (= (and d!73161 res!224717) b!392327))

(assert (= (and b!392327 res!224716) b!392328))

(declare-fun m!389029 () Bool)

(assert (=> d!73161 m!389029))

(declare-fun m!389031 () Bool)

(assert (=> d!73161 m!389031))

(declare-fun m!389033 () Bool)

(assert (=> d!73161 m!389033))

(declare-fun m!389035 () Bool)

(assert (=> d!73161 m!389035))

(declare-fun m!389037 () Bool)

(assert (=> b!392327 m!389037))

(declare-fun m!389039 () Bool)

(assert (=> b!392328 m!389039))

(assert (=> b!392208 d!73161))

(declare-fun b!392337 () Bool)

(declare-fun e!237580 () Bool)

(declare-fun e!237582 () Bool)

(assert (=> b!392337 (= e!237580 e!237582)))

(declare-fun lt!185416 () (_ BitVec 64))

(assert (=> b!392337 (= lt!185416 (select (arr!11084 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185417 () Unit!11975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23248 (_ BitVec 64) (_ BitVec 32)) Unit!11975)

(assert (=> b!392337 (= lt!185417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185416 #b00000000000000000000000000000000))))

(assert (=> b!392337 (arrayContainsKey!0 _keys!658 lt!185416 #b00000000000000000000000000000000)))

(declare-fun lt!185415 () Unit!11975)

(assert (=> b!392337 (= lt!185415 lt!185417)))

(declare-fun res!224723 () Bool)

(declare-datatypes ((SeekEntryResult!3465 0))(
  ( (MissingZero!3465 (index!16039 (_ BitVec 32))) (Found!3465 (index!16040 (_ BitVec 32))) (Intermediate!3465 (undefined!4277 Bool) (index!16041 (_ BitVec 32)) (x!38359 (_ BitVec 32))) (Undefined!3465) (MissingVacant!3465 (index!16042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23248 (_ BitVec 32)) SeekEntryResult!3465)

(assert (=> b!392337 (= res!224723 (= (seekEntryOrOpen!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3465 #b00000000000000000000000000000000)))))

(assert (=> b!392337 (=> (not res!224723) (not e!237582))))

(declare-fun b!392338 () Bool)

(declare-fun call!27669 () Bool)

(assert (=> b!392338 (= e!237582 call!27669)))

(declare-fun b!392339 () Bool)

(assert (=> b!392339 (= e!237580 call!27669)))

(declare-fun d!73163 () Bool)

(declare-fun res!224722 () Bool)

(declare-fun e!237581 () Bool)

(assert (=> d!73163 (=> res!224722 e!237581)))

(assert (=> d!73163 (= res!224722 (bvsge #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(assert (=> d!73163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237581)))

(declare-fun b!392340 () Bool)

(assert (=> b!392340 (= e!237581 e!237580)))

(declare-fun c!54315 () Bool)

(assert (=> b!392340 (= c!54315 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27666 () Bool)

(assert (=> bm!27666 (= call!27669 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!73163 (not res!224722)) b!392340))

(assert (= (and b!392340 c!54315) b!392337))

(assert (= (and b!392340 (not c!54315)) b!392339))

(assert (= (and b!392337 res!224723) b!392338))

(assert (= (or b!392338 b!392339) bm!27666))

(declare-fun m!389041 () Bool)

(assert (=> b!392337 m!389041))

(declare-fun m!389043 () Bool)

(assert (=> b!392337 m!389043))

(declare-fun m!389045 () Bool)

(assert (=> b!392337 m!389045))

(assert (=> b!392337 m!389041))

(declare-fun m!389047 () Bool)

(assert (=> b!392337 m!389047))

(assert (=> b!392340 m!389041))

(assert (=> b!392340 m!389041))

(declare-fun m!389049 () Bool)

(assert (=> b!392340 m!389049))

(declare-fun m!389051 () Bool)

(assert (=> bm!27666 m!389051))

(assert (=> b!392214 d!73163))

(declare-fun b!392341 () Bool)

(declare-fun e!237585 () Bool)

(declare-fun call!27670 () Bool)

(assert (=> b!392341 (= e!237585 call!27670)))

(declare-fun b!392342 () Bool)

(assert (=> b!392342 (= e!237585 call!27670)))

(declare-fun bm!27667 () Bool)

(declare-fun c!54316 () Bool)

(assert (=> bm!27667 (= call!27670 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54316 (Cons!6293 (select (arr!11084 _keys!658) #b00000000000000000000000000000000) Nil!6294) Nil!6294)))))

(declare-fun b!392343 () Bool)

(declare-fun e!237584 () Bool)

(declare-fun e!237583 () Bool)

(assert (=> b!392343 (= e!237584 e!237583)))

(declare-fun res!224726 () Bool)

(assert (=> b!392343 (=> (not res!224726) (not e!237583))))

(declare-fun e!237586 () Bool)

(assert (=> b!392343 (= res!224726 (not e!237586))))

(declare-fun res!224725 () Bool)

(assert (=> b!392343 (=> (not res!224725) (not e!237586))))

(assert (=> b!392343 (= res!224725 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73165 () Bool)

(declare-fun res!224724 () Bool)

(assert (=> d!73165 (=> res!224724 e!237584)))

(assert (=> d!73165 (= res!224724 (bvsge #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(assert (=> d!73165 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6294) e!237584)))

(declare-fun b!392344 () Bool)

(assert (=> b!392344 (= e!237586 (contains!2443 Nil!6294 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392345 () Bool)

(assert (=> b!392345 (= e!237583 e!237585)))

(assert (=> b!392345 (= c!54316 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73165 (not res!224724)) b!392343))

(assert (= (and b!392343 res!224725) b!392344))

(assert (= (and b!392343 res!224726) b!392345))

(assert (= (and b!392345 c!54316) b!392341))

(assert (= (and b!392345 (not c!54316)) b!392342))

(assert (= (or b!392341 b!392342) bm!27667))

(assert (=> bm!27667 m!389041))

(declare-fun m!389053 () Bool)

(assert (=> bm!27667 m!389053))

(assert (=> b!392343 m!389041))

(assert (=> b!392343 m!389041))

(assert (=> b!392343 m!389049))

(assert (=> b!392344 m!389041))

(assert (=> b!392344 m!389041))

(declare-fun m!389055 () Bool)

(assert (=> b!392344 m!389055))

(assert (=> b!392345 m!389041))

(assert (=> b!392345 m!389041))

(assert (=> b!392345 m!389049))

(assert (=> b!392204 d!73165))

(declare-fun d!73167 () Bool)

(declare-fun e!237587 () Bool)

(assert (=> d!73167 e!237587))

(declare-fun res!224728 () Bool)

(assert (=> d!73167 (=> (not res!224728) (not e!237587))))

(declare-fun lt!185418 () ListLongMap!5365)

(assert (=> d!73167 (= res!224728 (contains!2444 lt!185418 (_1!3236 lt!185335)))))

(declare-fun lt!185419 () List!6298)

(assert (=> d!73167 (= lt!185418 (ListLongMap!5366 lt!185419))))

(declare-fun lt!185421 () Unit!11975)

(declare-fun lt!185420 () Unit!11975)

(assert (=> d!73167 (= lt!185421 lt!185420)))

(assert (=> d!73167 (= (getValueByKey!364 lt!185419 (_1!3236 lt!185335)) (Some!369 (_2!3236 lt!185335)))))

(assert (=> d!73167 (= lt!185420 (lemmaContainsTupThenGetReturnValue!186 lt!185419 (_1!3236 lt!185335) (_2!3236 lt!185335)))))

(assert (=> d!73167 (= lt!185419 (insertStrictlySorted!189 (toList!2698 lt!185334) (_1!3236 lt!185335) (_2!3236 lt!185335)))))

(assert (=> d!73167 (= (+!1052 lt!185334 lt!185335) lt!185418)))

(declare-fun b!392346 () Bool)

(declare-fun res!224727 () Bool)

(assert (=> b!392346 (=> (not res!224727) (not e!237587))))

(assert (=> b!392346 (= res!224727 (= (getValueByKey!364 (toList!2698 lt!185418) (_1!3236 lt!185335)) (Some!369 (_2!3236 lt!185335))))))

(declare-fun b!392347 () Bool)

(assert (=> b!392347 (= e!237587 (contains!2445 (toList!2698 lt!185418) lt!185335))))

(assert (= (and d!73167 res!224728) b!392346))

(assert (= (and b!392346 res!224727) b!392347))

(declare-fun m!389057 () Bool)

(assert (=> d!73167 m!389057))

(declare-fun m!389059 () Bool)

(assert (=> d!73167 m!389059))

(declare-fun m!389061 () Bool)

(assert (=> d!73167 m!389061))

(declare-fun m!389063 () Bool)

(assert (=> d!73167 m!389063))

(declare-fun m!389065 () Bool)

(assert (=> b!392346 m!389065))

(declare-fun m!389067 () Bool)

(assert (=> b!392347 m!389067))

(assert (=> b!392205 d!73167))

(declare-fun d!73169 () Bool)

(assert (=> d!73169 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392215 d!73169))

(declare-fun d!73171 () Bool)

(declare-fun res!224733 () Bool)

(declare-fun e!237592 () Bool)

(assert (=> d!73171 (=> res!224733 e!237592)))

(assert (=> d!73171 (= res!224733 (= (select (arr!11084 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73171 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237592)))

(declare-fun b!392352 () Bool)

(declare-fun e!237593 () Bool)

(assert (=> b!392352 (= e!237592 e!237593)))

(declare-fun res!224734 () Bool)

(assert (=> b!392352 (=> (not res!224734) (not e!237593))))

(assert (=> b!392352 (= res!224734 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11436 _keys!658)))))

(declare-fun b!392353 () Bool)

(assert (=> b!392353 (= e!237593 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73171 (not res!224733)) b!392352))

(assert (= (and b!392352 res!224734) b!392353))

(assert (=> d!73171 m!389041))

(declare-fun m!389069 () Bool)

(assert (=> b!392353 m!389069))

(assert (=> b!392207 d!73171))

(declare-fun b!392378 () Bool)

(declare-fun e!237609 () Bool)

(declare-fun e!237614 () Bool)

(assert (=> b!392378 (= e!237609 e!237614)))

(declare-fun c!54327 () Bool)

(declare-fun e!237611 () Bool)

(assert (=> b!392378 (= c!54327 e!237611)))

(declare-fun res!224743 () Bool)

(assert (=> b!392378 (=> (not res!224743) (not e!237611))))

(assert (=> b!392378 (= res!224743 (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun b!392379 () Bool)

(assert (=> b!392379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(assert (=> b!392379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 _values!506)))))

(declare-fun lt!185442 () ListLongMap!5365)

(declare-fun e!237613 () Bool)

(declare-fun apply!305 (ListLongMap!5365 (_ BitVec 64)) V!14011)

(declare-fun get!5611 (ValueCell!4496 V!14011) V!14011)

(declare-fun dynLambda!648 (Int (_ BitVec 64)) V!14011)

(assert (=> b!392379 (= e!237613 (= (apply!305 lt!185442 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)) (get!5611 (select (arr!11085 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392381 () Bool)

(declare-fun e!237612 () Bool)

(assert (=> b!392381 (= e!237614 e!237612)))

(declare-fun c!54328 () Bool)

(assert (=> b!392381 (= c!54328 (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun b!392382 () Bool)

(assert (=> b!392382 (= e!237612 (= lt!185442 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392383 () Bool)

(declare-fun isEmpty!557 (ListLongMap!5365) Bool)

(assert (=> b!392383 (= e!237612 (isEmpty!557 lt!185442))))

(declare-fun b!392384 () Bool)

(declare-fun lt!185440 () Unit!11975)

(declare-fun lt!185437 () Unit!11975)

(assert (=> b!392384 (= lt!185440 lt!185437)))

(declare-fun lt!185439 () ListLongMap!5365)

(declare-fun lt!185441 () V!14011)

(declare-fun lt!185436 () (_ BitVec 64))

(declare-fun lt!185438 () (_ BitVec 64))

(assert (=> b!392384 (not (contains!2444 (+!1052 lt!185439 (tuple2!6451 lt!185438 lt!185441)) lt!185436))))

(declare-fun addStillNotContains!140 (ListLongMap!5365 (_ BitVec 64) V!14011 (_ BitVec 64)) Unit!11975)

(assert (=> b!392384 (= lt!185437 (addStillNotContains!140 lt!185439 lt!185438 lt!185441 lt!185436))))

(assert (=> b!392384 (= lt!185436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392384 (= lt!185441 (get!5611 (select (arr!11085 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392384 (= lt!185438 (select (arr!11084 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27673 () ListLongMap!5365)

(assert (=> b!392384 (= lt!185439 call!27673)))

(declare-fun e!237610 () ListLongMap!5365)

(assert (=> b!392384 (= e!237610 (+!1052 call!27673 (tuple2!6451 (select (arr!11084 _keys!658) #b00000000000000000000000000000000) (get!5611 (select (arr!11085 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392385 () Bool)

(declare-fun e!237608 () ListLongMap!5365)

(assert (=> b!392385 (= e!237608 e!237610)))

(declare-fun c!54326 () Bool)

(assert (=> b!392385 (= c!54326 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392386 () Bool)

(assert (=> b!392386 (= e!237608 (ListLongMap!5366 Nil!6295))))

(declare-fun b!392387 () Bool)

(assert (=> b!392387 (= e!237611 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392387 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392388 () Bool)

(assert (=> b!392388 (= e!237610 call!27673)))

(declare-fun d!73173 () Bool)

(assert (=> d!73173 e!237609))

(declare-fun res!224744 () Bool)

(assert (=> d!73173 (=> (not res!224744) (not e!237609))))

(assert (=> d!73173 (= res!224744 (not (contains!2444 lt!185442 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73173 (= lt!185442 e!237608)))

(declare-fun c!54325 () Bool)

(assert (=> d!73173 (= c!54325 (bvsge #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(assert (=> d!73173 (validMask!0 mask!970)))

(assert (=> d!73173 (= (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185442)))

(declare-fun b!392380 () Bool)

(declare-fun res!224745 () Bool)

(assert (=> b!392380 (=> (not res!224745) (not e!237609))))

(assert (=> b!392380 (= res!224745 (not (contains!2444 lt!185442 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27670 () Bool)

(assert (=> bm!27670 (= call!27673 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392389 () Bool)

(assert (=> b!392389 (= e!237614 e!237613)))

(assert (=> b!392389 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun res!224746 () Bool)

(assert (=> b!392389 (= res!224746 (contains!2444 lt!185442 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392389 (=> (not res!224746) (not e!237613))))

(assert (= (and d!73173 c!54325) b!392386))

(assert (= (and d!73173 (not c!54325)) b!392385))

(assert (= (and b!392385 c!54326) b!392384))

(assert (= (and b!392385 (not c!54326)) b!392388))

(assert (= (or b!392384 b!392388) bm!27670))

(assert (= (and d!73173 res!224744) b!392380))

(assert (= (and b!392380 res!224745) b!392378))

(assert (= (and b!392378 res!224743) b!392387))

(assert (= (and b!392378 c!54327) b!392389))

(assert (= (and b!392378 (not c!54327)) b!392381))

(assert (= (and b!392389 res!224746) b!392379))

(assert (= (and b!392381 c!54328) b!392382))

(assert (= (and b!392381 (not c!54328)) b!392383))

(declare-fun b_lambda!8741 () Bool)

(assert (=> (not b_lambda!8741) (not b!392379)))

(declare-fun t!11460 () Bool)

(declare-fun tb!3117 () Bool)

(assert (=> (and start!38068 (= defaultEntry!514 defaultEntry!514) t!11460) tb!3117))

(declare-fun result!5747 () Bool)

(assert (=> tb!3117 (= result!5747 tp_is_empty!9679)))

(assert (=> b!392379 t!11460))

(declare-fun b_and!16365 () Bool)

(assert (= b_and!16359 (and (=> t!11460 result!5747) b_and!16365)))

(declare-fun b_lambda!8743 () Bool)

(assert (=> (not b_lambda!8743) (not b!392384)))

(assert (=> b!392384 t!11460))

(declare-fun b_and!16367 () Bool)

(assert (= b_and!16365 (and (=> t!11460 result!5747) b_and!16367)))

(declare-fun m!389071 () Bool)

(assert (=> b!392379 m!389071))

(declare-fun m!389073 () Bool)

(assert (=> b!392379 m!389073))

(assert (=> b!392379 m!389073))

(assert (=> b!392379 m!389071))

(declare-fun m!389075 () Bool)

(assert (=> b!392379 m!389075))

(assert (=> b!392379 m!389041))

(declare-fun m!389077 () Bool)

(assert (=> b!392379 m!389077))

(assert (=> b!392379 m!389041))

(declare-fun m!389079 () Bool)

(assert (=> b!392382 m!389079))

(assert (=> b!392384 m!389071))

(assert (=> b!392384 m!389073))

(assert (=> b!392384 m!389073))

(assert (=> b!392384 m!389071))

(assert (=> b!392384 m!389075))

(declare-fun m!389081 () Bool)

(assert (=> b!392384 m!389081))

(declare-fun m!389083 () Bool)

(assert (=> b!392384 m!389083))

(declare-fun m!389085 () Bool)

(assert (=> b!392384 m!389085))

(assert (=> b!392384 m!389041))

(assert (=> b!392384 m!389083))

(declare-fun m!389087 () Bool)

(assert (=> b!392384 m!389087))

(assert (=> b!392387 m!389041))

(assert (=> b!392387 m!389041))

(assert (=> b!392387 m!389049))

(assert (=> b!392385 m!389041))

(assert (=> b!392385 m!389041))

(assert (=> b!392385 m!389049))

(assert (=> bm!27670 m!389079))

(declare-fun m!389089 () Bool)

(assert (=> b!392380 m!389089))

(declare-fun m!389091 () Bool)

(assert (=> b!392383 m!389091))

(declare-fun m!389093 () Bool)

(assert (=> d!73173 m!389093))

(assert (=> d!73173 m!388911))

(assert (=> b!392389 m!389041))

(assert (=> b!392389 m!389041))

(declare-fun m!389095 () Bool)

(assert (=> b!392389 m!389095))

(assert (=> b!392212 d!73173))

(declare-fun d!73175 () Bool)

(declare-fun e!237642 () Bool)

(assert (=> d!73175 e!237642))

(declare-fun res!224767 () Bool)

(assert (=> d!73175 (=> (not res!224767) (not e!237642))))

(assert (=> d!73175 (= res!224767 (or (bvsge #b00000000000000000000000000000000 (size!11436 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))))

(declare-fun lt!185490 () ListLongMap!5365)

(declare-fun lt!185501 () ListLongMap!5365)

(assert (=> d!73175 (= lt!185490 lt!185501)))

(declare-fun lt!185498 () Unit!11975)

(declare-fun e!237647 () Unit!11975)

(assert (=> d!73175 (= lt!185498 e!237647)))

(declare-fun c!54345 () Bool)

(declare-fun e!237652 () Bool)

(assert (=> d!73175 (= c!54345 e!237652)))

(declare-fun res!224771 () Bool)

(assert (=> d!73175 (=> (not res!224771) (not e!237652))))

(assert (=> d!73175 (= res!224771 (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun e!237643 () ListLongMap!5365)

(assert (=> d!73175 (= lt!185501 e!237643)))

(declare-fun c!54343 () Bool)

(assert (=> d!73175 (= c!54343 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73175 (validMask!0 mask!970)))

(assert (=> d!73175 (= (getCurrentListMap!2076 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185490)))

(declare-fun b!392434 () Bool)

(declare-fun e!237650 () Bool)

(declare-fun call!27693 () Bool)

(assert (=> b!392434 (= e!237650 (not call!27693))))

(declare-fun bm!27685 () Bool)

(declare-fun call!27690 () ListLongMap!5365)

(declare-fun call!27691 () ListLongMap!5365)

(assert (=> bm!27685 (= call!27690 call!27691)))

(declare-fun b!392435 () Bool)

(declare-fun call!27689 () ListLongMap!5365)

(assert (=> b!392435 (= e!237643 (+!1052 call!27689 (tuple2!6451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392436 () Bool)

(declare-fun e!237644 () ListLongMap!5365)

(declare-fun call!27692 () ListLongMap!5365)

(assert (=> b!392436 (= e!237644 call!27692)))

(declare-fun bm!27686 () Bool)

(declare-fun call!27694 () Bool)

(assert (=> bm!27686 (= call!27694 (contains!2444 lt!185490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27687 () Bool)

(assert (=> bm!27687 (= call!27693 (contains!2444 lt!185490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392437 () Bool)

(declare-fun e!237649 () Bool)

(declare-fun e!237646 () Bool)

(assert (=> b!392437 (= e!237649 e!237646)))

(declare-fun res!224768 () Bool)

(assert (=> b!392437 (= res!224768 call!27694)))

(assert (=> b!392437 (=> (not res!224768) (not e!237646))))

(declare-fun b!392438 () Bool)

(declare-fun res!224766 () Bool)

(assert (=> b!392438 (=> (not res!224766) (not e!237642))))

(declare-fun e!237641 () Bool)

(assert (=> b!392438 (= res!224766 e!237641)))

(declare-fun res!224770 () Bool)

(assert (=> b!392438 (=> res!224770 e!237641)))

(declare-fun e!237651 () Bool)

(assert (=> b!392438 (= res!224770 (not e!237651))))

(declare-fun res!224769 () Bool)

(assert (=> b!392438 (=> (not res!224769) (not e!237651))))

(assert (=> b!392438 (= res!224769 (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun b!392439 () Bool)

(assert (=> b!392439 (= e!237642 e!237650)))

(declare-fun c!54344 () Bool)

(assert (=> b!392439 (= c!54344 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392440 () Bool)

(assert (=> b!392440 (= e!237652 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392441 () Bool)

(declare-fun lt!185507 () Unit!11975)

(assert (=> b!392441 (= e!237647 lt!185507)))

(declare-fun lt!185496 () ListLongMap!5365)

(assert (=> b!392441 (= lt!185496 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185499 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185487 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185487 (select (arr!11084 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185495 () Unit!11975)

(declare-fun addStillContains!281 (ListLongMap!5365 (_ BitVec 64) V!14011 (_ BitVec 64)) Unit!11975)

(assert (=> b!392441 (= lt!185495 (addStillContains!281 lt!185496 lt!185499 zeroValue!472 lt!185487))))

(assert (=> b!392441 (contains!2444 (+!1052 lt!185496 (tuple2!6451 lt!185499 zeroValue!472)) lt!185487)))

(declare-fun lt!185506 () Unit!11975)

(assert (=> b!392441 (= lt!185506 lt!185495)))

(declare-fun lt!185497 () ListLongMap!5365)

(assert (=> b!392441 (= lt!185497 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185489 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185489 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185491 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185491 (select (arr!11084 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185508 () Unit!11975)

(declare-fun addApplyDifferent!281 (ListLongMap!5365 (_ BitVec 64) V!14011 (_ BitVec 64)) Unit!11975)

(assert (=> b!392441 (= lt!185508 (addApplyDifferent!281 lt!185497 lt!185489 minValue!472 lt!185491))))

(assert (=> b!392441 (= (apply!305 (+!1052 lt!185497 (tuple2!6451 lt!185489 minValue!472)) lt!185491) (apply!305 lt!185497 lt!185491))))

(declare-fun lt!185500 () Unit!11975)

(assert (=> b!392441 (= lt!185500 lt!185508)))

(declare-fun lt!185503 () ListLongMap!5365)

(assert (=> b!392441 (= lt!185503 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185494 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185488 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185488 (select (arr!11084 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185492 () Unit!11975)

(assert (=> b!392441 (= lt!185492 (addApplyDifferent!281 lt!185503 lt!185494 zeroValue!472 lt!185488))))

(assert (=> b!392441 (= (apply!305 (+!1052 lt!185503 (tuple2!6451 lt!185494 zeroValue!472)) lt!185488) (apply!305 lt!185503 lt!185488))))

(declare-fun lt!185502 () Unit!11975)

(assert (=> b!392441 (= lt!185502 lt!185492)))

(declare-fun lt!185493 () ListLongMap!5365)

(assert (=> b!392441 (= lt!185493 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185505 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185504 () (_ BitVec 64))

(assert (=> b!392441 (= lt!185504 (select (arr!11084 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392441 (= lt!185507 (addApplyDifferent!281 lt!185493 lt!185505 minValue!472 lt!185504))))

(assert (=> b!392441 (= (apply!305 (+!1052 lt!185493 (tuple2!6451 lt!185505 minValue!472)) lt!185504) (apply!305 lt!185493 lt!185504))))

(declare-fun bm!27688 () Bool)

(declare-fun call!27688 () ListLongMap!5365)

(assert (=> bm!27688 (= call!27688 call!27690)))

(declare-fun e!237645 () Bool)

(declare-fun b!392442 () Bool)

(assert (=> b!392442 (= e!237645 (= (apply!305 lt!185490 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)) (get!5611 (select (arr!11085 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 _values!506)))))

(assert (=> b!392442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun b!392443 () Bool)

(declare-fun c!54342 () Bool)

(assert (=> b!392443 (= c!54342 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!237648 () ListLongMap!5365)

(assert (=> b!392443 (= e!237648 e!237644)))

(declare-fun b!392444 () Bool)

(declare-fun e!237653 () Bool)

(assert (=> b!392444 (= e!237650 e!237653)))

(declare-fun res!224765 () Bool)

(assert (=> b!392444 (= res!224765 call!27693)))

(assert (=> b!392444 (=> (not res!224765) (not e!237653))))

(declare-fun b!392445 () Bool)

(declare-fun res!224772 () Bool)

(assert (=> b!392445 (=> (not res!224772) (not e!237642))))

(assert (=> b!392445 (= res!224772 e!237649)))

(declare-fun c!54346 () Bool)

(assert (=> b!392445 (= c!54346 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392446 () Bool)

(assert (=> b!392446 (= e!237641 e!237645)))

(declare-fun res!224773 () Bool)

(assert (=> b!392446 (=> (not res!224773) (not e!237645))))

(assert (=> b!392446 (= res!224773 (contains!2444 lt!185490 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(declare-fun bm!27689 () Bool)

(assert (=> bm!27689 (= call!27692 call!27689)))

(declare-fun b!392447 () Bool)

(assert (=> b!392447 (= e!237649 (not call!27694))))

(declare-fun b!392448 () Bool)

(declare-fun Unit!11977 () Unit!11975)

(assert (=> b!392448 (= e!237647 Unit!11977)))

(declare-fun b!392449 () Bool)

(assert (=> b!392449 (= e!237644 call!27688)))

(declare-fun c!54341 () Bool)

(declare-fun bm!27690 () Bool)

(assert (=> bm!27690 (= call!27689 (+!1052 (ite c!54343 call!27691 (ite c!54341 call!27690 call!27688)) (ite (or c!54343 c!54341) (tuple2!6451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392450 () Bool)

(assert (=> b!392450 (= e!237646 (= (apply!305 lt!185490 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392451 () Bool)

(assert (=> b!392451 (= e!237643 e!237648)))

(assert (=> b!392451 (= c!54341 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27691 () Bool)

(assert (=> bm!27691 (= call!27691 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392452 () Bool)

(assert (=> b!392452 (= e!237651 (validKeyInArray!0 (select (arr!11084 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392453 () Bool)

(assert (=> b!392453 (= e!237648 call!27692)))

(declare-fun b!392454 () Bool)

(assert (=> b!392454 (= e!237653 (= (apply!305 lt!185490 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(assert (= (and d!73175 c!54343) b!392435))

(assert (= (and d!73175 (not c!54343)) b!392451))

(assert (= (and b!392451 c!54341) b!392453))

(assert (= (and b!392451 (not c!54341)) b!392443))

(assert (= (and b!392443 c!54342) b!392436))

(assert (= (and b!392443 (not c!54342)) b!392449))

(assert (= (or b!392436 b!392449) bm!27688))

(assert (= (or b!392453 bm!27688) bm!27685))

(assert (= (or b!392453 b!392436) bm!27689))

(assert (= (or b!392435 bm!27685) bm!27691))

(assert (= (or b!392435 bm!27689) bm!27690))

(assert (= (and d!73175 res!224771) b!392440))

(assert (= (and d!73175 c!54345) b!392441))

(assert (= (and d!73175 (not c!54345)) b!392448))

(assert (= (and d!73175 res!224767) b!392438))

(assert (= (and b!392438 res!224769) b!392452))

(assert (= (and b!392438 (not res!224770)) b!392446))

(assert (= (and b!392446 res!224773) b!392442))

(assert (= (and b!392438 res!224766) b!392445))

(assert (= (and b!392445 c!54346) b!392437))

(assert (= (and b!392445 (not c!54346)) b!392447))

(assert (= (and b!392437 res!224768) b!392450))

(assert (= (or b!392437 b!392447) bm!27686))

(assert (= (and b!392445 res!224772) b!392439))

(assert (= (and b!392439 c!54344) b!392444))

(assert (= (and b!392439 (not c!54344)) b!392434))

(assert (= (and b!392444 res!224765) b!392454))

(assert (= (or b!392444 b!392434) bm!27687))

(declare-fun b_lambda!8745 () Bool)

(assert (=> (not b_lambda!8745) (not b!392442)))

(assert (=> b!392442 t!11460))

(declare-fun b_and!16369 () Bool)

(assert (= b_and!16367 (and (=> t!11460 result!5747) b_and!16369)))

(assert (=> d!73175 m!388911))

(declare-fun m!389097 () Bool)

(assert (=> b!392450 m!389097))

(declare-fun m!389099 () Bool)

(assert (=> b!392435 m!389099))

(declare-fun m!389101 () Bool)

(assert (=> bm!27687 m!389101))

(declare-fun m!389103 () Bool)

(assert (=> bm!27690 m!389103))

(declare-fun m!389105 () Bool)

(assert (=> b!392441 m!389105))

(declare-fun m!389107 () Bool)

(assert (=> b!392441 m!389107))

(declare-fun m!389109 () Bool)

(assert (=> b!392441 m!389109))

(declare-fun m!389111 () Bool)

(assert (=> b!392441 m!389111))

(declare-fun m!389113 () Bool)

(assert (=> b!392441 m!389113))

(declare-fun m!389115 () Bool)

(assert (=> b!392441 m!389115))

(declare-fun m!389117 () Bool)

(assert (=> b!392441 m!389117))

(assert (=> b!392441 m!388901))

(declare-fun m!389119 () Bool)

(assert (=> b!392441 m!389119))

(declare-fun m!389121 () Bool)

(assert (=> b!392441 m!389121))

(declare-fun m!389123 () Bool)

(assert (=> b!392441 m!389123))

(declare-fun m!389125 () Bool)

(assert (=> b!392441 m!389125))

(assert (=> b!392441 m!389113))

(declare-fun m!389127 () Bool)

(assert (=> b!392441 m!389127))

(assert (=> b!392441 m!389041))

(assert (=> b!392441 m!389107))

(declare-fun m!389129 () Bool)

(assert (=> b!392441 m!389129))

(assert (=> b!392441 m!389119))

(declare-fun m!389131 () Bool)

(assert (=> b!392441 m!389131))

(assert (=> b!392441 m!389115))

(declare-fun m!389133 () Bool)

(assert (=> b!392441 m!389133))

(assert (=> b!392452 m!389041))

(assert (=> b!392452 m!389041))

(assert (=> b!392452 m!389049))

(assert (=> b!392442 m!389073))

(assert (=> b!392442 m!389041))

(assert (=> b!392442 m!389073))

(assert (=> b!392442 m!389071))

(assert (=> b!392442 m!389075))

(assert (=> b!392442 m!389041))

(declare-fun m!389135 () Bool)

(assert (=> b!392442 m!389135))

(assert (=> b!392442 m!389071))

(assert (=> b!392440 m!389041))

(assert (=> b!392440 m!389041))

(assert (=> b!392440 m!389049))

(assert (=> b!392446 m!389041))

(assert (=> b!392446 m!389041))

(declare-fun m!389137 () Bool)

(assert (=> b!392446 m!389137))

(declare-fun m!389139 () Bool)

(assert (=> bm!27686 m!389139))

(assert (=> bm!27691 m!388901))

(declare-fun m!389141 () Bool)

(assert (=> b!392454 m!389141))

(assert (=> b!392212 d!73175))

(declare-fun d!73177 () Bool)

(declare-fun e!237655 () Bool)

(assert (=> d!73177 e!237655))

(declare-fun res!224776 () Bool)

(assert (=> d!73177 (=> (not res!224776) (not e!237655))))

(assert (=> d!73177 (= res!224776 (or (bvsge #b00000000000000000000000000000000 (size!11436 lt!185332)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))))

(declare-fun lt!185512 () ListLongMap!5365)

(declare-fun lt!185523 () ListLongMap!5365)

(assert (=> d!73177 (= lt!185512 lt!185523)))

(declare-fun lt!185520 () Unit!11975)

(declare-fun e!237660 () Unit!11975)

(assert (=> d!73177 (= lt!185520 e!237660)))

(declare-fun c!54351 () Bool)

(declare-fun e!237665 () Bool)

(assert (=> d!73177 (= c!54351 e!237665)))

(declare-fun res!224780 () Bool)

(assert (=> d!73177 (=> (not res!224780) (not e!237665))))

(assert (=> d!73177 (= res!224780 (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun e!237656 () ListLongMap!5365)

(assert (=> d!73177 (= lt!185523 e!237656)))

(declare-fun c!54349 () Bool)

(assert (=> d!73177 (= c!54349 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73177 (validMask!0 mask!970)))

(assert (=> d!73177 (= (getCurrentListMap!2076 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185512)))

(declare-fun b!392455 () Bool)

(declare-fun e!237663 () Bool)

(declare-fun call!27700 () Bool)

(assert (=> b!392455 (= e!237663 (not call!27700))))

(declare-fun bm!27692 () Bool)

(declare-fun call!27697 () ListLongMap!5365)

(declare-fun call!27698 () ListLongMap!5365)

(assert (=> bm!27692 (= call!27697 call!27698)))

(declare-fun b!392456 () Bool)

(declare-fun call!27696 () ListLongMap!5365)

(assert (=> b!392456 (= e!237656 (+!1052 call!27696 (tuple2!6451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392457 () Bool)

(declare-fun e!237657 () ListLongMap!5365)

(declare-fun call!27699 () ListLongMap!5365)

(assert (=> b!392457 (= e!237657 call!27699)))

(declare-fun bm!27693 () Bool)

(declare-fun call!27701 () Bool)

(assert (=> bm!27693 (= call!27701 (contains!2444 lt!185512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27694 () Bool)

(assert (=> bm!27694 (= call!27700 (contains!2444 lt!185512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392458 () Bool)

(declare-fun e!237662 () Bool)

(declare-fun e!237659 () Bool)

(assert (=> b!392458 (= e!237662 e!237659)))

(declare-fun res!224777 () Bool)

(assert (=> b!392458 (= res!224777 call!27701)))

(assert (=> b!392458 (=> (not res!224777) (not e!237659))))

(declare-fun b!392459 () Bool)

(declare-fun res!224775 () Bool)

(assert (=> b!392459 (=> (not res!224775) (not e!237655))))

(declare-fun e!237654 () Bool)

(assert (=> b!392459 (= res!224775 e!237654)))

(declare-fun res!224779 () Bool)

(assert (=> b!392459 (=> res!224779 e!237654)))

(declare-fun e!237664 () Bool)

(assert (=> b!392459 (= res!224779 (not e!237664))))

(declare-fun res!224778 () Bool)

(assert (=> b!392459 (=> (not res!224778) (not e!237664))))

(assert (=> b!392459 (= res!224778 (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun b!392460 () Bool)

(assert (=> b!392460 (= e!237655 e!237663)))

(declare-fun c!54350 () Bool)

(assert (=> b!392460 (= c!54350 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392461 () Bool)

(assert (=> b!392461 (= e!237665 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(declare-fun b!392462 () Bool)

(declare-fun lt!185529 () Unit!11975)

(assert (=> b!392462 (= e!237660 lt!185529)))

(declare-fun lt!185518 () ListLongMap!5365)

(assert (=> b!392462 (= lt!185518 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185521 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185509 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185509 (select (arr!11084 lt!185332) #b00000000000000000000000000000000))))

(declare-fun lt!185517 () Unit!11975)

(assert (=> b!392462 (= lt!185517 (addStillContains!281 lt!185518 lt!185521 zeroValue!472 lt!185509))))

(assert (=> b!392462 (contains!2444 (+!1052 lt!185518 (tuple2!6451 lt!185521 zeroValue!472)) lt!185509)))

(declare-fun lt!185528 () Unit!11975)

(assert (=> b!392462 (= lt!185528 lt!185517)))

(declare-fun lt!185519 () ListLongMap!5365)

(assert (=> b!392462 (= lt!185519 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185511 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185513 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185513 (select (arr!11084 lt!185332) #b00000000000000000000000000000000))))

(declare-fun lt!185530 () Unit!11975)

(assert (=> b!392462 (= lt!185530 (addApplyDifferent!281 lt!185519 lt!185511 minValue!472 lt!185513))))

(assert (=> b!392462 (= (apply!305 (+!1052 lt!185519 (tuple2!6451 lt!185511 minValue!472)) lt!185513) (apply!305 lt!185519 lt!185513))))

(declare-fun lt!185522 () Unit!11975)

(assert (=> b!392462 (= lt!185522 lt!185530)))

(declare-fun lt!185525 () ListLongMap!5365)

(assert (=> b!392462 (= lt!185525 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185516 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185516 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185510 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185510 (select (arr!11084 lt!185332) #b00000000000000000000000000000000))))

(declare-fun lt!185514 () Unit!11975)

(assert (=> b!392462 (= lt!185514 (addApplyDifferent!281 lt!185525 lt!185516 zeroValue!472 lt!185510))))

(assert (=> b!392462 (= (apply!305 (+!1052 lt!185525 (tuple2!6451 lt!185516 zeroValue!472)) lt!185510) (apply!305 lt!185525 lt!185510))))

(declare-fun lt!185524 () Unit!11975)

(assert (=> b!392462 (= lt!185524 lt!185514)))

(declare-fun lt!185515 () ListLongMap!5365)

(assert (=> b!392462 (= lt!185515 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185527 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185527 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185526 () (_ BitVec 64))

(assert (=> b!392462 (= lt!185526 (select (arr!11084 lt!185332) #b00000000000000000000000000000000))))

(assert (=> b!392462 (= lt!185529 (addApplyDifferent!281 lt!185515 lt!185527 minValue!472 lt!185526))))

(assert (=> b!392462 (= (apply!305 (+!1052 lt!185515 (tuple2!6451 lt!185527 minValue!472)) lt!185526) (apply!305 lt!185515 lt!185526))))

(declare-fun bm!27695 () Bool)

(declare-fun call!27695 () ListLongMap!5365)

(assert (=> bm!27695 (= call!27695 call!27697)))

(declare-fun e!237658 () Bool)

(declare-fun b!392463 () Bool)

(assert (=> b!392463 (= e!237658 (= (apply!305 lt!185512 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)) (get!5611 (select (arr!11085 lt!185337) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 lt!185337)))))

(assert (=> b!392463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun b!392464 () Bool)

(declare-fun c!54348 () Bool)

(assert (=> b!392464 (= c!54348 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!237661 () ListLongMap!5365)

(assert (=> b!392464 (= e!237661 e!237657)))

(declare-fun b!392465 () Bool)

(declare-fun e!237666 () Bool)

(assert (=> b!392465 (= e!237663 e!237666)))

(declare-fun res!224774 () Bool)

(assert (=> b!392465 (= res!224774 call!27700)))

(assert (=> b!392465 (=> (not res!224774) (not e!237666))))

(declare-fun b!392466 () Bool)

(declare-fun res!224781 () Bool)

(assert (=> b!392466 (=> (not res!224781) (not e!237655))))

(assert (=> b!392466 (= res!224781 e!237662)))

(declare-fun c!54352 () Bool)

(assert (=> b!392466 (= c!54352 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392467 () Bool)

(assert (=> b!392467 (= e!237654 e!237658)))

(declare-fun res!224782 () Bool)

(assert (=> b!392467 (=> (not res!224782) (not e!237658))))

(assert (=> b!392467 (= res!224782 (contains!2444 lt!185512 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(assert (=> b!392467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun bm!27696 () Bool)

(assert (=> bm!27696 (= call!27699 call!27696)))

(declare-fun b!392468 () Bool)

(assert (=> b!392468 (= e!237662 (not call!27701))))

(declare-fun b!392469 () Bool)

(declare-fun Unit!11978 () Unit!11975)

(assert (=> b!392469 (= e!237660 Unit!11978)))

(declare-fun b!392470 () Bool)

(assert (=> b!392470 (= e!237657 call!27695)))

(declare-fun bm!27697 () Bool)

(declare-fun c!54347 () Bool)

(assert (=> bm!27697 (= call!27696 (+!1052 (ite c!54349 call!27698 (ite c!54347 call!27697 call!27695)) (ite (or c!54349 c!54347) (tuple2!6451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392471 () Bool)

(assert (=> b!392471 (= e!237659 (= (apply!305 lt!185512 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392472 () Bool)

(assert (=> b!392472 (= e!237656 e!237661)))

(assert (=> b!392472 (= c!54347 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27698 () Bool)

(assert (=> bm!27698 (= call!27698 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392473 () Bool)

(assert (=> b!392473 (= e!237664 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(declare-fun b!392474 () Bool)

(assert (=> b!392474 (= e!237661 call!27699)))

(declare-fun b!392475 () Bool)

(assert (=> b!392475 (= e!237666 (= (apply!305 lt!185512 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(assert (= (and d!73177 c!54349) b!392456))

(assert (= (and d!73177 (not c!54349)) b!392472))

(assert (= (and b!392472 c!54347) b!392474))

(assert (= (and b!392472 (not c!54347)) b!392464))

(assert (= (and b!392464 c!54348) b!392457))

(assert (= (and b!392464 (not c!54348)) b!392470))

(assert (= (or b!392457 b!392470) bm!27695))

(assert (= (or b!392474 bm!27695) bm!27692))

(assert (= (or b!392474 b!392457) bm!27696))

(assert (= (or b!392456 bm!27692) bm!27698))

(assert (= (or b!392456 bm!27696) bm!27697))

(assert (= (and d!73177 res!224780) b!392461))

(assert (= (and d!73177 c!54351) b!392462))

(assert (= (and d!73177 (not c!54351)) b!392469))

(assert (= (and d!73177 res!224776) b!392459))

(assert (= (and b!392459 res!224778) b!392473))

(assert (= (and b!392459 (not res!224779)) b!392467))

(assert (= (and b!392467 res!224782) b!392463))

(assert (= (and b!392459 res!224775) b!392466))

(assert (= (and b!392466 c!54352) b!392458))

(assert (= (and b!392466 (not c!54352)) b!392468))

(assert (= (and b!392458 res!224777) b!392471))

(assert (= (or b!392458 b!392468) bm!27693))

(assert (= (and b!392466 res!224781) b!392460))

(assert (= (and b!392460 c!54350) b!392465))

(assert (= (and b!392460 (not c!54350)) b!392455))

(assert (= (and b!392465 res!224774) b!392475))

(assert (= (or b!392465 b!392455) bm!27694))

(declare-fun b_lambda!8747 () Bool)

(assert (=> (not b_lambda!8747) (not b!392463)))

(assert (=> b!392463 t!11460))

(declare-fun b_and!16371 () Bool)

(assert (= b_and!16369 (and (=> t!11460 result!5747) b_and!16371)))

(assert (=> d!73177 m!388911))

(declare-fun m!389143 () Bool)

(assert (=> b!392471 m!389143))

(declare-fun m!389145 () Bool)

(assert (=> b!392456 m!389145))

(declare-fun m!389147 () Bool)

(assert (=> bm!27694 m!389147))

(declare-fun m!389149 () Bool)

(assert (=> bm!27697 m!389149))

(declare-fun m!389151 () Bool)

(assert (=> b!392462 m!389151))

(declare-fun m!389153 () Bool)

(assert (=> b!392462 m!389153))

(declare-fun m!389155 () Bool)

(assert (=> b!392462 m!389155))

(declare-fun m!389157 () Bool)

(assert (=> b!392462 m!389157))

(declare-fun m!389159 () Bool)

(assert (=> b!392462 m!389159))

(declare-fun m!389161 () Bool)

(assert (=> b!392462 m!389161))

(declare-fun m!389163 () Bool)

(assert (=> b!392462 m!389163))

(assert (=> b!392462 m!388895))

(declare-fun m!389165 () Bool)

(assert (=> b!392462 m!389165))

(declare-fun m!389167 () Bool)

(assert (=> b!392462 m!389167))

(declare-fun m!389169 () Bool)

(assert (=> b!392462 m!389169))

(declare-fun m!389171 () Bool)

(assert (=> b!392462 m!389171))

(assert (=> b!392462 m!389159))

(declare-fun m!389173 () Bool)

(assert (=> b!392462 m!389173))

(assert (=> b!392462 m!389009))

(assert (=> b!392462 m!389153))

(declare-fun m!389175 () Bool)

(assert (=> b!392462 m!389175))

(assert (=> b!392462 m!389165))

(declare-fun m!389177 () Bool)

(assert (=> b!392462 m!389177))

(assert (=> b!392462 m!389161))

(declare-fun m!389179 () Bool)

(assert (=> b!392462 m!389179))

(assert (=> b!392473 m!389009))

(assert (=> b!392473 m!389009))

(assert (=> b!392473 m!389013))

(declare-fun m!389181 () Bool)

(assert (=> b!392463 m!389181))

(assert (=> b!392463 m!389009))

(assert (=> b!392463 m!389181))

(assert (=> b!392463 m!389071))

(declare-fun m!389183 () Bool)

(assert (=> b!392463 m!389183))

(assert (=> b!392463 m!389009))

(declare-fun m!389185 () Bool)

(assert (=> b!392463 m!389185))

(assert (=> b!392463 m!389071))

(assert (=> b!392461 m!389009))

(assert (=> b!392461 m!389009))

(assert (=> b!392461 m!389013))

(assert (=> b!392467 m!389009))

(assert (=> b!392467 m!389009))

(declare-fun m!389187 () Bool)

(assert (=> b!392467 m!389187))

(declare-fun m!389189 () Bool)

(assert (=> bm!27693 m!389189))

(assert (=> bm!27698 m!388895))

(declare-fun m!389191 () Bool)

(assert (=> b!392475 m!389191))

(assert (=> b!392212 d!73177))

(declare-fun d!73179 () Bool)

(declare-fun e!237667 () Bool)

(assert (=> d!73179 e!237667))

(declare-fun res!224784 () Bool)

(assert (=> d!73179 (=> (not res!224784) (not e!237667))))

(declare-fun lt!185531 () ListLongMap!5365)

(assert (=> d!73179 (= res!224784 (contains!2444 lt!185531 (_1!3236 (tuple2!6451 k0!778 v!373))))))

(declare-fun lt!185532 () List!6298)

(assert (=> d!73179 (= lt!185531 (ListLongMap!5366 lt!185532))))

(declare-fun lt!185534 () Unit!11975)

(declare-fun lt!185533 () Unit!11975)

(assert (=> d!73179 (= lt!185534 lt!185533)))

(assert (=> d!73179 (= (getValueByKey!364 lt!185532 (_1!3236 (tuple2!6451 k0!778 v!373))) (Some!369 (_2!3236 (tuple2!6451 k0!778 v!373))))))

(assert (=> d!73179 (= lt!185533 (lemmaContainsTupThenGetReturnValue!186 lt!185532 (_1!3236 (tuple2!6451 k0!778 v!373)) (_2!3236 (tuple2!6451 k0!778 v!373))))))

(assert (=> d!73179 (= lt!185532 (insertStrictlySorted!189 (toList!2698 lt!185331) (_1!3236 (tuple2!6451 k0!778 v!373)) (_2!3236 (tuple2!6451 k0!778 v!373))))))

(assert (=> d!73179 (= (+!1052 lt!185331 (tuple2!6451 k0!778 v!373)) lt!185531)))

(declare-fun b!392476 () Bool)

(declare-fun res!224783 () Bool)

(assert (=> b!392476 (=> (not res!224783) (not e!237667))))

(assert (=> b!392476 (= res!224783 (= (getValueByKey!364 (toList!2698 lt!185531) (_1!3236 (tuple2!6451 k0!778 v!373))) (Some!369 (_2!3236 (tuple2!6451 k0!778 v!373)))))))

(declare-fun b!392477 () Bool)

(assert (=> b!392477 (= e!237667 (contains!2445 (toList!2698 lt!185531) (tuple2!6451 k0!778 v!373)))))

(assert (= (and d!73179 res!224784) b!392476))

(assert (= (and b!392476 res!224783) b!392477))

(declare-fun m!389193 () Bool)

(assert (=> d!73179 m!389193))

(declare-fun m!389195 () Bool)

(assert (=> d!73179 m!389195))

(declare-fun m!389197 () Bool)

(assert (=> d!73179 m!389197))

(declare-fun m!389199 () Bool)

(assert (=> d!73179 m!389199))

(declare-fun m!389201 () Bool)

(assert (=> b!392476 m!389201))

(declare-fun m!389203 () Bool)

(assert (=> b!392477 m!389203))

(assert (=> b!392212 d!73179))

(declare-fun b!392478 () Bool)

(declare-fun e!237669 () Bool)

(declare-fun e!237674 () Bool)

(assert (=> b!392478 (= e!237669 e!237674)))

(declare-fun c!54355 () Bool)

(declare-fun e!237671 () Bool)

(assert (=> b!392478 (= c!54355 e!237671)))

(declare-fun res!224785 () Bool)

(assert (=> b!392478 (=> (not res!224785) (not e!237671))))

(assert (=> b!392478 (= res!224785 (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun b!392479 () Bool)

(assert (=> b!392479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(assert (=> b!392479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 lt!185337)))))

(declare-fun e!237673 () Bool)

(declare-fun lt!185541 () ListLongMap!5365)

(assert (=> b!392479 (= e!237673 (= (apply!305 lt!185541 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)) (get!5611 (select (arr!11085 lt!185337) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392481 () Bool)

(declare-fun e!237672 () Bool)

(assert (=> b!392481 (= e!237674 e!237672)))

(declare-fun c!54356 () Bool)

(assert (=> b!392481 (= c!54356 (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun b!392482 () Bool)

(assert (=> b!392482 (= e!237672 (= lt!185541 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392483 () Bool)

(assert (=> b!392483 (= e!237672 (isEmpty!557 lt!185541))))

(declare-fun b!392484 () Bool)

(declare-fun lt!185539 () Unit!11975)

(declare-fun lt!185536 () Unit!11975)

(assert (=> b!392484 (= lt!185539 lt!185536)))

(declare-fun lt!185538 () ListLongMap!5365)

(declare-fun lt!185540 () V!14011)

(declare-fun lt!185535 () (_ BitVec 64))

(declare-fun lt!185537 () (_ BitVec 64))

(assert (=> b!392484 (not (contains!2444 (+!1052 lt!185538 (tuple2!6451 lt!185537 lt!185540)) lt!185535))))

(assert (=> b!392484 (= lt!185536 (addStillNotContains!140 lt!185538 lt!185537 lt!185540 lt!185535))))

(assert (=> b!392484 (= lt!185535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392484 (= lt!185540 (get!5611 (select (arr!11085 lt!185337) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392484 (= lt!185537 (select (arr!11084 lt!185332) #b00000000000000000000000000000000))))

(declare-fun call!27702 () ListLongMap!5365)

(assert (=> b!392484 (= lt!185538 call!27702)))

(declare-fun e!237670 () ListLongMap!5365)

(assert (=> b!392484 (= e!237670 (+!1052 call!27702 (tuple2!6451 (select (arr!11084 lt!185332) #b00000000000000000000000000000000) (get!5611 (select (arr!11085 lt!185337) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392485 () Bool)

(declare-fun e!237668 () ListLongMap!5365)

(assert (=> b!392485 (= e!237668 e!237670)))

(declare-fun c!54354 () Bool)

(assert (=> b!392485 (= c!54354 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(declare-fun b!392486 () Bool)

(assert (=> b!392486 (= e!237668 (ListLongMap!5366 Nil!6295))))

(declare-fun b!392487 () Bool)

(assert (=> b!392487 (= e!237671 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(assert (=> b!392487 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392488 () Bool)

(assert (=> b!392488 (= e!237670 call!27702)))

(declare-fun d!73181 () Bool)

(assert (=> d!73181 e!237669))

(declare-fun res!224786 () Bool)

(assert (=> d!73181 (=> (not res!224786) (not e!237669))))

(assert (=> d!73181 (= res!224786 (not (contains!2444 lt!185541 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73181 (= lt!185541 e!237668)))

(declare-fun c!54353 () Bool)

(assert (=> d!73181 (= c!54353 (bvsge #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(assert (=> d!73181 (validMask!0 mask!970)))

(assert (=> d!73181 (= (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185541)))

(declare-fun b!392480 () Bool)

(declare-fun res!224787 () Bool)

(assert (=> b!392480 (=> (not res!224787) (not e!237669))))

(assert (=> b!392480 (= res!224787 (not (contains!2444 lt!185541 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27699 () Bool)

(assert (=> bm!27699 (= call!27702 (getCurrentListMapNoExtraKeys!965 lt!185332 lt!185337 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392489 () Bool)

(assert (=> b!392489 (= e!237674 e!237673)))

(assert (=> b!392489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(declare-fun res!224788 () Bool)

(assert (=> b!392489 (= res!224788 (contains!2444 lt!185541 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(assert (=> b!392489 (=> (not res!224788) (not e!237673))))

(assert (= (and d!73181 c!54353) b!392486))

(assert (= (and d!73181 (not c!54353)) b!392485))

(assert (= (and b!392485 c!54354) b!392484))

(assert (= (and b!392485 (not c!54354)) b!392488))

(assert (= (or b!392484 b!392488) bm!27699))

(assert (= (and d!73181 res!224786) b!392480))

(assert (= (and b!392480 res!224787) b!392478))

(assert (= (and b!392478 res!224785) b!392487))

(assert (= (and b!392478 c!54355) b!392489))

(assert (= (and b!392478 (not c!54355)) b!392481))

(assert (= (and b!392489 res!224788) b!392479))

(assert (= (and b!392481 c!54356) b!392482))

(assert (= (and b!392481 (not c!54356)) b!392483))

(declare-fun b_lambda!8749 () Bool)

(assert (=> (not b_lambda!8749) (not b!392479)))

(assert (=> b!392479 t!11460))

(declare-fun b_and!16373 () Bool)

(assert (= b_and!16371 (and (=> t!11460 result!5747) b_and!16373)))

(declare-fun b_lambda!8751 () Bool)

(assert (=> (not b_lambda!8751) (not b!392484)))

(assert (=> b!392484 t!11460))

(declare-fun b_and!16375 () Bool)

(assert (= b_and!16373 (and (=> t!11460 result!5747) b_and!16375)))

(assert (=> b!392479 m!389071))

(assert (=> b!392479 m!389181))

(assert (=> b!392479 m!389181))

(assert (=> b!392479 m!389071))

(assert (=> b!392479 m!389183))

(assert (=> b!392479 m!389009))

(declare-fun m!389205 () Bool)

(assert (=> b!392479 m!389205))

(assert (=> b!392479 m!389009))

(declare-fun m!389207 () Bool)

(assert (=> b!392482 m!389207))

(assert (=> b!392484 m!389071))

(assert (=> b!392484 m!389181))

(assert (=> b!392484 m!389181))

(assert (=> b!392484 m!389071))

(assert (=> b!392484 m!389183))

(declare-fun m!389209 () Bool)

(assert (=> b!392484 m!389209))

(declare-fun m!389211 () Bool)

(assert (=> b!392484 m!389211))

(declare-fun m!389213 () Bool)

(assert (=> b!392484 m!389213))

(assert (=> b!392484 m!389009))

(assert (=> b!392484 m!389211))

(declare-fun m!389215 () Bool)

(assert (=> b!392484 m!389215))

(assert (=> b!392487 m!389009))

(assert (=> b!392487 m!389009))

(assert (=> b!392487 m!389013))

(assert (=> b!392485 m!389009))

(assert (=> b!392485 m!389009))

(assert (=> b!392485 m!389013))

(assert (=> bm!27699 m!389207))

(declare-fun m!389217 () Bool)

(assert (=> b!392480 m!389217))

(declare-fun m!389219 () Bool)

(assert (=> b!392483 m!389219))

(declare-fun m!389221 () Bool)

(assert (=> d!73181 m!389221))

(assert (=> d!73181 m!388911))

(assert (=> b!392489 m!389009))

(assert (=> b!392489 m!389009))

(declare-fun m!389223 () Bool)

(assert (=> b!392489 m!389223))

(assert (=> b!392212 d!73181))

(declare-fun b!392496 () Bool)

(declare-fun e!237679 () Bool)

(declare-fun call!27708 () ListLongMap!5365)

(declare-fun call!27707 () ListLongMap!5365)

(assert (=> b!392496 (= e!237679 (= call!27708 call!27707))))

(declare-fun bm!27704 () Bool)

(assert (=> bm!27704 (= call!27707 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392497 () Bool)

(assert (=> b!392497 (= e!237679 (= call!27708 (+!1052 call!27707 (tuple2!6451 k0!778 v!373))))))

(declare-fun d!73183 () Bool)

(declare-fun e!237680 () Bool)

(assert (=> d!73183 e!237680))

(declare-fun res!224791 () Bool)

(assert (=> d!73183 (=> (not res!224791) (not e!237680))))

(assert (=> d!73183 (= res!224791 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11436 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11437 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11436 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11437 _values!506))))))))

(declare-fun lt!185544 () Unit!11975)

(declare-fun choose!1327 (array!23248 array!23250 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) (_ BitVec 64) V!14011 (_ BitVec 32) Int) Unit!11975)

(assert (=> d!73183 (= lt!185544 (choose!1327 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11436 _keys!658)))))

(assert (=> d!73183 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185544)))

(declare-fun bm!27705 () Bool)

(assert (=> bm!27705 (= call!27708 (getCurrentListMapNoExtraKeys!965 (array!23249 (store (arr!11084 _keys!658) i!548 k0!778) (size!11436 _keys!658)) (array!23251 (store (arr!11085 _values!506) i!548 (ValueCellFull!4496 v!373)) (size!11437 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392498 () Bool)

(assert (=> b!392498 (= e!237680 e!237679)))

(declare-fun c!54359 () Bool)

(assert (=> b!392498 (= c!54359 (bvsle #b00000000000000000000000000000000 i!548))))

(assert (= (and d!73183 res!224791) b!392498))

(assert (= (and b!392498 c!54359) b!392497))

(assert (= (and b!392498 (not c!54359)) b!392496))

(assert (= (or b!392497 b!392496) bm!27704))

(assert (= (or b!392497 b!392496) bm!27705))

(assert (=> bm!27704 m!388901))

(declare-fun m!389225 () Bool)

(assert (=> b!392497 m!389225))

(declare-fun m!389227 () Bool)

(assert (=> d!73183 m!389227))

(assert (=> bm!27705 m!388909))

(assert (=> bm!27705 m!388897))

(declare-fun m!389229 () Bool)

(assert (=> bm!27705 m!389229))

(assert (=> b!392212 d!73183))

(declare-fun b!392499 () Bool)

(declare-fun e!237681 () Bool)

(declare-fun e!237683 () Bool)

(assert (=> b!392499 (= e!237681 e!237683)))

(declare-fun lt!185546 () (_ BitVec 64))

(assert (=> b!392499 (= lt!185546 (select (arr!11084 lt!185332) #b00000000000000000000000000000000))))

(declare-fun lt!185547 () Unit!11975)

(assert (=> b!392499 (= lt!185547 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185332 lt!185546 #b00000000000000000000000000000000))))

(assert (=> b!392499 (arrayContainsKey!0 lt!185332 lt!185546 #b00000000000000000000000000000000)))

(declare-fun lt!185545 () Unit!11975)

(assert (=> b!392499 (= lt!185545 lt!185547)))

(declare-fun res!224793 () Bool)

(assert (=> b!392499 (= res!224793 (= (seekEntryOrOpen!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000) lt!185332 mask!970) (Found!3465 #b00000000000000000000000000000000)))))

(assert (=> b!392499 (=> (not res!224793) (not e!237683))))

(declare-fun b!392500 () Bool)

(declare-fun call!27709 () Bool)

(assert (=> b!392500 (= e!237683 call!27709)))

(declare-fun b!392501 () Bool)

(assert (=> b!392501 (= e!237681 call!27709)))

(declare-fun d!73185 () Bool)

(declare-fun res!224792 () Bool)

(declare-fun e!237682 () Bool)

(assert (=> d!73185 (=> res!224792 e!237682)))

(assert (=> d!73185 (= res!224792 (bvsge #b00000000000000000000000000000000 (size!11436 lt!185332)))))

(assert (=> d!73185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185332 mask!970) e!237682)))

(declare-fun b!392502 () Bool)

(assert (=> b!392502 (= e!237682 e!237681)))

(declare-fun c!54360 () Bool)

(assert (=> b!392502 (= c!54360 (validKeyInArray!0 (select (arr!11084 lt!185332) #b00000000000000000000000000000000)))))

(declare-fun bm!27706 () Bool)

(assert (=> bm!27706 (= call!27709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185332 mask!970))))

(assert (= (and d!73185 (not res!224792)) b!392502))

(assert (= (and b!392502 c!54360) b!392499))

(assert (= (and b!392502 (not c!54360)) b!392501))

(assert (= (and b!392499 res!224793) b!392500))

(assert (= (or b!392500 b!392501) bm!27706))

(assert (=> b!392499 m!389009))

(declare-fun m!389231 () Bool)

(assert (=> b!392499 m!389231))

(declare-fun m!389233 () Bool)

(assert (=> b!392499 m!389233))

(assert (=> b!392499 m!389009))

(declare-fun m!389235 () Bool)

(assert (=> b!392499 m!389235))

(assert (=> b!392502 m!389009))

(assert (=> b!392502 m!389009))

(assert (=> b!392502 m!389013))

(declare-fun m!389237 () Bool)

(assert (=> bm!27706 m!389237))

(assert (=> b!392213 d!73185))

(declare-fun d!73187 () Bool)

(assert (=> d!73187 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38068 d!73187))

(declare-fun d!73189 () Bool)

(assert (=> d!73189 (= (array_inv!8192 _values!506) (bvsge (size!11437 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38068 d!73189))

(declare-fun d!73191 () Bool)

(assert (=> d!73191 (= (array_inv!8193 _keys!658) (bvsge (size!11436 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38068 d!73191))

(declare-fun mapIsEmpty!16116 () Bool)

(declare-fun mapRes!16116 () Bool)

(assert (=> mapIsEmpty!16116 mapRes!16116))

(declare-fun b!392509 () Bool)

(declare-fun e!237689 () Bool)

(assert (=> b!392509 (= e!237689 tp_is_empty!9679)))

(declare-fun condMapEmpty!16116 () Bool)

(declare-fun mapDefault!16116 () ValueCell!4496)

(assert (=> mapNonEmpty!16107 (= condMapEmpty!16116 (= mapRest!16107 ((as const (Array (_ BitVec 32) ValueCell!4496)) mapDefault!16116)))))

(declare-fun e!237688 () Bool)

(assert (=> mapNonEmpty!16107 (= tp!31796 (and e!237688 mapRes!16116))))

(declare-fun b!392510 () Bool)

(assert (=> b!392510 (= e!237688 tp_is_empty!9679)))

(declare-fun mapNonEmpty!16116 () Bool)

(declare-fun tp!31812 () Bool)

(assert (=> mapNonEmpty!16116 (= mapRes!16116 (and tp!31812 e!237689))))

(declare-fun mapValue!16116 () ValueCell!4496)

(declare-fun mapRest!16116 () (Array (_ BitVec 32) ValueCell!4496))

(declare-fun mapKey!16116 () (_ BitVec 32))

(assert (=> mapNonEmpty!16116 (= mapRest!16107 (store mapRest!16116 mapKey!16116 mapValue!16116))))

(assert (= (and mapNonEmpty!16107 condMapEmpty!16116) mapIsEmpty!16116))

(assert (= (and mapNonEmpty!16107 (not condMapEmpty!16116)) mapNonEmpty!16116))

(assert (= (and mapNonEmpty!16116 ((_ is ValueCellFull!4496) mapValue!16116)) b!392509))

(assert (= (and mapNonEmpty!16107 ((_ is ValueCellFull!4496) mapDefault!16116)) b!392510))

(declare-fun m!389239 () Bool)

(assert (=> mapNonEmpty!16116 m!389239))

(declare-fun b_lambda!8753 () Bool)

(assert (= b_lambda!8743 (or (and start!38068 b_free!9007) b_lambda!8753)))

(declare-fun b_lambda!8755 () Bool)

(assert (= b_lambda!8747 (or (and start!38068 b_free!9007) b_lambda!8755)))

(declare-fun b_lambda!8757 () Bool)

(assert (= b_lambda!8751 (or (and start!38068 b_free!9007) b_lambda!8757)))

(declare-fun b_lambda!8759 () Bool)

(assert (= b_lambda!8749 (or (and start!38068 b_free!9007) b_lambda!8759)))

(declare-fun b_lambda!8761 () Bool)

(assert (= b_lambda!8745 (or (and start!38068 b_free!9007) b_lambda!8761)))

(declare-fun b_lambda!8763 () Bool)

(assert (= b_lambda!8741 (or (and start!38068 b_free!9007) b_lambda!8763)))

(check-sat (not b!392319) (not b!392456) (not b!392452) (not bm!27704) (not b!392435) (not b!392320) (not b!392454) (not b_lambda!8763) (not bm!27705) (not b!392484) (not b!392483) (not bm!27687) (not b!392473) (not b!392471) (not b!392384) (not d!73167) (not mapNonEmpty!16116) (not b!392380) (not b!392343) (not b_lambda!8757) (not b!392497) (not b!392382) (not b!392482) (not b!392337) (not d!73183) (not b!392318) (not bm!27686) (not b!392389) (not b!392489) (not b_lambda!8753) (not b!392345) (not b!392502) (not bm!27670) (not b!392347) (not b!392475) (not b_next!9007) (not bm!27663) (not b!392383) (not bm!27691) (not b!392328) (not d!73179) (not b!392379) (not b_lambda!8755) (not b!392346) (not bm!27698) (not b!392340) (not d!73175) (not b!392441) (not b!392446) (not b!392440) b_and!16375 (not b!392476) (not b!392467) (not b!392387) (not b_lambda!8759) (not b!392463) (not b!392499) (not bm!27694) (not b!392325) (not d!73161) (not bm!27667) (not b!392344) (not d!73181) (not b!392353) (not bm!27690) (not bm!27699) (not bm!27697) (not d!73173) (not b!392326) (not b!392479) (not d!73159) (not d!73177) (not b!392385) (not b!392461) (not b_lambda!8761) (not b!392487) (not bm!27706) (not b!392485) (not b!392327) (not b!392480) (not b!392477) (not b!392442) (not bm!27666) tp_is_empty!9679 (not b!392462) (not bm!27693) (not b!392450))
(check-sat b_and!16375 (not b_next!9007))
