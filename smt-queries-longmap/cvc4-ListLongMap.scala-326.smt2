; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5942 () Bool)

(assert start!5942)

(declare-fun b_free!1421 () Bool)

(declare-fun b_next!1421 () Bool)

(assert (=> start!5942 (= b_free!1421 (not b_next!1421))))

(declare-fun tp!5819 () Bool)

(declare-fun b_and!2491 () Bool)

(assert (=> start!5942 (= tp!5819 b_and!2491)))

(declare-fun b!41697 () Bool)

(declare-fun res!24837 () Bool)

(declare-fun e!26356 () Bool)

(assert (=> b!41697 (=> res!24837 e!26356)))

(declare-datatypes ((V!2173 0))(
  ( (V!2174 (val!944 Int)) )
))
(declare-datatypes ((tuple2!1542 0))(
  ( (tuple2!1543 (_1!782 (_ BitVec 64)) (_2!782 V!2173)) )
))
(declare-datatypes ((List!1110 0))(
  ( (Nil!1107) (Cons!1106 (h!1683 tuple2!1542) (t!4027 List!1110)) )
))
(declare-datatypes ((ListLongMap!1119 0))(
  ( (ListLongMap!1120 (toList!575 List!1110)) )
))
(declare-fun lt!16805 () ListLongMap!1119)

(declare-fun isEmpty!261 (List!1110) Bool)

(assert (=> b!41697 (= res!24837 (isEmpty!261 (toList!575 lt!16805)))))

(declare-fun b!41699 () Bool)

(assert (=> b!41699 (= e!26356 true)))

(declare-fun lt!16808 () Bool)

(declare-datatypes ((ValueCell!658 0))(
  ( (ValueCellFull!658 (v!2028 V!2173)) (EmptyCell!658) )
))
(declare-datatypes ((array!2707 0))(
  ( (array!2708 (arr!1297 (Array (_ BitVec 32) ValueCell!658)) (size!1449 (_ BitVec 32))) )
))
(declare-fun lt!16809 () array!2707)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((array!2709 0))(
  ( (array!2710 (arr!1298 (Array (_ BitVec 32) (_ BitVec 64))) (size!1450 (_ BitVec 32))) )
))
(declare-fun lt!16806 () array!2709)

(declare-fun lt!16811 () V!2173)

(declare-fun defaultEntry!470 () Int)

(declare-fun contains!543 (ListLongMap!1119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!336 (array!2709 array!2707 (_ BitVec 32) (_ BitVec 32) V!2173 V!2173 (_ BitVec 32) Int) ListLongMap!1119)

(declare-fun head!874 (List!1110) tuple2!1542)

(assert (=> b!41699 (= lt!16808 (contains!543 (getCurrentListMap!336 lt!16806 lt!16809 mask!853 #b00000000000000000000000000000000 lt!16811 lt!16811 #b00000000000000000000000000000000 defaultEntry!470) (_1!782 (head!874 (toList!575 lt!16805)))))))

(declare-fun res!24834 () Bool)

(declare-fun e!26355 () Bool)

(assert (=> start!5942 (=> (not res!24834) (not e!26355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5942 (= res!24834 (validMask!0 mask!853))))

(assert (=> start!5942 e!26355))

(assert (=> start!5942 true))

(assert (=> start!5942 tp!5819))

(declare-fun b!41698 () Bool)

(declare-fun res!24835 () Bool)

(assert (=> b!41698 (=> res!24835 e!26356)))

(assert (=> b!41698 (= res!24835 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41696 () Bool)

(assert (=> b!41696 (= e!26355 (not e!26356))))

(declare-fun res!24836 () Bool)

(assert (=> b!41696 (=> res!24836 e!26356)))

(assert (=> b!41696 (= res!24836 (= lt!16805 (ListLongMap!1120 Nil!1107)))))

(declare-datatypes ((LongMapFixedSize!296 0))(
  ( (LongMapFixedSize!297 (defaultEntry!1838 Int) (mask!5253 (_ BitVec 32)) (extraKeys!1729 (_ BitVec 32)) (zeroValue!1756 V!2173) (minValue!1756 V!2173) (_size!197 (_ BitVec 32)) (_keys!3345 array!2709) (_values!1821 array!2707) (_vacant!197 (_ BitVec 32))) )
))
(declare-fun map!736 (LongMapFixedSize!296) ListLongMap!1119)

(assert (=> b!41696 (= lt!16805 (map!736 (LongMapFixedSize!297 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16811 lt!16811 #b00000000000000000000000000000000 lt!16806 lt!16809 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1111 0))(
  ( (Nil!1108) (Cons!1107 (h!1684 (_ BitVec 64)) (t!4028 List!1111)) )
))
(declare-fun arrayNoDuplicates!0 (array!2709 (_ BitVec 32) List!1111) Bool)

(assert (=> b!41696 (arrayNoDuplicates!0 lt!16806 #b00000000000000000000000000000000 Nil!1108)))

(declare-datatypes ((Unit!1051 0))(
  ( (Unit!1052) )
))
(declare-fun lt!16807 () Unit!1051)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2709 (_ BitVec 32) (_ BitVec 32) List!1111) Unit!1051)

(assert (=> b!41696 (= lt!16807 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16806 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2709 (_ BitVec 32)) Bool)

(assert (=> b!41696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16806 mask!853)))

(declare-fun lt!16804 () Unit!1051)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2709 (_ BitVec 32) (_ BitVec 32)) Unit!1051)

(assert (=> b!41696 (= lt!16804 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16806 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41696 (= (arrayCountValidKeys!0 lt!16806 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16810 () Unit!1051)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2709 (_ BitVec 32) (_ BitVec 32)) Unit!1051)

(assert (=> b!41696 (= lt!16810 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16806 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41696 (= lt!16809 (array!2708 ((as const (Array (_ BitVec 32) ValueCell!658)) EmptyCell!658) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41696 (= lt!16806 (array!2710 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!219 (Int (_ BitVec 64)) V!2173)

(assert (=> b!41696 (= lt!16811 (dynLambda!219 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5942 res!24834) b!41696))

(assert (= (and b!41696 (not res!24836)) b!41697))

(assert (= (and b!41697 (not res!24837)) b!41698))

(assert (= (and b!41698 (not res!24835)) b!41699))

(declare-fun b_lambda!2145 () Bool)

(assert (=> (not b_lambda!2145) (not b!41696)))

(declare-fun t!4026 () Bool)

(declare-fun tb!903 () Bool)

(assert (=> (and start!5942 (= defaultEntry!470 defaultEntry!470) t!4026) tb!903))

(declare-fun result!1557 () Bool)

(declare-fun tp_is_empty!1811 () Bool)

(assert (=> tb!903 (= result!1557 tp_is_empty!1811)))

(assert (=> b!41696 t!4026))

(declare-fun b_and!2493 () Bool)

(assert (= b_and!2491 (and (=> t!4026 result!1557) b_and!2493)))

(declare-fun m!35183 () Bool)

(assert (=> b!41697 m!35183))

(declare-fun m!35185 () Bool)

(assert (=> b!41699 m!35185))

(declare-fun m!35187 () Bool)

(assert (=> b!41699 m!35187))

(assert (=> b!41699 m!35185))

(declare-fun m!35189 () Bool)

(assert (=> b!41699 m!35189))

(declare-fun m!35191 () Bool)

(assert (=> start!5942 m!35191))

(declare-fun m!35193 () Bool)

(assert (=> b!41696 m!35193))

(declare-fun m!35195 () Bool)

(assert (=> b!41696 m!35195))

(declare-fun m!35197 () Bool)

(assert (=> b!41696 m!35197))

(declare-fun m!35199 () Bool)

(assert (=> b!41696 m!35199))

(declare-fun m!35201 () Bool)

(assert (=> b!41696 m!35201))

(declare-fun m!35203 () Bool)

(assert (=> b!41696 m!35203))

(declare-fun m!35205 () Bool)

(assert (=> b!41696 m!35205))

(declare-fun m!35207 () Bool)

(assert (=> b!41696 m!35207))

(push 1)

(assert (not b!41696))

(assert tp_is_empty!1811)

(assert (not b_next!1421))

(assert b_and!2493)

(assert (not b!41697))

(assert (not start!5942))

(assert (not b!41699))

(assert (not b_lambda!2145))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2493)

(assert (not b_next!1421))

(check-sat)

(pop 1)

