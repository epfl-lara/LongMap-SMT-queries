; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108498 () Bool)

(assert start!108498)

(declare-fun b_free!28045 () Bool)

(declare-fun b_next!28045 () Bool)

(assert (=> start!108498 (= b_free!28045 (not b_next!28045))))

(declare-fun tp!99244 () Bool)

(declare-fun b_and!46105 () Bool)

(assert (=> start!108498 (= tp!99244 b_and!46105)))

(declare-fun b!1280575 () Bool)

(declare-fun res!850634 () Bool)

(declare-fun e!731703 () Bool)

(assert (=> b!1280575 (=> (not res!850634) (not e!731703))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84446 0))(
  ( (array!84447 (arr!40727 (Array (_ BitVec 32) (_ BitVec 64))) (size!41277 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84446)

(assert (=> b!1280575 (= res!850634 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41277 _keys!1741))))))

(declare-fun b!1280576 () Bool)

(assert (=> b!1280576 (= e!731703 (not true))))

(declare-datatypes ((V!50017 0))(
  ( (V!50018 (val!16917 Int)) )
))
(declare-fun minValue!1387 () V!50017)

(declare-fun zeroValue!1387 () V!50017)

(declare-datatypes ((ValueCell!15944 0))(
  ( (ValueCellFull!15944 (v!19517 V!50017)) (EmptyCell!15944) )
))
(declare-datatypes ((array!84448 0))(
  ( (array!84449 (arr!40728 (Array (_ BitVec 32) ValueCell!15944)) (size!41278 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84448)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21652 0))(
  ( (tuple2!21653 (_1!10837 (_ BitVec 64)) (_2!10837 V!50017)) )
))
(declare-datatypes ((List!28850 0))(
  ( (Nil!28847) (Cons!28846 (h!30055 tuple2!21652) (t!42390 List!28850)) )
))
(declare-datatypes ((ListLongMap!19309 0))(
  ( (ListLongMap!19310 (toList!9670 List!28850)) )
))
(declare-fun contains!7785 (ListLongMap!19309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4754 (array!84446 array!84448 (_ BitVec 32) (_ BitVec 32) V!50017 V!50017 (_ BitVec 32) Int) ListLongMap!19309)

(assert (=> b!1280576 (contains!7785 (getCurrentListMap!4754 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42397 0))(
  ( (Unit!42398) )
))
(declare-fun lt!576140 () Unit!42397)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!3 (array!84446 array!84448 (_ BitVec 32) (_ BitVec 32) V!50017 V!50017 (_ BitVec 64) (_ BitVec 32) Int) Unit!42397)

(assert (=> b!1280576 (= lt!576140 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!3 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52079 () Bool)

(declare-fun mapRes!52079 () Bool)

(assert (=> mapIsEmpty!52079 mapRes!52079))

(declare-fun mapNonEmpty!52079 () Bool)

(declare-fun tp!99245 () Bool)

(declare-fun e!731704 () Bool)

(assert (=> mapNonEmpty!52079 (= mapRes!52079 (and tp!99245 e!731704))))

(declare-fun mapValue!52079 () ValueCell!15944)

(declare-fun mapKey!52079 () (_ BitVec 32))

(declare-fun mapRest!52079 () (Array (_ BitVec 32) ValueCell!15944))

(assert (=> mapNonEmpty!52079 (= (arr!40728 _values!1445) (store mapRest!52079 mapKey!52079 mapValue!52079))))

(declare-fun b!1280577 () Bool)

(declare-fun e!731701 () Bool)

(declare-fun e!731702 () Bool)

(assert (=> b!1280577 (= e!731701 (and e!731702 mapRes!52079))))

(declare-fun condMapEmpty!52079 () Bool)

(declare-fun mapDefault!52079 () ValueCell!15944)

