; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97960 () Bool)

(assert start!97960)

(declare-fun mapNonEmpty!43750 () Bool)

(declare-fun mapRes!43750 () Bool)

(declare-fun tp!82994 () Bool)

(declare-fun e!637372 () Bool)

(assert (=> mapNonEmpty!43750 (= mapRes!43750 (and tp!82994 e!637372))))

(declare-datatypes ((V!42401 0))(
  ( (V!42402 (val!14034 Int)) )
))
(declare-datatypes ((ValueCell!13268 0))(
  ( (ValueCellFull!13268 (v!16663 V!42401)) (EmptyCell!13268) )
))
(declare-fun mapRest!43750 () (Array (_ BitVec 32) ValueCell!13268))

(declare-fun mapValue!43750 () ValueCell!13268)

(declare-datatypes ((array!72847 0))(
  ( (array!72848 (arr!35070 (Array (_ BitVec 32) ValueCell!13268)) (size!35607 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72847)

(declare-fun mapKey!43750 () (_ BitVec 32))

(assert (=> mapNonEmpty!43750 (= (arr!35070 _values!996) (store mapRest!43750 mapKey!43750 mapValue!43750))))

(declare-fun b!1118683 () Bool)

(declare-fun res!746674 () Bool)

(declare-fun e!637373 () Bool)

(assert (=> b!1118683 (=> (not res!746674) (not e!637373))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118683 (= res!746674 (validMask!0 mask!1564))))

(declare-fun b!1118684 () Bool)

(declare-fun res!746665 () Bool)

(declare-fun e!637369 () Bool)

(assert (=> b!1118684 (=> (not res!746665) (not e!637369))))

(declare-datatypes ((array!72849 0))(
  ( (array!72850 (arr!35071 (Array (_ BitVec 32) (_ BitVec 64))) (size!35608 (_ BitVec 32))) )
))
(declare-fun lt!497790 () array!72849)

(declare-datatypes ((List!24409 0))(
  ( (Nil!24406) (Cons!24405 (h!25623 (_ BitVec 64)) (t!34882 List!24409)) )
))
(declare-fun arrayNoDuplicates!0 (array!72849 (_ BitVec 32) List!24409) Bool)

(assert (=> b!1118684 (= res!746665 (arrayNoDuplicates!0 lt!497790 #b00000000000000000000000000000000 Nil!24406))))

(declare-fun b!1118685 () Bool)

(declare-fun e!637370 () Bool)

(declare-fun tp_is_empty!27955 () Bool)

(assert (=> b!1118685 (= e!637370 tp_is_empty!27955)))

(declare-fun b!1118686 () Bool)

(assert (=> b!1118686 (= e!637373 e!637369)))

(declare-fun res!746672 () Bool)

(assert (=> b!1118686 (=> (not res!746672) (not e!637369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72849 (_ BitVec 32)) Bool)

(assert (=> b!1118686 (= res!746672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497790 mask!1564))))

(declare-fun _keys!1208 () array!72849)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118686 (= lt!497790 (array!72850 (store (arr!35071 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35608 _keys!1208)))))

(declare-fun b!1118687 () Bool)

(declare-fun e!637371 () Bool)

(assert (=> b!1118687 (= e!637371 (and e!637370 mapRes!43750))))

(declare-fun condMapEmpty!43750 () Bool)

(declare-fun mapDefault!43750 () ValueCell!13268)

(assert (=> b!1118687 (= condMapEmpty!43750 (= (arr!35070 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13268)) mapDefault!43750)))))

(declare-fun b!1118688 () Bool)

(declare-fun res!746666 () Bool)

(assert (=> b!1118688 (=> (not res!746666) (not e!637373))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118688 (= res!746666 (validKeyInArray!0 k0!934))))

(declare-fun res!746671 () Bool)

(assert (=> start!97960 (=> (not res!746671) (not e!637373))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97960 (= res!746671 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35608 _keys!1208))))))

(assert (=> start!97960 e!637373))

(declare-fun array_inv!27018 (array!72849) Bool)

(assert (=> start!97960 (array_inv!27018 _keys!1208)))

(assert (=> start!97960 true))

(declare-fun array_inv!27019 (array!72847) Bool)

(assert (=> start!97960 (and (array_inv!27019 _values!996) e!637371)))

(declare-fun b!1118689 () Bool)

(declare-fun res!746673 () Bool)

(assert (=> b!1118689 (=> (not res!746673) (not e!637373))))

(assert (=> b!1118689 (= res!746673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118690 () Bool)

(assert (=> b!1118690 (= e!637372 tp_is_empty!27955)))

(declare-fun b!1118691 () Bool)

(declare-fun res!746668 () Bool)

(assert (=> b!1118691 (=> (not res!746668) (not e!637373))))

(assert (=> b!1118691 (= res!746668 (= (select (arr!35071 _keys!1208) i!673) k0!934))))

(declare-fun b!1118692 () Bool)

(declare-fun res!746669 () Bool)

(assert (=> b!1118692 (=> (not res!746669) (not e!637373))))

(assert (=> b!1118692 (= res!746669 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24406))))

(declare-fun b!1118693 () Bool)

(declare-fun res!746667 () Bool)

(assert (=> b!1118693 (=> (not res!746667) (not e!637373))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118693 (= res!746667 (and (= (size!35607 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35608 _keys!1208) (size!35607 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118694 () Bool)

(assert (=> b!1118694 (= e!637369 (not true))))

(declare-fun arrayContainsKey!0 (array!72849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118694 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36651 0))(
  ( (Unit!36652) )
))
(declare-fun lt!497791 () Unit!36651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72849 (_ BitVec 64) (_ BitVec 32)) Unit!36651)

(assert (=> b!1118694 (= lt!497791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43750 () Bool)

(assert (=> mapIsEmpty!43750 mapRes!43750))

(declare-fun b!1118695 () Bool)

(declare-fun res!746670 () Bool)

(assert (=> b!1118695 (=> (not res!746670) (not e!637373))))

(assert (=> b!1118695 (= res!746670 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35608 _keys!1208))))))

(assert (= (and start!97960 res!746671) b!1118683))

(assert (= (and b!1118683 res!746674) b!1118693))

(assert (= (and b!1118693 res!746667) b!1118689))

(assert (= (and b!1118689 res!746673) b!1118692))

(assert (= (and b!1118692 res!746669) b!1118695))

(assert (= (and b!1118695 res!746670) b!1118688))

(assert (= (and b!1118688 res!746666) b!1118691))

(assert (= (and b!1118691 res!746668) b!1118686))

(assert (= (and b!1118686 res!746672) b!1118684))

(assert (= (and b!1118684 res!746665) b!1118694))

(assert (= (and b!1118687 condMapEmpty!43750) mapIsEmpty!43750))

(assert (= (and b!1118687 (not condMapEmpty!43750)) mapNonEmpty!43750))

(get-info :version)

(assert (= (and mapNonEmpty!43750 ((_ is ValueCellFull!13268) mapValue!43750)) b!1118690))

(assert (= (and b!1118687 ((_ is ValueCellFull!13268) mapDefault!43750)) b!1118685))

(assert (= start!97960 b!1118687))

(declare-fun m!1034931 () Bool)

(assert (=> b!1118694 m!1034931))

(declare-fun m!1034933 () Bool)

(assert (=> b!1118694 m!1034933))

(declare-fun m!1034935 () Bool)

(assert (=> b!1118683 m!1034935))

(declare-fun m!1034937 () Bool)

(assert (=> b!1118686 m!1034937))

(declare-fun m!1034939 () Bool)

(assert (=> b!1118686 m!1034939))

(declare-fun m!1034941 () Bool)

(assert (=> b!1118689 m!1034941))

(declare-fun m!1034943 () Bool)

(assert (=> b!1118688 m!1034943))

(declare-fun m!1034945 () Bool)

(assert (=> mapNonEmpty!43750 m!1034945))

(declare-fun m!1034947 () Bool)

(assert (=> b!1118691 m!1034947))

(declare-fun m!1034949 () Bool)

(assert (=> b!1118692 m!1034949))

(declare-fun m!1034951 () Bool)

(assert (=> b!1118684 m!1034951))

(declare-fun m!1034953 () Bool)

(assert (=> start!97960 m!1034953))

(declare-fun m!1034955 () Bool)

(assert (=> start!97960 m!1034955))

(check-sat (not b!1118683) (not mapNonEmpty!43750) (not b!1118688) (not b!1118692) (not b!1118684) (not start!97960) (not b!1118689) tp_is_empty!27955 (not b!1118694) (not b!1118686))
(check-sat)
