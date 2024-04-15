; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101412 () Bool)

(assert start!101412)

(declare-fun b_free!26263 () Bool)

(declare-fun b_next!26263 () Bool)

(assert (=> start!101412 (= b_free!26263 (not b_next!26263))))

(declare-fun tp!91819 () Bool)

(declare-fun b_and!43679 () Bool)

(assert (=> start!101412 (= tp!91819 b_and!43679)))

(declare-fun mapNonEmpty!48334 () Bool)

(declare-fun mapRes!48334 () Bool)

(declare-fun tp!91820 () Bool)

(declare-fun e!691941 () Bool)

(assert (=> mapNonEmpty!48334 (= mapRes!48334 (and tp!91820 e!691941))))

(declare-datatypes ((V!46417 0))(
  ( (V!46418 (val!15540 Int)) )
))
(declare-datatypes ((ValueCell!14774 0))(
  ( (ValueCellFull!14774 (v!18195 V!46417)) (EmptyCell!14774) )
))
(declare-fun mapValue!48334 () ValueCell!14774)

(declare-fun mapRest!48334 () (Array (_ BitVec 32) ValueCell!14774))

(declare-fun mapKey!48334 () (_ BitVec 32))

(declare-datatypes ((array!78630 0))(
  ( (array!78631 (arr!37947 (Array (_ BitVec 32) ValueCell!14774)) (size!38485 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78630)

(assert (=> mapNonEmpty!48334 (= (arr!37947 _values!996) (store mapRest!48334 mapKey!48334 mapValue!48334))))

(declare-fun b!1218707 () Bool)

(declare-fun res!809424 () Bool)

(declare-fun e!691940 () Bool)

(assert (=> b!1218707 (=> (not res!809424) (not e!691940))))

(declare-datatypes ((array!78632 0))(
  ( (array!78633 (arr!37948 (Array (_ BitVec 32) (_ BitVec 64))) (size!38486 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78632)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1218707 (= res!809424 (= (select (arr!37948 _keys!1208) i!673) k0!934))))

(declare-fun b!1218708 () Bool)

(declare-fun tp_is_empty!30967 () Bool)

(assert (=> b!1218708 (= e!691941 tp_is_empty!30967)))

(declare-fun b!1218709 () Bool)

(declare-fun e!691943 () Bool)

(declare-fun e!691939 () Bool)

(assert (=> b!1218709 (= e!691943 (not e!691939))))

(declare-fun res!809420 () Bool)

(assert (=> b!1218709 (=> res!809420 e!691939)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218709 (= res!809420 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218709 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40247 0))(
  ( (Unit!40248) )
))
(declare-fun lt!553911 () Unit!40247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78632 (_ BitVec 64) (_ BitVec 32)) Unit!40247)

(assert (=> b!1218709 (= lt!553911 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218710 () Bool)

(declare-fun e!691938 () Bool)

(declare-fun e!691942 () Bool)

(assert (=> b!1218710 (= e!691938 e!691942)))

(declare-fun res!809421 () Bool)

(assert (=> b!1218710 (=> res!809421 e!691942)))

(assert (=> b!1218710 (= res!809421 (not (= (select (arr!37948 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218711 () Bool)

(assert (=> b!1218711 (= e!691942 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218712 () Bool)

(declare-fun res!809426 () Bool)

(assert (=> b!1218712 (=> (not res!809426) (not e!691940))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78632 (_ BitVec 32)) Bool)

(assert (=> b!1218712 (= res!809426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218713 () Bool)

(declare-fun res!809419 () Bool)

(assert (=> b!1218713 (=> (not res!809419) (not e!691940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218713 (= res!809419 (validMask!0 mask!1564))))

(declare-fun b!1218714 () Bool)

(declare-fun e!691937 () Bool)

(declare-fun e!691933 () Bool)

(assert (=> b!1218714 (= e!691937 (and e!691933 mapRes!48334))))

(declare-fun condMapEmpty!48334 () Bool)

(declare-fun mapDefault!48334 () ValueCell!14774)

(assert (=> b!1218714 (= condMapEmpty!48334 (= (arr!37947 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14774)) mapDefault!48334)))))

(declare-fun b!1218715 () Bool)

(declare-fun e!691934 () Bool)

(assert (=> b!1218715 (= e!691939 e!691934)))

(declare-fun res!809425 () Bool)

(assert (=> b!1218715 (=> res!809425 e!691934)))

(assert (=> b!1218715 (= res!809425 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46417)

(declare-datatypes ((tuple2!20074 0))(
  ( (tuple2!20075 (_1!10048 (_ BitVec 64)) (_2!10048 V!46417)) )
))
(declare-datatypes ((List!26854 0))(
  ( (Nil!26851) (Cons!26850 (h!28059 tuple2!20074) (t!40088 List!26854)) )
))
(declare-datatypes ((ListLongMap!18043 0))(
  ( (ListLongMap!18044 (toList!9037 List!26854)) )
))
(declare-fun lt!553915 () ListLongMap!18043)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!553908 () array!78632)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553916 () array!78630)

(declare-fun minValue!944 () V!46417)

(declare-fun getCurrentListMapNoExtraKeys!5475 (array!78632 array!78630 (_ BitVec 32) (_ BitVec 32) V!46417 V!46417 (_ BitVec 32) Int) ListLongMap!18043)

(assert (=> b!1218715 (= lt!553915 (getCurrentListMapNoExtraKeys!5475 lt!553908 lt!553916 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553910 () V!46417)

(assert (=> b!1218715 (= lt!553916 (array!78631 (store (arr!37947 _values!996) i!673 (ValueCellFull!14774 lt!553910)) (size!38485 _values!996)))))

(declare-fun dynLambda!3326 (Int (_ BitVec 64)) V!46417)

(assert (=> b!1218715 (= lt!553910 (dynLambda!3326 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553912 () ListLongMap!18043)

(assert (=> b!1218715 (= lt!553912 (getCurrentListMapNoExtraKeys!5475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218716 () Bool)

(declare-fun res!809422 () Bool)

(assert (=> b!1218716 (=> (not res!809422) (not e!691940))))

(declare-datatypes ((List!26855 0))(
  ( (Nil!26852) (Cons!26851 (h!28060 (_ BitVec 64)) (t!40089 List!26855)) )
))
(declare-fun arrayNoDuplicates!0 (array!78632 (_ BitVec 32) List!26855) Bool)

(assert (=> b!1218716 (= res!809422 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26852))))

(declare-fun b!1218717 () Bool)

(declare-fun res!809412 () Bool)

(assert (=> b!1218717 (=> (not res!809412) (not e!691940))))

(assert (=> b!1218717 (= res!809412 (and (= (size!38485 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38486 _keys!1208) (size!38485 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!809414 () Bool)

(assert (=> start!101412 (=> (not res!809414) (not e!691940))))

(assert (=> start!101412 (= res!809414 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38486 _keys!1208))))))

(assert (=> start!101412 e!691940))

(assert (=> start!101412 tp_is_empty!30967))

(declare-fun array_inv!29002 (array!78632) Bool)

(assert (=> start!101412 (array_inv!29002 _keys!1208)))

(assert (=> start!101412 true))

(assert (=> start!101412 tp!91819))

(declare-fun array_inv!29003 (array!78630) Bool)

(assert (=> start!101412 (and (array_inv!29003 _values!996) e!691937)))

(declare-fun b!1218718 () Bool)

(assert (=> b!1218718 (= e!691940 e!691943)))

(declare-fun res!809418 () Bool)

(assert (=> b!1218718 (=> (not res!809418) (not e!691943))))

(assert (=> b!1218718 (= res!809418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553908 mask!1564))))

(assert (=> b!1218718 (= lt!553908 (array!78633 (store (arr!37948 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38486 _keys!1208)))))

(declare-fun b!1218719 () Bool)

(declare-fun e!691936 () Bool)

(assert (=> b!1218719 (= e!691936 true)))

(assert (=> b!1218719 e!691938))

(declare-fun res!809416 () Bool)

(assert (=> b!1218719 (=> (not res!809416) (not e!691938))))

(declare-fun lt!553914 () ListLongMap!18043)

(declare-fun +!4105 (ListLongMap!18043 tuple2!20074) ListLongMap!18043)

(declare-fun get!19358 (ValueCell!14774 V!46417) V!46417)

(assert (=> b!1218719 (= res!809416 (= lt!553915 (+!4105 lt!553914 (tuple2!20075 (select (arr!37948 _keys!1208) from!1455) (get!19358 (select (arr!37947 _values!996) from!1455) lt!553910)))))))

(declare-fun mapIsEmpty!48334 () Bool)

(assert (=> mapIsEmpty!48334 mapRes!48334))

(declare-fun b!1218720 () Bool)

(assert (=> b!1218720 (= e!691934 e!691936)))

(declare-fun res!809415 () Bool)

(assert (=> b!1218720 (=> res!809415 e!691936)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218720 (= res!809415 (not (validKeyInArray!0 (select (arr!37948 _keys!1208) from!1455))))))

(declare-fun lt!553907 () ListLongMap!18043)

(assert (=> b!1218720 (= lt!553907 lt!553914)))

(declare-fun lt!553913 () ListLongMap!18043)

(declare-fun -!1869 (ListLongMap!18043 (_ BitVec 64)) ListLongMap!18043)

(assert (=> b!1218720 (= lt!553914 (-!1869 lt!553913 k0!934))))

(assert (=> b!1218720 (= lt!553907 (getCurrentListMapNoExtraKeys!5475 lt!553908 lt!553916 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218720 (= lt!553913 (getCurrentListMapNoExtraKeys!5475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553909 () Unit!40247)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1104 (array!78632 array!78630 (_ BitVec 32) (_ BitVec 32) V!46417 V!46417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40247)

(assert (=> b!1218720 (= lt!553909 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1104 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218721 () Bool)

(assert (=> b!1218721 (= e!691933 tp_is_empty!30967)))

(declare-fun b!1218722 () Bool)

(declare-fun res!809417 () Bool)

(assert (=> b!1218722 (=> (not res!809417) (not e!691940))))

(assert (=> b!1218722 (= res!809417 (validKeyInArray!0 k0!934))))

(declare-fun b!1218723 () Bool)

(declare-fun res!809423 () Bool)

(assert (=> b!1218723 (=> (not res!809423) (not e!691940))))

(assert (=> b!1218723 (= res!809423 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38486 _keys!1208))))))

(declare-fun b!1218724 () Bool)

(declare-fun res!809413 () Bool)

(assert (=> b!1218724 (=> (not res!809413) (not e!691943))))

(assert (=> b!1218724 (= res!809413 (arrayNoDuplicates!0 lt!553908 #b00000000000000000000000000000000 Nil!26852))))

(assert (= (and start!101412 res!809414) b!1218713))

(assert (= (and b!1218713 res!809419) b!1218717))

(assert (= (and b!1218717 res!809412) b!1218712))

(assert (= (and b!1218712 res!809426) b!1218716))

(assert (= (and b!1218716 res!809422) b!1218723))

(assert (= (and b!1218723 res!809423) b!1218722))

(assert (= (and b!1218722 res!809417) b!1218707))

(assert (= (and b!1218707 res!809424) b!1218718))

(assert (= (and b!1218718 res!809418) b!1218724))

(assert (= (and b!1218724 res!809413) b!1218709))

(assert (= (and b!1218709 (not res!809420)) b!1218715))

(assert (= (and b!1218715 (not res!809425)) b!1218720))

(assert (= (and b!1218720 (not res!809415)) b!1218719))

(assert (= (and b!1218719 res!809416) b!1218710))

(assert (= (and b!1218710 (not res!809421)) b!1218711))

(assert (= (and b!1218714 condMapEmpty!48334) mapIsEmpty!48334))

(assert (= (and b!1218714 (not condMapEmpty!48334)) mapNonEmpty!48334))

(get-info :version)

(assert (= (and mapNonEmpty!48334 ((_ is ValueCellFull!14774) mapValue!48334)) b!1218708))

(assert (= (and b!1218714 ((_ is ValueCellFull!14774) mapDefault!48334)) b!1218721))

(assert (= start!101412 b!1218714))

(declare-fun b_lambda!22043 () Bool)

(assert (=> (not b_lambda!22043) (not b!1218715)))

(declare-fun t!40087 () Bool)

(declare-fun tb!11055 () Bool)

(assert (=> (and start!101412 (= defaultEntry!1004 defaultEntry!1004) t!40087) tb!11055))

(declare-fun result!22721 () Bool)

(assert (=> tb!11055 (= result!22721 tp_is_empty!30967)))

(assert (=> b!1218715 t!40087))

(declare-fun b_and!43681 () Bool)

(assert (= b_and!43679 (and (=> t!40087 result!22721) b_and!43681)))

(declare-fun m!1123015 () Bool)

(assert (=> mapNonEmpty!48334 m!1123015))

(declare-fun m!1123017 () Bool)

(assert (=> b!1218707 m!1123017))

(declare-fun m!1123019 () Bool)

(assert (=> b!1218711 m!1123019))

(declare-fun m!1123021 () Bool)

(assert (=> b!1218710 m!1123021))

(declare-fun m!1123023 () Bool)

(assert (=> b!1218716 m!1123023))

(declare-fun m!1123025 () Bool)

(assert (=> b!1218724 m!1123025))

(declare-fun m!1123027 () Bool)

(assert (=> b!1218715 m!1123027))

(declare-fun m!1123029 () Bool)

(assert (=> b!1218715 m!1123029))

(declare-fun m!1123031 () Bool)

(assert (=> b!1218715 m!1123031))

(declare-fun m!1123033 () Bool)

(assert (=> b!1218715 m!1123033))

(declare-fun m!1123035 () Bool)

(assert (=> b!1218720 m!1123035))

(declare-fun m!1123037 () Bool)

(assert (=> b!1218720 m!1123037))

(assert (=> b!1218720 m!1123021))

(declare-fun m!1123039 () Bool)

(assert (=> b!1218720 m!1123039))

(declare-fun m!1123041 () Bool)

(assert (=> b!1218720 m!1123041))

(declare-fun m!1123043 () Bool)

(assert (=> b!1218720 m!1123043))

(assert (=> b!1218720 m!1123021))

(assert (=> b!1218719 m!1123021))

(declare-fun m!1123045 () Bool)

(assert (=> b!1218719 m!1123045))

(assert (=> b!1218719 m!1123045))

(declare-fun m!1123047 () Bool)

(assert (=> b!1218719 m!1123047))

(declare-fun m!1123049 () Bool)

(assert (=> b!1218719 m!1123049))

(declare-fun m!1123051 () Bool)

(assert (=> b!1218712 m!1123051))

(declare-fun m!1123053 () Bool)

(assert (=> b!1218709 m!1123053))

(declare-fun m!1123055 () Bool)

(assert (=> b!1218709 m!1123055))

(declare-fun m!1123057 () Bool)

(assert (=> b!1218722 m!1123057))

(declare-fun m!1123059 () Bool)

(assert (=> start!101412 m!1123059))

(declare-fun m!1123061 () Bool)

(assert (=> start!101412 m!1123061))

(declare-fun m!1123063 () Bool)

(assert (=> b!1218713 m!1123063))

(declare-fun m!1123065 () Bool)

(assert (=> b!1218718 m!1123065))

(declare-fun m!1123067 () Bool)

(assert (=> b!1218718 m!1123067))

(check-sat (not b!1218718) (not start!101412) (not b!1218722) (not b!1218719) (not b_next!26263) (not b!1218713) b_and!43681 (not b!1218716) tp_is_empty!30967 (not b!1218724) (not mapNonEmpty!48334) (not b!1218720) (not b_lambda!22043) (not b!1218709) (not b!1218711) (not b!1218715) (not b!1218712))
(check-sat b_and!43681 (not b_next!26263))
