; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97220 () Bool)

(assert start!97220)

(declare-fun b!1106304 () Bool)

(declare-fun res!738267 () Bool)

(declare-fun e!631313 () Bool)

(assert (=> b!1106304 (=> (not res!738267) (not e!631313))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106304 (= res!738267 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42994 () Bool)

(declare-fun mapRes!42994 () Bool)

(assert (=> mapIsEmpty!42994 mapRes!42994))

(declare-fun b!1106305 () Bool)

(declare-fun res!738263 () Bool)

(assert (=> b!1106305 (=> (not res!738263) (not e!631313))))

(declare-datatypes ((array!71819 0))(
  ( (array!71820 (arr!34562 (Array (_ BitVec 32) (_ BitVec 64))) (size!35098 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71819)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41729 0))(
  ( (V!41730 (val!13782 Int)) )
))
(declare-datatypes ((ValueCell!13016 0))(
  ( (ValueCellFull!13016 (v!16415 V!41729)) (EmptyCell!13016) )
))
(declare-datatypes ((array!71821 0))(
  ( (array!71822 (arr!34563 (Array (_ BitVec 32) ValueCell!13016)) (size!35099 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71821)

(assert (=> b!1106305 (= res!738263 (and (= (size!35099 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35098 _keys!1208) (size!35099 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42994 () Bool)

(declare-fun tp!81914 () Bool)

(declare-fun e!631315 () Bool)

(assert (=> mapNonEmpty!42994 (= mapRes!42994 (and tp!81914 e!631315))))

(declare-fun mapRest!42994 () (Array (_ BitVec 32) ValueCell!13016))

(declare-fun mapValue!42994 () ValueCell!13016)

(declare-fun mapKey!42994 () (_ BitVec 32))

(assert (=> mapNonEmpty!42994 (= (arr!34563 _values!996) (store mapRest!42994 mapKey!42994 mapValue!42994))))

(declare-fun b!1106306 () Bool)

(declare-fun e!631316 () Bool)

(assert (=> b!1106306 (= e!631313 e!631316)))

(declare-fun res!738264 () Bool)

(assert (=> b!1106306 (=> (not res!738264) (not e!631316))))

(declare-fun lt!495439 () array!71819)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71819 (_ BitVec 32)) Bool)

(assert (=> b!1106306 (= res!738264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495439 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106306 (= lt!495439 (array!71820 (store (arr!34562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35098 _keys!1208)))))

(declare-fun b!1106307 () Bool)

(declare-fun res!738265 () Bool)

(assert (=> b!1106307 (=> (not res!738265) (not e!631313))))

(assert (=> b!1106307 (= res!738265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106308 () Bool)

(declare-fun res!738260 () Bool)

(assert (=> b!1106308 (=> (not res!738260) (not e!631313))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1106308 (= res!738260 (= (select (arr!34562 _keys!1208) i!673) k!934))))

(declare-fun b!1106309 () Bool)

(declare-fun res!738266 () Bool)

(assert (=> b!1106309 (=> (not res!738266) (not e!631313))))

(assert (=> b!1106309 (= res!738266 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35098 _keys!1208))))))

(declare-fun b!1106310 () Bool)

(declare-fun res!738268 () Bool)

(assert (=> b!1106310 (=> (not res!738268) (not e!631313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106310 (= res!738268 (validKeyInArray!0 k!934))))

(declare-fun res!738262 () Bool)

(assert (=> start!97220 (=> (not res!738262) (not e!631313))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97220 (= res!738262 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35098 _keys!1208))))))

(assert (=> start!97220 e!631313))

(declare-fun array_inv!26598 (array!71819) Bool)

(assert (=> start!97220 (array_inv!26598 _keys!1208)))

(assert (=> start!97220 true))

(declare-fun e!631312 () Bool)

(declare-fun array_inv!26599 (array!71821) Bool)

(assert (=> start!97220 (and (array_inv!26599 _values!996) e!631312)))

(declare-fun b!1106311 () Bool)

(declare-fun res!738259 () Bool)

(assert (=> b!1106311 (=> (not res!738259) (not e!631316))))

(declare-datatypes ((List!24093 0))(
  ( (Nil!24090) (Cons!24089 (h!25298 (_ BitVec 64)) (t!34358 List!24093)) )
))
(declare-fun arrayNoDuplicates!0 (array!71819 (_ BitVec 32) List!24093) Bool)

(assert (=> b!1106311 (= res!738259 (arrayNoDuplicates!0 lt!495439 #b00000000000000000000000000000000 Nil!24090))))

(declare-fun b!1106312 () Bool)

(declare-fun res!738261 () Bool)

(assert (=> b!1106312 (=> (not res!738261) (not e!631313))))

(assert (=> b!1106312 (= res!738261 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24090))))

(declare-fun b!1106313 () Bool)

(declare-fun e!631317 () Bool)

(declare-fun tp_is_empty!27451 () Bool)

(assert (=> b!1106313 (= e!631317 tp_is_empty!27451)))

(declare-fun b!1106314 () Bool)

(assert (=> b!1106314 (= e!631316 (not true))))

(declare-fun arrayContainsKey!0 (array!71819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106314 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36302 0))(
  ( (Unit!36303) )
))
(declare-fun lt!495440 () Unit!36302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71819 (_ BitVec 64) (_ BitVec 32)) Unit!36302)

(assert (=> b!1106314 (= lt!495440 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106315 () Bool)

(assert (=> b!1106315 (= e!631315 tp_is_empty!27451)))

(declare-fun b!1106316 () Bool)

(assert (=> b!1106316 (= e!631312 (and e!631317 mapRes!42994))))

(declare-fun condMapEmpty!42994 () Bool)

(declare-fun mapDefault!42994 () ValueCell!13016)

