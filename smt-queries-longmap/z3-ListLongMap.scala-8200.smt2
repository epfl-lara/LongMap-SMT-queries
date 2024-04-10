; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100068 () Bool)

(assert start!100068)

(declare-fun b_free!25647 () Bool)

(declare-fun b_next!25647 () Bool)

(assert (=> start!100068 (= b_free!25647 (not b_next!25647))))

(declare-fun tp!89655 () Bool)

(declare-fun b_and!42161 () Bool)

(assert (=> start!100068 (= tp!89655 b_and!42161)))

(declare-fun b!1192878 () Bool)

(declare-fun res!793580 () Bool)

(declare-fun e!678006 () Bool)

(assert (=> b!1192878 (=> (not res!793580) (not e!678006))))

(declare-datatypes ((array!77137 0))(
  ( (array!77138 (arr!37218 (Array (_ BitVec 32) (_ BitVec 64))) (size!37754 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77137)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77137 (_ BitVec 32)) Bool)

(assert (=> b!1192878 (= res!793580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47093 () Bool)

(declare-fun mapRes!47093 () Bool)

(assert (=> mapIsEmpty!47093 mapRes!47093))

(declare-fun b!1192879 () Bool)

(declare-fun res!793585 () Bool)

(assert (=> b!1192879 (=> (not res!793585) (not e!678006))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192879 (= res!793585 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37754 _keys!1208))))))

(declare-fun b!1192880 () Bool)

(declare-fun e!678004 () Bool)

(declare-fun e!678007 () Bool)

(assert (=> b!1192880 (= e!678004 (not e!678007))))

(declare-fun res!793581 () Bool)

(assert (=> b!1192880 (=> res!793581 e!678007)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192880 (= res!793581 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192880 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39574 0))(
  ( (Unit!39575) )
))
(declare-fun lt!542385 () Unit!39574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77137 (_ BitVec 64) (_ BitVec 32)) Unit!39574)

(assert (=> b!1192880 (= lt!542385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192881 () Bool)

(declare-fun res!793589 () Bool)

(assert (=> b!1192881 (=> (not res!793589) (not e!678006))))

(assert (=> b!1192881 (= res!793589 (= (select (arr!37218 _keys!1208) i!673) k0!934))))

(declare-fun res!793584 () Bool)

(assert (=> start!100068 (=> (not res!793584) (not e!678006))))

(assert (=> start!100068 (= res!793584 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37754 _keys!1208))))))

(assert (=> start!100068 e!678006))

(declare-fun tp_is_empty!30177 () Bool)

(assert (=> start!100068 tp_is_empty!30177))

(declare-fun array_inv!28378 (array!77137) Bool)

(assert (=> start!100068 (array_inv!28378 _keys!1208)))

(assert (=> start!100068 true))

(assert (=> start!100068 tp!89655))

(declare-datatypes ((V!45363 0))(
  ( (V!45364 (val!15145 Int)) )
))
(declare-datatypes ((ValueCell!14379 0))(
  ( (ValueCellFull!14379 (v!17783 V!45363)) (EmptyCell!14379) )
))
(declare-datatypes ((array!77139 0))(
  ( (array!77140 (arr!37219 (Array (_ BitVec 32) ValueCell!14379)) (size!37755 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77139)

(declare-fun e!678010 () Bool)

(declare-fun array_inv!28379 (array!77139) Bool)

(assert (=> start!100068 (and (array_inv!28379 _values!996) e!678010)))

(declare-fun b!1192882 () Bool)

(declare-fun res!793586 () Bool)

(assert (=> b!1192882 (=> (not res!793586) (not e!678004))))

(declare-fun lt!542388 () array!77137)

(declare-datatypes ((List!26213 0))(
  ( (Nil!26210) (Cons!26209 (h!27418 (_ BitVec 64)) (t!38852 List!26213)) )
))
(declare-fun arrayNoDuplicates!0 (array!77137 (_ BitVec 32) List!26213) Bool)

(assert (=> b!1192882 (= res!793586 (arrayNoDuplicates!0 lt!542388 #b00000000000000000000000000000000 Nil!26210))))

(declare-fun b!1192883 () Bool)

(declare-fun e!678005 () Bool)

(assert (=> b!1192883 (= e!678010 (and e!678005 mapRes!47093))))

(declare-fun condMapEmpty!47093 () Bool)

(declare-fun mapDefault!47093 () ValueCell!14379)

(assert (=> b!1192883 (= condMapEmpty!47093 (= (arr!37219 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14379)) mapDefault!47093)))))

(declare-fun b!1192884 () Bool)

(assert (=> b!1192884 (= e!678006 e!678004)))

(declare-fun res!793588 () Bool)

(assert (=> b!1192884 (=> (not res!793588) (not e!678004))))

(assert (=> b!1192884 (= res!793588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542388 mask!1564))))

(assert (=> b!1192884 (= lt!542388 (array!77138 (store (arr!37218 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37754 _keys!1208)))))

(declare-fun b!1192885 () Bool)

(assert (=> b!1192885 (= e!678005 tp_is_empty!30177)))

(declare-fun b!1192886 () Bool)

(declare-fun e!678003 () Bool)

(assert (=> b!1192886 (= e!678003 true)))

(declare-fun zeroValue!944 () V!45363)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542383 () array!77139)

(declare-fun minValue!944 () V!45363)

(declare-datatypes ((tuple2!19470 0))(
  ( (tuple2!19471 (_1!9746 (_ BitVec 64)) (_2!9746 V!45363)) )
))
(declare-datatypes ((List!26214 0))(
  ( (Nil!26211) (Cons!26210 (h!27419 tuple2!19470) (t!38853 List!26214)) )
))
(declare-datatypes ((ListLongMap!17439 0))(
  ( (ListLongMap!17440 (toList!8735 List!26214)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5176 (array!77137 array!77139 (_ BitVec 32) (_ BitVec 32) V!45363 V!45363 (_ BitVec 32) Int) ListLongMap!17439)

(declare-fun -!1760 (ListLongMap!17439 (_ BitVec 64)) ListLongMap!17439)

(assert (=> b!1192886 (= (getCurrentListMapNoExtraKeys!5176 lt!542388 lt!542383 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1760 (getCurrentListMapNoExtraKeys!5176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542386 () Unit!39574)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!969 (array!77137 array!77139 (_ BitVec 32) (_ BitVec 32) V!45363 V!45363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39574)

(assert (=> b!1192886 (= lt!542386 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192887 () Bool)

(declare-fun res!793582 () Bool)

(assert (=> b!1192887 (=> (not res!793582) (not e!678006))))

(assert (=> b!1192887 (= res!793582 (and (= (size!37755 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37754 _keys!1208) (size!37755 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192888 () Bool)

(assert (=> b!1192888 (= e!678007 e!678003)))

(declare-fun res!793587 () Bool)

(assert (=> b!1192888 (=> res!793587 e!678003)))

(assert (=> b!1192888 (= res!793587 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542384 () ListLongMap!17439)

(assert (=> b!1192888 (= lt!542384 (getCurrentListMapNoExtraKeys!5176 lt!542388 lt!542383 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3107 (Int (_ BitVec 64)) V!45363)

(assert (=> b!1192888 (= lt!542383 (array!77140 (store (arr!37219 _values!996) i!673 (ValueCellFull!14379 (dynLambda!3107 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37755 _values!996)))))

(declare-fun lt!542387 () ListLongMap!17439)

(assert (=> b!1192888 (= lt!542387 (getCurrentListMapNoExtraKeys!5176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192889 () Bool)

(declare-fun res!793590 () Bool)

(assert (=> b!1192889 (=> (not res!793590) (not e!678006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192889 (= res!793590 (validKeyInArray!0 k0!934))))

(declare-fun b!1192890 () Bool)

(declare-fun res!793583 () Bool)

(assert (=> b!1192890 (=> (not res!793583) (not e!678006))))

(assert (=> b!1192890 (= res!793583 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26210))))

(declare-fun b!1192891 () Bool)

(declare-fun e!678009 () Bool)

(assert (=> b!1192891 (= e!678009 tp_is_empty!30177)))

(declare-fun b!1192892 () Bool)

(declare-fun res!793591 () Bool)

(assert (=> b!1192892 (=> (not res!793591) (not e!678006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192892 (= res!793591 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47093 () Bool)

(declare-fun tp!89654 () Bool)

(assert (=> mapNonEmpty!47093 (= mapRes!47093 (and tp!89654 e!678009))))

(declare-fun mapKey!47093 () (_ BitVec 32))

(declare-fun mapValue!47093 () ValueCell!14379)

(declare-fun mapRest!47093 () (Array (_ BitVec 32) ValueCell!14379))

(assert (=> mapNonEmpty!47093 (= (arr!37219 _values!996) (store mapRest!47093 mapKey!47093 mapValue!47093))))

(assert (= (and start!100068 res!793584) b!1192892))

(assert (= (and b!1192892 res!793591) b!1192887))

(assert (= (and b!1192887 res!793582) b!1192878))

(assert (= (and b!1192878 res!793580) b!1192890))

(assert (= (and b!1192890 res!793583) b!1192879))

(assert (= (and b!1192879 res!793585) b!1192889))

(assert (= (and b!1192889 res!793590) b!1192881))

(assert (= (and b!1192881 res!793589) b!1192884))

(assert (= (and b!1192884 res!793588) b!1192882))

(assert (= (and b!1192882 res!793586) b!1192880))

(assert (= (and b!1192880 (not res!793581)) b!1192888))

(assert (= (and b!1192888 (not res!793587)) b!1192886))

(assert (= (and b!1192883 condMapEmpty!47093) mapIsEmpty!47093))

(assert (= (and b!1192883 (not condMapEmpty!47093)) mapNonEmpty!47093))

(get-info :version)

(assert (= (and mapNonEmpty!47093 ((_ is ValueCellFull!14379) mapValue!47093)) b!1192891))

(assert (= (and b!1192883 ((_ is ValueCellFull!14379) mapDefault!47093)) b!1192885))

(assert (= start!100068 b!1192883))

(declare-fun b_lambda!20791 () Bool)

(assert (=> (not b_lambda!20791) (not b!1192888)))

(declare-fun t!38851 () Bool)

(declare-fun tb!10459 () Bool)

(assert (=> (and start!100068 (= defaultEntry!1004 defaultEntry!1004) t!38851) tb!10459))

(declare-fun result!21485 () Bool)

(assert (=> tb!10459 (= result!21485 tp_is_empty!30177)))

(assert (=> b!1192888 t!38851))

(declare-fun b_and!42163 () Bool)

(assert (= b_and!42161 (and (=> t!38851 result!21485) b_and!42163)))

(declare-fun m!1101189 () Bool)

(assert (=> b!1192881 m!1101189))

(declare-fun m!1101191 () Bool)

(assert (=> b!1192884 m!1101191))

(declare-fun m!1101193 () Bool)

(assert (=> b!1192884 m!1101193))

(declare-fun m!1101195 () Bool)

(assert (=> b!1192886 m!1101195))

(declare-fun m!1101197 () Bool)

(assert (=> b!1192886 m!1101197))

(assert (=> b!1192886 m!1101197))

(declare-fun m!1101199 () Bool)

(assert (=> b!1192886 m!1101199))

(declare-fun m!1101201 () Bool)

(assert (=> b!1192886 m!1101201))

(declare-fun m!1101203 () Bool)

(assert (=> b!1192888 m!1101203))

(declare-fun m!1101205 () Bool)

(assert (=> b!1192888 m!1101205))

(declare-fun m!1101207 () Bool)

(assert (=> b!1192888 m!1101207))

(declare-fun m!1101209 () Bool)

(assert (=> b!1192888 m!1101209))

(declare-fun m!1101211 () Bool)

(assert (=> b!1192889 m!1101211))

(declare-fun m!1101213 () Bool)

(assert (=> start!100068 m!1101213))

(declare-fun m!1101215 () Bool)

(assert (=> start!100068 m!1101215))

(declare-fun m!1101217 () Bool)

(assert (=> mapNonEmpty!47093 m!1101217))

(declare-fun m!1101219 () Bool)

(assert (=> b!1192892 m!1101219))

(declare-fun m!1101221 () Bool)

(assert (=> b!1192890 m!1101221))

(declare-fun m!1101223 () Bool)

(assert (=> b!1192878 m!1101223))

(declare-fun m!1101225 () Bool)

(assert (=> b!1192882 m!1101225))

(declare-fun m!1101227 () Bool)

(assert (=> b!1192880 m!1101227))

(declare-fun m!1101229 () Bool)

(assert (=> b!1192880 m!1101229))

(check-sat (not b!1192892) (not b!1192888) (not b!1192886) (not start!100068) (not b!1192880) (not b_lambda!20791) tp_is_empty!30177 b_and!42163 (not b!1192882) (not b!1192890) (not b!1192889) (not mapNonEmpty!47093) (not b_next!25647) (not b!1192878) (not b!1192884))
(check-sat b_and!42163 (not b_next!25647))
