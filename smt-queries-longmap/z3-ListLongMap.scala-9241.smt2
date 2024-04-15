; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110794 () Bool)

(assert start!110794)

(declare-fun b_free!29629 () Bool)

(declare-fun b_next!29629 () Bool)

(assert (=> start!110794 (= b_free!29629 (not b_next!29629))))

(declare-fun tp!104210 () Bool)

(declare-fun b_and!47819 () Bool)

(assert (=> start!110794 (= tp!104210 b_and!47819)))

(declare-fun b!1311266 () Bool)

(declare-fun res!870519 () Bool)

(declare-fun e!748049 () Bool)

(assert (=> b!1311266 (=> (not res!870519) (not e!748049))))

(declare-datatypes ((array!87615 0))(
  ( (array!87616 (arr!42288 (Array (_ BitVec 32) (_ BitVec 64))) (size!42840 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87615)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87615 (_ BitVec 32)) Bool)

(assert (=> b!1311266 (= res!870519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54667 () Bool)

(declare-fun mapRes!54667 () Bool)

(assert (=> mapIsEmpty!54667 mapRes!54667))

(declare-fun b!1311267 () Bool)

(declare-fun e!748047 () Bool)

(declare-fun tp_is_empty!35359 () Bool)

(assert (=> b!1311267 (= e!748047 tp_is_empty!35359)))

(declare-fun b!1311268 () Bool)

(declare-fun res!870523 () Bool)

(assert (=> b!1311268 (=> (not res!870523) (not e!748049))))

(declare-datatypes ((V!52249 0))(
  ( (V!52250 (val!17754 Int)) )
))
(declare-datatypes ((ValueCell!16781 0))(
  ( (ValueCellFull!16781 (v!20380 V!52249)) (EmptyCell!16781) )
))
(declare-datatypes ((array!87617 0))(
  ( (array!87618 (arr!42289 (Array (_ BitVec 32) ValueCell!16781)) (size!42841 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87617)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311268 (= res!870523 (and (= (size!42841 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42840 _keys!1628) (size!42841 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311269 () Bool)

(declare-fun e!748045 () Bool)

(assert (=> b!1311269 (= e!748045 tp_is_empty!35359)))

(declare-fun b!1311270 () Bool)

(assert (=> b!1311270 (= e!748049 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585276 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52249)

(declare-fun zeroValue!1296 () V!52249)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22964 0))(
  ( (tuple2!22965 (_1!11493 (_ BitVec 64)) (_2!11493 V!52249)) )
))
(declare-datatypes ((List!30085 0))(
  ( (Nil!30082) (Cons!30081 (h!31290 tuple2!22964) (t!43683 List!30085)) )
))
(declare-datatypes ((ListLongMap!20621 0))(
  ( (ListLongMap!20622 (toList!10326 List!30085)) )
))
(declare-fun contains!8403 (ListLongMap!20621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5221 (array!87615 array!87617 (_ BitVec 32) (_ BitVec 32) V!52249 V!52249 (_ BitVec 32) Int) ListLongMap!20621)

(assert (=> b!1311270 (= lt!585276 (contains!8403 (getCurrentListMap!5221 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54667 () Bool)

(declare-fun tp!104209 () Bool)

(assert (=> mapNonEmpty!54667 (= mapRes!54667 (and tp!104209 e!748047))))

(declare-fun mapKey!54667 () (_ BitVec 32))

(declare-fun mapRest!54667 () (Array (_ BitVec 32) ValueCell!16781))

(declare-fun mapValue!54667 () ValueCell!16781)

(assert (=> mapNonEmpty!54667 (= (arr!42289 _values!1354) (store mapRest!54667 mapKey!54667 mapValue!54667))))

(declare-fun b!1311271 () Bool)

(declare-fun res!870522 () Bool)

(assert (=> b!1311271 (=> (not res!870522) (not e!748049))))

(declare-datatypes ((List!30086 0))(
  ( (Nil!30083) (Cons!30082 (h!31291 (_ BitVec 64)) (t!43684 List!30086)) )
))
(declare-fun arrayNoDuplicates!0 (array!87615 (_ BitVec 32) List!30086) Bool)

(assert (=> b!1311271 (= res!870522 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30083))))

(declare-fun b!1311272 () Bool)

(declare-fun e!748046 () Bool)

(assert (=> b!1311272 (= e!748046 (and e!748045 mapRes!54667))))

(declare-fun condMapEmpty!54667 () Bool)

(declare-fun mapDefault!54667 () ValueCell!16781)

(assert (=> b!1311272 (= condMapEmpty!54667 (= (arr!42289 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16781)) mapDefault!54667)))))

(declare-fun res!870520 () Bool)

(assert (=> start!110794 (=> (not res!870520) (not e!748049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110794 (= res!870520 (validMask!0 mask!2040))))

(assert (=> start!110794 e!748049))

(assert (=> start!110794 tp!104210))

(declare-fun array_inv!32137 (array!87615) Bool)

(assert (=> start!110794 (array_inv!32137 _keys!1628)))

(assert (=> start!110794 true))

(assert (=> start!110794 tp_is_empty!35359))

(declare-fun array_inv!32138 (array!87617) Bool)

(assert (=> start!110794 (and (array_inv!32138 _values!1354) e!748046)))

(declare-fun b!1311265 () Bool)

(declare-fun res!870521 () Bool)

(assert (=> b!1311265 (=> (not res!870521) (not e!748049))))

(assert (=> b!1311265 (= res!870521 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42840 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110794 res!870520) b!1311268))

(assert (= (and b!1311268 res!870523) b!1311266))

(assert (= (and b!1311266 res!870519) b!1311271))

(assert (= (and b!1311271 res!870522) b!1311265))

(assert (= (and b!1311265 res!870521) b!1311270))

(assert (= (and b!1311272 condMapEmpty!54667) mapIsEmpty!54667))

(assert (= (and b!1311272 (not condMapEmpty!54667)) mapNonEmpty!54667))

(get-info :version)

(assert (= (and mapNonEmpty!54667 ((_ is ValueCellFull!16781) mapValue!54667)) b!1311267))

(assert (= (and b!1311272 ((_ is ValueCellFull!16781) mapDefault!54667)) b!1311269))

(assert (= start!110794 b!1311272))

(declare-fun m!1200321 () Bool)

(assert (=> mapNonEmpty!54667 m!1200321))

(declare-fun m!1200323 () Bool)

(assert (=> b!1311271 m!1200323))

(declare-fun m!1200325 () Bool)

(assert (=> b!1311266 m!1200325))

(declare-fun m!1200327 () Bool)

(assert (=> start!110794 m!1200327))

(declare-fun m!1200329 () Bool)

(assert (=> start!110794 m!1200329))

(declare-fun m!1200331 () Bool)

(assert (=> start!110794 m!1200331))

(declare-fun m!1200333 () Bool)

(assert (=> b!1311270 m!1200333))

(assert (=> b!1311270 m!1200333))

(declare-fun m!1200335 () Bool)

(assert (=> b!1311270 m!1200335))

(check-sat b_and!47819 (not b!1311270) tp_is_empty!35359 (not mapNonEmpty!54667) (not b_next!29629) (not start!110794) (not b!1311266) (not b!1311271))
(check-sat b_and!47819 (not b_next!29629))
