; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99490 () Bool)

(assert start!99490)

(declare-fun b_free!25075 () Bool)

(declare-fun b_next!25075 () Bool)

(assert (=> start!99490 (= b_free!25075 (not b_next!25075))))

(declare-fun tp!87938 () Bool)

(declare-fun b_and!40995 () Bool)

(assert (=> start!99490 (= tp!87938 b_and!40995)))

(declare-fun b!1176156 () Bool)

(declare-fun res!781193 () Bool)

(declare-fun e!668572 () Bool)

(assert (=> b!1176156 (=> (not res!781193) (not e!668572))))

(declare-datatypes ((array!75950 0))(
  ( (array!75951 (arr!36625 (Array (_ BitVec 32) (_ BitVec 64))) (size!37163 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75950)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75950 (_ BitVec 32)) Bool)

(assert (=> b!1176156 (= res!781193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176157 () Bool)

(declare-fun res!781196 () Bool)

(declare-fun e!668560 () Bool)

(assert (=> b!1176157 (=> (not res!781196) (not e!668560))))

(declare-fun lt!530676 () array!75950)

(declare-datatypes ((List!25817 0))(
  ( (Nil!25814) (Cons!25813 (h!27022 (_ BitVec 64)) (t!37875 List!25817)) )
))
(declare-fun arrayNoDuplicates!0 (array!75950 (_ BitVec 32) List!25817) Bool)

(assert (=> b!1176157 (= res!781196 (arrayNoDuplicates!0 lt!530676 #b00000000000000000000000000000000 Nil!25814))))

(declare-fun b!1176158 () Bool)

(declare-fun res!781195 () Bool)

(assert (=> b!1176158 (=> (not res!781195) (not e!668572))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44601 0))(
  ( (V!44602 (val!14859 Int)) )
))
(declare-datatypes ((ValueCell!14093 0))(
  ( (ValueCellFull!14093 (v!17496 V!44601)) (EmptyCell!14093) )
))
(declare-datatypes ((array!75952 0))(
  ( (array!75953 (arr!36626 (Array (_ BitVec 32) ValueCell!14093)) (size!37164 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75952)

(assert (=> b!1176158 (= res!781195 (and (= (size!37164 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37163 _keys!1208) (size!37164 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176159 () Bool)

(declare-datatypes ((Unit!38666 0))(
  ( (Unit!38667) )
))
(declare-fun e!668565 () Unit!38666)

(declare-fun Unit!38668 () Unit!38666)

(assert (=> b!1176159 (= e!668565 Unit!38668)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!530674 () Unit!38666)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75950 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38666)

(assert (=> b!1176159 (= lt!530674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176159 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530667 () Unit!38666)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75950 (_ BitVec 32) (_ BitVec 32)) Unit!38666)

(assert (=> b!1176159 (= lt!530667 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176159 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25814)))

(declare-fun lt!530663 () Unit!38666)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75950 (_ BitVec 64) (_ BitVec 32) List!25817) Unit!38666)

(assert (=> b!1176159 (= lt!530663 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25814))))

(assert (=> b!1176159 false))

(declare-fun b!1176160 () Bool)

(declare-fun e!668566 () Bool)

(assert (=> b!1176160 (= e!668566 true)))

(declare-fun e!668564 () Bool)

(assert (=> b!1176160 e!668564))

(declare-fun res!781200 () Bool)

(assert (=> b!1176160 (=> (not res!781200) (not e!668564))))

(assert (=> b!1176160 (= res!781200 (not (= (select (arr!36625 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!530671 () Unit!38666)

(assert (=> b!1176160 (= lt!530671 e!668565)))

(declare-fun c!116710 () Bool)

(assert (=> b!1176160 (= c!116710 (= (select (arr!36625 _keys!1208) from!1455) k0!934))))

(declare-fun e!668569 () Bool)

(assert (=> b!1176160 e!668569))

(declare-fun res!781203 () Bool)

(assert (=> b!1176160 (=> (not res!781203) (not e!668569))))

(declare-datatypes ((tuple2!19106 0))(
  ( (tuple2!19107 (_1!9564 (_ BitVec 64)) (_2!9564 V!44601)) )
))
(declare-datatypes ((List!25818 0))(
  ( (Nil!25815) (Cons!25814 (h!27023 tuple2!19106) (t!37876 List!25818)) )
))
(declare-datatypes ((ListLongMap!17075 0))(
  ( (ListLongMap!17076 (toList!8553 List!25818)) )
))
(declare-fun lt!530675 () ListLongMap!17075)

(declare-fun lt!530665 () tuple2!19106)

(declare-fun lt!530669 () ListLongMap!17075)

(declare-fun +!3856 (ListLongMap!17075 tuple2!19106) ListLongMap!17075)

(assert (=> b!1176160 (= res!781203 (= lt!530675 (+!3856 lt!530669 lt!530665)))))

(declare-fun lt!530672 () V!44601)

(declare-fun get!18714 (ValueCell!14093 V!44601) V!44601)

(assert (=> b!1176160 (= lt!530665 (tuple2!19107 (select (arr!36625 _keys!1208) from!1455) (get!18714 (select (arr!36626 _values!996) from!1455) lt!530672)))))

(declare-fun b!1176161 () Bool)

(declare-fun res!781194 () Bool)

(assert (=> b!1176161 (=> (not res!781194) (not e!668572))))

(assert (=> b!1176161 (= res!781194 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25814))))

(declare-fun b!1176162 () Bool)

(declare-fun e!668567 () Bool)

(assert (=> b!1176162 (= e!668569 e!668567)))

(declare-fun res!781197 () Bool)

(assert (=> b!1176162 (=> res!781197 e!668567)))

(assert (=> b!1176162 (= res!781197 (not (= (select (arr!36625 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176163 () Bool)

(declare-fun res!781207 () Bool)

(assert (=> b!1176163 (=> (not res!781207) (not e!668572))))

(assert (=> b!1176163 (= res!781207 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37163 _keys!1208))))))

(declare-fun b!1176164 () Bool)

(declare-fun e!668561 () Bool)

(assert (=> b!1176164 (= e!668560 (not e!668561))))

(declare-fun res!781201 () Bool)

(assert (=> b!1176164 (=> res!781201 e!668561)))

(assert (=> b!1176164 (= res!781201 (bvsgt from!1455 i!673))))

(assert (=> b!1176164 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530670 () Unit!38666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75950 (_ BitVec 64) (_ BitVec 32)) Unit!38666)

(assert (=> b!1176164 (= lt!530670 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!781198 () Bool)

(assert (=> start!99490 (=> (not res!781198) (not e!668572))))

(assert (=> start!99490 (= res!781198 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37163 _keys!1208))))))

(assert (=> start!99490 e!668572))

(declare-fun tp_is_empty!29605 () Bool)

(assert (=> start!99490 tp_is_empty!29605))

(declare-fun array_inv!28082 (array!75950) Bool)

(assert (=> start!99490 (array_inv!28082 _keys!1208)))

(assert (=> start!99490 true))

(assert (=> start!99490 tp!87938))

(declare-fun e!668570 () Bool)

(declare-fun array_inv!28083 (array!75952) Bool)

(assert (=> start!99490 (and (array_inv!28083 _values!996) e!668570)))

(declare-fun b!1176165 () Bool)

(declare-fun res!781206 () Bool)

(assert (=> b!1176165 (=> (not res!781206) (not e!668572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176165 (= res!781206 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46235 () Bool)

(declare-fun mapRes!46235 () Bool)

(declare-fun tp!87939 () Bool)

(declare-fun e!668568 () Bool)

(assert (=> mapNonEmpty!46235 (= mapRes!46235 (and tp!87939 e!668568))))

(declare-fun mapValue!46235 () ValueCell!14093)

(declare-fun mapRest!46235 () (Array (_ BitVec 32) ValueCell!14093))

(declare-fun mapKey!46235 () (_ BitVec 32))

(assert (=> mapNonEmpty!46235 (= (arr!36626 _values!996) (store mapRest!46235 mapKey!46235 mapValue!46235))))

(declare-fun b!1176166 () Bool)

(assert (=> b!1176166 (= e!668568 tp_is_empty!29605)))

(declare-fun lt!530673 () ListLongMap!17075)

(declare-fun lt!530664 () ListLongMap!17075)

(declare-fun b!1176167 () Bool)

(assert (=> b!1176167 (= e!668564 (= lt!530664 (+!3856 lt!530673 lt!530665)))))

(declare-fun b!1176168 () Bool)

(declare-fun res!781199 () Bool)

(assert (=> b!1176168 (=> (not res!781199) (not e!668572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176168 (= res!781199 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46235 () Bool)

(assert (=> mapIsEmpty!46235 mapRes!46235))

(declare-fun b!1176169 () Bool)

(assert (=> b!1176169 (= e!668567 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176170 () Bool)

(assert (=> b!1176170 (= e!668572 e!668560)))

(declare-fun res!781204 () Bool)

(assert (=> b!1176170 (=> (not res!781204) (not e!668560))))

(assert (=> b!1176170 (= res!781204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530676 mask!1564))))

(assert (=> b!1176170 (= lt!530676 (array!75951 (store (arr!36625 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37163 _keys!1208)))))

(declare-fun b!1176171 () Bool)

(declare-fun e!668571 () Bool)

(assert (=> b!1176171 (= e!668571 tp_is_empty!29605)))

(declare-fun b!1176172 () Bool)

(declare-fun e!668563 () Bool)

(assert (=> b!1176172 (= e!668563 e!668566)))

(declare-fun res!781202 () Bool)

(assert (=> b!1176172 (=> res!781202 e!668566)))

(assert (=> b!1176172 (= res!781202 (not (validKeyInArray!0 (select (arr!36625 _keys!1208) from!1455))))))

(declare-fun lt!530662 () ListLongMap!17075)

(assert (=> b!1176172 (= lt!530662 lt!530669)))

(declare-fun -!1532 (ListLongMap!17075 (_ BitVec 64)) ListLongMap!17075)

(assert (=> b!1176172 (= lt!530669 (-!1532 lt!530673 k0!934))))

(declare-fun zeroValue!944 () V!44601)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44601)

(declare-fun lt!530668 () array!75952)

(declare-fun getCurrentListMapNoExtraKeys!5022 (array!75950 array!75952 (_ BitVec 32) (_ BitVec 32) V!44601 V!44601 (_ BitVec 32) Int) ListLongMap!17075)

(assert (=> b!1176172 (= lt!530662 (getCurrentListMapNoExtraKeys!5022 lt!530676 lt!530668 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176172 (= lt!530673 (getCurrentListMapNoExtraKeys!5022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530666 () Unit!38666)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!796 (array!75950 array!75952 (_ BitVec 32) (_ BitVec 32) V!44601 V!44601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38666)

(assert (=> b!1176172 (= lt!530666 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176173 () Bool)

(assert (=> b!1176173 (= e!668561 e!668563)))

(declare-fun res!781192 () Bool)

(assert (=> b!1176173 (=> res!781192 e!668563)))

(assert (=> b!1176173 (= res!781192 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176173 (= lt!530675 (getCurrentListMapNoExtraKeys!5022 lt!530676 lt!530668 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176173 (= lt!530668 (array!75953 (store (arr!36626 _values!996) i!673 (ValueCellFull!14093 lt!530672)) (size!37164 _values!996)))))

(declare-fun dynLambda!2939 (Int (_ BitVec 64)) V!44601)

(assert (=> b!1176173 (= lt!530672 (dynLambda!2939 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1176173 (= lt!530664 (getCurrentListMapNoExtraKeys!5022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176174 () Bool)

(declare-fun res!781205 () Bool)

(assert (=> b!1176174 (=> (not res!781205) (not e!668572))))

(assert (=> b!1176174 (= res!781205 (= (select (arr!36625 _keys!1208) i!673) k0!934))))

(declare-fun b!1176175 () Bool)

(assert (=> b!1176175 (= e!668570 (and e!668571 mapRes!46235))))

(declare-fun condMapEmpty!46235 () Bool)

(declare-fun mapDefault!46235 () ValueCell!14093)

(assert (=> b!1176175 (= condMapEmpty!46235 (= (arr!36626 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14093)) mapDefault!46235)))))

(declare-fun b!1176176 () Bool)

(declare-fun Unit!38669 () Unit!38666)

(assert (=> b!1176176 (= e!668565 Unit!38669)))

(assert (= (and start!99490 res!781198) b!1176168))

(assert (= (and b!1176168 res!781199) b!1176158))

(assert (= (and b!1176158 res!781195) b!1176156))

(assert (= (and b!1176156 res!781193) b!1176161))

(assert (= (and b!1176161 res!781194) b!1176163))

(assert (= (and b!1176163 res!781207) b!1176165))

(assert (= (and b!1176165 res!781206) b!1176174))

(assert (= (and b!1176174 res!781205) b!1176170))

(assert (= (and b!1176170 res!781204) b!1176157))

(assert (= (and b!1176157 res!781196) b!1176164))

(assert (= (and b!1176164 (not res!781201)) b!1176173))

(assert (= (and b!1176173 (not res!781192)) b!1176172))

(assert (= (and b!1176172 (not res!781202)) b!1176160))

(assert (= (and b!1176160 res!781203) b!1176162))

(assert (= (and b!1176162 (not res!781197)) b!1176169))

(assert (= (and b!1176160 c!116710) b!1176159))

(assert (= (and b!1176160 (not c!116710)) b!1176176))

(assert (= (and b!1176160 res!781200) b!1176167))

(assert (= (and b!1176175 condMapEmpty!46235) mapIsEmpty!46235))

(assert (= (and b!1176175 (not condMapEmpty!46235)) mapNonEmpty!46235))

(get-info :version)

(assert (= (and mapNonEmpty!46235 ((_ is ValueCellFull!14093) mapValue!46235)) b!1176166))

(assert (= (and b!1176175 ((_ is ValueCellFull!14093) mapDefault!46235)) b!1176171))

(assert (= start!99490 b!1176175))

(declare-fun b_lambda!20201 () Bool)

(assert (=> (not b_lambda!20201) (not b!1176173)))

(declare-fun t!37874 () Bool)

(declare-fun tb!9879 () Bool)

(assert (=> (and start!99490 (= defaultEntry!1004 defaultEntry!1004) t!37874) tb!9879))

(declare-fun result!20333 () Bool)

(assert (=> tb!9879 (= result!20333 tp_is_empty!29605)))

(assert (=> b!1176173 t!37874))

(declare-fun b_and!40997 () Bool)

(assert (= b_and!40995 (and (=> t!37874 result!20333) b_and!40997)))

(declare-fun m!1083599 () Bool)

(assert (=> start!99490 m!1083599))

(declare-fun m!1083601 () Bool)

(assert (=> start!99490 m!1083601))

(declare-fun m!1083603 () Bool)

(assert (=> b!1176170 m!1083603))

(declare-fun m!1083605 () Bool)

(assert (=> b!1176170 m!1083605))

(declare-fun m!1083607 () Bool)

(assert (=> b!1176157 m!1083607))

(declare-fun m!1083609 () Bool)

(assert (=> b!1176169 m!1083609))

(declare-fun m!1083611 () Bool)

(assert (=> b!1176165 m!1083611))

(declare-fun m!1083613 () Bool)

(assert (=> b!1176164 m!1083613))

(declare-fun m!1083615 () Bool)

(assert (=> b!1176164 m!1083615))

(declare-fun m!1083617 () Bool)

(assert (=> mapNonEmpty!46235 m!1083617))

(declare-fun m!1083619 () Bool)

(assert (=> b!1176168 m!1083619))

(declare-fun m!1083621 () Bool)

(assert (=> b!1176161 m!1083621))

(declare-fun m!1083623 () Bool)

(assert (=> b!1176174 m!1083623))

(declare-fun m!1083625 () Bool)

(assert (=> b!1176159 m!1083625))

(declare-fun m!1083627 () Bool)

(assert (=> b!1176159 m!1083627))

(declare-fun m!1083629 () Bool)

(assert (=> b!1176159 m!1083629))

(declare-fun m!1083631 () Bool)

(assert (=> b!1176159 m!1083631))

(declare-fun m!1083633 () Bool)

(assert (=> b!1176159 m!1083633))

(declare-fun m!1083635 () Bool)

(assert (=> b!1176162 m!1083635))

(declare-fun m!1083637 () Bool)

(assert (=> b!1176173 m!1083637))

(declare-fun m!1083639 () Bool)

(assert (=> b!1176173 m!1083639))

(declare-fun m!1083641 () Bool)

(assert (=> b!1176173 m!1083641))

(declare-fun m!1083643 () Bool)

(assert (=> b!1176173 m!1083643))

(assert (=> b!1176160 m!1083635))

(declare-fun m!1083645 () Bool)

(assert (=> b!1176160 m!1083645))

(declare-fun m!1083647 () Bool)

(assert (=> b!1176160 m!1083647))

(assert (=> b!1176160 m!1083647))

(declare-fun m!1083649 () Bool)

(assert (=> b!1176160 m!1083649))

(declare-fun m!1083651 () Bool)

(assert (=> b!1176156 m!1083651))

(declare-fun m!1083653 () Bool)

(assert (=> b!1176172 m!1083653))

(declare-fun m!1083655 () Bool)

(assert (=> b!1176172 m!1083655))

(declare-fun m!1083657 () Bool)

(assert (=> b!1176172 m!1083657))

(declare-fun m!1083659 () Bool)

(assert (=> b!1176172 m!1083659))

(assert (=> b!1176172 m!1083635))

(declare-fun m!1083661 () Bool)

(assert (=> b!1176172 m!1083661))

(assert (=> b!1176172 m!1083635))

(declare-fun m!1083663 () Bool)

(assert (=> b!1176167 m!1083663))

(check-sat b_and!40997 (not b_next!25075) (not b!1176164) (not b!1176165) (not b!1176156) (not b!1176159) (not b!1176173) (not b!1176160) (not b!1176170) (not mapNonEmpty!46235) tp_is_empty!29605 (not b!1176172) (not start!99490) (not b!1176167) (not b_lambda!20201) (not b!1176157) (not b!1176168) (not b!1176161) (not b!1176169))
(check-sat b_and!40997 (not b_next!25075))
