; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111192 () Bool)

(assert start!111192)

(declare-fun b_free!29803 () Bool)

(declare-fun b_next!29803 () Bool)

(assert (=> start!111192 (= b_free!29803 (not b_next!29803))))

(declare-fun tp!104730 () Bool)

(declare-fun b_and!48013 () Bool)

(assert (=> start!111192 (= tp!104730 b_and!48013)))

(declare-fun b!1315073 () Bool)

(declare-fun e!750230 () Bool)

(assert (=> b!1315073 (= e!750230 false)))

(declare-datatypes ((array!88095 0))(
  ( (array!88096 (arr!42523 (Array (_ BitVec 32) (_ BitVec 64))) (size!43074 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88095)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52481 0))(
  ( (V!52482 (val!17841 Int)) )
))
(declare-fun minValue!1296 () V!52481)

(declare-datatypes ((ValueCell!16868 0))(
  ( (ValueCellFull!16868 (v!20463 V!52481)) (EmptyCell!16868) )
))
(declare-datatypes ((array!88097 0))(
  ( (array!88098 (arr!42524 (Array (_ BitVec 32) ValueCell!16868)) (size!43075 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88097)

(declare-fun zeroValue!1296 () V!52481)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586190 () Bool)

(declare-datatypes ((tuple2!23034 0))(
  ( (tuple2!23035 (_1!11528 (_ BitVec 64)) (_2!11528 V!52481)) )
))
(declare-datatypes ((List!30184 0))(
  ( (Nil!30181) (Cons!30180 (h!31398 tuple2!23034) (t!43782 List!30184)) )
))
(declare-datatypes ((ListLongMap!20699 0))(
  ( (ListLongMap!20700 (toList!10365 List!30184)) )
))
(declare-fun contains!8527 (ListLongMap!20699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5369 (array!88095 array!88097 (_ BitVec 32) (_ BitVec 32) V!52481 V!52481 (_ BitVec 32) Int) ListLongMap!20699)

(assert (=> b!1315073 (= lt!586190 (contains!8527 (getCurrentListMap!5369 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315074 () Bool)

(declare-fun e!750226 () Bool)

(declare-fun tp_is_empty!35533 () Bool)

(assert (=> b!1315074 (= e!750226 tp_is_empty!35533)))

(declare-fun b!1315075 () Bool)

(declare-fun res!872726 () Bool)

(assert (=> b!1315075 (=> (not res!872726) (not e!750230))))

(assert (=> b!1315075 (= res!872726 (and (= (size!43075 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43074 _keys!1628) (size!43075 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872723 () Bool)

(assert (=> start!111192 (=> (not res!872723) (not e!750230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111192 (= res!872723 (validMask!0 mask!2040))))

(assert (=> start!111192 e!750230))

(assert (=> start!111192 tp!104730))

(declare-fun array_inv!32387 (array!88095) Bool)

(assert (=> start!111192 (array_inv!32387 _keys!1628)))

(assert (=> start!111192 true))

(assert (=> start!111192 tp_is_empty!35533))

(declare-fun e!750228 () Bool)

(declare-fun array_inv!32388 (array!88097) Bool)

(assert (=> start!111192 (and (array_inv!32388 _values!1354) e!750228)))

(declare-fun b!1315076 () Bool)

(declare-fun e!750229 () Bool)

(declare-fun mapRes!54928 () Bool)

(assert (=> b!1315076 (= e!750228 (and e!750229 mapRes!54928))))

(declare-fun condMapEmpty!54928 () Bool)

(declare-fun mapDefault!54928 () ValueCell!16868)

(assert (=> b!1315076 (= condMapEmpty!54928 (= (arr!42524 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16868)) mapDefault!54928)))))

(declare-fun b!1315077 () Bool)

(declare-fun res!872725 () Bool)

(assert (=> b!1315077 (=> (not res!872725) (not e!750230))))

(assert (=> b!1315077 (= res!872725 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43074 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315078 () Bool)

(declare-fun res!872724 () Bool)

(assert (=> b!1315078 (=> (not res!872724) (not e!750230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88095 (_ BitVec 32)) Bool)

(assert (=> b!1315078 (= res!872724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54928 () Bool)

(assert (=> mapIsEmpty!54928 mapRes!54928))

(declare-fun mapNonEmpty!54928 () Bool)

(declare-fun tp!104731 () Bool)

(assert (=> mapNonEmpty!54928 (= mapRes!54928 (and tp!104731 e!750226))))

(declare-fun mapRest!54928 () (Array (_ BitVec 32) ValueCell!16868))

(declare-fun mapKey!54928 () (_ BitVec 32))

(declare-fun mapValue!54928 () ValueCell!16868)

(assert (=> mapNonEmpty!54928 (= (arr!42524 _values!1354) (store mapRest!54928 mapKey!54928 mapValue!54928))))

(declare-fun b!1315079 () Bool)

(assert (=> b!1315079 (= e!750229 tp_is_empty!35533)))

(declare-fun b!1315080 () Bool)

(declare-fun res!872722 () Bool)

(assert (=> b!1315080 (=> (not res!872722) (not e!750230))))

(declare-datatypes ((List!30185 0))(
  ( (Nil!30182) (Cons!30181 (h!31399 (_ BitVec 64)) (t!43783 List!30185)) )
))
(declare-fun arrayNoDuplicates!0 (array!88095 (_ BitVec 32) List!30185) Bool)

(assert (=> b!1315080 (= res!872722 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30182))))

(assert (= (and start!111192 res!872723) b!1315075))

(assert (= (and b!1315075 res!872726) b!1315078))

(assert (= (and b!1315078 res!872724) b!1315080))

(assert (= (and b!1315080 res!872722) b!1315077))

(assert (= (and b!1315077 res!872725) b!1315073))

(assert (= (and b!1315076 condMapEmpty!54928) mapIsEmpty!54928))

(assert (= (and b!1315076 (not condMapEmpty!54928)) mapNonEmpty!54928))

(get-info :version)

(assert (= (and mapNonEmpty!54928 ((_ is ValueCellFull!16868) mapValue!54928)) b!1315074))

(assert (= (and b!1315076 ((_ is ValueCellFull!16868) mapDefault!54928)) b!1315079))

(assert (= start!111192 b!1315076))

(declare-fun m!1204109 () Bool)

(assert (=> mapNonEmpty!54928 m!1204109))

(declare-fun m!1204111 () Bool)

(assert (=> b!1315078 m!1204111))

(declare-fun m!1204113 () Bool)

(assert (=> b!1315080 m!1204113))

(declare-fun m!1204115 () Bool)

(assert (=> start!111192 m!1204115))

(declare-fun m!1204117 () Bool)

(assert (=> start!111192 m!1204117))

(declare-fun m!1204119 () Bool)

(assert (=> start!111192 m!1204119))

(declare-fun m!1204121 () Bool)

(assert (=> b!1315073 m!1204121))

(assert (=> b!1315073 m!1204121))

(declare-fun m!1204123 () Bool)

(assert (=> b!1315073 m!1204123))

(check-sat (not mapNonEmpty!54928) (not b!1315078) (not b!1315073) b_and!48013 (not b!1315080) (not start!111192) tp_is_empty!35533 (not b_next!29803))
(check-sat b_and!48013 (not b_next!29803))
