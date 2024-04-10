; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3130 () Bool)

(assert start!3130)

(declare-fun b!19059 () Bool)

(declare-fun b_free!661 () Bool)

(declare-fun b_next!661 () Bool)

(assert (=> b!19059 (= b_free!661 (not b_next!661))))

(declare-fun tp!3180 () Bool)

(declare-fun b_and!1321 () Bool)

(assert (=> b!19059 (= tp!3180 b_and!1321)))

(declare-fun b!19056 () Bool)

(declare-fun e!12241 () Bool)

(declare-fun tp_is_empty!925 () Bool)

(assert (=> b!19056 (= e!12241 tp_is_empty!925)))

(declare-fun res!13057 () Bool)

(declare-fun e!12238 () Bool)

(assert (=> start!3130 (=> (not res!13057) (not e!12238))))

(declare-datatypes ((V!1059 0))(
  ( (V!1060 (val!489 Int)) )
))
(declare-datatypes ((ValueCell!263 0))(
  ( (ValueCellFull!263 (v!1494 V!1059)) (EmptyCell!263) )
))
(declare-datatypes ((array!1059 0))(
  ( (array!1060 (arr!509 (Array (_ BitVec 32) ValueCell!263)) (size!599 (_ BitVec 32))) )
))
(declare-datatypes ((array!1061 0))(
  ( (array!1062 (arr!510 (Array (_ BitVec 32) (_ BitVec 64))) (size!600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!112 0))(
  ( (LongMapFixedSize!113 (defaultEntry!1675 Int) (mask!4614 (_ BitVec 32)) (extraKeys!1585 (_ BitVec 32)) (zeroValue!1609 V!1059) (minValue!1609 V!1059) (_size!89 (_ BitVec 32)) (_keys!3100 array!1061) (_values!1671 array!1059) (_vacant!89 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!112 0))(
  ( (Cell!113 (v!1495 LongMapFixedSize!112)) )
))
(declare-datatypes ((LongMap!112 0))(
  ( (LongMap!113 (underlying!67 Cell!112)) )
))
(declare-fun thiss!938 () LongMap!112)

(declare-fun valid!53 (LongMap!112) Bool)

(assert (=> start!3130 (= res!13057 (valid!53 thiss!938))))

(assert (=> start!3130 e!12238))

(declare-fun e!12235 () Bool)

(assert (=> start!3130 e!12235))

(declare-fun mapNonEmpty!829 () Bool)

(declare-fun mapRes!829 () Bool)

(declare-fun tp!3181 () Bool)

(declare-fun e!12236 () Bool)

(assert (=> mapNonEmpty!829 (= mapRes!829 (and tp!3181 e!12236))))

(declare-fun mapValue!829 () ValueCell!263)

(declare-fun mapKey!829 () (_ BitVec 32))

(declare-fun mapRest!829 () (Array (_ BitVec 32) ValueCell!263))

(assert (=> mapNonEmpty!829 (= (arr!509 (_values!1671 (v!1495 (underlying!67 thiss!938)))) (store mapRest!829 mapKey!829 mapValue!829))))

(declare-fun b!19057 () Bool)

(declare-fun e!12237 () Bool)

(assert (=> b!19057 (= e!12237 (and e!12241 mapRes!829))))

(declare-fun condMapEmpty!829 () Bool)

(declare-fun mapDefault!829 () ValueCell!263)

