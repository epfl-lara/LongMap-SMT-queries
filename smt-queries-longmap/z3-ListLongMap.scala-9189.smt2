; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110484 () Bool)

(assert start!110484)

(declare-fun b!1306971 () Bool)

(declare-fun res!867581 () Bool)

(declare-fun e!745756 () Bool)

(assert (=> b!1306971 (=> (not res!867581) (not e!745756))))

(declare-datatypes ((array!87104 0))(
  ( (array!87105 (arr!42032 (Array (_ BitVec 32) (_ BitVec 64))) (size!42582 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87104)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87104 (_ BitVec 32)) Bool)

(assert (=> b!1306971 (= res!867581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306972 () Bool)

(declare-fun res!867582 () Bool)

(assert (=> b!1306972 (=> (not res!867582) (not e!745756))))

(declare-datatypes ((List!29804 0))(
  ( (Nil!29801) (Cons!29800 (h!31009 (_ BitVec 64)) (t!43410 List!29804)) )
))
(declare-fun arrayNoDuplicates!0 (array!87104 (_ BitVec 32) List!29804) Bool)

(assert (=> b!1306972 (= res!867582 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29801))))

(declare-fun mapIsEmpty!54202 () Bool)

(declare-fun mapRes!54202 () Bool)

(assert (=> mapIsEmpty!54202 mapRes!54202))

(declare-fun res!867579 () Bool)

(assert (=> start!110484 (=> (not res!867579) (not e!745756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110484 (= res!867579 (validMask!0 mask!2040))))

(assert (=> start!110484 e!745756))

(declare-fun array_inv!31775 (array!87104) Bool)

(assert (=> start!110484 (array_inv!31775 _keys!1628)))

(assert (=> start!110484 true))

(declare-datatypes ((V!51835 0))(
  ( (V!51836 (val!17599 Int)) )
))
(declare-datatypes ((ValueCell!16626 0))(
  ( (ValueCellFull!16626 (v!20226 V!51835)) (EmptyCell!16626) )
))
(declare-datatypes ((array!87106 0))(
  ( (array!87107 (arr!42033 (Array (_ BitVec 32) ValueCell!16626)) (size!42583 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87106)

(declare-fun e!745754 () Bool)

(declare-fun array_inv!31776 (array!87106) Bool)

(assert (=> start!110484 (and (array_inv!31776 _values!1354) e!745754)))

(declare-fun b!1306973 () Bool)

(declare-fun res!867580 () Bool)

(assert (=> b!1306973 (=> (not res!867580) (not e!745756))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306973 (= res!867580 (and (= (size!42583 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42582 _keys!1628) (size!42583 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun b!1306974 () Bool)

(assert (=> b!1306974 (= e!745756 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42582 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2020 (size!42582 _keys!1628))))))

(declare-fun b!1306975 () Bool)

(declare-fun e!745755 () Bool)

(declare-fun tp_is_empty!35049 () Bool)

(assert (=> b!1306975 (= e!745755 tp_is_empty!35049)))

(declare-fun b!1306976 () Bool)

(declare-fun e!745757 () Bool)

(assert (=> b!1306976 (= e!745757 tp_is_empty!35049)))

(declare-fun mapNonEmpty!54202 () Bool)

(declare-fun tp!103282 () Bool)

(assert (=> mapNonEmpty!54202 (= mapRes!54202 (and tp!103282 e!745757))))

(declare-fun mapKey!54202 () (_ BitVec 32))

(declare-fun mapRest!54202 () (Array (_ BitVec 32) ValueCell!16626))

(declare-fun mapValue!54202 () ValueCell!16626)

(assert (=> mapNonEmpty!54202 (= (arr!42033 _values!1354) (store mapRest!54202 mapKey!54202 mapValue!54202))))

(declare-fun b!1306977 () Bool)

(assert (=> b!1306977 (= e!745754 (and e!745755 mapRes!54202))))

(declare-fun condMapEmpty!54202 () Bool)

(declare-fun mapDefault!54202 () ValueCell!16626)

(assert (=> b!1306977 (= condMapEmpty!54202 (= (arr!42033 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16626)) mapDefault!54202)))))

(assert (= (and start!110484 res!867579) b!1306973))

(assert (= (and b!1306973 res!867580) b!1306971))

(assert (= (and b!1306971 res!867581) b!1306972))

(assert (= (and b!1306972 res!867582) b!1306974))

(assert (= (and b!1306977 condMapEmpty!54202) mapIsEmpty!54202))

(assert (= (and b!1306977 (not condMapEmpty!54202)) mapNonEmpty!54202))

(get-info :version)

(assert (= (and mapNonEmpty!54202 ((_ is ValueCellFull!16626) mapValue!54202)) b!1306976))

(assert (= (and b!1306977 ((_ is ValueCellFull!16626) mapDefault!54202)) b!1306975))

(assert (= start!110484 b!1306977))

(declare-fun m!1197825 () Bool)

(assert (=> b!1306971 m!1197825))

(declare-fun m!1197827 () Bool)

(assert (=> b!1306972 m!1197827))

(declare-fun m!1197829 () Bool)

(assert (=> start!110484 m!1197829))

(declare-fun m!1197831 () Bool)

(assert (=> start!110484 m!1197831))

(declare-fun m!1197833 () Bool)

(assert (=> start!110484 m!1197833))

(declare-fun m!1197835 () Bool)

(assert (=> mapNonEmpty!54202 m!1197835))

(check-sat tp_is_empty!35049 (not b!1306972) (not b!1306971) (not mapNonEmpty!54202) (not start!110484))
(check-sat)
