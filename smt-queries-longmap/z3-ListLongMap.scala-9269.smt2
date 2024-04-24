; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111186 () Bool)

(assert start!111186)

(declare-fun b_free!29797 () Bool)

(declare-fun b_next!29797 () Bool)

(assert (=> start!111186 (= b_free!29797 (not b_next!29797))))

(declare-fun tp!104712 () Bool)

(declare-fun b_and!48007 () Bool)

(assert (=> start!111186 (= tp!104712 b_and!48007)))

(declare-fun b!1315001 () Bool)

(declare-fun e!750182 () Bool)

(declare-fun e!750181 () Bool)

(declare-fun mapRes!54919 () Bool)

(assert (=> b!1315001 (= e!750182 (and e!750181 mapRes!54919))))

(declare-fun condMapEmpty!54919 () Bool)

(declare-datatypes ((V!52473 0))(
  ( (V!52474 (val!17838 Int)) )
))
(declare-datatypes ((ValueCell!16865 0))(
  ( (ValueCellFull!16865 (v!20460 V!52473)) (EmptyCell!16865) )
))
(declare-datatypes ((array!88083 0))(
  ( (array!88084 (arr!42517 (Array (_ BitVec 32) ValueCell!16865)) (size!43068 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88083)

(declare-fun mapDefault!54919 () ValueCell!16865)

(assert (=> b!1315001 (= condMapEmpty!54919 (= (arr!42517 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16865)) mapDefault!54919)))))

(declare-fun b!1315002 () Bool)

(declare-fun res!872677 () Bool)

(declare-fun e!750184 () Bool)

(assert (=> b!1315002 (=> (not res!872677) (not e!750184))))

(declare-datatypes ((array!88085 0))(
  ( (array!88086 (arr!42518 (Array (_ BitVec 32) (_ BitVec 64))) (size!43069 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88085)

(declare-datatypes ((List!30180 0))(
  ( (Nil!30177) (Cons!30176 (h!31394 (_ BitVec 64)) (t!43778 List!30180)) )
))
(declare-fun arrayNoDuplicates!0 (array!88085 (_ BitVec 32) List!30180) Bool)

(assert (=> b!1315002 (= res!872677 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30177))))

(declare-fun b!1315003 () Bool)

(declare-fun res!872680 () Bool)

(assert (=> b!1315003 (=> (not res!872680) (not e!750184))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315003 (= res!872680 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43069 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315004 () Bool)

(declare-fun res!872681 () Bool)

(assert (=> b!1315004 (=> (not res!872681) (not e!750184))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88085 (_ BitVec 32)) Bool)

(assert (=> b!1315004 (= res!872681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315005 () Bool)

(declare-fun e!750183 () Bool)

(declare-fun tp_is_empty!35527 () Bool)

(assert (=> b!1315005 (= e!750183 tp_is_empty!35527)))

(declare-fun mapNonEmpty!54919 () Bool)

(declare-fun tp!104713 () Bool)

(assert (=> mapNonEmpty!54919 (= mapRes!54919 (and tp!104713 e!750183))))

(declare-fun mapRest!54919 () (Array (_ BitVec 32) ValueCell!16865))

(declare-fun mapValue!54919 () ValueCell!16865)

(declare-fun mapKey!54919 () (_ BitVec 32))

(assert (=> mapNonEmpty!54919 (= (arr!42517 _values!1354) (store mapRest!54919 mapKey!54919 mapValue!54919))))

(declare-fun b!1315006 () Bool)

(assert (=> b!1315006 (= e!750181 tp_is_empty!35527)))

(declare-fun b!1315007 () Bool)

(declare-fun res!872679 () Bool)

(assert (=> b!1315007 (=> (not res!872679) (not e!750184))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315007 (= res!872679 (and (= (size!43068 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43069 _keys!1628) (size!43068 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315008 () Bool)

(assert (=> b!1315008 (= e!750184 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586181 () Bool)

(declare-fun minValue!1296 () V!52473)

(declare-fun zeroValue!1296 () V!52473)

(declare-datatypes ((tuple2!23030 0))(
  ( (tuple2!23031 (_1!11526 (_ BitVec 64)) (_2!11526 V!52473)) )
))
(declare-datatypes ((List!30181 0))(
  ( (Nil!30178) (Cons!30177 (h!31395 tuple2!23030) (t!43779 List!30181)) )
))
(declare-datatypes ((ListLongMap!20695 0))(
  ( (ListLongMap!20696 (toList!10363 List!30181)) )
))
(declare-fun contains!8525 (ListLongMap!20695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5367 (array!88085 array!88083 (_ BitVec 32) (_ BitVec 32) V!52473 V!52473 (_ BitVec 32) Int) ListLongMap!20695)

(assert (=> b!1315008 (= lt!586181 (contains!8525 (getCurrentListMap!5367 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54919 () Bool)

(assert (=> mapIsEmpty!54919 mapRes!54919))

(declare-fun res!872678 () Bool)

(assert (=> start!111186 (=> (not res!872678) (not e!750184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111186 (= res!872678 (validMask!0 mask!2040))))

(assert (=> start!111186 e!750184))

(assert (=> start!111186 tp!104712))

(declare-fun array_inv!32381 (array!88085) Bool)

(assert (=> start!111186 (array_inv!32381 _keys!1628)))

(assert (=> start!111186 true))

(assert (=> start!111186 tp_is_empty!35527))

(declare-fun array_inv!32382 (array!88083) Bool)

(assert (=> start!111186 (and (array_inv!32382 _values!1354) e!750182)))

(assert (= (and start!111186 res!872678) b!1315007))

(assert (= (and b!1315007 res!872679) b!1315004))

(assert (= (and b!1315004 res!872681) b!1315002))

(assert (= (and b!1315002 res!872677) b!1315003))

(assert (= (and b!1315003 res!872680) b!1315008))

(assert (= (and b!1315001 condMapEmpty!54919) mapIsEmpty!54919))

(assert (= (and b!1315001 (not condMapEmpty!54919)) mapNonEmpty!54919))

(get-info :version)

(assert (= (and mapNonEmpty!54919 ((_ is ValueCellFull!16865) mapValue!54919)) b!1315005))

(assert (= (and b!1315001 ((_ is ValueCellFull!16865) mapDefault!54919)) b!1315006))

(assert (= start!111186 b!1315001))

(declare-fun m!1204061 () Bool)

(assert (=> mapNonEmpty!54919 m!1204061))

(declare-fun m!1204063 () Bool)

(assert (=> b!1315002 m!1204063))

(declare-fun m!1204065 () Bool)

(assert (=> b!1315004 m!1204065))

(declare-fun m!1204067 () Bool)

(assert (=> b!1315008 m!1204067))

(assert (=> b!1315008 m!1204067))

(declare-fun m!1204069 () Bool)

(assert (=> b!1315008 m!1204069))

(declare-fun m!1204071 () Bool)

(assert (=> start!111186 m!1204071))

(declare-fun m!1204073 () Bool)

(assert (=> start!111186 m!1204073))

(declare-fun m!1204075 () Bool)

(assert (=> start!111186 m!1204075))

(check-sat (not b!1315004) (not b!1315002) (not b!1315008) b_and!48007 (not start!111186) (not mapNonEmpty!54919) (not b_next!29797) tp_is_empty!35527)
(check-sat b_and!48007 (not b_next!29797))
