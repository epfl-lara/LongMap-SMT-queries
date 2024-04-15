; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92980 () Bool)

(assert start!92980)

(declare-fun b!1055111 () Bool)

(declare-fun e!599616 () Bool)

(declare-fun e!599611 () Bool)

(assert (=> b!1055111 (= e!599616 e!599611)))

(declare-fun res!704062 () Bool)

(assert (=> b!1055111 (=> (not res!704062) (not e!599611))))

(declare-fun lt!465514 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055111 (= res!704062 (not (= lt!465514 i!1381)))))

(declare-datatypes ((array!66497 0))(
  ( (array!66498 (arr!31977 (Array (_ BitVec 32) (_ BitVec 64))) (size!32515 (_ BitVec 32))) )
))
(declare-fun lt!465511 () array!66497)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66497 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055111 (= lt!465514 (arrayScanForKey!0 lt!465511 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055112 () Bool)

(declare-fun res!704054 () Bool)

(declare-fun e!599618 () Bool)

(assert (=> b!1055112 (=> (not res!704054) (not e!599618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055112 (= res!704054 (validKeyInArray!0 k0!2747))))

(declare-fun res!704056 () Bool)

(assert (=> start!92980 (=> (not res!704056) (not e!599618))))

(declare-fun a!3488 () array!66497)

(assert (=> start!92980 (= res!704056 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32515 a!3488)) (bvslt (size!32515 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92980 e!599618))

(assert (=> start!92980 true))

(declare-fun array_inv!24760 (array!66497) Bool)

(assert (=> start!92980 (array_inv!24760 a!3488)))

(declare-fun b!1055113 () Bool)

(declare-fun res!704055 () Bool)

(declare-fun e!599613 () Bool)

(assert (=> b!1055113 (=> res!704055 e!599613)))

(declare-datatypes ((List!22348 0))(
  ( (Nil!22345) (Cons!22344 (h!23553 (_ BitVec 64)) (t!31646 List!22348)) )
))
(declare-fun noDuplicate!1561 (List!22348) Bool)

(assert (=> b!1055113 (= res!704055 (not (noDuplicate!1561 Nil!22345)))))

(declare-fun b!1055114 () Bool)

(declare-fun e!599612 () Bool)

(assert (=> b!1055114 (= e!599611 (not e!599612))))

(declare-fun res!704057 () Bool)

(assert (=> b!1055114 (=> res!704057 e!599612)))

(assert (=> b!1055114 (= res!704057 (bvsle lt!465514 i!1381))))

(declare-fun e!599617 () Bool)

(assert (=> b!1055114 e!599617))

(declare-fun res!704051 () Bool)

(assert (=> b!1055114 (=> (not res!704051) (not e!599617))))

(assert (=> b!1055114 (= res!704051 (= (select (store (arr!31977 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465514) k0!2747))))

(declare-fun b!1055115 () Bool)

(declare-fun res!704053 () Bool)

(assert (=> b!1055115 (=> (not res!704053) (not e!599618))))

(declare-fun arrayNoDuplicates!0 (array!66497 (_ BitVec 32) List!22348) Bool)

(assert (=> b!1055115 (= res!704053 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22345))))

(declare-fun b!1055116 () Bool)

(declare-fun e!599615 () Bool)

(declare-fun contains!6151 (List!22348 (_ BitVec 64)) Bool)

(assert (=> b!1055116 (= e!599615 (not (contains!6151 Nil!22345 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055117 () Bool)

(assert (=> b!1055117 (= e!599612 e!599613)))

(declare-fun res!704059 () Bool)

(assert (=> b!1055117 (=> res!704059 e!599613)))

(assert (=> b!1055117 (= res!704059 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32515 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055117 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34445 0))(
  ( (Unit!34446) )
))
(declare-fun lt!465512 () Unit!34445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34445)

(assert (=> b!1055117 (= lt!465512 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465514 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055117 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22345)))

(declare-fun lt!465513 () Unit!34445)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66497 (_ BitVec 32) (_ BitVec 32)) Unit!34445)

(assert (=> b!1055117 (= lt!465513 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055118 () Bool)

(assert (=> b!1055118 (= e!599618 e!599616)))

(declare-fun res!704058 () Bool)

(assert (=> b!1055118 (=> (not res!704058) (not e!599616))))

(assert (=> b!1055118 (= res!704058 (arrayContainsKey!0 lt!465511 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055118 (= lt!465511 (array!66498 (store (arr!31977 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32515 a!3488)))))

(declare-fun b!1055119 () Bool)

(assert (=> b!1055119 (= e!599613 e!599615)))

(declare-fun res!704060 () Bool)

(assert (=> b!1055119 (=> (not res!704060) (not e!599615))))

(assert (=> b!1055119 (= res!704060 (not (contains!6151 Nil!22345 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055120 () Bool)

(declare-fun e!599614 () Bool)

(assert (=> b!1055120 (= e!599617 e!599614)))

(declare-fun res!704061 () Bool)

(assert (=> b!1055120 (=> res!704061 e!599614)))

(assert (=> b!1055120 (= res!704061 (bvsle lt!465514 i!1381))))

(declare-fun b!1055121 () Bool)

(declare-fun res!704052 () Bool)

(assert (=> b!1055121 (=> (not res!704052) (not e!599618))))

(assert (=> b!1055121 (= res!704052 (= (select (arr!31977 a!3488) i!1381) k0!2747))))

(declare-fun b!1055122 () Bool)

(assert (=> b!1055122 (= e!599614 (arrayContainsKey!0 a!3488 k0!2747 lt!465514))))

(assert (= (and start!92980 res!704056) b!1055115))

(assert (= (and b!1055115 res!704053) b!1055112))

(assert (= (and b!1055112 res!704054) b!1055121))

(assert (= (and b!1055121 res!704052) b!1055118))

(assert (= (and b!1055118 res!704058) b!1055111))

(assert (= (and b!1055111 res!704062) b!1055114))

(assert (= (and b!1055114 res!704051) b!1055120))

(assert (= (and b!1055120 (not res!704061)) b!1055122))

(assert (= (and b!1055114 (not res!704057)) b!1055117))

(assert (= (and b!1055117 (not res!704059)) b!1055113))

(assert (= (and b!1055113 (not res!704055)) b!1055119))

(assert (= (and b!1055119 res!704060) b!1055116))

(declare-fun m!974653 () Bool)

(assert (=> b!1055116 m!974653))

(declare-fun m!974655 () Bool)

(assert (=> b!1055121 m!974655))

(declare-fun m!974657 () Bool)

(assert (=> b!1055114 m!974657))

(declare-fun m!974659 () Bool)

(assert (=> b!1055114 m!974659))

(declare-fun m!974661 () Bool)

(assert (=> b!1055122 m!974661))

(declare-fun m!974663 () Bool)

(assert (=> b!1055115 m!974663))

(declare-fun m!974665 () Bool)

(assert (=> b!1055113 m!974665))

(declare-fun m!974667 () Bool)

(assert (=> b!1055111 m!974667))

(declare-fun m!974669 () Bool)

(assert (=> b!1055119 m!974669))

(declare-fun m!974671 () Bool)

(assert (=> b!1055118 m!974671))

(assert (=> b!1055118 m!974657))

(declare-fun m!974673 () Bool)

(assert (=> b!1055112 m!974673))

(declare-fun m!974675 () Bool)

(assert (=> b!1055117 m!974675))

(declare-fun m!974677 () Bool)

(assert (=> b!1055117 m!974677))

(declare-fun m!974679 () Bool)

(assert (=> b!1055117 m!974679))

(declare-fun m!974681 () Bool)

(assert (=> b!1055117 m!974681))

(declare-fun m!974683 () Bool)

(assert (=> start!92980 m!974683))

(check-sat (not b!1055119) (not b!1055118) (not b!1055111) (not b!1055122) (not b!1055116) (not b!1055113) (not b!1055112) (not b!1055115) (not start!92980) (not b!1055117))
(check-sat)
(get-model)

(declare-fun d!127999 () Bool)

(declare-fun res!704139 () Bool)

(declare-fun e!599678 () Bool)

(assert (=> d!127999 (=> res!704139 e!599678)))

(assert (=> d!127999 (= res!704139 (= (select (arr!31977 lt!465511) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127999 (= (arrayContainsKey!0 lt!465511 k0!2747 #b00000000000000000000000000000000) e!599678)))

(declare-fun b!1055199 () Bool)

(declare-fun e!599679 () Bool)

(assert (=> b!1055199 (= e!599678 e!599679)))

(declare-fun res!704140 () Bool)

(assert (=> b!1055199 (=> (not res!704140) (not e!599679))))

(assert (=> b!1055199 (= res!704140 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32515 lt!465511)))))

(declare-fun b!1055200 () Bool)

(assert (=> b!1055200 (= e!599679 (arrayContainsKey!0 lt!465511 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127999 (not res!704139)) b!1055199))

(assert (= (and b!1055199 res!704140) b!1055200))

(declare-fun m!974749 () Bool)

(assert (=> d!127999 m!974749))

(declare-fun m!974751 () Bool)

(assert (=> b!1055200 m!974751))

(assert (=> b!1055118 d!127999))

(declare-fun d!128001 () Bool)

(declare-fun res!704145 () Bool)

(declare-fun e!599684 () Bool)

(assert (=> d!128001 (=> res!704145 e!599684)))

(get-info :version)

(assert (=> d!128001 (= res!704145 ((_ is Nil!22345) Nil!22345))))

(assert (=> d!128001 (= (noDuplicate!1561 Nil!22345) e!599684)))

(declare-fun b!1055205 () Bool)

(declare-fun e!599685 () Bool)

(assert (=> b!1055205 (= e!599684 e!599685)))

(declare-fun res!704146 () Bool)

(assert (=> b!1055205 (=> (not res!704146) (not e!599685))))

(assert (=> b!1055205 (= res!704146 (not (contains!6151 (t!31646 Nil!22345) (h!23553 Nil!22345))))))

(declare-fun b!1055206 () Bool)

(assert (=> b!1055206 (= e!599685 (noDuplicate!1561 (t!31646 Nil!22345)))))

(assert (= (and d!128001 (not res!704145)) b!1055205))

(assert (= (and b!1055205 res!704146) b!1055206))

(declare-fun m!974753 () Bool)

(assert (=> b!1055205 m!974753))

(declare-fun m!974755 () Bool)

(assert (=> b!1055206 m!974755))

(assert (=> b!1055113 d!128001))

(declare-fun d!128003 () Bool)

(assert (=> d!128003 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055112 d!128003))

(declare-fun d!128005 () Bool)

(assert (=> d!128005 (= (array_inv!24760 a!3488) (bvsge (size!32515 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92980 d!128005))

(declare-fun d!128007 () Bool)

(declare-fun lt!465541 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!529 (List!22348) (InoxSet (_ BitVec 64)))

(assert (=> d!128007 (= lt!465541 (select (content!529 Nil!22345) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!599691 () Bool)

(assert (=> d!128007 (= lt!465541 e!599691)))

(declare-fun res!704152 () Bool)

(assert (=> d!128007 (=> (not res!704152) (not e!599691))))

(assert (=> d!128007 (= res!704152 ((_ is Cons!22344) Nil!22345))))

(assert (=> d!128007 (= (contains!6151 Nil!22345 #b0000000000000000000000000000000000000000000000000000000000000000) lt!465541)))

(declare-fun b!1055211 () Bool)

(declare-fun e!599690 () Bool)

(assert (=> b!1055211 (= e!599691 e!599690)))

(declare-fun res!704151 () Bool)

(assert (=> b!1055211 (=> res!704151 e!599690)))

(assert (=> b!1055211 (= res!704151 (= (h!23553 Nil!22345) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055212 () Bool)

(assert (=> b!1055212 (= e!599690 (contains!6151 (t!31646 Nil!22345) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128007 res!704152) b!1055211))

(assert (= (and b!1055211 (not res!704151)) b!1055212))

(declare-fun m!974757 () Bool)

(assert (=> d!128007 m!974757))

(declare-fun m!974759 () Bool)

(assert (=> d!128007 m!974759))

(declare-fun m!974761 () Bool)

(assert (=> b!1055212 m!974761))

(assert (=> b!1055119 d!128007))

(declare-fun b!1055229 () Bool)

(declare-fun e!599708 () Bool)

(declare-fun e!599706 () Bool)

(assert (=> b!1055229 (= e!599708 e!599706)))

(declare-fun res!704166 () Bool)

(assert (=> b!1055229 (=> (not res!704166) (not e!599706))))

(declare-fun e!599709 () Bool)

(assert (=> b!1055229 (= res!704166 (not e!599709))))

(declare-fun res!704167 () Bool)

(assert (=> b!1055229 (=> (not res!704167) (not e!599709))))

(assert (=> b!1055229 (= res!704167 (validKeyInArray!0 (select (arr!31977 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055230 () Bool)

(declare-fun e!599707 () Bool)

(assert (=> b!1055230 (= e!599706 e!599707)))

(declare-fun c!106995 () Bool)

(assert (=> b!1055230 (= c!106995 (validKeyInArray!0 (select (arr!31977 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44771 () Bool)

(declare-fun call!44774 () Bool)

(assert (=> bm!44771 (= call!44774 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106995 (Cons!22344 (select (arr!31977 a!3488) #b00000000000000000000000000000000) Nil!22345) Nil!22345)))))

(declare-fun b!1055231 () Bool)

(assert (=> b!1055231 (= e!599709 (contains!6151 Nil!22345 (select (arr!31977 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055232 () Bool)

(assert (=> b!1055232 (= e!599707 call!44774)))

(declare-fun b!1055233 () Bool)

(assert (=> b!1055233 (= e!599707 call!44774)))

(declare-fun d!128011 () Bool)

(declare-fun res!704165 () Bool)

(assert (=> d!128011 (=> res!704165 e!599708)))

(assert (=> d!128011 (= res!704165 (bvsge #b00000000000000000000000000000000 (size!32515 a!3488)))))

(assert (=> d!128011 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22345) e!599708)))

(assert (= (and d!128011 (not res!704165)) b!1055229))

(assert (= (and b!1055229 res!704167) b!1055231))

(assert (= (and b!1055229 res!704166) b!1055230))

(assert (= (and b!1055230 c!106995) b!1055233))

(assert (= (and b!1055230 (not c!106995)) b!1055232))

(assert (= (or b!1055233 b!1055232) bm!44771))

(declare-fun m!974769 () Bool)

(assert (=> b!1055229 m!974769))

(assert (=> b!1055229 m!974769))

(declare-fun m!974771 () Bool)

(assert (=> b!1055229 m!974771))

(assert (=> b!1055230 m!974769))

(assert (=> b!1055230 m!974769))

(assert (=> b!1055230 m!974771))

(assert (=> bm!44771 m!974769))

(declare-fun m!974773 () Bool)

(assert (=> bm!44771 m!974773))

(assert (=> b!1055231 m!974769))

(assert (=> b!1055231 m!974769))

(declare-fun m!974775 () Bool)

(assert (=> b!1055231 m!974775))

(assert (=> b!1055115 d!128011))

(declare-fun d!128017 () Bool)

(declare-fun res!704168 () Bool)

(declare-fun e!599710 () Bool)

(assert (=> d!128017 (=> res!704168 e!599710)))

(assert (=> d!128017 (= res!704168 (= (select (arr!31977 a!3488) lt!465514) k0!2747))))

(assert (=> d!128017 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465514) e!599710)))

(declare-fun b!1055234 () Bool)

(declare-fun e!599711 () Bool)

(assert (=> b!1055234 (= e!599710 e!599711)))

(declare-fun res!704169 () Bool)

(assert (=> b!1055234 (=> (not res!704169) (not e!599711))))

(assert (=> b!1055234 (= res!704169 (bvslt (bvadd lt!465514 #b00000000000000000000000000000001) (size!32515 a!3488)))))

(declare-fun b!1055235 () Bool)

(assert (=> b!1055235 (= e!599711 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465514 #b00000000000000000000000000000001)))))

(assert (= (and d!128017 (not res!704168)) b!1055234))

(assert (= (and b!1055234 res!704169) b!1055235))

(declare-fun m!974777 () Bool)

(assert (=> d!128017 m!974777))

(declare-fun m!974779 () Bool)

(assert (=> b!1055235 m!974779))

(assert (=> b!1055122 d!128017))

(declare-fun d!128019 () Bool)

(declare-fun res!704170 () Bool)

(declare-fun e!599712 () Bool)

(assert (=> d!128019 (=> res!704170 e!599712)))

(assert (=> d!128019 (= res!704170 (= (select (arr!31977 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!128019 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599712)))

(declare-fun b!1055236 () Bool)

(declare-fun e!599713 () Bool)

(assert (=> b!1055236 (= e!599712 e!599713)))

(declare-fun res!704171 () Bool)

(assert (=> b!1055236 (=> (not res!704171) (not e!599713))))

(assert (=> b!1055236 (= res!704171 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32515 a!3488)))))

(declare-fun b!1055237 () Bool)

(assert (=> b!1055237 (= e!599713 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128019 (not res!704170)) b!1055236))

(assert (= (and b!1055236 res!704171) b!1055237))

(declare-fun m!974781 () Bool)

(assert (=> d!128019 m!974781))

(declare-fun m!974783 () Bool)

(assert (=> b!1055237 m!974783))

(assert (=> b!1055117 d!128019))

(declare-fun d!128021 () Bool)

(assert (=> d!128021 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465547 () Unit!34445)

(declare-fun choose!114 (array!66497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34445)

(assert (=> d!128021 (= lt!465547 (choose!114 a!3488 k0!2747 lt!465514 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128021 (bvsge lt!465514 #b00000000000000000000000000000000)))

(assert (=> d!128021 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465514 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465547)))

(declare-fun bs!30906 () Bool)

(assert (= bs!30906 d!128021))

(assert (=> bs!30906 m!974675))

(declare-fun m!974785 () Bool)

(assert (=> bs!30906 m!974785))

(assert (=> b!1055117 d!128021))

(declare-fun b!1055240 () Bool)

(declare-fun e!599723 () Bool)

(declare-fun e!599718 () Bool)

(assert (=> b!1055240 (= e!599723 e!599718)))

(declare-fun res!704177 () Bool)

(assert (=> b!1055240 (=> (not res!704177) (not e!599718))))

(declare-fun e!599725 () Bool)

(assert (=> b!1055240 (= res!704177 (not e!599725))))

(declare-fun res!704179 () Bool)

(assert (=> b!1055240 (=> (not res!704179) (not e!599725))))

(assert (=> b!1055240 (= res!704179 (validKeyInArray!0 (select (arr!31977 a!3488) i!1381)))))

(declare-fun b!1055241 () Bool)

(declare-fun e!599721 () Bool)

(assert (=> b!1055241 (= e!599718 e!599721)))

(declare-fun c!106996 () Bool)

(assert (=> b!1055241 (= c!106996 (validKeyInArray!0 (select (arr!31977 a!3488) i!1381)))))

(declare-fun bm!44772 () Bool)

(declare-fun call!44775 () Bool)

(assert (=> bm!44772 (= call!44775 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106996 (Cons!22344 (select (arr!31977 a!3488) i!1381) Nil!22345) Nil!22345)))))

(declare-fun b!1055242 () Bool)

(assert (=> b!1055242 (= e!599725 (contains!6151 Nil!22345 (select (arr!31977 a!3488) i!1381)))))

(declare-fun b!1055243 () Bool)

(assert (=> b!1055243 (= e!599721 call!44775)))

(declare-fun b!1055244 () Bool)

(assert (=> b!1055244 (= e!599721 call!44775)))

(declare-fun d!128025 () Bool)

(declare-fun res!704176 () Bool)

(assert (=> d!128025 (=> res!704176 e!599723)))

(assert (=> d!128025 (= res!704176 (bvsge i!1381 (size!32515 a!3488)))))

(assert (=> d!128025 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22345) e!599723)))

(assert (= (and d!128025 (not res!704176)) b!1055240))

(assert (= (and b!1055240 res!704179) b!1055242))

(assert (= (and b!1055240 res!704177) b!1055241))

(assert (= (and b!1055241 c!106996) b!1055244))

(assert (= (and b!1055241 (not c!106996)) b!1055243))

(assert (= (or b!1055244 b!1055243) bm!44772))

(assert (=> b!1055240 m!974655))

(assert (=> b!1055240 m!974655))

(declare-fun m!974787 () Bool)

(assert (=> b!1055240 m!974787))

(assert (=> b!1055241 m!974655))

(assert (=> b!1055241 m!974655))

(assert (=> b!1055241 m!974787))

(assert (=> bm!44772 m!974655))

(declare-fun m!974789 () Bool)

(assert (=> bm!44772 m!974789))

(assert (=> b!1055242 m!974655))

(assert (=> b!1055242 m!974655))

(declare-fun m!974791 () Bool)

(assert (=> b!1055242 m!974791))

(assert (=> b!1055117 d!128025))

(declare-fun d!128027 () Bool)

(assert (=> d!128027 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22345)))

(declare-fun lt!465550 () Unit!34445)

(declare-fun choose!39 (array!66497 (_ BitVec 32) (_ BitVec 32)) Unit!34445)

(assert (=> d!128027 (= lt!465550 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128027 (bvslt (size!32515 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128027 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465550)))

(declare-fun bs!30907 () Bool)

(assert (= bs!30907 d!128027))

(assert (=> bs!30907 m!974679))

(declare-fun m!974797 () Bool)

(assert (=> bs!30907 m!974797))

(assert (=> b!1055117 d!128027))

(declare-fun d!128033 () Bool)

(declare-fun lt!465551 () Bool)

(assert (=> d!128033 (= lt!465551 (select (content!529 Nil!22345) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!599735 () Bool)

(assert (=> d!128033 (= lt!465551 e!599735)))

(declare-fun res!704190 () Bool)

(assert (=> d!128033 (=> (not res!704190) (not e!599735))))

(assert (=> d!128033 (= res!704190 ((_ is Cons!22344) Nil!22345))))

(assert (=> d!128033 (= (contains!6151 Nil!22345 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465551)))

(declare-fun b!1055261 () Bool)

(declare-fun e!599734 () Bool)

(assert (=> b!1055261 (= e!599735 e!599734)))

(declare-fun res!704189 () Bool)

(assert (=> b!1055261 (=> res!704189 e!599734)))

(assert (=> b!1055261 (= res!704189 (= (h!23553 Nil!22345) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055262 () Bool)

(assert (=> b!1055262 (= e!599734 (contains!6151 (t!31646 Nil!22345) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128033 res!704190) b!1055261))

(assert (= (and b!1055261 (not res!704189)) b!1055262))

(assert (=> d!128033 m!974757))

(declare-fun m!974801 () Bool)

(assert (=> d!128033 m!974801))

(declare-fun m!974803 () Bool)

(assert (=> b!1055262 m!974803))

(assert (=> b!1055116 d!128033))

(declare-fun d!128035 () Bool)

(declare-fun lt!465560 () (_ BitVec 32))

(assert (=> d!128035 (and (or (bvslt lt!465560 #b00000000000000000000000000000000) (bvsge lt!465560 (size!32515 lt!465511)) (and (bvsge lt!465560 #b00000000000000000000000000000000) (bvslt lt!465560 (size!32515 lt!465511)))) (bvsge lt!465560 #b00000000000000000000000000000000) (bvslt lt!465560 (size!32515 lt!465511)) (= (select (arr!31977 lt!465511) lt!465560) k0!2747))))

(declare-fun e!599748 () (_ BitVec 32))

(assert (=> d!128035 (= lt!465560 e!599748)))

(declare-fun c!107002 () Bool)

(assert (=> d!128035 (= c!107002 (= (select (arr!31977 lt!465511) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32515 lt!465511)) (bvslt (size!32515 lt!465511) #b01111111111111111111111111111111))))

(assert (=> d!128035 (= (arrayScanForKey!0 lt!465511 k0!2747 #b00000000000000000000000000000000) lt!465560)))

(declare-fun b!1055278 () Bool)

(assert (=> b!1055278 (= e!599748 #b00000000000000000000000000000000)))

(declare-fun b!1055279 () Bool)

(assert (=> b!1055279 (= e!599748 (arrayScanForKey!0 lt!465511 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128035 c!107002) b!1055278))

(assert (= (and d!128035 (not c!107002)) b!1055279))

(declare-fun m!974821 () Bool)

(assert (=> d!128035 m!974821))

(assert (=> d!128035 m!974749))

(declare-fun m!974823 () Bool)

(assert (=> b!1055279 m!974823))

(assert (=> b!1055111 d!128035))

(check-sat (not b!1055206) (not b!1055231) (not b!1055205) (not b!1055200) (not b!1055229) (not b!1055242) (not bm!44772) (not b!1055235) (not b!1055230) (not d!128027) (not b!1055279) (not b!1055240) (not b!1055237) (not d!128033) (not d!128021) (not b!1055212) (not bm!44771) (not d!128007) (not b!1055241) (not b!1055262))
(check-sat)
