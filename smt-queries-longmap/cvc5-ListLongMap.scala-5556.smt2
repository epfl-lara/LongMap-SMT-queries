; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73120 () Bool)

(assert start!73120)

(declare-fun b_free!14035 () Bool)

(declare-fun b_next!14035 () Bool)

(assert (=> start!73120 (= b_free!14035 (not b_next!14035))))

(declare-fun tp!49608 () Bool)

(declare-fun b_and!23229 () Bool)

(assert (=> start!73120 (= tp!49608 b_and!23229)))

(declare-fun b!850977 () Bool)

(declare-fun res!578056 () Bool)

(declare-fun e!474687 () Bool)

(assert (=> b!850977 (=> (not res!578056) (not e!474687))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48546 0))(
  ( (array!48547 (arr!23304 (Array (_ BitVec 32) (_ BitVec 64))) (size!23744 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48546)

(declare-datatypes ((V!26609 0))(
  ( (V!26610 (val!8133 Int)) )
))
(declare-datatypes ((ValueCell!7646 0))(
  ( (ValueCellFull!7646 (v!10558 V!26609)) (EmptyCell!7646) )
))
(declare-datatypes ((array!48548 0))(
  ( (array!48549 (arr!23305 (Array (_ BitVec 32) ValueCell!7646)) (size!23745 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48548)

(assert (=> b!850977 (= res!578056 (and (= (size!23745 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23744 _keys!868) (size!23745 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25856 () Bool)

(declare-fun mapRes!25856 () Bool)

(assert (=> mapIsEmpty!25856 mapRes!25856))

(declare-fun b!850979 () Bool)

(declare-fun e!474686 () Bool)

(declare-fun tp_is_empty!16171 () Bool)

(assert (=> b!850979 (= e!474686 tp_is_empty!16171)))

(declare-fun b!850980 () Bool)

(declare-fun e!474683 () Bool)

(declare-fun e!474688 () Bool)

(assert (=> b!850980 (= e!474683 (not e!474688))))

(declare-fun res!578055 () Bool)

(assert (=> b!850980 (=> res!578055 e!474688)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850980 (= res!578055 (not (validKeyInArray!0 (select (arr!23304 _keys!868) from!1053))))))

(declare-fun e!474684 () Bool)

(assert (=> b!850980 e!474684))

(declare-fun c!91723 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850980 (= c!91723 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26609)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29059 0))(
  ( (Unit!29060) )
))
(declare-fun lt!383170 () Unit!29059)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26609)

(declare-fun zeroValue!654 () V!26609)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!371 (array!48546 array!48548 (_ BitVec 32) (_ BitVec 32) V!26609 V!26609 (_ BitVec 32) (_ BitVec 64) V!26609 (_ BitVec 32) Int) Unit!29059)

(assert (=> b!850980 (= lt!383170 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!371 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850981 () Bool)

(declare-fun res!578048 () Bool)

(assert (=> b!850981 (=> (not res!578048) (not e!474687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48546 (_ BitVec 32)) Bool)

(assert (=> b!850981 (= res!578048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37957 () Bool)

(declare-datatypes ((tuple2!10668 0))(
  ( (tuple2!10669 (_1!5345 (_ BitVec 64)) (_2!5345 V!26609)) )
))
(declare-datatypes ((List!16509 0))(
  ( (Nil!16506) (Cons!16505 (h!17636 tuple2!10668) (t!22990 List!16509)) )
))
(declare-datatypes ((ListLongMap!9437 0))(
  ( (ListLongMap!9438 (toList!4734 List!16509)) )
))
(declare-fun call!37960 () ListLongMap!9437)

(declare-fun getCurrentListMapNoExtraKeys!2716 (array!48546 array!48548 (_ BitVec 32) (_ BitVec 32) V!26609 V!26609 (_ BitVec 32) Int) ListLongMap!9437)

(assert (=> bm!37957 (= call!37960 (getCurrentListMapNoExtraKeys!2716 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!383169 () array!48548)

(declare-fun call!37961 () ListLongMap!9437)

(declare-fun bm!37958 () Bool)

(assert (=> bm!37958 (= call!37961 (getCurrentListMapNoExtraKeys!2716 _keys!868 lt!383169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25856 () Bool)

(declare-fun tp!49609 () Bool)

(declare-fun e!474681 () Bool)

(assert (=> mapNonEmpty!25856 (= mapRes!25856 (and tp!49609 e!474681))))

(declare-fun mapValue!25856 () ValueCell!7646)

(declare-fun mapRest!25856 () (Array (_ BitVec 32) ValueCell!7646))

(declare-fun mapKey!25856 () (_ BitVec 32))

(assert (=> mapNonEmpty!25856 (= (arr!23305 _values!688) (store mapRest!25856 mapKey!25856 mapValue!25856))))

(declare-fun b!850982 () Bool)

(assert (=> b!850982 (= e!474684 (= call!37961 call!37960))))

(declare-fun b!850983 () Bool)

(declare-fun res!578051 () Bool)

(assert (=> b!850983 (=> (not res!578051) (not e!474687))))

(assert (=> b!850983 (= res!578051 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23744 _keys!868))))))

(declare-fun b!850984 () Bool)

(declare-fun res!578053 () Bool)

(assert (=> b!850984 (=> (not res!578053) (not e!474687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850984 (= res!578053 (validMask!0 mask!1196))))

(declare-fun b!850985 () Bool)

(assert (=> b!850985 (= e!474681 tp_is_empty!16171)))

(declare-fun b!850986 () Bool)

(declare-fun +!2134 (ListLongMap!9437 tuple2!10668) ListLongMap!9437)

(assert (=> b!850986 (= e!474684 (= call!37961 (+!2134 call!37960 (tuple2!10669 k!854 v!557))))))

(declare-fun res!578049 () Bool)

(assert (=> start!73120 (=> (not res!578049) (not e!474687))))

(assert (=> start!73120 (= res!578049 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23744 _keys!868))))))

(assert (=> start!73120 e!474687))

(assert (=> start!73120 tp_is_empty!16171))

(assert (=> start!73120 true))

(assert (=> start!73120 tp!49608))

(declare-fun array_inv!18492 (array!48546) Bool)

(assert (=> start!73120 (array_inv!18492 _keys!868)))

(declare-fun e!474685 () Bool)

(declare-fun array_inv!18493 (array!48548) Bool)

(assert (=> start!73120 (and (array_inv!18493 _values!688) e!474685)))

(declare-fun b!850978 () Bool)

(declare-fun res!578057 () Bool)

(assert (=> b!850978 (=> (not res!578057) (not e!474687))))

(assert (=> b!850978 (= res!578057 (and (= (select (arr!23304 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850987 () Bool)

(declare-fun res!578052 () Bool)

(assert (=> b!850987 (=> (not res!578052) (not e!474687))))

(assert (=> b!850987 (= res!578052 (validKeyInArray!0 k!854))))

(declare-fun b!850988 () Bool)

(assert (=> b!850988 (= e!474688 true)))

(declare-fun lt!383166 () V!26609)

(declare-fun lt!383164 () ListLongMap!9437)

(declare-fun lt!383167 () tuple2!10668)

(assert (=> b!850988 (= (+!2134 lt!383164 lt!383167) (+!2134 (+!2134 lt!383164 (tuple2!10669 k!854 lt!383166)) lt!383167))))

(declare-fun lt!383168 () V!26609)

(assert (=> b!850988 (= lt!383167 (tuple2!10669 k!854 lt!383168))))

(declare-fun lt!383165 () Unit!29059)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!268 (ListLongMap!9437 (_ BitVec 64) V!26609 V!26609) Unit!29059)

(assert (=> b!850988 (= lt!383165 (addSameAsAddTwiceSameKeyDiffValues!268 lt!383164 k!854 lt!383166 lt!383168))))

(declare-fun lt!383172 () V!26609)

(declare-fun get!12278 (ValueCell!7646 V!26609) V!26609)

(assert (=> b!850988 (= lt!383166 (get!12278 (select (arr!23305 _values!688) from!1053) lt!383172))))

(declare-fun lt!383173 () ListLongMap!9437)

(assert (=> b!850988 (= lt!383173 (+!2134 lt!383164 (tuple2!10669 (select (arr!23304 _keys!868) from!1053) lt!383168)))))

(assert (=> b!850988 (= lt!383168 (get!12278 (select (store (arr!23305 _values!688) i!612 (ValueCellFull!7646 v!557)) from!1053) lt!383172))))

(declare-fun dynLambda!1022 (Int (_ BitVec 64)) V!26609)

(assert (=> b!850988 (= lt!383172 (dynLambda!1022 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850988 (= lt!383164 (getCurrentListMapNoExtraKeys!2716 _keys!868 lt!383169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850989 () Bool)

(assert (=> b!850989 (= e!474687 e!474683)))

(declare-fun res!578054 () Bool)

(assert (=> b!850989 (=> (not res!578054) (not e!474683))))

(assert (=> b!850989 (= res!578054 (= from!1053 i!612))))

(assert (=> b!850989 (= lt!383173 (getCurrentListMapNoExtraKeys!2716 _keys!868 lt!383169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850989 (= lt!383169 (array!48549 (store (arr!23305 _values!688) i!612 (ValueCellFull!7646 v!557)) (size!23745 _values!688)))))

(declare-fun lt!383171 () ListLongMap!9437)

(assert (=> b!850989 (= lt!383171 (getCurrentListMapNoExtraKeys!2716 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850990 () Bool)

(assert (=> b!850990 (= e!474685 (and e!474686 mapRes!25856))))

(declare-fun condMapEmpty!25856 () Bool)

(declare-fun mapDefault!25856 () ValueCell!7646)

