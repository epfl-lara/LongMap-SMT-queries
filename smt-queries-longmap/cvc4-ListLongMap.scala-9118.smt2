; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109496 () Bool)

(assert start!109496)

(declare-fun b_free!28985 () Bool)

(declare-fun b_next!28985 () Bool)

(assert (=> start!109496 (= b_free!28985 (not b_next!28985))))

(declare-fun tp!102073 () Bool)

(declare-fun b_and!47075 () Bool)

(assert (=> start!109496 (= tp!102073 b_and!47075)))

(declare-fun b!1296854 () Bool)

(declare-fun e!739859 () Bool)

(declare-fun tp_is_empty!34625 () Bool)

(assert (=> b!1296854 (= e!739859 tp_is_empty!34625)))

(declare-fun mapIsEmpty!53498 () Bool)

(declare-fun mapRes!53498 () Bool)

(assert (=> mapIsEmpty!53498 mapRes!53498))

(declare-fun mapNonEmpty!53498 () Bool)

(declare-fun tp!102074 () Bool)

(declare-fun e!739860 () Bool)

(assert (=> mapNonEmpty!53498 (= mapRes!53498 (and tp!102074 e!739860))))

(declare-datatypes ((V!51269 0))(
  ( (V!51270 (val!17387 Int)) )
))
(declare-datatypes ((ValueCell!16414 0))(
  ( (ValueCellFull!16414 (v!19990 V!51269)) (EmptyCell!16414) )
))
(declare-datatypes ((array!86266 0))(
  ( (array!86267 (arr!41634 (Array (_ BitVec 32) ValueCell!16414)) (size!42184 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86266)

(declare-fun mapRest!53498 () (Array (_ BitVec 32) ValueCell!16414))

(declare-fun mapKey!53498 () (_ BitVec 32))

(declare-fun mapValue!53498 () ValueCell!16414)

(assert (=> mapNonEmpty!53498 (= (arr!41634 _values!1445) (store mapRest!53498 mapKey!53498 mapValue!53498))))

(declare-fun b!1296855 () Bool)

(declare-fun res!861881 () Bool)

(declare-fun e!739858 () Bool)

(assert (=> b!1296855 (=> (not res!861881) (not e!739858))))

(declare-datatypes ((array!86268 0))(
  ( (array!86269 (arr!41635 (Array (_ BitVec 32) (_ BitVec 64))) (size!42185 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86268)

(declare-datatypes ((List!29538 0))(
  ( (Nil!29535) (Cons!29534 (h!30743 (_ BitVec 64)) (t!43102 List!29538)) )
))
(declare-fun arrayNoDuplicates!0 (array!86268 (_ BitVec 32) List!29538) Bool)

(assert (=> b!1296855 (= res!861881 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29535))))

(declare-fun b!1296856 () Bool)

(declare-fun res!861880 () Bool)

(assert (=> b!1296856 (=> (not res!861880) (not e!739858))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86268 (_ BitVec 32)) Bool)

(assert (=> b!1296856 (= res!861880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296857 () Bool)

(assert (=> b!1296857 (= e!739860 tp_is_empty!34625)))

(declare-fun b!1296858 () Bool)

(declare-fun res!861877 () Bool)

(assert (=> b!1296858 (=> (not res!861877) (not e!739858))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296858 (= res!861877 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42185 _keys!1741))))))

(declare-fun res!861882 () Bool)

(assert (=> start!109496 (=> (not res!861882) (not e!739858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109496 (= res!861882 (validMask!0 mask!2175))))

(assert (=> start!109496 e!739858))

(assert (=> start!109496 tp_is_empty!34625))

(assert (=> start!109496 true))

(declare-fun e!739861 () Bool)

(declare-fun array_inv!31511 (array!86266) Bool)

(assert (=> start!109496 (and (array_inv!31511 _values!1445) e!739861)))

(declare-fun array_inv!31512 (array!86268) Bool)

(assert (=> start!109496 (array_inv!31512 _keys!1741)))

(assert (=> start!109496 tp!102073))

(declare-fun b!1296859 () Bool)

(declare-fun res!861878 () Bool)

(assert (=> b!1296859 (=> (not res!861878) (not e!739858))))

(declare-fun minValue!1387 () V!51269)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51269)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22402 0))(
  ( (tuple2!22403 (_1!11212 (_ BitVec 64)) (_2!11212 V!51269)) )
))
(declare-datatypes ((List!29539 0))(
  ( (Nil!29536) (Cons!29535 (h!30744 tuple2!22402) (t!43103 List!29539)) )
))
(declare-datatypes ((ListLongMap!20059 0))(
  ( (ListLongMap!20060 (toList!10045 List!29539)) )
))
(declare-fun contains!8163 (ListLongMap!20059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5074 (array!86268 array!86266 (_ BitVec 32) (_ BitVec 32) V!51269 V!51269 (_ BitVec 32) Int) ListLongMap!20059)

(assert (=> b!1296859 (= res!861878 (contains!8163 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296860 () Bool)

(assert (=> b!1296860 (= e!739861 (and e!739859 mapRes!53498))))

(declare-fun condMapEmpty!53498 () Bool)

(declare-fun mapDefault!53498 () ValueCell!16414)

