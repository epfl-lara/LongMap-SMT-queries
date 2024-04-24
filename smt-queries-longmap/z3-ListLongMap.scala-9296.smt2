; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111348 () Bool)

(assert start!111348)

(declare-fun b_free!29959 () Bool)

(declare-fun b_next!29959 () Bool)

(assert (=> start!111348 (= b_free!29959 (not b_next!29959))))

(declare-fun tp!105199 () Bool)

(declare-fun b_and!48169 () Bool)

(assert (=> start!111348 (= tp!105199 b_and!48169)))

(declare-fun b!1317017 () Bool)

(declare-fun e!751396 () Bool)

(assert (=> b!1317017 (= e!751396 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88395 0))(
  ( (array!88396 (arr!42673 (Array (_ BitVec 32) (_ BitVec 64))) (size!43224 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88395)

(declare-fun lt!586424 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52689 0))(
  ( (V!52690 (val!17919 Int)) )
))
(declare-fun minValue!1296 () V!52689)

(declare-datatypes ((ValueCell!16946 0))(
  ( (ValueCellFull!16946 (v!20541 V!52689)) (EmptyCell!16946) )
))
(declare-datatypes ((array!88397 0))(
  ( (array!88398 (arr!42674 (Array (_ BitVec 32) ValueCell!16946)) (size!43225 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88397)

(declare-fun zeroValue!1296 () V!52689)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!23140 0))(
  ( (tuple2!23141 (_1!11581 (_ BitVec 64)) (_2!11581 V!52689)) )
))
(declare-datatypes ((List!30287 0))(
  ( (Nil!30284) (Cons!30283 (h!31501 tuple2!23140) (t!43885 List!30287)) )
))
(declare-datatypes ((ListLongMap!20805 0))(
  ( (ListLongMap!20806 (toList!10418 List!30287)) )
))
(declare-fun contains!8580 (ListLongMap!20805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5422 (array!88395 array!88397 (_ BitVec 32) (_ BitVec 32) V!52689 V!52689 (_ BitVec 32) Int) ListLongMap!20805)

(assert (=> b!1317017 (= lt!586424 (contains!8580 (getCurrentListMap!5422 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317018 () Bool)

(declare-fun e!751398 () Bool)

(declare-fun tp_is_empty!35689 () Bool)

(assert (=> b!1317018 (= e!751398 tp_is_empty!35689)))

(declare-fun b!1317019 () Bool)

(declare-fun e!751399 () Bool)

(assert (=> b!1317019 (= e!751399 tp_is_empty!35689)))

(declare-fun b!1317020 () Bool)

(declare-fun res!873964 () Bool)

(assert (=> b!1317020 (=> (not res!873964) (not e!751396))))

(assert (=> b!1317020 (= res!873964 (and (= (size!43225 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43224 _keys!1628) (size!43225 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55162 () Bool)

(declare-fun mapRes!55162 () Bool)

(declare-fun tp!105198 () Bool)

(assert (=> mapNonEmpty!55162 (= mapRes!55162 (and tp!105198 e!751398))))

(declare-fun mapKey!55162 () (_ BitVec 32))

(declare-fun mapValue!55162 () ValueCell!16946)

(declare-fun mapRest!55162 () (Array (_ BitVec 32) ValueCell!16946))

(assert (=> mapNonEmpty!55162 (= (arr!42674 _values!1354) (store mapRest!55162 mapKey!55162 mapValue!55162))))

(declare-fun b!1317021 () Bool)

(declare-fun res!873965 () Bool)

(assert (=> b!1317021 (=> (not res!873965) (not e!751396))))

(assert (=> b!1317021 (= res!873965 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43224 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873966 () Bool)

(assert (=> start!111348 (=> (not res!873966) (not e!751396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111348 (= res!873966 (validMask!0 mask!2040))))

(assert (=> start!111348 e!751396))

(assert (=> start!111348 tp!105199))

(declare-fun array_inv!32497 (array!88395) Bool)

(assert (=> start!111348 (array_inv!32497 _keys!1628)))

(assert (=> start!111348 true))

(assert (=> start!111348 tp_is_empty!35689))

(declare-fun e!751400 () Bool)

(declare-fun array_inv!32498 (array!88397) Bool)

(assert (=> start!111348 (and (array_inv!32498 _values!1354) e!751400)))

(declare-fun mapIsEmpty!55162 () Bool)

(assert (=> mapIsEmpty!55162 mapRes!55162))

(declare-fun b!1317022 () Bool)

(assert (=> b!1317022 (= e!751400 (and e!751399 mapRes!55162))))

(declare-fun condMapEmpty!55162 () Bool)

(declare-fun mapDefault!55162 () ValueCell!16946)

(assert (=> b!1317022 (= condMapEmpty!55162 (= (arr!42674 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16946)) mapDefault!55162)))))

(declare-fun b!1317023 () Bool)

(declare-fun res!873968 () Bool)

(assert (=> b!1317023 (=> (not res!873968) (not e!751396))))

(declare-datatypes ((List!30288 0))(
  ( (Nil!30285) (Cons!30284 (h!31502 (_ BitVec 64)) (t!43886 List!30288)) )
))
(declare-fun arrayNoDuplicates!0 (array!88395 (_ BitVec 32) List!30288) Bool)

(assert (=> b!1317023 (= res!873968 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30285))))

(declare-fun b!1317024 () Bool)

(declare-fun res!873967 () Bool)

(assert (=> b!1317024 (=> (not res!873967) (not e!751396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88395 (_ BitVec 32)) Bool)

(assert (=> b!1317024 (= res!873967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111348 res!873966) b!1317020))

(assert (= (and b!1317020 res!873964) b!1317024))

(assert (= (and b!1317024 res!873967) b!1317023))

(assert (= (and b!1317023 res!873968) b!1317021))

(assert (= (and b!1317021 res!873965) b!1317017))

(assert (= (and b!1317022 condMapEmpty!55162) mapIsEmpty!55162))

(assert (= (and b!1317022 (not condMapEmpty!55162)) mapNonEmpty!55162))

(get-info :version)

(assert (= (and mapNonEmpty!55162 ((_ is ValueCellFull!16946) mapValue!55162)) b!1317018))

(assert (= (and b!1317022 ((_ is ValueCellFull!16946) mapDefault!55162)) b!1317019))

(assert (= start!111348 b!1317022))

(declare-fun m!1205417 () Bool)

(assert (=> mapNonEmpty!55162 m!1205417))

(declare-fun m!1205419 () Bool)

(assert (=> b!1317024 m!1205419))

(declare-fun m!1205421 () Bool)

(assert (=> b!1317023 m!1205421))

(declare-fun m!1205423 () Bool)

(assert (=> b!1317017 m!1205423))

(assert (=> b!1317017 m!1205423))

(declare-fun m!1205425 () Bool)

(assert (=> b!1317017 m!1205425))

(declare-fun m!1205427 () Bool)

(assert (=> start!111348 m!1205427))

(declare-fun m!1205429 () Bool)

(assert (=> start!111348 m!1205429))

(declare-fun m!1205431 () Bool)

(assert (=> start!111348 m!1205431))

(check-sat (not b!1317024) tp_is_empty!35689 (not start!111348) (not mapNonEmpty!55162) (not b!1317017) b_and!48169 (not b!1317023) (not b_next!29959))
(check-sat b_and!48169 (not b_next!29959))
