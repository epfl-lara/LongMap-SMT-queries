; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74688 () Bool)

(assert start!74688)

(declare-fun b_free!15355 () Bool)

(declare-fun b_next!15355 () Bool)

(assert (=> start!74688 (= b_free!15355 (not b_next!15355))))

(declare-fun tp!53753 () Bool)

(declare-fun b_and!25303 () Bool)

(assert (=> start!74688 (= tp!53753 b_and!25303)))

(declare-fun b!880583 () Bool)

(declare-fun res!598355 () Bool)

(declare-fun e!490019 () Bool)

(assert (=> b!880583 (=> (not res!598355) (not e!490019))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51303 0))(
  ( (array!51304 (arr!24676 (Array (_ BitVec 32) (_ BitVec 64))) (size!25118 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51303)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880583 (= res!598355 (and (= (select (arr!24676 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28020 () Bool)

(declare-fun mapRes!28020 () Bool)

(declare-fun tp!53754 () Bool)

(declare-fun e!490017 () Bool)

(assert (=> mapNonEmpty!28020 (= mapRes!28020 (and tp!53754 e!490017))))

(declare-datatypes ((V!28513 0))(
  ( (V!28514 (val!8847 Int)) )
))
(declare-datatypes ((ValueCell!8360 0))(
  ( (ValueCellFull!8360 (v!11289 V!28513)) (EmptyCell!8360) )
))
(declare-fun mapRest!28020 () (Array (_ BitVec 32) ValueCell!8360))

(declare-fun mapKey!28020 () (_ BitVec 32))

(declare-fun mapValue!28020 () ValueCell!8360)

(declare-datatypes ((array!51305 0))(
  ( (array!51306 (arr!24677 (Array (_ BitVec 32) ValueCell!8360)) (size!25119 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51305)

(assert (=> mapNonEmpty!28020 (= (arr!24677 _values!688) (store mapRest!28020 mapKey!28020 mapValue!28020))))

(declare-fun res!598354 () Bool)

(assert (=> start!74688 (=> (not res!598354) (not e!490019))))

(assert (=> start!74688 (= res!598354 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25118 _keys!868))))))

(assert (=> start!74688 e!490019))

(declare-fun tp_is_empty!17599 () Bool)

(assert (=> start!74688 tp_is_empty!17599))

(assert (=> start!74688 true))

(assert (=> start!74688 tp!53753))

(declare-fun array_inv!19482 (array!51303) Bool)

(assert (=> start!74688 (array_inv!19482 _keys!868)))

(declare-fun e!490022 () Bool)

(declare-fun array_inv!19483 (array!51305) Bool)

(assert (=> start!74688 (and (array_inv!19483 _values!688) e!490022)))

(declare-fun b!880584 () Bool)

(declare-fun e!490020 () Bool)

(assert (=> b!880584 (= e!490022 (and e!490020 mapRes!28020))))

(declare-fun condMapEmpty!28020 () Bool)

(declare-fun mapDefault!28020 () ValueCell!8360)

(assert (=> b!880584 (= condMapEmpty!28020 (= (arr!24677 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8360)) mapDefault!28020)))))

(declare-fun b!880585 () Bool)

(declare-fun e!490021 () Bool)

(declare-fun e!490015 () Bool)

(assert (=> b!880585 (= e!490021 e!490015)))

(declare-fun res!598356 () Bool)

(assert (=> b!880585 (=> res!598356 e!490015)))

(assert (=> b!880585 (= res!598356 (not (= (select (arr!24676 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11732 0))(
  ( (tuple2!11733 (_1!5877 (_ BitVec 64)) (_2!5877 V!28513)) )
))
(declare-datatypes ((List!17527 0))(
  ( (Nil!17524) (Cons!17523 (h!18654 tuple2!11732) (t!24675 List!17527)) )
))
(declare-datatypes ((ListLongMap!10491 0))(
  ( (ListLongMap!10492 (toList!5261 List!17527)) )
))
(declare-fun lt!398095 () ListLongMap!10491)

(declare-fun lt!398099 () ListLongMap!10491)

(declare-fun +!2555 (ListLongMap!10491 tuple2!11732) ListLongMap!10491)

(declare-fun get!12989 (ValueCell!8360 V!28513) V!28513)

(declare-fun dynLambda!1245 (Int (_ BitVec 64)) V!28513)

(assert (=> b!880585 (= lt!398095 (+!2555 lt!398099 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880586 () Bool)

(declare-fun res!598350 () Bool)

(assert (=> b!880586 (=> (not res!598350) (not e!490019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880586 (= res!598350 (validKeyInArray!0 k0!854))))

(declare-fun b!880587 () Bool)

(assert (=> b!880587 (= e!490017 tp_is_empty!17599)))

(declare-fun b!880588 () Bool)

(declare-fun res!598351 () Bool)

(assert (=> b!880588 (=> (not res!598351) (not e!490019))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!880588 (= res!598351 (and (= (size!25119 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25118 _keys!868) (size!25119 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880589 () Bool)

(declare-fun e!490018 () Bool)

(assert (=> b!880589 (= e!490019 e!490018)))

(declare-fun res!598352 () Bool)

(assert (=> b!880589 (=> (not res!598352) (not e!490018))))

(assert (=> b!880589 (= res!598352 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398100 () array!51305)

(declare-fun minValue!654 () V!28513)

(declare-fun zeroValue!654 () V!28513)

(declare-fun getCurrentListMapNoExtraKeys!3252 (array!51303 array!51305 (_ BitVec 32) (_ BitVec 32) V!28513 V!28513 (_ BitVec 32) Int) ListLongMap!10491)

(assert (=> b!880589 (= lt!398095 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28513)

(assert (=> b!880589 (= lt!398100 (array!51306 (store (arr!24677 _values!688) i!612 (ValueCellFull!8360 v!557)) (size!25119 _values!688)))))

(declare-fun lt!398097 () ListLongMap!10491)

(assert (=> b!880589 (= lt!398097 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880590 () Bool)

(declare-fun res!598353 () Bool)

(assert (=> b!880590 (=> (not res!598353) (not e!490019))))

(assert (=> b!880590 (= res!598353 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25118 _keys!868))))))

(declare-fun b!880591 () Bool)

(assert (=> b!880591 (= e!490018 (not e!490021))))

(declare-fun res!598360 () Bool)

(assert (=> b!880591 (=> res!598360 e!490021)))

(assert (=> b!880591 (= res!598360 (not (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053))))))

(declare-fun lt!398093 () ListLongMap!10491)

(assert (=> b!880591 (= lt!398093 lt!398099)))

(declare-fun lt!398098 () ListLongMap!10491)

(assert (=> b!880591 (= lt!398099 (+!2555 lt!398098 (tuple2!11733 k0!854 v!557)))))

(assert (=> b!880591 (= lt!398093 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880591 (= lt!398098 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30019 0))(
  ( (Unit!30020) )
))
(declare-fun lt!398096 () Unit!30019)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 (array!51303 array!51305 (_ BitVec 32) (_ BitVec 32) V!28513 V!28513 (_ BitVec 32) (_ BitVec 64) V!28513 (_ BitVec 32) Int) Unit!30019)

(assert (=> b!880591 (= lt!398096 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880592 () Bool)

(declare-fun res!598359 () Bool)

(assert (=> b!880592 (=> (not res!598359) (not e!490019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51303 (_ BitVec 32)) Bool)

(assert (=> b!880592 (= res!598359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!28020 () Bool)

(assert (=> mapIsEmpty!28020 mapRes!28020))

(declare-fun b!880593 () Bool)

(assert (=> b!880593 (= e!490015 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (size!25118 _keys!868) #b01111111111111111111111111111111)))))

(declare-datatypes ((List!17528 0))(
  ( (Nil!17525) (Cons!17524 (h!18655 (_ BitVec 64)) (t!24676 List!17528)) )
))
(declare-fun arrayNoDuplicates!0 (array!51303 (_ BitVec 32) List!17528) Bool)

(assert (=> b!880593 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17525)))

(declare-fun lt!398094 () Unit!30019)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51303 (_ BitVec 32) (_ BitVec 32)) Unit!30019)

(assert (=> b!880593 (= lt!398094 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880594 () Bool)

(declare-fun res!598358 () Bool)

(assert (=> b!880594 (=> (not res!598358) (not e!490019))))

(assert (=> b!880594 (= res!598358 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17525))))

(declare-fun b!880595 () Bool)

(assert (=> b!880595 (= e!490020 tp_is_empty!17599)))

(declare-fun b!880596 () Bool)

(declare-fun res!598357 () Bool)

(assert (=> b!880596 (=> (not res!598357) (not e!490019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880596 (= res!598357 (validMask!0 mask!1196))))

(assert (= (and start!74688 res!598354) b!880596))

(assert (= (and b!880596 res!598357) b!880588))

(assert (= (and b!880588 res!598351) b!880592))

(assert (= (and b!880592 res!598359) b!880594))

(assert (= (and b!880594 res!598358) b!880590))

(assert (= (and b!880590 res!598353) b!880586))

(assert (= (and b!880586 res!598350) b!880583))

(assert (= (and b!880583 res!598355) b!880589))

(assert (= (and b!880589 res!598352) b!880591))

(assert (= (and b!880591 (not res!598360)) b!880585))

(assert (= (and b!880585 (not res!598356)) b!880593))

(assert (= (and b!880584 condMapEmpty!28020) mapIsEmpty!28020))

(assert (= (and b!880584 (not condMapEmpty!28020)) mapNonEmpty!28020))

(get-info :version)

(assert (= (and mapNonEmpty!28020 ((_ is ValueCellFull!8360) mapValue!28020)) b!880587))

(assert (= (and b!880584 ((_ is ValueCellFull!8360) mapDefault!28020)) b!880595))

(assert (= start!74688 b!880584))

(declare-fun b_lambda!12445 () Bool)

(assert (=> (not b_lambda!12445) (not b!880585)))

(declare-fun t!24674 () Bool)

(declare-fun tb!5005 () Bool)

(assert (=> (and start!74688 (= defaultEntry!696 defaultEntry!696) t!24674) tb!5005))

(declare-fun result!9643 () Bool)

(assert (=> tb!5005 (= result!9643 tp_is_empty!17599)))

(assert (=> b!880585 t!24674))

(declare-fun b_and!25305 () Bool)

(assert (= b_and!25303 (and (=> t!24674 result!9643) b_and!25305)))

(declare-fun m!819857 () Bool)

(assert (=> b!880591 m!819857))

(declare-fun m!819859 () Bool)

(assert (=> b!880591 m!819859))

(declare-fun m!819861 () Bool)

(assert (=> b!880591 m!819861))

(declare-fun m!819863 () Bool)

(assert (=> b!880591 m!819863))

(declare-fun m!819865 () Bool)

(assert (=> b!880591 m!819865))

(assert (=> b!880591 m!819863))

(declare-fun m!819867 () Bool)

(assert (=> b!880591 m!819867))

(declare-fun m!819869 () Bool)

(assert (=> b!880583 m!819869))

(declare-fun m!819871 () Bool)

(assert (=> b!880586 m!819871))

(declare-fun m!819873 () Bool)

(assert (=> b!880592 m!819873))

(declare-fun m!819875 () Bool)

(assert (=> b!880593 m!819875))

(declare-fun m!819877 () Bool)

(assert (=> b!880593 m!819877))

(declare-fun m!819879 () Bool)

(assert (=> mapNonEmpty!28020 m!819879))

(declare-fun m!819881 () Bool)

(assert (=> b!880589 m!819881))

(declare-fun m!819883 () Bool)

(assert (=> b!880589 m!819883))

(declare-fun m!819885 () Bool)

(assert (=> b!880589 m!819885))

(declare-fun m!819887 () Bool)

(assert (=> b!880594 m!819887))

(declare-fun m!819889 () Bool)

(assert (=> start!74688 m!819889))

(declare-fun m!819891 () Bool)

(assert (=> start!74688 m!819891))

(declare-fun m!819893 () Bool)

(assert (=> b!880596 m!819893))

(declare-fun m!819895 () Bool)

(assert (=> b!880585 m!819895))

(assert (=> b!880585 m!819863))

(declare-fun m!819897 () Bool)

(assert (=> b!880585 m!819897))

(assert (=> b!880585 m!819895))

(assert (=> b!880585 m!819897))

(declare-fun m!819899 () Bool)

(assert (=> b!880585 m!819899))

(declare-fun m!819901 () Bool)

(assert (=> b!880585 m!819901))

(check-sat (not b!880592) tp_is_empty!17599 (not b!880594) (not start!74688) (not b!880591) b_and!25305 (not b!880586) (not b_lambda!12445) (not b!880589) (not b!880585) (not b!880593) (not b!880596) (not b_next!15355) (not mapNonEmpty!28020))
(check-sat b_and!25305 (not b_next!15355))
(get-model)

(declare-fun b_lambda!12451 () Bool)

(assert (= b_lambda!12445 (or (and start!74688 b_free!15355) b_lambda!12451)))

(check-sat (not b!880592) tp_is_empty!17599 (not b!880594) (not start!74688) (not b!880591) b_and!25305 (not b!880586) (not b!880589) (not b_lambda!12451) (not b!880585) (not b!880593) (not b!880596) (not b_next!15355) (not mapNonEmpty!28020))
(check-sat b_and!25305 (not b_next!15355))
(get-model)

(declare-fun b!880697 () Bool)

(declare-fun e!490080 () Bool)

(declare-fun e!490081 () Bool)

(assert (=> b!880697 (= e!490080 e!490081)))

(declare-fun c!92796 () Bool)

(assert (=> b!880697 (= c!92796 (validKeyInArray!0 (select (arr!24676 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108779 () Bool)

(declare-fun res!598434 () Bool)

(declare-fun e!490082 () Bool)

(assert (=> d!108779 (=> res!598434 e!490082)))

(assert (=> d!108779 (= res!598434 (bvsge #b00000000000000000000000000000000 (size!25118 _keys!868)))))

(assert (=> d!108779 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17525) e!490082)))

(declare-fun b!880698 () Bool)

(declare-fun call!38867 () Bool)

(assert (=> b!880698 (= e!490081 call!38867)))

(declare-fun b!880699 () Bool)

(declare-fun e!490079 () Bool)

(declare-fun contains!4231 (List!17528 (_ BitVec 64)) Bool)

(assert (=> b!880699 (= e!490079 (contains!4231 Nil!17525 (select (arr!24676 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!880700 () Bool)

(assert (=> b!880700 (= e!490082 e!490080)))

(declare-fun res!598433 () Bool)

(assert (=> b!880700 (=> (not res!598433) (not e!490080))))

(assert (=> b!880700 (= res!598433 (not e!490079))))

(declare-fun res!598435 () Bool)

(assert (=> b!880700 (=> (not res!598435) (not e!490079))))

(assert (=> b!880700 (= res!598435 (validKeyInArray!0 (select (arr!24676 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38864 () Bool)

(assert (=> bm!38864 (= call!38867 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92796 (Cons!17524 (select (arr!24676 _keys!868) #b00000000000000000000000000000000) Nil!17525) Nil!17525)))))

(declare-fun b!880701 () Bool)

(assert (=> b!880701 (= e!490081 call!38867)))

(assert (= (and d!108779 (not res!598434)) b!880700))

(assert (= (and b!880700 res!598435) b!880699))

(assert (= (and b!880700 res!598433) b!880697))

(assert (= (and b!880697 c!92796) b!880698))

(assert (= (and b!880697 (not c!92796)) b!880701))

(assert (= (or b!880698 b!880701) bm!38864))

(declare-fun m!819995 () Bool)

(assert (=> b!880697 m!819995))

(assert (=> b!880697 m!819995))

(declare-fun m!819997 () Bool)

(assert (=> b!880697 m!819997))

(assert (=> b!880699 m!819995))

(assert (=> b!880699 m!819995))

(declare-fun m!819999 () Bool)

(assert (=> b!880699 m!819999))

(assert (=> b!880700 m!819995))

(assert (=> b!880700 m!819995))

(assert (=> b!880700 m!819997))

(assert (=> bm!38864 m!819995))

(declare-fun m!820001 () Bool)

(assert (=> bm!38864 m!820001))

(assert (=> b!880594 d!108779))

(declare-fun d!108781 () Bool)

(assert (=> d!108781 (= (array_inv!19482 _keys!868) (bvsge (size!25118 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74688 d!108781))

(declare-fun d!108783 () Bool)

(assert (=> d!108783 (= (array_inv!19483 _values!688) (bvsge (size!25119 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74688 d!108783))

(declare-fun b!880726 () Bool)

(declare-fun lt!398163 () Unit!30019)

(declare-fun lt!398167 () Unit!30019)

(assert (=> b!880726 (= lt!398163 lt!398167)))

(declare-fun lt!398164 () (_ BitVec 64))

(declare-fun lt!398165 () ListLongMap!10491)

(declare-fun lt!398166 () (_ BitVec 64))

(declare-fun lt!398169 () V!28513)

(declare-fun contains!4232 (ListLongMap!10491 (_ BitVec 64)) Bool)

(assert (=> b!880726 (not (contains!4232 (+!2555 lt!398165 (tuple2!11733 lt!398164 lt!398169)) lt!398166))))

(declare-fun addStillNotContains!206 (ListLongMap!10491 (_ BitVec 64) V!28513 (_ BitVec 64)) Unit!30019)

(assert (=> b!880726 (= lt!398167 (addStillNotContains!206 lt!398165 lt!398164 lt!398169 lt!398166))))

(assert (=> b!880726 (= lt!398166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880726 (= lt!398169 (get!12989 (select (arr!24677 lt!398100) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880726 (= lt!398164 (select (arr!24676 _keys!868) from!1053))))

(declare-fun call!38870 () ListLongMap!10491)

(assert (=> b!880726 (= lt!398165 call!38870)))

(declare-fun e!490102 () ListLongMap!10491)

(assert (=> b!880726 (= e!490102 (+!2555 call!38870 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 lt!398100) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880727 () Bool)

(declare-fun e!490097 () Bool)

(declare-fun lt!398168 () ListLongMap!10491)

(declare-fun isEmpty!672 (ListLongMap!10491) Bool)

(assert (=> b!880727 (= e!490097 (isEmpty!672 lt!398168))))

(declare-fun b!880728 () Bool)

(declare-fun e!490098 () ListLongMap!10491)

(assert (=> b!880728 (= e!490098 (ListLongMap!10492 Nil!17524))))

(declare-fun b!880729 () Bool)

(assert (=> b!880729 (= e!490097 (= lt!398168 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880730 () Bool)

(declare-fun res!598446 () Bool)

(declare-fun e!490103 () Bool)

(assert (=> b!880730 (=> (not res!598446) (not e!490103))))

(assert (=> b!880730 (= res!598446 (not (contains!4232 lt!398168 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880731 () Bool)

(declare-fun e!490099 () Bool)

(assert (=> b!880731 (= e!490099 (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)))))

(assert (=> b!880731 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880732 () Bool)

(declare-fun e!490101 () Bool)

(declare-fun e!490100 () Bool)

(assert (=> b!880732 (= e!490101 e!490100)))

(assert (=> b!880732 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25118 _keys!868)))))

(declare-fun res!598444 () Bool)

(assert (=> b!880732 (= res!598444 (contains!4232 lt!398168 (select (arr!24676 _keys!868) from!1053)))))

(assert (=> b!880732 (=> (not res!598444) (not e!490100))))

(declare-fun d!108785 () Bool)

(assert (=> d!108785 e!490103))

(declare-fun res!598447 () Bool)

(assert (=> d!108785 (=> (not res!598447) (not e!490103))))

(assert (=> d!108785 (= res!598447 (not (contains!4232 lt!398168 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108785 (= lt!398168 e!490098)))

(declare-fun c!92806 () Bool)

(assert (=> d!108785 (= c!92806 (bvsge from!1053 (size!25118 _keys!868)))))

(assert (=> d!108785 (validMask!0 mask!1196)))

(assert (=> d!108785 (= (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398168)))

(declare-fun b!880733 () Bool)

(assert (=> b!880733 (= e!490098 e!490102)))

(declare-fun c!92807 () Bool)

(assert (=> b!880733 (= c!92807 (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)))))

(declare-fun b!880734 () Bool)

(assert (=> b!880734 (= e!490101 e!490097)))

(declare-fun c!92805 () Bool)

(assert (=> b!880734 (= c!92805 (bvslt from!1053 (size!25118 _keys!868)))))

(declare-fun b!880735 () Bool)

(assert (=> b!880735 (= e!490103 e!490101)))

(declare-fun c!92808 () Bool)

(assert (=> b!880735 (= c!92808 e!490099)))

(declare-fun res!598445 () Bool)

(assert (=> b!880735 (=> (not res!598445) (not e!490099))))

(assert (=> b!880735 (= res!598445 (bvslt from!1053 (size!25118 _keys!868)))))

(declare-fun b!880736 () Bool)

(assert (=> b!880736 (= e!490102 call!38870)))

(declare-fun b!880737 () Bool)

(assert (=> b!880737 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25118 _keys!868)))))

(assert (=> b!880737 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25119 lt!398100)))))

(declare-fun apply!380 (ListLongMap!10491 (_ BitVec 64)) V!28513)

(assert (=> b!880737 (= e!490100 (= (apply!380 lt!398168 (select (arr!24676 _keys!868) from!1053)) (get!12989 (select (arr!24677 lt!398100) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38867 () Bool)

(assert (=> bm!38867 (= call!38870 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108785 c!92806) b!880728))

(assert (= (and d!108785 (not c!92806)) b!880733))

(assert (= (and b!880733 c!92807) b!880726))

(assert (= (and b!880733 (not c!92807)) b!880736))

(assert (= (or b!880726 b!880736) bm!38867))

(assert (= (and d!108785 res!598447) b!880730))

(assert (= (and b!880730 res!598446) b!880735))

(assert (= (and b!880735 res!598445) b!880731))

(assert (= (and b!880735 c!92808) b!880732))

(assert (= (and b!880735 (not c!92808)) b!880734))

(assert (= (and b!880732 res!598444) b!880737))

(assert (= (and b!880734 c!92805) b!880729))

(assert (= (and b!880734 (not c!92805)) b!880727))

(declare-fun b_lambda!12453 () Bool)

(assert (=> (not b_lambda!12453) (not b!880726)))

(assert (=> b!880726 t!24674))

(declare-fun b_and!25315 () Bool)

(assert (= b_and!25305 (and (=> t!24674 result!9643) b_and!25315)))

(declare-fun b_lambda!12455 () Bool)

(assert (=> (not b_lambda!12455) (not b!880737)))

(assert (=> b!880737 t!24674))

(declare-fun b_and!25317 () Bool)

(assert (= b_and!25315 (and (=> t!24674 result!9643) b_and!25317)))

(assert (=> b!880733 m!819863))

(assert (=> b!880733 m!819863))

(assert (=> b!880733 m!819865))

(declare-fun m!820003 () Bool)

(assert (=> b!880727 m!820003))

(assert (=> b!880732 m!819863))

(assert (=> b!880732 m!819863))

(declare-fun m!820005 () Bool)

(assert (=> b!880732 m!820005))

(assert (=> b!880731 m!819863))

(assert (=> b!880731 m!819863))

(assert (=> b!880731 m!819865))

(declare-fun m!820007 () Bool)

(assert (=> b!880729 m!820007))

(declare-fun m!820009 () Bool)

(assert (=> d!108785 m!820009))

(assert (=> d!108785 m!819893))

(declare-fun m!820011 () Bool)

(assert (=> b!880737 m!820011))

(assert (=> b!880737 m!820011))

(assert (=> b!880737 m!819897))

(declare-fun m!820013 () Bool)

(assert (=> b!880737 m!820013))

(assert (=> b!880737 m!819897))

(assert (=> b!880737 m!819863))

(declare-fun m!820015 () Bool)

(assert (=> b!880737 m!820015))

(assert (=> b!880737 m!819863))

(assert (=> bm!38867 m!820007))

(declare-fun m!820017 () Bool)

(assert (=> b!880726 m!820017))

(assert (=> b!880726 m!820011))

(assert (=> b!880726 m!820011))

(assert (=> b!880726 m!819897))

(assert (=> b!880726 m!820013))

(assert (=> b!880726 m!819897))

(declare-fun m!820019 () Bool)

(assert (=> b!880726 m!820019))

(assert (=> b!880726 m!820017))

(declare-fun m!820021 () Bool)

(assert (=> b!880726 m!820021))

(declare-fun m!820023 () Bool)

(assert (=> b!880726 m!820023))

(assert (=> b!880726 m!819863))

(declare-fun m!820025 () Bool)

(assert (=> b!880730 m!820025))

(assert (=> b!880589 d!108785))

(declare-fun b!880738 () Bool)

(declare-fun lt!398170 () Unit!30019)

(declare-fun lt!398174 () Unit!30019)

(assert (=> b!880738 (= lt!398170 lt!398174)))

(declare-fun lt!398172 () ListLongMap!10491)

(declare-fun lt!398173 () (_ BitVec 64))

(declare-fun lt!398171 () (_ BitVec 64))

(declare-fun lt!398176 () V!28513)

(assert (=> b!880738 (not (contains!4232 (+!2555 lt!398172 (tuple2!11733 lt!398171 lt!398176)) lt!398173))))

(assert (=> b!880738 (= lt!398174 (addStillNotContains!206 lt!398172 lt!398171 lt!398176 lt!398173))))

(assert (=> b!880738 (= lt!398173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880738 (= lt!398176 (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880738 (= lt!398171 (select (arr!24676 _keys!868) from!1053))))

(declare-fun call!38871 () ListLongMap!10491)

(assert (=> b!880738 (= lt!398172 call!38871)))

(declare-fun e!490109 () ListLongMap!10491)

(assert (=> b!880738 (= e!490109 (+!2555 call!38871 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880739 () Bool)

(declare-fun e!490104 () Bool)

(declare-fun lt!398175 () ListLongMap!10491)

(assert (=> b!880739 (= e!490104 (isEmpty!672 lt!398175))))

(declare-fun b!880740 () Bool)

(declare-fun e!490105 () ListLongMap!10491)

(assert (=> b!880740 (= e!490105 (ListLongMap!10492 Nil!17524))))

(declare-fun b!880741 () Bool)

(assert (=> b!880741 (= e!490104 (= lt!398175 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880742 () Bool)

(declare-fun res!598450 () Bool)

(declare-fun e!490110 () Bool)

(assert (=> b!880742 (=> (not res!598450) (not e!490110))))

(assert (=> b!880742 (= res!598450 (not (contains!4232 lt!398175 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880743 () Bool)

(declare-fun e!490106 () Bool)

(assert (=> b!880743 (= e!490106 (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)))))

(assert (=> b!880743 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880744 () Bool)

(declare-fun e!490108 () Bool)

(declare-fun e!490107 () Bool)

(assert (=> b!880744 (= e!490108 e!490107)))

(assert (=> b!880744 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25118 _keys!868)))))

(declare-fun res!598448 () Bool)

(assert (=> b!880744 (= res!598448 (contains!4232 lt!398175 (select (arr!24676 _keys!868) from!1053)))))

(assert (=> b!880744 (=> (not res!598448) (not e!490107))))

(declare-fun d!108787 () Bool)

(assert (=> d!108787 e!490110))

(declare-fun res!598451 () Bool)

(assert (=> d!108787 (=> (not res!598451) (not e!490110))))

(assert (=> d!108787 (= res!598451 (not (contains!4232 lt!398175 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108787 (= lt!398175 e!490105)))

(declare-fun c!92810 () Bool)

(assert (=> d!108787 (= c!92810 (bvsge from!1053 (size!25118 _keys!868)))))

(assert (=> d!108787 (validMask!0 mask!1196)))

(assert (=> d!108787 (= (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398175)))

(declare-fun b!880745 () Bool)

(assert (=> b!880745 (= e!490105 e!490109)))

(declare-fun c!92811 () Bool)

(assert (=> b!880745 (= c!92811 (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)))))

(declare-fun b!880746 () Bool)

(assert (=> b!880746 (= e!490108 e!490104)))

(declare-fun c!92809 () Bool)

(assert (=> b!880746 (= c!92809 (bvslt from!1053 (size!25118 _keys!868)))))

(declare-fun b!880747 () Bool)

(assert (=> b!880747 (= e!490110 e!490108)))

(declare-fun c!92812 () Bool)

(assert (=> b!880747 (= c!92812 e!490106)))

(declare-fun res!598449 () Bool)

(assert (=> b!880747 (=> (not res!598449) (not e!490106))))

(assert (=> b!880747 (= res!598449 (bvslt from!1053 (size!25118 _keys!868)))))

(declare-fun b!880748 () Bool)

(assert (=> b!880748 (= e!490109 call!38871)))

(declare-fun b!880749 () Bool)

(assert (=> b!880749 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25118 _keys!868)))))

(assert (=> b!880749 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25119 _values!688)))))

(assert (=> b!880749 (= e!490107 (= (apply!380 lt!398175 (select (arr!24676 _keys!868) from!1053)) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38868 () Bool)

(assert (=> bm!38868 (= call!38871 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108787 c!92810) b!880740))

(assert (= (and d!108787 (not c!92810)) b!880745))

(assert (= (and b!880745 c!92811) b!880738))

(assert (= (and b!880745 (not c!92811)) b!880748))

(assert (= (or b!880738 b!880748) bm!38868))

(assert (= (and d!108787 res!598451) b!880742))

(assert (= (and b!880742 res!598450) b!880747))

(assert (= (and b!880747 res!598449) b!880743))

(assert (= (and b!880747 c!92812) b!880744))

(assert (= (and b!880747 (not c!92812)) b!880746))

(assert (= (and b!880744 res!598448) b!880749))

(assert (= (and b!880746 c!92809) b!880741))

(assert (= (and b!880746 (not c!92809)) b!880739))

(declare-fun b_lambda!12457 () Bool)

(assert (=> (not b_lambda!12457) (not b!880738)))

(assert (=> b!880738 t!24674))

(declare-fun b_and!25319 () Bool)

(assert (= b_and!25317 (and (=> t!24674 result!9643) b_and!25319)))

(declare-fun b_lambda!12459 () Bool)

(assert (=> (not b_lambda!12459) (not b!880749)))

(assert (=> b!880749 t!24674))

(declare-fun b_and!25321 () Bool)

(assert (= b_and!25319 (and (=> t!24674 result!9643) b_and!25321)))

(assert (=> b!880745 m!819863))

(assert (=> b!880745 m!819863))

(assert (=> b!880745 m!819865))

(declare-fun m!820027 () Bool)

(assert (=> b!880739 m!820027))

(assert (=> b!880744 m!819863))

(assert (=> b!880744 m!819863))

(declare-fun m!820029 () Bool)

(assert (=> b!880744 m!820029))

(assert (=> b!880743 m!819863))

(assert (=> b!880743 m!819863))

(assert (=> b!880743 m!819865))

(declare-fun m!820031 () Bool)

(assert (=> b!880741 m!820031))

(declare-fun m!820033 () Bool)

(assert (=> d!108787 m!820033))

(assert (=> d!108787 m!819893))

(assert (=> b!880749 m!819895))

(assert (=> b!880749 m!819895))

(assert (=> b!880749 m!819897))

(assert (=> b!880749 m!819899))

(assert (=> b!880749 m!819897))

(assert (=> b!880749 m!819863))

(declare-fun m!820035 () Bool)

(assert (=> b!880749 m!820035))

(assert (=> b!880749 m!819863))

(assert (=> bm!38868 m!820031))

(declare-fun m!820037 () Bool)

(assert (=> b!880738 m!820037))

(assert (=> b!880738 m!819895))

(assert (=> b!880738 m!819895))

(assert (=> b!880738 m!819897))

(assert (=> b!880738 m!819899))

(assert (=> b!880738 m!819897))

(declare-fun m!820039 () Bool)

(assert (=> b!880738 m!820039))

(assert (=> b!880738 m!820037))

(declare-fun m!820041 () Bool)

(assert (=> b!880738 m!820041))

(declare-fun m!820043 () Bool)

(assert (=> b!880738 m!820043))

(assert (=> b!880738 m!819863))

(declare-fun m!820045 () Bool)

(assert (=> b!880742 m!820045))

(assert (=> b!880589 d!108787))

(declare-fun d!108789 () Bool)

(assert (=> d!108789 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880586 d!108789))

(declare-fun b!880750 () Bool)

(declare-fun lt!398177 () Unit!30019)

(declare-fun lt!398181 () Unit!30019)

(assert (=> b!880750 (= lt!398177 lt!398181)))

(declare-fun lt!398180 () (_ BitVec 64))

(declare-fun lt!398179 () ListLongMap!10491)

(declare-fun lt!398183 () V!28513)

(declare-fun lt!398178 () (_ BitVec 64))

(assert (=> b!880750 (not (contains!4232 (+!2555 lt!398179 (tuple2!11733 lt!398178 lt!398183)) lt!398180))))

(assert (=> b!880750 (= lt!398181 (addStillNotContains!206 lt!398179 lt!398178 lt!398183 lt!398180))))

(assert (=> b!880750 (= lt!398180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880750 (= lt!398183 (get!12989 (select (arr!24677 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880750 (= lt!398178 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38872 () ListLongMap!10491)

(assert (=> b!880750 (= lt!398179 call!38872)))

(declare-fun e!490116 () ListLongMap!10491)

(assert (=> b!880750 (= e!490116 (+!2555 call!38872 (tuple2!11733 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12989 (select (arr!24677 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880751 () Bool)

(declare-fun e!490111 () Bool)

(declare-fun lt!398182 () ListLongMap!10491)

(assert (=> b!880751 (= e!490111 (isEmpty!672 lt!398182))))

(declare-fun b!880752 () Bool)

(declare-fun e!490112 () ListLongMap!10491)

(assert (=> b!880752 (= e!490112 (ListLongMap!10492 Nil!17524))))

(declare-fun b!880753 () Bool)

(assert (=> b!880753 (= e!490111 (= lt!398182 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880754 () Bool)

(declare-fun res!598454 () Bool)

(declare-fun e!490117 () Bool)

(assert (=> b!880754 (=> (not res!598454) (not e!490117))))

(assert (=> b!880754 (= res!598454 (not (contains!4232 lt!398182 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880755 () Bool)

(declare-fun e!490113 () Bool)

(assert (=> b!880755 (= e!490113 (validKeyInArray!0 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880755 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880756 () Bool)

(declare-fun e!490115 () Bool)

(declare-fun e!490114 () Bool)

(assert (=> b!880756 (= e!490115 e!490114)))

(assert (=> b!880756 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(declare-fun res!598452 () Bool)

(assert (=> b!880756 (= res!598452 (contains!4232 lt!398182 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880756 (=> (not res!598452) (not e!490114))))

(declare-fun d!108791 () Bool)

(assert (=> d!108791 e!490117))

(declare-fun res!598455 () Bool)

(assert (=> d!108791 (=> (not res!598455) (not e!490117))))

(assert (=> d!108791 (= res!598455 (not (contains!4232 lt!398182 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108791 (= lt!398182 e!490112)))

(declare-fun c!92814 () Bool)

(assert (=> d!108791 (= c!92814 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(assert (=> d!108791 (validMask!0 mask!1196)))

(assert (=> d!108791 (= (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398182)))

(declare-fun b!880757 () Bool)

(assert (=> b!880757 (= e!490112 e!490116)))

(declare-fun c!92815 () Bool)

(assert (=> b!880757 (= c!92815 (validKeyInArray!0 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!880758 () Bool)

(assert (=> b!880758 (= e!490115 e!490111)))

(declare-fun c!92813 () Bool)

(assert (=> b!880758 (= c!92813 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(declare-fun b!880759 () Bool)

(assert (=> b!880759 (= e!490117 e!490115)))

(declare-fun c!92816 () Bool)

(assert (=> b!880759 (= c!92816 e!490113)))

(declare-fun res!598453 () Bool)

(assert (=> b!880759 (=> (not res!598453) (not e!490113))))

(assert (=> b!880759 (= res!598453 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(declare-fun b!880760 () Bool)

(assert (=> b!880760 (= e!490116 call!38872)))

(declare-fun b!880761 () Bool)

(assert (=> b!880761 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(assert (=> b!880761 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25119 _values!688)))))

(assert (=> b!880761 (= e!490114 (= (apply!380 lt!398182 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12989 (select (arr!24677 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38869 () Bool)

(assert (=> bm!38869 (= call!38872 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108791 c!92814) b!880752))

(assert (= (and d!108791 (not c!92814)) b!880757))

(assert (= (and b!880757 c!92815) b!880750))

(assert (= (and b!880757 (not c!92815)) b!880760))

(assert (= (or b!880750 b!880760) bm!38869))

(assert (= (and d!108791 res!598455) b!880754))

(assert (= (and b!880754 res!598454) b!880759))

(assert (= (and b!880759 res!598453) b!880755))

(assert (= (and b!880759 c!92816) b!880756))

(assert (= (and b!880759 (not c!92816)) b!880758))

(assert (= (and b!880756 res!598452) b!880761))

(assert (= (and b!880758 c!92813) b!880753))

(assert (= (and b!880758 (not c!92813)) b!880751))

(declare-fun b_lambda!12461 () Bool)

(assert (=> (not b_lambda!12461) (not b!880750)))

(assert (=> b!880750 t!24674))

(declare-fun b_and!25323 () Bool)

(assert (= b_and!25321 (and (=> t!24674 result!9643) b_and!25323)))

(declare-fun b_lambda!12463 () Bool)

(assert (=> (not b_lambda!12463) (not b!880761)))

(assert (=> b!880761 t!24674))

(declare-fun b_and!25325 () Bool)

(assert (= b_and!25323 (and (=> t!24674 result!9643) b_and!25325)))

(declare-fun m!820047 () Bool)

(assert (=> b!880757 m!820047))

(assert (=> b!880757 m!820047))

(declare-fun m!820049 () Bool)

(assert (=> b!880757 m!820049))

(declare-fun m!820051 () Bool)

(assert (=> b!880751 m!820051))

(assert (=> b!880756 m!820047))

(assert (=> b!880756 m!820047))

(declare-fun m!820053 () Bool)

(assert (=> b!880756 m!820053))

(assert (=> b!880755 m!820047))

(assert (=> b!880755 m!820047))

(assert (=> b!880755 m!820049))

(declare-fun m!820055 () Bool)

(assert (=> b!880753 m!820055))

(declare-fun m!820057 () Bool)

(assert (=> d!108791 m!820057))

(assert (=> d!108791 m!819893))

(declare-fun m!820059 () Bool)

(assert (=> b!880761 m!820059))

(assert (=> b!880761 m!820059))

(assert (=> b!880761 m!819897))

(declare-fun m!820061 () Bool)

(assert (=> b!880761 m!820061))

(assert (=> b!880761 m!819897))

(assert (=> b!880761 m!820047))

(declare-fun m!820063 () Bool)

(assert (=> b!880761 m!820063))

(assert (=> b!880761 m!820047))

(assert (=> bm!38869 m!820055))

(declare-fun m!820065 () Bool)

(assert (=> b!880750 m!820065))

(assert (=> b!880750 m!820059))

(assert (=> b!880750 m!820059))

(assert (=> b!880750 m!819897))

(assert (=> b!880750 m!820061))

(assert (=> b!880750 m!819897))

(declare-fun m!820067 () Bool)

(assert (=> b!880750 m!820067))

(assert (=> b!880750 m!820065))

(declare-fun m!820069 () Bool)

(assert (=> b!880750 m!820069))

(declare-fun m!820071 () Bool)

(assert (=> b!880750 m!820071))

(assert (=> b!880750 m!820047))

(declare-fun m!820073 () Bool)

(assert (=> b!880754 m!820073))

(assert (=> b!880591 d!108791))

(declare-fun d!108793 () Bool)

(assert (=> d!108793 (= (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)) (and (not (= (select (arr!24676 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24676 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880591 d!108793))

(declare-fun b!880768 () Bool)

(declare-fun e!490122 () Bool)

(declare-fun call!38878 () ListLongMap!10491)

(declare-fun call!38877 () ListLongMap!10491)

(assert (=> b!880768 (= e!490122 (= call!38878 call!38877))))

(declare-fun bm!38874 () Bool)

(assert (=> bm!38874 (= call!38877 (getCurrentListMapNoExtraKeys!3252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38875 () Bool)

(assert (=> bm!38875 (= call!38878 (getCurrentListMapNoExtraKeys!3252 _keys!868 (array!51306 (store (arr!24677 _values!688) i!612 (ValueCellFull!8360 v!557)) (size!25119 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!108795 () Bool)

(declare-fun e!490123 () Bool)

(assert (=> d!108795 e!490123))

(declare-fun res!598458 () Bool)

(assert (=> d!108795 (=> (not res!598458) (not e!490123))))

(assert (=> d!108795 (= res!598458 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25119 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25119 _values!688))))))))

(declare-fun lt!398186 () Unit!30019)

(declare-fun choose!1445 (array!51303 array!51305 (_ BitVec 32) (_ BitVec 32) V!28513 V!28513 (_ BitVec 32) (_ BitVec 64) V!28513 (_ BitVec 32) Int) Unit!30019)

(assert (=> d!108795 (= lt!398186 (choose!1445 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108795 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(assert (=> d!108795 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398186)))

(declare-fun b!880769 () Bool)

(assert (=> b!880769 (= e!490123 e!490122)))

(declare-fun c!92819 () Bool)

(assert (=> b!880769 (= c!92819 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!880770 () Bool)

(assert (=> b!880770 (= e!490122 (= call!38878 (+!2555 call!38877 (tuple2!11733 k0!854 v!557))))))

(assert (= (and d!108795 res!598458) b!880769))

(assert (= (and b!880769 c!92819) b!880770))

(assert (= (and b!880769 (not c!92819)) b!880768))

(assert (= (or b!880770 b!880768) bm!38874))

(assert (= (or b!880770 b!880768) bm!38875))

(assert (=> bm!38874 m!819859))

(assert (=> bm!38875 m!819883))

(declare-fun m!820075 () Bool)

(assert (=> bm!38875 m!820075))

(declare-fun m!820077 () Bool)

(assert (=> d!108795 m!820077))

(declare-fun m!820079 () Bool)

(assert (=> b!880770 m!820079))

(assert (=> b!880591 d!108795))

(declare-fun b!880771 () Bool)

(declare-fun lt!398187 () Unit!30019)

(declare-fun lt!398191 () Unit!30019)

(assert (=> b!880771 (= lt!398187 lt!398191)))

(declare-fun lt!398188 () (_ BitVec 64))

(declare-fun lt!398189 () ListLongMap!10491)

(declare-fun lt!398193 () V!28513)

(declare-fun lt!398190 () (_ BitVec 64))

(assert (=> b!880771 (not (contains!4232 (+!2555 lt!398189 (tuple2!11733 lt!398188 lt!398193)) lt!398190))))

(assert (=> b!880771 (= lt!398191 (addStillNotContains!206 lt!398189 lt!398188 lt!398193 lt!398190))))

(assert (=> b!880771 (= lt!398190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880771 (= lt!398193 (get!12989 (select (arr!24677 lt!398100) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880771 (= lt!398188 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38879 () ListLongMap!10491)

(assert (=> b!880771 (= lt!398189 call!38879)))

(declare-fun e!490129 () ListLongMap!10491)

(assert (=> b!880771 (= e!490129 (+!2555 call!38879 (tuple2!11733 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12989 (select (arr!24677 lt!398100) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880772 () Bool)

(declare-fun e!490124 () Bool)

(declare-fun lt!398192 () ListLongMap!10491)

(assert (=> b!880772 (= e!490124 (isEmpty!672 lt!398192))))

(declare-fun b!880773 () Bool)

(declare-fun e!490125 () ListLongMap!10491)

(assert (=> b!880773 (= e!490125 (ListLongMap!10492 Nil!17524))))

(declare-fun b!880774 () Bool)

(assert (=> b!880774 (= e!490124 (= lt!398192 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880775 () Bool)

(declare-fun res!598461 () Bool)

(declare-fun e!490130 () Bool)

(assert (=> b!880775 (=> (not res!598461) (not e!490130))))

(assert (=> b!880775 (= res!598461 (not (contains!4232 lt!398192 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880776 () Bool)

(declare-fun e!490126 () Bool)

(assert (=> b!880776 (= e!490126 (validKeyInArray!0 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880776 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880777 () Bool)

(declare-fun e!490128 () Bool)

(declare-fun e!490127 () Bool)

(assert (=> b!880777 (= e!490128 e!490127)))

(assert (=> b!880777 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(declare-fun res!598459 () Bool)

(assert (=> b!880777 (= res!598459 (contains!4232 lt!398192 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880777 (=> (not res!598459) (not e!490127))))

(declare-fun d!108797 () Bool)

(assert (=> d!108797 e!490130))

(declare-fun res!598462 () Bool)

(assert (=> d!108797 (=> (not res!598462) (not e!490130))))

(assert (=> d!108797 (= res!598462 (not (contains!4232 lt!398192 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108797 (= lt!398192 e!490125)))

(declare-fun c!92821 () Bool)

(assert (=> d!108797 (= c!92821 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(assert (=> d!108797 (validMask!0 mask!1196)))

(assert (=> d!108797 (= (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398192)))

(declare-fun b!880778 () Bool)

(assert (=> b!880778 (= e!490125 e!490129)))

(declare-fun c!92822 () Bool)

(assert (=> b!880778 (= c!92822 (validKeyInArray!0 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!880779 () Bool)

(assert (=> b!880779 (= e!490128 e!490124)))

(declare-fun c!92820 () Bool)

(assert (=> b!880779 (= c!92820 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(declare-fun b!880780 () Bool)

(assert (=> b!880780 (= e!490130 e!490128)))

(declare-fun c!92823 () Bool)

(assert (=> b!880780 (= c!92823 e!490126)))

(declare-fun res!598460 () Bool)

(assert (=> b!880780 (=> (not res!598460) (not e!490126))))

(assert (=> b!880780 (= res!598460 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(declare-fun b!880781 () Bool)

(assert (=> b!880781 (= e!490129 call!38879)))

(declare-fun b!880782 () Bool)

(assert (=> b!880782 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25118 _keys!868)))))

(assert (=> b!880782 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25119 lt!398100)))))

(assert (=> b!880782 (= e!490127 (= (apply!380 lt!398192 (select (arr!24676 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12989 (select (arr!24677 lt!398100) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38876 () Bool)

(assert (=> bm!38876 (= call!38879 (getCurrentListMapNoExtraKeys!3252 _keys!868 lt!398100 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108797 c!92821) b!880773))

(assert (= (and d!108797 (not c!92821)) b!880778))

(assert (= (and b!880778 c!92822) b!880771))

(assert (= (and b!880778 (not c!92822)) b!880781))

(assert (= (or b!880771 b!880781) bm!38876))

(assert (= (and d!108797 res!598462) b!880775))

(assert (= (and b!880775 res!598461) b!880780))

(assert (= (and b!880780 res!598460) b!880776))

(assert (= (and b!880780 c!92823) b!880777))

(assert (= (and b!880780 (not c!92823)) b!880779))

(assert (= (and b!880777 res!598459) b!880782))

(assert (= (and b!880779 c!92820) b!880774))

(assert (= (and b!880779 (not c!92820)) b!880772))

(declare-fun b_lambda!12465 () Bool)

(assert (=> (not b_lambda!12465) (not b!880771)))

(assert (=> b!880771 t!24674))

(declare-fun b_and!25327 () Bool)

(assert (= b_and!25325 (and (=> t!24674 result!9643) b_and!25327)))

(declare-fun b_lambda!12467 () Bool)

(assert (=> (not b_lambda!12467) (not b!880782)))

(assert (=> b!880782 t!24674))

(declare-fun b_and!25329 () Bool)

(assert (= b_and!25327 (and (=> t!24674 result!9643) b_and!25329)))

(assert (=> b!880778 m!820047))

(assert (=> b!880778 m!820047))

(assert (=> b!880778 m!820049))

(declare-fun m!820081 () Bool)

(assert (=> b!880772 m!820081))

(assert (=> b!880777 m!820047))

(assert (=> b!880777 m!820047))

(declare-fun m!820083 () Bool)

(assert (=> b!880777 m!820083))

(assert (=> b!880776 m!820047))

(assert (=> b!880776 m!820047))

(assert (=> b!880776 m!820049))

(declare-fun m!820085 () Bool)

(assert (=> b!880774 m!820085))

(declare-fun m!820087 () Bool)

(assert (=> d!108797 m!820087))

(assert (=> d!108797 m!819893))

(declare-fun m!820089 () Bool)

(assert (=> b!880782 m!820089))

(assert (=> b!880782 m!820089))

(assert (=> b!880782 m!819897))

(declare-fun m!820091 () Bool)

(assert (=> b!880782 m!820091))

(assert (=> b!880782 m!819897))

(assert (=> b!880782 m!820047))

(declare-fun m!820093 () Bool)

(assert (=> b!880782 m!820093))

(assert (=> b!880782 m!820047))

(assert (=> bm!38876 m!820085))

(declare-fun m!820095 () Bool)

(assert (=> b!880771 m!820095))

(assert (=> b!880771 m!820089))

(assert (=> b!880771 m!820089))

(assert (=> b!880771 m!819897))

(assert (=> b!880771 m!820091))

(assert (=> b!880771 m!819897))

(declare-fun m!820097 () Bool)

(assert (=> b!880771 m!820097))

(assert (=> b!880771 m!820095))

(declare-fun m!820099 () Bool)

(assert (=> b!880771 m!820099))

(declare-fun m!820101 () Bool)

(assert (=> b!880771 m!820101))

(assert (=> b!880771 m!820047))

(declare-fun m!820103 () Bool)

(assert (=> b!880775 m!820103))

(assert (=> b!880591 d!108797))

(declare-fun d!108799 () Bool)

(declare-fun e!490133 () Bool)

(assert (=> d!108799 e!490133))

(declare-fun res!598467 () Bool)

(assert (=> d!108799 (=> (not res!598467) (not e!490133))))

(declare-fun lt!398203 () ListLongMap!10491)

(assert (=> d!108799 (= res!598467 (contains!4232 lt!398203 (_1!5877 (tuple2!11733 k0!854 v!557))))))

(declare-fun lt!398205 () List!17527)

(assert (=> d!108799 (= lt!398203 (ListLongMap!10492 lt!398205))))

(declare-fun lt!398202 () Unit!30019)

(declare-fun lt!398204 () Unit!30019)

(assert (=> d!108799 (= lt!398202 lt!398204)))

(declare-datatypes ((Option!426 0))(
  ( (Some!425 (v!11295 V!28513)) (None!424) )
))
(declare-fun getValueByKey!420 (List!17527 (_ BitVec 64)) Option!426)

(assert (=> d!108799 (= (getValueByKey!420 lt!398205 (_1!5877 (tuple2!11733 k0!854 v!557))) (Some!425 (_2!5877 (tuple2!11733 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!237 (List!17527 (_ BitVec 64) V!28513) Unit!30019)

(assert (=> d!108799 (= lt!398204 (lemmaContainsTupThenGetReturnValue!237 lt!398205 (_1!5877 (tuple2!11733 k0!854 v!557)) (_2!5877 (tuple2!11733 k0!854 v!557))))))

(declare-fun insertStrictlySorted!276 (List!17527 (_ BitVec 64) V!28513) List!17527)

(assert (=> d!108799 (= lt!398205 (insertStrictlySorted!276 (toList!5261 lt!398098) (_1!5877 (tuple2!11733 k0!854 v!557)) (_2!5877 (tuple2!11733 k0!854 v!557))))))

(assert (=> d!108799 (= (+!2555 lt!398098 (tuple2!11733 k0!854 v!557)) lt!398203)))

(declare-fun b!880787 () Bool)

(declare-fun res!598468 () Bool)

(assert (=> b!880787 (=> (not res!598468) (not e!490133))))

(assert (=> b!880787 (= res!598468 (= (getValueByKey!420 (toList!5261 lt!398203) (_1!5877 (tuple2!11733 k0!854 v!557))) (Some!425 (_2!5877 (tuple2!11733 k0!854 v!557)))))))

(declare-fun b!880788 () Bool)

(declare-fun contains!4233 (List!17527 tuple2!11732) Bool)

(assert (=> b!880788 (= e!490133 (contains!4233 (toList!5261 lt!398203) (tuple2!11733 k0!854 v!557)))))

(assert (= (and d!108799 res!598467) b!880787))

(assert (= (and b!880787 res!598468) b!880788))

(declare-fun m!820105 () Bool)

(assert (=> d!108799 m!820105))

(declare-fun m!820107 () Bool)

(assert (=> d!108799 m!820107))

(declare-fun m!820109 () Bool)

(assert (=> d!108799 m!820109))

(declare-fun m!820111 () Bool)

(assert (=> d!108799 m!820111))

(declare-fun m!820113 () Bool)

(assert (=> b!880787 m!820113))

(declare-fun m!820115 () Bool)

(assert (=> b!880788 m!820115))

(assert (=> b!880591 d!108799))

(declare-fun d!108801 () Bool)

(declare-fun e!490134 () Bool)

(assert (=> d!108801 e!490134))

(declare-fun res!598469 () Bool)

(assert (=> d!108801 (=> (not res!598469) (not e!490134))))

(declare-fun lt!398207 () ListLongMap!10491)

(assert (=> d!108801 (= res!598469 (contains!4232 lt!398207 (_1!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398209 () List!17527)

(assert (=> d!108801 (= lt!398207 (ListLongMap!10492 lt!398209))))

(declare-fun lt!398206 () Unit!30019)

(declare-fun lt!398208 () Unit!30019)

(assert (=> d!108801 (= lt!398206 lt!398208)))

(assert (=> d!108801 (= (getValueByKey!420 lt!398209 (_1!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108801 (= lt!398208 (lemmaContainsTupThenGetReturnValue!237 lt!398209 (_1!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108801 (= lt!398209 (insertStrictlySorted!276 (toList!5261 lt!398099) (_1!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108801 (= (+!2555 lt!398099 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398207)))

(declare-fun b!880789 () Bool)

(declare-fun res!598470 () Bool)

(assert (=> b!880789 (=> (not res!598470) (not e!490134))))

(assert (=> b!880789 (= res!598470 (= (getValueByKey!420 (toList!5261 lt!398207) (_1!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5877 (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!880790 () Bool)

(assert (=> b!880790 (= e!490134 (contains!4233 (toList!5261 lt!398207) (tuple2!11733 (select (arr!24676 _keys!868) from!1053) (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108801 res!598469) b!880789))

(assert (= (and b!880789 res!598470) b!880790))

(declare-fun m!820117 () Bool)

(assert (=> d!108801 m!820117))

(declare-fun m!820119 () Bool)

(assert (=> d!108801 m!820119))

(declare-fun m!820121 () Bool)

(assert (=> d!108801 m!820121))

(declare-fun m!820123 () Bool)

(assert (=> d!108801 m!820123))

(declare-fun m!820125 () Bool)

(assert (=> b!880789 m!820125))

(declare-fun m!820127 () Bool)

(assert (=> b!880790 m!820127))

(assert (=> b!880585 d!108801))

(declare-fun d!108803 () Bool)

(declare-fun c!92826 () Bool)

(assert (=> d!108803 (= c!92826 ((_ is ValueCellFull!8360) (select (arr!24677 _values!688) from!1053)))))

(declare-fun e!490137 () V!28513)

(assert (=> d!108803 (= (get!12989 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490137)))

(declare-fun b!880795 () Bool)

(declare-fun get!12990 (ValueCell!8360 V!28513) V!28513)

(assert (=> b!880795 (= e!490137 (get!12990 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880796 () Bool)

(declare-fun get!12991 (ValueCell!8360 V!28513) V!28513)

(assert (=> b!880796 (= e!490137 (get!12991 (select (arr!24677 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108803 c!92826) b!880795))

(assert (= (and d!108803 (not c!92826)) b!880796))

(assert (=> b!880795 m!819895))

(assert (=> b!880795 m!819897))

(declare-fun m!820129 () Bool)

(assert (=> b!880795 m!820129))

(assert (=> b!880796 m!819895))

(assert (=> b!880796 m!819897))

(declare-fun m!820131 () Bool)

(assert (=> b!880796 m!820131))

(assert (=> b!880585 d!108803))

(declare-fun bm!38879 () Bool)

(declare-fun call!38882 () Bool)

(assert (=> bm!38879 (= call!38882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!880805 () Bool)

(declare-fun e!490146 () Bool)

(assert (=> b!880805 (= e!490146 call!38882)))

(declare-fun d!108805 () Bool)

(declare-fun res!598475 () Bool)

(declare-fun e!490144 () Bool)

(assert (=> d!108805 (=> res!598475 e!490144)))

(assert (=> d!108805 (= res!598475 (bvsge #b00000000000000000000000000000000 (size!25118 _keys!868)))))

(assert (=> d!108805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490144)))

(declare-fun b!880806 () Bool)

(assert (=> b!880806 (= e!490144 e!490146)))

(declare-fun c!92829 () Bool)

(assert (=> b!880806 (= c!92829 (validKeyInArray!0 (select (arr!24676 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!880807 () Bool)

(declare-fun e!490145 () Bool)

(assert (=> b!880807 (= e!490145 call!38882)))

(declare-fun b!880808 () Bool)

(assert (=> b!880808 (= e!490146 e!490145)))

(declare-fun lt!398218 () (_ BitVec 64))

(assert (=> b!880808 (= lt!398218 (select (arr!24676 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398216 () Unit!30019)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51303 (_ BitVec 64) (_ BitVec 32)) Unit!30019)

(assert (=> b!880808 (= lt!398216 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398218 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!880808 (arrayContainsKey!0 _keys!868 lt!398218 #b00000000000000000000000000000000)))

(declare-fun lt!398217 () Unit!30019)

(assert (=> b!880808 (= lt!398217 lt!398216)))

(declare-fun res!598476 () Bool)

(declare-datatypes ((SeekEntryResult!8752 0))(
  ( (MissingZero!8752 (index!37379 (_ BitVec 32))) (Found!8752 (index!37380 (_ BitVec 32))) (Intermediate!8752 (undefined!9564 Bool) (index!37381 (_ BitVec 32)) (x!74641 (_ BitVec 32))) (Undefined!8752) (MissingVacant!8752 (index!37382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51303 (_ BitVec 32)) SeekEntryResult!8752)

(assert (=> b!880808 (= res!598476 (= (seekEntryOrOpen!0 (select (arr!24676 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8752 #b00000000000000000000000000000000)))))

(assert (=> b!880808 (=> (not res!598476) (not e!490145))))

(assert (= (and d!108805 (not res!598475)) b!880806))

(assert (= (and b!880806 c!92829) b!880808))

(assert (= (and b!880806 (not c!92829)) b!880805))

(assert (= (and b!880808 res!598476) b!880807))

(assert (= (or b!880807 b!880805) bm!38879))

(declare-fun m!820133 () Bool)

(assert (=> bm!38879 m!820133))

(assert (=> b!880806 m!819995))

(assert (=> b!880806 m!819995))

(assert (=> b!880806 m!819997))

(assert (=> b!880808 m!819995))

(declare-fun m!820135 () Bool)

(assert (=> b!880808 m!820135))

(declare-fun m!820137 () Bool)

(assert (=> b!880808 m!820137))

(assert (=> b!880808 m!819995))

(declare-fun m!820139 () Bool)

(assert (=> b!880808 m!820139))

(assert (=> b!880592 d!108805))

(declare-fun d!108807 () Bool)

(assert (=> d!108807 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!880596 d!108807))

(declare-fun b!880809 () Bool)

(declare-fun e!490148 () Bool)

(declare-fun e!490149 () Bool)

(assert (=> b!880809 (= e!490148 e!490149)))

(declare-fun c!92830 () Bool)

(assert (=> b!880809 (= c!92830 (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)))))

(declare-fun d!108809 () Bool)

(declare-fun res!598478 () Bool)

(declare-fun e!490150 () Bool)

(assert (=> d!108809 (=> res!598478 e!490150)))

(assert (=> d!108809 (= res!598478 (bvsge from!1053 (size!25118 _keys!868)))))

(assert (=> d!108809 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17525) e!490150)))

(declare-fun b!880810 () Bool)

(declare-fun call!38883 () Bool)

(assert (=> b!880810 (= e!490149 call!38883)))

(declare-fun b!880811 () Bool)

(declare-fun e!490147 () Bool)

(assert (=> b!880811 (= e!490147 (contains!4231 Nil!17525 (select (arr!24676 _keys!868) from!1053)))))

(declare-fun b!880812 () Bool)

(assert (=> b!880812 (= e!490150 e!490148)))

(declare-fun res!598477 () Bool)

(assert (=> b!880812 (=> (not res!598477) (not e!490148))))

(assert (=> b!880812 (= res!598477 (not e!490147))))

(declare-fun res!598479 () Bool)

(assert (=> b!880812 (=> (not res!598479) (not e!490147))))

(assert (=> b!880812 (= res!598479 (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053)))))

(declare-fun bm!38880 () Bool)

(assert (=> bm!38880 (= call!38883 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92830 (Cons!17524 (select (arr!24676 _keys!868) from!1053) Nil!17525) Nil!17525)))))

(declare-fun b!880813 () Bool)

(assert (=> b!880813 (= e!490149 call!38883)))

(assert (= (and d!108809 (not res!598478)) b!880812))

(assert (= (and b!880812 res!598479) b!880811))

(assert (= (and b!880812 res!598477) b!880809))

(assert (= (and b!880809 c!92830) b!880810))

(assert (= (and b!880809 (not c!92830)) b!880813))

(assert (= (or b!880810 b!880813) bm!38880))

(assert (=> b!880809 m!819863))

(assert (=> b!880809 m!819863))

(assert (=> b!880809 m!819865))

(assert (=> b!880811 m!819863))

(assert (=> b!880811 m!819863))

(declare-fun m!820141 () Bool)

(assert (=> b!880811 m!820141))

(assert (=> b!880812 m!819863))

(assert (=> b!880812 m!819863))

(assert (=> b!880812 m!819865))

(assert (=> bm!38880 m!819863))

(declare-fun m!820143 () Bool)

(assert (=> bm!38880 m!820143))

(assert (=> b!880593 d!108809))

(declare-fun d!108811 () Bool)

(assert (=> d!108811 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17525)))

(declare-fun lt!398221 () Unit!30019)

(declare-fun choose!39 (array!51303 (_ BitVec 32) (_ BitVec 32)) Unit!30019)

(assert (=> d!108811 (= lt!398221 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!108811 (bvslt (size!25118 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!108811 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398221)))

(declare-fun bs!24684 () Bool)

(assert (= bs!24684 d!108811))

(assert (=> bs!24684 m!819875))

(declare-fun m!820145 () Bool)

(assert (=> bs!24684 m!820145))

(assert (=> b!880593 d!108811))

(declare-fun b!880820 () Bool)

(declare-fun e!490155 () Bool)

(assert (=> b!880820 (= e!490155 tp_is_empty!17599)))

(declare-fun mapNonEmpty!28029 () Bool)

(declare-fun mapRes!28029 () Bool)

(declare-fun tp!53769 () Bool)

(assert (=> mapNonEmpty!28029 (= mapRes!28029 (and tp!53769 e!490155))))

(declare-fun mapRest!28029 () (Array (_ BitVec 32) ValueCell!8360))

(declare-fun mapValue!28029 () ValueCell!8360)

(declare-fun mapKey!28029 () (_ BitVec 32))

(assert (=> mapNonEmpty!28029 (= mapRest!28020 (store mapRest!28029 mapKey!28029 mapValue!28029))))

(declare-fun condMapEmpty!28029 () Bool)

(declare-fun mapDefault!28029 () ValueCell!8360)

(assert (=> mapNonEmpty!28020 (= condMapEmpty!28029 (= mapRest!28020 ((as const (Array (_ BitVec 32) ValueCell!8360)) mapDefault!28029)))))

(declare-fun e!490156 () Bool)

(assert (=> mapNonEmpty!28020 (= tp!53754 (and e!490156 mapRes!28029))))

(declare-fun mapIsEmpty!28029 () Bool)

(assert (=> mapIsEmpty!28029 mapRes!28029))

(declare-fun b!880821 () Bool)

(assert (=> b!880821 (= e!490156 tp_is_empty!17599)))

(assert (= (and mapNonEmpty!28020 condMapEmpty!28029) mapIsEmpty!28029))

(assert (= (and mapNonEmpty!28020 (not condMapEmpty!28029)) mapNonEmpty!28029))

(assert (= (and mapNonEmpty!28029 ((_ is ValueCellFull!8360) mapValue!28029)) b!880820))

(assert (= (and mapNonEmpty!28020 ((_ is ValueCellFull!8360) mapDefault!28029)) b!880821))

(declare-fun m!820147 () Bool)

(assert (=> mapNonEmpty!28029 m!820147))

(declare-fun b_lambda!12469 () Bool)

(assert (= b_lambda!12453 (or (and start!74688 b_free!15355) b_lambda!12469)))

(declare-fun b_lambda!12471 () Bool)

(assert (= b_lambda!12463 (or (and start!74688 b_free!15355) b_lambda!12471)))

(declare-fun b_lambda!12473 () Bool)

(assert (= b_lambda!12461 (or (and start!74688 b_free!15355) b_lambda!12473)))

(declare-fun b_lambda!12475 () Bool)

(assert (= b_lambda!12465 (or (and start!74688 b_free!15355) b_lambda!12475)))

(declare-fun b_lambda!12477 () Bool)

(assert (= b_lambda!12457 (or (and start!74688 b_free!15355) b_lambda!12477)))

(declare-fun b_lambda!12479 () Bool)

(assert (= b_lambda!12467 (or (and start!74688 b_free!15355) b_lambda!12479)))

(declare-fun b_lambda!12481 () Bool)

(assert (= b_lambda!12455 (or (and start!74688 b_free!15355) b_lambda!12481)))

(declare-fun b_lambda!12483 () Bool)

(assert (= b_lambda!12459 (or (and start!74688 b_free!15355) b_lambda!12483)))

(check-sat (not b!880751) tp_is_empty!17599 (not b_lambda!12483) (not bm!38875) (not b_lambda!12477) (not d!108811) (not b!880739) (not d!108791) (not bm!38876) (not bm!38869) (not b!880778) (not d!108797) (not b!880808) (not b!880749) (not b!880775) (not d!108799) (not b!880738) (not b!880700) (not b!880806) (not b!880782) (not d!108785) (not b!880787) (not b!880731) (not b!880730) (not b!880737) (not b!880811) (not b!880729) (not b!880771) (not b_next!15355) (not b!880790) (not b!880756) (not b!880726) (not b!880754) (not b!880770) (not b!880772) (not b!880745) (not b!880796) (not b!880774) (not bm!38879) (not b_lambda!12473) (not b!880761) (not b!880741) (not b!880776) (not b!880753) (not b!880795) (not b_lambda!12475) (not d!108787) (not b_lambda!12469) (not b!880809) (not b_lambda!12451) (not b!880743) (not b!880755) (not b!880777) (not b!880732) (not d!108801) (not b!880699) (not mapNonEmpty!28029) (not b!880744) (not b!880812) (not b!880750) (not b_lambda!12471) (not b!880727) (not b!880757) (not b_lambda!12479) (not b!880742) (not bm!38874) b_and!25329 (not bm!38880) (not d!108795) (not b!880789) (not b!880788) (not b_lambda!12481) (not bm!38864) (not bm!38867) (not bm!38868) (not b!880697) (not b!880733))
(check-sat b_and!25329 (not b_next!15355))
