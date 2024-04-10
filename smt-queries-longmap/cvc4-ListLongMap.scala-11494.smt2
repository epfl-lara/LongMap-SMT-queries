; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133776 () Bool)

(assert start!133776)

(declare-fun b!1564214 () Bool)

(declare-fun res!1069372 () Bool)

(declare-fun e!871824 () Bool)

(assert (=> b!1564214 (=> (not res!1069372) (not e!871824))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104392 0))(
  ( (array!104393 (arr!50387 (Array (_ BitVec 32) (_ BitVec 64))) (size!50937 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104392)

(declare-datatypes ((V!60005 0))(
  ( (V!60006 (val!19508 Int)) )
))
(declare-datatypes ((ValueCell!18394 0))(
  ( (ValueCellFull!18394 (v!22260 V!60005)) (EmptyCell!18394) )
))
(declare-datatypes ((array!104394 0))(
  ( (array!104395 (arr!50388 (Array (_ BitVec 32) ValueCell!18394)) (size!50938 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104394)

(assert (=> b!1564214 (= res!1069372 (and (= (size!50938 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50937 _keys!637) (size!50938 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069371 () Bool)

(assert (=> start!133776 (=> (not res!1069371) (not e!871824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133776 (= res!1069371 (validMask!0 mask!947))))

(assert (=> start!133776 e!871824))

(assert (=> start!133776 true))

(declare-fun array_inv!39159 (array!104392) Bool)

(assert (=> start!133776 (array_inv!39159 _keys!637)))

(declare-fun e!871822 () Bool)

(declare-fun array_inv!39160 (array!104394) Bool)

(assert (=> start!133776 (and (array_inv!39160 _values!487) e!871822)))

(declare-fun b!1564215 () Bool)

(declare-fun e!871825 () Bool)

(declare-fun tp_is_empty!38849 () Bool)

(assert (=> b!1564215 (= e!871825 tp_is_empty!38849)))

(declare-fun b!1564216 () Bool)

(assert (=> b!1564216 (= e!871824 false)))

(declare-fun lt!672015 () Bool)

(declare-datatypes ((tuple2!25168 0))(
  ( (tuple2!25169 (_1!12595 (_ BitVec 64)) (_2!12595 V!60005)) )
))
(declare-datatypes ((List!36557 0))(
  ( (Nil!36554) (Cons!36553 (h!37999 tuple2!25168) (t!51404 List!36557)) )
))
(declare-datatypes ((ListLongMap!22603 0))(
  ( (ListLongMap!22604 (toList!11317 List!36557)) )
))
(declare-fun contains!10308 (ListLongMap!22603 (_ BitVec 64)) Bool)

(assert (=> b!1564216 (= lt!672015 (contains!10308 (ListLongMap!22604 Nil!36554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59652 () Bool)

(declare-fun mapRes!59652 () Bool)

(assert (=> mapIsEmpty!59652 mapRes!59652))

(declare-fun b!1564217 () Bool)

(declare-fun e!871821 () Bool)

(assert (=> b!1564217 (= e!871821 tp_is_empty!38849)))

(declare-fun b!1564218 () Bool)

(assert (=> b!1564218 (= e!871822 (and e!871825 mapRes!59652))))

(declare-fun condMapEmpty!59652 () Bool)

(declare-fun mapDefault!59652 () ValueCell!18394)

