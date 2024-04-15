; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6452 () Bool)

(assert start!6452)

(declare-fun b_free!1493 () Bool)

(declare-fun b_next!1493 () Bool)

(assert (=> start!6452 (= b_free!1493 (not b_next!1493))))

(declare-fun tp!5927 () Bool)

(declare-fun b_and!2637 () Bool)

(assert (=> start!6452 (= tp!5927 b_and!2637)))

(declare-fun res!25498 () Bool)

(declare-fun e!27179 () Bool)

(assert (=> start!6452 (=> (not res!25498) (not e!27179))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6452 (= res!25498 (validMask!0 mask!853))))

(assert (=> start!6452 e!27179))

(assert (=> start!6452 true))

(assert (=> start!6452 tp!5927))

(declare-fun b!42882 () Bool)

(assert (=> b!42882 (= e!27179 (not true))))

(declare-datatypes ((V!2297 0))(
  ( (V!2298 (val!980 Int)) )
))
(declare-fun lt!18264 () V!2297)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2885 0))(
  ( (array!2886 (arr!1386 (Array (_ BitVec 32) (_ BitVec 64))) (size!1571 (_ BitVec 32))) )
))
(declare-fun lt!18266 () array!2885)

(declare-datatypes ((tuple2!1618 0))(
  ( (tuple2!1619 (_1!820 (_ BitVec 64)) (_2!820 V!2297)) )
))
(declare-datatypes ((List!1181 0))(
  ( (Nil!1178) (Cons!1177 (h!1754 tuple2!1618) (t!4169 List!1181)) )
))
(declare-datatypes ((ListLongMap!1183 0))(
  ( (ListLongMap!1184 (toList!607 List!1181)) )
))
(declare-fun lt!18261 () ListLongMap!1183)

(declare-datatypes ((ValueCell!694 0))(
  ( (ValueCellFull!694 (v!2068 V!2297)) (EmptyCell!694) )
))
(declare-datatypes ((array!2887 0))(
  ( (array!2888 (arr!1387 (Array (_ BitVec 32) ValueCell!694)) (size!1572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!368 0))(
  ( (LongMapFixedSize!369 (defaultEntry!1877 Int) (mask!5421 (_ BitVec 32)) (extraKeys!1768 (_ BitVec 32)) (zeroValue!1795 V!2297) (minValue!1795 V!2297) (_size!233 (_ BitVec 32)) (_keys!3425 array!2885) (_values!1860 array!2887) (_vacant!233 (_ BitVec 32))) )
))
(declare-fun map!825 (LongMapFixedSize!368) ListLongMap!1183)

(assert (=> b!42882 (= lt!18261 (map!825 (LongMapFixedSize!369 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18264 lt!18264 #b00000000000000000000000000000000 lt!18266 (array!2888 ((as const (Array (_ BitVec 32) ValueCell!694)) EmptyCell!694) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1182 0))(
  ( (Nil!1179) (Cons!1178 (h!1755 (_ BitVec 64)) (t!4170 List!1182)) )
))
(declare-fun arrayNoDuplicates!0 (array!2885 (_ BitVec 32) List!1182) Bool)

(assert (=> b!42882 (arrayNoDuplicates!0 lt!18266 #b00000000000000000000000000000000 Nil!1179)))

(declare-datatypes ((Unit!1196 0))(
  ( (Unit!1197) )
))
(declare-fun lt!18265 () Unit!1196)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2885 (_ BitVec 32) (_ BitVec 32) List!1182) Unit!1196)

(assert (=> b!42882 (= lt!18265 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18266 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2885 (_ BitVec 32)) Bool)

(assert (=> b!42882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18266 mask!853)))

(declare-fun lt!18263 () Unit!1196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2885 (_ BitVec 32) (_ BitVec 32)) Unit!1196)

(assert (=> b!42882 (= lt!18263 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18266 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2885 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42882 (= (arrayCountValidKeys!0 lt!18266 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18262 () Unit!1196)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2885 (_ BitVec 32) (_ BitVec 32)) Unit!1196)

(assert (=> b!42882 (= lt!18262 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18266 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42882 (= lt!18266 (array!2886 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!254 (Int (_ BitVec 64)) V!2297)

(assert (=> b!42882 (= lt!18264 (dynLambda!254 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6452 res!25498) b!42882))

(declare-fun b_lambda!2239 () Bool)

(assert (=> (not b_lambda!2239) (not b!42882)))

(declare-fun t!4168 () Bool)

(declare-fun tb!975 () Bool)

(assert (=> (and start!6452 (= defaultEntry!470 defaultEntry!470) t!4168) tb!975))

(declare-fun result!1701 () Bool)

(declare-fun tp_is_empty!1883 () Bool)

(assert (=> tb!975 (= result!1701 tp_is_empty!1883)))

(assert (=> b!42882 t!4168))

(declare-fun b_and!2639 () Bool)

(assert (= b_and!2637 (and (=> t!4168 result!1701) b_and!2639)))

(declare-fun m!36719 () Bool)

(assert (=> start!6452 m!36719))

(declare-fun m!36721 () Bool)

(assert (=> b!42882 m!36721))

(declare-fun m!36723 () Bool)

(assert (=> b!42882 m!36723))

(declare-fun m!36725 () Bool)

(assert (=> b!42882 m!36725))

(declare-fun m!36727 () Bool)

(assert (=> b!42882 m!36727))

(declare-fun m!36729 () Bool)

(assert (=> b!42882 m!36729))

(declare-fun m!36731 () Bool)

(assert (=> b!42882 m!36731))

(declare-fun m!36733 () Bool)

(assert (=> b!42882 m!36733))

(declare-fun m!36735 () Bool)

(assert (=> b!42882 m!36735))

(push 1)

(assert (not b_next!1493))

(assert b_and!2639)

(assert (not b_lambda!2239))

(assert tp_is_empty!1883)

(assert (not b!42882))

(assert (not start!6452))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2639)

(assert (not b_next!1493))

(check-sat)

(pop 1)

