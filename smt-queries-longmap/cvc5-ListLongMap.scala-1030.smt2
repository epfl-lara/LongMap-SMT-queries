; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21862 () Bool)

(assert start!21862)

(declare-fun b!220667 () Bool)

(declare-fun b_free!5929 () Bool)

(declare-fun b_next!5929 () Bool)

(assert (=> b!220667 (= b_free!5929 (not b_next!5929))))

(declare-fun tp!20929 () Bool)

(declare-fun b_and!12827 () Bool)

(assert (=> b!220667 (= tp!20929 b_and!12827)))

(declare-fun b!220654 () Bool)

(declare-fun res!108215 () Bool)

(declare-fun e!143459 () Bool)

(assert (=> b!220654 (=> (not res!108215) (not e!143459))))

(declare-datatypes ((V!7369 0))(
  ( (V!7370 (val!2940 Int)) )
))
(declare-datatypes ((ValueCell!2552 0))(
  ( (ValueCellFull!2552 (v!4960 V!7369)) (EmptyCell!2552) )
))
(declare-datatypes ((array!10825 0))(
  ( (array!10826 (arr!5132 (Array (_ BitVec 32) ValueCell!2552)) (size!5465 (_ BitVec 32))) )
))
(declare-datatypes ((array!10827 0))(
  ( (array!10828 (arr!5133 (Array (_ BitVec 32) (_ BitVec 64))) (size!5466 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3004 0))(
  ( (LongMapFixedSize!3005 (defaultEntry!4161 Int) (mask!9965 (_ BitVec 32)) (extraKeys!3898 (_ BitVec 32)) (zeroValue!4002 V!7369) (minValue!4002 V!7369) (_size!1551 (_ BitVec 32)) (_keys!6215 array!10827) (_values!4144 array!10825) (_vacant!1551 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3004)

(assert (=> b!220654 (= res!108215 (and (= (size!5465 (_values!4144 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9965 thiss!1504))) (= (size!5466 (_keys!6215 thiss!1504)) (size!5465 (_values!4144 thiss!1504))) (bvsge (mask!9965 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3898 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3898 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220655 () Bool)

(assert (=> b!220655 (= e!143459 false)))

(declare-fun lt!112232 () Bool)

(declare-datatypes ((List!3264 0))(
  ( (Nil!3261) (Cons!3260 (h!3908 (_ BitVec 64)) (t!8223 List!3264)) )
))
(declare-fun arrayNoDuplicates!0 (array!10827 (_ BitVec 32) List!3264) Bool)

(assert (=> b!220655 (= lt!112232 (arrayNoDuplicates!0 (_keys!6215 thiss!1504) #b00000000000000000000000000000000 Nil!3261))))

(declare-fun b!220656 () Bool)

(declare-fun res!108214 () Bool)

(declare-fun e!143465 () Bool)

(assert (=> b!220656 (=> (not res!108214) (not e!143465))))

(declare-datatypes ((SeekEntryResult!814 0))(
  ( (MissingZero!814 (index!5426 (_ BitVec 32))) (Found!814 (index!5427 (_ BitVec 32))) (Intermediate!814 (undefined!1626 Bool) (index!5428 (_ BitVec 32)) (x!22970 (_ BitVec 32))) (Undefined!814) (MissingVacant!814 (index!5429 (_ BitVec 32))) )
))
(declare-fun lt!112229 () SeekEntryResult!814)

(assert (=> b!220656 (= res!108214 (= (select (arr!5133 (_keys!6215 thiss!1504)) (index!5426 lt!112229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220657 () Bool)

(declare-fun call!20621 () Bool)

(assert (=> b!220657 (= e!143465 (not call!20621))))

(declare-fun b!220658 () Bool)

(declare-fun res!108207 () Bool)

(assert (=> b!220658 (=> (not res!108207) (not e!143459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10827 (_ BitVec 32)) Bool)

(assert (=> b!220658 (= res!108207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6215 thiss!1504) (mask!9965 thiss!1504)))))

(declare-fun b!220659 () Bool)

(declare-fun res!108209 () Bool)

(assert (=> b!220659 (=> (not res!108209) (not e!143459))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220659 (= res!108209 (arrayContainsKey!0 (_keys!6215 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220660 () Bool)

(declare-fun e!143455 () Bool)

(declare-fun e!143464 () Bool)

(assert (=> b!220660 (= e!143455 e!143464)))

(declare-fun res!108212 () Bool)

(assert (=> b!220660 (=> (not res!108212) (not e!143464))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220660 (= res!108212 (or (= lt!112229 (MissingZero!814 index!297)) (= lt!112229 (MissingVacant!814 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10827 (_ BitVec 32)) SeekEntryResult!814)

(assert (=> b!220660 (= lt!112229 (seekEntryOrOpen!0 key!932 (_keys!6215 thiss!1504) (mask!9965 thiss!1504)))))

(declare-fun b!220661 () Bool)

(declare-datatypes ((Unit!6582 0))(
  ( (Unit!6583) )
))
(declare-fun e!143462 () Unit!6582)

(declare-fun Unit!6584 () Unit!6582)

(assert (=> b!220661 (= e!143462 Unit!6584)))

(declare-fun lt!112230 () Unit!6582)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!205 (array!10827 array!10825 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 64) Int) Unit!6582)

(assert (=> b!220661 (= lt!112230 (lemmaInListMapThenSeekEntryOrOpenFindsIt!205 (_keys!6215 thiss!1504) (_values!4144 thiss!1504) (mask!9965 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) key!932 (defaultEntry!4161 thiss!1504)))))

(assert (=> b!220661 false))

(declare-fun b!220662 () Bool)

(declare-fun res!108211 () Bool)

(assert (=> b!220662 (=> (not res!108211) (not e!143459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220662 (= res!108211 (validMask!0 (mask!9965 thiss!1504)))))

(declare-fun b!220663 () Bool)

(declare-fun res!108208 () Bool)

(assert (=> b!220663 (=> (not res!108208) (not e!143455))))

(assert (=> b!220663 (= res!108208 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220664 () Bool)

(declare-fun e!143461 () Bool)

(declare-fun tp_is_empty!5791 () Bool)

(assert (=> b!220664 (= e!143461 tp_is_empty!5791)))

(declare-fun b!220665 () Bool)

(declare-fun c!36713 () Bool)

(assert (=> b!220665 (= c!36713 (is-MissingVacant!814 lt!112229))))

(declare-fun e!143458 () Bool)

(declare-fun e!143457 () Bool)

(assert (=> b!220665 (= e!143458 e!143457)))

(declare-fun b!220666 () Bool)

(declare-fun lt!112228 () Unit!6582)

(assert (=> b!220666 (= e!143462 lt!112228)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!217 (array!10827 array!10825 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 64) Int) Unit!6582)

(assert (=> b!220666 (= lt!112228 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!217 (_keys!6215 thiss!1504) (_values!4144 thiss!1504) (mask!9965 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) key!932 (defaultEntry!4161 thiss!1504)))))

(declare-fun c!36712 () Bool)

(assert (=> b!220666 (= c!36712 (is-MissingZero!814 lt!112229))))

(assert (=> b!220666 e!143458))

(declare-fun e!143454 () Bool)

(declare-fun e!143453 () Bool)

(declare-fun array_inv!3395 (array!10827) Bool)

(declare-fun array_inv!3396 (array!10825) Bool)

(assert (=> b!220667 (= e!143454 (and tp!20929 tp_is_empty!5791 (array_inv!3395 (_keys!6215 thiss!1504)) (array_inv!3396 (_values!4144 thiss!1504)) e!143453))))

(declare-fun mapNonEmpty!9856 () Bool)

(declare-fun mapRes!9856 () Bool)

(declare-fun tp!20928 () Bool)

(assert (=> mapNonEmpty!9856 (= mapRes!9856 (and tp!20928 e!143461))))

(declare-fun mapRest!9856 () (Array (_ BitVec 32) ValueCell!2552))

(declare-fun mapValue!9856 () ValueCell!2552)

(declare-fun mapKey!9856 () (_ BitVec 32))

(assert (=> mapNonEmpty!9856 (= (arr!5132 (_values!4144 thiss!1504)) (store mapRest!9856 mapKey!9856 mapValue!9856))))

(declare-fun mapIsEmpty!9856 () Bool)

(assert (=> mapIsEmpty!9856 mapRes!9856))

(declare-fun res!108217 () Bool)

(assert (=> start!21862 (=> (not res!108217) (not e!143455))))

(declare-fun valid!1211 (LongMapFixedSize!3004) Bool)

(assert (=> start!21862 (= res!108217 (valid!1211 thiss!1504))))

(assert (=> start!21862 e!143455))

(assert (=> start!21862 e!143454))

(assert (=> start!21862 true))

(declare-fun bm!20618 () Bool)

(assert (=> bm!20618 (= call!20621 (arrayContainsKey!0 (_keys!6215 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220668 () Bool)

(declare-fun e!143456 () Bool)

(assert (=> b!220668 (= e!143453 (and e!143456 mapRes!9856))))

(declare-fun condMapEmpty!9856 () Bool)

(declare-fun mapDefault!9856 () ValueCell!2552)

