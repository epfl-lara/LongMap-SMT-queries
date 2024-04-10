; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21928 () Bool)

(assert start!21928)

(declare-fun b!223241 () Bool)

(declare-fun b_free!5995 () Bool)

(declare-fun b_next!5995 () Bool)

(assert (=> b!223241 (= b_free!5995 (not b_next!5995))))

(declare-fun tp!21126 () Bool)

(declare-fun b_and!12893 () Bool)

(assert (=> b!223241 (= tp!21126 b_and!12893)))

(declare-fun b!223221 () Bool)

(declare-fun res!109687 () Bool)

(declare-fun e!145023 () Bool)

(assert (=> b!223221 (=> (not res!109687) (not e!145023))))

(declare-datatypes ((V!7457 0))(
  ( (V!7458 (val!2973 Int)) )
))
(declare-datatypes ((ValueCell!2585 0))(
  ( (ValueCellFull!2585 (v!4993 V!7457)) (EmptyCell!2585) )
))
(declare-datatypes ((array!10957 0))(
  ( (array!10958 (arr!5198 (Array (_ BitVec 32) ValueCell!2585)) (size!5531 (_ BitVec 32))) )
))
(declare-datatypes ((array!10959 0))(
  ( (array!10960 (arr!5199 (Array (_ BitVec 32) (_ BitVec 64))) (size!5532 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3070 0))(
  ( (LongMapFixedSize!3071 (defaultEntry!4194 Int) (mask!10020 (_ BitVec 32)) (extraKeys!3931 (_ BitVec 32)) (zeroValue!4035 V!7457) (minValue!4035 V!7457) (_size!1584 (_ BitVec 32)) (_keys!6248 array!10959) (_values!4177 array!10957) (_vacant!1584 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3070)

(declare-datatypes ((List!3317 0))(
  ( (Nil!3314) (Cons!3313 (h!3961 (_ BitVec 64)) (t!8276 List!3317)) )
))
(declare-fun arrayNoDuplicates!0 (array!10959 (_ BitVec 32) List!3317) Bool)

(assert (=> b!223221 (= res!109687 (arrayNoDuplicates!0 (_keys!6248 thiss!1504) #b00000000000000000000000000000000 Nil!3314))))

(declare-fun b!223222 () Bool)

(declare-fun e!145020 () Bool)

(declare-fun e!145028 () Bool)

(assert (=> b!223222 (= e!145020 e!145028)))

(declare-fun res!109675 () Bool)

(declare-fun call!20819 () Bool)

(assert (=> b!223222 (= res!109675 call!20819)))

(assert (=> b!223222 (=> (not res!109675) (not e!145028))))

(declare-fun b!223223 () Bool)

(declare-datatypes ((SeekEntryResult!846 0))(
  ( (MissingZero!846 (index!5554 (_ BitVec 32))) (Found!846 (index!5555 (_ BitVec 32))) (Intermediate!846 (undefined!1658 Bool) (index!5556 (_ BitVec 32)) (x!23090 (_ BitVec 32))) (Undefined!846) (MissingVacant!846 (index!5557 (_ BitVec 32))) )
))
(declare-fun lt!112849 () SeekEntryResult!846)

(assert (=> b!223223 (= e!145020 (is-Undefined!846 lt!112849))))

(declare-fun b!223224 () Bool)

(declare-fun res!109686 () Bool)

(declare-fun e!145022 () Bool)

(assert (=> b!223224 (=> (not res!109686) (not e!145022))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!223224 (= res!109686 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223225 () Bool)

(declare-fun res!109673 () Bool)

(assert (=> b!223225 (=> (not res!109673) (not e!145023))))

(declare-fun contains!1537 (List!3317 (_ BitVec 64)) Bool)

(assert (=> b!223225 (= res!109673 (not (contains!1537 Nil!3314 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223226 () Bool)

(declare-fun res!109681 () Bool)

(assert (=> b!223226 (=> (not res!109681) (not e!145023))))

(declare-fun e!145021 () Bool)

(assert (=> b!223226 (= res!109681 e!145021)))

(declare-fun res!109671 () Bool)

(assert (=> b!223226 (=> res!109671 e!145021)))

(declare-fun e!145037 () Bool)

(assert (=> b!223226 (= res!109671 e!145037)))

(declare-fun res!109688 () Bool)

(assert (=> b!223226 (=> (not res!109688) (not e!145037))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223226 (= res!109688 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223227 () Bool)

(declare-datatypes ((Unit!6703 0))(
  ( (Unit!6704) )
))
(declare-fun e!145035 () Unit!6703)

(declare-fun lt!112847 () Unit!6703)

(assert (=> b!223227 (= e!145035 lt!112847)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!241 (array!10959 array!10957 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) Int) Unit!6703)

(assert (=> b!223227 (= lt!112847 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!241 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 (defaultEntry!4194 thiss!1504)))))

(declare-fun c!37067 () Bool)

(assert (=> b!223227 (= c!37067 (is-MissingZero!846 lt!112849))))

(declare-fun e!145031 () Bool)

(assert (=> b!223227 e!145031))

(declare-fun res!109685 () Bool)

(assert (=> start!21928 (=> (not res!109685) (not e!145022))))

(declare-fun valid!1236 (LongMapFixedSize!3070) Bool)

(assert (=> start!21928 (= res!109685 (valid!1236 thiss!1504))))

(assert (=> start!21928 e!145022))

(declare-fun e!145034 () Bool)

(assert (=> start!21928 e!145034))

(assert (=> start!21928 true))

(declare-fun b!223228 () Bool)

(declare-fun res!109682 () Bool)

(assert (=> b!223228 (=> (not res!109682) (not e!145023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223228 (= res!109682 (validKeyInArray!0 key!932))))

(declare-fun b!223229 () Bool)

(assert (=> b!223229 (= e!145037 (contains!1537 Nil!3314 key!932))))

(declare-fun b!223230 () Bool)

(declare-fun Unit!6705 () Unit!6703)

(assert (=> b!223230 (= e!145035 Unit!6705)))

(declare-fun lt!112846 () Unit!6703)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!230 (array!10959 array!10957 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) Int) Unit!6703)

(assert (=> b!223230 (= lt!112846 (lemmaInListMapThenSeekEntryOrOpenFindsIt!230 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 (defaultEntry!4194 thiss!1504)))))

(assert (=> b!223230 false))

(declare-fun b!223231 () Bool)

(declare-fun res!109674 () Bool)

(assert (=> b!223231 (= res!109674 (= (select (arr!5199 (_keys!6248 thiss!1504)) (index!5557 lt!112849)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223231 (=> (not res!109674) (not e!145028))))

(declare-fun b!223232 () Bool)

(declare-fun e!145029 () Unit!6703)

(declare-fun Unit!6706 () Unit!6703)

(assert (=> b!223232 (= e!145029 Unit!6706)))

(declare-fun lt!112848 () Unit!6703)

(declare-fun lemmaArrayContainsKeyThenInListMap!69 (array!10959 array!10957 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) (_ BitVec 32) Int) Unit!6703)

(assert (=> b!223232 (= lt!112848 (lemmaArrayContainsKeyThenInListMap!69 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4194 thiss!1504)))))

(assert (=> b!223232 false))

(declare-fun b!223233 () Bool)

(declare-fun e!145027 () Bool)

(declare-fun call!20820 () Bool)

(assert (=> b!223233 (= e!145027 (not call!20820))))

(declare-fun b!223234 () Bool)

(declare-fun Unit!6707 () Unit!6703)

(assert (=> b!223234 (= e!145029 Unit!6707)))

(declare-fun b!223235 () Bool)

(declare-fun res!109678 () Bool)

(assert (=> b!223235 (=> (not res!109678) (not e!145027))))

(assert (=> b!223235 (= res!109678 (= (select (arr!5199 (_keys!6248 thiss!1504)) (index!5554 lt!112849)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9955 () Bool)

(declare-fun mapRes!9955 () Bool)

(declare-fun tp!21127 () Bool)

(declare-fun e!145036 () Bool)

(assert (=> mapNonEmpty!9955 (= mapRes!9955 (and tp!21127 e!145036))))

(declare-fun mapRest!9955 () (Array (_ BitVec 32) ValueCell!2585))

(declare-fun mapValue!9955 () ValueCell!2585)

(declare-fun mapKey!9955 () (_ BitVec 32))

(assert (=> mapNonEmpty!9955 (= (arr!5198 (_values!4177 thiss!1504)) (store mapRest!9955 mapKey!9955 mapValue!9955))))

(declare-fun b!223236 () Bool)

(declare-fun e!145026 () Bool)

(declare-fun e!145033 () Bool)

(assert (=> b!223236 (= e!145026 (and e!145033 mapRes!9955))))

(declare-fun condMapEmpty!9955 () Bool)

(declare-fun mapDefault!9955 () ValueCell!2585)

