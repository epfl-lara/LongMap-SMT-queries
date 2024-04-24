; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101560 () Bool)

(assert start!101560)

(declare-fun b_free!26221 () Bool)

(declare-fun b_next!26221 () Bool)

(assert (=> start!101560 (= b_free!26221 (not b_next!26221))))

(declare-fun tp!91687 () Bool)

(declare-fun b_and!43579 () Bool)

(assert (=> start!101560 (= tp!91687 b_and!43579)))

(declare-fun b!1218661 () Bool)

(declare-fun e!691972 () Bool)

(declare-fun e!691979 () Bool)

(assert (=> b!1218661 (= e!691972 (not e!691979))))

(declare-fun res!808936 () Bool)

(assert (=> b!1218661 (=> res!808936 e!691979)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218661 (= res!808936 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78665 0))(
  ( (array!78666 (arr!37960 (Array (_ BitVec 32) (_ BitVec 64))) (size!38497 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78665)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218661 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40334 0))(
  ( (Unit!40335) )
))
(declare-fun lt!553795 () Unit!40334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78665 (_ BitVec 64) (_ BitVec 32)) Unit!40334)

(assert (=> b!1218661 (= lt!553795 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218662 () Bool)

(declare-fun res!808942 () Bool)

(assert (=> b!1218662 (=> (not res!808942) (not e!691972))))

(declare-fun lt!553788 () array!78665)

(declare-datatypes ((List!26778 0))(
  ( (Nil!26775) (Cons!26774 (h!27992 (_ BitVec 64)) (t!39971 List!26778)) )
))
(declare-fun arrayNoDuplicates!0 (array!78665 (_ BitVec 32) List!26778) Bool)

(assert (=> b!1218662 (= res!808942 (arrayNoDuplicates!0 lt!553788 #b00000000000000000000000000000000 Nil!26775))))

(declare-fun b!1218663 () Bool)

(declare-fun res!808941 () Bool)

(declare-fun e!691973 () Bool)

(assert (=> b!1218663 (=> (not res!808941) (not e!691973))))

(assert (=> b!1218663 (= res!808941 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26775))))

(declare-fun b!1218664 () Bool)

(declare-fun e!691978 () Bool)

(declare-fun tp_is_empty!30925 () Bool)

(assert (=> b!1218664 (= e!691978 tp_is_empty!30925)))

(declare-fun b!1218665 () Bool)

(declare-fun e!691971 () Bool)

(assert (=> b!1218665 (= e!691971 tp_is_empty!30925)))

(declare-fun mapIsEmpty!48265 () Bool)

(declare-fun mapRes!48265 () Bool)

(assert (=> mapIsEmpty!48265 mapRes!48265))

(declare-fun b!1218666 () Bool)

(declare-fun e!691975 () Bool)

(assert (=> b!1218666 (= e!691979 e!691975)))

(declare-fun res!808944 () Bool)

(assert (=> b!1218666 (=> res!808944 e!691975)))

(assert (=> b!1218666 (= res!808944 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46361 0))(
  ( (V!46362 (val!15519 Int)) )
))
(declare-datatypes ((tuple2!19970 0))(
  ( (tuple2!19971 (_1!9996 (_ BitVec 64)) (_2!9996 V!46361)) )
))
(declare-datatypes ((List!26779 0))(
  ( (Nil!26776) (Cons!26775 (h!27993 tuple2!19970) (t!39972 List!26779)) )
))
(declare-datatypes ((ListLongMap!17947 0))(
  ( (ListLongMap!17948 (toList!8989 List!26779)) )
))
(declare-fun lt!553789 () ListLongMap!17947)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14753 0))(
  ( (ValueCellFull!14753 (v!18169 V!46361)) (EmptyCell!14753) )
))
(declare-datatypes ((array!78667 0))(
  ( (array!78668 (arr!37961 (Array (_ BitVec 32) ValueCell!14753)) (size!38498 (_ BitVec 32))) )
))
(declare-fun lt!553792 () array!78667)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46361)

(declare-fun zeroValue!944 () V!46361)

(declare-fun getCurrentListMapNoExtraKeys!5446 (array!78665 array!78667 (_ BitVec 32) (_ BitVec 32) V!46361 V!46361 (_ BitVec 32) Int) ListLongMap!17947)

(assert (=> b!1218666 (= lt!553789 (getCurrentListMapNoExtraKeys!5446 lt!553788 lt!553792 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553791 () V!46361)

(declare-fun _values!996 () array!78667)

(assert (=> b!1218666 (= lt!553792 (array!78668 (store (arr!37961 _values!996) i!673 (ValueCellFull!14753 lt!553791)) (size!38498 _values!996)))))

(declare-fun dynLambda!3353 (Int (_ BitVec 64)) V!46361)

(assert (=> b!1218666 (= lt!553791 (dynLambda!3353 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553797 () ListLongMap!17947)

(assert (=> b!1218666 (= lt!553797 (getCurrentListMapNoExtraKeys!5446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48265 () Bool)

(declare-fun tp!91688 () Bool)

(assert (=> mapNonEmpty!48265 (= mapRes!48265 (and tp!91688 e!691978))))

(declare-fun mapRest!48265 () (Array (_ BitVec 32) ValueCell!14753))

(declare-fun mapKey!48265 () (_ BitVec 32))

(declare-fun mapValue!48265 () ValueCell!14753)

(assert (=> mapNonEmpty!48265 (= (arr!37961 _values!996) (store mapRest!48265 mapKey!48265 mapValue!48265))))

(declare-fun b!1218667 () Bool)

(declare-fun res!808940 () Bool)

(assert (=> b!1218667 (=> (not res!808940) (not e!691973))))

(assert (=> b!1218667 (= res!808940 (= (select (arr!37960 _keys!1208) i!673) k0!934))))

(declare-fun b!1218668 () Bool)

(declare-fun res!808945 () Bool)

(assert (=> b!1218668 (=> (not res!808945) (not e!691973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218668 (= res!808945 (validMask!0 mask!1564))))

(declare-fun b!1218669 () Bool)

(declare-fun e!691974 () Bool)

(assert (=> b!1218669 (= e!691974 (and e!691971 mapRes!48265))))

(declare-fun condMapEmpty!48265 () Bool)

(declare-fun mapDefault!48265 () ValueCell!14753)

(assert (=> b!1218669 (= condMapEmpty!48265 (= (arr!37961 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14753)) mapDefault!48265)))))

(declare-fun res!808946 () Bool)

(assert (=> start!101560 (=> (not res!808946) (not e!691973))))

(assert (=> start!101560 (= res!808946 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38497 _keys!1208))))))

(assert (=> start!101560 e!691973))

(assert (=> start!101560 tp_is_empty!30925))

(declare-fun array_inv!28962 (array!78665) Bool)

(assert (=> start!101560 (array_inv!28962 _keys!1208)))

(assert (=> start!101560 true))

(assert (=> start!101560 tp!91687))

(declare-fun array_inv!28963 (array!78667) Bool)

(assert (=> start!101560 (and (array_inv!28963 _values!996) e!691974)))

(declare-fun b!1218660 () Bool)

(declare-fun res!808937 () Bool)

(assert (=> b!1218660 (=> (not res!808937) (not e!691973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78665 (_ BitVec 32)) Bool)

(assert (=> b!1218660 (= res!808937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218670 () Bool)

(declare-fun e!691976 () Bool)

(assert (=> b!1218670 (= e!691976 (bvslt from!1455 (size!38497 _keys!1208)))))

(declare-fun lt!553790 () ListLongMap!17947)

(declare-fun +!4103 (ListLongMap!17947 tuple2!19970) ListLongMap!17947)

(declare-fun get!19383 (ValueCell!14753 V!46361) V!46361)

(assert (=> b!1218670 (= lt!553789 (+!4103 lt!553790 (tuple2!19971 (select (arr!37960 _keys!1208) from!1455) (get!19383 (select (arr!37961 _values!996) from!1455) lt!553791))))))

(declare-fun b!1218671 () Bool)

(declare-fun res!808938 () Bool)

(assert (=> b!1218671 (=> (not res!808938) (not e!691973))))

(assert (=> b!1218671 (= res!808938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38497 _keys!1208))))))

(declare-fun b!1218672 () Bool)

(assert (=> b!1218672 (= e!691973 e!691972)))

(declare-fun res!808939 () Bool)

(assert (=> b!1218672 (=> (not res!808939) (not e!691972))))

(assert (=> b!1218672 (= res!808939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553788 mask!1564))))

(assert (=> b!1218672 (= lt!553788 (array!78666 (store (arr!37960 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38497 _keys!1208)))))

(declare-fun b!1218673 () Bool)

(declare-fun res!808935 () Bool)

(assert (=> b!1218673 (=> (not res!808935) (not e!691973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218673 (= res!808935 (validKeyInArray!0 k0!934))))

(declare-fun b!1218674 () Bool)

(assert (=> b!1218674 (= e!691975 e!691976)))

(declare-fun res!808943 () Bool)

(assert (=> b!1218674 (=> res!808943 e!691976)))

(assert (=> b!1218674 (= res!808943 (not (validKeyInArray!0 (select (arr!37960 _keys!1208) from!1455))))))

(declare-fun lt!553794 () ListLongMap!17947)

(assert (=> b!1218674 (= lt!553794 lt!553790)))

(declare-fun lt!553793 () ListLongMap!17947)

(declare-fun -!1880 (ListLongMap!17947 (_ BitVec 64)) ListLongMap!17947)

(assert (=> b!1218674 (= lt!553790 (-!1880 lt!553793 k0!934))))

(assert (=> b!1218674 (= lt!553794 (getCurrentListMapNoExtraKeys!5446 lt!553788 lt!553792 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218674 (= lt!553793 (getCurrentListMapNoExtraKeys!5446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553796 () Unit!40334)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1095 (array!78665 array!78667 (_ BitVec 32) (_ BitVec 32) V!46361 V!46361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40334)

(assert (=> b!1218674 (= lt!553796 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218675 () Bool)

(declare-fun res!808947 () Bool)

(assert (=> b!1218675 (=> (not res!808947) (not e!691973))))

(assert (=> b!1218675 (= res!808947 (and (= (size!38498 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38497 _keys!1208) (size!38498 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101560 res!808946) b!1218668))

(assert (= (and b!1218668 res!808945) b!1218675))

(assert (= (and b!1218675 res!808947) b!1218660))

(assert (= (and b!1218660 res!808937) b!1218663))

(assert (= (and b!1218663 res!808941) b!1218671))

(assert (= (and b!1218671 res!808938) b!1218673))

(assert (= (and b!1218673 res!808935) b!1218667))

(assert (= (and b!1218667 res!808940) b!1218672))

(assert (= (and b!1218672 res!808939) b!1218662))

(assert (= (and b!1218662 res!808942) b!1218661))

(assert (= (and b!1218661 (not res!808936)) b!1218666))

(assert (= (and b!1218666 (not res!808944)) b!1218674))

(assert (= (and b!1218674 (not res!808943)) b!1218670))

(assert (= (and b!1218669 condMapEmpty!48265) mapIsEmpty!48265))

(assert (= (and b!1218669 (not condMapEmpty!48265)) mapNonEmpty!48265))

(get-info :version)

(assert (= (and mapNonEmpty!48265 ((_ is ValueCellFull!14753) mapValue!48265)) b!1218664))

(assert (= (and b!1218669 ((_ is ValueCellFull!14753) mapDefault!48265)) b!1218665))

(assert (= start!101560 b!1218669))

(declare-fun b_lambda!21929 () Bool)

(assert (=> (not b_lambda!21929) (not b!1218666)))

(declare-fun t!39970 () Bool)

(declare-fun tb!11013 () Bool)

(assert (=> (and start!101560 (= defaultEntry!1004 defaultEntry!1004) t!39970) tb!11013))

(declare-fun result!22633 () Bool)

(assert (=> tb!11013 (= result!22633 tp_is_empty!30925)))

(assert (=> b!1218666 t!39970))

(declare-fun b_and!43581 () Bool)

(assert (= b_and!43579 (and (=> t!39970 result!22633) b_and!43581)))

(declare-fun m!1123693 () Bool)

(assert (=> b!1218673 m!1123693))

(declare-fun m!1123695 () Bool)

(assert (=> b!1218660 m!1123695))

(declare-fun m!1123697 () Bool)

(assert (=> b!1218668 m!1123697))

(declare-fun m!1123699 () Bool)

(assert (=> b!1218662 m!1123699))

(declare-fun m!1123701 () Bool)

(assert (=> b!1218670 m!1123701))

(declare-fun m!1123703 () Bool)

(assert (=> b!1218670 m!1123703))

(assert (=> b!1218670 m!1123703))

(declare-fun m!1123705 () Bool)

(assert (=> b!1218670 m!1123705))

(declare-fun m!1123707 () Bool)

(assert (=> b!1218670 m!1123707))

(declare-fun m!1123709 () Bool)

(assert (=> b!1218667 m!1123709))

(declare-fun m!1123711 () Bool)

(assert (=> b!1218663 m!1123711))

(declare-fun m!1123713 () Bool)

(assert (=> b!1218672 m!1123713))

(declare-fun m!1123715 () Bool)

(assert (=> b!1218672 m!1123715))

(declare-fun m!1123717 () Bool)

(assert (=> b!1218674 m!1123717))

(declare-fun m!1123719 () Bool)

(assert (=> b!1218674 m!1123719))

(declare-fun m!1123721 () Bool)

(assert (=> b!1218674 m!1123721))

(declare-fun m!1123723 () Bool)

(assert (=> b!1218674 m!1123723))

(assert (=> b!1218674 m!1123701))

(declare-fun m!1123725 () Bool)

(assert (=> b!1218674 m!1123725))

(assert (=> b!1218674 m!1123701))

(declare-fun m!1123727 () Bool)

(assert (=> b!1218661 m!1123727))

(declare-fun m!1123729 () Bool)

(assert (=> b!1218661 m!1123729))

(declare-fun m!1123731 () Bool)

(assert (=> b!1218666 m!1123731))

(declare-fun m!1123733 () Bool)

(assert (=> b!1218666 m!1123733))

(declare-fun m!1123735 () Bool)

(assert (=> b!1218666 m!1123735))

(declare-fun m!1123737 () Bool)

(assert (=> b!1218666 m!1123737))

(declare-fun m!1123739 () Bool)

(assert (=> start!101560 m!1123739))

(declare-fun m!1123741 () Bool)

(assert (=> start!101560 m!1123741))

(declare-fun m!1123743 () Bool)

(assert (=> mapNonEmpty!48265 m!1123743))

(check-sat (not b!1218666) (not b!1218673) (not b!1218663) b_and!43581 (not b!1218670) (not b!1218660) (not b!1218672) (not b!1218662) (not mapNonEmpty!48265) (not b!1218668) (not b_lambda!21929) (not b!1218661) (not start!101560) (not b!1218674) (not b_next!26221) tp_is_empty!30925)
(check-sat b_and!43581 (not b_next!26221))
