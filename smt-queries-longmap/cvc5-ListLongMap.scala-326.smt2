; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5936 () Bool)

(assert start!5936)

(declare-fun b_free!1421 () Bool)

(declare-fun b_next!1421 () Bool)

(assert (=> start!5936 (= b_free!1421 (not b_next!1421))))

(declare-fun tp!5819 () Bool)

(declare-fun b_and!2493 () Bool)

(assert (=> start!5936 (= tp!5819 b_and!2493)))

(declare-fun b!41618 () Bool)

(declare-fun res!24811 () Bool)

(declare-fun e!26302 () Bool)

(assert (=> b!41618 (=> res!24811 e!26302)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41618 (= res!24811 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41619 () Bool)

(assert (=> b!41619 (= e!26302 true)))

(declare-fun lt!16787 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2173 0))(
  ( (V!2174 (val!944 Int)) )
))
(declare-fun lt!16791 () V!2173)

(declare-datatypes ((ValueCell!658 0))(
  ( (ValueCellFull!658 (v!2026 V!2173)) (EmptyCell!658) )
))
(declare-datatypes ((array!2681 0))(
  ( (array!2682 (arr!1284 (Array (_ BitVec 32) ValueCell!658)) (size!1436 (_ BitVec 32))) )
))
(declare-fun lt!16786 () array!2681)

(declare-datatypes ((array!2683 0))(
  ( (array!2684 (arr!1285 (Array (_ BitVec 32) (_ BitVec 64))) (size!1437 (_ BitVec 32))) )
))
(declare-fun lt!16789 () array!2683)

(declare-datatypes ((tuple2!1546 0))(
  ( (tuple2!1547 (_1!784 (_ BitVec 64)) (_2!784 V!2173)) )
))
(declare-datatypes ((List!1103 0))(
  ( (Nil!1100) (Cons!1099 (h!1676 tuple2!1546) (t!4019 List!1103)) )
))
(declare-datatypes ((ListLongMap!1111 0))(
  ( (ListLongMap!1112 (toList!571 List!1103)) )
))
(declare-fun lt!16792 () ListLongMap!1111)

(declare-fun contains!541 (ListLongMap!1111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!326 (array!2683 array!2681 (_ BitVec 32) (_ BitVec 32) V!2173 V!2173 (_ BitVec 32) Int) ListLongMap!1111)

(declare-fun head!874 (List!1103) tuple2!1546)

(assert (=> b!41619 (= lt!16787 (contains!541 (getCurrentListMap!326 lt!16789 lt!16786 mask!853 #b00000000000000000000000000000000 lt!16791 lt!16791 #b00000000000000000000000000000000 defaultEntry!470) (_1!784 (head!874 (toList!571 lt!16792)))))))

(declare-fun b!41617 () Bool)

(declare-fun res!24810 () Bool)

(assert (=> b!41617 (=> res!24810 e!26302)))

(declare-fun isEmpty!263 (List!1103) Bool)

(assert (=> b!41617 (= res!24810 (isEmpty!263 (toList!571 lt!16792)))))

(declare-fun b!41616 () Bool)

(declare-fun e!26303 () Bool)

(assert (=> b!41616 (= e!26303 (not e!26302))))

(declare-fun res!24809 () Bool)

(assert (=> b!41616 (=> res!24809 e!26302)))

(assert (=> b!41616 (= res!24809 (= lt!16792 (ListLongMap!1112 Nil!1100)))))

(declare-datatypes ((LongMapFixedSize!296 0))(
  ( (LongMapFixedSize!297 (defaultEntry!1838 Int) (mask!5252 (_ BitVec 32)) (extraKeys!1729 (_ BitVec 32)) (zeroValue!1756 V!2173) (minValue!1756 V!2173) (_size!197 (_ BitVec 32)) (_keys!3344 array!2683) (_values!1821 array!2681) (_vacant!197 (_ BitVec 32))) )
))
(declare-fun map!737 (LongMapFixedSize!296) ListLongMap!1111)

(assert (=> b!41616 (= lt!16792 (map!737 (LongMapFixedSize!297 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16791 lt!16791 #b00000000000000000000000000000000 lt!16789 lt!16786 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1104 0))(
  ( (Nil!1101) (Cons!1100 (h!1677 (_ BitVec 64)) (t!4020 List!1104)) )
))
(declare-fun arrayNoDuplicates!0 (array!2683 (_ BitVec 32) List!1104) Bool)

(assert (=> b!41616 (arrayNoDuplicates!0 lt!16789 #b00000000000000000000000000000000 Nil!1101)))

(declare-datatypes ((Unit!1058 0))(
  ( (Unit!1059) )
))
(declare-fun lt!16793 () Unit!1058)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2683 (_ BitVec 32) (_ BitVec 32) List!1104) Unit!1058)

(assert (=> b!41616 (= lt!16793 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16789 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2683 (_ BitVec 32)) Bool)

(assert (=> b!41616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16789 mask!853)))

(declare-fun lt!16788 () Unit!1058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2683 (_ BitVec 32) (_ BitVec 32)) Unit!1058)

(assert (=> b!41616 (= lt!16788 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16789 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41616 (= (arrayCountValidKeys!0 lt!16789 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16790 () Unit!1058)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2683 (_ BitVec 32) (_ BitVec 32)) Unit!1058)

(assert (=> b!41616 (= lt!16790 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16789 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41616 (= lt!16786 (array!2682 ((as const (Array (_ BitVec 32) ValueCell!658)) EmptyCell!658) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41616 (= lt!16789 (array!2684 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!218 (Int (_ BitVec 64)) V!2173)

(assert (=> b!41616 (= lt!16791 (dynLambda!218 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24808 () Bool)

(assert (=> start!5936 (=> (not res!24808) (not e!26303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5936 (= res!24808 (validMask!0 mask!853))))

(assert (=> start!5936 e!26303))

(assert (=> start!5936 true))

(assert (=> start!5936 tp!5819))

(assert (= (and start!5936 res!24808) b!41616))

(assert (= (and b!41616 (not res!24809)) b!41617))

(assert (= (and b!41617 (not res!24810)) b!41618))

(assert (= (and b!41618 (not res!24811)) b!41619))

(declare-fun b_lambda!2149 () Bool)

(assert (=> (not b_lambda!2149) (not b!41616)))

(declare-fun t!4018 () Bool)

(declare-fun tb!903 () Bool)

(assert (=> (and start!5936 (= defaultEntry!470 defaultEntry!470) t!4018) tb!903))

(declare-fun result!1557 () Bool)

(declare-fun tp_is_empty!1811 () Bool)

(assert (=> tb!903 (= result!1557 tp_is_empty!1811)))

(assert (=> b!41616 t!4018))

(declare-fun b_and!2495 () Bool)

(assert (= b_and!2493 (and (=> t!4018 result!1557) b_and!2495)))

(declare-fun m!35085 () Bool)

(assert (=> b!41619 m!35085))

(declare-fun m!35087 () Bool)

(assert (=> b!41619 m!35087))

(assert (=> b!41619 m!35085))

(declare-fun m!35089 () Bool)

(assert (=> b!41619 m!35089))

(declare-fun m!35091 () Bool)

(assert (=> b!41617 m!35091))

(declare-fun m!35093 () Bool)

(assert (=> b!41616 m!35093))

(declare-fun m!35095 () Bool)

(assert (=> b!41616 m!35095))

(declare-fun m!35097 () Bool)

(assert (=> b!41616 m!35097))

(declare-fun m!35099 () Bool)

(assert (=> b!41616 m!35099))

(declare-fun m!35101 () Bool)

(assert (=> b!41616 m!35101))

(declare-fun m!35103 () Bool)

(assert (=> b!41616 m!35103))

(declare-fun m!35105 () Bool)

(assert (=> b!41616 m!35105))

(declare-fun m!35107 () Bool)

(assert (=> b!41616 m!35107))

(declare-fun m!35109 () Bool)

(assert (=> start!5936 m!35109))

(push 1)

(assert (not b!41619))

(assert tp_is_empty!1811)

(assert (not b_lambda!2149))

(assert (not b!41617))

(assert (not start!5936))

(assert (not b!41616))

(assert (not b_next!1421))

(assert b_and!2495)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2495)

(assert (not b_next!1421))

(check-sat)

(pop 1)

