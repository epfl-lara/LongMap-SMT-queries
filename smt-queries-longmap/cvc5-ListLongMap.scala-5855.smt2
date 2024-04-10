; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75660 () Bool)

(assert start!75660)

(declare-fun b!889525 () Bool)

(declare-fun b_free!15631 () Bool)

(declare-fun b_next!15631 () Bool)

(assert (=> b!889525 (= b_free!15631 (not b_next!15631))))

(declare-fun tp!54861 () Bool)

(declare-fun b_and!25871 () Bool)

(assert (=> b!889525 (= tp!54861 b_and!25871)))

(declare-fun mapNonEmpty!28493 () Bool)

(declare-fun mapRes!28493 () Bool)

(declare-fun tp!54862 () Bool)

(declare-fun e!495853 () Bool)

(assert (=> mapNonEmpty!28493 (= mapRes!28493 (and tp!54862 e!495853))))

(declare-datatypes ((array!51898 0))(
  ( (array!51899 (arr!24955 (Array (_ BitVec 32) (_ BitVec 64))) (size!25399 (_ BitVec 32))) )
))
(declare-datatypes ((V!28911 0))(
  ( (V!28912 (val!9030 Int)) )
))
(declare-datatypes ((ValueCell!8498 0))(
  ( (ValueCellFull!8498 (v!11508 V!28911)) (EmptyCell!8498) )
))
(declare-datatypes ((array!51900 0))(
  ( (array!51901 (arr!24956 (Array (_ BitVec 32) ValueCell!8498)) (size!25400 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4012 0))(
  ( (LongMapFixedSize!4013 (defaultEntry!5203 Int) (mask!25654 (_ BitVec 32)) (extraKeys!4897 (_ BitVec 32)) (zeroValue!5001 V!28911) (minValue!5001 V!28911) (_size!2061 (_ BitVec 32)) (_keys!9886 array!51898) (_values!5188 array!51900) (_vacant!2061 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4012)

(declare-fun mapValue!28493 () ValueCell!8498)

(declare-fun mapKey!28493 () (_ BitVec 32))

(declare-fun mapRest!28493 () (Array (_ BitVec 32) ValueCell!8498))

(assert (=> mapNonEmpty!28493 (= (arr!24956 (_values!5188 thiss!1181)) (store mapRest!28493 mapKey!28493 mapValue!28493))))

(declare-fun e!495854 () Bool)

(declare-fun e!495857 () Bool)

(declare-fun tp_is_empty!17959 () Bool)

(declare-fun array_inv!19630 (array!51898) Bool)

(declare-fun array_inv!19631 (array!51900) Bool)

(assert (=> b!889525 (= e!495857 (and tp!54861 tp_is_empty!17959 (array_inv!19630 (_keys!9886 thiss!1181)) (array_inv!19631 (_values!5188 thiss!1181)) e!495854))))

(declare-fun b!889526 () Bool)

(declare-fun e!495856 () Bool)

(assert (=> b!889526 (= e!495856 tp_is_empty!17959)))

(declare-fun b!889527 () Bool)

(assert (=> b!889527 (= e!495854 (and e!495856 mapRes!28493))))

(declare-fun condMapEmpty!28493 () Bool)

(declare-fun mapDefault!28493 () ValueCell!8498)

