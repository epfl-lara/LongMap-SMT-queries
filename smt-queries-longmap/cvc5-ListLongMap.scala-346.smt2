; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6362 () Bool)

(assert start!6362)

(declare-fun b_free!1457 () Bool)

(declare-fun b_next!1457 () Bool)

(assert (=> start!6362 (= b_free!1457 (not b_next!1457))))

(declare-fun tp!5873 () Bool)

(declare-fun b_and!2565 () Bool)

(assert (=> start!6362 (= tp!5873 b_and!2565)))

(declare-fun res!25381 () Bool)

(declare-fun e!27035 () Bool)

(assert (=> start!6362 (=> (not res!25381) (not e!27035))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6362 (= res!25381 (validMask!0 mask!853))))

(assert (=> start!6362 e!27035))

(assert (=> start!6362 true))

(assert (=> start!6362 tp!5873))

(declare-fun b!42657 () Bool)

(assert (=> b!42657 (= e!27035 (not true))))

(declare-datatypes ((V!2249 0))(
  ( (V!2250 (val!962 Int)) )
))
(declare-fun lt!17875 () V!2249)

(declare-datatypes ((tuple2!1582 0))(
  ( (tuple2!1583 (_1!802 (_ BitVec 64)) (_2!802 V!2249)) )
))
(declare-datatypes ((List!1145 0))(
  ( (Nil!1142) (Cons!1141 (h!1718 tuple2!1582) (t!4097 List!1145)) )
))
(declare-datatypes ((ListLongMap!1147 0))(
  ( (ListLongMap!1148 (toList!589 List!1145)) )
))
(declare-fun lt!17877 () ListLongMap!1147)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2813 0))(
  ( (array!2814 (arr!1350 (Array (_ BitVec 32) (_ BitVec 64))) (size!1529 (_ BitVec 32))) )
))
(declare-fun lt!17879 () array!2813)

(declare-datatypes ((ValueCell!676 0))(
  ( (ValueCellFull!676 (v!2050 V!2249)) (EmptyCell!676) )
))
(declare-datatypes ((array!2815 0))(
  ( (array!2816 (arr!1351 (Array (_ BitVec 32) ValueCell!676)) (size!1530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!332 0))(
  ( (LongMapFixedSize!333 (defaultEntry!1859 Int) (mask!5382 (_ BitVec 32)) (extraKeys!1750 (_ BitVec 32)) (zeroValue!1777 V!2249) (minValue!1777 V!2249) (_size!215 (_ BitVec 32)) (_keys!3401 array!2813) (_values!1842 array!2815) (_vacant!215 (_ BitVec 32))) )
))
(declare-fun map!795 (LongMapFixedSize!332) ListLongMap!1147)

(assert (=> b!42657 (= lt!17877 (map!795 (LongMapFixedSize!333 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17875 lt!17875 #b00000000000000000000000000000000 lt!17879 (array!2816 ((as const (Array (_ BitVec 32) ValueCell!676)) EmptyCell!676) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1146 0))(
  ( (Nil!1143) (Cons!1142 (h!1719 (_ BitVec 64)) (t!4098 List!1146)) )
))
(declare-fun arrayNoDuplicates!0 (array!2813 (_ BitVec 32) List!1146) Bool)

(assert (=> b!42657 (arrayNoDuplicates!0 lt!17879 #b00000000000000000000000000000000 Nil!1143)))

(declare-datatypes ((Unit!1160 0))(
  ( (Unit!1161) )
))
(declare-fun lt!17876 () Unit!1160)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2813 (_ BitVec 32) (_ BitVec 32) List!1146) Unit!1160)

(assert (=> b!42657 (= lt!17876 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17879 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2813 (_ BitVec 32)) Bool)

(assert (=> b!42657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17879 mask!853)))

(declare-fun lt!17874 () Unit!1160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2813 (_ BitVec 32) (_ BitVec 32)) Unit!1160)

(assert (=> b!42657 (= lt!17874 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17879 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2813 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42657 (= (arrayCountValidKeys!0 lt!17879 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17878 () Unit!1160)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2813 (_ BitVec 32) (_ BitVec 32)) Unit!1160)

(assert (=> b!42657 (= lt!17878 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17879 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42657 (= lt!17879 (array!2814 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!236 (Int (_ BitVec 64)) V!2249)

(assert (=> b!42657 (= lt!17875 (dynLambda!236 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6362 res!25381) b!42657))

(declare-fun b_lambda!2197 () Bool)

(assert (=> (not b_lambda!2197) (not b!42657)))

(declare-fun t!4096 () Bool)

(declare-fun tb!939 () Bool)

(assert (=> (and start!6362 (= defaultEntry!470 defaultEntry!470) t!4096) tb!939))

(declare-fun result!1629 () Bool)

(declare-fun tp_is_empty!1847 () Bool)

(assert (=> tb!939 (= result!1629 tp_is_empty!1847)))

(assert (=> b!42657 t!4096))

(declare-fun b_and!2567 () Bool)

(assert (= b_and!2565 (and (=> t!4096 result!1629) b_and!2567)))

(declare-fun m!36311 () Bool)

(assert (=> start!6362 m!36311))

(declare-fun m!36313 () Bool)

(assert (=> b!42657 m!36313))

(declare-fun m!36315 () Bool)

(assert (=> b!42657 m!36315))

(declare-fun m!36317 () Bool)

(assert (=> b!42657 m!36317))

(declare-fun m!36319 () Bool)

(assert (=> b!42657 m!36319))

(declare-fun m!36321 () Bool)

(assert (=> b!42657 m!36321))

(declare-fun m!36323 () Bool)

(assert (=> b!42657 m!36323))

(declare-fun m!36325 () Bool)

(assert (=> b!42657 m!36325))

(declare-fun m!36327 () Bool)

(assert (=> b!42657 m!36327))

(push 1)

(assert b_and!2567)

(assert (not b_next!1457))

(assert (not b_lambda!2197))

(assert (not start!6362))

(assert (not b!42657))

(assert tp_is_empty!1847)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2567)

(assert (not b_next!1457))

(check-sat)

(pop 1)

