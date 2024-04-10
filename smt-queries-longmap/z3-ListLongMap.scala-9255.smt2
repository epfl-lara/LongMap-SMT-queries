; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110880 () Bool)

(assert start!110880)

(declare-fun b_free!29715 () Bool)

(declare-fun b_next!29715 () Bool)

(assert (=> start!110880 (= b_free!29715 (not b_next!29715))))

(declare-fun tp!104467 () Bool)

(declare-fun b_and!47923 () Bool)

(assert (=> start!110880 (= tp!104467 b_and!47923)))

(declare-fun b!1312691 () Bool)

(declare-fun res!871517 () Bool)

(declare-fun e!748725 () Bool)

(assert (=> b!1312691 (=> (not res!871517) (not e!748725))))

(declare-datatypes ((array!87872 0))(
  ( (array!87873 (arr!42416 (Array (_ BitVec 32) (_ BitVec 64))) (size!42966 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87872)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87872 (_ BitVec 32)) Bool)

(assert (=> b!1312691 (= res!871517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54796 () Bool)

(declare-fun mapRes!54796 () Bool)

(assert (=> mapIsEmpty!54796 mapRes!54796))

(declare-fun mapNonEmpty!54796 () Bool)

(declare-fun tp!104466 () Bool)

(declare-fun e!748727 () Bool)

(assert (=> mapNonEmpty!54796 (= mapRes!54796 (and tp!104466 e!748727))))

(declare-datatypes ((V!52363 0))(
  ( (V!52364 (val!17797 Int)) )
))
(declare-datatypes ((ValueCell!16824 0))(
  ( (ValueCellFull!16824 (v!20424 V!52363)) (EmptyCell!16824) )
))
(declare-fun mapValue!54796 () ValueCell!16824)

(declare-datatypes ((array!87874 0))(
  ( (array!87875 (arr!42417 (Array (_ BitVec 32) ValueCell!16824)) (size!42967 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87874)

(declare-fun mapRest!54796 () (Array (_ BitVec 32) ValueCell!16824))

(declare-fun mapKey!54796 () (_ BitVec 32))

(assert (=> mapNonEmpty!54796 (= (arr!42417 _values!1354) (store mapRest!54796 mapKey!54796 mapValue!54796))))

(declare-fun b!1312692 () Bool)

(assert (=> b!1312692 (= e!748725 false)))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52363)

(declare-fun zeroValue!1296 () V!52363)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585591 () Bool)

(declare-datatypes ((tuple2!22940 0))(
  ( (tuple2!22941 (_1!11481 (_ BitVec 64)) (_2!11481 V!52363)) )
))
(declare-datatypes ((List!30078 0))(
  ( (Nil!30075) (Cons!30074 (h!31283 tuple2!22940) (t!43684 List!30078)) )
))
(declare-datatypes ((ListLongMap!20597 0))(
  ( (ListLongMap!20598 (toList!10314 List!30078)) )
))
(declare-fun contains!8464 (ListLongMap!20597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5327 (array!87872 array!87874 (_ BitVec 32) (_ BitVec 32) V!52363 V!52363 (_ BitVec 32) Int) ListLongMap!20597)

(assert (=> b!1312692 (= lt!585591 (contains!8464 (getCurrentListMap!5327 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312693 () Bool)

(declare-fun res!871518 () Bool)

(assert (=> b!1312693 (=> (not res!871518) (not e!748725))))

(assert (=> b!1312693 (= res!871518 (and (= (size!42967 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42966 _keys!1628) (size!42967 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312694 () Bool)

(declare-fun e!748723 () Bool)

(declare-fun tp_is_empty!35445 () Bool)

(assert (=> b!1312694 (= e!748723 tp_is_empty!35445)))

(declare-fun res!871519 () Bool)

(assert (=> start!110880 (=> (not res!871519) (not e!748725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110880 (= res!871519 (validMask!0 mask!2040))))

(assert (=> start!110880 e!748725))

(assert (=> start!110880 tp!104467))

(declare-fun array_inv!32045 (array!87872) Bool)

(assert (=> start!110880 (array_inv!32045 _keys!1628)))

(assert (=> start!110880 true))

(assert (=> start!110880 tp_is_empty!35445))

(declare-fun e!748724 () Bool)

(declare-fun array_inv!32046 (array!87874) Bool)

(assert (=> start!110880 (and (array_inv!32046 _values!1354) e!748724)))

(declare-fun b!1312695 () Bool)

(assert (=> b!1312695 (= e!748727 tp_is_empty!35445)))

(declare-fun b!1312696 () Bool)

(assert (=> b!1312696 (= e!748724 (and e!748723 mapRes!54796))))

(declare-fun condMapEmpty!54796 () Bool)

(declare-fun mapDefault!54796 () ValueCell!16824)

(assert (=> b!1312696 (= condMapEmpty!54796 (= (arr!42417 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16824)) mapDefault!54796)))))

(declare-fun b!1312697 () Bool)

(declare-fun res!871521 () Bool)

(assert (=> b!1312697 (=> (not res!871521) (not e!748725))))

(declare-datatypes ((List!30079 0))(
  ( (Nil!30076) (Cons!30075 (h!31284 (_ BitVec 64)) (t!43685 List!30079)) )
))
(declare-fun arrayNoDuplicates!0 (array!87872 (_ BitVec 32) List!30079) Bool)

(assert (=> b!1312697 (= res!871521 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30076))))

(declare-fun b!1312698 () Bool)

(declare-fun res!871520 () Bool)

(assert (=> b!1312698 (=> (not res!871520) (not e!748725))))

(assert (=> b!1312698 (= res!871520 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42966 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110880 res!871519) b!1312693))

(assert (= (and b!1312693 res!871518) b!1312691))

(assert (= (and b!1312691 res!871517) b!1312697))

(assert (= (and b!1312697 res!871521) b!1312698))

(assert (= (and b!1312698 res!871520) b!1312692))

(assert (= (and b!1312696 condMapEmpty!54796) mapIsEmpty!54796))

(assert (= (and b!1312696 (not condMapEmpty!54796)) mapNonEmpty!54796))

(get-info :version)

(assert (= (and mapNonEmpty!54796 ((_ is ValueCellFull!16824) mapValue!54796)) b!1312695))

(assert (= (and b!1312696 ((_ is ValueCellFull!16824) mapDefault!54796)) b!1312694))

(assert (= start!110880 b!1312696))

(declare-fun m!1201795 () Bool)

(assert (=> b!1312691 m!1201795))

(declare-fun m!1201797 () Bool)

(assert (=> b!1312692 m!1201797))

(assert (=> b!1312692 m!1201797))

(declare-fun m!1201799 () Bool)

(assert (=> b!1312692 m!1201799))

(declare-fun m!1201801 () Bool)

(assert (=> mapNonEmpty!54796 m!1201801))

(declare-fun m!1201803 () Bool)

(assert (=> b!1312697 m!1201803))

(declare-fun m!1201805 () Bool)

(assert (=> start!110880 m!1201805))

(declare-fun m!1201807 () Bool)

(assert (=> start!110880 m!1201807))

(declare-fun m!1201809 () Bool)

(assert (=> start!110880 m!1201809))

(check-sat (not b_next!29715) (not b!1312692) (not b!1312697) b_and!47923 (not mapNonEmpty!54796) (not b!1312691) tp_is_empty!35445 (not start!110880))
(check-sat b_and!47923 (not b_next!29715))
