; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21702 () Bool)

(assert start!21702)

(declare-fun b!218055 () Bool)

(declare-fun b_free!5851 () Bool)

(declare-fun b_next!5851 () Bool)

(assert (=> b!218055 (= b_free!5851 (not b_next!5851))))

(declare-fun tp!20688 () Bool)

(declare-fun b_and!12741 () Bool)

(assert (=> b!218055 (= tp!20688 b_and!12741)))

(declare-fun b!218053 () Bool)

(declare-fun res!106861 () Bool)

(declare-fun e!141844 () Bool)

(assert (=> b!218053 (=> (not res!106861) (not e!141844))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218053 (= res!106861 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218054 () Bool)

(declare-fun res!106860 () Bool)

(declare-fun e!141850 () Bool)

(assert (=> b!218054 (=> (not res!106860) (not e!141850))))

(declare-datatypes ((V!7265 0))(
  ( (V!7266 (val!2901 Int)) )
))
(declare-datatypes ((ValueCell!2513 0))(
  ( (ValueCellFull!2513 (v!4919 V!7265)) (EmptyCell!2513) )
))
(declare-datatypes ((array!10665 0))(
  ( (array!10666 (arr!5054 (Array (_ BitVec 32) ValueCell!2513)) (size!5386 (_ BitVec 32))) )
))
(declare-datatypes ((array!10667 0))(
  ( (array!10668 (arr!5055 (Array (_ BitVec 32) (_ BitVec 64))) (size!5387 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2926 0))(
  ( (LongMapFixedSize!2927 (defaultEntry!4113 Int) (mask!9882 (_ BitVec 32)) (extraKeys!3850 (_ BitVec 32)) (zeroValue!3954 V!7265) (minValue!3954 V!7265) (_size!1512 (_ BitVec 32)) (_keys!6162 array!10667) (_values!4096 array!10665) (_vacant!1512 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2926)

(assert (=> b!218054 (= res!106860 (and (= (size!5386 (_values!4096 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9882 thiss!1504))) (= (size!5387 (_keys!6162 thiss!1504)) (size!5386 (_values!4096 thiss!1504))) (bvsge (mask!9882 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3850 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3850 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!5713 () Bool)

(declare-fun e!141847 () Bool)

(declare-fun e!141848 () Bool)

(declare-fun array_inv!3347 (array!10667) Bool)

(declare-fun array_inv!3348 (array!10665) Bool)

(assert (=> b!218055 (= e!141848 (and tp!20688 tp_is_empty!5713 (array_inv!3347 (_keys!6162 thiss!1504)) (array_inv!3348 (_values!4096 thiss!1504)) e!141847))))

(declare-fun b!218056 () Bool)

(assert (=> b!218056 (= e!141850 false)))

(declare-fun lt!111459 () Bool)

(declare-datatypes ((List!3216 0))(
  ( (Nil!3213) (Cons!3212 (h!3859 (_ BitVec 64)) (t!8171 List!3216)) )
))
(declare-fun arrayNoDuplicates!0 (array!10667 (_ BitVec 32) List!3216) Bool)

(assert (=> b!218056 (= lt!111459 (arrayNoDuplicates!0 (_keys!6162 thiss!1504) #b00000000000000000000000000000000 Nil!3213))))

(declare-fun b!218057 () Bool)

(assert (=> b!218057 (= e!141844 e!141850)))

(declare-fun res!106866 () Bool)

(assert (=> b!218057 (=> (not res!106866) (not e!141850))))

(declare-datatypes ((SeekEntryResult!779 0))(
  ( (MissingZero!779 (index!5286 (_ BitVec 32))) (Found!779 (index!5287 (_ BitVec 32))) (Intermediate!779 (undefined!1591 Bool) (index!5288 (_ BitVec 32)) (x!22803 (_ BitVec 32))) (Undefined!779) (MissingVacant!779 (index!5289 (_ BitVec 32))) )
))
(declare-fun lt!111458 () SeekEntryResult!779)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218057 (= res!106866 (or (= lt!111458 (MissingZero!779 index!297)) (= lt!111458 (MissingVacant!779 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10667 (_ BitVec 32)) SeekEntryResult!779)

(assert (=> b!218057 (= lt!111458 (seekEntryOrOpen!0 key!932 (_keys!6162 thiss!1504) (mask!9882 thiss!1504)))))

(declare-fun b!218058 () Bool)

(declare-fun e!141845 () Bool)

(assert (=> b!218058 (= e!141845 tp_is_empty!5713)))

(declare-fun b!218059 () Bool)

(declare-fun res!106862 () Bool)

(assert (=> b!218059 (=> (not res!106862) (not e!141850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10667 (_ BitVec 32)) Bool)

(assert (=> b!218059 (= res!106862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6162 thiss!1504) (mask!9882 thiss!1504)))))

(declare-fun res!106863 () Bool)

(assert (=> start!21702 (=> (not res!106863) (not e!141844))))

(declare-fun valid!1186 (LongMapFixedSize!2926) Bool)

(assert (=> start!21702 (= res!106863 (valid!1186 thiss!1504))))

(assert (=> start!21702 e!141844))

(assert (=> start!21702 e!141848))

(assert (=> start!21702 true))

(declare-fun b!218060 () Bool)

(declare-fun res!106864 () Bool)

(assert (=> b!218060 (=> (not res!106864) (not e!141850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218060 (= res!106864 (validMask!0 (mask!9882 thiss!1504)))))

(declare-fun b!218061 () Bool)

(declare-fun e!141846 () Bool)

(assert (=> b!218061 (= e!141846 tp_is_empty!5713)))

(declare-fun b!218062 () Bool)

(declare-fun res!106865 () Bool)

(assert (=> b!218062 (=> (not res!106865) (not e!141850))))

(declare-datatypes ((tuple2!4310 0))(
  ( (tuple2!4311 (_1!2166 (_ BitVec 64)) (_2!2166 V!7265)) )
))
(declare-datatypes ((List!3217 0))(
  ( (Nil!3214) (Cons!3213 (h!3860 tuple2!4310) (t!8172 List!3217)) )
))
(declare-datatypes ((ListLongMap!3223 0))(
  ( (ListLongMap!3224 (toList!1627 List!3217)) )
))
(declare-fun contains!1468 (ListLongMap!3223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1155 (array!10667 array!10665 (_ BitVec 32) (_ BitVec 32) V!7265 V!7265 (_ BitVec 32) Int) ListLongMap!3223)

(assert (=> b!218062 (= res!106865 (not (contains!1468 (getCurrentListMap!1155 (_keys!6162 thiss!1504) (_values!4096 thiss!1504) (mask!9882 thiss!1504) (extraKeys!3850 thiss!1504) (zeroValue!3954 thiss!1504) (minValue!3954 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4113 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!9732 () Bool)

(declare-fun mapRes!9732 () Bool)

(declare-fun tp!20687 () Bool)

(assert (=> mapNonEmpty!9732 (= mapRes!9732 (and tp!20687 e!141845))))

(declare-fun mapRest!9732 () (Array (_ BitVec 32) ValueCell!2513))

(declare-fun mapValue!9732 () ValueCell!2513)

(declare-fun mapKey!9732 () (_ BitVec 32))

(assert (=> mapNonEmpty!9732 (= (arr!5054 (_values!4096 thiss!1504)) (store mapRest!9732 mapKey!9732 mapValue!9732))))

(declare-fun mapIsEmpty!9732 () Bool)

(assert (=> mapIsEmpty!9732 mapRes!9732))

(declare-fun b!218063 () Bool)

(assert (=> b!218063 (= e!141847 (and e!141846 mapRes!9732))))

(declare-fun condMapEmpty!9732 () Bool)

(declare-fun mapDefault!9732 () ValueCell!2513)

