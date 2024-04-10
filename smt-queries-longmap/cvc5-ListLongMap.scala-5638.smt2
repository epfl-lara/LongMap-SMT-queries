; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73612 () Bool)

(assert start!73612)

(declare-fun b_free!14527 () Bool)

(declare-fun b_next!14527 () Bool)

(assert (=> start!73612 (= b_free!14527 (not b_next!14527))))

(declare-fun tp!51085 () Bool)

(declare-fun b_and!24033 () Bool)

(assert (=> start!73612 (= tp!51085 b_and!24033)))

(declare-fun b!861468 () Bool)

(declare-fun res!585443 () Bool)

(declare-fun e!479985 () Bool)

(assert (=> b!861468 (=> (not res!585443) (not e!479985))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27265 0))(
  ( (V!27266 (val!8379 Int)) )
))
(declare-datatypes ((ValueCell!7892 0))(
  ( (ValueCellFull!7892 (v!10804 V!27265)) (EmptyCell!7892) )
))
(declare-datatypes ((array!49492 0))(
  ( (array!49493 (arr!23777 (Array (_ BitVec 32) ValueCell!7892)) (size!24217 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49492)

(declare-datatypes ((array!49494 0))(
  ( (array!49495 (arr!23778 (Array (_ BitVec 32) (_ BitVec 64))) (size!24218 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49494)

(assert (=> b!861468 (= res!585443 (and (= (size!24217 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24218 _keys!868) (size!24217 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861469 () Bool)

(declare-fun e!479983 () Bool)

(assert (=> b!861469 (= e!479985 e!479983)))

(declare-fun res!585445 () Bool)

(assert (=> b!861469 (=> (not res!585445) (not e!479983))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861469 (= res!585445 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27265)

(declare-datatypes ((tuple2!11074 0))(
  ( (tuple2!11075 (_1!5548 (_ BitVec 64)) (_2!5548 V!27265)) )
))
(declare-datatypes ((List!16884 0))(
  ( (Nil!16881) (Cons!16880 (h!18011 tuple2!11074) (t!23677 List!16884)) )
))
(declare-datatypes ((ListLongMap!9843 0))(
  ( (ListLongMap!9844 (toList!4937 List!16884)) )
))
(declare-fun lt!388521 () ListLongMap!9843)

(declare-fun zeroValue!654 () V!27265)

(declare-fun lt!388512 () array!49492)

(declare-fun getCurrentListMapNoExtraKeys!2914 (array!49494 array!49492 (_ BitVec 32) (_ BitVec 32) V!27265 V!27265 (_ BitVec 32) Int) ListLongMap!9843)

(assert (=> b!861469 (= lt!388521 (getCurrentListMapNoExtraKeys!2914 _keys!868 lt!388512 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27265)

(assert (=> b!861469 (= lt!388512 (array!49493 (store (arr!23777 _values!688) i!612 (ValueCellFull!7892 v!557)) (size!24217 _values!688)))))

(declare-fun lt!388519 () ListLongMap!9843)

(assert (=> b!861469 (= lt!388519 (getCurrentListMapNoExtraKeys!2914 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861470 () Bool)

(declare-fun res!585446 () Bool)

(assert (=> b!861470 (=> (not res!585446) (not e!479985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49494 (_ BitVec 32)) Bool)

(assert (=> b!861470 (= res!585446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861471 () Bool)

(declare-fun e!479982 () Bool)

(declare-fun e!479984 () Bool)

(declare-fun mapRes!26594 () Bool)

(assert (=> b!861471 (= e!479982 (and e!479984 mapRes!26594))))

(declare-fun condMapEmpty!26594 () Bool)

(declare-fun mapDefault!26594 () ValueCell!7892)

