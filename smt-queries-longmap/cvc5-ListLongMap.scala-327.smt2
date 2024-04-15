; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5942 () Bool)

(assert start!5942)

(declare-fun b_free!1427 () Bool)

(declare-fun b_next!1427 () Bool)

(assert (=> start!5942 (= b_free!1427 (not b_next!1427))))

(declare-fun tp!5828 () Bool)

(declare-fun b_and!2505 () Bool)

(assert (=> start!5942 (= tp!5828 b_and!2505)))

(declare-fun b!41661 () Bool)

(declare-fun e!26320 () Bool)

(assert (=> b!41661 (= e!26320 true)))

(declare-datatypes ((V!2181 0))(
  ( (V!2182 (val!947 Int)) )
))
(declare-datatypes ((ValueCell!661 0))(
  ( (ValueCellFull!661 (v!2029 V!2181)) (EmptyCell!661) )
))
(declare-datatypes ((array!2693 0))(
  ( (array!2694 (arr!1290 (Array (_ BitVec 32) ValueCell!661)) (size!1442 (_ BitVec 32))) )
))
(declare-fun lt!16860 () array!2693)

(declare-fun lt!16865 () V!2181)

(declare-datatypes ((array!2695 0))(
  ( (array!2696 (arr!1291 (Array (_ BitVec 32) (_ BitVec 64))) (size!1443 (_ BitVec 32))) )
))
(declare-fun lt!16859 () array!2695)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1552 0))(
  ( (tuple2!1553 (_1!787 (_ BitVec 64)) (_2!787 V!2181)) )
))
(declare-datatypes ((List!1109 0))(
  ( (Nil!1106) (Cons!1105 (h!1682 tuple2!1552) (t!4031 List!1109)) )
))
(declare-datatypes ((ListLongMap!1117 0))(
  ( (ListLongMap!1118 (toList!574 List!1109)) )
))
(declare-fun lt!16858 () ListLongMap!1117)

(declare-fun lt!16862 () Bool)

(declare-fun contains!544 (ListLongMap!1117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!329 (array!2695 array!2693 (_ BitVec 32) (_ BitVec 32) V!2181 V!2181 (_ BitVec 32) Int) ListLongMap!1117)

(declare-fun head!877 (List!1109) tuple2!1552)

(assert (=> b!41661 (= lt!16862 (contains!544 (getCurrentListMap!329 lt!16859 lt!16860 mask!853 #b00000000000000000000000000000000 lt!16865 lt!16865 #b00000000000000000000000000000000 defaultEntry!470) (_1!787 (head!877 (toList!574 lt!16858)))))))

(declare-fun b!41660 () Bool)

(declare-fun res!24844 () Bool)

(assert (=> b!41660 (=> res!24844 e!26320)))

(assert (=> b!41660 (= res!24844 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41659 () Bool)

(declare-fun res!24846 () Bool)

(assert (=> b!41659 (=> res!24846 e!26320)))

(declare-fun isEmpty!266 (List!1109) Bool)

(assert (=> b!41659 (= res!24846 (isEmpty!266 (toList!574 lt!16858)))))

(declare-fun b!41658 () Bool)

(declare-fun e!26321 () Bool)

(assert (=> b!41658 (= e!26321 (not e!26320))))

(declare-fun res!24845 () Bool)

(assert (=> b!41658 (=> res!24845 e!26320)))

(assert (=> b!41658 (= res!24845 (= lt!16858 (ListLongMap!1118 Nil!1106)))))

(declare-datatypes ((LongMapFixedSize!302 0))(
  ( (LongMapFixedSize!303 (defaultEntry!1841 Int) (mask!5257 (_ BitVec 32)) (extraKeys!1732 (_ BitVec 32)) (zeroValue!1759 V!2181) (minValue!1759 V!2181) (_size!200 (_ BitVec 32)) (_keys!3347 array!2695) (_values!1824 array!2693) (_vacant!200 (_ BitVec 32))) )
))
(declare-fun map!742 (LongMapFixedSize!302) ListLongMap!1117)

(assert (=> b!41658 (= lt!16858 (map!742 (LongMapFixedSize!303 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16865 lt!16865 #b00000000000000000000000000000000 lt!16859 lt!16860 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1110 0))(
  ( (Nil!1107) (Cons!1106 (h!1683 (_ BitVec 64)) (t!4032 List!1110)) )
))
(declare-fun arrayNoDuplicates!0 (array!2695 (_ BitVec 32) List!1110) Bool)

(assert (=> b!41658 (arrayNoDuplicates!0 lt!16859 #b00000000000000000000000000000000 Nil!1107)))

(declare-datatypes ((Unit!1064 0))(
  ( (Unit!1065) )
))
(declare-fun lt!16864 () Unit!1064)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2695 (_ BitVec 32) (_ BitVec 32) List!1110) Unit!1064)

(assert (=> b!41658 (= lt!16864 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16859 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2695 (_ BitVec 32)) Bool)

(assert (=> b!41658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16859 mask!853)))

(declare-fun lt!16863 () Unit!1064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2695 (_ BitVec 32) (_ BitVec 32)) Unit!1064)

(assert (=> b!41658 (= lt!16863 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16859 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41658 (= (arrayCountValidKeys!0 lt!16859 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16861 () Unit!1064)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2695 (_ BitVec 32) (_ BitVec 32)) Unit!1064)

(assert (=> b!41658 (= lt!16861 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16859 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41658 (= lt!16860 (array!2694 ((as const (Array (_ BitVec 32) ValueCell!661)) EmptyCell!661) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41658 (= lt!16859 (array!2696 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!221 (Int (_ BitVec 64)) V!2181)

(assert (=> b!41658 (= lt!16865 (dynLambda!221 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24847 () Bool)

(assert (=> start!5942 (=> (not res!24847) (not e!26321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5942 (= res!24847 (validMask!0 mask!853))))

(assert (=> start!5942 e!26321))

(assert (=> start!5942 true))

(assert (=> start!5942 tp!5828))

(assert (= (and start!5942 res!24847) b!41658))

(assert (= (and b!41658 (not res!24845)) b!41659))

(assert (= (and b!41659 (not res!24846)) b!41660))

(assert (= (and b!41660 (not res!24844)) b!41661))

(declare-fun b_lambda!2155 () Bool)

(assert (=> (not b_lambda!2155) (not b!41658)))

(declare-fun t!4030 () Bool)

(declare-fun tb!909 () Bool)

(assert (=> (and start!5942 (= defaultEntry!470 defaultEntry!470) t!4030) tb!909))

(declare-fun result!1569 () Bool)

(declare-fun tp_is_empty!1817 () Bool)

(assert (=> tb!909 (= result!1569 tp_is_empty!1817)))

(assert (=> b!41658 t!4030))

(declare-fun b_and!2507 () Bool)

(assert (= b_and!2505 (and (=> t!4030 result!1569) b_and!2507)))

(declare-fun m!35163 () Bool)

(assert (=> b!41661 m!35163))

(declare-fun m!35165 () Bool)

(assert (=> b!41661 m!35165))

(assert (=> b!41661 m!35163))

(declare-fun m!35167 () Bool)

(assert (=> b!41661 m!35167))

(declare-fun m!35169 () Bool)

(assert (=> b!41659 m!35169))

(declare-fun m!35171 () Bool)

(assert (=> b!41658 m!35171))

(declare-fun m!35173 () Bool)

(assert (=> b!41658 m!35173))

(declare-fun m!35175 () Bool)

(assert (=> b!41658 m!35175))

(declare-fun m!35177 () Bool)

(assert (=> b!41658 m!35177))

(declare-fun m!35179 () Bool)

(assert (=> b!41658 m!35179))

(declare-fun m!35181 () Bool)

(assert (=> b!41658 m!35181))

(declare-fun m!35183 () Bool)

(assert (=> b!41658 m!35183))

(declare-fun m!35185 () Bool)

(assert (=> b!41658 m!35185))

(declare-fun m!35187 () Bool)

(assert (=> start!5942 m!35187))

(push 1)

(assert (not b!41661))

(assert tp_is_empty!1817)

(assert b_and!2507)

(assert (not b_lambda!2155))

(assert (not start!5942))

(assert (not b!41658))

(assert (not b_next!1427))

(assert (not b!41659))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2507)

(assert (not b_next!1427))

(check-sat)

(pop 1)

