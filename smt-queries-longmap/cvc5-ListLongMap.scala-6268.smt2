; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80166 () Bool)

(assert start!80166)

(declare-fun b!941957 () Bool)

(declare-fun b_free!17929 () Bool)

(declare-fun b_next!17929 () Bool)

(assert (=> b!941957 (= b_free!17929 (not b_next!17929))))

(declare-fun tp!62279 () Bool)

(declare-fun b_and!29341 () Bool)

(assert (=> b!941957 (= tp!62279 b_and!29341)))

(declare-fun mapIsEmpty!32464 () Bool)

(declare-fun mapRes!32464 () Bool)

(assert (=> mapIsEmpty!32464 mapRes!32464))

(declare-fun b!941956 () Bool)

(declare-fun res!633085 () Bool)

(declare-fun e!529593 () Bool)

(assert (=> b!941956 (=> (not res!633085) (not e!529593))))

(declare-datatypes ((V!32215 0))(
  ( (V!32216 (val!10269 Int)) )
))
(declare-datatypes ((ValueCell!9737 0))(
  ( (ValueCellFull!9737 (v!12800 V!32215)) (EmptyCell!9737) )
))
(declare-datatypes ((array!56832 0))(
  ( (array!56833 (arr!27346 (Array (_ BitVec 32) ValueCell!9737)) (size!27810 (_ BitVec 32))) )
))
(declare-datatypes ((array!56834 0))(
  ( (array!56835 (arr!27347 (Array (_ BitVec 32) (_ BitVec 64))) (size!27811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4624 0))(
  ( (LongMapFixedSize!4625 (defaultEntry!5603 Int) (mask!27192 (_ BitVec 32)) (extraKeys!5335 (_ BitVec 32)) (zeroValue!5439 V!32215) (minValue!5439 V!32215) (_size!2367 (_ BitVec 32)) (_keys!10467 array!56834) (_values!5626 array!56832) (_vacant!2367 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4624)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941956 (= res!633085 (validMask!0 (mask!27192 thiss!1141)))))

(declare-fun tp_is_empty!20437 () Bool)

(declare-fun e!529596 () Bool)

(declare-fun e!529594 () Bool)

(declare-fun array_inv!21248 (array!56834) Bool)

(declare-fun array_inv!21249 (array!56832) Bool)

(assert (=> b!941957 (= e!529594 (and tp!62279 tp_is_empty!20437 (array_inv!21248 (_keys!10467 thiss!1141)) (array_inv!21249 (_values!5626 thiss!1141)) e!529596))))

(declare-fun b!941958 () Bool)

(declare-fun res!633084 () Bool)

(assert (=> b!941958 (=> (not res!633084) (not e!529593))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941958 (= res!633084 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941959 () Bool)

(declare-fun res!633082 () Bool)

(assert (=> b!941959 (=> (not res!633082) (not e!529593))))

(declare-datatypes ((SeekEntryResult!9026 0))(
  ( (MissingZero!9026 (index!38475 (_ BitVec 32))) (Found!9026 (index!38476 (_ BitVec 32))) (Intermediate!9026 (undefined!9838 Bool) (index!38477 (_ BitVec 32)) (x!80858 (_ BitVec 32))) (Undefined!9026) (MissingVacant!9026 (index!38478 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56834 (_ BitVec 32)) SeekEntryResult!9026)

(assert (=> b!941959 (= res!633082 (not (is-Found!9026 (seekEntry!0 key!756 (_keys!10467 thiss!1141) (mask!27192 thiss!1141)))))))

(declare-fun mapNonEmpty!32464 () Bool)

(declare-fun tp!62280 () Bool)

(declare-fun e!529595 () Bool)

(assert (=> mapNonEmpty!32464 (= mapRes!32464 (and tp!62280 e!529595))))

(declare-fun mapValue!32464 () ValueCell!9737)

(declare-fun mapKey!32464 () (_ BitVec 32))

(declare-fun mapRest!32464 () (Array (_ BitVec 32) ValueCell!9737))

(assert (=> mapNonEmpty!32464 (= (arr!27346 (_values!5626 thiss!1141)) (store mapRest!32464 mapKey!32464 mapValue!32464))))

(declare-fun b!941960 () Bool)

(assert (=> b!941960 (= e!529595 tp_is_empty!20437)))

(declare-fun res!633083 () Bool)

(assert (=> start!80166 (=> (not res!633083) (not e!529593))))

(declare-fun valid!1770 (LongMapFixedSize!4624) Bool)

(assert (=> start!80166 (= res!633083 (valid!1770 thiss!1141))))

(assert (=> start!80166 e!529593))

(assert (=> start!80166 e!529594))

(assert (=> start!80166 true))

(declare-fun b!941955 () Bool)

(declare-fun e!529592 () Bool)

(assert (=> b!941955 (= e!529592 tp_is_empty!20437)))

(declare-fun b!941961 () Bool)

(assert (=> b!941961 (= e!529596 (and e!529592 mapRes!32464))))

(declare-fun condMapEmpty!32464 () Bool)

(declare-fun mapDefault!32464 () ValueCell!9737)

