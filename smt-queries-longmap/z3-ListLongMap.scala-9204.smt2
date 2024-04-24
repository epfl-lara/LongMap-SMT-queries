; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110796 () Bool)

(assert start!110796)

(declare-fun b_free!29407 () Bool)

(declare-fun b_next!29407 () Bool)

(assert (=> start!110796 (= b_free!29407 (not b_next!29407))))

(declare-fun tp!103543 () Bool)

(declare-fun b_and!47617 () Bool)

(assert (=> start!110796 (= tp!103543 b_and!47617)))

(declare-fun b!1309402 () Bool)

(declare-fun res!868835 () Bool)

(declare-fun e!747259 () Bool)

(assert (=> b!1309402 (=> (not res!868835) (not e!747259))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51953 0))(
  ( (V!51954 (val!17643 Int)) )
))
(declare-fun minValue!1296 () V!51953)

(declare-datatypes ((ValueCell!16670 0))(
  ( (ValueCellFull!16670 (v!20265 V!51953)) (EmptyCell!16670) )
))
(declare-datatypes ((array!87331 0))(
  ( (array!87332 (arr!42141 (Array (_ BitVec 32) ValueCell!16670)) (size!42692 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87331)

(declare-fun zeroValue!1296 () V!51953)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((array!87333 0))(
  ( (array!87334 (arr!42142 (Array (_ BitVec 32) (_ BitVec 64))) (size!42693 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87333)

(declare-datatypes ((tuple2!22750 0))(
  ( (tuple2!22751 (_1!11386 (_ BitVec 64)) (_2!11386 V!51953)) )
))
(declare-datatypes ((List!29913 0))(
  ( (Nil!29910) (Cons!29909 (h!31127 tuple2!22750) (t!43511 List!29913)) )
))
(declare-datatypes ((ListLongMap!20415 0))(
  ( (ListLongMap!20416 (toList!10223 List!29913)) )
))
(declare-fun contains!8385 (ListLongMap!20415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5227 (array!87333 array!87331 (_ BitVec 32) (_ BitVec 32) V!51953 V!51953 (_ BitVec 32) Int) ListLongMap!20415)

(assert (=> b!1309402 (= res!868835 (contains!8385 (getCurrentListMap!5227 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309404 () Bool)

(declare-fun res!868834 () Bool)

(assert (=> b!1309404 (=> (not res!868834) (not e!747259))))

(assert (=> b!1309404 (= res!868834 (not (= (select (arr!42142 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309405 () Bool)

(declare-fun e!747260 () Bool)

(declare-fun tp_is_empty!35137 () Bool)

(assert (=> b!1309405 (= e!747260 tp_is_empty!35137)))

(declare-fun b!1309406 () Bool)

(declare-fun res!868838 () Bool)

(assert (=> b!1309406 (=> (not res!868838) (not e!747259))))

(declare-datatypes ((List!29914 0))(
  ( (Nil!29911) (Cons!29910 (h!31128 (_ BitVec 64)) (t!43512 List!29914)) )
))
(declare-fun arrayNoDuplicates!0 (array!87333 (_ BitVec 32) List!29914) Bool)

(assert (=> b!1309406 (= res!868838 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29911))))

(declare-fun b!1309407 () Bool)

(declare-fun res!868840 () Bool)

(assert (=> b!1309407 (=> (not res!868840) (not e!747259))))

(assert (=> b!1309407 (= res!868840 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!54334 () Bool)

(declare-fun mapRes!54334 () Bool)

(assert (=> mapIsEmpty!54334 mapRes!54334))

(declare-fun b!1309408 () Bool)

(declare-fun res!868839 () Bool)

(assert (=> b!1309408 (=> (not res!868839) (not e!747259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309408 (= res!868839 (validKeyInArray!0 (select (arr!42142 _keys!1628) from!2020)))))

(declare-fun b!1309409 () Bool)

(declare-fun res!868836 () Bool)

(assert (=> b!1309409 (=> (not res!868836) (not e!747259))))

(assert (=> b!1309409 (= res!868836 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42693 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309410 () Bool)

(assert (=> b!1309410 (= e!747259 (not true))))

(assert (=> b!1309410 (contains!8385 (getCurrentListMap!5227 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43249 0))(
  ( (Unit!43250) )
))
(declare-fun lt!585605 () Unit!43249)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!5 (array!87333 array!87331 (_ BitVec 32) (_ BitVec 32) V!51953 V!51953 (_ BitVec 64) (_ BitVec 32) Int) Unit!43249)

(assert (=> b!1309410 (= lt!585605 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309411 () Bool)

(declare-fun res!868841 () Bool)

(assert (=> b!1309411 (=> (not res!868841) (not e!747259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87333 (_ BitVec 32)) Bool)

(assert (=> b!1309411 (= res!868841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309403 () Bool)

(declare-fun res!868837 () Bool)

(assert (=> b!1309403 (=> (not res!868837) (not e!747259))))

(assert (=> b!1309403 (= res!868837 (and (= (size!42692 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42693 _keys!1628) (size!42692 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!868833 () Bool)

(assert (=> start!110796 (=> (not res!868833) (not e!747259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110796 (= res!868833 (validMask!0 mask!2040))))

(assert (=> start!110796 e!747259))

(assert (=> start!110796 tp!103543))

(declare-fun array_inv!32109 (array!87333) Bool)

(assert (=> start!110796 (array_inv!32109 _keys!1628)))

(assert (=> start!110796 true))

(assert (=> start!110796 tp_is_empty!35137))

(declare-fun e!747257 () Bool)

(declare-fun array_inv!32110 (array!87331) Bool)

(assert (=> start!110796 (and (array_inv!32110 _values!1354) e!747257)))

(declare-fun b!1309412 () Bool)

(declare-fun e!747258 () Bool)

(assert (=> b!1309412 (= e!747258 tp_is_empty!35137)))

(declare-fun mapNonEmpty!54334 () Bool)

(declare-fun tp!103542 () Bool)

(assert (=> mapNonEmpty!54334 (= mapRes!54334 (and tp!103542 e!747260))))

(declare-fun mapKey!54334 () (_ BitVec 32))

(declare-fun mapValue!54334 () ValueCell!16670)

(declare-fun mapRest!54334 () (Array (_ BitVec 32) ValueCell!16670))

(assert (=> mapNonEmpty!54334 (= (arr!42141 _values!1354) (store mapRest!54334 mapKey!54334 mapValue!54334))))

(declare-fun b!1309413 () Bool)

(assert (=> b!1309413 (= e!747257 (and e!747258 mapRes!54334))))

(declare-fun condMapEmpty!54334 () Bool)

(declare-fun mapDefault!54334 () ValueCell!16670)

(assert (=> b!1309413 (= condMapEmpty!54334 (= (arr!42141 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16670)) mapDefault!54334)))))

(assert (= (and start!110796 res!868833) b!1309403))

(assert (= (and b!1309403 res!868837) b!1309411))

(assert (= (and b!1309411 res!868841) b!1309406))

(assert (= (and b!1309406 res!868838) b!1309409))

(assert (= (and b!1309409 res!868836) b!1309402))

(assert (= (and b!1309402 res!868835) b!1309404))

(assert (= (and b!1309404 res!868834) b!1309408))

(assert (= (and b!1309408 res!868839) b!1309407))

(assert (= (and b!1309407 res!868840) b!1309410))

(assert (= (and b!1309413 condMapEmpty!54334) mapIsEmpty!54334))

(assert (= (and b!1309413 (not condMapEmpty!54334)) mapNonEmpty!54334))

(get-info :version)

(assert (= (and mapNonEmpty!54334 ((_ is ValueCellFull!16670) mapValue!54334)) b!1309405))

(assert (= (and b!1309413 ((_ is ValueCellFull!16670) mapDefault!54334)) b!1309412))

(assert (= start!110796 b!1309413))

(declare-fun m!1200179 () Bool)

(assert (=> start!110796 m!1200179))

(declare-fun m!1200181 () Bool)

(assert (=> start!110796 m!1200181))

(declare-fun m!1200183 () Bool)

(assert (=> start!110796 m!1200183))

(declare-fun m!1200185 () Bool)

(assert (=> b!1309404 m!1200185))

(declare-fun m!1200187 () Bool)

(assert (=> b!1309402 m!1200187))

(assert (=> b!1309402 m!1200187))

(declare-fun m!1200189 () Bool)

(assert (=> b!1309402 m!1200189))

(declare-fun m!1200191 () Bool)

(assert (=> mapNonEmpty!54334 m!1200191))

(declare-fun m!1200193 () Bool)

(assert (=> b!1309406 m!1200193))

(declare-fun m!1200195 () Bool)

(assert (=> b!1309410 m!1200195))

(assert (=> b!1309410 m!1200195))

(declare-fun m!1200197 () Bool)

(assert (=> b!1309410 m!1200197))

(declare-fun m!1200199 () Bool)

(assert (=> b!1309410 m!1200199))

(assert (=> b!1309408 m!1200185))

(assert (=> b!1309408 m!1200185))

(declare-fun m!1200201 () Bool)

(assert (=> b!1309408 m!1200201))

(declare-fun m!1200203 () Bool)

(assert (=> b!1309411 m!1200203))

(check-sat tp_is_empty!35137 (not b_next!29407) (not b!1309410) b_and!47617 (not b!1309402) (not start!110796) (not b!1309406) (not b!1309408) (not mapNonEmpty!54334) (not b!1309411))
(check-sat b_and!47617 (not b_next!29407))
