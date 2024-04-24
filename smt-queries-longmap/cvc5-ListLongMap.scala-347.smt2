; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6378 () Bool)

(assert start!6378)

(declare-fun b_free!1463 () Bool)

(declare-fun b_next!1463 () Bool)

(assert (=> start!6378 (= b_free!1463 (not b_next!1463))))

(declare-fun tp!5882 () Bool)

(declare-fun b_and!2573 () Bool)

(assert (=> start!6378 (= tp!5882 b_and!2573)))

(declare-fun res!25391 () Bool)

(declare-fun e!27060 () Bool)

(assert (=> start!6378 (=> (not res!25391) (not e!27060))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6378 (= res!25391 (validMask!0 mask!853))))

(assert (=> start!6378 e!27060))

(assert (=> start!6378 true))

(assert (=> start!6378 tp!5882))

(declare-fun b!42695 () Bool)

(assert (=> b!42695 (= e!27060 (not true))))

(declare-datatypes ((V!2257 0))(
  ( (V!2258 (val!965 Int)) )
))
(declare-fun lt!17903 () V!2257)

(declare-datatypes ((array!2837 0))(
  ( (array!2838 (arr!1362 (Array (_ BitVec 32) (_ BitVec 64))) (size!1541 (_ BitVec 32))) )
))
(declare-fun lt!17908 () array!2837)

(declare-datatypes ((tuple2!1566 0))(
  ( (tuple2!1567 (_1!794 (_ BitVec 64)) (_2!794 V!2257)) )
))
(declare-datatypes ((List!1144 0))(
  ( (Nil!1141) (Cons!1140 (h!1717 tuple2!1566) (t!4103 List!1144)) )
))
(declare-datatypes ((ListLongMap!1137 0))(
  ( (ListLongMap!1138 (toList!584 List!1144)) )
))
(declare-fun lt!17907 () ListLongMap!1137)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!679 0))(
  ( (ValueCellFull!679 (v!2056 V!2257)) (EmptyCell!679) )
))
(declare-datatypes ((array!2839 0))(
  ( (array!2840 (arr!1363 (Array (_ BitVec 32) ValueCell!679)) (size!1542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!338 0))(
  ( (LongMapFixedSize!339 (defaultEntry!1862 Int) (mask!5388 (_ BitVec 32)) (extraKeys!1753 (_ BitVec 32)) (zeroValue!1780 V!2257) (minValue!1780 V!2257) (_size!218 (_ BitVec 32)) (_keys!3405 array!2837) (_values!1845 array!2839) (_vacant!218 (_ BitVec 32))) )
))
(declare-fun map!799 (LongMapFixedSize!338) ListLongMap!1137)

(assert (=> b!42695 (= lt!17907 (map!799 (LongMapFixedSize!339 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17903 lt!17903 #b00000000000000000000000000000000 lt!17908 (array!2840 ((as const (Array (_ BitVec 32) ValueCell!679)) EmptyCell!679) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1145 0))(
  ( (Nil!1142) (Cons!1141 (h!1718 (_ BitVec 64)) (t!4104 List!1145)) )
))
(declare-fun arrayNoDuplicates!0 (array!2837 (_ BitVec 32) List!1145) Bool)

(assert (=> b!42695 (arrayNoDuplicates!0 lt!17908 #b00000000000000000000000000000000 Nil!1142)))

(declare-datatypes ((Unit!1171 0))(
  ( (Unit!1172) )
))
(declare-fun lt!17904 () Unit!1171)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2837 (_ BitVec 32) (_ BitVec 32) List!1145) Unit!1171)

(assert (=> b!42695 (= lt!17904 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17908 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2837 (_ BitVec 32)) Bool)

(assert (=> b!42695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17908 mask!853)))

(declare-fun lt!17906 () Unit!1171)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2837 (_ BitVec 32) (_ BitVec 32)) Unit!1171)

(assert (=> b!42695 (= lt!17906 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17908 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2837 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42695 (= (arrayCountValidKeys!0 lt!17908 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17905 () Unit!1171)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2837 (_ BitVec 32) (_ BitVec 32)) Unit!1171)

(assert (=> b!42695 (= lt!17905 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17908 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42695 (= lt!17908 (array!2838 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!236 (Int (_ BitVec 64)) V!2257)

(assert (=> b!42695 (= lt!17903 (dynLambda!236 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6378 res!25391) b!42695))

(declare-fun b_lambda!2199 () Bool)

(assert (=> (not b_lambda!2199) (not b!42695)))

(declare-fun t!4102 () Bool)

(declare-fun tb!945 () Bool)

(assert (=> (and start!6378 (= defaultEntry!470 defaultEntry!470) t!4102) tb!945))

(declare-fun result!1641 () Bool)

(declare-fun tp_is_empty!1853 () Bool)

(assert (=> tb!945 (= result!1641 tp_is_empty!1853)))

(assert (=> b!42695 t!4102))

(declare-fun b_and!2575 () Bool)

(assert (= b_and!2573 (and (=> t!4102 result!1641) b_and!2575)))

(declare-fun m!36337 () Bool)

(assert (=> start!6378 m!36337))

(declare-fun m!36339 () Bool)

(assert (=> b!42695 m!36339))

(declare-fun m!36341 () Bool)

(assert (=> b!42695 m!36341))

(declare-fun m!36343 () Bool)

(assert (=> b!42695 m!36343))

(declare-fun m!36345 () Bool)

(assert (=> b!42695 m!36345))

(declare-fun m!36347 () Bool)

(assert (=> b!42695 m!36347))

(declare-fun m!36349 () Bool)

(assert (=> b!42695 m!36349))

(declare-fun m!36351 () Bool)

(assert (=> b!42695 m!36351))

(declare-fun m!36353 () Bool)

(assert (=> b!42695 m!36353))

(push 1)

(assert (not b_next!1463))

(assert (not b_lambda!2199))

(assert tp_is_empty!1853)

(assert b_and!2575)

(assert (not start!6378))

(assert (not b!42695))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2575)

(assert (not b_next!1463))

(check-sat)

(pop 1)

