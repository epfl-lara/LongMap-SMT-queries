; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21898 () Bool)

(assert start!21898)

(declare-fun b!221913 () Bool)

(declare-fun b_free!5965 () Bool)

(declare-fun b_next!5965 () Bool)

(assert (=> b!221913 (= b_free!5965 (not b_next!5965))))

(declare-fun tp!21037 () Bool)

(declare-fun b_and!12863 () Bool)

(assert (=> b!221913 (= tp!21037 b_and!12863)))

(declare-fun b!221908 () Bool)

(declare-fun e!144216 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3294 0))(
  ( (Nil!3291) (Cons!3290 (h!3938 (_ BitVec 64)) (t!8253 List!3294)) )
))
(declare-fun contains!1514 (List!3294 (_ BitVec 64)) Bool)

(assert (=> b!221908 (= e!144216 (contains!1514 Nil!3291 key!932))))

(declare-fun b!221909 () Bool)

(declare-fun e!144217 () Bool)

(declare-fun tp_is_empty!5827 () Bool)

(assert (=> b!221909 (= e!144217 tp_is_empty!5827)))

(declare-fun b!221910 () Bool)

(declare-fun e!144218 () Bool)

(declare-fun call!20730 () Bool)

(assert (=> b!221910 (= e!144218 (not call!20730))))

(declare-fun b!221911 () Bool)

(declare-fun res!108911 () Bool)

(assert (=> b!221911 (=> (not res!108911) (not e!144218))))

(declare-datatypes ((V!7417 0))(
  ( (V!7418 (val!2958 Int)) )
))
(declare-datatypes ((ValueCell!2570 0))(
  ( (ValueCellFull!2570 (v!4978 V!7417)) (EmptyCell!2570) )
))
(declare-datatypes ((array!10897 0))(
  ( (array!10898 (arr!5168 (Array (_ BitVec 32) ValueCell!2570)) (size!5501 (_ BitVec 32))) )
))
(declare-datatypes ((array!10899 0))(
  ( (array!10900 (arr!5169 (Array (_ BitVec 32) (_ BitVec 64))) (size!5502 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3040 0))(
  ( (LongMapFixedSize!3041 (defaultEntry!4179 Int) (mask!9995 (_ BitVec 32)) (extraKeys!3916 (_ BitVec 32)) (zeroValue!4020 V!7417) (minValue!4020 V!7417) (_size!1569 (_ BitVec 32)) (_keys!6233 array!10899) (_values!4162 array!10897) (_vacant!1569 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3040)

(declare-datatypes ((SeekEntryResult!831 0))(
  ( (MissingZero!831 (index!5494 (_ BitVec 32))) (Found!831 (index!5495 (_ BitVec 32))) (Intermediate!831 (undefined!1643 Bool) (index!5496 (_ BitVec 32)) (x!23035 (_ BitVec 32))) (Undefined!831) (MissingVacant!831 (index!5497 (_ BitVec 32))) )
))
(declare-fun lt!112522 () SeekEntryResult!831)

(assert (=> b!221911 (= res!108911 (= (select (arr!5169 (_keys!6233 thiss!1504)) (index!5494 lt!112522)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221912 () Bool)

(declare-datatypes ((Unit!6638 0))(
  ( (Unit!6639) )
))
(declare-fun e!144225 () Unit!6638)

(declare-fun Unit!6640 () Unit!6638)

(assert (=> b!221912 (= e!144225 Unit!6640)))

(declare-fun lt!112520 () Unit!6638)

(declare-fun lemmaArrayContainsKeyThenInListMap!55 (array!10899 array!10897 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) (_ BitVec 32) Int) Unit!6638)

(assert (=> b!221912 (= lt!112520 (lemmaArrayContainsKeyThenInListMap!55 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4179 thiss!1504)))))

(assert (=> b!221912 false))

(declare-fun e!144223 () Bool)

(declare-fun e!144219 () Bool)

(declare-fun array_inv!3421 (array!10899) Bool)

(declare-fun array_inv!3422 (array!10897) Bool)

(assert (=> b!221913 (= e!144219 (and tp!21037 tp_is_empty!5827 (array_inv!3421 (_keys!6233 thiss!1504)) (array_inv!3422 (_values!4162 thiss!1504)) e!144223))))

(declare-fun b!221914 () Bool)

(declare-fun e!144214 () Bool)

(assert (=> b!221914 (= e!144214 (not call!20730))))

(declare-fun b!221915 () Bool)

(declare-fun res!108904 () Bool)

(declare-fun e!144221 () Bool)

(assert (=> b!221915 (=> (not res!108904) (not e!144221))))

(assert (=> b!221915 (= res!108904 (not (contains!1514 Nil!3291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221916 () Bool)

(declare-fun e!144224 () Bool)

(declare-fun e!144215 () Bool)

(assert (=> b!221916 (= e!144224 e!144215)))

(declare-fun res!108902 () Bool)

(assert (=> b!221916 (=> (not res!108902) (not e!144215))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221916 (= res!108902 (or (= lt!112522 (MissingZero!831 index!297)) (= lt!112522 (MissingVacant!831 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10899 (_ BitVec 32)) SeekEntryResult!831)

(assert (=> b!221916 (= lt!112522 (seekEntryOrOpen!0 key!932 (_keys!6233 thiss!1504) (mask!9995 thiss!1504)))))

(declare-fun mapIsEmpty!9910 () Bool)

(declare-fun mapRes!9910 () Bool)

(assert (=> mapIsEmpty!9910 mapRes!9910))

(declare-fun c!36885 () Bool)

(declare-fun bm!20726 () Bool)

(declare-fun call!20729 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20726 (= call!20729 (inRange!0 (ite c!36885 (index!5494 lt!112522) (index!5497 lt!112522)) (mask!9995 thiss!1504)))))

(declare-fun b!221917 () Bool)

(declare-fun e!144210 () Bool)

(assert (=> b!221917 (= e!144215 e!144210)))

(declare-fun res!108908 () Bool)

(assert (=> b!221917 (=> (not res!108908) (not e!144210))))

(assert (=> b!221917 (= res!108908 (inRange!0 index!297 (mask!9995 thiss!1504)))))

(declare-fun lt!112526 () Unit!6638)

(declare-fun e!144222 () Unit!6638)

(assert (=> b!221917 (= lt!112526 e!144222)))

(declare-fun c!36887 () Bool)

(declare-datatypes ((tuple2!4392 0))(
  ( (tuple2!4393 (_1!2207 (_ BitVec 64)) (_2!2207 V!7417)) )
))
(declare-datatypes ((List!3295 0))(
  ( (Nil!3292) (Cons!3291 (h!3939 tuple2!4392) (t!8254 List!3295)) )
))
(declare-datatypes ((ListLongMap!3305 0))(
  ( (ListLongMap!3306 (toList!1668 List!3295)) )
))
(declare-fun contains!1515 (ListLongMap!3305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1196 (array!10899 array!10897 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 32) Int) ListLongMap!3305)

(assert (=> b!221917 (= c!36887 (contains!1515 (getCurrentListMap!1196 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4179 thiss!1504)) key!932))))

(declare-fun b!221918 () Bool)

(declare-fun e!144226 () Bool)

(assert (=> b!221918 (= e!144226 tp_is_empty!5827)))

(declare-fun mapNonEmpty!9910 () Bool)

(declare-fun tp!21036 () Bool)

(assert (=> mapNonEmpty!9910 (= mapRes!9910 (and tp!21036 e!144217))))

(declare-fun mapValue!9910 () ValueCell!2570)

(declare-fun mapKey!9910 () (_ BitVec 32))

(declare-fun mapRest!9910 () (Array (_ BitVec 32) ValueCell!2570))

(assert (=> mapNonEmpty!9910 (= (arr!5168 (_values!4162 thiss!1504)) (store mapRest!9910 mapKey!9910 mapValue!9910))))

(declare-fun b!221919 () Bool)

(declare-fun Unit!6641 () Unit!6638)

(assert (=> b!221919 (= e!144222 Unit!6641)))

(declare-fun lt!112521 () Unit!6638)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!220 (array!10899 array!10897 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) Int) Unit!6638)

(assert (=> b!221919 (= lt!112521 (lemmaInListMapThenSeekEntryOrOpenFindsIt!220 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 (defaultEntry!4179 thiss!1504)))))

(assert (=> b!221919 false))

(declare-fun b!221920 () Bool)

(declare-fun e!144212 () Bool)

(assert (=> b!221920 (= e!144212 (is-Undefined!831 lt!112522))))

(declare-fun b!221921 () Bool)

(declare-fun Unit!6642 () Unit!6638)

(assert (=> b!221921 (= e!144225 Unit!6642)))

(declare-fun b!221922 () Bool)

(declare-fun e!144227 () Bool)

(declare-fun e!144211 () Bool)

(assert (=> b!221922 (= e!144227 e!144211)))

(declare-fun res!108912 () Bool)

(assert (=> b!221922 (=> (not res!108912) (not e!144211))))

(assert (=> b!221922 (= res!108912 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!221923 () Bool)

(assert (=> b!221923 (= e!144212 e!144214)))

(declare-fun res!108913 () Bool)

(assert (=> b!221923 (= res!108913 call!20729)))

(assert (=> b!221923 (=> (not res!108913) (not e!144214))))

(declare-fun b!221924 () Bool)

(declare-fun res!108900 () Bool)

(assert (=> b!221924 (=> (not res!108900) (not e!144218))))

(assert (=> b!221924 (= res!108900 call!20729)))

(declare-fun e!144220 () Bool)

(assert (=> b!221924 (= e!144220 e!144218)))

(declare-fun b!221925 () Bool)

(declare-fun res!108905 () Bool)

(assert (=> b!221925 (=> (not res!108905) (not e!144221))))

(assert (=> b!221925 (= res!108905 e!144227)))

(declare-fun res!108899 () Bool)

(assert (=> b!221925 (=> res!108899 e!144227)))

(assert (=> b!221925 (= res!108899 e!144216)))

(declare-fun res!108903 () Bool)

(assert (=> b!221925 (=> (not res!108903) (not e!144216))))

(assert (=> b!221925 (= res!108903 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun bm!20727 () Bool)

(declare-fun arrayContainsKey!0 (array!10899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20727 (= call!20730 (arrayContainsKey!0 (_keys!6233 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221926 () Bool)

(assert (=> b!221926 (= e!144210 e!144221)))

(declare-fun res!108909 () Bool)

(assert (=> b!221926 (=> (not res!108909) (not e!144221))))

(assert (=> b!221926 (= res!108909 (and (bvslt (size!5502 (_keys!6233 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5502 (_keys!6233 thiss!1504)))))))

(declare-fun lt!112525 () Unit!6638)

(assert (=> b!221926 (= lt!112525 e!144225)))

(declare-fun c!36888 () Bool)

(assert (=> b!221926 (= c!36888 (arrayContainsKey!0 (_keys!6233 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221927 () Bool)

(declare-fun res!108910 () Bool)

(assert (=> b!221927 (=> (not res!108910) (not e!144224))))

(assert (=> b!221927 (= res!108910 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221928 () Bool)

(declare-fun res!108906 () Bool)

(assert (=> b!221928 (=> (not res!108906) (not e!144221))))

(declare-fun noDuplicate!66 (List!3294) Bool)

(assert (=> b!221928 (= res!108906 (noDuplicate!66 Nil!3291))))

(declare-fun b!221929 () Bool)

(assert (=> b!221929 (= e!144223 (and e!144226 mapRes!9910))))

(declare-fun condMapEmpty!9910 () Bool)

(declare-fun mapDefault!9910 () ValueCell!2570)

