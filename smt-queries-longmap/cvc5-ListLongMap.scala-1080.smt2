; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22162 () Bool)

(assert start!22162)

(declare-fun b!231555 () Bool)

(declare-fun b_free!6229 () Bool)

(declare-fun b_next!6229 () Bool)

(assert (=> b!231555 (= b_free!6229 (not b_next!6229))))

(declare-fun tp!21829 () Bool)

(declare-fun b_and!13127 () Bool)

(assert (=> b!231555 (= tp!21829 b_and!13127)))

(declare-fun b!231540 () Bool)

(declare-fun e!150323 () Bool)

(declare-fun e!150326 () Bool)

(assert (=> b!231540 (= e!150323 e!150326)))

(declare-fun res!113782 () Bool)

(assert (=> b!231540 (=> (not res!113782) (not e!150326))))

(declare-datatypes ((SeekEntryResult!952 0))(
  ( (MissingZero!952 (index!5978 (_ BitVec 32))) (Found!952 (index!5979 (_ BitVec 32))) (Intermediate!952 (undefined!1764 Bool) (index!5980 (_ BitVec 32)) (x!23508 (_ BitVec 32))) (Undefined!952) (MissingVacant!952 (index!5981 (_ BitVec 32))) )
))
(declare-fun lt!116747 () SeekEntryResult!952)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231540 (= res!113782 (or (= lt!116747 (MissingZero!952 index!297)) (= lt!116747 (MissingVacant!952 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7769 0))(
  ( (V!7770 (val!3090 Int)) )
))
(declare-datatypes ((ValueCell!2702 0))(
  ( (ValueCellFull!2702 (v!5110 V!7769)) (EmptyCell!2702) )
))
(declare-datatypes ((array!11425 0))(
  ( (array!11426 (arr!5432 (Array (_ BitVec 32) ValueCell!2702)) (size!5765 (_ BitVec 32))) )
))
(declare-datatypes ((array!11427 0))(
  ( (array!11428 (arr!5433 (Array (_ BitVec 32) (_ BitVec 64))) (size!5766 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3304 0))(
  ( (LongMapFixedSize!3305 (defaultEntry!4311 Int) (mask!10215 (_ BitVec 32)) (extraKeys!4048 (_ BitVec 32)) (zeroValue!4152 V!7769) (minValue!4152 V!7769) (_size!1701 (_ BitVec 32)) (_keys!6365 array!11427) (_values!4294 array!11425) (_vacant!1701 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3304)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11427 (_ BitVec 32)) SeekEntryResult!952)

(assert (=> b!231540 (= lt!116747 (seekEntryOrOpen!0 key!932 (_keys!6365 thiss!1504) (mask!10215 thiss!1504)))))

(declare-fun b!231541 () Bool)

(declare-fun res!113779 () Bool)

(declare-fun e!150319 () Bool)

(assert (=> b!231541 (=> (not res!113779) (not e!150319))))

(declare-fun call!21522 () Bool)

(assert (=> b!231541 (= res!113779 call!21522)))

(declare-fun e!150324 () Bool)

(assert (=> b!231541 (= e!150324 e!150319)))

(declare-fun b!231542 () Bool)

(declare-fun res!113781 () Bool)

(assert (=> b!231542 (=> (not res!113781) (not e!150323))))

(assert (=> b!231542 (= res!113781 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231543 () Bool)

(declare-fun res!113784 () Bool)

(assert (=> b!231543 (= res!113784 (= (select (arr!5433 (_keys!6365 thiss!1504)) (index!5981 lt!116747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150320 () Bool)

(assert (=> b!231543 (=> (not res!113784) (not e!150320))))

(declare-fun mapIsEmpty!10306 () Bool)

(declare-fun mapRes!10306 () Bool)

(assert (=> mapIsEmpty!10306 mapRes!10306))

(declare-fun b!231544 () Bool)

(declare-fun e!150321 () Bool)

(declare-fun tp_is_empty!6091 () Bool)

(assert (=> b!231544 (= e!150321 tp_is_empty!6091)))

(declare-fun bm!21518 () Bool)

(declare-fun c!38470 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21518 (= call!21522 (inRange!0 (ite c!38470 (index!5978 lt!116747) (index!5981 lt!116747)) (mask!10215 thiss!1504)))))

(declare-fun b!231545 () Bool)

(declare-fun e!150315 () Bool)

(assert (=> b!231545 (= e!150315 (and e!150321 mapRes!10306))))

(declare-fun condMapEmpty!10306 () Bool)

(declare-fun mapDefault!10306 () ValueCell!2702)

