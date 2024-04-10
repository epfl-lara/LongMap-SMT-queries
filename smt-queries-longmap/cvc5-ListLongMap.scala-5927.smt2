; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77222 () Bool)

(assert start!77222)

(declare-fun b!900989 () Bool)

(declare-fun b_free!16063 () Bool)

(declare-fun b_next!16063 () Bool)

(assert (=> b!900989 (= b_free!16063 (not b_next!16063))))

(declare-fun tp!56285 () Bool)

(declare-fun b_and!26389 () Bool)

(assert (=> b!900989 (= tp!56285 b_and!26389)))

(declare-fun b!900983 () Bool)

(declare-fun e!504356 () Bool)

(declare-datatypes ((SeekEntryResult!8945 0))(
  ( (MissingZero!8945 (index!38151 (_ BitVec 32))) (Found!8945 (index!38152 (_ BitVec 32))) (Intermediate!8945 (undefined!9757 Bool) (index!38153 (_ BitVec 32)) (x!76768 (_ BitVec 32))) (Undefined!8945) (MissingVacant!8945 (index!38154 (_ BitVec 32))) )
))
(declare-fun lt!407192 () SeekEntryResult!8945)

(declare-datatypes ((array!52836 0))(
  ( (array!52837 (arr!25387 (Array (_ BitVec 32) (_ BitVec 64))) (size!25846 (_ BitVec 32))) )
))
(declare-datatypes ((V!29487 0))(
  ( (V!29488 (val!9246 Int)) )
))
(declare-datatypes ((ValueCell!8714 0))(
  ( (ValueCellFull!8714 (v!11745 V!29487)) (EmptyCell!8714) )
))
(declare-datatypes ((array!52838 0))(
  ( (array!52839 (arr!25388 (Array (_ BitVec 32) ValueCell!8714)) (size!25847 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4444 0))(
  ( (LongMapFixedSize!4445 (defaultEntry!5460 Int) (mask!26261 (_ BitVec 32)) (extraKeys!5188 (_ BitVec 32)) (zeroValue!5292 V!29487) (minValue!5292 V!29487) (_size!2277 (_ BitVec 32)) (_keys!10270 array!52836) (_values!5479 array!52838) (_vacant!2277 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4444)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900983 (= e!504356 (inRange!0 (index!38152 lt!407192) (mask!26261 thiss!1181)))))

(declare-fun b!900984 () Bool)

(declare-fun e!504351 () Bool)

(assert (=> b!900984 (= e!504351 e!504356)))

(declare-fun res!608369 () Bool)

(assert (=> b!900984 (=> res!608369 e!504356)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900984 (= res!608369 (not (validMask!0 (mask!26261 thiss!1181))))))

(declare-datatypes ((tuple2!12058 0))(
  ( (tuple2!12059 (_1!6040 (_ BitVec 64)) (_2!6040 V!29487)) )
))
(declare-datatypes ((List!17863 0))(
  ( (Nil!17860) (Cons!17859 (h!19005 tuple2!12058) (t!25220 List!17863)) )
))
(declare-datatypes ((ListLongMap!10755 0))(
  ( (ListLongMap!10756 (toList!5393 List!17863)) )
))
(declare-fun lt!407194 () ListLongMap!10755)

(declare-fun contains!4432 (ListLongMap!10755 (_ BitVec 64)) Bool)

(assert (=> b!900984 (contains!4432 lt!407194 (select (arr!25387 (_keys!10270 thiss!1181)) (index!38152 lt!407192)))))

(declare-fun getCurrentListMap!2666 (array!52836 array!52838 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 32) Int) ListLongMap!10755)

(assert (=> b!900984 (= lt!407194 (getCurrentListMap!2666 (_keys!10270 thiss!1181) (_values!5479 thiss!1181) (mask!26261 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5460 thiss!1181)))))

(declare-datatypes ((Unit!30603 0))(
  ( (Unit!30604) )
))
(declare-fun lt!407190 () Unit!30603)

(declare-fun lemmaValidKeyInArrayIsInListMap!255 (array!52836 array!52838 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 32) Int) Unit!30603)

(assert (=> b!900984 (= lt!407190 (lemmaValidKeyInArrayIsInListMap!255 (_keys!10270 thiss!1181) (_values!5479 thiss!1181) (mask!26261 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) (index!38152 lt!407192) (defaultEntry!5460 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900984 (arrayContainsKey!0 (_keys!10270 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407193 () Unit!30603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52836 (_ BitVec 64) (_ BitVec 32)) Unit!30603)

(assert (=> b!900984 (= lt!407193 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10270 thiss!1181) key!785 (index!38152 lt!407192)))))

(declare-fun b!900985 () Bool)

(declare-fun e!504357 () Bool)

(declare-fun tp_is_empty!18391 () Bool)

(assert (=> b!900985 (= e!504357 tp_is_empty!18391)))

(declare-fun b!900986 () Bool)

(declare-fun e!504355 () Bool)

(assert (=> b!900986 (= e!504355 (inRange!0 (index!38152 lt!407192) (mask!26261 thiss!1181)))))

(declare-fun mapNonEmpty!29269 () Bool)

(declare-fun mapRes!29269 () Bool)

(declare-fun tp!56286 () Bool)

(assert (=> mapNonEmpty!29269 (= mapRes!29269 (and tp!56286 e!504357))))

(declare-fun mapValue!29269 () ValueCell!8714)

(declare-fun mapRest!29269 () (Array (_ BitVec 32) ValueCell!8714))

(declare-fun mapKey!29269 () (_ BitVec 32))

(assert (=> mapNonEmpty!29269 (= (arr!25388 (_values!5479 thiss!1181)) (store mapRest!29269 mapKey!29269 mapValue!29269))))

(declare-fun b!900987 () Bool)

(declare-fun res!608370 () Bool)

(assert (=> b!900987 (=> res!608370 e!504356)))

(assert (=> b!900987 (= res!608370 (not (contains!4432 lt!407194 key!785)))))

(declare-fun res!608368 () Bool)

(declare-fun e!504352 () Bool)

(assert (=> start!77222 (=> (not res!608368) (not e!504352))))

(declare-fun valid!1705 (LongMapFixedSize!4444) Bool)

(assert (=> start!77222 (= res!608368 (valid!1705 thiss!1181))))

(assert (=> start!77222 e!504352))

(declare-fun e!504354 () Bool)

(assert (=> start!77222 e!504354))

(assert (=> start!77222 true))

(declare-fun b!900988 () Bool)

(declare-fun res!608372 () Bool)

(assert (=> b!900988 (=> res!608372 e!504356)))

(declare-datatypes ((List!17864 0))(
  ( (Nil!17861) (Cons!17860 (h!19006 (_ BitVec 64)) (t!25221 List!17864)) )
))
(declare-fun arrayNoDuplicates!0 (array!52836 (_ BitVec 32) List!17864) Bool)

(assert (=> b!900988 (= res!608372 (not (arrayNoDuplicates!0 (_keys!10270 thiss!1181) #b00000000000000000000000000000000 Nil!17861)))))

(declare-fun e!504353 () Bool)

(declare-fun array_inv!19914 (array!52836) Bool)

(declare-fun array_inv!19915 (array!52838) Bool)

(assert (=> b!900989 (= e!504354 (and tp!56285 tp_is_empty!18391 (array_inv!19914 (_keys!10270 thiss!1181)) (array_inv!19915 (_values!5479 thiss!1181)) e!504353))))

(declare-fun mapIsEmpty!29269 () Bool)

(assert (=> mapIsEmpty!29269 mapRes!29269))

(declare-fun b!900990 () Bool)

(declare-fun res!608374 () Bool)

(assert (=> b!900990 (=> res!608374 e!504356)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52836 (_ BitVec 32)) Bool)

(assert (=> b!900990 (= res!608374 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10270 thiss!1181) (mask!26261 thiss!1181))))))

(declare-fun b!900991 () Bool)

(assert (=> b!900991 (= e!504352 (not e!504351))))

(declare-fun res!608367 () Bool)

(assert (=> b!900991 (=> res!608367 e!504351)))

(assert (=> b!900991 (= res!608367 (not (is-Found!8945 lt!407192)))))

(assert (=> b!900991 e!504355))

(declare-fun res!608373 () Bool)

(assert (=> b!900991 (=> res!608373 e!504355)))

(assert (=> b!900991 (= res!608373 (not (is-Found!8945 lt!407192)))))

(declare-fun lt!407191 () Unit!30603)

(declare-fun lemmaSeekEntryGivesInRangeIndex!106 (array!52836 array!52838 (_ BitVec 32) (_ BitVec 32) V!29487 V!29487 (_ BitVec 64)) Unit!30603)

(assert (=> b!900991 (= lt!407191 (lemmaSeekEntryGivesInRangeIndex!106 (_keys!10270 thiss!1181) (_values!5479 thiss!1181) (mask!26261 thiss!1181) (extraKeys!5188 thiss!1181) (zeroValue!5292 thiss!1181) (minValue!5292 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52836 (_ BitVec 32)) SeekEntryResult!8945)

(assert (=> b!900991 (= lt!407192 (seekEntry!0 key!785 (_keys!10270 thiss!1181) (mask!26261 thiss!1181)))))

(declare-fun b!900992 () Bool)

(declare-fun e!504359 () Bool)

(assert (=> b!900992 (= e!504359 tp_is_empty!18391)))

(declare-fun b!900993 () Bool)

(assert (=> b!900993 (= e!504353 (and e!504359 mapRes!29269))))

(declare-fun condMapEmpty!29269 () Bool)

(declare-fun mapDefault!29269 () ValueCell!8714)

