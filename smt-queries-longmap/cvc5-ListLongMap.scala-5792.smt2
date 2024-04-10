; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74694 () Bool)

(assert start!74694)

(declare-fun b_free!15343 () Bool)

(declare-fun b_next!15343 () Bool)

(assert (=> start!74694 (= b_free!15343 (not b_next!15343))))

(declare-fun tp!53716 () Bool)

(declare-fun b_and!25305 () Bool)

(assert (=> start!74694 (= tp!53716 b_and!25305)))

(declare-fun b!880558 () Bool)

(declare-fun e!490022 () Bool)

(declare-fun e!490026 () Bool)

(assert (=> b!880558 (= e!490022 e!490026)))

(declare-fun res!598265 () Bool)

(assert (=> b!880558 (=> (not res!598265) (not e!490026))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880558 (= res!598265 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28497 0))(
  ( (V!28498 (val!8841 Int)) )
))
(declare-datatypes ((tuple2!11702 0))(
  ( (tuple2!11703 (_1!5862 (_ BitVec 64)) (_2!5862 V!28497)) )
))
(declare-datatypes ((List!17515 0))(
  ( (Nil!17512) (Cons!17511 (h!18642 tuple2!11702) (t!24660 List!17515)) )
))
(declare-datatypes ((ListLongMap!10471 0))(
  ( (ListLongMap!10472 (toList!5251 List!17515)) )
))
(declare-fun lt!398186 () ListLongMap!10471)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8354 0))(
  ( (ValueCellFull!8354 (v!11289 V!28497)) (EmptyCell!8354) )
))
(declare-datatypes ((array!51300 0))(
  ( (array!51301 (arr!24674 (Array (_ BitVec 32) ValueCell!8354)) (size!25114 (_ BitVec 32))) )
))
(declare-fun lt!398190 () array!51300)

(declare-datatypes ((array!51302 0))(
  ( (array!51303 (arr!24675 (Array (_ BitVec 32) (_ BitVec 64))) (size!25115 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51302)

(declare-fun minValue!654 () V!28497)

(declare-fun zeroValue!654 () V!28497)

(declare-fun getCurrentListMapNoExtraKeys!3214 (array!51302 array!51300 (_ BitVec 32) (_ BitVec 32) V!28497 V!28497 (_ BitVec 32) Int) ListLongMap!10471)

(assert (=> b!880558 (= lt!398186 (getCurrentListMapNoExtraKeys!3214 _keys!868 lt!398190 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28497)

(declare-fun _values!688 () array!51300)

(assert (=> b!880558 (= lt!398190 (array!51301 (store (arr!24674 _values!688) i!612 (ValueCellFull!8354 v!557)) (size!25114 _values!688)))))

(declare-fun lt!398189 () ListLongMap!10471)

(assert (=> b!880558 (= lt!398189 (getCurrentListMapNoExtraKeys!3214 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880559 () Bool)

(declare-fun e!490021 () Bool)

(declare-fun tp_is_empty!17587 () Bool)

(assert (=> b!880559 (= e!490021 tp_is_empty!17587)))

(declare-fun b!880560 () Bool)

(declare-fun e!490020 () Bool)

(declare-fun e!490024 () Bool)

(assert (=> b!880560 (= e!490020 e!490024)))

(declare-fun res!598267 () Bool)

(assert (=> b!880560 (=> res!598267 e!490024)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!880560 (= res!598267 (not (= (select (arr!24675 _keys!868) from!1053) k!854)))))

(declare-fun lt!398185 () ListLongMap!10471)

(declare-fun +!2523 (ListLongMap!10471 tuple2!11702) ListLongMap!10471)

(declare-fun get!12976 (ValueCell!8354 V!28497) V!28497)

(declare-fun dynLambda!1239 (Int (_ BitVec 64)) V!28497)

(assert (=> b!880560 (= lt!398186 (+!2523 lt!398185 (tuple2!11703 (select (arr!24675 _keys!868) from!1053) (get!12976 (select (arr!24674 _values!688) from!1053) (dynLambda!1239 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880561 () Bool)

(declare-fun e!490025 () Bool)

(assert (=> b!880561 (= e!490025 tp_is_empty!17587)))

(declare-fun b!880562 () Bool)

(declare-fun res!598266 () Bool)

(assert (=> b!880562 (=> (not res!598266) (not e!490022))))

(declare-datatypes ((List!17516 0))(
  ( (Nil!17513) (Cons!17512 (h!18643 (_ BitVec 64)) (t!24661 List!17516)) )
))
(declare-fun arrayNoDuplicates!0 (array!51302 (_ BitVec 32) List!17516) Bool)

(assert (=> b!880562 (= res!598266 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17513))))

(declare-fun b!880563 () Bool)

(declare-fun e!490023 () Bool)

(declare-fun mapRes!28002 () Bool)

(assert (=> b!880563 (= e!490023 (and e!490025 mapRes!28002))))

(declare-fun condMapEmpty!28002 () Bool)

(declare-fun mapDefault!28002 () ValueCell!8354)

