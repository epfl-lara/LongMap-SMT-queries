; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5948 () Bool)

(assert start!5948)

(declare-fun b_free!1423 () Bool)

(declare-fun b_next!1423 () Bool)

(assert (=> start!5948 (= b_free!1423 (not b_next!1423))))

(declare-fun tp!5822 () Bool)

(declare-fun b_and!2493 () Bool)

(assert (=> start!5948 (= tp!5822 b_and!2493)))

(declare-fun b!41653 () Bool)

(declare-fun e!26324 () Bool)

(declare-fun e!26325 () Bool)

(assert (=> b!41653 (= e!26324 (not e!26325))))

(declare-fun res!24822 () Bool)

(assert (=> b!41653 (=> res!24822 e!26325)))

(declare-datatypes ((V!2177 0))(
  ( (V!2178 (val!945 Int)) )
))
(declare-datatypes ((tuple2!1526 0))(
  ( (tuple2!1527 (_1!774 (_ BitVec 64)) (_2!774 V!2177)) )
))
(declare-datatypes ((List!1098 0))(
  ( (Nil!1095) (Cons!1094 (h!1671 tuple2!1526) (t!4017 List!1098)) )
))
(declare-datatypes ((ListLongMap!1097 0))(
  ( (ListLongMap!1098 (toList!564 List!1098)) )
))
(declare-fun lt!16790 () ListLongMap!1097)

(assert (=> b!41653 (= res!24822 (= lt!16790 (ListLongMap!1098 Nil!1095)))))

(declare-fun lt!16788 () V!2177)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2697 0))(
  ( (array!2698 (arr!1292 (Array (_ BitVec 32) (_ BitVec 64))) (size!1444 (_ BitVec 32))) )
))
(declare-fun lt!16786 () array!2697)

(declare-datatypes ((ValueCell!659 0))(
  ( (ValueCellFull!659 (v!2030 V!2177)) (EmptyCell!659) )
))
(declare-datatypes ((array!2699 0))(
  ( (array!2700 (arr!1293 (Array (_ BitVec 32) ValueCell!659)) (size!1445 (_ BitVec 32))) )
))
(declare-fun lt!16789 () array!2699)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((LongMapFixedSize!298 0))(
  ( (LongMapFixedSize!299 (defaultEntry!1839 Int) (mask!5256 (_ BitVec 32)) (extraKeys!1730 (_ BitVec 32)) (zeroValue!1757 V!2177) (minValue!1757 V!2177) (_size!198 (_ BitVec 32)) (_keys!3346 array!2697) (_values!1822 array!2699) (_vacant!198 (_ BitVec 32))) )
))
(declare-fun map!739 (LongMapFixedSize!298) ListLongMap!1097)

(assert (=> b!41653 (= lt!16790 (map!739 (LongMapFixedSize!299 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16788 lt!16788 #b00000000000000000000000000000000 lt!16786 lt!16789 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1099 0))(
  ( (Nil!1096) (Cons!1095 (h!1672 (_ BitVec 64)) (t!4018 List!1099)) )
))
(declare-fun arrayNoDuplicates!0 (array!2697 (_ BitVec 32) List!1099) Bool)

(assert (=> b!41653 (arrayNoDuplicates!0 lt!16786 #b00000000000000000000000000000000 Nil!1096)))

(declare-datatypes ((Unit!1065 0))(
  ( (Unit!1066) )
))
(declare-fun lt!16792 () Unit!1065)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2697 (_ BitVec 32) (_ BitVec 32) List!1099) Unit!1065)

(assert (=> b!41653 (= lt!16792 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16786 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2697 (_ BitVec 32)) Bool)

(assert (=> b!41653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16786 mask!853)))

(declare-fun lt!16791 () Unit!1065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2697 (_ BitVec 32) (_ BitVec 32)) Unit!1065)

(assert (=> b!41653 (= lt!16791 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16786 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41653 (= (arrayCountValidKeys!0 lt!16786 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16785 () Unit!1065)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2697 (_ BitVec 32) (_ BitVec 32)) Unit!1065)

(assert (=> b!41653 (= lt!16785 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16786 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41653 (= lt!16789 (array!2700 ((as const (Array (_ BitVec 32) ValueCell!659)) EmptyCell!659) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41653 (= lt!16786 (array!2698 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!216 (Int (_ BitVec 64)) V!2177)

(assert (=> b!41653 (= lt!16788 (dynLambda!216 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41654 () Bool)

(declare-fun res!24824 () Bool)

(assert (=> b!41654 (=> res!24824 e!26325)))

(declare-fun isEmpty!266 (List!1098) Bool)

(assert (=> b!41654 (= res!24824 (isEmpty!266 (toList!564 lt!16790)))))

(declare-fun res!24821 () Bool)

(assert (=> start!5948 (=> (not res!24821) (not e!26324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5948 (= res!24821 (validMask!0 mask!853))))

(assert (=> start!5948 e!26324))

(assert (=> start!5948 true))

(assert (=> start!5948 tp!5822))

(declare-fun b!41655 () Bool)

(declare-fun res!24823 () Bool)

(assert (=> b!41655 (=> res!24823 e!26325)))

(assert (=> b!41655 (= res!24823 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41656 () Bool)

(assert (=> b!41656 (= e!26325 true)))

(declare-fun lt!16787 () Bool)

(declare-fun contains!535 (ListLongMap!1097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!321 (array!2697 array!2699 (_ BitVec 32) (_ BitVec 32) V!2177 V!2177 (_ BitVec 32) Int) ListLongMap!1097)

(declare-fun head!873 (List!1098) tuple2!1526)

(assert (=> b!41656 (= lt!16787 (contains!535 (getCurrentListMap!321 lt!16786 lt!16789 mask!853 #b00000000000000000000000000000000 lt!16788 lt!16788 #b00000000000000000000000000000000 defaultEntry!470) (_1!774 (head!873 (toList!564 lt!16790)))))))

(assert (= (and start!5948 res!24821) b!41653))

(assert (= (and b!41653 (not res!24822)) b!41654))

(assert (= (and b!41654 (not res!24824)) b!41655))

(assert (= (and b!41655 (not res!24823)) b!41656))

(declare-fun b_lambda!2147 () Bool)

(assert (=> (not b_lambda!2147) (not b!41653)))

(declare-fun t!4016 () Bool)

(declare-fun tb!905 () Bool)

(assert (=> (and start!5948 (= defaultEntry!470 defaultEntry!470) t!4016) tb!905))

(declare-fun result!1561 () Bool)

(declare-fun tp_is_empty!1813 () Bool)

(assert (=> tb!905 (= result!1561 tp_is_empty!1813)))

(assert (=> b!41653 t!4016))

(declare-fun b_and!2495 () Bool)

(assert (= b_and!2493 (and (=> t!4016 result!1561) b_and!2495)))

(declare-fun m!35083 () Bool)

(assert (=> b!41653 m!35083))

(declare-fun m!35085 () Bool)

(assert (=> b!41653 m!35085))

(declare-fun m!35087 () Bool)

(assert (=> b!41653 m!35087))

(declare-fun m!35089 () Bool)

(assert (=> b!41653 m!35089))

(declare-fun m!35091 () Bool)

(assert (=> b!41653 m!35091))

(declare-fun m!35093 () Bool)

(assert (=> b!41653 m!35093))

(declare-fun m!35095 () Bool)

(assert (=> b!41653 m!35095))

(declare-fun m!35097 () Bool)

(assert (=> b!41653 m!35097))

(declare-fun m!35099 () Bool)

(assert (=> b!41654 m!35099))

(declare-fun m!35101 () Bool)

(assert (=> start!5948 m!35101))

(declare-fun m!35103 () Bool)

(assert (=> b!41656 m!35103))

(declare-fun m!35105 () Bool)

(assert (=> b!41656 m!35105))

(assert (=> b!41656 m!35103))

(declare-fun m!35107 () Bool)

(assert (=> b!41656 m!35107))

(check-sat (not b_lambda!2147) tp_is_empty!1813 (not b_next!1423) (not b!41654) (not b!41656) (not b!41653) (not start!5948) b_and!2495)
(check-sat b_and!2495 (not b_next!1423))
