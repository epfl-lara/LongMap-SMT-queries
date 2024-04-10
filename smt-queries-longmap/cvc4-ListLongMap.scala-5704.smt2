; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74012 () Bool)

(assert start!74012)

(declare-fun b_free!14927 () Bool)

(declare-fun b_next!14927 () Bool)

(assert (=> start!74012 (= b_free!14927 (not b_next!14927))))

(declare-fun tp!52284 () Bool)

(declare-fun b_and!24679 () Bool)

(assert (=> start!74012 (= tp!52284 b_and!24679)))

(declare-fun b!870339 () Bool)

(declare-fun res!591534 () Bool)

(declare-fun e!484645 () Bool)

(assert (=> b!870339 (=> (not res!591534) (not e!484645))))

(declare-datatypes ((array!50272 0))(
  ( (array!50273 (arr!24167 (Array (_ BitVec 32) (_ BitVec 64))) (size!24607 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50272)

(declare-datatypes ((List!17190 0))(
  ( (Nil!17187) (Cons!17186 (h!18317 (_ BitVec 64)) (t!24227 List!17190)) )
))
(declare-fun arrayNoDuplicates!0 (array!50272 (_ BitVec 32) List!17190) Bool)

(assert (=> b!870339 (= res!591534 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17187))))

(declare-fun b!870340 () Bool)

(declare-fun e!484640 () Bool)

(assert (=> b!870340 (= e!484645 e!484640)))

(declare-fun res!591535 () Bool)

(assert (=> b!870340 (=> (not res!591535) (not e!484640))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870340 (= res!591535 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27797 0))(
  ( (V!27798 (val!8579 Int)) )
))
(declare-datatypes ((ValueCell!8092 0))(
  ( (ValueCellFull!8092 (v!11004 V!27797)) (EmptyCell!8092) )
))
(declare-datatypes ((array!50274 0))(
  ( (array!50275 (arr!24168 (Array (_ BitVec 32) ValueCell!8092)) (size!24608 (_ BitVec 32))) )
))
(declare-fun lt!395103 () array!50274)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11398 0))(
  ( (tuple2!11399 (_1!5710 (_ BitVec 64)) (_2!5710 V!27797)) )
))
(declare-datatypes ((List!17191 0))(
  ( (Nil!17188) (Cons!17187 (h!18318 tuple2!11398) (t!24228 List!17191)) )
))
(declare-datatypes ((ListLongMap!10167 0))(
  ( (ListLongMap!10168 (toList!5099 List!17191)) )
))
(declare-fun lt!395101 () ListLongMap!10167)

(declare-fun minValue!654 () V!27797)

(declare-fun zeroValue!654 () V!27797)

(declare-fun getCurrentListMapNoExtraKeys!3068 (array!50272 array!50274 (_ BitVec 32) (_ BitVec 32) V!27797 V!27797 (_ BitVec 32) Int) ListLongMap!10167)

(assert (=> b!870340 (= lt!395101 (getCurrentListMapNoExtraKeys!3068 _keys!868 lt!395103 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27797)

(declare-fun _values!688 () array!50274)

(assert (=> b!870340 (= lt!395103 (array!50275 (store (arr!24168 _values!688) i!612 (ValueCellFull!8092 v!557)) (size!24608 _values!688)))))

(declare-fun lt!395102 () ListLongMap!10167)

(assert (=> b!870340 (= lt!395102 (getCurrentListMapNoExtraKeys!3068 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870341 () Bool)

(declare-fun e!484641 () Bool)

(declare-fun e!484643 () Bool)

(declare-fun mapRes!27194 () Bool)

(assert (=> b!870341 (= e!484641 (and e!484643 mapRes!27194))))

(declare-fun condMapEmpty!27194 () Bool)

(declare-fun mapDefault!27194 () ValueCell!8092)

