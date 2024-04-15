; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6458 () Bool)

(assert start!6458)

(declare-fun b_free!1499 () Bool)

(declare-fun b_next!1499 () Bool)

(assert (=> start!6458 (= b_free!1499 (not b_next!1499))))

(declare-fun tp!5936 () Bool)

(declare-fun b_and!2649 () Bool)

(assert (=> start!6458 (= tp!5936 b_and!2649)))

(declare-fun res!25507 () Bool)

(declare-fun e!27188 () Bool)

(assert (=> start!6458 (=> (not res!25507) (not e!27188))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6458 (= res!25507 (validMask!0 mask!853))))

(assert (=> start!6458 e!27188))

(assert (=> start!6458 true))

(assert (=> start!6458 tp!5936))

(declare-fun b!42897 () Bool)

(assert (=> b!42897 (= e!27188 (not true))))

(declare-datatypes ((V!2305 0))(
  ( (V!2306 (val!983 Int)) )
))
(declare-fun lt!18315 () V!2305)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1624 0))(
  ( (tuple2!1625 (_1!823 (_ BitVec 64)) (_2!823 V!2305)) )
))
(declare-datatypes ((List!1187 0))(
  ( (Nil!1184) (Cons!1183 (h!1760 tuple2!1624) (t!4181 List!1187)) )
))
(declare-datatypes ((ListLongMap!1189 0))(
  ( (ListLongMap!1190 (toList!610 List!1187)) )
))
(declare-fun lt!18317 () ListLongMap!1189)

(declare-datatypes ((array!2897 0))(
  ( (array!2898 (arr!1392 (Array (_ BitVec 32) (_ BitVec 64))) (size!1577 (_ BitVec 32))) )
))
(declare-fun lt!18320 () array!2897)

(declare-datatypes ((ValueCell!697 0))(
  ( (ValueCellFull!697 (v!2071 V!2305)) (EmptyCell!697) )
))
(declare-datatypes ((array!2899 0))(
  ( (array!2900 (arr!1393 (Array (_ BitVec 32) ValueCell!697)) (size!1578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!374 0))(
  ( (LongMapFixedSize!375 (defaultEntry!1880 Int) (mask!5426 (_ BitVec 32)) (extraKeys!1771 (_ BitVec 32)) (zeroValue!1798 V!2305) (minValue!1798 V!2305) (_size!236 (_ BitVec 32)) (_keys!3428 array!2897) (_values!1863 array!2899) (_vacant!236 (_ BitVec 32))) )
))
(declare-fun map!830 (LongMapFixedSize!374) ListLongMap!1189)

(assert (=> b!42897 (= lt!18317 (map!830 (LongMapFixedSize!375 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18315 lt!18315 #b00000000000000000000000000000000 lt!18320 (array!2900 ((as const (Array (_ BitVec 32) ValueCell!697)) EmptyCell!697) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1188 0))(
  ( (Nil!1185) (Cons!1184 (h!1761 (_ BitVec 64)) (t!4182 List!1188)) )
))
(declare-fun arrayNoDuplicates!0 (array!2897 (_ BitVec 32) List!1188) Bool)

(assert (=> b!42897 (arrayNoDuplicates!0 lt!18320 #b00000000000000000000000000000000 Nil!1185)))

(declare-datatypes ((Unit!1202 0))(
  ( (Unit!1203) )
))
(declare-fun lt!18316 () Unit!1202)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2897 (_ BitVec 32) (_ BitVec 32) List!1188) Unit!1202)

(assert (=> b!42897 (= lt!18316 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18320 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2897 (_ BitVec 32)) Bool)

(assert (=> b!42897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18320 mask!853)))

(declare-fun lt!18318 () Unit!1202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2897 (_ BitVec 32) (_ BitVec 32)) Unit!1202)

(assert (=> b!42897 (= lt!18318 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18320 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2897 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42897 (= (arrayCountValidKeys!0 lt!18320 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18319 () Unit!1202)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2897 (_ BitVec 32) (_ BitVec 32)) Unit!1202)

(assert (=> b!42897 (= lt!18319 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18320 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42897 (= lt!18320 (array!2898 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!257 (Int (_ BitVec 64)) V!2305)

(assert (=> b!42897 (= lt!18315 (dynLambda!257 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6458 res!25507) b!42897))

(declare-fun b_lambda!2245 () Bool)

(assert (=> (not b_lambda!2245) (not b!42897)))

(declare-fun t!4180 () Bool)

(declare-fun tb!981 () Bool)

(assert (=> (and start!6458 (= defaultEntry!470 defaultEntry!470) t!4180) tb!981))

(declare-fun result!1713 () Bool)

(declare-fun tp_is_empty!1889 () Bool)

(assert (=> tb!981 (= result!1713 tp_is_empty!1889)))

(assert (=> b!42897 t!4180))

(declare-fun b_and!2651 () Bool)

(assert (= b_and!2649 (and (=> t!4180 result!1713) b_and!2651)))

(declare-fun m!36773 () Bool)

(assert (=> start!6458 m!36773))

(declare-fun m!36775 () Bool)

(assert (=> b!42897 m!36775))

(declare-fun m!36777 () Bool)

(assert (=> b!42897 m!36777))

(declare-fun m!36779 () Bool)

(assert (=> b!42897 m!36779))

(declare-fun m!36781 () Bool)

(assert (=> b!42897 m!36781))

(declare-fun m!36783 () Bool)

(assert (=> b!42897 m!36783))

(declare-fun m!36785 () Bool)

(assert (=> b!42897 m!36785))

(declare-fun m!36787 () Bool)

(assert (=> b!42897 m!36787))

(declare-fun m!36789 () Bool)

(assert (=> b!42897 m!36789))

(push 1)

(assert b_and!2651)

(assert (not b_lambda!2245))

(assert (not b_next!1499))

(assert (not start!6458))

(assert (not b!42897))

(assert tp_is_empty!1889)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2651)

(assert (not b_next!1499))

(check-sat)

(pop 1)

