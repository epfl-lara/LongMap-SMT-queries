; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21688 () Bool)

(assert start!21688)

(declare-fun b!217827 () Bool)

(declare-fun b_free!5837 () Bool)

(declare-fun b_next!5837 () Bool)

(assert (=> b!217827 (= b_free!5837 (not b_next!5837))))

(declare-fun tp!20645 () Bool)

(declare-fun b_and!12727 () Bool)

(assert (=> b!217827 (= tp!20645 b_and!12727)))

(declare-fun b!217822 () Bool)

(declare-fun e!141698 () Bool)

(declare-fun e!141699 () Bool)

(assert (=> b!217822 (= e!141698 e!141699)))

(declare-fun res!106719 () Bool)

(assert (=> b!217822 (=> (not res!106719) (not e!141699))))

(declare-datatypes ((SeekEntryResult!774 0))(
  ( (MissingZero!774 (index!5266 (_ BitVec 32))) (Found!774 (index!5267 (_ BitVec 32))) (Intermediate!774 (undefined!1586 Bool) (index!5268 (_ BitVec 32)) (x!22774 (_ BitVec 32))) (Undefined!774) (MissingVacant!774 (index!5269 (_ BitVec 32))) )
))
(declare-fun lt!111417 () SeekEntryResult!774)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217822 (= res!106719 (or (= lt!111417 (MissingZero!774 index!297)) (= lt!111417 (MissingVacant!774 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7245 0))(
  ( (V!7246 (val!2894 Int)) )
))
(declare-datatypes ((ValueCell!2506 0))(
  ( (ValueCellFull!2506 (v!4912 V!7245)) (EmptyCell!2506) )
))
(declare-datatypes ((array!10637 0))(
  ( (array!10638 (arr!5040 (Array (_ BitVec 32) ValueCell!2506)) (size!5372 (_ BitVec 32))) )
))
(declare-datatypes ((array!10639 0))(
  ( (array!10640 (arr!5041 (Array (_ BitVec 32) (_ BitVec 64))) (size!5373 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2912 0))(
  ( (LongMapFixedSize!2913 (defaultEntry!4106 Int) (mask!9869 (_ BitVec 32)) (extraKeys!3843 (_ BitVec 32)) (zeroValue!3947 V!7245) (minValue!3947 V!7245) (_size!1505 (_ BitVec 32)) (_keys!6155 array!10639) (_values!4089 array!10637) (_vacant!1505 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2912)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10639 (_ BitVec 32)) SeekEntryResult!774)

(assert (=> b!217822 (= lt!111417 (seekEntryOrOpen!0 key!932 (_keys!6155 thiss!1504) (mask!9869 thiss!1504)))))

(declare-fun b!217823 () Bool)

(declare-fun res!106713 () Bool)

(assert (=> b!217823 (=> (not res!106713) (not e!141698))))

(assert (=> b!217823 (= res!106713 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217824 () Bool)

(declare-fun res!106718 () Bool)

(assert (=> b!217824 (=> (not res!106718) (not e!141699))))

(declare-datatypes ((tuple2!4300 0))(
  ( (tuple2!4301 (_1!2161 (_ BitVec 64)) (_2!2161 V!7245)) )
))
(declare-datatypes ((List!3205 0))(
  ( (Nil!3202) (Cons!3201 (h!3848 tuple2!4300) (t!8160 List!3205)) )
))
(declare-datatypes ((ListLongMap!3213 0))(
  ( (ListLongMap!3214 (toList!1622 List!3205)) )
))
(declare-fun contains!1463 (ListLongMap!3213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1150 (array!10639 array!10637 (_ BitVec 32) (_ BitVec 32) V!7245 V!7245 (_ BitVec 32) Int) ListLongMap!3213)

(assert (=> b!217824 (= res!106718 (not (contains!1463 (getCurrentListMap!1150 (_keys!6155 thiss!1504) (_values!4089 thiss!1504) (mask!9869 thiss!1504) (extraKeys!3843 thiss!1504) (zeroValue!3947 thiss!1504) (minValue!3947 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4106 thiss!1504)) key!932)))))

(declare-fun b!217825 () Bool)

(declare-fun res!106714 () Bool)

(assert (=> b!217825 (=> (not res!106714) (not e!141699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217825 (= res!106714 (validMask!0 (mask!9869 thiss!1504)))))

(declare-fun tp_is_empty!5699 () Bool)

(declare-fun e!141700 () Bool)

(declare-fun e!141697 () Bool)

(declare-fun array_inv!3337 (array!10639) Bool)

(declare-fun array_inv!3338 (array!10637) Bool)

(assert (=> b!217827 (= e!141697 (and tp!20645 tp_is_empty!5699 (array_inv!3337 (_keys!6155 thiss!1504)) (array_inv!3338 (_values!4089 thiss!1504)) e!141700))))

(declare-fun b!217828 () Bool)

(declare-fun e!141702 () Bool)

(assert (=> b!217828 (= e!141702 tp_is_empty!5699)))

(declare-fun b!217829 () Bool)

(declare-fun res!106717 () Bool)

(assert (=> b!217829 (=> (not res!106717) (not e!141699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10639 (_ BitVec 32)) Bool)

(assert (=> b!217829 (= res!106717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6155 thiss!1504) (mask!9869 thiss!1504)))))

(declare-fun b!217830 () Bool)

(declare-fun e!141701 () Bool)

(assert (=> b!217830 (= e!141701 tp_is_empty!5699)))

(declare-fun mapIsEmpty!9711 () Bool)

(declare-fun mapRes!9711 () Bool)

(assert (=> mapIsEmpty!9711 mapRes!9711))

(declare-fun b!217831 () Bool)

(declare-fun res!106716 () Bool)

(assert (=> b!217831 (=> (not res!106716) (not e!141699))))

(assert (=> b!217831 (= res!106716 (and (= (size!5372 (_values!4089 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9869 thiss!1504))) (= (size!5373 (_keys!6155 thiss!1504)) (size!5372 (_values!4089 thiss!1504))) (bvsge (mask!9869 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3843 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3843 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217826 () Bool)

(assert (=> b!217826 (= e!141699 false)))

(declare-fun lt!111416 () Bool)

(declare-datatypes ((List!3206 0))(
  ( (Nil!3203) (Cons!3202 (h!3849 (_ BitVec 64)) (t!8161 List!3206)) )
))
(declare-fun arrayNoDuplicates!0 (array!10639 (_ BitVec 32) List!3206) Bool)

(assert (=> b!217826 (= lt!111416 (arrayNoDuplicates!0 (_keys!6155 thiss!1504) #b00000000000000000000000000000000 Nil!3203))))

(declare-fun res!106715 () Bool)

(assert (=> start!21688 (=> (not res!106715) (not e!141698))))

(declare-fun valid!1181 (LongMapFixedSize!2912) Bool)

(assert (=> start!21688 (= res!106715 (valid!1181 thiss!1504))))

(assert (=> start!21688 e!141698))

(assert (=> start!21688 e!141697))

(assert (=> start!21688 true))

(declare-fun mapNonEmpty!9711 () Bool)

(declare-fun tp!20646 () Bool)

(assert (=> mapNonEmpty!9711 (= mapRes!9711 (and tp!20646 e!141702))))

(declare-fun mapRest!9711 () (Array (_ BitVec 32) ValueCell!2506))

(declare-fun mapValue!9711 () ValueCell!2506)

(declare-fun mapKey!9711 () (_ BitVec 32))

(assert (=> mapNonEmpty!9711 (= (arr!5040 (_values!4089 thiss!1504)) (store mapRest!9711 mapKey!9711 mapValue!9711))))

(declare-fun b!217832 () Bool)

(assert (=> b!217832 (= e!141700 (and e!141701 mapRes!9711))))

(declare-fun condMapEmpty!9711 () Bool)

(declare-fun mapDefault!9711 () ValueCell!2506)

