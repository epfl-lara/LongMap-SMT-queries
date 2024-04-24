; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111234 () Bool)

(assert start!111234)

(declare-fun b_free!29845 () Bool)

(declare-fun b_next!29845 () Bool)

(assert (=> start!111234 (= b_free!29845 (not b_next!29845))))

(declare-fun tp!104857 () Bool)

(declare-fun b_and!48055 () Bool)

(assert (=> start!111234 (= tp!104857 b_and!48055)))

(declare-fun b!1315613 () Bool)

(declare-fun res!873077 () Bool)

(declare-fun e!750541 () Bool)

(assert (=> b!1315613 (=> (not res!873077) (not e!750541))))

(declare-datatypes ((array!88179 0))(
  ( (array!88180 (arr!42565 (Array (_ BitVec 32) (_ BitVec 64))) (size!43116 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88179)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52537 0))(
  ( (V!52538 (val!17862 Int)) )
))
(declare-datatypes ((ValueCell!16889 0))(
  ( (ValueCellFull!16889 (v!20484 V!52537)) (EmptyCell!16889) )
))
(declare-datatypes ((array!88181 0))(
  ( (array!88182 (arr!42566 (Array (_ BitVec 32) ValueCell!16889)) (size!43117 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88181)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315613 (= res!873077 (and (= (size!43117 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43116 _keys!1628) (size!43117 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315614 () Bool)

(assert (=> b!1315614 (= e!750541 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586253 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52537)

(declare-fun zeroValue!1296 () V!52537)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23060 0))(
  ( (tuple2!23061 (_1!11541 (_ BitVec 64)) (_2!11541 V!52537)) )
))
(declare-datatypes ((List!30211 0))(
  ( (Nil!30208) (Cons!30207 (h!31425 tuple2!23060) (t!43809 List!30211)) )
))
(declare-datatypes ((ListLongMap!20725 0))(
  ( (ListLongMap!20726 (toList!10378 List!30211)) )
))
(declare-fun contains!8540 (ListLongMap!20725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5382 (array!88179 array!88181 (_ BitVec 32) (_ BitVec 32) V!52537 V!52537 (_ BitVec 32) Int) ListLongMap!20725)

(assert (=> b!1315614 (= lt!586253 (contains!8540 (getCurrentListMap!5382 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54991 () Bool)

(declare-fun mapRes!54991 () Bool)

(assert (=> mapIsEmpty!54991 mapRes!54991))

(declare-fun res!873074 () Bool)

(assert (=> start!111234 (=> (not res!873074) (not e!750541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111234 (= res!873074 (validMask!0 mask!2040))))

(assert (=> start!111234 e!750541))

(assert (=> start!111234 tp!104857))

(declare-fun array_inv!32417 (array!88179) Bool)

(assert (=> start!111234 (array_inv!32417 _keys!1628)))

(assert (=> start!111234 true))

(declare-fun tp_is_empty!35575 () Bool)

(assert (=> start!111234 tp_is_empty!35575))

(declare-fun e!750543 () Bool)

(declare-fun array_inv!32418 (array!88181) Bool)

(assert (=> start!111234 (and (array_inv!32418 _values!1354) e!750543)))

(declare-fun b!1315615 () Bool)

(declare-fun res!873076 () Bool)

(assert (=> b!1315615 (=> (not res!873076) (not e!750541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88179 (_ BitVec 32)) Bool)

(assert (=> b!1315615 (= res!873076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315616 () Bool)

(declare-fun e!750545 () Bool)

(assert (=> b!1315616 (= e!750545 tp_is_empty!35575)))

(declare-fun b!1315617 () Bool)

(declare-fun e!750542 () Bool)

(assert (=> b!1315617 (= e!750543 (and e!750542 mapRes!54991))))

(declare-fun condMapEmpty!54991 () Bool)

(declare-fun mapDefault!54991 () ValueCell!16889)

(assert (=> b!1315617 (= condMapEmpty!54991 (= (arr!42566 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16889)) mapDefault!54991)))))

(declare-fun b!1315618 () Bool)

(assert (=> b!1315618 (= e!750542 tp_is_empty!35575)))

(declare-fun b!1315619 () Bool)

(declare-fun res!873073 () Bool)

(assert (=> b!1315619 (=> (not res!873073) (not e!750541))))

(assert (=> b!1315619 (= res!873073 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43116 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315620 () Bool)

(declare-fun res!873075 () Bool)

(assert (=> b!1315620 (=> (not res!873075) (not e!750541))))

(declare-datatypes ((List!30212 0))(
  ( (Nil!30209) (Cons!30208 (h!31426 (_ BitVec 64)) (t!43810 List!30212)) )
))
(declare-fun arrayNoDuplicates!0 (array!88179 (_ BitVec 32) List!30212) Bool)

(assert (=> b!1315620 (= res!873075 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30209))))

(declare-fun mapNonEmpty!54991 () Bool)

(declare-fun tp!104856 () Bool)

(assert (=> mapNonEmpty!54991 (= mapRes!54991 (and tp!104856 e!750545))))

(declare-fun mapValue!54991 () ValueCell!16889)

(declare-fun mapKey!54991 () (_ BitVec 32))

(declare-fun mapRest!54991 () (Array (_ BitVec 32) ValueCell!16889))

(assert (=> mapNonEmpty!54991 (= (arr!42566 _values!1354) (store mapRest!54991 mapKey!54991 mapValue!54991))))

(assert (= (and start!111234 res!873074) b!1315613))

(assert (= (and b!1315613 res!873077) b!1315615))

(assert (= (and b!1315615 res!873076) b!1315620))

(assert (= (and b!1315620 res!873075) b!1315619))

(assert (= (and b!1315619 res!873073) b!1315614))

(assert (= (and b!1315617 condMapEmpty!54991) mapIsEmpty!54991))

(assert (= (and b!1315617 (not condMapEmpty!54991)) mapNonEmpty!54991))

(get-info :version)

(assert (= (and mapNonEmpty!54991 ((_ is ValueCellFull!16889) mapValue!54991)) b!1315616))

(assert (= (and b!1315617 ((_ is ValueCellFull!16889) mapDefault!54991)) b!1315618))

(assert (= start!111234 b!1315617))

(declare-fun m!1204475 () Bool)

(assert (=> mapNonEmpty!54991 m!1204475))

(declare-fun m!1204477 () Bool)

(assert (=> b!1315620 m!1204477))

(declare-fun m!1204479 () Bool)

(assert (=> b!1315614 m!1204479))

(assert (=> b!1315614 m!1204479))

(declare-fun m!1204481 () Bool)

(assert (=> b!1315614 m!1204481))

(declare-fun m!1204483 () Bool)

(assert (=> start!111234 m!1204483))

(declare-fun m!1204485 () Bool)

(assert (=> start!111234 m!1204485))

(declare-fun m!1204487 () Bool)

(assert (=> start!111234 m!1204487))

(declare-fun m!1204489 () Bool)

(assert (=> b!1315615 m!1204489))

(check-sat b_and!48055 tp_is_empty!35575 (not b!1315620) (not b!1315614) (not b_next!29845) (not b!1315615) (not start!111234) (not mapNonEmpty!54991))
(check-sat b_and!48055 (not b_next!29845))
