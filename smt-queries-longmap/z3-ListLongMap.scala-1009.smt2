; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21658 () Bool)

(assert start!21658)

(declare-fun b!217117 () Bool)

(declare-fun b_free!5803 () Bool)

(declare-fun b_next!5803 () Bool)

(assert (=> b!217117 (= b_free!5803 (not b_next!5803))))

(declare-fun tp!20543 () Bool)

(declare-fun b_and!12667 () Bool)

(assert (=> b!217117 (= tp!20543 b_and!12667)))

(declare-fun b!217114 () Bool)

(declare-fun e!141244 () Bool)

(declare-fun e!141240 () Bool)

(declare-fun mapRes!9660 () Bool)

(assert (=> b!217114 (= e!141244 (and e!141240 mapRes!9660))))

(declare-fun condMapEmpty!9660 () Bool)

(declare-datatypes ((V!7201 0))(
  ( (V!7202 (val!2877 Int)) )
))
(declare-datatypes ((ValueCell!2489 0))(
  ( (ValueCellFull!2489 (v!4889 V!7201)) (EmptyCell!2489) )
))
(declare-datatypes ((array!10561 0))(
  ( (array!10562 (arr!5001 (Array (_ BitVec 32) ValueCell!2489)) (size!5334 (_ BitVec 32))) )
))
(declare-datatypes ((array!10563 0))(
  ( (array!10564 (arr!5002 (Array (_ BitVec 32) (_ BitVec 64))) (size!5335 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2878 0))(
  ( (LongMapFixedSize!2879 (defaultEntry!4089 Int) (mask!9841 (_ BitVec 32)) (extraKeys!3826 (_ BitVec 32)) (zeroValue!3930 V!7201) (minValue!3930 V!7201) (_size!1488 (_ BitVec 32)) (_keys!6137 array!10563) (_values!4072 array!10561) (_vacant!1488 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2878)

(declare-fun mapDefault!9660 () ValueCell!2489)

(assert (=> b!217114 (= condMapEmpty!9660 (= (arr!5001 (_values!4072 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2489)) mapDefault!9660)))))

(declare-fun b!217115 () Bool)

(declare-fun e!141239 () Bool)

(declare-fun e!141243 () Bool)

(assert (=> b!217115 (= e!141239 e!141243)))

(declare-fun res!106265 () Bool)

(assert (=> b!217115 (=> (not res!106265) (not e!141243))))

(declare-datatypes ((SeekEntryResult!757 0))(
  ( (MissingZero!757 (index!5198 (_ BitVec 32))) (Found!757 (index!5199 (_ BitVec 32))) (Intermediate!757 (undefined!1569 Bool) (index!5200 (_ BitVec 32)) (x!22716 (_ BitVec 32))) (Undefined!757) (MissingVacant!757 (index!5201 (_ BitVec 32))) )
))
(declare-fun lt!111134 () SeekEntryResult!757)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217115 (= res!106265 (or (= lt!111134 (MissingZero!757 index!297)) (= lt!111134 (MissingVacant!757 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10563 (_ BitVec 32)) SeekEntryResult!757)

(assert (=> b!217115 (= lt!111134 (seekEntryOrOpen!0 key!932 (_keys!6137 thiss!1504) (mask!9841 thiss!1504)))))

(declare-fun b!217116 () Bool)

(declare-fun tp_is_empty!5665 () Bool)

(assert (=> b!217116 (= e!141240 tp_is_empty!5665)))

(declare-fun e!141245 () Bool)

(declare-fun array_inv!3291 (array!10563) Bool)

(declare-fun array_inv!3292 (array!10561) Bool)

(assert (=> b!217117 (= e!141245 (and tp!20543 tp_is_empty!5665 (array_inv!3291 (_keys!6137 thiss!1504)) (array_inv!3292 (_values!4072 thiss!1504)) e!141244))))

(declare-fun res!106263 () Bool)

(assert (=> start!21658 (=> (not res!106263) (not e!141239))))

(declare-fun valid!1183 (LongMapFixedSize!2878) Bool)

(assert (=> start!21658 (= res!106263 (valid!1183 thiss!1504))))

(assert (=> start!21658 e!141239))

(assert (=> start!21658 e!141245))

(assert (=> start!21658 true))

(declare-fun b!217118 () Bool)

(declare-fun res!106267 () Bool)

(assert (=> b!217118 (=> (not res!106267) (not e!141239))))

(assert (=> b!217118 (= res!106267 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217119 () Bool)

(declare-fun e!141241 () Bool)

(assert (=> b!217119 (= e!141241 tp_is_empty!5665)))

(declare-fun b!217120 () Bool)

(assert (=> b!217120 (= e!141243 false)))

(declare-fun lt!111133 () Bool)

(declare-datatypes ((List!3165 0))(
  ( (Nil!3162) (Cons!3161 (h!3808 (_ BitVec 64)) (t!8111 List!3165)) )
))
(declare-fun arrayNoDuplicates!0 (array!10563 (_ BitVec 32) List!3165) Bool)

(assert (=> b!217120 (= lt!111133 (arrayNoDuplicates!0 (_keys!6137 thiss!1504) #b00000000000000000000000000000000 Nil!3162))))

(declare-fun b!217121 () Bool)

(declare-fun res!106264 () Bool)

(assert (=> b!217121 (=> (not res!106264) (not e!141243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217121 (= res!106264 (validMask!0 (mask!9841 thiss!1504)))))

(declare-fun b!217122 () Bool)

(declare-fun res!106261 () Bool)

(assert (=> b!217122 (=> (not res!106261) (not e!141243))))

(assert (=> b!217122 (= res!106261 (and (= (size!5334 (_values!4072 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9841 thiss!1504))) (= (size!5335 (_keys!6137 thiss!1504)) (size!5334 (_values!4072 thiss!1504))) (bvsge (mask!9841 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3826 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3826 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217123 () Bool)

(declare-fun res!106262 () Bool)

(assert (=> b!217123 (=> (not res!106262) (not e!141243))))

(declare-datatypes ((tuple2!4238 0))(
  ( (tuple2!4239 (_1!2130 (_ BitVec 64)) (_2!2130 V!7201)) )
))
(declare-datatypes ((List!3166 0))(
  ( (Nil!3163) (Cons!3162 (h!3809 tuple2!4238) (t!8112 List!3166)) )
))
(declare-datatypes ((ListLongMap!3141 0))(
  ( (ListLongMap!3142 (toList!1586 List!3166)) )
))
(declare-fun contains!1427 (ListLongMap!3141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1095 (array!10563 array!10561 (_ BitVec 32) (_ BitVec 32) V!7201 V!7201 (_ BitVec 32) Int) ListLongMap!3141)

(assert (=> b!217123 (= res!106262 (contains!1427 (getCurrentListMap!1095 (_keys!6137 thiss!1504) (_values!4072 thiss!1504) (mask!9841 thiss!1504) (extraKeys!3826 thiss!1504) (zeroValue!3930 thiss!1504) (minValue!3930 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4089 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9660 () Bool)

(assert (=> mapIsEmpty!9660 mapRes!9660))

(declare-fun b!217124 () Bool)

(declare-fun res!106266 () Bool)

(assert (=> b!217124 (=> (not res!106266) (not e!141243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10563 (_ BitVec 32)) Bool)

(assert (=> b!217124 (= res!106266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6137 thiss!1504) (mask!9841 thiss!1504)))))

(declare-fun mapNonEmpty!9660 () Bool)

(declare-fun tp!20544 () Bool)

(assert (=> mapNonEmpty!9660 (= mapRes!9660 (and tp!20544 e!141241))))

(declare-fun mapKey!9660 () (_ BitVec 32))

(declare-fun mapRest!9660 () (Array (_ BitVec 32) ValueCell!2489))

(declare-fun mapValue!9660 () ValueCell!2489)

(assert (=> mapNonEmpty!9660 (= (arr!5001 (_values!4072 thiss!1504)) (store mapRest!9660 mapKey!9660 mapValue!9660))))

(assert (= (and start!21658 res!106263) b!217118))

(assert (= (and b!217118 res!106267) b!217115))

(assert (= (and b!217115 res!106265) b!217123))

(assert (= (and b!217123 res!106262) b!217121))

(assert (= (and b!217121 res!106264) b!217122))

(assert (= (and b!217122 res!106261) b!217124))

(assert (= (and b!217124 res!106266) b!217120))

(assert (= (and b!217114 condMapEmpty!9660) mapIsEmpty!9660))

(assert (= (and b!217114 (not condMapEmpty!9660)) mapNonEmpty!9660))

(get-info :version)

(assert (= (and mapNonEmpty!9660 ((_ is ValueCellFull!2489) mapValue!9660)) b!217119))

(assert (= (and b!217114 ((_ is ValueCellFull!2489) mapDefault!9660)) b!217116))

(assert (= b!217117 b!217114))

(assert (= start!21658 b!217117))

(declare-fun m!243033 () Bool)

(assert (=> b!217124 m!243033))

(declare-fun m!243035 () Bool)

(assert (=> b!217117 m!243035))

(declare-fun m!243037 () Bool)

(assert (=> b!217117 m!243037))

(declare-fun m!243039 () Bool)

(assert (=> b!217115 m!243039))

(declare-fun m!243041 () Bool)

(assert (=> b!217123 m!243041))

(assert (=> b!217123 m!243041))

(declare-fun m!243043 () Bool)

(assert (=> b!217123 m!243043))

(declare-fun m!243045 () Bool)

(assert (=> mapNonEmpty!9660 m!243045))

(declare-fun m!243047 () Bool)

(assert (=> b!217120 m!243047))

(declare-fun m!243049 () Bool)

(assert (=> start!21658 m!243049))

(declare-fun m!243051 () Bool)

(assert (=> b!217121 m!243051))

(check-sat b_and!12667 (not b!217115) tp_is_empty!5665 (not start!21658) (not b!217121) (not b_next!5803) (not b!217123) (not b!217117) (not mapNonEmpty!9660) (not b!217124) (not b!217120))
(check-sat b_and!12667 (not b_next!5803))
