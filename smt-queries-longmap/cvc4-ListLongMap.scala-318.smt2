; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5894 () Bool)

(assert start!5894)

(declare-fun b_free!1373 () Bool)

(declare-fun b_next!1373 () Bool)

(assert (=> start!5894 (= b_free!1373 (not b_next!1373))))

(declare-fun tp!5747 () Bool)

(declare-fun b_and!2395 () Bool)

(assert (=> start!5894 (= tp!5747 b_and!2395)))

(declare-fun res!24547 () Bool)

(declare-fun e!26212 () Bool)

(assert (=> start!5894 (=> (not res!24547) (not e!26212))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5894 (= res!24547 (validMask!0 mask!853))))

(assert (=> start!5894 e!26212))

(assert (=> start!5894 true))

(assert (=> start!5894 tp!5747))

(declare-fun b!41361 () Bool)

(declare-fun e!26211 () Bool)

(assert (=> b!41361 (= e!26212 (not e!26211))))

(declare-fun res!24549 () Bool)

(assert (=> b!41361 (=> res!24549 e!26211)))

(declare-datatypes ((V!2109 0))(
  ( (V!2110 (val!920 Int)) )
))
(declare-datatypes ((tuple2!1494 0))(
  ( (tuple2!1495 (_1!758 (_ BitVec 64)) (_2!758 V!2109)) )
))
(declare-datatypes ((List!1062 0))(
  ( (Nil!1059) (Cons!1058 (h!1635 tuple2!1494) (t!3931 List!1062)) )
))
(declare-datatypes ((ListLongMap!1071 0))(
  ( (ListLongMap!1072 (toList!551 List!1062)) )
))
(declare-fun lt!16230 () ListLongMap!1071)

(assert (=> b!41361 (= res!24549 (= lt!16230 (ListLongMap!1072 Nil!1059)))))

(declare-fun lt!16234 () V!2109)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2611 0))(
  ( (array!2612 (arr!1249 (Array (_ BitVec 32) (_ BitVec 64))) (size!1401 (_ BitVec 32))) )
))
(declare-fun lt!16233 () array!2611)

(declare-datatypes ((ValueCell!634 0))(
  ( (ValueCellFull!634 (v!2004 V!2109)) (EmptyCell!634) )
))
(declare-datatypes ((array!2613 0))(
  ( (array!2614 (arr!1250 (Array (_ BitVec 32) ValueCell!634)) (size!1402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!248 0))(
  ( (LongMapFixedSize!249 (defaultEntry!1814 Int) (mask!5213 (_ BitVec 32)) (extraKeys!1705 (_ BitVec 32)) (zeroValue!1732 V!2109) (minValue!1732 V!2109) (_size!173 (_ BitVec 32)) (_keys!3321 array!2611) (_values!1797 array!2613) (_vacant!173 (_ BitVec 32))) )
))
(declare-fun map!696 (LongMapFixedSize!248) ListLongMap!1071)

(assert (=> b!41361 (= lt!16230 (map!696 (LongMapFixedSize!249 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16234 lt!16234 #b00000000000000000000000000000000 lt!16233 (array!2614 ((as const (Array (_ BitVec 32) ValueCell!634)) EmptyCell!634) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1063 0))(
  ( (Nil!1060) (Cons!1059 (h!1636 (_ BitVec 64)) (t!3932 List!1063)) )
))
(declare-fun arrayNoDuplicates!0 (array!2611 (_ BitVec 32) List!1063) Bool)

(assert (=> b!41361 (arrayNoDuplicates!0 lt!16233 #b00000000000000000000000000000000 Nil!1060)))

(declare-datatypes ((Unit!1003 0))(
  ( (Unit!1004) )
))
(declare-fun lt!16232 () Unit!1003)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2611 (_ BitVec 32) (_ BitVec 32) List!1063) Unit!1003)

(assert (=> b!41361 (= lt!16232 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2611 (_ BitVec 32)) Bool)

(assert (=> b!41361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16233 mask!853)))

(declare-fun lt!16231 () Unit!1003)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2611 (_ BitVec 32) (_ BitVec 32)) Unit!1003)

(assert (=> b!41361 (= lt!16231 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16233 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41361 (= (arrayCountValidKeys!0 lt!16233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16235 () Unit!1003)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2611 (_ BitVec 32) (_ BitVec 32)) Unit!1003)

(assert (=> b!41361 (= lt!16235 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41361 (= lt!16233 (array!2612 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!195 (Int (_ BitVec 64)) V!2109)

(assert (=> b!41361 (= lt!16234 (dynLambda!195 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41362 () Bool)

(declare-fun res!24548 () Bool)

(assert (=> b!41362 (=> res!24548 e!26211)))

(declare-fun isEmpty!237 (List!1062) Bool)

(assert (=> b!41362 (= res!24548 (isEmpty!237 (toList!551 lt!16230)))))

(declare-fun b!41363 () Bool)

(assert (=> b!41363 (= e!26211 (not (= (toList!551 lt!16230) Nil!1059)))))

(assert (= (and start!5894 res!24547) b!41361))

(assert (= (and b!41361 (not res!24549)) b!41362))

(assert (= (and b!41362 (not res!24548)) b!41363))

(declare-fun b_lambda!2097 () Bool)

(assert (=> (not b_lambda!2097) (not b!41361)))

(declare-fun t!3930 () Bool)

(declare-fun tb!855 () Bool)

(assert (=> (and start!5894 (= defaultEntry!470 defaultEntry!470) t!3930) tb!855))

(declare-fun result!1461 () Bool)

(declare-fun tp_is_empty!1763 () Bool)

(assert (=> tb!855 (= result!1461 tp_is_empty!1763)))

(assert (=> b!41361 t!3930))

(declare-fun b_and!2397 () Bool)

(assert (= b_and!2395 (and (=> t!3930 result!1461) b_and!2397)))

(declare-fun m!34565 () Bool)

(assert (=> start!5894 m!34565))

(declare-fun m!34567 () Bool)

(assert (=> b!41361 m!34567))

(declare-fun m!34569 () Bool)

(assert (=> b!41361 m!34569))

(declare-fun m!34571 () Bool)

(assert (=> b!41361 m!34571))

(declare-fun m!34573 () Bool)

(assert (=> b!41361 m!34573))

(declare-fun m!34575 () Bool)

(assert (=> b!41361 m!34575))

(declare-fun m!34577 () Bool)

(assert (=> b!41361 m!34577))

(declare-fun m!34579 () Bool)

(assert (=> b!41361 m!34579))

(declare-fun m!34581 () Bool)

(assert (=> b!41361 m!34581))

(declare-fun m!34583 () Bool)

(assert (=> b!41362 m!34583))

(push 1)

(assert (not b!41362))

(assert (not b_lambda!2097))

(assert (not b!41361))

(assert b_and!2397)

(assert (not start!5894))

