; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65204 () Bool)

(assert start!65204)

(declare-fun b!738594 () Bool)

(declare-fun e!413030 () Bool)

(declare-fun e!413023 () Bool)

(assert (=> b!738594 (= e!413030 e!413023)))

(declare-fun res!496631 () Bool)

(assert (=> b!738594 (=> (not res!496631) (not e!413023))))

(declare-datatypes ((SeekEntryResult!7408 0))(
  ( (MissingZero!7408 (index!32000 (_ BitVec 32))) (Found!7408 (index!32001 (_ BitVec 32))) (Intermediate!7408 (undefined!8220 Bool) (index!32002 (_ BitVec 32)) (x!63001 (_ BitVec 32))) (Undefined!7408) (MissingVacant!7408 (index!32003 (_ BitVec 32))) )
))
(declare-fun lt!327769 () SeekEntryResult!7408)

(declare-fun lt!327766 () SeekEntryResult!7408)

(assert (=> b!738594 (= res!496631 (= lt!327769 lt!327766))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327765 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41394 0))(
  ( (array!41395 (arr!19811 (Array (_ BitVec 32) (_ BitVec 64))) (size!20232 (_ BitVec 32))) )
))
(declare-fun lt!327764 () array!41394)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41394 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!738594 (= lt!327766 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327765 lt!327764 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738594 (= lt!327769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327765 mask!3328) lt!327765 lt!327764 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!41394)

(assert (=> b!738594 (= lt!327765 (select (store (arr!19811 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738594 (= lt!327764 (array!41395 (store (arr!19811 a!3186) i!1173 k0!2102) (size!20232 a!3186)))))

(declare-fun b!738595 () Bool)

(declare-fun e!413029 () Bool)

(declare-fun e!413026 () Bool)

(assert (=> b!738595 (= e!413029 e!413026)))

(declare-fun res!496638 () Bool)

(assert (=> b!738595 (=> res!496638 e!413026)))

(declare-fun lt!327763 () (_ BitVec 32))

(assert (=> b!738595 (= res!496638 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327763 #b00000000000000000000000000000000) (bvsge lt!327763 (size!20232 a!3186))))))

(declare-datatypes ((Unit!25208 0))(
  ( (Unit!25209) )
))
(declare-fun lt!327770 () Unit!25208)

(declare-fun e!413024 () Unit!25208)

(assert (=> b!738595 (= lt!327770 e!413024)))

(declare-fun c!81369 () Bool)

(declare-fun lt!327761 () Bool)

(assert (=> b!738595 (= c!81369 lt!327761)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738595 (= lt!327761 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738595 (= lt!327763 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!327771 () SeekEntryResult!7408)

(declare-fun e!413021 () Bool)

(declare-fun b!738597 () Bool)

(assert (=> b!738597 (= e!413021 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327771))))

(declare-fun b!738598 () Bool)

(declare-fun res!496637 () Bool)

(declare-fun e!413031 () Bool)

(assert (=> b!738598 (=> (not res!496637) (not e!413031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738598 (= res!496637 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!738599 () Bool)

(declare-fun lt!327768 () SeekEntryResult!7408)

(declare-fun e!413022 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41394 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!738599 (= e!413022 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327763 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327768)))))

(declare-fun b!738600 () Bool)

(assert (=> b!738600 (= e!413023 (not e!413029))))

(declare-fun res!496627 () Bool)

(assert (=> b!738600 (=> res!496627 e!413029)))

(get-info :version)

(assert (=> b!738600 (= res!496627 (or (not ((_ is Intermediate!7408) lt!327766)) (bvsge x!1131 (x!63001 lt!327766))))))

(assert (=> b!738600 (= lt!327768 (Found!7408 j!159))))

(declare-fun e!413028 () Bool)

(assert (=> b!738600 e!413028))

(declare-fun res!496621 () Bool)

(assert (=> b!738600 (=> (not res!496621) (not e!413028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41394 (_ BitVec 32)) Bool)

(assert (=> b!738600 (= res!496621 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327760 () Unit!25208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25208)

(assert (=> b!738600 (= lt!327760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738601 () Bool)

(declare-fun e!413025 () Bool)

(assert (=> b!738601 (= e!413025 e!413030)))

(declare-fun res!496635 () Bool)

(assert (=> b!738601 (=> (not res!496635) (not e!413030))))

(assert (=> b!738601 (= res!496635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19811 a!3186) j!159) mask!3328) (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327771))))

(assert (=> b!738601 (= lt!327771 (Intermediate!7408 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738602 () Bool)

(declare-fun res!496622 () Bool)

(assert (=> b!738602 (=> (not res!496622) (not e!413031))))

(assert (=> b!738602 (= res!496622 (validKeyInArray!0 (select (arr!19811 a!3186) j!159)))))

(declare-fun b!738603 () Bool)

(declare-fun res!496623 () Bool)

(assert (=> b!738603 (=> (not res!496623) (not e!413030))))

(assert (=> b!738603 (= res!496623 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19811 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738604 () Bool)

(declare-fun lt!327772 () SeekEntryResult!7408)

(declare-fun e!413032 () Bool)

(assert (=> b!738604 (= e!413032 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327772))))

(declare-fun b!738605 () Bool)

(assert (=> b!738605 (= e!413022 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327763 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327771)))))

(declare-fun b!738606 () Bool)

(declare-fun res!496636 () Bool)

(assert (=> b!738606 (=> (not res!496636) (not e!413031))))

(declare-fun arrayContainsKey!0 (array!41394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738606 (= res!496636 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738607 () Bool)

(assert (=> b!738607 (= e!413026 true)))

(declare-fun lt!327762 () SeekEntryResult!7408)

(assert (=> b!738607 (= lt!327762 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327763 lt!327765 lt!327764 mask!3328))))

(declare-fun b!738608 () Bool)

(declare-fun res!496633 () Bool)

(assert (=> b!738608 (=> (not res!496633) (not e!413025))))

(declare-datatypes ((List!13852 0))(
  ( (Nil!13849) (Cons!13848 (h!14920 (_ BitVec 64)) (t!20158 List!13852)) )
))
(declare-fun arrayNoDuplicates!0 (array!41394 (_ BitVec 32) List!13852) Bool)

(assert (=> b!738608 (= res!496633 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13849))))

(declare-fun b!738609 () Bool)

(assert (=> b!738609 (= e!413028 e!413032)))

(declare-fun res!496632 () Bool)

(assert (=> b!738609 (=> (not res!496632) (not e!413032))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41394 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!738609 (= res!496632 (= (seekEntryOrOpen!0 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327772))))

(assert (=> b!738609 (= lt!327772 (Found!7408 j!159))))

(declare-fun b!738610 () Bool)

(assert (=> b!738610 (= e!413021 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) (Found!7408 j!159)))))

(declare-fun b!738611 () Bool)

(declare-fun res!496628 () Bool)

(assert (=> b!738611 (=> (not res!496628) (not e!413030))))

(assert (=> b!738611 (= res!496628 e!413021)))

(declare-fun c!81368 () Bool)

(assert (=> b!738611 (= c!81368 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!496626 () Bool)

(assert (=> start!65204 (=> (not res!496626) (not e!413031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65204 (= res!496626 (validMask!0 mask!3328))))

(assert (=> start!65204 e!413031))

(assert (=> start!65204 true))

(declare-fun array_inv!15694 (array!41394) Bool)

(assert (=> start!65204 (array_inv!15694 a!3186)))

(declare-fun b!738596 () Bool)

(declare-fun res!496624 () Bool)

(assert (=> b!738596 (=> res!496624 e!413026)))

(assert (=> b!738596 (= res!496624 e!413022)))

(declare-fun c!81367 () Bool)

(assert (=> b!738596 (= c!81367 lt!327761)))

(declare-fun b!738612 () Bool)

(assert (=> b!738612 (= e!413031 e!413025)))

(declare-fun res!496625 () Bool)

(assert (=> b!738612 (=> (not res!496625) (not e!413025))))

(declare-fun lt!327773 () SeekEntryResult!7408)

(assert (=> b!738612 (= res!496625 (or (= lt!327773 (MissingZero!7408 i!1173)) (= lt!327773 (MissingVacant!7408 i!1173))))))

(assert (=> b!738612 (= lt!327773 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738613 () Bool)

(declare-fun Unit!25210 () Unit!25208)

(assert (=> b!738613 (= e!413024 Unit!25210)))

(assert (=> b!738613 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327763 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327771)))

(declare-fun b!738614 () Bool)

(declare-fun res!496629 () Bool)

(assert (=> b!738614 (=> (not res!496629) (not e!413025))))

(assert (=> b!738614 (= res!496629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738615 () Bool)

(declare-fun res!496630 () Bool)

(assert (=> b!738615 (=> (not res!496630) (not e!413025))))

(assert (=> b!738615 (= res!496630 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20232 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20232 a!3186))))))

(declare-fun b!738616 () Bool)

(declare-fun Unit!25211 () Unit!25208)

(assert (=> b!738616 (= e!413024 Unit!25211)))

(declare-fun lt!327767 () SeekEntryResult!7408)

(assert (=> b!738616 (= lt!327767 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738616 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327763 resIntermediateIndex!5 (select (arr!19811 a!3186) j!159) a!3186 mask!3328) lt!327768)))

(declare-fun b!738617 () Bool)

(declare-fun res!496634 () Bool)

(assert (=> b!738617 (=> (not res!496634) (not e!413031))))

(assert (=> b!738617 (= res!496634 (and (= (size!20232 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20232 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20232 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65204 res!496626) b!738617))

(assert (= (and b!738617 res!496634) b!738602))

(assert (= (and b!738602 res!496622) b!738598))

(assert (= (and b!738598 res!496637) b!738606))

(assert (= (and b!738606 res!496636) b!738612))

(assert (= (and b!738612 res!496625) b!738614))

(assert (= (and b!738614 res!496629) b!738608))

(assert (= (and b!738608 res!496633) b!738615))

(assert (= (and b!738615 res!496630) b!738601))

(assert (= (and b!738601 res!496635) b!738603))

(assert (= (and b!738603 res!496623) b!738611))

(assert (= (and b!738611 c!81368) b!738597))

(assert (= (and b!738611 (not c!81368)) b!738610))

(assert (= (and b!738611 res!496628) b!738594))

(assert (= (and b!738594 res!496631) b!738600))

(assert (= (and b!738600 res!496621) b!738609))

(assert (= (and b!738609 res!496632) b!738604))

(assert (= (and b!738600 (not res!496627)) b!738595))

(assert (= (and b!738595 c!81369) b!738613))

(assert (= (and b!738595 (not c!81369)) b!738616))

(assert (= (and b!738595 (not res!496638)) b!738596))

(assert (= (and b!738596 c!81367) b!738605))

(assert (= (and b!738596 (not c!81367)) b!738599))

(assert (= (and b!738596 (not res!496624)) b!738607))

(declare-fun m!689615 () Bool)

(assert (=> b!738616 m!689615))

(assert (=> b!738616 m!689615))

(declare-fun m!689617 () Bool)

(assert (=> b!738616 m!689617))

(assert (=> b!738616 m!689615))

(declare-fun m!689619 () Bool)

(assert (=> b!738616 m!689619))

(assert (=> b!738601 m!689615))

(assert (=> b!738601 m!689615))

(declare-fun m!689621 () Bool)

(assert (=> b!738601 m!689621))

(assert (=> b!738601 m!689621))

(assert (=> b!738601 m!689615))

(declare-fun m!689623 () Bool)

(assert (=> b!738601 m!689623))

(declare-fun m!689625 () Bool)

(assert (=> b!738614 m!689625))

(assert (=> b!738604 m!689615))

(assert (=> b!738604 m!689615))

(declare-fun m!689627 () Bool)

(assert (=> b!738604 m!689627))

(declare-fun m!689629 () Bool)

(assert (=> b!738608 m!689629))

(declare-fun m!689631 () Bool)

(assert (=> b!738594 m!689631))

(declare-fun m!689633 () Bool)

(assert (=> b!738594 m!689633))

(declare-fun m!689635 () Bool)

(assert (=> b!738594 m!689635))

(declare-fun m!689637 () Bool)

(assert (=> b!738594 m!689637))

(assert (=> b!738594 m!689637))

(declare-fun m!689639 () Bool)

(assert (=> b!738594 m!689639))

(declare-fun m!689641 () Bool)

(assert (=> b!738606 m!689641))

(assert (=> b!738602 m!689615))

(assert (=> b!738602 m!689615))

(declare-fun m!689643 () Bool)

(assert (=> b!738602 m!689643))

(declare-fun m!689645 () Bool)

(assert (=> b!738607 m!689645))

(declare-fun m!689647 () Bool)

(assert (=> b!738600 m!689647))

(declare-fun m!689649 () Bool)

(assert (=> b!738600 m!689649))

(declare-fun m!689651 () Bool)

(assert (=> b!738595 m!689651))

(assert (=> b!738609 m!689615))

(assert (=> b!738609 m!689615))

(declare-fun m!689653 () Bool)

(assert (=> b!738609 m!689653))

(declare-fun m!689655 () Bool)

(assert (=> start!65204 m!689655))

(declare-fun m!689657 () Bool)

(assert (=> start!65204 m!689657))

(assert (=> b!738613 m!689615))

(assert (=> b!738613 m!689615))

(declare-fun m!689659 () Bool)

(assert (=> b!738613 m!689659))

(assert (=> b!738599 m!689615))

(assert (=> b!738599 m!689615))

(assert (=> b!738599 m!689619))

(declare-fun m!689661 () Bool)

(assert (=> b!738612 m!689661))

(declare-fun m!689663 () Bool)

(assert (=> b!738603 m!689663))

(assert (=> b!738605 m!689615))

(assert (=> b!738605 m!689615))

(assert (=> b!738605 m!689659))

(assert (=> b!738610 m!689615))

(assert (=> b!738610 m!689615))

(assert (=> b!738610 m!689617))

(assert (=> b!738597 m!689615))

(assert (=> b!738597 m!689615))

(declare-fun m!689665 () Bool)

(assert (=> b!738597 m!689665))

(declare-fun m!689667 () Bool)

(assert (=> b!738598 m!689667))

(check-sat (not b!738610) (not b!738604) (not b!738598) (not b!738614) (not b!738612) (not b!738594) (not start!65204) (not b!738601) (not b!738609) (not b!738613) (not b!738606) (not b!738607) (not b!738597) (not b!738602) (not b!738600) (not b!738599) (not b!738595) (not b!738605) (not b!738616) (not b!738608))
(check-sat)
