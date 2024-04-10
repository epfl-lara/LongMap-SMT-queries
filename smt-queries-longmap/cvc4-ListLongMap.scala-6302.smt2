; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80644 () Bool)

(assert start!80644)

(declare-fun b!946309 () Bool)

(declare-fun b_free!18137 () Bool)

(declare-fun b_next!18137 () Bool)

(assert (=> b!946309 (= b_free!18137 (not b_next!18137))))

(declare-fun tp!62948 () Bool)

(declare-fun b_and!29559 () Bool)

(assert (=> b!946309 (= tp!62948 b_and!29559)))

(declare-fun b!946304 () Bool)

(declare-fun e!532434 () Bool)

(declare-fun e!532436 () Bool)

(assert (=> b!946304 (= e!532434 (not e!532436))))

(declare-fun res!635317 () Bool)

(assert (=> b!946304 (=> res!635317 e!532436)))

(declare-datatypes ((V!32491 0))(
  ( (V!32492 (val!10373 Int)) )
))
(declare-datatypes ((ValueCell!9841 0))(
  ( (ValueCellFull!9841 (v!12907 V!32491)) (EmptyCell!9841) )
))
(declare-datatypes ((array!57274 0))(
  ( (array!57275 (arr!27554 (Array (_ BitVec 32) ValueCell!9841)) (size!28024 (_ BitVec 32))) )
))
(declare-datatypes ((array!57276 0))(
  ( (array!57277 (arr!27555 (Array (_ BitVec 32) (_ BitVec 64))) (size!28025 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4832 0))(
  ( (LongMapFixedSize!4833 (defaultEntry!5713 Int) (mask!27410 (_ BitVec 32)) (extraKeys!5445 (_ BitVec 32)) (zeroValue!5549 V!32491) (minValue!5549 V!32491) (_size!2471 (_ BitVec 32)) (_keys!10605 array!57276) (_values!5736 array!57274) (_vacant!2471 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4832)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946304 (= res!635317 (not (validMask!0 (mask!27410 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946304 (arrayContainsKey!0 (_keys!10605 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9101 0))(
  ( (MissingZero!9101 (index!38775 (_ BitVec 32))) (Found!9101 (index!38776 (_ BitVec 32))) (Intermediate!9101 (undefined!9913 Bool) (index!38777 (_ BitVec 32)) (x!81362 (_ BitVec 32))) (Undefined!9101) (MissingVacant!9101 (index!38778 (_ BitVec 32))) )
))
(declare-fun lt!426252 () SeekEntryResult!9101)

(declare-datatypes ((Unit!31902 0))(
  ( (Unit!31903) )
))
(declare-fun lt!426251 () Unit!31902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57276 (_ BitVec 64) (_ BitVec 32)) Unit!31902)

(assert (=> b!946304 (= lt!426251 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10605 thiss!1141) key!756 (index!38776 lt!426252)))))

(declare-fun b!946305 () Bool)

(declare-fun e!532433 () Bool)

(declare-fun e!532435 () Bool)

(declare-fun mapRes!32821 () Bool)

(assert (=> b!946305 (= e!532433 (and e!532435 mapRes!32821))))

(declare-fun condMapEmpty!32821 () Bool)

(declare-fun mapDefault!32821 () ValueCell!9841)

