; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22946 () Bool)

(assert start!22946)

(declare-fun b!239785 () Bool)

(declare-fun b_free!6445 () Bool)

(declare-fun b_next!6445 () Bool)

(assert (=> b!239785 (= b_free!6445 (not b_next!6445))))

(declare-fun tp!22539 () Bool)

(declare-fun b_and!13425 () Bool)

(assert (=> b!239785 (= tp!22539 b_and!13425)))

(declare-fun b!239769 () Bool)

(declare-fun e!155675 () Bool)

(declare-fun call!22283 () Bool)

(assert (=> b!239769 (= e!155675 (not call!22283))))

(declare-datatypes ((SeekEntryResult!1004 0))(
  ( (MissingZero!1004 (index!6186 (_ BitVec 32))) (Found!1004 (index!6187 (_ BitVec 32))) (Intermediate!1004 (undefined!1816 Bool) (index!6188 (_ BitVec 32)) (x!24092 (_ BitVec 32))) (Undefined!1004) (MissingVacant!1004 (index!6189 (_ BitVec 32))) )
))
(declare-fun lt!120906 () SeekEntryResult!1004)

(declare-datatypes ((V!8057 0))(
  ( (V!8058 (val!3198 Int)) )
))
(declare-datatypes ((ValueCell!2810 0))(
  ( (ValueCellFull!2810 (v!5237 V!8057)) (EmptyCell!2810) )
))
(declare-datatypes ((array!11891 0))(
  ( (array!11892 (arr!5647 (Array (_ BitVec 32) ValueCell!2810)) (size!5988 (_ BitVec 32))) )
))
(declare-datatypes ((array!11893 0))(
  ( (array!11894 (arr!5648 (Array (_ BitVec 32) (_ BitVec 64))) (size!5989 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3520 0))(
  ( (LongMapFixedSize!3521 (defaultEntry!4445 Int) (mask!10495 (_ BitVec 32)) (extraKeys!4182 (_ BitVec 32)) (zeroValue!4286 V!8057) (minValue!4286 V!8057) (_size!1809 (_ BitVec 32)) (_keys!6547 array!11893) (_values!4428 array!11891) (_vacant!1809 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3520)

(declare-fun call!22284 () Bool)

(declare-fun bm!22280 () Bool)

(declare-fun c!39968 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22280 (= call!22284 (inRange!0 (ite c!39968 (index!6186 lt!120906) (index!6189 lt!120906)) (mask!10495 thiss!1504)))))

(declare-fun bm!22281 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22281 (= call!22283 (arrayContainsKey!0 (_keys!6547 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239770 () Bool)

(declare-fun e!155673 () Bool)

(declare-fun e!155672 () Bool)

(assert (=> b!239770 (= e!155673 e!155672)))

(declare-fun res!117518 () Bool)

(assert (=> b!239770 (=> (not res!117518) (not e!155672))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239770 (= res!117518 (or (= lt!120906 (MissingZero!1004 index!297)) (= lt!120906 (MissingVacant!1004 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11893 (_ BitVec 32)) SeekEntryResult!1004)

(assert (=> b!239770 (= lt!120906 (seekEntryOrOpen!0 key!932 (_keys!6547 thiss!1504) (mask!10495 thiss!1504)))))

(declare-fun b!239771 () Bool)

(declare-fun e!155669 () Bool)

(declare-fun tp_is_empty!6307 () Bool)

(assert (=> b!239771 (= e!155669 tp_is_empty!6307)))

(declare-fun b!239772 () Bool)

(declare-fun e!155674 () Bool)

(assert (=> b!239772 (= e!155674 tp_is_empty!6307)))

(declare-fun b!239773 () Bool)

(declare-fun e!155667 () Bool)

(assert (=> b!239773 (= e!155672 e!155667)))

(declare-fun res!117512 () Bool)

(assert (=> b!239773 (=> (not res!117512) (not e!155667))))

(assert (=> b!239773 (= res!117512 (inRange!0 index!297 (mask!10495 thiss!1504)))))

(declare-datatypes ((Unit!7346 0))(
  ( (Unit!7347) )
))
(declare-fun lt!120908 () Unit!7346)

(declare-fun e!155668 () Unit!7346)

(assert (=> b!239773 (= lt!120908 e!155668)))

(declare-fun c!39967 () Bool)

(declare-datatypes ((tuple2!4640 0))(
  ( (tuple2!4641 (_1!2331 (_ BitVec 64)) (_2!2331 V!8057)) )
))
(declare-datatypes ((List!3517 0))(
  ( (Nil!3514) (Cons!3513 (h!4169 tuple2!4640) (t!8504 List!3517)) )
))
(declare-datatypes ((ListLongMap!3555 0))(
  ( (ListLongMap!3556 (toList!1793 List!3517)) )
))
(declare-fun contains!1695 (ListLongMap!3555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1325 (array!11893 array!11891 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 32) Int) ListLongMap!3555)

(assert (=> b!239773 (= c!39967 (contains!1695 (getCurrentListMap!1325 (_keys!6547 thiss!1504) (_values!4428 thiss!1504) (mask!10495 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4445 thiss!1504)) key!932))))

(declare-fun b!239774 () Bool)

(declare-fun res!117517 () Bool)

(assert (=> b!239774 (=> (not res!117517) (not e!155667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239774 (= res!117517 (validMask!0 (mask!10495 thiss!1504)))))

(declare-fun mapIsEmpty!10692 () Bool)

(declare-fun mapRes!10692 () Bool)

(assert (=> mapIsEmpty!10692 mapRes!10692))

(declare-fun b!239775 () Bool)

(declare-fun e!155678 () Bool)

(get-info :version)

(assert (=> b!239775 (= e!155678 ((_ is Undefined!1004) lt!120906))))

(declare-fun b!239777 () Bool)

(declare-fun e!155676 () Bool)

(assert (=> b!239777 (= e!155676 (and e!155669 mapRes!10692))))

(declare-fun condMapEmpty!10692 () Bool)

(declare-fun mapDefault!10692 () ValueCell!2810)

(assert (=> b!239777 (= condMapEmpty!10692 (= (arr!5647 (_values!4428 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2810)) mapDefault!10692)))))

(declare-fun b!239778 () Bool)

(declare-fun res!117513 () Bool)

(assert (=> b!239778 (=> (not res!117513) (not e!155675))))

(assert (=> b!239778 (= res!117513 call!22284)))

(declare-fun e!155670 () Bool)

(assert (=> b!239778 (= e!155670 e!155675)))

(declare-fun b!239779 () Bool)

(declare-fun res!117519 () Bool)

(assert (=> b!239779 (=> (not res!117519) (not e!155673))))

(assert (=> b!239779 (= res!117519 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10692 () Bool)

(declare-fun tp!22538 () Bool)

(assert (=> mapNonEmpty!10692 (= mapRes!10692 (and tp!22538 e!155674))))

(declare-fun mapKey!10692 () (_ BitVec 32))

(declare-fun mapRest!10692 () (Array (_ BitVec 32) ValueCell!2810))

(declare-fun mapValue!10692 () ValueCell!2810)

(assert (=> mapNonEmpty!10692 (= (arr!5647 (_values!4428 thiss!1504)) (store mapRest!10692 mapKey!10692 mapValue!10692))))

(declare-fun b!239780 () Bool)

(declare-fun e!155671 () Bool)

(assert (=> b!239780 (= e!155671 (not call!22283))))

(declare-fun b!239781 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11893 (_ BitVec 32)) Bool)

(assert (=> b!239781 (= e!155667 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6547 thiss!1504) (mask!10495 thiss!1504))))))

(declare-fun b!239782 () Bool)

(declare-fun res!117514 () Bool)

(assert (=> b!239782 (=> (not res!117514) (not e!155675))))

(assert (=> b!239782 (= res!117514 (= (select (arr!5648 (_keys!6547 thiss!1504)) (index!6186 lt!120906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239783 () Bool)

(assert (=> b!239783 (= e!155678 e!155671)))

(declare-fun res!117521 () Bool)

(assert (=> b!239783 (= res!117521 call!22284)))

(assert (=> b!239783 (=> (not res!117521) (not e!155671))))

(declare-fun b!239784 () Bool)

(declare-fun c!39969 () Bool)

(assert (=> b!239784 (= c!39969 ((_ is MissingVacant!1004) lt!120906))))

(assert (=> b!239784 (= e!155670 e!155678)))

(declare-fun e!155679 () Bool)

(declare-fun array_inv!3711 (array!11893) Bool)

(declare-fun array_inv!3712 (array!11891) Bool)

(assert (=> b!239785 (= e!155679 (and tp!22539 tp_is_empty!6307 (array_inv!3711 (_keys!6547 thiss!1504)) (array_inv!3712 (_values!4428 thiss!1504)) e!155676))))

(declare-fun b!239786 () Bool)

(declare-fun res!117515 () Bool)

(assert (=> b!239786 (=> (not res!117515) (not e!155667))))

(assert (=> b!239786 (= res!117515 (and (= (size!5988 (_values!4428 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10495 thiss!1504))) (= (size!5989 (_keys!6547 thiss!1504)) (size!5988 (_values!4428 thiss!1504))) (bvsge (mask!10495 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4182 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4182 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239787 () Bool)

(declare-fun lt!120905 () Unit!7346)

(assert (=> b!239787 (= e!155668 lt!120905)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!327 (array!11893 array!11891 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 64) Int) Unit!7346)

(assert (=> b!239787 (= lt!120905 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!327 (_keys!6547 thiss!1504) (_values!4428 thiss!1504) (mask!10495 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) key!932 (defaultEntry!4445 thiss!1504)))))

(assert (=> b!239787 (= c!39968 ((_ is MissingZero!1004) lt!120906))))

(assert (=> b!239787 e!155670))

(declare-fun b!239788 () Bool)

(declare-fun Unit!7348 () Unit!7346)

(assert (=> b!239788 (= e!155668 Unit!7348)))

(declare-fun lt!120907 () Unit!7346)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!334 (array!11893 array!11891 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 64) Int) Unit!7346)

(assert (=> b!239788 (= lt!120907 (lemmaInListMapThenSeekEntryOrOpenFindsIt!334 (_keys!6547 thiss!1504) (_values!4428 thiss!1504) (mask!10495 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) key!932 (defaultEntry!4445 thiss!1504)))))

(assert (=> b!239788 false))

(declare-fun b!239789 () Bool)

(declare-fun res!117516 () Bool)

(assert (=> b!239789 (=> (not res!117516) (not e!155667))))

(assert (=> b!239789 (= res!117516 (arrayContainsKey!0 (_keys!6547 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239776 () Bool)

(declare-fun res!117520 () Bool)

(assert (=> b!239776 (= res!117520 (= (select (arr!5648 (_keys!6547 thiss!1504)) (index!6189 lt!120906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239776 (=> (not res!117520) (not e!155671))))

(declare-fun res!117511 () Bool)

(assert (=> start!22946 (=> (not res!117511) (not e!155673))))

(declare-fun valid!1398 (LongMapFixedSize!3520) Bool)

(assert (=> start!22946 (= res!117511 (valid!1398 thiss!1504))))

(assert (=> start!22946 e!155673))

(assert (=> start!22946 e!155679))

(assert (=> start!22946 true))

(assert (= (and start!22946 res!117511) b!239779))

(assert (= (and b!239779 res!117519) b!239770))

(assert (= (and b!239770 res!117518) b!239773))

(assert (= (and b!239773 c!39967) b!239788))

(assert (= (and b!239773 (not c!39967)) b!239787))

(assert (= (and b!239787 c!39968) b!239778))

(assert (= (and b!239787 (not c!39968)) b!239784))

(assert (= (and b!239778 res!117513) b!239782))

(assert (= (and b!239782 res!117514) b!239769))

(assert (= (and b!239784 c!39969) b!239783))

(assert (= (and b!239784 (not c!39969)) b!239775))

(assert (= (and b!239783 res!117521) b!239776))

(assert (= (and b!239776 res!117520) b!239780))

(assert (= (or b!239778 b!239783) bm!22280))

(assert (= (or b!239769 b!239780) bm!22281))

(assert (= (and b!239773 res!117512) b!239789))

(assert (= (and b!239789 res!117516) b!239774))

(assert (= (and b!239774 res!117517) b!239786))

(assert (= (and b!239786 res!117515) b!239781))

(assert (= (and b!239777 condMapEmpty!10692) mapIsEmpty!10692))

(assert (= (and b!239777 (not condMapEmpty!10692)) mapNonEmpty!10692))

(assert (= (and mapNonEmpty!10692 ((_ is ValueCellFull!2810) mapValue!10692)) b!239772))

(assert (= (and b!239777 ((_ is ValueCellFull!2810) mapDefault!10692)) b!239771))

(assert (= b!239785 b!239777))

(assert (= start!22946 b!239785))

(declare-fun m!259831 () Bool)

(assert (=> bm!22281 m!259831))

(declare-fun m!259833 () Bool)

(assert (=> b!239788 m!259833))

(declare-fun m!259835 () Bool)

(assert (=> b!239773 m!259835))

(declare-fun m!259837 () Bool)

(assert (=> b!239773 m!259837))

(assert (=> b!239773 m!259837))

(declare-fun m!259839 () Bool)

(assert (=> b!239773 m!259839))

(declare-fun m!259841 () Bool)

(assert (=> start!22946 m!259841))

(declare-fun m!259843 () Bool)

(assert (=> b!239785 m!259843))

(declare-fun m!259845 () Bool)

(assert (=> b!239785 m!259845))

(declare-fun m!259847 () Bool)

(assert (=> b!239774 m!259847))

(declare-fun m!259849 () Bool)

(assert (=> b!239787 m!259849))

(declare-fun m!259851 () Bool)

(assert (=> b!239782 m!259851))

(declare-fun m!259853 () Bool)

(assert (=> b!239770 m!259853))

(declare-fun m!259855 () Bool)

(assert (=> mapNonEmpty!10692 m!259855))

(declare-fun m!259857 () Bool)

(assert (=> bm!22280 m!259857))

(declare-fun m!259859 () Bool)

(assert (=> b!239781 m!259859))

(declare-fun m!259861 () Bool)

(assert (=> b!239776 m!259861))

(assert (=> b!239789 m!259831))

(check-sat (not bm!22280) (not start!22946) (not bm!22281) (not mapNonEmpty!10692) (not b!239787) (not b_next!6445) (not b!239785) (not b!239781) (not b!239770) (not b!239789) b_and!13425 tp_is_empty!6307 (not b!239773) (not b!239774) (not b!239788))
(check-sat b_and!13425 (not b_next!6445))
