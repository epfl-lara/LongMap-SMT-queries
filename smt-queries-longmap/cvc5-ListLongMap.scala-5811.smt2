; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74938 () Bool)

(assert start!74938)

(declare-fun b_free!15457 () Bool)

(declare-fun b_next!15457 () Bool)

(assert (=> start!74938 (= b_free!15457 (not b_next!15457))))

(declare-fun tp!54074 () Bool)

(declare-fun b_and!25613 () Bool)

(assert (=> start!74938 (= tp!54074 b_and!25613)))

(declare-fun b!883933 () Bool)

(declare-fun res!600506 () Bool)

(declare-fun e!491918 () Bool)

(assert (=> b!883933 (=> (not res!600506) (not e!491918))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51528 0))(
  ( (array!51529 (arr!24783 (Array (_ BitVec 32) (_ BitVec 64))) (size!25223 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51528)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883933 (= res!600506 (and (= (select (arr!24783 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883934 () Bool)

(declare-fun res!600510 () Bool)

(assert (=> b!883934 (=> (not res!600510) (not e!491918))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28649 0))(
  ( (V!28650 (val!8898 Int)) )
))
(declare-datatypes ((ValueCell!8411 0))(
  ( (ValueCellFull!8411 (v!11367 V!28649)) (EmptyCell!8411) )
))
(declare-datatypes ((array!51530 0))(
  ( (array!51531 (arr!24784 (Array (_ BitVec 32) ValueCell!8411)) (size!25224 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51530)

(assert (=> b!883934 (= res!600510 (and (= (size!25224 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25223 _keys!868) (size!25224 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883935 () Bool)

(declare-datatypes ((Unit!30173 0))(
  ( (Unit!30174) )
))
(declare-fun e!491922 () Unit!30173)

(declare-fun Unit!30175 () Unit!30173)

(assert (=> b!883935 (= e!491922 Unit!30175)))

(declare-fun lt!400209 () Unit!30173)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51528 (_ BitVec 32) (_ BitVec 32)) Unit!30173)

(assert (=> b!883935 (= lt!400209 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17602 0))(
  ( (Nil!17599) (Cons!17598 (h!18729 (_ BitVec 64)) (t!24861 List!17602)) )
))
(declare-fun arrayNoDuplicates!0 (array!51528 (_ BitVec 32) List!17602) Bool)

(assert (=> b!883935 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17599)))

(declare-fun lt!400210 () Unit!30173)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30173)

(assert (=> b!883935 (= lt!400210 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883935 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400200 () Unit!30173)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51528 (_ BitVec 64) (_ BitVec 32) List!17602) Unit!30173)

(assert (=> b!883935 (= lt!400200 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17599))))

(assert (=> b!883935 false))

(declare-fun res!600508 () Bool)

(assert (=> start!74938 (=> (not res!600508) (not e!491918))))

(assert (=> start!74938 (= res!600508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25223 _keys!868))))))

(assert (=> start!74938 e!491918))

(declare-fun tp_is_empty!17701 () Bool)

(assert (=> start!74938 tp_is_empty!17701))

(assert (=> start!74938 true))

(assert (=> start!74938 tp!54074))

(declare-fun array_inv!19512 (array!51528) Bool)

(assert (=> start!74938 (array_inv!19512 _keys!868)))

(declare-fun e!491923 () Bool)

(declare-fun array_inv!19513 (array!51530) Bool)

(assert (=> start!74938 (and (array_inv!19513 _values!688) e!491923)))

(declare-fun b!883936 () Bool)

(declare-fun res!600511 () Bool)

(assert (=> b!883936 (=> (not res!600511) (not e!491918))))

(assert (=> b!883936 (= res!600511 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25223 _keys!868))))))

(declare-fun b!883937 () Bool)

(declare-fun res!600515 () Bool)

(assert (=> b!883937 (=> (not res!600515) (not e!491918))))

(assert (=> b!883937 (= res!600515 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17599))))

(declare-fun b!883938 () Bool)

(declare-fun res!600513 () Bool)

(assert (=> b!883938 (=> (not res!600513) (not e!491918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51528 (_ BitVec 32)) Bool)

(assert (=> b!883938 (= res!600513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883939 () Bool)

(declare-fun e!491921 () Bool)

(declare-fun e!491920 () Bool)

(assert (=> b!883939 (= e!491921 (not e!491920))))

(declare-fun res!600514 () Bool)

(assert (=> b!883939 (=> res!600514 e!491920)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883939 (= res!600514 (not (validKeyInArray!0 (select (arr!24783 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11796 0))(
  ( (tuple2!11797 (_1!5909 (_ BitVec 64)) (_2!5909 V!28649)) )
))
(declare-datatypes ((List!17603 0))(
  ( (Nil!17600) (Cons!17599 (h!18730 tuple2!11796) (t!24862 List!17603)) )
))
(declare-datatypes ((ListLongMap!10565 0))(
  ( (ListLongMap!10566 (toList!5298 List!17603)) )
))
(declare-fun lt!400213 () ListLongMap!10565)

(declare-fun lt!400201 () ListLongMap!10565)

(assert (=> b!883939 (= lt!400213 lt!400201)))

(declare-fun lt!400208 () ListLongMap!10565)

(declare-fun lt!400207 () tuple2!11796)

(declare-fun +!2567 (ListLongMap!10565 tuple2!11796) ListLongMap!10565)

(assert (=> b!883939 (= lt!400201 (+!2567 lt!400208 lt!400207))))

(declare-fun lt!400212 () array!51530)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28649)

(declare-fun zeroValue!654 () V!28649)

(declare-fun getCurrentListMapNoExtraKeys!3257 (array!51528 array!51530 (_ BitVec 32) (_ BitVec 32) V!28649 V!28649 (_ BitVec 32) Int) ListLongMap!10565)

(assert (=> b!883939 (= lt!400213 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!400212 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!28649)

(assert (=> b!883939 (= lt!400207 (tuple2!11797 k!854 v!557))))

(assert (=> b!883939 (= lt!400208 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400205 () Unit!30173)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!750 (array!51528 array!51530 (_ BitVec 32) (_ BitVec 32) V!28649 V!28649 (_ BitVec 32) (_ BitVec 64) V!28649 (_ BitVec 32) Int) Unit!30173)

(assert (=> b!883939 (= lt!400205 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!750 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883940 () Bool)

(declare-fun e!491917 () Bool)

(assert (=> b!883940 (= e!491917 (bvslt i!612 (size!25224 _values!688)))))

(declare-fun lt!400211 () tuple2!11796)

(declare-fun lt!400199 () ListLongMap!10565)

(assert (=> b!883940 (= lt!400199 (+!2567 (+!2567 lt!400208 lt!400211) lt!400207))))

(declare-fun lt!400202 () V!28649)

(declare-fun lt!400214 () Unit!30173)

(declare-fun addCommutativeForDiffKeys!550 (ListLongMap!10565 (_ BitVec 64) V!28649 (_ BitVec 64) V!28649) Unit!30173)

(assert (=> b!883940 (= lt!400214 (addCommutativeForDiffKeys!550 lt!400208 k!854 v!557 (select (arr!24783 _keys!868) from!1053) lt!400202))))

(declare-fun b!883941 () Bool)

(declare-fun res!600509 () Bool)

(assert (=> b!883941 (=> (not res!600509) (not e!491918))))

(assert (=> b!883941 (= res!600509 (validKeyInArray!0 k!854))))

(declare-fun b!883942 () Bool)

(assert (=> b!883942 (= e!491918 e!491921)))

(declare-fun res!600516 () Bool)

(assert (=> b!883942 (=> (not res!600516) (not e!491921))))

(assert (=> b!883942 (= res!600516 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400204 () ListLongMap!10565)

(assert (=> b!883942 (= lt!400204 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!400212 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883942 (= lt!400212 (array!51531 (store (arr!24784 _values!688) i!612 (ValueCellFull!8411 v!557)) (size!25224 _values!688)))))

(declare-fun lt!400203 () ListLongMap!10565)

(assert (=> b!883942 (= lt!400203 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!28188 () Bool)

(declare-fun mapRes!28188 () Bool)

(assert (=> mapIsEmpty!28188 mapRes!28188))

(declare-fun b!883943 () Bool)

(declare-fun e!491925 () Bool)

(assert (=> b!883943 (= e!491925 tp_is_empty!17701)))

(declare-fun b!883944 () Bool)

(assert (=> b!883944 (= e!491920 e!491917)))

(declare-fun res!600507 () Bool)

(assert (=> b!883944 (=> res!600507 e!491917)))

(assert (=> b!883944 (= res!600507 (= k!854 (select (arr!24783 _keys!868) from!1053)))))

(assert (=> b!883944 (not (= (select (arr!24783 _keys!868) from!1053) k!854))))

(declare-fun lt!400206 () Unit!30173)

(assert (=> b!883944 (= lt!400206 e!491922)))

(declare-fun c!93091 () Bool)

(assert (=> b!883944 (= c!93091 (= (select (arr!24783 _keys!868) from!1053) k!854))))

(assert (=> b!883944 (= lt!400204 lt!400199)))

(assert (=> b!883944 (= lt!400199 (+!2567 lt!400201 lt!400211))))

(assert (=> b!883944 (= lt!400211 (tuple2!11797 (select (arr!24783 _keys!868) from!1053) lt!400202))))

(declare-fun get!13063 (ValueCell!8411 V!28649) V!28649)

(declare-fun dynLambda!1278 (Int (_ BitVec 64)) V!28649)

(assert (=> b!883944 (= lt!400202 (get!13063 (select (arr!24784 _values!688) from!1053) (dynLambda!1278 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883945 () Bool)

(declare-fun res!600512 () Bool)

(assert (=> b!883945 (=> (not res!600512) (not e!491918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883945 (= res!600512 (validMask!0 mask!1196))))

(declare-fun b!883946 () Bool)

(declare-fun e!491924 () Bool)

(assert (=> b!883946 (= e!491924 tp_is_empty!17701)))

(declare-fun b!883947 () Bool)

(declare-fun Unit!30176 () Unit!30173)

(assert (=> b!883947 (= e!491922 Unit!30176)))

(declare-fun b!883948 () Bool)

(assert (=> b!883948 (= e!491923 (and e!491925 mapRes!28188))))

(declare-fun condMapEmpty!28188 () Bool)

(declare-fun mapDefault!28188 () ValueCell!8411)

