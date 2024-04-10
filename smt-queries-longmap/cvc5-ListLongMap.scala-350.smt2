; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6442 () Bool)

(assert start!6442)

(declare-fun b_free!1477 () Bool)

(declare-fun b_next!1477 () Bool)

(assert (=> start!6442 (= b_free!1477 (not b_next!1477))))

(declare-fun tp!5903 () Bool)

(declare-fun b_and!2603 () Bool)

(assert (=> start!6442 (= tp!5903 b_and!2603)))

(declare-fun res!25500 () Bool)

(declare-fun e!27208 () Bool)

(assert (=> start!6442 (=> (not res!25500) (not e!27208))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6442 (= res!25500 (validMask!0 mask!853))))

(assert (=> start!6442 e!27208))

(assert (=> start!6442 true))

(assert (=> start!6442 tp!5903))

(declare-fun b!42922 () Bool)

(assert (=> b!42922 (= e!27208 (not true))))

(declare-datatypes ((V!2277 0))(
  ( (V!2278 (val!972 Int)) )
))
(declare-fun lt!18138 () V!2277)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2879 0))(
  ( (array!2880 (arr!1383 (Array (_ BitVec 32) (_ BitVec 64))) (size!1568 (_ BitVec 32))) )
))
(declare-fun lt!18137 () array!2879)

(declare-datatypes ((tuple2!1598 0))(
  ( (tuple2!1599 (_1!810 (_ BitVec 64)) (_2!810 V!2277)) )
))
(declare-datatypes ((List!1172 0))(
  ( (Nil!1169) (Cons!1168 (h!1745 tuple2!1598) (t!4145 List!1172)) )
))
(declare-datatypes ((ListLongMap!1175 0))(
  ( (ListLongMap!1176 (toList!603 List!1172)) )
))
(declare-fun lt!18139 () ListLongMap!1175)

(declare-datatypes ((ValueCell!686 0))(
  ( (ValueCellFull!686 (v!2062 V!2277)) (EmptyCell!686) )
))
(declare-datatypes ((array!2881 0))(
  ( (array!2882 (arr!1384 (Array (_ BitVec 32) ValueCell!686)) (size!1569 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!352 0))(
  ( (LongMapFixedSize!353 (defaultEntry!1869 Int) (mask!5410 (_ BitVec 32)) (extraKeys!1760 (_ BitVec 32)) (zeroValue!1787 V!2277) (minValue!1787 V!2277) (_size!225 (_ BitVec 32)) (_keys!3418 array!2879) (_values!1852 array!2881) (_vacant!225 (_ BitVec 32))) )
))
(declare-fun map!812 (LongMapFixedSize!352) ListLongMap!1175)

(assert (=> b!42922 (= lt!18139 (map!812 (LongMapFixedSize!353 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18138 lt!18138 #b00000000000000000000000000000000 lt!18137 (array!2882 ((as const (Array (_ BitVec 32) ValueCell!686)) EmptyCell!686) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1173 0))(
  ( (Nil!1170) (Cons!1169 (h!1746 (_ BitVec 64)) (t!4146 List!1173)) )
))
(declare-fun arrayNoDuplicates!0 (array!2879 (_ BitVec 32) List!1173) Bool)

(assert (=> b!42922 (arrayNoDuplicates!0 lt!18137 #b00000000000000000000000000000000 Nil!1170)))

(declare-datatypes ((Unit!1173 0))(
  ( (Unit!1174) )
))
(declare-fun lt!18135 () Unit!1173)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2879 (_ BitVec 32) (_ BitVec 32) List!1173) Unit!1173)

(assert (=> b!42922 (= lt!18135 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18137 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2879 (_ BitVec 32)) Bool)

(assert (=> b!42922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18137 mask!853)))

(declare-fun lt!18140 () Unit!1173)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2879 (_ BitVec 32) (_ BitVec 32)) Unit!1173)

(assert (=> b!42922 (= lt!18140 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18137 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2879 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42922 (= (arrayCountValidKeys!0 lt!18137 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18136 () Unit!1173)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2879 (_ BitVec 32) (_ BitVec 32)) Unit!1173)

(assert (=> b!42922 (= lt!18136 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18137 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42922 (= lt!18137 (array!2880 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!247 (Int (_ BitVec 64)) V!2277)

(assert (=> b!42922 (= lt!18138 (dynLambda!247 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6442 res!25500) b!42922))

(declare-fun b_lambda!2219 () Bool)

(assert (=> (not b_lambda!2219) (not b!42922)))

(declare-fun t!4144 () Bool)

(declare-fun tb!959 () Bool)

(assert (=> (and start!6442 (= defaultEntry!470 defaultEntry!470) t!4144) tb!959))

(declare-fun result!1669 () Bool)

(declare-fun tp_is_empty!1867 () Bool)

(assert (=> tb!959 (= result!1669 tp_is_empty!1867)))

(assert (=> b!42922 t!4144))

(declare-fun b_and!2605 () Bool)

(assert (= b_and!2603 (and (=> t!4144 result!1669) b_and!2605)))

(declare-fun m!36671 () Bool)

(assert (=> start!6442 m!36671))

(declare-fun m!36673 () Bool)

(assert (=> b!42922 m!36673))

(declare-fun m!36675 () Bool)

(assert (=> b!42922 m!36675))

(declare-fun m!36677 () Bool)

(assert (=> b!42922 m!36677))

(declare-fun m!36679 () Bool)

(assert (=> b!42922 m!36679))

(declare-fun m!36681 () Bool)

(assert (=> b!42922 m!36681))

(declare-fun m!36683 () Bool)

(assert (=> b!42922 m!36683))

(declare-fun m!36685 () Bool)

(assert (=> b!42922 m!36685))

(declare-fun m!36687 () Bool)

(assert (=> b!42922 m!36687))

(push 1)

(assert (not b_lambda!2219))

(assert (not b!42922))

(assert (not b_next!1477))

(assert tp_is_empty!1867)

(assert b_and!2605)

(assert (not start!6442))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2605)

(assert (not b_next!1477))

(check-sat)

(pop 1)

