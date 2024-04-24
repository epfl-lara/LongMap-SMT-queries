; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66904 () Bool)

(assert start!66904)

(declare-fun b!770621 () Bool)

(declare-fun res!521059 () Bool)

(declare-fun e!429139 () Bool)

(assert (=> b!770621 (=> (not res!521059) (not e!429139))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770621 (= res!521059 (validKeyInArray!0 k0!2102))))

(declare-fun b!770622 () Bool)

(declare-datatypes ((Unit!26491 0))(
  ( (Unit!26492) )
))
(declare-fun e!429137 () Unit!26491)

(declare-fun Unit!26493 () Unit!26491)

(assert (=> b!770622 (= e!429137 Unit!26493)))

(declare-datatypes ((array!42346 0))(
  ( (array!42347 (arr!20269 (Array (_ BitVec 32) (_ BitVec 64))) (size!20689 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42346)

(declare-datatypes ((SeekEntryResult!7825 0))(
  ( (MissingZero!7825 (index!33668 (_ BitVec 32))) (Found!7825 (index!33669 (_ BitVec 32))) (Intermediate!7825 (undefined!8637 Bool) (index!33670 (_ BitVec 32)) (x!64759 (_ BitVec 32))) (Undefined!7825) (MissingVacant!7825 (index!33671 (_ BitVec 32))) )
))
(declare-fun lt!342915 () SeekEntryResult!7825)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!342919 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42346 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!770622 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342919 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342915)))

(declare-fun b!770623 () Bool)

(declare-fun res!521060 () Bool)

(assert (=> b!770623 (=> (not res!521060) (not e!429139))))

(assert (=> b!770623 (= res!521060 (validKeyInArray!0 (select (arr!20269 a!3186) j!159)))))

(declare-fun b!770624 () Bool)

(declare-fun res!521067 () Bool)

(assert (=> b!770624 (=> (not res!521067) (not e!429139))))

(declare-fun arrayContainsKey!0 (array!42346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770624 (= res!521067 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770625 () Bool)

(declare-fun res!521056 () Bool)

(declare-fun e!429143 () Bool)

(assert (=> b!770625 (=> (not res!521056) (not e!429143))))

(declare-fun e!429145 () Bool)

(assert (=> b!770625 (= res!521056 e!429145)))

(declare-fun c!85184 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770625 (= c!85184 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770626 () Bool)

(declare-fun e!429142 () Bool)

(assert (=> b!770626 (= e!429139 e!429142)))

(declare-fun res!521052 () Bool)

(assert (=> b!770626 (=> (not res!521052) (not e!429142))))

(declare-fun lt!342918 () SeekEntryResult!7825)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770626 (= res!521052 (or (= lt!342918 (MissingZero!7825 i!1173)) (= lt!342918 (MissingVacant!7825 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42346 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!770626 (= lt!342918 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770627 () Bool)

(declare-fun Unit!26494 () Unit!26491)

(assert (=> b!770627 (= e!429137 Unit!26494)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342913 () SeekEntryResult!7825)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42346 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!770627 (= lt!342913 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770627 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342919 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) (Found!7825 j!159))))

(declare-fun b!770628 () Bool)

(assert (=> b!770628 (= e!429142 e!429143)))

(declare-fun res!521062 () Bool)

(assert (=> b!770628 (=> (not res!521062) (not e!429143))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770628 (= res!521062 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20269 a!3186) j!159) mask!3328) (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342915))))

(assert (=> b!770628 (= lt!342915 (Intermediate!7825 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!342912 () SeekEntryResult!7825)

(declare-fun b!770630 () Bool)

(declare-fun e!429144 () Bool)

(assert (=> b!770630 (= e!429144 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342912))))

(declare-fun b!770631 () Bool)

(declare-fun e!429140 () Bool)

(assert (=> b!770631 (= e!429140 true)))

(declare-fun lt!342917 () Unit!26491)

(assert (=> b!770631 (= lt!342917 e!429137)))

(declare-fun c!85183 () Bool)

(assert (=> b!770631 (= c!85183 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770631 (= lt!342919 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!770632 () Bool)

(declare-fun res!521058 () Bool)

(assert (=> b!770632 (=> (not res!521058) (not e!429142))))

(declare-datatypes ((List!14178 0))(
  ( (Nil!14175) (Cons!14174 (h!15279 (_ BitVec 64)) (t!20485 List!14178)) )
))
(declare-fun arrayNoDuplicates!0 (array!42346 (_ BitVec 32) List!14178) Bool)

(assert (=> b!770632 (= res!521058 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14175))))

(declare-fun b!770633 () Bool)

(assert (=> b!770633 (= e!429145 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342915))))

(declare-fun b!770634 () Bool)

(declare-fun res!521057 () Bool)

(assert (=> b!770634 (=> (not res!521057) (not e!429143))))

(assert (=> b!770634 (= res!521057 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20269 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770635 () Bool)

(declare-fun e!429136 () Bool)

(assert (=> b!770635 (= e!429136 e!429144)))

(declare-fun res!521064 () Bool)

(assert (=> b!770635 (=> (not res!521064) (not e!429144))))

(assert (=> b!770635 (= res!521064 (= (seekEntryOrOpen!0 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342912))))

(assert (=> b!770635 (= lt!342912 (Found!7825 j!159))))

(declare-fun b!770636 () Bool)

(declare-fun res!521053 () Bool)

(assert (=> b!770636 (=> (not res!521053) (not e!429139))))

(assert (=> b!770636 (= res!521053 (and (= (size!20689 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20689 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20689 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770637 () Bool)

(declare-fun e!429138 () Bool)

(assert (=> b!770637 (= e!429138 (not e!429140))))

(declare-fun res!521063 () Bool)

(assert (=> b!770637 (=> res!521063 e!429140)))

(declare-fun lt!342920 () SeekEntryResult!7825)

(get-info :version)

(assert (=> b!770637 (= res!521063 (or (not ((_ is Intermediate!7825) lt!342920)) (bvsge x!1131 (x!64759 lt!342920))))))

(assert (=> b!770637 e!429136))

(declare-fun res!521065 () Bool)

(assert (=> b!770637 (=> (not res!521065) (not e!429136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42346 (_ BitVec 32)) Bool)

(assert (=> b!770637 (= res!521065 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342916 () Unit!26491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26491)

(assert (=> b!770637 (= lt!342916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770638 () Bool)

(declare-fun res!521061 () Bool)

(assert (=> b!770638 (=> (not res!521061) (not e!429142))))

(assert (=> b!770638 (= res!521061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770639 () Bool)

(declare-fun res!521055 () Bool)

(assert (=> b!770639 (=> (not res!521055) (not e!429142))))

(assert (=> b!770639 (= res!521055 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20689 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20689 a!3186))))))

(declare-fun b!770640 () Bool)

(assert (=> b!770640 (= e!429145 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) (Found!7825 j!159)))))

(declare-fun b!770629 () Bool)

(assert (=> b!770629 (= e!429143 e!429138)))

(declare-fun res!521054 () Bool)

(assert (=> b!770629 (=> (not res!521054) (not e!429138))))

(declare-fun lt!342922 () SeekEntryResult!7825)

(assert (=> b!770629 (= res!521054 (= lt!342922 lt!342920))))

(declare-fun lt!342921 () array!42346)

(declare-fun lt!342914 () (_ BitVec 64))

(assert (=> b!770629 (= lt!342920 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342914 lt!342921 mask!3328))))

(assert (=> b!770629 (= lt!342922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342914 mask!3328) lt!342914 lt!342921 mask!3328))))

(assert (=> b!770629 (= lt!342914 (select (store (arr!20269 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770629 (= lt!342921 (array!42347 (store (arr!20269 a!3186) i!1173 k0!2102) (size!20689 a!3186)))))

(declare-fun res!521066 () Bool)

(assert (=> start!66904 (=> (not res!521066) (not e!429139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66904 (= res!521066 (validMask!0 mask!3328))))

(assert (=> start!66904 e!429139))

(assert (=> start!66904 true))

(declare-fun array_inv!16128 (array!42346) Bool)

(assert (=> start!66904 (array_inv!16128 a!3186)))

(assert (= (and start!66904 res!521066) b!770636))

(assert (= (and b!770636 res!521053) b!770623))

(assert (= (and b!770623 res!521060) b!770621))

(assert (= (and b!770621 res!521059) b!770624))

(assert (= (and b!770624 res!521067) b!770626))

(assert (= (and b!770626 res!521052) b!770638))

(assert (= (and b!770638 res!521061) b!770632))

(assert (= (and b!770632 res!521058) b!770639))

(assert (= (and b!770639 res!521055) b!770628))

(assert (= (and b!770628 res!521062) b!770634))

(assert (= (and b!770634 res!521057) b!770625))

(assert (= (and b!770625 c!85184) b!770633))

(assert (= (and b!770625 (not c!85184)) b!770640))

(assert (= (and b!770625 res!521056) b!770629))

(assert (= (and b!770629 res!521054) b!770637))

(assert (= (and b!770637 res!521065) b!770635))

(assert (= (and b!770635 res!521064) b!770630))

(assert (= (and b!770637 (not res!521063)) b!770631))

(assert (= (and b!770631 c!85183) b!770622))

(assert (= (and b!770631 (not c!85183)) b!770627))

(declare-fun m!716363 () Bool)

(assert (=> b!770622 m!716363))

(assert (=> b!770622 m!716363))

(declare-fun m!716365 () Bool)

(assert (=> b!770622 m!716365))

(declare-fun m!716367 () Bool)

(assert (=> b!770632 m!716367))

(assert (=> b!770633 m!716363))

(assert (=> b!770633 m!716363))

(declare-fun m!716369 () Bool)

(assert (=> b!770633 m!716369))

(declare-fun m!716371 () Bool)

(assert (=> b!770631 m!716371))

(declare-fun m!716373 () Bool)

(assert (=> b!770621 m!716373))

(declare-fun m!716375 () Bool)

(assert (=> b!770629 m!716375))

(declare-fun m!716377 () Bool)

(assert (=> b!770629 m!716377))

(assert (=> b!770629 m!716375))

(declare-fun m!716379 () Bool)

(assert (=> b!770629 m!716379))

(declare-fun m!716381 () Bool)

(assert (=> b!770629 m!716381))

(declare-fun m!716383 () Bool)

(assert (=> b!770629 m!716383))

(declare-fun m!716385 () Bool)

(assert (=> b!770638 m!716385))

(declare-fun m!716387 () Bool)

(assert (=> b!770626 m!716387))

(assert (=> b!770627 m!716363))

(assert (=> b!770627 m!716363))

(declare-fun m!716389 () Bool)

(assert (=> b!770627 m!716389))

(assert (=> b!770627 m!716363))

(declare-fun m!716391 () Bool)

(assert (=> b!770627 m!716391))

(declare-fun m!716393 () Bool)

(assert (=> b!770634 m!716393))

(assert (=> b!770640 m!716363))

(assert (=> b!770640 m!716363))

(assert (=> b!770640 m!716389))

(assert (=> b!770628 m!716363))

(assert (=> b!770628 m!716363))

(declare-fun m!716395 () Bool)

(assert (=> b!770628 m!716395))

(assert (=> b!770628 m!716395))

(assert (=> b!770628 m!716363))

(declare-fun m!716397 () Bool)

(assert (=> b!770628 m!716397))

(assert (=> b!770623 m!716363))

(assert (=> b!770623 m!716363))

(declare-fun m!716399 () Bool)

(assert (=> b!770623 m!716399))

(declare-fun m!716401 () Bool)

(assert (=> b!770624 m!716401))

(declare-fun m!716403 () Bool)

(assert (=> start!66904 m!716403))

(declare-fun m!716405 () Bool)

(assert (=> start!66904 m!716405))

(declare-fun m!716407 () Bool)

(assert (=> b!770637 m!716407))

(declare-fun m!716409 () Bool)

(assert (=> b!770637 m!716409))

(assert (=> b!770635 m!716363))

(assert (=> b!770635 m!716363))

(declare-fun m!716411 () Bool)

(assert (=> b!770635 m!716411))

(assert (=> b!770630 m!716363))

(assert (=> b!770630 m!716363))

(declare-fun m!716413 () Bool)

(assert (=> b!770630 m!716413))

(check-sat (not b!770628) (not b!770629) (not b!770631) (not b!770623) (not b!770626) (not b!770624) (not b!770630) (not b!770627) (not b!770632) (not b!770633) (not b!770640) (not b!770635) (not start!66904) (not b!770622) (not b!770637) (not b!770621) (not b!770638))
(check-sat)
