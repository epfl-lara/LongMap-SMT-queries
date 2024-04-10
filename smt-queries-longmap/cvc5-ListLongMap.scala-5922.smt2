; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76978 () Bool)

(assert start!76978)

(declare-fun b!899446 () Bool)

(declare-fun b_free!16033 () Bool)

(declare-fun b_next!16033 () Bool)

(assert (=> b!899446 (= b_free!16033 (not b_next!16033))))

(declare-fun tp!56179 () Bool)

(declare-fun b_and!26341 () Bool)

(assert (=> b!899446 (= tp!56179 b_and!26341)))

(declare-fun b!899440 () Bool)

(declare-fun e!503284 () Bool)

(declare-fun tp_is_empty!18361 () Bool)

(assert (=> b!899440 (= e!503284 tp_is_empty!18361)))

(declare-fun b!899441 () Bool)

(declare-fun e!503276 () Bool)

(declare-fun e!503279 () Bool)

(assert (=> b!899441 (= e!503276 (not e!503279))))

(declare-fun res!607615 () Bool)

(assert (=> b!899441 (=> res!607615 e!503279)))

(declare-datatypes ((SeekEntryResult!8932 0))(
  ( (MissingZero!8932 (index!38099 (_ BitVec 32))) (Found!8932 (index!38100 (_ BitVec 32))) (Intermediate!8932 (undefined!9744 Bool) (index!38101 (_ BitVec 32)) (x!76649 (_ BitVec 32))) (Undefined!8932) (MissingVacant!8932 (index!38102 (_ BitVec 32))) )
))
(declare-fun lt!406232 () SeekEntryResult!8932)

(assert (=> b!899441 (= res!607615 (not (is-Found!8932 lt!406232)))))

(declare-fun e!503280 () Bool)

(assert (=> b!899441 e!503280))

(declare-fun res!607614 () Bool)

(assert (=> b!899441 (=> res!607614 e!503280)))

(assert (=> b!899441 (= res!607614 (not (is-Found!8932 lt!406232)))))

(declare-datatypes ((Unit!30564 0))(
  ( (Unit!30565) )
))
(declare-fun lt!406233 () Unit!30564)

(declare-datatypes ((array!52766 0))(
  ( (array!52767 (arr!25357 (Array (_ BitVec 32) (_ BitVec 64))) (size!25814 (_ BitVec 32))) )
))
(declare-datatypes ((V!29447 0))(
  ( (V!29448 (val!9231 Int)) )
))
(declare-datatypes ((ValueCell!8699 0))(
  ( (ValueCellFull!8699 (v!11725 V!29447)) (EmptyCell!8699) )
))
(declare-datatypes ((array!52768 0))(
  ( (array!52769 (arr!25358 (Array (_ BitVec 32) ValueCell!8699)) (size!25815 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4414 0))(
  ( (LongMapFixedSize!4415 (defaultEntry!5431 Int) (mask!26189 (_ BitVec 32)) (extraKeys!5152 (_ BitVec 32)) (zeroValue!5256 V!29447) (minValue!5256 V!29447) (_size!2262 (_ BitVec 32)) (_keys!10220 array!52766) (_values!5443 array!52768) (_vacant!2262 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4414)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!96 (array!52766 array!52768 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 64)) Unit!30564)

(assert (=> b!899441 (= lt!406233 (lemmaSeekEntryGivesInRangeIndex!96 (_keys!10220 thiss!1181) (_values!5443 thiss!1181) (mask!26189 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52766 (_ BitVec 32)) SeekEntryResult!8932)

(assert (=> b!899441 (= lt!406232 (seekEntry!0 key!785 (_keys!10220 thiss!1181) (mask!26189 thiss!1181)))))

(declare-fun b!899442 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899442 (= e!503280 (inRange!0 (index!38100 lt!406232) (mask!26189 thiss!1181)))))

(declare-fun b!899443 () Bool)

(declare-fun e!503283 () Bool)

(assert (=> b!899443 (= e!503283 (or (not (= (size!25815 (_values!5443 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26189 thiss!1181)))) (not (= (size!25814 (_keys!10220 thiss!1181)) (size!25815 (_values!5443 thiss!1181)))) (bvslt (mask!26189 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5152 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!899444 () Bool)

(declare-fun res!607616 () Bool)

(assert (=> b!899444 (=> (not res!607616) (not e!503276))))

(assert (=> b!899444 (= res!607616 (not (= key!785 (bvneg key!785))))))

(declare-fun b!899445 () Bool)

(declare-fun e!503281 () Bool)

(declare-fun e!503282 () Bool)

(declare-fun mapRes!29207 () Bool)

(assert (=> b!899445 (= e!503281 (and e!503282 mapRes!29207))))

(declare-fun condMapEmpty!29207 () Bool)

(declare-fun mapDefault!29207 () ValueCell!8699)

