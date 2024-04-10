; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66788 () Bool)

(assert start!66788)

(declare-fun b!770036 () Bool)

(declare-fun e!428751 () Bool)

(declare-fun e!428756 () Bool)

(assert (=> b!770036 (= e!428751 e!428756)))

(declare-fun res!520834 () Bool)

(assert (=> b!770036 (=> (not res!520834) (not e!428756))))

(declare-datatypes ((SeekEntryResult!7875 0))(
  ( (MissingZero!7875 (index!33868 (_ BitVec 32))) (Found!7875 (index!33869 (_ BitVec 32))) (Intermediate!7875 (undefined!8687 Bool) (index!33870 (_ BitVec 32)) (x!64798 (_ BitVec 32))) (Undefined!7875) (MissingVacant!7875 (index!33871 (_ BitVec 32))) )
))
(declare-fun lt!342676 () SeekEntryResult!7875)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770036 (= res!520834 (or (= lt!342676 (MissingZero!7875 i!1173)) (= lt!342676 (MissingVacant!7875 i!1173))))))

(declare-datatypes ((array!42350 0))(
  ( (array!42351 (arr!20275 (Array (_ BitVec 32) (_ BitVec 64))) (size!20696 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42350)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42350 (_ BitVec 32)) SeekEntryResult!7875)

(assert (=> b!770036 (= lt!342676 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770037 () Bool)

(declare-fun res!520836 () Bool)

(declare-fun e!428757 () Bool)

(assert (=> b!770037 (=> (not res!520836) (not e!428757))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!770037 (= res!520836 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20275 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770038 () Bool)

(declare-fun e!428754 () Bool)

(assert (=> b!770038 (= e!428754 true)))

(declare-datatypes ((Unit!26514 0))(
  ( (Unit!26515) )
))
(declare-fun lt!342675 () Unit!26514)

(declare-fun e!428750 () Unit!26514)

(assert (=> b!770038 (= lt!342675 e!428750)))

(declare-fun c!85000 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770038 (= c!85000 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342677 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770038 (= lt!342677 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!770039 () Bool)

(declare-fun e!428759 () Bool)

(declare-fun lt!342682 () SeekEntryResult!7875)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42350 (_ BitVec 32)) SeekEntryResult!7875)

(assert (=> b!770039 (= e!428759 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!342682))))

(declare-fun b!770040 () Bool)

(declare-fun Unit!26516 () Unit!26514)

(assert (=> b!770040 (= e!428750 Unit!26516)))

(declare-fun lt!342681 () SeekEntryResult!7875)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42350 (_ BitVec 32)) SeekEntryResult!7875)

(assert (=> b!770040 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342677 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!342681)))

(declare-fun b!770041 () Bool)

(declare-fun res!520842 () Bool)

(assert (=> b!770041 (=> (not res!520842) (not e!428756))))

(assert (=> b!770041 (= res!520842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20696 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20696 a!3186))))))

(declare-fun b!770042 () Bool)

(declare-fun e!428755 () Bool)

(assert (=> b!770042 (= e!428757 e!428755)))

(declare-fun res!520830 () Bool)

(assert (=> b!770042 (=> (not res!520830) (not e!428755))))

(declare-fun lt!342674 () SeekEntryResult!7875)

(declare-fun lt!342673 () SeekEntryResult!7875)

(assert (=> b!770042 (= res!520830 (= lt!342674 lt!342673))))

(declare-fun lt!342679 () array!42350)

(declare-fun lt!342680 () (_ BitVec 64))

(assert (=> b!770042 (= lt!342673 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342680 lt!342679 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770042 (= lt!342674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342680 mask!3328) lt!342680 lt!342679 mask!3328))))

(assert (=> b!770042 (= lt!342680 (select (store (arr!20275 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770042 (= lt!342679 (array!42351 (store (arr!20275 a!3186) i!1173 k0!2102) (size!20696 a!3186)))))

(declare-fun e!428753 () Bool)

(declare-fun b!770043 () Bool)

(assert (=> b!770043 (= e!428753 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) (Found!7875 j!159)))))

(declare-fun b!770044 () Bool)

(declare-fun res!520839 () Bool)

(assert (=> b!770044 (=> (not res!520839) (not e!428751))))

(assert (=> b!770044 (= res!520839 (and (= (size!20696 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20696 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20696 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770045 () Bool)

(declare-fun Unit!26517 () Unit!26514)

(assert (=> b!770045 (= e!428750 Unit!26517)))

(declare-fun lt!342678 () SeekEntryResult!7875)

(assert (=> b!770045 (= lt!342678 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770045 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342677 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) (Found!7875 j!159))))

(declare-fun b!770047 () Bool)

(declare-fun res!520833 () Bool)

(assert (=> b!770047 (=> (not res!520833) (not e!428756))))

(declare-datatypes ((List!14277 0))(
  ( (Nil!14274) (Cons!14273 (h!15372 (_ BitVec 64)) (t!20592 List!14277)) )
))
(declare-fun arrayNoDuplicates!0 (array!42350 (_ BitVec 32) List!14277) Bool)

(assert (=> b!770047 (= res!520833 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14274))))

(declare-fun b!770048 () Bool)

(declare-fun res!520831 () Bool)

(assert (=> b!770048 (=> (not res!520831) (not e!428751))))

(declare-fun arrayContainsKey!0 (array!42350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770048 (= res!520831 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770049 () Bool)

(declare-fun res!520838 () Bool)

(assert (=> b!770049 (=> (not res!520838) (not e!428756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42350 (_ BitVec 32)) Bool)

(assert (=> b!770049 (= res!520838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770050 () Bool)

(declare-fun res!520840 () Bool)

(assert (=> b!770050 (=> (not res!520840) (not e!428751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770050 (= res!520840 (validKeyInArray!0 k0!2102))))

(declare-fun b!770051 () Bool)

(declare-fun res!520843 () Bool)

(assert (=> b!770051 (=> (not res!520843) (not e!428751))))

(assert (=> b!770051 (= res!520843 (validKeyInArray!0 (select (arr!20275 a!3186) j!159)))))

(declare-fun b!770052 () Bool)

(assert (=> b!770052 (= e!428755 (not e!428754))))

(declare-fun res!520837 () Bool)

(assert (=> b!770052 (=> res!520837 e!428754)))

(get-info :version)

(assert (=> b!770052 (= res!520837 (or (not ((_ is Intermediate!7875) lt!342673)) (bvsge x!1131 (x!64798 lt!342673))))))

(declare-fun e!428752 () Bool)

(assert (=> b!770052 e!428752))

(declare-fun res!520829 () Bool)

(assert (=> b!770052 (=> (not res!520829) (not e!428752))))

(assert (=> b!770052 (= res!520829 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342683 () Unit!26514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26514)

(assert (=> b!770052 (= lt!342683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770053 () Bool)

(assert (=> b!770053 (= e!428753 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!342681))))

(declare-fun b!770046 () Bool)

(assert (=> b!770046 (= e!428752 e!428759)))

(declare-fun res!520835 () Bool)

(assert (=> b!770046 (=> (not res!520835) (not e!428759))))

(assert (=> b!770046 (= res!520835 (= (seekEntryOrOpen!0 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!342682))))

(assert (=> b!770046 (= lt!342682 (Found!7875 j!159))))

(declare-fun res!520844 () Bool)

(assert (=> start!66788 (=> (not res!520844) (not e!428751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66788 (= res!520844 (validMask!0 mask!3328))))

(assert (=> start!66788 e!428751))

(assert (=> start!66788 true))

(declare-fun array_inv!16071 (array!42350) Bool)

(assert (=> start!66788 (array_inv!16071 a!3186)))

(declare-fun b!770054 () Bool)

(declare-fun res!520841 () Bool)

(assert (=> b!770054 (=> (not res!520841) (not e!428757))))

(assert (=> b!770054 (= res!520841 e!428753)))

(declare-fun c!84999 () Bool)

(assert (=> b!770054 (= c!84999 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770055 () Bool)

(assert (=> b!770055 (= e!428756 e!428757)))

(declare-fun res!520832 () Bool)

(assert (=> b!770055 (=> (not res!520832) (not e!428757))))

(assert (=> b!770055 (= res!520832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20275 a!3186) j!159) mask!3328) (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!342681))))

(assert (=> b!770055 (= lt!342681 (Intermediate!7875 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66788 res!520844) b!770044))

(assert (= (and b!770044 res!520839) b!770051))

(assert (= (and b!770051 res!520843) b!770050))

(assert (= (and b!770050 res!520840) b!770048))

(assert (= (and b!770048 res!520831) b!770036))

(assert (= (and b!770036 res!520834) b!770049))

(assert (= (and b!770049 res!520838) b!770047))

(assert (= (and b!770047 res!520833) b!770041))

(assert (= (and b!770041 res!520842) b!770055))

(assert (= (and b!770055 res!520832) b!770037))

(assert (= (and b!770037 res!520836) b!770054))

(assert (= (and b!770054 c!84999) b!770053))

(assert (= (and b!770054 (not c!84999)) b!770043))

(assert (= (and b!770054 res!520841) b!770042))

(assert (= (and b!770042 res!520830) b!770052))

(assert (= (and b!770052 res!520829) b!770046))

(assert (= (and b!770046 res!520835) b!770039))

(assert (= (and b!770052 (not res!520837)) b!770038))

(assert (= (and b!770038 c!85000) b!770040))

(assert (= (and b!770038 (not c!85000)) b!770045))

(declare-fun m!715371 () Bool)

(assert (=> start!66788 m!715371))

(declare-fun m!715373 () Bool)

(assert (=> start!66788 m!715373))

(declare-fun m!715375 () Bool)

(assert (=> b!770037 m!715375))

(declare-fun m!715377 () Bool)

(assert (=> b!770046 m!715377))

(assert (=> b!770046 m!715377))

(declare-fun m!715379 () Bool)

(assert (=> b!770046 m!715379))

(declare-fun m!715381 () Bool)

(assert (=> b!770036 m!715381))

(declare-fun m!715383 () Bool)

(assert (=> b!770042 m!715383))

(assert (=> b!770042 m!715383))

(declare-fun m!715385 () Bool)

(assert (=> b!770042 m!715385))

(declare-fun m!715387 () Bool)

(assert (=> b!770042 m!715387))

(declare-fun m!715389 () Bool)

(assert (=> b!770042 m!715389))

(declare-fun m!715391 () Bool)

(assert (=> b!770042 m!715391))

(assert (=> b!770040 m!715377))

(assert (=> b!770040 m!715377))

(declare-fun m!715393 () Bool)

(assert (=> b!770040 m!715393))

(assert (=> b!770039 m!715377))

(assert (=> b!770039 m!715377))

(declare-fun m!715395 () Bool)

(assert (=> b!770039 m!715395))

(declare-fun m!715397 () Bool)

(assert (=> b!770038 m!715397))

(declare-fun m!715399 () Bool)

(assert (=> b!770047 m!715399))

(assert (=> b!770053 m!715377))

(assert (=> b!770053 m!715377))

(declare-fun m!715401 () Bool)

(assert (=> b!770053 m!715401))

(declare-fun m!715403 () Bool)

(assert (=> b!770048 m!715403))

(declare-fun m!715405 () Bool)

(assert (=> b!770052 m!715405))

(declare-fun m!715407 () Bool)

(assert (=> b!770052 m!715407))

(assert (=> b!770051 m!715377))

(assert (=> b!770051 m!715377))

(declare-fun m!715409 () Bool)

(assert (=> b!770051 m!715409))

(assert (=> b!770055 m!715377))

(assert (=> b!770055 m!715377))

(declare-fun m!715411 () Bool)

(assert (=> b!770055 m!715411))

(assert (=> b!770055 m!715411))

(assert (=> b!770055 m!715377))

(declare-fun m!715413 () Bool)

(assert (=> b!770055 m!715413))

(assert (=> b!770043 m!715377))

(assert (=> b!770043 m!715377))

(declare-fun m!715415 () Bool)

(assert (=> b!770043 m!715415))

(declare-fun m!715417 () Bool)

(assert (=> b!770049 m!715417))

(assert (=> b!770045 m!715377))

(assert (=> b!770045 m!715377))

(assert (=> b!770045 m!715415))

(assert (=> b!770045 m!715377))

(declare-fun m!715419 () Bool)

(assert (=> b!770045 m!715419))

(declare-fun m!715421 () Bool)

(assert (=> b!770050 m!715421))

(check-sat (not b!770047) (not b!770039) (not b!770045) (not b!770048) (not b!770046) (not b!770043) (not b!770051) (not b!770038) (not b!770036) (not b!770050) (not start!66788) (not b!770040) (not b!770049) (not b!770055) (not b!770042) (not b!770053) (not b!770052))
(check-sat)
