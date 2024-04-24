; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6372 () Bool)

(assert start!6372)

(declare-fun b_free!1457 () Bool)

(declare-fun b_next!1457 () Bool)

(assert (=> start!6372 (= b_free!1457 (not b_next!1457))))

(declare-fun tp!5873 () Bool)

(declare-fun b_and!2561 () Bool)

(assert (=> start!6372 (= tp!5873 b_and!2561)))

(declare-fun res!25382 () Bool)

(declare-fun e!27051 () Bool)

(assert (=> start!6372 (=> (not res!25382) (not e!27051))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6372 (= res!25382 (validMask!0 mask!853))))

(assert (=> start!6372 e!27051))

(assert (=> start!6372 true))

(assert (=> start!6372 tp!5873))

(declare-fun b!42680 () Bool)

(assert (=> b!42680 (= e!27051 (not true))))

(declare-datatypes ((array!2825 0))(
  ( (array!2826 (arr!1356 (Array (_ BitVec 32) (_ BitVec 64))) (size!1535 (_ BitVec 32))) )
))
(declare-fun lt!17850 () array!2825)

(declare-datatypes ((V!2249 0))(
  ( (V!2250 (val!962 Int)) )
))
(declare-fun lt!17852 () V!2249)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1560 0))(
  ( (tuple2!1561 (_1!791 (_ BitVec 64)) (_2!791 V!2249)) )
))
(declare-datatypes ((List!1138 0))(
  ( (Nil!1135) (Cons!1134 (h!1711 tuple2!1560) (t!4091 List!1138)) )
))
(declare-datatypes ((ListLongMap!1131 0))(
  ( (ListLongMap!1132 (toList!581 List!1138)) )
))
(declare-fun lt!17854 () ListLongMap!1131)

(declare-datatypes ((ValueCell!676 0))(
  ( (ValueCellFull!676 (v!2053 V!2249)) (EmptyCell!676) )
))
(declare-datatypes ((array!2827 0))(
  ( (array!2828 (arr!1357 (Array (_ BitVec 32) ValueCell!676)) (size!1536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!332 0))(
  ( (LongMapFixedSize!333 (defaultEntry!1859 Int) (mask!5383 (_ BitVec 32)) (extraKeys!1750 (_ BitVec 32)) (zeroValue!1777 V!2249) (minValue!1777 V!2249) (_size!215 (_ BitVec 32)) (_keys!3402 array!2825) (_values!1842 array!2827) (_vacant!215 (_ BitVec 32))) )
))
(declare-fun map!794 (LongMapFixedSize!332) ListLongMap!1131)

(assert (=> b!42680 (= lt!17854 (map!794 (LongMapFixedSize!333 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17852 lt!17852 #b00000000000000000000000000000000 lt!17850 (array!2828 ((as const (Array (_ BitVec 32) ValueCell!676)) EmptyCell!676) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1139 0))(
  ( (Nil!1136) (Cons!1135 (h!1712 (_ BitVec 64)) (t!4092 List!1139)) )
))
(declare-fun arrayNoDuplicates!0 (array!2825 (_ BitVec 32) List!1139) Bool)

(assert (=> b!42680 (arrayNoDuplicates!0 lt!17850 #b00000000000000000000000000000000 Nil!1136)))

(declare-datatypes ((Unit!1165 0))(
  ( (Unit!1166) )
))
(declare-fun lt!17849 () Unit!1165)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2825 (_ BitVec 32) (_ BitVec 32) List!1139) Unit!1165)

(assert (=> b!42680 (= lt!17849 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17850 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2825 (_ BitVec 32)) Bool)

(assert (=> b!42680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17850 mask!853)))

(declare-fun lt!17853 () Unit!1165)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1165)

(assert (=> b!42680 (= lt!17853 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17850 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42680 (= (arrayCountValidKeys!0 lt!17850 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17851 () Unit!1165)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1165)

(assert (=> b!42680 (= lt!17851 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17850 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42680 (= lt!17850 (array!2826 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!233 (Int (_ BitVec 64)) V!2249)

(assert (=> b!42680 (= lt!17852 (dynLambda!233 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6372 res!25382) b!42680))

(declare-fun b_lambda!2193 () Bool)

(assert (=> (not b_lambda!2193) (not b!42680)))

(declare-fun t!4090 () Bool)

(declare-fun tb!939 () Bool)

(assert (=> (and start!6372 (= defaultEntry!470 defaultEntry!470) t!4090) tb!939))

(declare-fun result!1629 () Bool)

(declare-fun tp_is_empty!1847 () Bool)

(assert (=> tb!939 (= result!1629 tp_is_empty!1847)))

(assert (=> b!42680 t!4090))

(declare-fun b_and!2563 () Bool)

(assert (= b_and!2561 (and (=> t!4090 result!1629) b_and!2563)))

(declare-fun m!36283 () Bool)

(assert (=> start!6372 m!36283))

(declare-fun m!36285 () Bool)

(assert (=> b!42680 m!36285))

(declare-fun m!36287 () Bool)

(assert (=> b!42680 m!36287))

(declare-fun m!36289 () Bool)

(assert (=> b!42680 m!36289))

(declare-fun m!36291 () Bool)

(assert (=> b!42680 m!36291))

(declare-fun m!36293 () Bool)

(assert (=> b!42680 m!36293))

(declare-fun m!36295 () Bool)

(assert (=> b!42680 m!36295))

(declare-fun m!36297 () Bool)

(assert (=> b!42680 m!36297))

(declare-fun m!36299 () Bool)

(assert (=> b!42680 m!36299))

(push 1)

(assert tp_is_empty!1847)

(assert (not b_next!1457))

(assert (not b_lambda!2193))

(assert b_and!2563)

(assert (not start!6372))

(assert (not b!42680))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2563)

(assert (not b_next!1457))

(check-sat)

(pop 1)

