; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22204 () Bool)

(assert start!22204)

(declare-fun b!232822 () Bool)

(declare-fun b_free!6271 () Bool)

(declare-fun b_next!6271 () Bool)

(assert (=> b!232822 (= b_free!6271 (not b_next!6271))))

(declare-fun tp!21954 () Bool)

(declare-fun b_and!13169 () Bool)

(assert (=> b!232822 (= tp!21954 b_and!13169)))

(declare-fun b!232811 () Bool)

(declare-fun res!114295 () Bool)

(declare-fun e!151210 () Bool)

(assert (=> b!232811 (=> (not res!114295) (not e!151210))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!232811 (= res!114295 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232812 () Bool)

(declare-fun e!151220 () Bool)

(declare-fun call!21648 () Bool)

(assert (=> b!232812 (= e!151220 (not call!21648))))

(declare-fun bm!21644 () Bool)

(declare-datatypes ((V!7825 0))(
  ( (V!7826 (val!3111 Int)) )
))
(declare-datatypes ((ValueCell!2723 0))(
  ( (ValueCellFull!2723 (v!5131 V!7825)) (EmptyCell!2723) )
))
(declare-datatypes ((array!11509 0))(
  ( (array!11510 (arr!5474 (Array (_ BitVec 32) ValueCell!2723)) (size!5807 (_ BitVec 32))) )
))
(declare-datatypes ((array!11511 0))(
  ( (array!11512 (arr!5475 (Array (_ BitVec 32) (_ BitVec 64))) (size!5808 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3346 0))(
  ( (LongMapFixedSize!3347 (defaultEntry!4332 Int) (mask!10250 (_ BitVec 32)) (extraKeys!4069 (_ BitVec 32)) (zeroValue!4173 V!7825) (minValue!4173 V!7825) (_size!1722 (_ BitVec 32)) (_keys!6386 array!11511) (_values!4315 array!11509) (_vacant!1722 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3346)

(declare-fun arrayContainsKey!0 (array!11511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21644 (= call!21648 (arrayContainsKey!0 (_keys!6386 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232813 () Bool)

(declare-fun e!151218 () Bool)

(declare-fun tp_is_empty!6133 () Bool)

(assert (=> b!232813 (= e!151218 tp_is_empty!6133)))

(declare-fun b!232814 () Bool)

(declare-datatypes ((Unit!7196 0))(
  ( (Unit!7197) )
))
(declare-fun e!151207 () Unit!7196)

(declare-fun Unit!7198 () Unit!7196)

(assert (=> b!232814 (= e!151207 Unit!7198)))

(declare-fun b!232815 () Bool)

(declare-fun c!38722 () Bool)

(declare-datatypes ((SeekEntryResult!970 0))(
  ( (MissingZero!970 (index!6050 (_ BitVec 32))) (Found!970 (index!6051 (_ BitVec 32))) (Intermediate!970 (undefined!1782 Bool) (index!6052 (_ BitVec 32)) (x!23582 (_ BitVec 32))) (Undefined!970) (MissingVacant!970 (index!6053 (_ BitVec 32))) )
))
(declare-fun lt!117746 () SeekEntryResult!970)

(assert (=> b!232815 (= c!38722 (is-MissingVacant!970 lt!117746))))

(declare-fun e!151219 () Bool)

(declare-fun e!151216 () Bool)

(assert (=> b!232815 (= e!151219 e!151216)))

(declare-fun b!232816 () Bool)

(declare-fun e!151208 () Bool)

(declare-fun e!151211 () Bool)

(assert (=> b!232816 (= e!151208 e!151211)))

(declare-fun res!114293 () Bool)

(assert (=> b!232816 (=> (not res!114293) (not e!151211))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232816 (= res!114293 (inRange!0 index!297 (mask!10250 thiss!1504)))))

(declare-fun lt!117731 () Unit!7196)

(declare-fun e!151217 () Unit!7196)

(assert (=> b!232816 (= lt!117731 e!151217)))

(declare-fun c!38723 () Bool)

(declare-datatypes ((tuple2!4592 0))(
  ( (tuple2!4593 (_1!2307 (_ BitVec 64)) (_2!2307 V!7825)) )
))
(declare-datatypes ((List!3508 0))(
  ( (Nil!3505) (Cons!3504 (h!4152 tuple2!4592) (t!8467 List!3508)) )
))
(declare-datatypes ((ListLongMap!3505 0))(
  ( (ListLongMap!3506 (toList!1768 List!3508)) )
))
(declare-fun lt!117747 () ListLongMap!3505)

(declare-fun contains!1636 (ListLongMap!3505 (_ BitVec 64)) Bool)

(assert (=> b!232816 (= c!38723 (contains!1636 lt!117747 key!932))))

(declare-fun getCurrentListMap!1296 (array!11511 array!11509 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) Int) ListLongMap!3505)

(assert (=> b!232816 (= lt!117747 (getCurrentListMap!1296 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(declare-fun b!232817 () Bool)

(declare-fun e!151206 () Bool)

(assert (=> b!232817 (= e!151206 tp_is_empty!6133)))

(declare-fun mapIsEmpty!10369 () Bool)

(declare-fun mapRes!10369 () Bool)

(assert (=> mapIsEmpty!10369 mapRes!10369))

(declare-fun b!232818 () Bool)

(declare-fun res!114298 () Bool)

(assert (=> b!232818 (=> (not res!114298) (not e!151220))))

(declare-fun call!21647 () Bool)

(assert (=> b!232818 (= res!114298 call!21647)))

(assert (=> b!232818 (= e!151219 e!151220)))

(declare-fun res!114301 () Bool)

(assert (=> start!22204 (=> (not res!114301) (not e!151210))))

(declare-fun valid!1323 (LongMapFixedSize!3346) Bool)

(assert (=> start!22204 (= res!114301 (valid!1323 thiss!1504))))

(assert (=> start!22204 e!151210))

(declare-fun e!151209 () Bool)

(assert (=> start!22204 e!151209))

(assert (=> start!22204 true))

(assert (=> start!22204 tp_is_empty!6133))

(declare-fun b!232819 () Bool)

(declare-fun e!151212 () Bool)

(assert (=> b!232819 (= e!151212 true)))

(declare-fun lt!117744 () Bool)

(declare-fun lt!117734 () LongMapFixedSize!3346)

(declare-fun map!2581 (LongMapFixedSize!3346) ListLongMap!3505)

(assert (=> b!232819 (= lt!117744 (contains!1636 (map!2581 lt!117734) key!932))))

(declare-fun b!232820 () Bool)

(declare-fun res!114300 () Bool)

(assert (=> b!232820 (=> (not res!114300) (not e!151220))))

(assert (=> b!232820 (= res!114300 (= (select (arr!5475 (_keys!6386 thiss!1504)) (index!6050 lt!117746)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232821 () Bool)

(declare-fun e!151213 () Bool)

(assert (=> b!232821 (= e!151216 e!151213)))

(declare-fun res!114296 () Bool)

(assert (=> b!232821 (= res!114296 call!21647)))

(assert (=> b!232821 (=> (not res!114296) (not e!151213))))

(declare-fun e!151215 () Bool)

(declare-fun array_inv!3609 (array!11511) Bool)

(declare-fun array_inv!3610 (array!11509) Bool)

(assert (=> b!232822 (= e!151209 (and tp!21954 tp_is_empty!6133 (array_inv!3609 (_keys!6386 thiss!1504)) (array_inv!3610 (_values!4315 thiss!1504)) e!151215))))

(declare-fun mapNonEmpty!10369 () Bool)

(declare-fun tp!21955 () Bool)

(assert (=> mapNonEmpty!10369 (= mapRes!10369 (and tp!21955 e!151206))))

(declare-fun mapKey!10369 () (_ BitVec 32))

(declare-fun mapValue!10369 () ValueCell!2723)

(declare-fun mapRest!10369 () (Array (_ BitVec 32) ValueCell!2723))

(assert (=> mapNonEmpty!10369 (= (arr!5474 (_values!4315 thiss!1504)) (store mapRest!10369 mapKey!10369 mapValue!10369))))

(declare-fun bm!21645 () Bool)

(declare-fun c!38724 () Bool)

(assert (=> bm!21645 (= call!21647 (inRange!0 (ite c!38724 (index!6050 lt!117746) (index!6053 lt!117746)) (mask!10250 thiss!1504)))))

(declare-fun b!232823 () Bool)

(assert (=> b!232823 (= e!151216 (is-Undefined!970 lt!117746))))

(declare-fun b!232824 () Bool)

(declare-fun lt!117738 () Unit!7196)

(assert (=> b!232824 (= e!151217 lt!117738)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!329 (array!11511 array!11509 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) Int) Unit!7196)

(assert (=> b!232824 (= lt!117738 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!329 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232824 (= c!38724 (is-MissingZero!970 lt!117746))))

(assert (=> b!232824 e!151219))

(declare-fun b!232825 () Bool)

(declare-fun Unit!7199 () Unit!7196)

(assert (=> b!232825 (= e!151207 Unit!7199)))

(declare-fun lt!117739 () Unit!7196)

(declare-fun lemmaArrayContainsKeyThenInListMap!147 (array!11511 array!11509 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) (_ BitVec 32) Int) Unit!7196)

(assert (=> b!232825 (= lt!117739 (lemmaArrayContainsKeyThenInListMap!147 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232825 false))

(declare-fun b!232826 () Bool)

(assert (=> b!232826 (= e!151210 e!151208)))

(declare-fun res!114297 () Bool)

(assert (=> b!232826 (=> (not res!114297) (not e!151208))))

(assert (=> b!232826 (= res!114297 (or (= lt!117746 (MissingZero!970 index!297)) (= lt!117746 (MissingVacant!970 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11511 (_ BitVec 32)) SeekEntryResult!970)

(assert (=> b!232826 (= lt!117746 (seekEntryOrOpen!0 key!932 (_keys!6386 thiss!1504) (mask!10250 thiss!1504)))))

(declare-fun b!232827 () Bool)

(assert (=> b!232827 (= e!151215 (and e!151218 mapRes!10369))))

(declare-fun condMapEmpty!10369 () Bool)

(declare-fun mapDefault!10369 () ValueCell!2723)

