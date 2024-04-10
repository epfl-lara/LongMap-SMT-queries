; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110964 () Bool)

(assert start!110964)

(declare-fun b_free!29799 () Bool)

(declare-fun b_next!29799 () Bool)

(assert (=> start!110964 (= b_free!29799 (not b_next!29799))))

(declare-fun tp!104719 () Bool)

(declare-fun b_and!48007 () Bool)

(assert (=> start!110964 (= tp!104719 b_and!48007)))

(declare-fun b!1313726 () Bool)

(declare-fun res!872174 () Bool)

(declare-fun e!749353 () Bool)

(assert (=> b!1313726 (=> (not res!872174) (not e!749353))))

(declare-datatypes ((array!88032 0))(
  ( (array!88033 (arr!42496 (Array (_ BitVec 32) (_ BitVec 64))) (size!43046 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88032)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88032 (_ BitVec 32)) Bool)

(assert (=> b!1313726 (= res!872174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54922 () Bool)

(declare-fun mapRes!54922 () Bool)

(assert (=> mapIsEmpty!54922 mapRes!54922))

(declare-fun b!1313727 () Bool)

(assert (=> b!1313727 (= e!749353 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585708 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52475 0))(
  ( (V!52476 (val!17839 Int)) )
))
(declare-fun minValue!1296 () V!52475)

(declare-datatypes ((ValueCell!16866 0))(
  ( (ValueCellFull!16866 (v!20466 V!52475)) (EmptyCell!16866) )
))
(declare-datatypes ((array!88034 0))(
  ( (array!88035 (arr!42497 (Array (_ BitVec 32) ValueCell!16866)) (size!43047 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88034)

(declare-fun zeroValue!1296 () V!52475)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22998 0))(
  ( (tuple2!22999 (_1!11510 (_ BitVec 64)) (_2!11510 V!52475)) )
))
(declare-datatypes ((List!30134 0))(
  ( (Nil!30131) (Cons!30130 (h!31339 tuple2!22998) (t!43740 List!30134)) )
))
(declare-datatypes ((ListLongMap!20655 0))(
  ( (ListLongMap!20656 (toList!10343 List!30134)) )
))
(declare-fun contains!8493 (ListLongMap!20655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5356 (array!88032 array!88034 (_ BitVec 32) (_ BitVec 32) V!52475 V!52475 (_ BitVec 32) Int) ListLongMap!20655)

(assert (=> b!1313727 (= lt!585708 (contains!8493 (getCurrentListMap!5356 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313728 () Bool)

(declare-fun res!872176 () Bool)

(assert (=> b!1313728 (=> (not res!872176) (not e!749353))))

(declare-datatypes ((List!30135 0))(
  ( (Nil!30132) (Cons!30131 (h!31340 (_ BitVec 64)) (t!43741 List!30135)) )
))
(declare-fun arrayNoDuplicates!0 (array!88032 (_ BitVec 32) List!30135) Bool)

(assert (=> b!1313728 (= res!872176 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30132))))

(declare-fun b!1313729 () Bool)

(declare-fun e!749354 () Bool)

(declare-fun tp_is_empty!35529 () Bool)

(assert (=> b!1313729 (= e!749354 tp_is_empty!35529)))

(declare-fun b!1313730 () Bool)

(declare-fun res!872177 () Bool)

(assert (=> b!1313730 (=> (not res!872177) (not e!749353))))

(assert (=> b!1313730 (= res!872177 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43046 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!872178 () Bool)

(assert (=> start!110964 (=> (not res!872178) (not e!749353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110964 (= res!872178 (validMask!0 mask!2040))))

(assert (=> start!110964 e!749353))

(assert (=> start!110964 tp!104719))

(declare-fun array_inv!32099 (array!88032) Bool)

(assert (=> start!110964 (array_inv!32099 _keys!1628)))

(assert (=> start!110964 true))

(assert (=> start!110964 tp_is_empty!35529))

(declare-fun e!749357 () Bool)

(declare-fun array_inv!32100 (array!88034) Bool)

(assert (=> start!110964 (and (array_inv!32100 _values!1354) e!749357)))

(declare-fun b!1313731 () Bool)

(declare-fun e!749355 () Bool)

(assert (=> b!1313731 (= e!749355 tp_is_empty!35529)))

(declare-fun mapNonEmpty!54922 () Bool)

(declare-fun tp!104718 () Bool)

(assert (=> mapNonEmpty!54922 (= mapRes!54922 (and tp!104718 e!749354))))

(declare-fun mapRest!54922 () (Array (_ BitVec 32) ValueCell!16866))

(declare-fun mapValue!54922 () ValueCell!16866)

(declare-fun mapKey!54922 () (_ BitVec 32))

(assert (=> mapNonEmpty!54922 (= (arr!42497 _values!1354) (store mapRest!54922 mapKey!54922 mapValue!54922))))

(declare-fun b!1313732 () Bool)

(assert (=> b!1313732 (= e!749357 (and e!749355 mapRes!54922))))

(declare-fun condMapEmpty!54922 () Bool)

(declare-fun mapDefault!54922 () ValueCell!16866)

(assert (=> b!1313732 (= condMapEmpty!54922 (= (arr!42497 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16866)) mapDefault!54922)))))

(declare-fun b!1313733 () Bool)

(declare-fun res!872175 () Bool)

(assert (=> b!1313733 (=> (not res!872175) (not e!749353))))

(assert (=> b!1313733 (= res!872175 (and (= (size!43047 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43046 _keys!1628) (size!43047 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110964 res!872178) b!1313733))

(assert (= (and b!1313733 res!872175) b!1313726))

(assert (= (and b!1313726 res!872174) b!1313728))

(assert (= (and b!1313728 res!872176) b!1313730))

(assert (= (and b!1313730 res!872177) b!1313727))

(assert (= (and b!1313732 condMapEmpty!54922) mapIsEmpty!54922))

(assert (= (and b!1313732 (not condMapEmpty!54922)) mapNonEmpty!54922))

(get-info :version)

(assert (= (and mapNonEmpty!54922 ((_ is ValueCellFull!16866) mapValue!54922)) b!1313729))

(assert (= (and b!1313732 ((_ is ValueCellFull!16866) mapDefault!54922)) b!1313731))

(assert (= start!110964 b!1313732))

(declare-fun m!1202479 () Bool)

(assert (=> b!1313726 m!1202479))

(declare-fun m!1202481 () Bool)

(assert (=> mapNonEmpty!54922 m!1202481))

(declare-fun m!1202483 () Bool)

(assert (=> start!110964 m!1202483))

(declare-fun m!1202485 () Bool)

(assert (=> start!110964 m!1202485))

(declare-fun m!1202487 () Bool)

(assert (=> start!110964 m!1202487))

(declare-fun m!1202489 () Bool)

(assert (=> b!1313728 m!1202489))

(declare-fun m!1202491 () Bool)

(assert (=> b!1313727 m!1202491))

(assert (=> b!1313727 m!1202491))

(declare-fun m!1202493 () Bool)

(assert (=> b!1313727 m!1202493))

(check-sat b_and!48007 (not b_next!29799) tp_is_empty!35529 (not mapNonEmpty!54922) (not b!1313726) (not start!110964) (not b!1313727) (not b!1313728))
(check-sat b_and!48007 (not b_next!29799))
