; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21718 () Bool)

(assert start!21718)

(declare-fun b!218326 () Bool)

(declare-fun b_free!5867 () Bool)

(declare-fun b_next!5867 () Bool)

(assert (=> b!218326 (= b_free!5867 (not b_next!5867))))

(declare-fun tp!20736 () Bool)

(declare-fun b_and!12757 () Bool)

(assert (=> b!218326 (= tp!20736 b_and!12757)))

(declare-fun mapNonEmpty!9756 () Bool)

(declare-fun mapRes!9756 () Bool)

(declare-fun tp!20735 () Bool)

(declare-fun e!142014 () Bool)

(assert (=> mapNonEmpty!9756 (= mapRes!9756 (and tp!20735 e!142014))))

(declare-fun mapKey!9756 () (_ BitVec 32))

(declare-datatypes ((V!7285 0))(
  ( (V!7286 (val!2909 Int)) )
))
(declare-datatypes ((ValueCell!2521 0))(
  ( (ValueCellFull!2521 (v!4927 V!7285)) (EmptyCell!2521) )
))
(declare-fun mapRest!9756 () (Array (_ BitVec 32) ValueCell!2521))

(declare-datatypes ((array!10697 0))(
  ( (array!10698 (arr!5070 (Array (_ BitVec 32) ValueCell!2521)) (size!5402 (_ BitVec 32))) )
))
(declare-datatypes ((array!10699 0))(
  ( (array!10700 (arr!5071 (Array (_ BitVec 32) (_ BitVec 64))) (size!5403 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2942 0))(
  ( (LongMapFixedSize!2943 (defaultEntry!4121 Int) (mask!9894 (_ BitVec 32)) (extraKeys!3858 (_ BitVec 32)) (zeroValue!3962 V!7285) (minValue!3962 V!7285) (_size!1520 (_ BitVec 32)) (_keys!6170 array!10699) (_values!4104 array!10697) (_vacant!1520 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2942)

(declare-fun mapValue!9756 () ValueCell!2521)

(assert (=> mapNonEmpty!9756 (= (arr!5070 (_values!4104 thiss!1504)) (store mapRest!9756 mapKey!9756 mapValue!9756))))

(declare-fun b!218317 () Bool)

(declare-fun tp_is_empty!5729 () Bool)

(assert (=> b!218317 (= e!142014 tp_is_empty!5729)))

(declare-fun b!218318 () Bool)

(declare-fun e!142012 () Bool)

(assert (=> b!218318 (= e!142012 false)))

(declare-fun lt!111506 () Bool)

(declare-datatypes ((List!3229 0))(
  ( (Nil!3226) (Cons!3225 (h!3872 (_ BitVec 64)) (t!8184 List!3229)) )
))
(declare-fun arrayNoDuplicates!0 (array!10699 (_ BitVec 32) List!3229) Bool)

(assert (=> b!218318 (= lt!111506 (arrayNoDuplicates!0 (_keys!6170 thiss!1504) #b00000000000000000000000000000000 Nil!3226))))

(declare-fun res!107032 () Bool)

(declare-fun e!142013 () Bool)

(assert (=> start!21718 (=> (not res!107032) (not e!142013))))

(declare-fun valid!1193 (LongMapFixedSize!2942) Bool)

(assert (=> start!21718 (= res!107032 (valid!1193 thiss!1504))))

(assert (=> start!21718 e!142013))

(declare-fun e!142017 () Bool)

(assert (=> start!21718 e!142017))

(assert (=> start!21718 true))

(declare-fun b!218319 () Bool)

(declare-fun res!107033 () Bool)

(assert (=> b!218319 (=> (not res!107033) (not e!142012))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4324 0))(
  ( (tuple2!4325 (_1!2173 (_ BitVec 64)) (_2!2173 V!7285)) )
))
(declare-datatypes ((List!3230 0))(
  ( (Nil!3227) (Cons!3226 (h!3873 tuple2!4324) (t!8185 List!3230)) )
))
(declare-datatypes ((ListLongMap!3237 0))(
  ( (ListLongMap!3238 (toList!1634 List!3230)) )
))
(declare-fun contains!1475 (ListLongMap!3237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1162 (array!10699 array!10697 (_ BitVec 32) (_ BitVec 32) V!7285 V!7285 (_ BitVec 32) Int) ListLongMap!3237)

(assert (=> b!218319 (= res!107033 (not (contains!1475 (getCurrentListMap!1162 (_keys!6170 thiss!1504) (_values!4104 thiss!1504) (mask!9894 thiss!1504) (extraKeys!3858 thiss!1504) (zeroValue!3962 thiss!1504) (minValue!3962 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4121 thiss!1504)) key!932)))))

(declare-fun b!218320 () Bool)

(assert (=> b!218320 (= e!142013 e!142012)))

(declare-fun res!107029 () Bool)

(assert (=> b!218320 (=> (not res!107029) (not e!142012))))

(declare-datatypes ((SeekEntryResult!786 0))(
  ( (MissingZero!786 (index!5314 (_ BitVec 32))) (Found!786 (index!5315 (_ BitVec 32))) (Intermediate!786 (undefined!1598 Bool) (index!5316 (_ BitVec 32)) (x!22826 (_ BitVec 32))) (Undefined!786) (MissingVacant!786 (index!5317 (_ BitVec 32))) )
))
(declare-fun lt!111507 () SeekEntryResult!786)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218320 (= res!107029 (or (= lt!111507 (MissingZero!786 index!297)) (= lt!111507 (MissingVacant!786 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10699 (_ BitVec 32)) SeekEntryResult!786)

(assert (=> b!218320 (= lt!111507 (seekEntryOrOpen!0 key!932 (_keys!6170 thiss!1504) (mask!9894 thiss!1504)))))

(declare-fun b!218321 () Bool)

(declare-fun e!142016 () Bool)

(declare-fun e!142015 () Bool)

(assert (=> b!218321 (= e!142016 (and e!142015 mapRes!9756))))

(declare-fun condMapEmpty!9756 () Bool)

(declare-fun mapDefault!9756 () ValueCell!2521)

