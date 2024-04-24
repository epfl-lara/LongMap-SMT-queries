; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66910 () Bool)

(assert start!66910)

(declare-fun b!770801 () Bool)

(declare-fun e!429229 () Bool)

(declare-fun e!429231 () Bool)

(assert (=> b!770801 (= e!429229 e!429231)))

(declare-fun res!521209 () Bool)

(assert (=> b!770801 (=> (not res!521209) (not e!429231))))

(declare-datatypes ((SeekEntryResult!7828 0))(
  ( (MissingZero!7828 (index!33680 (_ BitVec 32))) (Found!7828 (index!33681 (_ BitVec 32))) (Intermediate!7828 (undefined!8640 Bool) (index!33682 (_ BitVec 32)) (x!64770 (_ BitVec 32))) (Undefined!7828) (MissingVacant!7828 (index!33683 (_ BitVec 32))) )
))
(declare-fun lt!343012 () SeekEntryResult!7828)

(declare-fun lt!343016 () SeekEntryResult!7828)

(assert (=> b!770801 (= res!521209 (= lt!343012 lt!343016))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42352 0))(
  ( (array!42353 (arr!20272 (Array (_ BitVec 32) (_ BitVec 64))) (size!20692 (_ BitVec 32))) )
))
(declare-fun lt!343019 () array!42352)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!343015 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42352 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!770801 (= lt!343016 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343015 lt!343019 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770801 (= lt!343012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343015 mask!3328) lt!343015 lt!343019 mask!3328))))

(declare-fun a!3186 () array!42352)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!770801 (= lt!343015 (select (store (arr!20272 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770801 (= lt!343019 (array!42353 (store (arr!20272 a!3186) i!1173 k0!2102) (size!20692 a!3186)))))

(declare-fun b!770802 () Bool)

(declare-fun res!521200 () Bool)

(declare-fun e!429228 () Bool)

(assert (=> b!770802 (=> (not res!521200) (not e!429228))))

(assert (=> b!770802 (= res!521200 (and (= (size!20692 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20692 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20692 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770803 () Bool)

(declare-fun res!521210 () Bool)

(assert (=> b!770803 (=> (not res!521210) (not e!429229))))

(declare-fun e!429226 () Bool)

(assert (=> b!770803 (= res!521210 e!429226)))

(declare-fun c!85202 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770803 (= c!85202 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!429227 () Bool)

(declare-fun lt!343013 () SeekEntryResult!7828)

(declare-fun b!770804 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42352 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!770804 (= e!429227 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!343013))))

(declare-fun b!770805 () Bool)

(declare-datatypes ((Unit!26503 0))(
  ( (Unit!26504) )
))
(declare-fun e!429235 () Unit!26503)

(declare-fun Unit!26505 () Unit!26503)

(assert (=> b!770805 (= e!429235 Unit!26505)))

(declare-fun lt!343020 () (_ BitVec 32))

(declare-fun lt!343014 () SeekEntryResult!7828)

(assert (=> b!770805 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343020 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!343014)))

(declare-fun b!770806 () Bool)

(assert (=> b!770806 (= e!429226 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) (Found!7828 j!159)))))

(declare-fun res!521196 () Bool)

(assert (=> start!66910 (=> (not res!521196) (not e!429228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66910 (= res!521196 (validMask!0 mask!3328))))

(assert (=> start!66910 e!429228))

(assert (=> start!66910 true))

(declare-fun array_inv!16131 (array!42352) Bool)

(assert (=> start!66910 (array_inv!16131 a!3186)))

(declare-fun b!770807 () Bool)

(declare-fun res!521207 () Bool)

(assert (=> b!770807 (=> (not res!521207) (not e!429229))))

(assert (=> b!770807 (= res!521207 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20272 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770808 () Bool)

(assert (=> b!770808 (= e!429226 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!343014))))

(declare-fun b!770809 () Bool)

(declare-fun e!429233 () Bool)

(assert (=> b!770809 (= e!429233 e!429229)))

(declare-fun res!521206 () Bool)

(assert (=> b!770809 (=> (not res!521206) (not e!429229))))

(assert (=> b!770809 (= res!521206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20272 a!3186) j!159) mask!3328) (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!343014))))

(assert (=> b!770809 (= lt!343014 (Intermediate!7828 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770810 () Bool)

(declare-fun res!521203 () Bool)

(assert (=> b!770810 (=> (not res!521203) (not e!429228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770810 (= res!521203 (validKeyInArray!0 (select (arr!20272 a!3186) j!159)))))

(declare-fun b!770811 () Bool)

(declare-fun Unit!26506 () Unit!26503)

(assert (=> b!770811 (= e!429235 Unit!26506)))

(declare-fun lt!343011 () SeekEntryResult!7828)

(assert (=> b!770811 (= lt!343011 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770811 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343020 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) (Found!7828 j!159))))

(declare-fun b!770812 () Bool)

(assert (=> b!770812 (= e!429228 e!429233)))

(declare-fun res!521202 () Bool)

(assert (=> b!770812 (=> (not res!521202) (not e!429233))))

(declare-fun lt!343021 () SeekEntryResult!7828)

(assert (=> b!770812 (= res!521202 (or (= lt!343021 (MissingZero!7828 i!1173)) (= lt!343021 (MissingVacant!7828 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42352 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!770812 (= lt!343021 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770813 () Bool)

(declare-fun e!429234 () Bool)

(assert (=> b!770813 (= e!429231 (not e!429234))))

(declare-fun res!521208 () Bool)

(assert (=> b!770813 (=> res!521208 e!429234)))

(get-info :version)

(assert (=> b!770813 (= res!521208 (or (not ((_ is Intermediate!7828) lt!343016)) (bvsge x!1131 (x!64770 lt!343016))))))

(declare-fun e!429232 () Bool)

(assert (=> b!770813 e!429232))

(declare-fun res!521201 () Bool)

(assert (=> b!770813 (=> (not res!521201) (not e!429232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42352 (_ BitVec 32)) Bool)

(assert (=> b!770813 (= res!521201 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343017 () Unit!26503)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26503)

(assert (=> b!770813 (= lt!343017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770814 () Bool)

(declare-fun res!521204 () Bool)

(assert (=> b!770814 (=> (not res!521204) (not e!429233))))

(assert (=> b!770814 (= res!521204 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20692 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20692 a!3186))))))

(declare-fun b!770815 () Bool)

(declare-fun res!521199 () Bool)

(assert (=> b!770815 (=> (not res!521199) (not e!429233))))

(assert (=> b!770815 (= res!521199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770816 () Bool)

(declare-fun res!521211 () Bool)

(assert (=> b!770816 (=> (not res!521211) (not e!429228))))

(declare-fun arrayContainsKey!0 (array!42352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770816 (= res!521211 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770817 () Bool)

(assert (=> b!770817 (= e!429234 true)))

(declare-fun lt!343018 () Unit!26503)

(assert (=> b!770817 (= lt!343018 e!429235)))

(declare-fun c!85201 () Bool)

(assert (=> b!770817 (= c!85201 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770817 (= lt!343020 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!770818 () Bool)

(declare-fun res!521205 () Bool)

(assert (=> b!770818 (=> (not res!521205) (not e!429228))))

(assert (=> b!770818 (= res!521205 (validKeyInArray!0 k0!2102))))

(declare-fun b!770819 () Bool)

(declare-fun res!521197 () Bool)

(assert (=> b!770819 (=> (not res!521197) (not e!429233))))

(declare-datatypes ((List!14181 0))(
  ( (Nil!14178) (Cons!14177 (h!15282 (_ BitVec 64)) (t!20488 List!14181)) )
))
(declare-fun arrayNoDuplicates!0 (array!42352 (_ BitVec 32) List!14181) Bool)

(assert (=> b!770819 (= res!521197 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14178))))

(declare-fun b!770820 () Bool)

(assert (=> b!770820 (= e!429232 e!429227)))

(declare-fun res!521198 () Bool)

(assert (=> b!770820 (=> (not res!521198) (not e!429227))))

(assert (=> b!770820 (= res!521198 (= (seekEntryOrOpen!0 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!343013))))

(assert (=> b!770820 (= lt!343013 (Found!7828 j!159))))

(assert (= (and start!66910 res!521196) b!770802))

(assert (= (and b!770802 res!521200) b!770810))

(assert (= (and b!770810 res!521203) b!770818))

(assert (= (and b!770818 res!521205) b!770816))

(assert (= (and b!770816 res!521211) b!770812))

(assert (= (and b!770812 res!521202) b!770815))

(assert (= (and b!770815 res!521199) b!770819))

(assert (= (and b!770819 res!521197) b!770814))

(assert (= (and b!770814 res!521204) b!770809))

(assert (= (and b!770809 res!521206) b!770807))

(assert (= (and b!770807 res!521207) b!770803))

(assert (= (and b!770803 c!85202) b!770808))

(assert (= (and b!770803 (not c!85202)) b!770806))

(assert (= (and b!770803 res!521210) b!770801))

(assert (= (and b!770801 res!521209) b!770813))

(assert (= (and b!770813 res!521201) b!770820))

(assert (= (and b!770820 res!521198) b!770804))

(assert (= (and b!770813 (not res!521208)) b!770817))

(assert (= (and b!770817 c!85201) b!770805))

(assert (= (and b!770817 (not c!85201)) b!770811))

(declare-fun m!716519 () Bool)

(assert (=> b!770810 m!716519))

(assert (=> b!770810 m!716519))

(declare-fun m!716521 () Bool)

(assert (=> b!770810 m!716521))

(assert (=> b!770811 m!716519))

(assert (=> b!770811 m!716519))

(declare-fun m!716523 () Bool)

(assert (=> b!770811 m!716523))

(assert (=> b!770811 m!716519))

(declare-fun m!716525 () Bool)

(assert (=> b!770811 m!716525))

(declare-fun m!716527 () Bool)

(assert (=> start!66910 m!716527))

(declare-fun m!716529 () Bool)

(assert (=> start!66910 m!716529))

(assert (=> b!770820 m!716519))

(assert (=> b!770820 m!716519))

(declare-fun m!716531 () Bool)

(assert (=> b!770820 m!716531))

(assert (=> b!770808 m!716519))

(assert (=> b!770808 m!716519))

(declare-fun m!716533 () Bool)

(assert (=> b!770808 m!716533))

(assert (=> b!770809 m!716519))

(assert (=> b!770809 m!716519))

(declare-fun m!716535 () Bool)

(assert (=> b!770809 m!716535))

(assert (=> b!770809 m!716535))

(assert (=> b!770809 m!716519))

(declare-fun m!716537 () Bool)

(assert (=> b!770809 m!716537))

(declare-fun m!716539 () Bool)

(assert (=> b!770816 m!716539))

(assert (=> b!770804 m!716519))

(assert (=> b!770804 m!716519))

(declare-fun m!716541 () Bool)

(assert (=> b!770804 m!716541))

(declare-fun m!716543 () Bool)

(assert (=> b!770819 m!716543))

(assert (=> b!770806 m!716519))

(assert (=> b!770806 m!716519))

(assert (=> b!770806 m!716523))

(declare-fun m!716545 () Bool)

(assert (=> b!770815 m!716545))

(declare-fun m!716547 () Bool)

(assert (=> b!770801 m!716547))

(assert (=> b!770801 m!716547))

(declare-fun m!716549 () Bool)

(assert (=> b!770801 m!716549))

(declare-fun m!716551 () Bool)

(assert (=> b!770801 m!716551))

(declare-fun m!716553 () Bool)

(assert (=> b!770801 m!716553))

(declare-fun m!716555 () Bool)

(assert (=> b!770801 m!716555))

(assert (=> b!770805 m!716519))

(assert (=> b!770805 m!716519))

(declare-fun m!716557 () Bool)

(assert (=> b!770805 m!716557))

(declare-fun m!716559 () Bool)

(assert (=> b!770818 m!716559))

(declare-fun m!716561 () Bool)

(assert (=> b!770807 m!716561))

(declare-fun m!716563 () Bool)

(assert (=> b!770817 m!716563))

(declare-fun m!716565 () Bool)

(assert (=> b!770813 m!716565))

(declare-fun m!716567 () Bool)

(assert (=> b!770813 m!716567))

(declare-fun m!716569 () Bool)

(assert (=> b!770812 m!716569))

(check-sat (not start!66910) (not b!770818) (not b!770806) (not b!770804) (not b!770819) (not b!770811) (not b!770809) (not b!770816) (not b!770801) (not b!770820) (not b!770817) (not b!770812) (not b!770810) (not b!770808) (not b!770813) (not b!770815) (not b!770805))
(check-sat)
