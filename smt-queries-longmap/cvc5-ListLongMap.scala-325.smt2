; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5930 () Bool)

(assert start!5930)

(declare-fun b_free!1415 () Bool)

(declare-fun b_next!1415 () Bool)

(assert (=> start!5930 (= b_free!1415 (not b_next!1415))))

(declare-fun tp!5810 () Bool)

(declare-fun b_and!2481 () Bool)

(assert (=> start!5930 (= tp!5810 b_and!2481)))

(declare-fun b!41577 () Bool)

(declare-fun e!26285 () Bool)

(assert (=> b!41577 (= e!26285 true)))

(declare-datatypes ((V!2165 0))(
  ( (V!2166 (val!941 Int)) )
))
(declare-datatypes ((ValueCell!655 0))(
  ( (ValueCellFull!655 (v!2023 V!2165)) (EmptyCell!655) )
))
(declare-datatypes ((array!2669 0))(
  ( (array!2670 (arr!1278 (Array (_ BitVec 32) ValueCell!655)) (size!1430 (_ BitVec 32))) )
))
(declare-fun lt!16718 () array!2669)

(declare-datatypes ((array!2671 0))(
  ( (array!2672 (arr!1279 (Array (_ BitVec 32) (_ BitVec 64))) (size!1431 (_ BitVec 32))) )
))
(declare-fun lt!16715 () array!2671)

(declare-fun lt!16716 () Bool)

(declare-fun lt!16719 () V!2165)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1540 0))(
  ( (tuple2!1541 (_1!781 (_ BitVec 64)) (_2!781 V!2165)) )
))
(declare-datatypes ((List!1097 0))(
  ( (Nil!1094) (Cons!1093 (h!1670 tuple2!1540) (t!4007 List!1097)) )
))
(declare-datatypes ((ListLongMap!1105 0))(
  ( (ListLongMap!1106 (toList!568 List!1097)) )
))
(declare-fun lt!16717 () ListLongMap!1105)

(declare-fun contains!538 (ListLongMap!1105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!323 (array!2671 array!2669 (_ BitVec 32) (_ BitVec 32) V!2165 V!2165 (_ BitVec 32) Int) ListLongMap!1105)

(declare-fun head!871 (List!1097) tuple2!1540)

(assert (=> b!41577 (= lt!16716 (contains!538 (getCurrentListMap!323 lt!16715 lt!16718 mask!853 #b00000000000000000000000000000000 lt!16719 lt!16719 #b00000000000000000000000000000000 defaultEntry!470) (_1!781 (head!871 (toList!568 lt!16717)))))))

(declare-fun res!24772 () Bool)

(declare-fun e!26284 () Bool)

(assert (=> start!5930 (=> (not res!24772) (not e!26284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5930 (= res!24772 (validMask!0 mask!853))))

(assert (=> start!5930 e!26284))

(assert (=> start!5930 true))

(assert (=> start!5930 tp!5810))

(declare-fun b!41575 () Bool)

(declare-fun res!24774 () Bool)

(assert (=> b!41575 (=> res!24774 e!26285)))

(declare-fun isEmpty!260 (List!1097) Bool)

(assert (=> b!41575 (= res!24774 (isEmpty!260 (toList!568 lt!16717)))))

(declare-fun b!41576 () Bool)

(declare-fun res!24773 () Bool)

(assert (=> b!41576 (=> res!24773 e!26285)))

(assert (=> b!41576 (= res!24773 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41574 () Bool)

(assert (=> b!41574 (= e!26284 (not e!26285))))

(declare-fun res!24775 () Bool)

(assert (=> b!41574 (=> res!24775 e!26285)))

(assert (=> b!41574 (= res!24775 (= lt!16717 (ListLongMap!1106 Nil!1094)))))

(declare-datatypes ((LongMapFixedSize!290 0))(
  ( (LongMapFixedSize!291 (defaultEntry!1835 Int) (mask!5247 (_ BitVec 32)) (extraKeys!1726 (_ BitVec 32)) (zeroValue!1753 V!2165) (minValue!1753 V!2165) (_size!194 (_ BitVec 32)) (_keys!3341 array!2671) (_values!1818 array!2669) (_vacant!194 (_ BitVec 32))) )
))
(declare-fun map!732 (LongMapFixedSize!290) ListLongMap!1105)

(assert (=> b!41574 (= lt!16717 (map!732 (LongMapFixedSize!291 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16719 lt!16719 #b00000000000000000000000000000000 lt!16715 lt!16718 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1098 0))(
  ( (Nil!1095) (Cons!1094 (h!1671 (_ BitVec 64)) (t!4008 List!1098)) )
))
(declare-fun arrayNoDuplicates!0 (array!2671 (_ BitVec 32) List!1098) Bool)

(assert (=> b!41574 (arrayNoDuplicates!0 lt!16715 #b00000000000000000000000000000000 Nil!1095)))

(declare-datatypes ((Unit!1052 0))(
  ( (Unit!1053) )
))
(declare-fun lt!16720 () Unit!1052)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2671 (_ BitVec 32) (_ BitVec 32) List!1098) Unit!1052)

(assert (=> b!41574 (= lt!16720 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2671 (_ BitVec 32)) Bool)

(assert (=> b!41574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16715 mask!853)))

(declare-fun lt!16721 () Unit!1052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2671 (_ BitVec 32) (_ BitVec 32)) Unit!1052)

(assert (=> b!41574 (= lt!16721 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16715 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2671 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41574 (= (arrayCountValidKeys!0 lt!16715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16714 () Unit!1052)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2671 (_ BitVec 32) (_ BitVec 32)) Unit!1052)

(assert (=> b!41574 (= lt!16714 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41574 (= lt!16718 (array!2670 ((as const (Array (_ BitVec 32) ValueCell!655)) EmptyCell!655) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41574 (= lt!16715 (array!2672 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!215 (Int (_ BitVec 64)) V!2165)

(assert (=> b!41574 (= lt!16719 (dynLambda!215 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5930 res!24772) b!41574))

(assert (= (and b!41574 (not res!24775)) b!41575))

(assert (= (and b!41575 (not res!24774)) b!41576))

(assert (= (and b!41576 (not res!24773)) b!41577))

(declare-fun b_lambda!2143 () Bool)

(assert (=> (not b_lambda!2143) (not b!41574)))

(declare-fun t!4006 () Bool)

(declare-fun tb!897 () Bool)

(assert (=> (and start!5930 (= defaultEntry!470 defaultEntry!470) t!4006) tb!897))

(declare-fun result!1545 () Bool)

(declare-fun tp_is_empty!1805 () Bool)

(assert (=> tb!897 (= result!1545 tp_is_empty!1805)))

(assert (=> b!41574 t!4006))

(declare-fun b_and!2483 () Bool)

(assert (= b_and!2481 (and (=> t!4006 result!1545) b_and!2483)))

(declare-fun m!35007 () Bool)

(assert (=> b!41577 m!35007))

(declare-fun m!35009 () Bool)

(assert (=> b!41577 m!35009))

(assert (=> b!41577 m!35007))

(declare-fun m!35011 () Bool)

(assert (=> b!41577 m!35011))

(declare-fun m!35013 () Bool)

(assert (=> start!5930 m!35013))

(declare-fun m!35015 () Bool)

(assert (=> b!41575 m!35015))

(declare-fun m!35017 () Bool)

(assert (=> b!41574 m!35017))

(declare-fun m!35019 () Bool)

(assert (=> b!41574 m!35019))

(declare-fun m!35021 () Bool)

(assert (=> b!41574 m!35021))

(declare-fun m!35023 () Bool)

(assert (=> b!41574 m!35023))

(declare-fun m!35025 () Bool)

(assert (=> b!41574 m!35025))

(declare-fun m!35027 () Bool)

(assert (=> b!41574 m!35027))

(declare-fun m!35029 () Bool)

(assert (=> b!41574 m!35029))

(declare-fun m!35031 () Bool)

(assert (=> b!41574 m!35031))

(push 1)

(assert (not start!5930))

(assert (not b_next!1415))

(assert (not b!41574))

(assert (not b_lambda!2143))

(assert (not b!41577))

(assert tp_is_empty!1805)

(assert (not b!41575))

(assert b_and!2483)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2483)

(assert (not b_next!1415))

(check-sat)

(pop 1)

