; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21696 () Bool)

(assert start!21696)

(declare-fun b!217964 () Bool)

(declare-fun b_free!5845 () Bool)

(declare-fun b_next!5845 () Bool)

(assert (=> b!217964 (= b_free!5845 (not b_next!5845))))

(declare-fun tp!20669 () Bool)

(declare-fun b_and!12735 () Bool)

(assert (=> b!217964 (= tp!20669 b_and!12735)))

(declare-fun mapIsEmpty!9723 () Bool)

(declare-fun mapRes!9723 () Bool)

(assert (=> mapIsEmpty!9723 mapRes!9723))

(declare-fun b!217954 () Bool)

(declare-fun res!106803 () Bool)

(declare-fun e!141785 () Bool)

(assert (=> b!217954 (=> (not res!106803) (not e!141785))))

(declare-datatypes ((V!7257 0))(
  ( (V!7258 (val!2898 Int)) )
))
(declare-datatypes ((ValueCell!2510 0))(
  ( (ValueCellFull!2510 (v!4916 V!7257)) (EmptyCell!2510) )
))
(declare-datatypes ((array!10653 0))(
  ( (array!10654 (arr!5048 (Array (_ BitVec 32) ValueCell!2510)) (size!5380 (_ BitVec 32))) )
))
(declare-datatypes ((array!10655 0))(
  ( (array!10656 (arr!5049 (Array (_ BitVec 32) (_ BitVec 64))) (size!5381 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2920 0))(
  ( (LongMapFixedSize!2921 (defaultEntry!4110 Int) (mask!9877 (_ BitVec 32)) (extraKeys!3847 (_ BitVec 32)) (zeroValue!3951 V!7257) (minValue!3951 V!7257) (_size!1509 (_ BitVec 32)) (_keys!6159 array!10655) (_values!4093 array!10653) (_vacant!1509 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2920)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10655 (_ BitVec 32)) Bool)

(assert (=> b!217954 (= res!106803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6159 thiss!1504) (mask!9877 thiss!1504)))))

(declare-fun b!217955 () Bool)

(declare-fun e!141781 () Bool)

(declare-fun tp_is_empty!5707 () Bool)

(assert (=> b!217955 (= e!141781 tp_is_empty!5707)))

(declare-fun mapNonEmpty!9723 () Bool)

(declare-fun tp!20670 () Bool)

(declare-fun e!141783 () Bool)

(assert (=> mapNonEmpty!9723 (= mapRes!9723 (and tp!20670 e!141783))))

(declare-fun mapRest!9723 () (Array (_ BitVec 32) ValueCell!2510))

(declare-fun mapValue!9723 () ValueCell!2510)

(declare-fun mapKey!9723 () (_ BitVec 32))

(assert (=> mapNonEmpty!9723 (= (arr!5048 (_values!4093 thiss!1504)) (store mapRest!9723 mapKey!9723 mapValue!9723))))

(declare-fun b!217956 () Bool)

(declare-fun res!106801 () Bool)

(declare-fun e!141786 () Bool)

(assert (=> b!217956 (=> (not res!106801) (not e!141786))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217956 (= res!106801 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217957 () Bool)

(assert (=> b!217957 (= e!141785 false)))

(declare-fun lt!111441 () Bool)

(declare-datatypes ((List!3211 0))(
  ( (Nil!3208) (Cons!3207 (h!3854 (_ BitVec 64)) (t!8166 List!3211)) )
))
(declare-fun arrayNoDuplicates!0 (array!10655 (_ BitVec 32) List!3211) Bool)

(assert (=> b!217957 (= lt!111441 (arrayNoDuplicates!0 (_keys!6159 thiss!1504) #b00000000000000000000000000000000 Nil!3208))))

(declare-fun b!217958 () Bool)

(declare-fun res!106798 () Bool)

(assert (=> b!217958 (=> (not res!106798) (not e!141785))))

(declare-datatypes ((tuple2!4306 0))(
  ( (tuple2!4307 (_1!2164 (_ BitVec 64)) (_2!2164 V!7257)) )
))
(declare-datatypes ((List!3212 0))(
  ( (Nil!3209) (Cons!3208 (h!3855 tuple2!4306) (t!8167 List!3212)) )
))
(declare-datatypes ((ListLongMap!3219 0))(
  ( (ListLongMap!3220 (toList!1625 List!3212)) )
))
(declare-fun contains!1466 (ListLongMap!3219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1153 (array!10655 array!10653 (_ BitVec 32) (_ BitVec 32) V!7257 V!7257 (_ BitVec 32) Int) ListLongMap!3219)

(assert (=> b!217958 (= res!106798 (not (contains!1466 (getCurrentListMap!1153 (_keys!6159 thiss!1504) (_values!4093 thiss!1504) (mask!9877 thiss!1504) (extraKeys!3847 thiss!1504) (zeroValue!3951 thiss!1504) (minValue!3951 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4110 thiss!1504)) key!932)))))

(declare-fun b!217959 () Bool)

(declare-fun e!141787 () Bool)

(assert (=> b!217959 (= e!141787 (and e!141781 mapRes!9723))))

(declare-fun condMapEmpty!9723 () Bool)

(declare-fun mapDefault!9723 () ValueCell!2510)

