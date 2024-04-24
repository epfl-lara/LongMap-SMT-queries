; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98092 () Bool)

(assert start!98092)

(declare-fun b_free!23557 () Bool)

(declare-fun b_next!23557 () Bool)

(assert (=> start!98092 (= b_free!23557 (not b_next!23557))))

(declare-fun tp!83374 () Bool)

(declare-fun b_and!37907 () Bool)

(assert (=> start!98092 (= tp!83374 b_and!37907)))

(declare-fun b!1121505 () Bool)

(declare-fun e!638741 () Bool)

(declare-fun tp_is_empty!28087 () Bool)

(assert (=> b!1121505 (= e!638741 tp_is_empty!28087)))

(declare-fun mapNonEmpty!43948 () Bool)

(declare-fun mapRes!43948 () Bool)

(declare-fun tp!83375 () Bool)

(assert (=> mapNonEmpty!43948 (= mapRes!43948 (and tp!83375 e!638741))))

(declare-datatypes ((V!42577 0))(
  ( (V!42578 (val!14100 Int)) )
))
(declare-datatypes ((ValueCell!13334 0))(
  ( (ValueCellFull!13334 (v!16729 V!42577)) (EmptyCell!13334) )
))
(declare-fun mapValue!43948 () ValueCell!13334)

(declare-fun mapKey!43948 () (_ BitVec 32))

(declare-fun mapRest!43948 () (Array (_ BitVec 32) ValueCell!13334))

(declare-datatypes ((array!73105 0))(
  ( (array!73106 (arr!35199 (Array (_ BitVec 32) ValueCell!13334)) (size!35736 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73105)

(assert (=> mapNonEmpty!43948 (= (arr!35199 _values!996) (store mapRest!43948 mapKey!43948 mapValue!43948))))

(declare-fun b!1121506 () Bool)

(declare-fun res!748830 () Bool)

(declare-fun e!638739 () Bool)

(assert (=> b!1121506 (=> (not res!748830) (not e!638739))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73107 0))(
  ( (array!73108 (arr!35200 (Array (_ BitVec 32) (_ BitVec 64))) (size!35737 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73107)

(assert (=> b!1121506 (= res!748830 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35737 _keys!1208))))))

(declare-fun b!1121507 () Bool)

(declare-fun e!638740 () Bool)

(assert (=> b!1121507 (= e!638740 true)))

(declare-fun zeroValue!944 () V!42577)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17700 0))(
  ( (tuple2!17701 (_1!8861 (_ BitVec 64)) (_2!8861 V!42577)) )
))
(declare-datatypes ((List!24497 0))(
  ( (Nil!24494) (Cons!24493 (h!25711 tuple2!17700) (t!35038 List!24497)) )
))
(declare-datatypes ((ListLongMap!15677 0))(
  ( (ListLongMap!15678 (toList!7854 List!24497)) )
))
(declare-fun lt!498472 () ListLongMap!15677)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!498471 () array!73107)

(declare-fun minValue!944 () V!42577)

(declare-fun getCurrentListMapNoExtraKeys!4384 (array!73107 array!73105 (_ BitVec 32) (_ BitVec 32) V!42577 V!42577 (_ BitVec 32) Int) ListLongMap!15677)

(declare-fun dynLambda!2473 (Int (_ BitVec 64)) V!42577)

(assert (=> b!1121507 (= lt!498472 (getCurrentListMapNoExtraKeys!4384 lt!498471 (array!73106 (store (arr!35199 _values!996) i!673 (ValueCellFull!13334 (dynLambda!2473 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35736 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498469 () ListLongMap!15677)

(assert (=> b!1121507 (= lt!498469 (getCurrentListMapNoExtraKeys!4384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121509 () Bool)

(declare-fun res!748835 () Bool)

(assert (=> b!1121509 (=> (not res!748835) (not e!638739))))

(declare-datatypes ((List!24498 0))(
  ( (Nil!24495) (Cons!24494 (h!25712 (_ BitVec 64)) (t!35039 List!24498)) )
))
(declare-fun arrayNoDuplicates!0 (array!73107 (_ BitVec 32) List!24498) Bool)

(assert (=> b!1121509 (= res!748835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24495))))

(declare-fun b!1121510 () Bool)

(declare-fun res!748836 () Bool)

(assert (=> b!1121510 (=> (not res!748836) (not e!638739))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121510 (= res!748836 (= (select (arr!35200 _keys!1208) i!673) k0!934))))

(declare-fun b!1121511 () Bool)

(declare-fun res!748832 () Bool)

(assert (=> b!1121511 (=> (not res!748832) (not e!638739))))

(assert (=> b!1121511 (= res!748832 (and (= (size!35736 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35737 _keys!1208) (size!35736 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121508 () Bool)

(declare-fun e!638743 () Bool)

(assert (=> b!1121508 (= e!638743 (not e!638740))))

(declare-fun res!748834 () Bool)

(assert (=> b!1121508 (=> res!748834 e!638740)))

(assert (=> b!1121508 (= res!748834 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121508 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36743 0))(
  ( (Unit!36744) )
))
(declare-fun lt!498470 () Unit!36743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73107 (_ BitVec 64) (_ BitVec 32)) Unit!36743)

(assert (=> b!1121508 (= lt!498470 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!748828 () Bool)

(assert (=> start!98092 (=> (not res!748828) (not e!638739))))

(assert (=> start!98092 (= res!748828 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35737 _keys!1208))))))

(assert (=> start!98092 e!638739))

(assert (=> start!98092 tp_is_empty!28087))

(declare-fun array_inv!27098 (array!73107) Bool)

(assert (=> start!98092 (array_inv!27098 _keys!1208)))

(assert (=> start!98092 true))

(assert (=> start!98092 tp!83374))

(declare-fun e!638745 () Bool)

(declare-fun array_inv!27099 (array!73105) Bool)

(assert (=> start!98092 (and (array_inv!27099 _values!996) e!638745)))

(declare-fun b!1121512 () Bool)

(declare-fun res!748829 () Bool)

(assert (=> b!1121512 (=> (not res!748829) (not e!638739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121512 (= res!748829 (validMask!0 mask!1564))))

(declare-fun b!1121513 () Bool)

(declare-fun e!638742 () Bool)

(assert (=> b!1121513 (= e!638742 tp_is_empty!28087)))

(declare-fun b!1121514 () Bool)

(assert (=> b!1121514 (= e!638745 (and e!638742 mapRes!43948))))

(declare-fun condMapEmpty!43948 () Bool)

(declare-fun mapDefault!43948 () ValueCell!13334)

(assert (=> b!1121514 (= condMapEmpty!43948 (= (arr!35199 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13334)) mapDefault!43948)))))

(declare-fun b!1121515 () Bool)

(declare-fun res!748831 () Bool)

(assert (=> b!1121515 (=> (not res!748831) (not e!638743))))

(assert (=> b!1121515 (= res!748831 (arrayNoDuplicates!0 lt!498471 #b00000000000000000000000000000000 Nil!24495))))

(declare-fun b!1121516 () Bool)

(declare-fun res!748827 () Bool)

(assert (=> b!1121516 (=> (not res!748827) (not e!638739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121516 (= res!748827 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43948 () Bool)

(assert (=> mapIsEmpty!43948 mapRes!43948))

(declare-fun b!1121517 () Bool)

(assert (=> b!1121517 (= e!638739 e!638743)))

(declare-fun res!748837 () Bool)

(assert (=> b!1121517 (=> (not res!748837) (not e!638743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73107 (_ BitVec 32)) Bool)

(assert (=> b!1121517 (= res!748837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498471 mask!1564))))

(assert (=> b!1121517 (= lt!498471 (array!73108 (store (arr!35200 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35737 _keys!1208)))))

(declare-fun b!1121518 () Bool)

(declare-fun res!748833 () Bool)

(assert (=> b!1121518 (=> (not res!748833) (not e!638739))))

(assert (=> b!1121518 (= res!748833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98092 res!748828) b!1121512))

(assert (= (and b!1121512 res!748829) b!1121511))

(assert (= (and b!1121511 res!748832) b!1121518))

(assert (= (and b!1121518 res!748833) b!1121509))

(assert (= (and b!1121509 res!748835) b!1121506))

(assert (= (and b!1121506 res!748830) b!1121516))

(assert (= (and b!1121516 res!748827) b!1121510))

(assert (= (and b!1121510 res!748836) b!1121517))

(assert (= (and b!1121517 res!748837) b!1121515))

(assert (= (and b!1121515 res!748831) b!1121508))

(assert (= (and b!1121508 (not res!748834)) b!1121507))

(assert (= (and b!1121514 condMapEmpty!43948) mapIsEmpty!43948))

(assert (= (and b!1121514 (not condMapEmpty!43948)) mapNonEmpty!43948))

(get-info :version)

(assert (= (and mapNonEmpty!43948 ((_ is ValueCellFull!13334) mapValue!43948)) b!1121505))

(assert (= (and b!1121514 ((_ is ValueCellFull!13334) mapDefault!43948)) b!1121513))

(assert (= start!98092 b!1121514))

(declare-fun b_lambda!18537 () Bool)

(assert (=> (not b_lambda!18537) (not b!1121507)))

(declare-fun t!35037 () Bool)

(declare-fun tb!8361 () Bool)

(assert (=> (and start!98092 (= defaultEntry!1004 defaultEntry!1004) t!35037) tb!8361))

(declare-fun result!17291 () Bool)

(assert (=> tb!8361 (= result!17291 tp_is_empty!28087)))

(assert (=> b!1121507 t!35037))

(declare-fun b_and!37909 () Bool)

(assert (= b_and!37907 (and (=> t!35037 result!17291) b_and!37909)))

(declare-fun m!1036965 () Bool)

(assert (=> b!1121518 m!1036965))

(declare-fun m!1036967 () Bool)

(assert (=> b!1121512 m!1036967))

(declare-fun m!1036969 () Bool)

(assert (=> b!1121515 m!1036969))

(declare-fun m!1036971 () Bool)

(assert (=> b!1121516 m!1036971))

(declare-fun m!1036973 () Bool)

(assert (=> start!98092 m!1036973))

(declare-fun m!1036975 () Bool)

(assert (=> start!98092 m!1036975))

(declare-fun m!1036977 () Bool)

(assert (=> b!1121517 m!1036977))

(declare-fun m!1036979 () Bool)

(assert (=> b!1121517 m!1036979))

(declare-fun m!1036981 () Bool)

(assert (=> b!1121508 m!1036981))

(declare-fun m!1036983 () Bool)

(assert (=> b!1121508 m!1036983))

(declare-fun m!1036985 () Bool)

(assert (=> mapNonEmpty!43948 m!1036985))

(declare-fun m!1036987 () Bool)

(assert (=> b!1121509 m!1036987))

(declare-fun m!1036989 () Bool)

(assert (=> b!1121507 m!1036989))

(declare-fun m!1036991 () Bool)

(assert (=> b!1121507 m!1036991))

(declare-fun m!1036993 () Bool)

(assert (=> b!1121507 m!1036993))

(declare-fun m!1036995 () Bool)

(assert (=> b!1121507 m!1036995))

(declare-fun m!1036997 () Bool)

(assert (=> b!1121510 m!1036997))

(check-sat (not b!1121518) (not b_next!23557) (not b!1121512) b_and!37909 (not mapNonEmpty!43948) (not b!1121507) tp_is_empty!28087 (not b_lambda!18537) (not b!1121516) (not b!1121515) (not b!1121517) (not b!1121509) (not start!98092) (not b!1121508))
(check-sat b_and!37909 (not b_next!23557))
