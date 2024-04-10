; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73228 () Bool)

(assert start!73228)

(declare-fun b_free!14143 () Bool)

(declare-fun b_next!14143 () Bool)

(assert (=> start!73228 (= b_free!14143 (not b_next!14143))))

(declare-fun tp!49932 () Bool)

(declare-fun b_and!23445 () Bool)

(assert (=> start!73228 (= tp!49932 b_and!23445)))

(declare-datatypes ((V!26753 0))(
  ( (V!26754 (val!8187 Int)) )
))
(declare-fun v!557 () V!26753)

(declare-datatypes ((tuple2!10764 0))(
  ( (tuple2!10765 (_1!5393 (_ BitVec 64)) (_2!5393 V!26753)) )
))
(declare-datatypes ((List!16589 0))(
  ( (Nil!16586) (Cons!16585 (h!17716 tuple2!10764) (t!23178 List!16589)) )
))
(declare-datatypes ((ListLongMap!9533 0))(
  ( (ListLongMap!9534 (toList!4782 List!16589)) )
))
(declare-fun call!38284 () ListLongMap!9533)

(declare-fun call!38285 () ListLongMap!9533)

(declare-fun e!475977 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!853515 () Bool)

(declare-fun +!2174 (ListLongMap!9533 tuple2!10764) ListLongMap!9533)

(assert (=> b!853515 (= e!475977 (= call!38284 (+!2174 call!38285 (tuple2!10765 k!854 v!557))))))

(declare-fun b!853516 () Bool)

(declare-fun e!475983 () Bool)

(assert (=> b!853516 (= e!475983 true)))

(declare-fun lt!384785 () V!26753)

(declare-fun lt!384789 () ListLongMap!9533)

(declare-fun lt!384792 () tuple2!10764)

(assert (=> b!853516 (= (+!2174 lt!384789 lt!384792) (+!2174 (+!2174 lt!384789 (tuple2!10765 k!854 lt!384785)) lt!384792))))

(declare-fun lt!384793 () V!26753)

(assert (=> b!853516 (= lt!384792 (tuple2!10765 k!854 lt!384793))))

(declare-datatypes ((Unit!29131 0))(
  ( (Unit!29132) )
))
(declare-fun lt!384790 () Unit!29131)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!301 (ListLongMap!9533 (_ BitVec 64) V!26753 V!26753) Unit!29131)

(assert (=> b!853516 (= lt!384790 (addSameAsAddTwiceSameKeyDiffValues!301 lt!384789 k!854 lt!384785 lt!384793))))

(declare-fun lt!384787 () V!26753)

(declare-datatypes ((ValueCell!7700 0))(
  ( (ValueCellFull!7700 (v!10612 V!26753)) (EmptyCell!7700) )
))
(declare-datatypes ((array!48756 0))(
  ( (array!48757 (arr!23409 (Array (_ BitVec 32) ValueCell!7700)) (size!23849 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48756)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12347 (ValueCell!7700 V!26753) V!26753)

(assert (=> b!853516 (= lt!384785 (get!12347 (select (arr!23409 _values!688) from!1053) lt!384787))))

(declare-fun lt!384786 () ListLongMap!9533)

(declare-datatypes ((array!48758 0))(
  ( (array!48759 (arr!23410 (Array (_ BitVec 32) (_ BitVec 64))) (size!23850 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48758)

(assert (=> b!853516 (= lt!384786 (+!2174 lt!384789 (tuple2!10765 (select (arr!23410 _keys!868) from!1053) lt!384793)))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853516 (= lt!384793 (get!12347 (select (store (arr!23409 _values!688) i!612 (ValueCellFull!7700 v!557)) from!1053) lt!384787))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1055 (Int (_ BitVec 64)) V!26753)

(assert (=> b!853516 (= lt!384787 (dynLambda!1055 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384791 () array!48756)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26753)

(declare-fun zeroValue!654 () V!26753)

(declare-fun getCurrentListMapNoExtraKeys!2763 (array!48758 array!48756 (_ BitVec 32) (_ BitVec 32) V!26753 V!26753 (_ BitVec 32) Int) ListLongMap!9533)

(assert (=> b!853516 (= lt!384789 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!384791 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853517 () Bool)

(declare-fun e!475982 () Bool)

(declare-fun e!475984 () Bool)

(declare-fun mapRes!26018 () Bool)

(assert (=> b!853517 (= e!475982 (and e!475984 mapRes!26018))))

(declare-fun condMapEmpty!26018 () Bool)

(declare-fun mapDefault!26018 () ValueCell!7700)

