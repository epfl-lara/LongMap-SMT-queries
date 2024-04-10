; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60218 () Bool)

(assert start!60218)

(declare-fun b!674136 () Bool)

(declare-fun e!384863 () Bool)

(declare-fun e!384860 () Bool)

(assert (=> b!674136 (= e!384863 e!384860)))

(declare-fun res!440654 () Bool)

(assert (=> b!674136 (=> (not res!440654) (not e!384860))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!674136 (= res!440654 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12866 0))(
  ( (Nil!12863) (Cons!12862 (h!13907 (_ BitVec 64)) (t!19094 List!12866)) )
))
(declare-fun lt!312574 () List!12866)

(declare-datatypes ((array!39265 0))(
  ( (array!39266 (arr!18825 (Array (_ BitVec 32) (_ BitVec 64))) (size!19189 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39265)

(declare-fun acc!681 () List!12866)

(declare-fun $colon$colon!293 (List!12866 (_ BitVec 64)) List!12866)

(assert (=> b!674136 (= lt!312574 ($colon$colon!293 acc!681 (select (arr!18825 a!3626) from!3004)))))

(declare-fun b!674137 () Bool)

(declare-fun res!440648 () Bool)

(assert (=> b!674137 (=> (not res!440648) (not e!384860))))

(declare-fun e!384858 () Bool)

(assert (=> b!674137 (= res!440648 e!384858)))

(declare-fun res!440650 () Bool)

(assert (=> b!674137 (=> res!440650 e!384858)))

(declare-fun e!384866 () Bool)

(assert (=> b!674137 (= res!440650 e!384866)))

(declare-fun res!440653 () Bool)

(assert (=> b!674137 (=> (not res!440653) (not e!384866))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674137 (= res!440653 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674138 () Bool)

(declare-fun res!440637 () Bool)

(declare-fun e!384864 () Bool)

(assert (=> b!674138 (=> (not res!440637) (not e!384864))))

(declare-fun contains!3443 (List!12866 (_ BitVec 64)) Bool)

(assert (=> b!674138 (= res!440637 (not (contains!3443 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674139 () Bool)

(declare-fun res!440631 () Bool)

(assert (=> b!674139 (=> (not res!440631) (not e!384864))))

(assert (=> b!674139 (= res!440631 (not (contains!3443 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674140 () Bool)

(assert (=> b!674140 (= e!384860 (not (bvsle from!3004 (size!19189 a!3626))))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayNoDuplicates!0 (array!39265 (_ BitVec 32) List!12866) Bool)

(assert (=> b!674140 (arrayNoDuplicates!0 (array!39266 (store (arr!18825 a!3626) i!1382 k!2843) (size!19189 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312574)))

(declare-datatypes ((Unit!23712 0))(
  ( (Unit!23713) )
))
(declare-fun lt!312571 () Unit!23712)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39265 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12866) Unit!23712)

(assert (=> b!674140 (= lt!312571 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312574))))

(declare-fun b!674142 () Bool)

(declare-fun res!440636 () Bool)

(assert (=> b!674142 (=> (not res!440636) (not e!384864))))

(declare-fun noDuplicate!690 (List!12866) Bool)

(assert (=> b!674142 (= res!440636 (noDuplicate!690 acc!681))))

(declare-fun b!674143 () Bool)

(declare-fun e!384859 () Bool)

(assert (=> b!674143 (= e!384858 e!384859)))

(declare-fun res!440652 () Bool)

(assert (=> b!674143 (=> (not res!440652) (not e!384859))))

(assert (=> b!674143 (= res!440652 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674144 () Bool)

(declare-fun e!384861 () Bool)

(assert (=> b!674144 (= e!384861 (not (contains!3443 acc!681 k!2843)))))

(declare-fun b!674145 () Bool)

(declare-fun res!440630 () Bool)

(assert (=> b!674145 (=> (not res!440630) (not e!384860))))

(assert (=> b!674145 (= res!440630 (not (contains!3443 lt!312574 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674146 () Bool)

(declare-fun res!440643 () Bool)

(assert (=> b!674146 (=> (not res!440643) (not e!384860))))

(assert (=> b!674146 (= res!440643 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312574))))

(declare-fun b!674147 () Bool)

(declare-fun res!440651 () Bool)

(assert (=> b!674147 (=> (not res!440651) (not e!384864))))

(assert (=> b!674147 (= res!440651 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19189 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674148 () Bool)

(assert (=> b!674148 (= e!384864 e!384863)))

(declare-fun res!440635 () Bool)

(assert (=> b!674148 (=> (not res!440635) (not e!384863))))

(assert (=> b!674148 (= res!440635 (not (= (select (arr!18825 a!3626) from!3004) k!2843)))))

(declare-fun lt!312572 () Unit!23712)

(declare-fun e!384862 () Unit!23712)

(assert (=> b!674148 (= lt!312572 e!384862)))

(declare-fun c!77120 () Bool)

(assert (=> b!674148 (= c!77120 (= (select (arr!18825 a!3626) from!3004) k!2843))))

(declare-fun b!674149 () Bool)

(assert (=> b!674149 (= e!384866 (contains!3443 lt!312574 k!2843))))

(declare-fun b!674150 () Bool)

(declare-fun res!440644 () Bool)

(assert (=> b!674150 (=> (not res!440644) (not e!384864))))

(assert (=> b!674150 (= res!440644 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674151 () Bool)

(declare-fun res!440634 () Bool)

(assert (=> b!674151 (=> (not res!440634) (not e!384860))))

(assert (=> b!674151 (= res!440634 (not (contains!3443 lt!312574 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!440641 () Bool)

(assert (=> start!60218 (=> (not res!440641) (not e!384864))))

(assert (=> start!60218 (= res!440641 (and (bvslt (size!19189 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19189 a!3626))))))

(assert (=> start!60218 e!384864))

(assert (=> start!60218 true))

(declare-fun array_inv!14621 (array!39265) Bool)

(assert (=> start!60218 (array_inv!14621 a!3626)))

(declare-fun b!674141 () Bool)

(declare-fun res!440646 () Bool)

(assert (=> b!674141 (=> (not res!440646) (not e!384864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674141 (= res!440646 (validKeyInArray!0 k!2843))))

(declare-fun b!674152 () Bool)

(declare-fun Unit!23714 () Unit!23712)

(assert (=> b!674152 (= e!384862 Unit!23714)))

(declare-fun b!674153 () Bool)

(declare-fun res!440649 () Bool)

(assert (=> b!674153 (=> (not res!440649) (not e!384860))))

(assert (=> b!674153 (= res!440649 (noDuplicate!690 lt!312574))))

(declare-fun b!674154 () Bool)

(declare-fun res!440639 () Bool)

(assert (=> b!674154 (=> (not res!440639) (not e!384864))))

(declare-fun arrayContainsKey!0 (array!39265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674154 (= res!440639 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674155 () Bool)

(declare-fun res!440638 () Bool)

(assert (=> b!674155 (=> (not res!440638) (not e!384864))))

(declare-fun e!384865 () Bool)

(assert (=> b!674155 (= res!440638 e!384865)))

(declare-fun res!440647 () Bool)

(assert (=> b!674155 (=> res!440647 e!384865)))

(declare-fun e!384857 () Bool)

(assert (=> b!674155 (= res!440647 e!384857)))

(declare-fun res!440642 () Bool)

(assert (=> b!674155 (=> (not res!440642) (not e!384857))))

(assert (=> b!674155 (= res!440642 (bvsgt from!3004 i!1382))))

(declare-fun b!674156 () Bool)

(declare-fun res!440645 () Bool)

(assert (=> b!674156 (=> (not res!440645) (not e!384864))))

(assert (=> b!674156 (= res!440645 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12863))))

(declare-fun b!674157 () Bool)

(assert (=> b!674157 (= e!384859 (not (contains!3443 lt!312574 k!2843)))))

(declare-fun b!674158 () Bool)

(declare-fun res!440633 () Bool)

(assert (=> b!674158 (=> (not res!440633) (not e!384864))))

(assert (=> b!674158 (= res!440633 (validKeyInArray!0 (select (arr!18825 a!3626) from!3004)))))

(declare-fun b!674159 () Bool)

(assert (=> b!674159 (= e!384857 (contains!3443 acc!681 k!2843))))

(declare-fun b!674160 () Bool)

(declare-fun res!440632 () Bool)

(assert (=> b!674160 (=> (not res!440632) (not e!384864))))

(assert (=> b!674160 (= res!440632 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19189 a!3626))))))

(declare-fun b!674161 () Bool)

(assert (=> b!674161 (= e!384865 e!384861)))

(declare-fun res!440640 () Bool)

(assert (=> b!674161 (=> (not res!440640) (not e!384861))))

(assert (=> b!674161 (= res!440640 (bvsle from!3004 i!1382))))

(declare-fun b!674162 () Bool)

(declare-fun Unit!23715 () Unit!23712)

(assert (=> b!674162 (= e!384862 Unit!23715)))

(assert (=> b!674162 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312573 () Unit!23712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39265 (_ BitVec 64) (_ BitVec 32)) Unit!23712)

(assert (=> b!674162 (= lt!312573 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674162 false))

(assert (= (and start!60218 res!440641) b!674142))

(assert (= (and b!674142 res!440636) b!674139))

(assert (= (and b!674139 res!440631) b!674138))

(assert (= (and b!674138 res!440637) b!674155))

(assert (= (and b!674155 res!440642) b!674159))

(assert (= (and b!674155 (not res!440647)) b!674161))

(assert (= (and b!674161 res!440640) b!674144))

(assert (= (and b!674155 res!440638) b!674156))

(assert (= (and b!674156 res!440645) b!674150))

(assert (= (and b!674150 res!440644) b!674160))

(assert (= (and b!674160 res!440632) b!674141))

(assert (= (and b!674141 res!440646) b!674154))

(assert (= (and b!674154 res!440639) b!674147))

(assert (= (and b!674147 res!440651) b!674158))

(assert (= (and b!674158 res!440633) b!674148))

(assert (= (and b!674148 c!77120) b!674162))

(assert (= (and b!674148 (not c!77120)) b!674152))

(assert (= (and b!674148 res!440635) b!674136))

(assert (= (and b!674136 res!440654) b!674153))

(assert (= (and b!674153 res!440649) b!674145))

(assert (= (and b!674145 res!440630) b!674151))

(assert (= (and b!674151 res!440634) b!674137))

(assert (= (and b!674137 res!440653) b!674149))

(assert (= (and b!674137 (not res!440650)) b!674143))

(assert (= (and b!674143 res!440652) b!674157))

(assert (= (and b!674137 res!440648) b!674146))

(assert (= (and b!674146 res!440643) b!674140))

(declare-fun m!642227 () Bool)

(assert (=> b!674138 m!642227))

(declare-fun m!642229 () Bool)

(assert (=> b!674140 m!642229))

(declare-fun m!642231 () Bool)

(assert (=> b!674140 m!642231))

(declare-fun m!642233 () Bool)

(assert (=> b!674140 m!642233))

(declare-fun m!642235 () Bool)

(assert (=> b!674150 m!642235))

(declare-fun m!642237 () Bool)

(assert (=> b!674141 m!642237))

(declare-fun m!642239 () Bool)

(assert (=> b!674142 m!642239))

(declare-fun m!642241 () Bool)

(assert (=> b!674151 m!642241))

(declare-fun m!642243 () Bool)

(assert (=> start!60218 m!642243))

(declare-fun m!642245 () Bool)

(assert (=> b!674139 m!642245))

(declare-fun m!642247 () Bool)

(assert (=> b!674145 m!642247))

(declare-fun m!642249 () Bool)

(assert (=> b!674148 m!642249))

(declare-fun m!642251 () Bool)

(assert (=> b!674146 m!642251))

(assert (=> b!674136 m!642249))

(assert (=> b!674136 m!642249))

(declare-fun m!642253 () Bool)

(assert (=> b!674136 m!642253))

(declare-fun m!642255 () Bool)

(assert (=> b!674156 m!642255))

(declare-fun m!642257 () Bool)

(assert (=> b!674149 m!642257))

(declare-fun m!642259 () Bool)

(assert (=> b!674153 m!642259))

(declare-fun m!642261 () Bool)

(assert (=> b!674144 m!642261))

(assert (=> b!674158 m!642249))

(assert (=> b!674158 m!642249))

(declare-fun m!642263 () Bool)

(assert (=> b!674158 m!642263))

(assert (=> b!674157 m!642257))

(assert (=> b!674159 m!642261))

(declare-fun m!642265 () Bool)

(assert (=> b!674162 m!642265))

(declare-fun m!642267 () Bool)

(assert (=> b!674162 m!642267))

(declare-fun m!642269 () Bool)

(assert (=> b!674154 m!642269))

(push 1)

(assert (not b!674158))

(assert (not b!674140))

(assert (not b!674156))

(assert (not b!674153))

(assert (not b!674159))

(assert (not b!674144))

(assert (not b!674154))

(assert (not b!674141))

(assert (not b!674149))

(assert (not b!674136))

(assert (not b!674157))

(assert (not b!674150))

(assert (not start!60218))

(assert (not b!674142))

(assert (not b!674138))

(assert (not b!674139))

(assert (not b!674146))

(assert (not b!674145))

(assert (not b!674151))

(assert (not b!674162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

