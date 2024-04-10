; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101234 () Bool)

(assert start!101234)

(declare-fun b_free!26157 () Bool)

(declare-fun b_next!26157 () Bool)

(assert (=> start!101234 (= b_free!26157 (not b_next!26157))))

(declare-fun tp!91492 () Bool)

(declare-fun b_and!43431 () Bool)

(assert (=> start!101234 (= tp!91492 b_and!43431)))

(declare-fun res!807221 () Bool)

(declare-fun e!690281 () Bool)

(assert (=> start!101234 (=> (not res!807221) (not e!690281))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78495 0))(
  ( (array!78496 (arr!37882 (Array (_ BitVec 32) (_ BitVec 64))) (size!38418 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78495)

(assert (=> start!101234 (= res!807221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38418 _keys!1208))))))

(assert (=> start!101234 e!690281))

(declare-fun tp_is_empty!30861 () Bool)

(assert (=> start!101234 tp_is_empty!30861))

(declare-fun array_inv!28846 (array!78495) Bool)

(assert (=> start!101234 (array_inv!28846 _keys!1208)))

(assert (=> start!101234 true))

(assert (=> start!101234 tp!91492))

(declare-datatypes ((V!46275 0))(
  ( (V!46276 (val!15487 Int)) )
))
(declare-datatypes ((ValueCell!14721 0))(
  ( (ValueCellFull!14721 (v!18140 V!46275)) (EmptyCell!14721) )
))
(declare-datatypes ((array!78497 0))(
  ( (array!78498 (arr!37883 (Array (_ BitVec 32) ValueCell!14721)) (size!38419 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78497)

(declare-fun e!690283 () Bool)

(declare-fun array_inv!28847 (array!78497) Bool)

(assert (=> start!101234 (and (array_inv!28847 _values!996) e!690283)))

(declare-fun b!1215728 () Bool)

(declare-fun res!807229 () Bool)

(assert (=> b!1215728 (=> (not res!807229) (not e!690281))))

(declare-datatypes ((List!26706 0))(
  ( (Nil!26703) (Cons!26702 (h!27911 (_ BitVec 64)) (t!39843 List!26706)) )
))
(declare-fun arrayNoDuplicates!0 (array!78495 (_ BitVec 32) List!26706) Bool)

(assert (=> b!1215728 (= res!807229 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26703))))

(declare-fun b!1215729 () Bool)

(declare-fun e!690280 () Bool)

(assert (=> b!1215729 (= e!690280 tp_is_empty!30861)))

(declare-fun mapIsEmpty!48166 () Bool)

(declare-fun mapRes!48166 () Bool)

(assert (=> mapIsEmpty!48166 mapRes!48166))

(declare-fun b!1215730 () Bool)

(declare-fun res!807220 () Bool)

(assert (=> b!1215730 (=> (not res!807220) (not e!690281))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1215730 (= res!807220 (and (= (size!38419 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38418 _keys!1208) (size!38419 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215731 () Bool)

(declare-fun e!690285 () Bool)

(assert (=> b!1215731 (= e!690281 e!690285)))

(declare-fun res!807228 () Bool)

(assert (=> b!1215731 (=> (not res!807228) (not e!690285))))

(declare-fun lt!552696 () array!78495)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78495 (_ BitVec 32)) Bool)

(assert (=> b!1215731 (= res!807228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552696 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215731 (= lt!552696 (array!78496 (store (arr!37882 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38418 _keys!1208)))))

(declare-fun b!1215732 () Bool)

(declare-fun res!807226 () Bool)

(assert (=> b!1215732 (=> (not res!807226) (not e!690281))))

(assert (=> b!1215732 (= res!807226 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38418 _keys!1208))))))

(declare-fun b!1215733 () Bool)

(declare-fun e!690282 () Bool)

(assert (=> b!1215733 (= e!690282 tp_is_empty!30861)))

(declare-fun b!1215734 () Bool)

(assert (=> b!1215734 (= e!690283 (and e!690280 mapRes!48166))))

(declare-fun condMapEmpty!48166 () Bool)

(declare-fun mapDefault!48166 () ValueCell!14721)

(assert (=> b!1215734 (= condMapEmpty!48166 (= (arr!37883 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14721)) mapDefault!48166)))))

(declare-fun b!1215735 () Bool)

(declare-fun res!807222 () Bool)

(assert (=> b!1215735 (=> (not res!807222) (not e!690281))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215735 (= res!807222 (validKeyInArray!0 k0!934))))

(declare-fun b!1215736 () Bool)

(declare-fun e!690286 () Bool)

(assert (=> b!1215736 (= e!690285 (not e!690286))))

(declare-fun res!807223 () Bool)

(assert (=> b!1215736 (=> res!807223 e!690286)))

(assert (=> b!1215736 (= res!807223 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215736 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40308 0))(
  ( (Unit!40309) )
))
(declare-fun lt!552695 () Unit!40308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78495 (_ BitVec 64) (_ BitVec 32)) Unit!40308)

(assert (=> b!1215736 (= lt!552695 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215737 () Bool)

(declare-fun res!807224 () Bool)

(assert (=> b!1215737 (=> (not res!807224) (not e!690281))))

(assert (=> b!1215737 (= res!807224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215738 () Bool)

(declare-fun res!807227 () Bool)

(assert (=> b!1215738 (=> (not res!807227) (not e!690281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215738 (= res!807227 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48166 () Bool)

(declare-fun tp!91493 () Bool)

(assert (=> mapNonEmpty!48166 (= mapRes!48166 (and tp!91493 e!690282))))

(declare-fun mapRest!48166 () (Array (_ BitVec 32) ValueCell!14721))

(declare-fun mapValue!48166 () ValueCell!14721)

(declare-fun mapKey!48166 () (_ BitVec 32))

(assert (=> mapNonEmpty!48166 (= (arr!37883 _values!996) (store mapRest!48166 mapKey!48166 mapValue!48166))))

(declare-fun b!1215739 () Bool)

(declare-fun res!807230 () Bool)

(assert (=> b!1215739 (=> (not res!807230) (not e!690285))))

(assert (=> b!1215739 (= res!807230 (arrayNoDuplicates!0 lt!552696 #b00000000000000000000000000000000 Nil!26703))))

(declare-fun b!1215740 () Bool)

(declare-fun res!807225 () Bool)

(assert (=> b!1215740 (=> (not res!807225) (not e!690281))))

(assert (=> b!1215740 (= res!807225 (= (select (arr!37882 _keys!1208) i!673) k0!934))))

(declare-fun b!1215741 () Bool)

(assert (=> b!1215741 (= e!690286 true)))

(declare-fun zeroValue!944 () V!46275)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46275)

(declare-datatypes ((tuple2!19904 0))(
  ( (tuple2!19905 (_1!9963 (_ BitVec 64)) (_2!9963 V!46275)) )
))
(declare-datatypes ((List!26707 0))(
  ( (Nil!26704) (Cons!26703 (h!27912 tuple2!19904) (t!39844 List!26707)) )
))
(declare-datatypes ((ListLongMap!17873 0))(
  ( (ListLongMap!17874 (toList!8952 List!26707)) )
))
(declare-fun lt!552694 () ListLongMap!17873)

(declare-fun getCurrentListMapNoExtraKeys!5379 (array!78495 array!78497 (_ BitVec 32) (_ BitVec 32) V!46275 V!46275 (_ BitVec 32) Int) ListLongMap!17873)

(declare-fun dynLambda!3268 (Int (_ BitVec 64)) V!46275)

(assert (=> b!1215741 (= lt!552694 (getCurrentListMapNoExtraKeys!5379 lt!552696 (array!78498 (store (arr!37883 _values!996) i!673 (ValueCellFull!14721 (dynLambda!3268 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38419 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552693 () ListLongMap!17873)

(assert (=> b!1215741 (= lt!552693 (getCurrentListMapNoExtraKeys!5379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101234 res!807221) b!1215738))

(assert (= (and b!1215738 res!807227) b!1215730))

(assert (= (and b!1215730 res!807220) b!1215737))

(assert (= (and b!1215737 res!807224) b!1215728))

(assert (= (and b!1215728 res!807229) b!1215732))

(assert (= (and b!1215732 res!807226) b!1215735))

(assert (= (and b!1215735 res!807222) b!1215740))

(assert (= (and b!1215740 res!807225) b!1215731))

(assert (= (and b!1215731 res!807228) b!1215739))

(assert (= (and b!1215739 res!807230) b!1215736))

(assert (= (and b!1215736 (not res!807223)) b!1215741))

(assert (= (and b!1215734 condMapEmpty!48166) mapIsEmpty!48166))

(assert (= (and b!1215734 (not condMapEmpty!48166)) mapNonEmpty!48166))

(get-info :version)

(assert (= (and mapNonEmpty!48166 ((_ is ValueCellFull!14721) mapValue!48166)) b!1215733))

(assert (= (and b!1215734 ((_ is ValueCellFull!14721) mapDefault!48166)) b!1215729))

(assert (= start!101234 b!1215734))

(declare-fun b_lambda!21833 () Bool)

(assert (=> (not b_lambda!21833) (not b!1215741)))

(declare-fun t!39842 () Bool)

(declare-fun tb!10957 () Bool)

(assert (=> (and start!101234 (= defaultEntry!1004 defaultEntry!1004) t!39842) tb!10957))

(declare-fun result!22511 () Bool)

(assert (=> tb!10957 (= result!22511 tp_is_empty!30861)))

(assert (=> b!1215741 t!39842))

(declare-fun b_and!43433 () Bool)

(assert (= b_and!43431 (and (=> t!39842 result!22511) b_and!43433)))

(declare-fun m!1120633 () Bool)

(assert (=> b!1215735 m!1120633))

(declare-fun m!1120635 () Bool)

(assert (=> mapNonEmpty!48166 m!1120635))

(declare-fun m!1120637 () Bool)

(assert (=> b!1215738 m!1120637))

(declare-fun m!1120639 () Bool)

(assert (=> b!1215739 m!1120639))

(declare-fun m!1120641 () Bool)

(assert (=> start!101234 m!1120641))

(declare-fun m!1120643 () Bool)

(assert (=> start!101234 m!1120643))

(declare-fun m!1120645 () Bool)

(assert (=> b!1215736 m!1120645))

(declare-fun m!1120647 () Bool)

(assert (=> b!1215736 m!1120647))

(declare-fun m!1120649 () Bool)

(assert (=> b!1215741 m!1120649))

(declare-fun m!1120651 () Bool)

(assert (=> b!1215741 m!1120651))

(declare-fun m!1120653 () Bool)

(assert (=> b!1215741 m!1120653))

(declare-fun m!1120655 () Bool)

(assert (=> b!1215741 m!1120655))

(declare-fun m!1120657 () Bool)

(assert (=> b!1215737 m!1120657))

(declare-fun m!1120659 () Bool)

(assert (=> b!1215731 m!1120659))

(declare-fun m!1120661 () Bool)

(assert (=> b!1215731 m!1120661))

(declare-fun m!1120663 () Bool)

(assert (=> b!1215740 m!1120663))

(declare-fun m!1120665 () Bool)

(assert (=> b!1215728 m!1120665))

(check-sat (not b!1215739) (not b!1215737) (not b!1215735) (not b!1215731) (not b!1215741) (not b!1215736) (not b!1215738) (not b_next!26157) (not start!101234) (not b_lambda!21833) (not b!1215728) tp_is_empty!30861 (not mapNonEmpty!48166) b_and!43433)
(check-sat b_and!43433 (not b_next!26157))
