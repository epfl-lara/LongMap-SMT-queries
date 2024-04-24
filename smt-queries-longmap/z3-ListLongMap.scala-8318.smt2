; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101492 () Bool)

(assert start!101492)

(declare-fun b_free!26179 () Bool)

(declare-fun b_next!26179 () Bool)

(assert (=> start!101492 (= b_free!26179 (not b_next!26179))))

(declare-fun tp!91558 () Bool)

(declare-fun b_and!43477 () Bool)

(assert (=> start!101492 (= tp!91558 b_and!43477)))

(declare-fun b!1217499 () Bool)

(declare-fun e!691346 () Bool)

(declare-fun e!691343 () Bool)

(declare-fun mapRes!48199 () Bool)

(assert (=> b!1217499 (= e!691346 (and e!691343 mapRes!48199))))

(declare-fun condMapEmpty!48199 () Bool)

(declare-datatypes ((V!46305 0))(
  ( (V!46306 (val!15498 Int)) )
))
(declare-datatypes ((ValueCell!14732 0))(
  ( (ValueCellFull!14732 (v!18147 V!46305)) (EmptyCell!14732) )
))
(declare-datatypes ((array!78581 0))(
  ( (array!78582 (arr!37919 (Array (_ BitVec 32) ValueCell!14732)) (size!38456 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78581)

(declare-fun mapDefault!48199 () ValueCell!14732)

(assert (=> b!1217499 (= condMapEmpty!48199 (= (arr!37919 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14732)) mapDefault!48199)))))

(declare-fun b!1217500 () Bool)

(declare-fun e!691342 () Bool)

(declare-fun e!691344 () Bool)

(assert (=> b!1217500 (= e!691342 e!691344)))

(declare-fun res!808098 () Bool)

(assert (=> b!1217500 (=> (not res!808098) (not e!691344))))

(declare-datatypes ((array!78583 0))(
  ( (array!78584 (arr!37920 (Array (_ BitVec 32) (_ BitVec 64))) (size!38457 (_ BitVec 32))) )
))
(declare-fun lt!553307 () array!78583)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78583 (_ BitVec 32)) Bool)

(assert (=> b!1217500 (= res!808098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553307 mask!1564))))

(declare-fun _keys!1208 () array!78583)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217500 (= lt!553307 (array!78584 (store (arr!37920 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38457 _keys!1208)))))

(declare-fun b!1217501 () Bool)

(declare-fun res!808099 () Bool)

(assert (=> b!1217501 (=> (not res!808099) (not e!691342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217501 (= res!808099 (validMask!0 mask!1564))))

(declare-fun b!1217502 () Bool)

(declare-fun res!808093 () Bool)

(assert (=> b!1217502 (=> (not res!808093) (not e!691342))))

(assert (=> b!1217502 (= res!808093 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38457 _keys!1208))))))

(declare-fun b!1217503 () Bool)

(declare-fun res!808090 () Bool)

(assert (=> b!1217503 (=> (not res!808090) (not e!691342))))

(assert (=> b!1217503 (= res!808090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217504 () Bool)

(declare-fun res!808094 () Bool)

(assert (=> b!1217504 (=> (not res!808094) (not e!691342))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217504 (= res!808094 (validKeyInArray!0 k0!934))))

(declare-fun b!1217505 () Bool)

(declare-fun res!808095 () Bool)

(assert (=> b!1217505 (=> (not res!808095) (not e!691342))))

(assert (=> b!1217505 (= res!808095 (= (select (arr!37920 _keys!1208) i!673) k0!934))))

(declare-fun b!1217506 () Bool)

(declare-fun res!808091 () Bool)

(assert (=> b!1217506 (=> (not res!808091) (not e!691344))))

(declare-datatypes ((List!26742 0))(
  ( (Nil!26739) (Cons!26738 (h!27956 (_ BitVec 64)) (t!39893 List!26742)) )
))
(declare-fun arrayNoDuplicates!0 (array!78583 (_ BitVec 32) List!26742) Bool)

(assert (=> b!1217506 (= res!808091 (arrayNoDuplicates!0 lt!553307 #b00000000000000000000000000000000 Nil!26739))))

(declare-fun b!1217507 () Bool)

(declare-fun tp_is_empty!30883 () Bool)

(assert (=> b!1217507 (= e!691343 tp_is_empty!30883)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!691348 () Bool)

(declare-fun b!1217508 () Bool)

(assert (=> b!1217508 (= e!691348 (or (= from!1455 i!673) (bvsge from!1455 i!673) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38457 _keys!1208)) (bvslt (bvsub (size!38457 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38457 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46305)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19932 0))(
  ( (tuple2!19933 (_1!9977 (_ BitVec 64)) (_2!9977 V!46305)) )
))
(declare-datatypes ((List!26743 0))(
  ( (Nil!26740) (Cons!26739 (h!27957 tuple2!19932) (t!39894 List!26743)) )
))
(declare-datatypes ((ListLongMap!17909 0))(
  ( (ListLongMap!17910 (toList!8970 List!26743)) )
))
(declare-fun lt!553305 () ListLongMap!17909)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46305)

(declare-fun getCurrentListMapNoExtraKeys!5427 (array!78583 array!78581 (_ BitVec 32) (_ BitVec 32) V!46305 V!46305 (_ BitVec 32) Int) ListLongMap!17909)

(declare-fun dynLambda!3339 (Int (_ BitVec 64)) V!46305)

(assert (=> b!1217508 (= lt!553305 (getCurrentListMapNoExtraKeys!5427 lt!553307 (array!78582 (store (arr!37919 _values!996) i!673 (ValueCellFull!14732 (dynLambda!3339 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38456 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553306 () ListLongMap!17909)

(assert (=> b!1217508 (= lt!553306 (getCurrentListMapNoExtraKeys!5427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217509 () Bool)

(declare-fun res!808096 () Bool)

(assert (=> b!1217509 (=> (not res!808096) (not e!691342))))

(assert (=> b!1217509 (= res!808096 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26739))))

(declare-fun b!1217510 () Bool)

(assert (=> b!1217510 (= e!691344 (not e!691348))))

(declare-fun res!808092 () Bool)

(assert (=> b!1217510 (=> res!808092 e!691348)))

(assert (=> b!1217510 (= res!808092 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217510 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40300 0))(
  ( (Unit!40301) )
))
(declare-fun lt!553308 () Unit!40300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78583 (_ BitVec 64) (_ BitVec 32)) Unit!40300)

(assert (=> b!1217510 (= lt!553308 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217511 () Bool)

(declare-fun e!691345 () Bool)

(assert (=> b!1217511 (= e!691345 tp_is_empty!30883)))

(declare-fun res!808089 () Bool)

(assert (=> start!101492 (=> (not res!808089) (not e!691342))))

(assert (=> start!101492 (= res!808089 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38457 _keys!1208))))))

(assert (=> start!101492 e!691342))

(assert (=> start!101492 tp_is_empty!30883))

(declare-fun array_inv!28934 (array!78583) Bool)

(assert (=> start!101492 (array_inv!28934 _keys!1208)))

(assert (=> start!101492 true))

(assert (=> start!101492 tp!91558))

(declare-fun array_inv!28935 (array!78581) Bool)

(assert (=> start!101492 (and (array_inv!28935 _values!996) e!691346)))

(declare-fun mapNonEmpty!48199 () Bool)

(declare-fun tp!91559 () Bool)

(assert (=> mapNonEmpty!48199 (= mapRes!48199 (and tp!91559 e!691345))))

(declare-fun mapKey!48199 () (_ BitVec 32))

(declare-fun mapValue!48199 () ValueCell!14732)

(declare-fun mapRest!48199 () (Array (_ BitVec 32) ValueCell!14732))

(assert (=> mapNonEmpty!48199 (= (arr!37919 _values!996) (store mapRest!48199 mapKey!48199 mapValue!48199))))

(declare-fun mapIsEmpty!48199 () Bool)

(assert (=> mapIsEmpty!48199 mapRes!48199))

(declare-fun b!1217512 () Bool)

(declare-fun res!808097 () Bool)

(assert (=> b!1217512 (=> (not res!808097) (not e!691342))))

(assert (=> b!1217512 (= res!808097 (and (= (size!38456 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38457 _keys!1208) (size!38456 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101492 res!808089) b!1217501))

(assert (= (and b!1217501 res!808099) b!1217512))

(assert (= (and b!1217512 res!808097) b!1217503))

(assert (= (and b!1217503 res!808090) b!1217509))

(assert (= (and b!1217509 res!808096) b!1217502))

(assert (= (and b!1217502 res!808093) b!1217504))

(assert (= (and b!1217504 res!808094) b!1217505))

(assert (= (and b!1217505 res!808095) b!1217500))

(assert (= (and b!1217500 res!808098) b!1217506))

(assert (= (and b!1217506 res!808091) b!1217510))

(assert (= (and b!1217510 (not res!808092)) b!1217508))

(assert (= (and b!1217499 condMapEmpty!48199) mapIsEmpty!48199))

(assert (= (and b!1217499 (not condMapEmpty!48199)) mapNonEmpty!48199))

(get-info :version)

(assert (= (and mapNonEmpty!48199 ((_ is ValueCellFull!14732) mapValue!48199)) b!1217511))

(assert (= (and b!1217499 ((_ is ValueCellFull!14732) mapDefault!48199)) b!1217507))

(assert (= start!101492 b!1217499))

(declare-fun b_lambda!21849 () Bool)

(assert (=> (not b_lambda!21849) (not b!1217508)))

(declare-fun t!39892 () Bool)

(declare-fun tb!10971 () Bool)

(assert (=> (and start!101492 (= defaultEntry!1004 defaultEntry!1004) t!39892) tb!10971))

(declare-fun result!22547 () Bool)

(assert (=> tb!10971 (= result!22547 tp_is_empty!30883)))

(assert (=> b!1217508 t!39892))

(declare-fun b_and!43479 () Bool)

(assert (= b_and!43477 (and (=> t!39892 result!22547) b_and!43479)))

(declare-fun m!1122597 () Bool)

(assert (=> start!101492 m!1122597))

(declare-fun m!1122599 () Bool)

(assert (=> start!101492 m!1122599))

(declare-fun m!1122601 () Bool)

(assert (=> mapNonEmpty!48199 m!1122601))

(declare-fun m!1122603 () Bool)

(assert (=> b!1217508 m!1122603))

(declare-fun m!1122605 () Bool)

(assert (=> b!1217508 m!1122605))

(declare-fun m!1122607 () Bool)

(assert (=> b!1217508 m!1122607))

(declare-fun m!1122609 () Bool)

(assert (=> b!1217508 m!1122609))

(declare-fun m!1122611 () Bool)

(assert (=> b!1217510 m!1122611))

(declare-fun m!1122613 () Bool)

(assert (=> b!1217510 m!1122613))

(declare-fun m!1122615 () Bool)

(assert (=> b!1217503 m!1122615))

(declare-fun m!1122617 () Bool)

(assert (=> b!1217509 m!1122617))

(declare-fun m!1122619 () Bool)

(assert (=> b!1217501 m!1122619))

(declare-fun m!1122621 () Bool)

(assert (=> b!1217500 m!1122621))

(declare-fun m!1122623 () Bool)

(assert (=> b!1217500 m!1122623))

(declare-fun m!1122625 () Bool)

(assert (=> b!1217505 m!1122625))

(declare-fun m!1122627 () Bool)

(assert (=> b!1217504 m!1122627))

(declare-fun m!1122629 () Bool)

(assert (=> b!1217506 m!1122629))

(check-sat (not b!1217504) (not b!1217510) (not b_next!26179) (not b!1217506) (not b!1217508) b_and!43479 tp_is_empty!30883 (not b!1217500) (not b!1217503) (not mapNonEmpty!48199) (not start!101492) (not b!1217501) (not b_lambda!21849) (not b!1217509))
(check-sat b_and!43479 (not b_next!26179))
