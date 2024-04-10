; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97204 () Bool)

(assert start!97204)

(declare-fun b!1105992 () Bool)

(declare-fun e!631169 () Bool)

(declare-fun tp_is_empty!27435 () Bool)

(assert (=> b!1105992 (= e!631169 tp_is_empty!27435)))

(declare-fun mapIsEmpty!42970 () Bool)

(declare-fun mapRes!42970 () Bool)

(assert (=> mapIsEmpty!42970 mapRes!42970))

(declare-fun b!1105993 () Bool)

(declare-fun res!738027 () Bool)

(declare-fun e!631172 () Bool)

(assert (=> b!1105993 (=> (not res!738027) (not e!631172))))

(declare-datatypes ((array!71787 0))(
  ( (array!71788 (arr!34546 (Array (_ BitVec 32) (_ BitVec 64))) (size!35082 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71787)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41707 0))(
  ( (V!41708 (val!13774 Int)) )
))
(declare-datatypes ((ValueCell!13008 0))(
  ( (ValueCellFull!13008 (v!16407 V!41707)) (EmptyCell!13008) )
))
(declare-datatypes ((array!71789 0))(
  ( (array!71790 (arr!34547 (Array (_ BitVec 32) ValueCell!13008)) (size!35083 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71789)

(assert (=> b!1105993 (= res!738027 (and (= (size!35083 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35082 _keys!1208) (size!35083 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!738026 () Bool)

(assert (=> start!97204 (=> (not res!738026) (not e!631172))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97204 (= res!738026 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35082 _keys!1208))))))

(assert (=> start!97204 e!631172))

(declare-fun array_inv!26588 (array!71787) Bool)

(assert (=> start!97204 (array_inv!26588 _keys!1208)))

(assert (=> start!97204 true))

(declare-fun e!631171 () Bool)

(declare-fun array_inv!26589 (array!71789) Bool)

(assert (=> start!97204 (and (array_inv!26589 _values!996) e!631171)))

(declare-fun b!1105994 () Bool)

(declare-fun e!631168 () Bool)

(assert (=> b!1105994 (= e!631168 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105994 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36288 0))(
  ( (Unit!36289) )
))
(declare-fun lt!495392 () Unit!36288)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71787 (_ BitVec 64) (_ BitVec 32)) Unit!36288)

(assert (=> b!1105994 (= lt!495392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105995 () Bool)

(declare-fun res!738024 () Bool)

(assert (=> b!1105995 (=> (not res!738024) (not e!631172))))

(assert (=> b!1105995 (= res!738024 (= (select (arr!34546 _keys!1208) i!673) k0!934))))

(declare-fun b!1105996 () Bool)

(declare-fun e!631173 () Bool)

(assert (=> b!1105996 (= e!631173 tp_is_empty!27435)))

(declare-fun b!1105997 () Bool)

(declare-fun res!738020 () Bool)

(assert (=> b!1105997 (=> (not res!738020) (not e!631172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71787 (_ BitVec 32)) Bool)

(assert (=> b!1105997 (= res!738020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105998 () Bool)

(declare-fun res!738021 () Bool)

(assert (=> b!1105998 (=> (not res!738021) (not e!631172))))

(declare-datatypes ((List!24085 0))(
  ( (Nil!24082) (Cons!24081 (h!25290 (_ BitVec 64)) (t!34350 List!24085)) )
))
(declare-fun arrayNoDuplicates!0 (array!71787 (_ BitVec 32) List!24085) Bool)

(assert (=> b!1105998 (= res!738021 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24082))))

(declare-fun b!1105999 () Bool)

(assert (=> b!1105999 (= e!631171 (and e!631173 mapRes!42970))))

(declare-fun condMapEmpty!42970 () Bool)

(declare-fun mapDefault!42970 () ValueCell!13008)

(assert (=> b!1105999 (= condMapEmpty!42970 (= (arr!34547 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13008)) mapDefault!42970)))))

(declare-fun mapNonEmpty!42970 () Bool)

(declare-fun tp!81890 () Bool)

(assert (=> mapNonEmpty!42970 (= mapRes!42970 (and tp!81890 e!631169))))

(declare-fun mapRest!42970 () (Array (_ BitVec 32) ValueCell!13008))

(declare-fun mapValue!42970 () ValueCell!13008)

(declare-fun mapKey!42970 () (_ BitVec 32))

(assert (=> mapNonEmpty!42970 (= (arr!34547 _values!996) (store mapRest!42970 mapKey!42970 mapValue!42970))))

(declare-fun b!1106000 () Bool)

(declare-fun res!738022 () Bool)

(assert (=> b!1106000 (=> (not res!738022) (not e!631172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106000 (= res!738022 (validMask!0 mask!1564))))

(declare-fun b!1106001 () Bool)

(assert (=> b!1106001 (= e!631172 e!631168)))

(declare-fun res!738028 () Bool)

(assert (=> b!1106001 (=> (not res!738028) (not e!631168))))

(declare-fun lt!495391 () array!71787)

(assert (=> b!1106001 (= res!738028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495391 mask!1564))))

(assert (=> b!1106001 (= lt!495391 (array!71788 (store (arr!34546 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35082 _keys!1208)))))

(declare-fun b!1106002 () Bool)

(declare-fun res!738025 () Bool)

(assert (=> b!1106002 (=> (not res!738025) (not e!631172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106002 (= res!738025 (validKeyInArray!0 k0!934))))

(declare-fun b!1106003 () Bool)

(declare-fun res!738023 () Bool)

(assert (=> b!1106003 (=> (not res!738023) (not e!631168))))

(assert (=> b!1106003 (= res!738023 (arrayNoDuplicates!0 lt!495391 #b00000000000000000000000000000000 Nil!24082))))

(declare-fun b!1106004 () Bool)

(declare-fun res!738019 () Bool)

(assert (=> b!1106004 (=> (not res!738019) (not e!631172))))

(assert (=> b!1106004 (= res!738019 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35082 _keys!1208))))))

(assert (= (and start!97204 res!738026) b!1106000))

(assert (= (and b!1106000 res!738022) b!1105993))

(assert (= (and b!1105993 res!738027) b!1105997))

(assert (= (and b!1105997 res!738020) b!1105998))

(assert (= (and b!1105998 res!738021) b!1106004))

(assert (= (and b!1106004 res!738019) b!1106002))

(assert (= (and b!1106002 res!738025) b!1105995))

(assert (= (and b!1105995 res!738024) b!1106001))

(assert (= (and b!1106001 res!738028) b!1106003))

(assert (= (and b!1106003 res!738023) b!1105994))

(assert (= (and b!1105999 condMapEmpty!42970) mapIsEmpty!42970))

(assert (= (and b!1105999 (not condMapEmpty!42970)) mapNonEmpty!42970))

(get-info :version)

(assert (= (and mapNonEmpty!42970 ((_ is ValueCellFull!13008) mapValue!42970)) b!1105992))

(assert (= (and b!1105999 ((_ is ValueCellFull!13008) mapDefault!42970)) b!1105996))

(assert (= start!97204 b!1105999))

(declare-fun m!1025203 () Bool)

(assert (=> b!1105994 m!1025203))

(declare-fun m!1025205 () Bool)

(assert (=> b!1105994 m!1025205))

(declare-fun m!1025207 () Bool)

(assert (=> start!97204 m!1025207))

(declare-fun m!1025209 () Bool)

(assert (=> start!97204 m!1025209))

(declare-fun m!1025211 () Bool)

(assert (=> b!1106003 m!1025211))

(declare-fun m!1025213 () Bool)

(assert (=> b!1106000 m!1025213))

(declare-fun m!1025215 () Bool)

(assert (=> b!1105995 m!1025215))

(declare-fun m!1025217 () Bool)

(assert (=> b!1106002 m!1025217))

(declare-fun m!1025219 () Bool)

(assert (=> b!1106001 m!1025219))

(declare-fun m!1025221 () Bool)

(assert (=> b!1106001 m!1025221))

(declare-fun m!1025223 () Bool)

(assert (=> b!1105998 m!1025223))

(declare-fun m!1025225 () Bool)

(assert (=> b!1105997 m!1025225))

(declare-fun m!1025227 () Bool)

(assert (=> mapNonEmpty!42970 m!1025227))

(check-sat (not start!97204) (not b!1106002) tp_is_empty!27435 (not b!1105998) (not b!1106000) (not b!1106003) (not b!1106001) (not mapNonEmpty!42970) (not b!1105997) (not b!1105994))
(check-sat)
