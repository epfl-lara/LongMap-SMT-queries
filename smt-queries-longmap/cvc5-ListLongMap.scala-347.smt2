; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6370 () Bool)

(assert start!6370)

(declare-fun b_free!1459 () Bool)

(declare-fun b_next!1459 () Bool)

(assert (=> start!6370 (= b_free!1459 (not b_next!1459))))

(declare-fun tp!5876 () Bool)

(declare-fun b_and!2567 () Bool)

(assert (=> start!6370 (= tp!5876 b_and!2567)))

(declare-fun res!25410 () Bool)

(declare-fun e!27091 () Bool)

(assert (=> start!6370 (=> (not res!25410) (not e!27091))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6370 (= res!25410 (validMask!0 mask!853))))

(assert (=> start!6370 e!27091))

(assert (=> start!6370 true))

(assert (=> start!6370 tp!5876))

(declare-fun b!42742 () Bool)

(assert (=> b!42742 (= e!27091 (not true))))

(declare-datatypes ((V!2253 0))(
  ( (V!2254 (val!963 Int)) )
))
(declare-datatypes ((tuple2!1580 0))(
  ( (tuple2!1581 (_1!801 (_ BitVec 64)) (_2!801 V!2253)) )
))
(declare-datatypes ((List!1154 0))(
  ( (Nil!1151) (Cons!1150 (h!1727 tuple2!1580) (t!4109 List!1154)) )
))
(declare-datatypes ((ListLongMap!1157 0))(
  ( (ListLongMap!1158 (toList!594 List!1154)) )
))
(declare-fun lt!17911 () ListLongMap!1157)

(declare-fun lt!17912 () V!2253)

(declare-datatypes ((array!2843 0))(
  ( (array!2844 (arr!1365 (Array (_ BitVec 32) (_ BitVec 64))) (size!1544 (_ BitVec 32))) )
))
(declare-fun lt!17914 () array!2843)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!677 0))(
  ( (ValueCellFull!677 (v!2053 V!2253)) (EmptyCell!677) )
))
(declare-datatypes ((array!2845 0))(
  ( (array!2846 (arr!1366 (Array (_ BitVec 32) ValueCell!677)) (size!1545 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!334 0))(
  ( (LongMapFixedSize!335 (defaultEntry!1860 Int) (mask!5386 (_ BitVec 32)) (extraKeys!1751 (_ BitVec 32)) (zeroValue!1778 V!2253) (minValue!1778 V!2253) (_size!216 (_ BitVec 32)) (_keys!3403 array!2843) (_values!1843 array!2845) (_vacant!216 (_ BitVec 32))) )
))
(declare-fun map!797 (LongMapFixedSize!334) ListLongMap!1157)

(assert (=> b!42742 (= lt!17911 (map!797 (LongMapFixedSize!335 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17912 lt!17912 #b00000000000000000000000000000000 lt!17914 (array!2846 ((as const (Array (_ BitVec 32) ValueCell!677)) EmptyCell!677) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1155 0))(
  ( (Nil!1152) (Cons!1151 (h!1728 (_ BitVec 64)) (t!4110 List!1155)) )
))
(declare-fun arrayNoDuplicates!0 (array!2843 (_ BitVec 32) List!1155) Bool)

(assert (=> b!42742 (arrayNoDuplicates!0 lt!17914 #b00000000000000000000000000000000 Nil!1152)))

(declare-datatypes ((Unit!1155 0))(
  ( (Unit!1156) )
))
(declare-fun lt!17913 () Unit!1155)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2843 (_ BitVec 32) (_ BitVec 32) List!1155) Unit!1155)

(assert (=> b!42742 (= lt!17913 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17914 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2843 (_ BitVec 32)) Bool)

(assert (=> b!42742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17914 mask!853)))

(declare-fun lt!17915 () Unit!1155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2843 (_ BitVec 32) (_ BitVec 32)) Unit!1155)

(assert (=> b!42742 (= lt!17915 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17914 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2843 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42742 (= (arrayCountValidKeys!0 lt!17914 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17910 () Unit!1155)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2843 (_ BitVec 32) (_ BitVec 32)) Unit!1155)

(assert (=> b!42742 (= lt!17910 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17914 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42742 (= lt!17914 (array!2844 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!238 (Int (_ BitVec 64)) V!2253)

(assert (=> b!42742 (= lt!17912 (dynLambda!238 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6370 res!25410) b!42742))

(declare-fun b_lambda!2195 () Bool)

(assert (=> (not b_lambda!2195) (not b!42742)))

(declare-fun t!4108 () Bool)

(declare-fun tb!941 () Bool)

(assert (=> (and start!6370 (= defaultEntry!470 defaultEntry!470) t!4108) tb!941))

(declare-fun result!1633 () Bool)

(declare-fun tp_is_empty!1849 () Bool)

(assert (=> tb!941 (= result!1633 tp_is_empty!1849)))

(assert (=> b!42742 t!4108))

(declare-fun b_and!2569 () Bool)

(assert (= b_and!2567 (and (=> t!4108 result!1633) b_and!2569)))

(declare-fun m!36425 () Bool)

(assert (=> start!6370 m!36425))

(declare-fun m!36427 () Bool)

(assert (=> b!42742 m!36427))

(declare-fun m!36429 () Bool)

(assert (=> b!42742 m!36429))

(declare-fun m!36431 () Bool)

(assert (=> b!42742 m!36431))

(declare-fun m!36433 () Bool)

(assert (=> b!42742 m!36433))

(declare-fun m!36435 () Bool)

(assert (=> b!42742 m!36435))

(declare-fun m!36437 () Bool)

(assert (=> b!42742 m!36437))

(declare-fun m!36439 () Bool)

(assert (=> b!42742 m!36439))

(declare-fun m!36441 () Bool)

(assert (=> b!42742 m!36441))

(push 1)

(assert (not start!6370))

(assert (not b!42742))

(assert (not b_lambda!2195))

(assert (not b_next!1459))

(assert tp_is_empty!1849)

(assert b_and!2569)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2569)

(assert (not b_next!1459))

(check-sat)

(pop 1)

