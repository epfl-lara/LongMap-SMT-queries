; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107642 () Bool)

(assert start!107642)

(declare-fun b!1273926 () Bool)

(declare-fun b_free!27757 () Bool)

(declare-fun b_next!27757 () Bool)

(assert (=> b!1273926 (= b_free!27757 (not b_next!27757))))

(declare-fun tp!97833 () Bool)

(declare-fun b_and!45813 () Bool)

(assert (=> b!1273926 (= tp!97833 b_and!45813)))

(declare-fun e!726940 () Bool)

(declare-fun e!726936 () Bool)

(declare-fun tp_is_empty!33127 () Bool)

(declare-datatypes ((V!49363 0))(
  ( (V!49364 (val!16638 Int)) )
))
(declare-datatypes ((ValueCell!15710 0))(
  ( (ValueCellFull!15710 (v!19275 V!49363)) (EmptyCell!15710) )
))
(declare-datatypes ((array!83536 0))(
  ( (array!83537 (arr!40288 (Array (_ BitVec 32) ValueCell!15710)) (size!40835 (_ BitVec 32))) )
))
(declare-datatypes ((array!83538 0))(
  ( (array!83539 (arr!40289 (Array (_ BitVec 32) (_ BitVec 64))) (size!40836 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6184 0))(
  ( (LongMapFixedSize!6185 (defaultEntry!6738 Int) (mask!34536 (_ BitVec 32)) (extraKeys!6417 (_ BitVec 32)) (zeroValue!6523 V!49363) (minValue!6523 V!49363) (_size!3147 (_ BitVec 32)) (_keys!12153 array!83538) (_values!6761 array!83536) (_vacant!3147 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6184)

(declare-fun array_inv!30627 (array!83538) Bool)

(declare-fun array_inv!30628 (array!83536) Bool)

(assert (=> b!1273926 (= e!726936 (and tp!97833 tp_is_empty!33127 (array_inv!30627 (_keys!12153 thiss!1551)) (array_inv!30628 (_values!6761 thiss!1551)) e!726940))))

(declare-fun mapNonEmpty!51328 () Bool)

(declare-fun mapRes!51328 () Bool)

(declare-fun tp!97834 () Bool)

(declare-fun e!726935 () Bool)

(assert (=> mapNonEmpty!51328 (= mapRes!51328 (and tp!97834 e!726935))))

(declare-fun mapRest!51328 () (Array (_ BitVec 32) ValueCell!15710))

(declare-fun mapValue!51328 () ValueCell!15710)

(declare-fun mapKey!51328 () (_ BitVec 32))

(assert (=> mapNonEmpty!51328 (= (arr!40288 (_values!6761 thiss!1551)) (store mapRest!51328 mapKey!51328 mapValue!51328))))

(declare-fun b!1273927 () Bool)

(declare-fun res!847031 () Bool)

(declare-fun e!726939 () Bool)

(assert (=> b!1273927 (=> (not res!847031) (not e!726939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83538 (_ BitVec 32)) Bool)

(assert (=> b!1273927 (= res!847031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12153 thiss!1551) (mask!34536 thiss!1551)))))

(declare-fun res!847030 () Bool)

(assert (=> start!107642 (=> (not res!847030) (not e!726939))))

(declare-fun simpleValid!479 (LongMapFixedSize!6184) Bool)

(assert (=> start!107642 (= res!847030 (simpleValid!479 thiss!1551))))

(assert (=> start!107642 e!726939))

(assert (=> start!107642 e!726936))

(declare-fun mapIsEmpty!51328 () Bool)

(assert (=> mapIsEmpty!51328 mapRes!51328))

(declare-fun b!1273928 () Bool)

(assert (=> b!1273928 (= e!726939 (and (bvsle #b00000000000000000000000000000000 (size!40836 (_keys!12153 thiss!1551))) (bvsge (size!40836 (_keys!12153 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1273929 () Bool)

(declare-fun e!726937 () Bool)

(assert (=> b!1273929 (= e!726940 (and e!726937 mapRes!51328))))

(declare-fun condMapEmpty!51328 () Bool)

(declare-fun mapDefault!51328 () ValueCell!15710)

