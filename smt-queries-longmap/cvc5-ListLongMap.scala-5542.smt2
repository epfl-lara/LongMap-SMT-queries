; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73036 () Bool)

(assert start!73036)

(declare-fun b_free!13951 () Bool)

(declare-fun b_next!13951 () Bool)

(assert (=> start!73036 (= b_free!13951 (not b_next!13951))))

(declare-fun tp!49356 () Bool)

(declare-fun b_and!23061 () Bool)

(assert (=> start!73036 (= tp!49356 b_and!23061)))

(declare-fun b!849003 () Bool)

(declare-fun res!576791 () Bool)

(declare-fun e!473678 () Bool)

(assert (=> b!849003 (=> (not res!576791) (not e!473678))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849003 (= res!576791 (validMask!0 mask!1196))))

(declare-datatypes ((V!26497 0))(
  ( (V!26498 (val!8091 Int)) )
))
(declare-datatypes ((ValueCell!7604 0))(
  ( (ValueCellFull!7604 (v!10516 V!26497)) (EmptyCell!7604) )
))
(declare-datatypes ((array!48380 0))(
  ( (array!48381 (arr!23221 (Array (_ BitVec 32) ValueCell!7604)) (size!23661 (_ BitVec 32))) )
))
(declare-fun lt!382162 () array!48380)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37705 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10588 0))(
  ( (tuple2!10589 (_1!5305 (_ BitVec 64)) (_2!5305 V!26497)) )
))
(declare-datatypes ((List!16440 0))(
  ( (Nil!16437) (Cons!16436 (h!17567 tuple2!10588) (t!22837 List!16440)) )
))
(declare-datatypes ((ListLongMap!9357 0))(
  ( (ListLongMap!9358 (toList!4694 List!16440)) )
))
(declare-fun call!37709 () ListLongMap!9357)

(declare-datatypes ((array!48382 0))(
  ( (array!48383 (arr!23222 (Array (_ BitVec 32) (_ BitVec 64))) (size!23662 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48382)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26497)

(declare-fun zeroValue!654 () V!26497)

(declare-fun getCurrentListMapNoExtraKeys!2676 (array!48382 array!48380 (_ BitVec 32) (_ BitVec 32) V!26497 V!26497 (_ BitVec 32) Int) ListLongMap!9357)

(assert (=> bm!37705 (= call!37709 (getCurrentListMapNoExtraKeys!2676 _keys!868 lt!382162 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849004 () Bool)

(declare-fun e!473676 () Bool)

(declare-fun tp_is_empty!16087 () Bool)

(assert (=> b!849004 (= e!473676 tp_is_empty!16087)))

(declare-fun bm!37706 () Bool)

(declare-fun call!37708 () ListLongMap!9357)

(declare-fun _values!688 () array!48380)

(assert (=> bm!37706 (= call!37708 (getCurrentListMapNoExtraKeys!2676 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849005 () Bool)

(declare-fun res!576789 () Bool)

(assert (=> b!849005 (=> (not res!576789) (not e!473678))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!849005 (= res!576789 (and (= (select (arr!23222 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849006 () Bool)

(declare-fun e!473673 () Bool)

(declare-fun mapRes!25730 () Bool)

(assert (=> b!849006 (= e!473673 (and e!473676 mapRes!25730))))

(declare-fun condMapEmpty!25730 () Bool)

(declare-fun mapDefault!25730 () ValueCell!7604)

