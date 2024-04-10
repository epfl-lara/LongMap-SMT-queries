; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110970 () Bool)

(assert start!110970)

(declare-fun b_free!29805 () Bool)

(declare-fun b_next!29805 () Bool)

(assert (=> start!110970 (= b_free!29805 (not b_next!29805))))

(declare-fun tp!104737 () Bool)

(declare-fun b_and!48013 () Bool)

(assert (=> start!110970 (= tp!104737 b_and!48013)))

(declare-fun b!1313798 () Bool)

(declare-fun res!872222 () Bool)

(declare-fun e!749398 () Bool)

(assert (=> b!1313798 (=> (not res!872222) (not e!749398))))

(declare-datatypes ((array!88042 0))(
  ( (array!88043 (arr!42501 (Array (_ BitVec 32) (_ BitVec 64))) (size!43051 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88042)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52483 0))(
  ( (V!52484 (val!17842 Int)) )
))
(declare-datatypes ((ValueCell!16869 0))(
  ( (ValueCellFull!16869 (v!20469 V!52483)) (EmptyCell!16869) )
))
(declare-datatypes ((array!88044 0))(
  ( (array!88045 (arr!42502 (Array (_ BitVec 32) ValueCell!16869)) (size!43052 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88044)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313798 (= res!872222 (and (= (size!43052 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43051 _keys!1628) (size!43052 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313799 () Bool)

(declare-fun e!749399 () Bool)

(declare-fun tp_is_empty!35535 () Bool)

(assert (=> b!1313799 (= e!749399 tp_is_empty!35535)))

(declare-fun mapNonEmpty!54931 () Bool)

(declare-fun mapRes!54931 () Bool)

(declare-fun tp!104736 () Bool)

(declare-fun e!749401 () Bool)

(assert (=> mapNonEmpty!54931 (= mapRes!54931 (and tp!104736 e!749401))))

(declare-fun mapKey!54931 () (_ BitVec 32))

(declare-fun mapValue!54931 () ValueCell!16869)

(declare-fun mapRest!54931 () (Array (_ BitVec 32) ValueCell!16869))

(assert (=> mapNonEmpty!54931 (= (arr!42502 _values!1354) (store mapRest!54931 mapKey!54931 mapValue!54931))))

(declare-fun b!1313800 () Bool)

(declare-fun res!872220 () Bool)

(assert (=> b!1313800 (=> (not res!872220) (not e!749398))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313800 (= res!872220 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43051 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313801 () Bool)

(assert (=> b!1313801 (= e!749401 tp_is_empty!35535)))

(declare-fun b!1313802 () Bool)

(declare-fun res!872221 () Bool)

(assert (=> b!1313802 (=> (not res!872221) (not e!749398))))

(declare-datatypes ((List!30138 0))(
  ( (Nil!30135) (Cons!30134 (h!31343 (_ BitVec 64)) (t!43744 List!30138)) )
))
(declare-fun arrayNoDuplicates!0 (array!88042 (_ BitVec 32) List!30138) Bool)

(assert (=> b!1313802 (= res!872221 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30135))))

(declare-fun res!872223 () Bool)

(assert (=> start!110970 (=> (not res!872223) (not e!749398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110970 (= res!872223 (validMask!0 mask!2040))))

(assert (=> start!110970 e!749398))

(assert (=> start!110970 tp!104737))

(declare-fun array_inv!32103 (array!88042) Bool)

(assert (=> start!110970 (array_inv!32103 _keys!1628)))

(assert (=> start!110970 true))

(assert (=> start!110970 tp_is_empty!35535))

(declare-fun e!749400 () Bool)

(declare-fun array_inv!32104 (array!88044) Bool)

(assert (=> start!110970 (and (array_inv!32104 _values!1354) e!749400)))

(declare-fun b!1313803 () Bool)

(assert (=> b!1313803 (= e!749400 (and e!749399 mapRes!54931))))

(declare-fun condMapEmpty!54931 () Bool)

(declare-fun mapDefault!54931 () ValueCell!16869)

(assert (=> b!1313803 (= condMapEmpty!54931 (= (arr!42502 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16869)) mapDefault!54931)))))

(declare-fun b!1313804 () Bool)

(assert (=> b!1313804 (= e!749398 false)))

(declare-fun minValue!1296 () V!52483)

(declare-fun zeroValue!1296 () V!52483)

(declare-fun lt!585717 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23002 0))(
  ( (tuple2!23003 (_1!11512 (_ BitVec 64)) (_2!11512 V!52483)) )
))
(declare-datatypes ((List!30139 0))(
  ( (Nil!30136) (Cons!30135 (h!31344 tuple2!23002) (t!43745 List!30139)) )
))
(declare-datatypes ((ListLongMap!20659 0))(
  ( (ListLongMap!20660 (toList!10345 List!30139)) )
))
(declare-fun contains!8495 (ListLongMap!20659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5358 (array!88042 array!88044 (_ BitVec 32) (_ BitVec 32) V!52483 V!52483 (_ BitVec 32) Int) ListLongMap!20659)

(assert (=> b!1313804 (= lt!585717 (contains!8495 (getCurrentListMap!5358 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313805 () Bool)

(declare-fun res!872219 () Bool)

(assert (=> b!1313805 (=> (not res!872219) (not e!749398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88042 (_ BitVec 32)) Bool)

(assert (=> b!1313805 (= res!872219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54931 () Bool)

(assert (=> mapIsEmpty!54931 mapRes!54931))

(assert (= (and start!110970 res!872223) b!1313798))

(assert (= (and b!1313798 res!872222) b!1313805))

(assert (= (and b!1313805 res!872219) b!1313802))

(assert (= (and b!1313802 res!872221) b!1313800))

(assert (= (and b!1313800 res!872220) b!1313804))

(assert (= (and b!1313803 condMapEmpty!54931) mapIsEmpty!54931))

(assert (= (and b!1313803 (not condMapEmpty!54931)) mapNonEmpty!54931))

(get-info :version)

(assert (= (and mapNonEmpty!54931 ((_ is ValueCellFull!16869) mapValue!54931)) b!1313801))

(assert (= (and b!1313803 ((_ is ValueCellFull!16869) mapDefault!54931)) b!1313799))

(assert (= start!110970 b!1313803))

(declare-fun m!1202527 () Bool)

(assert (=> mapNonEmpty!54931 m!1202527))

(declare-fun m!1202529 () Bool)

(assert (=> start!110970 m!1202529))

(declare-fun m!1202531 () Bool)

(assert (=> start!110970 m!1202531))

(declare-fun m!1202533 () Bool)

(assert (=> start!110970 m!1202533))

(declare-fun m!1202535 () Bool)

(assert (=> b!1313802 m!1202535))

(declare-fun m!1202537 () Bool)

(assert (=> b!1313804 m!1202537))

(assert (=> b!1313804 m!1202537))

(declare-fun m!1202539 () Bool)

(assert (=> b!1313804 m!1202539))

(declare-fun m!1202541 () Bool)

(assert (=> b!1313805 m!1202541))

(check-sat tp_is_empty!35535 (not start!110970) (not b!1313802) (not b_next!29805) (not b!1313804) (not mapNonEmpty!54931) b_and!48013 (not b!1313805))
(check-sat b_and!48013 (not b_next!29805))
