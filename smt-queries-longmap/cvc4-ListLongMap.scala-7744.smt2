; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97212 () Bool)

(assert start!97212)

(declare-fun b!1106148 () Bool)

(declare-fun res!738142 () Bool)

(declare-fun e!631242 () Bool)

(assert (=> b!1106148 (=> (not res!738142) (not e!631242))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106148 (= res!738142 (validKeyInArray!0 k!934))))

(declare-fun b!1106149 () Bool)

(declare-fun res!738140 () Bool)

(declare-fun e!631243 () Bool)

(assert (=> b!1106149 (=> (not res!738140) (not e!631243))))

(declare-datatypes ((array!71803 0))(
  ( (array!71804 (arr!34554 (Array (_ BitVec 32) (_ BitVec 64))) (size!35090 (_ BitVec 32))) )
))
(declare-fun lt!495416 () array!71803)

(declare-datatypes ((List!24089 0))(
  ( (Nil!24086) (Cons!24085 (h!25294 (_ BitVec 64)) (t!34354 List!24089)) )
))
(declare-fun arrayNoDuplicates!0 (array!71803 (_ BitVec 32) List!24089) Bool)

(assert (=> b!1106149 (= res!738140 (arrayNoDuplicates!0 lt!495416 #b00000000000000000000000000000000 Nil!24086))))

(declare-fun b!1106150 () Bool)

(declare-fun res!738144 () Bool)

(assert (=> b!1106150 (=> (not res!738144) (not e!631242))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!71803)

(assert (=> b!1106150 (= res!738144 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35090 _keys!1208))))))

(declare-fun b!1106151 () Bool)

(declare-fun res!738139 () Bool)

(assert (=> b!1106151 (=> (not res!738139) (not e!631242))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41717 0))(
  ( (V!41718 (val!13778 Int)) )
))
(declare-datatypes ((ValueCell!13012 0))(
  ( (ValueCellFull!13012 (v!16411 V!41717)) (EmptyCell!13012) )
))
(declare-datatypes ((array!71805 0))(
  ( (array!71806 (arr!34555 (Array (_ BitVec 32) ValueCell!13012)) (size!35091 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71805)

(assert (=> b!1106151 (= res!738139 (and (= (size!35091 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35090 _keys!1208) (size!35091 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106152 () Bool)

(declare-fun e!631245 () Bool)

(declare-fun tp_is_empty!27443 () Bool)

(assert (=> b!1106152 (= e!631245 tp_is_empty!27443)))

(declare-fun b!1106153 () Bool)

(assert (=> b!1106153 (= e!631242 e!631243)))

(declare-fun res!738147 () Bool)

(assert (=> b!1106153 (=> (not res!738147) (not e!631243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71803 (_ BitVec 32)) Bool)

(assert (=> b!1106153 (= res!738147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495416 mask!1564))))

(assert (=> b!1106153 (= lt!495416 (array!71804 (store (arr!34554 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35090 _keys!1208)))))

(declare-fun b!1106154 () Bool)

(assert (=> b!1106154 (= e!631243 (not true))))

(declare-fun arrayContainsKey!0 (array!71803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106154 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36294 0))(
  ( (Unit!36295) )
))
(declare-fun lt!495415 () Unit!36294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71803 (_ BitVec 64) (_ BitVec 32)) Unit!36294)

(assert (=> b!1106154 (= lt!495415 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106155 () Bool)

(declare-fun res!738146 () Bool)

(assert (=> b!1106155 (=> (not res!738146) (not e!631242))))

(assert (=> b!1106155 (= res!738146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24086))))

(declare-fun b!1106156 () Bool)

(declare-fun res!738143 () Bool)

(assert (=> b!1106156 (=> (not res!738143) (not e!631242))))

(assert (=> b!1106156 (= res!738143 (= (select (arr!34554 _keys!1208) i!673) k!934))))

(declare-fun b!1106157 () Bool)

(declare-fun res!738148 () Bool)

(assert (=> b!1106157 (=> (not res!738148) (not e!631242))))

(assert (=> b!1106157 (= res!738148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106158 () Bool)

(declare-fun e!631240 () Bool)

(declare-fun e!631244 () Bool)

(declare-fun mapRes!42982 () Bool)

(assert (=> b!1106158 (= e!631240 (and e!631244 mapRes!42982))))

(declare-fun condMapEmpty!42982 () Bool)

(declare-fun mapDefault!42982 () ValueCell!13012)

