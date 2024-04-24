; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99522 () Bool)

(assert start!99522)

(declare-fun b_free!24865 () Bool)

(declare-fun b_next!24865 () Bool)

(assert (=> start!99522 (= b_free!24865 (not b_next!24865))))

(declare-fun tp!87308 () Bool)

(declare-fun b_and!40599 () Bool)

(assert (=> start!99522 (= tp!87308 b_and!40599)))

(declare-fun b!1170963 () Bool)

(declare-fun e!665615 () Bool)

(declare-fun e!665617 () Bool)

(assert (=> b!1170963 (= e!665615 e!665617)))

(declare-fun res!776668 () Bool)

(assert (=> b!1170963 (=> res!776668 e!665617)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170963 (= res!776668 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44321 0))(
  ( (V!44322 (val!14754 Int)) )
))
(declare-fun zeroValue!944 () V!44321)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44321)

(declare-datatypes ((tuple2!18866 0))(
  ( (tuple2!18867 (_1!9444 (_ BitVec 64)) (_2!9444 V!44321)) )
))
(declare-datatypes ((List!25602 0))(
  ( (Nil!25599) (Cons!25598 (h!26816 tuple2!18866) (t!37451 List!25602)) )
))
(declare-datatypes ((ListLongMap!16843 0))(
  ( (ListLongMap!16844 (toList!8437 List!25602)) )
))
(declare-fun lt!527202 () ListLongMap!16843)

(declare-datatypes ((ValueCell!13988 0))(
  ( (ValueCellFull!13988 (v!17388 V!44321)) (EmptyCell!13988) )
))
(declare-datatypes ((array!75659 0))(
  ( (array!75660 (arr!36473 (Array (_ BitVec 32) ValueCell!13988)) (size!37010 (_ BitVec 32))) )
))
(declare-fun lt!527198 () array!75659)

(declare-datatypes ((array!75661 0))(
  ( (array!75662 (arr!36474 (Array (_ BitVec 32) (_ BitVec 64))) (size!37011 (_ BitVec 32))) )
))
(declare-fun lt!527199 () array!75661)

(declare-fun getCurrentListMapNoExtraKeys!4926 (array!75661 array!75659 (_ BitVec 32) (_ BitVec 32) V!44321 V!44321 (_ BitVec 32) Int) ListLongMap!16843)

(assert (=> b!1170963 (= lt!527202 (getCurrentListMapNoExtraKeys!4926 lt!527199 lt!527198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527200 () V!44321)

(declare-fun _values!996 () array!75659)

(assert (=> b!1170963 (= lt!527198 (array!75660 (store (arr!36473 _values!996) i!673 (ValueCellFull!13988 lt!527200)) (size!37010 _values!996)))))

(declare-fun dynLambda!2909 (Int (_ BitVec 64)) V!44321)

(assert (=> b!1170963 (= lt!527200 (dynLambda!2909 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527203 () ListLongMap!16843)

(declare-fun _keys!1208 () array!75661)

(assert (=> b!1170963 (= lt!527203 (getCurrentListMapNoExtraKeys!4926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170964 () Bool)

(declare-fun res!776667 () Bool)

(declare-fun e!665624 () Bool)

(assert (=> b!1170964 (=> (not res!776667) (not e!665624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170964 (= res!776667 (validMask!0 mask!1564))))

(declare-fun b!1170965 () Bool)

(declare-fun res!776675 () Bool)

(assert (=> b!1170965 (=> (not res!776675) (not e!665624))))

(assert (=> b!1170965 (= res!776675 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37011 _keys!1208))))))

(declare-fun b!1170966 () Bool)

(declare-fun res!776662 () Bool)

(declare-fun e!665623 () Bool)

(assert (=> b!1170966 (=> (not res!776662) (not e!665623))))

(declare-datatypes ((List!25603 0))(
  ( (Nil!25600) (Cons!25599 (h!26817 (_ BitVec 64)) (t!37452 List!25603)) )
))
(declare-fun arrayNoDuplicates!0 (array!75661 (_ BitVec 32) List!25603) Bool)

(assert (=> b!1170966 (= res!776662 (arrayNoDuplicates!0 lt!527199 #b00000000000000000000000000000000 Nil!25600))))

(declare-fun res!776669 () Bool)

(assert (=> start!99522 (=> (not res!776669) (not e!665624))))

(assert (=> start!99522 (= res!776669 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37011 _keys!1208))))))

(assert (=> start!99522 e!665624))

(declare-fun tp_is_empty!29395 () Bool)

(assert (=> start!99522 tp_is_empty!29395))

(declare-fun array_inv!27946 (array!75661) Bool)

(assert (=> start!99522 (array_inv!27946 _keys!1208)))

(assert (=> start!99522 true))

(assert (=> start!99522 tp!87308))

(declare-fun e!665614 () Bool)

(declare-fun array_inv!27947 (array!75659) Bool)

(assert (=> start!99522 (and (array_inv!27947 _values!996) e!665614)))

(declare-fun mapIsEmpty!45920 () Bool)

(declare-fun mapRes!45920 () Bool)

(assert (=> mapIsEmpty!45920 mapRes!45920))

(declare-fun b!1170967 () Bool)

(declare-fun res!776663 () Bool)

(assert (=> b!1170967 (=> (not res!776663) (not e!665624))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1170967 (= res!776663 (= (select (arr!36474 _keys!1208) i!673) k0!934))))

(declare-fun b!1170968 () Bool)

(assert (=> b!1170968 (= e!665623 (not e!665615))))

(declare-fun res!776666 () Bool)

(assert (=> b!1170968 (=> res!776666 e!665615)))

(assert (=> b!1170968 (= res!776666 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170968 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38565 0))(
  ( (Unit!38566) )
))
(declare-fun lt!527206 () Unit!38565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75661 (_ BitVec 64) (_ BitVec 32)) Unit!38565)

(assert (=> b!1170968 (= lt!527206 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170969 () Bool)

(declare-fun e!665622 () Bool)

(assert (=> b!1170969 (= e!665614 (and e!665622 mapRes!45920))))

(declare-fun condMapEmpty!45920 () Bool)

(declare-fun mapDefault!45920 () ValueCell!13988)

(assert (=> b!1170969 (= condMapEmpty!45920 (= (arr!36473 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13988)) mapDefault!45920)))))

(declare-fun e!665616 () Bool)

(declare-fun b!1170970 () Bool)

(assert (=> b!1170970 (= e!665616 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170971 () Bool)

(assert (=> b!1170971 (= e!665622 tp_is_empty!29395)))

(declare-fun b!1170972 () Bool)

(declare-fun e!665618 () Bool)

(assert (=> b!1170972 (= e!665618 true)))

(declare-fun e!665621 () Bool)

(assert (=> b!1170972 e!665621))

(declare-fun res!776672 () Bool)

(assert (=> b!1170972 (=> (not res!776672) (not e!665621))))

(declare-fun lt!527197 () ListLongMap!16843)

(declare-fun +!3778 (ListLongMap!16843 tuple2!18866) ListLongMap!16843)

(declare-fun get!18618 (ValueCell!13988 V!44321) V!44321)

(assert (=> b!1170972 (= res!776672 (= lt!527202 (+!3778 lt!527197 (tuple2!18867 (select (arr!36474 _keys!1208) from!1455) (get!18618 (select (arr!36473 _values!996) from!1455) lt!527200)))))))

(declare-fun mapNonEmpty!45920 () Bool)

(declare-fun tp!87309 () Bool)

(declare-fun e!665619 () Bool)

(assert (=> mapNonEmpty!45920 (= mapRes!45920 (and tp!87309 e!665619))))

(declare-fun mapKey!45920 () (_ BitVec 32))

(declare-fun mapRest!45920 () (Array (_ BitVec 32) ValueCell!13988))

(declare-fun mapValue!45920 () ValueCell!13988)

(assert (=> mapNonEmpty!45920 (= (arr!36473 _values!996) (store mapRest!45920 mapKey!45920 mapValue!45920))))

(declare-fun b!1170973 () Bool)

(declare-fun res!776665 () Bool)

(assert (=> b!1170973 (=> (not res!776665) (not e!665624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170973 (= res!776665 (validKeyInArray!0 k0!934))))

(declare-fun b!1170974 () Bool)

(declare-fun res!776673 () Bool)

(assert (=> b!1170974 (=> (not res!776673) (not e!665624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75661 (_ BitVec 32)) Bool)

(assert (=> b!1170974 (= res!776673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170975 () Bool)

(assert (=> b!1170975 (= e!665617 e!665618)))

(declare-fun res!776670 () Bool)

(assert (=> b!1170975 (=> res!776670 e!665618)))

(assert (=> b!1170975 (= res!776670 (not (validKeyInArray!0 (select (arr!36474 _keys!1208) from!1455))))))

(declare-fun lt!527201 () ListLongMap!16843)

(assert (=> b!1170975 (= lt!527201 lt!527197)))

(declare-fun lt!527205 () ListLongMap!16843)

(declare-fun -!1495 (ListLongMap!16843 (_ BitVec 64)) ListLongMap!16843)

(assert (=> b!1170975 (= lt!527197 (-!1495 lt!527205 k0!934))))

(assert (=> b!1170975 (= lt!527201 (getCurrentListMapNoExtraKeys!4926 lt!527199 lt!527198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170975 (= lt!527205 (getCurrentListMapNoExtraKeys!4926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527204 () Unit!38565)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!720 (array!75661 array!75659 (_ BitVec 32) (_ BitVec 32) V!44321 V!44321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38565)

(assert (=> b!1170975 (= lt!527204 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!720 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170976 () Bool)

(assert (=> b!1170976 (= e!665621 e!665616)))

(declare-fun res!776661 () Bool)

(assert (=> b!1170976 (=> res!776661 e!665616)))

(assert (=> b!1170976 (= res!776661 (not (= (select (arr!36474 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170977 () Bool)

(declare-fun res!776674 () Bool)

(assert (=> b!1170977 (=> (not res!776674) (not e!665624))))

(assert (=> b!1170977 (= res!776674 (and (= (size!37010 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37011 _keys!1208) (size!37010 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170978 () Bool)

(declare-fun res!776664 () Bool)

(assert (=> b!1170978 (=> (not res!776664) (not e!665624))))

(assert (=> b!1170978 (= res!776664 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25600))))

(declare-fun b!1170979 () Bool)

(assert (=> b!1170979 (= e!665624 e!665623)))

(declare-fun res!776671 () Bool)

(assert (=> b!1170979 (=> (not res!776671) (not e!665623))))

(assert (=> b!1170979 (= res!776671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527199 mask!1564))))

(assert (=> b!1170979 (= lt!527199 (array!75662 (store (arr!36474 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37011 _keys!1208)))))

(declare-fun b!1170980 () Bool)

(assert (=> b!1170980 (= e!665619 tp_is_empty!29395)))

(assert (= (and start!99522 res!776669) b!1170964))

(assert (= (and b!1170964 res!776667) b!1170977))

(assert (= (and b!1170977 res!776674) b!1170974))

(assert (= (and b!1170974 res!776673) b!1170978))

(assert (= (and b!1170978 res!776664) b!1170965))

(assert (= (and b!1170965 res!776675) b!1170973))

(assert (= (and b!1170973 res!776665) b!1170967))

(assert (= (and b!1170967 res!776663) b!1170979))

(assert (= (and b!1170979 res!776671) b!1170966))

(assert (= (and b!1170966 res!776662) b!1170968))

(assert (= (and b!1170968 (not res!776666)) b!1170963))

(assert (= (and b!1170963 (not res!776668)) b!1170975))

(assert (= (and b!1170975 (not res!776670)) b!1170972))

(assert (= (and b!1170972 res!776672) b!1170976))

(assert (= (and b!1170976 (not res!776661)) b!1170970))

(assert (= (and b!1170969 condMapEmpty!45920) mapIsEmpty!45920))

(assert (= (and b!1170969 (not condMapEmpty!45920)) mapNonEmpty!45920))

(get-info :version)

(assert (= (and mapNonEmpty!45920 ((_ is ValueCellFull!13988) mapValue!45920)) b!1170980))

(assert (= (and b!1170969 ((_ is ValueCellFull!13988) mapDefault!45920)) b!1170971))

(assert (= start!99522 b!1170969))

(declare-fun b_lambda!20003 () Bool)

(assert (=> (not b_lambda!20003) (not b!1170963)))

(declare-fun t!37450 () Bool)

(declare-fun tb!9669 () Bool)

(assert (=> (and start!99522 (= defaultEntry!1004 defaultEntry!1004) t!37450) tb!9669))

(declare-fun result!19913 () Bool)

(assert (=> tb!9669 (= result!19913 tp_is_empty!29395)))

(assert (=> b!1170963 t!37450))

(declare-fun b_and!40601 () Bool)

(assert (= b_and!40599 (and (=> t!37450 result!19913) b_and!40601)))

(declare-fun m!1079097 () Bool)

(assert (=> b!1170966 m!1079097))

(declare-fun m!1079099 () Bool)

(assert (=> b!1170967 m!1079099))

(declare-fun m!1079101 () Bool)

(assert (=> b!1170963 m!1079101))

(declare-fun m!1079103 () Bool)

(assert (=> b!1170963 m!1079103))

(declare-fun m!1079105 () Bool)

(assert (=> b!1170963 m!1079105))

(declare-fun m!1079107 () Bool)

(assert (=> b!1170963 m!1079107))

(declare-fun m!1079109 () Bool)

(assert (=> b!1170978 m!1079109))

(declare-fun m!1079111 () Bool)

(assert (=> b!1170976 m!1079111))

(declare-fun m!1079113 () Bool)

(assert (=> b!1170973 m!1079113))

(declare-fun m!1079115 () Bool)

(assert (=> b!1170964 m!1079115))

(declare-fun m!1079117 () Bool)

(assert (=> b!1170979 m!1079117))

(declare-fun m!1079119 () Bool)

(assert (=> b!1170979 m!1079119))

(declare-fun m!1079121 () Bool)

(assert (=> mapNonEmpty!45920 m!1079121))

(declare-fun m!1079123 () Bool)

(assert (=> b!1170975 m!1079123))

(declare-fun m!1079125 () Bool)

(assert (=> b!1170975 m!1079125))

(declare-fun m!1079127 () Bool)

(assert (=> b!1170975 m!1079127))

(declare-fun m!1079129 () Bool)

(assert (=> b!1170975 m!1079129))

(assert (=> b!1170975 m!1079111))

(declare-fun m!1079131 () Bool)

(assert (=> b!1170975 m!1079131))

(assert (=> b!1170975 m!1079111))

(declare-fun m!1079133 () Bool)

(assert (=> b!1170970 m!1079133))

(declare-fun m!1079135 () Bool)

(assert (=> start!99522 m!1079135))

(declare-fun m!1079137 () Bool)

(assert (=> start!99522 m!1079137))

(declare-fun m!1079139 () Bool)

(assert (=> b!1170974 m!1079139))

(declare-fun m!1079141 () Bool)

(assert (=> b!1170968 m!1079141))

(declare-fun m!1079143 () Bool)

(assert (=> b!1170968 m!1079143))

(assert (=> b!1170972 m!1079111))

(declare-fun m!1079145 () Bool)

(assert (=> b!1170972 m!1079145))

(assert (=> b!1170972 m!1079145))

(declare-fun m!1079147 () Bool)

(assert (=> b!1170972 m!1079147))

(declare-fun m!1079149 () Bool)

(assert (=> b!1170972 m!1079149))

(check-sat (not b_lambda!20003) b_and!40601 (not b_next!24865) (not b!1170974) (not b!1170964) (not b!1170968) (not mapNonEmpty!45920) (not b!1170978) (not b!1170973) (not start!99522) (not b!1170963) (not b!1170979) (not b!1170972) (not b!1170975) (not b!1170970) (not b!1170966) tp_is_empty!29395)
(check-sat b_and!40601 (not b_next!24865))
