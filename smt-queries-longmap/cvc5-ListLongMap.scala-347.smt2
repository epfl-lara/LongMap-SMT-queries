; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6368 () Bool)

(assert start!6368)

(declare-fun b_free!1463 () Bool)

(declare-fun b_next!1463 () Bool)

(assert (=> start!6368 (= b_free!1463 (not b_next!1463))))

(declare-fun tp!5882 () Bool)

(declare-fun b_and!2577 () Bool)

(assert (=> start!6368 (= tp!5882 b_and!2577)))

(declare-fun res!25390 () Bool)

(declare-fun e!27044 () Bool)

(assert (=> start!6368 (=> (not res!25390) (not e!27044))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6368 (= res!25390 (validMask!0 mask!853))))

(assert (=> start!6368 e!27044))

(assert (=> start!6368 true))

(assert (=> start!6368 tp!5882))

(declare-fun b!42672 () Bool)

(assert (=> b!42672 (= e!27044 (not true))))

(declare-datatypes ((V!2257 0))(
  ( (V!2258 (val!965 Int)) )
))
(declare-fun lt!17929 () V!2257)

(declare-datatypes ((tuple2!1588 0))(
  ( (tuple2!1589 (_1!805 (_ BitVec 64)) (_2!805 V!2257)) )
))
(declare-datatypes ((List!1151 0))(
  ( (Nil!1148) (Cons!1147 (h!1724 tuple2!1588) (t!4109 List!1151)) )
))
(declare-datatypes ((ListLongMap!1153 0))(
  ( (ListLongMap!1154 (toList!592 List!1151)) )
))
(declare-fun lt!17928 () ListLongMap!1153)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2825 0))(
  ( (array!2826 (arr!1356 (Array (_ BitVec 32) (_ BitVec 64))) (size!1535 (_ BitVec 32))) )
))
(declare-fun lt!17930 () array!2825)

(declare-datatypes ((ValueCell!679 0))(
  ( (ValueCellFull!679 (v!2053 V!2257)) (EmptyCell!679) )
))
(declare-datatypes ((array!2827 0))(
  ( (array!2828 (arr!1357 (Array (_ BitVec 32) ValueCell!679)) (size!1536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!338 0))(
  ( (LongMapFixedSize!339 (defaultEntry!1862 Int) (mask!5387 (_ BitVec 32)) (extraKeys!1753 (_ BitVec 32)) (zeroValue!1780 V!2257) (minValue!1780 V!2257) (_size!218 (_ BitVec 32)) (_keys!3404 array!2825) (_values!1845 array!2827) (_vacant!218 (_ BitVec 32))) )
))
(declare-fun map!800 (LongMapFixedSize!338) ListLongMap!1153)

(assert (=> b!42672 (= lt!17928 (map!800 (LongMapFixedSize!339 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17929 lt!17929 #b00000000000000000000000000000000 lt!17930 (array!2828 ((as const (Array (_ BitVec 32) ValueCell!679)) EmptyCell!679) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1152 0))(
  ( (Nil!1149) (Cons!1148 (h!1725 (_ BitVec 64)) (t!4110 List!1152)) )
))
(declare-fun arrayNoDuplicates!0 (array!2825 (_ BitVec 32) List!1152) Bool)

(assert (=> b!42672 (arrayNoDuplicates!0 lt!17930 #b00000000000000000000000000000000 Nil!1149)))

(declare-datatypes ((Unit!1166 0))(
  ( (Unit!1167) )
))
(declare-fun lt!17932 () Unit!1166)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2825 (_ BitVec 32) (_ BitVec 32) List!1152) Unit!1166)

(assert (=> b!42672 (= lt!17932 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17930 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2825 (_ BitVec 32)) Bool)

(assert (=> b!42672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17930 mask!853)))

(declare-fun lt!17931 () Unit!1166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1166)

(assert (=> b!42672 (= lt!17931 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17930 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42672 (= (arrayCountValidKeys!0 lt!17930 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17933 () Unit!1166)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1166)

(assert (=> b!42672 (= lt!17933 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17930 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42672 (= lt!17930 (array!2826 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!239 (Int (_ BitVec 64)) V!2257)

(assert (=> b!42672 (= lt!17929 (dynLambda!239 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6368 res!25390) b!42672))

(declare-fun b_lambda!2203 () Bool)

(assert (=> (not b_lambda!2203) (not b!42672)))

(declare-fun t!4108 () Bool)

(declare-fun tb!945 () Bool)

(assert (=> (and start!6368 (= defaultEntry!470 defaultEntry!470) t!4108) tb!945))

(declare-fun result!1641 () Bool)

(declare-fun tp_is_empty!1853 () Bool)

(assert (=> tb!945 (= result!1641 tp_is_empty!1853)))

(assert (=> b!42672 t!4108))

(declare-fun b_and!2579 () Bool)

(assert (= b_and!2577 (and (=> t!4108 result!1641) b_and!2579)))

(declare-fun m!36365 () Bool)

(assert (=> start!6368 m!36365))

(declare-fun m!36367 () Bool)

(assert (=> b!42672 m!36367))

(declare-fun m!36369 () Bool)

(assert (=> b!42672 m!36369))

(declare-fun m!36371 () Bool)

(assert (=> b!42672 m!36371))

(declare-fun m!36373 () Bool)

(assert (=> b!42672 m!36373))

(declare-fun m!36375 () Bool)

(assert (=> b!42672 m!36375))

(declare-fun m!36377 () Bool)

(assert (=> b!42672 m!36377))

(declare-fun m!36379 () Bool)

(assert (=> b!42672 m!36379))

(declare-fun m!36381 () Bool)

(assert (=> b!42672 m!36381))

(push 1)

(assert (not b!42672))

(assert (not b_next!1463))

(assert (not start!6368))

(assert tp_is_empty!1853)

(assert (not b_lambda!2203))

(assert b_and!2579)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2579)

(assert (not b_next!1463))

(check-sat)

(pop 1)

