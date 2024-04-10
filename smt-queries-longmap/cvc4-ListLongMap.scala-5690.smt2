; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73928 () Bool)

(assert start!73928)

(declare-fun b_free!14843 () Bool)

(declare-fun b_next!14843 () Bool)

(assert (=> start!73928 (= b_free!14843 (not b_next!14843))))

(declare-fun tp!52033 () Bool)

(declare-fun b_and!24595 () Bool)

(assert (=> start!73928 (= tp!52033 b_and!24595)))

(declare-fun b!868827 () Bool)

(declare-fun res!590396 () Bool)

(declare-fun e!483887 () Bool)

(assert (=> b!868827 (=> (not res!590396) (not e!483887))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868827 (= res!590396 (validKeyInArray!0 k!854))))

(declare-fun b!868828 () Bool)

(declare-fun res!590394 () Bool)

(assert (=> b!868828 (=> (not res!590394) (not e!483887))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50108 0))(
  ( (array!50109 (arr!24085 (Array (_ BitVec 32) (_ BitVec 64))) (size!24525 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50108)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868828 (= res!590394 (and (= (select (arr!24085 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!868829 () Bool)

(declare-fun res!590399 () Bool)

(assert (=> b!868829 (=> (not res!590399) (not e!483887))))

(declare-datatypes ((List!17129 0))(
  ( (Nil!17126) (Cons!17125 (h!18256 (_ BitVec 64)) (t!24166 List!17129)) )
))
(declare-fun arrayNoDuplicates!0 (array!50108 (_ BitVec 32) List!17129) Bool)

(assert (=> b!868829 (= res!590399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17126))))

(declare-fun b!868830 () Bool)

(declare-fun res!590400 () Bool)

(assert (=> b!868830 (=> (not res!590400) (not e!483887))))

(assert (=> b!868830 (= res!590400 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24525 _keys!868))))))

(declare-fun b!868831 () Bool)

(declare-fun e!483886 () Bool)

(assert (=> b!868831 (= e!483886 (not true))))

(declare-datatypes ((V!27685 0))(
  ( (V!27686 (val!8537 Int)) )
))
(declare-fun v!557 () V!27685)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8050 0))(
  ( (ValueCellFull!8050 (v!10962 V!27685)) (EmptyCell!8050) )
))
(declare-datatypes ((array!50110 0))(
  ( (array!50111 (arr!24086 (Array (_ BitVec 32) ValueCell!8050)) (size!24526 (_ BitVec 32))) )
))
(declare-fun lt!394597 () array!50110)

(declare-fun _values!688 () array!50110)

(declare-fun minValue!654 () V!27685)

(declare-fun zeroValue!654 () V!27685)

(declare-datatypes ((tuple2!11334 0))(
  ( (tuple2!11335 (_1!5678 (_ BitVec 64)) (_2!5678 V!27685)) )
))
(declare-datatypes ((List!17130 0))(
  ( (Nil!17127) (Cons!17126 (h!18257 tuple2!11334) (t!24167 List!17130)) )
))
(declare-datatypes ((ListLongMap!10103 0))(
  ( (ListLongMap!10104 (toList!5067 List!17130)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3036 (array!50108 array!50110 (_ BitVec 32) (_ BitVec 32) V!27685 V!27685 (_ BitVec 32) Int) ListLongMap!10103)

(declare-fun +!2408 (ListLongMap!10103 tuple2!11334) ListLongMap!10103)

(assert (=> b!868831 (= (getCurrentListMapNoExtraKeys!3036 _keys!868 lt!394597 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2408 (getCurrentListMapNoExtraKeys!3036 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11335 k!854 v!557)))))

(declare-datatypes ((Unit!29814 0))(
  ( (Unit!29815) )
))
(declare-fun lt!394600 () Unit!29814)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!602 (array!50108 array!50110 (_ BitVec 32) (_ BitVec 32) V!27685 V!27685 (_ BitVec 32) (_ BitVec 64) V!27685 (_ BitVec 32) Int) Unit!29814)

(assert (=> b!868831 (= lt!394600 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!602 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868832 () Bool)

(declare-fun e!483884 () Bool)

(declare-fun tp_is_empty!16979 () Bool)

(assert (=> b!868832 (= e!483884 tp_is_empty!16979)))

(declare-fun b!868833 () Bool)

(declare-fun res!590401 () Bool)

(assert (=> b!868833 (=> (not res!590401) (not e!483887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50108 (_ BitVec 32)) Bool)

(assert (=> b!868833 (= res!590401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868834 () Bool)

(declare-fun e!483888 () Bool)

(declare-fun mapRes!27068 () Bool)

(assert (=> b!868834 (= e!483888 (and e!483884 mapRes!27068))))

(declare-fun condMapEmpty!27068 () Bool)

(declare-fun mapDefault!27068 () ValueCell!8050)

