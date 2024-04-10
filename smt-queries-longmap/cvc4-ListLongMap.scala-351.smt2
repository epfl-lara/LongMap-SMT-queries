; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6452 () Bool)

(assert start!6452)

(declare-fun b_free!1487 () Bool)

(declare-fun b_next!1487 () Bool)

(assert (=> start!6452 (= b_free!1487 (not b_next!1487))))

(declare-fun tp!5918 () Bool)

(declare-fun b_and!2623 () Bool)

(assert (=> start!6452 (= tp!5918 b_and!2623)))

(declare-fun res!25515 () Bool)

(declare-fun e!27223 () Bool)

(assert (=> start!6452 (=> (not res!25515) (not e!27223))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6452 (= res!25515 (validMask!0 mask!853))))

(assert (=> start!6452 e!27223))

(assert (=> start!6452 true))

(assert (=> start!6452 tp!5918))

(declare-fun b!42947 () Bool)

(assert (=> b!42947 (= e!27223 (not true))))

(declare-datatypes ((array!2899 0))(
  ( (array!2900 (arr!1393 (Array (_ BitVec 32) (_ BitVec 64))) (size!1578 (_ BitVec 32))) )
))
(declare-fun lt!18225 () array!2899)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2289 0))(
  ( (V!2290 (val!977 Int)) )
))
(declare-fun lt!18230 () V!2289)

(declare-datatypes ((tuple2!1608 0))(
  ( (tuple2!1609 (_1!815 (_ BitVec 64)) (_2!815 V!2289)) )
))
(declare-datatypes ((List!1182 0))(
  ( (Nil!1179) (Cons!1178 (h!1755 tuple2!1608) (t!4165 List!1182)) )
))
(declare-datatypes ((ListLongMap!1185 0))(
  ( (ListLongMap!1186 (toList!608 List!1182)) )
))
(declare-fun lt!18227 () ListLongMap!1185)

(declare-datatypes ((ValueCell!691 0))(
  ( (ValueCellFull!691 (v!2067 V!2289)) (EmptyCell!691) )
))
(declare-datatypes ((array!2901 0))(
  ( (array!2902 (arr!1394 (Array (_ BitVec 32) ValueCell!691)) (size!1579 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!362 0))(
  ( (LongMapFixedSize!363 (defaultEntry!1874 Int) (mask!5417 (_ BitVec 32)) (extraKeys!1765 (_ BitVec 32)) (zeroValue!1792 V!2289) (minValue!1792 V!2289) (_size!230 (_ BitVec 32)) (_keys!3423 array!2899) (_values!1857 array!2901) (_vacant!230 (_ BitVec 32))) )
))
(declare-fun map!819 (LongMapFixedSize!362) ListLongMap!1185)

(assert (=> b!42947 (= lt!18227 (map!819 (LongMapFixedSize!363 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18230 lt!18230 #b00000000000000000000000000000000 lt!18225 (array!2902 ((as const (Array (_ BitVec 32) ValueCell!691)) EmptyCell!691) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1183 0))(
  ( (Nil!1180) (Cons!1179 (h!1756 (_ BitVec 64)) (t!4166 List!1183)) )
))
(declare-fun arrayNoDuplicates!0 (array!2899 (_ BitVec 32) List!1183) Bool)

(assert (=> b!42947 (arrayNoDuplicates!0 lt!18225 #b00000000000000000000000000000000 Nil!1180)))

(declare-datatypes ((Unit!1183 0))(
  ( (Unit!1184) )
))
(declare-fun lt!18229 () Unit!1183)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2899 (_ BitVec 32) (_ BitVec 32) List!1183) Unit!1183)

(assert (=> b!42947 (= lt!18229 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18225 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2899 (_ BitVec 32)) Bool)

(assert (=> b!42947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18225 mask!853)))

(declare-fun lt!18228 () Unit!1183)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2899 (_ BitVec 32) (_ BitVec 32)) Unit!1183)

(assert (=> b!42947 (= lt!18228 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18225 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2899 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42947 (= (arrayCountValidKeys!0 lt!18225 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18226 () Unit!1183)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2899 (_ BitVec 32) (_ BitVec 32)) Unit!1183)

(assert (=> b!42947 (= lt!18226 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18225 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42947 (= lt!18225 (array!2900 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!252 (Int (_ BitVec 64)) V!2289)

(assert (=> b!42947 (= lt!18230 (dynLambda!252 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6452 res!25515) b!42947))

(declare-fun b_lambda!2229 () Bool)

(assert (=> (not b_lambda!2229) (not b!42947)))

(declare-fun t!4164 () Bool)

(declare-fun tb!969 () Bool)

(assert (=> (and start!6452 (= defaultEntry!470 defaultEntry!470) t!4164) tb!969))

(declare-fun result!1689 () Bool)

(declare-fun tp_is_empty!1877 () Bool)

(assert (=> tb!969 (= result!1689 tp_is_empty!1877)))

(assert (=> b!42947 t!4164))

(declare-fun b_and!2625 () Bool)

(assert (= b_and!2623 (and (=> t!4164 result!1689) b_and!2625)))

(declare-fun m!36761 () Bool)

(assert (=> start!6452 m!36761))

(declare-fun m!36763 () Bool)

(assert (=> b!42947 m!36763))

(declare-fun m!36765 () Bool)

(assert (=> b!42947 m!36765))

(declare-fun m!36767 () Bool)

(assert (=> b!42947 m!36767))

(declare-fun m!36769 () Bool)

(assert (=> b!42947 m!36769))

(declare-fun m!36771 () Bool)

(assert (=> b!42947 m!36771))

(declare-fun m!36773 () Bool)

(assert (=> b!42947 m!36773))

(declare-fun m!36775 () Bool)

(assert (=> b!42947 m!36775))

(declare-fun m!36777 () Bool)

(assert (=> b!42947 m!36777))

(push 1)

(assert tp_is_empty!1877)

(assert (not b!42947))

(assert b_and!2625)

(assert (not b_next!1487))

(assert (not b_lambda!2229))

(assert (not start!6452))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2625)

(assert (not b_next!1487))

(check-sat)

(pop 1)

