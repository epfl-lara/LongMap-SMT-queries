; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24222 () Bool)

(assert start!24222)

(declare-fun b!253256 () Bool)

(declare-fun b_free!6661 () Bool)

(declare-fun b_next!6661 () Bool)

(assert (=> b!253256 (= b_free!6661 (not b_next!6661))))

(declare-fun tp!23268 () Bool)

(declare-fun b_and!13701 () Bool)

(assert (=> b!253256 (= tp!23268 b_and!13701)))

(declare-fun call!23889 () Bool)

(declare-fun c!42704 () Bool)

(declare-datatypes ((V!8345 0))(
  ( (V!8346 (val!3306 Int)) )
))
(declare-datatypes ((ValueCell!2918 0))(
  ( (ValueCellFull!2918 (v!5379 V!8345)) (EmptyCell!2918) )
))
(declare-datatypes ((array!12375 0))(
  ( (array!12376 (arr!5864 (Array (_ BitVec 32) ValueCell!2918)) (size!6211 (_ BitVec 32))) )
))
(declare-datatypes ((array!12377 0))(
  ( (array!12378 (arr!5865 (Array (_ BitVec 32) (_ BitVec 64))) (size!6212 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3736 0))(
  ( (LongMapFixedSize!3737 (defaultEntry!4677 Int) (mask!10910 (_ BitVec 32)) (extraKeys!4414 (_ BitVec 32)) (zeroValue!4518 V!8345) (minValue!4518 V!8345) (_size!1917 (_ BitVec 32)) (_keys!6829 array!12377) (_values!4660 array!12375) (_vacant!1917 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3736)

(declare-fun bm!23886 () Bool)

(declare-datatypes ((SeekEntryResult!1138 0))(
  ( (MissingZero!1138 (index!6722 (_ BitVec 32))) (Found!1138 (index!6723 (_ BitVec 32))) (Intermediate!1138 (undefined!1950 Bool) (index!6724 (_ BitVec 32)) (x!24812 (_ BitVec 32))) (Undefined!1138) (MissingVacant!1138 (index!6725 (_ BitVec 32))) )
))
(declare-fun lt!126957 () SeekEntryResult!1138)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23886 (= call!23889 (inRange!0 (ite c!42704 (index!6722 lt!126957) (index!6725 lt!126957)) (mask!10910 thiss!1504)))))

(declare-fun b!253252 () Bool)

(declare-fun e!164201 () Bool)

(declare-fun call!23890 () Bool)

(assert (=> b!253252 (= e!164201 (not call!23890))))

(declare-fun b!253253 () Bool)

(declare-fun e!164208 () Bool)

(declare-fun e!164213 () Bool)

(assert (=> b!253253 (= e!164208 e!164213)))

(declare-fun res!123970 () Bool)

(assert (=> b!253253 (=> (not res!123970) (not e!164213))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253253 (= res!123970 (or (= lt!126957 (MissingZero!1138 index!297)) (= lt!126957 (MissingVacant!1138 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12377 (_ BitVec 32)) SeekEntryResult!1138)

(assert (=> b!253253 (= lt!126957 (seekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun b!253254 () Bool)

(declare-fun res!123959 () Bool)

(declare-fun e!164214 () Bool)

(assert (=> b!253254 (=> res!123959 e!164214)))

(declare-datatypes ((List!3750 0))(
  ( (Nil!3747) (Cons!3746 (h!4408 (_ BitVec 64)) (t!8795 List!3750)) )
))
(declare-fun arrayNoDuplicates!0 (array!12377 (_ BitVec 32) List!3750) Bool)

(assert (=> b!253254 (= res!123959 (not (arrayNoDuplicates!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 Nil!3747)))))

(declare-fun bm!23887 () Bool)

(declare-fun arrayContainsKey!0 (array!12377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23887 (= call!23890 (arrayContainsKey!0 (_keys!6829 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253255 () Bool)

(declare-fun res!123968 () Bool)

(assert (=> b!253255 (=> res!123968 e!164214)))

(assert (=> b!253255 (= res!123968 (or (not (= (size!6211 (_values!4660 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10910 thiss!1504)))) (not (= (size!6212 (_keys!6829 thiss!1504)) (size!6211 (_values!4660 thiss!1504)))) (bvslt (mask!10910 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4414 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4414 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!164215 () Bool)

(declare-fun e!164212 () Bool)

(declare-fun tp_is_empty!6523 () Bool)

(declare-fun array_inv!3879 (array!12377) Bool)

(declare-fun array_inv!3880 (array!12375) Bool)

(assert (=> b!253256 (= e!164212 (and tp!23268 tp_is_empty!6523 (array_inv!3879 (_keys!6829 thiss!1504)) (array_inv!3880 (_values!4660 thiss!1504)) e!164215))))

(declare-fun b!253257 () Bool)

(declare-fun res!123960 () Bool)

(assert (=> b!253257 (= res!123960 (= (select (arr!5865 (_keys!6829 thiss!1504)) (index!6725 lt!126957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253257 (=> (not res!123960) (not e!164201))))

(declare-fun mapIsEmpty!11097 () Bool)

(declare-fun mapRes!11097 () Bool)

(assert (=> mapIsEmpty!11097 mapRes!11097))

(declare-fun b!253258 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253258 (= e!164214 (validKeyInArray!0 key!932))))

(declare-fun b!253259 () Bool)

(declare-fun e!164205 () Bool)

(assert (=> b!253259 (= e!164215 (and e!164205 mapRes!11097))))

(declare-fun condMapEmpty!11097 () Bool)

(declare-fun mapDefault!11097 () ValueCell!2918)

