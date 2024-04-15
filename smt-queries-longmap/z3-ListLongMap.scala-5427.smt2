; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72328 () Bool)

(assert start!72328)

(declare-fun b_free!13531 () Bool)

(declare-fun b_next!13531 () Bool)

(assert (=> start!72328 (= b_free!13531 (not b_next!13531))))

(declare-fun tp!47693 () Bool)

(declare-fun b_and!22591 () Bool)

(assert (=> start!72328 (= tp!47693 b_and!22591)))

(declare-fun b!837927 () Bool)

(declare-fun e!467745 () Bool)

(declare-fun tp_is_empty!15397 () Bool)

(assert (=> b!837927 (= e!467745 tp_is_empty!15397)))

(declare-fun b!837928 () Bool)

(declare-fun res!569852 () Bool)

(declare-fun e!467748 () Bool)

(assert (=> b!837928 (=> (not res!569852) (not e!467748))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837928 (= res!569852 (validKeyInArray!0 k0!854))))

(declare-fun b!837929 () Bool)

(declare-fun e!467746 () Bool)

(declare-datatypes ((V!25577 0))(
  ( (V!25578 (val!7746 Int)) )
))
(declare-datatypes ((tuple2!10252 0))(
  ( (tuple2!10253 (_1!5137 (_ BitVec 64)) (_2!5137 V!25577)) )
))
(declare-datatypes ((List!16048 0))(
  ( (Nil!16045) (Cons!16044 (h!17175 tuple2!10252) (t!22410 List!16048)) )
))
(declare-datatypes ((ListLongMap!9011 0))(
  ( (ListLongMap!9012 (toList!4521 List!16048)) )
))
(declare-fun call!36801 () ListLongMap!9011)

(declare-fun call!36800 () ListLongMap!9011)

(assert (=> b!837929 (= e!467746 (= call!36801 call!36800))))

(declare-fun b!837931 () Bool)

(declare-fun res!569858 () Bool)

(assert (=> b!837931 (=> (not res!569858) (not e!467748))))

(declare-datatypes ((array!47055 0))(
  ( (array!47056 (arr!22559 (Array (_ BitVec 32) (_ BitVec 64))) (size!23001 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47055)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47055 (_ BitVec 32)) Bool)

(assert (=> b!837931 (= res!569858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837932 () Bool)

(declare-fun res!569854 () Bool)

(assert (=> b!837932 (=> (not res!569854) (not e!467748))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!837932 (= res!569854 (and (= (select (arr!22559 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23001 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24695 () Bool)

(declare-fun mapRes!24695 () Bool)

(assert (=> mapIsEmpty!24695 mapRes!24695))

(declare-fun v!557 () V!25577)

(declare-fun b!837933 () Bool)

(declare-fun +!2026 (ListLongMap!9011 tuple2!10252) ListLongMap!9011)

(assert (=> b!837933 (= e!467746 (= call!36801 (+!2026 call!36800 (tuple2!10253 k0!854 v!557))))))

(declare-fun b!837934 () Bool)

(declare-fun res!569853 () Bool)

(assert (=> b!837934 (=> (not res!569853) (not e!467748))))

(declare-datatypes ((List!16049 0))(
  ( (Nil!16046) (Cons!16045 (h!17176 (_ BitVec 64)) (t!22411 List!16049)) )
))
(declare-fun arrayNoDuplicates!0 (array!47055 (_ BitVec 32) List!16049) Bool)

(assert (=> b!837934 (= res!569853 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16046))))

(declare-fun b!837930 () Bool)

(declare-fun e!467744 () Bool)

(declare-fun e!467747 () Bool)

(assert (=> b!837930 (= e!467744 (and e!467747 mapRes!24695))))

(declare-fun condMapEmpty!24695 () Bool)

(declare-datatypes ((ValueCell!7259 0))(
  ( (ValueCellFull!7259 (v!10165 V!25577)) (EmptyCell!7259) )
))
(declare-datatypes ((array!47057 0))(
  ( (array!47058 (arr!22560 (Array (_ BitVec 32) ValueCell!7259)) (size!23002 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47057)

(declare-fun mapDefault!24695 () ValueCell!7259)

(assert (=> b!837930 (= condMapEmpty!24695 (= (arr!22560 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7259)) mapDefault!24695)))))

(declare-fun res!569857 () Bool)

(assert (=> start!72328 (=> (not res!569857) (not e!467748))))

(assert (=> start!72328 (= res!569857 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23001 _keys!868))))))

(assert (=> start!72328 e!467748))

(assert (=> start!72328 tp_is_empty!15397))

(assert (=> start!72328 true))

(assert (=> start!72328 tp!47693))

(declare-fun array_inv!18044 (array!47055) Bool)

(assert (=> start!72328 (array_inv!18044 _keys!868)))

(declare-fun array_inv!18045 (array!47057) Bool)

(assert (=> start!72328 (and (array_inv!18045 _values!688) e!467744)))

(declare-fun b!837935 () Bool)

(declare-fun res!569855 () Bool)

(assert (=> b!837935 (=> (not res!569855) (not e!467748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837935 (= res!569855 (validMask!0 mask!1196))))

(declare-fun bm!36797 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25577)

(declare-fun zeroValue!654 () V!25577)

(declare-fun getCurrentListMapNoExtraKeys!2542 (array!47055 array!47057 (_ BitVec 32) (_ BitVec 32) V!25577 V!25577 (_ BitVec 32) Int) ListLongMap!9011)

(assert (=> bm!36797 (= call!36800 (getCurrentListMapNoExtraKeys!2542 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!36798 () Bool)

(assert (=> bm!36798 (= call!36801 (getCurrentListMapNoExtraKeys!2542 _keys!868 (array!47058 (store (arr!22560 _values!688) i!612 (ValueCellFull!7259 v!557)) (size!23002 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!837936 () Bool)

(declare-fun res!569859 () Bool)

(assert (=> b!837936 (=> (not res!569859) (not e!467748))))

(assert (=> b!837936 (= res!569859 (and (= (size!23002 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23001 _keys!868) (size!23002 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837937 () Bool)

(assert (=> b!837937 (= e!467748 (not true))))

(assert (=> b!837937 e!467746))

(declare-fun c!91091 () Bool)

(assert (=> b!837937 (= c!91091 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28733 0))(
  ( (Unit!28734) )
))
(declare-fun lt!380426 () Unit!28733)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!241 (array!47055 array!47057 (_ BitVec 32) (_ BitVec 32) V!25577 V!25577 (_ BitVec 32) (_ BitVec 64) V!25577 (_ BitVec 32) Int) Unit!28733)

(assert (=> b!837937 (= lt!380426 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!241 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!837938 () Bool)

(declare-fun res!569856 () Bool)

(assert (=> b!837938 (=> (not res!569856) (not e!467748))))

(assert (=> b!837938 (= res!569856 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23001 _keys!868))))))

(declare-fun b!837939 () Bool)

(assert (=> b!837939 (= e!467747 tp_is_empty!15397)))

(declare-fun mapNonEmpty!24695 () Bool)

(declare-fun tp!47692 () Bool)

(assert (=> mapNonEmpty!24695 (= mapRes!24695 (and tp!47692 e!467745))))

(declare-fun mapRest!24695 () (Array (_ BitVec 32) ValueCell!7259))

(declare-fun mapValue!24695 () ValueCell!7259)

(declare-fun mapKey!24695 () (_ BitVec 32))

(assert (=> mapNonEmpty!24695 (= (arr!22560 _values!688) (store mapRest!24695 mapKey!24695 mapValue!24695))))

(assert (= (and start!72328 res!569857) b!837935))

(assert (= (and b!837935 res!569855) b!837936))

(assert (= (and b!837936 res!569859) b!837931))

(assert (= (and b!837931 res!569858) b!837934))

(assert (= (and b!837934 res!569853) b!837938))

(assert (= (and b!837938 res!569856) b!837928))

(assert (= (and b!837928 res!569852) b!837932))

(assert (= (and b!837932 res!569854) b!837937))

(assert (= (and b!837937 c!91091) b!837933))

(assert (= (and b!837937 (not c!91091)) b!837929))

(assert (= (or b!837933 b!837929) bm!36798))

(assert (= (or b!837933 b!837929) bm!36797))

(assert (= (and b!837930 condMapEmpty!24695) mapIsEmpty!24695))

(assert (= (and b!837930 (not condMapEmpty!24695)) mapNonEmpty!24695))

(get-info :version)

(assert (= (and mapNonEmpty!24695 ((_ is ValueCellFull!7259) mapValue!24695)) b!837927))

(assert (= (and b!837930 ((_ is ValueCellFull!7259) mapDefault!24695)) b!837939))

(assert (= start!72328 b!837930))

(declare-fun m!781943 () Bool)

(assert (=> b!837934 m!781943))

(declare-fun m!781945 () Bool)

(assert (=> b!837933 m!781945))

(declare-fun m!781947 () Bool)

(assert (=> b!837935 m!781947))

(declare-fun m!781949 () Bool)

(assert (=> bm!36797 m!781949))

(declare-fun m!781951 () Bool)

(assert (=> bm!36798 m!781951))

(declare-fun m!781953 () Bool)

(assert (=> bm!36798 m!781953))

(declare-fun m!781955 () Bool)

(assert (=> mapNonEmpty!24695 m!781955))

(declare-fun m!781957 () Bool)

(assert (=> b!837937 m!781957))

(declare-fun m!781959 () Bool)

(assert (=> b!837931 m!781959))

(declare-fun m!781961 () Bool)

(assert (=> b!837928 m!781961))

(declare-fun m!781963 () Bool)

(assert (=> b!837932 m!781963))

(declare-fun m!781965 () Bool)

(assert (=> start!72328 m!781965))

(declare-fun m!781967 () Bool)

(assert (=> start!72328 m!781967))

(check-sat (not b!837933) (not b!837935) (not b!837937) (not b!837928) b_and!22591 (not b!837934) (not b_next!13531) (not mapNonEmpty!24695) (not bm!36797) (not start!72328) tp_is_empty!15397 (not b!837931) (not bm!36798))
(check-sat b_and!22591 (not b_next!13531))
