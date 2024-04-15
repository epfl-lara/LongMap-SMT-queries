; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109102 () Bool)

(assert start!109102)

(declare-fun b_free!28591 () Bool)

(declare-fun b_next!28591 () Bool)

(assert (=> start!109102 (= b_free!28591 (not b_next!28591))))

(declare-fun tp!100893 () Bool)

(declare-fun b_and!46663 () Bool)

(assert (=> start!109102 (= tp!100893 b_and!46663)))

(declare-fun mapNonEmpty!52907 () Bool)

(declare-fun mapRes!52907 () Bool)

(declare-fun tp!100892 () Bool)

(declare-fun e!736431 () Bool)

(assert (=> mapNonEmpty!52907 (= mapRes!52907 (and tp!100892 e!736431))))

(declare-fun mapKey!52907 () (_ BitVec 32))

(declare-datatypes ((V!50745 0))(
  ( (V!50746 (val!17190 Int)) )
))
(declare-datatypes ((ValueCell!16217 0))(
  ( (ValueCellFull!16217 (v!19792 V!50745)) (EmptyCell!16217) )
))
(declare-fun mapRest!52907 () (Array (_ BitVec 32) ValueCell!16217))

(declare-datatypes ((array!85391 0))(
  ( (array!85392 (arr!41197 (Array (_ BitVec 32) ValueCell!16217)) (size!41749 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85391)

(declare-fun mapValue!52907 () ValueCell!16217)

(assert (=> mapNonEmpty!52907 (= (arr!41197 _values!1445) (store mapRest!52907 mapKey!52907 mapValue!52907))))

(declare-fun b!1289857 () Bool)

(declare-fun res!856859 () Bool)

(declare-fun e!736427 () Bool)

(assert (=> b!1289857 (=> (not res!856859) (not e!736427))))

(declare-datatypes ((array!85393 0))(
  ( (array!85394 (arr!41198 (Array (_ BitVec 32) (_ BitVec 64))) (size!41750 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85393)

(declare-datatypes ((List!29295 0))(
  ( (Nil!29292) (Cons!29291 (h!30500 (_ BitVec 64)) (t!42851 List!29295)) )
))
(declare-fun arrayNoDuplicates!0 (array!85393 (_ BitVec 32) List!29295) Bool)

(assert (=> b!1289857 (= res!856859 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29292))))

(declare-fun b!1289858 () Bool)

(declare-fun res!856854 () Bool)

(assert (=> b!1289858 (=> (not res!856854) (not e!736427))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85393 (_ BitVec 32)) Bool)

(assert (=> b!1289858 (= res!856854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52907 () Bool)

(assert (=> mapIsEmpty!52907 mapRes!52907))

(declare-fun b!1289859 () Bool)

(declare-fun res!856855 () Bool)

(assert (=> b!1289859 (=> (not res!856855) (not e!736427))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289859 (= res!856855 (not (validKeyInArray!0 (select (arr!41198 _keys!1741) from!2144))))))

(declare-fun b!1289860 () Bool)

(declare-fun res!856857 () Bool)

(assert (=> b!1289860 (=> (not res!856857) (not e!736427))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1289860 (= res!856857 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41750 _keys!1741))))))

(declare-fun b!1289861 () Bool)

(declare-fun e!736430 () Bool)

(assert (=> b!1289861 (= e!736427 (not e!736430))))

(declare-fun res!856856 () Bool)

(assert (=> b!1289861 (=> res!856856 e!736430)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289861 (= res!856856 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22136 0))(
  ( (tuple2!22137 (_1!11079 (_ BitVec 64)) (_2!11079 V!50745)) )
))
(declare-datatypes ((List!29296 0))(
  ( (Nil!29293) (Cons!29292 (h!30501 tuple2!22136) (t!42852 List!29296)) )
))
(declare-datatypes ((ListLongMap!19793 0))(
  ( (ListLongMap!19794 (toList!9912 List!29296)) )
))
(declare-fun contains!7960 (ListLongMap!19793 (_ BitVec 64)) Bool)

(assert (=> b!1289861 (not (contains!7960 (ListLongMap!19794 Nil!29293) k0!1205))))

(declare-datatypes ((Unit!42522 0))(
  ( (Unit!42523) )
))
(declare-fun lt!578242 () Unit!42522)

(declare-fun emptyContainsNothing!61 ((_ BitVec 64)) Unit!42522)

(assert (=> b!1289861 (= lt!578242 (emptyContainsNothing!61 k0!1205))))

(declare-fun b!1289862 () Bool)

(declare-fun e!736428 () Bool)

(declare-fun tp_is_empty!34231 () Bool)

(assert (=> b!1289862 (= e!736428 tp_is_empty!34231)))

(declare-fun b!1289863 () Bool)

(assert (=> b!1289863 (= e!736431 tp_is_empty!34231)))

(declare-fun b!1289864 () Bool)

(declare-fun res!856858 () Bool)

(assert (=> b!1289864 (=> (not res!856858) (not e!736427))))

(assert (=> b!1289864 (= res!856858 (and (= (size!41749 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41750 _keys!1741) (size!41749 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289866 () Bool)

(assert (=> b!1289866 (= e!736430 true)))

(declare-fun lt!578240 () ListLongMap!19793)

(declare-fun minValue!1387 () V!50745)

(declare-fun +!4392 (ListLongMap!19793 tuple2!22136) ListLongMap!19793)

(assert (=> b!1289866 (not (contains!7960 (+!4392 lt!578240 (tuple2!22137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578239 () Unit!42522)

(declare-fun addStillNotContains!369 (ListLongMap!19793 (_ BitVec 64) V!50745 (_ BitVec 64)) Unit!42522)

(assert (=> b!1289866 (= lt!578239 (addStillNotContains!369 lt!578240 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50745)

(assert (=> b!1289866 (not (contains!7960 (+!4392 lt!578240 (tuple2!22137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578241 () Unit!42522)

(assert (=> b!1289866 (= lt!578241 (addStillNotContains!369 lt!578240 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6023 (array!85393 array!85391 (_ BitVec 32) (_ BitVec 32) V!50745 V!50745 (_ BitVec 32) Int) ListLongMap!19793)

(assert (=> b!1289866 (= lt!578240 (getCurrentListMapNoExtraKeys!6023 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289865 () Bool)

(declare-fun res!856853 () Bool)

(assert (=> b!1289865 (=> (not res!856853) (not e!736427))))

(declare-fun getCurrentListMap!4863 (array!85393 array!85391 (_ BitVec 32) (_ BitVec 32) V!50745 V!50745 (_ BitVec 32) Int) ListLongMap!19793)

(assert (=> b!1289865 (= res!856853 (contains!7960 (getCurrentListMap!4863 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!856860 () Bool)

(assert (=> start!109102 (=> (not res!856860) (not e!736427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109102 (= res!856860 (validMask!0 mask!2175))))

(assert (=> start!109102 e!736427))

(assert (=> start!109102 tp_is_empty!34231))

(assert (=> start!109102 true))

(declare-fun e!736426 () Bool)

(declare-fun array_inv!31387 (array!85391) Bool)

(assert (=> start!109102 (and (array_inv!31387 _values!1445) e!736426)))

(declare-fun array_inv!31388 (array!85393) Bool)

(assert (=> start!109102 (array_inv!31388 _keys!1741)))

(assert (=> start!109102 tp!100893))

(declare-fun b!1289867 () Bool)

(declare-fun res!856852 () Bool)

(assert (=> b!1289867 (=> (not res!856852) (not e!736427))))

(assert (=> b!1289867 (= res!856852 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41750 _keys!1741))))))

(declare-fun b!1289868 () Bool)

(assert (=> b!1289868 (= e!736426 (and e!736428 mapRes!52907))))

(declare-fun condMapEmpty!52907 () Bool)

(declare-fun mapDefault!52907 () ValueCell!16217)

(assert (=> b!1289868 (= condMapEmpty!52907 (= (arr!41197 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16217)) mapDefault!52907)))))

(assert (= (and start!109102 res!856860) b!1289864))

(assert (= (and b!1289864 res!856858) b!1289858))

(assert (= (and b!1289858 res!856854) b!1289857))

(assert (= (and b!1289857 res!856859) b!1289867))

(assert (= (and b!1289867 res!856852) b!1289865))

(assert (= (and b!1289865 res!856853) b!1289860))

(assert (= (and b!1289860 res!856857) b!1289859))

(assert (= (and b!1289859 res!856855) b!1289861))

(assert (= (and b!1289861 (not res!856856)) b!1289866))

(assert (= (and b!1289868 condMapEmpty!52907) mapIsEmpty!52907))

(assert (= (and b!1289868 (not condMapEmpty!52907)) mapNonEmpty!52907))

(get-info :version)

(assert (= (and mapNonEmpty!52907 ((_ is ValueCellFull!16217) mapValue!52907)) b!1289863))

(assert (= (and b!1289868 ((_ is ValueCellFull!16217) mapDefault!52907)) b!1289862))

(assert (= start!109102 b!1289868))

(declare-fun m!1181967 () Bool)

(assert (=> b!1289857 m!1181967))

(declare-fun m!1181969 () Bool)

(assert (=> mapNonEmpty!52907 m!1181969))

(declare-fun m!1181971 () Bool)

(assert (=> b!1289859 m!1181971))

(assert (=> b!1289859 m!1181971))

(declare-fun m!1181973 () Bool)

(assert (=> b!1289859 m!1181973))

(declare-fun m!1181975 () Bool)

(assert (=> b!1289865 m!1181975))

(assert (=> b!1289865 m!1181975))

(declare-fun m!1181977 () Bool)

(assert (=> b!1289865 m!1181977))

(declare-fun m!1181979 () Bool)

(assert (=> b!1289858 m!1181979))

(declare-fun m!1181981 () Bool)

(assert (=> b!1289861 m!1181981))

(declare-fun m!1181983 () Bool)

(assert (=> b!1289861 m!1181983))

(declare-fun m!1181985 () Bool)

(assert (=> b!1289866 m!1181985))

(declare-fun m!1181987 () Bool)

(assert (=> b!1289866 m!1181987))

(declare-fun m!1181989 () Bool)

(assert (=> b!1289866 m!1181989))

(declare-fun m!1181991 () Bool)

(assert (=> b!1289866 m!1181991))

(assert (=> b!1289866 m!1181987))

(declare-fun m!1181993 () Bool)

(assert (=> b!1289866 m!1181993))

(declare-fun m!1181995 () Bool)

(assert (=> b!1289866 m!1181995))

(assert (=> b!1289866 m!1181985))

(declare-fun m!1181997 () Bool)

(assert (=> b!1289866 m!1181997))

(declare-fun m!1181999 () Bool)

(assert (=> start!109102 m!1181999))

(declare-fun m!1182001 () Bool)

(assert (=> start!109102 m!1182001))

(declare-fun m!1182003 () Bool)

(assert (=> start!109102 m!1182003))

(check-sat b_and!46663 (not b!1289861) (not b!1289866) (not b_next!28591) tp_is_empty!34231 (not b!1289865) (not b!1289859) (not b!1289858) (not b!1289857) (not mapNonEmpty!52907) (not start!109102))
(check-sat b_and!46663 (not b_next!28591))
