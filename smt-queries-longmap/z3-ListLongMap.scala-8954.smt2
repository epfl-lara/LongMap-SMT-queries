; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108452 () Bool)

(assert start!108452)

(declare-fun b_free!27999 () Bool)

(declare-fun b_next!27999 () Bool)

(assert (=> start!108452 (= b_free!27999 (not b_next!27999))))

(declare-fun tp!99107 () Bool)

(declare-fun b_and!46059 () Bool)

(assert (=> start!108452 (= tp!99107 b_and!46059)))

(declare-fun res!850262 () Bool)

(declare-fun e!731356 () Bool)

(assert (=> start!108452 (=> (not res!850262) (not e!731356))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108452 (= res!850262 (validMask!0 mask!2175))))

(assert (=> start!108452 e!731356))

(declare-fun tp_is_empty!33639 () Bool)

(assert (=> start!108452 tp_is_empty!33639))

(assert (=> start!108452 true))

(declare-datatypes ((V!49955 0))(
  ( (V!49956 (val!16894 Int)) )
))
(declare-datatypes ((ValueCell!15921 0))(
  ( (ValueCellFull!15921 (v!19494 V!49955)) (EmptyCell!15921) )
))
(declare-datatypes ((array!84358 0))(
  ( (array!84359 (arr!40683 (Array (_ BitVec 32) ValueCell!15921)) (size!41233 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84358)

(declare-fun e!731359 () Bool)

(declare-fun array_inv!30881 (array!84358) Bool)

(assert (=> start!108452 (and (array_inv!30881 _values!1445) e!731359)))

(declare-datatypes ((array!84360 0))(
  ( (array!84361 (arr!40684 (Array (_ BitVec 32) (_ BitVec 64))) (size!41234 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84360)

(declare-fun array_inv!30882 (array!84360) Bool)

(assert (=> start!108452 (array_inv!30882 _keys!1741)))

(assert (=> start!108452 tp!99107))

(declare-fun b!1280001 () Bool)

(assert (=> b!1280001 (= e!731356 false)))

(declare-fun minValue!1387 () V!49955)

(declare-fun zeroValue!1387 () V!49955)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576071 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21616 0))(
  ( (tuple2!21617 (_1!10819 (_ BitVec 64)) (_2!10819 V!49955)) )
))
(declare-datatypes ((List!28815 0))(
  ( (Nil!28812) (Cons!28811 (h!30020 tuple2!21616) (t!42355 List!28815)) )
))
(declare-datatypes ((ListLongMap!19273 0))(
  ( (ListLongMap!19274 (toList!9652 List!28815)) )
))
(declare-fun contains!7767 (ListLongMap!19273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4736 (array!84360 array!84358 (_ BitVec 32) (_ BitVec 32) V!49955 V!49955 (_ BitVec 32) Int) ListLongMap!19273)

(assert (=> b!1280001 (= lt!576071 (contains!7767 (getCurrentListMap!4736 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280002 () Bool)

(declare-fun e!731358 () Bool)

(assert (=> b!1280002 (= e!731358 tp_is_empty!33639)))

(declare-fun b!1280003 () Bool)

(declare-fun res!850263 () Bool)

(assert (=> b!1280003 (=> (not res!850263) (not e!731356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84360 (_ BitVec 32)) Bool)

(assert (=> b!1280003 (= res!850263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280004 () Bool)

(declare-fun res!850264 () Bool)

(assert (=> b!1280004 (=> (not res!850264) (not e!731356))))

(assert (=> b!1280004 (= res!850264 (and (= (size!41233 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41234 _keys!1741) (size!41233 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280005 () Bool)

(declare-fun e!731360 () Bool)

(assert (=> b!1280005 (= e!731360 tp_is_empty!33639)))

(declare-fun b!1280006 () Bool)

(declare-fun res!850265 () Bool)

(assert (=> b!1280006 (=> (not res!850265) (not e!731356))))

(assert (=> b!1280006 (= res!850265 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41234 _keys!1741))))))

(declare-fun b!1280007 () Bool)

(declare-fun mapRes!52010 () Bool)

(assert (=> b!1280007 (= e!731359 (and e!731358 mapRes!52010))))

(declare-fun condMapEmpty!52010 () Bool)

(declare-fun mapDefault!52010 () ValueCell!15921)

(assert (=> b!1280007 (= condMapEmpty!52010 (= (arr!40683 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15921)) mapDefault!52010)))))

(declare-fun b!1280008 () Bool)

(declare-fun res!850261 () Bool)

(assert (=> b!1280008 (=> (not res!850261) (not e!731356))))

(declare-datatypes ((List!28816 0))(
  ( (Nil!28813) (Cons!28812 (h!30021 (_ BitVec 64)) (t!42356 List!28816)) )
))
(declare-fun arrayNoDuplicates!0 (array!84360 (_ BitVec 32) List!28816) Bool)

(assert (=> b!1280008 (= res!850261 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28813))))

(declare-fun mapIsEmpty!52010 () Bool)

(assert (=> mapIsEmpty!52010 mapRes!52010))

(declare-fun mapNonEmpty!52010 () Bool)

(declare-fun tp!99106 () Bool)

(assert (=> mapNonEmpty!52010 (= mapRes!52010 (and tp!99106 e!731360))))

(declare-fun mapValue!52010 () ValueCell!15921)

(declare-fun mapRest!52010 () (Array (_ BitVec 32) ValueCell!15921))

(declare-fun mapKey!52010 () (_ BitVec 32))

(assert (=> mapNonEmpty!52010 (= (arr!40683 _values!1445) (store mapRest!52010 mapKey!52010 mapValue!52010))))

(assert (= (and start!108452 res!850262) b!1280004))

(assert (= (and b!1280004 res!850264) b!1280003))

(assert (= (and b!1280003 res!850263) b!1280008))

(assert (= (and b!1280008 res!850261) b!1280006))

(assert (= (and b!1280006 res!850265) b!1280001))

(assert (= (and b!1280007 condMapEmpty!52010) mapIsEmpty!52010))

(assert (= (and b!1280007 (not condMapEmpty!52010)) mapNonEmpty!52010))

(get-info :version)

(assert (= (and mapNonEmpty!52010 ((_ is ValueCellFull!15921) mapValue!52010)) b!1280005))

(assert (= (and b!1280007 ((_ is ValueCellFull!15921) mapDefault!52010)) b!1280002))

(assert (= start!108452 b!1280007))

(declare-fun m!1174773 () Bool)

(assert (=> b!1280003 m!1174773))

(declare-fun m!1174775 () Bool)

(assert (=> b!1280001 m!1174775))

(assert (=> b!1280001 m!1174775))

(declare-fun m!1174777 () Bool)

(assert (=> b!1280001 m!1174777))

(declare-fun m!1174779 () Bool)

(assert (=> mapNonEmpty!52010 m!1174779))

(declare-fun m!1174781 () Bool)

(assert (=> b!1280008 m!1174781))

(declare-fun m!1174783 () Bool)

(assert (=> start!108452 m!1174783))

(declare-fun m!1174785 () Bool)

(assert (=> start!108452 m!1174785))

(declare-fun m!1174787 () Bool)

(assert (=> start!108452 m!1174787))

(check-sat (not b!1280008) b_and!46059 tp_is_empty!33639 (not b_next!27999) (not mapNonEmpty!52010) (not b!1280001) (not b!1280003) (not start!108452))
(check-sat b_and!46059 (not b_next!27999))
