; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111574 () Bool)

(assert start!111574)

(declare-fun b_free!30007 () Bool)

(declare-fun b_next!30007 () Bool)

(assert (=> start!111574 (= b_free!30007 (not b_next!30007))))

(declare-fun tp!105497 () Bool)

(declare-fun b_and!48229 () Bool)

(assert (=> start!111574 (= tp!105497 b_and!48229)))

(declare-fun mapIsEmpty!55388 () Bool)

(declare-fun mapRes!55388 () Bool)

(assert (=> mapIsEmpty!55388 mapRes!55388))

(declare-fun b!1318903 () Bool)

(declare-fun res!874989 () Bool)

(declare-fun e!752736 () Bool)

(assert (=> b!1318903 (=> (not res!874989) (not e!752736))))

(declare-datatypes ((array!88675 0))(
  ( (array!88676 (arr!42807 (Array (_ BitVec 32) (_ BitVec 64))) (size!43358 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88675)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88675 (_ BitVec 32)) Bool)

(assert (=> b!1318903 (= res!874989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318904 () Bool)

(declare-fun res!874991 () Bool)

(assert (=> b!1318904 (=> (not res!874991) (not e!752736))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318904 (= res!874991 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43358 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318905 () Bool)

(declare-fun e!752735 () Bool)

(declare-fun tp_is_empty!35827 () Bool)

(assert (=> b!1318905 (= e!752735 tp_is_empty!35827)))

(declare-fun b!1318906 () Bool)

(declare-fun res!874993 () Bool)

(assert (=> b!1318906 (=> (not res!874993) (not e!752736))))

(declare-datatypes ((List!30343 0))(
  ( (Nil!30340) (Cons!30339 (h!31557 (_ BitVec 64)) (t!43943 List!30343)) )
))
(declare-fun arrayNoDuplicates!0 (array!88675 (_ BitVec 32) List!30343) Bool)

(assert (=> b!1318906 (= res!874993 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30340))))

(declare-fun b!1318907 () Bool)

(declare-fun e!752733 () Bool)

(assert (=> b!1318907 (= e!752733 (and e!752735 mapRes!55388))))

(declare-fun condMapEmpty!55388 () Bool)

(declare-datatypes ((V!52873 0))(
  ( (V!52874 (val!17988 Int)) )
))
(declare-datatypes ((ValueCell!17015 0))(
  ( (ValueCellFull!17015 (v!20613 V!52873)) (EmptyCell!17015) )
))
(declare-datatypes ((array!88677 0))(
  ( (array!88678 (arr!42808 (Array (_ BitVec 32) ValueCell!17015)) (size!43359 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88677)

(declare-fun mapDefault!55388 () ValueCell!17015)

(assert (=> b!1318907 (= condMapEmpty!55388 (= (arr!42808 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17015)) mapDefault!55388)))))

(declare-fun b!1318908 () Bool)

(assert (=> b!1318908 (= e!752736 false)))

(declare-fun zeroValue!1279 () V!52873)

(declare-fun minValue!1279 () V!52873)

(declare-fun lt!586862 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23178 0))(
  ( (tuple2!23179 (_1!11600 (_ BitVec 64)) (_2!11600 V!52873)) )
))
(declare-datatypes ((List!30344 0))(
  ( (Nil!30341) (Cons!30340 (h!31558 tuple2!23178) (t!43944 List!30344)) )
))
(declare-datatypes ((ListLongMap!20843 0))(
  ( (ListLongMap!20844 (toList!10437 List!30344)) )
))
(declare-fun contains!8604 (ListLongMap!20843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5441 (array!88675 array!88677 (_ BitVec 32) (_ BitVec 32) V!52873 V!52873 (_ BitVec 32) Int) ListLongMap!20843)

(assert (=> b!1318908 (= lt!586862 (contains!8604 (getCurrentListMap!5441 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318910 () Bool)

(declare-fun res!874990 () Bool)

(assert (=> b!1318910 (=> (not res!874990) (not e!752736))))

(assert (=> b!1318910 (= res!874990 (and (= (size!43359 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43358 _keys!1609) (size!43359 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55388 () Bool)

(declare-fun tp!105496 () Bool)

(declare-fun e!752737 () Bool)

(assert (=> mapNonEmpty!55388 (= mapRes!55388 (and tp!105496 e!752737))))

(declare-fun mapKey!55388 () (_ BitVec 32))

(declare-fun mapRest!55388 () (Array (_ BitVec 32) ValueCell!17015))

(declare-fun mapValue!55388 () ValueCell!17015)

(assert (=> mapNonEmpty!55388 (= (arr!42808 _values!1337) (store mapRest!55388 mapKey!55388 mapValue!55388))))

(declare-fun res!874992 () Bool)

(assert (=> start!111574 (=> (not res!874992) (not e!752736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111574 (= res!874992 (validMask!0 mask!2019))))

(assert (=> start!111574 e!752736))

(declare-fun array_inv!32601 (array!88675) Bool)

(assert (=> start!111574 (array_inv!32601 _keys!1609)))

(assert (=> start!111574 true))

(assert (=> start!111574 tp_is_empty!35827))

(declare-fun array_inv!32602 (array!88677) Bool)

(assert (=> start!111574 (and (array_inv!32602 _values!1337) e!752733)))

(assert (=> start!111574 tp!105497))

(declare-fun b!1318909 () Bool)

(assert (=> b!1318909 (= e!752737 tp_is_empty!35827)))

(assert (= (and start!111574 res!874992) b!1318910))

(assert (= (and b!1318910 res!874990) b!1318903))

(assert (= (and b!1318903 res!874989) b!1318906))

(assert (= (and b!1318906 res!874993) b!1318904))

(assert (= (and b!1318904 res!874991) b!1318908))

(assert (= (and b!1318907 condMapEmpty!55388) mapIsEmpty!55388))

(assert (= (and b!1318907 (not condMapEmpty!55388)) mapNonEmpty!55388))

(get-info :version)

(assert (= (and mapNonEmpty!55388 ((_ is ValueCellFull!17015) mapValue!55388)) b!1318909))

(assert (= (and b!1318907 ((_ is ValueCellFull!17015) mapDefault!55388)) b!1318905))

(assert (= start!111574 b!1318907))

(declare-fun m!1207001 () Bool)

(assert (=> b!1318906 m!1207001))

(declare-fun m!1207003 () Bool)

(assert (=> start!111574 m!1207003))

(declare-fun m!1207005 () Bool)

(assert (=> start!111574 m!1207005))

(declare-fun m!1207007 () Bool)

(assert (=> start!111574 m!1207007))

(declare-fun m!1207009 () Bool)

(assert (=> b!1318903 m!1207009))

(declare-fun m!1207011 () Bool)

(assert (=> mapNonEmpty!55388 m!1207011))

(declare-fun m!1207013 () Bool)

(assert (=> b!1318908 m!1207013))

(assert (=> b!1318908 m!1207013))

(declare-fun m!1207015 () Bool)

(assert (=> b!1318908 m!1207015))

(check-sat (not start!111574) (not mapNonEmpty!55388) (not b!1318906) (not b!1318903) (not b_next!30007) (not b!1318908) tp_is_empty!35827 b_and!48229)
(check-sat b_and!48229 (not b_next!30007))
