; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61262 () Bool)

(assert start!61262)

(declare-fun b!686163 () Bool)

(declare-fun res!451374 () Bool)

(declare-fun e!390800 () Bool)

(assert (=> b!686163 (=> (not res!451374) (not e!390800))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39646 0))(
  ( (array!39647 (arr!18999 (Array (_ BitVec 32) (_ BitVec 64))) (size!19373 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39646)

(assert (=> b!686163 (= res!451374 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19373 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!451364 () Bool)

(assert (=> start!61262 (=> (not res!451364) (not e!390800))))

(assert (=> start!61262 (= res!451364 (and (bvslt (size!19373 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19373 a!3626))))))

(assert (=> start!61262 e!390800))

(assert (=> start!61262 true))

(declare-fun array_inv!14795 (array!39646) Bool)

(assert (=> start!61262 (array_inv!14795 a!3626)))

(declare-fun b!686164 () Bool)

(declare-datatypes ((Unit!24162 0))(
  ( (Unit!24163) )
))
(declare-fun e!390798 () Unit!24162)

(declare-fun Unit!24164 () Unit!24162)

(assert (=> b!686164 (= e!390798 Unit!24164)))

(declare-fun b!686165 () Bool)

(declare-fun res!451373 () Bool)

(assert (=> b!686165 (=> (not res!451373) (not e!390800))))

(declare-datatypes ((List!13040 0))(
  ( (Nil!13037) (Cons!13036 (h!14081 (_ BitVec 64)) (t!19295 List!13040)) )
))
(declare-fun acc!681 () List!13040)

(declare-fun arrayNoDuplicates!0 (array!39646 (_ BitVec 32) List!13040) Bool)

(assert (=> b!686165 (= res!451373 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686166 () Bool)

(declare-fun e!390799 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3617 (List!13040 (_ BitVec 64)) Bool)

(assert (=> b!686166 (= e!390799 (not (contains!3617 acc!681 k!2843)))))

(declare-fun b!686167 () Bool)

(declare-fun e!390801 () Bool)

(assert (=> b!686167 (= e!390801 e!390799)))

(declare-fun res!451367 () Bool)

(assert (=> b!686167 (=> (not res!451367) (not e!390799))))

(assert (=> b!686167 (= res!451367 (bvsle from!3004 i!1382))))

(declare-fun b!686168 () Bool)

(declare-fun res!451370 () Bool)

(assert (=> b!686168 (=> (not res!451370) (not e!390800))))

(assert (=> b!686168 (= res!451370 (not (contains!3617 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686169 () Bool)

(declare-fun e!390803 () Unit!24162)

(declare-fun lt!314906 () Unit!24162)

(assert (=> b!686169 (= e!390803 lt!314906)))

(declare-fun lt!314902 () Unit!24162)

(declare-fun lemmaListSubSeqRefl!0 (List!13040) Unit!24162)

(assert (=> b!686169 (= lt!314902 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!203 (List!13040 List!13040) Bool)

(assert (=> b!686169 (subseq!203 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39646 List!13040 List!13040 (_ BitVec 32)) Unit!24162)

(declare-fun $colon$colon!368 (List!13040 (_ BitVec 64)) List!13040)

(assert (=> b!686169 (= lt!314906 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!368 acc!681 (select (arr!18999 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686169 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686170 () Bool)

(declare-fun res!451376 () Bool)

(assert (=> b!686170 (=> (not res!451376) (not e!390800))))

(assert (=> b!686170 (= res!451376 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19373 a!3626))))))

(declare-fun b!686171 () Bool)

(assert (=> b!686171 (= e!390800 (not true))))

(declare-fun lt!314904 () List!13040)

(assert (=> b!686171 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314904)))

(declare-fun lt!314900 () Unit!24162)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39646 (_ BitVec 64) (_ BitVec 32) List!13040 List!13040) Unit!24162)

(assert (=> b!686171 (= lt!314900 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314904))))

(declare-fun -!168 (List!13040 (_ BitVec 64)) List!13040)

(assert (=> b!686171 (= (-!168 lt!314904 k!2843) acc!681)))

(assert (=> b!686171 (= lt!314904 ($colon$colon!368 acc!681 k!2843))))

(declare-fun lt!314908 () Unit!24162)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13040) Unit!24162)

(assert (=> b!686171 (= lt!314908 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!686171 (subseq!203 acc!681 acc!681)))

(declare-fun lt!314905 () Unit!24162)

(assert (=> b!686171 (= lt!314905 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686171 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314901 () Unit!24162)

(assert (=> b!686171 (= lt!314901 e!390803)))

(declare-fun c!77768 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686171 (= c!77768 (validKeyInArray!0 (select (arr!18999 a!3626) from!3004)))))

(declare-fun lt!314903 () Unit!24162)

(assert (=> b!686171 (= lt!314903 e!390798)))

(declare-fun c!77767 () Bool)

(declare-fun arrayContainsKey!0 (array!39646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686171 (= c!77767 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686171 (arrayContainsKey!0 (array!39647 (store (arr!18999 a!3626) i!1382 k!2843) (size!19373 a!3626)) k!2843 from!3004)))

(declare-fun b!686172 () Bool)

(declare-fun res!451371 () Bool)

(assert (=> b!686172 (=> (not res!451371) (not e!390800))))

(assert (=> b!686172 (= res!451371 (validKeyInArray!0 k!2843))))

(declare-fun b!686173 () Bool)

(declare-fun res!451368 () Bool)

(assert (=> b!686173 (=> (not res!451368) (not e!390800))))

(declare-fun noDuplicate!864 (List!13040) Bool)

(assert (=> b!686173 (= res!451368 (noDuplicate!864 acc!681))))

(declare-fun b!686174 () Bool)

(declare-fun res!451369 () Bool)

(assert (=> b!686174 (=> (not res!451369) (not e!390800))))

(assert (=> b!686174 (= res!451369 e!390801)))

(declare-fun res!451366 () Bool)

(assert (=> b!686174 (=> res!451366 e!390801)))

(declare-fun e!390804 () Bool)

(assert (=> b!686174 (= res!451366 e!390804)))

(declare-fun res!451372 () Bool)

(assert (=> b!686174 (=> (not res!451372) (not e!390804))))

(assert (=> b!686174 (= res!451372 (bvsgt from!3004 i!1382))))

(declare-fun b!686175 () Bool)

(assert (=> b!686175 (= e!390804 (contains!3617 acc!681 k!2843))))

(declare-fun b!686176 () Bool)

(declare-fun Unit!24165 () Unit!24162)

(assert (=> b!686176 (= e!390803 Unit!24165)))

(declare-fun b!686177 () Bool)

(declare-fun res!451363 () Bool)

(assert (=> b!686177 (=> (not res!451363) (not e!390800))))

(assert (=> b!686177 (= res!451363 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686178 () Bool)

(declare-fun Unit!24166 () Unit!24162)

(assert (=> b!686178 (= e!390798 Unit!24166)))

(declare-fun lt!314907 () Unit!24162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39646 (_ BitVec 64) (_ BitVec 32)) Unit!24162)

(assert (=> b!686178 (= lt!314907 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686178 false))

(declare-fun b!686179 () Bool)

(declare-fun res!451375 () Bool)

(assert (=> b!686179 (=> (not res!451375) (not e!390800))))

(assert (=> b!686179 (= res!451375 (not (contains!3617 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686180 () Bool)

(declare-fun res!451365 () Bool)

(assert (=> b!686180 (=> (not res!451365) (not e!390800))))

(assert (=> b!686180 (= res!451365 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13037))))

(assert (= (and start!61262 res!451364) b!686173))

(assert (= (and b!686173 res!451368) b!686179))

(assert (= (and b!686179 res!451375) b!686168))

(assert (= (and b!686168 res!451370) b!686174))

(assert (= (and b!686174 res!451372) b!686175))

(assert (= (and b!686174 (not res!451366)) b!686167))

(assert (= (and b!686167 res!451367) b!686166))

(assert (= (and b!686174 res!451369) b!686180))

(assert (= (and b!686180 res!451365) b!686165))

(assert (= (and b!686165 res!451373) b!686170))

(assert (= (and b!686170 res!451376) b!686172))

(assert (= (and b!686172 res!451371) b!686177))

(assert (= (and b!686177 res!451363) b!686163))

(assert (= (and b!686163 res!451374) b!686171))

(assert (= (and b!686171 c!77767) b!686178))

(assert (= (and b!686171 (not c!77767)) b!686164))

(assert (= (and b!686171 c!77768) b!686169))

(assert (= (and b!686171 (not c!77768)) b!686176))

(declare-fun m!650279 () Bool)

(assert (=> start!61262 m!650279))

(declare-fun m!650281 () Bool)

(assert (=> b!686168 m!650281))

(declare-fun m!650283 () Bool)

(assert (=> b!686180 m!650283))

(declare-fun m!650285 () Bool)

(assert (=> b!686171 m!650285))

(declare-fun m!650287 () Bool)

(assert (=> b!686171 m!650287))

(declare-fun m!650289 () Bool)

(assert (=> b!686171 m!650289))

(declare-fun m!650291 () Bool)

(assert (=> b!686171 m!650291))

(declare-fun m!650293 () Bool)

(assert (=> b!686171 m!650293))

(declare-fun m!650295 () Bool)

(assert (=> b!686171 m!650295))

(assert (=> b!686171 m!650289))

(declare-fun m!650297 () Bool)

(assert (=> b!686171 m!650297))

(declare-fun m!650299 () Bool)

(assert (=> b!686171 m!650299))

(declare-fun m!650301 () Bool)

(assert (=> b!686171 m!650301))

(declare-fun m!650303 () Bool)

(assert (=> b!686171 m!650303))

(declare-fun m!650305 () Bool)

(assert (=> b!686171 m!650305))

(declare-fun m!650307 () Bool)

(assert (=> b!686171 m!650307))

(declare-fun m!650309 () Bool)

(assert (=> b!686171 m!650309))

(declare-fun m!650311 () Bool)

(assert (=> b!686165 m!650311))

(declare-fun m!650313 () Bool)

(assert (=> b!686179 m!650313))

(declare-fun m!650315 () Bool)

(assert (=> b!686175 m!650315))

(declare-fun m!650317 () Bool)

(assert (=> b!686173 m!650317))

(assert (=> b!686169 m!650287))

(assert (=> b!686169 m!650289))

(declare-fun m!650319 () Bool)

(assert (=> b!686169 m!650319))

(declare-fun m!650321 () Bool)

(assert (=> b!686169 m!650321))

(assert (=> b!686169 m!650289))

(assert (=> b!686169 m!650319))

(assert (=> b!686169 m!650293))

(assert (=> b!686169 m!650309))

(declare-fun m!650323 () Bool)

(assert (=> b!686177 m!650323))

(declare-fun m!650325 () Bool)

(assert (=> b!686172 m!650325))

(assert (=> b!686166 m!650315))

(declare-fun m!650327 () Bool)

(assert (=> b!686178 m!650327))

(push 1)

(assert (not b!686166))

(assert (not b!686169))

(assert (not b!686165))

(assert (not b!686179))

(assert (not b!686177))

(assert (not b!686180))

(assert (not b!686175))

(assert (not start!61262))

(assert (not b!686171))

(assert (not b!686172))

(assert (not b!686178))

(assert (not b!686173))

(assert (not b!686168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

