; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109420 () Bool)

(assert start!109420)

(declare-fun b_free!28909 () Bool)

(declare-fun b_next!28909 () Bool)

(assert (=> start!109420 (= b_free!28909 (not b_next!28909))))

(declare-fun tp!101846 () Bool)

(declare-fun b_and!46981 () Bool)

(assert (=> start!109420 (= tp!101846 b_and!46981)))

(declare-fun mapNonEmpty!53384 () Bool)

(declare-fun mapRes!53384 () Bool)

(declare-fun tp!101847 () Bool)

(declare-fun e!739128 () Bool)

(assert (=> mapNonEmpty!53384 (= mapRes!53384 (and tp!101847 e!739128))))

(declare-datatypes ((V!51169 0))(
  ( (V!51170 (val!17349 Int)) )
))
(declare-datatypes ((ValueCell!16376 0))(
  ( (ValueCellFull!16376 (v!19951 V!51169)) (EmptyCell!16376) )
))
(declare-fun mapValue!53384 () ValueCell!16376)

(declare-fun mapRest!53384 () (Array (_ BitVec 32) ValueCell!16376))

(declare-fun mapKey!53384 () (_ BitVec 32))

(declare-datatypes ((array!86011 0))(
  ( (array!86012 (arr!41507 (Array (_ BitVec 32) ValueCell!16376)) (size!42059 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86011)

(assert (=> mapNonEmpty!53384 (= (arr!41507 _values!1445) (store mapRest!53384 mapKey!53384 mapValue!53384))))

(declare-fun b!1295419 () Bool)

(declare-fun e!739129 () Bool)

(declare-fun e!739130 () Bool)

(assert (=> b!1295419 (= e!739129 (not e!739130))))

(declare-fun res!860991 () Bool)

(assert (=> b!1295419 (=> res!860991 e!739130)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295419 (= res!860991 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22392 0))(
  ( (tuple2!22393 (_1!11207 (_ BitVec 64)) (_2!11207 V!51169)) )
))
(declare-datatypes ((List!29525 0))(
  ( (Nil!29522) (Cons!29521 (h!30730 tuple2!22392) (t!43081 List!29525)) )
))
(declare-datatypes ((ListLongMap!20049 0))(
  ( (ListLongMap!20050 (toList!10040 List!29525)) )
))
(declare-fun contains!8088 (ListLongMap!20049 (_ BitVec 64)) Bool)

(assert (=> b!1295419 (not (contains!8088 (ListLongMap!20050 Nil!29522) k0!1205))))

(declare-datatypes ((Unit!42750 0))(
  ( (Unit!42751) )
))
(declare-fun lt!579733 () Unit!42750)

(declare-fun emptyContainsNothing!168 ((_ BitVec 64)) Unit!42750)

(assert (=> b!1295419 (= lt!579733 (emptyContainsNothing!168 k0!1205))))

(declare-fun b!1295420 () Bool)

(declare-fun res!860984 () Bool)

(assert (=> b!1295420 (=> (not res!860984) (not e!739129))))

(declare-datatypes ((array!86013 0))(
  ( (array!86014 (arr!41508 (Array (_ BitVec 32) (_ BitVec 64))) (size!42060 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86013)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295420 (= res!860984 (not (validKeyInArray!0 (select (arr!41508 _keys!1741) from!2144))))))

(declare-fun b!1295421 () Bool)

(declare-fun res!860983 () Bool)

(assert (=> b!1295421 (=> (not res!860983) (not e!739129))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1295421 (= res!860983 (and (= (size!42059 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42060 _keys!1741) (size!42059 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295422 () Bool)

(assert (=> b!1295422 (= e!739130 true)))

(declare-fun lt!579732 () ListLongMap!20049)

(declare-fun minValue!1387 () V!51169)

(declare-fun +!4454 (ListLongMap!20049 tuple2!22392) ListLongMap!20049)

(assert (=> b!1295422 (not (contains!8088 (+!4454 lt!579732 (tuple2!22393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579731 () Unit!42750)

(declare-fun addStillNotContains!431 (ListLongMap!20049 (_ BitVec 64) V!51169 (_ BitVec 64)) Unit!42750)

(assert (=> b!1295422 (= lt!579731 (addStillNotContains!431 lt!579732 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51169)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6088 (array!86013 array!86011 (_ BitVec 32) (_ BitVec 32) V!51169 V!51169 (_ BitVec 32) Int) ListLongMap!20049)

(assert (=> b!1295422 (= lt!579732 (getCurrentListMapNoExtraKeys!6088 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53384 () Bool)

(assert (=> mapIsEmpty!53384 mapRes!53384))

(declare-fun b!1295423 () Bool)

(declare-fun res!860987 () Bool)

(assert (=> b!1295423 (=> (not res!860987) (not e!739129))))

(declare-datatypes ((List!29526 0))(
  ( (Nil!29523) (Cons!29522 (h!30731 (_ BitVec 64)) (t!43082 List!29526)) )
))
(declare-fun arrayNoDuplicates!0 (array!86013 (_ BitVec 32) List!29526) Bool)

(assert (=> b!1295423 (= res!860987 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29523))))

(declare-fun b!1295424 () Bool)

(declare-fun res!860988 () Bool)

(assert (=> b!1295424 (=> (not res!860988) (not e!739129))))

(assert (=> b!1295424 (= res!860988 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42060 _keys!1741))))))

(declare-fun b!1295425 () Bool)

(declare-fun res!860990 () Bool)

(assert (=> b!1295425 (=> (not res!860990) (not e!739129))))

(assert (=> b!1295425 (= res!860990 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42060 _keys!1741))))))

(declare-fun b!1295426 () Bool)

(declare-fun res!860989 () Bool)

(assert (=> b!1295426 (=> (not res!860989) (not e!739129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86013 (_ BitVec 32)) Bool)

(assert (=> b!1295426 (= res!860989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!860986 () Bool)

(assert (=> start!109420 (=> (not res!860986) (not e!739129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109420 (= res!860986 (validMask!0 mask!2175))))

(assert (=> start!109420 e!739129))

(declare-fun tp_is_empty!34549 () Bool)

(assert (=> start!109420 tp_is_empty!34549))

(assert (=> start!109420 true))

(declare-fun e!739127 () Bool)

(declare-fun array_inv!31591 (array!86011) Bool)

(assert (=> start!109420 (and (array_inv!31591 _values!1445) e!739127)))

(declare-fun array_inv!31592 (array!86013) Bool)

(assert (=> start!109420 (array_inv!31592 _keys!1741)))

(assert (=> start!109420 tp!101846))

(declare-fun b!1295427 () Bool)

(declare-fun res!860985 () Bool)

(assert (=> b!1295427 (=> (not res!860985) (not e!739129))))

(declare-fun getCurrentListMap!4965 (array!86013 array!86011 (_ BitVec 32) (_ BitVec 32) V!51169 V!51169 (_ BitVec 32) Int) ListLongMap!20049)

(assert (=> b!1295427 (= res!860985 (contains!8088 (getCurrentListMap!4965 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295428 () Bool)

(declare-fun e!739131 () Bool)

(assert (=> b!1295428 (= e!739127 (and e!739131 mapRes!53384))))

(declare-fun condMapEmpty!53384 () Bool)

(declare-fun mapDefault!53384 () ValueCell!16376)

(assert (=> b!1295428 (= condMapEmpty!53384 (= (arr!41507 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16376)) mapDefault!53384)))))

(declare-fun b!1295429 () Bool)

(assert (=> b!1295429 (= e!739131 tp_is_empty!34549)))

(declare-fun b!1295430 () Bool)

(assert (=> b!1295430 (= e!739128 tp_is_empty!34549)))

(assert (= (and start!109420 res!860986) b!1295421))

(assert (= (and b!1295421 res!860983) b!1295426))

(assert (= (and b!1295426 res!860989) b!1295423))

(assert (= (and b!1295423 res!860987) b!1295425))

(assert (= (and b!1295425 res!860990) b!1295427))

(assert (= (and b!1295427 res!860985) b!1295424))

(assert (= (and b!1295424 res!860988) b!1295420))

(assert (= (and b!1295420 res!860984) b!1295419))

(assert (= (and b!1295419 (not res!860991)) b!1295422))

(assert (= (and b!1295428 condMapEmpty!53384) mapIsEmpty!53384))

(assert (= (and b!1295428 (not condMapEmpty!53384)) mapNonEmpty!53384))

(get-info :version)

(assert (= (and mapNonEmpty!53384 ((_ is ValueCellFull!16376) mapValue!53384)) b!1295430))

(assert (= (and b!1295428 ((_ is ValueCellFull!16376) mapDefault!53384)) b!1295429))

(assert (= start!109420 b!1295428))

(declare-fun m!1186995 () Bool)

(assert (=> start!109420 m!1186995))

(declare-fun m!1186997 () Bool)

(assert (=> start!109420 m!1186997))

(declare-fun m!1186999 () Bool)

(assert (=> start!109420 m!1186999))

(declare-fun m!1187001 () Bool)

(assert (=> b!1295419 m!1187001))

(declare-fun m!1187003 () Bool)

(assert (=> b!1295419 m!1187003))

(declare-fun m!1187005 () Bool)

(assert (=> b!1295427 m!1187005))

(assert (=> b!1295427 m!1187005))

(declare-fun m!1187007 () Bool)

(assert (=> b!1295427 m!1187007))

(declare-fun m!1187009 () Bool)

(assert (=> mapNonEmpty!53384 m!1187009))

(declare-fun m!1187011 () Bool)

(assert (=> b!1295420 m!1187011))

(assert (=> b!1295420 m!1187011))

(declare-fun m!1187013 () Bool)

(assert (=> b!1295420 m!1187013))

(declare-fun m!1187015 () Bool)

(assert (=> b!1295426 m!1187015))

(declare-fun m!1187017 () Bool)

(assert (=> b!1295423 m!1187017))

(declare-fun m!1187019 () Bool)

(assert (=> b!1295422 m!1187019))

(assert (=> b!1295422 m!1187019))

(declare-fun m!1187021 () Bool)

(assert (=> b!1295422 m!1187021))

(declare-fun m!1187023 () Bool)

(assert (=> b!1295422 m!1187023))

(declare-fun m!1187025 () Bool)

(assert (=> b!1295422 m!1187025))

(check-sat (not mapNonEmpty!53384) (not b!1295427) b_and!46981 (not start!109420) (not b!1295426) (not b_next!28909) tp_is_empty!34549 (not b!1295420) (not b!1295419) (not b!1295422) (not b!1295423))
(check-sat b_and!46981 (not b_next!28909))
