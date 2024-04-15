; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60044 () Bool)

(assert start!60044)

(declare-fun b!668382 () Bool)

(declare-fun e!382375 () Bool)

(declare-fun e!382377 () Bool)

(assert (=> b!668382 (= e!382375 e!382377)))

(declare-fun res!435561 () Bool)

(assert (=> b!668382 (=> (not res!435561) (not e!382377))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668382 (= res!435561 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668383 () Bool)

(declare-fun e!382374 () Bool)

(declare-fun e!382379 () Bool)

(assert (=> b!668383 (= e!382374 (not e!382379))))

(declare-fun res!435557 () Bool)

(assert (=> b!668383 (=> res!435557 e!382379)))

(assert (=> b!668383 (= res!435557 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39102 0))(
  ( (array!39103 (arr!18743 (Array (_ BitVec 32) (_ BitVec 64))) (size!19108 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39102)

(declare-datatypes ((List!12823 0))(
  ( (Nil!12820) (Cons!12819 (h!13864 (_ BitVec 64)) (t!19042 List!12823)) )
))
(declare-fun lt!311062 () List!12823)

(declare-fun arrayNoDuplicates!0 (array!39102 (_ BitVec 32) List!12823) Bool)

(assert (=> b!668383 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311062)))

(declare-datatypes ((Unit!23423 0))(
  ( (Unit!23424) )
))
(declare-fun lt!311059 () Unit!23423)

(declare-fun acc!681 () List!12823)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39102 (_ BitVec 64) (_ BitVec 32) List!12823 List!12823) Unit!23423)

(assert (=> b!668383 (= lt!311059 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311062))))

(declare-fun -!99 (List!12823 (_ BitVec 64)) List!12823)

(assert (=> b!668383 (= (-!99 lt!311062 k0!2843) acc!681)))

(declare-fun $colon$colon!232 (List!12823 (_ BitVec 64)) List!12823)

(assert (=> b!668383 (= lt!311062 ($colon$colon!232 acc!681 k0!2843))))

(declare-fun lt!311063 () Unit!23423)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12823) Unit!23423)

(assert (=> b!668383 (= lt!311063 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!101 (List!12823 List!12823) Bool)

(assert (=> b!668383 (subseq!101 acc!681 acc!681)))

(declare-fun lt!311058 () Unit!23423)

(declare-fun lemmaListSubSeqRefl!0 (List!12823) Unit!23423)

(assert (=> b!668383 (= lt!311058 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668383 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311061 () Unit!23423)

(declare-fun e!382376 () Unit!23423)

(assert (=> b!668383 (= lt!311061 e!382376)))

(declare-fun c!76781 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668383 (= c!76781 (validKeyInArray!0 (select (arr!18743 a!3626) from!3004)))))

(declare-fun lt!311060 () Unit!23423)

(declare-fun e!382381 () Unit!23423)

(assert (=> b!668383 (= lt!311060 e!382381)))

(declare-fun c!76782 () Bool)

(declare-fun arrayContainsKey!0 (array!39102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668383 (= c!76782 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668383 (arrayContainsKey!0 (array!39103 (store (arr!18743 a!3626) i!1382 k0!2843) (size!19108 a!3626)) k0!2843 from!3004)))

(declare-fun b!668384 () Bool)

(declare-fun e!382372 () Bool)

(declare-fun contains!3345 (List!12823 (_ BitVec 64)) Bool)

(assert (=> b!668384 (= e!382372 (contains!3345 lt!311062 k0!2843))))

(declare-fun b!668385 () Bool)

(declare-fun res!435573 () Bool)

(assert (=> b!668385 (=> (not res!435573) (not e!382374))))

(declare-fun e!382378 () Bool)

(assert (=> b!668385 (= res!435573 e!382378)))

(declare-fun res!435559 () Bool)

(assert (=> b!668385 (=> res!435559 e!382378)))

(declare-fun e!382380 () Bool)

(assert (=> b!668385 (= res!435559 e!382380)))

(declare-fun res!435554 () Bool)

(assert (=> b!668385 (=> (not res!435554) (not e!382380))))

(assert (=> b!668385 (= res!435554 (bvsgt from!3004 i!1382))))

(declare-fun b!668386 () Bool)

(declare-fun Unit!23425 () Unit!23423)

(assert (=> b!668386 (= e!382381 Unit!23425)))

(declare-fun lt!311066 () Unit!23423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39102 (_ BitVec 64) (_ BitVec 32)) Unit!23423)

(assert (=> b!668386 (= lt!311066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!668386 false))

(declare-fun b!668387 () Bool)

(declare-fun res!435560 () Bool)

(assert (=> b!668387 (=> (not res!435560) (not e!382374))))

(assert (=> b!668387 (= res!435560 (not (contains!3345 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668388 () Bool)

(assert (=> b!668388 (= e!382379 true)))

(declare-fun lt!311067 () Bool)

(assert (=> b!668388 (= lt!311067 e!382375)))

(declare-fun res!435572 () Bool)

(assert (=> b!668388 (=> res!435572 e!382375)))

(assert (=> b!668388 (= res!435572 e!382372)))

(declare-fun res!435567 () Bool)

(assert (=> b!668388 (=> (not res!435567) (not e!382372))))

(assert (=> b!668388 (= res!435567 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668389 () Bool)

(declare-fun res!435570 () Bool)

(assert (=> b!668389 (=> (not res!435570) (not e!382374))))

(declare-fun noDuplicate!614 (List!12823) Bool)

(assert (=> b!668389 (= res!435570 (noDuplicate!614 acc!681))))

(declare-fun b!668390 () Bool)

(declare-fun Unit!23426 () Unit!23423)

(assert (=> b!668390 (= e!382376 Unit!23426)))

(declare-fun b!668391 () Bool)

(declare-fun res!435562 () Bool)

(assert (=> b!668391 (=> (not res!435562) (not e!382374))))

(assert (=> b!668391 (= res!435562 (validKeyInArray!0 k0!2843))))

(declare-fun b!668392 () Bool)

(declare-fun res!435568 () Bool)

(assert (=> b!668392 (=> (not res!435568) (not e!382374))))

(assert (=> b!668392 (= res!435568 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19108 a!3626))))))

(declare-fun b!668393 () Bool)

(declare-fun res!435569 () Bool)

(assert (=> b!668393 (=> res!435569 e!382379)))

(assert (=> b!668393 (= res!435569 (contains!3345 lt!311062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668394 () Bool)

(declare-fun res!435566 () Bool)

(assert (=> b!668394 (=> (not res!435566) (not e!382374))))

(assert (=> b!668394 (= res!435566 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19108 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668395 () Bool)

(declare-fun Unit!23427 () Unit!23423)

(assert (=> b!668395 (= e!382381 Unit!23427)))

(declare-fun b!668396 () Bool)

(declare-fun res!435556 () Bool)

(assert (=> b!668396 (=> (not res!435556) (not e!382374))))

(assert (=> b!668396 (= res!435556 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668397 () Bool)

(declare-fun e!382382 () Bool)

(assert (=> b!668397 (= e!382378 e!382382)))

(declare-fun res!435563 () Bool)

(assert (=> b!668397 (=> (not res!435563) (not e!382382))))

(assert (=> b!668397 (= res!435563 (bvsle from!3004 i!1382))))

(declare-fun res!435564 () Bool)

(assert (=> start!60044 (=> (not res!435564) (not e!382374))))

(assert (=> start!60044 (= res!435564 (and (bvslt (size!19108 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19108 a!3626))))))

(assert (=> start!60044 e!382374))

(assert (=> start!60044 true))

(declare-fun array_inv!14626 (array!39102) Bool)

(assert (=> start!60044 (array_inv!14626 a!3626)))

(declare-fun b!668398 () Bool)

(declare-fun res!435565 () Bool)

(assert (=> b!668398 (=> (not res!435565) (not e!382374))))

(assert (=> b!668398 (= res!435565 (not (contains!3345 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668399 () Bool)

(declare-fun res!435574 () Bool)

(assert (=> b!668399 (=> (not res!435574) (not e!382374))))

(assert (=> b!668399 (= res!435574 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12820))))

(declare-fun b!668400 () Bool)

(assert (=> b!668400 (= e!382382 (not (contains!3345 acc!681 k0!2843)))))

(declare-fun b!668401 () Bool)

(declare-fun res!435555 () Bool)

(assert (=> b!668401 (=> res!435555 e!382379)))

(assert (=> b!668401 (= res!435555 (contains!3345 lt!311062 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668402 () Bool)

(assert (=> b!668402 (= e!382377 (not (contains!3345 lt!311062 k0!2843)))))

(declare-fun b!668403 () Bool)

(assert (=> b!668403 (= e!382380 (contains!3345 acc!681 k0!2843))))

(declare-fun b!668404 () Bool)

(declare-fun res!435571 () Bool)

(assert (=> b!668404 (=> res!435571 e!382379)))

(assert (=> b!668404 (= res!435571 (not (noDuplicate!614 lt!311062)))))

(declare-fun b!668405 () Bool)

(declare-fun res!435558 () Bool)

(assert (=> b!668405 (=> (not res!435558) (not e!382374))))

(assert (=> b!668405 (= res!435558 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668406 () Bool)

(declare-fun lt!311064 () Unit!23423)

(assert (=> b!668406 (= e!382376 lt!311064)))

(declare-fun lt!311065 () Unit!23423)

(assert (=> b!668406 (= lt!311065 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668406 (subseq!101 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39102 List!12823 List!12823 (_ BitVec 32)) Unit!23423)

(assert (=> b!668406 (= lt!311064 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!232 acc!681 (select (arr!18743 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668406 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60044 res!435564) b!668389))

(assert (= (and b!668389 res!435570) b!668398))

(assert (= (and b!668398 res!435565) b!668387))

(assert (= (and b!668387 res!435560) b!668385))

(assert (= (and b!668385 res!435554) b!668403))

(assert (= (and b!668385 (not res!435559)) b!668397))

(assert (= (and b!668397 res!435563) b!668400))

(assert (= (and b!668385 res!435573) b!668399))

(assert (= (and b!668399 res!435574) b!668396))

(assert (= (and b!668396 res!435556) b!668392))

(assert (= (and b!668392 res!435568) b!668391))

(assert (= (and b!668391 res!435562) b!668405))

(assert (= (and b!668405 res!435558) b!668394))

(assert (= (and b!668394 res!435566) b!668383))

(assert (= (and b!668383 c!76782) b!668386))

(assert (= (and b!668383 (not c!76782)) b!668395))

(assert (= (and b!668383 c!76781) b!668406))

(assert (= (and b!668383 (not c!76781)) b!668390))

(assert (= (and b!668383 (not res!435557)) b!668404))

(assert (= (and b!668404 (not res!435571)) b!668393))

(assert (= (and b!668393 (not res!435569)) b!668401))

(assert (= (and b!668401 (not res!435555)) b!668388))

(assert (= (and b!668388 res!435567) b!668384))

(assert (= (and b!668388 (not res!435572)) b!668382))

(assert (= (and b!668382 res!435561) b!668402))

(declare-fun m!638163 () Bool)

(assert (=> b!668405 m!638163))

(declare-fun m!638165 () Bool)

(assert (=> b!668391 m!638165))

(declare-fun m!638167 () Bool)

(assert (=> b!668402 m!638167))

(declare-fun m!638169 () Bool)

(assert (=> b!668386 m!638169))

(declare-fun m!638171 () Bool)

(assert (=> start!60044 m!638171))

(declare-fun m!638173 () Bool)

(assert (=> b!668387 m!638173))

(declare-fun m!638175 () Bool)

(assert (=> b!668400 m!638175))

(declare-fun m!638177 () Bool)

(assert (=> b!668398 m!638177))

(declare-fun m!638179 () Bool)

(assert (=> b!668404 m!638179))

(declare-fun m!638181 () Bool)

(assert (=> b!668396 m!638181))

(declare-fun m!638183 () Bool)

(assert (=> b!668383 m!638183))

(declare-fun m!638185 () Bool)

(assert (=> b!668383 m!638185))

(declare-fun m!638187 () Bool)

(assert (=> b!668383 m!638187))

(declare-fun m!638189 () Bool)

(assert (=> b!668383 m!638189))

(declare-fun m!638191 () Bool)

(assert (=> b!668383 m!638191))

(declare-fun m!638193 () Bool)

(assert (=> b!668383 m!638193))

(declare-fun m!638195 () Bool)

(assert (=> b!668383 m!638195))

(declare-fun m!638197 () Bool)

(assert (=> b!668383 m!638197))

(assert (=> b!668383 m!638187))

(declare-fun m!638199 () Bool)

(assert (=> b!668383 m!638199))

(declare-fun m!638201 () Bool)

(assert (=> b!668383 m!638201))

(declare-fun m!638203 () Bool)

(assert (=> b!668383 m!638203))

(declare-fun m!638205 () Bool)

(assert (=> b!668383 m!638205))

(declare-fun m!638207 () Bool)

(assert (=> b!668383 m!638207))

(declare-fun m!638209 () Bool)

(assert (=> b!668399 m!638209))

(declare-fun m!638211 () Bool)

(assert (=> b!668401 m!638211))

(declare-fun m!638213 () Bool)

(assert (=> b!668389 m!638213))

(declare-fun m!638215 () Bool)

(assert (=> b!668393 m!638215))

(assert (=> b!668403 m!638175))

(assert (=> b!668406 m!638185))

(assert (=> b!668406 m!638187))

(declare-fun m!638217 () Bool)

(assert (=> b!668406 m!638217))

(declare-fun m!638219 () Bool)

(assert (=> b!668406 m!638219))

(assert (=> b!668406 m!638187))

(assert (=> b!668406 m!638217))

(assert (=> b!668406 m!638193))

(assert (=> b!668406 m!638207))

(assert (=> b!668384 m!638167))

(check-sat (not b!668384) (not b!668402) (not b!668398) (not b!668405) (not b!668389) (not b!668404) (not b!668391) (not start!60044) (not b!668403) (not b!668396) (not b!668400) (not b!668406) (not b!668401) (not b!668387) (not b!668386) (not b!668393) (not b!668383) (not b!668399))
(check-sat)
