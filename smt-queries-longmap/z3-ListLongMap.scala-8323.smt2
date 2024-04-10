; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101288 () Bool)

(assert start!101288)

(declare-fun b_free!26211 () Bool)

(declare-fun b_next!26211 () Bool)

(assert (=> start!101288 (= b_free!26211 (not b_next!26211))))

(declare-fun tp!91654 () Bool)

(declare-fun b_and!43539 () Bool)

(assert (=> start!101288 (= tp!91654 b_and!43539)))

(declare-fun b!1216980 () Bool)

(declare-fun res!808186 () Bool)

(declare-fun e!690914 () Bool)

(assert (=> b!1216980 (=> (not res!808186) (not e!690914))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216980 (= res!808186 (validMask!0 mask!1564))))

(declare-fun b!1216981 () Bool)

(declare-fun e!690913 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!46347 0))(
  ( (V!46348 (val!15514 Int)) )
))
(declare-datatypes ((ValueCell!14748 0))(
  ( (ValueCellFull!14748 (v!18167 V!46347)) (EmptyCell!14748) )
))
(declare-datatypes ((array!78601 0))(
  ( (array!78602 (arr!37935 (Array (_ BitVec 32) ValueCell!14748)) (size!38471 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78601)

(assert (=> b!1216981 (= e!690913 (bvslt from!1455 (size!38471 _values!996)))))

(declare-fun b!1216982 () Bool)

(declare-fun res!808181 () Bool)

(assert (=> b!1216982 (=> (not res!808181) (not e!690914))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216982 (= res!808181 (validKeyInArray!0 k0!934))))

(declare-fun b!1216983 () Bool)

(declare-fun e!690911 () Bool)

(assert (=> b!1216983 (= e!690911 e!690913)))

(declare-fun res!808187 () Bool)

(assert (=> b!1216983 (=> res!808187 e!690913)))

(declare-datatypes ((array!78603 0))(
  ( (array!78604 (arr!37936 (Array (_ BitVec 32) (_ BitVec 64))) (size!38472 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78603)

(assert (=> b!1216983 (= res!808187 (not (validKeyInArray!0 (select (arr!37936 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46347)

(declare-fun lt!553100 () array!78601)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553104 () array!78603)

(declare-fun minValue!944 () V!46347)

(declare-datatypes ((tuple2!19944 0))(
  ( (tuple2!19945 (_1!9983 (_ BitVec 64)) (_2!9983 V!46347)) )
))
(declare-datatypes ((List!26748 0))(
  ( (Nil!26745) (Cons!26744 (h!27953 tuple2!19944) (t!39939 List!26748)) )
))
(declare-datatypes ((ListLongMap!17913 0))(
  ( (ListLongMap!17914 (toList!8972 List!26748)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5399 (array!78603 array!78601 (_ BitVec 32) (_ BitVec 32) V!46347 V!46347 (_ BitVec 32) Int) ListLongMap!17913)

(declare-fun -!1889 (ListLongMap!17913 (_ BitVec 64)) ListLongMap!17913)

(assert (=> b!1216983 (= (getCurrentListMapNoExtraKeys!5399 lt!553104 lt!553100 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1889 (getCurrentListMapNoExtraKeys!5399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40350 0))(
  ( (Unit!40351) )
))
(declare-fun lt!553099 () Unit!40350)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1096 (array!78603 array!78601 (_ BitVec 32) (_ BitVec 32) V!46347 V!46347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40350)

(assert (=> b!1216983 (= lt!553099 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216984 () Bool)

(declare-fun res!808184 () Bool)

(assert (=> b!1216984 (=> (not res!808184) (not e!690914))))

(declare-datatypes ((List!26749 0))(
  ( (Nil!26746) (Cons!26745 (h!27954 (_ BitVec 64)) (t!39940 List!26749)) )
))
(declare-fun arrayNoDuplicates!0 (array!78603 (_ BitVec 32) List!26749) Bool)

(assert (=> b!1216984 (= res!808184 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26746))))

(declare-fun b!1216985 () Bool)

(declare-fun e!690917 () Bool)

(declare-fun tp_is_empty!30915 () Bool)

(assert (=> b!1216985 (= e!690917 tp_is_empty!30915)))

(declare-fun b!1216986 () Bool)

(declare-fun res!808176 () Bool)

(declare-fun e!690912 () Bool)

(assert (=> b!1216986 (=> (not res!808176) (not e!690912))))

(assert (=> b!1216986 (= res!808176 (arrayNoDuplicates!0 lt!553104 #b00000000000000000000000000000000 Nil!26746))))

(declare-fun b!1216987 () Bool)

(declare-fun res!808177 () Bool)

(assert (=> b!1216987 (=> (not res!808177) (not e!690914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78603 (_ BitVec 32)) Bool)

(assert (=> b!1216987 (= res!808177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48247 () Bool)

(declare-fun mapRes!48247 () Bool)

(assert (=> mapIsEmpty!48247 mapRes!48247))

(declare-fun b!1216988 () Bool)

(declare-fun res!808183 () Bool)

(assert (=> b!1216988 (=> (not res!808183) (not e!690914))))

(assert (=> b!1216988 (= res!808183 (= (select (arr!37936 _keys!1208) i!673) k0!934))))

(declare-fun b!1216990 () Bool)

(declare-fun res!808178 () Bool)

(assert (=> b!1216990 (=> (not res!808178) (not e!690914))))

(assert (=> b!1216990 (= res!808178 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38472 _keys!1208))))))

(declare-fun b!1216991 () Bool)

(assert (=> b!1216991 (= e!690914 e!690912)))

(declare-fun res!808180 () Bool)

(assert (=> b!1216991 (=> (not res!808180) (not e!690912))))

(assert (=> b!1216991 (= res!808180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553104 mask!1564))))

(assert (=> b!1216991 (= lt!553104 (array!78604 (store (arr!37936 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38472 _keys!1208)))))

(declare-fun b!1216992 () Bool)

(declare-fun e!690918 () Bool)

(assert (=> b!1216992 (= e!690918 tp_is_empty!30915)))

(declare-fun mapNonEmpty!48247 () Bool)

(declare-fun tp!91655 () Bool)

(assert (=> mapNonEmpty!48247 (= mapRes!48247 (and tp!91655 e!690918))))

(declare-fun mapRest!48247 () (Array (_ BitVec 32) ValueCell!14748))

(declare-fun mapValue!48247 () ValueCell!14748)

(declare-fun mapKey!48247 () (_ BitVec 32))

(assert (=> mapNonEmpty!48247 (= (arr!37935 _values!996) (store mapRest!48247 mapKey!48247 mapValue!48247))))

(declare-fun b!1216993 () Bool)

(declare-fun e!690916 () Bool)

(assert (=> b!1216993 (= e!690912 (not e!690916))))

(declare-fun res!808179 () Bool)

(assert (=> b!1216993 (=> res!808179 e!690916)))

(assert (=> b!1216993 (= res!808179 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216993 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553103 () Unit!40350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78603 (_ BitVec 64) (_ BitVec 32)) Unit!40350)

(assert (=> b!1216993 (= lt!553103 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216989 () Bool)

(assert (=> b!1216989 (= e!690916 e!690911)))

(declare-fun res!808182 () Bool)

(assert (=> b!1216989 (=> res!808182 e!690911)))

(assert (=> b!1216989 (= res!808182 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553101 () ListLongMap!17913)

(assert (=> b!1216989 (= lt!553101 (getCurrentListMapNoExtraKeys!5399 lt!553104 lt!553100 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3287 (Int (_ BitVec 64)) V!46347)

(assert (=> b!1216989 (= lt!553100 (array!78602 (store (arr!37935 _values!996) i!673 (ValueCellFull!14748 (dynLambda!3287 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38471 _values!996)))))

(declare-fun lt!553102 () ListLongMap!17913)

(assert (=> b!1216989 (= lt!553102 (getCurrentListMapNoExtraKeys!5399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!808175 () Bool)

(assert (=> start!101288 (=> (not res!808175) (not e!690914))))

(assert (=> start!101288 (= res!808175 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38472 _keys!1208))))))

(assert (=> start!101288 e!690914))

(assert (=> start!101288 tp_is_empty!30915))

(declare-fun array_inv!28880 (array!78603) Bool)

(assert (=> start!101288 (array_inv!28880 _keys!1208)))

(assert (=> start!101288 true))

(assert (=> start!101288 tp!91654))

(declare-fun e!690915 () Bool)

(declare-fun array_inv!28881 (array!78601) Bool)

(assert (=> start!101288 (and (array_inv!28881 _values!996) e!690915)))

(declare-fun b!1216994 () Bool)

(assert (=> b!1216994 (= e!690915 (and e!690917 mapRes!48247))))

(declare-fun condMapEmpty!48247 () Bool)

(declare-fun mapDefault!48247 () ValueCell!14748)

(assert (=> b!1216994 (= condMapEmpty!48247 (= (arr!37935 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14748)) mapDefault!48247)))))

(declare-fun b!1216995 () Bool)

(declare-fun res!808185 () Bool)

(assert (=> b!1216995 (=> (not res!808185) (not e!690914))))

(assert (=> b!1216995 (= res!808185 (and (= (size!38471 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38472 _keys!1208) (size!38471 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101288 res!808175) b!1216980))

(assert (= (and b!1216980 res!808186) b!1216995))

(assert (= (and b!1216995 res!808185) b!1216987))

(assert (= (and b!1216987 res!808177) b!1216984))

(assert (= (and b!1216984 res!808184) b!1216990))

(assert (= (and b!1216990 res!808178) b!1216982))

(assert (= (and b!1216982 res!808181) b!1216988))

(assert (= (and b!1216988 res!808183) b!1216991))

(assert (= (and b!1216991 res!808180) b!1216986))

(assert (= (and b!1216986 res!808176) b!1216993))

(assert (= (and b!1216993 (not res!808179)) b!1216989))

(assert (= (and b!1216989 (not res!808182)) b!1216983))

(assert (= (and b!1216983 (not res!808187)) b!1216981))

(assert (= (and b!1216994 condMapEmpty!48247) mapIsEmpty!48247))

(assert (= (and b!1216994 (not condMapEmpty!48247)) mapNonEmpty!48247))

(get-info :version)

(assert (= (and mapNonEmpty!48247 ((_ is ValueCellFull!14748) mapValue!48247)) b!1216992))

(assert (= (and b!1216994 ((_ is ValueCellFull!14748) mapDefault!48247)) b!1216985))

(assert (= start!101288 b!1216994))

(declare-fun b_lambda!21887 () Bool)

(assert (=> (not b_lambda!21887) (not b!1216989)))

(declare-fun t!39938 () Bool)

(declare-fun tb!11011 () Bool)

(assert (=> (and start!101288 (= defaultEntry!1004 defaultEntry!1004) t!39938) tb!11011))

(declare-fun result!22619 () Bool)

(assert (=> tb!11011 (= result!22619 tp_is_empty!30915)))

(assert (=> b!1216989 t!39938))

(declare-fun b_and!43541 () Bool)

(assert (= b_and!43539 (and (=> t!39938 result!22619) b_and!43541)))

(declare-fun m!1121683 () Bool)

(assert (=> b!1216986 m!1121683))

(declare-fun m!1121685 () Bool)

(assert (=> b!1216987 m!1121685))

(declare-fun m!1121687 () Bool)

(assert (=> start!101288 m!1121687))

(declare-fun m!1121689 () Bool)

(assert (=> start!101288 m!1121689))

(declare-fun m!1121691 () Bool)

(assert (=> b!1216989 m!1121691))

(declare-fun m!1121693 () Bool)

(assert (=> b!1216989 m!1121693))

(declare-fun m!1121695 () Bool)

(assert (=> b!1216989 m!1121695))

(declare-fun m!1121697 () Bool)

(assert (=> b!1216989 m!1121697))

(declare-fun m!1121699 () Bool)

(assert (=> b!1216993 m!1121699))

(declare-fun m!1121701 () Bool)

(assert (=> b!1216993 m!1121701))

(declare-fun m!1121703 () Bool)

(assert (=> b!1216980 m!1121703))

(declare-fun m!1121705 () Bool)

(assert (=> b!1216991 m!1121705))

(declare-fun m!1121707 () Bool)

(assert (=> b!1216991 m!1121707))

(declare-fun m!1121709 () Bool)

(assert (=> b!1216983 m!1121709))

(declare-fun m!1121711 () Bool)

(assert (=> b!1216983 m!1121711))

(declare-fun m!1121713 () Bool)

(assert (=> b!1216983 m!1121713))

(assert (=> b!1216983 m!1121709))

(declare-fun m!1121715 () Bool)

(assert (=> b!1216983 m!1121715))

(declare-fun m!1121717 () Bool)

(assert (=> b!1216983 m!1121717))

(declare-fun m!1121719 () Bool)

(assert (=> b!1216983 m!1121719))

(assert (=> b!1216983 m!1121717))

(declare-fun m!1121721 () Bool)

(assert (=> b!1216988 m!1121721))

(declare-fun m!1121723 () Bool)

(assert (=> b!1216982 m!1121723))

(declare-fun m!1121725 () Bool)

(assert (=> mapNonEmpty!48247 m!1121725))

(declare-fun m!1121727 () Bool)

(assert (=> b!1216984 m!1121727))

(check-sat (not b!1216989) (not b!1216984) b_and!43541 tp_is_empty!30915 (not b!1216983) (not b!1216986) (not b!1216987) (not b!1216980) (not b_next!26211) (not start!101288) (not b_lambda!21887) (not mapNonEmpty!48247) (not b!1216991) (not b!1216982) (not b!1216993))
(check-sat b_and!43541 (not b_next!26211))
