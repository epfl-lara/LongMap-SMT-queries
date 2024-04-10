; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5900 () Bool)

(assert start!5900)

(declare-fun b_free!1379 () Bool)

(declare-fun b_next!1379 () Bool)

(assert (=> start!5900 (= b_free!1379 (not b_next!1379))))

(declare-fun tp!5756 () Bool)

(declare-fun b_and!2407 () Bool)

(assert (=> start!5900 (= tp!5756 b_and!2407)))

(declare-fun b!41405 () Bool)

(declare-fun e!26230 () Bool)

(assert (=> b!41405 (= e!26230 true)))

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((V!2117 0))(
  ( (V!2118 (val!923 Int)) )
))
(declare-fun lt!16301 () V!2117)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16302 () Bool)

(declare-datatypes ((tuple2!1500 0))(
  ( (tuple2!1501 (_1!761 (_ BitVec 64)) (_2!761 V!2117)) )
))
(declare-datatypes ((List!1068 0))(
  ( (Nil!1065) (Cons!1064 (h!1641 tuple2!1500) (t!3943 List!1068)) )
))
(declare-datatypes ((ListLongMap!1077 0))(
  ( (ListLongMap!1078 (toList!554 List!1068)) )
))
(declare-fun lt!16306 () ListLongMap!1077)

(declare-datatypes ((array!2623 0))(
  ( (array!2624 (arr!1255 (Array (_ BitVec 32) (_ BitVec 64))) (size!1407 (_ BitVec 32))) )
))
(declare-fun lt!16305 () array!2623)

(declare-datatypes ((ValueCell!637 0))(
  ( (ValueCellFull!637 (v!2007 V!2117)) (EmptyCell!637) )
))
(declare-datatypes ((array!2625 0))(
  ( (array!2626 (arr!1256 (Array (_ BitVec 32) ValueCell!637)) (size!1408 (_ BitVec 32))) )
))
(declare-fun lt!16304 () array!2625)

(declare-fun contains!522 (ListLongMap!1077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!315 (array!2623 array!2625 (_ BitVec 32) (_ BitVec 32) V!2117 V!2117 (_ BitVec 32) Int) ListLongMap!1077)

(declare-fun head!853 (List!1068) tuple2!1500)

(assert (=> b!41405 (= lt!16302 (contains!522 (getCurrentListMap!315 lt!16305 lt!16304 mask!853 #b00000000000000000000000000000000 lt!16301 lt!16301 #b00000000000000000000000000000000 defaultEntry!470) (_1!761 (head!853 (toList!554 lt!16306)))))))

(declare-fun res!24583 () Bool)

(declare-fun e!26229 () Bool)

(assert (=> start!5900 (=> (not res!24583) (not e!26229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5900 (= res!24583 (validMask!0 mask!853))))

(assert (=> start!5900 e!26229))

(assert (=> start!5900 true))

(assert (=> start!5900 tp!5756))

(declare-fun b!41403 () Bool)

(declare-fun res!24584 () Bool)

(assert (=> b!41403 (=> res!24584 e!26230)))

(declare-fun isEmpty!240 (List!1068) Bool)

(assert (=> b!41403 (= res!24584 (isEmpty!240 (toList!554 lt!16306)))))

(declare-fun b!41402 () Bool)

(assert (=> b!41402 (= e!26229 (not e!26230))))

(declare-fun res!24585 () Bool)

(assert (=> b!41402 (=> res!24585 e!26230)))

(assert (=> b!41402 (= res!24585 (= lt!16306 (ListLongMap!1078 Nil!1065)))))

(declare-datatypes ((LongMapFixedSize!254 0))(
  ( (LongMapFixedSize!255 (defaultEntry!1817 Int) (mask!5218 (_ BitVec 32)) (extraKeys!1708 (_ BitVec 32)) (zeroValue!1735 V!2117) (minValue!1735 V!2117) (_size!176 (_ BitVec 32)) (_keys!3324 array!2623) (_values!1800 array!2625) (_vacant!176 (_ BitVec 32))) )
))
(declare-fun map!701 (LongMapFixedSize!254) ListLongMap!1077)

(assert (=> b!41402 (= lt!16306 (map!701 (LongMapFixedSize!255 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16301 lt!16301 #b00000000000000000000000000000000 lt!16305 lt!16304 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1069 0))(
  ( (Nil!1066) (Cons!1065 (h!1642 (_ BitVec 64)) (t!3944 List!1069)) )
))
(declare-fun arrayNoDuplicates!0 (array!2623 (_ BitVec 32) List!1069) Bool)

(assert (=> b!41402 (arrayNoDuplicates!0 lt!16305 #b00000000000000000000000000000000 Nil!1066)))

(declare-datatypes ((Unit!1009 0))(
  ( (Unit!1010) )
))
(declare-fun lt!16303 () Unit!1009)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2623 (_ BitVec 32) (_ BitVec 32) List!1069) Unit!1009)

(assert (=> b!41402 (= lt!16303 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16305 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2623 (_ BitVec 32)) Bool)

(assert (=> b!41402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16305 mask!853)))

(declare-fun lt!16307 () Unit!1009)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2623 (_ BitVec 32) (_ BitVec 32)) Unit!1009)

(assert (=> b!41402 (= lt!16307 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16305 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41402 (= (arrayCountValidKeys!0 lt!16305 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16300 () Unit!1009)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2623 (_ BitVec 32) (_ BitVec 32)) Unit!1009)

(assert (=> b!41402 (= lt!16300 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16305 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41402 (= lt!16304 (array!2626 ((as const (Array (_ BitVec 32) ValueCell!637)) EmptyCell!637) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41402 (= lt!16305 (array!2624 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!198 (Int (_ BitVec 64)) V!2117)

(assert (=> b!41402 (= lt!16301 (dynLambda!198 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41404 () Bool)

(declare-fun res!24582 () Bool)

(assert (=> b!41404 (=> res!24582 e!26230)))

(assert (=> b!41404 (= res!24582 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5900 res!24583) b!41402))

(assert (= (and b!41402 (not res!24585)) b!41403))

(assert (= (and b!41403 (not res!24584)) b!41404))

(assert (= (and b!41404 (not res!24582)) b!41405))

(declare-fun b_lambda!2103 () Bool)

(assert (=> (not b_lambda!2103) (not b!41402)))

(declare-fun t!3942 () Bool)

(declare-fun tb!861 () Bool)

(assert (=> (and start!5900 (= defaultEntry!470 defaultEntry!470) t!3942) tb!861))

(declare-fun result!1473 () Bool)

(declare-fun tp_is_empty!1769 () Bool)

(assert (=> tb!861 (= result!1473 tp_is_empty!1769)))

(assert (=> b!41402 t!3942))

(declare-fun b_and!2409 () Bool)

(assert (= b_and!2407 (and (=> t!3942 result!1473) b_and!2409)))

(declare-fun m!34637 () Bool)

(assert (=> b!41405 m!34637))

(declare-fun m!34639 () Bool)

(assert (=> b!41405 m!34639))

(assert (=> b!41405 m!34637))

(declare-fun m!34641 () Bool)

(assert (=> b!41405 m!34641))

(declare-fun m!34643 () Bool)

(assert (=> start!5900 m!34643))

(declare-fun m!34645 () Bool)

(assert (=> b!41403 m!34645))

(declare-fun m!34647 () Bool)

(assert (=> b!41402 m!34647))

(declare-fun m!34649 () Bool)

(assert (=> b!41402 m!34649))

(declare-fun m!34651 () Bool)

(assert (=> b!41402 m!34651))

(declare-fun m!34653 () Bool)

(assert (=> b!41402 m!34653))

(declare-fun m!34655 () Bool)

(assert (=> b!41402 m!34655))

(declare-fun m!34657 () Bool)

(assert (=> b!41402 m!34657))

(declare-fun m!34659 () Bool)

(assert (=> b!41402 m!34659))

(declare-fun m!34661 () Bool)

(assert (=> b!41402 m!34661))

(push 1)

(assert (not b!41402))

(assert b_and!2409)

(assert (not b_lambda!2103))

(assert (not start!5900))

(assert (not b!41405))

(assert (not b!41403))

(assert (not b_next!1379))

(assert tp_is_empty!1769)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2409)

(assert (not b_next!1379))

(check-sat)

(pop 1)

