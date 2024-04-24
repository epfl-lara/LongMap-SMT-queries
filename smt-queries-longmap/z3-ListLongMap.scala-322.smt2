; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5918 () Bool)

(assert start!5918)

(declare-fun b_free!1393 () Bool)

(declare-fun b_next!1393 () Bool)

(assert (=> start!5918 (= b_free!1393 (not b_next!1393))))

(declare-fun tp!5777 () Bool)

(declare-fun b_and!2433 () Bool)

(assert (=> start!5918 (= tp!5777 b_and!2433)))

(declare-fun b!41444 () Bool)

(declare-fun res!24643 () Bool)

(declare-fun e!26234 () Bool)

(assert (=> b!41444 (=> res!24643 e!26234)))

(declare-datatypes ((V!2137 0))(
  ( (V!2138 (val!930 Int)) )
))
(declare-datatypes ((tuple2!1496 0))(
  ( (tuple2!1497 (_1!759 (_ BitVec 64)) (_2!759 V!2137)) )
))
(declare-datatypes ((List!1068 0))(
  ( (Nil!1065) (Cons!1064 (h!1641 tuple2!1496) (t!3957 List!1068)) )
))
(declare-datatypes ((ListLongMap!1067 0))(
  ( (ListLongMap!1068 (toList!549 List!1068)) )
))
(declare-fun lt!16429 () ListLongMap!1067)

(declare-fun isEmpty!251 (List!1068) Bool)

(assert (=> b!41444 (= res!24643 (isEmpty!251 (toList!549 lt!16429)))))

(declare-fun b!41446 () Bool)

(assert (=> b!41446 (= e!26234 true)))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16427 () V!2137)

(declare-datatypes ((array!2637 0))(
  ( (array!2638 (arr!1262 (Array (_ BitVec 32) (_ BitVec 64))) (size!1414 (_ BitVec 32))) )
))
(declare-fun lt!16425 () array!2637)

(declare-datatypes ((ValueCell!644 0))(
  ( (ValueCellFull!644 (v!2015 V!2137)) (EmptyCell!644) )
))
(declare-datatypes ((array!2639 0))(
  ( (array!2640 (arr!1263 (Array (_ BitVec 32) ValueCell!644)) (size!1415 (_ BitVec 32))) )
))
(declare-fun lt!16430 () array!2639)

(declare-fun lt!16431 () Bool)

(declare-fun contains!520 (ListLongMap!1067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!306 (array!2637 array!2639 (_ BitVec 32) (_ BitVec 32) V!2137 V!2137 (_ BitVec 32) Int) ListLongMap!1067)

(declare-fun head!858 (List!1068) tuple2!1496)

(assert (=> b!41446 (= lt!16431 (contains!520 (getCurrentListMap!306 lt!16425 lt!16430 mask!853 #b00000000000000000000000000000000 lt!16427 lt!16427 #b00000000000000000000000000000000 defaultEntry!470) (_1!759 (head!858 (toList!549 lt!16429)))))))

(declare-fun b!41443 () Bool)

(declare-fun e!26235 () Bool)

(assert (=> b!41443 (= e!26235 (not e!26234))))

(declare-fun res!24644 () Bool)

(assert (=> b!41443 (=> res!24644 e!26234)))

(assert (=> b!41443 (= res!24644 (= lt!16429 (ListLongMap!1068 Nil!1065)))))

(declare-datatypes ((LongMapFixedSize!268 0))(
  ( (LongMapFixedSize!269 (defaultEntry!1824 Int) (mask!5231 (_ BitVec 32)) (extraKeys!1715 (_ BitVec 32)) (zeroValue!1742 V!2137) (minValue!1742 V!2137) (_size!183 (_ BitVec 32)) (_keys!3331 array!2637) (_values!1807 array!2639) (_vacant!183 (_ BitVec 32))) )
))
(declare-fun map!714 (LongMapFixedSize!268) ListLongMap!1067)

(assert (=> b!41443 (= lt!16429 (map!714 (LongMapFixedSize!269 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16427 lt!16427 #b00000000000000000000000000000000 lt!16425 lt!16430 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1069 0))(
  ( (Nil!1066) (Cons!1065 (h!1642 (_ BitVec 64)) (t!3958 List!1069)) )
))
(declare-fun arrayNoDuplicates!0 (array!2637 (_ BitVec 32) List!1069) Bool)

(assert (=> b!41443 (arrayNoDuplicates!0 lt!16425 #b00000000000000000000000000000000 Nil!1066)))

(declare-datatypes ((Unit!1035 0))(
  ( (Unit!1036) )
))
(declare-fun lt!16432 () Unit!1035)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2637 (_ BitVec 32) (_ BitVec 32) List!1069) Unit!1035)

(assert (=> b!41443 (= lt!16432 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16425 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2637 (_ BitVec 32)) Bool)

(assert (=> b!41443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16425 mask!853)))

(declare-fun lt!16428 () Unit!1035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2637 (_ BitVec 32) (_ BitVec 32)) Unit!1035)

(assert (=> b!41443 (= lt!16428 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16425 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41443 (= (arrayCountValidKeys!0 lt!16425 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16426 () Unit!1035)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2637 (_ BitVec 32) (_ BitVec 32)) Unit!1035)

(assert (=> b!41443 (= lt!16426 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16425 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41443 (= lt!16430 (array!2640 ((as const (Array (_ BitVec 32) ValueCell!644)) EmptyCell!644) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41443 (= lt!16425 (array!2638 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!201 (Int (_ BitVec 64)) V!2137)

(assert (=> b!41443 (= lt!16427 (dynLambda!201 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41445 () Bool)

(declare-fun res!24641 () Bool)

(assert (=> b!41445 (=> res!24641 e!26234)))

(assert (=> b!41445 (= res!24641 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24642 () Bool)

(assert (=> start!5918 (=> (not res!24642) (not e!26235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5918 (= res!24642 (validMask!0 mask!853))))

(assert (=> start!5918 e!26235))

(assert (=> start!5918 true))

(assert (=> start!5918 tp!5777))

(assert (= (and start!5918 res!24642) b!41443))

(assert (= (and b!41443 (not res!24644)) b!41444))

(assert (= (and b!41444 (not res!24643)) b!41445))

(assert (= (and b!41445 (not res!24641)) b!41446))

(declare-fun b_lambda!2117 () Bool)

(assert (=> (not b_lambda!2117) (not b!41443)))

(declare-fun t!3956 () Bool)

(declare-fun tb!875 () Bool)

(assert (=> (and start!5918 (= defaultEntry!470 defaultEntry!470) t!3956) tb!875))

(declare-fun result!1501 () Bool)

(declare-fun tp_is_empty!1783 () Bool)

(assert (=> tb!875 (= result!1501 tp_is_empty!1783)))

(assert (=> b!41443 t!3956))

(declare-fun b_and!2435 () Bool)

(assert (= b_and!2433 (and (=> t!3956 result!1501) b_and!2435)))

(declare-fun m!34693 () Bool)

(assert (=> b!41444 m!34693))

(declare-fun m!34695 () Bool)

(assert (=> b!41446 m!34695))

(declare-fun m!34697 () Bool)

(assert (=> b!41446 m!34697))

(assert (=> b!41446 m!34695))

(declare-fun m!34699 () Bool)

(assert (=> b!41446 m!34699))

(declare-fun m!34701 () Bool)

(assert (=> b!41443 m!34701))

(declare-fun m!34703 () Bool)

(assert (=> b!41443 m!34703))

(declare-fun m!34705 () Bool)

(assert (=> b!41443 m!34705))

(declare-fun m!34707 () Bool)

(assert (=> b!41443 m!34707))

(declare-fun m!34709 () Bool)

(assert (=> b!41443 m!34709))

(declare-fun m!34711 () Bool)

(assert (=> b!41443 m!34711))

(declare-fun m!34713 () Bool)

(assert (=> b!41443 m!34713))

(declare-fun m!34715 () Bool)

(assert (=> b!41443 m!34715))

(declare-fun m!34717 () Bool)

(assert (=> start!5918 m!34717))

(check-sat (not b!41443) tp_is_empty!1783 (not b!41444) b_and!2435 (not b_next!1393) (not start!5918) (not b!41446) (not b_lambda!2117))
(check-sat b_and!2435 (not b_next!1393))
