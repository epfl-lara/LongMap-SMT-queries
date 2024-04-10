; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21916 () Bool)

(assert start!21916)

(declare-fun b!222677 () Bool)

(declare-fun b_free!5983 () Bool)

(declare-fun b_next!5983 () Bool)

(assert (=> b!222677 (= b_free!5983 (not b_next!5983))))

(declare-fun tp!21091 () Bool)

(declare-fun b_and!12881 () Bool)

(assert (=> b!222677 (= tp!21091 b_and!12881)))

(declare-fun b!222664 () Bool)

(declare-fun e!144698 () Bool)

(declare-fun e!144707 () Bool)

(assert (=> b!222664 (= e!144698 e!144707)))

(declare-fun res!109340 () Bool)

(assert (=> b!222664 (=> (not res!109340) (not e!144707))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7441 0))(
  ( (V!7442 (val!2967 Int)) )
))
(declare-datatypes ((ValueCell!2579 0))(
  ( (ValueCellFull!2579 (v!4987 V!7441)) (EmptyCell!2579) )
))
(declare-datatypes ((array!10933 0))(
  ( (array!10934 (arr!5186 (Array (_ BitVec 32) ValueCell!2579)) (size!5519 (_ BitVec 32))) )
))
(declare-datatypes ((array!10935 0))(
  ( (array!10936 (arr!5187 (Array (_ BitVec 32) (_ BitVec 64))) (size!5520 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3058 0))(
  ( (LongMapFixedSize!3059 (defaultEntry!4188 Int) (mask!10010 (_ BitVec 32)) (extraKeys!3925 (_ BitVec 32)) (zeroValue!4029 V!7441) (minValue!4029 V!7441) (_size!1578 (_ BitVec 32)) (_keys!6242 array!10935) (_values!4171 array!10933) (_vacant!1578 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3058)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222664 (= res!109340 (inRange!0 index!297 (mask!10010 thiss!1504)))))

(declare-datatypes ((Unit!6678 0))(
  ( (Unit!6679) )
))
(declare-fun lt!112709 () Unit!6678)

(declare-fun e!144710 () Unit!6678)

(assert (=> b!222664 (= lt!112709 e!144710)))

(declare-fun c!36995 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4402 0))(
  ( (tuple2!4403 (_1!2212 (_ BitVec 64)) (_2!2212 V!7441)) )
))
(declare-datatypes ((List!3307 0))(
  ( (Nil!3304) (Cons!3303 (h!3951 tuple2!4402) (t!8266 List!3307)) )
))
(declare-datatypes ((ListLongMap!3315 0))(
  ( (ListLongMap!3316 (toList!1673 List!3307)) )
))
(declare-fun contains!1527 (ListLongMap!3315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1201 (array!10935 array!10933 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 32) Int) ListLongMap!3315)

(assert (=> b!222664 (= c!36995 (contains!1527 (getCurrentListMap!1201 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4188 thiss!1504)) key!932))))

(declare-fun b!222665 () Bool)

(declare-fun e!144701 () Bool)

(assert (=> b!222665 (= e!144701 false)))

(declare-fun lt!112710 () Bool)

(declare-datatypes ((List!3308 0))(
  ( (Nil!3305) (Cons!3304 (h!3952 (_ BitVec 64)) (t!8267 List!3308)) )
))
(declare-fun arrayNoDuplicates!0 (array!10935 (_ BitVec 32) List!3308) Bool)

(assert (=> b!222665 (= lt!112710 (arrayNoDuplicates!0 (_keys!6242 thiss!1504) #b00000000000000000000000000000000 Nil!3305))))

(declare-fun b!222666 () Bool)

(declare-fun e!144706 () Bool)

(declare-fun call!20784 () Bool)

(assert (=> b!222666 (= e!144706 (not call!20784))))

(declare-fun b!222667 () Bool)

(declare-fun c!36994 () Bool)

(declare-datatypes ((SeekEntryResult!840 0))(
  ( (MissingZero!840 (index!5530 (_ BitVec 32))) (Found!840 (index!5531 (_ BitVec 32))) (Intermediate!840 (undefined!1652 Bool) (index!5532 (_ BitVec 32)) (x!23068 (_ BitVec 32))) (Undefined!840) (MissingVacant!840 (index!5533 (_ BitVec 32))) )
))
(declare-fun lt!112712 () SeekEntryResult!840)

(assert (=> b!222667 (= c!36994 (is-MissingVacant!840 lt!112712))))

(declare-fun e!144712 () Bool)

(declare-fun e!144696 () Bool)

(assert (=> b!222667 (= e!144712 e!144696)))

(declare-fun b!222668 () Bool)

(declare-fun e!144709 () Bool)

(assert (=> b!222668 (= e!144696 e!144709)))

(declare-fun res!109341 () Bool)

(declare-fun call!20783 () Bool)

(assert (=> b!222668 (= res!109341 call!20783)))

(assert (=> b!222668 (=> (not res!109341) (not e!144709))))

(declare-fun b!222669 () Bool)

(declare-fun e!144704 () Bool)

(assert (=> b!222669 (= e!144704 e!144698)))

(declare-fun res!109336 () Bool)

(assert (=> b!222669 (=> (not res!109336) (not e!144698))))

(assert (=> b!222669 (= res!109336 (or (= lt!112712 (MissingZero!840 index!297)) (= lt!112712 (MissingVacant!840 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10935 (_ BitVec 32)) SeekEntryResult!840)

(assert (=> b!222669 (= lt!112712 (seekEntryOrOpen!0 key!932 (_keys!6242 thiss!1504) (mask!10010 thiss!1504)))))

(declare-fun b!222670 () Bool)

(declare-fun e!144699 () Bool)

(declare-fun tp_is_empty!5845 () Bool)

(assert (=> b!222670 (= e!144699 tp_is_empty!5845)))

(declare-fun bm!20780 () Bool)

(declare-fun c!36996 () Bool)

(assert (=> bm!20780 (= call!20783 (inRange!0 (ite c!36996 (index!5530 lt!112712) (index!5533 lt!112712)) (mask!10010 thiss!1504)))))

(declare-fun b!222671 () Bool)

(declare-fun e!144697 () Bool)

(declare-fun contains!1528 (List!3308 (_ BitVec 64)) Bool)

(assert (=> b!222671 (= e!144697 (not (contains!1528 Nil!3305 key!932)))))

(declare-fun mapNonEmpty!9937 () Bool)

(declare-fun mapRes!9937 () Bool)

(declare-fun tp!21090 () Bool)

(declare-fun e!144700 () Bool)

(assert (=> mapNonEmpty!9937 (= mapRes!9937 (and tp!21090 e!144700))))

(declare-fun mapValue!9937 () ValueCell!2579)

(declare-fun mapRest!9937 () (Array (_ BitVec 32) ValueCell!2579))

(declare-fun mapKey!9937 () (_ BitVec 32))

(assert (=> mapNonEmpty!9937 (= (arr!5186 (_values!4171 thiss!1504)) (store mapRest!9937 mapKey!9937 mapValue!9937))))

(declare-fun b!222672 () Bool)

(declare-fun e!144713 () Unit!6678)

(declare-fun Unit!6680 () Unit!6678)

(assert (=> b!222672 (= e!144713 Unit!6680)))

(declare-fun b!222673 () Bool)

(declare-fun res!109338 () Bool)

(assert (=> b!222673 (=> (not res!109338) (not e!144706))))

(assert (=> b!222673 (= res!109338 call!20783)))

(assert (=> b!222673 (= e!144712 e!144706)))

(declare-fun b!222674 () Bool)

(declare-fun Unit!6681 () Unit!6678)

(assert (=> b!222674 (= e!144713 Unit!6681)))

(declare-fun lt!112715 () Unit!6678)

(declare-fun lemmaArrayContainsKeyThenInListMap!63 (array!10935 array!10933 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) (_ BitVec 32) Int) Unit!6678)

(assert (=> b!222674 (= lt!112715 (lemmaArrayContainsKeyThenInListMap!63 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222674 false))

(declare-fun b!222675 () Bool)

(declare-fun res!109331 () Bool)

(assert (=> b!222675 (=> (not res!109331) (not e!144701))))

(declare-fun e!144702 () Bool)

(assert (=> b!222675 (= res!109331 e!144702)))

(declare-fun res!109339 () Bool)

(assert (=> b!222675 (=> res!109339 e!144702)))

(declare-fun e!144711 () Bool)

(assert (=> b!222675 (= res!109339 e!144711)))

(declare-fun res!109342 () Bool)

(assert (=> b!222675 (=> (not res!109342) (not e!144711))))

(assert (=> b!222675 (= res!109342 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222676 () Bool)

(assert (=> b!222676 (= e!144711 (contains!1528 Nil!3305 key!932))))

(declare-fun e!144708 () Bool)

(declare-fun e!144703 () Bool)

(declare-fun array_inv!3433 (array!10935) Bool)

(declare-fun array_inv!3434 (array!10933) Bool)

(assert (=> b!222677 (= e!144708 (and tp!21091 tp_is_empty!5845 (array_inv!3433 (_keys!6242 thiss!1504)) (array_inv!3434 (_values!4171 thiss!1504)) e!144703))))

(declare-fun b!222678 () Bool)

(assert (=> b!222678 (= e!144700 tp_is_empty!5845)))

(declare-fun b!222679 () Bool)

(declare-fun res!109337 () Bool)

(assert (=> b!222679 (=> (not res!109337) (not e!144701))))

(assert (=> b!222679 (= res!109337 (not (contains!1528 Nil!3305 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222680 () Bool)

(declare-fun lt!112713 () Unit!6678)

(assert (=> b!222680 (= e!144710 lt!112713)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!237 (array!10935 array!10933 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) Int) Unit!6678)

(assert (=> b!222680 (= lt!112713 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!237 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222680 (= c!36996 (is-MissingZero!840 lt!112712))))

(assert (=> b!222680 e!144712))

(declare-fun b!222681 () Bool)

(declare-fun res!109332 () Bool)

(assert (=> b!222681 (=> (not res!109332) (not e!144701))))

(assert (=> b!222681 (= res!109332 (not (contains!1528 Nil!3305 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222682 () Bool)

(assert (=> b!222682 (= e!144696 (is-Undefined!840 lt!112712))))

(declare-fun bm!20781 () Bool)

(declare-fun arrayContainsKey!0 (array!10935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20781 (= call!20784 (arrayContainsKey!0 (_keys!6242 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222683 () Bool)

(declare-fun res!109335 () Bool)

(assert (=> b!222683 (=> (not res!109335) (not e!144706))))

(assert (=> b!222683 (= res!109335 (= (select (arr!5187 (_keys!6242 thiss!1504)) (index!5530 lt!112712)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222684 () Bool)

(declare-fun res!109343 () Bool)

(assert (=> b!222684 (=> (not res!109343) (not e!144701))))

(declare-fun noDuplicate!71 (List!3308) Bool)

(assert (=> b!222684 (= res!109343 (noDuplicate!71 Nil!3305))))

(declare-fun b!222685 () Bool)

(declare-fun res!109344 () Bool)

(assert (=> b!222685 (=> (not res!109344) (not e!144704))))

(assert (=> b!222685 (= res!109344 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222686 () Bool)

(declare-fun res!109333 () Bool)

(assert (=> b!222686 (= res!109333 (= (select (arr!5187 (_keys!6242 thiss!1504)) (index!5533 lt!112712)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222686 (=> (not res!109333) (not e!144709))))

(declare-fun b!222687 () Bool)

(assert (=> b!222687 (= e!144702 e!144697)))

(declare-fun res!109330 () Bool)

(assert (=> b!222687 (=> (not res!109330) (not e!144697))))

(assert (=> b!222687 (= res!109330 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222688 () Bool)

(assert (=> b!222688 (= e!144703 (and e!144699 mapRes!9937))))

(declare-fun condMapEmpty!9937 () Bool)

(declare-fun mapDefault!9937 () ValueCell!2579)

