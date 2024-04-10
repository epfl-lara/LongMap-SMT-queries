; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6458 () Bool)

(assert start!6458)

(declare-fun b_free!1493 () Bool)

(declare-fun b_next!1493 () Bool)

(assert (=> start!6458 (= b_free!1493 (not b_next!1493))))

(declare-fun tp!5927 () Bool)

(declare-fun b_and!2635 () Bool)

(assert (=> start!6458 (= tp!5927 b_and!2635)))

(declare-fun res!25524 () Bool)

(declare-fun e!27232 () Bool)

(assert (=> start!6458 (=> (not res!25524) (not e!27232))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6458 (= res!25524 (validMask!0 mask!853))))

(assert (=> start!6458 e!27232))

(assert (=> start!6458 true))

(assert (=> start!6458 tp!5927))

(declare-fun b!42962 () Bool)

(assert (=> b!42962 (= e!27232 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2297 0))(
  ( (V!2298 (val!980 Int)) )
))
(declare-fun lt!18283 () V!2297)

(declare-datatypes ((tuple2!1614 0))(
  ( (tuple2!1615 (_1!818 (_ BitVec 64)) (_2!818 V!2297)) )
))
(declare-datatypes ((List!1188 0))(
  ( (Nil!1185) (Cons!1184 (h!1761 tuple2!1614) (t!4177 List!1188)) )
))
(declare-datatypes ((ListLongMap!1191 0))(
  ( (ListLongMap!1192 (toList!611 List!1188)) )
))
(declare-fun lt!18280 () ListLongMap!1191)

(declare-datatypes ((array!2911 0))(
  ( (array!2912 (arr!1399 (Array (_ BitVec 32) (_ BitVec 64))) (size!1584 (_ BitVec 32))) )
))
(declare-fun lt!18281 () array!2911)

(declare-datatypes ((ValueCell!694 0))(
  ( (ValueCellFull!694 (v!2070 V!2297)) (EmptyCell!694) )
))
(declare-datatypes ((array!2913 0))(
  ( (array!2914 (arr!1400 (Array (_ BitVec 32) ValueCell!694)) (size!1585 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!368 0))(
  ( (LongMapFixedSize!369 (defaultEntry!1877 Int) (mask!5422 (_ BitVec 32)) (extraKeys!1768 (_ BitVec 32)) (zeroValue!1795 V!2297) (minValue!1795 V!2297) (_size!233 (_ BitVec 32)) (_keys!3426 array!2911) (_values!1860 array!2913) (_vacant!233 (_ BitVec 32))) )
))
(declare-fun map!824 (LongMapFixedSize!368) ListLongMap!1191)

(assert (=> b!42962 (= lt!18280 (map!824 (LongMapFixedSize!369 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18283 lt!18283 #b00000000000000000000000000000000 lt!18281 (array!2914 ((as const (Array (_ BitVec 32) ValueCell!694)) EmptyCell!694) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1189 0))(
  ( (Nil!1186) (Cons!1185 (h!1762 (_ BitVec 64)) (t!4178 List!1189)) )
))
(declare-fun arrayNoDuplicates!0 (array!2911 (_ BitVec 32) List!1189) Bool)

(assert (=> b!42962 (arrayNoDuplicates!0 lt!18281 #b00000000000000000000000000000000 Nil!1186)))

(declare-datatypes ((Unit!1189 0))(
  ( (Unit!1190) )
))
(declare-fun lt!18284 () Unit!1189)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2911 (_ BitVec 32) (_ BitVec 32) List!1189) Unit!1189)

(assert (=> b!42962 (= lt!18284 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18281 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2911 (_ BitVec 32)) Bool)

(assert (=> b!42962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18281 mask!853)))

(declare-fun lt!18282 () Unit!1189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2911 (_ BitVec 32) (_ BitVec 32)) Unit!1189)

(assert (=> b!42962 (= lt!18282 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18281 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2911 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42962 (= (arrayCountValidKeys!0 lt!18281 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18279 () Unit!1189)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2911 (_ BitVec 32) (_ BitVec 32)) Unit!1189)

(assert (=> b!42962 (= lt!18279 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18281 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42962 (= lt!18281 (array!2912 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!255 (Int (_ BitVec 64)) V!2297)

(assert (=> b!42962 (= lt!18283 (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6458 res!25524) b!42962))

(declare-fun b_lambda!2235 () Bool)

(assert (=> (not b_lambda!2235) (not b!42962)))

(declare-fun t!4176 () Bool)

(declare-fun tb!975 () Bool)

(assert (=> (and start!6458 (= defaultEntry!470 defaultEntry!470) t!4176) tb!975))

(declare-fun result!1701 () Bool)

(declare-fun tp_is_empty!1883 () Bool)

(assert (=> tb!975 (= result!1701 tp_is_empty!1883)))

(assert (=> b!42962 t!4176))

(declare-fun b_and!2637 () Bool)

(assert (= b_and!2635 (and (=> t!4176 result!1701) b_and!2637)))

(declare-fun m!36815 () Bool)

(assert (=> start!6458 m!36815))

(declare-fun m!36817 () Bool)

(assert (=> b!42962 m!36817))

(declare-fun m!36819 () Bool)

(assert (=> b!42962 m!36819))

(declare-fun m!36821 () Bool)

(assert (=> b!42962 m!36821))

(declare-fun m!36823 () Bool)

(assert (=> b!42962 m!36823))

(declare-fun m!36825 () Bool)

(assert (=> b!42962 m!36825))

(declare-fun m!36827 () Bool)

(assert (=> b!42962 m!36827))

(declare-fun m!36829 () Bool)

(assert (=> b!42962 m!36829))

(declare-fun m!36831 () Bool)

(assert (=> b!42962 m!36831))

(push 1)

(assert (not b_lambda!2235))

(assert (not b!42962))

(assert (not start!6458))

(assert tp_is_empty!1883)

(assert b_and!2637)

(assert (not b_next!1493))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2637)

(assert (not b_next!1493))

(check-sat)

(pop 1)

