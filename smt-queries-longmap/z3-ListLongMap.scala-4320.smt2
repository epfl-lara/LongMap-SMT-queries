; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59936 () Bool)

(assert start!59936)

(declare-fun b!664332 () Bool)

(declare-fun res!432165 () Bool)

(declare-fun e!380913 () Bool)

(assert (=> b!664332 (=> (not res!432165) (not e!380913))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38994 0))(
  ( (array!38995 (arr!18689 (Array (_ BitVec 32) (_ BitVec 64))) (size!19054 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38994)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664332 (= res!432165 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19054 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664333 () Bool)

(declare-fun e!380908 () Bool)

(assert (=> b!664333 (= e!380908 true)))

(declare-fun lt!309442 () Bool)

(declare-datatypes ((List!12769 0))(
  ( (Nil!12766) (Cons!12765 (h!13810 (_ BitVec 64)) (t!18988 List!12769)) )
))
(declare-fun lt!309443 () List!12769)

(declare-fun contains!3291 (List!12769 (_ BitVec 64)) Bool)

(assert (=> b!664333 (= lt!309442 (contains!3291 lt!309443 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664334 () Bool)

(declare-fun res!432163 () Bool)

(assert (=> b!664334 (=> (not res!432163) (not e!380913))))

(declare-fun e!380909 () Bool)

(assert (=> b!664334 (= res!432163 e!380909)))

(declare-fun res!432171 () Bool)

(assert (=> b!664334 (=> res!432171 e!380909)))

(declare-fun e!380915 () Bool)

(assert (=> b!664334 (= res!432171 e!380915)))

(declare-fun res!432166 () Bool)

(assert (=> b!664334 (=> (not res!432166) (not e!380915))))

(assert (=> b!664334 (= res!432166 (bvsgt from!3004 i!1382))))

(declare-fun b!664335 () Bool)

(declare-fun res!432167 () Bool)

(assert (=> b!664335 (=> res!432167 e!380908)))

(declare-fun acc!681 () List!12769)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!664335 (= res!432167 (contains!3291 acc!681 k0!2843))))

(declare-fun b!664336 () Bool)

(declare-fun e!380914 () Bool)

(assert (=> b!664336 (= e!380914 (not (contains!3291 acc!681 k0!2843)))))

(declare-fun b!664337 () Bool)

(declare-fun res!432161 () Bool)

(assert (=> b!664337 (=> (not res!432161) (not e!380913))))

(declare-fun arrayNoDuplicates!0 (array!38994 (_ BitVec 32) List!12769) Bool)

(assert (=> b!664337 (= res!432161 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664338 () Bool)

(declare-datatypes ((Unit!23153 0))(
  ( (Unit!23154) )
))
(declare-fun e!380910 () Unit!23153)

(declare-fun lt!309441 () Unit!23153)

(assert (=> b!664338 (= e!380910 lt!309441)))

(declare-fun lt!309445 () Unit!23153)

(declare-fun lemmaListSubSeqRefl!0 (List!12769) Unit!23153)

(assert (=> b!664338 (= lt!309445 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!47 (List!12769 List!12769) Bool)

(assert (=> b!664338 (subseq!47 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38994 List!12769 List!12769 (_ BitVec 32)) Unit!23153)

(declare-fun $colon$colon!178 (List!12769 (_ BitVec 64)) List!12769)

(assert (=> b!664338 (= lt!309441 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!178 acc!681 (select (arr!18689 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664338 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664339 () Bool)

(declare-fun res!432159 () Bool)

(assert (=> b!664339 (=> (not res!432159) (not e!380913))))

(declare-fun arrayContainsKey!0 (array!38994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664339 (= res!432159 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664340 () Bool)

(declare-fun e!380912 () Unit!23153)

(declare-fun Unit!23155 () Unit!23153)

(assert (=> b!664340 (= e!380912 Unit!23155)))

(declare-fun lt!309447 () Unit!23153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38994 (_ BitVec 64) (_ BitVec 32)) Unit!23153)

(assert (=> b!664340 (= lt!309447 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664340 false))

(declare-fun b!664341 () Bool)

(declare-fun res!432157 () Bool)

(assert (=> b!664341 (=> (not res!432157) (not e!380913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664341 (= res!432157 (validKeyInArray!0 k0!2843))))

(declare-fun b!664342 () Bool)

(declare-fun res!432164 () Bool)

(assert (=> b!664342 (=> (not res!432164) (not e!380913))))

(assert (=> b!664342 (= res!432164 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19054 a!3626))))))

(declare-fun b!664343 () Bool)

(declare-fun res!432158 () Bool)

(assert (=> b!664343 (=> res!432158 e!380908)))

(assert (=> b!664343 (= res!432158 (not (subseq!47 acc!681 lt!309443)))))

(declare-fun res!432169 () Bool)

(assert (=> start!59936 (=> (not res!432169) (not e!380913))))

(assert (=> start!59936 (= res!432169 (and (bvslt (size!19054 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19054 a!3626))))))

(assert (=> start!59936 e!380913))

(assert (=> start!59936 true))

(declare-fun array_inv!14572 (array!38994) Bool)

(assert (=> start!59936 (array_inv!14572 a!3626)))

(declare-fun b!664344 () Bool)

(assert (=> b!664344 (= e!380915 (contains!3291 acc!681 k0!2843))))

(declare-fun b!664345 () Bool)

(declare-fun res!432156 () Bool)

(assert (=> b!664345 (=> (not res!432156) (not e!380913))))

(assert (=> b!664345 (= res!432156 (not (contains!3291 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664346 () Bool)

(declare-fun res!432170 () Bool)

(assert (=> b!664346 (=> res!432170 e!380908)))

(declare-fun lt!309444 () Bool)

(assert (=> b!664346 (= res!432170 lt!309444)))

(declare-fun b!664347 () Bool)

(declare-fun res!432153 () Bool)

(assert (=> b!664347 (=> (not res!432153) (not e!380913))))

(assert (=> b!664347 (= res!432153 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12766))))

(declare-fun b!664348 () Bool)

(assert (=> b!664348 (= e!380913 (not e!380908))))

(declare-fun res!432172 () Bool)

(assert (=> b!664348 (=> res!432172 e!380908)))

(assert (=> b!664348 (= res!432172 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!45 (List!12769 (_ BitVec 64)) List!12769)

(assert (=> b!664348 (= (-!45 lt!309443 k0!2843) acc!681)))

(assert (=> b!664348 (= lt!309443 ($colon$colon!178 acc!681 k0!2843))))

(declare-fun lt!309439 () Unit!23153)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12769) Unit!23153)

(assert (=> b!664348 (= lt!309439 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!664348 (subseq!47 acc!681 acc!681)))

(declare-fun lt!309446 () Unit!23153)

(assert (=> b!664348 (= lt!309446 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664348 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309440 () Unit!23153)

(assert (=> b!664348 (= lt!309440 e!380910)))

(declare-fun c!76457 () Bool)

(assert (=> b!664348 (= c!76457 (validKeyInArray!0 (select (arr!18689 a!3626) from!3004)))))

(declare-fun lt!309438 () Unit!23153)

(assert (=> b!664348 (= lt!309438 e!380912)))

(declare-fun c!76458 () Bool)

(assert (=> b!664348 (= c!76458 lt!309444)))

(assert (=> b!664348 (= lt!309444 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664348 (arrayContainsKey!0 (array!38995 (store (arr!18689 a!3626) i!1382 k0!2843) (size!19054 a!3626)) k0!2843 from!3004)))

(declare-fun b!664349 () Bool)

(declare-fun res!432154 () Bool)

(assert (=> b!664349 (=> res!432154 e!380908)))

(assert (=> b!664349 (= res!432154 (contains!3291 lt!309443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664350 () Bool)

(declare-fun res!432162 () Bool)

(assert (=> b!664350 (=> (not res!432162) (not e!380913))))

(assert (=> b!664350 (= res!432162 (not (contains!3291 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664351 () Bool)

(declare-fun res!432155 () Bool)

(assert (=> b!664351 (=> (not res!432155) (not e!380913))))

(declare-fun noDuplicate!560 (List!12769) Bool)

(assert (=> b!664351 (= res!432155 (noDuplicate!560 acc!681))))

(declare-fun b!664352 () Bool)

(declare-fun res!432160 () Bool)

(assert (=> b!664352 (=> res!432160 e!380908)))

(assert (=> b!664352 (= res!432160 (not (contains!3291 lt!309443 k0!2843)))))

(declare-fun b!664353 () Bool)

(assert (=> b!664353 (= e!380909 e!380914)))

(declare-fun res!432168 () Bool)

(assert (=> b!664353 (=> (not res!432168) (not e!380914))))

(assert (=> b!664353 (= res!432168 (bvsle from!3004 i!1382))))

(declare-fun b!664354 () Bool)

(declare-fun Unit!23156 () Unit!23153)

(assert (=> b!664354 (= e!380910 Unit!23156)))

(declare-fun b!664355 () Bool)

(declare-fun Unit!23157 () Unit!23153)

(assert (=> b!664355 (= e!380912 Unit!23157)))

(declare-fun b!664356 () Bool)

(declare-fun res!432152 () Bool)

(assert (=> b!664356 (=> res!432152 e!380908)))

(assert (=> b!664356 (= res!432152 (not (noDuplicate!560 lt!309443)))))

(assert (= (and start!59936 res!432169) b!664351))

(assert (= (and b!664351 res!432155) b!664350))

(assert (= (and b!664350 res!432162) b!664345))

(assert (= (and b!664345 res!432156) b!664334))

(assert (= (and b!664334 res!432166) b!664344))

(assert (= (and b!664334 (not res!432171)) b!664353))

(assert (= (and b!664353 res!432168) b!664336))

(assert (= (and b!664334 res!432163) b!664347))

(assert (= (and b!664347 res!432153) b!664337))

(assert (= (and b!664337 res!432161) b!664342))

(assert (= (and b!664342 res!432164) b!664341))

(assert (= (and b!664341 res!432157) b!664339))

(assert (= (and b!664339 res!432159) b!664332))

(assert (= (and b!664332 res!432165) b!664348))

(assert (= (and b!664348 c!76458) b!664340))

(assert (= (and b!664348 (not c!76458)) b!664355))

(assert (= (and b!664348 c!76457) b!664338))

(assert (= (and b!664348 (not c!76457)) b!664354))

(assert (= (and b!664348 (not res!432172)) b!664356))

(assert (= (and b!664356 (not res!432152)) b!664346))

(assert (= (and b!664346 (not res!432170)) b!664335))

(assert (= (and b!664335 (not res!432167)) b!664343))

(assert (= (and b!664343 (not res!432158)) b!664352))

(assert (= (and b!664352 (not res!432160)) b!664349))

(assert (= (and b!664349 (not res!432154)) b!664333))

(declare-fun m!635103 () Bool)

(assert (=> b!664345 m!635103))

(declare-fun m!635105 () Bool)

(assert (=> b!664340 m!635105))

(declare-fun m!635107 () Bool)

(assert (=> b!664341 m!635107))

(declare-fun m!635109 () Bool)

(assert (=> b!664337 m!635109))

(declare-fun m!635111 () Bool)

(assert (=> b!664356 m!635111))

(declare-fun m!635113 () Bool)

(assert (=> b!664339 m!635113))

(declare-fun m!635115 () Bool)

(assert (=> b!664335 m!635115))

(declare-fun m!635117 () Bool)

(assert (=> b!664352 m!635117))

(assert (=> b!664336 m!635115))

(declare-fun m!635119 () Bool)

(assert (=> b!664349 m!635119))

(declare-fun m!635121 () Bool)

(assert (=> b!664343 m!635121))

(declare-fun m!635123 () Bool)

(assert (=> b!664347 m!635123))

(declare-fun m!635125 () Bool)

(assert (=> b!664348 m!635125))

(declare-fun m!635127 () Bool)

(assert (=> b!664348 m!635127))

(declare-fun m!635129 () Bool)

(assert (=> b!664348 m!635129))

(declare-fun m!635131 () Bool)

(assert (=> b!664348 m!635131))

(declare-fun m!635133 () Bool)

(assert (=> b!664348 m!635133))

(declare-fun m!635135 () Bool)

(assert (=> b!664348 m!635135))

(declare-fun m!635137 () Bool)

(assert (=> b!664348 m!635137))

(declare-fun m!635139 () Bool)

(assert (=> b!664348 m!635139))

(assert (=> b!664348 m!635127))

(declare-fun m!635141 () Bool)

(assert (=> b!664348 m!635141))

(declare-fun m!635143 () Bool)

(assert (=> b!664348 m!635143))

(declare-fun m!635145 () Bool)

(assert (=> b!664348 m!635145))

(declare-fun m!635147 () Bool)

(assert (=> b!664351 m!635147))

(declare-fun m!635149 () Bool)

(assert (=> start!59936 m!635149))

(declare-fun m!635151 () Bool)

(assert (=> b!664333 m!635151))

(assert (=> b!664344 m!635115))

(assert (=> b!664338 m!635125))

(assert (=> b!664338 m!635127))

(declare-fun m!635153 () Bool)

(assert (=> b!664338 m!635153))

(declare-fun m!635155 () Bool)

(assert (=> b!664338 m!635155))

(assert (=> b!664338 m!635127))

(assert (=> b!664338 m!635153))

(assert (=> b!664338 m!635135))

(assert (=> b!664338 m!635145))

(declare-fun m!635157 () Bool)

(assert (=> b!664350 m!635157))

(check-sat (not b!664335) (not b!664333) (not start!59936) (not b!664349) (not b!664336) (not b!664343) (not b!664352) (not b!664339) (not b!664347) (not b!664344) (not b!664340) (not b!664341) (not b!664350) (not b!664356) (not b!664345) (not b!664337) (not b!664351) (not b!664348) (not b!664338))
(check-sat)
