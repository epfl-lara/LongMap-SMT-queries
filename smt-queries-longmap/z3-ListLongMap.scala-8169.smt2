; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99874 () Bool)

(assert start!99874)

(declare-fun b_free!25459 () Bool)

(declare-fun b_next!25459 () Bool)

(assert (=> start!99874 (= b_free!25459 (not b_next!25459))))

(declare-fun tp!89091 () Bool)

(declare-fun b_and!41763 () Bool)

(assert (=> start!99874 (= tp!89091 b_and!41763)))

(declare-fun b!1188336 () Bool)

(declare-fun res!790134 () Bool)

(declare-fun e!675675 () Bool)

(assert (=> b!1188336 (=> (not res!790134) (not e!675675))))

(declare-datatypes ((array!76710 0))(
  ( (array!76711 (arr!37005 (Array (_ BitVec 32) (_ BitVec 64))) (size!37543 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76710)

(declare-datatypes ((List!26154 0))(
  ( (Nil!26151) (Cons!26150 (h!27359 (_ BitVec 64)) (t!38596 List!26154)) )
))
(declare-fun arrayNoDuplicates!0 (array!76710 (_ BitVec 32) List!26154) Bool)

(assert (=> b!1188336 (= res!790134 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26151))))

(declare-fun b!1188337 () Bool)

(declare-fun res!790137 () Bool)

(declare-fun e!675674 () Bool)

(assert (=> b!1188337 (=> (not res!790137) (not e!675674))))

(declare-fun lt!540500 () array!76710)

(assert (=> b!1188337 (= res!790137 (arrayNoDuplicates!0 lt!540500 #b00000000000000000000000000000000 Nil!26151))))

(declare-fun b!1188338 () Bool)

(declare-fun res!790135 () Bool)

(assert (=> b!1188338 (=> (not res!790135) (not e!675675))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45113 0))(
  ( (V!45114 (val!15051 Int)) )
))
(declare-datatypes ((ValueCell!14285 0))(
  ( (ValueCellFull!14285 (v!17688 V!45113)) (EmptyCell!14285) )
))
(declare-datatypes ((array!76712 0))(
  ( (array!76713 (arr!37006 (Array (_ BitVec 32) ValueCell!14285)) (size!37544 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76712)

(assert (=> b!1188338 (= res!790135 (and (= (size!37544 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37543 _keys!1208) (size!37544 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46811 () Bool)

(declare-fun mapRes!46811 () Bool)

(declare-fun tp!89090 () Bool)

(declare-fun e!675670 () Bool)

(assert (=> mapNonEmpty!46811 (= mapRes!46811 (and tp!89090 e!675670))))

(declare-fun mapKey!46811 () (_ BitVec 32))

(declare-fun mapValue!46811 () ValueCell!14285)

(declare-fun mapRest!46811 () (Array (_ BitVec 32) ValueCell!14285))

(assert (=> mapNonEmpty!46811 (= (arr!37006 _values!996) (store mapRest!46811 mapKey!46811 mapValue!46811))))

(declare-fun b!1188339 () Bool)

(declare-fun e!675676 () Bool)

(declare-fun tp_is_empty!29989 () Bool)

(assert (=> b!1188339 (= e!675676 tp_is_empty!29989)))

(declare-fun b!1188340 () Bool)

(declare-fun res!790141 () Bool)

(assert (=> b!1188340 (=> (not res!790141) (not e!675675))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188340 (= res!790141 (validKeyInArray!0 k0!934))))

(declare-fun b!1188341 () Bool)

(declare-fun res!790139 () Bool)

(assert (=> b!1188341 (=> (not res!790139) (not e!675675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188341 (= res!790139 (validMask!0 mask!1564))))

(declare-fun b!1188342 () Bool)

(declare-fun res!790140 () Bool)

(assert (=> b!1188342 (=> (not res!790140) (not e!675675))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188342 (= res!790140 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37543 _keys!1208))))))

(declare-fun mapIsEmpty!46811 () Bool)

(assert (=> mapIsEmpty!46811 mapRes!46811))

(declare-fun b!1188343 () Bool)

(declare-fun e!675671 () Bool)

(declare-fun e!675669 () Bool)

(assert (=> b!1188343 (= e!675671 e!675669)))

(declare-fun res!790131 () Bool)

(assert (=> b!1188343 (=> res!790131 e!675669)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188343 (= res!790131 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45113)

(declare-datatypes ((tuple2!19442 0))(
  ( (tuple2!19443 (_1!9732 (_ BitVec 64)) (_2!9732 V!45113)) )
))
(declare-datatypes ((List!26155 0))(
  ( (Nil!26152) (Cons!26151 (h!27360 tuple2!19442) (t!38597 List!26155)) )
))
(declare-datatypes ((ListLongMap!17411 0))(
  ( (ListLongMap!17412 (toList!8721 List!26155)) )
))
(declare-fun lt!540504 () ListLongMap!17411)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540501 () array!76712)

(declare-fun minValue!944 () V!45113)

(declare-fun getCurrentListMapNoExtraKeys!5171 (array!76710 array!76712 (_ BitVec 32) (_ BitVec 32) V!45113 V!45113 (_ BitVec 32) Int) ListLongMap!17411)

(assert (=> b!1188343 (= lt!540504 (getCurrentListMapNoExtraKeys!5171 lt!540500 lt!540501 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3068 (Int (_ BitVec 64)) V!45113)

(assert (=> b!1188343 (= lt!540501 (array!76713 (store (arr!37006 _values!996) i!673 (ValueCellFull!14285 (dynLambda!3068 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37544 _values!996)))))

(declare-fun lt!540503 () ListLongMap!17411)

(assert (=> b!1188343 (= lt!540503 (getCurrentListMapNoExtraKeys!5171 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188344 () Bool)

(declare-fun res!790130 () Bool)

(assert (=> b!1188344 (=> (not res!790130) (not e!675675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76710 (_ BitVec 32)) Bool)

(assert (=> b!1188344 (= res!790130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188346 () Bool)

(declare-fun e!675672 () Bool)

(assert (=> b!1188346 (= e!675672 (and e!675676 mapRes!46811))))

(declare-fun condMapEmpty!46811 () Bool)

(declare-fun mapDefault!46811 () ValueCell!14285)

(assert (=> b!1188346 (= condMapEmpty!46811 (= (arr!37006 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14285)) mapDefault!46811)))))

(declare-fun b!1188347 () Bool)

(declare-fun res!790133 () Bool)

(assert (=> b!1188347 (=> (not res!790133) (not e!675675))))

(assert (=> b!1188347 (= res!790133 (= (select (arr!37005 _keys!1208) i!673) k0!934))))

(declare-fun b!1188348 () Bool)

(assert (=> b!1188348 (= e!675669 true)))

(declare-fun -!1669 (ListLongMap!17411 (_ BitVec 64)) ListLongMap!17411)

(assert (=> b!1188348 (= (getCurrentListMapNoExtraKeys!5171 lt!540500 lt!540501 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1669 (getCurrentListMapNoExtraKeys!5171 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39299 0))(
  ( (Unit!39300) )
))
(declare-fun lt!540502 () Unit!39299)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!919 (array!76710 array!76712 (_ BitVec 32) (_ BitVec 32) V!45113 V!45113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39299)

(assert (=> b!1188348 (= lt!540502 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188349 () Bool)

(assert (=> b!1188349 (= e!675675 e!675674)))

(declare-fun res!790132 () Bool)

(assert (=> b!1188349 (=> (not res!790132) (not e!675674))))

(assert (=> b!1188349 (= res!790132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540500 mask!1564))))

(assert (=> b!1188349 (= lt!540500 (array!76711 (store (arr!37005 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37543 _keys!1208)))))

(declare-fun b!1188350 () Bool)

(assert (=> b!1188350 (= e!675670 tp_is_empty!29989)))

(declare-fun b!1188345 () Bool)

(assert (=> b!1188345 (= e!675674 (not e!675671))))

(declare-fun res!790138 () Bool)

(assert (=> b!1188345 (=> res!790138 e!675671)))

(assert (=> b!1188345 (= res!790138 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188345 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540499 () Unit!39299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76710 (_ BitVec 64) (_ BitVec 32)) Unit!39299)

(assert (=> b!1188345 (= lt!540499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!790136 () Bool)

(assert (=> start!99874 (=> (not res!790136) (not e!675675))))

(assert (=> start!99874 (= res!790136 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37543 _keys!1208))))))

(assert (=> start!99874 e!675675))

(assert (=> start!99874 tp_is_empty!29989))

(declare-fun array_inv!28342 (array!76710) Bool)

(assert (=> start!99874 (array_inv!28342 _keys!1208)))

(assert (=> start!99874 true))

(assert (=> start!99874 tp!89091))

(declare-fun array_inv!28343 (array!76712) Bool)

(assert (=> start!99874 (and (array_inv!28343 _values!996) e!675672)))

(assert (= (and start!99874 res!790136) b!1188341))

(assert (= (and b!1188341 res!790139) b!1188338))

(assert (= (and b!1188338 res!790135) b!1188344))

(assert (= (and b!1188344 res!790130) b!1188336))

(assert (= (and b!1188336 res!790134) b!1188342))

(assert (= (and b!1188342 res!790140) b!1188340))

(assert (= (and b!1188340 res!790141) b!1188347))

(assert (= (and b!1188347 res!790133) b!1188349))

(assert (= (and b!1188349 res!790132) b!1188337))

(assert (= (and b!1188337 res!790137) b!1188345))

(assert (= (and b!1188345 (not res!790138)) b!1188343))

(assert (= (and b!1188343 (not res!790131)) b!1188348))

(assert (= (and b!1188346 condMapEmpty!46811) mapIsEmpty!46811))

(assert (= (and b!1188346 (not condMapEmpty!46811)) mapNonEmpty!46811))

(get-info :version)

(assert (= (and mapNonEmpty!46811 ((_ is ValueCellFull!14285) mapValue!46811)) b!1188350))

(assert (= (and b!1188346 ((_ is ValueCellFull!14285) mapDefault!46811)) b!1188339))

(assert (= start!99874 b!1188346))

(declare-fun b_lambda!20585 () Bool)

(assert (=> (not b_lambda!20585) (not b!1188343)))

(declare-fun t!38595 () Bool)

(declare-fun tb!10263 () Bool)

(assert (=> (and start!99874 (= defaultEntry!1004 defaultEntry!1004) t!38595) tb!10263))

(declare-fun result!21101 () Bool)

(assert (=> tb!10263 (= result!21101 tp_is_empty!29989)))

(assert (=> b!1188343 t!38595))

(declare-fun b_and!41765 () Bool)

(assert (= b_and!41763 (and (=> t!38595 result!21101) b_and!41765)))

(declare-fun m!1096631 () Bool)

(assert (=> b!1188348 m!1096631))

(declare-fun m!1096633 () Bool)

(assert (=> b!1188348 m!1096633))

(assert (=> b!1188348 m!1096633))

(declare-fun m!1096635 () Bool)

(assert (=> b!1188348 m!1096635))

(declare-fun m!1096637 () Bool)

(assert (=> b!1188348 m!1096637))

(declare-fun m!1096639 () Bool)

(assert (=> b!1188345 m!1096639))

(declare-fun m!1096641 () Bool)

(assert (=> b!1188345 m!1096641))

(declare-fun m!1096643 () Bool)

(assert (=> b!1188341 m!1096643))

(declare-fun m!1096645 () Bool)

(assert (=> start!99874 m!1096645))

(declare-fun m!1096647 () Bool)

(assert (=> start!99874 m!1096647))

(declare-fun m!1096649 () Bool)

(assert (=> mapNonEmpty!46811 m!1096649))

(declare-fun m!1096651 () Bool)

(assert (=> b!1188344 m!1096651))

(declare-fun m!1096653 () Bool)

(assert (=> b!1188340 m!1096653))

(declare-fun m!1096655 () Bool)

(assert (=> b!1188336 m!1096655))

(declare-fun m!1096657 () Bool)

(assert (=> b!1188343 m!1096657))

(declare-fun m!1096659 () Bool)

(assert (=> b!1188343 m!1096659))

(declare-fun m!1096661 () Bool)

(assert (=> b!1188343 m!1096661))

(declare-fun m!1096663 () Bool)

(assert (=> b!1188343 m!1096663))

(declare-fun m!1096665 () Bool)

(assert (=> b!1188347 m!1096665))

(declare-fun m!1096667 () Bool)

(assert (=> b!1188337 m!1096667))

(declare-fun m!1096669 () Bool)

(assert (=> b!1188349 m!1096669))

(declare-fun m!1096671 () Bool)

(assert (=> b!1188349 m!1096671))

(check-sat (not b!1188337) (not mapNonEmpty!46811) (not b!1188345) (not b!1188344) (not b!1188343) (not b!1188341) (not b!1188340) (not b!1188348) b_and!41765 (not b!1188336) (not start!99874) (not b!1188349) tp_is_empty!29989 (not b_lambda!20585) (not b_next!25459))
(check-sat b_and!41765 (not b_next!25459))
