; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110770 () Bool)

(assert start!110770)

(declare-fun b_free!29605 () Bool)

(declare-fun b_next!29605 () Bool)

(assert (=> start!110770 (= b_free!29605 (not b_next!29605))))

(declare-fun tp!104137 () Bool)

(declare-fun b_and!47795 () Bool)

(assert (=> start!110770 (= tp!104137 b_and!47795)))

(declare-fun b!1310977 () Bool)

(declare-fun e!747866 () Bool)

(declare-fun tp_is_empty!35335 () Bool)

(assert (=> b!1310977 (= e!747866 tp_is_empty!35335)))

(declare-fun b!1310978 () Bool)

(declare-fun e!747868 () Bool)

(assert (=> b!1310978 (= e!747868 tp_is_empty!35335)))

(declare-fun b!1310979 () Bool)

(declare-fun res!870342 () Bool)

(declare-fun e!747869 () Bool)

(assert (=> b!1310979 (=> (not res!870342) (not e!747869))))

(declare-datatypes ((array!87569 0))(
  ( (array!87570 (arr!42265 (Array (_ BitVec 32) (_ BitVec 64))) (size!42817 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87569)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52217 0))(
  ( (V!52218 (val!17742 Int)) )
))
(declare-datatypes ((ValueCell!16769 0))(
  ( (ValueCellFull!16769 (v!20368 V!52217)) (EmptyCell!16769) )
))
(declare-datatypes ((array!87571 0))(
  ( (array!87572 (arr!42266 (Array (_ BitVec 32) ValueCell!16769)) (size!42818 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87571)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310979 (= res!870342 (and (= (size!42818 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42817 _keys!1628) (size!42818 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310980 () Bool)

(assert (=> b!1310980 (= e!747869 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585240 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52217)

(declare-fun zeroValue!1296 () V!52217)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22944 0))(
  ( (tuple2!22945 (_1!11483 (_ BitVec 64)) (_2!11483 V!52217)) )
))
(declare-datatypes ((List!30068 0))(
  ( (Nil!30065) (Cons!30064 (h!31273 tuple2!22944) (t!43666 List!30068)) )
))
(declare-datatypes ((ListLongMap!20601 0))(
  ( (ListLongMap!20602 (toList!10316 List!30068)) )
))
(declare-fun contains!8393 (ListLongMap!20601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5211 (array!87569 array!87571 (_ BitVec 32) (_ BitVec 32) V!52217 V!52217 (_ BitVec 32) Int) ListLongMap!20601)

(assert (=> b!1310980 (= lt!585240 (contains!8393 (getCurrentListMap!5211 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!870343 () Bool)

(assert (=> start!110770 (=> (not res!870343) (not e!747869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110770 (= res!870343 (validMask!0 mask!2040))))

(assert (=> start!110770 e!747869))

(assert (=> start!110770 tp!104137))

(declare-fun array_inv!32121 (array!87569) Bool)

(assert (=> start!110770 (array_inv!32121 _keys!1628)))

(assert (=> start!110770 true))

(assert (=> start!110770 tp_is_empty!35335))

(declare-fun e!747867 () Bool)

(declare-fun array_inv!32122 (array!87571) Bool)

(assert (=> start!110770 (and (array_inv!32122 _values!1354) e!747867)))

(declare-fun mapNonEmpty!54631 () Bool)

(declare-fun mapRes!54631 () Bool)

(declare-fun tp!104138 () Bool)

(assert (=> mapNonEmpty!54631 (= mapRes!54631 (and tp!104138 e!747868))))

(declare-fun mapValue!54631 () ValueCell!16769)

(declare-fun mapRest!54631 () (Array (_ BitVec 32) ValueCell!16769))

(declare-fun mapKey!54631 () (_ BitVec 32))

(assert (=> mapNonEmpty!54631 (= (arr!42266 _values!1354) (store mapRest!54631 mapKey!54631 mapValue!54631))))

(declare-fun b!1310981 () Bool)

(assert (=> b!1310981 (= e!747867 (and e!747866 mapRes!54631))))

(declare-fun condMapEmpty!54631 () Bool)

(declare-fun mapDefault!54631 () ValueCell!16769)

(assert (=> b!1310981 (= condMapEmpty!54631 (= (arr!42266 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16769)) mapDefault!54631)))))

(declare-fun b!1310982 () Bool)

(declare-fun res!870339 () Bool)

(assert (=> b!1310982 (=> (not res!870339) (not e!747869))))

(declare-datatypes ((List!30069 0))(
  ( (Nil!30066) (Cons!30065 (h!31274 (_ BitVec 64)) (t!43667 List!30069)) )
))
(declare-fun arrayNoDuplicates!0 (array!87569 (_ BitVec 32) List!30069) Bool)

(assert (=> b!1310982 (= res!870339 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30066))))

(declare-fun mapIsEmpty!54631 () Bool)

(assert (=> mapIsEmpty!54631 mapRes!54631))

(declare-fun b!1310983 () Bool)

(declare-fun res!870340 () Bool)

(assert (=> b!1310983 (=> (not res!870340) (not e!747869))))

(assert (=> b!1310983 (= res!870340 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42817 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310984 () Bool)

(declare-fun res!870341 () Bool)

(assert (=> b!1310984 (=> (not res!870341) (not e!747869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87569 (_ BitVec 32)) Bool)

(assert (=> b!1310984 (= res!870341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110770 res!870343) b!1310979))

(assert (= (and b!1310979 res!870342) b!1310984))

(assert (= (and b!1310984 res!870341) b!1310982))

(assert (= (and b!1310982 res!870339) b!1310983))

(assert (= (and b!1310983 res!870340) b!1310980))

(assert (= (and b!1310981 condMapEmpty!54631) mapIsEmpty!54631))

(assert (= (and b!1310981 (not condMapEmpty!54631)) mapNonEmpty!54631))

(get-info :version)

(assert (= (and mapNonEmpty!54631 ((_ is ValueCellFull!16769) mapValue!54631)) b!1310978))

(assert (= (and b!1310981 ((_ is ValueCellFull!16769) mapDefault!54631)) b!1310977))

(assert (= start!110770 b!1310981))

(declare-fun m!1200129 () Bool)

(assert (=> b!1310982 m!1200129))

(declare-fun m!1200131 () Bool)

(assert (=> b!1310980 m!1200131))

(assert (=> b!1310980 m!1200131))

(declare-fun m!1200133 () Bool)

(assert (=> b!1310980 m!1200133))

(declare-fun m!1200135 () Bool)

(assert (=> b!1310984 m!1200135))

(declare-fun m!1200137 () Bool)

(assert (=> mapNonEmpty!54631 m!1200137))

(declare-fun m!1200139 () Bool)

(assert (=> start!110770 m!1200139))

(declare-fun m!1200141 () Bool)

(assert (=> start!110770 m!1200141))

(declare-fun m!1200143 () Bool)

(assert (=> start!110770 m!1200143))

(check-sat (not start!110770) tp_is_empty!35335 b_and!47795 (not mapNonEmpty!54631) (not b!1310982) (not b_next!29605) (not b!1310984) (not b!1310980))
(check-sat b_and!47795 (not b_next!29605))
