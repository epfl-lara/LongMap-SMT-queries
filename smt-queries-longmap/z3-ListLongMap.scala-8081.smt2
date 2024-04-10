; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99354 () Bool)

(assert start!99354)

(declare-fun b_free!24933 () Bool)

(declare-fun b_next!24933 () Bool)

(assert (=> start!99354 (= b_free!24933 (not b_next!24933))))

(declare-fun tp!87512 () Bool)

(declare-fun b_and!40733 () Bool)

(assert (=> start!99354 (= tp!87512 b_and!40733)))

(declare-fun mapNonEmpty!46022 () Bool)

(declare-fun mapRes!46022 () Bool)

(declare-fun tp!87513 () Bool)

(declare-fun e!666033 () Bool)

(assert (=> mapNonEmpty!46022 (= mapRes!46022 (and tp!87513 e!666033))))

(declare-fun mapKey!46022 () (_ BitVec 32))

(declare-datatypes ((V!44411 0))(
  ( (V!44412 (val!14788 Int)) )
))
(declare-datatypes ((ValueCell!14022 0))(
  ( (ValueCellFull!14022 (v!17426 V!44411)) (EmptyCell!14022) )
))
(declare-fun mapValue!46022 () ValueCell!14022)

(declare-datatypes ((array!75743 0))(
  ( (array!75744 (arr!36521 (Array (_ BitVec 32) ValueCell!14022)) (size!37057 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75743)

(declare-fun mapRest!46022 () (Array (_ BitVec 32) ValueCell!14022))

(assert (=> mapNonEmpty!46022 (= (arr!36521 _values!996) (store mapRest!46022 mapKey!46022 mapValue!46022))))

(declare-fun b!1171787 () Bool)

(declare-fun e!666037 () Bool)

(declare-fun tp_is_empty!29463 () Bool)

(assert (=> b!1171787 (= e!666037 tp_is_empty!29463)))

(declare-fun e!666036 () Bool)

(declare-datatypes ((array!75745 0))(
  ( (array!75746 (arr!36522 (Array (_ BitVec 32) (_ BitVec 64))) (size!37058 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75745)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1171788 () Bool)

(declare-fun arrayContainsKey!0 (array!75745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171788 (= e!666036 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171789 () Bool)

(declare-fun e!666034 () Bool)

(assert (=> b!1171789 (= e!666034 e!666036)))

(declare-fun res!777896 () Bool)

(assert (=> b!1171789 (=> res!777896 e!666036)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171789 (= res!777896 (not (= (select (arr!36522 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171790 () Bool)

(declare-fun e!666041 () Bool)

(declare-fun e!666038 () Bool)

(assert (=> b!1171790 (= e!666041 e!666038)))

(declare-fun res!777898 () Bool)

(assert (=> b!1171790 (=> res!777898 e!666038)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171790 (= res!777898 (not (validKeyInArray!0 (select (arr!36522 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18892 0))(
  ( (tuple2!18893 (_1!9457 (_ BitVec 64)) (_2!9457 V!44411)) )
))
(declare-datatypes ((List!25628 0))(
  ( (Nil!25625) (Cons!25624 (h!26833 tuple2!18892) (t!37553 List!25628)) )
))
(declare-datatypes ((ListLongMap!16861 0))(
  ( (ListLongMap!16862 (toList!8446 List!25628)) )
))
(declare-fun lt!527901 () ListLongMap!16861)

(declare-fun lt!527909 () ListLongMap!16861)

(assert (=> b!1171790 (= lt!527901 lt!527909)))

(declare-fun lt!527907 () ListLongMap!16861)

(declare-fun -!1514 (ListLongMap!16861 (_ BitVec 64)) ListLongMap!16861)

(assert (=> b!1171790 (= lt!527909 (-!1514 lt!527907 k0!934))))

(declare-fun zeroValue!944 () V!44411)

(declare-fun lt!527908 () array!75743)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44411)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!527911 () array!75745)

(declare-fun getCurrentListMapNoExtraKeys!4910 (array!75745 array!75743 (_ BitVec 32) (_ BitVec 32) V!44411 V!44411 (_ BitVec 32) Int) ListLongMap!16861)

(assert (=> b!1171790 (= lt!527901 (getCurrentListMapNoExtraKeys!4910 lt!527911 lt!527908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171790 (= lt!527907 (getCurrentListMapNoExtraKeys!4910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38644 0))(
  ( (Unit!38645) )
))
(declare-fun lt!527912 () Unit!38644)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!741 (array!75745 array!75743 (_ BitVec 32) (_ BitVec 32) V!44411 V!44411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38644)

(assert (=> b!1171790 (= lt!527912 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171791 () Bool)

(assert (=> b!1171791 (= e!666033 tp_is_empty!29463)))

(declare-fun b!1171792 () Bool)

(declare-fun e!666032 () Bool)

(assert (=> b!1171792 (= e!666032 (and e!666037 mapRes!46022))))

(declare-fun condMapEmpty!46022 () Bool)

(declare-fun mapDefault!46022 () ValueCell!14022)

(assert (=> b!1171792 (= condMapEmpty!46022 (= (arr!36521 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14022)) mapDefault!46022)))))

(declare-fun b!1171793 () Bool)

(declare-fun e!666043 () Bool)

(declare-fun e!666040 () Bool)

(assert (=> b!1171793 (= e!666043 (not e!666040))))

(declare-fun res!777905 () Bool)

(assert (=> b!1171793 (=> res!777905 e!666040)))

(assert (=> b!1171793 (= res!777905 (bvsgt from!1455 i!673))))

(assert (=> b!1171793 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527904 () Unit!38644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75745 (_ BitVec 64) (_ BitVec 32)) Unit!38644)

(assert (=> b!1171793 (= lt!527904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171794 () Bool)

(declare-fun res!777903 () Bool)

(declare-fun e!666035 () Bool)

(assert (=> b!1171794 (=> (not res!777903) (not e!666035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75745 (_ BitVec 32)) Bool)

(assert (=> b!1171794 (= res!777903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171795 () Bool)

(declare-fun res!777904 () Bool)

(assert (=> b!1171795 (=> (not res!777904) (not e!666035))))

(assert (=> b!1171795 (= res!777904 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37058 _keys!1208))))))

(declare-fun b!1171796 () Bool)

(declare-fun res!777897 () Bool)

(declare-fun e!666042 () Bool)

(assert (=> b!1171796 (=> res!777897 e!666042)))

(declare-datatypes ((List!25629 0))(
  ( (Nil!25626) (Cons!25625 (h!26834 (_ BitVec 64)) (t!37554 List!25629)) )
))
(declare-fun contains!6851 (List!25629 (_ BitVec 64)) Bool)

(assert (=> b!1171796 (= res!777897 (contains!6851 Nil!25626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171797 () Bool)

(assert (=> b!1171797 (= e!666035 e!666043)))

(declare-fun res!777895 () Bool)

(assert (=> b!1171797 (=> (not res!777895) (not e!666043))))

(assert (=> b!1171797 (= res!777895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527911 mask!1564))))

(assert (=> b!1171797 (= lt!527911 (array!75746 (store (arr!36522 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37058 _keys!1208)))))

(declare-fun b!1171798 () Bool)

(declare-fun res!777910 () Bool)

(assert (=> b!1171798 (=> (not res!777910) (not e!666035))))

(assert (=> b!1171798 (= res!777910 (= (select (arr!36522 _keys!1208) i!673) k0!934))))

(declare-fun res!777907 () Bool)

(assert (=> start!99354 (=> (not res!777907) (not e!666035))))

(assert (=> start!99354 (= res!777907 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37058 _keys!1208))))))

(assert (=> start!99354 e!666035))

(assert (=> start!99354 tp_is_empty!29463))

(declare-fun array_inv!27908 (array!75745) Bool)

(assert (=> start!99354 (array_inv!27908 _keys!1208)))

(assert (=> start!99354 true))

(assert (=> start!99354 tp!87512))

(declare-fun array_inv!27909 (array!75743) Bool)

(assert (=> start!99354 (and (array_inv!27909 _values!996) e!666032)))

(declare-fun mapIsEmpty!46022 () Bool)

(assert (=> mapIsEmpty!46022 mapRes!46022))

(declare-fun b!1171799 () Bool)

(declare-fun e!666031 () Bool)

(assert (=> b!1171799 (= e!666038 e!666031)))

(declare-fun res!777892 () Bool)

(assert (=> b!1171799 (=> res!777892 e!666031)))

(assert (=> b!1171799 (= res!777892 (not (= (select (arr!36522 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1171799 e!666034))

(declare-fun res!777909 () Bool)

(assert (=> b!1171799 (=> (not res!777909) (not e!666034))))

(declare-fun lt!527905 () ListLongMap!16861)

(declare-fun lt!527913 () V!44411)

(declare-fun +!3770 (ListLongMap!16861 tuple2!18892) ListLongMap!16861)

(declare-fun get!18628 (ValueCell!14022 V!44411) V!44411)

(assert (=> b!1171799 (= res!777909 (= lt!527905 (+!3770 lt!527909 (tuple2!18893 (select (arr!36522 _keys!1208) from!1455) (get!18628 (select (arr!36521 _values!996) from!1455) lt!527913)))))))

(declare-fun b!1171800 () Bool)

(declare-fun res!777893 () Bool)

(assert (=> b!1171800 (=> (not res!777893) (not e!666043))))

(declare-fun arrayNoDuplicates!0 (array!75745 (_ BitVec 32) List!25629) Bool)

(assert (=> b!1171800 (= res!777893 (arrayNoDuplicates!0 lt!527911 #b00000000000000000000000000000000 Nil!25626))))

(declare-fun b!1171801 () Bool)

(assert (=> b!1171801 (= e!666042 true)))

(declare-fun lt!527902 () Bool)

(assert (=> b!1171801 (= lt!527902 (contains!6851 Nil!25626 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171802 () Bool)

(declare-fun res!777900 () Bool)

(assert (=> b!1171802 (=> (not res!777900) (not e!666035))))

(assert (=> b!1171802 (= res!777900 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25626))))

(declare-fun b!1171803 () Bool)

(declare-fun res!777894 () Bool)

(assert (=> b!1171803 (=> (not res!777894) (not e!666035))))

(assert (=> b!1171803 (= res!777894 (validKeyInArray!0 k0!934))))

(declare-fun b!1171804 () Bool)

(assert (=> b!1171804 (= e!666040 e!666041)))

(declare-fun res!777901 () Bool)

(assert (=> b!1171804 (=> res!777901 e!666041)))

(assert (=> b!1171804 (= res!777901 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1171804 (= lt!527905 (getCurrentListMapNoExtraKeys!4910 lt!527911 lt!527908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171804 (= lt!527908 (array!75744 (store (arr!36521 _values!996) i!673 (ValueCellFull!14022 lt!527913)) (size!37057 _values!996)))))

(declare-fun dynLambda!2882 (Int (_ BitVec 64)) V!44411)

(assert (=> b!1171804 (= lt!527913 (dynLambda!2882 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527906 () ListLongMap!16861)

(assert (=> b!1171804 (= lt!527906 (getCurrentListMapNoExtraKeys!4910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171805 () Bool)

(declare-fun res!777899 () Bool)

(assert (=> b!1171805 (=> res!777899 e!666042)))

(declare-fun noDuplicate!1611 (List!25629) Bool)

(assert (=> b!1171805 (= res!777899 (not (noDuplicate!1611 Nil!25626)))))

(declare-fun b!1171806 () Bool)

(declare-fun res!777902 () Bool)

(assert (=> b!1171806 (=> (not res!777902) (not e!666035))))

(assert (=> b!1171806 (= res!777902 (and (= (size!37057 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37058 _keys!1208) (size!37057 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171807 () Bool)

(declare-fun res!777908 () Bool)

(assert (=> b!1171807 (=> (not res!777908) (not e!666035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171807 (= res!777908 (validMask!0 mask!1564))))

(declare-fun b!1171808 () Bool)

(assert (=> b!1171808 (= e!666031 e!666042)))

(declare-fun res!777906 () Bool)

(assert (=> b!1171808 (=> res!777906 e!666042)))

(assert (=> b!1171808 (= res!777906 (or (bvsge (size!37058 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37058 _keys!1208)) (bvsge from!1455 (size!37058 _keys!1208))))))

(assert (=> b!1171808 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25626)))

(declare-fun lt!527903 () Unit!38644)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75745 (_ BitVec 32) (_ BitVec 32)) Unit!38644)

(assert (=> b!1171808 (= lt!527903 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1171808 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527910 () Unit!38644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75745 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38644)

(assert (=> b!1171808 (= lt!527910 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!99354 res!777907) b!1171807))

(assert (= (and b!1171807 res!777908) b!1171806))

(assert (= (and b!1171806 res!777902) b!1171794))

(assert (= (and b!1171794 res!777903) b!1171802))

(assert (= (and b!1171802 res!777900) b!1171795))

(assert (= (and b!1171795 res!777904) b!1171803))

(assert (= (and b!1171803 res!777894) b!1171798))

(assert (= (and b!1171798 res!777910) b!1171797))

(assert (= (and b!1171797 res!777895) b!1171800))

(assert (= (and b!1171800 res!777893) b!1171793))

(assert (= (and b!1171793 (not res!777905)) b!1171804))

(assert (= (and b!1171804 (not res!777901)) b!1171790))

(assert (= (and b!1171790 (not res!777898)) b!1171799))

(assert (= (and b!1171799 res!777909) b!1171789))

(assert (= (and b!1171789 (not res!777896)) b!1171788))

(assert (= (and b!1171799 (not res!777892)) b!1171808))

(assert (= (and b!1171808 (not res!777906)) b!1171805))

(assert (= (and b!1171805 (not res!777899)) b!1171796))

(assert (= (and b!1171796 (not res!777897)) b!1171801))

(assert (= (and b!1171792 condMapEmpty!46022) mapIsEmpty!46022))

(assert (= (and b!1171792 (not condMapEmpty!46022)) mapNonEmpty!46022))

(get-info :version)

(assert (= (and mapNonEmpty!46022 ((_ is ValueCellFull!14022) mapValue!46022)) b!1171791))

(assert (= (and b!1171792 ((_ is ValueCellFull!14022) mapDefault!46022)) b!1171787))

(assert (= start!99354 b!1171792))

(declare-fun b_lambda!20077 () Bool)

(assert (=> (not b_lambda!20077) (not b!1171804)))

(declare-fun t!37552 () Bool)

(declare-fun tb!9745 () Bool)

(assert (=> (and start!99354 (= defaultEntry!1004 defaultEntry!1004) t!37552) tb!9745))

(declare-fun result!20057 () Bool)

(assert (=> tb!9745 (= result!20057 tp_is_empty!29463)))

(assert (=> b!1171804 t!37552))

(declare-fun b_and!40735 () Bool)

(assert (= b_and!40733 (and (=> t!37552 result!20057) b_and!40735)))

(declare-fun m!1079603 () Bool)

(assert (=> b!1171790 m!1079603))

(declare-fun m!1079605 () Bool)

(assert (=> b!1171790 m!1079605))

(declare-fun m!1079607 () Bool)

(assert (=> b!1171790 m!1079607))

(declare-fun m!1079609 () Bool)

(assert (=> b!1171790 m!1079609))

(assert (=> b!1171790 m!1079607))

(declare-fun m!1079611 () Bool)

(assert (=> b!1171790 m!1079611))

(declare-fun m!1079613 () Bool)

(assert (=> b!1171790 m!1079613))

(declare-fun m!1079615 () Bool)

(assert (=> b!1171808 m!1079615))

(declare-fun m!1079617 () Bool)

(assert (=> b!1171808 m!1079617))

(declare-fun m!1079619 () Bool)

(assert (=> b!1171808 m!1079619))

(declare-fun m!1079621 () Bool)

(assert (=> b!1171808 m!1079621))

(declare-fun m!1079623 () Bool)

(assert (=> b!1171804 m!1079623))

(declare-fun m!1079625 () Bool)

(assert (=> b!1171804 m!1079625))

(declare-fun m!1079627 () Bool)

(assert (=> b!1171804 m!1079627))

(declare-fun m!1079629 () Bool)

(assert (=> b!1171804 m!1079629))

(declare-fun m!1079631 () Bool)

(assert (=> b!1171794 m!1079631))

(declare-fun m!1079633 () Bool)

(assert (=> b!1171788 m!1079633))

(declare-fun m!1079635 () Bool)

(assert (=> start!99354 m!1079635))

(declare-fun m!1079637 () Bool)

(assert (=> start!99354 m!1079637))

(declare-fun m!1079639 () Bool)

(assert (=> b!1171801 m!1079639))

(declare-fun m!1079641 () Bool)

(assert (=> b!1171802 m!1079641))

(declare-fun m!1079643 () Bool)

(assert (=> b!1171793 m!1079643))

(declare-fun m!1079645 () Bool)

(assert (=> b!1171793 m!1079645))

(declare-fun m!1079647 () Bool)

(assert (=> b!1171807 m!1079647))

(declare-fun m!1079649 () Bool)

(assert (=> b!1171798 m!1079649))

(declare-fun m!1079651 () Bool)

(assert (=> b!1171797 m!1079651))

(declare-fun m!1079653 () Bool)

(assert (=> b!1171797 m!1079653))

(declare-fun m!1079655 () Bool)

(assert (=> mapNonEmpty!46022 m!1079655))

(assert (=> b!1171799 m!1079607))

(declare-fun m!1079657 () Bool)

(assert (=> b!1171799 m!1079657))

(assert (=> b!1171799 m!1079657))

(declare-fun m!1079659 () Bool)

(assert (=> b!1171799 m!1079659))

(declare-fun m!1079661 () Bool)

(assert (=> b!1171799 m!1079661))

(declare-fun m!1079663 () Bool)

(assert (=> b!1171800 m!1079663))

(declare-fun m!1079665 () Bool)

(assert (=> b!1171796 m!1079665))

(declare-fun m!1079667 () Bool)

(assert (=> b!1171805 m!1079667))

(declare-fun m!1079669 () Bool)

(assert (=> b!1171803 m!1079669))

(assert (=> b!1171789 m!1079607))

(check-sat (not b!1171788) (not b!1171803) (not b!1171807) (not b!1171808) (not b!1171802) b_and!40735 (not b!1171799) (not b!1171790) (not b_lambda!20077) (not b!1171805) (not start!99354) (not b!1171794) (not b!1171800) (not b!1171804) (not mapNonEmpty!46022) (not b_next!24933) (not b!1171801) (not b!1171793) tp_is_empty!29463 (not b!1171796) (not b!1171797))
(check-sat b_and!40735 (not b_next!24933))
