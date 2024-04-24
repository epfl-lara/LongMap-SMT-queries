; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99516 () Bool)

(assert start!99516)

(declare-fun b_free!24859 () Bool)

(declare-fun b_next!24859 () Bool)

(assert (=> start!99516 (= b_free!24859 (not b_next!24859))))

(declare-fun tp!87291 () Bool)

(declare-fun b_and!40587 () Bool)

(assert (=> start!99516 (= tp!87291 b_and!40587)))

(declare-fun b!1170796 () Bool)

(declare-fun res!776531 () Bool)

(declare-fun e!665516 () Bool)

(assert (=> b!1170796 (=> (not res!776531) (not e!665516))))

(declare-datatypes ((array!75647 0))(
  ( (array!75648 (arr!36467 (Array (_ BitVec 32) (_ BitVec 64))) (size!37004 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75647)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1170796 (= res!776531 (= (select (arr!36467 _keys!1208) i!673) k0!934))))

(declare-fun b!1170797 () Bool)

(declare-fun e!665517 () Bool)

(declare-fun tp_is_empty!29389 () Bool)

(assert (=> b!1170797 (= e!665517 tp_is_empty!29389)))

(declare-fun b!1170798 () Bool)

(declare-fun res!776538 () Bool)

(assert (=> b!1170798 (=> (not res!776538) (not e!665516))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75647 (_ BitVec 32)) Bool)

(assert (=> b!1170798 (= res!776538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170799 () Bool)

(declare-fun e!665524 () Bool)

(assert (=> b!1170799 (= e!665524 true)))

(declare-fun e!665522 () Bool)

(assert (=> b!1170799 e!665522))

(declare-fun res!776536 () Bool)

(assert (=> b!1170799 (=> (not res!776536) (not e!665522))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!44313 0))(
  ( (V!44314 (val!14751 Int)) )
))
(declare-fun lt!527114 () V!44313)

(declare-datatypes ((tuple2!18860 0))(
  ( (tuple2!18861 (_1!9441 (_ BitVec 64)) (_2!9441 V!44313)) )
))
(declare-datatypes ((List!25597 0))(
  ( (Nil!25594) (Cons!25593 (h!26811 tuple2!18860) (t!37440 List!25597)) )
))
(declare-datatypes ((ListLongMap!16837 0))(
  ( (ListLongMap!16838 (toList!8434 List!25597)) )
))
(declare-fun lt!527113 () ListLongMap!16837)

(declare-datatypes ((ValueCell!13985 0))(
  ( (ValueCellFull!13985 (v!17385 V!44313)) (EmptyCell!13985) )
))
(declare-datatypes ((array!75649 0))(
  ( (array!75650 (arr!36468 (Array (_ BitVec 32) ValueCell!13985)) (size!37005 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75649)

(declare-fun lt!527111 () ListLongMap!16837)

(declare-fun +!3776 (ListLongMap!16837 tuple2!18860) ListLongMap!16837)

(declare-fun get!18614 (ValueCell!13985 V!44313) V!44313)

(assert (=> b!1170799 (= res!776536 (= lt!527113 (+!3776 lt!527111 (tuple2!18861 (select (arr!36467 _keys!1208) from!1455) (get!18614 (select (arr!36468 _values!996) from!1455) lt!527114)))))))

(declare-fun b!1170800 () Bool)

(declare-fun res!776526 () Bool)

(assert (=> b!1170800 (=> (not res!776526) (not e!665516))))

(assert (=> b!1170800 (= res!776526 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37004 _keys!1208))))))

(declare-fun b!1170801 () Bool)

(declare-fun e!665520 () Bool)

(declare-fun e!665519 () Bool)

(assert (=> b!1170801 (= e!665520 e!665519)))

(declare-fun res!776530 () Bool)

(assert (=> b!1170801 (=> res!776530 e!665519)))

(assert (=> b!1170801 (= res!776530 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44313)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!527107 () array!75649)

(declare-fun minValue!944 () V!44313)

(declare-fun lt!527108 () array!75647)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4924 (array!75647 array!75649 (_ BitVec 32) (_ BitVec 32) V!44313 V!44313 (_ BitVec 32) Int) ListLongMap!16837)

(assert (=> b!1170801 (= lt!527113 (getCurrentListMapNoExtraKeys!4924 lt!527108 lt!527107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170801 (= lt!527107 (array!75650 (store (arr!36468 _values!996) i!673 (ValueCellFull!13985 lt!527114)) (size!37005 _values!996)))))

(declare-fun dynLambda!2907 (Int (_ BitVec 64)) V!44313)

(assert (=> b!1170801 (= lt!527114 (dynLambda!2907 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527115 () ListLongMap!16837)

(assert (=> b!1170801 (= lt!527115 (getCurrentListMapNoExtraKeys!4924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45911 () Bool)

(declare-fun mapRes!45911 () Bool)

(declare-fun tp!87290 () Bool)

(assert (=> mapNonEmpty!45911 (= mapRes!45911 (and tp!87290 e!665517))))

(declare-fun mapRest!45911 () (Array (_ BitVec 32) ValueCell!13985))

(declare-fun mapValue!45911 () ValueCell!13985)

(declare-fun mapKey!45911 () (_ BitVec 32))

(assert (=> mapNonEmpty!45911 (= (arr!36468 _values!996) (store mapRest!45911 mapKey!45911 mapValue!45911))))

(declare-fun b!1170795 () Bool)

(declare-fun res!776539 () Bool)

(assert (=> b!1170795 (=> (not res!776539) (not e!665516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170795 (= res!776539 (validKeyInArray!0 k0!934))))

(declare-fun res!776528 () Bool)

(assert (=> start!99516 (=> (not res!776528) (not e!665516))))

(assert (=> start!99516 (= res!776528 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37004 _keys!1208))))))

(assert (=> start!99516 e!665516))

(assert (=> start!99516 tp_is_empty!29389))

(declare-fun array_inv!27942 (array!75647) Bool)

(assert (=> start!99516 (array_inv!27942 _keys!1208)))

(assert (=> start!99516 true))

(assert (=> start!99516 tp!87291))

(declare-fun e!665523 () Bool)

(declare-fun array_inv!27943 (array!75649) Bool)

(assert (=> start!99516 (and (array_inv!27943 _values!996) e!665523)))

(declare-fun b!1170802 () Bool)

(declare-fun e!665518 () Bool)

(declare-fun arrayContainsKey!0 (array!75647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170802 (= e!665518 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170803 () Bool)

(assert (=> b!1170803 (= e!665519 e!665524)))

(declare-fun res!776529 () Bool)

(assert (=> b!1170803 (=> res!776529 e!665524)))

(assert (=> b!1170803 (= res!776529 (not (validKeyInArray!0 (select (arr!36467 _keys!1208) from!1455))))))

(declare-fun lt!527110 () ListLongMap!16837)

(assert (=> b!1170803 (= lt!527110 lt!527111)))

(declare-fun lt!527116 () ListLongMap!16837)

(declare-fun -!1493 (ListLongMap!16837 (_ BitVec 64)) ListLongMap!16837)

(assert (=> b!1170803 (= lt!527111 (-!1493 lt!527116 k0!934))))

(assert (=> b!1170803 (= lt!527110 (getCurrentListMapNoExtraKeys!4924 lt!527108 lt!527107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170803 (= lt!527116 (getCurrentListMapNoExtraKeys!4924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38561 0))(
  ( (Unit!38562) )
))
(declare-fun lt!527109 () Unit!38561)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!718 (array!75647 array!75649 (_ BitVec 32) (_ BitVec 32) V!44313 V!44313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38561)

(assert (=> b!1170803 (= lt!527109 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!718 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170804 () Bool)

(declare-fun e!665515 () Bool)

(assert (=> b!1170804 (= e!665523 (and e!665515 mapRes!45911))))

(declare-fun condMapEmpty!45911 () Bool)

(declare-fun mapDefault!45911 () ValueCell!13985)

(assert (=> b!1170804 (= condMapEmpty!45911 (= (arr!36468 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13985)) mapDefault!45911)))))

(declare-fun b!1170805 () Bool)

(assert (=> b!1170805 (= e!665522 e!665518)))

(declare-fun res!776535 () Bool)

(assert (=> b!1170805 (=> res!776535 e!665518)))

(assert (=> b!1170805 (= res!776535 (not (= (select (arr!36467 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170806 () Bool)

(declare-fun e!665521 () Bool)

(assert (=> b!1170806 (= e!665516 e!665521)))

(declare-fun res!776533 () Bool)

(assert (=> b!1170806 (=> (not res!776533) (not e!665521))))

(assert (=> b!1170806 (= res!776533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527108 mask!1564))))

(assert (=> b!1170806 (= lt!527108 (array!75648 (store (arr!36467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37004 _keys!1208)))))

(declare-fun b!1170807 () Bool)

(assert (=> b!1170807 (= e!665521 (not e!665520))))

(declare-fun res!776540 () Bool)

(assert (=> b!1170807 (=> res!776540 e!665520)))

(assert (=> b!1170807 (= res!776540 (bvsgt from!1455 i!673))))

(assert (=> b!1170807 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527112 () Unit!38561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75647 (_ BitVec 64) (_ BitVec 32)) Unit!38561)

(assert (=> b!1170807 (= lt!527112 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170808 () Bool)

(assert (=> b!1170808 (= e!665515 tp_is_empty!29389)))

(declare-fun b!1170809 () Bool)

(declare-fun res!776537 () Bool)

(assert (=> b!1170809 (=> (not res!776537) (not e!665516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170809 (= res!776537 (validMask!0 mask!1564))))

(declare-fun b!1170810 () Bool)

(declare-fun res!776532 () Bool)

(assert (=> b!1170810 (=> (not res!776532) (not e!665521))))

(declare-datatypes ((List!25598 0))(
  ( (Nil!25595) (Cons!25594 (h!26812 (_ BitVec 64)) (t!37441 List!25598)) )
))
(declare-fun arrayNoDuplicates!0 (array!75647 (_ BitVec 32) List!25598) Bool)

(assert (=> b!1170810 (= res!776532 (arrayNoDuplicates!0 lt!527108 #b00000000000000000000000000000000 Nil!25595))))

(declare-fun b!1170811 () Bool)

(declare-fun res!776534 () Bool)

(assert (=> b!1170811 (=> (not res!776534) (not e!665516))))

(assert (=> b!1170811 (= res!776534 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25595))))

(declare-fun mapIsEmpty!45911 () Bool)

(assert (=> mapIsEmpty!45911 mapRes!45911))

(declare-fun b!1170812 () Bool)

(declare-fun res!776527 () Bool)

(assert (=> b!1170812 (=> (not res!776527) (not e!665516))))

(assert (=> b!1170812 (= res!776527 (and (= (size!37005 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37004 _keys!1208) (size!37005 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99516 res!776528) b!1170809))

(assert (= (and b!1170809 res!776537) b!1170812))

(assert (= (and b!1170812 res!776527) b!1170798))

(assert (= (and b!1170798 res!776538) b!1170811))

(assert (= (and b!1170811 res!776534) b!1170800))

(assert (= (and b!1170800 res!776526) b!1170795))

(assert (= (and b!1170795 res!776539) b!1170796))

(assert (= (and b!1170796 res!776531) b!1170806))

(assert (= (and b!1170806 res!776533) b!1170810))

(assert (= (and b!1170810 res!776532) b!1170807))

(assert (= (and b!1170807 (not res!776540)) b!1170801))

(assert (= (and b!1170801 (not res!776530)) b!1170803))

(assert (= (and b!1170803 (not res!776529)) b!1170799))

(assert (= (and b!1170799 res!776536) b!1170805))

(assert (= (and b!1170805 (not res!776535)) b!1170802))

(assert (= (and b!1170804 condMapEmpty!45911) mapIsEmpty!45911))

(assert (= (and b!1170804 (not condMapEmpty!45911)) mapNonEmpty!45911))

(get-info :version)

(assert (= (and mapNonEmpty!45911 ((_ is ValueCellFull!13985) mapValue!45911)) b!1170797))

(assert (= (and b!1170804 ((_ is ValueCellFull!13985) mapDefault!45911)) b!1170808))

(assert (= start!99516 b!1170804))

(declare-fun b_lambda!19997 () Bool)

(assert (=> (not b_lambda!19997) (not b!1170801)))

(declare-fun t!37439 () Bool)

(declare-fun tb!9663 () Bool)

(assert (=> (and start!99516 (= defaultEntry!1004 defaultEntry!1004) t!37439) tb!9663))

(declare-fun result!19901 () Bool)

(assert (=> tb!9663 (= result!19901 tp_is_empty!29389)))

(assert (=> b!1170801 t!37439))

(declare-fun b_and!40589 () Bool)

(assert (= b_and!40587 (and (=> t!37439 result!19901) b_and!40589)))

(declare-fun m!1078935 () Bool)

(assert (=> b!1170802 m!1078935))

(declare-fun m!1078937 () Bool)

(assert (=> start!99516 m!1078937))

(declare-fun m!1078939 () Bool)

(assert (=> start!99516 m!1078939))

(declare-fun m!1078941 () Bool)

(assert (=> b!1170809 m!1078941))

(declare-fun m!1078943 () Bool)

(assert (=> b!1170795 m!1078943))

(declare-fun m!1078945 () Bool)

(assert (=> mapNonEmpty!45911 m!1078945))

(declare-fun m!1078947 () Bool)

(assert (=> b!1170799 m!1078947))

(declare-fun m!1078949 () Bool)

(assert (=> b!1170799 m!1078949))

(assert (=> b!1170799 m!1078949))

(declare-fun m!1078951 () Bool)

(assert (=> b!1170799 m!1078951))

(declare-fun m!1078953 () Bool)

(assert (=> b!1170799 m!1078953))

(assert (=> b!1170805 m!1078947))

(declare-fun m!1078955 () Bool)

(assert (=> b!1170801 m!1078955))

(declare-fun m!1078957 () Bool)

(assert (=> b!1170801 m!1078957))

(declare-fun m!1078959 () Bool)

(assert (=> b!1170801 m!1078959))

(declare-fun m!1078961 () Bool)

(assert (=> b!1170801 m!1078961))

(declare-fun m!1078963 () Bool)

(assert (=> b!1170810 m!1078963))

(declare-fun m!1078965 () Bool)

(assert (=> b!1170807 m!1078965))

(declare-fun m!1078967 () Bool)

(assert (=> b!1170807 m!1078967))

(declare-fun m!1078969 () Bool)

(assert (=> b!1170806 m!1078969))

(declare-fun m!1078971 () Bool)

(assert (=> b!1170806 m!1078971))

(declare-fun m!1078973 () Bool)

(assert (=> b!1170796 m!1078973))

(declare-fun m!1078975 () Bool)

(assert (=> b!1170803 m!1078975))

(declare-fun m!1078977 () Bool)

(assert (=> b!1170803 m!1078977))

(declare-fun m!1078979 () Bool)

(assert (=> b!1170803 m!1078979))

(assert (=> b!1170803 m!1078947))

(declare-fun m!1078981 () Bool)

(assert (=> b!1170803 m!1078981))

(assert (=> b!1170803 m!1078947))

(declare-fun m!1078983 () Bool)

(assert (=> b!1170803 m!1078983))

(declare-fun m!1078985 () Bool)

(assert (=> b!1170811 m!1078985))

(declare-fun m!1078987 () Bool)

(assert (=> b!1170798 m!1078987))

(check-sat (not b!1170798) (not b!1170810) (not b!1170795) (not b_lambda!19997) (not b!1170807) (not b!1170802) (not b_next!24859) (not start!99516) (not b!1170809) (not b!1170806) (not mapNonEmpty!45911) b_and!40589 (not b!1170801) (not b!1170803) (not b!1170811) (not b!1170799) tp_is_empty!29389)
(check-sat b_and!40589 (not b_next!24859))
