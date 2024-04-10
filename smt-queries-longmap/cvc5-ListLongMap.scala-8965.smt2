; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108516 () Bool)

(assert start!108516)

(declare-fun b_free!28063 () Bool)

(declare-fun b_next!28063 () Bool)

(assert (=> start!108516 (= b_free!28063 (not b_next!28063))))

(declare-fun tp!99299 () Bool)

(declare-fun b_and!46123 () Bool)

(assert (=> start!108516 (= tp!99299 b_and!46123)))

(declare-fun b!1280845 () Bool)

(declare-fun res!850823 () Bool)

(declare-fun e!731836 () Bool)

(assert (=> b!1280845 (=> (not res!850823) (not e!731836))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84482 0))(
  ( (array!84483 (arr!40745 (Array (_ BitVec 32) (_ BitVec 64))) (size!41295 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84482)

(assert (=> b!1280845 (= res!850823 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41295 _keys!1741))))))

(declare-fun b!1280846 () Bool)

(declare-fun e!731840 () Bool)

(declare-fun tp_is_empty!33703 () Bool)

(assert (=> b!1280846 (= e!731840 tp_is_empty!33703)))

(declare-fun b!1280847 () Bool)

(assert (=> b!1280847 (= e!731836 (not true))))

(declare-datatypes ((V!50041 0))(
  ( (V!50042 (val!16926 Int)) )
))
(declare-fun minValue!1387 () V!50041)

(declare-fun zeroValue!1387 () V!50041)

(declare-datatypes ((ValueCell!15953 0))(
  ( (ValueCellFull!15953 (v!19526 V!50041)) (EmptyCell!15953) )
))
(declare-datatypes ((array!84484 0))(
  ( (array!84485 (arr!40746 (Array (_ BitVec 32) ValueCell!15953)) (size!41296 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84484)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21668 0))(
  ( (tuple2!21669 (_1!10845 (_ BitVec 64)) (_2!10845 V!50041)) )
))
(declare-datatypes ((List!28864 0))(
  ( (Nil!28861) (Cons!28860 (h!30069 tuple2!21668) (t!42404 List!28864)) )
))
(declare-datatypes ((ListLongMap!19325 0))(
  ( (ListLongMap!19326 (toList!9678 List!28864)) )
))
(declare-fun contains!7793 (ListLongMap!19325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4762 (array!84482 array!84484 (_ BitVec 32) (_ BitVec 32) V!50041 V!50041 (_ BitVec 32) Int) ListLongMap!19325)

(assert (=> b!1280847 (contains!7793 (getCurrentListMap!4762 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42413 0))(
  ( (Unit!42414) )
))
(declare-fun lt!576167 () Unit!42413)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!11 (array!84482 array!84484 (_ BitVec 32) (_ BitVec 32) V!50041 V!50041 (_ BitVec 64) (_ BitVec 32) Int) Unit!42413)

(assert (=> b!1280847 (= lt!576167 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!11 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280848 () Bool)

(declare-fun res!850819 () Bool)

(assert (=> b!1280848 (=> (not res!850819) (not e!731836))))

(assert (=> b!1280848 (= res!850819 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41295 _keys!1741)) (not (= (select (arr!40745 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1280850 () Bool)

(declare-fun res!850821 () Bool)

(assert (=> b!1280850 (=> (not res!850821) (not e!731836))))

(declare-datatypes ((List!28865 0))(
  ( (Nil!28862) (Cons!28861 (h!30070 (_ BitVec 64)) (t!42405 List!28865)) )
))
(declare-fun arrayNoDuplicates!0 (array!84482 (_ BitVec 32) List!28865) Bool)

(assert (=> b!1280850 (= res!850821 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28862))))

(declare-fun b!1280851 () Bool)

(declare-fun e!731838 () Bool)

(declare-fun mapRes!52106 () Bool)

(assert (=> b!1280851 (= e!731838 (and e!731840 mapRes!52106))))

(declare-fun condMapEmpty!52106 () Bool)

(declare-fun mapDefault!52106 () ValueCell!15953)

