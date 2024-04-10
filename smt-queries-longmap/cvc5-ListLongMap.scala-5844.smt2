; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75494 () Bool)

(assert start!75494)

(declare-fun b!888367 () Bool)

(declare-fun b_free!15565 () Bool)

(declare-fun b_next!15565 () Bool)

(assert (=> b!888367 (= b_free!15565 (not b_next!15565))))

(declare-fun tp!54646 () Bool)

(declare-fun b_and!25803 () Bool)

(assert (=> b!888367 (= tp!54646 b_and!25803)))

(declare-fun mapNonEmpty!28376 () Bool)

(declare-fun mapRes!28376 () Bool)

(declare-fun tp!54645 () Bool)

(declare-fun e!494981 () Bool)

(assert (=> mapNonEmpty!28376 (= mapRes!28376 (and tp!54645 e!494981))))

(declare-fun mapKey!28376 () (_ BitVec 32))

(declare-datatypes ((array!51756 0))(
  ( (array!51757 (arr!24889 (Array (_ BitVec 32) (_ BitVec 64))) (size!25330 (_ BitVec 32))) )
))
(declare-datatypes ((V!28823 0))(
  ( (V!28824 (val!8997 Int)) )
))
(declare-datatypes ((ValueCell!8465 0))(
  ( (ValueCellFull!8465 (v!11470 V!28823)) (EmptyCell!8465) )
))
(declare-datatypes ((array!51758 0))(
  ( (array!51759 (arr!24890 (Array (_ BitVec 32) ValueCell!8465)) (size!25331 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3946 0))(
  ( (LongMapFixedSize!3947 (defaultEntry!5167 Int) (mask!25587 (_ BitVec 32)) (extraKeys!4861 (_ BitVec 32)) (zeroValue!4965 V!28823) (minValue!4965 V!28823) (_size!2028 (_ BitVec 32)) (_keys!9846 array!51756) (_values!5152 array!51758) (_vacant!2028 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3946)

(declare-fun mapValue!28376 () ValueCell!8465)

(declare-fun mapRest!28376 () (Array (_ BitVec 32) ValueCell!8465))

(assert (=> mapNonEmpty!28376 (= (arr!24890 (_values!5152 thiss!1181)) (store mapRest!28376 mapKey!28376 mapValue!28376))))

(declare-fun res!602350 () Bool)

(declare-fun e!494983 () Bool)

(assert (=> start!75494 (=> (not res!602350) (not e!494983))))

(declare-fun valid!1539 (LongMapFixedSize!3946) Bool)

(assert (=> start!75494 (= res!602350 (valid!1539 thiss!1181))))

(assert (=> start!75494 e!494983))

(declare-fun e!494982 () Bool)

(assert (=> start!75494 e!494982))

(assert (=> start!75494 true))

(declare-fun b!888365 () Bool)

(declare-fun e!494984 () Bool)

(declare-fun tp_is_empty!17893 () Bool)

(assert (=> b!888365 (= e!494984 tp_is_empty!17893)))

(declare-fun mapIsEmpty!28376 () Bool)

(assert (=> mapIsEmpty!28376 mapRes!28376))

(declare-fun b!888366 () Bool)

(assert (=> b!888366 (= e!494981 tp_is_empty!17893)))

(declare-fun e!494979 () Bool)

(declare-fun array_inv!19586 (array!51756) Bool)

(declare-fun array_inv!19587 (array!51758) Bool)

(assert (=> b!888367 (= e!494982 (and tp!54646 tp_is_empty!17893 (array_inv!19586 (_keys!9846 thiss!1181)) (array_inv!19587 (_values!5152 thiss!1181)) e!494979))))

(declare-fun b!888368 () Bool)

(declare-fun res!602351 () Bool)

(assert (=> b!888368 (=> (not res!602351) (not e!494983))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888368 (= res!602351 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4861 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4861 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888369 () Bool)

(assert (=> b!888369 (= e!494979 (and e!494984 mapRes!28376))))

(declare-fun condMapEmpty!28376 () Bool)

(declare-fun mapDefault!28376 () ValueCell!8465)

