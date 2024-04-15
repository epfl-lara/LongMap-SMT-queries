; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108378 () Bool)

(assert start!108378)

(declare-fun b_free!27925 () Bool)

(declare-fun b_next!27925 () Bool)

(assert (=> start!108378 (= b_free!27925 (not b_next!27925))))

(declare-fun tp!98885 () Bool)

(declare-fun b_and!45967 () Bool)

(assert (=> start!108378 (= tp!98885 b_and!45967)))

(declare-fun mapNonEmpty!51899 () Bool)

(declare-fun mapRes!51899 () Bool)

(declare-fun tp!98886 () Bool)

(declare-fun e!730774 () Bool)

(assert (=> mapNonEmpty!51899 (= mapRes!51899 (and tp!98886 e!730774))))

(declare-datatypes ((V!49857 0))(
  ( (V!49858 (val!16857 Int)) )
))
(declare-datatypes ((ValueCell!15884 0))(
  ( (ValueCellFull!15884 (v!19456 V!49857)) (EmptyCell!15884) )
))
(declare-fun mapValue!51899 () ValueCell!15884)

(declare-fun mapKey!51899 () (_ BitVec 32))

(declare-datatypes ((array!84111 0))(
  ( (array!84112 (arr!40560 (Array (_ BitVec 32) ValueCell!15884)) (size!41112 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84111)

(declare-fun mapRest!51899 () (Array (_ BitVec 32) ValueCell!15884))

(assert (=> mapNonEmpty!51899 (= (arr!40560 _values!1445) (store mapRest!51899 mapKey!51899 mapValue!51899))))

(declare-fun b!1279040 () Bool)

(declare-fun e!730773 () Bool)

(declare-fun e!730775 () Bool)

(assert (=> b!1279040 (= e!730773 (and e!730775 mapRes!51899))))

(declare-fun condMapEmpty!51899 () Bool)

(declare-fun mapDefault!51899 () ValueCell!15884)

(assert (=> b!1279040 (= condMapEmpty!51899 (= (arr!40560 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15884)) mapDefault!51899)))))

(declare-fun b!1279041 () Bool)

(declare-fun res!849673 () Bool)

(declare-fun e!730776 () Bool)

(assert (=> b!1279041 (=> (not res!849673) (not e!730776))))

(declare-datatypes ((array!84113 0))(
  ( (array!84114 (arr!40561 (Array (_ BitVec 32) (_ BitVec 64))) (size!41113 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84113)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84113 (_ BitVec 32)) Bool)

(assert (=> b!1279041 (= res!849673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!849674 () Bool)

(assert (=> start!108378 (=> (not res!849674) (not e!730776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108378 (= res!849674 (validMask!0 mask!2175))))

(assert (=> start!108378 e!730776))

(declare-fun tp_is_empty!33565 () Bool)

(assert (=> start!108378 tp_is_empty!33565))

(assert (=> start!108378 true))

(declare-fun array_inv!30961 (array!84111) Bool)

(assert (=> start!108378 (and (array_inv!30961 _values!1445) e!730773)))

(declare-fun array_inv!30962 (array!84113) Bool)

(assert (=> start!108378 (array_inv!30962 _keys!1741)))

(assert (=> start!108378 tp!98885))

(declare-fun b!1279042 () Bool)

(assert (=> b!1279042 (= e!730775 tp_is_empty!33565)))

(declare-fun mapIsEmpty!51899 () Bool)

(assert (=> mapIsEmpty!51899 mapRes!51899))

(declare-fun b!1279043 () Bool)

(assert (=> b!1279043 (= e!730774 tp_is_empty!33565)))

(declare-fun b!1279044 () Bool)

(assert (=> b!1279044 (= e!730776 false)))

(declare-fun minValue!1387 () V!49857)

(declare-fun zeroValue!1387 () V!49857)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575791 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21646 0))(
  ( (tuple2!21647 (_1!10834 (_ BitVec 64)) (_2!10834 V!49857)) )
))
(declare-datatypes ((List!28838 0))(
  ( (Nil!28835) (Cons!28834 (h!30043 tuple2!21646) (t!42370 List!28838)) )
))
(declare-datatypes ((ListLongMap!19303 0))(
  ( (ListLongMap!19304 (toList!9667 List!28838)) )
))
(declare-fun contains!7712 (ListLongMap!19303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4641 (array!84113 array!84111 (_ BitVec 32) (_ BitVec 32) V!49857 V!49857 (_ BitVec 32) Int) ListLongMap!19303)

(assert (=> b!1279044 (= lt!575791 (contains!7712 (getCurrentListMap!4641 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279045 () Bool)

(declare-fun res!849671 () Bool)

(assert (=> b!1279045 (=> (not res!849671) (not e!730776))))

(assert (=> b!1279045 (= res!849671 (and (= (size!41112 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41113 _keys!1741) (size!41112 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279046 () Bool)

(declare-fun res!849670 () Bool)

(assert (=> b!1279046 (=> (not res!849670) (not e!730776))))

(assert (=> b!1279046 (= res!849670 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41113 _keys!1741))))))

(declare-fun b!1279047 () Bool)

(declare-fun res!849672 () Bool)

(assert (=> b!1279047 (=> (not res!849672) (not e!730776))))

(declare-datatypes ((List!28839 0))(
  ( (Nil!28836) (Cons!28835 (h!30044 (_ BitVec 64)) (t!42371 List!28839)) )
))
(declare-fun arrayNoDuplicates!0 (array!84113 (_ BitVec 32) List!28839) Bool)

(assert (=> b!1279047 (= res!849672 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28836))))

(assert (= (and start!108378 res!849674) b!1279045))

(assert (= (and b!1279045 res!849671) b!1279041))

(assert (= (and b!1279041 res!849673) b!1279047))

(assert (= (and b!1279047 res!849672) b!1279046))

(assert (= (and b!1279046 res!849670) b!1279044))

(assert (= (and b!1279040 condMapEmpty!51899) mapIsEmpty!51899))

(assert (= (and b!1279040 (not condMapEmpty!51899)) mapNonEmpty!51899))

(get-info :version)

(assert (= (and mapNonEmpty!51899 ((_ is ValueCellFull!15884) mapValue!51899)) b!1279043))

(assert (= (and b!1279040 ((_ is ValueCellFull!15884) mapDefault!51899)) b!1279042))

(assert (= start!108378 b!1279040))

(declare-fun m!1173681 () Bool)

(assert (=> mapNonEmpty!51899 m!1173681))

(declare-fun m!1173683 () Bool)

(assert (=> b!1279044 m!1173683))

(assert (=> b!1279044 m!1173683))

(declare-fun m!1173685 () Bool)

(assert (=> b!1279044 m!1173685))

(declare-fun m!1173687 () Bool)

(assert (=> b!1279047 m!1173687))

(declare-fun m!1173689 () Bool)

(assert (=> start!108378 m!1173689))

(declare-fun m!1173691 () Bool)

(assert (=> start!108378 m!1173691))

(declare-fun m!1173693 () Bool)

(assert (=> start!108378 m!1173693))

(declare-fun m!1173695 () Bool)

(assert (=> b!1279041 m!1173695))

(check-sat (not start!108378) (not b_next!27925) (not b!1279047) (not b!1279041) b_and!45967 (not b!1279044) tp_is_empty!33565 (not mapNonEmpty!51899))
(check-sat b_and!45967 (not b_next!27925))
