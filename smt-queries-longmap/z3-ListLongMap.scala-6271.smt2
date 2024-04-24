; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80402 () Bool)

(assert start!80402)

(declare-fun b!943355 () Bool)

(declare-fun b_free!17947 () Bool)

(declare-fun b_next!17947 () Bool)

(assert (=> b!943355 (= b_free!17947 (not b_next!17947))))

(declare-fun tp!62344 () Bool)

(declare-fun b_and!29369 () Bool)

(assert (=> b!943355 (= tp!62344 b_and!29369)))

(declare-fun b!943350 () Bool)

(declare-fun res!633654 () Bool)

(declare-fun e!530477 () Bool)

(assert (=> b!943350 (=> (not res!633654) (not e!530477))))

(declare-datatypes ((V!32239 0))(
  ( (V!32240 (val!10278 Int)) )
))
(declare-datatypes ((ValueCell!9746 0))(
  ( (ValueCellFull!9746 (v!12806 V!32239)) (EmptyCell!9746) )
))
(declare-datatypes ((array!56925 0))(
  ( (array!56926 (arr!27385 (Array (_ BitVec 32) ValueCell!9746)) (size!27851 (_ BitVec 32))) )
))
(declare-datatypes ((array!56927 0))(
  ( (array!56928 (arr!27386 (Array (_ BitVec 32) (_ BitVec 64))) (size!27852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4642 0))(
  ( (LongMapFixedSize!4643 (defaultEntry!5612 Int) (mask!27262 (_ BitVec 32)) (extraKeys!5344 (_ BitVec 32)) (zeroValue!5448 V!32239) (minValue!5448 V!32239) (_size!2376 (_ BitVec 32)) (_keys!10512 array!56927) (_values!5635 array!56925) (_vacant!2376 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4642)

(assert (=> b!943350 (= res!633654 (and (= (size!27851 (_values!5635 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27262 thiss!1141))) (= (size!27852 (_keys!10512 thiss!1141)) (size!27851 (_values!5635 thiss!1141))) (bvsge (mask!27262 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5344 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5344 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32501 () Bool)

(declare-fun mapRes!32501 () Bool)

(assert (=> mapIsEmpty!32501 mapRes!32501))

(declare-fun b!943351 () Bool)

(declare-fun e!530479 () Bool)

(declare-fun e!530478 () Bool)

(assert (=> b!943351 (= e!530479 (and e!530478 mapRes!32501))))

(declare-fun condMapEmpty!32501 () Bool)

(declare-fun mapDefault!32501 () ValueCell!9746)

(assert (=> b!943351 (= condMapEmpty!32501 (= (arr!27385 (_values!5635 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9746)) mapDefault!32501)))))

(declare-fun b!943352 () Bool)

(assert (=> b!943352 (= e!530477 (bvsgt #b00000000000000000000000000000000 (size!27852 (_keys!10512 thiss!1141))))))

(declare-fun b!943353 () Bool)

(declare-fun tp_is_empty!20455 () Bool)

(assert (=> b!943353 (= e!530478 tp_is_empty!20455)))

(declare-fun b!943354 () Bool)

(declare-fun res!633655 () Bool)

(assert (=> b!943354 (=> (not res!633655) (not e!530477))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943354 (= res!633655 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!530476 () Bool)

(declare-fun array_inv!21368 (array!56927) Bool)

(declare-fun array_inv!21369 (array!56925) Bool)

(assert (=> b!943355 (= e!530476 (and tp!62344 tp_is_empty!20455 (array_inv!21368 (_keys!10512 thiss!1141)) (array_inv!21369 (_values!5635 thiss!1141)) e!530479))))

(declare-fun b!943356 () Bool)

(declare-fun res!633653 () Bool)

(assert (=> b!943356 (=> (not res!633653) (not e!530477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56927 (_ BitVec 32)) Bool)

(assert (=> b!943356 (= res!633653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)))))

(declare-fun b!943357 () Bool)

(declare-fun res!633656 () Bool)

(assert (=> b!943357 (=> (not res!633656) (not e!530477))))

(declare-datatypes ((List!19200 0))(
  ( (Nil!19197) (Cons!19196 (h!20352 (_ BitVec 64)) (t!27507 List!19200)) )
))
(declare-fun arrayNoDuplicates!0 (array!56927 (_ BitVec 32) List!19200) Bool)

(assert (=> b!943357 (= res!633656 (arrayNoDuplicates!0 (_keys!10512 thiss!1141) #b00000000000000000000000000000000 Nil!19197))))

(declare-fun b!943358 () Bool)

(declare-fun res!633652 () Bool)

(assert (=> b!943358 (=> (not res!633652) (not e!530477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943358 (= res!633652 (validMask!0 (mask!27262 thiss!1141)))))

(declare-fun b!943349 () Bool)

(declare-fun res!633657 () Bool)

(assert (=> b!943349 (=> (not res!633657) (not e!530477))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8988 0))(
  ( (MissingZero!8988 (index!38323 (_ BitVec 32))) (Found!8988 (index!38324 (_ BitVec 32))) (Intermediate!8988 (undefined!9800 Bool) (index!38325 (_ BitVec 32)) (x!80891 (_ BitVec 32))) (Undefined!8988) (MissingVacant!8988 (index!38326 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56927 (_ BitVec 32)) SeekEntryResult!8988)

(assert (=> b!943349 (= res!633657 (not ((_ is Found!8988) (seekEntry!0 key!756 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)))))))

(declare-fun res!633658 () Bool)

(assert (=> start!80402 (=> (not res!633658) (not e!530477))))

(declare-fun valid!1783 (LongMapFixedSize!4642) Bool)

(assert (=> start!80402 (= res!633658 (valid!1783 thiss!1141))))

(assert (=> start!80402 e!530477))

(assert (=> start!80402 e!530476))

(assert (=> start!80402 true))

(declare-fun b!943359 () Bool)

(declare-fun e!530480 () Bool)

(assert (=> b!943359 (= e!530480 tp_is_empty!20455)))

(declare-fun mapNonEmpty!32501 () Bool)

(declare-fun tp!62345 () Bool)

(assert (=> mapNonEmpty!32501 (= mapRes!32501 (and tp!62345 e!530480))))

(declare-fun mapRest!32501 () (Array (_ BitVec 32) ValueCell!9746))

(declare-fun mapValue!32501 () ValueCell!9746)

(declare-fun mapKey!32501 () (_ BitVec 32))

(assert (=> mapNonEmpty!32501 (= (arr!27385 (_values!5635 thiss!1141)) (store mapRest!32501 mapKey!32501 mapValue!32501))))

(assert (= (and start!80402 res!633658) b!943354))

(assert (= (and b!943354 res!633655) b!943349))

(assert (= (and b!943349 res!633657) b!943358))

(assert (= (and b!943358 res!633652) b!943350))

(assert (= (and b!943350 res!633654) b!943356))

(assert (= (and b!943356 res!633653) b!943357))

(assert (= (and b!943357 res!633656) b!943352))

(assert (= (and b!943351 condMapEmpty!32501) mapIsEmpty!32501))

(assert (= (and b!943351 (not condMapEmpty!32501)) mapNonEmpty!32501))

(assert (= (and mapNonEmpty!32501 ((_ is ValueCellFull!9746) mapValue!32501)) b!943359))

(assert (= (and b!943351 ((_ is ValueCellFull!9746) mapDefault!32501)) b!943353))

(assert (= b!943355 b!943351))

(assert (= start!80402 b!943355))

(declare-fun m!878313 () Bool)

(assert (=> b!943357 m!878313))

(declare-fun m!878315 () Bool)

(assert (=> b!943358 m!878315))

(declare-fun m!878317 () Bool)

(assert (=> b!943356 m!878317))

(declare-fun m!878319 () Bool)

(assert (=> start!80402 m!878319))

(declare-fun m!878321 () Bool)

(assert (=> b!943349 m!878321))

(declare-fun m!878323 () Bool)

(assert (=> mapNonEmpty!32501 m!878323))

(declare-fun m!878325 () Bool)

(assert (=> b!943355 m!878325))

(declare-fun m!878327 () Bool)

(assert (=> b!943355 m!878327))

(check-sat (not b!943349) (not b_next!17947) (not b!943356) (not b!943357) (not mapNonEmpty!32501) (not start!80402) tp_is_empty!20455 b_and!29369 (not b!943355) (not b!943358))
(check-sat b_and!29369 (not b_next!17947))
(get-model)

(declare-fun d!114511 () Bool)

(assert (=> d!114511 (= (validMask!0 (mask!27262 thiss!1141)) (and (or (= (mask!27262 thiss!1141) #b00000000000000000000000000000111) (= (mask!27262 thiss!1141) #b00000000000000000000000000001111) (= (mask!27262 thiss!1141) #b00000000000000000000000000011111) (= (mask!27262 thiss!1141) #b00000000000000000000000000111111) (= (mask!27262 thiss!1141) #b00000000000000000000000001111111) (= (mask!27262 thiss!1141) #b00000000000000000000000011111111) (= (mask!27262 thiss!1141) #b00000000000000000000000111111111) (= (mask!27262 thiss!1141) #b00000000000000000000001111111111) (= (mask!27262 thiss!1141) #b00000000000000000000011111111111) (= (mask!27262 thiss!1141) #b00000000000000000000111111111111) (= (mask!27262 thiss!1141) #b00000000000000000001111111111111) (= (mask!27262 thiss!1141) #b00000000000000000011111111111111) (= (mask!27262 thiss!1141) #b00000000000000000111111111111111) (= (mask!27262 thiss!1141) #b00000000000000001111111111111111) (= (mask!27262 thiss!1141) #b00000000000000011111111111111111) (= (mask!27262 thiss!1141) #b00000000000000111111111111111111) (= (mask!27262 thiss!1141) #b00000000000001111111111111111111) (= (mask!27262 thiss!1141) #b00000000000011111111111111111111) (= (mask!27262 thiss!1141) #b00000000000111111111111111111111) (= (mask!27262 thiss!1141) #b00000000001111111111111111111111) (= (mask!27262 thiss!1141) #b00000000011111111111111111111111) (= (mask!27262 thiss!1141) #b00000000111111111111111111111111) (= (mask!27262 thiss!1141) #b00000001111111111111111111111111) (= (mask!27262 thiss!1141) #b00000011111111111111111111111111) (= (mask!27262 thiss!1141) #b00000111111111111111111111111111) (= (mask!27262 thiss!1141) #b00001111111111111111111111111111) (= (mask!27262 thiss!1141) #b00011111111111111111111111111111) (= (mask!27262 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27262 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!943358 d!114511))

(declare-fun d!114513 () Bool)

(declare-fun res!633707 () Bool)

(declare-fun e!530520 () Bool)

(assert (=> d!114513 (=> (not res!633707) (not e!530520))))

(declare-fun simpleValid!347 (LongMapFixedSize!4642) Bool)

(assert (=> d!114513 (= res!633707 (simpleValid!347 thiss!1141))))

(assert (=> d!114513 (= (valid!1783 thiss!1141) e!530520)))

(declare-fun b!943432 () Bool)

(declare-fun res!633708 () Bool)

(assert (=> b!943432 (=> (not res!633708) (not e!530520))))

(declare-fun arrayCountValidKeys!0 (array!56927 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943432 (= res!633708 (= (arrayCountValidKeys!0 (_keys!10512 thiss!1141) #b00000000000000000000000000000000 (size!27852 (_keys!10512 thiss!1141))) (_size!2376 thiss!1141)))))

(declare-fun b!943433 () Bool)

(declare-fun res!633709 () Bool)

(assert (=> b!943433 (=> (not res!633709) (not e!530520))))

(assert (=> b!943433 (= res!633709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)))))

(declare-fun b!943434 () Bool)

(assert (=> b!943434 (= e!530520 (arrayNoDuplicates!0 (_keys!10512 thiss!1141) #b00000000000000000000000000000000 Nil!19197))))

(assert (= (and d!114513 res!633707) b!943432))

(assert (= (and b!943432 res!633708) b!943433))

(assert (= (and b!943433 res!633709) b!943434))

(declare-fun m!878361 () Bool)

(assert (=> d!114513 m!878361))

(declare-fun m!878363 () Bool)

(assert (=> b!943432 m!878363))

(assert (=> b!943433 m!878317))

(assert (=> b!943434 m!878313))

(assert (=> start!80402 d!114513))

(declare-fun b!943445 () Bool)

(declare-fun e!530530 () Bool)

(declare-fun contains!5140 (List!19200 (_ BitVec 64)) Bool)

(assert (=> b!943445 (= e!530530 (contains!5140 Nil!19197 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943446 () Bool)

(declare-fun e!530529 () Bool)

(declare-fun call!41007 () Bool)

(assert (=> b!943446 (= e!530529 call!41007)))

(declare-fun b!943447 () Bool)

(assert (=> b!943447 (= e!530529 call!41007)))

(declare-fun b!943448 () Bool)

(declare-fun e!530531 () Bool)

(declare-fun e!530532 () Bool)

(assert (=> b!943448 (= e!530531 e!530532)))

(declare-fun res!633717 () Bool)

(assert (=> b!943448 (=> (not res!633717) (not e!530532))))

(assert (=> b!943448 (= res!633717 (not e!530530))))

(declare-fun res!633718 () Bool)

(assert (=> b!943448 (=> (not res!633718) (not e!530530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!943448 (= res!633718 (validKeyInArray!0 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114515 () Bool)

(declare-fun res!633716 () Bool)

(assert (=> d!114515 (=> res!633716 e!530531)))

(assert (=> d!114515 (= res!633716 (bvsge #b00000000000000000000000000000000 (size!27852 (_keys!10512 thiss!1141))))))

(assert (=> d!114515 (= (arrayNoDuplicates!0 (_keys!10512 thiss!1141) #b00000000000000000000000000000000 Nil!19197) e!530531)))

(declare-fun b!943449 () Bool)

(assert (=> b!943449 (= e!530532 e!530529)))

(declare-fun c!98512 () Bool)

(assert (=> b!943449 (= c!98512 (validKeyInArray!0 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41004 () Bool)

(assert (=> bm!41004 (= call!41007 (arrayNoDuplicates!0 (_keys!10512 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98512 (Cons!19196 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000) Nil!19197) Nil!19197)))))

(assert (= (and d!114515 (not res!633716)) b!943448))

(assert (= (and b!943448 res!633718) b!943445))

(assert (= (and b!943448 res!633717) b!943449))

(assert (= (and b!943449 c!98512) b!943446))

(assert (= (and b!943449 (not c!98512)) b!943447))

(assert (= (or b!943446 b!943447) bm!41004))

(declare-fun m!878365 () Bool)

(assert (=> b!943445 m!878365))

(assert (=> b!943445 m!878365))

(declare-fun m!878367 () Bool)

(assert (=> b!943445 m!878367))

(assert (=> b!943448 m!878365))

(assert (=> b!943448 m!878365))

(declare-fun m!878369 () Bool)

(assert (=> b!943448 m!878369))

(assert (=> b!943449 m!878365))

(assert (=> b!943449 m!878365))

(assert (=> b!943449 m!878369))

(assert (=> bm!41004 m!878365))

(declare-fun m!878371 () Bool)

(assert (=> bm!41004 m!878371))

(assert (=> b!943357 d!114515))

(declare-fun b!943458 () Bool)

(declare-fun e!530539 () Bool)

(declare-fun call!41010 () Bool)

(assert (=> b!943458 (= e!530539 call!41010)))

(declare-fun bm!41007 () Bool)

(assert (=> bm!41007 (= call!41010 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10512 thiss!1141) (mask!27262 thiss!1141)))))

(declare-fun b!943459 () Bool)

(declare-fun e!530540 () Bool)

(assert (=> b!943459 (= e!530540 call!41010)))

(declare-fun b!943461 () Bool)

(assert (=> b!943461 (= e!530540 e!530539)))

(declare-fun lt!425523 () (_ BitVec 64))

(assert (=> b!943461 (= lt!425523 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31786 0))(
  ( (Unit!31787) )
))
(declare-fun lt!425525 () Unit!31786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56927 (_ BitVec 64) (_ BitVec 32)) Unit!31786)

(assert (=> b!943461 (= lt!425525 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10512 thiss!1141) lt!425523 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943461 (arrayContainsKey!0 (_keys!10512 thiss!1141) lt!425523 #b00000000000000000000000000000000)))

(declare-fun lt!425524 () Unit!31786)

(assert (=> b!943461 (= lt!425524 lt!425525)))

(declare-fun res!633723 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56927 (_ BitVec 32)) SeekEntryResult!8988)

(assert (=> b!943461 (= res!633723 (= (seekEntryOrOpen!0 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000) (_keys!10512 thiss!1141) (mask!27262 thiss!1141)) (Found!8988 #b00000000000000000000000000000000)))))

(assert (=> b!943461 (=> (not res!633723) (not e!530539))))

(declare-fun b!943460 () Bool)

(declare-fun e!530541 () Bool)

(assert (=> b!943460 (= e!530541 e!530540)))

(declare-fun c!98515 () Bool)

(assert (=> b!943460 (= c!98515 (validKeyInArray!0 (select (arr!27386 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114517 () Bool)

(declare-fun res!633724 () Bool)

(assert (=> d!114517 (=> res!633724 e!530541)))

(assert (=> d!114517 (= res!633724 (bvsge #b00000000000000000000000000000000 (size!27852 (_keys!10512 thiss!1141))))))

(assert (=> d!114517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)) e!530541)))

(assert (= (and d!114517 (not res!633724)) b!943460))

(assert (= (and b!943460 c!98515) b!943461))

(assert (= (and b!943460 (not c!98515)) b!943459))

(assert (= (and b!943461 res!633723) b!943458))

(assert (= (or b!943458 b!943459) bm!41007))

(declare-fun m!878373 () Bool)

(assert (=> bm!41007 m!878373))

(assert (=> b!943461 m!878365))

(declare-fun m!878375 () Bool)

(assert (=> b!943461 m!878375))

(declare-fun m!878377 () Bool)

(assert (=> b!943461 m!878377))

(assert (=> b!943461 m!878365))

(declare-fun m!878379 () Bool)

(assert (=> b!943461 m!878379))

(assert (=> b!943460 m!878365))

(assert (=> b!943460 m!878365))

(assert (=> b!943460 m!878369))

(assert (=> b!943356 d!114517))

(declare-fun d!114519 () Bool)

(assert (=> d!114519 (= (array_inv!21368 (_keys!10512 thiss!1141)) (bvsge (size!27852 (_keys!10512 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943355 d!114519))

(declare-fun d!114521 () Bool)

(assert (=> d!114521 (= (array_inv!21369 (_values!5635 thiss!1141)) (bvsge (size!27851 (_values!5635 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943355 d!114521))

(declare-fun b!943474 () Bool)

(declare-fun e!530549 () SeekEntryResult!8988)

(declare-fun lt!425535 () SeekEntryResult!8988)

(assert (=> b!943474 (= e!530549 (MissingZero!8988 (index!38325 lt!425535)))))

(declare-fun b!943475 () Bool)

(declare-fun e!530548 () SeekEntryResult!8988)

(declare-fun e!530550 () SeekEntryResult!8988)

(assert (=> b!943475 (= e!530548 e!530550)))

(declare-fun lt!425536 () (_ BitVec 64))

(assert (=> b!943475 (= lt!425536 (select (arr!27386 (_keys!10512 thiss!1141)) (index!38325 lt!425535)))))

(declare-fun c!98522 () Bool)

(assert (=> b!943475 (= c!98522 (= lt!425536 key!756))))

(declare-fun b!943476 () Bool)

(assert (=> b!943476 (= e!530550 (Found!8988 (index!38325 lt!425535)))))

(declare-fun b!943477 () Bool)

(declare-fun c!98523 () Bool)

(assert (=> b!943477 (= c!98523 (= lt!425536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943477 (= e!530550 e!530549)))

(declare-fun d!114523 () Bool)

(declare-fun lt!425534 () SeekEntryResult!8988)

(assert (=> d!114523 (and (or ((_ is MissingVacant!8988) lt!425534) (not ((_ is Found!8988) lt!425534)) (and (bvsge (index!38324 lt!425534) #b00000000000000000000000000000000) (bvslt (index!38324 lt!425534) (size!27852 (_keys!10512 thiss!1141))))) (not ((_ is MissingVacant!8988) lt!425534)) (or (not ((_ is Found!8988) lt!425534)) (= (select (arr!27386 (_keys!10512 thiss!1141)) (index!38324 lt!425534)) key!756)))))

(assert (=> d!114523 (= lt!425534 e!530548)))

(declare-fun c!98524 () Bool)

(assert (=> d!114523 (= c!98524 (and ((_ is Intermediate!8988) lt!425535) (undefined!9800 lt!425535)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56927 (_ BitVec 32)) SeekEntryResult!8988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114523 (= lt!425535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27262 thiss!1141)) key!756 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)))))

(assert (=> d!114523 (validMask!0 (mask!27262 thiss!1141))))

(assert (=> d!114523 (= (seekEntry!0 key!756 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)) lt!425534)))

(declare-fun b!943478 () Bool)

(declare-fun lt!425537 () SeekEntryResult!8988)

(assert (=> b!943478 (= e!530549 (ite ((_ is MissingVacant!8988) lt!425537) (MissingZero!8988 (index!38326 lt!425537)) lt!425537))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56927 (_ BitVec 32)) SeekEntryResult!8988)

(assert (=> b!943478 (= lt!425537 (seekKeyOrZeroReturnVacant!0 (x!80891 lt!425535) (index!38325 lt!425535) (index!38325 lt!425535) key!756 (_keys!10512 thiss!1141) (mask!27262 thiss!1141)))))

(declare-fun b!943479 () Bool)

(assert (=> b!943479 (= e!530548 Undefined!8988)))

(assert (= (and d!114523 c!98524) b!943479))

(assert (= (and d!114523 (not c!98524)) b!943475))

(assert (= (and b!943475 c!98522) b!943476))

(assert (= (and b!943475 (not c!98522)) b!943477))

(assert (= (and b!943477 c!98523) b!943474))

(assert (= (and b!943477 (not c!98523)) b!943478))

(declare-fun m!878381 () Bool)

(assert (=> b!943475 m!878381))

(declare-fun m!878383 () Bool)

(assert (=> d!114523 m!878383))

(declare-fun m!878385 () Bool)

(assert (=> d!114523 m!878385))

(assert (=> d!114523 m!878385))

(declare-fun m!878387 () Bool)

(assert (=> d!114523 m!878387))

(assert (=> d!114523 m!878315))

(declare-fun m!878389 () Bool)

(assert (=> b!943478 m!878389))

(assert (=> b!943349 d!114523))

(declare-fun condMapEmpty!32510 () Bool)

(declare-fun mapDefault!32510 () ValueCell!9746)

(assert (=> mapNonEmpty!32501 (= condMapEmpty!32510 (= mapRest!32501 ((as const (Array (_ BitVec 32) ValueCell!9746)) mapDefault!32510)))))

(declare-fun e!530556 () Bool)

(declare-fun mapRes!32510 () Bool)

(assert (=> mapNonEmpty!32501 (= tp!62345 (and e!530556 mapRes!32510))))

(declare-fun b!943486 () Bool)

(declare-fun e!530555 () Bool)

(assert (=> b!943486 (= e!530555 tp_is_empty!20455)))

(declare-fun mapIsEmpty!32510 () Bool)

(assert (=> mapIsEmpty!32510 mapRes!32510))

(declare-fun mapNonEmpty!32510 () Bool)

(declare-fun tp!62360 () Bool)

(assert (=> mapNonEmpty!32510 (= mapRes!32510 (and tp!62360 e!530555))))

(declare-fun mapRest!32510 () (Array (_ BitVec 32) ValueCell!9746))

(declare-fun mapValue!32510 () ValueCell!9746)

(declare-fun mapKey!32510 () (_ BitVec 32))

(assert (=> mapNonEmpty!32510 (= mapRest!32501 (store mapRest!32510 mapKey!32510 mapValue!32510))))

(declare-fun b!943487 () Bool)

(assert (=> b!943487 (= e!530556 tp_is_empty!20455)))

(assert (= (and mapNonEmpty!32501 condMapEmpty!32510) mapIsEmpty!32510))

(assert (= (and mapNonEmpty!32501 (not condMapEmpty!32510)) mapNonEmpty!32510))

(assert (= (and mapNonEmpty!32510 ((_ is ValueCellFull!9746) mapValue!32510)) b!943486))

(assert (= (and mapNonEmpty!32501 ((_ is ValueCellFull!9746) mapDefault!32510)) b!943487))

(declare-fun m!878391 () Bool)

(assert (=> mapNonEmpty!32510 m!878391))

(check-sat (not mapNonEmpty!32510) (not b!943448) (not b!943478) (not b!943461) (not b!943433) (not b!943445) tp_is_empty!20455 (not bm!41004) b_and!29369 (not b!943434) (not b!943449) (not d!114523) (not b_next!17947) (not b!943432) (not d!114513) (not b!943460) (not bm!41007))
(check-sat b_and!29369 (not b_next!17947))
