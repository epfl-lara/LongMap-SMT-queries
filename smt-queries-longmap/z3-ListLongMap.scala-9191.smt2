; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110496 () Bool)

(assert start!110496)

(declare-fun b_free!29331 () Bool)

(declare-fun b_next!29331 () Bool)

(assert (=> start!110496 (= b_free!29331 (not b_next!29331))))

(declare-fun tp!103315 () Bool)

(declare-fun b_and!47539 () Bool)

(assert (=> start!110496 (= tp!103315 b_and!47539)))

(declare-fun b!1307111 () Bool)

(declare-fun res!867665 () Bool)

(declare-fun e!745843 () Bool)

(assert (=> b!1307111 (=> (not res!867665) (not e!745843))))

(declare-datatypes ((array!87128 0))(
  ( (array!87129 (arr!42044 (Array (_ BitVec 32) (_ BitVec 64))) (size!42594 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87128)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51851 0))(
  ( (V!51852 (val!17605 Int)) )
))
(declare-datatypes ((ValueCell!16632 0))(
  ( (ValueCellFull!16632 (v!20232 V!51851)) (EmptyCell!16632) )
))
(declare-datatypes ((array!87130 0))(
  ( (array!87131 (arr!42045 (Array (_ BitVec 32) ValueCell!16632)) (size!42595 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87130)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307111 (= res!867665 (and (= (size!42595 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42594 _keys!1628) (size!42595 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307112 () Bool)

(declare-fun res!867668 () Bool)

(assert (=> b!1307112 (=> (not res!867668) (not e!745843))))

(declare-datatypes ((List!29809 0))(
  ( (Nil!29806) (Cons!29805 (h!31014 (_ BitVec 64)) (t!43415 List!29809)) )
))
(declare-fun arrayNoDuplicates!0 (array!87128 (_ BitVec 32) List!29809) Bool)

(assert (=> b!1307112 (= res!867668 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29806))))

(declare-fun mapNonEmpty!54220 () Bool)

(declare-fun mapRes!54220 () Bool)

(declare-fun tp!103314 () Bool)

(declare-fun e!745847 () Bool)

(assert (=> mapNonEmpty!54220 (= mapRes!54220 (and tp!103314 e!745847))))

(declare-fun mapKey!54220 () (_ BitVec 32))

(declare-fun mapValue!54220 () ValueCell!16632)

(declare-fun mapRest!54220 () (Array (_ BitVec 32) ValueCell!16632))

(assert (=> mapNonEmpty!54220 (= (arr!42045 _values!1354) (store mapRest!54220 mapKey!54220 mapValue!54220))))

(declare-fun b!1307113 () Bool)

(assert (=> b!1307113 (= e!745843 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585015 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51851)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!51851)

(declare-datatypes ((tuple2!22668 0))(
  ( (tuple2!22669 (_1!11345 (_ BitVec 64)) (_2!11345 V!51851)) )
))
(declare-datatypes ((List!29810 0))(
  ( (Nil!29807) (Cons!29806 (h!31015 tuple2!22668) (t!43416 List!29810)) )
))
(declare-datatypes ((ListLongMap!20325 0))(
  ( (ListLongMap!20326 (toList!10178 List!29810)) )
))
(declare-fun contains!8328 (ListLongMap!20325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5191 (array!87128 array!87130 (_ BitVec 32) (_ BitVec 32) V!51851 V!51851 (_ BitVec 32) Int) ListLongMap!20325)

(assert (=> b!1307113 (= lt!585015 (contains!8328 (getCurrentListMap!5191 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!867666 () Bool)

(assert (=> start!110496 (=> (not res!867666) (not e!745843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110496 (= res!867666 (validMask!0 mask!2040))))

(assert (=> start!110496 e!745843))

(assert (=> start!110496 tp!103315))

(declare-fun array_inv!31783 (array!87128) Bool)

(assert (=> start!110496 (array_inv!31783 _keys!1628)))

(assert (=> start!110496 true))

(declare-fun tp_is_empty!35061 () Bool)

(assert (=> start!110496 tp_is_empty!35061))

(declare-fun e!745846 () Bool)

(declare-fun array_inv!31784 (array!87130) Bool)

(assert (=> start!110496 (and (array_inv!31784 _values!1354) e!745846)))

(declare-fun b!1307114 () Bool)

(declare-fun e!745844 () Bool)

(assert (=> b!1307114 (= e!745844 tp_is_empty!35061)))

(declare-fun b!1307115 () Bool)

(assert (=> b!1307115 (= e!745847 tp_is_empty!35061)))

(declare-fun b!1307116 () Bool)

(assert (=> b!1307116 (= e!745846 (and e!745844 mapRes!54220))))

(declare-fun condMapEmpty!54220 () Bool)

(declare-fun mapDefault!54220 () ValueCell!16632)

(assert (=> b!1307116 (= condMapEmpty!54220 (= (arr!42045 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16632)) mapDefault!54220)))))

(declare-fun mapIsEmpty!54220 () Bool)

(assert (=> mapIsEmpty!54220 mapRes!54220))

(declare-fun b!1307117 () Bool)

(declare-fun res!867669 () Bool)

(assert (=> b!1307117 (=> (not res!867669) (not e!745843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87128 (_ BitVec 32)) Bool)

(assert (=> b!1307117 (= res!867669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307118 () Bool)

(declare-fun res!867667 () Bool)

(assert (=> b!1307118 (=> (not res!867667) (not e!745843))))

(assert (=> b!1307118 (= res!867667 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42594 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110496 res!867666) b!1307111))

(assert (= (and b!1307111 res!867665) b!1307117))

(assert (= (and b!1307117 res!867669) b!1307112))

(assert (= (and b!1307112 res!867668) b!1307118))

(assert (= (and b!1307118 res!867667) b!1307113))

(assert (= (and b!1307116 condMapEmpty!54220) mapIsEmpty!54220))

(assert (= (and b!1307116 (not condMapEmpty!54220)) mapNonEmpty!54220))

(get-info :version)

(assert (= (and mapNonEmpty!54220 ((_ is ValueCellFull!16632) mapValue!54220)) b!1307115))

(assert (= (and b!1307116 ((_ is ValueCellFull!16632) mapDefault!54220)) b!1307114))

(assert (= start!110496 b!1307116))

(declare-fun m!1197913 () Bool)

(assert (=> b!1307117 m!1197913))

(declare-fun m!1197915 () Bool)

(assert (=> b!1307112 m!1197915))

(declare-fun m!1197917 () Bool)

(assert (=> b!1307113 m!1197917))

(assert (=> b!1307113 m!1197917))

(declare-fun m!1197919 () Bool)

(assert (=> b!1307113 m!1197919))

(declare-fun m!1197921 () Bool)

(assert (=> start!110496 m!1197921))

(declare-fun m!1197923 () Bool)

(assert (=> start!110496 m!1197923))

(declare-fun m!1197925 () Bool)

(assert (=> start!110496 m!1197925))

(declare-fun m!1197927 () Bool)

(assert (=> mapNonEmpty!54220 m!1197927))

(check-sat (not b!1307113) (not start!110496) (not b!1307112) b_and!47539 (not b!1307117) (not mapNonEmpty!54220) tp_is_empty!35061 (not b_next!29331))
(check-sat b_and!47539 (not b_next!29331))
