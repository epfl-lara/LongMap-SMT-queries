; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67852 () Bool)

(assert start!67852)

(declare-fun b!786680 () Bool)

(declare-fun e!437386 () Bool)

(declare-fun e!437385 () Bool)

(assert (=> b!786680 (= e!437386 e!437385)))

(declare-fun res!532425 () Bool)

(assert (=> b!786680 (=> (not res!532425) (not e!437385))))

(declare-datatypes ((SeekEntryResult!8026 0))(
  ( (MissingZero!8026 (index!34472 (_ BitVec 32))) (Found!8026 (index!34473 (_ BitVec 32))) (Intermediate!8026 (undefined!8838 Bool) (index!34474 (_ BitVec 32)) (x!65577 (_ BitVec 32))) (Undefined!8026) (MissingVacant!8026 (index!34475 (_ BitVec 32))) )
))
(declare-fun lt!350798 () SeekEntryResult!8026)

(declare-fun lt!350791 () SeekEntryResult!8026)

(assert (=> b!786680 (= res!532425 (= lt!350798 lt!350791))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42772 0))(
  ( (array!42773 (arr!20470 (Array (_ BitVec 32) (_ BitVec 64))) (size!20890 (_ BitVec 32))) )
))
(declare-fun lt!350790 () array!42772)

(declare-fun lt!350793 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42772 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!786680 (= lt!350791 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350793 lt!350790 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786680 (= lt!350798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350793 mask!3328) lt!350793 lt!350790 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!42772)

(assert (=> b!786680 (= lt!350793 (select (store (arr!20470 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786680 (= lt!350790 (array!42773 (store (arr!20470 a!3186) i!1173 k0!2102) (size!20890 a!3186)))))

(declare-fun b!786681 () Bool)

(declare-fun e!437383 () Bool)

(declare-fun e!437388 () Bool)

(assert (=> b!786681 (= e!437383 e!437388)))

(declare-fun res!532433 () Bool)

(assert (=> b!786681 (=> (not res!532433) (not e!437388))))

(declare-fun lt!350800 () SeekEntryResult!8026)

(assert (=> b!786681 (= res!532433 (or (= lt!350800 (MissingZero!8026 i!1173)) (= lt!350800 (MissingVacant!8026 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42772 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!786681 (= lt!350800 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786682 () Bool)

(declare-fun e!437384 () Bool)

(assert (=> b!786682 (= e!437384 true)))

(declare-fun e!437391 () Bool)

(assert (=> b!786682 e!437391))

(declare-fun res!532434 () Bool)

(assert (=> b!786682 (=> (not res!532434) (not e!437391))))

(declare-fun lt!350792 () (_ BitVec 64))

(assert (=> b!786682 (= res!532434 (= lt!350792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27169 0))(
  ( (Unit!27170) )
))
(declare-fun lt!350797 () Unit!27169)

(declare-fun e!437389 () Unit!27169)

(assert (=> b!786682 (= lt!350797 e!437389)))

(declare-fun c!87539 () Bool)

(assert (=> b!786682 (= c!87539 (= lt!350792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786683 () Bool)

(declare-fun res!532442 () Bool)

(assert (=> b!786683 (=> (not res!532442) (not e!437388))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786683 (= res!532442 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20890 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20890 a!3186))))))

(declare-fun b!786684 () Bool)

(declare-fun res!532429 () Bool)

(assert (=> b!786684 (=> (not res!532429) (not e!437386))))

(assert (=> b!786684 (= res!532429 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20470 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786686 () Bool)

(declare-fun res!532443 () Bool)

(assert (=> b!786686 (=> (not res!532443) (not e!437383))))

(assert (=> b!786686 (= res!532443 (and (= (size!20890 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20890 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20890 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786687 () Bool)

(declare-fun res!532427 () Bool)

(assert (=> b!786687 (=> (not res!532427) (not e!437383))))

(declare-fun arrayContainsKey!0 (array!42772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786687 (= res!532427 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786688 () Bool)

(declare-fun lt!350794 () SeekEntryResult!8026)

(declare-fun lt!350796 () SeekEntryResult!8026)

(assert (=> b!786688 (= e!437391 (= lt!350794 lt!350796))))

(declare-fun b!786689 () Bool)

(declare-fun e!437390 () Bool)

(assert (=> b!786689 (= e!437390 e!437384)))

(declare-fun res!532430 () Bool)

(assert (=> b!786689 (=> res!532430 e!437384)))

(assert (=> b!786689 (= res!532430 (= lt!350792 lt!350793))))

(assert (=> b!786689 (= lt!350792 (select (store (arr!20470 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786690 () Bool)

(declare-fun res!532441 () Bool)

(assert (=> b!786690 (=> (not res!532441) (not e!437383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786690 (= res!532441 (validKeyInArray!0 (select (arr!20470 a!3186) j!159)))))

(declare-fun b!786691 () Bool)

(declare-fun res!532435 () Bool)

(assert (=> b!786691 (=> (not res!532435) (not e!437391))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42772 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!786691 (= res!532435 (= (seekEntryOrOpen!0 lt!350793 lt!350790 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350793 lt!350790 mask!3328)))))

(declare-fun e!437381 () Bool)

(declare-fun b!786692 () Bool)

(assert (=> b!786692 (= e!437381 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20470 a!3186) j!159) a!3186 mask!3328) (Found!8026 j!159)))))

(declare-fun b!786693 () Bool)

(declare-fun e!437392 () Bool)

(assert (=> b!786693 (= e!437392 e!437390)))

(declare-fun res!532432 () Bool)

(assert (=> b!786693 (=> res!532432 e!437390)))

(declare-fun lt!350795 () SeekEntryResult!8026)

(assert (=> b!786693 (= res!532432 (not (= lt!350796 lt!350795)))))

(assert (=> b!786693 (= lt!350796 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20470 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786694 () Bool)

(declare-fun res!532428 () Bool)

(assert (=> b!786694 (=> (not res!532428) (not e!437388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42772 (_ BitVec 32)) Bool)

(assert (=> b!786694 (= res!532428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786695 () Bool)

(declare-fun Unit!27171 () Unit!27169)

(assert (=> b!786695 (= e!437389 Unit!27171)))

(assert (=> b!786695 false))

(declare-fun lt!350789 () SeekEntryResult!8026)

(declare-fun b!786696 () Bool)

(assert (=> b!786696 (= e!437381 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20470 a!3186) j!159) a!3186 mask!3328) lt!350789))))

(declare-fun b!786697 () Bool)

(declare-fun res!532431 () Bool)

(assert (=> b!786697 (=> (not res!532431) (not e!437388))))

(declare-datatypes ((List!14379 0))(
  ( (Nil!14376) (Cons!14375 (h!15504 (_ BitVec 64)) (t!20686 List!14379)) )
))
(declare-fun arrayNoDuplicates!0 (array!42772 (_ BitVec 32) List!14379) Bool)

(assert (=> b!786697 (= res!532431 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14376))))

(declare-fun b!786698 () Bool)

(declare-fun res!532437 () Bool)

(assert (=> b!786698 (=> (not res!532437) (not e!437383))))

(assert (=> b!786698 (= res!532437 (validKeyInArray!0 k0!2102))))

(declare-fun b!786699 () Bool)

(declare-fun res!532426 () Bool)

(assert (=> b!786699 (=> (not res!532426) (not e!437386))))

(assert (=> b!786699 (= res!532426 e!437381)))

(declare-fun c!87538 () Bool)

(assert (=> b!786699 (= c!87538 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786700 () Bool)

(assert (=> b!786700 (= e!437388 e!437386)))

(declare-fun res!532438 () Bool)

(assert (=> b!786700 (=> (not res!532438) (not e!437386))))

(assert (=> b!786700 (= res!532438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20470 a!3186) j!159) mask!3328) (select (arr!20470 a!3186) j!159) a!3186 mask!3328) lt!350789))))

(assert (=> b!786700 (= lt!350789 (Intermediate!8026 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!532439 () Bool)

(assert (=> start!67852 (=> (not res!532439) (not e!437383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67852 (= res!532439 (validMask!0 mask!3328))))

(assert (=> start!67852 e!437383))

(assert (=> start!67852 true))

(declare-fun array_inv!16329 (array!42772) Bool)

(assert (=> start!67852 (array_inv!16329 a!3186)))

(declare-fun b!786685 () Bool)

(declare-fun e!437382 () Bool)

(assert (=> b!786685 (= e!437382 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20470 a!3186) j!159) a!3186 mask!3328) lt!350795))))

(declare-fun b!786701 () Bool)

(assert (=> b!786701 (= e!437385 (not e!437392))))

(declare-fun res!532440 () Bool)

(assert (=> b!786701 (=> res!532440 e!437392)))

(get-info :version)

(assert (=> b!786701 (= res!532440 (or (not ((_ is Intermediate!8026) lt!350791)) (bvslt x!1131 (x!65577 lt!350791)) (not (= x!1131 (x!65577 lt!350791))) (not (= index!1321 (index!34474 lt!350791)))))))

(assert (=> b!786701 e!437382))

(declare-fun res!532436 () Bool)

(assert (=> b!786701 (=> (not res!532436) (not e!437382))))

(assert (=> b!786701 (= res!532436 (= lt!350794 lt!350795))))

(assert (=> b!786701 (= lt!350795 (Found!8026 j!159))))

(assert (=> b!786701 (= lt!350794 (seekEntryOrOpen!0 (select (arr!20470 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786701 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350799 () Unit!27169)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27169)

(assert (=> b!786701 (= lt!350799 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786702 () Bool)

(declare-fun Unit!27172 () Unit!27169)

(assert (=> b!786702 (= e!437389 Unit!27172)))

(assert (= (and start!67852 res!532439) b!786686))

(assert (= (and b!786686 res!532443) b!786690))

(assert (= (and b!786690 res!532441) b!786698))

(assert (= (and b!786698 res!532437) b!786687))

(assert (= (and b!786687 res!532427) b!786681))

(assert (= (and b!786681 res!532433) b!786694))

(assert (= (and b!786694 res!532428) b!786697))

(assert (= (and b!786697 res!532431) b!786683))

(assert (= (and b!786683 res!532442) b!786700))

(assert (= (and b!786700 res!532438) b!786684))

(assert (= (and b!786684 res!532429) b!786699))

(assert (= (and b!786699 c!87538) b!786696))

(assert (= (and b!786699 (not c!87538)) b!786692))

(assert (= (and b!786699 res!532426) b!786680))

(assert (= (and b!786680 res!532425) b!786701))

(assert (= (and b!786701 res!532436) b!786685))

(assert (= (and b!786701 (not res!532440)) b!786693))

(assert (= (and b!786693 (not res!532432)) b!786689))

(assert (= (and b!786689 (not res!532430)) b!786682))

(assert (= (and b!786682 c!87539) b!786695))

(assert (= (and b!786682 (not c!87539)) b!786702))

(assert (= (and b!786682 res!532434) b!786691))

(assert (= (and b!786691 res!532435) b!786688))

(declare-fun m!729023 () Bool)

(assert (=> start!67852 m!729023))

(declare-fun m!729025 () Bool)

(assert (=> start!67852 m!729025))

(declare-fun m!729027 () Bool)

(assert (=> b!786694 m!729027))

(declare-fun m!729029 () Bool)

(assert (=> b!786680 m!729029))

(assert (=> b!786680 m!729029))

(declare-fun m!729031 () Bool)

(assert (=> b!786680 m!729031))

(declare-fun m!729033 () Bool)

(assert (=> b!786680 m!729033))

(declare-fun m!729035 () Bool)

(assert (=> b!786680 m!729035))

(declare-fun m!729037 () Bool)

(assert (=> b!786680 m!729037))

(declare-fun m!729039 () Bool)

(assert (=> b!786685 m!729039))

(assert (=> b!786685 m!729039))

(declare-fun m!729041 () Bool)

(assert (=> b!786685 m!729041))

(assert (=> b!786701 m!729039))

(assert (=> b!786701 m!729039))

(declare-fun m!729043 () Bool)

(assert (=> b!786701 m!729043))

(declare-fun m!729045 () Bool)

(assert (=> b!786701 m!729045))

(declare-fun m!729047 () Bool)

(assert (=> b!786701 m!729047))

(assert (=> b!786696 m!729039))

(assert (=> b!786696 m!729039))

(declare-fun m!729049 () Bool)

(assert (=> b!786696 m!729049))

(declare-fun m!729051 () Bool)

(assert (=> b!786687 m!729051))

(assert (=> b!786693 m!729039))

(assert (=> b!786693 m!729039))

(declare-fun m!729053 () Bool)

(assert (=> b!786693 m!729053))

(assert (=> b!786692 m!729039))

(assert (=> b!786692 m!729039))

(assert (=> b!786692 m!729053))

(assert (=> b!786690 m!729039))

(assert (=> b!786690 m!729039))

(declare-fun m!729055 () Bool)

(assert (=> b!786690 m!729055))

(assert (=> b!786700 m!729039))

(assert (=> b!786700 m!729039))

(declare-fun m!729057 () Bool)

(assert (=> b!786700 m!729057))

(assert (=> b!786700 m!729057))

(assert (=> b!786700 m!729039))

(declare-fun m!729059 () Bool)

(assert (=> b!786700 m!729059))

(declare-fun m!729061 () Bool)

(assert (=> b!786691 m!729061))

(declare-fun m!729063 () Bool)

(assert (=> b!786691 m!729063))

(assert (=> b!786689 m!729033))

(declare-fun m!729065 () Bool)

(assert (=> b!786689 m!729065))

(declare-fun m!729067 () Bool)

(assert (=> b!786681 m!729067))

(declare-fun m!729069 () Bool)

(assert (=> b!786698 m!729069))

(declare-fun m!729071 () Bool)

(assert (=> b!786697 m!729071))

(declare-fun m!729073 () Bool)

(assert (=> b!786684 m!729073))

(check-sat (not b!786691) (not b!786690) (not b!786680) (not b!786692) (not b!786687) (not b!786701) (not b!786694) (not b!786700) (not b!786681) (not b!786696) (not b!786698) (not b!786685) (not b!786693) (not start!67852) (not b!786697))
(check-sat)
