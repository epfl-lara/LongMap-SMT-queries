; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109074 () Bool)

(assert start!109074)

(declare-fun b_free!28563 () Bool)

(declare-fun b_next!28563 () Bool)

(assert (=> start!109074 (= b_free!28563 (not b_next!28563))))

(declare-fun tp!100807 () Bool)

(declare-fun b_and!46653 () Bool)

(assert (=> start!109074 (= tp!100807 b_and!46653)))

(declare-fun b!1289417 () Bool)

(declare-fun e!736207 () Bool)

(declare-fun e!736208 () Bool)

(assert (=> b!1289417 (= e!736207 (not e!736208))))

(declare-fun res!856502 () Bool)

(assert (=> b!1289417 (=> res!856502 e!736208)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289417 (= res!856502 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50707 0))(
  ( (V!50708 (val!17176 Int)) )
))
(declare-datatypes ((tuple2!22062 0))(
  ( (tuple2!22063 (_1!11042 (_ BitVec 64)) (_2!11042 V!50707)) )
))
(declare-datatypes ((List!29231 0))(
  ( (Nil!29228) (Cons!29227 (h!30436 tuple2!22062) (t!42795 List!29231)) )
))
(declare-datatypes ((ListLongMap!19719 0))(
  ( (ListLongMap!19720 (toList!9875 List!29231)) )
))
(declare-fun contains!7993 (ListLongMap!19719 (_ BitVec 64)) Bool)

(assert (=> b!1289417 (not (contains!7993 (ListLongMap!19720 Nil!29228) k0!1205))))

(declare-datatypes ((Unit!42668 0))(
  ( (Unit!42669) )
))
(declare-fun lt!578249 () Unit!42668)

(declare-fun emptyContainsNothing!62 ((_ BitVec 64)) Unit!42668)

(assert (=> b!1289417 (= lt!578249 (emptyContainsNothing!62 k0!1205))))

(declare-fun b!1289418 () Bool)

(declare-fun res!856503 () Bool)

(assert (=> b!1289418 (=> (not res!856503) (not e!736207))))

(declare-fun minValue!1387 () V!50707)

(declare-fun zeroValue!1387 () V!50707)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85448 0))(
  ( (array!85449 (arr!41225 (Array (_ BitVec 32) (_ BitVec 64))) (size!41775 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85448)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16203 0))(
  ( (ValueCellFull!16203 (v!19779 V!50707)) (EmptyCell!16203) )
))
(declare-datatypes ((array!85450 0))(
  ( (array!85451 (arr!41226 (Array (_ BitVec 32) ValueCell!16203)) (size!41776 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85450)

(declare-fun getCurrentListMap!4935 (array!85448 array!85450 (_ BitVec 32) (_ BitVec 32) V!50707 V!50707 (_ BitVec 32) Int) ListLongMap!19719)

(assert (=> b!1289418 (= res!856503 (contains!7993 (getCurrentListMap!4935 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!856504 () Bool)

(assert (=> start!109074 (=> (not res!856504) (not e!736207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109074 (= res!856504 (validMask!0 mask!2175))))

(assert (=> start!109074 e!736207))

(declare-fun tp_is_empty!34203 () Bool)

(assert (=> start!109074 tp_is_empty!34203))

(assert (=> start!109074 true))

(declare-fun e!736203 () Bool)

(declare-fun array_inv!31249 (array!85450) Bool)

(assert (=> start!109074 (and (array_inv!31249 _values!1445) e!736203)))

(declare-fun array_inv!31250 (array!85448) Bool)

(assert (=> start!109074 (array_inv!31250 _keys!1741)))

(assert (=> start!109074 tp!100807))

(declare-fun b!1289419 () Bool)

(declare-fun res!856507 () Bool)

(assert (=> b!1289419 (=> (not res!856507) (not e!736207))))

(assert (=> b!1289419 (= res!856507 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41775 _keys!1741))))))

(declare-fun b!1289420 () Bool)

(declare-fun e!736204 () Bool)

(assert (=> b!1289420 (= e!736204 tp_is_empty!34203)))

(declare-fun b!1289421 () Bool)

(declare-fun e!736206 () Bool)

(assert (=> b!1289421 (= e!736206 tp_is_empty!34203)))

(declare-fun mapIsEmpty!52865 () Bool)

(declare-fun mapRes!52865 () Bool)

(assert (=> mapIsEmpty!52865 mapRes!52865))

(declare-fun b!1289422 () Bool)

(declare-fun res!856506 () Bool)

(assert (=> b!1289422 (=> (not res!856506) (not e!736207))))

(declare-datatypes ((List!29232 0))(
  ( (Nil!29229) (Cons!29228 (h!30437 (_ BitVec 64)) (t!42796 List!29232)) )
))
(declare-fun arrayNoDuplicates!0 (array!85448 (_ BitVec 32) List!29232) Bool)

(assert (=> b!1289422 (= res!856506 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29229))))

(declare-fun b!1289423 () Bool)

(declare-fun res!856501 () Bool)

(assert (=> b!1289423 (=> (not res!856501) (not e!736207))))

(assert (=> b!1289423 (= res!856501 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41775 _keys!1741))))))

(declare-fun mapNonEmpty!52865 () Bool)

(declare-fun tp!100808 () Bool)

(assert (=> mapNonEmpty!52865 (= mapRes!52865 (and tp!100808 e!736204))))

(declare-fun mapKey!52865 () (_ BitVec 32))

(declare-fun mapRest!52865 () (Array (_ BitVec 32) ValueCell!16203))

(declare-fun mapValue!52865 () ValueCell!16203)

(assert (=> mapNonEmpty!52865 (= (arr!41226 _values!1445) (store mapRest!52865 mapKey!52865 mapValue!52865))))

(declare-fun b!1289424 () Bool)

(declare-fun res!856508 () Bool)

(assert (=> b!1289424 (=> (not res!856508) (not e!736207))))

(assert (=> b!1289424 (= res!856508 (and (= (size!41776 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41775 _keys!1741) (size!41776 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289425 () Bool)

(assert (=> b!1289425 (= e!736208 true)))

(declare-fun lt!578250 () ListLongMap!19719)

(declare-fun +!4347 (ListLongMap!19719 tuple2!22062) ListLongMap!19719)

(assert (=> b!1289425 (not (contains!7993 (+!4347 lt!578250 (tuple2!22063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578251 () Unit!42668)

(declare-fun addStillNotContains!365 (ListLongMap!19719 (_ BitVec 64) V!50707 (_ BitVec 64)) Unit!42668)

(assert (=> b!1289425 (= lt!578251 (addStillNotContains!365 lt!578250 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1289425 (not (contains!7993 (+!4347 lt!578250 (tuple2!22063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578252 () Unit!42668)

(assert (=> b!1289425 (= lt!578252 (addStillNotContains!365 lt!578250 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5978 (array!85448 array!85450 (_ BitVec 32) (_ BitVec 32) V!50707 V!50707 (_ BitVec 32) Int) ListLongMap!19719)

(assert (=> b!1289425 (= lt!578250 (getCurrentListMapNoExtraKeys!5978 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289426 () Bool)

(declare-fun res!856505 () Bool)

(assert (=> b!1289426 (=> (not res!856505) (not e!736207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85448 (_ BitVec 32)) Bool)

(assert (=> b!1289426 (= res!856505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289427 () Bool)

(assert (=> b!1289427 (= e!736203 (and e!736206 mapRes!52865))))

(declare-fun condMapEmpty!52865 () Bool)

(declare-fun mapDefault!52865 () ValueCell!16203)

(assert (=> b!1289427 (= condMapEmpty!52865 (= (arr!41226 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16203)) mapDefault!52865)))))

(declare-fun b!1289428 () Bool)

(declare-fun res!856509 () Bool)

(assert (=> b!1289428 (=> (not res!856509) (not e!736207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289428 (= res!856509 (not (validKeyInArray!0 (select (arr!41225 _keys!1741) from!2144))))))

(assert (= (and start!109074 res!856504) b!1289424))

(assert (= (and b!1289424 res!856508) b!1289426))

(assert (= (and b!1289426 res!856505) b!1289422))

(assert (= (and b!1289422 res!856506) b!1289419))

(assert (= (and b!1289419 res!856507) b!1289418))

(assert (= (and b!1289418 res!856503) b!1289423))

(assert (= (and b!1289423 res!856501) b!1289428))

(assert (= (and b!1289428 res!856509) b!1289417))

(assert (= (and b!1289417 (not res!856502)) b!1289425))

(assert (= (and b!1289427 condMapEmpty!52865) mapIsEmpty!52865))

(assert (= (and b!1289427 (not condMapEmpty!52865)) mapNonEmpty!52865))

(get-info :version)

(assert (= (and mapNonEmpty!52865 ((_ is ValueCellFull!16203) mapValue!52865)) b!1289420))

(assert (= (and b!1289427 ((_ is ValueCellFull!16203) mapDefault!52865)) b!1289421))

(assert (= start!109074 b!1289427))

(declare-fun m!1181935 () Bool)

(assert (=> start!109074 m!1181935))

(declare-fun m!1181937 () Bool)

(assert (=> start!109074 m!1181937))

(declare-fun m!1181939 () Bool)

(assert (=> start!109074 m!1181939))

(declare-fun m!1181941 () Bool)

(assert (=> b!1289418 m!1181941))

(assert (=> b!1289418 m!1181941))

(declare-fun m!1181943 () Bool)

(assert (=> b!1289418 m!1181943))

(declare-fun m!1181945 () Bool)

(assert (=> mapNonEmpty!52865 m!1181945))

(declare-fun m!1181947 () Bool)

(assert (=> b!1289425 m!1181947))

(declare-fun m!1181949 () Bool)

(assert (=> b!1289425 m!1181949))

(declare-fun m!1181951 () Bool)

(assert (=> b!1289425 m!1181951))

(declare-fun m!1181953 () Bool)

(assert (=> b!1289425 m!1181953))

(declare-fun m!1181955 () Bool)

(assert (=> b!1289425 m!1181955))

(declare-fun m!1181957 () Bool)

(assert (=> b!1289425 m!1181957))

(assert (=> b!1289425 m!1181949))

(assert (=> b!1289425 m!1181953))

(declare-fun m!1181959 () Bool)

(assert (=> b!1289425 m!1181959))

(declare-fun m!1181961 () Bool)

(assert (=> b!1289422 m!1181961))

(declare-fun m!1181963 () Bool)

(assert (=> b!1289417 m!1181963))

(declare-fun m!1181965 () Bool)

(assert (=> b!1289417 m!1181965))

(declare-fun m!1181967 () Bool)

(assert (=> b!1289428 m!1181967))

(assert (=> b!1289428 m!1181967))

(declare-fun m!1181969 () Bool)

(assert (=> b!1289428 m!1181969))

(declare-fun m!1181971 () Bool)

(assert (=> b!1289426 m!1181971))

(check-sat (not b!1289428) (not b_next!28563) (not mapNonEmpty!52865) (not b!1289425) (not b!1289426) (not start!109074) (not b!1289418) (not b!1289422) (not b!1289417) tp_is_empty!34203 b_and!46653)
(check-sat b_and!46653 (not b_next!28563))
