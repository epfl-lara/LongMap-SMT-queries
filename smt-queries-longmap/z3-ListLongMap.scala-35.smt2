; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!642 () Bool)

(assert start!642)

(declare-fun b_free!115 () Bool)

(declare-fun b_next!115 () Bool)

(assert (=> start!642 (= b_free!115 (not b_next!115))))

(declare-fun tp!562 () Bool)

(declare-fun b_and!253 () Bool)

(assert (=> start!642 (= tp!562 b_and!253)))

(declare-fun b!4141 () Bool)

(declare-fun e!2162 () Bool)

(declare-fun e!2164 () Bool)

(declare-fun mapRes!248 () Bool)

(assert (=> b!4141 (= e!2162 (and e!2164 mapRes!248))))

(declare-fun condMapEmpty!248 () Bool)

(declare-datatypes ((V!435 0))(
  ( (V!436 (val!102 Int)) )
))
(declare-datatypes ((ValueCell!80 0))(
  ( (ValueCellFull!80 (v!1189 V!435)) (EmptyCell!80) )
))
(declare-datatypes ((array!311 0))(
  ( (array!312 (arr!148 (Array (_ BitVec 32) ValueCell!80)) (size!210 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!311)

(declare-fun mapDefault!248 () ValueCell!80)

(assert (=> b!4141 (= condMapEmpty!248 (= (arr!148 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!80)) mapDefault!248)))))

(declare-fun b!4143 () Bool)

(declare-fun e!2161 () Bool)

(assert (=> b!4143 (= e!2161 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!573 () Bool)

(declare-fun minValue!1434 () V!435)

(declare-datatypes ((array!313 0))(
  ( (array!314 (arr!149 (Array (_ BitVec 32) (_ BitVec 64))) (size!211 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!313)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!435)

(declare-datatypes ((tuple2!88 0))(
  ( (tuple2!89 (_1!44 (_ BitVec 64)) (_2!44 V!435)) )
))
(declare-datatypes ((List!93 0))(
  ( (Nil!90) (Cons!89 (h!655 tuple2!88) (t!2220 List!93)) )
))
(declare-datatypes ((ListLongMap!93 0))(
  ( (ListLongMap!94 (toList!62 List!93)) )
))
(declare-fun contains!32 (ListLongMap!93 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!21 (array!313 array!311 (_ BitVec 32) (_ BitVec 32) V!435 V!435 (_ BitVec 32) Int) ListLongMap!93)

(assert (=> b!4143 (= lt!573 (contains!32 (getCurrentListMap!21 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapNonEmpty!248 () Bool)

(declare-fun tp!563 () Bool)

(declare-fun e!2165 () Bool)

(assert (=> mapNonEmpty!248 (= mapRes!248 (and tp!563 e!2165))))

(declare-fun mapValue!248 () ValueCell!80)

(declare-fun mapKey!248 () (_ BitVec 32))

(declare-fun mapRest!248 () (Array (_ BitVec 32) ValueCell!80))

(assert (=> mapNonEmpty!248 (= (arr!148 _values!1492) (store mapRest!248 mapKey!248 mapValue!248))))

(declare-fun b!4144 () Bool)

(declare-fun tp_is_empty!193 () Bool)

(assert (=> b!4144 (= e!2165 tp_is_empty!193)))

(declare-fun b!4145 () Bool)

(declare-fun res!5572 () Bool)

(assert (=> b!4145 (=> (not res!5572) (not e!2161))))

(assert (=> b!4145 (= res!5572 (and (= (size!210 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!211 _keys!1806) (size!210 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4146 () Bool)

(declare-fun res!5569 () Bool)

(assert (=> b!4146 (=> (not res!5569) (not e!2161))))

(declare-datatypes ((List!94 0))(
  ( (Nil!91) (Cons!90 (h!656 (_ BitVec 64)) (t!2221 List!94)) )
))
(declare-fun arrayNoDuplicates!0 (array!313 (_ BitVec 32) List!94) Bool)

(assert (=> b!4146 (= res!5569 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!91))))

(declare-fun b!4147 () Bool)

(declare-fun res!5571 () Bool)

(assert (=> b!4147 (=> (not res!5571) (not e!2161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!313 (_ BitVec 32)) Bool)

(assert (=> b!4147 (= res!5571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!248 () Bool)

(assert (=> mapIsEmpty!248 mapRes!248))

(declare-fun b!4142 () Bool)

(assert (=> b!4142 (= e!2164 tp_is_empty!193)))

(declare-fun res!5570 () Bool)

(assert (=> start!642 (=> (not res!5570) (not e!2161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!642 (= res!5570 (validMask!0 mask!2250))))

(assert (=> start!642 e!2161))

(assert (=> start!642 tp!562))

(assert (=> start!642 true))

(declare-fun array_inv!101 (array!311) Bool)

(assert (=> start!642 (and (array_inv!101 _values!1492) e!2162)))

(assert (=> start!642 tp_is_empty!193))

(declare-fun array_inv!102 (array!313) Bool)

(assert (=> start!642 (array_inv!102 _keys!1806)))

(assert (= (and start!642 res!5570) b!4145))

(assert (= (and b!4145 res!5572) b!4147))

(assert (= (and b!4147 res!5571) b!4146))

(assert (= (and b!4146 res!5569) b!4143))

(assert (= (and b!4141 condMapEmpty!248) mapIsEmpty!248))

(assert (= (and b!4141 (not condMapEmpty!248)) mapNonEmpty!248))

(get-info :version)

(assert (= (and mapNonEmpty!248 ((_ is ValueCellFull!80) mapValue!248)) b!4144))

(assert (= (and b!4141 ((_ is ValueCellFull!80) mapDefault!248)) b!4142))

(assert (= start!642 b!4141))

(declare-fun m!2159 () Bool)

(assert (=> b!4146 m!2159))

(declare-fun m!2161 () Bool)

(assert (=> mapNonEmpty!248 m!2161))

(declare-fun m!2163 () Bool)

(assert (=> b!4143 m!2163))

(assert (=> b!4143 m!2163))

(declare-fun m!2165 () Bool)

(assert (=> b!4143 m!2165))

(declare-fun m!2167 () Bool)

(assert (=> b!4147 m!2167))

(declare-fun m!2169 () Bool)

(assert (=> start!642 m!2169))

(declare-fun m!2171 () Bool)

(assert (=> start!642 m!2171))

(declare-fun m!2173 () Bool)

(assert (=> start!642 m!2173))

(check-sat (not start!642) (not b_next!115) (not b!4147) tp_is_empty!193 (not b!4146) (not b!4143) b_and!253 (not mapNonEmpty!248))
(check-sat b_and!253 (not b_next!115))
