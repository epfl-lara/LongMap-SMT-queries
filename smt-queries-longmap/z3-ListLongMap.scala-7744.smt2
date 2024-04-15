; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97202 () Bool)

(assert start!97202)

(declare-fun mapNonEmpty!42976 () Bool)

(declare-fun mapRes!42976 () Bool)

(declare-fun tp!81896 () Bool)

(declare-fun e!631112 () Bool)

(assert (=> mapNonEmpty!42976 (= mapRes!42976 (and tp!81896 e!631112))))

(declare-datatypes ((V!41713 0))(
  ( (V!41714 (val!13776 Int)) )
))
(declare-datatypes ((ValueCell!13010 0))(
  ( (ValueCellFull!13010 (v!16408 V!41713)) (EmptyCell!13010) )
))
(declare-fun mapRest!42976 () (Array (_ BitVec 32) ValueCell!13010))

(declare-fun mapKey!42976 () (_ BitVec 32))

(declare-datatypes ((array!71708 0))(
  ( (array!71709 (arr!34507 (Array (_ BitVec 32) ValueCell!13010)) (size!35045 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71708)

(declare-fun mapValue!42976 () ValueCell!13010)

(assert (=> mapNonEmpty!42976 (= (arr!34507 _values!996) (store mapRest!42976 mapKey!42976 mapValue!42976))))

(declare-fun b!1105917 () Bool)

(declare-fun res!738015 () Bool)

(declare-fun e!631111 () Bool)

(assert (=> b!1105917 (=> (not res!738015) (not e!631111))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105917 (= res!738015 (validMask!0 mask!1564))))

(declare-fun b!1105918 () Bool)

(declare-fun e!631113 () Bool)

(declare-fun tp_is_empty!27439 () Bool)

(assert (=> b!1105918 (= e!631113 tp_is_empty!27439)))

(declare-fun b!1105919 () Bool)

(declare-fun e!631114 () Bool)

(assert (=> b!1105919 (= e!631114 (not true))))

(declare-datatypes ((array!71710 0))(
  ( (array!71711 (arr!34508 (Array (_ BitVec 32) (_ BitVec 64))) (size!35046 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71710)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105919 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36115 0))(
  ( (Unit!36116) )
))
(declare-fun lt!495203 () Unit!36115)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71710 (_ BitVec 64) (_ BitVec 32)) Unit!36115)

(assert (=> b!1105919 (= lt!495203 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105920 () Bool)

(declare-fun e!631115 () Bool)

(assert (=> b!1105920 (= e!631115 (and e!631113 mapRes!42976))))

(declare-fun condMapEmpty!42976 () Bool)

(declare-fun mapDefault!42976 () ValueCell!13010)

(assert (=> b!1105920 (= condMapEmpty!42976 (= (arr!34507 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13010)) mapDefault!42976)))))

(declare-fun res!738011 () Bool)

(assert (=> start!97202 (=> (not res!738011) (not e!631111))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97202 (= res!738011 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35046 _keys!1208))))))

(assert (=> start!97202 e!631111))

(declare-fun array_inv!26612 (array!71710) Bool)

(assert (=> start!97202 (array_inv!26612 _keys!1208)))

(assert (=> start!97202 true))

(declare-fun array_inv!26613 (array!71708) Bool)

(assert (=> start!97202 (and (array_inv!26613 _values!996) e!631115)))

(declare-fun b!1105921 () Bool)

(declare-fun res!738013 () Bool)

(assert (=> b!1105921 (=> (not res!738013) (not e!631114))))

(declare-fun lt!495204 () array!71710)

(declare-datatypes ((List!24120 0))(
  ( (Nil!24117) (Cons!24116 (h!25325 (_ BitVec 64)) (t!34376 List!24120)) )
))
(declare-fun arrayNoDuplicates!0 (array!71710 (_ BitVec 32) List!24120) Bool)

(assert (=> b!1105921 (= res!738013 (arrayNoDuplicates!0 lt!495204 #b00000000000000000000000000000000 Nil!24117))))

(declare-fun b!1105922 () Bool)

(declare-fun res!738016 () Bool)

(assert (=> b!1105922 (=> (not res!738016) (not e!631111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71710 (_ BitVec 32)) Bool)

(assert (=> b!1105922 (= res!738016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42976 () Bool)

(assert (=> mapIsEmpty!42976 mapRes!42976))

(declare-fun b!1105923 () Bool)

(declare-fun res!738014 () Bool)

(assert (=> b!1105923 (=> (not res!738014) (not e!631111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105923 (= res!738014 (validKeyInArray!0 k0!934))))

(declare-fun b!1105924 () Bool)

(assert (=> b!1105924 (= e!631112 tp_is_empty!27439)))

(declare-fun b!1105925 () Bool)

(declare-fun res!738019 () Bool)

(assert (=> b!1105925 (=> (not res!738019) (not e!631111))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105925 (= res!738019 (and (= (size!35045 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35046 _keys!1208) (size!35045 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105926 () Bool)

(assert (=> b!1105926 (= e!631111 e!631114)))

(declare-fun res!738018 () Bool)

(assert (=> b!1105926 (=> (not res!738018) (not e!631114))))

(assert (=> b!1105926 (= res!738018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495204 mask!1564))))

(assert (=> b!1105926 (= lt!495204 (array!71711 (store (arr!34508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35046 _keys!1208)))))

(declare-fun b!1105927 () Bool)

(declare-fun res!738012 () Bool)

(assert (=> b!1105927 (=> (not res!738012) (not e!631111))))

(assert (=> b!1105927 (= res!738012 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24117))))

(declare-fun b!1105928 () Bool)

(declare-fun res!738010 () Bool)

(assert (=> b!1105928 (=> (not res!738010) (not e!631111))))

(assert (=> b!1105928 (= res!738010 (= (select (arr!34508 _keys!1208) i!673) k0!934))))

(declare-fun b!1105929 () Bool)

(declare-fun res!738017 () Bool)

(assert (=> b!1105929 (=> (not res!738017) (not e!631111))))

(assert (=> b!1105929 (= res!738017 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35046 _keys!1208))))))

(assert (= (and start!97202 res!738011) b!1105917))

(assert (= (and b!1105917 res!738015) b!1105925))

(assert (= (and b!1105925 res!738019) b!1105922))

(assert (= (and b!1105922 res!738016) b!1105927))

(assert (= (and b!1105927 res!738012) b!1105929))

(assert (= (and b!1105929 res!738017) b!1105923))

(assert (= (and b!1105923 res!738014) b!1105928))

(assert (= (and b!1105928 res!738010) b!1105926))

(assert (= (and b!1105926 res!738018) b!1105921))

(assert (= (and b!1105921 res!738013) b!1105919))

(assert (= (and b!1105920 condMapEmpty!42976) mapIsEmpty!42976))

(assert (= (and b!1105920 (not condMapEmpty!42976)) mapNonEmpty!42976))

(get-info :version)

(assert (= (and mapNonEmpty!42976 ((_ is ValueCellFull!13010) mapValue!42976)) b!1105924))

(assert (= (and b!1105920 ((_ is ValueCellFull!13010) mapDefault!42976)) b!1105918))

(assert (= start!97202 b!1105920))

(declare-fun m!1024629 () Bool)

(assert (=> mapNonEmpty!42976 m!1024629))

(declare-fun m!1024631 () Bool)

(assert (=> b!1105923 m!1024631))

(declare-fun m!1024633 () Bool)

(assert (=> b!1105919 m!1024633))

(declare-fun m!1024635 () Bool)

(assert (=> b!1105919 m!1024635))

(declare-fun m!1024637 () Bool)

(assert (=> b!1105927 m!1024637))

(declare-fun m!1024639 () Bool)

(assert (=> b!1105917 m!1024639))

(declare-fun m!1024641 () Bool)

(assert (=> b!1105922 m!1024641))

(declare-fun m!1024643 () Bool)

(assert (=> b!1105928 m!1024643))

(declare-fun m!1024645 () Bool)

(assert (=> start!97202 m!1024645))

(declare-fun m!1024647 () Bool)

(assert (=> start!97202 m!1024647))

(declare-fun m!1024649 () Bool)

(assert (=> b!1105921 m!1024649))

(declare-fun m!1024651 () Bool)

(assert (=> b!1105926 m!1024651))

(declare-fun m!1024653 () Bool)

(assert (=> b!1105926 m!1024653))

(check-sat (not b!1105919) tp_is_empty!27439 (not b!1105927) (not mapNonEmpty!42976) (not b!1105921) (not b!1105923) (not start!97202) (not b!1105917) (not b!1105926) (not b!1105922))
(check-sat)
