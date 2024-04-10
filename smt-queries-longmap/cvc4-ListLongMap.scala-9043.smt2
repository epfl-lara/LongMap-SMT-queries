; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109046 () Bool)

(assert start!109046)

(declare-fun b_free!28535 () Bool)

(declare-fun b_next!28535 () Bool)

(assert (=> start!109046 (= b_free!28535 (not b_next!28535))))

(declare-fun tp!100723 () Bool)

(declare-fun b_and!46625 () Bool)

(assert (=> start!109046 (= tp!100723 b_and!46625)))

(declare-fun b!1288913 () Bool)

(declare-fun res!856123 () Bool)

(declare-fun e!735951 () Bool)

(assert (=> b!1288913 (=> (not res!856123) (not e!735951))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85394 0))(
  ( (array!85395 (arr!41198 (Array (_ BitVec 32) (_ BitVec 64))) (size!41748 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85394)

(assert (=> b!1288913 (= res!856123 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41748 _keys!1741))))))

(declare-fun b!1288914 () Bool)

(declare-fun e!735954 () Bool)

(assert (=> b!1288914 (= e!735951 (not e!735954))))

(declare-fun res!856127 () Bool)

(assert (=> b!1288914 (=> res!856127 e!735954)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288914 (= res!856127 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50669 0))(
  ( (V!50670 (val!17162 Int)) )
))
(declare-datatypes ((tuple2!22038 0))(
  ( (tuple2!22039 (_1!11030 (_ BitVec 64)) (_2!11030 V!50669)) )
))
(declare-datatypes ((List!29209 0))(
  ( (Nil!29206) (Cons!29205 (h!30414 tuple2!22038) (t!42773 List!29209)) )
))
(declare-datatypes ((ListLongMap!19695 0))(
  ( (ListLongMap!19696 (toList!9863 List!29209)) )
))
(declare-fun contains!7981 (ListLongMap!19695 (_ BitVec 64)) Bool)

(assert (=> b!1288914 (not (contains!7981 (ListLongMap!19696 Nil!29206) k!1205))))

(declare-datatypes ((Unit!42644 0))(
  ( (Unit!42645) )
))
(declare-fun lt!578110 () Unit!42644)

(declare-fun emptyContainsNothing!51 ((_ BitVec 64)) Unit!42644)

(assert (=> b!1288914 (= lt!578110 (emptyContainsNothing!51 k!1205))))

(declare-fun b!1288915 () Bool)

(declare-fun res!856130 () Bool)

(assert (=> b!1288915 (=> (not res!856130) (not e!735951))))

(declare-datatypes ((List!29210 0))(
  ( (Nil!29207) (Cons!29206 (h!30415 (_ BitVec 64)) (t!42774 List!29210)) )
))
(declare-fun arrayNoDuplicates!0 (array!85394 (_ BitVec 32) List!29210) Bool)

(assert (=> b!1288915 (= res!856130 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29207))))

(declare-fun b!1288916 () Bool)

(declare-fun e!735953 () Bool)

(declare-fun tp_is_empty!34175 () Bool)

(assert (=> b!1288916 (= e!735953 tp_is_empty!34175)))

(declare-fun b!1288917 () Bool)

(declare-fun res!856126 () Bool)

(assert (=> b!1288917 (=> (not res!856126) (not e!735951))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16189 0))(
  ( (ValueCellFull!16189 (v!19765 V!50669)) (EmptyCell!16189) )
))
(declare-datatypes ((array!85396 0))(
  ( (array!85397 (arr!41199 (Array (_ BitVec 32) ValueCell!16189)) (size!41749 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85396)

(assert (=> b!1288917 (= res!856126 (and (= (size!41749 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41748 _keys!1741) (size!41749 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288918 () Bool)

(declare-fun e!735956 () Bool)

(assert (=> b!1288918 (= e!735956 tp_is_empty!34175)))

(declare-fun res!856124 () Bool)

(assert (=> start!109046 (=> (not res!856124) (not e!735951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109046 (= res!856124 (validMask!0 mask!2175))))

(assert (=> start!109046 e!735951))

(assert (=> start!109046 tp_is_empty!34175))

(assert (=> start!109046 true))

(declare-fun e!735952 () Bool)

(declare-fun array_inv!31235 (array!85396) Bool)

(assert (=> start!109046 (and (array_inv!31235 _values!1445) e!735952)))

(declare-fun array_inv!31236 (array!85394) Bool)

(assert (=> start!109046 (array_inv!31236 _keys!1741)))

(assert (=> start!109046 tp!100723))

(declare-fun b!1288919 () Bool)

(declare-fun res!856128 () Bool)

(assert (=> b!1288919 (=> (not res!856128) (not e!735951))))

(assert (=> b!1288919 (= res!856128 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41748 _keys!1741))))))

(declare-fun mapIsEmpty!52823 () Bool)

(declare-fun mapRes!52823 () Bool)

(assert (=> mapIsEmpty!52823 mapRes!52823))

(declare-fun b!1288920 () Bool)

(declare-fun res!856125 () Bool)

(assert (=> b!1288920 (=> (not res!856125) (not e!735951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288920 (= res!856125 (not (validKeyInArray!0 (select (arr!41198 _keys!1741) from!2144))))))

(declare-fun b!1288921 () Bool)

(assert (=> b!1288921 (= e!735954 true)))

(declare-fun lt!578111 () ListLongMap!19695)

(declare-fun zeroValue!1387 () V!50669)

(declare-fun +!4335 (ListLongMap!19695 tuple2!22038) ListLongMap!19695)

(assert (=> b!1288921 (not (contains!7981 (+!4335 lt!578111 (tuple2!22039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578109 () Unit!42644)

(declare-fun addStillNotContains!353 (ListLongMap!19695 (_ BitVec 64) V!50669 (_ BitVec 64)) Unit!42644)

(assert (=> b!1288921 (= lt!578109 (addStillNotContains!353 lt!578111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50669)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5966 (array!85394 array!85396 (_ BitVec 32) (_ BitVec 32) V!50669 V!50669 (_ BitVec 32) Int) ListLongMap!19695)

(assert (=> b!1288921 (= lt!578111 (getCurrentListMapNoExtraKeys!5966 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288922 () Bool)

(assert (=> b!1288922 (= e!735952 (and e!735956 mapRes!52823))))

(declare-fun condMapEmpty!52823 () Bool)

(declare-fun mapDefault!52823 () ValueCell!16189)

