; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97808 () Bool)

(assert start!97808)

(declare-fun b_free!23515 () Bool)

(declare-fun b_next!23515 () Bool)

(assert (=> start!97808 (= b_free!23515 (not b_next!23515))))

(declare-fun tp!83248 () Bool)

(declare-fun b_and!37791 () Bool)

(assert (=> start!97808 (= tp!83248 b_and!37791)))

(declare-fun b!1119125 () Bool)

(declare-fun e!637364 () Bool)

(declare-fun e!637365 () Bool)

(declare-fun mapRes!43885 () Bool)

(assert (=> b!1119125 (= e!637364 (and e!637365 mapRes!43885))))

(declare-fun condMapEmpty!43885 () Bool)

(declare-datatypes ((V!42521 0))(
  ( (V!42522 (val!14079 Int)) )
))
(declare-datatypes ((ValueCell!13313 0))(
  ( (ValueCellFull!13313 (v!16711 V!42521)) (EmptyCell!13313) )
))
(declare-datatypes ((array!72884 0))(
  ( (array!72885 (arr!35095 (Array (_ BitVec 32) ValueCell!13313)) (size!35633 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72884)

(declare-fun mapDefault!43885 () ValueCell!13313)

(assert (=> b!1119125 (= condMapEmpty!43885 (= (arr!35095 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13313)) mapDefault!43885)))))

(declare-fun b!1119126 () Bool)

(declare-fun res!747545 () Bool)

(declare-fun e!637362 () Bool)

(assert (=> b!1119126 (=> (not res!747545) (not e!637362))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119126 (= res!747545 (validMask!0 mask!1564))))

(declare-fun b!1119127 () Bool)

(declare-fun res!747551 () Bool)

(declare-fun e!637367 () Bool)

(assert (=> b!1119127 (=> (not res!747551) (not e!637367))))

(declare-datatypes ((array!72886 0))(
  ( (array!72887 (arr!35096 (Array (_ BitVec 32) (_ BitVec 64))) (size!35634 (_ BitVec 32))) )
))
(declare-fun lt!497503 () array!72886)

(declare-datatypes ((List!24492 0))(
  ( (Nil!24489) (Cons!24488 (h!25697 (_ BitVec 64)) (t!34990 List!24492)) )
))
(declare-fun arrayNoDuplicates!0 (array!72886 (_ BitVec 32) List!24492) Bool)

(assert (=> b!1119127 (= res!747551 (arrayNoDuplicates!0 lt!497503 #b00000000000000000000000000000000 Nil!24489))))

(declare-fun b!1119128 () Bool)

(declare-fun res!747553 () Bool)

(assert (=> b!1119128 (=> (not res!747553) (not e!637362))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72886)

(assert (=> b!1119128 (= res!747553 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35634 _keys!1208))))))

(declare-fun b!1119129 () Bool)

(declare-fun res!747543 () Bool)

(assert (=> b!1119129 (=> (not res!747543) (not e!637362))))

(assert (=> b!1119129 (= res!747543 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24489))))

(declare-fun b!1119130 () Bool)

(declare-fun res!747547 () Bool)

(assert (=> b!1119130 (=> (not res!747547) (not e!637362))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119130 (= res!747547 (= (select (arr!35096 _keys!1208) i!673) k0!934))))

(declare-fun b!1119131 () Bool)

(assert (=> b!1119131 (= e!637362 e!637367)))

(declare-fun res!747546 () Bool)

(assert (=> b!1119131 (=> (not res!747546) (not e!637367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72886 (_ BitVec 32)) Bool)

(assert (=> b!1119131 (= res!747546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497503 mask!1564))))

(assert (=> b!1119131 (= lt!497503 (array!72887 (store (arr!35096 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35634 _keys!1208)))))

(declare-fun b!1119132 () Bool)

(declare-fun res!747552 () Bool)

(assert (=> b!1119132 (=> (not res!747552) (not e!637362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119132 (= res!747552 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43885 () Bool)

(declare-fun tp!83249 () Bool)

(declare-fun e!637368 () Bool)

(assert (=> mapNonEmpty!43885 (= mapRes!43885 (and tp!83249 e!637368))))

(declare-fun mapKey!43885 () (_ BitVec 32))

(declare-fun mapRest!43885 () (Array (_ BitVec 32) ValueCell!13313))

(declare-fun mapValue!43885 () ValueCell!13313)

(assert (=> mapNonEmpty!43885 (= (arr!35095 _values!996) (store mapRest!43885 mapKey!43885 mapValue!43885))))

(declare-fun b!1119133 () Bool)

(declare-fun e!637363 () Bool)

(assert (=> b!1119133 (= e!637367 (not e!637363))))

(declare-fun res!747550 () Bool)

(assert (=> b!1119133 (=> res!747550 e!637363)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119133 (= res!747550 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119133 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36557 0))(
  ( (Unit!36558) )
))
(declare-fun lt!497502 () Unit!36557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72886 (_ BitVec 64) (_ BitVec 32)) Unit!36557)

(assert (=> b!1119133 (= lt!497502 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43885 () Bool)

(assert (=> mapIsEmpty!43885 mapRes!43885))

(declare-fun b!1119134 () Bool)

(declare-fun tp_is_empty!28045 () Bool)

(assert (=> b!1119134 (= e!637368 tp_is_empty!28045)))

(declare-fun b!1119135 () Bool)

(assert (=> b!1119135 (= e!637365 tp_is_empty!28045)))

(declare-fun b!1119137 () Bool)

(declare-fun res!747544 () Bool)

(assert (=> b!1119137 (=> (not res!747544) (not e!637362))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119137 (= res!747544 (and (= (size!35633 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35634 _keys!1208) (size!35633 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119138 () Bool)

(assert (=> b!1119138 (= e!637363 true)))

(declare-fun zeroValue!944 () V!42521)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17724 0))(
  ( (tuple2!17725 (_1!8873 (_ BitVec 64)) (_2!8873 V!42521)) )
))
(declare-datatypes ((List!24493 0))(
  ( (Nil!24490) (Cons!24489 (h!25698 tuple2!17724) (t!34991 List!24493)) )
))
(declare-datatypes ((ListLongMap!15693 0))(
  ( (ListLongMap!15694 (toList!7862 List!24493)) )
))
(declare-fun lt!497504 () ListLongMap!15693)

(declare-fun minValue!944 () V!42521)

(declare-fun getCurrentListMapNoExtraKeys!4371 (array!72886 array!72884 (_ BitVec 32) (_ BitVec 32) V!42521 V!42521 (_ BitVec 32) Int) ListLongMap!15693)

(declare-fun dynLambda!2414 (Int (_ BitVec 64)) V!42521)

(assert (=> b!1119138 (= lt!497504 (getCurrentListMapNoExtraKeys!4371 lt!497503 (array!72885 (store (arr!35095 _values!996) i!673 (ValueCellFull!13313 (dynLambda!2414 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35633 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497505 () ListLongMap!15693)

(assert (=> b!1119138 (= lt!497505 (getCurrentListMapNoExtraKeys!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119136 () Bool)

(declare-fun res!747548 () Bool)

(assert (=> b!1119136 (=> (not res!747548) (not e!637362))))

(assert (=> b!1119136 (= res!747548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!747549 () Bool)

(assert (=> start!97808 (=> (not res!747549) (not e!637362))))

(assert (=> start!97808 (= res!747549 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35634 _keys!1208))))))

(assert (=> start!97808 e!637362))

(assert (=> start!97808 tp_is_empty!28045))

(declare-fun array_inv!27024 (array!72886) Bool)

(assert (=> start!97808 (array_inv!27024 _keys!1208)))

(assert (=> start!97808 true))

(assert (=> start!97808 tp!83248))

(declare-fun array_inv!27025 (array!72884) Bool)

(assert (=> start!97808 (and (array_inv!27025 _values!996) e!637364)))

(assert (= (and start!97808 res!747549) b!1119126))

(assert (= (and b!1119126 res!747545) b!1119137))

(assert (= (and b!1119137 res!747544) b!1119136))

(assert (= (and b!1119136 res!747548) b!1119129))

(assert (= (and b!1119129 res!747543) b!1119128))

(assert (= (and b!1119128 res!747553) b!1119132))

(assert (= (and b!1119132 res!747552) b!1119130))

(assert (= (and b!1119130 res!747547) b!1119131))

(assert (= (and b!1119131 res!747546) b!1119127))

(assert (= (and b!1119127 res!747551) b!1119133))

(assert (= (and b!1119133 (not res!747550)) b!1119138))

(assert (= (and b!1119125 condMapEmpty!43885) mapIsEmpty!43885))

(assert (= (and b!1119125 (not condMapEmpty!43885)) mapNonEmpty!43885))

(get-info :version)

(assert (= (and mapNonEmpty!43885 ((_ is ValueCellFull!13313) mapValue!43885)) b!1119134))

(assert (= (and b!1119125 ((_ is ValueCellFull!13313) mapDefault!43885)) b!1119135))

(assert (= start!97808 b!1119125))

(declare-fun b_lambda!18467 () Bool)

(assert (=> (not b_lambda!18467) (not b!1119138)))

(declare-fun t!34989 () Bool)

(declare-fun tb!8319 () Bool)

(assert (=> (and start!97808 (= defaultEntry!1004 defaultEntry!1004) t!34989) tb!8319))

(declare-fun result!17207 () Bool)

(assert (=> tb!8319 (= result!17207 tp_is_empty!28045)))

(assert (=> b!1119138 t!34989))

(declare-fun b_and!37793 () Bool)

(assert (= b_and!37791 (and (=> t!34989 result!17207) b_and!37793)))

(declare-fun m!1033953 () Bool)

(assert (=> b!1119127 m!1033953))

(declare-fun m!1033955 () Bool)

(assert (=> b!1119136 m!1033955))

(declare-fun m!1033957 () Bool)

(assert (=> b!1119130 m!1033957))

(declare-fun m!1033959 () Bool)

(assert (=> b!1119132 m!1033959))

(declare-fun m!1033961 () Bool)

(assert (=> b!1119131 m!1033961))

(declare-fun m!1033963 () Bool)

(assert (=> b!1119131 m!1033963))

(declare-fun m!1033965 () Bool)

(assert (=> b!1119126 m!1033965))

(declare-fun m!1033967 () Bool)

(assert (=> mapNonEmpty!43885 m!1033967))

(declare-fun m!1033969 () Bool)

(assert (=> start!97808 m!1033969))

(declare-fun m!1033971 () Bool)

(assert (=> start!97808 m!1033971))

(declare-fun m!1033973 () Bool)

(assert (=> b!1119129 m!1033973))

(declare-fun m!1033975 () Bool)

(assert (=> b!1119138 m!1033975))

(declare-fun m!1033977 () Bool)

(assert (=> b!1119138 m!1033977))

(declare-fun m!1033979 () Bool)

(assert (=> b!1119138 m!1033979))

(declare-fun m!1033981 () Bool)

(assert (=> b!1119138 m!1033981))

(declare-fun m!1033983 () Bool)

(assert (=> b!1119133 m!1033983))

(declare-fun m!1033985 () Bool)

(assert (=> b!1119133 m!1033985))

(check-sat (not b!1119132) tp_is_empty!28045 (not b!1119136) (not b_lambda!18467) (not b!1119127) (not b_next!23515) (not start!97808) (not mapNonEmpty!43885) b_and!37793 (not b!1119126) (not b!1119138) (not b!1119131) (not b!1119129) (not b!1119133))
(check-sat b_and!37793 (not b_next!23515))
