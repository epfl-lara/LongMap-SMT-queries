; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97602 () Bool)

(assert start!97602)

(declare-fun mapNonEmpty!43567 () Bool)

(declare-fun mapRes!43567 () Bool)

(declare-fun tp!82811 () Bool)

(declare-fun e!635418 () Bool)

(assert (=> mapNonEmpty!43567 (= mapRes!43567 (and tp!82811 e!635418))))

(declare-fun mapKey!43567 () (_ BitVec 32))

(declare-datatypes ((V!42237 0))(
  ( (V!42238 (val!13973 Int)) )
))
(declare-datatypes ((ValueCell!13207 0))(
  ( (ValueCellFull!13207 (v!16606 V!42237)) (EmptyCell!13207) )
))
(declare-fun mapValue!43567 () ValueCell!13207)

(declare-fun mapRest!43567 () (Array (_ BitVec 32) ValueCell!13207))

(declare-datatypes ((array!72571 0))(
  ( (array!72572 (arr!34938 (Array (_ BitVec 32) ValueCell!13207)) (size!35474 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72571)

(assert (=> mapNonEmpty!43567 (= (arr!34938 _values!996) (store mapRest!43567 mapKey!43567 mapValue!43567))))

(declare-fun b!1114977 () Bool)

(declare-fun res!744320 () Bool)

(declare-fun e!635420 () Bool)

(assert (=> b!1114977 (=> (not res!744320) (not e!635420))))

(declare-datatypes ((array!72573 0))(
  ( (array!72574 (arr!34939 (Array (_ BitVec 32) (_ BitVec 64))) (size!35475 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72573)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1114977 (= res!744320 (and (= (size!35474 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35475 _keys!1208) (size!35474 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114978 () Bool)

(declare-fun e!635416 () Bool)

(assert (=> b!1114978 (= e!635420 e!635416)))

(declare-fun res!744314 () Bool)

(assert (=> b!1114978 (=> (not res!744314) (not e!635416))))

(declare-fun lt!496909 () array!72573)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72573 (_ BitVec 32)) Bool)

(assert (=> b!1114978 (= res!744314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496909 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114978 (= lt!496909 (array!72574 (store (arr!34939 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35475 _keys!1208)))))

(declare-fun b!1114979 () Bool)

(declare-fun res!744317 () Bool)

(assert (=> b!1114979 (=> (not res!744317) (not e!635420))))

(declare-datatypes ((List!24339 0))(
  ( (Nil!24336) (Cons!24335 (h!25544 (_ BitVec 64)) (t!34820 List!24339)) )
))
(declare-fun arrayNoDuplicates!0 (array!72573 (_ BitVec 32) List!24339) Bool)

(assert (=> b!1114979 (= res!744317 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24336))))

(declare-fun b!1114980 () Bool)

(declare-fun e!635419 () Bool)

(declare-fun tp_is_empty!27833 () Bool)

(assert (=> b!1114980 (= e!635419 tp_is_empty!27833)))

(declare-fun mapIsEmpty!43567 () Bool)

(assert (=> mapIsEmpty!43567 mapRes!43567))

(declare-fun b!1114981 () Bool)

(declare-fun res!744313 () Bool)

(assert (=> b!1114981 (=> (not res!744313) (not e!635416))))

(assert (=> b!1114981 (= res!744313 (arrayNoDuplicates!0 lt!496909 #b00000000000000000000000000000000 Nil!24336))))

(declare-fun b!1114982 () Bool)

(declare-fun res!744322 () Bool)

(assert (=> b!1114982 (=> (not res!744322) (not e!635420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114982 (= res!744322 (validMask!0 mask!1564))))

(declare-fun b!1114983 () Bool)

(declare-fun res!744319 () Bool)

(assert (=> b!1114983 (=> (not res!744319) (not e!635420))))

(assert (=> b!1114983 (= res!744319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!744315 () Bool)

(assert (=> start!97602 (=> (not res!744315) (not e!635420))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97602 (= res!744315 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35475 _keys!1208))))))

(assert (=> start!97602 e!635420))

(declare-fun array_inv!26860 (array!72573) Bool)

(assert (=> start!97602 (array_inv!26860 _keys!1208)))

(assert (=> start!97602 true))

(declare-fun e!635421 () Bool)

(declare-fun array_inv!26861 (array!72571) Bool)

(assert (=> start!97602 (and (array_inv!26861 _values!996) e!635421)))

(declare-fun b!1114984 () Bool)

(declare-fun res!744316 () Bool)

(assert (=> b!1114984 (=> (not res!744316) (not e!635420))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114984 (= res!744316 (validKeyInArray!0 k!934))))

(declare-fun b!1114985 () Bool)

(declare-fun res!744321 () Bool)

(assert (=> b!1114985 (=> (not res!744321) (not e!635420))))

(assert (=> b!1114985 (= res!744321 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35475 _keys!1208))))))

(declare-fun b!1114986 () Bool)

(assert (=> b!1114986 (= e!635418 tp_is_empty!27833)))

(declare-fun b!1114987 () Bool)

(assert (=> b!1114987 (= e!635416 (not true))))

(declare-fun arrayContainsKey!0 (array!72573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114987 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36596 0))(
  ( (Unit!36597) )
))
(declare-fun lt!496910 () Unit!36596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72573 (_ BitVec 64) (_ BitVec 32)) Unit!36596)

(assert (=> b!1114987 (= lt!496910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114988 () Bool)

(assert (=> b!1114988 (= e!635421 (and e!635419 mapRes!43567))))

(declare-fun condMapEmpty!43567 () Bool)

(declare-fun mapDefault!43567 () ValueCell!13207)

