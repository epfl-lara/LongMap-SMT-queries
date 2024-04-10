; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111660 () Bool)

(assert start!111660)

(declare-fun b_free!30317 () Bool)

(declare-fun b_next!30317 () Bool)

(assert (=> start!111660 (= b_free!30317 (not b_next!30317))))

(declare-fun tp!106426 () Bool)

(declare-fun b_and!48793 () Bool)

(assert (=> start!111660 (= tp!106426 b_and!48793)))

(declare-fun b!1322765 () Bool)

(declare-fun e!754216 () Bool)

(declare-fun tp_is_empty!36137 () Bool)

(assert (=> b!1322765 (= e!754216 tp_is_empty!36137)))

(declare-fun b!1322766 () Bool)

(declare-fun e!754215 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1322766 (= e!754215 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!53285 0))(
  ( (V!53286 (val!18143 Int)) )
))
(declare-datatypes ((tuple2!23380 0))(
  ( (tuple2!23381 (_1!11701 (_ BitVec 64)) (_2!11701 V!53285)) )
))
(declare-datatypes ((List!30525 0))(
  ( (Nil!30522) (Cons!30521 (h!31730 tuple2!23380) (t!44391 List!30525)) )
))
(declare-datatypes ((ListLongMap!21037 0))(
  ( (ListLongMap!21038 (toList!10534 List!30525)) )
))
(declare-fun lt!588421 () ListLongMap!21037)

(declare-fun lt!588425 () tuple2!23380)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8689 (ListLongMap!21037 (_ BitVec 64)) Bool)

(declare-fun +!4586 (ListLongMap!21037 tuple2!23380) ListLongMap!21037)

(assert (=> b!1322766 (contains!8689 (+!4586 lt!588421 lt!588425) k!1164)))

(declare-fun zeroValue!1279 () V!53285)

(declare-datatypes ((Unit!43592 0))(
  ( (Unit!43593) )
))
(declare-fun lt!588419 () Unit!43592)

(declare-fun addStillContains!1135 (ListLongMap!21037 (_ BitVec 64) V!53285 (_ BitVec 64)) Unit!43592)

(assert (=> b!1322766 (= lt!588419 (addStillContains!1135 lt!588421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322766 (contains!8689 lt!588421 k!1164)))

(declare-datatypes ((array!89194 0))(
  ( (array!89195 (arr!43071 (Array (_ BitVec 32) (_ BitVec 64))) (size!43621 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89194)

(declare-fun lt!588426 () Unit!43592)

(declare-fun lt!588423 () V!53285)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!182 ((_ BitVec 64) (_ BitVec 64) V!53285 ListLongMap!21037) Unit!43592)

(assert (=> b!1322766 (= lt!588426 (lemmaInListMapAfterAddingDiffThenInBefore!182 k!1164 (select (arr!43071 _keys!1609) from!2000) lt!588423 lt!588421))))

(declare-fun lt!588424 () ListLongMap!21037)

(assert (=> b!1322766 (contains!8689 lt!588424 k!1164)))

(declare-fun lt!588418 () Unit!43592)

(assert (=> b!1322766 (= lt!588418 (lemmaInListMapAfterAddingDiffThenInBefore!182 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588424))))

(declare-fun lt!588422 () ListLongMap!21037)

(assert (=> b!1322766 (contains!8689 lt!588422 k!1164)))

(declare-fun lt!588420 () Unit!43592)

(declare-fun minValue!1279 () V!53285)

(assert (=> b!1322766 (= lt!588420 (lemmaInListMapAfterAddingDiffThenInBefore!182 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588422))))

(assert (=> b!1322766 (= lt!588422 (+!4586 lt!588424 lt!588425))))

(assert (=> b!1322766 (= lt!588425 (tuple2!23381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322766 (= lt!588424 (+!4586 lt!588421 (tuple2!23381 (select (arr!43071 _keys!1609) from!2000) lt!588423)))))

(declare-datatypes ((ValueCell!17170 0))(
  ( (ValueCellFull!17170 (v!20773 V!53285)) (EmptyCell!17170) )
))
(declare-datatypes ((array!89196 0))(
  ( (array!89197 (arr!43072 (Array (_ BitVec 32) ValueCell!17170)) (size!43622 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89196)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21682 (ValueCell!17170 V!53285) V!53285)

(declare-fun dynLambda!3525 (Int (_ BitVec 64)) V!53285)

(assert (=> b!1322766 (= lt!588423 (get!21682 (select (arr!43072 _values!1337) from!2000) (dynLambda!3525 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6221 (array!89194 array!89196 (_ BitVec 32) (_ BitVec 32) V!53285 V!53285 (_ BitVec 32) Int) ListLongMap!21037)

(assert (=> b!1322766 (= lt!588421 (getCurrentListMapNoExtraKeys!6221 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322767 () Bool)

(declare-fun res!877983 () Bool)

(assert (=> b!1322767 (=> (not res!877983) (not e!754215))))

(assert (=> b!1322767 (= res!877983 (and (= (size!43622 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43621 _keys!1609) (size!43622 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322768 () Bool)

(declare-fun e!754218 () Bool)

(declare-fun e!754217 () Bool)

(declare-fun mapRes!55853 () Bool)

(assert (=> b!1322768 (= e!754218 (and e!754217 mapRes!55853))))

(declare-fun condMapEmpty!55853 () Bool)

(declare-fun mapDefault!55853 () ValueCell!17170)

