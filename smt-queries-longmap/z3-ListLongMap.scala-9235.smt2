; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110758 () Bool)

(assert start!110758)

(declare-fun b_free!29593 () Bool)

(declare-fun b_next!29593 () Bool)

(assert (=> start!110758 (= b_free!29593 (not b_next!29593))))

(declare-fun tp!104102 () Bool)

(declare-fun b_and!47783 () Bool)

(assert (=> start!110758 (= tp!104102 b_and!47783)))

(declare-fun b!1310833 () Bool)

(declare-fun res!870249 () Bool)

(declare-fun e!747775 () Bool)

(assert (=> b!1310833 (=> (not res!870249) (not e!747775))))

(declare-datatypes ((array!87549 0))(
  ( (array!87550 (arr!42255 (Array (_ BitVec 32) (_ BitVec 64))) (size!42807 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87549)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87549 (_ BitVec 32)) Bool)

(assert (=> b!1310833 (= res!870249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310834 () Bool)

(declare-fun e!747776 () Bool)

(declare-fun e!747777 () Bool)

(declare-fun mapRes!54613 () Bool)

(assert (=> b!1310834 (= e!747776 (and e!747777 mapRes!54613))))

(declare-fun condMapEmpty!54613 () Bool)

(declare-datatypes ((V!52201 0))(
  ( (V!52202 (val!17736 Int)) )
))
(declare-datatypes ((ValueCell!16763 0))(
  ( (ValueCellFull!16763 (v!20362 V!52201)) (EmptyCell!16763) )
))
(declare-datatypes ((array!87551 0))(
  ( (array!87552 (arr!42256 (Array (_ BitVec 32) ValueCell!16763)) (size!42808 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87551)

(declare-fun mapDefault!54613 () ValueCell!16763)

(assert (=> b!1310834 (= condMapEmpty!54613 (= (arr!42256 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16763)) mapDefault!54613)))))

(declare-fun res!870250 () Bool)

(assert (=> start!110758 (=> (not res!870250) (not e!747775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110758 (= res!870250 (validMask!0 mask!2040))))

(assert (=> start!110758 e!747775))

(assert (=> start!110758 tp!104102))

(declare-fun array_inv!32115 (array!87549) Bool)

(assert (=> start!110758 (array_inv!32115 _keys!1628)))

(assert (=> start!110758 true))

(declare-fun tp_is_empty!35323 () Bool)

(assert (=> start!110758 tp_is_empty!35323))

(declare-fun array_inv!32116 (array!87551) Bool)

(assert (=> start!110758 (and (array_inv!32116 _values!1354) e!747776)))

(declare-fun b!1310835 () Bool)

(assert (=> b!1310835 (= e!747775 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52201)

(declare-fun zeroValue!1296 () V!52201)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585222 () Bool)

(declare-datatypes ((tuple2!22938 0))(
  ( (tuple2!22939 (_1!11480 (_ BitVec 64)) (_2!11480 V!52201)) )
))
(declare-datatypes ((List!30061 0))(
  ( (Nil!30058) (Cons!30057 (h!31266 tuple2!22938) (t!43659 List!30061)) )
))
(declare-datatypes ((ListLongMap!20595 0))(
  ( (ListLongMap!20596 (toList!10313 List!30061)) )
))
(declare-fun contains!8390 (ListLongMap!20595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5208 (array!87549 array!87551 (_ BitVec 32) (_ BitVec 32) V!52201 V!52201 (_ BitVec 32) Int) ListLongMap!20595)

(assert (=> b!1310835 (= lt!585222 (contains!8390 (getCurrentListMap!5208 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310836 () Bool)

(declare-fun res!870251 () Bool)

(assert (=> b!1310836 (=> (not res!870251) (not e!747775))))

(assert (=> b!1310836 (= res!870251 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42807 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310837 () Bool)

(declare-fun res!870253 () Bool)

(assert (=> b!1310837 (=> (not res!870253) (not e!747775))))

(assert (=> b!1310837 (= res!870253 (and (= (size!42808 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42807 _keys!1628) (size!42808 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310838 () Bool)

(declare-fun res!870252 () Bool)

(assert (=> b!1310838 (=> (not res!870252) (not e!747775))))

(declare-datatypes ((List!30062 0))(
  ( (Nil!30059) (Cons!30058 (h!31267 (_ BitVec 64)) (t!43660 List!30062)) )
))
(declare-fun arrayNoDuplicates!0 (array!87549 (_ BitVec 32) List!30062) Bool)

(assert (=> b!1310838 (= res!870252 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30059))))

(declare-fun mapIsEmpty!54613 () Bool)

(assert (=> mapIsEmpty!54613 mapRes!54613))

(declare-fun b!1310839 () Bool)

(assert (=> b!1310839 (= e!747777 tp_is_empty!35323)))

(declare-fun mapNonEmpty!54613 () Bool)

(declare-fun tp!104101 () Bool)

(declare-fun e!747778 () Bool)

(assert (=> mapNonEmpty!54613 (= mapRes!54613 (and tp!104101 e!747778))))

(declare-fun mapKey!54613 () (_ BitVec 32))

(declare-fun mapRest!54613 () (Array (_ BitVec 32) ValueCell!16763))

(declare-fun mapValue!54613 () ValueCell!16763)

(assert (=> mapNonEmpty!54613 (= (arr!42256 _values!1354) (store mapRest!54613 mapKey!54613 mapValue!54613))))

(declare-fun b!1310840 () Bool)

(assert (=> b!1310840 (= e!747778 tp_is_empty!35323)))

(assert (= (and start!110758 res!870250) b!1310837))

(assert (= (and b!1310837 res!870253) b!1310833))

(assert (= (and b!1310833 res!870249) b!1310838))

(assert (= (and b!1310838 res!870252) b!1310836))

(assert (= (and b!1310836 res!870251) b!1310835))

(assert (= (and b!1310834 condMapEmpty!54613) mapIsEmpty!54613))

(assert (= (and b!1310834 (not condMapEmpty!54613)) mapNonEmpty!54613))

(get-info :version)

(assert (= (and mapNonEmpty!54613 ((_ is ValueCellFull!16763) mapValue!54613)) b!1310840))

(assert (= (and b!1310834 ((_ is ValueCellFull!16763) mapDefault!54613)) b!1310839))

(assert (= start!110758 b!1310834))

(declare-fun m!1200033 () Bool)

(assert (=> start!110758 m!1200033))

(declare-fun m!1200035 () Bool)

(assert (=> start!110758 m!1200035))

(declare-fun m!1200037 () Bool)

(assert (=> start!110758 m!1200037))

(declare-fun m!1200039 () Bool)

(assert (=> mapNonEmpty!54613 m!1200039))

(declare-fun m!1200041 () Bool)

(assert (=> b!1310835 m!1200041))

(assert (=> b!1310835 m!1200041))

(declare-fun m!1200043 () Bool)

(assert (=> b!1310835 m!1200043))

(declare-fun m!1200045 () Bool)

(assert (=> b!1310838 m!1200045))

(declare-fun m!1200047 () Bool)

(assert (=> b!1310833 m!1200047))

(check-sat (not mapNonEmpty!54613) (not b_next!29593) b_and!47783 (not b!1310835) (not b!1310838) (not start!110758) tp_is_empty!35323 (not b!1310833))
(check-sat b_and!47783 (not b_next!29593))
