; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101268 () Bool)

(assert start!101268)

(declare-fun b_free!26197 () Bool)

(declare-fun b_next!26197 () Bool)

(assert (=> start!101268 (= b_free!26197 (not b_next!26197))))

(declare-fun tp!91613 () Bool)

(declare-fun b_and!43493 () Bool)

(assert (=> start!101268 (= tp!91613 b_and!43493)))

(declare-fun b!1216521 () Bool)

(declare-fun e!690655 () Bool)

(declare-fun e!690656 () Bool)

(assert (=> b!1216521 (= e!690655 e!690656)))

(declare-fun res!807849 () Bool)

(assert (=> b!1216521 (=> res!807849 e!690656)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216521 (= res!807849 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46329 0))(
  ( (V!46330 (val!15507 Int)) )
))
(declare-fun zeroValue!944 () V!46329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14741 0))(
  ( (ValueCellFull!14741 (v!18159 V!46329)) (EmptyCell!14741) )
))
(declare-datatypes ((array!78496 0))(
  ( (array!78497 (arr!37883 (Array (_ BitVec 32) ValueCell!14741)) (size!38421 (_ BitVec 32))) )
))
(declare-fun lt!552797 () array!78496)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!78498 0))(
  ( (array!78499 (arr!37884 (Array (_ BitVec 32) (_ BitVec 64))) (size!38422 (_ BitVec 32))) )
))
(declare-fun lt!552795 () array!78498)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20026 0))(
  ( (tuple2!20027 (_1!10024 (_ BitVec 64)) (_2!10024 V!46329)) )
))
(declare-datatypes ((List!26804 0))(
  ( (Nil!26801) (Cons!26800 (h!28009 tuple2!20026) (t!39972 List!26804)) )
))
(declare-datatypes ((ListLongMap!17995 0))(
  ( (ListLongMap!17996 (toList!9013 List!26804)) )
))
(declare-fun lt!552792 () ListLongMap!17995)

(declare-fun minValue!944 () V!46329)

(declare-fun getCurrentListMapNoExtraKeys!5452 (array!78498 array!78496 (_ BitVec 32) (_ BitVec 32) V!46329 V!46329 (_ BitVec 32) Int) ListLongMap!17995)

(assert (=> b!1216521 (= lt!552792 (getCurrentListMapNoExtraKeys!5452 lt!552795 lt!552797 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78496)

(declare-fun dynLambda!3303 (Int (_ BitVec 64)) V!46329)

(assert (=> b!1216521 (= lt!552797 (array!78497 (store (arr!37883 _values!996) i!673 (ValueCellFull!14741 (dynLambda!3303 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38421 _values!996)))))

(declare-fun _keys!1208 () array!78498)

(declare-fun lt!552794 () ListLongMap!17995)

(assert (=> b!1216521 (= lt!552794 (getCurrentListMapNoExtraKeys!5452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216522 () Bool)

(declare-fun res!807850 () Bool)

(declare-fun e!690654 () Bool)

(assert (=> b!1216522 (=> (not res!807850) (not e!690654))))

(assert (=> b!1216522 (= res!807850 (and (= (size!38421 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38422 _keys!1208) (size!38421 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216523 () Bool)

(declare-fun e!690661 () Bool)

(assert (=> b!1216523 (= e!690654 e!690661)))

(declare-fun res!807847 () Bool)

(assert (=> b!1216523 (=> (not res!807847) (not e!690661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78498 (_ BitVec 32)) Bool)

(assert (=> b!1216523 (= res!807847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552795 mask!1564))))

(assert (=> b!1216523 (= lt!552795 (array!78499 (store (arr!37884 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38422 _keys!1208)))))

(declare-fun b!1216524 () Bool)

(declare-fun res!807842 () Bool)

(assert (=> b!1216524 (=> (not res!807842) (not e!690654))))

(declare-datatypes ((List!26805 0))(
  ( (Nil!26802) (Cons!26801 (h!28010 (_ BitVec 64)) (t!39973 List!26805)) )
))
(declare-fun arrayNoDuplicates!0 (array!78498 (_ BitVec 32) List!26805) Bool)

(assert (=> b!1216524 (= res!807842 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26802))))

(declare-fun b!1216525 () Bool)

(declare-fun res!807843 () Bool)

(assert (=> b!1216525 (=> (not res!807843) (not e!690654))))

(assert (=> b!1216525 (= res!807843 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38422 _keys!1208))))))

(declare-fun b!1216526 () Bool)

(declare-fun res!807844 () Bool)

(assert (=> b!1216526 (=> (not res!807844) (not e!690654))))

(assert (=> b!1216526 (= res!807844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48226 () Bool)

(declare-fun mapRes!48226 () Bool)

(declare-fun tp!91612 () Bool)

(declare-fun e!690658 () Bool)

(assert (=> mapNonEmpty!48226 (= mapRes!48226 (and tp!91612 e!690658))))

(declare-fun mapValue!48226 () ValueCell!14741)

(declare-fun mapRest!48226 () (Array (_ BitVec 32) ValueCell!14741))

(declare-fun mapKey!48226 () (_ BitVec 32))

(assert (=> mapNonEmpty!48226 (= (arr!37883 _values!996) (store mapRest!48226 mapKey!48226 mapValue!48226))))

(declare-fun b!1216527 () Bool)

(declare-fun res!807846 () Bool)

(assert (=> b!1216527 (=> (not res!807846) (not e!690654))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1216527 (= res!807846 (= (select (arr!37884 _keys!1208) i!673) k0!934))))

(declare-fun b!1216528 () Bool)

(declare-fun e!690660 () Bool)

(assert (=> b!1216528 (= e!690660 (bvslt i!673 (size!38421 _values!996)))))

(declare-fun b!1216529 () Bool)

(declare-fun tp_is_empty!30901 () Bool)

(assert (=> b!1216529 (= e!690658 tp_is_empty!30901)))

(declare-fun b!1216530 () Bool)

(declare-fun res!807841 () Bool)

(assert (=> b!1216530 (=> (not res!807841) (not e!690654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216530 (= res!807841 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48226 () Bool)

(assert (=> mapIsEmpty!48226 mapRes!48226))

(declare-fun res!807853 () Bool)

(assert (=> start!101268 (=> (not res!807853) (not e!690654))))

(assert (=> start!101268 (= res!807853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38422 _keys!1208))))))

(assert (=> start!101268 e!690654))

(assert (=> start!101268 tp_is_empty!30901))

(declare-fun array_inv!28958 (array!78498) Bool)

(assert (=> start!101268 (array_inv!28958 _keys!1208)))

(assert (=> start!101268 true))

(assert (=> start!101268 tp!91613))

(declare-fun e!690659 () Bool)

(declare-fun array_inv!28959 (array!78496) Bool)

(assert (=> start!101268 (and (array_inv!28959 _values!996) e!690659)))

(declare-fun b!1216531 () Bool)

(declare-fun res!807852 () Bool)

(assert (=> b!1216531 (=> (not res!807852) (not e!690661))))

(assert (=> b!1216531 (= res!807852 (arrayNoDuplicates!0 lt!552795 #b00000000000000000000000000000000 Nil!26802))))

(declare-fun b!1216532 () Bool)

(declare-fun e!690657 () Bool)

(assert (=> b!1216532 (= e!690659 (and e!690657 mapRes!48226))))

(declare-fun condMapEmpty!48226 () Bool)

(declare-fun mapDefault!48226 () ValueCell!14741)

(assert (=> b!1216532 (= condMapEmpty!48226 (= (arr!37883 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14741)) mapDefault!48226)))))

(declare-fun b!1216533 () Bool)

(assert (=> b!1216533 (= e!690661 (not e!690655))))

(declare-fun res!807845 () Bool)

(assert (=> b!1216533 (=> res!807845 e!690655)))

(assert (=> b!1216533 (= res!807845 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216533 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40195 0))(
  ( (Unit!40196) )
))
(declare-fun lt!552796 () Unit!40195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78498 (_ BitVec 64) (_ BitVec 32)) Unit!40195)

(assert (=> b!1216533 (= lt!552796 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216534 () Bool)

(declare-fun res!807851 () Bool)

(assert (=> b!1216534 (=> (not res!807851) (not e!690654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216534 (= res!807851 (validKeyInArray!0 k0!934))))

(declare-fun b!1216535 () Bool)

(assert (=> b!1216535 (= e!690657 tp_is_empty!30901)))

(declare-fun b!1216536 () Bool)

(assert (=> b!1216536 (= e!690656 e!690660)))

(declare-fun res!807848 () Bool)

(assert (=> b!1216536 (=> res!807848 e!690660)))

(assert (=> b!1216536 (= res!807848 (not (validKeyInArray!0 (select (arr!37884 _keys!1208) from!1455))))))

(declare-fun -!1851 (ListLongMap!17995 (_ BitVec 64)) ListLongMap!17995)

(assert (=> b!1216536 (= (getCurrentListMapNoExtraKeys!5452 lt!552795 lt!552797 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1851 (getCurrentListMapNoExtraKeys!5452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!552793 () Unit!40195)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1086 (array!78498 array!78496 (_ BitVec 32) (_ BitVec 32) V!46329 V!46329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40195)

(assert (=> b!1216536 (= lt!552793 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1086 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101268 res!807853) b!1216530))

(assert (= (and b!1216530 res!807841) b!1216522))

(assert (= (and b!1216522 res!807850) b!1216526))

(assert (= (and b!1216526 res!807844) b!1216524))

(assert (= (and b!1216524 res!807842) b!1216525))

(assert (= (and b!1216525 res!807843) b!1216534))

(assert (= (and b!1216534 res!807851) b!1216527))

(assert (= (and b!1216527 res!807846) b!1216523))

(assert (= (and b!1216523 res!807847) b!1216531))

(assert (= (and b!1216531 res!807852) b!1216533))

(assert (= (and b!1216533 (not res!807845)) b!1216521))

(assert (= (and b!1216521 (not res!807849)) b!1216536))

(assert (= (and b!1216536 (not res!807848)) b!1216528))

(assert (= (and b!1216532 condMapEmpty!48226) mapIsEmpty!48226))

(assert (= (and b!1216532 (not condMapEmpty!48226)) mapNonEmpty!48226))

(get-info :version)

(assert (= (and mapNonEmpty!48226 ((_ is ValueCellFull!14741) mapValue!48226)) b!1216529))

(assert (= (and b!1216532 ((_ is ValueCellFull!14741) mapDefault!48226)) b!1216535))

(assert (= start!101268 b!1216532))

(declare-fun b_lambda!21863 () Bool)

(assert (=> (not b_lambda!21863) (not b!1216521)))

(declare-fun t!39971 () Bool)

(declare-fun tb!10989 () Bool)

(assert (=> (and start!101268 (= defaultEntry!1004 defaultEntry!1004) t!39971) tb!10989))

(declare-fun result!22583 () Bool)

(assert (=> tb!10989 (= result!22583 tp_is_empty!30901)))

(assert (=> b!1216521 t!39971))

(declare-fun b_and!43495 () Bool)

(assert (= b_and!43493 (and (=> t!39971 result!22583) b_and!43495)))

(declare-fun m!1120797 () Bool)

(assert (=> b!1216534 m!1120797))

(declare-fun m!1120799 () Bool)

(assert (=> b!1216527 m!1120799))

(declare-fun m!1120801 () Bool)

(assert (=> b!1216530 m!1120801))

(declare-fun m!1120803 () Bool)

(assert (=> start!101268 m!1120803))

(declare-fun m!1120805 () Bool)

(assert (=> start!101268 m!1120805))

(declare-fun m!1120807 () Bool)

(assert (=> b!1216533 m!1120807))

(declare-fun m!1120809 () Bool)

(assert (=> b!1216533 m!1120809))

(declare-fun m!1120811 () Bool)

(assert (=> b!1216521 m!1120811))

(declare-fun m!1120813 () Bool)

(assert (=> b!1216521 m!1120813))

(declare-fun m!1120815 () Bool)

(assert (=> b!1216521 m!1120815))

(declare-fun m!1120817 () Bool)

(assert (=> b!1216521 m!1120817))

(declare-fun m!1120819 () Bool)

(assert (=> b!1216523 m!1120819))

(declare-fun m!1120821 () Bool)

(assert (=> b!1216523 m!1120821))

(declare-fun m!1120823 () Bool)

(assert (=> b!1216526 m!1120823))

(declare-fun m!1120825 () Bool)

(assert (=> b!1216531 m!1120825))

(declare-fun m!1120827 () Bool)

(assert (=> mapNonEmpty!48226 m!1120827))

(declare-fun m!1120829 () Bool)

(assert (=> b!1216536 m!1120829))

(declare-fun m!1120831 () Bool)

(assert (=> b!1216536 m!1120831))

(declare-fun m!1120833 () Bool)

(assert (=> b!1216536 m!1120833))

(assert (=> b!1216536 m!1120829))

(declare-fun m!1120835 () Bool)

(assert (=> b!1216536 m!1120835))

(declare-fun m!1120837 () Bool)

(assert (=> b!1216536 m!1120837))

(declare-fun m!1120839 () Bool)

(assert (=> b!1216536 m!1120839))

(assert (=> b!1216536 m!1120837))

(declare-fun m!1120841 () Bool)

(assert (=> b!1216524 m!1120841))

(check-sat (not b!1216531) (not start!101268) (not b!1216533) (not mapNonEmpty!48226) tp_is_empty!30901 b_and!43495 (not b!1216530) (not b!1216534) (not b!1216523) (not b_next!26197) (not b!1216526) (not b!1216536) (not b_lambda!21863) (not b!1216524) (not b!1216521))
(check-sat b_and!43495 (not b_next!26197))
