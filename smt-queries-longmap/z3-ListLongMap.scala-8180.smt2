; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99948 () Bool)

(assert start!99948)

(declare-fun b_free!25527 () Bool)

(declare-fun b_next!25527 () Bool)

(assert (=> start!99948 (= b_free!25527 (not b_next!25527))))

(declare-fun tp!89294 () Bool)

(declare-fun b_and!41921 () Bool)

(assert (=> start!99948 (= tp!89294 b_and!41921)))

(declare-fun b!1190059 () Bool)

(declare-fun e!676566 () Bool)

(declare-fun e!676564 () Bool)

(assert (=> b!1190059 (= e!676566 (not e!676564))))

(declare-fun res!791427 () Bool)

(assert (=> b!1190059 (=> res!791427 e!676564)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190059 (= res!791427 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76905 0))(
  ( (array!76906 (arr!37102 (Array (_ BitVec 32) (_ BitVec 64))) (size!37638 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76905)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190059 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39470 0))(
  ( (Unit!39471) )
))
(declare-fun lt!541306 () Unit!39470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76905 (_ BitVec 64) (_ BitVec 32)) Unit!39470)

(assert (=> b!1190059 (= lt!541306 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190060 () Bool)

(declare-fun res!791422 () Bool)

(declare-fun e!676567 () Bool)

(assert (=> b!1190060 (=> (not res!791422) (not e!676567))))

(declare-datatypes ((List!26120 0))(
  ( (Nil!26117) (Cons!26116 (h!27325 (_ BitVec 64)) (t!38639 List!26120)) )
))
(declare-fun arrayNoDuplicates!0 (array!76905 (_ BitVec 32) List!26120) Bool)

(assert (=> b!1190060 (= res!791422 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26117))))

(declare-fun mapIsEmpty!46913 () Bool)

(declare-fun mapRes!46913 () Bool)

(assert (=> mapIsEmpty!46913 mapRes!46913))

(declare-fun b!1190061 () Bool)

(declare-fun e!676569 () Bool)

(declare-fun tp_is_empty!30057 () Bool)

(assert (=> b!1190061 (= e!676569 tp_is_empty!30057)))

(declare-fun b!1190062 () Bool)

(assert (=> b!1190062 (= e!676567 e!676566)))

(declare-fun res!791429 () Bool)

(assert (=> b!1190062 (=> (not res!791429) (not e!676566))))

(declare-fun lt!541308 () array!76905)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76905 (_ BitVec 32)) Bool)

(assert (=> b!1190062 (= res!791429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541308 mask!1564))))

(assert (=> b!1190062 (= lt!541308 (array!76906 (store (arr!37102 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37638 _keys!1208)))))

(declare-fun b!1190063 () Bool)

(declare-fun res!791425 () Bool)

(assert (=> b!1190063 (=> (not res!791425) (not e!676567))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45203 0))(
  ( (V!45204 (val!15085 Int)) )
))
(declare-datatypes ((ValueCell!14319 0))(
  ( (ValueCellFull!14319 (v!17723 V!45203)) (EmptyCell!14319) )
))
(declare-datatypes ((array!76907 0))(
  ( (array!76908 (arr!37103 (Array (_ BitVec 32) ValueCell!14319)) (size!37639 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76907)

(assert (=> b!1190063 (= res!791425 (and (= (size!37639 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37638 _keys!1208) (size!37639 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190064 () Bool)

(declare-fun e!676565 () Bool)

(assert (=> b!1190064 (= e!676565 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541304 () array!76907)

(declare-fun minValue!944 () V!45203)

(declare-fun zeroValue!944 () V!45203)

(declare-datatypes ((tuple2!19374 0))(
  ( (tuple2!19375 (_1!9698 (_ BitVec 64)) (_2!9698 V!45203)) )
))
(declare-datatypes ((List!26121 0))(
  ( (Nil!26118) (Cons!26117 (h!27326 tuple2!19374) (t!38640 List!26121)) )
))
(declare-datatypes ((ListLongMap!17343 0))(
  ( (ListLongMap!17344 (toList!8687 List!26121)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5128 (array!76905 array!76907 (_ BitVec 32) (_ BitVec 32) V!45203 V!45203 (_ BitVec 32) Int) ListLongMap!17343)

(declare-fun -!1714 (ListLongMap!17343 (_ BitVec 64)) ListLongMap!17343)

(assert (=> b!1190064 (= (getCurrentListMapNoExtraKeys!5128 lt!541308 lt!541304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1714 (getCurrentListMapNoExtraKeys!5128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541305 () Unit!39470)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!923 (array!76905 array!76907 (_ BitVec 32) (_ BitVec 32) V!45203 V!45203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39470)

(assert (=> b!1190064 (= lt!541305 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!923 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190065 () Bool)

(declare-fun res!791428 () Bool)

(assert (=> b!1190065 (=> (not res!791428) (not e!676567))))

(assert (=> b!1190065 (= res!791428 (= (select (arr!37102 _keys!1208) i!673) k0!934))))

(declare-fun b!1190066 () Bool)

(assert (=> b!1190066 (= e!676564 e!676565)))

(declare-fun res!791423 () Bool)

(assert (=> b!1190066 (=> res!791423 e!676565)))

(assert (=> b!1190066 (= res!791423 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541307 () ListLongMap!17343)

(assert (=> b!1190066 (= lt!541307 (getCurrentListMapNoExtraKeys!5128 lt!541308 lt!541304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3070 (Int (_ BitVec 64)) V!45203)

(assert (=> b!1190066 (= lt!541304 (array!76908 (store (arr!37103 _values!996) i!673 (ValueCellFull!14319 (dynLambda!3070 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37639 _values!996)))))

(declare-fun lt!541303 () ListLongMap!17343)

(assert (=> b!1190066 (= lt!541303 (getCurrentListMapNoExtraKeys!5128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190067 () Bool)

(declare-fun e!676563 () Bool)

(assert (=> b!1190067 (= e!676563 tp_is_empty!30057)))

(declare-fun b!1190068 () Bool)

(declare-fun res!791424 () Bool)

(assert (=> b!1190068 (=> (not res!791424) (not e!676567))))

(assert (=> b!1190068 (= res!791424 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37638 _keys!1208))))))

(declare-fun b!1190069 () Bool)

(declare-fun res!791420 () Bool)

(assert (=> b!1190069 (=> (not res!791420) (not e!676566))))

(assert (=> b!1190069 (= res!791420 (arrayNoDuplicates!0 lt!541308 #b00000000000000000000000000000000 Nil!26117))))

(declare-fun res!791426 () Bool)

(assert (=> start!99948 (=> (not res!791426) (not e!676567))))

(assert (=> start!99948 (= res!791426 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37638 _keys!1208))))))

(assert (=> start!99948 e!676567))

(assert (=> start!99948 tp_is_empty!30057))

(declare-fun array_inv!28298 (array!76905) Bool)

(assert (=> start!99948 (array_inv!28298 _keys!1208)))

(assert (=> start!99948 true))

(assert (=> start!99948 tp!89294))

(declare-fun e!676570 () Bool)

(declare-fun array_inv!28299 (array!76907) Bool)

(assert (=> start!99948 (and (array_inv!28299 _values!996) e!676570)))

(declare-fun b!1190058 () Bool)

(declare-fun res!791421 () Bool)

(assert (=> b!1190058 (=> (not res!791421) (not e!676567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190058 (= res!791421 (validMask!0 mask!1564))))

(declare-fun b!1190070 () Bool)

(declare-fun res!791431 () Bool)

(assert (=> b!1190070 (=> (not res!791431) (not e!676567))))

(assert (=> b!1190070 (= res!791431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46913 () Bool)

(declare-fun tp!89295 () Bool)

(assert (=> mapNonEmpty!46913 (= mapRes!46913 (and tp!89295 e!676563))))

(declare-fun mapValue!46913 () ValueCell!14319)

(declare-fun mapKey!46913 () (_ BitVec 32))

(declare-fun mapRest!46913 () (Array (_ BitVec 32) ValueCell!14319))

(assert (=> mapNonEmpty!46913 (= (arr!37103 _values!996) (store mapRest!46913 mapKey!46913 mapValue!46913))))

(declare-fun b!1190071 () Bool)

(declare-fun res!791430 () Bool)

(assert (=> b!1190071 (=> (not res!791430) (not e!676567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190071 (= res!791430 (validKeyInArray!0 k0!934))))

(declare-fun b!1190072 () Bool)

(assert (=> b!1190072 (= e!676570 (and e!676569 mapRes!46913))))

(declare-fun condMapEmpty!46913 () Bool)

(declare-fun mapDefault!46913 () ValueCell!14319)

(assert (=> b!1190072 (= condMapEmpty!46913 (= (arr!37103 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14319)) mapDefault!46913)))))

(assert (= (and start!99948 res!791426) b!1190058))

(assert (= (and b!1190058 res!791421) b!1190063))

(assert (= (and b!1190063 res!791425) b!1190070))

(assert (= (and b!1190070 res!791431) b!1190060))

(assert (= (and b!1190060 res!791422) b!1190068))

(assert (= (and b!1190068 res!791424) b!1190071))

(assert (= (and b!1190071 res!791430) b!1190065))

(assert (= (and b!1190065 res!791428) b!1190062))

(assert (= (and b!1190062 res!791429) b!1190069))

(assert (= (and b!1190069 res!791420) b!1190059))

(assert (= (and b!1190059 (not res!791427)) b!1190066))

(assert (= (and b!1190066 (not res!791423)) b!1190064))

(assert (= (and b!1190072 condMapEmpty!46913) mapIsEmpty!46913))

(assert (= (and b!1190072 (not condMapEmpty!46913)) mapNonEmpty!46913))

(get-info :version)

(assert (= (and mapNonEmpty!46913 ((_ is ValueCellFull!14319) mapValue!46913)) b!1190067))

(assert (= (and b!1190072 ((_ is ValueCellFull!14319) mapDefault!46913)) b!1190061))

(assert (= start!99948 b!1190072))

(declare-fun b_lambda!20671 () Bool)

(assert (=> (not b_lambda!20671) (not b!1190066)))

(declare-fun t!38638 () Bool)

(declare-fun tb!10339 () Bool)

(assert (=> (and start!99948 (= defaultEntry!1004 defaultEntry!1004) t!38638) tb!10339))

(declare-fun result!21245 () Bool)

(assert (=> tb!10339 (= result!21245 tp_is_empty!30057)))

(assert (=> b!1190066 t!38638))

(declare-fun b_and!41923 () Bool)

(assert (= b_and!41921 (and (=> t!38638 result!21245) b_and!41923)))

(declare-fun m!1098669 () Bool)

(assert (=> b!1190071 m!1098669))

(declare-fun m!1098671 () Bool)

(assert (=> start!99948 m!1098671))

(declare-fun m!1098673 () Bool)

(assert (=> start!99948 m!1098673))

(declare-fun m!1098675 () Bool)

(assert (=> b!1190059 m!1098675))

(declare-fun m!1098677 () Bool)

(assert (=> b!1190059 m!1098677))

(declare-fun m!1098679 () Bool)

(assert (=> b!1190062 m!1098679))

(declare-fun m!1098681 () Bool)

(assert (=> b!1190062 m!1098681))

(declare-fun m!1098683 () Bool)

(assert (=> b!1190064 m!1098683))

(declare-fun m!1098685 () Bool)

(assert (=> b!1190064 m!1098685))

(assert (=> b!1190064 m!1098685))

(declare-fun m!1098687 () Bool)

(assert (=> b!1190064 m!1098687))

(declare-fun m!1098689 () Bool)

(assert (=> b!1190064 m!1098689))

(declare-fun m!1098691 () Bool)

(assert (=> b!1190060 m!1098691))

(declare-fun m!1098693 () Bool)

(assert (=> b!1190069 m!1098693))

(declare-fun m!1098695 () Bool)

(assert (=> b!1190058 m!1098695))

(declare-fun m!1098697 () Bool)

(assert (=> b!1190065 m!1098697))

(declare-fun m!1098699 () Bool)

(assert (=> mapNonEmpty!46913 m!1098699))

(declare-fun m!1098701 () Bool)

(assert (=> b!1190066 m!1098701))

(declare-fun m!1098703 () Bool)

(assert (=> b!1190066 m!1098703))

(declare-fun m!1098705 () Bool)

(assert (=> b!1190066 m!1098705))

(declare-fun m!1098707 () Bool)

(assert (=> b!1190066 m!1098707))

(declare-fun m!1098709 () Bool)

(assert (=> b!1190070 m!1098709))

(check-sat (not b!1190062) (not b_lambda!20671) (not b!1190064) (not b!1190069) (not b!1190066) tp_is_empty!30057 (not b!1190058) (not b!1190060) (not b!1190070) b_and!41923 (not mapNonEmpty!46913) (not start!99948) (not b!1190059) (not b_next!25527) (not b!1190071))
(check-sat b_and!41923 (not b_next!25527))
