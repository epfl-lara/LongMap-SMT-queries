; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97218 () Bool)

(assert start!97218)

(declare-fun mapNonEmpty!42991 () Bool)

(declare-fun mapRes!42991 () Bool)

(declare-fun tp!81911 () Bool)

(declare-fun e!631294 () Bool)

(assert (=> mapNonEmpty!42991 (= mapRes!42991 (and tp!81911 e!631294))))

(declare-fun mapKey!42991 () (_ BitVec 32))

(declare-datatypes ((V!41725 0))(
  ( (V!41726 (val!13781 Int)) )
))
(declare-datatypes ((ValueCell!13015 0))(
  ( (ValueCellFull!13015 (v!16414 V!41725)) (EmptyCell!13015) )
))
(declare-fun mapValue!42991 () ValueCell!13015)

(declare-datatypes ((array!71815 0))(
  ( (array!71816 (arr!34560 (Array (_ BitVec 32) ValueCell!13015)) (size!35096 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71815)

(declare-fun mapRest!42991 () (Array (_ BitVec 32) ValueCell!13015))

(assert (=> mapNonEmpty!42991 (= (arr!34560 _values!996) (store mapRest!42991 mapKey!42991 mapValue!42991))))

(declare-fun b!1106265 () Bool)

(declare-fun e!631296 () Bool)

(declare-fun e!631295 () Bool)

(assert (=> b!1106265 (= e!631296 e!631295)))

(declare-fun res!738233 () Bool)

(assert (=> b!1106265 (=> (not res!738233) (not e!631295))))

(declare-datatypes ((array!71817 0))(
  ( (array!71818 (arr!34561 (Array (_ BitVec 32) (_ BitVec 64))) (size!35097 (_ BitVec 32))) )
))
(declare-fun lt!495433 () array!71817)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71817 (_ BitVec 32)) Bool)

(assert (=> b!1106265 (= res!738233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495433 mask!1564))))

(declare-fun _keys!1208 () array!71817)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106265 (= lt!495433 (array!71818 (store (arr!34561 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35097 _keys!1208)))))

(declare-fun b!1106266 () Bool)

(assert (=> b!1106266 (= e!631295 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106266 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36300 0))(
  ( (Unit!36301) )
))
(declare-fun lt!495434 () Unit!36300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71817 (_ BitVec 64) (_ BitVec 32)) Unit!36300)

(assert (=> b!1106266 (= lt!495434 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106267 () Bool)

(declare-fun res!738231 () Bool)

(assert (=> b!1106267 (=> (not res!738231) (not e!631296))))

(declare-datatypes ((List!24092 0))(
  ( (Nil!24089) (Cons!24088 (h!25297 (_ BitVec 64)) (t!34357 List!24092)) )
))
(declare-fun arrayNoDuplicates!0 (array!71817 (_ BitVec 32) List!24092) Bool)

(assert (=> b!1106267 (= res!738231 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24089))))

(declare-fun b!1106268 () Bool)

(declare-fun res!738238 () Bool)

(assert (=> b!1106268 (=> (not res!738238) (not e!631296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106268 (= res!738238 (validKeyInArray!0 k!934))))

(declare-fun b!1106269 () Bool)

(declare-fun e!631298 () Bool)

(declare-fun tp_is_empty!27449 () Bool)

(assert (=> b!1106269 (= e!631298 tp_is_empty!27449)))

(declare-fun b!1106270 () Bool)

(declare-fun res!738234 () Bool)

(assert (=> b!1106270 (=> (not res!738234) (not e!631296))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106270 (= res!738234 (and (= (size!35096 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35097 _keys!1208) (size!35096 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106271 () Bool)

(declare-fun res!738229 () Bool)

(assert (=> b!1106271 (=> (not res!738229) (not e!631295))))

(assert (=> b!1106271 (= res!738229 (arrayNoDuplicates!0 lt!495433 #b00000000000000000000000000000000 Nil!24089))))

(declare-fun b!1106272 () Bool)

(declare-fun res!738237 () Bool)

(assert (=> b!1106272 (=> (not res!738237) (not e!631296))))

(assert (=> b!1106272 (= res!738237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106273 () Bool)

(declare-fun res!738236 () Bool)

(assert (=> b!1106273 (=> (not res!738236) (not e!631296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106273 (= res!738236 (validMask!0 mask!1564))))

(declare-fun b!1106274 () Bool)

(declare-fun e!631297 () Bool)

(assert (=> b!1106274 (= e!631297 (and e!631298 mapRes!42991))))

(declare-fun condMapEmpty!42991 () Bool)

(declare-fun mapDefault!42991 () ValueCell!13015)

