; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101456 () Bool)

(assert start!101456)

(declare-fun b_free!26143 () Bool)

(declare-fun b_next!26143 () Bool)

(assert (=> start!101456 (= b_free!26143 (not b_next!26143))))

(declare-fun tp!91450 () Bool)

(declare-fun b_and!43405 () Bool)

(assert (=> start!101456 (= tp!91450 b_and!43405)))

(declare-fun b!1216707 () Bool)

(declare-fun e!690968 () Bool)

(declare-fun e!690969 () Bool)

(declare-fun mapRes!48145 () Bool)

(assert (=> b!1216707 (= e!690968 (and e!690969 mapRes!48145))))

(declare-fun condMapEmpty!48145 () Bool)

(declare-datatypes ((V!46257 0))(
  ( (V!46258 (val!15480 Int)) )
))
(declare-datatypes ((ValueCell!14714 0))(
  ( (ValueCellFull!14714 (v!18129 V!46257)) (EmptyCell!14714) )
))
(declare-datatypes ((array!78509 0))(
  ( (array!78510 (arr!37883 (Array (_ BitVec 32) ValueCell!14714)) (size!38420 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78509)

(declare-fun mapDefault!48145 () ValueCell!14714)

(assert (=> b!1216707 (= condMapEmpty!48145 (= (arr!37883 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14714)) mapDefault!48145)))))

(declare-fun b!1216708 () Bool)

(declare-fun e!690967 () Bool)

(assert (=> b!1216708 (= e!690967 true)))

(declare-fun zeroValue!944 () V!46257)

(declare-datatypes ((tuple2!19916 0))(
  ( (tuple2!19917 (_1!9969 (_ BitVec 64)) (_2!9969 V!46257)) )
))
(declare-datatypes ((List!26720 0))(
  ( (Nil!26717) (Cons!26716 (h!27934 tuple2!19916) (t!39835 List!26720)) )
))
(declare-datatypes ((ListLongMap!17893 0))(
  ( (ListLongMap!17894 (toList!8962 List!26720)) )
))
(declare-fun lt!553089 () ListLongMap!17893)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46257)

(declare-datatypes ((array!78511 0))(
  ( (array!78512 (arr!37884 (Array (_ BitVec 32) (_ BitVec 64))) (size!38421 (_ BitVec 32))) )
))
(declare-fun lt!553092 () array!78511)

(declare-fun getCurrentListMapNoExtraKeys!5419 (array!78511 array!78509 (_ BitVec 32) (_ BitVec 32) V!46257 V!46257 (_ BitVec 32) Int) ListLongMap!17893)

(declare-fun dynLambda!3331 (Int (_ BitVec 64)) V!46257)

(assert (=> b!1216708 (= lt!553089 (getCurrentListMapNoExtraKeys!5419 lt!553092 (array!78510 (store (arr!37883 _values!996) i!673 (ValueCellFull!14714 (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38420 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!78511)

(declare-fun lt!553090 () ListLongMap!17893)

(assert (=> b!1216708 (= lt!553090 (getCurrentListMapNoExtraKeys!5419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216709 () Bool)

(declare-fun e!690965 () Bool)

(assert (=> b!1216709 (= e!690965 (not e!690967))))

(declare-fun res!807498 () Bool)

(assert (=> b!1216709 (=> res!807498 e!690967)))

(assert (=> b!1216709 (= res!807498 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216709 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40276 0))(
  ( (Unit!40277) )
))
(declare-fun lt!553091 () Unit!40276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78511 (_ BitVec 64) (_ BitVec 32)) Unit!40276)

(assert (=> b!1216709 (= lt!553091 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!807505 () Bool)

(declare-fun e!690970 () Bool)

(assert (=> start!101456 (=> (not res!807505) (not e!690970))))

(assert (=> start!101456 (= res!807505 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38421 _keys!1208))))))

(assert (=> start!101456 e!690970))

(declare-fun tp_is_empty!30847 () Bool)

(assert (=> start!101456 tp_is_empty!30847))

(declare-fun array_inv!28914 (array!78511) Bool)

(assert (=> start!101456 (array_inv!28914 _keys!1208)))

(assert (=> start!101456 true))

(assert (=> start!101456 tp!91450))

(declare-fun array_inv!28915 (array!78509) Bool)

(assert (=> start!101456 (and (array_inv!28915 _values!996) e!690968)))

(declare-fun b!1216710 () Bool)

(declare-fun res!807499 () Bool)

(assert (=> b!1216710 (=> (not res!807499) (not e!690970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78511 (_ BitVec 32)) Bool)

(assert (=> b!1216710 (= res!807499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216711 () Bool)

(assert (=> b!1216711 (= e!690970 e!690965)))

(declare-fun res!807495 () Bool)

(assert (=> b!1216711 (=> (not res!807495) (not e!690965))))

(assert (=> b!1216711 (= res!807495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553092 mask!1564))))

(assert (=> b!1216711 (= lt!553092 (array!78512 (store (arr!37884 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38421 _keys!1208)))))

(declare-fun b!1216712 () Bool)

(declare-fun res!807500 () Bool)

(assert (=> b!1216712 (=> (not res!807500) (not e!690970))))

(assert (=> b!1216712 (= res!807500 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38421 _keys!1208))))))

(declare-fun mapNonEmpty!48145 () Bool)

(declare-fun tp!91451 () Bool)

(declare-fun e!690964 () Bool)

(assert (=> mapNonEmpty!48145 (= mapRes!48145 (and tp!91451 e!690964))))

(declare-fun mapValue!48145 () ValueCell!14714)

(declare-fun mapKey!48145 () (_ BitVec 32))

(declare-fun mapRest!48145 () (Array (_ BitVec 32) ValueCell!14714))

(assert (=> mapNonEmpty!48145 (= (arr!37883 _values!996) (store mapRest!48145 mapKey!48145 mapValue!48145))))

(declare-fun b!1216713 () Bool)

(declare-fun res!807496 () Bool)

(assert (=> b!1216713 (=> (not res!807496) (not e!690970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216713 (= res!807496 (validKeyInArray!0 k0!934))))

(declare-fun b!1216714 () Bool)

(declare-fun res!807504 () Bool)

(assert (=> b!1216714 (=> (not res!807504) (not e!690970))))

(assert (=> b!1216714 (= res!807504 (and (= (size!38420 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38421 _keys!1208) (size!38420 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216715 () Bool)

(declare-fun res!807503 () Bool)

(assert (=> b!1216715 (=> (not res!807503) (not e!690970))))

(declare-datatypes ((List!26721 0))(
  ( (Nil!26718) (Cons!26717 (h!27935 (_ BitVec 64)) (t!39836 List!26721)) )
))
(declare-fun arrayNoDuplicates!0 (array!78511 (_ BitVec 32) List!26721) Bool)

(assert (=> b!1216715 (= res!807503 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26718))))

(declare-fun b!1216716 () Bool)

(declare-fun res!807501 () Bool)

(assert (=> b!1216716 (=> (not res!807501) (not e!690970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216716 (= res!807501 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48145 () Bool)

(assert (=> mapIsEmpty!48145 mapRes!48145))

(declare-fun b!1216717 () Bool)

(assert (=> b!1216717 (= e!690964 tp_is_empty!30847)))

(declare-fun b!1216718 () Bool)

(declare-fun res!807497 () Bool)

(assert (=> b!1216718 (=> (not res!807497) (not e!690970))))

(assert (=> b!1216718 (= res!807497 (= (select (arr!37884 _keys!1208) i!673) k0!934))))

(declare-fun b!1216719 () Bool)

(declare-fun res!807502 () Bool)

(assert (=> b!1216719 (=> (not res!807502) (not e!690965))))

(assert (=> b!1216719 (= res!807502 (arrayNoDuplicates!0 lt!553092 #b00000000000000000000000000000000 Nil!26718))))

(declare-fun b!1216720 () Bool)

(assert (=> b!1216720 (= e!690969 tp_is_empty!30847)))

(assert (= (and start!101456 res!807505) b!1216716))

(assert (= (and b!1216716 res!807501) b!1216714))

(assert (= (and b!1216714 res!807504) b!1216710))

(assert (= (and b!1216710 res!807499) b!1216715))

(assert (= (and b!1216715 res!807503) b!1216712))

(assert (= (and b!1216712 res!807500) b!1216713))

(assert (= (and b!1216713 res!807496) b!1216718))

(assert (= (and b!1216718 res!807497) b!1216711))

(assert (= (and b!1216711 res!807495) b!1216719))

(assert (= (and b!1216719 res!807502) b!1216709))

(assert (= (and b!1216709 (not res!807498)) b!1216708))

(assert (= (and b!1216707 condMapEmpty!48145) mapIsEmpty!48145))

(assert (= (and b!1216707 (not condMapEmpty!48145)) mapNonEmpty!48145))

(get-info :version)

(assert (= (and mapNonEmpty!48145 ((_ is ValueCellFull!14714) mapValue!48145)) b!1216717))

(assert (= (and b!1216707 ((_ is ValueCellFull!14714) mapDefault!48145)) b!1216720))

(assert (= start!101456 b!1216707))

(declare-fun b_lambda!21813 () Bool)

(assert (=> (not b_lambda!21813) (not b!1216708)))

(declare-fun t!39834 () Bool)

(declare-fun tb!10935 () Bool)

(assert (=> (and start!101456 (= defaultEntry!1004 defaultEntry!1004) t!39834) tb!10935))

(declare-fun result!22475 () Bool)

(assert (=> tb!10935 (= result!22475 tp_is_empty!30847)))

(assert (=> b!1216708 t!39834))

(declare-fun b_and!43407 () Bool)

(assert (= b_and!43405 (and (=> t!39834 result!22475) b_and!43407)))

(declare-fun m!1121985 () Bool)

(assert (=> b!1216719 m!1121985))

(declare-fun m!1121987 () Bool)

(assert (=> b!1216711 m!1121987))

(declare-fun m!1121989 () Bool)

(assert (=> b!1216711 m!1121989))

(declare-fun m!1121991 () Bool)

(assert (=> b!1216710 m!1121991))

(declare-fun m!1121993 () Bool)

(assert (=> start!101456 m!1121993))

(declare-fun m!1121995 () Bool)

(assert (=> start!101456 m!1121995))

(declare-fun m!1121997 () Bool)

(assert (=> b!1216716 m!1121997))

(declare-fun m!1121999 () Bool)

(assert (=> b!1216708 m!1121999))

(declare-fun m!1122001 () Bool)

(assert (=> b!1216708 m!1122001))

(declare-fun m!1122003 () Bool)

(assert (=> b!1216708 m!1122003))

(declare-fun m!1122005 () Bool)

(assert (=> b!1216708 m!1122005))

(declare-fun m!1122007 () Bool)

(assert (=> b!1216709 m!1122007))

(declare-fun m!1122009 () Bool)

(assert (=> b!1216709 m!1122009))

(declare-fun m!1122011 () Bool)

(assert (=> b!1216715 m!1122011))

(declare-fun m!1122013 () Bool)

(assert (=> mapNonEmpty!48145 m!1122013))

(declare-fun m!1122015 () Bool)

(assert (=> b!1216713 m!1122015))

(declare-fun m!1122017 () Bool)

(assert (=> b!1216718 m!1122017))

(check-sat (not start!101456) (not b!1216711) (not b!1216708) (not b_lambda!21813) b_and!43407 (not b!1216715) (not mapNonEmpty!48145) (not b!1216719) (not b!1216709) (not b!1216713) (not b!1216710) (not b_next!26143) (not b!1216716) tp_is_empty!30847)
(check-sat b_and!43407 (not b_next!26143))
