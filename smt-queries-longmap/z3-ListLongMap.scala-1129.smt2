; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23214 () Bool)

(assert start!23214)

(declare-fun b!243620 () Bool)

(declare-fun b_free!6525 () Bool)

(declare-fun b_next!6525 () Bool)

(assert (=> b!243620 (= b_free!6525 (not b_next!6525))))

(declare-fun tp!22797 () Bool)

(declare-fun b_and!13507 () Bool)

(assert (=> b!243620 (= tp!22797 b_and!13507)))

(declare-fun b!243595 () Bool)

(declare-datatypes ((Unit!7513 0))(
  ( (Unit!7514) )
))
(declare-fun e!158095 () Unit!7513)

(declare-fun Unit!7515 () Unit!7513)

(assert (=> b!243595 (= e!158095 Unit!7515)))

(declare-fun lt!122239 () Unit!7513)

(declare-datatypes ((V!8163 0))(
  ( (V!8164 (val!3238 Int)) )
))
(declare-datatypes ((ValueCell!2850 0))(
  ( (ValueCellFull!2850 (v!5285 V!8163)) (EmptyCell!2850) )
))
(declare-datatypes ((array!12065 0))(
  ( (array!12066 (arr!5728 (Array (_ BitVec 32) ValueCell!2850)) (size!6070 (_ BitVec 32))) )
))
(declare-datatypes ((array!12067 0))(
  ( (array!12068 (arr!5729 (Array (_ BitVec 32) (_ BitVec 64))) (size!6071 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3600 0))(
  ( (LongMapFixedSize!3601 (defaultEntry!4513 Int) (mask!10606 (_ BitVec 32)) (extraKeys!4250 (_ BitVec 32)) (zeroValue!4354 V!8163) (minValue!4354 V!8163) (_size!1849 (_ BitVec 32)) (_keys!6624 array!12067) (_values!4496 array!12065) (_vacant!1849 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3600)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!360 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8163 V!8163 (_ BitVec 64) Int) Unit!7513)

(assert (=> b!243595 (= lt!122239 (lemmaInListMapThenSeekEntryOrOpenFindsIt!360 (_keys!6624 thiss!1504) (_values!4496 thiss!1504) (mask!10606 thiss!1504) (extraKeys!4250 thiss!1504) (zeroValue!4354 thiss!1504) (minValue!4354 thiss!1504) key!932 (defaultEntry!4513 thiss!1504)))))

(assert (=> b!243595 false))

(declare-fun b!243596 () Bool)

(declare-fun e!158094 () Bool)

(declare-datatypes ((List!3647 0))(
  ( (Nil!3644) (Cons!3643 (h!4300 (_ BitVec 64)) (t!8654 List!3647)) )
))
(declare-fun contains!1754 (List!3647 (_ BitVec 64)) Bool)

(assert (=> b!243596 (= e!158094 (not (contains!1754 Nil!3644 key!932)))))

(declare-fun b!243597 () Bool)

(declare-fun e!158090 () Bool)

(declare-fun call!22719 () Bool)

(assert (=> b!243597 (= e!158090 (not call!22719))))

(declare-fun b!243598 () Bool)

(declare-fun lt!122240 () Unit!7513)

(assert (=> b!243598 (= e!158095 lt!122240)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!369 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8163 V!8163 (_ BitVec 64) Int) Unit!7513)

(assert (=> b!243598 (= lt!122240 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!369 (_keys!6624 thiss!1504) (_values!4496 thiss!1504) (mask!10606 thiss!1504) (extraKeys!4250 thiss!1504) (zeroValue!4354 thiss!1504) (minValue!4354 thiss!1504) key!932 (defaultEntry!4513 thiss!1504)))))

(declare-fun c!40664 () Bool)

(declare-datatypes ((SeekEntryResult!1073 0))(
  ( (MissingZero!1073 (index!6462 (_ BitVec 32))) (Found!1073 (index!6463 (_ BitVec 32))) (Intermediate!1073 (undefined!1885 Bool) (index!6464 (_ BitVec 32)) (x!24333 (_ BitVec 32))) (Undefined!1073) (MissingVacant!1073 (index!6465 (_ BitVec 32))) )
))
(declare-fun lt!122242 () SeekEntryResult!1073)

(get-info :version)

(assert (=> b!243598 (= c!40664 ((_ is MissingZero!1073) lt!122242))))

(declare-fun e!158087 () Bool)

(assert (=> b!243598 e!158087))

(declare-fun b!243599 () Bool)

(declare-fun e!158098 () Bool)

(declare-fun e!158085 () Bool)

(declare-fun mapRes!10831 () Bool)

(assert (=> b!243599 (= e!158098 (and e!158085 mapRes!10831))))

(declare-fun condMapEmpty!10831 () Bool)

(declare-fun mapDefault!10831 () ValueCell!2850)

(assert (=> b!243599 (= condMapEmpty!10831 (= (arr!5728 (_values!4496 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2850)) mapDefault!10831)))))

(declare-fun b!243600 () Bool)

(declare-fun res!119404 () Bool)

(declare-fun e!158082 () Bool)

(assert (=> b!243600 (=> (not res!119404) (not e!158082))))

(assert (=> b!243600 (= res!119404 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243601 () Bool)

(declare-fun res!119418 () Bool)

(declare-fun e!158084 () Bool)

(assert (=> b!243601 (=> (not res!119418) (not e!158084))))

(declare-fun call!22718 () Bool)

(assert (=> b!243601 (= res!119418 call!22718)))

(assert (=> b!243601 (= e!158087 e!158084)))

(declare-fun b!243602 () Bool)

(declare-fun tp_is_empty!6387 () Bool)

(assert (=> b!243602 (= e!158085 tp_is_empty!6387)))

(declare-fun b!243603 () Bool)

(declare-fun e!158093 () Bool)

(assert (=> b!243603 (= e!158093 ((_ is Undefined!1073) lt!122242))))

(declare-fun b!243604 () Bool)

(declare-fun e!158097 () Bool)

(declare-fun e!158092 () Bool)

(assert (=> b!243604 (= e!158097 e!158092)))

(declare-fun res!119411 () Bool)

(assert (=> b!243604 (=> (not res!119411) (not e!158092))))

(assert (=> b!243604 (= res!119411 (and (bvslt (size!6071 (_keys!6624 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6071 (_keys!6624 thiss!1504)))))))

(declare-fun lt!122241 () Unit!7513)

(declare-fun e!158096 () Unit!7513)

(assert (=> b!243604 (= lt!122241 e!158096)))

(declare-fun c!40663 () Bool)

(declare-fun arrayContainsKey!0 (array!12067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!243604 (= c!40663 (arrayContainsKey!0 (_keys!6624 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243605 () Bool)

(declare-fun Unit!7516 () Unit!7513)

(assert (=> b!243605 (= e!158096 Unit!7516)))

(declare-fun lt!122237 () Unit!7513)

(declare-fun lemmaArrayContainsKeyThenInListMap!166 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8163 V!8163 (_ BitVec 64) (_ BitVec 32) Int) Unit!7513)

(assert (=> b!243605 (= lt!122237 (lemmaArrayContainsKeyThenInListMap!166 (_keys!6624 thiss!1504) (_values!4496 thiss!1504) (mask!10606 thiss!1504) (extraKeys!4250 thiss!1504) (zeroValue!4354 thiss!1504) (minValue!4354 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4513 thiss!1504)))))

(assert (=> b!243605 false))

(declare-fun b!243606 () Bool)

(assert (=> b!243606 (= e!158093 e!158090)))

(declare-fun res!119405 () Bool)

(assert (=> b!243606 (= res!119405 call!22718)))

(assert (=> b!243606 (=> (not res!119405) (not e!158090))))

(declare-fun b!243607 () Bool)

(declare-fun c!40662 () Bool)

(assert (=> b!243607 (= c!40662 ((_ is MissingVacant!1073) lt!122242))))

(assert (=> b!243607 (= e!158087 e!158093)))

(declare-fun b!243608 () Bool)

(declare-fun e!158086 () Bool)

(assert (=> b!243608 (= e!158086 (contains!1754 Nil!3644 key!932))))

(declare-fun b!243609 () Bool)

(declare-fun e!158091 () Bool)

(assert (=> b!243609 (= e!158091 e!158094)))

(declare-fun res!119407 () Bool)

(assert (=> b!243609 (=> (not res!119407) (not e!158094))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243609 (= res!119407 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun bm!22715 () Bool)

(assert (=> bm!22715 (= call!22719 (arrayContainsKey!0 (_keys!6624 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243610 () Bool)

(declare-fun res!119409 () Bool)

(assert (=> b!243610 (=> (not res!119409) (not e!158092))))

(assert (=> b!243610 (= res!119409 (not (contains!1754 Nil!3644 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!10831 () Bool)

(assert (=> mapIsEmpty!10831 mapRes!10831))

(declare-fun b!243611 () Bool)

(declare-fun res!119412 () Bool)

(assert (=> b!243611 (=> (not res!119412) (not e!158092))))

(assert (=> b!243611 (= res!119412 e!158091)))

(declare-fun res!119414 () Bool)

(assert (=> b!243611 (=> res!119414 e!158091)))

(assert (=> b!243611 (= res!119414 e!158086)))

(declare-fun res!119416 () Bool)

(assert (=> b!243611 (=> (not res!119416) (not e!158086))))

(assert (=> b!243611 (= res!119416 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!243612 () Bool)

(declare-fun e!158089 () Bool)

(assert (=> b!243612 (= e!158089 e!158097)))

(declare-fun res!119408 () Bool)

(assert (=> b!243612 (=> (not res!119408) (not e!158097))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243612 (= res!119408 (inRange!0 index!297 (mask!10606 thiss!1504)))))

(declare-fun lt!122238 () Unit!7513)

(assert (=> b!243612 (= lt!122238 e!158095)))

(declare-fun c!40665 () Bool)

(declare-datatypes ((tuple2!4766 0))(
  ( (tuple2!4767 (_1!2394 (_ BitVec 64)) (_2!2394 V!8163)) )
))
(declare-datatypes ((List!3648 0))(
  ( (Nil!3645) (Cons!3644 (h!4301 tuple2!4766) (t!8655 List!3648)) )
))
(declare-datatypes ((ListLongMap!3679 0))(
  ( (ListLongMap!3680 (toList!1855 List!3648)) )
))
(declare-fun contains!1755 (ListLongMap!3679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1383 (array!12067 array!12065 (_ BitVec 32) (_ BitVec 32) V!8163 V!8163 (_ BitVec 32) Int) ListLongMap!3679)

(assert (=> b!243612 (= c!40665 (contains!1755 (getCurrentListMap!1383 (_keys!6624 thiss!1504) (_values!4496 thiss!1504) (mask!10606 thiss!1504) (extraKeys!4250 thiss!1504) (zeroValue!4354 thiss!1504) (minValue!4354 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4513 thiss!1504)) key!932))))

(declare-fun bm!22716 () Bool)

(assert (=> bm!22716 (= call!22718 (inRange!0 (ite c!40664 (index!6462 lt!122242) (index!6465 lt!122242)) (mask!10606 thiss!1504)))))

(declare-fun b!243613 () Bool)

(assert (=> b!243613 (= e!158092 false)))

(declare-fun lt!122236 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12067 (_ BitVec 32) List!3647) Bool)

(assert (=> b!243613 (= lt!122236 (arrayNoDuplicates!0 (_keys!6624 thiss!1504) #b00000000000000000000000000000000 Nil!3644))))

(declare-fun res!119406 () Bool)

(assert (=> start!23214 (=> (not res!119406) (not e!158082))))

(declare-fun valid!1411 (LongMapFixedSize!3600) Bool)

(assert (=> start!23214 (= res!119406 (valid!1411 thiss!1504))))

(assert (=> start!23214 e!158082))

(declare-fun e!158083 () Bool)

(assert (=> start!23214 e!158083))

(assert (=> start!23214 true))

(declare-fun b!243614 () Bool)

(declare-fun res!119415 () Bool)

(assert (=> b!243614 (=> (not res!119415) (not e!158084))))

(assert (=> b!243614 (= res!119415 (= (select (arr!5729 (_keys!6624 thiss!1504)) (index!6462 lt!122242)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243615 () Bool)

(declare-fun res!119417 () Bool)

(assert (=> b!243615 (=> (not res!119417) (not e!158092))))

(declare-fun noDuplicate!97 (List!3647) Bool)

(assert (=> b!243615 (= res!119417 (noDuplicate!97 Nil!3644))))

(declare-fun b!243616 () Bool)

(declare-fun Unit!7517 () Unit!7513)

(assert (=> b!243616 (= e!158096 Unit!7517)))

(declare-fun b!243617 () Bool)

(declare-fun res!119410 () Bool)

(assert (=> b!243617 (= res!119410 (= (select (arr!5729 (_keys!6624 thiss!1504)) (index!6465 lt!122242)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243617 (=> (not res!119410) (not e!158090))))

(declare-fun b!243618 () Bool)

(declare-fun e!158088 () Bool)

(assert (=> b!243618 (= e!158088 tp_is_empty!6387)))

(declare-fun b!243619 () Bool)

(assert (=> b!243619 (= e!158082 e!158089)))

(declare-fun res!119413 () Bool)

(assert (=> b!243619 (=> (not res!119413) (not e!158089))))

(assert (=> b!243619 (= res!119413 (or (= lt!122242 (MissingZero!1073 index!297)) (= lt!122242 (MissingVacant!1073 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12067 (_ BitVec 32)) SeekEntryResult!1073)

(assert (=> b!243619 (= lt!122242 (seekEntryOrOpen!0 key!932 (_keys!6624 thiss!1504) (mask!10606 thiss!1504)))))

(declare-fun array_inv!3789 (array!12067) Bool)

(declare-fun array_inv!3790 (array!12065) Bool)

(assert (=> b!243620 (= e!158083 (and tp!22797 tp_is_empty!6387 (array_inv!3789 (_keys!6624 thiss!1504)) (array_inv!3790 (_values!4496 thiss!1504)) e!158098))))

(declare-fun mapNonEmpty!10831 () Bool)

(declare-fun tp!22798 () Bool)

(assert (=> mapNonEmpty!10831 (= mapRes!10831 (and tp!22798 e!158088))))

(declare-fun mapRest!10831 () (Array (_ BitVec 32) ValueCell!2850))

(declare-fun mapValue!10831 () ValueCell!2850)

(declare-fun mapKey!10831 () (_ BitVec 32))

(assert (=> mapNonEmpty!10831 (= (arr!5728 (_values!4496 thiss!1504)) (store mapRest!10831 mapKey!10831 mapValue!10831))))

(declare-fun b!243621 () Bool)

(assert (=> b!243621 (= e!158084 (not call!22719))))

(declare-fun b!243622 () Bool)

(declare-fun res!119419 () Bool)

(assert (=> b!243622 (=> (not res!119419) (not e!158092))))

(assert (=> b!243622 (= res!119419 (not (contains!1754 Nil!3644 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!23214 res!119406) b!243600))

(assert (= (and b!243600 res!119404) b!243619))

(assert (= (and b!243619 res!119413) b!243612))

(assert (= (and b!243612 c!40665) b!243595))

(assert (= (and b!243612 (not c!40665)) b!243598))

(assert (= (and b!243598 c!40664) b!243601))

(assert (= (and b!243598 (not c!40664)) b!243607))

(assert (= (and b!243601 res!119418) b!243614))

(assert (= (and b!243614 res!119415) b!243621))

(assert (= (and b!243607 c!40662) b!243606))

(assert (= (and b!243607 (not c!40662)) b!243603))

(assert (= (and b!243606 res!119405) b!243617))

(assert (= (and b!243617 res!119410) b!243597))

(assert (= (or b!243601 b!243606) bm!22716))

(assert (= (or b!243621 b!243597) bm!22715))

(assert (= (and b!243612 res!119408) b!243604))

(assert (= (and b!243604 c!40663) b!243605))

(assert (= (and b!243604 (not c!40663)) b!243616))

(assert (= (and b!243604 res!119411) b!243615))

(assert (= (and b!243615 res!119417) b!243622))

(assert (= (and b!243622 res!119419) b!243610))

(assert (= (and b!243610 res!119409) b!243611))

(assert (= (and b!243611 res!119416) b!243608))

(assert (= (and b!243611 (not res!119414)) b!243609))

(assert (= (and b!243609 res!119407) b!243596))

(assert (= (and b!243611 res!119412) b!243613))

(assert (= (and b!243599 condMapEmpty!10831) mapIsEmpty!10831))

(assert (= (and b!243599 (not condMapEmpty!10831)) mapNonEmpty!10831))

(assert (= (and mapNonEmpty!10831 ((_ is ValueCellFull!2850) mapValue!10831)) b!243618))

(assert (= (and b!243599 ((_ is ValueCellFull!2850) mapDefault!10831)) b!243602))

(assert (= b!243620 b!243599))

(assert (= start!23214 b!243620))

(declare-fun m!261951 () Bool)

(assert (=> b!243615 m!261951))

(declare-fun m!261953 () Bool)

(assert (=> bm!22716 m!261953))

(declare-fun m!261955 () Bool)

(assert (=> b!243612 m!261955))

(declare-fun m!261957 () Bool)

(assert (=> b!243612 m!261957))

(assert (=> b!243612 m!261957))

(declare-fun m!261959 () Bool)

(assert (=> b!243612 m!261959))

(declare-fun m!261961 () Bool)

(assert (=> bm!22715 m!261961))

(declare-fun m!261963 () Bool)

(assert (=> b!243596 m!261963))

(declare-fun m!261965 () Bool)

(assert (=> b!243605 m!261965))

(declare-fun m!261967 () Bool)

(assert (=> b!243610 m!261967))

(declare-fun m!261969 () Bool)

(assert (=> start!23214 m!261969))

(assert (=> b!243604 m!261961))

(declare-fun m!261971 () Bool)

(assert (=> b!243614 m!261971))

(declare-fun m!261973 () Bool)

(assert (=> mapNonEmpty!10831 m!261973))

(declare-fun m!261975 () Bool)

(assert (=> b!243595 m!261975))

(assert (=> b!243608 m!261963))

(declare-fun m!261977 () Bool)

(assert (=> b!243619 m!261977))

(declare-fun m!261979 () Bool)

(assert (=> b!243622 m!261979))

(declare-fun m!261981 () Bool)

(assert (=> b!243613 m!261981))

(declare-fun m!261983 () Bool)

(assert (=> b!243617 m!261983))

(declare-fun m!261985 () Bool)

(assert (=> b!243598 m!261985))

(declare-fun m!261987 () Bool)

(assert (=> b!243620 m!261987))

(declare-fun m!261989 () Bool)

(assert (=> b!243620 m!261989))

(check-sat (not b!243605) (not b!243610) (not b!243604) (not b!243622) (not b!243612) (not b!243598) (not start!23214) (not bm!22715) (not b!243613) b_and!13507 (not b!243595) (not b!243596) (not b!243615) (not b!243619) (not bm!22716) (not mapNonEmpty!10831) (not b!243620) tp_is_empty!6387 (not b_next!6525) (not b!243608))
(check-sat b_and!13507 (not b_next!6525))
