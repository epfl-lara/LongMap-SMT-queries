; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21708 () Bool)

(assert start!21708)

(declare-fun b!218159 () Bool)

(declare-fun b_free!5857 () Bool)

(declare-fun b_next!5857 () Bool)

(assert (=> b!218159 (= b_free!5857 (not b_next!5857))))

(declare-fun tp!20705 () Bool)

(declare-fun b_and!12747 () Bool)

(assert (=> b!218159 (= tp!20705 b_and!12747)))

(declare-fun b!218152 () Bool)

(declare-fun res!106927 () Bool)

(declare-fun e!141912 () Bool)

(assert (=> b!218152 (=> (not res!106927) (not e!141912))))

(declare-datatypes ((V!7273 0))(
  ( (V!7274 (val!2904 Int)) )
))
(declare-datatypes ((ValueCell!2516 0))(
  ( (ValueCellFull!2516 (v!4922 V!7273)) (EmptyCell!2516) )
))
(declare-datatypes ((array!10677 0))(
  ( (array!10678 (arr!5060 (Array (_ BitVec 32) ValueCell!2516)) (size!5392 (_ BitVec 32))) )
))
(declare-datatypes ((array!10679 0))(
  ( (array!10680 (arr!5061 (Array (_ BitVec 32) (_ BitVec 64))) (size!5393 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2932 0))(
  ( (LongMapFixedSize!2933 (defaultEntry!4116 Int) (mask!9887 (_ BitVec 32)) (extraKeys!3853 (_ BitVec 32)) (zeroValue!3957 V!7273) (minValue!3957 V!7273) (_size!1515 (_ BitVec 32)) (_keys!6165 array!10679) (_values!4099 array!10677) (_vacant!1515 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2932)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218152 (= res!106927 (validMask!0 (mask!9887 thiss!1504)))))

(declare-fun res!106926 () Bool)

(declare-fun e!141907 () Bool)

(assert (=> start!21708 (=> (not res!106926) (not e!141907))))

(declare-fun valid!1188 (LongMapFixedSize!2932) Bool)

(assert (=> start!21708 (= res!106926 (valid!1188 thiss!1504))))

(assert (=> start!21708 e!141907))

(declare-fun e!141910 () Bool)

(assert (=> start!21708 e!141910))

(assert (=> start!21708 true))

(declare-fun b!218153 () Bool)

(declare-fun e!141913 () Bool)

(declare-fun tp_is_empty!5719 () Bool)

(assert (=> b!218153 (= e!141913 tp_is_empty!5719)))

(declare-fun b!218154 () Bool)

(declare-fun res!106924 () Bool)

(assert (=> b!218154 (=> (not res!106924) (not e!141907))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218154 (= res!106924 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218155 () Bool)

(declare-fun e!141908 () Bool)

(assert (=> b!218155 (= e!141908 tp_is_empty!5719)))

(declare-fun b!218156 () Bool)

(assert (=> b!218156 (= e!141912 false)))

(declare-fun lt!111477 () Bool)

(declare-datatypes ((List!3220 0))(
  ( (Nil!3217) (Cons!3216 (h!3863 (_ BitVec 64)) (t!8175 List!3220)) )
))
(declare-fun arrayNoDuplicates!0 (array!10679 (_ BitVec 32) List!3220) Bool)

(assert (=> b!218156 (= lt!111477 (arrayNoDuplicates!0 (_keys!6165 thiss!1504) #b00000000000000000000000000000000 Nil!3217))))

(declare-fun b!218157 () Bool)

(assert (=> b!218157 (= e!141907 e!141912)))

(declare-fun res!106925 () Bool)

(assert (=> b!218157 (=> (not res!106925) (not e!141912))))

(declare-datatypes ((SeekEntryResult!781 0))(
  ( (MissingZero!781 (index!5294 (_ BitVec 32))) (Found!781 (index!5295 (_ BitVec 32))) (Intermediate!781 (undefined!1593 Bool) (index!5296 (_ BitVec 32)) (x!22813 (_ BitVec 32))) (Undefined!781) (MissingVacant!781 (index!5297 (_ BitVec 32))) )
))
(declare-fun lt!111476 () SeekEntryResult!781)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218157 (= res!106925 (or (= lt!111476 (MissingZero!781 index!297)) (= lt!111476 (MissingVacant!781 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10679 (_ BitVec 32)) SeekEntryResult!781)

(assert (=> b!218157 (= lt!111476 (seekEntryOrOpen!0 key!932 (_keys!6165 thiss!1504) (mask!9887 thiss!1504)))))

(declare-fun mapIsEmpty!9741 () Bool)

(declare-fun mapRes!9741 () Bool)

(assert (=> mapIsEmpty!9741 mapRes!9741))

(declare-fun b!218158 () Bool)

(declare-fun res!106929 () Bool)

(assert (=> b!218158 (=> (not res!106929) (not e!141912))))

(declare-datatypes ((tuple2!4314 0))(
  ( (tuple2!4315 (_1!2168 (_ BitVec 64)) (_2!2168 V!7273)) )
))
(declare-datatypes ((List!3221 0))(
  ( (Nil!3218) (Cons!3217 (h!3864 tuple2!4314) (t!8176 List!3221)) )
))
(declare-datatypes ((ListLongMap!3227 0))(
  ( (ListLongMap!3228 (toList!1629 List!3221)) )
))
(declare-fun contains!1470 (ListLongMap!3227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1157 (array!10679 array!10677 (_ BitVec 32) (_ BitVec 32) V!7273 V!7273 (_ BitVec 32) Int) ListLongMap!3227)

(assert (=> b!218158 (= res!106929 (not (contains!1470 (getCurrentListMap!1157 (_keys!6165 thiss!1504) (_values!4099 thiss!1504) (mask!9887 thiss!1504) (extraKeys!3853 thiss!1504) (zeroValue!3957 thiss!1504) (minValue!3957 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4116 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!9741 () Bool)

(declare-fun tp!20706 () Bool)

(assert (=> mapNonEmpty!9741 (= mapRes!9741 (and tp!20706 e!141908))))

(declare-fun mapRest!9741 () (Array (_ BitVec 32) ValueCell!2516))

(declare-fun mapKey!9741 () (_ BitVec 32))

(declare-fun mapValue!9741 () ValueCell!2516)

(assert (=> mapNonEmpty!9741 (= (arr!5060 (_values!4099 thiss!1504)) (store mapRest!9741 mapKey!9741 mapValue!9741))))

(declare-fun e!141911 () Bool)

(declare-fun array_inv!3353 (array!10679) Bool)

(declare-fun array_inv!3354 (array!10677) Bool)

(assert (=> b!218159 (= e!141910 (and tp!20705 tp_is_empty!5719 (array_inv!3353 (_keys!6165 thiss!1504)) (array_inv!3354 (_values!4099 thiss!1504)) e!141911))))

(declare-fun b!218160 () Bool)

(declare-fun res!106923 () Bool)

(assert (=> b!218160 (=> (not res!106923) (not e!141912))))

(assert (=> b!218160 (= res!106923 (and (= (size!5392 (_values!4099 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9887 thiss!1504))) (= (size!5393 (_keys!6165 thiss!1504)) (size!5392 (_values!4099 thiss!1504))) (bvsge (mask!9887 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3853 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3853 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!218161 () Bool)

(declare-fun res!106928 () Bool)

(assert (=> b!218161 (=> (not res!106928) (not e!141912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10679 (_ BitVec 32)) Bool)

(assert (=> b!218161 (= res!106928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6165 thiss!1504) (mask!9887 thiss!1504)))))

(declare-fun b!218162 () Bool)

(assert (=> b!218162 (= e!141911 (and e!141913 mapRes!9741))))

(declare-fun condMapEmpty!9741 () Bool)

(declare-fun mapDefault!9741 () ValueCell!2516)

