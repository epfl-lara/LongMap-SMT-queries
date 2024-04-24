; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109542 () Bool)

(assert start!109542)

(declare-fun b_free!28807 () Bool)

(declare-fun b_next!28807 () Bool)

(assert (=> start!109542 (= b_free!28807 (not b_next!28807))))

(declare-fun tp!101539 () Bool)

(declare-fun b_and!46899 () Bool)

(assert (=> start!109542 (= tp!101539 b_and!46899)))

(declare-fun b!1295033 () Bool)

(declare-fun res!860235 () Bool)

(declare-fun e!739170 () Bool)

(assert (=> b!1295033 (=> (not res!860235) (not e!739170))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85951 0))(
  ( (array!85952 (arr!41472 (Array (_ BitVec 32) (_ BitVec 64))) (size!42023 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85951)

(assert (=> b!1295033 (= res!860235 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42023 _keys!1741))))))

(declare-fun mapIsEmpty!53231 () Bool)

(declare-fun mapRes!53231 () Bool)

(assert (=> mapIsEmpty!53231 mapRes!53231))

(declare-fun b!1295034 () Bool)

(declare-fun res!860236 () Bool)

(assert (=> b!1295034 (=> (not res!860236) (not e!739170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295034 (= res!860236 (not (validKeyInArray!0 (select (arr!41472 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53231 () Bool)

(declare-fun tp!101540 () Bool)

(declare-fun e!739168 () Bool)

(assert (=> mapNonEmpty!53231 (= mapRes!53231 (and tp!101540 e!739168))))

(declare-datatypes ((V!51033 0))(
  ( (V!51034 (val!17298 Int)) )
))
(declare-datatypes ((ValueCell!16325 0))(
  ( (ValueCellFull!16325 (v!19896 V!51033)) (EmptyCell!16325) )
))
(declare-fun mapRest!53231 () (Array (_ BitVec 32) ValueCell!16325))

(declare-datatypes ((array!85953 0))(
  ( (array!85954 (arr!41473 (Array (_ BitVec 32) ValueCell!16325)) (size!42024 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85953)

(declare-fun mapKey!53231 () (_ BitVec 32))

(declare-fun mapValue!53231 () ValueCell!16325)

(assert (=> mapNonEmpty!53231 (= (arr!41473 _values!1445) (store mapRest!53231 mapKey!53231 mapValue!53231))))

(declare-fun b!1295035 () Bool)

(declare-fun res!860238 () Bool)

(assert (=> b!1295035 (=> (not res!860238) (not e!739170))))

(declare-datatypes ((List!29436 0))(
  ( (Nil!29433) (Cons!29432 (h!30650 (_ BitVec 64)) (t!42992 List!29436)) )
))
(declare-fun arrayNoDuplicates!0 (array!85951 (_ BitVec 32) List!29436) Bool)

(assert (=> b!1295035 (= res!860238 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29433))))

(declare-fun b!1295036 () Bool)

(declare-fun e!739165 () Bool)

(declare-fun e!739167 () Bool)

(assert (=> b!1295036 (= e!739165 (and e!739167 mapRes!53231))))

(declare-fun condMapEmpty!53231 () Bool)

(declare-fun mapDefault!53231 () ValueCell!16325)

(assert (=> b!1295036 (= condMapEmpty!53231 (= (arr!41473 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16325)) mapDefault!53231)))))

(declare-fun b!1295037 () Bool)

(declare-fun tp_is_empty!34447 () Bool)

(assert (=> b!1295037 (= e!739167 tp_is_empty!34447)))

(declare-fun b!1295038 () Bool)

(declare-fun res!860237 () Bool)

(assert (=> b!1295038 (=> (not res!860237) (not e!739170))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295038 (= res!860237 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42023 _keys!1741))))))

(declare-fun b!1295040 () Bool)

(declare-fun res!860242 () Bool)

(assert (=> b!1295040 (=> (not res!860242) (not e!739170))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85951 (_ BitVec 32)) Bool)

(assert (=> b!1295040 (= res!860242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295039 () Bool)

(assert (=> b!1295039 (= e!739168 tp_is_empty!34447)))

(declare-fun res!860241 () Bool)

(assert (=> start!109542 (=> (not res!860241) (not e!739170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109542 (= res!860241 (validMask!0 mask!2175))))

(assert (=> start!109542 e!739170))

(assert (=> start!109542 tp_is_empty!34447))

(assert (=> start!109542 true))

(declare-fun array_inv!31643 (array!85953) Bool)

(assert (=> start!109542 (and (array_inv!31643 _values!1445) e!739165)))

(declare-fun array_inv!31644 (array!85951) Bool)

(assert (=> start!109542 (array_inv!31644 _keys!1741)))

(assert (=> start!109542 tp!101539))

(declare-fun b!1295041 () Bool)

(declare-fun e!739169 () Bool)

(assert (=> b!1295041 (= e!739170 (not e!739169))))

(declare-fun res!860240 () Bool)

(assert (=> b!1295041 (=> res!860240 e!739169)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295041 (= res!860240 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22268 0))(
  ( (tuple2!22269 (_1!11145 (_ BitVec 64)) (_2!11145 V!51033)) )
))
(declare-datatypes ((List!29437 0))(
  ( (Nil!29434) (Cons!29433 (h!30651 tuple2!22268) (t!42993 List!29437)) )
))
(declare-datatypes ((ListLongMap!19933 0))(
  ( (ListLongMap!19934 (toList!9982 List!29437)) )
))
(declare-fun contains!8113 (ListLongMap!19933 (_ BitVec 64)) Bool)

(assert (=> b!1295041 (not (contains!8113 (ListLongMap!19934 Nil!29434) k0!1205))))

(declare-datatypes ((Unit!42801 0))(
  ( (Unit!42802) )
))
(declare-fun lt!580105 () Unit!42801)

(declare-fun emptyContainsNothing!143 ((_ BitVec 64)) Unit!42801)

(assert (=> b!1295041 (= lt!580105 (emptyContainsNothing!143 k0!1205))))

(declare-fun b!1295042 () Bool)

(assert (=> b!1295042 (= e!739169 true)))

(declare-fun lt!580106 () ListLongMap!19933)

(declare-fun zeroValue!1387 () V!51033)

(declare-fun +!4451 (ListLongMap!19933 tuple2!22268) ListLongMap!19933)

(assert (=> b!1295042 (not (contains!8113 (+!4451 lt!580106 (tuple2!22269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!580107 () Unit!42801)

(declare-fun addStillNotContains!427 (ListLongMap!19933 (_ BitVec 64) V!51033 (_ BitVec 64)) Unit!42801)

(assert (=> b!1295042 (= lt!580107 (addStillNotContains!427 lt!580106 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51033)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6091 (array!85951 array!85953 (_ BitVec 32) (_ BitVec 32) V!51033 V!51033 (_ BitVec 32) Int) ListLongMap!19933)

(assert (=> b!1295042 (= lt!580106 (getCurrentListMapNoExtraKeys!6091 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295043 () Bool)

(declare-fun res!860239 () Bool)

(assert (=> b!1295043 (=> (not res!860239) (not e!739170))))

(assert (=> b!1295043 (= res!860239 (and (= (size!42024 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42023 _keys!1741) (size!42024 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295044 () Bool)

(declare-fun res!860234 () Bool)

(assert (=> b!1295044 (=> (not res!860234) (not e!739170))))

(declare-fun getCurrentListMap!5011 (array!85951 array!85953 (_ BitVec 32) (_ BitVec 32) V!51033 V!51033 (_ BitVec 32) Int) ListLongMap!19933)

(assert (=> b!1295044 (= res!860234 (contains!8113 (getCurrentListMap!5011 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109542 res!860241) b!1295043))

(assert (= (and b!1295043 res!860239) b!1295040))

(assert (= (and b!1295040 res!860242) b!1295035))

(assert (= (and b!1295035 res!860238) b!1295033))

(assert (= (and b!1295033 res!860235) b!1295044))

(assert (= (and b!1295044 res!860234) b!1295038))

(assert (= (and b!1295038 res!860237) b!1295034))

(assert (= (and b!1295034 res!860236) b!1295041))

(assert (= (and b!1295041 (not res!860240)) b!1295042))

(assert (= (and b!1295036 condMapEmpty!53231) mapIsEmpty!53231))

(assert (= (and b!1295036 (not condMapEmpty!53231)) mapNonEmpty!53231))

(get-info :version)

(assert (= (and mapNonEmpty!53231 ((_ is ValueCellFull!16325) mapValue!53231)) b!1295039))

(assert (= (and b!1295036 ((_ is ValueCellFull!16325) mapDefault!53231)) b!1295037))

(assert (= start!109542 b!1295036))

(declare-fun m!1187709 () Bool)

(assert (=> start!109542 m!1187709))

(declare-fun m!1187711 () Bool)

(assert (=> start!109542 m!1187711))

(declare-fun m!1187713 () Bool)

(assert (=> start!109542 m!1187713))

(declare-fun m!1187715 () Bool)

(assert (=> b!1295042 m!1187715))

(assert (=> b!1295042 m!1187715))

(declare-fun m!1187717 () Bool)

(assert (=> b!1295042 m!1187717))

(declare-fun m!1187719 () Bool)

(assert (=> b!1295042 m!1187719))

(declare-fun m!1187721 () Bool)

(assert (=> b!1295042 m!1187721))

(declare-fun m!1187723 () Bool)

(assert (=> mapNonEmpty!53231 m!1187723))

(declare-fun m!1187725 () Bool)

(assert (=> b!1295035 m!1187725))

(declare-fun m!1187727 () Bool)

(assert (=> b!1295040 m!1187727))

(declare-fun m!1187729 () Bool)

(assert (=> b!1295044 m!1187729))

(assert (=> b!1295044 m!1187729))

(declare-fun m!1187731 () Bool)

(assert (=> b!1295044 m!1187731))

(declare-fun m!1187733 () Bool)

(assert (=> b!1295041 m!1187733))

(declare-fun m!1187735 () Bool)

(assert (=> b!1295041 m!1187735))

(declare-fun m!1187737 () Bool)

(assert (=> b!1295034 m!1187737))

(assert (=> b!1295034 m!1187737))

(declare-fun m!1187739 () Bool)

(assert (=> b!1295034 m!1187739))

(check-sat (not b!1295041) (not b!1295035) (not b_next!28807) (not b!1295042) b_and!46899 tp_is_empty!34447 (not b!1295044) (not b!1295034) (not start!109542) (not mapNonEmpty!53231) (not b!1295040))
(check-sat b_and!46899 (not b_next!28807))
