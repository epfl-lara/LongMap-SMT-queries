; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5906 () Bool)

(assert start!5906)

(declare-fun b_free!1391 () Bool)

(declare-fun b_next!1391 () Bool)

(assert (=> start!5906 (= b_free!1391 (not b_next!1391))))

(declare-fun tp!5774 () Bool)

(declare-fun b_and!2433 () Bool)

(assert (=> start!5906 (= tp!5774 b_and!2433)))

(declare-fun b!41406 () Bool)

(declare-fun e!26213 () Bool)

(declare-fun e!26212 () Bool)

(assert (=> b!41406 (= e!26213 (not e!26212))))

(declare-fun res!24631 () Bool)

(assert (=> b!41406 (=> res!24631 e!26212)))

(declare-datatypes ((V!2133 0))(
  ( (V!2134 (val!929 Int)) )
))
(declare-datatypes ((tuple2!1516 0))(
  ( (tuple2!1517 (_1!769 (_ BitVec 64)) (_2!769 V!2133)) )
))
(declare-datatypes ((List!1073 0))(
  ( (Nil!1070) (Cons!1069 (h!1646 tuple2!1516) (t!3959 List!1073)) )
))
(declare-datatypes ((ListLongMap!1081 0))(
  ( (ListLongMap!1082 (toList!556 List!1073)) )
))
(declare-fun lt!16429 () ListLongMap!1081)

(assert (=> b!41406 (= res!24631 (= lt!16429 (ListLongMap!1082 Nil!1070)))))

(declare-datatypes ((array!2621 0))(
  ( (array!2622 (arr!1254 (Array (_ BitVec 32) (_ BitVec 64))) (size!1406 (_ BitVec 32))) )
))
(declare-fun lt!16433 () array!2621)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16430 () V!2133)

(declare-datatypes ((ValueCell!643 0))(
  ( (ValueCellFull!643 (v!2011 V!2133)) (EmptyCell!643) )
))
(declare-datatypes ((array!2623 0))(
  ( (array!2624 (arr!1255 (Array (_ BitVec 32) ValueCell!643)) (size!1407 (_ BitVec 32))) )
))
(declare-fun lt!16431 () array!2623)

(declare-datatypes ((LongMapFixedSize!266 0))(
  ( (LongMapFixedSize!267 (defaultEntry!1823 Int) (mask!5227 (_ BitVec 32)) (extraKeys!1714 (_ BitVec 32)) (zeroValue!1741 V!2133) (minValue!1741 V!2133) (_size!182 (_ BitVec 32)) (_keys!3329 array!2621) (_values!1806 array!2623) (_vacant!182 (_ BitVec 32))) )
))
(declare-fun map!712 (LongMapFixedSize!266) ListLongMap!1081)

(assert (=> b!41406 (= lt!16429 (map!712 (LongMapFixedSize!267 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16430 lt!16430 #b00000000000000000000000000000000 lt!16433 lt!16431 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1074 0))(
  ( (Nil!1071) (Cons!1070 (h!1647 (_ BitVec 64)) (t!3960 List!1074)) )
))
(declare-fun arrayNoDuplicates!0 (array!2621 (_ BitVec 32) List!1074) Bool)

(assert (=> b!41406 (arrayNoDuplicates!0 lt!16433 #b00000000000000000000000000000000 Nil!1071)))

(declare-datatypes ((Unit!1028 0))(
  ( (Unit!1029) )
))
(declare-fun lt!16427 () Unit!1028)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2621 (_ BitVec 32) (_ BitVec 32) List!1074) Unit!1028)

(assert (=> b!41406 (= lt!16427 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2621 (_ BitVec 32)) Bool)

(assert (=> b!41406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16433 mask!853)))

(declare-fun lt!16432 () Unit!1028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2621 (_ BitVec 32) (_ BitVec 32)) Unit!1028)

(assert (=> b!41406 (= lt!16432 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16433 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2621 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41406 (= (arrayCountValidKeys!0 lt!16433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16428 () Unit!1028)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2621 (_ BitVec 32) (_ BitVec 32)) Unit!1028)

(assert (=> b!41406 (= lt!16428 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16433 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41406 (= lt!16431 (array!2624 ((as const (Array (_ BitVec 32) ValueCell!643)) EmptyCell!643) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41406 (= lt!16433 (array!2622 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!203 (Int (_ BitVec 64)) V!2133)

(assert (=> b!41406 (= lt!16430 (dynLambda!203 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41408 () Bool)

(declare-fun res!24630 () Bool)

(assert (=> b!41408 (=> res!24630 e!26212)))

(assert (=> b!41408 (= res!24630 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41409 () Bool)

(assert (=> b!41409 (= e!26212 true)))

(declare-fun lt!16426 () Bool)

(declare-fun contains!526 (ListLongMap!1081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!311 (array!2621 array!2623 (_ BitVec 32) (_ BitVec 32) V!2133 V!2133 (_ BitVec 32) Int) ListLongMap!1081)

(declare-fun head!859 (List!1073) tuple2!1516)

(assert (=> b!41409 (= lt!16426 (contains!526 (getCurrentListMap!311 lt!16433 lt!16431 mask!853 #b00000000000000000000000000000000 lt!16430 lt!16430 #b00000000000000000000000000000000 defaultEntry!470) (_1!769 (head!859 (toList!556 lt!16429)))))))

(declare-fun res!24629 () Bool)

(assert (=> start!5906 (=> (not res!24629) (not e!26213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5906 (= res!24629 (validMask!0 mask!853))))

(assert (=> start!5906 e!26213))

(assert (=> start!5906 true))

(assert (=> start!5906 tp!5774))

(declare-fun b!41407 () Bool)

(declare-fun res!24628 () Bool)

(assert (=> b!41407 (=> res!24628 e!26212)))

(declare-fun isEmpty!248 (List!1073) Bool)

(assert (=> b!41407 (= res!24628 (isEmpty!248 (toList!556 lt!16429)))))

(assert (= (and start!5906 res!24629) b!41406))

(assert (= (and b!41406 (not res!24631)) b!41407))

(assert (= (and b!41407 (not res!24628)) b!41408))

(assert (= (and b!41408 (not res!24630)) b!41409))

(declare-fun b_lambda!2119 () Bool)

(assert (=> (not b_lambda!2119) (not b!41406)))

(declare-fun t!3958 () Bool)

(declare-fun tb!873 () Bool)

(assert (=> (and start!5906 (= defaultEntry!470 defaultEntry!470) t!3958) tb!873))

(declare-fun result!1497 () Bool)

(declare-fun tp_is_empty!1781 () Bool)

(assert (=> tb!873 (= result!1497 tp_is_empty!1781)))

(assert (=> b!41406 t!3958))

(declare-fun b_and!2435 () Bool)

(assert (= b_and!2433 (and (=> t!3958 result!1497) b_and!2435)))

(declare-fun m!34695 () Bool)

(assert (=> b!41406 m!34695))

(declare-fun m!34697 () Bool)

(assert (=> b!41406 m!34697))

(declare-fun m!34699 () Bool)

(assert (=> b!41406 m!34699))

(declare-fun m!34701 () Bool)

(assert (=> b!41406 m!34701))

(declare-fun m!34703 () Bool)

(assert (=> b!41406 m!34703))

(declare-fun m!34705 () Bool)

(assert (=> b!41406 m!34705))

(declare-fun m!34707 () Bool)

(assert (=> b!41406 m!34707))

(declare-fun m!34709 () Bool)

(assert (=> b!41406 m!34709))

(declare-fun m!34711 () Bool)

(assert (=> b!41409 m!34711))

(declare-fun m!34713 () Bool)

(assert (=> b!41409 m!34713))

(assert (=> b!41409 m!34711))

(declare-fun m!34715 () Bool)

(assert (=> b!41409 m!34715))

(declare-fun m!34717 () Bool)

(assert (=> start!5906 m!34717))

(declare-fun m!34719 () Bool)

(assert (=> b!41407 m!34719))

(push 1)

(assert b_and!2435)

(assert tp_is_empty!1781)

(assert (not b!41409))

(assert (not start!5906))

(assert (not b_lambda!2119))

(assert (not b!41406))

(assert (not b_next!1391))

(assert (not b!41407))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2435)

(assert (not b_next!1391))

(check-sat)

(pop 1)

