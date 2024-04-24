; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111288 () Bool)

(assert start!111288)

(declare-fun b_free!29899 () Bool)

(declare-fun b_next!29899 () Bool)

(assert (=> start!111288 (= b_free!29899 (not b_next!29899))))

(declare-fun tp!105018 () Bool)

(declare-fun b_and!48109 () Bool)

(assert (=> start!111288 (= tp!105018 b_and!48109)))

(declare-fun b!1316261 () Bool)

(declare-fun e!750946 () Bool)

(declare-fun e!750947 () Bool)

(declare-fun mapRes!55072 () Bool)

(assert (=> b!1316261 (= e!750946 (and e!750947 mapRes!55072))))

(declare-fun condMapEmpty!55072 () Bool)

(declare-datatypes ((V!52609 0))(
  ( (V!52610 (val!17889 Int)) )
))
(declare-datatypes ((ValueCell!16916 0))(
  ( (ValueCellFull!16916 (v!20511 V!52609)) (EmptyCell!16916) )
))
(declare-datatypes ((array!88283 0))(
  ( (array!88284 (arr!42617 (Array (_ BitVec 32) ValueCell!16916)) (size!43168 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88283)

(declare-fun mapDefault!55072 () ValueCell!16916)

(assert (=> b!1316261 (= condMapEmpty!55072 (= (arr!42617 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16916)) mapDefault!55072)))))

(declare-fun b!1316262 () Bool)

(declare-fun e!750950 () Bool)

(declare-fun tp_is_empty!35629 () Bool)

(assert (=> b!1316262 (= e!750950 tp_is_empty!35629)))

(declare-fun b!1316263 () Bool)

(declare-fun res!873482 () Bool)

(declare-fun e!750948 () Bool)

(assert (=> b!1316263 (=> (not res!873482) (not e!750948))))

(declare-datatypes ((array!88285 0))(
  ( (array!88286 (arr!42618 (Array (_ BitVec 32) (_ BitVec 64))) (size!43169 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88285)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88285 (_ BitVec 32)) Bool)

(assert (=> b!1316263 (= res!873482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316264 () Bool)

(declare-fun res!873480 () Bool)

(assert (=> b!1316264 (=> (not res!873480) (not e!750948))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316264 (= res!873480 (and (= (size!43168 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43169 _keys!1628) (size!43168 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316265 () Bool)

(assert (=> b!1316265 (= e!750948 false)))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52609)

(declare-fun zeroValue!1296 () V!52609)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586334 () Bool)

(declare-datatypes ((tuple2!23100 0))(
  ( (tuple2!23101 (_1!11561 (_ BitVec 64)) (_2!11561 V!52609)) )
))
(declare-datatypes ((List!30247 0))(
  ( (Nil!30244) (Cons!30243 (h!31461 tuple2!23100) (t!43845 List!30247)) )
))
(declare-datatypes ((ListLongMap!20765 0))(
  ( (ListLongMap!20766 (toList!10398 List!30247)) )
))
(declare-fun contains!8560 (ListLongMap!20765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5402 (array!88285 array!88283 (_ BitVec 32) (_ BitVec 32) V!52609 V!52609 (_ BitVec 32) Int) ListLongMap!20765)

(assert (=> b!1316265 (= lt!586334 (contains!8560 (getCurrentListMap!5402 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!55072 () Bool)

(declare-fun tp!105019 () Bool)

(assert (=> mapNonEmpty!55072 (= mapRes!55072 (and tp!105019 e!750950))))

(declare-fun mapValue!55072 () ValueCell!16916)

(declare-fun mapRest!55072 () (Array (_ BitVec 32) ValueCell!16916))

(declare-fun mapKey!55072 () (_ BitVec 32))

(assert (=> mapNonEmpty!55072 (= (arr!42617 _values!1354) (store mapRest!55072 mapKey!55072 mapValue!55072))))

(declare-fun b!1316267 () Bool)

(declare-fun res!873481 () Bool)

(assert (=> b!1316267 (=> (not res!873481) (not e!750948))))

(declare-datatypes ((List!30248 0))(
  ( (Nil!30245) (Cons!30244 (h!31462 (_ BitVec 64)) (t!43846 List!30248)) )
))
(declare-fun arrayNoDuplicates!0 (array!88285 (_ BitVec 32) List!30248) Bool)

(assert (=> b!1316267 (= res!873481 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30245))))

(declare-fun res!873478 () Bool)

(assert (=> start!111288 (=> (not res!873478) (not e!750948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111288 (= res!873478 (validMask!0 mask!2040))))

(assert (=> start!111288 e!750948))

(assert (=> start!111288 tp!105018))

(declare-fun array_inv!32455 (array!88285) Bool)

(assert (=> start!111288 (array_inv!32455 _keys!1628)))

(assert (=> start!111288 true))

(assert (=> start!111288 tp_is_empty!35629))

(declare-fun array_inv!32456 (array!88283) Bool)

(assert (=> start!111288 (and (array_inv!32456 _values!1354) e!750946)))

(declare-fun b!1316266 () Bool)

(declare-fun res!873479 () Bool)

(assert (=> b!1316266 (=> (not res!873479) (not e!750948))))

(assert (=> b!1316266 (= res!873479 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43169 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55072 () Bool)

(assert (=> mapIsEmpty!55072 mapRes!55072))

(declare-fun b!1316268 () Bool)

(assert (=> b!1316268 (= e!750947 tp_is_empty!35629)))

(assert (= (and start!111288 res!873478) b!1316264))

(assert (= (and b!1316264 res!873480) b!1316263))

(assert (= (and b!1316263 res!873482) b!1316267))

(assert (= (and b!1316267 res!873481) b!1316266))

(assert (= (and b!1316266 res!873479) b!1316265))

(assert (= (and b!1316261 condMapEmpty!55072) mapIsEmpty!55072))

(assert (= (and b!1316261 (not condMapEmpty!55072)) mapNonEmpty!55072))

(get-info :version)

(assert (= (and mapNonEmpty!55072 ((_ is ValueCellFull!16916) mapValue!55072)) b!1316262))

(assert (= (and b!1316261 ((_ is ValueCellFull!16916) mapDefault!55072)) b!1316268))

(assert (= start!111288 b!1316261))

(declare-fun m!1204907 () Bool)

(assert (=> b!1316265 m!1204907))

(assert (=> b!1316265 m!1204907))

(declare-fun m!1204909 () Bool)

(assert (=> b!1316265 m!1204909))

(declare-fun m!1204911 () Bool)

(assert (=> b!1316267 m!1204911))

(declare-fun m!1204913 () Bool)

(assert (=> mapNonEmpty!55072 m!1204913))

(declare-fun m!1204915 () Bool)

(assert (=> start!111288 m!1204915))

(declare-fun m!1204917 () Bool)

(assert (=> start!111288 m!1204917))

(declare-fun m!1204919 () Bool)

(assert (=> start!111288 m!1204919))

(declare-fun m!1204921 () Bool)

(assert (=> b!1316263 m!1204921))

(check-sat (not start!111288) (not b!1316265) (not b_next!29899) (not mapNonEmpty!55072) (not b!1316267) b_and!48109 tp_is_empty!35629 (not b!1316263))
(check-sat b_and!48109 (not b_next!29899))
