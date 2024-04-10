; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72554 () Bool)

(assert start!72554)

(declare-fun b_free!13739 () Bool)

(declare-fun b_next!13739 () Bool)

(assert (=> start!72554 (= b_free!13739 (not b_next!13739))))

(declare-fun tp!48315 () Bool)

(declare-fun b_and!22825 () Bool)

(assert (=> start!72554 (= tp!48315 b_and!22825)))

(declare-fun b!842222 () Bool)

(declare-fun res!572465 () Bool)

(declare-fun e!469768 () Bool)

(assert (=> b!842222 (=> (not res!572465) (not e!469768))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842222 (= res!572465 (validMask!0 mask!1196))))

(declare-fun b!842223 () Bool)

(declare-fun res!572463 () Bool)

(assert (=> b!842223 (=> (not res!572463) (not e!469768))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47484 0))(
  ( (array!47485 (arr!22773 (Array (_ BitVec 32) (_ BitVec 64))) (size!23213 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47484)

(assert (=> b!842223 (= res!572463 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23213 _keys!868))))))

(declare-datatypes ((V!25853 0))(
  ( (V!25854 (val!7850 Int)) )
))
(declare-datatypes ((tuple2!10426 0))(
  ( (tuple2!10427 (_1!5224 (_ BitVec 64)) (_2!5224 V!25853)) )
))
(declare-datatypes ((List!16203 0))(
  ( (Nil!16200) (Cons!16199 (h!17330 tuple2!10426) (t!22574 List!16203)) )
))
(declare-datatypes ((ListLongMap!9195 0))(
  ( (ListLongMap!9196 (toList!4613 List!16203)) )
))
(declare-fun call!37451 () ListLongMap!9195)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7363 0))(
  ( (ValueCellFull!7363 (v!10275 V!25853)) (EmptyCell!7363) )
))
(declare-datatypes ((array!47486 0))(
  ( (array!47487 (arr!22774 (Array (_ BitVec 32) ValueCell!7363)) (size!23214 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47486)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25853)

(declare-fun zeroValue!654 () V!25853)

(declare-fun bm!37447 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2598 (array!47484 array!47486 (_ BitVec 32) (_ BitVec 32) V!25853 V!25853 (_ BitVec 32) Int) ListLongMap!9195)

(assert (=> bm!37447 (= call!37451 (getCurrentListMapNoExtraKeys!2598 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842224 () Bool)

(declare-fun res!572461 () Bool)

(assert (=> b!842224 (=> (not res!572461) (not e!469768))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842224 (= res!572461 (validKeyInArray!0 k!854))))

(declare-fun b!842225 () Bool)

(assert (=> b!842225 (= e!469768 (not true))))

(declare-fun e!469767 () Bool)

(assert (=> b!842225 e!469767))

(declare-fun c!91468 () Bool)

(assert (=> b!842225 (= c!91468 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25853)

(declare-datatypes ((Unit!28927 0))(
  ( (Unit!28928) )
))
(declare-fun lt!380974 () Unit!28927)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!309 (array!47484 array!47486 (_ BitVec 32) (_ BitVec 32) V!25853 V!25853 (_ BitVec 32) (_ BitVec 64) V!25853 (_ BitVec 32) Int) Unit!28927)

(assert (=> b!842225 (= lt!380974 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!309 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842226 () Bool)

(declare-fun res!572458 () Bool)

(assert (=> b!842226 (=> (not res!572458) (not e!469768))))

(assert (=> b!842226 (= res!572458 (and (= (select (arr!22773 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23213 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842227 () Bool)

(declare-fun e!469766 () Bool)

(declare-fun tp_is_empty!15605 () Bool)

(assert (=> b!842227 (= e!469766 tp_is_empty!15605)))

(declare-fun b!842229 () Bool)

(declare-fun e!469765 () Bool)

(declare-fun mapRes!25007 () Bool)

(assert (=> b!842229 (= e!469765 (and e!469766 mapRes!25007))))

(declare-fun condMapEmpty!25007 () Bool)

(declare-fun mapDefault!25007 () ValueCell!7363)

