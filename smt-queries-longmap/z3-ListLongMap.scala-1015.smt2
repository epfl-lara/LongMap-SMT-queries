; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21692 () Bool)

(assert start!21692)

(declare-fun b!217895 () Bool)

(declare-fun b_free!5841 () Bool)

(declare-fun b_next!5841 () Bool)

(assert (=> b!217895 (= b_free!5841 (not b_next!5841))))

(declare-fun tp!20658 () Bool)

(declare-fun b_and!12731 () Bool)

(assert (=> b!217895 (= tp!20658 b_and!12731)))

(declare-fun res!106755 () Bool)

(declare-fun e!141742 () Bool)

(assert (=> start!21692 (=> (not res!106755) (not e!141742))))

(declare-datatypes ((V!7251 0))(
  ( (V!7252 (val!2896 Int)) )
))
(declare-datatypes ((ValueCell!2508 0))(
  ( (ValueCellFull!2508 (v!4914 V!7251)) (EmptyCell!2508) )
))
(declare-datatypes ((array!10645 0))(
  ( (array!10646 (arr!5044 (Array (_ BitVec 32) ValueCell!2508)) (size!5376 (_ BitVec 32))) )
))
(declare-datatypes ((array!10647 0))(
  ( (array!10648 (arr!5045 (Array (_ BitVec 32) (_ BitVec 64))) (size!5377 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2916 0))(
  ( (LongMapFixedSize!2917 (defaultEntry!4108 Int) (mask!9873 (_ BitVec 32)) (extraKeys!3845 (_ BitVec 32)) (zeroValue!3949 V!7251) (minValue!3949 V!7251) (_size!1507 (_ BitVec 32)) (_keys!6157 array!10647) (_values!4091 array!10645) (_vacant!1507 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2916)

(declare-fun valid!1183 (LongMapFixedSize!2916) Bool)

(assert (=> start!21692 (= res!106755 (valid!1183 thiss!1504))))

(assert (=> start!21692 e!141742))

(declare-fun e!141739 () Bool)

(assert (=> start!21692 e!141739))

(assert (=> start!21692 true))

(declare-fun b!217888 () Bool)

(declare-fun e!141741 () Bool)

(assert (=> b!217888 (= e!141742 e!141741)))

(declare-fun res!106759 () Bool)

(assert (=> b!217888 (=> (not res!106759) (not e!141741))))

(declare-datatypes ((SeekEntryResult!776 0))(
  ( (MissingZero!776 (index!5274 (_ BitVec 32))) (Found!776 (index!5275 (_ BitVec 32))) (Intermediate!776 (undefined!1588 Bool) (index!5276 (_ BitVec 32)) (x!22784 (_ BitVec 32))) (Undefined!776) (MissingVacant!776 (index!5277 (_ BitVec 32))) )
))
(declare-fun lt!111429 () SeekEntryResult!776)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217888 (= res!106759 (or (= lt!111429 (MissingZero!776 index!297)) (= lt!111429 (MissingVacant!776 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10647 (_ BitVec 32)) SeekEntryResult!776)

(assert (=> b!217888 (= lt!111429 (seekEntryOrOpen!0 key!932 (_keys!6157 thiss!1504) (mask!9873 thiss!1504)))))

(declare-fun b!217889 () Bool)

(declare-fun res!106760 () Bool)

(assert (=> b!217889 (=> (not res!106760) (not e!141741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10647 (_ BitVec 32)) Bool)

(assert (=> b!217889 (= res!106760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6157 thiss!1504) (mask!9873 thiss!1504)))))

(declare-fun b!217890 () Bool)

(declare-fun res!106761 () Bool)

(assert (=> b!217890 (=> (not res!106761) (not e!141741))))

(declare-datatypes ((tuple2!4304 0))(
  ( (tuple2!4305 (_1!2163 (_ BitVec 64)) (_2!2163 V!7251)) )
))
(declare-datatypes ((List!3209 0))(
  ( (Nil!3206) (Cons!3205 (h!3852 tuple2!4304) (t!8164 List!3209)) )
))
(declare-datatypes ((ListLongMap!3217 0))(
  ( (ListLongMap!3218 (toList!1624 List!3209)) )
))
(declare-fun contains!1465 (ListLongMap!3217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1152 (array!10647 array!10645 (_ BitVec 32) (_ BitVec 32) V!7251 V!7251 (_ BitVec 32) Int) ListLongMap!3217)

(assert (=> b!217890 (= res!106761 (not (contains!1465 (getCurrentListMap!1152 (_keys!6157 thiss!1504) (_values!4091 thiss!1504) (mask!9873 thiss!1504) (extraKeys!3845 thiss!1504) (zeroValue!3949 thiss!1504) (minValue!3949 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4108 thiss!1504)) key!932)))))

(declare-fun b!217891 () Bool)

(declare-fun res!106756 () Bool)

(assert (=> b!217891 (=> (not res!106756) (not e!141741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217891 (= res!106756 (validMask!0 (mask!9873 thiss!1504)))))

(declare-fun mapNonEmpty!9717 () Bool)

(declare-fun mapRes!9717 () Bool)

(declare-fun tp!20657 () Bool)

(declare-fun e!141744 () Bool)

(assert (=> mapNonEmpty!9717 (= mapRes!9717 (and tp!20657 e!141744))))

(declare-fun mapKey!9717 () (_ BitVec 32))

(declare-fun mapValue!9717 () ValueCell!2508)

(declare-fun mapRest!9717 () (Array (_ BitVec 32) ValueCell!2508))

(assert (=> mapNonEmpty!9717 (= (arr!5044 (_values!4091 thiss!1504)) (store mapRest!9717 mapKey!9717 mapValue!9717))))

(declare-fun mapIsEmpty!9717 () Bool)

(assert (=> mapIsEmpty!9717 mapRes!9717))

(declare-fun b!217892 () Bool)

(declare-fun e!141743 () Bool)

(declare-fun tp_is_empty!5703 () Bool)

(assert (=> b!217892 (= e!141743 tp_is_empty!5703)))

(declare-fun b!217893 () Bool)

(declare-fun e!141740 () Bool)

(assert (=> b!217893 (= e!141740 (and e!141743 mapRes!9717))))

(declare-fun condMapEmpty!9717 () Bool)

(declare-fun mapDefault!9717 () ValueCell!2508)

(assert (=> b!217893 (= condMapEmpty!9717 (= (arr!5044 (_values!4091 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2508)) mapDefault!9717)))))

(declare-fun b!217894 () Bool)

(declare-fun res!106757 () Bool)

(assert (=> b!217894 (=> (not res!106757) (not e!141741))))

(assert (=> b!217894 (= res!106757 (and (= (size!5376 (_values!4091 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9873 thiss!1504))) (= (size!5377 (_keys!6157 thiss!1504)) (size!5376 (_values!4091 thiss!1504))) (bvsge (mask!9873 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3845 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3845 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun array_inv!3341 (array!10647) Bool)

(declare-fun array_inv!3342 (array!10645) Bool)

(assert (=> b!217895 (= e!141739 (and tp!20658 tp_is_empty!5703 (array_inv!3341 (_keys!6157 thiss!1504)) (array_inv!3342 (_values!4091 thiss!1504)) e!141740))))

(declare-fun b!217896 () Bool)

(declare-fun res!106758 () Bool)

(assert (=> b!217896 (=> (not res!106758) (not e!141742))))

(assert (=> b!217896 (= res!106758 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217897 () Bool)

(assert (=> b!217897 (= e!141741 false)))

(declare-fun lt!111428 () Bool)

(declare-datatypes ((List!3210 0))(
  ( (Nil!3207) (Cons!3206 (h!3853 (_ BitVec 64)) (t!8165 List!3210)) )
))
(declare-fun arrayNoDuplicates!0 (array!10647 (_ BitVec 32) List!3210) Bool)

(assert (=> b!217897 (= lt!111428 (arrayNoDuplicates!0 (_keys!6157 thiss!1504) #b00000000000000000000000000000000 Nil!3207))))

(declare-fun b!217898 () Bool)

(assert (=> b!217898 (= e!141744 tp_is_empty!5703)))

(assert (= (and start!21692 res!106755) b!217896))

(assert (= (and b!217896 res!106758) b!217888))

(assert (= (and b!217888 res!106759) b!217890))

(assert (= (and b!217890 res!106761) b!217891))

(assert (= (and b!217891 res!106756) b!217894))

(assert (= (and b!217894 res!106757) b!217889))

(assert (= (and b!217889 res!106760) b!217897))

(assert (= (and b!217893 condMapEmpty!9717) mapIsEmpty!9717))

(assert (= (and b!217893 (not condMapEmpty!9717)) mapNonEmpty!9717))

(get-info :version)

(assert (= (and mapNonEmpty!9717 ((_ is ValueCellFull!2508) mapValue!9717)) b!217898))

(assert (= (and b!217893 ((_ is ValueCellFull!2508) mapDefault!9717)) b!217892))

(assert (= b!217895 b!217893))

(assert (= start!21692 b!217895))

(declare-fun m!244029 () Bool)

(assert (=> b!217890 m!244029))

(assert (=> b!217890 m!244029))

(declare-fun m!244031 () Bool)

(assert (=> b!217890 m!244031))

(declare-fun m!244033 () Bool)

(assert (=> b!217891 m!244033))

(declare-fun m!244035 () Bool)

(assert (=> b!217889 m!244035))

(declare-fun m!244037 () Bool)

(assert (=> mapNonEmpty!9717 m!244037))

(declare-fun m!244039 () Bool)

(assert (=> b!217888 m!244039))

(declare-fun m!244041 () Bool)

(assert (=> start!21692 m!244041))

(declare-fun m!244043 () Bool)

(assert (=> b!217895 m!244043))

(declare-fun m!244045 () Bool)

(assert (=> b!217895 m!244045))

(declare-fun m!244047 () Bool)

(assert (=> b!217897 m!244047))

(check-sat (not b_next!5841) (not mapNonEmpty!9717) tp_is_empty!5703 (not b!217889) (not b!217891) (not b!217897) (not b!217895) (not b!217888) (not start!21692) b_and!12731 (not b!217890))
(check-sat b_and!12731 (not b_next!5841))
