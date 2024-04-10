; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22054 () Bool)

(assert start!22054)

(declare-fun b!228093 () Bool)

(declare-fun b_free!6121 () Bool)

(declare-fun b_next!6121 () Bool)

(assert (=> b!228093 (= b_free!6121 (not b_next!6121))))

(declare-fun tp!21505 () Bool)

(declare-fun b_and!13019 () Bool)

(assert (=> b!228093 (= tp!21505 b_and!13019)))

(declare-fun b!228090 () Bool)

(declare-fun e!147981 () Bool)

(declare-datatypes ((SeekEntryResult!903 0))(
  ( (MissingZero!903 (index!5782 (_ BitVec 32))) (Found!903 (index!5783 (_ BitVec 32))) (Intermediate!903 (undefined!1715 Bool) (index!5784 (_ BitVec 32)) (x!23315 (_ BitVec 32))) (Undefined!903) (MissingVacant!903 (index!5785 (_ BitVec 32))) )
))
(declare-fun lt!114764 () SeekEntryResult!903)

(assert (=> b!228090 (= e!147981 (is-Undefined!903 lt!114764))))

(declare-fun b!228091 () Bool)

(declare-fun e!147984 () Bool)

(declare-fun e!147987 () Bool)

(assert (=> b!228091 (= e!147984 e!147987)))

(declare-fun res!112272 () Bool)

(assert (=> b!228091 (=> (not res!112272) (not e!147987))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228091 (= res!112272 (or (= lt!114764 (MissingZero!903 index!297)) (= lt!114764 (MissingVacant!903 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7625 0))(
  ( (V!7626 (val!3036 Int)) )
))
(declare-datatypes ((ValueCell!2648 0))(
  ( (ValueCellFull!2648 (v!5056 V!7625)) (EmptyCell!2648) )
))
(declare-datatypes ((array!11209 0))(
  ( (array!11210 (arr!5324 (Array (_ BitVec 32) ValueCell!2648)) (size!5657 (_ BitVec 32))) )
))
(declare-datatypes ((array!11211 0))(
  ( (array!11212 (arr!5325 (Array (_ BitVec 32) (_ BitVec 64))) (size!5658 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3196 0))(
  ( (LongMapFixedSize!3197 (defaultEntry!4257 Int) (mask!10125 (_ BitVec 32)) (extraKeys!3994 (_ BitVec 32)) (zeroValue!4098 V!7625) (minValue!4098 V!7625) (_size!1647 (_ BitVec 32)) (_keys!6311 array!11211) (_values!4240 array!11209) (_vacant!1647 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3196)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11211 (_ BitVec 32)) SeekEntryResult!903)

(assert (=> b!228091 (= lt!114764 (seekEntryOrOpen!0 key!932 (_keys!6311 thiss!1504) (mask!10125 thiss!1504)))))

(declare-fun bm!21194 () Bool)

(declare-fun call!21197 () Bool)

(declare-fun arrayContainsKey!0 (array!11211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21194 (= call!21197 (arrayContainsKey!0 (_keys!6311 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10144 () Bool)

(declare-fun mapRes!10144 () Bool)

(declare-fun tp!21504 () Bool)

(declare-fun e!147986 () Bool)

(assert (=> mapNonEmpty!10144 (= mapRes!10144 (and tp!21504 e!147986))))

(declare-fun mapValue!10144 () ValueCell!2648)

(declare-fun mapKey!10144 () (_ BitVec 32))

(declare-fun mapRest!10144 () (Array (_ BitVec 32) ValueCell!2648))

(assert (=> mapNonEmpty!10144 (= (arr!5324 (_values!4240 thiss!1504)) (store mapRest!10144 mapKey!10144 mapValue!10144))))

(declare-fun b!228092 () Bool)

(declare-datatypes ((Unit!6929 0))(
  ( (Unit!6930) )
))
(declare-fun e!147980 () Unit!6929)

(declare-fun Unit!6931 () Unit!6929)

(assert (=> b!228092 (= e!147980 Unit!6931)))

(declare-fun lt!114760 () Unit!6929)

(declare-fun lemmaArrayContainsKeyThenInListMap!107 (array!11211 array!11209 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) (_ BitVec 32) Int) Unit!6929)

(assert (=> b!228092 (= lt!114760 (lemmaArrayContainsKeyThenInListMap!107 (_keys!6311 thiss!1504) (_values!4240 thiss!1504) (mask!10125 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4257 thiss!1504)))))

(assert (=> b!228092 false))

(declare-fun e!147988 () Bool)

(declare-fun e!147989 () Bool)

(declare-fun tp_is_empty!5983 () Bool)

(declare-fun array_inv!3521 (array!11211) Bool)

(declare-fun array_inv!3522 (array!11209) Bool)

(assert (=> b!228093 (= e!147989 (and tp!21505 tp_is_empty!5983 (array_inv!3521 (_keys!6311 thiss!1504)) (array_inv!3522 (_values!4240 thiss!1504)) e!147988))))

(declare-fun b!228094 () Bool)

(declare-fun e!147977 () Bool)

(assert (=> b!228094 (= e!147977 (not call!21197))))

(declare-fun b!228095 () Bool)

(declare-fun e!147975 () Bool)

(assert (=> b!228095 (= e!147975 tp_is_empty!5983)))

(declare-fun b!228096 () Bool)

(assert (=> b!228096 (= e!147986 tp_is_empty!5983)))

(declare-fun b!228097 () Bool)

(declare-fun res!112282 () Bool)

(declare-fun e!147982 () Bool)

(assert (=> b!228097 (=> res!112282 e!147982)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11211 (_ BitVec 32)) Bool)

(assert (=> b!228097 (= res!112282 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6311 thiss!1504) (mask!10125 thiss!1504))))))

(declare-fun b!228098 () Bool)

(assert (=> b!228098 (= e!147988 (and e!147975 mapRes!10144))))

(declare-fun condMapEmpty!10144 () Bool)

(declare-fun mapDefault!10144 () ValueCell!2648)

