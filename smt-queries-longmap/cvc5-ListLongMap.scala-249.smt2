; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4176 () Bool)

(assert start!4176)

(declare-fun b_free!1081 () Bool)

(declare-fun b_next!1081 () Bool)

(assert (=> start!4176 (= b_free!1081 (not b_next!1081))))

(declare-fun tp!4663 () Bool)

(declare-fun b_and!1891 () Bool)

(assert (=> start!4176 (= tp!4663 b_and!1891)))

(declare-fun b!31587 () Bool)

(declare-fun res!19142 () Bool)

(declare-fun e!20173 () Bool)

(assert (=> b!31587 (=> (not res!19142) (not e!20173))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1739 0))(
  ( (V!1740 (val!744 Int)) )
))
(declare-datatypes ((ValueCell!518 0))(
  ( (ValueCellFull!518 (v!1833 V!1739)) (EmptyCell!518) )
))
(declare-datatypes ((array!2087 0))(
  ( (array!2088 (arr!997 (Array (_ BitVec 32) ValueCell!518)) (size!1098 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2087)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2089 0))(
  ( (array!2090 (arr!998 (Array (_ BitVec 32) (_ BitVec 64))) (size!1099 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2089)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1739)

(declare-fun minValue!1443 () V!1739)

(declare-datatypes ((tuple2!1214 0))(
  ( (tuple2!1215 (_1!618 (_ BitVec 64)) (_2!618 V!1739)) )
))
(declare-datatypes ((List!808 0))(
  ( (Nil!805) (Cons!804 (h!1371 tuple2!1214) (t!3501 List!808)) )
))
(declare-datatypes ((ListLongMap!791 0))(
  ( (ListLongMap!792 (toList!411 List!808)) )
))
(declare-fun contains!351 (ListLongMap!791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!239 (array!2089 array!2087 (_ BitVec 32) (_ BitVec 32) V!1739 V!1739 (_ BitVec 32) Int) ListLongMap!791)

(assert (=> b!31587 (= res!19142 (not (contains!351 (getCurrentListMap!239 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31588 () Bool)

(declare-fun e!20171 () Bool)

(declare-fun tp_is_empty!1435 () Bool)

(assert (=> b!31588 (= e!20171 tp_is_empty!1435)))

(declare-fun b!31589 () Bool)

(assert (=> b!31589 (= e!20173 false)))

(declare-fun lt!11582 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2089 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31589 (= lt!11582 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31590 () Bool)

(declare-fun e!20170 () Bool)

(assert (=> b!31590 (= e!20170 tp_is_empty!1435)))

(declare-fun b!31591 () Bool)

(declare-fun res!19143 () Bool)

(assert (=> b!31591 (=> (not res!19143) (not e!20173))))

(declare-fun arrayContainsKey!0 (array!2089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31591 (= res!19143 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31592 () Bool)

(declare-fun res!19146 () Bool)

(assert (=> b!31592 (=> (not res!19146) (not e!20173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31592 (= res!19146 (validKeyInArray!0 k!1304))))

(declare-fun b!31593 () Bool)

(declare-fun res!19144 () Bool)

(assert (=> b!31593 (=> (not res!19144) (not e!20173))))

(assert (=> b!31593 (= res!19144 (and (= (size!1098 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1099 _keys!1833) (size!1098 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19140 () Bool)

(assert (=> start!4176 (=> (not res!19140) (not e!20173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4176 (= res!19140 (validMask!0 mask!2294))))

(assert (=> start!4176 e!20173))

(assert (=> start!4176 true))

(assert (=> start!4176 tp!4663))

(declare-fun e!20174 () Bool)

(declare-fun array_inv!697 (array!2087) Bool)

(assert (=> start!4176 (and (array_inv!697 _values!1501) e!20174)))

(declare-fun array_inv!698 (array!2089) Bool)

(assert (=> start!4176 (array_inv!698 _keys!1833)))

(assert (=> start!4176 tp_is_empty!1435))

(declare-fun mapNonEmpty!1681 () Bool)

(declare-fun mapRes!1681 () Bool)

(declare-fun tp!4662 () Bool)

(assert (=> mapNonEmpty!1681 (= mapRes!1681 (and tp!4662 e!20170))))

(declare-fun mapRest!1681 () (Array (_ BitVec 32) ValueCell!518))

(declare-fun mapValue!1681 () ValueCell!518)

(declare-fun mapKey!1681 () (_ BitVec 32))

(assert (=> mapNonEmpty!1681 (= (arr!997 _values!1501) (store mapRest!1681 mapKey!1681 mapValue!1681))))

(declare-fun b!31594 () Bool)

(assert (=> b!31594 (= e!20174 (and e!20171 mapRes!1681))))

(declare-fun condMapEmpty!1681 () Bool)

(declare-fun mapDefault!1681 () ValueCell!518)

