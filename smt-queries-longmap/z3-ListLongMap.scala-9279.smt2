; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111024 () Bool)

(assert start!111024)

(declare-fun b_free!29859 () Bool)

(declare-fun b_next!29859 () Bool)

(assert (=> start!111024 (= b_free!29859 (not b_next!29859))))

(declare-fun tp!104899 () Bool)

(declare-fun b_and!48067 () Bool)

(assert (=> start!111024 (= tp!104899 b_and!48067)))

(declare-fun b!1314482 () Bool)

(declare-fun e!749803 () Bool)

(declare-fun e!749805 () Bool)

(declare-fun mapRes!55012 () Bool)

(assert (=> b!1314482 (= e!749803 (and e!749805 mapRes!55012))))

(declare-fun condMapEmpty!55012 () Bool)

(declare-datatypes ((V!52555 0))(
  ( (V!52556 (val!17869 Int)) )
))
(declare-datatypes ((ValueCell!16896 0))(
  ( (ValueCellFull!16896 (v!20496 V!52555)) (EmptyCell!16896) )
))
(declare-datatypes ((array!88148 0))(
  ( (array!88149 (arr!42554 (Array (_ BitVec 32) ValueCell!16896)) (size!43104 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88148)

(declare-fun mapDefault!55012 () ValueCell!16896)

(assert (=> b!1314482 (= condMapEmpty!55012 (= (arr!42554 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16896)) mapDefault!55012)))))

(declare-fun mapIsEmpty!55012 () Bool)

(assert (=> mapIsEmpty!55012 mapRes!55012))

(declare-fun b!1314483 () Bool)

(declare-fun e!749804 () Bool)

(declare-fun tp_is_empty!35589 () Bool)

(assert (=> b!1314483 (= e!749804 tp_is_empty!35589)))

(declare-fun b!1314484 () Bool)

(declare-fun res!872663 () Bool)

(declare-fun e!749806 () Bool)

(assert (=> b!1314484 (=> (not res!872663) (not e!749806))))

(declare-datatypes ((array!88150 0))(
  ( (array!88151 (arr!42555 (Array (_ BitVec 32) (_ BitVec 64))) (size!43105 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88150)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314484 (= res!872663 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43105 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314485 () Bool)

(assert (=> b!1314485 (= e!749806 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52555)

(declare-fun lt!585798 () Bool)

(declare-fun zeroValue!1296 () V!52555)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23042 0))(
  ( (tuple2!23043 (_1!11532 (_ BitVec 64)) (_2!11532 V!52555)) )
))
(declare-datatypes ((List!30179 0))(
  ( (Nil!30176) (Cons!30175 (h!31384 tuple2!23042) (t!43785 List!30179)) )
))
(declare-datatypes ((ListLongMap!20699 0))(
  ( (ListLongMap!20700 (toList!10365 List!30179)) )
))
(declare-fun contains!8515 (ListLongMap!20699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5378 (array!88150 array!88148 (_ BitVec 32) (_ BitVec 32) V!52555 V!52555 (_ BitVec 32) Int) ListLongMap!20699)

(assert (=> b!1314485 (= lt!585798 (contains!8515 (getCurrentListMap!5378 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314486 () Bool)

(assert (=> b!1314486 (= e!749805 tp_is_empty!35589)))

(declare-fun res!872660 () Bool)

(assert (=> start!111024 (=> (not res!872660) (not e!749806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111024 (= res!872660 (validMask!0 mask!2040))))

(assert (=> start!111024 e!749806))

(assert (=> start!111024 tp!104899))

(declare-fun array_inv!32139 (array!88150) Bool)

(assert (=> start!111024 (array_inv!32139 _keys!1628)))

(assert (=> start!111024 true))

(assert (=> start!111024 tp_is_empty!35589))

(declare-fun array_inv!32140 (array!88148) Bool)

(assert (=> start!111024 (and (array_inv!32140 _values!1354) e!749803)))

(declare-fun b!1314487 () Bool)

(declare-fun res!872662 () Bool)

(assert (=> b!1314487 (=> (not res!872662) (not e!749806))))

(assert (=> b!1314487 (= res!872662 (and (= (size!43104 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43105 _keys!1628) (size!43104 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314488 () Bool)

(declare-fun res!872664 () Bool)

(assert (=> b!1314488 (=> (not res!872664) (not e!749806))))

(declare-datatypes ((List!30180 0))(
  ( (Nil!30177) (Cons!30176 (h!31385 (_ BitVec 64)) (t!43786 List!30180)) )
))
(declare-fun arrayNoDuplicates!0 (array!88150 (_ BitVec 32) List!30180) Bool)

(assert (=> b!1314488 (= res!872664 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30177))))

(declare-fun mapNonEmpty!55012 () Bool)

(declare-fun tp!104898 () Bool)

(assert (=> mapNonEmpty!55012 (= mapRes!55012 (and tp!104898 e!749804))))

(declare-fun mapKey!55012 () (_ BitVec 32))

(declare-fun mapRest!55012 () (Array (_ BitVec 32) ValueCell!16896))

(declare-fun mapValue!55012 () ValueCell!16896)

(assert (=> mapNonEmpty!55012 (= (arr!42554 _values!1354) (store mapRest!55012 mapKey!55012 mapValue!55012))))

(declare-fun b!1314489 () Bool)

(declare-fun res!872661 () Bool)

(assert (=> b!1314489 (=> (not res!872661) (not e!749806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88150 (_ BitVec 32)) Bool)

(assert (=> b!1314489 (= res!872661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111024 res!872660) b!1314487))

(assert (= (and b!1314487 res!872662) b!1314489))

(assert (= (and b!1314489 res!872661) b!1314488))

(assert (= (and b!1314488 res!872664) b!1314484))

(assert (= (and b!1314484 res!872663) b!1314485))

(assert (= (and b!1314482 condMapEmpty!55012) mapIsEmpty!55012))

(assert (= (and b!1314482 (not condMapEmpty!55012)) mapNonEmpty!55012))

(get-info :version)

(assert (= (and mapNonEmpty!55012 ((_ is ValueCellFull!16896) mapValue!55012)) b!1314483))

(assert (= (and b!1314482 ((_ is ValueCellFull!16896) mapDefault!55012)) b!1314486))

(assert (= start!111024 b!1314482))

(declare-fun m!1202989 () Bool)

(assert (=> b!1314489 m!1202989))

(declare-fun m!1202991 () Bool)

(assert (=> b!1314485 m!1202991))

(assert (=> b!1314485 m!1202991))

(declare-fun m!1202993 () Bool)

(assert (=> b!1314485 m!1202993))

(declare-fun m!1202995 () Bool)

(assert (=> mapNonEmpty!55012 m!1202995))

(declare-fun m!1202997 () Bool)

(assert (=> b!1314488 m!1202997))

(declare-fun m!1202999 () Bool)

(assert (=> start!111024 m!1202999))

(declare-fun m!1203001 () Bool)

(assert (=> start!111024 m!1203001))

(declare-fun m!1203003 () Bool)

(assert (=> start!111024 m!1203003))

(check-sat (not b!1314488) b_and!48067 (not start!111024) (not b!1314485) (not b_next!29859) (not b!1314489) tp_is_empty!35589 (not mapNonEmpty!55012))
(check-sat b_and!48067 (not b_next!29859))
