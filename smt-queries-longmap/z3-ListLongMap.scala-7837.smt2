; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97768 () Bool)

(assert start!97768)

(declare-fun b_free!23469 () Bool)

(declare-fun b_next!23469 () Bool)

(assert (=> start!97768 (= b_free!23469 (not b_next!23469))))

(declare-fun tp!83111 () Bool)

(declare-fun b_and!37743 () Bool)

(assert (=> start!97768 (= tp!83111 b_and!37743)))

(declare-fun b!1118264 () Bool)

(declare-fun e!636963 () Bool)

(assert (=> b!1118264 (= e!636963 true)))

(declare-datatypes ((V!42459 0))(
  ( (V!42460 (val!14056 Int)) )
))
(declare-fun zeroValue!944 () V!42459)

(declare-datatypes ((array!72889 0))(
  ( (array!72890 (arr!35097 (Array (_ BitVec 32) (_ BitVec 64))) (size!35633 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17628 0))(
  ( (tuple2!17629 (_1!8825 (_ BitVec 64)) (_2!8825 V!42459)) )
))
(declare-datatypes ((List!24414 0))(
  ( (Nil!24411) (Cons!24410 (h!25619 tuple2!17628) (t!34895 List!24414)) )
))
(declare-datatypes ((ListLongMap!15597 0))(
  ( (ListLongMap!15598 (toList!7814 List!24414)) )
))
(declare-fun lt!497458 () ListLongMap!15597)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13290 0))(
  ( (ValueCellFull!13290 (v!16689 V!42459)) (EmptyCell!13290) )
))
(declare-datatypes ((array!72891 0))(
  ( (array!72892 (arr!35098 (Array (_ BitVec 32) ValueCell!13290)) (size!35634 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72891)

(declare-fun minValue!944 () V!42459)

(declare-fun getCurrentListMapNoExtraKeys!4304 (array!72889 array!72891 (_ BitVec 32) (_ BitVec 32) V!42459 V!42459 (_ BitVec 32) Int) ListLongMap!15597)

(assert (=> b!1118264 (= lt!497458 (getCurrentListMapNoExtraKeys!4304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118265 () Bool)

(declare-fun res!746858 () Bool)

(declare-fun e!636966 () Bool)

(assert (=> b!1118265 (=> (not res!746858) (not e!636966))))

(assert (=> b!1118265 (= res!746858 (and (= (size!35634 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35633 _keys!1208) (size!35634 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118266 () Bool)

(declare-fun res!746855 () Bool)

(assert (=> b!1118266 (=> (not res!746855) (not e!636966))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118266 (= res!746855 (= (select (arr!35097 _keys!1208) i!673) k0!934))))

(declare-fun b!1118267 () Bool)

(declare-fun res!746863 () Bool)

(assert (=> b!1118267 (=> (not res!746863) (not e!636966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72889 (_ BitVec 32)) Bool)

(assert (=> b!1118267 (= res!746863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118268 () Bool)

(declare-fun res!746861 () Bool)

(assert (=> b!1118268 (=> (not res!746861) (not e!636966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118268 (= res!746861 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43816 () Bool)

(declare-fun mapRes!43816 () Bool)

(declare-fun tp!83110 () Bool)

(declare-fun e!636964 () Bool)

(assert (=> mapNonEmpty!43816 (= mapRes!43816 (and tp!83110 e!636964))))

(declare-fun mapValue!43816 () ValueCell!13290)

(declare-fun mapRest!43816 () (Array (_ BitVec 32) ValueCell!13290))

(declare-fun mapKey!43816 () (_ BitVec 32))

(assert (=> mapNonEmpty!43816 (= (arr!35098 _values!996) (store mapRest!43816 mapKey!43816 mapValue!43816))))

(declare-fun b!1118269 () Bool)

(declare-fun res!746860 () Bool)

(assert (=> b!1118269 (=> (not res!746860) (not e!636966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118269 (= res!746860 (validMask!0 mask!1564))))

(declare-fun b!1118270 () Bool)

(declare-fun e!636961 () Bool)

(declare-fun tp_is_empty!27999 () Bool)

(assert (=> b!1118270 (= e!636961 tp_is_empty!27999)))

(declare-fun mapIsEmpty!43816 () Bool)

(assert (=> mapIsEmpty!43816 mapRes!43816))

(declare-fun b!1118271 () Bool)

(declare-fun e!636962 () Bool)

(assert (=> b!1118271 (= e!636962 (and e!636961 mapRes!43816))))

(declare-fun condMapEmpty!43816 () Bool)

(declare-fun mapDefault!43816 () ValueCell!13290)

(assert (=> b!1118271 (= condMapEmpty!43816 (= (arr!35098 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13290)) mapDefault!43816)))))

(declare-fun b!1118273 () Bool)

(declare-fun res!746856 () Bool)

(declare-fun e!636960 () Bool)

(assert (=> b!1118273 (=> (not res!746856) (not e!636960))))

(declare-fun lt!497459 () array!72889)

(declare-datatypes ((List!24415 0))(
  ( (Nil!24412) (Cons!24411 (h!25620 (_ BitVec 64)) (t!34896 List!24415)) )
))
(declare-fun arrayNoDuplicates!0 (array!72889 (_ BitVec 32) List!24415) Bool)

(assert (=> b!1118273 (= res!746856 (arrayNoDuplicates!0 lt!497459 #b00000000000000000000000000000000 Nil!24412))))

(declare-fun b!1118274 () Bool)

(assert (=> b!1118274 (= e!636966 e!636960)))

(declare-fun res!746854 () Bool)

(assert (=> b!1118274 (=> (not res!746854) (not e!636960))))

(assert (=> b!1118274 (= res!746854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497459 mask!1564))))

(assert (=> b!1118274 (= lt!497459 (array!72890 (store (arr!35097 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35633 _keys!1208)))))

(declare-fun b!1118275 () Bool)

(declare-fun res!746853 () Bool)

(assert (=> b!1118275 (=> (not res!746853) (not e!636966))))

(assert (=> b!1118275 (= res!746853 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35633 _keys!1208))))))

(declare-fun b!1118276 () Bool)

(assert (=> b!1118276 (= e!636960 (not e!636963))))

(declare-fun res!746857 () Bool)

(assert (=> b!1118276 (=> res!746857 e!636963)))

(assert (=> b!1118276 (= res!746857 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118276 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36702 0))(
  ( (Unit!36703) )
))
(declare-fun lt!497457 () Unit!36702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72889 (_ BitVec 64) (_ BitVec 32)) Unit!36702)

(assert (=> b!1118276 (= lt!497457 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118277 () Bool)

(assert (=> b!1118277 (= e!636964 tp_is_empty!27999)))

(declare-fun b!1118272 () Bool)

(declare-fun res!746862 () Bool)

(assert (=> b!1118272 (=> (not res!746862) (not e!636966))))

(assert (=> b!1118272 (= res!746862 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24412))))

(declare-fun res!746859 () Bool)

(assert (=> start!97768 (=> (not res!746859) (not e!636966))))

(assert (=> start!97768 (= res!746859 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35633 _keys!1208))))))

(assert (=> start!97768 e!636966))

(assert (=> start!97768 tp_is_empty!27999))

(declare-fun array_inv!26966 (array!72889) Bool)

(assert (=> start!97768 (array_inv!26966 _keys!1208)))

(assert (=> start!97768 true))

(assert (=> start!97768 tp!83111))

(declare-fun array_inv!26967 (array!72891) Bool)

(assert (=> start!97768 (and (array_inv!26967 _values!996) e!636962)))

(assert (= (and start!97768 res!746859) b!1118269))

(assert (= (and b!1118269 res!746860) b!1118265))

(assert (= (and b!1118265 res!746858) b!1118267))

(assert (= (and b!1118267 res!746863) b!1118272))

(assert (= (and b!1118272 res!746862) b!1118275))

(assert (= (and b!1118275 res!746853) b!1118268))

(assert (= (and b!1118268 res!746861) b!1118266))

(assert (= (and b!1118266 res!746855) b!1118274))

(assert (= (and b!1118274 res!746854) b!1118273))

(assert (= (and b!1118273 res!746856) b!1118276))

(assert (= (and b!1118276 (not res!746857)) b!1118264))

(assert (= (and b!1118271 condMapEmpty!43816) mapIsEmpty!43816))

(assert (= (and b!1118271 (not condMapEmpty!43816)) mapNonEmpty!43816))

(get-info :version)

(assert (= (and mapNonEmpty!43816 ((_ is ValueCellFull!13290) mapValue!43816)) b!1118277))

(assert (= (and b!1118271 ((_ is ValueCellFull!13290) mapDefault!43816)) b!1118270))

(assert (= start!97768 b!1118271))

(declare-fun m!1033863 () Bool)

(assert (=> b!1118274 m!1033863))

(declare-fun m!1033865 () Bool)

(assert (=> b!1118274 m!1033865))

(declare-fun m!1033867 () Bool)

(assert (=> b!1118267 m!1033867))

(declare-fun m!1033869 () Bool)

(assert (=> start!97768 m!1033869))

(declare-fun m!1033871 () Bool)

(assert (=> start!97768 m!1033871))

(declare-fun m!1033873 () Bool)

(assert (=> b!1118266 m!1033873))

(declare-fun m!1033875 () Bool)

(assert (=> b!1118272 m!1033875))

(declare-fun m!1033877 () Bool)

(assert (=> b!1118276 m!1033877))

(declare-fun m!1033879 () Bool)

(assert (=> b!1118276 m!1033879))

(declare-fun m!1033881 () Bool)

(assert (=> b!1118273 m!1033881))

(declare-fun m!1033883 () Bool)

(assert (=> b!1118264 m!1033883))

(declare-fun m!1033885 () Bool)

(assert (=> b!1118269 m!1033885))

(declare-fun m!1033887 () Bool)

(assert (=> b!1118268 m!1033887))

(declare-fun m!1033889 () Bool)

(assert (=> mapNonEmpty!43816 m!1033889))

(check-sat (not b!1118264) b_and!37743 (not b_next!23469) (not mapNonEmpty!43816) (not b!1118267) (not start!97768) (not b!1118276) (not b!1118272) (not b!1118273) (not b!1118274) (not b!1118268) tp_is_empty!27999 (not b!1118269))
(check-sat b_and!37743 (not b_next!23469))
