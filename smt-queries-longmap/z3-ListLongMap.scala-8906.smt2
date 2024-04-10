; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108088 () Bool)

(assert start!108088)

(declare-fun b_free!27801 () Bool)

(declare-fun b_next!27801 () Bool)

(assert (=> start!108088 (= b_free!27801 (not b_next!27801))))

(declare-fun tp!98356 () Bool)

(declare-fun b_and!45857 () Bool)

(assert (=> start!108088 (= tp!98356 b_and!45857)))

(declare-fun b!1276481 () Bool)

(declare-fun e!728915 () Bool)

(assert (=> b!1276481 (= e!728915 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49571 0))(
  ( (V!49572 (val!16750 Int)) )
))
(declare-fun minValue!1129 () V!49571)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575494 () Bool)

(declare-datatypes ((ValueCell!15777 0))(
  ( (ValueCellFull!15777 (v!19347 V!49571)) (EmptyCell!15777) )
))
(declare-datatypes ((array!83796 0))(
  ( (array!83797 (arr!40409 (Array (_ BitVec 32) ValueCell!15777)) (size!40959 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83796)

(declare-fun zeroValue!1129 () V!49571)

(declare-datatypes ((array!83798 0))(
  ( (array!83799 (arr!40410 (Array (_ BitVec 32) (_ BitVec 64))) (size!40960 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83798)

(declare-datatypes ((tuple2!21484 0))(
  ( (tuple2!21485 (_1!10753 (_ BitVec 64)) (_2!10753 V!49571)) )
))
(declare-datatypes ((List!28658 0))(
  ( (Nil!28655) (Cons!28654 (h!29863 tuple2!21484) (t!42194 List!28658)) )
))
(declare-datatypes ((ListLongMap!19141 0))(
  ( (ListLongMap!19142 (toList!9586 List!28658)) )
))
(declare-fun contains!7695 (ListLongMap!19141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4670 (array!83798 array!83796 (_ BitVec 32) (_ BitVec 32) V!49571 V!49571 (_ BitVec 32) Int) ListLongMap!19141)

(assert (=> b!1276481 (= lt!575494 (contains!7695 (getCurrentListMap!4670 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51557 () Bool)

(declare-fun mapRes!51557 () Bool)

(assert (=> mapIsEmpty!51557 mapRes!51557))

(declare-fun b!1276482 () Bool)

(declare-fun e!728913 () Bool)

(declare-fun tp_is_empty!33351 () Bool)

(assert (=> b!1276482 (= e!728913 tp_is_empty!33351)))

(declare-fun b!1276483 () Bool)

(declare-fun res!848308 () Bool)

(assert (=> b!1276483 (=> (not res!848308) (not e!728915))))

(declare-datatypes ((List!28659 0))(
  ( (Nil!28656) (Cons!28655 (h!29864 (_ BitVec 64)) (t!42195 List!28659)) )
))
(declare-fun arrayNoDuplicates!0 (array!83798 (_ BitVec 32) List!28659) Bool)

(assert (=> b!1276483 (= res!848308 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28656))))

(declare-fun b!1276484 () Bool)

(declare-fun e!728912 () Bool)

(assert (=> b!1276484 (= e!728912 tp_is_empty!33351)))

(declare-fun b!1276485 () Bool)

(declare-fun res!848307 () Bool)

(assert (=> b!1276485 (=> (not res!848307) (not e!728915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83798 (_ BitVec 32)) Bool)

(assert (=> b!1276485 (= res!848307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276486 () Bool)

(declare-fun e!728916 () Bool)

(assert (=> b!1276486 (= e!728916 (and e!728912 mapRes!51557))))

(declare-fun condMapEmpty!51557 () Bool)

(declare-fun mapDefault!51557 () ValueCell!15777)

(assert (=> b!1276486 (= condMapEmpty!51557 (= (arr!40409 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15777)) mapDefault!51557)))))

(declare-fun res!848310 () Bool)

(assert (=> start!108088 (=> (not res!848310) (not e!728915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108088 (= res!848310 (validMask!0 mask!1805))))

(assert (=> start!108088 e!728915))

(assert (=> start!108088 true))

(assert (=> start!108088 tp!98356))

(assert (=> start!108088 tp_is_empty!33351))

(declare-fun array_inv!30711 (array!83796) Bool)

(assert (=> start!108088 (and (array_inv!30711 _values!1187) e!728916)))

(declare-fun array_inv!30712 (array!83798) Bool)

(assert (=> start!108088 (array_inv!30712 _keys!1427)))

(declare-fun mapNonEmpty!51557 () Bool)

(declare-fun tp!98357 () Bool)

(assert (=> mapNonEmpty!51557 (= mapRes!51557 (and tp!98357 e!728913))))

(declare-fun mapKey!51557 () (_ BitVec 32))

(declare-fun mapValue!51557 () ValueCell!15777)

(declare-fun mapRest!51557 () (Array (_ BitVec 32) ValueCell!15777))

(assert (=> mapNonEmpty!51557 (= (arr!40409 _values!1187) (store mapRest!51557 mapKey!51557 mapValue!51557))))

(declare-fun b!1276487 () Bool)

(declare-fun res!848309 () Bool)

(assert (=> b!1276487 (=> (not res!848309) (not e!728915))))

(assert (=> b!1276487 (= res!848309 (and (= (size!40959 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40960 _keys!1427) (size!40959 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108088 res!848310) b!1276487))

(assert (= (and b!1276487 res!848309) b!1276485))

(assert (= (and b!1276485 res!848307) b!1276483))

(assert (= (and b!1276483 res!848308) b!1276481))

(assert (= (and b!1276486 condMapEmpty!51557) mapIsEmpty!51557))

(assert (= (and b!1276486 (not condMapEmpty!51557)) mapNonEmpty!51557))

(get-info :version)

(assert (= (and mapNonEmpty!51557 ((_ is ValueCellFull!15777) mapValue!51557)) b!1276482))

(assert (= (and b!1276486 ((_ is ValueCellFull!15777) mapDefault!51557)) b!1276484))

(assert (= start!108088 b!1276486))

(declare-fun m!1172385 () Bool)

(assert (=> mapNonEmpty!51557 m!1172385))

(declare-fun m!1172387 () Bool)

(assert (=> b!1276481 m!1172387))

(assert (=> b!1276481 m!1172387))

(declare-fun m!1172389 () Bool)

(assert (=> b!1276481 m!1172389))

(declare-fun m!1172391 () Bool)

(assert (=> b!1276485 m!1172391))

(declare-fun m!1172393 () Bool)

(assert (=> start!108088 m!1172393))

(declare-fun m!1172395 () Bool)

(assert (=> start!108088 m!1172395))

(declare-fun m!1172397 () Bool)

(assert (=> start!108088 m!1172397))

(declare-fun m!1172399 () Bool)

(assert (=> b!1276483 m!1172399))

(check-sat (not b!1276483) b_and!45857 (not b!1276485) (not b_next!27801) (not b!1276481) (not start!108088) tp_is_empty!33351 (not mapNonEmpty!51557))
(check-sat b_and!45857 (not b_next!27801))
