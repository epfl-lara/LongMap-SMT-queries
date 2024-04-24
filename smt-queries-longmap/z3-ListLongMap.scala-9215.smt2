; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110862 () Bool)

(assert start!110862)

(declare-fun b_free!29473 () Bool)

(declare-fun b_next!29473 () Bool)

(assert (=> start!110862 (= b_free!29473 (not b_next!29473))))

(declare-fun tp!103740 () Bool)

(declare-fun b_and!47683 () Bool)

(assert (=> start!110862 (= tp!103740 b_and!47683)))

(declare-fun b!1310438 () Bool)

(declare-fun e!747754 () Bool)

(assert (=> b!1310438 (= e!747754 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585704 () Bool)

(declare-datatypes ((array!87463 0))(
  ( (array!87464 (arr!42207 (Array (_ BitVec 32) (_ BitVec 64))) (size!42758 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87463)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52041 0))(
  ( (V!52042 (val!17676 Int)) )
))
(declare-fun minValue!1296 () V!52041)

(declare-datatypes ((ValueCell!16703 0))(
  ( (ValueCellFull!16703 (v!20298 V!52041)) (EmptyCell!16703) )
))
(declare-datatypes ((array!87465 0))(
  ( (array!87466 (arr!42208 (Array (_ BitVec 32) ValueCell!16703)) (size!42759 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87465)

(declare-fun zeroValue!1296 () V!52041)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22810 0))(
  ( (tuple2!22811 (_1!11416 (_ BitVec 64)) (_2!11416 V!52041)) )
))
(declare-datatypes ((List!29967 0))(
  ( (Nil!29964) (Cons!29963 (h!31181 tuple2!22810) (t!43565 List!29967)) )
))
(declare-datatypes ((ListLongMap!20475 0))(
  ( (ListLongMap!20476 (toList!10253 List!29967)) )
))
(declare-fun contains!8415 (ListLongMap!20475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5257 (array!87463 array!87465 (_ BitVec 32) (_ BitVec 32) V!52041 V!52041 (_ BitVec 32) Int) ListLongMap!20475)

(assert (=> b!1310438 (= lt!585704 (contains!8415 (getCurrentListMap!5257 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310439 () Bool)

(declare-fun res!869576 () Bool)

(assert (=> b!1310439 (=> (not res!869576) (not e!747754))))

(assert (=> b!1310439 (= res!869576 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42758 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54433 () Bool)

(declare-fun mapRes!54433 () Bool)

(assert (=> mapIsEmpty!54433 mapRes!54433))

(declare-fun b!1310440 () Bool)

(declare-fun res!869573 () Bool)

(assert (=> b!1310440 (=> (not res!869573) (not e!747754))))

(assert (=> b!1310440 (= res!869573 (and (= (size!42759 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42758 _keys!1628) (size!42759 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310441 () Bool)

(declare-fun res!869575 () Bool)

(assert (=> b!1310441 (=> (not res!869575) (not e!747754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87463 (_ BitVec 32)) Bool)

(assert (=> b!1310441 (= res!869575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310442 () Bool)

(declare-fun e!747753 () Bool)

(declare-fun e!747752 () Bool)

(assert (=> b!1310442 (= e!747753 (and e!747752 mapRes!54433))))

(declare-fun condMapEmpty!54433 () Bool)

(declare-fun mapDefault!54433 () ValueCell!16703)

(assert (=> b!1310442 (= condMapEmpty!54433 (= (arr!42208 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16703)) mapDefault!54433)))))

(declare-fun res!869574 () Bool)

(assert (=> start!110862 (=> (not res!869574) (not e!747754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110862 (= res!869574 (validMask!0 mask!2040))))

(assert (=> start!110862 e!747754))

(assert (=> start!110862 tp!103740))

(declare-fun array_inv!32161 (array!87463) Bool)

(assert (=> start!110862 (array_inv!32161 _keys!1628)))

(assert (=> start!110862 true))

(declare-fun tp_is_empty!35203 () Bool)

(assert (=> start!110862 tp_is_empty!35203))

(declare-fun array_inv!32162 (array!87465) Bool)

(assert (=> start!110862 (and (array_inv!32162 _values!1354) e!747753)))

(declare-fun b!1310443 () Bool)

(declare-fun res!869572 () Bool)

(assert (=> b!1310443 (=> (not res!869572) (not e!747754))))

(declare-datatypes ((List!29968 0))(
  ( (Nil!29965) (Cons!29964 (h!31182 (_ BitVec 64)) (t!43566 List!29968)) )
))
(declare-fun arrayNoDuplicates!0 (array!87463 (_ BitVec 32) List!29968) Bool)

(assert (=> b!1310443 (= res!869572 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29965))))

(declare-fun b!1310444 () Bool)

(assert (=> b!1310444 (= e!747752 tp_is_empty!35203)))

(declare-fun mapNonEmpty!54433 () Bool)

(declare-fun tp!103741 () Bool)

(declare-fun e!747755 () Bool)

(assert (=> mapNonEmpty!54433 (= mapRes!54433 (and tp!103741 e!747755))))

(declare-fun mapValue!54433 () ValueCell!16703)

(declare-fun mapKey!54433 () (_ BitVec 32))

(declare-fun mapRest!54433 () (Array (_ BitVec 32) ValueCell!16703))

(assert (=> mapNonEmpty!54433 (= (arr!42208 _values!1354) (store mapRest!54433 mapKey!54433 mapValue!54433))))

(declare-fun b!1310445 () Bool)

(assert (=> b!1310445 (= e!747755 tp_is_empty!35203)))

(assert (= (and start!110862 res!869574) b!1310440))

(assert (= (and b!1310440 res!869573) b!1310441))

(assert (= (and b!1310441 res!869575) b!1310443))

(assert (= (and b!1310443 res!869572) b!1310439))

(assert (= (and b!1310439 res!869576) b!1310438))

(assert (= (and b!1310442 condMapEmpty!54433) mapIsEmpty!54433))

(assert (= (and b!1310442 (not condMapEmpty!54433)) mapNonEmpty!54433))

(get-info :version)

(assert (= (and mapNonEmpty!54433 ((_ is ValueCellFull!16703) mapValue!54433)) b!1310445))

(assert (= (and b!1310442 ((_ is ValueCellFull!16703) mapDefault!54433)) b!1310444))

(assert (= start!110862 b!1310442))

(declare-fun m!1200917 () Bool)

(assert (=> b!1310443 m!1200917))

(declare-fun m!1200919 () Bool)

(assert (=> mapNonEmpty!54433 m!1200919))

(declare-fun m!1200921 () Bool)

(assert (=> start!110862 m!1200921))

(declare-fun m!1200923 () Bool)

(assert (=> start!110862 m!1200923))

(declare-fun m!1200925 () Bool)

(assert (=> start!110862 m!1200925))

(declare-fun m!1200927 () Bool)

(assert (=> b!1310438 m!1200927))

(assert (=> b!1310438 m!1200927))

(declare-fun m!1200929 () Bool)

(assert (=> b!1310438 m!1200929))

(declare-fun m!1200931 () Bool)

(assert (=> b!1310441 m!1200931))

(check-sat (not mapNonEmpty!54433) (not b!1310441) (not start!110862) b_and!47683 (not b!1310438) (not b_next!29473) tp_is_empty!35203 (not b!1310443))
(check-sat b_and!47683 (not b_next!29473))
