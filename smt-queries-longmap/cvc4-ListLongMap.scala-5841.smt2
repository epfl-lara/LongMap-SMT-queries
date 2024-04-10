; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75436 () Bool)

(assert start!75436)

(declare-fun b!888015 () Bool)

(declare-fun b_free!15551 () Bool)

(declare-fun b_next!15551 () Bool)

(assert (=> b!888015 (= b_free!15551 (not b_next!15551))))

(declare-fun tp!54599 () Bool)

(declare-fun b_and!25787 () Bool)

(assert (=> b!888015 (= tp!54599 b_and!25787)))

(declare-fun b!888012 () Bool)

(declare-fun res!602239 () Bool)

(declare-fun e!494727 () Bool)

(assert (=> b!888012 (=> (not res!602239) (not e!494727))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51726 0))(
  ( (array!51727 (arr!24875 (Array (_ BitVec 32) (_ BitVec 64))) (size!25315 (_ BitVec 32))) )
))
(declare-datatypes ((V!28803 0))(
  ( (V!28804 (val!8990 Int)) )
))
(declare-datatypes ((ValueCell!8458 0))(
  ( (ValueCellFull!8458 (v!11462 V!28803)) (EmptyCell!8458) )
))
(declare-datatypes ((array!51728 0))(
  ( (array!51729 (arr!24876 (Array (_ BitVec 32) ValueCell!8458)) (size!25316 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3932 0))(
  ( (LongMapFixedSize!3933 (defaultEntry!5157 Int) (mask!25567 (_ BitVec 32)) (extraKeys!4851 (_ BitVec 32)) (zeroValue!4955 V!28803) (minValue!4955 V!28803) (_size!2021 (_ BitVec 32)) (_keys!9834 array!51726) (_values!5142 array!51728) (_vacant!2021 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3932)

(assert (=> b!888012 (= res!602239 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4851 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!28351 () Bool)

(declare-fun mapRes!28351 () Bool)

(declare-fun tp!54600 () Bool)

(declare-fun e!494728 () Bool)

(assert (=> mapNonEmpty!28351 (= mapRes!28351 (and tp!54600 e!494728))))

(declare-fun mapKey!28351 () (_ BitVec 32))

(declare-fun mapRest!28351 () (Array (_ BitVec 32) ValueCell!8458))

(declare-fun mapValue!28351 () ValueCell!8458)

(assert (=> mapNonEmpty!28351 (= (arr!24876 (_values!5142 thiss!1181)) (store mapRest!28351 mapKey!28351 mapValue!28351))))

(declare-fun b!888013 () Bool)

(declare-fun e!494725 () Bool)

(declare-fun tp_is_empty!17879 () Bool)

(assert (=> b!888013 (= e!494725 tp_is_empty!17879)))

(declare-fun b!888014 () Bool)

(assert (=> b!888014 (= e!494728 tp_is_empty!17879)))

(declare-fun e!494726 () Bool)

(declare-fun e!494729 () Bool)

(declare-fun array_inv!19580 (array!51726) Bool)

(declare-fun array_inv!19581 (array!51728) Bool)

(assert (=> b!888015 (= e!494726 (and tp!54599 tp_is_empty!17879 (array_inv!19580 (_keys!9834 thiss!1181)) (array_inv!19581 (_values!5142 thiss!1181)) e!494729))))

(declare-fun b!888016 () Bool)

(assert (=> b!888016 (= e!494729 (and e!494725 mapRes!28351))))

(declare-fun condMapEmpty!28351 () Bool)

(declare-fun mapDefault!28351 () ValueCell!8458)

