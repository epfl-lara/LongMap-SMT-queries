; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!936 () Bool)

(assert start!936)

(declare-fun b_free!309 () Bool)

(declare-fun b_next!309 () Bool)

(assert (=> start!936 (= b_free!309 (not b_next!309))))

(declare-fun tp!1159 () Bool)

(declare-fun b_and!457 () Bool)

(assert (=> start!936 (= tp!1159 b_and!457)))

(declare-fun b!7890 () Bool)

(declare-fun e!4454 () Bool)

(assert (=> b!7890 (= e!4454 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!1602 () Bool)

(declare-datatypes ((V!693 0))(
  ( (V!694 (val!199 Int)) )
))
(declare-datatypes ((ValueCell!177 0))(
  ( (ValueCellFull!177 (v!1291 V!693)) (EmptyCell!177) )
))
(declare-datatypes ((array!705 0))(
  ( (array!706 (arr!340 (Array (_ BitVec 32) ValueCell!177)) (size!402 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!705)

(declare-fun minValue!1434 () V!693)

(declare-datatypes ((array!707 0))(
  ( (array!708 (arr!341 (Array (_ BitVec 32) (_ BitVec 64))) (size!403 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!707)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!693)

(declare-datatypes ((tuple2!220 0))(
  ( (tuple2!221 (_1!110 (_ BitVec 64)) (_2!110 V!693)) )
))
(declare-datatypes ((List!230 0))(
  ( (Nil!227) (Cons!226 (h!792 tuple2!220) (t!2367 List!230)) )
))
(declare-datatypes ((ListLongMap!225 0))(
  ( (ListLongMap!226 (toList!128 List!230)) )
))
(declare-fun contains!103 (ListLongMap!225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!87 (array!707 array!705 (_ BitVec 32) (_ BitVec 32) V!693 V!693 (_ BitVec 32) Int) ListLongMap!225)

(assert (=> b!7890 (= lt!1602 (contains!103 (getCurrentListMap!87 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7891 () Bool)

(declare-fun e!4455 () Bool)

(declare-fun tp_is_empty!387 () Bool)

(assert (=> b!7891 (= e!4455 tp_is_empty!387)))

(declare-fun b!7892 () Bool)

(declare-fun res!7666 () Bool)

(assert (=> b!7892 (=> (not res!7666) (not e!4454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!707 (_ BitVec 32)) Bool)

(assert (=> b!7892 (= res!7666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!554 () Bool)

(declare-fun mapRes!554 () Bool)

(assert (=> mapIsEmpty!554 mapRes!554))

(declare-fun b!7893 () Bool)

(declare-fun e!4457 () Bool)

(assert (=> b!7893 (= e!4457 tp_is_empty!387)))

(declare-fun res!7663 () Bool)

(assert (=> start!936 (=> (not res!7663) (not e!4454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!936 (= res!7663 (validMask!0 mask!2250))))

(assert (=> start!936 e!4454))

(assert (=> start!936 tp!1159))

(assert (=> start!936 true))

(declare-fun e!4453 () Bool)

(declare-fun array_inv!251 (array!705) Bool)

(assert (=> start!936 (and (array_inv!251 _values!1492) e!4453)))

(assert (=> start!936 tp_is_empty!387))

(declare-fun array_inv!252 (array!707) Bool)

(assert (=> start!936 (array_inv!252 _keys!1806)))

(declare-fun b!7894 () Bool)

(assert (=> b!7894 (= e!4453 (and e!4455 mapRes!554))))

(declare-fun condMapEmpty!554 () Bool)

(declare-fun mapDefault!554 () ValueCell!177)

(assert (=> b!7894 (= condMapEmpty!554 (= (arr!340 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!177)) mapDefault!554)))))

(declare-fun b!7895 () Bool)

(declare-fun res!7665 () Bool)

(assert (=> b!7895 (=> (not res!7665) (not e!4454))))

(assert (=> b!7895 (= res!7665 (and (= (size!402 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!403 _keys!1806) (size!402 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!554 () Bool)

(declare-fun tp!1160 () Bool)

(assert (=> mapNonEmpty!554 (= mapRes!554 (and tp!1160 e!4457))))

(declare-fun mapKey!554 () (_ BitVec 32))

(declare-fun mapRest!554 () (Array (_ BitVec 32) ValueCell!177))

(declare-fun mapValue!554 () ValueCell!177)

(assert (=> mapNonEmpty!554 (= (arr!340 _values!1492) (store mapRest!554 mapKey!554 mapValue!554))))

(declare-fun b!7896 () Bool)

(declare-fun res!7664 () Bool)

(assert (=> b!7896 (=> (not res!7664) (not e!4454))))

(declare-datatypes ((List!231 0))(
  ( (Nil!228) (Cons!227 (h!793 (_ BitVec 64)) (t!2368 List!231)) )
))
(declare-fun arrayNoDuplicates!0 (array!707 (_ BitVec 32) List!231) Bool)

(assert (=> b!7896 (= res!7664 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!228))))

(assert (= (and start!936 res!7663) b!7895))

(assert (= (and b!7895 res!7665) b!7892))

(assert (= (and b!7892 res!7666) b!7896))

(assert (= (and b!7896 res!7664) b!7890))

(assert (= (and b!7894 condMapEmpty!554) mapIsEmpty!554))

(assert (= (and b!7894 (not condMapEmpty!554)) mapNonEmpty!554))

(get-info :version)

(assert (= (and mapNonEmpty!554 ((_ is ValueCellFull!177) mapValue!554)) b!7893))

(assert (= (and b!7894 ((_ is ValueCellFull!177) mapDefault!554)) b!7891))

(assert (= start!936 b!7894))

(declare-fun m!4821 () Bool)

(assert (=> mapNonEmpty!554 m!4821))

(declare-fun m!4823 () Bool)

(assert (=> b!7896 m!4823))

(declare-fun m!4825 () Bool)

(assert (=> start!936 m!4825))

(declare-fun m!4827 () Bool)

(assert (=> start!936 m!4827))

(declare-fun m!4829 () Bool)

(assert (=> start!936 m!4829))

(declare-fun m!4831 () Bool)

(assert (=> b!7890 m!4831))

(assert (=> b!7890 m!4831))

(declare-fun m!4833 () Bool)

(assert (=> b!7890 m!4833))

(declare-fun m!4835 () Bool)

(assert (=> b!7892 m!4835))

(check-sat (not b!7892) (not b_next!309) (not mapNonEmpty!554) tp_is_empty!387 b_and!457 (not b!7890) (not b!7896) (not start!936))
(check-sat b_and!457 (not b_next!309))
