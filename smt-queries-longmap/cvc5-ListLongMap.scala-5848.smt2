; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75562 () Bool)

(assert start!75562)

(declare-fun b!888810 () Bool)

(declare-fun b_free!15589 () Bool)

(declare-fun b_next!15589 () Bool)

(assert (=> b!888810 (= b_free!15589 (not b_next!15589))))

(declare-fun tp!54721 () Bool)

(declare-fun b_and!25829 () Bool)

(assert (=> b!888810 (= tp!54721 b_and!25829)))

(declare-fun e!495324 () Bool)

(declare-fun e!495326 () Bool)

(declare-datatypes ((array!51806 0))(
  ( (array!51807 (arr!24913 (Array (_ BitVec 32) (_ BitVec 64))) (size!25355 (_ BitVec 32))) )
))
(declare-datatypes ((V!28855 0))(
  ( (V!28856 (val!9009 Int)) )
))
(declare-datatypes ((ValueCell!8477 0))(
  ( (ValueCellFull!8477 (v!11485 V!28855)) (EmptyCell!8477) )
))
(declare-datatypes ((array!51808 0))(
  ( (array!51809 (arr!24914 (Array (_ BitVec 32) ValueCell!8477)) (size!25356 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3970 0))(
  ( (LongMapFixedSize!3971 (defaultEntry!5182 Int) (mask!25614 (_ BitVec 32)) (extraKeys!4876 (_ BitVec 32)) (zeroValue!4980 V!28855) (minValue!4980 V!28855) (_size!2040 (_ BitVec 32)) (_keys!9863 array!51806) (_values!5167 array!51808) (_vacant!2040 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3970)

(declare-fun tp_is_empty!17917 () Bool)

(declare-fun array_inv!19604 (array!51806) Bool)

(declare-fun array_inv!19605 (array!51808) Bool)

(assert (=> b!888810 (= e!495326 (and tp!54721 tp_is_empty!17917 (array_inv!19604 (_keys!9863 thiss!1181)) (array_inv!19605 (_values!5167 thiss!1181)) e!495324))))

(declare-fun b!888811 () Bool)

(declare-fun res!602493 () Bool)

(declare-fun e!495329 () Bool)

(assert (=> b!888811 (=> (not res!602493) (not e!495329))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4331 (LongMapFixedSize!3970 (_ BitVec 64)) Bool)

(assert (=> b!888811 (= res!602493 (contains!4331 thiss!1181 key!785))))

(declare-fun b!888812 () Bool)

(declare-fun e!495328 () Bool)

(assert (=> b!888812 (= e!495328 tp_is_empty!17917)))

(declare-fun b!888814 () Bool)

(declare-fun e!495325 () Bool)

(assert (=> b!888814 (= e!495325 tp_is_empty!17917)))

(declare-fun b!888815 () Bool)

(declare-fun mapRes!28416 () Bool)

(assert (=> b!888815 (= e!495324 (and e!495328 mapRes!28416))))

(declare-fun condMapEmpty!28416 () Bool)

(declare-fun mapDefault!28416 () ValueCell!8477)

