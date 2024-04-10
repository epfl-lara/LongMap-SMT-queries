; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4160 () Bool)

(assert start!4160)

(declare-fun b_free!1065 () Bool)

(declare-fun b_next!1065 () Bool)

(assert (=> start!4160 (= b_free!1065 (not b_next!1065))))

(declare-fun tp!4614 () Bool)

(declare-fun b_and!1875 () Bool)

(assert (=> start!4160 (= tp!4614 b_and!1875)))

(declare-fun b!31373 () Bool)

(declare-fun e!20051 () Bool)

(declare-fun tp_is_empty!1419 () Bool)

(assert (=> b!31373 (= e!20051 tp_is_empty!1419)))

(declare-fun b!31374 () Bool)

(declare-fun res!18999 () Bool)

(declare-fun e!20054 () Bool)

(assert (=> b!31374 (=> (not res!18999) (not e!20054))))

(declare-datatypes ((V!1717 0))(
  ( (V!1718 (val!736 Int)) )
))
(declare-datatypes ((ValueCell!510 0))(
  ( (ValueCellFull!510 (v!1825 V!1717)) (EmptyCell!510) )
))
(declare-datatypes ((array!2059 0))(
  ( (array!2060 (arr!983 (Array (_ BitVec 32) ValueCell!510)) (size!1084 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2059)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2061 0))(
  ( (array!2062 (arr!984 (Array (_ BitVec 32) (_ BitVec 64))) (size!1085 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2061)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31374 (= res!18999 (and (= (size!1084 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1085 _keys!1833) (size!1084 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1657 () Bool)

(declare-fun mapRes!1657 () Bool)

(assert (=> mapIsEmpty!1657 mapRes!1657))

(declare-fun res!19001 () Bool)

(assert (=> start!4160 (=> (not res!19001) (not e!20054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4160 (= res!19001 (validMask!0 mask!2294))))

(assert (=> start!4160 e!20054))

(assert (=> start!4160 true))

(assert (=> start!4160 tp!4614))

(declare-fun e!20053 () Bool)

(declare-fun array_inv!685 (array!2059) Bool)

(assert (=> start!4160 (and (array_inv!685 _values!1501) e!20053)))

(declare-fun array_inv!686 (array!2061) Bool)

(assert (=> start!4160 (array_inv!686 _keys!1833)))

(assert (=> start!4160 tp_is_empty!1419))

(declare-fun mapNonEmpty!1657 () Bool)

(declare-fun tp!4615 () Bool)

(assert (=> mapNonEmpty!1657 (= mapRes!1657 (and tp!4615 e!20051))))

(declare-fun mapValue!1657 () ValueCell!510)

(declare-fun mapRest!1657 () (Array (_ BitVec 32) ValueCell!510))

(declare-fun mapKey!1657 () (_ BitVec 32))

(assert (=> mapNonEmpty!1657 (= (arr!983 _values!1501) (store mapRest!1657 mapKey!1657 mapValue!1657))))

(declare-fun b!31375 () Bool)

(declare-fun res!18998 () Bool)

(assert (=> b!31375 (=> (not res!18998) (not e!20054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2061 (_ BitVec 32)) Bool)

(assert (=> b!31375 (= res!18998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31376 () Bool)

(declare-fun res!19002 () Bool)

(assert (=> b!31376 (=> (not res!19002) (not e!20054))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31376 (= res!19002 (validKeyInArray!0 k0!1304))))

(declare-fun b!31377 () Bool)

(declare-fun e!20050 () Bool)

(assert (=> b!31377 (= e!20053 (and e!20050 mapRes!1657))))

(declare-fun condMapEmpty!1657 () Bool)

(declare-fun mapDefault!1657 () ValueCell!510)

(assert (=> b!31377 (= condMapEmpty!1657 (= (arr!983 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!510)) mapDefault!1657)))))

(declare-fun b!31378 () Bool)

(declare-fun res!19000 () Bool)

(assert (=> b!31378 (=> (not res!19000) (not e!20054))))

(declare-datatypes ((List!797 0))(
  ( (Nil!794) (Cons!793 (h!1360 (_ BitVec 64)) (t!3490 List!797)) )
))
(declare-fun arrayNoDuplicates!0 (array!2061 (_ BitVec 32) List!797) Bool)

(assert (=> b!31378 (= res!19000 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!794))))

(declare-fun b!31379 () Bool)

(assert (=> b!31379 (= e!20054 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11558 () Bool)

(declare-fun zeroValue!1443 () V!1717)

(declare-fun minValue!1443 () V!1717)

(declare-datatypes ((tuple2!1202 0))(
  ( (tuple2!1203 (_1!612 (_ BitVec 64)) (_2!612 V!1717)) )
))
(declare-datatypes ((List!798 0))(
  ( (Nil!795) (Cons!794 (h!1361 tuple2!1202) (t!3491 List!798)) )
))
(declare-datatypes ((ListLongMap!779 0))(
  ( (ListLongMap!780 (toList!405 List!798)) )
))
(declare-fun contains!345 (ListLongMap!779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!233 (array!2061 array!2059 (_ BitVec 32) (_ BitVec 32) V!1717 V!1717 (_ BitVec 32) Int) ListLongMap!779)

(assert (=> b!31379 (= lt!11558 (contains!345 (getCurrentListMap!233 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31380 () Bool)

(assert (=> b!31380 (= e!20050 tp_is_empty!1419)))

(assert (= (and start!4160 res!19001) b!31374))

(assert (= (and b!31374 res!18999) b!31375))

(assert (= (and b!31375 res!18998) b!31378))

(assert (= (and b!31378 res!19000) b!31376))

(assert (= (and b!31376 res!19002) b!31379))

(assert (= (and b!31377 condMapEmpty!1657) mapIsEmpty!1657))

(assert (= (and b!31377 (not condMapEmpty!1657)) mapNonEmpty!1657))

(get-info :version)

(assert (= (and mapNonEmpty!1657 ((_ is ValueCellFull!510) mapValue!1657)) b!31373))

(assert (= (and b!31377 ((_ is ValueCellFull!510) mapDefault!1657)) b!31380))

(assert (= start!4160 b!31377))

(declare-fun m!25171 () Bool)

(assert (=> b!31375 m!25171))

(declare-fun m!25173 () Bool)

(assert (=> start!4160 m!25173))

(declare-fun m!25175 () Bool)

(assert (=> start!4160 m!25175))

(declare-fun m!25177 () Bool)

(assert (=> start!4160 m!25177))

(declare-fun m!25179 () Bool)

(assert (=> mapNonEmpty!1657 m!25179))

(declare-fun m!25181 () Bool)

(assert (=> b!31376 m!25181))

(declare-fun m!25183 () Bool)

(assert (=> b!31378 m!25183))

(declare-fun m!25185 () Bool)

(assert (=> b!31379 m!25185))

(assert (=> b!31379 m!25185))

(declare-fun m!25187 () Bool)

(assert (=> b!31379 m!25187))

(check-sat b_and!1875 (not start!4160) (not b!31376) (not mapNonEmpty!1657) (not b!31379) tp_is_empty!1419 (not b!31378) (not b_next!1065) (not b!31375))
(check-sat b_and!1875 (not b_next!1065))
