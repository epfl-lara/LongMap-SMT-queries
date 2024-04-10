; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80640 () Bool)

(assert start!80640)

(declare-fun b!946261 () Bool)

(declare-fun b_free!18133 () Bool)

(declare-fun b_next!18133 () Bool)

(assert (=> b!946261 (= b_free!18133 (not b_next!18133))))

(declare-fun tp!62937 () Bool)

(declare-fun b_and!29555 () Bool)

(assert (=> b!946261 (= tp!62937 b_and!29555)))

(declare-fun b!946256 () Bool)

(declare-fun e!532383 () Bool)

(declare-fun e!532385 () Bool)

(assert (=> b!946256 (= e!532383 e!532385)))

(declare-fun res!635293 () Bool)

(assert (=> b!946256 (=> (not res!635293) (not e!532385))))

(declare-datatypes ((SeekEntryResult!9099 0))(
  ( (MissingZero!9099 (index!38767 (_ BitVec 32))) (Found!9099 (index!38768 (_ BitVec 32))) (Intermediate!9099 (undefined!9911 Bool) (index!38769 (_ BitVec 32)) (x!81360 (_ BitVec 32))) (Undefined!9099) (MissingVacant!9099 (index!38770 (_ BitVec 32))) )
))
(declare-fun lt!426240 () SeekEntryResult!9099)

(assert (=> b!946256 (= res!635293 (is-Found!9099 lt!426240))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32487 0))(
  ( (V!32488 (val!10371 Int)) )
))
(declare-datatypes ((ValueCell!9839 0))(
  ( (ValueCellFull!9839 (v!12905 V!32487)) (EmptyCell!9839) )
))
(declare-datatypes ((array!57266 0))(
  ( (array!57267 (arr!27550 (Array (_ BitVec 32) ValueCell!9839)) (size!28020 (_ BitVec 32))) )
))
(declare-datatypes ((array!57268 0))(
  ( (array!57269 (arr!27551 (Array (_ BitVec 32) (_ BitVec 64))) (size!28021 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4828 0))(
  ( (LongMapFixedSize!4829 (defaultEntry!5711 Int) (mask!27408 (_ BitVec 32)) (extraKeys!5443 (_ BitVec 32)) (zeroValue!5547 V!32487) (minValue!5547 V!32487) (_size!2469 (_ BitVec 32)) (_keys!10603 array!57268) (_values!5734 array!57266) (_vacant!2469 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4828)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57268 (_ BitVec 32)) SeekEntryResult!9099)

(assert (=> b!946256 (= lt!426240 (seekEntry!0 key!756 (_keys!10603 thiss!1141) (mask!27408 thiss!1141)))))

(declare-fun b!946257 () Bool)

(declare-fun e!532388 () Bool)

(declare-fun e!532381 () Bool)

(declare-fun mapRes!32815 () Bool)

(assert (=> b!946257 (= e!532388 (and e!532381 mapRes!32815))))

(declare-fun condMapEmpty!32815 () Bool)

(declare-fun mapDefault!32815 () ValueCell!9839)

