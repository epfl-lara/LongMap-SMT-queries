; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6446 () Bool)

(assert start!6446)

(declare-fun b_free!1481 () Bool)

(declare-fun b_next!1481 () Bool)

(assert (=> start!6446 (= b_free!1481 (not b_next!1481))))

(declare-fun tp!5909 () Bool)

(declare-fun b_and!2611 () Bool)

(assert (=> start!6446 (= tp!5909 b_and!2611)))

(declare-fun res!25506 () Bool)

(declare-fun e!27214 () Bool)

(assert (=> start!6446 (=> (not res!25506) (not e!27214))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6446 (= res!25506 (validMask!0 mask!853))))

(assert (=> start!6446 e!27214))

(assert (=> start!6446 true))

(assert (=> start!6446 tp!5909))

(declare-fun b!42932 () Bool)

(assert (=> b!42932 (= e!27214 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2281 0))(
  ( (V!2282 (val!974 Int)) )
))
(declare-fun lt!18175 () V!2281)

(declare-datatypes ((array!2887 0))(
  ( (array!2888 (arr!1387 (Array (_ BitVec 32) (_ BitVec 64))) (size!1572 (_ BitVec 32))) )
))
(declare-fun lt!18171 () array!2887)

(declare-datatypes ((tuple2!1602 0))(
  ( (tuple2!1603 (_1!812 (_ BitVec 64)) (_2!812 V!2281)) )
))
(declare-datatypes ((List!1176 0))(
  ( (Nil!1173) (Cons!1172 (h!1749 tuple2!1602) (t!4153 List!1176)) )
))
(declare-datatypes ((ListLongMap!1179 0))(
  ( (ListLongMap!1180 (toList!605 List!1176)) )
))
(declare-fun lt!18173 () ListLongMap!1179)

(declare-datatypes ((ValueCell!688 0))(
  ( (ValueCellFull!688 (v!2064 V!2281)) (EmptyCell!688) )
))
(declare-datatypes ((array!2889 0))(
  ( (array!2890 (arr!1388 (Array (_ BitVec 32) ValueCell!688)) (size!1573 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!356 0))(
  ( (LongMapFixedSize!357 (defaultEntry!1871 Int) (mask!5412 (_ BitVec 32)) (extraKeys!1762 (_ BitVec 32)) (zeroValue!1789 V!2281) (minValue!1789 V!2281) (_size!227 (_ BitVec 32)) (_keys!3420 array!2887) (_values!1854 array!2889) (_vacant!227 (_ BitVec 32))) )
))
(declare-fun map!814 (LongMapFixedSize!356) ListLongMap!1179)

(assert (=> b!42932 (= lt!18173 (map!814 (LongMapFixedSize!357 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18175 lt!18175 #b00000000000000000000000000000000 lt!18171 (array!2890 ((as const (Array (_ BitVec 32) ValueCell!688)) EmptyCell!688) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1177 0))(
  ( (Nil!1174) (Cons!1173 (h!1750 (_ BitVec 64)) (t!4154 List!1177)) )
))
(declare-fun arrayNoDuplicates!0 (array!2887 (_ BitVec 32) List!1177) Bool)

(assert (=> b!42932 (arrayNoDuplicates!0 lt!18171 #b00000000000000000000000000000000 Nil!1174)))

(declare-datatypes ((Unit!1177 0))(
  ( (Unit!1178) )
))
(declare-fun lt!18174 () Unit!1177)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2887 (_ BitVec 32) (_ BitVec 32) List!1177) Unit!1177)

(assert (=> b!42932 (= lt!18174 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18171 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2887 (_ BitVec 32)) Bool)

(assert (=> b!42932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18171 mask!853)))

(declare-fun lt!18176 () Unit!1177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2887 (_ BitVec 32) (_ BitVec 32)) Unit!1177)

(assert (=> b!42932 (= lt!18176 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18171 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2887 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42932 (= (arrayCountValidKeys!0 lt!18171 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18172 () Unit!1177)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2887 (_ BitVec 32) (_ BitVec 32)) Unit!1177)

(assert (=> b!42932 (= lt!18172 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18171 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42932 (= lt!18171 (array!2888 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!249 (Int (_ BitVec 64)) V!2281)

(assert (=> b!42932 (= lt!18175 (dynLambda!249 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6446 res!25506) b!42932))

(declare-fun b_lambda!2223 () Bool)

(assert (=> (not b_lambda!2223) (not b!42932)))

(declare-fun t!4152 () Bool)

(declare-fun tb!963 () Bool)

(assert (=> (and start!6446 (= defaultEntry!470 defaultEntry!470) t!4152) tb!963))

(declare-fun result!1677 () Bool)

(declare-fun tp_is_empty!1871 () Bool)

(assert (=> tb!963 (= result!1677 tp_is_empty!1871)))

(assert (=> b!42932 t!4152))

(declare-fun b_and!2613 () Bool)

(assert (= b_and!2611 (and (=> t!4152 result!1677) b_and!2613)))

(declare-fun m!36707 () Bool)

(assert (=> start!6446 m!36707))

(declare-fun m!36709 () Bool)

(assert (=> b!42932 m!36709))

(declare-fun m!36711 () Bool)

(assert (=> b!42932 m!36711))

(declare-fun m!36713 () Bool)

(assert (=> b!42932 m!36713))

(declare-fun m!36715 () Bool)

(assert (=> b!42932 m!36715))

(declare-fun m!36717 () Bool)

(assert (=> b!42932 m!36717))

(declare-fun m!36719 () Bool)

(assert (=> b!42932 m!36719))

(declare-fun m!36721 () Bool)

(assert (=> b!42932 m!36721))

(declare-fun m!36723 () Bool)

(assert (=> b!42932 m!36723))

(push 1)

(assert (not b_lambda!2223))

(assert (not b!42932))

(assert b_and!2613)

(assert (not b_next!1481))

(assert tp_is_empty!1871)

(assert (not start!6446))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2613)

(assert (not b_next!1481))

(check-sat)

