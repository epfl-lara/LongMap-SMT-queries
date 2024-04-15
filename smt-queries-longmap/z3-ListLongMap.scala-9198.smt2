; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110536 () Bool)

(assert start!110536)

(declare-fun b_free!29371 () Bool)

(declare-fun b_next!29371 () Bool)

(assert (=> start!110536 (= b_free!29371 (not b_next!29371))))

(declare-fun tp!103436 () Bool)

(declare-fun b_and!47561 () Bool)

(assert (=> start!110536 (= tp!103436 b_and!47561)))

(declare-fun b!1307521 () Bool)

(declare-fun res!867940 () Bool)

(declare-fun e!746112 () Bool)

(assert (=> b!1307521 (=> (not res!867940) (not e!746112))))

(declare-datatypes ((array!87119 0))(
  ( (array!87120 (arr!42040 (Array (_ BitVec 32) (_ BitVec 64))) (size!42592 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87119)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87119 (_ BitVec 32)) Bool)

(assert (=> b!1307521 (= res!867940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307522 () Bool)

(declare-fun res!867937 () Bool)

(assert (=> b!1307522 (=> (not res!867937) (not e!746112))))

(declare-datatypes ((V!51905 0))(
  ( (V!51906 (val!17625 Int)) )
))
(declare-datatypes ((ValueCell!16652 0))(
  ( (ValueCellFull!16652 (v!20251 V!51905)) (EmptyCell!16652) )
))
(declare-datatypes ((array!87121 0))(
  ( (array!87122 (arr!42041 (Array (_ BitVec 32) ValueCell!16652)) (size!42593 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87121)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307522 (= res!867937 (and (= (size!42593 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42592 _keys!1628) (size!42593 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54280 () Bool)

(declare-fun mapRes!54280 () Bool)

(assert (=> mapIsEmpty!54280 mapRes!54280))

(declare-fun b!1307523 () Bool)

(assert (=> b!1307523 (= e!746112 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51905)

(declare-fun zeroValue!1296 () V!51905)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!584889 () Bool)

(declare-datatypes ((tuple2!22770 0))(
  ( (tuple2!22771 (_1!11396 (_ BitVec 64)) (_2!11396 V!51905)) )
))
(declare-datatypes ((List!29896 0))(
  ( (Nil!29893) (Cons!29892 (h!31101 tuple2!22770) (t!43494 List!29896)) )
))
(declare-datatypes ((ListLongMap!20427 0))(
  ( (ListLongMap!20428 (toList!10229 List!29896)) )
))
(declare-fun contains!8306 (ListLongMap!20427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5124 (array!87119 array!87121 (_ BitVec 32) (_ BitVec 32) V!51905 V!51905 (_ BitVec 32) Int) ListLongMap!20427)

(assert (=> b!1307523 (= lt!584889 (contains!8306 (getCurrentListMap!5124 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307524 () Bool)

(declare-fun e!746113 () Bool)

(declare-fun tp_is_empty!35101 () Bool)

(assert (=> b!1307524 (= e!746113 tp_is_empty!35101)))

(declare-fun res!867939 () Bool)

(assert (=> start!110536 (=> (not res!867939) (not e!746112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110536 (= res!867939 (validMask!0 mask!2040))))

(assert (=> start!110536 e!746112))

(assert (=> start!110536 tp!103436))

(declare-fun array_inv!31973 (array!87119) Bool)

(assert (=> start!110536 (array_inv!31973 _keys!1628)))

(assert (=> start!110536 true))

(assert (=> start!110536 tp_is_empty!35101))

(declare-fun e!746114 () Bool)

(declare-fun array_inv!31974 (array!87121) Bool)

(assert (=> start!110536 (and (array_inv!31974 _values!1354) e!746114)))

(declare-fun b!1307525 () Bool)

(declare-fun e!746110 () Bool)

(assert (=> b!1307525 (= e!746110 tp_is_empty!35101)))

(declare-fun b!1307526 () Bool)

(assert (=> b!1307526 (= e!746114 (and e!746110 mapRes!54280))))

(declare-fun condMapEmpty!54280 () Bool)

(declare-fun mapDefault!54280 () ValueCell!16652)

(assert (=> b!1307526 (= condMapEmpty!54280 (= (arr!42041 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16652)) mapDefault!54280)))))

(declare-fun b!1307527 () Bool)

(declare-fun res!867936 () Bool)

(assert (=> b!1307527 (=> (not res!867936) (not e!746112))))

(declare-datatypes ((List!29897 0))(
  ( (Nil!29894) (Cons!29893 (h!31102 (_ BitVec 64)) (t!43495 List!29897)) )
))
(declare-fun arrayNoDuplicates!0 (array!87119 (_ BitVec 32) List!29897) Bool)

(assert (=> b!1307527 (= res!867936 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29894))))

(declare-fun mapNonEmpty!54280 () Bool)

(declare-fun tp!103435 () Bool)

(assert (=> mapNonEmpty!54280 (= mapRes!54280 (and tp!103435 e!746113))))

(declare-fun mapValue!54280 () ValueCell!16652)

(declare-fun mapRest!54280 () (Array (_ BitVec 32) ValueCell!16652))

(declare-fun mapKey!54280 () (_ BitVec 32))

(assert (=> mapNonEmpty!54280 (= (arr!42041 _values!1354) (store mapRest!54280 mapKey!54280 mapValue!54280))))

(declare-fun b!1307528 () Bool)

(declare-fun res!867938 () Bool)

(assert (=> b!1307528 (=> (not res!867938) (not e!746112))))

(assert (=> b!1307528 (= res!867938 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42592 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110536 res!867939) b!1307522))

(assert (= (and b!1307522 res!867937) b!1307521))

(assert (= (and b!1307521 res!867940) b!1307527))

(assert (= (and b!1307527 res!867936) b!1307528))

(assert (= (and b!1307528 res!867938) b!1307523))

(assert (= (and b!1307526 condMapEmpty!54280) mapIsEmpty!54280))

(assert (= (and b!1307526 (not condMapEmpty!54280)) mapNonEmpty!54280))

(get-info :version)

(assert (= (and mapNonEmpty!54280 ((_ is ValueCellFull!16652) mapValue!54280)) b!1307524))

(assert (= (and b!1307526 ((_ is ValueCellFull!16652) mapDefault!54280)) b!1307525))

(assert (= start!110536 b!1307526))

(declare-fun m!1197717 () Bool)

(assert (=> b!1307521 m!1197717))

(declare-fun m!1197719 () Bool)

(assert (=> b!1307523 m!1197719))

(assert (=> b!1307523 m!1197719))

(declare-fun m!1197721 () Bool)

(assert (=> b!1307523 m!1197721))

(declare-fun m!1197723 () Bool)

(assert (=> start!110536 m!1197723))

(declare-fun m!1197725 () Bool)

(assert (=> start!110536 m!1197725))

(declare-fun m!1197727 () Bool)

(assert (=> start!110536 m!1197727))

(declare-fun m!1197729 () Bool)

(assert (=> mapNonEmpty!54280 m!1197729))

(declare-fun m!1197731 () Bool)

(assert (=> b!1307527 m!1197731))

(check-sat (not b!1307521) b_and!47561 (not b_next!29371) (not start!110536) (not mapNonEmpty!54280) (not b!1307527) tp_is_empty!35101 (not b!1307523))
(check-sat b_and!47561 (not b_next!29371))
