; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100138 () Bool)

(assert start!100138)

(declare-fun b!1194224 () Bool)

(declare-fun res!794599 () Bool)

(declare-fun e!678684 () Bool)

(assert (=> b!1194224 (=> (not res!794599) (not e!678684))))

(declare-datatypes ((array!77216 0))(
  ( (array!77217 (arr!37258 (Array (_ BitVec 32) (_ BitVec 64))) (size!37796 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77216)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45465 0))(
  ( (V!45466 (val!15183 Int)) )
))
(declare-datatypes ((ValueCell!14417 0))(
  ( (ValueCellFull!14417 (v!17820 V!45465)) (EmptyCell!14417) )
))
(declare-datatypes ((array!77218 0))(
  ( (array!77219 (arr!37259 (Array (_ BitVec 32) ValueCell!14417)) (size!37797 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77218)

(assert (=> b!1194224 (= res!794599 (and (= (size!37797 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37796 _keys!1208) (size!37797 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47207 () Bool)

(declare-fun mapRes!47207 () Bool)

(assert (=> mapIsEmpty!47207 mapRes!47207))

(declare-fun b!1194225 () Bool)

(declare-fun res!794593 () Bool)

(assert (=> b!1194225 (=> (not res!794593) (not e!678684))))

(declare-datatypes ((List!26335 0))(
  ( (Nil!26332) (Cons!26331 (h!27540 (_ BitVec 64)) (t!38997 List!26335)) )
))
(declare-fun arrayNoDuplicates!0 (array!77216 (_ BitVec 32) List!26335) Bool)

(assert (=> b!1194225 (= res!794593 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26332))))

(declare-fun mapNonEmpty!47207 () Bool)

(declare-fun tp!89817 () Bool)

(declare-fun e!678683 () Bool)

(assert (=> mapNonEmpty!47207 (= mapRes!47207 (and tp!89817 e!678683))))

(declare-fun mapKey!47207 () (_ BitVec 32))

(declare-fun mapRest!47207 () (Array (_ BitVec 32) ValueCell!14417))

(declare-fun mapValue!47207 () ValueCell!14417)

(assert (=> mapNonEmpty!47207 (= (arr!37259 _values!996) (store mapRest!47207 mapKey!47207 mapValue!47207))))

(declare-fun b!1194226 () Bool)

(declare-fun e!678681 () Bool)

(declare-fun e!678680 () Bool)

(assert (=> b!1194226 (= e!678681 (and e!678680 mapRes!47207))))

(declare-fun condMapEmpty!47207 () Bool)

(declare-fun mapDefault!47207 () ValueCell!14417)

(assert (=> b!1194226 (= condMapEmpty!47207 (= (arr!37259 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14417)) mapDefault!47207)))))

(declare-fun b!1194227 () Bool)

(declare-fun res!794595 () Bool)

(assert (=> b!1194227 (=> (not res!794595) (not e!678684))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194227 (= res!794595 (= (select (arr!37258 _keys!1208) i!673) k0!934))))

(declare-fun res!794598 () Bool)

(assert (=> start!100138 (=> (not res!794598) (not e!678684))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100138 (= res!794598 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37796 _keys!1208))))))

(assert (=> start!100138 e!678684))

(declare-fun array_inv!28522 (array!77216) Bool)

(assert (=> start!100138 (array_inv!28522 _keys!1208)))

(assert (=> start!100138 true))

(declare-fun array_inv!28523 (array!77218) Bool)

(assert (=> start!100138 (and (array_inv!28523 _values!996) e!678681)))

(declare-fun b!1194228 () Bool)

(declare-fun e!678682 () Bool)

(assert (=> b!1194228 (= e!678682 (bvsge (size!37796 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1194229 () Bool)

(declare-fun res!794597 () Bool)

(assert (=> b!1194229 (=> (not res!794597) (not e!678684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77216 (_ BitVec 32)) Bool)

(assert (=> b!1194229 (= res!794597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194230 () Bool)

(declare-fun res!794596 () Bool)

(assert (=> b!1194230 (=> (not res!794596) (not e!678684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194230 (= res!794596 (validMask!0 mask!1564))))

(declare-fun b!1194231 () Bool)

(assert (=> b!1194231 (= e!678684 e!678682)))

(declare-fun res!794592 () Bool)

(assert (=> b!1194231 (=> (not res!794592) (not e!678682))))

(declare-fun lt!542568 () array!77216)

(assert (=> b!1194231 (= res!794592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542568 mask!1564))))

(assert (=> b!1194231 (= lt!542568 (array!77217 (store (arr!37258 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37796 _keys!1208)))))

(declare-fun b!1194232 () Bool)

(declare-fun res!794590 () Bool)

(assert (=> b!1194232 (=> (not res!794590) (not e!678684))))

(assert (=> b!1194232 (= res!794590 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37796 _keys!1208))))))

(declare-fun b!1194233 () Bool)

(declare-fun tp_is_empty!30253 () Bool)

(assert (=> b!1194233 (= e!678680 tp_is_empty!30253)))

(declare-fun b!1194234 () Bool)

(declare-fun res!794594 () Bool)

(assert (=> b!1194234 (=> (not res!794594) (not e!678684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194234 (= res!794594 (validKeyInArray!0 k0!934))))

(declare-fun b!1194235 () Bool)

(declare-fun res!794591 () Bool)

(assert (=> b!1194235 (=> (not res!794591) (not e!678682))))

(assert (=> b!1194235 (= res!794591 (arrayNoDuplicates!0 lt!542568 #b00000000000000000000000000000000 Nil!26332))))

(declare-fun b!1194236 () Bool)

(assert (=> b!1194236 (= e!678683 tp_is_empty!30253)))

(assert (= (and start!100138 res!794598) b!1194230))

(assert (= (and b!1194230 res!794596) b!1194224))

(assert (= (and b!1194224 res!794599) b!1194229))

(assert (= (and b!1194229 res!794597) b!1194225))

(assert (= (and b!1194225 res!794593) b!1194232))

(assert (= (and b!1194232 res!794590) b!1194234))

(assert (= (and b!1194234 res!794594) b!1194227))

(assert (= (and b!1194227 res!794595) b!1194231))

(assert (= (and b!1194231 res!794592) b!1194235))

(assert (= (and b!1194235 res!794591) b!1194228))

(assert (= (and b!1194226 condMapEmpty!47207) mapIsEmpty!47207))

(assert (= (and b!1194226 (not condMapEmpty!47207)) mapNonEmpty!47207))

(get-info :version)

(assert (= (and mapNonEmpty!47207 ((_ is ValueCellFull!14417) mapValue!47207)) b!1194236))

(assert (= (and b!1194226 ((_ is ValueCellFull!14417) mapDefault!47207)) b!1194233))

(assert (= start!100138 b!1194226))

(declare-fun m!1101683 () Bool)

(assert (=> b!1194225 m!1101683))

(declare-fun m!1101685 () Bool)

(assert (=> b!1194227 m!1101685))

(declare-fun m!1101687 () Bool)

(assert (=> b!1194229 m!1101687))

(declare-fun m!1101689 () Bool)

(assert (=> start!100138 m!1101689))

(declare-fun m!1101691 () Bool)

(assert (=> start!100138 m!1101691))

(declare-fun m!1101693 () Bool)

(assert (=> b!1194234 m!1101693))

(declare-fun m!1101695 () Bool)

(assert (=> b!1194235 m!1101695))

(declare-fun m!1101697 () Bool)

(assert (=> b!1194230 m!1101697))

(declare-fun m!1101699 () Bool)

(assert (=> mapNonEmpty!47207 m!1101699))

(declare-fun m!1101701 () Bool)

(assert (=> b!1194231 m!1101701))

(declare-fun m!1101703 () Bool)

(assert (=> b!1194231 m!1101703))

(check-sat tp_is_empty!30253 (not start!100138) (not b!1194229) (not b!1194235) (not b!1194230) (not mapNonEmpty!47207) (not b!1194234) (not b!1194225) (not b!1194231))
(check-sat)
(get-model)

(declare-fun d!132105 () Bool)

(assert (=> d!132105 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1194234 d!132105))

(declare-fun d!132107 () Bool)

(assert (=> d!132107 (= (array_inv!28522 _keys!1208) (bvsge (size!37796 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100138 d!132107))

(declare-fun d!132109 () Bool)

(assert (=> d!132109 (= (array_inv!28523 _values!996) (bvsge (size!37797 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100138 d!132109))

(declare-fun b!1194323 () Bool)

(declare-fun e!678728 () Bool)

(declare-fun e!678729 () Bool)

(assert (=> b!1194323 (= e!678728 e!678729)))

(declare-fun lt!542583 () (_ BitVec 64))

(assert (=> b!1194323 (= lt!542583 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!39475 0))(
  ( (Unit!39476) )
))
(declare-fun lt!542581 () Unit!39475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77216 (_ BitVec 64) (_ BitVec 32)) Unit!39475)

(assert (=> b!1194323 (= lt!542581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!542583 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!77216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194323 (arrayContainsKey!0 _keys!1208 lt!542583 #b00000000000000000000000000000000)))

(declare-fun lt!542582 () Unit!39475)

(assert (=> b!1194323 (= lt!542582 lt!542581)))

(declare-fun res!794664 () Bool)

(declare-datatypes ((SeekEntryResult!9927 0))(
  ( (MissingZero!9927 (index!42079 (_ BitVec 32))) (Found!9927 (index!42080 (_ BitVec 32))) (Intermediate!9927 (undefined!10739 Bool) (index!42081 (_ BitVec 32)) (x!105642 (_ BitVec 32))) (Undefined!9927) (MissingVacant!9927 (index!42082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77216 (_ BitVec 32)) SeekEntryResult!9927)

(assert (=> b!1194323 (= res!794664 (= (seekEntryOrOpen!0 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9927 #b00000000000000000000000000000000)))))

(assert (=> b!1194323 (=> (not res!794664) (not e!678729))))

(declare-fun b!1194324 () Bool)

(declare-fun call!57115 () Bool)

(assert (=> b!1194324 (= e!678729 call!57115)))

(declare-fun b!1194325 () Bool)

(assert (=> b!1194325 (= e!678728 call!57115)))

(declare-fun b!1194326 () Bool)

(declare-fun e!678730 () Bool)

(assert (=> b!1194326 (= e!678730 e!678728)))

(declare-fun c!117286 () Bool)

(assert (=> b!1194326 (= c!117286 (validKeyInArray!0 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132111 () Bool)

(declare-fun res!794665 () Bool)

(assert (=> d!132111 (=> res!794665 e!678730)))

(assert (=> d!132111 (= res!794665 (bvsge #b00000000000000000000000000000000 (size!37796 _keys!1208)))))

(assert (=> d!132111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!678730)))

(declare-fun bm!57112 () Bool)

(assert (=> bm!57112 (= call!57115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!132111 (not res!794665)) b!1194326))

(assert (= (and b!1194326 c!117286) b!1194323))

(assert (= (and b!1194326 (not c!117286)) b!1194325))

(assert (= (and b!1194323 res!794664) b!1194324))

(assert (= (or b!1194324 b!1194325) bm!57112))

(declare-fun m!1101749 () Bool)

(assert (=> b!1194323 m!1101749))

(declare-fun m!1101751 () Bool)

(assert (=> b!1194323 m!1101751))

(declare-fun m!1101753 () Bool)

(assert (=> b!1194323 m!1101753))

(assert (=> b!1194323 m!1101749))

(declare-fun m!1101755 () Bool)

(assert (=> b!1194323 m!1101755))

(assert (=> b!1194326 m!1101749))

(assert (=> b!1194326 m!1101749))

(declare-fun m!1101757 () Bool)

(assert (=> b!1194326 m!1101757))

(declare-fun m!1101759 () Bool)

(assert (=> bm!57112 m!1101759))

(assert (=> b!1194229 d!132111))

(declare-fun b!1194337 () Bool)

(declare-fun e!678739 () Bool)

(declare-fun call!57118 () Bool)

(assert (=> b!1194337 (= e!678739 call!57118)))

(declare-fun d!132113 () Bool)

(declare-fun res!794673 () Bool)

(declare-fun e!678741 () Bool)

(assert (=> d!132113 (=> res!794673 e!678741)))

(assert (=> d!132113 (= res!794673 (bvsge #b00000000000000000000000000000000 (size!37796 _keys!1208)))))

(assert (=> d!132113 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26332) e!678741)))

(declare-fun b!1194338 () Bool)

(assert (=> b!1194338 (= e!678739 call!57118)))

(declare-fun b!1194339 () Bool)

(declare-fun e!678740 () Bool)

(declare-fun contains!6841 (List!26335 (_ BitVec 64)) Bool)

(assert (=> b!1194339 (= e!678740 (contains!6841 Nil!26332 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194340 () Bool)

(declare-fun e!678742 () Bool)

(assert (=> b!1194340 (= e!678741 e!678742)))

(declare-fun res!794674 () Bool)

(assert (=> b!1194340 (=> (not res!794674) (not e!678742))))

(assert (=> b!1194340 (= res!794674 (not e!678740))))

(declare-fun res!794672 () Bool)

(assert (=> b!1194340 (=> (not res!794672) (not e!678740))))

(assert (=> b!1194340 (= res!794672 (validKeyInArray!0 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194341 () Bool)

(assert (=> b!1194341 (= e!678742 e!678739)))

(declare-fun c!117289 () Bool)

(assert (=> b!1194341 (= c!117289 (validKeyInArray!0 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57115 () Bool)

(assert (=> bm!57115 (= call!57118 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117289 (Cons!26331 (select (arr!37258 _keys!1208) #b00000000000000000000000000000000) Nil!26332) Nil!26332)))))

(assert (= (and d!132113 (not res!794673)) b!1194340))

(assert (= (and b!1194340 res!794672) b!1194339))

(assert (= (and b!1194340 res!794674) b!1194341))

(assert (= (and b!1194341 c!117289) b!1194337))

(assert (= (and b!1194341 (not c!117289)) b!1194338))

(assert (= (or b!1194337 b!1194338) bm!57115))

(assert (=> b!1194339 m!1101749))

(assert (=> b!1194339 m!1101749))

(declare-fun m!1101761 () Bool)

(assert (=> b!1194339 m!1101761))

(assert (=> b!1194340 m!1101749))

(assert (=> b!1194340 m!1101749))

(assert (=> b!1194340 m!1101757))

(assert (=> b!1194341 m!1101749))

(assert (=> b!1194341 m!1101749))

(assert (=> b!1194341 m!1101757))

(assert (=> bm!57115 m!1101749))

(declare-fun m!1101763 () Bool)

(assert (=> bm!57115 m!1101763))

(assert (=> b!1194225 d!132113))

(declare-fun b!1194342 () Bool)

(declare-fun e!678743 () Bool)

(declare-fun call!57119 () Bool)

(assert (=> b!1194342 (= e!678743 call!57119)))

(declare-fun d!132115 () Bool)

(declare-fun res!794676 () Bool)

(declare-fun e!678745 () Bool)

(assert (=> d!132115 (=> res!794676 e!678745)))

(assert (=> d!132115 (= res!794676 (bvsge #b00000000000000000000000000000000 (size!37796 lt!542568)))))

(assert (=> d!132115 (= (arrayNoDuplicates!0 lt!542568 #b00000000000000000000000000000000 Nil!26332) e!678745)))

(declare-fun b!1194343 () Bool)

(assert (=> b!1194343 (= e!678743 call!57119)))

(declare-fun b!1194344 () Bool)

(declare-fun e!678744 () Bool)

(assert (=> b!1194344 (= e!678744 (contains!6841 Nil!26332 (select (arr!37258 lt!542568) #b00000000000000000000000000000000)))))

(declare-fun b!1194345 () Bool)

(declare-fun e!678746 () Bool)

(assert (=> b!1194345 (= e!678745 e!678746)))

(declare-fun res!794677 () Bool)

(assert (=> b!1194345 (=> (not res!794677) (not e!678746))))

(assert (=> b!1194345 (= res!794677 (not e!678744))))

(declare-fun res!794675 () Bool)

(assert (=> b!1194345 (=> (not res!794675) (not e!678744))))

(assert (=> b!1194345 (= res!794675 (validKeyInArray!0 (select (arr!37258 lt!542568) #b00000000000000000000000000000000)))))

(declare-fun b!1194346 () Bool)

(assert (=> b!1194346 (= e!678746 e!678743)))

(declare-fun c!117290 () Bool)

(assert (=> b!1194346 (= c!117290 (validKeyInArray!0 (select (arr!37258 lt!542568) #b00000000000000000000000000000000)))))

(declare-fun bm!57116 () Bool)

(assert (=> bm!57116 (= call!57119 (arrayNoDuplicates!0 lt!542568 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117290 (Cons!26331 (select (arr!37258 lt!542568) #b00000000000000000000000000000000) Nil!26332) Nil!26332)))))

(assert (= (and d!132115 (not res!794676)) b!1194345))

(assert (= (and b!1194345 res!794675) b!1194344))

(assert (= (and b!1194345 res!794677) b!1194346))

(assert (= (and b!1194346 c!117290) b!1194342))

(assert (= (and b!1194346 (not c!117290)) b!1194343))

(assert (= (or b!1194342 b!1194343) bm!57116))

(declare-fun m!1101765 () Bool)

(assert (=> b!1194344 m!1101765))

(assert (=> b!1194344 m!1101765))

(declare-fun m!1101767 () Bool)

(assert (=> b!1194344 m!1101767))

(assert (=> b!1194345 m!1101765))

(assert (=> b!1194345 m!1101765))

(declare-fun m!1101769 () Bool)

(assert (=> b!1194345 m!1101769))

(assert (=> b!1194346 m!1101765))

(assert (=> b!1194346 m!1101765))

(assert (=> b!1194346 m!1101769))

(assert (=> bm!57116 m!1101765))

(declare-fun m!1101771 () Bool)

(assert (=> bm!57116 m!1101771))

(assert (=> b!1194235 d!132115))

(declare-fun d!132117 () Bool)

(assert (=> d!132117 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1194230 d!132117))

(declare-fun b!1194347 () Bool)

(declare-fun e!678747 () Bool)

(declare-fun e!678748 () Bool)

(assert (=> b!1194347 (= e!678747 e!678748)))

(declare-fun lt!542586 () (_ BitVec 64))

(assert (=> b!1194347 (= lt!542586 (select (arr!37258 lt!542568) #b00000000000000000000000000000000))))

(declare-fun lt!542584 () Unit!39475)

(assert (=> b!1194347 (= lt!542584 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!542568 lt!542586 #b00000000000000000000000000000000))))

(assert (=> b!1194347 (arrayContainsKey!0 lt!542568 lt!542586 #b00000000000000000000000000000000)))

(declare-fun lt!542585 () Unit!39475)

(assert (=> b!1194347 (= lt!542585 lt!542584)))

(declare-fun res!794678 () Bool)

(assert (=> b!1194347 (= res!794678 (= (seekEntryOrOpen!0 (select (arr!37258 lt!542568) #b00000000000000000000000000000000) lt!542568 mask!1564) (Found!9927 #b00000000000000000000000000000000)))))

(assert (=> b!1194347 (=> (not res!794678) (not e!678748))))

(declare-fun b!1194348 () Bool)

(declare-fun call!57120 () Bool)

(assert (=> b!1194348 (= e!678748 call!57120)))

(declare-fun b!1194349 () Bool)

(assert (=> b!1194349 (= e!678747 call!57120)))

(declare-fun b!1194350 () Bool)

(declare-fun e!678749 () Bool)

(assert (=> b!1194350 (= e!678749 e!678747)))

(declare-fun c!117291 () Bool)

(assert (=> b!1194350 (= c!117291 (validKeyInArray!0 (select (arr!37258 lt!542568) #b00000000000000000000000000000000)))))

(declare-fun d!132119 () Bool)

(declare-fun res!794679 () Bool)

(assert (=> d!132119 (=> res!794679 e!678749)))

(assert (=> d!132119 (= res!794679 (bvsge #b00000000000000000000000000000000 (size!37796 lt!542568)))))

(assert (=> d!132119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542568 mask!1564) e!678749)))

(declare-fun bm!57117 () Bool)

(assert (=> bm!57117 (= call!57120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!542568 mask!1564))))

(assert (= (and d!132119 (not res!794679)) b!1194350))

(assert (= (and b!1194350 c!117291) b!1194347))

(assert (= (and b!1194350 (not c!117291)) b!1194349))

(assert (= (and b!1194347 res!794678) b!1194348))

(assert (= (or b!1194348 b!1194349) bm!57117))

(assert (=> b!1194347 m!1101765))

(declare-fun m!1101773 () Bool)

(assert (=> b!1194347 m!1101773))

(declare-fun m!1101775 () Bool)

(assert (=> b!1194347 m!1101775))

(assert (=> b!1194347 m!1101765))

(declare-fun m!1101777 () Bool)

(assert (=> b!1194347 m!1101777))

(assert (=> b!1194350 m!1101765))

(assert (=> b!1194350 m!1101765))

(assert (=> b!1194350 m!1101769))

(declare-fun m!1101779 () Bool)

(assert (=> bm!57117 m!1101779))

(assert (=> b!1194231 d!132119))

(declare-fun b!1194357 () Bool)

(declare-fun e!678754 () Bool)

(assert (=> b!1194357 (= e!678754 tp_is_empty!30253)))

(declare-fun mapIsEmpty!47216 () Bool)

(declare-fun mapRes!47216 () Bool)

(assert (=> mapIsEmpty!47216 mapRes!47216))

(declare-fun b!1194358 () Bool)

(declare-fun e!678755 () Bool)

(assert (=> b!1194358 (= e!678755 tp_is_empty!30253)))

(declare-fun condMapEmpty!47216 () Bool)

(declare-fun mapDefault!47216 () ValueCell!14417)

(assert (=> mapNonEmpty!47207 (= condMapEmpty!47216 (= mapRest!47207 ((as const (Array (_ BitVec 32) ValueCell!14417)) mapDefault!47216)))))

(assert (=> mapNonEmpty!47207 (= tp!89817 (and e!678755 mapRes!47216))))

(declare-fun mapNonEmpty!47216 () Bool)

(declare-fun tp!89826 () Bool)

(assert (=> mapNonEmpty!47216 (= mapRes!47216 (and tp!89826 e!678754))))

(declare-fun mapValue!47216 () ValueCell!14417)

(declare-fun mapKey!47216 () (_ BitVec 32))

(declare-fun mapRest!47216 () (Array (_ BitVec 32) ValueCell!14417))

(assert (=> mapNonEmpty!47216 (= mapRest!47207 (store mapRest!47216 mapKey!47216 mapValue!47216))))

(assert (= (and mapNonEmpty!47207 condMapEmpty!47216) mapIsEmpty!47216))

(assert (= (and mapNonEmpty!47207 (not condMapEmpty!47216)) mapNonEmpty!47216))

(assert (= (and mapNonEmpty!47216 ((_ is ValueCellFull!14417) mapValue!47216)) b!1194357))

(assert (= (and mapNonEmpty!47207 ((_ is ValueCellFull!14417) mapDefault!47216)) b!1194358))

(declare-fun m!1101781 () Bool)

(assert (=> mapNonEmpty!47216 m!1101781))

(check-sat (not mapNonEmpty!47216) (not b!1194347) (not b!1194344) (not b!1194350) (not b!1194340) (not b!1194345) (not bm!57116) (not b!1194346) tp_is_empty!30253 (not b!1194341) (not b!1194323) (not bm!57115) (not bm!57117) (not b!1194339) (not bm!57112) (not b!1194326))
(check-sat)
