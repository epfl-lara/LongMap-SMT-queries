; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101664 () Bool)

(assert start!101664)

(declare-fun b_free!26385 () Bool)

(declare-fun b_next!26385 () Bool)

(assert (=> start!101664 (= b_free!26385 (not b_next!26385))))

(declare-fun tp!92197 () Bool)

(declare-fun b_and!44013 () Bool)

(assert (=> start!101664 (= tp!92197 b_and!44013)))

(declare-datatypes ((array!78961 0))(
  ( (array!78962 (arr!38108 (Array (_ BitVec 32) (_ BitVec 64))) (size!38644 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78961)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1223162 () Bool)

(declare-fun e!694661 () Bool)

(declare-fun arrayContainsKey!0 (array!78961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223162 (= e!694661 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48529 () Bool)

(declare-fun mapRes!48529 () Bool)

(declare-fun tp!92198 () Bool)

(declare-fun e!694667 () Bool)

(assert (=> mapNonEmpty!48529 (= mapRes!48529 (and tp!92198 e!694667))))

(declare-datatypes ((V!46579 0))(
  ( (V!46580 (val!15601 Int)) )
))
(declare-datatypes ((ValueCell!14835 0))(
  ( (ValueCellFull!14835 (v!18262 V!46579)) (EmptyCell!14835) )
))
(declare-fun mapRest!48529 () (Array (_ BitVec 32) ValueCell!14835))

(declare-fun mapValue!48529 () ValueCell!14835)

(declare-fun mapKey!48529 () (_ BitVec 32))

(declare-datatypes ((array!78963 0))(
  ( (array!78964 (arr!38109 (Array (_ BitVec 32) ValueCell!14835)) (size!38645 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78963)

(assert (=> mapNonEmpty!48529 (= (arr!38109 _values!996) (store mapRest!48529 mapKey!48529 mapValue!48529))))

(declare-fun b!1223163 () Bool)

(declare-fun res!812736 () Bool)

(declare-fun e!694666 () Bool)

(assert (=> b!1223163 (=> (not res!812736) (not e!694666))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223163 (= res!812736 (validMask!0 mask!1564))))

(declare-fun b!1223164 () Bool)

(declare-fun res!812735 () Bool)

(assert (=> b!1223164 (=> (not res!812735) (not e!694666))))

(assert (=> b!1223164 (= res!812735 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38644 _keys!1208))))))

(declare-fun b!1223165 () Bool)

(declare-fun e!694664 () Bool)

(assert (=> b!1223165 (= e!694666 e!694664)))

(declare-fun res!812732 () Bool)

(assert (=> b!1223165 (=> (not res!812732) (not e!694664))))

(declare-fun lt!556675 () array!78961)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78961 (_ BitVec 32)) Bool)

(assert (=> b!1223165 (= res!812732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556675 mask!1564))))

(assert (=> b!1223165 (= lt!556675 (array!78962 (store (arr!38108 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38644 _keys!1208)))))

(declare-fun b!1223166 () Bool)

(declare-fun res!812729 () Bool)

(assert (=> b!1223166 (=> (not res!812729) (not e!694666))))

(assert (=> b!1223166 (= res!812729 (= (select (arr!38108 _keys!1208) i!673) k0!934))))

(declare-fun b!1223167 () Bool)

(declare-fun e!694670 () Bool)

(declare-fun e!694668 () Bool)

(assert (=> b!1223167 (= e!694670 e!694668)))

(declare-fun res!812728 () Bool)

(assert (=> b!1223167 (=> res!812728 e!694668)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223167 (= res!812728 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46579)

(declare-datatypes ((tuple2!20100 0))(
  ( (tuple2!20101 (_1!10061 (_ BitVec 64)) (_2!10061 V!46579)) )
))
(declare-datatypes ((List!26901 0))(
  ( (Nil!26898) (Cons!26897 (h!28106 tuple2!20100) (t!40266 List!26901)) )
))
(declare-datatypes ((ListLongMap!18069 0))(
  ( (ListLongMap!18070 (toList!9050 List!26901)) )
))
(declare-fun lt!556673 () ListLongMap!18069)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556672 () array!78963)

(declare-fun minValue!944 () V!46579)

(declare-fun getCurrentListMapNoExtraKeys!5472 (array!78961 array!78963 (_ BitVec 32) (_ BitVec 32) V!46579 V!46579 (_ BitVec 32) Int) ListLongMap!18069)

(assert (=> b!1223167 (= lt!556673 (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556676 () V!46579)

(assert (=> b!1223167 (= lt!556672 (array!78964 (store (arr!38109 _values!996) i!673 (ValueCellFull!14835 lt!556676)) (size!38645 _values!996)))))

(declare-fun dynLambda!3347 (Int (_ BitVec 64)) V!46579)

(assert (=> b!1223167 (= lt!556676 (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556669 () ListLongMap!18069)

(assert (=> b!1223167 (= lt!556669 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223168 () Bool)

(declare-fun e!694662 () Bool)

(declare-fun e!694671 () Bool)

(assert (=> b!1223168 (= e!694662 (and e!694671 mapRes!48529))))

(declare-fun condMapEmpty!48529 () Bool)

(declare-fun mapDefault!48529 () ValueCell!14835)

(assert (=> b!1223168 (= condMapEmpty!48529 (= (arr!38109 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14835)) mapDefault!48529)))))

(declare-fun res!812731 () Bool)

(assert (=> start!101664 (=> (not res!812731) (not e!694666))))

(assert (=> start!101664 (= res!812731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38644 _keys!1208))))))

(assert (=> start!101664 e!694666))

(declare-fun tp_is_empty!31089 () Bool)

(assert (=> start!101664 tp_is_empty!31089))

(declare-fun array_inv!28994 (array!78961) Bool)

(assert (=> start!101664 (array_inv!28994 _keys!1208)))

(assert (=> start!101664 true))

(assert (=> start!101664 tp!92197))

(declare-fun array_inv!28995 (array!78963) Bool)

(assert (=> start!101664 (and (array_inv!28995 _values!996) e!694662)))

(declare-fun mapIsEmpty!48529 () Bool)

(assert (=> mapIsEmpty!48529 mapRes!48529))

(declare-fun b!1223169 () Bool)

(declare-datatypes ((Unit!40522 0))(
  ( (Unit!40523) )
))
(declare-fun e!694660 () Unit!40522)

(declare-fun Unit!40524 () Unit!40522)

(assert (=> b!1223169 (= e!694660 Unit!40524)))

(declare-fun lt!556677 () Unit!40522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78961 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40522)

(assert (=> b!1223169 (= lt!556677 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223169 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556667 () Unit!40522)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78961 (_ BitVec 32) (_ BitVec 32)) Unit!40522)

(assert (=> b!1223169 (= lt!556667 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26902 0))(
  ( (Nil!26899) (Cons!26898 (h!28107 (_ BitVec 64)) (t!40267 List!26902)) )
))
(declare-fun arrayNoDuplicates!0 (array!78961 (_ BitVec 32) List!26902) Bool)

(assert (=> b!1223169 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26899)))

(declare-fun lt!556668 () Unit!40522)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78961 (_ BitVec 64) (_ BitVec 32) List!26902) Unit!40522)

(assert (=> b!1223169 (= lt!556668 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26899))))

(assert (=> b!1223169 false))

(declare-fun b!1223170 () Bool)

(declare-fun res!812726 () Bool)

(assert (=> b!1223170 (=> (not res!812726) (not e!694664))))

(assert (=> b!1223170 (= res!812726 (arrayNoDuplicates!0 lt!556675 #b00000000000000000000000000000000 Nil!26899))))

(declare-fun b!1223171 () Bool)

(declare-fun e!694669 () Bool)

(assert (=> b!1223171 (= e!694668 e!694669)))

(declare-fun res!812734 () Bool)

(assert (=> b!1223171 (=> res!812734 e!694669)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223171 (= res!812734 (not (validKeyInArray!0 (select (arr!38108 _keys!1208) from!1455))))))

(declare-fun lt!556678 () ListLongMap!18069)

(declare-fun lt!556666 () ListLongMap!18069)

(assert (=> b!1223171 (= lt!556678 lt!556666)))

(declare-fun lt!556665 () ListLongMap!18069)

(declare-fun -!1953 (ListLongMap!18069 (_ BitVec 64)) ListLongMap!18069)

(assert (=> b!1223171 (= lt!556666 (-!1953 lt!556665 k0!934))))

(assert (=> b!1223171 (= lt!556678 (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223171 (= lt!556665 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556674 () Unit!40522)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1160 (array!78961 array!78963 (_ BitVec 32) (_ BitVec 32) V!46579 V!46579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40522)

(assert (=> b!1223171 (= lt!556674 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223172 () Bool)

(declare-fun res!812733 () Bool)

(assert (=> b!1223172 (=> (not res!812733) (not e!694666))))

(assert (=> b!1223172 (= res!812733 (validKeyInArray!0 k0!934))))

(declare-fun b!1223173 () Bool)

(declare-fun res!812724 () Bool)

(assert (=> b!1223173 (=> (not res!812724) (not e!694666))))

(assert (=> b!1223173 (= res!812724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223174 () Bool)

(assert (=> b!1223174 (= e!694671 tp_is_empty!31089)))

(declare-fun b!1223175 () Bool)

(declare-fun res!812738 () Bool)

(assert (=> b!1223175 (=> (not res!812738) (not e!694666))))

(assert (=> b!1223175 (= res!812738 (and (= (size!38645 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38644 _keys!1208) (size!38645 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223176 () Bool)

(declare-fun Unit!40525 () Unit!40522)

(assert (=> b!1223176 (= e!694660 Unit!40525)))

(declare-fun b!1223177 () Bool)

(declare-fun res!812727 () Bool)

(assert (=> b!1223177 (=> (not res!812727) (not e!694666))))

(assert (=> b!1223177 (= res!812727 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26899))))

(declare-fun b!1223178 () Bool)

(assert (=> b!1223178 (= e!694664 (not e!694670))))

(declare-fun res!812737 () Bool)

(assert (=> b!1223178 (=> res!812737 e!694670)))

(assert (=> b!1223178 (= res!812737 (bvsgt from!1455 i!673))))

(assert (=> b!1223178 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556664 () Unit!40522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78961 (_ BitVec 64) (_ BitVec 32)) Unit!40522)

(assert (=> b!1223178 (= lt!556664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223179 () Bool)

(declare-fun e!694665 () Bool)

(assert (=> b!1223179 (= e!694665 e!694661)))

(declare-fun res!812725 () Bool)

(assert (=> b!1223179 (=> res!812725 e!694661)))

(assert (=> b!1223179 (= res!812725 (not (= (select (arr!38108 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223180 () Bool)

(declare-fun lt!556670 () tuple2!20100)

(declare-fun +!4109 (ListLongMap!18069 tuple2!20100) ListLongMap!18069)

(assert (=> b!1223180 (= e!694669 (= lt!556669 (+!4109 lt!556665 lt!556670)))))

(assert (=> b!1223180 (not (= (select (arr!38108 _keys!1208) from!1455) k0!934))))

(declare-fun lt!556671 () Unit!40522)

(assert (=> b!1223180 (= lt!556671 e!694660)))

(declare-fun c!120359 () Bool)

(assert (=> b!1223180 (= c!120359 (= (select (arr!38108 _keys!1208) from!1455) k0!934))))

(assert (=> b!1223180 e!694665))

(declare-fun res!812730 () Bool)

(assert (=> b!1223180 (=> (not res!812730) (not e!694665))))

(assert (=> b!1223180 (= res!812730 (= lt!556673 (+!4109 lt!556666 lt!556670)))))

(declare-fun get!19458 (ValueCell!14835 V!46579) V!46579)

(assert (=> b!1223180 (= lt!556670 (tuple2!20101 (select (arr!38108 _keys!1208) from!1455) (get!19458 (select (arr!38109 _values!996) from!1455) lt!556676)))))

(declare-fun b!1223181 () Bool)

(assert (=> b!1223181 (= e!694667 tp_is_empty!31089)))

(assert (= (and start!101664 res!812731) b!1223163))

(assert (= (and b!1223163 res!812736) b!1223175))

(assert (= (and b!1223175 res!812738) b!1223173))

(assert (= (and b!1223173 res!812724) b!1223177))

(assert (= (and b!1223177 res!812727) b!1223164))

(assert (= (and b!1223164 res!812735) b!1223172))

(assert (= (and b!1223172 res!812733) b!1223166))

(assert (= (and b!1223166 res!812729) b!1223165))

(assert (= (and b!1223165 res!812732) b!1223170))

(assert (= (and b!1223170 res!812726) b!1223178))

(assert (= (and b!1223178 (not res!812737)) b!1223167))

(assert (= (and b!1223167 (not res!812728)) b!1223171))

(assert (= (and b!1223171 (not res!812734)) b!1223180))

(assert (= (and b!1223180 res!812730) b!1223179))

(assert (= (and b!1223179 (not res!812725)) b!1223162))

(assert (= (and b!1223180 c!120359) b!1223169))

(assert (= (and b!1223180 (not c!120359)) b!1223176))

(assert (= (and b!1223168 condMapEmpty!48529) mapIsEmpty!48529))

(assert (= (and b!1223168 (not condMapEmpty!48529)) mapNonEmpty!48529))

(get-info :version)

(assert (= (and mapNonEmpty!48529 ((_ is ValueCellFull!14835) mapValue!48529)) b!1223181))

(assert (= (and b!1223168 ((_ is ValueCellFull!14835) mapDefault!48529)) b!1223174))

(assert (= start!101664 b!1223168))

(declare-fun b_lambda!22327 () Bool)

(assert (=> (not b_lambda!22327) (not b!1223167)))

(declare-fun t!40265 () Bool)

(declare-fun tb!11185 () Bool)

(assert (=> (and start!101664 (= defaultEntry!1004 defaultEntry!1004) t!40265) tb!11185))

(declare-fun result!22981 () Bool)

(assert (=> tb!11185 (= result!22981 tp_is_empty!31089)))

(assert (=> b!1223167 t!40265))

(declare-fun b_and!44015 () Bool)

(assert (= b_and!44013 (and (=> t!40265 result!22981) b_and!44015)))

(declare-fun m!1128119 () Bool)

(assert (=> b!1223172 m!1128119))

(declare-fun m!1128121 () Bool)

(assert (=> b!1223169 m!1128121))

(declare-fun m!1128123 () Bool)

(assert (=> b!1223169 m!1128123))

(declare-fun m!1128125 () Bool)

(assert (=> b!1223169 m!1128125))

(declare-fun m!1128127 () Bool)

(assert (=> b!1223169 m!1128127))

(declare-fun m!1128129 () Bool)

(assert (=> b!1223169 m!1128129))

(declare-fun m!1128131 () Bool)

(assert (=> b!1223162 m!1128131))

(declare-fun m!1128133 () Bool)

(assert (=> b!1223167 m!1128133))

(declare-fun m!1128135 () Bool)

(assert (=> b!1223167 m!1128135))

(declare-fun m!1128137 () Bool)

(assert (=> b!1223167 m!1128137))

(declare-fun m!1128139 () Bool)

(assert (=> b!1223167 m!1128139))

(declare-fun m!1128141 () Bool)

(assert (=> mapNonEmpty!48529 m!1128141))

(declare-fun m!1128143 () Bool)

(assert (=> b!1223163 m!1128143))

(declare-fun m!1128145 () Bool)

(assert (=> b!1223170 m!1128145))

(declare-fun m!1128147 () Bool)

(assert (=> b!1223177 m!1128147))

(declare-fun m!1128149 () Bool)

(assert (=> b!1223180 m!1128149))

(declare-fun m!1128151 () Bool)

(assert (=> b!1223180 m!1128151))

(declare-fun m!1128153 () Bool)

(assert (=> b!1223180 m!1128153))

(assert (=> b!1223180 m!1128151))

(declare-fun m!1128155 () Bool)

(assert (=> b!1223180 m!1128155))

(declare-fun m!1128157 () Bool)

(assert (=> b!1223180 m!1128157))

(declare-fun m!1128159 () Bool)

(assert (=> start!101664 m!1128159))

(declare-fun m!1128161 () Bool)

(assert (=> start!101664 m!1128161))

(declare-fun m!1128163 () Bool)

(assert (=> b!1223178 m!1128163))

(declare-fun m!1128165 () Bool)

(assert (=> b!1223178 m!1128165))

(declare-fun m!1128167 () Bool)

(assert (=> b!1223171 m!1128167))

(declare-fun m!1128169 () Bool)

(assert (=> b!1223171 m!1128169))

(declare-fun m!1128171 () Bool)

(assert (=> b!1223171 m!1128171))

(declare-fun m!1128173 () Bool)

(assert (=> b!1223171 m!1128173))

(assert (=> b!1223171 m!1128157))

(declare-fun m!1128175 () Bool)

(assert (=> b!1223171 m!1128175))

(assert (=> b!1223171 m!1128157))

(declare-fun m!1128177 () Bool)

(assert (=> b!1223165 m!1128177))

(declare-fun m!1128179 () Bool)

(assert (=> b!1223165 m!1128179))

(assert (=> b!1223179 m!1128157))

(declare-fun m!1128181 () Bool)

(assert (=> b!1223166 m!1128181))

(declare-fun m!1128183 () Bool)

(assert (=> b!1223173 m!1128183))

(check-sat (not b!1223180) (not b!1223172) b_and!44015 (not b!1223167) (not b!1223171) (not b!1223170) (not b!1223162) (not b!1223178) (not b!1223169) tp_is_empty!31089 (not b!1223165) (not b!1223173) (not b!1223177) (not mapNonEmpty!48529) (not b_lambda!22327) (not b_next!26385) (not b!1223163) (not start!101664))
(check-sat b_and!44015 (not b_next!26385))
(get-model)

(declare-fun b_lambda!22331 () Bool)

(assert (= b_lambda!22327 (or (and start!101664 b_free!26385) b_lambda!22331)))

(check-sat (not b!1223180) (not b!1223172) b_and!44015 (not b!1223167) (not b!1223171) (not b!1223170) (not b!1223162) (not b!1223178) (not b!1223169) tp_is_empty!31089 (not b_next!26385) (not b!1223165) (not b!1223177) (not mapNonEmpty!48529) (not b!1223163) (not start!101664) (not b!1223173) (not b_lambda!22331))
(check-sat b_and!44015 (not b_next!26385))
(get-model)

(declare-fun b!1223256 () Bool)

(declare-fun e!694719 () Bool)

(declare-fun e!694718 () Bool)

(assert (=> b!1223256 (= e!694719 e!694718)))

(declare-fun res!812790 () Bool)

(assert (=> b!1223256 (=> (not res!812790) (not e!694718))))

(declare-fun e!694716 () Bool)

(assert (=> b!1223256 (= res!812790 (not e!694716))))

(declare-fun res!812791 () Bool)

(assert (=> b!1223256 (=> (not res!812791) (not e!694716))))

(assert (=> b!1223256 (= res!812791 (validKeyInArray!0 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133919 () Bool)

(declare-fun res!812792 () Bool)

(assert (=> d!133919 (=> res!812792 e!694719)))

(assert (=> d!133919 (= res!812792 (bvsge #b00000000000000000000000000000000 (size!38644 _keys!1208)))))

(assert (=> d!133919 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26899) e!694719)))

(declare-fun bm!60749 () Bool)

(declare-fun call!60752 () Bool)

(declare-fun c!120365 () Bool)

(assert (=> bm!60749 (= call!60752 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120365 (Cons!26898 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000) Nil!26899) Nil!26899)))))

(declare-fun b!1223257 () Bool)

(declare-fun contains!7034 (List!26902 (_ BitVec 64)) Bool)

(assert (=> b!1223257 (= e!694716 (contains!7034 Nil!26899 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1223258 () Bool)

(declare-fun e!694717 () Bool)

(assert (=> b!1223258 (= e!694717 call!60752)))

(declare-fun b!1223259 () Bool)

(assert (=> b!1223259 (= e!694717 call!60752)))

(declare-fun b!1223260 () Bool)

(assert (=> b!1223260 (= e!694718 e!694717)))

(assert (=> b!1223260 (= c!120365 (validKeyInArray!0 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133919 (not res!812792)) b!1223256))

(assert (= (and b!1223256 res!812791) b!1223257))

(assert (= (and b!1223256 res!812790) b!1223260))

(assert (= (and b!1223260 c!120365) b!1223258))

(assert (= (and b!1223260 (not c!120365)) b!1223259))

(assert (= (or b!1223258 b!1223259) bm!60749))

(declare-fun m!1128251 () Bool)

(assert (=> b!1223256 m!1128251))

(assert (=> b!1223256 m!1128251))

(declare-fun m!1128253 () Bool)

(assert (=> b!1223256 m!1128253))

(assert (=> bm!60749 m!1128251))

(declare-fun m!1128255 () Bool)

(assert (=> bm!60749 m!1128255))

(assert (=> b!1223257 m!1128251))

(assert (=> b!1223257 m!1128251))

(declare-fun m!1128257 () Bool)

(assert (=> b!1223257 m!1128257))

(assert (=> b!1223260 m!1128251))

(assert (=> b!1223260 m!1128251))

(assert (=> b!1223260 m!1128253))

(assert (=> b!1223177 d!133919))

(declare-fun b!1223285 () Bool)

(declare-fun e!694736 () ListLongMap!18069)

(declare-fun call!60755 () ListLongMap!18069)

(assert (=> b!1223285 (= e!694736 call!60755)))

(declare-fun b!1223286 () Bool)

(declare-fun e!694740 () Bool)

(declare-fun lt!556741 () ListLongMap!18069)

(declare-fun isEmpty!1001 (ListLongMap!18069) Bool)

(assert (=> b!1223286 (= e!694740 (isEmpty!1001 lt!556741))))

(declare-fun b!1223287 () Bool)

(declare-fun lt!556740 () Unit!40522)

(declare-fun lt!556743 () Unit!40522)

(assert (=> b!1223287 (= lt!556740 lt!556743)))

(declare-fun lt!556744 () ListLongMap!18069)

(declare-fun lt!556739 () (_ BitVec 64))

(declare-fun lt!556742 () V!46579)

(declare-fun lt!556738 () (_ BitVec 64))

(declare-fun contains!7035 (ListLongMap!18069 (_ BitVec 64)) Bool)

(assert (=> b!1223287 (not (contains!7035 (+!4109 lt!556744 (tuple2!20101 lt!556739 lt!556742)) lt!556738))))

(declare-fun addStillNotContains!305 (ListLongMap!18069 (_ BitVec 64) V!46579 (_ BitVec 64)) Unit!40522)

(assert (=> b!1223287 (= lt!556743 (addStillNotContains!305 lt!556744 lt!556739 lt!556742 lt!556738))))

(assert (=> b!1223287 (= lt!556738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223287 (= lt!556742 (get!19458 (select (arr!38109 lt!556672) from!1455) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223287 (= lt!556739 (select (arr!38108 lt!556675) from!1455))))

(assert (=> b!1223287 (= lt!556744 call!60755)))

(assert (=> b!1223287 (= e!694736 (+!4109 call!60755 (tuple2!20101 (select (arr!38108 lt!556675) from!1455) (get!19458 (select (arr!38109 lt!556672) from!1455) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223288 () Bool)

(assert (=> b!1223288 (= e!694740 (= lt!556741 (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223289 () Bool)

(declare-fun e!694739 () Bool)

(declare-fun e!694737 () Bool)

(assert (=> b!1223289 (= e!694739 e!694737)))

(assert (=> b!1223289 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38644 lt!556675)))))

(declare-fun res!812804 () Bool)

(assert (=> b!1223289 (= res!812804 (contains!7035 lt!556741 (select (arr!38108 lt!556675) from!1455)))))

(assert (=> b!1223289 (=> (not res!812804) (not e!694737))))

(declare-fun b!1223290 () Bool)

(assert (=> b!1223290 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38644 lt!556675)))))

(assert (=> b!1223290 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38645 lt!556672)))))

(declare-fun apply!977 (ListLongMap!18069 (_ BitVec 64)) V!46579)

(assert (=> b!1223290 (= e!694737 (= (apply!977 lt!556741 (select (arr!38108 lt!556675) from!1455)) (get!19458 (select (arr!38109 lt!556672) from!1455) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1223291 () Bool)

(declare-fun e!694735 () ListLongMap!18069)

(assert (=> b!1223291 (= e!694735 e!694736)))

(declare-fun c!120376 () Bool)

(assert (=> b!1223291 (= c!120376 (validKeyInArray!0 (select (arr!38108 lt!556675) from!1455)))))

(declare-fun b!1223292 () Bool)

(assert (=> b!1223292 (= e!694735 (ListLongMap!18070 Nil!26898))))

(declare-fun b!1223293 () Bool)

(declare-fun e!694738 () Bool)

(assert (=> b!1223293 (= e!694738 e!694739)))

(declare-fun c!120377 () Bool)

(declare-fun e!694734 () Bool)

(assert (=> b!1223293 (= c!120377 e!694734)))

(declare-fun res!812801 () Bool)

(assert (=> b!1223293 (=> (not res!812801) (not e!694734))))

(assert (=> b!1223293 (= res!812801 (bvslt from!1455 (size!38644 lt!556675)))))

(declare-fun d!133921 () Bool)

(assert (=> d!133921 e!694738))

(declare-fun res!812803 () Bool)

(assert (=> d!133921 (=> (not res!812803) (not e!694738))))

(assert (=> d!133921 (= res!812803 (not (contains!7035 lt!556741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133921 (= lt!556741 e!694735)))

(declare-fun c!120374 () Bool)

(assert (=> d!133921 (= c!120374 (bvsge from!1455 (size!38644 lt!556675)))))

(assert (=> d!133921 (validMask!0 mask!1564)))

(assert (=> d!133921 (= (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!556741)))

(declare-fun b!1223294 () Bool)

(declare-fun res!812802 () Bool)

(assert (=> b!1223294 (=> (not res!812802) (not e!694738))))

(assert (=> b!1223294 (= res!812802 (not (contains!7035 lt!556741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223295 () Bool)

(assert (=> b!1223295 (= e!694734 (validKeyInArray!0 (select (arr!38108 lt!556675) from!1455)))))

(assert (=> b!1223295 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60752 () Bool)

(assert (=> bm!60752 (= call!60755 (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223296 () Bool)

(assert (=> b!1223296 (= e!694739 e!694740)))

(declare-fun c!120375 () Bool)

(assert (=> b!1223296 (= c!120375 (bvslt from!1455 (size!38644 lt!556675)))))

(assert (= (and d!133921 c!120374) b!1223292))

(assert (= (and d!133921 (not c!120374)) b!1223291))

(assert (= (and b!1223291 c!120376) b!1223287))

(assert (= (and b!1223291 (not c!120376)) b!1223285))

(assert (= (or b!1223287 b!1223285) bm!60752))

(assert (= (and d!133921 res!812803) b!1223294))

(assert (= (and b!1223294 res!812802) b!1223293))

(assert (= (and b!1223293 res!812801) b!1223295))

(assert (= (and b!1223293 c!120377) b!1223289))

(assert (= (and b!1223293 (not c!120377)) b!1223296))

(assert (= (and b!1223289 res!812804) b!1223290))

(assert (= (and b!1223296 c!120375) b!1223288))

(assert (= (and b!1223296 (not c!120375)) b!1223286))

(declare-fun b_lambda!22333 () Bool)

(assert (=> (not b_lambda!22333) (not b!1223287)))

(assert (=> b!1223287 t!40265))

(declare-fun b_and!44021 () Bool)

(assert (= b_and!44015 (and (=> t!40265 result!22981) b_and!44021)))

(declare-fun b_lambda!22335 () Bool)

(assert (=> (not b_lambda!22335) (not b!1223290)))

(assert (=> b!1223290 t!40265))

(declare-fun b_and!44023 () Bool)

(assert (= b_and!44021 (and (=> t!40265 result!22981) b_and!44023)))

(declare-fun m!1128259 () Bool)

(assert (=> b!1223294 m!1128259))

(declare-fun m!1128261 () Bool)

(assert (=> bm!60752 m!1128261))

(declare-fun m!1128263 () Bool)

(assert (=> b!1223287 m!1128263))

(declare-fun m!1128265 () Bool)

(assert (=> b!1223287 m!1128265))

(declare-fun m!1128267 () Bool)

(assert (=> b!1223287 m!1128267))

(declare-fun m!1128269 () Bool)

(assert (=> b!1223287 m!1128269))

(assert (=> b!1223287 m!1128137))

(declare-fun m!1128271 () Bool)

(assert (=> b!1223287 m!1128271))

(assert (=> b!1223287 m!1128137))

(declare-fun m!1128273 () Bool)

(assert (=> b!1223287 m!1128273))

(assert (=> b!1223287 m!1128269))

(assert (=> b!1223287 m!1128263))

(declare-fun m!1128275 () Bool)

(assert (=> b!1223287 m!1128275))

(declare-fun m!1128277 () Bool)

(assert (=> d!133921 m!1128277))

(assert (=> d!133921 m!1128143))

(assert (=> b!1223290 m!1128269))

(assert (=> b!1223290 m!1128137))

(assert (=> b!1223290 m!1128271))

(assert (=> b!1223290 m!1128137))

(assert (=> b!1223290 m!1128273))

(assert (=> b!1223290 m!1128269))

(assert (=> b!1223290 m!1128273))

(declare-fun m!1128279 () Bool)

(assert (=> b!1223290 m!1128279))

(assert (=> b!1223289 m!1128273))

(assert (=> b!1223289 m!1128273))

(declare-fun m!1128281 () Bool)

(assert (=> b!1223289 m!1128281))

(declare-fun m!1128283 () Bool)

(assert (=> b!1223286 m!1128283))

(assert (=> b!1223291 m!1128273))

(assert (=> b!1223291 m!1128273))

(declare-fun m!1128285 () Bool)

(assert (=> b!1223291 m!1128285))

(assert (=> b!1223295 m!1128273))

(assert (=> b!1223295 m!1128273))

(assert (=> b!1223295 m!1128285))

(assert (=> b!1223288 m!1128261))

(assert (=> b!1223167 d!133921))

(declare-fun b!1223297 () Bool)

(declare-fun e!694743 () ListLongMap!18069)

(declare-fun call!60756 () ListLongMap!18069)

(assert (=> b!1223297 (= e!694743 call!60756)))

(declare-fun b!1223298 () Bool)

(declare-fun e!694747 () Bool)

(declare-fun lt!556748 () ListLongMap!18069)

(assert (=> b!1223298 (= e!694747 (isEmpty!1001 lt!556748))))

(declare-fun b!1223299 () Bool)

(declare-fun lt!556747 () Unit!40522)

(declare-fun lt!556750 () Unit!40522)

(assert (=> b!1223299 (= lt!556747 lt!556750)))

(declare-fun lt!556746 () (_ BitVec 64))

(declare-fun lt!556751 () ListLongMap!18069)

(declare-fun lt!556749 () V!46579)

(declare-fun lt!556745 () (_ BitVec 64))

(assert (=> b!1223299 (not (contains!7035 (+!4109 lt!556751 (tuple2!20101 lt!556746 lt!556749)) lt!556745))))

(assert (=> b!1223299 (= lt!556750 (addStillNotContains!305 lt!556751 lt!556746 lt!556749 lt!556745))))

(assert (=> b!1223299 (= lt!556745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223299 (= lt!556749 (get!19458 (select (arr!38109 _values!996) from!1455) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223299 (= lt!556746 (select (arr!38108 _keys!1208) from!1455))))

(assert (=> b!1223299 (= lt!556751 call!60756)))

(assert (=> b!1223299 (= e!694743 (+!4109 call!60756 (tuple2!20101 (select (arr!38108 _keys!1208) from!1455) (get!19458 (select (arr!38109 _values!996) from!1455) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223300 () Bool)

(assert (=> b!1223300 (= e!694747 (= lt!556748 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223301 () Bool)

(declare-fun e!694746 () Bool)

(declare-fun e!694744 () Bool)

(assert (=> b!1223301 (= e!694746 e!694744)))

(assert (=> b!1223301 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38644 _keys!1208)))))

(declare-fun res!812808 () Bool)

(assert (=> b!1223301 (= res!812808 (contains!7035 lt!556748 (select (arr!38108 _keys!1208) from!1455)))))

(assert (=> b!1223301 (=> (not res!812808) (not e!694744))))

(declare-fun b!1223302 () Bool)

(assert (=> b!1223302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38644 _keys!1208)))))

(assert (=> b!1223302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38645 _values!996)))))

(assert (=> b!1223302 (= e!694744 (= (apply!977 lt!556748 (select (arr!38108 _keys!1208) from!1455)) (get!19458 (select (arr!38109 _values!996) from!1455) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1223303 () Bool)

(declare-fun e!694742 () ListLongMap!18069)

(assert (=> b!1223303 (= e!694742 e!694743)))

(declare-fun c!120380 () Bool)

(assert (=> b!1223303 (= c!120380 (validKeyInArray!0 (select (arr!38108 _keys!1208) from!1455)))))

(declare-fun b!1223304 () Bool)

(assert (=> b!1223304 (= e!694742 (ListLongMap!18070 Nil!26898))))

(declare-fun b!1223305 () Bool)

(declare-fun e!694745 () Bool)

(assert (=> b!1223305 (= e!694745 e!694746)))

(declare-fun c!120381 () Bool)

(declare-fun e!694741 () Bool)

(assert (=> b!1223305 (= c!120381 e!694741)))

(declare-fun res!812805 () Bool)

(assert (=> b!1223305 (=> (not res!812805) (not e!694741))))

(assert (=> b!1223305 (= res!812805 (bvslt from!1455 (size!38644 _keys!1208)))))

(declare-fun d!133923 () Bool)

(assert (=> d!133923 e!694745))

(declare-fun res!812807 () Bool)

(assert (=> d!133923 (=> (not res!812807) (not e!694745))))

(assert (=> d!133923 (= res!812807 (not (contains!7035 lt!556748 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133923 (= lt!556748 e!694742)))

(declare-fun c!120378 () Bool)

(assert (=> d!133923 (= c!120378 (bvsge from!1455 (size!38644 _keys!1208)))))

(assert (=> d!133923 (validMask!0 mask!1564)))

(assert (=> d!133923 (= (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!556748)))

(declare-fun b!1223306 () Bool)

(declare-fun res!812806 () Bool)

(assert (=> b!1223306 (=> (not res!812806) (not e!694745))))

(assert (=> b!1223306 (= res!812806 (not (contains!7035 lt!556748 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223307 () Bool)

(assert (=> b!1223307 (= e!694741 (validKeyInArray!0 (select (arr!38108 _keys!1208) from!1455)))))

(assert (=> b!1223307 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60753 () Bool)

(assert (=> bm!60753 (= call!60756 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223308 () Bool)

(assert (=> b!1223308 (= e!694746 e!694747)))

(declare-fun c!120379 () Bool)

(assert (=> b!1223308 (= c!120379 (bvslt from!1455 (size!38644 _keys!1208)))))

(assert (= (and d!133923 c!120378) b!1223304))

(assert (= (and d!133923 (not c!120378)) b!1223303))

(assert (= (and b!1223303 c!120380) b!1223299))

(assert (= (and b!1223303 (not c!120380)) b!1223297))

(assert (= (or b!1223299 b!1223297) bm!60753))

(assert (= (and d!133923 res!812807) b!1223306))

(assert (= (and b!1223306 res!812806) b!1223305))

(assert (= (and b!1223305 res!812805) b!1223307))

(assert (= (and b!1223305 c!120381) b!1223301))

(assert (= (and b!1223305 (not c!120381)) b!1223308))

(assert (= (and b!1223301 res!812808) b!1223302))

(assert (= (and b!1223308 c!120379) b!1223300))

(assert (= (and b!1223308 (not c!120379)) b!1223298))

(declare-fun b_lambda!22337 () Bool)

(assert (=> (not b_lambda!22337) (not b!1223299)))

(assert (=> b!1223299 t!40265))

(declare-fun b_and!44025 () Bool)

(assert (= b_and!44023 (and (=> t!40265 result!22981) b_and!44025)))

(declare-fun b_lambda!22339 () Bool)

(assert (=> (not b_lambda!22339) (not b!1223302)))

(assert (=> b!1223302 t!40265))

(declare-fun b_and!44027 () Bool)

(assert (= b_and!44025 (and (=> t!40265 result!22981) b_and!44027)))

(declare-fun m!1128287 () Bool)

(assert (=> b!1223306 m!1128287))

(declare-fun m!1128289 () Bool)

(assert (=> bm!60753 m!1128289))

(declare-fun m!1128291 () Bool)

(assert (=> b!1223299 m!1128291))

(declare-fun m!1128293 () Bool)

(assert (=> b!1223299 m!1128293))

(declare-fun m!1128295 () Bool)

(assert (=> b!1223299 m!1128295))

(assert (=> b!1223299 m!1128151))

(assert (=> b!1223299 m!1128137))

(declare-fun m!1128297 () Bool)

(assert (=> b!1223299 m!1128297))

(assert (=> b!1223299 m!1128137))

(assert (=> b!1223299 m!1128157))

(assert (=> b!1223299 m!1128151))

(assert (=> b!1223299 m!1128291))

(declare-fun m!1128299 () Bool)

(assert (=> b!1223299 m!1128299))

(declare-fun m!1128301 () Bool)

(assert (=> d!133923 m!1128301))

(assert (=> d!133923 m!1128143))

(assert (=> b!1223302 m!1128151))

(assert (=> b!1223302 m!1128137))

(assert (=> b!1223302 m!1128297))

(assert (=> b!1223302 m!1128137))

(assert (=> b!1223302 m!1128157))

(assert (=> b!1223302 m!1128151))

(assert (=> b!1223302 m!1128157))

(declare-fun m!1128303 () Bool)

(assert (=> b!1223302 m!1128303))

(assert (=> b!1223301 m!1128157))

(assert (=> b!1223301 m!1128157))

(declare-fun m!1128305 () Bool)

(assert (=> b!1223301 m!1128305))

(declare-fun m!1128307 () Bool)

(assert (=> b!1223298 m!1128307))

(assert (=> b!1223303 m!1128157))

(assert (=> b!1223303 m!1128157))

(assert (=> b!1223303 m!1128175))

(assert (=> b!1223307 m!1128157))

(assert (=> b!1223307 m!1128157))

(assert (=> b!1223307 m!1128175))

(assert (=> b!1223300 m!1128289))

(assert (=> b!1223167 d!133923))

(declare-fun d!133925 () Bool)

(declare-fun res!812813 () Bool)

(declare-fun e!694752 () Bool)

(assert (=> d!133925 (=> res!812813 e!694752)))

(assert (=> d!133925 (= res!812813 (= (select (arr!38108 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133925 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!694752)))

(declare-fun b!1223313 () Bool)

(declare-fun e!694753 () Bool)

(assert (=> b!1223313 (= e!694752 e!694753)))

(declare-fun res!812814 () Bool)

(assert (=> b!1223313 (=> (not res!812814) (not e!694753))))

(assert (=> b!1223313 (= res!812814 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38644 _keys!1208)))))

(declare-fun b!1223314 () Bool)

(assert (=> b!1223314 (= e!694753 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133925 (not res!812813)) b!1223313))

(assert (= (and b!1223313 res!812814) b!1223314))

(assert (=> d!133925 m!1128251))

(declare-fun m!1128309 () Bool)

(assert (=> b!1223314 m!1128309))

(assert (=> b!1223178 d!133925))

(declare-fun d!133927 () Bool)

(assert (=> d!133927 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556754 () Unit!40522)

(declare-fun choose!13 (array!78961 (_ BitVec 64) (_ BitVec 32)) Unit!40522)

(assert (=> d!133927 (= lt!556754 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133927 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133927 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!556754)))

(declare-fun bs!34411 () Bool)

(assert (= bs!34411 d!133927))

(assert (=> bs!34411 m!1128163))

(declare-fun m!1128311 () Bool)

(assert (=> bs!34411 m!1128311))

(assert (=> b!1223178 d!133927))

(declare-fun b!1223323 () Bool)

(declare-fun e!694761 () Bool)

(declare-fun e!694762 () Bool)

(assert (=> b!1223323 (= e!694761 e!694762)))

(declare-fun lt!556762 () (_ BitVec 64))

(assert (=> b!1223323 (= lt!556762 (select (arr!38108 lt!556675) #b00000000000000000000000000000000))))

(declare-fun lt!556763 () Unit!40522)

(assert (=> b!1223323 (= lt!556763 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!556675 lt!556762 #b00000000000000000000000000000000))))

(assert (=> b!1223323 (arrayContainsKey!0 lt!556675 lt!556762 #b00000000000000000000000000000000)))

(declare-fun lt!556761 () Unit!40522)

(assert (=> b!1223323 (= lt!556761 lt!556763)))

(declare-fun res!812820 () Bool)

(declare-datatypes ((SeekEntryResult!9950 0))(
  ( (MissingZero!9950 (index!42171 (_ BitVec 32))) (Found!9950 (index!42172 (_ BitVec 32))) (Intermediate!9950 (undefined!10762 Bool) (index!42173 (_ BitVec 32)) (x!107708 (_ BitVec 32))) (Undefined!9950) (MissingVacant!9950 (index!42174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78961 (_ BitVec 32)) SeekEntryResult!9950)

(assert (=> b!1223323 (= res!812820 (= (seekEntryOrOpen!0 (select (arr!38108 lt!556675) #b00000000000000000000000000000000) lt!556675 mask!1564) (Found!9950 #b00000000000000000000000000000000)))))

(assert (=> b!1223323 (=> (not res!812820) (not e!694762))))

(declare-fun d!133929 () Bool)

(declare-fun res!812819 () Bool)

(declare-fun e!694760 () Bool)

(assert (=> d!133929 (=> res!812819 e!694760)))

(assert (=> d!133929 (= res!812819 (bvsge #b00000000000000000000000000000000 (size!38644 lt!556675)))))

(assert (=> d!133929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556675 mask!1564) e!694760)))

(declare-fun b!1223324 () Bool)

(declare-fun call!60759 () Bool)

(assert (=> b!1223324 (= e!694761 call!60759)))

(declare-fun bm!60756 () Bool)

(assert (=> bm!60756 (= call!60759 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!556675 mask!1564))))

(declare-fun b!1223325 () Bool)

(assert (=> b!1223325 (= e!694762 call!60759)))

(declare-fun b!1223326 () Bool)

(assert (=> b!1223326 (= e!694760 e!694761)))

(declare-fun c!120384 () Bool)

(assert (=> b!1223326 (= c!120384 (validKeyInArray!0 (select (arr!38108 lt!556675) #b00000000000000000000000000000000)))))

(assert (= (and d!133929 (not res!812819)) b!1223326))

(assert (= (and b!1223326 c!120384) b!1223323))

(assert (= (and b!1223326 (not c!120384)) b!1223324))

(assert (= (and b!1223323 res!812820) b!1223325))

(assert (= (or b!1223325 b!1223324) bm!60756))

(declare-fun m!1128313 () Bool)

(assert (=> b!1223323 m!1128313))

(declare-fun m!1128315 () Bool)

(assert (=> b!1223323 m!1128315))

(declare-fun m!1128317 () Bool)

(assert (=> b!1223323 m!1128317))

(assert (=> b!1223323 m!1128313))

(declare-fun m!1128319 () Bool)

(assert (=> b!1223323 m!1128319))

(declare-fun m!1128321 () Bool)

(assert (=> bm!60756 m!1128321))

(assert (=> b!1223326 m!1128313))

(assert (=> b!1223326 m!1128313))

(declare-fun m!1128323 () Bool)

(assert (=> b!1223326 m!1128323))

(assert (=> b!1223165 d!133929))

(declare-fun d!133931 () Bool)

(assert (=> d!133931 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26899)))

(declare-fun lt!556766 () Unit!40522)

(declare-fun choose!39 (array!78961 (_ BitVec 32) (_ BitVec 32)) Unit!40522)

(assert (=> d!133931 (= lt!556766 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133931 (bvslt (size!38644 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133931 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!556766)))

(declare-fun bs!34412 () Bool)

(assert (= bs!34412 d!133931))

(assert (=> bs!34412 m!1128129))

(declare-fun m!1128325 () Bool)

(assert (=> bs!34412 m!1128325))

(assert (=> b!1223169 d!133931))

(declare-fun d!133933 () Bool)

(assert (=> d!133933 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556769 () Unit!40522)

(declare-fun choose!114 (array!78961 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40522)

(assert (=> d!133933 (= lt!556769 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133933 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133933 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!556769)))

(declare-fun bs!34413 () Bool)

(assert (= bs!34413 d!133933))

(assert (=> bs!34413 m!1128125))

(declare-fun m!1128327 () Bool)

(assert (=> bs!34413 m!1128327))

(assert (=> b!1223169 d!133933))

(declare-fun b!1223327 () Bool)

(declare-fun e!694766 () Bool)

(declare-fun e!694765 () Bool)

(assert (=> b!1223327 (= e!694766 e!694765)))

(declare-fun res!812821 () Bool)

(assert (=> b!1223327 (=> (not res!812821) (not e!694765))))

(declare-fun e!694763 () Bool)

(assert (=> b!1223327 (= res!812821 (not e!694763))))

(declare-fun res!812822 () Bool)

(assert (=> b!1223327 (=> (not res!812822) (not e!694763))))

(assert (=> b!1223327 (= res!812822 (validKeyInArray!0 (select (arr!38108 _keys!1208) from!1455)))))

(declare-fun d!133935 () Bool)

(declare-fun res!812823 () Bool)

(assert (=> d!133935 (=> res!812823 e!694766)))

(assert (=> d!133935 (= res!812823 (bvsge from!1455 (size!38644 _keys!1208)))))

(assert (=> d!133935 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26899) e!694766)))

(declare-fun c!120385 () Bool)

(declare-fun call!60760 () Bool)

(declare-fun bm!60757 () Bool)

(assert (=> bm!60757 (= call!60760 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120385 (Cons!26898 (select (arr!38108 _keys!1208) from!1455) Nil!26899) Nil!26899)))))

(declare-fun b!1223328 () Bool)

(assert (=> b!1223328 (= e!694763 (contains!7034 Nil!26899 (select (arr!38108 _keys!1208) from!1455)))))

(declare-fun b!1223329 () Bool)

(declare-fun e!694764 () Bool)

(assert (=> b!1223329 (= e!694764 call!60760)))

(declare-fun b!1223330 () Bool)

(assert (=> b!1223330 (= e!694764 call!60760)))

(declare-fun b!1223331 () Bool)

(assert (=> b!1223331 (= e!694765 e!694764)))

(assert (=> b!1223331 (= c!120385 (validKeyInArray!0 (select (arr!38108 _keys!1208) from!1455)))))

(assert (= (and d!133935 (not res!812823)) b!1223327))

(assert (= (and b!1223327 res!812822) b!1223328))

(assert (= (and b!1223327 res!812821) b!1223331))

(assert (= (and b!1223331 c!120385) b!1223329))

(assert (= (and b!1223331 (not c!120385)) b!1223330))

(assert (= (or b!1223329 b!1223330) bm!60757))

(assert (=> b!1223327 m!1128157))

(assert (=> b!1223327 m!1128157))

(assert (=> b!1223327 m!1128175))

(assert (=> bm!60757 m!1128157))

(declare-fun m!1128329 () Bool)

(assert (=> bm!60757 m!1128329))

(assert (=> b!1223328 m!1128157))

(assert (=> b!1223328 m!1128157))

(declare-fun m!1128331 () Bool)

(assert (=> b!1223328 m!1128331))

(assert (=> b!1223331 m!1128157))

(assert (=> b!1223331 m!1128157))

(assert (=> b!1223331 m!1128175))

(assert (=> b!1223169 d!133935))

(declare-fun d!133937 () Bool)

(declare-fun res!812824 () Bool)

(declare-fun e!694767 () Bool)

(assert (=> d!133937 (=> res!812824 e!694767)))

(assert (=> d!133937 (= res!812824 (= (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133937 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!694767)))

(declare-fun b!1223332 () Bool)

(declare-fun e!694768 () Bool)

(assert (=> b!1223332 (= e!694767 e!694768)))

(declare-fun res!812825 () Bool)

(assert (=> b!1223332 (=> (not res!812825) (not e!694768))))

(assert (=> b!1223332 (= res!812825 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38644 _keys!1208)))))

(declare-fun b!1223333 () Bool)

(assert (=> b!1223333 (= e!694768 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133937 (not res!812824)) b!1223332))

(assert (= (and b!1223332 res!812825) b!1223333))

(declare-fun m!1128333 () Bool)

(assert (=> d!133937 m!1128333))

(declare-fun m!1128335 () Bool)

(assert (=> b!1223333 m!1128335))

(assert (=> b!1223169 d!133937))

(declare-fun d!133939 () Bool)

(assert (=> d!133939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38644 _keys!1208)) (not (= (select (arr!38108 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!556772 () Unit!40522)

(declare-fun choose!21 (array!78961 (_ BitVec 64) (_ BitVec 32) List!26902) Unit!40522)

(assert (=> d!133939 (= lt!556772 (choose!21 _keys!1208 k0!934 from!1455 Nil!26899))))

(assert (=> d!133939 (bvslt (size!38644 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133939 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26899) lt!556772)))

(declare-fun bs!34414 () Bool)

(assert (= bs!34414 d!133939))

(assert (=> bs!34414 m!1128157))

(declare-fun m!1128337 () Bool)

(assert (=> bs!34414 m!1128337))

(assert (=> b!1223169 d!133939))

(declare-fun d!133941 () Bool)

(declare-fun e!694771 () Bool)

(assert (=> d!133941 e!694771))

(declare-fun res!812831 () Bool)

(assert (=> d!133941 (=> (not res!812831) (not e!694771))))

(declare-fun lt!556781 () ListLongMap!18069)

(assert (=> d!133941 (= res!812831 (contains!7035 lt!556781 (_1!10061 lt!556670)))))

(declare-fun lt!556782 () List!26901)

(assert (=> d!133941 (= lt!556781 (ListLongMap!18070 lt!556782))))

(declare-fun lt!556784 () Unit!40522)

(declare-fun lt!556783 () Unit!40522)

(assert (=> d!133941 (= lt!556784 lt!556783)))

(declare-datatypes ((Option!699 0))(
  ( (Some!698 (v!18264 V!46579)) (None!697) )
))
(declare-fun getValueByKey!648 (List!26901 (_ BitVec 64)) Option!699)

(assert (=> d!133941 (= (getValueByKey!648 lt!556782 (_1!10061 lt!556670)) (Some!698 (_2!10061 lt!556670)))))

(declare-fun lemmaContainsTupThenGetReturnValue!325 (List!26901 (_ BitVec 64) V!46579) Unit!40522)

(assert (=> d!133941 (= lt!556783 (lemmaContainsTupThenGetReturnValue!325 lt!556782 (_1!10061 lt!556670) (_2!10061 lt!556670)))))

(declare-fun insertStrictlySorted!418 (List!26901 (_ BitVec 64) V!46579) List!26901)

(assert (=> d!133941 (= lt!556782 (insertStrictlySorted!418 (toList!9050 lt!556665) (_1!10061 lt!556670) (_2!10061 lt!556670)))))

(assert (=> d!133941 (= (+!4109 lt!556665 lt!556670) lt!556781)))

(declare-fun b!1223338 () Bool)

(declare-fun res!812830 () Bool)

(assert (=> b!1223338 (=> (not res!812830) (not e!694771))))

(assert (=> b!1223338 (= res!812830 (= (getValueByKey!648 (toList!9050 lt!556781) (_1!10061 lt!556670)) (Some!698 (_2!10061 lt!556670))))))

(declare-fun b!1223339 () Bool)

(declare-fun contains!7036 (List!26901 tuple2!20100) Bool)

(assert (=> b!1223339 (= e!694771 (contains!7036 (toList!9050 lt!556781) lt!556670))))

(assert (= (and d!133941 res!812831) b!1223338))

(assert (= (and b!1223338 res!812830) b!1223339))

(declare-fun m!1128339 () Bool)

(assert (=> d!133941 m!1128339))

(declare-fun m!1128341 () Bool)

(assert (=> d!133941 m!1128341))

(declare-fun m!1128343 () Bool)

(assert (=> d!133941 m!1128343))

(declare-fun m!1128345 () Bool)

(assert (=> d!133941 m!1128345))

(declare-fun m!1128347 () Bool)

(assert (=> b!1223338 m!1128347))

(declare-fun m!1128349 () Bool)

(assert (=> b!1223339 m!1128349))

(assert (=> b!1223180 d!133941))

(declare-fun d!133943 () Bool)

(declare-fun e!694772 () Bool)

(assert (=> d!133943 e!694772))

(declare-fun res!812833 () Bool)

(assert (=> d!133943 (=> (not res!812833) (not e!694772))))

(declare-fun lt!556785 () ListLongMap!18069)

(assert (=> d!133943 (= res!812833 (contains!7035 lt!556785 (_1!10061 lt!556670)))))

(declare-fun lt!556786 () List!26901)

(assert (=> d!133943 (= lt!556785 (ListLongMap!18070 lt!556786))))

(declare-fun lt!556788 () Unit!40522)

(declare-fun lt!556787 () Unit!40522)

(assert (=> d!133943 (= lt!556788 lt!556787)))

(assert (=> d!133943 (= (getValueByKey!648 lt!556786 (_1!10061 lt!556670)) (Some!698 (_2!10061 lt!556670)))))

(assert (=> d!133943 (= lt!556787 (lemmaContainsTupThenGetReturnValue!325 lt!556786 (_1!10061 lt!556670) (_2!10061 lt!556670)))))

(assert (=> d!133943 (= lt!556786 (insertStrictlySorted!418 (toList!9050 lt!556666) (_1!10061 lt!556670) (_2!10061 lt!556670)))))

(assert (=> d!133943 (= (+!4109 lt!556666 lt!556670) lt!556785)))

(declare-fun b!1223340 () Bool)

(declare-fun res!812832 () Bool)

(assert (=> b!1223340 (=> (not res!812832) (not e!694772))))

(assert (=> b!1223340 (= res!812832 (= (getValueByKey!648 (toList!9050 lt!556785) (_1!10061 lt!556670)) (Some!698 (_2!10061 lt!556670))))))

(declare-fun b!1223341 () Bool)

(assert (=> b!1223341 (= e!694772 (contains!7036 (toList!9050 lt!556785) lt!556670))))

(assert (= (and d!133943 res!812833) b!1223340))

(assert (= (and b!1223340 res!812832) b!1223341))

(declare-fun m!1128351 () Bool)

(assert (=> d!133943 m!1128351))

(declare-fun m!1128353 () Bool)

(assert (=> d!133943 m!1128353))

(declare-fun m!1128355 () Bool)

(assert (=> d!133943 m!1128355))

(declare-fun m!1128357 () Bool)

(assert (=> d!133943 m!1128357))

(declare-fun m!1128359 () Bool)

(assert (=> b!1223340 m!1128359))

(declare-fun m!1128361 () Bool)

(assert (=> b!1223341 m!1128361))

(assert (=> b!1223180 d!133943))

(declare-fun d!133945 () Bool)

(declare-fun c!120388 () Bool)

(assert (=> d!133945 (= c!120388 ((_ is ValueCellFull!14835) (select (arr!38109 _values!996) from!1455)))))

(declare-fun e!694775 () V!46579)

(assert (=> d!133945 (= (get!19458 (select (arr!38109 _values!996) from!1455) lt!556676) e!694775)))

(declare-fun b!1223346 () Bool)

(declare-fun get!19459 (ValueCell!14835 V!46579) V!46579)

(assert (=> b!1223346 (= e!694775 (get!19459 (select (arr!38109 _values!996) from!1455) lt!556676))))

(declare-fun b!1223347 () Bool)

(declare-fun get!19460 (ValueCell!14835 V!46579) V!46579)

(assert (=> b!1223347 (= e!694775 (get!19460 (select (arr!38109 _values!996) from!1455) lt!556676))))

(assert (= (and d!133945 c!120388) b!1223346))

(assert (= (and d!133945 (not c!120388)) b!1223347))

(assert (=> b!1223346 m!1128151))

(declare-fun m!1128363 () Bool)

(assert (=> b!1223346 m!1128363))

(assert (=> b!1223347 m!1128151))

(declare-fun m!1128365 () Bool)

(assert (=> b!1223347 m!1128365))

(assert (=> b!1223180 d!133945))

(declare-fun b!1223348 () Bool)

(declare-fun e!694779 () Bool)

(declare-fun e!694778 () Bool)

(assert (=> b!1223348 (= e!694779 e!694778)))

(declare-fun res!812834 () Bool)

(assert (=> b!1223348 (=> (not res!812834) (not e!694778))))

(declare-fun e!694776 () Bool)

(assert (=> b!1223348 (= res!812834 (not e!694776))))

(declare-fun res!812835 () Bool)

(assert (=> b!1223348 (=> (not res!812835) (not e!694776))))

(assert (=> b!1223348 (= res!812835 (validKeyInArray!0 (select (arr!38108 lt!556675) #b00000000000000000000000000000000)))))

(declare-fun d!133947 () Bool)

(declare-fun res!812836 () Bool)

(assert (=> d!133947 (=> res!812836 e!694779)))

(assert (=> d!133947 (= res!812836 (bvsge #b00000000000000000000000000000000 (size!38644 lt!556675)))))

(assert (=> d!133947 (= (arrayNoDuplicates!0 lt!556675 #b00000000000000000000000000000000 Nil!26899) e!694779)))

(declare-fun bm!60758 () Bool)

(declare-fun call!60761 () Bool)

(declare-fun c!120389 () Bool)

(assert (=> bm!60758 (= call!60761 (arrayNoDuplicates!0 lt!556675 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120389 (Cons!26898 (select (arr!38108 lt!556675) #b00000000000000000000000000000000) Nil!26899) Nil!26899)))))

(declare-fun b!1223349 () Bool)

(assert (=> b!1223349 (= e!694776 (contains!7034 Nil!26899 (select (arr!38108 lt!556675) #b00000000000000000000000000000000)))))

(declare-fun b!1223350 () Bool)

(declare-fun e!694777 () Bool)

(assert (=> b!1223350 (= e!694777 call!60761)))

(declare-fun b!1223351 () Bool)

(assert (=> b!1223351 (= e!694777 call!60761)))

(declare-fun b!1223352 () Bool)

(assert (=> b!1223352 (= e!694778 e!694777)))

(assert (=> b!1223352 (= c!120389 (validKeyInArray!0 (select (arr!38108 lt!556675) #b00000000000000000000000000000000)))))

(assert (= (and d!133947 (not res!812836)) b!1223348))

(assert (= (and b!1223348 res!812835) b!1223349))

(assert (= (and b!1223348 res!812834) b!1223352))

(assert (= (and b!1223352 c!120389) b!1223350))

(assert (= (and b!1223352 (not c!120389)) b!1223351))

(assert (= (or b!1223350 b!1223351) bm!60758))

(assert (=> b!1223348 m!1128313))

(assert (=> b!1223348 m!1128313))

(assert (=> b!1223348 m!1128323))

(assert (=> bm!60758 m!1128313))

(declare-fun m!1128367 () Bool)

(assert (=> bm!60758 m!1128367))

(assert (=> b!1223349 m!1128313))

(assert (=> b!1223349 m!1128313))

(declare-fun m!1128369 () Bool)

(assert (=> b!1223349 m!1128369))

(assert (=> b!1223352 m!1128313))

(assert (=> b!1223352 m!1128313))

(assert (=> b!1223352 m!1128323))

(assert (=> b!1223170 d!133947))

(declare-fun d!133949 () Bool)

(assert (=> d!133949 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1223172 d!133949))

(declare-fun d!133951 () Bool)

(declare-fun res!812837 () Bool)

(declare-fun e!694780 () Bool)

(assert (=> d!133951 (=> res!812837 e!694780)))

(assert (=> d!133951 (= res!812837 (= (select (arr!38108 _keys!1208) i!673) k0!934))))

(assert (=> d!133951 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!694780)))

(declare-fun b!1223353 () Bool)

(declare-fun e!694781 () Bool)

(assert (=> b!1223353 (= e!694780 e!694781)))

(declare-fun res!812838 () Bool)

(assert (=> b!1223353 (=> (not res!812838) (not e!694781))))

(assert (=> b!1223353 (= res!812838 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38644 _keys!1208)))))

(declare-fun b!1223354 () Bool)

(assert (=> b!1223354 (= e!694781 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133951 (not res!812837)) b!1223353))

(assert (= (and b!1223353 res!812838) b!1223354))

(assert (=> d!133951 m!1128181))

(declare-fun m!1128371 () Bool)

(assert (=> b!1223354 m!1128371))

(assert (=> b!1223162 d!133951))

(declare-fun b!1223355 () Bool)

(declare-fun e!694784 () ListLongMap!18069)

(declare-fun call!60762 () ListLongMap!18069)

(assert (=> b!1223355 (= e!694784 call!60762)))

(declare-fun b!1223356 () Bool)

(declare-fun e!694788 () Bool)

(declare-fun lt!556792 () ListLongMap!18069)

(assert (=> b!1223356 (= e!694788 (isEmpty!1001 lt!556792))))

(declare-fun b!1223357 () Bool)

(declare-fun lt!556791 () Unit!40522)

(declare-fun lt!556794 () Unit!40522)

(assert (=> b!1223357 (= lt!556791 lt!556794)))

(declare-fun lt!556790 () (_ BitVec 64))

(declare-fun lt!556789 () (_ BitVec 64))

(declare-fun lt!556795 () ListLongMap!18069)

(declare-fun lt!556793 () V!46579)

(assert (=> b!1223357 (not (contains!7035 (+!4109 lt!556795 (tuple2!20101 lt!556790 lt!556793)) lt!556789))))

(assert (=> b!1223357 (= lt!556794 (addStillNotContains!305 lt!556795 lt!556790 lt!556793 lt!556789))))

(assert (=> b!1223357 (= lt!556789 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223357 (= lt!556793 (get!19458 (select (arr!38109 lt!556672) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223357 (= lt!556790 (select (arr!38108 lt!556675) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223357 (= lt!556795 call!60762)))

(assert (=> b!1223357 (= e!694784 (+!4109 call!60762 (tuple2!20101 (select (arr!38108 lt!556675) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19458 (select (arr!38109 lt!556672) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223358 () Bool)

(assert (=> b!1223358 (= e!694788 (= lt!556792 (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223359 () Bool)

(declare-fun e!694787 () Bool)

(declare-fun e!694785 () Bool)

(assert (=> b!1223359 (= e!694787 e!694785)))

(assert (=> b!1223359 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 lt!556675)))))

(declare-fun res!812842 () Bool)

(assert (=> b!1223359 (= res!812842 (contains!7035 lt!556792 (select (arr!38108 lt!556675) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223359 (=> (not res!812842) (not e!694785))))

(declare-fun b!1223360 () Bool)

(assert (=> b!1223360 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 lt!556675)))))

(assert (=> b!1223360 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38645 lt!556672)))))

(assert (=> b!1223360 (= e!694785 (= (apply!977 lt!556792 (select (arr!38108 lt!556675) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19458 (select (arr!38109 lt!556672) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1223361 () Bool)

(declare-fun e!694783 () ListLongMap!18069)

(assert (=> b!1223361 (= e!694783 e!694784)))

(declare-fun c!120392 () Bool)

(assert (=> b!1223361 (= c!120392 (validKeyInArray!0 (select (arr!38108 lt!556675) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1223362 () Bool)

(assert (=> b!1223362 (= e!694783 (ListLongMap!18070 Nil!26898))))

(declare-fun b!1223363 () Bool)

(declare-fun e!694786 () Bool)

(assert (=> b!1223363 (= e!694786 e!694787)))

(declare-fun c!120393 () Bool)

(declare-fun e!694782 () Bool)

(assert (=> b!1223363 (= c!120393 e!694782)))

(declare-fun res!812839 () Bool)

(assert (=> b!1223363 (=> (not res!812839) (not e!694782))))

(assert (=> b!1223363 (= res!812839 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 lt!556675)))))

(declare-fun d!133953 () Bool)

(assert (=> d!133953 e!694786))

(declare-fun res!812841 () Bool)

(assert (=> d!133953 (=> (not res!812841) (not e!694786))))

(assert (=> d!133953 (= res!812841 (not (contains!7035 lt!556792 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133953 (= lt!556792 e!694783)))

(declare-fun c!120390 () Bool)

(assert (=> d!133953 (= c!120390 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 lt!556675)))))

(assert (=> d!133953 (validMask!0 mask!1564)))

(assert (=> d!133953 (= (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556792)))

(declare-fun b!1223364 () Bool)

(declare-fun res!812840 () Bool)

(assert (=> b!1223364 (=> (not res!812840) (not e!694786))))

(assert (=> b!1223364 (= res!812840 (not (contains!7035 lt!556792 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223365 () Bool)

(assert (=> b!1223365 (= e!694782 (validKeyInArray!0 (select (arr!38108 lt!556675) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223365 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60759 () Bool)

(assert (=> bm!60759 (= call!60762 (getCurrentListMapNoExtraKeys!5472 lt!556675 lt!556672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223366 () Bool)

(assert (=> b!1223366 (= e!694787 e!694788)))

(declare-fun c!120391 () Bool)

(assert (=> b!1223366 (= c!120391 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 lt!556675)))))

(assert (= (and d!133953 c!120390) b!1223362))

(assert (= (and d!133953 (not c!120390)) b!1223361))

(assert (= (and b!1223361 c!120392) b!1223357))

(assert (= (and b!1223361 (not c!120392)) b!1223355))

(assert (= (or b!1223357 b!1223355) bm!60759))

(assert (= (and d!133953 res!812841) b!1223364))

(assert (= (and b!1223364 res!812840) b!1223363))

(assert (= (and b!1223363 res!812839) b!1223365))

(assert (= (and b!1223363 c!120393) b!1223359))

(assert (= (and b!1223363 (not c!120393)) b!1223366))

(assert (= (and b!1223359 res!812842) b!1223360))

(assert (= (and b!1223366 c!120391) b!1223358))

(assert (= (and b!1223366 (not c!120391)) b!1223356))

(declare-fun b_lambda!22341 () Bool)

(assert (=> (not b_lambda!22341) (not b!1223357)))

(assert (=> b!1223357 t!40265))

(declare-fun b_and!44029 () Bool)

(assert (= b_and!44027 (and (=> t!40265 result!22981) b_and!44029)))

(declare-fun b_lambda!22343 () Bool)

(assert (=> (not b_lambda!22343) (not b!1223360)))

(assert (=> b!1223360 t!40265))

(declare-fun b_and!44031 () Bool)

(assert (= b_and!44029 (and (=> t!40265 result!22981) b_and!44031)))

(declare-fun m!1128373 () Bool)

(assert (=> b!1223364 m!1128373))

(declare-fun m!1128375 () Bool)

(assert (=> bm!60759 m!1128375))

(declare-fun m!1128377 () Bool)

(assert (=> b!1223357 m!1128377))

(declare-fun m!1128379 () Bool)

(assert (=> b!1223357 m!1128379))

(declare-fun m!1128381 () Bool)

(assert (=> b!1223357 m!1128381))

(declare-fun m!1128383 () Bool)

(assert (=> b!1223357 m!1128383))

(assert (=> b!1223357 m!1128137))

(declare-fun m!1128385 () Bool)

(assert (=> b!1223357 m!1128385))

(assert (=> b!1223357 m!1128137))

(declare-fun m!1128387 () Bool)

(assert (=> b!1223357 m!1128387))

(assert (=> b!1223357 m!1128383))

(assert (=> b!1223357 m!1128377))

(declare-fun m!1128389 () Bool)

(assert (=> b!1223357 m!1128389))

(declare-fun m!1128391 () Bool)

(assert (=> d!133953 m!1128391))

(assert (=> d!133953 m!1128143))

(assert (=> b!1223360 m!1128383))

(assert (=> b!1223360 m!1128137))

(assert (=> b!1223360 m!1128385))

(assert (=> b!1223360 m!1128137))

(assert (=> b!1223360 m!1128387))

(assert (=> b!1223360 m!1128383))

(assert (=> b!1223360 m!1128387))

(declare-fun m!1128393 () Bool)

(assert (=> b!1223360 m!1128393))

(assert (=> b!1223359 m!1128387))

(assert (=> b!1223359 m!1128387))

(declare-fun m!1128395 () Bool)

(assert (=> b!1223359 m!1128395))

(declare-fun m!1128397 () Bool)

(assert (=> b!1223356 m!1128397))

(assert (=> b!1223361 m!1128387))

(assert (=> b!1223361 m!1128387))

(declare-fun m!1128399 () Bool)

(assert (=> b!1223361 m!1128399))

(assert (=> b!1223365 m!1128387))

(assert (=> b!1223365 m!1128387))

(assert (=> b!1223365 m!1128399))

(assert (=> b!1223358 m!1128375))

(assert (=> b!1223171 d!133953))

(declare-fun call!60768 () ListLongMap!18069)

(declare-fun bm!60764 () Bool)

(assert (=> bm!60764 (= call!60768 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223373 () Bool)

(declare-fun call!60767 () ListLongMap!18069)

(declare-fun e!694793 () Bool)

(assert (=> b!1223373 (= e!694793 (= call!60767 (-!1953 call!60768 k0!934)))))

(assert (=> b!1223373 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38645 _values!996)))))

(declare-fun d!133955 () Bool)

(declare-fun e!694794 () Bool)

(assert (=> d!133955 e!694794))

(declare-fun res!812845 () Bool)

(assert (=> d!133955 (=> (not res!812845) (not e!694794))))

(assert (=> d!133955 (= res!812845 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38644 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38644 _keys!1208))))))))

(declare-fun lt!556798 () Unit!40522)

(declare-fun choose!1828 (array!78961 array!78963 (_ BitVec 32) (_ BitVec 32) V!46579 V!46579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40522)

(assert (=> d!133955 (= lt!556798 (choose!1828 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133955 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 _keys!1208)))))

(assert (=> d!133955 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556798)))

(declare-fun b!1223374 () Bool)

(assert (=> b!1223374 (= e!694793 (= call!60767 call!60768))))

(assert (=> b!1223374 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38645 _values!996)))))

(declare-fun b!1223375 () Bool)

(assert (=> b!1223375 (= e!694794 e!694793)))

(declare-fun c!120396 () Bool)

(assert (=> b!1223375 (= c!120396 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60765 () Bool)

(assert (=> bm!60765 (= call!60767 (getCurrentListMapNoExtraKeys!5472 (array!78962 (store (arr!38108 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38644 _keys!1208)) (array!78964 (store (arr!38109 _values!996) i!673 (ValueCellFull!14835 (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38645 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133955 res!812845) b!1223375))

(assert (= (and b!1223375 c!120396) b!1223373))

(assert (= (and b!1223375 (not c!120396)) b!1223374))

(assert (= (or b!1223373 b!1223374) bm!60764))

(assert (= (or b!1223373 b!1223374) bm!60765))

(declare-fun b_lambda!22345 () Bool)

(assert (=> (not b_lambda!22345) (not bm!60765)))

(assert (=> bm!60765 t!40265))

(declare-fun b_and!44033 () Bool)

(assert (= b_and!44031 (and (=> t!40265 result!22981) b_and!44033)))

(assert (=> bm!60764 m!1128167))

(declare-fun m!1128401 () Bool)

(assert (=> b!1223373 m!1128401))

(declare-fun m!1128403 () Bool)

(assert (=> d!133955 m!1128403))

(assert (=> bm!60765 m!1128179))

(assert (=> bm!60765 m!1128137))

(declare-fun m!1128405 () Bool)

(assert (=> bm!60765 m!1128405))

(declare-fun m!1128407 () Bool)

(assert (=> bm!60765 m!1128407))

(assert (=> b!1223171 d!133955))

(declare-fun b!1223376 () Bool)

(declare-fun e!694797 () ListLongMap!18069)

(declare-fun call!60769 () ListLongMap!18069)

(assert (=> b!1223376 (= e!694797 call!60769)))

(declare-fun b!1223377 () Bool)

(declare-fun e!694801 () Bool)

(declare-fun lt!556802 () ListLongMap!18069)

(assert (=> b!1223377 (= e!694801 (isEmpty!1001 lt!556802))))

(declare-fun b!1223378 () Bool)

(declare-fun lt!556801 () Unit!40522)

(declare-fun lt!556804 () Unit!40522)

(assert (=> b!1223378 (= lt!556801 lt!556804)))

(declare-fun lt!556803 () V!46579)

(declare-fun lt!556805 () ListLongMap!18069)

(declare-fun lt!556800 () (_ BitVec 64))

(declare-fun lt!556799 () (_ BitVec 64))

(assert (=> b!1223378 (not (contains!7035 (+!4109 lt!556805 (tuple2!20101 lt!556800 lt!556803)) lt!556799))))

(assert (=> b!1223378 (= lt!556804 (addStillNotContains!305 lt!556805 lt!556800 lt!556803 lt!556799))))

(assert (=> b!1223378 (= lt!556799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223378 (= lt!556803 (get!19458 (select (arr!38109 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223378 (= lt!556800 (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223378 (= lt!556805 call!60769)))

(assert (=> b!1223378 (= e!694797 (+!4109 call!60769 (tuple2!20101 (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19458 (select (arr!38109 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223379 () Bool)

(assert (=> b!1223379 (= e!694801 (= lt!556802 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223380 () Bool)

(declare-fun e!694800 () Bool)

(declare-fun e!694798 () Bool)

(assert (=> b!1223380 (= e!694800 e!694798)))

(assert (=> b!1223380 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 _keys!1208)))))

(declare-fun res!812849 () Bool)

(assert (=> b!1223380 (= res!812849 (contains!7035 lt!556802 (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223380 (=> (not res!812849) (not e!694798))))

(declare-fun b!1223381 () Bool)

(assert (=> b!1223381 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 _keys!1208)))))

(assert (=> b!1223381 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38645 _values!996)))))

(assert (=> b!1223381 (= e!694798 (= (apply!977 lt!556802 (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19458 (select (arr!38109 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1223382 () Bool)

(declare-fun e!694796 () ListLongMap!18069)

(assert (=> b!1223382 (= e!694796 e!694797)))

(declare-fun c!120399 () Bool)

(assert (=> b!1223382 (= c!120399 (validKeyInArray!0 (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1223383 () Bool)

(assert (=> b!1223383 (= e!694796 (ListLongMap!18070 Nil!26898))))

(declare-fun b!1223384 () Bool)

(declare-fun e!694799 () Bool)

(assert (=> b!1223384 (= e!694799 e!694800)))

(declare-fun c!120400 () Bool)

(declare-fun e!694795 () Bool)

(assert (=> b!1223384 (= c!120400 e!694795)))

(declare-fun res!812846 () Bool)

(assert (=> b!1223384 (=> (not res!812846) (not e!694795))))

(assert (=> b!1223384 (= res!812846 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 _keys!1208)))))

(declare-fun d!133957 () Bool)

(assert (=> d!133957 e!694799))

(declare-fun res!812848 () Bool)

(assert (=> d!133957 (=> (not res!812848) (not e!694799))))

(assert (=> d!133957 (= res!812848 (not (contains!7035 lt!556802 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133957 (= lt!556802 e!694796)))

(declare-fun c!120397 () Bool)

(assert (=> d!133957 (= c!120397 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 _keys!1208)))))

(assert (=> d!133957 (validMask!0 mask!1564)))

(assert (=> d!133957 (= (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556802)))

(declare-fun b!1223385 () Bool)

(declare-fun res!812847 () Bool)

(assert (=> b!1223385 (=> (not res!812847) (not e!694799))))

(assert (=> b!1223385 (= res!812847 (not (contains!7035 lt!556802 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223386 () Bool)

(assert (=> b!1223386 (= e!694795 (validKeyInArray!0 (select (arr!38108 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223386 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60766 () Bool)

(assert (=> bm!60766 (= call!60769 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223387 () Bool)

(assert (=> b!1223387 (= e!694800 e!694801)))

(declare-fun c!120398 () Bool)

(assert (=> b!1223387 (= c!120398 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38644 _keys!1208)))))

(assert (= (and d!133957 c!120397) b!1223383))

(assert (= (and d!133957 (not c!120397)) b!1223382))

(assert (= (and b!1223382 c!120399) b!1223378))

(assert (= (and b!1223382 (not c!120399)) b!1223376))

(assert (= (or b!1223378 b!1223376) bm!60766))

(assert (= (and d!133957 res!812848) b!1223385))

(assert (= (and b!1223385 res!812847) b!1223384))

(assert (= (and b!1223384 res!812846) b!1223386))

(assert (= (and b!1223384 c!120400) b!1223380))

(assert (= (and b!1223384 (not c!120400)) b!1223387))

(assert (= (and b!1223380 res!812849) b!1223381))

(assert (= (and b!1223387 c!120398) b!1223379))

(assert (= (and b!1223387 (not c!120398)) b!1223377))

(declare-fun b_lambda!22347 () Bool)

(assert (=> (not b_lambda!22347) (not b!1223378)))

(assert (=> b!1223378 t!40265))

(declare-fun b_and!44035 () Bool)

(assert (= b_and!44033 (and (=> t!40265 result!22981) b_and!44035)))

(declare-fun b_lambda!22349 () Bool)

(assert (=> (not b_lambda!22349) (not b!1223381)))

(assert (=> b!1223381 t!40265))

(declare-fun b_and!44037 () Bool)

(assert (= b_and!44035 (and (=> t!40265 result!22981) b_and!44037)))

(declare-fun m!1128409 () Bool)

(assert (=> b!1223385 m!1128409))

(declare-fun m!1128411 () Bool)

(assert (=> bm!60766 m!1128411))

(declare-fun m!1128413 () Bool)

(assert (=> b!1223378 m!1128413))

(declare-fun m!1128415 () Bool)

(assert (=> b!1223378 m!1128415))

(declare-fun m!1128417 () Bool)

(assert (=> b!1223378 m!1128417))

(declare-fun m!1128419 () Bool)

(assert (=> b!1223378 m!1128419))

(assert (=> b!1223378 m!1128137))

(declare-fun m!1128421 () Bool)

(assert (=> b!1223378 m!1128421))

(assert (=> b!1223378 m!1128137))

(assert (=> b!1223378 m!1128333))

(assert (=> b!1223378 m!1128419))

(assert (=> b!1223378 m!1128413))

(declare-fun m!1128423 () Bool)

(assert (=> b!1223378 m!1128423))

(declare-fun m!1128425 () Bool)

(assert (=> d!133957 m!1128425))

(assert (=> d!133957 m!1128143))

(assert (=> b!1223381 m!1128419))

(assert (=> b!1223381 m!1128137))

(assert (=> b!1223381 m!1128421))

(assert (=> b!1223381 m!1128137))

(assert (=> b!1223381 m!1128333))

(assert (=> b!1223381 m!1128419))

(assert (=> b!1223381 m!1128333))

(declare-fun m!1128427 () Bool)

(assert (=> b!1223381 m!1128427))

(assert (=> b!1223380 m!1128333))

(assert (=> b!1223380 m!1128333))

(declare-fun m!1128429 () Bool)

(assert (=> b!1223380 m!1128429))

(declare-fun m!1128431 () Bool)

(assert (=> b!1223377 m!1128431))

(assert (=> b!1223382 m!1128333))

(assert (=> b!1223382 m!1128333))

(declare-fun m!1128433 () Bool)

(assert (=> b!1223382 m!1128433))

(assert (=> b!1223386 m!1128333))

(assert (=> b!1223386 m!1128333))

(assert (=> b!1223386 m!1128433))

(assert (=> b!1223379 m!1128411))

(assert (=> b!1223171 d!133957))

(declare-fun d!133959 () Bool)

(assert (=> d!133959 (= (validKeyInArray!0 (select (arr!38108 _keys!1208) from!1455)) (and (not (= (select (arr!38108 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38108 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1223171 d!133959))

(declare-fun d!133961 () Bool)

(declare-fun lt!556808 () ListLongMap!18069)

(assert (=> d!133961 (not (contains!7035 lt!556808 k0!934))))

(declare-fun removeStrictlySorted!110 (List!26901 (_ BitVec 64)) List!26901)

(assert (=> d!133961 (= lt!556808 (ListLongMap!18070 (removeStrictlySorted!110 (toList!9050 lt!556665) k0!934)))))

(assert (=> d!133961 (= (-!1953 lt!556665 k0!934) lt!556808)))

(declare-fun bs!34415 () Bool)

(assert (= bs!34415 d!133961))

(declare-fun m!1128435 () Bool)

(assert (=> bs!34415 m!1128435))

(declare-fun m!1128437 () Bool)

(assert (=> bs!34415 m!1128437))

(assert (=> b!1223171 d!133961))

(declare-fun d!133963 () Bool)

(assert (=> d!133963 (= (array_inv!28994 _keys!1208) (bvsge (size!38644 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101664 d!133963))

(declare-fun d!133965 () Bool)

(assert (=> d!133965 (= (array_inv!28995 _values!996) (bvsge (size!38645 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101664 d!133965))

(declare-fun b!1223388 () Bool)

(declare-fun e!694803 () Bool)

(declare-fun e!694804 () Bool)

(assert (=> b!1223388 (= e!694803 e!694804)))

(declare-fun lt!556810 () (_ BitVec 64))

(assert (=> b!1223388 (= lt!556810 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!556811 () Unit!40522)

(assert (=> b!1223388 (= lt!556811 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!556810 #b00000000000000000000000000000000))))

(assert (=> b!1223388 (arrayContainsKey!0 _keys!1208 lt!556810 #b00000000000000000000000000000000)))

(declare-fun lt!556809 () Unit!40522)

(assert (=> b!1223388 (= lt!556809 lt!556811)))

(declare-fun res!812851 () Bool)

(assert (=> b!1223388 (= res!812851 (= (seekEntryOrOpen!0 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9950 #b00000000000000000000000000000000)))))

(assert (=> b!1223388 (=> (not res!812851) (not e!694804))))

(declare-fun d!133967 () Bool)

(declare-fun res!812850 () Bool)

(declare-fun e!694802 () Bool)

(assert (=> d!133967 (=> res!812850 e!694802)))

(assert (=> d!133967 (= res!812850 (bvsge #b00000000000000000000000000000000 (size!38644 _keys!1208)))))

(assert (=> d!133967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!694802)))

(declare-fun b!1223389 () Bool)

(declare-fun call!60770 () Bool)

(assert (=> b!1223389 (= e!694803 call!60770)))

(declare-fun bm!60767 () Bool)

(assert (=> bm!60767 (= call!60770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1223390 () Bool)

(assert (=> b!1223390 (= e!694804 call!60770)))

(declare-fun b!1223391 () Bool)

(assert (=> b!1223391 (= e!694802 e!694803)))

(declare-fun c!120401 () Bool)

(assert (=> b!1223391 (= c!120401 (validKeyInArray!0 (select (arr!38108 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133967 (not res!812850)) b!1223391))

(assert (= (and b!1223391 c!120401) b!1223388))

(assert (= (and b!1223391 (not c!120401)) b!1223389))

(assert (= (and b!1223388 res!812851) b!1223390))

(assert (= (or b!1223390 b!1223389) bm!60767))

(assert (=> b!1223388 m!1128251))

(declare-fun m!1128439 () Bool)

(assert (=> b!1223388 m!1128439))

(declare-fun m!1128441 () Bool)

(assert (=> b!1223388 m!1128441))

(assert (=> b!1223388 m!1128251))

(declare-fun m!1128443 () Bool)

(assert (=> b!1223388 m!1128443))

(declare-fun m!1128445 () Bool)

(assert (=> bm!60767 m!1128445))

(assert (=> b!1223391 m!1128251))

(assert (=> b!1223391 m!1128251))

(assert (=> b!1223391 m!1128253))

(assert (=> b!1223173 d!133967))

(declare-fun d!133969 () Bool)

(assert (=> d!133969 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1223163 d!133969))

(declare-fun b!1223399 () Bool)

(declare-fun e!694809 () Bool)

(assert (=> b!1223399 (= e!694809 tp_is_empty!31089)))

(declare-fun mapNonEmpty!48535 () Bool)

(declare-fun mapRes!48535 () Bool)

(declare-fun tp!92207 () Bool)

(declare-fun e!694810 () Bool)

(assert (=> mapNonEmpty!48535 (= mapRes!48535 (and tp!92207 e!694810))))

(declare-fun mapRest!48535 () (Array (_ BitVec 32) ValueCell!14835))

(declare-fun mapKey!48535 () (_ BitVec 32))

(declare-fun mapValue!48535 () ValueCell!14835)

(assert (=> mapNonEmpty!48535 (= mapRest!48529 (store mapRest!48535 mapKey!48535 mapValue!48535))))

(declare-fun b!1223398 () Bool)

(assert (=> b!1223398 (= e!694810 tp_is_empty!31089)))

(declare-fun condMapEmpty!48535 () Bool)

(declare-fun mapDefault!48535 () ValueCell!14835)

(assert (=> mapNonEmpty!48529 (= condMapEmpty!48535 (= mapRest!48529 ((as const (Array (_ BitVec 32) ValueCell!14835)) mapDefault!48535)))))

(assert (=> mapNonEmpty!48529 (= tp!92198 (and e!694809 mapRes!48535))))

(declare-fun mapIsEmpty!48535 () Bool)

(assert (=> mapIsEmpty!48535 mapRes!48535))

(assert (= (and mapNonEmpty!48529 condMapEmpty!48535) mapIsEmpty!48535))

(assert (= (and mapNonEmpty!48529 (not condMapEmpty!48535)) mapNonEmpty!48535))

(assert (= (and mapNonEmpty!48535 ((_ is ValueCellFull!14835) mapValue!48535)) b!1223398))

(assert (= (and mapNonEmpty!48529 ((_ is ValueCellFull!14835) mapDefault!48535)) b!1223399))

(declare-fun m!1128447 () Bool)

(assert (=> mapNonEmpty!48535 m!1128447))

(declare-fun b_lambda!22351 () Bool)

(assert (= b_lambda!22341 (or (and start!101664 b_free!26385) b_lambda!22351)))

(declare-fun b_lambda!22353 () Bool)

(assert (= b_lambda!22347 (or (and start!101664 b_free!26385) b_lambda!22353)))

(declare-fun b_lambda!22355 () Bool)

(assert (= b_lambda!22333 (or (and start!101664 b_free!26385) b_lambda!22355)))

(declare-fun b_lambda!22357 () Bool)

(assert (= b_lambda!22335 (or (and start!101664 b_free!26385) b_lambda!22357)))

(declare-fun b_lambda!22359 () Bool)

(assert (= b_lambda!22337 (or (and start!101664 b_free!26385) b_lambda!22359)))

(declare-fun b_lambda!22361 () Bool)

(assert (= b_lambda!22349 (or (and start!101664 b_free!26385) b_lambda!22361)))

(declare-fun b_lambda!22363 () Bool)

(assert (= b_lambda!22345 (or (and start!101664 b_free!26385) b_lambda!22363)))

(declare-fun b_lambda!22365 () Bool)

(assert (= b_lambda!22339 (or (and start!101664 b_free!26385) b_lambda!22365)))

(declare-fun b_lambda!22367 () Bool)

(assert (= b_lambda!22343 (or (and start!101664 b_free!26385) b_lambda!22367)))

(check-sat (not b!1223326) (not b!1223331) (not b!1223260) (not b!1223302) (not d!133941) (not b!1223391) (not b!1223301) (not bm!60759) (not d!133931) (not b!1223348) (not b_lambda!22367) (not b!1223295) (not b!1223378) (not b_lambda!22359) (not b!1223354) (not d!133927) (not b!1223333) (not d!133961) (not b!1223380) (not b!1223314) (not bm!60764) (not d!133953) (not b!1223289) (not d!133933) (not bm!60767) (not b!1223340) (not b!1223303) (not b!1223385) (not b!1223257) b_and!44037 (not b_lambda!22355) (not b!1223347) (not bm!60757) (not bm!60753) (not b!1223359) (not b!1223379) (not b!1223298) (not b!1223256) (not b!1223294) (not b!1223338) (not b!1223339) (not b!1223341) (not b!1223290) (not bm!60766) (not b!1223365) (not b!1223346) (not b!1223286) (not b!1223358) (not b!1223349) (not d!133957) (not b_lambda!22361) (not d!133921) (not mapNonEmpty!48535) (not b!1223377) (not b!1223306) (not b!1223361) (not b_lambda!22351) (not b!1223300) (not b!1223388) (not b!1223357) tp_is_empty!31089 (not bm!60758) (not b_next!26385) (not b!1223373) (not bm!60752) (not b_lambda!22363) (not b!1223288) (not b!1223381) (not b!1223352) (not b!1223323) (not b!1223328) (not b!1223287) (not b_lambda!22357) (not d!133923) (not d!133943) (not bm!60749) (not b!1223382) (not bm!60765) (not d!133955) (not b_lambda!22353) (not b!1223356) (not b!1223327) (not b!1223299) (not d!133939) (not b!1223291) (not b!1223360) (not b!1223307) (not b_lambda!22365) (not b!1223386) (not b_lambda!22331) (not bm!60756) (not b!1223364))
(check-sat b_and!44037 (not b_next!26385))
