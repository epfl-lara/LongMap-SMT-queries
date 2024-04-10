; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22062 () Bool)

(assert start!22062)

(declare-fun b!228377 () Bool)

(declare-fun b_free!6129 () Bool)

(declare-fun b_next!6129 () Bool)

(assert (=> b!228377 (= b_free!6129 (not b_next!6129))))

(declare-fun tp!21529 () Bool)

(declare-fun b_and!13027 () Bool)

(assert (=> b!228377 (= tp!21529 b_and!13027)))

(declare-fun b!228367 () Bool)

(declare-fun res!112414 () Bool)

(declare-fun e!148162 () Bool)

(assert (=> b!228367 (=> res!112414 e!148162)))

(declare-datatypes ((V!7635 0))(
  ( (V!7636 (val!3040 Int)) )
))
(declare-datatypes ((ValueCell!2652 0))(
  ( (ValueCellFull!2652 (v!5060 V!7635)) (EmptyCell!2652) )
))
(declare-datatypes ((array!11225 0))(
  ( (array!11226 (arr!5332 (Array (_ BitVec 32) ValueCell!2652)) (size!5665 (_ BitVec 32))) )
))
(declare-datatypes ((array!11227 0))(
  ( (array!11228 (arr!5333 (Array (_ BitVec 32) (_ BitVec 64))) (size!5666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3204 0))(
  ( (LongMapFixedSize!3205 (defaultEntry!4261 Int) (mask!10131 (_ BitVec 32)) (extraKeys!3998 (_ BitVec 32)) (zeroValue!4102 V!7635) (minValue!4102 V!7635) (_size!1651 (_ BitVec 32)) (_keys!6315 array!11227) (_values!4244 array!11225) (_vacant!1651 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3204)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11227 (_ BitVec 32)) Bool)

(assert (=> b!228367 (= res!112414 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6315 thiss!1504) (mask!10131 thiss!1504))))))

(declare-fun b!228368 () Bool)

(declare-fun res!112411 () Bool)

(declare-datatypes ((SeekEntryResult!907 0))(
  ( (MissingZero!907 (index!5798 (_ BitVec 32))) (Found!907 (index!5799 (_ BitVec 32))) (Intermediate!907 (undefined!1719 Bool) (index!5800 (_ BitVec 32)) (x!23327 (_ BitVec 32))) (Undefined!907) (MissingVacant!907 (index!5801 (_ BitVec 32))) )
))
(declare-fun lt!114900 () SeekEntryResult!907)

(assert (=> b!228368 (= res!112411 (= (select (arr!5333 (_keys!6315 thiss!1504)) (index!5801 lt!114900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148164 () Bool)

(assert (=> b!228368 (=> (not res!112411) (not e!148164))))

(declare-fun b!228369 () Bool)

(declare-fun res!112410 () Bool)

(declare-fun e!148159 () Bool)

(assert (=> b!228369 (=> (not res!112410) (not e!148159))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!228369 (= res!112410 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun c!37870 () Bool)

(declare-fun call!21222 () Bool)

(declare-fun bm!21218 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21218 (= call!21222 (inRange!0 (ite c!37870 (index!5798 lt!114900) (index!5801 lt!114900)) (mask!10131 thiss!1504)))))

(declare-fun b!228370 () Bool)

(declare-datatypes ((Unit!6943 0))(
  ( (Unit!6944) )
))
(declare-fun e!148169 () Unit!6943)

(declare-fun Unit!6945 () Unit!6943)

(assert (=> b!228370 (= e!148169 Unit!6945)))

(declare-fun b!228371 () Bool)

(declare-fun e!148158 () Bool)

(declare-fun call!21221 () Bool)

(assert (=> b!228371 (= e!148158 (not call!21221))))

(declare-fun b!228372 () Bool)

(declare-fun c!37872 () Bool)

(get-info :version)

(assert (=> b!228372 (= c!37872 ((_ is MissingVacant!907) lt!114900))))

(declare-fun e!148167 () Bool)

(declare-fun e!148168 () Bool)

(assert (=> b!228372 (= e!148167 e!148168)))

(declare-fun bm!21219 () Bool)

(declare-fun arrayContainsKey!0 (array!11227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21219 (= call!21221 (arrayContainsKey!0 (_keys!6315 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228373 () Bool)

(declare-fun e!148155 () Bool)

(assert (=> b!228373 (= e!148155 (not e!148162))))

(declare-fun res!112407 () Bool)

(assert (=> b!228373 (=> res!112407 e!148162)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228373 (= res!112407 (not (validMask!0 (mask!10131 thiss!1504))))))

(declare-fun lt!114901 () array!11227)

(assert (=> b!228373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114901 (mask!10131 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114897 () Unit!6943)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11227 (_ BitVec 32) (_ BitVec 32)) Unit!6943)

(assert (=> b!228373 (= lt!114897 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6315 thiss!1504) index!297 (mask!10131 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11227 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228373 (= (arrayCountValidKeys!0 lt!114901 #b00000000000000000000000000000000 (size!5666 (_keys!6315 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6315 thiss!1504) #b00000000000000000000000000000000 (size!5666 (_keys!6315 thiss!1504)))))))

(declare-fun lt!114902 () Unit!6943)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11227 (_ BitVec 32) (_ BitVec 64)) Unit!6943)

(assert (=> b!228373 (= lt!114902 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6315 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3409 0))(
  ( (Nil!3406) (Cons!3405 (h!4053 (_ BitVec 64)) (t!8368 List!3409)) )
))
(declare-fun arrayNoDuplicates!0 (array!11227 (_ BitVec 32) List!3409) Bool)

(assert (=> b!228373 (arrayNoDuplicates!0 lt!114901 #b00000000000000000000000000000000 Nil!3406)))

(assert (=> b!228373 (= lt!114901 (array!11228 (store (arr!5333 (_keys!6315 thiss!1504)) index!297 key!932) (size!5666 (_keys!6315 thiss!1504))))))

(declare-fun lt!114896 () Unit!6943)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3409) Unit!6943)

(assert (=> b!228373 (= lt!114896 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6315 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3406))))

(declare-fun lt!114894 () Unit!6943)

(assert (=> b!228373 (= lt!114894 e!148169)))

(declare-fun c!37869 () Bool)

(assert (=> b!228373 (= c!37869 (arrayContainsKey!0 (_keys!6315 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228374 () Bool)

(assert (=> b!228374 (= e!148164 (not call!21221))))

(declare-fun b!228366 () Bool)

(assert (=> b!228366 (= e!148162 true)))

(declare-fun lt!114892 () Bool)

(assert (=> b!228366 (= lt!114892 (arrayNoDuplicates!0 (_keys!6315 thiss!1504) #b00000000000000000000000000000000 Nil!3406))))

(declare-fun res!112405 () Bool)

(assert (=> start!22062 (=> (not res!112405) (not e!148159))))

(declare-fun valid!1282 (LongMapFixedSize!3204) Bool)

(assert (=> start!22062 (= res!112405 (valid!1282 thiss!1504))))

(assert (=> start!22062 e!148159))

(declare-fun e!148157 () Bool)

(assert (=> start!22062 e!148157))

(assert (=> start!22062 true))

(declare-fun b!228375 () Bool)

(declare-fun Unit!6946 () Unit!6943)

(assert (=> b!228375 (= e!148169 Unit!6946)))

(declare-fun lt!114898 () Unit!6943)

(declare-fun lemmaArrayContainsKeyThenInListMap!109 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7635 V!7635 (_ BitVec 64) (_ BitVec 32) Int) Unit!6943)

(assert (=> b!228375 (= lt!114898 (lemmaArrayContainsKeyThenInListMap!109 (_keys!6315 thiss!1504) (_values!4244 thiss!1504) (mask!10131 thiss!1504) (extraKeys!3998 thiss!1504) (zeroValue!4102 thiss!1504) (minValue!4102 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4261 thiss!1504)))))

(assert (=> b!228375 false))

(declare-fun mapIsEmpty!10156 () Bool)

(declare-fun mapRes!10156 () Bool)

(assert (=> mapIsEmpty!10156 mapRes!10156))

(declare-fun b!228376 () Bool)

(declare-fun e!148165 () Bool)

(declare-fun tp_is_empty!5991 () Bool)

(assert (=> b!228376 (= e!148165 tp_is_empty!5991)))

(declare-fun e!148160 () Bool)

(declare-fun array_inv!3525 (array!11227) Bool)

(declare-fun array_inv!3526 (array!11225) Bool)

(assert (=> b!228377 (= e!148157 (and tp!21529 tp_is_empty!5991 (array_inv!3525 (_keys!6315 thiss!1504)) (array_inv!3526 (_values!4244 thiss!1504)) e!148160))))

(declare-fun b!228378 () Bool)

(assert (=> b!228378 (= e!148168 e!148164)))

(declare-fun res!112413 () Bool)

(assert (=> b!228378 (= res!112413 call!21222)))

(assert (=> b!228378 (=> (not res!112413) (not e!148164))))

(declare-fun mapNonEmpty!10156 () Bool)

(declare-fun tp!21528 () Bool)

(declare-fun e!148156 () Bool)

(assert (=> mapNonEmpty!10156 (= mapRes!10156 (and tp!21528 e!148156))))

(declare-fun mapValue!10156 () ValueCell!2652)

(declare-fun mapRest!10156 () (Array (_ BitVec 32) ValueCell!2652))

(declare-fun mapKey!10156 () (_ BitVec 32))

(assert (=> mapNonEmpty!10156 (= (arr!5332 (_values!4244 thiss!1504)) (store mapRest!10156 mapKey!10156 mapValue!10156))))

(declare-fun b!228379 () Bool)

(declare-fun e!148161 () Unit!6943)

(declare-fun lt!114893 () Unit!6943)

(assert (=> b!228379 (= e!148161 lt!114893)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!286 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7635 V!7635 (_ BitVec 64) Int) Unit!6943)

(assert (=> b!228379 (= lt!114893 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!286 (_keys!6315 thiss!1504) (_values!4244 thiss!1504) (mask!10131 thiss!1504) (extraKeys!3998 thiss!1504) (zeroValue!4102 thiss!1504) (minValue!4102 thiss!1504) key!932 (defaultEntry!4261 thiss!1504)))))

(assert (=> b!228379 (= c!37870 ((_ is MissingZero!907) lt!114900))))

(assert (=> b!228379 e!148167))

(declare-fun b!228380 () Bool)

(assert (=> b!228380 (= e!148168 ((_ is Undefined!907) lt!114900))))

(declare-fun b!228381 () Bool)

(declare-fun e!148166 () Bool)

(assert (=> b!228381 (= e!148166 e!148155)))

(declare-fun res!112412 () Bool)

(assert (=> b!228381 (=> (not res!112412) (not e!148155))))

(assert (=> b!228381 (= res!112412 (inRange!0 index!297 (mask!10131 thiss!1504)))))

(declare-fun lt!114895 () Unit!6943)

(assert (=> b!228381 (= lt!114895 e!148161)))

(declare-fun c!37871 () Bool)

(declare-datatypes ((tuple2!4488 0))(
  ( (tuple2!4489 (_1!2255 (_ BitVec 64)) (_2!2255 V!7635)) )
))
(declare-datatypes ((List!3410 0))(
  ( (Nil!3407) (Cons!3406 (h!4054 tuple2!4488) (t!8369 List!3410)) )
))
(declare-datatypes ((ListLongMap!3401 0))(
  ( (ListLongMap!3402 (toList!1716 List!3410)) )
))
(declare-fun contains!1590 (ListLongMap!3401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1244 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7635 V!7635 (_ BitVec 32) Int) ListLongMap!3401)

(assert (=> b!228381 (= c!37871 (contains!1590 (getCurrentListMap!1244 (_keys!6315 thiss!1504) (_values!4244 thiss!1504) (mask!10131 thiss!1504) (extraKeys!3998 thiss!1504) (zeroValue!4102 thiss!1504) (minValue!4102 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4261 thiss!1504)) key!932))))

(declare-fun b!228382 () Bool)

(assert (=> b!228382 (= e!148156 tp_is_empty!5991)))

(declare-fun b!228383 () Bool)

(assert (=> b!228383 (= e!148160 (and e!148165 mapRes!10156))))

(declare-fun condMapEmpty!10156 () Bool)

(declare-fun mapDefault!10156 () ValueCell!2652)

(assert (=> b!228383 (= condMapEmpty!10156 (= (arr!5332 (_values!4244 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2652)) mapDefault!10156)))))

(declare-fun b!228384 () Bool)

(declare-fun Unit!6947 () Unit!6943)

(assert (=> b!228384 (= e!148161 Unit!6947)))

(declare-fun lt!114899 () Unit!6943)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!272 (array!11227 array!11225 (_ BitVec 32) (_ BitVec 32) V!7635 V!7635 (_ BitVec 64) Int) Unit!6943)

(assert (=> b!228384 (= lt!114899 (lemmaInListMapThenSeekEntryOrOpenFindsIt!272 (_keys!6315 thiss!1504) (_values!4244 thiss!1504) (mask!10131 thiss!1504) (extraKeys!3998 thiss!1504) (zeroValue!4102 thiss!1504) (minValue!4102 thiss!1504) key!932 (defaultEntry!4261 thiss!1504)))))

(assert (=> b!228384 false))

(declare-fun b!228385 () Bool)

(declare-fun res!112406 () Bool)

(assert (=> b!228385 (=> res!112406 e!148162)))

(assert (=> b!228385 (= res!112406 (or (not (= (size!5665 (_values!4244 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10131 thiss!1504)))) (not (= (size!5666 (_keys!6315 thiss!1504)) (size!5665 (_values!4244 thiss!1504)))) (bvslt (mask!10131 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3998 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3998 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228386 () Bool)

(declare-fun res!112409 () Bool)

(assert (=> b!228386 (=> (not res!112409) (not e!148158))))

(assert (=> b!228386 (= res!112409 call!21222)))

(assert (=> b!228386 (= e!148167 e!148158)))

(declare-fun b!228387 () Bool)

(declare-fun res!112404 () Bool)

(assert (=> b!228387 (=> (not res!112404) (not e!148158))))

(assert (=> b!228387 (= res!112404 (= (select (arr!5333 (_keys!6315 thiss!1504)) (index!5798 lt!114900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228388 () Bool)

(assert (=> b!228388 (= e!148159 e!148166)))

(declare-fun res!112408 () Bool)

(assert (=> b!228388 (=> (not res!112408) (not e!148166))))

(assert (=> b!228388 (= res!112408 (or (= lt!114900 (MissingZero!907 index!297)) (= lt!114900 (MissingVacant!907 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11227 (_ BitVec 32)) SeekEntryResult!907)

(assert (=> b!228388 (= lt!114900 (seekEntryOrOpen!0 key!932 (_keys!6315 thiss!1504) (mask!10131 thiss!1504)))))

(assert (= (and start!22062 res!112405) b!228369))

(assert (= (and b!228369 res!112410) b!228388))

(assert (= (and b!228388 res!112408) b!228381))

(assert (= (and b!228381 c!37871) b!228384))

(assert (= (and b!228381 (not c!37871)) b!228379))

(assert (= (and b!228379 c!37870) b!228386))

(assert (= (and b!228379 (not c!37870)) b!228372))

(assert (= (and b!228386 res!112409) b!228387))

(assert (= (and b!228387 res!112404) b!228371))

(assert (= (and b!228372 c!37872) b!228378))

(assert (= (and b!228372 (not c!37872)) b!228380))

(assert (= (and b!228378 res!112413) b!228368))

(assert (= (and b!228368 res!112411) b!228374))

(assert (= (or b!228386 b!228378) bm!21218))

(assert (= (or b!228371 b!228374) bm!21219))

(assert (= (and b!228381 res!112412) b!228373))

(assert (= (and b!228373 c!37869) b!228375))

(assert (= (and b!228373 (not c!37869)) b!228370))

(assert (= (and b!228373 (not res!112407)) b!228385))

(assert (= (and b!228385 (not res!112406)) b!228367))

(assert (= (and b!228367 (not res!112414)) b!228366))

(assert (= (and b!228383 condMapEmpty!10156) mapIsEmpty!10156))

(assert (= (and b!228383 (not condMapEmpty!10156)) mapNonEmpty!10156))

(assert (= (and mapNonEmpty!10156 ((_ is ValueCellFull!2652) mapValue!10156)) b!228382))

(assert (= (and b!228383 ((_ is ValueCellFull!2652) mapDefault!10156)) b!228376))

(assert (= b!228377 b!228383))

(assert (= start!22062 b!228377))

(declare-fun m!250143 () Bool)

(assert (=> b!228384 m!250143))

(declare-fun m!250145 () Bool)

(assert (=> b!228366 m!250145))

(declare-fun m!250147 () Bool)

(assert (=> b!228387 m!250147))

(declare-fun m!250149 () Bool)

(assert (=> b!228381 m!250149))

(declare-fun m!250151 () Bool)

(assert (=> b!228381 m!250151))

(assert (=> b!228381 m!250151))

(declare-fun m!250153 () Bool)

(assert (=> b!228381 m!250153))

(declare-fun m!250155 () Bool)

(assert (=> b!228375 m!250155))

(declare-fun m!250157 () Bool)

(assert (=> b!228379 m!250157))

(declare-fun m!250159 () Bool)

(assert (=> bm!21218 m!250159))

(declare-fun m!250161 () Bool)

(assert (=> b!228373 m!250161))

(declare-fun m!250163 () Bool)

(assert (=> b!228373 m!250163))

(declare-fun m!250165 () Bool)

(assert (=> b!228373 m!250165))

(declare-fun m!250167 () Bool)

(assert (=> b!228373 m!250167))

(declare-fun m!250169 () Bool)

(assert (=> b!228373 m!250169))

(declare-fun m!250171 () Bool)

(assert (=> b!228373 m!250171))

(declare-fun m!250173 () Bool)

(assert (=> b!228373 m!250173))

(declare-fun m!250175 () Bool)

(assert (=> b!228373 m!250175))

(declare-fun m!250177 () Bool)

(assert (=> b!228373 m!250177))

(declare-fun m!250179 () Bool)

(assert (=> b!228373 m!250179))

(assert (=> bm!21219 m!250163))

(declare-fun m!250181 () Bool)

(assert (=> b!228388 m!250181))

(declare-fun m!250183 () Bool)

(assert (=> mapNonEmpty!10156 m!250183))

(declare-fun m!250185 () Bool)

(assert (=> start!22062 m!250185))

(declare-fun m!250187 () Bool)

(assert (=> b!228367 m!250187))

(declare-fun m!250189 () Bool)

(assert (=> b!228368 m!250189))

(declare-fun m!250191 () Bool)

(assert (=> b!228377 m!250191))

(declare-fun m!250193 () Bool)

(assert (=> b!228377 m!250193))

(check-sat (not bm!21219) (not b!228381) (not b!228377) (not start!22062) b_and!13027 (not b!228379) (not bm!21218) (not b!228384) (not b!228366) (not b!228375) (not b_next!6129) (not b!228367) tp_is_empty!5991 (not b!228373) (not b!228388) (not mapNonEmpty!10156))
(check-sat b_and!13027 (not b_next!6129))
