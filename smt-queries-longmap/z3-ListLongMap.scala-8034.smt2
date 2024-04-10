; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99046 () Bool)

(assert start!99046)

(declare-fun b_free!24651 () Bool)

(declare-fun b_next!24651 () Bool)

(assert (=> start!99046 (= b_free!24651 (not b_next!24651))))

(declare-fun tp!86664 () Bool)

(declare-fun b_and!40151 () Bool)

(assert (=> start!99046 (= tp!86664 b_and!40151)))

(declare-fun b!1164446 () Bool)

(declare-fun e!662064 () Bool)

(declare-fun tp_is_empty!29181 () Bool)

(assert (=> b!1164446 (= e!662064 tp_is_empty!29181)))

(declare-fun b!1164447 () Bool)

(declare-fun e!662068 () Bool)

(declare-fun e!662070 () Bool)

(assert (=> b!1164447 (= e!662068 e!662070)))

(declare-fun res!772195 () Bool)

(assert (=> b!1164447 (=> (not res!772195) (not e!662070))))

(declare-datatypes ((array!75197 0))(
  ( (array!75198 (arr!36249 (Array (_ BitVec 32) (_ BitVec 64))) (size!36785 (_ BitVec 32))) )
))
(declare-fun lt!524642 () array!75197)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75197 (_ BitVec 32)) Bool)

(assert (=> b!1164447 (= res!772195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524642 mask!1564))))

(declare-fun _keys!1208 () array!75197)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164447 (= lt!524642 (array!75198 (store (arr!36249 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36785 _keys!1208)))))

(declare-fun mapIsEmpty!45596 () Bool)

(declare-fun mapRes!45596 () Bool)

(assert (=> mapIsEmpty!45596 mapRes!45596))

(declare-fun b!1164449 () Bool)

(declare-fun res!772190 () Bool)

(assert (=> b!1164449 (=> (not res!772190) (not e!662068))))

(assert (=> b!1164449 (= res!772190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164450 () Bool)

(declare-fun res!772189 () Bool)

(assert (=> b!1164450 (=> (not res!772189) (not e!662068))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164450 (= res!772189 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45596 () Bool)

(declare-fun tp!86663 () Bool)

(declare-fun e!662066 () Bool)

(assert (=> mapNonEmpty!45596 (= mapRes!45596 (and tp!86663 e!662066))))

(declare-fun mapKey!45596 () (_ BitVec 32))

(declare-datatypes ((V!44035 0))(
  ( (V!44036 (val!14647 Int)) )
))
(declare-datatypes ((ValueCell!13881 0))(
  ( (ValueCellFull!13881 (v!17284 V!44035)) (EmptyCell!13881) )
))
(declare-fun mapValue!45596 () ValueCell!13881)

(declare-fun mapRest!45596 () (Array (_ BitVec 32) ValueCell!13881))

(declare-datatypes ((array!75199 0))(
  ( (array!75200 (arr!36250 (Array (_ BitVec 32) ValueCell!13881)) (size!36786 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75199)

(assert (=> mapNonEmpty!45596 (= (arr!36250 _values!996) (store mapRest!45596 mapKey!45596 mapValue!45596))))

(declare-fun b!1164451 () Bool)

(declare-fun e!662067 () Bool)

(assert (=> b!1164451 (= e!662070 (not e!662067))))

(declare-fun res!772196 () Bool)

(assert (=> b!1164451 (=> res!772196 e!662067)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1164451 (= res!772196 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164451 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38434 0))(
  ( (Unit!38435) )
))
(declare-fun lt!524643 () Unit!38434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75197 (_ BitVec 64) (_ BitVec 32)) Unit!38434)

(assert (=> b!1164451 (= lt!524643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164452 () Bool)

(declare-fun res!772186 () Bool)

(assert (=> b!1164452 (=> (not res!772186) (not e!662068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164452 (= res!772186 (validMask!0 mask!1564))))

(declare-fun b!1164453 () Bool)

(declare-fun res!772193 () Bool)

(assert (=> b!1164453 (=> (not res!772193) (not e!662068))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1164453 (= res!772193 (and (= (size!36786 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36785 _keys!1208) (size!36786 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164454 () Bool)

(assert (=> b!1164454 (= e!662066 tp_is_empty!29181)))

(declare-fun b!1164455 () Bool)

(declare-fun res!772192 () Bool)

(assert (=> b!1164455 (=> (not res!772192) (not e!662070))))

(declare-datatypes ((List!25413 0))(
  ( (Nil!25410) (Cons!25409 (h!26618 (_ BitVec 64)) (t!37056 List!25413)) )
))
(declare-fun arrayNoDuplicates!0 (array!75197 (_ BitVec 32) List!25413) Bool)

(assert (=> b!1164455 (= res!772192 (arrayNoDuplicates!0 lt!524642 #b00000000000000000000000000000000 Nil!25410))))

(declare-fun b!1164456 () Bool)

(declare-fun res!772191 () Bool)

(assert (=> b!1164456 (=> (not res!772191) (not e!662068))))

(assert (=> b!1164456 (= res!772191 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25410))))

(declare-fun b!1164457 () Bool)

(assert (=> b!1164457 (= e!662067 true)))

(declare-fun zeroValue!944 () V!44035)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18680 0))(
  ( (tuple2!18681 (_1!9351 (_ BitVec 64)) (_2!9351 V!44035)) )
))
(declare-datatypes ((List!25414 0))(
  ( (Nil!25411) (Cons!25410 (h!26619 tuple2!18680) (t!37057 List!25414)) )
))
(declare-datatypes ((ListLongMap!16649 0))(
  ( (ListLongMap!16650 (toList!8340 List!25414)) )
))
(declare-fun lt!524640 () ListLongMap!16649)

(declare-fun minValue!944 () V!44035)

(declare-fun getCurrentListMapNoExtraKeys!4804 (array!75197 array!75199 (_ BitVec 32) (_ BitVec 32) V!44035 V!44035 (_ BitVec 32) Int) ListLongMap!16649)

(declare-fun dynLambda!2794 (Int (_ BitVec 64)) V!44035)

(assert (=> b!1164457 (= lt!524640 (getCurrentListMapNoExtraKeys!4804 lt!524642 (array!75200 (store (arr!36250 _values!996) i!673 (ValueCellFull!13881 (dynLambda!2794 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36786 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524641 () ListLongMap!16649)

(assert (=> b!1164457 (= lt!524641 (getCurrentListMapNoExtraKeys!4804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164448 () Bool)

(declare-fun e!662069 () Bool)

(assert (=> b!1164448 (= e!662069 (and e!662064 mapRes!45596))))

(declare-fun condMapEmpty!45596 () Bool)

(declare-fun mapDefault!45596 () ValueCell!13881)

(assert (=> b!1164448 (= condMapEmpty!45596 (= (arr!36250 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13881)) mapDefault!45596)))))

(declare-fun res!772194 () Bool)

(assert (=> start!99046 (=> (not res!772194) (not e!662068))))

(assert (=> start!99046 (= res!772194 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36785 _keys!1208))))))

(assert (=> start!99046 e!662068))

(assert (=> start!99046 tp_is_empty!29181))

(declare-fun array_inv!27734 (array!75197) Bool)

(assert (=> start!99046 (array_inv!27734 _keys!1208)))

(assert (=> start!99046 true))

(assert (=> start!99046 tp!86664))

(declare-fun array_inv!27735 (array!75199) Bool)

(assert (=> start!99046 (and (array_inv!27735 _values!996) e!662069)))

(declare-fun b!1164458 () Bool)

(declare-fun res!772188 () Bool)

(assert (=> b!1164458 (=> (not res!772188) (not e!662068))))

(assert (=> b!1164458 (= res!772188 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36785 _keys!1208))))))

(declare-fun b!1164459 () Bool)

(declare-fun res!772187 () Bool)

(assert (=> b!1164459 (=> (not res!772187) (not e!662068))))

(assert (=> b!1164459 (= res!772187 (= (select (arr!36249 _keys!1208) i!673) k0!934))))

(assert (= (and start!99046 res!772194) b!1164452))

(assert (= (and b!1164452 res!772186) b!1164453))

(assert (= (and b!1164453 res!772193) b!1164449))

(assert (= (and b!1164449 res!772190) b!1164456))

(assert (= (and b!1164456 res!772191) b!1164458))

(assert (= (and b!1164458 res!772188) b!1164450))

(assert (= (and b!1164450 res!772189) b!1164459))

(assert (= (and b!1164459 res!772187) b!1164447))

(assert (= (and b!1164447 res!772195) b!1164455))

(assert (= (and b!1164455 res!772192) b!1164451))

(assert (= (and b!1164451 (not res!772196)) b!1164457))

(assert (= (and b!1164448 condMapEmpty!45596) mapIsEmpty!45596))

(assert (= (and b!1164448 (not condMapEmpty!45596)) mapNonEmpty!45596))

(get-info :version)

(assert (= (and mapNonEmpty!45596 ((_ is ValueCellFull!13881) mapValue!45596)) b!1164454))

(assert (= (and b!1164448 ((_ is ValueCellFull!13881) mapDefault!45596)) b!1164446))

(assert (= start!99046 b!1164448))

(declare-fun b_lambda!19757 () Bool)

(assert (=> (not b_lambda!19757) (not b!1164457)))

(declare-fun t!37055 () Bool)

(declare-fun tb!9463 () Bool)

(assert (=> (and start!99046 (= defaultEntry!1004 defaultEntry!1004) t!37055) tb!9463))

(declare-fun result!19491 () Bool)

(assert (=> tb!9463 (= result!19491 tp_is_empty!29181)))

(assert (=> b!1164457 t!37055))

(declare-fun b_and!40153 () Bool)

(assert (= b_and!40151 (and (=> t!37055 result!19491) b_and!40153)))

(declare-fun m!1072869 () Bool)

(assert (=> b!1164455 m!1072869))

(declare-fun m!1072871 () Bool)

(assert (=> b!1164459 m!1072871))

(declare-fun m!1072873 () Bool)

(assert (=> b!1164449 m!1072873))

(declare-fun m!1072875 () Bool)

(assert (=> b!1164452 m!1072875))

(declare-fun m!1072877 () Bool)

(assert (=> start!99046 m!1072877))

(declare-fun m!1072879 () Bool)

(assert (=> start!99046 m!1072879))

(declare-fun m!1072881 () Bool)

(assert (=> b!1164457 m!1072881))

(declare-fun m!1072883 () Bool)

(assert (=> b!1164457 m!1072883))

(declare-fun m!1072885 () Bool)

(assert (=> b!1164457 m!1072885))

(declare-fun m!1072887 () Bool)

(assert (=> b!1164457 m!1072887))

(declare-fun m!1072889 () Bool)

(assert (=> b!1164451 m!1072889))

(declare-fun m!1072891 () Bool)

(assert (=> b!1164451 m!1072891))

(declare-fun m!1072893 () Bool)

(assert (=> b!1164447 m!1072893))

(declare-fun m!1072895 () Bool)

(assert (=> b!1164447 m!1072895))

(declare-fun m!1072897 () Bool)

(assert (=> b!1164456 m!1072897))

(declare-fun m!1072899 () Bool)

(assert (=> mapNonEmpty!45596 m!1072899))

(declare-fun m!1072901 () Bool)

(assert (=> b!1164450 m!1072901))

(check-sat (not b_next!24651) (not b!1164451) (not b!1164452) (not b!1164447) (not b!1164457) (not start!99046) (not b!1164449) (not b!1164456) b_and!40153 tp_is_empty!29181 (not b!1164455) (not b_lambda!19757) (not mapNonEmpty!45596) (not b!1164450))
(check-sat b_and!40153 (not b_next!24651))
