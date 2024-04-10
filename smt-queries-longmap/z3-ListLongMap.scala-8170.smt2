; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99888 () Bool)

(assert start!99888)

(declare-fun b_free!25467 () Bool)

(declare-fun b_next!25467 () Bool)

(assert (=> start!99888 (= b_free!25467 (not b_next!25467))))

(declare-fun tp!89115 () Bool)

(declare-fun b_and!41801 () Bool)

(assert (=> start!99888 (= tp!89115 b_and!41801)))

(declare-fun b!1188648 () Bool)

(declare-fun e!675846 () Bool)

(declare-fun tp_is_empty!29997 () Bool)

(assert (=> b!1188648 (= e!675846 tp_is_empty!29997)))

(declare-fun b!1188649 () Bool)

(declare-fun res!790345 () Bool)

(declare-fun e!675843 () Bool)

(assert (=> b!1188649 (=> (not res!790345) (not e!675843))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188649 (= res!790345 (validKeyInArray!0 k0!934))))

(declare-fun b!1188650 () Bool)

(declare-fun e!675847 () Bool)

(assert (=> b!1188650 (= e!675843 e!675847)))

(declare-fun res!790350 () Bool)

(assert (=> b!1188650 (=> (not res!790350) (not e!675847))))

(declare-datatypes ((array!76789 0))(
  ( (array!76790 (arr!37044 (Array (_ BitVec 32) (_ BitVec 64))) (size!37580 (_ BitVec 32))) )
))
(declare-fun lt!540764 () array!76789)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76789 (_ BitVec 32)) Bool)

(assert (=> b!1188650 (= res!790350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540764 mask!1564))))

(declare-fun _keys!1208 () array!76789)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188650 (= lt!540764 (array!76790 (store (arr!37044 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37580 _keys!1208)))))

(declare-fun res!790347 () Bool)

(assert (=> start!99888 (=> (not res!790347) (not e!675843))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99888 (= res!790347 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37580 _keys!1208))))))

(assert (=> start!99888 e!675843))

(assert (=> start!99888 tp_is_empty!29997))

(declare-fun array_inv!28260 (array!76789) Bool)

(assert (=> start!99888 (array_inv!28260 _keys!1208)))

(assert (=> start!99888 true))

(assert (=> start!99888 tp!89115))

(declare-datatypes ((V!45123 0))(
  ( (V!45124 (val!15055 Int)) )
))
(declare-datatypes ((ValueCell!14289 0))(
  ( (ValueCellFull!14289 (v!17693 V!45123)) (EmptyCell!14289) )
))
(declare-datatypes ((array!76791 0))(
  ( (array!76792 (arr!37045 (Array (_ BitVec 32) ValueCell!14289)) (size!37581 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76791)

(declare-fun e!675848 () Bool)

(declare-fun array_inv!28261 (array!76791) Bool)

(assert (=> start!99888 (and (array_inv!28261 _values!996) e!675848)))

(declare-fun b!1188651 () Bool)

(declare-fun res!790346 () Bool)

(assert (=> b!1188651 (=> (not res!790346) (not e!675843))))

(assert (=> b!1188651 (= res!790346 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37580 _keys!1208))))))

(declare-fun mapIsEmpty!46823 () Bool)

(declare-fun mapRes!46823 () Bool)

(assert (=> mapIsEmpty!46823 mapRes!46823))

(declare-fun b!1188652 () Bool)

(declare-fun res!790342 () Bool)

(assert (=> b!1188652 (=> (not res!790342) (not e!675847))))

(declare-datatypes ((List!26075 0))(
  ( (Nil!26072) (Cons!26071 (h!27280 (_ BitVec 64)) (t!38534 List!26075)) )
))
(declare-fun arrayNoDuplicates!0 (array!76789 (_ BitVec 32) List!26075) Bool)

(assert (=> b!1188652 (= res!790342 (arrayNoDuplicates!0 lt!540764 #b00000000000000000000000000000000 Nil!26072))))

(declare-fun mapNonEmpty!46823 () Bool)

(declare-fun tp!89114 () Bool)

(assert (=> mapNonEmpty!46823 (= mapRes!46823 (and tp!89114 e!675846))))

(declare-fun mapValue!46823 () ValueCell!14289)

(declare-fun mapRest!46823 () (Array (_ BitVec 32) ValueCell!14289))

(declare-fun mapKey!46823 () (_ BitVec 32))

(assert (=> mapNonEmpty!46823 (= (arr!37045 _values!996) (store mapRest!46823 mapKey!46823 mapValue!46823))))

(declare-fun b!1188653 () Bool)

(declare-fun e!675845 () Bool)

(assert (=> b!1188653 (= e!675848 (and e!675845 mapRes!46823))))

(declare-fun condMapEmpty!46823 () Bool)

(declare-fun mapDefault!46823 () ValueCell!14289)

(assert (=> b!1188653 (= condMapEmpty!46823 (= (arr!37045 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14289)) mapDefault!46823)))))

(declare-fun b!1188654 () Bool)

(declare-fun res!790344 () Bool)

(assert (=> b!1188654 (=> (not res!790344) (not e!675843))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1188654 (= res!790344 (and (= (size!37581 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37580 _keys!1208) (size!37581 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188655 () Bool)

(declare-fun e!675849 () Bool)

(assert (=> b!1188655 (= e!675849 true)))

(declare-fun lt!540768 () array!76791)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45123)

(declare-fun zeroValue!944 () V!45123)

(declare-datatypes ((tuple2!19332 0))(
  ( (tuple2!19333 (_1!9677 (_ BitVec 64)) (_2!9677 V!45123)) )
))
(declare-datatypes ((List!26076 0))(
  ( (Nil!26073) (Cons!26072 (h!27281 tuple2!19332) (t!38535 List!26076)) )
))
(declare-datatypes ((ListLongMap!17301 0))(
  ( (ListLongMap!17302 (toList!8666 List!26076)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5107 (array!76789 array!76791 (_ BitVec 32) (_ BitVec 32) V!45123 V!45123 (_ BitVec 32) Int) ListLongMap!17301)

(declare-fun -!1696 (ListLongMap!17301 (_ BitVec 64)) ListLongMap!17301)

(assert (=> b!1188655 (= (getCurrentListMapNoExtraKeys!5107 lt!540764 lt!540768 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1696 (getCurrentListMapNoExtraKeys!5107 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39432 0))(
  ( (Unit!39433) )
))
(declare-fun lt!540767 () Unit!39432)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!905 (array!76789 array!76791 (_ BitVec 32) (_ BitVec 32) V!45123 V!45123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39432)

(assert (=> b!1188655 (= lt!540767 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!905 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188656 () Bool)

(declare-fun e!675844 () Bool)

(assert (=> b!1188656 (= e!675847 (not e!675844))))

(declare-fun res!790351 () Bool)

(assert (=> b!1188656 (=> res!790351 e!675844)))

(assert (=> b!1188656 (= res!790351 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188656 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540766 () Unit!39432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76789 (_ BitVec 64) (_ BitVec 32)) Unit!39432)

(assert (=> b!1188656 (= lt!540766 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188657 () Bool)

(declare-fun res!790341 () Bool)

(assert (=> b!1188657 (=> (not res!790341) (not e!675843))))

(assert (=> b!1188657 (= res!790341 (= (select (arr!37044 _keys!1208) i!673) k0!934))))

(declare-fun b!1188658 () Bool)

(declare-fun res!790340 () Bool)

(assert (=> b!1188658 (=> (not res!790340) (not e!675843))))

(assert (=> b!1188658 (= res!790340 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26072))))

(declare-fun b!1188659 () Bool)

(assert (=> b!1188659 (= e!675844 e!675849)))

(declare-fun res!790349 () Bool)

(assert (=> b!1188659 (=> res!790349 e!675849)))

(assert (=> b!1188659 (= res!790349 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540763 () ListLongMap!17301)

(assert (=> b!1188659 (= lt!540763 (getCurrentListMapNoExtraKeys!5107 lt!540764 lt!540768 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3051 (Int (_ BitVec 64)) V!45123)

(assert (=> b!1188659 (= lt!540768 (array!76792 (store (arr!37045 _values!996) i!673 (ValueCellFull!14289 (dynLambda!3051 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37581 _values!996)))))

(declare-fun lt!540765 () ListLongMap!17301)

(assert (=> b!1188659 (= lt!540765 (getCurrentListMapNoExtraKeys!5107 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188660 () Bool)

(assert (=> b!1188660 (= e!675845 tp_is_empty!29997)))

(declare-fun b!1188661 () Bool)

(declare-fun res!790343 () Bool)

(assert (=> b!1188661 (=> (not res!790343) (not e!675843))))

(assert (=> b!1188661 (= res!790343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188662 () Bool)

(declare-fun res!790348 () Bool)

(assert (=> b!1188662 (=> (not res!790348) (not e!675843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188662 (= res!790348 (validMask!0 mask!1564))))

(assert (= (and start!99888 res!790347) b!1188662))

(assert (= (and b!1188662 res!790348) b!1188654))

(assert (= (and b!1188654 res!790344) b!1188661))

(assert (= (and b!1188661 res!790343) b!1188658))

(assert (= (and b!1188658 res!790340) b!1188651))

(assert (= (and b!1188651 res!790346) b!1188649))

(assert (= (and b!1188649 res!790345) b!1188657))

(assert (= (and b!1188657 res!790341) b!1188650))

(assert (= (and b!1188650 res!790350) b!1188652))

(assert (= (and b!1188652 res!790342) b!1188656))

(assert (= (and b!1188656 (not res!790351)) b!1188659))

(assert (= (and b!1188659 (not res!790349)) b!1188655))

(assert (= (and b!1188653 condMapEmpty!46823) mapIsEmpty!46823))

(assert (= (and b!1188653 (not condMapEmpty!46823)) mapNonEmpty!46823))

(get-info :version)

(assert (= (and mapNonEmpty!46823 ((_ is ValueCellFull!14289) mapValue!46823)) b!1188648))

(assert (= (and b!1188653 ((_ is ValueCellFull!14289) mapDefault!46823)) b!1188660))

(assert (= start!99888 b!1188653))

(declare-fun b_lambda!20611 () Bool)

(assert (=> (not b_lambda!20611) (not b!1188659)))

(declare-fun t!38533 () Bool)

(declare-fun tb!10279 () Bool)

(assert (=> (and start!99888 (= defaultEntry!1004 defaultEntry!1004) t!38533) tb!10279))

(declare-fun result!21125 () Bool)

(assert (=> tb!10279 (= result!21125 tp_is_empty!29997)))

(assert (=> b!1188659 t!38533))

(declare-fun b_and!41803 () Bool)

(assert (= b_and!41801 (and (=> t!38533 result!21125) b_and!41803)))

(declare-fun m!1097409 () Bool)

(assert (=> b!1188658 m!1097409))

(declare-fun m!1097411 () Bool)

(assert (=> b!1188655 m!1097411))

(declare-fun m!1097413 () Bool)

(assert (=> b!1188655 m!1097413))

(assert (=> b!1188655 m!1097413))

(declare-fun m!1097415 () Bool)

(assert (=> b!1188655 m!1097415))

(declare-fun m!1097417 () Bool)

(assert (=> b!1188655 m!1097417))

(declare-fun m!1097419 () Bool)

(assert (=> b!1188649 m!1097419))

(declare-fun m!1097421 () Bool)

(assert (=> start!99888 m!1097421))

(declare-fun m!1097423 () Bool)

(assert (=> start!99888 m!1097423))

(declare-fun m!1097425 () Bool)

(assert (=> mapNonEmpty!46823 m!1097425))

(declare-fun m!1097427 () Bool)

(assert (=> b!1188662 m!1097427))

(declare-fun m!1097429 () Bool)

(assert (=> b!1188656 m!1097429))

(declare-fun m!1097431 () Bool)

(assert (=> b!1188656 m!1097431))

(declare-fun m!1097433 () Bool)

(assert (=> b!1188657 m!1097433))

(declare-fun m!1097435 () Bool)

(assert (=> b!1188659 m!1097435))

(declare-fun m!1097437 () Bool)

(assert (=> b!1188659 m!1097437))

(declare-fun m!1097439 () Bool)

(assert (=> b!1188659 m!1097439))

(declare-fun m!1097441 () Bool)

(assert (=> b!1188659 m!1097441))

(declare-fun m!1097443 () Bool)

(assert (=> b!1188661 m!1097443))

(declare-fun m!1097445 () Bool)

(assert (=> b!1188652 m!1097445))

(declare-fun m!1097447 () Bool)

(assert (=> b!1188650 m!1097447))

(declare-fun m!1097449 () Bool)

(assert (=> b!1188650 m!1097449))

(check-sat (not b!1188649) (not b!1188656) (not b_lambda!20611) (not b!1188661) tp_is_empty!29997 (not mapNonEmpty!46823) (not b!1188652) (not b!1188659) (not b!1188655) (not b!1188658) (not start!99888) (not b!1188662) (not b!1188650) b_and!41803 (not b_next!25467))
(check-sat b_and!41803 (not b_next!25467))
