; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35042 () Bool)

(assert start!35042)

(declare-fun b_free!7731 () Bool)

(declare-fun b_next!7731 () Bool)

(assert (=> start!35042 (= b_free!7731 (not b_next!7731))))

(declare-fun tp!26771 () Bool)

(declare-fun b_and!14961 () Bool)

(assert (=> start!35042 (= tp!26771 b_and!14961)))

(declare-fun b!351305 () Bool)

(declare-fun res!194830 () Bool)

(declare-fun e!215134 () Bool)

(assert (=> b!351305 (=> (not res!194830) (not e!215134))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11221 0))(
  ( (V!11222 (val!3886 Int)) )
))
(declare-datatypes ((ValueCell!3498 0))(
  ( (ValueCellFull!3498 (v!6073 V!11221)) (EmptyCell!3498) )
))
(declare-datatypes ((array!18953 0))(
  ( (array!18954 (arr!8982 (Array (_ BitVec 32) ValueCell!3498)) (size!9334 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18953)

(declare-datatypes ((array!18955 0))(
  ( (array!18956 (arr!8983 (Array (_ BitVec 32) (_ BitVec 64))) (size!9335 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18955)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351305 (= res!194830 (and (= (size!9334 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9335 _keys!1895) (size!9334 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351306 () Bool)

(declare-fun res!194832 () Bool)

(assert (=> b!351306 (=> (not res!194832) (not e!215134))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11221)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11221)

(declare-datatypes ((tuple2!5604 0))(
  ( (tuple2!5605 (_1!2813 (_ BitVec 64)) (_2!2813 V!11221)) )
))
(declare-datatypes ((List!5224 0))(
  ( (Nil!5221) (Cons!5220 (h!6076 tuple2!5604) (t!10362 List!5224)) )
))
(declare-datatypes ((ListLongMap!4517 0))(
  ( (ListLongMap!4518 (toList!2274 List!5224)) )
))
(declare-fun contains!2343 (ListLongMap!4517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1795 (array!18955 array!18953 (_ BitVec 32) (_ BitVec 32) V!11221 V!11221 (_ BitVec 32) Int) ListLongMap!4517)

(assert (=> b!351306 (= res!194832 (not (contains!2343 (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12996 () Bool)

(declare-fun mapRes!12996 () Bool)

(declare-fun tp!26772 () Bool)

(declare-fun e!215133 () Bool)

(assert (=> mapNonEmpty!12996 (= mapRes!12996 (and tp!26772 e!215133))))

(declare-fun mapValue!12996 () ValueCell!3498)

(declare-fun mapKey!12996 () (_ BitVec 32))

(declare-fun mapRest!12996 () (Array (_ BitVec 32) ValueCell!3498))

(assert (=> mapNonEmpty!12996 (= (arr!8982 _values!1525) (store mapRest!12996 mapKey!12996 mapValue!12996))))

(declare-fun res!194827 () Bool)

(assert (=> start!35042 (=> (not res!194827) (not e!215134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35042 (= res!194827 (validMask!0 mask!2385))))

(assert (=> start!35042 e!215134))

(assert (=> start!35042 true))

(declare-fun tp_is_empty!7683 () Bool)

(assert (=> start!35042 tp_is_empty!7683))

(assert (=> start!35042 tp!26771))

(declare-fun e!215137 () Bool)

(declare-fun array_inv!6628 (array!18953) Bool)

(assert (=> start!35042 (and (array_inv!6628 _values!1525) e!215137)))

(declare-fun array_inv!6629 (array!18955) Bool)

(assert (=> start!35042 (array_inv!6629 _keys!1895)))

(declare-fun b!351307 () Bool)

(declare-fun res!194825 () Bool)

(assert (=> b!351307 (=> (not res!194825) (not e!215134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351307 (= res!194825 (validKeyInArray!0 k0!1348))))

(declare-fun b!351308 () Bool)

(declare-fun e!215132 () Bool)

(declare-fun lt!164739 () (_ BitVec 32))

(assert (=> b!351308 (= e!215132 (or (bvslt lt!164739 #b00000000000000000000000000000000) (bvsge lt!164739 (size!9335 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18955 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351308 (= lt!164739 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351309 () Bool)

(declare-fun res!194829 () Bool)

(assert (=> b!351309 (=> (not res!194829) (not e!215134))))

(declare-datatypes ((List!5225 0))(
  ( (Nil!5222) (Cons!5221 (h!6077 (_ BitVec 64)) (t!10363 List!5225)) )
))
(declare-fun arrayNoDuplicates!0 (array!18955 (_ BitVec 32) List!5225) Bool)

(assert (=> b!351309 (= res!194829 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5222))))

(declare-fun b!351310 () Bool)

(assert (=> b!351310 (= e!215134 e!215132)))

(declare-fun res!194826 () Bool)

(assert (=> b!351310 (=> (not res!194826) (not e!215132))))

(declare-datatypes ((SeekEntryResult!3455 0))(
  ( (MissingZero!3455 (index!15999 (_ BitVec 32))) (Found!3455 (index!16000 (_ BitVec 32))) (Intermediate!3455 (undefined!4267 Bool) (index!16001 (_ BitVec 32)) (x!34967 (_ BitVec 32))) (Undefined!3455) (MissingVacant!3455 (index!16002 (_ BitVec 32))) )
))
(declare-fun lt!164740 () SeekEntryResult!3455)

(get-info :version)

(assert (=> b!351310 (= res!194826 (and (not ((_ is Found!3455) lt!164740)) (not ((_ is MissingZero!3455) lt!164740)) ((_ is MissingVacant!3455) lt!164740)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18955 (_ BitVec 32)) SeekEntryResult!3455)

(assert (=> b!351310 (= lt!164740 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351311 () Bool)

(declare-fun e!215136 () Bool)

(assert (=> b!351311 (= e!215136 tp_is_empty!7683)))

(declare-fun mapIsEmpty!12996 () Bool)

(assert (=> mapIsEmpty!12996 mapRes!12996))

(declare-fun b!351312 () Bool)

(assert (=> b!351312 (= e!215137 (and e!215136 mapRes!12996))))

(declare-fun condMapEmpty!12996 () Bool)

(declare-fun mapDefault!12996 () ValueCell!3498)

(assert (=> b!351312 (= condMapEmpty!12996 (= (arr!8982 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3498)) mapDefault!12996)))))

(declare-fun b!351313 () Bool)

(declare-fun res!194831 () Bool)

(assert (=> b!351313 (=> (not res!194831) (not e!215132))))

(declare-fun arrayContainsKey!0 (array!18955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351313 (= res!194831 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351314 () Bool)

(assert (=> b!351314 (= e!215133 tp_is_empty!7683)))

(declare-fun b!351315 () Bool)

(declare-fun res!194828 () Bool)

(assert (=> b!351315 (=> (not res!194828) (not e!215134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18955 (_ BitVec 32)) Bool)

(assert (=> b!351315 (= res!194828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!35042 res!194827) b!351305))

(assert (= (and b!351305 res!194830) b!351315))

(assert (= (and b!351315 res!194828) b!351309))

(assert (= (and b!351309 res!194829) b!351307))

(assert (= (and b!351307 res!194825) b!351306))

(assert (= (and b!351306 res!194832) b!351310))

(assert (= (and b!351310 res!194826) b!351313))

(assert (= (and b!351313 res!194831) b!351308))

(assert (= (and b!351312 condMapEmpty!12996) mapIsEmpty!12996))

(assert (= (and b!351312 (not condMapEmpty!12996)) mapNonEmpty!12996))

(assert (= (and mapNonEmpty!12996 ((_ is ValueCellFull!3498) mapValue!12996)) b!351314))

(assert (= (and b!351312 ((_ is ValueCellFull!3498) mapDefault!12996)) b!351311))

(assert (= start!35042 b!351312))

(declare-fun m!351265 () Bool)

(assert (=> b!351309 m!351265))

(declare-fun m!351267 () Bool)

(assert (=> b!351315 m!351267))

(declare-fun m!351269 () Bool)

(assert (=> b!351308 m!351269))

(declare-fun m!351271 () Bool)

(assert (=> start!35042 m!351271))

(declare-fun m!351273 () Bool)

(assert (=> start!35042 m!351273))

(declare-fun m!351275 () Bool)

(assert (=> start!35042 m!351275))

(declare-fun m!351277 () Bool)

(assert (=> b!351307 m!351277))

(declare-fun m!351279 () Bool)

(assert (=> mapNonEmpty!12996 m!351279))

(declare-fun m!351281 () Bool)

(assert (=> b!351306 m!351281))

(assert (=> b!351306 m!351281))

(declare-fun m!351283 () Bool)

(assert (=> b!351306 m!351283))

(declare-fun m!351285 () Bool)

(assert (=> b!351313 m!351285))

(declare-fun m!351287 () Bool)

(assert (=> b!351310 m!351287))

(check-sat (not b!351309) (not b!351306) (not b!351310) (not mapNonEmpty!12996) (not b!351313) (not b_next!7731) tp_is_empty!7683 (not start!35042) (not b!351315) b_and!14961 (not b!351307) (not b!351308))
(check-sat b_and!14961 (not b_next!7731))
(get-model)

(declare-fun d!71449 () Bool)

(assert (=> d!71449 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35042 d!71449))

(declare-fun d!71451 () Bool)

(assert (=> d!71451 (= (array_inv!6628 _values!1525) (bvsge (size!9334 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35042 d!71451))

(declare-fun d!71453 () Bool)

(assert (=> d!71453 (= (array_inv!6629 _keys!1895) (bvsge (size!9335 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35042 d!71453))

(declare-fun d!71455 () Bool)

(declare-fun res!194865 () Bool)

(declare-fun e!215164 () Bool)

(assert (=> d!71455 (=> res!194865 e!215164)))

(assert (=> d!71455 (= res!194865 (bvsge #b00000000000000000000000000000000 (size!9335 _keys!1895)))))

(assert (=> d!71455 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5222) e!215164)))

(declare-fun b!351359 () Bool)

(declare-fun e!215165 () Bool)

(declare-fun contains!2344 (List!5225 (_ BitVec 64)) Bool)

(assert (=> b!351359 (= e!215165 (contains!2344 Nil!5222 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351360 () Bool)

(declare-fun e!215167 () Bool)

(assert (=> b!351360 (= e!215164 e!215167)))

(declare-fun res!194863 () Bool)

(assert (=> b!351360 (=> (not res!194863) (not e!215167))))

(assert (=> b!351360 (= res!194863 (not e!215165))))

(declare-fun res!194864 () Bool)

(assert (=> b!351360 (=> (not res!194864) (not e!215165))))

(assert (=> b!351360 (= res!194864 (validKeyInArray!0 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351361 () Bool)

(declare-fun e!215166 () Bool)

(assert (=> b!351361 (= e!215167 e!215166)))

(declare-fun c!53421 () Bool)

(assert (=> b!351361 (= c!53421 (validKeyInArray!0 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351362 () Bool)

(declare-fun call!26983 () Bool)

(assert (=> b!351362 (= e!215166 call!26983)))

(declare-fun bm!26980 () Bool)

(assert (=> bm!26980 (= call!26983 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53421 (Cons!5221 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000) Nil!5222) Nil!5222)))))

(declare-fun b!351363 () Bool)

(assert (=> b!351363 (= e!215166 call!26983)))

(assert (= (and d!71455 (not res!194865)) b!351360))

(assert (= (and b!351360 res!194864) b!351359))

(assert (= (and b!351360 res!194863) b!351361))

(assert (= (and b!351361 c!53421) b!351363))

(assert (= (and b!351361 (not c!53421)) b!351362))

(assert (= (or b!351363 b!351362) bm!26980))

(declare-fun m!351313 () Bool)

(assert (=> b!351359 m!351313))

(assert (=> b!351359 m!351313))

(declare-fun m!351315 () Bool)

(assert (=> b!351359 m!351315))

(assert (=> b!351360 m!351313))

(assert (=> b!351360 m!351313))

(declare-fun m!351317 () Bool)

(assert (=> b!351360 m!351317))

(assert (=> b!351361 m!351313))

(assert (=> b!351361 m!351313))

(assert (=> b!351361 m!351317))

(assert (=> bm!26980 m!351313))

(declare-fun m!351319 () Bool)

(assert (=> bm!26980 m!351319))

(assert (=> b!351309 d!71455))

(declare-fun b!351376 () Bool)

(declare-fun e!215176 () SeekEntryResult!3455)

(declare-fun lt!164753 () SeekEntryResult!3455)

(assert (=> b!351376 (= e!215176 (Found!3455 (index!16001 lt!164753)))))

(declare-fun b!351377 () Bool)

(declare-fun e!215175 () SeekEntryResult!3455)

(assert (=> b!351377 (= e!215175 (MissingZero!3455 (index!16001 lt!164753)))))

(declare-fun b!351378 () Bool)

(declare-fun c!53428 () Bool)

(declare-fun lt!164755 () (_ BitVec 64))

(assert (=> b!351378 (= c!53428 (= lt!164755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!351378 (= e!215176 e!215175)))

(declare-fun d!71457 () Bool)

(declare-fun lt!164754 () SeekEntryResult!3455)

(assert (=> d!71457 (and (or ((_ is Undefined!3455) lt!164754) (not ((_ is Found!3455) lt!164754)) (and (bvsge (index!16000 lt!164754) #b00000000000000000000000000000000) (bvslt (index!16000 lt!164754) (size!9335 _keys!1895)))) (or ((_ is Undefined!3455) lt!164754) ((_ is Found!3455) lt!164754) (not ((_ is MissingZero!3455) lt!164754)) (and (bvsge (index!15999 lt!164754) #b00000000000000000000000000000000) (bvslt (index!15999 lt!164754) (size!9335 _keys!1895)))) (or ((_ is Undefined!3455) lt!164754) ((_ is Found!3455) lt!164754) ((_ is MissingZero!3455) lt!164754) (not ((_ is MissingVacant!3455) lt!164754)) (and (bvsge (index!16002 lt!164754) #b00000000000000000000000000000000) (bvslt (index!16002 lt!164754) (size!9335 _keys!1895)))) (or ((_ is Undefined!3455) lt!164754) (ite ((_ is Found!3455) lt!164754) (= (select (arr!8983 _keys!1895) (index!16000 lt!164754)) k0!1348) (ite ((_ is MissingZero!3455) lt!164754) (= (select (arr!8983 _keys!1895) (index!15999 lt!164754)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3455) lt!164754) (= (select (arr!8983 _keys!1895) (index!16002 lt!164754)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!215174 () SeekEntryResult!3455)

(assert (=> d!71457 (= lt!164754 e!215174)))

(declare-fun c!53430 () Bool)

(assert (=> d!71457 (= c!53430 (and ((_ is Intermediate!3455) lt!164753) (undefined!4267 lt!164753)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18955 (_ BitVec 32)) SeekEntryResult!3455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71457 (= lt!164753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71457 (validMask!0 mask!2385)))

(assert (=> d!71457 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164754)))

(declare-fun b!351379 () Bool)

(assert (=> b!351379 (= e!215174 e!215176)))

(assert (=> b!351379 (= lt!164755 (select (arr!8983 _keys!1895) (index!16001 lt!164753)))))

(declare-fun c!53429 () Bool)

(assert (=> b!351379 (= c!53429 (= lt!164755 k0!1348))))

(declare-fun b!351380 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18955 (_ BitVec 32)) SeekEntryResult!3455)

(assert (=> b!351380 (= e!215175 (seekKeyOrZeroReturnVacant!0 (x!34967 lt!164753) (index!16001 lt!164753) (index!16001 lt!164753) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351381 () Bool)

(assert (=> b!351381 (= e!215174 Undefined!3455)))

(assert (= (and d!71457 c!53430) b!351381))

(assert (= (and d!71457 (not c!53430)) b!351379))

(assert (= (and b!351379 c!53429) b!351376))

(assert (= (and b!351379 (not c!53429)) b!351378))

(assert (= (and b!351378 c!53428) b!351377))

(assert (= (and b!351378 (not c!53428)) b!351380))

(declare-fun m!351321 () Bool)

(assert (=> d!71457 m!351321))

(declare-fun m!351323 () Bool)

(assert (=> d!71457 m!351323))

(declare-fun m!351325 () Bool)

(assert (=> d!71457 m!351325))

(assert (=> d!71457 m!351271))

(declare-fun m!351327 () Bool)

(assert (=> d!71457 m!351327))

(declare-fun m!351329 () Bool)

(assert (=> d!71457 m!351329))

(assert (=> d!71457 m!351327))

(declare-fun m!351331 () Bool)

(assert (=> b!351379 m!351331))

(declare-fun m!351333 () Bool)

(assert (=> b!351380 m!351333))

(assert (=> b!351310 d!71457))

(declare-fun d!71459 () Bool)

(declare-fun lt!164758 () (_ BitVec 32))

(assert (=> d!71459 (and (or (bvslt lt!164758 #b00000000000000000000000000000000) (bvsge lt!164758 (size!9335 _keys!1895)) (and (bvsge lt!164758 #b00000000000000000000000000000000) (bvslt lt!164758 (size!9335 _keys!1895)))) (bvsge lt!164758 #b00000000000000000000000000000000) (bvslt lt!164758 (size!9335 _keys!1895)) (= (select (arr!8983 _keys!1895) lt!164758) k0!1348))))

(declare-fun e!215179 () (_ BitVec 32))

(assert (=> d!71459 (= lt!164758 e!215179)))

(declare-fun c!53433 () Bool)

(assert (=> d!71459 (= c!53433 (= (select (arr!8983 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9335 _keys!1895)) (bvslt (size!9335 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71459 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164758)))

(declare-fun b!351386 () Bool)

(assert (=> b!351386 (= e!215179 #b00000000000000000000000000000000)))

(declare-fun b!351387 () Bool)

(assert (=> b!351387 (= e!215179 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71459 c!53433) b!351386))

(assert (= (and d!71459 (not c!53433)) b!351387))

(declare-fun m!351335 () Bool)

(assert (=> d!71459 m!351335))

(assert (=> d!71459 m!351313))

(declare-fun m!351337 () Bool)

(assert (=> b!351387 m!351337))

(assert (=> b!351308 d!71459))

(declare-fun d!71461 () Bool)

(declare-fun res!194870 () Bool)

(declare-fun e!215184 () Bool)

(assert (=> d!71461 (=> res!194870 e!215184)))

(assert (=> d!71461 (= res!194870 (= (select (arr!8983 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71461 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215184)))

(declare-fun b!351392 () Bool)

(declare-fun e!215185 () Bool)

(assert (=> b!351392 (= e!215184 e!215185)))

(declare-fun res!194871 () Bool)

(assert (=> b!351392 (=> (not res!194871) (not e!215185))))

(assert (=> b!351392 (= res!194871 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9335 _keys!1895)))))

(declare-fun b!351393 () Bool)

(assert (=> b!351393 (= e!215185 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71461 (not res!194870)) b!351392))

(assert (= (and b!351392 res!194871) b!351393))

(assert (=> d!71461 m!351313))

(declare-fun m!351339 () Bool)

(assert (=> b!351393 m!351339))

(assert (=> b!351313 d!71461))

(declare-fun d!71463 () Bool)

(assert (=> d!71463 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351307 d!71463))

(declare-fun b!351402 () Bool)

(declare-fun e!215193 () Bool)

(declare-fun call!26986 () Bool)

(assert (=> b!351402 (= e!215193 call!26986)))

(declare-fun bm!26983 () Bool)

(assert (=> bm!26983 (= call!26986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71465 () Bool)

(declare-fun res!194877 () Bool)

(declare-fun e!215194 () Bool)

(assert (=> d!71465 (=> res!194877 e!215194)))

(assert (=> d!71465 (= res!194877 (bvsge #b00000000000000000000000000000000 (size!9335 _keys!1895)))))

(assert (=> d!71465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215194)))

(declare-fun b!351403 () Bool)

(declare-fun e!215192 () Bool)

(assert (=> b!351403 (= e!215192 call!26986)))

(declare-fun b!351404 () Bool)

(assert (=> b!351404 (= e!215193 e!215192)))

(declare-fun lt!164765 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164765 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10860 0))(
  ( (Unit!10861) )
))
(declare-fun lt!164766 () Unit!10860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18955 (_ BitVec 64) (_ BitVec 32)) Unit!10860)

(assert (=> b!351404 (= lt!164766 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164765 #b00000000000000000000000000000000))))

(assert (=> b!351404 (arrayContainsKey!0 _keys!1895 lt!164765 #b00000000000000000000000000000000)))

(declare-fun lt!164767 () Unit!10860)

(assert (=> b!351404 (= lt!164767 lt!164766)))

(declare-fun res!194876 () Bool)

(assert (=> b!351404 (= res!194876 (= (seekEntryOrOpen!0 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3455 #b00000000000000000000000000000000)))))

(assert (=> b!351404 (=> (not res!194876) (not e!215192))))

(declare-fun b!351405 () Bool)

(assert (=> b!351405 (= e!215194 e!215193)))

(declare-fun c!53436 () Bool)

(assert (=> b!351405 (= c!53436 (validKeyInArray!0 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71465 (not res!194877)) b!351405))

(assert (= (and b!351405 c!53436) b!351404))

(assert (= (and b!351405 (not c!53436)) b!351402))

(assert (= (and b!351404 res!194876) b!351403))

(assert (= (or b!351403 b!351402) bm!26983))

(declare-fun m!351341 () Bool)

(assert (=> bm!26983 m!351341))

(assert (=> b!351404 m!351313))

(declare-fun m!351343 () Bool)

(assert (=> b!351404 m!351343))

(declare-fun m!351345 () Bool)

(assert (=> b!351404 m!351345))

(assert (=> b!351404 m!351313))

(declare-fun m!351347 () Bool)

(assert (=> b!351404 m!351347))

(assert (=> b!351405 m!351313))

(assert (=> b!351405 m!351313))

(assert (=> b!351405 m!351317))

(assert (=> b!351315 d!71465))

(declare-fun d!71467 () Bool)

(declare-fun e!215199 () Bool)

(assert (=> d!71467 e!215199))

(declare-fun res!194880 () Bool)

(assert (=> d!71467 (=> res!194880 e!215199)))

(declare-fun lt!164776 () Bool)

(assert (=> d!71467 (= res!194880 (not lt!164776))))

(declare-fun lt!164779 () Bool)

(assert (=> d!71467 (= lt!164776 lt!164779)))

(declare-fun lt!164778 () Unit!10860)

(declare-fun e!215200 () Unit!10860)

(assert (=> d!71467 (= lt!164778 e!215200)))

(declare-fun c!53439 () Bool)

(assert (=> d!71467 (= c!53439 lt!164779)))

(declare-fun containsKey!341 (List!5224 (_ BitVec 64)) Bool)

(assert (=> d!71467 (= lt!164779 (containsKey!341 (toList!2274 (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71467 (= (contains!2343 (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164776)))

(declare-fun b!351412 () Bool)

(declare-fun lt!164777 () Unit!10860)

(assert (=> b!351412 (= e!215200 lt!164777)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!289 (List!5224 (_ BitVec 64)) Unit!10860)

(assert (=> b!351412 (= lt!164777 (lemmaContainsKeyImpliesGetValueByKeyDefined!289 (toList!2274 (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!355 0))(
  ( (Some!354 (v!6075 V!11221)) (None!353) )
))
(declare-fun isDefined!290 (Option!355) Bool)

(declare-fun getValueByKey!349 (List!5224 (_ BitVec 64)) Option!355)

(assert (=> b!351412 (isDefined!290 (getValueByKey!349 (toList!2274 (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351413 () Bool)

(declare-fun Unit!10862 () Unit!10860)

(assert (=> b!351413 (= e!215200 Unit!10862)))

(declare-fun b!351414 () Bool)

(assert (=> b!351414 (= e!215199 (isDefined!290 (getValueByKey!349 (toList!2274 (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71467 c!53439) b!351412))

(assert (= (and d!71467 (not c!53439)) b!351413))

(assert (= (and d!71467 (not res!194880)) b!351414))

(declare-fun m!351349 () Bool)

(assert (=> d!71467 m!351349))

(declare-fun m!351351 () Bool)

(assert (=> b!351412 m!351351))

(declare-fun m!351353 () Bool)

(assert (=> b!351412 m!351353))

(assert (=> b!351412 m!351353))

(declare-fun m!351355 () Bool)

(assert (=> b!351412 m!351355))

(assert (=> b!351414 m!351353))

(assert (=> b!351414 m!351353))

(assert (=> b!351414 m!351355))

(assert (=> b!351306 d!71467))

(declare-fun call!27002 () ListLongMap!4517)

(declare-fun call!27003 () ListLongMap!4517)

(declare-fun c!53454 () Bool)

(declare-fun c!53457 () Bool)

(declare-fun call!27004 () ListLongMap!4517)

(declare-fun bm!26998 () Bool)

(declare-fun call!27005 () ListLongMap!4517)

(declare-fun +!740 (ListLongMap!4517 tuple2!5604) ListLongMap!4517)

(assert (=> bm!26998 (= call!27002 (+!740 (ite c!53454 call!27005 (ite c!53457 call!27004 call!27003)) (ite (or c!53454 c!53457) (tuple2!5605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!351457 () Bool)

(declare-fun e!215230 () Bool)

(declare-fun e!215239 () Bool)

(assert (=> b!351457 (= e!215230 e!215239)))

(declare-fun res!194904 () Bool)

(declare-fun call!27006 () Bool)

(assert (=> b!351457 (= res!194904 call!27006)))

(assert (=> b!351457 (=> (not res!194904) (not e!215239))))

(declare-fun lt!164836 () ListLongMap!4517)

(declare-fun b!351458 () Bool)

(declare-fun e!215229 () Bool)

(declare-fun apply!291 (ListLongMap!4517 (_ BitVec 64)) V!11221)

(declare-fun get!4797 (ValueCell!3498 V!11221) V!11221)

(declare-fun dynLambda!634 (Int (_ BitVec 64)) V!11221)

(assert (=> b!351458 (= e!215229 (= (apply!291 lt!164836 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)) (get!4797 (select (arr!8982 _values!1525) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9334 _values!1525)))))

(assert (=> b!351458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9335 _keys!1895)))))

(declare-fun b!351459 () Bool)

(declare-fun e!215237 () Unit!10860)

(declare-fun lt!164828 () Unit!10860)

(assert (=> b!351459 (= e!215237 lt!164828)))

(declare-fun lt!164830 () ListLongMap!4517)

(declare-fun getCurrentListMapNoExtraKeys!613 (array!18955 array!18953 (_ BitVec 32) (_ BitVec 32) V!11221 V!11221 (_ BitVec 32) Int) ListLongMap!4517)

(assert (=> b!351459 (= lt!164830 (getCurrentListMapNoExtraKeys!613 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164824 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164845 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164845 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164839 () Unit!10860)

(declare-fun addStillContains!267 (ListLongMap!4517 (_ BitVec 64) V!11221 (_ BitVec 64)) Unit!10860)

(assert (=> b!351459 (= lt!164839 (addStillContains!267 lt!164830 lt!164824 zeroValue!1467 lt!164845))))

(assert (=> b!351459 (contains!2343 (+!740 lt!164830 (tuple2!5605 lt!164824 zeroValue!1467)) lt!164845)))

(declare-fun lt!164825 () Unit!10860)

(assert (=> b!351459 (= lt!164825 lt!164839)))

(declare-fun lt!164827 () ListLongMap!4517)

(assert (=> b!351459 (= lt!164827 (getCurrentListMapNoExtraKeys!613 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164831 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164841 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164841 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164838 () Unit!10860)

(declare-fun addApplyDifferent!267 (ListLongMap!4517 (_ BitVec 64) V!11221 (_ BitVec 64)) Unit!10860)

(assert (=> b!351459 (= lt!164838 (addApplyDifferent!267 lt!164827 lt!164831 minValue!1467 lt!164841))))

(assert (=> b!351459 (= (apply!291 (+!740 lt!164827 (tuple2!5605 lt!164831 minValue!1467)) lt!164841) (apply!291 lt!164827 lt!164841))))

(declare-fun lt!164837 () Unit!10860)

(assert (=> b!351459 (= lt!164837 lt!164838)))

(declare-fun lt!164840 () ListLongMap!4517)

(assert (=> b!351459 (= lt!164840 (getCurrentListMapNoExtraKeys!613 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164826 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164834 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164834 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164842 () Unit!10860)

(assert (=> b!351459 (= lt!164842 (addApplyDifferent!267 lt!164840 lt!164826 zeroValue!1467 lt!164834))))

(assert (=> b!351459 (= (apply!291 (+!740 lt!164840 (tuple2!5605 lt!164826 zeroValue!1467)) lt!164834) (apply!291 lt!164840 lt!164834))))

(declare-fun lt!164844 () Unit!10860)

(assert (=> b!351459 (= lt!164844 lt!164842)))

(declare-fun lt!164833 () ListLongMap!4517)

(assert (=> b!351459 (= lt!164833 (getCurrentListMapNoExtraKeys!613 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164835 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164829 () (_ BitVec 64))

(assert (=> b!351459 (= lt!164829 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!351459 (= lt!164828 (addApplyDifferent!267 lt!164833 lt!164835 minValue!1467 lt!164829))))

(assert (=> b!351459 (= (apply!291 (+!740 lt!164833 (tuple2!5605 lt!164835 minValue!1467)) lt!164829) (apply!291 lt!164833 lt!164829))))

(declare-fun b!351460 () Bool)

(declare-fun e!215227 () ListLongMap!4517)

(declare-fun call!27001 () ListLongMap!4517)

(assert (=> b!351460 (= e!215227 call!27001)))

(declare-fun b!351461 () Bool)

(declare-fun e!215228 () Bool)

(assert (=> b!351461 (= e!215228 e!215230)))

(declare-fun c!53455 () Bool)

(assert (=> b!351461 (= c!53455 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26999 () Bool)

(declare-fun call!27007 () Bool)

(assert (=> bm!26999 (= call!27007 (contains!2343 lt!164836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351462 () Bool)

(declare-fun e!215236 () Bool)

(assert (=> b!351462 (= e!215236 (validKeyInArray!0 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351463 () Bool)

(declare-fun e!215235 () ListLongMap!4517)

(declare-fun e!215238 () ListLongMap!4517)

(assert (=> b!351463 (= e!215235 e!215238)))

(assert (=> b!351463 (= c!53457 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!71469 () Bool)

(assert (=> d!71469 e!215228))

(declare-fun res!194906 () Bool)

(assert (=> d!71469 (=> (not res!194906) (not e!215228))))

(assert (=> d!71469 (= res!194906 (or (bvsge #b00000000000000000000000000000000 (size!9335 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9335 _keys!1895)))))))

(declare-fun lt!164832 () ListLongMap!4517)

(assert (=> d!71469 (= lt!164836 lt!164832)))

(declare-fun lt!164843 () Unit!10860)

(assert (=> d!71469 (= lt!164843 e!215237)))

(declare-fun c!53452 () Bool)

(declare-fun e!215231 () Bool)

(assert (=> d!71469 (= c!53452 e!215231)))

(declare-fun res!194901 () Bool)

(assert (=> d!71469 (=> (not res!194901) (not e!215231))))

(assert (=> d!71469 (= res!194901 (bvslt #b00000000000000000000000000000000 (size!9335 _keys!1895)))))

(assert (=> d!71469 (= lt!164832 e!215235)))

(assert (=> d!71469 (= c!53454 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71469 (validMask!0 mask!2385)))

(assert (=> d!71469 (= (getCurrentListMap!1795 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164836)))

(declare-fun b!351464 () Bool)

(declare-fun e!215233 () Bool)

(assert (=> b!351464 (= e!215233 (not call!27007))))

(declare-fun b!351465 () Bool)

(declare-fun c!53453 () Bool)

(assert (=> b!351465 (= c!53453 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!351465 (= e!215238 e!215227)))

(declare-fun b!351466 () Bool)

(assert (=> b!351466 (= e!215238 call!27001)))

(declare-fun b!351467 () Bool)

(declare-fun e!215234 () Bool)

(assert (=> b!351467 (= e!215234 (= (apply!291 lt!164836 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!27000 () Bool)

(assert (=> bm!27000 (= call!27001 call!27002)))

(declare-fun b!351468 () Bool)

(declare-fun res!194900 () Bool)

(assert (=> b!351468 (=> (not res!194900) (not e!215228))))

(declare-fun e!215232 () Bool)

(assert (=> b!351468 (= res!194900 e!215232)))

(declare-fun res!194907 () Bool)

(assert (=> b!351468 (=> res!194907 e!215232)))

(assert (=> b!351468 (= res!194907 (not e!215236))))

(declare-fun res!194905 () Bool)

(assert (=> b!351468 (=> (not res!194905) (not e!215236))))

(assert (=> b!351468 (= res!194905 (bvslt #b00000000000000000000000000000000 (size!9335 _keys!1895)))))

(declare-fun bm!27001 () Bool)

(assert (=> bm!27001 (= call!27006 (contains!2343 lt!164836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351469 () Bool)

(assert (=> b!351469 (= e!215239 (= (apply!291 lt!164836 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!27002 () Bool)

(assert (=> bm!27002 (= call!27004 call!27005)))

(declare-fun b!351470 () Bool)

(assert (=> b!351470 (= e!215227 call!27003)))

(declare-fun b!351471 () Bool)

(assert (=> b!351471 (= e!215235 (+!740 call!27002 (tuple2!5605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!27003 () Bool)

(assert (=> bm!27003 (= call!27005 (getCurrentListMapNoExtraKeys!613 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!351472 () Bool)

(assert (=> b!351472 (= e!215232 e!215229)))

(declare-fun res!194899 () Bool)

(assert (=> b!351472 (=> (not res!194899) (not e!215229))))

(assert (=> b!351472 (= res!194899 (contains!2343 lt!164836 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9335 _keys!1895)))))

(declare-fun b!351473 () Bool)

(assert (=> b!351473 (= e!215230 (not call!27006))))

(declare-fun b!351474 () Bool)

(assert (=> b!351474 (= e!215233 e!215234)))

(declare-fun res!194903 () Bool)

(assert (=> b!351474 (= res!194903 call!27007)))

(assert (=> b!351474 (=> (not res!194903) (not e!215234))))

(declare-fun b!351475 () Bool)

(declare-fun Unit!10863 () Unit!10860)

(assert (=> b!351475 (= e!215237 Unit!10863)))

(declare-fun bm!27004 () Bool)

(assert (=> bm!27004 (= call!27003 call!27004)))

(declare-fun b!351476 () Bool)

(declare-fun res!194902 () Bool)

(assert (=> b!351476 (=> (not res!194902) (not e!215228))))

(assert (=> b!351476 (= res!194902 e!215233)))

(declare-fun c!53456 () Bool)

(assert (=> b!351476 (= c!53456 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!351477 () Bool)

(assert (=> b!351477 (= e!215231 (validKeyInArray!0 (select (arr!8983 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71469 c!53454) b!351471))

(assert (= (and d!71469 (not c!53454)) b!351463))

(assert (= (and b!351463 c!53457) b!351466))

(assert (= (and b!351463 (not c!53457)) b!351465))

(assert (= (and b!351465 c!53453) b!351460))

(assert (= (and b!351465 (not c!53453)) b!351470))

(assert (= (or b!351460 b!351470) bm!27004))

(assert (= (or b!351466 bm!27004) bm!27002))

(assert (= (or b!351466 b!351460) bm!27000))

(assert (= (or b!351471 bm!27002) bm!27003))

(assert (= (or b!351471 bm!27000) bm!26998))

(assert (= (and d!71469 res!194901) b!351477))

(assert (= (and d!71469 c!53452) b!351459))

(assert (= (and d!71469 (not c!53452)) b!351475))

(assert (= (and d!71469 res!194906) b!351468))

(assert (= (and b!351468 res!194905) b!351462))

(assert (= (and b!351468 (not res!194907)) b!351472))

(assert (= (and b!351472 res!194899) b!351458))

(assert (= (and b!351468 res!194900) b!351476))

(assert (= (and b!351476 c!53456) b!351474))

(assert (= (and b!351476 (not c!53456)) b!351464))

(assert (= (and b!351474 res!194903) b!351467))

(assert (= (or b!351474 b!351464) bm!26999))

(assert (= (and b!351476 res!194902) b!351461))

(assert (= (and b!351461 c!53455) b!351457))

(assert (= (and b!351461 (not c!53455)) b!351473))

(assert (= (and b!351457 res!194904) b!351469))

(assert (= (or b!351457 b!351473) bm!27001))

(declare-fun b_lambda!8503 () Bool)

(assert (=> (not b_lambda!8503) (not b!351458)))

(declare-fun t!10365 () Bool)

(declare-fun tb!3097 () Bool)

(assert (=> (and start!35042 (= defaultEntry!1528 defaultEntry!1528) t!10365) tb!3097))

(declare-fun result!5621 () Bool)

(assert (=> tb!3097 (= result!5621 tp_is_empty!7683)))

(assert (=> b!351458 t!10365))

(declare-fun b_and!14965 () Bool)

(assert (= b_and!14961 (and (=> t!10365 result!5621) b_and!14965)))

(assert (=> d!71469 m!351271))

(declare-fun m!351357 () Bool)

(assert (=> bm!27001 m!351357))

(assert (=> b!351477 m!351313))

(assert (=> b!351477 m!351313))

(assert (=> b!351477 m!351317))

(assert (=> b!351472 m!351313))

(assert (=> b!351472 m!351313))

(declare-fun m!351359 () Bool)

(assert (=> b!351472 m!351359))

(declare-fun m!351361 () Bool)

(assert (=> b!351459 m!351361))

(declare-fun m!351363 () Bool)

(assert (=> b!351459 m!351363))

(declare-fun m!351365 () Bool)

(assert (=> b!351459 m!351365))

(declare-fun m!351367 () Bool)

(assert (=> b!351459 m!351367))

(declare-fun m!351369 () Bool)

(assert (=> b!351459 m!351369))

(declare-fun m!351371 () Bool)

(assert (=> b!351459 m!351371))

(declare-fun m!351373 () Bool)

(assert (=> b!351459 m!351373))

(assert (=> b!351459 m!351313))

(assert (=> b!351459 m!351361))

(declare-fun m!351375 () Bool)

(assert (=> b!351459 m!351375))

(declare-fun m!351377 () Bool)

(assert (=> b!351459 m!351377))

(declare-fun m!351379 () Bool)

(assert (=> b!351459 m!351379))

(declare-fun m!351381 () Bool)

(assert (=> b!351459 m!351381))

(assert (=> b!351459 m!351379))

(declare-fun m!351383 () Bool)

(assert (=> b!351459 m!351383))

(assert (=> b!351459 m!351381))

(declare-fun m!351385 () Bool)

(assert (=> b!351459 m!351385))

(declare-fun m!351387 () Bool)

(assert (=> b!351459 m!351387))

(declare-fun m!351389 () Bool)

(assert (=> b!351459 m!351389))

(declare-fun m!351391 () Bool)

(assert (=> b!351459 m!351391))

(assert (=> b!351459 m!351367))

(declare-fun m!351393 () Bool)

(assert (=> bm!26998 m!351393))

(assert (=> b!351458 m!351313))

(declare-fun m!351395 () Bool)

(assert (=> b!351458 m!351395))

(declare-fun m!351397 () Bool)

(assert (=> b!351458 m!351397))

(assert (=> b!351458 m!351313))

(declare-fun m!351399 () Bool)

(assert (=> b!351458 m!351399))

(assert (=> b!351458 m!351399))

(assert (=> b!351458 m!351397))

(declare-fun m!351401 () Bool)

(assert (=> b!351458 m!351401))

(assert (=> bm!27003 m!351365))

(declare-fun m!351403 () Bool)

(assert (=> b!351469 m!351403))

(declare-fun m!351405 () Bool)

(assert (=> b!351467 m!351405))

(declare-fun m!351407 () Bool)

(assert (=> b!351471 m!351407))

(declare-fun m!351409 () Bool)

(assert (=> bm!26999 m!351409))

(assert (=> b!351462 m!351313))

(assert (=> b!351462 m!351313))

(assert (=> b!351462 m!351317))

(assert (=> b!351306 d!71469))

(declare-fun b!351487 () Bool)

(declare-fun e!215244 () Bool)

(assert (=> b!351487 (= e!215244 tp_is_empty!7683)))

(declare-fun mapIsEmpty!13002 () Bool)

(declare-fun mapRes!13002 () Bool)

(assert (=> mapIsEmpty!13002 mapRes!13002))

(declare-fun mapNonEmpty!13002 () Bool)

(declare-fun tp!26781 () Bool)

(declare-fun e!215245 () Bool)

(assert (=> mapNonEmpty!13002 (= mapRes!13002 (and tp!26781 e!215245))))

(declare-fun mapRest!13002 () (Array (_ BitVec 32) ValueCell!3498))

(declare-fun mapValue!13002 () ValueCell!3498)

(declare-fun mapKey!13002 () (_ BitVec 32))

(assert (=> mapNonEmpty!13002 (= mapRest!12996 (store mapRest!13002 mapKey!13002 mapValue!13002))))

(declare-fun b!351486 () Bool)

(assert (=> b!351486 (= e!215245 tp_is_empty!7683)))

(declare-fun condMapEmpty!13002 () Bool)

(declare-fun mapDefault!13002 () ValueCell!3498)

(assert (=> mapNonEmpty!12996 (= condMapEmpty!13002 (= mapRest!12996 ((as const (Array (_ BitVec 32) ValueCell!3498)) mapDefault!13002)))))

(assert (=> mapNonEmpty!12996 (= tp!26772 (and e!215244 mapRes!13002))))

(assert (= (and mapNonEmpty!12996 condMapEmpty!13002) mapIsEmpty!13002))

(assert (= (and mapNonEmpty!12996 (not condMapEmpty!13002)) mapNonEmpty!13002))

(assert (= (and mapNonEmpty!13002 ((_ is ValueCellFull!3498) mapValue!13002)) b!351486))

(assert (= (and mapNonEmpty!12996 ((_ is ValueCellFull!3498) mapDefault!13002)) b!351487))

(declare-fun m!351411 () Bool)

(assert (=> mapNonEmpty!13002 m!351411))

(declare-fun b_lambda!8505 () Bool)

(assert (= b_lambda!8503 (or (and start!35042 b_free!7731) b_lambda!8505)))

(check-sat (not d!71457) (not b!351359) (not b!351477) (not d!71469) (not b!351393) (not b!351458) (not b!351380) (not d!71467) (not b!351361) (not b!351414) (not b_next!7731) tp_is_empty!7683 (not b!351360) (not bm!26980) (not bm!27003) (not mapNonEmpty!13002) (not b!351467) (not b!351471) (not bm!27001) (not b!351405) (not b!351462) b_and!14965 (not b!351404) (not b_lambda!8505) (not b!351472) (not b!351459) (not bm!26998) (not bm!26999) (not b!351387) (not b!351469) (not bm!26983) (not b!351412))
(check-sat b_and!14965 (not b_next!7731))
