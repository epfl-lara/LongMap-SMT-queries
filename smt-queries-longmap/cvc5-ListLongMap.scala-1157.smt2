; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24290 () Bool)

(assert start!24290)

(declare-fun b!254573 () Bool)

(declare-fun b_free!6691 () Bool)

(declare-fun b_next!6691 () Bool)

(assert (=> b!254573 (= b_free!6691 (not b_next!6691))))

(declare-fun tp!23361 () Bool)

(declare-fun b_and!13733 () Bool)

(assert (=> b!254573 (= tp!23361 b_and!13733)))

(declare-fun res!124623 () Bool)

(declare-fun e!165019 () Bool)

(assert (=> start!24290 (=> (not res!124623) (not e!165019))))

(declare-datatypes ((V!8385 0))(
  ( (V!8386 (val!3321 Int)) )
))
(declare-datatypes ((ValueCell!2933 0))(
  ( (ValueCellFull!2933 (v!5395 V!8385)) (EmptyCell!2933) )
))
(declare-datatypes ((array!12437 0))(
  ( (array!12438 (arr!5894 (Array (_ BitVec 32) ValueCell!2933)) (size!6241 (_ BitVec 32))) )
))
(declare-datatypes ((array!12439 0))(
  ( (array!12440 (arr!5895 (Array (_ BitVec 32) (_ BitVec 64))) (size!6242 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3766 0))(
  ( (LongMapFixedSize!3767 (defaultEntry!4696 Int) (mask!10944 (_ BitVec 32)) (extraKeys!4433 (_ BitVec 32)) (zeroValue!4537 V!8385) (minValue!4537 V!8385) (_size!1932 (_ BitVec 32)) (_keys!6850 array!12439) (_values!4679 array!12437) (_vacant!1932 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3766)

(declare-fun valid!1472 (LongMapFixedSize!3766) Bool)

(assert (=> start!24290 (= res!124623 (valid!1472 thiss!1504))))

(assert (=> start!24290 e!165019))

(declare-fun e!165011 () Bool)

(assert (=> start!24290 e!165011))

(assert (=> start!24290 true))

(declare-fun tp_is_empty!6553 () Bool)

(assert (=> start!24290 tp_is_empty!6553))

(declare-fun b!254564 () Bool)

(declare-fun res!124621 () Bool)

(declare-fun e!165015 () Bool)

(assert (=> b!254564 (=> (not res!124621) (not e!165015))))

(declare-datatypes ((SeekEntryResult!1151 0))(
  ( (MissingZero!1151 (index!6774 (_ BitVec 32))) (Found!1151 (index!6775 (_ BitVec 32))) (Intermediate!1151 (undefined!1963 Bool) (index!6776 (_ BitVec 32)) (x!24875 (_ BitVec 32))) (Undefined!1151) (MissingVacant!1151 (index!6777 (_ BitVec 32))) )
))
(declare-fun lt!127561 () SeekEntryResult!1151)

(assert (=> b!254564 (= res!124621 (= (select (arr!5895 (_keys!6850 thiss!1504)) (index!6774 lt!127561)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254565 () Bool)

(declare-fun e!165007 () Bool)

(declare-fun call!24018 () Bool)

(assert (=> b!254565 (= e!165007 (not call!24018))))

(declare-fun b!254566 () Bool)

(declare-fun res!124620 () Bool)

(assert (=> b!254566 (=> (not res!124620) (not e!165019))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!254566 (= res!124620 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254567 () Bool)

(declare-fun e!165012 () Bool)

(assert (=> b!254567 (= e!165012 (is-Undefined!1151 lt!127561))))

(declare-fun b!254568 () Bool)

(declare-fun res!124622 () Bool)

(assert (=> b!254568 (= res!124622 (= (select (arr!5895 (_keys!6850 thiss!1504)) (index!6777 lt!127561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254568 (=> (not res!124622) (not e!165007))))

(declare-fun mapNonEmpty!11145 () Bool)

(declare-fun mapRes!11145 () Bool)

(declare-fun tp!23360 () Bool)

(declare-fun e!165018 () Bool)

(assert (=> mapNonEmpty!11145 (= mapRes!11145 (and tp!23360 e!165018))))

(declare-fun mapKey!11145 () (_ BitVec 32))

(declare-fun mapValue!11145 () ValueCell!2933)

(declare-fun mapRest!11145 () (Array (_ BitVec 32) ValueCell!2933))

(assert (=> mapNonEmpty!11145 (= (arr!5894 (_values!4679 thiss!1504)) (store mapRest!11145 mapKey!11145 mapValue!11145))))

(declare-fun b!254569 () Bool)

(declare-fun e!165009 () Bool)

(declare-fun e!165008 () Bool)

(assert (=> b!254569 (= e!165009 e!165008)))

(declare-fun res!124618 () Bool)

(assert (=> b!254569 (=> (not res!124618) (not e!165008))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254569 (= res!124618 (inRange!0 index!297 (mask!10944 thiss!1504)))))

(declare-datatypes ((Unit!7891 0))(
  ( (Unit!7892) )
))
(declare-fun lt!127568 () Unit!7891)

(declare-fun e!165006 () Unit!7891)

(assert (=> b!254569 (= lt!127568 e!165006)))

(declare-fun c!42938 () Bool)

(declare-datatypes ((tuple2!4890 0))(
  ( (tuple2!4891 (_1!2456 (_ BitVec 64)) (_2!2456 V!8385)) )
))
(declare-datatypes ((List!3772 0))(
  ( (Nil!3769) (Cons!3768 (h!4430 tuple2!4890) (t!8819 List!3772)) )
))
(declare-datatypes ((ListLongMap!3803 0))(
  ( (ListLongMap!3804 (toList!1917 List!3772)) )
))
(declare-fun lt!127562 () ListLongMap!3803)

(declare-fun contains!1847 (ListLongMap!3803 (_ BitVec 64)) Bool)

(assert (=> b!254569 (= c!42938 (contains!1847 lt!127562 key!932))))

(declare-fun getCurrentListMap!1445 (array!12439 array!12437 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) Int) ListLongMap!3803)

(assert (=> b!254569 (= lt!127562 (getCurrentListMap!1445 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun b!254570 () Bool)

(assert (=> b!254570 (= e!165019 e!165009)))

(declare-fun res!124616 () Bool)

(assert (=> b!254570 (=> (not res!124616) (not e!165009))))

(assert (=> b!254570 (= res!124616 (or (= lt!127561 (MissingZero!1151 index!297)) (= lt!127561 (MissingVacant!1151 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12439 (_ BitVec 32)) SeekEntryResult!1151)

(assert (=> b!254570 (= lt!127561 (seekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(declare-fun b!254571 () Bool)

(declare-fun e!165017 () Bool)

(assert (=> b!254571 (= e!165017 tp_is_empty!6553)))

(declare-fun b!254572 () Bool)

(declare-fun Unit!7893 () Unit!7891)

(assert (=> b!254572 (= e!165006 Unit!7893)))

(declare-fun lt!127567 () Unit!7891)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (array!12439 array!12437 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7891)

(assert (=> b!254572 (= lt!127567 (lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254572 false))

(declare-fun e!165010 () Bool)

(declare-fun array_inv!3897 (array!12439) Bool)

(declare-fun array_inv!3898 (array!12437) Bool)

(assert (=> b!254573 (= e!165011 (and tp!23361 tp_is_empty!6553 (array_inv!3897 (_keys!6850 thiss!1504)) (array_inv!3898 (_values!4679 thiss!1504)) e!165010))))

(declare-fun b!254574 () Bool)

(declare-fun res!124619 () Bool)

(assert (=> b!254574 (=> (not res!124619) (not e!165015))))

(declare-fun call!24019 () Bool)

(assert (=> b!254574 (= res!124619 call!24019)))

(declare-fun e!165013 () Bool)

(assert (=> b!254574 (= e!165013 e!165015)))

(declare-fun b!254575 () Bool)

(declare-fun c!42935 () Bool)

(assert (=> b!254575 (= c!42935 (is-MissingVacant!1151 lt!127561))))

(assert (=> b!254575 (= e!165013 e!165012)))

(declare-fun b!254576 () Bool)

(declare-fun e!165016 () Unit!7891)

(declare-fun Unit!7894 () Unit!7891)

(assert (=> b!254576 (= e!165016 Unit!7894)))

(declare-fun b!254577 () Bool)

(assert (=> b!254577 (= e!165012 e!165007)))

(declare-fun res!124617 () Bool)

(assert (=> b!254577 (= res!124617 call!24019)))

(assert (=> b!254577 (=> (not res!124617) (not e!165007))))

(declare-fun b!254578 () Bool)

(declare-fun lt!127563 () Unit!7891)

(assert (=> b!254578 (= e!165006 lt!127563)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!421 (array!12439 array!12437 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7891)

(assert (=> b!254578 (= lt!127563 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!421 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(declare-fun c!42937 () Bool)

(assert (=> b!254578 (= c!42937 (is-MissingZero!1151 lt!127561))))

(assert (=> b!254578 e!165013))

(declare-fun b!254579 () Bool)

(assert (=> b!254579 (= e!165015 (not call!24018))))

(declare-fun b!254580 () Bool)

(declare-fun Unit!7895 () Unit!7891)

(assert (=> b!254580 (= e!165016 Unit!7895)))

(declare-fun lt!127557 () Unit!7891)

(declare-fun lemmaArrayContainsKeyThenInListMap!224 (array!12439 array!12437 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) (_ BitVec 32) Int) Unit!7891)

(assert (=> b!254580 (= lt!127557 (lemmaArrayContainsKeyThenInListMap!224 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254580 false))

(declare-fun b!254581 () Bool)

(assert (=> b!254581 (= e!165010 (and e!165017 mapRes!11145))))

(declare-fun condMapEmpty!11145 () Bool)

(declare-fun mapDefault!11145 () ValueCell!2933)

