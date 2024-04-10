; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6032 () Bool)

(assert start!6032)

(declare-fun b_free!1439 () Bool)

(declare-fun b_next!1439 () Bool)

(assert (=> start!6032 (= b_free!1439 (not b_next!1439))))

(declare-fun tp!5846 () Bool)

(declare-fun b_and!2527 () Bool)

(assert (=> start!6032 (= tp!5846 b_and!2527)))

(declare-fun b!41978 () Bool)

(declare-fun e!26535 () Bool)

(declare-datatypes ((array!2743 0))(
  ( (array!2744 (arr!1315 (Array (_ BitVec 32) (_ BitVec 64))) (size!1473 (_ BitVec 32))) )
))
(declare-fun lt!17112 () array!2743)

(declare-datatypes ((V!2197 0))(
  ( (V!2198 (val!953 Int)) )
))
(declare-datatypes ((tuple2!1560 0))(
  ( (tuple2!1561 (_1!791 (_ BitVec 64)) (_2!791 V!2197)) )
))
(declare-fun lt!17115 () tuple2!1560)

(declare-fun arrayContainsKey!0 (array!2743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41978 (= e!26535 (arrayContainsKey!0 lt!17112 (_1!791 lt!17115) #b00000000000000000000000000000000))))

(declare-fun b!41977 () Bool)

(declare-fun e!26534 () Bool)

(assert (=> b!41977 (= e!26534 true)))

(assert (=> b!41977 e!26535))

(declare-fun res!25006 () Bool)

(assert (=> b!41977 (=> (not res!25006) (not e!26535))))

(assert (=> b!41977 (= res!25006 (and (not (= (_1!791 lt!17115) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!791 lt!17115) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((Unit!1069 0))(
  ( (Unit!1070) )
))
(declare-fun lt!17110 () Unit!1069)

(declare-fun lt!17117 () V!2197)

(declare-datatypes ((ValueCell!667 0))(
  ( (ValueCellFull!667 (v!2037 V!2197)) (EmptyCell!667) )
))
(declare-datatypes ((array!2745 0))(
  ( (array!2746 (arr!1316 (Array (_ BitVec 32) ValueCell!667)) (size!1474 (_ BitVec 32))) )
))
(declare-fun lt!17111 () array!2745)

(declare-fun lemmaKeyInListMapIsInArray!99 (array!2743 array!2745 (_ BitVec 32) (_ BitVec 32) V!2197 V!2197 (_ BitVec 64) Int) Unit!1069)

(assert (=> b!41977 (= lt!17110 (lemmaKeyInListMapIsInArray!99 lt!17112 lt!17111 mask!853 #b00000000000000000000000000000000 lt!17117 lt!17117 (_1!791 lt!17115) defaultEntry!470))))

(declare-datatypes ((List!1128 0))(
  ( (Nil!1125) (Cons!1124 (h!1701 tuple2!1560) (t!4063 List!1128)) )
))
(declare-datatypes ((ListLongMap!1137 0))(
  ( (ListLongMap!1138 (toList!584 List!1128)) )
))
(declare-fun lt!17113 () ListLongMap!1137)

(declare-fun head!883 (List!1128) tuple2!1560)

(assert (=> b!41977 (= lt!17115 (head!883 (toList!584 lt!17113)))))

(declare-fun res!25007 () Bool)

(declare-fun e!26536 () Bool)

(assert (=> start!6032 (=> (not res!25007) (not e!26536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6032 (= res!25007 (validMask!0 mask!853))))

(assert (=> start!6032 e!26536))

(assert (=> start!6032 true))

(assert (=> start!6032 tp!5846))

(declare-fun b!41975 () Bool)

(assert (=> b!41975 (= e!26536 (not e!26534))))

(declare-fun res!25005 () Bool)

(assert (=> b!41975 (=> res!25005 e!26534)))

(assert (=> b!41975 (= res!25005 (= lt!17113 (ListLongMap!1138 Nil!1125)))))

(declare-datatypes ((LongMapFixedSize!314 0))(
  ( (LongMapFixedSize!315 (defaultEntry!1850 Int) (mask!5280 (_ BitVec 32)) (extraKeys!1741 (_ BitVec 32)) (zeroValue!1768 V!2197) (minValue!1768 V!2197) (_size!206 (_ BitVec 32)) (_keys!3363 array!2743) (_values!1833 array!2745) (_vacant!206 (_ BitVec 32))) )
))
(declare-fun map!751 (LongMapFixedSize!314) ListLongMap!1137)

(assert (=> b!41975 (= lt!17113 (map!751 (LongMapFixedSize!315 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17117 lt!17117 #b00000000000000000000000000000000 lt!17112 lt!17111 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1129 0))(
  ( (Nil!1126) (Cons!1125 (h!1702 (_ BitVec 64)) (t!4064 List!1129)) )
))
(declare-fun arrayNoDuplicates!0 (array!2743 (_ BitVec 32) List!1129) Bool)

(assert (=> b!41975 (arrayNoDuplicates!0 lt!17112 #b00000000000000000000000000000000 Nil!1126)))

(declare-fun lt!17116 () Unit!1069)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2743 (_ BitVec 32) (_ BitVec 32) List!1129) Unit!1069)

(assert (=> b!41975 (= lt!17116 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2743 (_ BitVec 32)) Bool)

(assert (=> b!41975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17112 mask!853)))

(declare-fun lt!17109 () Unit!1069)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2743 (_ BitVec 32) (_ BitVec 32)) Unit!1069)

(assert (=> b!41975 (= lt!17109 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17112 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2743 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41975 (= (arrayCountValidKeys!0 lt!17112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17114 () Unit!1069)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2743 (_ BitVec 32) (_ BitVec 32)) Unit!1069)

(assert (=> b!41975 (= lt!17114 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41975 (= lt!17111 (array!2746 ((as const (Array (_ BitVec 32) ValueCell!667)) EmptyCell!667) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41975 (= lt!17112 (array!2744 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!228 (Int (_ BitVec 64)) V!2197)

(assert (=> b!41975 (= lt!17117 (dynLambda!228 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41976 () Bool)

(declare-fun res!25008 () Bool)

(assert (=> b!41976 (=> res!25008 e!26534)))

(declare-fun isEmpty!270 (List!1128) Bool)

(assert (=> b!41976 (= res!25008 (isEmpty!270 (toList!584 lt!17113)))))

(assert (= (and start!6032 res!25007) b!41975))

(assert (= (and b!41975 (not res!25005)) b!41976))

(assert (= (and b!41976 (not res!25008)) b!41977))

(assert (= (and b!41977 res!25006) b!41978))

(declare-fun b_lambda!2169 () Bool)

(assert (=> (not b_lambda!2169) (not b!41975)))

(declare-fun t!4062 () Bool)

(declare-fun tb!921 () Bool)

(assert (=> (and start!6032 (= defaultEntry!470 defaultEntry!470) t!4062) tb!921))

(declare-fun result!1593 () Bool)

(declare-fun tp_is_empty!1829 () Bool)

(assert (=> tb!921 (= result!1593 tp_is_empty!1829)))

(assert (=> b!41975 t!4062))

(declare-fun b_and!2529 () Bool)

(assert (= b_and!2527 (and (=> t!4062 result!1593) b_and!2529)))

(declare-fun m!35507 () Bool)

(assert (=> b!41976 m!35507))

(declare-fun m!35509 () Bool)

(assert (=> b!41975 m!35509))

(declare-fun m!35511 () Bool)

(assert (=> b!41975 m!35511))

(declare-fun m!35513 () Bool)

(assert (=> b!41975 m!35513))

(declare-fun m!35515 () Bool)

(assert (=> b!41975 m!35515))

(declare-fun m!35517 () Bool)

(assert (=> b!41975 m!35517))

(declare-fun m!35519 () Bool)

(assert (=> b!41975 m!35519))

(declare-fun m!35521 () Bool)

(assert (=> b!41975 m!35521))

(declare-fun m!35523 () Bool)

(assert (=> b!41975 m!35523))

(declare-fun m!35525 () Bool)

(assert (=> b!41977 m!35525))

(declare-fun m!35527 () Bool)

(assert (=> b!41977 m!35527))

(declare-fun m!35529 () Bool)

(assert (=> b!41978 m!35529))

(declare-fun m!35531 () Bool)

(assert (=> start!6032 m!35531))

(push 1)

(assert (not b!41978))

(assert (not b!41976))

(assert (not start!6032))

(assert b_and!2529)

(assert (not b!41975))

(assert tp_is_empty!1829)

(assert (not b_next!1439))

(assert (not b!41977))

(assert (not b_lambda!2169))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2529)

(assert (not b_next!1439))

(check-sat)

(pop 1)

