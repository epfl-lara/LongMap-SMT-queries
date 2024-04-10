; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16752 () Bool)

(assert start!16752)

(declare-fun b!168423 () Bool)

(declare-fun b_free!4057 () Bool)

(declare-fun b_next!4057 () Bool)

(assert (=> b!168423 (= b_free!4057 (not b_next!4057))))

(declare-fun tp!14771 () Bool)

(declare-fun b_and!10471 () Bool)

(assert (=> b!168423 (= tp!14771 b_and!10471)))

(declare-fun e!110722 () Bool)

(declare-datatypes ((V!4793 0))(
  ( (V!4794 (val!1974 Int)) )
))
(declare-datatypes ((ValueCell!1586 0))(
  ( (ValueCellFull!1586 (v!3839 V!4793)) (EmptyCell!1586) )
))
(declare-datatypes ((array!6815 0))(
  ( (array!6816 (arr!3243 (Array (_ BitVec 32) (_ BitVec 64))) (size!3531 (_ BitVec 32))) )
))
(declare-datatypes ((array!6817 0))(
  ( (array!6818 (arr!3244 (Array (_ BitVec 32) ValueCell!1586)) (size!3532 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2080 0))(
  ( (LongMapFixedSize!2081 (defaultEntry!3482 Int) (mask!8247 (_ BitVec 32)) (extraKeys!3223 (_ BitVec 32)) (zeroValue!3325 V!4793) (minValue!3325 V!4793) (_size!1089 (_ BitVec 32)) (_keys!5307 array!6815) (_values!3465 array!6817) (_vacant!1089 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2080)

(declare-fun e!110727 () Bool)

(declare-fun tp_is_empty!3859 () Bool)

(declare-fun array_inv!2087 (array!6815) Bool)

(declare-fun array_inv!2088 (array!6817) Bool)

(assert (=> b!168423 (= e!110727 (and tp!14771 tp_is_empty!3859 (array_inv!2087 (_keys!5307 thiss!1248)) (array_inv!2088 (_values!3465 thiss!1248)) e!110722))))

(declare-fun e!110721 () Bool)

(declare-datatypes ((SeekEntryResult!500 0))(
  ( (MissingZero!500 (index!4168 (_ BitVec 32))) (Found!500 (index!4169 (_ BitVec 32))) (Intermediate!500 (undefined!1312 Bool) (index!4170 (_ BitVec 32)) (x!18616 (_ BitVec 32))) (Undefined!500) (MissingVacant!500 (index!4171 (_ BitVec 32))) )
))
(declare-fun lt!84222 () SeekEntryResult!500)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun b!168424 () Bool)

(assert (=> b!168424 (= e!110721 (= (select (arr!3243 (_keys!5307 thiss!1248)) (index!4169 lt!84222)) key!828))))

(declare-fun b!168425 () Bool)

(declare-fun res!80175 () Bool)

(declare-fun e!110723 () Bool)

(assert (=> b!168425 (=> res!80175 e!110723)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6815 (_ BitVec 32)) Bool)

(assert (=> b!168425 (= res!80175 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5307 thiss!1248) (mask!8247 thiss!1248))))))

(declare-fun b!168426 () Bool)

(declare-datatypes ((Unit!5183 0))(
  ( (Unit!5184) )
))
(declare-fun e!110724 () Unit!5183)

(declare-fun Unit!5185 () Unit!5183)

(assert (=> b!168426 (= e!110724 Unit!5185)))

(declare-fun lt!84218 () Unit!5183)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!124 (array!6815 array!6817 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 64) Int) Unit!5183)

(assert (=> b!168426 (= lt!84218 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!124 (_keys!5307 thiss!1248) (_values!3465 thiss!1248) (mask!8247 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) key!828 (defaultEntry!3482 thiss!1248)))))

(assert (=> b!168426 false))

(declare-fun mapNonEmpty!6507 () Bool)

(declare-fun mapRes!6507 () Bool)

(declare-fun tp!14772 () Bool)

(declare-fun e!110728 () Bool)

(assert (=> mapNonEmpty!6507 (= mapRes!6507 (and tp!14772 e!110728))))

(declare-fun mapValue!6507 () ValueCell!1586)

(declare-fun mapKey!6507 () (_ BitVec 32))

(declare-fun mapRest!6507 () (Array (_ BitVec 32) ValueCell!1586))

(assert (=> mapNonEmpty!6507 (= (arr!3244 (_values!3465 thiss!1248)) (store mapRest!6507 mapKey!6507 mapValue!6507))))

(declare-fun res!80172 () Bool)

(declare-fun e!110725 () Bool)

(assert (=> start!16752 (=> (not res!80172) (not e!110725))))

(declare-fun valid!901 (LongMapFixedSize!2080) Bool)

(assert (=> start!16752 (= res!80172 (valid!901 thiss!1248))))

(assert (=> start!16752 e!110725))

(assert (=> start!16752 e!110727))

(assert (=> start!16752 true))

(assert (=> start!16752 tp_is_empty!3859))

(declare-fun b!168427 () Bool)

(declare-fun e!110720 () Bool)

(assert (=> b!168427 (= e!110722 (and e!110720 mapRes!6507))))

(declare-fun condMapEmpty!6507 () Bool)

(declare-fun mapDefault!6507 () ValueCell!1586)

