; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109246 () Bool)

(assert start!109246)

(declare-fun b_free!28735 () Bool)

(declare-fun b_next!28735 () Bool)

(assert (=> start!109246 (= b_free!28735 (not b_next!28735))))

(declare-fun tp!101325 () Bool)

(declare-fun b_and!46807 () Bool)

(assert (=> start!109246 (= tp!101325 b_and!46807)))

(declare-fun b!1292384 () Bool)

(declare-fun e!737659 () Bool)

(declare-fun tp_is_empty!34375 () Bool)

(assert (=> b!1292384 (= e!737659 tp_is_empty!34375)))

(declare-fun b!1292385 () Bool)

(declare-fun res!858731 () Bool)

(declare-fun e!737657 () Bool)

(assert (=> b!1292385 (=> (not res!858731) (not e!737657))))

(declare-datatypes ((array!85667 0))(
  ( (array!85668 (arr!41335 (Array (_ BitVec 32) (_ BitVec 64))) (size!41887 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85667)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85667 (_ BitVec 32)) Bool)

(assert (=> b!1292385 (= res!858731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292386 () Bool)

(declare-fun res!858733 () Bool)

(assert (=> b!1292386 (=> (not res!858733) (not e!737657))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292386 (= res!858733 (not (validKeyInArray!0 (select (arr!41335 _keys!1741) from!2144))))))

(declare-fun b!1292387 () Bool)

(declare-fun e!737658 () Bool)

(declare-fun mapRes!53123 () Bool)

(assert (=> b!1292387 (= e!737658 (and e!737659 mapRes!53123))))

(declare-fun condMapEmpty!53123 () Bool)

(declare-datatypes ((V!50937 0))(
  ( (V!50938 (val!17262 Int)) )
))
(declare-datatypes ((ValueCell!16289 0))(
  ( (ValueCellFull!16289 (v!19864 V!50937)) (EmptyCell!16289) )
))
(declare-datatypes ((array!85669 0))(
  ( (array!85670 (arr!41336 (Array (_ BitVec 32) ValueCell!16289)) (size!41888 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85669)

(declare-fun mapDefault!53123 () ValueCell!16289)

(assert (=> b!1292387 (= condMapEmpty!53123 (= (arr!41336 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16289)) mapDefault!53123)))))

(declare-fun b!1292388 () Bool)

(declare-fun res!858736 () Bool)

(assert (=> b!1292388 (=> (not res!858736) (not e!737657))))

(declare-datatypes ((List!29398 0))(
  ( (Nil!29395) (Cons!29394 (h!30603 (_ BitVec 64)) (t!42954 List!29398)) )
))
(declare-fun arrayNoDuplicates!0 (array!85667 (_ BitVec 32) List!29398) Bool)

(assert (=> b!1292388 (= res!858736 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29395))))

(declare-fun b!1292389 () Bool)

(assert (=> b!1292389 (= e!737657 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22248 0))(
  ( (tuple2!22249 (_1!11135 (_ BitVec 64)) (_2!11135 V!50937)) )
))
(declare-datatypes ((List!29399 0))(
  ( (Nil!29396) (Cons!29395 (h!30604 tuple2!22248) (t!42955 List!29399)) )
))
(declare-datatypes ((ListLongMap!19905 0))(
  ( (ListLongMap!19906 (toList!9968 List!29399)) )
))
(declare-fun contains!8016 (ListLongMap!19905 (_ BitVec 64)) Bool)

(assert (=> b!1292389 (not (contains!8016 (ListLongMap!19906 Nil!29396) k0!1205))))

(declare-datatypes ((Unit!42620 0))(
  ( (Unit!42621) )
))
(declare-fun lt!579160 () Unit!42620)

(declare-fun emptyContainsNothing!107 ((_ BitVec 64)) Unit!42620)

(assert (=> b!1292389 (= lt!579160 (emptyContainsNothing!107 k0!1205))))

(declare-fun b!1292390 () Bool)

(declare-fun res!858734 () Bool)

(assert (=> b!1292390 (=> (not res!858734) (not e!737657))))

(assert (=> b!1292390 (= res!858734 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41887 _keys!1741))))))

(declare-fun b!1292391 () Bool)

(declare-fun res!858738 () Bool)

(assert (=> b!1292391 (=> (not res!858738) (not e!737657))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292391 (= res!858738 (and (= (size!41888 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41887 _keys!1741) (size!41888 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292392 () Bool)

(declare-fun res!858735 () Bool)

(assert (=> b!1292392 (=> (not res!858735) (not e!737657))))

(assert (=> b!1292392 (= res!858735 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41887 _keys!1741))))))

(declare-fun b!1292393 () Bool)

(declare-fun e!737661 () Bool)

(assert (=> b!1292393 (= e!737661 tp_is_empty!34375)))

(declare-fun b!1292394 () Bool)

(declare-fun res!858732 () Bool)

(assert (=> b!1292394 (=> (not res!858732) (not e!737657))))

(declare-fun minValue!1387 () V!50937)

(declare-fun zeroValue!1387 () V!50937)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4910 (array!85667 array!85669 (_ BitVec 32) (_ BitVec 32) V!50937 V!50937 (_ BitVec 32) Int) ListLongMap!19905)

(assert (=> b!1292394 (= res!858732 (contains!8016 (getCurrentListMap!4910 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53123 () Bool)

(assert (=> mapIsEmpty!53123 mapRes!53123))

(declare-fun mapNonEmpty!53123 () Bool)

(declare-fun tp!101324 () Bool)

(assert (=> mapNonEmpty!53123 (= mapRes!53123 (and tp!101324 e!737661))))

(declare-fun mapRest!53123 () (Array (_ BitVec 32) ValueCell!16289))

(declare-fun mapValue!53123 () ValueCell!16289)

(declare-fun mapKey!53123 () (_ BitVec 32))

(assert (=> mapNonEmpty!53123 (= (arr!41336 _values!1445) (store mapRest!53123 mapKey!53123 mapValue!53123))))

(declare-fun res!858737 () Bool)

(assert (=> start!109246 (=> (not res!858737) (not e!737657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109246 (= res!858737 (validMask!0 mask!2175))))

(assert (=> start!109246 e!737657))

(assert (=> start!109246 tp_is_empty!34375))

(assert (=> start!109246 true))

(declare-fun array_inv!31477 (array!85669) Bool)

(assert (=> start!109246 (and (array_inv!31477 _values!1445) e!737658)))

(declare-fun array_inv!31478 (array!85667) Bool)

(assert (=> start!109246 (array_inv!31478 _keys!1741)))

(assert (=> start!109246 tp!101325))

(assert (= (and start!109246 res!858737) b!1292391))

(assert (= (and b!1292391 res!858738) b!1292385))

(assert (= (and b!1292385 res!858731) b!1292388))

(assert (= (and b!1292388 res!858736) b!1292392))

(assert (= (and b!1292392 res!858735) b!1292394))

(assert (= (and b!1292394 res!858732) b!1292390))

(assert (= (and b!1292390 res!858734) b!1292386))

(assert (= (and b!1292386 res!858733) b!1292389))

(assert (= (and b!1292387 condMapEmpty!53123) mapIsEmpty!53123))

(assert (= (and b!1292387 (not condMapEmpty!53123)) mapNonEmpty!53123))

(get-info :version)

(assert (= (and mapNonEmpty!53123 ((_ is ValueCellFull!16289) mapValue!53123)) b!1292393))

(assert (= (and b!1292387 ((_ is ValueCellFull!16289) mapDefault!53123)) b!1292384))

(assert (= start!109246 b!1292387))

(declare-fun m!1184499 () Bool)

(assert (=> b!1292389 m!1184499))

(declare-fun m!1184501 () Bool)

(assert (=> b!1292389 m!1184501))

(declare-fun m!1184503 () Bool)

(assert (=> b!1292394 m!1184503))

(assert (=> b!1292394 m!1184503))

(declare-fun m!1184505 () Bool)

(assert (=> b!1292394 m!1184505))

(declare-fun m!1184507 () Bool)

(assert (=> b!1292388 m!1184507))

(declare-fun m!1184509 () Bool)

(assert (=> start!109246 m!1184509))

(declare-fun m!1184511 () Bool)

(assert (=> start!109246 m!1184511))

(declare-fun m!1184513 () Bool)

(assert (=> start!109246 m!1184513))

(declare-fun m!1184515 () Bool)

(assert (=> b!1292386 m!1184515))

(assert (=> b!1292386 m!1184515))

(declare-fun m!1184517 () Bool)

(assert (=> b!1292386 m!1184517))

(declare-fun m!1184519 () Bool)

(assert (=> b!1292385 m!1184519))

(declare-fun m!1184521 () Bool)

(assert (=> mapNonEmpty!53123 m!1184521))

(check-sat (not b_next!28735) tp_is_empty!34375 (not b!1292388) (not b!1292386) (not b!1292389) (not b!1292394) b_and!46807 (not b!1292385) (not mapNonEmpty!53123) (not start!109246))
(check-sat b_and!46807 (not b_next!28735))
