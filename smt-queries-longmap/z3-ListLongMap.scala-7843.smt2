; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97796 () Bool)

(assert start!97796)

(declare-fun b_free!23503 () Bool)

(declare-fun b_next!23503 () Bool)

(assert (=> start!97796 (= b_free!23503 (not b_next!23503))))

(declare-fun tp!83212 () Bool)

(declare-fun b_and!37767 () Bool)

(assert (=> start!97796 (= tp!83212 b_and!37767)))

(declare-fun b!1118861 () Bool)

(declare-fun res!747355 () Bool)

(declare-fun e!637240 () Bool)

(assert (=> b!1118861 (=> (not res!747355) (not e!637240))))

(declare-datatypes ((array!72860 0))(
  ( (array!72861 (arr!35083 (Array (_ BitVec 32) (_ BitVec 64))) (size!35621 (_ BitVec 32))) )
))
(declare-fun lt!497432 () array!72860)

(declare-datatypes ((List!24483 0))(
  ( (Nil!24480) (Cons!24479 (h!25688 (_ BitVec 64)) (t!34969 List!24483)) )
))
(declare-fun arrayNoDuplicates!0 (array!72860 (_ BitVec 32) List!24483) Bool)

(assert (=> b!1118861 (= res!747355 (arrayNoDuplicates!0 lt!497432 #b00000000000000000000000000000000 Nil!24480))))

(declare-fun res!747346 () Bool)

(declare-fun e!637241 () Bool)

(assert (=> start!97796 (=> (not res!747346) (not e!637241))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72860)

(assert (=> start!97796 (= res!747346 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35621 _keys!1208))))))

(assert (=> start!97796 e!637241))

(declare-fun tp_is_empty!28033 () Bool)

(assert (=> start!97796 tp_is_empty!28033))

(declare-fun array_inv!27018 (array!72860) Bool)

(assert (=> start!97796 (array_inv!27018 _keys!1208)))

(assert (=> start!97796 true))

(assert (=> start!97796 tp!83212))

(declare-datatypes ((V!42505 0))(
  ( (V!42506 (val!14073 Int)) )
))
(declare-datatypes ((ValueCell!13307 0))(
  ( (ValueCellFull!13307 (v!16705 V!42505)) (EmptyCell!13307) )
))
(declare-datatypes ((array!72862 0))(
  ( (array!72863 (arr!35084 (Array (_ BitVec 32) ValueCell!13307)) (size!35622 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72862)

(declare-fun e!637236 () Bool)

(declare-fun array_inv!27019 (array!72862) Bool)

(assert (=> start!97796 (and (array_inv!27019 _values!996) e!637236)))

(declare-fun mapNonEmpty!43867 () Bool)

(declare-fun mapRes!43867 () Bool)

(declare-fun tp!83213 () Bool)

(declare-fun e!637242 () Bool)

(assert (=> mapNonEmpty!43867 (= mapRes!43867 (and tp!83213 e!637242))))

(declare-fun mapValue!43867 () ValueCell!13307)

(declare-fun mapRest!43867 () (Array (_ BitVec 32) ValueCell!13307))

(declare-fun mapKey!43867 () (_ BitVec 32))

(assert (=> mapNonEmpty!43867 (= (arr!35084 _values!996) (store mapRest!43867 mapKey!43867 mapValue!43867))))

(declare-fun b!1118862 () Bool)

(declare-fun res!747352 () Bool)

(assert (=> b!1118862 (=> (not res!747352) (not e!637241))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1118862 (= res!747352 (and (= (size!35622 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35621 _keys!1208) (size!35622 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118863 () Bool)

(declare-fun e!637238 () Bool)

(assert (=> b!1118863 (= e!637238 tp_is_empty!28033)))

(declare-fun b!1118864 () Bool)

(declare-fun res!747351 () Bool)

(assert (=> b!1118864 (=> (not res!747351) (not e!637241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118864 (= res!747351 (validMask!0 mask!1564))))

(declare-fun b!1118865 () Bool)

(assert (=> b!1118865 (= e!637236 (and e!637238 mapRes!43867))))

(declare-fun condMapEmpty!43867 () Bool)

(declare-fun mapDefault!43867 () ValueCell!13307)

(assert (=> b!1118865 (= condMapEmpty!43867 (= (arr!35084 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13307)) mapDefault!43867)))))

(declare-fun b!1118866 () Bool)

(assert (=> b!1118866 (= e!637242 tp_is_empty!28033)))

(declare-fun b!1118867 () Bool)

(declare-fun res!747353 () Bool)

(assert (=> b!1118867 (=> (not res!747353) (not e!637241))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118867 (= res!747353 (= (select (arr!35083 _keys!1208) i!673) k0!934))))

(declare-fun b!1118868 () Bool)

(declare-fun e!637239 () Bool)

(assert (=> b!1118868 (= e!637239 true)))

(declare-fun zeroValue!944 () V!42505)

(declare-datatypes ((tuple2!17716 0))(
  ( (tuple2!17717 (_1!8869 (_ BitVec 64)) (_2!8869 V!42505)) )
))
(declare-datatypes ((List!24484 0))(
  ( (Nil!24481) (Cons!24480 (h!25689 tuple2!17716) (t!34970 List!24484)) )
))
(declare-datatypes ((ListLongMap!15685 0))(
  ( (ListLongMap!15686 (toList!7858 List!24484)) )
))
(declare-fun lt!497431 () ListLongMap!15685)

(declare-fun minValue!944 () V!42505)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4367 (array!72860 array!72862 (_ BitVec 32) (_ BitVec 32) V!42505 V!42505 (_ BitVec 32) Int) ListLongMap!15685)

(declare-fun dynLambda!2410 (Int (_ BitVec 64)) V!42505)

(assert (=> b!1118868 (= lt!497431 (getCurrentListMapNoExtraKeys!4367 lt!497432 (array!72863 (store (arr!35084 _values!996) i!673 (ValueCellFull!13307 (dynLambda!2410 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35622 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497430 () ListLongMap!15685)

(assert (=> b!1118868 (= lt!497430 (getCurrentListMapNoExtraKeys!4367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118869 () Bool)

(declare-fun res!747348 () Bool)

(assert (=> b!1118869 (=> (not res!747348) (not e!637241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118869 (= res!747348 (validKeyInArray!0 k0!934))))

(declare-fun b!1118870 () Bool)

(declare-fun res!747345 () Bool)

(assert (=> b!1118870 (=> (not res!747345) (not e!637241))))

(assert (=> b!1118870 (= res!747345 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24480))))

(declare-fun b!1118871 () Bool)

(declare-fun res!747354 () Bool)

(assert (=> b!1118871 (=> (not res!747354) (not e!637241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72860 (_ BitVec 32)) Bool)

(assert (=> b!1118871 (= res!747354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43867 () Bool)

(assert (=> mapIsEmpty!43867 mapRes!43867))

(declare-fun b!1118872 () Bool)

(declare-fun res!747349 () Bool)

(assert (=> b!1118872 (=> (not res!747349) (not e!637241))))

(assert (=> b!1118872 (= res!747349 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35621 _keys!1208))))))

(declare-fun b!1118873 () Bool)

(assert (=> b!1118873 (= e!637240 (not e!637239))))

(declare-fun res!747347 () Bool)

(assert (=> b!1118873 (=> res!747347 e!637239)))

(assert (=> b!1118873 (= res!747347 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118873 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36547 0))(
  ( (Unit!36548) )
))
(declare-fun lt!497433 () Unit!36547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72860 (_ BitVec 64) (_ BitVec 32)) Unit!36547)

(assert (=> b!1118873 (= lt!497433 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118874 () Bool)

(assert (=> b!1118874 (= e!637241 e!637240)))

(declare-fun res!747350 () Bool)

(assert (=> b!1118874 (=> (not res!747350) (not e!637240))))

(assert (=> b!1118874 (= res!747350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497432 mask!1564))))

(assert (=> b!1118874 (= lt!497432 (array!72861 (store (arr!35083 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35621 _keys!1208)))))

(assert (= (and start!97796 res!747346) b!1118864))

(assert (= (and b!1118864 res!747351) b!1118862))

(assert (= (and b!1118862 res!747352) b!1118871))

(assert (= (and b!1118871 res!747354) b!1118870))

(assert (= (and b!1118870 res!747345) b!1118872))

(assert (= (and b!1118872 res!747349) b!1118869))

(assert (= (and b!1118869 res!747348) b!1118867))

(assert (= (and b!1118867 res!747353) b!1118874))

(assert (= (and b!1118874 res!747350) b!1118861))

(assert (= (and b!1118861 res!747355) b!1118873))

(assert (= (and b!1118873 (not res!747347)) b!1118868))

(assert (= (and b!1118865 condMapEmpty!43867) mapIsEmpty!43867))

(assert (= (and b!1118865 (not condMapEmpty!43867)) mapNonEmpty!43867))

(get-info :version)

(assert (= (and mapNonEmpty!43867 ((_ is ValueCellFull!13307) mapValue!43867)) b!1118866))

(assert (= (and b!1118865 ((_ is ValueCellFull!13307) mapDefault!43867)) b!1118863))

(assert (= start!97796 b!1118865))

(declare-fun b_lambda!18455 () Bool)

(assert (=> (not b_lambda!18455) (not b!1118868)))

(declare-fun t!34968 () Bool)

(declare-fun tb!8307 () Bool)

(assert (=> (and start!97796 (= defaultEntry!1004 defaultEntry!1004) t!34968) tb!8307))

(declare-fun result!17183 () Bool)

(assert (=> tb!8307 (= result!17183 tp_is_empty!28033)))

(assert (=> b!1118868 t!34968))

(declare-fun b_and!37769 () Bool)

(assert (= b_and!37767 (and (=> t!34968 result!17183) b_and!37769)))

(declare-fun m!1033749 () Bool)

(assert (=> start!97796 m!1033749))

(declare-fun m!1033751 () Bool)

(assert (=> start!97796 m!1033751))

(declare-fun m!1033753 () Bool)

(assert (=> b!1118870 m!1033753))

(declare-fun m!1033755 () Bool)

(assert (=> mapNonEmpty!43867 m!1033755))

(declare-fun m!1033757 () Bool)

(assert (=> b!1118861 m!1033757))

(declare-fun m!1033759 () Bool)

(assert (=> b!1118871 m!1033759))

(declare-fun m!1033761 () Bool)

(assert (=> b!1118874 m!1033761))

(declare-fun m!1033763 () Bool)

(assert (=> b!1118874 m!1033763))

(declare-fun m!1033765 () Bool)

(assert (=> b!1118864 m!1033765))

(declare-fun m!1033767 () Bool)

(assert (=> b!1118873 m!1033767))

(declare-fun m!1033769 () Bool)

(assert (=> b!1118873 m!1033769))

(declare-fun m!1033771 () Bool)

(assert (=> b!1118867 m!1033771))

(declare-fun m!1033773 () Bool)

(assert (=> b!1118868 m!1033773))

(declare-fun m!1033775 () Bool)

(assert (=> b!1118868 m!1033775))

(declare-fun m!1033777 () Bool)

(assert (=> b!1118868 m!1033777))

(declare-fun m!1033779 () Bool)

(assert (=> b!1118868 m!1033779))

(declare-fun m!1033781 () Bool)

(assert (=> b!1118869 m!1033781))

(check-sat (not b!1118874) (not b!1118870) b_and!37769 (not b!1118873) (not b!1118868) (not b_next!23503) (not b!1118871) (not b_lambda!18455) (not start!97796) (not b!1118861) (not b!1118869) tp_is_empty!28033 (not b!1118864) (not mapNonEmpty!43867))
(check-sat b_and!37769 (not b_next!23503))
