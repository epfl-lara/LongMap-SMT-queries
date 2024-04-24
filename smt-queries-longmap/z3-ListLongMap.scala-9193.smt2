; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110730 () Bool)

(assert start!110730)

(declare-fun b_free!29341 () Bool)

(declare-fun b_next!29341 () Bool)

(assert (=> start!110730 (= b_free!29341 (not b_next!29341))))

(declare-fun tp!103344 () Bool)

(declare-fun b_and!47551 () Bool)

(assert (=> start!110730 (= tp!103344 b_and!47551)))

(declare-fun b!1308530 () Bool)

(declare-fun res!868259 () Bool)

(declare-fun e!746765 () Bool)

(assert (=> b!1308530 (=> (not res!868259) (not e!746765))))

(declare-datatypes ((array!87207 0))(
  ( (array!87208 (arr!42079 (Array (_ BitVec 32) (_ BitVec 64))) (size!42630 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87207)

(declare-datatypes ((List!29868 0))(
  ( (Nil!29865) (Cons!29864 (h!31082 (_ BitVec 64)) (t!43466 List!29868)) )
))
(declare-fun arrayNoDuplicates!0 (array!87207 (_ BitVec 32) List!29868) Bool)

(assert (=> b!1308530 (= res!868259 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29865))))

(declare-fun res!868262 () Bool)

(assert (=> start!110730 (=> (not res!868262) (not e!746765))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110730 (= res!868262 (validMask!0 mask!2040))))

(assert (=> start!110730 e!746765))

(assert (=> start!110730 tp!103344))

(declare-fun array_inv!32063 (array!87207) Bool)

(assert (=> start!110730 (array_inv!32063 _keys!1628)))

(assert (=> start!110730 true))

(declare-fun tp_is_empty!35071 () Bool)

(assert (=> start!110730 tp_is_empty!35071))

(declare-datatypes ((V!51865 0))(
  ( (V!51866 (val!17610 Int)) )
))
(declare-datatypes ((ValueCell!16637 0))(
  ( (ValueCellFull!16637 (v!20232 V!51865)) (EmptyCell!16637) )
))
(declare-datatypes ((array!87209 0))(
  ( (array!87210 (arr!42080 (Array (_ BitVec 32) ValueCell!16637)) (size!42631 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87209)

(declare-fun e!746764 () Bool)

(declare-fun array_inv!32064 (array!87209) Bool)

(assert (=> start!110730 (and (array_inv!32064 _values!1354) e!746764)))

(declare-fun b!1308531 () Bool)

(declare-fun res!868260 () Bool)

(assert (=> b!1308531 (=> (not res!868260) (not e!746765))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308531 (= res!868260 (and (= (size!42631 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42630 _keys!1628) (size!42631 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308532 () Bool)

(declare-fun res!868258 () Bool)

(assert (=> b!1308532 (=> (not res!868258) (not e!746765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87207 (_ BitVec 32)) Bool)

(assert (=> b!1308532 (= res!868258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308533 () Bool)

(declare-fun e!746762 () Bool)

(assert (=> b!1308533 (= e!746762 tp_is_empty!35071)))

(declare-fun b!1308534 () Bool)

(declare-fun e!746763 () Bool)

(assert (=> b!1308534 (= e!746763 tp_is_empty!35071)))

(declare-fun mapIsEmpty!54235 () Bool)

(declare-fun mapRes!54235 () Bool)

(assert (=> mapIsEmpty!54235 mapRes!54235))

(declare-fun b!1308535 () Bool)

(declare-fun res!868261 () Bool)

(assert (=> b!1308535 (=> (not res!868261) (not e!746765))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308535 (= res!868261 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42630 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308536 () Bool)

(assert (=> b!1308536 (= e!746764 (and e!746762 mapRes!54235))))

(declare-fun condMapEmpty!54235 () Bool)

(declare-fun mapDefault!54235 () ValueCell!16637)

(assert (=> b!1308536 (= condMapEmpty!54235 (= (arr!42080 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16637)) mapDefault!54235)))))

(declare-fun mapNonEmpty!54235 () Bool)

(declare-fun tp!103345 () Bool)

(assert (=> mapNonEmpty!54235 (= mapRes!54235 (and tp!103345 e!746763))))

(declare-fun mapRest!54235 () (Array (_ BitVec 32) ValueCell!16637))

(declare-fun mapValue!54235 () ValueCell!16637)

(declare-fun mapKey!54235 () (_ BitVec 32))

(assert (=> mapNonEmpty!54235 (= (arr!42080 _values!1354) (store mapRest!54235 mapKey!54235 mapValue!54235))))

(declare-fun b!1308537 () Bool)

(assert (=> b!1308537 (= e!746765 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51865)

(declare-fun zeroValue!1296 () V!51865)

(declare-fun lt!585506 () Bool)

(declare-datatypes ((tuple2!22702 0))(
  ( (tuple2!22703 (_1!11362 (_ BitVec 64)) (_2!11362 V!51865)) )
))
(declare-datatypes ((List!29869 0))(
  ( (Nil!29866) (Cons!29865 (h!31083 tuple2!22702) (t!43467 List!29869)) )
))
(declare-datatypes ((ListLongMap!20367 0))(
  ( (ListLongMap!20368 (toList!10199 List!29869)) )
))
(declare-fun contains!8361 (ListLongMap!20367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5203 (array!87207 array!87209 (_ BitVec 32) (_ BitVec 32) V!51865 V!51865 (_ BitVec 32) Int) ListLongMap!20367)

(assert (=> b!1308537 (= lt!585506 (contains!8361 (getCurrentListMap!5203 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110730 res!868262) b!1308531))

(assert (= (and b!1308531 res!868260) b!1308532))

(assert (= (and b!1308532 res!868258) b!1308530))

(assert (= (and b!1308530 res!868259) b!1308535))

(assert (= (and b!1308535 res!868261) b!1308537))

(assert (= (and b!1308536 condMapEmpty!54235) mapIsEmpty!54235))

(assert (= (and b!1308536 (not condMapEmpty!54235)) mapNonEmpty!54235))

(get-info :version)

(assert (= (and mapNonEmpty!54235 ((_ is ValueCellFull!16637) mapValue!54235)) b!1308534))

(assert (= (and b!1308536 ((_ is ValueCellFull!16637) mapDefault!54235)) b!1308533))

(assert (= start!110730 b!1308536))

(declare-fun m!1199591 () Bool)

(assert (=> b!1308532 m!1199591))

(declare-fun m!1199593 () Bool)

(assert (=> b!1308530 m!1199593))

(declare-fun m!1199595 () Bool)

(assert (=> start!110730 m!1199595))

(declare-fun m!1199597 () Bool)

(assert (=> start!110730 m!1199597))

(declare-fun m!1199599 () Bool)

(assert (=> start!110730 m!1199599))

(declare-fun m!1199601 () Bool)

(assert (=> mapNonEmpty!54235 m!1199601))

(declare-fun m!1199603 () Bool)

(assert (=> b!1308537 m!1199603))

(assert (=> b!1308537 m!1199603))

(declare-fun m!1199605 () Bool)

(assert (=> b!1308537 m!1199605))

(check-sat (not b_next!29341) (not b!1308532) (not b!1308537) (not mapNonEmpty!54235) tp_is_empty!35071 (not b!1308530) b_and!47551 (not start!110730))
(check-sat b_and!47551 (not b_next!29341))
