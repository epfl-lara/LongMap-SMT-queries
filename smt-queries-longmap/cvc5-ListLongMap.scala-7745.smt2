; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97214 () Bool)

(assert start!97214)

(declare-fun b!1106187 () Bool)

(declare-fun e!631263 () Bool)

(declare-fun tp_is_empty!27445 () Bool)

(assert (=> b!1106187 (= e!631263 tp_is_empty!27445)))

(declare-fun b!1106188 () Bool)

(declare-fun res!738173 () Bool)

(declare-fun e!631262 () Bool)

(assert (=> b!1106188 (=> (not res!738173) (not e!631262))))

(declare-datatypes ((array!71807 0))(
  ( (array!71808 (arr!34556 (Array (_ BitVec 32) (_ BitVec 64))) (size!35092 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71807)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71807 (_ BitVec 32)) Bool)

(assert (=> b!1106188 (= res!738173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!738170 () Bool)

(assert (=> start!97214 (=> (not res!738170) (not e!631262))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97214 (= res!738170 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35092 _keys!1208))))))

(assert (=> start!97214 e!631262))

(declare-fun array_inv!26594 (array!71807) Bool)

(assert (=> start!97214 (array_inv!26594 _keys!1208)))

(assert (=> start!97214 true))

(declare-datatypes ((V!41721 0))(
  ( (V!41722 (val!13779 Int)) )
))
(declare-datatypes ((ValueCell!13013 0))(
  ( (ValueCellFull!13013 (v!16412 V!41721)) (EmptyCell!13013) )
))
(declare-datatypes ((array!71809 0))(
  ( (array!71810 (arr!34557 (Array (_ BitVec 32) ValueCell!13013)) (size!35093 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71809)

(declare-fun e!631259 () Bool)

(declare-fun array_inv!26595 (array!71809) Bool)

(assert (=> start!97214 (and (array_inv!26595 _values!996) e!631259)))

(declare-fun b!1106189 () Bool)

(declare-fun e!631258 () Bool)

(assert (=> b!1106189 (= e!631258 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106189 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36296 0))(
  ( (Unit!36297) )
))
(declare-fun lt!495422 () Unit!36296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71807 (_ BitVec 64) (_ BitVec 32)) Unit!36296)

(assert (=> b!1106189 (= lt!495422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106190 () Bool)

(declare-fun res!738169 () Bool)

(assert (=> b!1106190 (=> (not res!738169) (not e!631262))))

(assert (=> b!1106190 (= res!738169 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35092 _keys!1208))))))

(declare-fun mapIsEmpty!42985 () Bool)

(declare-fun mapRes!42985 () Bool)

(assert (=> mapIsEmpty!42985 mapRes!42985))

(declare-fun b!1106191 () Bool)

(declare-fun res!738171 () Bool)

(assert (=> b!1106191 (=> (not res!738171) (not e!631262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106191 (= res!738171 (validKeyInArray!0 k!934))))

(declare-fun b!1106192 () Bool)

(declare-fun e!631260 () Bool)

(assert (=> b!1106192 (= e!631260 tp_is_empty!27445)))

(declare-fun mapNonEmpty!42985 () Bool)

(declare-fun tp!81905 () Bool)

(assert (=> mapNonEmpty!42985 (= mapRes!42985 (and tp!81905 e!631260))))

(declare-fun mapValue!42985 () ValueCell!13013)

(declare-fun mapRest!42985 () (Array (_ BitVec 32) ValueCell!13013))

(declare-fun mapKey!42985 () (_ BitVec 32))

(assert (=> mapNonEmpty!42985 (= (arr!34557 _values!996) (store mapRest!42985 mapKey!42985 mapValue!42985))))

(declare-fun b!1106193 () Bool)

(declare-fun res!738178 () Bool)

(assert (=> b!1106193 (=> (not res!738178) (not e!631262))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106193 (= res!738178 (and (= (size!35093 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35092 _keys!1208) (size!35093 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106194 () Bool)

(declare-fun res!738175 () Bool)

(assert (=> b!1106194 (=> (not res!738175) (not e!631262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106194 (= res!738175 (validMask!0 mask!1564))))

(declare-fun b!1106195 () Bool)

(declare-fun res!738172 () Bool)

(assert (=> b!1106195 (=> (not res!738172) (not e!631258))))

(declare-fun lt!495421 () array!71807)

(declare-datatypes ((List!24090 0))(
  ( (Nil!24087) (Cons!24086 (h!25295 (_ BitVec 64)) (t!34355 List!24090)) )
))
(declare-fun arrayNoDuplicates!0 (array!71807 (_ BitVec 32) List!24090) Bool)

(assert (=> b!1106195 (= res!738172 (arrayNoDuplicates!0 lt!495421 #b00000000000000000000000000000000 Nil!24087))))

(declare-fun b!1106196 () Bool)

(assert (=> b!1106196 (= e!631259 (and e!631263 mapRes!42985))))

(declare-fun condMapEmpty!42985 () Bool)

(declare-fun mapDefault!42985 () ValueCell!13013)

