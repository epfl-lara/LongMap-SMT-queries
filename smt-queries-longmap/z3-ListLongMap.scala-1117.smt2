; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22952 () Bool)

(assert start!22952)

(declare-fun b!239767 () Bool)

(declare-fun b_free!6451 () Bool)

(declare-fun b_next!6451 () Bool)

(assert (=> b!239767 (= b_free!6451 (not b_next!6451))))

(declare-fun tp!22556 () Bool)

(declare-fun b_and!13391 () Bool)

(assert (=> b!239767 (= tp!22556 b_and!13391)))

(declare-fun b!239766 () Bool)

(declare-fun e!155668 () Bool)

(declare-fun call!22289 () Bool)

(assert (=> b!239766 (= e!155668 (not call!22289))))

(declare-fun mapNonEmpty!10701 () Bool)

(declare-fun mapRes!10701 () Bool)

(declare-fun tp!22557 () Bool)

(declare-fun e!155671 () Bool)

(assert (=> mapNonEmpty!10701 (= mapRes!10701 (and tp!22557 e!155671))))

(declare-fun mapKey!10701 () (_ BitVec 32))

(declare-datatypes ((V!8065 0))(
  ( (V!8066 (val!3201 Int)) )
))
(declare-datatypes ((ValueCell!2813 0))(
  ( (ValueCellFull!2813 (v!5233 V!8065)) (EmptyCell!2813) )
))
(declare-fun mapValue!10701 () ValueCell!2813)

(declare-datatypes ((array!11897 0))(
  ( (array!11898 (arr!5649 (Array (_ BitVec 32) ValueCell!2813)) (size!5991 (_ BitVec 32))) )
))
(declare-datatypes ((array!11899 0))(
  ( (array!11900 (arr!5650 (Array (_ BitVec 32) (_ BitVec 64))) (size!5992 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3526 0))(
  ( (LongMapFixedSize!3527 (defaultEntry!4448 Int) (mask!10499 (_ BitVec 32)) (extraKeys!4185 (_ BitVec 32)) (zeroValue!4289 V!8065) (minValue!4289 V!8065) (_size!1812 (_ BitVec 32)) (_keys!6549 array!11899) (_values!4431 array!11897) (_vacant!1812 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3526)

(declare-fun mapRest!10701 () (Array (_ BitVec 32) ValueCell!2813))

(assert (=> mapNonEmpty!10701 (= (arr!5649 (_values!4431 thiss!1504)) (store mapRest!10701 mapKey!10701 mapValue!10701))))

(declare-fun e!155661 () Bool)

(declare-fun tp_is_empty!6313 () Bool)

(declare-fun e!155666 () Bool)

(declare-fun array_inv!3723 (array!11899) Bool)

(declare-fun array_inv!3724 (array!11897) Bool)

(assert (=> b!239767 (= e!155666 (and tp!22556 tp_is_empty!6313 (array_inv!3723 (_keys!6549 thiss!1504)) (array_inv!3724 (_values!4431 thiss!1504)) e!155661))))

(declare-fun b!239768 () Bool)

(declare-fun res!117501 () Bool)

(declare-fun e!155664 () Bool)

(assert (=> b!239768 (=> (not res!117501) (not e!155664))))

(declare-fun call!22290 () Bool)

(assert (=> b!239768 (= res!117501 call!22290)))

(declare-fun e!155662 () Bool)

(assert (=> b!239768 (= e!155662 e!155664)))

(declare-fun b!239769 () Bool)

(declare-fun e!155665 () Bool)

(declare-datatypes ((List!3587 0))(
  ( (Nil!3584) (Cons!3583 (h!4239 (_ BitVec 64)) (t!8573 List!3587)) )
))
(declare-fun arrayNoDuplicates!0 (array!11899 (_ BitVec 32) List!3587) Bool)

(assert (=> b!239769 (= e!155665 (not (arrayNoDuplicates!0 (_keys!6549 thiss!1504) #b00000000000000000000000000000000 Nil!3584)))))

(declare-fun b!239770 () Bool)

(assert (=> b!239770 (= e!155664 (not call!22289))))

(declare-fun b!239771 () Bool)

(declare-fun c!39955 () Bool)

(declare-datatypes ((SeekEntryResult!1037 0))(
  ( (MissingZero!1037 (index!6318 (_ BitVec 32))) (Found!1037 (index!6319 (_ BitVec 32))) (Intermediate!1037 (undefined!1849 Bool) (index!6320 (_ BitVec 32)) (x!24132 (_ BitVec 32))) (Undefined!1037) (MissingVacant!1037 (index!6321 (_ BitVec 32))) )
))
(declare-fun lt!120701 () SeekEntryResult!1037)

(get-info :version)

(assert (=> b!239771 (= c!39955 ((_ is MissingVacant!1037) lt!120701))))

(declare-fun e!155670 () Bool)

(assert (=> b!239771 (= e!155662 e!155670)))

(declare-fun b!239772 () Bool)

(declare-fun res!117507 () Bool)

(assert (=> b!239772 (=> (not res!117507) (not e!155665))))

(assert (=> b!239772 (= res!117507 (and (= (size!5991 (_values!4431 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10499 thiss!1504))) (= (size!5992 (_keys!6549 thiss!1504)) (size!5991 (_values!4431 thiss!1504))) (bvsge (mask!10499 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4185 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4185 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!117500 () Bool)

(declare-fun e!155663 () Bool)

(assert (=> start!22952 (=> (not res!117500) (not e!155663))))

(declare-fun valid!1393 (LongMapFixedSize!3526) Bool)

(assert (=> start!22952 (= res!117500 (valid!1393 thiss!1504))))

(assert (=> start!22952 e!155663))

(assert (=> start!22952 e!155666))

(assert (=> start!22952 true))

(declare-fun b!239773 () Bool)

(assert (=> b!239773 (= e!155670 ((_ is Undefined!1037) lt!120701))))

(declare-fun b!239774 () Bool)

(declare-fun res!117503 () Bool)

(assert (=> b!239774 (=> (not res!117503) (not e!155664))))

(assert (=> b!239774 (= res!117503 (= (select (arr!5650 (_keys!6549 thiss!1504)) (index!6318 lt!120701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239775 () Bool)

(declare-datatypes ((Unit!7363 0))(
  ( (Unit!7364) )
))
(declare-fun e!155669 () Unit!7363)

(declare-fun lt!120702 () Unit!7363)

(assert (=> b!239775 (= e!155669 lt!120702)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!338 (array!11899 array!11897 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 64) Int) Unit!7363)

(assert (=> b!239775 (= lt!120702 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!338 (_keys!6549 thiss!1504) (_values!4431 thiss!1504) (mask!10499 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) key!932 (defaultEntry!4448 thiss!1504)))))

(declare-fun c!39957 () Bool)

(assert (=> b!239775 (= c!39957 ((_ is MissingZero!1037) lt!120701))))

(assert (=> b!239775 e!155662))

(declare-fun b!239776 () Bool)

(declare-fun e!155667 () Bool)

(assert (=> b!239776 (= e!155667 tp_is_empty!6313)))

(declare-fun b!239777 () Bool)

(declare-fun res!117497 () Bool)

(assert (=> b!239777 (= res!117497 (= (select (arr!5650 (_keys!6549 thiss!1504)) (index!6321 lt!120701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239777 (=> (not res!117497) (not e!155668))))

(declare-fun bm!22286 () Bool)

(declare-fun arrayContainsKey!0 (array!11899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22286 (= call!22289 (arrayContainsKey!0 (_keys!6549 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239778 () Bool)

(declare-fun res!117504 () Bool)

(assert (=> b!239778 (=> (not res!117504) (not e!155665))))

(assert (=> b!239778 (= res!117504 (arrayContainsKey!0 (_keys!6549 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239779 () Bool)

(declare-fun e!155660 () Bool)

(assert (=> b!239779 (= e!155660 e!155665)))

(declare-fun res!117499 () Bool)

(assert (=> b!239779 (=> (not res!117499) (not e!155665))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239779 (= res!117499 (inRange!0 index!297 (mask!10499 thiss!1504)))))

(declare-fun lt!120704 () Unit!7363)

(assert (=> b!239779 (= lt!120704 e!155669)))

(declare-fun c!39956 () Bool)

(declare-datatypes ((tuple2!4688 0))(
  ( (tuple2!4689 (_1!2355 (_ BitVec 64)) (_2!2355 V!8065)) )
))
(declare-datatypes ((List!3588 0))(
  ( (Nil!3585) (Cons!3584 (h!4240 tuple2!4688) (t!8574 List!3588)) )
))
(declare-datatypes ((ListLongMap!3591 0))(
  ( (ListLongMap!3592 (toList!1811 List!3588)) )
))
(declare-fun contains!1702 (ListLongMap!3591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1320 (array!11899 array!11897 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 32) Int) ListLongMap!3591)

(assert (=> b!239779 (= c!39956 (contains!1702 (getCurrentListMap!1320 (_keys!6549 thiss!1504) (_values!4431 thiss!1504) (mask!10499 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4448 thiss!1504)) key!932))))

(declare-fun b!239780 () Bool)

(declare-fun Unit!7365 () Unit!7363)

(assert (=> b!239780 (= e!155669 Unit!7365)))

(declare-fun lt!120703 () Unit!7363)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!339 (array!11899 array!11897 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 64) Int) Unit!7363)

(assert (=> b!239780 (= lt!120703 (lemmaInListMapThenSeekEntryOrOpenFindsIt!339 (_keys!6549 thiss!1504) (_values!4431 thiss!1504) (mask!10499 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) key!932 (defaultEntry!4448 thiss!1504)))))

(assert (=> b!239780 false))

(declare-fun mapIsEmpty!10701 () Bool)

(assert (=> mapIsEmpty!10701 mapRes!10701))

(declare-fun b!239781 () Bool)

(declare-fun res!117505 () Bool)

(assert (=> b!239781 (=> (not res!117505) (not e!155663))))

(assert (=> b!239781 (= res!117505 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!22287 () Bool)

(assert (=> bm!22287 (= call!22290 (inRange!0 (ite c!39957 (index!6318 lt!120701) (index!6321 lt!120701)) (mask!10499 thiss!1504)))))

(declare-fun b!239782 () Bool)

(assert (=> b!239782 (= e!155670 e!155668)))

(declare-fun res!117498 () Bool)

(assert (=> b!239782 (= res!117498 call!22290)))

(assert (=> b!239782 (=> (not res!117498) (not e!155668))))

(declare-fun b!239783 () Bool)

(assert (=> b!239783 (= e!155661 (and e!155667 mapRes!10701))))

(declare-fun condMapEmpty!10701 () Bool)

(declare-fun mapDefault!10701 () ValueCell!2813)

(assert (=> b!239783 (= condMapEmpty!10701 (= (arr!5649 (_values!4431 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2813)) mapDefault!10701)))))

(declare-fun b!239784 () Bool)

(assert (=> b!239784 (= e!155671 tp_is_empty!6313)))

(declare-fun b!239785 () Bool)

(declare-fun res!117502 () Bool)

(assert (=> b!239785 (=> (not res!117502) (not e!155665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239785 (= res!117502 (validMask!0 (mask!10499 thiss!1504)))))

(declare-fun b!239786 () Bool)

(assert (=> b!239786 (= e!155663 e!155660)))

(declare-fun res!117496 () Bool)

(assert (=> b!239786 (=> (not res!117496) (not e!155660))))

(assert (=> b!239786 (= res!117496 (or (= lt!120701 (MissingZero!1037 index!297)) (= lt!120701 (MissingVacant!1037 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11899 (_ BitVec 32)) SeekEntryResult!1037)

(assert (=> b!239786 (= lt!120701 (seekEntryOrOpen!0 key!932 (_keys!6549 thiss!1504) (mask!10499 thiss!1504)))))

(declare-fun b!239787 () Bool)

(declare-fun res!117506 () Bool)

(assert (=> b!239787 (=> (not res!117506) (not e!155665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11899 (_ BitVec 32)) Bool)

(assert (=> b!239787 (= res!117506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6549 thiss!1504) (mask!10499 thiss!1504)))))

(assert (= (and start!22952 res!117500) b!239781))

(assert (= (and b!239781 res!117505) b!239786))

(assert (= (and b!239786 res!117496) b!239779))

(assert (= (and b!239779 c!39956) b!239780))

(assert (= (and b!239779 (not c!39956)) b!239775))

(assert (= (and b!239775 c!39957) b!239768))

(assert (= (and b!239775 (not c!39957)) b!239771))

(assert (= (and b!239768 res!117501) b!239774))

(assert (= (and b!239774 res!117503) b!239770))

(assert (= (and b!239771 c!39955) b!239782))

(assert (= (and b!239771 (not c!39955)) b!239773))

(assert (= (and b!239782 res!117498) b!239777))

(assert (= (and b!239777 res!117497) b!239766))

(assert (= (or b!239768 b!239782) bm!22287))

(assert (= (or b!239770 b!239766) bm!22286))

(assert (= (and b!239779 res!117499) b!239778))

(assert (= (and b!239778 res!117504) b!239785))

(assert (= (and b!239785 res!117502) b!239772))

(assert (= (and b!239772 res!117507) b!239787))

(assert (= (and b!239787 res!117506) b!239769))

(assert (= (and b!239783 condMapEmpty!10701) mapIsEmpty!10701))

(assert (= (and b!239783 (not condMapEmpty!10701)) mapNonEmpty!10701))

(assert (= (and mapNonEmpty!10701 ((_ is ValueCellFull!2813) mapValue!10701)) b!239784))

(assert (= (and b!239783 ((_ is ValueCellFull!2813) mapDefault!10701)) b!239776))

(assert (= b!239767 b!239783))

(assert (= start!22952 b!239767))

(declare-fun m!259129 () Bool)

(assert (=> mapNonEmpty!10701 m!259129))

(declare-fun m!259131 () Bool)

(assert (=> b!239775 m!259131))

(declare-fun m!259133 () Bool)

(assert (=> b!239786 m!259133))

(declare-fun m!259135 () Bool)

(assert (=> b!239774 m!259135))

(declare-fun m!259137 () Bool)

(assert (=> b!239779 m!259137))

(declare-fun m!259139 () Bool)

(assert (=> b!239779 m!259139))

(assert (=> b!239779 m!259139))

(declare-fun m!259141 () Bool)

(assert (=> b!239779 m!259141))

(declare-fun m!259143 () Bool)

(assert (=> b!239777 m!259143))

(declare-fun m!259145 () Bool)

(assert (=> bm!22287 m!259145))

(declare-fun m!259147 () Bool)

(assert (=> b!239767 m!259147))

(declare-fun m!259149 () Bool)

(assert (=> b!239767 m!259149))

(declare-fun m!259151 () Bool)

(assert (=> b!239787 m!259151))

(declare-fun m!259153 () Bool)

(assert (=> bm!22286 m!259153))

(assert (=> b!239778 m!259153))

(declare-fun m!259155 () Bool)

(assert (=> b!239785 m!259155))

(declare-fun m!259157 () Bool)

(assert (=> start!22952 m!259157))

(declare-fun m!259159 () Bool)

(assert (=> b!239780 m!259159))

(declare-fun m!259161 () Bool)

(assert (=> b!239769 m!259161))

(check-sat (not start!22952) (not b!239767) (not b_next!6451) (not bm!22287) tp_is_empty!6313 b_and!13391 (not mapNonEmpty!10701) (not b!239786) (not bm!22286) (not b!239769) (not b!239785) (not b!239780) (not b!239778) (not b!239779) (not b!239787) (not b!239775))
(check-sat b_and!13391 (not b_next!6451))
