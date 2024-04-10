; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5912 () Bool)

(assert start!5912)

(declare-fun b_free!1391 () Bool)

(declare-fun b_next!1391 () Bool)

(assert (=> start!5912 (= b_free!1391 (not b_next!1391))))

(declare-fun tp!5774 () Bool)

(declare-fun b_and!2431 () Bool)

(assert (=> start!5912 (= tp!5774 b_and!2431)))

(declare-fun b!41486 () Bool)

(declare-fun e!26265 () Bool)

(declare-fun e!26266 () Bool)

(assert (=> b!41486 (= e!26265 (not e!26266))))

(declare-fun res!24657 () Bool)

(assert (=> b!41486 (=> res!24657 e!26266)))

(declare-datatypes ((V!2133 0))(
  ( (V!2134 (val!929 Int)) )
))
(declare-datatypes ((tuple2!1512 0))(
  ( (tuple2!1513 (_1!767 (_ BitVec 64)) (_2!767 V!2133)) )
))
(declare-datatypes ((List!1080 0))(
  ( (Nil!1077) (Cons!1076 (h!1653 tuple2!1512) (t!3967 List!1080)) )
))
(declare-datatypes ((ListLongMap!1089 0))(
  ( (ListLongMap!1090 (toList!560 List!1080)) )
))
(declare-fun lt!16447 () ListLongMap!1089)

(assert (=> b!41486 (= res!24657 (= lt!16447 (ListLongMap!1090 Nil!1077)))))

(declare-datatypes ((ValueCell!643 0))(
  ( (ValueCellFull!643 (v!2013 V!2133)) (EmptyCell!643) )
))
(declare-datatypes ((array!2647 0))(
  ( (array!2648 (arr!1267 (Array (_ BitVec 32) ValueCell!643)) (size!1419 (_ BitVec 32))) )
))
(declare-fun lt!16444 () array!2647)

(declare-datatypes ((array!2649 0))(
  ( (array!2650 (arr!1268 (Array (_ BitVec 32) (_ BitVec 64))) (size!1420 (_ BitVec 32))) )
))
(declare-fun lt!16451 () array!2649)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lt!16449 () V!2133)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!266 0))(
  ( (LongMapFixedSize!267 (defaultEntry!1823 Int) (mask!5228 (_ BitVec 32)) (extraKeys!1714 (_ BitVec 32)) (zeroValue!1741 V!2133) (minValue!1741 V!2133) (_size!182 (_ BitVec 32)) (_keys!3330 array!2649) (_values!1806 array!2647) (_vacant!182 (_ BitVec 32))) )
))
(declare-fun map!711 (LongMapFixedSize!266) ListLongMap!1089)

(assert (=> b!41486 (= lt!16447 (map!711 (LongMapFixedSize!267 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16449 lt!16449 #b00000000000000000000000000000000 lt!16451 lt!16444 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1081 0))(
  ( (Nil!1078) (Cons!1077 (h!1654 (_ BitVec 64)) (t!3968 List!1081)) )
))
(declare-fun arrayNoDuplicates!0 (array!2649 (_ BitVec 32) List!1081) Bool)

(assert (=> b!41486 (arrayNoDuplicates!0 lt!16451 #b00000000000000000000000000000000 Nil!1078)))

(declare-datatypes ((Unit!1021 0))(
  ( (Unit!1022) )
))
(declare-fun lt!16445 () Unit!1021)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2649 (_ BitVec 32) (_ BitVec 32) List!1081) Unit!1021)

(assert (=> b!41486 (= lt!16445 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16451 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2649 (_ BitVec 32)) Bool)

(assert (=> b!41486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16451 mask!853)))

(declare-fun lt!16448 () Unit!1021)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2649 (_ BitVec 32) (_ BitVec 32)) Unit!1021)

(assert (=> b!41486 (= lt!16448 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16451 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2649 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41486 (= (arrayCountValidKeys!0 lt!16451 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16450 () Unit!1021)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2649 (_ BitVec 32) (_ BitVec 32)) Unit!1021)

(assert (=> b!41486 (= lt!16450 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16451 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41486 (= lt!16444 (array!2648 ((as const (Array (_ BitVec 32) ValueCell!643)) EmptyCell!643) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41486 (= lt!16451 (array!2650 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!204 (Int (_ BitVec 64)) V!2133)

(assert (=> b!41486 (= lt!16449 (dynLambda!204 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41487 () Bool)

(declare-fun res!24655 () Bool)

(assert (=> b!41487 (=> res!24655 e!26266)))

(declare-fun isEmpty!246 (List!1080) Bool)

(assert (=> b!41487 (= res!24655 (isEmpty!246 (toList!560 lt!16447)))))

(declare-fun b!41489 () Bool)

(assert (=> b!41489 (= e!26266 true)))

(declare-fun lt!16446 () Bool)

(declare-fun contains!528 (ListLongMap!1089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!321 (array!2649 array!2647 (_ BitVec 32) (_ BitVec 32) V!2133 V!2133 (_ BitVec 32) Int) ListLongMap!1089)

(declare-fun head!859 (List!1080) tuple2!1512)

(assert (=> b!41489 (= lt!16446 (contains!528 (getCurrentListMap!321 lt!16451 lt!16444 mask!853 #b00000000000000000000000000000000 lt!16449 lt!16449 #b00000000000000000000000000000000 defaultEntry!470) (_1!767 (head!859 (toList!560 lt!16447)))))))

(declare-fun res!24656 () Bool)

(assert (=> start!5912 (=> (not res!24656) (not e!26265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5912 (= res!24656 (validMask!0 mask!853))))

(assert (=> start!5912 e!26265))

(assert (=> start!5912 true))

(assert (=> start!5912 tp!5774))

(declare-fun b!41488 () Bool)

(declare-fun res!24654 () Bool)

(assert (=> b!41488 (=> res!24654 e!26266)))

(assert (=> b!41488 (= res!24654 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5912 res!24656) b!41486))

(assert (= (and b!41486 (not res!24657)) b!41487))

(assert (= (and b!41487 (not res!24655)) b!41488))

(assert (= (and b!41488 (not res!24654)) b!41489))

(declare-fun b_lambda!2115 () Bool)

(assert (=> (not b_lambda!2115) (not b!41486)))

(declare-fun t!3966 () Bool)

(declare-fun tb!873 () Bool)

(assert (=> (and start!5912 (= defaultEntry!470 defaultEntry!470) t!3966) tb!873))

(declare-fun result!1497 () Bool)

(declare-fun tp_is_empty!1781 () Bool)

(assert (=> tb!873 (= result!1497 tp_is_empty!1781)))

(assert (=> b!41486 t!3966))

(declare-fun b_and!2433 () Bool)

(assert (= b_and!2431 (and (=> t!3966 result!1497) b_and!2433)))

(declare-fun m!34793 () Bool)

(assert (=> b!41486 m!34793))

(declare-fun m!34795 () Bool)

(assert (=> b!41486 m!34795))

(declare-fun m!34797 () Bool)

(assert (=> b!41486 m!34797))

(declare-fun m!34799 () Bool)

(assert (=> b!41486 m!34799))

(declare-fun m!34801 () Bool)

(assert (=> b!41486 m!34801))

(declare-fun m!34803 () Bool)

(assert (=> b!41486 m!34803))

(declare-fun m!34805 () Bool)

(assert (=> b!41486 m!34805))

(declare-fun m!34807 () Bool)

(assert (=> b!41486 m!34807))

(declare-fun m!34809 () Bool)

(assert (=> b!41487 m!34809))

(declare-fun m!34811 () Bool)

(assert (=> b!41489 m!34811))

(declare-fun m!34813 () Bool)

(assert (=> b!41489 m!34813))

(assert (=> b!41489 m!34811))

(declare-fun m!34815 () Bool)

(assert (=> b!41489 m!34815))

(declare-fun m!34817 () Bool)

(assert (=> start!5912 m!34817))

(push 1)

(assert (not b_lambda!2115))

(assert b_and!2433)

(assert (not start!5912))

(assert (not b!41489))

(assert tp_is_empty!1781)

(assert (not b!41487))

(assert (not b_next!1391))

(assert (not b!41486))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2433)

(assert (not b_next!1391))

(check-sat)

(pop 1)

