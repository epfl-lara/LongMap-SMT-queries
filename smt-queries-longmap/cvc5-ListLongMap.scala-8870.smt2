; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107670 () Bool)

(assert start!107670)

(declare-fun b!1274072 () Bool)

(declare-fun b_free!27763 () Bool)

(declare-fun b_next!27763 () Bool)

(assert (=> b!1274072 (= b_free!27763 (not b_next!27763))))

(declare-fun tp!97856 () Bool)

(declare-fun b_and!45819 () Bool)

(assert (=> b!1274072 (= tp!97856 b_and!45819)))

(declare-fun mapIsEmpty!51341 () Bool)

(declare-fun mapRes!51341 () Bool)

(assert (=> mapIsEmpty!51341 mapRes!51341))

(declare-fun b!1274069 () Bool)

(declare-fun res!847088 () Bool)

(declare-fun e!727038 () Bool)

(assert (=> b!1274069 (=> (not res!847088) (not e!727038))))

(declare-datatypes ((V!49371 0))(
  ( (V!49372 (val!16641 Int)) )
))
(declare-datatypes ((ValueCell!15713 0))(
  ( (ValueCellFull!15713 (v!19278 V!49371)) (EmptyCell!15713) )
))
(declare-datatypes ((array!83550 0))(
  ( (array!83551 (arr!40294 (Array (_ BitVec 32) ValueCell!15713)) (size!40842 (_ BitVec 32))) )
))
(declare-datatypes ((array!83552 0))(
  ( (array!83553 (arr!40295 (Array (_ BitVec 32) (_ BitVec 64))) (size!40843 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6190 0))(
  ( (LongMapFixedSize!6191 (defaultEntry!6741 Int) (mask!34544 (_ BitVec 32)) (extraKeys!6420 (_ BitVec 32)) (zeroValue!6526 V!49371) (minValue!6526 V!49371) (_size!3150 (_ BitVec 32)) (_keys!12158 array!83552) (_values!6764 array!83550) (_vacant!3150 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6190)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83552 (_ BitVec 32)) Bool)

(assert (=> b!1274069 (= res!847088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12158 thiss!1551) (mask!34544 thiss!1551)))))

(declare-fun b!1274070 () Bool)

(declare-fun res!847086 () Bool)

(assert (=> b!1274070 (=> (not res!847086) (not e!727038))))

(assert (=> b!1274070 (= res!847086 (and (bvsle #b00000000000000000000000000000000 (size!40843 (_keys!12158 thiss!1551))) (bvslt (size!40843 (_keys!12158 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1274071 () Bool)

(declare-fun e!727039 () Bool)

(declare-fun e!727040 () Bool)

(assert (=> b!1274071 (= e!727039 (and e!727040 mapRes!51341))))

(declare-fun condMapEmpty!51341 () Bool)

(declare-fun mapDefault!51341 () ValueCell!15713)

