; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34364 () Bool)

(assert start!34364)

(declare-fun b_free!7327 () Bool)

(declare-fun b_next!7327 () Bool)

(assert (=> start!34364 (= b_free!7327 (not b_next!7327))))

(declare-fun tp!25523 () Bool)

(declare-fun b_and!14547 () Bool)

(assert (=> start!34364 (= tp!25523 b_and!14547)))

(declare-fun b!343235 () Bool)

(declare-fun e!210464 () Bool)

(declare-fun tp_is_empty!7279 () Bool)

(assert (=> b!343235 (= e!210464 tp_is_empty!7279)))

(declare-fun b!343236 () Bool)

(declare-datatypes ((Unit!10686 0))(
  ( (Unit!10687) )
))
(declare-fun e!210466 () Unit!10686)

(declare-fun Unit!10688 () Unit!10686)

(assert (=> b!343236 (= e!210466 Unit!10688)))

(declare-fun b!343237 () Bool)

(declare-fun e!210462 () Bool)

(declare-fun e!210465 () Bool)

(assert (=> b!343237 (= e!210462 e!210465)))

(declare-fun res!189759 () Bool)

(assert (=> b!343237 (=> (not res!189759) (not e!210465))))

(declare-datatypes ((SeekEntryResult!3266 0))(
  ( (MissingZero!3266 (index!15243 (_ BitVec 32))) (Found!3266 (index!15244 (_ BitVec 32))) (Intermediate!3266 (undefined!4078 Bool) (index!15245 (_ BitVec 32)) (x!34119 (_ BitVec 32))) (Undefined!3266) (MissingVacant!3266 (index!15246 (_ BitVec 32))) )
))
(declare-fun lt!162462 () SeekEntryResult!3266)

(get-info :version)

(assert (=> b!343237 (= res!189759 (and (not ((_ is Found!3266) lt!162462)) (not ((_ is MissingZero!3266) lt!162462)) ((_ is MissingVacant!3266) lt!162462)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18146 0))(
  ( (array!18147 (arr!8590 (Array (_ BitVec 32) (_ BitVec 64))) (size!8942 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18146)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18146 (_ BitVec 32)) SeekEntryResult!3266)

(assert (=> b!343237 (= lt!162462 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343238 () Bool)

(declare-fun res!189766 () Bool)

(assert (=> b!343238 (=> (not res!189766) (not e!210462))))

(declare-datatypes ((V!10683 0))(
  ( (V!10684 (val!3684 Int)) )
))
(declare-fun zeroValue!1467 () V!10683)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3296 0))(
  ( (ValueCellFull!3296 (v!5860 V!10683)) (EmptyCell!3296) )
))
(declare-datatypes ((array!18148 0))(
  ( (array!18149 (arr!8591 (Array (_ BitVec 32) ValueCell!3296)) (size!8943 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18148)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10683)

(declare-datatypes ((tuple2!5258 0))(
  ( (tuple2!5259 (_1!2640 (_ BitVec 64)) (_2!2640 V!10683)) )
))
(declare-datatypes ((List!4860 0))(
  ( (Nil!4857) (Cons!4856 (h!5712 tuple2!5258) (t!9966 List!4860)) )
))
(declare-datatypes ((ListLongMap!4173 0))(
  ( (ListLongMap!4174 (toList!2102 List!4860)) )
))
(declare-fun contains!2178 (ListLongMap!4173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1631 (array!18146 array!18148 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 32) Int) ListLongMap!4173)

(assert (=> b!343238 (= res!189766 (not (contains!2178 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343239 () Bool)

(declare-fun res!189761 () Bool)

(assert (=> b!343239 (=> (not res!189761) (not e!210462))))

(assert (=> b!343239 (= res!189761 (and (= (size!8943 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8942 _keys!1895) (size!8943 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343240 () Bool)

(declare-fun e!210461 () Bool)

(assert (=> b!343240 (= e!210465 e!210461)))

(declare-fun res!189760 () Bool)

(assert (=> b!343240 (=> (not res!189760) (not e!210461))))

(declare-fun lt!162461 () Bool)

(assert (=> b!343240 (= res!189760 (not lt!162461))))

(declare-fun lt!162460 () Unit!10686)

(assert (=> b!343240 (= lt!162460 e!210466)))

(declare-fun c!52886 () Bool)

(assert (=> b!343240 (= c!52886 lt!162461)))

(declare-fun arrayContainsKey!0 (array!18146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343240 (= lt!162461 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!189767 () Bool)

(assert (=> start!34364 (=> (not res!189767) (not e!210462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34364 (= res!189767 (validMask!0 mask!2385))))

(assert (=> start!34364 e!210462))

(assert (=> start!34364 true))

(assert (=> start!34364 tp_is_empty!7279))

(assert (=> start!34364 tp!25523))

(declare-fun e!210467 () Bool)

(declare-fun array_inv!6350 (array!18148) Bool)

(assert (=> start!34364 (and (array_inv!6350 _values!1525) e!210467)))

(declare-fun array_inv!6351 (array!18146) Bool)

(assert (=> start!34364 (array_inv!6351 _keys!1895)))

(declare-fun mapIsEmpty!12354 () Bool)

(declare-fun mapRes!12354 () Bool)

(assert (=> mapIsEmpty!12354 mapRes!12354))

(declare-fun b!343241 () Bool)

(declare-fun res!189763 () Bool)

(assert (=> b!343241 (=> (not res!189763) (not e!210461))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343241 (= res!189763 (inRange!0 (index!15246 lt!162462) mask!2385))))

(declare-fun b!343242 () Bool)

(declare-fun Unit!10689 () Unit!10686)

(assert (=> b!343242 (= e!210466 Unit!10689)))

(declare-fun lt!162463 () Unit!10686)

(declare-fun lemmaArrayContainsKeyThenInListMap!321 (array!18146 array!18148 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 64) (_ BitVec 32) Int) Unit!10686)

(declare-fun arrayScanForKey!0 (array!18146 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343242 (= lt!162463 (lemmaArrayContainsKeyThenInListMap!321 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343242 false))

(declare-fun b!343243 () Bool)

(declare-fun res!189764 () Bool)

(assert (=> b!343243 (=> (not res!189764) (not e!210462))))

(declare-datatypes ((List!4861 0))(
  ( (Nil!4858) (Cons!4857 (h!5713 (_ BitVec 64)) (t!9967 List!4861)) )
))
(declare-fun arrayNoDuplicates!0 (array!18146 (_ BitVec 32) List!4861) Bool)

(assert (=> b!343243 (= res!189764 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4858))))

(declare-fun b!343244 () Bool)

(declare-fun e!210460 () Bool)

(assert (=> b!343244 (= e!210460 tp_is_empty!7279)))

(declare-fun b!343245 () Bool)

(declare-fun res!189762 () Bool)

(assert (=> b!343245 (=> (not res!189762) (not e!210462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343245 (= res!189762 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12354 () Bool)

(declare-fun tp!25524 () Bool)

(assert (=> mapNonEmpty!12354 (= mapRes!12354 (and tp!25524 e!210460))))

(declare-fun mapRest!12354 () (Array (_ BitVec 32) ValueCell!3296))

(declare-fun mapKey!12354 () (_ BitVec 32))

(declare-fun mapValue!12354 () ValueCell!3296)

(assert (=> mapNonEmpty!12354 (= (arr!8591 _values!1525) (store mapRest!12354 mapKey!12354 mapValue!12354))))

(declare-fun b!343246 () Bool)

(declare-fun res!189765 () Bool)

(assert (=> b!343246 (=> (not res!189765) (not e!210462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18146 (_ BitVec 32)) Bool)

(assert (=> b!343246 (= res!189765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343247 () Bool)

(assert (=> b!343247 (= e!210467 (and e!210464 mapRes!12354))))

(declare-fun condMapEmpty!12354 () Bool)

(declare-fun mapDefault!12354 () ValueCell!3296)

(assert (=> b!343247 (= condMapEmpty!12354 (= (arr!8591 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3296)) mapDefault!12354)))))

(declare-fun b!343248 () Bool)

(assert (=> b!343248 (= e!210461 (and (= (select (arr!8590 _keys!1895) (index!15246 lt!162462)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)) (bvsge (size!8942 _keys!1895) #b01111111111111111111111111111111)))))

(assert (= (and start!34364 res!189767) b!343239))

(assert (= (and b!343239 res!189761) b!343246))

(assert (= (and b!343246 res!189765) b!343243))

(assert (= (and b!343243 res!189764) b!343245))

(assert (= (and b!343245 res!189762) b!343238))

(assert (= (and b!343238 res!189766) b!343237))

(assert (= (and b!343237 res!189759) b!343240))

(assert (= (and b!343240 c!52886) b!343242))

(assert (= (and b!343240 (not c!52886)) b!343236))

(assert (= (and b!343240 res!189760) b!343241))

(assert (= (and b!343241 res!189763) b!343248))

(assert (= (and b!343247 condMapEmpty!12354) mapIsEmpty!12354))

(assert (= (and b!343247 (not condMapEmpty!12354)) mapNonEmpty!12354))

(assert (= (and mapNonEmpty!12354 ((_ is ValueCellFull!3296) mapValue!12354)) b!343244))

(assert (= (and b!343247 ((_ is ValueCellFull!3296) mapDefault!12354)) b!343235))

(assert (= start!34364 b!343247))

(declare-fun m!345429 () Bool)

(assert (=> start!34364 m!345429))

(declare-fun m!345431 () Bool)

(assert (=> start!34364 m!345431))

(declare-fun m!345433 () Bool)

(assert (=> start!34364 m!345433))

(declare-fun m!345435 () Bool)

(assert (=> b!343245 m!345435))

(declare-fun m!345437 () Bool)

(assert (=> b!343238 m!345437))

(assert (=> b!343238 m!345437))

(declare-fun m!345439 () Bool)

(assert (=> b!343238 m!345439))

(declare-fun m!345441 () Bool)

(assert (=> b!343246 m!345441))

(declare-fun m!345443 () Bool)

(assert (=> b!343237 m!345443))

(declare-fun m!345445 () Bool)

(assert (=> b!343242 m!345445))

(assert (=> b!343242 m!345445))

(declare-fun m!345447 () Bool)

(assert (=> b!343242 m!345447))

(declare-fun m!345449 () Bool)

(assert (=> b!343241 m!345449))

(declare-fun m!345451 () Bool)

(assert (=> mapNonEmpty!12354 m!345451))

(declare-fun m!345453 () Bool)

(assert (=> b!343240 m!345453))

(declare-fun m!345455 () Bool)

(assert (=> b!343243 m!345455))

(declare-fun m!345457 () Bool)

(assert (=> b!343248 m!345457))

(check-sat (not b!343241) b_and!14547 (not b_next!7327) (not b!343237) (not mapNonEmpty!12354) (not b!343242) (not b!343238) (not b!343243) (not b!343246) (not b!343245) tp_is_empty!7279 (not start!34364) (not b!343240))
(check-sat b_and!14547 (not b_next!7327))
(get-model)

(declare-fun d!71079 () Bool)

(assert (=> d!71079 (= (inRange!0 (index!15246 lt!162462) mask!2385) (and (bvsge (index!15246 lt!162462) #b00000000000000000000000000000000) (bvslt (index!15246 lt!162462) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!343241 d!71079))

(declare-fun b!343341 () Bool)

(declare-fun e!210522 () Bool)

(declare-fun e!210524 () Bool)

(assert (=> b!343341 (= e!210522 e!210524)))

(declare-fun lt!162495 () (_ BitVec 64))

(assert (=> b!343341 (= lt!162495 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162494 () Unit!10686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18146 (_ BitVec 64) (_ BitVec 32)) Unit!10686)

(assert (=> b!343341 (= lt!162494 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162495 #b00000000000000000000000000000000))))

(assert (=> b!343341 (arrayContainsKey!0 _keys!1895 lt!162495 #b00000000000000000000000000000000)))

(declare-fun lt!162496 () Unit!10686)

(assert (=> b!343341 (= lt!162496 lt!162494)))

(declare-fun res!189827 () Bool)

(assert (=> b!343341 (= res!189827 (= (seekEntryOrOpen!0 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3266 #b00000000000000000000000000000000)))))

(assert (=> b!343341 (=> (not res!189827) (not e!210524))))

(declare-fun bm!26633 () Bool)

(declare-fun call!26636 () Bool)

(assert (=> bm!26633 (= call!26636 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!343342 () Bool)

(assert (=> b!343342 (= e!210522 call!26636)))

(declare-fun b!343343 () Bool)

(assert (=> b!343343 (= e!210524 call!26636)))

(declare-fun d!71081 () Bool)

(declare-fun res!189826 () Bool)

(declare-fun e!210523 () Bool)

(assert (=> d!71081 (=> res!189826 e!210523)))

(assert (=> d!71081 (= res!189826 (bvsge #b00000000000000000000000000000000 (size!8942 _keys!1895)))))

(assert (=> d!71081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!210523)))

(declare-fun b!343344 () Bool)

(assert (=> b!343344 (= e!210523 e!210522)))

(declare-fun c!52895 () Bool)

(assert (=> b!343344 (= c!52895 (validKeyInArray!0 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71081 (not res!189826)) b!343344))

(assert (= (and b!343344 c!52895) b!343341))

(assert (= (and b!343344 (not c!52895)) b!343342))

(assert (= (and b!343341 res!189827) b!343343))

(assert (= (or b!343343 b!343342) bm!26633))

(declare-fun m!345519 () Bool)

(assert (=> b!343341 m!345519))

(declare-fun m!345521 () Bool)

(assert (=> b!343341 m!345521))

(declare-fun m!345523 () Bool)

(assert (=> b!343341 m!345523))

(assert (=> b!343341 m!345519))

(declare-fun m!345525 () Bool)

(assert (=> b!343341 m!345525))

(declare-fun m!345527 () Bool)

(assert (=> bm!26633 m!345527))

(assert (=> b!343344 m!345519))

(assert (=> b!343344 m!345519))

(declare-fun m!345529 () Bool)

(assert (=> b!343344 m!345529))

(assert (=> b!343246 d!71081))

(declare-fun b!343357 () Bool)

(declare-fun e!210532 () SeekEntryResult!3266)

(declare-fun lt!162503 () SeekEntryResult!3266)

(assert (=> b!343357 (= e!210532 (MissingZero!3266 (index!15245 lt!162503)))))

(declare-fun b!343358 () Bool)

(declare-fun e!210531 () SeekEntryResult!3266)

(assert (=> b!343358 (= e!210531 Undefined!3266)))

(declare-fun d!71083 () Bool)

(declare-fun lt!162504 () SeekEntryResult!3266)

(assert (=> d!71083 (and (or ((_ is Undefined!3266) lt!162504) (not ((_ is Found!3266) lt!162504)) (and (bvsge (index!15244 lt!162504) #b00000000000000000000000000000000) (bvslt (index!15244 lt!162504) (size!8942 _keys!1895)))) (or ((_ is Undefined!3266) lt!162504) ((_ is Found!3266) lt!162504) (not ((_ is MissingZero!3266) lt!162504)) (and (bvsge (index!15243 lt!162504) #b00000000000000000000000000000000) (bvslt (index!15243 lt!162504) (size!8942 _keys!1895)))) (or ((_ is Undefined!3266) lt!162504) ((_ is Found!3266) lt!162504) ((_ is MissingZero!3266) lt!162504) (not ((_ is MissingVacant!3266) lt!162504)) (and (bvsge (index!15246 lt!162504) #b00000000000000000000000000000000) (bvslt (index!15246 lt!162504) (size!8942 _keys!1895)))) (or ((_ is Undefined!3266) lt!162504) (ite ((_ is Found!3266) lt!162504) (= (select (arr!8590 _keys!1895) (index!15244 lt!162504)) k0!1348) (ite ((_ is MissingZero!3266) lt!162504) (= (select (arr!8590 _keys!1895) (index!15243 lt!162504)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3266) lt!162504) (= (select (arr!8590 _keys!1895) (index!15246 lt!162504)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71083 (= lt!162504 e!210531)))

(declare-fun c!52904 () Bool)

(assert (=> d!71083 (= c!52904 (and ((_ is Intermediate!3266) lt!162503) (undefined!4078 lt!162503)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18146 (_ BitVec 32)) SeekEntryResult!3266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71083 (= lt!162503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71083 (validMask!0 mask!2385)))

(assert (=> d!71083 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162504)))

(declare-fun b!343359 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18146 (_ BitVec 32)) SeekEntryResult!3266)

(assert (=> b!343359 (= e!210532 (seekKeyOrZeroReturnVacant!0 (x!34119 lt!162503) (index!15245 lt!162503) (index!15245 lt!162503) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343360 () Bool)

(declare-fun c!52903 () Bool)

(declare-fun lt!162505 () (_ BitVec 64))

(assert (=> b!343360 (= c!52903 (= lt!162505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!210533 () SeekEntryResult!3266)

(assert (=> b!343360 (= e!210533 e!210532)))

(declare-fun b!343361 () Bool)

(assert (=> b!343361 (= e!210531 e!210533)))

(assert (=> b!343361 (= lt!162505 (select (arr!8590 _keys!1895) (index!15245 lt!162503)))))

(declare-fun c!52902 () Bool)

(assert (=> b!343361 (= c!52902 (= lt!162505 k0!1348))))

(declare-fun b!343362 () Bool)

(assert (=> b!343362 (= e!210533 (Found!3266 (index!15245 lt!162503)))))

(assert (= (and d!71083 c!52904) b!343358))

(assert (= (and d!71083 (not c!52904)) b!343361))

(assert (= (and b!343361 c!52902) b!343362))

(assert (= (and b!343361 (not c!52902)) b!343360))

(assert (= (and b!343360 c!52903) b!343357))

(assert (= (and b!343360 (not c!52903)) b!343359))

(assert (=> d!71083 m!345429))

(declare-fun m!345531 () Bool)

(assert (=> d!71083 m!345531))

(declare-fun m!345533 () Bool)

(assert (=> d!71083 m!345533))

(declare-fun m!345535 () Bool)

(assert (=> d!71083 m!345535))

(declare-fun m!345537 () Bool)

(assert (=> d!71083 m!345537))

(assert (=> d!71083 m!345535))

(declare-fun m!345539 () Bool)

(assert (=> d!71083 m!345539))

(declare-fun m!345541 () Bool)

(assert (=> b!343359 m!345541))

(declare-fun m!345543 () Bool)

(assert (=> b!343361 m!345543))

(assert (=> b!343237 d!71083))

(declare-fun d!71085 () Bool)

(declare-fun e!210539 () Bool)

(assert (=> d!71085 e!210539))

(declare-fun res!189830 () Bool)

(assert (=> d!71085 (=> res!189830 e!210539)))

(declare-fun lt!162514 () Bool)

(assert (=> d!71085 (= res!189830 (not lt!162514))))

(declare-fun lt!162515 () Bool)

(assert (=> d!71085 (= lt!162514 lt!162515)))

(declare-fun lt!162517 () Unit!10686)

(declare-fun e!210538 () Unit!10686)

(assert (=> d!71085 (= lt!162517 e!210538)))

(declare-fun c!52907 () Bool)

(assert (=> d!71085 (= c!52907 lt!162515)))

(declare-fun containsKey!329 (List!4860 (_ BitVec 64)) Bool)

(assert (=> d!71085 (= lt!162515 (containsKey!329 (toList!2102 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71085 (= (contains!2178 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162514)))

(declare-fun b!343369 () Bool)

(declare-fun lt!162516 () Unit!10686)

(assert (=> b!343369 (= e!210538 lt!162516)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!277 (List!4860 (_ BitVec 64)) Unit!10686)

(assert (=> b!343369 (= lt!162516 (lemmaContainsKeyImpliesGetValueByKeyDefined!277 (toList!2102 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!344 0))(
  ( (Some!343 (v!5863 V!10683)) (None!342) )
))
(declare-fun isDefined!278 (Option!344) Bool)

(declare-fun getValueByKey!338 (List!4860 (_ BitVec 64)) Option!344)

(assert (=> b!343369 (isDefined!278 (getValueByKey!338 (toList!2102 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!343370 () Bool)

(declare-fun Unit!10695 () Unit!10686)

(assert (=> b!343370 (= e!210538 Unit!10695)))

(declare-fun b!343371 () Bool)

(assert (=> b!343371 (= e!210539 (isDefined!278 (getValueByKey!338 (toList!2102 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71085 c!52907) b!343369))

(assert (= (and d!71085 (not c!52907)) b!343370))

(assert (= (and d!71085 (not res!189830)) b!343371))

(declare-fun m!345545 () Bool)

(assert (=> d!71085 m!345545))

(declare-fun m!345547 () Bool)

(assert (=> b!343369 m!345547))

(declare-fun m!345549 () Bool)

(assert (=> b!343369 m!345549))

(assert (=> b!343369 m!345549))

(declare-fun m!345551 () Bool)

(assert (=> b!343369 m!345551))

(assert (=> b!343371 m!345549))

(assert (=> b!343371 m!345549))

(assert (=> b!343371 m!345551))

(assert (=> b!343238 d!71085))

(declare-fun b!343414 () Bool)

(declare-fun c!52924 () Bool)

(assert (=> b!343414 (= c!52924 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!210566 () ListLongMap!4173)

(declare-fun e!210575 () ListLongMap!4173)

(assert (=> b!343414 (= e!210566 e!210575)))

(declare-fun b!343415 () Bool)

(declare-fun e!210570 () ListLongMap!4173)

(assert (=> b!343415 (= e!210570 e!210566)))

(declare-fun c!52923 () Bool)

(assert (=> b!343415 (= c!52923 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26648 () Bool)

(declare-fun call!26651 () ListLongMap!4173)

(declare-fun call!26657 () ListLongMap!4173)

(assert (=> bm!26648 (= call!26651 call!26657)))

(declare-fun b!343416 () Bool)

(declare-fun e!210567 () Bool)

(declare-fun e!210573 () Bool)

(assert (=> b!343416 (= e!210567 e!210573)))

(declare-fun c!52921 () Bool)

(assert (=> b!343416 (= c!52921 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343417 () Bool)

(declare-fun e!210577 () Bool)

(declare-fun call!26653 () Bool)

(assert (=> b!343417 (= e!210577 (not call!26653))))

(declare-fun d!71087 () Bool)

(assert (=> d!71087 e!210567))

(declare-fun res!189851 () Bool)

(assert (=> d!71087 (=> (not res!189851) (not e!210567))))

(assert (=> d!71087 (= res!189851 (or (bvsge #b00000000000000000000000000000000 (size!8942 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)))))))

(declare-fun lt!162573 () ListLongMap!4173)

(declare-fun lt!162578 () ListLongMap!4173)

(assert (=> d!71087 (= lt!162573 lt!162578)))

(declare-fun lt!162565 () Unit!10686)

(declare-fun e!210568 () Unit!10686)

(assert (=> d!71087 (= lt!162565 e!210568)))

(declare-fun c!52922 () Bool)

(declare-fun e!210578 () Bool)

(assert (=> d!71087 (= c!52922 e!210578)))

(declare-fun res!189856 () Bool)

(assert (=> d!71087 (=> (not res!189856) (not e!210578))))

(assert (=> d!71087 (= res!189856 (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)))))

(assert (=> d!71087 (= lt!162578 e!210570)))

(declare-fun c!52925 () Bool)

(assert (=> d!71087 (= c!52925 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71087 (validMask!0 mask!2385)))

(assert (=> d!71087 (= (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162573)))

(declare-fun b!343418 () Bool)

(declare-fun e!210569 () Bool)

(declare-fun e!210576 () Bool)

(assert (=> b!343418 (= e!210569 e!210576)))

(declare-fun res!189850 () Bool)

(assert (=> b!343418 (=> (not res!189850) (not e!210576))))

(assert (=> b!343418 (= res!189850 (contains!2178 lt!162573 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!343418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)))))

(declare-fun b!343419 () Bool)

(declare-fun res!189853 () Bool)

(assert (=> b!343419 (=> (not res!189853) (not e!210567))))

(assert (=> b!343419 (= res!189853 e!210569)))

(declare-fun res!189852 () Bool)

(assert (=> b!343419 (=> res!189852 e!210569)))

(declare-fun e!210572 () Bool)

(assert (=> b!343419 (= res!189852 (not e!210572))))

(declare-fun res!189854 () Bool)

(assert (=> b!343419 (=> (not res!189854) (not e!210572))))

(assert (=> b!343419 (= res!189854 (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)))))

(declare-fun bm!26649 () Bool)

(declare-fun call!26654 () ListLongMap!4173)

(declare-fun call!26656 () ListLongMap!4173)

(assert (=> bm!26649 (= call!26654 call!26656)))

(declare-fun b!343420 () Bool)

(declare-fun Unit!10696 () Unit!10686)

(assert (=> b!343420 (= e!210568 Unit!10696)))

(declare-fun b!343421 () Bool)

(declare-fun lt!162570 () Unit!10686)

(assert (=> b!343421 (= e!210568 lt!162570)))

(declare-fun lt!162562 () ListLongMap!4173)

(declare-fun getCurrentListMapNoExtraKeys!595 (array!18146 array!18148 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 32) Int) ListLongMap!4173)

(assert (=> b!343421 (= lt!162562 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162567 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162564 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162564 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162572 () Unit!10686)

(declare-fun addStillContains!255 (ListLongMap!4173 (_ BitVec 64) V!10683 (_ BitVec 64)) Unit!10686)

(assert (=> b!343421 (= lt!162572 (addStillContains!255 lt!162562 lt!162567 zeroValue!1467 lt!162564))))

(declare-fun +!730 (ListLongMap!4173 tuple2!5258) ListLongMap!4173)

(assert (=> b!343421 (contains!2178 (+!730 lt!162562 (tuple2!5259 lt!162567 zeroValue!1467)) lt!162564)))

(declare-fun lt!162575 () Unit!10686)

(assert (=> b!343421 (= lt!162575 lt!162572)))

(declare-fun lt!162568 () ListLongMap!4173)

(assert (=> b!343421 (= lt!162568 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162583 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162583 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162576 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162576 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162574 () Unit!10686)

(declare-fun addApplyDifferent!255 (ListLongMap!4173 (_ BitVec 64) V!10683 (_ BitVec 64)) Unit!10686)

(assert (=> b!343421 (= lt!162574 (addApplyDifferent!255 lt!162568 lt!162583 minValue!1467 lt!162576))))

(declare-fun apply!279 (ListLongMap!4173 (_ BitVec 64)) V!10683)

(assert (=> b!343421 (= (apply!279 (+!730 lt!162568 (tuple2!5259 lt!162583 minValue!1467)) lt!162576) (apply!279 lt!162568 lt!162576))))

(declare-fun lt!162569 () Unit!10686)

(assert (=> b!343421 (= lt!162569 lt!162574)))

(declare-fun lt!162577 () ListLongMap!4173)

(assert (=> b!343421 (= lt!162577 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162571 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162571 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162579 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162579 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162580 () Unit!10686)

(assert (=> b!343421 (= lt!162580 (addApplyDifferent!255 lt!162577 lt!162571 zeroValue!1467 lt!162579))))

(assert (=> b!343421 (= (apply!279 (+!730 lt!162577 (tuple2!5259 lt!162571 zeroValue!1467)) lt!162579) (apply!279 lt!162577 lt!162579))))

(declare-fun lt!162582 () Unit!10686)

(assert (=> b!343421 (= lt!162582 lt!162580)))

(declare-fun lt!162581 () ListLongMap!4173)

(assert (=> b!343421 (= lt!162581 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162563 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162563 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162566 () (_ BitVec 64))

(assert (=> b!343421 (= lt!162566 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!343421 (= lt!162570 (addApplyDifferent!255 lt!162581 lt!162563 minValue!1467 lt!162566))))

(assert (=> b!343421 (= (apply!279 (+!730 lt!162581 (tuple2!5259 lt!162563 minValue!1467)) lt!162566) (apply!279 lt!162581 lt!162566))))

(declare-fun b!343422 () Bool)

(assert (=> b!343422 (= e!210566 call!26651)))

(declare-fun b!343423 () Bool)

(declare-fun e!210574 () Bool)

(assert (=> b!343423 (= e!210574 (= (apply!279 lt!162573 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!343424 () Bool)

(assert (=> b!343424 (= e!210572 (validKeyInArray!0 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343425 () Bool)

(declare-fun get!4657 (ValueCell!3296 V!10683) V!10683)

(declare-fun dynLambda!622 (Int (_ BitVec 64)) V!10683)

(assert (=> b!343425 (= e!210576 (= (apply!279 lt!162573 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)) (get!4657 (select (arr!8591 _values!1525) #b00000000000000000000000000000000) (dynLambda!622 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8943 _values!1525)))))

(assert (=> b!343425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)))))

(declare-fun bm!26650 () Bool)

(assert (=> bm!26650 (= call!26653 (contains!2178 lt!162573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343426 () Bool)

(assert (=> b!343426 (= e!210575 call!26654)))

(declare-fun b!343427 () Bool)

(assert (=> b!343427 (= e!210573 e!210574)))

(declare-fun res!189849 () Bool)

(declare-fun call!26655 () Bool)

(assert (=> b!343427 (= res!189849 call!26655)))

(assert (=> b!343427 (=> (not res!189849) (not e!210574))))

(declare-fun bm!26651 () Bool)

(assert (=> bm!26651 (= call!26655 (contains!2178 lt!162573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343428 () Bool)

(assert (=> b!343428 (= e!210575 call!26651)))

(declare-fun b!343429 () Bool)

(declare-fun e!210571 () Bool)

(assert (=> b!343429 (= e!210577 e!210571)))

(declare-fun res!189857 () Bool)

(assert (=> b!343429 (= res!189857 call!26653)))

(assert (=> b!343429 (=> (not res!189857) (not e!210571))))

(declare-fun b!343430 () Bool)

(assert (=> b!343430 (= e!210573 (not call!26655))))

(declare-fun bm!26652 () Bool)

(declare-fun call!26652 () ListLongMap!4173)

(assert (=> bm!26652 (= call!26657 (+!730 (ite c!52925 call!26652 (ite c!52923 call!26656 call!26654)) (ite (or c!52925 c!52923) (tuple2!5259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5259 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!343431 () Bool)

(assert (=> b!343431 (= e!210571 (= (apply!279 lt!162573 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!343432 () Bool)

(assert (=> b!343432 (= e!210570 (+!730 call!26657 (tuple2!5259 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!343433 () Bool)

(declare-fun res!189855 () Bool)

(assert (=> b!343433 (=> (not res!189855) (not e!210567))))

(assert (=> b!343433 (= res!189855 e!210577)))

(declare-fun c!52920 () Bool)

(assert (=> b!343433 (= c!52920 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!343434 () Bool)

(assert (=> b!343434 (= e!210578 (validKeyInArray!0 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26653 () Bool)

(assert (=> bm!26653 (= call!26656 call!26652)))

(declare-fun bm!26654 () Bool)

(assert (=> bm!26654 (= call!26652 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and d!71087 c!52925) b!343432))

(assert (= (and d!71087 (not c!52925)) b!343415))

(assert (= (and b!343415 c!52923) b!343422))

(assert (= (and b!343415 (not c!52923)) b!343414))

(assert (= (and b!343414 c!52924) b!343428))

(assert (= (and b!343414 (not c!52924)) b!343426))

(assert (= (or b!343428 b!343426) bm!26649))

(assert (= (or b!343422 bm!26649) bm!26653))

(assert (= (or b!343422 b!343428) bm!26648))

(assert (= (or b!343432 bm!26653) bm!26654))

(assert (= (or b!343432 bm!26648) bm!26652))

(assert (= (and d!71087 res!189856) b!343434))

(assert (= (and d!71087 c!52922) b!343421))

(assert (= (and d!71087 (not c!52922)) b!343420))

(assert (= (and d!71087 res!189851) b!343419))

(assert (= (and b!343419 res!189854) b!343424))

(assert (= (and b!343419 (not res!189852)) b!343418))

(assert (= (and b!343418 res!189850) b!343425))

(assert (= (and b!343419 res!189853) b!343433))

(assert (= (and b!343433 c!52920) b!343429))

(assert (= (and b!343433 (not c!52920)) b!343417))

(assert (= (and b!343429 res!189857) b!343431))

(assert (= (or b!343429 b!343417) bm!26650))

(assert (= (and b!343433 res!189855) b!343416))

(assert (= (and b!343416 c!52921) b!343427))

(assert (= (and b!343416 (not c!52921)) b!343430))

(assert (= (and b!343427 res!189849) b!343423))

(assert (= (or b!343427 b!343430) bm!26651))

(declare-fun b_lambda!8477 () Bool)

(assert (=> (not b_lambda!8477) (not b!343425)))

(declare-fun t!9969 () Bool)

(declare-fun tb!3065 () Bool)

(assert (=> (and start!34364 (= defaultEntry!1528 defaultEntry!1528) t!9969) tb!3065))

(declare-fun result!5541 () Bool)

(assert (=> tb!3065 (= result!5541 tp_is_empty!7279)))

(assert (=> b!343425 t!9969))

(declare-fun b_and!14553 () Bool)

(assert (= b_and!14547 (and (=> t!9969 result!5541) b_and!14553)))

(declare-fun m!345553 () Bool)

(assert (=> bm!26651 m!345553))

(assert (=> d!71087 m!345429))

(declare-fun m!345555 () Bool)

(assert (=> b!343431 m!345555))

(declare-fun m!345557 () Bool)

(assert (=> b!343421 m!345557))

(declare-fun m!345559 () Bool)

(assert (=> b!343421 m!345559))

(declare-fun m!345561 () Bool)

(assert (=> b!343421 m!345561))

(declare-fun m!345563 () Bool)

(assert (=> b!343421 m!345563))

(declare-fun m!345565 () Bool)

(assert (=> b!343421 m!345565))

(declare-fun m!345567 () Bool)

(assert (=> b!343421 m!345567))

(assert (=> b!343421 m!345557))

(declare-fun m!345569 () Bool)

(assert (=> b!343421 m!345569))

(declare-fun m!345571 () Bool)

(assert (=> b!343421 m!345571))

(assert (=> b!343421 m!345565))

(declare-fun m!345573 () Bool)

(assert (=> b!343421 m!345573))

(declare-fun m!345575 () Bool)

(assert (=> b!343421 m!345575))

(declare-fun m!345577 () Bool)

(assert (=> b!343421 m!345577))

(declare-fun m!345579 () Bool)

(assert (=> b!343421 m!345579))

(assert (=> b!343421 m!345559))

(declare-fun m!345581 () Bool)

(assert (=> b!343421 m!345581))

(declare-fun m!345583 () Bool)

(assert (=> b!343421 m!345583))

(assert (=> b!343421 m!345519))

(declare-fun m!345585 () Bool)

(assert (=> b!343421 m!345585))

(declare-fun m!345587 () Bool)

(assert (=> b!343421 m!345587))

(assert (=> b!343421 m!345575))

(declare-fun m!345589 () Bool)

(assert (=> b!343432 m!345589))

(assert (=> b!343424 m!345519))

(assert (=> b!343424 m!345519))

(assert (=> b!343424 m!345529))

(declare-fun m!345591 () Bool)

(assert (=> bm!26652 m!345591))

(declare-fun m!345593 () Bool)

(assert (=> b!343423 m!345593))

(assert (=> bm!26654 m!345587))

(assert (=> b!343418 m!345519))

(assert (=> b!343418 m!345519))

(declare-fun m!345595 () Bool)

(assert (=> b!343418 m!345595))

(assert (=> b!343425 m!345519))

(declare-fun m!345597 () Bool)

(assert (=> b!343425 m!345597))

(declare-fun m!345599 () Bool)

(assert (=> b!343425 m!345599))

(declare-fun m!345601 () Bool)

(assert (=> b!343425 m!345601))

(assert (=> b!343425 m!345519))

(declare-fun m!345603 () Bool)

(assert (=> b!343425 m!345603))

(assert (=> b!343425 m!345599))

(assert (=> b!343425 m!345597))

(assert (=> b!343434 m!345519))

(assert (=> b!343434 m!345519))

(assert (=> b!343434 m!345529))

(declare-fun m!345605 () Bool)

(assert (=> bm!26650 m!345605))

(assert (=> b!343238 d!71087))

(declare-fun d!71089 () Bool)

(assert (=> d!71089 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34364 d!71089))

(declare-fun d!71091 () Bool)

(assert (=> d!71091 (= (array_inv!6350 _values!1525) (bvsge (size!8943 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34364 d!71091))

(declare-fun d!71093 () Bool)

(assert (=> d!71093 (= (array_inv!6351 _keys!1895) (bvsge (size!8942 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34364 d!71093))

(declare-fun d!71095 () Bool)

(assert (=> d!71095 (contains!2178 (getCurrentListMap!1631 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162586 () Unit!10686)

(declare-fun choose!1312 (array!18146 array!18148 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 64) (_ BitVec 32) Int) Unit!10686)

(assert (=> d!71095 (= lt!162586 (choose!1312 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71095 (validMask!0 mask!2385)))

(assert (=> d!71095 (= (lemmaArrayContainsKeyThenInListMap!321 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162586)))

(declare-fun bs!11782 () Bool)

(assert (= bs!11782 d!71095))

(assert (=> bs!11782 m!345437))

(assert (=> bs!11782 m!345437))

(assert (=> bs!11782 m!345439))

(assert (=> bs!11782 m!345445))

(declare-fun m!345607 () Bool)

(assert (=> bs!11782 m!345607))

(assert (=> bs!11782 m!345429))

(assert (=> b!343242 d!71095))

(declare-fun d!71097 () Bool)

(declare-fun lt!162589 () (_ BitVec 32))

(assert (=> d!71097 (and (or (bvslt lt!162589 #b00000000000000000000000000000000) (bvsge lt!162589 (size!8942 _keys!1895)) (and (bvsge lt!162589 #b00000000000000000000000000000000) (bvslt lt!162589 (size!8942 _keys!1895)))) (bvsge lt!162589 #b00000000000000000000000000000000) (bvslt lt!162589 (size!8942 _keys!1895)) (= (select (arr!8590 _keys!1895) lt!162589) k0!1348))))

(declare-fun e!210581 () (_ BitVec 32))

(assert (=> d!71097 (= lt!162589 e!210581)))

(declare-fun c!52928 () Bool)

(assert (=> d!71097 (= c!52928 (= (select (arr!8590 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8942 _keys!1895)) (bvslt (size!8942 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71097 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162589)))

(declare-fun b!343441 () Bool)

(assert (=> b!343441 (= e!210581 #b00000000000000000000000000000000)))

(declare-fun b!343442 () Bool)

(assert (=> b!343442 (= e!210581 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71097 c!52928) b!343441))

(assert (= (and d!71097 (not c!52928)) b!343442))

(declare-fun m!345609 () Bool)

(assert (=> d!71097 m!345609))

(assert (=> d!71097 m!345519))

(declare-fun m!345611 () Bool)

(assert (=> b!343442 m!345611))

(assert (=> b!343242 d!71097))

(declare-fun b!343454 () Bool)

(declare-fun e!210590 () Bool)

(declare-fun contains!2179 (List!4861 (_ BitVec 64)) Bool)

(assert (=> b!343454 (= e!210590 (contains!2179 Nil!4858 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343455 () Bool)

(declare-fun e!210592 () Bool)

(declare-fun call!26660 () Bool)

(assert (=> b!343455 (= e!210592 call!26660)))

(declare-fun bm!26657 () Bool)

(declare-fun c!52931 () Bool)

(assert (=> bm!26657 (= call!26660 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52931 (Cons!4857 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000) Nil!4858) Nil!4858)))))

(declare-fun d!71099 () Bool)

(declare-fun res!189865 () Bool)

(declare-fun e!210591 () Bool)

(assert (=> d!71099 (=> res!189865 e!210591)))

(assert (=> d!71099 (= res!189865 (bvsge #b00000000000000000000000000000000 (size!8942 _keys!1895)))))

(assert (=> d!71099 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4858) e!210591)))

(declare-fun b!343453 () Bool)

(declare-fun e!210593 () Bool)

(assert (=> b!343453 (= e!210591 e!210593)))

(declare-fun res!189864 () Bool)

(assert (=> b!343453 (=> (not res!189864) (not e!210593))))

(assert (=> b!343453 (= res!189864 (not e!210590))))

(declare-fun res!189866 () Bool)

(assert (=> b!343453 (=> (not res!189866) (not e!210590))))

(assert (=> b!343453 (= res!189866 (validKeyInArray!0 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343456 () Bool)

(assert (=> b!343456 (= e!210592 call!26660)))

(declare-fun b!343457 () Bool)

(assert (=> b!343457 (= e!210593 e!210592)))

(assert (=> b!343457 (= c!52931 (validKeyInArray!0 (select (arr!8590 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71099 (not res!189865)) b!343453))

(assert (= (and b!343453 res!189866) b!343454))

(assert (= (and b!343453 res!189864) b!343457))

(assert (= (and b!343457 c!52931) b!343456))

(assert (= (and b!343457 (not c!52931)) b!343455))

(assert (= (or b!343456 b!343455) bm!26657))

(assert (=> b!343454 m!345519))

(assert (=> b!343454 m!345519))

(declare-fun m!345613 () Bool)

(assert (=> b!343454 m!345613))

(assert (=> bm!26657 m!345519))

(declare-fun m!345615 () Bool)

(assert (=> bm!26657 m!345615))

(assert (=> b!343453 m!345519))

(assert (=> b!343453 m!345519))

(assert (=> b!343453 m!345529))

(assert (=> b!343457 m!345519))

(assert (=> b!343457 m!345519))

(assert (=> b!343457 m!345529))

(assert (=> b!343243 d!71099))

(declare-fun d!71101 () Bool)

(declare-fun res!189871 () Bool)

(declare-fun e!210598 () Bool)

(assert (=> d!71101 (=> res!189871 e!210598)))

(assert (=> d!71101 (= res!189871 (= (select (arr!8590 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71101 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!210598)))

(declare-fun b!343462 () Bool)

(declare-fun e!210599 () Bool)

(assert (=> b!343462 (= e!210598 e!210599)))

(declare-fun res!189872 () Bool)

(assert (=> b!343462 (=> (not res!189872) (not e!210599))))

(assert (=> b!343462 (= res!189872 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8942 _keys!1895)))))

(declare-fun b!343463 () Bool)

(assert (=> b!343463 (= e!210599 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71101 (not res!189871)) b!343462))

(assert (= (and b!343462 res!189872) b!343463))

(assert (=> d!71101 m!345519))

(declare-fun m!345617 () Bool)

(assert (=> b!343463 m!345617))

(assert (=> b!343240 d!71101))

(declare-fun d!71103 () Bool)

(assert (=> d!71103 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343245 d!71103))

(declare-fun b!343470 () Bool)

(declare-fun e!210605 () Bool)

(assert (=> b!343470 (= e!210605 tp_is_empty!7279)))

(declare-fun mapIsEmpty!12363 () Bool)

(declare-fun mapRes!12363 () Bool)

(assert (=> mapIsEmpty!12363 mapRes!12363))

(declare-fun b!343471 () Bool)

(declare-fun e!210604 () Bool)

(assert (=> b!343471 (= e!210604 tp_is_empty!7279)))

(declare-fun mapNonEmpty!12363 () Bool)

(declare-fun tp!25539 () Bool)

(assert (=> mapNonEmpty!12363 (= mapRes!12363 (and tp!25539 e!210605))))

(declare-fun mapValue!12363 () ValueCell!3296)

(declare-fun mapRest!12363 () (Array (_ BitVec 32) ValueCell!3296))

(declare-fun mapKey!12363 () (_ BitVec 32))

(assert (=> mapNonEmpty!12363 (= mapRest!12354 (store mapRest!12363 mapKey!12363 mapValue!12363))))

(declare-fun condMapEmpty!12363 () Bool)

(declare-fun mapDefault!12363 () ValueCell!3296)

(assert (=> mapNonEmpty!12354 (= condMapEmpty!12363 (= mapRest!12354 ((as const (Array (_ BitVec 32) ValueCell!3296)) mapDefault!12363)))))

(assert (=> mapNonEmpty!12354 (= tp!25524 (and e!210604 mapRes!12363))))

(assert (= (and mapNonEmpty!12354 condMapEmpty!12363) mapIsEmpty!12363))

(assert (= (and mapNonEmpty!12354 (not condMapEmpty!12363)) mapNonEmpty!12363))

(assert (= (and mapNonEmpty!12363 ((_ is ValueCellFull!3296) mapValue!12363)) b!343470))

(assert (= (and mapNonEmpty!12354 ((_ is ValueCellFull!3296) mapDefault!12363)) b!343471))

(declare-fun m!345619 () Bool)

(assert (=> mapNonEmpty!12363 m!345619))

(declare-fun b_lambda!8479 () Bool)

(assert (= b_lambda!8477 (or (and start!34364 b_free!7327) b_lambda!8479)))

(check-sat b_and!14553 (not bm!26652) (not bm!26657) (not b!343423) (not b!343424) (not b!343359) (not b!343344) (not d!71085) (not b!343341) (not d!71083) (not b!343442) (not b_lambda!8479) (not mapNonEmpty!12363) (not b!343425) (not b!343421) (not d!71095) (not b!343369) (not bm!26651) (not b!343432) tp_is_empty!7279 (not d!71087) (not b_next!7327) (not b!343463) (not b!343431) (not b!343454) (not b!343453) (not b!343434) (not bm!26633) (not bm!26650) (not b!343418) (not bm!26654) (not b!343371) (not b!343457))
(check-sat b_and!14553 (not b_next!7327))
