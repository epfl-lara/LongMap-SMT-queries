; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3028 () Bool)

(assert start!3028)

(declare-fun b!17962 () Bool)

(declare-fun b_free!635 () Bool)

(declare-fun b_next!635 () Bool)

(assert (=> b!17962 (= b_free!635 (not b_next!635))))

(declare-fun tp!3095 () Bool)

(declare-fun b_and!1283 () Bool)

(assert (=> b!17962 (= tp!3095 b_and!1283)))

(declare-fun b!17958 () Bool)

(declare-datatypes ((V!1023 0))(
  ( (V!1024 (val!476 Int)) )
))
(declare-datatypes ((ValueCell!250 0))(
  ( (ValueCellFull!250 (v!1456 V!1023)) (EmptyCell!250) )
))
(declare-datatypes ((array!1003 0))(
  ( (array!1004 (arr!483 (Array (_ BitVec 32) ValueCell!250)) (size!573 (_ BitVec 32))) )
))
(declare-datatypes ((array!1005 0))(
  ( (array!1006 (arr!484 (Array (_ BitVec 32) (_ BitVec 64))) (size!574 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!86 0))(
  ( (LongMapFixedSize!87 (defaultEntry!1654 Int) (mask!4581 (_ BitVec 32)) (extraKeys!1567 (_ BitVec 32)) (zeroValue!1590 V!1023) (minValue!1590 V!1023) (_size!75 (_ BitVec 32)) (_keys!3079 array!1005) (_values!1651 array!1003) (_vacant!75 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!86 0))(
  ( (Cell!87 (v!1457 LongMapFixedSize!86)) )
))
(declare-datatypes ((LongMap!86 0))(
  ( (LongMap!87 (underlying!54 Cell!86)) )
))
(declare-datatypes ((tuple2!776 0))(
  ( (tuple2!777 (_1!389 Bool) (_2!389 LongMap!86)) )
))
(declare-fun e!11443 () tuple2!776)

(declare-fun thiss!848 () LongMap!86)

(assert (=> b!17958 (= e!11443 (tuple2!777 true thiss!848))))

(declare-fun b!17959 () Bool)

(declare-fun e!11440 () Bool)

(declare-fun e!11446 () Bool)

(assert (=> b!17959 (= e!11440 e!11446)))

(declare-fun res!12699 () Bool)

(declare-fun e!11444 () Bool)

(assert (=> start!3028 (=> (not res!12699) (not e!11444))))

(declare-fun valid!42 (LongMap!86) Bool)

(assert (=> start!3028 (= res!12699 (valid!42 thiss!848))))

(assert (=> start!3028 e!11444))

(declare-fun e!11437 () Bool)

(assert (=> start!3028 e!11437))

(declare-fun mapNonEmpty!783 () Bool)

(declare-fun mapRes!783 () Bool)

(declare-fun tp!3096 () Bool)

(declare-fun e!11442 () Bool)

(assert (=> mapNonEmpty!783 (= mapRes!783 (and tp!3096 e!11442))))

(declare-fun mapRest!783 () (Array (_ BitVec 32) ValueCell!250))

(declare-fun mapValue!783 () ValueCell!250)

(declare-fun mapKey!783 () (_ BitVec 32))

(assert (=> mapNonEmpty!783 (= (arr!483 (_values!1651 (v!1457 (underlying!54 thiss!848)))) (store mapRest!783 mapKey!783 mapValue!783))))

(declare-fun b!17960 () Bool)

(declare-fun e!11441 () Bool)

(assert (=> b!17960 (= e!11441 false)))

(declare-fun lt!4648 () Bool)

(declare-fun lt!4647 () tuple2!776)

(assert (=> b!17960 (= lt!4648 (valid!42 (_2!389 lt!4647)))))

(declare-fun b!17961 () Bool)

(declare-fun e!11445 () Bool)

(declare-fun tp_is_empty!899 () Bool)

(assert (=> b!17961 (= e!11445 tp_is_empty!899)))

(declare-fun e!11438 () Bool)

(declare-fun array_inv!333 (array!1005) Bool)

(declare-fun array_inv!334 (array!1003) Bool)

(assert (=> b!17962 (= e!11446 (and tp!3095 tp_is_empty!899 (array_inv!333 (_keys!3079 (v!1457 (underlying!54 thiss!848)))) (array_inv!334 (_values!1651 (v!1457 (underlying!54 thiss!848)))) e!11438))))

(declare-fun b!17963 () Bool)

(declare-fun repack!18 (LongMap!86) tuple2!776)

(assert (=> b!17963 (= e!11443 (repack!18 thiss!848))))

(declare-fun mapIsEmpty!783 () Bool)

(assert (=> mapIsEmpty!783 mapRes!783))

(declare-fun b!17964 () Bool)

(assert (=> b!17964 (= e!11442 tp_is_empty!899)))

(declare-fun b!17965 () Bool)

(assert (=> b!17965 (= e!11438 (and e!11445 mapRes!783))))

(declare-fun condMapEmpty!783 () Bool)

(declare-fun mapDefault!783 () ValueCell!250)

