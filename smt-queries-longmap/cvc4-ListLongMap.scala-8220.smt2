; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100232 () Bool)

(assert start!100232)

(declare-fun b!1195398 () Bool)

(declare-fun res!795434 () Bool)

(declare-fun e!679286 () Bool)

(assert (=> b!1195398 (=> (not res!795434) (not e!679286))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195398 (= res!795434 (validMask!0 mask!1564))))

(declare-fun b!1195399 () Bool)

(declare-fun res!795433 () Bool)

(assert (=> b!1195399 (=> (not res!795433) (not e!679286))))

(declare-datatypes ((array!77379 0))(
  ( (array!77380 (arr!37336 (Array (_ BitVec 32) (_ BitVec 64))) (size!37872 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77379)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45525 0))(
  ( (V!45526 (val!15206 Int)) )
))
(declare-datatypes ((ValueCell!14440 0))(
  ( (ValueCellFull!14440 (v!17844 V!45525)) (EmptyCell!14440) )
))
(declare-datatypes ((array!77381 0))(
  ( (array!77382 (arr!37337 (Array (_ BitVec 32) ValueCell!14440)) (size!37873 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77381)

(assert (=> b!1195399 (= res!795433 (and (= (size!37873 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37872 _keys!1208) (size!37873 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195400 () Bool)

(declare-fun res!795432 () Bool)

(assert (=> b!1195400 (=> (not res!795432) (not e!679286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77379 (_ BitVec 32)) Bool)

(assert (=> b!1195400 (= res!795432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195401 () Bool)

(declare-fun e!679287 () Bool)

(declare-fun tp_is_empty!30299 () Bool)

(assert (=> b!1195401 (= e!679287 tp_is_empty!30299)))

(declare-fun b!1195402 () Bool)

(declare-fun e!679291 () Bool)

(assert (=> b!1195402 (= e!679291 tp_is_empty!30299)))

(declare-fun mapIsEmpty!47285 () Bool)

(declare-fun mapRes!47285 () Bool)

(assert (=> mapIsEmpty!47285 mapRes!47285))

(declare-fun b!1195403 () Bool)

(declare-fun res!795430 () Bool)

(assert (=> b!1195403 (=> (not res!795430) (not e!679286))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1195403 (= res!795430 (= (select (arr!37336 _keys!1208) i!673) k!934))))

(declare-fun b!1195404 () Bool)

(declare-fun res!795428 () Bool)

(declare-fun e!679290 () Bool)

(assert (=> b!1195404 (=> (not res!795428) (not e!679290))))

(declare-fun lt!542922 () array!77379)

(declare-datatypes ((List!26279 0))(
  ( (Nil!26276) (Cons!26275 (h!27484 (_ BitVec 64)) (t!38950 List!26279)) )
))
(declare-fun arrayNoDuplicates!0 (array!77379 (_ BitVec 32) List!26279) Bool)

(assert (=> b!1195404 (= res!795428 (arrayNoDuplicates!0 lt!542922 #b00000000000000000000000000000000 Nil!26276))))

(declare-fun b!1195405 () Bool)

(assert (=> b!1195405 (= e!679290 (not true))))

(declare-fun arrayContainsKey!0 (array!77379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195405 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39632 0))(
  ( (Unit!39633) )
))
(declare-fun lt!542921 () Unit!39632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77379 (_ BitVec 64) (_ BitVec 32)) Unit!39632)

(assert (=> b!1195405 (= lt!542921 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195406 () Bool)

(declare-fun res!795427 () Bool)

(assert (=> b!1195406 (=> (not res!795427) (not e!679286))))

(assert (=> b!1195406 (= res!795427 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37872 _keys!1208))))))

(declare-fun b!1195407 () Bool)

(assert (=> b!1195407 (= e!679286 e!679290)))

(declare-fun res!795431 () Bool)

(assert (=> b!1195407 (=> (not res!795431) (not e!679290))))

(assert (=> b!1195407 (= res!795431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542922 mask!1564))))

(assert (=> b!1195407 (= lt!542922 (array!77380 (store (arr!37336 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37872 _keys!1208)))))

(declare-fun b!1195408 () Bool)

(declare-fun res!795436 () Bool)

(assert (=> b!1195408 (=> (not res!795436) (not e!679286))))

(assert (=> b!1195408 (= res!795436 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26276))))

(declare-fun b!1195409 () Bool)

(declare-fun e!679288 () Bool)

(assert (=> b!1195409 (= e!679288 (and e!679287 mapRes!47285))))

(declare-fun condMapEmpty!47285 () Bool)

(declare-fun mapDefault!47285 () ValueCell!14440)

