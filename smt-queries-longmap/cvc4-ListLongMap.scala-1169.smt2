; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25022 () Bool)

(assert start!25022)

(declare-fun b!260932 () Bool)

(declare-fun b_free!6767 () Bool)

(declare-fun b_next!6767 () Bool)

(assert (=> b!260932 (= b_free!6767 (not b_next!6767))))

(declare-fun tp!23627 () Bool)

(declare-fun b_and!13887 () Bool)

(assert (=> b!260932 (= tp!23627 b_and!13887)))

(declare-fun b!260927 () Bool)

(declare-fun e!169108 () Bool)

(declare-fun e!169103 () Bool)

(assert (=> b!260927 (= e!169108 e!169103)))

(declare-fun res!127512 () Bool)

(assert (=> b!260927 (=> (not res!127512) (not e!169103))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8485 0))(
  ( (V!8486 (val!3359 Int)) )
))
(declare-datatypes ((ValueCell!2971 0))(
  ( (ValueCellFull!2971 (v!5478 V!8485)) (EmptyCell!2971) )
))
(declare-datatypes ((array!12613 0))(
  ( (array!12614 (arr!5970 (Array (_ BitVec 32) ValueCell!2971)) (size!6320 (_ BitVec 32))) )
))
(declare-datatypes ((array!12615 0))(
  ( (array!12616 (arr!5971 (Array (_ BitVec 32) (_ BitVec 64))) (size!6321 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3842 0))(
  ( (LongMapFixedSize!3843 (defaultEntry!4809 Int) (mask!11146 (_ BitVec 32)) (extraKeys!4546 (_ BitVec 32)) (zeroValue!4650 V!8485) (minValue!4650 V!8485) (_size!1970 (_ BitVec 32)) (_keys!6993 array!12615) (_values!4792 array!12613) (_vacant!1970 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3842)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260927 (= res!127512 (inRange!0 index!297 (mask!11146 thiss!1504)))))

(declare-datatypes ((Unit!8113 0))(
  ( (Unit!8114) )
))
(declare-fun lt!131676 () Unit!8113)

(declare-fun e!169096 () Unit!8113)

(assert (=> b!260927 (= lt!131676 e!169096)))

(declare-fun c!44379 () Bool)

(declare-datatypes ((tuple2!4954 0))(
  ( (tuple2!4955 (_1!2488 (_ BitVec 64)) (_2!2488 V!8485)) )
))
(declare-datatypes ((List!3832 0))(
  ( (Nil!3829) (Cons!3828 (h!4493 tuple2!4954) (t!8903 List!3832)) )
))
(declare-datatypes ((ListLongMap!3867 0))(
  ( (ListLongMap!3868 (toList!1949 List!3832)) )
))
(declare-fun lt!131672 () ListLongMap!3867)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1895 (ListLongMap!3867 (_ BitVec 64)) Bool)

(assert (=> b!260927 (= c!44379 (contains!1895 lt!131672 key!932))))

(declare-fun getCurrentListMap!1477 (array!12615 array!12613 (_ BitVec 32) (_ BitVec 32) V!8485 V!8485 (_ BitVec 32) Int) ListLongMap!3867)

(assert (=> b!260927 (= lt!131672 (getCurrentListMap!1477 (_keys!6993 thiss!1504) (_values!4792 thiss!1504) (mask!11146 thiss!1504) (extraKeys!4546 thiss!1504) (zeroValue!4650 thiss!1504) (minValue!4650 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4809 thiss!1504)))))

(declare-fun b!260928 () Bool)

(declare-fun res!127508 () Bool)

(declare-fun e!169102 () Bool)

(assert (=> b!260928 (=> (not res!127508) (not e!169102))))

(declare-datatypes ((SeekEntryResult!1186 0))(
  ( (MissingZero!1186 (index!6914 (_ BitVec 32))) (Found!1186 (index!6915 (_ BitVec 32))) (Intermediate!1186 (undefined!1998 Bool) (index!6916 (_ BitVec 32)) (x!25150 (_ BitVec 32))) (Undefined!1186) (MissingVacant!1186 (index!6917 (_ BitVec 32))) )
))
(declare-fun lt!131668 () SeekEntryResult!1186)

(assert (=> b!260928 (= res!127508 (= (select (arr!5971 (_keys!6993 thiss!1504)) (index!6914 lt!131668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260929 () Bool)

(declare-fun Unit!8115 () Unit!8113)

(assert (=> b!260929 (= e!169096 Unit!8115)))

(declare-fun lt!131671 () Unit!8113)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!444 (array!12615 array!12613 (_ BitVec 32) (_ BitVec 32) V!8485 V!8485 (_ BitVec 64) Int) Unit!8113)

(assert (=> b!260929 (= lt!131671 (lemmaInListMapThenSeekEntryOrOpenFindsIt!444 (_keys!6993 thiss!1504) (_values!4792 thiss!1504) (mask!11146 thiss!1504) (extraKeys!4546 thiss!1504) (zeroValue!4650 thiss!1504) (minValue!4650 thiss!1504) key!932 (defaultEntry!4809 thiss!1504)))))

(assert (=> b!260929 false))

(declare-fun b!260930 () Bool)

(declare-fun e!169106 () Bool)

(declare-fun tp_is_empty!6629 () Bool)

(assert (=> b!260930 (= e!169106 tp_is_empty!6629)))

(declare-fun b!260931 () Bool)

(declare-fun call!24891 () Bool)

(assert (=> b!260931 (= e!169102 (not call!24891))))

(declare-fun e!169097 () Bool)

(declare-fun e!169105 () Bool)

(declare-fun array_inv!3943 (array!12615) Bool)

(declare-fun array_inv!3944 (array!12613) Bool)

(assert (=> b!260932 (= e!169097 (and tp!23627 tp_is_empty!6629 (array_inv!3943 (_keys!6993 thiss!1504)) (array_inv!3944 (_values!4792 thiss!1504)) e!169105))))

(declare-fun mapNonEmpty!11298 () Bool)

(declare-fun mapRes!11298 () Bool)

(declare-fun tp!23628 () Bool)

(assert (=> mapNonEmpty!11298 (= mapRes!11298 (and tp!23628 e!169106))))

(declare-fun mapKey!11298 () (_ BitVec 32))

(declare-fun mapValue!11298 () ValueCell!2971)

(declare-fun mapRest!11298 () (Array (_ BitVec 32) ValueCell!2971))

(assert (=> mapNonEmpty!11298 (= (arr!5970 (_values!4792 thiss!1504)) (store mapRest!11298 mapKey!11298 mapValue!11298))))

(declare-fun b!260933 () Bool)

(declare-fun e!169099 () Bool)

(assert (=> b!260933 (= e!169105 (and e!169099 mapRes!11298))))

(declare-fun condMapEmpty!11298 () Bool)

(declare-fun mapDefault!11298 () ValueCell!2971)

