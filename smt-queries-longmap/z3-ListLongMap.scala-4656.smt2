; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64688 () Bool)

(assert start!64688)

(declare-fun b!729624 () Bool)

(declare-fun res!490123 () Bool)

(declare-fun e!408328 () Bool)

(assert (=> b!729624 (=> (not res!490123) (not e!408328))))

(declare-datatypes ((array!41154 0))(
  ( (array!41155 (arr!19697 (Array (_ BitVec 32) (_ BitVec 64))) (size!20118 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41154)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41154 (_ BitVec 32)) Bool)

(assert (=> b!729624 (= res!490123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729625 () Bool)

(declare-fun res!490129 () Bool)

(declare-fun e!408330 () Bool)

(assert (=> b!729625 (=> (not res!490129) (not e!408330))))

(declare-fun e!408333 () Bool)

(assert (=> b!729625 (= res!490129 e!408333)))

(declare-fun c!80127 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729625 (= c!80127 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!490122 () Bool)

(declare-fun e!408331 () Bool)

(assert (=> start!64688 (=> (not res!490122) (not e!408331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64688 (= res!490122 (validMask!0 mask!3328))))

(assert (=> start!64688 e!408331))

(assert (=> start!64688 true))

(declare-fun array_inv!15580 (array!41154) Bool)

(assert (=> start!64688 (array_inv!15580 a!3186)))

(declare-fun b!729626 () Bool)

(declare-fun res!490131 () Bool)

(assert (=> b!729626 (=> (not res!490131) (not e!408331))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729626 (= res!490131 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408327 () Bool)

(declare-fun b!729627 () Bool)

(assert (=> b!729627 (= e!408327 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323147 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729627 (= lt!323147 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729628 () Bool)

(declare-fun res!490125 () Bool)

(assert (=> b!729628 (=> (not res!490125) (not e!408328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!729628 (= res!490125 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20118 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20118 a!3186))))))

(declare-fun b!729629 () Bool)

(declare-fun e!408334 () Bool)

(declare-fun e!408326 () Bool)

(assert (=> b!729629 (= e!408334 e!408326)))

(declare-fun res!490121 () Bool)

(assert (=> b!729629 (=> (not res!490121) (not e!408326))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7294 0))(
  ( (MissingZero!7294 (index!31544 (_ BitVec 32))) (Found!7294 (index!31545 (_ BitVec 32))) (Intermediate!7294 (undefined!8106 Bool) (index!31546 (_ BitVec 32)) (x!62535 (_ BitVec 32))) (Undefined!7294) (MissingVacant!7294 (index!31547 (_ BitVec 32))) )
))
(declare-fun lt!323143 () SeekEntryResult!7294)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41154 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!729629 (= res!490121 (= (seekEntryOrOpen!0 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323143))))

(assert (=> b!729629 (= lt!323143 (Found!7294 j!159))))

(declare-fun b!729630 () Bool)

(declare-fun res!490127 () Bool)

(assert (=> b!729630 (=> (not res!490127) (not e!408328))))

(declare-datatypes ((List!13738 0))(
  ( (Nil!13735) (Cons!13734 (h!14794 (_ BitVec 64)) (t!20044 List!13738)) )
))
(declare-fun arrayNoDuplicates!0 (array!41154 (_ BitVec 32) List!13738) Bool)

(assert (=> b!729630 (= res!490127 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13735))))

(declare-fun b!729631 () Bool)

(declare-fun e!408332 () Bool)

(assert (=> b!729631 (= e!408330 e!408332)))

(declare-fun res!490132 () Bool)

(assert (=> b!729631 (=> (not res!490132) (not e!408332))))

(declare-fun lt!323145 () SeekEntryResult!7294)

(declare-fun lt!323144 () SeekEntryResult!7294)

(assert (=> b!729631 (= res!490132 (= lt!323145 lt!323144))))

(declare-fun lt!323139 () (_ BitVec 64))

(declare-fun lt!323146 () array!41154)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41154 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!729631 (= lt!323144 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323139 lt!323146 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729631 (= lt!323145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323139 mask!3328) lt!323139 lt!323146 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729631 (= lt!323139 (select (store (arr!19697 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729631 (= lt!323146 (array!41155 (store (arr!19697 a!3186) i!1173 k0!2102) (size!20118 a!3186)))))

(declare-fun b!729632 () Bool)

(declare-fun res!490130 () Bool)

(assert (=> b!729632 (=> (not res!490130) (not e!408331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729632 (= res!490130 (validKeyInArray!0 k0!2102))))

(declare-fun b!729633 () Bool)

(declare-fun res!490134 () Bool)

(assert (=> b!729633 (=> (not res!490134) (not e!408330))))

(assert (=> b!729633 (= res!490134 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19697 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41154 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!729634 (= e!408333 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) (Found!7294 j!159)))))

(declare-fun b!729635 () Bool)

(declare-fun lt!323141 () SeekEntryResult!7294)

(assert (=> b!729635 (= e!408333 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323141))))

(declare-fun b!729636 () Bool)

(assert (=> b!729636 (= e!408331 e!408328)))

(declare-fun res!490128 () Bool)

(assert (=> b!729636 (=> (not res!490128) (not e!408328))))

(declare-fun lt!323142 () SeekEntryResult!7294)

(assert (=> b!729636 (= res!490128 (or (= lt!323142 (MissingZero!7294 i!1173)) (= lt!323142 (MissingVacant!7294 i!1173))))))

(assert (=> b!729636 (= lt!323142 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729637 () Bool)

(assert (=> b!729637 (= e!408326 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323143))))

(declare-fun b!729638 () Bool)

(declare-fun res!490126 () Bool)

(assert (=> b!729638 (=> (not res!490126) (not e!408331))))

(assert (=> b!729638 (= res!490126 (and (= (size!20118 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20118 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20118 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729639 () Bool)

(declare-fun res!490120 () Bool)

(assert (=> b!729639 (=> (not res!490120) (not e!408331))))

(assert (=> b!729639 (= res!490120 (validKeyInArray!0 (select (arr!19697 a!3186) j!159)))))

(declare-fun b!729640 () Bool)

(assert (=> b!729640 (= e!408328 e!408330)))

(declare-fun res!490124 () Bool)

(assert (=> b!729640 (=> (not res!490124) (not e!408330))))

(assert (=> b!729640 (= res!490124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19697 a!3186) j!159) mask!3328) (select (arr!19697 a!3186) j!159) a!3186 mask!3328) lt!323141))))

(assert (=> b!729640 (= lt!323141 (Intermediate!7294 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729641 () Bool)

(assert (=> b!729641 (= e!408332 (not e!408327))))

(declare-fun res!490133 () Bool)

(assert (=> b!729641 (=> res!490133 e!408327)))

(get-info :version)

(assert (=> b!729641 (= res!490133 (or (not ((_ is Intermediate!7294) lt!323144)) (bvsge x!1131 (x!62535 lt!323144))))))

(assert (=> b!729641 e!408334))

(declare-fun res!490119 () Bool)

(assert (=> b!729641 (=> (not res!490119) (not e!408334))))

(assert (=> b!729641 (= res!490119 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24878 0))(
  ( (Unit!24879) )
))
(declare-fun lt!323140 () Unit!24878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24878)

(assert (=> b!729641 (= lt!323140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64688 res!490122) b!729638))

(assert (= (and b!729638 res!490126) b!729639))

(assert (= (and b!729639 res!490120) b!729632))

(assert (= (and b!729632 res!490130) b!729626))

(assert (= (and b!729626 res!490131) b!729636))

(assert (= (and b!729636 res!490128) b!729624))

(assert (= (and b!729624 res!490123) b!729630))

(assert (= (and b!729630 res!490127) b!729628))

(assert (= (and b!729628 res!490125) b!729640))

(assert (= (and b!729640 res!490124) b!729633))

(assert (= (and b!729633 res!490134) b!729625))

(assert (= (and b!729625 c!80127) b!729635))

(assert (= (and b!729625 (not c!80127)) b!729634))

(assert (= (and b!729625 res!490129) b!729631))

(assert (= (and b!729631 res!490132) b!729641))

(assert (= (and b!729641 res!490119) b!729629))

(assert (= (and b!729629 res!490121) b!729637))

(assert (= (and b!729641 (not res!490133)) b!729627))

(declare-fun m!682709 () Bool)

(assert (=> start!64688 m!682709))

(declare-fun m!682711 () Bool)

(assert (=> start!64688 m!682711))

(declare-fun m!682713 () Bool)

(assert (=> b!729639 m!682713))

(assert (=> b!729639 m!682713))

(declare-fun m!682715 () Bool)

(assert (=> b!729639 m!682715))

(declare-fun m!682717 () Bool)

(assert (=> b!729641 m!682717))

(declare-fun m!682719 () Bool)

(assert (=> b!729641 m!682719))

(assert (=> b!729637 m!682713))

(assert (=> b!729637 m!682713))

(declare-fun m!682721 () Bool)

(assert (=> b!729637 m!682721))

(declare-fun m!682723 () Bool)

(assert (=> b!729636 m!682723))

(declare-fun m!682725 () Bool)

(assert (=> b!729624 m!682725))

(declare-fun m!682727 () Bool)

(assert (=> b!729633 m!682727))

(declare-fun m!682729 () Bool)

(assert (=> b!729631 m!682729))

(declare-fun m!682731 () Bool)

(assert (=> b!729631 m!682731))

(declare-fun m!682733 () Bool)

(assert (=> b!729631 m!682733))

(declare-fun m!682735 () Bool)

(assert (=> b!729631 m!682735))

(assert (=> b!729631 m!682735))

(declare-fun m!682737 () Bool)

(assert (=> b!729631 m!682737))

(assert (=> b!729629 m!682713))

(assert (=> b!729629 m!682713))

(declare-fun m!682739 () Bool)

(assert (=> b!729629 m!682739))

(declare-fun m!682741 () Bool)

(assert (=> b!729630 m!682741))

(assert (=> b!729635 m!682713))

(assert (=> b!729635 m!682713))

(declare-fun m!682743 () Bool)

(assert (=> b!729635 m!682743))

(declare-fun m!682745 () Bool)

(assert (=> b!729626 m!682745))

(assert (=> b!729634 m!682713))

(assert (=> b!729634 m!682713))

(declare-fun m!682747 () Bool)

(assert (=> b!729634 m!682747))

(assert (=> b!729640 m!682713))

(assert (=> b!729640 m!682713))

(declare-fun m!682749 () Bool)

(assert (=> b!729640 m!682749))

(assert (=> b!729640 m!682749))

(assert (=> b!729640 m!682713))

(declare-fun m!682751 () Bool)

(assert (=> b!729640 m!682751))

(declare-fun m!682753 () Bool)

(assert (=> b!729632 m!682753))

(declare-fun m!682755 () Bool)

(assert (=> b!729627 m!682755))

(check-sat (not b!729631) (not b!729641) (not start!64688) (not b!729635) (not b!729630) (not b!729640) (not b!729632) (not b!729636) (not b!729639) (not b!729624) (not b!729627) (not b!729626) (not b!729637) (not b!729634) (not b!729629))
(check-sat)
