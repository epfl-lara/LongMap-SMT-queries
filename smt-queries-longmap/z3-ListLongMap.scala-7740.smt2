; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97186 () Bool)

(assert start!97186)

(declare-fun b!1105641 () Bool)

(declare-fun res!737757 () Bool)

(declare-fun e!631006 () Bool)

(assert (=> b!1105641 (=> (not res!737757) (not e!631006))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105641 (= res!737757 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42943 () Bool)

(declare-fun mapRes!42943 () Bool)

(assert (=> mapIsEmpty!42943 mapRes!42943))

(declare-fun b!1105642 () Bool)

(declare-fun res!737755 () Bool)

(assert (=> b!1105642 (=> (not res!737755) (not e!631006))))

(declare-datatypes ((array!71753 0))(
  ( (array!71754 (arr!34529 (Array (_ BitVec 32) (_ BitVec 64))) (size!35065 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71753)

(declare-datatypes ((List!24078 0))(
  ( (Nil!24075) (Cons!24074 (h!25283 (_ BitVec 64)) (t!34343 List!24078)) )
))
(declare-fun arrayNoDuplicates!0 (array!71753 (_ BitVec 32) List!24078) Bool)

(assert (=> b!1105642 (= res!737755 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24075))))

(declare-fun b!1105643 () Bool)

(declare-fun e!631007 () Bool)

(declare-fun tp_is_empty!27417 () Bool)

(assert (=> b!1105643 (= e!631007 tp_is_empty!27417)))

(declare-fun b!1105644 () Bool)

(declare-fun res!737750 () Bool)

(assert (=> b!1105644 (=> (not res!737750) (not e!631006))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105644 (= res!737750 (= (select (arr!34529 _keys!1208) i!673) k0!934))))

(declare-fun b!1105645 () Bool)

(declare-fun res!737754 () Bool)

(assert (=> b!1105645 (=> (not res!737754) (not e!631006))))

(assert (=> b!1105645 (= res!737754 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35065 _keys!1208))))))

(declare-fun b!1105646 () Bool)

(declare-fun res!737749 () Bool)

(assert (=> b!1105646 (=> (not res!737749) (not e!631006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71753 (_ BitVec 32)) Bool)

(assert (=> b!1105646 (= res!737749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105647 () Bool)

(declare-fun e!631008 () Bool)

(assert (=> b!1105647 (= e!631008 (not true))))

(declare-fun arrayContainsKey!0 (array!71753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105647 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36278 0))(
  ( (Unit!36279) )
))
(declare-fun lt!495338 () Unit!36278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71753 (_ BitVec 64) (_ BitVec 32)) Unit!36278)

(assert (=> b!1105647 (= lt!495338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105648 () Bool)

(declare-fun e!631010 () Bool)

(declare-fun e!631011 () Bool)

(assert (=> b!1105648 (= e!631010 (and e!631011 mapRes!42943))))

(declare-fun condMapEmpty!42943 () Bool)

(declare-datatypes ((V!41683 0))(
  ( (V!41684 (val!13765 Int)) )
))
(declare-datatypes ((ValueCell!12999 0))(
  ( (ValueCellFull!12999 (v!16398 V!41683)) (EmptyCell!12999) )
))
(declare-datatypes ((array!71755 0))(
  ( (array!71756 (arr!34530 (Array (_ BitVec 32) ValueCell!12999)) (size!35066 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71755)

(declare-fun mapDefault!42943 () ValueCell!12999)

(assert (=> b!1105648 (= condMapEmpty!42943 (= (arr!34530 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12999)) mapDefault!42943)))))

(declare-fun b!1105649 () Bool)

(declare-fun res!737756 () Bool)

(assert (=> b!1105649 (=> (not res!737756) (not e!631006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105649 (= res!737756 (validKeyInArray!0 k0!934))))

(declare-fun res!737758 () Bool)

(assert (=> start!97186 (=> (not res!737758) (not e!631006))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97186 (= res!737758 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35065 _keys!1208))))))

(assert (=> start!97186 e!631006))

(declare-fun array_inv!26578 (array!71753) Bool)

(assert (=> start!97186 (array_inv!26578 _keys!1208)))

(assert (=> start!97186 true))

(declare-fun array_inv!26579 (array!71755) Bool)

(assert (=> start!97186 (and (array_inv!26579 _values!996) e!631010)))

(declare-fun mapNonEmpty!42943 () Bool)

(declare-fun tp!81863 () Bool)

(assert (=> mapNonEmpty!42943 (= mapRes!42943 (and tp!81863 e!631007))))

(declare-fun mapRest!42943 () (Array (_ BitVec 32) ValueCell!12999))

(declare-fun mapValue!42943 () ValueCell!12999)

(declare-fun mapKey!42943 () (_ BitVec 32))

(assert (=> mapNonEmpty!42943 (= (arr!34530 _values!996) (store mapRest!42943 mapKey!42943 mapValue!42943))))

(declare-fun b!1105650 () Bool)

(declare-fun res!737753 () Bool)

(assert (=> b!1105650 (=> (not res!737753) (not e!631008))))

(declare-fun lt!495337 () array!71753)

(assert (=> b!1105650 (= res!737753 (arrayNoDuplicates!0 lt!495337 #b00000000000000000000000000000000 Nil!24075))))

(declare-fun b!1105651 () Bool)

(declare-fun res!737752 () Bool)

(assert (=> b!1105651 (=> (not res!737752) (not e!631006))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105651 (= res!737752 (and (= (size!35066 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35065 _keys!1208) (size!35066 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105652 () Bool)

(assert (=> b!1105652 (= e!631011 tp_is_empty!27417)))

(declare-fun b!1105653 () Bool)

(assert (=> b!1105653 (= e!631006 e!631008)))

(declare-fun res!737751 () Bool)

(assert (=> b!1105653 (=> (not res!737751) (not e!631008))))

(assert (=> b!1105653 (= res!737751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495337 mask!1564))))

(assert (=> b!1105653 (= lt!495337 (array!71754 (store (arr!34529 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35065 _keys!1208)))))

(assert (= (and start!97186 res!737758) b!1105641))

(assert (= (and b!1105641 res!737757) b!1105651))

(assert (= (and b!1105651 res!737752) b!1105646))

(assert (= (and b!1105646 res!737749) b!1105642))

(assert (= (and b!1105642 res!737755) b!1105645))

(assert (= (and b!1105645 res!737754) b!1105649))

(assert (= (and b!1105649 res!737756) b!1105644))

(assert (= (and b!1105644 res!737750) b!1105653))

(assert (= (and b!1105653 res!737751) b!1105650))

(assert (= (and b!1105650 res!737753) b!1105647))

(assert (= (and b!1105648 condMapEmpty!42943) mapIsEmpty!42943))

(assert (= (and b!1105648 (not condMapEmpty!42943)) mapNonEmpty!42943))

(get-info :version)

(assert (= (and mapNonEmpty!42943 ((_ is ValueCellFull!12999) mapValue!42943)) b!1105643))

(assert (= (and b!1105648 ((_ is ValueCellFull!12999) mapDefault!42943)) b!1105652))

(assert (= start!97186 b!1105648))

(declare-fun m!1024969 () Bool)

(assert (=> b!1105647 m!1024969))

(declare-fun m!1024971 () Bool)

(assert (=> b!1105647 m!1024971))

(declare-fun m!1024973 () Bool)

(assert (=> b!1105642 m!1024973))

(declare-fun m!1024975 () Bool)

(assert (=> start!97186 m!1024975))

(declare-fun m!1024977 () Bool)

(assert (=> start!97186 m!1024977))

(declare-fun m!1024979 () Bool)

(assert (=> b!1105649 m!1024979))

(declare-fun m!1024981 () Bool)

(assert (=> b!1105653 m!1024981))

(declare-fun m!1024983 () Bool)

(assert (=> b!1105653 m!1024983))

(declare-fun m!1024985 () Bool)

(assert (=> b!1105644 m!1024985))

(declare-fun m!1024987 () Bool)

(assert (=> mapNonEmpty!42943 m!1024987))

(declare-fun m!1024989 () Bool)

(assert (=> b!1105641 m!1024989))

(declare-fun m!1024991 () Bool)

(assert (=> b!1105650 m!1024991))

(declare-fun m!1024993 () Bool)

(assert (=> b!1105646 m!1024993))

(check-sat tp_is_empty!27417 (not b!1105649) (not b!1105650) (not b!1105641) (not b!1105646) (not start!97186) (not b!1105647) (not b!1105653) (not b!1105642) (not mapNonEmpty!42943))
(check-sat)
