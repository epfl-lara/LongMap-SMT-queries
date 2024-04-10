; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60070 () Bool)

(assert start!60070)

(declare-fun res!436150 () Bool)

(declare-fun e!382793 () Bool)

(assert (=> start!60070 (=> (not res!436150) (not e!382793))))

(declare-datatypes ((array!39117 0))(
  ( (array!39118 (arr!18751 (Array (_ BitVec 32) (_ BitVec 64))) (size!19115 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39117)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60070 (= res!436150 (and (bvslt (size!19115 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19115 a!3626))))))

(assert (=> start!60070 e!382793))

(assert (=> start!60070 true))

(declare-fun array_inv!14547 (array!39117) Bool)

(assert (=> start!60070 (array_inv!14547 a!3626)))

(declare-fun b!669203 () Bool)

(declare-fun e!382797 () Bool)

(declare-datatypes ((List!12792 0))(
  ( (Nil!12789) (Cons!12788 (h!13833 (_ BitVec 64)) (t!19020 List!12792)) )
))
(declare-fun acc!681 () List!12792)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3369 (List!12792 (_ BitVec 64)) Bool)

(assert (=> b!669203 (= e!382797 (contains!3369 acc!681 k0!2843))))

(declare-fun b!669204 () Bool)

(declare-fun e!382795 () Bool)

(declare-fun lt!311528 () List!12792)

(assert (=> b!669204 (= e!382795 (contains!3369 lt!311528 k0!2843))))

(declare-fun b!669205 () Bool)

(declare-fun res!436134 () Bool)

(assert (=> b!669205 (=> (not res!436134) (not e!382793))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669205 (= res!436134 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19115 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669206 () Bool)

(declare-fun res!436131 () Bool)

(declare-fun e!382802 () Bool)

(assert (=> b!669206 (=> res!436131 e!382802)))

(assert (=> b!669206 (= res!436131 (contains!3369 lt!311528 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669207 () Bool)

(declare-fun e!382794 () Bool)

(declare-fun e!382801 () Bool)

(assert (=> b!669207 (= e!382794 e!382801)))

(declare-fun res!436141 () Bool)

(assert (=> b!669207 (=> (not res!436141) (not e!382801))))

(assert (=> b!669207 (= res!436141 (bvsle from!3004 i!1382))))

(declare-fun b!669208 () Bool)

(assert (=> b!669208 (= e!382802 true)))

(declare-fun lt!311527 () Bool)

(declare-fun e!382803 () Bool)

(assert (=> b!669208 (= lt!311527 e!382803)))

(declare-fun res!436137 () Bool)

(assert (=> b!669208 (=> res!436137 e!382803)))

(assert (=> b!669208 (= res!436137 e!382795)))

(declare-fun res!436149 () Bool)

(assert (=> b!669208 (=> (not res!436149) (not e!382795))))

(assert (=> b!669208 (= res!436149 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669209 () Bool)

(declare-fun res!436133 () Bool)

(assert (=> b!669209 (=> (not res!436133) (not e!382793))))

(assert (=> b!669209 (= res!436133 (not (contains!3369 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669210 () Bool)

(declare-fun res!436147 () Bool)

(assert (=> b!669210 (=> (not res!436147) (not e!382793))))

(assert (=> b!669210 (= res!436147 e!382794)))

(declare-fun res!436144 () Bool)

(assert (=> b!669210 (=> res!436144 e!382794)))

(assert (=> b!669210 (= res!436144 e!382797)))

(declare-fun res!436138 () Bool)

(assert (=> b!669210 (=> (not res!436138) (not e!382797))))

(assert (=> b!669210 (= res!436138 (bvsgt from!3004 i!1382))))

(declare-fun b!669211 () Bool)

(assert (=> b!669211 (= e!382793 (not e!382802))))

(declare-fun res!436132 () Bool)

(assert (=> b!669211 (=> res!436132 e!382802)))

(assert (=> b!669211 (= res!436132 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39117 (_ BitVec 32) List!12792) Bool)

(assert (=> b!669211 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311528)))

(declare-datatypes ((Unit!23480 0))(
  ( (Unit!23481) )
))
(declare-fun lt!311524 () Unit!23480)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39117 (_ BitVec 64) (_ BitVec 32) List!12792 List!12792) Unit!23480)

(assert (=> b!669211 (= lt!311524 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311528))))

(declare-fun -!106 (List!12792 (_ BitVec 64)) List!12792)

(assert (=> b!669211 (= (-!106 lt!311528 k0!2843) acc!681)))

(declare-fun $colon$colon!240 (List!12792 (_ BitVec 64)) List!12792)

(assert (=> b!669211 (= lt!311528 ($colon$colon!240 acc!681 k0!2843))))

(declare-fun lt!311531 () Unit!23480)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12792) Unit!23480)

(assert (=> b!669211 (= lt!311531 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!108 (List!12792 List!12792) Bool)

(assert (=> b!669211 (subseq!108 acc!681 acc!681)))

(declare-fun lt!311530 () Unit!23480)

(declare-fun lemmaListSubSeqRefl!0 (List!12792) Unit!23480)

(assert (=> b!669211 (= lt!311530 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669211 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311526 () Unit!23480)

(declare-fun e!382799 () Unit!23480)

(assert (=> b!669211 (= lt!311526 e!382799)))

(declare-fun c!76903 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669211 (= c!76903 (validKeyInArray!0 (select (arr!18751 a!3626) from!3004)))))

(declare-fun lt!311529 () Unit!23480)

(declare-fun e!382798 () Unit!23480)

(assert (=> b!669211 (= lt!311529 e!382798)))

(declare-fun c!76904 () Bool)

(declare-fun arrayContainsKey!0 (array!39117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669211 (= c!76904 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669211 (arrayContainsKey!0 (array!39118 (store (arr!18751 a!3626) i!1382 k0!2843) (size!19115 a!3626)) k0!2843 from!3004)))

(declare-fun b!669212 () Bool)

(declare-fun lt!311532 () Unit!23480)

(assert (=> b!669212 (= e!382799 lt!311532)))

(declare-fun lt!311525 () Unit!23480)

(assert (=> b!669212 (= lt!311525 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669212 (subseq!108 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39117 List!12792 List!12792 (_ BitVec 32)) Unit!23480)

(assert (=> b!669212 (= lt!311532 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!240 acc!681 (select (arr!18751 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669212 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669213 () Bool)

(declare-fun res!436139 () Bool)

(assert (=> b!669213 (=> (not res!436139) (not e!382793))))

(assert (=> b!669213 (= res!436139 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19115 a!3626))))))

(declare-fun b!669214 () Bool)

(declare-fun Unit!23482 () Unit!23480)

(assert (=> b!669214 (= e!382798 Unit!23482)))

(declare-fun lt!311533 () Unit!23480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39117 (_ BitVec 64) (_ BitVec 32)) Unit!23480)

(assert (=> b!669214 (= lt!311533 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!669214 false))

(declare-fun b!669215 () Bool)

(declare-fun Unit!23483 () Unit!23480)

(assert (=> b!669215 (= e!382799 Unit!23483)))

(declare-fun b!669216 () Bool)

(declare-fun res!436151 () Bool)

(assert (=> b!669216 (=> (not res!436151) (not e!382793))))

(assert (=> b!669216 (= res!436151 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12789))))

(declare-fun b!669217 () Bool)

(declare-fun Unit!23484 () Unit!23480)

(assert (=> b!669217 (= e!382798 Unit!23484)))

(declare-fun b!669218 () Bool)

(assert (=> b!669218 (= e!382801 (not (contains!3369 acc!681 k0!2843)))))

(declare-fun b!669219 () Bool)

(declare-fun e!382796 () Bool)

(assert (=> b!669219 (= e!382803 e!382796)))

(declare-fun res!436146 () Bool)

(assert (=> b!669219 (=> (not res!436146) (not e!382796))))

(assert (=> b!669219 (= res!436146 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669220 () Bool)

(declare-fun res!436140 () Bool)

(assert (=> b!669220 (=> (not res!436140) (not e!382793))))

(assert (=> b!669220 (= res!436140 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669221 () Bool)

(declare-fun res!436143 () Bool)

(assert (=> b!669221 (=> (not res!436143) (not e!382793))))

(declare-fun noDuplicate!616 (List!12792) Bool)

(assert (=> b!669221 (= res!436143 (noDuplicate!616 acc!681))))

(declare-fun b!669222 () Bool)

(assert (=> b!669222 (= e!382796 (not (contains!3369 lt!311528 k0!2843)))))

(declare-fun b!669223 () Bool)

(declare-fun res!436142 () Bool)

(assert (=> b!669223 (=> res!436142 e!382802)))

(assert (=> b!669223 (= res!436142 (not (noDuplicate!616 lt!311528)))))

(declare-fun b!669224 () Bool)

(declare-fun res!436145 () Bool)

(assert (=> b!669224 (=> (not res!436145) (not e!382793))))

(assert (=> b!669224 (= res!436145 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669225 () Bool)

(declare-fun res!436135 () Bool)

(assert (=> b!669225 (=> (not res!436135) (not e!382793))))

(assert (=> b!669225 (= res!436135 (not (contains!3369 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669226 () Bool)

(declare-fun res!436136 () Bool)

(assert (=> b!669226 (=> (not res!436136) (not e!382793))))

(assert (=> b!669226 (= res!436136 (validKeyInArray!0 k0!2843))))

(declare-fun b!669227 () Bool)

(declare-fun res!436148 () Bool)

(assert (=> b!669227 (=> res!436148 e!382802)))

(assert (=> b!669227 (= res!436148 (contains!3369 lt!311528 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60070 res!436150) b!669221))

(assert (= (and b!669221 res!436143) b!669209))

(assert (= (and b!669209 res!436133) b!669225))

(assert (= (and b!669225 res!436135) b!669210))

(assert (= (and b!669210 res!436138) b!669203))

(assert (= (and b!669210 (not res!436144)) b!669207))

(assert (= (and b!669207 res!436141) b!669218))

(assert (= (and b!669210 res!436147) b!669216))

(assert (= (and b!669216 res!436151) b!669220))

(assert (= (and b!669220 res!436140) b!669213))

(assert (= (and b!669213 res!436139) b!669226))

(assert (= (and b!669226 res!436136) b!669224))

(assert (= (and b!669224 res!436145) b!669205))

(assert (= (and b!669205 res!436134) b!669211))

(assert (= (and b!669211 c!76904) b!669214))

(assert (= (and b!669211 (not c!76904)) b!669217))

(assert (= (and b!669211 c!76903) b!669212))

(assert (= (and b!669211 (not c!76903)) b!669215))

(assert (= (and b!669211 (not res!436132)) b!669223))

(assert (= (and b!669223 (not res!436142)) b!669227))

(assert (= (and b!669227 (not res!436148)) b!669206))

(assert (= (and b!669206 (not res!436131)) b!669208))

(assert (= (and b!669208 res!436149) b!669204))

(assert (= (and b!669208 (not res!436137)) b!669219))

(assert (= (and b!669219 res!436146) b!669222))

(declare-fun m!639351 () Bool)

(assert (=> b!669209 m!639351))

(declare-fun m!639353 () Bool)

(assert (=> b!669211 m!639353))

(declare-fun m!639355 () Bool)

(assert (=> b!669211 m!639355))

(declare-fun m!639357 () Bool)

(assert (=> b!669211 m!639357))

(declare-fun m!639359 () Bool)

(assert (=> b!669211 m!639359))

(declare-fun m!639361 () Bool)

(assert (=> b!669211 m!639361))

(declare-fun m!639363 () Bool)

(assert (=> b!669211 m!639363))

(declare-fun m!639365 () Bool)

(assert (=> b!669211 m!639365))

(declare-fun m!639367 () Bool)

(assert (=> b!669211 m!639367))

(assert (=> b!669211 m!639355))

(declare-fun m!639369 () Bool)

(assert (=> b!669211 m!639369))

(declare-fun m!639371 () Bool)

(assert (=> b!669211 m!639371))

(declare-fun m!639373 () Bool)

(assert (=> b!669211 m!639373))

(declare-fun m!639375 () Bool)

(assert (=> b!669211 m!639375))

(declare-fun m!639377 () Bool)

(assert (=> b!669211 m!639377))

(declare-fun m!639379 () Bool)

(assert (=> b!669204 m!639379))

(declare-fun m!639381 () Bool)

(assert (=> b!669224 m!639381))

(declare-fun m!639383 () Bool)

(assert (=> b!669203 m!639383))

(assert (=> b!669222 m!639379))

(assert (=> b!669218 m!639383))

(declare-fun m!639385 () Bool)

(assert (=> b!669226 m!639385))

(declare-fun m!639387 () Bool)

(assert (=> b!669227 m!639387))

(declare-fun m!639389 () Bool)

(assert (=> start!60070 m!639389))

(declare-fun m!639391 () Bool)

(assert (=> b!669206 m!639391))

(declare-fun m!639393 () Bool)

(assert (=> b!669221 m!639393))

(declare-fun m!639395 () Bool)

(assert (=> b!669216 m!639395))

(declare-fun m!639397 () Bool)

(assert (=> b!669220 m!639397))

(declare-fun m!639399 () Bool)

(assert (=> b!669214 m!639399))

(assert (=> b!669212 m!639353))

(assert (=> b!669212 m!639355))

(declare-fun m!639401 () Bool)

(assert (=> b!669212 m!639401))

(declare-fun m!639403 () Bool)

(assert (=> b!669212 m!639403))

(assert (=> b!669212 m!639355))

(assert (=> b!669212 m!639401))

(assert (=> b!669212 m!639361))

(assert (=> b!669212 m!639377))

(declare-fun m!639405 () Bool)

(assert (=> b!669223 m!639405))

(declare-fun m!639407 () Bool)

(assert (=> b!669225 m!639407))

(check-sat (not b!669222) (not b!669223) (not b!669220) (not b!669204) (not b!669209) (not b!669218) (not b!669214) (not b!669227) (not b!669212) (not start!60070) (not b!669224) (not b!669216) (not b!669203) (not b!669221) (not b!669225) (not b!669206) (not b!669226) (not b!669211))
(check-sat)
