; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65144 () Bool)

(assert start!65144)

(declare-fun b!736434 () Bool)

(declare-fun res!495007 () Bool)

(declare-fun e!411941 () Bool)

(assert (=> b!736434 (=> (not res!495007) (not e!411941))))

(declare-datatypes ((array!41334 0))(
  ( (array!41335 (arr!19781 (Array (_ BitVec 32) (_ BitVec 64))) (size!20202 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41334)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736434 (= res!495007 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!411951 () Bool)

(declare-fun b!736435 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7378 0))(
  ( (MissingZero!7378 (index!31880 (_ BitVec 32))) (Found!7378 (index!31881 (_ BitVec 32))) (Intermediate!7378 (undefined!8190 Bool) (index!31882 (_ BitVec 32)) (x!62891 (_ BitVec 32))) (Undefined!7378) (MissingVacant!7378 (index!31883 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41334 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!736435 (= e!411951 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) (Found!7378 j!159)))))

(declare-fun res!495015 () Bool)

(assert (=> start!65144 (=> (not res!495015) (not e!411941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65144 (= res!495015 (validMask!0 mask!3328))))

(assert (=> start!65144 e!411941))

(assert (=> start!65144 true))

(declare-fun array_inv!15664 (array!41334) Bool)

(assert (=> start!65144 (array_inv!15664 a!3186)))

(declare-fun b!736436 () Bool)

(declare-datatypes ((Unit!25088 0))(
  ( (Unit!25089) )
))
(declare-fun e!411945 () Unit!25088)

(declare-fun Unit!25090 () Unit!25088)

(assert (=> b!736436 (= e!411945 Unit!25090)))

(declare-fun lt!326500 () SeekEntryResult!7378)

(assert (=> b!736436 (= lt!326500 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326512 () (_ BitVec 32))

(declare-fun lt!326509 () SeekEntryResult!7378)

(assert (=> b!736436 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326512 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326509)))

(declare-fun b!736437 () Bool)

(declare-fun e!411947 () Bool)

(declare-fun e!411948 () Bool)

(assert (=> b!736437 (= e!411947 e!411948)))

(declare-fun res!495016 () Bool)

(assert (=> b!736437 (=> (not res!495016) (not e!411948))))

(declare-fun lt!326507 () SeekEntryResult!7378)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41334 (_ BitVec 32)) SeekEntryResult!7378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736437 (= res!495016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19781 a!3186) j!159) mask!3328) (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326507))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736437 (= lt!326507 (Intermediate!7378 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736438 () Bool)

(declare-fun res!495011 () Bool)

(assert (=> b!736438 (=> (not res!495011) (not e!411948))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736438 (= res!495011 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19781 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736439 () Bool)

(declare-fun res!495013 () Bool)

(assert (=> b!736439 (=> (not res!495013) (not e!411941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736439 (= res!495013 (validKeyInArray!0 (select (arr!19781 a!3186) j!159)))))

(declare-fun e!411942 () Bool)

(declare-fun b!736440 () Bool)

(assert (=> b!736440 (= e!411942 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326512 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326507)))))

(declare-fun b!736441 () Bool)

(declare-fun e!411946 () Bool)

(declare-fun e!411944 () Bool)

(assert (=> b!736441 (= e!411946 e!411944)))

(declare-fun res!495003 () Bool)

(assert (=> b!736441 (=> (not res!495003) (not e!411944))))

(declare-fun lt!326511 () SeekEntryResult!7378)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41334 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!736441 (= res!495003 (= (seekEntryOrOpen!0 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326511))))

(assert (=> b!736441 (= lt!326511 (Found!7378 j!159))))

(declare-fun b!736442 () Bool)

(declare-fun res!495008 () Bool)

(assert (=> b!736442 (=> (not res!495008) (not e!411941))))

(assert (=> b!736442 (= res!495008 (and (= (size!20202 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20202 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20202 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736443 () Bool)

(declare-fun res!495018 () Bool)

(assert (=> b!736443 (=> (not res!495018) (not e!411941))))

(assert (=> b!736443 (= res!495018 (validKeyInArray!0 k0!2102))))

(declare-fun b!736444 () Bool)

(declare-fun res!495005 () Bool)

(assert (=> b!736444 (=> (not res!495005) (not e!411947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41334 (_ BitVec 32)) Bool)

(assert (=> b!736444 (= res!495005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736445 () Bool)

(declare-fun e!411952 () Bool)

(declare-fun e!411949 () Bool)

(assert (=> b!736445 (= e!411952 e!411949)))

(declare-fun res!495001 () Bool)

(assert (=> b!736445 (=> res!495001 e!411949)))

(assert (=> b!736445 (= res!495001 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326512 #b00000000000000000000000000000000) (bvsge lt!326512 (size!20202 a!3186))))))

(declare-fun lt!326505 () Unit!25088)

(assert (=> b!736445 (= lt!326505 e!411945)))

(declare-fun c!81097 () Bool)

(declare-fun lt!326501 () Bool)

(assert (=> b!736445 (= c!81097 lt!326501)))

(assert (=> b!736445 (= lt!326501 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736445 (= lt!326512 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736446 () Bool)

(declare-fun res!495012 () Bool)

(assert (=> b!736446 (=> (not res!495012) (not e!411947))))

(assert (=> b!736446 (= res!495012 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20202 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20202 a!3186))))))

(declare-fun b!736447 () Bool)

(declare-fun e!411943 () Bool)

(assert (=> b!736447 (= e!411948 e!411943)))

(declare-fun res!495017 () Bool)

(assert (=> b!736447 (=> (not res!495017) (not e!411943))))

(declare-fun lt!326504 () SeekEntryResult!7378)

(declare-fun lt!326503 () SeekEntryResult!7378)

(assert (=> b!736447 (= res!495017 (= lt!326504 lt!326503))))

(declare-fun lt!326506 () (_ BitVec 64))

(declare-fun lt!326508 () array!41334)

(assert (=> b!736447 (= lt!326503 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326506 lt!326508 mask!3328))))

(assert (=> b!736447 (= lt!326504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326506 mask!3328) lt!326506 lt!326508 mask!3328))))

(assert (=> b!736447 (= lt!326506 (select (store (arr!19781 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736447 (= lt!326508 (array!41335 (store (arr!19781 a!3186) i!1173 k0!2102) (size!20202 a!3186)))))

(declare-fun b!736448 () Bool)

(assert (=> b!736448 (= e!411943 (not e!411952))))

(declare-fun res!495014 () Bool)

(assert (=> b!736448 (=> res!495014 e!411952)))

(get-info :version)

(assert (=> b!736448 (= res!495014 (or (not ((_ is Intermediate!7378) lt!326503)) (bvsge x!1131 (x!62891 lt!326503))))))

(assert (=> b!736448 (= lt!326509 (Found!7378 j!159))))

(assert (=> b!736448 e!411946))

(declare-fun res!495004 () Bool)

(assert (=> b!736448 (=> (not res!495004) (not e!411946))))

(assert (=> b!736448 (= res!495004 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326502 () Unit!25088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25088)

(assert (=> b!736448 (= lt!326502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736449 () Bool)

(assert (=> b!736449 (= e!411941 e!411947)))

(declare-fun res!495009 () Bool)

(assert (=> b!736449 (=> (not res!495009) (not e!411947))))

(declare-fun lt!326513 () SeekEntryResult!7378)

(assert (=> b!736449 (= res!495009 (or (= lt!326513 (MissingZero!7378 i!1173)) (= lt!326513 (MissingVacant!7378 i!1173))))))

(assert (=> b!736449 (= lt!326513 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736450 () Bool)

(declare-fun res!495002 () Bool)

(assert (=> b!736450 (=> (not res!495002) (not e!411948))))

(assert (=> b!736450 (= res!495002 e!411951)))

(declare-fun c!81099 () Bool)

(assert (=> b!736450 (= c!81099 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736451 () Bool)

(assert (=> b!736451 (= e!411949 true)))

(declare-fun lt!326510 () SeekEntryResult!7378)

(assert (=> b!736451 (= lt!326510 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326512 lt!326506 lt!326508 mask!3328))))

(declare-fun b!736452 () Bool)

(declare-fun Unit!25091 () Unit!25088)

(assert (=> b!736452 (= e!411945 Unit!25091)))

(assert (=> b!736452 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326512 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326507)))

(declare-fun b!736453 () Bool)

(assert (=> b!736453 (= e!411951 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326507))))

(declare-fun b!736454 () Bool)

(declare-fun res!495010 () Bool)

(assert (=> b!736454 (=> res!495010 e!411949)))

(assert (=> b!736454 (= res!495010 e!411942)))

(declare-fun c!81098 () Bool)

(assert (=> b!736454 (= c!81098 lt!326501)))

(declare-fun b!736455 () Bool)

(declare-fun res!495006 () Bool)

(assert (=> b!736455 (=> (not res!495006) (not e!411947))))

(declare-datatypes ((List!13822 0))(
  ( (Nil!13819) (Cons!13818 (h!14890 (_ BitVec 64)) (t!20128 List!13822)) )
))
(declare-fun arrayNoDuplicates!0 (array!41334 (_ BitVec 32) List!13822) Bool)

(assert (=> b!736455 (= res!495006 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13819))))

(declare-fun b!736456 () Bool)

(assert (=> b!736456 (= e!411944 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326511))))

(declare-fun b!736457 () Bool)

(assert (=> b!736457 (= e!411942 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326512 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326509)))))

(assert (= (and start!65144 res!495015) b!736442))

(assert (= (and b!736442 res!495008) b!736439))

(assert (= (and b!736439 res!495013) b!736443))

(assert (= (and b!736443 res!495018) b!736434))

(assert (= (and b!736434 res!495007) b!736449))

(assert (= (and b!736449 res!495009) b!736444))

(assert (= (and b!736444 res!495005) b!736455))

(assert (= (and b!736455 res!495006) b!736446))

(assert (= (and b!736446 res!495012) b!736437))

(assert (= (and b!736437 res!495016) b!736438))

(assert (= (and b!736438 res!495011) b!736450))

(assert (= (and b!736450 c!81099) b!736453))

(assert (= (and b!736450 (not c!81099)) b!736435))

(assert (= (and b!736450 res!495002) b!736447))

(assert (= (and b!736447 res!495017) b!736448))

(assert (= (and b!736448 res!495004) b!736441))

(assert (= (and b!736441 res!495003) b!736456))

(assert (= (and b!736448 (not res!495014)) b!736445))

(assert (= (and b!736445 c!81097) b!736452))

(assert (= (and b!736445 (not c!81097)) b!736436))

(assert (= (and b!736445 (not res!495001)) b!736454))

(assert (= (and b!736454 c!81098) b!736440))

(assert (= (and b!736454 (not c!81098)) b!736457))

(assert (= (and b!736454 (not res!495010)) b!736451))

(declare-fun m!687995 () Bool)

(assert (=> b!736453 m!687995))

(assert (=> b!736453 m!687995))

(declare-fun m!687997 () Bool)

(assert (=> b!736453 m!687997))

(declare-fun m!687999 () Bool)

(assert (=> b!736444 m!687999))

(declare-fun m!688001 () Bool)

(assert (=> b!736447 m!688001))

(declare-fun m!688003 () Bool)

(assert (=> b!736447 m!688003))

(declare-fun m!688005 () Bool)

(assert (=> b!736447 m!688005))

(assert (=> b!736447 m!688001))

(declare-fun m!688007 () Bool)

(assert (=> b!736447 m!688007))

(declare-fun m!688009 () Bool)

(assert (=> b!736447 m!688009))

(assert (=> b!736440 m!687995))

(assert (=> b!736440 m!687995))

(declare-fun m!688011 () Bool)

(assert (=> b!736440 m!688011))

(assert (=> b!736456 m!687995))

(assert (=> b!736456 m!687995))

(declare-fun m!688013 () Bool)

(assert (=> b!736456 m!688013))

(assert (=> b!736441 m!687995))

(assert (=> b!736441 m!687995))

(declare-fun m!688015 () Bool)

(assert (=> b!736441 m!688015))

(assert (=> b!736435 m!687995))

(assert (=> b!736435 m!687995))

(declare-fun m!688017 () Bool)

(assert (=> b!736435 m!688017))

(declare-fun m!688019 () Bool)

(assert (=> b!736434 m!688019))

(declare-fun m!688021 () Bool)

(assert (=> b!736449 m!688021))

(declare-fun m!688023 () Bool)

(assert (=> b!736443 m!688023))

(declare-fun m!688025 () Bool)

(assert (=> b!736455 m!688025))

(declare-fun m!688027 () Bool)

(assert (=> start!65144 m!688027))

(declare-fun m!688029 () Bool)

(assert (=> start!65144 m!688029))

(assert (=> b!736436 m!687995))

(assert (=> b!736436 m!687995))

(assert (=> b!736436 m!688017))

(assert (=> b!736436 m!687995))

(declare-fun m!688031 () Bool)

(assert (=> b!736436 m!688031))

(declare-fun m!688033 () Bool)

(assert (=> b!736448 m!688033))

(declare-fun m!688035 () Bool)

(assert (=> b!736448 m!688035))

(assert (=> b!736437 m!687995))

(assert (=> b!736437 m!687995))

(declare-fun m!688037 () Bool)

(assert (=> b!736437 m!688037))

(assert (=> b!736437 m!688037))

(assert (=> b!736437 m!687995))

(declare-fun m!688039 () Bool)

(assert (=> b!736437 m!688039))

(declare-fun m!688041 () Bool)

(assert (=> b!736445 m!688041))

(declare-fun m!688043 () Bool)

(assert (=> b!736438 m!688043))

(assert (=> b!736439 m!687995))

(assert (=> b!736439 m!687995))

(declare-fun m!688045 () Bool)

(assert (=> b!736439 m!688045))

(assert (=> b!736452 m!687995))

(assert (=> b!736452 m!687995))

(assert (=> b!736452 m!688011))

(declare-fun m!688047 () Bool)

(assert (=> b!736451 m!688047))

(assert (=> b!736457 m!687995))

(assert (=> b!736457 m!687995))

(assert (=> b!736457 m!688031))

(check-sat (not b!736434) (not b!736452) (not b!736451) (not b!736443) (not b!736449) (not b!736444) (not b!736447) (not b!736437) (not b!736440) (not b!736453) (not b!736439) (not b!736448) (not b!736455) (not b!736457) (not b!736441) (not b!736445) (not b!736436) (not start!65144) (not b!736435) (not b!736456))
(check-sat)
