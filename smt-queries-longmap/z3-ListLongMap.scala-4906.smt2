; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67798 () Bool)

(assert start!67798)

(declare-fun b!784817 () Bool)

(declare-fun e!436410 () Bool)

(declare-fun e!436412 () Bool)

(assert (=> b!784817 (= e!436410 e!436412)))

(declare-fun res!530898 () Bool)

(assert (=> b!784817 (=> res!530898 e!436412)))

(declare-fun lt!349821 () (_ BitVec 64))

(declare-fun lt!349820 () (_ BitVec 64))

(assert (=> b!784817 (= res!530898 (= lt!349821 lt!349820))))

(declare-datatypes ((array!42718 0))(
  ( (array!42719 (arr!20443 (Array (_ BitVec 32) (_ BitVec 64))) (size!20863 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42718)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!784817 (= lt!349821 (select (store (arr!20443 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784818 () Bool)

(declare-datatypes ((Unit!27061 0))(
  ( (Unit!27062) )
))
(declare-fun e!436416 () Unit!27061)

(declare-fun Unit!27063 () Unit!27061)

(assert (=> b!784818 (= e!436416 Unit!27063)))

(assert (=> b!784818 false))

(declare-fun b!784819 () Bool)

(declare-fun e!436409 () Bool)

(declare-fun e!436411 () Bool)

(assert (=> b!784819 (= e!436409 (not e!436411))))

(declare-fun res!530900 () Bool)

(assert (=> b!784819 (=> res!530900 e!436411)))

(declare-datatypes ((SeekEntryResult!7999 0))(
  ( (MissingZero!7999 (index!34364 (_ BitVec 32))) (Found!7999 (index!34365 (_ BitVec 32))) (Intermediate!7999 (undefined!8811 Bool) (index!34366 (_ BitVec 32)) (x!65478 (_ BitVec 32))) (Undefined!7999) (MissingVacant!7999 (index!34367 (_ BitVec 32))) )
))
(declare-fun lt!349819 () SeekEntryResult!7999)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!784819 (= res!530900 (or (not ((_ is Intermediate!7999) lt!349819)) (bvslt x!1131 (x!65478 lt!349819)) (not (= x!1131 (x!65478 lt!349819))) (not (= index!1321 (index!34366 lt!349819)))))))

(declare-fun e!436419 () Bool)

(assert (=> b!784819 e!436419))

(declare-fun res!530895 () Bool)

(assert (=> b!784819 (=> (not res!530895) (not e!436419))))

(declare-fun lt!349825 () SeekEntryResult!7999)

(declare-fun lt!349826 () SeekEntryResult!7999)

(assert (=> b!784819 (= res!530895 (= lt!349825 lt!349826))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!784819 (= lt!349826 (Found!7999 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42718 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!784819 (= lt!349825 (seekEntryOrOpen!0 (select (arr!20443 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42718 (_ BitVec 32)) Bool)

(assert (=> b!784819 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349827 () Unit!27061)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27061)

(assert (=> b!784819 (= lt!349827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784821 () Bool)

(declare-fun res!530902 () Bool)

(declare-fun e!436414 () Bool)

(assert (=> b!784821 (=> (not res!530902) (not e!436414))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784821 (= res!530902 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20863 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20863 a!3186))))))

(declare-fun b!784822 () Bool)

(declare-fun res!530894 () Bool)

(declare-fun e!436413 () Bool)

(assert (=> b!784822 (=> (not res!530894) (not e!436413))))

(assert (=> b!784822 (= res!530894 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20443 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784823 () Bool)

(declare-fun res!530896 () Bool)

(assert (=> b!784823 (=> (not res!530896) (not e!436414))))

(declare-datatypes ((List!14352 0))(
  ( (Nil!14349) (Cons!14348 (h!15477 (_ BitVec 64)) (t!20659 List!14352)) )
))
(declare-fun arrayNoDuplicates!0 (array!42718 (_ BitVec 32) List!14352) Bool)

(assert (=> b!784823 (= res!530896 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14349))))

(declare-fun b!784824 () Bool)

(assert (=> b!784824 (= e!436413 e!436409)))

(declare-fun res!530899 () Bool)

(assert (=> b!784824 (=> (not res!530899) (not e!436409))))

(declare-fun lt!349824 () SeekEntryResult!7999)

(assert (=> b!784824 (= res!530899 (= lt!349824 lt!349819))))

(declare-fun lt!349823 () array!42718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42718 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!784824 (= lt!349819 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349820 lt!349823 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784824 (= lt!349824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349820 mask!3328) lt!349820 lt!349823 mask!3328))))

(assert (=> b!784824 (= lt!349820 (select (store (arr!20443 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784824 (= lt!349823 (array!42719 (store (arr!20443 a!3186) i!1173 k0!2102) (size!20863 a!3186)))))

(declare-fun b!784825 () Bool)

(declare-fun res!530890 () Bool)

(assert (=> b!784825 (=> (not res!530890) (not e!436414))))

(assert (=> b!784825 (= res!530890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784826 () Bool)

(declare-fun res!530901 () Bool)

(declare-fun e!436415 () Bool)

(assert (=> b!784826 (=> (not res!530901) (not e!436415))))

(assert (=> b!784826 (= res!530901 (and (= (size!20863 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20863 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20863 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784827 () Bool)

(assert (=> b!784827 (= e!436412 true)))

(declare-fun e!436418 () Bool)

(assert (=> b!784827 e!436418))

(declare-fun res!530892 () Bool)

(assert (=> b!784827 (=> (not res!530892) (not e!436418))))

(assert (=> b!784827 (= res!530892 (= lt!349821 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349817 () Unit!27061)

(assert (=> b!784827 (= lt!349817 e!436416)))

(declare-fun c!87377 () Bool)

(assert (=> b!784827 (= c!87377 (= lt!349821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784828 () Bool)

(declare-fun e!436420 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42718 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!784828 (= e!436420 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20443 a!3186) j!159) a!3186 mask!3328) (Found!7999 j!159)))))

(declare-fun b!784829 () Bool)

(assert (=> b!784829 (= e!436415 e!436414)))

(declare-fun res!530893 () Bool)

(assert (=> b!784829 (=> (not res!530893) (not e!436414))))

(declare-fun lt!349828 () SeekEntryResult!7999)

(assert (=> b!784829 (= res!530893 (or (= lt!349828 (MissingZero!7999 i!1173)) (= lt!349828 (MissingVacant!7999 i!1173))))))

(assert (=> b!784829 (= lt!349828 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784830 () Bool)

(declare-fun res!530889 () Bool)

(assert (=> b!784830 (=> (not res!530889) (not e!436415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784830 (= res!530889 (validKeyInArray!0 k0!2102))))

(declare-fun b!784831 () Bool)

(assert (=> b!784831 (= e!436419 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20443 a!3186) j!159) a!3186 mask!3328) lt!349826))))

(declare-fun b!784832 () Bool)

(declare-fun lt!349818 () SeekEntryResult!7999)

(assert (=> b!784832 (= e!436418 (= lt!349825 lt!349818))))

(declare-fun b!784833 () Bool)

(declare-fun Unit!27064 () Unit!27061)

(assert (=> b!784833 (= e!436416 Unit!27064)))

(declare-fun b!784820 () Bool)

(declare-fun res!530891 () Bool)

(assert (=> b!784820 (=> (not res!530891) (not e!436415))))

(assert (=> b!784820 (= res!530891 (validKeyInArray!0 (select (arr!20443 a!3186) j!159)))))

(declare-fun res!530897 () Bool)

(assert (=> start!67798 (=> (not res!530897) (not e!436415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67798 (= res!530897 (validMask!0 mask!3328))))

(assert (=> start!67798 e!436415))

(assert (=> start!67798 true))

(declare-fun array_inv!16302 (array!42718) Bool)

(assert (=> start!67798 (array_inv!16302 a!3186)))

(declare-fun b!784834 () Bool)

(assert (=> b!784834 (= e!436414 e!436413)))

(declare-fun res!530887 () Bool)

(assert (=> b!784834 (=> (not res!530887) (not e!436413))))

(declare-fun lt!349822 () SeekEntryResult!7999)

(assert (=> b!784834 (= res!530887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20443 a!3186) j!159) mask!3328) (select (arr!20443 a!3186) j!159) a!3186 mask!3328) lt!349822))))

(assert (=> b!784834 (= lt!349822 (Intermediate!7999 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784835 () Bool)

(assert (=> b!784835 (= e!436411 e!436410)))

(declare-fun res!530903 () Bool)

(assert (=> b!784835 (=> res!530903 e!436410)))

(assert (=> b!784835 (= res!530903 (not (= lt!349818 lt!349826)))))

(assert (=> b!784835 (= lt!349818 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20443 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784836 () Bool)

(assert (=> b!784836 (= e!436420 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20443 a!3186) j!159) a!3186 mask!3328) lt!349822))))

(declare-fun b!784837 () Bool)

(declare-fun res!530886 () Bool)

(assert (=> b!784837 (=> (not res!530886) (not e!436418))))

(assert (=> b!784837 (= res!530886 (= (seekEntryOrOpen!0 lt!349820 lt!349823 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349820 lt!349823 mask!3328)))))

(declare-fun b!784838 () Bool)

(declare-fun res!530904 () Bool)

(assert (=> b!784838 (=> (not res!530904) (not e!436413))))

(assert (=> b!784838 (= res!530904 e!436420)))

(declare-fun c!87376 () Bool)

(assert (=> b!784838 (= c!87376 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784839 () Bool)

(declare-fun res!530888 () Bool)

(assert (=> b!784839 (=> (not res!530888) (not e!436415))))

(declare-fun arrayContainsKey!0 (array!42718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784839 (= res!530888 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67798 res!530897) b!784826))

(assert (= (and b!784826 res!530901) b!784820))

(assert (= (and b!784820 res!530891) b!784830))

(assert (= (and b!784830 res!530889) b!784839))

(assert (= (and b!784839 res!530888) b!784829))

(assert (= (and b!784829 res!530893) b!784825))

(assert (= (and b!784825 res!530890) b!784823))

(assert (= (and b!784823 res!530896) b!784821))

(assert (= (and b!784821 res!530902) b!784834))

(assert (= (and b!784834 res!530887) b!784822))

(assert (= (and b!784822 res!530894) b!784838))

(assert (= (and b!784838 c!87376) b!784836))

(assert (= (and b!784838 (not c!87376)) b!784828))

(assert (= (and b!784838 res!530904) b!784824))

(assert (= (and b!784824 res!530899) b!784819))

(assert (= (and b!784819 res!530895) b!784831))

(assert (= (and b!784819 (not res!530900)) b!784835))

(assert (= (and b!784835 (not res!530903)) b!784817))

(assert (= (and b!784817 (not res!530898)) b!784827))

(assert (= (and b!784827 c!87377) b!784818))

(assert (= (and b!784827 (not c!87377)) b!784833))

(assert (= (and b!784827 res!530892) b!784837))

(assert (= (and b!784837 res!530886) b!784832))

(declare-fun m!727619 () Bool)

(assert (=> b!784830 m!727619))

(declare-fun m!727621 () Bool)

(assert (=> b!784817 m!727621))

(declare-fun m!727623 () Bool)

(assert (=> b!784817 m!727623))

(declare-fun m!727625 () Bool)

(assert (=> b!784839 m!727625))

(declare-fun m!727627 () Bool)

(assert (=> b!784828 m!727627))

(assert (=> b!784828 m!727627))

(declare-fun m!727629 () Bool)

(assert (=> b!784828 m!727629))

(declare-fun m!727631 () Bool)

(assert (=> b!784829 m!727631))

(declare-fun m!727633 () Bool)

(assert (=> b!784837 m!727633))

(declare-fun m!727635 () Bool)

(assert (=> b!784837 m!727635))

(assert (=> b!784834 m!727627))

(assert (=> b!784834 m!727627))

(declare-fun m!727637 () Bool)

(assert (=> b!784834 m!727637))

(assert (=> b!784834 m!727637))

(assert (=> b!784834 m!727627))

(declare-fun m!727639 () Bool)

(assert (=> b!784834 m!727639))

(declare-fun m!727641 () Bool)

(assert (=> b!784822 m!727641))

(assert (=> b!784831 m!727627))

(assert (=> b!784831 m!727627))

(declare-fun m!727643 () Bool)

(assert (=> b!784831 m!727643))

(assert (=> b!784836 m!727627))

(assert (=> b!784836 m!727627))

(declare-fun m!727645 () Bool)

(assert (=> b!784836 m!727645))

(assert (=> b!784820 m!727627))

(assert (=> b!784820 m!727627))

(declare-fun m!727647 () Bool)

(assert (=> b!784820 m!727647))

(assert (=> b!784835 m!727627))

(assert (=> b!784835 m!727627))

(assert (=> b!784835 m!727629))

(assert (=> b!784824 m!727621))

(declare-fun m!727649 () Bool)

(assert (=> b!784824 m!727649))

(declare-fun m!727651 () Bool)

(assert (=> b!784824 m!727651))

(declare-fun m!727653 () Bool)

(assert (=> b!784824 m!727653))

(declare-fun m!727655 () Bool)

(assert (=> b!784824 m!727655))

(assert (=> b!784824 m!727649))

(declare-fun m!727657 () Bool)

(assert (=> start!67798 m!727657))

(declare-fun m!727659 () Bool)

(assert (=> start!67798 m!727659))

(declare-fun m!727661 () Bool)

(assert (=> b!784825 m!727661))

(assert (=> b!784819 m!727627))

(assert (=> b!784819 m!727627))

(declare-fun m!727663 () Bool)

(assert (=> b!784819 m!727663))

(declare-fun m!727665 () Bool)

(assert (=> b!784819 m!727665))

(declare-fun m!727667 () Bool)

(assert (=> b!784819 m!727667))

(declare-fun m!727669 () Bool)

(assert (=> b!784823 m!727669))

(check-sat (not b!784830) (not b!784829) (not b!784836) (not b!784837) (not b!784819) (not b!784823) (not b!784831) (not b!784835) (not b!784828) (not b!784839) (not b!784834) (not b!784824) (not b!784820) (not b!784825) (not start!67798))
(check-sat)
