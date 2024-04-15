; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5890 () Bool)

(assert start!5890)

(declare-fun b_free!1375 () Bool)

(declare-fun b_next!1375 () Bool)

(assert (=> start!5890 (= b_free!1375 (not b_next!1375))))

(declare-fun tp!5750 () Bool)

(declare-fun b_and!2401 () Bool)

(assert (=> start!5890 (= tp!5750 b_and!2401)))

(declare-fun b!41296 () Bool)

(declare-fun res!24533 () Bool)

(declare-fun e!26164 () Bool)

(assert (=> b!41296 (=> res!24533 e!26164)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41296 (= res!24533 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41295 () Bool)

(declare-fun res!24534 () Bool)

(assert (=> b!41295 (=> res!24534 e!26164)))

(declare-datatypes ((V!2113 0))(
  ( (V!2114 (val!921 Int)) )
))
(declare-datatypes ((tuple2!1500 0))(
  ( (tuple2!1501 (_1!761 (_ BitVec 64)) (_2!761 V!2113)) )
))
(declare-datatypes ((List!1057 0))(
  ( (Nil!1054) (Cons!1053 (h!1630 tuple2!1500) (t!3927 List!1057)) )
))
(declare-datatypes ((ListLongMap!1065 0))(
  ( (ListLongMap!1066 (toList!548 List!1057)) )
))
(declare-fun lt!16241 () ListLongMap!1065)

(declare-fun isEmpty!240 (List!1057) Bool)

(assert (=> b!41295 (= res!24534 (isEmpty!240 (toList!548 lt!16241)))))

(declare-fun b!41297 () Bool)

(assert (=> b!41297 (= e!26164 true)))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16234 () V!2113)

(declare-fun lt!16238 () Bool)

(declare-datatypes ((ValueCell!635 0))(
  ( (ValueCellFull!635 (v!2003 V!2113)) (EmptyCell!635) )
))
(declare-datatypes ((array!2589 0))(
  ( (array!2590 (arr!1238 (Array (_ BitVec 32) ValueCell!635)) (size!1390 (_ BitVec 32))) )
))
(declare-fun lt!16237 () array!2589)

(declare-datatypes ((array!2591 0))(
  ( (array!2592 (arr!1239 (Array (_ BitVec 32) (_ BitVec 64))) (size!1391 (_ BitVec 32))) )
))
(declare-fun lt!16239 () array!2591)

(declare-fun contains!518 (ListLongMap!1065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!303 (array!2591 array!2589 (_ BitVec 32) (_ BitVec 32) V!2113 V!2113 (_ BitVec 32) Int) ListLongMap!1065)

(declare-fun head!851 (List!1057) tuple2!1500)

(assert (=> b!41297 (= lt!16238 (contains!518 (getCurrentListMap!303 lt!16239 lt!16237 mask!853 #b00000000000000000000000000000000 lt!16234 lt!16234 #b00000000000000000000000000000000 defaultEntry!470) (_1!761 (head!851 (toList!548 lt!16241)))))))

(declare-fun res!24535 () Bool)

(declare-fun e!26165 () Bool)

(assert (=> start!5890 (=> (not res!24535) (not e!26165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5890 (= res!24535 (validMask!0 mask!853))))

(assert (=> start!5890 e!26165))

(assert (=> start!5890 true))

(assert (=> start!5890 tp!5750))

(declare-fun b!41294 () Bool)

(assert (=> b!41294 (= e!26165 (not e!26164))))

(declare-fun res!24532 () Bool)

(assert (=> b!41294 (=> res!24532 e!26164)))

(assert (=> b!41294 (= res!24532 (= lt!16241 (ListLongMap!1066 Nil!1054)))))

(declare-datatypes ((LongMapFixedSize!250 0))(
  ( (LongMapFixedSize!251 (defaultEntry!1815 Int) (mask!5215 (_ BitVec 32)) (extraKeys!1706 (_ BitVec 32)) (zeroValue!1733 V!2113) (minValue!1733 V!2113) (_size!174 (_ BitVec 32)) (_keys!3321 array!2591) (_values!1798 array!2589) (_vacant!174 (_ BitVec 32))) )
))
(declare-fun map!700 (LongMapFixedSize!250) ListLongMap!1065)

(assert (=> b!41294 (= lt!16241 (map!700 (LongMapFixedSize!251 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16234 lt!16234 #b00000000000000000000000000000000 lt!16239 lt!16237 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1058 0))(
  ( (Nil!1055) (Cons!1054 (h!1631 (_ BitVec 64)) (t!3928 List!1058)) )
))
(declare-fun arrayNoDuplicates!0 (array!2591 (_ BitVec 32) List!1058) Bool)

(assert (=> b!41294 (arrayNoDuplicates!0 lt!16239 #b00000000000000000000000000000000 Nil!1055)))

(declare-datatypes ((Unit!1012 0))(
  ( (Unit!1013) )
))
(declare-fun lt!16240 () Unit!1012)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2591 (_ BitVec 32) (_ BitVec 32) List!1058) Unit!1012)

(assert (=> b!41294 (= lt!16240 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16239 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2591 (_ BitVec 32)) Bool)

(assert (=> b!41294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16239 mask!853)))

(declare-fun lt!16236 () Unit!1012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2591 (_ BitVec 32) (_ BitVec 32)) Unit!1012)

(assert (=> b!41294 (= lt!16236 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16239 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2591 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41294 (= (arrayCountValidKeys!0 lt!16239 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16235 () Unit!1012)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2591 (_ BitVec 32) (_ BitVec 32)) Unit!1012)

(assert (=> b!41294 (= lt!16235 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16239 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41294 (= lt!16237 (array!2590 ((as const (Array (_ BitVec 32) ValueCell!635)) EmptyCell!635) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41294 (= lt!16239 (array!2592 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!195 (Int (_ BitVec 64)) V!2113)

(assert (=> b!41294 (= lt!16234 (dynLambda!195 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5890 res!24535) b!41294))

(assert (= (and b!41294 (not res!24532)) b!41295))

(assert (= (and b!41295 (not res!24534)) b!41296))

(assert (= (and b!41296 (not res!24533)) b!41297))

(declare-fun b_lambda!2103 () Bool)

(assert (=> (not b_lambda!2103) (not b!41294)))

(declare-fun t!3926 () Bool)

(declare-fun tb!857 () Bool)

(assert (=> (and start!5890 (= defaultEntry!470 defaultEntry!470) t!3926) tb!857))

(declare-fun result!1465 () Bool)

(declare-fun tp_is_empty!1765 () Bool)

(assert (=> tb!857 (= result!1465 tp_is_empty!1765)))

(assert (=> b!41294 t!3926))

(declare-fun b_and!2403 () Bool)

(assert (= b_and!2401 (and (=> t!3926 result!1465) b_and!2403)))

(declare-fun m!34487 () Bool)

(assert (=> b!41295 m!34487))

(declare-fun m!34489 () Bool)

(assert (=> b!41297 m!34489))

(declare-fun m!34491 () Bool)

(assert (=> b!41297 m!34491))

(assert (=> b!41297 m!34489))

(declare-fun m!34493 () Bool)

(assert (=> b!41297 m!34493))

(declare-fun m!34495 () Bool)

(assert (=> start!5890 m!34495))

(declare-fun m!34497 () Bool)

(assert (=> b!41294 m!34497))

(declare-fun m!34499 () Bool)

(assert (=> b!41294 m!34499))

(declare-fun m!34501 () Bool)

(assert (=> b!41294 m!34501))

(declare-fun m!34503 () Bool)

(assert (=> b!41294 m!34503))

(declare-fun m!34505 () Bool)

(assert (=> b!41294 m!34505))

(declare-fun m!34507 () Bool)

(assert (=> b!41294 m!34507))

(declare-fun m!34509 () Bool)

(assert (=> b!41294 m!34509))

(declare-fun m!34511 () Bool)

(assert (=> b!41294 m!34511))

(check-sat (not b!41294) (not b_next!1375) b_and!2403 tp_is_empty!1765 (not b!41295) (not b_lambda!2103) (not b!41297) (not start!5890))
(check-sat b_and!2403 (not b_next!1375))
