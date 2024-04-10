; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99196 () Bool)

(assert start!99196)

(declare-fun b_free!24801 () Bool)

(declare-fun b_next!24801 () Bool)

(assert (=> start!99196 (= b_free!24801 (not b_next!24801))))

(declare-fun tp!87114 () Bool)

(declare-fun b_and!40451 () Bool)

(assert (=> start!99196 (= tp!87114 b_and!40451)))

(declare-fun mapNonEmpty!45821 () Bool)

(declare-fun mapRes!45821 () Bool)

(declare-fun tp!87113 () Bool)

(declare-fun e!663777 () Bool)

(assert (=> mapNonEmpty!45821 (= mapRes!45821 (and tp!87113 e!663777))))

(declare-fun mapKey!45821 () (_ BitVec 32))

(declare-datatypes ((V!44235 0))(
  ( (V!44236 (val!14722 Int)) )
))
(declare-datatypes ((ValueCell!13956 0))(
  ( (ValueCellFull!13956 (v!17359 V!44235)) (EmptyCell!13956) )
))
(declare-fun mapRest!45821 () (Array (_ BitVec 32) ValueCell!13956))

(declare-datatypes ((array!75485 0))(
  ( (array!75486 (arr!36393 (Array (_ BitVec 32) ValueCell!13956)) (size!36929 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75485)

(declare-fun mapValue!45821 () ValueCell!13956)

(assert (=> mapNonEmpty!45821 (= (arr!36393 _values!996) (store mapRest!45821 mapKey!45821 mapValue!45821))))

(declare-fun b!1167877 () Bool)

(declare-fun res!774794 () Bool)

(declare-fun e!663774 () Bool)

(assert (=> b!1167877 (=> (not res!774794) (not e!663774))))

(declare-datatypes ((array!75487 0))(
  ( (array!75488 (arr!36394 (Array (_ BitVec 32) (_ BitVec 64))) (size!36930 (_ BitVec 32))) )
))
(declare-fun lt!525803 () array!75487)

(declare-datatypes ((List!25522 0))(
  ( (Nil!25519) (Cons!25518 (h!26727 (_ BitVec 64)) (t!37315 List!25522)) )
))
(declare-fun arrayNoDuplicates!0 (array!75487 (_ BitVec 32) List!25522) Bool)

(assert (=> b!1167877 (= res!774794 (arrayNoDuplicates!0 lt!525803 #b00000000000000000000000000000000 Nil!25519))))

(declare-fun b!1167878 () Bool)

(declare-fun e!663771 () Bool)

(assert (=> b!1167878 (= e!663771 true)))

(declare-fun _keys!1208 () array!75487)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44235)

(declare-fun zeroValue!944 () V!44235)

(declare-fun lt!525805 () array!75485)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18782 0))(
  ( (tuple2!18783 (_1!9402 (_ BitVec 64)) (_2!9402 V!44235)) )
))
(declare-datatypes ((List!25523 0))(
  ( (Nil!25520) (Cons!25519 (h!26728 tuple2!18782) (t!37316 List!25523)) )
))
(declare-datatypes ((ListLongMap!16751 0))(
  ( (ListLongMap!16752 (toList!8391 List!25523)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4855 (array!75487 array!75485 (_ BitVec 32) (_ BitVec 32) V!44235 V!44235 (_ BitVec 32) Int) ListLongMap!16751)

(declare-fun -!1466 (ListLongMap!16751 (_ BitVec 64)) ListLongMap!16751)

(assert (=> b!1167878 (= (getCurrentListMapNoExtraKeys!4855 lt!525803 lt!525805 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1466 (getCurrentListMapNoExtraKeys!4855 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38534 0))(
  ( (Unit!38535) )
))
(declare-fun lt!525802 () Unit!38534)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!693 (array!75487 array!75485 (_ BitVec 32) (_ BitVec 32) V!44235 V!44235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38534)

(assert (=> b!1167878 (= lt!525802 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167879 () Bool)

(declare-fun res!774800 () Bool)

(declare-fun e!663772 () Bool)

(assert (=> b!1167879 (=> (not res!774800) (not e!663772))))

(assert (=> b!1167879 (= res!774800 (= (select (arr!36394 _keys!1208) i!673) k0!934))))

(declare-fun b!1167880 () Bool)

(assert (=> b!1167880 (= e!663772 e!663774)))

(declare-fun res!774792 () Bool)

(assert (=> b!1167880 (=> (not res!774792) (not e!663774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75487 (_ BitVec 32)) Bool)

(assert (=> b!1167880 (= res!774792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525803 mask!1564))))

(assert (=> b!1167880 (= lt!525803 (array!75488 (store (arr!36394 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36930 _keys!1208)))))

(declare-fun b!1167881 () Bool)

(declare-fun e!663776 () Bool)

(declare-fun e!663770 () Bool)

(assert (=> b!1167881 (= e!663776 (and e!663770 mapRes!45821))))

(declare-fun condMapEmpty!45821 () Bool)

(declare-fun mapDefault!45821 () ValueCell!13956)

(assert (=> b!1167881 (= condMapEmpty!45821 (= (arr!36393 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13956)) mapDefault!45821)))))

(declare-fun b!1167882 () Bool)

(declare-fun res!774797 () Bool)

(assert (=> b!1167882 (=> (not res!774797) (not e!663772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167882 (= res!774797 (validMask!0 mask!1564))))

(declare-fun b!1167883 () Bool)

(declare-fun res!774803 () Bool)

(assert (=> b!1167883 (=> (not res!774803) (not e!663772))))

(assert (=> b!1167883 (= res!774803 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25519))))

(declare-fun b!1167885 () Bool)

(declare-fun res!774801 () Bool)

(assert (=> b!1167885 (=> (not res!774801) (not e!663772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167885 (= res!774801 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45821 () Bool)

(assert (=> mapIsEmpty!45821 mapRes!45821))

(declare-fun b!1167886 () Bool)

(declare-fun res!774798 () Bool)

(assert (=> b!1167886 (=> (not res!774798) (not e!663772))))

(assert (=> b!1167886 (= res!774798 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36930 _keys!1208))))))

(declare-fun b!1167887 () Bool)

(declare-fun e!663775 () Bool)

(assert (=> b!1167887 (= e!663775 e!663771)))

(declare-fun res!774793 () Bool)

(assert (=> b!1167887 (=> res!774793 e!663771)))

(assert (=> b!1167887 (= res!774793 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525804 () ListLongMap!16751)

(assert (=> b!1167887 (= lt!525804 (getCurrentListMapNoExtraKeys!4855 lt!525803 lt!525805 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2836 (Int (_ BitVec 64)) V!44235)

(assert (=> b!1167887 (= lt!525805 (array!75486 (store (arr!36393 _values!996) i!673 (ValueCellFull!13956 (dynLambda!2836 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36929 _values!996)))))

(declare-fun lt!525806 () ListLongMap!16751)

(assert (=> b!1167887 (= lt!525806 (getCurrentListMapNoExtraKeys!4855 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167888 () Bool)

(assert (=> b!1167888 (= e!663774 (not e!663775))))

(declare-fun res!774802 () Bool)

(assert (=> b!1167888 (=> res!774802 e!663775)))

(assert (=> b!1167888 (= res!774802 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167888 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525807 () Unit!38534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75487 (_ BitVec 64) (_ BitVec 32)) Unit!38534)

(assert (=> b!1167888 (= lt!525807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167889 () Bool)

(declare-fun tp_is_empty!29331 () Bool)

(assert (=> b!1167889 (= e!663770 tp_is_empty!29331)))

(declare-fun b!1167884 () Bool)

(declare-fun res!774796 () Bool)

(assert (=> b!1167884 (=> (not res!774796) (not e!663772))))

(assert (=> b!1167884 (= res!774796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!774799 () Bool)

(assert (=> start!99196 (=> (not res!774799) (not e!663772))))

(assert (=> start!99196 (= res!774799 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36930 _keys!1208))))))

(assert (=> start!99196 e!663772))

(assert (=> start!99196 tp_is_empty!29331))

(declare-fun array_inv!27818 (array!75487) Bool)

(assert (=> start!99196 (array_inv!27818 _keys!1208)))

(assert (=> start!99196 true))

(assert (=> start!99196 tp!87114))

(declare-fun array_inv!27819 (array!75485) Bool)

(assert (=> start!99196 (and (array_inv!27819 _values!996) e!663776)))

(declare-fun b!1167890 () Bool)

(declare-fun res!774795 () Bool)

(assert (=> b!1167890 (=> (not res!774795) (not e!663772))))

(assert (=> b!1167890 (= res!774795 (and (= (size!36929 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36930 _keys!1208) (size!36929 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167891 () Bool)

(assert (=> b!1167891 (= e!663777 tp_is_empty!29331)))

(assert (= (and start!99196 res!774799) b!1167882))

(assert (= (and b!1167882 res!774797) b!1167890))

(assert (= (and b!1167890 res!774795) b!1167884))

(assert (= (and b!1167884 res!774796) b!1167883))

(assert (= (and b!1167883 res!774803) b!1167886))

(assert (= (and b!1167886 res!774798) b!1167885))

(assert (= (and b!1167885 res!774801) b!1167879))

(assert (= (and b!1167879 res!774800) b!1167880))

(assert (= (and b!1167880 res!774792) b!1167877))

(assert (= (and b!1167877 res!774794) b!1167888))

(assert (= (and b!1167888 (not res!774802)) b!1167887))

(assert (= (and b!1167887 (not res!774793)) b!1167878))

(assert (= (and b!1167881 condMapEmpty!45821) mapIsEmpty!45821))

(assert (= (and b!1167881 (not condMapEmpty!45821)) mapNonEmpty!45821))

(get-info :version)

(assert (= (and mapNonEmpty!45821 ((_ is ValueCellFull!13956) mapValue!45821)) b!1167891))

(assert (= (and b!1167881 ((_ is ValueCellFull!13956) mapDefault!45821)) b!1167889))

(assert (= start!99196 b!1167881))

(declare-fun b_lambda!19907 () Bool)

(assert (=> (not b_lambda!19907) (not b!1167887)))

(declare-fun t!37314 () Bool)

(declare-fun tb!9613 () Bool)

(assert (=> (and start!99196 (= defaultEntry!1004 defaultEntry!1004) t!37314) tb!9613))

(declare-fun result!19791 () Bool)

(assert (=> tb!9613 (= result!19791 tp_is_empty!29331)))

(assert (=> b!1167887 t!37314))

(declare-fun b_and!40453 () Bool)

(assert (= b_and!40451 (and (=> t!37314 result!19791) b_and!40453)))

(declare-fun m!1075763 () Bool)

(assert (=> b!1167883 m!1075763))

(declare-fun m!1075765 () Bool)

(assert (=> b!1167879 m!1075765))

(declare-fun m!1075767 () Bool)

(assert (=> b!1167877 m!1075767))

(declare-fun m!1075769 () Bool)

(assert (=> b!1167887 m!1075769))

(declare-fun m!1075771 () Bool)

(assert (=> b!1167887 m!1075771))

(declare-fun m!1075773 () Bool)

(assert (=> b!1167887 m!1075773))

(declare-fun m!1075775 () Bool)

(assert (=> b!1167887 m!1075775))

(declare-fun m!1075777 () Bool)

(assert (=> b!1167888 m!1075777))

(declare-fun m!1075779 () Bool)

(assert (=> b!1167888 m!1075779))

(declare-fun m!1075781 () Bool)

(assert (=> b!1167880 m!1075781))

(declare-fun m!1075783 () Bool)

(assert (=> b!1167880 m!1075783))

(declare-fun m!1075785 () Bool)

(assert (=> b!1167882 m!1075785))

(declare-fun m!1075787 () Bool)

(assert (=> b!1167878 m!1075787))

(declare-fun m!1075789 () Bool)

(assert (=> b!1167878 m!1075789))

(assert (=> b!1167878 m!1075789))

(declare-fun m!1075791 () Bool)

(assert (=> b!1167878 m!1075791))

(declare-fun m!1075793 () Bool)

(assert (=> b!1167878 m!1075793))

(declare-fun m!1075795 () Bool)

(assert (=> b!1167885 m!1075795))

(declare-fun m!1075797 () Bool)

(assert (=> mapNonEmpty!45821 m!1075797))

(declare-fun m!1075799 () Bool)

(assert (=> start!99196 m!1075799))

(declare-fun m!1075801 () Bool)

(assert (=> start!99196 m!1075801))

(declare-fun m!1075803 () Bool)

(assert (=> b!1167884 m!1075803))

(check-sat (not b_next!24801) (not b!1167888) (not b!1167887) (not b!1167883) (not b!1167877) (not b_lambda!19907) tp_is_empty!29331 (not start!99196) b_and!40453 (not b!1167882) (not mapNonEmpty!45821) (not b!1167884) (not b!1167880) (not b!1167878) (not b!1167885))
(check-sat b_and!40453 (not b_next!24801))
