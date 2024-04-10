; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74736 () Bool)

(assert start!74736)

(declare-fun b_free!15363 () Bool)

(declare-fun b_next!15363 () Bool)

(assert (=> start!74736 (= b_free!15363 (not b_next!15363))))

(declare-fun tp!53780 () Bool)

(declare-fun b_and!25361 () Bool)

(assert (=> start!74736 (= tp!53780 b_and!25361)))

(declare-fun mapIsEmpty!28035 () Bool)

(declare-fun mapRes!28035 () Bool)

(assert (=> mapIsEmpty!28035 mapRes!28035))

(declare-fun mapNonEmpty!28035 () Bool)

(declare-fun tp!53779 () Bool)

(declare-fun e!490351 () Bool)

(assert (=> mapNonEmpty!28035 (= mapRes!28035 (and tp!53779 e!490351))))

(declare-datatypes ((V!28523 0))(
  ( (V!28524 (val!8851 Int)) )
))
(declare-datatypes ((ValueCell!8364 0))(
  ( (ValueCellFull!8364 (v!11303 V!28523)) (EmptyCell!8364) )
))
(declare-fun mapRest!28035 () (Array (_ BitVec 32) ValueCell!8364))

(declare-fun mapKey!28035 () (_ BitVec 32))

(declare-fun mapValue!28035 () ValueCell!8364)

(declare-datatypes ((array!51340 0))(
  ( (array!51341 (arr!24693 (Array (_ BitVec 32) ValueCell!8364)) (size!25133 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51340)

(assert (=> mapNonEmpty!28035 (= (arr!24693 _values!688) (store mapRest!28035 mapKey!28035 mapValue!28035))))

(declare-fun b!881138 () Bool)

(declare-fun res!598650 () Bool)

(declare-fun e!490358 () Bool)

(assert (=> b!881138 (=> (not res!598650) (not e!490358))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881138 (= res!598650 (validKeyInArray!0 k0!854))))

(declare-fun b!881139 () Bool)

(declare-fun res!598661 () Bool)

(assert (=> b!881139 (=> (not res!598661) (not e!490358))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881139 (= res!598661 (validMask!0 mask!1196))))

(declare-fun b!881140 () Bool)

(declare-fun res!598651 () Bool)

(assert (=> b!881140 (=> (not res!598651) (not e!490358))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51342 0))(
  ( (array!51343 (arr!24694 (Array (_ BitVec 32) (_ BitVec 64))) (size!25134 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51342)

(assert (=> b!881140 (= res!598651 (and (= (size!25133 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25134 _keys!868) (size!25133 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881141 () Bool)

(declare-fun res!598653 () Bool)

(assert (=> b!881141 (=> (not res!598653) (not e!490358))))

(declare-datatypes ((List!17529 0))(
  ( (Nil!17526) (Cons!17525 (h!18656 (_ BitVec 64)) (t!24694 List!17529)) )
))
(declare-fun arrayNoDuplicates!0 (array!51342 (_ BitVec 32) List!17529) Bool)

(assert (=> b!881141 (= res!598653 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17526))))

(declare-fun b!881142 () Bool)

(declare-fun e!490356 () Bool)

(declare-fun e!490350 () Bool)

(assert (=> b!881142 (= e!490356 (and e!490350 mapRes!28035))))

(declare-fun condMapEmpty!28035 () Bool)

(declare-fun mapDefault!28035 () ValueCell!8364)

(assert (=> b!881142 (= condMapEmpty!28035 (= (arr!24693 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8364)) mapDefault!28035)))))

(declare-fun b!881143 () Bool)

(declare-fun res!598655 () Bool)

(assert (=> b!881143 (=> (not res!598655) (not e!490358))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881143 (= res!598655 (and (= (select (arr!24694 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881144 () Bool)

(declare-fun tp_is_empty!17607 () Bool)

(assert (=> b!881144 (= e!490350 tp_is_empty!17607)))

(declare-fun b!881145 () Bool)

(declare-fun res!598659 () Bool)

(assert (=> b!881145 (=> (not res!598659) (not e!490358))))

(assert (=> b!881145 (= res!598659 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25134 _keys!868))))))

(declare-fun b!881146 () Bool)

(declare-fun e!490354 () Bool)

(assert (=> b!881146 (= e!490358 e!490354)))

(declare-fun res!598660 () Bool)

(assert (=> b!881146 (=> (not res!598660) (not e!490354))))

(assert (=> b!881146 (= res!598660 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11714 0))(
  ( (tuple2!11715 (_1!5868 (_ BitVec 64)) (_2!5868 V!28523)) )
))
(declare-datatypes ((List!17530 0))(
  ( (Nil!17527) (Cons!17526 (h!18657 tuple2!11714) (t!24695 List!17530)) )
))
(declare-datatypes ((ListLongMap!10483 0))(
  ( (ListLongMap!10484 (toList!5257 List!17530)) )
))
(declare-fun lt!398500 () ListLongMap!10483)

(declare-fun minValue!654 () V!28523)

(declare-fun zeroValue!654 () V!28523)

(declare-fun lt!398504 () array!51340)

(declare-fun getCurrentListMapNoExtraKeys!3220 (array!51342 array!51340 (_ BitVec 32) (_ BitVec 32) V!28523 V!28523 (_ BitVec 32) Int) ListLongMap!10483)

(assert (=> b!881146 (= lt!398500 (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28523)

(assert (=> b!881146 (= lt!398504 (array!51341 (store (arr!24693 _values!688) i!612 (ValueCellFull!8364 v!557)) (size!25133 _values!688)))))

(declare-fun lt!398502 () ListLongMap!10483)

(assert (=> b!881146 (= lt!398502 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!598654 () Bool)

(assert (=> start!74736 (=> (not res!598654) (not e!490358))))

(assert (=> start!74736 (= res!598654 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25134 _keys!868))))))

(assert (=> start!74736 e!490358))

(assert (=> start!74736 tp_is_empty!17607))

(assert (=> start!74736 true))

(assert (=> start!74736 tp!53780))

(declare-fun array_inv!19448 (array!51342) Bool)

(assert (=> start!74736 (array_inv!19448 _keys!868)))

(declare-fun array_inv!19449 (array!51340) Bool)

(assert (=> start!74736 (and (array_inv!19449 _values!688) e!490356)))

(declare-fun b!881147 () Bool)

(declare-fun e!490353 () Bool)

(declare-fun e!490357 () Bool)

(assert (=> b!881147 (= e!490353 e!490357)))

(declare-fun res!598657 () Bool)

(assert (=> b!881147 (=> res!598657 e!490357)))

(assert (=> b!881147 (= res!598657 (not (= (select (arr!24694 _keys!868) from!1053) k0!854)))))

(declare-fun lt!398499 () ListLongMap!10483)

(declare-fun +!2529 (ListLongMap!10483 tuple2!11714) ListLongMap!10483)

(declare-fun get!12990 (ValueCell!8364 V!28523) V!28523)

(declare-fun dynLambda!1245 (Int (_ BitVec 64)) V!28523)

(assert (=> b!881147 (= lt!398500 (+!2529 lt!398499 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881148 () Bool)

(declare-fun e!490352 () Bool)

(assert (=> b!881148 (= e!490357 e!490352)))

(declare-fun res!598658 () Bool)

(assert (=> b!881148 (=> res!598658 e!490352)))

(assert (=> b!881148 (= res!598658 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsge (size!25134 _keys!868) #b01111111111111111111111111111111)))))

(assert (=> b!881148 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17526)))

(declare-datatypes ((Unit!30076 0))(
  ( (Unit!30077) )
))
(declare-fun lt!398498 () Unit!30076)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51342 (_ BitVec 32) (_ BitVec 32)) Unit!30076)

(assert (=> b!881148 (= lt!398498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881149 () Bool)

(assert (=> b!881149 (= e!490351 tp_is_empty!17607)))

(declare-fun b!881150 () Bool)

(declare-fun arrayContainsKey!0 (array!51342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881150 (= e!490352 (arrayContainsKey!0 _keys!868 k0!854 i!612))))

(declare-fun b!881151 () Bool)

(declare-fun res!598656 () Bool)

(assert (=> b!881151 (=> (not res!598656) (not e!490358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51342 (_ BitVec 32)) Bool)

(assert (=> b!881151 (= res!598656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881152 () Bool)

(assert (=> b!881152 (= e!490354 (not e!490353))))

(declare-fun res!598652 () Bool)

(assert (=> b!881152 (=> res!598652 e!490353)))

(assert (=> b!881152 (= res!598652 (not (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053))))))

(declare-fun lt!398505 () ListLongMap!10483)

(assert (=> b!881152 (= lt!398505 lt!398499)))

(declare-fun lt!398501 () ListLongMap!10483)

(assert (=> b!881152 (= lt!398499 (+!2529 lt!398501 (tuple2!11715 k0!854 v!557)))))

(assert (=> b!881152 (= lt!398505 (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881152 (= lt!398501 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398503 () Unit!30076)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 (array!51342 array!51340 (_ BitVec 32) (_ BitVec 32) V!28523 V!28523 (_ BitVec 32) (_ BitVec 64) V!28523 (_ BitVec 32) Int) Unit!30076)

(assert (=> b!881152 (= lt!398503 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74736 res!598654) b!881139))

(assert (= (and b!881139 res!598661) b!881140))

(assert (= (and b!881140 res!598651) b!881151))

(assert (= (and b!881151 res!598656) b!881141))

(assert (= (and b!881141 res!598653) b!881145))

(assert (= (and b!881145 res!598659) b!881138))

(assert (= (and b!881138 res!598650) b!881143))

(assert (= (and b!881143 res!598655) b!881146))

(assert (= (and b!881146 res!598660) b!881152))

(assert (= (and b!881152 (not res!598652)) b!881147))

(assert (= (and b!881147 (not res!598657)) b!881148))

(assert (= (and b!881148 (not res!598658)) b!881150))

(assert (= (and b!881142 condMapEmpty!28035) mapIsEmpty!28035))

(assert (= (and b!881142 (not condMapEmpty!28035)) mapNonEmpty!28035))

(get-info :version)

(assert (= (and mapNonEmpty!28035 ((_ is ValueCellFull!8364) mapValue!28035)) b!881149))

(assert (= (and b!881142 ((_ is ValueCellFull!8364) mapDefault!28035)) b!881144))

(assert (= start!74736 b!881142))

(declare-fun b_lambda!12505 () Bool)

(assert (=> (not b_lambda!12505) (not b!881147)))

(declare-fun t!24693 () Bool)

(declare-fun tb!5021 () Bool)

(assert (=> (and start!74736 (= defaultEntry!696 defaultEntry!696) t!24693) tb!5021))

(declare-fun result!9669 () Bool)

(assert (=> tb!5021 (= result!9669 tp_is_empty!17607)))

(assert (=> b!881147 t!24693))

(declare-fun b_and!25363 () Bool)

(assert (= b_and!25361 (and (=> t!24693 result!9669) b_and!25363)))

(declare-fun m!820955 () Bool)

(assert (=> start!74736 m!820955))

(declare-fun m!820957 () Bool)

(assert (=> start!74736 m!820957))

(declare-fun m!820959 () Bool)

(assert (=> b!881151 m!820959))

(declare-fun m!820961 () Bool)

(assert (=> b!881139 m!820961))

(declare-fun m!820963 () Bool)

(assert (=> b!881152 m!820963))

(declare-fun m!820965 () Bool)

(assert (=> b!881152 m!820965))

(assert (=> b!881152 m!820963))

(declare-fun m!820967 () Bool)

(assert (=> b!881152 m!820967))

(declare-fun m!820969 () Bool)

(assert (=> b!881152 m!820969))

(declare-fun m!820971 () Bool)

(assert (=> b!881152 m!820971))

(declare-fun m!820973 () Bool)

(assert (=> b!881152 m!820973))

(declare-fun m!820975 () Bool)

(assert (=> b!881148 m!820975))

(declare-fun m!820977 () Bool)

(assert (=> b!881148 m!820977))

(declare-fun m!820979 () Bool)

(assert (=> mapNonEmpty!28035 m!820979))

(declare-fun m!820981 () Bool)

(assert (=> b!881143 m!820981))

(declare-fun m!820983 () Bool)

(assert (=> b!881141 m!820983))

(declare-fun m!820985 () Bool)

(assert (=> b!881138 m!820985))

(declare-fun m!820987 () Bool)

(assert (=> b!881147 m!820987))

(declare-fun m!820989 () Bool)

(assert (=> b!881147 m!820989))

(declare-fun m!820991 () Bool)

(assert (=> b!881147 m!820991))

(declare-fun m!820993 () Bool)

(assert (=> b!881147 m!820993))

(assert (=> b!881147 m!820989))

(assert (=> b!881147 m!820963))

(assert (=> b!881147 m!820991))

(declare-fun m!820995 () Bool)

(assert (=> b!881146 m!820995))

(declare-fun m!820997 () Bool)

(assert (=> b!881146 m!820997))

(declare-fun m!820999 () Bool)

(assert (=> b!881146 m!820999))

(declare-fun m!821001 () Bool)

(assert (=> b!881150 m!821001))

(check-sat b_and!25363 (not b!881150) (not b!881139) tp_is_empty!17607 (not start!74736) (not b!881148) (not b_lambda!12505) (not b!881151) (not b!881138) (not b!881152) (not b!881141) (not b_next!15363) (not mapNonEmpty!28035) (not b!881146) (not b!881147))
(check-sat b_and!25363 (not b_next!15363))
(get-model)

(declare-fun b_lambda!12509 () Bool)

(assert (= b_lambda!12505 (or (and start!74736 b_free!15363) b_lambda!12509)))

(check-sat (not b!881151) b_and!25363 (not b!881150) (not b!881139) tp_is_empty!17607 (not start!74736) (not b!881148) (not b!881138) (not b!881152) (not b!881141) (not b_next!15363) (not b_lambda!12509) (not mapNonEmpty!28035) (not b!881146) (not b!881147))
(check-sat b_and!25363 (not b_next!15363))
(get-model)

(declare-fun d!109013 () Bool)

(assert (=> d!109013 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881138 d!109013))

(declare-fun d!109015 () Bool)

(assert (=> d!109015 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!881139 d!109015))

(declare-fun d!109017 () Bool)

(declare-fun res!598702 () Bool)

(declare-fun e!490390 () Bool)

(assert (=> d!109017 (=> res!598702 e!490390)))

(assert (=> d!109017 (= res!598702 (= (select (arr!24694 _keys!868) i!612) k0!854))))

(assert (=> d!109017 (= (arrayContainsKey!0 _keys!868 k0!854 i!612) e!490390)))

(declare-fun b!881206 () Bool)

(declare-fun e!490391 () Bool)

(assert (=> b!881206 (= e!490390 e!490391)))

(declare-fun res!598703 () Bool)

(assert (=> b!881206 (=> (not res!598703) (not e!490391))))

(assert (=> b!881206 (= res!598703 (bvslt (bvadd i!612 #b00000000000000000000000000000001) (size!25134 _keys!868)))))

(declare-fun b!881207 () Bool)

(assert (=> b!881207 (= e!490391 (arrayContainsKey!0 _keys!868 k0!854 (bvadd i!612 #b00000000000000000000000000000001)))))

(assert (= (and d!109017 (not res!598702)) b!881206))

(assert (= (and b!881206 res!598703) b!881207))

(assert (=> d!109017 m!820981))

(declare-fun m!821051 () Bool)

(assert (=> b!881207 m!821051))

(assert (=> b!881150 d!109017))

(declare-fun b!881216 () Bool)

(declare-fun e!490399 () Bool)

(declare-fun call!38912 () Bool)

(assert (=> b!881216 (= e!490399 call!38912)))

(declare-fun b!881217 () Bool)

(declare-fun e!490398 () Bool)

(assert (=> b!881217 (= e!490398 call!38912)))

(declare-fun bm!38909 () Bool)

(assert (=> bm!38909 (= call!38912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!109019 () Bool)

(declare-fun res!598708 () Bool)

(declare-fun e!490400 () Bool)

(assert (=> d!109019 (=> res!598708 e!490400)))

(assert (=> d!109019 (= res!598708 (bvsge #b00000000000000000000000000000000 (size!25134 _keys!868)))))

(assert (=> d!109019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490400)))

(declare-fun b!881218 () Bool)

(assert (=> b!881218 (= e!490398 e!490399)))

(declare-fun lt!398538 () (_ BitVec 64))

(assert (=> b!881218 (= lt!398538 (select (arr!24694 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398536 () Unit!30076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51342 (_ BitVec 64) (_ BitVec 32)) Unit!30076)

(assert (=> b!881218 (= lt!398536 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398538 #b00000000000000000000000000000000))))

(assert (=> b!881218 (arrayContainsKey!0 _keys!868 lt!398538 #b00000000000000000000000000000000)))

(declare-fun lt!398537 () Unit!30076)

(assert (=> b!881218 (= lt!398537 lt!398536)))

(declare-fun res!598709 () Bool)

(declare-datatypes ((SeekEntryResult!8757 0))(
  ( (MissingZero!8757 (index!37399 (_ BitVec 32))) (Found!8757 (index!37400 (_ BitVec 32))) (Intermediate!8757 (undefined!9569 Bool) (index!37401 (_ BitVec 32)) (x!74676 (_ BitVec 32))) (Undefined!8757) (MissingVacant!8757 (index!37402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51342 (_ BitVec 32)) SeekEntryResult!8757)

(assert (=> b!881218 (= res!598709 (= (seekEntryOrOpen!0 (select (arr!24694 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8757 #b00000000000000000000000000000000)))))

(assert (=> b!881218 (=> (not res!598709) (not e!490399))))

(declare-fun b!881219 () Bool)

(assert (=> b!881219 (= e!490400 e!490398)))

(declare-fun c!92898 () Bool)

(assert (=> b!881219 (= c!92898 (validKeyInArray!0 (select (arr!24694 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109019 (not res!598708)) b!881219))

(assert (= (and b!881219 c!92898) b!881218))

(assert (= (and b!881219 (not c!92898)) b!881217))

(assert (= (and b!881218 res!598709) b!881216))

(assert (= (or b!881216 b!881217) bm!38909))

(declare-fun m!821053 () Bool)

(assert (=> bm!38909 m!821053))

(declare-fun m!821055 () Bool)

(assert (=> b!881218 m!821055))

(declare-fun m!821057 () Bool)

(assert (=> b!881218 m!821057))

(declare-fun m!821059 () Bool)

(assert (=> b!881218 m!821059))

(assert (=> b!881218 m!821055))

(declare-fun m!821061 () Bool)

(assert (=> b!881218 m!821061))

(assert (=> b!881219 m!821055))

(assert (=> b!881219 m!821055))

(declare-fun m!821063 () Bool)

(assert (=> b!881219 m!821063))

(assert (=> b!881151 d!109019))

(declare-fun b!881244 () Bool)

(declare-fun e!490420 () ListLongMap!10483)

(declare-fun call!38915 () ListLongMap!10483)

(assert (=> b!881244 (= e!490420 call!38915)))

(declare-fun b!881245 () Bool)

(declare-fun e!490418 () ListLongMap!10483)

(assert (=> b!881245 (= e!490418 (ListLongMap!10484 Nil!17527))))

(declare-fun b!881246 () Bool)

(declare-fun e!490415 () Bool)

(declare-fun e!490421 () Bool)

(assert (=> b!881246 (= e!490415 e!490421)))

(declare-fun c!92908 () Bool)

(assert (=> b!881246 (= c!92908 (bvslt from!1053 (size!25134 _keys!868)))))

(declare-fun b!881247 () Bool)

(declare-fun e!490417 () Bool)

(assert (=> b!881247 (= e!490417 (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)))))

(assert (=> b!881247 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881248 () Bool)

(declare-fun e!490419 () Bool)

(assert (=> b!881248 (= e!490419 e!490415)))

(declare-fun c!92910 () Bool)

(assert (=> b!881248 (= c!92910 e!490417)))

(declare-fun res!598721 () Bool)

(assert (=> b!881248 (=> (not res!598721) (not e!490417))))

(assert (=> b!881248 (= res!598721 (bvslt from!1053 (size!25134 _keys!868)))))

(declare-fun b!881249 () Bool)

(declare-fun lt!398553 () Unit!30076)

(declare-fun lt!398559 () Unit!30076)

(assert (=> b!881249 (= lt!398553 lt!398559)))

(declare-fun lt!398558 () ListLongMap!10483)

(declare-fun lt!398555 () (_ BitVec 64))

(declare-fun lt!398554 () V!28523)

(declare-fun lt!398556 () (_ BitVec 64))

(declare-fun contains!4260 (ListLongMap!10483 (_ BitVec 64)) Bool)

(assert (=> b!881249 (not (contains!4260 (+!2529 lt!398558 (tuple2!11715 lt!398556 lt!398554)) lt!398555))))

(declare-fun addStillNotContains!206 (ListLongMap!10483 (_ BitVec 64) V!28523 (_ BitVec 64)) Unit!30076)

(assert (=> b!881249 (= lt!398559 (addStillNotContains!206 lt!398558 lt!398556 lt!398554 lt!398555))))

(assert (=> b!881249 (= lt!398555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881249 (= lt!398554 (get!12990 (select (arr!24693 lt!398504) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881249 (= lt!398556 (select (arr!24694 _keys!868) from!1053))))

(assert (=> b!881249 (= lt!398558 call!38915)))

(assert (=> b!881249 (= e!490420 (+!2529 call!38915 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 lt!398504) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38912 () Bool)

(assert (=> bm!38912 (= call!38915 (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109021 () Bool)

(assert (=> d!109021 e!490419))

(declare-fun res!598719 () Bool)

(assert (=> d!109021 (=> (not res!598719) (not e!490419))))

(declare-fun lt!398557 () ListLongMap!10483)

(assert (=> d!109021 (= res!598719 (not (contains!4260 lt!398557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109021 (= lt!398557 e!490418)))

(declare-fun c!92907 () Bool)

(assert (=> d!109021 (= c!92907 (bvsge from!1053 (size!25134 _keys!868)))))

(assert (=> d!109021 (validMask!0 mask!1196)))

(assert (=> d!109021 (= (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398557)))

(declare-fun b!881250 () Bool)

(declare-fun res!598720 () Bool)

(assert (=> b!881250 (=> (not res!598720) (not e!490419))))

(assert (=> b!881250 (= res!598720 (not (contains!4260 lt!398557 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881251 () Bool)

(assert (=> b!881251 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25134 _keys!868)))))

(assert (=> b!881251 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25133 lt!398504)))))

(declare-fun e!490416 () Bool)

(declare-fun apply!381 (ListLongMap!10483 (_ BitVec 64)) V!28523)

(assert (=> b!881251 (= e!490416 (= (apply!381 lt!398557 (select (arr!24694 _keys!868) from!1053)) (get!12990 (select (arr!24693 lt!398504) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881252 () Bool)

(assert (=> b!881252 (= e!490421 (= lt!398557 (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881253 () Bool)

(assert (=> b!881253 (= e!490415 e!490416)))

(assert (=> b!881253 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25134 _keys!868)))))

(declare-fun res!598718 () Bool)

(assert (=> b!881253 (= res!598718 (contains!4260 lt!398557 (select (arr!24694 _keys!868) from!1053)))))

(assert (=> b!881253 (=> (not res!598718) (not e!490416))))

(declare-fun b!881254 () Bool)

(declare-fun isEmpty!668 (ListLongMap!10483) Bool)

(assert (=> b!881254 (= e!490421 (isEmpty!668 lt!398557))))

(declare-fun b!881255 () Bool)

(assert (=> b!881255 (= e!490418 e!490420)))

(declare-fun c!92909 () Bool)

(assert (=> b!881255 (= c!92909 (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)))))

(assert (= (and d!109021 c!92907) b!881245))

(assert (= (and d!109021 (not c!92907)) b!881255))

(assert (= (and b!881255 c!92909) b!881249))

(assert (= (and b!881255 (not c!92909)) b!881244))

(assert (= (or b!881249 b!881244) bm!38912))

(assert (= (and d!109021 res!598719) b!881250))

(assert (= (and b!881250 res!598720) b!881248))

(assert (= (and b!881248 res!598721) b!881247))

(assert (= (and b!881248 c!92910) b!881253))

(assert (= (and b!881248 (not c!92910)) b!881246))

(assert (= (and b!881253 res!598718) b!881251))

(assert (= (and b!881246 c!92908) b!881252))

(assert (= (and b!881246 (not c!92908)) b!881254))

(declare-fun b_lambda!12511 () Bool)

(assert (=> (not b_lambda!12511) (not b!881249)))

(assert (=> b!881249 t!24693))

(declare-fun b_and!25369 () Bool)

(assert (= b_and!25363 (and (=> t!24693 result!9669) b_and!25369)))

(declare-fun b_lambda!12513 () Bool)

(assert (=> (not b_lambda!12513) (not b!881251)))

(assert (=> b!881251 t!24693))

(declare-fun b_and!25371 () Bool)

(assert (= b_and!25369 (and (=> t!24693 result!9669) b_and!25371)))

(declare-fun m!821065 () Bool)

(assert (=> d!109021 m!821065))

(assert (=> d!109021 m!820961))

(declare-fun m!821067 () Bool)

(assert (=> b!881250 m!821067))

(declare-fun m!821069 () Bool)

(assert (=> b!881249 m!821069))

(assert (=> b!881249 m!821069))

(declare-fun m!821071 () Bool)

(assert (=> b!881249 m!821071))

(declare-fun m!821073 () Bool)

(assert (=> b!881249 m!821073))

(declare-fun m!821075 () Bool)

(assert (=> b!881249 m!821075))

(declare-fun m!821077 () Bool)

(assert (=> b!881249 m!821077))

(assert (=> b!881249 m!820991))

(declare-fun m!821079 () Bool)

(assert (=> b!881249 m!821079))

(assert (=> b!881249 m!820963))

(assert (=> b!881249 m!820991))

(assert (=> b!881249 m!821077))

(assert (=> b!881255 m!820963))

(assert (=> b!881255 m!820963))

(assert (=> b!881255 m!820965))

(declare-fun m!821081 () Bool)

(assert (=> b!881254 m!821081))

(assert (=> b!881253 m!820963))

(assert (=> b!881253 m!820963))

(declare-fun m!821083 () Bool)

(assert (=> b!881253 m!821083))

(declare-fun m!821085 () Bool)

(assert (=> b!881252 m!821085))

(assert (=> b!881247 m!820963))

(assert (=> b!881247 m!820963))

(assert (=> b!881247 m!820965))

(assert (=> b!881251 m!820963))

(declare-fun m!821087 () Bool)

(assert (=> b!881251 m!821087))

(assert (=> b!881251 m!821077))

(assert (=> b!881251 m!820991))

(assert (=> b!881251 m!821079))

(assert (=> b!881251 m!820963))

(assert (=> b!881251 m!820991))

(assert (=> b!881251 m!821077))

(assert (=> bm!38912 m!821085))

(assert (=> b!881146 d!109021))

(declare-fun b!881256 () Bool)

(declare-fun e!490427 () ListLongMap!10483)

(declare-fun call!38916 () ListLongMap!10483)

(assert (=> b!881256 (= e!490427 call!38916)))

(declare-fun b!881257 () Bool)

(declare-fun e!490425 () ListLongMap!10483)

(assert (=> b!881257 (= e!490425 (ListLongMap!10484 Nil!17527))))

(declare-fun b!881258 () Bool)

(declare-fun e!490422 () Bool)

(declare-fun e!490428 () Bool)

(assert (=> b!881258 (= e!490422 e!490428)))

(declare-fun c!92912 () Bool)

(assert (=> b!881258 (= c!92912 (bvslt from!1053 (size!25134 _keys!868)))))

(declare-fun b!881259 () Bool)

(declare-fun e!490424 () Bool)

(assert (=> b!881259 (= e!490424 (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)))))

(assert (=> b!881259 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881260 () Bool)

(declare-fun e!490426 () Bool)

(assert (=> b!881260 (= e!490426 e!490422)))

(declare-fun c!92914 () Bool)

(assert (=> b!881260 (= c!92914 e!490424)))

(declare-fun res!598725 () Bool)

(assert (=> b!881260 (=> (not res!598725) (not e!490424))))

(assert (=> b!881260 (= res!598725 (bvslt from!1053 (size!25134 _keys!868)))))

(declare-fun b!881261 () Bool)

(declare-fun lt!398560 () Unit!30076)

(declare-fun lt!398566 () Unit!30076)

(assert (=> b!881261 (= lt!398560 lt!398566)))

(declare-fun lt!398563 () (_ BitVec 64))

(declare-fun lt!398565 () ListLongMap!10483)

(declare-fun lt!398562 () (_ BitVec 64))

(declare-fun lt!398561 () V!28523)

(assert (=> b!881261 (not (contains!4260 (+!2529 lt!398565 (tuple2!11715 lt!398563 lt!398561)) lt!398562))))

(assert (=> b!881261 (= lt!398566 (addStillNotContains!206 lt!398565 lt!398563 lt!398561 lt!398562))))

(assert (=> b!881261 (= lt!398562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881261 (= lt!398561 (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881261 (= lt!398563 (select (arr!24694 _keys!868) from!1053))))

(assert (=> b!881261 (= lt!398565 call!38916)))

(assert (=> b!881261 (= e!490427 (+!2529 call!38916 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38913 () Bool)

(assert (=> bm!38913 (= call!38916 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109023 () Bool)

(assert (=> d!109023 e!490426))

(declare-fun res!598723 () Bool)

(assert (=> d!109023 (=> (not res!598723) (not e!490426))))

(declare-fun lt!398564 () ListLongMap!10483)

(assert (=> d!109023 (= res!598723 (not (contains!4260 lt!398564 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109023 (= lt!398564 e!490425)))

(declare-fun c!92911 () Bool)

(assert (=> d!109023 (= c!92911 (bvsge from!1053 (size!25134 _keys!868)))))

(assert (=> d!109023 (validMask!0 mask!1196)))

(assert (=> d!109023 (= (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398564)))

(declare-fun b!881262 () Bool)

(declare-fun res!598724 () Bool)

(assert (=> b!881262 (=> (not res!598724) (not e!490426))))

(assert (=> b!881262 (= res!598724 (not (contains!4260 lt!398564 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881263 () Bool)

(assert (=> b!881263 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25134 _keys!868)))))

(assert (=> b!881263 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25133 _values!688)))))

(declare-fun e!490423 () Bool)

(assert (=> b!881263 (= e!490423 (= (apply!381 lt!398564 (select (arr!24694 _keys!868) from!1053)) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881264 () Bool)

(assert (=> b!881264 (= e!490428 (= lt!398564 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881265 () Bool)

(assert (=> b!881265 (= e!490422 e!490423)))

(assert (=> b!881265 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25134 _keys!868)))))

(declare-fun res!598722 () Bool)

(assert (=> b!881265 (= res!598722 (contains!4260 lt!398564 (select (arr!24694 _keys!868) from!1053)))))

(assert (=> b!881265 (=> (not res!598722) (not e!490423))))

(declare-fun b!881266 () Bool)

(assert (=> b!881266 (= e!490428 (isEmpty!668 lt!398564))))

(declare-fun b!881267 () Bool)

(assert (=> b!881267 (= e!490425 e!490427)))

(declare-fun c!92913 () Bool)

(assert (=> b!881267 (= c!92913 (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)))))

(assert (= (and d!109023 c!92911) b!881257))

(assert (= (and d!109023 (not c!92911)) b!881267))

(assert (= (and b!881267 c!92913) b!881261))

(assert (= (and b!881267 (not c!92913)) b!881256))

(assert (= (or b!881261 b!881256) bm!38913))

(assert (= (and d!109023 res!598723) b!881262))

(assert (= (and b!881262 res!598724) b!881260))

(assert (= (and b!881260 res!598725) b!881259))

(assert (= (and b!881260 c!92914) b!881265))

(assert (= (and b!881260 (not c!92914)) b!881258))

(assert (= (and b!881265 res!598722) b!881263))

(assert (= (and b!881258 c!92912) b!881264))

(assert (= (and b!881258 (not c!92912)) b!881266))

(declare-fun b_lambda!12515 () Bool)

(assert (=> (not b_lambda!12515) (not b!881261)))

(assert (=> b!881261 t!24693))

(declare-fun b_and!25373 () Bool)

(assert (= b_and!25371 (and (=> t!24693 result!9669) b_and!25373)))

(declare-fun b_lambda!12517 () Bool)

(assert (=> (not b_lambda!12517) (not b!881263)))

(assert (=> b!881263 t!24693))

(declare-fun b_and!25375 () Bool)

(assert (= b_and!25373 (and (=> t!24693 result!9669) b_and!25375)))

(declare-fun m!821089 () Bool)

(assert (=> d!109023 m!821089))

(assert (=> d!109023 m!820961))

(declare-fun m!821091 () Bool)

(assert (=> b!881262 m!821091))

(declare-fun m!821093 () Bool)

(assert (=> b!881261 m!821093))

(assert (=> b!881261 m!821093))

(declare-fun m!821095 () Bool)

(assert (=> b!881261 m!821095))

(declare-fun m!821097 () Bool)

(assert (=> b!881261 m!821097))

(declare-fun m!821099 () Bool)

(assert (=> b!881261 m!821099))

(assert (=> b!881261 m!820989))

(assert (=> b!881261 m!820991))

(assert (=> b!881261 m!820993))

(assert (=> b!881261 m!820963))

(assert (=> b!881261 m!820991))

(assert (=> b!881261 m!820989))

(assert (=> b!881267 m!820963))

(assert (=> b!881267 m!820963))

(assert (=> b!881267 m!820965))

(declare-fun m!821101 () Bool)

(assert (=> b!881266 m!821101))

(assert (=> b!881265 m!820963))

(assert (=> b!881265 m!820963))

(declare-fun m!821103 () Bool)

(assert (=> b!881265 m!821103))

(declare-fun m!821105 () Bool)

(assert (=> b!881264 m!821105))

(assert (=> b!881259 m!820963))

(assert (=> b!881259 m!820963))

(assert (=> b!881259 m!820965))

(assert (=> b!881263 m!820963))

(declare-fun m!821107 () Bool)

(assert (=> b!881263 m!821107))

(assert (=> b!881263 m!820989))

(assert (=> b!881263 m!820991))

(assert (=> b!881263 m!820993))

(assert (=> b!881263 m!820963))

(assert (=> b!881263 m!820991))

(assert (=> b!881263 m!820989))

(assert (=> bm!38913 m!821105))

(assert (=> b!881146 d!109023))

(declare-fun bm!38916 () Bool)

(declare-fun call!38919 () Bool)

(declare-fun c!92917 () Bool)

(assert (=> bm!38916 (= call!38919 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92917 (Cons!17525 (select (arr!24694 _keys!868) #b00000000000000000000000000000000) Nil!17526) Nil!17526)))))

(declare-fun b!881279 () Bool)

(declare-fun e!490438 () Bool)

(assert (=> b!881279 (= e!490438 call!38919)))

(declare-fun b!881280 () Bool)

(declare-fun e!490437 () Bool)

(declare-fun contains!4261 (List!17529 (_ BitVec 64)) Bool)

(assert (=> b!881280 (= e!490437 (contains!4261 Nil!17526 (select (arr!24694 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881281 () Bool)

(declare-fun e!490439 () Bool)

(declare-fun e!490440 () Bool)

(assert (=> b!881281 (= e!490439 e!490440)))

(declare-fun res!598733 () Bool)

(assert (=> b!881281 (=> (not res!598733) (not e!490440))))

(assert (=> b!881281 (= res!598733 (not e!490437))))

(declare-fun res!598732 () Bool)

(assert (=> b!881281 (=> (not res!598732) (not e!490437))))

(assert (=> b!881281 (= res!598732 (validKeyInArray!0 (select (arr!24694 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881282 () Bool)

(assert (=> b!881282 (= e!490440 e!490438)))

(assert (=> b!881282 (= c!92917 (validKeyInArray!0 (select (arr!24694 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881278 () Bool)

(assert (=> b!881278 (= e!490438 call!38919)))

(declare-fun d!109025 () Bool)

(declare-fun res!598734 () Bool)

(assert (=> d!109025 (=> res!598734 e!490439)))

(assert (=> d!109025 (= res!598734 (bvsge #b00000000000000000000000000000000 (size!25134 _keys!868)))))

(assert (=> d!109025 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17526) e!490439)))

(assert (= (and d!109025 (not res!598734)) b!881281))

(assert (= (and b!881281 res!598732) b!881280))

(assert (= (and b!881281 res!598733) b!881282))

(assert (= (and b!881282 c!92917) b!881279))

(assert (= (and b!881282 (not c!92917)) b!881278))

(assert (= (or b!881279 b!881278) bm!38916))

(assert (=> bm!38916 m!821055))

(declare-fun m!821109 () Bool)

(assert (=> bm!38916 m!821109))

(assert (=> b!881280 m!821055))

(assert (=> b!881280 m!821055))

(declare-fun m!821111 () Bool)

(assert (=> b!881280 m!821111))

(assert (=> b!881281 m!821055))

(assert (=> b!881281 m!821055))

(assert (=> b!881281 m!821063))

(assert (=> b!881282 m!821055))

(assert (=> b!881282 m!821055))

(assert (=> b!881282 m!821063))

(assert (=> b!881141 d!109025))

(declare-fun b!881283 () Bool)

(declare-fun e!490446 () ListLongMap!10483)

(declare-fun call!38920 () ListLongMap!10483)

(assert (=> b!881283 (= e!490446 call!38920)))

(declare-fun b!881284 () Bool)

(declare-fun e!490444 () ListLongMap!10483)

(assert (=> b!881284 (= e!490444 (ListLongMap!10484 Nil!17527))))

(declare-fun b!881285 () Bool)

(declare-fun e!490441 () Bool)

(declare-fun e!490447 () Bool)

(assert (=> b!881285 (= e!490441 e!490447)))

(declare-fun c!92919 () Bool)

(assert (=> b!881285 (= c!92919 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(declare-fun b!881286 () Bool)

(declare-fun e!490443 () Bool)

(assert (=> b!881286 (= e!490443 (validKeyInArray!0 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881286 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881287 () Bool)

(declare-fun e!490445 () Bool)

(assert (=> b!881287 (= e!490445 e!490441)))

(declare-fun c!92921 () Bool)

(assert (=> b!881287 (= c!92921 e!490443)))

(declare-fun res!598738 () Bool)

(assert (=> b!881287 (=> (not res!598738) (not e!490443))))

(assert (=> b!881287 (= res!598738 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(declare-fun b!881288 () Bool)

(declare-fun lt!398567 () Unit!30076)

(declare-fun lt!398573 () Unit!30076)

(assert (=> b!881288 (= lt!398567 lt!398573)))

(declare-fun lt!398568 () V!28523)

(declare-fun lt!398572 () ListLongMap!10483)

(declare-fun lt!398570 () (_ BitVec 64))

(declare-fun lt!398569 () (_ BitVec 64))

(assert (=> b!881288 (not (contains!4260 (+!2529 lt!398572 (tuple2!11715 lt!398570 lt!398568)) lt!398569))))

(assert (=> b!881288 (= lt!398573 (addStillNotContains!206 lt!398572 lt!398570 lt!398568 lt!398569))))

(assert (=> b!881288 (= lt!398569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881288 (= lt!398568 (get!12990 (select (arr!24693 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881288 (= lt!398570 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881288 (= lt!398572 call!38920)))

(assert (=> b!881288 (= e!490446 (+!2529 call!38920 (tuple2!11715 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12990 (select (arr!24693 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38917 () Bool)

(assert (=> bm!38917 (= call!38920 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109027 () Bool)

(assert (=> d!109027 e!490445))

(declare-fun res!598736 () Bool)

(assert (=> d!109027 (=> (not res!598736) (not e!490445))))

(declare-fun lt!398571 () ListLongMap!10483)

(assert (=> d!109027 (= res!598736 (not (contains!4260 lt!398571 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109027 (= lt!398571 e!490444)))

(declare-fun c!92918 () Bool)

(assert (=> d!109027 (= c!92918 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(assert (=> d!109027 (validMask!0 mask!1196)))

(assert (=> d!109027 (= (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398571)))

(declare-fun b!881289 () Bool)

(declare-fun res!598737 () Bool)

(assert (=> b!881289 (=> (not res!598737) (not e!490445))))

(assert (=> b!881289 (= res!598737 (not (contains!4260 lt!398571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881290 () Bool)

(assert (=> b!881290 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(assert (=> b!881290 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25133 _values!688)))))

(declare-fun e!490442 () Bool)

(assert (=> b!881290 (= e!490442 (= (apply!381 lt!398571 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12990 (select (arr!24693 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881291 () Bool)

(assert (=> b!881291 (= e!490447 (= lt!398571 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881292 () Bool)

(assert (=> b!881292 (= e!490441 e!490442)))

(assert (=> b!881292 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(declare-fun res!598735 () Bool)

(assert (=> b!881292 (= res!598735 (contains!4260 lt!398571 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881292 (=> (not res!598735) (not e!490442))))

(declare-fun b!881293 () Bool)

(assert (=> b!881293 (= e!490447 (isEmpty!668 lt!398571))))

(declare-fun b!881294 () Bool)

(assert (=> b!881294 (= e!490444 e!490446)))

(declare-fun c!92920 () Bool)

(assert (=> b!881294 (= c!92920 (validKeyInArray!0 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (= (and d!109027 c!92918) b!881284))

(assert (= (and d!109027 (not c!92918)) b!881294))

(assert (= (and b!881294 c!92920) b!881288))

(assert (= (and b!881294 (not c!92920)) b!881283))

(assert (= (or b!881288 b!881283) bm!38917))

(assert (= (and d!109027 res!598736) b!881289))

(assert (= (and b!881289 res!598737) b!881287))

(assert (= (and b!881287 res!598738) b!881286))

(assert (= (and b!881287 c!92921) b!881292))

(assert (= (and b!881287 (not c!92921)) b!881285))

(assert (= (and b!881292 res!598735) b!881290))

(assert (= (and b!881285 c!92919) b!881291))

(assert (= (and b!881285 (not c!92919)) b!881293))

(declare-fun b_lambda!12519 () Bool)

(assert (=> (not b_lambda!12519) (not b!881288)))

(assert (=> b!881288 t!24693))

(declare-fun b_and!25377 () Bool)

(assert (= b_and!25375 (and (=> t!24693 result!9669) b_and!25377)))

(declare-fun b_lambda!12521 () Bool)

(assert (=> (not b_lambda!12521) (not b!881290)))

(assert (=> b!881290 t!24693))

(declare-fun b_and!25379 () Bool)

(assert (= b_and!25377 (and (=> t!24693 result!9669) b_and!25379)))

(declare-fun m!821113 () Bool)

(assert (=> d!109027 m!821113))

(assert (=> d!109027 m!820961))

(declare-fun m!821115 () Bool)

(assert (=> b!881289 m!821115))

(declare-fun m!821117 () Bool)

(assert (=> b!881288 m!821117))

(assert (=> b!881288 m!821117))

(declare-fun m!821119 () Bool)

(assert (=> b!881288 m!821119))

(declare-fun m!821121 () Bool)

(assert (=> b!881288 m!821121))

(declare-fun m!821123 () Bool)

(assert (=> b!881288 m!821123))

(declare-fun m!821125 () Bool)

(assert (=> b!881288 m!821125))

(assert (=> b!881288 m!820991))

(declare-fun m!821127 () Bool)

(assert (=> b!881288 m!821127))

(declare-fun m!821129 () Bool)

(assert (=> b!881288 m!821129))

(assert (=> b!881288 m!820991))

(assert (=> b!881288 m!821125))

(assert (=> b!881294 m!821129))

(assert (=> b!881294 m!821129))

(declare-fun m!821131 () Bool)

(assert (=> b!881294 m!821131))

(declare-fun m!821133 () Bool)

(assert (=> b!881293 m!821133))

(assert (=> b!881292 m!821129))

(assert (=> b!881292 m!821129))

(declare-fun m!821135 () Bool)

(assert (=> b!881292 m!821135))

(declare-fun m!821137 () Bool)

(assert (=> b!881291 m!821137))

(assert (=> b!881286 m!821129))

(assert (=> b!881286 m!821129))

(assert (=> b!881286 m!821131))

(assert (=> b!881290 m!821129))

(declare-fun m!821139 () Bool)

(assert (=> b!881290 m!821139))

(assert (=> b!881290 m!821125))

(assert (=> b!881290 m!820991))

(assert (=> b!881290 m!821127))

(assert (=> b!881290 m!821129))

(assert (=> b!881290 m!820991))

(assert (=> b!881290 m!821125))

(assert (=> bm!38917 m!821137))

(assert (=> b!881152 d!109027))

(declare-fun d!109029 () Bool)

(declare-fun e!490450 () Bool)

(assert (=> d!109029 e!490450))

(declare-fun res!598743 () Bool)

(assert (=> d!109029 (=> (not res!598743) (not e!490450))))

(declare-fun lt!398582 () ListLongMap!10483)

(assert (=> d!109029 (= res!598743 (contains!4260 lt!398582 (_1!5868 (tuple2!11715 k0!854 v!557))))))

(declare-fun lt!398584 () List!17530)

(assert (=> d!109029 (= lt!398582 (ListLongMap!10484 lt!398584))))

(declare-fun lt!398583 () Unit!30076)

(declare-fun lt!398585 () Unit!30076)

(assert (=> d!109029 (= lt!398583 lt!398585)))

(declare-datatypes ((Option!429 0))(
  ( (Some!428 (v!11308 V!28523)) (None!427) )
))
(declare-fun getValueByKey!423 (List!17530 (_ BitVec 64)) Option!429)

(assert (=> d!109029 (= (getValueByKey!423 lt!398584 (_1!5868 (tuple2!11715 k0!854 v!557))) (Some!428 (_2!5868 (tuple2!11715 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!237 (List!17530 (_ BitVec 64) V!28523) Unit!30076)

(assert (=> d!109029 (= lt!398585 (lemmaContainsTupThenGetReturnValue!237 lt!398584 (_1!5868 (tuple2!11715 k0!854 v!557)) (_2!5868 (tuple2!11715 k0!854 v!557))))))

(declare-fun insertStrictlySorted!276 (List!17530 (_ BitVec 64) V!28523) List!17530)

(assert (=> d!109029 (= lt!398584 (insertStrictlySorted!276 (toList!5257 lt!398501) (_1!5868 (tuple2!11715 k0!854 v!557)) (_2!5868 (tuple2!11715 k0!854 v!557))))))

(assert (=> d!109029 (= (+!2529 lt!398501 (tuple2!11715 k0!854 v!557)) lt!398582)))

(declare-fun b!881299 () Bool)

(declare-fun res!598744 () Bool)

(assert (=> b!881299 (=> (not res!598744) (not e!490450))))

(assert (=> b!881299 (= res!598744 (= (getValueByKey!423 (toList!5257 lt!398582) (_1!5868 (tuple2!11715 k0!854 v!557))) (Some!428 (_2!5868 (tuple2!11715 k0!854 v!557)))))))

(declare-fun b!881300 () Bool)

(declare-fun contains!4262 (List!17530 tuple2!11714) Bool)

(assert (=> b!881300 (= e!490450 (contains!4262 (toList!5257 lt!398582) (tuple2!11715 k0!854 v!557)))))

(assert (= (and d!109029 res!598743) b!881299))

(assert (= (and b!881299 res!598744) b!881300))

(declare-fun m!821141 () Bool)

(assert (=> d!109029 m!821141))

(declare-fun m!821143 () Bool)

(assert (=> d!109029 m!821143))

(declare-fun m!821145 () Bool)

(assert (=> d!109029 m!821145))

(declare-fun m!821147 () Bool)

(assert (=> d!109029 m!821147))

(declare-fun m!821149 () Bool)

(assert (=> b!881299 m!821149))

(declare-fun m!821151 () Bool)

(assert (=> b!881300 m!821151))

(assert (=> b!881152 d!109029))

(declare-fun d!109031 () Bool)

(assert (=> d!109031 (= (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)) (and (not (= (select (arr!24694 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24694 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881152 d!109031))

(declare-fun b!881307 () Bool)

(declare-fun call!38925 () ListLongMap!10483)

(declare-fun e!490455 () Bool)

(declare-fun call!38926 () ListLongMap!10483)

(assert (=> b!881307 (= e!490455 (= call!38926 (+!2529 call!38925 (tuple2!11715 k0!854 v!557))))))

(declare-fun b!881308 () Bool)

(declare-fun e!490456 () Bool)

(assert (=> b!881308 (= e!490456 e!490455)))

(declare-fun c!92924 () Bool)

(assert (=> b!881308 (= c!92924 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38922 () Bool)

(assert (=> bm!38922 (= call!38926 (getCurrentListMapNoExtraKeys!3220 _keys!868 (array!51341 (store (arr!24693 _values!688) i!612 (ValueCellFull!8364 v!557)) (size!25133 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881309 () Bool)

(assert (=> b!881309 (= e!490455 (= call!38926 call!38925))))

(declare-fun bm!38923 () Bool)

(assert (=> bm!38923 (= call!38925 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!109033 () Bool)

(assert (=> d!109033 e!490456))

(declare-fun res!598747 () Bool)

(assert (=> d!109033 (=> (not res!598747) (not e!490456))))

(assert (=> d!109033 (= res!598747 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25133 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25133 _values!688))))))))

(declare-fun lt!398588 () Unit!30076)

(declare-fun choose!1437 (array!51342 array!51340 (_ BitVec 32) (_ BitVec 32) V!28523 V!28523 (_ BitVec 32) (_ BitVec 64) V!28523 (_ BitVec 32) Int) Unit!30076)

(assert (=> d!109033 (= lt!398588 (choose!1437 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109033 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(assert (=> d!109033 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!718 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398588)))

(assert (= (and d!109033 res!598747) b!881308))

(assert (= (and b!881308 c!92924) b!881307))

(assert (= (and b!881308 (not c!92924)) b!881309))

(assert (= (or b!881307 b!881309) bm!38923))

(assert (= (or b!881307 b!881309) bm!38922))

(declare-fun m!821153 () Bool)

(assert (=> b!881307 m!821153))

(assert (=> bm!38922 m!820997))

(declare-fun m!821155 () Bool)

(assert (=> bm!38922 m!821155))

(assert (=> bm!38923 m!820973))

(declare-fun m!821157 () Bool)

(assert (=> d!109033 m!821157))

(assert (=> b!881152 d!109033))

(declare-fun b!881310 () Bool)

(declare-fun e!490462 () ListLongMap!10483)

(declare-fun call!38927 () ListLongMap!10483)

(assert (=> b!881310 (= e!490462 call!38927)))

(declare-fun b!881311 () Bool)

(declare-fun e!490460 () ListLongMap!10483)

(assert (=> b!881311 (= e!490460 (ListLongMap!10484 Nil!17527))))

(declare-fun b!881312 () Bool)

(declare-fun e!490457 () Bool)

(declare-fun e!490463 () Bool)

(assert (=> b!881312 (= e!490457 e!490463)))

(declare-fun c!92926 () Bool)

(assert (=> b!881312 (= c!92926 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(declare-fun b!881313 () Bool)

(declare-fun e!490459 () Bool)

(assert (=> b!881313 (= e!490459 (validKeyInArray!0 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881313 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881314 () Bool)

(declare-fun e!490461 () Bool)

(assert (=> b!881314 (= e!490461 e!490457)))

(declare-fun c!92928 () Bool)

(assert (=> b!881314 (= c!92928 e!490459)))

(declare-fun res!598751 () Bool)

(assert (=> b!881314 (=> (not res!598751) (not e!490459))))

(assert (=> b!881314 (= res!598751 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(declare-fun b!881315 () Bool)

(declare-fun lt!398589 () Unit!30076)

(declare-fun lt!398595 () Unit!30076)

(assert (=> b!881315 (= lt!398589 lt!398595)))

(declare-fun lt!398594 () ListLongMap!10483)

(declare-fun lt!398591 () (_ BitVec 64))

(declare-fun lt!398590 () V!28523)

(declare-fun lt!398592 () (_ BitVec 64))

(assert (=> b!881315 (not (contains!4260 (+!2529 lt!398594 (tuple2!11715 lt!398592 lt!398590)) lt!398591))))

(assert (=> b!881315 (= lt!398595 (addStillNotContains!206 lt!398594 lt!398592 lt!398590 lt!398591))))

(assert (=> b!881315 (= lt!398591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881315 (= lt!398590 (get!12990 (select (arr!24693 lt!398504) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881315 (= lt!398592 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881315 (= lt!398594 call!38927)))

(assert (=> b!881315 (= e!490462 (+!2529 call!38927 (tuple2!11715 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12990 (select (arr!24693 lt!398504) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38924 () Bool)

(assert (=> bm!38924 (= call!38927 (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109035 () Bool)

(assert (=> d!109035 e!490461))

(declare-fun res!598749 () Bool)

(assert (=> d!109035 (=> (not res!598749) (not e!490461))))

(declare-fun lt!398593 () ListLongMap!10483)

(assert (=> d!109035 (= res!598749 (not (contains!4260 lt!398593 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109035 (= lt!398593 e!490460)))

(declare-fun c!92925 () Bool)

(assert (=> d!109035 (= c!92925 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(assert (=> d!109035 (validMask!0 mask!1196)))

(assert (=> d!109035 (= (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398593)))

(declare-fun b!881316 () Bool)

(declare-fun res!598750 () Bool)

(assert (=> b!881316 (=> (not res!598750) (not e!490461))))

(assert (=> b!881316 (= res!598750 (not (contains!4260 lt!398593 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881317 () Bool)

(assert (=> b!881317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(assert (=> b!881317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25133 lt!398504)))))

(declare-fun e!490458 () Bool)

(assert (=> b!881317 (= e!490458 (= (apply!381 lt!398593 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12990 (select (arr!24693 lt!398504) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881318 () Bool)

(assert (=> b!881318 (= e!490463 (= lt!398593 (getCurrentListMapNoExtraKeys!3220 _keys!868 lt!398504 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881319 () Bool)

(assert (=> b!881319 (= e!490457 e!490458)))

(assert (=> b!881319 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25134 _keys!868)))))

(declare-fun res!598748 () Bool)

(assert (=> b!881319 (= res!598748 (contains!4260 lt!398593 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881319 (=> (not res!598748) (not e!490458))))

(declare-fun b!881320 () Bool)

(assert (=> b!881320 (= e!490463 (isEmpty!668 lt!398593))))

(declare-fun b!881321 () Bool)

(assert (=> b!881321 (= e!490460 e!490462)))

(declare-fun c!92927 () Bool)

(assert (=> b!881321 (= c!92927 (validKeyInArray!0 (select (arr!24694 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (= (and d!109035 c!92925) b!881311))

(assert (= (and d!109035 (not c!92925)) b!881321))

(assert (= (and b!881321 c!92927) b!881315))

(assert (= (and b!881321 (not c!92927)) b!881310))

(assert (= (or b!881315 b!881310) bm!38924))

(assert (= (and d!109035 res!598749) b!881316))

(assert (= (and b!881316 res!598750) b!881314))

(assert (= (and b!881314 res!598751) b!881313))

(assert (= (and b!881314 c!92928) b!881319))

(assert (= (and b!881314 (not c!92928)) b!881312))

(assert (= (and b!881319 res!598748) b!881317))

(assert (= (and b!881312 c!92926) b!881318))

(assert (= (and b!881312 (not c!92926)) b!881320))

(declare-fun b_lambda!12523 () Bool)

(assert (=> (not b_lambda!12523) (not b!881315)))

(assert (=> b!881315 t!24693))

(declare-fun b_and!25381 () Bool)

(assert (= b_and!25379 (and (=> t!24693 result!9669) b_and!25381)))

(declare-fun b_lambda!12525 () Bool)

(assert (=> (not b_lambda!12525) (not b!881317)))

(assert (=> b!881317 t!24693))

(declare-fun b_and!25383 () Bool)

(assert (= b_and!25381 (and (=> t!24693 result!9669) b_and!25383)))

(declare-fun m!821159 () Bool)

(assert (=> d!109035 m!821159))

(assert (=> d!109035 m!820961))

(declare-fun m!821161 () Bool)

(assert (=> b!881316 m!821161))

(declare-fun m!821163 () Bool)

(assert (=> b!881315 m!821163))

(assert (=> b!881315 m!821163))

(declare-fun m!821165 () Bool)

(assert (=> b!881315 m!821165))

(declare-fun m!821167 () Bool)

(assert (=> b!881315 m!821167))

(declare-fun m!821169 () Bool)

(assert (=> b!881315 m!821169))

(declare-fun m!821171 () Bool)

(assert (=> b!881315 m!821171))

(assert (=> b!881315 m!820991))

(declare-fun m!821173 () Bool)

(assert (=> b!881315 m!821173))

(assert (=> b!881315 m!821129))

(assert (=> b!881315 m!820991))

(assert (=> b!881315 m!821171))

(assert (=> b!881321 m!821129))

(assert (=> b!881321 m!821129))

(assert (=> b!881321 m!821131))

(declare-fun m!821175 () Bool)

(assert (=> b!881320 m!821175))

(assert (=> b!881319 m!821129))

(assert (=> b!881319 m!821129))

(declare-fun m!821177 () Bool)

(assert (=> b!881319 m!821177))

(declare-fun m!821179 () Bool)

(assert (=> b!881318 m!821179))

(assert (=> b!881313 m!821129))

(assert (=> b!881313 m!821129))

(assert (=> b!881313 m!821131))

(assert (=> b!881317 m!821129))

(declare-fun m!821181 () Bool)

(assert (=> b!881317 m!821181))

(assert (=> b!881317 m!821171))

(assert (=> b!881317 m!820991))

(assert (=> b!881317 m!821173))

(assert (=> b!881317 m!821129))

(assert (=> b!881317 m!820991))

(assert (=> b!881317 m!821171))

(assert (=> bm!38924 m!821179))

(assert (=> b!881152 d!109035))

(declare-fun d!109037 () Bool)

(declare-fun e!490464 () Bool)

(assert (=> d!109037 e!490464))

(declare-fun res!598752 () Bool)

(assert (=> d!109037 (=> (not res!598752) (not e!490464))))

(declare-fun lt!398596 () ListLongMap!10483)

(assert (=> d!109037 (= res!598752 (contains!4260 lt!398596 (_1!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398598 () List!17530)

(assert (=> d!109037 (= lt!398596 (ListLongMap!10484 lt!398598))))

(declare-fun lt!398597 () Unit!30076)

(declare-fun lt!398599 () Unit!30076)

(assert (=> d!109037 (= lt!398597 lt!398599)))

(assert (=> d!109037 (= (getValueByKey!423 lt!398598 (_1!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!428 (_2!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109037 (= lt!398599 (lemmaContainsTupThenGetReturnValue!237 lt!398598 (_1!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109037 (= lt!398598 (insertStrictlySorted!276 (toList!5257 lt!398499) (_1!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109037 (= (+!2529 lt!398499 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398596)))

(declare-fun b!881322 () Bool)

(declare-fun res!598753 () Bool)

(assert (=> b!881322 (=> (not res!598753) (not e!490464))))

(assert (=> b!881322 (= res!598753 (= (getValueByKey!423 (toList!5257 lt!398596) (_1!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!428 (_2!5868 (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!881323 () Bool)

(assert (=> b!881323 (= e!490464 (contains!4262 (toList!5257 lt!398596) (tuple2!11715 (select (arr!24694 _keys!868) from!1053) (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109037 res!598752) b!881322))

(assert (= (and b!881322 res!598753) b!881323))

(declare-fun m!821183 () Bool)

(assert (=> d!109037 m!821183))

(declare-fun m!821185 () Bool)

(assert (=> d!109037 m!821185))

(declare-fun m!821187 () Bool)

(assert (=> d!109037 m!821187))

(declare-fun m!821189 () Bool)

(assert (=> d!109037 m!821189))

(declare-fun m!821191 () Bool)

(assert (=> b!881322 m!821191))

(declare-fun m!821193 () Bool)

(assert (=> b!881323 m!821193))

(assert (=> b!881147 d!109037))

(declare-fun d!109039 () Bool)

(declare-fun c!92931 () Bool)

(assert (=> d!109039 (= c!92931 ((_ is ValueCellFull!8364) (select (arr!24693 _values!688) from!1053)))))

(declare-fun e!490467 () V!28523)

(assert (=> d!109039 (= (get!12990 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490467)))

(declare-fun b!881328 () Bool)

(declare-fun get!12991 (ValueCell!8364 V!28523) V!28523)

(assert (=> b!881328 (= e!490467 (get!12991 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881329 () Bool)

(declare-fun get!12992 (ValueCell!8364 V!28523) V!28523)

(assert (=> b!881329 (= e!490467 (get!12992 (select (arr!24693 _values!688) from!1053) (dynLambda!1245 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109039 c!92931) b!881328))

(assert (= (and d!109039 (not c!92931)) b!881329))

(assert (=> b!881328 m!820989))

(assert (=> b!881328 m!820991))

(declare-fun m!821195 () Bool)

(assert (=> b!881328 m!821195))

(assert (=> b!881329 m!820989))

(assert (=> b!881329 m!820991))

(declare-fun m!821197 () Bool)

(assert (=> b!881329 m!821197))

(assert (=> b!881147 d!109039))

(declare-fun c!92932 () Bool)

(declare-fun bm!38925 () Bool)

(declare-fun call!38928 () Bool)

(assert (=> bm!38925 (= call!38928 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92932 (Cons!17525 (select (arr!24694 _keys!868) from!1053) Nil!17526) Nil!17526)))))

(declare-fun b!881331 () Bool)

(declare-fun e!490469 () Bool)

(assert (=> b!881331 (= e!490469 call!38928)))

(declare-fun b!881332 () Bool)

(declare-fun e!490468 () Bool)

(assert (=> b!881332 (= e!490468 (contains!4261 Nil!17526 (select (arr!24694 _keys!868) from!1053)))))

(declare-fun b!881333 () Bool)

(declare-fun e!490470 () Bool)

(declare-fun e!490471 () Bool)

(assert (=> b!881333 (= e!490470 e!490471)))

(declare-fun res!598755 () Bool)

(assert (=> b!881333 (=> (not res!598755) (not e!490471))))

(assert (=> b!881333 (= res!598755 (not e!490468))))

(declare-fun res!598754 () Bool)

(assert (=> b!881333 (=> (not res!598754) (not e!490468))))

(assert (=> b!881333 (= res!598754 (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)))))

(declare-fun b!881334 () Bool)

(assert (=> b!881334 (= e!490471 e!490469)))

(assert (=> b!881334 (= c!92932 (validKeyInArray!0 (select (arr!24694 _keys!868) from!1053)))))

(declare-fun b!881330 () Bool)

(assert (=> b!881330 (= e!490469 call!38928)))

(declare-fun d!109041 () Bool)

(declare-fun res!598756 () Bool)

(assert (=> d!109041 (=> res!598756 e!490470)))

(assert (=> d!109041 (= res!598756 (bvsge from!1053 (size!25134 _keys!868)))))

(assert (=> d!109041 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17526) e!490470)))

(assert (= (and d!109041 (not res!598756)) b!881333))

(assert (= (and b!881333 res!598754) b!881332))

(assert (= (and b!881333 res!598755) b!881334))

(assert (= (and b!881334 c!92932) b!881331))

(assert (= (and b!881334 (not c!92932)) b!881330))

(assert (= (or b!881331 b!881330) bm!38925))

(assert (=> bm!38925 m!820963))

(declare-fun m!821199 () Bool)

(assert (=> bm!38925 m!821199))

(assert (=> b!881332 m!820963))

(assert (=> b!881332 m!820963))

(declare-fun m!821201 () Bool)

(assert (=> b!881332 m!821201))

(assert (=> b!881333 m!820963))

(assert (=> b!881333 m!820963))

(assert (=> b!881333 m!820965))

(assert (=> b!881334 m!820963))

(assert (=> b!881334 m!820963))

(assert (=> b!881334 m!820965))

(assert (=> b!881148 d!109041))

(declare-fun d!109043 () Bool)

(assert (=> d!109043 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17526)))

(declare-fun lt!398602 () Unit!30076)

(declare-fun choose!39 (array!51342 (_ BitVec 32) (_ BitVec 32)) Unit!30076)

(assert (=> d!109043 (= lt!398602 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109043 (bvslt (size!25134 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109043 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398602)))

(declare-fun bs!24721 () Bool)

(assert (= bs!24721 d!109043))

(assert (=> bs!24721 m!820975))

(declare-fun m!821203 () Bool)

(assert (=> bs!24721 m!821203))

(assert (=> b!881148 d!109043))

(declare-fun d!109045 () Bool)

(assert (=> d!109045 (= (array_inv!19448 _keys!868) (bvsge (size!25134 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74736 d!109045))

(declare-fun d!109047 () Bool)

(assert (=> d!109047 (= (array_inv!19449 _values!688) (bvsge (size!25133 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74736 d!109047))

(declare-fun condMapEmpty!28041 () Bool)

(declare-fun mapDefault!28041 () ValueCell!8364)

(assert (=> mapNonEmpty!28035 (= condMapEmpty!28041 (= mapRest!28035 ((as const (Array (_ BitVec 32) ValueCell!8364)) mapDefault!28041)))))

(declare-fun e!490477 () Bool)

(declare-fun mapRes!28041 () Bool)

(assert (=> mapNonEmpty!28035 (= tp!53779 (and e!490477 mapRes!28041))))

(declare-fun mapIsEmpty!28041 () Bool)

(assert (=> mapIsEmpty!28041 mapRes!28041))

(declare-fun mapNonEmpty!28041 () Bool)

(declare-fun tp!53789 () Bool)

(declare-fun e!490476 () Bool)

(assert (=> mapNonEmpty!28041 (= mapRes!28041 (and tp!53789 e!490476))))

(declare-fun mapRest!28041 () (Array (_ BitVec 32) ValueCell!8364))

(declare-fun mapKey!28041 () (_ BitVec 32))

(declare-fun mapValue!28041 () ValueCell!8364)

(assert (=> mapNonEmpty!28041 (= mapRest!28035 (store mapRest!28041 mapKey!28041 mapValue!28041))))

(declare-fun b!881341 () Bool)

(assert (=> b!881341 (= e!490476 tp_is_empty!17607)))

(declare-fun b!881342 () Bool)

(assert (=> b!881342 (= e!490477 tp_is_empty!17607)))

(assert (= (and mapNonEmpty!28035 condMapEmpty!28041) mapIsEmpty!28041))

(assert (= (and mapNonEmpty!28035 (not condMapEmpty!28041)) mapNonEmpty!28041))

(assert (= (and mapNonEmpty!28041 ((_ is ValueCellFull!8364) mapValue!28041)) b!881341))

(assert (= (and mapNonEmpty!28035 ((_ is ValueCellFull!8364) mapDefault!28041)) b!881342))

(declare-fun m!821205 () Bool)

(assert (=> mapNonEmpty!28041 m!821205))

(declare-fun b_lambda!12527 () Bool)

(assert (= b_lambda!12525 (or (and start!74736 b_free!15363) b_lambda!12527)))

(declare-fun b_lambda!12529 () Bool)

(assert (= b_lambda!12521 (or (and start!74736 b_free!15363) b_lambda!12529)))

(declare-fun b_lambda!12531 () Bool)

(assert (= b_lambda!12515 (or (and start!74736 b_free!15363) b_lambda!12531)))

(declare-fun b_lambda!12533 () Bool)

(assert (= b_lambda!12513 (or (and start!74736 b_free!15363) b_lambda!12533)))

(declare-fun b_lambda!12535 () Bool)

(assert (= b_lambda!12523 (or (and start!74736 b_free!15363) b_lambda!12535)))

(declare-fun b_lambda!12537 () Bool)

(assert (= b_lambda!12519 (or (and start!74736 b_free!15363) b_lambda!12537)))

(declare-fun b_lambda!12539 () Bool)

(assert (= b_lambda!12517 (or (and start!74736 b_free!15363) b_lambda!12539)))

(declare-fun b_lambda!12541 () Bool)

(assert (= b_lambda!12511 (or (and start!74736 b_free!15363) b_lambda!12541)))

(check-sat (not bm!38923) (not b!881293) (not b!881250) (not b!881282) (not b!881315) (not b!881262) (not b_lambda!12529) (not b!881294) (not b!881288) (not b!881253) (not b!881289) (not b!881323) (not b!881249) (not b!881263) (not b!881316) (not b!881281) (not bm!38916) (not bm!38909) (not b!881247) (not b!881267) (not b!881317) (not b_lambda!12539) (not b!881264) (not b_lambda!12531) (not b!881318) (not d!109035) (not mapNonEmpty!28041) (not d!109033) (not b!881286) (not b!881332) (not b!881307) (not b_lambda!12533) (not b!881254) (not b_next!15363) (not b_lambda!12509) (not b!881313) (not b_lambda!12537) (not b!881328) (not b!881322) (not d!109027) (not b!881218) (not b!881266) (not b!881219) (not d!109023) (not b!881207) (not b!881251) b_and!25383 (not b!881334) tp_is_empty!17607 (not b!881280) (not b!881329) (not b!881319) (not bm!38922) (not b_lambda!12527) (not b!881292) (not b!881333) (not bm!38912) (not b!881252) (not bm!38913) (not d!109037) (not bm!38925) (not b!881255) (not b!881299) (not b_lambda!12535) (not d!109021) (not d!109029) (not b_lambda!12541) (not b!881321) (not b!881320) (not b!881290) (not d!109043) (not b!881259) (not b!881265) (not b!881300) (not bm!38924) (not bm!38917) (not b!881291) (not b!881261))
(check-sat b_and!25383 (not b_next!15363))
