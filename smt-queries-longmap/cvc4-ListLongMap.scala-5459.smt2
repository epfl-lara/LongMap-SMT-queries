; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72542 () Bool)

(assert start!72542)

(declare-fun b_free!13727 () Bool)

(declare-fun b_next!13727 () Bool)

(assert (=> start!72542 (= b_free!13727 (not b_next!13727))))

(declare-fun tp!48279 () Bool)

(declare-fun b_and!22813 () Bool)

(assert (=> start!72542 (= tp!48279 b_and!22813)))

(declare-fun mapNonEmpty!24989 () Bool)

(declare-fun mapRes!24989 () Bool)

(declare-fun tp!48280 () Bool)

(declare-fun e!469658 () Bool)

(assert (=> mapNonEmpty!24989 (= mapRes!24989 (and tp!48280 e!469658))))

(declare-fun mapKey!24989 () (_ BitVec 32))

(declare-datatypes ((V!25837 0))(
  ( (V!25838 (val!7844 Int)) )
))
(declare-datatypes ((ValueCell!7357 0))(
  ( (ValueCellFull!7357 (v!10269 V!25837)) (EmptyCell!7357) )
))
(declare-fun mapValue!24989 () ValueCell!7357)

(declare-fun mapRest!24989 () (Array (_ BitVec 32) ValueCell!7357))

(declare-datatypes ((array!47460 0))(
  ( (array!47461 (arr!22761 (Array (_ BitVec 32) ValueCell!7357)) (size!23201 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47460)

(assert (=> mapNonEmpty!24989 (= (arr!22761 _values!688) (store mapRest!24989 mapKey!24989 mapValue!24989))))

(declare-fun b!841988 () Bool)

(declare-fun res!572319 () Bool)

(declare-fun e!469659 () Bool)

(assert (=> b!841988 (=> (not res!572319) (not e!469659))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841988 (= res!572319 (validMask!0 mask!1196))))

(declare-fun b!841989 () Bool)

(declare-fun res!572316 () Bool)

(assert (=> b!841989 (=> (not res!572316) (not e!469659))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47462 0))(
  ( (array!47463 (arr!22762 (Array (_ BitVec 32) (_ BitVec 64))) (size!23202 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47462)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841989 (= res!572316 (and (= (select (arr!22762 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23202 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841990 () Bool)

(declare-fun tp_is_empty!15593 () Bool)

(assert (=> b!841990 (= e!469658 tp_is_empty!15593)))

(declare-fun v!557 () V!25837)

(declare-fun b!841991 () Bool)

(declare-fun e!469660 () Bool)

(declare-datatypes ((tuple2!10414 0))(
  ( (tuple2!10415 (_1!5218 (_ BitVec 64)) (_2!5218 V!25837)) )
))
(declare-datatypes ((List!16192 0))(
  ( (Nil!16189) (Cons!16188 (h!17319 tuple2!10414) (t!22563 List!16192)) )
))
(declare-datatypes ((ListLongMap!9183 0))(
  ( (ListLongMap!9184 (toList!4607 List!16192)) )
))
(declare-fun call!37414 () ListLongMap!9183)

(declare-fun call!37415 () ListLongMap!9183)

(declare-fun +!2069 (ListLongMap!9183 tuple2!10414) ListLongMap!9183)

(assert (=> b!841991 (= e!469660 (= call!37415 (+!2069 call!37414 (tuple2!10415 k!854 v!557))))))

(declare-fun res!572315 () Bool)

(assert (=> start!72542 (=> (not res!572315) (not e!469659))))

(assert (=> start!72542 (= res!572315 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23202 _keys!868))))))

(assert (=> start!72542 e!469659))

(assert (=> start!72542 tp_is_empty!15593))

(assert (=> start!72542 true))

(assert (=> start!72542 tp!48279))

(declare-fun array_inv!18110 (array!47462) Bool)

(assert (=> start!72542 (array_inv!18110 _keys!868)))

(declare-fun e!469657 () Bool)

(declare-fun array_inv!18111 (array!47460) Bool)

(assert (=> start!72542 (and (array_inv!18111 _values!688) e!469657)))

(declare-fun mapIsEmpty!24989 () Bool)

(assert (=> mapIsEmpty!24989 mapRes!24989))

(declare-fun b!841992 () Bool)

(declare-fun res!572318 () Bool)

(assert (=> b!841992 (=> (not res!572318) (not e!469659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841992 (= res!572318 (validKeyInArray!0 k!854))))

(declare-fun b!841993 () Bool)

(declare-fun res!572317 () Bool)

(assert (=> b!841993 (=> (not res!572317) (not e!469659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47462 (_ BitVec 32)) Bool)

(assert (=> b!841993 (= res!572317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25837)

(declare-fun zeroValue!654 () V!25837)

(declare-fun bm!37411 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2592 (array!47462 array!47460 (_ BitVec 32) (_ BitVec 32) V!25837 V!25837 (_ BitVec 32) Int) ListLongMap!9183)

(assert (=> bm!37411 (= call!37414 (getCurrentListMapNoExtraKeys!2592 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37412 () Bool)

(assert (=> bm!37412 (= call!37415 (getCurrentListMapNoExtraKeys!2592 _keys!868 (array!47461 (store (arr!22761 _values!688) i!612 (ValueCellFull!7357 v!557)) (size!23201 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841994 () Bool)

(declare-fun res!572321 () Bool)

(assert (=> b!841994 (=> (not res!572321) (not e!469659))))

(declare-datatypes ((List!16193 0))(
  ( (Nil!16190) (Cons!16189 (h!17320 (_ BitVec 64)) (t!22564 List!16193)) )
))
(declare-fun arrayNoDuplicates!0 (array!47462 (_ BitVec 32) List!16193) Bool)

(assert (=> b!841994 (= res!572321 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16190))))

(declare-fun b!841995 () Bool)

(declare-fun res!572320 () Bool)

(assert (=> b!841995 (=> (not res!572320) (not e!469659))))

(assert (=> b!841995 (= res!572320 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23202 _keys!868))))))

(declare-fun b!841996 () Bool)

(assert (=> b!841996 (= e!469659 (not true))))

(assert (=> b!841996 e!469660))

(declare-fun c!91450 () Bool)

(assert (=> b!841996 (= c!91450 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28919 0))(
  ( (Unit!28920) )
))
(declare-fun lt!380956 () Unit!28919)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!305 (array!47462 array!47460 (_ BitVec 32) (_ BitVec 32) V!25837 V!25837 (_ BitVec 32) (_ BitVec 64) V!25837 (_ BitVec 32) Int) Unit!28919)

(assert (=> b!841996 (= lt!380956 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841997 () Bool)

(declare-fun e!469655 () Bool)

(assert (=> b!841997 (= e!469657 (and e!469655 mapRes!24989))))

(declare-fun condMapEmpty!24989 () Bool)

(declare-fun mapDefault!24989 () ValueCell!7357)

