; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5900 () Bool)

(assert start!5900)

(declare-fun b_free!1375 () Bool)

(declare-fun b_next!1375 () Bool)

(assert (=> start!5900 (= b_free!1375 (not b_next!1375))))

(declare-fun tp!5750 () Bool)

(declare-fun b_and!2397 () Bool)

(assert (=> start!5900 (= tp!5750 b_and!2397)))

(declare-fun b!41320 () Bool)

(declare-fun e!26181 () Bool)

(assert (=> b!41320 (= e!26181 true)))

(declare-datatypes ((V!2113 0))(
  ( (V!2114 (val!921 Int)) )
))
(declare-datatypes ((tuple2!1478 0))(
  ( (tuple2!1479 (_1!750 (_ BitVec 64)) (_2!750 V!2113)) )
))
(declare-datatypes ((List!1050 0))(
  ( (Nil!1047) (Cons!1046 (h!1623 tuple2!1478) (t!3921 List!1050)) )
))
(declare-datatypes ((ListLongMap!1049 0))(
  ( (ListLongMap!1050 (toList!540 List!1050)) )
))
(declare-fun lt!16215 () ListLongMap!1049)

(declare-datatypes ((array!2601 0))(
  ( (array!2602 (arr!1244 (Array (_ BitVec 32) (_ BitVec 64))) (size!1396 (_ BitVec 32))) )
))
(declare-fun lt!16213 () array!2601)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lt!16214 () V!2113)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!635 0))(
  ( (ValueCellFull!635 (v!2006 V!2113)) (EmptyCell!635) )
))
(declare-datatypes ((array!2603 0))(
  ( (array!2604 (arr!1245 (Array (_ BitVec 32) ValueCell!635)) (size!1397 (_ BitVec 32))) )
))
(declare-fun lt!16212 () array!2603)

(declare-fun lt!16210 () Bool)

(declare-fun contains!511 (ListLongMap!1049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!297 (array!2601 array!2603 (_ BitVec 32) (_ BitVec 32) V!2113 V!2113 (_ BitVec 32) Int) ListLongMap!1049)

(declare-fun head!849 (List!1050) tuple2!1478)

(assert (=> b!41320 (= lt!16210 (contains!511 (getCurrentListMap!297 lt!16213 lt!16212 mask!853 #b00000000000000000000000000000000 lt!16214 lt!16214 #b00000000000000000000000000000000 defaultEntry!470) (_1!750 (head!849 (toList!540 lt!16215)))))))

(declare-fun b!41318 () Bool)

(declare-fun res!24536 () Bool)

(assert (=> b!41318 (=> res!24536 e!26181)))

(declare-fun isEmpty!242 (List!1050) Bool)

(assert (=> b!41318 (= res!24536 (isEmpty!242 (toList!540 lt!16215)))))

(declare-fun b!41319 () Bool)

(declare-fun res!24533 () Bool)

(assert (=> b!41319 (=> res!24533 e!26181)))

(assert (=> b!41319 (= res!24533 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24535 () Bool)

(declare-fun e!26180 () Bool)

(assert (=> start!5900 (=> (not res!24535) (not e!26180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5900 (= res!24535 (validMask!0 mask!853))))

(assert (=> start!5900 e!26180))

(assert (=> start!5900 true))

(assert (=> start!5900 tp!5750))

(declare-fun b!41317 () Bool)

(assert (=> b!41317 (= e!26180 (not e!26181))))

(declare-fun res!24534 () Bool)

(assert (=> b!41317 (=> res!24534 e!26181)))

(assert (=> b!41317 (= res!24534 (= lt!16215 (ListLongMap!1050 Nil!1047)))))

(declare-datatypes ((LongMapFixedSize!250 0))(
  ( (LongMapFixedSize!251 (defaultEntry!1815 Int) (mask!5216 (_ BitVec 32)) (extraKeys!1706 (_ BitVec 32)) (zeroValue!1733 V!2113) (minValue!1733 V!2113) (_size!174 (_ BitVec 32)) (_keys!3322 array!2601) (_values!1798 array!2603) (_vacant!174 (_ BitVec 32))) )
))
(declare-fun map!699 (LongMapFixedSize!250) ListLongMap!1049)

(assert (=> b!41317 (= lt!16215 (map!699 (LongMapFixedSize!251 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16214 lt!16214 #b00000000000000000000000000000000 lt!16213 lt!16212 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1051 0))(
  ( (Nil!1048) (Cons!1047 (h!1624 (_ BitVec 64)) (t!3922 List!1051)) )
))
(declare-fun arrayNoDuplicates!0 (array!2601 (_ BitVec 32) List!1051) Bool)

(assert (=> b!41317 (arrayNoDuplicates!0 lt!16213 #b00000000000000000000000000000000 Nil!1048)))

(declare-datatypes ((Unit!1017 0))(
  ( (Unit!1018) )
))
(declare-fun lt!16216 () Unit!1017)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2601 (_ BitVec 32) (_ BitVec 32) List!1051) Unit!1017)

(assert (=> b!41317 (= lt!16216 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16213 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2601 (_ BitVec 32)) Bool)

(assert (=> b!41317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16213 mask!853)))

(declare-fun lt!16209 () Unit!1017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2601 (_ BitVec 32) (_ BitVec 32)) Unit!1017)

(assert (=> b!41317 (= lt!16209 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16213 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2601 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41317 (= (arrayCountValidKeys!0 lt!16213 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16211 () Unit!1017)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2601 (_ BitVec 32) (_ BitVec 32)) Unit!1017)

(assert (=> b!41317 (= lt!16211 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16213 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41317 (= lt!16212 (array!2604 ((as const (Array (_ BitVec 32) ValueCell!635)) EmptyCell!635) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41317 (= lt!16213 (array!2602 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!192 (Int (_ BitVec 64)) V!2113)

(assert (=> b!41317 (= lt!16214 (dynLambda!192 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5900 res!24535) b!41317))

(assert (= (and b!41317 (not res!24534)) b!41318))

(assert (= (and b!41318 (not res!24536)) b!41319))

(assert (= (and b!41319 (not res!24533)) b!41320))

(declare-fun b_lambda!2099 () Bool)

(assert (=> (not b_lambda!2099) (not b!41317)))

(declare-fun t!3920 () Bool)

(declare-fun tb!857 () Bool)

(assert (=> (and start!5900 (= defaultEntry!470 defaultEntry!470) t!3920) tb!857))

(declare-fun result!1465 () Bool)

(declare-fun tp_is_empty!1765 () Bool)

(assert (=> tb!857 (= result!1465 tp_is_empty!1765)))

(assert (=> b!41317 t!3920))

(declare-fun b_and!2399 () Bool)

(assert (= b_and!2397 (and (=> t!3920 result!1465) b_and!2399)))

(declare-fun m!34459 () Bool)

(assert (=> b!41320 m!34459))

(declare-fun m!34461 () Bool)

(assert (=> b!41320 m!34461))

(assert (=> b!41320 m!34459))

(declare-fun m!34463 () Bool)

(assert (=> b!41320 m!34463))

(declare-fun m!34465 () Bool)

(assert (=> b!41318 m!34465))

(declare-fun m!34467 () Bool)

(assert (=> start!5900 m!34467))

(declare-fun m!34469 () Bool)

(assert (=> b!41317 m!34469))

(declare-fun m!34471 () Bool)

(assert (=> b!41317 m!34471))

(declare-fun m!34473 () Bool)

(assert (=> b!41317 m!34473))

(declare-fun m!34475 () Bool)

(assert (=> b!41317 m!34475))

(declare-fun m!34477 () Bool)

(assert (=> b!41317 m!34477))

(declare-fun m!34479 () Bool)

(assert (=> b!41317 m!34479))

(declare-fun m!34481 () Bool)

(assert (=> b!41317 m!34481))

(declare-fun m!34483 () Bool)

(assert (=> b!41317 m!34483))

(check-sat (not b!41318) (not b!41317) tp_is_empty!1765 (not b_next!1375) b_and!2399 (not b_lambda!2099) (not start!5900) (not b!41320))
(check-sat b_and!2399 (not b_next!1375))
