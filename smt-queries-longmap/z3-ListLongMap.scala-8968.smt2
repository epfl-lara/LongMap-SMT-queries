; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108536 () Bool)

(assert start!108536)

(declare-fun b_free!28083 () Bool)

(declare-fun b_next!28083 () Bool)

(assert (=> start!108536 (= b_free!28083 (not b_next!28083))))

(declare-fun tp!99358 () Bool)

(declare-fun b_and!46143 () Bool)

(assert (=> start!108536 (= tp!99358 b_and!46143)))

(declare-fun mapIsEmpty!52136 () Bool)

(declare-fun mapRes!52136 () Bool)

(assert (=> mapIsEmpty!52136 mapRes!52136))

(declare-fun b!1281145 () Bool)

(declare-fun res!851030 () Bool)

(declare-fun e!731989 () Bool)

(assert (=> b!1281145 (=> (not res!851030) (not e!731989))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50067 0))(
  ( (V!50068 (val!16936 Int)) )
))
(declare-datatypes ((ValueCell!15963 0))(
  ( (ValueCellFull!15963 (v!19536 V!50067)) (EmptyCell!15963) )
))
(declare-datatypes ((array!84516 0))(
  ( (array!84517 (arr!40762 (Array (_ BitVec 32) ValueCell!15963)) (size!41312 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84516)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84518 0))(
  ( (array!84519 (arr!40763 (Array (_ BitVec 32) (_ BitVec 64))) (size!41313 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84518)

(assert (=> b!1281145 (= res!851030 (and (= (size!41312 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41313 _keys!1741) (size!41312 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281146 () Bool)

(declare-fun res!851029 () Bool)

(assert (=> b!1281146 (=> (not res!851029) (not e!731989))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1281146 (= res!851029 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41313 _keys!1741)) (not (= (select (arr!40763 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281147 () Bool)

(declare-fun res!851033 () Bool)

(assert (=> b!1281147 (=> (not res!851033) (not e!731989))))

(declare-fun minValue!1387 () V!50067)

(declare-fun zeroValue!1387 () V!50067)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21680 0))(
  ( (tuple2!21681 (_1!10851 (_ BitVec 64)) (_2!10851 V!50067)) )
))
(declare-datatypes ((List!28876 0))(
  ( (Nil!28873) (Cons!28872 (h!30081 tuple2!21680) (t!42416 List!28876)) )
))
(declare-datatypes ((ListLongMap!19337 0))(
  ( (ListLongMap!19338 (toList!9684 List!28876)) )
))
(declare-fun contains!7799 (ListLongMap!19337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4768 (array!84518 array!84516 (_ BitVec 32) (_ BitVec 32) V!50067 V!50067 (_ BitVec 32) Int) ListLongMap!19337)

(assert (=> b!1281147 (= res!851033 (contains!7799 (getCurrentListMap!4768 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281148 () Bool)

(declare-fun e!731987 () Bool)

(declare-fun tp_is_empty!33723 () Bool)

(assert (=> b!1281148 (= e!731987 tp_is_empty!33723)))

(declare-fun b!1281149 () Bool)

(declare-fun res!851027 () Bool)

(assert (=> b!1281149 (=> (not res!851027) (not e!731989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84518 (_ BitVec 32)) Bool)

(assert (=> b!1281149 (= res!851027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281150 () Bool)

(declare-fun res!851032 () Bool)

(assert (=> b!1281150 (=> (not res!851032) (not e!731989))))

(declare-datatypes ((List!28877 0))(
  ( (Nil!28874) (Cons!28873 (h!30082 (_ BitVec 64)) (t!42417 List!28877)) )
))
(declare-fun arrayNoDuplicates!0 (array!84518 (_ BitVec 32) List!28877) Bool)

(assert (=> b!1281150 (= res!851032 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28874))))

(declare-fun b!1281151 () Bool)

(declare-fun e!731990 () Bool)

(declare-fun e!731988 () Bool)

(assert (=> b!1281151 (= e!731990 (and e!731988 mapRes!52136))))

(declare-fun condMapEmpty!52136 () Bool)

(declare-fun mapDefault!52136 () ValueCell!15963)

(assert (=> b!1281151 (= condMapEmpty!52136 (= (arr!40762 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15963)) mapDefault!52136)))))

(declare-fun res!851028 () Bool)

(assert (=> start!108536 (=> (not res!851028) (not e!731989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108536 (= res!851028 (validMask!0 mask!2175))))

(assert (=> start!108536 e!731989))

(assert (=> start!108536 tp_is_empty!33723))

(assert (=> start!108536 true))

(declare-fun array_inv!30931 (array!84516) Bool)

(assert (=> start!108536 (and (array_inv!30931 _values!1445) e!731990)))

(declare-fun array_inv!30932 (array!84518) Bool)

(assert (=> start!108536 (array_inv!30932 _keys!1741)))

(assert (=> start!108536 tp!99358))

(declare-fun b!1281152 () Bool)

(assert (=> b!1281152 (= e!731988 tp_is_empty!33723)))

(declare-fun b!1281153 () Bool)

(assert (=> b!1281153 (= e!731989 (not true))))

(assert (=> b!1281153 (contains!7799 (getCurrentListMap!4768 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42425 0))(
  ( (Unit!42426) )
))
(declare-fun lt!576197 () Unit!42425)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!17 (array!84518 array!84516 (_ BitVec 32) (_ BitVec 32) V!50067 V!50067 (_ BitVec 64) (_ BitVec 32) Int) Unit!42425)

(assert (=> b!1281153 (= lt!576197 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!17 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281154 () Bool)

(declare-fun res!851031 () Bool)

(assert (=> b!1281154 (=> (not res!851031) (not e!731989))))

(assert (=> b!1281154 (= res!851031 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41313 _keys!1741))))))

(declare-fun mapNonEmpty!52136 () Bool)

(declare-fun tp!99359 () Bool)

(assert (=> mapNonEmpty!52136 (= mapRes!52136 (and tp!99359 e!731987))))

(declare-fun mapKey!52136 () (_ BitVec 32))

(declare-fun mapValue!52136 () ValueCell!15963)

(declare-fun mapRest!52136 () (Array (_ BitVec 32) ValueCell!15963))

(assert (=> mapNonEmpty!52136 (= (arr!40762 _values!1445) (store mapRest!52136 mapKey!52136 mapValue!52136))))

(assert (= (and start!108536 res!851028) b!1281145))

(assert (= (and b!1281145 res!851030) b!1281149))

(assert (= (and b!1281149 res!851027) b!1281150))

(assert (= (and b!1281150 res!851032) b!1281154))

(assert (= (and b!1281154 res!851031) b!1281147))

(assert (= (and b!1281147 res!851033) b!1281146))

(assert (= (and b!1281146 res!851029) b!1281153))

(assert (= (and b!1281151 condMapEmpty!52136) mapIsEmpty!52136))

(assert (= (and b!1281151 (not condMapEmpty!52136)) mapNonEmpty!52136))

(get-info :version)

(assert (= (and mapNonEmpty!52136 ((_ is ValueCellFull!15963) mapValue!52136)) b!1281148))

(assert (= (and b!1281151 ((_ is ValueCellFull!15963) mapDefault!52136)) b!1281152))

(assert (= start!108536 b!1281151))

(declare-fun m!1175621 () Bool)

(assert (=> b!1281149 m!1175621))

(declare-fun m!1175623 () Bool)

(assert (=> mapNonEmpty!52136 m!1175623))

(declare-fun m!1175625 () Bool)

(assert (=> b!1281150 m!1175625))

(declare-fun m!1175627 () Bool)

(assert (=> b!1281153 m!1175627))

(assert (=> b!1281153 m!1175627))

(declare-fun m!1175629 () Bool)

(assert (=> b!1281153 m!1175629))

(declare-fun m!1175631 () Bool)

(assert (=> b!1281153 m!1175631))

(declare-fun m!1175633 () Bool)

(assert (=> b!1281146 m!1175633))

(declare-fun m!1175635 () Bool)

(assert (=> b!1281147 m!1175635))

(assert (=> b!1281147 m!1175635))

(declare-fun m!1175637 () Bool)

(assert (=> b!1281147 m!1175637))

(declare-fun m!1175639 () Bool)

(assert (=> start!108536 m!1175639))

(declare-fun m!1175641 () Bool)

(assert (=> start!108536 m!1175641))

(declare-fun m!1175643 () Bool)

(assert (=> start!108536 m!1175643))

(check-sat b_and!46143 (not b_next!28083) (not b!1281150) (not b!1281153) (not b!1281147) (not mapNonEmpty!52136) (not b!1281149) (not start!108536) tp_is_empty!33723)
(check-sat b_and!46143 (not b_next!28083))
