; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111294 () Bool)

(assert start!111294)

(declare-fun b_free!29905 () Bool)

(declare-fun b_next!29905 () Bool)

(assert (=> start!111294 (= b_free!29905 (not b_next!29905))))

(declare-fun tp!105036 () Bool)

(declare-fun b_and!48115 () Bool)

(assert (=> start!111294 (= tp!105036 b_and!48115)))

(declare-fun b!1316333 () Bool)

(declare-fun e!750993 () Bool)

(assert (=> b!1316333 (= e!750993 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88293 0))(
  ( (array!88294 (arr!42622 (Array (_ BitVec 32) (_ BitVec 64))) (size!43173 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88293)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52617 0))(
  ( (V!52618 (val!17892 Int)) )
))
(declare-fun minValue!1296 () V!52617)

(declare-datatypes ((ValueCell!16919 0))(
  ( (ValueCellFull!16919 (v!20514 V!52617)) (EmptyCell!16919) )
))
(declare-datatypes ((array!88295 0))(
  ( (array!88296 (arr!42623 (Array (_ BitVec 32) ValueCell!16919)) (size!43174 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88295)

(declare-fun zeroValue!1296 () V!52617)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!586343 () Bool)

(declare-datatypes ((tuple2!23104 0))(
  ( (tuple2!23105 (_1!11563 (_ BitVec 64)) (_2!11563 V!52617)) )
))
(declare-datatypes ((List!30250 0))(
  ( (Nil!30247) (Cons!30246 (h!31464 tuple2!23104) (t!43848 List!30250)) )
))
(declare-datatypes ((ListLongMap!20769 0))(
  ( (ListLongMap!20770 (toList!10400 List!30250)) )
))
(declare-fun contains!8562 (ListLongMap!20769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5404 (array!88293 array!88295 (_ BitVec 32) (_ BitVec 32) V!52617 V!52617 (_ BitVec 32) Int) ListLongMap!20769)

(assert (=> b!1316333 (= lt!586343 (contains!8562 (getCurrentListMap!5404 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316335 () Bool)

(declare-fun res!873526 () Bool)

(assert (=> b!1316335 (=> (not res!873526) (not e!750993))))

(declare-datatypes ((List!30251 0))(
  ( (Nil!30248) (Cons!30247 (h!31465 (_ BitVec 64)) (t!43849 List!30251)) )
))
(declare-fun arrayNoDuplicates!0 (array!88293 (_ BitVec 32) List!30251) Bool)

(assert (=> b!1316335 (= res!873526 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30248))))

(declare-fun b!1316336 () Bool)

(declare-fun e!750992 () Bool)

(declare-fun e!750995 () Bool)

(declare-fun mapRes!55081 () Bool)

(assert (=> b!1316336 (= e!750992 (and e!750995 mapRes!55081))))

(declare-fun condMapEmpty!55081 () Bool)

(declare-fun mapDefault!55081 () ValueCell!16919)

(assert (=> b!1316336 (= condMapEmpty!55081 (= (arr!42623 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16919)) mapDefault!55081)))))

(declare-fun mapIsEmpty!55081 () Bool)

(assert (=> mapIsEmpty!55081 mapRes!55081))

(declare-fun mapNonEmpty!55081 () Bool)

(declare-fun tp!105037 () Bool)

(declare-fun e!750991 () Bool)

(assert (=> mapNonEmpty!55081 (= mapRes!55081 (and tp!105037 e!750991))))

(declare-fun mapRest!55081 () (Array (_ BitVec 32) ValueCell!16919))

(declare-fun mapValue!55081 () ValueCell!16919)

(declare-fun mapKey!55081 () (_ BitVec 32))

(assert (=> mapNonEmpty!55081 (= (arr!42623 _values!1354) (store mapRest!55081 mapKey!55081 mapValue!55081))))

(declare-fun b!1316337 () Bool)

(declare-fun res!873525 () Bool)

(assert (=> b!1316337 (=> (not res!873525) (not e!750993))))

(assert (=> b!1316337 (= res!873525 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43173 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316338 () Bool)

(declare-fun res!873524 () Bool)

(assert (=> b!1316338 (=> (not res!873524) (not e!750993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88293 (_ BitVec 32)) Bool)

(assert (=> b!1316338 (= res!873524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316334 () Bool)

(declare-fun tp_is_empty!35635 () Bool)

(assert (=> b!1316334 (= e!750995 tp_is_empty!35635)))

(declare-fun res!873523 () Bool)

(assert (=> start!111294 (=> (not res!873523) (not e!750993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111294 (= res!873523 (validMask!0 mask!2040))))

(assert (=> start!111294 e!750993))

(assert (=> start!111294 tp!105036))

(declare-fun array_inv!32457 (array!88293) Bool)

(assert (=> start!111294 (array_inv!32457 _keys!1628)))

(assert (=> start!111294 true))

(assert (=> start!111294 tp_is_empty!35635))

(declare-fun array_inv!32458 (array!88295) Bool)

(assert (=> start!111294 (and (array_inv!32458 _values!1354) e!750992)))

(declare-fun b!1316339 () Bool)

(assert (=> b!1316339 (= e!750991 tp_is_empty!35635)))

(declare-fun b!1316340 () Bool)

(declare-fun res!873527 () Bool)

(assert (=> b!1316340 (=> (not res!873527) (not e!750993))))

(assert (=> b!1316340 (= res!873527 (and (= (size!43174 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43173 _keys!1628) (size!43174 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111294 res!873523) b!1316340))

(assert (= (and b!1316340 res!873527) b!1316338))

(assert (= (and b!1316338 res!873524) b!1316335))

(assert (= (and b!1316335 res!873526) b!1316337))

(assert (= (and b!1316337 res!873525) b!1316333))

(assert (= (and b!1316336 condMapEmpty!55081) mapIsEmpty!55081))

(assert (= (and b!1316336 (not condMapEmpty!55081)) mapNonEmpty!55081))

(get-info :version)

(assert (= (and mapNonEmpty!55081 ((_ is ValueCellFull!16919) mapValue!55081)) b!1316339))

(assert (= (and b!1316336 ((_ is ValueCellFull!16919) mapDefault!55081)) b!1316334))

(assert (= start!111294 b!1316336))

(declare-fun m!1204955 () Bool)

(assert (=> start!111294 m!1204955))

(declare-fun m!1204957 () Bool)

(assert (=> start!111294 m!1204957))

(declare-fun m!1204959 () Bool)

(assert (=> start!111294 m!1204959))

(declare-fun m!1204961 () Bool)

(assert (=> mapNonEmpty!55081 m!1204961))

(declare-fun m!1204963 () Bool)

(assert (=> b!1316333 m!1204963))

(assert (=> b!1316333 m!1204963))

(declare-fun m!1204965 () Bool)

(assert (=> b!1316333 m!1204965))

(declare-fun m!1204967 () Bool)

(assert (=> b!1316338 m!1204967))

(declare-fun m!1204969 () Bool)

(assert (=> b!1316335 m!1204969))

(check-sat (not b_next!29905) tp_is_empty!35635 b_and!48115 (not b!1316335) (not b!1316333) (not start!111294) (not mapNonEmpty!55081) (not b!1316338))
(check-sat b_and!48115 (not b_next!29905))
