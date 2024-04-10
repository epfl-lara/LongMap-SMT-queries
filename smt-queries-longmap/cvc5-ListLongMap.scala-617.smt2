; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16050 () Bool)

(assert start!16050)

(declare-fun b!159231 () Bool)

(declare-fun b_free!3511 () Bool)

(declare-fun b_next!3511 () Bool)

(assert (=> b!159231 (= b_free!3511 (not b_next!3511))))

(declare-fun tp!13103 () Bool)

(declare-fun b_and!9925 () Bool)

(assert (=> b!159231 (= tp!13103 b_and!9925)))

(declare-fun tp_is_empty!3313 () Bool)

(declare-fun e!104248 () Bool)

(declare-datatypes ((V!4065 0))(
  ( (V!4066 (val!1701 Int)) )
))
(declare-datatypes ((ValueCell!1313 0))(
  ( (ValueCellFull!1313 (v!3566 V!4065)) (EmptyCell!1313) )
))
(declare-datatypes ((array!5705 0))(
  ( (array!5706 (arr!2697 (Array (_ BitVec 32) (_ BitVec 64))) (size!2981 (_ BitVec 32))) )
))
(declare-datatypes ((array!5707 0))(
  ( (array!5708 (arr!2698 (Array (_ BitVec 32) ValueCell!1313)) (size!2982 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1534 0))(
  ( (LongMapFixedSize!1535 (defaultEntry!3209 Int) (mask!7755 (_ BitVec 32)) (extraKeys!2950 (_ BitVec 32)) (zeroValue!3052 V!4065) (minValue!3052 V!4065) (_size!816 (_ BitVec 32)) (_keys!5010 array!5705) (_values!3192 array!5707) (_vacant!816 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1534)

(declare-fun e!104249 () Bool)

(declare-fun array_inv!1715 (array!5705) Bool)

(declare-fun array_inv!1716 (array!5707) Bool)

(assert (=> b!159231 (= e!104248 (and tp!13103 tp_is_empty!3313 (array_inv!1715 (_keys!5010 thiss!1248)) (array_inv!1716 (_values!3192 thiss!1248)) e!104249))))

(declare-fun b!159232 () Bool)

(declare-fun res!75203 () Bool)

(declare-fun e!104247 () Bool)

(assert (=> b!159232 (=> (not res!75203) (not e!104247))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!308 0))(
  ( (MissingZero!308 (index!3400 (_ BitVec 32))) (Found!308 (index!3401 (_ BitVec 32))) (Intermediate!308 (undefined!1120 Bool) (index!3402 (_ BitVec 32)) (x!17588 (_ BitVec 32))) (Undefined!308) (MissingVacant!308 (index!3403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5705 (_ BitVec 32)) SeekEntryResult!308)

(assert (=> b!159232 (= res!75203 (is-Undefined!308 (seekEntryOrOpen!0 key!828 (_keys!5010 thiss!1248) (mask!7755 thiss!1248))))))

(declare-fun b!159233 () Bool)

(declare-fun e!104245 () Bool)

(assert (=> b!159233 (= e!104245 tp_is_empty!3313)))

(declare-fun b!159234 () Bool)

(assert (=> b!159234 (= e!104247 false)))

(declare-fun lt!81979 () Bool)

(declare-datatypes ((List!1898 0))(
  ( (Nil!1895) (Cons!1894 (h!2507 (_ BitVec 64)) (t!6700 List!1898)) )
))
(declare-fun arrayNoDuplicates!0 (array!5705 (_ BitVec 32) List!1898) Bool)

(assert (=> b!159234 (= lt!81979 (arrayNoDuplicates!0 (_keys!5010 thiss!1248) #b00000000000000000000000000000000 Nil!1895))))

(declare-fun b!159235 () Bool)

(declare-fun res!75198 () Bool)

(assert (=> b!159235 (=> (not res!75198) (not e!104247))))

(declare-datatypes ((tuple2!2880 0))(
  ( (tuple2!2881 (_1!1451 (_ BitVec 64)) (_2!1451 V!4065)) )
))
(declare-datatypes ((List!1899 0))(
  ( (Nil!1896) (Cons!1895 (h!2508 tuple2!2880) (t!6701 List!1899)) )
))
(declare-datatypes ((ListLongMap!1867 0))(
  ( (ListLongMap!1868 (toList!949 List!1899)) )
))
(declare-fun contains!985 (ListLongMap!1867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!613 (array!5705 array!5707 (_ BitVec 32) (_ BitVec 32) V!4065 V!4065 (_ BitVec 32) Int) ListLongMap!1867)

(assert (=> b!159235 (= res!75198 (contains!985 (getCurrentListMap!613 (_keys!5010 thiss!1248) (_values!3192 thiss!1248) (mask!7755 thiss!1248) (extraKeys!2950 thiss!1248) (zeroValue!3052 thiss!1248) (minValue!3052 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3209 thiss!1248)) key!828))))

(declare-fun b!159236 () Bool)

(declare-fun res!75199 () Bool)

(assert (=> b!159236 (=> (not res!75199) (not e!104247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159236 (= res!75199 (validMask!0 (mask!7755 thiss!1248)))))

(declare-fun mapIsEmpty!5657 () Bool)

(declare-fun mapRes!5657 () Bool)

(assert (=> mapIsEmpty!5657 mapRes!5657))

(declare-fun b!159237 () Bool)

(declare-fun res!75201 () Bool)

(assert (=> b!159237 (=> (not res!75201) (not e!104247))))

(assert (=> b!159237 (= res!75201 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159238 () Bool)

(declare-fun res!75200 () Bool)

(assert (=> b!159238 (=> (not res!75200) (not e!104247))))

(assert (=> b!159238 (= res!75200 (and (= (size!2982 (_values!3192 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7755 thiss!1248))) (= (size!2981 (_keys!5010 thiss!1248)) (size!2982 (_values!3192 thiss!1248))) (bvsge (mask!7755 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2950 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2950 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159239 () Bool)

(declare-fun e!104250 () Bool)

(assert (=> b!159239 (= e!104249 (and e!104250 mapRes!5657))))

(declare-fun condMapEmpty!5657 () Bool)

(declare-fun mapDefault!5657 () ValueCell!1313)

