; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6462 () Bool)

(assert start!6462)

(declare-fun b_free!1493 () Bool)

(declare-fun b_next!1493 () Bool)

(assert (=> start!6462 (= b_free!1493 (not b_next!1493))))

(declare-fun tp!5927 () Bool)

(declare-fun b_and!2633 () Bool)

(assert (=> start!6462 (= tp!5927 b_and!2633)))

(declare-fun res!25499 () Bool)

(declare-fun e!27195 () Bool)

(assert (=> start!6462 (=> (not res!25499) (not e!27195))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6462 (= res!25499 (validMask!0 mask!853))))

(assert (=> start!6462 e!27195))

(assert (=> start!6462 true))

(assert (=> start!6462 tp!5927))

(declare-fun b!42905 () Bool)

(assert (=> b!42905 (= e!27195 (not true))))

(declare-datatypes ((V!2297 0))(
  ( (V!2298 (val!980 Int)) )
))
(declare-datatypes ((tuple2!1596 0))(
  ( (tuple2!1597 (_1!809 (_ BitVec 64)) (_2!809 V!2297)) )
))
(declare-datatypes ((List!1174 0))(
  ( (Nil!1171) (Cons!1170 (h!1747 tuple2!1596) (t!4163 List!1174)) )
))
(declare-datatypes ((ListLongMap!1167 0))(
  ( (ListLongMap!1168 (toList!599 List!1174)) )
))
(declare-fun lt!18236 () ListLongMap!1167)

(declare-fun lt!18240 () V!2297)

(declare-datatypes ((array!2897 0))(
  ( (array!2898 (arr!1392 (Array (_ BitVec 32) (_ BitVec 64))) (size!1577 (_ BitVec 32))) )
))
(declare-fun lt!18238 () array!2897)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!694 0))(
  ( (ValueCellFull!694 (v!2071 V!2297)) (EmptyCell!694) )
))
(declare-datatypes ((array!2899 0))(
  ( (array!2900 (arr!1393 (Array (_ BitVec 32) ValueCell!694)) (size!1578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!368 0))(
  ( (LongMapFixedSize!369 (defaultEntry!1877 Int) (mask!5422 (_ BitVec 32)) (extraKeys!1768 (_ BitVec 32)) (zeroValue!1795 V!2297) (minValue!1795 V!2297) (_size!233 (_ BitVec 32)) (_keys!3426 array!2897) (_values!1860 array!2899) (_vacant!233 (_ BitVec 32))) )
))
(declare-fun map!824 (LongMapFixedSize!368) ListLongMap!1167)

(assert (=> b!42905 (= lt!18236 (map!824 (LongMapFixedSize!369 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18240 lt!18240 #b00000000000000000000000000000000 lt!18238 (array!2900 ((as const (Array (_ BitVec 32) ValueCell!694)) EmptyCell!694) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1175 0))(
  ( (Nil!1172) (Cons!1171 (h!1748 (_ BitVec 64)) (t!4164 List!1175)) )
))
(declare-fun arrayNoDuplicates!0 (array!2897 (_ BitVec 32) List!1175) Bool)

(assert (=> b!42905 (arrayNoDuplicates!0 lt!18238 #b00000000000000000000000000000000 Nil!1172)))

(declare-datatypes ((Unit!1201 0))(
  ( (Unit!1202) )
))
(declare-fun lt!18237 () Unit!1201)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2897 (_ BitVec 32) (_ BitVec 32) List!1175) Unit!1201)

(assert (=> b!42905 (= lt!18237 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18238 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2897 (_ BitVec 32)) Bool)

(assert (=> b!42905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18238 mask!853)))

(declare-fun lt!18239 () Unit!1201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2897 (_ BitVec 32) (_ BitVec 32)) Unit!1201)

(assert (=> b!42905 (= lt!18239 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18238 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2897 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42905 (= (arrayCountValidKeys!0 lt!18238 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18241 () Unit!1201)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2897 (_ BitVec 32) (_ BitVec 32)) Unit!1201)

(assert (=> b!42905 (= lt!18241 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18238 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42905 (= lt!18238 (array!2898 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!251 (Int (_ BitVec 64)) V!2297)

(assert (=> b!42905 (= lt!18240 (dynLambda!251 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6462 res!25499) b!42905))

(declare-fun b_lambda!2235 () Bool)

(assert (=> (not b_lambda!2235) (not b!42905)))

(declare-fun t!4162 () Bool)

(declare-fun tb!975 () Bool)

(assert (=> (and start!6462 (= defaultEntry!470 defaultEntry!470) t!4162) tb!975))

(declare-fun result!1701 () Bool)

(declare-fun tp_is_empty!1883 () Bool)

(assert (=> tb!975 (= result!1701 tp_is_empty!1883)))

(assert (=> b!42905 t!4162))

(declare-fun b_and!2635 () Bool)

(assert (= b_and!2633 (and (=> t!4162 result!1701) b_and!2635)))

(declare-fun m!36691 () Bool)

(assert (=> start!6462 m!36691))

(declare-fun m!36693 () Bool)

(assert (=> b!42905 m!36693))

(declare-fun m!36695 () Bool)

(assert (=> b!42905 m!36695))

(declare-fun m!36697 () Bool)

(assert (=> b!42905 m!36697))

(declare-fun m!36699 () Bool)

(assert (=> b!42905 m!36699))

(declare-fun m!36701 () Bool)

(assert (=> b!42905 m!36701))

(declare-fun m!36703 () Bool)

(assert (=> b!42905 m!36703))

(declare-fun m!36705 () Bool)

(assert (=> b!42905 m!36705))

(declare-fun m!36707 () Bool)

(assert (=> b!42905 m!36707))

(push 1)

(assert tp_is_empty!1883)

(assert (not b_next!1493))

(assert (not start!6462))

(assert (not b_lambda!2235))

(assert (not b!42905))

(assert b_and!2635)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2635)

(assert (not b_next!1493))

(check-sat)

(pop 1)

