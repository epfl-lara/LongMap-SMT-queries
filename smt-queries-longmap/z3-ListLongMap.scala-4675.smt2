; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65112 () Bool)

(assert start!65112)

(declare-fun b!734877 () Bool)

(declare-fun res!493724 () Bool)

(declare-fun e!411187 () Bool)

(assert (=> b!734877 (=> (not res!493724) (not e!411187))))

(declare-datatypes ((array!41285 0))(
  ( (array!41286 (arr!19756 (Array (_ BitVec 32) (_ BitVec 64))) (size!20177 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41285)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!734877 (= res!493724 (and (= (size!20177 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20177 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20177 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734878 () Bool)

(declare-fun res!493736 () Bool)

(declare-fun e!411191 () Bool)

(assert (=> b!734878 (=> (not res!493736) (not e!411191))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!734878 (= res!493736 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19756 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734879 () Bool)

(declare-fun res!493723 () Bool)

(assert (=> b!734879 (=> (not res!493723) (not e!411187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734879 (= res!493723 (validKeyInArray!0 (select (arr!19756 a!3186) j!159)))))

(declare-fun b!734880 () Bool)

(declare-fun res!493725 () Bool)

(assert (=> b!734880 (=> (not res!493725) (not e!411191))))

(declare-fun e!411189 () Bool)

(assert (=> b!734880 (= res!493725 e!411189)))

(declare-fun c!80959 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734880 (= c!80959 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734881 () Bool)

(declare-fun e!411192 () Bool)

(assert (=> b!734881 (= e!411192 true)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7356 0))(
  ( (MissingZero!7356 (index!31792 (_ BitVec 32))) (Found!7356 (index!31793 (_ BitVec 32))) (Intermediate!7356 (undefined!8168 Bool) (index!31794 (_ BitVec 32)) (x!62802 (_ BitVec 32))) (Undefined!7356) (MissingVacant!7356 (index!31795 (_ BitVec 32))) )
))
(declare-fun lt!325702 () SeekEntryResult!7356)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41285 (_ BitVec 32)) SeekEntryResult!7356)

(assert (=> b!734881 (= lt!325702 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734882 () Bool)

(declare-fun res!493730 () Bool)

(declare-fun e!411190 () Bool)

(assert (=> b!734882 (=> (not res!493730) (not e!411190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41285 (_ BitVec 32)) Bool)

(assert (=> b!734882 (= res!493730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734883 () Bool)

(declare-fun lt!325704 () SeekEntryResult!7356)

(declare-fun e!411188 () Bool)

(assert (=> b!734883 (= e!411188 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!325704))))

(declare-fun b!734884 () Bool)

(declare-fun res!493733 () Bool)

(assert (=> b!734884 (=> (not res!493733) (not e!411190))))

(assert (=> b!734884 (= res!493733 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20177 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20177 a!3186))))))

(declare-fun b!734885 () Bool)

(declare-fun e!411186 () Bool)

(declare-fun e!411194 () Bool)

(assert (=> b!734885 (= e!411186 (not e!411194))))

(declare-fun res!493734 () Bool)

(assert (=> b!734885 (=> res!493734 e!411194)))

(declare-fun lt!325705 () SeekEntryResult!7356)

(get-info :version)

(assert (=> b!734885 (= res!493734 (or (not ((_ is Intermediate!7356) lt!325705)) (bvsge x!1131 (x!62802 lt!325705))))))

(declare-fun e!411185 () Bool)

(assert (=> b!734885 e!411185))

(declare-fun res!493728 () Bool)

(assert (=> b!734885 (=> (not res!493728) (not e!411185))))

(assert (=> b!734885 (= res!493728 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25030 0))(
  ( (Unit!25031) )
))
(declare-fun lt!325700 () Unit!25030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25030)

(assert (=> b!734885 (= lt!325700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734886 () Bool)

(assert (=> b!734886 (= e!411194 e!411192)))

(declare-fun res!493722 () Bool)

(assert (=> b!734886 (=> res!493722 e!411192)))

(assert (=> b!734886 (= res!493722 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325709 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734886 (= lt!325709 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!325708 () SeekEntryResult!7356)

(declare-fun b!734887 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41285 (_ BitVec 32)) SeekEntryResult!7356)

(assert (=> b!734887 (= e!411189 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!325708))))

(declare-fun b!734888 () Bool)

(assert (=> b!734888 (= e!411187 e!411190)))

(declare-fun res!493729 () Bool)

(assert (=> b!734888 (=> (not res!493729) (not e!411190))))

(declare-fun lt!325707 () SeekEntryResult!7356)

(assert (=> b!734888 (= res!493729 (or (= lt!325707 (MissingZero!7356 i!1173)) (= lt!325707 (MissingVacant!7356 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41285 (_ BitVec 32)) SeekEntryResult!7356)

(assert (=> b!734888 (= lt!325707 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734889 () Bool)

(assert (=> b!734889 (= e!411189 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) (Found!7356 j!159)))))

(declare-fun b!734890 () Bool)

(declare-fun res!493726 () Bool)

(assert (=> b!734890 (=> (not res!493726) (not e!411187))))

(assert (=> b!734890 (= res!493726 (validKeyInArray!0 k0!2102))))

(declare-fun res!493735 () Bool)

(assert (=> start!65112 (=> (not res!493735) (not e!411187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65112 (= res!493735 (validMask!0 mask!3328))))

(assert (=> start!65112 e!411187))

(assert (=> start!65112 true))

(declare-fun array_inv!15552 (array!41285) Bool)

(assert (=> start!65112 (array_inv!15552 a!3186)))

(declare-fun b!734891 () Bool)

(declare-fun res!493721 () Bool)

(assert (=> b!734891 (=> (not res!493721) (not e!411187))))

(declare-fun arrayContainsKey!0 (array!41285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734891 (= res!493721 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734892 () Bool)

(assert (=> b!734892 (= e!411191 e!411186)))

(declare-fun res!493732 () Bool)

(assert (=> b!734892 (=> (not res!493732) (not e!411186))))

(declare-fun lt!325706 () SeekEntryResult!7356)

(assert (=> b!734892 (= res!493732 (= lt!325706 lt!325705))))

(declare-fun lt!325701 () (_ BitVec 64))

(declare-fun lt!325703 () array!41285)

(assert (=> b!734892 (= lt!325705 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325701 lt!325703 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734892 (= lt!325706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325701 mask!3328) lt!325701 lt!325703 mask!3328))))

(assert (=> b!734892 (= lt!325701 (select (store (arr!19756 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734892 (= lt!325703 (array!41286 (store (arr!19756 a!3186) i!1173 k0!2102) (size!20177 a!3186)))))

(declare-fun b!734893 () Bool)

(declare-fun res!493727 () Bool)

(assert (=> b!734893 (=> (not res!493727) (not e!411190))))

(declare-datatypes ((List!13758 0))(
  ( (Nil!13755) (Cons!13754 (h!14826 (_ BitVec 64)) (t!20073 List!13758)) )
))
(declare-fun arrayNoDuplicates!0 (array!41285 (_ BitVec 32) List!13758) Bool)

(assert (=> b!734893 (= res!493727 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13755))))

(declare-fun b!734894 () Bool)

(assert (=> b!734894 (= e!411185 e!411188)))

(declare-fun res!493720 () Bool)

(assert (=> b!734894 (=> (not res!493720) (not e!411188))))

(assert (=> b!734894 (= res!493720 (= (seekEntryOrOpen!0 (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!325704))))

(assert (=> b!734894 (= lt!325704 (Found!7356 j!159))))

(declare-fun b!734895 () Bool)

(assert (=> b!734895 (= e!411190 e!411191)))

(declare-fun res!493731 () Bool)

(assert (=> b!734895 (=> (not res!493731) (not e!411191))))

(assert (=> b!734895 (= res!493731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19756 a!3186) j!159) mask!3328) (select (arr!19756 a!3186) j!159) a!3186 mask!3328) lt!325708))))

(assert (=> b!734895 (= lt!325708 (Intermediate!7356 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65112 res!493735) b!734877))

(assert (= (and b!734877 res!493724) b!734879))

(assert (= (and b!734879 res!493723) b!734890))

(assert (= (and b!734890 res!493726) b!734891))

(assert (= (and b!734891 res!493721) b!734888))

(assert (= (and b!734888 res!493729) b!734882))

(assert (= (and b!734882 res!493730) b!734893))

(assert (= (and b!734893 res!493727) b!734884))

(assert (= (and b!734884 res!493733) b!734895))

(assert (= (and b!734895 res!493731) b!734878))

(assert (= (and b!734878 res!493736) b!734880))

(assert (= (and b!734880 c!80959) b!734887))

(assert (= (and b!734880 (not c!80959)) b!734889))

(assert (= (and b!734880 res!493725) b!734892))

(assert (= (and b!734892 res!493732) b!734885))

(assert (= (and b!734885 res!493728) b!734894))

(assert (= (and b!734894 res!493720) b!734883))

(assert (= (and b!734885 (not res!493734)) b!734886))

(assert (= (and b!734886 (not res!493722)) b!734881))

(declare-fun m!687379 () Bool)

(assert (=> b!734882 m!687379))

(declare-fun m!687381 () Bool)

(assert (=> b!734890 m!687381))

(declare-fun m!687383 () Bool)

(assert (=> b!734895 m!687383))

(assert (=> b!734895 m!687383))

(declare-fun m!687385 () Bool)

(assert (=> b!734895 m!687385))

(assert (=> b!734895 m!687385))

(assert (=> b!734895 m!687383))

(declare-fun m!687387 () Bool)

(assert (=> b!734895 m!687387))

(declare-fun m!687389 () Bool)

(assert (=> start!65112 m!687389))

(declare-fun m!687391 () Bool)

(assert (=> start!65112 m!687391))

(assert (=> b!734883 m!687383))

(assert (=> b!734883 m!687383))

(declare-fun m!687393 () Bool)

(assert (=> b!734883 m!687393))

(declare-fun m!687395 () Bool)

(assert (=> b!734885 m!687395))

(declare-fun m!687397 () Bool)

(assert (=> b!734885 m!687397))

(declare-fun m!687399 () Bool)

(assert (=> b!734886 m!687399))

(declare-fun m!687401 () Bool)

(assert (=> b!734888 m!687401))

(assert (=> b!734887 m!687383))

(assert (=> b!734887 m!687383))

(declare-fun m!687403 () Bool)

(assert (=> b!734887 m!687403))

(assert (=> b!734894 m!687383))

(assert (=> b!734894 m!687383))

(declare-fun m!687405 () Bool)

(assert (=> b!734894 m!687405))

(declare-fun m!687407 () Bool)

(assert (=> b!734891 m!687407))

(assert (=> b!734881 m!687383))

(assert (=> b!734881 m!687383))

(declare-fun m!687409 () Bool)

(assert (=> b!734881 m!687409))

(assert (=> b!734879 m!687383))

(assert (=> b!734879 m!687383))

(declare-fun m!687411 () Bool)

(assert (=> b!734879 m!687411))

(declare-fun m!687413 () Bool)

(assert (=> b!734893 m!687413))

(declare-fun m!687415 () Bool)

(assert (=> b!734878 m!687415))

(assert (=> b!734889 m!687383))

(assert (=> b!734889 m!687383))

(assert (=> b!734889 m!687409))

(declare-fun m!687417 () Bool)

(assert (=> b!734892 m!687417))

(declare-fun m!687419 () Bool)

(assert (=> b!734892 m!687419))

(declare-fun m!687421 () Bool)

(assert (=> b!734892 m!687421))

(declare-fun m!687423 () Bool)

(assert (=> b!734892 m!687423))

(assert (=> b!734892 m!687417))

(declare-fun m!687425 () Bool)

(assert (=> b!734892 m!687425))

(check-sat (not b!734892) (not b!734894) (not b!734888) (not b!734881) (not b!734885) (not b!734890) (not b!734893) (not b!734889) (not b!734882) (not b!734886) (not b!734879) (not start!65112) (not b!734887) (not b!734883) (not b!734891) (not b!734895))
(check-sat)
