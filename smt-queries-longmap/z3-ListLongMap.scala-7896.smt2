; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98356 () Bool)

(assert start!98356)

(declare-fun b_free!23821 () Bool)

(declare-fun b_next!23821 () Bool)

(assert (=> start!98356 (= b_free!23821 (not b_next!23821))))

(declare-fun tp!84167 () Bool)

(declare-fun b_and!38435 () Bool)

(assert (=> start!98356 (= tp!84167 b_and!38435)))

(declare-fun b!1128914 () Bool)

(declare-fun e!642636 () Bool)

(declare-fun tp_is_empty!28351 () Bool)

(assert (=> b!1128914 (= e!642636 tp_is_empty!28351)))

(declare-fun res!754054 () Bool)

(declare-fun e!642634 () Bool)

(assert (=> start!98356 (=> (not res!754054) (not e!642634))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73607 0))(
  ( (array!73608 (arr!35450 (Array (_ BitVec 32) (_ BitVec 64))) (size!35987 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73607)

(assert (=> start!98356 (= res!754054 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35987 _keys!1208))))))

(assert (=> start!98356 e!642634))

(assert (=> start!98356 tp_is_empty!28351))

(declare-fun array_inv!27258 (array!73607) Bool)

(assert (=> start!98356 (array_inv!27258 _keys!1208)))

(assert (=> start!98356 true))

(assert (=> start!98356 tp!84167))

(declare-datatypes ((V!42929 0))(
  ( (V!42930 (val!14232 Int)) )
))
(declare-datatypes ((ValueCell!13466 0))(
  ( (ValueCellFull!13466 (v!16861 V!42929)) (EmptyCell!13466) )
))
(declare-datatypes ((array!73609 0))(
  ( (array!73610 (arr!35451 (Array (_ BitVec 32) ValueCell!13466)) (size!35988 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73609)

(declare-fun e!642635 () Bool)

(declare-fun array_inv!27259 (array!73609) Bool)

(assert (=> start!98356 (and (array_inv!27259 _values!996) e!642635)))

(declare-fun b!1128915 () Bool)

(declare-fun res!754052 () Bool)

(assert (=> b!1128915 (=> (not res!754052) (not e!642634))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73607 (_ BitVec 32)) Bool)

(assert (=> b!1128915 (= res!754052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128916 () Bool)

(declare-fun mapRes!44344 () Bool)

(assert (=> b!1128916 (= e!642635 (and e!642636 mapRes!44344))))

(declare-fun condMapEmpty!44344 () Bool)

(declare-fun mapDefault!44344 () ValueCell!13466)

(assert (=> b!1128916 (= condMapEmpty!44344 (= (arr!35451 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13466)) mapDefault!44344)))))

(declare-fun b!1128917 () Bool)

(declare-fun res!754042 () Bool)

(declare-fun e!642637 () Bool)

(assert (=> b!1128917 (=> (not res!754042) (not e!642637))))

(declare-fun lt!501162 () array!73607)

(declare-datatypes ((List!24703 0))(
  ( (Nil!24700) (Cons!24699 (h!25917 (_ BitVec 64)) (t!35508 List!24703)) )
))
(declare-fun arrayNoDuplicates!0 (array!73607 (_ BitVec 32) List!24703) Bool)

(assert (=> b!1128917 (= res!754042 (arrayNoDuplicates!0 lt!501162 #b00000000000000000000000000000000 Nil!24700))))

(declare-fun mapNonEmpty!44344 () Bool)

(declare-fun tp!84166 () Bool)

(declare-fun e!642633 () Bool)

(assert (=> mapNonEmpty!44344 (= mapRes!44344 (and tp!84166 e!642633))))

(declare-fun mapKey!44344 () (_ BitVec 32))

(declare-fun mapRest!44344 () (Array (_ BitVec 32) ValueCell!13466))

(declare-fun mapValue!44344 () ValueCell!13466)

(assert (=> mapNonEmpty!44344 (= (arr!35451 _values!996) (store mapRest!44344 mapKey!44344 mapValue!44344))))

(declare-fun b!1128918 () Bool)

(declare-fun e!642640 () Bool)

(declare-fun e!642641 () Bool)

(assert (=> b!1128918 (= e!642640 e!642641)))

(declare-fun res!754053 () Bool)

(assert (=> b!1128918 (=> res!754053 e!642641)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128918 (= res!754053 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!501161 () array!73609)

(declare-fun minValue!944 () V!42929)

(declare-datatypes ((tuple2!17920 0))(
  ( (tuple2!17921 (_1!8971 (_ BitVec 64)) (_2!8971 V!42929)) )
))
(declare-datatypes ((List!24704 0))(
  ( (Nil!24701) (Cons!24700 (h!25918 tuple2!17920) (t!35509 List!24704)) )
))
(declare-datatypes ((ListLongMap!15897 0))(
  ( (ListLongMap!15898 (toList!7964 List!24704)) )
))
(declare-fun lt!501163 () ListLongMap!15897)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4484 (array!73607 array!73609 (_ BitVec 32) (_ BitVec 32) V!42929 V!42929 (_ BitVec 32) Int) ListLongMap!15897)

(assert (=> b!1128918 (= lt!501163 (getCurrentListMapNoExtraKeys!4484 lt!501162 lt!501161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2553 (Int (_ BitVec 64)) V!42929)

(assert (=> b!1128918 (= lt!501161 (array!73610 (store (arr!35451 _values!996) i!673 (ValueCellFull!13466 (dynLambda!2553 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35988 _values!996)))))

(declare-fun lt!501159 () ListLongMap!15897)

(assert (=> b!1128918 (= lt!501159 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128919 () Bool)

(declare-fun res!754049 () Bool)

(assert (=> b!1128919 (=> (not res!754049) (not e!642634))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128919 (= res!754049 (validKeyInArray!0 k0!934))))

(declare-fun b!1128920 () Bool)

(declare-fun res!754051 () Bool)

(assert (=> b!1128920 (=> (not res!754051) (not e!642634))))

(assert (=> b!1128920 (= res!754051 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24700))))

(declare-fun mapIsEmpty!44344 () Bool)

(assert (=> mapIsEmpty!44344 mapRes!44344))

(declare-fun b!1128921 () Bool)

(assert (=> b!1128921 (= e!642633 tp_is_empty!28351)))

(declare-fun b!1128922 () Bool)

(declare-fun e!642639 () Bool)

(declare-fun call!47813 () ListLongMap!15897)

(declare-fun call!47812 () ListLongMap!15897)

(declare-fun -!1138 (ListLongMap!15897 (_ BitVec 64)) ListLongMap!15897)

(assert (=> b!1128922 (= e!642639 (= call!47813 (-!1138 call!47812 k0!934)))))

(declare-fun b!1128923 () Bool)

(declare-fun e!642638 () Bool)

(assert (=> b!1128923 (= e!642641 e!642638)))

(declare-fun res!754045 () Bool)

(assert (=> b!1128923 (=> res!754045 e!642638)))

(assert (=> b!1128923 (= res!754045 (not (= (select (arr!35450 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128923 e!642639))

(declare-fun c!110132 () Bool)

(assert (=> b!1128923 (= c!110132 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36935 0))(
  ( (Unit!36936) )
))
(declare-fun lt!501160 () Unit!36935)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!399 (array!73607 array!73609 (_ BitVec 32) (_ BitVec 32) V!42929 V!42929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36935)

(assert (=> b!1128923 (= lt!501160 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128924 () Bool)

(assert (=> b!1128924 (= e!642634 e!642637)))

(declare-fun res!754044 () Bool)

(assert (=> b!1128924 (=> (not res!754044) (not e!642637))))

(assert (=> b!1128924 (= res!754044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501162 mask!1564))))

(assert (=> b!1128924 (= lt!501162 (array!73608 (store (arr!35450 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35987 _keys!1208)))))

(declare-fun b!1128925 () Bool)

(assert (=> b!1128925 (= e!642638 true)))

(declare-fun lt!501157 () Bool)

(declare-fun contains!6506 (ListLongMap!15897 (_ BitVec 64)) Bool)

(assert (=> b!1128925 (= lt!501157 (contains!6506 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128926 () Bool)

(declare-fun res!754048 () Bool)

(assert (=> b!1128926 (=> (not res!754048) (not e!642634))))

(assert (=> b!1128926 (= res!754048 (and (= (size!35988 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35987 _keys!1208) (size!35988 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47809 () Bool)

(assert (=> bm!47809 (= call!47813 (getCurrentListMapNoExtraKeys!4484 lt!501162 lt!501161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128927 () Bool)

(declare-fun res!754043 () Bool)

(assert (=> b!1128927 (=> (not res!754043) (not e!642634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128927 (= res!754043 (validMask!0 mask!1564))))

(declare-fun b!1128928 () Bool)

(declare-fun res!754047 () Bool)

(assert (=> b!1128928 (=> (not res!754047) (not e!642634))))

(assert (=> b!1128928 (= res!754047 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35987 _keys!1208))))))

(declare-fun b!1128929 () Bool)

(assert (=> b!1128929 (= e!642639 (= call!47813 call!47812))))

(declare-fun bm!47810 () Bool)

(assert (=> bm!47810 (= call!47812 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128930 () Bool)

(declare-fun res!754046 () Bool)

(assert (=> b!1128930 (=> (not res!754046) (not e!642634))))

(assert (=> b!1128930 (= res!754046 (= (select (arr!35450 _keys!1208) i!673) k0!934))))

(declare-fun b!1128931 () Bool)

(assert (=> b!1128931 (= e!642637 (not e!642640))))

(declare-fun res!754050 () Bool)

(assert (=> b!1128931 (=> res!754050 e!642640)))

(assert (=> b!1128931 (= res!754050 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128931 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501158 () Unit!36935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73607 (_ BitVec 64) (_ BitVec 32)) Unit!36935)

(assert (=> b!1128931 (= lt!501158 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98356 res!754054) b!1128927))

(assert (= (and b!1128927 res!754043) b!1128926))

(assert (= (and b!1128926 res!754048) b!1128915))

(assert (= (and b!1128915 res!754052) b!1128920))

(assert (= (and b!1128920 res!754051) b!1128928))

(assert (= (and b!1128928 res!754047) b!1128919))

(assert (= (and b!1128919 res!754049) b!1128930))

(assert (= (and b!1128930 res!754046) b!1128924))

(assert (= (and b!1128924 res!754044) b!1128917))

(assert (= (and b!1128917 res!754042) b!1128931))

(assert (= (and b!1128931 (not res!754050)) b!1128918))

(assert (= (and b!1128918 (not res!754053)) b!1128923))

(assert (= (and b!1128923 c!110132) b!1128922))

(assert (= (and b!1128923 (not c!110132)) b!1128929))

(assert (= (or b!1128922 b!1128929) bm!47809))

(assert (= (or b!1128922 b!1128929) bm!47810))

(assert (= (and b!1128923 (not res!754045)) b!1128925))

(assert (= (and b!1128916 condMapEmpty!44344) mapIsEmpty!44344))

(assert (= (and b!1128916 (not condMapEmpty!44344)) mapNonEmpty!44344))

(get-info :version)

(assert (= (and mapNonEmpty!44344 ((_ is ValueCellFull!13466) mapValue!44344)) b!1128921))

(assert (= (and b!1128916 ((_ is ValueCellFull!13466) mapDefault!44344)) b!1128914))

(assert (= start!98356 b!1128916))

(declare-fun b_lambda!18801 () Bool)

(assert (=> (not b_lambda!18801) (not b!1128918)))

(declare-fun t!35507 () Bool)

(declare-fun tb!8625 () Bool)

(assert (=> (and start!98356 (= defaultEntry!1004 defaultEntry!1004) t!35507) tb!8625))

(declare-fun result!17819 () Bool)

(assert (=> tb!8625 (= result!17819 tp_is_empty!28351)))

(assert (=> b!1128918 t!35507))

(declare-fun b_and!38437 () Bool)

(assert (= b_and!38435 (and (=> t!35507 result!17819) b_and!38437)))

(declare-fun m!1043013 () Bool)

(assert (=> mapNonEmpty!44344 m!1043013))

(declare-fun m!1043015 () Bool)

(assert (=> b!1128915 m!1043015))

(declare-fun m!1043017 () Bool)

(assert (=> b!1128918 m!1043017))

(declare-fun m!1043019 () Bool)

(assert (=> b!1128918 m!1043019))

(declare-fun m!1043021 () Bool)

(assert (=> b!1128918 m!1043021))

(declare-fun m!1043023 () Bool)

(assert (=> b!1128918 m!1043023))

(declare-fun m!1043025 () Bool)

(assert (=> b!1128931 m!1043025))

(declare-fun m!1043027 () Bool)

(assert (=> b!1128931 m!1043027))

(declare-fun m!1043029 () Bool)

(assert (=> b!1128923 m!1043029))

(declare-fun m!1043031 () Bool)

(assert (=> b!1128923 m!1043031))

(declare-fun m!1043033 () Bool)

(assert (=> b!1128922 m!1043033))

(declare-fun m!1043035 () Bool)

(assert (=> b!1128917 m!1043035))

(declare-fun m!1043037 () Bool)

(assert (=> bm!47809 m!1043037))

(declare-fun m!1043039 () Bool)

(assert (=> b!1128920 m!1043039))

(declare-fun m!1043041 () Bool)

(assert (=> b!1128930 m!1043041))

(declare-fun m!1043043 () Bool)

(assert (=> bm!47810 m!1043043))

(declare-fun m!1043045 () Bool)

(assert (=> b!1128919 m!1043045))

(declare-fun m!1043047 () Bool)

(assert (=> b!1128927 m!1043047))

(declare-fun m!1043049 () Bool)

(assert (=> b!1128924 m!1043049))

(declare-fun m!1043051 () Bool)

(assert (=> b!1128924 m!1043051))

(declare-fun m!1043053 () Bool)

(assert (=> start!98356 m!1043053))

(declare-fun m!1043055 () Bool)

(assert (=> start!98356 m!1043055))

(assert (=> b!1128925 m!1043043))

(assert (=> b!1128925 m!1043043))

(declare-fun m!1043057 () Bool)

(assert (=> b!1128925 m!1043057))

(check-sat (not b!1128919) (not b!1128922) (not b!1128918) (not bm!47810) (not b!1128924) (not b!1128927) (not mapNonEmpty!44344) (not b!1128920) tp_is_empty!28351 (not b_lambda!18801) (not b!1128915) (not b!1128931) (not b_next!23821) b_and!38437 (not b!1128925) (not b!1128917) (not b!1128923) (not bm!47809) (not start!98356))
(check-sat b_and!38437 (not b_next!23821))
