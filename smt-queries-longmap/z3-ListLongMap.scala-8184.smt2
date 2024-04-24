; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100206 () Bool)

(assert start!100206)

(declare-fun b_free!25549 () Bool)

(declare-fun b_next!25549 () Bool)

(assert (=> start!100206 (= b_free!25549 (not b_next!25549))))

(declare-fun tp!89361 () Bool)

(declare-fun b_and!41967 () Bool)

(assert (=> start!100206 (= tp!89361 b_and!41967)))

(declare-fun b!1191864 () Bool)

(declare-fun e!677664 () Bool)

(declare-fun e!677663 () Bool)

(assert (=> b!1191864 (= e!677664 e!677663)))

(declare-fun res!792333 () Bool)

(assert (=> b!1191864 (=> (not res!792333) (not e!677663))))

(declare-datatypes ((array!76993 0))(
  ( (array!76994 (arr!37140 (Array (_ BitVec 32) (_ BitVec 64))) (size!37677 (_ BitVec 32))) )
))
(declare-fun lt!541989 () array!76993)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76993 (_ BitVec 32)) Bool)

(assert (=> b!1191864 (= res!792333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541989 mask!1564))))

(declare-fun _keys!1208 () array!76993)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191864 (= lt!541989 (array!76994 (store (arr!37140 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37677 _keys!1208)))))

(declare-fun b!1191866 () Bool)

(declare-fun res!792328 () Bool)

(assert (=> b!1191866 (=> (not res!792328) (not e!677664))))

(assert (=> b!1191866 (= res!792328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46946 () Bool)

(declare-fun mapRes!46946 () Bool)

(declare-fun tp!89360 () Bool)

(declare-fun e!677661 () Bool)

(assert (=> mapNonEmpty!46946 (= mapRes!46946 (and tp!89360 e!677661))))

(declare-datatypes ((V!45233 0))(
  ( (V!45234 (val!15096 Int)) )
))
(declare-datatypes ((ValueCell!14330 0))(
  ( (ValueCellFull!14330 (v!17730 V!45233)) (EmptyCell!14330) )
))
(declare-fun mapRest!46946 () (Array (_ BitVec 32) ValueCell!14330))

(declare-fun mapValue!46946 () ValueCell!14330)

(declare-fun mapKey!46946 () (_ BitVec 32))

(declare-datatypes ((array!76995 0))(
  ( (array!76996 (arr!37141 (Array (_ BitVec 32) ValueCell!14330)) (size!37678 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76995)

(assert (=> mapNonEmpty!46946 (= (arr!37141 _values!996) (store mapRest!46946 mapKey!46946 mapValue!46946))))

(declare-fun b!1191867 () Bool)

(declare-fun tp_is_empty!30079 () Bool)

(assert (=> b!1191867 (= e!677661 tp_is_empty!30079)))

(declare-fun b!1191868 () Bool)

(declare-fun e!677660 () Bool)

(assert (=> b!1191868 (= e!677660 tp_is_empty!30079)))

(declare-fun b!1191869 () Bool)

(declare-fun e!677666 () Bool)

(declare-fun e!677665 () Bool)

(assert (=> b!1191869 (= e!677666 e!677665)))

(declare-fun res!792327 () Bool)

(assert (=> b!1191869 (=> res!792327 e!677665)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191869 (= res!792327 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45233)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19424 0))(
  ( (tuple2!19425 (_1!9723 (_ BitVec 64)) (_2!9723 V!45233)) )
))
(declare-datatypes ((List!26168 0))(
  ( (Nil!26165) (Cons!26164 (h!27382 tuple2!19424) (t!38701 List!26168)) )
))
(declare-datatypes ((ListLongMap!17401 0))(
  ( (ListLongMap!17402 (toList!8716 List!26168)) )
))
(declare-fun lt!541987 () ListLongMap!17401)

(declare-fun minValue!944 () V!45233)

(declare-fun lt!541988 () array!76995)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5184 (array!76993 array!76995 (_ BitVec 32) (_ BitVec 32) V!45233 V!45233 (_ BitVec 32) Int) ListLongMap!17401)

(assert (=> b!1191869 (= lt!541987 (getCurrentListMapNoExtraKeys!5184 lt!541989 lt!541988 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3140 (Int (_ BitVec 64)) V!45233)

(assert (=> b!1191869 (= lt!541988 (array!76996 (store (arr!37141 _values!996) i!673 (ValueCellFull!14330 (dynLambda!3140 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37678 _values!996)))))

(declare-fun lt!541986 () ListLongMap!17401)

(assert (=> b!1191869 (= lt!541986 (getCurrentListMapNoExtraKeys!5184 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191870 () Bool)

(declare-fun res!792330 () Bool)

(assert (=> b!1191870 (=> (not res!792330) (not e!677664))))

(declare-datatypes ((List!26169 0))(
  ( (Nil!26166) (Cons!26165 (h!27383 (_ BitVec 64)) (t!38702 List!26169)) )
))
(declare-fun arrayNoDuplicates!0 (array!76993 (_ BitVec 32) List!26169) Bool)

(assert (=> b!1191870 (= res!792330 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26166))))

(declare-fun b!1191871 () Bool)

(declare-fun res!792326 () Bool)

(assert (=> b!1191871 (=> (not res!792326) (not e!677664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191871 (= res!792326 (validMask!0 mask!1564))))

(declare-fun b!1191872 () Bool)

(declare-fun e!677662 () Bool)

(assert (=> b!1191872 (= e!677662 (and e!677660 mapRes!46946))))

(declare-fun condMapEmpty!46946 () Bool)

(declare-fun mapDefault!46946 () ValueCell!14330)

(assert (=> b!1191872 (= condMapEmpty!46946 (= (arr!37141 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14330)) mapDefault!46946)))))

(declare-fun b!1191873 () Bool)

(assert (=> b!1191873 (= e!677663 (not e!677666))))

(declare-fun res!792331 () Bool)

(assert (=> b!1191873 (=> res!792331 e!677666)))

(assert (=> b!1191873 (= res!792331 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191873 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39479 0))(
  ( (Unit!39480) )
))
(declare-fun lt!541985 () Unit!39479)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76993 (_ BitVec 64) (_ BitVec 32)) Unit!39479)

(assert (=> b!1191873 (= lt!541985 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191865 () Bool)

(declare-fun res!792335 () Bool)

(assert (=> b!1191865 (=> (not res!792335) (not e!677664))))

(assert (=> b!1191865 (= res!792335 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37677 _keys!1208))))))

(declare-fun res!792324 () Bool)

(assert (=> start!100206 (=> (not res!792324) (not e!677664))))

(assert (=> start!100206 (= res!792324 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37677 _keys!1208))))))

(assert (=> start!100206 e!677664))

(assert (=> start!100206 tp_is_empty!30079))

(declare-fun array_inv!28390 (array!76993) Bool)

(assert (=> start!100206 (array_inv!28390 _keys!1208)))

(assert (=> start!100206 true))

(assert (=> start!100206 tp!89361))

(declare-fun array_inv!28391 (array!76995) Bool)

(assert (=> start!100206 (and (array_inv!28391 _values!996) e!677662)))

(declare-fun b!1191874 () Bool)

(declare-fun res!792334 () Bool)

(assert (=> b!1191874 (=> (not res!792334) (not e!677664))))

(assert (=> b!1191874 (= res!792334 (and (= (size!37678 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37677 _keys!1208) (size!37678 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46946 () Bool)

(assert (=> mapIsEmpty!46946 mapRes!46946))

(declare-fun b!1191875 () Bool)

(assert (=> b!1191875 (= e!677665 true)))

(declare-fun -!1728 (ListLongMap!17401 (_ BitVec 64)) ListLongMap!17401)

(assert (=> b!1191875 (= (getCurrentListMapNoExtraKeys!5184 lt!541989 lt!541988 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1728 (getCurrentListMapNoExtraKeys!5184 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541990 () Unit!39479)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!943 (array!76993 array!76995 (_ BitVec 32) (_ BitVec 32) V!45233 V!45233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39479)

(assert (=> b!1191875 (= lt!541990 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!943 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191876 () Bool)

(declare-fun res!792332 () Bool)

(assert (=> b!1191876 (=> (not res!792332) (not e!677664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191876 (= res!792332 (validKeyInArray!0 k0!934))))

(declare-fun b!1191877 () Bool)

(declare-fun res!792329 () Bool)

(assert (=> b!1191877 (=> (not res!792329) (not e!677663))))

(assert (=> b!1191877 (= res!792329 (arrayNoDuplicates!0 lt!541989 #b00000000000000000000000000000000 Nil!26166))))

(declare-fun b!1191878 () Bool)

(declare-fun res!792325 () Bool)

(assert (=> b!1191878 (=> (not res!792325) (not e!677664))))

(assert (=> b!1191878 (= res!792325 (= (select (arr!37140 _keys!1208) i!673) k0!934))))

(assert (= (and start!100206 res!792324) b!1191871))

(assert (= (and b!1191871 res!792326) b!1191874))

(assert (= (and b!1191874 res!792334) b!1191866))

(assert (= (and b!1191866 res!792328) b!1191870))

(assert (= (and b!1191870 res!792330) b!1191865))

(assert (= (and b!1191865 res!792335) b!1191876))

(assert (= (and b!1191876 res!792332) b!1191878))

(assert (= (and b!1191878 res!792325) b!1191864))

(assert (= (and b!1191864 res!792333) b!1191877))

(assert (= (and b!1191877 res!792329) b!1191873))

(assert (= (and b!1191873 (not res!792331)) b!1191869))

(assert (= (and b!1191869 (not res!792327)) b!1191875))

(assert (= (and b!1191872 condMapEmpty!46946) mapIsEmpty!46946))

(assert (= (and b!1191872 (not condMapEmpty!46946)) mapNonEmpty!46946))

(get-info :version)

(assert (= (and mapNonEmpty!46946 ((_ is ValueCellFull!14330) mapValue!46946)) b!1191867))

(assert (= (and b!1191872 ((_ is ValueCellFull!14330) mapDefault!46946)) b!1191868))

(assert (= start!100206 b!1191872))

(declare-fun b_lambda!20687 () Bool)

(assert (=> (not b_lambda!20687) (not b!1191869)))

(declare-fun t!38700 () Bool)

(declare-fun tb!10353 () Bool)

(assert (=> (and start!100206 (= defaultEntry!1004 defaultEntry!1004) t!38700) tb!10353))

(declare-fun result!21281 () Bool)

(assert (=> tb!10353 (= result!21281 tp_is_empty!30079)))

(assert (=> b!1191869 t!38700))

(declare-fun b_and!41969 () Bool)

(assert (= b_and!41967 (and (=> t!38700 result!21281) b_and!41969)))

(declare-fun m!1100703 () Bool)

(assert (=> b!1191877 m!1100703))

(declare-fun m!1100705 () Bool)

(assert (=> b!1191870 m!1100705))

(declare-fun m!1100707 () Bool)

(assert (=> b!1191864 m!1100707))

(declare-fun m!1100709 () Bool)

(assert (=> b!1191864 m!1100709))

(declare-fun m!1100711 () Bool)

(assert (=> mapNonEmpty!46946 m!1100711))

(declare-fun m!1100713 () Bool)

(assert (=> b!1191866 m!1100713))

(declare-fun m!1100715 () Bool)

(assert (=> start!100206 m!1100715))

(declare-fun m!1100717 () Bool)

(assert (=> start!100206 m!1100717))

(declare-fun m!1100719 () Bool)

(assert (=> b!1191878 m!1100719))

(declare-fun m!1100721 () Bool)

(assert (=> b!1191871 m!1100721))

(declare-fun m!1100723 () Bool)

(assert (=> b!1191876 m!1100723))

(declare-fun m!1100725 () Bool)

(assert (=> b!1191875 m!1100725))

(declare-fun m!1100727 () Bool)

(assert (=> b!1191875 m!1100727))

(assert (=> b!1191875 m!1100727))

(declare-fun m!1100729 () Bool)

(assert (=> b!1191875 m!1100729))

(declare-fun m!1100731 () Bool)

(assert (=> b!1191875 m!1100731))

(declare-fun m!1100733 () Bool)

(assert (=> b!1191869 m!1100733))

(declare-fun m!1100735 () Bool)

(assert (=> b!1191869 m!1100735))

(declare-fun m!1100737 () Bool)

(assert (=> b!1191869 m!1100737))

(declare-fun m!1100739 () Bool)

(assert (=> b!1191869 m!1100739))

(declare-fun m!1100741 () Bool)

(assert (=> b!1191873 m!1100741))

(declare-fun m!1100743 () Bool)

(assert (=> b!1191873 m!1100743))

(check-sat (not b_next!25549) (not b!1191866) (not start!100206) (not b!1191871) b_and!41969 (not b!1191875) (not b_lambda!20687) (not b!1191876) (not b!1191877) (not b!1191873) (not b!1191864) (not b!1191869) (not mapNonEmpty!46946) tp_is_empty!30079 (not b!1191870))
(check-sat b_and!41969 (not b_next!25549))
