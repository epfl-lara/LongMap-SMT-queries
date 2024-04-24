; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109260 () Bool)

(assert start!109260)

(declare-fun b_free!28525 () Bool)

(declare-fun b_next!28525 () Bool)

(assert (=> start!109260 (= b_free!28525 (not b_next!28525))))

(declare-fun tp!100694 () Bool)

(declare-fun b_and!46617 () Bool)

(assert (=> start!109260 (= tp!100694 b_and!46617)))

(declare-fun b!1290038 () Bool)

(declare-fun res!856516 () Bool)

(declare-fun e!736710 () Bool)

(assert (=> b!1290038 (=> (not res!856516) (not e!736710))))

(declare-datatypes ((V!50657 0))(
  ( (V!50658 (val!17157 Int)) )
))
(declare-fun minValue!1387 () V!50657)

(declare-fun zeroValue!1387 () V!50657)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16184 0))(
  ( (ValueCellFull!16184 (v!19755 V!50657)) (EmptyCell!16184) )
))
(declare-datatypes ((array!85411 0))(
  ( (array!85412 (arr!41202 (Array (_ BitVec 32) ValueCell!16184)) (size!41753 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85411)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85413 0))(
  ( (array!85414 (arr!41203 (Array (_ BitVec 32) (_ BitVec 64))) (size!41754 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85413)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22044 0))(
  ( (tuple2!22045 (_1!11033 (_ BitVec 64)) (_2!11033 V!50657)) )
))
(declare-datatypes ((List!29228 0))(
  ( (Nil!29225) (Cons!29224 (h!30442 tuple2!22044) (t!42784 List!29228)) )
))
(declare-datatypes ((ListLongMap!19709 0))(
  ( (ListLongMap!19710 (toList!9870 List!29228)) )
))
(declare-fun contains!8001 (ListLongMap!19709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4917 (array!85413 array!85411 (_ BitVec 32) (_ BitVec 32) V!50657 V!50657 (_ BitVec 32) Int) ListLongMap!19709)

(assert (=> b!1290038 (= res!856516 (contains!8001 (getCurrentListMap!4917 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290039 () Bool)

(declare-fun res!856512 () Bool)

(assert (=> b!1290039 (=> (not res!856512) (not e!736710))))

(assert (=> b!1290039 (= res!856512 (and (= (size!41753 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41754 _keys!1741) (size!41753 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290040 () Bool)

(declare-fun e!736712 () Bool)

(assert (=> b!1290040 (= e!736712 true)))

(declare-fun lt!578548 () ListLongMap!19709)

(declare-fun +!4376 (ListLongMap!19709 tuple2!22044) ListLongMap!19709)

(assert (=> b!1290040 (not (contains!8001 (+!4376 lt!578548 (tuple2!22045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42589 0))(
  ( (Unit!42590) )
))
(declare-fun lt!578550 () Unit!42589)

(declare-fun addStillNotContains!352 (ListLongMap!19709 (_ BitVec 64) V!50657 (_ BitVec 64)) Unit!42589)

(assert (=> b!1290040 (= lt!578550 (addStillNotContains!352 lt!578548 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6014 (array!85413 array!85411 (_ BitVec 32) (_ BitVec 32) V!50657 V!50657 (_ BitVec 32) Int) ListLongMap!19709)

(assert (=> b!1290040 (= lt!578548 (getCurrentListMapNoExtraKeys!6014 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290041 () Bool)

(declare-fun res!856510 () Bool)

(assert (=> b!1290041 (=> (not res!856510) (not e!736710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85413 (_ BitVec 32)) Bool)

(assert (=> b!1290041 (= res!856510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290042 () Bool)

(assert (=> b!1290042 (= e!736710 (not e!736712))))

(declare-fun res!856511 () Bool)

(assert (=> b!1290042 (=> res!856511 e!736712)))

(assert (=> b!1290042 (= res!856511 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290042 (not (contains!8001 (ListLongMap!19710 Nil!29225) k0!1205))))

(declare-fun lt!578549 () Unit!42589)

(declare-fun emptyContainsNothing!48 ((_ BitVec 64)) Unit!42589)

(assert (=> b!1290042 (= lt!578549 (emptyContainsNothing!48 k0!1205))))

(declare-fun b!1290043 () Bool)

(declare-fun e!736713 () Bool)

(declare-fun e!736711 () Bool)

(declare-fun mapRes!52808 () Bool)

(assert (=> b!1290043 (= e!736713 (and e!736711 mapRes!52808))))

(declare-fun condMapEmpty!52808 () Bool)

(declare-fun mapDefault!52808 () ValueCell!16184)

(assert (=> b!1290043 (= condMapEmpty!52808 (= (arr!41202 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16184)) mapDefault!52808)))))

(declare-fun b!1290044 () Bool)

(declare-fun res!856515 () Bool)

(assert (=> b!1290044 (=> (not res!856515) (not e!736710))))

(assert (=> b!1290044 (= res!856515 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41754 _keys!1741))))))

(declare-fun mapNonEmpty!52808 () Bool)

(declare-fun tp!100693 () Bool)

(declare-fun e!736708 () Bool)

(assert (=> mapNonEmpty!52808 (= mapRes!52808 (and tp!100693 e!736708))))

(declare-fun mapRest!52808 () (Array (_ BitVec 32) ValueCell!16184))

(declare-fun mapKey!52808 () (_ BitVec 32))

(declare-fun mapValue!52808 () ValueCell!16184)

(assert (=> mapNonEmpty!52808 (= (arr!41202 _values!1445) (store mapRest!52808 mapKey!52808 mapValue!52808))))

(declare-fun b!1290045 () Bool)

(declare-fun tp_is_empty!34165 () Bool)

(assert (=> b!1290045 (= e!736708 tp_is_empty!34165)))

(declare-fun mapIsEmpty!52808 () Bool)

(assert (=> mapIsEmpty!52808 mapRes!52808))

(declare-fun b!1290046 () Bool)

(declare-fun res!856508 () Bool)

(assert (=> b!1290046 (=> (not res!856508) (not e!736710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290046 (= res!856508 (not (validKeyInArray!0 (select (arr!41203 _keys!1741) from!2144))))))

(declare-fun b!1290047 () Bool)

(declare-fun res!856509 () Bool)

(assert (=> b!1290047 (=> (not res!856509) (not e!736710))))

(assert (=> b!1290047 (= res!856509 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41754 _keys!1741))))))

(declare-fun b!1290048 () Bool)

(declare-fun res!856513 () Bool)

(assert (=> b!1290048 (=> (not res!856513) (not e!736710))))

(declare-datatypes ((List!29229 0))(
  ( (Nil!29226) (Cons!29225 (h!30443 (_ BitVec 64)) (t!42785 List!29229)) )
))
(declare-fun arrayNoDuplicates!0 (array!85413 (_ BitVec 32) List!29229) Bool)

(assert (=> b!1290048 (= res!856513 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29226))))

(declare-fun b!1290049 () Bool)

(assert (=> b!1290049 (= e!736711 tp_is_empty!34165)))

(declare-fun res!856514 () Bool)

(assert (=> start!109260 (=> (not res!856514) (not e!736710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109260 (= res!856514 (validMask!0 mask!2175))))

(assert (=> start!109260 e!736710))

(assert (=> start!109260 tp_is_empty!34165))

(assert (=> start!109260 true))

(declare-fun array_inv!31447 (array!85411) Bool)

(assert (=> start!109260 (and (array_inv!31447 _values!1445) e!736713)))

(declare-fun array_inv!31448 (array!85413) Bool)

(assert (=> start!109260 (array_inv!31448 _keys!1741)))

(assert (=> start!109260 tp!100694))

(assert (= (and start!109260 res!856514) b!1290039))

(assert (= (and b!1290039 res!856512) b!1290041))

(assert (= (and b!1290041 res!856510) b!1290048))

(assert (= (and b!1290048 res!856513) b!1290044))

(assert (= (and b!1290044 res!856515) b!1290038))

(assert (= (and b!1290038 res!856516) b!1290047))

(assert (= (and b!1290047 res!856509) b!1290046))

(assert (= (and b!1290046 res!856508) b!1290042))

(assert (= (and b!1290042 (not res!856511)) b!1290040))

(assert (= (and b!1290043 condMapEmpty!52808) mapIsEmpty!52808))

(assert (= (and b!1290043 (not condMapEmpty!52808)) mapNonEmpty!52808))

(get-info :version)

(assert (= (and mapNonEmpty!52808 ((_ is ValueCellFull!16184) mapValue!52808)) b!1290045))

(assert (= (and b!1290043 ((_ is ValueCellFull!16184) mapDefault!52808)) b!1290049))

(assert (= start!109260 b!1290043))

(declare-fun m!1182933 () Bool)

(assert (=> mapNonEmpty!52808 m!1182933))

(declare-fun m!1182935 () Bool)

(assert (=> b!1290048 m!1182935))

(declare-fun m!1182937 () Bool)

(assert (=> start!109260 m!1182937))

(declare-fun m!1182939 () Bool)

(assert (=> start!109260 m!1182939))

(declare-fun m!1182941 () Bool)

(assert (=> start!109260 m!1182941))

(declare-fun m!1182943 () Bool)

(assert (=> b!1290041 m!1182943))

(declare-fun m!1182945 () Bool)

(assert (=> b!1290046 m!1182945))

(assert (=> b!1290046 m!1182945))

(declare-fun m!1182947 () Bool)

(assert (=> b!1290046 m!1182947))

(declare-fun m!1182949 () Bool)

(assert (=> b!1290042 m!1182949))

(declare-fun m!1182951 () Bool)

(assert (=> b!1290042 m!1182951))

(declare-fun m!1182953 () Bool)

(assert (=> b!1290040 m!1182953))

(assert (=> b!1290040 m!1182953))

(declare-fun m!1182955 () Bool)

(assert (=> b!1290040 m!1182955))

(declare-fun m!1182957 () Bool)

(assert (=> b!1290040 m!1182957))

(declare-fun m!1182959 () Bool)

(assert (=> b!1290040 m!1182959))

(declare-fun m!1182961 () Bool)

(assert (=> b!1290038 m!1182961))

(assert (=> b!1290038 m!1182961))

(declare-fun m!1182963 () Bool)

(assert (=> b!1290038 m!1182963))

(check-sat tp_is_empty!34165 (not b!1290040) (not start!109260) (not b!1290041) (not b!1290042) (not b_next!28525) (not b!1290038) (not mapNonEmpty!52808) (not b!1290048) b_and!46617 (not b!1290046))
(check-sat b_and!46617 (not b_next!28525))
