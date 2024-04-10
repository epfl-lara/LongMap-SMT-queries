; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5932 () Bool)

(assert start!5932)

(declare-fun b_free!1411 () Bool)

(declare-fun b_next!1411 () Bool)

(assert (=> start!5932 (= b_free!1411 (not b_next!1411))))

(declare-fun tp!5804 () Bool)

(declare-fun b_and!2471 () Bool)

(assert (=> start!5932 (= tp!5804 b_and!2471)))

(declare-fun res!24775 () Bool)

(declare-fun e!26325 () Bool)

(assert (=> start!5932 (=> (not res!24775) (not e!26325))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5932 (= res!24775 (validMask!0 mask!853))))

(assert (=> start!5932 e!26325))

(assert (=> start!5932 true))

(assert (=> start!5932 tp!5804))

(declare-fun b!41629 () Bool)

(declare-fun e!26326 () Bool)

(assert (=> b!41629 (= e!26326 true)))

(declare-datatypes ((V!2161 0))(
  ( (V!2162 (val!939 Int)) )
))
(declare-fun lt!16687 () V!2161)

(declare-datatypes ((ValueCell!653 0))(
  ( (ValueCellFull!653 (v!2023 V!2161)) (EmptyCell!653) )
))
(declare-datatypes ((array!2687 0))(
  ( (array!2688 (arr!1287 (Array (_ BitVec 32) ValueCell!653)) (size!1439 (_ BitVec 32))) )
))
(declare-fun lt!16684 () array!2687)

(declare-fun lt!16689 () Bool)

(declare-datatypes ((tuple2!1532 0))(
  ( (tuple2!1533 (_1!777 (_ BitVec 64)) (_2!777 V!2161)) )
))
(declare-datatypes ((List!1100 0))(
  ( (Nil!1097) (Cons!1096 (h!1673 tuple2!1532) (t!4007 List!1100)) )
))
(declare-datatypes ((ListLongMap!1109 0))(
  ( (ListLongMap!1110 (toList!570 List!1100)) )
))
(declare-fun lt!16688 () ListLongMap!1109)

(declare-datatypes ((array!2689 0))(
  ( (array!2690 (arr!1288 (Array (_ BitVec 32) (_ BitVec 64))) (size!1440 (_ BitVec 32))) )
))
(declare-fun lt!16685 () array!2689)

(declare-fun defaultEntry!470 () Int)

(declare-fun contains!538 (ListLongMap!1109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!331 (array!2689 array!2687 (_ BitVec 32) (_ BitVec 32) V!2161 V!2161 (_ BitVec 32) Int) ListLongMap!1109)

(declare-fun head!869 (List!1100) tuple2!1532)

(assert (=> b!41629 (= lt!16689 (contains!538 (getCurrentListMap!331 lt!16685 lt!16684 mask!853 #b00000000000000000000000000000000 lt!16687 lt!16687 #b00000000000000000000000000000000 defaultEntry!470) (_1!777 (head!869 (toList!570 lt!16688)))))))

(declare-fun b!41627 () Bool)

(declare-fun res!24777 () Bool)

(assert (=> b!41627 (=> res!24777 e!26326)))

(declare-fun isEmpty!256 (List!1100) Bool)

(assert (=> b!41627 (= res!24777 (isEmpty!256 (toList!570 lt!16688)))))

(declare-fun b!41626 () Bool)

(assert (=> b!41626 (= e!26325 (not e!26326))))

(declare-fun res!24774 () Bool)

(assert (=> b!41626 (=> res!24774 e!26326)))

(assert (=> b!41626 (= res!24774 (= lt!16688 (ListLongMap!1110 Nil!1097)))))

(declare-datatypes ((LongMapFixedSize!286 0))(
  ( (LongMapFixedSize!287 (defaultEntry!1833 Int) (mask!5246 (_ BitVec 32)) (extraKeys!1724 (_ BitVec 32)) (zeroValue!1751 V!2161) (minValue!1751 V!2161) (_size!192 (_ BitVec 32)) (_keys!3340 array!2689) (_values!1816 array!2687) (_vacant!192 (_ BitVec 32))) )
))
(declare-fun map!729 (LongMapFixedSize!286) ListLongMap!1109)

(assert (=> b!41626 (= lt!16688 (map!729 (LongMapFixedSize!287 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16687 lt!16687 #b00000000000000000000000000000000 lt!16685 lt!16684 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1101 0))(
  ( (Nil!1098) (Cons!1097 (h!1674 (_ BitVec 64)) (t!4008 List!1101)) )
))
(declare-fun arrayNoDuplicates!0 (array!2689 (_ BitVec 32) List!1101) Bool)

(assert (=> b!41626 (arrayNoDuplicates!0 lt!16685 #b00000000000000000000000000000000 Nil!1098)))

(declare-datatypes ((Unit!1041 0))(
  ( (Unit!1042) )
))
(declare-fun lt!16686 () Unit!1041)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2689 (_ BitVec 32) (_ BitVec 32) List!1101) Unit!1041)

(assert (=> b!41626 (= lt!16686 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16685 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2689 (_ BitVec 32)) Bool)

(assert (=> b!41626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16685 mask!853)))

(declare-fun lt!16691 () Unit!1041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2689 (_ BitVec 32) (_ BitVec 32)) Unit!1041)

(assert (=> b!41626 (= lt!16691 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16685 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2689 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41626 (= (arrayCountValidKeys!0 lt!16685 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16690 () Unit!1041)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2689 (_ BitVec 32) (_ BitVec 32)) Unit!1041)

(assert (=> b!41626 (= lt!16690 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16685 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41626 (= lt!16684 (array!2688 ((as const (Array (_ BitVec 32) ValueCell!653)) EmptyCell!653) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41626 (= lt!16685 (array!2690 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!214 (Int (_ BitVec 64)) V!2161)

(assert (=> b!41626 (= lt!16687 (dynLambda!214 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41628 () Bool)

(declare-fun res!24776 () Bool)

(assert (=> b!41628 (=> res!24776 e!26326)))

(assert (=> b!41628 (= res!24776 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5932 res!24775) b!41626))

(assert (= (and b!41626 (not res!24774)) b!41627))

(assert (= (and b!41627 (not res!24777)) b!41628))

(assert (= (and b!41628 (not res!24776)) b!41629))

(declare-fun b_lambda!2135 () Bool)

(assert (=> (not b_lambda!2135) (not b!41626)))

(declare-fun t!4006 () Bool)

(declare-fun tb!893 () Bool)

(assert (=> (and start!5932 (= defaultEntry!470 defaultEntry!470) t!4006) tb!893))

(declare-fun result!1537 () Bool)

(declare-fun tp_is_empty!1801 () Bool)

(assert (=> tb!893 (= result!1537 tp_is_empty!1801)))

(assert (=> b!41626 t!4006))

(declare-fun b_and!2473 () Bool)

(assert (= b_and!2471 (and (=> t!4006 result!1537) b_and!2473)))

(declare-fun m!35053 () Bool)

(assert (=> start!5932 m!35053))

(declare-fun m!35055 () Bool)

(assert (=> b!41629 m!35055))

(declare-fun m!35057 () Bool)

(assert (=> b!41629 m!35057))

(assert (=> b!41629 m!35055))

(declare-fun m!35059 () Bool)

(assert (=> b!41629 m!35059))

(declare-fun m!35061 () Bool)

(assert (=> b!41627 m!35061))

(declare-fun m!35063 () Bool)

(assert (=> b!41626 m!35063))

(declare-fun m!35065 () Bool)

(assert (=> b!41626 m!35065))

(declare-fun m!35067 () Bool)

(assert (=> b!41626 m!35067))

(declare-fun m!35069 () Bool)

(assert (=> b!41626 m!35069))

(declare-fun m!35071 () Bool)

(assert (=> b!41626 m!35071))

(declare-fun m!35073 () Bool)

(assert (=> b!41626 m!35073))

(declare-fun m!35075 () Bool)

(assert (=> b!41626 m!35075))

(declare-fun m!35077 () Bool)

(assert (=> b!41626 m!35077))

(push 1)

(assert (not b!41627))

(assert (not start!5932))

(assert tp_is_empty!1801)

(assert (not b_lambda!2135))

(assert b_and!2473)

(assert (not b!41626))

(assert (not b_next!1411))

(assert (not b!41629))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2473)

(assert (not b_next!1411))

(check-sat)

(pop 1)

