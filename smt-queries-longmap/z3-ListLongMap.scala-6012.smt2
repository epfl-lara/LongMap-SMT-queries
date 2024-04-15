; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77922 () Bool)

(assert start!77922)

(declare-fun b_free!16483 () Bool)

(declare-fun b_next!16483 () Bool)

(assert (=> start!77922 (= b_free!16483 (not b_next!16483))))

(declare-fun tp!57718 () Bool)

(declare-fun b_and!27027 () Bool)

(assert (=> start!77922 (= tp!57718 b_and!27027)))

(declare-fun b!909720 () Bool)

(declare-fun res!613988 () Bool)

(declare-fun e!509986 () Bool)

(assert (=> b!909720 (=> (not res!613988) (not e!509986))))

(declare-datatypes ((V!30167 0))(
  ( (V!30168 (val!9501 Int)) )
))
(declare-datatypes ((ValueCell!8969 0))(
  ( (ValueCellFull!8969 (v!12008 V!30167)) (EmptyCell!8969) )
))
(declare-datatypes ((array!53807 0))(
  ( (array!53808 (arr!25861 (Array (_ BitVec 32) ValueCell!8969)) (size!26322 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53807)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53809 0))(
  ( (array!53810 (arr!25862 (Array (_ BitVec 32) (_ BitVec 64))) (size!26323 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53809)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909720 (= res!613988 (and (= (size!26322 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26323 _keys!1386) (size!26322 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909722 () Bool)

(declare-fun e!509988 () Bool)

(declare-fun e!509990 () Bool)

(declare-fun mapRes!30070 () Bool)

(assert (=> b!909722 (= e!509988 (and e!509990 mapRes!30070))))

(declare-fun condMapEmpty!30070 () Bool)

(declare-fun mapDefault!30070 () ValueCell!8969)

(assert (=> b!909722 (= condMapEmpty!30070 (= (arr!25861 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8969)) mapDefault!30070)))))

(declare-fun b!909723 () Bool)

(assert (=> b!909723 (= e!509986 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30167)

(declare-fun minValue!1094 () V!30167)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409893 () Bool)

(declare-datatypes ((tuple2!12408 0))(
  ( (tuple2!12409 (_1!6215 (_ BitVec 64)) (_2!6215 V!30167)) )
))
(declare-datatypes ((List!18193 0))(
  ( (Nil!18190) (Cons!18189 (h!19335 tuple2!12408) (t!25767 List!18193)) )
))
(declare-datatypes ((ListLongMap!11095 0))(
  ( (ListLongMap!11096 (toList!5563 List!18193)) )
))
(declare-fun contains!4563 (ListLongMap!11095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2765 (array!53809 array!53807 (_ BitVec 32) (_ BitVec 32) V!30167 V!30167 (_ BitVec 32) Int) ListLongMap!11095)

(assert (=> b!909723 (= lt!409893 (contains!4563 (getCurrentListMap!2765 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909724 () Bool)

(declare-fun res!613990 () Bool)

(assert (=> b!909724 (=> (not res!613990) (not e!509986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53809 (_ BitVec 32)) Bool)

(assert (=> b!909724 (= res!613990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30070 () Bool)

(assert (=> mapIsEmpty!30070 mapRes!30070))

(declare-fun b!909725 () Bool)

(declare-fun e!509987 () Bool)

(declare-fun tp_is_empty!18901 () Bool)

(assert (=> b!909725 (= e!509987 tp_is_empty!18901)))

(declare-fun mapNonEmpty!30070 () Bool)

(declare-fun tp!57717 () Bool)

(assert (=> mapNonEmpty!30070 (= mapRes!30070 (and tp!57717 e!509987))))

(declare-fun mapValue!30070 () ValueCell!8969)

(declare-fun mapRest!30070 () (Array (_ BitVec 32) ValueCell!8969))

(declare-fun mapKey!30070 () (_ BitVec 32))

(assert (=> mapNonEmpty!30070 (= (arr!25861 _values!1152) (store mapRest!30070 mapKey!30070 mapValue!30070))))

(declare-fun b!909726 () Bool)

(assert (=> b!909726 (= e!509990 tp_is_empty!18901)))

(declare-fun res!613989 () Bool)

(assert (=> start!77922 (=> (not res!613989) (not e!509986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77922 (= res!613989 (validMask!0 mask!1756))))

(assert (=> start!77922 e!509986))

(declare-fun array_inv!20274 (array!53807) Bool)

(assert (=> start!77922 (and (array_inv!20274 _values!1152) e!509988)))

(assert (=> start!77922 tp!57718))

(assert (=> start!77922 true))

(assert (=> start!77922 tp_is_empty!18901))

(declare-fun array_inv!20275 (array!53809) Bool)

(assert (=> start!77922 (array_inv!20275 _keys!1386)))

(declare-fun b!909721 () Bool)

(declare-fun res!613987 () Bool)

(assert (=> b!909721 (=> (not res!613987) (not e!509986))))

(declare-datatypes ((List!18194 0))(
  ( (Nil!18191) (Cons!18190 (h!19336 (_ BitVec 64)) (t!25768 List!18194)) )
))
(declare-fun arrayNoDuplicates!0 (array!53809 (_ BitVec 32) List!18194) Bool)

(assert (=> b!909721 (= res!613987 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18191))))

(assert (= (and start!77922 res!613989) b!909720))

(assert (= (and b!909720 res!613988) b!909724))

(assert (= (and b!909724 res!613990) b!909721))

(assert (= (and b!909721 res!613987) b!909723))

(assert (= (and b!909722 condMapEmpty!30070) mapIsEmpty!30070))

(assert (= (and b!909722 (not condMapEmpty!30070)) mapNonEmpty!30070))

(get-info :version)

(assert (= (and mapNonEmpty!30070 ((_ is ValueCellFull!8969) mapValue!30070)) b!909725))

(assert (= (and b!909722 ((_ is ValueCellFull!8969) mapDefault!30070)) b!909726))

(assert (= start!77922 b!909722))

(declare-fun m!844319 () Bool)

(assert (=> mapNonEmpty!30070 m!844319))

(declare-fun m!844321 () Bool)

(assert (=> b!909721 m!844321))

(declare-fun m!844323 () Bool)

(assert (=> b!909723 m!844323))

(assert (=> b!909723 m!844323))

(declare-fun m!844325 () Bool)

(assert (=> b!909723 m!844325))

(declare-fun m!844327 () Bool)

(assert (=> b!909724 m!844327))

(declare-fun m!844329 () Bool)

(assert (=> start!77922 m!844329))

(declare-fun m!844331 () Bool)

(assert (=> start!77922 m!844331))

(declare-fun m!844333 () Bool)

(assert (=> start!77922 m!844333))

(check-sat b_and!27027 (not b!909723) tp_is_empty!18901 (not start!77922) (not b!909724) (not b_next!16483) (not b!909721) (not mapNonEmpty!30070))
(check-sat b_and!27027 (not b_next!16483))
