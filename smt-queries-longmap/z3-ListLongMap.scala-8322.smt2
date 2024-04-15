; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101274 () Bool)

(assert start!101274)

(declare-fun b_free!26203 () Bool)

(declare-fun b_next!26203 () Bool)

(assert (=> start!101274 (= b_free!26203 (not b_next!26203))))

(declare-fun tp!91631 () Bool)

(declare-fun b_and!43505 () Bool)

(assert (=> start!101274 (= tp!91631 b_and!43505)))

(declare-fun b!1216671 () Bool)

(declare-fun res!807965 () Bool)

(declare-fun e!690735 () Bool)

(assert (=> b!1216671 (=> (not res!807965) (not e!690735))))

(declare-datatypes ((array!78506 0))(
  ( (array!78507 (arr!37888 (Array (_ BitVec 32) (_ BitVec 64))) (size!38426 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78506)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78506 (_ BitVec 32)) Bool)

(assert (=> b!1216671 (= res!807965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216672 () Bool)

(declare-fun e!690737 () Bool)

(declare-fun e!690736 () Bool)

(declare-fun mapRes!48235 () Bool)

(assert (=> b!1216672 (= e!690737 (and e!690736 mapRes!48235))))

(declare-fun condMapEmpty!48235 () Bool)

(declare-datatypes ((V!46337 0))(
  ( (V!46338 (val!15510 Int)) )
))
(declare-datatypes ((ValueCell!14744 0))(
  ( (ValueCellFull!14744 (v!18162 V!46337)) (EmptyCell!14744) )
))
(declare-datatypes ((array!78508 0))(
  ( (array!78509 (arr!37889 (Array (_ BitVec 32) ValueCell!14744)) (size!38427 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78508)

(declare-fun mapDefault!48235 () ValueCell!14744)

(assert (=> b!1216672 (= condMapEmpty!48235 (= (arr!37889 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14744)) mapDefault!48235)))))

(declare-fun b!1216673 () Bool)

(declare-fun e!690740 () Bool)

(declare-fun e!690739 () Bool)

(assert (=> b!1216673 (= e!690740 (not e!690739))))

(declare-fun res!807969 () Bool)

(assert (=> b!1216673 (=> res!807969 e!690739)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216673 (= res!807969 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216673 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40199 0))(
  ( (Unit!40200) )
))
(declare-fun lt!552847 () Unit!40199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78506 (_ BitVec 64) (_ BitVec 32)) Unit!40199)

(assert (=> b!1216673 (= lt!552847 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216675 () Bool)

(declare-fun res!807958 () Bool)

(assert (=> b!1216675 (=> (not res!807958) (not e!690735))))

(declare-datatypes ((List!26808 0))(
  ( (Nil!26805) (Cons!26804 (h!28013 (_ BitVec 64)) (t!39982 List!26808)) )
))
(declare-fun arrayNoDuplicates!0 (array!78506 (_ BitVec 32) List!26808) Bool)

(assert (=> b!1216675 (= res!807958 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26805))))

(declare-fun mapIsEmpty!48235 () Bool)

(assert (=> mapIsEmpty!48235 mapRes!48235))

(declare-fun mapNonEmpty!48235 () Bool)

(declare-fun tp!91630 () Bool)

(declare-fun e!690741 () Bool)

(assert (=> mapNonEmpty!48235 (= mapRes!48235 (and tp!91630 e!690741))))

(declare-fun mapValue!48235 () ValueCell!14744)

(declare-fun mapKey!48235 () (_ BitVec 32))

(declare-fun mapRest!48235 () (Array (_ BitVec 32) ValueCell!14744))

(assert (=> mapNonEmpty!48235 (= (arr!37889 _values!996) (store mapRest!48235 mapKey!48235 mapValue!48235))))

(declare-fun b!1216676 () Bool)

(declare-fun e!690734 () Bool)

(assert (=> b!1216676 (= e!690739 e!690734)))

(declare-fun res!807961 () Bool)

(assert (=> b!1216676 (=> res!807961 e!690734)))

(assert (=> b!1216676 (= res!807961 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!552846 () array!78508)

(declare-fun minValue!944 () V!46337)

(declare-fun lt!552850 () array!78506)

(declare-datatypes ((tuple2!20030 0))(
  ( (tuple2!20031 (_1!10026 (_ BitVec 64)) (_2!10026 V!46337)) )
))
(declare-datatypes ((List!26809 0))(
  ( (Nil!26806) (Cons!26805 (h!28014 tuple2!20030) (t!39983 List!26809)) )
))
(declare-datatypes ((ListLongMap!17999 0))(
  ( (ListLongMap!18000 (toList!9015 List!26809)) )
))
(declare-fun lt!552851 () ListLongMap!17999)

(declare-fun getCurrentListMapNoExtraKeys!5454 (array!78506 array!78508 (_ BitVec 32) (_ BitVec 32) V!46337 V!46337 (_ BitVec 32) Int) ListLongMap!17999)

(assert (=> b!1216676 (= lt!552851 (getCurrentListMapNoExtraKeys!5454 lt!552850 lt!552846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3305 (Int (_ BitVec 64)) V!46337)

(assert (=> b!1216676 (= lt!552846 (array!78509 (store (arr!37889 _values!996) i!673 (ValueCellFull!14744 (dynLambda!3305 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38427 _values!996)))))

(declare-fun lt!552849 () ListLongMap!17999)

(assert (=> b!1216676 (= lt!552849 (getCurrentListMapNoExtraKeys!5454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216677 () Bool)

(declare-fun res!807962 () Bool)

(assert (=> b!1216677 (=> (not res!807962) (not e!690735))))

(assert (=> b!1216677 (= res!807962 (and (= (size!38427 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38426 _keys!1208) (size!38427 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216678 () Bool)

(declare-fun res!807959 () Bool)

(assert (=> b!1216678 (=> (not res!807959) (not e!690740))))

(assert (=> b!1216678 (= res!807959 (arrayNoDuplicates!0 lt!552850 #b00000000000000000000000000000000 Nil!26805))))

(declare-fun b!1216679 () Bool)

(declare-fun res!807966 () Bool)

(assert (=> b!1216679 (=> (not res!807966) (not e!690735))))

(assert (=> b!1216679 (= res!807966 (= (select (arr!37888 _keys!1208) i!673) k0!934))))

(declare-fun b!1216680 () Bool)

(declare-fun e!690738 () Bool)

(assert (=> b!1216680 (= e!690734 e!690738)))

(declare-fun res!807960 () Bool)

(assert (=> b!1216680 (=> res!807960 e!690738)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216680 (= res!807960 (not (validKeyInArray!0 (select (arr!37888 _keys!1208) from!1455))))))

(declare-fun -!1853 (ListLongMap!17999 (_ BitVec 64)) ListLongMap!17999)

(assert (=> b!1216680 (= (getCurrentListMapNoExtraKeys!5454 lt!552850 lt!552846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1853 (getCurrentListMapNoExtraKeys!5454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!552848 () Unit!40199)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1088 (array!78506 array!78508 (_ BitVec 32) (_ BitVec 32) V!46337 V!46337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40199)

(assert (=> b!1216680 (= lt!552848 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1088 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216681 () Bool)

(declare-fun tp_is_empty!30907 () Bool)

(assert (=> b!1216681 (= e!690741 tp_is_empty!30907)))

(declare-fun b!1216682 () Bool)

(assert (=> b!1216682 (= e!690738 (bvslt from!1455 (size!38426 _keys!1208)))))

(declare-fun b!1216674 () Bool)

(declare-fun res!807964 () Bool)

(assert (=> b!1216674 (=> (not res!807964) (not e!690735))))

(assert (=> b!1216674 (= res!807964 (validKeyInArray!0 k0!934))))

(declare-fun res!807963 () Bool)

(assert (=> start!101274 (=> (not res!807963) (not e!690735))))

(assert (=> start!101274 (= res!807963 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38426 _keys!1208))))))

(assert (=> start!101274 e!690735))

(assert (=> start!101274 tp_is_empty!30907))

(declare-fun array_inv!28962 (array!78506) Bool)

(assert (=> start!101274 (array_inv!28962 _keys!1208)))

(assert (=> start!101274 true))

(assert (=> start!101274 tp!91631))

(declare-fun array_inv!28963 (array!78508) Bool)

(assert (=> start!101274 (and (array_inv!28963 _values!996) e!690737)))

(declare-fun b!1216683 () Bool)

(assert (=> b!1216683 (= e!690735 e!690740)))

(declare-fun res!807968 () Bool)

(assert (=> b!1216683 (=> (not res!807968) (not e!690740))))

(assert (=> b!1216683 (= res!807968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552850 mask!1564))))

(assert (=> b!1216683 (= lt!552850 (array!78507 (store (arr!37888 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38426 _keys!1208)))))

(declare-fun b!1216684 () Bool)

(declare-fun res!807967 () Bool)

(assert (=> b!1216684 (=> (not res!807967) (not e!690735))))

(assert (=> b!1216684 (= res!807967 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38426 _keys!1208))))))

(declare-fun b!1216685 () Bool)

(declare-fun res!807970 () Bool)

(assert (=> b!1216685 (=> (not res!807970) (not e!690735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216685 (= res!807970 (validMask!0 mask!1564))))

(declare-fun b!1216686 () Bool)

(assert (=> b!1216686 (= e!690736 tp_is_empty!30907)))

(assert (= (and start!101274 res!807963) b!1216685))

(assert (= (and b!1216685 res!807970) b!1216677))

(assert (= (and b!1216677 res!807962) b!1216671))

(assert (= (and b!1216671 res!807965) b!1216675))

(assert (= (and b!1216675 res!807958) b!1216684))

(assert (= (and b!1216684 res!807967) b!1216674))

(assert (= (and b!1216674 res!807964) b!1216679))

(assert (= (and b!1216679 res!807966) b!1216683))

(assert (= (and b!1216683 res!807968) b!1216678))

(assert (= (and b!1216678 res!807959) b!1216673))

(assert (= (and b!1216673 (not res!807969)) b!1216676))

(assert (= (and b!1216676 (not res!807961)) b!1216680))

(assert (= (and b!1216680 (not res!807960)) b!1216682))

(assert (= (and b!1216672 condMapEmpty!48235) mapIsEmpty!48235))

(assert (= (and b!1216672 (not condMapEmpty!48235)) mapNonEmpty!48235))

(get-info :version)

(assert (= (and mapNonEmpty!48235 ((_ is ValueCellFull!14744) mapValue!48235)) b!1216681))

(assert (= (and b!1216672 ((_ is ValueCellFull!14744) mapDefault!48235)) b!1216686))

(assert (= start!101274 b!1216672))

(declare-fun b_lambda!21869 () Bool)

(assert (=> (not b_lambda!21869) (not b!1216676)))

(declare-fun t!39981 () Bool)

(declare-fun tb!10995 () Bool)

(assert (=> (and start!101274 (= defaultEntry!1004 defaultEntry!1004) t!39981) tb!10995))

(declare-fun result!22595 () Bool)

(assert (=> tb!10995 (= result!22595 tp_is_empty!30907)))

(assert (=> b!1216676 t!39981))

(declare-fun b_and!43507 () Bool)

(assert (= b_and!43505 (and (=> t!39981 result!22595) b_and!43507)))

(declare-fun m!1120935 () Bool)

(assert (=> b!1216676 m!1120935))

(declare-fun m!1120937 () Bool)

(assert (=> b!1216676 m!1120937))

(declare-fun m!1120939 () Bool)

(assert (=> b!1216676 m!1120939))

(declare-fun m!1120941 () Bool)

(assert (=> b!1216676 m!1120941))

(declare-fun m!1120943 () Bool)

(assert (=> start!101274 m!1120943))

(declare-fun m!1120945 () Bool)

(assert (=> start!101274 m!1120945))

(declare-fun m!1120947 () Bool)

(assert (=> b!1216678 m!1120947))

(declare-fun m!1120949 () Bool)

(assert (=> b!1216680 m!1120949))

(assert (=> b!1216680 m!1120949))

(declare-fun m!1120951 () Bool)

(assert (=> b!1216680 m!1120951))

(declare-fun m!1120953 () Bool)

(assert (=> b!1216680 m!1120953))

(declare-fun m!1120955 () Bool)

(assert (=> b!1216680 m!1120955))

(assert (=> b!1216680 m!1120953))

(declare-fun m!1120957 () Bool)

(assert (=> b!1216680 m!1120957))

(declare-fun m!1120959 () Bool)

(assert (=> b!1216680 m!1120959))

(declare-fun m!1120961 () Bool)

(assert (=> b!1216683 m!1120961))

(declare-fun m!1120963 () Bool)

(assert (=> b!1216683 m!1120963))

(declare-fun m!1120965 () Bool)

(assert (=> b!1216673 m!1120965))

(declare-fun m!1120967 () Bool)

(assert (=> b!1216673 m!1120967))

(declare-fun m!1120969 () Bool)

(assert (=> b!1216671 m!1120969))

(declare-fun m!1120971 () Bool)

(assert (=> b!1216675 m!1120971))

(declare-fun m!1120973 () Bool)

(assert (=> b!1216685 m!1120973))

(declare-fun m!1120975 () Bool)

(assert (=> b!1216679 m!1120975))

(declare-fun m!1120977 () Bool)

(assert (=> b!1216674 m!1120977))

(declare-fun m!1120979 () Bool)

(assert (=> mapNonEmpty!48235 m!1120979))

(check-sat (not b!1216678) (not b_lambda!21869) (not b!1216673) (not b!1216683) (not b!1216675) (not mapNonEmpty!48235) b_and!43507 (not b!1216685) tp_is_empty!30907 (not b!1216676) (not b!1216674) (not b!1216671) (not b_next!26203) (not start!101274) (not b!1216680))
(check-sat b_and!43507 (not b_next!26203))
