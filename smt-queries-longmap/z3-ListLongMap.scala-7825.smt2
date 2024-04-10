; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97696 () Bool)

(assert start!97696)

(declare-fun b!1116810 () Bool)

(declare-fun res!745730 () Bool)

(declare-fun e!636266 () Bool)

(assert (=> b!1116810 (=> (not res!745730) (not e!636266))))

(declare-datatypes ((array!72751 0))(
  ( (array!72752 (arr!35028 (Array (_ BitVec 32) (_ BitVec 64))) (size!35564 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72751)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72751 (_ BitVec 32)) Bool)

(assert (=> b!1116810 (= res!745730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116811 () Bool)

(declare-fun res!745723 () Bool)

(assert (=> b!1116811 (=> (not res!745723) (not e!636266))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116811 (= res!745723 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35564 _keys!1208))))))

(declare-fun b!1116812 () Bool)

(declare-fun res!745727 () Bool)

(assert (=> b!1116812 (=> (not res!745727) (not e!636266))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42363 0))(
  ( (V!42364 (val!14020 Int)) )
))
(declare-datatypes ((ValueCell!13254 0))(
  ( (ValueCellFull!13254 (v!16653 V!42363)) (EmptyCell!13254) )
))
(declare-datatypes ((array!72753 0))(
  ( (array!72754 (arr!35029 (Array (_ BitVec 32) ValueCell!13254)) (size!35565 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72753)

(assert (=> b!1116812 (= res!745727 (and (= (size!35565 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35564 _keys!1208) (size!35565 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116813 () Bool)

(declare-fun res!745726 () Bool)

(assert (=> b!1116813 (=> (not res!745726) (not e!636266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116813 (= res!745726 (validMask!0 mask!1564))))

(declare-fun b!1116814 () Bool)

(declare-fun e!636263 () Bool)

(declare-fun tp_is_empty!27927 () Bool)

(assert (=> b!1116814 (= e!636263 tp_is_empty!27927)))

(declare-fun b!1116815 () Bool)

(declare-fun e!636265 () Bool)

(declare-fun e!636267 () Bool)

(declare-fun mapRes!43708 () Bool)

(assert (=> b!1116815 (= e!636265 (and e!636267 mapRes!43708))))

(declare-fun condMapEmpty!43708 () Bool)

(declare-fun mapDefault!43708 () ValueCell!13254)

(assert (=> b!1116815 (= condMapEmpty!43708 (= (arr!35029 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13254)) mapDefault!43708)))))

(declare-fun mapIsEmpty!43708 () Bool)

(assert (=> mapIsEmpty!43708 mapRes!43708))

(declare-fun mapNonEmpty!43708 () Bool)

(declare-fun tp!82952 () Bool)

(assert (=> mapNonEmpty!43708 (= mapRes!43708 (and tp!82952 e!636263))))

(declare-fun mapKey!43708 () (_ BitVec 32))

(declare-fun mapValue!43708 () ValueCell!13254)

(declare-fun mapRest!43708 () (Array (_ BitVec 32) ValueCell!13254))

(assert (=> mapNonEmpty!43708 (= (arr!35029 _values!996) (store mapRest!43708 mapKey!43708 mapValue!43708))))

(declare-fun b!1116816 () Bool)

(declare-fun res!745728 () Bool)

(assert (=> b!1116816 (=> (not res!745728) (not e!636266))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116816 (= res!745728 (= (select (arr!35028 _keys!1208) i!673) k0!934))))

(declare-fun res!745725 () Bool)

(assert (=> start!97696 (=> (not res!745725) (not e!636266))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97696 (= res!745725 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35564 _keys!1208))))))

(assert (=> start!97696 e!636266))

(declare-fun array_inv!26922 (array!72751) Bool)

(assert (=> start!97696 (array_inv!26922 _keys!1208)))

(assert (=> start!97696 true))

(declare-fun array_inv!26923 (array!72753) Bool)

(assert (=> start!97696 (and (array_inv!26923 _values!996) e!636265)))

(declare-fun b!1116817 () Bool)

(declare-fun e!636262 () Bool)

(assert (=> b!1116817 (= e!636266 e!636262)))

(declare-fun res!745732 () Bool)

(assert (=> b!1116817 (=> (not res!745732) (not e!636262))))

(declare-fun lt!497192 () array!72751)

(assert (=> b!1116817 (= res!745732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497192 mask!1564))))

(assert (=> b!1116817 (= lt!497192 (array!72752 (store (arr!35028 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35564 _keys!1208)))))

(declare-fun b!1116818 () Bool)

(declare-fun res!745724 () Bool)

(assert (=> b!1116818 (=> (not res!745724) (not e!636266))))

(declare-datatypes ((List!24376 0))(
  ( (Nil!24373) (Cons!24372 (h!25581 (_ BitVec 64)) (t!34857 List!24376)) )
))
(declare-fun arrayNoDuplicates!0 (array!72751 (_ BitVec 32) List!24376) Bool)

(assert (=> b!1116818 (= res!745724 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24373))))

(declare-fun b!1116819 () Bool)

(assert (=> b!1116819 (= e!636262 (not true))))

(declare-fun arrayContainsKey!0 (array!72751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116819 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36650 0))(
  ( (Unit!36651) )
))
(declare-fun lt!497191 () Unit!36650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72751 (_ BitVec 64) (_ BitVec 32)) Unit!36650)

(assert (=> b!1116819 (= lt!497191 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116820 () Bool)

(declare-fun res!745731 () Bool)

(assert (=> b!1116820 (=> (not res!745731) (not e!636266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116820 (= res!745731 (validKeyInArray!0 k0!934))))

(declare-fun b!1116821 () Bool)

(declare-fun res!745729 () Bool)

(assert (=> b!1116821 (=> (not res!745729) (not e!636262))))

(assert (=> b!1116821 (= res!745729 (arrayNoDuplicates!0 lt!497192 #b00000000000000000000000000000000 Nil!24373))))

(declare-fun b!1116822 () Bool)

(assert (=> b!1116822 (= e!636267 tp_is_empty!27927)))

(assert (= (and start!97696 res!745725) b!1116813))

(assert (= (and b!1116813 res!745726) b!1116812))

(assert (= (and b!1116812 res!745727) b!1116810))

(assert (= (and b!1116810 res!745730) b!1116818))

(assert (= (and b!1116818 res!745724) b!1116811))

(assert (= (and b!1116811 res!745723) b!1116820))

(assert (= (and b!1116820 res!745731) b!1116816))

(assert (= (and b!1116816 res!745728) b!1116817))

(assert (= (and b!1116817 res!745732) b!1116821))

(assert (= (and b!1116821 res!745729) b!1116819))

(assert (= (and b!1116815 condMapEmpty!43708) mapIsEmpty!43708))

(assert (= (and b!1116815 (not condMapEmpty!43708)) mapNonEmpty!43708))

(get-info :version)

(assert (= (and mapNonEmpty!43708 ((_ is ValueCellFull!13254) mapValue!43708)) b!1116814))

(assert (= (and b!1116815 ((_ is ValueCellFull!13254) mapDefault!43708)) b!1116822))

(assert (= start!97696 b!1116815))

(declare-fun m!1032895 () Bool)

(assert (=> b!1116817 m!1032895))

(declare-fun m!1032897 () Bool)

(assert (=> b!1116817 m!1032897))

(declare-fun m!1032899 () Bool)

(assert (=> b!1116819 m!1032899))

(declare-fun m!1032901 () Bool)

(assert (=> b!1116819 m!1032901))

(declare-fun m!1032903 () Bool)

(assert (=> mapNonEmpty!43708 m!1032903))

(declare-fun m!1032905 () Bool)

(assert (=> b!1116816 m!1032905))

(declare-fun m!1032907 () Bool)

(assert (=> b!1116821 m!1032907))

(declare-fun m!1032909 () Bool)

(assert (=> b!1116818 m!1032909))

(declare-fun m!1032911 () Bool)

(assert (=> b!1116820 m!1032911))

(declare-fun m!1032913 () Bool)

(assert (=> b!1116810 m!1032913))

(declare-fun m!1032915 () Bool)

(assert (=> b!1116813 m!1032915))

(declare-fun m!1032917 () Bool)

(assert (=> start!97696 m!1032917))

(declare-fun m!1032919 () Bool)

(assert (=> start!97696 m!1032919))

(check-sat (not b!1116817) (not b!1116821) (not b!1116818) (not b!1116813) (not b!1116810) tp_is_empty!27927 (not b!1116820) (not mapNonEmpty!43708) (not b!1116819) (not start!97696))
(check-sat)
