; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111108 () Bool)

(assert start!111108)

(declare-fun b_free!29943 () Bool)

(declare-fun b_next!29943 () Bool)

(assert (=> start!111108 (= b_free!29943 (not b_next!29943))))

(declare-fun tp!105150 () Bool)

(declare-fun b_and!48151 () Bool)

(assert (=> start!111108 (= tp!105150 b_and!48151)))

(declare-fun res!873328 () Bool)

(declare-fun e!750437 () Bool)

(assert (=> start!111108 (=> (not res!873328) (not e!750437))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111108 (= res!873328 (validMask!0 mask!2040))))

(assert (=> start!111108 e!750437))

(assert (=> start!111108 tp!105150))

(declare-datatypes ((array!88308 0))(
  ( (array!88309 (arr!42634 (Array (_ BitVec 32) (_ BitVec 64))) (size!43184 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88308)

(declare-fun array_inv!32199 (array!88308) Bool)

(assert (=> start!111108 (array_inv!32199 _keys!1628)))

(assert (=> start!111108 true))

(declare-fun tp_is_empty!35673 () Bool)

(assert (=> start!111108 tp_is_empty!35673))

(declare-datatypes ((V!52667 0))(
  ( (V!52668 (val!17911 Int)) )
))
(declare-datatypes ((ValueCell!16938 0))(
  ( (ValueCellFull!16938 (v!20538 V!52667)) (EmptyCell!16938) )
))
(declare-datatypes ((array!88310 0))(
  ( (array!88311 (arr!42635 (Array (_ BitVec 32) ValueCell!16938)) (size!43185 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88310)

(declare-fun e!750433 () Bool)

(declare-fun array_inv!32200 (array!88310) Bool)

(assert (=> start!111108 (and (array_inv!32200 _values!1354) e!750433)))

(declare-fun b!1315526 () Bool)

(declare-fun e!750436 () Bool)

(assert (=> b!1315526 (= e!750436 tp_is_empty!35673)))

(declare-fun mapNonEmpty!55138 () Bool)

(declare-fun mapRes!55138 () Bool)

(declare-fun tp!105151 () Bool)

(assert (=> mapNonEmpty!55138 (= mapRes!55138 (and tp!105151 e!750436))))

(declare-fun mapRest!55138 () (Array (_ BitVec 32) ValueCell!16938))

(declare-fun mapKey!55138 () (_ BitVec 32))

(declare-fun mapValue!55138 () ValueCell!16938)

(assert (=> mapNonEmpty!55138 (= (arr!42635 _values!1354) (store mapRest!55138 mapKey!55138 mapValue!55138))))

(declare-fun mapIsEmpty!55138 () Bool)

(assert (=> mapIsEmpty!55138 mapRes!55138))

(declare-fun b!1315527 () Bool)

(declare-fun e!750435 () Bool)

(assert (=> b!1315527 (= e!750435 tp_is_empty!35673)))

(declare-fun b!1315528 () Bool)

(assert (=> b!1315528 (= e!750433 (and e!750435 mapRes!55138))))

(declare-fun condMapEmpty!55138 () Bool)

(declare-fun mapDefault!55138 () ValueCell!16938)

(assert (=> b!1315528 (= condMapEmpty!55138 (= (arr!42635 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16938)) mapDefault!55138)))))

(declare-fun b!1315529 () Bool)

(declare-fun res!873327 () Bool)

(assert (=> b!1315529 (=> (not res!873327) (not e!750437))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315529 (= res!873327 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43184 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315530 () Bool)

(declare-fun res!873329 () Bool)

(assert (=> b!1315530 (=> (not res!873329) (not e!750437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88308 (_ BitVec 32)) Bool)

(assert (=> b!1315530 (= res!873329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315531 () Bool)

(declare-fun res!873330 () Bool)

(assert (=> b!1315531 (=> (not res!873330) (not e!750437))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315531 (= res!873330 (and (= (size!43185 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43184 _keys!1628) (size!43185 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315532 () Bool)

(assert (=> b!1315532 (= e!750437 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585924 () Bool)

(declare-fun minValue!1296 () V!52667)

(declare-fun zeroValue!1296 () V!52667)

(declare-datatypes ((tuple2!23108 0))(
  ( (tuple2!23109 (_1!11565 (_ BitVec 64)) (_2!11565 V!52667)) )
))
(declare-datatypes ((List!30243 0))(
  ( (Nil!30240) (Cons!30239 (h!31448 tuple2!23108) (t!43849 List!30243)) )
))
(declare-datatypes ((ListLongMap!20765 0))(
  ( (ListLongMap!20766 (toList!10398 List!30243)) )
))
(declare-fun contains!8548 (ListLongMap!20765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5411 (array!88308 array!88310 (_ BitVec 32) (_ BitVec 32) V!52667 V!52667 (_ BitVec 32) Int) ListLongMap!20765)

(assert (=> b!1315532 (= lt!585924 (contains!8548 (getCurrentListMap!5411 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315533 () Bool)

(declare-fun res!873326 () Bool)

(assert (=> b!1315533 (=> (not res!873326) (not e!750437))))

(declare-datatypes ((List!30244 0))(
  ( (Nil!30241) (Cons!30240 (h!31449 (_ BitVec 64)) (t!43850 List!30244)) )
))
(declare-fun arrayNoDuplicates!0 (array!88308 (_ BitVec 32) List!30244) Bool)

(assert (=> b!1315533 (= res!873326 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30241))))

(assert (= (and start!111108 res!873328) b!1315531))

(assert (= (and b!1315531 res!873330) b!1315530))

(assert (= (and b!1315530 res!873329) b!1315533))

(assert (= (and b!1315533 res!873326) b!1315529))

(assert (= (and b!1315529 res!873327) b!1315532))

(assert (= (and b!1315528 condMapEmpty!55138) mapIsEmpty!55138))

(assert (= (and b!1315528 (not condMapEmpty!55138)) mapNonEmpty!55138))

(get-info :version)

(assert (= (and mapNonEmpty!55138 ((_ is ValueCellFull!16938) mapValue!55138)) b!1315526))

(assert (= (and b!1315528 ((_ is ValueCellFull!16938) mapDefault!55138)) b!1315527))

(assert (= start!111108 b!1315528))

(declare-fun m!1203691 () Bool)

(assert (=> b!1315532 m!1203691))

(assert (=> b!1315532 m!1203691))

(declare-fun m!1203693 () Bool)

(assert (=> b!1315532 m!1203693))

(declare-fun m!1203695 () Bool)

(assert (=> b!1315533 m!1203695))

(declare-fun m!1203697 () Bool)

(assert (=> start!111108 m!1203697))

(declare-fun m!1203699 () Bool)

(assert (=> start!111108 m!1203699))

(declare-fun m!1203701 () Bool)

(assert (=> start!111108 m!1203701))

(declare-fun m!1203703 () Bool)

(assert (=> mapNonEmpty!55138 m!1203703))

(declare-fun m!1203705 () Bool)

(assert (=> b!1315530 m!1203705))

(check-sat b_and!48151 (not b_next!29943) (not start!111108) (not b!1315530) (not b!1315533) (not b!1315532) (not mapNonEmpty!55138) tp_is_empty!35673)
(check-sat b_and!48151 (not b_next!29943))
