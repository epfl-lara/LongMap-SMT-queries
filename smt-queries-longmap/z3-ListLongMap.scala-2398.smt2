; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37926 () Bool)

(assert start!37926)

(declare-fun b_free!8953 () Bool)

(declare-fun b_next!8953 () Bool)

(assert (=> start!37926 (= b_free!8953 (not b_next!8953))))

(declare-fun tp!31623 () Bool)

(declare-fun b_and!16257 () Bool)

(assert (=> start!37926 (= tp!31623 b_and!16257)))

(declare-fun b!390201 () Bool)

(declare-fun e!236366 () Bool)

(declare-fun tp_is_empty!9625 () Bool)

(assert (=> b!390201 (= e!236366 tp_is_empty!9625)))

(declare-fun mapIsEmpty!16014 () Bool)

(declare-fun mapRes!16014 () Bool)

(assert (=> mapIsEmpty!16014 mapRes!16014))

(declare-fun b!390203 () Bool)

(declare-fun res!223309 () Bool)

(declare-fun e!236367 () Bool)

(assert (=> b!390203 (=> (not res!223309) (not e!236367))))

(declare-datatypes ((array!23132 0))(
  ( (array!23133 (arr!11030 (Array (_ BitVec 32) (_ BitVec 64))) (size!11382 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23132)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23132 (_ BitVec 32)) Bool)

(assert (=> b!390203 (= res!223309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390204 () Bool)

(declare-fun res!223313 () Bool)

(assert (=> b!390204 (=> (not res!223313) (not e!236367))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13939 0))(
  ( (V!13940 (val!4857 Int)) )
))
(declare-datatypes ((ValueCell!4469 0))(
  ( (ValueCellFull!4469 (v!7071 V!13939)) (EmptyCell!4469) )
))
(declare-datatypes ((array!23134 0))(
  ( (array!23135 (arr!11031 (Array (_ BitVec 32) ValueCell!4469)) (size!11383 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23134)

(assert (=> b!390204 (= res!223313 (and (= (size!11383 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11382 _keys!658) (size!11383 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16014 () Bool)

(declare-fun tp!31622 () Bool)

(declare-fun e!236369 () Bool)

(assert (=> mapNonEmpty!16014 (= mapRes!16014 (and tp!31622 e!236369))))

(declare-fun mapValue!16014 () ValueCell!4469)

(declare-fun mapRest!16014 () (Array (_ BitVec 32) ValueCell!4469))

(declare-fun mapKey!16014 () (_ BitVec 32))

(assert (=> mapNonEmpty!16014 (= (arr!11031 _values!506) (store mapRest!16014 mapKey!16014 mapValue!16014))))

(declare-fun b!390205 () Bool)

(declare-fun res!223316 () Bool)

(assert (=> b!390205 (=> (not res!223316) (not e!236367))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390205 (= res!223316 (validKeyInArray!0 k0!778))))

(declare-fun b!390206 () Bool)

(declare-fun res!223314 () Bool)

(assert (=> b!390206 (=> (not res!223314) (not e!236367))))

(declare-fun arrayContainsKey!0 (array!23132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390206 (= res!223314 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390207 () Bool)

(declare-fun res!223310 () Bool)

(assert (=> b!390207 (=> (not res!223310) (not e!236367))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390207 (= res!223310 (or (= (select (arr!11030 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11030 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390208 () Bool)

(declare-fun e!236365 () Bool)

(assert (=> b!390208 (= e!236365 (and e!236366 mapRes!16014))))

(declare-fun condMapEmpty!16014 () Bool)

(declare-fun mapDefault!16014 () ValueCell!4469)

(assert (=> b!390208 (= condMapEmpty!16014 (= (arr!11031 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4469)) mapDefault!16014)))))

(declare-fun e!236370 () Bool)

(declare-datatypes ((tuple2!6400 0))(
  ( (tuple2!6401 (_1!3211 (_ BitVec 64)) (_2!3211 V!13939)) )
))
(declare-datatypes ((List!6251 0))(
  ( (Nil!6248) (Cons!6247 (h!7103 tuple2!6400) (t!11401 List!6251)) )
))
(declare-datatypes ((ListLongMap!5315 0))(
  ( (ListLongMap!5316 (toList!2673 List!6251)) )
))
(declare-fun lt!183914 () ListLongMap!5315)

(declare-fun zeroValue!472 () V!13939)

(declare-fun b!390209 () Bool)

(declare-fun lt!183915 () ListLongMap!5315)

(declare-fun +!1027 (ListLongMap!5315 tuple2!6400) ListLongMap!5315)

(assert (=> b!390209 (= e!236370 (= lt!183914 (+!1027 lt!183915 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun b!390210 () Bool)

(declare-fun res!223308 () Bool)

(declare-fun e!236371 () Bool)

(assert (=> b!390210 (=> (not res!223308) (not e!236371))))

(declare-fun lt!183911 () array!23132)

(declare-datatypes ((List!6252 0))(
  ( (Nil!6249) (Cons!6248 (h!7104 (_ BitVec 64)) (t!11402 List!6252)) )
))
(declare-fun arrayNoDuplicates!0 (array!23132 (_ BitVec 32) List!6252) Bool)

(assert (=> b!390210 (= res!223308 (arrayNoDuplicates!0 lt!183911 #b00000000000000000000000000000000 Nil!6249))))

(declare-fun res!223311 () Bool)

(assert (=> start!37926 (=> (not res!223311) (not e!236367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37926 (= res!223311 (validMask!0 mask!970))))

(assert (=> start!37926 e!236367))

(declare-fun array_inv!8156 (array!23134) Bool)

(assert (=> start!37926 (and (array_inv!8156 _values!506) e!236365)))

(assert (=> start!37926 tp!31623))

(assert (=> start!37926 true))

(assert (=> start!37926 tp_is_empty!9625))

(declare-fun array_inv!8157 (array!23132) Bool)

(assert (=> start!37926 (array_inv!8157 _keys!658)))

(declare-fun b!390202 () Bool)

(assert (=> b!390202 (= e!236369 tp_is_empty!9625)))

(declare-fun b!390211 () Bool)

(declare-fun res!223317 () Bool)

(assert (=> b!390211 (=> (not res!223317) (not e!236367))))

(assert (=> b!390211 (= res!223317 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6249))))

(declare-fun b!390212 () Bool)

(assert (=> b!390212 (= e!236367 e!236371)))

(declare-fun res!223315 () Bool)

(assert (=> b!390212 (=> (not res!223315) (not e!236371))))

(assert (=> b!390212 (= res!223315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183911 mask!970))))

(assert (=> b!390212 (= lt!183911 (array!23133 (store (arr!11030 _keys!658) i!548 k0!778) (size!11382 _keys!658)))))

(declare-fun b!390213 () Bool)

(declare-fun res!223312 () Bool)

(assert (=> b!390213 (=> (not res!223312) (not e!236367))))

(assert (=> b!390213 (= res!223312 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11382 _keys!658))))))

(declare-fun b!390214 () Bool)

(assert (=> b!390214 (= e!236371 (not e!236370))))

(declare-fun res!223318 () Bool)

(assert (=> b!390214 (=> res!223318 e!236370)))

(assert (=> b!390214 (= res!223318 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!183910 () ListLongMap!5315)

(declare-fun minValue!472 () V!13939)

(declare-fun getCurrentListMap!2055 (array!23132 array!23134 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) Int) ListLongMap!5315)

(assert (=> b!390214 (= lt!183910 (getCurrentListMap!2055 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183912 () array!23134)

(assert (=> b!390214 (= lt!183914 (getCurrentListMap!2055 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183916 () ListLongMap!5315)

(assert (=> b!390214 (and (= lt!183915 lt!183916) (= lt!183916 lt!183915))))

(declare-fun v!373 () V!13939)

(declare-fun lt!183909 () ListLongMap!5315)

(assert (=> b!390214 (= lt!183916 (+!1027 lt!183909 (tuple2!6401 k0!778 v!373)))))

(declare-datatypes ((Unit!11925 0))(
  ( (Unit!11926) )
))
(declare-fun lt!183913 () Unit!11925)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 (array!23132 array!23134 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) (_ BitVec 64) V!13939 (_ BitVec 32) Int) Unit!11925)

(assert (=> b!390214 (= lt!183913 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!944 (array!23132 array!23134 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) Int) ListLongMap!5315)

(assert (=> b!390214 (= lt!183915 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390214 (= lt!183912 (array!23135 (store (arr!11031 _values!506) i!548 (ValueCellFull!4469 v!373)) (size!11383 _values!506)))))

(assert (=> b!390214 (= lt!183909 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37926 res!223311) b!390204))

(assert (= (and b!390204 res!223313) b!390203))

(assert (= (and b!390203 res!223309) b!390211))

(assert (= (and b!390211 res!223317) b!390213))

(assert (= (and b!390213 res!223312) b!390205))

(assert (= (and b!390205 res!223316) b!390207))

(assert (= (and b!390207 res!223310) b!390206))

(assert (= (and b!390206 res!223314) b!390212))

(assert (= (and b!390212 res!223315) b!390210))

(assert (= (and b!390210 res!223308) b!390214))

(assert (= (and b!390214 (not res!223318)) b!390209))

(assert (= (and b!390208 condMapEmpty!16014) mapIsEmpty!16014))

(assert (= (and b!390208 (not condMapEmpty!16014)) mapNonEmpty!16014))

(get-info :version)

(assert (= (and mapNonEmpty!16014 ((_ is ValueCellFull!4469) mapValue!16014)) b!390202))

(assert (= (and b!390208 ((_ is ValueCellFull!4469) mapDefault!16014)) b!390201))

(assert (= start!37926 b!390208))

(declare-fun m!386815 () Bool)

(assert (=> b!390211 m!386815))

(declare-fun m!386817 () Bool)

(assert (=> b!390214 m!386817))

(declare-fun m!386819 () Bool)

(assert (=> b!390214 m!386819))

(declare-fun m!386821 () Bool)

(assert (=> b!390214 m!386821))

(declare-fun m!386823 () Bool)

(assert (=> b!390214 m!386823))

(declare-fun m!386825 () Bool)

(assert (=> b!390214 m!386825))

(declare-fun m!386827 () Bool)

(assert (=> b!390214 m!386827))

(declare-fun m!386829 () Bool)

(assert (=> b!390214 m!386829))

(declare-fun m!386831 () Bool)

(assert (=> b!390210 m!386831))

(declare-fun m!386833 () Bool)

(assert (=> b!390203 m!386833))

(declare-fun m!386835 () Bool)

(assert (=> mapNonEmpty!16014 m!386835))

(declare-fun m!386837 () Bool)

(assert (=> b!390212 m!386837))

(declare-fun m!386839 () Bool)

(assert (=> b!390212 m!386839))

(declare-fun m!386841 () Bool)

(assert (=> b!390206 m!386841))

(declare-fun m!386843 () Bool)

(assert (=> start!37926 m!386843))

(declare-fun m!386845 () Bool)

(assert (=> start!37926 m!386845))

(declare-fun m!386847 () Bool)

(assert (=> start!37926 m!386847))

(declare-fun m!386849 () Bool)

(assert (=> b!390205 m!386849))

(declare-fun m!386851 () Bool)

(assert (=> b!390209 m!386851))

(declare-fun m!386853 () Bool)

(assert (=> b!390207 m!386853))

(check-sat (not b!390210) tp_is_empty!9625 (not start!37926) (not b!390205) (not b!390212) (not b!390203) (not b!390209) b_and!16257 (not b_next!8953) (not b!390211) (not b!390206) (not mapNonEmpty!16014) (not b!390214))
(check-sat b_and!16257 (not b_next!8953))
(get-model)

(declare-fun b!390307 () Bool)

(declare-fun e!236421 () Bool)

(declare-fun call!27482 () Bool)

(assert (=> b!390307 (= e!236421 call!27482)))

(declare-fun d!73005 () Bool)

(declare-fun res!223390 () Bool)

(declare-fun e!236420 () Bool)

(assert (=> d!73005 (=> res!223390 e!236420)))

(assert (=> d!73005 (= res!223390 (bvsge #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(assert (=> d!73005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183911 mask!970) e!236420)))

(declare-fun b!390308 () Bool)

(declare-fun e!236422 () Bool)

(assert (=> b!390308 (= e!236422 call!27482)))

(declare-fun b!390309 () Bool)

(assert (=> b!390309 (= e!236420 e!236421)))

(declare-fun c!54108 () Bool)

(assert (=> b!390309 (= c!54108 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(declare-fun bm!27479 () Bool)

(assert (=> bm!27479 (= call!27482 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!183911 mask!970))))

(declare-fun b!390310 () Bool)

(assert (=> b!390310 (= e!236421 e!236422)))

(declare-fun lt!183973 () (_ BitVec 64))

(assert (=> b!390310 (= lt!183973 (select (arr!11030 lt!183911) #b00000000000000000000000000000000))))

(declare-fun lt!183971 () Unit!11925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23132 (_ BitVec 64) (_ BitVec 32)) Unit!11925)

(assert (=> b!390310 (= lt!183971 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!183911 lt!183973 #b00000000000000000000000000000000))))

(assert (=> b!390310 (arrayContainsKey!0 lt!183911 lt!183973 #b00000000000000000000000000000000)))

(declare-fun lt!183972 () Unit!11925)

(assert (=> b!390310 (= lt!183972 lt!183971)))

(declare-fun res!223389 () Bool)

(declare-datatypes ((SeekEntryResult!3461 0))(
  ( (MissingZero!3461 (index!16023 (_ BitVec 32))) (Found!3461 (index!16024 (_ BitVec 32))) (Intermediate!3461 (undefined!4273 Bool) (index!16025 (_ BitVec 32)) (x!38239 (_ BitVec 32))) (Undefined!3461) (MissingVacant!3461 (index!16026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23132 (_ BitVec 32)) SeekEntryResult!3461)

(assert (=> b!390310 (= res!223389 (= (seekEntryOrOpen!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000) lt!183911 mask!970) (Found!3461 #b00000000000000000000000000000000)))))

(assert (=> b!390310 (=> (not res!223389) (not e!236422))))

(assert (= (and d!73005 (not res!223390)) b!390309))

(assert (= (and b!390309 c!54108) b!390310))

(assert (= (and b!390309 (not c!54108)) b!390307))

(assert (= (and b!390310 res!223389) b!390308))

(assert (= (or b!390308 b!390307) bm!27479))

(declare-fun m!386935 () Bool)

(assert (=> b!390309 m!386935))

(assert (=> b!390309 m!386935))

(declare-fun m!386937 () Bool)

(assert (=> b!390309 m!386937))

(declare-fun m!386939 () Bool)

(assert (=> bm!27479 m!386939))

(assert (=> b!390310 m!386935))

(declare-fun m!386941 () Bool)

(assert (=> b!390310 m!386941))

(declare-fun m!386943 () Bool)

(assert (=> b!390310 m!386943))

(assert (=> b!390310 m!386935))

(declare-fun m!386945 () Bool)

(assert (=> b!390310 m!386945))

(assert (=> b!390212 d!73005))

(declare-fun b!390311 () Bool)

(declare-fun e!236424 () Bool)

(declare-fun call!27483 () Bool)

(assert (=> b!390311 (= e!236424 call!27483)))

(declare-fun d!73007 () Bool)

(declare-fun res!223392 () Bool)

(declare-fun e!236423 () Bool)

(assert (=> d!73007 (=> res!223392 e!236423)))

(assert (=> d!73007 (= res!223392 (bvsge #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (=> d!73007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236423)))

(declare-fun b!390312 () Bool)

(declare-fun e!236425 () Bool)

(assert (=> b!390312 (= e!236425 call!27483)))

(declare-fun b!390313 () Bool)

(assert (=> b!390313 (= e!236423 e!236424)))

(declare-fun c!54109 () Bool)

(assert (=> b!390313 (= c!54109 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27480 () Bool)

(assert (=> bm!27480 (= call!27483 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!390314 () Bool)

(assert (=> b!390314 (= e!236424 e!236425)))

(declare-fun lt!183976 () (_ BitVec 64))

(assert (=> b!390314 (= lt!183976 (select (arr!11030 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183974 () Unit!11925)

(assert (=> b!390314 (= lt!183974 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!183976 #b00000000000000000000000000000000))))

(assert (=> b!390314 (arrayContainsKey!0 _keys!658 lt!183976 #b00000000000000000000000000000000)))

(declare-fun lt!183975 () Unit!11925)

(assert (=> b!390314 (= lt!183975 lt!183974)))

(declare-fun res!223391 () Bool)

(assert (=> b!390314 (= res!223391 (= (seekEntryOrOpen!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3461 #b00000000000000000000000000000000)))))

(assert (=> b!390314 (=> (not res!223391) (not e!236425))))

(assert (= (and d!73007 (not res!223392)) b!390313))

(assert (= (and b!390313 c!54109) b!390314))

(assert (= (and b!390313 (not c!54109)) b!390311))

(assert (= (and b!390314 res!223391) b!390312))

(assert (= (or b!390312 b!390311) bm!27480))

(declare-fun m!386947 () Bool)

(assert (=> b!390313 m!386947))

(assert (=> b!390313 m!386947))

(declare-fun m!386949 () Bool)

(assert (=> b!390313 m!386949))

(declare-fun m!386951 () Bool)

(assert (=> bm!27480 m!386951))

(assert (=> b!390314 m!386947))

(declare-fun m!386953 () Bool)

(assert (=> b!390314 m!386953))

(declare-fun m!386955 () Bool)

(assert (=> b!390314 m!386955))

(assert (=> b!390314 m!386947))

(declare-fun m!386957 () Bool)

(assert (=> b!390314 m!386957))

(assert (=> b!390203 d!73007))

(declare-fun b!390325 () Bool)

(declare-fun e!236434 () Bool)

(declare-fun e!236436 () Bool)

(assert (=> b!390325 (= e!236434 e!236436)))

(declare-fun res!223401 () Bool)

(assert (=> b!390325 (=> (not res!223401) (not e!236436))))

(declare-fun e!236435 () Bool)

(assert (=> b!390325 (= res!223401 (not e!236435))))

(declare-fun res!223400 () Bool)

(assert (=> b!390325 (=> (not res!223400) (not e!236435))))

(assert (=> b!390325 (= res!223400 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27483 () Bool)

(declare-fun call!27486 () Bool)

(declare-fun c!54112 () Bool)

(assert (=> bm!27483 (= call!27486 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54112 (Cons!6248 (select (arr!11030 _keys!658) #b00000000000000000000000000000000) Nil!6249) Nil!6249)))))

(declare-fun b!390326 () Bool)

(declare-fun e!236437 () Bool)

(assert (=> b!390326 (= e!236437 call!27486)))

(declare-fun b!390327 () Bool)

(assert (=> b!390327 (= e!236436 e!236437)))

(assert (=> b!390327 (= c!54112 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73009 () Bool)

(declare-fun res!223399 () Bool)

(assert (=> d!73009 (=> res!223399 e!236434)))

(assert (=> d!73009 (= res!223399 (bvsge #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (=> d!73009 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6249) e!236434)))

(declare-fun b!390328 () Bool)

(assert (=> b!390328 (= e!236437 call!27486)))

(declare-fun b!390329 () Bool)

(declare-fun contains!2431 (List!6252 (_ BitVec 64)) Bool)

(assert (=> b!390329 (= e!236435 (contains!2431 Nil!6249 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73009 (not res!223399)) b!390325))

(assert (= (and b!390325 res!223400) b!390329))

(assert (= (and b!390325 res!223401) b!390327))

(assert (= (and b!390327 c!54112) b!390328))

(assert (= (and b!390327 (not c!54112)) b!390326))

(assert (= (or b!390328 b!390326) bm!27483))

(assert (=> b!390325 m!386947))

(assert (=> b!390325 m!386947))

(assert (=> b!390325 m!386949))

(assert (=> bm!27483 m!386947))

(declare-fun m!386959 () Bool)

(assert (=> bm!27483 m!386959))

(assert (=> b!390327 m!386947))

(assert (=> b!390327 m!386947))

(assert (=> b!390327 m!386949))

(assert (=> b!390329 m!386947))

(assert (=> b!390329 m!386947))

(declare-fun m!386961 () Bool)

(assert (=> b!390329 m!386961))

(assert (=> b!390211 d!73009))

(declare-fun d!73011 () Bool)

(declare-fun res!223406 () Bool)

(declare-fun e!236442 () Bool)

(assert (=> d!73011 (=> res!223406 e!236442)))

(assert (=> d!73011 (= res!223406 (= (select (arr!11030 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73011 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236442)))

(declare-fun b!390334 () Bool)

(declare-fun e!236443 () Bool)

(assert (=> b!390334 (= e!236442 e!236443)))

(declare-fun res!223407 () Bool)

(assert (=> b!390334 (=> (not res!223407) (not e!236443))))

(assert (=> b!390334 (= res!223407 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11382 _keys!658)))))

(declare-fun b!390335 () Bool)

(assert (=> b!390335 (= e!236443 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73011 (not res!223406)) b!390334))

(assert (= (and b!390334 res!223407) b!390335))

(assert (=> d!73011 m!386947))

(declare-fun m!386963 () Bool)

(assert (=> b!390335 m!386963))

(assert (=> b!390206 d!73011))

(declare-fun d!73013 () Bool)

(assert (=> d!73013 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37926 d!73013))

(declare-fun d!73015 () Bool)

(assert (=> d!73015 (= (array_inv!8156 _values!506) (bvsge (size!11383 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37926 d!73015))

(declare-fun d!73017 () Bool)

(assert (=> d!73017 (= (array_inv!8157 _keys!658) (bvsge (size!11382 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37926 d!73017))

(declare-fun d!73019 () Bool)

(assert (=> d!73019 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390205 d!73019))

(declare-fun b!390336 () Bool)

(declare-fun e!236444 () Bool)

(declare-fun e!236446 () Bool)

(assert (=> b!390336 (= e!236444 e!236446)))

(declare-fun res!223410 () Bool)

(assert (=> b!390336 (=> (not res!223410) (not e!236446))))

(declare-fun e!236445 () Bool)

(assert (=> b!390336 (= res!223410 (not e!236445))))

(declare-fun res!223409 () Bool)

(assert (=> b!390336 (=> (not res!223409) (not e!236445))))

(assert (=> b!390336 (= res!223409 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(declare-fun bm!27484 () Bool)

(declare-fun call!27487 () Bool)

(declare-fun c!54113 () Bool)

(assert (=> bm!27484 (= call!27487 (arrayNoDuplicates!0 lt!183911 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54113 (Cons!6248 (select (arr!11030 lt!183911) #b00000000000000000000000000000000) Nil!6249) Nil!6249)))))

(declare-fun b!390337 () Bool)

(declare-fun e!236447 () Bool)

(assert (=> b!390337 (= e!236447 call!27487)))

(declare-fun b!390338 () Bool)

(assert (=> b!390338 (= e!236446 e!236447)))

(assert (=> b!390338 (= c!54113 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(declare-fun d!73021 () Bool)

(declare-fun res!223408 () Bool)

(assert (=> d!73021 (=> res!223408 e!236444)))

(assert (=> d!73021 (= res!223408 (bvsge #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(assert (=> d!73021 (= (arrayNoDuplicates!0 lt!183911 #b00000000000000000000000000000000 Nil!6249) e!236444)))

(declare-fun b!390339 () Bool)

(assert (=> b!390339 (= e!236447 call!27487)))

(declare-fun b!390340 () Bool)

(assert (=> b!390340 (= e!236445 (contains!2431 Nil!6249 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(assert (= (and d!73021 (not res!223408)) b!390336))

(assert (= (and b!390336 res!223409) b!390340))

(assert (= (and b!390336 res!223410) b!390338))

(assert (= (and b!390338 c!54113) b!390339))

(assert (= (and b!390338 (not c!54113)) b!390337))

(assert (= (or b!390339 b!390337) bm!27484))

(assert (=> b!390336 m!386935))

(assert (=> b!390336 m!386935))

(assert (=> b!390336 m!386937))

(assert (=> bm!27484 m!386935))

(declare-fun m!386965 () Bool)

(assert (=> bm!27484 m!386965))

(assert (=> b!390338 m!386935))

(assert (=> b!390338 m!386935))

(assert (=> b!390338 m!386937))

(assert (=> b!390340 m!386935))

(assert (=> b!390340 m!386935))

(declare-fun m!386967 () Bool)

(assert (=> b!390340 m!386967))

(assert (=> b!390210 d!73021))

(declare-fun d!73023 () Bool)

(declare-fun e!236450 () Bool)

(assert (=> d!73023 e!236450))

(declare-fun res!223415 () Bool)

(assert (=> d!73023 (=> (not res!223415) (not e!236450))))

(declare-fun lt!183987 () ListLongMap!5315)

(declare-fun contains!2432 (ListLongMap!5315 (_ BitVec 64)) Bool)

(assert (=> d!73023 (= res!223415 (contains!2432 lt!183987 (_1!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lt!183985 () List!6251)

(assert (=> d!73023 (= lt!183987 (ListLongMap!5316 lt!183985))))

(declare-fun lt!183986 () Unit!11925)

(declare-fun lt!183988 () Unit!11925)

(assert (=> d!73023 (= lt!183986 lt!183988)))

(declare-datatypes ((Option!366 0))(
  ( (Some!365 (v!7077 V!13939)) (None!364) )
))
(declare-fun getValueByKey!360 (List!6251 (_ BitVec 64)) Option!366)

(assert (=> d!73023 (= (getValueByKey!360 lt!183985 (_1!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!365 (_2!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lemmaContainsTupThenGetReturnValue!182 (List!6251 (_ BitVec 64) V!13939) Unit!11925)

(assert (=> d!73023 (= lt!183988 (lemmaContainsTupThenGetReturnValue!182 lt!183985 (_1!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun insertStrictlySorted!185 (List!6251 (_ BitVec 64) V!13939) List!6251)

(assert (=> d!73023 (= lt!183985 (insertStrictlySorted!185 (toList!2673 lt!183915) (_1!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!73023 (= (+!1027 lt!183915 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) lt!183987)))

(declare-fun b!390345 () Bool)

(declare-fun res!223416 () Bool)

(assert (=> b!390345 (=> (not res!223416) (not e!236450))))

(assert (=> b!390345 (= res!223416 (= (getValueByKey!360 (toList!2673 lt!183987) (_1!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!365 (_2!3211 (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))))

(declare-fun b!390346 () Bool)

(declare-fun contains!2433 (List!6251 tuple2!6400) Bool)

(assert (=> b!390346 (= e!236450 (contains!2433 (toList!2673 lt!183987) (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))

(assert (= (and d!73023 res!223415) b!390345))

(assert (= (and b!390345 res!223416) b!390346))

(declare-fun m!386969 () Bool)

(assert (=> d!73023 m!386969))

(declare-fun m!386971 () Bool)

(assert (=> d!73023 m!386971))

(declare-fun m!386973 () Bool)

(assert (=> d!73023 m!386973))

(declare-fun m!386975 () Bool)

(assert (=> d!73023 m!386975))

(declare-fun m!386977 () Bool)

(assert (=> b!390345 m!386977))

(declare-fun m!386979 () Bool)

(assert (=> b!390346 m!386979))

(assert (=> b!390209 d!73023))

(declare-fun e!236469 () Bool)

(declare-fun b!390371 () Bool)

(declare-fun lt!184009 () ListLongMap!5315)

(assert (=> b!390371 (= e!236469 (= lt!184009 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390372 () Bool)

(declare-fun e!236468 () Bool)

(declare-fun e!236467 () Bool)

(assert (=> b!390372 (= e!236468 e!236467)))

(assert (=> b!390372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(declare-fun res!223425 () Bool)

(assert (=> b!390372 (= res!223425 (contains!2432 lt!184009 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390372 (=> (not res!223425) (not e!236467))))

(declare-fun b!390373 () Bool)

(assert (=> b!390373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (=> b!390373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11383 _values!506)))))

(declare-fun apply!301 (ListLongMap!5315 (_ BitVec 64)) V!13939)

(declare-fun get!5589 (ValueCell!4469 V!13939) V!13939)

(declare-fun dynLambda!644 (Int (_ BitVec 64)) V!13939)

(assert (=> b!390373 (= e!236467 (= (apply!301 lt!184009 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)) (get!5589 (select (arr!11031 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390374 () Bool)

(declare-fun e!236466 () ListLongMap!5315)

(declare-fun call!27490 () ListLongMap!5315)

(assert (=> b!390374 (= e!236466 call!27490)))

(declare-fun b!390375 () Bool)

(declare-fun res!223426 () Bool)

(declare-fun e!236471 () Bool)

(assert (=> b!390375 (=> (not res!223426) (not e!236471))))

(assert (=> b!390375 (= res!223426 (not (contains!2432 lt!184009 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!73025 () Bool)

(assert (=> d!73025 e!236471))

(declare-fun res!223428 () Bool)

(assert (=> d!73025 (=> (not res!223428) (not e!236471))))

(assert (=> d!73025 (= res!223428 (not (contains!2432 lt!184009 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236470 () ListLongMap!5315)

(assert (=> d!73025 (= lt!184009 e!236470)))

(declare-fun c!54124 () Bool)

(assert (=> d!73025 (= c!54124 (bvsge #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (=> d!73025 (validMask!0 mask!970)))

(assert (=> d!73025 (= (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184009)))

(declare-fun b!390376 () Bool)

(assert (=> b!390376 (= e!236471 e!236468)))

(declare-fun c!54125 () Bool)

(declare-fun e!236465 () Bool)

(assert (=> b!390376 (= c!54125 e!236465)))

(declare-fun res!223427 () Bool)

(assert (=> b!390376 (=> (not res!223427) (not e!236465))))

(assert (=> b!390376 (= res!223427 (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(declare-fun bm!27487 () Bool)

(assert (=> bm!27487 (= call!27490 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390377 () Bool)

(assert (=> b!390377 (= e!236465 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390377 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390378 () Bool)

(assert (=> b!390378 (= e!236470 (ListLongMap!5316 Nil!6248))))

(declare-fun b!390379 () Bool)

(assert (=> b!390379 (= e!236468 e!236469)))

(declare-fun c!54122 () Bool)

(assert (=> b!390379 (= c!54122 (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(declare-fun b!390380 () Bool)

(declare-fun isEmpty!553 (ListLongMap!5315) Bool)

(assert (=> b!390380 (= e!236469 (isEmpty!553 lt!184009))))

(declare-fun b!390381 () Bool)

(assert (=> b!390381 (= e!236470 e!236466)))

(declare-fun c!54123 () Bool)

(assert (=> b!390381 (= c!54123 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390382 () Bool)

(declare-fun lt!184003 () Unit!11925)

(declare-fun lt!184007 () Unit!11925)

(assert (=> b!390382 (= lt!184003 lt!184007)))

(declare-fun lt!184008 () V!13939)

(declare-fun lt!184004 () (_ BitVec 64))

(declare-fun lt!184005 () ListLongMap!5315)

(declare-fun lt!184006 () (_ BitVec 64))

(assert (=> b!390382 (not (contains!2432 (+!1027 lt!184005 (tuple2!6401 lt!184004 lt!184008)) lt!184006))))

(declare-fun addStillNotContains!136 (ListLongMap!5315 (_ BitVec 64) V!13939 (_ BitVec 64)) Unit!11925)

(assert (=> b!390382 (= lt!184007 (addStillNotContains!136 lt!184005 lt!184004 lt!184008 lt!184006))))

(assert (=> b!390382 (= lt!184006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390382 (= lt!184008 (get!5589 (select (arr!11031 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390382 (= lt!184004 (select (arr!11030 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390382 (= lt!184005 call!27490)))

(assert (=> b!390382 (= e!236466 (+!1027 call!27490 (tuple2!6401 (select (arr!11030 _keys!658) #b00000000000000000000000000000000) (get!5589 (select (arr!11031 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!73025 c!54124) b!390378))

(assert (= (and d!73025 (not c!54124)) b!390381))

(assert (= (and b!390381 c!54123) b!390382))

(assert (= (and b!390381 (not c!54123)) b!390374))

(assert (= (or b!390382 b!390374) bm!27487))

(assert (= (and d!73025 res!223428) b!390375))

(assert (= (and b!390375 res!223426) b!390376))

(assert (= (and b!390376 res!223427) b!390377))

(assert (= (and b!390376 c!54125) b!390372))

(assert (= (and b!390376 (not c!54125)) b!390379))

(assert (= (and b!390372 res!223425) b!390373))

(assert (= (and b!390379 c!54122) b!390371))

(assert (= (and b!390379 (not c!54122)) b!390380))

(declare-fun b_lambda!8645 () Bool)

(assert (=> (not b_lambda!8645) (not b!390373)))

(declare-fun t!11408 () Bool)

(declare-fun tb!3109 () Bool)

(assert (=> (and start!37926 (= defaultEntry!514 defaultEntry!514) t!11408) tb!3109))

(declare-fun result!5723 () Bool)

(assert (=> tb!3109 (= result!5723 tp_is_empty!9625)))

(assert (=> b!390373 t!11408))

(declare-fun b_and!16263 () Bool)

(assert (= b_and!16257 (and (=> t!11408 result!5723) b_and!16263)))

(declare-fun b_lambda!8647 () Bool)

(assert (=> (not b_lambda!8647) (not b!390382)))

(assert (=> b!390382 t!11408))

(declare-fun b_and!16265 () Bool)

(assert (= b_and!16263 (and (=> t!11408 result!5723) b_and!16265)))

(declare-fun m!386981 () Bool)

(assert (=> b!390375 m!386981))

(declare-fun m!386983 () Bool)

(assert (=> d!73025 m!386983))

(assert (=> d!73025 m!386843))

(assert (=> b!390373 m!386947))

(declare-fun m!386985 () Bool)

(assert (=> b!390373 m!386985))

(declare-fun m!386987 () Bool)

(assert (=> b!390373 m!386987))

(declare-fun m!386989 () Bool)

(assert (=> b!390373 m!386989))

(assert (=> b!390373 m!386947))

(declare-fun m!386991 () Bool)

(assert (=> b!390373 m!386991))

(assert (=> b!390373 m!386985))

(assert (=> b!390373 m!386987))

(assert (=> b!390381 m!386947))

(assert (=> b!390381 m!386947))

(assert (=> b!390381 m!386949))

(declare-fun m!386993 () Bool)

(assert (=> bm!27487 m!386993))

(assert (=> b!390371 m!386993))

(declare-fun m!386995 () Bool)

(assert (=> b!390380 m!386995))

(assert (=> b!390372 m!386947))

(assert (=> b!390372 m!386947))

(declare-fun m!386997 () Bool)

(assert (=> b!390372 m!386997))

(assert (=> b!390377 m!386947))

(assert (=> b!390377 m!386947))

(assert (=> b!390377 m!386949))

(assert (=> b!390382 m!386947))

(declare-fun m!386999 () Bool)

(assert (=> b!390382 m!386999))

(assert (=> b!390382 m!386985))

(assert (=> b!390382 m!386987))

(declare-fun m!387001 () Bool)

(assert (=> b!390382 m!387001))

(assert (=> b!390382 m!386985))

(assert (=> b!390382 m!386987))

(assert (=> b!390382 m!386989))

(declare-fun m!387003 () Bool)

(assert (=> b!390382 m!387003))

(assert (=> b!390382 m!387001))

(declare-fun m!387005 () Bool)

(assert (=> b!390382 m!387005))

(assert (=> b!390214 d!73025))

(declare-fun d!73027 () Bool)

(declare-fun e!236472 () Bool)

(assert (=> d!73027 e!236472))

(declare-fun res!223429 () Bool)

(assert (=> d!73027 (=> (not res!223429) (not e!236472))))

(declare-fun lt!184012 () ListLongMap!5315)

(assert (=> d!73027 (= res!223429 (contains!2432 lt!184012 (_1!3211 (tuple2!6401 k0!778 v!373))))))

(declare-fun lt!184010 () List!6251)

(assert (=> d!73027 (= lt!184012 (ListLongMap!5316 lt!184010))))

(declare-fun lt!184011 () Unit!11925)

(declare-fun lt!184013 () Unit!11925)

(assert (=> d!73027 (= lt!184011 lt!184013)))

(assert (=> d!73027 (= (getValueByKey!360 lt!184010 (_1!3211 (tuple2!6401 k0!778 v!373))) (Some!365 (_2!3211 (tuple2!6401 k0!778 v!373))))))

(assert (=> d!73027 (= lt!184013 (lemmaContainsTupThenGetReturnValue!182 lt!184010 (_1!3211 (tuple2!6401 k0!778 v!373)) (_2!3211 (tuple2!6401 k0!778 v!373))))))

(assert (=> d!73027 (= lt!184010 (insertStrictlySorted!185 (toList!2673 lt!183909) (_1!3211 (tuple2!6401 k0!778 v!373)) (_2!3211 (tuple2!6401 k0!778 v!373))))))

(assert (=> d!73027 (= (+!1027 lt!183909 (tuple2!6401 k0!778 v!373)) lt!184012)))

(declare-fun b!390385 () Bool)

(declare-fun res!223430 () Bool)

(assert (=> b!390385 (=> (not res!223430) (not e!236472))))

(assert (=> b!390385 (= res!223430 (= (getValueByKey!360 (toList!2673 lt!184012) (_1!3211 (tuple2!6401 k0!778 v!373))) (Some!365 (_2!3211 (tuple2!6401 k0!778 v!373)))))))

(declare-fun b!390386 () Bool)

(assert (=> b!390386 (= e!236472 (contains!2433 (toList!2673 lt!184012) (tuple2!6401 k0!778 v!373)))))

(assert (= (and d!73027 res!223429) b!390385))

(assert (= (and b!390385 res!223430) b!390386))

(declare-fun m!387007 () Bool)

(assert (=> d!73027 m!387007))

(declare-fun m!387009 () Bool)

(assert (=> d!73027 m!387009))

(declare-fun m!387011 () Bool)

(assert (=> d!73027 m!387011))

(declare-fun m!387013 () Bool)

(assert (=> d!73027 m!387013))

(declare-fun m!387015 () Bool)

(assert (=> b!390385 m!387015))

(declare-fun m!387017 () Bool)

(assert (=> b!390386 m!387017))

(assert (=> b!390214 d!73027))

(declare-fun b!390429 () Bool)

(declare-fun e!236499 () ListLongMap!5315)

(declare-fun call!27509 () ListLongMap!5315)

(assert (=> b!390429 (= e!236499 (+!1027 call!27509 (tuple2!6401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27502 () Bool)

(declare-fun call!27506 () ListLongMap!5315)

(declare-fun call!27508 () ListLongMap!5315)

(assert (=> bm!27502 (= call!27506 call!27508)))

(declare-fun d!73029 () Bool)

(declare-fun e!236502 () Bool)

(assert (=> d!73029 e!236502))

(declare-fun res!223451 () Bool)

(assert (=> d!73029 (=> (not res!223451) (not e!236502))))

(assert (=> d!73029 (= res!223451 (or (bvsge #b00000000000000000000000000000000 (size!11382 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))))

(declare-fun lt!184079 () ListLongMap!5315)

(declare-fun lt!184073 () ListLongMap!5315)

(assert (=> d!73029 (= lt!184079 lt!184073)))

(declare-fun lt!184062 () Unit!11925)

(declare-fun e!236510 () Unit!11925)

(assert (=> d!73029 (= lt!184062 e!236510)))

(declare-fun c!54141 () Bool)

(declare-fun e!236505 () Bool)

(assert (=> d!73029 (= c!54141 e!236505)))

(declare-fun res!223450 () Bool)

(assert (=> d!73029 (=> (not res!223450) (not e!236505))))

(assert (=> d!73029 (= res!223450 (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (=> d!73029 (= lt!184073 e!236499)))

(declare-fun c!54142 () Bool)

(assert (=> d!73029 (= c!54142 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73029 (validMask!0 mask!970)))

(assert (=> d!73029 (= (getCurrentListMap!2055 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184079)))

(declare-fun b!390430 () Bool)

(declare-fun e!236511 () Bool)

(assert (=> b!390430 (= e!236502 e!236511)))

(declare-fun c!54138 () Bool)

(assert (=> b!390430 (= c!54138 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390431 () Bool)

(declare-fun e!236501 () Bool)

(assert (=> b!390431 (= e!236501 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390432 () Bool)

(declare-fun e!236504 () ListLongMap!5315)

(assert (=> b!390432 (= e!236504 call!27506)))

(declare-fun b!390433 () Bool)

(declare-fun res!223455 () Bool)

(assert (=> b!390433 (=> (not res!223455) (not e!236502))))

(declare-fun e!236503 () Bool)

(assert (=> b!390433 (= res!223455 e!236503)))

(declare-fun res!223454 () Bool)

(assert (=> b!390433 (=> res!223454 e!236503)))

(assert (=> b!390433 (= res!223454 (not e!236501))))

(declare-fun res!223452 () Bool)

(assert (=> b!390433 (=> (not res!223452) (not e!236501))))

(assert (=> b!390433 (= res!223452 (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(declare-fun b!390434 () Bool)

(declare-fun call!27510 () Bool)

(assert (=> b!390434 (= e!236511 (not call!27510))))

(declare-fun b!390435 () Bool)

(declare-fun e!236506 () Bool)

(assert (=> b!390435 (= e!236506 (= (apply!301 lt!184079 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390436 () Bool)

(declare-fun e!236500 () Bool)

(assert (=> b!390436 (= e!236503 e!236500)))

(declare-fun res!223449 () Bool)

(assert (=> b!390436 (=> (not res!223449) (not e!236500))))

(assert (=> b!390436 (= res!223449 (contains!2432 lt!184079 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(declare-fun b!390437 () Bool)

(declare-fun c!54140 () Bool)

(assert (=> b!390437 (= c!54140 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236508 () ListLongMap!5315)

(assert (=> b!390437 (= e!236508 e!236504)))

(declare-fun b!390438 () Bool)

(declare-fun e!236507 () Bool)

(assert (=> b!390438 (= e!236507 e!236506)))

(declare-fun res!223453 () Bool)

(declare-fun call!27505 () Bool)

(assert (=> b!390438 (= res!223453 call!27505)))

(assert (=> b!390438 (=> (not res!223453) (not e!236506))))

(declare-fun bm!27503 () Bool)

(declare-fun c!54143 () Bool)

(declare-fun call!27507 () ListLongMap!5315)

(assert (=> bm!27503 (= call!27509 (+!1027 (ite c!54142 call!27507 (ite c!54143 call!27508 call!27506)) (ite (or c!54142 c!54143) (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27504 () Bool)

(declare-fun call!27511 () ListLongMap!5315)

(assert (=> bm!27504 (= call!27511 call!27509)))

(declare-fun b!390439 () Bool)

(assert (=> b!390439 (= e!236505 (validKeyInArray!0 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390440 () Bool)

(assert (=> b!390440 (= e!236507 (not call!27505))))

(declare-fun b!390441 () Bool)

(declare-fun Unit!11931 () Unit!11925)

(assert (=> b!390441 (= e!236510 Unit!11931)))

(declare-fun bm!27505 () Bool)

(assert (=> bm!27505 (= call!27508 call!27507)))

(declare-fun bm!27506 () Bool)

(assert (=> bm!27506 (= call!27505 (contains!2432 lt!184079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390442 () Bool)

(assert (=> b!390442 (= e!236499 e!236508)))

(assert (=> b!390442 (= c!54143 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390443 () Bool)

(declare-fun e!236509 () Bool)

(assert (=> b!390443 (= e!236509 (= (apply!301 lt!184079 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27507 () Bool)

(assert (=> bm!27507 (= call!27510 (contains!2432 lt!184079 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390444 () Bool)

(assert (=> b!390444 (= e!236508 call!27511)))

(declare-fun b!390445 () Bool)

(assert (=> b!390445 (= e!236504 call!27511)))

(declare-fun b!390446 () Bool)

(declare-fun res!223457 () Bool)

(assert (=> b!390446 (=> (not res!223457) (not e!236502))))

(assert (=> b!390446 (= res!223457 e!236507)))

(declare-fun c!54139 () Bool)

(assert (=> b!390446 (= c!54139 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390447 () Bool)

(declare-fun lt!184074 () Unit!11925)

(assert (=> b!390447 (= e!236510 lt!184074)))

(declare-fun lt!184072 () ListLongMap!5315)

(assert (=> b!390447 (= lt!184072 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184076 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184077 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184077 (select (arr!11030 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184059 () Unit!11925)

(declare-fun addStillContains!277 (ListLongMap!5315 (_ BitVec 64) V!13939 (_ BitVec 64)) Unit!11925)

(assert (=> b!390447 (= lt!184059 (addStillContains!277 lt!184072 lt!184076 zeroValue!472 lt!184077))))

(assert (=> b!390447 (contains!2432 (+!1027 lt!184072 (tuple2!6401 lt!184076 zeroValue!472)) lt!184077)))

(declare-fun lt!184067 () Unit!11925)

(assert (=> b!390447 (= lt!184067 lt!184059)))

(declare-fun lt!184068 () ListLongMap!5315)

(assert (=> b!390447 (= lt!184068 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184058 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184069 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184069 (select (arr!11030 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184061 () Unit!11925)

(declare-fun addApplyDifferent!277 (ListLongMap!5315 (_ BitVec 64) V!13939 (_ BitVec 64)) Unit!11925)

(assert (=> b!390447 (= lt!184061 (addApplyDifferent!277 lt!184068 lt!184058 minValue!472 lt!184069))))

(assert (=> b!390447 (= (apply!301 (+!1027 lt!184068 (tuple2!6401 lt!184058 minValue!472)) lt!184069) (apply!301 lt!184068 lt!184069))))

(declare-fun lt!184064 () Unit!11925)

(assert (=> b!390447 (= lt!184064 lt!184061)))

(declare-fun lt!184070 () ListLongMap!5315)

(assert (=> b!390447 (= lt!184070 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184066 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184078 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184078 (select (arr!11030 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184071 () Unit!11925)

(assert (=> b!390447 (= lt!184071 (addApplyDifferent!277 lt!184070 lt!184066 zeroValue!472 lt!184078))))

(assert (=> b!390447 (= (apply!301 (+!1027 lt!184070 (tuple2!6401 lt!184066 zeroValue!472)) lt!184078) (apply!301 lt!184070 lt!184078))))

(declare-fun lt!184060 () Unit!11925)

(assert (=> b!390447 (= lt!184060 lt!184071)))

(declare-fun lt!184063 () ListLongMap!5315)

(assert (=> b!390447 (= lt!184063 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184065 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184065 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184075 () (_ BitVec 64))

(assert (=> b!390447 (= lt!184075 (select (arr!11030 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390447 (= lt!184074 (addApplyDifferent!277 lt!184063 lt!184065 minValue!472 lt!184075))))

(assert (=> b!390447 (= (apply!301 (+!1027 lt!184063 (tuple2!6401 lt!184065 minValue!472)) lt!184075) (apply!301 lt!184063 lt!184075))))

(declare-fun b!390448 () Bool)

(assert (=> b!390448 (= e!236511 e!236509)))

(declare-fun res!223456 () Bool)

(assert (=> b!390448 (= res!223456 call!27510)))

(assert (=> b!390448 (=> (not res!223456) (not e!236509))))

(declare-fun bm!27508 () Bool)

(assert (=> bm!27508 (= call!27507 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390449 () Bool)

(assert (=> b!390449 (= e!236500 (= (apply!301 lt!184079 (select (arr!11030 _keys!658) #b00000000000000000000000000000000)) (get!5589 (select (arr!11031 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11383 _values!506)))))

(assert (=> b!390449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (= (and d!73029 c!54142) b!390429))

(assert (= (and d!73029 (not c!54142)) b!390442))

(assert (= (and b!390442 c!54143) b!390444))

(assert (= (and b!390442 (not c!54143)) b!390437))

(assert (= (and b!390437 c!54140) b!390445))

(assert (= (and b!390437 (not c!54140)) b!390432))

(assert (= (or b!390445 b!390432) bm!27502))

(assert (= (or b!390444 bm!27502) bm!27505))

(assert (= (or b!390444 b!390445) bm!27504))

(assert (= (or b!390429 bm!27505) bm!27508))

(assert (= (or b!390429 bm!27504) bm!27503))

(assert (= (and d!73029 res!223450) b!390439))

(assert (= (and d!73029 c!54141) b!390447))

(assert (= (and d!73029 (not c!54141)) b!390441))

(assert (= (and d!73029 res!223451) b!390433))

(assert (= (and b!390433 res!223452) b!390431))

(assert (= (and b!390433 (not res!223454)) b!390436))

(assert (= (and b!390436 res!223449) b!390449))

(assert (= (and b!390433 res!223455) b!390446))

(assert (= (and b!390446 c!54139) b!390438))

(assert (= (and b!390446 (not c!54139)) b!390440))

(assert (= (and b!390438 res!223453) b!390435))

(assert (= (or b!390438 b!390440) bm!27506))

(assert (= (and b!390446 res!223457) b!390430))

(assert (= (and b!390430 c!54138) b!390448))

(assert (= (and b!390430 (not c!54138)) b!390434))

(assert (= (and b!390448 res!223456) b!390443))

(assert (= (or b!390448 b!390434) bm!27507))

(declare-fun b_lambda!8649 () Bool)

(assert (=> (not b_lambda!8649) (not b!390449)))

(assert (=> b!390449 t!11408))

(declare-fun b_and!16267 () Bool)

(assert (= b_and!16265 (and (=> t!11408 result!5723) b_and!16267)))

(declare-fun m!387019 () Bool)

(assert (=> bm!27507 m!387019))

(assert (=> b!390449 m!386987))

(assert (=> b!390449 m!386947))

(assert (=> b!390449 m!386985))

(assert (=> b!390449 m!386985))

(assert (=> b!390449 m!386987))

(assert (=> b!390449 m!386989))

(assert (=> b!390449 m!386947))

(declare-fun m!387021 () Bool)

(assert (=> b!390449 m!387021))

(declare-fun m!387023 () Bool)

(assert (=> b!390447 m!387023))

(assert (=> b!390447 m!386947))

(declare-fun m!387025 () Bool)

(assert (=> b!390447 m!387025))

(assert (=> b!390447 m!387025))

(declare-fun m!387027 () Bool)

(assert (=> b!390447 m!387027))

(assert (=> b!390447 m!386829))

(declare-fun m!387029 () Bool)

(assert (=> b!390447 m!387029))

(declare-fun m!387031 () Bool)

(assert (=> b!390447 m!387031))

(declare-fun m!387033 () Bool)

(assert (=> b!390447 m!387033))

(declare-fun m!387035 () Bool)

(assert (=> b!390447 m!387035))

(declare-fun m!387037 () Bool)

(assert (=> b!390447 m!387037))

(declare-fun m!387039 () Bool)

(assert (=> b!390447 m!387039))

(declare-fun m!387041 () Bool)

(assert (=> b!390447 m!387041))

(assert (=> b!390447 m!387031))

(declare-fun m!387043 () Bool)

(assert (=> b!390447 m!387043))

(declare-fun m!387045 () Bool)

(assert (=> b!390447 m!387045))

(declare-fun m!387047 () Bool)

(assert (=> b!390447 m!387047))

(declare-fun m!387049 () Bool)

(assert (=> b!390447 m!387049))

(declare-fun m!387051 () Bool)

(assert (=> b!390447 m!387051))

(assert (=> b!390447 m!387037))

(assert (=> b!390447 m!387047))

(assert (=> b!390439 m!386947))

(assert (=> b!390439 m!386947))

(assert (=> b!390439 m!386949))

(assert (=> bm!27508 m!386829))

(assert (=> b!390431 m!386947))

(assert (=> b!390431 m!386947))

(assert (=> b!390431 m!386949))

(declare-fun m!387053 () Bool)

(assert (=> b!390429 m!387053))

(declare-fun m!387055 () Bool)

(assert (=> b!390443 m!387055))

(declare-fun m!387057 () Bool)

(assert (=> b!390435 m!387057))

(assert (=> d!73029 m!386843))

(declare-fun m!387059 () Bool)

(assert (=> bm!27503 m!387059))

(declare-fun m!387061 () Bool)

(assert (=> bm!27506 m!387061))

(assert (=> b!390436 m!386947))

(assert (=> b!390436 m!386947))

(declare-fun m!387063 () Bool)

(assert (=> b!390436 m!387063))

(assert (=> b!390214 d!73029))

(declare-fun b!390450 () Bool)

(declare-fun e!236512 () ListLongMap!5315)

(declare-fun call!27516 () ListLongMap!5315)

(assert (=> b!390450 (= e!236512 (+!1027 call!27516 (tuple2!6401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27509 () Bool)

(declare-fun call!27513 () ListLongMap!5315)

(declare-fun call!27515 () ListLongMap!5315)

(assert (=> bm!27509 (= call!27513 call!27515)))

(declare-fun d!73031 () Bool)

(declare-fun e!236515 () Bool)

(assert (=> d!73031 e!236515))

(declare-fun res!223460 () Bool)

(assert (=> d!73031 (=> (not res!223460) (not e!236515))))

(assert (=> d!73031 (= res!223460 (or (bvsge #b00000000000000000000000000000000 (size!11382 lt!183911)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))))

(declare-fun lt!184101 () ListLongMap!5315)

(declare-fun lt!184095 () ListLongMap!5315)

(assert (=> d!73031 (= lt!184101 lt!184095)))

(declare-fun lt!184084 () Unit!11925)

(declare-fun e!236523 () Unit!11925)

(assert (=> d!73031 (= lt!184084 e!236523)))

(declare-fun c!54147 () Bool)

(declare-fun e!236518 () Bool)

(assert (=> d!73031 (= c!54147 e!236518)))

(declare-fun res!223459 () Bool)

(assert (=> d!73031 (=> (not res!223459) (not e!236518))))

(assert (=> d!73031 (= res!223459 (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(assert (=> d!73031 (= lt!184095 e!236512)))

(declare-fun c!54148 () Bool)

(assert (=> d!73031 (= c!54148 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73031 (validMask!0 mask!970)))

(assert (=> d!73031 (= (getCurrentListMap!2055 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184101)))

(declare-fun b!390451 () Bool)

(declare-fun e!236524 () Bool)

(assert (=> b!390451 (= e!236515 e!236524)))

(declare-fun c!54144 () Bool)

(assert (=> b!390451 (= c!54144 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390452 () Bool)

(declare-fun e!236514 () Bool)

(assert (=> b!390452 (= e!236514 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(declare-fun b!390453 () Bool)

(declare-fun e!236517 () ListLongMap!5315)

(assert (=> b!390453 (= e!236517 call!27513)))

(declare-fun b!390454 () Bool)

(declare-fun res!223464 () Bool)

(assert (=> b!390454 (=> (not res!223464) (not e!236515))))

(declare-fun e!236516 () Bool)

(assert (=> b!390454 (= res!223464 e!236516)))

(declare-fun res!223463 () Bool)

(assert (=> b!390454 (=> res!223463 e!236516)))

(assert (=> b!390454 (= res!223463 (not e!236514))))

(declare-fun res!223461 () Bool)

(assert (=> b!390454 (=> (not res!223461) (not e!236514))))

(assert (=> b!390454 (= res!223461 (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(declare-fun b!390455 () Bool)

(declare-fun call!27517 () Bool)

(assert (=> b!390455 (= e!236524 (not call!27517))))

(declare-fun b!390456 () Bool)

(declare-fun e!236519 () Bool)

(assert (=> b!390456 (= e!236519 (= (apply!301 lt!184101 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390457 () Bool)

(declare-fun e!236513 () Bool)

(assert (=> b!390457 (= e!236516 e!236513)))

(declare-fun res!223458 () Bool)

(assert (=> b!390457 (=> (not res!223458) (not e!236513))))

(assert (=> b!390457 (= res!223458 (contains!2432 lt!184101 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(assert (=> b!390457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(declare-fun b!390458 () Bool)

(declare-fun c!54146 () Bool)

(assert (=> b!390458 (= c!54146 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236521 () ListLongMap!5315)

(assert (=> b!390458 (= e!236521 e!236517)))

(declare-fun b!390459 () Bool)

(declare-fun e!236520 () Bool)

(assert (=> b!390459 (= e!236520 e!236519)))

(declare-fun res!223462 () Bool)

(declare-fun call!27512 () Bool)

(assert (=> b!390459 (= res!223462 call!27512)))

(assert (=> b!390459 (=> (not res!223462) (not e!236519))))

(declare-fun c!54149 () Bool)

(declare-fun bm!27510 () Bool)

(declare-fun call!27514 () ListLongMap!5315)

(assert (=> bm!27510 (= call!27516 (+!1027 (ite c!54148 call!27514 (ite c!54149 call!27515 call!27513)) (ite (or c!54148 c!54149) (tuple2!6401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27511 () Bool)

(declare-fun call!27518 () ListLongMap!5315)

(assert (=> bm!27511 (= call!27518 call!27516)))

(declare-fun b!390460 () Bool)

(assert (=> b!390460 (= e!236518 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(declare-fun b!390461 () Bool)

(assert (=> b!390461 (= e!236520 (not call!27512))))

(declare-fun b!390462 () Bool)

(declare-fun Unit!11932 () Unit!11925)

(assert (=> b!390462 (= e!236523 Unit!11932)))

(declare-fun bm!27512 () Bool)

(assert (=> bm!27512 (= call!27515 call!27514)))

(declare-fun bm!27513 () Bool)

(assert (=> bm!27513 (= call!27512 (contains!2432 lt!184101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390463 () Bool)

(assert (=> b!390463 (= e!236512 e!236521)))

(assert (=> b!390463 (= c!54149 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390464 () Bool)

(declare-fun e!236522 () Bool)

(assert (=> b!390464 (= e!236522 (= (apply!301 lt!184101 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27514 () Bool)

(assert (=> bm!27514 (= call!27517 (contains!2432 lt!184101 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390465 () Bool)

(assert (=> b!390465 (= e!236521 call!27518)))

(declare-fun b!390466 () Bool)

(assert (=> b!390466 (= e!236517 call!27518)))

(declare-fun b!390467 () Bool)

(declare-fun res!223466 () Bool)

(assert (=> b!390467 (=> (not res!223466) (not e!236515))))

(assert (=> b!390467 (= res!223466 e!236520)))

(declare-fun c!54145 () Bool)

(assert (=> b!390467 (= c!54145 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390468 () Bool)

(declare-fun lt!184096 () Unit!11925)

(assert (=> b!390468 (= e!236523 lt!184096)))

(declare-fun lt!184094 () ListLongMap!5315)

(assert (=> b!390468 (= lt!184094 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184098 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184098 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184099 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184099 (select (arr!11030 lt!183911) #b00000000000000000000000000000000))))

(declare-fun lt!184081 () Unit!11925)

(assert (=> b!390468 (= lt!184081 (addStillContains!277 lt!184094 lt!184098 zeroValue!472 lt!184099))))

(assert (=> b!390468 (contains!2432 (+!1027 lt!184094 (tuple2!6401 lt!184098 zeroValue!472)) lt!184099)))

(declare-fun lt!184089 () Unit!11925)

(assert (=> b!390468 (= lt!184089 lt!184081)))

(declare-fun lt!184090 () ListLongMap!5315)

(assert (=> b!390468 (= lt!184090 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184080 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184080 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184091 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184091 (select (arr!11030 lt!183911) #b00000000000000000000000000000000))))

(declare-fun lt!184083 () Unit!11925)

(assert (=> b!390468 (= lt!184083 (addApplyDifferent!277 lt!184090 lt!184080 minValue!472 lt!184091))))

(assert (=> b!390468 (= (apply!301 (+!1027 lt!184090 (tuple2!6401 lt!184080 minValue!472)) lt!184091) (apply!301 lt!184090 lt!184091))))

(declare-fun lt!184086 () Unit!11925)

(assert (=> b!390468 (= lt!184086 lt!184083)))

(declare-fun lt!184092 () ListLongMap!5315)

(assert (=> b!390468 (= lt!184092 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184088 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184100 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184100 (select (arr!11030 lt!183911) #b00000000000000000000000000000000))))

(declare-fun lt!184093 () Unit!11925)

(assert (=> b!390468 (= lt!184093 (addApplyDifferent!277 lt!184092 lt!184088 zeroValue!472 lt!184100))))

(assert (=> b!390468 (= (apply!301 (+!1027 lt!184092 (tuple2!6401 lt!184088 zeroValue!472)) lt!184100) (apply!301 lt!184092 lt!184100))))

(declare-fun lt!184082 () Unit!11925)

(assert (=> b!390468 (= lt!184082 lt!184093)))

(declare-fun lt!184085 () ListLongMap!5315)

(assert (=> b!390468 (= lt!184085 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184087 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184087 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184097 () (_ BitVec 64))

(assert (=> b!390468 (= lt!184097 (select (arr!11030 lt!183911) #b00000000000000000000000000000000))))

(assert (=> b!390468 (= lt!184096 (addApplyDifferent!277 lt!184085 lt!184087 minValue!472 lt!184097))))

(assert (=> b!390468 (= (apply!301 (+!1027 lt!184085 (tuple2!6401 lt!184087 minValue!472)) lt!184097) (apply!301 lt!184085 lt!184097))))

(declare-fun b!390469 () Bool)

(assert (=> b!390469 (= e!236524 e!236522)))

(declare-fun res!223465 () Bool)

(assert (=> b!390469 (= res!223465 call!27517)))

(assert (=> b!390469 (=> (not res!223465) (not e!236522))))

(declare-fun bm!27515 () Bool)

(assert (=> bm!27515 (= call!27514 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390470 () Bool)

(assert (=> b!390470 (= e!236513 (= (apply!301 lt!184101 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)) (get!5589 (select (arr!11031 lt!183912) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390470 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11383 lt!183912)))))

(assert (=> b!390470 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(assert (= (and d!73031 c!54148) b!390450))

(assert (= (and d!73031 (not c!54148)) b!390463))

(assert (= (and b!390463 c!54149) b!390465))

(assert (= (and b!390463 (not c!54149)) b!390458))

(assert (= (and b!390458 c!54146) b!390466))

(assert (= (and b!390458 (not c!54146)) b!390453))

(assert (= (or b!390466 b!390453) bm!27509))

(assert (= (or b!390465 bm!27509) bm!27512))

(assert (= (or b!390465 b!390466) bm!27511))

(assert (= (or b!390450 bm!27512) bm!27515))

(assert (= (or b!390450 bm!27511) bm!27510))

(assert (= (and d!73031 res!223459) b!390460))

(assert (= (and d!73031 c!54147) b!390468))

(assert (= (and d!73031 (not c!54147)) b!390462))

(assert (= (and d!73031 res!223460) b!390454))

(assert (= (and b!390454 res!223461) b!390452))

(assert (= (and b!390454 (not res!223463)) b!390457))

(assert (= (and b!390457 res!223458) b!390470))

(assert (= (and b!390454 res!223464) b!390467))

(assert (= (and b!390467 c!54145) b!390459))

(assert (= (and b!390467 (not c!54145)) b!390461))

(assert (= (and b!390459 res!223462) b!390456))

(assert (= (or b!390459 b!390461) bm!27513))

(assert (= (and b!390467 res!223466) b!390451))

(assert (= (and b!390451 c!54144) b!390469))

(assert (= (and b!390451 (not c!54144)) b!390455))

(assert (= (and b!390469 res!223465) b!390464))

(assert (= (or b!390469 b!390455) bm!27514))

(declare-fun b_lambda!8651 () Bool)

(assert (=> (not b_lambda!8651) (not b!390470)))

(assert (=> b!390470 t!11408))

(declare-fun b_and!16269 () Bool)

(assert (= b_and!16267 (and (=> t!11408 result!5723) b_and!16269)))

(declare-fun m!387065 () Bool)

(assert (=> bm!27514 m!387065))

(assert (=> b!390470 m!386987))

(assert (=> b!390470 m!386935))

(declare-fun m!387067 () Bool)

(assert (=> b!390470 m!387067))

(assert (=> b!390470 m!387067))

(assert (=> b!390470 m!386987))

(declare-fun m!387069 () Bool)

(assert (=> b!390470 m!387069))

(assert (=> b!390470 m!386935))

(declare-fun m!387071 () Bool)

(assert (=> b!390470 m!387071))

(declare-fun m!387073 () Bool)

(assert (=> b!390468 m!387073))

(assert (=> b!390468 m!386935))

(declare-fun m!387075 () Bool)

(assert (=> b!390468 m!387075))

(assert (=> b!390468 m!387075))

(declare-fun m!387077 () Bool)

(assert (=> b!390468 m!387077))

(assert (=> b!390468 m!386821))

(declare-fun m!387079 () Bool)

(assert (=> b!390468 m!387079))

(declare-fun m!387081 () Bool)

(assert (=> b!390468 m!387081))

(declare-fun m!387083 () Bool)

(assert (=> b!390468 m!387083))

(declare-fun m!387085 () Bool)

(assert (=> b!390468 m!387085))

(declare-fun m!387087 () Bool)

(assert (=> b!390468 m!387087))

(declare-fun m!387089 () Bool)

(assert (=> b!390468 m!387089))

(declare-fun m!387091 () Bool)

(assert (=> b!390468 m!387091))

(assert (=> b!390468 m!387081))

(declare-fun m!387093 () Bool)

(assert (=> b!390468 m!387093))

(declare-fun m!387095 () Bool)

(assert (=> b!390468 m!387095))

(declare-fun m!387097 () Bool)

(assert (=> b!390468 m!387097))

(declare-fun m!387099 () Bool)

(assert (=> b!390468 m!387099))

(declare-fun m!387101 () Bool)

(assert (=> b!390468 m!387101))

(assert (=> b!390468 m!387087))

(assert (=> b!390468 m!387097))

(assert (=> b!390460 m!386935))

(assert (=> b!390460 m!386935))

(assert (=> b!390460 m!386937))

(assert (=> bm!27515 m!386821))

(assert (=> b!390452 m!386935))

(assert (=> b!390452 m!386935))

(assert (=> b!390452 m!386937))

(declare-fun m!387103 () Bool)

(assert (=> b!390450 m!387103))

(declare-fun m!387105 () Bool)

(assert (=> b!390464 m!387105))

(declare-fun m!387107 () Bool)

(assert (=> b!390456 m!387107))

(assert (=> d!73031 m!386843))

(declare-fun m!387109 () Bool)

(assert (=> bm!27510 m!387109))

(declare-fun m!387111 () Bool)

(assert (=> bm!27513 m!387111))

(assert (=> b!390457 m!386935))

(assert (=> b!390457 m!386935))

(declare-fun m!387113 () Bool)

(assert (=> b!390457 m!387113))

(assert (=> b!390214 d!73031))

(declare-fun b!390477 () Bool)

(declare-fun e!236529 () Bool)

(declare-fun e!236530 () Bool)

(assert (=> b!390477 (= e!236529 e!236530)))

(declare-fun c!54152 () Bool)

(assert (=> b!390477 (= c!54152 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73033 () Bool)

(assert (=> d!73033 e!236529))

(declare-fun res!223469 () Bool)

(assert (=> d!73033 (=> (not res!223469) (not e!236529))))

(assert (=> d!73033 (= res!223469 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11382 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11383 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11382 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11383 _values!506))))))))

(declare-fun lt!184104 () Unit!11925)

(declare-fun choose!1323 (array!23132 array!23134 (_ BitVec 32) (_ BitVec 32) V!13939 V!13939 (_ BitVec 32) (_ BitVec 64) V!13939 (_ BitVec 32) Int) Unit!11925)

(assert (=> d!73033 (= lt!184104 (choose!1323 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11382 _keys!658)))))

(assert (=> d!73033 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184104)))

(declare-fun b!390478 () Bool)

(declare-fun call!27523 () ListLongMap!5315)

(declare-fun call!27524 () ListLongMap!5315)

(assert (=> b!390478 (= e!236530 (= call!27523 call!27524))))

(declare-fun bm!27520 () Bool)

(assert (=> bm!27520 (= call!27523 (getCurrentListMapNoExtraKeys!944 (array!23133 (store (arr!11030 _keys!658) i!548 k0!778) (size!11382 _keys!658)) (array!23135 (store (arr!11031 _values!506) i!548 (ValueCellFull!4469 v!373)) (size!11383 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27521 () Bool)

(assert (=> bm!27521 (= call!27524 (getCurrentListMapNoExtraKeys!944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390479 () Bool)

(assert (=> b!390479 (= e!236530 (= call!27523 (+!1027 call!27524 (tuple2!6401 k0!778 v!373))))))

(assert (= (and d!73033 res!223469) b!390477))

(assert (= (and b!390477 c!54152) b!390479))

(assert (= (and b!390477 (not c!54152)) b!390478))

(assert (= (or b!390479 b!390478) bm!27521))

(assert (= (or b!390479 b!390478) bm!27520))

(declare-fun m!387115 () Bool)

(assert (=> d!73033 m!387115))

(assert (=> bm!27520 m!386839))

(assert (=> bm!27520 m!386825))

(declare-fun m!387117 () Bool)

(assert (=> bm!27520 m!387117))

(assert (=> bm!27521 m!386829))

(declare-fun m!387119 () Bool)

(assert (=> b!390479 m!387119))

(assert (=> b!390214 d!73033))

(declare-fun lt!184111 () ListLongMap!5315)

(declare-fun e!236535 () Bool)

(declare-fun b!390480 () Bool)

(assert (=> b!390480 (= e!236535 (= lt!184111 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390481 () Bool)

(declare-fun e!236534 () Bool)

(declare-fun e!236533 () Bool)

(assert (=> b!390481 (= e!236534 e!236533)))

(assert (=> b!390481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(declare-fun res!223470 () Bool)

(assert (=> b!390481 (= res!223470 (contains!2432 lt!184111 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(assert (=> b!390481 (=> (not res!223470) (not e!236533))))

(declare-fun b!390482 () Bool)

(assert (=> b!390482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(assert (=> b!390482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11383 lt!183912)))))

(assert (=> b!390482 (= e!236533 (= (apply!301 lt!184111 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)) (get!5589 (select (arr!11031 lt!183912) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390483 () Bool)

(declare-fun e!236532 () ListLongMap!5315)

(declare-fun call!27525 () ListLongMap!5315)

(assert (=> b!390483 (= e!236532 call!27525)))

(declare-fun b!390484 () Bool)

(declare-fun res!223471 () Bool)

(declare-fun e!236537 () Bool)

(assert (=> b!390484 (=> (not res!223471) (not e!236537))))

(assert (=> b!390484 (= res!223471 (not (contains!2432 lt!184111 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!73035 () Bool)

(assert (=> d!73035 e!236537))

(declare-fun res!223473 () Bool)

(assert (=> d!73035 (=> (not res!223473) (not e!236537))))

(assert (=> d!73035 (= res!223473 (not (contains!2432 lt!184111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236536 () ListLongMap!5315)

(assert (=> d!73035 (= lt!184111 e!236536)))

(declare-fun c!54155 () Bool)

(assert (=> d!73035 (= c!54155 (bvsge #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(assert (=> d!73035 (validMask!0 mask!970)))

(assert (=> d!73035 (= (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184111)))

(declare-fun b!390485 () Bool)

(assert (=> b!390485 (= e!236537 e!236534)))

(declare-fun c!54156 () Bool)

(declare-fun e!236531 () Bool)

(assert (=> b!390485 (= c!54156 e!236531)))

(declare-fun res!223472 () Bool)

(assert (=> b!390485 (=> (not res!223472) (not e!236531))))

(assert (=> b!390485 (= res!223472 (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(declare-fun bm!27522 () Bool)

(assert (=> bm!27522 (= call!27525 (getCurrentListMapNoExtraKeys!944 lt!183911 lt!183912 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390486 () Bool)

(assert (=> b!390486 (= e!236531 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(assert (=> b!390486 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390487 () Bool)

(assert (=> b!390487 (= e!236536 (ListLongMap!5316 Nil!6248))))

(declare-fun b!390488 () Bool)

(assert (=> b!390488 (= e!236534 e!236535)))

(declare-fun c!54153 () Bool)

(assert (=> b!390488 (= c!54153 (bvslt #b00000000000000000000000000000000 (size!11382 lt!183911)))))

(declare-fun b!390489 () Bool)

(assert (=> b!390489 (= e!236535 (isEmpty!553 lt!184111))))

(declare-fun b!390490 () Bool)

(assert (=> b!390490 (= e!236536 e!236532)))

(declare-fun c!54154 () Bool)

(assert (=> b!390490 (= c!54154 (validKeyInArray!0 (select (arr!11030 lt!183911) #b00000000000000000000000000000000)))))

(declare-fun b!390491 () Bool)

(declare-fun lt!184105 () Unit!11925)

(declare-fun lt!184109 () Unit!11925)

(assert (=> b!390491 (= lt!184105 lt!184109)))

(declare-fun lt!184108 () (_ BitVec 64))

(declare-fun lt!184106 () (_ BitVec 64))

(declare-fun lt!184107 () ListLongMap!5315)

(declare-fun lt!184110 () V!13939)

(assert (=> b!390491 (not (contains!2432 (+!1027 lt!184107 (tuple2!6401 lt!184106 lt!184110)) lt!184108))))

(assert (=> b!390491 (= lt!184109 (addStillNotContains!136 lt!184107 lt!184106 lt!184110 lt!184108))))

(assert (=> b!390491 (= lt!184108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390491 (= lt!184110 (get!5589 (select (arr!11031 lt!183912) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390491 (= lt!184106 (select (arr!11030 lt!183911) #b00000000000000000000000000000000))))

(assert (=> b!390491 (= lt!184107 call!27525)))

(assert (=> b!390491 (= e!236532 (+!1027 call!27525 (tuple2!6401 (select (arr!11030 lt!183911) #b00000000000000000000000000000000) (get!5589 (select (arr!11031 lt!183912) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!73035 c!54155) b!390487))

(assert (= (and d!73035 (not c!54155)) b!390490))

(assert (= (and b!390490 c!54154) b!390491))

(assert (= (and b!390490 (not c!54154)) b!390483))

(assert (= (or b!390491 b!390483) bm!27522))

(assert (= (and d!73035 res!223473) b!390484))

(assert (= (and b!390484 res!223471) b!390485))

(assert (= (and b!390485 res!223472) b!390486))

(assert (= (and b!390485 c!54156) b!390481))

(assert (= (and b!390485 (not c!54156)) b!390488))

(assert (= (and b!390481 res!223470) b!390482))

(assert (= (and b!390488 c!54153) b!390480))

(assert (= (and b!390488 (not c!54153)) b!390489))

(declare-fun b_lambda!8653 () Bool)

(assert (=> (not b_lambda!8653) (not b!390482)))

(assert (=> b!390482 t!11408))

(declare-fun b_and!16271 () Bool)

(assert (= b_and!16269 (and (=> t!11408 result!5723) b_and!16271)))

(declare-fun b_lambda!8655 () Bool)

(assert (=> (not b_lambda!8655) (not b!390491)))

(assert (=> b!390491 t!11408))

(declare-fun b_and!16273 () Bool)

(assert (= b_and!16271 (and (=> t!11408 result!5723) b_and!16273)))

(declare-fun m!387121 () Bool)

(assert (=> b!390484 m!387121))

(declare-fun m!387123 () Bool)

(assert (=> d!73035 m!387123))

(assert (=> d!73035 m!386843))

(assert (=> b!390482 m!386935))

(assert (=> b!390482 m!387067))

(assert (=> b!390482 m!386987))

(assert (=> b!390482 m!387069))

(assert (=> b!390482 m!386935))

(declare-fun m!387125 () Bool)

(assert (=> b!390482 m!387125))

(assert (=> b!390482 m!387067))

(assert (=> b!390482 m!386987))

(assert (=> b!390490 m!386935))

(assert (=> b!390490 m!386935))

(assert (=> b!390490 m!386937))

(declare-fun m!387127 () Bool)

(assert (=> bm!27522 m!387127))

(assert (=> b!390480 m!387127))

(declare-fun m!387129 () Bool)

(assert (=> b!390489 m!387129))

(assert (=> b!390481 m!386935))

(assert (=> b!390481 m!386935))

(declare-fun m!387131 () Bool)

(assert (=> b!390481 m!387131))

(assert (=> b!390486 m!386935))

(assert (=> b!390486 m!386935))

(assert (=> b!390486 m!386937))

(assert (=> b!390491 m!386935))

(declare-fun m!387133 () Bool)

(assert (=> b!390491 m!387133))

(assert (=> b!390491 m!387067))

(assert (=> b!390491 m!386987))

(declare-fun m!387135 () Bool)

(assert (=> b!390491 m!387135))

(assert (=> b!390491 m!387067))

(assert (=> b!390491 m!386987))

(assert (=> b!390491 m!387069))

(declare-fun m!387137 () Bool)

(assert (=> b!390491 m!387137))

(assert (=> b!390491 m!387135))

(declare-fun m!387139 () Bool)

(assert (=> b!390491 m!387139))

(assert (=> b!390214 d!73035))

(declare-fun b!390499 () Bool)

(declare-fun e!236542 () Bool)

(assert (=> b!390499 (= e!236542 tp_is_empty!9625)))

(declare-fun b!390498 () Bool)

(declare-fun e!236543 () Bool)

(assert (=> b!390498 (= e!236543 tp_is_empty!9625)))

(declare-fun mapIsEmpty!16023 () Bool)

(declare-fun mapRes!16023 () Bool)

(assert (=> mapIsEmpty!16023 mapRes!16023))

(declare-fun condMapEmpty!16023 () Bool)

(declare-fun mapDefault!16023 () ValueCell!4469)

(assert (=> mapNonEmpty!16014 (= condMapEmpty!16023 (= mapRest!16014 ((as const (Array (_ BitVec 32) ValueCell!4469)) mapDefault!16023)))))

(assert (=> mapNonEmpty!16014 (= tp!31622 (and e!236542 mapRes!16023))))

(declare-fun mapNonEmpty!16023 () Bool)

(declare-fun tp!31638 () Bool)

(assert (=> mapNonEmpty!16023 (= mapRes!16023 (and tp!31638 e!236543))))

(declare-fun mapKey!16023 () (_ BitVec 32))

(declare-fun mapRest!16023 () (Array (_ BitVec 32) ValueCell!4469))

(declare-fun mapValue!16023 () ValueCell!4469)

(assert (=> mapNonEmpty!16023 (= mapRest!16014 (store mapRest!16023 mapKey!16023 mapValue!16023))))

(assert (= (and mapNonEmpty!16014 condMapEmpty!16023) mapIsEmpty!16023))

(assert (= (and mapNonEmpty!16014 (not condMapEmpty!16023)) mapNonEmpty!16023))

(assert (= (and mapNonEmpty!16023 ((_ is ValueCellFull!4469) mapValue!16023)) b!390498))

(assert (= (and mapNonEmpty!16014 ((_ is ValueCellFull!4469) mapDefault!16023)) b!390499))

(declare-fun m!387141 () Bool)

(assert (=> mapNonEmpty!16023 m!387141))

(declare-fun b_lambda!8657 () Bool)

(assert (= b_lambda!8645 (or (and start!37926 b_free!8953) b_lambda!8657)))

(declare-fun b_lambda!8659 () Bool)

(assert (= b_lambda!8653 (or (and start!37926 b_free!8953) b_lambda!8659)))

(declare-fun b_lambda!8661 () Bool)

(assert (= b_lambda!8655 (or (and start!37926 b_free!8953) b_lambda!8661)))

(declare-fun b_lambda!8663 () Bool)

(assert (= b_lambda!8651 (or (and start!37926 b_free!8953) b_lambda!8663)))

(declare-fun b_lambda!8665 () Bool)

(assert (= b_lambda!8649 (or (and start!37926 b_free!8953) b_lambda!8665)))

(declare-fun b_lambda!8667 () Bool)

(assert (= b_lambda!8647 (or (and start!37926 b_free!8953) b_lambda!8667)))

(check-sat (not b!390457) (not b!390338) (not bm!27487) (not d!73033) (not b!390373) (not b!390313) (not b!390486) (not b!390371) (not b!390489) b_and!16273 (not b_lambda!8663) (not mapNonEmpty!16023) (not b!390468) (not b!390340) (not b!390449) (not d!73035) (not b!390381) (not bm!27514) (not bm!27506) (not bm!27522) (not b!390327) (not b!390372) (not b!390470) (not b!390450) (not b!390336) (not bm!27513) tp_is_empty!9625 (not b!390310) (not b!390452) (not b!390436) (not bm!27483) (not bm!27480) (not b!390429) (not d!73029) (not b!390325) (not b!390314) (not b!390309) (not b!390377) (not b!390380) (not b!390375) (not d!73027) (not bm!27510) (not bm!27484) (not b!390464) (not b!390382) (not b!390491) (not bm!27508) (not b!390329) (not b!390490) (not b!390482) (not d!73023) (not b_lambda!8661) (not b!390385) (not bm!27515) (not b!390460) (not bm!27520) (not b!390447) (not b_lambda!8667) (not b!390345) (not b!390346) (not b!390480) (not b!390435) (not b!390443) (not d!73031) (not d!73025) (not b!390456) (not b!390481) (not b!390484) (not b_lambda!8665) (not bm!27503) (not b!390335) (not b_lambda!8657) (not b!390479) (not b_lambda!8659) (not b!390431) (not bm!27507) (not b!390439) (not b!390386) (not b_next!8953) (not bm!27479) (not bm!27521))
(check-sat b_and!16273 (not b_next!8953))
