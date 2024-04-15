; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108444 () Bool)

(assert start!108444)

(declare-fun b_free!27991 () Bool)

(declare-fun b_next!27991 () Bool)

(assert (=> start!108444 (= b_free!27991 (not b_next!27991))))

(declare-fun tp!99084 () Bool)

(declare-fun b_and!46033 () Bool)

(assert (=> start!108444 (= tp!99084 b_and!46033)))

(declare-fun b!1279841 () Bool)

(declare-fun e!731267 () Bool)

(assert (=> b!1279841 (= e!731267 false)))

(declare-datatypes ((V!49945 0))(
  ( (V!49946 (val!16890 Int)) )
))
(declare-fun minValue!1387 () V!49945)

(declare-fun zeroValue!1387 () V!49945)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575881 () Bool)

(declare-datatypes ((ValueCell!15917 0))(
  ( (ValueCellFull!15917 (v!19489 V!49945)) (EmptyCell!15917) )
))
(declare-datatypes ((array!84235 0))(
  ( (array!84236 (arr!40622 (Array (_ BitVec 32) ValueCell!15917)) (size!41174 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84235)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84237 0))(
  ( (array!84238 (arr!40623 (Array (_ BitVec 32) (_ BitVec 64))) (size!41175 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84237)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21690 0))(
  ( (tuple2!21691 (_1!10856 (_ BitVec 64)) (_2!10856 V!49945)) )
))
(declare-datatypes ((List!28880 0))(
  ( (Nil!28877) (Cons!28876 (h!30085 tuple2!21690) (t!42412 List!28880)) )
))
(declare-datatypes ((ListLongMap!19347 0))(
  ( (ListLongMap!19348 (toList!9689 List!28880)) )
))
(declare-fun contains!7734 (ListLongMap!19347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4663 (array!84237 array!84235 (_ BitVec 32) (_ BitVec 32) V!49945 V!49945 (_ BitVec 32) Int) ListLongMap!19347)

(assert (=> b!1279841 (= lt!575881 (contains!7734 (getCurrentListMap!4663 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!51998 () Bool)

(declare-fun mapRes!51998 () Bool)

(assert (=> mapIsEmpty!51998 mapRes!51998))

(declare-fun res!850178 () Bool)

(assert (=> start!108444 (=> (not res!850178) (not e!731267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108444 (= res!850178 (validMask!0 mask!2175))))

(assert (=> start!108444 e!731267))

(declare-fun tp_is_empty!33631 () Bool)

(assert (=> start!108444 tp_is_empty!33631))

(assert (=> start!108444 true))

(declare-fun e!731271 () Bool)

(declare-fun array_inv!31005 (array!84235) Bool)

(assert (=> start!108444 (and (array_inv!31005 _values!1445) e!731271)))

(declare-fun array_inv!31006 (array!84237) Bool)

(assert (=> start!108444 (array_inv!31006 _keys!1741)))

(assert (=> start!108444 tp!99084))

(declare-fun b!1279842 () Bool)

(declare-fun e!731270 () Bool)

(assert (=> b!1279842 (= e!731270 tp_is_empty!33631)))

(declare-fun b!1279843 () Bool)

(declare-fun res!850177 () Bool)

(assert (=> b!1279843 (=> (not res!850177) (not e!731267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84237 (_ BitVec 32)) Bool)

(assert (=> b!1279843 (= res!850177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279844 () Bool)

(declare-fun res!850174 () Bool)

(assert (=> b!1279844 (=> (not res!850174) (not e!731267))))

(declare-datatypes ((List!28881 0))(
  ( (Nil!28878) (Cons!28877 (h!30086 (_ BitVec 64)) (t!42413 List!28881)) )
))
(declare-fun arrayNoDuplicates!0 (array!84237 (_ BitVec 32) List!28881) Bool)

(assert (=> b!1279844 (= res!850174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28878))))

(declare-fun b!1279845 () Bool)

(declare-fun res!850175 () Bool)

(assert (=> b!1279845 (=> (not res!850175) (not e!731267))))

(assert (=> b!1279845 (= res!850175 (and (= (size!41174 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41175 _keys!1741) (size!41174 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51998 () Bool)

(declare-fun tp!99083 () Bool)

(declare-fun e!731269 () Bool)

(assert (=> mapNonEmpty!51998 (= mapRes!51998 (and tp!99083 e!731269))))

(declare-fun mapKey!51998 () (_ BitVec 32))

(declare-fun mapRest!51998 () (Array (_ BitVec 32) ValueCell!15917))

(declare-fun mapValue!51998 () ValueCell!15917)

(assert (=> mapNonEmpty!51998 (= (arr!40622 _values!1445) (store mapRest!51998 mapKey!51998 mapValue!51998))))

(declare-fun b!1279846 () Bool)

(assert (=> b!1279846 (= e!731271 (and e!731270 mapRes!51998))))

(declare-fun condMapEmpty!51998 () Bool)

(declare-fun mapDefault!51998 () ValueCell!15917)

(assert (=> b!1279846 (= condMapEmpty!51998 (= (arr!40622 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15917)) mapDefault!51998)))))

(declare-fun b!1279847 () Bool)

(assert (=> b!1279847 (= e!731269 tp_is_empty!33631)))

(declare-fun b!1279848 () Bool)

(declare-fun res!850176 () Bool)

(assert (=> b!1279848 (=> (not res!850176) (not e!731267))))

(assert (=> b!1279848 (= res!850176 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41175 _keys!1741))))))

(assert (= (and start!108444 res!850178) b!1279845))

(assert (= (and b!1279845 res!850175) b!1279843))

(assert (= (and b!1279843 res!850177) b!1279844))

(assert (= (and b!1279844 res!850174) b!1279848))

(assert (= (and b!1279848 res!850176) b!1279841))

(assert (= (and b!1279846 condMapEmpty!51998) mapIsEmpty!51998))

(assert (= (and b!1279846 (not condMapEmpty!51998)) mapNonEmpty!51998))

(get-info :version)

(assert (= (and mapNonEmpty!51998 ((_ is ValueCellFull!15917) mapValue!51998)) b!1279847))

(assert (= (and b!1279846 ((_ is ValueCellFull!15917) mapDefault!51998)) b!1279842))

(assert (= start!108444 b!1279846))

(declare-fun m!1174209 () Bool)

(assert (=> start!108444 m!1174209))

(declare-fun m!1174211 () Bool)

(assert (=> start!108444 m!1174211))

(declare-fun m!1174213 () Bool)

(assert (=> start!108444 m!1174213))

(declare-fun m!1174215 () Bool)

(assert (=> b!1279844 m!1174215))

(declare-fun m!1174217 () Bool)

(assert (=> b!1279843 m!1174217))

(declare-fun m!1174219 () Bool)

(assert (=> b!1279841 m!1174219))

(assert (=> b!1279841 m!1174219))

(declare-fun m!1174221 () Bool)

(assert (=> b!1279841 m!1174221))

(declare-fun m!1174223 () Bool)

(assert (=> mapNonEmpty!51998 m!1174223))

(check-sat tp_is_empty!33631 (not b!1279844) (not start!108444) (not b_next!27991) b_and!46033 (not mapNonEmpty!51998) (not b!1279841) (not b!1279843))
(check-sat b_and!46033 (not b_next!27991))
