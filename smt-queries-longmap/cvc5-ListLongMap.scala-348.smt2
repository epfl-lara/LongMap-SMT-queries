; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6374 () Bool)

(assert start!6374)

(declare-fun b_free!1469 () Bool)

(declare-fun b_next!1469 () Bool)

(assert (=> start!6374 (= b_free!1469 (not b_next!1469))))

(declare-fun tp!5891 () Bool)

(declare-fun b_and!2589 () Bool)

(assert (=> start!6374 (= tp!5891 b_and!2589)))

(declare-fun res!25399 () Bool)

(declare-fun e!27053 () Bool)

(assert (=> start!6374 (=> (not res!25399) (not e!27053))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6374 (= res!25399 (validMask!0 mask!853))))

(assert (=> start!6374 e!27053))

(assert (=> start!6374 true))

(assert (=> start!6374 tp!5891))

(declare-fun b!42687 () Bool)

(assert (=> b!42687 (= e!27053 (not true))))

(declare-datatypes ((V!2265 0))(
  ( (V!2266 (val!968 Int)) )
))
(declare-fun lt!17987 () V!2265)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1594 0))(
  ( (tuple2!1595 (_1!808 (_ BitVec 64)) (_2!808 V!2265)) )
))
(declare-datatypes ((List!1157 0))(
  ( (Nil!1154) (Cons!1153 (h!1730 tuple2!1594) (t!4121 List!1157)) )
))
(declare-datatypes ((ListLongMap!1159 0))(
  ( (ListLongMap!1160 (toList!595 List!1157)) )
))
(declare-fun lt!17982 () ListLongMap!1159)

(declare-datatypes ((array!2837 0))(
  ( (array!2838 (arr!1362 (Array (_ BitVec 32) (_ BitVec 64))) (size!1541 (_ BitVec 32))) )
))
(declare-fun lt!17983 () array!2837)

(declare-datatypes ((ValueCell!682 0))(
  ( (ValueCellFull!682 (v!2056 V!2265)) (EmptyCell!682) )
))
(declare-datatypes ((array!2839 0))(
  ( (array!2840 (arr!1363 (Array (_ BitVec 32) ValueCell!682)) (size!1542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!344 0))(
  ( (LongMapFixedSize!345 (defaultEntry!1865 Int) (mask!5392 (_ BitVec 32)) (extraKeys!1756 (_ BitVec 32)) (zeroValue!1783 V!2265) (minValue!1783 V!2265) (_size!221 (_ BitVec 32)) (_keys!3407 array!2837) (_values!1848 array!2839) (_vacant!221 (_ BitVec 32))) )
))
(declare-fun map!805 (LongMapFixedSize!344) ListLongMap!1159)

(assert (=> b!42687 (= lt!17982 (map!805 (LongMapFixedSize!345 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17987 lt!17987 #b00000000000000000000000000000000 lt!17983 (array!2840 ((as const (Array (_ BitVec 32) ValueCell!682)) EmptyCell!682) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1158 0))(
  ( (Nil!1155) (Cons!1154 (h!1731 (_ BitVec 64)) (t!4122 List!1158)) )
))
(declare-fun arrayNoDuplicates!0 (array!2837 (_ BitVec 32) List!1158) Bool)

(assert (=> b!42687 (arrayNoDuplicates!0 lt!17983 #b00000000000000000000000000000000 Nil!1155)))

(declare-datatypes ((Unit!1172 0))(
  ( (Unit!1173) )
))
(declare-fun lt!17986 () Unit!1172)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2837 (_ BitVec 32) (_ BitVec 32) List!1158) Unit!1172)

(assert (=> b!42687 (= lt!17986 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17983 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2837 (_ BitVec 32)) Bool)

(assert (=> b!42687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17983 mask!853)))

(declare-fun lt!17985 () Unit!1172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2837 (_ BitVec 32) (_ BitVec 32)) Unit!1172)

(assert (=> b!42687 (= lt!17985 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17983 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2837 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42687 (= (arrayCountValidKeys!0 lt!17983 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17984 () Unit!1172)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2837 (_ BitVec 32) (_ BitVec 32)) Unit!1172)

(assert (=> b!42687 (= lt!17984 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17983 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42687 (= lt!17983 (array!2838 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!242 (Int (_ BitVec 64)) V!2265)

(assert (=> b!42687 (= lt!17987 (dynLambda!242 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6374 res!25399) b!42687))

(declare-fun b_lambda!2209 () Bool)

(assert (=> (not b_lambda!2209) (not b!42687)))

(declare-fun t!4120 () Bool)

(declare-fun tb!951 () Bool)

(assert (=> (and start!6374 (= defaultEntry!470 defaultEntry!470) t!4120) tb!951))

(declare-fun result!1653 () Bool)

(declare-fun tp_is_empty!1859 () Bool)

(assert (=> tb!951 (= result!1653 tp_is_empty!1859)))

(assert (=> b!42687 t!4120))

(declare-fun b_and!2591 () Bool)

(assert (= b_and!2589 (and (=> t!4120 result!1653) b_and!2591)))

(declare-fun m!36419 () Bool)

(assert (=> start!6374 m!36419))

(declare-fun m!36421 () Bool)

(assert (=> b!42687 m!36421))

(declare-fun m!36423 () Bool)

(assert (=> b!42687 m!36423))

(declare-fun m!36425 () Bool)

(assert (=> b!42687 m!36425))

(declare-fun m!36427 () Bool)

(assert (=> b!42687 m!36427))

(declare-fun m!36429 () Bool)

(assert (=> b!42687 m!36429))

(declare-fun m!36431 () Bool)

(assert (=> b!42687 m!36431))

(declare-fun m!36433 () Bool)

(assert (=> b!42687 m!36433))

(declare-fun m!36435 () Bool)

(assert (=> b!42687 m!36435))

(push 1)

(assert b_and!2591)

(assert (not b_lambda!2209))

(assert (not b!42687))

(assert (not start!6374))

(assert (not b_next!1469))

(assert tp_is_empty!1859)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2591)

(assert (not b_next!1469))

(check-sat)

(pop 1)

