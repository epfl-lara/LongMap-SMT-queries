; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97208 () Bool)

(assert start!97208)

(declare-fun b!1106034 () Bool)

(declare-fun e!631170 () Bool)

(declare-fun e!631169 () Bool)

(assert (=> b!1106034 (= e!631170 e!631169)))

(declare-fun res!738102 () Bool)

(assert (=> b!1106034 (=> (not res!738102) (not e!631169))))

(declare-datatypes ((array!71720 0))(
  ( (array!71721 (arr!34513 (Array (_ BitVec 32) (_ BitVec 64))) (size!35051 (_ BitVec 32))) )
))
(declare-fun lt!495222 () array!71720)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71720 (_ BitVec 32)) Bool)

(assert (=> b!1106034 (= res!738102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495222 mask!1564))))

(declare-fun _keys!1208 () array!71720)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106034 (= lt!495222 (array!71721 (store (arr!34513 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35051 _keys!1208)))))

(declare-fun res!738101 () Bool)

(assert (=> start!97208 (=> (not res!738101) (not e!631170))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97208 (= res!738101 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35051 _keys!1208))))))

(assert (=> start!97208 e!631170))

(declare-fun array_inv!26616 (array!71720) Bool)

(assert (=> start!97208 (array_inv!26616 _keys!1208)))

(assert (=> start!97208 true))

(declare-datatypes ((V!41721 0))(
  ( (V!41722 (val!13779 Int)) )
))
(declare-datatypes ((ValueCell!13013 0))(
  ( (ValueCellFull!13013 (v!16411 V!41721)) (EmptyCell!13013) )
))
(declare-datatypes ((array!71722 0))(
  ( (array!71723 (arr!34514 (Array (_ BitVec 32) ValueCell!13013)) (size!35052 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71722)

(declare-fun e!631166 () Bool)

(declare-fun array_inv!26617 (array!71722) Bool)

(assert (=> start!97208 (and (array_inv!26617 _values!996) e!631166)))

(declare-fun b!1106035 () Bool)

(declare-fun e!631167 () Bool)

(declare-fun tp_is_empty!27445 () Bool)

(assert (=> b!1106035 (= e!631167 tp_is_empty!27445)))

(declare-fun b!1106036 () Bool)

(declare-fun res!738107 () Bool)

(assert (=> b!1106036 (=> (not res!738107) (not e!631170))))

(assert (=> b!1106036 (= res!738107 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35051 _keys!1208))))))

(declare-fun b!1106037 () Bool)

(declare-fun res!738103 () Bool)

(assert (=> b!1106037 (=> (not res!738103) (not e!631170))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1106037 (= res!738103 (= (select (arr!34513 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!42985 () Bool)

(declare-fun mapRes!42985 () Bool)

(assert (=> mapIsEmpty!42985 mapRes!42985))

(declare-fun b!1106038 () Bool)

(declare-fun res!738106 () Bool)

(assert (=> b!1106038 (=> (not res!738106) (not e!631169))))

(declare-datatypes ((List!24123 0))(
  ( (Nil!24120) (Cons!24119 (h!25328 (_ BitVec 64)) (t!34379 List!24123)) )
))
(declare-fun arrayNoDuplicates!0 (array!71720 (_ BitVec 32) List!24123) Bool)

(assert (=> b!1106038 (= res!738106 (arrayNoDuplicates!0 lt!495222 #b00000000000000000000000000000000 Nil!24120))))

(declare-fun b!1106039 () Bool)

(declare-fun res!738108 () Bool)

(assert (=> b!1106039 (=> (not res!738108) (not e!631170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106039 (= res!738108 (validMask!0 mask!1564))))

(declare-fun b!1106040 () Bool)

(assert (=> b!1106040 (= e!631166 (and e!631167 mapRes!42985))))

(declare-fun condMapEmpty!42985 () Bool)

(declare-fun mapDefault!42985 () ValueCell!13013)

(assert (=> b!1106040 (= condMapEmpty!42985 (= (arr!34514 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13013)) mapDefault!42985)))))

(declare-fun b!1106041 () Bool)

(declare-fun res!738109 () Bool)

(assert (=> b!1106041 (=> (not res!738109) (not e!631170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106041 (= res!738109 (validKeyInArray!0 k0!934))))

(declare-fun b!1106042 () Bool)

(declare-fun e!631168 () Bool)

(assert (=> b!1106042 (= e!631168 tp_is_empty!27445)))

(declare-fun b!1106043 () Bool)

(declare-fun res!738105 () Bool)

(assert (=> b!1106043 (=> (not res!738105) (not e!631170))))

(assert (=> b!1106043 (= res!738105 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24120))))

(declare-fun mapNonEmpty!42985 () Bool)

(declare-fun tp!81905 () Bool)

(assert (=> mapNonEmpty!42985 (= mapRes!42985 (and tp!81905 e!631168))))

(declare-fun mapValue!42985 () ValueCell!13013)

(declare-fun mapRest!42985 () (Array (_ BitVec 32) ValueCell!13013))

(declare-fun mapKey!42985 () (_ BitVec 32))

(assert (=> mapNonEmpty!42985 (= (arr!34514 _values!996) (store mapRest!42985 mapKey!42985 mapValue!42985))))

(declare-fun b!1106044 () Bool)

(declare-fun res!738100 () Bool)

(assert (=> b!1106044 (=> (not res!738100) (not e!631170))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106044 (= res!738100 (and (= (size!35052 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35051 _keys!1208) (size!35052 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106045 () Bool)

(assert (=> b!1106045 (= e!631169 (not true))))

(declare-fun arrayContainsKey!0 (array!71720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106045 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36119 0))(
  ( (Unit!36120) )
))
(declare-fun lt!495221 () Unit!36119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71720 (_ BitVec 64) (_ BitVec 32)) Unit!36119)

(assert (=> b!1106045 (= lt!495221 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106046 () Bool)

(declare-fun res!738104 () Bool)

(assert (=> b!1106046 (=> (not res!738104) (not e!631170))))

(assert (=> b!1106046 (= res!738104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97208 res!738101) b!1106039))

(assert (= (and b!1106039 res!738108) b!1106044))

(assert (= (and b!1106044 res!738100) b!1106046))

(assert (= (and b!1106046 res!738104) b!1106043))

(assert (= (and b!1106043 res!738105) b!1106036))

(assert (= (and b!1106036 res!738107) b!1106041))

(assert (= (and b!1106041 res!738109) b!1106037))

(assert (= (and b!1106037 res!738103) b!1106034))

(assert (= (and b!1106034 res!738102) b!1106038))

(assert (= (and b!1106038 res!738106) b!1106045))

(assert (= (and b!1106040 condMapEmpty!42985) mapIsEmpty!42985))

(assert (= (and b!1106040 (not condMapEmpty!42985)) mapNonEmpty!42985))

(get-info :version)

(assert (= (and mapNonEmpty!42985 ((_ is ValueCellFull!13013) mapValue!42985)) b!1106042))

(assert (= (and b!1106040 ((_ is ValueCellFull!13013) mapDefault!42985)) b!1106035))

(assert (= start!97208 b!1106040))

(declare-fun m!1024707 () Bool)

(assert (=> b!1106034 m!1024707))

(declare-fun m!1024709 () Bool)

(assert (=> b!1106034 m!1024709))

(declare-fun m!1024711 () Bool)

(assert (=> b!1106043 m!1024711))

(declare-fun m!1024713 () Bool)

(assert (=> b!1106045 m!1024713))

(declare-fun m!1024715 () Bool)

(assert (=> b!1106045 m!1024715))

(declare-fun m!1024717 () Bool)

(assert (=> b!1106037 m!1024717))

(declare-fun m!1024719 () Bool)

(assert (=> b!1106039 m!1024719))

(declare-fun m!1024721 () Bool)

(assert (=> b!1106041 m!1024721))

(declare-fun m!1024723 () Bool)

(assert (=> b!1106046 m!1024723))

(declare-fun m!1024725 () Bool)

(assert (=> mapNonEmpty!42985 m!1024725))

(declare-fun m!1024727 () Bool)

(assert (=> b!1106038 m!1024727))

(declare-fun m!1024729 () Bool)

(assert (=> start!97208 m!1024729))

(declare-fun m!1024731 () Bool)

(assert (=> start!97208 m!1024731))

(check-sat (not mapNonEmpty!42985) (not start!97208) (not b!1106043) (not b!1106038) (not b!1106046) (not b!1106041) (not b!1106039) (not b!1106045) (not b!1106034) tp_is_empty!27445)
(check-sat)
