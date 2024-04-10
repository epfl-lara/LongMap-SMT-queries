; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72992 () Bool)

(assert start!72992)

(declare-fun b_free!13907 () Bool)

(declare-fun b_next!13907 () Bool)

(assert (=> start!72992 (= b_free!13907 (not b_next!13907))))

(declare-fun tp!49225 () Bool)

(declare-fun b_and!22993 () Bool)

(assert (=> start!72992 (= tp!49225 b_and!22993)))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37573 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26437 0))(
  ( (V!26438 (val!8069 Int)) )
))
(declare-datatypes ((tuple2!10548 0))(
  ( (tuple2!10549 (_1!5285 (_ BitVec 64)) (_2!5285 V!26437)) )
))
(declare-datatypes ((List!16406 0))(
  ( (Nil!16403) (Cons!16402 (h!17533 tuple2!10548) (t!22777 List!16406)) )
))
(declare-datatypes ((ListLongMap!9317 0))(
  ( (ListLongMap!9318 (toList!4674 List!16406)) )
))
(declare-fun call!37577 () ListLongMap!9317)

(declare-datatypes ((array!48296 0))(
  ( (array!48297 (arr!23179 (Array (_ BitVec 32) (_ BitVec 64))) (size!23619 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48296)

(declare-datatypes ((ValueCell!7582 0))(
  ( (ValueCellFull!7582 (v!10494 V!26437)) (EmptyCell!7582) )
))
(declare-datatypes ((array!48298 0))(
  ( (array!48299 (arr!23180 (Array (_ BitVec 32) ValueCell!7582)) (size!23620 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48298)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26437)

(declare-fun zeroValue!654 () V!26437)

(declare-fun getCurrentListMapNoExtraKeys!2658 (array!48296 array!48298 (_ BitVec 32) (_ BitVec 32) V!26437 V!26437 (_ BitVec 32) Int) ListLongMap!9317)

(assert (=> bm!37573 (= call!37577 (getCurrentListMapNoExtraKeys!2658 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848008 () Bool)

(declare-fun res!576151 () Bool)

(declare-fun e!473168 () Bool)

(assert (=> b!848008 (=> (not res!576151) (not e!473168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48296 (_ BitVec 32)) Bool)

(assert (=> b!848008 (= res!576151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848009 () Bool)

(declare-fun e!473169 () Bool)

(declare-fun e!473165 () Bool)

(declare-fun mapRes!25664 () Bool)

(assert (=> b!848009 (= e!473169 (and e!473165 mapRes!25664))))

(declare-fun condMapEmpty!25664 () Bool)

(declare-fun mapDefault!25664 () ValueCell!7582)

