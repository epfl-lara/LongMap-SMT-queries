; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100194 () Bool)

(assert start!100194)

(declare-fun b_free!25537 () Bool)

(declare-fun b_next!25537 () Bool)

(assert (=> start!100194 (= b_free!25537 (not b_next!25537))))

(declare-fun tp!89325 () Bool)

(declare-fun b_and!41943 () Bool)

(assert (=> start!100194 (= tp!89325 b_and!41943)))

(declare-fun b!1191582 () Bool)

(declare-fun res!792114 () Bool)

(declare-fun e!677518 () Bool)

(assert (=> b!1191582 (=> (not res!792114) (not e!677518))))

(declare-datatypes ((array!76971 0))(
  ( (array!76972 (arr!37129 (Array (_ BitVec 32) (_ BitVec 64))) (size!37666 (_ BitVec 32))) )
))
(declare-fun lt!541882 () array!76971)

(declare-datatypes ((List!26161 0))(
  ( (Nil!26158) (Cons!26157 (h!27375 (_ BitVec 64)) (t!38682 List!26161)) )
))
(declare-fun arrayNoDuplicates!0 (array!76971 (_ BitVec 32) List!26161) Bool)

(assert (=> b!1191582 (= res!792114 (arrayNoDuplicates!0 lt!541882 #b00000000000000000000000000000000 Nil!26158))))

(declare-fun b!1191583 () Bool)

(declare-fun res!792116 () Bool)

(declare-fun e!677517 () Bool)

(assert (=> b!1191583 (=> (not res!792116) (not e!677517))))

(declare-fun _keys!1208 () array!76971)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45217 0))(
  ( (V!45218 (val!15090 Int)) )
))
(declare-datatypes ((ValueCell!14324 0))(
  ( (ValueCellFull!14324 (v!17724 V!45217)) (EmptyCell!14324) )
))
(declare-datatypes ((array!76973 0))(
  ( (array!76974 (arr!37130 (Array (_ BitVec 32) ValueCell!14324)) (size!37667 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76973)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1191583 (= res!792116 (and (= (size!37667 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37666 _keys!1208) (size!37667 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46928 () Bool)

(declare-fun mapRes!46928 () Bool)

(assert (=> mapIsEmpty!46928 mapRes!46928))

(declare-fun b!1191584 () Bool)

(declare-fun res!792119 () Bool)

(assert (=> b!1191584 (=> (not res!792119) (not e!677517))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191584 (= res!792119 (validKeyInArray!0 k0!934))))

(declare-fun b!1191585 () Bool)

(declare-fun res!792111 () Bool)

(assert (=> b!1191585 (=> (not res!792111) (not e!677517))))

(assert (=> b!1191585 (= res!792111 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26158))))

(declare-fun mapNonEmpty!46928 () Bool)

(declare-fun tp!89324 () Bool)

(declare-fun e!677515 () Bool)

(assert (=> mapNonEmpty!46928 (= mapRes!46928 (and tp!89324 e!677515))))

(declare-fun mapRest!46928 () (Array (_ BitVec 32) ValueCell!14324))

(declare-fun mapValue!46928 () ValueCell!14324)

(declare-fun mapKey!46928 () (_ BitVec 32))

(assert (=> mapNonEmpty!46928 (= (arr!37130 _values!996) (store mapRest!46928 mapKey!46928 mapValue!46928))))

(declare-fun b!1191586 () Bool)

(declare-fun e!677516 () Bool)

(declare-fun tp_is_empty!30067 () Bool)

(assert (=> b!1191586 (= e!677516 tp_is_empty!30067)))

(declare-fun res!792110 () Bool)

(assert (=> start!100194 (=> (not res!792110) (not e!677517))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100194 (= res!792110 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37666 _keys!1208))))))

(assert (=> start!100194 e!677517))

(assert (=> start!100194 tp_is_empty!30067))

(declare-fun array_inv!28382 (array!76971) Bool)

(assert (=> start!100194 (array_inv!28382 _keys!1208)))

(assert (=> start!100194 true))

(assert (=> start!100194 tp!89325))

(declare-fun e!677520 () Bool)

(declare-fun array_inv!28383 (array!76973) Bool)

(assert (=> start!100194 (and (array_inv!28383 _values!996) e!677520)))

(declare-fun b!1191587 () Bool)

(assert (=> b!1191587 (= e!677515 tp_is_empty!30067)))

(declare-fun b!1191588 () Bool)

(declare-fun e!677519 () Bool)

(declare-fun e!677521 () Bool)

(assert (=> b!1191588 (= e!677519 e!677521)))

(declare-fun res!792115 () Bool)

(assert (=> b!1191588 (=> res!792115 e!677521)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191588 (= res!792115 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45217)

(declare-datatypes ((tuple2!19416 0))(
  ( (tuple2!19417 (_1!9719 (_ BitVec 64)) (_2!9719 V!45217)) )
))
(declare-datatypes ((List!26162 0))(
  ( (Nil!26159) (Cons!26158 (h!27376 tuple2!19416) (t!38683 List!26162)) )
))
(declare-datatypes ((ListLongMap!17393 0))(
  ( (ListLongMap!17394 (toList!8712 List!26162)) )
))
(declare-fun lt!541877 () ListLongMap!17393)

(declare-fun lt!541878 () array!76973)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45217)

(declare-fun getCurrentListMapNoExtraKeys!5180 (array!76971 array!76973 (_ BitVec 32) (_ BitVec 32) V!45217 V!45217 (_ BitVec 32) Int) ListLongMap!17393)

(assert (=> b!1191588 (= lt!541877 (getCurrentListMapNoExtraKeys!5180 lt!541882 lt!541878 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3137 (Int (_ BitVec 64)) V!45217)

(assert (=> b!1191588 (= lt!541878 (array!76974 (store (arr!37130 _values!996) i!673 (ValueCellFull!14324 (dynLambda!3137 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37667 _values!996)))))

(declare-fun lt!541880 () ListLongMap!17393)

(assert (=> b!1191588 (= lt!541880 (getCurrentListMapNoExtraKeys!5180 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191589 () Bool)

(declare-fun res!792117 () Bool)

(assert (=> b!1191589 (=> (not res!792117) (not e!677517))))

(assert (=> b!1191589 (= res!792117 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37666 _keys!1208))))))

(declare-fun b!1191590 () Bool)

(assert (=> b!1191590 (= e!677521 true)))

(declare-fun -!1725 (ListLongMap!17393 (_ BitVec 64)) ListLongMap!17393)

(assert (=> b!1191590 (= (getCurrentListMapNoExtraKeys!5180 lt!541882 lt!541878 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1725 (getCurrentListMapNoExtraKeys!5180 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39471 0))(
  ( (Unit!39472) )
))
(declare-fun lt!541881 () Unit!39471)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!940 (array!76971 array!76973 (_ BitVec 32) (_ BitVec 32) V!45217 V!45217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39471)

(assert (=> b!1191590 (= lt!541881 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!940 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191591 () Bool)

(declare-fun res!792108 () Bool)

(assert (=> b!1191591 (=> (not res!792108) (not e!677517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191591 (= res!792108 (validMask!0 mask!1564))))

(declare-fun b!1191592 () Bool)

(assert (=> b!1191592 (= e!677520 (and e!677516 mapRes!46928))))

(declare-fun condMapEmpty!46928 () Bool)

(declare-fun mapDefault!46928 () ValueCell!14324)

(assert (=> b!1191592 (= condMapEmpty!46928 (= (arr!37130 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14324)) mapDefault!46928)))))

(declare-fun b!1191593 () Bool)

(assert (=> b!1191593 (= e!677517 e!677518)))

(declare-fun res!792109 () Bool)

(assert (=> b!1191593 (=> (not res!792109) (not e!677518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76971 (_ BitVec 32)) Bool)

(assert (=> b!1191593 (= res!792109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541882 mask!1564))))

(assert (=> b!1191593 (= lt!541882 (array!76972 (store (arr!37129 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37666 _keys!1208)))))

(declare-fun b!1191594 () Bool)

(declare-fun res!792112 () Bool)

(assert (=> b!1191594 (=> (not res!792112) (not e!677517))))

(assert (=> b!1191594 (= res!792112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191595 () Bool)

(declare-fun res!792113 () Bool)

(assert (=> b!1191595 (=> (not res!792113) (not e!677517))))

(assert (=> b!1191595 (= res!792113 (= (select (arr!37129 _keys!1208) i!673) k0!934))))

(declare-fun b!1191596 () Bool)

(assert (=> b!1191596 (= e!677518 (not e!677519))))

(declare-fun res!792118 () Bool)

(assert (=> b!1191596 (=> res!792118 e!677519)))

(assert (=> b!1191596 (= res!792118 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191596 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541879 () Unit!39471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76971 (_ BitVec 64) (_ BitVec 32)) Unit!39471)

(assert (=> b!1191596 (= lt!541879 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100194 res!792110) b!1191591))

(assert (= (and b!1191591 res!792108) b!1191583))

(assert (= (and b!1191583 res!792116) b!1191594))

(assert (= (and b!1191594 res!792112) b!1191585))

(assert (= (and b!1191585 res!792111) b!1191589))

(assert (= (and b!1191589 res!792117) b!1191584))

(assert (= (and b!1191584 res!792119) b!1191595))

(assert (= (and b!1191595 res!792113) b!1191593))

(assert (= (and b!1191593 res!792109) b!1191582))

(assert (= (and b!1191582 res!792114) b!1191596))

(assert (= (and b!1191596 (not res!792118)) b!1191588))

(assert (= (and b!1191588 (not res!792115)) b!1191590))

(assert (= (and b!1191592 condMapEmpty!46928) mapIsEmpty!46928))

(assert (= (and b!1191592 (not condMapEmpty!46928)) mapNonEmpty!46928))

(get-info :version)

(assert (= (and mapNonEmpty!46928 ((_ is ValueCellFull!14324) mapValue!46928)) b!1191587))

(assert (= (and b!1191592 ((_ is ValueCellFull!14324) mapDefault!46928)) b!1191586))

(assert (= start!100194 b!1191592))

(declare-fun b_lambda!20675 () Bool)

(assert (=> (not b_lambda!20675) (not b!1191588)))

(declare-fun t!38681 () Bool)

(declare-fun tb!10341 () Bool)

(assert (=> (and start!100194 (= defaultEntry!1004 defaultEntry!1004) t!38681) tb!10341))

(declare-fun result!21257 () Bool)

(assert (=> tb!10341 (= result!21257 tp_is_empty!30067)))

(assert (=> b!1191588 t!38681))

(declare-fun b_and!41945 () Bool)

(assert (= b_and!41943 (and (=> t!38681 result!21257) b_and!41945)))

(declare-fun m!1100451 () Bool)

(assert (=> mapNonEmpty!46928 m!1100451))

(declare-fun m!1100453 () Bool)

(assert (=> b!1191584 m!1100453))

(declare-fun m!1100455 () Bool)

(assert (=> b!1191588 m!1100455))

(declare-fun m!1100457 () Bool)

(assert (=> b!1191588 m!1100457))

(declare-fun m!1100459 () Bool)

(assert (=> b!1191588 m!1100459))

(declare-fun m!1100461 () Bool)

(assert (=> b!1191588 m!1100461))

(declare-fun m!1100463 () Bool)

(assert (=> b!1191591 m!1100463))

(declare-fun m!1100465 () Bool)

(assert (=> b!1191585 m!1100465))

(declare-fun m!1100467 () Bool)

(assert (=> b!1191582 m!1100467))

(declare-fun m!1100469 () Bool)

(assert (=> b!1191594 m!1100469))

(declare-fun m!1100471 () Bool)

(assert (=> b!1191595 m!1100471))

(declare-fun m!1100473 () Bool)

(assert (=> start!100194 m!1100473))

(declare-fun m!1100475 () Bool)

(assert (=> start!100194 m!1100475))

(declare-fun m!1100477 () Bool)

(assert (=> b!1191596 m!1100477))

(declare-fun m!1100479 () Bool)

(assert (=> b!1191596 m!1100479))

(declare-fun m!1100481 () Bool)

(assert (=> b!1191590 m!1100481))

(declare-fun m!1100483 () Bool)

(assert (=> b!1191590 m!1100483))

(assert (=> b!1191590 m!1100483))

(declare-fun m!1100485 () Bool)

(assert (=> b!1191590 m!1100485))

(declare-fun m!1100487 () Bool)

(assert (=> b!1191590 m!1100487))

(declare-fun m!1100489 () Bool)

(assert (=> b!1191593 m!1100489))

(declare-fun m!1100491 () Bool)

(assert (=> b!1191593 m!1100491))

(check-sat (not start!100194) tp_is_empty!30067 (not b!1191596) (not b!1191593) (not b_lambda!20675) (not b!1191584) (not b!1191582) (not b!1191594) (not b!1191591) (not b_next!25537) (not b!1191590) (not b!1191588) b_and!41945 (not b!1191585) (not mapNonEmpty!46928))
(check-sat b_and!41945 (not b_next!25537))
