; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133556 () Bool)

(assert start!133556)

(declare-fun b_free!31973 () Bool)

(declare-fun b_next!31973 () Bool)

(assert (=> start!133556 (= b_free!31973 (not b_next!31973))))

(declare-fun tp!113043 () Bool)

(declare-fun b_and!51457 () Bool)

(assert (=> start!133556 (= tp!113043 b_and!51457)))

(declare-fun res!1067594 () Bool)

(declare-fun e!870123 () Bool)

(assert (=> start!133556 (=> (not res!1067594) (not e!870123))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133556 (= res!1067594 (validMask!0 mask!947))))

(assert (=> start!133556 e!870123))

(assert (=> start!133556 tp!113043))

(declare-fun tp_is_empty!38639 () Bool)

(assert (=> start!133556 tp_is_empty!38639))

(assert (=> start!133556 true))

(declare-datatypes ((array!103996 0))(
  ( (array!103997 (arr!50190 (Array (_ BitVec 32) (_ BitVec 64))) (size!50740 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103996)

(declare-fun array_inv!39013 (array!103996) Bool)

(assert (=> start!133556 (array_inv!39013 _keys!637)))

(declare-datatypes ((V!59725 0))(
  ( (V!59726 (val!19403 Int)) )
))
(declare-datatypes ((ValueCell!18289 0))(
  ( (ValueCellFull!18289 (v!22155 V!59725)) (EmptyCell!18289) )
))
(declare-datatypes ((array!103998 0))(
  ( (array!103999 (arr!50191 (Array (_ BitVec 32) ValueCell!18289)) (size!50741 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103998)

(declare-fun e!870120 () Bool)

(declare-fun array_inv!39014 (array!103998) Bool)

(assert (=> start!133556 (and (array_inv!39014 _values!487) e!870120)))

(declare-fun b!1561384 () Bool)

(declare-fun res!1067593 () Bool)

(assert (=> b!1561384 (=> (not res!1067593) (not e!870123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103996 (_ BitVec 32)) Bool)

(assert (=> b!1561384 (= res!1067593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561385 () Bool)

(declare-fun e!870122 () Bool)

(assert (=> b!1561385 (= e!870122 tp_is_empty!38639)))

(declare-fun mapIsEmpty!59334 () Bool)

(declare-fun mapRes!59334 () Bool)

(assert (=> mapIsEmpty!59334 mapRes!59334))

(declare-fun b!1561386 () Bool)

(assert (=> b!1561386 (= e!870123 (not true))))

(declare-fun lt!671194 () V!59725)

(declare-datatypes ((tuple2!25066 0))(
  ( (tuple2!25067 (_1!12544 (_ BitVec 64)) (_2!12544 V!59725)) )
))
(declare-datatypes ((List!36435 0))(
  ( (Nil!36432) (Cons!36431 (h!37877 tuple2!25066) (t!51198 List!36435)) )
))
(declare-datatypes ((ListLongMap!22501 0))(
  ( (ListLongMap!22502 (toList!11266 List!36435)) )
))
(declare-fun lt!671195 () ListLongMap!22501)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun contains!10256 (ListLongMap!22501 (_ BitVec 64)) Bool)

(declare-fun +!5036 (ListLongMap!22501 tuple2!25066) ListLongMap!22501)

(assert (=> b!1561386 (not (contains!10256 (+!5036 lt!671195 (tuple2!25067 (select (arr!50190 _keys!637) from!782) lt!671194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51926 0))(
  ( (Unit!51927) )
))
(declare-fun lt!671196 () Unit!51926)

(declare-fun addStillNotContains!526 (ListLongMap!22501 (_ BitVec 64) V!59725 (_ BitVec 64)) Unit!51926)

(assert (=> b!1561386 (= lt!671196 (addStillNotContains!526 lt!671195 (select (arr!50190 _keys!637) from!782) lt!671194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26203 (ValueCell!18289 V!59725) V!59725)

(declare-fun dynLambda!3820 (Int (_ BitVec 64)) V!59725)

(assert (=> b!1561386 (= lt!671194 (get!26203 (select (arr!50191 _values!487) from!782) (dynLambda!3820 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59725)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59725)

(declare-fun getCurrentListMapNoExtraKeys!6650 (array!103996 array!103998 (_ BitVec 32) (_ BitVec 32) V!59725 V!59725 (_ BitVec 32) Int) ListLongMap!22501)

(assert (=> b!1561386 (= lt!671195 (getCurrentListMapNoExtraKeys!6650 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561387 () Bool)

(assert (=> b!1561387 (= e!870120 (and e!870122 mapRes!59334))))

(declare-fun condMapEmpty!59334 () Bool)

(declare-fun mapDefault!59334 () ValueCell!18289)

