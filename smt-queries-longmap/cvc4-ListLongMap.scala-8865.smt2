; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107592 () Bool)

(assert start!107592)

(declare-fun b!1273631 () Bool)

(declare-fun b_free!27737 () Bool)

(declare-fun b_next!27737 () Bool)

(assert (=> b!1273631 (= b_free!27737 (not b_next!27737))))

(declare-fun tp!97765 () Bool)

(declare-fun b_and!45793 () Bool)

(assert (=> b!1273631 (= tp!97765 b_and!45793)))

(declare-fun b!1273626 () Bool)

(declare-fun e!726706 () Bool)

(declare-datatypes ((V!49335 0))(
  ( (V!49336 (val!16628 Int)) )
))
(declare-datatypes ((ValueCell!15700 0))(
  ( (ValueCellFull!15700 (v!19265 V!49335)) (EmptyCell!15700) )
))
(declare-datatypes ((array!83490 0))(
  ( (array!83491 (arr!40268 (Array (_ BitVec 32) ValueCell!15700)) (size!40812 (_ BitVec 32))) )
))
(declare-datatypes ((array!83492 0))(
  ( (array!83493 (arr!40269 (Array (_ BitVec 32) (_ BitVec 64))) (size!40813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6164 0))(
  ( (LongMapFixedSize!6165 (defaultEntry!6728 Int) (mask!34515 (_ BitVec 32)) (extraKeys!6407 (_ BitVec 32)) (zeroValue!6513 V!49335) (minValue!6513 V!49335) (_size!3137 (_ BitVec 32)) (_keys!12142 array!83492) (_values!6751 array!83490) (_vacant!3137 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6164)

(assert (=> b!1273626 (= e!726706 (not (= (size!40813 (_keys!12142 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34515 thiss!1551)))))))

(declare-fun mapIsEmpty!51289 () Bool)

(declare-fun mapRes!51289 () Bool)

(assert (=> mapIsEmpty!51289 mapRes!51289))

(declare-fun b!1273627 () Bool)

(declare-fun res!846916 () Bool)

(assert (=> b!1273627 (=> (not res!846916) (not e!726706))))

(declare-fun arrayCountValidKeys!0 (array!83492 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273627 (= res!846916 (= (arrayCountValidKeys!0 (_keys!12142 thiss!1551) #b00000000000000000000000000000000 (size!40813 (_keys!12142 thiss!1551))) (_size!3137 thiss!1551)))))

(declare-fun res!846917 () Bool)

(assert (=> start!107592 (=> (not res!846917) (not e!726706))))

(declare-fun simpleValid!471 (LongMapFixedSize!6164) Bool)

(assert (=> start!107592 (= res!846917 (simpleValid!471 thiss!1551))))

(assert (=> start!107592 e!726706))

(declare-fun e!726704 () Bool)

(assert (=> start!107592 e!726704))

(declare-fun b!1273628 () Bool)

(declare-fun e!726703 () Bool)

(declare-fun tp_is_empty!33107 () Bool)

(assert (=> b!1273628 (= e!726703 tp_is_empty!33107)))

(declare-fun b!1273629 () Bool)

(declare-fun e!726701 () Bool)

(assert (=> b!1273629 (= e!726701 tp_is_empty!33107)))

(declare-fun mapNonEmpty!51289 () Bool)

(declare-fun tp!97764 () Bool)

(assert (=> mapNonEmpty!51289 (= mapRes!51289 (and tp!97764 e!726703))))

(declare-fun mapValue!51289 () ValueCell!15700)

(declare-fun mapRest!51289 () (Array (_ BitVec 32) ValueCell!15700))

(declare-fun mapKey!51289 () (_ BitVec 32))

(assert (=> mapNonEmpty!51289 (= (arr!40268 (_values!6751 thiss!1551)) (store mapRest!51289 mapKey!51289 mapValue!51289))))

(declare-fun b!1273630 () Bool)

(declare-fun res!846918 () Bool)

(assert (=> b!1273630 (=> (not res!846918) (not e!726706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273630 (= res!846918 (validMask!0 (mask!34515 thiss!1551)))))

(declare-fun e!726705 () Bool)

(declare-fun array_inv!30615 (array!83492) Bool)

(declare-fun array_inv!30616 (array!83490) Bool)

(assert (=> b!1273631 (= e!726704 (and tp!97765 tp_is_empty!33107 (array_inv!30615 (_keys!12142 thiss!1551)) (array_inv!30616 (_values!6751 thiss!1551)) e!726705))))

(declare-fun b!1273632 () Bool)

(assert (=> b!1273632 (= e!726705 (and e!726701 mapRes!51289))))

(declare-fun condMapEmpty!51289 () Bool)

(declare-fun mapDefault!51289 () ValueCell!15700)

