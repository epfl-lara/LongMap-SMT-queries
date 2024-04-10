; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133598 () Bool)

(assert start!133598)

(declare-fun b_free!32015 () Bool)

(declare-fun b_next!32015 () Bool)

(assert (=> start!133598 (= b_free!32015 (not b_next!32015))))

(declare-fun tp!113169 () Bool)

(declare-fun b_and!51541 () Bool)

(assert (=> start!133598 (= tp!113169 b_and!51541)))

(declare-fun b!1562002 () Bool)

(declare-fun res!1067981 () Bool)

(declare-fun e!870445 () Bool)

(assert (=> b!1562002 (=> (not res!1067981) (not e!870445))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!104080 0))(
  ( (array!104081 (arr!50232 (Array (_ BitVec 32) (_ BitVec 64))) (size!50782 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104080)

(declare-datatypes ((V!59781 0))(
  ( (V!59782 (val!19424 Int)) )
))
(declare-datatypes ((ValueCell!18310 0))(
  ( (ValueCellFull!18310 (v!22176 V!59781)) (EmptyCell!18310) )
))
(declare-datatypes ((array!104082 0))(
  ( (array!104083 (arr!50233 (Array (_ BitVec 32) ValueCell!18310)) (size!50783 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104082)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562002 (= res!1067981 (and (= (size!50783 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50782 _keys!637) (size!50783 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562003 () Bool)

(assert (=> b!1562003 (= e!870445 (not true))))

(declare-fun lt!671435 () Bool)

(declare-datatypes ((tuple2!25094 0))(
  ( (tuple2!25095 (_1!12558 (_ BitVec 64)) (_2!12558 V!59781)) )
))
(declare-datatypes ((List!36466 0))(
  ( (Nil!36463) (Cons!36462 (h!37908 tuple2!25094) (t!51271 List!36466)) )
))
(declare-datatypes ((ListLongMap!22529 0))(
  ( (ListLongMap!22530 (toList!11280 List!36466)) )
))
(declare-fun lt!671438 () ListLongMap!22529)

(declare-fun contains!10270 (ListLongMap!22529 (_ BitVec 64)) Bool)

(assert (=> b!1562003 (= lt!671435 (contains!10270 lt!671438 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562003 (not (contains!10270 lt!671438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671439 () V!59781)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671437 () ListLongMap!22529)

(declare-fun +!5050 (ListLongMap!22529 tuple2!25094) ListLongMap!22529)

(assert (=> b!1562003 (= lt!671438 (+!5050 lt!671437 (tuple2!25095 (select (arr!50232 _keys!637) from!782) lt!671439)))))

(declare-datatypes ((Unit!51954 0))(
  ( (Unit!51955) )
))
(declare-fun lt!671436 () Unit!51954)

(declare-fun addStillNotContains!540 (ListLongMap!22529 (_ BitVec 64) V!59781 (_ BitVec 64)) Unit!51954)

(assert (=> b!1562003 (= lt!671436 (addStillNotContains!540 lt!671437 (select (arr!50232 _keys!637) from!782) lt!671439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26231 (ValueCell!18310 V!59781) V!59781)

(declare-fun dynLambda!3834 (Int (_ BitVec 64)) V!59781)

(assert (=> b!1562003 (= lt!671439 (get!26231 (select (arr!50233 _values!487) from!782) (dynLambda!3834 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59781)

(declare-fun minValue!453 () V!59781)

(declare-fun getCurrentListMapNoExtraKeys!6664 (array!104080 array!104082 (_ BitVec 32) (_ BitVec 32) V!59781 V!59781 (_ BitVec 32) Int) ListLongMap!22529)

(assert (=> b!1562003 (= lt!671437 (getCurrentListMapNoExtraKeys!6664 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562004 () Bool)

(declare-fun e!870446 () Bool)

(declare-fun e!870444 () Bool)

(declare-fun mapRes!59397 () Bool)

(assert (=> b!1562004 (= e!870446 (and e!870444 mapRes!59397))))

(declare-fun condMapEmpty!59397 () Bool)

(declare-fun mapDefault!59397 () ValueCell!18310)

