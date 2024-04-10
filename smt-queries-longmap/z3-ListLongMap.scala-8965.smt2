; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108518 () Bool)

(assert start!108518)

(declare-fun b_free!28065 () Bool)

(declare-fun b_next!28065 () Bool)

(assert (=> start!108518 (= b_free!28065 (not b_next!28065))))

(declare-fun tp!99305 () Bool)

(declare-fun b_and!46125 () Bool)

(assert (=> start!108518 (= tp!99305 b_and!46125)))

(declare-fun b!1280875 () Bool)

(declare-fun res!850838 () Bool)

(declare-fun e!731854 () Bool)

(assert (=> b!1280875 (=> (not res!850838) (not e!731854))))

(declare-datatypes ((array!84486 0))(
  ( (array!84487 (arr!40747 (Array (_ BitVec 32) (_ BitVec 64))) (size!41297 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84486)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84486 (_ BitVec 32)) Bool)

(assert (=> b!1280875 (= res!850838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280876 () Bool)

(declare-fun e!731855 () Bool)

(declare-fun tp_is_empty!33705 () Bool)

(assert (=> b!1280876 (= e!731855 tp_is_empty!33705)))

(declare-fun b!1280877 () Bool)

(declare-fun res!850844 () Bool)

(assert (=> b!1280877 (=> (not res!850844) (not e!731854))))

(declare-datatypes ((V!50043 0))(
  ( (V!50044 (val!16927 Int)) )
))
(declare-fun minValue!1387 () V!50043)

(declare-fun zeroValue!1387 () V!50043)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15954 0))(
  ( (ValueCellFull!15954 (v!19527 V!50043)) (EmptyCell!15954) )
))
(declare-datatypes ((array!84488 0))(
  ( (array!84489 (arr!40748 (Array (_ BitVec 32) ValueCell!15954)) (size!41298 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84488)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21670 0))(
  ( (tuple2!21671 (_1!10846 (_ BitVec 64)) (_2!10846 V!50043)) )
))
(declare-datatypes ((List!28866 0))(
  ( (Nil!28863) (Cons!28862 (h!30071 tuple2!21670) (t!42406 List!28866)) )
))
(declare-datatypes ((ListLongMap!19327 0))(
  ( (ListLongMap!19328 (toList!9679 List!28866)) )
))
(declare-fun contains!7794 (ListLongMap!19327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4763 (array!84486 array!84488 (_ BitVec 32) (_ BitVec 32) V!50043 V!50043 (_ BitVec 32) Int) ListLongMap!19327)

(assert (=> b!1280877 (= res!850844 (contains!7794 (getCurrentListMap!4763 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280878 () Bool)

(declare-fun e!731852 () Bool)

(assert (=> b!1280878 (= e!731852 tp_is_empty!33705)))

(declare-fun b!1280879 () Bool)

(assert (=> b!1280879 (= e!731854 (not true))))

(assert (=> b!1280879 (contains!7794 (getCurrentListMap!4763 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42415 0))(
  ( (Unit!42416) )
))
(declare-fun lt!576170 () Unit!42415)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!12 (array!84486 array!84488 (_ BitVec 32) (_ BitVec 32) V!50043 V!50043 (_ BitVec 64) (_ BitVec 32) Int) Unit!42415)

(assert (=> b!1280879 (= lt!576170 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!12 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280880 () Bool)

(declare-fun res!850841 () Bool)

(assert (=> b!1280880 (=> (not res!850841) (not e!731854))))

(assert (=> b!1280880 (= res!850841 (and (= (size!41298 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41297 _keys!1741) (size!41298 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280882 () Bool)

(declare-fun res!850840 () Bool)

(assert (=> b!1280882 (=> (not res!850840) (not e!731854))))

(declare-datatypes ((List!28867 0))(
  ( (Nil!28864) (Cons!28863 (h!30072 (_ BitVec 64)) (t!42407 List!28867)) )
))
(declare-fun arrayNoDuplicates!0 (array!84486 (_ BitVec 32) List!28867) Bool)

(assert (=> b!1280882 (= res!850840 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28864))))

(declare-fun b!1280883 () Bool)

(declare-fun e!731853 () Bool)

(declare-fun mapRes!52109 () Bool)

(assert (=> b!1280883 (= e!731853 (and e!731855 mapRes!52109))))

(declare-fun condMapEmpty!52109 () Bool)

(declare-fun mapDefault!52109 () ValueCell!15954)

(assert (=> b!1280883 (= condMapEmpty!52109 (= (arr!40748 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15954)) mapDefault!52109)))))

(declare-fun mapIsEmpty!52109 () Bool)

(assert (=> mapIsEmpty!52109 mapRes!52109))

(declare-fun mapNonEmpty!52109 () Bool)

(declare-fun tp!99304 () Bool)

(assert (=> mapNonEmpty!52109 (= mapRes!52109 (and tp!99304 e!731852))))

(declare-fun mapRest!52109 () (Array (_ BitVec 32) ValueCell!15954))

(declare-fun mapValue!52109 () ValueCell!15954)

(declare-fun mapKey!52109 () (_ BitVec 32))

(assert (=> mapNonEmpty!52109 (= (arr!40748 _values!1445) (store mapRest!52109 mapKey!52109 mapValue!52109))))

(declare-fun b!1280884 () Bool)

(declare-fun res!850839 () Bool)

(assert (=> b!1280884 (=> (not res!850839) (not e!731854))))

(assert (=> b!1280884 (= res!850839 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41297 _keys!1741))))))

(declare-fun res!850842 () Bool)

(assert (=> start!108518 (=> (not res!850842) (not e!731854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108518 (= res!850842 (validMask!0 mask!2175))))

(assert (=> start!108518 e!731854))

(assert (=> start!108518 tp_is_empty!33705))

(assert (=> start!108518 true))

(declare-fun array_inv!30921 (array!84488) Bool)

(assert (=> start!108518 (and (array_inv!30921 _values!1445) e!731853)))

(declare-fun array_inv!30922 (array!84486) Bool)

(assert (=> start!108518 (array_inv!30922 _keys!1741)))

(assert (=> start!108518 tp!99305))

(declare-fun b!1280881 () Bool)

(declare-fun res!850843 () Bool)

(assert (=> b!1280881 (=> (not res!850843) (not e!731854))))

(assert (=> b!1280881 (= res!850843 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41297 _keys!1741)) (not (= (select (arr!40747 _keys!1741) from!2144) k0!1205))))))

(assert (= (and start!108518 res!850842) b!1280880))

(assert (= (and b!1280880 res!850841) b!1280875))

(assert (= (and b!1280875 res!850838) b!1280882))

(assert (= (and b!1280882 res!850840) b!1280884))

(assert (= (and b!1280884 res!850839) b!1280877))

(assert (= (and b!1280877 res!850844) b!1280881))

(assert (= (and b!1280881 res!850843) b!1280879))

(assert (= (and b!1280883 condMapEmpty!52109) mapIsEmpty!52109))

(assert (= (and b!1280883 (not condMapEmpty!52109)) mapNonEmpty!52109))

(get-info :version)

(assert (= (and mapNonEmpty!52109 ((_ is ValueCellFull!15954) mapValue!52109)) b!1280878))

(assert (= (and b!1280883 ((_ is ValueCellFull!15954) mapDefault!52109)) b!1280876))

(assert (= start!108518 b!1280883))

(declare-fun m!1175405 () Bool)

(assert (=> b!1280882 m!1175405))

(declare-fun m!1175407 () Bool)

(assert (=> b!1280875 m!1175407))

(declare-fun m!1175409 () Bool)

(assert (=> b!1280877 m!1175409))

(assert (=> b!1280877 m!1175409))

(declare-fun m!1175411 () Bool)

(assert (=> b!1280877 m!1175411))

(declare-fun m!1175413 () Bool)

(assert (=> start!108518 m!1175413))

(declare-fun m!1175415 () Bool)

(assert (=> start!108518 m!1175415))

(declare-fun m!1175417 () Bool)

(assert (=> start!108518 m!1175417))

(declare-fun m!1175419 () Bool)

(assert (=> b!1280881 m!1175419))

(declare-fun m!1175421 () Bool)

(assert (=> mapNonEmpty!52109 m!1175421))

(declare-fun m!1175423 () Bool)

(assert (=> b!1280879 m!1175423))

(assert (=> b!1280879 m!1175423))

(declare-fun m!1175425 () Bool)

(assert (=> b!1280879 m!1175425))

(declare-fun m!1175427 () Bool)

(assert (=> b!1280879 m!1175427))

(check-sat (not mapNonEmpty!52109) (not b!1280879) (not b!1280877) (not b!1280882) b_and!46125 (not b!1280875) (not start!108518) (not b_next!28065) tp_is_empty!33705)
(check-sat b_and!46125 (not b_next!28065))
