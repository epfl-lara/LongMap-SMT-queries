; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6440 () Bool)

(assert start!6440)

(declare-fun b_free!1481 () Bool)

(declare-fun b_next!1481 () Bool)

(assert (=> start!6440 (= b_free!1481 (not b_next!1481))))

(declare-fun tp!5909 () Bool)

(declare-fun b_and!2613 () Bool)

(assert (=> start!6440 (= tp!5909 b_and!2613)))

(declare-fun res!25480 () Bool)

(declare-fun e!27161 () Bool)

(assert (=> start!6440 (=> (not res!25480) (not e!27161))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6440 (= res!25480 (validMask!0 mask!853))))

(assert (=> start!6440 e!27161))

(assert (=> start!6440 true))

(assert (=> start!6440 tp!5909))

(declare-fun b!42852 () Bool)

(assert (=> b!42852 (= e!27161 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2281 0))(
  ( (V!2282 (val!974 Int)) )
))
(declare-fun lt!18153 () V!2281)

(declare-datatypes ((tuple2!1606 0))(
  ( (tuple2!1607 (_1!814 (_ BitVec 64)) (_2!814 V!2281)) )
))
(declare-datatypes ((List!1169 0))(
  ( (Nil!1166) (Cons!1165 (h!1742 tuple2!1606) (t!4145 List!1169)) )
))
(declare-datatypes ((ListLongMap!1171 0))(
  ( (ListLongMap!1172 (toList!601 List!1169)) )
))
(declare-fun lt!18156 () ListLongMap!1171)

(declare-datatypes ((array!2861 0))(
  ( (array!2862 (arr!1374 (Array (_ BitVec 32) (_ BitVec 64))) (size!1559 (_ BitVec 32))) )
))
(declare-fun lt!18158 () array!2861)

(declare-datatypes ((ValueCell!688 0))(
  ( (ValueCellFull!688 (v!2062 V!2281)) (EmptyCell!688) )
))
(declare-datatypes ((array!2863 0))(
  ( (array!2864 (arr!1375 (Array (_ BitVec 32) ValueCell!688)) (size!1560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!356 0))(
  ( (LongMapFixedSize!357 (defaultEntry!1871 Int) (mask!5411 (_ BitVec 32)) (extraKeys!1762 (_ BitVec 32)) (zeroValue!1789 V!2281) (minValue!1789 V!2281) (_size!227 (_ BitVec 32)) (_keys!3419 array!2861) (_values!1854 array!2863) (_vacant!227 (_ BitVec 32))) )
))
(declare-fun map!815 (LongMapFixedSize!356) ListLongMap!1171)

(assert (=> b!42852 (= lt!18156 (map!815 (LongMapFixedSize!357 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18153 lt!18153 #b00000000000000000000000000000000 lt!18158 (array!2864 ((as const (Array (_ BitVec 32) ValueCell!688)) EmptyCell!688) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1170 0))(
  ( (Nil!1167) (Cons!1166 (h!1743 (_ BitVec 64)) (t!4146 List!1170)) )
))
(declare-fun arrayNoDuplicates!0 (array!2861 (_ BitVec 32) List!1170) Bool)

(assert (=> b!42852 (arrayNoDuplicates!0 lt!18158 #b00000000000000000000000000000000 Nil!1167)))

(declare-datatypes ((Unit!1184 0))(
  ( (Unit!1185) )
))
(declare-fun lt!18157 () Unit!1184)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2861 (_ BitVec 32) (_ BitVec 32) List!1170) Unit!1184)

(assert (=> b!42852 (= lt!18157 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18158 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2861 (_ BitVec 32)) Bool)

(assert (=> b!42852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18158 mask!853)))

(declare-fun lt!18154 () Unit!1184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2861 (_ BitVec 32) (_ BitVec 32)) Unit!1184)

(assert (=> b!42852 (= lt!18154 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18158 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2861 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42852 (= (arrayCountValidKeys!0 lt!18158 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18155 () Unit!1184)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2861 (_ BitVec 32) (_ BitVec 32)) Unit!1184)

(assert (=> b!42852 (= lt!18155 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18158 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42852 (= lt!18158 (array!2862 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!248 (Int (_ BitVec 64)) V!2281)

(assert (=> b!42852 (= lt!18153 (dynLambda!248 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6440 res!25480) b!42852))

(declare-fun b_lambda!2227 () Bool)

(assert (=> (not b_lambda!2227) (not b!42852)))

(declare-fun t!4144 () Bool)

(declare-fun tb!963 () Bool)

(assert (=> (and start!6440 (= defaultEntry!470 defaultEntry!470) t!4144) tb!963))

(declare-fun result!1677 () Bool)

(declare-fun tp_is_empty!1871 () Bool)

(assert (=> tb!963 (= result!1677 tp_is_empty!1871)))

(assert (=> b!42852 t!4144))

(declare-fun b_and!2615 () Bool)

(assert (= b_and!2613 (and (=> t!4144 result!1677) b_and!2615)))

(declare-fun m!36611 () Bool)

(assert (=> start!6440 m!36611))

(declare-fun m!36613 () Bool)

(assert (=> b!42852 m!36613))

(declare-fun m!36615 () Bool)

(assert (=> b!42852 m!36615))

(declare-fun m!36617 () Bool)

(assert (=> b!42852 m!36617))

(declare-fun m!36619 () Bool)

(assert (=> b!42852 m!36619))

(declare-fun m!36621 () Bool)

(assert (=> b!42852 m!36621))

(declare-fun m!36623 () Bool)

(assert (=> b!42852 m!36623))

(declare-fun m!36625 () Bool)

(assert (=> b!42852 m!36625))

(declare-fun m!36627 () Bool)

(assert (=> b!42852 m!36627))

(push 1)

(assert (not b_next!1481))

(assert (not start!6440))

(assert b_and!2615)

(assert (not b_lambda!2227))

(assert tp_is_empty!1871)

(assert (not b!42852))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2615)

(assert (not b_next!1481))

(check-sat)

(pop 1)

