; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110494 () Bool)

(assert start!110494)

(declare-fun b_free!29329 () Bool)

(declare-fun b_next!29329 () Bool)

(assert (=> start!110494 (= b_free!29329 (not b_next!29329))))

(declare-fun tp!103310 () Bool)

(declare-fun b_and!47519 () Bool)

(assert (=> start!110494 (= tp!103310 b_and!47519)))

(declare-fun b!1307017 () Bool)

(declare-fun e!745798 () Bool)

(declare-fun tp_is_empty!35059 () Bool)

(assert (=> b!1307017 (= e!745798 tp_is_empty!35059)))

(declare-fun b!1307018 () Bool)

(declare-fun res!867623 () Bool)

(declare-fun e!745797 () Bool)

(assert (=> b!1307018 (=> (not res!867623) (not e!745797))))

(declare-datatypes ((array!87035 0))(
  ( (array!87036 (arr!41998 (Array (_ BitVec 32) (_ BitVec 64))) (size!42550 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87035)

(declare-datatypes ((List!29863 0))(
  ( (Nil!29860) (Cons!29859 (h!31068 (_ BitVec 64)) (t!43461 List!29863)) )
))
(declare-fun arrayNoDuplicates!0 (array!87035 (_ BitVec 32) List!29863) Bool)

(assert (=> b!1307018 (= res!867623 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29860))))

(declare-fun b!1307019 () Bool)

(declare-fun res!867624 () Bool)

(assert (=> b!1307019 (=> (not res!867624) (not e!745797))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87035 (_ BitVec 32)) Bool)

(assert (=> b!1307019 (= res!867624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307020 () Bool)

(declare-fun res!867621 () Bool)

(assert (=> b!1307020 (=> (not res!867621) (not e!745797))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307020 (= res!867621 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42550 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307021 () Bool)

(assert (=> b!1307021 (= e!745797 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!51849 0))(
  ( (V!51850 (val!17604 Int)) )
))
(declare-fun minValue!1296 () V!51849)

(declare-fun lt!584826 () Bool)

(declare-datatypes ((ValueCell!16631 0))(
  ( (ValueCellFull!16631 (v!20230 V!51849)) (EmptyCell!16631) )
))
(declare-datatypes ((array!87037 0))(
  ( (array!87038 (arr!41999 (Array (_ BitVec 32) ValueCell!16631)) (size!42551 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87037)

(declare-fun zeroValue!1296 () V!51849)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22738 0))(
  ( (tuple2!22739 (_1!11380 (_ BitVec 64)) (_2!11380 V!51849)) )
))
(declare-datatypes ((List!29864 0))(
  ( (Nil!29861) (Cons!29860 (h!31069 tuple2!22738) (t!43462 List!29864)) )
))
(declare-datatypes ((ListLongMap!20395 0))(
  ( (ListLongMap!20396 (toList!10213 List!29864)) )
))
(declare-fun contains!8290 (ListLongMap!20395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5108 (array!87035 array!87037 (_ BitVec 32) (_ BitVec 32) V!51849 V!51849 (_ BitVec 32) Int) ListLongMap!20395)

(assert (=> b!1307021 (= lt!584826 (contains!8290 (getCurrentListMap!5108 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307022 () Bool)

(declare-fun e!745799 () Bool)

(assert (=> b!1307022 (= e!745799 tp_is_empty!35059)))

(declare-fun b!1307023 () Bool)

(declare-fun res!867625 () Bool)

(assert (=> b!1307023 (=> (not res!867625) (not e!745797))))

(assert (=> b!1307023 (= res!867625 (and (= (size!42551 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42550 _keys!1628) (size!42551 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54217 () Bool)

(declare-fun mapRes!54217 () Bool)

(assert (=> mapIsEmpty!54217 mapRes!54217))

(declare-fun mapNonEmpty!54217 () Bool)

(declare-fun tp!103309 () Bool)

(assert (=> mapNonEmpty!54217 (= mapRes!54217 (and tp!103309 e!745799))))

(declare-fun mapValue!54217 () ValueCell!16631)

(declare-fun mapRest!54217 () (Array (_ BitVec 32) ValueCell!16631))

(declare-fun mapKey!54217 () (_ BitVec 32))

(assert (=> mapNonEmpty!54217 (= (arr!41999 _values!1354) (store mapRest!54217 mapKey!54217 mapValue!54217))))

(declare-fun b!1307024 () Bool)

(declare-fun e!745796 () Bool)

(assert (=> b!1307024 (= e!745796 (and e!745798 mapRes!54217))))

(declare-fun condMapEmpty!54217 () Bool)

(declare-fun mapDefault!54217 () ValueCell!16631)

(assert (=> b!1307024 (= condMapEmpty!54217 (= (arr!41999 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16631)) mapDefault!54217)))))

(declare-fun res!867622 () Bool)

(assert (=> start!110494 (=> (not res!867622) (not e!745797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110494 (= res!867622 (validMask!0 mask!2040))))

(assert (=> start!110494 e!745797))

(assert (=> start!110494 tp!103310))

(declare-fun array_inv!31939 (array!87035) Bool)

(assert (=> start!110494 (array_inv!31939 _keys!1628)))

(assert (=> start!110494 true))

(assert (=> start!110494 tp_is_empty!35059))

(declare-fun array_inv!31940 (array!87037) Bool)

(assert (=> start!110494 (and (array_inv!31940 _values!1354) e!745796)))

(assert (= (and start!110494 res!867622) b!1307023))

(assert (= (and b!1307023 res!867625) b!1307019))

(assert (= (and b!1307019 res!867624) b!1307018))

(assert (= (and b!1307018 res!867623) b!1307020))

(assert (= (and b!1307020 res!867621) b!1307021))

(assert (= (and b!1307024 condMapEmpty!54217) mapIsEmpty!54217))

(assert (= (and b!1307024 (not condMapEmpty!54217)) mapNonEmpty!54217))

(get-info :version)

(assert (= (and mapNonEmpty!54217 ((_ is ValueCellFull!16631) mapValue!54217)) b!1307022))

(assert (= (and b!1307024 ((_ is ValueCellFull!16631) mapDefault!54217)) b!1307017))

(assert (= start!110494 b!1307024))

(declare-fun m!1197381 () Bool)

(assert (=> b!1307019 m!1197381))

(declare-fun m!1197383 () Bool)

(assert (=> start!110494 m!1197383))

(declare-fun m!1197385 () Bool)

(assert (=> start!110494 m!1197385))

(declare-fun m!1197387 () Bool)

(assert (=> start!110494 m!1197387))

(declare-fun m!1197389 () Bool)

(assert (=> b!1307021 m!1197389))

(assert (=> b!1307021 m!1197389))

(declare-fun m!1197391 () Bool)

(assert (=> b!1307021 m!1197391))

(declare-fun m!1197393 () Bool)

(assert (=> mapNonEmpty!54217 m!1197393))

(declare-fun m!1197395 () Bool)

(assert (=> b!1307018 m!1197395))

(check-sat (not b!1307018) (not mapNonEmpty!54217) (not b_next!29329) (not b!1307019) (not b!1307021) b_and!47519 (not start!110494) tp_is_empty!35059)
(check-sat b_and!47519 (not b_next!29329))
