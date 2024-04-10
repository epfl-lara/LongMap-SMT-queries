; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111666 () Bool)

(assert start!111666)

(declare-fun b_free!30323 () Bool)

(declare-fun b_next!30323 () Bool)

(assert (=> start!111666 (= b_free!30323 (not b_next!30323))))

(declare-fun tp!106445 () Bool)

(declare-fun b_and!48805 () Bool)

(assert (=> start!111666 (= tp!106445 b_and!48805)))

(declare-fun res!878056 () Bool)

(declare-fun e!754261 () Bool)

(assert (=> start!111666 (=> (not res!878056) (not e!754261))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111666 (= res!878056 (validMask!0 mask!2019))))

(assert (=> start!111666 e!754261))

(declare-datatypes ((array!89206 0))(
  ( (array!89207 (arr!43077 (Array (_ BitVec 32) (_ BitVec 64))) (size!43627 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89206)

(declare-fun array_inv!32525 (array!89206) Bool)

(assert (=> start!111666 (array_inv!32525 _keys!1609)))

(assert (=> start!111666 true))

(declare-fun tp_is_empty!36143 () Bool)

(assert (=> start!111666 tp_is_empty!36143))

(declare-datatypes ((V!53293 0))(
  ( (V!53294 (val!18146 Int)) )
))
(declare-datatypes ((ValueCell!17173 0))(
  ( (ValueCellFull!17173 (v!20776 V!53293)) (EmptyCell!17173) )
))
(declare-datatypes ((array!89208 0))(
  ( (array!89209 (arr!43078 (Array (_ BitVec 32) ValueCell!17173)) (size!43628 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89208)

(declare-fun e!754262 () Bool)

(declare-fun array_inv!32526 (array!89208) Bool)

(assert (=> start!111666 (and (array_inv!32526 _values!1337) e!754262)))

(assert (=> start!111666 tp!106445))

(declare-fun b!1322870 () Bool)

(declare-fun e!754263 () Bool)

(assert (=> b!1322870 (= e!754263 tp_is_empty!36143)))

(declare-fun b!1322871 () Bool)

(assert (=> b!1322871 (= e!754261 (not true))))

(declare-datatypes ((tuple2!23386 0))(
  ( (tuple2!23387 (_1!11704 (_ BitVec 64)) (_2!11704 V!53293)) )
))
(declare-datatypes ((List!30529 0))(
  ( (Nil!30526) (Cons!30525 (h!31734 tuple2!23386) (t!44401 List!30529)) )
))
(declare-datatypes ((ListLongMap!21043 0))(
  ( (ListLongMap!21044 (toList!10537 List!30529)) )
))
(declare-fun lt!588503 () ListLongMap!21043)

(declare-fun lt!588507 () tuple2!23386)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8692 (ListLongMap!21043 (_ BitVec 64)) Bool)

(declare-fun +!4589 (ListLongMap!21043 tuple2!23386) ListLongMap!21043)

(assert (=> b!1322871 (contains!8692 (+!4589 lt!588503 lt!588507) k!1164)))

(declare-datatypes ((Unit!43598 0))(
  ( (Unit!43599) )
))
(declare-fun lt!588499 () Unit!43598)

(declare-fun zeroValue!1279 () V!53293)

(declare-fun addStillContains!1138 (ListLongMap!21043 (_ BitVec 64) V!53293 (_ BitVec 64)) Unit!43598)

(assert (=> b!1322871 (= lt!588499 (addStillContains!1138 lt!588503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322871 (contains!8692 lt!588503 k!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588504 () V!53293)

(declare-fun lt!588505 () Unit!43598)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!185 ((_ BitVec 64) (_ BitVec 64) V!53293 ListLongMap!21043) Unit!43598)

(assert (=> b!1322871 (= lt!588505 (lemmaInListMapAfterAddingDiffThenInBefore!185 k!1164 (select (arr!43077 _keys!1609) from!2000) lt!588504 lt!588503))))

(declare-fun lt!588500 () ListLongMap!21043)

(assert (=> b!1322871 (contains!8692 lt!588500 k!1164)))

(declare-fun lt!588501 () Unit!43598)

(assert (=> b!1322871 (= lt!588501 (lemmaInListMapAfterAddingDiffThenInBefore!185 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588500))))

(declare-fun lt!588506 () ListLongMap!21043)

(assert (=> b!1322871 (contains!8692 lt!588506 k!1164)))

(declare-fun lt!588502 () Unit!43598)

(declare-fun minValue!1279 () V!53293)

(assert (=> b!1322871 (= lt!588502 (lemmaInListMapAfterAddingDiffThenInBefore!185 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588506))))

(assert (=> b!1322871 (= lt!588506 (+!4589 lt!588500 lt!588507))))

(assert (=> b!1322871 (= lt!588507 (tuple2!23387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322871 (= lt!588500 (+!4589 lt!588503 (tuple2!23387 (select (arr!43077 _keys!1609) from!2000) lt!588504)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21687 (ValueCell!17173 V!53293) V!53293)

(declare-fun dynLambda!3528 (Int (_ BitVec 64)) V!53293)

(assert (=> b!1322871 (= lt!588504 (get!21687 (select (arr!43078 _values!1337) from!2000) (dynLambda!3528 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6224 (array!89206 array!89208 (_ BitVec 32) (_ BitVec 32) V!53293 V!53293 (_ BitVec 32) Int) ListLongMap!21043)

(assert (=> b!1322871 (= lt!588503 (getCurrentListMapNoExtraKeys!6224 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322872 () Bool)

(declare-fun e!754260 () Bool)

(declare-fun mapRes!55862 () Bool)

(assert (=> b!1322872 (= e!754262 (and e!754260 mapRes!55862))))

(declare-fun condMapEmpty!55862 () Bool)

(declare-fun mapDefault!55862 () ValueCell!17173)

