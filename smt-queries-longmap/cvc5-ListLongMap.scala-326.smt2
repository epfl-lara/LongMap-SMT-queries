; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5938 () Bool)

(assert start!5938)

(declare-fun b_free!1417 () Bool)

(declare-fun b_next!1417 () Bool)

(assert (=> start!5938 (= b_free!1417 (not b_next!1417))))

(declare-fun tp!5813 () Bool)

(declare-fun b_and!2483 () Bool)

(assert (=> start!5938 (= tp!5813 b_and!2483)))

(declare-fun b!41671 () Bool)

(declare-fun e!26344 () Bool)

(assert (=> b!41671 (= e!26344 true)))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2169 0))(
  ( (V!2170 (val!942 Int)) )
))
(declare-fun lt!16763 () V!2169)

(declare-datatypes ((ValueCell!656 0))(
  ( (ValueCellFull!656 (v!2026 V!2169)) (EmptyCell!656) )
))
(declare-datatypes ((array!2699 0))(
  ( (array!2700 (arr!1293 (Array (_ BitVec 32) ValueCell!656)) (size!1445 (_ BitVec 32))) )
))
(declare-fun lt!16758 () array!2699)

(declare-datatypes ((array!2701 0))(
  ( (array!2702 (arr!1294 (Array (_ BitVec 32) (_ BitVec 64))) (size!1446 (_ BitVec 32))) )
))
(declare-fun lt!16760 () array!2701)

(declare-datatypes ((tuple2!1538 0))(
  ( (tuple2!1539 (_1!780 (_ BitVec 64)) (_2!780 V!2169)) )
))
(declare-datatypes ((List!1106 0))(
  ( (Nil!1103) (Cons!1102 (h!1679 tuple2!1538) (t!4019 List!1106)) )
))
(declare-datatypes ((ListLongMap!1115 0))(
  ( (ListLongMap!1116 (toList!573 List!1106)) )
))
(declare-fun lt!16757 () ListLongMap!1115)

(declare-fun lt!16761 () Bool)

(declare-fun contains!541 (ListLongMap!1115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!334 (array!2701 array!2699 (_ BitVec 32) (_ BitVec 32) V!2169 V!2169 (_ BitVec 32) Int) ListLongMap!1115)

(declare-fun head!872 (List!1106) tuple2!1538)

(assert (=> b!41671 (= lt!16761 (contains!541 (getCurrentListMap!334 lt!16760 lt!16758 mask!853 #b00000000000000000000000000000000 lt!16763 lt!16763 #b00000000000000000000000000000000 defaultEntry!470) (_1!780 (head!872 (toList!573 lt!16757)))))))

(declare-fun b!41668 () Bool)

(declare-fun e!26343 () Bool)

(assert (=> b!41668 (= e!26343 (not e!26344))))

(declare-fun res!24810 () Bool)

(assert (=> b!41668 (=> res!24810 e!26344)))

(assert (=> b!41668 (= res!24810 (= lt!16757 (ListLongMap!1116 Nil!1103)))))

(declare-datatypes ((LongMapFixedSize!292 0))(
  ( (LongMapFixedSize!293 (defaultEntry!1836 Int) (mask!5251 (_ BitVec 32)) (extraKeys!1727 (_ BitVec 32)) (zeroValue!1754 V!2169) (minValue!1754 V!2169) (_size!195 (_ BitVec 32)) (_keys!3343 array!2701) (_values!1819 array!2699) (_vacant!195 (_ BitVec 32))) )
))
(declare-fun map!734 (LongMapFixedSize!292) ListLongMap!1115)

(assert (=> b!41668 (= lt!16757 (map!734 (LongMapFixedSize!293 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16763 lt!16763 #b00000000000000000000000000000000 lt!16760 lt!16758 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1107 0))(
  ( (Nil!1104) (Cons!1103 (h!1680 (_ BitVec 64)) (t!4020 List!1107)) )
))
(declare-fun arrayNoDuplicates!0 (array!2701 (_ BitVec 32) List!1107) Bool)

(assert (=> b!41668 (arrayNoDuplicates!0 lt!16760 #b00000000000000000000000000000000 Nil!1104)))

(declare-datatypes ((Unit!1047 0))(
  ( (Unit!1048) )
))
(declare-fun lt!16756 () Unit!1047)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2701 (_ BitVec 32) (_ BitVec 32) List!1107) Unit!1047)

(assert (=> b!41668 (= lt!16756 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16760 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2701 (_ BitVec 32)) Bool)

(assert (=> b!41668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16760 mask!853)))

(declare-fun lt!16762 () Unit!1047)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2701 (_ BitVec 32) (_ BitVec 32)) Unit!1047)

(assert (=> b!41668 (= lt!16762 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16760 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2701 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41668 (= (arrayCountValidKeys!0 lt!16760 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16759 () Unit!1047)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2701 (_ BitVec 32) (_ BitVec 32)) Unit!1047)

(assert (=> b!41668 (= lt!16759 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16760 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41668 (= lt!16758 (array!2700 ((as const (Array (_ BitVec 32) ValueCell!656)) EmptyCell!656) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41668 (= lt!16760 (array!2702 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!217 (Int (_ BitVec 64)) V!2169)

(assert (=> b!41668 (= lt!16763 (dynLambda!217 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24813 () Bool)

(assert (=> start!5938 (=> (not res!24813) (not e!26343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5938 (= res!24813 (validMask!0 mask!853))))

(assert (=> start!5938 e!26343))

(assert (=> start!5938 true))

(assert (=> start!5938 tp!5813))

(declare-fun b!41670 () Bool)

(declare-fun res!24812 () Bool)

(assert (=> b!41670 (=> res!24812 e!26344)))

(assert (=> b!41670 (= res!24812 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41669 () Bool)

(declare-fun res!24811 () Bool)

(assert (=> b!41669 (=> res!24811 e!26344)))

(declare-fun isEmpty!259 (List!1106) Bool)

(assert (=> b!41669 (= res!24811 (isEmpty!259 (toList!573 lt!16757)))))

(assert (= (and start!5938 res!24813) b!41668))

(assert (= (and b!41668 (not res!24810)) b!41669))

(assert (= (and b!41669 (not res!24811)) b!41670))

(assert (= (and b!41670 (not res!24812)) b!41671))

(declare-fun b_lambda!2141 () Bool)

(assert (=> (not b_lambda!2141) (not b!41668)))

(declare-fun t!4018 () Bool)

(declare-fun tb!899 () Bool)

(assert (=> (and start!5938 (= defaultEntry!470 defaultEntry!470) t!4018) tb!899))

(declare-fun result!1549 () Bool)

(declare-fun tp_is_empty!1807 () Bool)

(assert (=> tb!899 (= result!1549 tp_is_empty!1807)))

(assert (=> b!41668 t!4018))

(declare-fun b_and!2485 () Bool)

(assert (= b_and!2483 (and (=> t!4018 result!1549) b_and!2485)))

(declare-fun m!35131 () Bool)

(assert (=> b!41671 m!35131))

(declare-fun m!35133 () Bool)

(assert (=> b!41671 m!35133))

(assert (=> b!41671 m!35131))

(declare-fun m!35135 () Bool)

(assert (=> b!41671 m!35135))

(declare-fun m!35137 () Bool)

(assert (=> b!41668 m!35137))

(declare-fun m!35139 () Bool)

(assert (=> b!41668 m!35139))

(declare-fun m!35141 () Bool)

(assert (=> b!41668 m!35141))

(declare-fun m!35143 () Bool)

(assert (=> b!41668 m!35143))

(declare-fun m!35145 () Bool)

(assert (=> b!41668 m!35145))

(declare-fun m!35147 () Bool)

(assert (=> b!41668 m!35147))

(declare-fun m!35149 () Bool)

(assert (=> b!41668 m!35149))

(declare-fun m!35151 () Bool)

(assert (=> b!41668 m!35151))

(declare-fun m!35153 () Bool)

(assert (=> start!5938 m!35153))

(declare-fun m!35155 () Bool)

(assert (=> b!41669 m!35155))

(push 1)

(assert tp_is_empty!1807)

(assert (not b_lambda!2141))

(assert (not b!41668))

(assert (not start!5938))

(assert (not b!41671))

(assert (not b_next!1417))

(assert (not b!41669))

(assert b_and!2485)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2485)

(assert (not b_next!1417))

(check-sat)

(pop 1)

