; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90144 () Bool)

(assert start!90144)

(declare-fun b!1032522 () Bool)

(declare-fun b_free!20735 () Bool)

(declare-fun b_next!20735 () Bool)

(assert (=> b!1032522 (= b_free!20735 (not b_next!20735))))

(declare-fun tp!73280 () Bool)

(declare-fun b_and!33203 () Bool)

(assert (=> b!1032522 (= tp!73280 b_and!33203)))

(declare-fun mapIsEmpty!38140 () Bool)

(declare-fun mapRes!38140 () Bool)

(assert (=> mapIsEmpty!38140 mapRes!38140))

(declare-fun tp_is_empty!24455 () Bool)

(declare-datatypes ((V!37479 0))(
  ( (V!37480 (val!12278 Int)) )
))
(declare-datatypes ((ValueCell!11524 0))(
  ( (ValueCellFull!11524 (v!14855 V!37479)) (EmptyCell!11524) )
))
(declare-datatypes ((array!64976 0))(
  ( (array!64977 (arr!31289 (Array (_ BitVec 32) (_ BitVec 64))) (size!31807 (_ BitVec 32))) )
))
(declare-datatypes ((array!64978 0))(
  ( (array!64979 (arr!31290 (Array (_ BitVec 32) ValueCell!11524)) (size!31808 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5642 0))(
  ( (LongMapFixedSize!5643 (defaultEntry!6195 Int) (mask!30017 (_ BitVec 32)) (extraKeys!5927 (_ BitVec 32)) (zeroValue!6031 V!37479) (minValue!6031 V!37479) (_size!2876 (_ BitVec 32)) (_keys!11369 array!64976) (_values!6218 array!64978) (_vacant!2876 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5642)

(declare-fun e!583441 () Bool)

(declare-fun e!583439 () Bool)

(declare-fun array_inv!24215 (array!64976) Bool)

(declare-fun array_inv!24216 (array!64978) Bool)

(assert (=> b!1032522 (= e!583441 (and tp!73280 tp_is_empty!24455 (array_inv!24215 (_keys!11369 thiss!1427)) (array_inv!24216 (_values!6218 thiss!1427)) e!583439))))

(declare-fun b!1032523 () Bool)

(declare-fun e!583440 () Bool)

(assert (=> b!1032523 (= e!583440 tp_is_empty!24455)))

(declare-fun b!1032524 () Bool)

(declare-fun e!583437 () Bool)

(assert (=> b!1032524 (= e!583437 (not (= (size!31808 (_values!6218 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30017 thiss!1427)))))))

(declare-fun b!1032525 () Bool)

(declare-fun res!690080 () Bool)

(assert (=> b!1032525 (=> (not res!690080) (not e!583437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032525 (= res!690080 (validMask!0 (mask!30017 thiss!1427)))))

(declare-fun b!1032526 () Bool)

(declare-fun res!690078 () Bool)

(assert (=> b!1032526 (=> (not res!690078) (not e!583437))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032526 (= res!690078 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690079 () Bool)

(assert (=> start!90144 (=> (not res!690079) (not e!583437))))

(declare-fun valid!2136 (LongMapFixedSize!5642) Bool)

(assert (=> start!90144 (= res!690079 (valid!2136 thiss!1427))))

(assert (=> start!90144 e!583437))

(assert (=> start!90144 e!583441))

(assert (=> start!90144 true))

(declare-fun mapNonEmpty!38140 () Bool)

(declare-fun tp!73279 () Bool)

(declare-fun e!583438 () Bool)

(assert (=> mapNonEmpty!38140 (= mapRes!38140 (and tp!73279 e!583438))))

(declare-fun mapRest!38140 () (Array (_ BitVec 32) ValueCell!11524))

(declare-fun mapKey!38140 () (_ BitVec 32))

(declare-fun mapValue!38140 () ValueCell!11524)

(assert (=> mapNonEmpty!38140 (= (arr!31290 (_values!6218 thiss!1427)) (store mapRest!38140 mapKey!38140 mapValue!38140))))

(declare-fun b!1032527 () Bool)

(assert (=> b!1032527 (= e!583438 tp_is_empty!24455)))

(declare-fun b!1032528 () Bool)

(assert (=> b!1032528 (= e!583439 (and e!583440 mapRes!38140))))

(declare-fun condMapEmpty!38140 () Bool)

(declare-fun mapDefault!38140 () ValueCell!11524)

