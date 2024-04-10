; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73190 () Bool)

(assert start!73190)

(declare-fun b_free!14105 () Bool)

(declare-fun b_next!14105 () Bool)

(assert (=> start!73190 (= b_free!14105 (not b_next!14105))))

(declare-fun tp!49819 () Bool)

(declare-fun b_and!23369 () Bool)

(assert (=> start!73190 (= tp!49819 b_and!23369)))

(declare-fun b!852622 () Bool)

(declare-fun res!579104 () Bool)

(declare-fun e!475522 () Bool)

(assert (=> b!852622 (=> (not res!579104) (not e!475522))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48680 0))(
  ( (array!48681 (arr!23371 (Array (_ BitVec 32) (_ BitVec 64))) (size!23811 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48680)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!852622 (= res!579104 (and (= (select (arr!23371 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!852623 () Bool)

(declare-fun res!579099 () Bool)

(assert (=> b!852623 (=> (not res!579099) (not e!475522))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26701 0))(
  ( (V!26702 (val!8168 Int)) )
))
(declare-datatypes ((ValueCell!7681 0))(
  ( (ValueCellFull!7681 (v!10593 V!26701)) (EmptyCell!7681) )
))
(declare-datatypes ((array!48682 0))(
  ( (array!48683 (arr!23372 (Array (_ BitVec 32) ValueCell!7681)) (size!23812 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48682)

(assert (=> b!852623 (= res!579099 (and (= (size!23812 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23811 _keys!868) (size!23812 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852624 () Bool)

(declare-fun res!579106 () Bool)

(assert (=> b!852624 (=> (not res!579106) (not e!475522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48680 (_ BitVec 32)) Bool)

(assert (=> b!852624 (= res!579106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384217 () array!48682)

(declare-fun bm!38167 () Bool)

(declare-datatypes ((tuple2!10728 0))(
  ( (tuple2!10729 (_1!5375 (_ BitVec 64)) (_2!5375 V!26701)) )
))
(declare-datatypes ((List!16560 0))(
  ( (Nil!16557) (Cons!16556 (h!17687 tuple2!10728) (t!23111 List!16560)) )
))
(declare-datatypes ((ListLongMap!9497 0))(
  ( (ListLongMap!9498 (toList!4764 List!16560)) )
))
(declare-fun call!38171 () ListLongMap!9497)

(declare-fun minValue!654 () V!26701)

(declare-fun zeroValue!654 () V!26701)

(declare-fun getCurrentListMapNoExtraKeys!2746 (array!48680 array!48682 (_ BitVec 32) (_ BitVec 32) V!26701 V!26701 (_ BitVec 32) Int) ListLongMap!9497)

(assert (=> bm!38167 (= call!38171 (getCurrentListMapNoExtraKeys!2746 _keys!868 lt!384217 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852625 () Bool)

(declare-fun e!475524 () Bool)

(declare-fun e!475525 () Bool)

(declare-fun mapRes!25961 () Bool)

(assert (=> b!852625 (= e!475524 (and e!475525 mapRes!25961))))

(declare-fun condMapEmpty!25961 () Bool)

(declare-fun mapDefault!25961 () ValueCell!7681)

