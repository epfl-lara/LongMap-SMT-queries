; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108688 () Bool)

(assert start!108688)

(declare-fun b_free!28201 () Bool)

(declare-fun b_next!28201 () Bool)

(assert (=> start!108688 (= b_free!28201 (not b_next!28201))))

(declare-fun tp!99719 () Bool)

(declare-fun b_and!46249 () Bool)

(assert (=> start!108688 (= tp!99719 b_and!46249)))

(declare-fun b!1282992 () Bool)

(declare-fun e!733040 () Bool)

(declare-fun e!733039 () Bool)

(declare-fun mapRes!52319 () Bool)

(assert (=> b!1282992 (= e!733040 (and e!733039 mapRes!52319))))

(declare-fun condMapEmpty!52319 () Bool)

(declare-datatypes ((V!50225 0))(
  ( (V!50226 (val!16995 Int)) )
))
(declare-datatypes ((ValueCell!16022 0))(
  ( (ValueCellFull!16022 (v!19596 V!50225)) (EmptyCell!16022) )
))
(declare-datatypes ((array!84643 0))(
  ( (array!84644 (arr!40824 (Array (_ BitVec 32) ValueCell!16022)) (size!41376 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84643)

(declare-fun mapDefault!52319 () ValueCell!16022)

(assert (=> b!1282992 (= condMapEmpty!52319 (= (arr!40824 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16022)) mapDefault!52319)))))

(declare-fun mapNonEmpty!52319 () Bool)

(declare-fun tp!99720 () Bool)

(declare-fun e!733041 () Bool)

(assert (=> mapNonEmpty!52319 (= mapRes!52319 (and tp!99720 e!733041))))

(declare-fun mapValue!52319 () ValueCell!16022)

(declare-fun mapRest!52319 () (Array (_ BitVec 32) ValueCell!16022))

(declare-fun mapKey!52319 () (_ BitVec 32))

(assert (=> mapNonEmpty!52319 (= (arr!40824 _values!1445) (store mapRest!52319 mapKey!52319 mapValue!52319))))

(declare-fun mapIsEmpty!52319 () Bool)

(assert (=> mapIsEmpty!52319 mapRes!52319))

(declare-fun b!1282993 () Bool)

(declare-fun res!852235 () Bool)

(declare-fun e!733037 () Bool)

(assert (=> b!1282993 (=> (not res!852235) (not e!733037))))

(declare-datatypes ((array!84645 0))(
  ( (array!84646 (arr!40825 (Array (_ BitVec 32) (_ BitVec 64))) (size!41377 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84645)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84645 (_ BitVec 32)) Bool)

(assert (=> b!1282993 (= res!852235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!852238 () Bool)

(assert (=> start!108688 (=> (not res!852238) (not e!733037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108688 (= res!852238 (validMask!0 mask!2175))))

(assert (=> start!108688 e!733037))

(declare-fun tp_is_empty!33841 () Bool)

(assert (=> start!108688 tp_is_empty!33841))

(assert (=> start!108688 true))

(declare-fun array_inv!31123 (array!84643) Bool)

(assert (=> start!108688 (and (array_inv!31123 _values!1445) e!733040)))

(declare-fun array_inv!31124 (array!84645) Bool)

(assert (=> start!108688 (array_inv!31124 _keys!1741)))

(assert (=> start!108688 tp!99719))

(declare-fun b!1282994 () Bool)

(declare-fun res!852239 () Bool)

(assert (=> b!1282994 (=> (not res!852239) (not e!733037))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282994 (= res!852239 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1282995 () Bool)

(assert (=> b!1282995 (= e!733041 tp_is_empty!33841)))

(declare-fun b!1282996 () Bool)

(declare-fun res!852237 () Bool)

(assert (=> b!1282996 (=> (not res!852237) (not e!733037))))

(assert (=> b!1282996 (= res!852237 (and (= (size!41376 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41377 _keys!1741) (size!41376 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282997 () Bool)

(declare-fun res!852240 () Bool)

(assert (=> b!1282997 (=> (not res!852240) (not e!733037))))

(declare-datatypes ((List!29016 0))(
  ( (Nil!29013) (Cons!29012 (h!30221 (_ BitVec 64)) (t!42552 List!29016)) )
))
(declare-fun arrayNoDuplicates!0 (array!84645 (_ BitVec 32) List!29016) Bool)

(assert (=> b!1282997 (= res!852240 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29013))))

(declare-fun b!1282998 () Bool)

(declare-fun res!852232 () Bool)

(assert (=> b!1282998 (=> (not res!852232) (not e!733037))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282998 (= res!852232 (validKeyInArray!0 (select (arr!40825 _keys!1741) from!2144)))))

(declare-fun b!1282999 () Bool)

(declare-fun res!852236 () Bool)

(assert (=> b!1282999 (=> (not res!852236) (not e!733037))))

(declare-fun minValue!1387 () V!50225)

(declare-fun zeroValue!1387 () V!50225)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21828 0))(
  ( (tuple2!21829 (_1!10925 (_ BitVec 64)) (_2!10925 V!50225)) )
))
(declare-datatypes ((List!29017 0))(
  ( (Nil!29014) (Cons!29013 (h!30222 tuple2!21828) (t!42553 List!29017)) )
))
(declare-datatypes ((ListLongMap!19485 0))(
  ( (ListLongMap!19486 (toList!9758 List!29017)) )
))
(declare-fun contains!7805 (ListLongMap!19485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4732 (array!84645 array!84643 (_ BitVec 32) (_ BitVec 32) V!50225 V!50225 (_ BitVec 32) Int) ListLongMap!19485)

(assert (=> b!1282999 (= res!852236 (contains!7805 (getCurrentListMap!4732 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283000 () Bool)

(declare-fun res!852234 () Bool)

(assert (=> b!1283000 (=> (not res!852234) (not e!733037))))

(assert (=> b!1283000 (= res!852234 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41377 _keys!1741))))))

(declare-fun b!1283001 () Bool)

(assert (=> b!1283001 (= e!733037 (not true))))

(declare-fun lt!576414 () ListLongMap!19485)

(assert (=> b!1283001 (contains!7805 lt!576414 k0!1205)))

(declare-datatypes ((Unit!42301 0))(
  ( (Unit!42302) )
))
(declare-fun lt!576413 () Unit!42301)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!1 ((_ BitVec 64) (_ BitVec 64) V!50225 ListLongMap!19485) Unit!42301)

(assert (=> b!1283001 (= lt!576413 (lemmaInListMapAfterAddingDiffThenInBefore!1 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576414))))

(declare-fun +!4316 (ListLongMap!19485 tuple2!21828) ListLongMap!19485)

(declare-fun getCurrentListMapNoExtraKeys!5947 (array!84645 array!84643 (_ BitVec 32) (_ BitVec 32) V!50225 V!50225 (_ BitVec 32) Int) ListLongMap!19485)

(assert (=> b!1283001 (= lt!576414 (+!4316 (getCurrentListMapNoExtraKeys!5947 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283002 () Bool)

(declare-fun res!852233 () Bool)

(assert (=> b!1283002 (=> (not res!852233) (not e!733037))))

(assert (=> b!1283002 (= res!852233 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41377 _keys!1741))))))

(declare-fun b!1283003 () Bool)

(assert (=> b!1283003 (= e!733039 tp_is_empty!33841)))

(assert (= (and start!108688 res!852238) b!1282996))

(assert (= (and b!1282996 res!852237) b!1282993))

(assert (= (and b!1282993 res!852235) b!1282997))

(assert (= (and b!1282997 res!852240) b!1283002))

(assert (= (and b!1283002 res!852233) b!1282999))

(assert (= (and b!1282999 res!852236) b!1283000))

(assert (= (and b!1283000 res!852234) b!1282998))

(assert (= (and b!1282998 res!852232) b!1282994))

(assert (= (and b!1282994 res!852239) b!1283001))

(assert (= (and b!1282992 condMapEmpty!52319) mapIsEmpty!52319))

(assert (= (and b!1282992 (not condMapEmpty!52319)) mapNonEmpty!52319))

(get-info :version)

(assert (= (and mapNonEmpty!52319 ((_ is ValueCellFull!16022) mapValue!52319)) b!1282995))

(assert (= (and b!1282992 ((_ is ValueCellFull!16022) mapDefault!52319)) b!1283003))

(assert (= start!108688 b!1282992))

(declare-fun m!1176565 () Bool)

(assert (=> b!1283001 m!1176565))

(declare-fun m!1176567 () Bool)

(assert (=> b!1283001 m!1176567))

(declare-fun m!1176569 () Bool)

(assert (=> b!1283001 m!1176569))

(assert (=> b!1283001 m!1176569))

(declare-fun m!1176571 () Bool)

(assert (=> b!1283001 m!1176571))

(declare-fun m!1176573 () Bool)

(assert (=> b!1282998 m!1176573))

(assert (=> b!1282998 m!1176573))

(declare-fun m!1176575 () Bool)

(assert (=> b!1282998 m!1176575))

(declare-fun m!1176577 () Bool)

(assert (=> b!1282999 m!1176577))

(assert (=> b!1282999 m!1176577))

(declare-fun m!1176579 () Bool)

(assert (=> b!1282999 m!1176579))

(declare-fun m!1176581 () Bool)

(assert (=> mapNonEmpty!52319 m!1176581))

(declare-fun m!1176583 () Bool)

(assert (=> b!1282993 m!1176583))

(declare-fun m!1176585 () Bool)

(assert (=> b!1282997 m!1176585))

(declare-fun m!1176587 () Bool)

(assert (=> start!108688 m!1176587))

(declare-fun m!1176589 () Bool)

(assert (=> start!108688 m!1176589))

(declare-fun m!1176591 () Bool)

(assert (=> start!108688 m!1176591))

(check-sat (not b!1282997) (not b_next!28201) b_and!46249 (not start!108688) (not b!1282993) tp_is_empty!33841 (not b!1282999) (not mapNonEmpty!52319) (not b!1283001) (not b!1282998))
(check-sat b_and!46249 (not b_next!28201))
