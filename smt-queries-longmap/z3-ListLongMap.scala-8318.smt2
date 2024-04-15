; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101250 () Bool)

(assert start!101250)

(declare-fun b_free!26179 () Bool)

(declare-fun b_next!26179 () Bool)

(assert (=> start!101250 (= b_free!26179 (not b_next!26179))))

(declare-fun tp!91559 () Bool)

(declare-fun b_and!43457 () Bool)

(assert (=> start!101250 (= tp!91559 b_and!43457)))

(declare-fun b!1216103 () Bool)

(declare-fun res!807523 () Bool)

(declare-fun e!690447 () Bool)

(assert (=> b!1216103 (=> (not res!807523) (not e!690447))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216103 (= res!807523 (validMask!0 mask!1564))))

(declare-fun b!1216104 () Bool)

(declare-fun res!807531 () Bool)

(assert (=> b!1216104 (=> (not res!807531) (not e!690447))))

(declare-datatypes ((array!78460 0))(
  ( (array!78461 (arr!37865 (Array (_ BitVec 32) (_ BitVec 64))) (size!38403 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78460)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1216104 (= res!807531 (= (select (arr!37865 _keys!1208) i!673) k0!934))))

(declare-fun b!1216105 () Bool)

(declare-fun e!690442 () Bool)

(declare-fun e!690443 () Bool)

(assert (=> b!1216105 (= e!690442 (not e!690443))))

(declare-fun res!807532 () Bool)

(assert (=> b!1216105 (=> res!807532 e!690443)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216105 (= res!807532 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216105 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40183 0))(
  ( (Unit!40184) )
))
(declare-fun lt!552647 () Unit!40183)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78460 (_ BitVec 64) (_ BitVec 32)) Unit!40183)

(assert (=> b!1216105 (= lt!552647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48199 () Bool)

(declare-fun mapRes!48199 () Bool)

(assert (=> mapIsEmpty!48199 mapRes!48199))

(declare-fun b!1216107 () Bool)

(declare-fun res!807522 () Bool)

(assert (=> b!1216107 (=> (not res!807522) (not e!690447))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46305 0))(
  ( (V!46306 (val!15498 Int)) )
))
(declare-datatypes ((ValueCell!14732 0))(
  ( (ValueCellFull!14732 (v!18150 V!46305)) (EmptyCell!14732) )
))
(declare-datatypes ((array!78462 0))(
  ( (array!78463 (arr!37866 (Array (_ BitVec 32) ValueCell!14732)) (size!38404 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78462)

(assert (=> b!1216107 (= res!807522 (and (= (size!38404 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38403 _keys!1208) (size!38404 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216108 () Bool)

(declare-fun res!807530 () Bool)

(assert (=> b!1216108 (=> (not res!807530) (not e!690447))))

(declare-datatypes ((List!26788 0))(
  ( (Nil!26785) (Cons!26784 (h!27993 (_ BitVec 64)) (t!39938 List!26788)) )
))
(declare-fun arrayNoDuplicates!0 (array!78460 (_ BitVec 32) List!26788) Bool)

(assert (=> b!1216108 (= res!807530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26785))))

(declare-fun b!1216109 () Bool)

(declare-fun e!690448 () Bool)

(declare-fun e!690444 () Bool)

(assert (=> b!1216109 (= e!690448 (and e!690444 mapRes!48199))))

(declare-fun condMapEmpty!48199 () Bool)

(declare-fun mapDefault!48199 () ValueCell!14732)

(assert (=> b!1216109 (= condMapEmpty!48199 (= (arr!37866 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14732)) mapDefault!48199)))))

(declare-fun mapNonEmpty!48199 () Bool)

(declare-fun tp!91558 () Bool)

(declare-fun e!690446 () Bool)

(assert (=> mapNonEmpty!48199 (= mapRes!48199 (and tp!91558 e!690446))))

(declare-fun mapValue!48199 () ValueCell!14732)

(declare-fun mapRest!48199 () (Array (_ BitVec 32) ValueCell!14732))

(declare-fun mapKey!48199 () (_ BitVec 32))

(assert (=> mapNonEmpty!48199 (= (arr!37866 _values!996) (store mapRest!48199 mapKey!48199 mapValue!48199))))

(declare-fun b!1216110 () Bool)

(declare-fun tp_is_empty!30883 () Bool)

(assert (=> b!1216110 (= e!690446 tp_is_empty!30883)))

(declare-fun b!1216111 () Bool)

(declare-fun res!807529 () Bool)

(assert (=> b!1216111 (=> (not res!807529) (not e!690447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78460 (_ BitVec 32)) Bool)

(assert (=> b!1216111 (= res!807529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216112 () Bool)

(declare-fun res!807526 () Bool)

(assert (=> b!1216112 (=> (not res!807526) (not e!690447))))

(assert (=> b!1216112 (= res!807526 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38403 _keys!1208))))))

(declare-fun b!1216113 () Bool)

(assert (=> b!1216113 (= e!690443 (or (= from!1455 i!673) (bvsge from!1455 i!673) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38403 _keys!1208)) (bvslt (bvsub (size!38403 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38403 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46305)

(declare-fun lt!552645 () array!78460)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46305)

(declare-datatypes ((tuple2!20010 0))(
  ( (tuple2!20011 (_1!10016 (_ BitVec 64)) (_2!10016 V!46305)) )
))
(declare-datatypes ((List!26789 0))(
  ( (Nil!26786) (Cons!26785 (h!27994 tuple2!20010) (t!39939 List!26789)) )
))
(declare-datatypes ((ListLongMap!17979 0))(
  ( (ListLongMap!17980 (toList!9005 List!26789)) )
))
(declare-fun lt!552644 () ListLongMap!17979)

(declare-fun getCurrentListMapNoExtraKeys!5444 (array!78460 array!78462 (_ BitVec 32) (_ BitVec 32) V!46305 V!46305 (_ BitVec 32) Int) ListLongMap!17979)

(declare-fun dynLambda!3296 (Int (_ BitVec 64)) V!46305)

(assert (=> b!1216113 (= lt!552644 (getCurrentListMapNoExtraKeys!5444 lt!552645 (array!78463 (store (arr!37866 _values!996) i!673 (ValueCellFull!14732 (dynLambda!3296 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38404 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552646 () ListLongMap!17979)

(assert (=> b!1216113 (= lt!552646 (getCurrentListMapNoExtraKeys!5444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!807525 () Bool)

(assert (=> start!101250 (=> (not res!807525) (not e!690447))))

(assert (=> start!101250 (= res!807525 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38403 _keys!1208))))))

(assert (=> start!101250 e!690447))

(assert (=> start!101250 tp_is_empty!30883))

(declare-fun array_inv!28942 (array!78460) Bool)

(assert (=> start!101250 (array_inv!28942 _keys!1208)))

(assert (=> start!101250 true))

(assert (=> start!101250 tp!91559))

(declare-fun array_inv!28943 (array!78462) Bool)

(assert (=> start!101250 (and (array_inv!28943 _values!996) e!690448)))

(declare-fun b!1216106 () Bool)

(assert (=> b!1216106 (= e!690447 e!690442)))

(declare-fun res!807528 () Bool)

(assert (=> b!1216106 (=> (not res!807528) (not e!690442))))

(assert (=> b!1216106 (= res!807528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552645 mask!1564))))

(assert (=> b!1216106 (= lt!552645 (array!78461 (store (arr!37865 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38403 _keys!1208)))))

(declare-fun b!1216114 () Bool)

(declare-fun res!807524 () Bool)

(assert (=> b!1216114 (=> (not res!807524) (not e!690447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216114 (= res!807524 (validKeyInArray!0 k0!934))))

(declare-fun b!1216115 () Bool)

(declare-fun res!807527 () Bool)

(assert (=> b!1216115 (=> (not res!807527) (not e!690442))))

(assert (=> b!1216115 (= res!807527 (arrayNoDuplicates!0 lt!552645 #b00000000000000000000000000000000 Nil!26785))))

(declare-fun b!1216116 () Bool)

(assert (=> b!1216116 (= e!690444 tp_is_empty!30883)))

(assert (= (and start!101250 res!807525) b!1216103))

(assert (= (and b!1216103 res!807523) b!1216107))

(assert (= (and b!1216107 res!807522) b!1216111))

(assert (= (and b!1216111 res!807529) b!1216108))

(assert (= (and b!1216108 res!807530) b!1216112))

(assert (= (and b!1216112 res!807526) b!1216114))

(assert (= (and b!1216114 res!807524) b!1216104))

(assert (= (and b!1216104 res!807531) b!1216106))

(assert (= (and b!1216106 res!807528) b!1216115))

(assert (= (and b!1216115 res!807527) b!1216105))

(assert (= (and b!1216105 (not res!807532)) b!1216113))

(assert (= (and b!1216109 condMapEmpty!48199) mapIsEmpty!48199))

(assert (= (and b!1216109 (not condMapEmpty!48199)) mapNonEmpty!48199))

(get-info :version)

(assert (= (and mapNonEmpty!48199 ((_ is ValueCellFull!14732) mapValue!48199)) b!1216110))

(assert (= (and b!1216109 ((_ is ValueCellFull!14732) mapDefault!48199)) b!1216116))

(assert (= start!101250 b!1216109))

(declare-fun b_lambda!21845 () Bool)

(assert (=> (not b_lambda!21845) (not b!1216113)))

(declare-fun t!39937 () Bool)

(declare-fun tb!10971 () Bool)

(assert (=> (and start!101250 (= defaultEntry!1004 defaultEntry!1004) t!39937) tb!10971))

(declare-fun result!22547 () Bool)

(assert (=> tb!10971 (= result!22547 tp_is_empty!30883)))

(assert (=> b!1216113 t!39937))

(declare-fun b_and!43459 () Bool)

(assert (= b_and!43457 (and (=> t!39937 result!22547) b_and!43459)))

(declare-fun m!1120443 () Bool)

(assert (=> b!1216114 m!1120443))

(declare-fun m!1120445 () Bool)

(assert (=> start!101250 m!1120445))

(declare-fun m!1120447 () Bool)

(assert (=> start!101250 m!1120447))

(declare-fun m!1120449 () Bool)

(assert (=> b!1216104 m!1120449))

(declare-fun m!1120451 () Bool)

(assert (=> b!1216113 m!1120451))

(declare-fun m!1120453 () Bool)

(assert (=> b!1216113 m!1120453))

(declare-fun m!1120455 () Bool)

(assert (=> b!1216113 m!1120455))

(declare-fun m!1120457 () Bool)

(assert (=> b!1216113 m!1120457))

(declare-fun m!1120459 () Bool)

(assert (=> b!1216115 m!1120459))

(declare-fun m!1120461 () Bool)

(assert (=> mapNonEmpty!48199 m!1120461))

(declare-fun m!1120463 () Bool)

(assert (=> b!1216106 m!1120463))

(declare-fun m!1120465 () Bool)

(assert (=> b!1216106 m!1120465))

(declare-fun m!1120467 () Bool)

(assert (=> b!1216108 m!1120467))

(declare-fun m!1120469 () Bool)

(assert (=> b!1216103 m!1120469))

(declare-fun m!1120471 () Bool)

(assert (=> b!1216111 m!1120471))

(declare-fun m!1120473 () Bool)

(assert (=> b!1216105 m!1120473))

(declare-fun m!1120475 () Bool)

(assert (=> b!1216105 m!1120475))

(check-sat (not b_next!26179) (not b!1216115) (not b_lambda!21845) (not b!1216105) (not b!1216114) tp_is_empty!30883 (not b!1216103) (not start!101250) (not b!1216111) (not b!1216108) (not b!1216106) b_and!43459 (not mapNonEmpty!48199) (not b!1216113))
(check-sat b_and!43459 (not b_next!26179))
