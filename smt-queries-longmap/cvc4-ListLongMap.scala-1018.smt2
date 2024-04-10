; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21712 () Bool)

(assert start!21712)

(declare-fun b!218222 () Bool)

(declare-fun b_free!5861 () Bool)

(declare-fun b_next!5861 () Bool)

(assert (=> b!218222 (= b_free!5861 (not b_next!5861))))

(declare-fun tp!20718 () Bool)

(declare-fun b_and!12751 () Bool)

(assert (=> b!218222 (= tp!20718 b_and!12751)))

(declare-fun b!218218 () Bool)

(declare-fun e!141951 () Bool)

(declare-fun e!141953 () Bool)

(assert (=> b!218218 (= e!141951 e!141953)))

(declare-fun res!106971 () Bool)

(assert (=> b!218218 (=> (not res!106971) (not e!141953))))

(declare-datatypes ((SeekEntryResult!783 0))(
  ( (MissingZero!783 (index!5302 (_ BitVec 32))) (Found!783 (index!5303 (_ BitVec 32))) (Intermediate!783 (undefined!1595 Bool) (index!5304 (_ BitVec 32)) (x!22815 (_ BitVec 32))) (Undefined!783) (MissingVacant!783 (index!5305 (_ BitVec 32))) )
))
(declare-fun lt!111489 () SeekEntryResult!783)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218218 (= res!106971 (or (= lt!111489 (MissingZero!783 index!297)) (= lt!111489 (MissingVacant!783 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7277 0))(
  ( (V!7278 (val!2906 Int)) )
))
(declare-datatypes ((ValueCell!2518 0))(
  ( (ValueCellFull!2518 (v!4924 V!7277)) (EmptyCell!2518) )
))
(declare-datatypes ((array!10685 0))(
  ( (array!10686 (arr!5064 (Array (_ BitVec 32) ValueCell!2518)) (size!5396 (_ BitVec 32))) )
))
(declare-datatypes ((array!10687 0))(
  ( (array!10688 (arr!5065 (Array (_ BitVec 32) (_ BitVec 64))) (size!5397 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2936 0))(
  ( (LongMapFixedSize!2937 (defaultEntry!4118 Int) (mask!9889 (_ BitVec 32)) (extraKeys!3855 (_ BitVec 32)) (zeroValue!3959 V!7277) (minValue!3959 V!7277) (_size!1517 (_ BitVec 32)) (_keys!6167 array!10687) (_values!4101 array!10685) (_vacant!1517 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2936)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10687 (_ BitVec 32)) SeekEntryResult!783)

(assert (=> b!218218 (= lt!111489 (seekEntryOrOpen!0 key!932 (_keys!6167 thiss!1504) (mask!9889 thiss!1504)))))

(declare-fun b!218219 () Bool)

(declare-fun e!141949 () Bool)

(declare-fun tp_is_empty!5723 () Bool)

(assert (=> b!218219 (= e!141949 tp_is_empty!5723)))

(declare-fun mapNonEmpty!9747 () Bool)

(declare-fun mapRes!9747 () Bool)

(declare-fun tp!20717 () Bool)

(assert (=> mapNonEmpty!9747 (= mapRes!9747 (and tp!20717 e!141949))))

(declare-fun mapRest!9747 () (Array (_ BitVec 32) ValueCell!2518))

(declare-fun mapKey!9747 () (_ BitVec 32))

(declare-fun mapValue!9747 () ValueCell!2518)

(assert (=> mapNonEmpty!9747 (= (arr!5064 (_values!4101 thiss!1504)) (store mapRest!9747 mapKey!9747 mapValue!9747))))

(declare-fun b!218221 () Bool)

(declare-fun e!141955 () Bool)

(assert (=> b!218221 (= e!141955 tp_is_empty!5723)))

(declare-fun e!141952 () Bool)

(declare-fun e!141954 () Bool)

(declare-fun array_inv!3357 (array!10687) Bool)

(declare-fun array_inv!3358 (array!10685) Bool)

(assert (=> b!218222 (= e!141952 (and tp!20718 tp_is_empty!5723 (array_inv!3357 (_keys!6167 thiss!1504)) (array_inv!3358 (_values!4101 thiss!1504)) e!141954))))

(declare-fun b!218223 () Bool)

(declare-fun res!106965 () Bool)

(assert (=> b!218223 (=> (not res!106965) (not e!141953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218223 (= res!106965 (validMask!0 (mask!9889 thiss!1504)))))

(declare-fun b!218224 () Bool)

(assert (=> b!218224 (= e!141953 false)))

(declare-fun lt!111488 () Bool)

(declare-datatypes ((List!3224 0))(
  ( (Nil!3221) (Cons!3220 (h!3867 (_ BitVec 64)) (t!8179 List!3224)) )
))
(declare-fun arrayNoDuplicates!0 (array!10687 (_ BitVec 32) List!3224) Bool)

(assert (=> b!218224 (= lt!111488 (arrayNoDuplicates!0 (_keys!6167 thiss!1504) #b00000000000000000000000000000000 Nil!3221))))

(declare-fun mapIsEmpty!9747 () Bool)

(assert (=> mapIsEmpty!9747 mapRes!9747))

(declare-fun b!218225 () Bool)

(declare-fun res!106970 () Bool)

(assert (=> b!218225 (=> (not res!106970) (not e!141953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10687 (_ BitVec 32)) Bool)

(assert (=> b!218225 (= res!106970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6167 thiss!1504) (mask!9889 thiss!1504)))))

(declare-fun b!218226 () Bool)

(declare-fun res!106969 () Bool)

(assert (=> b!218226 (=> (not res!106969) (not e!141953))))

(declare-datatypes ((tuple2!4318 0))(
  ( (tuple2!4319 (_1!2170 (_ BitVec 64)) (_2!2170 V!7277)) )
))
(declare-datatypes ((List!3225 0))(
  ( (Nil!3222) (Cons!3221 (h!3868 tuple2!4318) (t!8180 List!3225)) )
))
(declare-datatypes ((ListLongMap!3231 0))(
  ( (ListLongMap!3232 (toList!1631 List!3225)) )
))
(declare-fun contains!1472 (ListLongMap!3231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1159 (array!10687 array!10685 (_ BitVec 32) (_ BitVec 32) V!7277 V!7277 (_ BitVec 32) Int) ListLongMap!3231)

(assert (=> b!218226 (= res!106969 (not (contains!1472 (getCurrentListMap!1159 (_keys!6167 thiss!1504) (_values!4101 thiss!1504) (mask!9889 thiss!1504) (extraKeys!3855 thiss!1504) (zeroValue!3959 thiss!1504) (minValue!3959 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4118 thiss!1504)) key!932)))))

(declare-fun b!218227 () Bool)

(declare-fun res!106968 () Bool)

(assert (=> b!218227 (=> (not res!106968) (not e!141953))))

(assert (=> b!218227 (= res!106968 (and (= (size!5396 (_values!4101 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9889 thiss!1504))) (= (size!5397 (_keys!6167 thiss!1504)) (size!5396 (_values!4101 thiss!1504))) (bvsge (mask!9889 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3855 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3855 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!218228 () Bool)

(declare-fun res!106966 () Bool)

(assert (=> b!218228 (=> (not res!106966) (not e!141951))))

(assert (=> b!218228 (= res!106966 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!106967 () Bool)

(assert (=> start!21712 (=> (not res!106967) (not e!141951))))

(declare-fun valid!1190 (LongMapFixedSize!2936) Bool)

(assert (=> start!21712 (= res!106967 (valid!1190 thiss!1504))))

(assert (=> start!21712 e!141951))

(assert (=> start!21712 e!141952))

(assert (=> start!21712 true))

(declare-fun b!218220 () Bool)

(assert (=> b!218220 (= e!141954 (and e!141955 mapRes!9747))))

(declare-fun condMapEmpty!9747 () Bool)

(declare-fun mapDefault!9747 () ValueCell!2518)

