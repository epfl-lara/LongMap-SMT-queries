; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5930 () Bool)

(assert start!5930)

(declare-fun b_free!1409 () Bool)

(declare-fun b_next!1409 () Bool)

(assert (=> start!5930 (= b_free!1409 (not b_next!1409))))

(declare-fun tp!5801 () Bool)

(declare-fun b_and!2467 () Bool)

(assert (=> start!5930 (= tp!5801 b_and!2467)))

(declare-fun b!41615 () Bool)

(declare-fun e!26320 () Bool)

(assert (=> b!41615 (= e!26320 true)))

(declare-datatypes ((V!2157 0))(
  ( (V!2158 (val!938 Int)) )
))
(declare-datatypes ((ValueCell!652 0))(
  ( (ValueCellFull!652 (v!2022 V!2157)) (EmptyCell!652) )
))
(declare-datatypes ((array!2683 0))(
  ( (array!2684 (arr!1285 (Array (_ BitVec 32) ValueCell!652)) (size!1437 (_ BitVec 32))) )
))
(declare-fun lt!16660 () array!2683)

(declare-fun lt!16665 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2685 0))(
  ( (array!2686 (arr!1286 (Array (_ BitVec 32) (_ BitVec 64))) (size!1438 (_ BitVec 32))) )
))
(declare-fun lt!16662 () array!2685)

(declare-datatypes ((tuple2!1530 0))(
  ( (tuple2!1531 (_1!776 (_ BitVec 64)) (_2!776 V!2157)) )
))
(declare-datatypes ((List!1098 0))(
  ( (Nil!1095) (Cons!1094 (h!1671 tuple2!1530) (t!4003 List!1098)) )
))
(declare-datatypes ((ListLongMap!1107 0))(
  ( (ListLongMap!1108 (toList!569 List!1098)) )
))
(declare-fun lt!16666 () ListLongMap!1107)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lt!16664 () V!2157)

(declare-fun contains!537 (ListLongMap!1107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!330 (array!2685 array!2683 (_ BitVec 32) (_ BitVec 32) V!2157 V!2157 (_ BitVec 32) Int) ListLongMap!1107)

(declare-fun head!868 (List!1098) tuple2!1530)

(assert (=> b!41615 (= lt!16665 (contains!537 (getCurrentListMap!330 lt!16662 lt!16660 mask!853 #b00000000000000000000000000000000 lt!16664 lt!16664 #b00000000000000000000000000000000 defaultEntry!470) (_1!776 (head!868 (toList!569 lt!16666)))))))

(declare-fun b!41614 () Bool)

(declare-fun res!24764 () Bool)

(assert (=> b!41614 (=> res!24764 e!26320)))

(assert (=> b!41614 (= res!24764 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41613 () Bool)

(declare-fun res!24763 () Bool)

(assert (=> b!41613 (=> res!24763 e!26320)))

(declare-fun isEmpty!255 (List!1098) Bool)

(assert (=> b!41613 (= res!24763 (isEmpty!255 (toList!569 lt!16666)))))

(declare-fun res!24762 () Bool)

(declare-fun e!26319 () Bool)

(assert (=> start!5930 (=> (not res!24762) (not e!26319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5930 (= res!24762 (validMask!0 mask!853))))

(assert (=> start!5930 e!26319))

(assert (=> start!5930 true))

(assert (=> start!5930 tp!5801))

(declare-fun b!41612 () Bool)

(assert (=> b!41612 (= e!26319 (not e!26320))))

(declare-fun res!24765 () Bool)

(assert (=> b!41612 (=> res!24765 e!26320)))

(assert (=> b!41612 (= res!24765 (= lt!16666 (ListLongMap!1108 Nil!1095)))))

(declare-datatypes ((LongMapFixedSize!284 0))(
  ( (LongMapFixedSize!285 (defaultEntry!1832 Int) (mask!5243 (_ BitVec 32)) (extraKeys!1723 (_ BitVec 32)) (zeroValue!1750 V!2157) (minValue!1750 V!2157) (_size!191 (_ BitVec 32)) (_keys!3339 array!2685) (_values!1815 array!2683) (_vacant!191 (_ BitVec 32))) )
))
(declare-fun map!726 (LongMapFixedSize!284) ListLongMap!1107)

(assert (=> b!41612 (= lt!16666 (map!726 (LongMapFixedSize!285 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16664 lt!16664 #b00000000000000000000000000000000 lt!16662 lt!16660 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1099 0))(
  ( (Nil!1096) (Cons!1095 (h!1672 (_ BitVec 64)) (t!4004 List!1099)) )
))
(declare-fun arrayNoDuplicates!0 (array!2685 (_ BitVec 32) List!1099) Bool)

(assert (=> b!41612 (arrayNoDuplicates!0 lt!16662 #b00000000000000000000000000000000 Nil!1096)))

(declare-datatypes ((Unit!1039 0))(
  ( (Unit!1040) )
))
(declare-fun lt!16661 () Unit!1039)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2685 (_ BitVec 32) (_ BitVec 32) List!1099) Unit!1039)

(assert (=> b!41612 (= lt!16661 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16662 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2685 (_ BitVec 32)) Bool)

(assert (=> b!41612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16662 mask!853)))

(declare-fun lt!16667 () Unit!1039)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2685 (_ BitVec 32) (_ BitVec 32)) Unit!1039)

(assert (=> b!41612 (= lt!16667 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16662 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41612 (= (arrayCountValidKeys!0 lt!16662 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16663 () Unit!1039)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2685 (_ BitVec 32) (_ BitVec 32)) Unit!1039)

(assert (=> b!41612 (= lt!16663 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16662 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41612 (= lt!16660 (array!2684 ((as const (Array (_ BitVec 32) ValueCell!652)) EmptyCell!652) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41612 (= lt!16662 (array!2686 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!213 (Int (_ BitVec 64)) V!2157)

(assert (=> b!41612 (= lt!16664 (dynLambda!213 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5930 res!24762) b!41612))

(assert (= (and b!41612 (not res!24765)) b!41613))

(assert (= (and b!41613 (not res!24763)) b!41614))

(assert (= (and b!41614 (not res!24764)) b!41615))

(declare-fun b_lambda!2133 () Bool)

(assert (=> (not b_lambda!2133) (not b!41612)))

(declare-fun t!4002 () Bool)

(declare-fun tb!891 () Bool)

(assert (=> (and start!5930 (= defaultEntry!470 defaultEntry!470) t!4002) tb!891))

(declare-fun result!1533 () Bool)

(declare-fun tp_is_empty!1799 () Bool)

(assert (=> tb!891 (= result!1533 tp_is_empty!1799)))

(assert (=> b!41612 t!4002))

(declare-fun b_and!2469 () Bool)

(assert (= b_and!2467 (and (=> t!4002 result!1533) b_and!2469)))

(declare-fun m!35027 () Bool)

(assert (=> b!41615 m!35027))

(declare-fun m!35029 () Bool)

(assert (=> b!41615 m!35029))

(assert (=> b!41615 m!35027))

(declare-fun m!35031 () Bool)

(assert (=> b!41615 m!35031))

(declare-fun m!35033 () Bool)

(assert (=> b!41613 m!35033))

(declare-fun m!35035 () Bool)

(assert (=> start!5930 m!35035))

(declare-fun m!35037 () Bool)

(assert (=> b!41612 m!35037))

(declare-fun m!35039 () Bool)

(assert (=> b!41612 m!35039))

(declare-fun m!35041 () Bool)

(assert (=> b!41612 m!35041))

(declare-fun m!35043 () Bool)

(assert (=> b!41612 m!35043))

(declare-fun m!35045 () Bool)

(assert (=> b!41612 m!35045))

(declare-fun m!35047 () Bool)

(assert (=> b!41612 m!35047))

(declare-fun m!35049 () Bool)

(assert (=> b!41612 m!35049))

(declare-fun m!35051 () Bool)

(assert (=> b!41612 m!35051))

(push 1)

(assert (not b_next!1409))

(assert b_and!2469)

(assert (not b_lambda!2133))

(assert (not b!41612))

(assert (not b!41615))

(assert tp_is_empty!1799)

(assert (not start!5930))

(assert (not b!41613))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2469)

(assert (not b_next!1409))

