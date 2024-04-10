; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76744 () Bool)

(assert start!76744)

(declare-fun b!898069 () Bool)

(declare-fun b_free!16003 () Bool)

(declare-fun b_next!16003 () Bool)

(assert (=> b!898069 (= b_free!16003 (not b_next!16003))))

(declare-fun tp!56072 () Bool)

(declare-fun b_and!26295 () Bool)

(assert (=> b!898069 (= tp!56072 b_and!26295)))

(declare-fun b!898059 () Bool)

(declare-fun e!502298 () Bool)

(declare-datatypes ((array!52696 0))(
  ( (array!52697 (arr!25327 (Array (_ BitVec 32) (_ BitVec 64))) (size!25782 (_ BitVec 32))) )
))
(declare-datatypes ((V!29407 0))(
  ( (V!29408 (val!9216 Int)) )
))
(declare-datatypes ((ValueCell!8684 0))(
  ( (ValueCellFull!8684 (v!11706 V!29407)) (EmptyCell!8684) )
))
(declare-datatypes ((array!52698 0))(
  ( (array!52699 (arr!25328 (Array (_ BitVec 32) ValueCell!8684)) (size!25783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4384 0))(
  ( (LongMapFixedSize!4385 (defaultEntry!5404 Int) (mask!26121 (_ BitVec 32)) (extraKeys!5118 (_ BitVec 32)) (zeroValue!5222 V!29407) (minValue!5222 V!29407) (_size!2247 (_ BitVec 32)) (_keys!10174 array!52696) (_values!5409 array!52698) (_vacant!2247 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4384)

(declare-datatypes ((SeekEntryResult!8919 0))(
  ( (MissingZero!8919 (index!38047 (_ BitVec 32))) (Found!8919 (index!38048 (_ BitVec 32))) (Intermediate!8919 (undefined!9731 Bool) (index!38049 (_ BitVec 32)) (x!76532 (_ BitVec 32))) (Undefined!8919) (MissingVacant!8919 (index!38050 (_ BitVec 32))) )
))
(declare-fun lt!405396 () SeekEntryResult!8919)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898059 (= e!502298 (validKeyInArray!0 (select (arr!25327 (_keys!10174 thiss!1181)) (index!38048 lt!405396))))))

(declare-fun b!898060 () Bool)

(declare-fun res!606960 () Bool)

(assert (=> b!898060 (=> res!606960 e!502298)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52696 (_ BitVec 32)) Bool)

(assert (=> b!898060 (= res!606960 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10174 thiss!1181) (mask!26121 thiss!1181))))))

(declare-fun b!898061 () Bool)

(declare-fun e!502293 () Bool)

(declare-fun e!502295 () Bool)

(assert (=> b!898061 (= e!502293 (not e!502295))))

(declare-fun res!606961 () Bool)

(assert (=> b!898061 (=> res!606961 e!502295)))

(assert (=> b!898061 (= res!606961 (not (is-Found!8919 lt!405396)))))

(declare-fun e!502291 () Bool)

(assert (=> b!898061 e!502291))

(declare-fun res!606957 () Bool)

(assert (=> b!898061 (=> res!606957 e!502291)))

(assert (=> b!898061 (= res!606957 (not (is-Found!8919 lt!405396)))))

(declare-datatypes ((Unit!30528 0))(
  ( (Unit!30529) )
))
(declare-fun lt!405397 () Unit!30528)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!88 (array!52696 array!52698 (_ BitVec 32) (_ BitVec 32) V!29407 V!29407 (_ BitVec 64)) Unit!30528)

(assert (=> b!898061 (= lt!405397 (lemmaSeekEntryGivesInRangeIndex!88 (_keys!10174 thiss!1181) (_values!5409 thiss!1181) (mask!26121 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52696 (_ BitVec 32)) SeekEntryResult!8919)

(assert (=> b!898061 (= lt!405396 (seekEntry!0 key!785 (_keys!10174 thiss!1181) (mask!26121 thiss!1181)))))

(declare-fun b!898062 () Bool)

(assert (=> b!898062 (= e!502295 e!502298)))

(declare-fun res!606955 () Bool)

(assert (=> b!898062 (=> res!606955 e!502298)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898062 (= res!606955 (not (validMask!0 (mask!26121 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898062 (arrayContainsKey!0 (_keys!10174 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405395 () Unit!30528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52696 (_ BitVec 64) (_ BitVec 32)) Unit!30528)

(assert (=> b!898062 (= lt!405395 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10174 thiss!1181) key!785 (index!38048 lt!405396)))))

(declare-fun b!898063 () Bool)

(declare-fun e!502290 () Bool)

(declare-fun tp_is_empty!18331 () Bool)

(assert (=> b!898063 (= e!502290 tp_is_empty!18331)))

(declare-fun b!898064 () Bool)

(declare-fun res!606956 () Bool)

(assert (=> b!898064 (=> res!606956 e!502298)))

(declare-datatypes ((List!17834 0))(
  ( (Nil!17831) (Cons!17830 (h!18972 (_ BitVec 64)) (t!25173 List!17834)) )
))
(declare-fun arrayNoDuplicates!0 (array!52696 (_ BitVec 32) List!17834) Bool)

(assert (=> b!898064 (= res!606956 (not (arrayNoDuplicates!0 (_keys!10174 thiss!1181) #b00000000000000000000000000000000 Nil!17831)))))

(declare-fun mapNonEmpty!29145 () Bool)

(declare-fun mapRes!29145 () Bool)

(declare-fun tp!56071 () Bool)

(assert (=> mapNonEmpty!29145 (= mapRes!29145 (and tp!56071 e!502290))))

(declare-fun mapKey!29145 () (_ BitVec 32))

(declare-fun mapValue!29145 () ValueCell!8684)

(declare-fun mapRest!29145 () (Array (_ BitVec 32) ValueCell!8684))

(assert (=> mapNonEmpty!29145 (= (arr!25328 (_values!5409 thiss!1181)) (store mapRest!29145 mapKey!29145 mapValue!29145))))

(declare-fun b!898065 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898065 (= e!502291 (inRange!0 (index!38048 lt!405396) (mask!26121 thiss!1181)))))

(declare-fun b!898066 () Bool)

(declare-fun res!606963 () Bool)

(assert (=> b!898066 (=> res!606963 e!502298)))

(assert (=> b!898066 (= res!606963 (or (bvslt (index!38048 lt!405396) #b00000000000000000000000000000000) (bvsge (index!38048 lt!405396) (size!25782 (_keys!10174 thiss!1181)))))))

(declare-fun b!898067 () Bool)

(declare-fun res!606958 () Bool)

(assert (=> b!898067 (=> res!606958 e!502298)))

(assert (=> b!898067 (= res!606958 (or (not (= (size!25783 (_values!5409 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26121 thiss!1181)))) (not (= (size!25782 (_keys!10174 thiss!1181)) (size!25783 (_values!5409 thiss!1181)))) (bvslt (mask!26121 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5118 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5118 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29145 () Bool)

(assert (=> mapIsEmpty!29145 mapRes!29145))

(declare-fun e!502296 () Bool)

(declare-fun e!502294 () Bool)

(declare-fun array_inv!19880 (array!52696) Bool)

(declare-fun array_inv!19881 (array!52698) Bool)

(assert (=> b!898069 (= e!502296 (and tp!56072 tp_is_empty!18331 (array_inv!19880 (_keys!10174 thiss!1181)) (array_inv!19881 (_values!5409 thiss!1181)) e!502294))))

(declare-fun b!898070 () Bool)

(declare-fun e!502297 () Bool)

(assert (=> b!898070 (= e!502294 (and e!502297 mapRes!29145))))

(declare-fun condMapEmpty!29145 () Bool)

(declare-fun mapDefault!29145 () ValueCell!8684)

