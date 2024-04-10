; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22094 () Bool)

(assert start!22094)

(declare-fun b!229483 () Bool)

(declare-fun b_free!6161 () Bool)

(declare-fun b_next!6161 () Bool)

(assert (=> b!229483 (= b_free!6161 (not b_next!6161))))

(declare-fun tp!21624 () Bool)

(declare-fun b_and!13059 () Bool)

(assert (=> b!229483 (= tp!21624 b_and!13059)))

(declare-fun bm!21314 () Bool)

(declare-fun call!21318 () Bool)

(declare-datatypes ((V!7677 0))(
  ( (V!7678 (val!3056 Int)) )
))
(declare-datatypes ((ValueCell!2668 0))(
  ( (ValueCellFull!2668 (v!5076 V!7677)) (EmptyCell!2668) )
))
(declare-datatypes ((array!11289 0))(
  ( (array!11290 (arr!5364 (Array (_ BitVec 32) ValueCell!2668)) (size!5697 (_ BitVec 32))) )
))
(declare-datatypes ((array!11291 0))(
  ( (array!11292 (arr!5365 (Array (_ BitVec 32) (_ BitVec 64))) (size!5698 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3236 0))(
  ( (LongMapFixedSize!3237 (defaultEntry!4277 Int) (mask!10157 (_ BitVec 32)) (extraKeys!4014 (_ BitVec 32)) (zeroValue!4118 V!7677) (minValue!4118 V!7677) (_size!1667 (_ BitVec 32)) (_keys!6331 array!11291) (_values!4260 array!11289) (_vacant!1667 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3236)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21314 (= call!21318 (arrayContainsKey!0 (_keys!6331 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229470 () Bool)

(declare-fun res!112934 () Bool)

(declare-fun e!148879 () Bool)

(assert (=> b!229470 (=> res!112934 e!148879)))

(assert (=> b!229470 (= res!112934 (or (not (= (size!5697 (_values!4260 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10157 thiss!1504)))) (not (= (size!5698 (_keys!6331 thiss!1504)) (size!5697 (_values!4260 thiss!1504)))) (bvslt (mask!10157 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4014 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4014 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229471 () Bool)

(declare-datatypes ((Unit!7002 0))(
  ( (Unit!7003) )
))
(declare-fun e!148885 () Unit!7002)

(declare-fun Unit!7004 () Unit!7002)

(assert (=> b!229471 (= e!148885 Unit!7004)))

(declare-fun lt!115422 () Unit!7002)

(declare-fun lemmaArrayContainsKeyThenInListMap!116 (array!11291 array!11289 (_ BitVec 32) (_ BitVec 32) V!7677 V!7677 (_ BitVec 64) (_ BitVec 32) Int) Unit!7002)

(assert (=> b!229471 (= lt!115422 (lemmaArrayContainsKeyThenInListMap!116 (_keys!6331 thiss!1504) (_values!4260 thiss!1504) (mask!10157 thiss!1504) (extraKeys!4014 thiss!1504) (zeroValue!4118 thiss!1504) (minValue!4118 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4277 thiss!1504)))))

(assert (=> b!229471 false))

(declare-fun call!21317 () Bool)

(declare-fun bm!21315 () Bool)

(declare-fun c!38062 () Bool)

(declare-datatypes ((SeekEntryResult!922 0))(
  ( (MissingZero!922 (index!5858 (_ BitVec 32))) (Found!922 (index!5859 (_ BitVec 32))) (Intermediate!922 (undefined!1734 Bool) (index!5860 (_ BitVec 32)) (x!23382 (_ BitVec 32))) (Undefined!922) (MissingVacant!922 (index!5861 (_ BitVec 32))) )
))
(declare-fun lt!115425 () SeekEntryResult!922)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21315 (= call!21317 (inRange!0 (ite c!38062 (index!5858 lt!115425) (index!5861 lt!115425)) (mask!10157 thiss!1504)))))

(declare-fun b!229472 () Bool)

(declare-fun res!112933 () Bool)

(assert (=> b!229472 (=> res!112933 e!148879)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11291 (_ BitVec 32)) Bool)

(assert (=> b!229472 (= res!112933 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6331 thiss!1504) (mask!10157 thiss!1504))))))

(declare-fun b!229473 () Bool)

(declare-fun res!112939 () Bool)

(assert (=> b!229473 (= res!112939 (= (select (arr!5365 (_keys!6331 thiss!1504)) (index!5861 lt!115425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148889 () Bool)

(assert (=> b!229473 (=> (not res!112939) (not e!148889))))

(declare-fun b!229474 () Bool)

(declare-fun res!112932 () Bool)

(declare-fun e!148886 () Bool)

(assert (=> b!229474 (=> (not res!112932) (not e!148886))))

(assert (=> b!229474 (= res!112932 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229475 () Bool)

(declare-fun e!148882 () Bool)

(assert (=> b!229475 (= e!148886 e!148882)))

(declare-fun res!112938 () Bool)

(assert (=> b!229475 (=> (not res!112938) (not e!148882))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229475 (= res!112938 (or (= lt!115425 (MissingZero!922 index!297)) (= lt!115425 (MissingVacant!922 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11291 (_ BitVec 32)) SeekEntryResult!922)

(assert (=> b!229475 (= lt!115425 (seekEntryOrOpen!0 key!932 (_keys!6331 thiss!1504) (mask!10157 thiss!1504)))))

(declare-fun b!229476 () Bool)

(declare-fun e!148883 () Bool)

(declare-fun e!148877 () Bool)

(declare-fun mapRes!10204 () Bool)

(assert (=> b!229476 (= e!148883 (and e!148877 mapRes!10204))))

(declare-fun condMapEmpty!10204 () Bool)

(declare-fun mapDefault!10204 () ValueCell!2668)

