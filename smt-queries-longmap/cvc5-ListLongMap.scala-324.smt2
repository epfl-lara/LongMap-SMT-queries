; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5934 () Bool)

(assert start!5934)

(declare-fun b_free!1409 () Bool)

(declare-fun b_next!1409 () Bool)

(assert (=> start!5934 (= b_free!1409 (not b_next!1409))))

(declare-fun tp!5801 () Bool)

(declare-fun b_and!2465 () Bool)

(assert (=> start!5934 (= tp!5801 b_and!2465)))

(declare-fun b!41556 () Bool)

(declare-fun res!24738 () Bool)

(declare-fun e!26282 () Bool)

(assert (=> b!41556 (=> res!24738 e!26282)))

(declare-datatypes ((V!2157 0))(
  ( (V!2158 (val!938 Int)) )
))
(declare-datatypes ((tuple2!1512 0))(
  ( (tuple2!1513 (_1!767 (_ BitVec 64)) (_2!767 V!2157)) )
))
(declare-datatypes ((List!1084 0))(
  ( (Nil!1081) (Cons!1080 (h!1657 tuple2!1512) (t!3989 List!1084)) )
))
(declare-datatypes ((ListLongMap!1083 0))(
  ( (ListLongMap!1084 (toList!557 List!1084)) )
))
(declare-fun lt!16624 () ListLongMap!1083)

(declare-fun isEmpty!259 (List!1084) Bool)

(assert (=> b!41556 (= res!24738 (isEmpty!259 (toList!557 lt!16624)))))

(declare-fun b!41555 () Bool)

(declare-fun e!26283 () Bool)

(assert (=> b!41555 (= e!26283 (not e!26282))))

(declare-fun res!24739 () Bool)

(assert (=> b!41555 (=> res!24739 e!26282)))

(assert (=> b!41555 (= res!24739 (= lt!16624 (ListLongMap!1084 Nil!1081)))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((array!2669 0))(
  ( (array!2670 (arr!1278 (Array (_ BitVec 32) (_ BitVec 64))) (size!1430 (_ BitVec 32))) )
))
(declare-fun lt!16622 () array!2669)

(declare-datatypes ((ValueCell!652 0))(
  ( (ValueCellFull!652 (v!2023 V!2157)) (EmptyCell!652) )
))
(declare-datatypes ((array!2671 0))(
  ( (array!2672 (arr!1279 (Array (_ BitVec 32) ValueCell!652)) (size!1431 (_ BitVec 32))) )
))
(declare-fun lt!16617 () array!2671)

(declare-fun lt!16623 () V!2157)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!284 0))(
  ( (LongMapFixedSize!285 (defaultEntry!1832 Int) (mask!5243 (_ BitVec 32)) (extraKeys!1723 (_ BitVec 32)) (zeroValue!1750 V!2157) (minValue!1750 V!2157) (_size!191 (_ BitVec 32)) (_keys!3339 array!2669) (_values!1815 array!2671) (_vacant!191 (_ BitVec 32))) )
))
(declare-fun map!726 (LongMapFixedSize!284) ListLongMap!1083)

(assert (=> b!41555 (= lt!16624 (map!726 (LongMapFixedSize!285 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16623 lt!16623 #b00000000000000000000000000000000 lt!16622 lt!16617 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1085 0))(
  ( (Nil!1082) (Cons!1081 (h!1658 (_ BitVec 64)) (t!3990 List!1085)) )
))
(declare-fun arrayNoDuplicates!0 (array!2669 (_ BitVec 32) List!1085) Bool)

(assert (=> b!41555 (arrayNoDuplicates!0 lt!16622 #b00000000000000000000000000000000 Nil!1082)))

(declare-datatypes ((Unit!1051 0))(
  ( (Unit!1052) )
))
(declare-fun lt!16620 () Unit!1051)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2669 (_ BitVec 32) (_ BitVec 32) List!1085) Unit!1051)

(assert (=> b!41555 (= lt!16620 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2669 (_ BitVec 32)) Bool)

(assert (=> b!41555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16622 mask!853)))

(declare-fun lt!16618 () Unit!1051)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2669 (_ BitVec 32) (_ BitVec 32)) Unit!1051)

(assert (=> b!41555 (= lt!16618 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16622 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2669 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41555 (= (arrayCountValidKeys!0 lt!16622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16621 () Unit!1051)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2669 (_ BitVec 32) (_ BitVec 32)) Unit!1051)

(assert (=> b!41555 (= lt!16621 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16622 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41555 (= lt!16617 (array!2672 ((as const (Array (_ BitVec 32) ValueCell!652)) EmptyCell!652) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41555 (= lt!16622 (array!2670 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!209 (Int (_ BitVec 64)) V!2157)

(assert (=> b!41555 (= lt!16623 (dynLambda!209 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41557 () Bool)

(declare-fun res!24740 () Bool)

(assert (=> b!41557 (=> res!24740 e!26282)))

(assert (=> b!41557 (= res!24740 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24737 () Bool)

(assert (=> start!5934 (=> (not res!24737) (not e!26283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5934 (= res!24737 (validMask!0 mask!853))))

(assert (=> start!5934 e!26283))

(assert (=> start!5934 true))

(assert (=> start!5934 tp!5801))

(declare-fun b!41558 () Bool)

(assert (=> b!41558 (= e!26282 true)))

(declare-fun lt!16619 () Bool)

(declare-fun contains!528 (ListLongMap!1083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!314 (array!2669 array!2671 (_ BitVec 32) (_ BitVec 32) V!2157 V!2157 (_ BitVec 32) Int) ListLongMap!1083)

(declare-fun head!866 (List!1084) tuple2!1512)

(assert (=> b!41558 (= lt!16619 (contains!528 (getCurrentListMap!314 lt!16622 lt!16617 mask!853 #b00000000000000000000000000000000 lt!16623 lt!16623 #b00000000000000000000000000000000 defaultEntry!470) (_1!767 (head!866 (toList!557 lt!16624)))))))

(assert (= (and start!5934 res!24737) b!41555))

(assert (= (and b!41555 (not res!24739)) b!41556))

(assert (= (and b!41556 (not res!24738)) b!41557))

(assert (= (and b!41557 (not res!24740)) b!41558))

(declare-fun b_lambda!2133 () Bool)

(assert (=> (not b_lambda!2133) (not b!41555)))

(declare-fun t!3988 () Bool)

(declare-fun tb!891 () Bool)

(assert (=> (and start!5934 (= defaultEntry!470 defaultEntry!470) t!3988) tb!891))

(declare-fun result!1533 () Bool)

(declare-fun tp_is_empty!1799 () Bool)

(assert (=> tb!891 (= result!1533 tp_is_empty!1799)))

(assert (=> b!41555 t!3988))

(declare-fun b_and!2467 () Bool)

(assert (= b_and!2465 (and (=> t!3988 result!1533) b_and!2467)))

(declare-fun m!34901 () Bool)

(assert (=> b!41556 m!34901))

(declare-fun m!34903 () Bool)

(assert (=> b!41555 m!34903))

(declare-fun m!34905 () Bool)

(assert (=> b!41555 m!34905))

(declare-fun m!34907 () Bool)

(assert (=> b!41555 m!34907))

(declare-fun m!34909 () Bool)

(assert (=> b!41555 m!34909))

(declare-fun m!34911 () Bool)

(assert (=> b!41555 m!34911))

(declare-fun m!34913 () Bool)

(assert (=> b!41555 m!34913))

(declare-fun m!34915 () Bool)

(assert (=> b!41555 m!34915))

(declare-fun m!34917 () Bool)

(assert (=> b!41555 m!34917))

(declare-fun m!34919 () Bool)

(assert (=> start!5934 m!34919))

(declare-fun m!34921 () Bool)

(assert (=> b!41558 m!34921))

(declare-fun m!34923 () Bool)

(assert (=> b!41558 m!34923))

(assert (=> b!41558 m!34921))

(declare-fun m!34925 () Bool)

(assert (=> b!41558 m!34925))

(push 1)

(assert (not b!41556))

(assert (not b_next!1409))

(assert (not start!5934))

(assert b_and!2467)

(assert tp_is_empty!1799)

(assert (not b_lambda!2133))

(assert (not b!41555))

(assert (not b!41558))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2467)

(assert (not b_next!1409))

(check-sat)

(pop 1)

