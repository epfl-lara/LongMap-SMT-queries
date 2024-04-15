; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108682 () Bool)

(assert start!108682)

(declare-fun b_free!28195 () Bool)

(declare-fun b_next!28195 () Bool)

(assert (=> start!108682 (= b_free!28195 (not b_next!28195))))

(declare-fun tp!99702 () Bool)

(declare-fun b_and!46243 () Bool)

(assert (=> start!108682 (= tp!99702 b_and!46243)))

(declare-fun mapNonEmpty!52310 () Bool)

(declare-fun mapRes!52310 () Bool)

(declare-fun tp!99701 () Bool)

(declare-fun e!732995 () Bool)

(assert (=> mapNonEmpty!52310 (= mapRes!52310 (and tp!99701 e!732995))))

(declare-datatypes ((V!50217 0))(
  ( (V!50218 (val!16992 Int)) )
))
(declare-datatypes ((ValueCell!16019 0))(
  ( (ValueCellFull!16019 (v!19593 V!50217)) (EmptyCell!16019) )
))
(declare-fun mapRest!52310 () (Array (_ BitVec 32) ValueCell!16019))

(declare-datatypes ((array!84631 0))(
  ( (array!84632 (arr!40818 (Array (_ BitVec 32) ValueCell!16019)) (size!41370 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84631)

(declare-fun mapKey!52310 () (_ BitVec 32))

(declare-fun mapValue!52310 () ValueCell!16019)

(assert (=> mapNonEmpty!52310 (= (arr!40818 _values!1445) (store mapRest!52310 mapKey!52310 mapValue!52310))))

(declare-fun b!1282885 () Bool)

(declare-fun e!732996 () Bool)

(declare-fun e!732993 () Bool)

(assert (=> b!1282885 (= e!732996 (and e!732993 mapRes!52310))))

(declare-fun condMapEmpty!52310 () Bool)

(declare-fun mapDefault!52310 () ValueCell!16019)

(assert (=> b!1282885 (= condMapEmpty!52310 (= (arr!40818 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16019)) mapDefault!52310)))))

(declare-fun b!1282886 () Bool)

(declare-fun res!852152 () Bool)

(declare-fun e!732994 () Bool)

(assert (=> b!1282886 (=> (not res!852152) (not e!732994))))

(declare-fun minValue!1387 () V!50217)

(declare-fun zeroValue!1387 () V!50217)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84633 0))(
  ( (array!84634 (arr!40819 (Array (_ BitVec 32) (_ BitVec 64))) (size!41371 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84633)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21822 0))(
  ( (tuple2!21823 (_1!10922 (_ BitVec 64)) (_2!10922 V!50217)) )
))
(declare-datatypes ((List!29010 0))(
  ( (Nil!29007) (Cons!29006 (h!30215 tuple2!21822) (t!42546 List!29010)) )
))
(declare-datatypes ((ListLongMap!19479 0))(
  ( (ListLongMap!19480 (toList!9755 List!29010)) )
))
(declare-fun contains!7802 (ListLongMap!19479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4729 (array!84633 array!84631 (_ BitVec 32) (_ BitVec 32) V!50217 V!50217 (_ BitVec 32) Int) ListLongMap!19479)

(assert (=> b!1282886 (= res!852152 (contains!7802 (getCurrentListMap!4729 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282887 () Bool)

(declare-fun res!852151 () Bool)

(assert (=> b!1282887 (=> (not res!852151) (not e!732994))))

(assert (=> b!1282887 (= res!852151 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1282888 () Bool)

(declare-fun tp_is_empty!33835 () Bool)

(assert (=> b!1282888 (= e!732995 tp_is_empty!33835)))

(declare-fun b!1282889 () Bool)

(declare-fun res!852157 () Bool)

(assert (=> b!1282889 (=> (not res!852157) (not e!732994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282889 (= res!852157 (validKeyInArray!0 (select (arr!40819 _keys!1741) from!2144)))))

(declare-fun b!1282890 () Bool)

(declare-fun res!852158 () Bool)

(assert (=> b!1282890 (=> (not res!852158) (not e!732994))))

(assert (=> b!1282890 (= res!852158 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41371 _keys!1741))))))

(declare-fun b!1282891 () Bool)

(assert (=> b!1282891 (= e!732993 tp_is_empty!33835)))

(declare-fun b!1282892 () Bool)

(declare-fun res!852159 () Bool)

(assert (=> b!1282892 (=> (not res!852159) (not e!732994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84633 (_ BitVec 32)) Bool)

(assert (=> b!1282892 (= res!852159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282884 () Bool)

(declare-fun res!852153 () Bool)

(assert (=> b!1282884 (=> (not res!852153) (not e!732994))))

(assert (=> b!1282884 (= res!852153 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41371 _keys!1741))))))

(declare-fun res!852154 () Bool)

(assert (=> start!108682 (=> (not res!852154) (not e!732994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108682 (= res!852154 (validMask!0 mask!2175))))

(assert (=> start!108682 e!732994))

(assert (=> start!108682 tp_is_empty!33835))

(assert (=> start!108682 true))

(declare-fun array_inv!31119 (array!84631) Bool)

(assert (=> start!108682 (and (array_inv!31119 _values!1445) e!732996)))

(declare-fun array_inv!31120 (array!84633) Bool)

(assert (=> start!108682 (array_inv!31120 _keys!1741)))

(assert (=> start!108682 tp!99702))

(declare-fun b!1282893 () Bool)

(assert (=> b!1282893 (= e!732994 false)))

(declare-fun lt!576402 () Bool)

(declare-fun +!4313 (ListLongMap!19479 tuple2!21822) ListLongMap!19479)

(declare-fun getCurrentListMapNoExtraKeys!5944 (array!84633 array!84631 (_ BitVec 32) (_ BitVec 32) V!50217 V!50217 (_ BitVec 32) Int) ListLongMap!19479)

(assert (=> b!1282893 (= lt!576402 (contains!7802 (+!4313 (+!4313 (getCurrentListMapNoExtraKeys!5944 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1282894 () Bool)

(declare-fun res!852155 () Bool)

(assert (=> b!1282894 (=> (not res!852155) (not e!732994))))

(declare-datatypes ((List!29011 0))(
  ( (Nil!29008) (Cons!29007 (h!30216 (_ BitVec 64)) (t!42547 List!29011)) )
))
(declare-fun arrayNoDuplicates!0 (array!84633 (_ BitVec 32) List!29011) Bool)

(assert (=> b!1282894 (= res!852155 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29008))))

(declare-fun b!1282895 () Bool)

(declare-fun res!852156 () Bool)

(assert (=> b!1282895 (=> (not res!852156) (not e!732994))))

(assert (=> b!1282895 (= res!852156 (and (= (size!41370 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41371 _keys!1741) (size!41370 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52310 () Bool)

(assert (=> mapIsEmpty!52310 mapRes!52310))

(assert (= (and start!108682 res!852154) b!1282895))

(assert (= (and b!1282895 res!852156) b!1282892))

(assert (= (and b!1282892 res!852159) b!1282894))

(assert (= (and b!1282894 res!852155) b!1282890))

(assert (= (and b!1282890 res!852158) b!1282886))

(assert (= (and b!1282886 res!852152) b!1282884))

(assert (= (and b!1282884 res!852153) b!1282889))

(assert (= (and b!1282889 res!852157) b!1282887))

(assert (= (and b!1282887 res!852151) b!1282893))

(assert (= (and b!1282885 condMapEmpty!52310) mapIsEmpty!52310))

(assert (= (and b!1282885 (not condMapEmpty!52310)) mapNonEmpty!52310))

(get-info :version)

(assert (= (and mapNonEmpty!52310 ((_ is ValueCellFull!16019) mapValue!52310)) b!1282888))

(assert (= (and b!1282885 ((_ is ValueCellFull!16019) mapDefault!52310)) b!1282891))

(assert (= start!108682 b!1282885))

(declare-fun m!1176481 () Bool)

(assert (=> b!1282894 m!1176481))

(declare-fun m!1176483 () Bool)

(assert (=> start!108682 m!1176483))

(declare-fun m!1176485 () Bool)

(assert (=> start!108682 m!1176485))

(declare-fun m!1176487 () Bool)

(assert (=> start!108682 m!1176487))

(declare-fun m!1176489 () Bool)

(assert (=> mapNonEmpty!52310 m!1176489))

(declare-fun m!1176491 () Bool)

(assert (=> b!1282892 m!1176491))

(declare-fun m!1176493 () Bool)

(assert (=> b!1282893 m!1176493))

(assert (=> b!1282893 m!1176493))

(declare-fun m!1176495 () Bool)

(assert (=> b!1282893 m!1176495))

(assert (=> b!1282893 m!1176495))

(declare-fun m!1176497 () Bool)

(assert (=> b!1282893 m!1176497))

(assert (=> b!1282893 m!1176497))

(declare-fun m!1176499 () Bool)

(assert (=> b!1282893 m!1176499))

(declare-fun m!1176501 () Bool)

(assert (=> b!1282889 m!1176501))

(assert (=> b!1282889 m!1176501))

(declare-fun m!1176503 () Bool)

(assert (=> b!1282889 m!1176503))

(declare-fun m!1176505 () Bool)

(assert (=> b!1282886 m!1176505))

(assert (=> b!1282886 m!1176505))

(declare-fun m!1176507 () Bool)

(assert (=> b!1282886 m!1176507))

(check-sat (not b!1282886) (not b!1282892) (not b_next!28195) b_and!46243 (not mapNonEmpty!52310) (not b!1282894) (not b!1282893) (not b!1282889) tp_is_empty!33835 (not start!108682))
(check-sat b_and!46243 (not b_next!28195))
