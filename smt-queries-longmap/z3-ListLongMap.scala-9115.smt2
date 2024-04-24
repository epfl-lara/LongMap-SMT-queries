; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109698 () Bool)

(assert start!109698)

(declare-fun b_free!28963 () Bool)

(declare-fun b_next!28963 () Bool)

(assert (=> start!109698 (= b_free!28963 (not b_next!28963))))

(declare-fun tp!102008 () Bool)

(declare-fun b_and!47055 () Bool)

(assert (=> start!109698 (= tp!102008 b_and!47055)))

(declare-fun b!1297887 () Bool)

(declare-fun res!862224 () Bool)

(declare-fun e!740542 () Bool)

(assert (=> b!1297887 (=> (not res!862224) (not e!740542))))

(declare-datatypes ((array!86257 0))(
  ( (array!86258 (arr!41625 (Array (_ BitVec 32) (_ BitVec 64))) (size!42176 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86257)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86257 (_ BitVec 32)) Bool)

(assert (=> b!1297887 (= res!862224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!862227 () Bool)

(assert (=> start!109698 (=> (not res!862227) (not e!740542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109698 (= res!862227 (validMask!0 mask!2175))))

(assert (=> start!109698 e!740542))

(declare-fun tp_is_empty!34603 () Bool)

(assert (=> start!109698 tp_is_empty!34603))

(assert (=> start!109698 true))

(declare-datatypes ((V!51241 0))(
  ( (V!51242 (val!17376 Int)) )
))
(declare-datatypes ((ValueCell!16403 0))(
  ( (ValueCellFull!16403 (v!19974 V!51241)) (EmptyCell!16403) )
))
(declare-datatypes ((array!86259 0))(
  ( (array!86260 (arr!41626 (Array (_ BitVec 32) ValueCell!16403)) (size!42177 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86259)

(declare-fun e!740541 () Bool)

(declare-fun array_inv!31749 (array!86259) Bool)

(assert (=> start!109698 (and (array_inv!31749 _values!1445) e!740541)))

(declare-fun array_inv!31750 (array!86257) Bool)

(assert (=> start!109698 (array_inv!31750 _keys!1741)))

(assert (=> start!109698 tp!102008))

(declare-fun b!1297888 () Bool)

(declare-fun e!740543 () Bool)

(assert (=> b!1297888 (= e!740543 tp_is_empty!34603)))

(declare-fun b!1297889 () Bool)

(assert (=> b!1297889 (= e!740542 false)))

(declare-fun minValue!1387 () V!51241)

(declare-fun zeroValue!1387 () V!51241)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580983 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22392 0))(
  ( (tuple2!22393 (_1!11207 (_ BitVec 64)) (_2!11207 V!51241)) )
))
(declare-datatypes ((List!29555 0))(
  ( (Nil!29552) (Cons!29551 (h!30769 tuple2!22392) (t!43111 List!29555)) )
))
(declare-datatypes ((ListLongMap!20057 0))(
  ( (ListLongMap!20058 (toList!10044 List!29555)) )
))
(declare-fun contains!8174 (ListLongMap!20057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5063 (array!86257 array!86259 (_ BitVec 32) (_ BitVec 32) V!51241 V!51241 (_ BitVec 32) Int) ListLongMap!20057)

(assert (=> b!1297889 (= lt!580983 (contains!8174 (getCurrentListMap!5063 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53465 () Bool)

(declare-fun mapRes!53465 () Bool)

(assert (=> mapIsEmpty!53465 mapRes!53465))

(declare-fun b!1297890 () Bool)

(declare-fun res!862226 () Bool)

(assert (=> b!1297890 (=> (not res!862226) (not e!740542))))

(declare-datatypes ((List!29556 0))(
  ( (Nil!29553) (Cons!29552 (h!30770 (_ BitVec 64)) (t!43112 List!29556)) )
))
(declare-fun arrayNoDuplicates!0 (array!86257 (_ BitVec 32) List!29556) Bool)

(assert (=> b!1297890 (= res!862226 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29553))))

(declare-fun mapNonEmpty!53465 () Bool)

(declare-fun tp!102007 () Bool)

(assert (=> mapNonEmpty!53465 (= mapRes!53465 (and tp!102007 e!740543))))

(declare-fun mapRest!53465 () (Array (_ BitVec 32) ValueCell!16403))

(declare-fun mapValue!53465 () ValueCell!16403)

(declare-fun mapKey!53465 () (_ BitVec 32))

(assert (=> mapNonEmpty!53465 (= (arr!41626 _values!1445) (store mapRest!53465 mapKey!53465 mapValue!53465))))

(declare-fun b!1297891 () Bool)

(declare-fun e!740540 () Bool)

(assert (=> b!1297891 (= e!740541 (and e!740540 mapRes!53465))))

(declare-fun condMapEmpty!53465 () Bool)

(declare-fun mapDefault!53465 () ValueCell!16403)

(assert (=> b!1297891 (= condMapEmpty!53465 (= (arr!41626 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16403)) mapDefault!53465)))))

(declare-fun b!1297892 () Bool)

(declare-fun res!862225 () Bool)

(assert (=> b!1297892 (=> (not res!862225) (not e!740542))))

(assert (=> b!1297892 (= res!862225 (and (= (size!42177 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42176 _keys!1741) (size!42177 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297893 () Bool)

(assert (=> b!1297893 (= e!740540 tp_is_empty!34603)))

(declare-fun b!1297894 () Bool)

(declare-fun res!862228 () Bool)

(assert (=> b!1297894 (=> (not res!862228) (not e!740542))))

(assert (=> b!1297894 (= res!862228 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42176 _keys!1741))))))

(assert (= (and start!109698 res!862227) b!1297892))

(assert (= (and b!1297892 res!862225) b!1297887))

(assert (= (and b!1297887 res!862224) b!1297890))

(assert (= (and b!1297890 res!862226) b!1297894))

(assert (= (and b!1297894 res!862228) b!1297889))

(assert (= (and b!1297891 condMapEmpty!53465) mapIsEmpty!53465))

(assert (= (and b!1297891 (not condMapEmpty!53465)) mapNonEmpty!53465))

(get-info :version)

(assert (= (and mapNonEmpty!53465 ((_ is ValueCellFull!16403) mapValue!53465)) b!1297888))

(assert (= (and b!1297891 ((_ is ValueCellFull!16403) mapDefault!53465)) b!1297893))

(assert (= start!109698 b!1297891))

(declare-fun m!1190085 () Bool)

(assert (=> b!1297890 m!1190085))

(declare-fun m!1190087 () Bool)

(assert (=> b!1297887 m!1190087))

(declare-fun m!1190089 () Bool)

(assert (=> b!1297889 m!1190089))

(assert (=> b!1297889 m!1190089))

(declare-fun m!1190091 () Bool)

(assert (=> b!1297889 m!1190091))

(declare-fun m!1190093 () Bool)

(assert (=> mapNonEmpty!53465 m!1190093))

(declare-fun m!1190095 () Bool)

(assert (=> start!109698 m!1190095))

(declare-fun m!1190097 () Bool)

(assert (=> start!109698 m!1190097))

(declare-fun m!1190099 () Bool)

(assert (=> start!109698 m!1190099))

(check-sat (not b!1297887) (not b!1297890) (not start!109698) (not b_next!28963) b_and!47055 (not b!1297889) tp_is_empty!34603 (not mapNonEmpty!53465))
(check-sat b_and!47055 (not b_next!28963))
