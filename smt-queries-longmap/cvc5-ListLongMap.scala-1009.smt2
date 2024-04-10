; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21654 () Bool)

(assert start!21654)

(declare-fun b!217263 () Bool)

(declare-fun b_free!5803 () Bool)

(declare-fun b_next!5803 () Bool)

(assert (=> b!217263 (= b_free!5803 (not b_next!5803))))

(declare-fun tp!20544 () Bool)

(declare-fun b_and!12693 () Bool)

(assert (=> b!217263 (= tp!20544 b_and!12693)))

(declare-fun b!217261 () Bool)

(declare-fun e!141341 () Bool)

(assert (=> b!217261 (= e!141341 false)))

(declare-fun lt!111315 () Bool)

(declare-datatypes ((V!7201 0))(
  ( (V!7202 (val!2877 Int)) )
))
(declare-datatypes ((ValueCell!2489 0))(
  ( (ValueCellFull!2489 (v!4895 V!7201)) (EmptyCell!2489) )
))
(declare-datatypes ((array!10569 0))(
  ( (array!10570 (arr!5006 (Array (_ BitVec 32) ValueCell!2489)) (size!5338 (_ BitVec 32))) )
))
(declare-datatypes ((array!10571 0))(
  ( (array!10572 (arr!5007 (Array (_ BitVec 32) (_ BitVec 64))) (size!5339 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2878 0))(
  ( (LongMapFixedSize!2879 (defaultEntry!4089 Int) (mask!9842 (_ BitVec 32)) (extraKeys!3826 (_ BitVec 32)) (zeroValue!3930 V!7201) (minValue!3930 V!7201) (_size!1488 (_ BitVec 32)) (_keys!6138 array!10571) (_values!4072 array!10569) (_vacant!1488 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2878)

(declare-datatypes ((List!3184 0))(
  ( (Nil!3181) (Cons!3180 (h!3827 (_ BitVec 64)) (t!8139 List!3184)) )
))
(declare-fun arrayNoDuplicates!0 (array!10571 (_ BitVec 32) List!3184) Bool)

(assert (=> b!217261 (= lt!111315 (arrayNoDuplicates!0 (_keys!6138 thiss!1504) #b00000000000000000000000000000000 Nil!3181))))

(declare-fun mapIsEmpty!9660 () Bool)

(declare-fun mapRes!9660 () Bool)

(assert (=> mapIsEmpty!9660 mapRes!9660))

(declare-fun b!217262 () Bool)

(declare-fun res!106357 () Bool)

(assert (=> b!217262 (=> (not res!106357) (not e!141341))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4282 0))(
  ( (tuple2!4283 (_1!2152 (_ BitVec 64)) (_2!2152 V!7201)) )
))
(declare-datatypes ((List!3185 0))(
  ( (Nil!3182) (Cons!3181 (h!3828 tuple2!4282) (t!8140 List!3185)) )
))
(declare-datatypes ((ListLongMap!3195 0))(
  ( (ListLongMap!3196 (toList!1613 List!3185)) )
))
(declare-fun contains!1454 (ListLongMap!3195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1141 (array!10571 array!10569 (_ BitVec 32) (_ BitVec 32) V!7201 V!7201 (_ BitVec 32) Int) ListLongMap!3195)

(assert (=> b!217262 (= res!106357 (contains!1454 (getCurrentListMap!1141 (_keys!6138 thiss!1504) (_values!4072 thiss!1504) (mask!9842 thiss!1504) (extraKeys!3826 thiss!1504) (zeroValue!3930 thiss!1504) (minValue!3930 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4089 thiss!1504)) key!932))))

(declare-fun res!106359 () Bool)

(declare-fun e!141344 () Bool)

(assert (=> start!21654 (=> (not res!106359) (not e!141344))))

(declare-fun valid!1170 (LongMapFixedSize!2878) Bool)

(assert (=> start!21654 (= res!106359 (valid!1170 thiss!1504))))

(assert (=> start!21654 e!141344))

(declare-fun e!141343 () Bool)

(assert (=> start!21654 e!141343))

(assert (=> start!21654 true))

(declare-fun e!141346 () Bool)

(declare-fun tp_is_empty!5665 () Bool)

(declare-fun array_inv!3317 (array!10571) Bool)

(declare-fun array_inv!3318 (array!10569) Bool)

(assert (=> b!217263 (= e!141343 (and tp!20544 tp_is_empty!5665 (array_inv!3317 (_keys!6138 thiss!1504)) (array_inv!3318 (_values!4072 thiss!1504)) e!141346))))

(declare-fun b!217264 () Bool)

(declare-fun res!106356 () Bool)

(assert (=> b!217264 (=> (not res!106356) (not e!141341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10571 (_ BitVec 32)) Bool)

(assert (=> b!217264 (= res!106356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6138 thiss!1504) (mask!9842 thiss!1504)))))

(declare-fun b!217265 () Bool)

(declare-fun res!106361 () Bool)

(assert (=> b!217265 (=> (not res!106361) (not e!141344))))

(assert (=> b!217265 (= res!106361 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217266 () Bool)

(declare-fun e!141345 () Bool)

(assert (=> b!217266 (= e!141345 tp_is_empty!5665)))

(declare-fun mapNonEmpty!9660 () Bool)

(declare-fun tp!20543 () Bool)

(assert (=> mapNonEmpty!9660 (= mapRes!9660 (and tp!20543 e!141345))))

(declare-fun mapValue!9660 () ValueCell!2489)

(declare-fun mapKey!9660 () (_ BitVec 32))

(declare-fun mapRest!9660 () (Array (_ BitVec 32) ValueCell!2489))

(assert (=> mapNonEmpty!9660 (= (arr!5006 (_values!4072 thiss!1504)) (store mapRest!9660 mapKey!9660 mapValue!9660))))

(declare-fun b!217267 () Bool)

(assert (=> b!217267 (= e!141344 e!141341)))

(declare-fun res!106358 () Bool)

(assert (=> b!217267 (=> (not res!106358) (not e!141341))))

(declare-datatypes ((SeekEntryResult!765 0))(
  ( (MissingZero!765 (index!5230 (_ BitVec 32))) (Found!765 (index!5231 (_ BitVec 32))) (Intermediate!765 (undefined!1577 Bool) (index!5232 (_ BitVec 32)) (x!22725 (_ BitVec 32))) (Undefined!765) (MissingVacant!765 (index!5233 (_ BitVec 32))) )
))
(declare-fun lt!111314 () SeekEntryResult!765)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217267 (= res!106358 (or (= lt!111314 (MissingZero!765 index!297)) (= lt!111314 (MissingVacant!765 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10571 (_ BitVec 32)) SeekEntryResult!765)

(assert (=> b!217267 (= lt!111314 (seekEntryOrOpen!0 key!932 (_keys!6138 thiss!1504) (mask!9842 thiss!1504)))))

(declare-fun b!217268 () Bool)

(declare-fun e!141340 () Bool)

(assert (=> b!217268 (= e!141346 (and e!141340 mapRes!9660))))

(declare-fun condMapEmpty!9660 () Bool)

(declare-fun mapDefault!9660 () ValueCell!2489)

