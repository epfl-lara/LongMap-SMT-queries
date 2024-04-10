; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34878 () Bool)

(assert start!34878)

(declare-fun b_free!7641 () Bool)

(declare-fun b_next!7641 () Bool)

(assert (=> start!34878 (= b_free!7641 (not b_next!7641))))

(declare-fun tp!26493 () Bool)

(declare-fun b_and!14865 () Bool)

(assert (=> start!34878 (= tp!26493 b_and!14865)))

(declare-fun b!349280 () Bool)

(declare-fun e!213958 () Bool)

(declare-fun tp_is_empty!7593 () Bool)

(assert (=> b!349280 (= e!213958 tp_is_empty!7593)))

(declare-fun b!349281 () Bool)

(declare-fun res!193580 () Bool)

(declare-fun e!213959 () Bool)

(assert (=> b!349281 (=> (not res!193580) (not e!213959))))

(declare-datatypes ((array!18771 0))(
  ( (array!18772 (arr!8894 (Array (_ BitVec 32) (_ BitVec 64))) (size!9246 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18771)

(declare-datatypes ((List!5168 0))(
  ( (Nil!5165) (Cons!5164 (h!6020 (_ BitVec 64)) (t!10300 List!5168)) )
))
(declare-fun arrayNoDuplicates!0 (array!18771 (_ BitVec 32) List!5168) Bool)

(assert (=> b!349281 (= res!193580 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5165))))

(declare-fun b!349282 () Bool)

(declare-fun e!213962 () Bool)

(assert (=> b!349282 (= e!213962 tp_is_empty!7593)))

(declare-fun res!193578 () Bool)

(assert (=> start!34878 (=> (not res!193578) (not e!213959))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34878 (= res!193578 (validMask!0 mask!2385))))

(assert (=> start!34878 e!213959))

(assert (=> start!34878 true))

(assert (=> start!34878 tp_is_empty!7593))

(assert (=> start!34878 tp!26493))

(declare-datatypes ((V!11101 0))(
  ( (V!11102 (val!3841 Int)) )
))
(declare-datatypes ((ValueCell!3453 0))(
  ( (ValueCellFull!3453 (v!6025 V!11101)) (EmptyCell!3453) )
))
(declare-datatypes ((array!18773 0))(
  ( (array!18774 (arr!8895 (Array (_ BitVec 32) ValueCell!3453)) (size!9247 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18773)

(declare-fun e!213957 () Bool)

(declare-fun array_inv!6576 (array!18773) Bool)

(assert (=> start!34878 (and (array_inv!6576 _values!1525) e!213957)))

(declare-fun array_inv!6577 (array!18771) Bool)

(assert (=> start!34878 (array_inv!6577 _keys!1895)))

(declare-fun b!349283 () Bool)

(declare-fun mapRes!12852 () Bool)

(assert (=> b!349283 (= e!213957 (and e!213958 mapRes!12852))))

(declare-fun condMapEmpty!12852 () Bool)

(declare-fun mapDefault!12852 () ValueCell!3453)

(assert (=> b!349283 (= condMapEmpty!12852 (= (arr!8895 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3453)) mapDefault!12852)))))

(declare-fun b!349284 () Bool)

(declare-fun e!213960 () Bool)

(assert (=> b!349284 (= e!213959 e!213960)))

(declare-fun res!193584 () Bool)

(assert (=> b!349284 (=> (not res!193584) (not e!213960))))

(declare-datatypes ((SeekEntryResult!3426 0))(
  ( (MissingZero!3426 (index!15883 (_ BitVec 32))) (Found!3426 (index!15884 (_ BitVec 32))) (Intermediate!3426 (undefined!4238 Bool) (index!15885 (_ BitVec 32)) (x!34788 (_ BitVec 32))) (Undefined!3426) (MissingVacant!3426 (index!15886 (_ BitVec 32))) )
))
(declare-fun lt!164103 () SeekEntryResult!3426)

(get-info :version)

(assert (=> b!349284 (= res!193584 (and (not ((_ is Found!3426) lt!164103)) ((_ is MissingZero!3426) lt!164103)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18771 (_ BitVec 32)) SeekEntryResult!3426)

(assert (=> b!349284 (= lt!164103 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12852 () Bool)

(assert (=> mapIsEmpty!12852 mapRes!12852))

(declare-fun mapNonEmpty!12852 () Bool)

(declare-fun tp!26492 () Bool)

(assert (=> mapNonEmpty!12852 (= mapRes!12852 (and tp!26492 e!213962))))

(declare-fun mapKey!12852 () (_ BitVec 32))

(declare-fun mapValue!12852 () ValueCell!3453)

(declare-fun mapRest!12852 () (Array (_ BitVec 32) ValueCell!3453))

(assert (=> mapNonEmpty!12852 (= (arr!8895 _values!1525) (store mapRest!12852 mapKey!12852 mapValue!12852))))

(declare-fun b!349285 () Bool)

(declare-fun res!193585 () Bool)

(assert (=> b!349285 (=> (not res!193585) (not e!213959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349285 (= res!193585 (validKeyInArray!0 k0!1348))))

(declare-fun b!349286 () Bool)

(declare-fun res!193581 () Bool)

(assert (=> b!349286 (=> (not res!193581) (not e!213959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18771 (_ BitVec 32)) Bool)

(assert (=> b!349286 (= res!193581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349287 () Bool)

(declare-fun res!193582 () Bool)

(assert (=> b!349287 (=> (not res!193582) (not e!213959))))

(declare-fun zeroValue!1467 () V!11101)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11101)

(declare-datatypes ((tuple2!5546 0))(
  ( (tuple2!5547 (_1!2784 (_ BitVec 64)) (_2!2784 V!11101)) )
))
(declare-datatypes ((List!5169 0))(
  ( (Nil!5166) (Cons!5165 (h!6021 tuple2!5546) (t!10301 List!5169)) )
))
(declare-datatypes ((ListLongMap!4459 0))(
  ( (ListLongMap!4460 (toList!2245 List!5169)) )
))
(declare-fun contains!2311 (ListLongMap!4459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1766 (array!18771 array!18773 (_ BitVec 32) (_ BitVec 32) V!11101 V!11101 (_ BitVec 32) Int) ListLongMap!4459)

(assert (=> b!349287 (= res!193582 (not (contains!2311 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349288 () Bool)

(declare-fun e!213961 () Bool)

(assert (=> b!349288 (= e!213960 e!213961)))

(declare-fun res!193583 () Bool)

(assert (=> b!349288 (=> (not res!193583) (not e!213961))))

(declare-fun lt!164104 () (_ BitVec 32))

(assert (=> b!349288 (= res!193583 (and (bvsge lt!164104 #b00000000000000000000000000000000) (bvslt lt!164104 (size!9246 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349288 (= lt!164104 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349289 () Bool)

(declare-fun arrayContainsKey!0 (array!18771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349289 (= e!213961 (not (arrayContainsKey!0 _keys!1895 k0!1348 lt!164104)))))

(declare-fun b!349290 () Bool)

(declare-fun res!193579 () Bool)

(assert (=> b!349290 (=> (not res!193579) (not e!213959))))

(assert (=> b!349290 (= res!193579 (and (= (size!9247 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9246 _keys!1895) (size!9247 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349291 () Bool)

(declare-fun res!193577 () Bool)

(assert (=> b!349291 (=> (not res!193577) (not e!213960))))

(assert (=> b!349291 (= res!193577 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34878 res!193578) b!349290))

(assert (= (and b!349290 res!193579) b!349286))

(assert (= (and b!349286 res!193581) b!349281))

(assert (= (and b!349281 res!193580) b!349285))

(assert (= (and b!349285 res!193585) b!349287))

(assert (= (and b!349287 res!193582) b!349284))

(assert (= (and b!349284 res!193584) b!349291))

(assert (= (and b!349291 res!193577) b!349288))

(assert (= (and b!349288 res!193583) b!349289))

(assert (= (and b!349283 condMapEmpty!12852) mapIsEmpty!12852))

(assert (= (and b!349283 (not condMapEmpty!12852)) mapNonEmpty!12852))

(assert (= (and mapNonEmpty!12852 ((_ is ValueCellFull!3453) mapValue!12852)) b!349282))

(assert (= (and b!349283 ((_ is ValueCellFull!3453) mapDefault!12852)) b!349280))

(assert (= start!34878 b!349283))

(declare-fun m!349819 () Bool)

(assert (=> b!349284 m!349819))

(declare-fun m!349821 () Bool)

(assert (=> b!349288 m!349821))

(declare-fun m!349823 () Bool)

(assert (=> b!349286 m!349823))

(declare-fun m!349825 () Bool)

(assert (=> mapNonEmpty!12852 m!349825))

(declare-fun m!349827 () Bool)

(assert (=> b!349289 m!349827))

(declare-fun m!349829 () Bool)

(assert (=> b!349281 m!349829))

(declare-fun m!349831 () Bool)

(assert (=> b!349285 m!349831))

(declare-fun m!349833 () Bool)

(assert (=> b!349291 m!349833))

(declare-fun m!349835 () Bool)

(assert (=> b!349287 m!349835))

(assert (=> b!349287 m!349835))

(declare-fun m!349837 () Bool)

(assert (=> b!349287 m!349837))

(declare-fun m!349839 () Bool)

(assert (=> start!34878 m!349839))

(declare-fun m!349841 () Bool)

(assert (=> start!34878 m!349841))

(declare-fun m!349843 () Bool)

(assert (=> start!34878 m!349843))

(check-sat b_and!14865 (not start!34878) tp_is_empty!7593 (not b!349281) (not b!349289) (not mapNonEmpty!12852) (not b!349287) (not b_next!7641) (not b!349284) (not b!349288) (not b!349291) (not b!349286) (not b!349285))
(check-sat b_and!14865 (not b_next!7641))
(get-model)

(declare-fun d!71343 () Bool)

(assert (=> d!71343 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34878 d!71343))

(declare-fun d!71345 () Bool)

(assert (=> d!71345 (= (array_inv!6576 _values!1525) (bvsge (size!9247 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34878 d!71345))

(declare-fun d!71347 () Bool)

(assert (=> d!71347 (= (array_inv!6577 _keys!1895) (bvsge (size!9246 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34878 d!71347))

(declare-fun d!71349 () Bool)

(declare-fun res!193617 () Bool)

(declare-fun e!213988 () Bool)

(assert (=> d!71349 (=> res!193617 e!213988)))

(assert (=> d!71349 (= res!193617 (= (select (arr!8894 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71349 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!213988)))

(declare-fun b!349332 () Bool)

(declare-fun e!213989 () Bool)

(assert (=> b!349332 (= e!213988 e!213989)))

(declare-fun res!193618 () Bool)

(assert (=> b!349332 (=> (not res!193618) (not e!213989))))

(assert (=> b!349332 (= res!193618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9246 _keys!1895)))))

(declare-fun b!349333 () Bool)

(assert (=> b!349333 (= e!213989 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71349 (not res!193617)) b!349332))

(assert (= (and b!349332 res!193618) b!349333))

(declare-fun m!349871 () Bool)

(assert (=> d!71349 m!349871))

(declare-fun m!349873 () Bool)

(assert (=> b!349333 m!349873))

(assert (=> b!349291 d!71349))

(declare-fun b!349342 () Bool)

(declare-fun e!213998 () Bool)

(declare-fun call!26893 () Bool)

(assert (=> b!349342 (= e!213998 call!26893)))

(declare-fun d!71351 () Bool)

(declare-fun res!193623 () Bool)

(declare-fun e!213997 () Bool)

(assert (=> d!71351 (=> res!193623 e!213997)))

(assert (=> d!71351 (= res!193623 (bvsge #b00000000000000000000000000000000 (size!9246 _keys!1895)))))

(assert (=> d!71351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!213997)))

(declare-fun bm!26890 () Bool)

(assert (=> bm!26890 (= call!26893 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!349343 () Bool)

(declare-fun e!213996 () Bool)

(assert (=> b!349343 (= e!213996 e!213998)))

(declare-fun lt!164119 () (_ BitVec 64))

(assert (=> b!349343 (= lt!164119 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10809 0))(
  ( (Unit!10810) )
))
(declare-fun lt!164117 () Unit!10809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18771 (_ BitVec 64) (_ BitVec 32)) Unit!10809)

(assert (=> b!349343 (= lt!164117 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164119 #b00000000000000000000000000000000))))

(assert (=> b!349343 (arrayContainsKey!0 _keys!1895 lt!164119 #b00000000000000000000000000000000)))

(declare-fun lt!164118 () Unit!10809)

(assert (=> b!349343 (= lt!164118 lt!164117)))

(declare-fun res!193624 () Bool)

(assert (=> b!349343 (= res!193624 (= (seekEntryOrOpen!0 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3426 #b00000000000000000000000000000000)))))

(assert (=> b!349343 (=> (not res!193624) (not e!213998))))

(declare-fun b!349344 () Bool)

(assert (=> b!349344 (= e!213997 e!213996)))

(declare-fun c!53250 () Bool)

(assert (=> b!349344 (= c!53250 (validKeyInArray!0 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349345 () Bool)

(assert (=> b!349345 (= e!213996 call!26893)))

(assert (= (and d!71351 (not res!193623)) b!349344))

(assert (= (and b!349344 c!53250) b!349343))

(assert (= (and b!349344 (not c!53250)) b!349345))

(assert (= (and b!349343 res!193624) b!349342))

(assert (= (or b!349342 b!349345) bm!26890))

(declare-fun m!349875 () Bool)

(assert (=> bm!26890 m!349875))

(assert (=> b!349343 m!349871))

(declare-fun m!349877 () Bool)

(assert (=> b!349343 m!349877))

(declare-fun m!349879 () Bool)

(assert (=> b!349343 m!349879))

(assert (=> b!349343 m!349871))

(declare-fun m!349881 () Bool)

(assert (=> b!349343 m!349881))

(assert (=> b!349344 m!349871))

(assert (=> b!349344 m!349871))

(declare-fun m!349883 () Bool)

(assert (=> b!349344 m!349883))

(assert (=> b!349286 d!71351))

(declare-fun d!71353 () Bool)

(declare-fun lt!164122 () (_ BitVec 32))

(assert (=> d!71353 (and (or (bvslt lt!164122 #b00000000000000000000000000000000) (bvsge lt!164122 (size!9246 _keys!1895)) (and (bvsge lt!164122 #b00000000000000000000000000000000) (bvslt lt!164122 (size!9246 _keys!1895)))) (bvsge lt!164122 #b00000000000000000000000000000000) (bvslt lt!164122 (size!9246 _keys!1895)) (= (select (arr!8894 _keys!1895) lt!164122) k0!1348))))

(declare-fun e!214001 () (_ BitVec 32))

(assert (=> d!71353 (= lt!164122 e!214001)))

(declare-fun c!53253 () Bool)

(assert (=> d!71353 (= c!53253 (= (select (arr!8894 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9246 _keys!1895)) (bvslt (size!9246 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71353 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164122)))

(declare-fun b!349350 () Bool)

(assert (=> b!349350 (= e!214001 #b00000000000000000000000000000000)))

(declare-fun b!349351 () Bool)

(assert (=> b!349351 (= e!214001 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71353 c!53253) b!349350))

(assert (= (and d!71353 (not c!53253)) b!349351))

(declare-fun m!349885 () Bool)

(assert (=> d!71353 m!349885))

(assert (=> d!71353 m!349871))

(declare-fun m!349887 () Bool)

(assert (=> b!349351 m!349887))

(assert (=> b!349288 d!71353))

(declare-fun d!71355 () Bool)

(declare-fun e!214006 () Bool)

(assert (=> d!71355 e!214006))

(declare-fun res!193627 () Bool)

(assert (=> d!71355 (=> res!193627 e!214006)))

(declare-fun lt!164134 () Bool)

(assert (=> d!71355 (= res!193627 (not lt!164134))))

(declare-fun lt!164133 () Bool)

(assert (=> d!71355 (= lt!164134 lt!164133)))

(declare-fun lt!164131 () Unit!10809)

(declare-fun e!214007 () Unit!10809)

(assert (=> d!71355 (= lt!164131 e!214007)))

(declare-fun c!53256 () Bool)

(assert (=> d!71355 (= c!53256 lt!164133)))

(declare-fun containsKey!338 (List!5169 (_ BitVec 64)) Bool)

(assert (=> d!71355 (= lt!164133 (containsKey!338 (toList!2245 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71355 (= (contains!2311 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164134)))

(declare-fun b!349358 () Bool)

(declare-fun lt!164132 () Unit!10809)

(assert (=> b!349358 (= e!214007 lt!164132)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!286 (List!5169 (_ BitVec 64)) Unit!10809)

(assert (=> b!349358 (= lt!164132 (lemmaContainsKeyImpliesGetValueByKeyDefined!286 (toList!2245 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!352 0))(
  ( (Some!351 (v!6027 V!11101)) (None!350) )
))
(declare-fun isDefined!287 (Option!352) Bool)

(declare-fun getValueByKey!346 (List!5169 (_ BitVec 64)) Option!352)

(assert (=> b!349358 (isDefined!287 (getValueByKey!346 (toList!2245 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349359 () Bool)

(declare-fun Unit!10811 () Unit!10809)

(assert (=> b!349359 (= e!214007 Unit!10811)))

(declare-fun b!349360 () Bool)

(assert (=> b!349360 (= e!214006 (isDefined!287 (getValueByKey!346 (toList!2245 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71355 c!53256) b!349358))

(assert (= (and d!71355 (not c!53256)) b!349359))

(assert (= (and d!71355 (not res!193627)) b!349360))

(declare-fun m!349889 () Bool)

(assert (=> d!71355 m!349889))

(declare-fun m!349891 () Bool)

(assert (=> b!349358 m!349891))

(declare-fun m!349893 () Bool)

(assert (=> b!349358 m!349893))

(assert (=> b!349358 m!349893))

(declare-fun m!349895 () Bool)

(assert (=> b!349358 m!349895))

(assert (=> b!349360 m!349893))

(assert (=> b!349360 m!349893))

(assert (=> b!349360 m!349895))

(assert (=> b!349287 d!71355))

(declare-fun bm!26905 () Bool)

(declare-fun call!26912 () ListLongMap!4459)

(declare-fun getCurrentListMapNoExtraKeys!610 (array!18771 array!18773 (_ BitVec 32) (_ BitVec 32) V!11101 V!11101 (_ BitVec 32) Int) ListLongMap!4459)

(assert (=> bm!26905 (= call!26912 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!349403 () Bool)

(declare-fun e!214039 () ListLongMap!4459)

(declare-fun call!26910 () ListLongMap!4459)

(declare-fun +!737 (ListLongMap!4459 tuple2!5546) ListLongMap!4459)

(assert (=> b!349403 (= e!214039 (+!737 call!26910 (tuple2!5547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!349405 () Bool)

(declare-fun e!214044 () Unit!10809)

(declare-fun lt!164186 () Unit!10809)

(assert (=> b!349405 (= e!214044 lt!164186)))

(declare-fun lt!164179 () ListLongMap!4459)

(assert (=> b!349405 (= lt!164179 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164192 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164189 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164189 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164188 () Unit!10809)

(declare-fun addStillContains!264 (ListLongMap!4459 (_ BitVec 64) V!11101 (_ BitVec 64)) Unit!10809)

(assert (=> b!349405 (= lt!164188 (addStillContains!264 lt!164179 lt!164192 zeroValue!1467 lt!164189))))

(assert (=> b!349405 (contains!2311 (+!737 lt!164179 (tuple2!5547 lt!164192 zeroValue!1467)) lt!164189)))

(declare-fun lt!164182 () Unit!10809)

(assert (=> b!349405 (= lt!164182 lt!164188)))

(declare-fun lt!164183 () ListLongMap!4459)

(assert (=> b!349405 (= lt!164183 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164196 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164195 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164195 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164198 () Unit!10809)

(declare-fun addApplyDifferent!264 (ListLongMap!4459 (_ BitVec 64) V!11101 (_ BitVec 64)) Unit!10809)

(assert (=> b!349405 (= lt!164198 (addApplyDifferent!264 lt!164183 lt!164196 minValue!1467 lt!164195))))

(declare-fun apply!288 (ListLongMap!4459 (_ BitVec 64)) V!11101)

(assert (=> b!349405 (= (apply!288 (+!737 lt!164183 (tuple2!5547 lt!164196 minValue!1467)) lt!164195) (apply!288 lt!164183 lt!164195))))

(declare-fun lt!164181 () Unit!10809)

(assert (=> b!349405 (= lt!164181 lt!164198)))

(declare-fun lt!164193 () ListLongMap!4459)

(assert (=> b!349405 (= lt!164193 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164191 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164187 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164187 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164194 () Unit!10809)

(assert (=> b!349405 (= lt!164194 (addApplyDifferent!264 lt!164193 lt!164191 zeroValue!1467 lt!164187))))

(assert (=> b!349405 (= (apply!288 (+!737 lt!164193 (tuple2!5547 lt!164191 zeroValue!1467)) lt!164187) (apply!288 lt!164193 lt!164187))))

(declare-fun lt!164180 () Unit!10809)

(assert (=> b!349405 (= lt!164180 lt!164194)))

(declare-fun lt!164184 () ListLongMap!4459)

(assert (=> b!349405 (= lt!164184 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164190 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164185 () (_ BitVec 64))

(assert (=> b!349405 (= lt!164185 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349405 (= lt!164186 (addApplyDifferent!264 lt!164184 lt!164190 minValue!1467 lt!164185))))

(assert (=> b!349405 (= (apply!288 (+!737 lt!164184 (tuple2!5547 lt!164190 minValue!1467)) lt!164185) (apply!288 lt!164184 lt!164185))))

(declare-fun b!349406 () Bool)

(declare-fun e!214036 () Bool)

(declare-fun e!214037 () Bool)

(assert (=> b!349406 (= e!214036 e!214037)))

(declare-fun c!53270 () Bool)

(assert (=> b!349406 (= c!53270 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26906 () Bool)

(declare-fun call!26911 () ListLongMap!4459)

(assert (=> bm!26906 (= call!26911 call!26910)))

(declare-fun bm!26907 () Bool)

(declare-fun call!26909 () ListLongMap!4459)

(declare-fun call!26914 () ListLongMap!4459)

(assert (=> bm!26907 (= call!26909 call!26914)))

(declare-fun b!349407 () Bool)

(declare-fun e!214035 () Bool)

(assert (=> b!349407 (= e!214037 e!214035)))

(declare-fun res!193651 () Bool)

(declare-fun call!26913 () Bool)

(assert (=> b!349407 (= res!193651 call!26913)))

(assert (=> b!349407 (=> (not res!193651) (not e!214035))))

(declare-fun b!349408 () Bool)

(declare-fun lt!164200 () ListLongMap!4459)

(assert (=> b!349408 (= e!214035 (= (apply!288 lt!164200 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!349409 () Bool)

(declare-fun e!214042 () Bool)

(declare-fun call!26908 () Bool)

(assert (=> b!349409 (= e!214042 (not call!26908))))

(declare-fun b!349410 () Bool)

(declare-fun e!214045 () Bool)

(declare-fun get!4764 (ValueCell!3453 V!11101) V!11101)

(declare-fun dynLambda!631 (Int (_ BitVec 64)) V!11101)

(assert (=> b!349410 (= e!214045 (= (apply!288 lt!164200 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)) (get!4764 (select (arr!8895 _values!1525) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349410 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9247 _values!1525)))))

(assert (=> b!349410 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9246 _keys!1895)))))

(declare-fun b!349411 () Bool)

(declare-fun e!214041 () ListLongMap!4459)

(assert (=> b!349411 (= e!214039 e!214041)))

(declare-fun c!53274 () Bool)

(assert (=> b!349411 (= c!53274 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349412 () Bool)

(declare-fun c!53272 () Bool)

(assert (=> b!349412 (= c!53272 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!214034 () ListLongMap!4459)

(assert (=> b!349412 (= e!214041 e!214034)))

(declare-fun b!349413 () Bool)

(declare-fun e!214040 () Bool)

(assert (=> b!349413 (= e!214040 (validKeyInArray!0 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26908 () Bool)

(assert (=> bm!26908 (= call!26914 call!26912)))

(declare-fun b!349414 () Bool)

(assert (=> b!349414 (= e!214034 call!26909)))

(declare-fun b!349415 () Bool)

(declare-fun res!193650 () Bool)

(assert (=> b!349415 (=> (not res!193650) (not e!214036))))

(declare-fun e!214046 () Bool)

(assert (=> b!349415 (= res!193650 e!214046)))

(declare-fun res!193647 () Bool)

(assert (=> b!349415 (=> res!193647 e!214046)))

(declare-fun e!214038 () Bool)

(assert (=> b!349415 (= res!193647 (not e!214038))))

(declare-fun res!193648 () Bool)

(assert (=> b!349415 (=> (not res!193648) (not e!214038))))

(assert (=> b!349415 (= res!193648 (bvslt #b00000000000000000000000000000000 (size!9246 _keys!1895)))))

(declare-fun b!349416 () Bool)

(assert (=> b!349416 (= e!214037 (not call!26913))))

(declare-fun d!71357 () Bool)

(assert (=> d!71357 e!214036))

(declare-fun res!193649 () Bool)

(assert (=> d!71357 (=> (not res!193649) (not e!214036))))

(assert (=> d!71357 (= res!193649 (or (bvsge #b00000000000000000000000000000000 (size!9246 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9246 _keys!1895)))))))

(declare-fun lt!164197 () ListLongMap!4459)

(assert (=> d!71357 (= lt!164200 lt!164197)))

(declare-fun lt!164199 () Unit!10809)

(assert (=> d!71357 (= lt!164199 e!214044)))

(declare-fun c!53269 () Bool)

(assert (=> d!71357 (= c!53269 e!214040)))

(declare-fun res!193652 () Bool)

(assert (=> d!71357 (=> (not res!193652) (not e!214040))))

(assert (=> d!71357 (= res!193652 (bvslt #b00000000000000000000000000000000 (size!9246 _keys!1895)))))

(assert (=> d!71357 (= lt!164197 e!214039)))

(declare-fun c!53273 () Bool)

(assert (=> d!71357 (= c!53273 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71357 (validMask!0 mask!2385)))

(assert (=> d!71357 (= (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164200)))

(declare-fun b!349404 () Bool)

(declare-fun e!214043 () Bool)

(assert (=> b!349404 (= e!214042 e!214043)))

(declare-fun res!193653 () Bool)

(assert (=> b!349404 (= res!193653 call!26908)))

(assert (=> b!349404 (=> (not res!193653) (not e!214043))))

(declare-fun b!349417 () Bool)

(assert (=> b!349417 (= e!214038 (validKeyInArray!0 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349418 () Bool)

(assert (=> b!349418 (= e!214043 (= (apply!288 lt!164200 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!349419 () Bool)

(assert (=> b!349419 (= e!214046 e!214045)))

(declare-fun res!193654 () Bool)

(assert (=> b!349419 (=> (not res!193654) (not e!214045))))

(assert (=> b!349419 (= res!193654 (contains!2311 lt!164200 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9246 _keys!1895)))))

(declare-fun bm!26909 () Bool)

(assert (=> bm!26909 (= call!26910 (+!737 (ite c!53273 call!26912 (ite c!53274 call!26914 call!26909)) (ite (or c!53273 c!53274) (tuple2!5547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26910 () Bool)

(assert (=> bm!26910 (= call!26913 (contains!2311 lt!164200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26911 () Bool)

(assert (=> bm!26911 (= call!26908 (contains!2311 lt!164200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349420 () Bool)

(assert (=> b!349420 (= e!214041 call!26911)))

(declare-fun b!349421 () Bool)

(declare-fun Unit!10812 () Unit!10809)

(assert (=> b!349421 (= e!214044 Unit!10812)))

(declare-fun b!349422 () Bool)

(declare-fun res!193646 () Bool)

(assert (=> b!349422 (=> (not res!193646) (not e!214036))))

(assert (=> b!349422 (= res!193646 e!214042)))

(declare-fun c!53271 () Bool)

(assert (=> b!349422 (= c!53271 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!349423 () Bool)

(assert (=> b!349423 (= e!214034 call!26911)))

(assert (= (and d!71357 c!53273) b!349403))

(assert (= (and d!71357 (not c!53273)) b!349411))

(assert (= (and b!349411 c!53274) b!349420))

(assert (= (and b!349411 (not c!53274)) b!349412))

(assert (= (and b!349412 c!53272) b!349423))

(assert (= (and b!349412 (not c!53272)) b!349414))

(assert (= (or b!349423 b!349414) bm!26907))

(assert (= (or b!349420 bm!26907) bm!26908))

(assert (= (or b!349420 b!349423) bm!26906))

(assert (= (or b!349403 bm!26908) bm!26905))

(assert (= (or b!349403 bm!26906) bm!26909))

(assert (= (and d!71357 res!193652) b!349413))

(assert (= (and d!71357 c!53269) b!349405))

(assert (= (and d!71357 (not c!53269)) b!349421))

(assert (= (and d!71357 res!193649) b!349415))

(assert (= (and b!349415 res!193648) b!349417))

(assert (= (and b!349415 (not res!193647)) b!349419))

(assert (= (and b!349419 res!193654) b!349410))

(assert (= (and b!349415 res!193650) b!349422))

(assert (= (and b!349422 c!53271) b!349404))

(assert (= (and b!349422 (not c!53271)) b!349409))

(assert (= (and b!349404 res!193653) b!349418))

(assert (= (or b!349404 b!349409) bm!26911))

(assert (= (and b!349422 res!193646) b!349406))

(assert (= (and b!349406 c!53270) b!349407))

(assert (= (and b!349406 (not c!53270)) b!349416))

(assert (= (and b!349407 res!193651) b!349408))

(assert (= (or b!349407 b!349416) bm!26910))

(declare-fun b_lambda!8491 () Bool)

(assert (=> (not b_lambda!8491) (not b!349410)))

(declare-fun t!10303 () Bool)

(declare-fun tb!3091 () Bool)

(assert (=> (and start!34878 (= defaultEntry!1528 defaultEntry!1528) t!10303) tb!3091))

(declare-fun result!5603 () Bool)

(assert (=> tb!3091 (= result!5603 tp_is_empty!7593)))

(assert (=> b!349410 t!10303))

(declare-fun b_and!14869 () Bool)

(assert (= b_and!14865 (and (=> t!10303 result!5603) b_and!14869)))

(declare-fun m!349897 () Bool)

(assert (=> bm!26909 m!349897))

(declare-fun m!349899 () Bool)

(assert (=> b!349410 m!349899))

(assert (=> b!349410 m!349871))

(declare-fun m!349901 () Bool)

(assert (=> b!349410 m!349901))

(assert (=> b!349410 m!349871))

(declare-fun m!349903 () Bool)

(assert (=> b!349410 m!349903))

(assert (=> b!349410 m!349903))

(assert (=> b!349410 m!349899))

(declare-fun m!349905 () Bool)

(assert (=> b!349410 m!349905))

(declare-fun m!349907 () Bool)

(assert (=> b!349405 m!349907))

(declare-fun m!349909 () Bool)

(assert (=> b!349405 m!349909))

(declare-fun m!349911 () Bool)

(assert (=> b!349405 m!349911))

(declare-fun m!349913 () Bool)

(assert (=> b!349405 m!349913))

(declare-fun m!349915 () Bool)

(assert (=> b!349405 m!349915))

(declare-fun m!349917 () Bool)

(assert (=> b!349405 m!349917))

(declare-fun m!349919 () Bool)

(assert (=> b!349405 m!349919))

(declare-fun m!349921 () Bool)

(assert (=> b!349405 m!349921))

(declare-fun m!349923 () Bool)

(assert (=> b!349405 m!349923))

(declare-fun m!349925 () Bool)

(assert (=> b!349405 m!349925))

(declare-fun m!349927 () Bool)

(assert (=> b!349405 m!349927))

(declare-fun m!349929 () Bool)

(assert (=> b!349405 m!349929))

(declare-fun m!349931 () Bool)

(assert (=> b!349405 m!349931))

(assert (=> b!349405 m!349915))

(declare-fun m!349933 () Bool)

(assert (=> b!349405 m!349933))

(declare-fun m!349935 () Bool)

(assert (=> b!349405 m!349935))

(assert (=> b!349405 m!349927))

(assert (=> b!349405 m!349871))

(assert (=> b!349405 m!349911))

(declare-fun m!349937 () Bool)

(assert (=> b!349405 m!349937))

(assert (=> b!349405 m!349917))

(declare-fun m!349939 () Bool)

(assert (=> bm!26910 m!349939))

(declare-fun m!349941 () Bool)

(assert (=> bm!26911 m!349941))

(declare-fun m!349943 () Bool)

(assert (=> b!349418 m!349943))

(assert (=> b!349413 m!349871))

(assert (=> b!349413 m!349871))

(assert (=> b!349413 m!349883))

(declare-fun m!349945 () Bool)

(assert (=> b!349403 m!349945))

(assert (=> bm!26905 m!349913))

(assert (=> b!349419 m!349871))

(assert (=> b!349419 m!349871))

(declare-fun m!349947 () Bool)

(assert (=> b!349419 m!349947))

(declare-fun m!349949 () Bool)

(assert (=> b!349408 m!349949))

(assert (=> b!349417 m!349871))

(assert (=> b!349417 m!349871))

(assert (=> b!349417 m!349883))

(assert (=> d!71357 m!349839))

(assert (=> b!349287 d!71357))

(declare-fun b!349438 () Bool)

(declare-fun e!214054 () SeekEntryResult!3426)

(declare-fun e!214053 () SeekEntryResult!3426)

(assert (=> b!349438 (= e!214054 e!214053)))

(declare-fun lt!164208 () (_ BitVec 64))

(declare-fun lt!164207 () SeekEntryResult!3426)

(assert (=> b!349438 (= lt!164208 (select (arr!8894 _keys!1895) (index!15885 lt!164207)))))

(declare-fun c!53282 () Bool)

(assert (=> b!349438 (= c!53282 (= lt!164208 k0!1348))))

(declare-fun b!349439 () Bool)

(assert (=> b!349439 (= e!214053 (Found!3426 (index!15885 lt!164207)))))

(declare-fun b!349440 () Bool)

(declare-fun e!214055 () SeekEntryResult!3426)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18771 (_ BitVec 32)) SeekEntryResult!3426)

(assert (=> b!349440 (= e!214055 (seekKeyOrZeroReturnVacant!0 (x!34788 lt!164207) (index!15885 lt!164207) (index!15885 lt!164207) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!71359 () Bool)

(declare-fun lt!164209 () SeekEntryResult!3426)

(assert (=> d!71359 (and (or ((_ is Undefined!3426) lt!164209) (not ((_ is Found!3426) lt!164209)) (and (bvsge (index!15884 lt!164209) #b00000000000000000000000000000000) (bvslt (index!15884 lt!164209) (size!9246 _keys!1895)))) (or ((_ is Undefined!3426) lt!164209) ((_ is Found!3426) lt!164209) (not ((_ is MissingZero!3426) lt!164209)) (and (bvsge (index!15883 lt!164209) #b00000000000000000000000000000000) (bvslt (index!15883 lt!164209) (size!9246 _keys!1895)))) (or ((_ is Undefined!3426) lt!164209) ((_ is Found!3426) lt!164209) ((_ is MissingZero!3426) lt!164209) (not ((_ is MissingVacant!3426) lt!164209)) (and (bvsge (index!15886 lt!164209) #b00000000000000000000000000000000) (bvslt (index!15886 lt!164209) (size!9246 _keys!1895)))) (or ((_ is Undefined!3426) lt!164209) (ite ((_ is Found!3426) lt!164209) (= (select (arr!8894 _keys!1895) (index!15884 lt!164209)) k0!1348) (ite ((_ is MissingZero!3426) lt!164209) (= (select (arr!8894 _keys!1895) (index!15883 lt!164209)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3426) lt!164209) (= (select (arr!8894 _keys!1895) (index!15886 lt!164209)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71359 (= lt!164209 e!214054)))

(declare-fun c!53283 () Bool)

(assert (=> d!71359 (= c!53283 (and ((_ is Intermediate!3426) lt!164207) (undefined!4238 lt!164207)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18771 (_ BitVec 32)) SeekEntryResult!3426)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71359 (= lt!164207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71359 (validMask!0 mask!2385)))

(assert (=> d!71359 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164209)))

(declare-fun b!349441 () Bool)

(declare-fun c!53281 () Bool)

(assert (=> b!349441 (= c!53281 (= lt!164208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!349441 (= e!214053 e!214055)))

(declare-fun b!349442 () Bool)

(assert (=> b!349442 (= e!214055 (MissingZero!3426 (index!15885 lt!164207)))))

(declare-fun b!349443 () Bool)

(assert (=> b!349443 (= e!214054 Undefined!3426)))

(assert (= (and d!71359 c!53283) b!349443))

(assert (= (and d!71359 (not c!53283)) b!349438))

(assert (= (and b!349438 c!53282) b!349439))

(assert (= (and b!349438 (not c!53282)) b!349441))

(assert (= (and b!349441 c!53281) b!349442))

(assert (= (and b!349441 (not c!53281)) b!349440))

(declare-fun m!349951 () Bool)

(assert (=> b!349438 m!349951))

(declare-fun m!349953 () Bool)

(assert (=> b!349440 m!349953))

(declare-fun m!349955 () Bool)

(assert (=> d!71359 m!349955))

(declare-fun m!349957 () Bool)

(assert (=> d!71359 m!349957))

(declare-fun m!349959 () Bool)

(assert (=> d!71359 m!349959))

(declare-fun m!349961 () Bool)

(assert (=> d!71359 m!349961))

(assert (=> d!71359 m!349839))

(assert (=> d!71359 m!349959))

(declare-fun m!349963 () Bool)

(assert (=> d!71359 m!349963))

(assert (=> b!349284 d!71359))

(declare-fun d!71361 () Bool)

(declare-fun res!193655 () Bool)

(declare-fun e!214056 () Bool)

(assert (=> d!71361 (=> res!193655 e!214056)))

(assert (=> d!71361 (= res!193655 (= (select (arr!8894 _keys!1895) lt!164104) k0!1348))))

(assert (=> d!71361 (= (arrayContainsKey!0 _keys!1895 k0!1348 lt!164104) e!214056)))

(declare-fun b!349444 () Bool)

(declare-fun e!214057 () Bool)

(assert (=> b!349444 (= e!214056 e!214057)))

(declare-fun res!193656 () Bool)

(assert (=> b!349444 (=> (not res!193656) (not e!214057))))

(assert (=> b!349444 (= res!193656 (bvslt (bvadd lt!164104 #b00000000000000000000000000000001) (size!9246 _keys!1895)))))

(declare-fun b!349445 () Bool)

(assert (=> b!349445 (= e!214057 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd lt!164104 #b00000000000000000000000000000001)))))

(assert (= (and d!71361 (not res!193655)) b!349444))

(assert (= (and b!349444 res!193656) b!349445))

(declare-fun m!349965 () Bool)

(assert (=> d!71361 m!349965))

(declare-fun m!349967 () Bool)

(assert (=> b!349445 m!349967))

(assert (=> b!349289 d!71361))

(declare-fun d!71363 () Bool)

(assert (=> d!71363 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349285 d!71363))

(declare-fun bm!26914 () Bool)

(declare-fun call!26917 () Bool)

(declare-fun c!53286 () Bool)

(assert (=> bm!26914 (= call!26917 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53286 (Cons!5164 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000) Nil!5165) Nil!5165)))))

(declare-fun b!349456 () Bool)

(declare-fun e!214068 () Bool)

(assert (=> b!349456 (= e!214068 call!26917)))

(declare-fun b!349457 () Bool)

(declare-fun e!214067 () Bool)

(assert (=> b!349457 (= e!214067 e!214068)))

(assert (=> b!349457 (= c!53286 (validKeyInArray!0 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71365 () Bool)

(declare-fun res!193665 () Bool)

(declare-fun e!214066 () Bool)

(assert (=> d!71365 (=> res!193665 e!214066)))

(assert (=> d!71365 (= res!193665 (bvsge #b00000000000000000000000000000000 (size!9246 _keys!1895)))))

(assert (=> d!71365 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5165) e!214066)))

(declare-fun b!349458 () Bool)

(declare-fun e!214069 () Bool)

(declare-fun contains!2312 (List!5168 (_ BitVec 64)) Bool)

(assert (=> b!349458 (= e!214069 (contains!2312 Nil!5165 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349459 () Bool)

(assert (=> b!349459 (= e!214066 e!214067)))

(declare-fun res!193663 () Bool)

(assert (=> b!349459 (=> (not res!193663) (not e!214067))))

(assert (=> b!349459 (= res!193663 (not e!214069))))

(declare-fun res!193664 () Bool)

(assert (=> b!349459 (=> (not res!193664) (not e!214069))))

(assert (=> b!349459 (= res!193664 (validKeyInArray!0 (select (arr!8894 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349460 () Bool)

(assert (=> b!349460 (= e!214068 call!26917)))

(assert (= (and d!71365 (not res!193665)) b!349459))

(assert (= (and b!349459 res!193664) b!349458))

(assert (= (and b!349459 res!193663) b!349457))

(assert (= (and b!349457 c!53286) b!349460))

(assert (= (and b!349457 (not c!53286)) b!349456))

(assert (= (or b!349460 b!349456) bm!26914))

(assert (=> bm!26914 m!349871))

(declare-fun m!349969 () Bool)

(assert (=> bm!26914 m!349969))

(assert (=> b!349457 m!349871))

(assert (=> b!349457 m!349871))

(assert (=> b!349457 m!349883))

(assert (=> b!349458 m!349871))

(assert (=> b!349458 m!349871))

(declare-fun m!349971 () Bool)

(assert (=> b!349458 m!349971))

(assert (=> b!349459 m!349871))

(assert (=> b!349459 m!349871))

(assert (=> b!349459 m!349883))

(assert (=> b!349281 d!71365))

(declare-fun mapIsEmpty!12858 () Bool)

(declare-fun mapRes!12858 () Bool)

(assert (=> mapIsEmpty!12858 mapRes!12858))

(declare-fun b!349467 () Bool)

(declare-fun e!214074 () Bool)

(assert (=> b!349467 (= e!214074 tp_is_empty!7593)))

(declare-fun b!349468 () Bool)

(declare-fun e!214075 () Bool)

(assert (=> b!349468 (= e!214075 tp_is_empty!7593)))

(declare-fun condMapEmpty!12858 () Bool)

(declare-fun mapDefault!12858 () ValueCell!3453)

(assert (=> mapNonEmpty!12852 (= condMapEmpty!12858 (= mapRest!12852 ((as const (Array (_ BitVec 32) ValueCell!3453)) mapDefault!12858)))))

(assert (=> mapNonEmpty!12852 (= tp!26492 (and e!214075 mapRes!12858))))

(declare-fun mapNonEmpty!12858 () Bool)

(declare-fun tp!26502 () Bool)

(assert (=> mapNonEmpty!12858 (= mapRes!12858 (and tp!26502 e!214074))))

(declare-fun mapKey!12858 () (_ BitVec 32))

(declare-fun mapRest!12858 () (Array (_ BitVec 32) ValueCell!3453))

(declare-fun mapValue!12858 () ValueCell!3453)

(assert (=> mapNonEmpty!12858 (= mapRest!12852 (store mapRest!12858 mapKey!12858 mapValue!12858))))

(assert (= (and mapNonEmpty!12852 condMapEmpty!12858) mapIsEmpty!12858))

(assert (= (and mapNonEmpty!12852 (not condMapEmpty!12858)) mapNonEmpty!12858))

(assert (= (and mapNonEmpty!12858 ((_ is ValueCellFull!3453) mapValue!12858)) b!349467))

(assert (= (and mapNonEmpty!12852 ((_ is ValueCellFull!3453) mapDefault!12858)) b!349468))

(declare-fun m!349973 () Bool)

(assert (=> mapNonEmpty!12858 m!349973))

(declare-fun b_lambda!8493 () Bool)

(assert (= b_lambda!8491 (or (and start!34878 b_free!7641) b_lambda!8493)))

(check-sat (not mapNonEmpty!12858) (not bm!26909) tp_is_empty!7593 (not bm!26911) (not b!349410) (not b!349458) (not b!349360) (not b!349358) (not b!349459) (not bm!26905) (not d!71355) (not b_next!7641) (not bm!26910) (not bm!26914) (not d!71359) (not b!349403) (not bm!26890) (not b!349351) (not b!349440) (not b!349344) (not b!349418) (not b!349419) (not b!349457) (not b!349405) (not b!349343) b_and!14869 (not d!71357) (not b!349445) (not b!349413) (not b_lambda!8493) (not b!349417) (not b!349408) (not b!349333))
(check-sat b_and!14869 (not b_next!7641))
