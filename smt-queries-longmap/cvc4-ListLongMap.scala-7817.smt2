; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97650 () Bool)

(assert start!97650)

(declare-fun b!1115913 () Bool)

(declare-fun res!745037 () Bool)

(declare-fun e!635852 () Bool)

(assert (=> b!1115913 (=> (not res!745037) (not e!635852))))

(declare-datatypes ((array!72659 0))(
  ( (array!72660 (arr!34982 (Array (_ BitVec 32) (_ BitVec 64))) (size!35518 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72659)

(declare-datatypes ((List!24357 0))(
  ( (Nil!24354) (Cons!24353 (h!25562 (_ BitVec 64)) (t!34838 List!24357)) )
))
(declare-fun arrayNoDuplicates!0 (array!72659 (_ BitVec 32) List!24357) Bool)

(assert (=> b!1115913 (= res!745037 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24354))))

(declare-fun b!1115914 () Bool)

(declare-fun e!635850 () Bool)

(assert (=> b!1115914 (= e!635850 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115914 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36624 0))(
  ( (Unit!36625) )
))
(declare-fun lt!497053 () Unit!36624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72659 (_ BitVec 64) (_ BitVec 32)) Unit!36624)

(assert (=> b!1115914 (= lt!497053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1115915 () Bool)

(declare-fun e!635848 () Bool)

(declare-fun tp_is_empty!27881 () Bool)

(assert (=> b!1115915 (= e!635848 tp_is_empty!27881)))

(declare-fun b!1115916 () Bool)

(assert (=> b!1115916 (= e!635852 e!635850)))

(declare-fun res!745035 () Bool)

(assert (=> b!1115916 (=> (not res!745035) (not e!635850))))

(declare-fun lt!497054 () array!72659)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72659 (_ BitVec 32)) Bool)

(assert (=> b!1115916 (= res!745035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497054 mask!1564))))

(assert (=> b!1115916 (= lt!497054 (array!72660 (store (arr!34982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35518 _keys!1208)))))

(declare-fun b!1115917 () Bool)

(declare-fun res!745040 () Bool)

(assert (=> b!1115917 (=> (not res!745040) (not e!635852))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42301 0))(
  ( (V!42302 (val!13997 Int)) )
))
(declare-datatypes ((ValueCell!13231 0))(
  ( (ValueCellFull!13231 (v!16630 V!42301)) (EmptyCell!13231) )
))
(declare-datatypes ((array!72661 0))(
  ( (array!72662 (arr!34983 (Array (_ BitVec 32) ValueCell!13231)) (size!35519 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72661)

(assert (=> b!1115917 (= res!745040 (and (= (size!35519 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35518 _keys!1208) (size!35519 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115918 () Bool)

(declare-fun res!745039 () Bool)

(assert (=> b!1115918 (=> (not res!745039) (not e!635852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115918 (= res!745039 (validKeyInArray!0 k!934))))

(declare-fun res!745033 () Bool)

(assert (=> start!97650 (=> (not res!745033) (not e!635852))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97650 (= res!745033 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35518 _keys!1208))))))

(assert (=> start!97650 e!635852))

(declare-fun array_inv!26890 (array!72659) Bool)

(assert (=> start!97650 (array_inv!26890 _keys!1208)))

(assert (=> start!97650 true))

(declare-fun e!635851 () Bool)

(declare-fun array_inv!26891 (array!72661) Bool)

(assert (=> start!97650 (and (array_inv!26891 _values!996) e!635851)))

(declare-fun mapIsEmpty!43639 () Bool)

(declare-fun mapRes!43639 () Bool)

(assert (=> mapIsEmpty!43639 mapRes!43639))

(declare-fun b!1115919 () Bool)

(declare-fun res!745042 () Bool)

(assert (=> b!1115919 (=> (not res!745042) (not e!635852))))

(assert (=> b!1115919 (= res!745042 (= (select (arr!34982 _keys!1208) i!673) k!934))))

(declare-fun b!1115920 () Bool)

(declare-fun res!745041 () Bool)

(assert (=> b!1115920 (=> (not res!745041) (not e!635852))))

(assert (=> b!1115920 (= res!745041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115921 () Bool)

(declare-fun res!745036 () Bool)

(assert (=> b!1115921 (=> (not res!745036) (not e!635852))))

(assert (=> b!1115921 (= res!745036 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35518 _keys!1208))))))

(declare-fun b!1115922 () Bool)

(declare-fun e!635853 () Bool)

(assert (=> b!1115922 (= e!635853 tp_is_empty!27881)))

(declare-fun b!1115923 () Bool)

(declare-fun res!745038 () Bool)

(assert (=> b!1115923 (=> (not res!745038) (not e!635850))))

(assert (=> b!1115923 (= res!745038 (arrayNoDuplicates!0 lt!497054 #b00000000000000000000000000000000 Nil!24354))))

(declare-fun b!1115924 () Bool)

(declare-fun res!745034 () Bool)

(assert (=> b!1115924 (=> (not res!745034) (not e!635852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115924 (= res!745034 (validMask!0 mask!1564))))

(declare-fun b!1115925 () Bool)

(assert (=> b!1115925 (= e!635851 (and e!635853 mapRes!43639))))

(declare-fun condMapEmpty!43639 () Bool)

(declare-fun mapDefault!43639 () ValueCell!13231)

