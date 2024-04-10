; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133558 () Bool)

(assert start!133558)

(declare-fun b_free!31975 () Bool)

(declare-fun b_next!31975 () Bool)

(assert (=> start!133558 (= b_free!31975 (not b_next!31975))))

(declare-fun tp!113049 () Bool)

(declare-fun b_and!51461 () Bool)

(assert (=> start!133558 (= tp!113049 b_and!51461)))

(declare-fun b!1561413 () Bool)

(declare-fun res!1067613 () Bool)

(declare-fun e!870137 () Bool)

(assert (=> b!1561413 (=> (not res!1067613) (not e!870137))))

(declare-datatypes ((array!104000 0))(
  ( (array!104001 (arr!50192 (Array (_ BitVec 32) (_ BitVec 64))) (size!50742 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104000)

(declare-datatypes ((List!36436 0))(
  ( (Nil!36433) (Cons!36432 (h!37878 (_ BitVec 64)) (t!51201 List!36436)) )
))
(declare-fun arrayNoDuplicates!0 (array!104000 (_ BitVec 32) List!36436) Bool)

(assert (=> b!1561413 (= res!1067613 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36433))))

(declare-fun b!1561414 () Bool)

(declare-fun res!1067610 () Bool)

(assert (=> b!1561414 (=> (not res!1067610) (not e!870137))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561414 (= res!1067610 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50742 _keys!637)) (bvslt from!782 (size!50742 _keys!637))))))

(declare-fun res!1067608 () Bool)

(assert (=> start!133558 (=> (not res!1067608) (not e!870137))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133558 (= res!1067608 (validMask!0 mask!947))))

(assert (=> start!133558 e!870137))

(assert (=> start!133558 tp!113049))

(declare-fun tp_is_empty!38641 () Bool)

(assert (=> start!133558 tp_is_empty!38641))

(assert (=> start!133558 true))

(declare-fun array_inv!39015 (array!104000) Bool)

(assert (=> start!133558 (array_inv!39015 _keys!637)))

(declare-datatypes ((V!59729 0))(
  ( (V!59730 (val!19404 Int)) )
))
(declare-datatypes ((ValueCell!18290 0))(
  ( (ValueCellFull!18290 (v!22156 V!59729)) (EmptyCell!18290) )
))
(declare-datatypes ((array!104002 0))(
  ( (array!104003 (arr!50193 (Array (_ BitVec 32) ValueCell!18290)) (size!50743 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104002)

(declare-fun e!870135 () Bool)

(declare-fun array_inv!39016 (array!104002) Bool)

(assert (=> start!133558 (and (array_inv!39016 _values!487) e!870135)))

(declare-fun b!1561415 () Bool)

(assert (=> b!1561415 (= e!870137 (not true))))

(declare-fun lt!671204 () V!59729)

(declare-datatypes ((tuple2!25068 0))(
  ( (tuple2!25069 (_1!12545 (_ BitVec 64)) (_2!12545 V!59729)) )
))
(declare-datatypes ((List!36437 0))(
  ( (Nil!36434) (Cons!36433 (h!37879 tuple2!25068) (t!51202 List!36437)) )
))
(declare-datatypes ((ListLongMap!22503 0))(
  ( (ListLongMap!22504 (toList!11267 List!36437)) )
))
(declare-fun lt!671205 () ListLongMap!22503)

(declare-fun contains!10257 (ListLongMap!22503 (_ BitVec 64)) Bool)

(declare-fun +!5037 (ListLongMap!22503 tuple2!25068) ListLongMap!22503)

(assert (=> b!1561415 (not (contains!10257 (+!5037 lt!671205 (tuple2!25069 (select (arr!50192 _keys!637) from!782) lt!671204)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51928 0))(
  ( (Unit!51929) )
))
(declare-fun lt!671203 () Unit!51928)

(declare-fun addStillNotContains!527 (ListLongMap!22503 (_ BitVec 64) V!59729 (_ BitVec 64)) Unit!51928)

(assert (=> b!1561415 (= lt!671203 (addStillNotContains!527 lt!671205 (select (arr!50192 _keys!637) from!782) lt!671204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26206 (ValueCell!18290 V!59729) V!59729)

(declare-fun dynLambda!3821 (Int (_ BitVec 64)) V!59729)

(assert (=> b!1561415 (= lt!671204 (get!26206 (select (arr!50193 _values!487) from!782) (dynLambda!3821 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59729)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59729)

(declare-fun getCurrentListMapNoExtraKeys!6651 (array!104000 array!104002 (_ BitVec 32) (_ BitVec 32) V!59729 V!59729 (_ BitVec 32) Int) ListLongMap!22503)

(assert (=> b!1561415 (= lt!671205 (getCurrentListMapNoExtraKeys!6651 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561416 () Bool)

(declare-fun res!1067611 () Bool)

(assert (=> b!1561416 (=> (not res!1067611) (not e!870137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561416 (= res!1067611 (validKeyInArray!0 (select (arr!50192 _keys!637) from!782)))))

(declare-fun b!1561417 () Bool)

(declare-fun e!870139 () Bool)

(declare-fun mapRes!59337 () Bool)

(assert (=> b!1561417 (= e!870135 (and e!870139 mapRes!59337))))

(declare-fun condMapEmpty!59337 () Bool)

(declare-fun mapDefault!59337 () ValueCell!18290)

