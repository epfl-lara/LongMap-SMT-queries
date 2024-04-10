; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75582 () Bool)

(assert start!75582)

(declare-fun b!888932 () Bool)

(declare-fun b_free!15595 () Bool)

(declare-fun b_next!15595 () Bool)

(assert (=> b!888932 (= b_free!15595 (not b_next!15595))))

(declare-fun tp!54743 () Bool)

(declare-fun b_and!25835 () Bool)

(assert (=> b!888932 (= tp!54743 b_and!25835)))

(declare-fun b!888930 () Bool)

(declare-fun e!495409 () Bool)

(declare-datatypes ((array!51820 0))(
  ( (array!51821 (arr!24919 (Array (_ BitVec 32) (_ BitVec 64))) (size!25361 (_ BitVec 32))) )
))
(declare-datatypes ((V!28863 0))(
  ( (V!28864 (val!9012 Int)) )
))
(declare-datatypes ((ValueCell!8480 0))(
  ( (ValueCellFull!8480 (v!11490 V!28863)) (EmptyCell!8480) )
))
(declare-datatypes ((array!51822 0))(
  ( (array!51823 (arr!24920 (Array (_ BitVec 32) ValueCell!8480)) (size!25362 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3976 0))(
  ( (LongMapFixedSize!3977 (defaultEntry!5185 Int) (mask!25619 (_ BitVec 32)) (extraKeys!4879 (_ BitVec 32)) (zeroValue!4983 V!28863) (minValue!4983 V!28863) (_size!2043 (_ BitVec 32)) (_keys!9866 array!51820) (_values!5170 array!51822) (_vacant!2043 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3976)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!888930 (= e!495409 (not (validMask!0 (mask!25619 thiss!1181))))))

(declare-fun b!888931 () Bool)

(declare-fun e!495408 () Bool)

(declare-fun tp_is_empty!17923 () Bool)

(assert (=> b!888931 (= e!495408 tp_is_empty!17923)))

(declare-fun mapIsEmpty!28428 () Bool)

(declare-fun mapRes!28428 () Bool)

(assert (=> mapIsEmpty!28428 mapRes!28428))

(declare-fun mapNonEmpty!28428 () Bool)

(declare-fun tp!54742 () Bool)

(assert (=> mapNonEmpty!28428 (= mapRes!28428 (and tp!54742 e!495408))))

(declare-fun mapValue!28428 () ValueCell!8480)

(declare-fun mapRest!28428 () (Array (_ BitVec 32) ValueCell!8480))

(declare-fun mapKey!28428 () (_ BitVec 32))

(assert (=> mapNonEmpty!28428 (= (arr!24920 (_values!5170 thiss!1181)) (store mapRest!28428 mapKey!28428 mapValue!28428))))

(declare-fun e!495411 () Bool)

(declare-fun e!495413 () Bool)

(declare-fun array_inv!19610 (array!51820) Bool)

(declare-fun array_inv!19611 (array!51822) Bool)

(assert (=> b!888932 (= e!495411 (and tp!54743 tp_is_empty!17923 (array_inv!19610 (_keys!9866 thiss!1181)) (array_inv!19611 (_values!5170 thiss!1181)) e!495413))))

(declare-fun b!888933 () Bool)

(declare-fun res!602527 () Bool)

(assert (=> b!888933 (=> (not res!602527) (not e!495409))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888933 (= res!602527 (not (= key!785 (bvneg key!785))))))

(declare-fun b!888934 () Bool)

(declare-fun e!495410 () Bool)

(assert (=> b!888934 (= e!495410 tp_is_empty!17923)))

(declare-fun res!602528 () Bool)

(assert (=> start!75582 (=> (not res!602528) (not e!495409))))

(declare-fun valid!1551 (LongMapFixedSize!3976) Bool)

(assert (=> start!75582 (= res!602528 (valid!1551 thiss!1181))))

(assert (=> start!75582 e!495409))

(assert (=> start!75582 e!495411))

(assert (=> start!75582 true))

(declare-fun b!888935 () Bool)

(assert (=> b!888935 (= e!495413 (and e!495410 mapRes!28428))))

(declare-fun condMapEmpty!28428 () Bool)

(declare-fun mapDefault!28428 () ValueCell!8480)

