; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33888 () Bool)

(assert start!33888)

(declare-fun b_free!7067 () Bool)

(declare-fun b_next!7067 () Bool)

(assert (=> start!33888 (= b_free!7067 (not b_next!7067))))

(declare-fun tp!24713 () Bool)

(declare-fun b_and!14253 () Bool)

(assert (=> start!33888 (= tp!24713 b_and!14253)))

(declare-fun b!337425 () Bool)

(declare-fun e!207060 () Bool)

(assert (=> b!337425 (= e!207060 false)))

(declare-fun lt!160431 () (_ BitVec 32))

(declare-datatypes ((array!17633 0))(
  ( (array!17634 (arr!8344 (Array (_ BitVec 32) (_ BitVec 64))) (size!8696 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17633)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17633 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337425 (= lt!160431 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337426 () Bool)

(declare-fun res!186391 () Bool)

(declare-fun e!207056 () Bool)

(assert (=> b!337426 (=> (not res!186391) (not e!207056))))

(declare-datatypes ((List!4776 0))(
  ( (Nil!4773) (Cons!4772 (h!5628 (_ BitVec 64)) (t!9870 List!4776)) )
))
(declare-fun arrayNoDuplicates!0 (array!17633 (_ BitVec 32) List!4776) Bool)

(assert (=> b!337426 (= res!186391 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4773))))

(declare-fun res!186389 () Bool)

(assert (=> start!33888 (=> (not res!186389) (not e!207056))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33888 (= res!186389 (validMask!0 mask!2385))))

(assert (=> start!33888 e!207056))

(assert (=> start!33888 true))

(declare-fun tp_is_empty!7019 () Bool)

(assert (=> start!33888 tp_is_empty!7019))

(assert (=> start!33888 tp!24713))

(declare-datatypes ((V!10335 0))(
  ( (V!10336 (val!3554 Int)) )
))
(declare-datatypes ((ValueCell!3166 0))(
  ( (ValueCellFull!3166 (v!5719 V!10335)) (EmptyCell!3166) )
))
(declare-datatypes ((array!17635 0))(
  ( (array!17636 (arr!8345 (Array (_ BitVec 32) ValueCell!3166)) (size!8697 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17635)

(declare-fun e!207055 () Bool)

(declare-fun array_inv!6192 (array!17635) Bool)

(assert (=> start!33888 (and (array_inv!6192 _values!1525) e!207055)))

(declare-fun array_inv!6193 (array!17633) Bool)

(assert (=> start!33888 (array_inv!6193 _keys!1895)))

(declare-fun b!337427 () Bool)

(declare-fun res!186385 () Bool)

(assert (=> b!337427 (=> (not res!186385) (not e!207056))))

(declare-fun zeroValue!1467 () V!10335)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10335)

(declare-datatypes ((tuple2!5160 0))(
  ( (tuple2!5161 (_1!2591 (_ BitVec 64)) (_2!2591 V!10335)) )
))
(declare-datatypes ((List!4777 0))(
  ( (Nil!4774) (Cons!4773 (h!5629 tuple2!5160) (t!9871 List!4777)) )
))
(declare-datatypes ((ListLongMap!4073 0))(
  ( (ListLongMap!4074 (toList!2052 List!4777)) )
))
(declare-fun contains!2099 (ListLongMap!4073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1573 (array!17633 array!17635 (_ BitVec 32) (_ BitVec 32) V!10335 V!10335 (_ BitVec 32) Int) ListLongMap!4073)

(assert (=> b!337427 (= res!186385 (not (contains!2099 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337428 () Bool)

(declare-fun e!207058 () Bool)

(assert (=> b!337428 (= e!207058 tp_is_empty!7019)))

(declare-fun b!337429 () Bool)

(declare-fun e!207057 () Bool)

(assert (=> b!337429 (= e!207057 tp_is_empty!7019)))

(declare-fun b!337430 () Bool)

(declare-fun res!186388 () Bool)

(assert (=> b!337430 (=> (not res!186388) (not e!207060))))

(declare-fun arrayContainsKey!0 (array!17633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337430 (= res!186388 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11934 () Bool)

(declare-fun mapRes!11934 () Bool)

(declare-fun tp!24714 () Bool)

(assert (=> mapNonEmpty!11934 (= mapRes!11934 (and tp!24714 e!207058))))

(declare-fun mapKey!11934 () (_ BitVec 32))

(declare-fun mapRest!11934 () (Array (_ BitVec 32) ValueCell!3166))

(declare-fun mapValue!11934 () ValueCell!3166)

(assert (=> mapNonEmpty!11934 (= (arr!8345 _values!1525) (store mapRest!11934 mapKey!11934 mapValue!11934))))

(declare-fun b!337431 () Bool)

(declare-fun res!186386 () Bool)

(assert (=> b!337431 (=> (not res!186386) (not e!207056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337431 (= res!186386 (validKeyInArray!0 k!1348))))

(declare-fun b!337432 () Bool)

(assert (=> b!337432 (= e!207055 (and e!207057 mapRes!11934))))

(declare-fun condMapEmpty!11934 () Bool)

(declare-fun mapDefault!11934 () ValueCell!3166)

