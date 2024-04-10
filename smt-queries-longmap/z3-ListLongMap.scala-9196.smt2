; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110526 () Bool)

(assert start!110526)

(declare-fun b_free!29361 () Bool)

(declare-fun b_next!29361 () Bool)

(assert (=> start!110526 (= b_free!29361 (not b_next!29361))))

(declare-fun tp!103404 () Bool)

(declare-fun b_and!47569 () Bool)

(assert (=> start!110526 (= tp!103404 b_and!47569)))

(declare-fun mapIsEmpty!54265 () Bool)

(declare-fun mapRes!54265 () Bool)

(assert (=> mapIsEmpty!54265 mapRes!54265))

(declare-fun mapNonEmpty!54265 () Bool)

(declare-fun tp!103405 () Bool)

(declare-fun e!746072 () Bool)

(assert (=> mapNonEmpty!54265 (= mapRes!54265 (and tp!103405 e!746072))))

(declare-datatypes ((V!51891 0))(
  ( (V!51892 (val!17620 Int)) )
))
(declare-datatypes ((ValueCell!16647 0))(
  ( (ValueCellFull!16647 (v!20247 V!51891)) (EmptyCell!16647) )
))
(declare-fun mapValue!54265 () ValueCell!16647)

(declare-fun mapRest!54265 () (Array (_ BitVec 32) ValueCell!16647))

(declare-fun mapKey!54265 () (_ BitVec 32))

(declare-datatypes ((array!87184 0))(
  ( (array!87185 (arr!42072 (Array (_ BitVec 32) ValueCell!16647)) (size!42622 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87184)

(assert (=> mapNonEmpty!54265 (= (arr!42072 _values!1354) (store mapRest!54265 mapKey!54265 mapValue!54265))))

(declare-fun b!1307471 () Bool)

(declare-fun tp_is_empty!35091 () Bool)

(assert (=> b!1307471 (= e!746072 tp_is_empty!35091)))

(declare-fun b!1307472 () Bool)

(declare-fun res!867891 () Bool)

(declare-fun e!746071 () Bool)

(assert (=> b!1307472 (=> (not res!867891) (not e!746071))))

(declare-datatypes ((array!87186 0))(
  ( (array!87187 (arr!42073 (Array (_ BitVec 32) (_ BitVec 64))) (size!42623 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87186)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307472 (= res!867891 (and (= (size!42622 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42623 _keys!1628) (size!42622 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867893 () Bool)

(assert (=> start!110526 (=> (not res!867893) (not e!746071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110526 (= res!867893 (validMask!0 mask!2040))))

(assert (=> start!110526 e!746071))

(assert (=> start!110526 tp!103404))

(declare-fun array_inv!31803 (array!87186) Bool)

(assert (=> start!110526 (array_inv!31803 _keys!1628)))

(assert (=> start!110526 true))

(assert (=> start!110526 tp_is_empty!35091))

(declare-fun e!746069 () Bool)

(declare-fun array_inv!31804 (array!87184) Bool)

(assert (=> start!110526 (and (array_inv!31804 _values!1354) e!746069)))

(declare-fun b!1307473 () Bool)

(declare-fun res!867890 () Bool)

(assert (=> b!1307473 (=> (not res!867890) (not e!746071))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307473 (= res!867890 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42623 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307474 () Bool)

(assert (=> b!1307474 (= e!746071 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585060 () Bool)

(declare-fun minValue!1296 () V!51891)

(declare-fun zeroValue!1296 () V!51891)

(declare-datatypes ((tuple2!22686 0))(
  ( (tuple2!22687 (_1!11354 (_ BitVec 64)) (_2!11354 V!51891)) )
))
(declare-datatypes ((List!29827 0))(
  ( (Nil!29824) (Cons!29823 (h!31032 tuple2!22686) (t!43433 List!29827)) )
))
(declare-datatypes ((ListLongMap!20343 0))(
  ( (ListLongMap!20344 (toList!10187 List!29827)) )
))
(declare-fun contains!8337 (ListLongMap!20343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5200 (array!87186 array!87184 (_ BitVec 32) (_ BitVec 32) V!51891 V!51891 (_ BitVec 32) Int) ListLongMap!20343)

(assert (=> b!1307474 (= lt!585060 (contains!8337 (getCurrentListMap!5200 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307475 () Bool)

(declare-fun e!746070 () Bool)

(assert (=> b!1307475 (= e!746070 tp_is_empty!35091)))

(declare-fun b!1307476 () Bool)

(declare-fun res!867892 () Bool)

(assert (=> b!1307476 (=> (not res!867892) (not e!746071))))

(declare-datatypes ((List!29828 0))(
  ( (Nil!29825) (Cons!29824 (h!31033 (_ BitVec 64)) (t!43434 List!29828)) )
))
(declare-fun arrayNoDuplicates!0 (array!87186 (_ BitVec 32) List!29828) Bool)

(assert (=> b!1307476 (= res!867892 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29825))))

(declare-fun b!1307477 () Bool)

(assert (=> b!1307477 (= e!746069 (and e!746070 mapRes!54265))))

(declare-fun condMapEmpty!54265 () Bool)

(declare-fun mapDefault!54265 () ValueCell!16647)

(assert (=> b!1307477 (= condMapEmpty!54265 (= (arr!42072 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16647)) mapDefault!54265)))))

(declare-fun b!1307478 () Bool)

(declare-fun res!867894 () Bool)

(assert (=> b!1307478 (=> (not res!867894) (not e!746071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87186 (_ BitVec 32)) Bool)

(assert (=> b!1307478 (= res!867894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110526 res!867893) b!1307472))

(assert (= (and b!1307472 res!867891) b!1307478))

(assert (= (and b!1307478 res!867894) b!1307476))

(assert (= (and b!1307476 res!867892) b!1307473))

(assert (= (and b!1307473 res!867890) b!1307474))

(assert (= (and b!1307477 condMapEmpty!54265) mapIsEmpty!54265))

(assert (= (and b!1307477 (not condMapEmpty!54265)) mapNonEmpty!54265))

(get-info :version)

(assert (= (and mapNonEmpty!54265 ((_ is ValueCellFull!16647) mapValue!54265)) b!1307471))

(assert (= (and b!1307477 ((_ is ValueCellFull!16647) mapDefault!54265)) b!1307475))

(assert (= start!110526 b!1307477))

(declare-fun m!1198153 () Bool)

(assert (=> b!1307478 m!1198153))

(declare-fun m!1198155 () Bool)

(assert (=> start!110526 m!1198155))

(declare-fun m!1198157 () Bool)

(assert (=> start!110526 m!1198157))

(declare-fun m!1198159 () Bool)

(assert (=> start!110526 m!1198159))

(declare-fun m!1198161 () Bool)

(assert (=> mapNonEmpty!54265 m!1198161))

(declare-fun m!1198163 () Bool)

(assert (=> b!1307474 m!1198163))

(assert (=> b!1307474 m!1198163))

(declare-fun m!1198165 () Bool)

(assert (=> b!1307474 m!1198165))

(declare-fun m!1198167 () Bool)

(assert (=> b!1307476 m!1198167))

(check-sat (not mapNonEmpty!54265) (not b!1307476) (not b!1307474) (not b!1307478) (not start!110526) tp_is_empty!35091 (not b_next!29361) b_and!47569)
(check-sat b_and!47569 (not b_next!29361))
