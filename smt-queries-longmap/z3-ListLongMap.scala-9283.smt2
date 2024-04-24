; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111270 () Bool)

(assert start!111270)

(declare-fun b_free!29881 () Bool)

(declare-fun b_next!29881 () Bool)

(assert (=> start!111270 (= b_free!29881 (not b_next!29881))))

(declare-fun tp!104964 () Bool)

(declare-fun b_and!48091 () Bool)

(assert (=> start!111270 (= tp!104964 b_and!48091)))

(declare-fun b!1316045 () Bool)

(declare-fun e!750813 () Bool)

(assert (=> b!1316045 (= e!750813 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88249 0))(
  ( (array!88250 (arr!42600 (Array (_ BitVec 32) (_ BitVec 64))) (size!43151 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88249)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52585 0))(
  ( (V!52586 (val!17880 Int)) )
))
(declare-fun minValue!1296 () V!52585)

(declare-datatypes ((ValueCell!16907 0))(
  ( (ValueCellFull!16907 (v!20502 V!52585)) (EmptyCell!16907) )
))
(declare-datatypes ((array!88251 0))(
  ( (array!88252 (arr!42601 (Array (_ BitVec 32) ValueCell!16907)) (size!43152 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88251)

(declare-fun zeroValue!1296 () V!52585)

(declare-fun lt!586307 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23090 0))(
  ( (tuple2!23091 (_1!11556 (_ BitVec 64)) (_2!11556 V!52585)) )
))
(declare-datatypes ((List!30237 0))(
  ( (Nil!30234) (Cons!30233 (h!31451 tuple2!23090) (t!43835 List!30237)) )
))
(declare-datatypes ((ListLongMap!20755 0))(
  ( (ListLongMap!20756 (toList!10393 List!30237)) )
))
(declare-fun contains!8555 (ListLongMap!20755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5397 (array!88249 array!88251 (_ BitVec 32) (_ BitVec 32) V!52585 V!52585 (_ BitVec 32) Int) ListLongMap!20755)

(assert (=> b!1316045 (= lt!586307 (contains!8555 (getCurrentListMap!5397 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316046 () Bool)

(declare-fun res!873347 () Bool)

(assert (=> b!1316046 (=> (not res!873347) (not e!750813))))

(declare-datatypes ((List!30238 0))(
  ( (Nil!30235) (Cons!30234 (h!31452 (_ BitVec 64)) (t!43836 List!30238)) )
))
(declare-fun arrayNoDuplicates!0 (array!88249 (_ BitVec 32) List!30238) Bool)

(assert (=> b!1316046 (= res!873347 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30235))))

(declare-fun b!1316047 () Bool)

(declare-fun res!873345 () Bool)

(assert (=> b!1316047 (=> (not res!873345) (not e!750813))))

(assert (=> b!1316047 (= res!873345 (and (= (size!43152 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43151 _keys!1628) (size!43152 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316048 () Bool)

(declare-fun res!873343 () Bool)

(assert (=> b!1316048 (=> (not res!873343) (not e!750813))))

(assert (=> b!1316048 (= res!873343 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43151 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55045 () Bool)

(declare-fun mapRes!55045 () Bool)

(assert (=> mapIsEmpty!55045 mapRes!55045))

(declare-fun b!1316049 () Bool)

(declare-fun e!750814 () Bool)

(declare-fun e!750811 () Bool)

(assert (=> b!1316049 (= e!750814 (and e!750811 mapRes!55045))))

(declare-fun condMapEmpty!55045 () Bool)

(declare-fun mapDefault!55045 () ValueCell!16907)

(assert (=> b!1316049 (= condMapEmpty!55045 (= (arr!42601 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16907)) mapDefault!55045)))))

(declare-fun mapNonEmpty!55045 () Bool)

(declare-fun tp!104965 () Bool)

(declare-fun e!750812 () Bool)

(assert (=> mapNonEmpty!55045 (= mapRes!55045 (and tp!104965 e!750812))))

(declare-fun mapKey!55045 () (_ BitVec 32))

(declare-fun mapRest!55045 () (Array (_ BitVec 32) ValueCell!16907))

(declare-fun mapValue!55045 () ValueCell!16907)

(assert (=> mapNonEmpty!55045 (= (arr!42601 _values!1354) (store mapRest!55045 mapKey!55045 mapValue!55045))))

(declare-fun res!873346 () Bool)

(assert (=> start!111270 (=> (not res!873346) (not e!750813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111270 (= res!873346 (validMask!0 mask!2040))))

(assert (=> start!111270 e!750813))

(assert (=> start!111270 tp!104964))

(declare-fun array_inv!32441 (array!88249) Bool)

(assert (=> start!111270 (array_inv!32441 _keys!1628)))

(assert (=> start!111270 true))

(declare-fun tp_is_empty!35611 () Bool)

(assert (=> start!111270 tp_is_empty!35611))

(declare-fun array_inv!32442 (array!88251) Bool)

(assert (=> start!111270 (and (array_inv!32442 _values!1354) e!750814)))

(declare-fun b!1316050 () Bool)

(assert (=> b!1316050 (= e!750811 tp_is_empty!35611)))

(declare-fun b!1316051 () Bool)

(assert (=> b!1316051 (= e!750812 tp_is_empty!35611)))

(declare-fun b!1316052 () Bool)

(declare-fun res!873344 () Bool)

(assert (=> b!1316052 (=> (not res!873344) (not e!750813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88249 (_ BitVec 32)) Bool)

(assert (=> b!1316052 (= res!873344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111270 res!873346) b!1316047))

(assert (= (and b!1316047 res!873345) b!1316052))

(assert (= (and b!1316052 res!873344) b!1316046))

(assert (= (and b!1316046 res!873347) b!1316048))

(assert (= (and b!1316048 res!873343) b!1316045))

(assert (= (and b!1316049 condMapEmpty!55045) mapIsEmpty!55045))

(assert (= (and b!1316049 (not condMapEmpty!55045)) mapNonEmpty!55045))

(get-info :version)

(assert (= (and mapNonEmpty!55045 ((_ is ValueCellFull!16907) mapValue!55045)) b!1316051))

(assert (= (and b!1316049 ((_ is ValueCellFull!16907) mapDefault!55045)) b!1316050))

(assert (= start!111270 b!1316049))

(declare-fun m!1204763 () Bool)

(assert (=> b!1316045 m!1204763))

(assert (=> b!1316045 m!1204763))

(declare-fun m!1204765 () Bool)

(assert (=> b!1316045 m!1204765))

(declare-fun m!1204767 () Bool)

(assert (=> b!1316052 m!1204767))

(declare-fun m!1204769 () Bool)

(assert (=> mapNonEmpty!55045 m!1204769))

(declare-fun m!1204771 () Bool)

(assert (=> start!111270 m!1204771))

(declare-fun m!1204773 () Bool)

(assert (=> start!111270 m!1204773))

(declare-fun m!1204775 () Bool)

(assert (=> start!111270 m!1204775))

(declare-fun m!1204777 () Bool)

(assert (=> b!1316046 m!1204777))

(check-sat tp_is_empty!35611 (not b!1316045) (not b!1316046) (not start!111270) b_and!48091 (not mapNonEmpty!55045) (not b_next!29881) (not b!1316052))
(check-sat b_and!48091 (not b_next!29881))
