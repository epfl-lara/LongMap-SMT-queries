; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18798 () Bool)

(assert start!18798)

(declare-fun b!185745 () Bool)

(declare-fun b_free!4573 () Bool)

(declare-fun b_next!4573 () Bool)

(assert (=> b!185745 (= b_free!4573 (not b_next!4573))))

(declare-fun tp!16518 () Bool)

(declare-fun b_and!11175 () Bool)

(assert (=> b!185745 (= tp!16518 b_and!11175)))

(declare-fun b!185739 () Bool)

(declare-fun e!122211 () Bool)

(declare-fun tp_is_empty!4345 () Bool)

(assert (=> b!185739 (= e!122211 tp_is_empty!4345)))

(declare-fun b!185740 () Bool)

(declare-fun res!87872 () Bool)

(declare-fun e!122212 () Bool)

(assert (=> b!185740 (=> (not res!87872) (not e!122212))))

(declare-datatypes ((V!5441 0))(
  ( (V!5442 (val!2217 Int)) )
))
(declare-datatypes ((ValueCell!1829 0))(
  ( (ValueCellFull!1829 (v!4128 V!5441)) (EmptyCell!1829) )
))
(declare-datatypes ((array!7899 0))(
  ( (array!7900 (arr!3729 (Array (_ BitVec 32) (_ BitVec 64))) (size!4045 (_ BitVec 32))) )
))
(declare-datatypes ((array!7901 0))(
  ( (array!7902 (arr!3730 (Array (_ BitVec 32) ValueCell!1829)) (size!4046 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2566 0))(
  ( (LongMapFixedSize!2567 (defaultEntry!3785 Int) (mask!8898 (_ BitVec 32)) (extraKeys!3522 (_ BitVec 32)) (zeroValue!3626 V!5441) (minValue!3626 V!5441) (_size!1332 (_ BitVec 32)) (_keys!5726 array!7899) (_values!3768 array!7901) (_vacant!1332 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2566)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3452 0))(
  ( (tuple2!3453 (_1!1737 (_ BitVec 64)) (_2!1737 V!5441)) )
))
(declare-datatypes ((List!2363 0))(
  ( (Nil!2360) (Cons!2359 (h!2992 tuple2!3452) (t!7247 List!2363)) )
))
(declare-datatypes ((ListLongMap!2369 0))(
  ( (ListLongMap!2370 (toList!1200 List!2363)) )
))
(declare-fun contains!1296 (ListLongMap!2369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!848 (array!7899 array!7901 (_ BitVec 32) (_ BitVec 32) V!5441 V!5441 (_ BitVec 32) Int) ListLongMap!2369)

(assert (=> b!185740 (= res!87872 (not (contains!1296 (getCurrentListMap!848 (_keys!5726 thiss!1248) (_values!3768 thiss!1248) (mask!8898 thiss!1248) (extraKeys!3522 thiss!1248) (zeroValue!3626 thiss!1248) (minValue!3626 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3785 thiss!1248)) key!828)))))

(declare-fun b!185741 () Bool)

(declare-fun e!122214 () Bool)

(assert (=> b!185741 (= e!122214 tp_is_empty!4345)))

(declare-fun mapNonEmpty!7479 () Bool)

(declare-fun mapRes!7479 () Bool)

(declare-fun tp!16517 () Bool)

(assert (=> mapNonEmpty!7479 (= mapRes!7479 (and tp!16517 e!122211))))

(declare-fun mapKey!7479 () (_ BitVec 32))

(declare-fun mapValue!7479 () ValueCell!1829)

(declare-fun mapRest!7479 () (Array (_ BitVec 32) ValueCell!1829))

(assert (=> mapNonEmpty!7479 (= (arr!3730 (_values!3768 thiss!1248)) (store mapRest!7479 mapKey!7479 mapValue!7479))))

(declare-fun b!185742 () Bool)

(declare-fun e!122215 () Bool)

(assert (=> b!185742 (= e!122215 e!122212)))

(declare-fun res!87871 () Bool)

(assert (=> b!185742 (=> (not res!87871) (not e!122212))))

(declare-datatypes ((SeekEntryResult!635 0))(
  ( (MissingZero!635 (index!4710 (_ BitVec 32))) (Found!635 (index!4711 (_ BitVec 32))) (Intermediate!635 (undefined!1447 Bool) (index!4712 (_ BitVec 32)) (x!20165 (_ BitVec 32))) (Undefined!635) (MissingVacant!635 (index!4713 (_ BitVec 32))) )
))
(declare-fun lt!91856 () SeekEntryResult!635)

(assert (=> b!185742 (= res!87871 (and (not (is-Undefined!635 lt!91856)) (not (is-MissingVacant!635 lt!91856)) (not (is-MissingZero!635 lt!91856)) (is-Found!635 lt!91856)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7899 (_ BitVec 32)) SeekEntryResult!635)

(assert (=> b!185742 (= lt!91856 (seekEntryOrOpen!0 key!828 (_keys!5726 thiss!1248) (mask!8898 thiss!1248)))))

(declare-fun mapIsEmpty!7479 () Bool)

(assert (=> mapIsEmpty!7479 mapRes!7479))

(declare-fun b!185743 () Bool)

(declare-fun res!87867 () Bool)

(assert (=> b!185743 (=> (not res!87867) (not e!122212))))

(assert (=> b!185743 (= res!87867 (and (= (size!4046 (_values!3768 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8898 thiss!1248))) (= (size!4045 (_keys!5726 thiss!1248)) (size!4046 (_values!3768 thiss!1248))) (bvsge (mask!8898 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3522 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3522 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185744 () Bool)

(declare-fun res!87868 () Bool)

(assert (=> b!185744 (=> (not res!87868) (not e!122215))))

(assert (=> b!185744 (= res!87868 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185738 () Bool)

(assert (=> b!185738 (= e!122212 false)))

(declare-fun lt!91857 () Bool)

(declare-datatypes ((List!2364 0))(
  ( (Nil!2361) (Cons!2360 (h!2993 (_ BitVec 64)) (t!7248 List!2364)) )
))
(declare-fun arrayNoDuplicates!0 (array!7899 (_ BitVec 32) List!2364) Bool)

(assert (=> b!185738 (= lt!91857 (arrayNoDuplicates!0 (_keys!5726 thiss!1248) #b00000000000000000000000000000000 Nil!2361))))

(declare-fun res!87866 () Bool)

(assert (=> start!18798 (=> (not res!87866) (not e!122215))))

(declare-fun valid!1059 (LongMapFixedSize!2566) Bool)

(assert (=> start!18798 (= res!87866 (valid!1059 thiss!1248))))

(assert (=> start!18798 e!122215))

(declare-fun e!122209 () Bool)

(assert (=> start!18798 e!122209))

(assert (=> start!18798 true))

(declare-fun e!122213 () Bool)

(declare-fun array_inv!2413 (array!7899) Bool)

(declare-fun array_inv!2414 (array!7901) Bool)

(assert (=> b!185745 (= e!122209 (and tp!16518 tp_is_empty!4345 (array_inv!2413 (_keys!5726 thiss!1248)) (array_inv!2414 (_values!3768 thiss!1248)) e!122213))))

(declare-fun b!185746 () Bool)

(assert (=> b!185746 (= e!122213 (and e!122214 mapRes!7479))))

(declare-fun condMapEmpty!7479 () Bool)

(declare-fun mapDefault!7479 () ValueCell!1829)

