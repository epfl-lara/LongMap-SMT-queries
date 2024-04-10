; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6374 () Bool)

(assert start!6374)

(declare-fun b_free!1463 () Bool)

(declare-fun b_next!1463 () Bool)

(assert (=> start!6374 (= b_free!1463 (not b_next!1463))))

(declare-fun tp!5882 () Bool)

(declare-fun b_and!2575 () Bool)

(assert (=> start!6374 (= tp!5882 b_and!2575)))

(declare-fun res!25416 () Bool)

(declare-fun e!27097 () Bool)

(assert (=> start!6374 (=> (not res!25416) (not e!27097))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6374 (= res!25416 (validMask!0 mask!853))))

(assert (=> start!6374 e!27097))

(assert (=> start!6374 true))

(assert (=> start!6374 tp!5882))

(declare-fun b!42752 () Bool)

(assert (=> b!42752 (= e!27097 (not true))))

(declare-datatypes ((array!2851 0))(
  ( (array!2852 (arr!1369 (Array (_ BitVec 32) (_ BitVec 64))) (size!1548 (_ BitVec 32))) )
))
(declare-fun lt!17950 () array!2851)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2257 0))(
  ( (V!2258 (val!965 Int)) )
))
(declare-datatypes ((tuple2!1584 0))(
  ( (tuple2!1585 (_1!803 (_ BitVec 64)) (_2!803 V!2257)) )
))
(declare-datatypes ((List!1158 0))(
  ( (Nil!1155) (Cons!1154 (h!1731 tuple2!1584) (t!4117 List!1158)) )
))
(declare-datatypes ((ListLongMap!1161 0))(
  ( (ListLongMap!1162 (toList!596 List!1158)) )
))
(declare-fun lt!17949 () ListLongMap!1161)

(declare-fun lt!17947 () V!2257)

(declare-datatypes ((ValueCell!679 0))(
  ( (ValueCellFull!679 (v!2055 V!2257)) (EmptyCell!679) )
))
(declare-datatypes ((array!2853 0))(
  ( (array!2854 (arr!1370 (Array (_ BitVec 32) ValueCell!679)) (size!1549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!338 0))(
  ( (LongMapFixedSize!339 (defaultEntry!1862 Int) (mask!5388 (_ BitVec 32)) (extraKeys!1753 (_ BitVec 32)) (zeroValue!1780 V!2257) (minValue!1780 V!2257) (_size!218 (_ BitVec 32)) (_keys!3405 array!2851) (_values!1845 array!2853) (_vacant!218 (_ BitVec 32))) )
))
(declare-fun map!799 (LongMapFixedSize!338) ListLongMap!1161)

(assert (=> b!42752 (= lt!17949 (map!799 (LongMapFixedSize!339 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17947 lt!17947 #b00000000000000000000000000000000 lt!17950 (array!2854 ((as const (Array (_ BitVec 32) ValueCell!679)) EmptyCell!679) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1159 0))(
  ( (Nil!1156) (Cons!1155 (h!1732 (_ BitVec 64)) (t!4118 List!1159)) )
))
(declare-fun arrayNoDuplicates!0 (array!2851 (_ BitVec 32) List!1159) Bool)

(assert (=> b!42752 (arrayNoDuplicates!0 lt!17950 #b00000000000000000000000000000000 Nil!1156)))

(declare-datatypes ((Unit!1159 0))(
  ( (Unit!1160) )
))
(declare-fun lt!17948 () Unit!1159)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2851 (_ BitVec 32) (_ BitVec 32) List!1159) Unit!1159)

(assert (=> b!42752 (= lt!17948 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17950 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2851 (_ BitVec 32)) Bool)

(assert (=> b!42752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17950 mask!853)))

(declare-fun lt!17951 () Unit!1159)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2851 (_ BitVec 32) (_ BitVec 32)) Unit!1159)

(assert (=> b!42752 (= lt!17951 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17950 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2851 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42752 (= (arrayCountValidKeys!0 lt!17950 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17946 () Unit!1159)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2851 (_ BitVec 32) (_ BitVec 32)) Unit!1159)

(assert (=> b!42752 (= lt!17946 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17950 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42752 (= lt!17950 (array!2852 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!240 (Int (_ BitVec 64)) V!2257)

(assert (=> b!42752 (= lt!17947 (dynLambda!240 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6374 res!25416) b!42752))

(declare-fun b_lambda!2199 () Bool)

(assert (=> (not b_lambda!2199) (not b!42752)))

(declare-fun t!4116 () Bool)

(declare-fun tb!945 () Bool)

(assert (=> (and start!6374 (= defaultEntry!470 defaultEntry!470) t!4116) tb!945))

(declare-fun result!1641 () Bool)

(declare-fun tp_is_empty!1853 () Bool)

(assert (=> tb!945 (= result!1641 tp_is_empty!1853)))

(assert (=> b!42752 t!4116))

(declare-fun b_and!2577 () Bool)

(assert (= b_and!2575 (and (=> t!4116 result!1641) b_and!2577)))

(declare-fun m!36461 () Bool)

(assert (=> start!6374 m!36461))

(declare-fun m!36463 () Bool)

(assert (=> b!42752 m!36463))

(declare-fun m!36465 () Bool)

(assert (=> b!42752 m!36465))

(declare-fun m!36467 () Bool)

(assert (=> b!42752 m!36467))

(declare-fun m!36469 () Bool)

(assert (=> b!42752 m!36469))

(declare-fun m!36471 () Bool)

(assert (=> b!42752 m!36471))

(declare-fun m!36473 () Bool)

(assert (=> b!42752 m!36473))

(declare-fun m!36475 () Bool)

(assert (=> b!42752 m!36475))

(declare-fun m!36477 () Bool)

(assert (=> b!42752 m!36477))

(push 1)

(assert (not b!42752))

(assert (not b_lambda!2199))

(assert (not start!6374))

(assert (not b_next!1463))

(assert b_and!2577)

(assert tp_is_empty!1853)

(check-sat)

(pop 1)

(push 1)

