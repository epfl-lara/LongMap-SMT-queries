; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22168 () Bool)

(assert start!22168)

(declare-fun b!231735 () Bool)

(declare-fun b_free!6235 () Bool)

(declare-fun b_next!6235 () Bool)

(assert (=> b!231735 (= b_free!6235 (not b_next!6235))))

(declare-fun tp!21846 () Bool)

(declare-fun b_and!13133 () Bool)

(assert (=> b!231735 (= tp!21846 b_and!13133)))

(declare-fun b!231720 () Bool)

(declare-datatypes ((Unit!7135 0))(
  ( (Unit!7136) )
))
(declare-fun e!150446 () Unit!7135)

(declare-fun lt!116869 () Unit!7135)

(assert (=> b!231720 (= e!150446 lt!116869)))

(declare-datatypes ((V!7777 0))(
  ( (V!7778 (val!3093 Int)) )
))
(declare-datatypes ((ValueCell!2705 0))(
  ( (ValueCellFull!2705 (v!5113 V!7777)) (EmptyCell!2705) )
))
(declare-datatypes ((array!11437 0))(
  ( (array!11438 (arr!5438 (Array (_ BitVec 32) ValueCell!2705)) (size!5771 (_ BitVec 32))) )
))
(declare-datatypes ((array!11439 0))(
  ( (array!11440 (arr!5439 (Array (_ BitVec 32) (_ BitVec 64))) (size!5772 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3310 0))(
  ( (LongMapFixedSize!3311 (defaultEntry!4314 Int) (mask!10220 (_ BitVec 32)) (extraKeys!4051 (_ BitVec 32)) (zeroValue!4155 V!7777) (minValue!4155 V!7777) (_size!1704 (_ BitVec 32)) (_keys!6368 array!11439) (_values!4297 array!11437) (_vacant!1704 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3310)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!320 (array!11439 array!11437 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) Int) Unit!7135)

(assert (=> b!231720 (= lt!116869 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!320 (_keys!6368 thiss!1504) (_values!4297 thiss!1504) (mask!10220 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 (defaultEntry!4314 thiss!1504)))))

(declare-fun c!38508 () Bool)

(declare-datatypes ((SeekEntryResult!955 0))(
  ( (MissingZero!955 (index!5990 (_ BitVec 32))) (Found!955 (index!5991 (_ BitVec 32))) (Intermediate!955 (undefined!1767 Bool) (index!5992 (_ BitVec 32)) (x!23519 (_ BitVec 32))) (Undefined!955) (MissingVacant!955 (index!5993 (_ BitVec 32))) )
))
(declare-fun lt!116863 () SeekEntryResult!955)

(assert (=> b!231720 (= c!38508 (is-MissingZero!955 lt!116863))))

(declare-fun e!150444 () Bool)

(assert (=> b!231720 e!150444))

(declare-fun bm!21536 () Bool)

(declare-fun call!21539 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21536 (= call!21539 (inRange!0 (ite c!38508 (index!5990 lt!116863) (index!5993 lt!116863)) (mask!10220 thiss!1504)))))

(declare-fun b!231721 () Bool)

(declare-fun e!150451 () Bool)

(declare-fun e!150450 () Bool)

(assert (=> b!231721 (= e!150451 e!150450)))

(declare-fun res!113853 () Bool)

(assert (=> b!231721 (= res!113853 call!21539)))

(assert (=> b!231721 (=> (not res!113853) (not e!150450))))

(declare-fun b!231722 () Bool)

(declare-fun c!38506 () Bool)

(assert (=> b!231722 (= c!38506 (is-MissingVacant!955 lt!116863))))

(assert (=> b!231722 (= e!150444 e!150451)))

(declare-fun b!231723 () Bool)

(declare-fun res!113856 () Bool)

(assert (=> b!231723 (= res!113856 (= (select (arr!5439 (_keys!6368 thiss!1504)) (index!5993 lt!116863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231723 (=> (not res!113856) (not e!150450))))

(declare-fun b!231724 () Bool)

(declare-fun call!21540 () Bool)

(assert (=> b!231724 (= e!150450 (not call!21540))))

(declare-fun b!231725 () Bool)

(declare-fun e!150449 () Unit!7135)

(declare-fun Unit!7137 () Unit!7135)

(assert (=> b!231725 (= e!150449 Unit!7137)))

(declare-fun b!231726 () Bool)

(declare-fun e!150445 () Bool)

(declare-fun e!150448 () Bool)

(assert (=> b!231726 (= e!150445 e!150448)))

(declare-fun res!113852 () Bool)

(assert (=> b!231726 (=> (not res!113852) (not e!150448))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231726 (= res!113852 (or (= lt!116863 (MissingZero!955 index!297)) (= lt!116863 (MissingVacant!955 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11439 (_ BitVec 32)) SeekEntryResult!955)

(assert (=> b!231726 (= lt!116863 (seekEntryOrOpen!0 key!932 (_keys!6368 thiss!1504) (mask!10220 thiss!1504)))))

(declare-fun res!113850 () Bool)

(assert (=> start!22168 (=> (not res!113850) (not e!150445))))

(declare-fun valid!1312 (LongMapFixedSize!3310) Bool)

(assert (=> start!22168 (= res!113850 (valid!1312 thiss!1504))))

(assert (=> start!22168 e!150445))

(declare-fun e!150439 () Bool)

(assert (=> start!22168 e!150439))

(assert (=> start!22168 true))

(declare-fun tp_is_empty!6097 () Bool)

(assert (=> start!22168 tp_is_empty!6097))

(declare-fun b!231727 () Bool)

(declare-fun e!150443 () Bool)

(assert (=> b!231727 (= e!150443 tp_is_empty!6097)))

(declare-fun mapNonEmpty!10315 () Bool)

(declare-fun mapRes!10315 () Bool)

(declare-fun tp!21847 () Bool)

(declare-fun e!150441 () Bool)

(assert (=> mapNonEmpty!10315 (= mapRes!10315 (and tp!21847 e!150441))))

(declare-fun mapRest!10315 () (Array (_ BitVec 32) ValueCell!2705))

(declare-fun mapValue!10315 () ValueCell!2705)

(declare-fun mapKey!10315 () (_ BitVec 32))

(assert (=> mapNonEmpty!10315 (= (arr!5438 (_values!4297 thiss!1504)) (store mapRest!10315 mapKey!10315 mapValue!10315))))

(declare-fun b!231728 () Bool)

(declare-fun res!113851 () Bool)

(declare-fun e!150447 () Bool)

(assert (=> b!231728 (=> (not res!113851) (not e!150447))))

(assert (=> b!231728 (= res!113851 call!21539)))

(assert (=> b!231728 (= e!150444 e!150447)))

(declare-fun bm!21537 () Bool)

(declare-fun arrayContainsKey!0 (array!11439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21537 (= call!21540 (arrayContainsKey!0 (_keys!6368 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231729 () Bool)

(declare-fun e!150452 () Bool)

(assert (=> b!231729 (= e!150452 (and e!150443 mapRes!10315))))

(declare-fun condMapEmpty!10315 () Bool)

(declare-fun mapDefault!10315 () ValueCell!2705)

