; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75586 () Bool)

(assert start!75586)

(declare-fun b!888966 () Bool)

(declare-fun b_free!15599 () Bool)

(declare-fun b_next!15599 () Bool)

(assert (=> b!888966 (= b_free!15599 (not b_next!15599))))

(declare-fun tp!54754 () Bool)

(declare-fun b_and!25839 () Bool)

(assert (=> b!888966 (= tp!54754 b_and!25839)))

(declare-fun tp_is_empty!17927 () Bool)

(declare-fun e!495448 () Bool)

(declare-datatypes ((array!51828 0))(
  ( (array!51829 (arr!24923 (Array (_ BitVec 32) (_ BitVec 64))) (size!25365 (_ BitVec 32))) )
))
(declare-datatypes ((V!28867 0))(
  ( (V!28868 (val!9014 Int)) )
))
(declare-datatypes ((ValueCell!8482 0))(
  ( (ValueCellFull!8482 (v!11492 V!28867)) (EmptyCell!8482) )
))
(declare-datatypes ((array!51830 0))(
  ( (array!51831 (arr!24924 (Array (_ BitVec 32) ValueCell!8482)) (size!25366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3980 0))(
  ( (LongMapFixedSize!3981 (defaultEntry!5187 Int) (mask!25621 (_ BitVec 32)) (extraKeys!4881 (_ BitVec 32)) (zeroValue!4985 V!28867) (minValue!4985 V!28867) (_size!2045 (_ BitVec 32)) (_keys!9868 array!51828) (_values!5172 array!51830) (_vacant!2045 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3980)

(declare-fun e!495446 () Bool)

(declare-fun array_inv!19614 (array!51828) Bool)

(declare-fun array_inv!19615 (array!51830) Bool)

(assert (=> b!888966 (= e!495446 (and tp!54754 tp_is_empty!17927 (array_inv!19614 (_keys!9868 thiss!1181)) (array_inv!19615 (_values!5172 thiss!1181)) e!495448))))

(declare-fun b!888967 () Bool)

(declare-fun e!495449 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!888967 (= e!495449 (not (validMask!0 (mask!25621 thiss!1181))))))

(declare-fun b!888968 () Bool)

(declare-fun res!602540 () Bool)

(assert (=> b!888968 (=> (not res!602540) (not e!495449))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888968 (= res!602540 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28434 () Bool)

(declare-fun mapRes!28434 () Bool)

(assert (=> mapIsEmpty!28434 mapRes!28434))

(declare-fun b!888970 () Bool)

(declare-fun e!495444 () Bool)

(assert (=> b!888970 (= e!495448 (and e!495444 mapRes!28434))))

(declare-fun condMapEmpty!28434 () Bool)

(declare-fun mapDefault!28434 () ValueCell!8482)

