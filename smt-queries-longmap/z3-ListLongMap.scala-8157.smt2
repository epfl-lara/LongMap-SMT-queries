; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99810 () Bool)

(assert start!99810)

(declare-fun b_free!25389 () Bool)

(declare-fun b_next!25389 () Bool)

(assert (=> start!99810 (= b_free!25389 (not b_next!25389))))

(declare-fun tp!88881 () Bool)

(declare-fun b_and!41645 () Bool)

(assert (=> start!99810 (= tp!88881 b_and!41645)))

(declare-fun b!1186345 () Bool)

(declare-fun res!788665 () Bool)

(declare-fun e!674534 () Bool)

(assert (=> b!1186345 (=> (not res!788665) (not e!674534))))

(declare-datatypes ((array!76633 0))(
  ( (array!76634 (arr!36966 (Array (_ BitVec 32) (_ BitVec 64))) (size!37502 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76633)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45019 0))(
  ( (V!45020 (val!15016 Int)) )
))
(declare-datatypes ((ValueCell!14250 0))(
  ( (ValueCellFull!14250 (v!17654 V!45019)) (EmptyCell!14250) )
))
(declare-datatypes ((array!76635 0))(
  ( (array!76636 (arr!36967 (Array (_ BitVec 32) ValueCell!14250)) (size!37503 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76635)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1186345 (= res!788665 (and (= (size!37503 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37502 _keys!1208) (size!37503 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186346 () Bool)

(declare-fun res!788658 () Bool)

(declare-fun e!674538 () Bool)

(assert (=> b!1186346 (=> (not res!788658) (not e!674538))))

(declare-fun lt!538855 () array!76633)

(declare-datatypes ((List!26008 0))(
  ( (Nil!26005) (Cons!26004 (h!27213 (_ BitVec 64)) (t!38389 List!26008)) )
))
(declare-fun arrayNoDuplicates!0 (array!76633 (_ BitVec 32) List!26008) Bool)

(assert (=> b!1186346 (= res!788658 (arrayNoDuplicates!0 lt!538855 #b00000000000000000000000000000000 Nil!26005))))

(declare-fun b!1186347 () Bool)

(declare-datatypes ((Unit!39320 0))(
  ( (Unit!39321) )
))
(declare-fun e!674537 () Unit!39320)

(declare-fun Unit!39322 () Unit!39320)

(assert (=> b!1186347 (= e!674537 Unit!39322)))

(declare-fun mapIsEmpty!46706 () Bool)

(declare-fun mapRes!46706 () Bool)

(assert (=> mapIsEmpty!46706 mapRes!46706))

(declare-fun b!1186349 () Bool)

(declare-fun e!674542 () Bool)

(declare-fun tp_is_empty!29919 () Bool)

(assert (=> b!1186349 (= e!674542 tp_is_empty!29919)))

(declare-fun b!1186350 () Bool)

(declare-fun Unit!39323 () Unit!39320)

(assert (=> b!1186350 (= e!674537 Unit!39323)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538846 () Unit!39320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76633 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39320)

(assert (=> b!1186350 (= lt!538846 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186350 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538848 () Unit!39320)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76633 (_ BitVec 32) (_ BitVec 32)) Unit!39320)

(assert (=> b!1186350 (= lt!538848 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186350 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26005)))

(declare-fun lt!538856 () Unit!39320)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76633 (_ BitVec 64) (_ BitVec 32) List!26008) Unit!39320)

(assert (=> b!1186350 (= lt!538856 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26005))))

(assert (=> b!1186350 false))

(declare-fun b!1186351 () Bool)

(declare-fun res!788664 () Bool)

(assert (=> b!1186351 (=> (not res!788664) (not e!674534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76633 (_ BitVec 32)) Bool)

(assert (=> b!1186351 (= res!788664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186352 () Bool)

(declare-fun res!788659 () Bool)

(assert (=> b!1186352 (=> (not res!788659) (not e!674534))))

(assert (=> b!1186352 (= res!788659 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37502 _keys!1208))))))

(declare-fun b!1186353 () Bool)

(declare-fun res!788656 () Bool)

(assert (=> b!1186353 (=> (not res!788656) (not e!674534))))

(assert (=> b!1186353 (= res!788656 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26005))))

(declare-fun b!1186354 () Bool)

(declare-fun e!674533 () Bool)

(declare-fun e!674541 () Bool)

(assert (=> b!1186354 (= e!674533 e!674541)))

(declare-fun res!788663 () Bool)

(assert (=> b!1186354 (=> res!788663 e!674541)))

(assert (=> b!1186354 (= res!788663 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45019)

(declare-fun lt!538852 () array!76635)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19268 0))(
  ( (tuple2!19269 (_1!9645 (_ BitVec 64)) (_2!9645 V!45019)) )
))
(declare-datatypes ((List!26009 0))(
  ( (Nil!26006) (Cons!26005 (h!27214 tuple2!19268) (t!38390 List!26009)) )
))
(declare-datatypes ((ListLongMap!17237 0))(
  ( (ListLongMap!17238 (toList!8634 List!26009)) )
))
(declare-fun lt!538840 () ListLongMap!17237)

(declare-fun minValue!944 () V!45019)

(declare-fun getCurrentListMapNoExtraKeys!5078 (array!76633 array!76635 (_ BitVec 32) (_ BitVec 32) V!45019 V!45019 (_ BitVec 32) Int) ListLongMap!17237)

(assert (=> b!1186354 (= lt!538840 (getCurrentListMapNoExtraKeys!5078 lt!538855 lt!538852 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538841 () V!45019)

(assert (=> b!1186354 (= lt!538852 (array!76636 (store (arr!36967 _values!996) i!673 (ValueCellFull!14250 lt!538841)) (size!37503 _values!996)))))

(declare-fun dynLambda!3027 (Int (_ BitVec 64)) V!45019)

(assert (=> b!1186354 (= lt!538841 (dynLambda!3027 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538854 () ListLongMap!17237)

(assert (=> b!1186354 (= lt!538854 (getCurrentListMapNoExtraKeys!5078 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46706 () Bool)

(declare-fun tp!88880 () Bool)

(assert (=> mapNonEmpty!46706 (= mapRes!46706 (and tp!88880 e!674542))))

(declare-fun mapRest!46706 () (Array (_ BitVec 32) ValueCell!14250))

(declare-fun mapValue!46706 () ValueCell!14250)

(declare-fun mapKey!46706 () (_ BitVec 32))

(assert (=> mapNonEmpty!46706 (= (arr!36967 _values!996) (store mapRest!46706 mapKey!46706 mapValue!46706))))

(declare-fun b!1186355 () Bool)

(assert (=> b!1186355 (= e!674534 e!674538)))

(declare-fun res!788666 () Bool)

(assert (=> b!1186355 (=> (not res!788666) (not e!674538))))

(assert (=> b!1186355 (= res!788666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538855 mask!1564))))

(assert (=> b!1186355 (= lt!538855 (array!76634 (store (arr!36966 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37502 _keys!1208)))))

(declare-fun b!1186356 () Bool)

(assert (=> b!1186356 (= e!674538 (not e!674533))))

(declare-fun res!788657 () Bool)

(assert (=> b!1186356 (=> res!788657 e!674533)))

(assert (=> b!1186356 (= res!788657 (bvsgt from!1455 i!673))))

(assert (=> b!1186356 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538844 () Unit!39320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76633 (_ BitVec 64) (_ BitVec 32)) Unit!39320)

(assert (=> b!1186356 (= lt!538844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186357 () Bool)

(declare-fun res!788654 () Bool)

(assert (=> b!1186357 (=> (not res!788654) (not e!674534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186357 (= res!788654 (validKeyInArray!0 k0!934))))

(declare-fun b!1186358 () Bool)

(declare-fun e!674531 () Bool)

(assert (=> b!1186358 (= e!674531 true)))

(declare-fun lt!538845 () ListLongMap!17237)

(declare-fun lt!538850 () ListLongMap!17237)

(declare-fun -!1666 (ListLongMap!17237 (_ BitVec 64)) ListLongMap!17237)

(assert (=> b!1186358 (= (-!1666 lt!538845 k0!934) lt!538850)))

(declare-fun lt!538843 () Unit!39320)

(declare-fun lt!538842 () ListLongMap!17237)

(declare-fun lt!538849 () V!45019)

(declare-fun addRemoveCommutativeForDiffKeys!191 (ListLongMap!17237 (_ BitVec 64) V!45019 (_ BitVec 64)) Unit!39320)

(assert (=> b!1186358 (= lt!538843 (addRemoveCommutativeForDiffKeys!191 lt!538842 (select (arr!36966 _keys!1208) from!1455) lt!538849 k0!934))))

(declare-fun lt!538839 () ListLongMap!17237)

(declare-fun lt!538857 () ListLongMap!17237)

(assert (=> b!1186358 (and (= lt!538854 lt!538845) (= lt!538857 lt!538839))))

(declare-fun lt!538847 () tuple2!19268)

(declare-fun +!3928 (ListLongMap!17237 tuple2!19268) ListLongMap!17237)

(assert (=> b!1186358 (= lt!538845 (+!3928 lt!538842 lt!538847))))

(assert (=> b!1186358 (not (= (select (arr!36966 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538853 () Unit!39320)

(assert (=> b!1186358 (= lt!538853 e!674537)))

(declare-fun c!117207 () Bool)

(assert (=> b!1186358 (= c!117207 (= (select (arr!36966 _keys!1208) from!1455) k0!934))))

(declare-fun e!674532 () Bool)

(assert (=> b!1186358 e!674532))

(declare-fun res!788662 () Bool)

(assert (=> b!1186358 (=> (not res!788662) (not e!674532))))

(assert (=> b!1186358 (= res!788662 (= lt!538840 lt!538850))))

(assert (=> b!1186358 (= lt!538850 (+!3928 lt!538857 lt!538847))))

(assert (=> b!1186358 (= lt!538847 (tuple2!19269 (select (arr!36966 _keys!1208) from!1455) lt!538849))))

(declare-fun get!18931 (ValueCell!14250 V!45019) V!45019)

(assert (=> b!1186358 (= lt!538849 (get!18931 (select (arr!36967 _values!996) from!1455) lt!538841))))

(declare-fun b!1186359 () Bool)

(declare-fun res!788661 () Bool)

(assert (=> b!1186359 (=> (not res!788661) (not e!674534))))

(assert (=> b!1186359 (= res!788661 (= (select (arr!36966 _keys!1208) i!673) k0!934))))

(declare-fun b!1186348 () Bool)

(assert (=> b!1186348 (= e!674541 e!674531)))

(declare-fun res!788655 () Bool)

(assert (=> b!1186348 (=> res!788655 e!674531)))

(assert (=> b!1186348 (= res!788655 (not (validKeyInArray!0 (select (arr!36966 _keys!1208) from!1455))))))

(assert (=> b!1186348 (= lt!538839 lt!538857)))

(assert (=> b!1186348 (= lt!538857 (-!1666 lt!538842 k0!934))))

(assert (=> b!1186348 (= lt!538839 (getCurrentListMapNoExtraKeys!5078 lt!538855 lt!538852 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186348 (= lt!538842 (getCurrentListMapNoExtraKeys!5078 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538851 () Unit!39320)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!880 (array!76633 array!76635 (_ BitVec 32) (_ BitVec 32) V!45019 V!45019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39320)

(assert (=> b!1186348 (= lt!538851 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!880 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!788660 () Bool)

(assert (=> start!99810 (=> (not res!788660) (not e!674534))))

(assert (=> start!99810 (= res!788660 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37502 _keys!1208))))))

(assert (=> start!99810 e!674534))

(assert (=> start!99810 tp_is_empty!29919))

(declare-fun array_inv!28210 (array!76633) Bool)

(assert (=> start!99810 (array_inv!28210 _keys!1208)))

(assert (=> start!99810 true))

(assert (=> start!99810 tp!88881))

(declare-fun e!674535 () Bool)

(declare-fun array_inv!28211 (array!76635) Bool)

(assert (=> start!99810 (and (array_inv!28211 _values!996) e!674535)))

(declare-fun b!1186360 () Bool)

(declare-fun e!674539 () Bool)

(assert (=> b!1186360 (= e!674535 (and e!674539 mapRes!46706))))

(declare-fun condMapEmpty!46706 () Bool)

(declare-fun mapDefault!46706 () ValueCell!14250)

(assert (=> b!1186360 (= condMapEmpty!46706 (= (arr!36967 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14250)) mapDefault!46706)))))

(declare-fun e!674540 () Bool)

(declare-fun b!1186361 () Bool)

(assert (=> b!1186361 (= e!674540 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186362 () Bool)

(assert (=> b!1186362 (= e!674532 e!674540)))

(declare-fun res!788667 () Bool)

(assert (=> b!1186362 (=> res!788667 e!674540)))

(assert (=> b!1186362 (= res!788667 (not (= (select (arr!36966 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186363 () Bool)

(declare-fun res!788668 () Bool)

(assert (=> b!1186363 (=> (not res!788668) (not e!674534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186363 (= res!788668 (validMask!0 mask!1564))))

(declare-fun b!1186364 () Bool)

(assert (=> b!1186364 (= e!674539 tp_is_empty!29919)))

(assert (= (and start!99810 res!788660) b!1186363))

(assert (= (and b!1186363 res!788668) b!1186345))

(assert (= (and b!1186345 res!788665) b!1186351))

(assert (= (and b!1186351 res!788664) b!1186353))

(assert (= (and b!1186353 res!788656) b!1186352))

(assert (= (and b!1186352 res!788659) b!1186357))

(assert (= (and b!1186357 res!788654) b!1186359))

(assert (= (and b!1186359 res!788661) b!1186355))

(assert (= (and b!1186355 res!788666) b!1186346))

(assert (= (and b!1186346 res!788658) b!1186356))

(assert (= (and b!1186356 (not res!788657)) b!1186354))

(assert (= (and b!1186354 (not res!788663)) b!1186348))

(assert (= (and b!1186348 (not res!788655)) b!1186358))

(assert (= (and b!1186358 res!788662) b!1186362))

(assert (= (and b!1186362 (not res!788667)) b!1186361))

(assert (= (and b!1186358 c!117207) b!1186350))

(assert (= (and b!1186358 (not c!117207)) b!1186347))

(assert (= (and b!1186360 condMapEmpty!46706) mapIsEmpty!46706))

(assert (= (and b!1186360 (not condMapEmpty!46706)) mapNonEmpty!46706))

(get-info :version)

(assert (= (and mapNonEmpty!46706 ((_ is ValueCellFull!14250) mapValue!46706)) b!1186349))

(assert (= (and b!1186360 ((_ is ValueCellFull!14250) mapDefault!46706)) b!1186364))

(assert (= start!99810 b!1186360))

(declare-fun b_lambda!20533 () Bool)

(assert (=> (not b_lambda!20533) (not b!1186354)))

(declare-fun t!38388 () Bool)

(declare-fun tb!10201 () Bool)

(assert (=> (and start!99810 (= defaultEntry!1004 defaultEntry!1004) t!38388) tb!10201))

(declare-fun result!20969 () Bool)

(assert (=> tb!10201 (= result!20969 tp_is_empty!29919)))

(assert (=> b!1186354 t!38388))

(declare-fun b_and!41647 () Bool)

(assert (= b_and!41645 (and (=> t!38388 result!20969) b_and!41647)))

(declare-fun m!1094875 () Bool)

(assert (=> b!1186359 m!1094875))

(declare-fun m!1094877 () Bool)

(assert (=> b!1186348 m!1094877))

(declare-fun m!1094879 () Bool)

(assert (=> b!1186348 m!1094879))

(declare-fun m!1094881 () Bool)

(assert (=> b!1186348 m!1094881))

(declare-fun m!1094883 () Bool)

(assert (=> b!1186348 m!1094883))

(declare-fun m!1094885 () Bool)

(assert (=> b!1186348 m!1094885))

(declare-fun m!1094887 () Bool)

(assert (=> b!1186348 m!1094887))

(assert (=> b!1186348 m!1094883))

(declare-fun m!1094889 () Bool)

(assert (=> start!99810 m!1094889))

(declare-fun m!1094891 () Bool)

(assert (=> start!99810 m!1094891))

(declare-fun m!1094893 () Bool)

(assert (=> b!1186355 m!1094893))

(declare-fun m!1094895 () Bool)

(assert (=> b!1186355 m!1094895))

(declare-fun m!1094897 () Bool)

(assert (=> b!1186351 m!1094897))

(declare-fun m!1094899 () Bool)

(assert (=> mapNonEmpty!46706 m!1094899))

(declare-fun m!1094901 () Bool)

(assert (=> b!1186361 m!1094901))

(declare-fun m!1094903 () Bool)

(assert (=> b!1186346 m!1094903))

(declare-fun m!1094905 () Bool)

(assert (=> b!1186353 m!1094905))

(assert (=> b!1186362 m!1094883))

(declare-fun m!1094907 () Bool)

(assert (=> b!1186357 m!1094907))

(declare-fun m!1094909 () Bool)

(assert (=> b!1186358 m!1094909))

(declare-fun m!1094911 () Bool)

(assert (=> b!1186358 m!1094911))

(declare-fun m!1094913 () Bool)

(assert (=> b!1186358 m!1094913))

(declare-fun m!1094915 () Bool)

(assert (=> b!1186358 m!1094915))

(assert (=> b!1186358 m!1094911))

(declare-fun m!1094917 () Bool)

(assert (=> b!1186358 m!1094917))

(assert (=> b!1186358 m!1094883))

(declare-fun m!1094919 () Bool)

(assert (=> b!1186358 m!1094919))

(assert (=> b!1186358 m!1094883))

(declare-fun m!1094921 () Bool)

(assert (=> b!1186363 m!1094921))

(declare-fun m!1094923 () Bool)

(assert (=> b!1186350 m!1094923))

(declare-fun m!1094925 () Bool)

(assert (=> b!1186350 m!1094925))

(declare-fun m!1094927 () Bool)

(assert (=> b!1186350 m!1094927))

(declare-fun m!1094929 () Bool)

(assert (=> b!1186350 m!1094929))

(declare-fun m!1094931 () Bool)

(assert (=> b!1186350 m!1094931))

(declare-fun m!1094933 () Bool)

(assert (=> b!1186354 m!1094933))

(declare-fun m!1094935 () Bool)

(assert (=> b!1186354 m!1094935))

(declare-fun m!1094937 () Bool)

(assert (=> b!1186354 m!1094937))

(declare-fun m!1094939 () Bool)

(assert (=> b!1186354 m!1094939))

(declare-fun m!1094941 () Bool)

(assert (=> b!1186356 m!1094941))

(declare-fun m!1094943 () Bool)

(assert (=> b!1186356 m!1094943))

(check-sat (not b_next!25389) (not b!1186350) (not b!1186346) (not b!1186363) b_and!41647 (not b_lambda!20533) (not b!1186356) (not b!1186354) (not mapNonEmpty!46706) (not b!1186351) (not b!1186353) (not b!1186355) tp_is_empty!29919 (not b!1186348) (not b!1186358) (not b!1186357) (not start!99810) (not b!1186361))
(check-sat b_and!41647 (not b_next!25389))
