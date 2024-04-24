; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35026 () Bool)

(assert start!35026)

(declare-fun b_free!7729 () Bool)

(declare-fun b_next!7729 () Bool)

(assert (=> start!35026 (= b_free!7729 (not b_next!7729))))

(declare-fun tp!26765 () Bool)

(declare-fun b_and!14973 () Bool)

(assert (=> start!35026 (= tp!26765 b_and!14973)))

(declare-fun b!351219 () Bool)

(declare-fun res!194803 () Bool)

(declare-fun e!215084 () Bool)

(assert (=> b!351219 (=> (not res!194803) (not e!215084))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351219 (= res!194803 (validKeyInArray!0 k0!1348))))

(declare-fun b!351220 () Bool)

(declare-fun e!215083 () Bool)

(assert (=> b!351220 (= e!215084 e!215083)))

(declare-fun res!194799 () Bool)

(assert (=> b!351220 (=> (not res!194799) (not e!215083))))

(declare-datatypes ((SeekEntryResult!3408 0))(
  ( (MissingZero!3408 (index!15811 (_ BitVec 32))) (Found!3408 (index!15812 (_ BitVec 32))) (Intermediate!3408 (undefined!4220 Bool) (index!15813 (_ BitVec 32)) (x!34917 (_ BitVec 32))) (Undefined!3408) (MissingVacant!3408 (index!15814 (_ BitVec 32))) )
))
(declare-fun lt!164751 () SeekEntryResult!3408)

(get-info :version)

(assert (=> b!351220 (= res!194799 (and (not ((_ is Found!3408) lt!164751)) (not ((_ is MissingZero!3408) lt!164751)) ((_ is MissingVacant!3408) lt!164751)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18936 0))(
  ( (array!18937 (arr!8973 (Array (_ BitVec 32) (_ BitVec 64))) (size!9325 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18936)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18936 (_ BitVec 32)) SeekEntryResult!3408)

(assert (=> b!351220 (= lt!164751 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12993 () Bool)

(declare-fun mapRes!12993 () Bool)

(declare-fun tp!26766 () Bool)

(declare-fun e!215081 () Bool)

(assert (=> mapNonEmpty!12993 (= mapRes!12993 (and tp!26766 e!215081))))

(declare-fun mapKey!12993 () (_ BitVec 32))

(declare-datatypes ((V!11219 0))(
  ( (V!11220 (val!3885 Int)) )
))
(declare-datatypes ((ValueCell!3497 0))(
  ( (ValueCellFull!3497 (v!6073 V!11219)) (EmptyCell!3497) )
))
(declare-datatypes ((array!18938 0))(
  ( (array!18939 (arr!8974 (Array (_ BitVec 32) ValueCell!3497)) (size!9326 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18938)

(declare-fun mapValue!12993 () ValueCell!3497)

(declare-fun mapRest!12993 () (Array (_ BitVec 32) ValueCell!3497))

(assert (=> mapNonEmpty!12993 (= (arr!8974 _values!1525) (store mapRest!12993 mapKey!12993 mapValue!12993))))

(declare-fun b!351221 () Bool)

(declare-fun lt!164752 () (_ BitVec 32))

(assert (=> b!351221 (= e!215083 (or (bvslt lt!164752 #b00000000000000000000000000000000) (bvsge lt!164752 (size!9325 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18936 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351221 (= lt!164752 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351222 () Bool)

(declare-fun res!194802 () Bool)

(assert (=> b!351222 (=> (not res!194802) (not e!215083))))

(declare-fun arrayContainsKey!0 (array!18936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351222 (= res!194802 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351223 () Bool)

(declare-fun tp_is_empty!7681 () Bool)

(assert (=> b!351223 (= e!215081 tp_is_empty!7681)))

(declare-fun b!351225 () Bool)

(declare-fun res!194800 () Bool)

(assert (=> b!351225 (=> (not res!194800) (not e!215084))))

(declare-fun zeroValue!1467 () V!11219)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11219)

(declare-datatypes ((tuple2!5520 0))(
  ( (tuple2!5521 (_1!2771 (_ BitVec 64)) (_2!2771 V!11219)) )
))
(declare-datatypes ((List!5126 0))(
  ( (Nil!5123) (Cons!5122 (h!5978 tuple2!5520) (t!10256 List!5126)) )
))
(declare-datatypes ((ListLongMap!4435 0))(
  ( (ListLongMap!4436 (toList!2233 List!5126)) )
))
(declare-fun contains!2321 (ListLongMap!4435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1761 (array!18936 array!18938 (_ BitVec 32) (_ BitVec 32) V!11219 V!11219 (_ BitVec 32) Int) ListLongMap!4435)

(assert (=> b!351225 (= res!194800 (not (contains!2321 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351224 () Bool)

(declare-fun e!215085 () Bool)

(declare-fun e!215080 () Bool)

(assert (=> b!351224 (= e!215085 (and e!215080 mapRes!12993))))

(declare-fun condMapEmpty!12993 () Bool)

(declare-fun mapDefault!12993 () ValueCell!3497)

(assert (=> b!351224 (= condMapEmpty!12993 (= (arr!8974 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3497)) mapDefault!12993)))))

(declare-fun res!194801 () Bool)

(assert (=> start!35026 (=> (not res!194801) (not e!215084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35026 (= res!194801 (validMask!0 mask!2385))))

(assert (=> start!35026 e!215084))

(assert (=> start!35026 true))

(assert (=> start!35026 tp_is_empty!7681))

(assert (=> start!35026 tp!26765))

(declare-fun array_inv!6628 (array!18938) Bool)

(assert (=> start!35026 (and (array_inv!6628 _values!1525) e!215085)))

(declare-fun array_inv!6629 (array!18936) Bool)

(assert (=> start!35026 (array_inv!6629 _keys!1895)))

(declare-fun mapIsEmpty!12993 () Bool)

(assert (=> mapIsEmpty!12993 mapRes!12993))

(declare-fun b!351226 () Bool)

(assert (=> b!351226 (= e!215080 tp_is_empty!7681)))

(declare-fun b!351227 () Bool)

(declare-fun res!194804 () Bool)

(assert (=> b!351227 (=> (not res!194804) (not e!215084))))

(declare-datatypes ((List!5127 0))(
  ( (Nil!5124) (Cons!5123 (h!5979 (_ BitVec 64)) (t!10257 List!5127)) )
))
(declare-fun arrayNoDuplicates!0 (array!18936 (_ BitVec 32) List!5127) Bool)

(assert (=> b!351227 (= res!194804 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5124))))

(declare-fun b!351228 () Bool)

(declare-fun res!194805 () Bool)

(assert (=> b!351228 (=> (not res!194805) (not e!215084))))

(assert (=> b!351228 (= res!194805 (and (= (size!9326 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9325 _keys!1895) (size!9326 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351229 () Bool)

(declare-fun res!194798 () Bool)

(assert (=> b!351229 (=> (not res!194798) (not e!215084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18936 (_ BitVec 32)) Bool)

(assert (=> b!351229 (= res!194798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!35026 res!194801) b!351228))

(assert (= (and b!351228 res!194805) b!351229))

(assert (= (and b!351229 res!194798) b!351227))

(assert (= (and b!351227 res!194804) b!351219))

(assert (= (and b!351219 res!194803) b!351225))

(assert (= (and b!351225 res!194800) b!351220))

(assert (= (and b!351220 res!194799) b!351222))

(assert (= (and b!351222 res!194802) b!351221))

(assert (= (and b!351224 condMapEmpty!12993) mapIsEmpty!12993))

(assert (= (and b!351224 (not condMapEmpty!12993)) mapNonEmpty!12993))

(assert (= (and mapNonEmpty!12993 ((_ is ValueCellFull!3497) mapValue!12993)) b!351223))

(assert (= (and b!351224 ((_ is ValueCellFull!3497) mapDefault!12993)) b!351226))

(assert (= start!35026 b!351224))

(declare-fun m!351465 () Bool)

(assert (=> mapNonEmpty!12993 m!351465))

(declare-fun m!351467 () Bool)

(assert (=> b!351225 m!351467))

(assert (=> b!351225 m!351467))

(declare-fun m!351469 () Bool)

(assert (=> b!351225 m!351469))

(declare-fun m!351471 () Bool)

(assert (=> b!351221 m!351471))

(declare-fun m!351473 () Bool)

(assert (=> b!351229 m!351473))

(declare-fun m!351475 () Bool)

(assert (=> b!351220 m!351475))

(declare-fun m!351477 () Bool)

(assert (=> b!351227 m!351477))

(declare-fun m!351479 () Bool)

(assert (=> start!35026 m!351479))

(declare-fun m!351481 () Bool)

(assert (=> start!35026 m!351481))

(declare-fun m!351483 () Bool)

(assert (=> start!35026 m!351483))

(declare-fun m!351485 () Bool)

(assert (=> b!351222 m!351485))

(declare-fun m!351487 () Bool)

(assert (=> b!351219 m!351487))

(check-sat (not b_next!7729) (not start!35026) tp_is_empty!7681 (not b!351219) (not b!351229) b_and!14973 (not mapNonEmpty!12993) (not b!351221) (not b!351220) (not b!351227) (not b!351225) (not b!351222))
(check-sat b_and!14973 (not b_next!7729))
(get-model)

(declare-fun b!351306 () Bool)

(declare-fun e!215133 () Bool)

(declare-fun e!215132 () Bool)

(assert (=> b!351306 (= e!215133 e!215132)))

(declare-fun res!194862 () Bool)

(assert (=> b!351306 (=> (not res!194862) (not e!215132))))

(declare-fun e!215131 () Bool)

(assert (=> b!351306 (= res!194862 (not e!215131))))

(declare-fun res!194860 () Bool)

(assert (=> b!351306 (=> (not res!194860) (not e!215131))))

(assert (=> b!351306 (= res!194860 (validKeyInArray!0 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351307 () Bool)

(declare-fun e!215130 () Bool)

(assert (=> b!351307 (= e!215132 e!215130)))

(declare-fun c!53396 () Bool)

(assert (=> b!351307 (= c!53396 (validKeyInArray!0 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71477 () Bool)

(declare-fun res!194861 () Bool)

(assert (=> d!71477 (=> res!194861 e!215133)))

(assert (=> d!71477 (= res!194861 (bvsge #b00000000000000000000000000000000 (size!9325 _keys!1895)))))

(assert (=> d!71477 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5124) e!215133)))

(declare-fun b!351308 () Bool)

(declare-fun call!26969 () Bool)

(assert (=> b!351308 (= e!215130 call!26969)))

(declare-fun bm!26966 () Bool)

(assert (=> bm!26966 (= call!26969 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53396 (Cons!5123 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000) Nil!5124) Nil!5124)))))

(declare-fun b!351309 () Bool)

(assert (=> b!351309 (= e!215130 call!26969)))

(declare-fun b!351310 () Bool)

(declare-fun contains!2324 (List!5127 (_ BitVec 64)) Bool)

(assert (=> b!351310 (= e!215131 (contains!2324 Nil!5124 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71477 (not res!194861)) b!351306))

(assert (= (and b!351306 res!194860) b!351310))

(assert (= (and b!351306 res!194862) b!351307))

(assert (= (and b!351307 c!53396) b!351308))

(assert (= (and b!351307 (not c!53396)) b!351309))

(assert (= (or b!351308 b!351309) bm!26966))

(declare-fun m!351537 () Bool)

(assert (=> b!351306 m!351537))

(assert (=> b!351306 m!351537))

(declare-fun m!351539 () Bool)

(assert (=> b!351306 m!351539))

(assert (=> b!351307 m!351537))

(assert (=> b!351307 m!351537))

(assert (=> b!351307 m!351539))

(assert (=> bm!26966 m!351537))

(declare-fun m!351541 () Bool)

(assert (=> bm!26966 m!351541))

(assert (=> b!351310 m!351537))

(assert (=> b!351310 m!351537))

(declare-fun m!351543 () Bool)

(assert (=> b!351310 m!351543))

(assert (=> b!351227 d!71477))

(declare-fun d!71479 () Bool)

(declare-fun res!194867 () Bool)

(declare-fun e!215138 () Bool)

(assert (=> d!71479 (=> res!194867 e!215138)))

(assert (=> d!71479 (= res!194867 (= (select (arr!8973 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71479 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215138)))

(declare-fun b!351315 () Bool)

(declare-fun e!215139 () Bool)

(assert (=> b!351315 (= e!215138 e!215139)))

(declare-fun res!194868 () Bool)

(assert (=> b!351315 (=> (not res!194868) (not e!215139))))

(assert (=> b!351315 (= res!194868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9325 _keys!1895)))))

(declare-fun b!351316 () Bool)

(assert (=> b!351316 (= e!215139 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71479 (not res!194867)) b!351315))

(assert (= (and b!351315 res!194868) b!351316))

(assert (=> d!71479 m!351537))

(declare-fun m!351545 () Bool)

(assert (=> b!351316 m!351545))

(assert (=> b!351222 d!71479))

(declare-fun d!71481 () Bool)

(declare-fun lt!164767 () (_ BitVec 32))

(assert (=> d!71481 (and (or (bvslt lt!164767 #b00000000000000000000000000000000) (bvsge lt!164767 (size!9325 _keys!1895)) (and (bvsge lt!164767 #b00000000000000000000000000000000) (bvslt lt!164767 (size!9325 _keys!1895)))) (bvsge lt!164767 #b00000000000000000000000000000000) (bvslt lt!164767 (size!9325 _keys!1895)) (= (select (arr!8973 _keys!1895) lt!164767) k0!1348))))

(declare-fun e!215142 () (_ BitVec 32))

(assert (=> d!71481 (= lt!164767 e!215142)))

(declare-fun c!53399 () Bool)

(assert (=> d!71481 (= c!53399 (= (select (arr!8973 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9325 _keys!1895)) (bvslt (size!9325 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71481 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164767)))

(declare-fun b!351321 () Bool)

(assert (=> b!351321 (= e!215142 #b00000000000000000000000000000000)))

(declare-fun b!351322 () Bool)

(assert (=> b!351322 (= e!215142 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71481 c!53399) b!351321))

(assert (= (and d!71481 (not c!53399)) b!351322))

(declare-fun m!351547 () Bool)

(assert (=> d!71481 m!351547))

(assert (=> d!71481 m!351537))

(declare-fun m!351549 () Bool)

(assert (=> b!351322 m!351549))

(assert (=> b!351221 d!71481))

(declare-fun d!71483 () Bool)

(declare-fun e!215148 () Bool)

(assert (=> d!71483 e!215148))

(declare-fun res!194871 () Bool)

(assert (=> d!71483 (=> res!194871 e!215148)))

(declare-fun lt!164777 () Bool)

(assert (=> d!71483 (= res!194871 (not lt!164777))))

(declare-fun lt!164778 () Bool)

(assert (=> d!71483 (= lt!164777 lt!164778)))

(declare-datatypes ((Unit!10830 0))(
  ( (Unit!10831) )
))
(declare-fun lt!164776 () Unit!10830)

(declare-fun e!215147 () Unit!10830)

(assert (=> d!71483 (= lt!164776 e!215147)))

(declare-fun c!53402 () Bool)

(assert (=> d!71483 (= c!53402 lt!164778)))

(declare-fun containsKey!341 (List!5126 (_ BitVec 64)) Bool)

(assert (=> d!71483 (= lt!164778 (containsKey!341 (toList!2233 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71483 (= (contains!2321 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164777)))

(declare-fun b!351329 () Bool)

(declare-fun lt!164779 () Unit!10830)

(assert (=> b!351329 (= e!215147 lt!164779)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!289 (List!5126 (_ BitVec 64)) Unit!10830)

(assert (=> b!351329 (= lt!164779 (lemmaContainsKeyImpliesGetValueByKeyDefined!289 (toList!2233 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!356 0))(
  ( (Some!355 (v!6076 V!11219)) (None!354) )
))
(declare-fun isDefined!290 (Option!356) Bool)

(declare-fun getValueByKey!350 (List!5126 (_ BitVec 64)) Option!356)

(assert (=> b!351329 (isDefined!290 (getValueByKey!350 (toList!2233 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351330 () Bool)

(declare-fun Unit!10832 () Unit!10830)

(assert (=> b!351330 (= e!215147 Unit!10832)))

(declare-fun b!351331 () Bool)

(assert (=> b!351331 (= e!215148 (isDefined!290 (getValueByKey!350 (toList!2233 (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71483 c!53402) b!351329))

(assert (= (and d!71483 (not c!53402)) b!351330))

(assert (= (and d!71483 (not res!194871)) b!351331))

(declare-fun m!351551 () Bool)

(assert (=> d!71483 m!351551))

(declare-fun m!351553 () Bool)

(assert (=> b!351329 m!351553))

(declare-fun m!351555 () Bool)

(assert (=> b!351329 m!351555))

(assert (=> b!351329 m!351555))

(declare-fun m!351557 () Bool)

(assert (=> b!351329 m!351557))

(assert (=> b!351331 m!351555))

(assert (=> b!351331 m!351555))

(assert (=> b!351331 m!351557))

(assert (=> b!351225 d!71483))

(declare-fun bm!26981 () Bool)

(declare-fun call!26989 () Bool)

(declare-fun lt!164828 () ListLongMap!4435)

(assert (=> bm!26981 (= call!26989 (contains!2321 lt!164828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26982 () Bool)

(declare-fun call!26990 () ListLongMap!4435)

(declare-fun call!26985 () ListLongMap!4435)

(assert (=> bm!26982 (= call!26990 call!26985)))

(declare-fun b!351374 () Bool)

(declare-fun e!215186 () Bool)

(declare-fun call!26984 () Bool)

(assert (=> b!351374 (= e!215186 (not call!26984))))

(declare-fun b!351375 () Bool)

(declare-fun e!215176 () Bool)

(declare-fun apply!291 (ListLongMap!4435 (_ BitVec 64)) V!11219)

(assert (=> b!351375 (= e!215176 (= (apply!291 lt!164828 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!351376 () Bool)

(declare-fun e!215187 () Bool)

(declare-fun e!215178 () Bool)

(assert (=> b!351376 (= e!215187 e!215178)))

(declare-fun c!53419 () Bool)

(assert (=> b!351376 (= c!53419 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26983 () Bool)

(assert (=> bm!26983 (= call!26984 (contains!2321 lt!164828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351377 () Bool)

(declare-fun c!53417 () Bool)

(assert (=> b!351377 (= c!53417 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!215175 () ListLongMap!4435)

(declare-fun e!215180 () ListLongMap!4435)

(assert (=> b!351377 (= e!215175 e!215180)))

(declare-fun b!351378 () Bool)

(declare-fun e!215183 () Unit!10830)

(declare-fun Unit!10833 () Unit!10830)

(assert (=> b!351378 (= e!215183 Unit!10833)))

(declare-fun b!351379 () Bool)

(declare-fun e!215177 () ListLongMap!4435)

(assert (=> b!351379 (= e!215177 e!215175)))

(declare-fun c!53415 () Bool)

(assert (=> b!351379 (= c!53415 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!351380 () Bool)

(declare-fun e!215182 () Bool)

(assert (=> b!351380 (= e!215186 e!215182)))

(declare-fun res!194893 () Bool)

(assert (=> b!351380 (= res!194893 call!26984)))

(assert (=> b!351380 (=> (not res!194893) (not e!215182))))

(declare-fun b!351381 () Bool)

(assert (=> b!351381 (= e!215180 call!26990)))

(declare-fun b!351382 () Bool)

(declare-fun e!215181 () Bool)

(assert (=> b!351382 (= e!215181 (validKeyInArray!0 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351383 () Bool)

(assert (=> b!351383 (= e!215175 call!26990)))

(declare-fun b!351384 () Bool)

(assert (=> b!351384 (= e!215182 (= (apply!291 lt!164828 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!351385 () Bool)

(declare-fun call!26987 () ListLongMap!4435)

(assert (=> b!351385 (= e!215180 call!26987)))

(declare-fun bm!26984 () Bool)

(declare-fun call!26988 () ListLongMap!4435)

(assert (=> bm!26984 (= call!26987 call!26988)))

(declare-fun call!26986 () ListLongMap!4435)

(declare-fun bm!26985 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!607 (array!18936 array!18938 (_ BitVec 32) (_ BitVec 32) V!11219 V!11219 (_ BitVec 32) Int) ListLongMap!4435)

(assert (=> bm!26985 (= call!26986 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26986 () Bool)

(declare-fun c!53418 () Bool)

(declare-fun +!742 (ListLongMap!4435 tuple2!5520) ListLongMap!4435)

(assert (=> bm!26986 (= call!26985 (+!742 (ite c!53418 call!26986 (ite c!53415 call!26988 call!26987)) (ite (or c!53418 c!53415) (tuple2!5521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun e!215184 () Bool)

(declare-fun b!351386 () Bool)

(declare-fun get!4803 (ValueCell!3497 V!11219) V!11219)

(declare-fun dynLambda!634 (Int (_ BitVec 64)) V!11219)

(assert (=> b!351386 (= e!215184 (= (apply!291 lt!164828 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)) (get!4803 (select (arr!8974 _values!1525) #b00000000000000000000000000000000) (dynLambda!634 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351386 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9326 _values!1525)))))

(assert (=> b!351386 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9325 _keys!1895)))))

(declare-fun b!351387 () Bool)

(assert (=> b!351387 (= e!215178 (not call!26989))))

(declare-fun b!351388 () Bool)

(assert (=> b!351388 (= e!215177 (+!742 call!26985 (tuple2!5521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26987 () Bool)

(assert (=> bm!26987 (= call!26988 call!26986)))

(declare-fun b!351389 () Bool)

(declare-fun res!194891 () Bool)

(assert (=> b!351389 (=> (not res!194891) (not e!215187))))

(declare-fun e!215179 () Bool)

(assert (=> b!351389 (= res!194891 e!215179)))

(declare-fun res!194895 () Bool)

(assert (=> b!351389 (=> res!194895 e!215179)))

(assert (=> b!351389 (= res!194895 (not e!215181))))

(declare-fun res!194897 () Bool)

(assert (=> b!351389 (=> (not res!194897) (not e!215181))))

(assert (=> b!351389 (= res!194897 (bvslt #b00000000000000000000000000000000 (size!9325 _keys!1895)))))

(declare-fun d!71485 () Bool)

(assert (=> d!71485 e!215187))

(declare-fun res!194898 () Bool)

(assert (=> d!71485 (=> (not res!194898) (not e!215187))))

(assert (=> d!71485 (= res!194898 (or (bvsge #b00000000000000000000000000000000 (size!9325 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9325 _keys!1895)))))))

(declare-fun lt!164845 () ListLongMap!4435)

(assert (=> d!71485 (= lt!164828 lt!164845)))

(declare-fun lt!164844 () Unit!10830)

(assert (=> d!71485 (= lt!164844 e!215183)))

(declare-fun c!53420 () Bool)

(declare-fun e!215185 () Bool)

(assert (=> d!71485 (= c!53420 e!215185)))

(declare-fun res!194890 () Bool)

(assert (=> d!71485 (=> (not res!194890) (not e!215185))))

(assert (=> d!71485 (= res!194890 (bvslt #b00000000000000000000000000000000 (size!9325 _keys!1895)))))

(assert (=> d!71485 (= lt!164845 e!215177)))

(assert (=> d!71485 (= c!53418 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71485 (validMask!0 mask!2385)))

(assert (=> d!71485 (= (getCurrentListMap!1761 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164828)))

(declare-fun b!351390 () Bool)

(declare-fun res!194892 () Bool)

(assert (=> b!351390 (=> (not res!194892) (not e!215187))))

(assert (=> b!351390 (= res!194892 e!215186)))

(declare-fun c!53416 () Bool)

(assert (=> b!351390 (= c!53416 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!351391 () Bool)

(assert (=> b!351391 (= e!215178 e!215176)))

(declare-fun res!194894 () Bool)

(assert (=> b!351391 (= res!194894 call!26989)))

(assert (=> b!351391 (=> (not res!194894) (not e!215176))))

(declare-fun b!351392 () Bool)

(assert (=> b!351392 (= e!215185 (validKeyInArray!0 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351393 () Bool)

(declare-fun lt!164827 () Unit!10830)

(assert (=> b!351393 (= e!215183 lt!164827)))

(declare-fun lt!164833 () ListLongMap!4435)

(assert (=> b!351393 (= lt!164833 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164824 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164840 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164840 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164839 () Unit!10830)

(declare-fun addStillContains!267 (ListLongMap!4435 (_ BitVec 64) V!11219 (_ BitVec 64)) Unit!10830)

(assert (=> b!351393 (= lt!164839 (addStillContains!267 lt!164833 lt!164824 zeroValue!1467 lt!164840))))

(assert (=> b!351393 (contains!2321 (+!742 lt!164833 (tuple2!5521 lt!164824 zeroValue!1467)) lt!164840)))

(declare-fun lt!164838 () Unit!10830)

(assert (=> b!351393 (= lt!164838 lt!164839)))

(declare-fun lt!164842 () ListLongMap!4435)

(assert (=> b!351393 (= lt!164842 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164834 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164834 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164832 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164832 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164825 () Unit!10830)

(declare-fun addApplyDifferent!267 (ListLongMap!4435 (_ BitVec 64) V!11219 (_ BitVec 64)) Unit!10830)

(assert (=> b!351393 (= lt!164825 (addApplyDifferent!267 lt!164842 lt!164834 minValue!1467 lt!164832))))

(assert (=> b!351393 (= (apply!291 (+!742 lt!164842 (tuple2!5521 lt!164834 minValue!1467)) lt!164832) (apply!291 lt!164842 lt!164832))))

(declare-fun lt!164831 () Unit!10830)

(assert (=> b!351393 (= lt!164831 lt!164825)))

(declare-fun lt!164837 () ListLongMap!4435)

(assert (=> b!351393 (= lt!164837 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164829 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164826 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164826 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164830 () Unit!10830)

(assert (=> b!351393 (= lt!164830 (addApplyDifferent!267 lt!164837 lt!164829 zeroValue!1467 lt!164826))))

(assert (=> b!351393 (= (apply!291 (+!742 lt!164837 (tuple2!5521 lt!164829 zeroValue!1467)) lt!164826) (apply!291 lt!164837 lt!164826))))

(declare-fun lt!164835 () Unit!10830)

(assert (=> b!351393 (= lt!164835 lt!164830)))

(declare-fun lt!164841 () ListLongMap!4435)

(assert (=> b!351393 (= lt!164841 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164843 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164836 () (_ BitVec 64))

(assert (=> b!351393 (= lt!164836 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!351393 (= lt!164827 (addApplyDifferent!267 lt!164841 lt!164843 minValue!1467 lt!164836))))

(assert (=> b!351393 (= (apply!291 (+!742 lt!164841 (tuple2!5521 lt!164843 minValue!1467)) lt!164836) (apply!291 lt!164841 lt!164836))))

(declare-fun b!351394 () Bool)

(assert (=> b!351394 (= e!215179 e!215184)))

(declare-fun res!194896 () Bool)

(assert (=> b!351394 (=> (not res!194896) (not e!215184))))

(assert (=> b!351394 (= res!194896 (contains!2321 lt!164828 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9325 _keys!1895)))))

(assert (= (and d!71485 c!53418) b!351388))

(assert (= (and d!71485 (not c!53418)) b!351379))

(assert (= (and b!351379 c!53415) b!351383))

(assert (= (and b!351379 (not c!53415)) b!351377))

(assert (= (and b!351377 c!53417) b!351381))

(assert (= (and b!351377 (not c!53417)) b!351385))

(assert (= (or b!351381 b!351385) bm!26984))

(assert (= (or b!351383 bm!26984) bm!26987))

(assert (= (or b!351383 b!351381) bm!26982))

(assert (= (or b!351388 bm!26987) bm!26985))

(assert (= (or b!351388 bm!26982) bm!26986))

(assert (= (and d!71485 res!194890) b!351392))

(assert (= (and d!71485 c!53420) b!351393))

(assert (= (and d!71485 (not c!53420)) b!351378))

(assert (= (and d!71485 res!194898) b!351389))

(assert (= (and b!351389 res!194897) b!351382))

(assert (= (and b!351389 (not res!194895)) b!351394))

(assert (= (and b!351394 res!194896) b!351386))

(assert (= (and b!351389 res!194891) b!351390))

(assert (= (and b!351390 c!53416) b!351380))

(assert (= (and b!351390 (not c!53416)) b!351374))

(assert (= (and b!351380 res!194893) b!351384))

(assert (= (or b!351380 b!351374) bm!26983))

(assert (= (and b!351390 res!194892) b!351376))

(assert (= (and b!351376 c!53419) b!351391))

(assert (= (and b!351376 (not c!53419)) b!351387))

(assert (= (and b!351391 res!194894) b!351375))

(assert (= (or b!351391 b!351387) bm!26981))

(declare-fun b_lambda!8525 () Bool)

(assert (=> (not b_lambda!8525) (not b!351386)))

(declare-fun t!10261 () Bool)

(declare-fun tb!3089 () Bool)

(assert (=> (and start!35026 (= defaultEntry!1528 defaultEntry!1528) t!10261) tb!3089))

(declare-fun result!5613 () Bool)

(assert (=> tb!3089 (= result!5613 tp_is_empty!7681)))

(assert (=> b!351386 t!10261))

(declare-fun b_and!14979 () Bool)

(assert (= b_and!14973 (and (=> t!10261 result!5613) b_and!14979)))

(assert (=> b!351394 m!351537))

(assert (=> b!351394 m!351537))

(declare-fun m!351559 () Bool)

(assert (=> b!351394 m!351559))

(declare-fun m!351561 () Bool)

(assert (=> b!351388 m!351561))

(assert (=> b!351392 m!351537))

(assert (=> b!351392 m!351537))

(assert (=> b!351392 m!351539))

(declare-fun m!351563 () Bool)

(assert (=> b!351386 m!351563))

(declare-fun m!351565 () Bool)

(assert (=> b!351386 m!351565))

(assert (=> b!351386 m!351537))

(declare-fun m!351567 () Bool)

(assert (=> b!351386 m!351567))

(assert (=> b!351386 m!351563))

(assert (=> b!351386 m!351565))

(declare-fun m!351569 () Bool)

(assert (=> b!351386 m!351569))

(assert (=> b!351386 m!351537))

(declare-fun m!351571 () Bool)

(assert (=> bm!26981 m!351571))

(declare-fun m!351573 () Bool)

(assert (=> b!351375 m!351573))

(declare-fun m!351575 () Bool)

(assert (=> b!351393 m!351575))

(declare-fun m!351577 () Bool)

(assert (=> b!351393 m!351577))

(declare-fun m!351579 () Bool)

(assert (=> b!351393 m!351579))

(declare-fun m!351581 () Bool)

(assert (=> b!351393 m!351581))

(declare-fun m!351583 () Bool)

(assert (=> b!351393 m!351583))

(declare-fun m!351585 () Bool)

(assert (=> b!351393 m!351585))

(declare-fun m!351587 () Bool)

(assert (=> b!351393 m!351587))

(declare-fun m!351589 () Bool)

(assert (=> b!351393 m!351589))

(declare-fun m!351591 () Bool)

(assert (=> b!351393 m!351591))

(declare-fun m!351593 () Bool)

(assert (=> b!351393 m!351593))

(assert (=> b!351393 m!351591))

(assert (=> b!351393 m!351537))

(assert (=> b!351393 m!351577))

(declare-fun m!351595 () Bool)

(assert (=> b!351393 m!351595))

(declare-fun m!351597 () Bool)

(assert (=> b!351393 m!351597))

(assert (=> b!351393 m!351587))

(declare-fun m!351599 () Bool)

(assert (=> b!351393 m!351599))

(assert (=> b!351393 m!351585))

(declare-fun m!351601 () Bool)

(assert (=> b!351393 m!351601))

(declare-fun m!351603 () Bool)

(assert (=> b!351393 m!351603))

(declare-fun m!351605 () Bool)

(assert (=> b!351393 m!351605))

(declare-fun m!351607 () Bool)

(assert (=> b!351384 m!351607))

(declare-fun m!351609 () Bool)

(assert (=> bm!26986 m!351609))

(assert (=> d!71485 m!351479))

(assert (=> bm!26985 m!351581))

(declare-fun m!351611 () Bool)

(assert (=> bm!26983 m!351611))

(assert (=> b!351382 m!351537))

(assert (=> b!351382 m!351537))

(assert (=> b!351382 m!351539))

(assert (=> b!351225 d!71485))

(declare-fun bm!26990 () Bool)

(declare-fun call!26993 () Bool)

(assert (=> bm!26990 (= call!26993 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71487 () Bool)

(declare-fun res!194903 () Bool)

(declare-fun e!215194 () Bool)

(assert (=> d!71487 (=> res!194903 e!215194)))

(assert (=> d!71487 (= res!194903 (bvsge #b00000000000000000000000000000000 (size!9325 _keys!1895)))))

(assert (=> d!71487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215194)))

(declare-fun b!351405 () Bool)

(declare-fun e!215196 () Bool)

(assert (=> b!351405 (= e!215196 call!26993)))

(declare-fun b!351406 () Bool)

(declare-fun e!215195 () Bool)

(assert (=> b!351406 (= e!215195 e!215196)))

(declare-fun lt!164852 () (_ BitVec 64))

(assert (=> b!351406 (= lt!164852 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164854 () Unit!10830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18936 (_ BitVec 64) (_ BitVec 32)) Unit!10830)

(assert (=> b!351406 (= lt!164854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164852 #b00000000000000000000000000000000))))

(assert (=> b!351406 (arrayContainsKey!0 _keys!1895 lt!164852 #b00000000000000000000000000000000)))

(declare-fun lt!164853 () Unit!10830)

(assert (=> b!351406 (= lt!164853 lt!164854)))

(declare-fun res!194904 () Bool)

(assert (=> b!351406 (= res!194904 (= (seekEntryOrOpen!0 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3408 #b00000000000000000000000000000000)))))

(assert (=> b!351406 (=> (not res!194904) (not e!215196))))

(declare-fun b!351407 () Bool)

(assert (=> b!351407 (= e!215195 call!26993)))

(declare-fun b!351408 () Bool)

(assert (=> b!351408 (= e!215194 e!215195)))

(declare-fun c!53423 () Bool)

(assert (=> b!351408 (= c!53423 (validKeyInArray!0 (select (arr!8973 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71487 (not res!194903)) b!351408))

(assert (= (and b!351408 c!53423) b!351406))

(assert (= (and b!351408 (not c!53423)) b!351407))

(assert (= (and b!351406 res!194904) b!351405))

(assert (= (or b!351405 b!351407) bm!26990))

(declare-fun m!351613 () Bool)

(assert (=> bm!26990 m!351613))

(assert (=> b!351406 m!351537))

(declare-fun m!351615 () Bool)

(assert (=> b!351406 m!351615))

(declare-fun m!351617 () Bool)

(assert (=> b!351406 m!351617))

(assert (=> b!351406 m!351537))

(declare-fun m!351619 () Bool)

(assert (=> b!351406 m!351619))

(assert (=> b!351408 m!351537))

(assert (=> b!351408 m!351537))

(assert (=> b!351408 m!351539))

(assert (=> b!351229 d!71487))

(declare-fun b!351421 () Bool)

(declare-fun e!215205 () SeekEntryResult!3408)

(declare-fun e!215204 () SeekEntryResult!3408)

(assert (=> b!351421 (= e!215205 e!215204)))

(declare-fun lt!164862 () (_ BitVec 64))

(declare-fun lt!164863 () SeekEntryResult!3408)

(assert (=> b!351421 (= lt!164862 (select (arr!8973 _keys!1895) (index!15813 lt!164863)))))

(declare-fun c!53432 () Bool)

(assert (=> b!351421 (= c!53432 (= lt!164862 k0!1348))))

(declare-fun b!351422 () Bool)

(declare-fun e!215203 () SeekEntryResult!3408)

(assert (=> b!351422 (= e!215203 (MissingZero!3408 (index!15813 lt!164863)))))

(declare-fun b!351424 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18936 (_ BitVec 32)) SeekEntryResult!3408)

(assert (=> b!351424 (= e!215203 (seekKeyOrZeroReturnVacant!0 (x!34917 lt!164863) (index!15813 lt!164863) (index!15813 lt!164863) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351425 () Bool)

(assert (=> b!351425 (= e!215205 Undefined!3408)))

(declare-fun b!351426 () Bool)

(assert (=> b!351426 (= e!215204 (Found!3408 (index!15813 lt!164863)))))

(declare-fun d!71489 () Bool)

(declare-fun lt!164861 () SeekEntryResult!3408)

(assert (=> d!71489 (and (or ((_ is Undefined!3408) lt!164861) (not ((_ is Found!3408) lt!164861)) (and (bvsge (index!15812 lt!164861) #b00000000000000000000000000000000) (bvslt (index!15812 lt!164861) (size!9325 _keys!1895)))) (or ((_ is Undefined!3408) lt!164861) ((_ is Found!3408) lt!164861) (not ((_ is MissingZero!3408) lt!164861)) (and (bvsge (index!15811 lt!164861) #b00000000000000000000000000000000) (bvslt (index!15811 lt!164861) (size!9325 _keys!1895)))) (or ((_ is Undefined!3408) lt!164861) ((_ is Found!3408) lt!164861) ((_ is MissingZero!3408) lt!164861) (not ((_ is MissingVacant!3408) lt!164861)) (and (bvsge (index!15814 lt!164861) #b00000000000000000000000000000000) (bvslt (index!15814 lt!164861) (size!9325 _keys!1895)))) (or ((_ is Undefined!3408) lt!164861) (ite ((_ is Found!3408) lt!164861) (= (select (arr!8973 _keys!1895) (index!15812 lt!164861)) k0!1348) (ite ((_ is MissingZero!3408) lt!164861) (= (select (arr!8973 _keys!1895) (index!15811 lt!164861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3408) lt!164861) (= (select (arr!8973 _keys!1895) (index!15814 lt!164861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71489 (= lt!164861 e!215205)))

(declare-fun c!53431 () Bool)

(assert (=> d!71489 (= c!53431 (and ((_ is Intermediate!3408) lt!164863) (undefined!4220 lt!164863)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18936 (_ BitVec 32)) SeekEntryResult!3408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71489 (= lt!164863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71489 (validMask!0 mask!2385)))

(assert (=> d!71489 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164861)))

(declare-fun b!351423 () Bool)

(declare-fun c!53430 () Bool)

(assert (=> b!351423 (= c!53430 (= lt!164862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!351423 (= e!215204 e!215203)))

(assert (= (and d!71489 c!53431) b!351425))

(assert (= (and d!71489 (not c!53431)) b!351421))

(assert (= (and b!351421 c!53432) b!351426))

(assert (= (and b!351421 (not c!53432)) b!351423))

(assert (= (and b!351423 c!53430) b!351422))

(assert (= (and b!351423 (not c!53430)) b!351424))

(declare-fun m!351621 () Bool)

(assert (=> b!351421 m!351621))

(declare-fun m!351623 () Bool)

(assert (=> b!351424 m!351623))

(declare-fun m!351625 () Bool)

(assert (=> d!71489 m!351625))

(declare-fun m!351627 () Bool)

(assert (=> d!71489 m!351627))

(declare-fun m!351629 () Bool)

(assert (=> d!71489 m!351629))

(assert (=> d!71489 m!351479))

(declare-fun m!351631 () Bool)

(assert (=> d!71489 m!351631))

(assert (=> d!71489 m!351627))

(declare-fun m!351633 () Bool)

(assert (=> d!71489 m!351633))

(assert (=> b!351220 d!71489))

(declare-fun d!71491 () Bool)

(assert (=> d!71491 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35026 d!71491))

(declare-fun d!71493 () Bool)

(assert (=> d!71493 (= (array_inv!6628 _values!1525) (bvsge (size!9326 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35026 d!71493))

(declare-fun d!71495 () Bool)

(assert (=> d!71495 (= (array_inv!6629 _keys!1895) (bvsge (size!9325 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35026 d!71495))

(declare-fun d!71497 () Bool)

(assert (=> d!71497 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351219 d!71497))

(declare-fun b!351434 () Bool)

(declare-fun e!215211 () Bool)

(assert (=> b!351434 (= e!215211 tp_is_empty!7681)))

(declare-fun b!351433 () Bool)

(declare-fun e!215210 () Bool)

(assert (=> b!351433 (= e!215210 tp_is_empty!7681)))

(declare-fun mapNonEmpty!13002 () Bool)

(declare-fun mapRes!13002 () Bool)

(declare-fun tp!26781 () Bool)

(assert (=> mapNonEmpty!13002 (= mapRes!13002 (and tp!26781 e!215210))))

(declare-fun mapKey!13002 () (_ BitVec 32))

(declare-fun mapValue!13002 () ValueCell!3497)

(declare-fun mapRest!13002 () (Array (_ BitVec 32) ValueCell!3497))

(assert (=> mapNonEmpty!13002 (= mapRest!12993 (store mapRest!13002 mapKey!13002 mapValue!13002))))

(declare-fun condMapEmpty!13002 () Bool)

(declare-fun mapDefault!13002 () ValueCell!3497)

(assert (=> mapNonEmpty!12993 (= condMapEmpty!13002 (= mapRest!12993 ((as const (Array (_ BitVec 32) ValueCell!3497)) mapDefault!13002)))))

(assert (=> mapNonEmpty!12993 (= tp!26766 (and e!215211 mapRes!13002))))

(declare-fun mapIsEmpty!13002 () Bool)

(assert (=> mapIsEmpty!13002 mapRes!13002))

(assert (= (and mapNonEmpty!12993 condMapEmpty!13002) mapIsEmpty!13002))

(assert (= (and mapNonEmpty!12993 (not condMapEmpty!13002)) mapNonEmpty!13002))

(assert (= (and mapNonEmpty!13002 ((_ is ValueCellFull!3497) mapValue!13002)) b!351433))

(assert (= (and mapNonEmpty!12993 ((_ is ValueCellFull!3497) mapDefault!13002)) b!351434))

(declare-fun m!351635 () Bool)

(assert (=> mapNonEmpty!13002 m!351635))

(declare-fun b_lambda!8527 () Bool)

(assert (= b_lambda!8525 (or (and start!35026 b_free!7729) b_lambda!8527)))

(check-sat (not b_next!7729) (not b!351406) (not b!351322) (not bm!26966) (not b!351394) (not b!351316) (not b!351382) (not bm!26990) (not b!351386) (not d!71485) (not b!351306) (not b!351384) (not mapNonEmpty!13002) (not b!351310) tp_is_empty!7681 (not b!351424) (not b!351375) (not b!351408) (not bm!26985) (not d!71489) b_and!14979 (not bm!26981) (not b!351331) (not b!351393) (not b_lambda!8527) (not d!71483) (not bm!26983) (not b!351329) (not b!351307) (not b!351388) (not bm!26986) (not b!351392))
(check-sat b_and!14979 (not b_next!7729))
