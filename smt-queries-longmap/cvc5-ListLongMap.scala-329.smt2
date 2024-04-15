; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6026 () Bool)

(assert start!6026)

(declare-fun b_free!1439 () Bool)

(declare-fun b_next!1439 () Bool)

(assert (=> start!6026 (= b_free!1439 (not b_next!1439))))

(declare-fun tp!5846 () Bool)

(declare-fun b_and!2529 () Bool)

(assert (=> start!6026 (= tp!5846 b_and!2529)))

(declare-fun b!41897 () Bool)

(declare-fun e!26482 () Bool)

(assert (=> b!41897 (= e!26482 true)))

(declare-fun e!26481 () Bool)

(assert (=> b!41897 e!26481))

(declare-fun res!24982 () Bool)

(assert (=> b!41897 (=> (not res!24982) (not e!26481))))

(declare-datatypes ((V!2197 0))(
  ( (V!2198 (val!953 Int)) )
))
(declare-datatypes ((tuple2!1564 0))(
  ( (tuple2!1565 (_1!793 (_ BitVec 64)) (_2!793 V!2197)) )
))
(declare-fun lt!17094 () tuple2!1564)

(assert (=> b!41897 (= res!24982 (and (not (= (_1!793 lt!17094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!793 lt!17094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!17099 () V!2197)

(declare-datatypes ((array!2717 0))(
  ( (array!2718 (arr!1302 (Array (_ BitVec 32) (_ BitVec 64))) (size!1460 (_ BitVec 32))) )
))
(declare-fun lt!17092 () array!2717)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((ValueCell!667 0))(
  ( (ValueCellFull!667 (v!2035 V!2197)) (EmptyCell!667) )
))
(declare-datatypes ((array!2719 0))(
  ( (array!2720 (arr!1303 (Array (_ BitVec 32) ValueCell!667)) (size!1461 (_ BitVec 32))) )
))
(declare-fun lt!17093 () array!2719)

(declare-datatypes ((Unit!1076 0))(
  ( (Unit!1077) )
))
(declare-fun lt!17091 () Unit!1076)

(declare-fun defaultEntry!470 () Int)

(declare-fun lemmaKeyInListMapIsInArray!105 (array!2717 array!2719 (_ BitVec 32) (_ BitVec 32) V!2197 V!2197 (_ BitVec 64) Int) Unit!1076)

(assert (=> b!41897 (= lt!17091 (lemmaKeyInListMapIsInArray!105 lt!17092 lt!17093 mask!853 #b00000000000000000000000000000000 lt!17099 lt!17099 (_1!793 lt!17094) defaultEntry!470))))

(declare-datatypes ((List!1121 0))(
  ( (Nil!1118) (Cons!1117 (h!1694 tuple2!1564) (t!4055 List!1121)) )
))
(declare-datatypes ((ListLongMap!1129 0))(
  ( (ListLongMap!1130 (toList!580 List!1121)) )
))
(declare-fun lt!17096 () ListLongMap!1129)

(declare-fun head!883 (List!1121) tuple2!1564)

(assert (=> b!41897 (= lt!17094 (head!883 (toList!580 lt!17096)))))

(declare-fun b!41896 () Bool)

(declare-fun res!24981 () Bool)

(assert (=> b!41896 (=> res!24981 e!26482)))

(declare-fun isEmpty!272 (List!1121) Bool)

(assert (=> b!41896 (= res!24981 (isEmpty!272 (toList!580 lt!17096)))))

(declare-fun res!24979 () Bool)

(declare-fun e!26483 () Bool)

(assert (=> start!6026 (=> (not res!24979) (not e!26483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6026 (= res!24979 (validMask!0 mask!853))))

(assert (=> start!6026 e!26483))

(assert (=> start!6026 true))

(assert (=> start!6026 tp!5846))

(declare-fun b!41898 () Bool)

(declare-fun arrayContainsKey!0 (array!2717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41898 (= e!26481 (arrayContainsKey!0 lt!17092 (_1!793 lt!17094) #b00000000000000000000000000000000))))

(declare-fun b!41895 () Bool)

(assert (=> b!41895 (= e!26483 (not e!26482))))

(declare-fun res!24980 () Bool)

(assert (=> b!41895 (=> res!24980 e!26482)))

(assert (=> b!41895 (= res!24980 (= lt!17096 (ListLongMap!1130 Nil!1118)))))

(declare-datatypes ((LongMapFixedSize!314 0))(
  ( (LongMapFixedSize!315 (defaultEntry!1850 Int) (mask!5279 (_ BitVec 32)) (extraKeys!1741 (_ BitVec 32)) (zeroValue!1768 V!2197) (minValue!1768 V!2197) (_size!206 (_ BitVec 32)) (_keys!3362 array!2717) (_values!1833 array!2719) (_vacant!206 (_ BitVec 32))) )
))
(declare-fun map!752 (LongMapFixedSize!314) ListLongMap!1129)

(assert (=> b!41895 (= lt!17096 (map!752 (LongMapFixedSize!315 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17099 lt!17099 #b00000000000000000000000000000000 lt!17092 lt!17093 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1122 0))(
  ( (Nil!1119) (Cons!1118 (h!1695 (_ BitVec 64)) (t!4056 List!1122)) )
))
(declare-fun arrayNoDuplicates!0 (array!2717 (_ BitVec 32) List!1122) Bool)

(assert (=> b!41895 (arrayNoDuplicates!0 lt!17092 #b00000000000000000000000000000000 Nil!1119)))

(declare-fun lt!17095 () Unit!1076)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2717 (_ BitVec 32) (_ BitVec 32) List!1122) Unit!1076)

(assert (=> b!41895 (= lt!17095 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17092 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2717 (_ BitVec 32)) Bool)

(assert (=> b!41895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17092 mask!853)))

(declare-fun lt!17097 () Unit!1076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2717 (_ BitVec 32) (_ BitVec 32)) Unit!1076)

(assert (=> b!41895 (= lt!17097 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17092 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2717 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41895 (= (arrayCountValidKeys!0 lt!17092 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17098 () Unit!1076)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2717 (_ BitVec 32) (_ BitVec 32)) Unit!1076)

(assert (=> b!41895 (= lt!17098 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17092 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41895 (= lt!17093 (array!2720 ((as const (Array (_ BitVec 32) ValueCell!667)) EmptyCell!667) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41895 (= lt!17092 (array!2718 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!227 (Int (_ BitVec 64)) V!2197)

(assert (=> b!41895 (= lt!17099 (dynLambda!227 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6026 res!24979) b!41895))

(assert (= (and b!41895 (not res!24980)) b!41896))

(assert (= (and b!41896 (not res!24981)) b!41897))

(assert (= (and b!41897 res!24982) b!41898))

(declare-fun b_lambda!2173 () Bool)

(assert (=> (not b_lambda!2173) (not b!41895)))

(declare-fun t!4054 () Bool)

(declare-fun tb!921 () Bool)

(assert (=> (and start!6026 (= defaultEntry!470 defaultEntry!470) t!4054) tb!921))

(declare-fun result!1593 () Bool)

(declare-fun tp_is_empty!1829 () Bool)

(assert (=> tb!921 (= result!1593 tp_is_empty!1829)))

(assert (=> b!41895 t!4054))

(declare-fun b_and!2531 () Bool)

(assert (= b_and!2529 (and (=> t!4054 result!1593) b_and!2531)))

(declare-fun m!35409 () Bool)

(assert (=> b!41895 m!35409))

(declare-fun m!35411 () Bool)

(assert (=> b!41895 m!35411))

(declare-fun m!35413 () Bool)

(assert (=> b!41895 m!35413))

(declare-fun m!35415 () Bool)

(assert (=> b!41895 m!35415))

(declare-fun m!35417 () Bool)

(assert (=> b!41895 m!35417))

(declare-fun m!35419 () Bool)

(assert (=> b!41895 m!35419))

(declare-fun m!35421 () Bool)

(assert (=> b!41895 m!35421))

(declare-fun m!35423 () Bool)

(assert (=> b!41895 m!35423))

(declare-fun m!35425 () Bool)

(assert (=> b!41897 m!35425))

(declare-fun m!35427 () Bool)

(assert (=> b!41897 m!35427))

(declare-fun m!35429 () Bool)

(assert (=> b!41898 m!35429))

(declare-fun m!35431 () Bool)

(assert (=> b!41896 m!35431))

(declare-fun m!35433 () Bool)

(assert (=> start!6026 m!35433))

(push 1)

(assert (not b!41896))

(assert (not start!6026))

(assert tp_is_empty!1829)

(assert (not b!41898))

(assert (not b!41897))

(assert (not b_next!1439))

(assert (not b!41895))

(assert (not b_lambda!2173))

(assert b_and!2531)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2531)

(assert (not b_next!1439))

(check-sat)

(pop 1)

