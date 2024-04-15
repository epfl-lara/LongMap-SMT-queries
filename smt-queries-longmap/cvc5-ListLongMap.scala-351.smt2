; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6446 () Bool)

(assert start!6446)

(declare-fun b_free!1487 () Bool)

(declare-fun b_next!1487 () Bool)

(assert (=> start!6446 (= b_free!1487 (not b_next!1487))))

(declare-fun tp!5918 () Bool)

(declare-fun b_and!2625 () Bool)

(assert (=> start!6446 (= tp!5918 b_and!2625)))

(declare-fun res!25489 () Bool)

(declare-fun e!27170 () Bool)

(assert (=> start!6446 (=> (not res!25489) (not e!27170))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6446 (= res!25489 (validMask!0 mask!853))))

(assert (=> start!6446 e!27170))

(assert (=> start!6446 true))

(assert (=> start!6446 tp!5918))

(declare-fun b!42867 () Bool)

(assert (=> b!42867 (= e!27170 (not true))))

(declare-datatypes ((V!2289 0))(
  ( (V!2290 (val!977 Int)) )
))
(declare-datatypes ((tuple2!1612 0))(
  ( (tuple2!1613 (_1!817 (_ BitVec 64)) (_2!817 V!2289)) )
))
(declare-datatypes ((List!1175 0))(
  ( (Nil!1172) (Cons!1171 (h!1748 tuple2!1612) (t!4157 List!1175)) )
))
(declare-datatypes ((ListLongMap!1177 0))(
  ( (ListLongMap!1178 (toList!604 List!1175)) )
))
(declare-fun lt!18211 () ListLongMap!1177)

(declare-fun lt!18210 () V!2289)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2873 0))(
  ( (array!2874 (arr!1380 (Array (_ BitVec 32) (_ BitVec 64))) (size!1565 (_ BitVec 32))) )
))
(declare-fun lt!18207 () array!2873)

(declare-datatypes ((ValueCell!691 0))(
  ( (ValueCellFull!691 (v!2065 V!2289)) (EmptyCell!691) )
))
(declare-datatypes ((array!2875 0))(
  ( (array!2876 (arr!1381 (Array (_ BitVec 32) ValueCell!691)) (size!1566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!362 0))(
  ( (LongMapFixedSize!363 (defaultEntry!1874 Int) (mask!5416 (_ BitVec 32)) (extraKeys!1765 (_ BitVec 32)) (zeroValue!1792 V!2289) (minValue!1792 V!2289) (_size!230 (_ BitVec 32)) (_keys!3422 array!2873) (_values!1857 array!2875) (_vacant!230 (_ BitVec 32))) )
))
(declare-fun map!820 (LongMapFixedSize!362) ListLongMap!1177)

(assert (=> b!42867 (= lt!18211 (map!820 (LongMapFixedSize!363 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18210 lt!18210 #b00000000000000000000000000000000 lt!18207 (array!2876 ((as const (Array (_ BitVec 32) ValueCell!691)) EmptyCell!691) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1176 0))(
  ( (Nil!1173) (Cons!1172 (h!1749 (_ BitVec 64)) (t!4158 List!1176)) )
))
(declare-fun arrayNoDuplicates!0 (array!2873 (_ BitVec 32) List!1176) Bool)

(assert (=> b!42867 (arrayNoDuplicates!0 lt!18207 #b00000000000000000000000000000000 Nil!1173)))

(declare-datatypes ((Unit!1190 0))(
  ( (Unit!1191) )
))
(declare-fun lt!18212 () Unit!1190)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2873 (_ BitVec 32) (_ BitVec 32) List!1176) Unit!1190)

(assert (=> b!42867 (= lt!18212 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2873 (_ BitVec 32)) Bool)

(assert (=> b!42867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18207 mask!853)))

(declare-fun lt!18208 () Unit!1190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2873 (_ BitVec 32) (_ BitVec 32)) Unit!1190)

(assert (=> b!42867 (= lt!18208 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18207 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42867 (= (arrayCountValidKeys!0 lt!18207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18209 () Unit!1190)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2873 (_ BitVec 32) (_ BitVec 32)) Unit!1190)

(assert (=> b!42867 (= lt!18209 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18207 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42867 (= lt!18207 (array!2874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!251 (Int (_ BitVec 64)) V!2289)

(assert (=> b!42867 (= lt!18210 (dynLambda!251 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6446 res!25489) b!42867))

(declare-fun b_lambda!2233 () Bool)

(assert (=> (not b_lambda!2233) (not b!42867)))

(declare-fun t!4156 () Bool)

(declare-fun tb!969 () Bool)

(assert (=> (and start!6446 (= defaultEntry!470 defaultEntry!470) t!4156) tb!969))

(declare-fun result!1689 () Bool)

(declare-fun tp_is_empty!1877 () Bool)

(assert (=> tb!969 (= result!1689 tp_is_empty!1877)))

(assert (=> b!42867 t!4156))

(declare-fun b_and!2627 () Bool)

(assert (= b_and!2625 (and (=> t!4156 result!1689) b_and!2627)))

(declare-fun m!36665 () Bool)

(assert (=> start!6446 m!36665))

(declare-fun m!36667 () Bool)

(assert (=> b!42867 m!36667))

(declare-fun m!36669 () Bool)

(assert (=> b!42867 m!36669))

(declare-fun m!36671 () Bool)

(assert (=> b!42867 m!36671))

(declare-fun m!36673 () Bool)

(assert (=> b!42867 m!36673))

(declare-fun m!36675 () Bool)

(assert (=> b!42867 m!36675))

(declare-fun m!36677 () Bool)

(assert (=> b!42867 m!36677))

(declare-fun m!36679 () Bool)

(assert (=> b!42867 m!36679))

(declare-fun m!36681 () Bool)

(assert (=> b!42867 m!36681))

(push 1)

(assert tp_is_empty!1877)

(assert (not b!42867))

(assert (not b_lambda!2233))

(assert b_and!2627)

(assert (not start!6446))

(assert (not b_next!1487))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2627)

(assert (not b_next!1487))

(check-sat)

(pop 1)

