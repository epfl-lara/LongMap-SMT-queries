; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99672 () Bool)

(assert start!99672)

(declare-fun b_free!25015 () Bool)

(declare-fun b_next!25015 () Bool)

(assert (=> start!99672 (= b_free!25015 (not b_next!25015))))

(declare-fun tp!87759 () Bool)

(declare-fun b_and!40899 () Bool)

(assert (=> start!99672 (= tp!87759 b_and!40899)))

(declare-fun b!1175698 () Bool)

(declare-fun e!668390 () Bool)

(declare-fun e!668384 () Bool)

(assert (=> b!1175698 (= e!668390 e!668384)))

(declare-fun res!780413 () Bool)

(assert (=> b!1175698 (=> res!780413 e!668384)))

(declare-datatypes ((array!75955 0))(
  ( (array!75956 (arr!36621 (Array (_ BitVec 32) (_ BitVec 64))) (size!37158 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75955)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175698 (= res!780413 (not (= (select (arr!36621 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46145 () Bool)

(declare-fun mapRes!46145 () Bool)

(declare-fun tp!87758 () Bool)

(declare-fun e!668383 () Bool)

(assert (=> mapNonEmpty!46145 (= mapRes!46145 (and tp!87758 e!668383))))

(declare-datatypes ((V!44521 0))(
  ( (V!44522 (val!14829 Int)) )
))
(declare-datatypes ((ValueCell!14063 0))(
  ( (ValueCellFull!14063 (v!17463 V!44521)) (EmptyCell!14063) )
))
(declare-fun mapRest!46145 () (Array (_ BitVec 32) ValueCell!14063))

(declare-fun mapKey!46145 () (_ BitVec 32))

(declare-fun mapValue!46145 () ValueCell!14063)

(declare-datatypes ((array!75957 0))(
  ( (array!75958 (arr!36622 (Array (_ BitVec 32) ValueCell!14063)) (size!37159 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75957)

(assert (=> mapNonEmpty!46145 (= (arr!36622 _values!996) (store mapRest!46145 mapKey!46145 mapValue!46145))))

(declare-fun b!1175699 () Bool)

(declare-fun res!780405 () Bool)

(declare-fun e!668386 () Bool)

(assert (=> b!1175699 (=> (not res!780405) (not e!668386))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175699 (= res!780405 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37158 _keys!1208))))))

(declare-fun b!1175700 () Bool)

(declare-fun e!668389 () Bool)

(declare-fun tp_is_empty!29545 () Bool)

(assert (=> b!1175700 (= e!668389 tp_is_empty!29545)))

(declare-fun b!1175701 () Bool)

(declare-fun res!780418 () Bool)

(assert (=> b!1175701 (=> (not res!780418) (not e!668386))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175701 (= res!780418 (validMask!0 mask!1564))))

(declare-fun b!1175702 () Bool)

(declare-fun e!668382 () Bool)

(declare-fun e!668381 () Bool)

(assert (=> b!1175702 (= e!668382 (not e!668381))))

(declare-fun res!780407 () Bool)

(assert (=> b!1175702 (=> res!780407 e!668381)))

(assert (=> b!1175702 (= res!780407 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175702 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38735 0))(
  ( (Unit!38736) )
))
(declare-fun lt!530076 () Unit!38735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75955 (_ BitVec 64) (_ BitVec 32)) Unit!38735)

(assert (=> b!1175702 (= lt!530076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175703 () Bool)

(declare-fun e!668379 () Bool)

(assert (=> b!1175703 (= e!668381 e!668379)))

(declare-fun res!780406 () Bool)

(assert (=> b!1175703 (=> res!780406 e!668379)))

(assert (=> b!1175703 (= res!780406 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!530080 () array!75957)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18996 0))(
  ( (tuple2!18997 (_1!9509 (_ BitVec 64)) (_2!9509 V!44521)) )
))
(declare-datatypes ((List!25732 0))(
  ( (Nil!25729) (Cons!25728 (h!26946 tuple2!18996) (t!37731 List!25732)) )
))
(declare-datatypes ((ListLongMap!16973 0))(
  ( (ListLongMap!16974 (toList!8502 List!25732)) )
))
(declare-fun lt!530071 () ListLongMap!16973)

(declare-fun minValue!944 () V!44521)

(declare-fun lt!530067 () array!75955)

(declare-fun getCurrentListMapNoExtraKeys!4986 (array!75955 array!75957 (_ BitVec 32) (_ BitVec 32) V!44521 V!44521 (_ BitVec 32) Int) ListLongMap!16973)

(assert (=> b!1175703 (= lt!530071 (getCurrentListMapNoExtraKeys!4986 lt!530067 lt!530080 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530075 () V!44521)

(assert (=> b!1175703 (= lt!530080 (array!75958 (store (arr!36622 _values!996) i!673 (ValueCellFull!14063 lt!530075)) (size!37159 _values!996)))))

(declare-fun dynLambda!2964 (Int (_ BitVec 64)) V!44521)

(assert (=> b!1175703 (= lt!530075 (dynLambda!2964 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530068 () ListLongMap!16973)

(assert (=> b!1175703 (= lt!530068 (getCurrentListMapNoExtraKeys!4986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46145 () Bool)

(assert (=> mapIsEmpty!46145 mapRes!46145))

(declare-fun res!780417 () Bool)

(assert (=> start!99672 (=> (not res!780417) (not e!668386))))

(assert (=> start!99672 (= res!780417 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37158 _keys!1208))))))

(assert (=> start!99672 e!668386))

(assert (=> start!99672 tp_is_empty!29545))

(declare-fun array_inv!28054 (array!75955) Bool)

(assert (=> start!99672 (array_inv!28054 _keys!1208)))

(assert (=> start!99672 true))

(assert (=> start!99672 tp!87759))

(declare-fun e!668380 () Bool)

(declare-fun array_inv!28055 (array!75957) Bool)

(assert (=> start!99672 (and (array_inv!28055 _values!996) e!668380)))

(declare-fun b!1175704 () Bool)

(declare-fun res!780411 () Bool)

(assert (=> b!1175704 (=> (not res!780411) (not e!668386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175704 (= res!780411 (validKeyInArray!0 k0!934))))

(declare-fun b!1175705 () Bool)

(declare-fun res!780409 () Bool)

(assert (=> b!1175705 (=> (not res!780409) (not e!668386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75955 (_ BitVec 32)) Bool)

(assert (=> b!1175705 (= res!780409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175706 () Bool)

(declare-fun e!668385 () Bool)

(assert (=> b!1175706 (= e!668385 true)))

(assert (=> b!1175706 (not (= (select (arr!36621 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530078 () Unit!38735)

(declare-fun e!668388 () Unit!38735)

(assert (=> b!1175706 (= lt!530078 e!668388)))

(declare-fun c!117044 () Bool)

(assert (=> b!1175706 (= c!117044 (= (select (arr!36621 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175706 e!668390))

(declare-fun res!780412 () Bool)

(assert (=> b!1175706 (=> (not res!780412) (not e!668390))))

(declare-fun lt!530079 () ListLongMap!16973)

(declare-fun +!3834 (ListLongMap!16973 tuple2!18996) ListLongMap!16973)

(declare-fun get!18724 (ValueCell!14063 V!44521) V!44521)

(assert (=> b!1175706 (= res!780412 (= lt!530071 (+!3834 lt!530079 (tuple2!18997 (select (arr!36621 _keys!1208) from!1455) (get!18724 (select (arr!36622 _values!996) from!1455) lt!530075)))))))

(declare-fun b!1175707 () Bool)

(assert (=> b!1175707 (= e!668386 e!668382)))

(declare-fun res!780419 () Bool)

(assert (=> b!1175707 (=> (not res!780419) (not e!668382))))

(assert (=> b!1175707 (= res!780419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530067 mask!1564))))

(assert (=> b!1175707 (= lt!530067 (array!75956 (store (arr!36621 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37158 _keys!1208)))))

(declare-fun b!1175708 () Bool)

(assert (=> b!1175708 (= e!668380 (and e!668389 mapRes!46145))))

(declare-fun condMapEmpty!46145 () Bool)

(declare-fun mapDefault!46145 () ValueCell!14063)

(assert (=> b!1175708 (= condMapEmpty!46145 (= (arr!36622 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14063)) mapDefault!46145)))))

(declare-fun b!1175709 () Bool)

(declare-fun res!780415 () Bool)

(assert (=> b!1175709 (=> (not res!780415) (not e!668382))))

(declare-datatypes ((List!25733 0))(
  ( (Nil!25730) (Cons!25729 (h!26947 (_ BitVec 64)) (t!37732 List!25733)) )
))
(declare-fun arrayNoDuplicates!0 (array!75955 (_ BitVec 32) List!25733) Bool)

(assert (=> b!1175709 (= res!780415 (arrayNoDuplicates!0 lt!530067 #b00000000000000000000000000000000 Nil!25730))))

(declare-fun b!1175710 () Bool)

(assert (=> b!1175710 (= e!668383 tp_is_empty!29545)))

(declare-fun b!1175711 () Bool)

(declare-fun Unit!38737 () Unit!38735)

(assert (=> b!1175711 (= e!668388 Unit!38737)))

(declare-fun b!1175712 () Bool)

(declare-fun Unit!38738 () Unit!38735)

(assert (=> b!1175712 (= e!668388 Unit!38738)))

(declare-fun lt!530077 () Unit!38735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75955 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38735)

(assert (=> b!1175712 (= lt!530077 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175712 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530073 () Unit!38735)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75955 (_ BitVec 32) (_ BitVec 32)) Unit!38735)

(assert (=> b!1175712 (= lt!530073 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175712 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25730)))

(declare-fun lt!530069 () Unit!38735)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75955 (_ BitVec 64) (_ BitVec 32) List!25733) Unit!38735)

(assert (=> b!1175712 (= lt!530069 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25730))))

(assert (=> b!1175712 false))

(declare-fun b!1175713 () Bool)

(declare-fun res!780410 () Bool)

(assert (=> b!1175713 (=> (not res!780410) (not e!668386))))

(assert (=> b!1175713 (= res!780410 (and (= (size!37159 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37158 _keys!1208) (size!37159 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175714 () Bool)

(declare-fun res!780408 () Bool)

(assert (=> b!1175714 (=> (not res!780408) (not e!668386))))

(assert (=> b!1175714 (= res!780408 (= (select (arr!36621 _keys!1208) i!673) k0!934))))

(declare-fun b!1175715 () Bool)

(declare-fun res!780414 () Bool)

(assert (=> b!1175715 (=> (not res!780414) (not e!668386))))

(assert (=> b!1175715 (= res!780414 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25730))))

(declare-fun b!1175716 () Bool)

(assert (=> b!1175716 (= e!668384 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175717 () Bool)

(assert (=> b!1175717 (= e!668379 e!668385)))

(declare-fun res!780416 () Bool)

(assert (=> b!1175717 (=> res!780416 e!668385)))

(assert (=> b!1175717 (= res!780416 (not (validKeyInArray!0 (select (arr!36621 _keys!1208) from!1455))))))

(declare-fun lt!530074 () ListLongMap!16973)

(assert (=> b!1175717 (= lt!530074 lt!530079)))

(declare-fun lt!530070 () ListLongMap!16973)

(declare-fun -!1546 (ListLongMap!16973 (_ BitVec 64)) ListLongMap!16973)

(assert (=> b!1175717 (= lt!530079 (-!1546 lt!530070 k0!934))))

(assert (=> b!1175717 (= lt!530074 (getCurrentListMapNoExtraKeys!4986 lt!530067 lt!530080 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175717 (= lt!530070 (getCurrentListMapNoExtraKeys!4986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530072 () Unit!38735)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!771 (array!75955 array!75957 (_ BitVec 32) (_ BitVec 32) V!44521 V!44521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38735)

(assert (=> b!1175717 (= lt!530072 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!771 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99672 res!780417) b!1175701))

(assert (= (and b!1175701 res!780418) b!1175713))

(assert (= (and b!1175713 res!780410) b!1175705))

(assert (= (and b!1175705 res!780409) b!1175715))

(assert (= (and b!1175715 res!780414) b!1175699))

(assert (= (and b!1175699 res!780405) b!1175704))

(assert (= (and b!1175704 res!780411) b!1175714))

(assert (= (and b!1175714 res!780408) b!1175707))

(assert (= (and b!1175707 res!780419) b!1175709))

(assert (= (and b!1175709 res!780415) b!1175702))

(assert (= (and b!1175702 (not res!780407)) b!1175703))

(assert (= (and b!1175703 (not res!780406)) b!1175717))

(assert (= (and b!1175717 (not res!780416)) b!1175706))

(assert (= (and b!1175706 res!780412) b!1175698))

(assert (= (and b!1175698 (not res!780413)) b!1175716))

(assert (= (and b!1175706 c!117044) b!1175712))

(assert (= (and b!1175706 (not c!117044)) b!1175711))

(assert (= (and b!1175708 condMapEmpty!46145) mapIsEmpty!46145))

(assert (= (and b!1175708 (not condMapEmpty!46145)) mapNonEmpty!46145))

(get-info :version)

(assert (= (and mapNonEmpty!46145 ((_ is ValueCellFull!14063) mapValue!46145)) b!1175710))

(assert (= (and b!1175708 ((_ is ValueCellFull!14063) mapDefault!46145)) b!1175700))

(assert (= start!99672 b!1175708))

(declare-fun b_lambda!20153 () Bool)

(assert (=> (not b_lambda!20153) (not b!1175703)))

(declare-fun t!37730 () Bool)

(declare-fun tb!9819 () Bool)

(assert (=> (and start!99672 (= defaultEntry!1004 defaultEntry!1004) t!37730) tb!9819))

(declare-fun result!20213 () Bool)

(assert (=> tb!9819 (= result!20213 tp_is_empty!29545)))

(assert (=> b!1175703 t!37730))

(declare-fun b_and!40901 () Bool)

(assert (= b_and!40899 (and (=> t!37730 result!20213) b_and!40901)))

(declare-fun m!1083855 () Bool)

(assert (=> b!1175716 m!1083855))

(declare-fun m!1083857 () Bool)

(assert (=> b!1175706 m!1083857))

(declare-fun m!1083859 () Bool)

(assert (=> b!1175706 m!1083859))

(assert (=> b!1175706 m!1083859))

(declare-fun m!1083861 () Bool)

(assert (=> b!1175706 m!1083861))

(declare-fun m!1083863 () Bool)

(assert (=> b!1175706 m!1083863))

(assert (=> b!1175698 m!1083857))

(declare-fun m!1083865 () Bool)

(assert (=> start!99672 m!1083865))

(declare-fun m!1083867 () Bool)

(assert (=> start!99672 m!1083867))

(declare-fun m!1083869 () Bool)

(assert (=> b!1175709 m!1083869))

(declare-fun m!1083871 () Bool)

(assert (=> b!1175702 m!1083871))

(declare-fun m!1083873 () Bool)

(assert (=> b!1175702 m!1083873))

(declare-fun m!1083875 () Bool)

(assert (=> b!1175707 m!1083875))

(declare-fun m!1083877 () Bool)

(assert (=> b!1175707 m!1083877))

(declare-fun m!1083879 () Bool)

(assert (=> b!1175714 m!1083879))

(declare-fun m!1083881 () Bool)

(assert (=> mapNonEmpty!46145 m!1083881))

(declare-fun m!1083883 () Bool)

(assert (=> b!1175715 m!1083883))

(declare-fun m!1083885 () Bool)

(assert (=> b!1175705 m!1083885))

(declare-fun m!1083887 () Bool)

(assert (=> b!1175701 m!1083887))

(declare-fun m!1083889 () Bool)

(assert (=> b!1175704 m!1083889))

(declare-fun m!1083891 () Bool)

(assert (=> b!1175717 m!1083891))

(declare-fun m!1083893 () Bool)

(assert (=> b!1175717 m!1083893))

(declare-fun m!1083895 () Bool)

(assert (=> b!1175717 m!1083895))

(declare-fun m!1083897 () Bool)

(assert (=> b!1175717 m!1083897))

(assert (=> b!1175717 m!1083857))

(declare-fun m!1083899 () Bool)

(assert (=> b!1175717 m!1083899))

(assert (=> b!1175717 m!1083857))

(declare-fun m!1083901 () Bool)

(assert (=> b!1175712 m!1083901))

(declare-fun m!1083903 () Bool)

(assert (=> b!1175712 m!1083903))

(declare-fun m!1083905 () Bool)

(assert (=> b!1175712 m!1083905))

(declare-fun m!1083907 () Bool)

(assert (=> b!1175712 m!1083907))

(declare-fun m!1083909 () Bool)

(assert (=> b!1175712 m!1083909))

(declare-fun m!1083911 () Bool)

(assert (=> b!1175703 m!1083911))

(declare-fun m!1083913 () Bool)

(assert (=> b!1175703 m!1083913))

(declare-fun m!1083915 () Bool)

(assert (=> b!1175703 m!1083915))

(declare-fun m!1083917 () Bool)

(assert (=> b!1175703 m!1083917))

(check-sat (not start!99672) (not b!1175715) (not b!1175706) (not b!1175705) (not b!1175709) tp_is_empty!29545 (not b!1175712) (not b!1175716) (not b_next!25015) (not mapNonEmpty!46145) (not b!1175702) (not b!1175717) (not b!1175703) (not b!1175707) (not b!1175701) (not b!1175704) b_and!40901 (not b_lambda!20153))
(check-sat b_and!40901 (not b_next!25015))
