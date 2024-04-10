; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23252 () Bool)

(assert start!23252)

(declare-fun b!244226 () Bool)

(declare-fun b_free!6535 () Bool)

(declare-fun b_next!6535 () Bool)

(assert (=> b!244226 (= b_free!6535 (not b_next!6535))))

(declare-fun tp!22831 () Bool)

(declare-fun b_and!13519 () Bool)

(assert (=> b!244226 (= tp!22831 b_and!13519)))

(declare-fun b!244204 () Bool)

(declare-datatypes ((Unit!7535 0))(
  ( (Unit!7536) )
))
(declare-fun e!158465 () Unit!7535)

(declare-fun Unit!7537 () Unit!7535)

(assert (=> b!244204 (= e!158465 Unit!7537)))

(declare-fun b!244205 () Bool)

(declare-fun res!119749 () Bool)

(declare-fun e!158469 () Bool)

(assert (=> b!244205 (=> (not res!119749) (not e!158469))))

(declare-fun call!22778 () Bool)

(assert (=> b!244205 (= res!119749 call!22778)))

(declare-fun e!158474 () Bool)

(assert (=> b!244205 (= e!158474 e!158469)))

(declare-fun c!40763 () Bool)

(declare-datatypes ((V!8177 0))(
  ( (V!8178 (val!3243 Int)) )
))
(declare-datatypes ((ValueCell!2855 0))(
  ( (ValueCellFull!2855 (v!5292 V!8177)) (EmptyCell!2855) )
))
(declare-datatypes ((array!12087 0))(
  ( (array!12088 (arr!5738 (Array (_ BitVec 32) ValueCell!2855)) (size!6080 (_ BitVec 32))) )
))
(declare-datatypes ((array!12089 0))(
  ( (array!12090 (arr!5739 (Array (_ BitVec 32) (_ BitVec 64))) (size!6081 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3610 0))(
  ( (LongMapFixedSize!3611 (defaultEntry!4522 Int) (mask!10621 (_ BitVec 32)) (extraKeys!4259 (_ BitVec 32)) (zeroValue!4363 V!8177) (minValue!4363 V!8177) (_size!1854 (_ BitVec 32)) (_keys!6634 array!12089) (_values!4505 array!12087) (_vacant!1854 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3610)

(declare-fun bm!22775 () Bool)

(declare-datatypes ((SeekEntryResult!1078 0))(
  ( (MissingZero!1078 (index!6482 (_ BitVec 32))) (Found!1078 (index!6483 (_ BitVec 32))) (Intermediate!1078 (undefined!1890 Bool) (index!6484 (_ BitVec 32)) (x!24364 (_ BitVec 32))) (Undefined!1078) (MissingVacant!1078 (index!6485 (_ BitVec 32))) )
))
(declare-fun lt!122440 () SeekEntryResult!1078)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22775 (= call!22778 (inRange!0 (ite c!40763 (index!6482 lt!122440) (index!6485 lt!122440)) (mask!10621 thiss!1504)))))

(declare-fun b!244206 () Bool)

(declare-fun e!158481 () Bool)

(declare-fun e!158476 () Bool)

(assert (=> b!244206 (= e!158481 e!158476)))

(declare-fun res!119758 () Bool)

(assert (=> b!244206 (= res!119758 call!22778)))

(assert (=> b!244206 (=> (not res!119758) (not e!158476))))

(declare-fun b!244207 () Bool)

(declare-fun res!119750 () Bool)

(assert (=> b!244207 (=> (not res!119750) (not e!158469))))

(assert (=> b!244207 (= res!119750 (= (select (arr!5739 (_keys!6634 thiss!1504)) (index!6482 lt!122440)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10849 () Bool)

(declare-fun mapRes!10849 () Bool)

(declare-fun tp!22830 () Bool)

(declare-fun e!158473 () Bool)

(assert (=> mapNonEmpty!10849 (= mapRes!10849 (and tp!22830 e!158473))))

(declare-fun mapKey!10849 () (_ BitVec 32))

(declare-fun mapValue!10849 () ValueCell!2855)

(declare-fun mapRest!10849 () (Array (_ BitVec 32) ValueCell!2855))

(assert (=> mapNonEmpty!10849 (= (arr!5738 (_values!4505 thiss!1504)) (store mapRest!10849 mapKey!10849 mapValue!10849))))

(declare-fun bm!22776 () Bool)

(declare-fun call!22779 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22776 (= call!22779 (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244208 () Bool)

(declare-fun e!158471 () Unit!7535)

(declare-fun lt!122442 () Unit!7535)

(assert (=> b!244208 (= e!158471 lt!122442)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (array!12089 array!12087 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7535)

(assert (=> b!244208 (= lt!122442 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244208 (= c!40763 (is-MissingZero!1078 lt!122440))))

(assert (=> b!244208 e!158474))

(declare-fun b!244209 () Bool)

(assert (=> b!244209 (= e!158469 (not call!22779))))

(declare-fun b!244210 () Bool)

(declare-fun e!158480 () Bool)

(declare-fun e!158475 () Bool)

(assert (=> b!244210 (= e!158480 e!158475)))

(declare-fun res!119746 () Bool)

(assert (=> b!244210 (=> (not res!119746) (not e!158475))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244210 (= res!119746 (inRange!0 index!297 (mask!10621 thiss!1504)))))

(declare-fun lt!122438 () Unit!7535)

(assert (=> b!244210 (= lt!122438 e!158471)))

(declare-fun c!40762 () Bool)

(declare-datatypes ((tuple2!4772 0))(
  ( (tuple2!4773 (_1!2397 (_ BitVec 64)) (_2!2397 V!8177)) )
))
(declare-datatypes ((List!3654 0))(
  ( (Nil!3651) (Cons!3650 (h!4307 tuple2!4772) (t!8663 List!3654)) )
))
(declare-datatypes ((ListLongMap!3685 0))(
  ( (ListLongMap!3686 (toList!1858 List!3654)) )
))
(declare-fun contains!1760 (ListLongMap!3685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1386 (array!12089 array!12087 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 32) Int) ListLongMap!3685)

(assert (=> b!244210 (= c!40762 (contains!1760 (getCurrentListMap!1386 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932))))

(declare-fun b!244212 () Bool)

(declare-fun e!158466 () Bool)

(declare-datatypes ((List!3655 0))(
  ( (Nil!3652) (Cons!3651 (h!4308 (_ BitVec 64)) (t!8664 List!3655)) )
))
(declare-fun contains!1761 (List!3655 (_ BitVec 64)) Bool)

(assert (=> b!244212 (= e!158466 (not (contains!1761 Nil!3652 key!932)))))

(declare-fun b!244213 () Bool)

(declare-fun Unit!7538 () Unit!7535)

(assert (=> b!244213 (= e!158471 Unit!7538)))

(declare-fun lt!122439 () Unit!7535)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!365 (array!12089 array!12087 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7535)

(assert (=> b!244213 (= lt!122439 (lemmaInListMapThenSeekEntryOrOpenFindsIt!365 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244213 false))

(declare-fun b!244214 () Bool)

(assert (=> b!244214 (= e!158476 (not call!22779))))

(declare-fun b!244215 () Bool)

(declare-fun e!158468 () Bool)

(assert (=> b!244215 (= e!158468 e!158466)))

(declare-fun res!119745 () Bool)

(assert (=> b!244215 (=> (not res!119745) (not e!158466))))

(assert (=> b!244215 (= res!119745 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244216 () Bool)

(declare-fun res!119747 () Bool)

(declare-fun e!158477 () Bool)

(assert (=> b!244216 (=> (not res!119747) (not e!158477))))

(assert (=> b!244216 (= res!119747 e!158468)))

(declare-fun res!119760 () Bool)

(assert (=> b!244216 (=> res!119760 e!158468)))

(declare-fun e!158464 () Bool)

(assert (=> b!244216 (= res!119760 e!158464)))

(declare-fun res!119755 () Bool)

(assert (=> b!244216 (=> (not res!119755) (not e!158464))))

(assert (=> b!244216 (= res!119755 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!244217 () Bool)

(declare-fun e!158470 () Bool)

(assert (=> b!244217 (= e!158470 e!158480)))

(declare-fun res!119756 () Bool)

(assert (=> b!244217 (=> (not res!119756) (not e!158480))))

(assert (=> b!244217 (= res!119756 (or (= lt!122440 (MissingZero!1078 index!297)) (= lt!122440 (MissingVacant!1078 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12089 (_ BitVec 32)) SeekEntryResult!1078)

(assert (=> b!244217 (= lt!122440 (seekEntryOrOpen!0 key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(declare-fun b!244218 () Bool)

(declare-fun c!40761 () Bool)

(assert (=> b!244218 (= c!40761 (is-MissingVacant!1078 lt!122440))))

(assert (=> b!244218 (= e!158474 e!158481)))

(declare-fun mapIsEmpty!10849 () Bool)

(assert (=> mapIsEmpty!10849 mapRes!10849))

(declare-fun b!244219 () Bool)

(assert (=> b!244219 (= e!158475 e!158477)))

(declare-fun res!119761 () Bool)

(assert (=> b!244219 (=> (not res!119761) (not e!158477))))

(assert (=> b!244219 (= res!119761 (and (bvslt (size!6081 (_keys!6634 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6081 (_keys!6634 thiss!1504)))))))

(declare-fun lt!122441 () Unit!7535)

(assert (=> b!244219 (= lt!122441 e!158465)))

(declare-fun c!40764 () Bool)

(assert (=> b!244219 (= c!40764 (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244220 () Bool)

(declare-fun res!119754 () Bool)

(assert (=> b!244220 (=> (not res!119754) (not e!158477))))

(assert (=> b!244220 (= res!119754 (not (contains!1761 Nil!3652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244221 () Bool)

(declare-fun res!119751 () Bool)

(assert (=> b!244221 (=> (not res!119751) (not e!158477))))

(assert (=> b!244221 (= res!119751 (not (contains!1761 Nil!3652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244222 () Bool)

(declare-fun res!119757 () Bool)

(assert (=> b!244222 (=> (not res!119757) (not e!158477))))

(declare-fun noDuplicate!100 (List!3655) Bool)

(assert (=> b!244222 (= res!119757 (noDuplicate!100 Nil!3652))))

(declare-fun res!119759 () Bool)

(assert (=> start!23252 (=> (not res!119759) (not e!158470))))

(declare-fun valid!1414 (LongMapFixedSize!3610) Bool)

(assert (=> start!23252 (= res!119759 (valid!1414 thiss!1504))))

(assert (=> start!23252 e!158470))

(declare-fun e!158472 () Bool)

(assert (=> start!23252 e!158472))

(assert (=> start!23252 true))

(declare-fun b!244211 () Bool)

(declare-fun Unit!7539 () Unit!7535)

(assert (=> b!244211 (= e!158465 Unit!7539)))

(declare-fun lt!122437 () Unit!7535)

(declare-fun lemmaArrayContainsKeyThenInListMap!168 (array!12089 array!12087 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) (_ BitVec 32) Int) Unit!7535)

(assert (=> b!244211 (= lt!122437 (lemmaArrayContainsKeyThenInListMap!168 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244211 false))

(declare-fun b!244223 () Bool)

(declare-fun res!119762 () Bool)

(assert (=> b!244223 (= res!119762 (= (select (arr!5739 (_keys!6634 thiss!1504)) (index!6485 lt!122440)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244223 (=> (not res!119762) (not e!158476))))

(declare-fun b!244224 () Bool)

(assert (=> b!244224 (= e!158481 (is-Undefined!1078 lt!122440))))

(declare-fun b!244225 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244225 (= e!158477 (not (validKeyInArray!0 key!932)))))

(declare-fun e!158479 () Bool)

(declare-fun tp_is_empty!6397 () Bool)

(declare-fun array_inv!3793 (array!12089) Bool)

(declare-fun array_inv!3794 (array!12087) Bool)

(assert (=> b!244226 (= e!158472 (and tp!22831 tp_is_empty!6397 (array_inv!3793 (_keys!6634 thiss!1504)) (array_inv!3794 (_values!4505 thiss!1504)) e!158479))))

(declare-fun b!244227 () Bool)

(declare-fun res!119748 () Bool)

(assert (=> b!244227 (=> (not res!119748) (not e!158477))))

(declare-fun arrayNoDuplicates!0 (array!12089 (_ BitVec 32) List!3655) Bool)

(assert (=> b!244227 (= res!119748 (arrayNoDuplicates!0 (_keys!6634 thiss!1504) #b00000000000000000000000000000000 Nil!3652))))

(declare-fun b!244228 () Bool)

(declare-fun res!119752 () Bool)

(assert (=> b!244228 (=> (not res!119752) (not e!158470))))

(assert (=> b!244228 (= res!119752 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244229 () Bool)

(assert (=> b!244229 (= e!158473 tp_is_empty!6397)))

(declare-fun b!244230 () Bool)

(declare-fun e!158467 () Bool)

(assert (=> b!244230 (= e!158479 (and e!158467 mapRes!10849))))

(declare-fun condMapEmpty!10849 () Bool)

(declare-fun mapDefault!10849 () ValueCell!2855)

