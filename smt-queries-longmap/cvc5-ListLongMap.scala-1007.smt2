; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21642 () Bool)

(assert start!21642)

(declare-fun b!217065 () Bool)

(declare-fun b_free!5791 () Bool)

(declare-fun b_next!5791 () Bool)

(assert (=> b!217065 (= b_free!5791 (not b_next!5791))))

(declare-fun tp!20507 () Bool)

(declare-fun b_and!12681 () Bool)

(assert (=> b!217065 (= tp!20507 b_and!12681)))

(declare-fun mapNonEmpty!9642 () Bool)

(declare-fun mapRes!9642 () Bool)

(declare-fun tp!20508 () Bool)

(declare-fun e!141219 () Bool)

(assert (=> mapNonEmpty!9642 (= mapRes!9642 (and tp!20508 e!141219))))

(declare-datatypes ((V!7185 0))(
  ( (V!7186 (val!2871 Int)) )
))
(declare-datatypes ((ValueCell!2483 0))(
  ( (ValueCellFull!2483 (v!4889 V!7185)) (EmptyCell!2483) )
))
(declare-fun mapRest!9642 () (Array (_ BitVec 32) ValueCell!2483))

(declare-datatypes ((array!10545 0))(
  ( (array!10546 (arr!4994 (Array (_ BitVec 32) ValueCell!2483)) (size!5326 (_ BitVec 32))) )
))
(declare-datatypes ((array!10547 0))(
  ( (array!10548 (arr!4995 (Array (_ BitVec 32) (_ BitVec 64))) (size!5327 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2866 0))(
  ( (LongMapFixedSize!2867 (defaultEntry!4083 Int) (mask!9832 (_ BitVec 32)) (extraKeys!3820 (_ BitVec 32)) (zeroValue!3924 V!7185) (minValue!3924 V!7185) (_size!1482 (_ BitVec 32)) (_keys!6132 array!10547) (_values!4066 array!10545) (_vacant!1482 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2866)

(declare-fun mapValue!9642 () ValueCell!2483)

(declare-fun mapKey!9642 () (_ BitVec 32))

(assert (=> mapNonEmpty!9642 (= (arr!4994 (_values!4066 thiss!1504)) (store mapRest!9642 mapKey!9642 mapValue!9642))))

(declare-fun b!217064 () Bool)

(declare-fun e!141220 () Bool)

(declare-fun e!141215 () Bool)

(assert (=> b!217064 (= e!141220 e!141215)))

(declare-fun res!106232 () Bool)

(assert (=> b!217064 (=> (not res!106232) (not e!141215))))

(declare-datatypes ((SeekEntryResult!759 0))(
  ( (MissingZero!759 (index!5206 (_ BitVec 32))) (Found!759 (index!5207 (_ BitVec 32))) (Intermediate!759 (undefined!1571 Bool) (index!5208 (_ BitVec 32)) (x!22703 (_ BitVec 32))) (Undefined!759) (MissingVacant!759 (index!5209 (_ BitVec 32))) )
))
(declare-fun lt!111279 () SeekEntryResult!759)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217064 (= res!106232 (or (= lt!111279 (MissingZero!759 index!297)) (= lt!111279 (MissingVacant!759 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10547 (_ BitVec 32)) SeekEntryResult!759)

(assert (=> b!217064 (= lt!111279 (seekEntryOrOpen!0 key!932 (_keys!6132 thiss!1504) (mask!9832 thiss!1504)))))

(declare-fun e!141217 () Bool)

(declare-fun tp_is_empty!5653 () Bool)

(declare-fun e!141218 () Bool)

(declare-fun array_inv!3305 (array!10547) Bool)

(declare-fun array_inv!3306 (array!10545) Bool)

(assert (=> b!217065 (= e!141218 (and tp!20507 tp_is_empty!5653 (array_inv!3305 (_keys!6132 thiss!1504)) (array_inv!3306 (_values!4066 thiss!1504)) e!141217))))

(declare-fun b!217066 () Bool)

(assert (=> b!217066 (= e!141215 false)))

(declare-fun lt!111278 () Bool)

(declare-datatypes ((List!3175 0))(
  ( (Nil!3172) (Cons!3171 (h!3818 (_ BitVec 64)) (t!8130 List!3175)) )
))
(declare-fun arrayNoDuplicates!0 (array!10547 (_ BitVec 32) List!3175) Bool)

(assert (=> b!217066 (= lt!111278 (arrayNoDuplicates!0 (_keys!6132 thiss!1504) #b00000000000000000000000000000000 Nil!3172))))

(declare-fun b!217067 () Bool)

(assert (=> b!217067 (= e!141219 tp_is_empty!5653)))

(declare-fun b!217068 () Bool)

(declare-fun e!141216 () Bool)

(assert (=> b!217068 (= e!141216 tp_is_empty!5653)))

(declare-fun mapIsEmpty!9642 () Bool)

(assert (=> mapIsEmpty!9642 mapRes!9642))

(declare-fun b!217069 () Bool)

(declare-fun res!106235 () Bool)

(assert (=> b!217069 (=> (not res!106235) (not e!141215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10547 (_ BitVec 32)) Bool)

(assert (=> b!217069 (= res!106235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6132 thiss!1504) (mask!9832 thiss!1504)))))

(declare-fun b!217063 () Bool)

(declare-fun res!106231 () Bool)

(assert (=> b!217063 (=> (not res!106231) (not e!141215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217063 (= res!106231 (validMask!0 (mask!9832 thiss!1504)))))

(declare-fun res!106230 () Bool)

(assert (=> start!21642 (=> (not res!106230) (not e!141220))))

(declare-fun valid!1165 (LongMapFixedSize!2866) Bool)

(assert (=> start!21642 (= res!106230 (valid!1165 thiss!1504))))

(assert (=> start!21642 e!141220))

(assert (=> start!21642 e!141218))

(assert (=> start!21642 true))

(declare-fun b!217070 () Bool)

(declare-fun res!106236 () Bool)

(assert (=> b!217070 (=> (not res!106236) (not e!141215))))

(declare-datatypes ((tuple2!4272 0))(
  ( (tuple2!4273 (_1!2147 (_ BitVec 64)) (_2!2147 V!7185)) )
))
(declare-datatypes ((List!3176 0))(
  ( (Nil!3173) (Cons!3172 (h!3819 tuple2!4272) (t!8131 List!3176)) )
))
(declare-datatypes ((ListLongMap!3185 0))(
  ( (ListLongMap!3186 (toList!1608 List!3176)) )
))
(declare-fun contains!1449 (ListLongMap!3185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1136 (array!10547 array!10545 (_ BitVec 32) (_ BitVec 32) V!7185 V!7185 (_ BitVec 32) Int) ListLongMap!3185)

(assert (=> b!217070 (= res!106236 (contains!1449 (getCurrentListMap!1136 (_keys!6132 thiss!1504) (_values!4066 thiss!1504) (mask!9832 thiss!1504) (extraKeys!3820 thiss!1504) (zeroValue!3924 thiss!1504) (minValue!3924 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4083 thiss!1504)) key!932))))

(declare-fun b!217071 () Bool)

(assert (=> b!217071 (= e!141217 (and e!141216 mapRes!9642))))

(declare-fun condMapEmpty!9642 () Bool)

(declare-fun mapDefault!9642 () ValueCell!2483)

