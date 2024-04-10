; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75412 () Bool)

(assert start!75412)

(declare-fun b!887875 () Bool)

(declare-fun b_free!15539 () Bool)

(declare-fun b_next!15539 () Bool)

(assert (=> b!887875 (= b_free!15539 (not b_next!15539))))

(declare-fun tp!54560 () Bool)

(declare-fun b_and!25775 () Bool)

(assert (=> b!887875 (= tp!54560 b_and!25775)))

(declare-fun b!887874 () Bool)

(declare-fun e!494600 () Bool)

(declare-fun e!494598 () Bool)

(assert (=> b!887874 (= e!494600 e!494598)))

(declare-fun e!494596 () Bool)

(declare-datatypes ((V!28787 0))(
  ( (V!28788 (val!8984 Int)) )
))
(declare-datatypes ((array!51700 0))(
  ( (array!51701 (arr!24863 (Array (_ BitVec 32) (_ BitVec 64))) (size!25303 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8452 0))(
  ( (ValueCellFull!8452 (v!11454 V!28787)) (EmptyCell!8452) )
))
(declare-datatypes ((array!51702 0))(
  ( (array!51703 (arr!24864 (Array (_ BitVec 32) ValueCell!8452)) (size!25304 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3920 0))(
  ( (LongMapFixedSize!3921 (defaultEntry!5151 Int) (mask!25557 (_ BitVec 32)) (extraKeys!4845 (_ BitVec 32)) (zeroValue!4949 V!28787) (minValue!4949 V!28787) (_size!2015 (_ BitVec 32)) (_keys!9828 array!51700) (_values!5136 array!51702) (_vacant!2015 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1080 0))(
  ( (Cell!1081 (v!11455 LongMapFixedSize!3920)) )
))
(declare-datatypes ((LongMap!1080 0))(
  ( (LongMap!1081 (underlying!551 Cell!1080)) )
))
(declare-fun thiss!821 () LongMap!1080)

(declare-fun tp_is_empty!17867 () Bool)

(declare-fun e!494599 () Bool)

(declare-fun array_inv!19568 (array!51700) Bool)

(declare-fun array_inv!19569 (array!51702) Bool)

(assert (=> b!887875 (= e!494599 (and tp!54560 tp_is_empty!17867 (array_inv!19568 (_keys!9828 (v!11455 (underlying!551 thiss!821)))) (array_inv!19569 (_values!5136 (v!11455 (underlying!551 thiss!821)))) e!494596))))

(declare-fun mapNonEmpty!28330 () Bool)

(declare-fun mapRes!28330 () Bool)

(declare-fun tp!54561 () Bool)

(declare-fun e!494603 () Bool)

(assert (=> mapNonEmpty!28330 (= mapRes!28330 (and tp!54561 e!494603))))

(declare-fun mapKey!28330 () (_ BitVec 32))

(declare-fun mapRest!28330 () (Array (_ BitVec 32) ValueCell!8452))

(declare-fun mapValue!28330 () ValueCell!8452)

(assert (=> mapNonEmpty!28330 (= (arr!24864 (_values!5136 (v!11455 (underlying!551 thiss!821)))) (store mapRest!28330 mapKey!28330 mapValue!28330))))

(declare-fun res!602219 () Bool)

(declare-fun e!494602 () Bool)

(assert (=> start!75412 (=> (not res!602219) (not e!494602))))

(declare-fun valid!1528 (LongMap!1080) Bool)

(assert (=> start!75412 (= res!602219 (valid!1528 thiss!821))))

(assert (=> start!75412 e!494602))

(assert (=> start!75412 e!494600))

(assert (=> start!75412 true))

(declare-fun b!887876 () Bool)

(assert (=> b!887876 (= e!494603 tp_is_empty!17867)))

(declare-fun mapIsEmpty!28330 () Bool)

(assert (=> mapIsEmpty!28330 mapRes!28330))

(declare-fun b!887877 () Bool)

(declare-fun e!494601 () Bool)

(assert (=> b!887877 (= e!494596 (and e!494601 mapRes!28330))))

(declare-fun condMapEmpty!28330 () Bool)

(declare-fun mapDefault!28330 () ValueCell!8452)

