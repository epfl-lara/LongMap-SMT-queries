; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75000 () Bool)

(assert start!75000)

(declare-fun b_free!15489 () Bool)

(declare-fun b_next!15489 () Bool)

(assert (=> start!75000 (= b_free!15489 (not b_next!15489))))

(declare-fun tp!54172 () Bool)

(declare-fun b_and!25679 () Bool)

(assert (=> start!75000 (= tp!54172 b_and!25679)))

(declare-fun b!884788 () Bool)

(declare-fun res!601075 () Bool)

(declare-fun e!492391 () Bool)

(assert (=> b!884788 (=> (not res!601075) (not e!492391))))

(declare-datatypes ((array!51590 0))(
  ( (array!51591 (arr!24813 (Array (_ BitVec 32) (_ BitVec 64))) (size!25253 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51590)

(declare-datatypes ((List!17628 0))(
  ( (Nil!17625) (Cons!17624 (h!18755 (_ BitVec 64)) (t!24903 List!17628)) )
))
(declare-fun arrayNoDuplicates!0 (array!51590 (_ BitVec 32) List!17628) Bool)

(assert (=> b!884788 (= res!601075 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17625))))

(declare-datatypes ((V!28691 0))(
  ( (V!28692 (val!8914 Int)) )
))
(declare-datatypes ((tuple2!11822 0))(
  ( (tuple2!11823 (_1!5922 (_ BitVec 64)) (_2!5922 V!28691)) )
))
(declare-fun lt!400790 () tuple2!11822)

(declare-datatypes ((List!17629 0))(
  ( (Nil!17626) (Cons!17625 (h!18756 tuple2!11822) (t!24904 List!17629)) )
))
(declare-datatypes ((ListLongMap!10591 0))(
  ( (ListLongMap!10592 (toList!5311 List!17629)) )
))
(declare-fun lt!400791 () ListLongMap!10591)

(declare-fun lt!400794 () ListLongMap!10591)

(declare-fun e!492394 () Bool)

(declare-fun b!884789 () Bool)

(declare-fun +!2579 (ListLongMap!10591 tuple2!11822) ListLongMap!10591)

(assert (=> b!884789 (= e!492394 (= lt!400794 (+!2579 lt!400791 lt!400790)))))

(declare-fun res!601076 () Bool)

(assert (=> start!75000 (=> (not res!601076) (not e!492391))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!75000 (= res!601076 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25253 _keys!868))))))

(assert (=> start!75000 e!492391))

(declare-fun tp_is_empty!17733 () Bool)

(assert (=> start!75000 tp_is_empty!17733))

(assert (=> start!75000 true))

(assert (=> start!75000 tp!54172))

(declare-fun array_inv!19536 (array!51590) Bool)

(assert (=> start!75000 (array_inv!19536 _keys!868)))

(declare-datatypes ((ValueCell!8427 0))(
  ( (ValueCellFull!8427 (v!11387 V!28691)) (EmptyCell!8427) )
))
(declare-datatypes ((array!51592 0))(
  ( (array!51593 (arr!24814 (Array (_ BitVec 32) ValueCell!8427)) (size!25254 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51592)

(declare-fun e!492390 () Bool)

(declare-fun array_inv!19537 (array!51592) Bool)

(assert (=> start!75000 (and (array_inv!19537 _values!688) e!492390)))

(declare-fun b!884790 () Bool)

(declare-fun e!492395 () Bool)

(assert (=> b!884790 (= e!492395 tp_is_empty!17733)))

(declare-fun b!884791 () Bool)

(declare-fun mapRes!28239 () Bool)

(assert (=> b!884791 (= e!492390 (and e!492395 mapRes!28239))))

(declare-fun condMapEmpty!28239 () Bool)

(declare-fun mapDefault!28239 () ValueCell!8427)

(assert (=> b!884791 (= condMapEmpty!28239 (= (arr!24814 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8427)) mapDefault!28239)))))

(declare-fun b!884792 () Bool)

(declare-fun e!492392 () Bool)

(assert (=> b!884792 (= e!492392 (not e!492394))))

(declare-fun res!601067 () Bool)

(assert (=> b!884792 (=> res!601067 e!492394)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884792 (= res!601067 (validKeyInArray!0 (select (arr!24813 _keys!868) from!1053)))))

(declare-fun lt!400793 () array!51592)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28691)

(declare-fun zeroValue!654 () V!28691)

(declare-fun getCurrentListMapNoExtraKeys!3269 (array!51590 array!51592 (_ BitVec 32) (_ BitVec 32) V!28691 V!28691 (_ BitVec 32) Int) ListLongMap!10591)

(assert (=> b!884792 (= (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2579 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400790))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!28691)

(assert (=> b!884792 (= lt!400790 (tuple2!11823 k0!854 v!557))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30212 0))(
  ( (Unit!30213) )
))
(declare-fun lt!400792 () Unit!30212)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!761 (array!51590 array!51592 (_ BitVec 32) (_ BitVec 32) V!28691 V!28691 (_ BitVec 32) (_ BitVec 64) V!28691 (_ BitVec 32) Int) Unit!30212)

(assert (=> b!884792 (= lt!400792 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!761 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884793 () Bool)

(assert (=> b!884793 (= e!492391 e!492392)))

(declare-fun res!601072 () Bool)

(assert (=> b!884793 (=> (not res!601072) (not e!492392))))

(assert (=> b!884793 (= res!601072 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884793 (= lt!400794 (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884793 (= lt!400793 (array!51593 (store (arr!24814 _values!688) i!612 (ValueCellFull!8427 v!557)) (size!25254 _values!688)))))

(assert (=> b!884793 (= lt!400791 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!28239 () Bool)

(declare-fun tp!54173 () Bool)

(declare-fun e!492389 () Bool)

(assert (=> mapNonEmpty!28239 (= mapRes!28239 (and tp!54173 e!492389))))

(declare-fun mapValue!28239 () ValueCell!8427)

(declare-fun mapRest!28239 () (Array (_ BitVec 32) ValueCell!8427))

(declare-fun mapKey!28239 () (_ BitVec 32))

(assert (=> mapNonEmpty!28239 (= (arr!24814 _values!688) (store mapRest!28239 mapKey!28239 mapValue!28239))))

(declare-fun b!884794 () Bool)

(declare-fun res!601071 () Bool)

(assert (=> b!884794 (=> (not res!601071) (not e!492391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884794 (= res!601071 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28239 () Bool)

(assert (=> mapIsEmpty!28239 mapRes!28239))

(declare-fun b!884795 () Bool)

(assert (=> b!884795 (= e!492389 tp_is_empty!17733)))

(declare-fun b!884796 () Bool)

(declare-fun res!601073 () Bool)

(assert (=> b!884796 (=> (not res!601073) (not e!492391))))

(assert (=> b!884796 (= res!601073 (and (= (size!25254 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25253 _keys!868) (size!25254 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884797 () Bool)

(declare-fun res!601068 () Bool)

(assert (=> b!884797 (=> (not res!601068) (not e!492391))))

(assert (=> b!884797 (= res!601068 (validKeyInArray!0 k0!854))))

(declare-fun b!884798 () Bool)

(declare-fun res!601074 () Bool)

(assert (=> b!884798 (=> (not res!601074) (not e!492391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51590 (_ BitVec 32)) Bool)

(assert (=> b!884798 (= res!601074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884799 () Bool)

(declare-fun res!601070 () Bool)

(assert (=> b!884799 (=> (not res!601070) (not e!492391))))

(assert (=> b!884799 (= res!601070 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25253 _keys!868))))))

(declare-fun b!884800 () Bool)

(declare-fun res!601069 () Bool)

(assert (=> b!884800 (=> (not res!601069) (not e!492391))))

(assert (=> b!884800 (= res!601069 (and (= (select (arr!24813 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!75000 res!601076) b!884794))

(assert (= (and b!884794 res!601071) b!884796))

(assert (= (and b!884796 res!601073) b!884798))

(assert (= (and b!884798 res!601074) b!884788))

(assert (= (and b!884788 res!601075) b!884799))

(assert (= (and b!884799 res!601070) b!884797))

(assert (= (and b!884797 res!601068) b!884800))

(assert (= (and b!884800 res!601069) b!884793))

(assert (= (and b!884793 res!601072) b!884792))

(assert (= (and b!884792 (not res!601067)) b!884789))

(assert (= (and b!884791 condMapEmpty!28239) mapIsEmpty!28239))

(assert (= (and b!884791 (not condMapEmpty!28239)) mapNonEmpty!28239))

(get-info :version)

(assert (= (and mapNonEmpty!28239 ((_ is ValueCellFull!8427) mapValue!28239)) b!884795))

(assert (= (and b!884791 ((_ is ValueCellFull!8427) mapDefault!28239)) b!884790))

(assert (= start!75000 b!884791))

(declare-fun m!825007 () Bool)

(assert (=> b!884794 m!825007))

(declare-fun m!825009 () Bool)

(assert (=> b!884798 m!825009))

(declare-fun m!825011 () Bool)

(assert (=> start!75000 m!825011))

(declare-fun m!825013 () Bool)

(assert (=> start!75000 m!825013))

(declare-fun m!825015 () Bool)

(assert (=> b!884797 m!825015))

(declare-fun m!825017 () Bool)

(assert (=> b!884793 m!825017))

(declare-fun m!825019 () Bool)

(assert (=> b!884793 m!825019))

(declare-fun m!825021 () Bool)

(assert (=> b!884793 m!825021))

(declare-fun m!825023 () Bool)

(assert (=> b!884792 m!825023))

(assert (=> b!884792 m!825023))

(declare-fun m!825025 () Bool)

(assert (=> b!884792 m!825025))

(declare-fun m!825027 () Bool)

(assert (=> b!884792 m!825027))

(declare-fun m!825029 () Bool)

(assert (=> b!884792 m!825029))

(assert (=> b!884792 m!825027))

(declare-fun m!825031 () Bool)

(assert (=> b!884792 m!825031))

(declare-fun m!825033 () Bool)

(assert (=> b!884792 m!825033))

(declare-fun m!825035 () Bool)

(assert (=> b!884789 m!825035))

(declare-fun m!825037 () Bool)

(assert (=> mapNonEmpty!28239 m!825037))

(declare-fun m!825039 () Bool)

(assert (=> b!884788 m!825039))

(declare-fun m!825041 () Bool)

(assert (=> b!884800 m!825041))

(check-sat (not b_next!15489) tp_is_empty!17733 (not b!884798) (not start!75000) (not b!884788) (not mapNonEmpty!28239) (not b!884789) (not b!884793) (not b!884794) (not b!884792) b_and!25679 (not b!884797))
(check-sat b_and!25679 (not b_next!15489))
(get-model)

(declare-fun d!109261 () Bool)

(assert (=> d!109261 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!884794 d!109261))

(declare-fun b!884864 () Bool)

(declare-fun e!492433 () Bool)

(declare-fun e!492435 () Bool)

(assert (=> b!884864 (= e!492433 e!492435)))

(declare-fun c!93161 () Bool)

(assert (=> b!884864 (= c!93161 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(declare-fun b!884865 () Bool)

(declare-fun e!492431 () ListLongMap!10591)

(declare-fun e!492437 () ListLongMap!10591)

(assert (=> b!884865 (= e!492431 e!492437)))

(declare-fun c!93163 () Bool)

(assert (=> b!884865 (= c!93163 (validKeyInArray!0 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!109263 () Bool)

(declare-fun e!492432 () Bool)

(assert (=> d!109263 e!492432))

(declare-fun res!601116 () Bool)

(assert (=> d!109263 (=> (not res!601116) (not e!492432))))

(declare-fun lt!400829 () ListLongMap!10591)

(declare-fun contains!4281 (ListLongMap!10591 (_ BitVec 64)) Bool)

(assert (=> d!109263 (= res!601116 (not (contains!4281 lt!400829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109263 (= lt!400829 e!492431)))

(declare-fun c!93162 () Bool)

(assert (=> d!109263 (= c!93162 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (=> d!109263 (validMask!0 mask!1196)))

(assert (=> d!109263 (= (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400829)))

(declare-fun b!884866 () Bool)

(declare-fun e!492434 () Bool)

(assert (=> b!884866 (= e!492433 e!492434)))

(assert (=> b!884866 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(declare-fun res!601118 () Bool)

(assert (=> b!884866 (= res!601118 (contains!4281 lt!400829 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884866 (=> (not res!601118) (not e!492434))))

(declare-fun call!39007 () ListLongMap!10591)

(declare-fun bm!39004 () Bool)

(assert (=> bm!39004 (= call!39007 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884867 () Bool)

(assert (=> b!884867 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (=> b!884867 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25254 _values!688)))))

(declare-fun apply!386 (ListLongMap!10591 (_ BitVec 64)) V!28691)

(declare-fun get!13082 (ValueCell!8427 V!28691) V!28691)

(declare-fun dynLambda!1285 (Int (_ BitVec 64)) V!28691)

(assert (=> b!884867 (= e!492434 (= (apply!386 lt!400829 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13082 (select (arr!24814 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884868 () Bool)

(declare-fun isEmpty!673 (ListLongMap!10591) Bool)

(assert (=> b!884868 (= e!492435 (isEmpty!673 lt!400829))))

(declare-fun b!884869 () Bool)

(declare-fun e!492436 () Bool)

(assert (=> b!884869 (= e!492436 (validKeyInArray!0 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884869 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884870 () Bool)

(assert (=> b!884870 (= e!492431 (ListLongMap!10592 Nil!17626))))

(declare-fun b!884871 () Bool)

(assert (=> b!884871 (= e!492435 (= lt!400829 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884872 () Bool)

(declare-fun lt!400827 () Unit!30212)

(declare-fun lt!400826 () Unit!30212)

(assert (=> b!884872 (= lt!400827 lt!400826)))

(declare-fun lt!400830 () V!28691)

(declare-fun lt!400824 () (_ BitVec 64))

(declare-fun lt!400828 () (_ BitVec 64))

(declare-fun lt!400825 () ListLongMap!10591)

(assert (=> b!884872 (not (contains!4281 (+!2579 lt!400825 (tuple2!11823 lt!400828 lt!400830)) lt!400824))))

(declare-fun addStillNotContains!211 (ListLongMap!10591 (_ BitVec 64) V!28691 (_ BitVec 64)) Unit!30212)

(assert (=> b!884872 (= lt!400826 (addStillNotContains!211 lt!400825 lt!400828 lt!400830 lt!400824))))

(assert (=> b!884872 (= lt!400824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884872 (= lt!400830 (get!13082 (select (arr!24814 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884872 (= lt!400828 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!884872 (= lt!400825 call!39007)))

(assert (=> b!884872 (= e!492437 (+!2579 call!39007 (tuple2!11823 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13082 (select (arr!24814 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884873 () Bool)

(assert (=> b!884873 (= e!492437 call!39007)))

(declare-fun b!884874 () Bool)

(declare-fun res!601115 () Bool)

(assert (=> b!884874 (=> (not res!601115) (not e!492432))))

(assert (=> b!884874 (= res!601115 (not (contains!4281 lt!400829 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884875 () Bool)

(assert (=> b!884875 (= e!492432 e!492433)))

(declare-fun c!93164 () Bool)

(assert (=> b!884875 (= c!93164 e!492436)))

(declare-fun res!601117 () Bool)

(assert (=> b!884875 (=> (not res!601117) (not e!492436))))

(assert (=> b!884875 (= res!601117 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (= (and d!109263 c!93162) b!884870))

(assert (= (and d!109263 (not c!93162)) b!884865))

(assert (= (and b!884865 c!93163) b!884872))

(assert (= (and b!884865 (not c!93163)) b!884873))

(assert (= (or b!884872 b!884873) bm!39004))

(assert (= (and d!109263 res!601116) b!884874))

(assert (= (and b!884874 res!601115) b!884875))

(assert (= (and b!884875 res!601117) b!884869))

(assert (= (and b!884875 c!93164) b!884866))

(assert (= (and b!884875 (not c!93164)) b!884864))

(assert (= (and b!884866 res!601118) b!884867))

(assert (= (and b!884864 c!93161) b!884871))

(assert (= (and b!884864 (not c!93161)) b!884868))

(declare-fun b_lambda!12787 () Bool)

(assert (=> (not b_lambda!12787) (not b!884867)))

(declare-fun t!24908 () Bool)

(declare-fun tb!5133 () Bool)

(assert (=> (and start!75000 (= defaultEntry!696 defaultEntry!696) t!24908) tb!5133))

(declare-fun result!9903 () Bool)

(assert (=> tb!5133 (= result!9903 tp_is_empty!17733)))

(assert (=> b!884867 t!24908))

(declare-fun b_and!25683 () Bool)

(assert (= b_and!25679 (and (=> t!24908 result!9903) b_and!25683)))

(declare-fun b_lambda!12789 () Bool)

(assert (=> (not b_lambda!12789) (not b!884872)))

(assert (=> b!884872 t!24908))

(declare-fun b_and!25685 () Bool)

(assert (= b_and!25683 (and (=> t!24908 result!9903) b_and!25685)))

(declare-fun m!825079 () Bool)

(assert (=> d!109263 m!825079))

(assert (=> d!109263 m!825007))

(declare-fun m!825081 () Bool)

(assert (=> b!884874 m!825081))

(declare-fun m!825083 () Bool)

(assert (=> b!884865 m!825083))

(assert (=> b!884865 m!825083))

(declare-fun m!825085 () Bool)

(assert (=> b!884865 m!825085))

(declare-fun m!825087 () Bool)

(assert (=> b!884871 m!825087))

(assert (=> bm!39004 m!825087))

(assert (=> b!884866 m!825083))

(assert (=> b!884866 m!825083))

(declare-fun m!825089 () Bool)

(assert (=> b!884866 m!825089))

(declare-fun m!825091 () Bool)

(assert (=> b!884868 m!825091))

(assert (=> b!884872 m!825083))

(declare-fun m!825093 () Bool)

(assert (=> b!884872 m!825093))

(declare-fun m!825095 () Bool)

(assert (=> b!884872 m!825095))

(declare-fun m!825097 () Bool)

(assert (=> b!884872 m!825097))

(assert (=> b!884872 m!825095))

(declare-fun m!825099 () Bool)

(assert (=> b!884872 m!825099))

(declare-fun m!825101 () Bool)

(assert (=> b!884872 m!825101))

(declare-fun m!825103 () Bool)

(assert (=> b!884872 m!825103))

(assert (=> b!884872 m!825093))

(assert (=> b!884872 m!825099))

(declare-fun m!825105 () Bool)

(assert (=> b!884872 m!825105))

(assert (=> b!884869 m!825083))

(assert (=> b!884869 m!825083))

(assert (=> b!884869 m!825085))

(assert (=> b!884867 m!825083))

(assert (=> b!884867 m!825099))

(assert (=> b!884867 m!825093))

(assert (=> b!884867 m!825099))

(assert (=> b!884867 m!825105))

(assert (=> b!884867 m!825093))

(assert (=> b!884867 m!825083))

(declare-fun m!825107 () Bool)

(assert (=> b!884867 m!825107))

(assert (=> b!884792 d!109263))

(declare-fun d!109265 () Bool)

(assert (=> d!109265 (= (validKeyInArray!0 (select (arr!24813 _keys!868) from!1053)) (and (not (= (select (arr!24813 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24813 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884792 d!109265))

(declare-fun b!884878 () Bool)

(declare-fun e!492440 () Bool)

(declare-fun e!492442 () Bool)

(assert (=> b!884878 (= e!492440 e!492442)))

(declare-fun c!93165 () Bool)

(assert (=> b!884878 (= c!93165 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(declare-fun b!884879 () Bool)

(declare-fun e!492438 () ListLongMap!10591)

(declare-fun e!492444 () ListLongMap!10591)

(assert (=> b!884879 (= e!492438 e!492444)))

(declare-fun c!93167 () Bool)

(assert (=> b!884879 (= c!93167 (validKeyInArray!0 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!109267 () Bool)

(declare-fun e!492439 () Bool)

(assert (=> d!109267 e!492439))

(declare-fun res!601120 () Bool)

(assert (=> d!109267 (=> (not res!601120) (not e!492439))))

(declare-fun lt!400836 () ListLongMap!10591)

(assert (=> d!109267 (= res!601120 (not (contains!4281 lt!400836 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109267 (= lt!400836 e!492438)))

(declare-fun c!93166 () Bool)

(assert (=> d!109267 (= c!93166 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (=> d!109267 (validMask!0 mask!1196)))

(assert (=> d!109267 (= (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400836)))

(declare-fun b!884880 () Bool)

(declare-fun e!492441 () Bool)

(assert (=> b!884880 (= e!492440 e!492441)))

(assert (=> b!884880 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(declare-fun res!601122 () Bool)

(assert (=> b!884880 (= res!601122 (contains!4281 lt!400836 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884880 (=> (not res!601122) (not e!492441))))

(declare-fun call!39008 () ListLongMap!10591)

(declare-fun bm!39005 () Bool)

(assert (=> bm!39005 (= call!39008 (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884881 () Bool)

(assert (=> b!884881 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (=> b!884881 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25254 lt!400793)))))

(assert (=> b!884881 (= e!492441 (= (apply!386 lt!400836 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13082 (select (arr!24814 lt!400793) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884882 () Bool)

(assert (=> b!884882 (= e!492442 (isEmpty!673 lt!400836))))

(declare-fun b!884883 () Bool)

(declare-fun e!492443 () Bool)

(assert (=> b!884883 (= e!492443 (validKeyInArray!0 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884883 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884884 () Bool)

(assert (=> b!884884 (= e!492438 (ListLongMap!10592 Nil!17626))))

(declare-fun b!884885 () Bool)

(assert (=> b!884885 (= e!492442 (= lt!400836 (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884886 () Bool)

(declare-fun lt!400834 () Unit!30212)

(declare-fun lt!400833 () Unit!30212)

(assert (=> b!884886 (= lt!400834 lt!400833)))

(declare-fun lt!400835 () (_ BitVec 64))

(declare-fun lt!400832 () ListLongMap!10591)

(declare-fun lt!400837 () V!28691)

(declare-fun lt!400831 () (_ BitVec 64))

(assert (=> b!884886 (not (contains!4281 (+!2579 lt!400832 (tuple2!11823 lt!400835 lt!400837)) lt!400831))))

(assert (=> b!884886 (= lt!400833 (addStillNotContains!211 lt!400832 lt!400835 lt!400837 lt!400831))))

(assert (=> b!884886 (= lt!400831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884886 (= lt!400837 (get!13082 (select (arr!24814 lt!400793) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884886 (= lt!400835 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!884886 (= lt!400832 call!39008)))

(assert (=> b!884886 (= e!492444 (+!2579 call!39008 (tuple2!11823 (select (arr!24813 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13082 (select (arr!24814 lt!400793) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884887 () Bool)

(assert (=> b!884887 (= e!492444 call!39008)))

(declare-fun b!884888 () Bool)

(declare-fun res!601119 () Bool)

(assert (=> b!884888 (=> (not res!601119) (not e!492439))))

(assert (=> b!884888 (= res!601119 (not (contains!4281 lt!400836 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884889 () Bool)

(assert (=> b!884889 (= e!492439 e!492440)))

(declare-fun c!93168 () Bool)

(assert (=> b!884889 (= c!93168 e!492443)))

(declare-fun res!601121 () Bool)

(assert (=> b!884889 (=> (not res!601121) (not e!492443))))

(assert (=> b!884889 (= res!601121 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (= (and d!109267 c!93166) b!884884))

(assert (= (and d!109267 (not c!93166)) b!884879))

(assert (= (and b!884879 c!93167) b!884886))

(assert (= (and b!884879 (not c!93167)) b!884887))

(assert (= (or b!884886 b!884887) bm!39005))

(assert (= (and d!109267 res!601120) b!884888))

(assert (= (and b!884888 res!601119) b!884889))

(assert (= (and b!884889 res!601121) b!884883))

(assert (= (and b!884889 c!93168) b!884880))

(assert (= (and b!884889 (not c!93168)) b!884878))

(assert (= (and b!884880 res!601122) b!884881))

(assert (= (and b!884878 c!93165) b!884885))

(assert (= (and b!884878 (not c!93165)) b!884882))

(declare-fun b_lambda!12791 () Bool)

(assert (=> (not b_lambda!12791) (not b!884881)))

(assert (=> b!884881 t!24908))

(declare-fun b_and!25687 () Bool)

(assert (= b_and!25685 (and (=> t!24908 result!9903) b_and!25687)))

(declare-fun b_lambda!12793 () Bool)

(assert (=> (not b_lambda!12793) (not b!884886)))

(assert (=> b!884886 t!24908))

(declare-fun b_and!25689 () Bool)

(assert (= b_and!25687 (and (=> t!24908 result!9903) b_and!25689)))

(declare-fun m!825109 () Bool)

(assert (=> d!109267 m!825109))

(assert (=> d!109267 m!825007))

(declare-fun m!825111 () Bool)

(assert (=> b!884888 m!825111))

(assert (=> b!884879 m!825083))

(assert (=> b!884879 m!825083))

(assert (=> b!884879 m!825085))

(declare-fun m!825113 () Bool)

(assert (=> b!884885 m!825113))

(assert (=> bm!39005 m!825113))

(assert (=> b!884880 m!825083))

(assert (=> b!884880 m!825083))

(declare-fun m!825115 () Bool)

(assert (=> b!884880 m!825115))

(declare-fun m!825117 () Bool)

(assert (=> b!884882 m!825117))

(assert (=> b!884886 m!825083))

(declare-fun m!825119 () Bool)

(assert (=> b!884886 m!825119))

(declare-fun m!825121 () Bool)

(assert (=> b!884886 m!825121))

(declare-fun m!825123 () Bool)

(assert (=> b!884886 m!825123))

(assert (=> b!884886 m!825121))

(assert (=> b!884886 m!825099))

(declare-fun m!825125 () Bool)

(assert (=> b!884886 m!825125))

(declare-fun m!825127 () Bool)

(assert (=> b!884886 m!825127))

(assert (=> b!884886 m!825119))

(assert (=> b!884886 m!825099))

(declare-fun m!825129 () Bool)

(assert (=> b!884886 m!825129))

(assert (=> b!884883 m!825083))

(assert (=> b!884883 m!825083))

(assert (=> b!884883 m!825085))

(assert (=> b!884881 m!825083))

(assert (=> b!884881 m!825099))

(assert (=> b!884881 m!825119))

(assert (=> b!884881 m!825099))

(assert (=> b!884881 m!825129))

(assert (=> b!884881 m!825119))

(assert (=> b!884881 m!825083))

(declare-fun m!825131 () Bool)

(assert (=> b!884881 m!825131))

(assert (=> b!884792 d!109267))

(declare-fun bm!39010 () Bool)

(declare-fun call!39014 () ListLongMap!10591)

(assert (=> bm!39010 (= call!39014 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!39011 () Bool)

(declare-fun call!39013 () ListLongMap!10591)

(assert (=> bm!39011 (= call!39013 (getCurrentListMapNoExtraKeys!3269 _keys!868 (array!51593 (store (arr!24814 _values!688) i!612 (ValueCellFull!8427 v!557)) (size!25254 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884896 () Bool)

(declare-fun e!492450 () Bool)

(assert (=> b!884896 (= e!492450 (= call!39013 call!39014))))

(declare-fun b!884897 () Bool)

(assert (=> b!884897 (= e!492450 (= call!39013 (+!2579 call!39014 (tuple2!11823 k0!854 v!557))))))

(declare-fun d!109269 () Bool)

(declare-fun e!492449 () Bool)

(assert (=> d!109269 e!492449))

(declare-fun res!601125 () Bool)

(assert (=> d!109269 (=> (not res!601125) (not e!492449))))

(assert (=> d!109269 (= res!601125 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25254 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25254 _values!688))))))))

(declare-fun lt!400840 () Unit!30212)

(declare-fun choose!1443 (array!51590 array!51592 (_ BitVec 32) (_ BitVec 32) V!28691 V!28691 (_ BitVec 32) (_ BitVec 64) V!28691 (_ BitVec 32) Int) Unit!30212)

(assert (=> d!109269 (= lt!400840 (choose!1443 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25253 _keys!868)))))

(assert (=> d!109269 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!761 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400840)))

(declare-fun b!884898 () Bool)

(assert (=> b!884898 (= e!492449 e!492450)))

(declare-fun c!93171 () Bool)

(assert (=> b!884898 (= c!93171 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!109269 res!601125) b!884898))

(assert (= (and b!884898 c!93171) b!884897))

(assert (= (and b!884898 (not c!93171)) b!884896))

(assert (= (or b!884897 b!884896) bm!39010))

(assert (= (or b!884897 b!884896) bm!39011))

(assert (=> bm!39010 m!825023))

(assert (=> bm!39011 m!825019))

(declare-fun m!825133 () Bool)

(assert (=> bm!39011 m!825133))

(declare-fun m!825135 () Bool)

(assert (=> b!884897 m!825135))

(declare-fun m!825137 () Bool)

(assert (=> d!109269 m!825137))

(assert (=> b!884792 d!109269))

(declare-fun d!109271 () Bool)

(declare-fun e!492453 () Bool)

(assert (=> d!109271 e!492453))

(declare-fun res!601131 () Bool)

(assert (=> d!109271 (=> (not res!601131) (not e!492453))))

(declare-fun lt!400850 () ListLongMap!10591)

(assert (=> d!109271 (= res!601131 (contains!4281 lt!400850 (_1!5922 lt!400790)))))

(declare-fun lt!400852 () List!17629)

(assert (=> d!109271 (= lt!400850 (ListLongMap!10592 lt!400852))))

(declare-fun lt!400849 () Unit!30212)

(declare-fun lt!400851 () Unit!30212)

(assert (=> d!109271 (= lt!400849 lt!400851)))

(declare-datatypes ((Option!434 0))(
  ( (Some!433 (v!11392 V!28691)) (None!432) )
))
(declare-fun getValueByKey!428 (List!17629 (_ BitVec 64)) Option!434)

(assert (=> d!109271 (= (getValueByKey!428 lt!400852 (_1!5922 lt!400790)) (Some!433 (_2!5922 lt!400790)))))

(declare-fun lemmaContainsTupThenGetReturnValue!242 (List!17629 (_ BitVec 64) V!28691) Unit!30212)

(assert (=> d!109271 (= lt!400851 (lemmaContainsTupThenGetReturnValue!242 lt!400852 (_1!5922 lt!400790) (_2!5922 lt!400790)))))

(declare-fun insertStrictlySorted!281 (List!17629 (_ BitVec 64) V!28691) List!17629)

(assert (=> d!109271 (= lt!400852 (insertStrictlySorted!281 (toList!5311 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696)) (_1!5922 lt!400790) (_2!5922 lt!400790)))))

(assert (=> d!109271 (= (+!2579 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400790) lt!400850)))

(declare-fun b!884903 () Bool)

(declare-fun res!601130 () Bool)

(assert (=> b!884903 (=> (not res!601130) (not e!492453))))

(assert (=> b!884903 (= res!601130 (= (getValueByKey!428 (toList!5311 lt!400850) (_1!5922 lt!400790)) (Some!433 (_2!5922 lt!400790))))))

(declare-fun b!884904 () Bool)

(declare-fun contains!4282 (List!17629 tuple2!11822) Bool)

(assert (=> b!884904 (= e!492453 (contains!4282 (toList!5311 lt!400850) lt!400790))))

(assert (= (and d!109271 res!601131) b!884903))

(assert (= (and b!884903 res!601130) b!884904))

(declare-fun m!825139 () Bool)

(assert (=> d!109271 m!825139))

(declare-fun m!825141 () Bool)

(assert (=> d!109271 m!825141))

(declare-fun m!825143 () Bool)

(assert (=> d!109271 m!825143))

(declare-fun m!825145 () Bool)

(assert (=> d!109271 m!825145))

(declare-fun m!825147 () Bool)

(assert (=> b!884903 m!825147))

(declare-fun m!825149 () Bool)

(assert (=> b!884904 m!825149))

(assert (=> b!884792 d!109271))

(declare-fun b!884915 () Bool)

(declare-fun e!492464 () Bool)

(declare-fun contains!4283 (List!17628 (_ BitVec 64)) Bool)

(assert (=> b!884915 (= e!492464 (contains!4283 Nil!17625 (select (arr!24813 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884916 () Bool)

(declare-fun e!492463 () Bool)

(declare-fun e!492465 () Bool)

(assert (=> b!884916 (= e!492463 e!492465)))

(declare-fun res!601138 () Bool)

(assert (=> b!884916 (=> (not res!601138) (not e!492465))))

(assert (=> b!884916 (= res!601138 (not e!492464))))

(declare-fun res!601140 () Bool)

(assert (=> b!884916 (=> (not res!601140) (not e!492464))))

(assert (=> b!884916 (= res!601140 (validKeyInArray!0 (select (arr!24813 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!39014 () Bool)

(declare-fun call!39017 () Bool)

(declare-fun c!93174 () Bool)

(assert (=> bm!39014 (= call!39017 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93174 (Cons!17624 (select (arr!24813 _keys!868) #b00000000000000000000000000000000) Nil!17625) Nil!17625)))))

(declare-fun b!884918 () Bool)

(declare-fun e!492462 () Bool)

(assert (=> b!884918 (= e!492465 e!492462)))

(assert (=> b!884918 (= c!93174 (validKeyInArray!0 (select (arr!24813 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884919 () Bool)

(assert (=> b!884919 (= e!492462 call!39017)))

(declare-fun d!109273 () Bool)

(declare-fun res!601139 () Bool)

(assert (=> d!109273 (=> res!601139 e!492463)))

(assert (=> d!109273 (= res!601139 (bvsge #b00000000000000000000000000000000 (size!25253 _keys!868)))))

(assert (=> d!109273 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17625) e!492463)))

(declare-fun b!884917 () Bool)

(assert (=> b!884917 (= e!492462 call!39017)))

(assert (= (and d!109273 (not res!601139)) b!884916))

(assert (= (and b!884916 res!601140) b!884915))

(assert (= (and b!884916 res!601138) b!884918))

(assert (= (and b!884918 c!93174) b!884919))

(assert (= (and b!884918 (not c!93174)) b!884917))

(assert (= (or b!884919 b!884917) bm!39014))

(declare-fun m!825151 () Bool)

(assert (=> b!884915 m!825151))

(assert (=> b!884915 m!825151))

(declare-fun m!825153 () Bool)

(assert (=> b!884915 m!825153))

(assert (=> b!884916 m!825151))

(assert (=> b!884916 m!825151))

(declare-fun m!825155 () Bool)

(assert (=> b!884916 m!825155))

(assert (=> bm!39014 m!825151))

(declare-fun m!825157 () Bool)

(assert (=> bm!39014 m!825157))

(assert (=> b!884918 m!825151))

(assert (=> b!884918 m!825151))

(assert (=> b!884918 m!825155))

(assert (=> b!884788 d!109273))

(declare-fun b!884920 () Bool)

(declare-fun e!492468 () Bool)

(declare-fun e!492470 () Bool)

(assert (=> b!884920 (= e!492468 e!492470)))

(declare-fun c!93175 () Bool)

(assert (=> b!884920 (= c!93175 (bvslt from!1053 (size!25253 _keys!868)))))

(declare-fun b!884921 () Bool)

(declare-fun e!492466 () ListLongMap!10591)

(declare-fun e!492472 () ListLongMap!10591)

(assert (=> b!884921 (= e!492466 e!492472)))

(declare-fun c!93177 () Bool)

(assert (=> b!884921 (= c!93177 (validKeyInArray!0 (select (arr!24813 _keys!868) from!1053)))))

(declare-fun d!109275 () Bool)

(declare-fun e!492467 () Bool)

(assert (=> d!109275 e!492467))

(declare-fun res!601142 () Bool)

(assert (=> d!109275 (=> (not res!601142) (not e!492467))))

(declare-fun lt!400858 () ListLongMap!10591)

(assert (=> d!109275 (= res!601142 (not (contains!4281 lt!400858 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109275 (= lt!400858 e!492466)))

(declare-fun c!93176 () Bool)

(assert (=> d!109275 (= c!93176 (bvsge from!1053 (size!25253 _keys!868)))))

(assert (=> d!109275 (validMask!0 mask!1196)))

(assert (=> d!109275 (= (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400858)))

(declare-fun b!884922 () Bool)

(declare-fun e!492469 () Bool)

(assert (=> b!884922 (= e!492468 e!492469)))

(assert (=> b!884922 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25253 _keys!868)))))

(declare-fun res!601144 () Bool)

(assert (=> b!884922 (= res!601144 (contains!4281 lt!400858 (select (arr!24813 _keys!868) from!1053)))))

(assert (=> b!884922 (=> (not res!601144) (not e!492469))))

(declare-fun bm!39015 () Bool)

(declare-fun call!39018 () ListLongMap!10591)

(assert (=> bm!39015 (= call!39018 (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884923 () Bool)

(assert (=> b!884923 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25253 _keys!868)))))

(assert (=> b!884923 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25254 lt!400793)))))

(assert (=> b!884923 (= e!492469 (= (apply!386 lt!400858 (select (arr!24813 _keys!868) from!1053)) (get!13082 (select (arr!24814 lt!400793) from!1053) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884924 () Bool)

(assert (=> b!884924 (= e!492470 (isEmpty!673 lt!400858))))

(declare-fun b!884925 () Bool)

(declare-fun e!492471 () Bool)

(assert (=> b!884925 (= e!492471 (validKeyInArray!0 (select (arr!24813 _keys!868) from!1053)))))

(assert (=> b!884925 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884926 () Bool)

(assert (=> b!884926 (= e!492466 (ListLongMap!10592 Nil!17626))))

(declare-fun b!884927 () Bool)

(assert (=> b!884927 (= e!492470 (= lt!400858 (getCurrentListMapNoExtraKeys!3269 _keys!868 lt!400793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884928 () Bool)

(declare-fun lt!400856 () Unit!30212)

(declare-fun lt!400855 () Unit!30212)

(assert (=> b!884928 (= lt!400856 lt!400855)))

(declare-fun lt!400854 () ListLongMap!10591)

(declare-fun lt!400857 () (_ BitVec 64))

(declare-fun lt!400853 () (_ BitVec 64))

(declare-fun lt!400859 () V!28691)

(assert (=> b!884928 (not (contains!4281 (+!2579 lt!400854 (tuple2!11823 lt!400857 lt!400859)) lt!400853))))

(assert (=> b!884928 (= lt!400855 (addStillNotContains!211 lt!400854 lt!400857 lt!400859 lt!400853))))

(assert (=> b!884928 (= lt!400853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884928 (= lt!400859 (get!13082 (select (arr!24814 lt!400793) from!1053) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884928 (= lt!400857 (select (arr!24813 _keys!868) from!1053))))

(assert (=> b!884928 (= lt!400854 call!39018)))

(assert (=> b!884928 (= e!492472 (+!2579 call!39018 (tuple2!11823 (select (arr!24813 _keys!868) from!1053) (get!13082 (select (arr!24814 lt!400793) from!1053) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884929 () Bool)

(assert (=> b!884929 (= e!492472 call!39018)))

(declare-fun b!884930 () Bool)

(declare-fun res!601141 () Bool)

(assert (=> b!884930 (=> (not res!601141) (not e!492467))))

(assert (=> b!884930 (= res!601141 (not (contains!4281 lt!400858 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884931 () Bool)

(assert (=> b!884931 (= e!492467 e!492468)))

(declare-fun c!93178 () Bool)

(assert (=> b!884931 (= c!93178 e!492471)))

(declare-fun res!601143 () Bool)

(assert (=> b!884931 (=> (not res!601143) (not e!492471))))

(assert (=> b!884931 (= res!601143 (bvslt from!1053 (size!25253 _keys!868)))))

(assert (= (and d!109275 c!93176) b!884926))

(assert (= (and d!109275 (not c!93176)) b!884921))

(assert (= (and b!884921 c!93177) b!884928))

(assert (= (and b!884921 (not c!93177)) b!884929))

(assert (= (or b!884928 b!884929) bm!39015))

(assert (= (and d!109275 res!601142) b!884930))

(assert (= (and b!884930 res!601141) b!884931))

(assert (= (and b!884931 res!601143) b!884925))

(assert (= (and b!884931 c!93178) b!884922))

(assert (= (and b!884931 (not c!93178)) b!884920))

(assert (= (and b!884922 res!601144) b!884923))

(assert (= (and b!884920 c!93175) b!884927))

(assert (= (and b!884920 (not c!93175)) b!884924))

(declare-fun b_lambda!12795 () Bool)

(assert (=> (not b_lambda!12795) (not b!884923)))

(assert (=> b!884923 t!24908))

(declare-fun b_and!25691 () Bool)

(assert (= b_and!25689 (and (=> t!24908 result!9903) b_and!25691)))

(declare-fun b_lambda!12797 () Bool)

(assert (=> (not b_lambda!12797) (not b!884928)))

(assert (=> b!884928 t!24908))

(declare-fun b_and!25693 () Bool)

(assert (= b_and!25691 (and (=> t!24908 result!9903) b_and!25693)))

(declare-fun m!825159 () Bool)

(assert (=> d!109275 m!825159))

(assert (=> d!109275 m!825007))

(declare-fun m!825161 () Bool)

(assert (=> b!884930 m!825161))

(assert (=> b!884921 m!825027))

(assert (=> b!884921 m!825027))

(assert (=> b!884921 m!825029))

(declare-fun m!825163 () Bool)

(assert (=> b!884927 m!825163))

(assert (=> bm!39015 m!825163))

(assert (=> b!884922 m!825027))

(assert (=> b!884922 m!825027))

(declare-fun m!825165 () Bool)

(assert (=> b!884922 m!825165))

(declare-fun m!825167 () Bool)

(assert (=> b!884924 m!825167))

(assert (=> b!884928 m!825027))

(declare-fun m!825169 () Bool)

(assert (=> b!884928 m!825169))

(declare-fun m!825171 () Bool)

(assert (=> b!884928 m!825171))

(declare-fun m!825173 () Bool)

(assert (=> b!884928 m!825173))

(assert (=> b!884928 m!825171))

(assert (=> b!884928 m!825099))

(declare-fun m!825175 () Bool)

(assert (=> b!884928 m!825175))

(declare-fun m!825177 () Bool)

(assert (=> b!884928 m!825177))

(assert (=> b!884928 m!825169))

(assert (=> b!884928 m!825099))

(declare-fun m!825179 () Bool)

(assert (=> b!884928 m!825179))

(assert (=> b!884925 m!825027))

(assert (=> b!884925 m!825027))

(assert (=> b!884925 m!825029))

(assert (=> b!884923 m!825027))

(assert (=> b!884923 m!825099))

(assert (=> b!884923 m!825169))

(assert (=> b!884923 m!825099))

(assert (=> b!884923 m!825179))

(assert (=> b!884923 m!825169))

(assert (=> b!884923 m!825027))

(declare-fun m!825181 () Bool)

(assert (=> b!884923 m!825181))

(assert (=> b!884793 d!109275))

(declare-fun b!884932 () Bool)

(declare-fun e!492475 () Bool)

(declare-fun e!492477 () Bool)

(assert (=> b!884932 (= e!492475 e!492477)))

(declare-fun c!93179 () Bool)

(assert (=> b!884932 (= c!93179 (bvslt from!1053 (size!25253 _keys!868)))))

(declare-fun b!884933 () Bool)

(declare-fun e!492473 () ListLongMap!10591)

(declare-fun e!492479 () ListLongMap!10591)

(assert (=> b!884933 (= e!492473 e!492479)))

(declare-fun c!93181 () Bool)

(assert (=> b!884933 (= c!93181 (validKeyInArray!0 (select (arr!24813 _keys!868) from!1053)))))

(declare-fun d!109277 () Bool)

(declare-fun e!492474 () Bool)

(assert (=> d!109277 e!492474))

(declare-fun res!601146 () Bool)

(assert (=> d!109277 (=> (not res!601146) (not e!492474))))

(declare-fun lt!400865 () ListLongMap!10591)

(assert (=> d!109277 (= res!601146 (not (contains!4281 lt!400865 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109277 (= lt!400865 e!492473)))

(declare-fun c!93180 () Bool)

(assert (=> d!109277 (= c!93180 (bvsge from!1053 (size!25253 _keys!868)))))

(assert (=> d!109277 (validMask!0 mask!1196)))

(assert (=> d!109277 (= (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400865)))

(declare-fun b!884934 () Bool)

(declare-fun e!492476 () Bool)

(assert (=> b!884934 (= e!492475 e!492476)))

(assert (=> b!884934 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25253 _keys!868)))))

(declare-fun res!601148 () Bool)

(assert (=> b!884934 (= res!601148 (contains!4281 lt!400865 (select (arr!24813 _keys!868) from!1053)))))

(assert (=> b!884934 (=> (not res!601148) (not e!492476))))

(declare-fun call!39019 () ListLongMap!10591)

(declare-fun bm!39016 () Bool)

(assert (=> bm!39016 (= call!39019 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884935 () Bool)

(assert (=> b!884935 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25253 _keys!868)))))

(assert (=> b!884935 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25254 _values!688)))))

(assert (=> b!884935 (= e!492476 (= (apply!386 lt!400865 (select (arr!24813 _keys!868) from!1053)) (get!13082 (select (arr!24814 _values!688) from!1053) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884936 () Bool)

(assert (=> b!884936 (= e!492477 (isEmpty!673 lt!400865))))

(declare-fun b!884937 () Bool)

(declare-fun e!492478 () Bool)

(assert (=> b!884937 (= e!492478 (validKeyInArray!0 (select (arr!24813 _keys!868) from!1053)))))

(assert (=> b!884937 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884938 () Bool)

(assert (=> b!884938 (= e!492473 (ListLongMap!10592 Nil!17626))))

(declare-fun b!884939 () Bool)

(assert (=> b!884939 (= e!492477 (= lt!400865 (getCurrentListMapNoExtraKeys!3269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884940 () Bool)

(declare-fun lt!400863 () Unit!30212)

(declare-fun lt!400862 () Unit!30212)

(assert (=> b!884940 (= lt!400863 lt!400862)))

(declare-fun lt!400864 () (_ BitVec 64))

(declare-fun lt!400861 () ListLongMap!10591)

(declare-fun lt!400866 () V!28691)

(declare-fun lt!400860 () (_ BitVec 64))

(assert (=> b!884940 (not (contains!4281 (+!2579 lt!400861 (tuple2!11823 lt!400864 lt!400866)) lt!400860))))

(assert (=> b!884940 (= lt!400862 (addStillNotContains!211 lt!400861 lt!400864 lt!400866 lt!400860))))

(assert (=> b!884940 (= lt!400860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884940 (= lt!400866 (get!13082 (select (arr!24814 _values!688) from!1053) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884940 (= lt!400864 (select (arr!24813 _keys!868) from!1053))))

(assert (=> b!884940 (= lt!400861 call!39019)))

(assert (=> b!884940 (= e!492479 (+!2579 call!39019 (tuple2!11823 (select (arr!24813 _keys!868) from!1053) (get!13082 (select (arr!24814 _values!688) from!1053) (dynLambda!1285 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884941 () Bool)

(assert (=> b!884941 (= e!492479 call!39019)))

(declare-fun b!884942 () Bool)

(declare-fun res!601145 () Bool)

(assert (=> b!884942 (=> (not res!601145) (not e!492474))))

(assert (=> b!884942 (= res!601145 (not (contains!4281 lt!400865 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884943 () Bool)

(assert (=> b!884943 (= e!492474 e!492475)))

(declare-fun c!93182 () Bool)

(assert (=> b!884943 (= c!93182 e!492478)))

(declare-fun res!601147 () Bool)

(assert (=> b!884943 (=> (not res!601147) (not e!492478))))

(assert (=> b!884943 (= res!601147 (bvslt from!1053 (size!25253 _keys!868)))))

(assert (= (and d!109277 c!93180) b!884938))

(assert (= (and d!109277 (not c!93180)) b!884933))

(assert (= (and b!884933 c!93181) b!884940))

(assert (= (and b!884933 (not c!93181)) b!884941))

(assert (= (or b!884940 b!884941) bm!39016))

(assert (= (and d!109277 res!601146) b!884942))

(assert (= (and b!884942 res!601145) b!884943))

(assert (= (and b!884943 res!601147) b!884937))

(assert (= (and b!884943 c!93182) b!884934))

(assert (= (and b!884943 (not c!93182)) b!884932))

(assert (= (and b!884934 res!601148) b!884935))

(assert (= (and b!884932 c!93179) b!884939))

(assert (= (and b!884932 (not c!93179)) b!884936))

(declare-fun b_lambda!12799 () Bool)

(assert (=> (not b_lambda!12799) (not b!884935)))

(assert (=> b!884935 t!24908))

(declare-fun b_and!25695 () Bool)

(assert (= b_and!25693 (and (=> t!24908 result!9903) b_and!25695)))

(declare-fun b_lambda!12801 () Bool)

(assert (=> (not b_lambda!12801) (not b!884940)))

(assert (=> b!884940 t!24908))

(declare-fun b_and!25697 () Bool)

(assert (= b_and!25695 (and (=> t!24908 result!9903) b_and!25697)))

(declare-fun m!825183 () Bool)

(assert (=> d!109277 m!825183))

(assert (=> d!109277 m!825007))

(declare-fun m!825185 () Bool)

(assert (=> b!884942 m!825185))

(assert (=> b!884933 m!825027))

(assert (=> b!884933 m!825027))

(assert (=> b!884933 m!825029))

(declare-fun m!825187 () Bool)

(assert (=> b!884939 m!825187))

(assert (=> bm!39016 m!825187))

(assert (=> b!884934 m!825027))

(assert (=> b!884934 m!825027))

(declare-fun m!825189 () Bool)

(assert (=> b!884934 m!825189))

(declare-fun m!825191 () Bool)

(assert (=> b!884936 m!825191))

(assert (=> b!884940 m!825027))

(declare-fun m!825193 () Bool)

(assert (=> b!884940 m!825193))

(declare-fun m!825195 () Bool)

(assert (=> b!884940 m!825195))

(declare-fun m!825197 () Bool)

(assert (=> b!884940 m!825197))

(assert (=> b!884940 m!825195))

(assert (=> b!884940 m!825099))

(declare-fun m!825199 () Bool)

(assert (=> b!884940 m!825199))

(declare-fun m!825201 () Bool)

(assert (=> b!884940 m!825201))

(assert (=> b!884940 m!825193))

(assert (=> b!884940 m!825099))

(declare-fun m!825203 () Bool)

(assert (=> b!884940 m!825203))

(assert (=> b!884937 m!825027))

(assert (=> b!884937 m!825027))

(assert (=> b!884937 m!825029))

(assert (=> b!884935 m!825027))

(assert (=> b!884935 m!825099))

(assert (=> b!884935 m!825193))

(assert (=> b!884935 m!825099))

(assert (=> b!884935 m!825203))

(assert (=> b!884935 m!825193))

(assert (=> b!884935 m!825027))

(declare-fun m!825205 () Bool)

(assert (=> b!884935 m!825205))

(assert (=> b!884793 d!109277))

(declare-fun d!109279 () Bool)

(assert (=> d!109279 (= (array_inv!19536 _keys!868) (bvsge (size!25253 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!75000 d!109279))

(declare-fun d!109281 () Bool)

(assert (=> d!109281 (= (array_inv!19537 _values!688) (bvsge (size!25254 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!75000 d!109281))

(declare-fun d!109283 () Bool)

(assert (=> d!109283 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884797 d!109283))

(declare-fun bm!39019 () Bool)

(declare-fun call!39022 () Bool)

(assert (=> bm!39019 (= call!39022 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!884952 () Bool)

(declare-fun e!492487 () Bool)

(assert (=> b!884952 (= e!492487 call!39022)))

(declare-fun b!884954 () Bool)

(declare-fun e!492486 () Bool)

(assert (=> b!884954 (= e!492486 e!492487)))

(declare-fun c!93185 () Bool)

(assert (=> b!884954 (= c!93185 (validKeyInArray!0 (select (arr!24813 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884955 () Bool)

(declare-fun e!492488 () Bool)

(assert (=> b!884955 (= e!492488 call!39022)))

(declare-fun b!884953 () Bool)

(assert (=> b!884953 (= e!492487 e!492488)))

(declare-fun lt!400873 () (_ BitVec 64))

(assert (=> b!884953 (= lt!400873 (select (arr!24813 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!400874 () Unit!30212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51590 (_ BitVec 64) (_ BitVec 32)) Unit!30212)

(assert (=> b!884953 (= lt!400874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!400873 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884953 (arrayContainsKey!0 _keys!868 lt!400873 #b00000000000000000000000000000000)))

(declare-fun lt!400875 () Unit!30212)

(assert (=> b!884953 (= lt!400875 lt!400874)))

(declare-fun res!601154 () Bool)

(declare-datatypes ((SeekEntryResult!8762 0))(
  ( (MissingZero!8762 (index!37419 (_ BitVec 32))) (Found!8762 (index!37420 (_ BitVec 32))) (Intermediate!8762 (undefined!9574 Bool) (index!37421 (_ BitVec 32)) (x!75012 (_ BitVec 32))) (Undefined!8762) (MissingVacant!8762 (index!37422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51590 (_ BitVec 32)) SeekEntryResult!8762)

(assert (=> b!884953 (= res!601154 (= (seekEntryOrOpen!0 (select (arr!24813 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8762 #b00000000000000000000000000000000)))))

(assert (=> b!884953 (=> (not res!601154) (not e!492488))))

(declare-fun d!109285 () Bool)

(declare-fun res!601153 () Bool)

(assert (=> d!109285 (=> res!601153 e!492486)))

(assert (=> d!109285 (= res!601153 (bvsge #b00000000000000000000000000000000 (size!25253 _keys!868)))))

(assert (=> d!109285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!492486)))

(assert (= (and d!109285 (not res!601153)) b!884954))

(assert (= (and b!884954 c!93185) b!884953))

(assert (= (and b!884954 (not c!93185)) b!884952))

(assert (= (and b!884953 res!601154) b!884955))

(assert (= (or b!884955 b!884952) bm!39019))

(declare-fun m!825207 () Bool)

(assert (=> bm!39019 m!825207))

(assert (=> b!884954 m!825151))

(assert (=> b!884954 m!825151))

(assert (=> b!884954 m!825155))

(assert (=> b!884953 m!825151))

(declare-fun m!825209 () Bool)

(assert (=> b!884953 m!825209))

(declare-fun m!825211 () Bool)

(assert (=> b!884953 m!825211))

(assert (=> b!884953 m!825151))

(declare-fun m!825213 () Bool)

(assert (=> b!884953 m!825213))

(assert (=> b!884798 d!109285))

(declare-fun d!109287 () Bool)

(declare-fun e!492489 () Bool)

(assert (=> d!109287 e!492489))

(declare-fun res!601156 () Bool)

(assert (=> d!109287 (=> (not res!601156) (not e!492489))))

(declare-fun lt!400877 () ListLongMap!10591)

(assert (=> d!109287 (= res!601156 (contains!4281 lt!400877 (_1!5922 lt!400790)))))

(declare-fun lt!400879 () List!17629)

(assert (=> d!109287 (= lt!400877 (ListLongMap!10592 lt!400879))))

(declare-fun lt!400876 () Unit!30212)

(declare-fun lt!400878 () Unit!30212)

(assert (=> d!109287 (= lt!400876 lt!400878)))

(assert (=> d!109287 (= (getValueByKey!428 lt!400879 (_1!5922 lt!400790)) (Some!433 (_2!5922 lt!400790)))))

(assert (=> d!109287 (= lt!400878 (lemmaContainsTupThenGetReturnValue!242 lt!400879 (_1!5922 lt!400790) (_2!5922 lt!400790)))))

(assert (=> d!109287 (= lt!400879 (insertStrictlySorted!281 (toList!5311 lt!400791) (_1!5922 lt!400790) (_2!5922 lt!400790)))))

(assert (=> d!109287 (= (+!2579 lt!400791 lt!400790) lt!400877)))

(declare-fun b!884956 () Bool)

(declare-fun res!601155 () Bool)

(assert (=> b!884956 (=> (not res!601155) (not e!492489))))

(assert (=> b!884956 (= res!601155 (= (getValueByKey!428 (toList!5311 lt!400877) (_1!5922 lt!400790)) (Some!433 (_2!5922 lt!400790))))))

(declare-fun b!884957 () Bool)

(assert (=> b!884957 (= e!492489 (contains!4282 (toList!5311 lt!400877) lt!400790))))

(assert (= (and d!109287 res!601156) b!884956))

(assert (= (and b!884956 res!601155) b!884957))

(declare-fun m!825215 () Bool)

(assert (=> d!109287 m!825215))

(declare-fun m!825217 () Bool)

(assert (=> d!109287 m!825217))

(declare-fun m!825219 () Bool)

(assert (=> d!109287 m!825219))

(declare-fun m!825221 () Bool)

(assert (=> d!109287 m!825221))

(declare-fun m!825223 () Bool)

(assert (=> b!884956 m!825223))

(declare-fun m!825225 () Bool)

(assert (=> b!884957 m!825225))

(assert (=> b!884789 d!109287))

(declare-fun mapNonEmpty!28245 () Bool)

(declare-fun mapRes!28245 () Bool)

(declare-fun tp!54182 () Bool)

(declare-fun e!492495 () Bool)

(assert (=> mapNonEmpty!28245 (= mapRes!28245 (and tp!54182 e!492495))))

(declare-fun mapKey!28245 () (_ BitVec 32))

(declare-fun mapRest!28245 () (Array (_ BitVec 32) ValueCell!8427))

(declare-fun mapValue!28245 () ValueCell!8427)

(assert (=> mapNonEmpty!28245 (= mapRest!28239 (store mapRest!28245 mapKey!28245 mapValue!28245))))

(declare-fun b!884964 () Bool)

(assert (=> b!884964 (= e!492495 tp_is_empty!17733)))

(declare-fun mapIsEmpty!28245 () Bool)

(assert (=> mapIsEmpty!28245 mapRes!28245))

(declare-fun b!884965 () Bool)

(declare-fun e!492494 () Bool)

(assert (=> b!884965 (= e!492494 tp_is_empty!17733)))

(declare-fun condMapEmpty!28245 () Bool)

(declare-fun mapDefault!28245 () ValueCell!8427)

(assert (=> mapNonEmpty!28239 (= condMapEmpty!28245 (= mapRest!28239 ((as const (Array (_ BitVec 32) ValueCell!8427)) mapDefault!28245)))))

(assert (=> mapNonEmpty!28239 (= tp!54173 (and e!492494 mapRes!28245))))

(assert (= (and mapNonEmpty!28239 condMapEmpty!28245) mapIsEmpty!28245))

(assert (= (and mapNonEmpty!28239 (not condMapEmpty!28245)) mapNonEmpty!28245))

(assert (= (and mapNonEmpty!28245 ((_ is ValueCellFull!8427) mapValue!28245)) b!884964))

(assert (= (and mapNonEmpty!28239 ((_ is ValueCellFull!8427) mapDefault!28245)) b!884965))

(declare-fun m!825227 () Bool)

(assert (=> mapNonEmpty!28245 m!825227))

(declare-fun b_lambda!12803 () Bool)

(assert (= b_lambda!12787 (or (and start!75000 b_free!15489) b_lambda!12803)))

(declare-fun b_lambda!12805 () Bool)

(assert (= b_lambda!12793 (or (and start!75000 b_free!15489) b_lambda!12805)))

(declare-fun b_lambda!12807 () Bool)

(assert (= b_lambda!12795 (or (and start!75000 b_free!15489) b_lambda!12807)))

(declare-fun b_lambda!12809 () Bool)

(assert (= b_lambda!12797 (or (and start!75000 b_free!15489) b_lambda!12809)))

(declare-fun b_lambda!12811 () Bool)

(assert (= b_lambda!12799 (or (and start!75000 b_free!15489) b_lambda!12811)))

(declare-fun b_lambda!12813 () Bool)

(assert (= b_lambda!12789 (or (and start!75000 b_free!15489) b_lambda!12813)))

(declare-fun b_lambda!12815 () Bool)

(assert (= b_lambda!12791 (or (and start!75000 b_free!15489) b_lambda!12815)))

(declare-fun b_lambda!12817 () Bool)

(assert (= b_lambda!12801 (or (and start!75000 b_free!15489) b_lambda!12817)))

(check-sat tp_is_empty!17733 (not b!884865) (not d!109277) (not bm!39005) (not b_lambda!12817) (not b!884940) (not bm!39019) (not b!884872) (not b_lambda!12815) (not d!109287) (not b_next!15489) (not bm!39016) (not b!884957) (not b!884885) (not b_lambda!12809) (not d!109263) (not b!884915) (not b!884942) (not b!884868) (not b!884928) (not d!109271) (not b!884930) (not b!884871) (not b!884880) (not b!884916) (not bm!39014) (not b_lambda!12813) (not b!884934) (not b_lambda!12811) (not b!884882) (not b!884867) (not b!884936) (not b!884904) (not bm!39010) (not d!109275) (not b!884924) (not b!884918) (not b!884933) (not b!884866) (not bm!39015) (not b!884869) (not b!884925) (not b!884954) (not b!884923) (not b!884935) (not mapNonEmpty!28245) (not d!109269) (not b!884886) (not bm!39011) (not bm!39004) (not b!884927) (not b_lambda!12803) (not b!884874) (not d!109267) (not b!884888) (not b!884903) (not b!884922) b_and!25697 (not b!884937) (not b!884879) (not b_lambda!12805) (not b!884921) (not b!884883) (not b!884939) (not b!884897) (not b!884953) (not b!884956) (not b!884881) (not b_lambda!12807))
(check-sat b_and!25697 (not b_next!15489))
