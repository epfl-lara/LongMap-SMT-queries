; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133444 () Bool)

(assert start!133444)

(declare-fun b!1560060 () Bool)

(declare-fun res!1066800 () Bool)

(declare-fun e!869282 () Bool)

(assert (=> b!1560060 (=> (not res!1066800) (not e!869282))))

(declare-datatypes ((array!103778 0))(
  ( (array!103779 (arr!50081 (Array (_ BitVec 32) (_ BitVec 64))) (size!50631 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103778)

(declare-datatypes ((List!36377 0))(
  ( (Nil!36374) (Cons!36373 (h!37819 (_ BitVec 64)) (t!51110 List!36377)) )
))
(declare-fun arrayNoDuplicates!0 (array!103778 (_ BitVec 32) List!36377) Bool)

(assert (=> b!1560060 (= res!1066800 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36374))))

(declare-fun b!1560061 () Bool)

(declare-fun res!1066801 () Bool)

(assert (=> b!1560061 (=> (not res!1066801) (not e!869282))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59577 0))(
  ( (V!59578 (val!19347 Int)) )
))
(declare-datatypes ((ValueCell!18233 0))(
  ( (ValueCellFull!18233 (v!22099 V!59577)) (EmptyCell!18233) )
))
(declare-datatypes ((array!103780 0))(
  ( (array!103781 (arr!50082 (Array (_ BitVec 32) ValueCell!18233)) (size!50632 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103780)

(assert (=> b!1560061 (= res!1066801 (and (= (size!50632 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50631 _keys!637) (size!50632 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560062 () Bool)

(declare-fun res!1066802 () Bool)

(assert (=> b!1560062 (=> (not res!1066802) (not e!869282))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560062 (= res!1066802 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50631 _keys!637)) (bvsge from!782 (size!50631 _keys!637))))))

(declare-fun b!1560063 () Bool)

(declare-fun res!1066798 () Bool)

(assert (=> b!1560063 (=> (not res!1066798) (not e!869282))))

(declare-datatypes ((tuple2!25024 0))(
  ( (tuple2!25025 (_1!12523 (_ BitVec 64)) (_2!12523 V!59577)) )
))
(declare-datatypes ((List!36378 0))(
  ( (Nil!36375) (Cons!36374 (h!37820 tuple2!25024) (t!51111 List!36378)) )
))
(declare-datatypes ((ListLongMap!22459 0))(
  ( (ListLongMap!22460 (toList!11245 List!36378)) )
))
(declare-fun contains!10235 (ListLongMap!22459 (_ BitVec 64)) Bool)

(assert (=> b!1560063 (= res!1066798 (not (contains!10235 (ListLongMap!22460 Nil!36375) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1560064 () Bool)

(declare-fun e!869281 () Bool)

(declare-fun tp_is_empty!38527 () Bool)

(assert (=> b!1560064 (= e!869281 tp_is_empty!38527)))

(declare-fun mapIsEmpty!59166 () Bool)

(declare-fun mapRes!59166 () Bool)

(assert (=> mapIsEmpty!59166 mapRes!59166))

(declare-fun mapNonEmpty!59166 () Bool)

(declare-fun tp!112821 () Bool)

(assert (=> mapNonEmpty!59166 (= mapRes!59166 (and tp!112821 e!869281))))

(declare-fun mapRest!59166 () (Array (_ BitVec 32) ValueCell!18233))

(declare-fun mapKey!59166 () (_ BitVec 32))

(declare-fun mapValue!59166 () ValueCell!18233)

(assert (=> mapNonEmpty!59166 (= (arr!50082 _values!487) (store mapRest!59166 mapKey!59166 mapValue!59166))))

(declare-fun b!1560066 () Bool)

(declare-fun e!869284 () Bool)

(assert (=> b!1560066 (= e!869284 tp_is_empty!38527)))

(declare-fun b!1560067 () Bool)

(declare-fun res!1066799 () Bool)

(assert (=> b!1560067 (=> (not res!1066799) (not e!869282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103778 (_ BitVec 32)) Bool)

(assert (=> b!1560067 (= res!1066799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560068 () Bool)

(assert (=> b!1560068 (= e!869282 false)))

(declare-fun lt!670947 () Bool)

(assert (=> b!1560068 (= lt!670947 (contains!10235 (ListLongMap!22460 Nil!36375) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560065 () Bool)

(declare-fun e!869283 () Bool)

(assert (=> b!1560065 (= e!869283 (and e!869284 mapRes!59166))))

(declare-fun condMapEmpty!59166 () Bool)

(declare-fun mapDefault!59166 () ValueCell!18233)

