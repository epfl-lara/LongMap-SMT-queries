; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5920 () Bool)

(assert start!5920)

(declare-fun b_free!1399 () Bool)

(declare-fun b_next!1399 () Bool)

(assert (=> start!5920 (= b_free!1399 (not b_next!1399))))

(declare-fun tp!5786 () Bool)

(declare-fun b_and!2447 () Bool)

(assert (=> start!5920 (= tp!5786 b_and!2447)))

(declare-fun res!24703 () Bool)

(declare-fun e!26290 () Bool)

(assert (=> start!5920 (=> (not res!24703) (not e!26290))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5920 (= res!24703 (validMask!0 mask!853))))

(assert (=> start!5920 e!26290))

(assert (=> start!5920 true))

(assert (=> start!5920 tp!5786))

(declare-fun b!41542 () Bool)

(declare-fun e!26289 () Bool)

(assert (=> b!41542 (= e!26290 (not e!26289))))

(declare-fun res!24702 () Bool)

(assert (=> b!41542 (=> res!24702 e!26289)))

(declare-datatypes ((V!2145 0))(
  ( (V!2146 (val!933 Int)) )
))
(declare-datatypes ((tuple2!1520 0))(
  ( (tuple2!1521 (_1!771 (_ BitVec 64)) (_2!771 V!2145)) )
))
(declare-datatypes ((List!1088 0))(
  ( (Nil!1085) (Cons!1084 (h!1661 tuple2!1520) (t!3983 List!1088)) )
))
(declare-datatypes ((ListLongMap!1097 0))(
  ( (ListLongMap!1098 (toList!564 List!1088)) )
))
(declare-fun lt!16540 () ListLongMap!1097)

(assert (=> b!41542 (= res!24702 (= lt!16540 (ListLongMap!1098 Nil!1085)))))

(declare-fun lt!16547 () V!2145)

(declare-datatypes ((array!2663 0))(
  ( (array!2664 (arr!1275 (Array (_ BitVec 32) (_ BitVec 64))) (size!1427 (_ BitVec 32))) )
))
(declare-fun lt!16545 () array!2663)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!647 0))(
  ( (ValueCellFull!647 (v!2017 V!2145)) (EmptyCell!647) )
))
(declare-datatypes ((array!2665 0))(
  ( (array!2666 (arr!1276 (Array (_ BitVec 32) ValueCell!647)) (size!1428 (_ BitVec 32))) )
))
(declare-fun lt!16544 () array!2665)

(declare-datatypes ((LongMapFixedSize!274 0))(
  ( (LongMapFixedSize!275 (defaultEntry!1827 Int) (mask!5236 (_ BitVec 32)) (extraKeys!1718 (_ BitVec 32)) (zeroValue!1745 V!2145) (minValue!1745 V!2145) (_size!186 (_ BitVec 32)) (_keys!3334 array!2663) (_values!1810 array!2665) (_vacant!186 (_ BitVec 32))) )
))
(declare-fun map!719 (LongMapFixedSize!274) ListLongMap!1097)

(assert (=> b!41542 (= lt!16540 (map!719 (LongMapFixedSize!275 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16547 lt!16547 #b00000000000000000000000000000000 lt!16545 lt!16544 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1089 0))(
  ( (Nil!1086) (Cons!1085 (h!1662 (_ BitVec 64)) (t!3984 List!1089)) )
))
(declare-fun arrayNoDuplicates!0 (array!2663 (_ BitVec 32) List!1089) Bool)

(assert (=> b!41542 (arrayNoDuplicates!0 lt!16545 #b00000000000000000000000000000000 Nil!1086)))

(declare-datatypes ((Unit!1029 0))(
  ( (Unit!1030) )
))
(declare-fun lt!16543 () Unit!1029)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2663 (_ BitVec 32) (_ BitVec 32) List!1089) Unit!1029)

(assert (=> b!41542 (= lt!16543 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16545 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2663 (_ BitVec 32)) Bool)

(assert (=> b!41542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16545 mask!853)))

(declare-fun lt!16542 () Unit!1029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2663 (_ BitVec 32) (_ BitVec 32)) Unit!1029)

(assert (=> b!41542 (= lt!16542 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16545 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41542 (= (arrayCountValidKeys!0 lt!16545 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16541 () Unit!1029)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2663 (_ BitVec 32) (_ BitVec 32)) Unit!1029)

(assert (=> b!41542 (= lt!16541 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16545 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41542 (= lt!16544 (array!2666 ((as const (Array (_ BitVec 32) ValueCell!647)) EmptyCell!647) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41542 (= lt!16545 (array!2664 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!208 (Int (_ BitVec 64)) V!2145)

(assert (=> b!41542 (= lt!16547 (dynLambda!208 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41544 () Bool)

(declare-fun res!24705 () Bool)

(assert (=> b!41544 (=> res!24705 e!26289)))

(assert (=> b!41544 (= res!24705 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41543 () Bool)

(declare-fun res!24704 () Bool)

(assert (=> b!41543 (=> res!24704 e!26289)))

(declare-fun isEmpty!250 (List!1088) Bool)

(assert (=> b!41543 (= res!24704 (isEmpty!250 (toList!564 lt!16540)))))

(declare-fun b!41545 () Bool)

(assert (=> b!41545 (= e!26289 true)))

(declare-fun lt!16546 () Bool)

(declare-fun contains!532 (ListLongMap!1097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!325 (array!2663 array!2665 (_ BitVec 32) (_ BitVec 32) V!2145 V!2145 (_ BitVec 32) Int) ListLongMap!1097)

(declare-fun head!863 (List!1088) tuple2!1520)

(assert (=> b!41545 (= lt!16546 (contains!532 (getCurrentListMap!325 lt!16545 lt!16544 mask!853 #b00000000000000000000000000000000 lt!16547 lt!16547 #b00000000000000000000000000000000 defaultEntry!470) (_1!771 (head!863 (toList!564 lt!16540)))))))

(assert (= (and start!5920 res!24703) b!41542))

(assert (= (and b!41542 (not res!24702)) b!41543))

(assert (= (and b!41543 (not res!24704)) b!41544))

(assert (= (and b!41544 (not res!24705)) b!41545))

(declare-fun b_lambda!2123 () Bool)

(assert (=> (not b_lambda!2123) (not b!41542)))

(declare-fun t!3982 () Bool)

(declare-fun tb!881 () Bool)

(assert (=> (and start!5920 (= defaultEntry!470 defaultEntry!470) t!3982) tb!881))

(declare-fun result!1513 () Bool)

(declare-fun tp_is_empty!1789 () Bool)

(assert (=> tb!881 (= result!1513 tp_is_empty!1789)))

(assert (=> b!41542 t!3982))

(declare-fun b_and!2449 () Bool)

(assert (= b_and!2447 (and (=> t!3982 result!1513) b_and!2449)))

(declare-fun m!34897 () Bool)

(assert (=> start!5920 m!34897))

(declare-fun m!34899 () Bool)

(assert (=> b!41542 m!34899))

(declare-fun m!34901 () Bool)

(assert (=> b!41542 m!34901))

(declare-fun m!34903 () Bool)

(assert (=> b!41542 m!34903))

(declare-fun m!34905 () Bool)

(assert (=> b!41542 m!34905))

(declare-fun m!34907 () Bool)

(assert (=> b!41542 m!34907))

(declare-fun m!34909 () Bool)

(assert (=> b!41542 m!34909))

(declare-fun m!34911 () Bool)

(assert (=> b!41542 m!34911))

(declare-fun m!34913 () Bool)

(assert (=> b!41542 m!34913))

(declare-fun m!34915 () Bool)

(assert (=> b!41543 m!34915))

(declare-fun m!34917 () Bool)

(assert (=> b!41545 m!34917))

(declare-fun m!34919 () Bool)

(assert (=> b!41545 m!34919))

(assert (=> b!41545 m!34917))

(declare-fun m!34921 () Bool)

(assert (=> b!41545 m!34921))

(push 1)

(assert (not b!41545))

(assert (not b!41542))

(assert b_and!2449)

(assert tp_is_empty!1789)

(assert (not b_lambda!2123))

(assert (not b!41543))

(assert (not b_next!1399))

(assert (not start!5920))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2449)

(assert (not b_next!1399))

(check-sat)

(pop 1)

