; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98092 () Bool)

(assert start!98092)

(declare-fun b_free!23793 () Bool)

(declare-fun b_next!23793 () Bool)

(assert (=> start!98092 (= b_free!23793 (not b_next!23793))))

(declare-fun tp!84083 () Bool)

(declare-fun b_and!38369 () Bool)

(assert (=> start!98092 (= tp!84083 b_and!38369)))

(declare-fun mapIsEmpty!44302 () Bool)

(declare-fun mapRes!44302 () Bool)

(assert (=> mapIsEmpty!44302 mapRes!44302))

(declare-fun res!752972 () Bool)

(declare-fun e!641363 () Bool)

(assert (=> start!98092 (=> (not res!752972) (not e!641363))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73507 0))(
  ( (array!73508 (arr!35406 (Array (_ BitVec 32) (_ BitVec 64))) (size!35942 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73507)

(assert (=> start!98092 (= res!752972 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35942 _keys!1208))))))

(assert (=> start!98092 e!641363))

(declare-fun tp_is_empty!28323 () Bool)

(assert (=> start!98092 tp_is_empty!28323))

(declare-fun array_inv!27172 (array!73507) Bool)

(assert (=> start!98092 (array_inv!27172 _keys!1208)))

(assert (=> start!98092 true))

(assert (=> start!98092 tp!84083))

(declare-datatypes ((V!42891 0))(
  ( (V!42892 (val!14218 Int)) )
))
(declare-datatypes ((ValueCell!13452 0))(
  ( (ValueCellFull!13452 (v!16851 V!42891)) (EmptyCell!13452) )
))
(declare-datatypes ((array!73509 0))(
  ( (array!73510 (arr!35407 (Array (_ BitVec 32) ValueCell!13452)) (size!35943 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73509)

(declare-fun e!641360 () Bool)

(declare-fun array_inv!27173 (array!73509) Bool)

(assert (=> start!98092 (and (array_inv!27173 _values!996) e!641360)))

(declare-fun b!1126794 () Bool)

(declare-fun e!641361 () Bool)

(assert (=> b!1126794 (= e!641361 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!500362 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!42891)

(declare-fun zeroValue!944 () V!42891)

(declare-datatypes ((tuple2!17878 0))(
  ( (tuple2!17879 (_1!8950 (_ BitVec 64)) (_2!8950 V!42891)) )
))
(declare-datatypes ((List!24653 0))(
  ( (Nil!24650) (Cons!24649 (h!25858 tuple2!17878) (t!35438 List!24653)) )
))
(declare-datatypes ((ListLongMap!15847 0))(
  ( (ListLongMap!15848 (toList!7939 List!24653)) )
))
(declare-fun contains!6471 (ListLongMap!15847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4427 (array!73507 array!73509 (_ BitVec 32) (_ BitVec 32) V!42891 V!42891 (_ BitVec 32) Int) ListLongMap!15847)

(assert (=> b!1126794 (= lt!500362 (contains!6471 (getCurrentListMapNoExtraKeys!4427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126795 () Bool)

(declare-fun res!752971 () Bool)

(assert (=> b!1126795 (=> (not res!752971) (not e!641363))))

(declare-datatypes ((List!24654 0))(
  ( (Nil!24651) (Cons!24650 (h!25859 (_ BitVec 64)) (t!35439 List!24654)) )
))
(declare-fun arrayNoDuplicates!0 (array!73507 (_ BitVec 32) List!24654) Bool)

(assert (=> b!1126795 (= res!752971 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24651))))

(declare-fun lt!500360 () array!73509)

(declare-fun bm!47658 () Bool)

(declare-fun call!47662 () ListLongMap!15847)

(declare-fun lt!500361 () array!73507)

(assert (=> bm!47658 (= call!47662 (getCurrentListMapNoExtraKeys!4427 lt!500361 lt!500360 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126796 () Bool)

(declare-fun e!641367 () Bool)

(assert (=> b!1126796 (= e!641360 (and e!641367 mapRes!44302))))

(declare-fun condMapEmpty!44302 () Bool)

(declare-fun mapDefault!44302 () ValueCell!13452)

(assert (=> b!1126796 (= condMapEmpty!44302 (= (arr!35407 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13452)) mapDefault!44302)))))

(declare-fun b!1126797 () Bool)

(declare-fun res!752975 () Bool)

(assert (=> b!1126797 (=> (not res!752975) (not e!641363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73507 (_ BitVec 32)) Bool)

(assert (=> b!1126797 (= res!752975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126798 () Bool)

(declare-fun res!752965 () Bool)

(assert (=> b!1126798 (=> (not res!752965) (not e!641363))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126798 (= res!752965 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35942 _keys!1208))))))

(declare-fun b!1126799 () Bool)

(declare-fun res!752969 () Bool)

(assert (=> b!1126799 (=> (not res!752969) (not e!641363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126799 (= res!752969 (validMask!0 mask!1564))))

(declare-fun b!1126800 () Bool)

(declare-fun e!641366 () Bool)

(declare-fun e!641358 () Bool)

(assert (=> b!1126800 (= e!641366 e!641358)))

(declare-fun res!752967 () Bool)

(assert (=> b!1126800 (=> res!752967 e!641358)))

(assert (=> b!1126800 (= res!752967 (not (= from!1455 i!673)))))

(declare-fun lt!500363 () ListLongMap!15847)

(assert (=> b!1126800 (= lt!500363 (getCurrentListMapNoExtraKeys!4427 lt!500361 lt!500360 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2516 (Int (_ BitVec 64)) V!42891)

(assert (=> b!1126800 (= lt!500360 (array!73510 (store (arr!35407 _values!996) i!673 (ValueCellFull!13452 (dynLambda!2516 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35943 _values!996)))))

(declare-fun lt!500359 () ListLongMap!15847)

(assert (=> b!1126800 (= lt!500359 (getCurrentListMapNoExtraKeys!4427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126801 () Bool)

(declare-fun e!641359 () Bool)

(assert (=> b!1126801 (= e!641359 (not e!641366))))

(declare-fun res!752976 () Bool)

(assert (=> b!1126801 (=> res!752976 e!641366)))

(assert (=> b!1126801 (= res!752976 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126801 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36922 0))(
  ( (Unit!36923) )
))
(declare-fun lt!500358 () Unit!36922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73507 (_ BitVec 64) (_ BitVec 32)) Unit!36922)

(assert (=> b!1126801 (= lt!500358 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126802 () Bool)

(assert (=> b!1126802 (= e!641363 e!641359)))

(declare-fun res!752974 () Bool)

(assert (=> b!1126802 (=> (not res!752974) (not e!641359))))

(assert (=> b!1126802 (= res!752974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500361 mask!1564))))

(assert (=> b!1126802 (= lt!500361 (array!73508 (store (arr!35406 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35942 _keys!1208)))))

(declare-fun b!1126803 () Bool)

(assert (=> b!1126803 (= e!641367 tp_is_empty!28323)))

(declare-fun b!1126804 () Bool)

(declare-fun res!752968 () Bool)

(assert (=> b!1126804 (=> (not res!752968) (not e!641363))))

(assert (=> b!1126804 (= res!752968 (= (select (arr!35406 _keys!1208) i!673) k0!934))))

(declare-fun call!47661 () ListLongMap!15847)

(declare-fun bm!47659 () Bool)

(assert (=> bm!47659 (= call!47661 (getCurrentListMapNoExtraKeys!4427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126805 () Bool)

(declare-fun res!752966 () Bool)

(assert (=> b!1126805 (=> (not res!752966) (not e!641363))))

(assert (=> b!1126805 (= res!752966 (and (= (size!35943 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35942 _keys!1208) (size!35943 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!641365 () Bool)

(declare-fun b!1126806 () Bool)

(declare-fun -!1132 (ListLongMap!15847 (_ BitVec 64)) ListLongMap!15847)

(assert (=> b!1126806 (= e!641365 (= call!47662 (-!1132 call!47661 k0!934)))))

(declare-fun mapNonEmpty!44302 () Bool)

(declare-fun tp!84082 () Bool)

(declare-fun e!641362 () Bool)

(assert (=> mapNonEmpty!44302 (= mapRes!44302 (and tp!84082 e!641362))))

(declare-fun mapValue!44302 () ValueCell!13452)

(declare-fun mapRest!44302 () (Array (_ BitVec 32) ValueCell!13452))

(declare-fun mapKey!44302 () (_ BitVec 32))

(assert (=> mapNonEmpty!44302 (= (arr!35407 _values!996) (store mapRest!44302 mapKey!44302 mapValue!44302))))

(declare-fun b!1126807 () Bool)

(assert (=> b!1126807 (= e!641362 tp_is_empty!28323)))

(declare-fun b!1126808 () Bool)

(assert (=> b!1126808 (= e!641358 e!641361)))

(declare-fun res!752977 () Bool)

(assert (=> b!1126808 (=> res!752977 e!641361)))

(assert (=> b!1126808 (= res!752977 (not (= (select (arr!35406 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126808 e!641365))

(declare-fun c!109680 () Bool)

(assert (=> b!1126808 (= c!109680 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500357 () Unit!36922)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!382 (array!73507 array!73509 (_ BitVec 32) (_ BitVec 32) V!42891 V!42891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36922)

(assert (=> b!1126808 (= lt!500357 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126809 () Bool)

(declare-fun res!752970 () Bool)

(assert (=> b!1126809 (=> (not res!752970) (not e!641359))))

(assert (=> b!1126809 (= res!752970 (arrayNoDuplicates!0 lt!500361 #b00000000000000000000000000000000 Nil!24651))))

(declare-fun b!1126810 () Bool)

(declare-fun res!752973 () Bool)

(assert (=> b!1126810 (=> (not res!752973) (not e!641363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126810 (= res!752973 (validKeyInArray!0 k0!934))))

(declare-fun b!1126811 () Bool)

(assert (=> b!1126811 (= e!641365 (= call!47662 call!47661))))

(assert (= (and start!98092 res!752972) b!1126799))

(assert (= (and b!1126799 res!752969) b!1126805))

(assert (= (and b!1126805 res!752966) b!1126797))

(assert (= (and b!1126797 res!752975) b!1126795))

(assert (= (and b!1126795 res!752971) b!1126798))

(assert (= (and b!1126798 res!752965) b!1126810))

(assert (= (and b!1126810 res!752973) b!1126804))

(assert (= (and b!1126804 res!752968) b!1126802))

(assert (= (and b!1126802 res!752974) b!1126809))

(assert (= (and b!1126809 res!752970) b!1126801))

(assert (= (and b!1126801 (not res!752976)) b!1126800))

(assert (= (and b!1126800 (not res!752967)) b!1126808))

(assert (= (and b!1126808 c!109680) b!1126806))

(assert (= (and b!1126808 (not c!109680)) b!1126811))

(assert (= (or b!1126806 b!1126811) bm!47658))

(assert (= (or b!1126806 b!1126811) bm!47659))

(assert (= (and b!1126808 (not res!752977)) b!1126794))

(assert (= (and b!1126796 condMapEmpty!44302) mapIsEmpty!44302))

(assert (= (and b!1126796 (not condMapEmpty!44302)) mapNonEmpty!44302))

(get-info :version)

(assert (= (and mapNonEmpty!44302 ((_ is ValueCellFull!13452) mapValue!44302)) b!1126807))

(assert (= (and b!1126796 ((_ is ValueCellFull!13452) mapDefault!44302)) b!1126803))

(assert (= start!98092 b!1126796))

(declare-fun b_lambda!18763 () Bool)

(assert (=> (not b_lambda!18763) (not b!1126800)))

(declare-fun t!35437 () Bool)

(declare-fun tb!8605 () Bool)

(assert (=> (and start!98092 (= defaultEntry!1004 defaultEntry!1004) t!35437) tb!8605))

(declare-fun result!17771 () Bool)

(assert (=> tb!8605 (= result!17771 tp_is_empty!28323)))

(assert (=> b!1126800 t!35437))

(declare-fun b_and!38371 () Bool)

(assert (= b_and!38369 (and (=> t!35437 result!17771) b_and!38371)))

(declare-fun m!1040695 () Bool)

(assert (=> mapNonEmpty!44302 m!1040695))

(declare-fun m!1040697 () Bool)

(assert (=> b!1126806 m!1040697))

(declare-fun m!1040699 () Bool)

(assert (=> b!1126799 m!1040699))

(declare-fun m!1040701 () Bool)

(assert (=> b!1126795 m!1040701))

(declare-fun m!1040703 () Bool)

(assert (=> bm!47659 m!1040703))

(declare-fun m!1040705 () Bool)

(assert (=> b!1126810 m!1040705))

(declare-fun m!1040707 () Bool)

(assert (=> b!1126797 m!1040707))

(declare-fun m!1040709 () Bool)

(assert (=> bm!47658 m!1040709))

(assert (=> b!1126794 m!1040703))

(assert (=> b!1126794 m!1040703))

(declare-fun m!1040711 () Bool)

(assert (=> b!1126794 m!1040711))

(declare-fun m!1040713 () Bool)

(assert (=> b!1126801 m!1040713))

(declare-fun m!1040715 () Bool)

(assert (=> b!1126801 m!1040715))

(declare-fun m!1040717 () Bool)

(assert (=> b!1126808 m!1040717))

(declare-fun m!1040719 () Bool)

(assert (=> b!1126808 m!1040719))

(declare-fun m!1040721 () Bool)

(assert (=> b!1126802 m!1040721))

(declare-fun m!1040723 () Bool)

(assert (=> b!1126802 m!1040723))

(declare-fun m!1040725 () Bool)

(assert (=> b!1126800 m!1040725))

(declare-fun m!1040727 () Bool)

(assert (=> b!1126800 m!1040727))

(declare-fun m!1040729 () Bool)

(assert (=> b!1126800 m!1040729))

(declare-fun m!1040731 () Bool)

(assert (=> b!1126800 m!1040731))

(declare-fun m!1040733 () Bool)

(assert (=> b!1126804 m!1040733))

(declare-fun m!1040735 () Bool)

(assert (=> b!1126809 m!1040735))

(declare-fun m!1040737 () Bool)

(assert (=> start!98092 m!1040737))

(declare-fun m!1040739 () Bool)

(assert (=> start!98092 m!1040739))

(check-sat (not b!1126800) (not b!1126808) (not b!1126806) (not b!1126810) (not b_lambda!18763) (not b!1126795) (not b!1126801) (not bm!47658) (not bm!47659) (not start!98092) (not b!1126794) b_and!38371 (not b!1126799) (not mapNonEmpty!44302) (not b_next!23793) tp_is_empty!28323 (not b!1126809) (not b!1126797) (not b!1126802))
(check-sat b_and!38371 (not b_next!23793))
