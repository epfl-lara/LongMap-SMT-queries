; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37954 () Bool)

(assert start!37954)

(declare-fun b_free!8959 () Bool)

(declare-fun b_next!8959 () Bool)

(assert (=> start!37954 (= b_free!8959 (not b_next!8959))))

(declare-fun tp!31644 () Bool)

(declare-fun b_and!16235 () Bool)

(assert (=> start!37954 (= tp!31644 b_and!16235)))

(declare-fun e!236418 () Bool)

(declare-datatypes ((V!13947 0))(
  ( (V!13948 (val!4860 Int)) )
))
(declare-datatypes ((tuple2!6514 0))(
  ( (tuple2!6515 (_1!3268 (_ BitVec 64)) (_2!3268 V!13947)) )
))
(declare-datatypes ((List!6359 0))(
  ( (Nil!6356) (Cons!6355 (h!7211 tuple2!6514) (t!11510 List!6359)) )
))
(declare-datatypes ((ListLongMap!5417 0))(
  ( (ListLongMap!5418 (toList!2724 List!6359)) )
))
(declare-fun lt!183884 () ListLongMap!5417)

(declare-fun lt!183877 () ListLongMap!5417)

(declare-fun b!390306 () Bool)

(declare-fun lt!183879 () tuple2!6514)

(declare-fun +!1044 (ListLongMap!5417 tuple2!6514) ListLongMap!5417)

(assert (=> b!390306 (= e!236418 (= lt!183884 (+!1044 lt!183877 lt!183879)))))

(declare-fun lt!183880 () ListLongMap!5417)

(declare-fun lt!183882 () ListLongMap!5417)

(assert (=> b!390306 (= lt!183880 (+!1044 lt!183882 lt!183879))))

(declare-fun zeroValue!472 () V!13947)

(assert (=> b!390306 (= lt!183879 (tuple2!6515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390307 () Bool)

(declare-fun e!236421 () Bool)

(declare-fun e!236420 () Bool)

(assert (=> b!390307 (= e!236421 e!236420)))

(declare-fun res!223373 () Bool)

(assert (=> b!390307 (=> (not res!223373) (not e!236420))))

(declare-datatypes ((array!23147 0))(
  ( (array!23148 (arr!11037 (Array (_ BitVec 32) (_ BitVec 64))) (size!11390 (_ BitVec 32))) )
))
(declare-fun lt!183883 () array!23147)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23147 (_ BitVec 32)) Bool)

(assert (=> b!390307 (= res!223373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183883 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23147)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390307 (= lt!183883 (array!23148 (store (arr!11037 _keys!658) i!548 k0!778) (size!11390 _keys!658)))))

(declare-fun b!390308 () Bool)

(declare-fun e!236416 () Bool)

(declare-fun tp_is_empty!9631 () Bool)

(assert (=> b!390308 (= e!236416 tp_is_empty!9631)))

(declare-fun b!390309 () Bool)

(declare-fun res!223371 () Bool)

(assert (=> b!390309 (=> (not res!223371) (not e!236421))))

(declare-datatypes ((List!6360 0))(
  ( (Nil!6357) (Cons!6356 (h!7212 (_ BitVec 64)) (t!11511 List!6360)) )
))
(declare-fun arrayNoDuplicates!0 (array!23147 (_ BitVec 32) List!6360) Bool)

(assert (=> b!390309 (= res!223371 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6357))))

(declare-fun mapNonEmpty!16026 () Bool)

(declare-fun mapRes!16026 () Bool)

(declare-fun tp!31643 () Bool)

(assert (=> mapNonEmpty!16026 (= mapRes!16026 (and tp!31643 e!236416))))

(declare-fun mapKey!16026 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4472 0))(
  ( (ValueCellFull!4472 (v!7071 V!13947)) (EmptyCell!4472) )
))
(declare-datatypes ((array!23149 0))(
  ( (array!23150 (arr!11038 (Array (_ BitVec 32) ValueCell!4472)) (size!11391 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23149)

(declare-fun mapValue!16026 () ValueCell!4472)

(declare-fun mapRest!16026 () (Array (_ BitVec 32) ValueCell!4472))

(assert (=> mapNonEmpty!16026 (= (arr!11038 _values!506) (store mapRest!16026 mapKey!16026 mapValue!16026))))

(declare-fun b!390310 () Bool)

(declare-fun res!223377 () Bool)

(assert (=> b!390310 (=> (not res!223377) (not e!236421))))

(assert (=> b!390310 (= res!223377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390311 () Bool)

(declare-fun res!223372 () Bool)

(assert (=> b!390311 (=> (not res!223372) (not e!236421))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390311 (= res!223372 (and (= (size!11391 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11390 _keys!658) (size!11391 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!223374 () Bool)

(assert (=> start!37954 (=> (not res!223374) (not e!236421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37954 (= res!223374 (validMask!0 mask!970))))

(assert (=> start!37954 e!236421))

(declare-fun e!236419 () Bool)

(declare-fun array_inv!8108 (array!23149) Bool)

(assert (=> start!37954 (and (array_inv!8108 _values!506) e!236419)))

(assert (=> start!37954 tp!31644))

(assert (=> start!37954 true))

(assert (=> start!37954 tp_is_empty!9631))

(declare-fun array_inv!8109 (array!23147) Bool)

(assert (=> start!37954 (array_inv!8109 _keys!658)))

(declare-fun b!390312 () Bool)

(declare-fun e!236417 () Bool)

(assert (=> b!390312 (= e!236417 tp_is_empty!9631)))

(declare-fun b!390313 () Bool)

(declare-fun res!223375 () Bool)

(assert (=> b!390313 (=> (not res!223375) (not e!236421))))

(assert (=> b!390313 (= res!223375 (or (= (select (arr!11037 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11037 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390314 () Bool)

(declare-fun res!223370 () Bool)

(assert (=> b!390314 (=> (not res!223370) (not e!236421))))

(assert (=> b!390314 (= res!223370 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11390 _keys!658))))))

(declare-fun b!390315 () Bool)

(assert (=> b!390315 (= e!236420 (not e!236418))))

(declare-fun res!223378 () Bool)

(assert (=> b!390315 (=> res!223378 e!236418)))

(assert (=> b!390315 (= res!223378 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13947)

(declare-fun getCurrentListMap!2050 (array!23147 array!23149 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) Int) ListLongMap!5417)

(assert (=> b!390315 (= lt!183884 (getCurrentListMap!2050 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183878 () array!23149)

(assert (=> b!390315 (= lt!183880 (getCurrentListMap!2050 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183885 () ListLongMap!5417)

(assert (=> b!390315 (and (= lt!183882 lt!183885) (= lt!183885 lt!183882))))

(declare-fun v!373 () V!13947)

(assert (=> b!390315 (= lt!183885 (+!1044 lt!183877 (tuple2!6515 k0!778 v!373)))))

(declare-datatypes ((Unit!11934 0))(
  ( (Unit!11935) )
))
(declare-fun lt!183881 () Unit!11934)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!251 (array!23147 array!23149 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) (_ BitVec 64) V!13947 (_ BitVec 32) Int) Unit!11934)

(assert (=> b!390315 (= lt!183881 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!251 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!960 (array!23147 array!23149 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) Int) ListLongMap!5417)

(assert (=> b!390315 (= lt!183882 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390315 (= lt!183878 (array!23150 (store (arr!11038 _values!506) i!548 (ValueCellFull!4472 v!373)) (size!11391 _values!506)))))

(assert (=> b!390315 (= lt!183877 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390316 () Bool)

(declare-fun res!223380 () Bool)

(assert (=> b!390316 (=> (not res!223380) (not e!236420))))

(assert (=> b!390316 (= res!223380 (arrayNoDuplicates!0 lt!183883 #b00000000000000000000000000000000 Nil!6357))))

(declare-fun b!390317 () Bool)

(assert (=> b!390317 (= e!236419 (and e!236417 mapRes!16026))))

(declare-fun condMapEmpty!16026 () Bool)

(declare-fun mapDefault!16026 () ValueCell!4472)

(assert (=> b!390317 (= condMapEmpty!16026 (= (arr!11038 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4472)) mapDefault!16026)))))

(declare-fun b!390318 () Bool)

(declare-fun res!223376 () Bool)

(assert (=> b!390318 (=> (not res!223376) (not e!236421))))

(declare-fun arrayContainsKey!0 (array!23147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390318 (= res!223376 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390319 () Bool)

(declare-fun res!223379 () Bool)

(assert (=> b!390319 (=> (not res!223379) (not e!236421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390319 (= res!223379 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16026 () Bool)

(assert (=> mapIsEmpty!16026 mapRes!16026))

(assert (= (and start!37954 res!223374) b!390311))

(assert (= (and b!390311 res!223372) b!390310))

(assert (= (and b!390310 res!223377) b!390309))

(assert (= (and b!390309 res!223371) b!390314))

(assert (= (and b!390314 res!223370) b!390319))

(assert (= (and b!390319 res!223379) b!390313))

(assert (= (and b!390313 res!223375) b!390318))

(assert (= (and b!390318 res!223376) b!390307))

(assert (= (and b!390307 res!223373) b!390316))

(assert (= (and b!390316 res!223380) b!390315))

(assert (= (and b!390315 (not res!223378)) b!390306))

(assert (= (and b!390317 condMapEmpty!16026) mapIsEmpty!16026))

(assert (= (and b!390317 (not condMapEmpty!16026)) mapNonEmpty!16026))

(get-info :version)

(assert (= (and mapNonEmpty!16026 ((_ is ValueCellFull!4472) mapValue!16026)) b!390308))

(assert (= (and b!390317 ((_ is ValueCellFull!4472) mapDefault!16026)) b!390312))

(assert (= start!37954 b!390317))

(declare-fun m!386189 () Bool)

(assert (=> b!390307 m!386189))

(declare-fun m!386191 () Bool)

(assert (=> b!390307 m!386191))

(declare-fun m!386193 () Bool)

(assert (=> mapNonEmpty!16026 m!386193))

(declare-fun m!386195 () Bool)

(assert (=> start!37954 m!386195))

(declare-fun m!386197 () Bool)

(assert (=> start!37954 m!386197))

(declare-fun m!386199 () Bool)

(assert (=> start!37954 m!386199))

(declare-fun m!386201 () Bool)

(assert (=> b!390319 m!386201))

(declare-fun m!386203 () Bool)

(assert (=> b!390306 m!386203))

(declare-fun m!386205 () Bool)

(assert (=> b!390306 m!386205))

(declare-fun m!386207 () Bool)

(assert (=> b!390313 m!386207))

(declare-fun m!386209 () Bool)

(assert (=> b!390309 m!386209))

(declare-fun m!386211 () Bool)

(assert (=> b!390318 m!386211))

(declare-fun m!386213 () Bool)

(assert (=> b!390310 m!386213))

(declare-fun m!386215 () Bool)

(assert (=> b!390315 m!386215))

(declare-fun m!386217 () Bool)

(assert (=> b!390315 m!386217))

(declare-fun m!386219 () Bool)

(assert (=> b!390315 m!386219))

(declare-fun m!386221 () Bool)

(assert (=> b!390315 m!386221))

(declare-fun m!386223 () Bool)

(assert (=> b!390315 m!386223))

(declare-fun m!386225 () Bool)

(assert (=> b!390315 m!386225))

(declare-fun m!386227 () Bool)

(assert (=> b!390315 m!386227))

(declare-fun m!386229 () Bool)

(assert (=> b!390316 m!386229))

(check-sat (not b!390307) (not b!390319) (not b!390315) (not b_next!8959) tp_is_empty!9631 (not b!390310) (not b!390306) b_and!16235 (not b!390309) (not b!390318) (not b!390316) (not start!37954) (not mapNonEmpty!16026))
(check-sat b_and!16235 (not b_next!8959))
(get-model)

(declare-fun d!72805 () Bool)

(assert (=> d!72805 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37954 d!72805))

(declare-fun d!72807 () Bool)

(assert (=> d!72807 (= (array_inv!8108 _values!506) (bvsge (size!11391 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37954 d!72807))

(declare-fun d!72809 () Bool)

(assert (=> d!72809 (= (array_inv!8109 _keys!658) (bvsge (size!11390 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37954 d!72809))

(declare-fun b!390428 () Bool)

(declare-fun e!236485 () ListLongMap!5417)

(declare-fun call!27516 () ListLongMap!5417)

(assert (=> b!390428 (= e!236485 call!27516)))

(declare-fun b!390429 () Bool)

(declare-fun e!236479 () Bool)

(declare-fun e!236481 () Bool)

(assert (=> b!390429 (= e!236479 e!236481)))

(declare-fun c!54119 () Bool)

(assert (=> b!390429 (= c!54119 (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun b!390430 () Bool)

(declare-fun e!236483 () Bool)

(assert (=> b!390430 (= e!236479 e!236483)))

(assert (=> b!390430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun res!223455 () Bool)

(declare-fun lt!183956 () ListLongMap!5417)

(declare-fun contains!2445 (ListLongMap!5417 (_ BitVec 64)) Bool)

(assert (=> b!390430 (= res!223455 (contains!2445 lt!183956 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390430 (=> (not res!223455) (not e!236483))))

(declare-fun b!390431 () Bool)

(declare-fun lt!183958 () Unit!11934)

(declare-fun lt!183960 () Unit!11934)

(assert (=> b!390431 (= lt!183958 lt!183960)))

(declare-fun lt!183954 () V!13947)

(declare-fun lt!183957 () (_ BitVec 64))

(declare-fun lt!183959 () (_ BitVec 64))

(declare-fun lt!183955 () ListLongMap!5417)

(assert (=> b!390431 (not (contains!2445 (+!1044 lt!183955 (tuple2!6515 lt!183959 lt!183954)) lt!183957))))

(declare-fun addStillNotContains!136 (ListLongMap!5417 (_ BitVec 64) V!13947 (_ BitVec 64)) Unit!11934)

(assert (=> b!390431 (= lt!183960 (addStillNotContains!136 lt!183955 lt!183959 lt!183954 lt!183957))))

(assert (=> b!390431 (= lt!183957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5580 (ValueCell!4472 V!13947) V!13947)

(declare-fun dynLambda!636 (Int (_ BitVec 64)) V!13947)

(assert (=> b!390431 (= lt!183954 (get!5580 (select (arr!11038 _values!506) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390431 (= lt!183959 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390431 (= lt!183955 call!27516)))

(assert (=> b!390431 (= e!236485 (+!1044 call!27516 (tuple2!6515 (select (arr!11037 _keys!658) #b00000000000000000000000000000000) (get!5580 (select (arr!11038 _values!506) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390432 () Bool)

(declare-fun res!223457 () Bool)

(declare-fun e!236480 () Bool)

(assert (=> b!390432 (=> (not res!223457) (not e!236480))))

(assert (=> b!390432 (= res!223457 (not (contains!2445 lt!183956 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390433 () Bool)

(declare-fun e!236482 () ListLongMap!5417)

(assert (=> b!390433 (= e!236482 (ListLongMap!5418 Nil!6356))))

(declare-fun b!390434 () Bool)

(assert (=> b!390434 (= e!236480 e!236479)))

(declare-fun c!54120 () Bool)

(declare-fun e!236484 () Bool)

(assert (=> b!390434 (= c!54120 e!236484)))

(declare-fun res!223458 () Bool)

(assert (=> b!390434 (=> (not res!223458) (not e!236484))))

(assert (=> b!390434 (= res!223458 (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun d!72811 () Bool)

(assert (=> d!72811 e!236480))

(declare-fun res!223456 () Bool)

(assert (=> d!72811 (=> (not res!223456) (not e!236480))))

(assert (=> d!72811 (= res!223456 (not (contains!2445 lt!183956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72811 (= lt!183956 e!236482)))

(declare-fun c!54118 () Bool)

(assert (=> d!72811 (= c!54118 (bvsge #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(assert (=> d!72811 (validMask!0 mask!970)))

(assert (=> d!72811 (= (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183956)))

(declare-fun b!390435 () Bool)

(declare-fun isEmpty!552 (ListLongMap!5417) Bool)

(assert (=> b!390435 (= e!236481 (isEmpty!552 lt!183956))))

(declare-fun b!390436 () Bool)

(assert (=> b!390436 (= e!236484 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390436 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27513 () Bool)

(assert (=> bm!27513 (= call!27516 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390437 () Bool)

(assert (=> b!390437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(assert (=> b!390437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11391 _values!506)))))

(declare-fun apply!302 (ListLongMap!5417 (_ BitVec 64)) V!13947)

(assert (=> b!390437 (= e!236483 (= (apply!302 lt!183956 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)) (get!5580 (select (arr!11038 _values!506) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390438 () Bool)

(assert (=> b!390438 (= e!236482 e!236485)))

(declare-fun c!54117 () Bool)

(assert (=> b!390438 (= c!54117 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390439 () Bool)

(assert (=> b!390439 (= e!236481 (= lt!183956 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!72811 c!54118) b!390433))

(assert (= (and d!72811 (not c!54118)) b!390438))

(assert (= (and b!390438 c!54117) b!390431))

(assert (= (and b!390438 (not c!54117)) b!390428))

(assert (= (or b!390431 b!390428) bm!27513))

(assert (= (and d!72811 res!223456) b!390432))

(assert (= (and b!390432 res!223457) b!390434))

(assert (= (and b!390434 res!223458) b!390436))

(assert (= (and b!390434 c!54120) b!390430))

(assert (= (and b!390434 (not c!54120)) b!390429))

(assert (= (and b!390430 res!223455) b!390437))

(assert (= (and b!390429 c!54119) b!390439))

(assert (= (and b!390429 (not c!54119)) b!390435))

(declare-fun b_lambda!8629 () Bool)

(assert (=> (not b_lambda!8629) (not b!390431)))

(declare-fun t!11516 () Bool)

(declare-fun tb!3111 () Bool)

(assert (=> (and start!37954 (= defaultEntry!514 defaultEntry!514) t!11516) tb!3111))

(declare-fun result!5729 () Bool)

(assert (=> tb!3111 (= result!5729 tp_is_empty!9631)))

(assert (=> b!390431 t!11516))

(declare-fun b_and!16241 () Bool)

(assert (= b_and!16235 (and (=> t!11516 result!5729) b_and!16241)))

(declare-fun b_lambda!8631 () Bool)

(assert (=> (not b_lambda!8631) (not b!390437)))

(assert (=> b!390437 t!11516))

(declare-fun b_and!16243 () Bool)

(assert (= b_and!16241 (and (=> t!11516 result!5729) b_and!16243)))

(declare-fun m!386315 () Bool)

(assert (=> b!390439 m!386315))

(declare-fun m!386317 () Bool)

(assert (=> d!72811 m!386317))

(assert (=> d!72811 m!386195))

(assert (=> bm!27513 m!386315))

(declare-fun m!386319 () Bool)

(assert (=> b!390437 m!386319))

(declare-fun m!386321 () Bool)

(assert (=> b!390437 m!386321))

(declare-fun m!386323 () Bool)

(assert (=> b!390437 m!386323))

(declare-fun m!386325 () Bool)

(assert (=> b!390437 m!386325))

(assert (=> b!390437 m!386323))

(assert (=> b!390437 m!386319))

(declare-fun m!386327 () Bool)

(assert (=> b!390437 m!386327))

(assert (=> b!390437 m!386321))

(assert (=> b!390438 m!386319))

(assert (=> b!390438 m!386319))

(declare-fun m!386329 () Bool)

(assert (=> b!390438 m!386329))

(assert (=> b!390436 m!386319))

(assert (=> b!390436 m!386319))

(assert (=> b!390436 m!386329))

(declare-fun m!386331 () Bool)

(assert (=> b!390432 m!386331))

(assert (=> b!390431 m!386319))

(assert (=> b!390431 m!386323))

(declare-fun m!386333 () Bool)

(assert (=> b!390431 m!386333))

(assert (=> b!390431 m!386321))

(declare-fun m!386335 () Bool)

(assert (=> b!390431 m!386335))

(declare-fun m!386337 () Bool)

(assert (=> b!390431 m!386337))

(assert (=> b!390431 m!386335))

(declare-fun m!386339 () Bool)

(assert (=> b!390431 m!386339))

(assert (=> b!390431 m!386321))

(assert (=> b!390431 m!386323))

(assert (=> b!390431 m!386325))

(assert (=> b!390430 m!386319))

(assert (=> b!390430 m!386319))

(declare-fun m!386341 () Bool)

(assert (=> b!390430 m!386341))

(declare-fun m!386343 () Bool)

(assert (=> b!390435 m!386343))

(assert (=> b!390315 d!72811))

(declare-fun b!390484 () Bool)

(declare-fun e!236517 () Bool)

(declare-fun call!27534 () Bool)

(assert (=> b!390484 (= e!236517 (not call!27534))))

(declare-fun d!72813 () Bool)

(declare-fun e!236512 () Bool)

(assert (=> d!72813 e!236512))

(declare-fun res!223483 () Bool)

(assert (=> d!72813 (=> (not res!223483) (not e!236512))))

(assert (=> d!72813 (= res!223483 (or (bvsge #b00000000000000000000000000000000 (size!11390 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))))

(declare-fun lt!184009 () ListLongMap!5417)

(declare-fun lt!184010 () ListLongMap!5417)

(assert (=> d!72813 (= lt!184009 lt!184010)))

(declare-fun lt!184012 () Unit!11934)

(declare-fun e!236515 () Unit!11934)

(assert (=> d!72813 (= lt!184012 e!236515)))

(declare-fun c!54138 () Bool)

(declare-fun e!236522 () Bool)

(assert (=> d!72813 (= c!54138 e!236522)))

(declare-fun res!223481 () Bool)

(assert (=> d!72813 (=> (not res!223481) (not e!236522))))

(assert (=> d!72813 (= res!223481 (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun e!236518 () ListLongMap!5417)

(assert (=> d!72813 (= lt!184010 e!236518)))

(declare-fun c!54137 () Bool)

(assert (=> d!72813 (= c!54137 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72813 (validMask!0 mask!970)))

(assert (=> d!72813 (= (getCurrentListMap!2050 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184009)))

(declare-fun bm!27528 () Bool)

(declare-fun call!27533 () Bool)

(assert (=> bm!27528 (= call!27533 (contains!2445 lt!184009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390485 () Bool)

(declare-fun Unit!11938 () Unit!11934)

(assert (=> b!390485 (= e!236515 Unit!11938)))

(declare-fun b!390486 () Bool)

(declare-fun e!236514 () Bool)

(declare-fun e!236519 () Bool)

(assert (=> b!390486 (= e!236514 e!236519)))

(declare-fun res!223485 () Bool)

(assert (=> b!390486 (=> (not res!223485) (not e!236519))))

(assert (=> b!390486 (= res!223485 (contains!2445 lt!184009 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun b!390487 () Bool)

(declare-fun e!236524 () Bool)

(declare-fun e!236520 () Bool)

(assert (=> b!390487 (= e!236524 e!236520)))

(declare-fun res!223480 () Bool)

(assert (=> b!390487 (= res!223480 call!27533)))

(assert (=> b!390487 (=> (not res!223480) (not e!236520))))

(declare-fun bm!27529 () Bool)

(declare-fun call!27532 () ListLongMap!5417)

(declare-fun call!27531 () ListLongMap!5417)

(assert (=> bm!27529 (= call!27532 call!27531)))

(declare-fun b!390488 () Bool)

(declare-fun e!236516 () ListLongMap!5417)

(assert (=> b!390488 (= e!236518 e!236516)))

(declare-fun c!54135 () Bool)

(assert (=> b!390488 (= c!54135 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390489 () Bool)

(declare-fun call!27537 () ListLongMap!5417)

(assert (=> b!390489 (= e!236516 call!27537)))

(declare-fun b!390490 () Bool)

(assert (=> b!390490 (= e!236519 (= (apply!302 lt!184009 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)) (get!5580 (select (arr!11038 _values!506) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11391 _values!506)))))

(assert (=> b!390490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun b!390491 () Bool)

(declare-fun e!236521 () Bool)

(assert (=> b!390491 (= e!236517 e!236521)))

(declare-fun res!223482 () Bool)

(assert (=> b!390491 (= res!223482 call!27534)))

(assert (=> b!390491 (=> (not res!223482) (not e!236521))))

(declare-fun b!390492 () Bool)

(declare-fun lt!184017 () Unit!11934)

(assert (=> b!390492 (= e!236515 lt!184017)))

(declare-fun lt!184019 () ListLongMap!5417)

(assert (=> b!390492 (= lt!184019 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184015 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184016 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184016 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184006 () Unit!11934)

(declare-fun addStillContains!278 (ListLongMap!5417 (_ BitVec 64) V!13947 (_ BitVec 64)) Unit!11934)

(assert (=> b!390492 (= lt!184006 (addStillContains!278 lt!184019 lt!184015 zeroValue!472 lt!184016))))

(assert (=> b!390492 (contains!2445 (+!1044 lt!184019 (tuple2!6515 lt!184015 zeroValue!472)) lt!184016)))

(declare-fun lt!184005 () Unit!11934)

(assert (=> b!390492 (= lt!184005 lt!184006)))

(declare-fun lt!184018 () ListLongMap!5417)

(assert (=> b!390492 (= lt!184018 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184007 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184007 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184011 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184011 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184021 () Unit!11934)

(declare-fun addApplyDifferent!278 (ListLongMap!5417 (_ BitVec 64) V!13947 (_ BitVec 64)) Unit!11934)

(assert (=> b!390492 (= lt!184021 (addApplyDifferent!278 lt!184018 lt!184007 minValue!472 lt!184011))))

(assert (=> b!390492 (= (apply!302 (+!1044 lt!184018 (tuple2!6515 lt!184007 minValue!472)) lt!184011) (apply!302 lt!184018 lt!184011))))

(declare-fun lt!184025 () Unit!11934)

(assert (=> b!390492 (= lt!184025 lt!184021)))

(declare-fun lt!184020 () ListLongMap!5417)

(assert (=> b!390492 (= lt!184020 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184023 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184013 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184013 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184026 () Unit!11934)

(assert (=> b!390492 (= lt!184026 (addApplyDifferent!278 lt!184020 lt!184023 zeroValue!472 lt!184013))))

(assert (=> b!390492 (= (apply!302 (+!1044 lt!184020 (tuple2!6515 lt!184023 zeroValue!472)) lt!184013) (apply!302 lt!184020 lt!184013))))

(declare-fun lt!184024 () Unit!11934)

(assert (=> b!390492 (= lt!184024 lt!184026)))

(declare-fun lt!184022 () ListLongMap!5417)

(assert (=> b!390492 (= lt!184022 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184014 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184014 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184008 () (_ BitVec 64))

(assert (=> b!390492 (= lt!184008 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390492 (= lt!184017 (addApplyDifferent!278 lt!184022 lt!184014 minValue!472 lt!184008))))

(assert (=> b!390492 (= (apply!302 (+!1044 lt!184022 (tuple2!6515 lt!184014 minValue!472)) lt!184008) (apply!302 lt!184022 lt!184008))))

(declare-fun b!390493 () Bool)

(declare-fun res!223477 () Bool)

(assert (=> b!390493 (=> (not res!223477) (not e!236512))))

(assert (=> b!390493 (= res!223477 e!236524)))

(declare-fun c!54136 () Bool)

(assert (=> b!390493 (= c!54136 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390494 () Bool)

(assert (=> b!390494 (= e!236524 (not call!27533))))

(declare-fun b!390495 () Bool)

(assert (=> b!390495 (= e!236512 e!236517)))

(declare-fun c!54133 () Bool)

(assert (=> b!390495 (= c!54133 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27535 () ListLongMap!5417)

(declare-fun bm!27530 () Bool)

(declare-fun call!27536 () ListLongMap!5417)

(assert (=> bm!27530 (= call!27535 (+!1044 (ite c!54137 call!27531 (ite c!54135 call!27532 call!27536)) (ite (or c!54137 c!54135) (tuple2!6515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390496 () Bool)

(declare-fun e!236523 () Bool)

(assert (=> b!390496 (= e!236523 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390497 () Bool)

(declare-fun e!236513 () ListLongMap!5417)

(assert (=> b!390497 (= e!236513 call!27536)))

(declare-fun b!390498 () Bool)

(assert (=> b!390498 (= e!236520 (= (apply!302 lt!184009 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27531 () Bool)

(assert (=> bm!27531 (= call!27537 call!27535)))

(declare-fun b!390499 () Bool)

(assert (=> b!390499 (= e!236522 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390500 () Bool)

(assert (=> b!390500 (= e!236518 (+!1044 call!27535 (tuple2!6515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390501 () Bool)

(declare-fun res!223478 () Bool)

(assert (=> b!390501 (=> (not res!223478) (not e!236512))))

(assert (=> b!390501 (= res!223478 e!236514)))

(declare-fun res!223479 () Bool)

(assert (=> b!390501 (=> res!223479 e!236514)))

(assert (=> b!390501 (= res!223479 (not e!236523))))

(declare-fun res!223484 () Bool)

(assert (=> b!390501 (=> (not res!223484) (not e!236523))))

(assert (=> b!390501 (= res!223484 (bvslt #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(declare-fun bm!27532 () Bool)

(assert (=> bm!27532 (= call!27536 call!27532)))

(declare-fun b!390502 () Bool)

(declare-fun c!54134 () Bool)

(assert (=> b!390502 (= c!54134 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!390502 (= e!236516 e!236513)))

(declare-fun b!390503 () Bool)

(assert (=> b!390503 (= e!236521 (= (apply!302 lt!184009 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27533 () Bool)

(assert (=> bm!27533 (= call!27534 (contains!2445 lt!184009 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390504 () Bool)

(assert (=> b!390504 (= e!236513 call!27537)))

(declare-fun bm!27534 () Bool)

(assert (=> bm!27534 (= call!27531 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72813 c!54137) b!390500))

(assert (= (and d!72813 (not c!54137)) b!390488))

(assert (= (and b!390488 c!54135) b!390489))

(assert (= (and b!390488 (not c!54135)) b!390502))

(assert (= (and b!390502 c!54134) b!390504))

(assert (= (and b!390502 (not c!54134)) b!390497))

(assert (= (or b!390504 b!390497) bm!27532))

(assert (= (or b!390489 bm!27532) bm!27529))

(assert (= (or b!390489 b!390504) bm!27531))

(assert (= (or b!390500 bm!27529) bm!27534))

(assert (= (or b!390500 bm!27531) bm!27530))

(assert (= (and d!72813 res!223481) b!390499))

(assert (= (and d!72813 c!54138) b!390492))

(assert (= (and d!72813 (not c!54138)) b!390485))

(assert (= (and d!72813 res!223483) b!390501))

(assert (= (and b!390501 res!223484) b!390496))

(assert (= (and b!390501 (not res!223479)) b!390486))

(assert (= (and b!390486 res!223485) b!390490))

(assert (= (and b!390501 res!223478) b!390493))

(assert (= (and b!390493 c!54136) b!390487))

(assert (= (and b!390493 (not c!54136)) b!390494))

(assert (= (and b!390487 res!223480) b!390498))

(assert (= (or b!390487 b!390494) bm!27528))

(assert (= (and b!390493 res!223477) b!390495))

(assert (= (and b!390495 c!54133) b!390491))

(assert (= (and b!390495 (not c!54133)) b!390484))

(assert (= (and b!390491 res!223482) b!390503))

(assert (= (or b!390491 b!390484) bm!27533))

(declare-fun b_lambda!8633 () Bool)

(assert (=> (not b_lambda!8633) (not b!390490)))

(assert (=> b!390490 t!11516))

(declare-fun b_and!16245 () Bool)

(assert (= b_and!16243 (and (=> t!11516 result!5729) b_and!16245)))

(assert (=> d!72813 m!386195))

(assert (=> bm!27534 m!386215))

(declare-fun m!386345 () Bool)

(assert (=> b!390498 m!386345))

(assert (=> b!390496 m!386319))

(assert (=> b!390496 m!386319))

(assert (=> b!390496 m!386329))

(declare-fun m!386347 () Bool)

(assert (=> bm!27530 m!386347))

(declare-fun m!386349 () Bool)

(assert (=> b!390500 m!386349))

(declare-fun m!386351 () Bool)

(assert (=> bm!27528 m!386351))

(declare-fun m!386353 () Bool)

(assert (=> b!390492 m!386353))

(declare-fun m!386355 () Bool)

(assert (=> b!390492 m!386355))

(declare-fun m!386357 () Bool)

(assert (=> b!390492 m!386357))

(declare-fun m!386359 () Bool)

(assert (=> b!390492 m!386359))

(declare-fun m!386361 () Bool)

(assert (=> b!390492 m!386361))

(declare-fun m!386363 () Bool)

(assert (=> b!390492 m!386363))

(assert (=> b!390492 m!386363))

(declare-fun m!386365 () Bool)

(assert (=> b!390492 m!386365))

(assert (=> b!390492 m!386353))

(declare-fun m!386367 () Bool)

(assert (=> b!390492 m!386367))

(declare-fun m!386369 () Bool)

(assert (=> b!390492 m!386369))

(assert (=> b!390492 m!386319))

(declare-fun m!386371 () Bool)

(assert (=> b!390492 m!386371))

(declare-fun m!386373 () Bool)

(assert (=> b!390492 m!386373))

(assert (=> b!390492 m!386361))

(declare-fun m!386375 () Bool)

(assert (=> b!390492 m!386375))

(declare-fun m!386377 () Bool)

(assert (=> b!390492 m!386377))

(assert (=> b!390492 m!386215))

(declare-fun m!386379 () Bool)

(assert (=> b!390492 m!386379))

(assert (=> b!390492 m!386367))

(declare-fun m!386381 () Bool)

(assert (=> b!390492 m!386381))

(declare-fun m!386383 () Bool)

(assert (=> bm!27533 m!386383))

(assert (=> b!390486 m!386319))

(assert (=> b!390486 m!386319))

(declare-fun m!386385 () Bool)

(assert (=> b!390486 m!386385))

(assert (=> b!390490 m!386321))

(assert (=> b!390490 m!386323))

(assert (=> b!390490 m!386325))

(assert (=> b!390490 m!386319))

(assert (=> b!390490 m!386319))

(declare-fun m!386387 () Bool)

(assert (=> b!390490 m!386387))

(assert (=> b!390490 m!386323))

(assert (=> b!390490 m!386321))

(declare-fun m!386389 () Bool)

(assert (=> b!390503 m!386389))

(assert (=> b!390499 m!386319))

(assert (=> b!390499 m!386319))

(assert (=> b!390499 m!386329))

(assert (=> b!390315 d!72813))

(declare-fun b!390511 () Bool)

(declare-fun e!236529 () Bool)

(declare-fun e!236530 () Bool)

(assert (=> b!390511 (= e!236529 e!236530)))

(declare-fun c!54141 () Bool)

(assert (=> b!390511 (= c!54141 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!390512 () Bool)

(declare-fun call!27543 () ListLongMap!5417)

(declare-fun call!27542 () ListLongMap!5417)

(assert (=> b!390512 (= e!236530 (= call!27543 call!27542))))

(declare-fun bm!27539 () Bool)

(assert (=> bm!27539 (= call!27543 (getCurrentListMapNoExtraKeys!960 (array!23148 (store (arr!11037 _keys!658) i!548 k0!778) (size!11390 _keys!658)) (array!23150 (store (arr!11038 _values!506) i!548 (ValueCellFull!4472 v!373)) (size!11391 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390513 () Bool)

(assert (=> b!390513 (= e!236530 (= call!27543 (+!1044 call!27542 (tuple2!6515 k0!778 v!373))))))

(declare-fun d!72815 () Bool)

(assert (=> d!72815 e!236529))

(declare-fun res!223488 () Bool)

(assert (=> d!72815 (=> (not res!223488) (not e!236529))))

(assert (=> d!72815 (= res!223488 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11390 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11391 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11390 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11391 _values!506))))))))

(declare-fun lt!184029 () Unit!11934)

(declare-fun choose!1324 (array!23147 array!23149 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) (_ BitVec 64) V!13947 (_ BitVec 32) Int) Unit!11934)

(assert (=> d!72815 (= lt!184029 (choose!1324 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(assert (=> d!72815 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!251 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184029)))

(declare-fun bm!27540 () Bool)

(assert (=> bm!27540 (= call!27542 (getCurrentListMapNoExtraKeys!960 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72815 res!223488) b!390511))

(assert (= (and b!390511 c!54141) b!390513))

(assert (= (and b!390511 (not c!54141)) b!390512))

(assert (= (or b!390513 b!390512) bm!27540))

(assert (= (or b!390513 b!390512) bm!27539))

(assert (=> bm!27539 m!386191))

(assert (=> bm!27539 m!386221))

(declare-fun m!386391 () Bool)

(assert (=> bm!27539 m!386391))

(declare-fun m!386393 () Bool)

(assert (=> b!390513 m!386393))

(declare-fun m!386395 () Bool)

(assert (=> d!72815 m!386395))

(assert (=> bm!27540 m!386215))

(assert (=> b!390315 d!72815))

(declare-fun d!72817 () Bool)

(declare-fun e!236533 () Bool)

(assert (=> d!72817 e!236533))

(declare-fun res!223493 () Bool)

(assert (=> d!72817 (=> (not res!223493) (not e!236533))))

(declare-fun lt!184041 () ListLongMap!5417)

(assert (=> d!72817 (= res!223493 (contains!2445 lt!184041 (_1!3268 (tuple2!6515 k0!778 v!373))))))

(declare-fun lt!184039 () List!6359)

(assert (=> d!72817 (= lt!184041 (ListLongMap!5418 lt!184039))))

(declare-fun lt!184040 () Unit!11934)

(declare-fun lt!184038 () Unit!11934)

(assert (=> d!72817 (= lt!184040 lt!184038)))

(declare-datatypes ((Option!364 0))(
  ( (Some!363 (v!7077 V!13947)) (None!362) )
))
(declare-fun getValueByKey!358 (List!6359 (_ BitVec 64)) Option!364)

(assert (=> d!72817 (= (getValueByKey!358 lt!184039 (_1!3268 (tuple2!6515 k0!778 v!373))) (Some!363 (_2!3268 (tuple2!6515 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!183 (List!6359 (_ BitVec 64) V!13947) Unit!11934)

(assert (=> d!72817 (= lt!184038 (lemmaContainsTupThenGetReturnValue!183 lt!184039 (_1!3268 (tuple2!6515 k0!778 v!373)) (_2!3268 (tuple2!6515 k0!778 v!373))))))

(declare-fun insertStrictlySorted!186 (List!6359 (_ BitVec 64) V!13947) List!6359)

(assert (=> d!72817 (= lt!184039 (insertStrictlySorted!186 (toList!2724 lt!183877) (_1!3268 (tuple2!6515 k0!778 v!373)) (_2!3268 (tuple2!6515 k0!778 v!373))))))

(assert (=> d!72817 (= (+!1044 lt!183877 (tuple2!6515 k0!778 v!373)) lt!184041)))

(declare-fun b!390518 () Bool)

(declare-fun res!223494 () Bool)

(assert (=> b!390518 (=> (not res!223494) (not e!236533))))

(assert (=> b!390518 (= res!223494 (= (getValueByKey!358 (toList!2724 lt!184041) (_1!3268 (tuple2!6515 k0!778 v!373))) (Some!363 (_2!3268 (tuple2!6515 k0!778 v!373)))))))

(declare-fun b!390519 () Bool)

(declare-fun contains!2446 (List!6359 tuple2!6514) Bool)

(assert (=> b!390519 (= e!236533 (contains!2446 (toList!2724 lt!184041) (tuple2!6515 k0!778 v!373)))))

(assert (= (and d!72817 res!223493) b!390518))

(assert (= (and b!390518 res!223494) b!390519))

(declare-fun m!386397 () Bool)

(assert (=> d!72817 m!386397))

(declare-fun m!386399 () Bool)

(assert (=> d!72817 m!386399))

(declare-fun m!386401 () Bool)

(assert (=> d!72817 m!386401))

(declare-fun m!386403 () Bool)

(assert (=> d!72817 m!386403))

(declare-fun m!386405 () Bool)

(assert (=> b!390518 m!386405))

(declare-fun m!386407 () Bool)

(assert (=> b!390519 m!386407))

(assert (=> b!390315 d!72817))

(declare-fun b!390520 () Bool)

(declare-fun e!236540 () ListLongMap!5417)

(declare-fun call!27544 () ListLongMap!5417)

(assert (=> b!390520 (= e!236540 call!27544)))

(declare-fun b!390521 () Bool)

(declare-fun e!236534 () Bool)

(declare-fun e!236536 () Bool)

(assert (=> b!390521 (= e!236534 e!236536)))

(declare-fun c!54144 () Bool)

(assert (=> b!390521 (= c!54144 (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun b!390522 () Bool)

(declare-fun e!236538 () Bool)

(assert (=> b!390522 (= e!236534 e!236538)))

(assert (=> b!390522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun res!223495 () Bool)

(declare-fun lt!184044 () ListLongMap!5417)

(assert (=> b!390522 (= res!223495 (contains!2445 lt!184044 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(assert (=> b!390522 (=> (not res!223495) (not e!236538))))

(declare-fun b!390523 () Bool)

(declare-fun lt!184046 () Unit!11934)

(declare-fun lt!184048 () Unit!11934)

(assert (=> b!390523 (= lt!184046 lt!184048)))

(declare-fun lt!184042 () V!13947)

(declare-fun lt!184043 () ListLongMap!5417)

(declare-fun lt!184047 () (_ BitVec 64))

(declare-fun lt!184045 () (_ BitVec 64))

(assert (=> b!390523 (not (contains!2445 (+!1044 lt!184043 (tuple2!6515 lt!184047 lt!184042)) lt!184045))))

(assert (=> b!390523 (= lt!184048 (addStillNotContains!136 lt!184043 lt!184047 lt!184042 lt!184045))))

(assert (=> b!390523 (= lt!184045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390523 (= lt!184042 (get!5580 (select (arr!11038 lt!183878) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390523 (= lt!184047 (select (arr!11037 lt!183883) #b00000000000000000000000000000000))))

(assert (=> b!390523 (= lt!184043 call!27544)))

(assert (=> b!390523 (= e!236540 (+!1044 call!27544 (tuple2!6515 (select (arr!11037 lt!183883) #b00000000000000000000000000000000) (get!5580 (select (arr!11038 lt!183878) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390524 () Bool)

(declare-fun res!223497 () Bool)

(declare-fun e!236535 () Bool)

(assert (=> b!390524 (=> (not res!223497) (not e!236535))))

(assert (=> b!390524 (= res!223497 (not (contains!2445 lt!184044 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390525 () Bool)

(declare-fun e!236537 () ListLongMap!5417)

(assert (=> b!390525 (= e!236537 (ListLongMap!5418 Nil!6356))))

(declare-fun b!390526 () Bool)

(assert (=> b!390526 (= e!236535 e!236534)))

(declare-fun c!54145 () Bool)

(declare-fun e!236539 () Bool)

(assert (=> b!390526 (= c!54145 e!236539)))

(declare-fun res!223498 () Bool)

(assert (=> b!390526 (=> (not res!223498) (not e!236539))))

(assert (=> b!390526 (= res!223498 (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun d!72819 () Bool)

(assert (=> d!72819 e!236535))

(declare-fun res!223496 () Bool)

(assert (=> d!72819 (=> (not res!223496) (not e!236535))))

(assert (=> d!72819 (= res!223496 (not (contains!2445 lt!184044 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72819 (= lt!184044 e!236537)))

(declare-fun c!54143 () Bool)

(assert (=> d!72819 (= c!54143 (bvsge #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(assert (=> d!72819 (validMask!0 mask!970)))

(assert (=> d!72819 (= (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184044)))

(declare-fun b!390527 () Bool)

(assert (=> b!390527 (= e!236536 (isEmpty!552 lt!184044))))

(declare-fun b!390528 () Bool)

(assert (=> b!390528 (= e!236539 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(assert (=> b!390528 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27541 () Bool)

(assert (=> bm!27541 (= call!27544 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390529 () Bool)

(assert (=> b!390529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(assert (=> b!390529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11391 lt!183878)))))

(assert (=> b!390529 (= e!236538 (= (apply!302 lt!184044 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)) (get!5580 (select (arr!11038 lt!183878) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390530 () Bool)

(assert (=> b!390530 (= e!236537 e!236540)))

(declare-fun c!54142 () Bool)

(assert (=> b!390530 (= c!54142 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun b!390531 () Bool)

(assert (=> b!390531 (= e!236536 (= lt!184044 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!72819 c!54143) b!390525))

(assert (= (and d!72819 (not c!54143)) b!390530))

(assert (= (and b!390530 c!54142) b!390523))

(assert (= (and b!390530 (not c!54142)) b!390520))

(assert (= (or b!390523 b!390520) bm!27541))

(assert (= (and d!72819 res!223496) b!390524))

(assert (= (and b!390524 res!223497) b!390526))

(assert (= (and b!390526 res!223498) b!390528))

(assert (= (and b!390526 c!54145) b!390522))

(assert (= (and b!390526 (not c!54145)) b!390521))

(assert (= (and b!390522 res!223495) b!390529))

(assert (= (and b!390521 c!54144) b!390531))

(assert (= (and b!390521 (not c!54144)) b!390527))

(declare-fun b_lambda!8635 () Bool)

(assert (=> (not b_lambda!8635) (not b!390523)))

(assert (=> b!390523 t!11516))

(declare-fun b_and!16247 () Bool)

(assert (= b_and!16245 (and (=> t!11516 result!5729) b_and!16247)))

(declare-fun b_lambda!8637 () Bool)

(assert (=> (not b_lambda!8637) (not b!390529)))

(assert (=> b!390529 t!11516))

(declare-fun b_and!16249 () Bool)

(assert (= b_and!16247 (and (=> t!11516 result!5729) b_and!16249)))

(declare-fun m!386409 () Bool)

(assert (=> b!390531 m!386409))

(declare-fun m!386411 () Bool)

(assert (=> d!72819 m!386411))

(assert (=> d!72819 m!386195))

(assert (=> bm!27541 m!386409))

(declare-fun m!386413 () Bool)

(assert (=> b!390529 m!386413))

(declare-fun m!386415 () Bool)

(assert (=> b!390529 m!386415))

(assert (=> b!390529 m!386323))

(declare-fun m!386417 () Bool)

(assert (=> b!390529 m!386417))

(assert (=> b!390529 m!386323))

(assert (=> b!390529 m!386413))

(declare-fun m!386419 () Bool)

(assert (=> b!390529 m!386419))

(assert (=> b!390529 m!386415))

(assert (=> b!390530 m!386413))

(assert (=> b!390530 m!386413))

(declare-fun m!386421 () Bool)

(assert (=> b!390530 m!386421))

(assert (=> b!390528 m!386413))

(assert (=> b!390528 m!386413))

(assert (=> b!390528 m!386421))

(declare-fun m!386423 () Bool)

(assert (=> b!390524 m!386423))

(assert (=> b!390523 m!386413))

(assert (=> b!390523 m!386323))

(declare-fun m!386425 () Bool)

(assert (=> b!390523 m!386425))

(assert (=> b!390523 m!386415))

(declare-fun m!386427 () Bool)

(assert (=> b!390523 m!386427))

(declare-fun m!386429 () Bool)

(assert (=> b!390523 m!386429))

(assert (=> b!390523 m!386427))

(declare-fun m!386431 () Bool)

(assert (=> b!390523 m!386431))

(assert (=> b!390523 m!386415))

(assert (=> b!390523 m!386323))

(assert (=> b!390523 m!386417))

(assert (=> b!390522 m!386413))

(assert (=> b!390522 m!386413))

(declare-fun m!386433 () Bool)

(assert (=> b!390522 m!386433))

(declare-fun m!386435 () Bool)

(assert (=> b!390527 m!386435))

(assert (=> b!390315 d!72819))

(declare-fun b!390532 () Bool)

(declare-fun e!236546 () Bool)

(declare-fun call!27548 () Bool)

(assert (=> b!390532 (= e!236546 (not call!27548))))

(declare-fun d!72821 () Bool)

(declare-fun e!236541 () Bool)

(assert (=> d!72821 e!236541))

(declare-fun res!223505 () Bool)

(assert (=> d!72821 (=> (not res!223505) (not e!236541))))

(assert (=> d!72821 (= res!223505 (or (bvsge #b00000000000000000000000000000000 (size!11390 lt!183883)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))))

(declare-fun lt!184053 () ListLongMap!5417)

(declare-fun lt!184054 () ListLongMap!5417)

(assert (=> d!72821 (= lt!184053 lt!184054)))

(declare-fun lt!184056 () Unit!11934)

(declare-fun e!236544 () Unit!11934)

(assert (=> d!72821 (= lt!184056 e!236544)))

(declare-fun c!54151 () Bool)

(declare-fun e!236551 () Bool)

(assert (=> d!72821 (= c!54151 e!236551)))

(declare-fun res!223503 () Bool)

(assert (=> d!72821 (=> (not res!223503) (not e!236551))))

(assert (=> d!72821 (= res!223503 (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun e!236547 () ListLongMap!5417)

(assert (=> d!72821 (= lt!184054 e!236547)))

(declare-fun c!54150 () Bool)

(assert (=> d!72821 (= c!54150 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72821 (validMask!0 mask!970)))

(assert (=> d!72821 (= (getCurrentListMap!2050 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184053)))

(declare-fun bm!27542 () Bool)

(declare-fun call!27547 () Bool)

(assert (=> bm!27542 (= call!27547 (contains!2445 lt!184053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390533 () Bool)

(declare-fun Unit!11939 () Unit!11934)

(assert (=> b!390533 (= e!236544 Unit!11939)))

(declare-fun b!390534 () Bool)

(declare-fun e!236543 () Bool)

(declare-fun e!236548 () Bool)

(assert (=> b!390534 (= e!236543 e!236548)))

(declare-fun res!223507 () Bool)

(assert (=> b!390534 (=> (not res!223507) (not e!236548))))

(assert (=> b!390534 (= res!223507 (contains!2445 lt!184053 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(assert (=> b!390534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun b!390535 () Bool)

(declare-fun e!236553 () Bool)

(declare-fun e!236549 () Bool)

(assert (=> b!390535 (= e!236553 e!236549)))

(declare-fun res!223502 () Bool)

(assert (=> b!390535 (= res!223502 call!27547)))

(assert (=> b!390535 (=> (not res!223502) (not e!236549))))

(declare-fun bm!27543 () Bool)

(declare-fun call!27546 () ListLongMap!5417)

(declare-fun call!27545 () ListLongMap!5417)

(assert (=> bm!27543 (= call!27546 call!27545)))

(declare-fun b!390536 () Bool)

(declare-fun e!236545 () ListLongMap!5417)

(assert (=> b!390536 (= e!236547 e!236545)))

(declare-fun c!54148 () Bool)

(assert (=> b!390536 (= c!54148 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390537 () Bool)

(declare-fun call!27551 () ListLongMap!5417)

(assert (=> b!390537 (= e!236545 call!27551)))

(declare-fun b!390538 () Bool)

(assert (=> b!390538 (= e!236548 (= (apply!302 lt!184053 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)) (get!5580 (select (arr!11038 lt!183878) #b00000000000000000000000000000000) (dynLambda!636 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11391 lt!183878)))))

(assert (=> b!390538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun b!390539 () Bool)

(declare-fun e!236550 () Bool)

(assert (=> b!390539 (= e!236546 e!236550)))

(declare-fun res!223504 () Bool)

(assert (=> b!390539 (= res!223504 call!27548)))

(assert (=> b!390539 (=> (not res!223504) (not e!236550))))

(declare-fun b!390540 () Bool)

(declare-fun lt!184061 () Unit!11934)

(assert (=> b!390540 (= e!236544 lt!184061)))

(declare-fun lt!184063 () ListLongMap!5417)

(assert (=> b!390540 (= lt!184063 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184059 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184060 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184060 (select (arr!11037 lt!183883) #b00000000000000000000000000000000))))

(declare-fun lt!184050 () Unit!11934)

(assert (=> b!390540 (= lt!184050 (addStillContains!278 lt!184063 lt!184059 zeroValue!472 lt!184060))))

(assert (=> b!390540 (contains!2445 (+!1044 lt!184063 (tuple2!6515 lt!184059 zeroValue!472)) lt!184060)))

(declare-fun lt!184049 () Unit!11934)

(assert (=> b!390540 (= lt!184049 lt!184050)))

(declare-fun lt!184062 () ListLongMap!5417)

(assert (=> b!390540 (= lt!184062 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184051 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184055 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184055 (select (arr!11037 lt!183883) #b00000000000000000000000000000000))))

(declare-fun lt!184065 () Unit!11934)

(assert (=> b!390540 (= lt!184065 (addApplyDifferent!278 lt!184062 lt!184051 minValue!472 lt!184055))))

(assert (=> b!390540 (= (apply!302 (+!1044 lt!184062 (tuple2!6515 lt!184051 minValue!472)) lt!184055) (apply!302 lt!184062 lt!184055))))

(declare-fun lt!184069 () Unit!11934)

(assert (=> b!390540 (= lt!184069 lt!184065)))

(declare-fun lt!184064 () ListLongMap!5417)

(assert (=> b!390540 (= lt!184064 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184067 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184057 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184057 (select (arr!11037 lt!183883) #b00000000000000000000000000000000))))

(declare-fun lt!184070 () Unit!11934)

(assert (=> b!390540 (= lt!184070 (addApplyDifferent!278 lt!184064 lt!184067 zeroValue!472 lt!184057))))

(assert (=> b!390540 (= (apply!302 (+!1044 lt!184064 (tuple2!6515 lt!184067 zeroValue!472)) lt!184057) (apply!302 lt!184064 lt!184057))))

(declare-fun lt!184068 () Unit!11934)

(assert (=> b!390540 (= lt!184068 lt!184070)))

(declare-fun lt!184066 () ListLongMap!5417)

(assert (=> b!390540 (= lt!184066 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184058 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184052 () (_ BitVec 64))

(assert (=> b!390540 (= lt!184052 (select (arr!11037 lt!183883) #b00000000000000000000000000000000))))

(assert (=> b!390540 (= lt!184061 (addApplyDifferent!278 lt!184066 lt!184058 minValue!472 lt!184052))))

(assert (=> b!390540 (= (apply!302 (+!1044 lt!184066 (tuple2!6515 lt!184058 minValue!472)) lt!184052) (apply!302 lt!184066 lt!184052))))

(declare-fun b!390541 () Bool)

(declare-fun res!223499 () Bool)

(assert (=> b!390541 (=> (not res!223499) (not e!236541))))

(assert (=> b!390541 (= res!223499 e!236553)))

(declare-fun c!54149 () Bool)

(assert (=> b!390541 (= c!54149 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390542 () Bool)

(assert (=> b!390542 (= e!236553 (not call!27547))))

(declare-fun b!390543 () Bool)

(assert (=> b!390543 (= e!236541 e!236546)))

(declare-fun c!54146 () Bool)

(assert (=> b!390543 (= c!54146 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27549 () ListLongMap!5417)

(declare-fun bm!27544 () Bool)

(declare-fun call!27550 () ListLongMap!5417)

(assert (=> bm!27544 (= call!27549 (+!1044 (ite c!54150 call!27545 (ite c!54148 call!27546 call!27550)) (ite (or c!54150 c!54148) (tuple2!6515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390544 () Bool)

(declare-fun e!236552 () Bool)

(assert (=> b!390544 (= e!236552 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun b!390545 () Bool)

(declare-fun e!236542 () ListLongMap!5417)

(assert (=> b!390545 (= e!236542 call!27550)))

(declare-fun b!390546 () Bool)

(assert (=> b!390546 (= e!236549 (= (apply!302 lt!184053 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27545 () Bool)

(assert (=> bm!27545 (= call!27551 call!27549)))

(declare-fun b!390547 () Bool)

(assert (=> b!390547 (= e!236551 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun b!390548 () Bool)

(assert (=> b!390548 (= e!236547 (+!1044 call!27549 (tuple2!6515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390549 () Bool)

(declare-fun res!223500 () Bool)

(assert (=> b!390549 (=> (not res!223500) (not e!236541))))

(assert (=> b!390549 (= res!223500 e!236543)))

(declare-fun res!223501 () Bool)

(assert (=> b!390549 (=> res!223501 e!236543)))

(assert (=> b!390549 (= res!223501 (not e!236552))))

(declare-fun res!223506 () Bool)

(assert (=> b!390549 (=> (not res!223506) (not e!236552))))

(assert (=> b!390549 (= res!223506 (bvslt #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(declare-fun bm!27546 () Bool)

(assert (=> bm!27546 (= call!27550 call!27546)))

(declare-fun b!390550 () Bool)

(declare-fun c!54147 () Bool)

(assert (=> b!390550 (= c!54147 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!390550 (= e!236545 e!236542)))

(declare-fun b!390551 () Bool)

(assert (=> b!390551 (= e!236550 (= (apply!302 lt!184053 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27547 () Bool)

(assert (=> bm!27547 (= call!27548 (contains!2445 lt!184053 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390552 () Bool)

(assert (=> b!390552 (= e!236542 call!27551)))

(declare-fun bm!27548 () Bool)

(assert (=> bm!27548 (= call!27545 (getCurrentListMapNoExtraKeys!960 lt!183883 lt!183878 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72821 c!54150) b!390548))

(assert (= (and d!72821 (not c!54150)) b!390536))

(assert (= (and b!390536 c!54148) b!390537))

(assert (= (and b!390536 (not c!54148)) b!390550))

(assert (= (and b!390550 c!54147) b!390552))

(assert (= (and b!390550 (not c!54147)) b!390545))

(assert (= (or b!390552 b!390545) bm!27546))

(assert (= (or b!390537 bm!27546) bm!27543))

(assert (= (or b!390537 b!390552) bm!27545))

(assert (= (or b!390548 bm!27543) bm!27548))

(assert (= (or b!390548 bm!27545) bm!27544))

(assert (= (and d!72821 res!223503) b!390547))

(assert (= (and d!72821 c!54151) b!390540))

(assert (= (and d!72821 (not c!54151)) b!390533))

(assert (= (and d!72821 res!223505) b!390549))

(assert (= (and b!390549 res!223506) b!390544))

(assert (= (and b!390549 (not res!223501)) b!390534))

(assert (= (and b!390534 res!223507) b!390538))

(assert (= (and b!390549 res!223500) b!390541))

(assert (= (and b!390541 c!54149) b!390535))

(assert (= (and b!390541 (not c!54149)) b!390542))

(assert (= (and b!390535 res!223502) b!390546))

(assert (= (or b!390535 b!390542) bm!27542))

(assert (= (and b!390541 res!223499) b!390543))

(assert (= (and b!390543 c!54146) b!390539))

(assert (= (and b!390543 (not c!54146)) b!390532))

(assert (= (and b!390539 res!223504) b!390551))

(assert (= (or b!390539 b!390532) bm!27547))

(declare-fun b_lambda!8639 () Bool)

(assert (=> (not b_lambda!8639) (not b!390538)))

(assert (=> b!390538 t!11516))

(declare-fun b_and!16251 () Bool)

(assert (= b_and!16249 (and (=> t!11516 result!5729) b_and!16251)))

(assert (=> d!72821 m!386195))

(assert (=> bm!27548 m!386225))

(declare-fun m!386437 () Bool)

(assert (=> b!390546 m!386437))

(assert (=> b!390544 m!386413))

(assert (=> b!390544 m!386413))

(assert (=> b!390544 m!386421))

(declare-fun m!386439 () Bool)

(assert (=> bm!27544 m!386439))

(declare-fun m!386441 () Bool)

(assert (=> b!390548 m!386441))

(declare-fun m!386443 () Bool)

(assert (=> bm!27542 m!386443))

(declare-fun m!386445 () Bool)

(assert (=> b!390540 m!386445))

(declare-fun m!386447 () Bool)

(assert (=> b!390540 m!386447))

(declare-fun m!386449 () Bool)

(assert (=> b!390540 m!386449))

(declare-fun m!386451 () Bool)

(assert (=> b!390540 m!386451))

(declare-fun m!386453 () Bool)

(assert (=> b!390540 m!386453))

(declare-fun m!386455 () Bool)

(assert (=> b!390540 m!386455))

(assert (=> b!390540 m!386455))

(declare-fun m!386457 () Bool)

(assert (=> b!390540 m!386457))

(assert (=> b!390540 m!386445))

(declare-fun m!386459 () Bool)

(assert (=> b!390540 m!386459))

(declare-fun m!386461 () Bool)

(assert (=> b!390540 m!386461))

(assert (=> b!390540 m!386413))

(declare-fun m!386463 () Bool)

(assert (=> b!390540 m!386463))

(declare-fun m!386465 () Bool)

(assert (=> b!390540 m!386465))

(assert (=> b!390540 m!386453))

(declare-fun m!386467 () Bool)

(assert (=> b!390540 m!386467))

(declare-fun m!386469 () Bool)

(assert (=> b!390540 m!386469))

(assert (=> b!390540 m!386225))

(declare-fun m!386471 () Bool)

(assert (=> b!390540 m!386471))

(assert (=> b!390540 m!386459))

(declare-fun m!386473 () Bool)

(assert (=> b!390540 m!386473))

(declare-fun m!386475 () Bool)

(assert (=> bm!27547 m!386475))

(assert (=> b!390534 m!386413))

(assert (=> b!390534 m!386413))

(declare-fun m!386477 () Bool)

(assert (=> b!390534 m!386477))

(assert (=> b!390538 m!386415))

(assert (=> b!390538 m!386323))

(assert (=> b!390538 m!386417))

(assert (=> b!390538 m!386413))

(assert (=> b!390538 m!386413))

(declare-fun m!386479 () Bool)

(assert (=> b!390538 m!386479))

(assert (=> b!390538 m!386323))

(assert (=> b!390538 m!386415))

(declare-fun m!386481 () Bool)

(assert (=> b!390551 m!386481))

(assert (=> b!390547 m!386413))

(assert (=> b!390547 m!386413))

(assert (=> b!390547 m!386421))

(assert (=> b!390315 d!72821))

(declare-fun b!390561 () Bool)

(declare-fun e!236561 () Bool)

(declare-fun e!236562 () Bool)

(assert (=> b!390561 (= e!236561 e!236562)))

(declare-fun c!54154 () Bool)

(assert (=> b!390561 (= c!54154 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390562 () Bool)

(declare-fun call!27554 () Bool)

(assert (=> b!390562 (= e!236562 call!27554)))

(declare-fun d!72823 () Bool)

(declare-fun res!223512 () Bool)

(assert (=> d!72823 (=> res!223512 e!236561)))

(assert (=> d!72823 (= res!223512 (bvsge #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(assert (=> d!72823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236561)))

(declare-fun b!390563 () Bool)

(declare-fun e!236560 () Bool)

(assert (=> b!390563 (= e!236560 call!27554)))

(declare-fun bm!27551 () Bool)

(assert (=> bm!27551 (= call!27554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!390564 () Bool)

(assert (=> b!390564 (= e!236562 e!236560)))

(declare-fun lt!184079 () (_ BitVec 64))

(assert (=> b!390564 (= lt!184079 (select (arr!11037 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184078 () Unit!11934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23147 (_ BitVec 64) (_ BitVec 32)) Unit!11934)

(assert (=> b!390564 (= lt!184078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184079 #b00000000000000000000000000000000))))

(assert (=> b!390564 (arrayContainsKey!0 _keys!658 lt!184079 #b00000000000000000000000000000000)))

(declare-fun lt!184077 () Unit!11934)

(assert (=> b!390564 (= lt!184077 lt!184078)))

(declare-fun res!223513 () Bool)

(declare-datatypes ((SeekEntryResult!3508 0))(
  ( (MissingZero!3508 (index!16211 (_ BitVec 32))) (Found!3508 (index!16212 (_ BitVec 32))) (Intermediate!3508 (undefined!4320 Bool) (index!16213 (_ BitVec 32)) (x!38303 (_ BitVec 32))) (Undefined!3508) (MissingVacant!3508 (index!16214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23147 (_ BitVec 32)) SeekEntryResult!3508)

(assert (=> b!390564 (= res!223513 (= (seekEntryOrOpen!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3508 #b00000000000000000000000000000000)))))

(assert (=> b!390564 (=> (not res!223513) (not e!236560))))

(assert (= (and d!72823 (not res!223512)) b!390561))

(assert (= (and b!390561 c!54154) b!390564))

(assert (= (and b!390561 (not c!54154)) b!390562))

(assert (= (and b!390564 res!223513) b!390563))

(assert (= (or b!390563 b!390562) bm!27551))

(assert (=> b!390561 m!386319))

(assert (=> b!390561 m!386319))

(assert (=> b!390561 m!386329))

(declare-fun m!386483 () Bool)

(assert (=> bm!27551 m!386483))

(assert (=> b!390564 m!386319))

(declare-fun m!386485 () Bool)

(assert (=> b!390564 m!386485))

(declare-fun m!386487 () Bool)

(assert (=> b!390564 m!386487))

(assert (=> b!390564 m!386319))

(declare-fun m!386489 () Bool)

(assert (=> b!390564 m!386489))

(assert (=> b!390310 d!72823))

(declare-fun d!72825 () Bool)

(declare-fun res!223520 () Bool)

(declare-fun e!236573 () Bool)

(assert (=> d!72825 (=> res!223520 e!236573)))

(assert (=> d!72825 (= res!223520 (bvsge #b00000000000000000000000000000000 (size!11390 _keys!658)))))

(assert (=> d!72825 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6357) e!236573)))

(declare-fun b!390575 () Bool)

(declare-fun e!236572 () Bool)

(assert (=> b!390575 (= e!236573 e!236572)))

(declare-fun res!223521 () Bool)

(assert (=> b!390575 (=> (not res!223521) (not e!236572))))

(declare-fun e!236571 () Bool)

(assert (=> b!390575 (= res!223521 (not e!236571))))

(declare-fun res!223522 () Bool)

(assert (=> b!390575 (=> (not res!223522) (not e!236571))))

(assert (=> b!390575 (= res!223522 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390576 () Bool)

(declare-fun e!236574 () Bool)

(assert (=> b!390576 (= e!236572 e!236574)))

(declare-fun c!54157 () Bool)

(assert (=> b!390576 (= c!54157 (validKeyInArray!0 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27554 () Bool)

(declare-fun call!27557 () Bool)

(assert (=> bm!27554 (= call!27557 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54157 (Cons!6356 (select (arr!11037 _keys!658) #b00000000000000000000000000000000) Nil!6357) Nil!6357)))))

(declare-fun b!390577 () Bool)

(assert (=> b!390577 (= e!236574 call!27557)))

(declare-fun b!390578 () Bool)

(declare-fun contains!2447 (List!6360 (_ BitVec 64)) Bool)

(assert (=> b!390578 (= e!236571 (contains!2447 Nil!6357 (select (arr!11037 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390579 () Bool)

(assert (=> b!390579 (= e!236574 call!27557)))

(assert (= (and d!72825 (not res!223520)) b!390575))

(assert (= (and b!390575 res!223522) b!390578))

(assert (= (and b!390575 res!223521) b!390576))

(assert (= (and b!390576 c!54157) b!390579))

(assert (= (and b!390576 (not c!54157)) b!390577))

(assert (= (or b!390579 b!390577) bm!27554))

(assert (=> b!390575 m!386319))

(assert (=> b!390575 m!386319))

(assert (=> b!390575 m!386329))

(assert (=> b!390576 m!386319))

(assert (=> b!390576 m!386319))

(assert (=> b!390576 m!386329))

(assert (=> bm!27554 m!386319))

(declare-fun m!386491 () Bool)

(assert (=> bm!27554 m!386491))

(assert (=> b!390578 m!386319))

(assert (=> b!390578 m!386319))

(declare-fun m!386493 () Bool)

(assert (=> b!390578 m!386493))

(assert (=> b!390309 d!72825))

(declare-fun d!72827 () Bool)

(assert (=> d!72827 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390319 d!72827))

(declare-fun d!72829 () Bool)

(declare-fun res!223527 () Bool)

(declare-fun e!236579 () Bool)

(assert (=> d!72829 (=> res!223527 e!236579)))

(assert (=> d!72829 (= res!223527 (= (select (arr!11037 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72829 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236579)))

(declare-fun b!390584 () Bool)

(declare-fun e!236580 () Bool)

(assert (=> b!390584 (= e!236579 e!236580)))

(declare-fun res!223528 () Bool)

(assert (=> b!390584 (=> (not res!223528) (not e!236580))))

(assert (=> b!390584 (= res!223528 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11390 _keys!658)))))

(declare-fun b!390585 () Bool)

(assert (=> b!390585 (= e!236580 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72829 (not res!223527)) b!390584))

(assert (= (and b!390584 res!223528) b!390585))

(assert (=> d!72829 m!386319))

(declare-fun m!386495 () Bool)

(assert (=> b!390585 m!386495))

(assert (=> b!390318 d!72829))

(declare-fun d!72831 () Bool)

(declare-fun e!236581 () Bool)

(assert (=> d!72831 e!236581))

(declare-fun res!223529 () Bool)

(assert (=> d!72831 (=> (not res!223529) (not e!236581))))

(declare-fun lt!184083 () ListLongMap!5417)

(assert (=> d!72831 (= res!223529 (contains!2445 lt!184083 (_1!3268 lt!183879)))))

(declare-fun lt!184081 () List!6359)

(assert (=> d!72831 (= lt!184083 (ListLongMap!5418 lt!184081))))

(declare-fun lt!184082 () Unit!11934)

(declare-fun lt!184080 () Unit!11934)

(assert (=> d!72831 (= lt!184082 lt!184080)))

(assert (=> d!72831 (= (getValueByKey!358 lt!184081 (_1!3268 lt!183879)) (Some!363 (_2!3268 lt!183879)))))

(assert (=> d!72831 (= lt!184080 (lemmaContainsTupThenGetReturnValue!183 lt!184081 (_1!3268 lt!183879) (_2!3268 lt!183879)))))

(assert (=> d!72831 (= lt!184081 (insertStrictlySorted!186 (toList!2724 lt!183877) (_1!3268 lt!183879) (_2!3268 lt!183879)))))

(assert (=> d!72831 (= (+!1044 lt!183877 lt!183879) lt!184083)))

(declare-fun b!390586 () Bool)

(declare-fun res!223530 () Bool)

(assert (=> b!390586 (=> (not res!223530) (not e!236581))))

(assert (=> b!390586 (= res!223530 (= (getValueByKey!358 (toList!2724 lt!184083) (_1!3268 lt!183879)) (Some!363 (_2!3268 lt!183879))))))

(declare-fun b!390587 () Bool)

(assert (=> b!390587 (= e!236581 (contains!2446 (toList!2724 lt!184083) lt!183879))))

(assert (= (and d!72831 res!223529) b!390586))

(assert (= (and b!390586 res!223530) b!390587))

(declare-fun m!386497 () Bool)

(assert (=> d!72831 m!386497))

(declare-fun m!386499 () Bool)

(assert (=> d!72831 m!386499))

(declare-fun m!386501 () Bool)

(assert (=> d!72831 m!386501))

(declare-fun m!386503 () Bool)

(assert (=> d!72831 m!386503))

(declare-fun m!386505 () Bool)

(assert (=> b!390586 m!386505))

(declare-fun m!386507 () Bool)

(assert (=> b!390587 m!386507))

(assert (=> b!390306 d!72831))

(declare-fun d!72833 () Bool)

(declare-fun e!236582 () Bool)

(assert (=> d!72833 e!236582))

(declare-fun res!223531 () Bool)

(assert (=> d!72833 (=> (not res!223531) (not e!236582))))

(declare-fun lt!184087 () ListLongMap!5417)

(assert (=> d!72833 (= res!223531 (contains!2445 lt!184087 (_1!3268 lt!183879)))))

(declare-fun lt!184085 () List!6359)

(assert (=> d!72833 (= lt!184087 (ListLongMap!5418 lt!184085))))

(declare-fun lt!184086 () Unit!11934)

(declare-fun lt!184084 () Unit!11934)

(assert (=> d!72833 (= lt!184086 lt!184084)))

(assert (=> d!72833 (= (getValueByKey!358 lt!184085 (_1!3268 lt!183879)) (Some!363 (_2!3268 lt!183879)))))

(assert (=> d!72833 (= lt!184084 (lemmaContainsTupThenGetReturnValue!183 lt!184085 (_1!3268 lt!183879) (_2!3268 lt!183879)))))

(assert (=> d!72833 (= lt!184085 (insertStrictlySorted!186 (toList!2724 lt!183882) (_1!3268 lt!183879) (_2!3268 lt!183879)))))

(assert (=> d!72833 (= (+!1044 lt!183882 lt!183879) lt!184087)))

(declare-fun b!390588 () Bool)

(declare-fun res!223532 () Bool)

(assert (=> b!390588 (=> (not res!223532) (not e!236582))))

(assert (=> b!390588 (= res!223532 (= (getValueByKey!358 (toList!2724 lt!184087) (_1!3268 lt!183879)) (Some!363 (_2!3268 lt!183879))))))

(declare-fun b!390589 () Bool)

(assert (=> b!390589 (= e!236582 (contains!2446 (toList!2724 lt!184087) lt!183879))))

(assert (= (and d!72833 res!223531) b!390588))

(assert (= (and b!390588 res!223532) b!390589))

(declare-fun m!386509 () Bool)

(assert (=> d!72833 m!386509))

(declare-fun m!386511 () Bool)

(assert (=> d!72833 m!386511))

(declare-fun m!386513 () Bool)

(assert (=> d!72833 m!386513))

(declare-fun m!386515 () Bool)

(assert (=> d!72833 m!386515))

(declare-fun m!386517 () Bool)

(assert (=> b!390588 m!386517))

(declare-fun m!386519 () Bool)

(assert (=> b!390589 m!386519))

(assert (=> b!390306 d!72833))

(declare-fun d!72835 () Bool)

(declare-fun res!223533 () Bool)

(declare-fun e!236585 () Bool)

(assert (=> d!72835 (=> res!223533 e!236585)))

(assert (=> d!72835 (= res!223533 (bvsge #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(assert (=> d!72835 (= (arrayNoDuplicates!0 lt!183883 #b00000000000000000000000000000000 Nil!6357) e!236585)))

(declare-fun b!390590 () Bool)

(declare-fun e!236584 () Bool)

(assert (=> b!390590 (= e!236585 e!236584)))

(declare-fun res!223534 () Bool)

(assert (=> b!390590 (=> (not res!223534) (not e!236584))))

(declare-fun e!236583 () Bool)

(assert (=> b!390590 (= res!223534 (not e!236583))))

(declare-fun res!223535 () Bool)

(assert (=> b!390590 (=> (not res!223535) (not e!236583))))

(assert (=> b!390590 (= res!223535 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun b!390591 () Bool)

(declare-fun e!236586 () Bool)

(assert (=> b!390591 (= e!236584 e!236586)))

(declare-fun c!54158 () Bool)

(assert (=> b!390591 (= c!54158 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun bm!27555 () Bool)

(declare-fun call!27558 () Bool)

(assert (=> bm!27555 (= call!27558 (arrayNoDuplicates!0 lt!183883 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54158 (Cons!6356 (select (arr!11037 lt!183883) #b00000000000000000000000000000000) Nil!6357) Nil!6357)))))

(declare-fun b!390592 () Bool)

(assert (=> b!390592 (= e!236586 call!27558)))

(declare-fun b!390593 () Bool)

(assert (=> b!390593 (= e!236583 (contains!2447 Nil!6357 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun b!390594 () Bool)

(assert (=> b!390594 (= e!236586 call!27558)))

(assert (= (and d!72835 (not res!223533)) b!390590))

(assert (= (and b!390590 res!223535) b!390593))

(assert (= (and b!390590 res!223534) b!390591))

(assert (= (and b!390591 c!54158) b!390594))

(assert (= (and b!390591 (not c!54158)) b!390592))

(assert (= (or b!390594 b!390592) bm!27555))

(assert (=> b!390590 m!386413))

(assert (=> b!390590 m!386413))

(assert (=> b!390590 m!386421))

(assert (=> b!390591 m!386413))

(assert (=> b!390591 m!386413))

(assert (=> b!390591 m!386421))

(assert (=> bm!27555 m!386413))

(declare-fun m!386521 () Bool)

(assert (=> bm!27555 m!386521))

(assert (=> b!390593 m!386413))

(assert (=> b!390593 m!386413))

(declare-fun m!386523 () Bool)

(assert (=> b!390593 m!386523))

(assert (=> b!390316 d!72835))

(declare-fun b!390595 () Bool)

(declare-fun e!236588 () Bool)

(declare-fun e!236589 () Bool)

(assert (=> b!390595 (= e!236588 e!236589)))

(declare-fun c!54159 () Bool)

(assert (=> b!390595 (= c!54159 (validKeyInArray!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000)))))

(declare-fun b!390596 () Bool)

(declare-fun call!27559 () Bool)

(assert (=> b!390596 (= e!236589 call!27559)))

(declare-fun d!72837 () Bool)

(declare-fun res!223536 () Bool)

(assert (=> d!72837 (=> res!223536 e!236588)))

(assert (=> d!72837 (= res!223536 (bvsge #b00000000000000000000000000000000 (size!11390 lt!183883)))))

(assert (=> d!72837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183883 mask!970) e!236588)))

(declare-fun b!390597 () Bool)

(declare-fun e!236587 () Bool)

(assert (=> b!390597 (= e!236587 call!27559)))

(declare-fun bm!27556 () Bool)

(assert (=> bm!27556 (= call!27559 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!183883 mask!970))))

(declare-fun b!390598 () Bool)

(assert (=> b!390598 (= e!236589 e!236587)))

(declare-fun lt!184090 () (_ BitVec 64))

(assert (=> b!390598 (= lt!184090 (select (arr!11037 lt!183883) #b00000000000000000000000000000000))))

(declare-fun lt!184089 () Unit!11934)

(assert (=> b!390598 (= lt!184089 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!183883 lt!184090 #b00000000000000000000000000000000))))

(assert (=> b!390598 (arrayContainsKey!0 lt!183883 lt!184090 #b00000000000000000000000000000000)))

(declare-fun lt!184088 () Unit!11934)

(assert (=> b!390598 (= lt!184088 lt!184089)))

(declare-fun res!223537 () Bool)

(assert (=> b!390598 (= res!223537 (= (seekEntryOrOpen!0 (select (arr!11037 lt!183883) #b00000000000000000000000000000000) lt!183883 mask!970) (Found!3508 #b00000000000000000000000000000000)))))

(assert (=> b!390598 (=> (not res!223537) (not e!236587))))

(assert (= (and d!72837 (not res!223536)) b!390595))

(assert (= (and b!390595 c!54159) b!390598))

(assert (= (and b!390595 (not c!54159)) b!390596))

(assert (= (and b!390598 res!223537) b!390597))

(assert (= (or b!390597 b!390596) bm!27556))

(assert (=> b!390595 m!386413))

(assert (=> b!390595 m!386413))

(assert (=> b!390595 m!386421))

(declare-fun m!386525 () Bool)

(assert (=> bm!27556 m!386525))

(assert (=> b!390598 m!386413))

(declare-fun m!386527 () Bool)

(assert (=> b!390598 m!386527))

(declare-fun m!386529 () Bool)

(assert (=> b!390598 m!386529))

(assert (=> b!390598 m!386413))

(declare-fun m!386531 () Bool)

(assert (=> b!390598 m!386531))

(assert (=> b!390307 d!72837))

(declare-fun mapNonEmpty!16035 () Bool)

(declare-fun mapRes!16035 () Bool)

(declare-fun tp!31659 () Bool)

(declare-fun e!236595 () Bool)

(assert (=> mapNonEmpty!16035 (= mapRes!16035 (and tp!31659 e!236595))))

(declare-fun mapValue!16035 () ValueCell!4472)

(declare-fun mapKey!16035 () (_ BitVec 32))

(declare-fun mapRest!16035 () (Array (_ BitVec 32) ValueCell!4472))

(assert (=> mapNonEmpty!16035 (= mapRest!16026 (store mapRest!16035 mapKey!16035 mapValue!16035))))

(declare-fun b!390605 () Bool)

(assert (=> b!390605 (= e!236595 tp_is_empty!9631)))

(declare-fun condMapEmpty!16035 () Bool)

(declare-fun mapDefault!16035 () ValueCell!4472)

(assert (=> mapNonEmpty!16026 (= condMapEmpty!16035 (= mapRest!16026 ((as const (Array (_ BitVec 32) ValueCell!4472)) mapDefault!16035)))))

(declare-fun e!236594 () Bool)

(assert (=> mapNonEmpty!16026 (= tp!31643 (and e!236594 mapRes!16035))))

(declare-fun mapIsEmpty!16035 () Bool)

(assert (=> mapIsEmpty!16035 mapRes!16035))

(declare-fun b!390606 () Bool)

(assert (=> b!390606 (= e!236594 tp_is_empty!9631)))

(assert (= (and mapNonEmpty!16026 condMapEmpty!16035) mapIsEmpty!16035))

(assert (= (and mapNonEmpty!16026 (not condMapEmpty!16035)) mapNonEmpty!16035))

(assert (= (and mapNonEmpty!16035 ((_ is ValueCellFull!4472) mapValue!16035)) b!390605))

(assert (= (and mapNonEmpty!16026 ((_ is ValueCellFull!4472) mapDefault!16035)) b!390606))

(declare-fun m!386533 () Bool)

(assert (=> mapNonEmpty!16035 m!386533))

(declare-fun b_lambda!8641 () Bool)

(assert (= b_lambda!8639 (or (and start!37954 b_free!8959) b_lambda!8641)))

(declare-fun b_lambda!8643 () Bool)

(assert (= b_lambda!8633 (or (and start!37954 b_free!8959) b_lambda!8643)))

(declare-fun b_lambda!8645 () Bool)

(assert (= b_lambda!8629 (or (and start!37954 b_free!8959) b_lambda!8645)))

(declare-fun b_lambda!8647 () Bool)

(assert (= b_lambda!8637 (or (and start!37954 b_free!8959) b_lambda!8647)))

(declare-fun b_lambda!8649 () Bool)

(assert (= b_lambda!8631 (or (and start!37954 b_free!8959) b_lambda!8649)))

(declare-fun b_lambda!8651 () Bool)

(assert (= b_lambda!8635 (or (and start!37954 b_free!8959) b_lambda!8651)))

(check-sat (not b!390575) (not b!390513) (not bm!27528) (not b!390430) (not b!390503) (not bm!27551) (not mapNonEmpty!16035) (not b_lambda!8643) (not b!390530) (not b!390547) (not bm!27539) (not bm!27542) (not b!390538) (not b!390500) (not b!390436) (not b!390496) (not b!390546) (not bm!27530) (not d!72813) (not b!390492) (not d!72817) (not d!72831) (not bm!27541) (not b!390529) (not b!390586) (not b!390598) (not b_lambda!8647) (not b!390593) (not bm!27533) (not b!390519) (not b!390431) (not b!390437) (not b!390578) (not b!390531) (not b!390561) (not b_lambda!8641) (not bm!27540) (not b!390438) (not b!390595) (not b!390544) (not bm!27554) (not b!390524) (not b!390523) (not b!390588) (not d!72821) (not b!390499) b_and!16251 (not b!390528) (not b!390432) (not b_lambda!8645) (not d!72833) (not b!390587) (not b!390590) (not d!72811) (not bm!27513) (not b_lambda!8651) (not b!390585) (not d!72819) (not b!390551) (not bm!27534) (not bm!27548) (not d!72815) (not b!390576) (not b!390490) (not b!390548) (not b!390518) (not b!390527) (not b_next!8959) (not b_lambda!8649) (not b!390564) tp_is_empty!9631 (not bm!27556) (not bm!27555) (not b!390540) (not b!390486) (not b!390522) (not b!390534) (not b!390589) (not b!390435) (not b!390591) (not b!390498) (not bm!27547) (not bm!27544) (not b!390439))
(check-sat b_and!16251 (not b_next!8959))
