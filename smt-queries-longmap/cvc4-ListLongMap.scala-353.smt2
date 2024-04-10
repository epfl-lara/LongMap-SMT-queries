; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6464 () Bool)

(assert start!6464)

(declare-fun b_free!1499 () Bool)

(declare-fun b_next!1499 () Bool)

(assert (=> start!6464 (= b_free!1499 (not b_next!1499))))

(declare-fun tp!5936 () Bool)

(declare-fun b_and!2647 () Bool)

(assert (=> start!6464 (= tp!5936 b_and!2647)))

(declare-fun res!25533 () Bool)

(declare-fun e!27241 () Bool)

(assert (=> start!6464 (=> (not res!25533) (not e!27241))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6464 (= res!25533 (validMask!0 mask!853))))

(assert (=> start!6464 e!27241))

(assert (=> start!6464 true))

(assert (=> start!6464 tp!5936))

(declare-fun b!42977 () Bool)

(assert (=> b!42977 (= e!27241 (not true))))

(declare-datatypes ((V!2305 0))(
  ( (V!2306 (val!983 Int)) )
))
(declare-fun lt!18333 () V!2305)

(declare-datatypes ((tuple2!1620 0))(
  ( (tuple2!1621 (_1!821 (_ BitVec 64)) (_2!821 V!2305)) )
))
(declare-datatypes ((List!1194 0))(
  ( (Nil!1191) (Cons!1190 (h!1767 tuple2!1620) (t!4189 List!1194)) )
))
(declare-datatypes ((ListLongMap!1197 0))(
  ( (ListLongMap!1198 (toList!614 List!1194)) )
))
(declare-fun lt!18334 () ListLongMap!1197)

(declare-datatypes ((array!2923 0))(
  ( (array!2924 (arr!1405 (Array (_ BitVec 32) (_ BitVec 64))) (size!1590 (_ BitVec 32))) )
))
(declare-fun lt!18338 () array!2923)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!697 0))(
  ( (ValueCellFull!697 (v!2073 V!2305)) (EmptyCell!697) )
))
(declare-datatypes ((array!2925 0))(
  ( (array!2926 (arr!1406 (Array (_ BitVec 32) ValueCell!697)) (size!1591 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!374 0))(
  ( (LongMapFixedSize!375 (defaultEntry!1880 Int) (mask!5427 (_ BitVec 32)) (extraKeys!1771 (_ BitVec 32)) (zeroValue!1798 V!2305) (minValue!1798 V!2305) (_size!236 (_ BitVec 32)) (_keys!3429 array!2923) (_values!1863 array!2925) (_vacant!236 (_ BitVec 32))) )
))
(declare-fun map!829 (LongMapFixedSize!374) ListLongMap!1197)

(assert (=> b!42977 (= lt!18334 (map!829 (LongMapFixedSize!375 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18333 lt!18333 #b00000000000000000000000000000000 lt!18338 (array!2926 ((as const (Array (_ BitVec 32) ValueCell!697)) EmptyCell!697) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1195 0))(
  ( (Nil!1192) (Cons!1191 (h!1768 (_ BitVec 64)) (t!4190 List!1195)) )
))
(declare-fun arrayNoDuplicates!0 (array!2923 (_ BitVec 32) List!1195) Bool)

(assert (=> b!42977 (arrayNoDuplicates!0 lt!18338 #b00000000000000000000000000000000 Nil!1192)))

(declare-datatypes ((Unit!1195 0))(
  ( (Unit!1196) )
))
(declare-fun lt!18337 () Unit!1195)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2923 (_ BitVec 32) (_ BitVec 32) List!1195) Unit!1195)

(assert (=> b!42977 (= lt!18337 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2923 (_ BitVec 32)) Bool)

(assert (=> b!42977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18338 mask!853)))

(declare-fun lt!18335 () Unit!1195)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2923 (_ BitVec 32) (_ BitVec 32)) Unit!1195)

(assert (=> b!42977 (= lt!18335 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18338 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2923 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42977 (= (arrayCountValidKeys!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18336 () Unit!1195)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2923 (_ BitVec 32) (_ BitVec 32)) Unit!1195)

(assert (=> b!42977 (= lt!18336 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42977 (= lt!18338 (array!2924 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!258 (Int (_ BitVec 64)) V!2305)

(assert (=> b!42977 (= lt!18333 (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6464 res!25533) b!42977))

(declare-fun b_lambda!2241 () Bool)

(assert (=> (not b_lambda!2241) (not b!42977)))

(declare-fun t!4188 () Bool)

(declare-fun tb!981 () Bool)

(assert (=> (and start!6464 (= defaultEntry!470 defaultEntry!470) t!4188) tb!981))

(declare-fun result!1713 () Bool)

(declare-fun tp_is_empty!1889 () Bool)

(assert (=> tb!981 (= result!1713 tp_is_empty!1889)))

(assert (=> b!42977 t!4188))

(declare-fun b_and!2649 () Bool)

(assert (= b_and!2647 (and (=> t!4188 result!1713) b_and!2649)))

(declare-fun m!36869 () Bool)

(assert (=> start!6464 m!36869))

(declare-fun m!36871 () Bool)

(assert (=> b!42977 m!36871))

(declare-fun m!36873 () Bool)

(assert (=> b!42977 m!36873))

(declare-fun m!36875 () Bool)

(assert (=> b!42977 m!36875))

(declare-fun m!36877 () Bool)

(assert (=> b!42977 m!36877))

(declare-fun m!36879 () Bool)

(assert (=> b!42977 m!36879))

(declare-fun m!36881 () Bool)

(assert (=> b!42977 m!36881))

(declare-fun m!36883 () Bool)

(assert (=> b!42977 m!36883))

(declare-fun m!36885 () Bool)

(assert (=> b!42977 m!36885))

(push 1)

(assert (not start!6464))

(assert b_and!2649)

(assert tp_is_empty!1889)

(assert (not b!42977))

(assert (not b_next!1499))

(assert (not b_lambda!2241))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2649)

(assert (not b_next!1499))

(check-sat)

(pop 1)

