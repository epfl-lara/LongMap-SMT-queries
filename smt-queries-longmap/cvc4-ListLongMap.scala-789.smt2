; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18802 () Bool)

(assert start!18802)

(declare-fun b!185813 () Bool)

(declare-fun b_free!4577 () Bool)

(declare-fun b_next!4577 () Bool)

(assert (=> b!185813 (= b_free!4577 (not b_next!4577))))

(declare-fun tp!16530 () Bool)

(declare-fun b_and!11179 () Bool)

(assert (=> b!185813 (= tp!16530 b_and!11179)))

(declare-fun mapNonEmpty!7485 () Bool)

(declare-fun mapRes!7485 () Bool)

(declare-fun tp!16529 () Bool)

(declare-fun e!122256 () Bool)

(assert (=> mapNonEmpty!7485 (= mapRes!7485 (and tp!16529 e!122256))))

(declare-datatypes ((V!5445 0))(
  ( (V!5446 (val!2219 Int)) )
))
(declare-datatypes ((ValueCell!1831 0))(
  ( (ValueCellFull!1831 (v!4130 V!5445)) (EmptyCell!1831) )
))
(declare-fun mapValue!7485 () ValueCell!1831)

(declare-fun mapRest!7485 () (Array (_ BitVec 32) ValueCell!1831))

(declare-fun mapKey!7485 () (_ BitVec 32))

(declare-datatypes ((array!7907 0))(
  ( (array!7908 (arr!3733 (Array (_ BitVec 32) (_ BitVec 64))) (size!4049 (_ BitVec 32))) )
))
(declare-datatypes ((array!7909 0))(
  ( (array!7910 (arr!3734 (Array (_ BitVec 32) ValueCell!1831)) (size!4050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2570 0))(
  ( (LongMapFixedSize!2571 (defaultEntry!3787 Int) (mask!8900 (_ BitVec 32)) (extraKeys!3524 (_ BitVec 32)) (zeroValue!3628 V!5445) (minValue!3628 V!5445) (_size!1334 (_ BitVec 32)) (_keys!5728 array!7907) (_values!3770 array!7909) (_vacant!1334 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2570)

(assert (=> mapNonEmpty!7485 (= (arr!3734 (_values!3770 thiss!1248)) (store mapRest!7485 mapKey!7485 mapValue!7485))))

(declare-fun b!185804 () Bool)

(declare-fun res!87912 () Bool)

(declare-fun e!122251 () Bool)

(assert (=> b!185804 (=> (not res!87912) (not e!122251))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3456 0))(
  ( (tuple2!3457 (_1!1739 (_ BitVec 64)) (_2!1739 V!5445)) )
))
(declare-datatypes ((List!2367 0))(
  ( (Nil!2364) (Cons!2363 (h!2996 tuple2!3456) (t!7251 List!2367)) )
))
(declare-datatypes ((ListLongMap!2373 0))(
  ( (ListLongMap!2374 (toList!1202 List!2367)) )
))
(declare-fun contains!1298 (ListLongMap!2373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!850 (array!7907 array!7909 (_ BitVec 32) (_ BitVec 32) V!5445 V!5445 (_ BitVec 32) Int) ListLongMap!2373)

(assert (=> b!185804 (= res!87912 (not (contains!1298 (getCurrentListMap!850 (_keys!5728 thiss!1248) (_values!3770 thiss!1248) (mask!8900 thiss!1248) (extraKeys!3524 thiss!1248) (zeroValue!3628 thiss!1248) (minValue!3628 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3787 thiss!1248)) key!828)))))

(declare-fun b!185805 () Bool)

(declare-fun res!87910 () Bool)

(assert (=> b!185805 (=> (not res!87910) (not e!122251))))

(assert (=> b!185805 (= res!87910 (and (= (size!4050 (_values!3770 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8900 thiss!1248))) (= (size!4049 (_keys!5728 thiss!1248)) (size!4050 (_values!3770 thiss!1248))) (bvsge (mask!8900 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3524 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3524 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7485 () Bool)

(assert (=> mapIsEmpty!7485 mapRes!7485))

(declare-fun b!185806 () Bool)

(declare-fun e!122257 () Bool)

(assert (=> b!185806 (= e!122257 e!122251)))

(declare-fun res!87913 () Bool)

(assert (=> b!185806 (=> (not res!87913) (not e!122251))))

(declare-datatypes ((SeekEntryResult!637 0))(
  ( (MissingZero!637 (index!4718 (_ BitVec 32))) (Found!637 (index!4719 (_ BitVec 32))) (Intermediate!637 (undefined!1449 Bool) (index!4720 (_ BitVec 32)) (x!20167 (_ BitVec 32))) (Undefined!637) (MissingVacant!637 (index!4721 (_ BitVec 32))) )
))
(declare-fun lt!91868 () SeekEntryResult!637)

(assert (=> b!185806 (= res!87913 (and (not (is-Undefined!637 lt!91868)) (not (is-MissingVacant!637 lt!91868)) (not (is-MissingZero!637 lt!91868)) (is-Found!637 lt!91868)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7907 (_ BitVec 32)) SeekEntryResult!637)

(assert (=> b!185806 (= lt!91868 (seekEntryOrOpen!0 key!828 (_keys!5728 thiss!1248) (mask!8900 thiss!1248)))))

(declare-fun b!185807 () Bool)

(declare-fun e!122255 () Bool)

(declare-fun tp_is_empty!4349 () Bool)

(assert (=> b!185807 (= e!122255 tp_is_empty!4349)))

(declare-fun b!185808 () Bool)

(declare-fun e!122253 () Bool)

(assert (=> b!185808 (= e!122253 (and e!122255 mapRes!7485))))

(declare-fun condMapEmpty!7485 () Bool)

(declare-fun mapDefault!7485 () ValueCell!1831)

