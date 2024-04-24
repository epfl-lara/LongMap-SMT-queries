; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6450 () Bool)

(assert start!6450)

(declare-fun b_free!1481 () Bool)

(declare-fun b_next!1481 () Bool)

(assert (=> start!6450 (= b_free!1481 (not b_next!1481))))

(declare-fun tp!5909 () Bool)

(declare-fun b_and!2609 () Bool)

(assert (=> start!6450 (= tp!5909 b_and!2609)))

(declare-fun res!25481 () Bool)

(declare-fun e!27177 () Bool)

(assert (=> start!6450 (=> (not res!25481) (not e!27177))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6450 (= res!25481 (validMask!0 mask!853))))

(assert (=> start!6450 e!27177))

(assert (=> start!6450 true))

(assert (=> start!6450 tp!5909))

(declare-fun b!42875 () Bool)

(assert (=> b!42875 (= e!27177 (not true))))

(declare-datatypes ((V!2281 0))(
  ( (V!2282 (val!974 Int)) )
))
(declare-fun lt!18132 () V!2281)

(declare-datatypes ((array!2873 0))(
  ( (array!2874 (arr!1380 (Array (_ BitVec 32) (_ BitVec 64))) (size!1565 (_ BitVec 32))) )
))
(declare-fun lt!18129 () array!2873)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1584 0))(
  ( (tuple2!1585 (_1!803 (_ BitVec 64)) (_2!803 V!2281)) )
))
(declare-datatypes ((List!1162 0))(
  ( (Nil!1159) (Cons!1158 (h!1735 tuple2!1584) (t!4139 List!1162)) )
))
(declare-datatypes ((ListLongMap!1155 0))(
  ( (ListLongMap!1156 (toList!593 List!1162)) )
))
(declare-fun lt!18130 () ListLongMap!1155)

(declare-datatypes ((ValueCell!688 0))(
  ( (ValueCellFull!688 (v!2065 V!2281)) (EmptyCell!688) )
))
(declare-datatypes ((array!2875 0))(
  ( (array!2876 (arr!1381 (Array (_ BitVec 32) ValueCell!688)) (size!1566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!356 0))(
  ( (LongMapFixedSize!357 (defaultEntry!1871 Int) (mask!5412 (_ BitVec 32)) (extraKeys!1762 (_ BitVec 32)) (zeroValue!1789 V!2281) (minValue!1789 V!2281) (_size!227 (_ BitVec 32)) (_keys!3420 array!2873) (_values!1854 array!2875) (_vacant!227 (_ BitVec 32))) )
))
(declare-fun map!814 (LongMapFixedSize!356) ListLongMap!1155)

(assert (=> b!42875 (= lt!18130 (map!814 (LongMapFixedSize!357 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18132 lt!18132 #b00000000000000000000000000000000 lt!18129 (array!2876 ((as const (Array (_ BitVec 32) ValueCell!688)) EmptyCell!688) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1163 0))(
  ( (Nil!1160) (Cons!1159 (h!1736 (_ BitVec 64)) (t!4140 List!1163)) )
))
(declare-fun arrayNoDuplicates!0 (array!2873 (_ BitVec 32) List!1163) Bool)

(assert (=> b!42875 (arrayNoDuplicates!0 lt!18129 #b00000000000000000000000000000000 Nil!1160)))

(declare-datatypes ((Unit!1189 0))(
  ( (Unit!1190) )
))
(declare-fun lt!18133 () Unit!1189)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2873 (_ BitVec 32) (_ BitVec 32) List!1163) Unit!1189)

(assert (=> b!42875 (= lt!18133 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18129 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2873 (_ BitVec 32)) Bool)

(assert (=> b!42875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18129 mask!853)))

(declare-fun lt!18128 () Unit!1189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2873 (_ BitVec 32) (_ BitVec 32)) Unit!1189)

(assert (=> b!42875 (= lt!18128 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18129 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42875 (= (arrayCountValidKeys!0 lt!18129 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18131 () Unit!1189)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2873 (_ BitVec 32) (_ BitVec 32)) Unit!1189)

(assert (=> b!42875 (= lt!18131 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18129 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42875 (= lt!18129 (array!2874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!245 (Int (_ BitVec 64)) V!2281)

(assert (=> b!42875 (= lt!18132 (dynLambda!245 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6450 res!25481) b!42875))

(declare-fun b_lambda!2223 () Bool)

(assert (=> (not b_lambda!2223) (not b!42875)))

(declare-fun t!4138 () Bool)

(declare-fun tb!963 () Bool)

(assert (=> (and start!6450 (= defaultEntry!470 defaultEntry!470) t!4138) tb!963))

(declare-fun result!1677 () Bool)

(declare-fun tp_is_empty!1871 () Bool)

(assert (=> tb!963 (= result!1677 tp_is_empty!1871)))

(assert (=> b!42875 t!4138))

(declare-fun b_and!2611 () Bool)

(assert (= b_and!2609 (and (=> t!4138 result!1677) b_and!2611)))

(declare-fun m!36583 () Bool)

(assert (=> start!6450 m!36583))

(declare-fun m!36585 () Bool)

(assert (=> b!42875 m!36585))

(declare-fun m!36587 () Bool)

(assert (=> b!42875 m!36587))

(declare-fun m!36589 () Bool)

(assert (=> b!42875 m!36589))

(declare-fun m!36591 () Bool)

(assert (=> b!42875 m!36591))

(declare-fun m!36593 () Bool)

(assert (=> b!42875 m!36593))

(declare-fun m!36595 () Bool)

(assert (=> b!42875 m!36595))

(declare-fun m!36597 () Bool)

(assert (=> b!42875 m!36597))

(declare-fun m!36599 () Bool)

(assert (=> b!42875 m!36599))

(push 1)

(assert (not b_next!1481))

(assert (not start!6450))

(assert tp_is_empty!1871)

(assert (not b!42875))

(assert (not b_lambda!2223))

(assert b_and!2611)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2611)

(assert (not b_next!1481))

(check-sat)

(pop 1)

