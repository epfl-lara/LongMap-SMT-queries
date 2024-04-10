; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109034 () Bool)

(assert start!109034)

(declare-fun b_free!28523 () Bool)

(declare-fun b_next!28523 () Bool)

(assert (=> start!109034 (= b_free!28523 (not b_next!28523))))

(declare-fun tp!100688 () Bool)

(declare-fun b_and!46613 () Bool)

(assert (=> start!109034 (= tp!100688 b_and!46613)))

(declare-fun b!1288697 () Bool)

(declare-fun e!735843 () Bool)

(declare-fun e!735847 () Bool)

(assert (=> b!1288697 (= e!735843 (not e!735847))))

(declare-fun res!855967 () Bool)

(assert (=> b!1288697 (=> res!855967 e!735847)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288697 (= res!855967 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50653 0))(
  ( (V!50654 (val!17156 Int)) )
))
(declare-datatypes ((tuple2!22026 0))(
  ( (tuple2!22027 (_1!11024 (_ BitVec 64)) (_2!11024 V!50653)) )
))
(declare-datatypes ((List!29200 0))(
  ( (Nil!29197) (Cons!29196 (h!30405 tuple2!22026) (t!42764 List!29200)) )
))
(declare-datatypes ((ListLongMap!19683 0))(
  ( (ListLongMap!19684 (toList!9857 List!29200)) )
))
(declare-fun contains!7975 (ListLongMap!19683 (_ BitVec 64)) Bool)

(assert (=> b!1288697 (not (contains!7975 (ListLongMap!19684 Nil!29197) k!1205))))

(declare-datatypes ((Unit!42634 0))(
  ( (Unit!42635) )
))
(declare-fun lt!578055 () Unit!42634)

(declare-fun emptyContainsNothing!46 ((_ BitVec 64)) Unit!42634)

(assert (=> b!1288697 (= lt!578055 (emptyContainsNothing!46 k!1205))))

(declare-fun b!1288698 () Bool)

(declare-fun res!855968 () Bool)

(assert (=> b!1288698 (=> (not res!855968) (not e!735843))))

(declare-datatypes ((array!85370 0))(
  ( (array!85371 (arr!41186 (Array (_ BitVec 32) (_ BitVec 64))) (size!41736 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85370)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288698 (= res!855968 (not (validKeyInArray!0 (select (arr!41186 _keys!1741) from!2144))))))

(declare-fun b!1288699 () Bool)

(declare-fun res!855966 () Bool)

(assert (=> b!1288699 (=> (not res!855966) (not e!735843))))

(declare-fun minValue!1387 () V!50653)

(declare-fun zeroValue!1387 () V!50653)

(declare-datatypes ((ValueCell!16183 0))(
  ( (ValueCellFull!16183 (v!19759 V!50653)) (EmptyCell!16183) )
))
(declare-datatypes ((array!85372 0))(
  ( (array!85373 (arr!41187 (Array (_ BitVec 32) ValueCell!16183)) (size!41737 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85372)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4919 (array!85370 array!85372 (_ BitVec 32) (_ BitVec 32) V!50653 V!50653 (_ BitVec 32) Int) ListLongMap!19683)

(assert (=> b!1288699 (= res!855966 (contains!7975 (getCurrentListMap!4919 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1288700 () Bool)

(declare-fun e!735845 () Bool)

(declare-fun tp_is_empty!34163 () Bool)

(assert (=> b!1288700 (= e!735845 tp_is_empty!34163)))

(declare-fun b!1288701 () Bool)

(declare-fun e!735846 () Bool)

(assert (=> b!1288701 (= e!735846 tp_is_empty!34163)))

(declare-fun b!1288702 () Bool)

(declare-fun res!855961 () Bool)

(assert (=> b!1288702 (=> (not res!855961) (not e!735843))))

(declare-datatypes ((List!29201 0))(
  ( (Nil!29198) (Cons!29197 (h!30406 (_ BitVec 64)) (t!42765 List!29201)) )
))
(declare-fun arrayNoDuplicates!0 (array!85370 (_ BitVec 32) List!29201) Bool)

(assert (=> b!1288702 (= res!855961 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29198))))

(declare-fun b!1288703 () Bool)

(declare-fun res!855969 () Bool)

(assert (=> b!1288703 (=> (not res!855969) (not e!735843))))

(assert (=> b!1288703 (= res!855969 (and (= (size!41737 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41736 _keys!1741) (size!41737 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288704 () Bool)

(declare-fun e!735844 () Bool)

(declare-fun mapRes!52805 () Bool)

(assert (=> b!1288704 (= e!735844 (and e!735845 mapRes!52805))))

(declare-fun condMapEmpty!52805 () Bool)

(declare-fun mapDefault!52805 () ValueCell!16183)

