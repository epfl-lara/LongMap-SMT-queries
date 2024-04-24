; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22130 () Bool)

(assert start!22130)

(declare-fun b!230513 () Bool)

(declare-fun b_free!6193 () Bool)

(declare-fun b_next!6193 () Bool)

(assert (=> b!230513 (= b_free!6193 (not b_next!6193))))

(declare-fun tp!21721 () Bool)

(declare-fun b_and!13105 () Bool)

(assert (=> b!230513 (= tp!21721 b_and!13105)))

(declare-fun b!230507 () Bool)

(declare-datatypes ((Unit!7039 0))(
  ( (Unit!7040) )
))
(declare-fun e!149588 () Unit!7039)

(declare-fun lt!116047 () Unit!7039)

(assert (=> b!230507 (= e!149588 lt!116047)))

(declare-datatypes ((V!7721 0))(
  ( (V!7722 (val!3072 Int)) )
))
(declare-datatypes ((ValueCell!2684 0))(
  ( (ValueCellFull!2684 (v!5093 V!7721)) (EmptyCell!2684) )
))
(declare-datatypes ((array!11351 0))(
  ( (array!11352 (arr!5395 (Array (_ BitVec 32) ValueCell!2684)) (size!5728 (_ BitVec 32))) )
))
(declare-datatypes ((array!11353 0))(
  ( (array!11354 (arr!5396 (Array (_ BitVec 32) (_ BitVec 64))) (size!5729 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3268 0))(
  ( (LongMapFixedSize!3269 (defaultEntry!4293 Int) (mask!10185 (_ BitVec 32)) (extraKeys!4030 (_ BitVec 32)) (zeroValue!4134 V!7721) (minValue!4134 V!7721) (_size!1683 (_ BitVec 32)) (_keys!6347 array!11353) (_values!4276 array!11351) (_vacant!1683 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3268)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!286 (array!11353 array!11351 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) Int) Unit!7039)

(assert (=> b!230507 (= lt!116047 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!286 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 (defaultEntry!4293 thiss!1504)))))

(declare-fun c!38266 () Bool)

(declare-datatypes ((SeekEntryResult!903 0))(
  ( (MissingZero!903 (index!5782 (_ BitVec 32))) (Found!903 (index!5783 (_ BitVec 32))) (Intermediate!903 (undefined!1715 Bool) (index!5784 (_ BitVec 32)) (x!23411 (_ BitVec 32))) (Undefined!903) (MissingVacant!903 (index!5785 (_ BitVec 32))) )
))
(declare-fun lt!116052 () SeekEntryResult!903)

(get-info :version)

(assert (=> b!230507 (= c!38266 ((_ is MissingZero!903) lt!116052))))

(declare-fun e!149585 () Bool)

(assert (=> b!230507 e!149585))

(declare-fun b!230508 () Bool)

(declare-fun res!113367 () Bool)

(declare-fun e!149593 () Bool)

(assert (=> b!230508 (=> (not res!113367) (not e!149593))))

(assert (=> b!230508 (= res!113367 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10252 () Bool)

(declare-fun mapRes!10252 () Bool)

(assert (=> mapIsEmpty!10252 mapRes!10252))

(declare-fun b!230509 () Bool)

(declare-fun res!113371 () Bool)

(declare-fun e!149584 () Bool)

(assert (=> b!230509 (=> (not res!113371) (not e!149584))))

(assert (=> b!230509 (= res!113371 (= (select (arr!5396 (_keys!6347 thiss!1504)) (index!5782 lt!116052)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230510 () Bool)

(declare-fun e!149594 () Bool)

(assert (=> b!230510 (= e!149594 (not true))))

(declare-fun lt!116057 () array!11353)

(declare-fun arrayContainsKey!0 (array!11353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230510 (arrayContainsKey!0 lt!116057 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116051 () Unit!7039)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11353 (_ BitVec 64) (_ BitVec 32)) Unit!7039)

(assert (=> b!230510 (= lt!116051 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116057 key!932 index!297))))

(declare-datatypes ((tuple2!4458 0))(
  ( (tuple2!4459 (_1!2240 (_ BitVec 64)) (_2!2240 V!7721)) )
))
(declare-datatypes ((List!3372 0))(
  ( (Nil!3369) (Cons!3368 (h!4016 tuple2!4458) (t!8323 List!3372)) )
))
(declare-datatypes ((ListLongMap!3373 0))(
  ( (ListLongMap!3374 (toList!1702 List!3372)) )
))
(declare-fun lt!116056 () ListLongMap!3373)

(declare-fun v!346 () V!7721)

(declare-fun +!602 (ListLongMap!3373 tuple2!4458) ListLongMap!3373)

(declare-fun getCurrentListMap!1234 (array!11353 array!11351 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 32) Int) ListLongMap!3373)

(assert (=> b!230510 (= (+!602 lt!116056 (tuple2!4459 key!932 v!346)) (getCurrentListMap!1234 lt!116057 (array!11352 (store (arr!5395 (_values!4276 thiss!1504)) index!297 (ValueCellFull!2684 v!346)) (size!5728 (_values!4276 thiss!1504))) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(declare-fun lt!116049 () Unit!7039)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!61 (array!11353 array!11351 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 32) (_ BitVec 64) V!7721 Int) Unit!7039)

(assert (=> b!230510 (= lt!116049 (lemmaAddValidKeyToArrayThenAddPairToListMap!61 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) index!297 key!932 v!346 (defaultEntry!4293 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11353 (_ BitVec 32)) Bool)

(assert (=> b!230510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116057 (mask!10185 thiss!1504))))

(declare-fun lt!116050 () Unit!7039)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11353 (_ BitVec 32) (_ BitVec 32)) Unit!7039)

(assert (=> b!230510 (= lt!116050 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6347 thiss!1504) index!297 (mask!10185 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230510 (= (arrayCountValidKeys!0 lt!116057 #b00000000000000000000000000000000 (size!5729 (_keys!6347 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6347 thiss!1504) #b00000000000000000000000000000000 (size!5729 (_keys!6347 thiss!1504)))))))

(declare-fun lt!116059 () Unit!7039)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11353 (_ BitVec 32) (_ BitVec 64)) Unit!7039)

(assert (=> b!230510 (= lt!116059 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6347 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3373 0))(
  ( (Nil!3370) (Cons!3369 (h!4017 (_ BitVec 64)) (t!8324 List!3373)) )
))
(declare-fun arrayNoDuplicates!0 (array!11353 (_ BitVec 32) List!3373) Bool)

(assert (=> b!230510 (arrayNoDuplicates!0 lt!116057 #b00000000000000000000000000000000 Nil!3370)))

(assert (=> b!230510 (= lt!116057 (array!11354 (store (arr!5396 (_keys!6347 thiss!1504)) index!297 key!932) (size!5729 (_keys!6347 thiss!1504))))))

(declare-fun lt!116054 () Unit!7039)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3373) Unit!7039)

(assert (=> b!230510 (= lt!116054 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6347 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3370))))

(declare-fun lt!116055 () Unit!7039)

(declare-fun e!149583 () Unit!7039)

(assert (=> b!230510 (= lt!116055 e!149583)))

(declare-fun c!38269 () Bool)

(assert (=> b!230510 (= c!38269 (arrayContainsKey!0 (_keys!6347 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230511 () Bool)

(declare-fun Unit!7041 () Unit!7039)

(assert (=> b!230511 (= e!149583 Unit!7041)))

(declare-fun lt!116058 () Unit!7039)

(declare-fun lemmaArrayContainsKeyThenInListMap!130 (array!11353 array!11351 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) (_ BitVec 32) Int) Unit!7039)

(assert (=> b!230511 (= lt!116058 (lemmaArrayContainsKeyThenInListMap!130 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(assert (=> b!230511 false))

(declare-fun mapNonEmpty!10252 () Bool)

(declare-fun tp!21720 () Bool)

(declare-fun e!149592 () Bool)

(assert (=> mapNonEmpty!10252 (= mapRes!10252 (and tp!21720 e!149592))))

(declare-fun mapKey!10252 () (_ BitVec 32))

(declare-fun mapRest!10252 () (Array (_ BitVec 32) ValueCell!2684))

(declare-fun mapValue!10252 () ValueCell!2684)

(assert (=> mapNonEmpty!10252 (= (arr!5395 (_values!4276 thiss!1504)) (store mapRest!10252 mapKey!10252 mapValue!10252))))

(declare-fun e!149586 () Bool)

(declare-fun tp_is_empty!6055 () Bool)

(declare-fun e!149591 () Bool)

(declare-fun array_inv!3543 (array!11353) Bool)

(declare-fun array_inv!3544 (array!11351) Bool)

(assert (=> b!230513 (= e!149586 (and tp!21721 tp_is_empty!6055 (array_inv!3543 (_keys!6347 thiss!1504)) (array_inv!3544 (_values!4276 thiss!1504)) e!149591))))

(declare-fun b!230514 () Bool)

(declare-fun e!149582 () Bool)

(assert (=> b!230514 (= e!149582 e!149594)))

(declare-fun res!113369 () Bool)

(assert (=> b!230514 (=> (not res!113369) (not e!149594))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230514 (= res!113369 (inRange!0 index!297 (mask!10185 thiss!1504)))))

(declare-fun lt!116048 () Unit!7039)

(assert (=> b!230514 (= lt!116048 e!149588)))

(declare-fun c!38268 () Bool)

(declare-fun contains!1591 (ListLongMap!3373 (_ BitVec 64)) Bool)

(assert (=> b!230514 (= c!38268 (contains!1591 lt!116056 key!932))))

(assert (=> b!230514 (= lt!116056 (getCurrentListMap!1234 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(declare-fun b!230515 () Bool)

(declare-fun call!21401 () Bool)

(assert (=> b!230515 (= e!149584 (not call!21401))))

(declare-fun b!230516 () Bool)

(declare-fun c!38267 () Bool)

(assert (=> b!230516 (= c!38267 ((_ is MissingVacant!903) lt!116052))))

(declare-fun e!149581 () Bool)

(assert (=> b!230516 (= e!149585 e!149581)))

(declare-fun b!230517 () Bool)

(declare-fun Unit!7042 () Unit!7039)

(assert (=> b!230517 (= e!149588 Unit!7042)))

(declare-fun lt!116053 () Unit!7039)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!295 (array!11353 array!11351 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) Int) Unit!7039)

(assert (=> b!230517 (= lt!116053 (lemmaInListMapThenSeekEntryOrOpenFindsIt!295 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 (defaultEntry!4293 thiss!1504)))))

(assert (=> b!230517 false))

(declare-fun b!230518 () Bool)

(declare-fun e!149589 () Bool)

(assert (=> b!230518 (= e!149589 (not call!21401))))

(declare-fun b!230519 () Bool)

(declare-fun Unit!7043 () Unit!7039)

(assert (=> b!230519 (= e!149583 Unit!7043)))

(declare-fun bm!21398 () Bool)

(assert (=> bm!21398 (= call!21401 (arrayContainsKey!0 (_keys!6347 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230520 () Bool)

(declare-fun e!149587 () Bool)

(assert (=> b!230520 (= e!149591 (and e!149587 mapRes!10252))))

(declare-fun condMapEmpty!10252 () Bool)

(declare-fun mapDefault!10252 () ValueCell!2684)

(assert (=> b!230520 (= condMapEmpty!10252 (= (arr!5395 (_values!4276 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2684)) mapDefault!10252)))))

(declare-fun call!21402 () Bool)

(declare-fun bm!21399 () Bool)

(assert (=> bm!21399 (= call!21402 (inRange!0 (ite c!38266 (index!5782 lt!116052) (index!5785 lt!116052)) (mask!10185 thiss!1504)))))

(declare-fun b!230521 () Bool)

(assert (=> b!230521 (= e!149581 ((_ is Undefined!903) lt!116052))))

(declare-fun res!113368 () Bool)

(assert (=> start!22130 (=> (not res!113368) (not e!149593))))

(declare-fun valid!1313 (LongMapFixedSize!3268) Bool)

(assert (=> start!22130 (= res!113368 (valid!1313 thiss!1504))))

(assert (=> start!22130 e!149593))

(assert (=> start!22130 e!149586))

(assert (=> start!22130 true))

(assert (=> start!22130 tp_is_empty!6055))

(declare-fun b!230512 () Bool)

(assert (=> b!230512 (= e!149587 tp_is_empty!6055)))

(declare-fun b!230522 () Bool)

(assert (=> b!230522 (= e!149592 tp_is_empty!6055)))

(declare-fun b!230523 () Bool)

(assert (=> b!230523 (= e!149581 e!149589)))

(declare-fun res!113372 () Bool)

(assert (=> b!230523 (= res!113372 call!21402)))

(assert (=> b!230523 (=> (not res!113372) (not e!149589))))

(declare-fun b!230524 () Bool)

(declare-fun res!113374 () Bool)

(assert (=> b!230524 (= res!113374 (= (select (arr!5396 (_keys!6347 thiss!1504)) (index!5785 lt!116052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230524 (=> (not res!113374) (not e!149589))))

(declare-fun b!230525 () Bool)

(assert (=> b!230525 (= e!149593 e!149582)))

(declare-fun res!113373 () Bool)

(assert (=> b!230525 (=> (not res!113373) (not e!149582))))

(assert (=> b!230525 (= res!113373 (or (= lt!116052 (MissingZero!903 index!297)) (= lt!116052 (MissingVacant!903 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11353 (_ BitVec 32)) SeekEntryResult!903)

(assert (=> b!230525 (= lt!116052 (seekEntryOrOpen!0 key!932 (_keys!6347 thiss!1504) (mask!10185 thiss!1504)))))

(declare-fun b!230526 () Bool)

(declare-fun res!113370 () Bool)

(assert (=> b!230526 (=> (not res!113370) (not e!149584))))

(assert (=> b!230526 (= res!113370 call!21402)))

(assert (=> b!230526 (= e!149585 e!149584)))

(assert (= (and start!22130 res!113368) b!230508))

(assert (= (and b!230508 res!113367) b!230525))

(assert (= (and b!230525 res!113373) b!230514))

(assert (= (and b!230514 c!38268) b!230517))

(assert (= (and b!230514 (not c!38268)) b!230507))

(assert (= (and b!230507 c!38266) b!230526))

(assert (= (and b!230507 (not c!38266)) b!230516))

(assert (= (and b!230526 res!113370) b!230509))

(assert (= (and b!230509 res!113371) b!230515))

(assert (= (and b!230516 c!38267) b!230523))

(assert (= (and b!230516 (not c!38267)) b!230521))

(assert (= (and b!230523 res!113372) b!230524))

(assert (= (and b!230524 res!113374) b!230518))

(assert (= (or b!230526 b!230523) bm!21399))

(assert (= (or b!230515 b!230518) bm!21398))

(assert (= (and b!230514 res!113369) b!230510))

(assert (= (and b!230510 c!38269) b!230511))

(assert (= (and b!230510 (not c!38269)) b!230519))

(assert (= (and b!230520 condMapEmpty!10252) mapIsEmpty!10252))

(assert (= (and b!230520 (not condMapEmpty!10252)) mapNonEmpty!10252))

(assert (= (and mapNonEmpty!10252 ((_ is ValueCellFull!2684) mapValue!10252)) b!230522))

(assert (= (and b!230520 ((_ is ValueCellFull!2684) mapDefault!10252)) b!230512))

(assert (= b!230513 b!230520))

(assert (= start!22130 b!230513))

(declare-fun m!252013 () Bool)

(assert (=> start!22130 m!252013))

(declare-fun m!252015 () Bool)

(assert (=> b!230517 m!252015))

(declare-fun m!252017 () Bool)

(assert (=> b!230513 m!252017))

(declare-fun m!252019 () Bool)

(assert (=> b!230513 m!252019))

(declare-fun m!252021 () Bool)

(assert (=> b!230507 m!252021))

(declare-fun m!252023 () Bool)

(assert (=> bm!21399 m!252023))

(declare-fun m!252025 () Bool)

(assert (=> b!230514 m!252025))

(declare-fun m!252027 () Bool)

(assert (=> b!230514 m!252027))

(declare-fun m!252029 () Bool)

(assert (=> b!230514 m!252029))

(declare-fun m!252031 () Bool)

(assert (=> b!230509 m!252031))

(declare-fun m!252033 () Bool)

(assert (=> b!230510 m!252033))

(declare-fun m!252035 () Bool)

(assert (=> b!230510 m!252035))

(declare-fun m!252037 () Bool)

(assert (=> b!230510 m!252037))

(declare-fun m!252039 () Bool)

(assert (=> b!230510 m!252039))

(declare-fun m!252041 () Bool)

(assert (=> b!230510 m!252041))

(declare-fun m!252043 () Bool)

(assert (=> b!230510 m!252043))

(declare-fun m!252045 () Bool)

(assert (=> b!230510 m!252045))

(declare-fun m!252047 () Bool)

(assert (=> b!230510 m!252047))

(declare-fun m!252049 () Bool)

(assert (=> b!230510 m!252049))

(declare-fun m!252051 () Bool)

(assert (=> b!230510 m!252051))

(declare-fun m!252053 () Bool)

(assert (=> b!230510 m!252053))

(declare-fun m!252055 () Bool)

(assert (=> b!230510 m!252055))

(declare-fun m!252057 () Bool)

(assert (=> b!230510 m!252057))

(declare-fun m!252059 () Bool)

(assert (=> b!230510 m!252059))

(declare-fun m!252061 () Bool)

(assert (=> b!230510 m!252061))

(declare-fun m!252063 () Bool)

(assert (=> mapNonEmpty!10252 m!252063))

(declare-fun m!252065 () Bool)

(assert (=> b!230511 m!252065))

(declare-fun m!252067 () Bool)

(assert (=> b!230524 m!252067))

(declare-fun m!252069 () Bool)

(assert (=> b!230525 m!252069))

(assert (=> bm!21398 m!252033))

(check-sat (not b!230511) b_and!13105 (not b_next!6193) (not b!230525) (not bm!21399) (not b!230513) (not start!22130) (not bm!21398) (not mapNonEmpty!10252) (not b!230514) (not b!230510) tp_is_empty!6055 (not b!230507) (not b!230517))
(check-sat b_and!13105 (not b_next!6193))
