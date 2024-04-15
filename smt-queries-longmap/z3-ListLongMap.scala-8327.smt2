; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101356 () Bool)

(assert start!101356)

(declare-fun b_free!26233 () Bool)

(declare-fun b_next!26233 () Bool)

(assert (=> start!101356 (= b_free!26233 (not b_next!26233))))

(declare-fun tp!91727 () Bool)

(declare-fun b_and!43601 () Bool)

(assert (=> start!101356 (= tp!91727 b_and!43601)))

(declare-fun b!1217722 () Bool)

(declare-fun e!691348 () Bool)

(declare-fun e!691351 () Bool)

(assert (=> b!1217722 (= e!691348 (not e!691351))))

(declare-fun res!808681 () Bool)

(assert (=> b!1217722 (=> res!808681 e!691351)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217722 (= res!808681 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78568 0))(
  ( (array!78569 (arr!37917 (Array (_ BitVec 32) (_ BitVec 64))) (size!38455 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78568)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217722 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40225 0))(
  ( (Unit!40226) )
))
(declare-fun lt!553384 () Unit!40225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78568 (_ BitVec 64) (_ BitVec 32)) Unit!40225)

(assert (=> b!1217722 (= lt!553384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217723 () Bool)

(declare-fun res!808688 () Bool)

(assert (=> b!1217723 (=> (not res!808688) (not e!691348))))

(declare-fun lt!553387 () array!78568)

(declare-datatypes ((List!26832 0))(
  ( (Nil!26829) (Cons!26828 (h!28037 (_ BitVec 64)) (t!40036 List!26832)) )
))
(declare-fun arrayNoDuplicates!0 (array!78568 (_ BitVec 32) List!26832) Bool)

(assert (=> b!1217723 (= res!808688 (arrayNoDuplicates!0 lt!553387 #b00000000000000000000000000000000 Nil!26829))))

(declare-fun b!1217724 () Bool)

(declare-fun res!808684 () Bool)

(declare-fun e!691352 () Bool)

(assert (=> b!1217724 (=> (not res!808684) (not e!691352))))

(assert (=> b!1217724 (= res!808684 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38455 _keys!1208))))))

(declare-fun b!1217725 () Bool)

(declare-fun e!691343 () Bool)

(declare-fun tp_is_empty!30937 () Bool)

(assert (=> b!1217725 (= e!691343 tp_is_empty!30937)))

(declare-fun b!1217726 () Bool)

(declare-fun res!808689 () Bool)

(assert (=> b!1217726 (=> (not res!808689) (not e!691352))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217726 (= res!808689 (validMask!0 mask!1564))))

(declare-fun b!1217727 () Bool)

(declare-fun e!691347 () Bool)

(declare-fun e!691342 () Bool)

(declare-fun mapRes!48286 () Bool)

(assert (=> b!1217727 (= e!691347 (and e!691342 mapRes!48286))))

(declare-fun condMapEmpty!48286 () Bool)

(declare-datatypes ((V!46377 0))(
  ( (V!46378 (val!15525 Int)) )
))
(declare-datatypes ((ValueCell!14759 0))(
  ( (ValueCellFull!14759 (v!18179 V!46377)) (EmptyCell!14759) )
))
(declare-datatypes ((array!78570 0))(
  ( (array!78571 (arr!37918 (Array (_ BitVec 32) ValueCell!14759)) (size!38456 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78570)

(declare-fun mapDefault!48286 () ValueCell!14759)

(assert (=> b!1217727 (= condMapEmpty!48286 (= (arr!37918 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14759)) mapDefault!48286)))))

(declare-fun b!1217728 () Bool)

(declare-fun e!691344 () Bool)

(assert (=> b!1217728 (= e!691344 true)))

(declare-fun e!691350 () Bool)

(assert (=> b!1217728 e!691350))

(declare-fun res!808676 () Bool)

(assert (=> b!1217728 (=> (not res!808676) (not e!691350))))

(declare-fun lt!553388 () V!46377)

(declare-datatypes ((tuple2!20054 0))(
  ( (tuple2!20055 (_1!10038 (_ BitVec 64)) (_2!10038 V!46377)) )
))
(declare-datatypes ((List!26833 0))(
  ( (Nil!26830) (Cons!26829 (h!28038 tuple2!20054) (t!40037 List!26833)) )
))
(declare-datatypes ((ListLongMap!18023 0))(
  ( (ListLongMap!18024 (toList!9027 List!26833)) )
))
(declare-fun lt!553390 () ListLongMap!18023)

(declare-fun lt!553383 () ListLongMap!18023)

(declare-fun +!4097 (ListLongMap!18023 tuple2!20054) ListLongMap!18023)

(declare-fun get!19338 (ValueCell!14759 V!46377) V!46377)

(assert (=> b!1217728 (= res!808676 (= lt!553383 (+!4097 lt!553390 (tuple2!20055 (select (arr!37917 _keys!1208) from!1455) (get!19338 (select (arr!37918 _values!996) from!1455) lt!553388)))))))

(declare-fun b!1217729 () Bool)

(declare-fun res!808678 () Bool)

(assert (=> b!1217729 (=> (not res!808678) (not e!691352))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1217729 (= res!808678 (and (= (size!38456 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38455 _keys!1208) (size!38456 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217730 () Bool)

(declare-fun res!808686 () Bool)

(assert (=> b!1217730 (=> (not res!808686) (not e!691352))))

(assert (=> b!1217730 (= res!808686 (= (select (arr!37917 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48286 () Bool)

(assert (=> mapIsEmpty!48286 mapRes!48286))

(declare-fun b!1217731 () Bool)

(declare-fun res!808690 () Bool)

(assert (=> b!1217731 (=> (not res!808690) (not e!691352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217731 (= res!808690 (validKeyInArray!0 k0!934))))

(declare-fun b!1217732 () Bool)

(declare-fun res!808683 () Bool)

(assert (=> b!1217732 (=> (not res!808683) (not e!691352))))

(assert (=> b!1217732 (= res!808683 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26829))))

(declare-fun e!691346 () Bool)

(declare-fun b!1217733 () Bool)

(assert (=> b!1217733 (= e!691346 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217734 () Bool)

(declare-fun res!808685 () Bool)

(assert (=> b!1217734 (=> (not res!808685) (not e!691352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78568 (_ BitVec 32)) Bool)

(assert (=> b!1217734 (= res!808685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217735 () Bool)

(assert (=> b!1217735 (= e!691352 e!691348)))

(declare-fun res!808687 () Bool)

(assert (=> b!1217735 (=> (not res!808687) (not e!691348))))

(assert (=> b!1217735 (= res!808687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553387 mask!1564))))

(assert (=> b!1217735 (= lt!553387 (array!78569 (store (arr!37917 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38455 _keys!1208)))))

(declare-fun b!1217736 () Bool)

(declare-fun e!691345 () Bool)

(assert (=> b!1217736 (= e!691351 e!691345)))

(declare-fun res!808682 () Bool)

(assert (=> b!1217736 (=> res!808682 e!691345)))

(assert (=> b!1217736 (= res!808682 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46377)

(declare-fun lt!553382 () array!78570)

(declare-fun minValue!944 () V!46377)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5466 (array!78568 array!78570 (_ BitVec 32) (_ BitVec 32) V!46377 V!46377 (_ BitVec 32) Int) ListLongMap!18023)

(assert (=> b!1217736 (= lt!553383 (getCurrentListMapNoExtraKeys!5466 lt!553387 lt!553382 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1217736 (= lt!553382 (array!78571 (store (arr!37918 _values!996) i!673 (ValueCellFull!14759 lt!553388)) (size!38456 _values!996)))))

(declare-fun dynLambda!3317 (Int (_ BitVec 64)) V!46377)

(assert (=> b!1217736 (= lt!553388 (dynLambda!3317 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553389 () ListLongMap!18023)

(assert (=> b!1217736 (= lt!553389 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217737 () Bool)

(assert (=> b!1217737 (= e!691350 e!691346)))

(declare-fun res!808679 () Bool)

(assert (=> b!1217737 (=> res!808679 e!691346)))

(assert (=> b!1217737 (= res!808679 (not (= (select (arr!37917 _keys!1208) from!1455) k0!934)))))

(declare-fun res!808677 () Bool)

(assert (=> start!101356 (=> (not res!808677) (not e!691352))))

(assert (=> start!101356 (= res!808677 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38455 _keys!1208))))))

(assert (=> start!101356 e!691352))

(assert (=> start!101356 tp_is_empty!30937))

(declare-fun array_inv!28984 (array!78568) Bool)

(assert (=> start!101356 (array_inv!28984 _keys!1208)))

(assert (=> start!101356 true))

(assert (=> start!101356 tp!91727))

(declare-fun array_inv!28985 (array!78570) Bool)

(assert (=> start!101356 (and (array_inv!28985 _values!996) e!691347)))

(declare-fun b!1217738 () Bool)

(assert (=> b!1217738 (= e!691342 tp_is_empty!30937)))

(declare-fun b!1217739 () Bool)

(assert (=> b!1217739 (= e!691345 e!691344)))

(declare-fun res!808680 () Bool)

(assert (=> b!1217739 (=> res!808680 e!691344)))

(assert (=> b!1217739 (= res!808680 (not (validKeyInArray!0 (select (arr!37917 _keys!1208) from!1455))))))

(declare-fun lt!553391 () ListLongMap!18023)

(assert (=> b!1217739 (= lt!553391 lt!553390)))

(declare-fun lt!553385 () ListLongMap!18023)

(declare-fun -!1863 (ListLongMap!18023 (_ BitVec 64)) ListLongMap!18023)

(assert (=> b!1217739 (= lt!553390 (-!1863 lt!553385 k0!934))))

(assert (=> b!1217739 (= lt!553391 (getCurrentListMapNoExtraKeys!5466 lt!553387 lt!553382 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217739 (= lt!553385 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553386 () Unit!40225)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1098 (array!78568 array!78570 (_ BitVec 32) (_ BitVec 32) V!46377 V!46377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40225)

(assert (=> b!1217739 (= lt!553386 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1098 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48286 () Bool)

(declare-fun tp!91726 () Bool)

(assert (=> mapNonEmpty!48286 (= mapRes!48286 (and tp!91726 e!691343))))

(declare-fun mapRest!48286 () (Array (_ BitVec 32) ValueCell!14759))

(declare-fun mapValue!48286 () ValueCell!14759)

(declare-fun mapKey!48286 () (_ BitVec 32))

(assert (=> mapNonEmpty!48286 (= (arr!37918 _values!996) (store mapRest!48286 mapKey!48286 mapValue!48286))))

(assert (= (and start!101356 res!808677) b!1217726))

(assert (= (and b!1217726 res!808689) b!1217729))

(assert (= (and b!1217729 res!808678) b!1217734))

(assert (= (and b!1217734 res!808685) b!1217732))

(assert (= (and b!1217732 res!808683) b!1217724))

(assert (= (and b!1217724 res!808684) b!1217731))

(assert (= (and b!1217731 res!808690) b!1217730))

(assert (= (and b!1217730 res!808686) b!1217735))

(assert (= (and b!1217735 res!808687) b!1217723))

(assert (= (and b!1217723 res!808688) b!1217722))

(assert (= (and b!1217722 (not res!808681)) b!1217736))

(assert (= (and b!1217736 (not res!808682)) b!1217739))

(assert (= (and b!1217739 (not res!808680)) b!1217728))

(assert (= (and b!1217728 res!808676) b!1217737))

(assert (= (and b!1217737 (not res!808679)) b!1217733))

(assert (= (and b!1217727 condMapEmpty!48286) mapIsEmpty!48286))

(assert (= (and b!1217727 (not condMapEmpty!48286)) mapNonEmpty!48286))

(get-info :version)

(assert (= (and mapNonEmpty!48286 ((_ is ValueCellFull!14759) mapValue!48286)) b!1217725))

(assert (= (and b!1217727 ((_ is ValueCellFull!14759) mapDefault!48286)) b!1217738))

(assert (= start!101356 b!1217727))

(declare-fun b_lambda!21975 () Bool)

(assert (=> (not b_lambda!21975) (not b!1217736)))

(declare-fun t!40035 () Bool)

(declare-fun tb!11025 () Bool)

(assert (=> (and start!101356 (= defaultEntry!1004 defaultEntry!1004) t!40035) tb!11025))

(declare-fun result!22659 () Bool)

(assert (=> tb!11025 (= result!22659 tp_is_empty!30937)))

(assert (=> b!1217736 t!40035))

(declare-fun b_and!43603 () Bool)

(assert (= b_and!43601 (and (=> t!40035 result!22659) b_and!43603)))

(declare-fun m!1122031 () Bool)

(assert (=> b!1217737 m!1122031))

(declare-fun m!1122033 () Bool)

(assert (=> b!1217735 m!1122033))

(declare-fun m!1122035 () Bool)

(assert (=> b!1217735 m!1122035))

(declare-fun m!1122037 () Bool)

(assert (=> b!1217736 m!1122037))

(declare-fun m!1122039 () Bool)

(assert (=> b!1217736 m!1122039))

(declare-fun m!1122041 () Bool)

(assert (=> b!1217736 m!1122041))

(declare-fun m!1122043 () Bool)

(assert (=> b!1217736 m!1122043))

(declare-fun m!1122045 () Bool)

(assert (=> b!1217734 m!1122045))

(declare-fun m!1122047 () Bool)

(assert (=> b!1217723 m!1122047))

(declare-fun m!1122049 () Bool)

(assert (=> b!1217739 m!1122049))

(declare-fun m!1122051 () Bool)

(assert (=> b!1217739 m!1122051))

(declare-fun m!1122053 () Bool)

(assert (=> b!1217739 m!1122053))

(declare-fun m!1122055 () Bool)

(assert (=> b!1217739 m!1122055))

(assert (=> b!1217739 m!1122031))

(declare-fun m!1122057 () Bool)

(assert (=> b!1217739 m!1122057))

(assert (=> b!1217739 m!1122031))

(declare-fun m!1122059 () Bool)

(assert (=> b!1217732 m!1122059))

(declare-fun m!1122061 () Bool)

(assert (=> b!1217722 m!1122061))

(declare-fun m!1122063 () Bool)

(assert (=> b!1217722 m!1122063))

(declare-fun m!1122065 () Bool)

(assert (=> b!1217733 m!1122065))

(declare-fun m!1122067 () Bool)

(assert (=> mapNonEmpty!48286 m!1122067))

(declare-fun m!1122069 () Bool)

(assert (=> b!1217726 m!1122069))

(declare-fun m!1122071 () Bool)

(assert (=> start!101356 m!1122071))

(declare-fun m!1122073 () Bool)

(assert (=> start!101356 m!1122073))

(declare-fun m!1122075 () Bool)

(assert (=> b!1217731 m!1122075))

(assert (=> b!1217728 m!1122031))

(declare-fun m!1122077 () Bool)

(assert (=> b!1217728 m!1122077))

(assert (=> b!1217728 m!1122077))

(declare-fun m!1122079 () Bool)

(assert (=> b!1217728 m!1122079))

(declare-fun m!1122081 () Bool)

(assert (=> b!1217728 m!1122081))

(declare-fun m!1122083 () Bool)

(assert (=> b!1217730 m!1122083))

(check-sat (not b!1217734) (not b_next!26233) (not b!1217733) (not mapNonEmpty!48286) (not b!1217739) (not b!1217736) (not b!1217732) (not b_lambda!21975) (not b!1217731) b_and!43603 (not b!1217722) (not b!1217735) (not start!101356) (not b!1217723) tp_is_empty!30937 (not b!1217726) (not b!1217728))
(check-sat b_and!43603 (not b_next!26233))
