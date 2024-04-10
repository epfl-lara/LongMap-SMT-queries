; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99094 () Bool)

(assert start!99094)

(declare-fun b_free!24699 () Bool)

(declare-fun b_next!24699 () Bool)

(assert (=> start!99094 (= b_free!24699 (not b_next!24699))))

(declare-fun tp!86808 () Bool)

(declare-fun b_and!40247 () Bool)

(assert (=> start!99094 (= tp!86808 b_and!40247)))

(declare-fun b!1165502 () Bool)

(declare-fun res!772981 () Bool)

(declare-fun e!662568 () Bool)

(assert (=> b!1165502 (=> (not res!772981) (not e!662568))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!75289 0))(
  ( (array!75290 (arr!36295 (Array (_ BitVec 32) (_ BitVec 64))) (size!36831 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75289)

(assert (=> b!1165502 (= res!772981 (= (select (arr!36295 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45668 () Bool)

(declare-fun mapRes!45668 () Bool)

(assert (=> mapIsEmpty!45668 mapRes!45668))

(declare-fun b!1165503 () Bool)

(declare-fun e!662573 () Bool)

(assert (=> b!1165503 (= e!662573 true)))

(declare-datatypes ((V!44099 0))(
  ( (V!44100 (val!14671 Int)) )
))
(declare-fun zeroValue!944 () V!44099)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18708 0))(
  ( (tuple2!18709 (_1!9365 (_ BitVec 64)) (_2!9365 V!44099)) )
))
(declare-datatypes ((List!25444 0))(
  ( (Nil!25441) (Cons!25440 (h!26649 tuple2!18708) (t!37135 List!25444)) )
))
(declare-datatypes ((ListLongMap!16677 0))(
  ( (ListLongMap!16678 (toList!8354 List!25444)) )
))
(declare-fun lt!524931 () ListLongMap!16677)

(declare-datatypes ((ValueCell!13905 0))(
  ( (ValueCellFull!13905 (v!17308 V!44099)) (EmptyCell!13905) )
))
(declare-datatypes ((array!75291 0))(
  ( (array!75292 (arr!36296 (Array (_ BitVec 32) ValueCell!13905)) (size!36832 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75291)

(declare-fun minValue!944 () V!44099)

(declare-fun lt!524928 () array!75289)

(declare-fun getCurrentListMapNoExtraKeys!4818 (array!75289 array!75291 (_ BitVec 32) (_ BitVec 32) V!44099 V!44099 (_ BitVec 32) Int) ListLongMap!16677)

(declare-fun dynLambda!2808 (Int (_ BitVec 64)) V!44099)

(assert (=> b!1165503 (= lt!524931 (getCurrentListMapNoExtraKeys!4818 lt!524928 (array!75292 (store (arr!36296 _values!996) i!673 (ValueCellFull!13905 (dynLambda!2808 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36832 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524929 () ListLongMap!16677)

(assert (=> b!1165503 (= lt!524929 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165504 () Bool)

(declare-fun res!772982 () Bool)

(assert (=> b!1165504 (=> (not res!772982) (not e!662568))))

(assert (=> b!1165504 (= res!772982 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36831 _keys!1208))))))

(declare-fun b!1165505 () Bool)

(declare-fun e!662571 () Bool)

(declare-fun e!662569 () Bool)

(assert (=> b!1165505 (= e!662571 (and e!662569 mapRes!45668))))

(declare-fun condMapEmpty!45668 () Bool)

(declare-fun mapDefault!45668 () ValueCell!13905)

(assert (=> b!1165505 (= condMapEmpty!45668 (= (arr!36296 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13905)) mapDefault!45668)))))

(declare-fun b!1165506 () Bool)

(declare-fun res!772979 () Bool)

(declare-fun e!662570 () Bool)

(assert (=> b!1165506 (=> (not res!772979) (not e!662570))))

(declare-datatypes ((List!25445 0))(
  ( (Nil!25442) (Cons!25441 (h!26650 (_ BitVec 64)) (t!37136 List!25445)) )
))
(declare-fun arrayNoDuplicates!0 (array!75289 (_ BitVec 32) List!25445) Bool)

(assert (=> b!1165506 (= res!772979 (arrayNoDuplicates!0 lt!524928 #b00000000000000000000000000000000 Nil!25442))))

(declare-fun b!1165507 () Bool)

(declare-fun res!772978 () Bool)

(assert (=> b!1165507 (=> (not res!772978) (not e!662568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165507 (= res!772978 (validKeyInArray!0 k0!934))))

(declare-fun b!1165508 () Bool)

(declare-fun res!772986 () Bool)

(assert (=> b!1165508 (=> (not res!772986) (not e!662568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75289 (_ BitVec 32)) Bool)

(assert (=> b!1165508 (= res!772986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45668 () Bool)

(declare-fun tp!86807 () Bool)

(declare-fun e!662574 () Bool)

(assert (=> mapNonEmpty!45668 (= mapRes!45668 (and tp!86807 e!662574))))

(declare-fun mapValue!45668 () ValueCell!13905)

(declare-fun mapKey!45668 () (_ BitVec 32))

(declare-fun mapRest!45668 () (Array (_ BitVec 32) ValueCell!13905))

(assert (=> mapNonEmpty!45668 (= (arr!36296 _values!996) (store mapRest!45668 mapKey!45668 mapValue!45668))))

(declare-fun b!1165509 () Bool)

(declare-fun res!772984 () Bool)

(assert (=> b!1165509 (=> (not res!772984) (not e!662568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165509 (= res!772984 (validMask!0 mask!1564))))

(declare-fun b!1165510 () Bool)

(declare-fun res!772980 () Bool)

(assert (=> b!1165510 (=> (not res!772980) (not e!662568))))

(assert (=> b!1165510 (= res!772980 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25442))))

(declare-fun b!1165511 () Bool)

(declare-fun tp_is_empty!29229 () Bool)

(assert (=> b!1165511 (= e!662574 tp_is_empty!29229)))

(declare-fun res!772988 () Bool)

(assert (=> start!99094 (=> (not res!772988) (not e!662568))))

(assert (=> start!99094 (= res!772988 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36831 _keys!1208))))))

(assert (=> start!99094 e!662568))

(assert (=> start!99094 tp_is_empty!29229))

(declare-fun array_inv!27760 (array!75289) Bool)

(assert (=> start!99094 (array_inv!27760 _keys!1208)))

(assert (=> start!99094 true))

(assert (=> start!99094 tp!86808))

(declare-fun array_inv!27761 (array!75291) Bool)

(assert (=> start!99094 (and (array_inv!27761 _values!996) e!662571)))

(declare-fun b!1165512 () Bool)

(assert (=> b!1165512 (= e!662569 tp_is_empty!29229)))

(declare-fun b!1165513 () Bool)

(declare-fun res!772983 () Bool)

(assert (=> b!1165513 (=> (not res!772983) (not e!662568))))

(assert (=> b!1165513 (= res!772983 (and (= (size!36832 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36831 _keys!1208) (size!36832 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165514 () Bool)

(assert (=> b!1165514 (= e!662568 e!662570)))

(declare-fun res!772987 () Bool)

(assert (=> b!1165514 (=> (not res!772987) (not e!662570))))

(assert (=> b!1165514 (= res!772987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524928 mask!1564))))

(assert (=> b!1165514 (= lt!524928 (array!75290 (store (arr!36295 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36831 _keys!1208)))))

(declare-fun b!1165515 () Bool)

(assert (=> b!1165515 (= e!662570 (not e!662573))))

(declare-fun res!772985 () Bool)

(assert (=> b!1165515 (=> res!772985 e!662573)))

(assert (=> b!1165515 (= res!772985 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165515 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38460 0))(
  ( (Unit!38461) )
))
(declare-fun lt!524930 () Unit!38460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75289 (_ BitVec 64) (_ BitVec 32)) Unit!38460)

(assert (=> b!1165515 (= lt!524930 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99094 res!772988) b!1165509))

(assert (= (and b!1165509 res!772984) b!1165513))

(assert (= (and b!1165513 res!772983) b!1165508))

(assert (= (and b!1165508 res!772986) b!1165510))

(assert (= (and b!1165510 res!772980) b!1165504))

(assert (= (and b!1165504 res!772982) b!1165507))

(assert (= (and b!1165507 res!772978) b!1165502))

(assert (= (and b!1165502 res!772981) b!1165514))

(assert (= (and b!1165514 res!772987) b!1165506))

(assert (= (and b!1165506 res!772979) b!1165515))

(assert (= (and b!1165515 (not res!772985)) b!1165503))

(assert (= (and b!1165505 condMapEmpty!45668) mapIsEmpty!45668))

(assert (= (and b!1165505 (not condMapEmpty!45668)) mapNonEmpty!45668))

(get-info :version)

(assert (= (and mapNonEmpty!45668 ((_ is ValueCellFull!13905) mapValue!45668)) b!1165511))

(assert (= (and b!1165505 ((_ is ValueCellFull!13905) mapDefault!45668)) b!1165512))

(assert (= start!99094 b!1165505))

(declare-fun b_lambda!19805 () Bool)

(assert (=> (not b_lambda!19805) (not b!1165503)))

(declare-fun t!37134 () Bool)

(declare-fun tb!9511 () Bool)

(assert (=> (and start!99094 (= defaultEntry!1004 defaultEntry!1004) t!37134) tb!9511))

(declare-fun result!19587 () Bool)

(assert (=> tb!9511 (= result!19587 tp_is_empty!29229)))

(assert (=> b!1165503 t!37134))

(declare-fun b_and!40249 () Bool)

(assert (= b_and!40247 (and (=> t!37134 result!19587) b_and!40249)))

(declare-fun m!1073685 () Bool)

(assert (=> b!1165515 m!1073685))

(declare-fun m!1073687 () Bool)

(assert (=> b!1165515 m!1073687))

(declare-fun m!1073689 () Bool)

(assert (=> b!1165509 m!1073689))

(declare-fun m!1073691 () Bool)

(assert (=> mapNonEmpty!45668 m!1073691))

(declare-fun m!1073693 () Bool)

(assert (=> b!1165503 m!1073693))

(declare-fun m!1073695 () Bool)

(assert (=> b!1165503 m!1073695))

(declare-fun m!1073697 () Bool)

(assert (=> b!1165503 m!1073697))

(declare-fun m!1073699 () Bool)

(assert (=> b!1165503 m!1073699))

(declare-fun m!1073701 () Bool)

(assert (=> b!1165510 m!1073701))

(declare-fun m!1073703 () Bool)

(assert (=> b!1165508 m!1073703))

(declare-fun m!1073705 () Bool)

(assert (=> b!1165502 m!1073705))

(declare-fun m!1073707 () Bool)

(assert (=> b!1165507 m!1073707))

(declare-fun m!1073709 () Bool)

(assert (=> b!1165514 m!1073709))

(declare-fun m!1073711 () Bool)

(assert (=> b!1165514 m!1073711))

(declare-fun m!1073713 () Bool)

(assert (=> start!99094 m!1073713))

(declare-fun m!1073715 () Bool)

(assert (=> start!99094 m!1073715))

(declare-fun m!1073717 () Bool)

(assert (=> b!1165506 m!1073717))

(check-sat (not b!1165515) tp_is_empty!29229 (not b!1165508) (not b!1165503) (not b!1165507) b_and!40249 (not b_next!24699) (not mapNonEmpty!45668) (not b!1165509) (not b!1165514) (not b!1165510) (not b!1165506) (not start!99094) (not b_lambda!19805))
(check-sat b_and!40249 (not b_next!24699))
