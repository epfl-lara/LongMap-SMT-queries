; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98188 () Bool)

(assert start!98188)

(declare-fun b_free!23889 () Bool)

(declare-fun b_next!23889 () Bool)

(assert (=> start!98188 (= b_free!23889 (not b_next!23889))))

(declare-fun tp!84370 () Bool)

(declare-fun b_and!38561 () Bool)

(assert (=> start!98188 (= tp!84370 b_and!38561)))

(declare-fun b!1129756 () Bool)

(declare-fun e!642959 () Bool)

(declare-fun tp_is_empty!28419 () Bool)

(assert (=> b!1129756 (= e!642959 tp_is_empty!28419)))

(declare-fun b!1129757 () Bool)

(declare-fun c!109920 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!501609 () Bool)

(assert (=> b!1129757 (= c!109920 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501609))))

(declare-datatypes ((Unit!37012 0))(
  ( (Unit!37013) )
))
(declare-fun e!642965 () Unit!37012)

(declare-fun e!642967 () Unit!37012)

(assert (=> b!1129757 (= e!642965 e!642967)))

(declare-fun bm!48138 () Bool)

(declare-fun call!48144 () Unit!37012)

(declare-fun call!48143 () Unit!37012)

(assert (=> bm!48138 (= call!48144 call!48143)))

(declare-fun bm!48139 () Bool)

(declare-datatypes ((V!43019 0))(
  ( (V!43020 (val!14266 Int)) )
))
(declare-datatypes ((tuple2!17966 0))(
  ( (tuple2!17967 (_1!8994 (_ BitVec 64)) (_2!8994 V!43019)) )
))
(declare-datatypes ((List!24732 0))(
  ( (Nil!24729) (Cons!24728 (h!25937 tuple2!17966) (t!35613 List!24732)) )
))
(declare-datatypes ((ListLongMap!15935 0))(
  ( (ListLongMap!15936 (toList!7983 List!24732)) )
))
(declare-fun call!48142 () ListLongMap!15935)

(declare-fun call!48141 () ListLongMap!15935)

(assert (=> bm!48139 (= call!48142 call!48141)))

(declare-fun zeroValue!944 () V!43019)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!501613 () ListLongMap!15935)

(declare-fun c!109921 () Bool)

(declare-fun bm!48140 () Bool)

(declare-fun c!109922 () Bool)

(declare-fun minValue!944 () V!43019)

(declare-fun lt!501615 () ListLongMap!15935)

(declare-fun addStillContains!697 (ListLongMap!15935 (_ BitVec 64) V!43019 (_ BitVec 64)) Unit!37012)

(assert (=> bm!48140 (= call!48143 (addStillContains!697 (ite c!109922 lt!501615 lt!501613) (ite c!109922 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109921 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109922 minValue!944 (ite c!109921 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1129758 () Bool)

(declare-fun e!642960 () Bool)

(declare-fun call!48148 () ListLongMap!15935)

(declare-fun call!48146 () ListLongMap!15935)

(assert (=> b!1129758 (= e!642960 (= call!48148 call!48146))))

(declare-fun mapNonEmpty!44446 () Bool)

(declare-fun mapRes!44446 () Bool)

(declare-fun tp!84371 () Bool)

(declare-fun e!642964 () Bool)

(assert (=> mapNonEmpty!44446 (= mapRes!44446 (and tp!84371 e!642964))))

(declare-fun mapKey!44446 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13500 0))(
  ( (ValueCellFull!13500 (v!16899 V!43019)) (EmptyCell!13500) )
))
(declare-fun mapValue!44446 () ValueCell!13500)

(declare-datatypes ((array!73695 0))(
  ( (array!73696 (arr!35500 (Array (_ BitVec 32) ValueCell!13500)) (size!36036 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73695)

(declare-fun mapRest!44446 () (Array (_ BitVec 32) ValueCell!13500))

(assert (=> mapNonEmpty!44446 (= (arr!35500 _values!996) (store mapRest!44446 mapKey!44446 mapValue!44446))))

(declare-fun b!1129759 () Bool)

(declare-fun res!754933 () Bool)

(declare-fun e!642970 () Bool)

(assert (=> b!1129759 (=> (not res!754933) (not e!642970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129759 (= res!754933 (validKeyInArray!0 k0!934))))

(declare-fun b!1129760 () Bool)

(declare-fun res!754931 () Bool)

(declare-fun e!642968 () Bool)

(assert (=> b!1129760 (=> (not res!754931) (not e!642968))))

(declare-datatypes ((array!73697 0))(
  ( (array!73698 (arr!35501 (Array (_ BitVec 32) (_ BitVec 64))) (size!36037 (_ BitVec 32))) )
))
(declare-fun lt!501605 () array!73697)

(declare-datatypes ((List!24733 0))(
  ( (Nil!24730) (Cons!24729 (h!25938 (_ BitVec 64)) (t!35614 List!24733)) )
))
(declare-fun arrayNoDuplicates!0 (array!73697 (_ BitVec 32) List!24733) Bool)

(assert (=> b!1129760 (= res!754931 (arrayNoDuplicates!0 lt!501605 #b00000000000000000000000000000000 Nil!24730))))

(declare-fun b!1129761 () Bool)

(declare-fun Unit!37014 () Unit!37012)

(assert (=> b!1129761 (= e!642967 Unit!37014)))

(declare-fun b!1129762 () Bool)

(declare-fun res!754920 () Bool)

(assert (=> b!1129762 (=> (not res!754920) (not e!642970))))

(declare-fun _keys!1208 () array!73697)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73697 (_ BitVec 32)) Bool)

(assert (=> b!1129762 (= res!754920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129763 () Bool)

(assert (=> b!1129763 (= e!642964 tp_is_empty!28419)))

(declare-fun b!1129764 () Bool)

(declare-fun e!642963 () Bool)

(declare-fun e!642971 () Bool)

(assert (=> b!1129764 (= e!642963 e!642971)))

(declare-fun res!754929 () Bool)

(assert (=> b!1129764 (=> res!754929 e!642971)))

(declare-fun contains!6506 (ListLongMap!15935 (_ BitVec 64)) Bool)

(assert (=> b!1129764 (= res!754929 (not (contains!6506 lt!501613 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4470 (array!73697 array!73695 (_ BitVec 32) (_ BitVec 32) V!43019 V!43019 (_ BitVec 32) Int) ListLongMap!15935)

(assert (=> b!1129764 (= lt!501613 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129765 () Bool)

(assert (=> b!1129765 (= e!642970 e!642968)))

(declare-fun res!754925 () Bool)

(assert (=> b!1129765 (=> (not res!754925) (not e!642968))))

(assert (=> b!1129765 (= res!754925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501605 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129765 (= lt!501605 (array!73698 (store (arr!35501 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36037 _keys!1208)))))

(declare-fun b!1129766 () Bool)

(declare-fun e!642966 () Unit!37012)

(assert (=> b!1129766 (= e!642966 e!642965)))

(assert (=> b!1129766 (= c!109921 (and (not lt!501609) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129767 () Bool)

(declare-fun e!642969 () Bool)

(assert (=> b!1129767 (= e!642969 e!642963)))

(declare-fun res!754926 () Bool)

(assert (=> b!1129767 (=> res!754926 e!642963)))

(assert (=> b!1129767 (= res!754926 (not (= (select (arr!35501 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129767 e!642960))

(declare-fun c!109923 () Bool)

(assert (=> b!1129767 (= c!109923 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501603 () Unit!37012)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!416 (array!73697 array!73695 (_ BitVec 32) (_ BitVec 32) V!43019 V!43019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37012)

(assert (=> b!1129767 (= lt!501603 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129768 () Bool)

(declare-fun res!754921 () Bool)

(assert (=> b!1129768 (=> (not res!754921) (not e!642970))))

(assert (=> b!1129768 (= res!754921 (and (= (size!36036 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36037 _keys!1208) (size!36036 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!754919 () Bool)

(assert (=> start!98188 (=> (not res!754919) (not e!642970))))

(assert (=> start!98188 (= res!754919 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36037 _keys!1208))))))

(assert (=> start!98188 e!642970))

(assert (=> start!98188 tp_is_empty!28419))

(declare-fun array_inv!27234 (array!73697) Bool)

(assert (=> start!98188 (array_inv!27234 _keys!1208)))

(assert (=> start!98188 true))

(assert (=> start!98188 tp!84370))

(declare-fun e!642958 () Bool)

(declare-fun array_inv!27235 (array!73695) Bool)

(assert (=> start!98188 (and (array_inv!27235 _values!996) e!642958)))

(declare-fun b!1129769 () Bool)

(declare-fun e!642972 () Bool)

(assert (=> b!1129769 (= e!642972 e!642969)))

(declare-fun res!754927 () Bool)

(assert (=> b!1129769 (=> res!754927 e!642969)))

(assert (=> b!1129769 (= res!754927 (not (= from!1455 i!673)))))

(declare-fun lt!501616 () array!73695)

(declare-fun lt!501612 () ListLongMap!15935)

(assert (=> b!1129769 (= lt!501612 (getCurrentListMapNoExtraKeys!4470 lt!501605 lt!501616 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2548 (Int (_ BitVec 64)) V!43019)

(assert (=> b!1129769 (= lt!501616 (array!73696 (store (arr!35500 _values!996) i!673 (ValueCellFull!13500 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36036 _values!996)))))

(declare-fun lt!501608 () ListLongMap!15935)

(assert (=> b!1129769 (= lt!501608 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129770 () Bool)

(declare-fun e!642962 () Bool)

(assert (=> b!1129770 (= e!642971 e!642962)))

(declare-fun res!754923 () Bool)

(assert (=> b!1129770 (=> res!754923 e!642962)))

(assert (=> b!1129770 (= res!754923 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36037 _keys!1208))))))

(declare-fun lt!501604 () Unit!37012)

(assert (=> b!1129770 (= lt!501604 e!642966)))

(assert (=> b!1129770 (= c!109922 (and (not lt!501609) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129770 (= lt!501609 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48141 () Bool)

(assert (=> bm!48141 (= call!48148 (getCurrentListMapNoExtraKeys!4470 lt!501605 lt!501616 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44446 () Bool)

(assert (=> mapIsEmpty!44446 mapRes!44446))

(declare-fun b!1129771 () Bool)

(declare-fun res!754930 () Bool)

(assert (=> b!1129771 (=> (not res!754930) (not e!642970))))

(assert (=> b!1129771 (= res!754930 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36037 _keys!1208))))))

(declare-fun b!1129772 () Bool)

(declare-fun call!48147 () Bool)

(assert (=> b!1129772 call!48147))

(declare-fun lt!501617 () Unit!37012)

(assert (=> b!1129772 (= lt!501617 call!48144)))

(assert (=> b!1129772 (= e!642965 lt!501617)))

(declare-fun b!1129773 () Bool)

(declare-fun -!1164 (ListLongMap!15935 (_ BitVec 64)) ListLongMap!15935)

(assert (=> b!1129773 (= e!642960 (= call!48148 (-!1164 call!48146 k0!934)))))

(declare-fun b!1129774 () Bool)

(declare-fun res!754924 () Bool)

(assert (=> b!1129774 (=> (not res!754924) (not e!642970))))

(assert (=> b!1129774 (= res!754924 (= (select (arr!35501 _keys!1208) i!673) k0!934))))

(declare-fun b!1129775 () Bool)

(declare-fun lt!501614 () Unit!37012)

(assert (=> b!1129775 (= e!642967 lt!501614)))

(assert (=> b!1129775 (= lt!501614 call!48144)))

(assert (=> b!1129775 call!48147))

(declare-fun b!1129776 () Bool)

(declare-fun res!754922 () Bool)

(assert (=> b!1129776 (=> (not res!754922) (not e!642970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129776 (= res!754922 (validMask!0 mask!1564))))

(declare-fun b!1129777 () Bool)

(assert (=> b!1129777 (= e!642968 (not e!642972))))

(declare-fun res!754928 () Bool)

(assert (=> b!1129777 (=> res!754928 e!642972)))

(assert (=> b!1129777 (= res!754928 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129777 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501607 () Unit!37012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73697 (_ BitVec 64) (_ BitVec 32)) Unit!37012)

(assert (=> b!1129777 (= lt!501607 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129778 () Bool)

(assert (=> b!1129778 (= e!642962 true)))

(declare-fun lt!501610 () Bool)

(declare-fun getCurrentListMap!4417 (array!73697 array!73695 (_ BitVec 32) (_ BitVec 32) V!43019 V!43019 (_ BitVec 32) Int) ListLongMap!15935)

(assert (=> b!1129778 (= lt!501610 (contains!6506 (getCurrentListMap!4417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!48142 () Bool)

(declare-fun call!48145 () Bool)

(assert (=> bm!48142 (= call!48145 (contains!6506 (ite c!109922 lt!501615 call!48142) k0!934))))

(declare-fun b!1129779 () Bool)

(declare-fun lt!501606 () Unit!37012)

(assert (=> b!1129779 (= e!642966 lt!501606)))

(declare-fun lt!501611 () Unit!37012)

(assert (=> b!1129779 (= lt!501611 (addStillContains!697 lt!501613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1129779 (= lt!501615 call!48141)))

(assert (=> b!1129779 call!48145))

(assert (=> b!1129779 (= lt!501606 call!48143)))

(declare-fun +!3434 (ListLongMap!15935 tuple2!17966) ListLongMap!15935)

(assert (=> b!1129779 (contains!6506 (+!3434 lt!501615 (tuple2!17967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1129780 () Bool)

(declare-fun res!754932 () Bool)

(assert (=> b!1129780 (=> (not res!754932) (not e!642970))))

(assert (=> b!1129780 (= res!754932 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24730))))

(declare-fun bm!48143 () Bool)

(assert (=> bm!48143 (= call!48146 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48144 () Bool)

(assert (=> bm!48144 (= call!48141 (+!3434 lt!501613 (ite (or c!109922 c!109921) (tuple2!17967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129781 () Bool)

(assert (=> b!1129781 (= e!642958 (and e!642959 mapRes!44446))))

(declare-fun condMapEmpty!44446 () Bool)

(declare-fun mapDefault!44446 () ValueCell!13500)

(assert (=> b!1129781 (= condMapEmpty!44446 (= (arr!35500 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13500)) mapDefault!44446)))))

(declare-fun bm!48145 () Bool)

(assert (=> bm!48145 (= call!48147 call!48145)))

(assert (= (and start!98188 res!754919) b!1129776))

(assert (= (and b!1129776 res!754922) b!1129768))

(assert (= (and b!1129768 res!754921) b!1129762))

(assert (= (and b!1129762 res!754920) b!1129780))

(assert (= (and b!1129780 res!754932) b!1129771))

(assert (= (and b!1129771 res!754930) b!1129759))

(assert (= (and b!1129759 res!754933) b!1129774))

(assert (= (and b!1129774 res!754924) b!1129765))

(assert (= (and b!1129765 res!754925) b!1129760))

(assert (= (and b!1129760 res!754931) b!1129777))

(assert (= (and b!1129777 (not res!754928)) b!1129769))

(assert (= (and b!1129769 (not res!754927)) b!1129767))

(assert (= (and b!1129767 c!109923) b!1129773))

(assert (= (and b!1129767 (not c!109923)) b!1129758))

(assert (= (or b!1129773 b!1129758) bm!48141))

(assert (= (or b!1129773 b!1129758) bm!48143))

(assert (= (and b!1129767 (not res!754926)) b!1129764))

(assert (= (and b!1129764 (not res!754929)) b!1129770))

(assert (= (and b!1129770 c!109922) b!1129779))

(assert (= (and b!1129770 (not c!109922)) b!1129766))

(assert (= (and b!1129766 c!109921) b!1129772))

(assert (= (and b!1129766 (not c!109921)) b!1129757))

(assert (= (and b!1129757 c!109920) b!1129775))

(assert (= (and b!1129757 (not c!109920)) b!1129761))

(assert (= (or b!1129772 b!1129775) bm!48138))

(assert (= (or b!1129772 b!1129775) bm!48139))

(assert (= (or b!1129772 b!1129775) bm!48145))

(assert (= (or b!1129779 bm!48145) bm!48142))

(assert (= (or b!1129779 bm!48138) bm!48140))

(assert (= (or b!1129779 bm!48139) bm!48144))

(assert (= (and b!1129770 (not res!754923)) b!1129778))

(assert (= (and b!1129781 condMapEmpty!44446) mapIsEmpty!44446))

(assert (= (and b!1129781 (not condMapEmpty!44446)) mapNonEmpty!44446))

(get-info :version)

(assert (= (and mapNonEmpty!44446 ((_ is ValueCellFull!13500) mapValue!44446)) b!1129763))

(assert (= (and b!1129781 ((_ is ValueCellFull!13500) mapDefault!44446)) b!1129756))

(assert (= start!98188 b!1129781))

(declare-fun b_lambda!18859 () Bool)

(assert (=> (not b_lambda!18859) (not b!1129769)))

(declare-fun t!35612 () Bool)

(declare-fun tb!8701 () Bool)

(assert (=> (and start!98188 (= defaultEntry!1004 defaultEntry!1004) t!35612) tb!8701))

(declare-fun result!17963 () Bool)

(assert (=> tb!8701 (= result!17963 tp_is_empty!28419)))

(assert (=> b!1129769 t!35612))

(declare-fun b_and!38563 () Bool)

(assert (= b_and!38561 (and (=> t!35612 result!17963) b_and!38563)))

(declare-fun m!1043065 () Bool)

(assert (=> bm!48142 m!1043065))

(declare-fun m!1043067 () Bool)

(assert (=> b!1129776 m!1043067))

(declare-fun m!1043069 () Bool)

(assert (=> b!1129769 m!1043069))

(declare-fun m!1043071 () Bool)

(assert (=> b!1129769 m!1043071))

(declare-fun m!1043073 () Bool)

(assert (=> b!1129769 m!1043073))

(declare-fun m!1043075 () Bool)

(assert (=> b!1129769 m!1043075))

(declare-fun m!1043077 () Bool)

(assert (=> mapNonEmpty!44446 m!1043077))

(declare-fun m!1043079 () Bool)

(assert (=> bm!48140 m!1043079))

(declare-fun m!1043081 () Bool)

(assert (=> bm!48141 m!1043081))

(declare-fun m!1043083 () Bool)

(assert (=> b!1129779 m!1043083))

(declare-fun m!1043085 () Bool)

(assert (=> b!1129779 m!1043085))

(assert (=> b!1129779 m!1043085))

(declare-fun m!1043087 () Bool)

(assert (=> b!1129779 m!1043087))

(declare-fun m!1043089 () Bool)

(assert (=> b!1129774 m!1043089))

(declare-fun m!1043091 () Bool)

(assert (=> bm!48144 m!1043091))

(declare-fun m!1043093 () Bool)

(assert (=> b!1129767 m!1043093))

(declare-fun m!1043095 () Bool)

(assert (=> b!1129767 m!1043095))

(declare-fun m!1043097 () Bool)

(assert (=> b!1129778 m!1043097))

(assert (=> b!1129778 m!1043097))

(declare-fun m!1043099 () Bool)

(assert (=> b!1129778 m!1043099))

(declare-fun m!1043101 () Bool)

(assert (=> start!98188 m!1043101))

(declare-fun m!1043103 () Bool)

(assert (=> start!98188 m!1043103))

(declare-fun m!1043105 () Bool)

(assert (=> b!1129762 m!1043105))

(declare-fun m!1043107 () Bool)

(assert (=> b!1129760 m!1043107))

(declare-fun m!1043109 () Bool)

(assert (=> b!1129780 m!1043109))

(declare-fun m!1043111 () Bool)

(assert (=> b!1129759 m!1043111))

(declare-fun m!1043113 () Bool)

(assert (=> bm!48143 m!1043113))

(declare-fun m!1043115 () Bool)

(assert (=> b!1129777 m!1043115))

(declare-fun m!1043117 () Bool)

(assert (=> b!1129777 m!1043117))

(declare-fun m!1043119 () Bool)

(assert (=> b!1129764 m!1043119))

(assert (=> b!1129764 m!1043113))

(declare-fun m!1043121 () Bool)

(assert (=> b!1129765 m!1043121))

(declare-fun m!1043123 () Bool)

(assert (=> b!1129765 m!1043123))

(declare-fun m!1043125 () Bool)

(assert (=> b!1129773 m!1043125))

(check-sat (not mapNonEmpty!44446) tp_is_empty!28419 (not b!1129780) (not b!1129759) (not b!1129779) (not b_next!23889) (not b!1129773) (not b!1129764) (not start!98188) (not b!1129778) (not b!1129777) (not bm!48140) (not b!1129767) (not b!1129765) (not b_lambda!18859) (not b!1129769) (not bm!48141) (not b!1129762) (not bm!48142) (not bm!48143) b_and!38563 (not b!1129776) (not b!1129760) (not bm!48144))
(check-sat b_and!38563 (not b_next!23889))
