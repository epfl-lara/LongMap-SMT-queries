; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23576 () Bool)

(assert start!23576)

(declare-fun b!247810 () Bool)

(declare-fun b_free!6595 () Bool)

(declare-fun b_next!6595 () Bool)

(assert (=> b!247810 (= b_free!6595 (not b_next!6595))))

(declare-fun tp!23032 () Bool)

(declare-fun b_and!13597 () Bool)

(assert (=> b!247810 (= tp!23032 b_and!13597)))

(declare-fun b!247808 () Bool)

(declare-fun res!121454 () Bool)

(declare-fun e!160764 () Bool)

(assert (=> b!247808 (=> res!121454 e!160764)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247808 (= res!121454 (not (validKeyInArray!0 key!932)))))

(declare-fun res!121451 () Bool)

(declare-fun e!160768 () Bool)

(assert (=> start!23576 (=> (not res!121451) (not e!160768))))

(declare-datatypes ((V!8257 0))(
  ( (V!8258 (val!3273 Int)) )
))
(declare-datatypes ((ValueCell!2885 0))(
  ( (ValueCellFull!2885 (v!5331 V!8257)) (EmptyCell!2885) )
))
(declare-datatypes ((array!12221 0))(
  ( (array!12222 (arr!5798 (Array (_ BitVec 32) ValueCell!2885)) (size!6141 (_ BitVec 32))) )
))
(declare-datatypes ((array!12223 0))(
  ( (array!12224 (arr!5799 (Array (_ BitVec 32) (_ BitVec 64))) (size!6142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3670 0))(
  ( (LongMapFixedSize!3671 (defaultEntry!4584 Int) (mask!10726 (_ BitVec 32)) (extraKeys!4321 (_ BitVec 32)) (zeroValue!4425 V!8257) (minValue!4425 V!8257) (_size!1884 (_ BitVec 32)) (_keys!6706 array!12223) (_values!4567 array!12221) (_vacant!1884 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3670)

(declare-fun valid!1436 (LongMapFixedSize!3670) Bool)

(assert (=> start!23576 (= res!121451 (valid!1436 thiss!1504))))

(assert (=> start!23576 e!160768))

(declare-fun e!160773 () Bool)

(assert (=> start!23576 e!160773))

(assert (=> start!23576 true))

(declare-fun b!247809 () Bool)

(declare-fun e!160762 () Bool)

(assert (=> b!247809 (= e!160762 (not e!160764))))

(declare-fun res!121456 () Bool)

(assert (=> b!247809 (=> res!121456 e!160764)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247809 (= res!121456 (not (validMask!0 (mask!10726 thiss!1504))))))

(declare-fun lt!124099 () array!12223)

(declare-fun arrayCountValidKeys!0 (array!12223 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247809 (= (arrayCountValidKeys!0 lt!124099 #b00000000000000000000000000000000 (size!6142 (_keys!6706 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6706 thiss!1504) #b00000000000000000000000000000000 (size!6142 (_keys!6706 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7670 0))(
  ( (Unit!7671) )
))
(declare-fun lt!124101 () Unit!7670)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12223 (_ BitVec 32) (_ BitVec 64)) Unit!7670)

(assert (=> b!247809 (= lt!124101 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6706 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3700 0))(
  ( (Nil!3697) (Cons!3696 (h!4354 (_ BitVec 64)) (t!8723 List!3700)) )
))
(declare-fun arrayNoDuplicates!0 (array!12223 (_ BitVec 32) List!3700) Bool)

(assert (=> b!247809 (arrayNoDuplicates!0 lt!124099 #b00000000000000000000000000000000 Nil!3697)))

(assert (=> b!247809 (= lt!124099 (array!12224 (store (arr!5799 (_keys!6706 thiss!1504)) index!297 key!932) (size!6142 (_keys!6706 thiss!1504))))))

(declare-fun lt!124096 () Unit!7670)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3700) Unit!7670)

(assert (=> b!247809 (= lt!124096 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6706 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3697))))

(declare-fun lt!124098 () Unit!7670)

(declare-fun e!160759 () Unit!7670)

(assert (=> b!247809 (= lt!124098 e!160759)))

(declare-fun c!41498 () Bool)

(declare-fun lt!124094 () Bool)

(assert (=> b!247809 (= c!41498 lt!124094)))

(declare-fun arrayContainsKey!0 (array!12223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247809 (= lt!124094 (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!6457 () Bool)

(declare-fun e!160772 () Bool)

(declare-fun array_inv!3829 (array!12223) Bool)

(declare-fun array_inv!3830 (array!12221) Bool)

(assert (=> b!247810 (= e!160773 (and tp!23032 tp_is_empty!6457 (array_inv!3829 (_keys!6706 thiss!1504)) (array_inv!3830 (_values!4567 thiss!1504)) e!160772))))

(declare-fun b!247811 () Bool)

(declare-fun e!160760 () Bool)

(declare-fun call!23207 () Bool)

(assert (=> b!247811 (= e!160760 (not call!23207))))

(declare-fun b!247812 () Bool)

(declare-fun e!160769 () Bool)

(assert (=> b!247812 (= e!160768 e!160769)))

(declare-fun res!121459 () Bool)

(assert (=> b!247812 (=> (not res!121459) (not e!160769))))

(declare-datatypes ((SeekEntryResult!1106 0))(
  ( (MissingZero!1106 (index!6594 (_ BitVec 32))) (Found!1106 (index!6595 (_ BitVec 32))) (Intermediate!1106 (undefined!1918 Bool) (index!6596 (_ BitVec 32)) (x!24550 (_ BitVec 32))) (Undefined!1106) (MissingVacant!1106 (index!6597 (_ BitVec 32))) )
))
(declare-fun lt!124092 () SeekEntryResult!1106)

(assert (=> b!247812 (= res!121459 (or (= lt!124092 (MissingZero!1106 index!297)) (= lt!124092 (MissingVacant!1106 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12223 (_ BitVec 32)) SeekEntryResult!1106)

(assert (=> b!247812 (= lt!124092 (seekEntryOrOpen!0 key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun b!247813 () Bool)

(declare-fun res!121457 () Bool)

(assert (=> b!247813 (= res!121457 (= (select (arr!5799 (_keys!6706 thiss!1504)) (index!6597 lt!124092)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247813 (=> (not res!121457) (not e!160760))))

(declare-fun b!247814 () Bool)

(declare-fun res!121453 () Bool)

(declare-fun e!160766 () Bool)

(assert (=> b!247814 (=> (not res!121453) (not e!160766))))

(declare-fun call!23206 () Bool)

(assert (=> b!247814 (= res!121453 call!23206)))

(declare-fun e!160763 () Bool)

(assert (=> b!247814 (= e!160763 e!160766)))

(declare-fun b!247815 () Bool)

(declare-fun e!160765 () Bool)

(assert (=> b!247815 (= e!160765 tp_is_empty!6457)))

(declare-fun b!247816 () Bool)

(declare-fun res!121455 () Bool)

(assert (=> b!247816 (=> (not res!121455) (not e!160768))))

(assert (=> b!247816 (= res!121455 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247817 () Bool)

(declare-fun e!160771 () Bool)

(assert (=> b!247817 (= e!160771 e!160760)))

(declare-fun res!121458 () Bool)

(assert (=> b!247817 (= res!121458 call!23206)))

(assert (=> b!247817 (=> (not res!121458) (not e!160760))))

(declare-fun bm!23203 () Bool)

(assert (=> bm!23203 (= call!23207 (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247818 () Bool)

(declare-fun res!121452 () Bool)

(assert (=> b!247818 (=> res!121452 e!160764)))

(assert (=> b!247818 (= res!121452 (or (not (= (size!6142 (_keys!6706 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10726 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6142 (_keys!6706 thiss!1504)))))))

(declare-fun b!247819 () Bool)

(declare-fun res!121449 () Bool)

(assert (=> b!247819 (=> res!121449 e!160764)))

(assert (=> b!247819 (= res!121449 lt!124094)))

(declare-fun b!247820 () Bool)

(declare-fun Unit!7672 () Unit!7670)

(assert (=> b!247820 (= e!160759 Unit!7672)))

(declare-fun lt!124100 () Unit!7670)

(declare-fun lemmaArrayContainsKeyThenInListMap!189 (array!12223 array!12221 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) (_ BitVec 32) Int) Unit!7670)

(assert (=> b!247820 (= lt!124100 (lemmaArrayContainsKeyThenInListMap!189 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(assert (=> b!247820 false))

(declare-fun b!247821 () Bool)

(declare-fun res!121450 () Bool)

(assert (=> b!247821 (=> (not res!121450) (not e!160766))))

(assert (=> b!247821 (= res!121450 (= (select (arr!5799 (_keys!6706 thiss!1504)) (index!6594 lt!124092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10961 () Bool)

(declare-fun mapRes!10961 () Bool)

(assert (=> mapIsEmpty!10961 mapRes!10961))

(declare-fun b!247822 () Bool)

(declare-fun e!160767 () Bool)

(assert (=> b!247822 (= e!160772 (and e!160767 mapRes!10961))))

(declare-fun condMapEmpty!10961 () Bool)

(declare-fun mapDefault!10961 () ValueCell!2885)

