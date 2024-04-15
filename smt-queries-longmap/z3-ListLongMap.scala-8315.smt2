; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101232 () Bool)

(assert start!101232)

(declare-fun b_free!26161 () Bool)

(declare-fun b_next!26161 () Bool)

(assert (=> start!101232 (= b_free!26161 (not b_next!26161))))

(declare-fun tp!91505 () Bool)

(declare-fun b_and!43421 () Bool)

(assert (=> start!101232 (= tp!91505 b_and!43421)))

(declare-fun b!1215708 () Bool)

(declare-fun e!690254 () Bool)

(declare-fun e!690257 () Bool)

(assert (=> b!1215708 (= e!690254 e!690257)))

(declare-fun res!807232 () Bool)

(assert (=> b!1215708 (=> (not res!807232) (not e!690257))))

(declare-datatypes ((array!78424 0))(
  ( (array!78425 (arr!37847 (Array (_ BitVec 32) (_ BitVec 64))) (size!38385 (_ BitVec 32))) )
))
(declare-fun lt!552538 () array!78424)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78424 (_ BitVec 32)) Bool)

(assert (=> b!1215708 (= res!807232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552538 mask!1564))))

(declare-fun _keys!1208 () array!78424)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215708 (= lt!552538 (array!78425 (store (arr!37847 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38385 _keys!1208)))))

(declare-fun b!1215709 () Bool)

(declare-fun e!690256 () Bool)

(assert (=> b!1215709 (= e!690257 (not e!690256))))

(declare-fun res!807235 () Bool)

(assert (=> b!1215709 (=> res!807235 e!690256)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1215709 (= res!807235 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215709 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40171 0))(
  ( (Unit!40172) )
))
(declare-fun lt!552539 () Unit!40171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78424 (_ BitVec 64) (_ BitVec 32)) Unit!40171)

(assert (=> b!1215709 (= lt!552539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215710 () Bool)

(declare-fun res!807225 () Bool)

(assert (=> b!1215710 (=> (not res!807225) (not e!690254))))

(assert (=> b!1215710 (= res!807225 (= (select (arr!37847 _keys!1208) i!673) k0!934))))

(declare-fun b!1215711 () Bool)

(declare-fun e!690253 () Bool)

(declare-fun tp_is_empty!30865 () Bool)

(assert (=> b!1215711 (= e!690253 tp_is_empty!30865)))

(declare-fun b!1215712 () Bool)

(declare-fun e!690255 () Bool)

(declare-fun mapRes!48172 () Bool)

(assert (=> b!1215712 (= e!690255 (and e!690253 mapRes!48172))))

(declare-fun condMapEmpty!48172 () Bool)

(declare-datatypes ((V!46281 0))(
  ( (V!46282 (val!15489 Int)) )
))
(declare-datatypes ((ValueCell!14723 0))(
  ( (ValueCellFull!14723 (v!18141 V!46281)) (EmptyCell!14723) )
))
(declare-datatypes ((array!78426 0))(
  ( (array!78427 (arr!37848 (Array (_ BitVec 32) ValueCell!14723)) (size!38386 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78426)

(declare-fun mapDefault!48172 () ValueCell!14723)

(assert (=> b!1215712 (= condMapEmpty!48172 (= (arr!37848 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14723)) mapDefault!48172)))))

(declare-fun b!1215713 () Bool)

(declare-fun res!807233 () Bool)

(assert (=> b!1215713 (=> (not res!807233) (not e!690254))))

(assert (=> b!1215713 (= res!807233 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38385 _keys!1208))))))

(declare-fun b!1215714 () Bool)

(declare-fun res!807229 () Bool)

(assert (=> b!1215714 (=> (not res!807229) (not e!690254))))

(assert (=> b!1215714 (= res!807229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215715 () Bool)

(assert (=> b!1215715 (= e!690256 true)))

(declare-fun zeroValue!944 () V!46281)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19996 0))(
  ( (tuple2!19997 (_1!10009 (_ BitVec 64)) (_2!10009 V!46281)) )
))
(declare-datatypes ((List!26776 0))(
  ( (Nil!26773) (Cons!26772 (h!27981 tuple2!19996) (t!39908 List!26776)) )
))
(declare-datatypes ((ListLongMap!17965 0))(
  ( (ListLongMap!17966 (toList!8998 List!26776)) )
))
(declare-fun lt!552536 () ListLongMap!17965)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46281)

(declare-fun getCurrentListMapNoExtraKeys!5437 (array!78424 array!78426 (_ BitVec 32) (_ BitVec 32) V!46281 V!46281 (_ BitVec 32) Int) ListLongMap!17965)

(declare-fun dynLambda!3289 (Int (_ BitVec 64)) V!46281)

(assert (=> b!1215715 (= lt!552536 (getCurrentListMapNoExtraKeys!5437 lt!552538 (array!78427 (store (arr!37848 _values!996) i!673 (ValueCellFull!14723 (dynLambda!3289 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38386 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552537 () ListLongMap!17965)

(assert (=> b!1215715 (= lt!552537 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48172 () Bool)

(assert (=> mapIsEmpty!48172 mapRes!48172))

(declare-fun res!807230 () Bool)

(assert (=> start!101232 (=> (not res!807230) (not e!690254))))

(assert (=> start!101232 (= res!807230 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38385 _keys!1208))))))

(assert (=> start!101232 e!690254))

(assert (=> start!101232 tp_is_empty!30865))

(declare-fun array_inv!28930 (array!78424) Bool)

(assert (=> start!101232 (array_inv!28930 _keys!1208)))

(assert (=> start!101232 true))

(assert (=> start!101232 tp!91505))

(declare-fun array_inv!28931 (array!78426) Bool)

(assert (=> start!101232 (and (array_inv!28931 _values!996) e!690255)))

(declare-fun b!1215707 () Bool)

(declare-fun res!807226 () Bool)

(assert (=> b!1215707 (=> (not res!807226) (not e!690254))))

(assert (=> b!1215707 (= res!807226 (and (= (size!38386 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38385 _keys!1208) (size!38386 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215716 () Bool)

(declare-fun res!807234 () Bool)

(assert (=> b!1215716 (=> (not res!807234) (not e!690254))))

(declare-datatypes ((List!26777 0))(
  ( (Nil!26774) (Cons!26773 (h!27982 (_ BitVec 64)) (t!39909 List!26777)) )
))
(declare-fun arrayNoDuplicates!0 (array!78424 (_ BitVec 32) List!26777) Bool)

(assert (=> b!1215716 (= res!807234 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26774))))

(declare-fun mapNonEmpty!48172 () Bool)

(declare-fun tp!91504 () Bool)

(declare-fun e!690259 () Bool)

(assert (=> mapNonEmpty!48172 (= mapRes!48172 (and tp!91504 e!690259))))

(declare-fun mapKey!48172 () (_ BitVec 32))

(declare-fun mapValue!48172 () ValueCell!14723)

(declare-fun mapRest!48172 () (Array (_ BitVec 32) ValueCell!14723))

(assert (=> mapNonEmpty!48172 (= (arr!37848 _values!996) (store mapRest!48172 mapKey!48172 mapValue!48172))))

(declare-fun b!1215717 () Bool)

(declare-fun res!807227 () Bool)

(assert (=> b!1215717 (=> (not res!807227) (not e!690254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215717 (= res!807227 (validKeyInArray!0 k0!934))))

(declare-fun b!1215718 () Bool)

(declare-fun res!807228 () Bool)

(assert (=> b!1215718 (=> (not res!807228) (not e!690254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215718 (= res!807228 (validMask!0 mask!1564))))

(declare-fun b!1215719 () Bool)

(declare-fun res!807231 () Bool)

(assert (=> b!1215719 (=> (not res!807231) (not e!690257))))

(assert (=> b!1215719 (= res!807231 (arrayNoDuplicates!0 lt!552538 #b00000000000000000000000000000000 Nil!26774))))

(declare-fun b!1215720 () Bool)

(assert (=> b!1215720 (= e!690259 tp_is_empty!30865)))

(assert (= (and start!101232 res!807230) b!1215718))

(assert (= (and b!1215718 res!807228) b!1215707))

(assert (= (and b!1215707 res!807226) b!1215714))

(assert (= (and b!1215714 res!807229) b!1215716))

(assert (= (and b!1215716 res!807234) b!1215713))

(assert (= (and b!1215713 res!807233) b!1215717))

(assert (= (and b!1215717 res!807227) b!1215710))

(assert (= (and b!1215710 res!807225) b!1215708))

(assert (= (and b!1215708 res!807232) b!1215719))

(assert (= (and b!1215719 res!807231) b!1215709))

(assert (= (and b!1215709 (not res!807235)) b!1215715))

(assert (= (and b!1215712 condMapEmpty!48172) mapIsEmpty!48172))

(assert (= (and b!1215712 (not condMapEmpty!48172)) mapNonEmpty!48172))

(get-info :version)

(assert (= (and mapNonEmpty!48172 ((_ is ValueCellFull!14723) mapValue!48172)) b!1215720))

(assert (= (and b!1215712 ((_ is ValueCellFull!14723) mapDefault!48172)) b!1215711))

(assert (= start!101232 b!1215712))

(declare-fun b_lambda!21827 () Bool)

(assert (=> (not b_lambda!21827) (not b!1215715)))

(declare-fun t!39907 () Bool)

(declare-fun tb!10953 () Bool)

(assert (=> (and start!101232 (= defaultEntry!1004 defaultEntry!1004) t!39907) tb!10953))

(declare-fun result!22511 () Bool)

(assert (=> tb!10953 (= result!22511 tp_is_empty!30865)))

(assert (=> b!1215715 t!39907))

(declare-fun b_and!43423 () Bool)

(assert (= b_and!43421 (and (=> t!39907 result!22511) b_and!43423)))

(declare-fun m!1120137 () Bool)

(assert (=> b!1215718 m!1120137))

(declare-fun m!1120139 () Bool)

(assert (=> b!1215719 m!1120139))

(declare-fun m!1120141 () Bool)

(assert (=> b!1215717 m!1120141))

(declare-fun m!1120143 () Bool)

(assert (=> b!1215716 m!1120143))

(declare-fun m!1120145 () Bool)

(assert (=> b!1215714 m!1120145))

(declare-fun m!1120147 () Bool)

(assert (=> b!1215710 m!1120147))

(declare-fun m!1120149 () Bool)

(assert (=> b!1215715 m!1120149))

(declare-fun m!1120151 () Bool)

(assert (=> b!1215715 m!1120151))

(declare-fun m!1120153 () Bool)

(assert (=> b!1215715 m!1120153))

(declare-fun m!1120155 () Bool)

(assert (=> b!1215715 m!1120155))

(declare-fun m!1120157 () Bool)

(assert (=> start!101232 m!1120157))

(declare-fun m!1120159 () Bool)

(assert (=> start!101232 m!1120159))

(declare-fun m!1120161 () Bool)

(assert (=> b!1215709 m!1120161))

(declare-fun m!1120163 () Bool)

(assert (=> b!1215709 m!1120163))

(declare-fun m!1120165 () Bool)

(assert (=> b!1215708 m!1120165))

(declare-fun m!1120167 () Bool)

(assert (=> b!1215708 m!1120167))

(declare-fun m!1120169 () Bool)

(assert (=> mapNonEmpty!48172 m!1120169))

(check-sat (not b_next!26161) b_and!43423 (not b!1215715) (not b!1215708) (not b!1215709) (not start!101232) tp_is_empty!30865 (not b_lambda!21827) (not mapNonEmpty!48172) (not b!1215714) (not b!1215717) (not b!1215716) (not b!1215718) (not b!1215719))
(check-sat b_and!43423 (not b_next!26161))
