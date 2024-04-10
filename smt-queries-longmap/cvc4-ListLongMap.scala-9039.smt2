; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109022 () Bool)

(assert start!109022)

(declare-fun b_free!28511 () Bool)

(declare-fun b_next!28511 () Bool)

(assert (=> start!109022 (= b_free!28511 (not b_next!28511))))

(declare-fun tp!100652 () Bool)

(declare-fun b_and!46601 () Bool)

(assert (=> start!109022 (= tp!100652 b_and!46601)))

(declare-fun b!1288481 () Bool)

(declare-fun res!855799 () Bool)

(declare-fun e!735737 () Bool)

(assert (=> b!1288481 (=> (not res!855799) (not e!735737))))

(declare-datatypes ((array!85346 0))(
  ( (array!85347 (arr!41174 (Array (_ BitVec 32) (_ BitVec 64))) (size!41724 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85346)

(declare-datatypes ((List!29188 0))(
  ( (Nil!29185) (Cons!29184 (h!30393 (_ BitVec 64)) (t!42752 List!29188)) )
))
(declare-fun arrayNoDuplicates!0 (array!85346 (_ BitVec 32) List!29188) Bool)

(assert (=> b!1288481 (= res!855799 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29185))))

(declare-fun b!1288483 () Bool)

(declare-fun e!735736 () Bool)

(declare-fun tp_is_empty!34151 () Bool)

(assert (=> b!1288483 (= e!735736 tp_is_empty!34151)))

(declare-fun b!1288484 () Bool)

(declare-fun res!855800 () Bool)

(assert (=> b!1288484 (=> (not res!855800) (not e!735737))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288484 (= res!855800 (not (validKeyInArray!0 (select (arr!41174 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52787 () Bool)

(declare-fun mapRes!52787 () Bool)

(assert (=> mapIsEmpty!52787 mapRes!52787))

(declare-fun b!1288485 () Bool)

(declare-fun res!855802 () Bool)

(assert (=> b!1288485 (=> (not res!855802) (not e!735737))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50637 0))(
  ( (V!50638 (val!17150 Int)) )
))
(declare-datatypes ((ValueCell!16177 0))(
  ( (ValueCellFull!16177 (v!19753 V!50637)) (EmptyCell!16177) )
))
(declare-datatypes ((array!85348 0))(
  ( (array!85349 (arr!41175 (Array (_ BitVec 32) ValueCell!16177)) (size!41725 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85348)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288485 (= res!855802 (and (= (size!41725 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41724 _keys!1741) (size!41725 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288486 () Bool)

(declare-fun res!855805 () Bool)

(assert (=> b!1288486 (=> (not res!855805) (not e!735737))))

(assert (=> b!1288486 (= res!855805 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41724 _keys!1741))))))

(declare-fun b!1288487 () Bool)

(declare-fun e!735735 () Bool)

(assert (=> b!1288487 (= e!735735 tp_is_empty!34151)))

(declare-fun b!1288488 () Bool)

(declare-fun e!735738 () Bool)

(assert (=> b!1288488 (= e!735737 (not e!735738))))

(declare-fun res!855807 () Bool)

(assert (=> b!1288488 (=> res!855807 e!735738)))

(assert (=> b!1288488 (= res!855807 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22014 0))(
  ( (tuple2!22015 (_1!11018 (_ BitVec 64)) (_2!11018 V!50637)) )
))
(declare-datatypes ((List!29189 0))(
  ( (Nil!29186) (Cons!29185 (h!30394 tuple2!22014) (t!42753 List!29189)) )
))
(declare-datatypes ((ListLongMap!19671 0))(
  ( (ListLongMap!19672 (toList!9851 List!29189)) )
))
(declare-fun contains!7969 (ListLongMap!19671 (_ BitVec 64)) Bool)

(assert (=> b!1288488 (not (contains!7969 (ListLongMap!19672 Nil!29186) k!1205))))

(declare-datatypes ((Unit!42622 0))(
  ( (Unit!42623) )
))
(declare-fun lt!578003 () Unit!42622)

(declare-fun emptyContainsNothing!40 ((_ BitVec 64)) Unit!42622)

(assert (=> b!1288488 (= lt!578003 (emptyContainsNothing!40 k!1205))))

(declare-fun b!1288489 () Bool)

(declare-fun res!855801 () Bool)

(assert (=> b!1288489 (=> (not res!855801) (not e!735737))))

(assert (=> b!1288489 (= res!855801 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41724 _keys!1741))))))

(declare-fun b!1288490 () Bool)

(declare-fun e!735739 () Bool)

(assert (=> b!1288490 (= e!735739 (and e!735736 mapRes!52787))))

(declare-fun condMapEmpty!52787 () Bool)

(declare-fun mapDefault!52787 () ValueCell!16177)

