; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4134 () Bool)

(assert start!4134)

(declare-fun b_free!1039 () Bool)

(declare-fun b_next!1039 () Bool)

(assert (=> start!4134 (= b_free!1039 (not b_next!1039))))

(declare-fun tp!4536 () Bool)

(declare-fun b_and!1849 () Bool)

(assert (=> start!4134 (= tp!4536 b_and!1849)))

(declare-fun mapNonEmpty!1618 () Bool)

(declare-fun mapRes!1618 () Bool)

(declare-fun tp!4537 () Bool)

(declare-fun e!19859 () Bool)

(assert (=> mapNonEmpty!1618 (= mapRes!1618 (and tp!4537 e!19859))))

(declare-datatypes ((V!1683 0))(
  ( (V!1684 (val!723 Int)) )
))
(declare-datatypes ((ValueCell!497 0))(
  ( (ValueCellFull!497 (v!1812 V!1683)) (EmptyCell!497) )
))
(declare-datatypes ((array!2009 0))(
  ( (array!2010 (arr!958 (Array (_ BitVec 32) ValueCell!497)) (size!1059 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2009)

(declare-fun mapKey!1618 () (_ BitVec 32))

(declare-fun mapValue!1618 () ValueCell!497)

(declare-fun mapRest!1618 () (Array (_ BitVec 32) ValueCell!497))

(assert (=> mapNonEmpty!1618 (= (arr!958 _values!1501) (store mapRest!1618 mapKey!1618 mapValue!1618))))

(declare-fun b!31002 () Bool)

(declare-fun res!18744 () Bool)

(declare-fun e!19857 () Bool)

(assert (=> b!31002 (=> (not res!18744) (not e!19857))))

(declare-datatypes ((array!2011 0))(
  ( (array!2012 (arr!959 (Array (_ BitVec 32) (_ BitVec 64))) (size!1060 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2011)

(declare-datatypes ((List!779 0))(
  ( (Nil!776) (Cons!775 (h!1342 (_ BitVec 64)) (t!3472 List!779)) )
))
(declare-fun arrayNoDuplicates!0 (array!2011 (_ BitVec 32) List!779) Bool)

(assert (=> b!31002 (= res!18744 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!776))))

(declare-fun res!18750 () Bool)

(assert (=> start!4134 (=> (not res!18750) (not e!19857))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4134 (= res!18750 (validMask!0 mask!2294))))

(assert (=> start!4134 e!19857))

(assert (=> start!4134 true))

(assert (=> start!4134 tp!4536))

(declare-fun e!19855 () Bool)

(declare-fun array_inv!669 (array!2009) Bool)

(assert (=> start!4134 (and (array_inv!669 _values!1501) e!19855)))

(declare-fun array_inv!670 (array!2011) Bool)

(assert (=> start!4134 (array_inv!670 _keys!1833)))

(declare-fun tp_is_empty!1393 () Bool)

(assert (=> start!4134 tp_is_empty!1393))

(declare-fun b!31003 () Bool)

(declare-fun res!18747 () Bool)

(assert (=> b!31003 (=> (not res!18747) (not e!19857))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1683)

(declare-fun minValue!1443 () V!1683)

(declare-datatypes ((tuple2!1186 0))(
  ( (tuple2!1187 (_1!604 (_ BitVec 64)) (_2!604 V!1683)) )
))
(declare-datatypes ((List!780 0))(
  ( (Nil!777) (Cons!776 (h!1343 tuple2!1186) (t!3473 List!780)) )
))
(declare-datatypes ((ListLongMap!763 0))(
  ( (ListLongMap!764 (toList!397 List!780)) )
))
(declare-fun contains!337 (ListLongMap!763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!225 (array!2011 array!2009 (_ BitVec 32) (_ BitVec 32) V!1683 V!1683 (_ BitVec 32) Int) ListLongMap!763)

(assert (=> b!31003 (= res!18747 (not (contains!337 (getCurrentListMap!225 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31004 () Bool)

(assert (=> b!31004 (= e!19857 false)))

(declare-datatypes ((SeekEntryResult!115 0))(
  ( (MissingZero!115 (index!2582 (_ BitVec 32))) (Found!115 (index!2583 (_ BitVec 32))) (Intermediate!115 (undefined!927 Bool) (index!2584 (_ BitVec 32)) (x!6593 (_ BitVec 32))) (Undefined!115) (MissingVacant!115 (index!2585 (_ BitVec 32))) )
))
(declare-fun lt!11528 () SeekEntryResult!115)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2011 (_ BitVec 32)) SeekEntryResult!115)

(assert (=> b!31004 (= lt!11528 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!31005 () Bool)

(declare-fun e!19858 () Bool)

(assert (=> b!31005 (= e!19858 tp_is_empty!1393)))

(declare-fun b!31006 () Bool)

(assert (=> b!31006 (= e!19855 (and e!19858 mapRes!1618))))

(declare-fun condMapEmpty!1618 () Bool)

(declare-fun mapDefault!1618 () ValueCell!497)

