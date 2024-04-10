; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21856 () Bool)

(assert start!21856)

(declare-fun b!220465 () Bool)

(declare-fun b_free!5923 () Bool)

(declare-fun b_next!5923 () Bool)

(assert (=> b!220465 (= b_free!5923 (not b_next!5923))))

(declare-fun tp!20911 () Bool)

(declare-fun b_and!12821 () Bool)

(assert (=> b!220465 (= tp!20911 b_and!12821)))

(declare-fun b!220456 () Bool)

(declare-fun e!143342 () Bool)

(declare-fun e!143346 () Bool)

(assert (=> b!220456 (= e!143342 e!143346)))

(declare-fun res!108107 () Bool)

(assert (=> b!220456 (=> (not res!108107) (not e!143346))))

(declare-datatypes ((SeekEntryResult!812 0))(
  ( (MissingZero!812 (index!5418 (_ BitVec 32))) (Found!812 (index!5419 (_ BitVec 32))) (Intermediate!812 (undefined!1624 Bool) (index!5420 (_ BitVec 32)) (x!22960 (_ BitVec 32))) (Undefined!812) (MissingVacant!812 (index!5421 (_ BitVec 32))) )
))
(declare-fun lt!112186 () SeekEntryResult!812)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220456 (= res!108107 (or (= lt!112186 (MissingZero!812 index!297)) (= lt!112186 (MissingVacant!812 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7361 0))(
  ( (V!7362 (val!2937 Int)) )
))
(declare-datatypes ((ValueCell!2549 0))(
  ( (ValueCellFull!2549 (v!4957 V!7361)) (EmptyCell!2549) )
))
(declare-datatypes ((array!10813 0))(
  ( (array!10814 (arr!5126 (Array (_ BitVec 32) ValueCell!2549)) (size!5459 (_ BitVec 32))) )
))
(declare-datatypes ((array!10815 0))(
  ( (array!10816 (arr!5127 (Array (_ BitVec 32) (_ BitVec 64))) (size!5460 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2998 0))(
  ( (LongMapFixedSize!2999 (defaultEntry!4158 Int) (mask!9960 (_ BitVec 32)) (extraKeys!3895 (_ BitVec 32)) (zeroValue!3999 V!7361) (minValue!3999 V!7361) (_size!1548 (_ BitVec 32)) (_keys!6212 array!10815) (_values!4141 array!10813) (_vacant!1548 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2998)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10815 (_ BitVec 32)) SeekEntryResult!812)

(assert (=> b!220456 (= lt!112186 (seekEntryOrOpen!0 key!932 (_keys!6212 thiss!1504) (mask!9960 thiss!1504)))))

(declare-fun b!220457 () Bool)

(declare-fun e!143339 () Bool)

(declare-fun tp_is_empty!5785 () Bool)

(assert (=> b!220457 (= e!143339 tp_is_empty!5785)))

(declare-fun b!220458 () Bool)

(declare-fun e!143340 () Bool)

(assert (=> b!220458 (= e!143346 e!143340)))

(declare-fun res!108099 () Bool)

(assert (=> b!220458 (=> (not res!108099) (not e!143340))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220458 (= res!108099 (inRange!0 index!297 (mask!9960 thiss!1504)))))

(declare-datatypes ((Unit!6574 0))(
  ( (Unit!6575) )
))
(declare-fun lt!112184 () Unit!6574)

(declare-fun e!143336 () Unit!6574)

(assert (=> b!220458 (= lt!112184 e!143336)))

(declare-fun c!36686 () Bool)

(declare-datatypes ((tuple2!4358 0))(
  ( (tuple2!4359 (_1!2190 (_ BitVec 64)) (_2!2190 V!7361)) )
))
(declare-datatypes ((List!3261 0))(
  ( (Nil!3258) (Cons!3257 (h!3905 tuple2!4358) (t!8220 List!3261)) )
))
(declare-datatypes ((ListLongMap!3271 0))(
  ( (ListLongMap!3272 (toList!1651 List!3261)) )
))
(declare-fun contains!1494 (ListLongMap!3271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1179 (array!10815 array!10813 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 32) Int) ListLongMap!3271)

(assert (=> b!220458 (= c!36686 (contains!1494 (getCurrentListMap!1179 (_keys!6212 thiss!1504) (_values!4141 thiss!1504) (mask!9960 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4158 thiss!1504)) key!932))))

(declare-fun b!220459 () Bool)

(declare-fun res!108103 () Bool)

(assert (=> b!220459 (=> (not res!108103) (not e!143342))))

(assert (=> b!220459 (= res!108103 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220460 () Bool)

(declare-fun e!143343 () Bool)

(declare-fun mapRes!9847 () Bool)

(assert (=> b!220460 (= e!143343 (and e!143339 mapRes!9847))))

(declare-fun condMapEmpty!9847 () Bool)

(declare-fun mapDefault!9847 () ValueCell!2549)

