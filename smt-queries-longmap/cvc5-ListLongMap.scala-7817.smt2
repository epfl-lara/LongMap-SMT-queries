; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97646 () Bool)

(assert start!97646)

(declare-fun b!1115836 () Bool)

(declare-fun res!744977 () Bool)

(declare-fun e!635817 () Bool)

(assert (=> b!1115836 (=> (not res!744977) (not e!635817))))

(declare-datatypes ((array!72651 0))(
  ( (array!72652 (arr!34978 (Array (_ BitVec 32) (_ BitVec 64))) (size!35514 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72651)

(declare-datatypes ((List!24355 0))(
  ( (Nil!24352) (Cons!24351 (h!25560 (_ BitVec 64)) (t!34836 List!24355)) )
))
(declare-fun arrayNoDuplicates!0 (array!72651 (_ BitVec 32) List!24355) Bool)

(assert (=> b!1115836 (= res!744977 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24352))))

(declare-fun b!1115837 () Bool)

(declare-fun res!744980 () Bool)

(assert (=> b!1115837 (=> (not res!744980) (not e!635817))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72651 (_ BitVec 32)) Bool)

(assert (=> b!1115837 (= res!744980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115838 () Bool)

(declare-fun res!744978 () Bool)

(assert (=> b!1115838 (=> (not res!744978) (not e!635817))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1115838 (= res!744978 (= (select (arr!34978 _keys!1208) i!673) k!934))))

(declare-fun b!1115839 () Bool)

(declare-fun res!744975 () Bool)

(declare-fun e!635812 () Bool)

(assert (=> b!1115839 (=> (not res!744975) (not e!635812))))

(declare-fun lt!497041 () array!72651)

(assert (=> b!1115839 (= res!744975 (arrayNoDuplicates!0 lt!497041 #b00000000000000000000000000000000 Nil!24352))))

(declare-fun b!1115840 () Bool)

(declare-fun res!744976 () Bool)

(assert (=> b!1115840 (=> (not res!744976) (not e!635817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115840 (= res!744976 (validKeyInArray!0 k!934))))

(declare-fun b!1115841 () Bool)

(declare-fun res!744973 () Bool)

(assert (=> b!1115841 (=> (not res!744973) (not e!635817))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42297 0))(
  ( (V!42298 (val!13995 Int)) )
))
(declare-datatypes ((ValueCell!13229 0))(
  ( (ValueCellFull!13229 (v!16628 V!42297)) (EmptyCell!13229) )
))
(declare-datatypes ((array!72653 0))(
  ( (array!72654 (arr!34979 (Array (_ BitVec 32) ValueCell!13229)) (size!35515 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72653)

(assert (=> b!1115841 (= res!744973 (and (= (size!35515 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35514 _keys!1208) (size!35515 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115842 () Bool)

(declare-fun e!635815 () Bool)

(declare-fun tp_is_empty!27877 () Bool)

(assert (=> b!1115842 (= e!635815 tp_is_empty!27877)))

(declare-fun mapNonEmpty!43633 () Bool)

(declare-fun mapRes!43633 () Bool)

(declare-fun tp!82877 () Bool)

(assert (=> mapNonEmpty!43633 (= mapRes!43633 (and tp!82877 e!635815))))

(declare-fun mapRest!43633 () (Array (_ BitVec 32) ValueCell!13229))

(declare-fun mapKey!43633 () (_ BitVec 32))

(declare-fun mapValue!43633 () ValueCell!13229)

(assert (=> mapNonEmpty!43633 (= (arr!34979 _values!996) (store mapRest!43633 mapKey!43633 mapValue!43633))))

(declare-fun b!1115835 () Bool)

(assert (=> b!1115835 (= e!635812 (not true))))

(declare-fun arrayContainsKey!0 (array!72651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115835 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36620 0))(
  ( (Unit!36621) )
))
(declare-fun lt!497042 () Unit!36620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72651 (_ BitVec 64) (_ BitVec 32)) Unit!36620)

(assert (=> b!1115835 (= lt!497042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!744982 () Bool)

(assert (=> start!97646 (=> (not res!744982) (not e!635817))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97646 (= res!744982 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35514 _keys!1208))))))

(assert (=> start!97646 e!635817))

(declare-fun array_inv!26886 (array!72651) Bool)

(assert (=> start!97646 (array_inv!26886 _keys!1208)))

(assert (=> start!97646 true))

(declare-fun e!635813 () Bool)

(declare-fun array_inv!26887 (array!72653) Bool)

(assert (=> start!97646 (and (array_inv!26887 _values!996) e!635813)))

(declare-fun b!1115843 () Bool)

(declare-fun e!635814 () Bool)

(assert (=> b!1115843 (= e!635813 (and e!635814 mapRes!43633))))

(declare-fun condMapEmpty!43633 () Bool)

(declare-fun mapDefault!43633 () ValueCell!13229)

