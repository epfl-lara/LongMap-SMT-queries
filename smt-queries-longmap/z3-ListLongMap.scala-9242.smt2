; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110800 () Bool)

(assert start!110800)

(declare-fun b_free!29635 () Bool)

(declare-fun b_next!29635 () Bool)

(assert (=> start!110800 (= b_free!29635 (not b_next!29635))))

(declare-fun tp!104228 () Bool)

(declare-fun b_and!47825 () Bool)

(assert (=> start!110800 (= tp!104228 b_and!47825)))

(declare-fun b!1311338 () Bool)

(declare-fun e!748091 () Bool)

(assert (=> b!1311338 (= e!748091 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87625 0))(
  ( (array!87626 (arr!42293 (Array (_ BitVec 32) (_ BitVec 64))) (size!42845 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87625)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52257 0))(
  ( (V!52258 (val!17757 Int)) )
))
(declare-fun minValue!1296 () V!52257)

(declare-datatypes ((ValueCell!16784 0))(
  ( (ValueCellFull!16784 (v!20383 V!52257)) (EmptyCell!16784) )
))
(declare-datatypes ((array!87627 0))(
  ( (array!87628 (arr!42294 (Array (_ BitVec 32) ValueCell!16784)) (size!42846 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87627)

(declare-fun zeroValue!1296 () V!52257)

(declare-fun lt!585285 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22968 0))(
  ( (tuple2!22969 (_1!11495 (_ BitVec 64)) (_2!11495 V!52257)) )
))
(declare-datatypes ((List!30089 0))(
  ( (Nil!30086) (Cons!30085 (h!31294 tuple2!22968) (t!43687 List!30089)) )
))
(declare-datatypes ((ListLongMap!20625 0))(
  ( (ListLongMap!20626 (toList!10328 List!30089)) )
))
(declare-fun contains!8405 (ListLongMap!20625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5223 (array!87625 array!87627 (_ BitVec 32) (_ BitVec 32) V!52257 V!52257 (_ BitVec 32) Int) ListLongMap!20625)

(assert (=> b!1311338 (= lt!585285 (contains!8405 (getCurrentListMap!5223 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311339 () Bool)

(declare-fun e!748092 () Bool)

(declare-fun tp_is_empty!35365 () Bool)

(assert (=> b!1311339 (= e!748092 tp_is_empty!35365)))

(declare-fun b!1311340 () Bool)

(declare-fun res!870565 () Bool)

(assert (=> b!1311340 (=> (not res!870565) (not e!748091))))

(assert (=> b!1311340 (= res!870565 (and (= (size!42846 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42845 _keys!1628) (size!42846 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54676 () Bool)

(declare-fun mapRes!54676 () Bool)

(assert (=> mapIsEmpty!54676 mapRes!54676))

(declare-fun b!1311341 () Bool)

(declare-fun e!748093 () Bool)

(assert (=> b!1311341 (= e!748093 tp_is_empty!35365)))

(declare-fun res!870568 () Bool)

(assert (=> start!110800 (=> (not res!870568) (not e!748091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110800 (= res!870568 (validMask!0 mask!2040))))

(assert (=> start!110800 e!748091))

(assert (=> start!110800 tp!104228))

(declare-fun array_inv!32141 (array!87625) Bool)

(assert (=> start!110800 (array_inv!32141 _keys!1628)))

(assert (=> start!110800 true))

(assert (=> start!110800 tp_is_empty!35365))

(declare-fun e!748090 () Bool)

(declare-fun array_inv!32142 (array!87627) Bool)

(assert (=> start!110800 (and (array_inv!32142 _values!1354) e!748090)))

(declare-fun b!1311337 () Bool)

(declare-fun res!870567 () Bool)

(assert (=> b!1311337 (=> (not res!870567) (not e!748091))))

(declare-datatypes ((List!30090 0))(
  ( (Nil!30087) (Cons!30086 (h!31295 (_ BitVec 64)) (t!43688 List!30090)) )
))
(declare-fun arrayNoDuplicates!0 (array!87625 (_ BitVec 32) List!30090) Bool)

(assert (=> b!1311337 (= res!870567 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30087))))

(declare-fun mapNonEmpty!54676 () Bool)

(declare-fun tp!104227 () Bool)

(assert (=> mapNonEmpty!54676 (= mapRes!54676 (and tp!104227 e!748092))))

(declare-fun mapValue!54676 () ValueCell!16784)

(declare-fun mapKey!54676 () (_ BitVec 32))

(declare-fun mapRest!54676 () (Array (_ BitVec 32) ValueCell!16784))

(assert (=> mapNonEmpty!54676 (= (arr!42294 _values!1354) (store mapRest!54676 mapKey!54676 mapValue!54676))))

(declare-fun b!1311342 () Bool)

(declare-fun res!870564 () Bool)

(assert (=> b!1311342 (=> (not res!870564) (not e!748091))))

(assert (=> b!1311342 (= res!870564 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42845 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311343 () Bool)

(assert (=> b!1311343 (= e!748090 (and e!748093 mapRes!54676))))

(declare-fun condMapEmpty!54676 () Bool)

(declare-fun mapDefault!54676 () ValueCell!16784)

(assert (=> b!1311343 (= condMapEmpty!54676 (= (arr!42294 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16784)) mapDefault!54676)))))

(declare-fun b!1311344 () Bool)

(declare-fun res!870566 () Bool)

(assert (=> b!1311344 (=> (not res!870566) (not e!748091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87625 (_ BitVec 32)) Bool)

(assert (=> b!1311344 (= res!870566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110800 res!870568) b!1311340))

(assert (= (and b!1311340 res!870565) b!1311344))

(assert (= (and b!1311344 res!870566) b!1311337))

(assert (= (and b!1311337 res!870567) b!1311342))

(assert (= (and b!1311342 res!870564) b!1311338))

(assert (= (and b!1311343 condMapEmpty!54676) mapIsEmpty!54676))

(assert (= (and b!1311343 (not condMapEmpty!54676)) mapNonEmpty!54676))

(get-info :version)

(assert (= (and mapNonEmpty!54676 ((_ is ValueCellFull!16784) mapValue!54676)) b!1311339))

(assert (= (and b!1311343 ((_ is ValueCellFull!16784) mapDefault!54676)) b!1311341))

(assert (= start!110800 b!1311343))

(declare-fun m!1200369 () Bool)

(assert (=> start!110800 m!1200369))

(declare-fun m!1200371 () Bool)

(assert (=> start!110800 m!1200371))

(declare-fun m!1200373 () Bool)

(assert (=> start!110800 m!1200373))

(declare-fun m!1200375 () Bool)

(assert (=> mapNonEmpty!54676 m!1200375))

(declare-fun m!1200377 () Bool)

(assert (=> b!1311337 m!1200377))

(declare-fun m!1200379 () Bool)

(assert (=> b!1311338 m!1200379))

(assert (=> b!1311338 m!1200379))

(declare-fun m!1200381 () Bool)

(assert (=> b!1311338 m!1200381))

(declare-fun m!1200383 () Bool)

(assert (=> b!1311344 m!1200383))

(check-sat (not b!1311337) (not b!1311344) (not b!1311338) (not start!110800) (not b_next!29635) b_and!47825 (not mapNonEmpty!54676) tp_is_empty!35365)
(check-sat b_and!47825 (not b_next!29635))
