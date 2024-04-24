; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73720 () Bool)

(assert start!73720)

(declare-fun b_free!14467 () Bool)

(declare-fun b_next!14467 () Bool)

(assert (=> start!73720 (= b_free!14467 (not b_next!14467))))

(declare-fun tp!50906 () Bool)

(declare-fun b_and!23923 () Bool)

(assert (=> start!73720 (= tp!50906 b_and!23923)))

(declare-fun b!860876 () Bool)

(declare-fun res!584715 () Bool)

(declare-fun e!479802 () Bool)

(assert (=> b!860876 (=> (not res!584715) (not e!479802))))

(declare-datatypes ((array!49433 0))(
  ( (array!49434 (arr!23743 (Array (_ BitVec 32) (_ BitVec 64))) (size!24184 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49433)

(declare-datatypes ((List!16794 0))(
  ( (Nil!16791) (Cons!16790 (h!17927 (_ BitVec 64)) (t!23519 List!16794)) )
))
(declare-fun arrayNoDuplicates!0 (array!49433 (_ BitVec 32) List!16794) Bool)

(assert (=> b!860876 (= res!584715 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16791))))

(declare-fun b!860877 () Bool)

(declare-fun e!479806 () Bool)

(declare-fun tp_is_empty!16603 () Bool)

(assert (=> b!860877 (= e!479806 tp_is_empty!16603)))

(declare-fun b!860878 () Bool)

(declare-fun e!479808 () Bool)

(assert (=> b!860878 (= e!479808 tp_is_empty!16603)))

(declare-fun b!860879 () Bool)

(declare-fun res!584721 () Bool)

(declare-fun e!479801 () Bool)

(assert (=> b!860879 (=> res!584721 e!479801)))

(declare-fun noDuplicate!1311 (List!16794) Bool)

(assert (=> b!860879 (= res!584721 (not (noDuplicate!1311 Nil!16791)))))

(declare-fun b!860880 () Bool)

(declare-fun res!584714 () Bool)

(assert (=> b!860880 (=> (not res!584714) (not e!479802))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860880 (= res!584714 (and (= (select (arr!23743 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860881 () Bool)

(assert (=> b!860881 (= e!479801 true)))

(declare-fun lt!387931 () Bool)

(declare-fun contains!4206 (List!16794 (_ BitVec 64)) Bool)

(assert (=> b!860881 (= lt!387931 (contains!4206 Nil!16791 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860882 () Bool)

(declare-fun res!584709 () Bool)

(assert (=> b!860882 (=> (not res!584709) (not e!479802))))

(assert (=> b!860882 (= res!584709 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24184 _keys!868))))))

(declare-fun b!860883 () Bool)

(declare-fun e!479809 () Bool)

(declare-fun mapRes!26504 () Bool)

(assert (=> b!860883 (= e!479809 (and e!479808 mapRes!26504))))

(declare-fun condMapEmpty!26504 () Bool)

(declare-datatypes ((V!27185 0))(
  ( (V!27186 (val!8349 Int)) )
))
(declare-datatypes ((ValueCell!7862 0))(
  ( (ValueCellFull!7862 (v!10774 V!27185)) (EmptyCell!7862) )
))
(declare-datatypes ((array!49435 0))(
  ( (array!49436 (arr!23744 (Array (_ BitVec 32) ValueCell!7862)) (size!24185 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49435)

(declare-fun mapDefault!26504 () ValueCell!7862)

(assert (=> b!860883 (= condMapEmpty!26504 (= (arr!23744 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7862)) mapDefault!26504)))))

(declare-fun b!860884 () Bool)

(declare-fun res!584718 () Bool)

(assert (=> b!860884 (=> res!584718 e!479801)))

(assert (=> b!860884 (= res!584718 (contains!4206 Nil!16791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860885 () Bool)

(declare-fun e!479804 () Bool)

(declare-fun e!479803 () Bool)

(assert (=> b!860885 (= e!479804 (not e!479803))))

(declare-fun res!584712 () Bool)

(assert (=> b!860885 (=> res!584712 e!479803)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860885 (= res!584712 (not (validKeyInArray!0 (select (arr!23743 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10954 0))(
  ( (tuple2!10955 (_1!5488 (_ BitVec 64)) (_2!5488 V!27185)) )
))
(declare-datatypes ((List!16795 0))(
  ( (Nil!16792) (Cons!16791 (h!17928 tuple2!10954) (t!23520 List!16795)) )
))
(declare-datatypes ((ListLongMap!9725 0))(
  ( (ListLongMap!9726 (toList!4878 List!16795)) )
))
(declare-fun lt!387928 () ListLongMap!9725)

(declare-fun lt!387933 () ListLongMap!9725)

(assert (=> b!860885 (= lt!387928 lt!387933)))

(declare-fun v!557 () V!27185)

(declare-fun lt!387934 () ListLongMap!9725)

(declare-fun +!2283 (ListLongMap!9725 tuple2!10954) ListLongMap!9725)

(assert (=> b!860885 (= lt!387933 (+!2283 lt!387934 (tuple2!10955 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!387930 () array!49435)

(declare-fun minValue!654 () V!27185)

(declare-fun zeroValue!654 () V!27185)

(declare-fun getCurrentListMapNoExtraKeys!2932 (array!49433 array!49435 (_ BitVec 32) (_ BitVec 32) V!27185 V!27185 (_ BitVec 32) Int) ListLongMap!9725)

(assert (=> b!860885 (= lt!387928 (getCurrentListMapNoExtraKeys!2932 _keys!868 lt!387930 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860885 (= lt!387934 (getCurrentListMapNoExtraKeys!2932 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29320 0))(
  ( (Unit!29321) )
))
(declare-fun lt!387935 () Unit!29320)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!476 (array!49433 array!49435 (_ BitVec 32) (_ BitVec 32) V!27185 V!27185 (_ BitVec 32) (_ BitVec 64) V!27185 (_ BitVec 32) Int) Unit!29320)

(assert (=> b!860885 (= lt!387935 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!476 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!584720 () Bool)

(assert (=> start!73720 (=> (not res!584720) (not e!479802))))

(assert (=> start!73720 (= res!584720 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24184 _keys!868))))))

(assert (=> start!73720 e!479802))

(assert (=> start!73720 tp_is_empty!16603))

(assert (=> start!73720 true))

(assert (=> start!73720 tp!50906))

(declare-fun array_inv!18846 (array!49433) Bool)

(assert (=> start!73720 (array_inv!18846 _keys!868)))

(declare-fun array_inv!18847 (array!49435) Bool)

(assert (=> start!73720 (and (array_inv!18847 _values!688) e!479809)))

(declare-fun b!860875 () Bool)

(declare-fun res!584716 () Bool)

(assert (=> b!860875 (=> (not res!584716) (not e!479802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860875 (= res!584716 (validMask!0 mask!1196))))

(declare-fun b!860886 () Bool)

(declare-fun res!584722 () Bool)

(assert (=> b!860886 (=> (not res!584722) (not e!479802))))

(assert (=> b!860886 (= res!584722 (validKeyInArray!0 k0!854))))

(declare-fun b!860887 () Bool)

(declare-fun e!479807 () Bool)

(assert (=> b!860887 (= e!479803 e!479807)))

(declare-fun res!584719 () Bool)

(assert (=> b!860887 (=> res!584719 e!479807)))

(assert (=> b!860887 (= res!584719 (not (= (select (arr!23743 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387926 () ListLongMap!9725)

(declare-fun get!12522 (ValueCell!7862 V!27185) V!27185)

(declare-fun dynLambda!1116 (Int (_ BitVec 64)) V!27185)

(assert (=> b!860887 (= lt!387926 (+!2283 lt!387933 (tuple2!10955 (select (arr!23743 _keys!868) from!1053) (get!12522 (select (arr!23744 _values!688) from!1053) (dynLambda!1116 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860888 () Bool)

(assert (=> b!860888 (= e!479807 e!479801)))

(declare-fun res!584711 () Bool)

(assert (=> b!860888 (=> res!584711 e!479801)))

(assert (=> b!860888 (= res!584711 (or (bvsge (size!24184 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24184 _keys!868)) (bvsge from!1053 (size!24184 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860888 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387927 () Unit!29320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29320)

(assert (=> b!860888 (= lt!387927 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860888 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16791)))

(declare-fun lt!387929 () Unit!29320)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49433 (_ BitVec 32) (_ BitVec 32)) Unit!29320)

(assert (=> b!860888 (= lt!387929 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860889 () Bool)

(declare-fun res!584710 () Bool)

(assert (=> b!860889 (=> (not res!584710) (not e!479802))))

(assert (=> b!860889 (= res!584710 (and (= (size!24185 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24184 _keys!868) (size!24185 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26504 () Bool)

(assert (=> mapIsEmpty!26504 mapRes!26504))

(declare-fun b!860890 () Bool)

(assert (=> b!860890 (= e!479802 e!479804)))

(declare-fun res!584717 () Bool)

(assert (=> b!860890 (=> (not res!584717) (not e!479804))))

(assert (=> b!860890 (= res!584717 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860890 (= lt!387926 (getCurrentListMapNoExtraKeys!2932 _keys!868 lt!387930 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860890 (= lt!387930 (array!49436 (store (arr!23744 _values!688) i!612 (ValueCellFull!7862 v!557)) (size!24185 _values!688)))))

(declare-fun lt!387932 () ListLongMap!9725)

(assert (=> b!860890 (= lt!387932 (getCurrentListMapNoExtraKeys!2932 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860891 () Bool)

(declare-fun res!584713 () Bool)

(assert (=> b!860891 (=> (not res!584713) (not e!479802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49433 (_ BitVec 32)) Bool)

(assert (=> b!860891 (= res!584713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26504 () Bool)

(declare-fun tp!50905 () Bool)

(assert (=> mapNonEmpty!26504 (= mapRes!26504 (and tp!50905 e!479806))))

(declare-fun mapKey!26504 () (_ BitVec 32))

(declare-fun mapRest!26504 () (Array (_ BitVec 32) ValueCell!7862))

(declare-fun mapValue!26504 () ValueCell!7862)

(assert (=> mapNonEmpty!26504 (= (arr!23744 _values!688) (store mapRest!26504 mapKey!26504 mapValue!26504))))

(assert (= (and start!73720 res!584720) b!860875))

(assert (= (and b!860875 res!584716) b!860889))

(assert (= (and b!860889 res!584710) b!860891))

(assert (= (and b!860891 res!584713) b!860876))

(assert (= (and b!860876 res!584715) b!860882))

(assert (= (and b!860882 res!584709) b!860886))

(assert (= (and b!860886 res!584722) b!860880))

(assert (= (and b!860880 res!584714) b!860890))

(assert (= (and b!860890 res!584717) b!860885))

(assert (= (and b!860885 (not res!584712)) b!860887))

(assert (= (and b!860887 (not res!584719)) b!860888))

(assert (= (and b!860888 (not res!584711)) b!860879))

(assert (= (and b!860879 (not res!584721)) b!860884))

(assert (= (and b!860884 (not res!584718)) b!860881))

(assert (= (and b!860883 condMapEmpty!26504) mapIsEmpty!26504))

(assert (= (and b!860883 (not condMapEmpty!26504)) mapNonEmpty!26504))

(get-info :version)

(assert (= (and mapNonEmpty!26504 ((_ is ValueCellFull!7862) mapValue!26504)) b!860877))

(assert (= (and b!860883 ((_ is ValueCellFull!7862) mapDefault!26504)) b!860878))

(assert (= start!73720 b!860883))

(declare-fun b_lambda!11833 () Bool)

(assert (=> (not b_lambda!11833) (not b!860887)))

(declare-fun t!23518 () Bool)

(declare-fun tb!4581 () Bool)

(assert (=> (and start!73720 (= defaultEntry!696 defaultEntry!696) t!23518) tb!4581))

(declare-fun result!8781 () Bool)

(assert (=> tb!4581 (= result!8781 tp_is_empty!16603)))

(assert (=> b!860887 t!23518))

(declare-fun b_and!23925 () Bool)

(assert (= b_and!23923 (and (=> t!23518 result!8781) b_and!23925)))

(declare-fun m!802043 () Bool)

(assert (=> b!860879 m!802043))

(declare-fun m!802045 () Bool)

(assert (=> mapNonEmpty!26504 m!802045))

(declare-fun m!802047 () Bool)

(assert (=> b!860888 m!802047))

(declare-fun m!802049 () Bool)

(assert (=> b!860888 m!802049))

(declare-fun m!802051 () Bool)

(assert (=> b!860888 m!802051))

(declare-fun m!802053 () Bool)

(assert (=> b!860888 m!802053))

(declare-fun m!802055 () Bool)

(assert (=> b!860890 m!802055))

(declare-fun m!802057 () Bool)

(assert (=> b!860890 m!802057))

(declare-fun m!802059 () Bool)

(assert (=> b!860890 m!802059))

(declare-fun m!802061 () Bool)

(assert (=> b!860887 m!802061))

(declare-fun m!802063 () Bool)

(assert (=> b!860887 m!802063))

(declare-fun m!802065 () Bool)

(assert (=> b!860887 m!802065))

(declare-fun m!802067 () Bool)

(assert (=> b!860887 m!802067))

(assert (=> b!860887 m!802063))

(declare-fun m!802069 () Bool)

(assert (=> b!860887 m!802069))

(assert (=> b!860887 m!802065))

(declare-fun m!802071 () Bool)

(assert (=> b!860881 m!802071))

(declare-fun m!802073 () Bool)

(assert (=> start!73720 m!802073))

(declare-fun m!802075 () Bool)

(assert (=> start!73720 m!802075))

(declare-fun m!802077 () Bool)

(assert (=> b!860886 m!802077))

(declare-fun m!802079 () Bool)

(assert (=> b!860884 m!802079))

(declare-fun m!802081 () Bool)

(assert (=> b!860875 m!802081))

(declare-fun m!802083 () Bool)

(assert (=> b!860876 m!802083))

(declare-fun m!802085 () Bool)

(assert (=> b!860891 m!802085))

(declare-fun m!802087 () Bool)

(assert (=> b!860880 m!802087))

(declare-fun m!802089 () Bool)

(assert (=> b!860885 m!802089))

(assert (=> b!860885 m!802069))

(declare-fun m!802091 () Bool)

(assert (=> b!860885 m!802091))

(assert (=> b!860885 m!802069))

(declare-fun m!802093 () Bool)

(assert (=> b!860885 m!802093))

(declare-fun m!802095 () Bool)

(assert (=> b!860885 m!802095))

(declare-fun m!802097 () Bool)

(assert (=> b!860885 m!802097))

(check-sat (not b!860884) (not b_lambda!11833) (not b!860890) (not b!860891) (not b!860885) (not b!860876) (not b!860886) b_and!23925 (not b!860879) (not b!860888) (not b!860887) (not b!860875) (not start!73720) (not b_next!14467) (not mapNonEmpty!26504) (not b!860881) tp_is_empty!16603)
(check-sat b_and!23925 (not b_next!14467))
