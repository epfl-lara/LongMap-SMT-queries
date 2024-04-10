; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3006 () Bool)

(assert start!3006)

(declare-fun b!17631 () Bool)

(declare-fun b_free!613 () Bool)

(declare-fun b_next!613 () Bool)

(assert (=> b!17631 (= b_free!613 (not b_next!613))))

(declare-fun tp!3030 () Bool)

(declare-fun b_and!1261 () Bool)

(assert (=> b!17631 (= tp!3030 b_and!1261)))

(declare-fun b!17628 () Bool)

(declare-fun e!11114 () Bool)

(declare-fun tp_is_empty!877 () Bool)

(assert (=> b!17628 (= e!11114 tp_is_empty!877)))

(declare-fun b!17629 () Bool)

(declare-fun e!11111 () Bool)

(declare-fun e!11110 () Bool)

(assert (=> b!17629 (= e!11111 e!11110)))

(declare-fun b!17630 () Bool)

(declare-datatypes ((V!995 0))(
  ( (V!996 (val!465 Int)) )
))
(declare-datatypes ((ValueCell!239 0))(
  ( (ValueCellFull!239 (v!1434 V!995)) (EmptyCell!239) )
))
(declare-datatypes ((array!959 0))(
  ( (array!960 (arr!461 (Array (_ BitVec 32) ValueCell!239)) (size!551 (_ BitVec 32))) )
))
(declare-datatypes ((array!961 0))(
  ( (array!962 (arr!462 (Array (_ BitVec 32) (_ BitVec 64))) (size!552 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!64 0))(
  ( (LongMapFixedSize!65 (defaultEntry!1643 Int) (mask!4564 (_ BitVec 32)) (extraKeys!1556 (_ BitVec 32)) (zeroValue!1579 V!995) (minValue!1579 V!995) (_size!64 (_ BitVec 32)) (_keys!3068 array!961) (_values!1640 array!959) (_vacant!64 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!64 0))(
  ( (Cell!65 (v!1435 LongMapFixedSize!64)) )
))
(declare-datatypes ((LongMap!64 0))(
  ( (LongMap!65 (underlying!43 Cell!64)) )
))
(declare-datatypes ((tuple2!754 0))(
  ( (tuple2!755 (_1!378 Bool) (_2!378 LongMap!64)) )
))
(declare-fun e!11116 () tuple2!754)

(declare-fun thiss!848 () LongMap!64)

(assert (=> b!17630 (= e!11116 (tuple2!755 true thiss!848))))

(declare-fun mapNonEmpty!750 () Bool)

(declare-fun mapRes!750 () Bool)

(declare-fun tp!3029 () Bool)

(declare-fun e!11112 () Bool)

(assert (=> mapNonEmpty!750 (= mapRes!750 (and tp!3029 e!11112))))

(declare-fun mapValue!750 () ValueCell!239)

(declare-fun mapRest!750 () (Array (_ BitVec 32) ValueCell!239))

(declare-fun mapKey!750 () (_ BitVec 32))

(assert (=> mapNonEmpty!750 (= (arr!461 (_values!1640 (v!1435 (underlying!43 thiss!848)))) (store mapRest!750 mapKey!750 mapValue!750))))

(declare-fun e!11108 () Bool)

(declare-fun e!11107 () Bool)

(declare-fun array_inv!319 (array!961) Bool)

(declare-fun array_inv!320 (array!959) Bool)

(assert (=> b!17631 (= e!11107 (and tp!3030 tp_is_empty!877 (array_inv!319 (_keys!3068 (v!1435 (underlying!43 thiss!848)))) (array_inv!320 (_values!1640 (v!1435 (underlying!43 thiss!848)))) e!11108))))

(declare-fun res!12634 () Bool)

(declare-fun e!11115 () Bool)

(assert (=> start!3006 (=> (not res!12634) (not e!11115))))

(declare-fun valid!33 (LongMap!64) Bool)

(assert (=> start!3006 (= res!12634 (valid!33 thiss!848))))

(assert (=> start!3006 e!11115))

(assert (=> start!3006 e!11111))

(assert (=> start!3006 true))

(assert (=> start!3006 tp_is_empty!877))

(declare-fun mapIsEmpty!750 () Bool)

(assert (=> mapIsEmpty!750 mapRes!750))

(declare-fun b!17632 () Bool)

(assert (=> b!17632 (= e!11112 tp_is_empty!877)))

(declare-fun b!17633 () Bool)

(assert (=> b!17633 (= e!11108 (and e!11114 mapRes!750))))

(declare-fun condMapEmpty!750 () Bool)

(declare-fun mapDefault!750 () ValueCell!239)

