; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22964 () Bool)

(assert start!22964)

(declare-fun b!240384 () Bool)

(declare-fun b_free!6463 () Bool)

(declare-fun b_next!6463 () Bool)

(assert (=> b!240384 (= b_free!6463 (not b_next!6463))))

(declare-fun tp!22592 () Bool)

(declare-fun b_and!13443 () Bool)

(assert (=> b!240384 (= tp!22592 b_and!13443)))

(declare-fun b!240369 () Bool)

(declare-fun res!117845 () Bool)

(declare-fun e!156030 () Bool)

(assert (=> b!240369 (=> (not res!117845) (not e!156030))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!240369 (= res!117845 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10719 () Bool)

(declare-fun mapRes!10719 () Bool)

(declare-fun tp!22593 () Bool)

(declare-fun e!156020 () Bool)

(assert (=> mapNonEmpty!10719 (= mapRes!10719 (and tp!22593 e!156020))))

(declare-datatypes ((V!8081 0))(
  ( (V!8082 (val!3207 Int)) )
))
(declare-datatypes ((ValueCell!2819 0))(
  ( (ValueCellFull!2819 (v!5246 V!8081)) (EmptyCell!2819) )
))
(declare-datatypes ((array!11927 0))(
  ( (array!11928 (arr!5665 (Array (_ BitVec 32) ValueCell!2819)) (size!6006 (_ BitVec 32))) )
))
(declare-datatypes ((array!11929 0))(
  ( (array!11930 (arr!5666 (Array (_ BitVec 32) (_ BitVec 64))) (size!6007 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3538 0))(
  ( (LongMapFixedSize!3539 (defaultEntry!4454 Int) (mask!10510 (_ BitVec 32)) (extraKeys!4191 (_ BitVec 32)) (zeroValue!4295 V!8081) (minValue!4295 V!8081) (_size!1818 (_ BitVec 32)) (_keys!6556 array!11929) (_values!4437 array!11927) (_vacant!1818 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3538)

(declare-fun mapValue!10719 () ValueCell!2819)

(declare-fun mapRest!10719 () (Array (_ BitVec 32) ValueCell!2819))

(declare-fun mapKey!10719 () (_ BitVec 32))

(assert (=> mapNonEmpty!10719 (= (arr!5665 (_values!4437 thiss!1504)) (store mapRest!10719 mapKey!10719 mapValue!10719))))

(declare-fun b!240370 () Bool)

(declare-fun tp_is_empty!6325 () Bool)

(assert (=> b!240370 (= e!156020 tp_is_empty!6325)))

(declare-fun b!240371 () Bool)

(declare-fun e!156024 () Bool)

(assert (=> b!240371 (= e!156024 tp_is_empty!6325)))

(declare-fun mapIsEmpty!10719 () Bool)

(assert (=> mapIsEmpty!10719 mapRes!10719))

(declare-fun b!240372 () Bool)

(declare-fun e!156022 () Bool)

(declare-fun call!22337 () Bool)

(assert (=> b!240372 (= e!156022 (not call!22337))))

(declare-fun b!240373 () Bool)

(declare-fun e!156025 () Bool)

(assert (=> b!240373 (= e!156025 (not call!22337))))

(declare-fun b!240375 () Bool)

(declare-fun res!117848 () Bool)

(assert (=> b!240375 (=> (not res!117848) (not e!156025))))

(declare-datatypes ((SeekEntryResult!1012 0))(
  ( (MissingZero!1012 (index!6218 (_ BitVec 32))) (Found!1012 (index!6219 (_ BitVec 32))) (Intermediate!1012 (undefined!1824 Bool) (index!6220 (_ BitVec 32)) (x!24124 (_ BitVec 32))) (Undefined!1012) (MissingVacant!1012 (index!6221 (_ BitVec 32))) )
))
(declare-fun lt!121013 () SeekEntryResult!1012)

(assert (=> b!240375 (= res!117848 (= (select (arr!5666 (_keys!6556 thiss!1504)) (index!6218 lt!121013)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240376 () Bool)

(declare-fun e!156023 () Bool)

(assert (=> b!240376 (= e!156023 (and e!156024 mapRes!10719))))

(declare-fun condMapEmpty!10719 () Bool)

(declare-fun mapDefault!10719 () ValueCell!2819)

(assert (=> b!240376 (= condMapEmpty!10719 (= (arr!5665 (_values!4437 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2819)) mapDefault!10719)))))

(declare-fun b!240377 () Bool)

(declare-fun res!117847 () Bool)

(declare-fun e!156028 () Bool)

(assert (=> b!240377 (=> (not res!117847) (not e!156028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11929 (_ BitVec 32)) Bool)

(assert (=> b!240377 (= res!117847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6556 thiss!1504) (mask!10510 thiss!1504)))))

(declare-fun b!240378 () Bool)

(declare-fun res!117850 () Bool)

(assert (=> b!240378 (=> (not res!117850) (not e!156028))))

(declare-datatypes ((List!3528 0))(
  ( (Nil!3525) (Cons!3524 (h!4180 (_ BitVec 64)) (t!8515 List!3528)) )
))
(declare-fun arrayNoDuplicates!0 (array!11929 (_ BitVec 32) List!3528) Bool)

(assert (=> b!240378 (= res!117850 (arrayNoDuplicates!0 (_keys!6556 thiss!1504) #b00000000000000000000000000000000 Nil!3525))))

(declare-fun b!240379 () Bool)

(declare-fun res!117849 () Bool)

(assert (=> b!240379 (=> (not res!117849) (not e!156028))))

(declare-fun arrayContainsKey!0 (array!11929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240379 (= res!117849 (arrayContainsKey!0 (_keys!6556 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!22338 () Bool)

(declare-fun c!40050 () Bool)

(declare-fun bm!22334 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22334 (= call!22338 (inRange!0 (ite c!40050 (index!6218 lt!121013) (index!6221 lt!121013)) (mask!10510 thiss!1504)))))

(declare-fun b!240380 () Bool)

(declare-fun c!40048 () Bool)

(get-info :version)

(assert (=> b!240380 (= c!40048 ((_ is MissingVacant!1012) lt!121013))))

(declare-fun e!156027 () Bool)

(declare-fun e!156029 () Bool)

(assert (=> b!240380 (= e!156027 e!156029)))

(declare-fun b!240381 () Bool)

(declare-fun e!156026 () Bool)

(assert (=> b!240381 (= e!156030 e!156026)))

(declare-fun res!117842 () Bool)

(assert (=> b!240381 (=> (not res!117842) (not e!156026))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240381 (= res!117842 (or (= lt!121013 (MissingZero!1012 index!297)) (= lt!121013 (MissingVacant!1012 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11929 (_ BitVec 32)) SeekEntryResult!1012)

(assert (=> b!240381 (= lt!121013 (seekEntryOrOpen!0 key!932 (_keys!6556 thiss!1504) (mask!10510 thiss!1504)))))

(declare-fun b!240382 () Bool)

(declare-fun res!117844 () Bool)

(assert (=> b!240382 (=> (not res!117844) (not e!156028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240382 (= res!117844 (validKeyInArray!0 key!932))))

(declare-fun b!240374 () Bool)

(declare-datatypes ((Unit!7368 0))(
  ( (Unit!7369) )
))
(declare-fun e!156019 () Unit!7368)

(declare-fun Unit!7370 () Unit!7368)

(assert (=> b!240374 (= e!156019 Unit!7370)))

(declare-fun lt!121016 () Unit!7368)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!340 (array!11929 array!11927 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 64) Int) Unit!7368)

(assert (=> b!240374 (= lt!121016 (lemmaInListMapThenSeekEntryOrOpenFindsIt!340 (_keys!6556 thiss!1504) (_values!4437 thiss!1504) (mask!10510 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) key!932 (defaultEntry!4454 thiss!1504)))))

(assert (=> b!240374 false))

(declare-fun res!117852 () Bool)

(assert (=> start!22964 (=> (not res!117852) (not e!156030))))

(declare-fun valid!1404 (LongMapFixedSize!3538) Bool)

(assert (=> start!22964 (= res!117852 (valid!1404 thiss!1504))))

(assert (=> start!22964 e!156030))

(declare-fun e!156018 () Bool)

(assert (=> start!22964 e!156018))

(assert (=> start!22964 true))

(declare-fun b!240383 () Bool)

(assert (=> b!240383 (= e!156029 ((_ is Undefined!1012) lt!121013))))

(declare-fun array_inv!3723 (array!11929) Bool)

(declare-fun array_inv!3724 (array!11927) Bool)

(assert (=> b!240384 (= e!156018 (and tp!22592 tp_is_empty!6325 (array_inv!3723 (_keys!6556 thiss!1504)) (array_inv!3724 (_values!4437 thiss!1504)) e!156023))))

(declare-fun b!240385 () Bool)

(assert (=> b!240385 (= e!156026 e!156028)))

(declare-fun res!117846 () Bool)

(assert (=> b!240385 (=> (not res!117846) (not e!156028))))

(assert (=> b!240385 (= res!117846 (inRange!0 index!297 (mask!10510 thiss!1504)))))

(declare-fun lt!121014 () Unit!7368)

(assert (=> b!240385 (= lt!121014 e!156019)))

(declare-fun c!40049 () Bool)

(declare-datatypes ((tuple2!4652 0))(
  ( (tuple2!4653 (_1!2337 (_ BitVec 64)) (_2!2337 V!8081)) )
))
(declare-datatypes ((List!3529 0))(
  ( (Nil!3526) (Cons!3525 (h!4181 tuple2!4652) (t!8516 List!3529)) )
))
(declare-datatypes ((ListLongMap!3567 0))(
  ( (ListLongMap!3568 (toList!1799 List!3529)) )
))
(declare-fun contains!1701 (ListLongMap!3567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1331 (array!11929 array!11927 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 32) Int) ListLongMap!3567)

(assert (=> b!240385 (= c!40049 (contains!1701 (getCurrentListMap!1331 (_keys!6556 thiss!1504) (_values!4437 thiss!1504) (mask!10510 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4454 thiss!1504)) key!932))))

(declare-fun b!240386 () Bool)

(declare-fun res!117854 () Bool)

(assert (=> b!240386 (=> (not res!117854) (not e!156028))))

(assert (=> b!240386 (= res!117854 (and (= (size!6006 (_values!4437 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10510 thiss!1504))) (= (size!6007 (_keys!6556 thiss!1504)) (size!6006 (_values!4437 thiss!1504))) (bvsge (mask!10510 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4191 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4191 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240387 () Bool)

(declare-fun res!117841 () Bool)

(assert (=> b!240387 (=> (not res!117841) (not e!156028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240387 (= res!117841 (validMask!0 (mask!10510 thiss!1504)))))

(declare-fun b!240388 () Bool)

(assert (=> b!240388 (= e!156029 e!156022)))

(declare-fun res!117843 () Bool)

(assert (=> b!240388 (= res!117843 call!22338)))

(assert (=> b!240388 (=> (not res!117843) (not e!156022))))

(declare-fun b!240389 () Bool)

(declare-fun res!117853 () Bool)

(assert (=> b!240389 (= res!117853 (= (select (arr!5666 (_keys!6556 thiss!1504)) (index!6221 lt!121013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240389 (=> (not res!117853) (not e!156022))))

(declare-fun b!240390 () Bool)

(declare-fun lt!121015 () Unit!7368)

(assert (=> b!240390 (= e!156019 lt!121015)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!334 (array!11929 array!11927 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 64) Int) Unit!7368)

(assert (=> b!240390 (= lt!121015 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!334 (_keys!6556 thiss!1504) (_values!4437 thiss!1504) (mask!10510 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) key!932 (defaultEntry!4454 thiss!1504)))))

(assert (=> b!240390 (= c!40050 ((_ is MissingZero!1012) lt!121013))))

(assert (=> b!240390 e!156027))

(declare-fun b!240391 () Bool)

(declare-fun res!117851 () Bool)

(assert (=> b!240391 (=> (not res!117851) (not e!156025))))

(assert (=> b!240391 (= res!117851 call!22338)))

(assert (=> b!240391 (= e!156027 e!156025)))

(declare-fun b!240392 () Bool)

(assert (=> b!240392 (= e!156028 (bvsge #b00000000000000000000000000000000 (size!6007 (_keys!6556 thiss!1504))))))

(declare-fun bm!22335 () Bool)

(assert (=> bm!22335 (= call!22337 (arrayContainsKey!0 (_keys!6556 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!22964 res!117852) b!240369))

(assert (= (and b!240369 res!117845) b!240381))

(assert (= (and b!240381 res!117842) b!240385))

(assert (= (and b!240385 c!40049) b!240374))

(assert (= (and b!240385 (not c!40049)) b!240390))

(assert (= (and b!240390 c!40050) b!240391))

(assert (= (and b!240390 (not c!40050)) b!240380))

(assert (= (and b!240391 res!117851) b!240375))

(assert (= (and b!240375 res!117848) b!240373))

(assert (= (and b!240380 c!40048) b!240388))

(assert (= (and b!240380 (not c!40048)) b!240383))

(assert (= (and b!240388 res!117843) b!240389))

(assert (= (and b!240389 res!117853) b!240372))

(assert (= (or b!240391 b!240388) bm!22334))

(assert (= (or b!240373 b!240372) bm!22335))

(assert (= (and b!240385 res!117846) b!240379))

(assert (= (and b!240379 res!117849) b!240387))

(assert (= (and b!240387 res!117841) b!240386))

(assert (= (and b!240386 res!117854) b!240377))

(assert (= (and b!240377 res!117847) b!240378))

(assert (= (and b!240378 res!117850) b!240382))

(assert (= (and b!240382 res!117844) b!240392))

(assert (= (and b!240376 condMapEmpty!10719) mapIsEmpty!10719))

(assert (= (and b!240376 (not condMapEmpty!10719)) mapNonEmpty!10719))

(assert (= (and mapNonEmpty!10719 ((_ is ValueCellFull!2819) mapValue!10719)) b!240370))

(assert (= (and b!240376 ((_ is ValueCellFull!2819) mapDefault!10719)) b!240371))

(assert (= b!240384 b!240376))

(assert (= start!22964 b!240384))

(declare-fun m!260137 () Bool)

(assert (=> start!22964 m!260137))

(declare-fun m!260139 () Bool)

(assert (=> b!240384 m!260139))

(declare-fun m!260141 () Bool)

(assert (=> b!240384 m!260141))

(declare-fun m!260143 () Bool)

(assert (=> bm!22335 m!260143))

(assert (=> b!240379 m!260143))

(declare-fun m!260145 () Bool)

(assert (=> b!240377 m!260145))

(declare-fun m!260147 () Bool)

(assert (=> b!240382 m!260147))

(declare-fun m!260149 () Bool)

(assert (=> b!240385 m!260149))

(declare-fun m!260151 () Bool)

(assert (=> b!240385 m!260151))

(assert (=> b!240385 m!260151))

(declare-fun m!260153 () Bool)

(assert (=> b!240385 m!260153))

(declare-fun m!260155 () Bool)

(assert (=> bm!22334 m!260155))

(declare-fun m!260157 () Bool)

(assert (=> b!240374 m!260157))

(declare-fun m!260159 () Bool)

(assert (=> mapNonEmpty!10719 m!260159))

(declare-fun m!260161 () Bool)

(assert (=> b!240375 m!260161))

(declare-fun m!260163 () Bool)

(assert (=> b!240389 m!260163))

(declare-fun m!260165 () Bool)

(assert (=> b!240378 m!260165))

(declare-fun m!260167 () Bool)

(assert (=> b!240387 m!260167))

(declare-fun m!260169 () Bool)

(assert (=> b!240390 m!260169))

(declare-fun m!260171 () Bool)

(assert (=> b!240381 m!260171))

(check-sat b_and!13443 (not bm!22334) (not mapNonEmpty!10719) (not start!22964) (not b_next!6463) (not b!240382) (not b!240377) (not b!240381) (not b!240385) (not bm!22335) (not b!240378) (not b!240384) (not b!240387) (not b!240390) tp_is_empty!6325 (not b!240374) (not b!240379))
(check-sat b_and!13443 (not b_next!6463))
