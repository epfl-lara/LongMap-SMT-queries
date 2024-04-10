; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107556 () Bool)

(assert start!107556)

(declare-fun b!1273431 () Bool)

(declare-fun b_free!27721 () Bool)

(declare-fun b_next!27721 () Bool)

(assert (=> b!1273431 (= b_free!27721 (not b_next!27721))))

(declare-fun tp!97710 () Bool)

(declare-fun b_and!45777 () Bool)

(assert (=> b!1273431 (= tp!97710 b_and!45777)))

(declare-fun mapIsEmpty!51258 () Bool)

(declare-fun mapRes!51258 () Bool)

(assert (=> mapIsEmpty!51258 mapRes!51258))

(declare-fun b!1273427 () Bool)

(declare-fun e!726535 () Bool)

(declare-fun tp_is_empty!33091 () Bool)

(assert (=> b!1273427 (= e!726535 tp_is_empty!33091)))

(declare-fun b!1273428 () Bool)

(declare-fun e!726531 () Bool)

(declare-datatypes ((V!49315 0))(
  ( (V!49316 (val!16620 Int)) )
))
(declare-datatypes ((ValueCell!15692 0))(
  ( (ValueCellFull!15692 (v!19257 V!49315)) (EmptyCell!15692) )
))
(declare-datatypes ((array!83454 0))(
  ( (array!83455 (arr!40252 (Array (_ BitVec 32) ValueCell!15692)) (size!40794 (_ BitVec 32))) )
))
(declare-datatypes ((array!83456 0))(
  ( (array!83457 (arr!40253 (Array (_ BitVec 32) (_ BitVec 64))) (size!40795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6148 0))(
  ( (LongMapFixedSize!6149 (defaultEntry!6720 Int) (mask!34501 (_ BitVec 32)) (extraKeys!6399 (_ BitVec 32)) (zeroValue!6505 V!49315) (minValue!6505 V!49315) (_size!3129 (_ BitVec 32)) (_keys!12134 array!83456) (_values!6743 array!83454) (_vacant!3129 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6148)

(assert (=> b!1273428 (= e!726531 (and (bvsle #b00000000000000000000000000000000 (size!40795 (_keys!12134 thiss!1551))) (bvsge (size!40795 (_keys!12134 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1273429 () Bool)

(declare-fun e!726536 () Bool)

(declare-fun e!726533 () Bool)

(assert (=> b!1273429 (= e!726536 (and e!726533 mapRes!51258))))

(declare-fun condMapEmpty!51258 () Bool)

(declare-fun mapDefault!51258 () ValueCell!15692)

