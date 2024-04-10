; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74106 () Bool)

(assert start!74106)

(declare-fun mapNonEmpty!27335 () Bool)

(declare-fun mapRes!27335 () Bool)

(declare-fun tp!52534 () Bool)

(declare-fun e!485456 () Bool)

(assert (=> mapNonEmpty!27335 (= mapRes!27335 (and tp!52534 e!485456))))

(declare-datatypes ((V!27923 0))(
  ( (V!27924 (val!8626 Int)) )
))
(declare-datatypes ((ValueCell!8139 0))(
  ( (ValueCellFull!8139 (v!11051 V!27923)) (EmptyCell!8139) )
))
(declare-fun mapRest!27335 () (Array (_ BitVec 32) ValueCell!8139))

(declare-fun mapKey!27335 () (_ BitVec 32))

(declare-fun mapValue!27335 () ValueCell!8139)

(declare-datatypes ((array!50448 0))(
  ( (array!50449 (arr!24255 (Array (_ BitVec 32) ValueCell!8139)) (size!24695 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50448)

(assert (=> mapNonEmpty!27335 (= (arr!24255 _values!688) (store mapRest!27335 mapKey!27335 mapValue!27335))))

(declare-fun mapIsEmpty!27335 () Bool)

(assert (=> mapIsEmpty!27335 mapRes!27335))

(declare-fun b!871895 () Bool)

(declare-fun res!592644 () Bool)

(declare-fun e!485455 () Bool)

(assert (=> b!871895 (=> (not res!592644) (not e!485455))))

(declare-datatypes ((array!50450 0))(
  ( (array!50451 (arr!24256 (Array (_ BitVec 32) (_ BitVec 64))) (size!24696 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50450)

(declare-datatypes ((List!17246 0))(
  ( (Nil!17243) (Cons!17242 (h!18373 (_ BitVec 64)) (t!24283 List!17246)) )
))
(declare-fun arrayNoDuplicates!0 (array!50450 (_ BitVec 32) List!17246) Bool)

(assert (=> b!871895 (= res!592644 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17243))))

(declare-fun b!871896 () Bool)

(declare-fun e!485458 () Bool)

(declare-fun e!485457 () Bool)

(assert (=> b!871896 (= e!485458 (and e!485457 mapRes!27335))))

(declare-fun condMapEmpty!27335 () Bool)

(declare-fun mapDefault!27335 () ValueCell!8139)

(assert (=> b!871896 (= condMapEmpty!27335 (= (arr!24255 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8139)) mapDefault!27335)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!871897 () Bool)

(assert (=> b!871897 (= e!485455 (and (= (select (arr!24256 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24696 _keys!868)) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!871898 () Bool)

(declare-fun tp_is_empty!17157 () Bool)

(assert (=> b!871898 (= e!485456 tp_is_empty!17157)))

(declare-fun b!871899 () Bool)

(assert (=> b!871899 (= e!485457 tp_is_empty!17157)))

(declare-fun b!871900 () Bool)

(declare-fun res!592648 () Bool)

(assert (=> b!871900 (=> (not res!592648) (not e!485455))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50450 (_ BitVec 32)) Bool)

(assert (=> b!871900 (= res!592648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871901 () Bool)

(declare-fun res!592647 () Bool)

(assert (=> b!871901 (=> (not res!592647) (not e!485455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871901 (= res!592647 (validMask!0 mask!1196))))

(declare-fun b!871902 () Bool)

(declare-fun res!592646 () Bool)

(assert (=> b!871902 (=> (not res!592646) (not e!485455))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871902 (= res!592646 (and (= (size!24695 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24696 _keys!868) (size!24695 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871903 () Bool)

(declare-fun res!592643 () Bool)

(assert (=> b!871903 (=> (not res!592643) (not e!485455))))

(assert (=> b!871903 (= res!592643 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24696 _keys!868))))))

(declare-fun b!871904 () Bool)

(declare-fun res!592649 () Bool)

(assert (=> b!871904 (=> (not res!592649) (not e!485455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871904 (= res!592649 (validKeyInArray!0 k0!854))))

(declare-fun res!592645 () Bool)

(assert (=> start!74106 (=> (not res!592645) (not e!485455))))

(assert (=> start!74106 (= res!592645 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24696 _keys!868))))))

(assert (=> start!74106 e!485455))

(assert (=> start!74106 true))

(declare-fun array_inv!19150 (array!50450) Bool)

(assert (=> start!74106 (array_inv!19150 _keys!868)))

(declare-fun array_inv!19151 (array!50448) Bool)

(assert (=> start!74106 (and (array_inv!19151 _values!688) e!485458)))

(assert (= (and start!74106 res!592645) b!871901))

(assert (= (and b!871901 res!592647) b!871902))

(assert (= (and b!871902 res!592646) b!871900))

(assert (= (and b!871900 res!592648) b!871895))

(assert (= (and b!871895 res!592644) b!871903))

(assert (= (and b!871903 res!592643) b!871904))

(assert (= (and b!871904 res!592649) b!871897))

(assert (= (and b!871896 condMapEmpty!27335) mapIsEmpty!27335))

(assert (= (and b!871896 (not condMapEmpty!27335)) mapNonEmpty!27335))

(get-info :version)

(assert (= (and mapNonEmpty!27335 ((_ is ValueCellFull!8139) mapValue!27335)) b!871898))

(assert (= (and b!871896 ((_ is ValueCellFull!8139) mapDefault!27335)) b!871899))

(assert (= start!74106 b!871896))

(declare-fun m!812949 () Bool)

(assert (=> b!871897 m!812949))

(declare-fun m!812951 () Bool)

(assert (=> mapNonEmpty!27335 m!812951))

(declare-fun m!812953 () Bool)

(assert (=> b!871904 m!812953))

(declare-fun m!812955 () Bool)

(assert (=> start!74106 m!812955))

(declare-fun m!812957 () Bool)

(assert (=> start!74106 m!812957))

(declare-fun m!812959 () Bool)

(assert (=> b!871900 m!812959))

(declare-fun m!812961 () Bool)

(assert (=> b!871901 m!812961))

(declare-fun m!812963 () Bool)

(assert (=> b!871895 m!812963))

(check-sat (not b!871901) tp_is_empty!17157 (not start!74106) (not b!871900) (not mapNonEmpty!27335) (not b!871895) (not b!871904))
(check-sat)
(get-model)

(declare-fun d!108449 () Bool)

(assert (=> d!108449 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!871904 d!108449))

(declare-fun d!108451 () Bool)

(assert (=> d!108451 (= (array_inv!19150 _keys!868) (bvsge (size!24696 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74106 d!108451))

(declare-fun d!108453 () Bool)

(assert (=> d!108453 (= (array_inv!19151 _values!688) (bvsge (size!24695 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74106 d!108453))

(declare-fun b!871943 () Bool)

(declare-fun e!485481 () Bool)

(declare-fun e!485482 () Bool)

(assert (=> b!871943 (= e!485481 e!485482)))

(declare-fun lt!395553 () (_ BitVec 64))

(assert (=> b!871943 (= lt!395553 (select (arr!24256 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!29914 0))(
  ( (Unit!29915) )
))
(declare-fun lt!395554 () Unit!29914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50450 (_ BitVec 64) (_ BitVec 32)) Unit!29914)

(assert (=> b!871943 (= lt!395554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395553 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!871943 (arrayContainsKey!0 _keys!868 lt!395553 #b00000000000000000000000000000000)))

(declare-fun lt!395552 () Unit!29914)

(assert (=> b!871943 (= lt!395552 lt!395554)))

(declare-fun res!592675 () Bool)

(declare-datatypes ((SeekEntryResult!8749 0))(
  ( (MissingZero!8749 (index!37367 (_ BitVec 32))) (Found!8749 (index!37368 (_ BitVec 32))) (Intermediate!8749 (undefined!9561 Bool) (index!37369 (_ BitVec 32)) (x!73850 (_ BitVec 32))) (Undefined!8749) (MissingVacant!8749 (index!37370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50450 (_ BitVec 32)) SeekEntryResult!8749)

(assert (=> b!871943 (= res!592675 (= (seekEntryOrOpen!0 (select (arr!24256 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8749 #b00000000000000000000000000000000)))))

(assert (=> b!871943 (=> (not res!592675) (not e!485482))))

(declare-fun b!871944 () Bool)

(declare-fun e!485480 () Bool)

(assert (=> b!871944 (= e!485480 e!485481)))

(declare-fun c!92389 () Bool)

(assert (=> b!871944 (= c!92389 (validKeyInArray!0 (select (arr!24256 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38459 () Bool)

(declare-fun call!38462 () Bool)

(assert (=> bm!38459 (= call!38462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108455 () Bool)

(declare-fun res!592676 () Bool)

(assert (=> d!108455 (=> res!592676 e!485480)))

(assert (=> d!108455 (= res!592676 (bvsge #b00000000000000000000000000000000 (size!24696 _keys!868)))))

(assert (=> d!108455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!485480)))

(declare-fun b!871945 () Bool)

(assert (=> b!871945 (= e!485481 call!38462)))

(declare-fun b!871946 () Bool)

(assert (=> b!871946 (= e!485482 call!38462)))

(assert (= (and d!108455 (not res!592676)) b!871944))

(assert (= (and b!871944 c!92389) b!871943))

(assert (= (and b!871944 (not c!92389)) b!871945))

(assert (= (and b!871943 res!592675) b!871946))

(assert (= (or b!871946 b!871945) bm!38459))

(declare-fun m!812981 () Bool)

(assert (=> b!871943 m!812981))

(declare-fun m!812983 () Bool)

(assert (=> b!871943 m!812983))

(declare-fun m!812985 () Bool)

(assert (=> b!871943 m!812985))

(assert (=> b!871943 m!812981))

(declare-fun m!812987 () Bool)

(assert (=> b!871943 m!812987))

(assert (=> b!871944 m!812981))

(assert (=> b!871944 m!812981))

(declare-fun m!812989 () Bool)

(assert (=> b!871944 m!812989))

(declare-fun m!812991 () Bool)

(assert (=> bm!38459 m!812991))

(assert (=> b!871900 d!108455))

(declare-fun b!871957 () Bool)

(declare-fun e!485491 () Bool)

(declare-fun call!38465 () Bool)

(assert (=> b!871957 (= e!485491 call!38465)))

(declare-fun b!871958 () Bool)

(declare-fun e!485492 () Bool)

(declare-fun e!485494 () Bool)

(assert (=> b!871958 (= e!485492 e!485494)))

(declare-fun res!592685 () Bool)

(assert (=> b!871958 (=> (not res!592685) (not e!485494))))

(declare-fun e!485493 () Bool)

(assert (=> b!871958 (= res!592685 (not e!485493))))

(declare-fun res!592683 () Bool)

(assert (=> b!871958 (=> (not res!592683) (not e!485493))))

(assert (=> b!871958 (= res!592683 (validKeyInArray!0 (select (arr!24256 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108457 () Bool)

(declare-fun res!592684 () Bool)

(assert (=> d!108457 (=> res!592684 e!485492)))

(assert (=> d!108457 (= res!592684 (bvsge #b00000000000000000000000000000000 (size!24696 _keys!868)))))

(assert (=> d!108457 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17243) e!485492)))

(declare-fun bm!38462 () Bool)

(declare-fun c!92392 () Bool)

(assert (=> bm!38462 (= call!38465 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92392 (Cons!17242 (select (arr!24256 _keys!868) #b00000000000000000000000000000000) Nil!17243) Nil!17243)))))

(declare-fun b!871959 () Bool)

(assert (=> b!871959 (= e!485491 call!38465)))

(declare-fun b!871960 () Bool)

(assert (=> b!871960 (= e!485494 e!485491)))

(assert (=> b!871960 (= c!92392 (validKeyInArray!0 (select (arr!24256 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!871961 () Bool)

(declare-fun contains!4239 (List!17246 (_ BitVec 64)) Bool)

(assert (=> b!871961 (= e!485493 (contains!4239 Nil!17243 (select (arr!24256 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108457 (not res!592684)) b!871958))

(assert (= (and b!871958 res!592683) b!871961))

(assert (= (and b!871958 res!592685) b!871960))

(assert (= (and b!871960 c!92392) b!871957))

(assert (= (and b!871960 (not c!92392)) b!871959))

(assert (= (or b!871957 b!871959) bm!38462))

(assert (=> b!871958 m!812981))

(assert (=> b!871958 m!812981))

(assert (=> b!871958 m!812989))

(assert (=> bm!38462 m!812981))

(declare-fun m!812993 () Bool)

(assert (=> bm!38462 m!812993))

(assert (=> b!871960 m!812981))

(assert (=> b!871960 m!812981))

(assert (=> b!871960 m!812989))

(assert (=> b!871961 m!812981))

(assert (=> b!871961 m!812981))

(declare-fun m!812995 () Bool)

(assert (=> b!871961 m!812995))

(assert (=> b!871895 d!108457))

(declare-fun d!108459 () Bool)

(assert (=> d!108459 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!871901 d!108459))

(declare-fun mapNonEmpty!27341 () Bool)

(declare-fun mapRes!27341 () Bool)

(declare-fun tp!52540 () Bool)

(declare-fun e!485500 () Bool)

(assert (=> mapNonEmpty!27341 (= mapRes!27341 (and tp!52540 e!485500))))

(declare-fun mapKey!27341 () (_ BitVec 32))

(declare-fun mapValue!27341 () ValueCell!8139)

(declare-fun mapRest!27341 () (Array (_ BitVec 32) ValueCell!8139))

(assert (=> mapNonEmpty!27341 (= mapRest!27335 (store mapRest!27341 mapKey!27341 mapValue!27341))))

(declare-fun b!871969 () Bool)

(declare-fun e!485499 () Bool)

(assert (=> b!871969 (= e!485499 tp_is_empty!17157)))

(declare-fun b!871968 () Bool)

(assert (=> b!871968 (= e!485500 tp_is_empty!17157)))

(declare-fun condMapEmpty!27341 () Bool)

(declare-fun mapDefault!27341 () ValueCell!8139)

(assert (=> mapNonEmpty!27335 (= condMapEmpty!27341 (= mapRest!27335 ((as const (Array (_ BitVec 32) ValueCell!8139)) mapDefault!27341)))))

(assert (=> mapNonEmpty!27335 (= tp!52534 (and e!485499 mapRes!27341))))

(declare-fun mapIsEmpty!27341 () Bool)

(assert (=> mapIsEmpty!27341 mapRes!27341))

(assert (= (and mapNonEmpty!27335 condMapEmpty!27341) mapIsEmpty!27341))

(assert (= (and mapNonEmpty!27335 (not condMapEmpty!27341)) mapNonEmpty!27341))

(assert (= (and mapNonEmpty!27341 ((_ is ValueCellFull!8139) mapValue!27341)) b!871968))

(assert (= (and mapNonEmpty!27335 ((_ is ValueCellFull!8139) mapDefault!27341)) b!871969))

(declare-fun m!812997 () Bool)

(assert (=> mapNonEmpty!27341 m!812997))

(check-sat (not b!871960) (not b!871958) (not mapNonEmpty!27341) (not b!871944) (not bm!38459) (not bm!38462) tp_is_empty!17157 (not b!871961) (not b!871943))
(check-sat)
