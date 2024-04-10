; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73118 () Bool)

(assert start!73118)

(declare-fun b_free!14033 () Bool)

(declare-fun b_next!14033 () Bool)

(assert (=> start!73118 (= b_free!14033 (not b_next!14033))))

(declare-fun tp!49603 () Bool)

(declare-fun b_and!23225 () Bool)

(assert (=> start!73118 (= tp!49603 b_and!23225)))

(declare-fun b!850930 () Bool)

(declare-fun e!474660 () Bool)

(declare-datatypes ((V!26605 0))(
  ( (V!26606 (val!8132 Int)) )
))
(declare-datatypes ((tuple2!10666 0))(
  ( (tuple2!10667 (_1!5344 (_ BitVec 64)) (_2!5344 V!26605)) )
))
(declare-datatypes ((List!16507 0))(
  ( (Nil!16504) (Cons!16503 (h!17634 tuple2!10666) (t!22986 List!16507)) )
))
(declare-datatypes ((ListLongMap!9435 0))(
  ( (ListLongMap!9436 (toList!4733 List!16507)) )
))
(declare-fun call!37955 () ListLongMap!9435)

(declare-fun call!37954 () ListLongMap!9435)

(assert (=> b!850930 (= e!474660 (= call!37955 call!37954))))

(declare-fun b!850931 () Bool)

(declare-fun res!578026 () Bool)

(declare-fun e!474659 () Bool)

(assert (=> b!850931 (=> (not res!578026) (not e!474659))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48542 0))(
  ( (array!48543 (arr!23302 (Array (_ BitVec 32) (_ BitVec 64))) (size!23742 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48542)

(declare-datatypes ((ValueCell!7645 0))(
  ( (ValueCellFull!7645 (v!10557 V!26605)) (EmptyCell!7645) )
))
(declare-datatypes ((array!48544 0))(
  ( (array!48545 (arr!23303 (Array (_ BitVec 32) ValueCell!7645)) (size!23743 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48544)

(assert (=> b!850931 (= res!578026 (and (= (size!23743 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23742 _keys!868) (size!23743 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850932 () Bool)

(declare-fun e!474663 () Bool)

(assert (=> b!850932 (= e!474659 e!474663)))

(declare-fun res!578019 () Bool)

(assert (=> b!850932 (=> (not res!578019) (not e!474663))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850932 (= res!578019 (= from!1053 i!612))))

(declare-fun lt!383138 () array!48544)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!383143 () ListLongMap!9435)

(declare-fun minValue!654 () V!26605)

(declare-fun zeroValue!654 () V!26605)

(declare-fun getCurrentListMapNoExtraKeys!2715 (array!48542 array!48544 (_ BitVec 32) (_ BitVec 32) V!26605 V!26605 (_ BitVec 32) Int) ListLongMap!9435)

(assert (=> b!850932 (= lt!383143 (getCurrentListMapNoExtraKeys!2715 _keys!868 lt!383138 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26605)

(assert (=> b!850932 (= lt!383138 (array!48545 (store (arr!23303 _values!688) i!612 (ValueCellFull!7645 v!557)) (size!23743 _values!688)))))

(declare-fun lt!383135 () ListLongMap!9435)

(assert (=> b!850932 (= lt!383135 (getCurrentListMapNoExtraKeys!2715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25853 () Bool)

(declare-fun mapRes!25853 () Bool)

(assert (=> mapIsEmpty!25853 mapRes!25853))

(declare-fun b!850934 () Bool)

(declare-fun e!474664 () Bool)

(declare-fun tp_is_empty!16169 () Bool)

(assert (=> b!850934 (= e!474664 tp_is_empty!16169)))

(declare-fun b!850935 () Bool)

(declare-fun e!474657 () Bool)

(assert (=> b!850935 (= e!474657 tp_is_empty!16169)))

(declare-fun b!850936 () Bool)

(declare-fun res!578022 () Bool)

(assert (=> b!850936 (=> (not res!578022) (not e!474659))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850936 (= res!578022 (validKeyInArray!0 k!854))))

(declare-fun bm!37951 () Bool)

(assert (=> bm!37951 (= call!37955 (getCurrentListMapNoExtraKeys!2715 _keys!868 lt!383138 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850937 () Bool)

(declare-fun +!2133 (ListLongMap!9435 tuple2!10666) ListLongMap!9435)

(assert (=> b!850937 (= e!474660 (= call!37955 (+!2133 call!37954 (tuple2!10667 k!854 v!557))))))

(declare-fun b!850938 () Bool)

(declare-fun res!578023 () Bool)

(assert (=> b!850938 (=> (not res!578023) (not e!474659))))

(declare-datatypes ((List!16508 0))(
  ( (Nil!16505) (Cons!16504 (h!17635 (_ BitVec 64)) (t!22987 List!16508)) )
))
(declare-fun arrayNoDuplicates!0 (array!48542 (_ BitVec 32) List!16508) Bool)

(assert (=> b!850938 (= res!578023 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16505))))

(declare-fun b!850939 () Bool)

(declare-fun e!474662 () Bool)

(assert (=> b!850939 (= e!474663 (not e!474662))))

(declare-fun res!578020 () Bool)

(assert (=> b!850939 (=> res!578020 e!474662)))

(assert (=> b!850939 (= res!578020 (not (validKeyInArray!0 (select (arr!23302 _keys!868) from!1053))))))

(assert (=> b!850939 e!474660))

(declare-fun c!91720 () Bool)

(assert (=> b!850939 (= c!91720 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29057 0))(
  ( (Unit!29058) )
))
(declare-fun lt!383140 () Unit!29057)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!370 (array!48542 array!48544 (_ BitVec 32) (_ BitVec 32) V!26605 V!26605 (_ BitVec 32) (_ BitVec 64) V!26605 (_ BitVec 32) Int) Unit!29057)

(assert (=> b!850939 (= lt!383140 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!370 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37952 () Bool)

(assert (=> bm!37952 (= call!37954 (getCurrentListMapNoExtraKeys!2715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850940 () Bool)

(declare-fun res!578027 () Bool)

(assert (=> b!850940 (=> (not res!578027) (not e!474659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48542 (_ BitVec 32)) Bool)

(assert (=> b!850940 (= res!578027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850941 () Bool)

(declare-fun e!474661 () Bool)

(assert (=> b!850941 (= e!474661 (and e!474657 mapRes!25853))))

(declare-fun condMapEmpty!25853 () Bool)

(declare-fun mapDefault!25853 () ValueCell!7645)

