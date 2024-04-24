; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111216 () Bool)

(assert start!111216)

(declare-fun b_free!29827 () Bool)

(declare-fun b_next!29827 () Bool)

(assert (=> start!111216 (= b_free!29827 (not b_next!29827))))

(declare-fun tp!104803 () Bool)

(declare-fun b_and!48037 () Bool)

(assert (=> start!111216 (= tp!104803 b_and!48037)))

(declare-fun mapNonEmpty!54964 () Bool)

(declare-fun mapRes!54964 () Bool)

(declare-fun tp!104802 () Bool)

(declare-fun e!750406 () Bool)

(assert (=> mapNonEmpty!54964 (= mapRes!54964 (and tp!104802 e!750406))))

(declare-fun mapKey!54964 () (_ BitVec 32))

(declare-datatypes ((V!52513 0))(
  ( (V!52514 (val!17853 Int)) )
))
(declare-datatypes ((ValueCell!16880 0))(
  ( (ValueCellFull!16880 (v!20475 V!52513)) (EmptyCell!16880) )
))
(declare-fun mapValue!54964 () ValueCell!16880)

(declare-fun mapRest!54964 () (Array (_ BitVec 32) ValueCell!16880))

(declare-datatypes ((array!88143 0))(
  ( (array!88144 (arr!42547 (Array (_ BitVec 32) ValueCell!16880)) (size!43098 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88143)

(assert (=> mapNonEmpty!54964 (= (arr!42547 _values!1354) (store mapRest!54964 mapKey!54964 mapValue!54964))))

(declare-fun b!1315361 () Bool)

(declare-fun res!872903 () Bool)

(declare-fun e!750410 () Bool)

(assert (=> b!1315361 (=> (not res!872903) (not e!750410))))

(declare-datatypes ((array!88145 0))(
  ( (array!88146 (arr!42548 (Array (_ BitVec 32) (_ BitVec 64))) (size!43099 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88145)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88145 (_ BitVec 32)) Bool)

(assert (=> b!1315361 (= res!872903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315362 () Bool)

(assert (=> b!1315362 (= e!750410 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52513)

(declare-fun zeroValue!1296 () V!52513)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586226 () Bool)

(declare-datatypes ((tuple2!23046 0))(
  ( (tuple2!23047 (_1!11534 (_ BitVec 64)) (_2!11534 V!52513)) )
))
(declare-datatypes ((List!30197 0))(
  ( (Nil!30194) (Cons!30193 (h!31411 tuple2!23046) (t!43795 List!30197)) )
))
(declare-datatypes ((ListLongMap!20711 0))(
  ( (ListLongMap!20712 (toList!10371 List!30197)) )
))
(declare-fun contains!8533 (ListLongMap!20711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5375 (array!88145 array!88143 (_ BitVec 32) (_ BitVec 32) V!52513 V!52513 (_ BitVec 32) Int) ListLongMap!20711)

(assert (=> b!1315362 (= lt!586226 (contains!8533 (getCurrentListMap!5375 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!872902 () Bool)

(assert (=> start!111216 (=> (not res!872902) (not e!750410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111216 (= res!872902 (validMask!0 mask!2040))))

(assert (=> start!111216 e!750410))

(assert (=> start!111216 tp!104803))

(declare-fun array_inv!32403 (array!88145) Bool)

(assert (=> start!111216 (array_inv!32403 _keys!1628)))

(assert (=> start!111216 true))

(declare-fun tp_is_empty!35557 () Bool)

(assert (=> start!111216 tp_is_empty!35557))

(declare-fun e!750409 () Bool)

(declare-fun array_inv!32404 (array!88143) Bool)

(assert (=> start!111216 (and (array_inv!32404 _values!1354) e!750409)))

(declare-fun b!1315363 () Bool)

(declare-fun res!872906 () Bool)

(assert (=> b!1315363 (=> (not res!872906) (not e!750410))))

(declare-datatypes ((List!30198 0))(
  ( (Nil!30195) (Cons!30194 (h!31412 (_ BitVec 64)) (t!43796 List!30198)) )
))
(declare-fun arrayNoDuplicates!0 (array!88145 (_ BitVec 32) List!30198) Bool)

(assert (=> b!1315363 (= res!872906 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30195))))

(declare-fun mapIsEmpty!54964 () Bool)

(assert (=> mapIsEmpty!54964 mapRes!54964))

(declare-fun b!1315364 () Bool)

(declare-fun res!872904 () Bool)

(assert (=> b!1315364 (=> (not res!872904) (not e!750410))))

(assert (=> b!1315364 (= res!872904 (and (= (size!43098 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43099 _keys!1628) (size!43098 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315365 () Bool)

(declare-fun e!750407 () Bool)

(assert (=> b!1315365 (= e!750407 tp_is_empty!35557)))

(declare-fun b!1315366 () Bool)

(declare-fun res!872905 () Bool)

(assert (=> b!1315366 (=> (not res!872905) (not e!750410))))

(assert (=> b!1315366 (= res!872905 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43099 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315367 () Bool)

(assert (=> b!1315367 (= e!750409 (and e!750407 mapRes!54964))))

(declare-fun condMapEmpty!54964 () Bool)

(declare-fun mapDefault!54964 () ValueCell!16880)

(assert (=> b!1315367 (= condMapEmpty!54964 (= (arr!42547 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16880)) mapDefault!54964)))))

(declare-fun b!1315368 () Bool)

(assert (=> b!1315368 (= e!750406 tp_is_empty!35557)))

(assert (= (and start!111216 res!872902) b!1315364))

(assert (= (and b!1315364 res!872904) b!1315361))

(assert (= (and b!1315361 res!872903) b!1315363))

(assert (= (and b!1315363 res!872906) b!1315366))

(assert (= (and b!1315366 res!872905) b!1315362))

(assert (= (and b!1315367 condMapEmpty!54964) mapIsEmpty!54964))

(assert (= (and b!1315367 (not condMapEmpty!54964)) mapNonEmpty!54964))

(get-info :version)

(assert (= (and mapNonEmpty!54964 ((_ is ValueCellFull!16880) mapValue!54964)) b!1315368))

(assert (= (and b!1315367 ((_ is ValueCellFull!16880) mapDefault!54964)) b!1315365))

(assert (= start!111216 b!1315367))

(declare-fun m!1204301 () Bool)

(assert (=> mapNonEmpty!54964 m!1204301))

(declare-fun m!1204303 () Bool)

(assert (=> b!1315362 m!1204303))

(assert (=> b!1315362 m!1204303))

(declare-fun m!1204305 () Bool)

(assert (=> b!1315362 m!1204305))

(declare-fun m!1204307 () Bool)

(assert (=> b!1315361 m!1204307))

(declare-fun m!1204309 () Bool)

(assert (=> b!1315363 m!1204309))

(declare-fun m!1204311 () Bool)

(assert (=> start!111216 m!1204311))

(declare-fun m!1204313 () Bool)

(assert (=> start!111216 m!1204313))

(declare-fun m!1204315 () Bool)

(assert (=> start!111216 m!1204315))

(check-sat (not b!1315361) (not start!111216) (not b!1315362) (not b!1315363) b_and!48037 tp_is_empty!35557 (not mapNonEmpty!54964) (not b_next!29827))
(check-sat b_and!48037 (not b_next!29827))
