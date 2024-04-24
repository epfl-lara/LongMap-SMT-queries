; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77960 () Bool)

(assert start!77960)

(declare-fun b_free!16351 () Bool)

(declare-fun b_next!16351 () Bool)

(assert (=> start!77960 (= b_free!16351 (not b_next!16351))))

(declare-fun tp!57319 () Bool)

(declare-fun b_and!26869 () Bool)

(assert (=> start!77960 (= tp!57319 b_and!26869)))

(declare-fun mapIsEmpty!29869 () Bool)

(declare-fun mapRes!29869 () Bool)

(assert (=> mapIsEmpty!29869 mapRes!29869))

(declare-fun b!908761 () Bool)

(declare-fun e!509396 () Bool)

(declare-fun e!509392 () Bool)

(assert (=> b!908761 (= e!509396 (and e!509392 mapRes!29869))))

(declare-fun condMapEmpty!29869 () Bool)

(declare-datatypes ((V!29991 0))(
  ( (V!29992 (val!9435 Int)) )
))
(declare-datatypes ((ValueCell!8903 0))(
  ( (ValueCellFull!8903 (v!11939 V!29991)) (EmptyCell!8903) )
))
(declare-datatypes ((array!53615 0))(
  ( (array!53616 (arr!25761 (Array (_ BitVec 32) ValueCell!8903)) (size!26221 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53615)

(declare-fun mapDefault!29869 () ValueCell!8903)

(assert (=> b!908761 (= condMapEmpty!29869 (= (arr!25761 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8903)) mapDefault!29869)))))

(declare-fun b!908762 () Bool)

(declare-fun tp_is_empty!18769 () Bool)

(assert (=> b!908762 (= e!509392 tp_is_empty!18769)))

(declare-fun b!908763 () Bool)

(declare-fun e!509393 () Bool)

(declare-fun e!509394 () Bool)

(assert (=> b!908763 (= e!509393 e!509394)))

(declare-fun res!613066 () Bool)

(assert (=> b!908763 (=> res!613066 e!509394)))

(declare-datatypes ((tuple2!12226 0))(
  ( (tuple2!12227 (_1!6124 (_ BitVec 64)) (_2!6124 V!29991)) )
))
(declare-datatypes ((List!18057 0))(
  ( (Nil!18054) (Cons!18053 (h!19205 tuple2!12226) (t!25572 List!18057)) )
))
(declare-datatypes ((ListLongMap!10925 0))(
  ( (ListLongMap!10926 (toList!5478 List!18057)) )
))
(declare-fun lt!409866 () ListLongMap!10925)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4532 (ListLongMap!10925 (_ BitVec 64)) Bool)

(assert (=> b!908763 (= res!613066 (not (contains!4532 lt!409866 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29991)

(declare-datatypes ((array!53617 0))(
  ( (array!53618 (arr!25762 (Array (_ BitVec 32) (_ BitVec 64))) (size!26222 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53617)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29991)

(declare-fun getCurrentListMap!2742 (array!53617 array!53615 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 32) Int) ListLongMap!10925)

(assert (=> b!908763 (= lt!409866 (getCurrentListMap!2742 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29869 () Bool)

(declare-fun tp!57318 () Bool)

(declare-fun e!509397 () Bool)

(assert (=> mapNonEmpty!29869 (= mapRes!29869 (and tp!57318 e!509397))))

(declare-fun mapValue!29869 () ValueCell!8903)

(declare-fun mapRest!29869 () (Array (_ BitVec 32) ValueCell!8903))

(declare-fun mapKey!29869 () (_ BitVec 32))

(assert (=> mapNonEmpty!29869 (= (arr!25761 _values!1152) (store mapRest!29869 mapKey!29869 mapValue!29869))))

(declare-fun res!613067 () Bool)

(declare-fun e!509395 () Bool)

(assert (=> start!77960 (=> (not res!613067) (not e!509395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77960 (= res!613067 (validMask!0 mask!1756))))

(assert (=> start!77960 e!509395))

(declare-fun array_inv!20230 (array!53615) Bool)

(assert (=> start!77960 (and (array_inv!20230 _values!1152) e!509396)))

(assert (=> start!77960 tp!57319))

(assert (=> start!77960 true))

(assert (=> start!77960 tp_is_empty!18769))

(declare-fun array_inv!20231 (array!53617) Bool)

(assert (=> start!77960 (array_inv!20231 _keys!1386)))

(declare-fun b!908764 () Bool)

(declare-fun res!613063 () Bool)

(assert (=> b!908764 (=> (not res!613063) (not e!509395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53617 (_ BitVec 32)) Bool)

(assert (=> b!908764 (= res!613063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908765 () Bool)

(assert (=> b!908765 (= e!509397 tp_is_empty!18769)))

(declare-fun b!908766 () Bool)

(declare-fun res!613065 () Bool)

(declare-fun e!509391 () Bool)

(assert (=> b!908766 (=> (not res!613065) (not e!509391))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908766 (= res!613065 (inRange!0 i!717 mask!1756))))

(declare-fun b!908767 () Bool)

(declare-fun res!613061 () Bool)

(assert (=> b!908767 (=> (not res!613061) (not e!509391))))

(assert (=> b!908767 (= res!613061 (and (= (select (arr!25762 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908768 () Bool)

(assert (=> b!908768 (= e!509394 true)))

(declare-fun lt!409863 () ListLongMap!10925)

(declare-fun lt!409864 () V!29991)

(declare-fun apply!496 (ListLongMap!10925 (_ BitVec 64)) V!29991)

(assert (=> b!908768 (= (apply!496 lt!409863 k0!1033) lt!409864)))

(declare-datatypes ((Unit!30804 0))(
  ( (Unit!30805) )
))
(declare-fun lt!409862 () Unit!30804)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!45 (array!53617 array!53615 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 64) V!29991 (_ BitVec 32) Int) Unit!30804)

(assert (=> b!908768 (= lt!409862 (lemmaListMapApplyFromThenApplyFromZero!45 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409864 i!717 defaultEntry!1160))))

(declare-fun b!908769 () Bool)

(declare-fun res!613062 () Bool)

(assert (=> b!908769 (=> (not res!613062) (not e!509395))))

(declare-datatypes ((List!18058 0))(
  ( (Nil!18055) (Cons!18054 (h!19206 (_ BitVec 64)) (t!25573 List!18058)) )
))
(declare-fun arrayNoDuplicates!0 (array!53617 (_ BitVec 32) List!18058) Bool)

(assert (=> b!908769 (= res!613062 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18055))))

(declare-fun b!908770 () Bool)

(assert (=> b!908770 (= e!509391 (not e!509393))))

(declare-fun res!613059 () Bool)

(assert (=> b!908770 (=> res!613059 e!509393)))

(assert (=> b!908770 (= res!613059 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26222 _keys!1386))))))

(declare-fun get!13568 (ValueCell!8903 V!29991) V!29991)

(declare-fun dynLambda!1383 (Int (_ BitVec 64)) V!29991)

(assert (=> b!908770 (= lt!409864 (get!13568 (select (arr!25761 _values!1152) i!717) (dynLambda!1383 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908770 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409865 () Unit!30804)

(declare-fun lemmaKeyInListMapIsInArray!242 (array!53617 array!53615 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 64) Int) Unit!30804)

(assert (=> b!908770 (= lt!409865 (lemmaKeyInListMapIsInArray!242 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908771 () Bool)

(declare-fun res!613058 () Bool)

(assert (=> b!908771 (=> (not res!613058) (not e!509395))))

(assert (=> b!908771 (= res!613058 (and (= (size!26221 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26222 _keys!1386) (size!26221 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908772 () Bool)

(assert (=> b!908772 (= e!509395 e!509391)))

(declare-fun res!613064 () Bool)

(assert (=> b!908772 (=> (not res!613064) (not e!509391))))

(assert (=> b!908772 (= res!613064 (contains!4532 lt!409863 k0!1033))))

(assert (=> b!908772 (= lt!409863 (getCurrentListMap!2742 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908773 () Bool)

(declare-fun res!613060 () Bool)

(assert (=> b!908773 (=> res!613060 e!509394)))

(assert (=> b!908773 (= res!613060 (not (= (apply!496 lt!409866 k0!1033) lt!409864)))))

(assert (= (and start!77960 res!613067) b!908771))

(assert (= (and b!908771 res!613058) b!908764))

(assert (= (and b!908764 res!613063) b!908769))

(assert (= (and b!908769 res!613062) b!908772))

(assert (= (and b!908772 res!613064) b!908766))

(assert (= (and b!908766 res!613065) b!908767))

(assert (= (and b!908767 res!613061) b!908770))

(assert (= (and b!908770 (not res!613059)) b!908763))

(assert (= (and b!908763 (not res!613066)) b!908773))

(assert (= (and b!908773 (not res!613060)) b!908768))

(assert (= (and b!908761 condMapEmpty!29869) mapIsEmpty!29869))

(assert (= (and b!908761 (not condMapEmpty!29869)) mapNonEmpty!29869))

(get-info :version)

(assert (= (and mapNonEmpty!29869 ((_ is ValueCellFull!8903) mapValue!29869)) b!908765))

(assert (= (and b!908761 ((_ is ValueCellFull!8903) mapDefault!29869)) b!908762))

(assert (= start!77960 b!908761))

(declare-fun b_lambda!13249 () Bool)

(assert (=> (not b_lambda!13249) (not b!908770)))

(declare-fun t!25571 () Bool)

(declare-fun tb!5365 () Bool)

(assert (=> (and start!77960 (= defaultEntry!1160 defaultEntry!1160) t!25571) tb!5365))

(declare-fun result!10535 () Bool)

(assert (=> tb!5365 (= result!10535 tp_is_empty!18769)))

(assert (=> b!908770 t!25571))

(declare-fun b_and!26871 () Bool)

(assert (= b_and!26869 (and (=> t!25571 result!10535) b_and!26871)))

(declare-fun m!844503 () Bool)

(assert (=> b!908772 m!844503))

(declare-fun m!844505 () Bool)

(assert (=> b!908772 m!844505))

(declare-fun m!844507 () Bool)

(assert (=> b!908769 m!844507))

(declare-fun m!844509 () Bool)

(assert (=> b!908766 m!844509))

(declare-fun m!844511 () Bool)

(assert (=> start!77960 m!844511))

(declare-fun m!844513 () Bool)

(assert (=> start!77960 m!844513))

(declare-fun m!844515 () Bool)

(assert (=> start!77960 m!844515))

(declare-fun m!844517 () Bool)

(assert (=> b!908770 m!844517))

(declare-fun m!844519 () Bool)

(assert (=> b!908770 m!844519))

(declare-fun m!844521 () Bool)

(assert (=> b!908770 m!844521))

(declare-fun m!844523 () Bool)

(assert (=> b!908770 m!844523))

(assert (=> b!908770 m!844517))

(assert (=> b!908770 m!844521))

(declare-fun m!844525 () Bool)

(assert (=> b!908770 m!844525))

(declare-fun m!844527 () Bool)

(assert (=> b!908767 m!844527))

(declare-fun m!844529 () Bool)

(assert (=> b!908768 m!844529))

(declare-fun m!844531 () Bool)

(assert (=> b!908768 m!844531))

(declare-fun m!844533 () Bool)

(assert (=> b!908773 m!844533))

(declare-fun m!844535 () Bool)

(assert (=> mapNonEmpty!29869 m!844535))

(declare-fun m!844537 () Bool)

(assert (=> b!908764 m!844537))

(declare-fun m!844539 () Bool)

(assert (=> b!908763 m!844539))

(declare-fun m!844541 () Bool)

(assert (=> b!908763 m!844541))

(check-sat (not b!908766) (not b_lambda!13249) (not b!908769) tp_is_empty!18769 b_and!26871 (not mapNonEmpty!29869) (not b!908770) (not b_next!16351) (not b!908768) (not b!908773) (not b!908763) (not b!908764) (not start!77960) (not b!908772))
(check-sat b_and!26871 (not b_next!16351))
