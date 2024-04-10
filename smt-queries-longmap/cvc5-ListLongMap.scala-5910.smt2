; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76512 () Bool)

(assert start!76512)

(declare-fun b!896754 () Bool)

(declare-fun b_free!15961 () Bool)

(declare-fun b_next!15961 () Bool)

(assert (=> b!896754 (= b_free!15961 (not b_next!15961))))

(declare-fun tp!55922 () Bool)

(declare-fun b_and!26253 () Bool)

(assert (=> b!896754 (= tp!55922 b_and!26253)))

(declare-fun b!896747 () Bool)

(declare-fun e!501300 () Bool)

(declare-fun e!501303 () Bool)

(assert (=> b!896747 (= e!501300 e!501303)))

(declare-fun res!606293 () Bool)

(assert (=> b!896747 (=> res!606293 e!501303)))

(declare-datatypes ((array!52598 0))(
  ( (array!52599 (arr!25285 (Array (_ BitVec 32) (_ BitVec 64))) (size!25737 (_ BitVec 32))) )
))
(declare-datatypes ((V!29351 0))(
  ( (V!29352 (val!9195 Int)) )
))
(declare-datatypes ((ValueCell!8663 0))(
  ( (ValueCellFull!8663 (v!11685 V!29351)) (EmptyCell!8663) )
))
(declare-datatypes ((array!52600 0))(
  ( (array!52601 (arr!25286 (Array (_ BitVec 32) ValueCell!8663)) (size!25738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4342 0))(
  ( (LongMapFixedSize!4343 (defaultEntry!5383 Int) (mask!26040 (_ BitVec 32)) (extraKeys!5087 (_ BitVec 32)) (zeroValue!5191 V!29351) (minValue!5191 V!29351) (_size!2226 (_ BitVec 32)) (_keys!10124 array!52598) (_values!5378 array!52600) (_vacant!2226 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4342)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896747 (= res!606293 (not (validMask!0 (mask!26040 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896747 (arrayContainsKey!0 (_keys!10124 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30492 0))(
  ( (Unit!30493) )
))
(declare-fun lt!404935 () Unit!30492)

(declare-datatypes ((SeekEntryResult!8901 0))(
  ( (MissingZero!8901 (index!37975 (_ BitVec 32))) (Found!8901 (index!37976 (_ BitVec 32))) (Intermediate!8901 (undefined!9713 Bool) (index!37977 (_ BitVec 32)) (x!76375 (_ BitVec 32))) (Undefined!8901) (MissingVacant!8901 (index!37978 (_ BitVec 32))) )
))
(declare-fun lt!404933 () SeekEntryResult!8901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52598 (_ BitVec 64) (_ BitVec 32)) Unit!30492)

(assert (=> b!896747 (= lt!404935 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10124 thiss!1181) key!785 (index!37976 lt!404933)))))

(declare-fun b!896748 () Bool)

(declare-fun res!606294 () Bool)

(declare-fun e!501308 () Bool)

(assert (=> b!896748 (=> (not res!606294) (not e!501308))))

(assert (=> b!896748 (= res!606294 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896749 () Bool)

(declare-fun e!501305 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896749 (= e!501305 (inRange!0 (index!37976 lt!404933) (mask!26040 thiss!1181)))))

(declare-fun b!896750 () Bool)

(declare-fun e!501307 () Bool)

(declare-fun tp_is_empty!18289 () Bool)

(assert (=> b!896750 (= e!501307 tp_is_empty!18289)))

(declare-fun res!606292 () Bool)

(assert (=> start!76512 (=> (not res!606292) (not e!501308))))

(declare-fun valid!1675 (LongMapFixedSize!4342) Bool)

(assert (=> start!76512 (= res!606292 (valid!1675 thiss!1181))))

(assert (=> start!76512 e!501308))

(declare-fun e!501301 () Bool)

(assert (=> start!76512 e!501301))

(assert (=> start!76512 true))

(declare-fun b!896751 () Bool)

(declare-fun e!501302 () Bool)

(declare-fun e!501304 () Bool)

(declare-fun mapRes!29058 () Bool)

(assert (=> b!896751 (= e!501302 (and e!501304 mapRes!29058))))

(declare-fun condMapEmpty!29058 () Bool)

(declare-fun mapDefault!29058 () ValueCell!8663)

