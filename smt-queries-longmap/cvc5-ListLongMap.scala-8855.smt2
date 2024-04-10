; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107412 () Bool)

(assert start!107412)

(declare-fun b!1272592 () Bool)

(declare-fun b_free!27673 () Bool)

(declare-fun b_next!27673 () Bool)

(assert (=> b!1272592 (= b_free!27673 (not b_next!27673))))

(declare-fun tp!97538 () Bool)

(declare-fun b_and!45729 () Bool)

(assert (=> b!1272592 (= tp!97538 b_and!45729)))

(declare-fun b!1272588 () Bool)

(declare-fun e!725884 () Bool)

(declare-fun tp_is_empty!33043 () Bool)

(assert (=> b!1272588 (= e!725884 tp_is_empty!33043)))

(declare-fun b!1272589 () Bool)

(declare-fun e!725881 () Bool)

(assert (=> b!1272589 (= e!725881 tp_is_empty!33043)))

(declare-fun mapNonEmpty!51159 () Bool)

(declare-fun mapRes!51159 () Bool)

(declare-fun tp!97539 () Bool)

(assert (=> mapNonEmpty!51159 (= mapRes!51159 (and tp!97539 e!725881))))

(declare-datatypes ((V!49251 0))(
  ( (V!49252 (val!16596 Int)) )
))
(declare-datatypes ((ValueCell!15668 0))(
  ( (ValueCellFull!15668 (v!19233 V!49251)) (EmptyCell!15668) )
))
(declare-datatypes ((array!83342 0))(
  ( (array!83343 (arr!40204 (Array (_ BitVec 32) ValueCell!15668)) (size!40742 (_ BitVec 32))) )
))
(declare-datatypes ((array!83344 0))(
  ( (array!83345 (arr!40205 (Array (_ BitVec 32) (_ BitVec 64))) (size!40743 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6100 0))(
  ( (LongMapFixedSize!6101 (defaultEntry!6696 Int) (mask!34448 (_ BitVec 32)) (extraKeys!6375 (_ BitVec 32)) (zeroValue!6481 V!49251) (minValue!6481 V!49251) (_size!3105 (_ BitVec 32)) (_keys!12104 array!83344) (_values!6719 array!83342) (_vacant!3105 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6100)

(declare-fun mapRest!51159 () (Array (_ BitVec 32) ValueCell!15668))

(declare-fun mapValue!51159 () ValueCell!15668)

(declare-fun mapKey!51159 () (_ BitVec 32))

(assert (=> mapNonEmpty!51159 (= (arr!40204 (_values!6719 thiss!1559)) (store mapRest!51159 mapKey!51159 mapValue!51159))))

(declare-fun b!1272590 () Bool)

(declare-fun e!725885 () Bool)

(assert (=> b!1272590 (= e!725885 (and e!725884 mapRes!51159))))

(declare-fun condMapEmpty!51159 () Bool)

(declare-fun mapDefault!51159 () ValueCell!15668)

