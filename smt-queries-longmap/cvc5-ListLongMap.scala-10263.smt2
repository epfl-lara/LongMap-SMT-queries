; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120630 () Bool)

(assert start!120630)

(declare-fun b!1404457 () Bool)

(declare-fun res!942969 () Bool)

(declare-fun e!795047 () Bool)

(assert (=> b!1404457 (=> (not res!942969) (not e!795047))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96039 0))(
  ( (array!96040 (arr!46370 (Array (_ BitVec 32) (_ BitVec 64))) (size!46920 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96039)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404457 (= res!942969 (and (= (size!46920 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46920 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46920 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404458 () Bool)

(declare-fun res!942971 () Bool)

(assert (=> b!1404458 (=> (not res!942971) (not e!795047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404458 (= res!942971 (validKeyInArray!0 (select (arr!46370 a!2901) j!112)))))

(declare-fun res!942970 () Bool)

(assert (=> start!120630 (=> (not res!942970) (not e!795047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120630 (= res!942970 (validMask!0 mask!2840))))

(assert (=> start!120630 e!795047))

(assert (=> start!120630 true))

(declare-fun array_inv!35398 (array!96039) Bool)

(assert (=> start!120630 (array_inv!35398 a!2901)))

(declare-fun b!1404459 () Bool)

(declare-datatypes ((SeekEntryResult!10681 0))(
  ( (MissingZero!10681 (index!45101 (_ BitVec 32))) (Found!10681 (index!45102 (_ BitVec 32))) (Intermediate!10681 (undefined!11493 Bool) (index!45103 (_ BitVec 32)) (x!126716 (_ BitVec 32))) (Undefined!10681) (MissingVacant!10681 (index!45104 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96039 (_ BitVec 32)) SeekEntryResult!10681)

(assert (=> b!1404459 (= e!795047 (not (= (seekEntryOrOpen!0 (select (arr!46370 a!2901) j!112) a!2901 mask!2840) (Found!10681 j!112))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96039 (_ BitVec 32)) Bool)

(assert (=> b!1404459 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47336 0))(
  ( (Unit!47337) )
))
(declare-fun lt!618660 () Unit!47336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47336)

(assert (=> b!1404459 (= lt!618660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618659 () SeekEntryResult!10681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96039 (_ BitVec 32)) SeekEntryResult!10681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404459 (= lt!618659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) (select (arr!46370 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404460 () Bool)

(declare-fun res!942968 () Bool)

(assert (=> b!1404460 (=> (not res!942968) (not e!795047))))

(assert (=> b!1404460 (= res!942968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404461 () Bool)

(declare-fun res!942972 () Bool)

(assert (=> b!1404461 (=> (not res!942972) (not e!795047))))

(assert (=> b!1404461 (= res!942972 (validKeyInArray!0 (select (arr!46370 a!2901) i!1037)))))

(declare-fun b!1404462 () Bool)

(declare-fun res!942973 () Bool)

(assert (=> b!1404462 (=> (not res!942973) (not e!795047))))

(declare-datatypes ((List!32889 0))(
  ( (Nil!32886) (Cons!32885 (h!34133 (_ BitVec 64)) (t!47583 List!32889)) )
))
(declare-fun arrayNoDuplicates!0 (array!96039 (_ BitVec 32) List!32889) Bool)

(assert (=> b!1404462 (= res!942973 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32886))))

(assert (= (and start!120630 res!942970) b!1404457))

(assert (= (and b!1404457 res!942969) b!1404461))

(assert (= (and b!1404461 res!942972) b!1404458))

(assert (= (and b!1404458 res!942971) b!1404460))

(assert (= (and b!1404460 res!942968) b!1404462))

(assert (= (and b!1404462 res!942973) b!1404459))

(declare-fun m!1293309 () Bool)

(assert (=> b!1404460 m!1293309))

(declare-fun m!1293311 () Bool)

(assert (=> b!1404459 m!1293311))

(declare-fun m!1293313 () Bool)

(assert (=> b!1404459 m!1293313))

(assert (=> b!1404459 m!1293311))

(declare-fun m!1293315 () Bool)

(assert (=> b!1404459 m!1293315))

(assert (=> b!1404459 m!1293311))

(declare-fun m!1293317 () Bool)

(assert (=> b!1404459 m!1293317))

(assert (=> b!1404459 m!1293313))

(assert (=> b!1404459 m!1293311))

(declare-fun m!1293319 () Bool)

(assert (=> b!1404459 m!1293319))

(declare-fun m!1293321 () Bool)

(assert (=> b!1404459 m!1293321))

(declare-fun m!1293323 () Bool)

(assert (=> b!1404461 m!1293323))

(assert (=> b!1404461 m!1293323))

(declare-fun m!1293325 () Bool)

(assert (=> b!1404461 m!1293325))

(declare-fun m!1293327 () Bool)

(assert (=> start!120630 m!1293327))

(declare-fun m!1293329 () Bool)

(assert (=> start!120630 m!1293329))

(declare-fun m!1293331 () Bool)

(assert (=> b!1404462 m!1293331))

(assert (=> b!1404458 m!1293311))

(assert (=> b!1404458 m!1293311))

(declare-fun m!1293333 () Bool)

(assert (=> b!1404458 m!1293333))

(push 1)

(assert (not b!1404460))

(assert (not b!1404461))

(assert (not start!120630))

(assert (not b!1404459))

(assert (not b!1404458))

(assert (not b!1404462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1404507 () Bool)

(declare-fun e!795068 () Bool)

(declare-fun e!795066 () Bool)

(assert (=> b!1404507 (= e!795068 e!795066)))

(declare-fun lt!618679 () (_ BitVec 64))

(assert (=> b!1404507 (= lt!618679 (select (arr!46370 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618681 () Unit!47336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96039 (_ BitVec 64) (_ BitVec 32)) Unit!47336)

(assert (=> b!1404507 (= lt!618681 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618679 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404507 (arrayContainsKey!0 a!2901 lt!618679 #b00000000000000000000000000000000)))

(declare-fun lt!618680 () Unit!47336)

(assert (=> b!1404507 (= lt!618680 lt!618681)))

(declare-fun res!943015 () Bool)

(assert (=> b!1404507 (= res!943015 (= (seekEntryOrOpen!0 (select (arr!46370 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10681 #b00000000000000000000000000000000)))))

(assert (=> b!1404507 (=> (not res!943015) (not e!795066))))

(declare-fun bm!66907 () Bool)

(declare-fun call!66910 () Bool)

(assert (=> bm!66907 (= call!66910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404508 () Bool)

(declare-fun e!795067 () Bool)

(assert (=> b!1404508 (= e!795067 e!795068)))

(declare-fun c!130206 () Bool)

(assert (=> b!1404508 (= c!130206 (validKeyInArray!0 (select (arr!46370 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404509 () Bool)

(assert (=> b!1404509 (= e!795066 call!66910)))

(declare-fun d!151249 () Bool)

(declare-fun res!943014 () Bool)

(assert (=> d!151249 (=> res!943014 e!795067)))

(assert (=> d!151249 (= res!943014 (bvsge #b00000000000000000000000000000000 (size!46920 a!2901)))))

(assert (=> d!151249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795067)))

(declare-fun b!1404510 () Bool)

(assert (=> b!1404510 (= e!795068 call!66910)))

(assert (= (and d!151249 (not res!943014)) b!1404508))

(assert (= (and b!1404508 c!130206) b!1404507))

(assert (= (and b!1404508 (not c!130206)) b!1404510))

(assert (= (and b!1404507 res!943015) b!1404509))

(assert (= (or b!1404509 b!1404510) bm!66907))

(declare-fun m!1293387 () Bool)

(assert (=> b!1404507 m!1293387))

(declare-fun m!1293389 () Bool)

(assert (=> b!1404507 m!1293389))

(declare-fun m!1293391 () Bool)

(assert (=> b!1404507 m!1293391))

(assert (=> b!1404507 m!1293387))

(declare-fun m!1293393 () Bool)

(assert (=> b!1404507 m!1293393))

(declare-fun m!1293395 () Bool)

(assert (=> bm!66907 m!1293395))

(assert (=> b!1404508 m!1293387))

(assert (=> b!1404508 m!1293387))

(declare-fun m!1293397 () Bool)

(assert (=> b!1404508 m!1293397))

(assert (=> b!1404460 d!151249))

(declare-fun d!151255 () Bool)

(assert (=> d!151255 (= (validKeyInArray!0 (select (arr!46370 a!2901) i!1037)) (and (not (= (select (arr!46370 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46370 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404461 d!151255))

(declare-fun e!795115 () SeekEntryResult!10681)

(declare-fun b!1404583 () Bool)

(assert (=> b!1404583 (= e!795115 (Intermediate!10681 true (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151261 () Bool)

(declare-fun e!795117 () Bool)

(assert (=> d!151261 e!795117))

(declare-fun c!130230 () Bool)

(declare-fun lt!618702 () SeekEntryResult!10681)

(assert (=> d!151261 (= c!130230 (and (is-Intermediate!10681 lt!618702) (undefined!11493 lt!618702)))))

(assert (=> d!151261 (= lt!618702 e!795115)))

(declare-fun c!130228 () Bool)

(assert (=> d!151261 (= c!130228 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!618701 () (_ BitVec 64))

(assert (=> d!151261 (= lt!618701 (select (arr!46370 a!2901) (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840)))))

(assert (=> d!151261 (validMask!0 mask!2840)))

(assert (=> d!151261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) (select (arr!46370 a!2901) j!112) a!2901 mask!2840) lt!618702)))

(declare-fun b!1404584 () Bool)

(assert (=> b!1404584 (and (bvsge (index!45103 lt!618702) #b00000000000000000000000000000000) (bvslt (index!45103 lt!618702) (size!46920 a!2901)))))

(declare-fun res!943047 () Bool)

(assert (=> b!1404584 (= res!943047 (= (select (arr!46370 a!2901) (index!45103 lt!618702)) (select (arr!46370 a!2901) j!112)))))

(declare-fun e!795116 () Bool)

(assert (=> b!1404584 (=> res!943047 e!795116)))

(declare-fun e!795118 () Bool)

(assert (=> b!1404584 (= e!795118 e!795116)))

(declare-fun b!1404585 () Bool)

(assert (=> b!1404585 (= e!795117 (bvsge (x!126716 lt!618702) #b01111111111111111111111111111110))))

(declare-fun b!1404586 () Bool)

(assert (=> b!1404586 (and (bvsge (index!45103 lt!618702) #b00000000000000000000000000000000) (bvslt (index!45103 lt!618702) (size!46920 a!2901)))))

(assert (=> b!1404586 (= e!795116 (= (select (arr!46370 a!2901) (index!45103 lt!618702)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404587 () Bool)

(declare-fun e!795119 () SeekEntryResult!10681)

(assert (=> b!1404587 (= e!795115 e!795119)))

(declare-fun c!130229 () Bool)

(assert (=> b!1404587 (= c!130229 (or (= lt!618701 (select (arr!46370 a!2901) j!112)) (= (bvadd lt!618701 lt!618701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404588 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404588 (= e!795119 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46370 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404589 () Bool)

(assert (=> b!1404589 (and (bvsge (index!45103 lt!618702) #b00000000000000000000000000000000) (bvslt (index!45103 lt!618702) (size!46920 a!2901)))))

(declare-fun res!943046 () Bool)

(assert (=> b!1404589 (= res!943046 (= (select (arr!46370 a!2901) (index!45103 lt!618702)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404589 (=> res!943046 e!795116)))

(declare-fun b!1404590 () Bool)

(assert (=> b!1404590 (= e!795119 (Intermediate!10681 false (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404591 () Bool)

(assert (=> b!1404591 (= e!795117 e!795118)))

(declare-fun res!943048 () Bool)

(assert (=> b!1404591 (= res!943048 (and (is-Intermediate!10681 lt!618702) (not (undefined!11493 lt!618702)) (bvslt (x!126716 lt!618702) #b01111111111111111111111111111110) (bvsge (x!126716 lt!618702) #b00000000000000000000000000000000) (bvsge (x!126716 lt!618702) #b00000000000000000000000000000000)))))

(assert (=> b!1404591 (=> (not res!943048) (not e!795118))))

(assert (= (and d!151261 c!130228) b!1404583))

(assert (= (and d!151261 (not c!130228)) b!1404587))

(assert (= (and b!1404587 c!130229) b!1404590))

(assert (= (and b!1404587 (not c!130229)) b!1404588))

(assert (= (and d!151261 c!130230) b!1404585))

(assert (= (and d!151261 (not c!130230)) b!1404591))

(assert (= (and b!1404591 res!943048) b!1404584))

(assert (= (and b!1404584 (not res!943047)) b!1404589))

(assert (= (and b!1404589 (not res!943046)) b!1404586))

(declare-fun m!1293421 () Bool)

(assert (=> b!1404586 m!1293421))

(assert (=> b!1404589 m!1293421))

(assert (=> b!1404588 m!1293313))

(declare-fun m!1293425 () Bool)

(assert (=> b!1404588 m!1293425))

(assert (=> b!1404588 m!1293425))

(assert (=> b!1404588 m!1293311))

(declare-fun m!1293427 () Bool)

(assert (=> b!1404588 m!1293427))

(assert (=> b!1404584 m!1293421))

(assert (=> d!151261 m!1293313))

(declare-fun m!1293429 () Bool)

(assert (=> d!151261 m!1293429))

(assert (=> d!151261 m!1293327))

(assert (=> b!1404459 d!151261))

(declare-fun d!151271 () Bool)

(declare-fun lt!618723 () SeekEntryResult!10681)

(assert (=> d!151271 (and (or (is-Undefined!10681 lt!618723) (not (is-Found!10681 lt!618723)) (and (bvsge (index!45102 lt!618723) #b00000000000000000000000000000000) (bvslt (index!45102 lt!618723) (size!46920 a!2901)))) (or (is-Undefined!10681 lt!618723) (is-Found!10681 lt!618723) (not (is-MissingZero!10681 lt!618723)) (and (bvsge (index!45101 lt!618723) #b00000000000000000000000000000000) (bvslt (index!45101 lt!618723) (size!46920 a!2901)))) (or (is-Undefined!10681 lt!618723) (is-Found!10681 lt!618723) (is-MissingZero!10681 lt!618723) (not (is-MissingVacant!10681 lt!618723)) (and (bvsge (index!45104 lt!618723) #b00000000000000000000000000000000) (bvslt (index!45104 lt!618723) (size!46920 a!2901)))) (or (is-Undefined!10681 lt!618723) (ite (is-Found!10681 lt!618723) (= (select (arr!46370 a!2901) (index!45102 lt!618723)) (select (arr!46370 a!2901) j!112)) (ite (is-MissingZero!10681 lt!618723) (= (select (arr!46370 a!2901) (index!45101 lt!618723)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10681 lt!618723) (= (select (arr!46370 a!2901) (index!45104 lt!618723)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!795147 () SeekEntryResult!10681)

(assert (=> d!151271 (= lt!618723 e!795147)))

(declare-fun c!130254 () Bool)

(declare-fun lt!618724 () SeekEntryResult!10681)

(assert (=> d!151271 (= c!130254 (and (is-Intermediate!10681 lt!618724) (undefined!11493 lt!618724)))))

(assert (=> d!151271 (= lt!618724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) (select (arr!46370 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151271 (validMask!0 mask!2840)))

(assert (=> d!151271 (= (seekEntryOrOpen!0 (select (arr!46370 a!2901) j!112) a!2901 mask!2840) lt!618723)))

(declare-fun e!795146 () SeekEntryResult!10681)

(declare-fun b!1404640 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96039 (_ BitVec 32)) SeekEntryResult!10681)

(assert (=> b!1404640 (= e!795146 (seekKeyOrZeroReturnVacant!0 (x!126716 lt!618724) (index!45103 lt!618724) (index!45103 lt!618724) (select (arr!46370 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404641 () Bool)

(declare-fun e!795145 () SeekEntryResult!10681)

(assert (=> b!1404641 (= e!795145 (Found!10681 (index!45103 lt!618724)))))

(declare-fun b!1404642 () Bool)

(declare-fun c!130252 () Bool)

(declare-fun lt!618722 () (_ BitVec 64))

(assert (=> b!1404642 (= c!130252 (= lt!618722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404642 (= e!795145 e!795146)))

(declare-fun b!1404643 () Bool)

(assert (=> b!1404643 (= e!795147 Undefined!10681)))

(declare-fun b!1404644 () Bool)

(assert (=> b!1404644 (= e!795146 (MissingZero!10681 (index!45103 lt!618724)))))

(declare-fun b!1404645 () Bool)

(assert (=> b!1404645 (= e!795147 e!795145)))

(assert (=> b!1404645 (= lt!618722 (select (arr!46370 a!2901) (index!45103 lt!618724)))))

(declare-fun c!130253 () Bool)

(assert (=> b!1404645 (= c!130253 (= lt!618722 (select (arr!46370 a!2901) j!112)))))

(assert (= (and d!151271 c!130254) b!1404643))

(assert (= (and d!151271 (not c!130254)) b!1404645))

(assert (= (and b!1404645 c!130253) b!1404641))

(assert (= (and b!1404645 (not c!130253)) b!1404642))

(assert (= (and b!1404642 c!130252) b!1404644))

(assert (= (and b!1404642 (not c!130252)) b!1404640))

(assert (=> d!151271 m!1293327))

(assert (=> d!151271 m!1293311))

(assert (=> d!151271 m!1293313))

(assert (=> d!151271 m!1293313))

(assert (=> d!151271 m!1293311))

(assert (=> d!151271 m!1293319))

(declare-fun m!1293441 () Bool)

(assert (=> d!151271 m!1293441))

(declare-fun m!1293443 () Bool)

(assert (=> d!151271 m!1293443))

(declare-fun m!1293445 () Bool)

(assert (=> d!151271 m!1293445))

(assert (=> b!1404640 m!1293311))

(declare-fun m!1293447 () Bool)

(assert (=> b!1404640 m!1293447))

(declare-fun m!1293449 () Bool)

(assert (=> b!1404645 m!1293449))

(assert (=> b!1404459 d!151271))

(declare-fun d!151279 () Bool)

(assert (=> d!151279 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618732 () Unit!47336)

(declare-fun choose!38 (array!96039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47336)

(assert (=> d!151279 (= lt!618732 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151279 (validMask!0 mask!2840)))

(assert (=> d!151279 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618732)))

(declare-fun bs!40923 () Bool)

(assert (= bs!40923 d!151279))

(assert (=> bs!40923 m!1293321))

(declare-fun m!1293461 () Bool)

(assert (=> bs!40923 m!1293461))

(assert (=> bs!40923 m!1293327))

(assert (=> b!1404459 d!151279))

(declare-fun d!151285 () Bool)

(declare-fun lt!618744 () (_ BitVec 32))

(declare-fun lt!618743 () (_ BitVec 32))

(assert (=> d!151285 (= lt!618744 (bvmul (bvxor lt!618743 (bvlshr lt!618743 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151285 (= lt!618743 ((_ extract 31 0) (bvand (bvxor (select (arr!46370 a!2901) j!112) (bvlshr (select (arr!46370 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151285 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943059 (let ((h!34137 ((_ extract 31 0) (bvand (bvxor (select (arr!46370 a!2901) j!112) (bvlshr (select (arr!46370 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126723 (bvmul (bvxor h!34137 (bvlshr h!34137 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126723 (bvlshr x!126723 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943059 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943059 #b00000000000000000000000000000000))))))

(assert (=> d!151285 (= (toIndex!0 (select (arr!46370 a!2901) j!112) mask!2840) (bvand (bvxor lt!618744 (bvlshr lt!618744 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404459 d!151285))

(declare-fun b!1404655 () Bool)

(declare-fun e!795155 () Bool)

(declare-fun e!795153 () Bool)

(assert (=> b!1404655 (= e!795155 e!795153)))

(declare-fun lt!618745 () (_ BitVec 64))

(assert (=> b!1404655 (= lt!618745 (select (arr!46370 a!2901) j!112))))

(declare-fun lt!618747 () Unit!47336)

(assert (=> b!1404655 (= lt!618747 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618745 j!112))))

(assert (=> b!1404655 (arrayContainsKey!0 a!2901 lt!618745 #b00000000000000000000000000000000)))

(declare-fun lt!618746 () Unit!47336)

(assert (=> b!1404655 (= lt!618746 lt!618747)))

(declare-fun res!943061 () Bool)

(assert (=> b!1404655 (= res!943061 (= (seekEntryOrOpen!0 (select (arr!46370 a!2901) j!112) a!2901 mask!2840) (Found!10681 j!112)))))

(assert (=> b!1404655 (=> (not res!943061) (not e!795153))))

(declare-fun call!66917 () Bool)

(declare-fun bm!66914 () Bool)

(assert (=> bm!66914 (= call!66917 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1404656 () Bool)

(declare-fun e!795154 () Bool)

(assert (=> b!1404656 (= e!795154 e!795155)))

(declare-fun c!130258 () Bool)

(assert (=> b!1404656 (= c!130258 (validKeyInArray!0 (select (arr!46370 a!2901) j!112)))))

(declare-fun b!1404657 () Bool)

(assert (=> b!1404657 (= e!795153 call!66917)))

(declare-fun d!151289 () Bool)

(declare-fun res!943060 () Bool)

(assert (=> d!151289 (=> res!943060 e!795154)))

(assert (=> d!151289 (= res!943060 (bvsge j!112 (size!46920 a!2901)))))

(assert (=> d!151289 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795154)))

(declare-fun b!1404658 () Bool)

(assert (=> b!1404658 (= e!795155 call!66917)))

(assert (= (and d!151289 (not res!943060)) b!1404656))

(assert (= (and b!1404656 c!130258) b!1404655))

(assert (= (and b!1404656 (not c!130258)) b!1404658))

(assert (= (and b!1404655 res!943061) b!1404657))

(assert (= (or b!1404657 b!1404658) bm!66914))

(assert (=> b!1404655 m!1293311))

(declare-fun m!1293463 () Bool)

(assert (=> b!1404655 m!1293463))

(declare-fun m!1293465 () Bool)

(assert (=> b!1404655 m!1293465))

(assert (=> b!1404655 m!1293311))

(assert (=> b!1404655 m!1293317))

(declare-fun m!1293467 () Bool)

(assert (=> bm!66914 m!1293467))

(assert (=> b!1404656 m!1293311))

(assert (=> b!1404656 m!1293311))

(assert (=> b!1404656 m!1293333))

(assert (=> b!1404459 d!151289))

(declare-fun d!151291 () Bool)

(assert (=> d!151291 (= (validKeyInArray!0 (select (arr!46370 a!2901) j!112)) (and (not (= (select (arr!46370 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46370 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404458 d!151291))

(declare-fun d!151293 () Bool)

(assert (=> d!151293 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120630 d!151293))

(declare-fun d!151299 () Bool)

(assert (=> d!151299 (= (array_inv!35398 a!2901) (bvsge (size!46920 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120630 d!151299))

(declare-fun bm!66924 () Bool)

(declare-fun call!66927 () Bool)

(declare-fun c!130277 () Bool)

(assert (=> bm!66924 (= call!66927 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130277 (Cons!32885 (select (arr!46370 a!2901) #b00000000000000000000000000000000) Nil!32886) Nil!32886)))))

(declare-fun b!1404718 () Bool)

(declare-fun e!795200 () Bool)

(declare-fun e!795198 () Bool)

(assert (=> b!1404718 (= e!795200 e!795198)))

(declare-fun res!943085 () Bool)

(assert (=> b!1404718 (=> (not res!943085) (not e!795198))))

(declare-fun e!795197 () Bool)

(assert (=> b!1404718 (= res!943085 (not e!795197))))

(declare-fun res!943086 () Bool)

(assert (=> b!1404718 (=> (not res!943086) (not e!795197))))

(assert (=> b!1404718 (= res!943086 (validKeyInArray!0 (select (arr!46370 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404719 () Bool)

(declare-fun e!795199 () Bool)

(assert (=> b!1404719 (= e!795199 call!66927)))

(declare-fun b!1404720 () Bool)

(declare-fun contains!9790 (List!32889 (_ BitVec 64)) Bool)

(assert (=> b!1404720 (= e!795197 (contains!9790 Nil!32886 (select (arr!46370 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404721 () Bool)

(assert (=> b!1404721 (= e!795199 call!66927)))

(declare-fun d!151301 () Bool)

(declare-fun res!943087 () Bool)

(assert (=> d!151301 (=> res!943087 e!795200)))

(assert (=> d!151301 (= res!943087 (bvsge #b00000000000000000000000000000000 (size!46920 a!2901)))))

(assert (=> d!151301 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32886) e!795200)))

(declare-fun b!1404722 () Bool)

(assert (=> b!1404722 (= e!795198 e!795199)))

(assert (=> b!1404722 (= c!130277 (validKeyInArray!0 (select (arr!46370 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151301 (not res!943087)) b!1404718))

(assert (= (and b!1404718 res!943086) b!1404720))

(assert (= (and b!1404718 res!943085) b!1404722))

(assert (= (and b!1404722 c!130277) b!1404721))

(assert (= (and b!1404722 (not c!130277)) b!1404719))

(assert (= (or b!1404721 b!1404719) bm!66924))

(assert (=> bm!66924 m!1293387))

(declare-fun m!1293501 () Bool)

(assert (=> bm!66924 m!1293501))

(assert (=> b!1404718 m!1293387))

(assert (=> b!1404718 m!1293387))

(assert (=> b!1404718 m!1293397))

(assert (=> b!1404720 m!1293387))

(assert (=> b!1404720 m!1293387))

(declare-fun m!1293505 () Bool)

(assert (=> b!1404720 m!1293505))

(assert (=> b!1404722 m!1293387))

(assert (=> b!1404722 m!1293387))

(assert (=> b!1404722 m!1293397))

(assert (=> b!1404462 d!151301))

(push 1)

(assert (not d!151279))

(assert (not b!1404640))

(assert (not b!1404508))

(assert (not bm!66907))

(assert (not bm!66914))

(assert (not b!1404718))

(assert (not b!1404722))

(assert (not b!1404656))

(assert (not b!1404507))

(assert (not b!1404720))

(assert (not d!151261))

(assert (not bm!66924))

(assert (not b!1404588))

(assert (not b!1404655))

(assert (not d!151271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

