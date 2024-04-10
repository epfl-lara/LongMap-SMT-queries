; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73100 () Bool)

(assert start!73100)

(declare-fun b_free!14015 () Bool)

(declare-fun b_next!14015 () Bool)

(assert (=> start!73100 (= b_free!14015 (not b_next!14015))))

(declare-fun tp!49548 () Bool)

(declare-fun b_and!23189 () Bool)

(assert (=> start!73100 (= tp!49548 b_and!23189)))

(declare-fun mapNonEmpty!25826 () Bool)

(declare-fun mapRes!25826 () Bool)

(declare-fun tp!49549 () Bool)

(declare-fun e!474442 () Bool)

(assert (=> mapNonEmpty!25826 (= mapRes!25826 (and tp!49549 e!474442))))

(declare-fun mapKey!25826 () (_ BitVec 32))

(declare-datatypes ((V!26581 0))(
  ( (V!26582 (val!8123 Int)) )
))
(declare-datatypes ((ValueCell!7636 0))(
  ( (ValueCellFull!7636 (v!10548 V!26581)) (EmptyCell!7636) )
))
(declare-fun mapRest!25826 () (Array (_ BitVec 32) ValueCell!7636))

(declare-fun mapValue!25826 () ValueCell!7636)

(declare-datatypes ((array!48506 0))(
  ( (array!48507 (arr!23284 (Array (_ BitVec 32) ValueCell!7636)) (size!23724 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48506)

(assert (=> mapNonEmpty!25826 (= (arr!23284 _values!688) (store mapRest!25826 mapKey!25826 mapValue!25826))))

(declare-fun b!850507 () Bool)

(declare-fun e!474446 () Bool)

(declare-datatypes ((tuple2!10648 0))(
  ( (tuple2!10649 (_1!5335 (_ BitVec 64)) (_2!5335 V!26581)) )
))
(declare-datatypes ((List!16492 0))(
  ( (Nil!16489) (Cons!16488 (h!17619 tuple2!10648) (t!22953 List!16492)) )
))
(declare-datatypes ((ListLongMap!9417 0))(
  ( (ListLongMap!9418 (toList!4724 List!16492)) )
))
(declare-fun call!37900 () ListLongMap!9417)

(declare-fun call!37901 () ListLongMap!9417)

(assert (=> b!850507 (= e!474446 (= call!37900 call!37901))))

(declare-fun b!850508 () Bool)

(declare-fun res!577749 () Bool)

(declare-fun e!474448 () Bool)

(assert (=> b!850508 (=> (not res!577749) (not e!474448))))

(declare-datatypes ((array!48508 0))(
  ( (array!48509 (arr!23285 (Array (_ BitVec 32) (_ BitVec 64))) (size!23725 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48508)

(declare-datatypes ((List!16493 0))(
  ( (Nil!16490) (Cons!16489 (h!17620 (_ BitVec 64)) (t!22954 List!16493)) )
))
(declare-fun arrayNoDuplicates!0 (array!48508 (_ BitVec 32) List!16493) Bool)

(assert (=> b!850508 (= res!577749 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16490))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26581)

(declare-fun zeroValue!654 () V!26581)

(declare-fun bm!37897 () Bool)

(declare-fun lt!382870 () array!48506)

(declare-fun getCurrentListMapNoExtraKeys!2706 (array!48508 array!48506 (_ BitVec 32) (_ BitVec 32) V!26581 V!26581 (_ BitVec 32) Int) ListLongMap!9417)

(assert (=> bm!37897 (= call!37900 (getCurrentListMapNoExtraKeys!2706 _keys!868 lt!382870 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850509 () Bool)

(declare-fun tp_is_empty!16151 () Bool)

(assert (=> b!850509 (= e!474442 tp_is_empty!16151)))

(declare-fun b!850510 () Bool)

(declare-fun e!474447 () Bool)

(assert (=> b!850510 (= e!474447 tp_is_empty!16151)))

(declare-fun b!850511 () Bool)

(declare-fun res!577750 () Bool)

(assert (=> b!850511 (=> (not res!577750) (not e!474448))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850511 (= res!577750 (validKeyInArray!0 k!854))))

(declare-fun b!850512 () Bool)

(declare-fun res!577757 () Bool)

(assert (=> b!850512 (=> (not res!577757) (not e!474448))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850512 (= res!577757 (and (= (select (arr!23285 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850513 () Bool)

(declare-fun e!474444 () Bool)

(assert (=> b!850513 (= e!474444 (and e!474447 mapRes!25826))))

(declare-fun condMapEmpty!25826 () Bool)

(declare-fun mapDefault!25826 () ValueCell!7636)

