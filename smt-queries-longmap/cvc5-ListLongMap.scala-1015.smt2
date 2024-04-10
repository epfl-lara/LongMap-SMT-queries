; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21690 () Bool)

(assert start!21690)

(declare-fun b!217857 () Bool)

(declare-fun b_free!5839 () Bool)

(declare-fun b_next!5839 () Bool)

(assert (=> b!217857 (= b_free!5839 (not b_next!5839))))

(declare-fun tp!20652 () Bool)

(declare-fun b_and!12729 () Bool)

(assert (=> b!217857 (= tp!20652 b_and!12729)))

(declare-fun res!106739 () Bool)

(declare-fun e!141720 () Bool)

(assert (=> start!21690 (=> (not res!106739) (not e!141720))))

(declare-datatypes ((V!7249 0))(
  ( (V!7250 (val!2895 Int)) )
))
(declare-datatypes ((ValueCell!2507 0))(
  ( (ValueCellFull!2507 (v!4913 V!7249)) (EmptyCell!2507) )
))
(declare-datatypes ((array!10641 0))(
  ( (array!10642 (arr!5042 (Array (_ BitVec 32) ValueCell!2507)) (size!5374 (_ BitVec 32))) )
))
(declare-datatypes ((array!10643 0))(
  ( (array!10644 (arr!5043 (Array (_ BitVec 32) (_ BitVec 64))) (size!5375 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2914 0))(
  ( (LongMapFixedSize!2915 (defaultEntry!4107 Int) (mask!9872 (_ BitVec 32)) (extraKeys!3844 (_ BitVec 32)) (zeroValue!3948 V!7249) (minValue!3948 V!7249) (_size!1506 (_ BitVec 32)) (_keys!6156 array!10643) (_values!4090 array!10641) (_vacant!1506 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2914)

(declare-fun valid!1182 (LongMapFixedSize!2914) Bool)

(assert (=> start!21690 (= res!106739 (valid!1182 thiss!1504))))

(assert (=> start!21690 e!141720))

(declare-fun e!141724 () Bool)

(assert (=> start!21690 e!141724))

(assert (=> start!21690 true))

(declare-fun b!217855 () Bool)

(declare-fun res!106734 () Bool)

(assert (=> b!217855 (=> (not res!106734) (not e!141720))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217855 (= res!106734 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217856 () Bool)

(declare-fun res!106735 () Bool)

(declare-fun e!141718 () Bool)

(assert (=> b!217856 (=> (not res!106735) (not e!141718))))

(assert (=> b!217856 (= res!106735 (and (= (size!5374 (_values!4090 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9872 thiss!1504))) (= (size!5375 (_keys!6156 thiss!1504)) (size!5374 (_values!4090 thiss!1504))) (bvsge (mask!9872 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3844 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3844 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!5701 () Bool)

(declare-fun e!141722 () Bool)

(declare-fun array_inv!3339 (array!10643) Bool)

(declare-fun array_inv!3340 (array!10641) Bool)

(assert (=> b!217857 (= e!141724 (and tp!20652 tp_is_empty!5701 (array_inv!3339 (_keys!6156 thiss!1504)) (array_inv!3340 (_values!4090 thiss!1504)) e!141722))))

(declare-fun b!217858 () Bool)

(declare-fun res!106740 () Bool)

(assert (=> b!217858 (=> (not res!106740) (not e!141718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10643 (_ BitVec 32)) Bool)

(assert (=> b!217858 (= res!106740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6156 thiss!1504) (mask!9872 thiss!1504)))))

(declare-fun b!217859 () Bool)

(assert (=> b!217859 (= e!141718 false)))

(declare-fun lt!111423 () Bool)

(declare-datatypes ((List!3207 0))(
  ( (Nil!3204) (Cons!3203 (h!3850 (_ BitVec 64)) (t!8162 List!3207)) )
))
(declare-fun arrayNoDuplicates!0 (array!10643 (_ BitVec 32) List!3207) Bool)

(assert (=> b!217859 (= lt!111423 (arrayNoDuplicates!0 (_keys!6156 thiss!1504) #b00000000000000000000000000000000 Nil!3204))))

(declare-fun mapIsEmpty!9714 () Bool)

(declare-fun mapRes!9714 () Bool)

(assert (=> mapIsEmpty!9714 mapRes!9714))

(declare-fun b!217860 () Bool)

(declare-fun e!141721 () Bool)

(assert (=> b!217860 (= e!141721 tp_is_empty!5701)))

(declare-fun b!217861 () Bool)

(assert (=> b!217861 (= e!141720 e!141718)))

(declare-fun res!106738 () Bool)

(assert (=> b!217861 (=> (not res!106738) (not e!141718))))

(declare-datatypes ((SeekEntryResult!775 0))(
  ( (MissingZero!775 (index!5270 (_ BitVec 32))) (Found!775 (index!5271 (_ BitVec 32))) (Intermediate!775 (undefined!1587 Bool) (index!5272 (_ BitVec 32)) (x!22783 (_ BitVec 32))) (Undefined!775) (MissingVacant!775 (index!5273 (_ BitVec 32))) )
))
(declare-fun lt!111422 () SeekEntryResult!775)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217861 (= res!106738 (or (= lt!111422 (MissingZero!775 index!297)) (= lt!111422 (MissingVacant!775 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10643 (_ BitVec 32)) SeekEntryResult!775)

(assert (=> b!217861 (= lt!111422 (seekEntryOrOpen!0 key!932 (_keys!6156 thiss!1504) (mask!9872 thiss!1504)))))

(declare-fun b!217862 () Bool)

(declare-fun res!106736 () Bool)

(assert (=> b!217862 (=> (not res!106736) (not e!141718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217862 (= res!106736 (validMask!0 (mask!9872 thiss!1504)))))

(declare-fun b!217863 () Bool)

(declare-fun e!141723 () Bool)

(assert (=> b!217863 (= e!141723 tp_is_empty!5701)))

(declare-fun mapNonEmpty!9714 () Bool)

(declare-fun tp!20651 () Bool)

(assert (=> mapNonEmpty!9714 (= mapRes!9714 (and tp!20651 e!141721))))

(declare-fun mapRest!9714 () (Array (_ BitVec 32) ValueCell!2507))

(declare-fun mapKey!9714 () (_ BitVec 32))

(declare-fun mapValue!9714 () ValueCell!2507)

(assert (=> mapNonEmpty!9714 (= (arr!5042 (_values!4090 thiss!1504)) (store mapRest!9714 mapKey!9714 mapValue!9714))))

(declare-fun b!217864 () Bool)

(declare-fun res!106737 () Bool)

(assert (=> b!217864 (=> (not res!106737) (not e!141718))))

(declare-datatypes ((tuple2!4302 0))(
  ( (tuple2!4303 (_1!2162 (_ BitVec 64)) (_2!2162 V!7249)) )
))
(declare-datatypes ((List!3208 0))(
  ( (Nil!3205) (Cons!3204 (h!3851 tuple2!4302) (t!8163 List!3208)) )
))
(declare-datatypes ((ListLongMap!3215 0))(
  ( (ListLongMap!3216 (toList!1623 List!3208)) )
))
(declare-fun contains!1464 (ListLongMap!3215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1151 (array!10643 array!10641 (_ BitVec 32) (_ BitVec 32) V!7249 V!7249 (_ BitVec 32) Int) ListLongMap!3215)

(assert (=> b!217864 (= res!106737 (not (contains!1464 (getCurrentListMap!1151 (_keys!6156 thiss!1504) (_values!4090 thiss!1504) (mask!9872 thiss!1504) (extraKeys!3844 thiss!1504) (zeroValue!3948 thiss!1504) (minValue!3948 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4107 thiss!1504)) key!932)))))

(declare-fun b!217865 () Bool)

(assert (=> b!217865 (= e!141722 (and e!141723 mapRes!9714))))

(declare-fun condMapEmpty!9714 () Bool)

(declare-fun mapDefault!9714 () ValueCell!2507)

