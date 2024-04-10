; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89448 () Bool)

(assert start!89448)

(declare-fun b!1025757 () Bool)

(declare-fun b_free!20447 () Bool)

(declare-fun b_next!20447 () Bool)

(assert (=> b!1025757 (= b_free!20447 (not b_next!20447))))

(declare-fun tp!72387 () Bool)

(declare-fun b_and!32693 () Bool)

(assert (=> b!1025757 (= tp!72387 b_and!32693)))

(declare-fun b!1025749 () Bool)

(declare-fun e!578421 () Bool)

(declare-fun tp_is_empty!24167 () Bool)

(assert (=> b!1025749 (= e!578421 tp_is_empty!24167)))

(declare-fun res!686734 () Bool)

(declare-fun e!578415 () Bool)

(assert (=> start!89448 (=> (not res!686734) (not e!578415))))

(declare-datatypes ((V!37095 0))(
  ( (V!37096 (val!12134 Int)) )
))
(declare-datatypes ((ValueCell!11380 0))(
  ( (ValueCellFull!11380 (v!14703 V!37095)) (EmptyCell!11380) )
))
(declare-datatypes ((array!64384 0))(
  ( (array!64385 (arr!31001 (Array (_ BitVec 32) (_ BitVec 64))) (size!31514 (_ BitVec 32))) )
))
(declare-datatypes ((array!64386 0))(
  ( (array!64387 (arr!31002 (Array (_ BitVec 32) ValueCell!11380)) (size!31515 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5354 0))(
  ( (LongMapFixedSize!5355 (defaultEntry!6029 Int) (mask!29705 (_ BitVec 32)) (extraKeys!5761 (_ BitVec 32)) (zeroValue!5865 V!37095) (minValue!5865 V!37095) (_size!2732 (_ BitVec 32)) (_keys!11176 array!64384) (_values!6052 array!64386) (_vacant!2732 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5354)

(declare-fun valid!2035 (LongMapFixedSize!5354) Bool)

(assert (=> start!89448 (= res!686734 (valid!2035 thiss!1427))))

(assert (=> start!89448 e!578415))

(declare-fun e!578417 () Bool)

(assert (=> start!89448 e!578417))

(assert (=> start!89448 true))

(declare-fun b!1025750 () Bool)

(declare-fun res!686729 () Bool)

(declare-fun e!578416 () Bool)

(assert (=> b!1025750 (=> res!686729 e!578416)))

(declare-datatypes ((SeekEntryResult!9628 0))(
  ( (MissingZero!9628 (index!40883 (_ BitVec 32))) (Found!9628 (index!40884 (_ BitVec 32))) (Intermediate!9628 (undefined!10440 Bool) (index!40885 (_ BitVec 32)) (x!91218 (_ BitVec 32))) (Undefined!9628) (MissingVacant!9628 (index!40886 (_ BitVec 32))) )
))
(declare-fun lt!451081 () SeekEntryResult!9628)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025750 (= res!686729 (not (validKeyInArray!0 (select (arr!31001 (_keys!11176 thiss!1427)) (index!40884 lt!451081)))))))

(declare-fun mapIsEmpty!37679 () Bool)

(declare-fun mapRes!37679 () Bool)

(assert (=> mapIsEmpty!37679 mapRes!37679))

(declare-fun b!1025751 () Bool)

(declare-fun e!578420 () Bool)

(declare-fun e!578418 () Bool)

(assert (=> b!1025751 (= e!578420 (and e!578418 mapRes!37679))))

(declare-fun condMapEmpty!37679 () Bool)

(declare-fun mapDefault!37679 () ValueCell!11380)

