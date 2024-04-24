; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60940 () Bool)

(assert start!60940)

(declare-fun b!683225 () Bool)

(declare-fun res!448989 () Bool)

(declare-fun e!389231 () Bool)

(assert (=> b!683225 (=> (not res!448989) (not e!389231))))

(declare-datatypes ((array!39562 0))(
  ( (array!39563 (arr!18960 (Array (_ BitVec 32) (_ BitVec 64))) (size!19324 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39562)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12908 0))(
  ( (Nil!12905) (Cons!12904 (h!13952 (_ BitVec 64)) (t!19143 List!12908)) )
))
(declare-fun acc!681 () List!12908)

(declare-fun arrayNoDuplicates!0 (array!39562 (_ BitVec 32) List!12908) Bool)

(assert (=> b!683225 (= res!448989 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683226 () Bool)

(declare-fun res!448986 () Bool)

(assert (=> b!683226 (=> (not res!448986) (not e!389231))))

(declare-fun contains!3560 (List!12908 (_ BitVec 64)) Bool)

(assert (=> b!683226 (= res!448986 (not (contains!3560 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683227 () Bool)

(declare-fun res!448990 () Bool)

(assert (=> b!683227 (=> (not res!448990) (not e!389231))))

(declare-fun noDuplicate!834 (List!12908) Bool)

(assert (=> b!683227 (= res!448990 (noDuplicate!834 acc!681))))

(declare-fun b!683228 () Bool)

(declare-fun res!448998 () Bool)

(assert (=> b!683228 (=> (not res!448998) (not e!389231))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683228 (= res!448998 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19324 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683229 () Bool)

(declare-datatypes ((Unit!23971 0))(
  ( (Unit!23972) )
))
(declare-fun e!389227 () Unit!23971)

(declare-fun lt!313834 () Unit!23971)

(assert (=> b!683229 (= e!389227 lt!313834)))

(declare-fun lt!313837 () Unit!23971)

(declare-fun lemmaListSubSeqRefl!0 (List!12908) Unit!23971)

(assert (=> b!683229 (= lt!313837 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!169 (List!12908 List!12908) Bool)

(assert (=> b!683229 (subseq!169 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39562 List!12908 List!12908 (_ BitVec 32)) Unit!23971)

(declare-fun $colon$colon!331 (List!12908 (_ BitVec 64)) List!12908)

(assert (=> b!683229 (= lt!313834 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!331 acc!681 (select (arr!18960 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683229 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683230 () Bool)

(declare-fun res!448996 () Bool)

(assert (=> b!683230 (=> (not res!448996) (not e!389231))))

(assert (=> b!683230 (= res!448996 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19324 a!3626))))))

(declare-fun b!683231 () Bool)

(declare-fun res!448995 () Bool)

(assert (=> b!683231 (=> (not res!448995) (not e!389231))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683231 (= res!448995 (validKeyInArray!0 k!2843))))

(declare-fun b!683232 () Bool)

(declare-fun res!448993 () Bool)

(assert (=> b!683232 (=> (not res!448993) (not e!389231))))

(declare-fun e!389232 () Bool)

(assert (=> b!683232 (= res!448993 e!389232)))

(declare-fun res!448988 () Bool)

(assert (=> b!683232 (=> res!448988 e!389232)))

(declare-fun e!389228 () Bool)

(assert (=> b!683232 (= res!448988 e!389228)))

(declare-fun res!448997 () Bool)

(assert (=> b!683232 (=> (not res!448997) (not e!389228))))

(assert (=> b!683232 (= res!448997 (bvsgt from!3004 i!1382))))

(declare-fun b!683233 () Bool)

(assert (=> b!683233 (= e!389231 (not true))))

(declare-fun -!133 (List!12908 (_ BitVec 64)) List!12908)

(assert (=> b!683233 (= (-!133 ($colon$colon!331 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313835 () Unit!23971)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12908) Unit!23971)

(assert (=> b!683233 (= lt!313835 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683233 (subseq!169 acc!681 acc!681)))

(declare-fun lt!313840 () Unit!23971)

(assert (=> b!683233 (= lt!313840 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683233 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313838 () Unit!23971)

(assert (=> b!683233 (= lt!313838 e!389227)))

(declare-fun c!77488 () Bool)

(assert (=> b!683233 (= c!77488 (validKeyInArray!0 (select (arr!18960 a!3626) from!3004)))))

(declare-fun lt!313836 () Unit!23971)

(declare-fun e!389230 () Unit!23971)

(assert (=> b!683233 (= lt!313836 e!389230)))

(declare-fun c!77489 () Bool)

(declare-fun arrayContainsKey!0 (array!39562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683233 (= c!77489 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683233 (arrayContainsKey!0 (array!39563 (store (arr!18960 a!3626) i!1382 k!2843) (size!19324 a!3626)) k!2843 from!3004)))

(declare-fun res!448999 () Bool)

(assert (=> start!60940 (=> (not res!448999) (not e!389231))))

(assert (=> start!60940 (= res!448999 (and (bvslt (size!19324 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19324 a!3626))))))

(assert (=> start!60940 e!389231))

(assert (=> start!60940 true))

(declare-fun array_inv!14819 (array!39562) Bool)

(assert (=> start!60940 (array_inv!14819 a!3626)))

(declare-fun b!683234 () Bool)

(declare-fun e!389229 () Bool)

(assert (=> b!683234 (= e!389229 (not (contains!3560 acc!681 k!2843)))))

(declare-fun b!683235 () Bool)

(declare-fun res!448991 () Bool)

(assert (=> b!683235 (=> (not res!448991) (not e!389231))))

(assert (=> b!683235 (= res!448991 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683236 () Bool)

(declare-fun Unit!23973 () Unit!23971)

(assert (=> b!683236 (= e!389230 Unit!23973)))

(declare-fun lt!313839 () Unit!23971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39562 (_ BitVec 64) (_ BitVec 32)) Unit!23971)

(assert (=> b!683236 (= lt!313839 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683236 false))

(declare-fun b!683237 () Bool)

(assert (=> b!683237 (= e!389232 e!389229)))

(declare-fun res!448992 () Bool)

(assert (=> b!683237 (=> (not res!448992) (not e!389229))))

(assert (=> b!683237 (= res!448992 (bvsle from!3004 i!1382))))

(declare-fun b!683238 () Bool)

(declare-fun Unit!23974 () Unit!23971)

(assert (=> b!683238 (= e!389227 Unit!23974)))

(declare-fun b!683239 () Bool)

(declare-fun res!448994 () Bool)

(assert (=> b!683239 (=> (not res!448994) (not e!389231))))

(assert (=> b!683239 (= res!448994 (not (contains!3560 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683240 () Bool)

(declare-fun Unit!23975 () Unit!23971)

(assert (=> b!683240 (= e!389230 Unit!23975)))

(declare-fun b!683241 () Bool)

(declare-fun res!448987 () Bool)

(assert (=> b!683241 (=> (not res!448987) (not e!389231))))

(assert (=> b!683241 (= res!448987 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12905))))

(declare-fun b!683242 () Bool)

(assert (=> b!683242 (= e!389228 (contains!3560 acc!681 k!2843))))

(assert (= (and start!60940 res!448999) b!683227))

(assert (= (and b!683227 res!448990) b!683226))

(assert (= (and b!683226 res!448986) b!683239))

(assert (= (and b!683239 res!448994) b!683232))

(assert (= (and b!683232 res!448997) b!683242))

(assert (= (and b!683232 (not res!448988)) b!683237))

(assert (= (and b!683237 res!448992) b!683234))

(assert (= (and b!683232 res!448993) b!683241))

(assert (= (and b!683241 res!448987) b!683225))

(assert (= (and b!683225 res!448989) b!683230))

(assert (= (and b!683230 res!448996) b!683231))

(assert (= (and b!683231 res!448995) b!683235))

(assert (= (and b!683235 res!448991) b!683228))

(assert (= (and b!683228 res!448998) b!683233))

(assert (= (and b!683233 c!77489) b!683236))

(assert (= (and b!683233 (not c!77489)) b!683240))

(assert (= (and b!683233 c!77488) b!683229))

(assert (= (and b!683233 (not c!77488)) b!683238))

(declare-fun m!648303 () Bool)

(assert (=> b!683233 m!648303))

(declare-fun m!648305 () Bool)

(assert (=> b!683233 m!648305))

(declare-fun m!648307 () Bool)

(assert (=> b!683233 m!648307))

(declare-fun m!648309 () Bool)

(assert (=> b!683233 m!648309))

(declare-fun m!648311 () Bool)

(assert (=> b!683233 m!648311))

(declare-fun m!648313 () Bool)

(assert (=> b!683233 m!648313))

(declare-fun m!648315 () Bool)

(assert (=> b!683233 m!648315))

(declare-fun m!648317 () Bool)

(assert (=> b!683233 m!648317))

(assert (=> b!683233 m!648303))

(assert (=> b!683233 m!648309))

(declare-fun m!648319 () Bool)

(assert (=> b!683233 m!648319))

(declare-fun m!648321 () Bool)

(assert (=> b!683233 m!648321))

(declare-fun m!648323 () Bool)

(assert (=> b!683233 m!648323))

(declare-fun m!648325 () Bool)

(assert (=> b!683225 m!648325))

(declare-fun m!648327 () Bool)

(assert (=> b!683241 m!648327))

(declare-fun m!648329 () Bool)

(assert (=> b!683239 m!648329))

(declare-fun m!648331 () Bool)

(assert (=> b!683227 m!648331))

(declare-fun m!648333 () Bool)

(assert (=> b!683226 m!648333))

(declare-fun m!648335 () Bool)

(assert (=> b!683236 m!648335))

(declare-fun m!648337 () Bool)

(assert (=> b!683231 m!648337))

(declare-fun m!648339 () Bool)

(assert (=> b!683235 m!648339))

(assert (=> b!683229 m!648307))

(assert (=> b!683229 m!648309))

(declare-fun m!648341 () Bool)

(assert (=> b!683229 m!648341))

(declare-fun m!648343 () Bool)

(assert (=> b!683229 m!648343))

(assert (=> b!683229 m!648309))

(assert (=> b!683229 m!648341))

(assert (=> b!683229 m!648315))

(assert (=> b!683229 m!648323))

(declare-fun m!648345 () Bool)

(assert (=> b!683234 m!648345))

(declare-fun m!648347 () Bool)

(assert (=> start!60940 m!648347))

(assert (=> b!683242 m!648345))

(push 1)

(assert (not b!683235))

(assert (not b!683233))

(assert (not b!683241))

(assert (not b!683227))

(assert (not b!683226))

(assert (not b!683231))

(assert (not b!683225))

(assert (not b!683242))

(assert (not b!683234))

(assert (not b!683229))

(assert (not b!683236))

(assert (not b!683239))

(assert (not start!60940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

