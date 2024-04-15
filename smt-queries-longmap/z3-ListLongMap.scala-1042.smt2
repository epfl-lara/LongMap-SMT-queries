; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21938 () Bool)

(assert start!21938)

(declare-fun b!223386 () Bool)

(declare-fun b_free!6001 () Bool)

(declare-fun b_next!6001 () Bool)

(assert (=> b!223386 (= b_free!6001 (not b_next!6001))))

(declare-fun tp!21145 () Bool)

(declare-fun b_and!12873 () Bool)

(assert (=> b!223386 (= tp!21145 b_and!12873)))

(declare-fun b!223362 () Bool)

(declare-fun res!109763 () Bool)

(declare-fun e!145086 () Bool)

(assert (=> b!223362 (=> (not res!109763) (not e!145086))))

(declare-datatypes ((V!7465 0))(
  ( (V!7466 (val!2976 Int)) )
))
(declare-datatypes ((ValueCell!2588 0))(
  ( (ValueCellFull!2588 (v!4990 V!7465)) (EmptyCell!2588) )
))
(declare-datatypes ((array!10961 0))(
  ( (array!10962 (arr!5199 (Array (_ BitVec 32) ValueCell!2588)) (size!5533 (_ BitVec 32))) )
))
(declare-datatypes ((array!10963 0))(
  ( (array!10964 (arr!5200 (Array (_ BitVec 32) (_ BitVec 64))) (size!5534 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3076 0))(
  ( (LongMapFixedSize!3077 (defaultEntry!4197 Int) (mask!10024 (_ BitVec 32)) (extraKeys!3934 (_ BitVec 32)) (zeroValue!4038 V!7465) (minValue!4038 V!7465) (_size!1587 (_ BitVec 32)) (_keys!6250 array!10963) (_values!4180 array!10961) (_vacant!1587 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3076)

(declare-datatypes ((SeekEntryResult!844 0))(
  ( (MissingZero!844 (index!5546 (_ BitVec 32))) (Found!844 (index!5547 (_ BitVec 32))) (Intermediate!844 (undefined!1656 Bool) (index!5548 (_ BitVec 32)) (x!23095 (_ BitVec 32))) (Undefined!844) (MissingVacant!844 (index!5549 (_ BitVec 32))) )
))
(declare-fun lt!112739 () SeekEntryResult!844)

(assert (=> b!223362 (= res!109763 (= (select (arr!5200 (_keys!6250 thiss!1504)) (index!5546 lt!112739)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223363 () Bool)

(declare-fun res!109759 () Bool)

(assert (=> b!223363 (= res!109759 (= (select (arr!5200 (_keys!6250 thiss!1504)) (index!5549 lt!112739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145094 () Bool)

(assert (=> b!223363 (=> (not res!109759) (not e!145094))))

(declare-fun b!223364 () Bool)

(declare-fun e!145096 () Bool)

(declare-fun e!145087 () Bool)

(assert (=> b!223364 (= e!145096 e!145087)))

(declare-fun res!109762 () Bool)

(assert (=> b!223364 (=> (not res!109762) (not e!145087))))

(assert (=> b!223364 (= res!109762 (and (bvslt (size!5534 (_keys!6250 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5534 (_keys!6250 thiss!1504)))))))

(declare-datatypes ((Unit!6655 0))(
  ( (Unit!6656) )
))
(declare-fun lt!112737 () Unit!6655)

(declare-fun e!145082 () Unit!6655)

(assert (=> b!223364 (= lt!112737 e!145082)))

(declare-fun c!37077 () Bool)

(declare-fun lt!112738 () Bool)

(assert (=> b!223364 (= c!37077 lt!112738)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223364 (= lt!112738 (arrayContainsKey!0 (_keys!6250 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!9964 () Bool)

(declare-fun mapRes!9964 () Bool)

(assert (=> mapIsEmpty!9964 mapRes!9964))

(declare-fun b!223365 () Bool)

(declare-fun res!109774 () Bool)

(assert (=> b!223365 (=> (not res!109774) (not e!145087))))

(declare-datatypes ((List!3303 0))(
  ( (Nil!3300) (Cons!3299 (h!3947 (_ BitVec 64)) (t!8253 List!3303)) )
))
(declare-fun contains!1519 (List!3303 (_ BitVec 64)) Bool)

(assert (=> b!223365 (= res!109774 (not (contains!1519 Nil!3300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223367 () Bool)

(declare-fun e!145089 () Bool)

(assert (=> b!223367 (= e!145089 (not (contains!1519 Nil!3300 key!932)))))

(declare-fun b!223368 () Bool)

(declare-fun call!20813 () Bool)

(assert (=> b!223368 (= e!145094 (not call!20813))))

(declare-fun b!223369 () Bool)

(declare-fun res!109773 () Bool)

(assert (=> b!223369 (=> (not res!109773) (not e!145087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223369 (= res!109773 (validKeyInArray!0 key!932))))

(declare-fun b!223370 () Bool)

(declare-fun e!145097 () Bool)

(assert (=> b!223370 (= e!145097 e!145096)))

(declare-fun res!109775 () Bool)

(assert (=> b!223370 (=> (not res!109775) (not e!145096))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223370 (= res!109775 (inRange!0 index!297 (mask!10024 thiss!1504)))))

(declare-fun lt!112744 () Unit!6655)

(declare-fun e!145083 () Unit!6655)

(assert (=> b!223370 (= lt!112744 e!145083)))

(declare-fun c!37078 () Bool)

(declare-datatypes ((tuple2!4378 0))(
  ( (tuple2!4379 (_1!2200 (_ BitVec 64)) (_2!2200 V!7465)) )
))
(declare-datatypes ((List!3304 0))(
  ( (Nil!3301) (Cons!3300 (h!3948 tuple2!4378) (t!8254 List!3304)) )
))
(declare-datatypes ((ListLongMap!3281 0))(
  ( (ListLongMap!3282 (toList!1656 List!3304)) )
))
(declare-fun contains!1520 (ListLongMap!3281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1165 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 32) Int) ListLongMap!3281)

(assert (=> b!223370 (= c!37078 (contains!1520 (getCurrentListMap!1165 (_keys!6250 thiss!1504) (_values!4180 thiss!1504) (mask!10024 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4197 thiss!1504)) key!932))))

(declare-fun b!223371 () Bool)

(declare-fun Unit!6657 () Unit!6655)

(assert (=> b!223371 (= e!145082 Unit!6657)))

(declare-fun lt!112740 () Unit!6655)

(declare-fun lemmaArrayContainsKeyThenInListMap!69 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) (_ BitVec 32) Int) Unit!6655)

(assert (=> b!223371 (= lt!112740 (lemmaArrayContainsKeyThenInListMap!69 (_keys!6250 thiss!1504) (_values!4180 thiss!1504) (mask!10024 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223371 false))

(declare-fun b!223372 () Bool)

(declare-fun res!109765 () Bool)

(assert (=> b!223372 (=> (not res!109765) (not e!145087))))

(assert (=> b!223372 (= res!109765 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5534 (_keys!6250 thiss!1504)))))))

(declare-fun b!223373 () Bool)

(declare-fun e!145098 () Bool)

(assert (=> b!223373 (= e!145098 (contains!1519 Nil!3300 key!932))))

(declare-fun b!223374 () Bool)

(declare-fun res!109767 () Bool)

(assert (=> b!223374 (=> (not res!109767) (not e!145086))))

(declare-fun call!20814 () Bool)

(assert (=> b!223374 (= res!109767 call!20814)))

(declare-fun e!145085 () Bool)

(assert (=> b!223374 (= e!145085 e!145086)))

(declare-fun bm!20810 () Bool)

(assert (=> bm!20810 (= call!20813 (arrayContainsKey!0 (_keys!6250 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223375 () Bool)

(declare-fun e!145092 () Bool)

(get-info :version)

(assert (=> b!223375 (= e!145092 ((_ is Undefined!844) lt!112739))))

(declare-fun b!223376 () Bool)

(declare-fun res!109761 () Bool)

(assert (=> b!223376 (=> (not res!109761) (not e!145087))))

(declare-fun arrayNoDuplicates!0 (array!10963 (_ BitVec 32) List!3303) Bool)

(assert (=> b!223376 (= res!109761 (arrayNoDuplicates!0 (_keys!6250 thiss!1504) #b00000000000000000000000000000000 Nil!3300))))

(declare-fun b!223377 () Bool)

(declare-fun e!145093 () Bool)

(assert (=> b!223377 (= e!145093 e!145089)))

(declare-fun res!109769 () Bool)

(assert (=> b!223377 (=> (not res!109769) (not e!145089))))

(assert (=> b!223377 (= res!109769 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223378 () Bool)

(declare-fun c!37076 () Bool)

(assert (=> b!223378 (= c!37076 ((_ is MissingVacant!844) lt!112739))))

(assert (=> b!223378 (= e!145085 e!145092)))

(declare-fun res!109760 () Bool)

(declare-fun e!145081 () Bool)

(assert (=> start!21938 (=> (not res!109760) (not e!145081))))

(declare-fun valid!1254 (LongMapFixedSize!3076) Bool)

(assert (=> start!21938 (= res!109760 (valid!1254 thiss!1504))))

(assert (=> start!21938 e!145081))

(declare-fun e!145084 () Bool)

(assert (=> start!21938 e!145084))

(assert (=> start!21938 true))

(declare-fun b!223366 () Bool)

(declare-fun res!109757 () Bool)

(assert (=> b!223366 (=> (not res!109757) (not e!145087))))

(assert (=> b!223366 (= res!109757 (not (contains!1519 Nil!3300 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223379 () Bool)

(declare-fun res!109768 () Bool)

(assert (=> b!223379 (=> (not res!109768) (not e!145081))))

(assert (=> b!223379 (= res!109768 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223380 () Bool)

(declare-fun res!109764 () Bool)

(assert (=> b!223380 (=> (not res!109764) (not e!145087))))

(declare-fun noDuplicate!78 (List!3303) Bool)

(assert (=> b!223380 (= res!109764 (noDuplicate!78 Nil!3300))))

(declare-fun b!223381 () Bool)

(assert (=> b!223381 (= e!145081 e!145097)))

(declare-fun res!109766 () Bool)

(assert (=> b!223381 (=> (not res!109766) (not e!145097))))

(assert (=> b!223381 (= res!109766 (or (= lt!112739 (MissingZero!844 index!297)) (= lt!112739 (MissingVacant!844 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10963 (_ BitVec 32)) SeekEntryResult!844)

(assert (=> b!223381 (= lt!112739 (seekEntryOrOpen!0 key!932 (_keys!6250 thiss!1504) (mask!10024 thiss!1504)))))

(declare-fun b!223382 () Bool)

(declare-fun Unit!6658 () Unit!6655)

(assert (=> b!223382 (= e!145082 Unit!6658)))

(declare-fun b!223383 () Bool)

(declare-fun e!145090 () Bool)

(declare-fun e!145088 () Bool)

(assert (=> b!223383 (= e!145090 (and e!145088 mapRes!9964))))

(declare-fun condMapEmpty!9964 () Bool)

(declare-fun mapDefault!9964 () ValueCell!2588)

(assert (=> b!223383 (= condMapEmpty!9964 (= (arr!5199 (_values!4180 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2588)) mapDefault!9964)))))

(declare-fun b!223384 () Bool)

(assert (=> b!223384 (= e!145087 false)))

(declare-fun lt!112743 () Bool)

(assert (=> b!223384 (= lt!112743 (contains!1519 Nil!3300 key!932))))

(declare-fun c!37075 () Bool)

(declare-fun bm!20811 () Bool)

(assert (=> bm!20811 (= call!20814 (inRange!0 (ite c!37075 (index!5546 lt!112739) (index!5549 lt!112739)) (mask!10024 thiss!1504)))))

(declare-fun mapNonEmpty!9964 () Bool)

(declare-fun tp!21144 () Bool)

(declare-fun e!145095 () Bool)

(assert (=> mapNonEmpty!9964 (= mapRes!9964 (and tp!21144 e!145095))))

(declare-fun mapValue!9964 () ValueCell!2588)

(declare-fun mapKey!9964 () (_ BitVec 32))

(declare-fun mapRest!9964 () (Array (_ BitVec 32) ValueCell!2588))

(assert (=> mapNonEmpty!9964 (= (arr!5199 (_values!4180 thiss!1504)) (store mapRest!9964 mapKey!9964 mapValue!9964))))

(declare-fun b!223385 () Bool)

(declare-fun tp_is_empty!5863 () Bool)

(assert (=> b!223385 (= e!145088 tp_is_empty!5863)))

(declare-fun array_inv!3427 (array!10963) Bool)

(declare-fun array_inv!3428 (array!10961) Bool)

(assert (=> b!223386 (= e!145084 (and tp!21145 tp_is_empty!5863 (array_inv!3427 (_keys!6250 thiss!1504)) (array_inv!3428 (_values!4180 thiss!1504)) e!145090))))

(declare-fun b!223387 () Bool)

(assert (=> b!223387 (= e!145092 e!145094)))

(declare-fun res!109758 () Bool)

(assert (=> b!223387 (= res!109758 call!20814)))

(assert (=> b!223387 (=> (not res!109758) (not e!145094))))

(declare-fun b!223388 () Bool)

(assert (=> b!223388 (= e!145095 tp_is_empty!5863)))

(declare-fun b!223389 () Bool)

(declare-fun lt!112741 () Unit!6655)

(assert (=> b!223389 (= e!145083 lt!112741)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!226 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) Int) Unit!6655)

(assert (=> b!223389 (= lt!112741 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!226 (_keys!6250 thiss!1504) (_values!4180 thiss!1504) (mask!10024 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223389 (= c!37075 ((_ is MissingZero!844) lt!112739))))

(assert (=> b!223389 e!145085))

(declare-fun b!223390 () Bool)

(declare-fun res!109756 () Bool)

(assert (=> b!223390 (=> (not res!109756) (not e!145087))))

(assert (=> b!223390 (= res!109756 e!145093)))

(declare-fun res!109771 () Bool)

(assert (=> b!223390 (=> res!109771 e!145093)))

(assert (=> b!223390 (= res!109771 e!145098)))

(declare-fun res!109772 () Bool)

(assert (=> b!223390 (=> (not res!109772) (not e!145098))))

(assert (=> b!223390 (= res!109772 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223391 () Bool)

(declare-fun Unit!6659 () Unit!6655)

(assert (=> b!223391 (= e!145083 Unit!6659)))

(declare-fun lt!112742 () Unit!6655)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!225 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) Int) Unit!6655)

(assert (=> b!223391 (= lt!112742 (lemmaInListMapThenSeekEntryOrOpenFindsIt!225 (_keys!6250 thiss!1504) (_values!4180 thiss!1504) (mask!10024 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223391 false))

(declare-fun b!223392 () Bool)

(declare-fun res!109770 () Bool)

(assert (=> b!223392 (=> (not res!109770) (not e!145087))))

(assert (=> b!223392 (= res!109770 (not lt!112738))))

(declare-fun b!223393 () Bool)

(assert (=> b!223393 (= e!145086 (not call!20813))))

(assert (= (and start!21938 res!109760) b!223379))

(assert (= (and b!223379 res!109768) b!223381))

(assert (= (and b!223381 res!109766) b!223370))

(assert (= (and b!223370 c!37078) b!223391))

(assert (= (and b!223370 (not c!37078)) b!223389))

(assert (= (and b!223389 c!37075) b!223374))

(assert (= (and b!223389 (not c!37075)) b!223378))

(assert (= (and b!223374 res!109767) b!223362))

(assert (= (and b!223362 res!109763) b!223393))

(assert (= (and b!223378 c!37076) b!223387))

(assert (= (and b!223378 (not c!37076)) b!223375))

(assert (= (and b!223387 res!109758) b!223363))

(assert (= (and b!223363 res!109759) b!223368))

(assert (= (or b!223374 b!223387) bm!20811))

(assert (= (or b!223393 b!223368) bm!20810))

(assert (= (and b!223370 res!109775) b!223364))

(assert (= (and b!223364 c!37077) b!223371))

(assert (= (and b!223364 (not c!37077)) b!223382))

(assert (= (and b!223364 res!109762) b!223380))

(assert (= (and b!223380 res!109764) b!223365))

(assert (= (and b!223365 res!109774) b!223366))

(assert (= (and b!223366 res!109757) b!223390))

(assert (= (and b!223390 res!109772) b!223373))

(assert (= (and b!223390 (not res!109771)) b!223377))

(assert (= (and b!223377 res!109769) b!223367))

(assert (= (and b!223390 res!109756) b!223376))

(assert (= (and b!223376 res!109761) b!223372))

(assert (= (and b!223372 res!109765) b!223369))

(assert (= (and b!223369 res!109773) b!223392))

(assert (= (and b!223392 res!109770) b!223384))

(assert (= (and b!223383 condMapEmpty!9964) mapIsEmpty!9964))

(assert (= (and b!223383 (not condMapEmpty!9964)) mapNonEmpty!9964))

(assert (= (and mapNonEmpty!9964 ((_ is ValueCellFull!2588) mapValue!9964)) b!223388))

(assert (= (and b!223383 ((_ is ValueCellFull!2588) mapDefault!9964)) b!223385))

(assert (= b!223386 b!223383))

(assert (= start!21938 b!223386))

(declare-fun m!246421 () Bool)

(assert (=> b!223381 m!246421))

(declare-fun m!246423 () Bool)

(assert (=> b!223364 m!246423))

(declare-fun m!246425 () Bool)

(assert (=> b!223380 m!246425))

(declare-fun m!246427 () Bool)

(assert (=> b!223363 m!246427))

(declare-fun m!246429 () Bool)

(assert (=> b!223369 m!246429))

(declare-fun m!246431 () Bool)

(assert (=> b!223373 m!246431))

(assert (=> bm!20810 m!246423))

(declare-fun m!246433 () Bool)

(assert (=> b!223370 m!246433))

(declare-fun m!246435 () Bool)

(assert (=> b!223370 m!246435))

(assert (=> b!223370 m!246435))

(declare-fun m!246437 () Bool)

(assert (=> b!223370 m!246437))

(declare-fun m!246439 () Bool)

(assert (=> b!223386 m!246439))

(declare-fun m!246441 () Bool)

(assert (=> b!223386 m!246441))

(declare-fun m!246443 () Bool)

(assert (=> b!223371 m!246443))

(assert (=> b!223367 m!246431))

(declare-fun m!246445 () Bool)

(assert (=> b!223391 m!246445))

(declare-fun m!246447 () Bool)

(assert (=> b!223365 m!246447))

(declare-fun m!246449 () Bool)

(assert (=> b!223366 m!246449))

(declare-fun m!246451 () Bool)

(assert (=> mapNonEmpty!9964 m!246451))

(declare-fun m!246453 () Bool)

(assert (=> bm!20811 m!246453))

(declare-fun m!246455 () Bool)

(assert (=> start!21938 m!246455))

(assert (=> b!223384 m!246431))

(declare-fun m!246457 () Bool)

(assert (=> b!223389 m!246457))

(declare-fun m!246459 () Bool)

(assert (=> b!223376 m!246459))

(declare-fun m!246461 () Bool)

(assert (=> b!223362 m!246461))

(check-sat (not b!223369) (not b!223371) (not b!223389) (not b!223365) (not b!223381) (not start!21938) (not b!223364) (not b!223366) (not b!223376) (not b!223370) (not b!223367) (not b_next!6001) (not b!223380) b_and!12873 (not mapNonEmpty!9964) (not b!223391) (not b!223386) tp_is_empty!5863 (not b!223384) (not bm!20811) (not b!223373) (not bm!20810))
(check-sat b_and!12873 (not b_next!6001))
