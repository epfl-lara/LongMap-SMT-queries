; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98026 () Bool)

(assert start!98026)

(declare-fun b_free!23727 () Bool)

(declare-fun b_next!23727 () Bool)

(assert (=> start!98026 (= b_free!23727 (not b_next!23727))))

(declare-fun tp!83884 () Bool)

(declare-fun b_and!38237 () Bool)

(assert (=> start!98026 (= tp!83884 b_and!38237)))

(declare-fun b!1124884 () Bool)

(declare-fun res!751628 () Bool)

(declare-fun e!640338 () Bool)

(assert (=> b!1124884 (=> (not res!751628) (not e!640338))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124884 (= res!751628 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44203 () Bool)

(declare-fun mapRes!44203 () Bool)

(declare-fun tp!83885 () Bool)

(declare-fun e!640341 () Bool)

(assert (=> mapNonEmpty!44203 (= mapRes!44203 (and tp!83885 e!640341))))

(declare-datatypes ((V!42803 0))(
  ( (V!42804 (val!14185 Int)) )
))
(declare-datatypes ((ValueCell!13419 0))(
  ( (ValueCellFull!13419 (v!16818 V!42803)) (EmptyCell!13419) )
))
(declare-fun mapValue!44203 () ValueCell!13419)

(declare-fun mapRest!44203 () (Array (_ BitVec 32) ValueCell!13419))

(declare-datatypes ((array!73381 0))(
  ( (array!73382 (arr!35343 (Array (_ BitVec 32) ValueCell!13419)) (size!35879 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73381)

(declare-fun mapKey!44203 () (_ BitVec 32))

(assert (=> mapNonEmpty!44203 (= (arr!35343 _values!996) (store mapRest!44203 mapKey!44203 mapValue!44203))))

(declare-fun b!1124885 () Bool)

(declare-fun e!640345 () Bool)

(declare-datatypes ((tuple2!17822 0))(
  ( (tuple2!17823 (_1!8922 (_ BitVec 64)) (_2!8922 V!42803)) )
))
(declare-datatypes ((List!24602 0))(
  ( (Nil!24599) (Cons!24598 (h!25807 tuple2!17822) (t!35321 List!24602)) )
))
(declare-datatypes ((ListLongMap!15791 0))(
  ( (ListLongMap!15792 (toList!7911 List!24602)) )
))
(declare-fun call!47463 () ListLongMap!15791)

(declare-fun call!47464 () ListLongMap!15791)

(assert (=> b!1124885 (= e!640345 (= call!47463 call!47464))))

(declare-fun b!1124886 () Bool)

(declare-fun res!751627 () Bool)

(assert (=> b!1124886 (=> (not res!751627) (not e!640338))))

(declare-datatypes ((array!73383 0))(
  ( (array!73384 (arr!35344 (Array (_ BitVec 32) (_ BitVec 64))) (size!35880 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73383)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1124886 (= res!751627 (and (= (size!35879 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35880 _keys!1208) (size!35879 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!42803)

(declare-fun lt!499636 () array!73383)

(declare-fun lt!499640 () array!73381)

(declare-fun bm!47460 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42803)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4399 (array!73383 array!73381 (_ BitVec 32) (_ BitVec 32) V!42803 V!42803 (_ BitVec 32) Int) ListLongMap!15791)

(assert (=> bm!47460 (= call!47463 (getCurrentListMapNoExtraKeys!4399 lt!499636 lt!499640 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124887 () Bool)

(declare-fun e!640337 () Bool)

(declare-fun e!640339 () Bool)

(assert (=> b!1124887 (= e!640337 (not e!640339))))

(declare-fun res!751618 () Bool)

(assert (=> b!1124887 (=> res!751618 e!640339)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124887 (= res!751618 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124887 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36872 0))(
  ( (Unit!36873) )
))
(declare-fun lt!499634 () Unit!36872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73383 (_ BitVec 64) (_ BitVec 32)) Unit!36872)

(assert (=> b!1124887 (= lt!499634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44203 () Bool)

(assert (=> mapIsEmpty!44203 mapRes!44203))

(declare-fun res!751623 () Bool)

(assert (=> start!98026 (=> (not res!751623) (not e!640338))))

(assert (=> start!98026 (= res!751623 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35880 _keys!1208))))))

(assert (=> start!98026 e!640338))

(declare-fun tp_is_empty!28257 () Bool)

(assert (=> start!98026 tp_is_empty!28257))

(declare-fun array_inv!27130 (array!73383) Bool)

(assert (=> start!98026 (array_inv!27130 _keys!1208)))

(assert (=> start!98026 true))

(assert (=> start!98026 tp!83884))

(declare-fun e!640343 () Bool)

(declare-fun array_inv!27131 (array!73381) Bool)

(assert (=> start!98026 (and (array_inv!27131 _values!996) e!640343)))

(declare-fun b!1124888 () Bool)

(declare-fun res!751619 () Bool)

(assert (=> b!1124888 (=> (not res!751619) (not e!640338))))

(assert (=> b!1124888 (= res!751619 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35880 _keys!1208))))))

(declare-fun b!1124889 () Bool)

(declare-fun res!751624 () Bool)

(assert (=> b!1124889 (=> (not res!751624) (not e!640337))))

(declare-datatypes ((List!24603 0))(
  ( (Nil!24600) (Cons!24599 (h!25808 (_ BitVec 64)) (t!35322 List!24603)) )
))
(declare-fun arrayNoDuplicates!0 (array!73383 (_ BitVec 32) List!24603) Bool)

(assert (=> b!1124889 (= res!751624 (arrayNoDuplicates!0 lt!499636 #b00000000000000000000000000000000 Nil!24600))))

(declare-fun b!1124890 () Bool)

(declare-fun e!640344 () Bool)

(assert (=> b!1124890 (= e!640344 true)))

(declare-fun lt!499638 () ListLongMap!15791)

(declare-fun contains!6448 (ListLongMap!15791 (_ BitVec 64)) Bool)

(declare-fun +!3418 (ListLongMap!15791 tuple2!17822) ListLongMap!15791)

(assert (=> b!1124890 (contains!6448 (+!3418 lt!499638 (tuple2!17823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499633 () Unit!36872)

(declare-fun addStillContains!680 (ListLongMap!15791 (_ BitVec 64) V!42803 (_ BitVec 64)) Unit!36872)

(assert (=> b!1124890 (= lt!499633 (addStillContains!680 lt!499638 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124891 () Bool)

(declare-fun res!751617 () Bool)

(assert (=> b!1124891 (=> (not res!751617) (not e!640338))))

(assert (=> b!1124891 (= res!751617 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24600))))

(declare-fun b!1124892 () Bool)

(declare-fun res!751630 () Bool)

(assert (=> b!1124892 (=> (not res!751630) (not e!640338))))

(assert (=> b!1124892 (= res!751630 (= (select (arr!35344 _keys!1208) i!673) k0!934))))

(declare-fun b!1124893 () Bool)

(declare-fun res!751621 () Bool)

(assert (=> b!1124893 (=> (not res!751621) (not e!640338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124893 (= res!751621 (validMask!0 mask!1564))))

(declare-fun b!1124894 () Bool)

(declare-fun e!640340 () Bool)

(assert (=> b!1124894 (= e!640339 e!640340)))

(declare-fun res!751620 () Bool)

(assert (=> b!1124894 (=> res!751620 e!640340)))

(assert (=> b!1124894 (= res!751620 (not (= from!1455 i!673)))))

(declare-fun lt!499637 () ListLongMap!15791)

(assert (=> b!1124894 (= lt!499637 (getCurrentListMapNoExtraKeys!4399 lt!499636 lt!499640 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2492 (Int (_ BitVec 64)) V!42803)

(assert (=> b!1124894 (= lt!499640 (array!73382 (store (arr!35343 _values!996) i!673 (ValueCellFull!13419 (dynLambda!2492 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35879 _values!996)))))

(declare-fun lt!499635 () ListLongMap!15791)

(assert (=> b!1124894 (= lt!499635 (getCurrentListMapNoExtraKeys!4399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47461 () Bool)

(assert (=> bm!47461 (= call!47464 (getCurrentListMapNoExtraKeys!4399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124895 () Bool)

(declare-fun e!640346 () Bool)

(assert (=> b!1124895 (= e!640346 tp_is_empty!28257)))

(declare-fun b!1124896 () Bool)

(assert (=> b!1124896 (= e!640341 tp_is_empty!28257)))

(declare-fun b!1124897 () Bool)

(declare-fun res!751616 () Bool)

(assert (=> b!1124897 (=> (not res!751616) (not e!640338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73383 (_ BitVec 32)) Bool)

(assert (=> b!1124897 (= res!751616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124898 () Bool)

(assert (=> b!1124898 (= e!640343 (and e!640346 mapRes!44203))))

(declare-fun condMapEmpty!44203 () Bool)

(declare-fun mapDefault!44203 () ValueCell!13419)

(assert (=> b!1124898 (= condMapEmpty!44203 (= (arr!35343 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13419)) mapDefault!44203)))))

(declare-fun b!1124899 () Bool)

(declare-fun -!1113 (ListLongMap!15791 (_ BitVec 64)) ListLongMap!15791)

(assert (=> b!1124899 (= e!640345 (= call!47463 (-!1113 call!47464 k0!934)))))

(declare-fun b!1124900 () Bool)

(assert (=> b!1124900 (= e!640338 e!640337)))

(declare-fun res!751626 () Bool)

(assert (=> b!1124900 (=> (not res!751626) (not e!640337))))

(assert (=> b!1124900 (= res!751626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499636 mask!1564))))

(assert (=> b!1124900 (= lt!499636 (array!73384 (store (arr!35344 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35880 _keys!1208)))))

(declare-fun b!1124901 () Bool)

(declare-fun e!640342 () Bool)

(assert (=> b!1124901 (= e!640340 e!640342)))

(declare-fun res!751625 () Bool)

(assert (=> b!1124901 (=> res!751625 e!640342)))

(assert (=> b!1124901 (= res!751625 (not (= (select (arr!35344 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124901 e!640345))

(declare-fun c!109581 () Bool)

(assert (=> b!1124901 (= c!109581 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499639 () Unit!36872)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!360 (array!73383 array!73381 (_ BitVec 32) (_ BitVec 32) V!42803 V!42803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36872)

(assert (=> b!1124901 (= lt!499639 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124902 () Bool)

(assert (=> b!1124902 (= e!640342 e!640344)))

(declare-fun res!751629 () Bool)

(assert (=> b!1124902 (=> res!751629 e!640344)))

(assert (=> b!1124902 (= res!751629 (not (contains!6448 lt!499638 k0!934)))))

(assert (=> b!1124902 (= lt!499638 (getCurrentListMapNoExtraKeys!4399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124903 () Bool)

(declare-fun res!751622 () Bool)

(assert (=> b!1124903 (=> res!751622 e!640344)))

(assert (=> b!1124903 (= res!751622 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!98026 res!751623) b!1124893))

(assert (= (and b!1124893 res!751621) b!1124886))

(assert (= (and b!1124886 res!751627) b!1124897))

(assert (= (and b!1124897 res!751616) b!1124891))

(assert (= (and b!1124891 res!751617) b!1124888))

(assert (= (and b!1124888 res!751619) b!1124884))

(assert (= (and b!1124884 res!751628) b!1124892))

(assert (= (and b!1124892 res!751630) b!1124900))

(assert (= (and b!1124900 res!751626) b!1124889))

(assert (= (and b!1124889 res!751624) b!1124887))

(assert (= (and b!1124887 (not res!751618)) b!1124894))

(assert (= (and b!1124894 (not res!751620)) b!1124901))

(assert (= (and b!1124901 c!109581) b!1124899))

(assert (= (and b!1124901 (not c!109581)) b!1124885))

(assert (= (or b!1124899 b!1124885) bm!47460))

(assert (= (or b!1124899 b!1124885) bm!47461))

(assert (= (and b!1124901 (not res!751625)) b!1124902))

(assert (= (and b!1124902 (not res!751629)) b!1124903))

(assert (= (and b!1124903 (not res!751622)) b!1124890))

(assert (= (and b!1124898 condMapEmpty!44203) mapIsEmpty!44203))

(assert (= (and b!1124898 (not condMapEmpty!44203)) mapNonEmpty!44203))

(get-info :version)

(assert (= (and mapNonEmpty!44203 ((_ is ValueCellFull!13419) mapValue!44203)) b!1124896))

(assert (= (and b!1124898 ((_ is ValueCellFull!13419) mapDefault!44203)) b!1124895))

(assert (= start!98026 b!1124898))

(declare-fun b_lambda!18697 () Bool)

(assert (=> (not b_lambda!18697) (not b!1124894)))

(declare-fun t!35320 () Bool)

(declare-fun tb!8539 () Bool)

(assert (=> (and start!98026 (= defaultEntry!1004 defaultEntry!1004) t!35320) tb!8539))

(declare-fun result!17639 () Bool)

(assert (=> tb!8539 (= result!17639 tp_is_empty!28257)))

(assert (=> b!1124894 t!35320))

(declare-fun b_and!38239 () Bool)

(assert (= b_and!38237 (and (=> t!35320 result!17639) b_and!38239)))

(declare-fun m!1039111 () Bool)

(assert (=> bm!47461 m!1039111))

(declare-fun m!1039113 () Bool)

(assert (=> b!1124893 m!1039113))

(declare-fun m!1039115 () Bool)

(assert (=> b!1124901 m!1039115))

(declare-fun m!1039117 () Bool)

(assert (=> b!1124901 m!1039117))

(declare-fun m!1039119 () Bool)

(assert (=> b!1124899 m!1039119))

(declare-fun m!1039121 () Bool)

(assert (=> start!98026 m!1039121))

(declare-fun m!1039123 () Bool)

(assert (=> start!98026 m!1039123))

(declare-fun m!1039125 () Bool)

(assert (=> b!1124889 m!1039125))

(declare-fun m!1039127 () Bool)

(assert (=> b!1124892 m!1039127))

(declare-fun m!1039129 () Bool)

(assert (=> b!1124897 m!1039129))

(declare-fun m!1039131 () Bool)

(assert (=> b!1124902 m!1039131))

(assert (=> b!1124902 m!1039111))

(declare-fun m!1039133 () Bool)

(assert (=> b!1124890 m!1039133))

(assert (=> b!1124890 m!1039133))

(declare-fun m!1039135 () Bool)

(assert (=> b!1124890 m!1039135))

(declare-fun m!1039137 () Bool)

(assert (=> b!1124890 m!1039137))

(declare-fun m!1039139 () Bool)

(assert (=> b!1124884 m!1039139))

(declare-fun m!1039141 () Bool)

(assert (=> bm!47460 m!1039141))

(declare-fun m!1039143 () Bool)

(assert (=> mapNonEmpty!44203 m!1039143))

(declare-fun m!1039145 () Bool)

(assert (=> b!1124894 m!1039145))

(declare-fun m!1039147 () Bool)

(assert (=> b!1124894 m!1039147))

(declare-fun m!1039149 () Bool)

(assert (=> b!1124894 m!1039149))

(declare-fun m!1039151 () Bool)

(assert (=> b!1124894 m!1039151))

(declare-fun m!1039153 () Bool)

(assert (=> b!1124887 m!1039153))

(declare-fun m!1039155 () Bool)

(assert (=> b!1124887 m!1039155))

(declare-fun m!1039157 () Bool)

(assert (=> b!1124900 m!1039157))

(declare-fun m!1039159 () Bool)

(assert (=> b!1124900 m!1039159))

(declare-fun m!1039161 () Bool)

(assert (=> b!1124891 m!1039161))

(check-sat (not b_next!23727) (not b!1124897) (not b!1124900) (not b!1124890) (not b_lambda!18697) (not b!1124887) (not b!1124889) b_and!38239 (not mapNonEmpty!44203) (not start!98026) (not b!1124894) tp_is_empty!28257 (not b!1124901) (not bm!47460) (not b!1124893) (not b!1124902) (not b!1124891) (not bm!47461) (not b!1124884) (not b!1124899))
(check-sat b_and!38239 (not b_next!23727))
