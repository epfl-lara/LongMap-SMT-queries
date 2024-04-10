; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108992 () Bool)

(assert start!108992)

(declare-fun b_free!28481 () Bool)

(declare-fun b_next!28481 () Bool)

(assert (=> start!108992 (= b_free!28481 (not b_next!28481))))

(declare-fun tp!100562 () Bool)

(declare-fun b_and!46571 () Bool)

(assert (=> start!108992 (= tp!100562 b_and!46571)))

(declare-fun b!1287960 () Bool)

(declare-fun res!855417 () Bool)

(declare-fun e!735488 () Bool)

(assert (=> b!1287960 (=> (not res!855417) (not e!735488))))

(declare-datatypes ((V!50597 0))(
  ( (V!50598 (val!17135 Int)) )
))
(declare-fun minValue!1387 () V!50597)

(declare-fun zeroValue!1387 () V!50597)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16162 0))(
  ( (ValueCellFull!16162 (v!19738 V!50597)) (EmptyCell!16162) )
))
(declare-datatypes ((array!85290 0))(
  ( (array!85291 (arr!41146 (Array (_ BitVec 32) ValueCell!16162)) (size!41696 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85290)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85292 0))(
  ( (array!85293 (arr!41147 (Array (_ BitVec 32) (_ BitVec 64))) (size!41697 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85292)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21992 0))(
  ( (tuple2!21993 (_1!11007 (_ BitVec 64)) (_2!11007 V!50597)) )
))
(declare-datatypes ((List!29168 0))(
  ( (Nil!29165) (Cons!29164 (h!30373 tuple2!21992) (t!42732 List!29168)) )
))
(declare-datatypes ((ListLongMap!19649 0))(
  ( (ListLongMap!19650 (toList!9840 List!29168)) )
))
(declare-fun contains!7958 (ListLongMap!19649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4908 (array!85292 array!85290 (_ BitVec 32) (_ BitVec 32) V!50597 V!50597 (_ BitVec 32) Int) ListLongMap!19649)

(assert (=> b!1287960 (= res!855417 (contains!7958 (getCurrentListMap!4908 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52742 () Bool)

(declare-fun mapRes!52742 () Bool)

(declare-fun tp!100561 () Bool)

(declare-fun e!735487 () Bool)

(assert (=> mapNonEmpty!52742 (= mapRes!52742 (and tp!100561 e!735487))))

(declare-fun mapValue!52742 () ValueCell!16162)

(declare-fun mapRest!52742 () (Array (_ BitVec 32) ValueCell!16162))

(declare-fun mapKey!52742 () (_ BitVec 32))

(assert (=> mapNonEmpty!52742 (= (arr!41146 _values!1445) (store mapRest!52742 mapKey!52742 mapValue!52742))))

(declare-fun b!1287962 () Bool)

(declare-fun tp_is_empty!34121 () Bool)

(assert (=> b!1287962 (= e!735487 tp_is_empty!34121)))

(declare-fun b!1287963 () Bool)

(declare-fun res!855419 () Bool)

(assert (=> b!1287963 (=> (not res!855419) (not e!735488))))

(assert (=> b!1287963 (= res!855419 (and (= (size!41696 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41697 _keys!1741) (size!41696 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52742 () Bool)

(assert (=> mapIsEmpty!52742 mapRes!52742))

(declare-fun b!1287961 () Bool)

(assert (=> b!1287961 (= e!735488 (not true))))

(assert (=> b!1287961 (not (contains!7958 (ListLongMap!19650 Nil!29165) k!1205))))

(declare-datatypes ((Unit!42600 0))(
  ( (Unit!42601) )
))
(declare-fun lt!577913 () Unit!42600)

(declare-fun emptyContainsNothing!29 ((_ BitVec 64)) Unit!42600)

(assert (=> b!1287961 (= lt!577913 (emptyContainsNothing!29 k!1205))))

(declare-fun res!855418 () Bool)

(assert (=> start!108992 (=> (not res!855418) (not e!735488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108992 (= res!855418 (validMask!0 mask!2175))))

(assert (=> start!108992 e!735488))

(assert (=> start!108992 tp_is_empty!34121))

(assert (=> start!108992 true))

(declare-fun e!735485 () Bool)

(declare-fun array_inv!31203 (array!85290) Bool)

(assert (=> start!108992 (and (array_inv!31203 _values!1445) e!735485)))

(declare-fun array_inv!31204 (array!85292) Bool)

(assert (=> start!108992 (array_inv!31204 _keys!1741)))

(assert (=> start!108992 tp!100562))

(declare-fun b!1287964 () Bool)

(declare-fun res!855416 () Bool)

(assert (=> b!1287964 (=> (not res!855416) (not e!735488))))

(assert (=> b!1287964 (= res!855416 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41697 _keys!1741))))))

(declare-fun b!1287965 () Bool)

(declare-fun e!735484 () Bool)

(assert (=> b!1287965 (= e!735485 (and e!735484 mapRes!52742))))

(declare-fun condMapEmpty!52742 () Bool)

(declare-fun mapDefault!52742 () ValueCell!16162)

