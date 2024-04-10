; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111026 () Bool)

(assert start!111026)

(declare-fun b_free!29861 () Bool)

(declare-fun b_next!29861 () Bool)

(assert (=> start!111026 (= b_free!29861 (not b_next!29861))))

(declare-fun tp!104905 () Bool)

(declare-fun b_and!48069 () Bool)

(assert (=> start!111026 (= tp!104905 b_and!48069)))

(declare-fun b!1314506 () Bool)

(declare-fun res!872676 () Bool)

(declare-fun e!749821 () Bool)

(assert (=> b!1314506 (=> (not res!872676) (not e!749821))))

(declare-datatypes ((array!88152 0))(
  ( (array!88153 (arr!42556 (Array (_ BitVec 32) (_ BitVec 64))) (size!43106 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88152)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314506 (= res!872676 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43106 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55015 () Bool)

(declare-fun mapRes!55015 () Bool)

(assert (=> mapIsEmpty!55015 mapRes!55015))

(declare-fun b!1314507 () Bool)

(declare-fun e!749822 () Bool)

(declare-fun tp_is_empty!35591 () Bool)

(assert (=> b!1314507 (= e!749822 tp_is_empty!35591)))

(declare-fun b!1314508 () Bool)

(declare-fun res!872678 () Bool)

(assert (=> b!1314508 (=> (not res!872678) (not e!749821))))

(declare-datatypes ((List!30181 0))(
  ( (Nil!30178) (Cons!30177 (h!31386 (_ BitVec 64)) (t!43787 List!30181)) )
))
(declare-fun arrayNoDuplicates!0 (array!88152 (_ BitVec 32) List!30181) Bool)

(assert (=> b!1314508 (= res!872678 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30178))))

(declare-fun b!1314509 () Bool)

(declare-fun e!749819 () Bool)

(assert (=> b!1314509 (= e!749819 tp_is_empty!35591)))

(declare-fun mapNonEmpty!55015 () Bool)

(declare-fun tp!104904 () Bool)

(assert (=> mapNonEmpty!55015 (= mapRes!55015 (and tp!104904 e!749822))))

(declare-fun mapKey!55015 () (_ BitVec 32))

(declare-datatypes ((V!52557 0))(
  ( (V!52558 (val!17870 Int)) )
))
(declare-datatypes ((ValueCell!16897 0))(
  ( (ValueCellFull!16897 (v!20497 V!52557)) (EmptyCell!16897) )
))
(declare-fun mapValue!55015 () ValueCell!16897)

(declare-fun mapRest!55015 () (Array (_ BitVec 32) ValueCell!16897))

(declare-datatypes ((array!88154 0))(
  ( (array!88155 (arr!42557 (Array (_ BitVec 32) ValueCell!16897)) (size!43107 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88154)

(assert (=> mapNonEmpty!55015 (= (arr!42557 _values!1354) (store mapRest!55015 mapKey!55015 mapValue!55015))))

(declare-fun b!1314510 () Bool)

(declare-fun res!872675 () Bool)

(assert (=> b!1314510 (=> (not res!872675) (not e!749821))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88152 (_ BitVec 32)) Bool)

(assert (=> b!1314510 (= res!872675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314511 () Bool)

(assert (=> b!1314511 (= e!749821 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52557)

(declare-fun zeroValue!1296 () V!52557)

(declare-fun lt!585801 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23044 0))(
  ( (tuple2!23045 (_1!11533 (_ BitVec 64)) (_2!11533 V!52557)) )
))
(declare-datatypes ((List!30182 0))(
  ( (Nil!30179) (Cons!30178 (h!31387 tuple2!23044) (t!43788 List!30182)) )
))
(declare-datatypes ((ListLongMap!20701 0))(
  ( (ListLongMap!20702 (toList!10366 List!30182)) )
))
(declare-fun contains!8516 (ListLongMap!20701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5379 (array!88152 array!88154 (_ BitVec 32) (_ BitVec 32) V!52557 V!52557 (_ BitVec 32) Int) ListLongMap!20701)

(assert (=> b!1314511 (= lt!585801 (contains!8516 (getCurrentListMap!5379 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314513 () Bool)

(declare-fun res!872677 () Bool)

(assert (=> b!1314513 (=> (not res!872677) (not e!749821))))

(assert (=> b!1314513 (= res!872677 (and (= (size!43107 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43106 _keys!1628) (size!43107 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872679 () Bool)

(assert (=> start!111026 (=> (not res!872679) (not e!749821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111026 (= res!872679 (validMask!0 mask!2040))))

(assert (=> start!111026 e!749821))

(assert (=> start!111026 tp!104905))

(declare-fun array_inv!32141 (array!88152) Bool)

(assert (=> start!111026 (array_inv!32141 _keys!1628)))

(assert (=> start!111026 true))

(assert (=> start!111026 tp_is_empty!35591))

(declare-fun e!749820 () Bool)

(declare-fun array_inv!32142 (array!88154) Bool)

(assert (=> start!111026 (and (array_inv!32142 _values!1354) e!749820)))

(declare-fun b!1314512 () Bool)

(assert (=> b!1314512 (= e!749820 (and e!749819 mapRes!55015))))

(declare-fun condMapEmpty!55015 () Bool)

(declare-fun mapDefault!55015 () ValueCell!16897)

