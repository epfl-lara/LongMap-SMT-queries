; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3158 () Bool)

(assert start!3158)

(declare-fun b!19242 () Bool)

(declare-fun b_free!671 () Bool)

(declare-fun b_next!671 () Bool)

(assert (=> b!19242 (= b_free!671 (not b_next!671))))

(declare-fun tp!3216 () Bool)

(declare-fun b_and!1331 () Bool)

(assert (=> b!19242 (= tp!3216 b_and!1331)))

(declare-fun b!19241 () Bool)

(declare-fun e!12404 () Bool)

(declare-fun e!12405 () Bool)

(assert (=> b!19241 (= e!12404 e!12405)))

(declare-fun b!19243 () Bool)

(declare-fun e!12398 () Bool)

(declare-fun tp_is_empty!935 () Bool)

(assert (=> b!19243 (= e!12398 tp_is_empty!935)))

(declare-fun b!19244 () Bool)

(declare-fun res!13116 () Bool)

(declare-fun e!12402 () Bool)

(assert (=> b!19244 (=> (not res!13116) (not e!12402))))

(declare-datatypes ((V!1071 0))(
  ( (V!1072 (val!494 Int)) )
))
(declare-datatypes ((ValueCell!268 0))(
  ( (ValueCellFull!268 (v!1504 V!1071)) (EmptyCell!268) )
))
(declare-datatypes ((array!1081 0))(
  ( (array!1082 (arr!519 (Array (_ BitVec 32) ValueCell!268)) (size!610 (_ BitVec 32))) )
))
(declare-datatypes ((array!1083 0))(
  ( (array!1084 (arr!520 (Array (_ BitVec 32) (_ BitVec 64))) (size!611 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!122 0))(
  ( (LongMapFixedSize!123 (defaultEntry!1680 Int) (mask!4623 (_ BitVec 32)) (extraKeys!1590 (_ BitVec 32)) (zeroValue!1614 V!1071) (minValue!1614 V!1071) (_size!94 (_ BitVec 32)) (_keys!3106 array!1083) (_values!1676 array!1081) (_vacant!94 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!122 0))(
  ( (Cell!123 (v!1505 LongMapFixedSize!122)) )
))
(declare-datatypes ((LongMap!122 0))(
  ( (LongMap!123 (underlying!72 Cell!122)) )
))
(declare-fun thiss!938 () LongMap!122)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19244 (= res!13116 (validMask!0 (mask!4623 (v!1505 (underlying!72 thiss!938)))))))

(declare-fun mapIsEmpty!849 () Bool)

(declare-fun mapRes!849 () Bool)

(assert (=> mapIsEmpty!849 mapRes!849))

(declare-fun mapNonEmpty!849 () Bool)

(declare-fun tp!3215 () Bool)

(declare-fun e!12400 () Bool)

(assert (=> mapNonEmpty!849 (= mapRes!849 (and tp!3215 e!12400))))

(declare-fun mapKey!849 () (_ BitVec 32))

(declare-fun mapValue!849 () ValueCell!268)

(declare-fun mapRest!849 () (Array (_ BitVec 32) ValueCell!268))

(assert (=> mapNonEmpty!849 (= (arr!519 (_values!1676 (v!1505 (underlying!72 thiss!938)))) (store mapRest!849 mapKey!849 mapValue!849))))

(declare-fun b!19245 () Bool)

(assert (=> b!19245 (= e!12400 tp_is_empty!935)))

(declare-fun b!19246 () Bool)

(declare-fun e!12403 () Bool)

(assert (=> b!19246 (= e!12403 (and e!12398 mapRes!849))))

(declare-fun condMapEmpty!849 () Bool)

(declare-fun mapDefault!849 () ValueCell!268)

