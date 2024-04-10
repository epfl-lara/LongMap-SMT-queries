; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108374 () Bool)

(assert start!108374)

(declare-fun b_free!27921 () Bool)

(declare-fun b_next!27921 () Bool)

(assert (=> start!108374 (= b_free!27921 (not b_next!27921))))

(declare-fun tp!98872 () Bool)

(declare-fun b_and!45981 () Bool)

(assert (=> start!108374 (= tp!98872 b_and!45981)))

(declare-fun b!1279056 () Bool)

(declare-fun e!730773 () Bool)

(declare-fun tp_is_empty!33561 () Bool)

(assert (=> b!1279056 (= e!730773 tp_is_empty!33561)))

(declare-fun b!1279057 () Bool)

(declare-fun e!730775 () Bool)

(declare-fun mapRes!51893 () Bool)

(assert (=> b!1279057 (= e!730775 (and e!730773 mapRes!51893))))

(declare-fun condMapEmpty!51893 () Bool)

(declare-datatypes ((V!49851 0))(
  ( (V!49852 (val!16855 Int)) )
))
(declare-datatypes ((ValueCell!15882 0))(
  ( (ValueCellFull!15882 (v!19455 V!49851)) (EmptyCell!15882) )
))
(declare-datatypes ((array!84210 0))(
  ( (array!84211 (arr!40609 (Array (_ BitVec 32) ValueCell!15882)) (size!41159 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84210)

(declare-fun mapDefault!51893 () ValueCell!15882)

(assert (=> b!1279057 (= condMapEmpty!51893 (= (arr!40609 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15882)) mapDefault!51893)))))

(declare-fun b!1279058 () Bool)

(declare-fun res!849670 () Bool)

(declare-fun e!730771 () Bool)

(assert (=> b!1279058 (=> (not res!849670) (not e!730771))))

(declare-datatypes ((array!84212 0))(
  ( (array!84213 (arr!40610 (Array (_ BitVec 32) (_ BitVec 64))) (size!41160 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84212)

(declare-datatypes ((List!28761 0))(
  ( (Nil!28758) (Cons!28757 (h!29966 (_ BitVec 64)) (t!42301 List!28761)) )
))
(declare-fun arrayNoDuplicates!0 (array!84212 (_ BitVec 32) List!28761) Bool)

(assert (=> b!1279058 (= res!849670 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28758))))

(declare-fun b!1279059 () Bool)

(declare-fun e!730774 () Bool)

(assert (=> b!1279059 (= e!730774 tp_is_empty!33561)))

(declare-fun b!1279060 () Bool)

(declare-fun res!849669 () Bool)

(assert (=> b!1279060 (=> (not res!849669) (not e!730771))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279060 (= res!849669 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41160 _keys!1741))))))

(declare-fun b!1279061 () Bool)

(assert (=> b!1279061 (= e!730771 false)))

(declare-fun minValue!1387 () V!49851)

(declare-fun zeroValue!1387 () V!49851)

(declare-fun lt!575963 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21562 0))(
  ( (tuple2!21563 (_1!10792 (_ BitVec 64)) (_2!10792 V!49851)) )
))
(declare-datatypes ((List!28762 0))(
  ( (Nil!28759) (Cons!28758 (h!29967 tuple2!21562) (t!42302 List!28762)) )
))
(declare-datatypes ((ListLongMap!19219 0))(
  ( (ListLongMap!19220 (toList!9625 List!28762)) )
))
(declare-fun contains!7740 (ListLongMap!19219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4709 (array!84212 array!84210 (_ BitVec 32) (_ BitVec 32) V!49851 V!49851 (_ BitVec 32) Int) ListLongMap!19219)

(assert (=> b!1279061 (= lt!575963 (contains!7740 (getCurrentListMap!4709 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!51893 () Bool)

(declare-fun tp!98873 () Bool)

(assert (=> mapNonEmpty!51893 (= mapRes!51893 (and tp!98873 e!730774))))

(declare-fun mapRest!51893 () (Array (_ BitVec 32) ValueCell!15882))

(declare-fun mapKey!51893 () (_ BitVec 32))

(declare-fun mapValue!51893 () ValueCell!15882)

(assert (=> mapNonEmpty!51893 (= (arr!40609 _values!1445) (store mapRest!51893 mapKey!51893 mapValue!51893))))

(declare-fun mapIsEmpty!51893 () Bool)

(assert (=> mapIsEmpty!51893 mapRes!51893))

(declare-fun res!849671 () Bool)

(assert (=> start!108374 (=> (not res!849671) (not e!730771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108374 (= res!849671 (validMask!0 mask!2175))))

(assert (=> start!108374 e!730771))

(assert (=> start!108374 tp_is_empty!33561))

(assert (=> start!108374 true))

(declare-fun array_inv!30835 (array!84210) Bool)

(assert (=> start!108374 (and (array_inv!30835 _values!1445) e!730775)))

(declare-fun array_inv!30836 (array!84212) Bool)

(assert (=> start!108374 (array_inv!30836 _keys!1741)))

(assert (=> start!108374 tp!98872))

(declare-fun b!1279062 () Bool)

(declare-fun res!849668 () Bool)

(assert (=> b!1279062 (=> (not res!849668) (not e!730771))))

(assert (=> b!1279062 (= res!849668 (and (= (size!41159 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41160 _keys!1741) (size!41159 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279063 () Bool)

(declare-fun res!849667 () Bool)

(assert (=> b!1279063 (=> (not res!849667) (not e!730771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84212 (_ BitVec 32)) Bool)

(assert (=> b!1279063 (= res!849667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108374 res!849671) b!1279062))

(assert (= (and b!1279062 res!849668) b!1279063))

(assert (= (and b!1279063 res!849667) b!1279058))

(assert (= (and b!1279058 res!849670) b!1279060))

(assert (= (and b!1279060 res!849669) b!1279061))

(assert (= (and b!1279057 condMapEmpty!51893) mapIsEmpty!51893))

(assert (= (and b!1279057 (not condMapEmpty!51893)) mapNonEmpty!51893))

(get-info :version)

(assert (= (and mapNonEmpty!51893 ((_ is ValueCellFull!15882) mapValue!51893)) b!1279059))

(assert (= (and b!1279057 ((_ is ValueCellFull!15882) mapDefault!51893)) b!1279056))

(assert (= start!108374 b!1279057))

(declare-fun m!1174149 () Bool)

(assert (=> b!1279058 m!1174149))

(declare-fun m!1174151 () Bool)

(assert (=> b!1279063 m!1174151))

(declare-fun m!1174153 () Bool)

(assert (=> start!108374 m!1174153))

(declare-fun m!1174155 () Bool)

(assert (=> start!108374 m!1174155))

(declare-fun m!1174157 () Bool)

(assert (=> start!108374 m!1174157))

(declare-fun m!1174159 () Bool)

(assert (=> b!1279061 m!1174159))

(assert (=> b!1279061 m!1174159))

(declare-fun m!1174161 () Bool)

(assert (=> b!1279061 m!1174161))

(declare-fun m!1174163 () Bool)

(assert (=> mapNonEmpty!51893 m!1174163))

(check-sat (not b_next!27921) (not start!108374) tp_is_empty!33561 (not b!1279063) (not mapNonEmpty!51893) (not b!1279058) b_and!45981 (not b!1279061))
(check-sat b_and!45981 (not b_next!27921))
