; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5894 () Bool)

(assert start!5894)

(declare-fun b_free!1369 () Bool)

(declare-fun b_next!1369 () Bool)

(assert (=> start!5894 (= b_free!1369 (not b_next!1369))))

(declare-fun tp!5741 () Bool)

(declare-fun b_and!2385 () Bool)

(assert (=> start!5894 (= tp!5741 b_and!2385)))

(declare-fun res!24504 () Bool)

(declare-fun e!26163 () Bool)

(assert (=> start!5894 (=> (not res!24504) (not e!26163))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5894 (= res!24504 (validMask!0 mask!853))))

(assert (=> start!5894 e!26163))

(assert (=> start!5894 true))

(assert (=> start!5894 tp!5741))

(declare-fun b!41282 () Bool)

(declare-fun e!26162 () Bool)

(assert (=> b!41282 (= e!26163 (not e!26162))))

(declare-fun res!24506 () Bool)

(assert (=> b!41282 (=> res!24506 e!26162)))

(declare-datatypes ((V!2105 0))(
  ( (V!2106 (val!918 Int)) )
))
(declare-datatypes ((tuple2!1472 0))(
  ( (tuple2!1473 (_1!747 (_ BitVec 64)) (_2!747 V!2105)) )
))
(declare-datatypes ((List!1044 0))(
  ( (Nil!1041) (Cons!1040 (h!1617 tuple2!1472) (t!3909 List!1044)) )
))
(declare-datatypes ((ListLongMap!1043 0))(
  ( (ListLongMap!1044 (toList!537 List!1044)) )
))
(declare-fun lt!16155 () ListLongMap!1043)

(assert (=> b!41282 (= res!24506 (= lt!16155 (ListLongMap!1044 Nil!1041)))))

(declare-datatypes ((array!2589 0))(
  ( (array!2590 (arr!1238 (Array (_ BitVec 32) (_ BitVec 64))) (size!1390 (_ BitVec 32))) )
))
(declare-fun lt!16153 () array!2589)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16156 () V!2105)

(declare-datatypes ((ValueCell!632 0))(
  ( (ValueCellFull!632 (v!2003 V!2105)) (EmptyCell!632) )
))
(declare-datatypes ((array!2591 0))(
  ( (array!2592 (arr!1239 (Array (_ BitVec 32) ValueCell!632)) (size!1391 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!244 0))(
  ( (LongMapFixedSize!245 (defaultEntry!1812 Int) (mask!5211 (_ BitVec 32)) (extraKeys!1703 (_ BitVec 32)) (zeroValue!1730 V!2105) (minValue!1730 V!2105) (_size!171 (_ BitVec 32)) (_keys!3319 array!2589) (_values!1795 array!2591) (_vacant!171 (_ BitVec 32))) )
))
(declare-fun map!694 (LongMapFixedSize!244) ListLongMap!1043)

(assert (=> b!41282 (= lt!16155 (map!694 (LongMapFixedSize!245 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16156 lt!16156 #b00000000000000000000000000000000 lt!16153 (array!2592 ((as const (Array (_ BitVec 32) ValueCell!632)) EmptyCell!632) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1045 0))(
  ( (Nil!1042) (Cons!1041 (h!1618 (_ BitVec 64)) (t!3910 List!1045)) )
))
(declare-fun arrayNoDuplicates!0 (array!2589 (_ BitVec 32) List!1045) Bool)

(assert (=> b!41282 (arrayNoDuplicates!0 lt!16153 #b00000000000000000000000000000000 Nil!1042)))

(declare-datatypes ((Unit!1011 0))(
  ( (Unit!1012) )
))
(declare-fun lt!16151 () Unit!1011)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2589 (_ BitVec 32) (_ BitVec 32) List!1045) Unit!1011)

(assert (=> b!41282 (= lt!16151 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16153 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2589 (_ BitVec 32)) Bool)

(assert (=> b!41282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16153 mask!853)))

(declare-fun lt!16154 () Unit!1011)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2589 (_ BitVec 32) (_ BitVec 32)) Unit!1011)

(assert (=> b!41282 (= lt!16154 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16153 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2589 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41282 (= (arrayCountValidKeys!0 lt!16153 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16152 () Unit!1011)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2589 (_ BitVec 32) (_ BitVec 32)) Unit!1011)

(assert (=> b!41282 (= lt!16152 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16153 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41282 (= lt!16153 (array!2590 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!189 (Int (_ BitVec 64)) V!2105)

(assert (=> b!41282 (= lt!16156 (dynLambda!189 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41283 () Bool)

(declare-fun res!24505 () Bool)

(assert (=> b!41283 (=> res!24505 e!26162)))

(declare-fun isEmpty!239 (List!1044) Bool)

(assert (=> b!41283 (= res!24505 (isEmpty!239 (toList!537 lt!16155)))))

(declare-fun b!41284 () Bool)

(assert (=> b!41284 (= e!26162 (not (= (toList!537 lt!16155) Nil!1041)))))

(assert (= (and start!5894 res!24504) b!41282))

(assert (= (and b!41282 (not res!24506)) b!41283))

(assert (= (and b!41283 (not res!24505)) b!41284))

(declare-fun b_lambda!2093 () Bool)

(assert (=> (not b_lambda!2093) (not b!41282)))

(declare-fun t!3908 () Bool)

(declare-fun tb!851 () Bool)

(assert (=> (and start!5894 (= defaultEntry!470 defaultEntry!470) t!3908) tb!851))

(declare-fun result!1453 () Bool)

(declare-fun tp_is_empty!1759 () Bool)

(assert (=> tb!851 (= result!1453 tp_is_empty!1759)))

(assert (=> b!41282 t!3908))

(declare-fun b_and!2387 () Bool)

(assert (= b_and!2385 (and (=> t!3908 result!1453) b_and!2387)))

(declare-fun m!34399 () Bool)

(assert (=> start!5894 m!34399))

(declare-fun m!34401 () Bool)

(assert (=> b!41282 m!34401))

(declare-fun m!34403 () Bool)

(assert (=> b!41282 m!34403))

(declare-fun m!34405 () Bool)

(assert (=> b!41282 m!34405))

(declare-fun m!34407 () Bool)

(assert (=> b!41282 m!34407))

(declare-fun m!34409 () Bool)

(assert (=> b!41282 m!34409))

(declare-fun m!34411 () Bool)

(assert (=> b!41282 m!34411))

(declare-fun m!34413 () Bool)

(assert (=> b!41282 m!34413))

(declare-fun m!34415 () Bool)

(assert (=> b!41282 m!34415))

(declare-fun m!34417 () Bool)

(assert (=> b!41283 m!34417))

(check-sat (not start!5894) (not b_lambda!2093) (not b!41283) (not b_next!1369) tp_is_empty!1759 (not b!41282) b_and!2387)
(check-sat b_and!2387 (not b_next!1369))
