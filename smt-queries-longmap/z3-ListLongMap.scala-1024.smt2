; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21830 () Bool)

(assert start!21830)

(declare-fun b!219337 () Bool)

(declare-fun b_free!5893 () Bool)

(declare-fun b_next!5893 () Bool)

(assert (=> b!219337 (= b_free!5893 (not b_next!5893))))

(declare-fun tp!20820 () Bool)

(declare-fun b_and!12765 () Bool)

(assert (=> b!219337 (= tp!20820 b_and!12765)))

(declare-fun b!219319 () Bool)

(declare-datatypes ((Unit!6495 0))(
  ( (Unit!6496) )
))
(declare-fun e!142656 () Unit!6495)

(declare-fun lt!111780 () Unit!6495)

(assert (=> b!219319 (= e!142656 lt!111780)))

(declare-datatypes ((V!7321 0))(
  ( (V!7322 (val!2922 Int)) )
))
(declare-datatypes ((ValueCell!2534 0))(
  ( (ValueCellFull!2534 (v!4936 V!7321)) (EmptyCell!2534) )
))
(declare-datatypes ((array!10745 0))(
  ( (array!10746 (arr!5091 (Array (_ BitVec 32) ValueCell!2534)) (size!5425 (_ BitVec 32))) )
))
(declare-datatypes ((array!10747 0))(
  ( (array!10748 (arr!5092 (Array (_ BitVec 32) (_ BitVec 64))) (size!5426 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2968 0))(
  ( (LongMapFixedSize!2969 (defaultEntry!4143 Int) (mask!9934 (_ BitVec 32)) (extraKeys!3880 (_ BitVec 32)) (zeroValue!3984 V!7321) (minValue!3984 V!7321) (_size!1533 (_ BitVec 32)) (_keys!6196 array!10747) (_values!4126 array!10745) (_vacant!1533 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2968)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!190 (array!10747 array!10745 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 64) Int) Unit!6495)

(assert (=> b!219319 (= lt!111780 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!190 (_keys!6196 thiss!1504) (_values!4126 thiss!1504) (mask!9934 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) key!932 (defaultEntry!4143 thiss!1504)))))

(declare-fun c!36526 () Bool)

(declare-datatypes ((SeekEntryResult!792 0))(
  ( (MissingZero!792 (index!5338 (_ BitVec 32))) (Found!792 (index!5339 (_ BitVec 32))) (Intermediate!792 (undefined!1604 Bool) (index!5340 (_ BitVec 32)) (x!22899 (_ BitVec 32))) (Undefined!792) (MissingVacant!792 (index!5341 (_ BitVec 32))) )
))
(declare-fun lt!111779 () SeekEntryResult!792)

(get-info :version)

(assert (=> b!219319 (= c!36526 ((_ is MissingZero!792) lt!111779))))

(declare-fun e!142653 () Bool)

(assert (=> b!219319 e!142653))

(declare-fun b!219320 () Bool)

(declare-fun res!107474 () Bool)

(declare-fun e!142652 () Bool)

(assert (=> b!219320 (=> (not res!107474) (not e!142652))))

(assert (=> b!219320 (= res!107474 (= (select (arr!5092 (_keys!6196 thiss!1504)) (index!5338 lt!111779)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219321 () Bool)

(declare-fun res!107468 () Bool)

(declare-fun e!142657 () Bool)

(assert (=> b!219321 (=> (not res!107468) (not e!142657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10747 (_ BitVec 32)) Bool)

(assert (=> b!219321 (= res!107468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6196 thiss!1504) (mask!9934 thiss!1504)))))

(declare-fun b!219322 () Bool)

(assert (=> b!219322 (= e!142657 false)))

(declare-fun lt!111781 () Bool)

(declare-datatypes ((List!3220 0))(
  ( (Nil!3217) (Cons!3216 (h!3864 (_ BitVec 64)) (t!8170 List!3220)) )
))
(declare-fun arrayNoDuplicates!0 (array!10747 (_ BitVec 32) List!3220) Bool)

(assert (=> b!219322 (= lt!111781 (arrayNoDuplicates!0 (_keys!6196 thiss!1504) #b00000000000000000000000000000000 Nil!3217))))

(declare-fun b!219323 () Bool)

(declare-fun Unit!6497 () Unit!6495)

(assert (=> b!219323 (= e!142656 Unit!6497)))

(declare-fun lt!111777 () Unit!6495)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!191 (array!10747 array!10745 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 64) Int) Unit!6495)

(assert (=> b!219323 (= lt!111777 (lemmaInListMapThenSeekEntryOrOpenFindsIt!191 (_keys!6196 thiss!1504) (_values!4126 thiss!1504) (mask!9934 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) key!932 (defaultEntry!4143 thiss!1504)))))

(assert (=> b!219323 false))

(declare-fun b!219324 () Bool)

(declare-fun e!142654 () Bool)

(declare-fun e!142662 () Bool)

(assert (=> b!219324 (= e!142654 e!142662)))

(declare-fun res!107464 () Bool)

(assert (=> b!219324 (=> (not res!107464) (not e!142662))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219324 (= res!107464 (or (= lt!111779 (MissingZero!792 index!297)) (= lt!111779 (MissingVacant!792 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10747 (_ BitVec 32)) SeekEntryResult!792)

(assert (=> b!219324 (= lt!111779 (seekEntryOrOpen!0 key!932 (_keys!6196 thiss!1504) (mask!9934 thiss!1504)))))

(declare-fun bm!20486 () Bool)

(declare-fun call!20490 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20486 (= call!20490 (inRange!0 (ite c!36526 (index!5338 lt!111779) (index!5341 lt!111779)) (mask!9934 thiss!1504)))))

(declare-fun bm!20487 () Bool)

(declare-fun call!20489 () Bool)

(declare-fun arrayContainsKey!0 (array!10747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20487 (= call!20489 (arrayContainsKey!0 (_keys!6196 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219325 () Bool)

(declare-fun res!107469 () Bool)

(assert (=> b!219325 (=> (not res!107469) (not e!142657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219325 (= res!107469 (validMask!0 (mask!9934 thiss!1504)))))

(declare-fun b!219326 () Bool)

(declare-fun e!142659 () Bool)

(assert (=> b!219326 (= e!142659 ((_ is Undefined!792) lt!111779))))

(declare-fun b!219327 () Bool)

(declare-fun e!142658 () Bool)

(declare-fun e!142655 () Bool)

(declare-fun mapRes!9802 () Bool)

(assert (=> b!219327 (= e!142658 (and e!142655 mapRes!9802))))

(declare-fun condMapEmpty!9802 () Bool)

(declare-fun mapDefault!9802 () ValueCell!2534)

(assert (=> b!219327 (= condMapEmpty!9802 (= (arr!5091 (_values!4126 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2534)) mapDefault!9802)))))

(declare-fun b!219328 () Bool)

(declare-fun res!107470 () Bool)

(assert (=> b!219328 (=> (not res!107470) (not e!142654))))

(assert (=> b!219328 (= res!107470 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219329 () Bool)

(declare-fun e!142661 () Bool)

(assert (=> b!219329 (= e!142659 e!142661)))

(declare-fun res!107463 () Bool)

(assert (=> b!219329 (= res!107463 call!20490)))

(assert (=> b!219329 (=> (not res!107463) (not e!142661))))

(declare-fun b!219330 () Bool)

(declare-fun res!107465 () Bool)

(assert (=> b!219330 (=> (not res!107465) (not e!142657))))

(assert (=> b!219330 (= res!107465 (and (= (size!5425 (_values!4126 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9934 thiss!1504))) (= (size!5426 (_keys!6196 thiss!1504)) (size!5425 (_values!4126 thiss!1504))) (bvsge (mask!9934 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3880 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3880 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219331 () Bool)

(assert (=> b!219331 (= e!142661 (not call!20489))))

(declare-fun res!107467 () Bool)

(assert (=> start!21830 (=> (not res!107467) (not e!142654))))

(declare-fun valid!1216 (LongMapFixedSize!2968) Bool)

(assert (=> start!21830 (= res!107467 (valid!1216 thiss!1504))))

(assert (=> start!21830 e!142654))

(declare-fun e!142651 () Bool)

(assert (=> start!21830 e!142651))

(assert (=> start!21830 true))

(declare-fun b!219332 () Bool)

(assert (=> b!219332 (= e!142652 (not call!20489))))

(declare-fun b!219333 () Bool)

(declare-fun res!107473 () Bool)

(assert (=> b!219333 (=> (not res!107473) (not e!142657))))

(assert (=> b!219333 (= res!107473 (arrayContainsKey!0 (_keys!6196 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219334 () Bool)

(declare-fun res!107466 () Bool)

(assert (=> b!219334 (= res!107466 (= (select (arr!5092 (_keys!6196 thiss!1504)) (index!5341 lt!111779)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219334 (=> (not res!107466) (not e!142661))))

(declare-fun b!219335 () Bool)

(assert (=> b!219335 (= e!142662 e!142657)))

(declare-fun res!107471 () Bool)

(assert (=> b!219335 (=> (not res!107471) (not e!142657))))

(assert (=> b!219335 (= res!107471 (inRange!0 index!297 (mask!9934 thiss!1504)))))

(declare-fun lt!111778 () Unit!6495)

(assert (=> b!219335 (= lt!111778 e!142656)))

(declare-fun c!36524 () Bool)

(declare-datatypes ((tuple2!4300 0))(
  ( (tuple2!4301 (_1!2161 (_ BitVec 64)) (_2!2161 V!7321)) )
))
(declare-datatypes ((List!3221 0))(
  ( (Nil!3218) (Cons!3217 (h!3865 tuple2!4300) (t!8171 List!3221)) )
))
(declare-datatypes ((ListLongMap!3203 0))(
  ( (ListLongMap!3204 (toList!1617 List!3221)) )
))
(declare-fun contains!1460 (ListLongMap!3203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1126 (array!10747 array!10745 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 32) Int) ListLongMap!3203)

(assert (=> b!219335 (= c!36524 (contains!1460 (getCurrentListMap!1126 (_keys!6196 thiss!1504) (_values!4126 thiss!1504) (mask!9934 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4143 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9802 () Bool)

(assert (=> mapIsEmpty!9802 mapRes!9802))

(declare-fun mapNonEmpty!9802 () Bool)

(declare-fun tp!20821 () Bool)

(declare-fun e!142650 () Bool)

(assert (=> mapNonEmpty!9802 (= mapRes!9802 (and tp!20821 e!142650))))

(declare-fun mapRest!9802 () (Array (_ BitVec 32) ValueCell!2534))

(declare-fun mapKey!9802 () (_ BitVec 32))

(declare-fun mapValue!9802 () ValueCell!2534)

(assert (=> mapNonEmpty!9802 (= (arr!5091 (_values!4126 thiss!1504)) (store mapRest!9802 mapKey!9802 mapValue!9802))))

(declare-fun b!219336 () Bool)

(declare-fun c!36525 () Bool)

(assert (=> b!219336 (= c!36525 ((_ is MissingVacant!792) lt!111779))))

(assert (=> b!219336 (= e!142653 e!142659)))

(declare-fun tp_is_empty!5755 () Bool)

(declare-fun array_inv!3353 (array!10747) Bool)

(declare-fun array_inv!3354 (array!10745) Bool)

(assert (=> b!219337 (= e!142651 (and tp!20820 tp_is_empty!5755 (array_inv!3353 (_keys!6196 thiss!1504)) (array_inv!3354 (_values!4126 thiss!1504)) e!142658))))

(declare-fun b!219338 () Bool)

(declare-fun res!107472 () Bool)

(assert (=> b!219338 (=> (not res!107472) (not e!142652))))

(assert (=> b!219338 (= res!107472 call!20490)))

(assert (=> b!219338 (= e!142653 e!142652)))

(declare-fun b!219339 () Bool)

(assert (=> b!219339 (= e!142655 tp_is_empty!5755)))

(declare-fun b!219340 () Bool)

(assert (=> b!219340 (= e!142650 tp_is_empty!5755)))

(assert (= (and start!21830 res!107467) b!219328))

(assert (= (and b!219328 res!107470) b!219324))

(assert (= (and b!219324 res!107464) b!219335))

(assert (= (and b!219335 c!36524) b!219323))

(assert (= (and b!219335 (not c!36524)) b!219319))

(assert (= (and b!219319 c!36526) b!219338))

(assert (= (and b!219319 (not c!36526)) b!219336))

(assert (= (and b!219338 res!107472) b!219320))

(assert (= (and b!219320 res!107474) b!219332))

(assert (= (and b!219336 c!36525) b!219329))

(assert (= (and b!219336 (not c!36525)) b!219326))

(assert (= (and b!219329 res!107463) b!219334))

(assert (= (and b!219334 res!107466) b!219331))

(assert (= (or b!219338 b!219329) bm!20486))

(assert (= (or b!219332 b!219331) bm!20487))

(assert (= (and b!219335 res!107471) b!219333))

(assert (= (and b!219333 res!107473) b!219325))

(assert (= (and b!219325 res!107469) b!219330))

(assert (= (and b!219330 res!107465) b!219321))

(assert (= (and b!219321 res!107468) b!219322))

(assert (= (and b!219327 condMapEmpty!9802) mapIsEmpty!9802))

(assert (= (and b!219327 (not condMapEmpty!9802)) mapNonEmpty!9802))

(assert (= (and mapNonEmpty!9802 ((_ is ValueCellFull!2534) mapValue!9802)) b!219340))

(assert (= (and b!219327 ((_ is ValueCellFull!2534) mapDefault!9802)) b!219339))

(assert (= b!219337 b!219327))

(assert (= start!21830 b!219337))

(declare-fun m!244447 () Bool)

(assert (=> b!219324 m!244447))

(declare-fun m!244449 () Bool)

(assert (=> bm!20486 m!244449))

(declare-fun m!244451 () Bool)

(assert (=> b!219337 m!244451))

(declare-fun m!244453 () Bool)

(assert (=> b!219337 m!244453))

(declare-fun m!244455 () Bool)

(assert (=> b!219320 m!244455))

(declare-fun m!244457 () Bool)

(assert (=> b!219335 m!244457))

(declare-fun m!244459 () Bool)

(assert (=> b!219335 m!244459))

(assert (=> b!219335 m!244459))

(declare-fun m!244461 () Bool)

(assert (=> b!219335 m!244461))

(declare-fun m!244463 () Bool)

(assert (=> b!219319 m!244463))

(declare-fun m!244465 () Bool)

(assert (=> b!219321 m!244465))

(declare-fun m!244467 () Bool)

(assert (=> b!219323 m!244467))

(declare-fun m!244469 () Bool)

(assert (=> b!219325 m!244469))

(declare-fun m!244471 () Bool)

(assert (=> mapNonEmpty!9802 m!244471))

(declare-fun m!244473 () Bool)

(assert (=> b!219334 m!244473))

(declare-fun m!244475 () Bool)

(assert (=> start!21830 m!244475))

(declare-fun m!244477 () Bool)

(assert (=> b!219333 m!244477))

(assert (=> bm!20487 m!244477))

(declare-fun m!244479 () Bool)

(assert (=> b!219322 m!244479))

(check-sat (not b!219321) (not b!219333) b_and!12765 (not b!219319) (not bm!20486) (not b!219325) (not b_next!5893) (not b!219322) tp_is_empty!5755 (not start!21830) (not b!219337) (not b!219335) (not bm!20487) (not mapNonEmpty!9802) (not b!219324) (not b!219323))
(check-sat b_and!12765 (not b_next!5893))
