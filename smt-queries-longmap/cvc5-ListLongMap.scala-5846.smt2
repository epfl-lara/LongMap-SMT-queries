; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75550 () Bool)

(assert start!75550)

(declare-fun b!888717 () Bool)

(declare-fun b_free!15577 () Bool)

(declare-fun b_next!15577 () Bool)

(assert (=> b!888717 (= b_free!15577 (not b_next!15577))))

(declare-fun tp!54686 () Bool)

(declare-fun b_and!25817 () Bool)

(assert (=> b!888717 (= tp!54686 b_and!25817)))

(declare-fun b!888714 () Bool)

(declare-fun e!495225 () Bool)

(declare-fun tp_is_empty!17905 () Bool)

(assert (=> b!888714 (= e!495225 tp_is_empty!17905)))

(declare-fun mapNonEmpty!28398 () Bool)

(declare-fun mapRes!28398 () Bool)

(declare-fun tp!54685 () Bool)

(assert (=> mapNonEmpty!28398 (= mapRes!28398 (and tp!54685 e!495225))))

(declare-fun mapKey!28398 () (_ BitVec 32))

(declare-datatypes ((array!51782 0))(
  ( (array!51783 (arr!24901 (Array (_ BitVec 32) (_ BitVec 64))) (size!25343 (_ BitVec 32))) )
))
(declare-datatypes ((V!28839 0))(
  ( (V!28840 (val!9003 Int)) )
))
(declare-datatypes ((ValueCell!8471 0))(
  ( (ValueCellFull!8471 (v!11479 V!28839)) (EmptyCell!8471) )
))
(declare-datatypes ((array!51784 0))(
  ( (array!51785 (arr!24902 (Array (_ BitVec 32) ValueCell!8471)) (size!25344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3958 0))(
  ( (LongMapFixedSize!3959 (defaultEntry!5176 Int) (mask!25604 (_ BitVec 32)) (extraKeys!4870 (_ BitVec 32)) (zeroValue!4974 V!28839) (minValue!4974 V!28839) (_size!2034 (_ BitVec 32)) (_keys!9857 array!51782) (_values!5161 array!51784) (_vacant!2034 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3958)

(declare-fun mapRest!28398 () (Array (_ BitVec 32) ValueCell!8471))

(declare-fun mapValue!28398 () ValueCell!8471)

(assert (=> mapNonEmpty!28398 (= (arr!24902 (_values!5161 thiss!1181)) (store mapRest!28398 mapKey!28398 mapValue!28398))))

(declare-fun b!888715 () Bool)

(declare-fun e!495223 () Bool)

(declare-fun e!495226 () Bool)

(assert (=> b!888715 (= e!495223 (and e!495226 mapRes!28398))))

(declare-fun condMapEmpty!28398 () Bool)

(declare-fun mapDefault!28398 () ValueCell!8471)

