; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6368 () Bool)

(assert start!6368)

(declare-fun b_free!1457 () Bool)

(declare-fun b_next!1457 () Bool)

(assert (=> start!6368 (= b_free!1457 (not b_next!1457))))

(declare-fun tp!5873 () Bool)

(declare-fun b_and!2563 () Bool)

(assert (=> start!6368 (= tp!5873 b_and!2563)))

(declare-fun res!25407 () Bool)

(declare-fun e!27088 () Bool)

(assert (=> start!6368 (=> (not res!25407) (not e!27088))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6368 (= res!25407 (validMask!0 mask!853))))

(assert (=> start!6368 e!27088))

(assert (=> start!6368 true))

(assert (=> start!6368 tp!5873))

(declare-fun b!42737 () Bool)

(assert (=> b!42737 (= e!27088 (not true))))

(declare-datatypes ((V!2249 0))(
  ( (V!2250 (val!962 Int)) )
))
(declare-datatypes ((tuple2!1578 0))(
  ( (tuple2!1579 (_1!800 (_ BitVec 64)) (_2!800 V!2249)) )
))
(declare-datatypes ((List!1152 0))(
  ( (Nil!1149) (Cons!1148 (h!1725 tuple2!1578) (t!4105 List!1152)) )
))
(declare-datatypes ((ListLongMap!1155 0))(
  ( (ListLongMap!1156 (toList!593 List!1152)) )
))
(declare-fun lt!17896 () ListLongMap!1155)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17895 () V!2249)

(declare-datatypes ((array!2839 0))(
  ( (array!2840 (arr!1363 (Array (_ BitVec 32) (_ BitVec 64))) (size!1542 (_ BitVec 32))) )
))
(declare-fun lt!17894 () array!2839)

(declare-datatypes ((ValueCell!676 0))(
  ( (ValueCellFull!676 (v!2052 V!2249)) (EmptyCell!676) )
))
(declare-datatypes ((array!2841 0))(
  ( (array!2842 (arr!1364 (Array (_ BitVec 32) ValueCell!676)) (size!1543 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!332 0))(
  ( (LongMapFixedSize!333 (defaultEntry!1859 Int) (mask!5383 (_ BitVec 32)) (extraKeys!1750 (_ BitVec 32)) (zeroValue!1777 V!2249) (minValue!1777 V!2249) (_size!215 (_ BitVec 32)) (_keys!3402 array!2839) (_values!1842 array!2841) (_vacant!215 (_ BitVec 32))) )
))
(declare-fun map!794 (LongMapFixedSize!332) ListLongMap!1155)

(assert (=> b!42737 (= lt!17896 (map!794 (LongMapFixedSize!333 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17895 lt!17895 #b00000000000000000000000000000000 lt!17894 (array!2842 ((as const (Array (_ BitVec 32) ValueCell!676)) EmptyCell!676) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1153 0))(
  ( (Nil!1150) (Cons!1149 (h!1726 (_ BitVec 64)) (t!4106 List!1153)) )
))
(declare-fun arrayNoDuplicates!0 (array!2839 (_ BitVec 32) List!1153) Bool)

(assert (=> b!42737 (arrayNoDuplicates!0 lt!17894 #b00000000000000000000000000000000 Nil!1150)))

(declare-datatypes ((Unit!1153 0))(
  ( (Unit!1154) )
))
(declare-fun lt!17897 () Unit!1153)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2839 (_ BitVec 32) (_ BitVec 32) List!1153) Unit!1153)

(assert (=> b!42737 (= lt!17897 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17894 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2839 (_ BitVec 32)) Bool)

(assert (=> b!42737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17894 mask!853)))

(declare-fun lt!17893 () Unit!1153)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2839 (_ BitVec 32) (_ BitVec 32)) Unit!1153)

(assert (=> b!42737 (= lt!17893 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17894 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2839 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42737 (= (arrayCountValidKeys!0 lt!17894 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17892 () Unit!1153)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2839 (_ BitVec 32) (_ BitVec 32)) Unit!1153)

(assert (=> b!42737 (= lt!17892 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17894 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42737 (= lt!17894 (array!2840 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!237 (Int (_ BitVec 64)) V!2249)

(assert (=> b!42737 (= lt!17895 (dynLambda!237 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6368 res!25407) b!42737))

(declare-fun b_lambda!2193 () Bool)

(assert (=> (not b_lambda!2193) (not b!42737)))

(declare-fun t!4104 () Bool)

(declare-fun tb!939 () Bool)

(assert (=> (and start!6368 (= defaultEntry!470 defaultEntry!470) t!4104) tb!939))

(declare-fun result!1629 () Bool)

(declare-fun tp_is_empty!1847 () Bool)

(assert (=> tb!939 (= result!1629 tp_is_empty!1847)))

(assert (=> b!42737 t!4104))

(declare-fun b_and!2565 () Bool)

(assert (= b_and!2563 (and (=> t!4104 result!1629) b_and!2565)))

(declare-fun m!36407 () Bool)

(assert (=> start!6368 m!36407))

(declare-fun m!36409 () Bool)

(assert (=> b!42737 m!36409))

(declare-fun m!36411 () Bool)

(assert (=> b!42737 m!36411))

(declare-fun m!36413 () Bool)

(assert (=> b!42737 m!36413))

(declare-fun m!36415 () Bool)

(assert (=> b!42737 m!36415))

(declare-fun m!36417 () Bool)

(assert (=> b!42737 m!36417))

(declare-fun m!36419 () Bool)

(assert (=> b!42737 m!36419))

(declare-fun m!36421 () Bool)

(assert (=> b!42737 m!36421))

(declare-fun m!36423 () Bool)

(assert (=> b!42737 m!36423))

(push 1)

(assert (not b_next!1457))

(assert (not b!42737))

(assert tp_is_empty!1847)

(assert (not start!6368))

(assert b_and!2565)

(assert (not b_lambda!2193))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2565)

(assert (not b_next!1457))

