; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65660 () Bool)

(assert start!65660)

(declare-fun b!752623 () Bool)

(declare-fun res!508393 () Bool)

(declare-fun e!419784 () Bool)

(assert (=> b!752623 (=> (not res!508393) (not e!419784))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41850 0))(
  ( (array!41851 (arr!20039 (Array (_ BitVec 32) (_ BitVec 64))) (size!20460 (_ BitVec 32))) )
))
(declare-fun lt!334693 () array!41850)

(declare-fun lt!334696 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7636 0))(
  ( (MissingZero!7636 (index!32912 (_ BitVec 32))) (Found!7636 (index!32913 (_ BitVec 32))) (Intermediate!7636 (undefined!8448 Bool) (index!32914 (_ BitVec 32)) (x!63837 (_ BitVec 32))) (Undefined!7636) (MissingVacant!7636 (index!32915 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41850 (_ BitVec 32)) SeekEntryResult!7636)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41850 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!752623 (= res!508393 (= (seekEntryOrOpen!0 lt!334696 lt!334693 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334696 lt!334693 mask!3328)))))

(declare-fun b!752624 () Bool)

(declare-fun lt!334691 () SeekEntryResult!7636)

(declare-fun lt!334692 () SeekEntryResult!7636)

(assert (=> b!752624 (= e!419784 (= lt!334691 lt!334692))))

(declare-fun b!752625 () Bool)

(declare-fun e!419783 () Bool)

(assert (=> b!752625 (= e!419783 true)))

(assert (=> b!752625 e!419784))

(declare-fun res!508386 () Bool)

(assert (=> b!752625 (=> (not res!508386) (not e!419784))))

(declare-fun lt!334690 () (_ BitVec 64))

(assert (=> b!752625 (= res!508386 (= lt!334690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25904 0))(
  ( (Unit!25905) )
))
(declare-fun lt!334687 () Unit!25904)

(declare-fun e!419782 () Unit!25904)

(assert (=> b!752625 (= lt!334687 e!419782)))

(declare-fun c!82499 () Bool)

(assert (=> b!752625 (= c!82499 (= lt!334690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752626 () Bool)

(declare-fun res!508396 () Bool)

(declare-fun e!419780 () Bool)

(assert (=> b!752626 (=> (not res!508396) (not e!419780))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752626 (= res!508396 (validKeyInArray!0 k0!2102))))

(declare-fun b!752627 () Bool)

(declare-fun e!419790 () Bool)

(declare-fun e!419789 () Bool)

(assert (=> b!752627 (= e!419790 e!419789)))

(declare-fun res!508395 () Bool)

(assert (=> b!752627 (=> (not res!508395) (not e!419789))))

(declare-fun a!3186 () array!41850)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!334697 () SeekEntryResult!7636)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41850 (_ BitVec 32)) SeekEntryResult!7636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752627 (= res!508395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20039 a!3186) j!159) mask!3328) (select (arr!20039 a!3186) j!159) a!3186 mask!3328) lt!334697))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752627 (= lt!334697 (Intermediate!7636 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752628 () Bool)

(assert (=> b!752628 (= e!419780 e!419790)))

(declare-fun res!508388 () Bool)

(assert (=> b!752628 (=> (not res!508388) (not e!419790))))

(declare-fun lt!334688 () SeekEntryResult!7636)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752628 (= res!508388 (or (= lt!334688 (MissingZero!7636 i!1173)) (= lt!334688 (MissingVacant!7636 i!1173))))))

(assert (=> b!752628 (= lt!334688 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752629 () Bool)

(declare-fun res!508397 () Bool)

(assert (=> b!752629 (=> (not res!508397) (not e!419789))))

(assert (=> b!752629 (= res!508397 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20039 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752630 () Bool)

(declare-fun res!508387 () Bool)

(assert (=> b!752630 (=> (not res!508387) (not e!419780))))

(assert (=> b!752630 (= res!508387 (validKeyInArray!0 (select (arr!20039 a!3186) j!159)))))

(declare-fun b!752631 () Bool)

(declare-fun Unit!25906 () Unit!25904)

(assert (=> b!752631 (= e!419782 Unit!25906)))

(assert (=> b!752631 false))

(declare-fun b!752632 () Bool)

(declare-fun res!508400 () Bool)

(assert (=> b!752632 (=> (not res!508400) (not e!419789))))

(declare-fun e!419781 () Bool)

(assert (=> b!752632 (= res!508400 e!419781)))

(declare-fun c!82500 () Bool)

(assert (=> b!752632 (= c!82500 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752633 () Bool)

(declare-fun e!419788 () Bool)

(assert (=> b!752633 (= e!419788 e!419783)))

(declare-fun res!508399 () Bool)

(assert (=> b!752633 (=> res!508399 e!419783)))

(assert (=> b!752633 (= res!508399 (= lt!334690 lt!334696))))

(assert (=> b!752633 (= lt!334690 (select (store (arr!20039 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752634 () Bool)

(declare-fun e!419785 () Bool)

(assert (=> b!752634 (= e!419789 e!419785)))

(declare-fun res!508390 () Bool)

(assert (=> b!752634 (=> (not res!508390) (not e!419785))))

(declare-fun lt!334695 () SeekEntryResult!7636)

(declare-fun lt!334694 () SeekEntryResult!7636)

(assert (=> b!752634 (= res!508390 (= lt!334695 lt!334694))))

(assert (=> b!752634 (= lt!334694 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334696 lt!334693 mask!3328))))

(assert (=> b!752634 (= lt!334695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334696 mask!3328) lt!334696 lt!334693 mask!3328))))

(assert (=> b!752634 (= lt!334696 (select (store (arr!20039 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752634 (= lt!334693 (array!41851 (store (arr!20039 a!3186) i!1173 k0!2102) (size!20460 a!3186)))))

(declare-fun b!752635 () Bool)

(declare-fun res!508391 () Bool)

(assert (=> b!752635 (=> (not res!508391) (not e!419790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41850 (_ BitVec 32)) Bool)

(assert (=> b!752635 (= res!508391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!508401 () Bool)

(assert (=> start!65660 (=> (not res!508401) (not e!419780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65660 (= res!508401 (validMask!0 mask!3328))))

(assert (=> start!65660 e!419780))

(assert (=> start!65660 true))

(declare-fun array_inv!15922 (array!41850) Bool)

(assert (=> start!65660 (array_inv!15922 a!3186)))

(declare-fun b!752636 () Bool)

(assert (=> b!752636 (= e!419781 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20039 a!3186) j!159) a!3186 mask!3328) lt!334697))))

(declare-fun b!752637 () Bool)

(declare-fun res!508398 () Bool)

(assert (=> b!752637 (=> (not res!508398) (not e!419790))))

(declare-datatypes ((List!14080 0))(
  ( (Nil!14077) (Cons!14076 (h!15148 (_ BitVec 64)) (t!20386 List!14080)) )
))
(declare-fun arrayNoDuplicates!0 (array!41850 (_ BitVec 32) List!14080) Bool)

(assert (=> b!752637 (= res!508398 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14077))))

(declare-fun b!752638 () Bool)

(assert (=> b!752638 (= e!419781 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20039 a!3186) j!159) a!3186 mask!3328) (Found!7636 j!159)))))

(declare-fun b!752639 () Bool)

(declare-fun res!508389 () Bool)

(assert (=> b!752639 (=> (not res!508389) (not e!419780))))

(assert (=> b!752639 (= res!508389 (and (= (size!20460 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20460 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20460 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752640 () Bool)

(declare-fun res!508394 () Bool)

(assert (=> b!752640 (=> (not res!508394) (not e!419790))))

(assert (=> b!752640 (= res!508394 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20460 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20460 a!3186))))))

(declare-fun b!752641 () Bool)

(declare-fun res!508403 () Bool)

(assert (=> b!752641 (=> (not res!508403) (not e!419780))))

(declare-fun arrayContainsKey!0 (array!41850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752641 (= res!508403 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!419791 () Bool)

(declare-fun lt!334686 () SeekEntryResult!7636)

(declare-fun b!752642 () Bool)

(assert (=> b!752642 (= e!419791 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20039 a!3186) j!159) a!3186 mask!3328) lt!334686))))

(declare-fun b!752643 () Bool)

(declare-fun e!419787 () Bool)

(assert (=> b!752643 (= e!419787 e!419788)))

(declare-fun res!508392 () Bool)

(assert (=> b!752643 (=> res!508392 e!419788)))

(assert (=> b!752643 (= res!508392 (not (= lt!334692 lt!334686)))))

(assert (=> b!752643 (= lt!334692 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20039 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752644 () Bool)

(declare-fun Unit!25907 () Unit!25904)

(assert (=> b!752644 (= e!419782 Unit!25907)))

(declare-fun b!752645 () Bool)

(assert (=> b!752645 (= e!419785 (not e!419787))))

(declare-fun res!508404 () Bool)

(assert (=> b!752645 (=> res!508404 e!419787)))

(get-info :version)

(assert (=> b!752645 (= res!508404 (or (not ((_ is Intermediate!7636) lt!334694)) (bvslt x!1131 (x!63837 lt!334694)) (not (= x!1131 (x!63837 lt!334694))) (not (= index!1321 (index!32914 lt!334694)))))))

(assert (=> b!752645 e!419791))

(declare-fun res!508402 () Bool)

(assert (=> b!752645 (=> (not res!508402) (not e!419791))))

(assert (=> b!752645 (= res!508402 (= lt!334691 lt!334686))))

(assert (=> b!752645 (= lt!334686 (Found!7636 j!159))))

(assert (=> b!752645 (= lt!334691 (seekEntryOrOpen!0 (select (arr!20039 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752645 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334689 () Unit!25904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25904)

(assert (=> b!752645 (= lt!334689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65660 res!508401) b!752639))

(assert (= (and b!752639 res!508389) b!752630))

(assert (= (and b!752630 res!508387) b!752626))

(assert (= (and b!752626 res!508396) b!752641))

(assert (= (and b!752641 res!508403) b!752628))

(assert (= (and b!752628 res!508388) b!752635))

(assert (= (and b!752635 res!508391) b!752637))

(assert (= (and b!752637 res!508398) b!752640))

(assert (= (and b!752640 res!508394) b!752627))

(assert (= (and b!752627 res!508395) b!752629))

(assert (= (and b!752629 res!508397) b!752632))

(assert (= (and b!752632 c!82500) b!752636))

(assert (= (and b!752632 (not c!82500)) b!752638))

(assert (= (and b!752632 res!508400) b!752634))

(assert (= (and b!752634 res!508390) b!752645))

(assert (= (and b!752645 res!508402) b!752642))

(assert (= (and b!752645 (not res!508404)) b!752643))

(assert (= (and b!752643 (not res!508392)) b!752633))

(assert (= (and b!752633 (not res!508399)) b!752625))

(assert (= (and b!752625 c!82499) b!752631))

(assert (= (and b!752625 (not c!82499)) b!752644))

(assert (= (and b!752625 res!508386) b!752623))

(assert (= (and b!752623 res!508393) b!752624))

(declare-fun m!700949 () Bool)

(assert (=> b!752623 m!700949))

(declare-fun m!700951 () Bool)

(assert (=> b!752623 m!700951))

(declare-fun m!700953 () Bool)

(assert (=> b!752626 m!700953))

(declare-fun m!700955 () Bool)

(assert (=> b!752636 m!700955))

(assert (=> b!752636 m!700955))

(declare-fun m!700957 () Bool)

(assert (=> b!752636 m!700957))

(declare-fun m!700959 () Bool)

(assert (=> b!752628 m!700959))

(declare-fun m!700961 () Bool)

(assert (=> start!65660 m!700961))

(declare-fun m!700963 () Bool)

(assert (=> start!65660 m!700963))

(declare-fun m!700965 () Bool)

(assert (=> b!752637 m!700965))

(assert (=> b!752645 m!700955))

(assert (=> b!752645 m!700955))

(declare-fun m!700967 () Bool)

(assert (=> b!752645 m!700967))

(declare-fun m!700969 () Bool)

(assert (=> b!752645 m!700969))

(declare-fun m!700971 () Bool)

(assert (=> b!752645 m!700971))

(assert (=> b!752627 m!700955))

(assert (=> b!752627 m!700955))

(declare-fun m!700973 () Bool)

(assert (=> b!752627 m!700973))

(assert (=> b!752627 m!700973))

(assert (=> b!752627 m!700955))

(declare-fun m!700975 () Bool)

(assert (=> b!752627 m!700975))

(declare-fun m!700977 () Bool)

(assert (=> b!752634 m!700977))

(declare-fun m!700979 () Bool)

(assert (=> b!752634 m!700979))

(declare-fun m!700981 () Bool)

(assert (=> b!752634 m!700981))

(assert (=> b!752634 m!700977))

(declare-fun m!700983 () Bool)

(assert (=> b!752634 m!700983))

(declare-fun m!700985 () Bool)

(assert (=> b!752634 m!700985))

(assert (=> b!752630 m!700955))

(assert (=> b!752630 m!700955))

(declare-fun m!700987 () Bool)

(assert (=> b!752630 m!700987))

(assert (=> b!752642 m!700955))

(assert (=> b!752642 m!700955))

(declare-fun m!700989 () Bool)

(assert (=> b!752642 m!700989))

(assert (=> b!752638 m!700955))

(assert (=> b!752638 m!700955))

(declare-fun m!700991 () Bool)

(assert (=> b!752638 m!700991))

(declare-fun m!700993 () Bool)

(assert (=> b!752629 m!700993))

(declare-fun m!700995 () Bool)

(assert (=> b!752635 m!700995))

(assert (=> b!752633 m!700979))

(declare-fun m!700997 () Bool)

(assert (=> b!752633 m!700997))

(declare-fun m!700999 () Bool)

(assert (=> b!752641 m!700999))

(assert (=> b!752643 m!700955))

(assert (=> b!752643 m!700955))

(assert (=> b!752643 m!700991))

(check-sat (not b!752628) (not b!752630) (not b!752641) (not b!752635) (not b!752637) (not start!65660) (not b!752636) (not b!752623) (not b!752626) (not b!752645) (not b!752638) (not b!752642) (not b!752634) (not b!752627) (not b!752643))
(check-sat)
