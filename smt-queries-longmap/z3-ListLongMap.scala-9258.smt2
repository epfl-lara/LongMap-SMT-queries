; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111120 () Bool)

(assert start!111120)

(declare-fun b_free!29731 () Bool)

(declare-fun b_next!29731 () Bool)

(assert (=> start!111120 (= b_free!29731 (not b_next!29731))))

(declare-fun tp!104514 () Bool)

(declare-fun b_and!47941 () Bool)

(assert (=> start!111120 (= tp!104514 b_and!47941)))

(declare-fun b!1314182 () Bool)

(declare-fun res!872157 () Bool)

(declare-fun e!749688 () Bool)

(assert (=> b!1314182 (=> (not res!872157) (not e!749688))))

(declare-datatypes ((array!87957 0))(
  ( (array!87958 (arr!42454 (Array (_ BitVec 32) (_ BitVec 64))) (size!43005 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87957)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52385 0))(
  ( (V!52386 (val!17805 Int)) )
))
(declare-datatypes ((ValueCell!16832 0))(
  ( (ValueCellFull!16832 (v!20427 V!52385)) (EmptyCell!16832) )
))
(declare-datatypes ((array!87959 0))(
  ( (array!87960 (arr!42455 (Array (_ BitVec 32) ValueCell!16832)) (size!43006 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87959)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314182 (= res!872157 (and (= (size!43006 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43005 _keys!1628) (size!43006 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314183 () Bool)

(declare-fun e!749690 () Bool)

(declare-fun tp_is_empty!35461 () Bool)

(assert (=> b!1314183 (= e!749690 tp_is_empty!35461)))

(declare-fun b!1314184 () Bool)

(declare-fun e!749687 () Bool)

(declare-fun e!749689 () Bool)

(declare-fun mapRes!54820 () Bool)

(assert (=> b!1314184 (= e!749687 (and e!749689 mapRes!54820))))

(declare-fun condMapEmpty!54820 () Bool)

(declare-fun mapDefault!54820 () ValueCell!16832)

(assert (=> b!1314184 (= condMapEmpty!54820 (= (arr!42455 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16832)) mapDefault!54820)))))

(declare-fun mapNonEmpty!54820 () Bool)

(declare-fun tp!104515 () Bool)

(assert (=> mapNonEmpty!54820 (= mapRes!54820 (and tp!104515 e!749690))))

(declare-fun mapRest!54820 () (Array (_ BitVec 32) ValueCell!16832))

(declare-fun mapValue!54820 () ValueCell!16832)

(declare-fun mapKey!54820 () (_ BitVec 32))

(assert (=> mapNonEmpty!54820 (= (arr!42455 _values!1354) (store mapRest!54820 mapKey!54820 mapValue!54820))))

(declare-fun mapIsEmpty!54820 () Bool)

(assert (=> mapIsEmpty!54820 mapRes!54820))

(declare-fun b!1314185 () Bool)

(declare-fun res!872159 () Bool)

(assert (=> b!1314185 (=> (not res!872159) (not e!749688))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314185 (= res!872159 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43005 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314186 () Bool)

(declare-fun res!872155 () Bool)

(assert (=> b!1314186 (=> (not res!872155) (not e!749688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87957 (_ BitVec 32)) Bool)

(assert (=> b!1314186 (= res!872155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314187 () Bool)

(assert (=> b!1314187 (= e!749688 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52385)

(declare-fun zeroValue!1296 () V!52385)

(declare-fun lt!586091 () Bool)

(declare-datatypes ((tuple2!22982 0))(
  ( (tuple2!22983 (_1!11502 (_ BitVec 64)) (_2!11502 V!52385)) )
))
(declare-datatypes ((List!30134 0))(
  ( (Nil!30131) (Cons!30130 (h!31348 tuple2!22982) (t!43732 List!30134)) )
))
(declare-datatypes ((ListLongMap!20647 0))(
  ( (ListLongMap!20648 (toList!10339 List!30134)) )
))
(declare-fun contains!8501 (ListLongMap!20647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5343 (array!87957 array!87959 (_ BitVec 32) (_ BitVec 32) V!52385 V!52385 (_ BitVec 32) Int) ListLongMap!20647)

(assert (=> b!1314187 (= lt!586091 (contains!8501 (getCurrentListMap!5343 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314188 () Bool)

(assert (=> b!1314188 (= e!749689 tp_is_empty!35461)))

(declare-fun res!872156 () Bool)

(assert (=> start!111120 (=> (not res!872156) (not e!749688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111120 (= res!872156 (validMask!0 mask!2040))))

(assert (=> start!111120 e!749688))

(assert (=> start!111120 tp!104514))

(declare-fun array_inv!32329 (array!87957) Bool)

(assert (=> start!111120 (array_inv!32329 _keys!1628)))

(assert (=> start!111120 true))

(assert (=> start!111120 tp_is_empty!35461))

(declare-fun array_inv!32330 (array!87959) Bool)

(assert (=> start!111120 (and (array_inv!32330 _values!1354) e!749687)))

(declare-fun b!1314189 () Bool)

(declare-fun res!872158 () Bool)

(assert (=> b!1314189 (=> (not res!872158) (not e!749688))))

(declare-datatypes ((List!30135 0))(
  ( (Nil!30132) (Cons!30131 (h!31349 (_ BitVec 64)) (t!43733 List!30135)) )
))
(declare-fun arrayNoDuplicates!0 (array!87957 (_ BitVec 32) List!30135) Bool)

(assert (=> b!1314189 (= res!872158 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30132))))

(assert (= (and start!111120 res!872156) b!1314182))

(assert (= (and b!1314182 res!872157) b!1314186))

(assert (= (and b!1314186 res!872155) b!1314189))

(assert (= (and b!1314189 res!872158) b!1314185))

(assert (= (and b!1314185 res!872159) b!1314187))

(assert (= (and b!1314184 condMapEmpty!54820) mapIsEmpty!54820))

(assert (= (and b!1314184 (not condMapEmpty!54820)) mapNonEmpty!54820))

(get-info :version)

(assert (= (and mapNonEmpty!54820 ((_ is ValueCellFull!16832) mapValue!54820)) b!1314183))

(assert (= (and b!1314184 ((_ is ValueCellFull!16832) mapDefault!54820)) b!1314188))

(assert (= start!111120 b!1314184))

(declare-fun m!1203521 () Bool)

(assert (=> b!1314189 m!1203521))

(declare-fun m!1203523 () Bool)

(assert (=> b!1314186 m!1203523))

(declare-fun m!1203525 () Bool)

(assert (=> mapNonEmpty!54820 m!1203525))

(declare-fun m!1203527 () Bool)

(assert (=> b!1314187 m!1203527))

(assert (=> b!1314187 m!1203527))

(declare-fun m!1203529 () Bool)

(assert (=> b!1314187 m!1203529))

(declare-fun m!1203531 () Bool)

(assert (=> start!111120 m!1203531))

(declare-fun m!1203533 () Bool)

(assert (=> start!111120 m!1203533))

(declare-fun m!1203535 () Bool)

(assert (=> start!111120 m!1203535))

(check-sat (not b!1314186) (not b!1314189) (not b_next!29731) (not b!1314187) (not mapNonEmpty!54820) tp_is_empty!35461 b_and!47941 (not start!111120))
(check-sat b_and!47941 (not b_next!29731))
