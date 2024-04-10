; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6444 () Bool)

(assert start!6444)

(declare-fun b_free!1479 () Bool)

(declare-fun b_next!1479 () Bool)

(assert (=> start!6444 (= b_free!1479 (not b_next!1479))))

(declare-fun tp!5906 () Bool)

(declare-fun b_and!2607 () Bool)

(assert (=> start!6444 (= tp!5906 b_and!2607)))

(declare-fun res!25503 () Bool)

(declare-fun e!27211 () Bool)

(assert (=> start!6444 (=> (not res!25503) (not e!27211))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6444 (= res!25503 (validMask!0 mask!853))))

(assert (=> start!6444 e!27211))

(assert (=> start!6444 true))

(assert (=> start!6444 tp!5906))

(declare-fun b!42927 () Bool)

(assert (=> b!42927 (= e!27211 (not true))))

(declare-datatypes ((V!2279 0))(
  ( (V!2280 (val!973 Int)) )
))
(declare-datatypes ((tuple2!1600 0))(
  ( (tuple2!1601 (_1!811 (_ BitVec 64)) (_2!811 V!2279)) )
))
(declare-datatypes ((List!1174 0))(
  ( (Nil!1171) (Cons!1170 (h!1747 tuple2!1600) (t!4149 List!1174)) )
))
(declare-datatypes ((ListLongMap!1177 0))(
  ( (ListLongMap!1178 (toList!604 List!1174)) )
))
(declare-fun lt!18158 () ListLongMap!1177)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2883 0))(
  ( (array!2884 (arr!1385 (Array (_ BitVec 32) (_ BitVec 64))) (size!1570 (_ BitVec 32))) )
))
(declare-fun lt!18155 () array!2883)

(declare-fun lt!18153 () V!2279)

(declare-datatypes ((ValueCell!687 0))(
  ( (ValueCellFull!687 (v!2063 V!2279)) (EmptyCell!687) )
))
(declare-datatypes ((array!2885 0))(
  ( (array!2886 (arr!1386 (Array (_ BitVec 32) ValueCell!687)) (size!1571 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!354 0))(
  ( (LongMapFixedSize!355 (defaultEntry!1870 Int) (mask!5411 (_ BitVec 32)) (extraKeys!1761 (_ BitVec 32)) (zeroValue!1788 V!2279) (minValue!1788 V!2279) (_size!226 (_ BitVec 32)) (_keys!3419 array!2883) (_values!1853 array!2885) (_vacant!226 (_ BitVec 32))) )
))
(declare-fun map!813 (LongMapFixedSize!354) ListLongMap!1177)

(assert (=> b!42927 (= lt!18158 (map!813 (LongMapFixedSize!355 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18153 lt!18153 #b00000000000000000000000000000000 lt!18155 (array!2886 ((as const (Array (_ BitVec 32) ValueCell!687)) EmptyCell!687) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1175 0))(
  ( (Nil!1172) (Cons!1171 (h!1748 (_ BitVec 64)) (t!4150 List!1175)) )
))
(declare-fun arrayNoDuplicates!0 (array!2883 (_ BitVec 32) List!1175) Bool)

(assert (=> b!42927 (arrayNoDuplicates!0 lt!18155 #b00000000000000000000000000000000 Nil!1172)))

(declare-datatypes ((Unit!1175 0))(
  ( (Unit!1176) )
))
(declare-fun lt!18156 () Unit!1175)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2883 (_ BitVec 32) (_ BitVec 32) List!1175) Unit!1175)

(assert (=> b!42927 (= lt!18156 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18155 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2883 (_ BitVec 32)) Bool)

(assert (=> b!42927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18155 mask!853)))

(declare-fun lt!18157 () Unit!1175)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2883 (_ BitVec 32) (_ BitVec 32)) Unit!1175)

(assert (=> b!42927 (= lt!18157 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18155 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2883 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42927 (= (arrayCountValidKeys!0 lt!18155 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18154 () Unit!1175)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2883 (_ BitVec 32) (_ BitVec 32)) Unit!1175)

(assert (=> b!42927 (= lt!18154 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18155 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42927 (= lt!18155 (array!2884 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!248 (Int (_ BitVec 64)) V!2279)

(assert (=> b!42927 (= lt!18153 (dynLambda!248 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6444 res!25503) b!42927))

(declare-fun b_lambda!2221 () Bool)

(assert (=> (not b_lambda!2221) (not b!42927)))

(declare-fun t!4148 () Bool)

(declare-fun tb!961 () Bool)

(assert (=> (and start!6444 (= defaultEntry!470 defaultEntry!470) t!4148) tb!961))

(declare-fun result!1673 () Bool)

(declare-fun tp_is_empty!1869 () Bool)

(assert (=> tb!961 (= result!1673 tp_is_empty!1869)))

(assert (=> b!42927 t!4148))

(declare-fun b_and!2609 () Bool)

(assert (= b_and!2607 (and (=> t!4148 result!1673) b_and!2609)))

(declare-fun m!36689 () Bool)

(assert (=> start!6444 m!36689))

(declare-fun m!36691 () Bool)

(assert (=> b!42927 m!36691))

(declare-fun m!36693 () Bool)

(assert (=> b!42927 m!36693))

(declare-fun m!36695 () Bool)

(assert (=> b!42927 m!36695))

(declare-fun m!36697 () Bool)

(assert (=> b!42927 m!36697))

(declare-fun m!36699 () Bool)

(assert (=> b!42927 m!36699))

(declare-fun m!36701 () Bool)

(assert (=> b!42927 m!36701))

(declare-fun m!36703 () Bool)

(assert (=> b!42927 m!36703))

(declare-fun m!36705 () Bool)

(assert (=> b!42927 m!36705))

(check-sat (not start!6444) tp_is_empty!1869 b_and!2609 (not b_next!1479) (not b!42927) (not b_lambda!2221))
(check-sat b_and!2609 (not b_next!1479))
