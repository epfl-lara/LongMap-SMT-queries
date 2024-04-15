; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111016 () Bool)

(assert start!111016)

(declare-fun b_free!29851 () Bool)

(declare-fun b_next!29851 () Bool)

(assert (=> start!111016 (= b_free!29851 (not b_next!29851))))

(declare-fun tp!104875 () Bool)

(declare-fun b_and!48041 () Bool)

(assert (=> start!111016 (= tp!104875 b_and!48041)))

(declare-fun mapNonEmpty!55000 () Bool)

(declare-fun mapRes!55000 () Bool)

(declare-fun tp!104876 () Bool)

(declare-fun e!749712 () Bool)

(assert (=> mapNonEmpty!55000 (= mapRes!55000 (and tp!104876 e!749712))))

(declare-datatypes ((V!52545 0))(
  ( (V!52546 (val!17865 Int)) )
))
(declare-datatypes ((ValueCell!16892 0))(
  ( (ValueCellFull!16892 (v!20491 V!52545)) (EmptyCell!16892) )
))
(declare-fun mapValue!55000 () ValueCell!16892)

(declare-fun mapRest!55000 () (Array (_ BitVec 32) ValueCell!16892))

(declare-datatypes ((array!88039 0))(
  ( (array!88040 (arr!42500 (Array (_ BitVec 32) ValueCell!16892)) (size!43052 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88039)

(declare-fun mapKey!55000 () (_ BitVec 32))

(assert (=> mapNonEmpty!55000 (= (arr!42500 _values!1354) (store mapRest!55000 mapKey!55000 mapValue!55000))))

(declare-fun b!1314316 () Bool)

(declare-fun e!749714 () Bool)

(declare-fun e!749711 () Bool)

(assert (=> b!1314316 (= e!749714 (and e!749711 mapRes!55000))))

(declare-fun condMapEmpty!55000 () Bool)

(declare-fun mapDefault!55000 () ValueCell!16892)

(assert (=> b!1314316 (= condMapEmpty!55000 (= (arr!42500 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16892)) mapDefault!55000)))))

(declare-fun b!1314317 () Bool)

(declare-fun res!872572 () Bool)

(declare-fun e!749710 () Bool)

(assert (=> b!1314317 (=> (not res!872572) (not e!749710))))

(declare-datatypes ((array!88041 0))(
  ( (array!88042 (arr!42501 (Array (_ BitVec 32) (_ BitVec 64))) (size!43053 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88041)

(declare-datatypes ((List!30240 0))(
  ( (Nil!30237) (Cons!30236 (h!31445 (_ BitVec 64)) (t!43838 List!30240)) )
))
(declare-fun arrayNoDuplicates!0 (array!88041 (_ BitVec 32) List!30240) Bool)

(assert (=> b!1314317 (= res!872572 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30237))))

(declare-fun b!1314318 () Bool)

(declare-fun res!872571 () Bool)

(assert (=> b!1314318 (=> (not res!872571) (not e!749710))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314318 (= res!872571 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43053 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314319 () Bool)

(assert (=> b!1314319 (= e!749710 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585600 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52545)

(declare-fun zeroValue!1296 () V!52545)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23124 0))(
  ( (tuple2!23125 (_1!11573 (_ BitVec 64)) (_2!11573 V!52545)) )
))
(declare-datatypes ((List!30241 0))(
  ( (Nil!30238) (Cons!30237 (h!31446 tuple2!23124) (t!43839 List!30241)) )
))
(declare-datatypes ((ListLongMap!20781 0))(
  ( (ListLongMap!20782 (toList!10406 List!30241)) )
))
(declare-fun contains!8483 (ListLongMap!20781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5301 (array!88041 array!88039 (_ BitVec 32) (_ BitVec 32) V!52545 V!52545 (_ BitVec 32) Int) ListLongMap!20781)

(assert (=> b!1314319 (= lt!585600 (contains!8483 (getCurrentListMap!5301 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314320 () Bool)

(declare-fun tp_is_empty!35581 () Bool)

(assert (=> b!1314320 (= e!749712 tp_is_empty!35581)))

(declare-fun res!872573 () Bool)

(assert (=> start!111016 (=> (not res!872573) (not e!749710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111016 (= res!872573 (validMask!0 mask!2040))))

(assert (=> start!111016 e!749710))

(assert (=> start!111016 tp!104875))

(declare-fun array_inv!32287 (array!88041) Bool)

(assert (=> start!111016 (array_inv!32287 _keys!1628)))

(assert (=> start!111016 true))

(assert (=> start!111016 tp_is_empty!35581))

(declare-fun array_inv!32288 (array!88039) Bool)

(assert (=> start!111016 (and (array_inv!32288 _values!1354) e!749714)))

(declare-fun mapIsEmpty!55000 () Bool)

(assert (=> mapIsEmpty!55000 mapRes!55000))

(declare-fun b!1314321 () Bool)

(declare-fun res!872574 () Bool)

(assert (=> b!1314321 (=> (not res!872574) (not e!749710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88041 (_ BitVec 32)) Bool)

(assert (=> b!1314321 (= res!872574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314322 () Bool)

(declare-fun res!872575 () Bool)

(assert (=> b!1314322 (=> (not res!872575) (not e!749710))))

(assert (=> b!1314322 (= res!872575 (and (= (size!43052 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43053 _keys!1628) (size!43052 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314323 () Bool)

(assert (=> b!1314323 (= e!749711 tp_is_empty!35581)))

(assert (= (and start!111016 res!872573) b!1314322))

(assert (= (and b!1314322 res!872575) b!1314321))

(assert (= (and b!1314321 res!872574) b!1314317))

(assert (= (and b!1314317 res!872572) b!1314318))

(assert (= (and b!1314318 res!872571) b!1314319))

(assert (= (and b!1314316 condMapEmpty!55000) mapIsEmpty!55000))

(assert (= (and b!1314316 (not condMapEmpty!55000)) mapNonEmpty!55000))

(get-info :version)

(assert (= (and mapNonEmpty!55000 ((_ is ValueCellFull!16892) mapValue!55000)) b!1314320))

(assert (= (and b!1314316 ((_ is ValueCellFull!16892) mapDefault!55000)) b!1314323))

(assert (= start!111016 b!1314316))

(declare-fun m!1202409 () Bool)

(assert (=> mapNonEmpty!55000 m!1202409))

(declare-fun m!1202411 () Bool)

(assert (=> b!1314319 m!1202411))

(assert (=> b!1314319 m!1202411))

(declare-fun m!1202413 () Bool)

(assert (=> b!1314319 m!1202413))

(declare-fun m!1202415 () Bool)

(assert (=> b!1314317 m!1202415))

(declare-fun m!1202417 () Bool)

(assert (=> b!1314321 m!1202417))

(declare-fun m!1202419 () Bool)

(assert (=> start!111016 m!1202419))

(declare-fun m!1202421 () Bool)

(assert (=> start!111016 m!1202421))

(declare-fun m!1202423 () Bool)

(assert (=> start!111016 m!1202423))

(check-sat (not mapNonEmpty!55000) (not b!1314317) b_and!48041 (not b!1314321) (not b_next!29851) (not b!1314319) (not start!111016) tp_is_empty!35581)
(check-sat b_and!48041 (not b_next!29851))
