; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97142 () Bool)

(assert start!97142)

(declare-fun b!1105045 () Bool)

(declare-fun res!737303 () Bool)

(declare-fun e!630714 () Bool)

(assert (=> b!1105045 (=> (not res!737303) (not e!630714))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71699 0))(
  ( (array!71700 (arr!34503 (Array (_ BitVec 32) (_ BitVec 64))) (size!35039 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71699)

(assert (=> b!1105045 (= res!737303 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35039 _keys!1208))))))

(declare-fun b!1105046 () Bool)

(declare-fun res!737308 () Bool)

(declare-fun e!630715 () Bool)

(assert (=> b!1105046 (=> (not res!737308) (not e!630715))))

(declare-fun lt!495238 () array!71699)

(declare-datatypes ((List!24068 0))(
  ( (Nil!24065) (Cons!24064 (h!25273 (_ BitVec 64)) (t!34333 List!24068)) )
))
(declare-fun arrayNoDuplicates!0 (array!71699 (_ BitVec 32) List!24068) Bool)

(assert (=> b!1105046 (= res!737308 (arrayNoDuplicates!0 lt!495238 #b00000000000000000000000000000000 Nil!24065))))

(declare-fun mapIsEmpty!42898 () Bool)

(declare-fun mapRes!42898 () Bool)

(assert (=> mapIsEmpty!42898 mapRes!42898))

(declare-fun b!1105047 () Bool)

(declare-fun res!737311 () Bool)

(assert (=> b!1105047 (=> (not res!737311) (not e!630714))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105047 (= res!737311 (validKeyInArray!0 k!934))))

(declare-fun b!1105048 () Bool)

(declare-fun res!737306 () Bool)

(assert (=> b!1105048 (=> (not res!737306) (not e!630714))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41645 0))(
  ( (V!41646 (val!13751 Int)) )
))
(declare-datatypes ((ValueCell!12985 0))(
  ( (ValueCellFull!12985 (v!16384 V!41645)) (EmptyCell!12985) )
))
(declare-datatypes ((array!71701 0))(
  ( (array!71702 (arr!34504 (Array (_ BitVec 32) ValueCell!12985)) (size!35040 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71701)

(assert (=> b!1105048 (= res!737306 (and (= (size!35040 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35039 _keys!1208) (size!35040 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105049 () Bool)

(declare-fun e!630718 () Bool)

(declare-fun tp_is_empty!27389 () Bool)

(assert (=> b!1105049 (= e!630718 tp_is_empty!27389)))

(declare-fun mapNonEmpty!42898 () Bool)

(declare-fun tp!81818 () Bool)

(declare-fun e!630716 () Bool)

(assert (=> mapNonEmpty!42898 (= mapRes!42898 (and tp!81818 e!630716))))

(declare-fun mapRest!42898 () (Array (_ BitVec 32) ValueCell!12985))

(declare-fun mapKey!42898 () (_ BitVec 32))

(declare-fun mapValue!42898 () ValueCell!12985)

(assert (=> mapNonEmpty!42898 (= (arr!34504 _values!996) (store mapRest!42898 mapKey!42898 mapValue!42898))))

(declare-fun b!1105050 () Bool)

(declare-fun res!737304 () Bool)

(assert (=> b!1105050 (=> (not res!737304) (not e!630714))))

(assert (=> b!1105050 (= res!737304 (= (select (arr!34503 _keys!1208) i!673) k!934))))

(declare-fun b!1105051 () Bool)

(assert (=> b!1105051 (= e!630716 tp_is_empty!27389)))

(declare-fun b!1105052 () Bool)

(assert (=> b!1105052 (= e!630714 e!630715)))

(declare-fun res!737307 () Bool)

(assert (=> b!1105052 (=> (not res!737307) (not e!630715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71699 (_ BitVec 32)) Bool)

(assert (=> b!1105052 (= res!737307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495238 mask!1564))))

(assert (=> b!1105052 (= lt!495238 (array!71700 (store (arr!34503 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35039 _keys!1208)))))

(declare-fun res!737309 () Bool)

(assert (=> start!97142 (=> (not res!737309) (not e!630714))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97142 (= res!737309 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35039 _keys!1208))))))

(assert (=> start!97142 e!630714))

(declare-fun array_inv!26562 (array!71699) Bool)

(assert (=> start!97142 (array_inv!26562 _keys!1208)))

(assert (=> start!97142 true))

(declare-fun e!630719 () Bool)

(declare-fun array_inv!26563 (array!71701) Bool)

(assert (=> start!97142 (and (array_inv!26563 _values!996) e!630719)))

(declare-fun b!1105053 () Bool)

(declare-fun res!737310 () Bool)

(assert (=> b!1105053 (=> (not res!737310) (not e!630714))))

(assert (=> b!1105053 (= res!737310 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24065))))

(declare-fun b!1105054 () Bool)

(declare-fun res!737305 () Bool)

(assert (=> b!1105054 (=> (not res!737305) (not e!630714))))

(assert (=> b!1105054 (= res!737305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105055 () Bool)

(assert (=> b!1105055 (= e!630715 (not (bvslt #b00000000000000000000000000000000 (size!35039 _keys!1208))))))

(declare-fun arrayContainsKey!0 (array!71699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105055 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36260 0))(
  ( (Unit!36261) )
))
(declare-fun lt!495239 () Unit!36260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71699 (_ BitVec 64) (_ BitVec 32)) Unit!36260)

(assert (=> b!1105055 (= lt!495239 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105056 () Bool)

(declare-fun res!737312 () Bool)

(assert (=> b!1105056 (=> (not res!737312) (not e!630714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105056 (= res!737312 (validMask!0 mask!1564))))

(declare-fun b!1105057 () Bool)

(assert (=> b!1105057 (= e!630719 (and e!630718 mapRes!42898))))

(declare-fun condMapEmpty!42898 () Bool)

(declare-fun mapDefault!42898 () ValueCell!12985)

