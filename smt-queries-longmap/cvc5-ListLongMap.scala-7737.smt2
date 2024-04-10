; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97166 () Bool)

(assert start!97166)

(declare-fun b!1105251 () Bool)

(declare-fun e!630827 () Bool)

(declare-fun tp_is_empty!27397 () Bool)

(assert (=> b!1105251 (= e!630827 tp_is_empty!27397)))

(declare-fun res!737452 () Bool)

(declare-fun e!630829 () Bool)

(assert (=> start!97166 (=> (not res!737452) (not e!630829))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71717 0))(
  ( (array!71718 (arr!34511 (Array (_ BitVec 32) (_ BitVec 64))) (size!35047 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71717)

(assert (=> start!97166 (= res!737452 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35047 _keys!1208))))))

(assert (=> start!97166 e!630829))

(declare-fun array_inv!26566 (array!71717) Bool)

(assert (=> start!97166 (array_inv!26566 _keys!1208)))

(assert (=> start!97166 true))

(declare-datatypes ((V!41657 0))(
  ( (V!41658 (val!13755 Int)) )
))
(declare-datatypes ((ValueCell!12989 0))(
  ( (ValueCellFull!12989 (v!16388 V!41657)) (EmptyCell!12989) )
))
(declare-datatypes ((array!71719 0))(
  ( (array!71720 (arr!34512 (Array (_ BitVec 32) ValueCell!12989)) (size!35048 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71719)

(declare-fun e!630826 () Bool)

(declare-fun array_inv!26567 (array!71719) Bool)

(assert (=> start!97166 (and (array_inv!26567 _values!996) e!630826)))

(declare-fun b!1105252 () Bool)

(declare-fun e!630830 () Bool)

(assert (=> b!1105252 (= e!630829 e!630830)))

(declare-fun res!737454 () Bool)

(assert (=> b!1105252 (=> (not res!737454) (not e!630830))))

(declare-fun lt!495278 () array!71717)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71717 (_ BitVec 32)) Bool)

(assert (=> b!1105252 (= res!737454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495278 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105252 (= lt!495278 (array!71718 (store (arr!34511 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35047 _keys!1208)))))

(declare-fun b!1105253 () Bool)

(declare-fun e!630828 () Bool)

(assert (=> b!1105253 (= e!630828 tp_is_empty!27397)))

(declare-fun b!1105254 () Bool)

(declare-fun res!737456 () Bool)

(assert (=> b!1105254 (=> (not res!737456) (not e!630829))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105254 (= res!737456 (and (= (size!35048 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35047 _keys!1208) (size!35048 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105255 () Bool)

(declare-fun res!737458 () Bool)

(assert (=> b!1105255 (=> (not res!737458) (not e!630830))))

(declare-datatypes ((List!24071 0))(
  ( (Nil!24068) (Cons!24067 (h!25276 (_ BitVec 64)) (t!34336 List!24071)) )
))
(declare-fun arrayNoDuplicates!0 (array!71717 (_ BitVec 32) List!24071) Bool)

(assert (=> b!1105255 (= res!737458 (arrayNoDuplicates!0 lt!495278 #b00000000000000000000000000000000 Nil!24068))))

(declare-fun b!1105256 () Bool)

(declare-fun res!737457 () Bool)

(assert (=> b!1105256 (=> (not res!737457) (not e!630829))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105256 (= res!737457 (validKeyInArray!0 k!934))))

(declare-fun b!1105257 () Bool)

(declare-fun res!737450 () Bool)

(assert (=> b!1105257 (=> (not res!737450) (not e!630829))))

(assert (=> b!1105257 (= res!737450 (= (select (arr!34511 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!42913 () Bool)

(declare-fun mapRes!42913 () Bool)

(declare-fun tp!81833 () Bool)

(assert (=> mapNonEmpty!42913 (= mapRes!42913 (and tp!81833 e!630827))))

(declare-fun mapKey!42913 () (_ BitVec 32))

(declare-fun mapRest!42913 () (Array (_ BitVec 32) ValueCell!12989))

(declare-fun mapValue!42913 () ValueCell!12989)

(assert (=> mapNonEmpty!42913 (= (arr!34512 _values!996) (store mapRest!42913 mapKey!42913 mapValue!42913))))

(declare-fun b!1105258 () Bool)

(declare-fun res!737451 () Bool)

(assert (=> b!1105258 (=> (not res!737451) (not e!630829))))

(assert (=> b!1105258 (= res!737451 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35047 _keys!1208))))))

(declare-fun b!1105259 () Bool)

(declare-fun res!737453 () Bool)

(assert (=> b!1105259 (=> (not res!737453) (not e!630829))))

(assert (=> b!1105259 (= res!737453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105260 () Bool)

(assert (=> b!1105260 (= e!630830 (not true))))

(declare-fun arrayContainsKey!0 (array!71717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105260 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36268 0))(
  ( (Unit!36269) )
))
(declare-fun lt!495277 () Unit!36268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71717 (_ BitVec 64) (_ BitVec 32)) Unit!36268)

(assert (=> b!1105260 (= lt!495277 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105261 () Bool)

(declare-fun res!737455 () Bool)

(assert (=> b!1105261 (=> (not res!737455) (not e!630829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105261 (= res!737455 (validMask!0 mask!1564))))

(declare-fun b!1105262 () Bool)

(assert (=> b!1105262 (= e!630826 (and e!630828 mapRes!42913))))

(declare-fun condMapEmpty!42913 () Bool)

(declare-fun mapDefault!42913 () ValueCell!12989)

