; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111114 () Bool)

(assert start!111114)

(declare-fun b_free!29949 () Bool)

(declare-fun b_next!29949 () Bool)

(assert (=> start!111114 (= b_free!29949 (not b_next!29949))))

(declare-fun tp!105169 () Bool)

(declare-fun b_and!48157 () Bool)

(assert (=> start!111114 (= tp!105169 b_and!48157)))

(declare-fun mapIsEmpty!55147 () Bool)

(declare-fun mapRes!55147 () Bool)

(assert (=> mapIsEmpty!55147 mapRes!55147))

(declare-fun b!1315598 () Bool)

(declare-fun res!873372 () Bool)

(declare-fun e!750481 () Bool)

(assert (=> b!1315598 (=> (not res!873372) (not e!750481))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52675 0))(
  ( (V!52676 (val!17914 Int)) )
))
(declare-datatypes ((ValueCell!16941 0))(
  ( (ValueCellFull!16941 (v!20541 V!52675)) (EmptyCell!16941) )
))
(declare-datatypes ((array!88320 0))(
  ( (array!88321 (arr!42640 (Array (_ BitVec 32) ValueCell!16941)) (size!43190 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88320)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((array!88322 0))(
  ( (array!88323 (arr!42641 (Array (_ BitVec 32) (_ BitVec 64))) (size!43191 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88322)

(assert (=> b!1315598 (= res!873372 (and (= (size!43190 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43191 _keys!1628) (size!43190 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315599 () Bool)

(declare-fun res!873375 () Bool)

(assert (=> b!1315599 (=> (not res!873375) (not e!750481))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315599 (= res!873375 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43191 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315600 () Bool)

(declare-fun e!750482 () Bool)

(declare-fun tp_is_empty!35679 () Bool)

(assert (=> b!1315600 (= e!750482 tp_is_empty!35679)))

(declare-fun b!1315602 () Bool)

(declare-fun res!873374 () Bool)

(assert (=> b!1315602 (=> (not res!873374) (not e!750481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88322 (_ BitVec 32)) Bool)

(assert (=> b!1315602 (= res!873374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315603 () Bool)

(assert (=> b!1315603 (= e!750481 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun zeroValue!1296 () V!52675)

(declare-fun minValue!1296 () V!52675)

(declare-fun lt!585933 () Bool)

(declare-datatypes ((tuple2!23112 0))(
  ( (tuple2!23113 (_1!11567 (_ BitVec 64)) (_2!11567 V!52675)) )
))
(declare-datatypes ((List!30247 0))(
  ( (Nil!30244) (Cons!30243 (h!31452 tuple2!23112) (t!43853 List!30247)) )
))
(declare-datatypes ((ListLongMap!20769 0))(
  ( (ListLongMap!20770 (toList!10400 List!30247)) )
))
(declare-fun contains!8550 (ListLongMap!20769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5413 (array!88322 array!88320 (_ BitVec 32) (_ BitVec 32) V!52675 V!52675 (_ BitVec 32) Int) ListLongMap!20769)

(assert (=> b!1315603 (= lt!585933 (contains!8550 (getCurrentListMap!5413 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315604 () Bool)

(declare-fun e!750478 () Bool)

(assert (=> b!1315604 (= e!750478 (and e!750482 mapRes!55147))))

(declare-fun condMapEmpty!55147 () Bool)

(declare-fun mapDefault!55147 () ValueCell!16941)

(assert (=> b!1315604 (= condMapEmpty!55147 (= (arr!42640 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16941)) mapDefault!55147)))))

(declare-fun b!1315605 () Bool)

(declare-fun res!873373 () Bool)

(assert (=> b!1315605 (=> (not res!873373) (not e!750481))))

(declare-datatypes ((List!30248 0))(
  ( (Nil!30245) (Cons!30244 (h!31453 (_ BitVec 64)) (t!43854 List!30248)) )
))
(declare-fun arrayNoDuplicates!0 (array!88322 (_ BitVec 32) List!30248) Bool)

(assert (=> b!1315605 (= res!873373 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30245))))

(declare-fun mapNonEmpty!55147 () Bool)

(declare-fun tp!105168 () Bool)

(declare-fun e!750480 () Bool)

(assert (=> mapNonEmpty!55147 (= mapRes!55147 (and tp!105168 e!750480))))

(declare-fun mapValue!55147 () ValueCell!16941)

(declare-fun mapRest!55147 () (Array (_ BitVec 32) ValueCell!16941))

(declare-fun mapKey!55147 () (_ BitVec 32))

(assert (=> mapNonEmpty!55147 (= (arr!42640 _values!1354) (store mapRest!55147 mapKey!55147 mapValue!55147))))

(declare-fun res!873371 () Bool)

(assert (=> start!111114 (=> (not res!873371) (not e!750481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111114 (= res!873371 (validMask!0 mask!2040))))

(assert (=> start!111114 e!750481))

(assert (=> start!111114 tp!105169))

(declare-fun array_inv!32205 (array!88322) Bool)

(assert (=> start!111114 (array_inv!32205 _keys!1628)))

(assert (=> start!111114 true))

(assert (=> start!111114 tp_is_empty!35679))

(declare-fun array_inv!32206 (array!88320) Bool)

(assert (=> start!111114 (and (array_inv!32206 _values!1354) e!750478)))

(declare-fun b!1315601 () Bool)

(assert (=> b!1315601 (= e!750480 tp_is_empty!35679)))

(assert (= (and start!111114 res!873371) b!1315598))

(assert (= (and b!1315598 res!873372) b!1315602))

(assert (= (and b!1315602 res!873374) b!1315605))

(assert (= (and b!1315605 res!873373) b!1315599))

(assert (= (and b!1315599 res!873375) b!1315603))

(assert (= (and b!1315604 condMapEmpty!55147) mapIsEmpty!55147))

(assert (= (and b!1315604 (not condMapEmpty!55147)) mapNonEmpty!55147))

(get-info :version)

(assert (= (and mapNonEmpty!55147 ((_ is ValueCellFull!16941) mapValue!55147)) b!1315601))

(assert (= (and b!1315604 ((_ is ValueCellFull!16941) mapDefault!55147)) b!1315600))

(assert (= start!111114 b!1315604))

(declare-fun m!1203739 () Bool)

(assert (=> b!1315603 m!1203739))

(assert (=> b!1315603 m!1203739))

(declare-fun m!1203741 () Bool)

(assert (=> b!1315603 m!1203741))

(declare-fun m!1203743 () Bool)

(assert (=> start!111114 m!1203743))

(declare-fun m!1203745 () Bool)

(assert (=> start!111114 m!1203745))

(declare-fun m!1203747 () Bool)

(assert (=> start!111114 m!1203747))

(declare-fun m!1203749 () Bool)

(assert (=> mapNonEmpty!55147 m!1203749))

(declare-fun m!1203751 () Bool)

(assert (=> b!1315605 m!1203751))

(declare-fun m!1203753 () Bool)

(assert (=> b!1315602 m!1203753))

(check-sat tp_is_empty!35679 (not start!111114) (not b!1315603) b_and!48157 (not b_next!29949) (not mapNonEmpty!55147) (not b!1315602) (not b!1315605))
(check-sat b_and!48157 (not b_next!29949))
