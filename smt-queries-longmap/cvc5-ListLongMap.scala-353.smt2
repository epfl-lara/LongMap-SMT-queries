; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6468 () Bool)

(assert start!6468)

(declare-fun b_free!1499 () Bool)

(declare-fun b_next!1499 () Bool)

(assert (=> start!6468 (= b_free!1499 (not b_next!1499))))

(declare-fun tp!5936 () Bool)

(declare-fun b_and!2645 () Bool)

(assert (=> start!6468 (= tp!5936 b_and!2645)))

(declare-fun res!25508 () Bool)

(declare-fun e!27204 () Bool)

(assert (=> start!6468 (=> (not res!25508) (not e!27204))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6468 (= res!25508 (validMask!0 mask!853))))

(assert (=> start!6468 e!27204))

(assert (=> start!6468 true))

(assert (=> start!6468 tp!5936))

(declare-fun b!42920 () Bool)

(assert (=> b!42920 (= e!27204 (not true))))

(declare-datatypes ((V!2305 0))(
  ( (V!2306 (val!983 Int)) )
))
(declare-fun lt!18293 () V!2305)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1602 0))(
  ( (tuple2!1603 (_1!812 (_ BitVec 64)) (_2!812 V!2305)) )
))
(declare-datatypes ((List!1180 0))(
  ( (Nil!1177) (Cons!1176 (h!1753 tuple2!1602) (t!4175 List!1180)) )
))
(declare-datatypes ((ListLongMap!1173 0))(
  ( (ListLongMap!1174 (toList!602 List!1180)) )
))
(declare-fun lt!18290 () ListLongMap!1173)

(declare-datatypes ((array!2909 0))(
  ( (array!2910 (arr!1398 (Array (_ BitVec 32) (_ BitVec 64))) (size!1583 (_ BitVec 32))) )
))
(declare-fun lt!18294 () array!2909)

(declare-datatypes ((ValueCell!697 0))(
  ( (ValueCellFull!697 (v!2074 V!2305)) (EmptyCell!697) )
))
(declare-datatypes ((array!2911 0))(
  ( (array!2912 (arr!1399 (Array (_ BitVec 32) ValueCell!697)) (size!1584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!374 0))(
  ( (LongMapFixedSize!375 (defaultEntry!1880 Int) (mask!5427 (_ BitVec 32)) (extraKeys!1771 (_ BitVec 32)) (zeroValue!1798 V!2305) (minValue!1798 V!2305) (_size!236 (_ BitVec 32)) (_keys!3429 array!2909) (_values!1863 array!2911) (_vacant!236 (_ BitVec 32))) )
))
(declare-fun map!829 (LongMapFixedSize!374) ListLongMap!1173)

(assert (=> b!42920 (= lt!18290 (map!829 (LongMapFixedSize!375 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18293 lt!18293 #b00000000000000000000000000000000 lt!18294 (array!2912 ((as const (Array (_ BitVec 32) ValueCell!697)) EmptyCell!697) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1181 0))(
  ( (Nil!1178) (Cons!1177 (h!1754 (_ BitVec 64)) (t!4176 List!1181)) )
))
(declare-fun arrayNoDuplicates!0 (array!2909 (_ BitVec 32) List!1181) Bool)

(assert (=> b!42920 (arrayNoDuplicates!0 lt!18294 #b00000000000000000000000000000000 Nil!1178)))

(declare-datatypes ((Unit!1207 0))(
  ( (Unit!1208) )
))
(declare-fun lt!18292 () Unit!1207)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2909 (_ BitVec 32) (_ BitVec 32) List!1181) Unit!1207)

(assert (=> b!42920 (= lt!18292 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18294 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2909 (_ BitVec 32)) Bool)

(assert (=> b!42920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18294 mask!853)))

(declare-fun lt!18295 () Unit!1207)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2909 (_ BitVec 32) (_ BitVec 32)) Unit!1207)

(assert (=> b!42920 (= lt!18295 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18294 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2909 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42920 (= (arrayCountValidKeys!0 lt!18294 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18291 () Unit!1207)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2909 (_ BitVec 32) (_ BitVec 32)) Unit!1207)

(assert (=> b!42920 (= lt!18291 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18294 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42920 (= lt!18294 (array!2910 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!254 (Int (_ BitVec 64)) V!2305)

(assert (=> b!42920 (= lt!18293 (dynLambda!254 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6468 res!25508) b!42920))

(declare-fun b_lambda!2241 () Bool)

(assert (=> (not b_lambda!2241) (not b!42920)))

(declare-fun t!4174 () Bool)

(declare-fun tb!981 () Bool)

(assert (=> (and start!6468 (= defaultEntry!470 defaultEntry!470) t!4174) tb!981))

(declare-fun result!1713 () Bool)

(declare-fun tp_is_empty!1889 () Bool)

(assert (=> tb!981 (= result!1713 tp_is_empty!1889)))

(assert (=> b!42920 t!4174))

(declare-fun b_and!2647 () Bool)

(assert (= b_and!2645 (and (=> t!4174 result!1713) b_and!2647)))

(declare-fun m!36745 () Bool)

(assert (=> start!6468 m!36745))

(declare-fun m!36747 () Bool)

(assert (=> b!42920 m!36747))

(declare-fun m!36749 () Bool)

(assert (=> b!42920 m!36749))

(declare-fun m!36751 () Bool)

(assert (=> b!42920 m!36751))

(declare-fun m!36753 () Bool)

(assert (=> b!42920 m!36753))

(declare-fun m!36755 () Bool)

(assert (=> b!42920 m!36755))

(declare-fun m!36757 () Bool)

(assert (=> b!42920 m!36757))

(declare-fun m!36759 () Bool)

(assert (=> b!42920 m!36759))

(declare-fun m!36761 () Bool)

(assert (=> b!42920 m!36761))

(push 1)

(assert b_and!2647)

(assert tp_is_empty!1889)

(assert (not b_lambda!2241))

(assert (not start!6468))

(assert (not b!42920))

(assert (not b_next!1499))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2647)

(assert (not b_next!1499))

(check-sat)

(pop 1)

