; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74086 () Bool)

(assert start!74086)

(declare-fun b!871626 () Bool)

(declare-fun res!592513 () Bool)

(declare-fun e!485294 () Bool)

(assert (=> b!871626 (=> (not res!592513) (not e!485294))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50435 0))(
  ( (array!50436 (arr!24249 (Array (_ BitVec 32) (_ BitVec 64))) (size!24691 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50435)

(assert (=> b!871626 (= res!592513 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24691 _keys!868))))))

(declare-fun b!871627 () Bool)

(declare-fun e!485292 () Bool)

(declare-fun tp_is_empty!17155 () Bool)

(assert (=> b!871627 (= e!485292 tp_is_empty!17155)))

(declare-fun b!871628 () Bool)

(declare-fun e!485295 () Bool)

(declare-fun e!485291 () Bool)

(declare-fun mapRes!27332 () Bool)

(assert (=> b!871628 (= e!485295 (and e!485291 mapRes!27332))))

(declare-fun condMapEmpty!27332 () Bool)

(declare-datatypes ((V!27921 0))(
  ( (V!27922 (val!8625 Int)) )
))
(declare-datatypes ((ValueCell!8138 0))(
  ( (ValueCellFull!8138 (v!11044 V!27921)) (EmptyCell!8138) )
))
(declare-datatypes ((array!50437 0))(
  ( (array!50438 (arr!24250 (Array (_ BitVec 32) ValueCell!8138)) (size!24692 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50437)

(declare-fun mapDefault!27332 () ValueCell!8138)

(assert (=> b!871628 (= condMapEmpty!27332 (= (arr!24250 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8138)) mapDefault!27332)))))

(declare-fun b!871629 () Bool)

(declare-fun res!592512 () Bool)

(assert (=> b!871629 (=> (not res!592512) (not e!485294))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50435 (_ BitVec 32)) Bool)

(assert (=> b!871629 (= res!592512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871630 () Bool)

(declare-fun res!592516 () Bool)

(assert (=> b!871630 (=> (not res!592516) (not e!485294))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871630 (= res!592516 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27332 () Bool)

(assert (=> mapIsEmpty!27332 mapRes!27332))

(declare-fun b!871631 () Bool)

(assert (=> b!871631 (= e!485291 tp_is_empty!17155)))

(declare-fun b!871632 () Bool)

(declare-fun res!592514 () Bool)

(assert (=> b!871632 (=> (not res!592514) (not e!485294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871632 (= res!592514 (validMask!0 mask!1196))))

(declare-fun b!871633 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!871633 (= e!485294 (and (= (select (arr!24249 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24691 _keys!868)) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!592518 () Bool)

(assert (=> start!74086 (=> (not res!592518) (not e!485294))))

(assert (=> start!74086 (= res!592518 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24691 _keys!868))))))

(assert (=> start!74086 e!485294))

(assert (=> start!74086 true))

(declare-fun array_inv!19208 (array!50435) Bool)

(assert (=> start!74086 (array_inv!19208 _keys!868)))

(declare-fun array_inv!19209 (array!50437) Bool)

(assert (=> start!74086 (and (array_inv!19209 _values!688) e!485295)))

(declare-fun b!871634 () Bool)

(declare-fun res!592515 () Bool)

(assert (=> b!871634 (=> (not res!592515) (not e!485294))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871634 (= res!592515 (and (= (size!24692 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24691 _keys!868) (size!24692 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871635 () Bool)

(declare-fun res!592517 () Bool)

(assert (=> b!871635 (=> (not res!592517) (not e!485294))))

(declare-datatypes ((List!17252 0))(
  ( (Nil!17249) (Cons!17248 (h!18379 (_ BitVec 64)) (t!24280 List!17252)) )
))
(declare-fun arrayNoDuplicates!0 (array!50435 (_ BitVec 32) List!17252) Bool)

(assert (=> b!871635 (= res!592517 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17249))))

(declare-fun mapNonEmpty!27332 () Bool)

(declare-fun tp!52532 () Bool)

(assert (=> mapNonEmpty!27332 (= mapRes!27332 (and tp!52532 e!485292))))

(declare-fun mapValue!27332 () ValueCell!8138)

(declare-fun mapRest!27332 () (Array (_ BitVec 32) ValueCell!8138))

(declare-fun mapKey!27332 () (_ BitVec 32))

(assert (=> mapNonEmpty!27332 (= (arr!24250 _values!688) (store mapRest!27332 mapKey!27332 mapValue!27332))))

(assert (= (and start!74086 res!592518) b!871632))

(assert (= (and b!871632 res!592514) b!871634))

(assert (= (and b!871634 res!592515) b!871629))

(assert (= (and b!871629 res!592512) b!871635))

(assert (= (and b!871635 res!592517) b!871626))

(assert (= (and b!871626 res!592513) b!871630))

(assert (= (and b!871630 res!592516) b!871633))

(assert (= (and b!871628 condMapEmpty!27332) mapIsEmpty!27332))

(assert (= (and b!871628 (not condMapEmpty!27332)) mapNonEmpty!27332))

(get-info :version)

(assert (= (and mapNonEmpty!27332 ((_ is ValueCellFull!8138) mapValue!27332)) b!871627))

(assert (= (and b!871628 ((_ is ValueCellFull!8138) mapDefault!27332)) b!871631))

(assert (= start!74086 b!871628))

(declare-fun m!812175 () Bool)

(assert (=> b!871632 m!812175))

(declare-fun m!812177 () Bool)

(assert (=> mapNonEmpty!27332 m!812177))

(declare-fun m!812179 () Bool)

(assert (=> b!871630 m!812179))

(declare-fun m!812181 () Bool)

(assert (=> start!74086 m!812181))

(declare-fun m!812183 () Bool)

(assert (=> start!74086 m!812183))

(declare-fun m!812185 () Bool)

(assert (=> b!871633 m!812185))

(declare-fun m!812187 () Bool)

(assert (=> b!871635 m!812187))

(declare-fun m!812189 () Bool)

(assert (=> b!871629 m!812189))

(check-sat (not b!871632) (not mapNonEmpty!27332) (not b!871629) (not b!871630) (not b!871635) tp_is_empty!17155 (not start!74086))
(check-sat)
(get-model)

(declare-fun b!871706 () Bool)

(declare-fun e!485335 () Bool)

(declare-fun e!485336 () Bool)

(assert (=> b!871706 (= e!485335 e!485336)))

(declare-fun c!92324 () Bool)

(assert (=> b!871706 (= c!92324 (validKeyInArray!0 (select (arr!24249 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!871707 () Bool)

(declare-fun e!485334 () Bool)

(assert (=> b!871707 (= e!485334 e!485335)))

(declare-fun res!592568 () Bool)

(assert (=> b!871707 (=> (not res!592568) (not e!485335))))

(declare-fun e!485337 () Bool)

(assert (=> b!871707 (= res!592568 (not e!485337))))

(declare-fun res!592567 () Bool)

(assert (=> b!871707 (=> (not res!592567) (not e!485337))))

(assert (=> b!871707 (= res!592567 (validKeyInArray!0 (select (arr!24249 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38433 () Bool)

(declare-fun call!38436 () Bool)

(assert (=> bm!38433 (= call!38436 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92324 (Cons!17248 (select (arr!24249 _keys!868) #b00000000000000000000000000000000) Nil!17249) Nil!17249)))))

(declare-fun d!108251 () Bool)

(declare-fun res!592569 () Bool)

(assert (=> d!108251 (=> res!592569 e!485334)))

(assert (=> d!108251 (= res!592569 (bvsge #b00000000000000000000000000000000 (size!24691 _keys!868)))))

(assert (=> d!108251 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17249) e!485334)))

(declare-fun b!871708 () Bool)

(assert (=> b!871708 (= e!485336 call!38436)))

(declare-fun b!871709 () Bool)

(assert (=> b!871709 (= e!485336 call!38436)))

(declare-fun b!871710 () Bool)

(declare-fun contains!4213 (List!17252 (_ BitVec 64)) Bool)

(assert (=> b!871710 (= e!485337 (contains!4213 Nil!17249 (select (arr!24249 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108251 (not res!592569)) b!871707))

(assert (= (and b!871707 res!592567) b!871710))

(assert (= (and b!871707 res!592568) b!871706))

(assert (= (and b!871706 c!92324) b!871708))

(assert (= (and b!871706 (not c!92324)) b!871709))

(assert (= (or b!871708 b!871709) bm!38433))

(declare-fun m!812223 () Bool)

(assert (=> b!871706 m!812223))

(assert (=> b!871706 m!812223))

(declare-fun m!812225 () Bool)

(assert (=> b!871706 m!812225))

(assert (=> b!871707 m!812223))

(assert (=> b!871707 m!812223))

(assert (=> b!871707 m!812225))

(assert (=> bm!38433 m!812223))

(declare-fun m!812227 () Bool)

(assert (=> bm!38433 m!812227))

(assert (=> b!871710 m!812223))

(assert (=> b!871710 m!812223))

(declare-fun m!812229 () Bool)

(assert (=> b!871710 m!812229))

(assert (=> b!871635 d!108251))

(declare-fun d!108253 () Bool)

(assert (=> d!108253 (= (array_inv!19208 _keys!868) (bvsge (size!24691 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74086 d!108253))

(declare-fun d!108255 () Bool)

(assert (=> d!108255 (= (array_inv!19209 _values!688) (bvsge (size!24692 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74086 d!108255))

(declare-fun d!108257 () Bool)

(assert (=> d!108257 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!871632 d!108257))

(declare-fun b!871719 () Bool)

(declare-fun e!485344 () Bool)

(declare-fun e!485345 () Bool)

(assert (=> b!871719 (= e!485344 e!485345)))

(declare-fun lt!395317 () (_ BitVec 64))

(assert (=> b!871719 (= lt!395317 (select (arr!24249 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!29857 0))(
  ( (Unit!29858) )
))
(declare-fun lt!395316 () Unit!29857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50435 (_ BitVec 64) (_ BitVec 32)) Unit!29857)

(assert (=> b!871719 (= lt!395316 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395317 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!871719 (arrayContainsKey!0 _keys!868 lt!395317 #b00000000000000000000000000000000)))

(declare-fun lt!395318 () Unit!29857)

(assert (=> b!871719 (= lt!395318 lt!395316)))

(declare-fun res!592575 () Bool)

(declare-datatypes ((SeekEntryResult!8745 0))(
  ( (MissingZero!8745 (index!37351 (_ BitVec 32))) (Found!8745 (index!37352 (_ BitVec 32))) (Intermediate!8745 (undefined!9557 Bool) (index!37353 (_ BitVec 32)) (x!73841 (_ BitVec 32))) (Undefined!8745) (MissingVacant!8745 (index!37354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50435 (_ BitVec 32)) SeekEntryResult!8745)

(assert (=> b!871719 (= res!592575 (= (seekEntryOrOpen!0 (select (arr!24249 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8745 #b00000000000000000000000000000000)))))

(assert (=> b!871719 (=> (not res!592575) (not e!485345))))

(declare-fun b!871720 () Bool)

(declare-fun call!38439 () Bool)

(assert (=> b!871720 (= e!485344 call!38439)))

(declare-fun d!108259 () Bool)

(declare-fun res!592574 () Bool)

(declare-fun e!485346 () Bool)

(assert (=> d!108259 (=> res!592574 e!485346)))

(assert (=> d!108259 (= res!592574 (bvsge #b00000000000000000000000000000000 (size!24691 _keys!868)))))

(assert (=> d!108259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!485346)))

(declare-fun bm!38436 () Bool)

(assert (=> bm!38436 (= call!38439 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!871721 () Bool)

(assert (=> b!871721 (= e!485346 e!485344)))

(declare-fun c!92327 () Bool)

(assert (=> b!871721 (= c!92327 (validKeyInArray!0 (select (arr!24249 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!871722 () Bool)

(assert (=> b!871722 (= e!485345 call!38439)))

(assert (= (and d!108259 (not res!592574)) b!871721))

(assert (= (and b!871721 c!92327) b!871719))

(assert (= (and b!871721 (not c!92327)) b!871720))

(assert (= (and b!871719 res!592575) b!871722))

(assert (= (or b!871722 b!871720) bm!38436))

(assert (=> b!871719 m!812223))

(declare-fun m!812231 () Bool)

(assert (=> b!871719 m!812231))

(declare-fun m!812233 () Bool)

(assert (=> b!871719 m!812233))

(assert (=> b!871719 m!812223))

(declare-fun m!812235 () Bool)

(assert (=> b!871719 m!812235))

(declare-fun m!812237 () Bool)

(assert (=> bm!38436 m!812237))

(assert (=> b!871721 m!812223))

(assert (=> b!871721 m!812223))

(assert (=> b!871721 m!812225))

(assert (=> b!871629 d!108259))

(declare-fun d!108261 () Bool)

(assert (=> d!108261 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!871630 d!108261))

(declare-fun mapIsEmpty!27341 () Bool)

(declare-fun mapRes!27341 () Bool)

(assert (=> mapIsEmpty!27341 mapRes!27341))

(declare-fun mapNonEmpty!27341 () Bool)

(declare-fun tp!52541 () Bool)

(declare-fun e!485351 () Bool)

(assert (=> mapNonEmpty!27341 (= mapRes!27341 (and tp!52541 e!485351))))

(declare-fun mapRest!27341 () (Array (_ BitVec 32) ValueCell!8138))

(declare-fun mapValue!27341 () ValueCell!8138)

(declare-fun mapKey!27341 () (_ BitVec 32))

(assert (=> mapNonEmpty!27341 (= mapRest!27332 (store mapRest!27341 mapKey!27341 mapValue!27341))))

(declare-fun condMapEmpty!27341 () Bool)

(declare-fun mapDefault!27341 () ValueCell!8138)

(assert (=> mapNonEmpty!27332 (= condMapEmpty!27341 (= mapRest!27332 ((as const (Array (_ BitVec 32) ValueCell!8138)) mapDefault!27341)))))

(declare-fun e!485352 () Bool)

(assert (=> mapNonEmpty!27332 (= tp!52532 (and e!485352 mapRes!27341))))

(declare-fun b!871730 () Bool)

(assert (=> b!871730 (= e!485352 tp_is_empty!17155)))

(declare-fun b!871729 () Bool)

(assert (=> b!871729 (= e!485351 tp_is_empty!17155)))

(assert (= (and mapNonEmpty!27332 condMapEmpty!27341) mapIsEmpty!27341))

(assert (= (and mapNonEmpty!27332 (not condMapEmpty!27341)) mapNonEmpty!27341))

(assert (= (and mapNonEmpty!27341 ((_ is ValueCellFull!8138) mapValue!27341)) b!871729))

(assert (= (and mapNonEmpty!27332 ((_ is ValueCellFull!8138) mapDefault!27341)) b!871730))

(declare-fun m!812239 () Bool)

(assert (=> mapNonEmpty!27341 m!812239))

(check-sat (not mapNonEmpty!27341) (not b!871719) (not b!871706) (not b!871707) tp_is_empty!17155 (not b!871710) (not b!871721) (not bm!38436) (not bm!38433))
(check-sat)
