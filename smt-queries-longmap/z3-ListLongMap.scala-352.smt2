; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6456 () Bool)

(assert start!6456)

(declare-fun b_free!1491 () Bool)

(declare-fun b_next!1491 () Bool)

(assert (=> start!6456 (= b_free!1491 (not b_next!1491))))

(declare-fun tp!5924 () Bool)

(declare-fun b_and!2631 () Bool)

(assert (=> start!6456 (= tp!5924 b_and!2631)))

(declare-fun res!25521 () Bool)

(declare-fun e!27229 () Bool)

(assert (=> start!6456 (=> (not res!25521) (not e!27229))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6456 (= res!25521 (validMask!0 mask!853))))

(assert (=> start!6456 e!27229))

(assert (=> start!6456 true))

(assert (=> start!6456 tp!5924))

(declare-fun b!42957 () Bool)

(assert (=> b!42957 (= e!27229 (not true))))

(declare-datatypes ((V!2295 0))(
  ( (V!2296 (val!979 Int)) )
))
(declare-datatypes ((tuple2!1612 0))(
  ( (tuple2!1613 (_1!817 (_ BitVec 64)) (_2!817 V!2295)) )
))
(declare-datatypes ((List!1186 0))(
  ( (Nil!1183) (Cons!1182 (h!1759 tuple2!1612) (t!4173 List!1186)) )
))
(declare-datatypes ((ListLongMap!1189 0))(
  ( (ListLongMap!1190 (toList!610 List!1186)) )
))
(declare-fun lt!18264 () ListLongMap!1189)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!18261 () V!2295)

(declare-datatypes ((array!2907 0))(
  ( (array!2908 (arr!1397 (Array (_ BitVec 32) (_ BitVec 64))) (size!1582 (_ BitVec 32))) )
))
(declare-fun lt!18262 () array!2907)

(declare-datatypes ((ValueCell!693 0))(
  ( (ValueCellFull!693 (v!2069 V!2295)) (EmptyCell!693) )
))
(declare-datatypes ((array!2909 0))(
  ( (array!2910 (arr!1398 (Array (_ BitVec 32) ValueCell!693)) (size!1583 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!366 0))(
  ( (LongMapFixedSize!367 (defaultEntry!1876 Int) (mask!5421 (_ BitVec 32)) (extraKeys!1767 (_ BitVec 32)) (zeroValue!1794 V!2295) (minValue!1794 V!2295) (_size!232 (_ BitVec 32)) (_keys!3425 array!2907) (_values!1859 array!2909) (_vacant!232 (_ BitVec 32))) )
))
(declare-fun map!823 (LongMapFixedSize!366) ListLongMap!1189)

(assert (=> b!42957 (= lt!18264 (map!823 (LongMapFixedSize!367 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18261 lt!18261 #b00000000000000000000000000000000 lt!18262 (array!2910 ((as const (Array (_ BitVec 32) ValueCell!693)) EmptyCell!693) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1187 0))(
  ( (Nil!1184) (Cons!1183 (h!1760 (_ BitVec 64)) (t!4174 List!1187)) )
))
(declare-fun arrayNoDuplicates!0 (array!2907 (_ BitVec 32) List!1187) Bool)

(assert (=> b!42957 (arrayNoDuplicates!0 lt!18262 #b00000000000000000000000000000000 Nil!1184)))

(declare-datatypes ((Unit!1187 0))(
  ( (Unit!1188) )
))
(declare-fun lt!18266 () Unit!1187)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2907 (_ BitVec 32) (_ BitVec 32) List!1187) Unit!1187)

(assert (=> b!42957 (= lt!18266 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18262 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2907 (_ BitVec 32)) Bool)

(assert (=> b!42957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18262 mask!853)))

(declare-fun lt!18263 () Unit!1187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2907 (_ BitVec 32) (_ BitVec 32)) Unit!1187)

(assert (=> b!42957 (= lt!18263 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18262 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2907 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42957 (= (arrayCountValidKeys!0 lt!18262 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18265 () Unit!1187)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2907 (_ BitVec 32) (_ BitVec 32)) Unit!1187)

(assert (=> b!42957 (= lt!18265 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18262 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42957 (= lt!18262 (array!2908 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!254 (Int (_ BitVec 64)) V!2295)

(assert (=> b!42957 (= lt!18261 (dynLambda!254 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6456 res!25521) b!42957))

(declare-fun b_lambda!2233 () Bool)

(assert (=> (not b_lambda!2233) (not b!42957)))

(declare-fun t!4172 () Bool)

(declare-fun tb!973 () Bool)

(assert (=> (and start!6456 (= defaultEntry!470 defaultEntry!470) t!4172) tb!973))

(declare-fun result!1697 () Bool)

(declare-fun tp_is_empty!1881 () Bool)

(assert (=> tb!973 (= result!1697 tp_is_empty!1881)))

(assert (=> b!42957 t!4172))

(declare-fun b_and!2633 () Bool)

(assert (= b_and!2631 (and (=> t!4172 result!1697) b_and!2633)))

(declare-fun m!36797 () Bool)

(assert (=> start!6456 m!36797))

(declare-fun m!36799 () Bool)

(assert (=> b!42957 m!36799))

(declare-fun m!36801 () Bool)

(assert (=> b!42957 m!36801))

(declare-fun m!36803 () Bool)

(assert (=> b!42957 m!36803))

(declare-fun m!36805 () Bool)

(assert (=> b!42957 m!36805))

(declare-fun m!36807 () Bool)

(assert (=> b!42957 m!36807))

(declare-fun m!36809 () Bool)

(assert (=> b!42957 m!36809))

(declare-fun m!36811 () Bool)

(assert (=> b!42957 m!36811))

(declare-fun m!36813 () Bool)

(assert (=> b!42957 m!36813))

(check-sat (not b_lambda!2233) b_and!2633 (not b_next!1491) (not b!42957) tp_is_empty!1881 (not start!6456))
(check-sat b_and!2633 (not b_next!1491))
