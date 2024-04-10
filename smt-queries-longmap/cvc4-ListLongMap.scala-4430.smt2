; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61560 () Bool)

(assert start!61560)

(declare-fun b!688418 () Bool)

(declare-fun res!453130 () Bool)

(declare-fun e!392104 () Bool)

(assert (=> b!688418 (=> res!453130 e!392104)))

(declare-datatypes ((List!13063 0))(
  ( (Nil!13060) (Cons!13059 (h!14104 (_ BitVec 64)) (t!19327 List!13063)) )
))
(declare-fun lt!315766 () List!13063)

(declare-fun noDuplicate!887 (List!13063) Bool)

(assert (=> b!688418 (= res!453130 (not (noDuplicate!887 lt!315766)))))

(declare-fun b!688419 () Bool)

(declare-fun res!453140 () Bool)

(declare-fun e!392106 () Bool)

(assert (=> b!688419 (=> (not res!453140) (not e!392106))))

(declare-fun e!392101 () Bool)

(assert (=> b!688419 (= res!453140 e!392101)))

(declare-fun res!453128 () Bool)

(assert (=> b!688419 (=> res!453128 e!392101)))

(declare-fun e!392099 () Bool)

(assert (=> b!688419 (= res!453128 e!392099)))

(declare-fun res!453132 () Bool)

(assert (=> b!688419 (=> (not res!453132) (not e!392099))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688419 (= res!453132 (bvsgt from!3004 i!1382))))

(declare-fun b!688420 () Bool)

(declare-datatypes ((Unit!24277 0))(
  ( (Unit!24278) )
))
(declare-fun e!392100 () Unit!24277)

(declare-fun Unit!24279 () Unit!24277)

(assert (=> b!688420 (= e!392100 Unit!24279)))

(declare-fun b!688421 () Bool)

(declare-fun e!392102 () Unit!24277)

(declare-fun lt!315762 () Unit!24277)

(assert (=> b!688421 (= e!392102 lt!315762)))

(declare-fun lt!315767 () Unit!24277)

(declare-fun acc!681 () List!13063)

(declare-fun lemmaListSubSeqRefl!0 (List!13063) Unit!24277)

(assert (=> b!688421 (= lt!315767 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!226 (List!13063 List!13063) Bool)

(assert (=> b!688421 (subseq!226 acc!681 acc!681)))

(declare-datatypes ((array!39701 0))(
  ( (array!39702 (arr!19022 (Array (_ BitVec 32) (_ BitVec 64))) (size!19404 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39701)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39701 List!13063 List!13063 (_ BitVec 32)) Unit!24277)

(declare-fun $colon$colon!391 (List!13063 (_ BitVec 64)) List!13063)

(assert (=> b!688421 (= lt!315762 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!391 acc!681 (select (arr!19022 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39701 (_ BitVec 32) List!13063) Bool)

(assert (=> b!688421 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688422 () Bool)

(declare-fun e!392105 () Bool)

(assert (=> b!688422 (= e!392101 e!392105)))

(declare-fun res!453131 () Bool)

(assert (=> b!688422 (=> (not res!453131) (not e!392105))))

(assert (=> b!688422 (= res!453131 (bvsle from!3004 i!1382))))

(declare-fun b!688423 () Bool)

(declare-fun res!453129 () Bool)

(assert (=> b!688423 (=> res!453129 e!392104)))

(declare-fun contains!3640 (List!13063 (_ BitVec 64)) Bool)

(assert (=> b!688423 (= res!453129 (contains!3640 lt!315766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688424 () Bool)

(declare-fun res!453144 () Bool)

(assert (=> b!688424 (=> (not res!453144) (not e!392106))))

(assert (=> b!688424 (= res!453144 (noDuplicate!887 acc!681))))

(declare-fun b!688425 () Bool)

(declare-fun res!453137 () Bool)

(assert (=> b!688425 (=> (not res!453137) (not e!392106))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688425 (= res!453137 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688426 () Bool)

(declare-fun e!392103 () Bool)

(declare-fun e!392109 () Bool)

(assert (=> b!688426 (= e!392103 e!392109)))

(declare-fun res!453141 () Bool)

(assert (=> b!688426 (=> (not res!453141) (not e!392109))))

(assert (=> b!688426 (= res!453141 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688427 () Bool)

(assert (=> b!688427 (= e!392106 (not e!392104))))

(declare-fun res!453143 () Bool)

(assert (=> b!688427 (=> res!453143 e!392104)))

(assert (=> b!688427 (= res!453143 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688427 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315766)))

(declare-fun lt!315764 () Unit!24277)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39701 (_ BitVec 64) (_ BitVec 32) List!13063 List!13063) Unit!24277)

(assert (=> b!688427 (= lt!315764 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315766))))

(declare-fun -!191 (List!13063 (_ BitVec 64)) List!13063)

(assert (=> b!688427 (= (-!191 lt!315766 k!2843) acc!681)))

(assert (=> b!688427 (= lt!315766 ($colon$colon!391 acc!681 k!2843))))

(declare-fun lt!315763 () Unit!24277)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13063) Unit!24277)

(assert (=> b!688427 (= lt!315763 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!688427 (subseq!226 acc!681 acc!681)))

(declare-fun lt!315765 () Unit!24277)

(assert (=> b!688427 (= lt!315765 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688427 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315761 () Unit!24277)

(assert (=> b!688427 (= lt!315761 e!392102)))

(declare-fun c!78014 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688427 (= c!78014 (validKeyInArray!0 (select (arr!19022 a!3626) from!3004)))))

(declare-fun lt!315769 () Unit!24277)

(assert (=> b!688427 (= lt!315769 e!392100)))

(declare-fun c!78013 () Bool)

(assert (=> b!688427 (= c!78013 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688427 (arrayContainsKey!0 (array!39702 (store (arr!19022 a!3626) i!1382 k!2843) (size!19404 a!3626)) k!2843 from!3004)))

(declare-fun b!688428 () Bool)

(declare-fun res!453135 () Bool)

(assert (=> b!688428 (=> (not res!453135) (not e!392106))))

(assert (=> b!688428 (= res!453135 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688429 () Bool)

(declare-fun Unit!24280 () Unit!24277)

(assert (=> b!688429 (= e!392102 Unit!24280)))

(declare-fun b!688430 () Bool)

(declare-fun e!392108 () Bool)

(assert (=> b!688430 (= e!392108 (contains!3640 lt!315766 k!2843))))

(declare-fun b!688431 () Bool)

(declare-fun res!453145 () Bool)

(assert (=> b!688431 (=> (not res!453145) (not e!392106))))

(assert (=> b!688431 (= res!453145 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19404 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688432 () Bool)

(declare-fun res!453138 () Bool)

(assert (=> b!688432 (=> (not res!453138) (not e!392106))))

(assert (=> b!688432 (= res!453138 (not (contains!3640 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688433 () Bool)

(assert (=> b!688433 (= e!392109 (not (contains!3640 lt!315766 k!2843)))))

(declare-fun b!688434 () Bool)

(assert (=> b!688434 (= e!392104 true)))

(declare-fun lt!315768 () Bool)

(assert (=> b!688434 (= lt!315768 e!392103)))

(declare-fun res!453127 () Bool)

(assert (=> b!688434 (=> res!453127 e!392103)))

(assert (=> b!688434 (= res!453127 e!392108)))

(declare-fun res!453133 () Bool)

(assert (=> b!688434 (=> (not res!453133) (not e!392108))))

(assert (=> b!688434 (= res!453133 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688435 () Bool)

(declare-fun Unit!24281 () Unit!24277)

(assert (=> b!688435 (= e!392100 Unit!24281)))

(declare-fun lt!315760 () Unit!24277)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39701 (_ BitVec 64) (_ BitVec 32)) Unit!24277)

(assert (=> b!688435 (= lt!315760 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688435 false))

(declare-fun res!453136 () Bool)

(assert (=> start!61560 (=> (not res!453136) (not e!392106))))

(assert (=> start!61560 (= res!453136 (and (bvslt (size!19404 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19404 a!3626))))))

(assert (=> start!61560 e!392106))

(assert (=> start!61560 true))

(declare-fun array_inv!14818 (array!39701) Bool)

(assert (=> start!61560 (array_inv!14818 a!3626)))

(declare-fun b!688436 () Bool)

(declare-fun res!453142 () Bool)

(assert (=> b!688436 (=> (not res!453142) (not e!392106))))

(assert (=> b!688436 (= res!453142 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13060))))

(declare-fun b!688437 () Bool)

(assert (=> b!688437 (= e!392105 (not (contains!3640 acc!681 k!2843)))))

(declare-fun b!688438 () Bool)

(declare-fun res!453146 () Bool)

(assert (=> b!688438 (=> res!453146 e!392104)))

(assert (=> b!688438 (= res!453146 (contains!3640 lt!315766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688439 () Bool)

(declare-fun res!453139 () Bool)

(assert (=> b!688439 (=> (not res!453139) (not e!392106))))

(assert (=> b!688439 (= res!453139 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19404 a!3626))))))

(declare-fun b!688440 () Bool)

(assert (=> b!688440 (= e!392099 (contains!3640 acc!681 k!2843))))

(declare-fun b!688441 () Bool)

(declare-fun res!453126 () Bool)

(assert (=> b!688441 (=> (not res!453126) (not e!392106))))

(assert (=> b!688441 (= res!453126 (validKeyInArray!0 k!2843))))

(declare-fun b!688442 () Bool)

(declare-fun res!453134 () Bool)

(assert (=> b!688442 (=> (not res!453134) (not e!392106))))

(assert (=> b!688442 (= res!453134 (not (contains!3640 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61560 res!453136) b!688424))

(assert (= (and b!688424 res!453144) b!688442))

(assert (= (and b!688442 res!453134) b!688432))

(assert (= (and b!688432 res!453138) b!688419))

(assert (= (and b!688419 res!453132) b!688440))

(assert (= (and b!688419 (not res!453128)) b!688422))

(assert (= (and b!688422 res!453131) b!688437))

(assert (= (and b!688419 res!453140) b!688436))

(assert (= (and b!688436 res!453142) b!688428))

(assert (= (and b!688428 res!453135) b!688439))

(assert (= (and b!688439 res!453139) b!688441))

(assert (= (and b!688441 res!453126) b!688425))

(assert (= (and b!688425 res!453137) b!688431))

(assert (= (and b!688431 res!453145) b!688427))

(assert (= (and b!688427 c!78013) b!688435))

(assert (= (and b!688427 (not c!78013)) b!688420))

(assert (= (and b!688427 c!78014) b!688421))

(assert (= (and b!688427 (not c!78014)) b!688429))

(assert (= (and b!688427 (not res!453143)) b!688418))

(assert (= (and b!688418 (not res!453130)) b!688438))

(assert (= (and b!688438 (not res!453146)) b!688423))

(assert (= (and b!688423 (not res!453129)) b!688434))

(assert (= (and b!688434 res!453133) b!688430))

(assert (= (and b!688434 (not res!453127)) b!688426))

(assert (= (and b!688426 res!453141) b!688433))

(declare-fun m!652315 () Bool)

(assert (=> b!688433 m!652315))

(declare-fun m!652317 () Bool)

(assert (=> b!688435 m!652317))

(assert (=> b!688430 m!652315))

(declare-fun m!652319 () Bool)

(assert (=> b!688438 m!652319))

(declare-fun m!652321 () Bool)

(assert (=> b!688423 m!652321))

(declare-fun m!652323 () Bool)

(assert (=> b!688428 m!652323))

(declare-fun m!652325 () Bool)

(assert (=> b!688436 m!652325))

(declare-fun m!652327 () Bool)

(assert (=> b!688441 m!652327))

(declare-fun m!652329 () Bool)

(assert (=> b!688418 m!652329))

(declare-fun m!652331 () Bool)

(assert (=> b!688421 m!652331))

(declare-fun m!652333 () Bool)

(assert (=> b!688421 m!652333))

(declare-fun m!652335 () Bool)

(assert (=> b!688421 m!652335))

(declare-fun m!652337 () Bool)

(assert (=> b!688421 m!652337))

(assert (=> b!688421 m!652333))

(assert (=> b!688421 m!652335))

(declare-fun m!652339 () Bool)

(assert (=> b!688421 m!652339))

(declare-fun m!652341 () Bool)

(assert (=> b!688421 m!652341))

(declare-fun m!652343 () Bool)

(assert (=> b!688425 m!652343))

(declare-fun m!652345 () Bool)

(assert (=> b!688437 m!652345))

(declare-fun m!652347 () Bool)

(assert (=> start!61560 m!652347))

(declare-fun m!652349 () Bool)

(assert (=> b!688424 m!652349))

(assert (=> b!688427 m!652331))

(assert (=> b!688427 m!652333))

(declare-fun m!652351 () Bool)

(assert (=> b!688427 m!652351))

(assert (=> b!688427 m!652339))

(assert (=> b!688427 m!652333))

(declare-fun m!652353 () Bool)

(assert (=> b!688427 m!652353))

(declare-fun m!652355 () Bool)

(assert (=> b!688427 m!652355))

(declare-fun m!652357 () Bool)

(assert (=> b!688427 m!652357))

(declare-fun m!652359 () Bool)

(assert (=> b!688427 m!652359))

(declare-fun m!652361 () Bool)

(assert (=> b!688427 m!652361))

(declare-fun m!652363 () Bool)

(assert (=> b!688427 m!652363))

(declare-fun m!652365 () Bool)

(assert (=> b!688427 m!652365))

(declare-fun m!652367 () Bool)

(assert (=> b!688427 m!652367))

(assert (=> b!688427 m!652341))

(declare-fun m!652369 () Bool)

(assert (=> b!688442 m!652369))

(assert (=> b!688440 m!652345))

(declare-fun m!652371 () Bool)

(assert (=> b!688432 m!652371))

(push 1)

(assert (not b!688442))

(assert (not b!688437))

(assert (not b!688438))

(assert (not b!688430))

(assert (not b!688424))

(assert (not b!688432))

(assert (not b!688425))

(assert (not b!688421))

(assert (not b!688423))

(assert (not b!688433))

(assert (not b!688427))

(assert (not b!688436))

(assert (not b!688440))

(assert (not b!688435))

(assert (not b!688428))

(assert (not b!688441))

(assert (not b!688418))

(assert (not start!61560))

(check-sat)

