; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108440 () Bool)

(assert start!108440)

(declare-fun b_free!27987 () Bool)

(declare-fun b_next!27987 () Bool)

(assert (=> start!108440 (= b_free!27987 (not b_next!27987))))

(declare-fun tp!99071 () Bool)

(declare-fun b_and!46047 () Bool)

(assert (=> start!108440 (= tp!99071 b_and!46047)))

(declare-fun b!1279857 () Bool)

(declare-fun e!731268 () Bool)

(declare-fun e!731270 () Bool)

(declare-fun mapRes!51992 () Bool)

(assert (=> b!1279857 (= e!731268 (and e!731270 mapRes!51992))))

(declare-fun condMapEmpty!51992 () Bool)

(declare-datatypes ((V!49939 0))(
  ( (V!49940 (val!16888 Int)) )
))
(declare-datatypes ((ValueCell!15915 0))(
  ( (ValueCellFull!15915 (v!19488 V!49939)) (EmptyCell!15915) )
))
(declare-datatypes ((array!84336 0))(
  ( (array!84337 (arr!40672 (Array (_ BitVec 32) ValueCell!15915)) (size!41222 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84336)

(declare-fun mapDefault!51992 () ValueCell!15915)

(assert (=> b!1279857 (= condMapEmpty!51992 (= (arr!40672 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15915)) mapDefault!51992)))))

(declare-fun b!1279858 () Bool)

(declare-fun e!731266 () Bool)

(declare-fun tp_is_empty!33627 () Bool)

(assert (=> b!1279858 (= e!731266 tp_is_empty!33627)))

(declare-fun b!1279859 () Bool)

(assert (=> b!1279859 (= e!731270 tp_is_empty!33627)))

(declare-fun res!850172 () Bool)

(declare-fun e!731269 () Bool)

(assert (=> start!108440 (=> (not res!850172) (not e!731269))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108440 (= res!850172 (validMask!0 mask!2175))))

(assert (=> start!108440 e!731269))

(assert (=> start!108440 tp_is_empty!33627))

(assert (=> start!108440 true))

(declare-fun array_inv!30873 (array!84336) Bool)

(assert (=> start!108440 (and (array_inv!30873 _values!1445) e!731268)))

(declare-datatypes ((array!84338 0))(
  ( (array!84339 (arr!40673 (Array (_ BitVec 32) (_ BitVec 64))) (size!41223 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84338)

(declare-fun array_inv!30874 (array!84338) Bool)

(assert (=> start!108440 (array_inv!30874 _keys!1741)))

(assert (=> start!108440 tp!99071))

(declare-fun b!1279860 () Bool)

(declare-fun res!850173 () Bool)

(assert (=> b!1279860 (=> (not res!850173) (not e!731269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84338 (_ BitVec 32)) Bool)

(assert (=> b!1279860 (= res!850173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279861 () Bool)

(declare-fun res!850171 () Bool)

(assert (=> b!1279861 (=> (not res!850171) (not e!731269))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279861 (= res!850171 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41223 _keys!1741))))))

(declare-fun b!1279862 () Bool)

(declare-fun res!850175 () Bool)

(assert (=> b!1279862 (=> (not res!850175) (not e!731269))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279862 (= res!850175 (and (= (size!41222 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41223 _keys!1741) (size!41222 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51992 () Bool)

(declare-fun tp!99070 () Bool)

(assert (=> mapNonEmpty!51992 (= mapRes!51992 (and tp!99070 e!731266))))

(declare-fun mapRest!51992 () (Array (_ BitVec 32) ValueCell!15915))

(declare-fun mapKey!51992 () (_ BitVec 32))

(declare-fun mapValue!51992 () ValueCell!15915)

(assert (=> mapNonEmpty!51992 (= (arr!40672 _values!1445) (store mapRest!51992 mapKey!51992 mapValue!51992))))

(declare-fun mapIsEmpty!51992 () Bool)

(assert (=> mapIsEmpty!51992 mapRes!51992))

(declare-fun b!1279863 () Bool)

(declare-fun res!850174 () Bool)

(assert (=> b!1279863 (=> (not res!850174) (not e!731269))))

(declare-datatypes ((List!28807 0))(
  ( (Nil!28804) (Cons!28803 (h!30012 (_ BitVec 64)) (t!42347 List!28807)) )
))
(declare-fun arrayNoDuplicates!0 (array!84338 (_ BitVec 32) List!28807) Bool)

(assert (=> b!1279863 (= res!850174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28804))))

(declare-fun b!1279864 () Bool)

(assert (=> b!1279864 (= e!731269 false)))

(declare-fun minValue!1387 () V!49939)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!49939)

(declare-fun lt!576053 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21608 0))(
  ( (tuple2!21609 (_1!10815 (_ BitVec 64)) (_2!10815 V!49939)) )
))
(declare-datatypes ((List!28808 0))(
  ( (Nil!28805) (Cons!28804 (h!30013 tuple2!21608) (t!42348 List!28808)) )
))
(declare-datatypes ((ListLongMap!19265 0))(
  ( (ListLongMap!19266 (toList!9648 List!28808)) )
))
(declare-fun contains!7763 (ListLongMap!19265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4732 (array!84338 array!84336 (_ BitVec 32) (_ BitVec 32) V!49939 V!49939 (_ BitVec 32) Int) ListLongMap!19265)

(assert (=> b!1279864 (= lt!576053 (contains!7763 (getCurrentListMap!4732 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108440 res!850172) b!1279862))

(assert (= (and b!1279862 res!850175) b!1279860))

(assert (= (and b!1279860 res!850173) b!1279863))

(assert (= (and b!1279863 res!850174) b!1279861))

(assert (= (and b!1279861 res!850171) b!1279864))

(assert (= (and b!1279857 condMapEmpty!51992) mapIsEmpty!51992))

(assert (= (and b!1279857 (not condMapEmpty!51992)) mapNonEmpty!51992))

(get-info :version)

(assert (= (and mapNonEmpty!51992 ((_ is ValueCellFull!15915) mapValue!51992)) b!1279858))

(assert (= (and b!1279857 ((_ is ValueCellFull!15915) mapDefault!51992)) b!1279859))

(assert (= start!108440 b!1279857))

(declare-fun m!1174677 () Bool)

(assert (=> start!108440 m!1174677))

(declare-fun m!1174679 () Bool)

(assert (=> start!108440 m!1174679))

(declare-fun m!1174681 () Bool)

(assert (=> start!108440 m!1174681))

(declare-fun m!1174683 () Bool)

(assert (=> b!1279864 m!1174683))

(assert (=> b!1279864 m!1174683))

(declare-fun m!1174685 () Bool)

(assert (=> b!1279864 m!1174685))

(declare-fun m!1174687 () Bool)

(assert (=> b!1279863 m!1174687))

(declare-fun m!1174689 () Bool)

(assert (=> b!1279860 m!1174689))

(declare-fun m!1174691 () Bool)

(assert (=> mapNonEmpty!51992 m!1174691))

(check-sat b_and!46047 (not b!1279863) (not mapNonEmpty!51992) (not b!1279864) (not b!1279860) tp_is_empty!33627 (not b_next!27987) (not start!108440))
(check-sat b_and!46047 (not b_next!27987))
