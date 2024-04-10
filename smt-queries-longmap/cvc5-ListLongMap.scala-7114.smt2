; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90162 () Bool)

(assert start!90162)

(declare-fun b!1032617 () Bool)

(declare-fun b_free!20737 () Bool)

(declare-fun b_next!20737 () Bool)

(assert (=> b!1032617 (= b_free!20737 (not b_next!20737))))

(declare-fun tp!73290 () Bool)

(declare-fun b_and!33205 () Bool)

(assert (=> b!1032617 (= tp!73290 b_and!33205)))

(declare-fun b!1032614 () Bool)

(declare-fun e!583499 () Bool)

(declare-fun tp_is_empty!24457 () Bool)

(assert (=> b!1032614 (= e!583499 tp_is_empty!24457)))

(declare-fun mapIsEmpty!38147 () Bool)

(declare-fun mapRes!38147 () Bool)

(assert (=> mapIsEmpty!38147 mapRes!38147))

(declare-fun b!1032615 () Bool)

(declare-fun e!583498 () Bool)

(declare-datatypes ((V!37483 0))(
  ( (V!37484 (val!12279 Int)) )
))
(declare-datatypes ((ValueCell!11525 0))(
  ( (ValueCellFull!11525 (v!14856 V!37483)) (EmptyCell!11525) )
))
(declare-datatypes ((array!64982 0))(
  ( (array!64983 (arr!31291 (Array (_ BitVec 32) (_ BitVec 64))) (size!31810 (_ BitVec 32))) )
))
(declare-datatypes ((array!64984 0))(
  ( (array!64985 (arr!31292 (Array (_ BitVec 32) ValueCell!11525)) (size!31811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5644 0))(
  ( (LongMapFixedSize!5645 (defaultEntry!6196 Int) (mask!30022 (_ BitVec 32)) (extraKeys!5928 (_ BitVec 32)) (zeroValue!6032 V!37483) (minValue!6032 V!37483) (_size!2877 (_ BitVec 32)) (_keys!11371 array!64982) (_values!6219 array!64984) (_vacant!2877 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5644)

(assert (=> b!1032615 (= e!583498 (and (= (size!31811 (_values!6219 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30022 thiss!1427))) (not (= (size!31810 (_keys!11371 thiss!1427)) (size!31811 (_values!6219 thiss!1427))))))))

(declare-fun mapNonEmpty!38147 () Bool)

(declare-fun tp!73289 () Bool)

(assert (=> mapNonEmpty!38147 (= mapRes!38147 (and tp!73289 e!583499))))

(declare-fun mapKey!38147 () (_ BitVec 32))

(declare-fun mapRest!38147 () (Array (_ BitVec 32) ValueCell!11525))

(declare-fun mapValue!38147 () ValueCell!11525)

(assert (=> mapNonEmpty!38147 (= (arr!31292 (_values!6219 thiss!1427)) (store mapRest!38147 mapKey!38147 mapValue!38147))))

(declare-fun b!1032616 () Bool)

(declare-fun e!583496 () Bool)

(assert (=> b!1032616 (= e!583496 tp_is_empty!24457)))

(declare-fun e!583500 () Bool)

(declare-fun e!583497 () Bool)

(declare-fun array_inv!24217 (array!64982) Bool)

(declare-fun array_inv!24218 (array!64984) Bool)

(assert (=> b!1032617 (= e!583497 (and tp!73290 tp_is_empty!24457 (array_inv!24217 (_keys!11371 thiss!1427)) (array_inv!24218 (_values!6219 thiss!1427)) e!583500))))

(declare-fun b!1032618 () Bool)

(declare-fun res!690124 () Bool)

(assert (=> b!1032618 (=> (not res!690124) (not e!583498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032618 (= res!690124 (validMask!0 (mask!30022 thiss!1427)))))

(declare-fun b!1032619 () Bool)

(assert (=> b!1032619 (= e!583500 (and e!583496 mapRes!38147))))

(declare-fun condMapEmpty!38147 () Bool)

(declare-fun mapDefault!38147 () ValueCell!11525)

