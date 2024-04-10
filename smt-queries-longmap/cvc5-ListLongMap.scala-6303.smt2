; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80676 () Bool)

(assert start!80676)

(declare-fun b!946475 () Bool)

(declare-fun b_free!18139 () Bool)

(declare-fun b_next!18139 () Bool)

(assert (=> b!946475 (= b_free!18139 (not b_next!18139))))

(declare-fun tp!62958 () Bool)

(declare-fun b_and!29561 () Bool)

(assert (=> b!946475 (= tp!62958 b_and!29561)))

(declare-fun b!946469 () Bool)

(declare-fun e!532539 () Bool)

(declare-fun e!532542 () Bool)

(assert (=> b!946469 (= e!532539 e!532542)))

(declare-fun res!635384 () Bool)

(assert (=> b!946469 (=> (not res!635384) (not e!532542))))

(declare-datatypes ((SeekEntryResult!9102 0))(
  ( (MissingZero!9102 (index!38779 (_ BitVec 32))) (Found!9102 (index!38780 (_ BitVec 32))) (Intermediate!9102 (undefined!9914 Bool) (index!38781 (_ BitVec 32)) (x!81388 (_ BitVec 32))) (Undefined!9102) (MissingVacant!9102 (index!38782 (_ BitVec 32))) )
))
(declare-fun lt!426303 () SeekEntryResult!9102)

(assert (=> b!946469 (= res!635384 (is-Found!9102 lt!426303))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32495 0))(
  ( (V!32496 (val!10374 Int)) )
))
(declare-datatypes ((ValueCell!9842 0))(
  ( (ValueCellFull!9842 (v!12908 V!32495)) (EmptyCell!9842) )
))
(declare-datatypes ((array!57280 0))(
  ( (array!57281 (arr!27556 (Array (_ BitVec 32) ValueCell!9842)) (size!28027 (_ BitVec 32))) )
))
(declare-datatypes ((array!57282 0))(
  ( (array!57283 (arr!27557 (Array (_ BitVec 32) (_ BitVec 64))) (size!28028 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4834 0))(
  ( (LongMapFixedSize!4835 (defaultEntry!5714 Int) (mask!27419 (_ BitVec 32)) (extraKeys!5446 (_ BitVec 32)) (zeroValue!5550 V!32495) (minValue!5550 V!32495) (_size!2472 (_ BitVec 32)) (_keys!10610 array!57282) (_values!5737 array!57280) (_vacant!2472 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4834)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57282 (_ BitVec 32)) SeekEntryResult!9102)

(assert (=> b!946469 (= lt!426303 (seekEntry!0 key!756 (_keys!10610 thiss!1141) (mask!27419 thiss!1141)))))

(declare-fun b!946470 () Bool)

(declare-fun e!532541 () Bool)

(declare-fun e!532538 () Bool)

(declare-fun mapRes!32828 () Bool)

(assert (=> b!946470 (= e!532541 (and e!532538 mapRes!32828))))

(declare-fun condMapEmpty!32828 () Bool)

(declare-fun mapDefault!32828 () ValueCell!9842)

