; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110664 () Bool)

(assert start!110664)

(declare-fun b_free!29499 () Bool)

(declare-fun b_next!29499 () Bool)

(assert (=> start!110664 (= b_free!29499 (not b_next!29499))))

(declare-fun tp!103818 () Bool)

(declare-fun b_and!47707 () Bool)

(assert (=> start!110664 (= tp!103818 b_and!47707)))

(declare-fun b!1309451 () Bool)

(declare-fun e!747105 () Bool)

(declare-fun e!747103 () Bool)

(declare-fun mapRes!54472 () Bool)

(assert (=> b!1309451 (= e!747105 (and e!747103 mapRes!54472))))

(declare-fun condMapEmpty!54472 () Bool)

(declare-datatypes ((V!52075 0))(
  ( (V!52076 (val!17689 Int)) )
))
(declare-datatypes ((ValueCell!16716 0))(
  ( (ValueCellFull!16716 (v!20316 V!52075)) (EmptyCell!16716) )
))
(declare-datatypes ((array!87450 0))(
  ( (array!87451 (arr!42205 (Array (_ BitVec 32) ValueCell!16716)) (size!42755 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87450)

(declare-fun mapDefault!54472 () ValueCell!16716)

(assert (=> b!1309451 (= condMapEmpty!54472 (= (arr!42205 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16716)) mapDefault!54472)))))

(declare-fun b!1309452 () Bool)

(declare-fun res!869253 () Bool)

(declare-fun e!747107 () Bool)

(assert (=> b!1309452 (=> (not res!869253) (not e!747107))))

(declare-datatypes ((array!87452 0))(
  ( (array!87453 (arr!42206 (Array (_ BitVec 32) (_ BitVec 64))) (size!42756 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87452)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87452 (_ BitVec 32)) Bool)

(assert (=> b!1309452 (= res!869253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309453 () Bool)

(declare-fun e!747104 () Bool)

(declare-fun tp_is_empty!35229 () Bool)

(assert (=> b!1309453 (= e!747104 tp_is_empty!35229)))

(declare-fun res!869252 () Bool)

(assert (=> start!110664 (=> (not res!869252) (not e!747107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110664 (= res!869252 (validMask!0 mask!2040))))

(assert (=> start!110664 e!747107))

(assert (=> start!110664 tp!103818))

(declare-fun array_inv!31893 (array!87452) Bool)

(assert (=> start!110664 (array_inv!31893 _keys!1628)))

(assert (=> start!110664 true))

(assert (=> start!110664 tp_is_empty!35229))

(declare-fun array_inv!31894 (array!87450) Bool)

(assert (=> start!110664 (and (array_inv!31894 _values!1354) e!747105)))

(declare-fun b!1309454 () Bool)

(assert (=> b!1309454 (= e!747103 tp_is_empty!35229)))

(declare-fun b!1309455 () Bool)

(assert (=> b!1309455 (= e!747107 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52075)

(declare-fun lt!585267 () Bool)

(declare-fun zeroValue!1296 () V!52075)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22778 0))(
  ( (tuple2!22779 (_1!11400 (_ BitVec 64)) (_2!11400 V!52075)) )
))
(declare-datatypes ((List!29922 0))(
  ( (Nil!29919) (Cons!29918 (h!31127 tuple2!22778) (t!43528 List!29922)) )
))
(declare-datatypes ((ListLongMap!20435 0))(
  ( (ListLongMap!20436 (toList!10233 List!29922)) )
))
(declare-fun contains!8383 (ListLongMap!20435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5246 (array!87452 array!87450 (_ BitVec 32) (_ BitVec 32) V!52075 V!52075 (_ BitVec 32) Int) ListLongMap!20435)

(assert (=> b!1309455 (= lt!585267 (contains!8383 (getCurrentListMap!5246 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309456 () Bool)

(declare-fun res!869249 () Bool)

(assert (=> b!1309456 (=> (not res!869249) (not e!747107))))

(assert (=> b!1309456 (= res!869249 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42756 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54472 () Bool)

(declare-fun tp!103819 () Bool)

(assert (=> mapNonEmpty!54472 (= mapRes!54472 (and tp!103819 e!747104))))

(declare-fun mapRest!54472 () (Array (_ BitVec 32) ValueCell!16716))

(declare-fun mapKey!54472 () (_ BitVec 32))

(declare-fun mapValue!54472 () ValueCell!16716)

(assert (=> mapNonEmpty!54472 (= (arr!42205 _values!1354) (store mapRest!54472 mapKey!54472 mapValue!54472))))

(declare-fun mapIsEmpty!54472 () Bool)

(assert (=> mapIsEmpty!54472 mapRes!54472))

(declare-fun b!1309457 () Bool)

(declare-fun res!869250 () Bool)

(assert (=> b!1309457 (=> (not res!869250) (not e!747107))))

(assert (=> b!1309457 (= res!869250 (and (= (size!42755 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42756 _keys!1628) (size!42755 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309458 () Bool)

(declare-fun res!869251 () Bool)

(assert (=> b!1309458 (=> (not res!869251) (not e!747107))))

(declare-datatypes ((List!29923 0))(
  ( (Nil!29920) (Cons!29919 (h!31128 (_ BitVec 64)) (t!43529 List!29923)) )
))
(declare-fun arrayNoDuplicates!0 (array!87452 (_ BitVec 32) List!29923) Bool)

(assert (=> b!1309458 (= res!869251 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29920))))

(assert (= (and start!110664 res!869252) b!1309457))

(assert (= (and b!1309457 res!869250) b!1309452))

(assert (= (and b!1309452 res!869253) b!1309458))

(assert (= (and b!1309458 res!869251) b!1309456))

(assert (= (and b!1309456 res!869249) b!1309455))

(assert (= (and b!1309451 condMapEmpty!54472) mapIsEmpty!54472))

(assert (= (and b!1309451 (not condMapEmpty!54472)) mapNonEmpty!54472))

(get-info :version)

(assert (= (and mapNonEmpty!54472 ((_ is ValueCellFull!16716) mapValue!54472)) b!1309453))

(assert (= (and b!1309451 ((_ is ValueCellFull!16716) mapDefault!54472)) b!1309454))

(assert (= start!110664 b!1309451))

(declare-fun m!1199527 () Bool)

(assert (=> start!110664 m!1199527))

(declare-fun m!1199529 () Bool)

(assert (=> start!110664 m!1199529))

(declare-fun m!1199531 () Bool)

(assert (=> start!110664 m!1199531))

(declare-fun m!1199533 () Bool)

(assert (=> b!1309455 m!1199533))

(assert (=> b!1309455 m!1199533))

(declare-fun m!1199535 () Bool)

(assert (=> b!1309455 m!1199535))

(declare-fun m!1199537 () Bool)

(assert (=> b!1309452 m!1199537))

(declare-fun m!1199539 () Bool)

(assert (=> b!1309458 m!1199539))

(declare-fun m!1199541 () Bool)

(assert (=> mapNonEmpty!54472 m!1199541))

(check-sat tp_is_empty!35229 (not start!110664) (not mapNonEmpty!54472) (not b_next!29499) b_and!47707 (not b!1309455) (not b!1309452) (not b!1309458))
(check-sat b_and!47707 (not b_next!29499))
