; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6036 () Bool)

(assert start!6036)

(declare-fun b_free!1439 () Bool)

(declare-fun b_next!1439 () Bool)

(assert (=> start!6036 (= b_free!1439 (not b_next!1439))))

(declare-fun tp!5846 () Bool)

(declare-fun b_and!2525 () Bool)

(assert (=> start!6036 (= tp!5846 b_and!2525)))

(declare-fun b!41921 () Bool)

(declare-fun e!26497 () Bool)

(declare-datatypes ((array!2729 0))(
  ( (array!2730 (arr!1308 (Array (_ BitVec 32) (_ BitVec 64))) (size!1466 (_ BitVec 32))) )
))
(declare-fun lt!17072 () array!2729)

(declare-datatypes ((V!2197 0))(
  ( (V!2198 (val!953 Int)) )
))
(declare-datatypes ((tuple2!1542 0))(
  ( (tuple2!1543 (_1!782 (_ BitVec 64)) (_2!782 V!2197)) )
))
(declare-fun lt!17068 () tuple2!1542)

(declare-fun arrayContainsKey!0 (array!2729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41921 (= e!26497 (arrayContainsKey!0 lt!17072 (_1!782 lt!17068) #b00000000000000000000000000000000))))

(declare-fun b!41919 () Bool)

(declare-fun res!24980 () Bool)

(declare-fun e!26499 () Bool)

(assert (=> b!41919 (=> res!24980 e!26499)))

(declare-datatypes ((List!1114 0))(
  ( (Nil!1111) (Cons!1110 (h!1687 tuple2!1542) (t!4049 List!1114)) )
))
(declare-datatypes ((ListLongMap!1113 0))(
  ( (ListLongMap!1114 (toList!572 List!1114)) )
))
(declare-fun lt!17074 () ListLongMap!1113)

(declare-fun isEmpty!274 (List!1114) Bool)

(assert (=> b!41919 (= res!24980 (isEmpty!274 (toList!572 lt!17074)))))

(declare-fun b!41918 () Bool)

(declare-fun e!26498 () Bool)

(assert (=> b!41918 (= e!26498 (not e!26499))))

(declare-fun res!24983 () Bool)

(assert (=> b!41918 (=> res!24983 e!26499)))

(assert (=> b!41918 (= res!24983 (= lt!17074 (ListLongMap!1114 Nil!1111)))))

(declare-datatypes ((ValueCell!667 0))(
  ( (ValueCellFull!667 (v!2038 V!2197)) (EmptyCell!667) )
))
(declare-datatypes ((array!2731 0))(
  ( (array!2732 (arr!1309 (Array (_ BitVec 32) ValueCell!667)) (size!1467 (_ BitVec 32))) )
))
(declare-fun lt!17071 () array!2731)

(declare-fun lt!17073 () V!2197)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!314 0))(
  ( (LongMapFixedSize!315 (defaultEntry!1850 Int) (mask!5280 (_ BitVec 32)) (extraKeys!1741 (_ BitVec 32)) (zeroValue!1768 V!2197) (minValue!1768 V!2197) (_size!206 (_ BitVec 32)) (_keys!3363 array!2729) (_values!1833 array!2731) (_vacant!206 (_ BitVec 32))) )
))
(declare-fun map!751 (LongMapFixedSize!314) ListLongMap!1113)

(assert (=> b!41918 (= lt!17074 (map!751 (LongMapFixedSize!315 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17073 lt!17073 #b00000000000000000000000000000000 lt!17072 lt!17071 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1115 0))(
  ( (Nil!1112) (Cons!1111 (h!1688 (_ BitVec 64)) (t!4050 List!1115)) )
))
(declare-fun arrayNoDuplicates!0 (array!2729 (_ BitVec 32) List!1115) Bool)

(assert (=> b!41918 (arrayNoDuplicates!0 lt!17072 #b00000000000000000000000000000000 Nil!1112)))

(declare-datatypes ((Unit!1081 0))(
  ( (Unit!1082) )
))
(declare-fun lt!17066 () Unit!1081)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2729 (_ BitVec 32) (_ BitVec 32) List!1115) Unit!1081)

(assert (=> b!41918 (= lt!17066 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17072 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2729 (_ BitVec 32)) Bool)

(assert (=> b!41918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17072 mask!853)))

(declare-fun lt!17070 () Unit!1081)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1081)

(assert (=> b!41918 (= lt!17070 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17072 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41918 (= (arrayCountValidKeys!0 lt!17072 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17067 () Unit!1081)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1081)

(assert (=> b!41918 (= lt!17067 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17072 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41918 (= lt!17071 (array!2732 ((as const (Array (_ BitVec 32) ValueCell!667)) EmptyCell!667) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41918 (= lt!17072 (array!2730 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!224 (Int (_ BitVec 64)) V!2197)

(assert (=> b!41918 (= lt!17073 (dynLambda!224 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41920 () Bool)

(assert (=> b!41920 (= e!26499 true)))

(assert (=> b!41920 e!26497))

(declare-fun res!24981 () Bool)

(assert (=> b!41920 (=> (not res!24981) (not e!26497))))

(assert (=> b!41920 (= res!24981 (and (not (= (_1!782 lt!17068) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!782 lt!17068) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!17069 () Unit!1081)

(declare-fun lemmaKeyInListMapIsInArray!105 (array!2729 array!2731 (_ BitVec 32) (_ BitVec 32) V!2197 V!2197 (_ BitVec 64) Int) Unit!1081)

(assert (=> b!41920 (= lt!17069 (lemmaKeyInListMapIsInArray!105 lt!17072 lt!17071 mask!853 #b00000000000000000000000000000000 lt!17073 lt!17073 (_1!782 lt!17068) defaultEntry!470))))

(declare-fun head!881 (List!1114) tuple2!1542)

(assert (=> b!41920 (= lt!17068 (head!881 (toList!572 lt!17074)))))

(declare-fun res!24982 () Bool)

(assert (=> start!6036 (=> (not res!24982) (not e!26498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6036 (= res!24982 (validMask!0 mask!853))))

(assert (=> start!6036 e!26498))

(assert (=> start!6036 true))

(assert (=> start!6036 tp!5846))

(assert (= (and start!6036 res!24982) b!41918))

(assert (= (and b!41918 (not res!24983)) b!41919))

(assert (= (and b!41919 (not res!24980)) b!41920))

(assert (= (and b!41920 res!24981) b!41921))

(declare-fun b_lambda!2169 () Bool)

(assert (=> (not b_lambda!2169) (not b!41918)))

(declare-fun t!4048 () Bool)

(declare-fun tb!921 () Bool)

(assert (=> (and start!6036 (= defaultEntry!470 defaultEntry!470) t!4048) tb!921))

(declare-fun result!1593 () Bool)

(declare-fun tp_is_empty!1829 () Bool)

(assert (=> tb!921 (= result!1593 tp_is_empty!1829)))

(assert (=> b!41918 t!4048))

(declare-fun b_and!2527 () Bool)

(assert (= b_and!2525 (and (=> t!4048 result!1593) b_and!2527)))

(declare-fun m!35381 () Bool)

(assert (=> b!41919 m!35381))

(declare-fun m!35383 () Bool)

(assert (=> b!41921 m!35383))

(declare-fun m!35385 () Bool)

(assert (=> b!41920 m!35385))

(declare-fun m!35387 () Bool)

(assert (=> b!41920 m!35387))

(declare-fun m!35389 () Bool)

(assert (=> b!41918 m!35389))

(declare-fun m!35391 () Bool)

(assert (=> b!41918 m!35391))

(declare-fun m!35393 () Bool)

(assert (=> b!41918 m!35393))

(declare-fun m!35395 () Bool)

(assert (=> b!41918 m!35395))

(declare-fun m!35397 () Bool)

(assert (=> b!41918 m!35397))

(declare-fun m!35399 () Bool)

(assert (=> b!41918 m!35399))

(declare-fun m!35401 () Bool)

(assert (=> b!41918 m!35401))

(declare-fun m!35403 () Bool)

(assert (=> b!41918 m!35403))

(declare-fun m!35405 () Bool)

(assert (=> start!6036 m!35405))

(push 1)

(assert (not b!41921))

(assert (not b_next!1439))

(assert tp_is_empty!1829)

(assert (not b_lambda!2169))

(assert (not b!41919))

(assert (not b!41918))

(assert b_and!2527)

(assert (not b!41920))

(assert (not start!6036))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2527)

(assert (not b_next!1439))

(check-sat)

(pop 1)

