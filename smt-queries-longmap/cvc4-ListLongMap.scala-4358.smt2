; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60180 () Bool)

(assert start!60180)

(declare-fun b!672652 () Bool)

(declare-fun e!384233 () Bool)

(declare-fun e!384237 () Bool)

(assert (=> b!672652 (= e!384233 e!384237)))

(declare-fun res!439280 () Bool)

(assert (=> b!672652 (=> (not res!439280) (not e!384237))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!672652 (= res!439280 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12847 0))(
  ( (Nil!12844) (Cons!12843 (h!13888 (_ BitVec 64)) (t!19075 List!12847)) )
))
(declare-fun lt!312343 () List!12847)

(declare-datatypes ((array!39227 0))(
  ( (array!39228 (arr!18806 (Array (_ BitVec 32) (_ BitVec 64))) (size!19170 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39227)

(declare-fun acc!681 () List!12847)

(declare-fun $colon$colon!274 (List!12847 (_ BitVec 64)) List!12847)

(assert (=> b!672652 (= lt!312343 ($colon$colon!274 acc!681 (select (arr!18806 a!3626) from!3004)))))

(declare-fun b!672653 () Bool)

(declare-fun res!439261 () Bool)

(declare-fun e!384238 () Bool)

(assert (=> b!672653 (=> (not res!439261) (not e!384238))))

(declare-fun contains!3424 (List!12847 (_ BitVec 64)) Bool)

(assert (=> b!672653 (= res!439261 (not (contains!3424 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672654 () Bool)

(declare-fun e!384236 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!672654 (= e!384236 (not (contains!3424 acc!681 k!2843)))))

(declare-fun b!672655 () Bool)

(declare-fun res!439266 () Bool)

(assert (=> b!672655 (=> (not res!439266) (not e!384238))))

(assert (=> b!672655 (= res!439266 (not (contains!3424 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672656 () Bool)

(declare-fun res!439262 () Bool)

(assert (=> b!672656 (=> (not res!439262) (not e!384238))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672656 (= res!439262 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19170 a!3626))))))

(declare-fun b!672657 () Bool)

(declare-datatypes ((Unit!23636 0))(
  ( (Unit!23637) )
))
(declare-fun e!384239 () Unit!23636)

(declare-fun Unit!23638 () Unit!23636)

(assert (=> b!672657 (= e!384239 Unit!23638)))

(declare-fun arrayContainsKey!0 (array!39227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672657 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312344 () Unit!23636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39227 (_ BitVec 64) (_ BitVec 32)) Unit!23636)

(assert (=> b!672657 (= lt!312344 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672657 false))

(declare-fun b!672658 () Bool)

(declare-fun e!384230 () Bool)

(assert (=> b!672658 (= e!384230 (not (contains!3424 lt!312343 k!2843)))))

(declare-fun b!672659 () Bool)

(declare-fun res!439260 () Bool)

(assert (=> b!672659 (=> (not res!439260) (not e!384238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672659 (= res!439260 (validKeyInArray!0 k!2843))))

(declare-fun b!672660 () Bool)

(assert (=> b!672660 (= e!384237 false)))

(declare-fun lt!312345 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39227 (_ BitVec 32) List!12847) Bool)

(assert (=> b!672660 (= lt!312345 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312343))))

(declare-fun b!672661 () Bool)

(declare-fun e!384232 () Bool)

(assert (=> b!672661 (= e!384232 e!384236)))

(declare-fun res!439270 () Bool)

(assert (=> b!672661 (=> (not res!439270) (not e!384236))))

(assert (=> b!672661 (= res!439270 (bvsle from!3004 i!1382))))

(declare-fun b!672662 () Bool)

(declare-fun res!439275 () Bool)

(assert (=> b!672662 (=> (not res!439275) (not e!384238))))

(declare-fun noDuplicate!671 (List!12847) Bool)

(assert (=> b!672662 (= res!439275 (noDuplicate!671 acc!681))))

(declare-fun b!672663 () Bool)

(assert (=> b!672663 (= e!384238 e!384233)))

(declare-fun res!439265 () Bool)

(assert (=> b!672663 (=> (not res!439265) (not e!384233))))

(assert (=> b!672663 (= res!439265 (not (= (select (arr!18806 a!3626) from!3004) k!2843)))))

(declare-fun lt!312346 () Unit!23636)

(assert (=> b!672663 (= lt!312346 e!384239)))

(declare-fun c!77063 () Bool)

(assert (=> b!672663 (= c!77063 (= (select (arr!18806 a!3626) from!3004) k!2843))))

(declare-fun b!672664 () Bool)

(declare-fun res!439279 () Bool)

(assert (=> b!672664 (=> (not res!439279) (not e!384238))))

(assert (=> b!672664 (= res!439279 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!439273 () Bool)

(assert (=> start!60180 (=> (not res!439273) (not e!384238))))

(assert (=> start!60180 (= res!439273 (and (bvslt (size!19170 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19170 a!3626))))))

(assert (=> start!60180 e!384238))

(assert (=> start!60180 true))

(declare-fun array_inv!14602 (array!39227) Bool)

(assert (=> start!60180 (array_inv!14602 a!3626)))

(declare-fun b!672665 () Bool)

(declare-fun res!439276 () Bool)

(assert (=> b!672665 (=> (not res!439276) (not e!384237))))

(assert (=> b!672665 (= res!439276 (not (contains!3424 lt!312343 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672666 () Bool)

(declare-fun res!439264 () Bool)

(assert (=> b!672666 (=> (not res!439264) (not e!384237))))

(assert (=> b!672666 (= res!439264 (noDuplicate!671 lt!312343))))

(declare-fun b!672667 () Bool)

(declare-fun res!439271 () Bool)

(assert (=> b!672667 (=> (not res!439271) (not e!384238))))

(assert (=> b!672667 (= res!439271 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672668 () Bool)

(declare-fun res!439268 () Bool)

(assert (=> b!672668 (=> (not res!439268) (not e!384238))))

(assert (=> b!672668 (= res!439268 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12844))))

(declare-fun b!672669 () Bool)

(declare-fun e!384235 () Bool)

(assert (=> b!672669 (= e!384235 e!384230)))

(declare-fun res!439282 () Bool)

(assert (=> b!672669 (=> (not res!439282) (not e!384230))))

(assert (=> b!672669 (= res!439282 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672670 () Bool)

(declare-fun e!384231 () Bool)

(assert (=> b!672670 (= e!384231 (contains!3424 acc!681 k!2843))))

(declare-fun b!672671 () Bool)

(declare-fun Unit!23639 () Unit!23636)

(assert (=> b!672671 (= e!384239 Unit!23639)))

(declare-fun b!672672 () Bool)

(declare-fun res!439267 () Bool)

(assert (=> b!672672 (=> (not res!439267) (not e!384238))))

(assert (=> b!672672 (= res!439267 (validKeyInArray!0 (select (arr!18806 a!3626) from!3004)))))

(declare-fun b!672673 () Bool)

(declare-fun res!439263 () Bool)

(assert (=> b!672673 (=> (not res!439263) (not e!384238))))

(assert (=> b!672673 (= res!439263 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19170 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672674 () Bool)

(declare-fun e!384234 () Bool)

(assert (=> b!672674 (= e!384234 (contains!3424 lt!312343 k!2843))))

(declare-fun b!672675 () Bool)

(declare-fun res!439272 () Bool)

(assert (=> b!672675 (=> (not res!439272) (not e!384238))))

(assert (=> b!672675 (= res!439272 e!384232)))

(declare-fun res!439278 () Bool)

(assert (=> b!672675 (=> res!439278 e!384232)))

(assert (=> b!672675 (= res!439278 e!384231)))

(declare-fun res!439274 () Bool)

(assert (=> b!672675 (=> (not res!439274) (not e!384231))))

(assert (=> b!672675 (= res!439274 (bvsgt from!3004 i!1382))))

(declare-fun b!672676 () Bool)

(declare-fun res!439269 () Bool)

(assert (=> b!672676 (=> (not res!439269) (not e!384237))))

(assert (=> b!672676 (= res!439269 e!384235)))

(declare-fun res!439283 () Bool)

(assert (=> b!672676 (=> res!439283 e!384235)))

(assert (=> b!672676 (= res!439283 e!384234)))

(declare-fun res!439281 () Bool)

(assert (=> b!672676 (=> (not res!439281) (not e!384234))))

(assert (=> b!672676 (= res!439281 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672677 () Bool)

(declare-fun res!439277 () Bool)

(assert (=> b!672677 (=> (not res!439277) (not e!384237))))

(assert (=> b!672677 (= res!439277 (not (contains!3424 lt!312343 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60180 res!439273) b!672662))

(assert (= (and b!672662 res!439275) b!672653))

(assert (= (and b!672653 res!439261) b!672655))

(assert (= (and b!672655 res!439266) b!672675))

(assert (= (and b!672675 res!439274) b!672670))

(assert (= (and b!672675 (not res!439278)) b!672661))

(assert (= (and b!672661 res!439270) b!672654))

(assert (= (and b!672675 res!439272) b!672668))

(assert (= (and b!672668 res!439268) b!672664))

(assert (= (and b!672664 res!439279) b!672656))

(assert (= (and b!672656 res!439262) b!672659))

(assert (= (and b!672659 res!439260) b!672667))

(assert (= (and b!672667 res!439271) b!672673))

(assert (= (and b!672673 res!439263) b!672672))

(assert (= (and b!672672 res!439267) b!672663))

(assert (= (and b!672663 c!77063) b!672657))

(assert (= (and b!672663 (not c!77063)) b!672671))

(assert (= (and b!672663 res!439265) b!672652))

(assert (= (and b!672652 res!439280) b!672666))

(assert (= (and b!672666 res!439264) b!672665))

(assert (= (and b!672665 res!439276) b!672677))

(assert (= (and b!672677 res!439277) b!672676))

(assert (= (and b!672676 res!439281) b!672674))

(assert (= (and b!672676 (not res!439283)) b!672669))

(assert (= (and b!672669 res!439282) b!672658))

(assert (= (and b!672676 res!439269) b!672660))

(declare-fun m!641505 () Bool)

(assert (=> b!672655 m!641505))

(declare-fun m!641507 () Bool)

(assert (=> b!672663 m!641507))

(declare-fun m!641509 () Bool)

(assert (=> b!672674 m!641509))

(declare-fun m!641511 () Bool)

(assert (=> b!672653 m!641511))

(declare-fun m!641513 () Bool)

(assert (=> b!672654 m!641513))

(declare-fun m!641515 () Bool)

(assert (=> b!672677 m!641515))

(declare-fun m!641517 () Bool)

(assert (=> b!672668 m!641517))

(assert (=> b!672672 m!641507))

(assert (=> b!672672 m!641507))

(declare-fun m!641519 () Bool)

(assert (=> b!672672 m!641519))

(declare-fun m!641521 () Bool)

(assert (=> b!672667 m!641521))

(assert (=> b!672652 m!641507))

(assert (=> b!672652 m!641507))

(declare-fun m!641523 () Bool)

(assert (=> b!672652 m!641523))

(declare-fun m!641525 () Bool)

(assert (=> b!672662 m!641525))

(declare-fun m!641527 () Bool)

(assert (=> b!672659 m!641527))

(assert (=> b!672658 m!641509))

(declare-fun m!641529 () Bool)

(assert (=> b!672666 m!641529))

(declare-fun m!641531 () Bool)

(assert (=> b!672664 m!641531))

(assert (=> b!672670 m!641513))

(declare-fun m!641533 () Bool)

(assert (=> b!672657 m!641533))

(declare-fun m!641535 () Bool)

(assert (=> b!672657 m!641535))

(declare-fun m!641537 () Bool)

(assert (=> b!672665 m!641537))

(declare-fun m!641539 () Bool)

(assert (=> start!60180 m!641539))

(declare-fun m!641541 () Bool)

(assert (=> b!672660 m!641541))

(push 1)

