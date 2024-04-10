; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107470 () Bool)

(assert start!107470)

(declare-fun b!1272907 () Bool)

(declare-fun b_free!27691 () Bool)

(declare-fun b_next!27691 () Bool)

(assert (=> b!1272907 (= b_free!27691 (not b_next!27691))))

(declare-fun tp!97604 () Bool)

(declare-fun b_and!45747 () Bool)

(assert (=> b!1272907 (= tp!97604 b_and!45747)))

(declare-datatypes ((V!49275 0))(
  ( (V!49276 (val!16605 Int)) )
))
(declare-datatypes ((ValueCell!15677 0))(
  ( (ValueCellFull!15677 (v!19242 V!49275)) (EmptyCell!15677) )
))
(declare-datatypes ((array!83384 0))(
  ( (array!83385 (arr!40222 (Array (_ BitVec 32) ValueCell!15677)) (size!40762 (_ BitVec 32))) )
))
(declare-datatypes ((array!83386 0))(
  ( (array!83387 (arr!40223 (Array (_ BitVec 32) (_ BitVec 64))) (size!40763 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6118 0))(
  ( (LongMapFixedSize!6119 (defaultEntry!6705 Int) (mask!34468 (_ BitVec 32)) (extraKeys!6384 (_ BitVec 32)) (zeroValue!6490 V!49275) (minValue!6490 V!49275) (_size!3114 (_ BitVec 32)) (_keys!12115 array!83386) (_values!6728 array!83384) (_vacant!3114 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6118)

(declare-fun e!726133 () Bool)

(declare-fun tp_is_empty!33061 () Bool)

(declare-fun e!726134 () Bool)

(declare-fun array_inv!30589 (array!83386) Bool)

(declare-fun array_inv!30590 (array!83384) Bool)

(assert (=> b!1272907 (= e!726133 (and tp!97604 tp_is_empty!33061 (array_inv!30589 (_keys!12115 thiss!1559)) (array_inv!30590 (_values!6728 thiss!1559)) e!726134))))

(declare-fun b!1272908 () Bool)

(declare-fun e!726135 () Bool)

(assert (=> b!1272908 (= e!726135 tp_is_empty!33061)))

(declare-fun b!1272909 () Bool)

(declare-fun e!726137 () Bool)

(assert (=> b!1272909 (= e!726137 (and (= (size!40762 (_values!6728 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34468 thiss!1559))) (= (size!40763 (_keys!12115 thiss!1559)) (size!40762 (_values!6728 thiss!1559))) (bvsge (mask!34468 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6384 thiss!1559) #b00000000000000000000000000000000) (bvsgt (extraKeys!6384 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1272910 () Bool)

(declare-fun e!726138 () Bool)

(declare-fun mapRes!51197 () Bool)

(assert (=> b!1272910 (= e!726134 (and e!726138 mapRes!51197))))

(declare-fun condMapEmpty!51197 () Bool)

(declare-fun mapDefault!51197 () ValueCell!15677)

