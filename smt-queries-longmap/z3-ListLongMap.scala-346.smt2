; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6366 () Bool)

(assert start!6366)

(declare-fun b_free!1455 () Bool)

(declare-fun b_next!1455 () Bool)

(assert (=> start!6366 (= b_free!1455 (not b_next!1455))))

(declare-fun tp!5870 () Bool)

(declare-fun b_and!2559 () Bool)

(assert (=> start!6366 (= tp!5870 b_and!2559)))

(declare-fun res!25404 () Bool)

(declare-fun e!27085 () Bool)

(assert (=> start!6366 (=> (not res!25404) (not e!27085))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6366 (= res!25404 (validMask!0 mask!853))))

(assert (=> start!6366 e!27085))

(assert (=> start!6366 true))

(assert (=> start!6366 tp!5870))

(declare-fun b!42732 () Bool)

(assert (=> b!42732 (= e!27085 (not true))))

(declare-datatypes ((V!2247 0))(
  ( (V!2248 (val!961 Int)) )
))
(declare-datatypes ((tuple2!1576 0))(
  ( (tuple2!1577 (_1!799 (_ BitVec 64)) (_2!799 V!2247)) )
))
(declare-datatypes ((List!1150 0))(
  ( (Nil!1147) (Cons!1146 (h!1723 tuple2!1576) (t!4101 List!1150)) )
))
(declare-datatypes ((ListLongMap!1153 0))(
  ( (ListLongMap!1154 (toList!592 List!1150)) )
))
(declare-fun lt!17875 () ListLongMap!1153)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17877 () V!2247)

(declare-datatypes ((array!2835 0))(
  ( (array!2836 (arr!1361 (Array (_ BitVec 32) (_ BitVec 64))) (size!1540 (_ BitVec 32))) )
))
(declare-fun lt!17876 () array!2835)

(declare-datatypes ((ValueCell!675 0))(
  ( (ValueCellFull!675 (v!2051 V!2247)) (EmptyCell!675) )
))
(declare-datatypes ((array!2837 0))(
  ( (array!2838 (arr!1362 (Array (_ BitVec 32) ValueCell!675)) (size!1541 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!330 0))(
  ( (LongMapFixedSize!331 (defaultEntry!1858 Int) (mask!5382 (_ BitVec 32)) (extraKeys!1749 (_ BitVec 32)) (zeroValue!1776 V!2247) (minValue!1776 V!2247) (_size!214 (_ BitVec 32)) (_keys!3401 array!2835) (_values!1841 array!2837) (_vacant!214 (_ BitVec 32))) )
))
(declare-fun map!793 (LongMapFixedSize!330) ListLongMap!1153)

(assert (=> b!42732 (= lt!17875 (map!793 (LongMapFixedSize!331 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17877 lt!17877 #b00000000000000000000000000000000 lt!17876 (array!2838 ((as const (Array (_ BitVec 32) ValueCell!675)) EmptyCell!675) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1151 0))(
  ( (Nil!1148) (Cons!1147 (h!1724 (_ BitVec 64)) (t!4102 List!1151)) )
))
(declare-fun arrayNoDuplicates!0 (array!2835 (_ BitVec 32) List!1151) Bool)

(assert (=> b!42732 (arrayNoDuplicates!0 lt!17876 #b00000000000000000000000000000000 Nil!1148)))

(declare-datatypes ((Unit!1151 0))(
  ( (Unit!1152) )
))
(declare-fun lt!17878 () Unit!1151)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2835 (_ BitVec 32) (_ BitVec 32) List!1151) Unit!1151)

(assert (=> b!42732 (= lt!17878 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17876 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2835 (_ BitVec 32)) Bool)

(assert (=> b!42732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17876 mask!853)))

(declare-fun lt!17874 () Unit!1151)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2835 (_ BitVec 32) (_ BitVec 32)) Unit!1151)

(assert (=> b!42732 (= lt!17874 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17876 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2835 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42732 (= (arrayCountValidKeys!0 lt!17876 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17879 () Unit!1151)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2835 (_ BitVec 32) (_ BitVec 32)) Unit!1151)

(assert (=> b!42732 (= lt!17879 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17876 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42732 (= lt!17876 (array!2836 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!236 (Int (_ BitVec 64)) V!2247)

(assert (=> b!42732 (= lt!17877 (dynLambda!236 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6366 res!25404) b!42732))

(declare-fun b_lambda!2191 () Bool)

(assert (=> (not b_lambda!2191) (not b!42732)))

(declare-fun t!4100 () Bool)

(declare-fun tb!937 () Bool)

(assert (=> (and start!6366 (= defaultEntry!470 defaultEntry!470) t!4100) tb!937))

(declare-fun result!1625 () Bool)

(declare-fun tp_is_empty!1845 () Bool)

(assert (=> tb!937 (= result!1625 tp_is_empty!1845)))

(assert (=> b!42732 t!4100))

(declare-fun b_and!2561 () Bool)

(assert (= b_and!2559 (and (=> t!4100 result!1625) b_and!2561)))

(declare-fun m!36389 () Bool)

(assert (=> start!6366 m!36389))

(declare-fun m!36391 () Bool)

(assert (=> b!42732 m!36391))

(declare-fun m!36393 () Bool)

(assert (=> b!42732 m!36393))

(declare-fun m!36395 () Bool)

(assert (=> b!42732 m!36395))

(declare-fun m!36397 () Bool)

(assert (=> b!42732 m!36397))

(declare-fun m!36399 () Bool)

(assert (=> b!42732 m!36399))

(declare-fun m!36401 () Bool)

(assert (=> b!42732 m!36401))

(declare-fun m!36403 () Bool)

(assert (=> b!42732 m!36403))

(declare-fun m!36405 () Bool)

(assert (=> b!42732 m!36405))

(check-sat (not start!6366) b_and!2561 (not b_lambda!2191) (not b!42732) (not b_next!1455) tp_is_empty!1845)
(check-sat b_and!2561 (not b_next!1455))
