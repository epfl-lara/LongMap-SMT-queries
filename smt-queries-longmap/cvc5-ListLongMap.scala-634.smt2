; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16152 () Bool)

(assert start!16152)

(declare-fun b!160923 () Bool)

(declare-fun b_free!3613 () Bool)

(declare-fun b_next!3613 () Bool)

(assert (=> b!160923 (= b_free!3613 (not b_next!3613))))

(declare-fun tp!13408 () Bool)

(declare-fun b_and!10027 () Bool)

(assert (=> b!160923 (= tp!13408 b_and!10027)))

(declare-fun b!160914 () Bool)

(declare-fun res!76272 () Bool)

(declare-fun e!105165 () Bool)

(assert (=> b!160914 (=> (not res!76272) (not e!105165))))

(declare-datatypes ((V!4201 0))(
  ( (V!4202 (val!1752 Int)) )
))
(declare-datatypes ((ValueCell!1364 0))(
  ( (ValueCellFull!1364 (v!3617 V!4201)) (EmptyCell!1364) )
))
(declare-datatypes ((array!5909 0))(
  ( (array!5910 (arr!2799 (Array (_ BitVec 32) (_ BitVec 64))) (size!3083 (_ BitVec 32))) )
))
(declare-datatypes ((array!5911 0))(
  ( (array!5912 (arr!2800 (Array (_ BitVec 32) ValueCell!1364)) (size!3084 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1636 0))(
  ( (LongMapFixedSize!1637 (defaultEntry!3260 Int) (mask!7840 (_ BitVec 32)) (extraKeys!3001 (_ BitVec 32)) (zeroValue!3103 V!4201) (minValue!3103 V!4201) (_size!867 (_ BitVec 32)) (_keys!5061 array!5909) (_values!3243 array!5911) (_vacant!867 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1636)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5909 (_ BitVec 32)) Bool)

(assert (=> b!160914 (= res!76272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5061 thiss!1248) (mask!7840 thiss!1248)))))

(declare-fun mapNonEmpty!5810 () Bool)

(declare-fun mapRes!5810 () Bool)

(declare-fun tp!13409 () Bool)

(declare-fun e!105167 () Bool)

(assert (=> mapNonEmpty!5810 (= mapRes!5810 (and tp!13409 e!105167))))

(declare-fun mapKey!5810 () (_ BitVec 32))

(declare-fun mapRest!5810 () (Array (_ BitVec 32) ValueCell!1364))

(declare-fun mapValue!5810 () ValueCell!1364)

(assert (=> mapNonEmpty!5810 (= (arr!2800 (_values!3243 thiss!1248)) (store mapRest!5810 mapKey!5810 mapValue!5810))))

(declare-fun b!160915 () Bool)

(declare-fun res!76268 () Bool)

(assert (=> b!160915 (=> (not res!76268) (not e!105165))))

(assert (=> b!160915 (= res!76268 (and (= (size!3084 (_values!3243 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7840 thiss!1248))) (= (size!3083 (_keys!5061 thiss!1248)) (size!3084 (_values!3243 thiss!1248))) (bvsge (mask!7840 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3001 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3001 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160916 () Bool)

(declare-fun res!76271 () Bool)

(assert (=> b!160916 (=> (not res!76271) (not e!105165))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2942 0))(
  ( (tuple2!2943 (_1!1482 (_ BitVec 64)) (_2!1482 V!4201)) )
))
(declare-datatypes ((List!1963 0))(
  ( (Nil!1960) (Cons!1959 (h!2572 tuple2!2942) (t!6765 List!1963)) )
))
(declare-datatypes ((ListLongMap!1929 0))(
  ( (ListLongMap!1930 (toList!980 List!1963)) )
))
(declare-fun contains!1016 (ListLongMap!1929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!644 (array!5909 array!5911 (_ BitVec 32) (_ BitVec 32) V!4201 V!4201 (_ BitVec 32) Int) ListLongMap!1929)

(assert (=> b!160916 (= res!76271 (not (contains!1016 (getCurrentListMap!644 (_keys!5061 thiss!1248) (_values!3243 thiss!1248) (mask!7840 thiss!1248) (extraKeys!3001 thiss!1248) (zeroValue!3103 thiss!1248) (minValue!3103 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3260 thiss!1248)) key!828)))))

(declare-fun b!160917 () Bool)

(declare-fun tp_is_empty!3415 () Bool)

(assert (=> b!160917 (= e!105167 tp_is_empty!3415)))

(declare-fun b!160919 () Bool)

(declare-fun res!76274 () Bool)

(assert (=> b!160919 (=> (not res!76274) (not e!105165))))

(declare-datatypes ((SeekEntryResult!342 0))(
  ( (MissingZero!342 (index!3536 (_ BitVec 32))) (Found!342 (index!3537 (_ BitVec 32))) (Intermediate!342 (undefined!1154 Bool) (index!3538 (_ BitVec 32)) (x!17758 (_ BitVec 32))) (Undefined!342) (MissingVacant!342 (index!3539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5909 (_ BitVec 32)) SeekEntryResult!342)

(assert (=> b!160919 (= res!76274 (is-Undefined!342 (seekEntryOrOpen!0 key!828 (_keys!5061 thiss!1248) (mask!7840 thiss!1248))))))

(declare-fun b!160920 () Bool)

(declare-fun res!76269 () Bool)

(assert (=> b!160920 (=> (not res!76269) (not e!105165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160920 (= res!76269 (validMask!0 (mask!7840 thiss!1248)))))

(declare-fun mapIsEmpty!5810 () Bool)

(assert (=> mapIsEmpty!5810 mapRes!5810))

(declare-fun b!160921 () Bool)

(declare-fun e!105163 () Bool)

(declare-fun e!105166 () Bool)

(assert (=> b!160921 (= e!105163 (and e!105166 mapRes!5810))))

(declare-fun condMapEmpty!5810 () Bool)

(declare-fun mapDefault!5810 () ValueCell!1364)

