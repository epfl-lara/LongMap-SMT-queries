; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109008 () Bool)

(assert start!109008)

(declare-fun b_free!28497 () Bool)

(declare-fun b_next!28497 () Bool)

(assert (=> start!109008 (= b_free!28497 (not b_next!28497))))

(declare-fun tp!100610 () Bool)

(declare-fun b_and!46587 () Bool)

(assert (=> start!109008 (= tp!100610 b_and!46587)))

(declare-fun mapIsEmpty!52766 () Bool)

(declare-fun mapRes!52766 () Bool)

(assert (=> mapIsEmpty!52766 mapRes!52766))

(declare-fun mapNonEmpty!52766 () Bool)

(declare-fun tp!100609 () Bool)

(declare-fun e!735613 () Bool)

(assert (=> mapNonEmpty!52766 (= mapRes!52766 (and tp!100609 e!735613))))

(declare-fun mapKey!52766 () (_ BitVec 32))

(declare-datatypes ((V!50619 0))(
  ( (V!50620 (val!17143 Int)) )
))
(declare-datatypes ((ValueCell!16170 0))(
  ( (ValueCellFull!16170 (v!19746 V!50619)) (EmptyCell!16170) )
))
(declare-fun mapRest!52766 () (Array (_ BitVec 32) ValueCell!16170))

(declare-fun mapValue!52766 () ValueCell!16170)

(declare-datatypes ((array!85322 0))(
  ( (array!85323 (arr!41162 (Array (_ BitVec 32) ValueCell!16170)) (size!41712 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85322)

(assert (=> mapNonEmpty!52766 (= (arr!41162 _values!1445) (store mapRest!52766 mapKey!52766 mapValue!52766))))

(declare-fun b!1288229 () Bool)

(declare-fun res!855613 () Bool)

(declare-fun e!735614 () Bool)

(assert (=> b!1288229 (=> (not res!855613) (not e!735614))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85324 0))(
  ( (array!85325 (arr!41163 (Array (_ BitVec 32) (_ BitVec 64))) (size!41713 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85324)

(assert (=> b!1288229 (= res!855613 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41713 _keys!1741))))))

(declare-fun b!1288230 () Bool)

(declare-fun res!855617 () Bool)

(assert (=> b!1288230 (=> (not res!855617) (not e!735614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288230 (= res!855617 (not (validKeyInArray!0 (select (arr!41163 _keys!1741) from!2144))))))

(declare-fun b!1288231 () Bool)

(declare-fun res!855611 () Bool)

(assert (=> b!1288231 (=> (not res!855611) (not e!735614))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288231 (= res!855611 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41713 _keys!1741))))))

(declare-fun b!1288232 () Bool)

(declare-fun res!855616 () Bool)

(assert (=> b!1288232 (=> (not res!855616) (not e!735614))))

(declare-fun minValue!1387 () V!50619)

(declare-fun zeroValue!1387 () V!50619)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22004 0))(
  ( (tuple2!22005 (_1!11013 (_ BitVec 64)) (_2!11013 V!50619)) )
))
(declare-datatypes ((List!29178 0))(
  ( (Nil!29175) (Cons!29174 (h!30383 tuple2!22004) (t!42742 List!29178)) )
))
(declare-datatypes ((ListLongMap!19661 0))(
  ( (ListLongMap!19662 (toList!9846 List!29178)) )
))
(declare-fun contains!7964 (ListLongMap!19661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4913 (array!85324 array!85322 (_ BitVec 32) (_ BitVec 32) V!50619 V!50619 (_ BitVec 32) Int) ListLongMap!19661)

(assert (=> b!1288232 (= res!855616 (contains!7964 (getCurrentListMap!4913 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288233 () Bool)

(declare-fun res!855618 () Bool)

(assert (=> b!1288233 (=> (not res!855618) (not e!735614))))

(declare-datatypes ((List!29179 0))(
  ( (Nil!29176) (Cons!29175 (h!30384 (_ BitVec 64)) (t!42743 List!29179)) )
))
(declare-fun arrayNoDuplicates!0 (array!85324 (_ BitVec 32) List!29179) Bool)

(assert (=> b!1288233 (= res!855618 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29176))))

(declare-fun b!1288234 () Bool)

(declare-fun res!855612 () Bool)

(assert (=> b!1288234 (=> (not res!855612) (not e!735614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85324 (_ BitVec 32)) Bool)

(assert (=> b!1288234 (= res!855612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288235 () Bool)

(declare-fun e!735609 () Bool)

(declare-fun tp_is_empty!34137 () Bool)

(assert (=> b!1288235 (= e!735609 tp_is_empty!34137)))

(declare-fun res!855614 () Bool)

(assert (=> start!109008 (=> (not res!855614) (not e!735614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109008 (= res!855614 (validMask!0 mask!2175))))

(assert (=> start!109008 e!735614))

(assert (=> start!109008 tp_is_empty!34137))

(assert (=> start!109008 true))

(declare-fun e!735611 () Bool)

(declare-fun array_inv!31213 (array!85322) Bool)

(assert (=> start!109008 (and (array_inv!31213 _values!1445) e!735611)))

(declare-fun array_inv!31214 (array!85324) Bool)

(assert (=> start!109008 (array_inv!31214 _keys!1741)))

(assert (=> start!109008 tp!100610))

(declare-fun b!1288236 () Bool)

(declare-fun e!735610 () Bool)

(assert (=> b!1288236 (= e!735614 (not e!735610))))

(declare-fun res!855610 () Bool)

(assert (=> b!1288236 (=> res!855610 e!735610)))

(assert (=> b!1288236 (= res!855610 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288236 (not (contains!7964 (ListLongMap!19662 Nil!29175) k0!1205))))

(declare-datatypes ((Unit!42612 0))(
  ( (Unit!42613) )
))
(declare-fun lt!577943 () Unit!42612)

(declare-fun emptyContainsNothing!35 ((_ BitVec 64)) Unit!42612)

(assert (=> b!1288236 (= lt!577943 (emptyContainsNothing!35 k0!1205))))

(declare-fun b!1288237 () Bool)

(assert (=> b!1288237 (= e!735611 (and e!735609 mapRes!52766))))

(declare-fun condMapEmpty!52766 () Bool)

(declare-fun mapDefault!52766 () ValueCell!16170)

(assert (=> b!1288237 (= condMapEmpty!52766 (= (arr!41162 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16170)) mapDefault!52766)))))

(declare-fun b!1288238 () Bool)

(declare-fun res!855615 () Bool)

(assert (=> b!1288238 (=> (not res!855615) (not e!735614))))

(assert (=> b!1288238 (= res!855615 (and (= (size!41712 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41713 _keys!1741) (size!41712 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288239 () Bool)

(assert (=> b!1288239 (= e!735613 tp_is_empty!34137)))

(declare-fun b!1288240 () Bool)

(assert (=> b!1288240 (= e!735610 true)))

(declare-fun lt!577942 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5954 (array!85324 array!85322 (_ BitVec 32) (_ BitVec 32) V!50619 V!50619 (_ BitVec 32) Int) ListLongMap!19661)

(assert (=> b!1288240 (= lt!577942 (contains!7964 (getCurrentListMapNoExtraKeys!5954 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109008 res!855614) b!1288238))

(assert (= (and b!1288238 res!855615) b!1288234))

(assert (= (and b!1288234 res!855612) b!1288233))

(assert (= (and b!1288233 res!855618) b!1288229))

(assert (= (and b!1288229 res!855613) b!1288232))

(assert (= (and b!1288232 res!855616) b!1288231))

(assert (= (and b!1288231 res!855611) b!1288230))

(assert (= (and b!1288230 res!855617) b!1288236))

(assert (= (and b!1288236 (not res!855610)) b!1288240))

(assert (= (and b!1288237 condMapEmpty!52766) mapIsEmpty!52766))

(assert (= (and b!1288237 (not condMapEmpty!52766)) mapNonEmpty!52766))

(get-info :version)

(assert (= (and mapNonEmpty!52766 ((_ is ValueCellFull!16170) mapValue!52766)) b!1288239))

(assert (= (and b!1288237 ((_ is ValueCellFull!16170) mapDefault!52766)) b!1288235))

(assert (= start!109008 b!1288237))

(declare-fun m!1180875 () Bool)

(assert (=> b!1288233 m!1180875))

(declare-fun m!1180877 () Bool)

(assert (=> b!1288236 m!1180877))

(declare-fun m!1180879 () Bool)

(assert (=> b!1288236 m!1180879))

(declare-fun m!1180881 () Bool)

(assert (=> b!1288234 m!1180881))

(declare-fun m!1180883 () Bool)

(assert (=> b!1288230 m!1180883))

(assert (=> b!1288230 m!1180883))

(declare-fun m!1180885 () Bool)

(assert (=> b!1288230 m!1180885))

(declare-fun m!1180887 () Bool)

(assert (=> mapNonEmpty!52766 m!1180887))

(declare-fun m!1180889 () Bool)

(assert (=> b!1288232 m!1180889))

(assert (=> b!1288232 m!1180889))

(declare-fun m!1180891 () Bool)

(assert (=> b!1288232 m!1180891))

(declare-fun m!1180893 () Bool)

(assert (=> start!109008 m!1180893))

(declare-fun m!1180895 () Bool)

(assert (=> start!109008 m!1180895))

(declare-fun m!1180897 () Bool)

(assert (=> start!109008 m!1180897))

(declare-fun m!1180899 () Bool)

(assert (=> b!1288240 m!1180899))

(assert (=> b!1288240 m!1180899))

(declare-fun m!1180901 () Bool)

(assert (=> b!1288240 m!1180901))

(check-sat tp_is_empty!34137 (not b!1288232) (not start!109008) (not b!1288240) (not b!1288230) (not b!1288233) (not b!1288236) (not b_next!28497) (not mapNonEmpty!52766) b_and!46587 (not b!1288234))
(check-sat b_and!46587 (not b_next!28497))
