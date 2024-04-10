; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18598 () Bool)

(assert start!18598)

(declare-fun b!184137 () Bool)

(declare-fun b_free!4541 () Bool)

(declare-fun b_next!4541 () Bool)

(assert (=> b!184137 (= b_free!4541 (not b_next!4541))))

(declare-fun tp!16401 () Bool)

(declare-fun b_and!11123 () Bool)

(assert (=> b!184137 (= tp!16401 b_and!11123)))

(declare-fun b!184136 () Bool)

(declare-fun e!121218 () Bool)

(declare-fun e!121217 () Bool)

(assert (=> b!184136 (= e!121218 e!121217)))

(declare-fun res!87135 () Bool)

(assert (=> b!184136 (=> (not res!87135) (not e!121217))))

(declare-datatypes ((SeekEntryResult!626 0))(
  ( (MissingZero!626 (index!4674 (_ BitVec 32))) (Found!626 (index!4675 (_ BitVec 32))) (Intermediate!626 (undefined!1438 Bool) (index!4676 (_ BitVec 32)) (x!20032 (_ BitVec 32))) (Undefined!626) (MissingVacant!626 (index!4677 (_ BitVec 32))) )
))
(declare-fun lt!91037 () SeekEntryResult!626)

(assert (=> b!184136 (= res!87135 (and (not (is-Undefined!626 lt!91037)) (not (is-MissingVacant!626 lt!91037)) (not (is-MissingZero!626 lt!91037)) (is-Found!626 lt!91037)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5397 0))(
  ( (V!5398 (val!2201 Int)) )
))
(declare-datatypes ((ValueCell!1813 0))(
  ( (ValueCellFull!1813 (v!4106 V!5397)) (EmptyCell!1813) )
))
(declare-datatypes ((array!7823 0))(
  ( (array!7824 (arr!3697 (Array (_ BitVec 32) (_ BitVec 64))) (size!4011 (_ BitVec 32))) )
))
(declare-datatypes ((array!7825 0))(
  ( (array!7826 (arr!3698 (Array (_ BitVec 32) ValueCell!1813)) (size!4012 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2534 0))(
  ( (LongMapFixedSize!2535 (defaultEntry!3761 Int) (mask!8839 (_ BitVec 32)) (extraKeys!3498 (_ BitVec 32)) (zeroValue!3602 V!5397) (minValue!3602 V!5397) (_size!1316 (_ BitVec 32)) (_keys!5687 array!7823) (_values!3744 array!7825) (_vacant!1316 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2534)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7823 (_ BitVec 32)) SeekEntryResult!626)

(assert (=> b!184136 (= lt!91037 (seekEntryOrOpen!0 key!828 (_keys!5687 thiss!1248) (mask!8839 thiss!1248)))))

(declare-fun tp_is_empty!4313 () Bool)

(declare-fun e!121213 () Bool)

(declare-fun e!121214 () Bool)

(declare-fun array_inv!2393 (array!7823) Bool)

(declare-fun array_inv!2394 (array!7825) Bool)

(assert (=> b!184137 (= e!121214 (and tp!16401 tp_is_empty!4313 (array_inv!2393 (_keys!5687 thiss!1248)) (array_inv!2394 (_values!3744 thiss!1248)) e!121213))))

(declare-fun b!184138 () Bool)

(declare-fun res!87132 () Bool)

(assert (=> b!184138 (=> (not res!87132) (not e!121217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184138 (= res!87132 (validMask!0 (mask!8839 thiss!1248)))))

(declare-fun mapIsEmpty!7411 () Bool)

(declare-fun mapRes!7411 () Bool)

(assert (=> mapIsEmpty!7411 mapRes!7411))

(declare-fun b!184140 () Bool)

(declare-fun e!121216 () Bool)

(assert (=> b!184140 (= e!121213 (and e!121216 mapRes!7411))))

(declare-fun condMapEmpty!7411 () Bool)

(declare-fun mapDefault!7411 () ValueCell!1813)

