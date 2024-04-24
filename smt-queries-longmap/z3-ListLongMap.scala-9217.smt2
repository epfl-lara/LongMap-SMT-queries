; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110874 () Bool)

(assert start!110874)

(declare-fun b_free!29485 () Bool)

(declare-fun b_next!29485 () Bool)

(assert (=> start!110874 (= b_free!29485 (not b_next!29485))))

(declare-fun tp!103776 () Bool)

(declare-fun b_and!47695 () Bool)

(assert (=> start!110874 (= tp!103776 b_and!47695)))

(declare-fun res!869664 () Bool)

(declare-fun e!747841 () Bool)

(assert (=> start!110874 (=> (not res!869664) (not e!747841))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110874 (= res!869664 (validMask!0 mask!2040))))

(assert (=> start!110874 e!747841))

(assert (=> start!110874 tp!103776))

(declare-datatypes ((array!87487 0))(
  ( (array!87488 (arr!42219 (Array (_ BitVec 32) (_ BitVec 64))) (size!42770 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87487)

(declare-fun array_inv!32171 (array!87487) Bool)

(assert (=> start!110874 (array_inv!32171 _keys!1628)))

(assert (=> start!110874 true))

(declare-fun tp_is_empty!35215 () Bool)

(assert (=> start!110874 tp_is_empty!35215))

(declare-datatypes ((V!52057 0))(
  ( (V!52058 (val!17682 Int)) )
))
(declare-datatypes ((ValueCell!16709 0))(
  ( (ValueCellFull!16709 (v!20304 V!52057)) (EmptyCell!16709) )
))
(declare-datatypes ((array!87489 0))(
  ( (array!87490 (arr!42220 (Array (_ BitVec 32) ValueCell!16709)) (size!42771 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87489)

(declare-fun e!747843 () Bool)

(declare-fun array_inv!32172 (array!87489) Bool)

(assert (=> start!110874 (and (array_inv!32172 _values!1354) e!747843)))

(declare-fun b!1310582 () Bool)

(declare-fun e!747845 () Bool)

(declare-fun mapRes!54451 () Bool)

(assert (=> b!1310582 (= e!747843 (and e!747845 mapRes!54451))))

(declare-fun condMapEmpty!54451 () Bool)

(declare-fun mapDefault!54451 () ValueCell!16709)

(assert (=> b!1310582 (= condMapEmpty!54451 (= (arr!42220 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16709)) mapDefault!54451)))))

(declare-fun b!1310583 () Bool)

(declare-fun res!869665 () Bool)

(assert (=> b!1310583 (=> (not res!869665) (not e!747841))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310583 (= res!869665 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42770 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54451 () Bool)

(assert (=> mapIsEmpty!54451 mapRes!54451))

(declare-fun b!1310584 () Bool)

(assert (=> b!1310584 (= e!747841 false)))

(declare-fun lt!585722 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52057)

(declare-fun zeroValue!1296 () V!52057)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22816 0))(
  ( (tuple2!22817 (_1!11419 (_ BitVec 64)) (_2!11419 V!52057)) )
))
(declare-datatypes ((List!29976 0))(
  ( (Nil!29973) (Cons!29972 (h!31190 tuple2!22816) (t!43574 List!29976)) )
))
(declare-datatypes ((ListLongMap!20481 0))(
  ( (ListLongMap!20482 (toList!10256 List!29976)) )
))
(declare-fun contains!8418 (ListLongMap!20481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5260 (array!87487 array!87489 (_ BitVec 32) (_ BitVec 32) V!52057 V!52057 (_ BitVec 32) Int) ListLongMap!20481)

(assert (=> b!1310584 (= lt!585722 (contains!8418 (getCurrentListMap!5260 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310585 () Bool)

(declare-fun res!869662 () Bool)

(assert (=> b!1310585 (=> (not res!869662) (not e!747841))))

(declare-datatypes ((List!29977 0))(
  ( (Nil!29974) (Cons!29973 (h!31191 (_ BitVec 64)) (t!43575 List!29977)) )
))
(declare-fun arrayNoDuplicates!0 (array!87487 (_ BitVec 32) List!29977) Bool)

(assert (=> b!1310585 (= res!869662 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29974))))

(declare-fun mapNonEmpty!54451 () Bool)

(declare-fun tp!103777 () Bool)

(declare-fun e!747842 () Bool)

(assert (=> mapNonEmpty!54451 (= mapRes!54451 (and tp!103777 e!747842))))

(declare-fun mapRest!54451 () (Array (_ BitVec 32) ValueCell!16709))

(declare-fun mapKey!54451 () (_ BitVec 32))

(declare-fun mapValue!54451 () ValueCell!16709)

(assert (=> mapNonEmpty!54451 (= (arr!42220 _values!1354) (store mapRest!54451 mapKey!54451 mapValue!54451))))

(declare-fun b!1310586 () Bool)

(assert (=> b!1310586 (= e!747842 tp_is_empty!35215)))

(declare-fun b!1310587 () Bool)

(assert (=> b!1310587 (= e!747845 tp_is_empty!35215)))

(declare-fun b!1310588 () Bool)

(declare-fun res!869663 () Bool)

(assert (=> b!1310588 (=> (not res!869663) (not e!747841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87487 (_ BitVec 32)) Bool)

(assert (=> b!1310588 (= res!869663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310589 () Bool)

(declare-fun res!869666 () Bool)

(assert (=> b!1310589 (=> (not res!869666) (not e!747841))))

(assert (=> b!1310589 (= res!869666 (and (= (size!42771 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42770 _keys!1628) (size!42771 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110874 res!869664) b!1310589))

(assert (= (and b!1310589 res!869666) b!1310588))

(assert (= (and b!1310588 res!869663) b!1310585))

(assert (= (and b!1310585 res!869662) b!1310583))

(assert (= (and b!1310583 res!869665) b!1310584))

(assert (= (and b!1310582 condMapEmpty!54451) mapIsEmpty!54451))

(assert (= (and b!1310582 (not condMapEmpty!54451)) mapNonEmpty!54451))

(get-info :version)

(assert (= (and mapNonEmpty!54451 ((_ is ValueCellFull!16709) mapValue!54451)) b!1310586))

(assert (= (and b!1310582 ((_ is ValueCellFull!16709) mapDefault!54451)) b!1310587))

(assert (= start!110874 b!1310582))

(declare-fun m!1201013 () Bool)

(assert (=> b!1310585 m!1201013))

(declare-fun m!1201015 () Bool)

(assert (=> mapNonEmpty!54451 m!1201015))

(declare-fun m!1201017 () Bool)

(assert (=> b!1310588 m!1201017))

(declare-fun m!1201019 () Bool)

(assert (=> b!1310584 m!1201019))

(assert (=> b!1310584 m!1201019))

(declare-fun m!1201021 () Bool)

(assert (=> b!1310584 m!1201021))

(declare-fun m!1201023 () Bool)

(assert (=> start!110874 m!1201023))

(declare-fun m!1201025 () Bool)

(assert (=> start!110874 m!1201025))

(declare-fun m!1201027 () Bool)

(assert (=> start!110874 m!1201027))

(check-sat (not b!1310584) (not b_next!29485) tp_is_empty!35215 b_and!47695 (not b!1310585) (not mapNonEmpty!54451) (not b!1310588) (not start!110874))
(check-sat b_and!47695 (not b_next!29485))
