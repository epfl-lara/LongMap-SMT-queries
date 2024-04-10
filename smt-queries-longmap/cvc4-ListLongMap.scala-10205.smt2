; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120220 () Bool)

(assert start!120220)

(declare-fun b!1399401 () Bool)

(declare-fun res!938154 () Bool)

(declare-fun e!792252 () Bool)

(assert (=> b!1399401 (=> (not res!938154) (not e!792252))))

(declare-datatypes ((array!95692 0))(
  ( (array!95693 (arr!46198 (Array (_ BitVec 32) (_ BitVec 64))) (size!46748 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95692)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399401 (= res!938154 (validKeyInArray!0 (select (arr!46198 a!2901) j!112)))))

(declare-fun b!1399402 () Bool)

(declare-fun e!792250 () Bool)

(declare-fun e!792249 () Bool)

(assert (=> b!1399402 (= e!792250 e!792249)))

(declare-fun res!938151 () Bool)

(assert (=> b!1399402 (=> res!938151 e!792249)))

(declare-datatypes ((SeekEntryResult!10515 0))(
  ( (MissingZero!10515 (index!44434 (_ BitVec 32))) (Found!10515 (index!44435 (_ BitVec 32))) (Intermediate!10515 (undefined!11327 Bool) (index!44436 (_ BitVec 32)) (x!126074 (_ BitVec 32))) (Undefined!10515) (MissingVacant!10515 (index!44437 (_ BitVec 32))) )
))
(declare-fun lt!615533 () SeekEntryResult!10515)

(declare-fun lt!615537 () SeekEntryResult!10515)

(assert (=> b!1399402 (= res!938151 (or (= lt!615533 lt!615537) (not (is-Intermediate!10515 lt!615537))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!615531 () array!95692)

(declare-fun lt!615532 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95692 (_ BitVec 32)) SeekEntryResult!10515)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399402 (= lt!615537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615532 mask!2840) lt!615532 lt!615531 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399402 (= lt!615532 (select (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399402 (= lt!615531 (array!95693 (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46748 a!2901)))))

(declare-fun e!792254 () Bool)

(declare-fun b!1399403 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95692 (_ BitVec 32)) SeekEntryResult!10515)

(assert (=> b!1399403 (= e!792254 (= (seekEntryOrOpen!0 (select (arr!46198 a!2901) j!112) a!2901 mask!2840) (Found!10515 j!112)))))

(declare-fun b!1399404 () Bool)

(assert (=> b!1399404 (= e!792252 (not e!792250))))

(declare-fun res!938156 () Bool)

(assert (=> b!1399404 (=> res!938156 e!792250)))

(assert (=> b!1399404 (= res!938156 (or (not (is-Intermediate!10515 lt!615533)) (undefined!11327 lt!615533)))))

(assert (=> b!1399404 e!792254))

(declare-fun res!938150 () Bool)

(assert (=> b!1399404 (=> (not res!938150) (not e!792254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95692 (_ BitVec 32)) Bool)

(assert (=> b!1399404 (= res!938150 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47034 0))(
  ( (Unit!47035) )
))
(declare-fun lt!615536 () Unit!47034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47034)

(assert (=> b!1399404 (= lt!615536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615534 () (_ BitVec 32))

(assert (=> b!1399404 (= lt!615533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615534 (select (arr!46198 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399404 (= lt!615534 (toIndex!0 (select (arr!46198 a!2901) j!112) mask!2840))))

(declare-fun b!1399405 () Bool)

(declare-fun res!938153 () Bool)

(assert (=> b!1399405 (=> (not res!938153) (not e!792252))))

(assert (=> b!1399405 (= res!938153 (and (= (size!46748 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46748 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46748 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399406 () Bool)

(assert (=> b!1399406 (= e!792249 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun e!792251 () Bool)

(assert (=> b!1399406 e!792251))

(declare-fun res!938157 () Bool)

(assert (=> b!1399406 (=> (not res!938157) (not e!792251))))

(assert (=> b!1399406 (= res!938157 (and (not (undefined!11327 lt!615537)) (= (index!44436 lt!615537) i!1037) (bvslt (x!126074 lt!615537) (x!126074 lt!615533)) (= (select (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44436 lt!615537)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615535 () Unit!47034)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47034)

(assert (=> b!1399406 (= lt!615535 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615534 (x!126074 lt!615533) (index!44436 lt!615533) (x!126074 lt!615537) (index!44436 lt!615537) (undefined!11327 lt!615537) mask!2840))))

(declare-fun res!938155 () Bool)

(assert (=> start!120220 (=> (not res!938155) (not e!792252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120220 (= res!938155 (validMask!0 mask!2840))))

(assert (=> start!120220 e!792252))

(assert (=> start!120220 true))

(declare-fun array_inv!35226 (array!95692) Bool)

(assert (=> start!120220 (array_inv!35226 a!2901)))

(declare-fun b!1399407 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95692 (_ BitVec 32)) SeekEntryResult!10515)

(assert (=> b!1399407 (= e!792251 (= (seekEntryOrOpen!0 lt!615532 lt!615531 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126074 lt!615537) (index!44436 lt!615537) (index!44436 lt!615537) (select (arr!46198 a!2901) j!112) lt!615531 mask!2840)))))

(declare-fun b!1399408 () Bool)

(declare-fun res!938149 () Bool)

(assert (=> b!1399408 (=> (not res!938149) (not e!792252))))

(assert (=> b!1399408 (= res!938149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399409 () Bool)

(declare-fun res!938152 () Bool)

(assert (=> b!1399409 (=> (not res!938152) (not e!792252))))

(assert (=> b!1399409 (= res!938152 (validKeyInArray!0 (select (arr!46198 a!2901) i!1037)))))

(declare-fun b!1399410 () Bool)

(declare-fun res!938158 () Bool)

(assert (=> b!1399410 (=> (not res!938158) (not e!792252))))

(declare-datatypes ((List!32717 0))(
  ( (Nil!32714) (Cons!32713 (h!33958 (_ BitVec 64)) (t!47411 List!32717)) )
))
(declare-fun arrayNoDuplicates!0 (array!95692 (_ BitVec 32) List!32717) Bool)

(assert (=> b!1399410 (= res!938158 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32714))))

(assert (= (and start!120220 res!938155) b!1399405))

(assert (= (and b!1399405 res!938153) b!1399409))

(assert (= (and b!1399409 res!938152) b!1399401))

(assert (= (and b!1399401 res!938154) b!1399408))

(assert (= (and b!1399408 res!938149) b!1399410))

(assert (= (and b!1399410 res!938158) b!1399404))

(assert (= (and b!1399404 res!938150) b!1399403))

(assert (= (and b!1399404 (not res!938156)) b!1399402))

(assert (= (and b!1399402 (not res!938151)) b!1399406))

(assert (= (and b!1399406 res!938157) b!1399407))

(declare-fun m!1286721 () Bool)

(assert (=> b!1399410 m!1286721))

(declare-fun m!1286723 () Bool)

(assert (=> start!120220 m!1286723))

(declare-fun m!1286725 () Bool)

(assert (=> start!120220 m!1286725))

(declare-fun m!1286727 () Bool)

(assert (=> b!1399401 m!1286727))

(assert (=> b!1399401 m!1286727))

(declare-fun m!1286729 () Bool)

(assert (=> b!1399401 m!1286729))

(declare-fun m!1286731 () Bool)

(assert (=> b!1399406 m!1286731))

(declare-fun m!1286733 () Bool)

(assert (=> b!1399406 m!1286733))

(declare-fun m!1286735 () Bool)

(assert (=> b!1399406 m!1286735))

(declare-fun m!1286737 () Bool)

(assert (=> b!1399407 m!1286737))

(assert (=> b!1399407 m!1286727))

(assert (=> b!1399407 m!1286727))

(declare-fun m!1286739 () Bool)

(assert (=> b!1399407 m!1286739))

(declare-fun m!1286741 () Bool)

(assert (=> b!1399408 m!1286741))

(assert (=> b!1399404 m!1286727))

(declare-fun m!1286743 () Bool)

(assert (=> b!1399404 m!1286743))

(assert (=> b!1399404 m!1286727))

(assert (=> b!1399404 m!1286727))

(declare-fun m!1286745 () Bool)

(assert (=> b!1399404 m!1286745))

(declare-fun m!1286747 () Bool)

(assert (=> b!1399404 m!1286747))

(declare-fun m!1286749 () Bool)

(assert (=> b!1399404 m!1286749))

(declare-fun m!1286751 () Bool)

(assert (=> b!1399402 m!1286751))

(assert (=> b!1399402 m!1286751))

(declare-fun m!1286753 () Bool)

(assert (=> b!1399402 m!1286753))

(assert (=> b!1399402 m!1286731))

(declare-fun m!1286755 () Bool)

(assert (=> b!1399402 m!1286755))

(assert (=> b!1399403 m!1286727))

(assert (=> b!1399403 m!1286727))

(declare-fun m!1286757 () Bool)

(assert (=> b!1399403 m!1286757))

(declare-fun m!1286759 () Bool)

(assert (=> b!1399409 m!1286759))

(assert (=> b!1399409 m!1286759))

(declare-fun m!1286761 () Bool)

(assert (=> b!1399409 m!1286761))

(push 1)

(assert (not b!1399406))

(assert (not start!120220))

(assert (not b!1399402))

(assert (not b!1399410))

(assert (not b!1399404))

(assert (not b!1399408))

(assert (not b!1399409))

(assert (not b!1399407))

(assert (not b!1399403))

(assert (not b!1399401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151049 () Bool)

(assert (=> d!151049 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120220 d!151049))

(declare-fun d!151061 () Bool)

(assert (=> d!151061 (= (array_inv!35226 a!2901) (bvsge (size!46748 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120220 d!151061))

(declare-fun b!1399556 () Bool)

(declare-fun e!792338 () SeekEntryResult!10515)

(declare-fun lt!615619 () SeekEntryResult!10515)

(assert (=> b!1399556 (= e!792338 (Found!10515 (index!44436 lt!615619)))))

(declare-fun d!151065 () Bool)

(declare-fun lt!615618 () SeekEntryResult!10515)

(assert (=> d!151065 (and (or (is-Undefined!10515 lt!615618) (not (is-Found!10515 lt!615618)) (and (bvsge (index!44435 lt!615618) #b00000000000000000000000000000000) (bvslt (index!44435 lt!615618) (size!46748 lt!615531)))) (or (is-Undefined!10515 lt!615618) (is-Found!10515 lt!615618) (not (is-MissingZero!10515 lt!615618)) (and (bvsge (index!44434 lt!615618) #b00000000000000000000000000000000) (bvslt (index!44434 lt!615618) (size!46748 lt!615531)))) (or (is-Undefined!10515 lt!615618) (is-Found!10515 lt!615618) (is-MissingZero!10515 lt!615618) (not (is-MissingVacant!10515 lt!615618)) (and (bvsge (index!44437 lt!615618) #b00000000000000000000000000000000) (bvslt (index!44437 lt!615618) (size!46748 lt!615531)))) (or (is-Undefined!10515 lt!615618) (ite (is-Found!10515 lt!615618) (= (select (arr!46198 lt!615531) (index!44435 lt!615618)) lt!615532) (ite (is-MissingZero!10515 lt!615618) (= (select (arr!46198 lt!615531) (index!44434 lt!615618)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10515 lt!615618) (= (select (arr!46198 lt!615531) (index!44437 lt!615618)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!792340 () SeekEntryResult!10515)

(assert (=> d!151065 (= lt!615618 e!792340)))

(declare-fun c!130140 () Bool)

(assert (=> d!151065 (= c!130140 (and (is-Intermediate!10515 lt!615619) (undefined!11327 lt!615619)))))

(assert (=> d!151065 (= lt!615619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615532 mask!2840) lt!615532 lt!615531 mask!2840))))

(assert (=> d!151065 (validMask!0 mask!2840)))

(assert (=> d!151065 (= (seekEntryOrOpen!0 lt!615532 lt!615531 mask!2840) lt!615618)))

(declare-fun b!1399557 () Bool)

(declare-fun c!130141 () Bool)

(declare-fun lt!615617 () (_ BitVec 64))

(assert (=> b!1399557 (= c!130141 (= lt!615617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792339 () SeekEntryResult!10515)

(assert (=> b!1399557 (= e!792338 e!792339)))

(declare-fun b!1399558 () Bool)

(assert (=> b!1399558 (= e!792340 Undefined!10515)))

(declare-fun b!1399559 () Bool)

(assert (=> b!1399559 (= e!792339 (seekKeyOrZeroReturnVacant!0 (x!126074 lt!615619) (index!44436 lt!615619) (index!44436 lt!615619) lt!615532 lt!615531 mask!2840))))

(declare-fun b!1399560 () Bool)

(assert (=> b!1399560 (= e!792339 (MissingZero!10515 (index!44436 lt!615619)))))

(declare-fun b!1399561 () Bool)

(assert (=> b!1399561 (= e!792340 e!792338)))

(assert (=> b!1399561 (= lt!615617 (select (arr!46198 lt!615531) (index!44436 lt!615619)))))

(declare-fun c!130139 () Bool)

(assert (=> b!1399561 (= c!130139 (= lt!615617 lt!615532))))

(assert (= (and d!151065 c!130140) b!1399558))

(assert (= (and d!151065 (not c!130140)) b!1399561))

(assert (= (and b!1399561 c!130139) b!1399556))

(assert (= (and b!1399561 (not c!130139)) b!1399557))

(assert (= (and b!1399557 c!130141) b!1399560))

(assert (= (and b!1399557 (not c!130141)) b!1399559))

(assert (=> d!151065 m!1286723))

(declare-fun m!1286847 () Bool)

(assert (=> d!151065 m!1286847))

(declare-fun m!1286849 () Bool)

(assert (=> d!151065 m!1286849))

(assert (=> d!151065 m!1286751))

(declare-fun m!1286851 () Bool)

(assert (=> d!151065 m!1286851))

(assert (=> d!151065 m!1286751))

(assert (=> d!151065 m!1286753))

(declare-fun m!1286853 () Bool)

(assert (=> b!1399559 m!1286853))

(declare-fun m!1286855 () Bool)

(assert (=> b!1399561 m!1286855))

(assert (=> b!1399407 d!151065))

(declare-fun b!1399641 () Bool)

(declare-fun c!130170 () Bool)

(declare-fun lt!615647 () (_ BitVec 64))

(assert (=> b!1399641 (= c!130170 (= lt!615647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792392 () SeekEntryResult!10515)

(declare-fun e!792393 () SeekEntryResult!10515)

(assert (=> b!1399641 (= e!792392 e!792393)))

(declare-fun b!1399642 () Bool)

(assert (=> b!1399642 (= e!792392 (Found!10515 (index!44436 lt!615537)))))

(declare-fun b!1399643 () Bool)

(assert (=> b!1399643 (= e!792393 (MissingVacant!10515 (index!44436 lt!615537)))))

(declare-fun b!1399644 () Bool)

(declare-fun e!792391 () SeekEntryResult!10515)

(assert (=> b!1399644 (= e!792391 e!792392)))

(declare-fun c!130172 () Bool)

(assert (=> b!1399644 (= c!130172 (= lt!615647 (select (arr!46198 a!2901) j!112)))))

(declare-fun b!1399646 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399646 (= e!792393 (seekKeyOrZeroReturnVacant!0 (bvadd (x!126074 lt!615537) #b00000000000000000000000000000001) (nextIndex!0 (index!44436 lt!615537) (x!126074 lt!615537) mask!2840) (index!44436 lt!615537) (select (arr!46198 a!2901) j!112) lt!615531 mask!2840))))

(declare-fun b!1399645 () Bool)

(assert (=> b!1399645 (= e!792391 Undefined!10515)))

(declare-fun lt!615646 () SeekEntryResult!10515)

(declare-fun d!151081 () Bool)

(assert (=> d!151081 (and (or (is-Undefined!10515 lt!615646) (not (is-Found!10515 lt!615646)) (and (bvsge (index!44435 lt!615646) #b00000000000000000000000000000000) (bvslt (index!44435 lt!615646) (size!46748 lt!615531)))) (or (is-Undefined!10515 lt!615646) (is-Found!10515 lt!615646) (not (is-MissingVacant!10515 lt!615646)) (not (= (index!44437 lt!615646) (index!44436 lt!615537))) (and (bvsge (index!44437 lt!615646) #b00000000000000000000000000000000) (bvslt (index!44437 lt!615646) (size!46748 lt!615531)))) (or (is-Undefined!10515 lt!615646) (ite (is-Found!10515 lt!615646) (= (select (arr!46198 lt!615531) (index!44435 lt!615646)) (select (arr!46198 a!2901) j!112)) (and (is-MissingVacant!10515 lt!615646) (= (index!44437 lt!615646) (index!44436 lt!615537)) (= (select (arr!46198 lt!615531) (index!44437 lt!615646)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!151081 (= lt!615646 e!792391)))

(declare-fun c!130171 () Bool)

(assert (=> d!151081 (= c!130171 (bvsge (x!126074 lt!615537) #b01111111111111111111111111111110))))

(assert (=> d!151081 (= lt!615647 (select (arr!46198 lt!615531) (index!44436 lt!615537)))))

(assert (=> d!151081 (validMask!0 mask!2840)))

(assert (=> d!151081 (= (seekKeyOrZeroReturnVacant!0 (x!126074 lt!615537) (index!44436 lt!615537) (index!44436 lt!615537) (select (arr!46198 a!2901) j!112) lt!615531 mask!2840) lt!615646)))

(assert (= (and d!151081 c!130171) b!1399645))

(assert (= (and d!151081 (not c!130171)) b!1399644))

(assert (= (and b!1399644 c!130172) b!1399642))

(assert (= (and b!1399644 (not c!130172)) b!1399641))

(assert (= (and b!1399641 c!130170) b!1399643))

(assert (= (and b!1399641 (not c!130170)) b!1399646))

(declare-fun m!1286909 () Bool)

(assert (=> b!1399646 m!1286909))

(assert (=> b!1399646 m!1286909))

(assert (=> b!1399646 m!1286727))

(declare-fun m!1286911 () Bool)

(assert (=> b!1399646 m!1286911))

(declare-fun m!1286913 () Bool)

(assert (=> d!151081 m!1286913))

(declare-fun m!1286915 () Bool)

(assert (=> d!151081 m!1286915))

(declare-fun m!1286917 () Bool)

(assert (=> d!151081 m!1286917))

(assert (=> d!151081 m!1286723))

(assert (=> b!1399407 d!151081))

(declare-fun b!1399683 () Bool)

(declare-fun e!792416 () Bool)

(declare-fun e!792417 () Bool)

(assert (=> b!1399683 (= e!792416 e!792417)))

(declare-fun res!938225 () Bool)

(declare-fun lt!615658 () SeekEntryResult!10515)

(assert (=> b!1399683 (= res!938225 (and (is-Intermediate!10515 lt!615658) (not (undefined!11327 lt!615658)) (bvslt (x!126074 lt!615658) #b01111111111111111111111111111110) (bvsge (x!126074 lt!615658) #b00000000000000000000000000000000) (bvsge (x!126074 lt!615658) #b00000000000000000000000000000000)))))

(assert (=> b!1399683 (=> (not res!938225) (not e!792417))))

(declare-fun e!792415 () SeekEntryResult!10515)

(declare-fun b!1399684 () Bool)

(assert (=> b!1399684 (= e!792415 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615532 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615532 lt!615531 mask!2840))))

(declare-fun b!1399685 () Bool)

(assert (=> b!1399685 (and (bvsge (index!44436 lt!615658) #b00000000000000000000000000000000) (bvslt (index!44436 lt!615658) (size!46748 lt!615531)))))

(declare-fun e!792414 () Bool)

(assert (=> b!1399685 (= e!792414 (= (select (arr!46198 lt!615531) (index!44436 lt!615658)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1399687 () Bool)

(assert (=> b!1399687 (and (bvsge (index!44436 lt!615658) #b00000000000000000000000000000000) (bvslt (index!44436 lt!615658) (size!46748 lt!615531)))))

(declare-fun res!938227 () Bool)

(assert (=> b!1399687 (= res!938227 (= (select (arr!46198 lt!615531) (index!44436 lt!615658)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399687 (=> res!938227 e!792414)))

(declare-fun b!1399688 () Bool)

(declare-fun e!792413 () SeekEntryResult!10515)

(assert (=> b!1399688 (= e!792413 e!792415)))

(declare-fun c!130190 () Bool)

(declare-fun lt!615659 () (_ BitVec 64))

(assert (=> b!1399688 (= c!130190 (or (= lt!615659 lt!615532) (= (bvadd lt!615659 lt!615659) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399689 () Bool)

(assert (=> b!1399689 (= e!792416 (bvsge (x!126074 lt!615658) #b01111111111111111111111111111110))))

(declare-fun b!1399686 () Bool)

(assert (=> b!1399686 (and (bvsge (index!44436 lt!615658) #b00000000000000000000000000000000) (bvslt (index!44436 lt!615658) (size!46748 lt!615531)))))

(declare-fun res!938226 () Bool)

(assert (=> b!1399686 (= res!938226 (= (select (arr!46198 lt!615531) (index!44436 lt!615658)) lt!615532))))

(assert (=> b!1399686 (=> res!938226 e!792414)))

(assert (=> b!1399686 (= e!792417 e!792414)))

(declare-fun d!151101 () Bool)

(assert (=> d!151101 e!792416))

(declare-fun c!130188 () Bool)

(assert (=> d!151101 (= c!130188 (and (is-Intermediate!10515 lt!615658) (undefined!11327 lt!615658)))))

(assert (=> d!151101 (= lt!615658 e!792413)))

(declare-fun c!130189 () Bool)

(assert (=> d!151101 (= c!130189 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151101 (= lt!615659 (select (arr!46198 lt!615531) (toIndex!0 lt!615532 mask!2840)))))

(assert (=> d!151101 (validMask!0 mask!2840)))

(assert (=> d!151101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615532 mask!2840) lt!615532 lt!615531 mask!2840) lt!615658)))

(declare-fun b!1399690 () Bool)

(assert (=> b!1399690 (= e!792415 (Intermediate!10515 false (toIndex!0 lt!615532 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1399691 () Bool)

(assert (=> b!1399691 (= e!792413 (Intermediate!10515 true (toIndex!0 lt!615532 mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!151101 c!130189) b!1399691))

(assert (= (and d!151101 (not c!130189)) b!1399688))

(assert (= (and b!1399688 c!130190) b!1399690))

(assert (= (and b!1399688 (not c!130190)) b!1399684))

(assert (= (and d!151101 c!130188) b!1399689))

(assert (= (and d!151101 (not c!130188)) b!1399683))

(assert (= (and b!1399683 res!938225) b!1399686))

(assert (= (and b!1399686 (not res!938226)) b!1399687))

(assert (= (and b!1399687 (not res!938227)) b!1399685))

(assert (=> d!151101 m!1286751))

(declare-fun m!1286929 () Bool)

(assert (=> d!151101 m!1286929))

(assert (=> d!151101 m!1286723))

(assert (=> b!1399684 m!1286751))

(declare-fun m!1286931 () Bool)

(assert (=> b!1399684 m!1286931))

(assert (=> b!1399684 m!1286931))

(declare-fun m!1286933 () Bool)

(assert (=> b!1399684 m!1286933))

(declare-fun m!1286935 () Bool)

(assert (=> b!1399687 m!1286935))

(assert (=> b!1399685 m!1286935))

(assert (=> b!1399686 m!1286935))

(assert (=> b!1399402 d!151101))

(declare-fun d!151111 () Bool)

(declare-fun lt!615668 () (_ BitVec 32))

(declare-fun lt!615667 () (_ BitVec 32))

(assert (=> d!151111 (= lt!615668 (bvmul (bvxor lt!615667 (bvlshr lt!615667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151111 (= lt!615667 ((_ extract 31 0) (bvand (bvxor lt!615532 (bvlshr lt!615532 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

