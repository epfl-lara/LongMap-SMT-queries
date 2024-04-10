; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59966 () Bool)

(assert start!59966)

(declare-fun b!665303 () Bool)

(declare-datatypes ((Unit!23220 0))(
  ( (Unit!23221) )
))
(declare-fun e!381314 () Unit!23220)

(declare-fun Unit!23222 () Unit!23220)

(assert (=> b!665303 (= e!381314 Unit!23222)))

(declare-fun b!665304 () Bool)

(declare-fun res!432868 () Bool)

(declare-fun e!381316 () Bool)

(assert (=> b!665304 (=> res!432868 e!381316)))

(declare-datatypes ((List!12740 0))(
  ( (Nil!12737) (Cons!12736 (h!13781 (_ BitVec 64)) (t!18968 List!12740)) )
))
(declare-fun lt!309968 () List!12740)

(declare-fun contains!3317 (List!12740 (_ BitVec 64)) Bool)

(assert (=> b!665304 (= res!432868 (contains!3317 lt!309968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665305 () Bool)

(declare-fun res!432857 () Bool)

(assert (=> b!665305 (=> res!432857 e!381316)))

(declare-fun lt!309971 () Bool)

(assert (=> b!665305 (= res!432857 lt!309971)))

(declare-fun b!665306 () Bool)

(declare-fun res!432871 () Bool)

(declare-fun e!381315 () Bool)

(assert (=> b!665306 (=> (not res!432871) (not e!381315))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39013 0))(
  ( (array!39014 (arr!18699 (Array (_ BitVec 32) (_ BitVec 64))) (size!19063 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39013)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665306 (= res!432871 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19063 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665307 () Bool)

(declare-fun res!432863 () Bool)

(assert (=> b!665307 (=> res!432863 e!381316)))

(declare-fun acc!681 () List!12740)

(declare-fun subseq!56 (List!12740 List!12740) Bool)

(assert (=> b!665307 (= res!432863 (not (subseq!56 acc!681 lt!309968)))))

(declare-fun b!665308 () Bool)

(declare-fun res!432869 () Bool)

(assert (=> b!665308 (=> (not res!432869) (not e!381315))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665308 (= res!432869 (validKeyInArray!0 k!2843))))

(declare-fun b!665309 () Bool)

(declare-fun lt!309966 () Unit!23220)

(assert (=> b!665309 (= e!381314 lt!309966)))

(declare-fun lt!309969 () Unit!23220)

(declare-fun lemmaListSubSeqRefl!0 (List!12740) Unit!23220)

(assert (=> b!665309 (= lt!309969 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665309 (subseq!56 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39013 List!12740 List!12740 (_ BitVec 32)) Unit!23220)

(declare-fun $colon$colon!188 (List!12740 (_ BitVec 64)) List!12740)

(assert (=> b!665309 (= lt!309966 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!188 acc!681 (select (arr!18699 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39013 (_ BitVec 32) List!12740) Bool)

(assert (=> b!665309 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665310 () Bool)

(declare-fun res!432859 () Bool)

(assert (=> b!665310 (=> (not res!432859) (not e!381315))))

(assert (=> b!665310 (= res!432859 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12737))))

(declare-fun b!665311 () Bool)

(declare-fun res!432875 () Bool)

(assert (=> b!665311 (=> (not res!432875) (not e!381315))))

(assert (=> b!665311 (= res!432875 (not (contains!3317 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665312 () Bool)

(declare-fun res!432873 () Bool)

(assert (=> b!665312 (=> (not res!432873) (not e!381315))))

(assert (=> b!665312 (= res!432873 (not (contains!3317 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665314 () Bool)

(declare-fun e!381319 () Bool)

(assert (=> b!665314 (= e!381319 (contains!3317 acc!681 k!2843))))

(declare-fun b!665315 () Bool)

(declare-fun e!381321 () Bool)

(declare-fun e!381318 () Bool)

(assert (=> b!665315 (= e!381321 e!381318)))

(declare-fun res!432874 () Bool)

(assert (=> b!665315 (=> (not res!432874) (not e!381318))))

(assert (=> b!665315 (= res!432874 (bvsle from!3004 i!1382))))

(declare-fun b!665316 () Bool)

(declare-fun e!381317 () Unit!23220)

(declare-fun Unit!23223 () Unit!23220)

(assert (=> b!665316 (= e!381317 Unit!23223)))

(declare-fun b!665317 () Bool)

(assert (=> b!665317 (= e!381315 (not e!381316))))

(declare-fun res!432870 () Bool)

(assert (=> b!665317 (=> res!432870 e!381316)))

(assert (=> b!665317 (= res!432870 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!54 (List!12740 (_ BitVec 64)) List!12740)

(assert (=> b!665317 (= (-!54 lt!309968 k!2843) acc!681)))

(assert (=> b!665317 (= lt!309968 ($colon$colon!188 acc!681 k!2843))))

(declare-fun lt!309964 () Unit!23220)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12740) Unit!23220)

(assert (=> b!665317 (= lt!309964 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665317 (subseq!56 acc!681 acc!681)))

(declare-fun lt!309973 () Unit!23220)

(assert (=> b!665317 (= lt!309973 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665317 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309965 () Unit!23220)

(assert (=> b!665317 (= lt!309965 e!381314)))

(declare-fun c!76591 () Bool)

(assert (=> b!665317 (= c!76591 (validKeyInArray!0 (select (arr!18699 a!3626) from!3004)))))

(declare-fun lt!309972 () Unit!23220)

(assert (=> b!665317 (= lt!309972 e!381317)))

(declare-fun c!76592 () Bool)

(assert (=> b!665317 (= c!76592 lt!309971)))

(declare-fun arrayContainsKey!0 (array!39013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665317 (= lt!309971 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665317 (arrayContainsKey!0 (array!39014 (store (arr!18699 a!3626) i!1382 k!2843) (size!19063 a!3626)) k!2843 from!3004)))

(declare-fun b!665318 () Bool)

(declare-fun res!432855 () Bool)

(assert (=> b!665318 (=> (not res!432855) (not e!381315))))

(assert (=> b!665318 (= res!432855 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665319 () Bool)

(declare-fun res!432858 () Bool)

(assert (=> b!665319 (=> res!432858 e!381316)))

(assert (=> b!665319 (= res!432858 (contains!3317 acc!681 k!2843))))

(declare-fun b!665320 () Bool)

(assert (=> b!665320 (= e!381318 (not (contains!3317 acc!681 k!2843)))))

(declare-fun b!665321 () Bool)

(declare-fun res!432865 () Bool)

(assert (=> b!665321 (=> res!432865 e!381316)))

(assert (=> b!665321 (= res!432865 (not (contains!3317 lt!309968 k!2843)))))

(declare-fun b!665322 () Bool)

(declare-fun res!432862 () Bool)

(assert (=> b!665322 (=> res!432862 e!381316)))

(declare-fun noDuplicate!564 (List!12740) Bool)

(assert (=> b!665322 (= res!432862 (not (noDuplicate!564 lt!309968)))))

(declare-fun b!665323 () Bool)

(assert (=> b!665323 (= e!381316 true)))

(declare-fun lt!309967 () Bool)

(assert (=> b!665323 (= lt!309967 (contains!3317 lt!309968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665324 () Bool)

(declare-fun res!432864 () Bool)

(assert (=> b!665324 (=> (not res!432864) (not e!381315))))

(assert (=> b!665324 (= res!432864 e!381321)))

(declare-fun res!432866 () Bool)

(assert (=> b!665324 (=> res!432866 e!381321)))

(assert (=> b!665324 (= res!432866 e!381319)))

(declare-fun res!432872 () Bool)

(assert (=> b!665324 (=> (not res!432872) (not e!381319))))

(assert (=> b!665324 (= res!432872 (bvsgt from!3004 i!1382))))

(declare-fun b!665325 () Bool)

(declare-fun Unit!23224 () Unit!23220)

(assert (=> b!665325 (= e!381317 Unit!23224)))

(declare-fun lt!309970 () Unit!23220)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39013 (_ BitVec 64) (_ BitVec 32)) Unit!23220)

(assert (=> b!665325 (= lt!309970 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665325 false))

(declare-fun b!665313 () Bool)

(declare-fun res!432861 () Bool)

(assert (=> b!665313 (=> (not res!432861) (not e!381315))))

(assert (=> b!665313 (= res!432861 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19063 a!3626))))))

(declare-fun res!432856 () Bool)

(assert (=> start!59966 (=> (not res!432856) (not e!381315))))

(assert (=> start!59966 (= res!432856 (and (bvslt (size!19063 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19063 a!3626))))))

(assert (=> start!59966 e!381315))

(assert (=> start!59966 true))

(declare-fun array_inv!14495 (array!39013) Bool)

(assert (=> start!59966 (array_inv!14495 a!3626)))

(declare-fun b!665326 () Bool)

(declare-fun res!432867 () Bool)

(assert (=> b!665326 (=> (not res!432867) (not e!381315))))

(assert (=> b!665326 (= res!432867 (noDuplicate!564 acc!681))))

(declare-fun b!665327 () Bool)

(declare-fun res!432860 () Bool)

(assert (=> b!665327 (=> (not res!432860) (not e!381315))))

(assert (=> b!665327 (= res!432860 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!59966 res!432856) b!665326))

(assert (= (and b!665326 res!432867) b!665311))

(assert (= (and b!665311 res!432875) b!665312))

(assert (= (and b!665312 res!432873) b!665324))

(assert (= (and b!665324 res!432872) b!665314))

(assert (= (and b!665324 (not res!432866)) b!665315))

(assert (= (and b!665315 res!432874) b!665320))

(assert (= (and b!665324 res!432864) b!665310))

(assert (= (and b!665310 res!432859) b!665318))

(assert (= (and b!665318 res!432855) b!665313))

(assert (= (and b!665313 res!432861) b!665308))

(assert (= (and b!665308 res!432869) b!665327))

(assert (= (and b!665327 res!432860) b!665306))

(assert (= (and b!665306 res!432871) b!665317))

(assert (= (and b!665317 c!76592) b!665325))

(assert (= (and b!665317 (not c!76592)) b!665316))

(assert (= (and b!665317 c!76591) b!665309))

(assert (= (and b!665317 (not c!76591)) b!665303))

(assert (= (and b!665317 (not res!432870)) b!665322))

(assert (= (and b!665322 (not res!432862)) b!665305))

(assert (= (and b!665305 (not res!432857)) b!665319))

(assert (= (and b!665319 (not res!432858)) b!665307))

(assert (= (and b!665307 (not res!432863)) b!665321))

(assert (= (and b!665321 (not res!432865)) b!665304))

(assert (= (and b!665304 (not res!432868)) b!665323))

(declare-fun m!636389 () Bool)

(assert (=> b!665308 m!636389))

(declare-fun m!636391 () Bool)

(assert (=> b!665312 m!636391))

(declare-fun m!636393 () Bool)

(assert (=> b!665325 m!636393))

(declare-fun m!636395 () Bool)

(assert (=> b!665322 m!636395))

(declare-fun m!636397 () Bool)

(assert (=> b!665307 m!636397))

(declare-fun m!636399 () Bool)

(assert (=> b!665304 m!636399))

(declare-fun m!636401 () Bool)

(assert (=> b!665321 m!636401))

(declare-fun m!636403 () Bool)

(assert (=> b!665319 m!636403))

(declare-fun m!636405 () Bool)

(assert (=> start!59966 m!636405))

(declare-fun m!636407 () Bool)

(assert (=> b!665326 m!636407))

(assert (=> b!665314 m!636403))

(declare-fun m!636409 () Bool)

(assert (=> b!665311 m!636409))

(declare-fun m!636411 () Bool)

(assert (=> b!665323 m!636411))

(declare-fun m!636413 () Bool)

(assert (=> b!665318 m!636413))

(declare-fun m!636415 () Bool)

(assert (=> b!665310 m!636415))

(declare-fun m!636417 () Bool)

(assert (=> b!665327 m!636417))

(assert (=> b!665320 m!636403))

(declare-fun m!636419 () Bool)

(assert (=> b!665309 m!636419))

(declare-fun m!636421 () Bool)

(assert (=> b!665309 m!636421))

(declare-fun m!636423 () Bool)

(assert (=> b!665309 m!636423))

(declare-fun m!636425 () Bool)

(assert (=> b!665309 m!636425))

(assert (=> b!665309 m!636421))

(assert (=> b!665309 m!636423))

(declare-fun m!636427 () Bool)

(assert (=> b!665309 m!636427))

(declare-fun m!636429 () Bool)

(assert (=> b!665309 m!636429))

(assert (=> b!665317 m!636419))

(assert (=> b!665317 m!636421))

(declare-fun m!636431 () Bool)

(assert (=> b!665317 m!636431))

(declare-fun m!636433 () Bool)

(assert (=> b!665317 m!636433))

(assert (=> b!665317 m!636427))

(declare-fun m!636435 () Bool)

(assert (=> b!665317 m!636435))

(assert (=> b!665317 m!636421))

(declare-fun m!636437 () Bool)

(assert (=> b!665317 m!636437))

(declare-fun m!636439 () Bool)

(assert (=> b!665317 m!636439))

(declare-fun m!636441 () Bool)

(assert (=> b!665317 m!636441))

(declare-fun m!636443 () Bool)

(assert (=> b!665317 m!636443))

(assert (=> b!665317 m!636429))

(push 1)

(assert (not b!665308))

(assert (not b!665327))

(assert (not b!665311))

(assert (not b!665321))

(assert (not b!665323))

(assert (not b!665322))

(assert (not b!665320))

(assert (not b!665309))

(assert (not b!665304))

(assert (not b!665317))

(assert (not b!665326))

(assert (not b!665307))

(assert (not b!665325))

(assert (not start!59966))

(assert (not b!665312))

(assert (not b!665314))

(assert (not b!665310))

(assert (not b!665318))

(assert (not b!665319))

(check-sat)

(pop 1)

