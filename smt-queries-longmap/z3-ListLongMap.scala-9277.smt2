; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111012 () Bool)

(assert start!111012)

(declare-fun b_free!29847 () Bool)

(declare-fun b_next!29847 () Bool)

(assert (=> start!111012 (= b_free!29847 (not b_next!29847))))

(declare-fun tp!104862 () Bool)

(declare-fun b_and!48055 () Bool)

(assert (=> start!111012 (= tp!104862 b_and!48055)))

(declare-fun res!872574 () Bool)

(declare-fun e!749717 () Bool)

(assert (=> start!111012 (=> (not res!872574) (not e!749717))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111012 (= res!872574 (validMask!0 mask!2040))))

(assert (=> start!111012 e!749717))

(assert (=> start!111012 tp!104862))

(declare-datatypes ((array!88126 0))(
  ( (array!88127 (arr!42543 (Array (_ BitVec 32) (_ BitVec 64))) (size!43093 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88126)

(declare-fun array_inv!32135 (array!88126) Bool)

(assert (=> start!111012 (array_inv!32135 _keys!1628)))

(assert (=> start!111012 true))

(declare-fun tp_is_empty!35577 () Bool)

(assert (=> start!111012 tp_is_empty!35577))

(declare-datatypes ((V!52539 0))(
  ( (V!52540 (val!17863 Int)) )
))
(declare-datatypes ((ValueCell!16890 0))(
  ( (ValueCellFull!16890 (v!20490 V!52539)) (EmptyCell!16890) )
))
(declare-datatypes ((array!88128 0))(
  ( (array!88129 (arr!42544 (Array (_ BitVec 32) ValueCell!16890)) (size!43094 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88128)

(declare-fun e!749716 () Bool)

(declare-fun array_inv!32136 (array!88128) Bool)

(assert (=> start!111012 (and (array_inv!32136 _values!1354) e!749716)))

(declare-fun mapIsEmpty!54994 () Bool)

(declare-fun mapRes!54994 () Bool)

(assert (=> mapIsEmpty!54994 mapRes!54994))

(declare-fun b!1314338 () Bool)

(declare-fun e!749715 () Bool)

(assert (=> b!1314338 (= e!749715 tp_is_empty!35577)))

(declare-fun b!1314339 () Bool)

(declare-fun res!872570 () Bool)

(assert (=> b!1314339 (=> (not res!872570) (not e!749717))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314339 (= res!872570 (and (= (size!43094 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43093 _keys!1628) (size!43094 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314340 () Bool)

(declare-fun res!872572 () Bool)

(assert (=> b!1314340 (=> (not res!872572) (not e!749717))))

(declare-datatypes ((List!30170 0))(
  ( (Nil!30167) (Cons!30166 (h!31375 (_ BitVec 64)) (t!43776 List!30170)) )
))
(declare-fun arrayNoDuplicates!0 (array!88126 (_ BitVec 32) List!30170) Bool)

(assert (=> b!1314340 (= res!872572 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30167))))

(declare-fun b!1314341 () Bool)

(assert (=> b!1314341 (= e!749717 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585780 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52539)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52539)

(declare-datatypes ((tuple2!23034 0))(
  ( (tuple2!23035 (_1!11528 (_ BitVec 64)) (_2!11528 V!52539)) )
))
(declare-datatypes ((List!30171 0))(
  ( (Nil!30168) (Cons!30167 (h!31376 tuple2!23034) (t!43777 List!30171)) )
))
(declare-datatypes ((ListLongMap!20691 0))(
  ( (ListLongMap!20692 (toList!10361 List!30171)) )
))
(declare-fun contains!8511 (ListLongMap!20691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5374 (array!88126 array!88128 (_ BitVec 32) (_ BitVec 32) V!52539 V!52539 (_ BitVec 32) Int) ListLongMap!20691)

(assert (=> b!1314341 (= lt!585780 (contains!8511 (getCurrentListMap!5374 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54994 () Bool)

(declare-fun tp!104863 () Bool)

(assert (=> mapNonEmpty!54994 (= mapRes!54994 (and tp!104863 e!749715))))

(declare-fun mapRest!54994 () (Array (_ BitVec 32) ValueCell!16890))

(declare-fun mapKey!54994 () (_ BitVec 32))

(declare-fun mapValue!54994 () ValueCell!16890)

(assert (=> mapNonEmpty!54994 (= (arr!42544 _values!1354) (store mapRest!54994 mapKey!54994 mapValue!54994))))

(declare-fun b!1314342 () Bool)

(declare-fun e!749713 () Bool)

(assert (=> b!1314342 (= e!749716 (and e!749713 mapRes!54994))))

(declare-fun condMapEmpty!54994 () Bool)

(declare-fun mapDefault!54994 () ValueCell!16890)

(assert (=> b!1314342 (= condMapEmpty!54994 (= (arr!42544 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16890)) mapDefault!54994)))))

(declare-fun b!1314343 () Bool)

(declare-fun res!872573 () Bool)

(assert (=> b!1314343 (=> (not res!872573) (not e!749717))))

(assert (=> b!1314343 (= res!872573 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43093 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314344 () Bool)

(declare-fun res!872571 () Bool)

(assert (=> b!1314344 (=> (not res!872571) (not e!749717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88126 (_ BitVec 32)) Bool)

(assert (=> b!1314344 (= res!872571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314345 () Bool)

(assert (=> b!1314345 (= e!749713 tp_is_empty!35577)))

(assert (= (and start!111012 res!872574) b!1314339))

(assert (= (and b!1314339 res!872570) b!1314344))

(assert (= (and b!1314344 res!872571) b!1314340))

(assert (= (and b!1314340 res!872572) b!1314343))

(assert (= (and b!1314343 res!872573) b!1314341))

(assert (= (and b!1314342 condMapEmpty!54994) mapIsEmpty!54994))

(assert (= (and b!1314342 (not condMapEmpty!54994)) mapNonEmpty!54994))

(get-info :version)

(assert (= (and mapNonEmpty!54994 ((_ is ValueCellFull!16890) mapValue!54994)) b!1314338))

(assert (= (and b!1314342 ((_ is ValueCellFull!16890) mapDefault!54994)) b!1314345))

(assert (= start!111012 b!1314342))

(declare-fun m!1202893 () Bool)

(assert (=> b!1314340 m!1202893))

(declare-fun m!1202895 () Bool)

(assert (=> b!1314341 m!1202895))

(assert (=> b!1314341 m!1202895))

(declare-fun m!1202897 () Bool)

(assert (=> b!1314341 m!1202897))

(declare-fun m!1202899 () Bool)

(assert (=> start!111012 m!1202899))

(declare-fun m!1202901 () Bool)

(assert (=> start!111012 m!1202901))

(declare-fun m!1202903 () Bool)

(assert (=> start!111012 m!1202903))

(declare-fun m!1202905 () Bool)

(assert (=> mapNonEmpty!54994 m!1202905))

(declare-fun m!1202907 () Bool)

(assert (=> b!1314344 m!1202907))

(check-sat (not b!1314340) (not mapNonEmpty!54994) (not start!111012) (not b!1314341) (not b!1314344) tp_is_empty!35577 b_and!48055 (not b_next!29847))
(check-sat b_and!48055 (not b_next!29847))
