; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73318 () Bool)

(assert start!73318)

(declare-fun b_free!14065 () Bool)

(declare-fun b_next!14065 () Bool)

(assert (=> start!73318 (= b_free!14065 (not b_next!14065))))

(declare-fun tp!49700 () Bool)

(declare-fun b_and!23299 () Bool)

(assert (=> start!73318 (= tp!49700 b_and!23299)))

(declare-fun b!852585 () Bool)

(declare-fun e!475628 () Bool)

(declare-fun e!475626 () Bool)

(assert (=> b!852585 (= e!475628 e!475626)))

(declare-fun res!578850 () Bool)

(assert (=> b!852585 (=> (not res!578850) (not e!475626))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852585 (= res!578850 (= from!1053 i!612))))

(declare-datatypes ((V!26649 0))(
  ( (V!26650 (val!8148 Int)) )
))
(declare-datatypes ((ValueCell!7661 0))(
  ( (ValueCellFull!7661 (v!10573 V!26649)) (EmptyCell!7661) )
))
(declare-datatypes ((array!48651 0))(
  ( (array!48652 (arr!23352 (Array (_ BitVec 32) ValueCell!7661)) (size!23793 (_ BitVec 32))) )
))
(declare-fun lt!383983 () array!48651)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10614 0))(
  ( (tuple2!10615 (_1!5318 (_ BitVec 64)) (_2!5318 V!26649)) )
))
(declare-datatypes ((List!16471 0))(
  ( (Nil!16468) (Cons!16467 (h!17604 tuple2!10614) (t!22974 List!16471)) )
))
(declare-datatypes ((ListLongMap!9385 0))(
  ( (ListLongMap!9386 (toList!4708 List!16471)) )
))
(declare-fun lt!383978 () ListLongMap!9385)

(declare-datatypes ((array!48653 0))(
  ( (array!48654 (arr!23353 (Array (_ BitVec 32) (_ BitVec 64))) (size!23794 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48653)

(declare-fun minValue!654 () V!26649)

(declare-fun zeroValue!654 () V!26649)

(declare-fun getCurrentListMapNoExtraKeys!2766 (array!48653 array!48651 (_ BitVec 32) (_ BitVec 32) V!26649 V!26649 (_ BitVec 32) Int) ListLongMap!9385)

(assert (=> b!852585 (= lt!383978 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!383983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26649)

(declare-fun _values!688 () array!48651)

(assert (=> b!852585 (= lt!383983 (array!48652 (store (arr!23352 _values!688) i!612 (ValueCellFull!7661 v!557)) (size!23793 _values!688)))))

(declare-fun lt!383977 () ListLongMap!9385)

(assert (=> b!852585 (= lt!383977 (getCurrentListMapNoExtraKeys!2766 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852586 () Bool)

(declare-fun res!578849 () Bool)

(assert (=> b!852586 (=> (not res!578849) (not e!475628))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852586 (= res!578849 (validKeyInArray!0 k0!854))))

(declare-fun b!852587 () Bool)

(declare-fun res!578848 () Bool)

(assert (=> b!852587 (=> (not res!578848) (not e!475628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852587 (= res!578848 (validMask!0 mask!1196))))

(declare-fun b!852588 () Bool)

(declare-fun res!578847 () Bool)

(assert (=> b!852588 (=> (not res!578847) (not e!475628))))

(assert (=> b!852588 (= res!578847 (and (= (size!23793 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23794 _keys!868) (size!23793 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25901 () Bool)

(declare-fun mapRes!25901 () Bool)

(declare-fun tp!49699 () Bool)

(declare-fun e!475630 () Bool)

(assert (=> mapNonEmpty!25901 (= mapRes!25901 (and tp!49699 e!475630))))

(declare-fun mapRest!25901 () (Array (_ BitVec 32) ValueCell!7661))

(declare-fun mapValue!25901 () ValueCell!7661)

(declare-fun mapKey!25901 () (_ BitVec 32))

(assert (=> mapNonEmpty!25901 (= (arr!23352 _values!688) (store mapRest!25901 mapKey!25901 mapValue!25901))))

(declare-fun b!852589 () Bool)

(declare-fun e!475625 () Bool)

(declare-fun tp_is_empty!16201 () Bool)

(assert (=> b!852589 (= e!475625 tp_is_empty!16201)))

(declare-fun mapIsEmpty!25901 () Bool)

(assert (=> mapIsEmpty!25901 mapRes!25901))

(declare-fun res!578842 () Bool)

(assert (=> start!73318 (=> (not res!578842) (not e!475628))))

(assert (=> start!73318 (= res!578842 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23794 _keys!868))))))

(assert (=> start!73318 e!475628))

(assert (=> start!73318 tp_is_empty!16201))

(assert (=> start!73318 true))

(assert (=> start!73318 tp!49700))

(declare-fun array_inv!18572 (array!48653) Bool)

(assert (=> start!73318 (array_inv!18572 _keys!868)))

(declare-fun e!475623 () Bool)

(declare-fun array_inv!18573 (array!48651) Bool)

(assert (=> start!73318 (and (array_inv!18573 _values!688) e!475623)))

(declare-fun b!852590 () Bool)

(declare-fun res!578846 () Bool)

(assert (=> b!852590 (=> (not res!578846) (not e!475628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48653 (_ BitVec 32)) Bool)

(assert (=> b!852590 (= res!578846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852591 () Bool)

(declare-fun e!475627 () Bool)

(declare-fun call!38096 () ListLongMap!9385)

(declare-fun call!38095 () ListLongMap!9385)

(assert (=> b!852591 (= e!475627 (= call!38096 call!38095))))

(declare-fun b!852592 () Bool)

(declare-fun e!475624 () Bool)

(assert (=> b!852592 (= e!475626 (not e!475624))))

(declare-fun res!578844 () Bool)

(assert (=> b!852592 (=> res!578844 e!475624)))

(assert (=> b!852592 (= res!578844 (not (validKeyInArray!0 (select (arr!23353 _keys!868) from!1053))))))

(assert (=> b!852592 e!475627))

(declare-fun c!92050 () Bool)

(assert (=> b!852592 (= c!92050 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29072 0))(
  ( (Unit!29073) )
))
(declare-fun lt!383982 () Unit!29072)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!367 (array!48653 array!48651 (_ BitVec 32) (_ BitVec 32) V!26649 V!26649 (_ BitVec 32) (_ BitVec 64) V!26649 (_ BitVec 32) Int) Unit!29072)

(assert (=> b!852592 (= lt!383982 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!367 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852593 () Bool)

(declare-fun res!578845 () Bool)

(assert (=> b!852593 (=> (not res!578845) (not e!475628))))

(assert (=> b!852593 (= res!578845 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23794 _keys!868))))))

(declare-fun bm!38092 () Bool)

(assert (=> bm!38092 (= call!38095 (getCurrentListMapNoExtraKeys!2766 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852594 () Bool)

(declare-fun res!578851 () Bool)

(assert (=> b!852594 (=> (not res!578851) (not e!475628))))

(assert (=> b!852594 (= res!578851 (and (= (select (arr!23353 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852595 () Bool)

(assert (=> b!852595 (= e!475623 (and e!475625 mapRes!25901))))

(declare-fun condMapEmpty!25901 () Bool)

(declare-fun mapDefault!25901 () ValueCell!7661)

(assert (=> b!852595 (= condMapEmpty!25901 (= (arr!23352 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7661)) mapDefault!25901)))))

(declare-fun b!852596 () Bool)

(declare-fun res!578843 () Bool)

(assert (=> b!852596 (=> (not res!578843) (not e!475628))))

(declare-datatypes ((List!16472 0))(
  ( (Nil!16469) (Cons!16468 (h!17605 (_ BitVec 64)) (t!22975 List!16472)) )
))
(declare-fun arrayNoDuplicates!0 (array!48653 (_ BitVec 32) List!16472) Bool)

(assert (=> b!852596 (= res!578843 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16469))))

(declare-fun bm!38093 () Bool)

(assert (=> bm!38093 (= call!38096 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!383983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852597 () Bool)

(declare-fun +!2155 (ListLongMap!9385 tuple2!10614) ListLongMap!9385)

(assert (=> b!852597 (= e!475627 (= call!38096 (+!2155 call!38095 (tuple2!10615 k0!854 v!557))))))

(declare-fun b!852598 () Bool)

(assert (=> b!852598 (= e!475624 true)))

(declare-fun lt!383976 () V!26649)

(declare-fun lt!383981 () tuple2!10614)

(declare-fun lt!383980 () ListLongMap!9385)

(assert (=> b!852598 (= (+!2155 lt!383980 lt!383981) (+!2155 (+!2155 lt!383980 (tuple2!10615 k0!854 lt!383976)) lt!383981))))

(declare-fun lt!383979 () V!26649)

(assert (=> b!852598 (= lt!383981 (tuple2!10615 k0!854 lt!383979))))

(declare-fun lt!383975 () Unit!29072)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!284 (ListLongMap!9385 (_ BitVec 64) V!26649 V!26649) Unit!29072)

(assert (=> b!852598 (= lt!383975 (addSameAsAddTwiceSameKeyDiffValues!284 lt!383980 k0!854 lt!383976 lt!383979))))

(declare-fun lt!383984 () V!26649)

(declare-fun get!12303 (ValueCell!7661 V!26649) V!26649)

(assert (=> b!852598 (= lt!383976 (get!12303 (select (arr!23352 _values!688) from!1053) lt!383984))))

(assert (=> b!852598 (= lt!383978 (+!2155 lt!383980 (tuple2!10615 (select (arr!23353 _keys!868) from!1053) lt!383979)))))

(assert (=> b!852598 (= lt!383979 (get!12303 (select (store (arr!23352 _values!688) i!612 (ValueCellFull!7661 v!557)) from!1053) lt!383984))))

(declare-fun dynLambda!1031 (Int (_ BitVec 64)) V!26649)

(assert (=> b!852598 (= lt!383984 (dynLambda!1031 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852598 (= lt!383980 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!383983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852599 () Bool)

(assert (=> b!852599 (= e!475630 tp_is_empty!16201)))

(assert (= (and start!73318 res!578842) b!852587))

(assert (= (and b!852587 res!578848) b!852588))

(assert (= (and b!852588 res!578847) b!852590))

(assert (= (and b!852590 res!578846) b!852596))

(assert (= (and b!852596 res!578843) b!852593))

(assert (= (and b!852593 res!578845) b!852586))

(assert (= (and b!852586 res!578849) b!852594))

(assert (= (and b!852594 res!578851) b!852585))

(assert (= (and b!852585 res!578850) b!852592))

(assert (= (and b!852592 c!92050) b!852597))

(assert (= (and b!852592 (not c!92050)) b!852591))

(assert (= (or b!852597 b!852591) bm!38092))

(assert (= (or b!852597 b!852591) bm!38093))

(assert (= (and b!852592 (not res!578844)) b!852598))

(assert (= (and b!852595 condMapEmpty!25901) mapIsEmpty!25901))

(assert (= (and b!852595 (not condMapEmpty!25901)) mapNonEmpty!25901))

(get-info :version)

(assert (= (and mapNonEmpty!25901 ((_ is ValueCellFull!7661) mapValue!25901)) b!852599))

(assert (= (and b!852595 ((_ is ValueCellFull!7661) mapDefault!25901)) b!852589))

(assert (= start!73318 b!852595))

(declare-fun b_lambda!11611 () Bool)

(assert (=> (not b_lambda!11611) (not b!852598)))

(declare-fun t!22973 () Bool)

(declare-fun tb!4359 () Bool)

(assert (=> (and start!73318 (= defaultEntry!696 defaultEntry!696) t!22973) tb!4359))

(declare-fun result!8337 () Bool)

(assert (=> tb!4359 (= result!8337 tp_is_empty!16201)))

(assert (=> b!852598 t!22973))

(declare-fun b_and!23301 () Bool)

(assert (= b_and!23299 (and (=> t!22973 result!8337) b_and!23301)))

(declare-fun m!793921 () Bool)

(assert (=> b!852594 m!793921))

(declare-fun m!793923 () Bool)

(assert (=> b!852586 m!793923))

(declare-fun m!793925 () Bool)

(assert (=> b!852590 m!793925))

(declare-fun m!793927 () Bool)

(assert (=> bm!38092 m!793927))

(declare-fun m!793929 () Bool)

(assert (=> b!852598 m!793929))

(declare-fun m!793931 () Bool)

(assert (=> b!852598 m!793931))

(declare-fun m!793933 () Bool)

(assert (=> b!852598 m!793933))

(declare-fun m!793935 () Bool)

(assert (=> b!852598 m!793935))

(declare-fun m!793937 () Bool)

(assert (=> b!852598 m!793937))

(assert (=> b!852598 m!793931))

(declare-fun m!793939 () Bool)

(assert (=> b!852598 m!793939))

(declare-fun m!793941 () Bool)

(assert (=> b!852598 m!793941))

(declare-fun m!793943 () Bool)

(assert (=> b!852598 m!793943))

(declare-fun m!793945 () Bool)

(assert (=> b!852598 m!793945))

(declare-fun m!793947 () Bool)

(assert (=> b!852598 m!793947))

(assert (=> b!852598 m!793943))

(declare-fun m!793949 () Bool)

(assert (=> b!852598 m!793949))

(declare-fun m!793951 () Bool)

(assert (=> b!852598 m!793951))

(declare-fun m!793953 () Bool)

(assert (=> b!852598 m!793953))

(assert (=> b!852598 m!793935))

(declare-fun m!793955 () Bool)

(assert (=> mapNonEmpty!25901 m!793955))

(declare-fun m!793957 () Bool)

(assert (=> b!852587 m!793957))

(declare-fun m!793959 () Bool)

(assert (=> b!852585 m!793959))

(assert (=> b!852585 m!793947))

(declare-fun m!793961 () Bool)

(assert (=> b!852585 m!793961))

(assert (=> bm!38093 m!793941))

(declare-fun m!793963 () Bool)

(assert (=> start!73318 m!793963))

(declare-fun m!793965 () Bool)

(assert (=> start!73318 m!793965))

(declare-fun m!793967 () Bool)

(assert (=> b!852596 m!793967))

(declare-fun m!793969 () Bool)

(assert (=> b!852597 m!793969))

(assert (=> b!852592 m!793949))

(assert (=> b!852592 m!793949))

(declare-fun m!793971 () Bool)

(assert (=> b!852592 m!793971))

(declare-fun m!793973 () Bool)

(assert (=> b!852592 m!793973))

(check-sat (not b!852596) (not b!852597) (not b!852590) (not b_lambda!11611) (not b!852592) (not b_next!14065) b_and!23301 (not b!852598) (not b!852587) tp_is_empty!16201 (not mapNonEmpty!25901) (not start!73318) (not bm!38092) (not bm!38093) (not b!852585) (not b!852586))
(check-sat b_and!23301 (not b_next!14065))
