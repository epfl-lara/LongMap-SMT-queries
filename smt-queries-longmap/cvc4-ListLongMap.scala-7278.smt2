; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92932 () Bool)

(assert start!92932)

(declare-fun b!1055102 () Bool)

(declare-fun e!599575 () Bool)

(declare-datatypes ((List!22319 0))(
  ( (Nil!22316) (Cons!22315 (h!23524 (_ BitVec 64)) (t!31626 List!22319)) )
))
(declare-fun noDuplicate!1547 (List!22319) Bool)

(assert (=> b!1055102 (= e!599575 (noDuplicate!1547 Nil!22316))))

(declare-fun b!1055103 () Bool)

(declare-fun res!704002 () Bool)

(declare-fun e!599577 () Bool)

(assert (=> b!1055103 (=> (not res!704002) (not e!599577))))

(declare-datatypes ((array!66553 0))(
  ( (array!66554 (arr!32007 (Array (_ BitVec 32) (_ BitVec 64))) (size!32543 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66553)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1055103 (= res!704002 (= (select (arr!32007 a!3488) i!1381) k!2747))))

(declare-fun b!1055105 () Bool)

(declare-fun e!599574 () Bool)

(assert (=> b!1055105 (= e!599574 e!599575)))

(declare-fun res!704005 () Bool)

(assert (=> b!1055105 (=> res!704005 e!599575)))

(assert (=> b!1055105 (= res!704005 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32543 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055105 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465674 () (_ BitVec 32))

(declare-datatypes ((Unit!34572 0))(
  ( (Unit!34573) )
))
(declare-fun lt!465675 () Unit!34572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66553 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34572)

(assert (=> b!1055105 (= lt!465675 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465674 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66553 (_ BitVec 32) List!22319) Bool)

(assert (=> b!1055105 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22316)))

(declare-fun lt!465673 () Unit!34572)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66553 (_ BitVec 32) (_ BitVec 32)) Unit!34572)

(assert (=> b!1055105 (= lt!465673 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055106 () Bool)

(declare-fun e!599571 () Bool)

(declare-fun e!599573 () Bool)

(assert (=> b!1055106 (= e!599571 e!599573)))

(declare-fun res!704004 () Bool)

(assert (=> b!1055106 (=> res!704004 e!599573)))

(assert (=> b!1055106 (= res!704004 (bvsle lt!465674 i!1381))))

(declare-fun b!1055107 () Bool)

(declare-fun res!704006 () Bool)

(assert (=> b!1055107 (=> (not res!704006) (not e!599577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055107 (= res!704006 (validKeyInArray!0 k!2747))))

(declare-fun b!1055108 () Bool)

(declare-fun res!704009 () Bool)

(assert (=> b!1055108 (=> (not res!704009) (not e!599577))))

(assert (=> b!1055108 (= res!704009 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22316))))

(declare-fun b!1055109 () Bool)

(declare-fun e!599578 () Bool)

(assert (=> b!1055109 (= e!599578 (not e!599574))))

(declare-fun res!704008 () Bool)

(assert (=> b!1055109 (=> res!704008 e!599574)))

(assert (=> b!1055109 (= res!704008 (bvsle lt!465674 i!1381))))

(assert (=> b!1055109 e!599571))

(declare-fun res!704007 () Bool)

(assert (=> b!1055109 (=> (not res!704007) (not e!599571))))

(assert (=> b!1055109 (= res!704007 (= (select (store (arr!32007 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465674) k!2747))))

(declare-fun b!1055110 () Bool)

(declare-fun e!599576 () Bool)

(assert (=> b!1055110 (= e!599577 e!599576)))

(declare-fun res!704001 () Bool)

(assert (=> b!1055110 (=> (not res!704001) (not e!599576))))

(declare-fun lt!465672 () array!66553)

(assert (=> b!1055110 (= res!704001 (arrayContainsKey!0 lt!465672 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055110 (= lt!465672 (array!66554 (store (arr!32007 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32543 a!3488)))))

(declare-fun b!1055111 () Bool)

(assert (=> b!1055111 (= e!599573 (arrayContainsKey!0 a!3488 k!2747 lt!465674))))

(declare-fun b!1055104 () Bool)

(assert (=> b!1055104 (= e!599576 e!599578)))

(declare-fun res!704003 () Bool)

(assert (=> b!1055104 (=> (not res!704003) (not e!599578))))

(assert (=> b!1055104 (= res!704003 (not (= lt!465674 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66553 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055104 (= lt!465674 (arrayScanForKey!0 lt!465672 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!704000 () Bool)

(assert (=> start!92932 (=> (not res!704000) (not e!599577))))

(assert (=> start!92932 (= res!704000 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32543 a!3488)) (bvslt (size!32543 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92932 e!599577))

(assert (=> start!92932 true))

(declare-fun array_inv!24787 (array!66553) Bool)

(assert (=> start!92932 (array_inv!24787 a!3488)))

(assert (= (and start!92932 res!704000) b!1055108))

(assert (= (and b!1055108 res!704009) b!1055107))

(assert (= (and b!1055107 res!704006) b!1055103))

(assert (= (and b!1055103 res!704002) b!1055110))

(assert (= (and b!1055110 res!704001) b!1055104))

(assert (= (and b!1055104 res!704003) b!1055109))

(assert (= (and b!1055109 res!704007) b!1055106))

(assert (= (and b!1055106 (not res!704004)) b!1055111))

(assert (= (and b!1055109 (not res!704008)) b!1055105))

(assert (= (and b!1055105 (not res!704005)) b!1055102))

(declare-fun m!975127 () Bool)

(assert (=> b!1055110 m!975127))

(declare-fun m!975129 () Bool)

(assert (=> b!1055110 m!975129))

(declare-fun m!975131 () Bool)

(assert (=> b!1055107 m!975131))

(declare-fun m!975133 () Bool)

(assert (=> b!1055111 m!975133))

(declare-fun m!975135 () Bool)

(assert (=> b!1055103 m!975135))

(declare-fun m!975137 () Bool)

(assert (=> b!1055102 m!975137))

(declare-fun m!975139 () Bool)

(assert (=> b!1055105 m!975139))

(declare-fun m!975141 () Bool)

(assert (=> b!1055105 m!975141))

(declare-fun m!975143 () Bool)

(assert (=> b!1055105 m!975143))

(declare-fun m!975145 () Bool)

(assert (=> b!1055105 m!975145))

(assert (=> b!1055109 m!975129))

(declare-fun m!975147 () Bool)

(assert (=> b!1055109 m!975147))

(declare-fun m!975149 () Bool)

(assert (=> b!1055108 m!975149))

(declare-fun m!975151 () Bool)

(assert (=> b!1055104 m!975151))

(declare-fun m!975153 () Bool)

(assert (=> start!92932 m!975153))

(push 1)

(assert (not b!1055107))

(assert (not b!1055110))

(assert (not b!1055102))

(assert (not b!1055111))

(assert (not b!1055105))

(assert (not start!92932))

(assert (not b!1055108))

(assert (not b!1055104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1055175 () Bool)

(declare-fun e!599632 () Bool)

(declare-fun e!599633 () Bool)

(assert (=> b!1055175 (= e!599632 e!599633)))

(declare-fun res!704054 () Bool)

(assert (=> b!1055175 (=> (not res!704054) (not e!599633))))

(declare-fun e!599635 () Bool)

(assert (=> b!1055175 (= res!704054 (not e!599635))))

(declare-fun res!704055 () Bool)

(assert (=> b!1055175 (=> (not res!704055) (not e!599635))))

(assert (=> b!1055175 (= res!704055 (validKeyInArray!0 (select (arr!32007 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055176 () Bool)

(declare-fun e!599634 () Bool)

(declare-fun call!44790 () Bool)

(assert (=> b!1055176 (= e!599634 call!44790)))

(declare-fun d!128093 () Bool)

(declare-fun res!704053 () Bool)

(assert (=> d!128093 (=> res!704053 e!599632)))

(assert (=> d!128093 (= res!704053 (bvsge #b00000000000000000000000000000000 (size!32543 a!3488)))))

(assert (=> d!128093 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22316) e!599632)))

(declare-fun b!1055177 () Bool)

(declare-fun contains!6178 (List!22319 (_ BitVec 64)) Bool)

(assert (=> b!1055177 (= e!599635 (contains!6178 Nil!22316 (select (arr!32007 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44787 () Bool)

(declare-fun c!107021 () Bool)

(assert (=> bm!44787 (= call!44790 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107021 (Cons!22315 (select (arr!32007 a!3488) #b00000000000000000000000000000000) Nil!22316) Nil!22316)))))

(declare-fun b!1055178 () Bool)

(assert (=> b!1055178 (= e!599634 call!44790)))

(declare-fun b!1055179 () Bool)

(assert (=> b!1055179 (= e!599633 e!599634)))

(assert (=> b!1055179 (= c!107021 (validKeyInArray!0 (select (arr!32007 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128093 (not res!704053)) b!1055175))

(assert (= (and b!1055175 res!704055) b!1055177))

(assert (= (and b!1055175 res!704054) b!1055179))

(assert (= (and b!1055179 c!107021) b!1055178))

(assert (= (and b!1055179 (not c!107021)) b!1055176))

(assert (= (or b!1055178 b!1055176) bm!44787))

(declare-fun m!975189 () Bool)

(assert (=> b!1055175 m!975189))

(assert (=> b!1055175 m!975189))

(declare-fun m!975191 () Bool)

(assert (=> b!1055175 m!975191))

(assert (=> b!1055177 m!975189))

(assert (=> b!1055177 m!975189))

(declare-fun m!975193 () Bool)

(assert (=> b!1055177 m!975193))

(assert (=> bm!44787 m!975189))

(declare-fun m!975195 () Bool)

(assert (=> bm!44787 m!975195))

(assert (=> b!1055179 m!975189))

(assert (=> b!1055179 m!975189))

(assert (=> b!1055179 m!975191))

(assert (=> b!1055108 d!128093))

(declare-fun d!128107 () Bool)

(declare-fun res!704066 () Bool)

(declare-fun e!599648 () Bool)

(assert (=> d!128107 (=> res!704066 e!599648)))

(assert (=> d!128107 (= res!704066 (is-Nil!22316 Nil!22316))))

(assert (=> d!128107 (= (noDuplicate!1547 Nil!22316) e!599648)))

(declare-fun b!1055194 () Bool)

(declare-fun e!599649 () Bool)

(assert (=> b!1055194 (= e!599648 e!599649)))

(declare-fun res!704067 () Bool)

(assert (=> b!1055194 (=> (not res!704067) (not e!599649))))

(assert (=> b!1055194 (= res!704067 (not (contains!6178 (t!31626 Nil!22316) (h!23524 Nil!22316))))))

(declare-fun b!1055195 () Bool)

(assert (=> b!1055195 (= e!599649 (noDuplicate!1547 (t!31626 Nil!22316)))))

(assert (= (and d!128107 (not res!704066)) b!1055194))

(assert (= (and b!1055194 res!704067) b!1055195))

(declare-fun m!975211 () Bool)

(assert (=> b!1055194 m!975211))

(declare-fun m!975213 () Bool)

(assert (=> b!1055195 m!975213))

(assert (=> b!1055102 d!128107))

(declare-fun d!128115 () Bool)

(declare-fun lt!465695 () (_ BitVec 32))

(assert (=> d!128115 (and (or (bvslt lt!465695 #b00000000000000000000000000000000) (bvsge lt!465695 (size!32543 lt!465672)) (and (bvsge lt!465695 #b00000000000000000000000000000000) (bvslt lt!465695 (size!32543 lt!465672)))) (bvsge lt!465695 #b00000000000000000000000000000000) (bvslt lt!465695 (size!32543 lt!465672)) (= (select (arr!32007 lt!465672) lt!465695) k!2747))))

(declare-fun e!599654 () (_ BitVec 32))

(assert (=> d!128115 (= lt!465695 e!599654)))

(declare-fun c!107028 () Bool)

(assert (=> d!128115 (= c!107028 (= (select (arr!32007 lt!465672) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32543 lt!465672)) (bvslt (size!32543 lt!465672) #b01111111111111111111111111111111))))

(assert (=> d!128115 (= (arrayScanForKey!0 lt!465672 k!2747 #b00000000000000000000000000000000) lt!465695)))

(declare-fun b!1055204 () Bool)

(assert (=> b!1055204 (= e!599654 #b00000000000000000000000000000000)))

(declare-fun b!1055205 () Bool)

(assert (=> b!1055205 (= e!599654 (arrayScanForKey!0 lt!465672 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128115 c!107028) b!1055204))

(assert (= (and d!128115 (not c!107028)) b!1055205))

(declare-fun m!975219 () Bool)

(assert (=> d!128115 m!975219))

(declare-fun m!975221 () Bool)

(assert (=> d!128115 m!975221))

(declare-fun m!975223 () Bool)

(assert (=> b!1055205 m!975223))

(assert (=> b!1055104 d!128115))

(declare-fun d!128119 () Bool)

(assert (=> d!128119 (= (array_inv!24787 a!3488) (bvsge (size!32543 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92932 d!128119))

(declare-fun d!128121 () Bool)

(declare-fun res!704079 () Bool)

(declare-fun e!599668 () Bool)

(assert (=> d!128121 (=> res!704079 e!599668)))

(assert (=> d!128121 (= res!704079 (= (select (arr!32007 a!3488) lt!465674) k!2747))))

(assert (=> d!128121 (= (arrayContainsKey!0 a!3488 k!2747 lt!465674) e!599668)))

(declare-fun b!1055221 () Bool)

(declare-fun e!599669 () Bool)

(assert (=> b!1055221 (= e!599668 e!599669)))

(declare-fun res!704080 () Bool)

(assert (=> b!1055221 (=> (not res!704080) (not e!599669))))

(assert (=> b!1055221 (= res!704080 (bvslt (bvadd lt!465674 #b00000000000000000000000000000001) (size!32543 a!3488)))))

(declare-fun b!1055222 () Bool)

(assert (=> b!1055222 (= e!599669 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465674 #b00000000000000000000000000000001)))))

