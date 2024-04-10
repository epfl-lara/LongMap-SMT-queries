; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5940 () Bool)

(assert start!5940)

(declare-fun b_free!1419 () Bool)

(declare-fun b_next!1419 () Bool)

(assert (=> start!5940 (= b_free!1419 (not b_next!1419))))

(declare-fun tp!5816 () Bool)

(declare-fun b_and!2487 () Bool)

(assert (=> start!5940 (= tp!5816 b_and!2487)))

(declare-fun b!41685 () Bool)

(declare-fun e!26350 () Bool)

(assert (=> b!41685 (= e!26350 true)))

(declare-datatypes ((V!2171 0))(
  ( (V!2172 (val!943 Int)) )
))
(declare-fun lt!16786 () V!2171)

(declare-datatypes ((ValueCell!657 0))(
  ( (ValueCellFull!657 (v!2027 V!2171)) (EmptyCell!657) )
))
(declare-datatypes ((array!2703 0))(
  ( (array!2704 (arr!1295 (Array (_ BitVec 32) ValueCell!657)) (size!1447 (_ BitVec 32))) )
))
(declare-fun lt!16781 () array!2703)

(declare-datatypes ((tuple2!1540 0))(
  ( (tuple2!1541 (_1!781 (_ BitVec 64)) (_2!781 V!2171)) )
))
(declare-datatypes ((List!1108 0))(
  ( (Nil!1105) (Cons!1104 (h!1681 tuple2!1540) (t!4023 List!1108)) )
))
(declare-datatypes ((ListLongMap!1117 0))(
  ( (ListLongMap!1118 (toList!574 List!1108)) )
))
(declare-fun lt!16783 () ListLongMap!1117)

(declare-fun lt!16785 () Bool)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2705 0))(
  ( (array!2706 (arr!1296 (Array (_ BitVec 32) (_ BitVec 64))) (size!1448 (_ BitVec 32))) )
))
(declare-fun lt!16780 () array!2705)

(declare-fun contains!542 (ListLongMap!1117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!335 (array!2705 array!2703 (_ BitVec 32) (_ BitVec 32) V!2171 V!2171 (_ BitVec 32) Int) ListLongMap!1117)

(declare-fun head!873 (List!1108) tuple2!1540)

(assert (=> b!41685 (= lt!16785 (contains!542 (getCurrentListMap!335 lt!16780 lt!16781 mask!853 #b00000000000000000000000000000000 lt!16786 lt!16786 #b00000000000000000000000000000000 defaultEntry!470) (_1!781 (head!873 (toList!574 lt!16783)))))))

(declare-fun b!41682 () Bool)

(declare-fun e!26349 () Bool)

(assert (=> b!41682 (= e!26349 (not e!26350))))

(declare-fun res!24823 () Bool)

(assert (=> b!41682 (=> res!24823 e!26350)))

(assert (=> b!41682 (= res!24823 (= lt!16783 (ListLongMap!1118 Nil!1105)))))

(declare-datatypes ((LongMapFixedSize!294 0))(
  ( (LongMapFixedSize!295 (defaultEntry!1837 Int) (mask!5252 (_ BitVec 32)) (extraKeys!1728 (_ BitVec 32)) (zeroValue!1755 V!2171) (minValue!1755 V!2171) (_size!196 (_ BitVec 32)) (_keys!3344 array!2705) (_values!1820 array!2703) (_vacant!196 (_ BitVec 32))) )
))
(declare-fun map!735 (LongMapFixedSize!294) ListLongMap!1117)

(assert (=> b!41682 (= lt!16783 (map!735 (LongMapFixedSize!295 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16786 lt!16786 #b00000000000000000000000000000000 lt!16780 lt!16781 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1109 0))(
  ( (Nil!1106) (Cons!1105 (h!1682 (_ BitVec 64)) (t!4024 List!1109)) )
))
(declare-fun arrayNoDuplicates!0 (array!2705 (_ BitVec 32) List!1109) Bool)

(assert (=> b!41682 (arrayNoDuplicates!0 lt!16780 #b00000000000000000000000000000000 Nil!1106)))

(declare-datatypes ((Unit!1049 0))(
  ( (Unit!1050) )
))
(declare-fun lt!16787 () Unit!1049)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2705 (_ BitVec 32) (_ BitVec 32) List!1109) Unit!1049)

(assert (=> b!41682 (= lt!16787 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16780 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2705 (_ BitVec 32)) Bool)

(assert (=> b!41682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16780 mask!853)))

(declare-fun lt!16784 () Unit!1049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2705 (_ BitVec 32) (_ BitVec 32)) Unit!1049)

(assert (=> b!41682 (= lt!16784 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16780 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41682 (= (arrayCountValidKeys!0 lt!16780 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16782 () Unit!1049)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2705 (_ BitVec 32) (_ BitVec 32)) Unit!1049)

(assert (=> b!41682 (= lt!16782 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16780 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41682 (= lt!16781 (array!2704 ((as const (Array (_ BitVec 32) ValueCell!657)) EmptyCell!657) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41682 (= lt!16780 (array!2706 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!218 (Int (_ BitVec 64)) V!2171)

(assert (=> b!41682 (= lt!16786 (dynLambda!218 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41683 () Bool)

(declare-fun res!24824 () Bool)

(assert (=> b!41683 (=> res!24824 e!26350)))

(declare-fun isEmpty!260 (List!1108) Bool)

(assert (=> b!41683 (= res!24824 (isEmpty!260 (toList!574 lt!16783)))))

(declare-fun res!24822 () Bool)

(assert (=> start!5940 (=> (not res!24822) (not e!26349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5940 (= res!24822 (validMask!0 mask!853))))

(assert (=> start!5940 e!26349))

(assert (=> start!5940 true))

(assert (=> start!5940 tp!5816))

(declare-fun b!41684 () Bool)

(declare-fun res!24825 () Bool)

(assert (=> b!41684 (=> res!24825 e!26350)))

(assert (=> b!41684 (= res!24825 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5940 res!24822) b!41682))

(assert (= (and b!41682 (not res!24823)) b!41683))

(assert (= (and b!41683 (not res!24824)) b!41684))

(assert (= (and b!41684 (not res!24825)) b!41685))

(declare-fun b_lambda!2143 () Bool)

(assert (=> (not b_lambda!2143) (not b!41682)))

(declare-fun t!4022 () Bool)

(declare-fun tb!901 () Bool)

(assert (=> (and start!5940 (= defaultEntry!470 defaultEntry!470) t!4022) tb!901))

(declare-fun result!1553 () Bool)

(declare-fun tp_is_empty!1809 () Bool)

(assert (=> tb!901 (= result!1553 tp_is_empty!1809)))

(assert (=> b!41682 t!4022))

(declare-fun b_and!2489 () Bool)

(assert (= b_and!2487 (and (=> t!4022 result!1553) b_and!2489)))

(declare-fun m!35157 () Bool)

(assert (=> b!41685 m!35157))

(declare-fun m!35159 () Bool)

(assert (=> b!41685 m!35159))

(assert (=> b!41685 m!35157))

(declare-fun m!35161 () Bool)

(assert (=> b!41685 m!35161))

(declare-fun m!35163 () Bool)

(assert (=> b!41682 m!35163))

(declare-fun m!35165 () Bool)

(assert (=> b!41682 m!35165))

(declare-fun m!35167 () Bool)

(assert (=> b!41682 m!35167))

(declare-fun m!35169 () Bool)

(assert (=> b!41682 m!35169))

(declare-fun m!35171 () Bool)

(assert (=> b!41682 m!35171))

(declare-fun m!35173 () Bool)

(assert (=> b!41682 m!35173))

(declare-fun m!35175 () Bool)

(assert (=> b!41682 m!35175))

(declare-fun m!35177 () Bool)

(assert (=> b!41682 m!35177))

(declare-fun m!35179 () Bool)

(assert (=> b!41683 m!35179))

(declare-fun m!35181 () Bool)

(assert (=> start!5940 m!35181))

(check-sat (not b!41685) (not b_next!1419) (not b_lambda!2143) b_and!2489 tp_is_empty!1809 (not start!5940) (not b!41683) (not b!41682))
