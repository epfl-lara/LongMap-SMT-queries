; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6380 () Bool)

(assert start!6380)

(declare-fun b_free!1469 () Bool)

(declare-fun b_next!1469 () Bool)

(assert (=> start!6380 (= b_free!1469 (not b_next!1469))))

(declare-fun tp!5891 () Bool)

(declare-fun b_and!2587 () Bool)

(assert (=> start!6380 (= tp!5891 b_and!2587)))

(declare-fun res!25425 () Bool)

(declare-fun e!27106 () Bool)

(assert (=> start!6380 (=> (not res!25425) (not e!27106))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6380 (= res!25425 (validMask!0 mask!853))))

(assert (=> start!6380 e!27106))

(assert (=> start!6380 true))

(assert (=> start!6380 tp!5891))

(declare-fun b!42767 () Bool)

(assert (=> b!42767 (= e!27106 (not true))))

(declare-datatypes ((V!2265 0))(
  ( (V!2266 (val!968 Int)) )
))
(declare-fun lt!18002 () V!2265)

(declare-datatypes ((tuple2!1590 0))(
  ( (tuple2!1591 (_1!806 (_ BitVec 64)) (_2!806 V!2265)) )
))
(declare-datatypes ((List!1164 0))(
  ( (Nil!1161) (Cons!1160 (h!1737 tuple2!1590) (t!4129 List!1164)) )
))
(declare-datatypes ((ListLongMap!1167 0))(
  ( (ListLongMap!1168 (toList!599 List!1164)) )
))
(declare-fun lt!18001 () ListLongMap!1167)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2863 0))(
  ( (array!2864 (arr!1375 (Array (_ BitVec 32) (_ BitVec 64))) (size!1554 (_ BitVec 32))) )
))
(declare-fun lt!18000 () array!2863)

(declare-datatypes ((ValueCell!682 0))(
  ( (ValueCellFull!682 (v!2058 V!2265)) (EmptyCell!682) )
))
(declare-datatypes ((array!2865 0))(
  ( (array!2866 (arr!1376 (Array (_ BitVec 32) ValueCell!682)) (size!1555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!344 0))(
  ( (LongMapFixedSize!345 (defaultEntry!1865 Int) (mask!5393 (_ BitVec 32)) (extraKeys!1756 (_ BitVec 32)) (zeroValue!1783 V!2265) (minValue!1783 V!2265) (_size!221 (_ BitVec 32)) (_keys!3408 array!2863) (_values!1848 array!2865) (_vacant!221 (_ BitVec 32))) )
))
(declare-fun map!804 (LongMapFixedSize!344) ListLongMap!1167)

(assert (=> b!42767 (= lt!18001 (map!804 (LongMapFixedSize!345 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18002 lt!18002 #b00000000000000000000000000000000 lt!18000 (array!2866 ((as const (Array (_ BitVec 32) ValueCell!682)) EmptyCell!682) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1165 0))(
  ( (Nil!1162) (Cons!1161 (h!1738 (_ BitVec 64)) (t!4130 List!1165)) )
))
(declare-fun arrayNoDuplicates!0 (array!2863 (_ BitVec 32) List!1165) Bool)

(assert (=> b!42767 (arrayNoDuplicates!0 lt!18000 #b00000000000000000000000000000000 Nil!1162)))

(declare-datatypes ((Unit!1165 0))(
  ( (Unit!1166) )
))
(declare-fun lt!18005 () Unit!1165)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2863 (_ BitVec 32) (_ BitVec 32) List!1165) Unit!1165)

(assert (=> b!42767 (= lt!18005 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18000 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2863 (_ BitVec 32)) Bool)

(assert (=> b!42767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18000 mask!853)))

(declare-fun lt!18003 () Unit!1165)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2863 (_ BitVec 32) (_ BitVec 32)) Unit!1165)

(assert (=> b!42767 (= lt!18003 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18000 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2863 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42767 (= (arrayCountValidKeys!0 lt!18000 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18004 () Unit!1165)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2863 (_ BitVec 32) (_ BitVec 32)) Unit!1165)

(assert (=> b!42767 (= lt!18004 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18000 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42767 (= lt!18000 (array!2864 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!243 (Int (_ BitVec 64)) V!2265)

(assert (=> b!42767 (= lt!18002 (dynLambda!243 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6380 res!25425) b!42767))

(declare-fun b_lambda!2205 () Bool)

(assert (=> (not b_lambda!2205) (not b!42767)))

(declare-fun t!4128 () Bool)

(declare-fun tb!951 () Bool)

(assert (=> (and start!6380 (= defaultEntry!470 defaultEntry!470) t!4128) tb!951))

(declare-fun result!1653 () Bool)

(declare-fun tp_is_empty!1859 () Bool)

(assert (=> tb!951 (= result!1653 tp_is_empty!1859)))

(assert (=> b!42767 t!4128))

(declare-fun b_and!2589 () Bool)

(assert (= b_and!2587 (and (=> t!4128 result!1653) b_and!2589)))

(declare-fun m!36515 () Bool)

(assert (=> start!6380 m!36515))

(declare-fun m!36517 () Bool)

(assert (=> b!42767 m!36517))

(declare-fun m!36519 () Bool)

(assert (=> b!42767 m!36519))

(declare-fun m!36521 () Bool)

(assert (=> b!42767 m!36521))

(declare-fun m!36523 () Bool)

(assert (=> b!42767 m!36523))

(declare-fun m!36525 () Bool)

(assert (=> b!42767 m!36525))

(declare-fun m!36527 () Bool)

(assert (=> b!42767 m!36527))

(declare-fun m!36529 () Bool)

(assert (=> b!42767 m!36529))

(declare-fun m!36531 () Bool)

(assert (=> b!42767 m!36531))

(push 1)

(assert (not start!6380))

(assert (not b_lambda!2205))

(assert (not b!42767))

