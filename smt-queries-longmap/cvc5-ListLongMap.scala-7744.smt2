; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97208 () Bool)

(assert start!97208)

(declare-fun b!1106070 () Bool)

(declare-fun res!738083 () Bool)

(declare-fun e!631206 () Bool)

(assert (=> b!1106070 (=> (not res!738083) (not e!631206))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106070 (= res!738083 (validKeyInArray!0 k!934))))

(declare-fun b!1106071 () Bool)

(declare-fun res!738080 () Bool)

(assert (=> b!1106071 (=> (not res!738080) (not e!631206))))

(declare-datatypes ((array!71795 0))(
  ( (array!71796 (arr!34550 (Array (_ BitVec 32) (_ BitVec 64))) (size!35086 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71795)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106071 (= res!738080 (= (select (arr!34550 _keys!1208) i!673) k!934))))

(declare-fun b!1106072 () Bool)

(declare-fun res!738084 () Bool)

(assert (=> b!1106072 (=> (not res!738084) (not e!631206))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41713 0))(
  ( (V!41714 (val!13776 Int)) )
))
(declare-datatypes ((ValueCell!13010 0))(
  ( (ValueCellFull!13010 (v!16409 V!41713)) (EmptyCell!13010) )
))
(declare-datatypes ((array!71797 0))(
  ( (array!71798 (arr!34551 (Array (_ BitVec 32) ValueCell!13010)) (size!35087 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71797)

(assert (=> b!1106072 (= res!738084 (and (= (size!35087 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35086 _keys!1208) (size!35087 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106073 () Bool)

(declare-fun e!631209 () Bool)

(assert (=> b!1106073 (= e!631209 (not true))))

(declare-fun arrayContainsKey!0 (array!71795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106073 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36290 0))(
  ( (Unit!36291) )
))
(declare-fun lt!495404 () Unit!36290)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71795 (_ BitVec 64) (_ BitVec 32)) Unit!36290)

(assert (=> b!1106073 (= lt!495404 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106074 () Bool)

(declare-fun res!738081 () Bool)

(assert (=> b!1106074 (=> (not res!738081) (not e!631206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71795 (_ BitVec 32)) Bool)

(assert (=> b!1106074 (= res!738081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106075 () Bool)

(declare-fun res!738086 () Bool)

(assert (=> b!1106075 (=> (not res!738086) (not e!631206))))

(declare-datatypes ((List!24087 0))(
  ( (Nil!24084) (Cons!24083 (h!25292 (_ BitVec 64)) (t!34352 List!24087)) )
))
(declare-fun arrayNoDuplicates!0 (array!71795 (_ BitVec 32) List!24087) Bool)

(assert (=> b!1106075 (= res!738086 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24084))))

(declare-fun b!1106076 () Bool)

(declare-fun e!631207 () Bool)

(declare-fun tp_is_empty!27439 () Bool)

(assert (=> b!1106076 (= e!631207 tp_is_empty!27439)))

(declare-fun b!1106077 () Bool)

(assert (=> b!1106077 (= e!631206 e!631209)))

(declare-fun res!738085 () Bool)

(assert (=> b!1106077 (=> (not res!738085) (not e!631209))))

(declare-fun lt!495403 () array!71795)

(assert (=> b!1106077 (= res!738085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495403 mask!1564))))

(assert (=> b!1106077 (= lt!495403 (array!71796 (store (arr!34550 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35086 _keys!1208)))))

(declare-fun b!1106078 () Bool)

(declare-fun res!738082 () Bool)

(assert (=> b!1106078 (=> (not res!738082) (not e!631206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106078 (= res!738082 (validMask!0 mask!1564))))

(declare-fun b!1106079 () Bool)

(declare-fun res!738087 () Bool)

(assert (=> b!1106079 (=> (not res!738087) (not e!631206))))

(assert (=> b!1106079 (= res!738087 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35086 _keys!1208))))))

(declare-fun res!738088 () Bool)

(assert (=> start!97208 (=> (not res!738088) (not e!631206))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97208 (= res!738088 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35086 _keys!1208))))))

(assert (=> start!97208 e!631206))

(declare-fun array_inv!26590 (array!71795) Bool)

(assert (=> start!97208 (array_inv!26590 _keys!1208)))

(assert (=> start!97208 true))

(declare-fun e!631205 () Bool)

(declare-fun array_inv!26591 (array!71797) Bool)

(assert (=> start!97208 (and (array_inv!26591 _values!996) e!631205)))

(declare-fun mapNonEmpty!42976 () Bool)

(declare-fun mapRes!42976 () Bool)

(declare-fun tp!81896 () Bool)

(assert (=> mapNonEmpty!42976 (= mapRes!42976 (and tp!81896 e!631207))))

(declare-fun mapKey!42976 () (_ BitVec 32))

(declare-fun mapValue!42976 () ValueCell!13010)

(declare-fun mapRest!42976 () (Array (_ BitVec 32) ValueCell!13010))

(assert (=> mapNonEmpty!42976 (= (arr!34551 _values!996) (store mapRest!42976 mapKey!42976 mapValue!42976))))

(declare-fun b!1106080 () Bool)

(declare-fun e!631204 () Bool)

(assert (=> b!1106080 (= e!631205 (and e!631204 mapRes!42976))))

(declare-fun condMapEmpty!42976 () Bool)

(declare-fun mapDefault!42976 () ValueCell!13010)

