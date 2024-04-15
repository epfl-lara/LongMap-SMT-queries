; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108396 () Bool)

(assert start!108396)

(declare-fun b_free!27943 () Bool)

(declare-fun b_next!27943 () Bool)

(assert (=> start!108396 (= b_free!27943 (not b_next!27943))))

(declare-fun tp!98939 () Bool)

(declare-fun b_and!45985 () Bool)

(assert (=> start!108396 (= tp!98939 b_and!45985)))

(declare-fun b!1279256 () Bool)

(declare-fun e!730907 () Bool)

(declare-fun e!730908 () Bool)

(declare-fun mapRes!51926 () Bool)

(assert (=> b!1279256 (= e!730907 (and e!730908 mapRes!51926))))

(declare-fun condMapEmpty!51926 () Bool)

(declare-datatypes ((V!49881 0))(
  ( (V!49882 (val!16866 Int)) )
))
(declare-datatypes ((ValueCell!15893 0))(
  ( (ValueCellFull!15893 (v!19465 V!49881)) (EmptyCell!15893) )
))
(declare-datatypes ((array!84143 0))(
  ( (array!84144 (arr!40576 (Array (_ BitVec 32) ValueCell!15893)) (size!41128 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84143)

(declare-fun mapDefault!51926 () ValueCell!15893)

(assert (=> b!1279256 (= condMapEmpty!51926 (= (arr!40576 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15893)) mapDefault!51926)))))

(declare-fun b!1279257 () Bool)

(declare-fun res!849807 () Bool)

(declare-fun e!730909 () Bool)

(assert (=> b!1279257 (=> (not res!849807) (not e!730909))))

(declare-datatypes ((array!84145 0))(
  ( (array!84146 (arr!40577 (Array (_ BitVec 32) (_ BitVec 64))) (size!41129 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84145)

(declare-datatypes ((List!28848 0))(
  ( (Nil!28845) (Cons!28844 (h!30053 (_ BitVec 64)) (t!42380 List!28848)) )
))
(declare-fun arrayNoDuplicates!0 (array!84145 (_ BitVec 32) List!28848) Bool)

(assert (=> b!1279257 (= res!849807 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28845))))

(declare-fun b!1279258 () Bool)

(declare-fun res!849808 () Bool)

(assert (=> b!1279258 (=> (not res!849808) (not e!730909))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279258 (= res!849808 (and (= (size!41128 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41129 _keys!1741) (size!41128 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279259 () Bool)

(declare-fun res!849809 () Bool)

(assert (=> b!1279259 (=> (not res!849809) (not e!730909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84145 (_ BitVec 32)) Bool)

(assert (=> b!1279259 (= res!849809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51926 () Bool)

(declare-fun tp!98940 () Bool)

(declare-fun e!730910 () Bool)

(assert (=> mapNonEmpty!51926 (= mapRes!51926 (and tp!98940 e!730910))))

(declare-fun mapRest!51926 () (Array (_ BitVec 32) ValueCell!15893))

(declare-fun mapKey!51926 () (_ BitVec 32))

(declare-fun mapValue!51926 () ValueCell!15893)

(assert (=> mapNonEmpty!51926 (= (arr!40576 _values!1445) (store mapRest!51926 mapKey!51926 mapValue!51926))))

(declare-fun mapIsEmpty!51926 () Bool)

(assert (=> mapIsEmpty!51926 mapRes!51926))

(declare-fun b!1279260 () Bool)

(declare-fun tp_is_empty!33583 () Bool)

(assert (=> b!1279260 (= e!730908 tp_is_empty!33583)))

(declare-fun b!1279261 () Bool)

(declare-fun res!849805 () Bool)

(assert (=> b!1279261 (=> (not res!849805) (not e!730909))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279261 (= res!849805 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41129 _keys!1741))))))

(declare-fun b!1279262 () Bool)

(assert (=> b!1279262 (= e!730909 false)))

(declare-fun minValue!1387 () V!49881)

(declare-fun lt!575818 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!49881)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21658 0))(
  ( (tuple2!21659 (_1!10840 (_ BitVec 64)) (_2!10840 V!49881)) )
))
(declare-datatypes ((List!28849 0))(
  ( (Nil!28846) (Cons!28845 (h!30054 tuple2!21658) (t!42381 List!28849)) )
))
(declare-datatypes ((ListLongMap!19315 0))(
  ( (ListLongMap!19316 (toList!9673 List!28849)) )
))
(declare-fun contains!7718 (ListLongMap!19315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4647 (array!84145 array!84143 (_ BitVec 32) (_ BitVec 32) V!49881 V!49881 (_ BitVec 32) Int) ListLongMap!19315)

(assert (=> b!1279262 (= lt!575818 (contains!7718 (getCurrentListMap!4647 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!849806 () Bool)

(assert (=> start!108396 (=> (not res!849806) (not e!730909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108396 (= res!849806 (validMask!0 mask!2175))))

(assert (=> start!108396 e!730909))

(assert (=> start!108396 tp_is_empty!33583))

(assert (=> start!108396 true))

(declare-fun array_inv!30971 (array!84143) Bool)

(assert (=> start!108396 (and (array_inv!30971 _values!1445) e!730907)))

(declare-fun array_inv!30972 (array!84145) Bool)

(assert (=> start!108396 (array_inv!30972 _keys!1741)))

(assert (=> start!108396 tp!98939))

(declare-fun b!1279263 () Bool)

(assert (=> b!1279263 (= e!730910 tp_is_empty!33583)))

(assert (= (and start!108396 res!849806) b!1279258))

(assert (= (and b!1279258 res!849808) b!1279259))

(assert (= (and b!1279259 res!849809) b!1279257))

(assert (= (and b!1279257 res!849807) b!1279261))

(assert (= (and b!1279261 res!849805) b!1279262))

(assert (= (and b!1279256 condMapEmpty!51926) mapIsEmpty!51926))

(assert (= (and b!1279256 (not condMapEmpty!51926)) mapNonEmpty!51926))

(get-info :version)

(assert (= (and mapNonEmpty!51926 ((_ is ValueCellFull!15893) mapValue!51926)) b!1279263))

(assert (= (and b!1279256 ((_ is ValueCellFull!15893) mapDefault!51926)) b!1279260))

(assert (= start!108396 b!1279256))

(declare-fun m!1173825 () Bool)

(assert (=> b!1279262 m!1173825))

(assert (=> b!1279262 m!1173825))

(declare-fun m!1173827 () Bool)

(assert (=> b!1279262 m!1173827))

(declare-fun m!1173829 () Bool)

(assert (=> b!1279259 m!1173829))

(declare-fun m!1173831 () Bool)

(assert (=> start!108396 m!1173831))

(declare-fun m!1173833 () Bool)

(assert (=> start!108396 m!1173833))

(declare-fun m!1173835 () Bool)

(assert (=> start!108396 m!1173835))

(declare-fun m!1173837 () Bool)

(assert (=> b!1279257 m!1173837))

(declare-fun m!1173839 () Bool)

(assert (=> mapNonEmpty!51926 m!1173839))

(check-sat (not start!108396) (not b!1279259) (not b!1279262) (not b!1279257) tp_is_empty!33583 b_and!45985 (not b_next!27943) (not mapNonEmpty!51926))
(check-sat b_and!45985 (not b_next!27943))
