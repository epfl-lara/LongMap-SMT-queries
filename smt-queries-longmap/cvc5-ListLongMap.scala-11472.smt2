; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133630 () Bool)

(assert start!133630)

(declare-fun b_free!32047 () Bool)

(declare-fun b_next!32047 () Bool)

(assert (=> start!133630 (= b_free!32047 (not b_next!32047))))

(declare-fun tp!113265 () Bool)

(declare-fun b_and!51605 () Bool)

(assert (=> start!133630 (= tp!113265 b_and!51605)))

(declare-fun mapIsEmpty!59445 () Bool)

(declare-fun mapRes!59445 () Bool)

(assert (=> mapIsEmpty!59445 mapRes!59445))

(declare-fun b!1562466 () Bool)

(declare-fun e!870684 () Bool)

(assert (=> b!1562466 (= e!870684 (not true))))

(declare-fun lt!671677 () Bool)

(declare-datatypes ((V!59825 0))(
  ( (V!59826 (val!19440 Int)) )
))
(declare-datatypes ((tuple2!25114 0))(
  ( (tuple2!25115 (_1!12568 (_ BitVec 64)) (_2!12568 V!59825)) )
))
(declare-datatypes ((List!36486 0))(
  ( (Nil!36483) (Cons!36482 (h!37928 tuple2!25114) (t!51323 List!36486)) )
))
(declare-datatypes ((ListLongMap!22549 0))(
  ( (ListLongMap!22550 (toList!11290 List!36486)) )
))
(declare-fun lt!671675 () ListLongMap!22549)

(declare-fun contains!10280 (ListLongMap!22549 (_ BitVec 64)) Bool)

(assert (=> b!1562466 (= lt!671677 (contains!10280 lt!671675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562466 (not (contains!10280 lt!671675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671676 () ListLongMap!22549)

(declare-fun lt!671679 () V!59825)

(declare-datatypes ((array!104142 0))(
  ( (array!104143 (arr!50263 (Array (_ BitVec 32) (_ BitVec 64))) (size!50813 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104142)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5060 (ListLongMap!22549 tuple2!25114) ListLongMap!22549)

(assert (=> b!1562466 (= lt!671675 (+!5060 lt!671676 (tuple2!25115 (select (arr!50263 _keys!637) from!782) lt!671679)))))

(declare-datatypes ((Unit!51974 0))(
  ( (Unit!51975) )
))
(declare-fun lt!671678 () Unit!51974)

(declare-fun addStillNotContains!550 (ListLongMap!22549 (_ BitVec 64) V!59825 (_ BitVec 64)) Unit!51974)

(assert (=> b!1562466 (= lt!671678 (addStillNotContains!550 lt!671676 (select (arr!50263 _keys!637) from!782) lt!671679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18326 0))(
  ( (ValueCellFull!18326 (v!22192 V!59825)) (EmptyCell!18326) )
))
(declare-datatypes ((array!104144 0))(
  ( (array!104145 (arr!50264 (Array (_ BitVec 32) ValueCell!18326)) (size!50814 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104144)

(declare-fun get!26253 (ValueCell!18326 V!59825) V!59825)

(declare-fun dynLambda!3844 (Int (_ BitVec 64)) V!59825)

(assert (=> b!1562466 (= lt!671679 (get!26253 (select (arr!50264 _values!487) from!782) (dynLambda!3844 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59825)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59825)

(declare-fun getCurrentListMapNoExtraKeys!6674 (array!104142 array!104144 (_ BitVec 32) (_ BitVec 32) V!59825 V!59825 (_ BitVec 32) Int) ListLongMap!22549)

(assert (=> b!1562466 (= lt!671676 (getCurrentListMapNoExtraKeys!6674 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562467 () Bool)

(declare-fun e!870688 () Bool)

(declare-fun e!870686 () Bool)

(assert (=> b!1562467 (= e!870688 (and e!870686 mapRes!59445))))

(declare-fun condMapEmpty!59445 () Bool)

(declare-fun mapDefault!59445 () ValueCell!18326)

