; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73052 () Bool)

(assert start!73052)

(declare-fun b_free!13967 () Bool)

(declare-fun b_next!13967 () Bool)

(assert (=> start!73052 (= b_free!13967 (not b_next!13967))))

(declare-fun tp!49405 () Bool)

(declare-fun b_and!23093 () Bool)

(assert (=> start!73052 (= tp!49405 b_and!23093)))

(declare-fun mapIsEmpty!25754 () Bool)

(declare-fun mapRes!25754 () Bool)

(assert (=> mapIsEmpty!25754 mapRes!25754))

(declare-fun b!849379 () Bool)

(declare-fun e!473867 () Bool)

(assert (=> b!849379 (= e!473867 true)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26517 0))(
  ( (V!26518 (val!8099 Int)) )
))
(declare-datatypes ((ValueCell!7612 0))(
  ( (ValueCellFull!7612 (v!10524 V!26517)) (EmptyCell!7612) )
))
(declare-datatypes ((array!48412 0))(
  ( (array!48413 (arr!23237 (Array (_ BitVec 32) ValueCell!7612)) (size!23677 (_ BitVec 32))) )
))
(declare-fun lt!382258 () array!48412)

(declare-datatypes ((array!48414 0))(
  ( (array!48415 (arr!23238 (Array (_ BitVec 32) (_ BitVec 64))) (size!23678 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48414)

(declare-fun minValue!654 () V!26517)

(declare-fun zeroValue!654 () V!26517)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10604 0))(
  ( (tuple2!10605 (_1!5313 (_ BitVec 64)) (_2!5313 V!26517)) )
))
(declare-datatypes ((List!16453 0))(
  ( (Nil!16450) (Cons!16449 (h!17580 tuple2!10604) (t!22866 List!16453)) )
))
(declare-datatypes ((ListLongMap!9373 0))(
  ( (ListLongMap!9374 (toList!4702 List!16453)) )
))
(declare-fun lt!382259 () ListLongMap!9373)

(declare-fun +!2107 (ListLongMap!9373 tuple2!10604) ListLongMap!9373)

(declare-fun getCurrentListMapNoExtraKeys!2684 (array!48414 array!48412 (_ BitVec 32) (_ BitVec 32) V!26517 V!26517 (_ BitVec 32) Int) ListLongMap!9373)

(declare-fun get!12230 (ValueCell!7612 V!26517) V!26517)

(declare-fun dynLambda!998 (Int (_ BitVec 64)) V!26517)

(assert (=> b!849379 (= lt!382259 (+!2107 (getCurrentListMapNoExtraKeys!2684 _keys!868 lt!382258 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10605 (select (arr!23238 _keys!868) from!1053) (get!12230 (select (arr!23237 lt!382258) from!1053) (dynLambda!998 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849380 () Bool)

(declare-fun res!577037 () Bool)

(declare-fun e!473865 () Bool)

(assert (=> b!849380 (=> (not res!577037) (not e!473865))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849380 (= res!577037 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23678 _keys!868))))))

(declare-fun b!849381 () Bool)

(declare-fun e!473870 () Bool)

(declare-fun call!37756 () ListLongMap!9373)

(declare-fun call!37757 () ListLongMap!9373)

(assert (=> b!849381 (= e!473870 (= call!37756 call!37757))))

(declare-fun b!849382 () Bool)

(declare-fun res!577034 () Bool)

(assert (=> b!849382 (=> (not res!577034) (not e!473865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48414 (_ BitVec 32)) Bool)

(assert (=> b!849382 (= res!577034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25754 () Bool)

(declare-fun tp!49404 () Bool)

(declare-fun e!473869 () Bool)

(assert (=> mapNonEmpty!25754 (= mapRes!25754 (and tp!49404 e!473869))))

(declare-fun mapValue!25754 () ValueCell!7612)

(declare-fun mapKey!25754 () (_ BitVec 32))

(declare-fun _values!688 () array!48412)

(declare-fun mapRest!25754 () (Array (_ BitVec 32) ValueCell!7612))

(assert (=> mapNonEmpty!25754 (= (arr!23237 _values!688) (store mapRest!25754 mapKey!25754 mapValue!25754))))

(declare-fun v!557 () V!26517)

(declare-fun b!849383 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!849383 (= e!473870 (= call!37756 (+!2107 call!37757 (tuple2!10605 k!854 v!557))))))

(declare-fun b!849384 () Bool)

(declare-fun e!473866 () Bool)

(declare-fun e!473868 () Bool)

(assert (=> b!849384 (= e!473866 (and e!473868 mapRes!25754))))

(declare-fun condMapEmpty!25754 () Bool)

(declare-fun mapDefault!25754 () ValueCell!7612)

