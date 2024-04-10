; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5922 () Bool)

(assert start!5922)

(declare-fun b_free!1401 () Bool)

(declare-fun b_next!1401 () Bool)

(assert (=> start!5922 (= b_free!1401 (not b_next!1401))))

(declare-fun tp!5789 () Bool)

(declare-fun b_and!2451 () Bool)

(assert (=> start!5922 (= tp!5789 b_and!2451)))

(declare-fun b!41556 () Bool)

(declare-fun e!26296 () Bool)

(declare-fun e!26295 () Bool)

(assert (=> b!41556 (= e!26296 (not e!26295))))

(declare-fun res!24715 () Bool)

(assert (=> b!41556 (=> res!24715 e!26295)))

(declare-datatypes ((V!2147 0))(
  ( (V!2148 (val!934 Int)) )
))
(declare-datatypes ((tuple2!1522 0))(
  ( (tuple2!1523 (_1!772 (_ BitVec 64)) (_2!772 V!2147)) )
))
(declare-datatypes ((List!1090 0))(
  ( (Nil!1087) (Cons!1086 (h!1663 tuple2!1522) (t!3987 List!1090)) )
))
(declare-datatypes ((ListLongMap!1099 0))(
  ( (ListLongMap!1100 (toList!565 List!1090)) )
))
(declare-fun lt!16568 () ListLongMap!1099)

(assert (=> b!41556 (= res!24715 (= lt!16568 (ListLongMap!1100 Nil!1087)))))

(declare-fun lt!16569 () V!2147)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2667 0))(
  ( (array!2668 (arr!1277 (Array (_ BitVec 32) (_ BitVec 64))) (size!1429 (_ BitVec 32))) )
))
(declare-fun lt!16566 () array!2667)

(declare-datatypes ((ValueCell!648 0))(
  ( (ValueCellFull!648 (v!2018 V!2147)) (EmptyCell!648) )
))
(declare-datatypes ((array!2669 0))(
  ( (array!2670 (arr!1278 (Array (_ BitVec 32) ValueCell!648)) (size!1430 (_ BitVec 32))) )
))
(declare-fun lt!16567 () array!2669)

(declare-datatypes ((LongMapFixedSize!276 0))(
  ( (LongMapFixedSize!277 (defaultEntry!1828 Int) (mask!5237 (_ BitVec 32)) (extraKeys!1719 (_ BitVec 32)) (zeroValue!1746 V!2147) (minValue!1746 V!2147) (_size!187 (_ BitVec 32)) (_keys!3335 array!2667) (_values!1811 array!2669) (_vacant!187 (_ BitVec 32))) )
))
(declare-fun map!720 (LongMapFixedSize!276) ListLongMap!1099)

(assert (=> b!41556 (= lt!16568 (map!720 (LongMapFixedSize!277 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16569 lt!16569 #b00000000000000000000000000000000 lt!16566 lt!16567 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1091 0))(
  ( (Nil!1088) (Cons!1087 (h!1664 (_ BitVec 64)) (t!3988 List!1091)) )
))
(declare-fun arrayNoDuplicates!0 (array!2667 (_ BitVec 32) List!1091) Bool)

(assert (=> b!41556 (arrayNoDuplicates!0 lt!16566 #b00000000000000000000000000000000 Nil!1088)))

(declare-datatypes ((Unit!1031 0))(
  ( (Unit!1032) )
))
(declare-fun lt!16565 () Unit!1031)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2667 (_ BitVec 32) (_ BitVec 32) List!1091) Unit!1031)

(assert (=> b!41556 (= lt!16565 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2667 (_ BitVec 32)) Bool)

(assert (=> b!41556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16566 mask!853)))

(declare-fun lt!16570 () Unit!1031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2667 (_ BitVec 32) (_ BitVec 32)) Unit!1031)

(assert (=> b!41556 (= lt!16570 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16566 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41556 (= (arrayCountValidKeys!0 lt!16566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16571 () Unit!1031)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2667 (_ BitVec 32) (_ BitVec 32)) Unit!1031)

(assert (=> b!41556 (= lt!16571 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16566 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41556 (= lt!16567 (array!2670 ((as const (Array (_ BitVec 32) ValueCell!648)) EmptyCell!648) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41556 (= lt!16566 (array!2668 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!209 (Int (_ BitVec 64)) V!2147)

(assert (=> b!41556 (= lt!16569 (dynLambda!209 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41559 () Bool)

(assert (=> b!41559 (= e!26295 true)))

(declare-fun lt!16564 () Bool)

(declare-fun contains!533 (ListLongMap!1099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!326 (array!2667 array!2669 (_ BitVec 32) (_ BitVec 32) V!2147 V!2147 (_ BitVec 32) Int) ListLongMap!1099)

(declare-fun head!864 (List!1090) tuple2!1522)

(assert (=> b!41559 (= lt!16564 (contains!533 (getCurrentListMap!326 lt!16566 lt!16567 mask!853 #b00000000000000000000000000000000 lt!16569 lt!16569 #b00000000000000000000000000000000 defaultEntry!470) (_1!772 (head!864 (toList!565 lt!16568)))))))

(declare-fun b!41558 () Bool)

(declare-fun res!24714 () Bool)

(assert (=> b!41558 (=> res!24714 e!26295)))

(assert (=> b!41558 (= res!24714 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24717 () Bool)

(assert (=> start!5922 (=> (not res!24717) (not e!26296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5922 (= res!24717 (validMask!0 mask!853))))

(assert (=> start!5922 e!26296))

(assert (=> start!5922 true))

(assert (=> start!5922 tp!5789))

(declare-fun b!41557 () Bool)

(declare-fun res!24716 () Bool)

(assert (=> b!41557 (=> res!24716 e!26295)))

(declare-fun isEmpty!251 (List!1090) Bool)

(assert (=> b!41557 (= res!24716 (isEmpty!251 (toList!565 lt!16568)))))

(assert (= (and start!5922 res!24717) b!41556))

(assert (= (and b!41556 (not res!24715)) b!41557))

(assert (= (and b!41557 (not res!24716)) b!41558))

(assert (= (and b!41558 (not res!24714)) b!41559))

(declare-fun b_lambda!2125 () Bool)

(assert (=> (not b_lambda!2125) (not b!41556)))

(declare-fun t!3986 () Bool)

(declare-fun tb!883 () Bool)

(assert (=> (and start!5922 (= defaultEntry!470 defaultEntry!470) t!3986) tb!883))

(declare-fun result!1517 () Bool)

(declare-fun tp_is_empty!1791 () Bool)

(assert (=> tb!883 (= result!1517 tp_is_empty!1791)))

(assert (=> b!41556 t!3986))

(declare-fun b_and!2453 () Bool)

(assert (= b_and!2451 (and (=> t!3986 result!1517) b_and!2453)))

(declare-fun m!34923 () Bool)

(assert (=> b!41556 m!34923))

(declare-fun m!34925 () Bool)

(assert (=> b!41556 m!34925))

(declare-fun m!34927 () Bool)

(assert (=> b!41556 m!34927))

(declare-fun m!34929 () Bool)

(assert (=> b!41556 m!34929))

(declare-fun m!34931 () Bool)

(assert (=> b!41556 m!34931))

(declare-fun m!34933 () Bool)

(assert (=> b!41556 m!34933))

(declare-fun m!34935 () Bool)

(assert (=> b!41556 m!34935))

(declare-fun m!34937 () Bool)

(assert (=> b!41556 m!34937))

(declare-fun m!34939 () Bool)

(assert (=> b!41559 m!34939))

(declare-fun m!34941 () Bool)

(assert (=> b!41559 m!34941))

(assert (=> b!41559 m!34939))

(declare-fun m!34943 () Bool)

(assert (=> b!41559 m!34943))

(declare-fun m!34945 () Bool)

(assert (=> start!5922 m!34945))

(declare-fun m!34947 () Bool)

(assert (=> b!41557 m!34947))

(check-sat b_and!2453 (not b_next!1401) (not b_lambda!2125) (not b!41557) (not b!41559) tp_is_empty!1791 (not b!41556) (not start!5922))
(check-sat b_and!2453 (not b_next!1401))
