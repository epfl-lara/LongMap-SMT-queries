; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111906 () Bool)

(assert start!111906)

(declare-fun b_free!30505 () Bool)

(declare-fun b_next!30505 () Bool)

(assert (=> start!111906 (= b_free!30505 (not b_next!30505))))

(declare-fun tp!106994 () Bool)

(declare-fun b_and!49105 () Bool)

(assert (=> start!111906 (= tp!106994 b_and!49105)))

(declare-fun res!880141 () Bool)

(declare-fun e!755884 () Bool)

(assert (=> start!111906 (=> (not res!880141) (not e!755884))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111906 (= res!880141 (validMask!0 mask!2019))))

(assert (=> start!111906 e!755884))

(declare-datatypes ((array!89556 0))(
  ( (array!89557 (arr!43251 (Array (_ BitVec 32) (_ BitVec 64))) (size!43801 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89556)

(declare-fun array_inv!32649 (array!89556) Bool)

(assert (=> start!111906 (array_inv!32649 _keys!1609)))

(assert (=> start!111906 true))

(declare-fun tp_is_empty!36325 () Bool)

(assert (=> start!111906 tp_is_empty!36325))

(declare-datatypes ((V!53537 0))(
  ( (V!53538 (val!18237 Int)) )
))
(declare-datatypes ((ValueCell!17264 0))(
  ( (ValueCellFull!17264 (v!20870 V!53537)) (EmptyCell!17264) )
))
(declare-datatypes ((array!89558 0))(
  ( (array!89559 (arr!43252 (Array (_ BitVec 32) ValueCell!17264)) (size!43802 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89558)

(declare-fun e!755887 () Bool)

(declare-fun array_inv!32650 (array!89558) Bool)

(assert (=> start!111906 (and (array_inv!32650 _values!1337) e!755887)))

(assert (=> start!111906 tp!106994))

(declare-fun b!1326118 () Bool)

(declare-fun e!755883 () Bool)

(assert (=> b!1326118 (= e!755883 tp_is_empty!36325)))

(declare-fun mapNonEmpty!56139 () Bool)

(declare-fun mapRes!56139 () Bool)

(declare-fun tp!106995 () Bool)

(declare-fun e!755885 () Bool)

(assert (=> mapNonEmpty!56139 (= mapRes!56139 (and tp!106995 e!755885))))

(declare-fun mapRest!56139 () (Array (_ BitVec 32) ValueCell!17264))

(declare-fun mapKey!56139 () (_ BitVec 32))

(declare-fun mapValue!56139 () ValueCell!17264)

(assert (=> mapNonEmpty!56139 (= (arr!43252 _values!1337) (store mapRest!56139 mapKey!56139 mapValue!56139))))

(declare-fun b!1326119 () Bool)

(declare-fun res!880138 () Bool)

(assert (=> b!1326119 (=> (not res!880138) (not e!755884))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1326119 (= res!880138 (and (= (size!43802 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43801 _keys!1609) (size!43802 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326120 () Bool)

(assert (=> b!1326120 (= e!755884 (not true))))

(declare-datatypes ((tuple2!23526 0))(
  ( (tuple2!23527 (_1!11774 (_ BitVec 64)) (_2!11774 V!53537)) )
))
(declare-datatypes ((List!30664 0))(
  ( (Nil!30661) (Cons!30660 (h!31869 tuple2!23526) (t!44640 List!30664)) )
))
(declare-datatypes ((ListLongMap!21183 0))(
  ( (ListLongMap!21184 (toList!10607 List!30664)) )
))
(declare-fun lt!589941 () ListLongMap!21183)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8764 (ListLongMap!21183 (_ BitVec 64)) Bool)

(assert (=> b!1326120 (contains!8764 lt!589941 k!1164)))

(declare-fun zeroValue!1279 () V!53537)

(declare-datatypes ((Unit!43688 0))(
  ( (Unit!43689) )
))
(declare-fun lt!589939 () Unit!43688)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!222 ((_ BitVec 64) (_ BitVec 64) V!53537 ListLongMap!21183) Unit!43688)

(assert (=> b!1326120 (= lt!589939 (lemmaInListMapAfterAddingDiffThenInBefore!222 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589941))))

(declare-fun lt!589940 () ListLongMap!21183)

(assert (=> b!1326120 (contains!8764 lt!589940 k!1164)))

(declare-fun minValue!1279 () V!53537)

(declare-fun lt!589938 () Unit!43688)

(assert (=> b!1326120 (= lt!589938 (lemmaInListMapAfterAddingDiffThenInBefore!222 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589940))))

(declare-fun +!4630 (ListLongMap!21183 tuple2!23526) ListLongMap!21183)

(assert (=> b!1326120 (= lt!589940 (+!4630 lt!589941 (tuple2!23527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6268 (array!89556 array!89558 (_ BitVec 32) (_ BitVec 32) V!53537 V!53537 (_ BitVec 32) Int) ListLongMap!21183)

(declare-fun get!21793 (ValueCell!17264 V!53537) V!53537)

(declare-fun dynLambda!3569 (Int (_ BitVec 64)) V!53537)

(assert (=> b!1326120 (= lt!589941 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23527 (select (arr!43251 _keys!1609) from!2000) (get!21793 (select (arr!43252 _values!1337) from!2000) (dynLambda!3569 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326121 () Bool)

(assert (=> b!1326121 (= e!755887 (and e!755883 mapRes!56139))))

(declare-fun condMapEmpty!56139 () Bool)

(declare-fun mapDefault!56139 () ValueCell!17264)

