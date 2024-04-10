; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16168 () Bool)

(assert start!16168)

(declare-fun b!161183 () Bool)

(declare-fun b_free!3629 () Bool)

(declare-fun b_next!3629 () Bool)

(assert (=> b!161183 (= b_free!3629 (not b_next!3629))))

(declare-fun tp!13456 () Bool)

(declare-fun b_and!10043 () Bool)

(assert (=> b!161183 (= tp!13456 b_and!10043)))

(declare-fun b!161178 () Bool)

(declare-fun res!76437 () Bool)

(declare-fun e!105312 () Bool)

(assert (=> b!161178 (=> (not res!76437) (not e!105312))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4221 0))(
  ( (V!4222 (val!1760 Int)) )
))
(declare-datatypes ((ValueCell!1372 0))(
  ( (ValueCellFull!1372 (v!3625 V!4221)) (EmptyCell!1372) )
))
(declare-datatypes ((array!5941 0))(
  ( (array!5942 (arr!2815 (Array (_ BitVec 32) (_ BitVec 64))) (size!3099 (_ BitVec 32))) )
))
(declare-datatypes ((array!5943 0))(
  ( (array!5944 (arr!2816 (Array (_ BitVec 32) ValueCell!1372)) (size!3100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1652 0))(
  ( (LongMapFixedSize!1653 (defaultEntry!3268 Int) (mask!7852 (_ BitVec 32)) (extraKeys!3009 (_ BitVec 32)) (zeroValue!3111 V!4221) (minValue!3111 V!4221) (_size!875 (_ BitVec 32)) (_keys!5069 array!5941) (_values!3251 array!5943) (_vacant!875 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1652)

(declare-datatypes ((SeekEntryResult!348 0))(
  ( (MissingZero!348 (index!3560 (_ BitVec 32))) (Found!348 (index!3561 (_ BitVec 32))) (Intermediate!348 (undefined!1160 Bool) (index!3562 (_ BitVec 32)) (x!17780 (_ BitVec 32))) (Undefined!348) (MissingVacant!348 (index!3563 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5941 (_ BitVec 32)) SeekEntryResult!348)

(assert (=> b!161178 (= res!76437 (is-Undefined!348 (seekEntryOrOpen!0 key!828 (_keys!5069 thiss!1248) (mask!7852 thiss!1248))))))

(declare-fun b!161179 () Bool)

(declare-fun res!76436 () Bool)

(assert (=> b!161179 (=> (not res!76436) (not e!105312))))

(assert (=> b!161179 (= res!76436 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161180 () Bool)

(assert (=> b!161180 (= e!105312 false)))

(declare-fun lt!82156 () Bool)

(declare-datatypes ((List!1971 0))(
  ( (Nil!1968) (Cons!1967 (h!2580 (_ BitVec 64)) (t!6773 List!1971)) )
))
(declare-fun arrayNoDuplicates!0 (array!5941 (_ BitVec 32) List!1971) Bool)

(assert (=> b!161180 (= lt!82156 (arrayNoDuplicates!0 (_keys!5069 thiss!1248) #b00000000000000000000000000000000 Nil!1968))))

(declare-fun mapNonEmpty!5834 () Bool)

(declare-fun mapRes!5834 () Bool)

(declare-fun tp!13457 () Bool)

(declare-fun e!105307 () Bool)

(assert (=> mapNonEmpty!5834 (= mapRes!5834 (and tp!13457 e!105307))))

(declare-fun mapValue!5834 () ValueCell!1372)

(declare-fun mapRest!5834 () (Array (_ BitVec 32) ValueCell!1372))

(declare-fun mapKey!5834 () (_ BitVec 32))

(assert (=> mapNonEmpty!5834 (= (arr!2816 (_values!3251 thiss!1248)) (store mapRest!5834 mapKey!5834 mapValue!5834))))

(declare-fun b!161182 () Bool)

(declare-fun tp_is_empty!3431 () Bool)

(assert (=> b!161182 (= e!105307 tp_is_empty!3431)))

(declare-fun mapIsEmpty!5834 () Bool)

(assert (=> mapIsEmpty!5834 mapRes!5834))

(declare-fun e!105308 () Bool)

(declare-fun e!105309 () Bool)

(declare-fun array_inv!1799 (array!5941) Bool)

(declare-fun array_inv!1800 (array!5943) Bool)

(assert (=> b!161183 (= e!105309 (and tp!13456 tp_is_empty!3431 (array_inv!1799 (_keys!5069 thiss!1248)) (array_inv!1800 (_values!3251 thiss!1248)) e!105308))))

(declare-fun b!161184 () Bool)

(declare-fun e!105310 () Bool)

(assert (=> b!161184 (= e!105308 (and e!105310 mapRes!5834))))

(declare-fun condMapEmpty!5834 () Bool)

(declare-fun mapDefault!5834 () ValueCell!1372)

