; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!928 () Bool)

(assert start!928)

(declare-fun b_free!301 () Bool)

(declare-fun b_next!301 () Bool)

(assert (=> start!928 (= b_free!301 (not b_next!301))))

(declare-fun tp!1135 () Bool)

(declare-fun b_and!449 () Bool)

(assert (=> start!928 (= tp!1135 b_and!449)))

(declare-fun b!7806 () Bool)

(declare-fun res!7617 () Bool)

(declare-fun e!4397 () Bool)

(assert (=> b!7806 (=> (not res!7617) (not e!4397))))

(declare-datatypes ((array!679 0))(
  ( (array!680 (arr!327 (Array (_ BitVec 32) (_ BitVec 64))) (size!389 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!679)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!679 (_ BitVec 32)) Bool)

(assert (=> b!7806 (= res!7617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!7616 () Bool)

(assert (=> start!928 (=> (not res!7616) (not e!4397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!928 (= res!7616 (validMask!0 mask!2250))))

(assert (=> start!928 e!4397))

(assert (=> start!928 tp!1135))

(assert (=> start!928 true))

(declare-datatypes ((V!683 0))(
  ( (V!684 (val!195 Int)) )
))
(declare-datatypes ((ValueCell!173 0))(
  ( (ValueCellFull!173 (v!1287 V!683)) (EmptyCell!173) )
))
(declare-datatypes ((array!681 0))(
  ( (array!682 (arr!328 (Array (_ BitVec 32) ValueCell!173)) (size!390 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!681)

(declare-fun e!4393 () Bool)

(declare-fun array_inv!239 (array!681) Bool)

(assert (=> start!928 (and (array_inv!239 _values!1492) e!4393)))

(declare-fun tp_is_empty!379 () Bool)

(assert (=> start!928 tp_is_empty!379))

(declare-fun array_inv!240 (array!679) Bool)

(assert (=> start!928 (array_inv!240 _keys!1806)))

(declare-fun mapNonEmpty!542 () Bool)

(declare-fun mapRes!542 () Bool)

(declare-fun tp!1136 () Bool)

(declare-fun e!4395 () Bool)

(assert (=> mapNonEmpty!542 (= mapRes!542 (and tp!1136 e!4395))))

(declare-fun mapKey!542 () (_ BitVec 32))

(declare-fun mapRest!542 () (Array (_ BitVec 32) ValueCell!173))

(declare-fun mapValue!542 () ValueCell!173)

(assert (=> mapNonEmpty!542 (= (arr!328 _values!1492) (store mapRest!542 mapKey!542 mapValue!542))))

(declare-fun b!7807 () Bool)

(declare-fun res!7615 () Bool)

(assert (=> b!7807 (=> (not res!7615) (not e!4397))))

(declare-datatypes ((List!224 0))(
  ( (Nil!221) (Cons!220 (h!786 (_ BitVec 64)) (t!2361 List!224)) )
))
(declare-fun arrayNoDuplicates!0 (array!679 (_ BitVec 32) List!224) Bool)

(assert (=> b!7807 (= res!7615 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!221))))

(declare-fun b!7808 () Bool)

(declare-fun e!4394 () Bool)

(assert (=> b!7808 (= e!4393 (and e!4394 mapRes!542))))

(declare-fun condMapEmpty!542 () Bool)

(declare-fun mapDefault!542 () ValueCell!173)

(assert (=> b!7808 (= condMapEmpty!542 (= (arr!328 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!173)) mapDefault!542)))))

(declare-fun b!7809 () Bool)

(assert (=> b!7809 (= e!4394 tp_is_empty!379)))

(declare-fun b!7810 () Bool)

(assert (=> b!7810 (= e!4395 tp_is_empty!379)))

(declare-fun b!7811 () Bool)

(declare-fun res!7618 () Bool)

(assert (=> b!7811 (=> (not res!7618) (not e!4397))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7811 (= res!7618 (and (= (size!390 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!389 _keys!1806) (size!390 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7812 () Bool)

(assert (=> b!7812 (= e!4397 false)))

(declare-fun minValue!1434 () V!683)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!683)

(declare-fun lt!1590 () Bool)

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((tuple2!212 0))(
  ( (tuple2!213 (_1!106 (_ BitVec 64)) (_2!106 V!683)) )
))
(declare-datatypes ((List!225 0))(
  ( (Nil!222) (Cons!221 (h!787 tuple2!212) (t!2362 List!225)) )
))
(declare-datatypes ((ListLongMap!217 0))(
  ( (ListLongMap!218 (toList!124 List!225)) )
))
(declare-fun contains!99 (ListLongMap!217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!83 (array!679 array!681 (_ BitVec 32) (_ BitVec 32) V!683 V!683 (_ BitVec 32) Int) ListLongMap!217)

(assert (=> b!7812 (= lt!1590 (contains!99 (getCurrentListMap!83 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!542 () Bool)

(assert (=> mapIsEmpty!542 mapRes!542))

(assert (= (and start!928 res!7616) b!7811))

(assert (= (and b!7811 res!7618) b!7806))

(assert (= (and b!7806 res!7617) b!7807))

(assert (= (and b!7807 res!7615) b!7812))

(assert (= (and b!7808 condMapEmpty!542) mapIsEmpty!542))

(assert (= (and b!7808 (not condMapEmpty!542)) mapNonEmpty!542))

(get-info :version)

(assert (= (and mapNonEmpty!542 ((_ is ValueCellFull!173) mapValue!542)) b!7810))

(assert (= (and b!7808 ((_ is ValueCellFull!173) mapDefault!542)) b!7809))

(assert (= start!928 b!7808))

(declare-fun m!4757 () Bool)

(assert (=> b!7806 m!4757))

(declare-fun m!4759 () Bool)

(assert (=> mapNonEmpty!542 m!4759))

(declare-fun m!4761 () Bool)

(assert (=> b!7812 m!4761))

(assert (=> b!7812 m!4761))

(declare-fun m!4763 () Bool)

(assert (=> b!7812 m!4763))

(declare-fun m!4765 () Bool)

(assert (=> b!7807 m!4765))

(declare-fun m!4767 () Bool)

(assert (=> start!928 m!4767))

(declare-fun m!4769 () Bool)

(assert (=> start!928 m!4769))

(declare-fun m!4771 () Bool)

(assert (=> start!928 m!4771))

(check-sat (not start!928) b_and!449 (not b!7812) (not b_next!301) (not b!7807) tp_is_empty!379 (not mapNonEmpty!542) (not b!7806))
(check-sat b_and!449 (not b_next!301))
