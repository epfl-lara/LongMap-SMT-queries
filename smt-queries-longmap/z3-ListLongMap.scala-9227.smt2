; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110934 () Bool)

(assert start!110934)

(declare-fun b_free!29545 () Bool)

(declare-fun b_next!29545 () Bool)

(assert (=> start!110934 (= b_free!29545 (not b_next!29545))))

(declare-fun tp!103957 () Bool)

(declare-fun b_and!47755 () Bool)

(assert (=> start!110934 (= tp!103957 b_and!47755)))

(declare-fun b!1311454 () Bool)

(declare-fun res!870270 () Bool)

(declare-fun e!748293 () Bool)

(assert (=> b!1311454 (=> (not res!870270) (not e!748293))))

(declare-datatypes ((array!87603 0))(
  ( (array!87604 (arr!42277 (Array (_ BitVec 32) (_ BitVec 64))) (size!42828 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87603)

(declare-datatypes ((List!30014 0))(
  ( (Nil!30011) (Cons!30010 (h!31228 (_ BitVec 64)) (t!43612 List!30014)) )
))
(declare-fun arrayNoDuplicates!0 (array!87603 (_ BitVec 32) List!30014) Bool)

(assert (=> b!1311454 (= res!870270 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30011))))

(declare-fun mapNonEmpty!54541 () Bool)

(declare-fun mapRes!54541 () Bool)

(declare-fun tp!103956 () Bool)

(declare-fun e!748292 () Bool)

(assert (=> mapNonEmpty!54541 (= mapRes!54541 (and tp!103956 e!748292))))

(declare-datatypes ((V!52137 0))(
  ( (V!52138 (val!17712 Int)) )
))
(declare-datatypes ((ValueCell!16739 0))(
  ( (ValueCellFull!16739 (v!20334 V!52137)) (EmptyCell!16739) )
))
(declare-fun mapRest!54541 () (Array (_ BitVec 32) ValueCell!16739))

(declare-datatypes ((array!87605 0))(
  ( (array!87606 (arr!42278 (Array (_ BitVec 32) ValueCell!16739)) (size!42829 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87605)

(declare-fun mapKey!54541 () (_ BitVec 32))

(declare-fun mapValue!54541 () ValueCell!16739)

(assert (=> mapNonEmpty!54541 (= (arr!42278 _values!1354) (store mapRest!54541 mapKey!54541 mapValue!54541))))

(declare-fun b!1311455 () Bool)

(declare-fun e!748295 () Bool)

(declare-fun e!748294 () Bool)

(assert (=> b!1311455 (= e!748295 (and e!748294 mapRes!54541))))

(declare-fun condMapEmpty!54541 () Bool)

(declare-fun mapDefault!54541 () ValueCell!16739)

(assert (=> b!1311455 (= condMapEmpty!54541 (= (arr!42278 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16739)) mapDefault!54541)))))

(declare-fun res!870266 () Bool)

(assert (=> start!110934 (=> (not res!870266) (not e!748293))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110934 (= res!870266 (validMask!0 mask!2040))))

(assert (=> start!110934 e!748293))

(assert (=> start!110934 tp!103957))

(declare-fun array_inv!32217 (array!87603) Bool)

(assert (=> start!110934 (array_inv!32217 _keys!1628)))

(assert (=> start!110934 true))

(declare-fun tp_is_empty!35275 () Bool)

(assert (=> start!110934 tp_is_empty!35275))

(declare-fun array_inv!32218 (array!87605) Bool)

(assert (=> start!110934 (and (array_inv!32218 _values!1354) e!748295)))

(declare-fun b!1311456 () Bool)

(declare-fun res!870265 () Bool)

(assert (=> b!1311456 (=> (not res!870265) (not e!748293))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311456 (= res!870265 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42828 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311457 () Bool)

(assert (=> b!1311457 (= e!748293 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52137)

(declare-fun zeroValue!1296 () V!52137)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22860 0))(
  ( (tuple2!22861 (_1!11441 (_ BitVec 64)) (_2!11441 V!52137)) )
))
(declare-datatypes ((List!30015 0))(
  ( (Nil!30012) (Cons!30011 (h!31229 tuple2!22860) (t!43613 List!30015)) )
))
(declare-datatypes ((ListLongMap!20525 0))(
  ( (ListLongMap!20526 (toList!10278 List!30015)) )
))
(declare-fun contains!8440 (ListLongMap!20525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5282 (array!87603 array!87605 (_ BitVec 32) (_ BitVec 32) V!52137 V!52137 (_ BitVec 32) Int) ListLongMap!20525)

(assert (=> b!1311457 (contains!8440 (getCurrentListMap!5282 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43299 0))(
  ( (Unit!43300) )
))
(declare-fun lt!585812 () Unit!43299)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!11 (array!87603 array!87605 (_ BitVec 32) (_ BitVec 32) V!52137 V!52137 (_ BitVec 64) (_ BitVec 32) Int) Unit!43299)

(assert (=> b!1311457 (= lt!585812 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311458 () Bool)

(assert (=> b!1311458 (= e!748292 tp_is_empty!35275)))

(declare-fun mapIsEmpty!54541 () Bool)

(assert (=> mapIsEmpty!54541 mapRes!54541))

(declare-fun b!1311459 () Bool)

(declare-fun res!870264 () Bool)

(assert (=> b!1311459 (=> (not res!870264) (not e!748293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311459 (= res!870264 (validKeyInArray!0 (select (arr!42277 _keys!1628) from!2020)))))

(declare-fun b!1311460 () Bool)

(declare-fun res!870269 () Bool)

(assert (=> b!1311460 (=> (not res!870269) (not e!748293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87603 (_ BitVec 32)) Bool)

(assert (=> b!1311460 (= res!870269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311461 () Bool)

(declare-fun res!870271 () Bool)

(assert (=> b!1311461 (=> (not res!870271) (not e!748293))))

(assert (=> b!1311461 (= res!870271 (contains!8440 (getCurrentListMap!5282 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311462 () Bool)

(declare-fun res!870272 () Bool)

(assert (=> b!1311462 (=> (not res!870272) (not e!748293))))

(assert (=> b!1311462 (= res!870272 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311463 () Bool)

(declare-fun res!870268 () Bool)

(assert (=> b!1311463 (=> (not res!870268) (not e!748293))))

(assert (=> b!1311463 (= res!870268 (and (= (size!42829 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42828 _keys!1628) (size!42829 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311464 () Bool)

(assert (=> b!1311464 (= e!748294 tp_is_empty!35275)))

(declare-fun b!1311465 () Bool)

(declare-fun res!870267 () Bool)

(assert (=> b!1311465 (=> (not res!870267) (not e!748293))))

(assert (=> b!1311465 (= res!870267 (not (= (select (arr!42277 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!110934 res!870266) b!1311463))

(assert (= (and b!1311463 res!870268) b!1311460))

(assert (= (and b!1311460 res!870269) b!1311454))

(assert (= (and b!1311454 res!870270) b!1311456))

(assert (= (and b!1311456 res!870265) b!1311461))

(assert (= (and b!1311461 res!870271) b!1311465))

(assert (= (and b!1311465 res!870267) b!1311459))

(assert (= (and b!1311459 res!870264) b!1311462))

(assert (= (and b!1311462 res!870272) b!1311457))

(assert (= (and b!1311455 condMapEmpty!54541) mapIsEmpty!54541))

(assert (= (and b!1311455 (not condMapEmpty!54541)) mapNonEmpty!54541))

(get-info :version)

(assert (= (and mapNonEmpty!54541 ((_ is ValueCellFull!16739) mapValue!54541)) b!1311458))

(assert (= (and b!1311455 ((_ is ValueCellFull!16739) mapDefault!54541)) b!1311464))

(assert (= start!110934 b!1311455))

(declare-fun m!1201613 () Bool)

(assert (=> b!1311461 m!1201613))

(assert (=> b!1311461 m!1201613))

(declare-fun m!1201615 () Bool)

(assert (=> b!1311461 m!1201615))

(declare-fun m!1201617 () Bool)

(assert (=> b!1311454 m!1201617))

(declare-fun m!1201619 () Bool)

(assert (=> mapNonEmpty!54541 m!1201619))

(declare-fun m!1201621 () Bool)

(assert (=> b!1311457 m!1201621))

(assert (=> b!1311457 m!1201621))

(declare-fun m!1201623 () Bool)

(assert (=> b!1311457 m!1201623))

(declare-fun m!1201625 () Bool)

(assert (=> b!1311457 m!1201625))

(declare-fun m!1201627 () Bool)

(assert (=> b!1311459 m!1201627))

(assert (=> b!1311459 m!1201627))

(declare-fun m!1201629 () Bool)

(assert (=> b!1311459 m!1201629))

(declare-fun m!1201631 () Bool)

(assert (=> b!1311460 m!1201631))

(assert (=> b!1311465 m!1201627))

(declare-fun m!1201633 () Bool)

(assert (=> start!110934 m!1201633))

(declare-fun m!1201635 () Bool)

(assert (=> start!110934 m!1201635))

(declare-fun m!1201637 () Bool)

(assert (=> start!110934 m!1201637))

(check-sat tp_is_empty!35275 (not b!1311459) (not start!110934) (not b!1311460) (not b!1311457) b_and!47755 (not b!1311454) (not b_next!29545) (not mapNonEmpty!54541) (not b!1311461))
(check-sat b_and!47755 (not b_next!29545))
