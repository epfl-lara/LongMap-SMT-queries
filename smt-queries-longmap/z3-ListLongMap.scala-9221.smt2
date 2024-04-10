; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110676 () Bool)

(assert start!110676)

(declare-fun b_free!29511 () Bool)

(declare-fun b_next!29511 () Bool)

(assert (=> start!110676 (= b_free!29511 (not b_next!29511))))

(declare-fun tp!103855 () Bool)

(declare-fun b_and!47719 () Bool)

(assert (=> start!110676 (= tp!103855 b_and!47719)))

(declare-fun b!1309595 () Bool)

(declare-fun e!747197 () Bool)

(declare-fun tp_is_empty!35241 () Bool)

(assert (=> b!1309595 (= e!747197 tp_is_empty!35241)))

(declare-fun b!1309596 () Bool)

(declare-fun res!869339 () Bool)

(declare-fun e!747196 () Bool)

(assert (=> b!1309596 (=> (not res!869339) (not e!747196))))

(declare-datatypes ((array!87472 0))(
  ( (array!87473 (arr!42216 (Array (_ BitVec 32) (_ BitVec 64))) (size!42766 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87472)

(declare-datatypes ((List!29930 0))(
  ( (Nil!29927) (Cons!29926 (h!31135 (_ BitVec 64)) (t!43536 List!29930)) )
))
(declare-fun arrayNoDuplicates!0 (array!87472 (_ BitVec 32) List!29930) Bool)

(assert (=> b!1309596 (= res!869339 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29927))))

(declare-fun b!1309597 () Bool)

(declare-fun e!747195 () Bool)

(assert (=> b!1309597 (= e!747195 tp_is_empty!35241)))

(declare-fun b!1309598 () Bool)

(declare-fun res!869342 () Bool)

(assert (=> b!1309598 (=> (not res!869342) (not e!747196))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87472 (_ BitVec 32)) Bool)

(assert (=> b!1309598 (= res!869342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309599 () Bool)

(declare-fun res!869343 () Bool)

(assert (=> b!1309599 (=> (not res!869343) (not e!747196))))

(declare-datatypes ((V!52091 0))(
  ( (V!52092 (val!17695 Int)) )
))
(declare-datatypes ((ValueCell!16722 0))(
  ( (ValueCellFull!16722 (v!20322 V!52091)) (EmptyCell!16722) )
))
(declare-datatypes ((array!87474 0))(
  ( (array!87475 (arr!42217 (Array (_ BitVec 32) ValueCell!16722)) (size!42767 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87474)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309599 (= res!869343 (and (= (size!42767 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42766 _keys!1628) (size!42767 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54490 () Bool)

(declare-fun mapRes!54490 () Bool)

(declare-fun tp!103854 () Bool)

(assert (=> mapNonEmpty!54490 (= mapRes!54490 (and tp!103854 e!747195))))

(declare-fun mapValue!54490 () ValueCell!16722)

(declare-fun mapRest!54490 () (Array (_ BitVec 32) ValueCell!16722))

(declare-fun mapKey!54490 () (_ BitVec 32))

(assert (=> mapNonEmpty!54490 (= (arr!42217 _values!1354) (store mapRest!54490 mapKey!54490 mapValue!54490))))

(declare-fun res!869340 () Bool)

(assert (=> start!110676 (=> (not res!869340) (not e!747196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110676 (= res!869340 (validMask!0 mask!2040))))

(assert (=> start!110676 e!747196))

(assert (=> start!110676 tp!103855))

(declare-fun array_inv!31903 (array!87472) Bool)

(assert (=> start!110676 (array_inv!31903 _keys!1628)))

(assert (=> start!110676 true))

(assert (=> start!110676 tp_is_empty!35241))

(declare-fun e!747194 () Bool)

(declare-fun array_inv!31904 (array!87474) Bool)

(assert (=> start!110676 (and (array_inv!31904 _values!1354) e!747194)))

(declare-fun b!1309600 () Bool)

(declare-fun res!869341 () Bool)

(assert (=> b!1309600 (=> (not res!869341) (not e!747196))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309600 (= res!869341 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42766 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309601 () Bool)

(assert (=> b!1309601 (= e!747194 (and e!747197 mapRes!54490))))

(declare-fun condMapEmpty!54490 () Bool)

(declare-fun mapDefault!54490 () ValueCell!16722)

(assert (=> b!1309601 (= condMapEmpty!54490 (= (arr!42217 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16722)) mapDefault!54490)))))

(declare-fun b!1309602 () Bool)

(assert (=> b!1309602 (= e!747196 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52091)

(declare-fun zeroValue!1296 () V!52091)

(declare-fun lt!585285 () Bool)

(declare-datatypes ((tuple2!22788 0))(
  ( (tuple2!22789 (_1!11405 (_ BitVec 64)) (_2!11405 V!52091)) )
))
(declare-datatypes ((List!29931 0))(
  ( (Nil!29928) (Cons!29927 (h!31136 tuple2!22788) (t!43537 List!29931)) )
))
(declare-datatypes ((ListLongMap!20445 0))(
  ( (ListLongMap!20446 (toList!10238 List!29931)) )
))
(declare-fun contains!8388 (ListLongMap!20445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5251 (array!87472 array!87474 (_ BitVec 32) (_ BitVec 32) V!52091 V!52091 (_ BitVec 32) Int) ListLongMap!20445)

(assert (=> b!1309602 (= lt!585285 (contains!8388 (getCurrentListMap!5251 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54490 () Bool)

(assert (=> mapIsEmpty!54490 mapRes!54490))

(assert (= (and start!110676 res!869340) b!1309599))

(assert (= (and b!1309599 res!869343) b!1309598))

(assert (= (and b!1309598 res!869342) b!1309596))

(assert (= (and b!1309596 res!869339) b!1309600))

(assert (= (and b!1309600 res!869341) b!1309602))

(assert (= (and b!1309601 condMapEmpty!54490) mapIsEmpty!54490))

(assert (= (and b!1309601 (not condMapEmpty!54490)) mapNonEmpty!54490))

(get-info :version)

(assert (= (and mapNonEmpty!54490 ((_ is ValueCellFull!16722) mapValue!54490)) b!1309597))

(assert (= (and b!1309601 ((_ is ValueCellFull!16722) mapDefault!54490)) b!1309595))

(assert (= start!110676 b!1309601))

(declare-fun m!1199623 () Bool)

(assert (=> b!1309596 m!1199623))

(declare-fun m!1199625 () Bool)

(assert (=> mapNonEmpty!54490 m!1199625))

(declare-fun m!1199627 () Bool)

(assert (=> start!110676 m!1199627))

(declare-fun m!1199629 () Bool)

(assert (=> start!110676 m!1199629))

(declare-fun m!1199631 () Bool)

(assert (=> start!110676 m!1199631))

(declare-fun m!1199633 () Bool)

(assert (=> b!1309598 m!1199633))

(declare-fun m!1199635 () Bool)

(assert (=> b!1309602 m!1199635))

(assert (=> b!1309602 m!1199635))

(declare-fun m!1199637 () Bool)

(assert (=> b!1309602 m!1199637))

(check-sat (not b!1309598) (not mapNonEmpty!54490) (not b!1309602) (not b_next!29511) tp_is_empty!35241 b_and!47719 (not b!1309596) (not start!110676))
(check-sat b_and!47719 (not b_next!29511))
