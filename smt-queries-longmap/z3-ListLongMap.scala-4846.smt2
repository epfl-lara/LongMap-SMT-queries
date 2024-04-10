; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66776 () Bool)

(assert start!66776)

(declare-fun b!769676 () Bool)

(declare-fun e!428576 () Bool)

(declare-fun e!428574 () Bool)

(assert (=> b!769676 (= e!428576 e!428574)))

(declare-fun res!520555 () Bool)

(assert (=> b!769676 (=> (not res!520555) (not e!428574))))

(declare-datatypes ((SeekEntryResult!7869 0))(
  ( (MissingZero!7869 (index!33844 (_ BitVec 32))) (Found!7869 (index!33845 (_ BitVec 32))) (Intermediate!7869 (undefined!8681 Bool) (index!33846 (_ BitVec 32)) (x!64776 (_ BitVec 32))) (Undefined!7869) (MissingVacant!7869 (index!33847 (_ BitVec 32))) )
))
(declare-fun lt!342478 () SeekEntryResult!7869)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769676 (= res!520555 (or (= lt!342478 (MissingZero!7869 i!1173)) (= lt!342478 (MissingVacant!7869 i!1173))))))

(declare-datatypes ((array!42338 0))(
  ( (array!42339 (arr!20269 (Array (_ BitVec 32) (_ BitVec 64))) (size!20690 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42338)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42338 (_ BitVec 32)) SeekEntryResult!7869)

(assert (=> b!769676 (= lt!342478 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!520553 () Bool)

(assert (=> start!66776 (=> (not res!520553) (not e!428576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66776 (= res!520553 (validMask!0 mask!3328))))

(assert (=> start!66776 e!428576))

(assert (=> start!66776 true))

(declare-fun array_inv!16065 (array!42338) Bool)

(assert (=> start!66776 (array_inv!16065 a!3186)))

(declare-fun b!769677 () Bool)

(declare-fun e!428579 () Bool)

(assert (=> b!769677 (= e!428574 e!428579)))

(declare-fun res!520541 () Bool)

(assert (=> b!769677 (=> (not res!520541) (not e!428579))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!342482 () SeekEntryResult!7869)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42338 (_ BitVec 32)) SeekEntryResult!7869)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769677 (= res!520541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20269 a!3186) j!159) mask!3328) (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342482))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769677 (= lt!342482 (Intermediate!7869 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769678 () Bool)

(declare-fun res!520548 () Bool)

(assert (=> b!769678 (=> (not res!520548) (not e!428576))))

(assert (=> b!769678 (= res!520548 (and (= (size!20690 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20690 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20690 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769679 () Bool)

(declare-fun res!520549 () Bool)

(assert (=> b!769679 (=> (not res!520549) (not e!428576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769679 (= res!520549 (validKeyInArray!0 (select (arr!20269 a!3186) j!159)))))

(declare-fun b!769680 () Bool)

(declare-datatypes ((Unit!26490 0))(
  ( (Unit!26491) )
))
(declare-fun e!428578 () Unit!26490)

(declare-fun Unit!26492 () Unit!26490)

(assert (=> b!769680 (= e!428578 Unit!26492)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342480 () SeekEntryResult!7869)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42338 (_ BitVec 32)) SeekEntryResult!7869)

(assert (=> b!769680 (= lt!342480 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342475 () (_ BitVec 32))

(assert (=> b!769680 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342475 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) (Found!7869 j!159))))

(declare-fun b!769681 () Bool)

(declare-fun res!520550 () Bool)

(assert (=> b!769681 (=> (not res!520550) (not e!428579))))

(declare-fun e!428577 () Bool)

(assert (=> b!769681 (= res!520550 e!428577)))

(declare-fun c!84964 () Bool)

(assert (=> b!769681 (= c!84964 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769682 () Bool)

(declare-fun res!520545 () Bool)

(assert (=> b!769682 (=> (not res!520545) (not e!428574))))

(assert (=> b!769682 (= res!520545 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20690 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20690 a!3186))))))

(declare-fun b!769683 () Bool)

(assert (=> b!769683 (= e!428577 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342482))))

(declare-fun b!769684 () Bool)

(declare-fun e!428572 () Bool)

(declare-fun e!428571 () Bool)

(assert (=> b!769684 (= e!428572 e!428571)))

(declare-fun res!520551 () Bool)

(assert (=> b!769684 (=> (not res!520551) (not e!428571))))

(declare-fun lt!342479 () SeekEntryResult!7869)

(assert (=> b!769684 (= res!520551 (= (seekEntryOrOpen!0 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342479))))

(assert (=> b!769684 (= lt!342479 (Found!7869 j!159))))

(declare-fun b!769685 () Bool)

(assert (=> b!769685 (= e!428577 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) (Found!7869 j!159)))))

(declare-fun b!769686 () Bool)

(declare-fun Unit!26493 () Unit!26490)

(assert (=> b!769686 (= e!428578 Unit!26493)))

(assert (=> b!769686 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342475 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342482)))

(declare-fun b!769687 () Bool)

(declare-fun res!520546 () Bool)

(assert (=> b!769687 (=> (not res!520546) (not e!428579))))

(assert (=> b!769687 (= res!520546 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20269 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769688 () Bool)

(declare-fun res!520556 () Bool)

(assert (=> b!769688 (=> (not res!520556) (not e!428576))))

(declare-fun arrayContainsKey!0 (array!42338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769688 (= res!520556 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769689 () Bool)

(declare-fun e!428570 () Bool)

(declare-fun e!428573 () Bool)

(assert (=> b!769689 (= e!428570 (not e!428573))))

(declare-fun res!520552 () Bool)

(assert (=> b!769689 (=> res!520552 e!428573)))

(declare-fun lt!342477 () SeekEntryResult!7869)

(get-info :version)

(assert (=> b!769689 (= res!520552 (or (not ((_ is Intermediate!7869) lt!342477)) (bvsge x!1131 (x!64776 lt!342477))))))

(assert (=> b!769689 e!428572))

(declare-fun res!520542 () Bool)

(assert (=> b!769689 (=> (not res!520542) (not e!428572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42338 (_ BitVec 32)) Bool)

(assert (=> b!769689 (= res!520542 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342476 () Unit!26490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26490)

(assert (=> b!769689 (= lt!342476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769690 () Bool)

(assert (=> b!769690 (= e!428571 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20269 a!3186) j!159) a!3186 mask!3328) lt!342479))))

(declare-fun b!769691 () Bool)

(assert (=> b!769691 (= e!428573 true)))

(declare-fun lt!342484 () Unit!26490)

(assert (=> b!769691 (= lt!342484 e!428578)))

(declare-fun c!84963 () Bool)

(assert (=> b!769691 (= c!84963 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769691 (= lt!342475 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769692 () Bool)

(assert (=> b!769692 (= e!428579 e!428570)))

(declare-fun res!520544 () Bool)

(assert (=> b!769692 (=> (not res!520544) (not e!428570))))

(declare-fun lt!342483 () SeekEntryResult!7869)

(assert (=> b!769692 (= res!520544 (= lt!342483 lt!342477))))

(declare-fun lt!342485 () array!42338)

(declare-fun lt!342481 () (_ BitVec 64))

(assert (=> b!769692 (= lt!342477 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342481 lt!342485 mask!3328))))

(assert (=> b!769692 (= lt!342483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342481 mask!3328) lt!342481 lt!342485 mask!3328))))

(assert (=> b!769692 (= lt!342481 (select (store (arr!20269 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769692 (= lt!342485 (array!42339 (store (arr!20269 a!3186) i!1173 k0!2102) (size!20690 a!3186)))))

(declare-fun b!769693 () Bool)

(declare-fun res!520543 () Bool)

(assert (=> b!769693 (=> (not res!520543) (not e!428574))))

(declare-datatypes ((List!14271 0))(
  ( (Nil!14268) (Cons!14267 (h!15366 (_ BitVec 64)) (t!20586 List!14271)) )
))
(declare-fun arrayNoDuplicates!0 (array!42338 (_ BitVec 32) List!14271) Bool)

(assert (=> b!769693 (= res!520543 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14268))))

(declare-fun b!769694 () Bool)

(declare-fun res!520554 () Bool)

(assert (=> b!769694 (=> (not res!520554) (not e!428576))))

(assert (=> b!769694 (= res!520554 (validKeyInArray!0 k0!2102))))

(declare-fun b!769695 () Bool)

(declare-fun res!520547 () Bool)

(assert (=> b!769695 (=> (not res!520547) (not e!428574))))

(assert (=> b!769695 (= res!520547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66776 res!520553) b!769678))

(assert (= (and b!769678 res!520548) b!769679))

(assert (= (and b!769679 res!520549) b!769694))

(assert (= (and b!769694 res!520554) b!769688))

(assert (= (and b!769688 res!520556) b!769676))

(assert (= (and b!769676 res!520555) b!769695))

(assert (= (and b!769695 res!520547) b!769693))

(assert (= (and b!769693 res!520543) b!769682))

(assert (= (and b!769682 res!520545) b!769677))

(assert (= (and b!769677 res!520541) b!769687))

(assert (= (and b!769687 res!520546) b!769681))

(assert (= (and b!769681 c!84964) b!769683))

(assert (= (and b!769681 (not c!84964)) b!769685))

(assert (= (and b!769681 res!520550) b!769692))

(assert (= (and b!769692 res!520544) b!769689))

(assert (= (and b!769689 res!520542) b!769684))

(assert (= (and b!769684 res!520551) b!769690))

(assert (= (and b!769689 (not res!520552)) b!769691))

(assert (= (and b!769691 c!84963) b!769686))

(assert (= (and b!769691 (not c!84963)) b!769680))

(declare-fun m!715059 () Bool)

(assert (=> b!769686 m!715059))

(assert (=> b!769686 m!715059))

(declare-fun m!715061 () Bool)

(assert (=> b!769686 m!715061))

(declare-fun m!715063 () Bool)

(assert (=> start!66776 m!715063))

(declare-fun m!715065 () Bool)

(assert (=> start!66776 m!715065))

(declare-fun m!715067 () Bool)

(assert (=> b!769691 m!715067))

(declare-fun m!715069 () Bool)

(assert (=> b!769693 m!715069))

(assert (=> b!769684 m!715059))

(assert (=> b!769684 m!715059))

(declare-fun m!715071 () Bool)

(assert (=> b!769684 m!715071))

(declare-fun m!715073 () Bool)

(assert (=> b!769695 m!715073))

(declare-fun m!715075 () Bool)

(assert (=> b!769694 m!715075))

(assert (=> b!769690 m!715059))

(assert (=> b!769690 m!715059))

(declare-fun m!715077 () Bool)

(assert (=> b!769690 m!715077))

(assert (=> b!769677 m!715059))

(assert (=> b!769677 m!715059))

(declare-fun m!715079 () Bool)

(assert (=> b!769677 m!715079))

(assert (=> b!769677 m!715079))

(assert (=> b!769677 m!715059))

(declare-fun m!715081 () Bool)

(assert (=> b!769677 m!715081))

(declare-fun m!715083 () Bool)

(assert (=> b!769692 m!715083))

(declare-fun m!715085 () Bool)

(assert (=> b!769692 m!715085))

(declare-fun m!715087 () Bool)

(assert (=> b!769692 m!715087))

(declare-fun m!715089 () Bool)

(assert (=> b!769692 m!715089))

(declare-fun m!715091 () Bool)

(assert (=> b!769692 m!715091))

(assert (=> b!769692 m!715085))

(assert (=> b!769685 m!715059))

(assert (=> b!769685 m!715059))

(declare-fun m!715093 () Bool)

(assert (=> b!769685 m!715093))

(assert (=> b!769680 m!715059))

(assert (=> b!769680 m!715059))

(assert (=> b!769680 m!715093))

(assert (=> b!769680 m!715059))

(declare-fun m!715095 () Bool)

(assert (=> b!769680 m!715095))

(assert (=> b!769683 m!715059))

(assert (=> b!769683 m!715059))

(declare-fun m!715097 () Bool)

(assert (=> b!769683 m!715097))

(declare-fun m!715099 () Bool)

(assert (=> b!769687 m!715099))

(declare-fun m!715101 () Bool)

(assert (=> b!769688 m!715101))

(declare-fun m!715103 () Bool)

(assert (=> b!769676 m!715103))

(declare-fun m!715105 () Bool)

(assert (=> b!769689 m!715105))

(declare-fun m!715107 () Bool)

(assert (=> b!769689 m!715107))

(assert (=> b!769679 m!715059))

(assert (=> b!769679 m!715059))

(declare-fun m!715109 () Bool)

(assert (=> b!769679 m!715109))

(check-sat (not b!769693) (not b!769679) (not b!769677) (not b!769684) (not b!769680) (not b!769685) (not b!769692) (not b!769683) (not start!66776) (not b!769694) (not b!769690) (not b!769686) (not b!769689) (not b!769688) (not b!769695) (not b!769691) (not b!769676))
(check-sat)
