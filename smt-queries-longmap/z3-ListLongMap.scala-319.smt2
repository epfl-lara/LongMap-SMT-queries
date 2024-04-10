; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5898 () Bool)

(assert start!5898)

(declare-fun b_free!1377 () Bool)

(declare-fun b_next!1377 () Bool)

(assert (=> start!5898 (= b_free!1377 (not b_next!1377))))

(declare-fun tp!5753 () Bool)

(declare-fun b_and!2403 () Bool)

(assert (=> start!5898 (= tp!5753 b_and!2403)))

(declare-fun b!41390 () Bool)

(declare-fun res!24572 () Bool)

(declare-fun e!26224 () Bool)

(assert (=> b!41390 (=> res!24572 e!26224)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41390 (= res!24572 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41389 () Bool)

(declare-fun res!24571 () Bool)

(assert (=> b!41389 (=> res!24571 e!26224)))

(declare-datatypes ((V!2115 0))(
  ( (V!2116 (val!922 Int)) )
))
(declare-datatypes ((tuple2!1498 0))(
  ( (tuple2!1499 (_1!760 (_ BitVec 64)) (_2!760 V!2115)) )
))
(declare-datatypes ((List!1066 0))(
  ( (Nil!1063) (Cons!1062 (h!1639 tuple2!1498) (t!3939 List!1066)) )
))
(declare-datatypes ((ListLongMap!1075 0))(
  ( (ListLongMap!1076 (toList!553 List!1066)) )
))
(declare-fun lt!16280 () ListLongMap!1075)

(declare-fun isEmpty!239 (List!1066) Bool)

(assert (=> b!41389 (= res!24571 (isEmpty!239 (toList!553 lt!16280)))))

(declare-fun res!24570 () Bool)

(declare-fun e!26223 () Bool)

(assert (=> start!5898 (=> (not res!24570) (not e!26223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5898 (= res!24570 (validMask!0 mask!853))))

(assert (=> start!5898 e!26223))

(assert (=> start!5898 true))

(assert (=> start!5898 tp!5753))

(declare-fun b!41391 () Bool)

(assert (=> b!41391 (= e!26224 true)))

(declare-datatypes ((array!2619 0))(
  ( (array!2620 (arr!1253 (Array (_ BitVec 32) (_ BitVec 64))) (size!1405 (_ BitVec 32))) )
))
(declare-fun lt!16283 () array!2619)

(declare-datatypes ((ValueCell!636 0))(
  ( (ValueCellFull!636 (v!2006 V!2115)) (EmptyCell!636) )
))
(declare-datatypes ((array!2621 0))(
  ( (array!2622 (arr!1254 (Array (_ BitVec 32) ValueCell!636)) (size!1406 (_ BitVec 32))) )
))
(declare-fun lt!16277 () array!2621)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16282 () Bool)

(declare-fun lt!16279 () V!2115)

(declare-fun contains!521 (ListLongMap!1075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!314 (array!2619 array!2621 (_ BitVec 32) (_ BitVec 32) V!2115 V!2115 (_ BitVec 32) Int) ListLongMap!1075)

(declare-fun head!852 (List!1066) tuple2!1498)

(assert (=> b!41391 (= lt!16282 (contains!521 (getCurrentListMap!314 lt!16283 lt!16277 mask!853 #b00000000000000000000000000000000 lt!16279 lt!16279 #b00000000000000000000000000000000 defaultEntry!470) (_1!760 (head!852 (toList!553 lt!16280)))))))

(declare-fun b!41388 () Bool)

(assert (=> b!41388 (= e!26223 (not e!26224))))

(declare-fun res!24573 () Bool)

(assert (=> b!41388 (=> res!24573 e!26224)))

(assert (=> b!41388 (= res!24573 (= lt!16280 (ListLongMap!1076 Nil!1063)))))

(declare-datatypes ((LongMapFixedSize!252 0))(
  ( (LongMapFixedSize!253 (defaultEntry!1816 Int) (mask!5217 (_ BitVec 32)) (extraKeys!1707 (_ BitVec 32)) (zeroValue!1734 V!2115) (minValue!1734 V!2115) (_size!175 (_ BitVec 32)) (_keys!3323 array!2619) (_values!1799 array!2621) (_vacant!175 (_ BitVec 32))) )
))
(declare-fun map!700 (LongMapFixedSize!252) ListLongMap!1075)

(assert (=> b!41388 (= lt!16280 (map!700 (LongMapFixedSize!253 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16279 lt!16279 #b00000000000000000000000000000000 lt!16283 lt!16277 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1067 0))(
  ( (Nil!1064) (Cons!1063 (h!1640 (_ BitVec 64)) (t!3940 List!1067)) )
))
(declare-fun arrayNoDuplicates!0 (array!2619 (_ BitVec 32) List!1067) Bool)

(assert (=> b!41388 (arrayNoDuplicates!0 lt!16283 #b00000000000000000000000000000000 Nil!1064)))

(declare-datatypes ((Unit!1007 0))(
  ( (Unit!1008) )
))
(declare-fun lt!16281 () Unit!1007)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2619 (_ BitVec 32) (_ BitVec 32) List!1067) Unit!1007)

(assert (=> b!41388 (= lt!16281 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2619 (_ BitVec 32)) Bool)

(assert (=> b!41388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16283 mask!853)))

(declare-fun lt!16278 () Unit!1007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2619 (_ BitVec 32) (_ BitVec 32)) Unit!1007)

(assert (=> b!41388 (= lt!16278 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16283 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2619 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41388 (= (arrayCountValidKeys!0 lt!16283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16276 () Unit!1007)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2619 (_ BitVec 32) (_ BitVec 32)) Unit!1007)

(assert (=> b!41388 (= lt!16276 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41388 (= lt!16277 (array!2622 ((as const (Array (_ BitVec 32) ValueCell!636)) EmptyCell!636) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41388 (= lt!16283 (array!2620 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!197 (Int (_ BitVec 64)) V!2115)

(assert (=> b!41388 (= lt!16279 (dynLambda!197 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5898 res!24570) b!41388))

(assert (= (and b!41388 (not res!24573)) b!41389))

(assert (= (and b!41389 (not res!24571)) b!41390))

(assert (= (and b!41390 (not res!24572)) b!41391))

(declare-fun b_lambda!2101 () Bool)

(assert (=> (not b_lambda!2101) (not b!41388)))

(declare-fun t!3938 () Bool)

(declare-fun tb!859 () Bool)

(assert (=> (and start!5898 (= defaultEntry!470 defaultEntry!470) t!3938) tb!859))

(declare-fun result!1469 () Bool)

(declare-fun tp_is_empty!1767 () Bool)

(assert (=> tb!859 (= result!1469 tp_is_empty!1767)))

(assert (=> b!41388 t!3938))

(declare-fun b_and!2405 () Bool)

(assert (= b_and!2403 (and (=> t!3938 result!1469) b_and!2405)))

(declare-fun m!34611 () Bool)

(assert (=> b!41389 m!34611))

(declare-fun m!34613 () Bool)

(assert (=> start!5898 m!34613))

(declare-fun m!34615 () Bool)

(assert (=> b!41391 m!34615))

(declare-fun m!34617 () Bool)

(assert (=> b!41391 m!34617))

(assert (=> b!41391 m!34615))

(declare-fun m!34619 () Bool)

(assert (=> b!41391 m!34619))

(declare-fun m!34621 () Bool)

(assert (=> b!41388 m!34621))

(declare-fun m!34623 () Bool)

(assert (=> b!41388 m!34623))

(declare-fun m!34625 () Bool)

(assert (=> b!41388 m!34625))

(declare-fun m!34627 () Bool)

(assert (=> b!41388 m!34627))

(declare-fun m!34629 () Bool)

(assert (=> b!41388 m!34629))

(declare-fun m!34631 () Bool)

(assert (=> b!41388 m!34631))

(declare-fun m!34633 () Bool)

(assert (=> b!41388 m!34633))

(declare-fun m!34635 () Bool)

(assert (=> b!41388 m!34635))

(check-sat (not b!41391) (not b!41389) (not start!5898) b_and!2405 (not b_next!1377) (not b_lambda!2101) tp_is_empty!1767 (not b!41388))
