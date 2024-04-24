; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67996 () Bool)

(assert start!67996)

(declare-fun b!789824 () Bool)

(declare-fun res!534784 () Bool)

(declare-fun e!439059 () Bool)

(assert (=> b!789824 (=> (not res!534784) (not e!439059))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42853 0))(
  ( (array!42854 (arr!20509 (Array (_ BitVec 32) (_ BitVec 64))) (size!20929 (_ BitVec 32))) )
))
(declare-fun lt!352383 () array!42853)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!352376 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8065 0))(
  ( (MissingZero!8065 (index!34628 (_ BitVec 32))) (Found!8065 (index!34629 (_ BitVec 32))) (Intermediate!8065 (undefined!8877 Bool) (index!34630 (_ BitVec 32)) (x!65729 (_ BitVec 32))) (Undefined!8065) (MissingVacant!8065 (index!34631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42853 (_ BitVec 32)) SeekEntryResult!8065)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42853 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!789824 (= res!534784 (= (seekEntryOrOpen!0 lt!352376 lt!352383 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352376 lt!352383 mask!3328)))))

(declare-fun b!789825 () Bool)

(declare-fun e!439062 () Bool)

(declare-fun e!439063 () Bool)

(assert (=> b!789825 (= e!439062 e!439063)))

(declare-fun res!534778 () Bool)

(assert (=> b!789825 (=> (not res!534778) (not e!439063))))

(declare-fun a!3186 () array!42853)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!352378 () SeekEntryResult!8065)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42853 (_ BitVec 32)) SeekEntryResult!8065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789825 (= res!534778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!352378))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789825 (= lt!352378 (Intermediate!8065 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789826 () Bool)

(declare-fun res!534774 () Bool)

(declare-fun e!439065 () Bool)

(assert (=> b!789826 (=> (not res!534774) (not e!439065))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789826 (= res!534774 (and (= (size!20929 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20929 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20929 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789827 () Bool)

(declare-fun res!534787 () Bool)

(assert (=> b!789827 (=> (not res!534787) (not e!439062))))

(assert (=> b!789827 (= res!534787 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20929 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20929 a!3186))))))

(declare-fun b!789828 () Bool)

(declare-fun res!534792 () Bool)

(assert (=> b!789828 (=> (not res!534792) (not e!439063))))

(declare-fun e!439055 () Bool)

(assert (=> b!789828 (= res!534792 e!439055)))

(declare-fun c!87938 () Bool)

(assert (=> b!789828 (= c!87938 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!534782 () Bool)

(assert (=> start!67996 (=> (not res!534782) (not e!439065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67996 (= res!534782 (validMask!0 mask!3328))))

(assert (=> start!67996 e!439065))

(assert (=> start!67996 true))

(declare-fun array_inv!16368 (array!42853) Bool)

(assert (=> start!67996 (array_inv!16368 a!3186)))

(declare-fun b!789829 () Bool)

(declare-fun res!534776 () Bool)

(assert (=> b!789829 (=> (not res!534776) (not e!439062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42853 (_ BitVec 32)) Bool)

(assert (=> b!789829 (= res!534776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789830 () Bool)

(declare-fun e!439060 () Bool)

(declare-fun e!439057 () Bool)

(assert (=> b!789830 (= e!439060 e!439057)))

(declare-fun res!534779 () Bool)

(assert (=> b!789830 (=> res!534779 e!439057)))

(declare-fun lt!352380 () SeekEntryResult!8065)

(declare-fun lt!352379 () SeekEntryResult!8065)

(assert (=> b!789830 (= res!534779 (not (= lt!352380 lt!352379)))))

(assert (=> b!789830 (= lt!352380 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789831 () Bool)

(declare-fun e!439056 () Bool)

(assert (=> b!789831 (= e!439057 e!439056)))

(declare-fun res!534789 () Bool)

(assert (=> b!789831 (=> res!534789 e!439056)))

(declare-fun lt!352377 () (_ BitVec 64))

(assert (=> b!789831 (= res!534789 (= lt!352377 lt!352376))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789831 (= lt!352377 (select (store (arr!20509 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789832 () Bool)

(declare-fun e!439066 () Bool)

(assert (=> b!789832 (= e!439063 e!439066)))

(declare-fun res!534775 () Bool)

(assert (=> b!789832 (=> (not res!534775) (not e!439066))))

(declare-fun lt!352375 () SeekEntryResult!8065)

(declare-fun lt!352382 () SeekEntryResult!8065)

(assert (=> b!789832 (= res!534775 (= lt!352375 lt!352382))))

(assert (=> b!789832 (= lt!352382 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352376 lt!352383 mask!3328))))

(assert (=> b!789832 (= lt!352375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352376 mask!3328) lt!352376 lt!352383 mask!3328))))

(assert (=> b!789832 (= lt!352376 (select (store (arr!20509 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789832 (= lt!352383 (array!42854 (store (arr!20509 a!3186) i!1173 k0!2102) (size!20929 a!3186)))))

(declare-fun b!789833 () Bool)

(assert (=> b!789833 (= e!439056 true)))

(assert (=> b!789833 e!439059))

(declare-fun res!534790 () Bool)

(assert (=> b!789833 (=> (not res!534790) (not e!439059))))

(assert (=> b!789833 (= res!534790 (= lt!352377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27325 0))(
  ( (Unit!27326) )
))
(declare-fun lt!352381 () Unit!27325)

(declare-fun e!439064 () Unit!27325)

(assert (=> b!789833 (= lt!352381 e!439064)))

(declare-fun c!87937 () Bool)

(assert (=> b!789833 (= c!87937 (= lt!352377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789834 () Bool)

(declare-fun res!534786 () Bool)

(assert (=> b!789834 (=> (not res!534786) (not e!439065))))

(declare-fun arrayContainsKey!0 (array!42853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789834 (= res!534786 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789835 () Bool)

(assert (=> b!789835 (= e!439055 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!352378))))

(declare-fun b!789836 () Bool)

(declare-fun lt!352384 () SeekEntryResult!8065)

(assert (=> b!789836 (= e!439059 (= lt!352384 lt!352380))))

(declare-fun b!789837 () Bool)

(declare-fun res!534788 () Bool)

(assert (=> b!789837 (=> (not res!534788) (not e!439062))))

(declare-datatypes ((List!14418 0))(
  ( (Nil!14415) (Cons!14414 (h!15546 (_ BitVec 64)) (t!20725 List!14418)) )
))
(declare-fun arrayNoDuplicates!0 (array!42853 (_ BitVec 32) List!14418) Bool)

(assert (=> b!789837 (= res!534788 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14415))))

(declare-fun b!789838 () Bool)

(declare-fun Unit!27327 () Unit!27325)

(assert (=> b!789838 (= e!439064 Unit!27327)))

(declare-fun b!789839 () Bool)

(assert (=> b!789839 (= e!439065 e!439062)))

(declare-fun res!534783 () Bool)

(assert (=> b!789839 (=> (not res!534783) (not e!439062))))

(declare-fun lt!352373 () SeekEntryResult!8065)

(assert (=> b!789839 (= res!534783 (or (= lt!352373 (MissingZero!8065 i!1173)) (= lt!352373 (MissingVacant!8065 i!1173))))))

(assert (=> b!789839 (= lt!352373 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789840 () Bool)

(declare-fun res!534777 () Bool)

(assert (=> b!789840 (=> (not res!534777) (not e!439065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789840 (= res!534777 (validKeyInArray!0 k0!2102))))

(declare-fun b!789841 () Bool)

(assert (=> b!789841 (= e!439055 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) (Found!8065 j!159)))))

(declare-fun b!789842 () Bool)

(declare-fun res!534780 () Bool)

(assert (=> b!789842 (=> (not res!534780) (not e!439065))))

(assert (=> b!789842 (= res!534780 (validKeyInArray!0 (select (arr!20509 a!3186) j!159)))))

(declare-fun b!789843 () Bool)

(declare-fun Unit!27328 () Unit!27325)

(assert (=> b!789843 (= e!439064 Unit!27328)))

(assert (=> b!789843 false))

(declare-fun e!439058 () Bool)

(declare-fun b!789844 () Bool)

(assert (=> b!789844 (= e!439058 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!352379))))

(declare-fun b!789845 () Bool)

(declare-fun res!534791 () Bool)

(assert (=> b!789845 (=> (not res!534791) (not e!439063))))

(assert (=> b!789845 (= res!534791 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20509 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789846 () Bool)

(assert (=> b!789846 (= e!439066 (not e!439060))))

(declare-fun res!534785 () Bool)

(assert (=> b!789846 (=> res!534785 e!439060)))

(get-info :version)

(assert (=> b!789846 (= res!534785 (or (not ((_ is Intermediate!8065) lt!352382)) (bvslt x!1131 (x!65729 lt!352382)) (not (= x!1131 (x!65729 lt!352382))) (not (= index!1321 (index!34630 lt!352382)))))))

(assert (=> b!789846 e!439058))

(declare-fun res!534781 () Bool)

(assert (=> b!789846 (=> (not res!534781) (not e!439058))))

(assert (=> b!789846 (= res!534781 (= lt!352384 lt!352379))))

(assert (=> b!789846 (= lt!352379 (Found!8065 j!159))))

(assert (=> b!789846 (= lt!352384 (seekEntryOrOpen!0 (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789846 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352374 () Unit!27325)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27325)

(assert (=> b!789846 (= lt!352374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67996 res!534782) b!789826))

(assert (= (and b!789826 res!534774) b!789842))

(assert (= (and b!789842 res!534780) b!789840))

(assert (= (and b!789840 res!534777) b!789834))

(assert (= (and b!789834 res!534786) b!789839))

(assert (= (and b!789839 res!534783) b!789829))

(assert (= (and b!789829 res!534776) b!789837))

(assert (= (and b!789837 res!534788) b!789827))

(assert (= (and b!789827 res!534787) b!789825))

(assert (= (and b!789825 res!534778) b!789845))

(assert (= (and b!789845 res!534791) b!789828))

(assert (= (and b!789828 c!87938) b!789835))

(assert (= (and b!789828 (not c!87938)) b!789841))

(assert (= (and b!789828 res!534792) b!789832))

(assert (= (and b!789832 res!534775) b!789846))

(assert (= (and b!789846 res!534781) b!789844))

(assert (= (and b!789846 (not res!534785)) b!789830))

(assert (= (and b!789830 (not res!534779)) b!789831))

(assert (= (and b!789831 (not res!534789)) b!789833))

(assert (= (and b!789833 c!87937) b!789843))

(assert (= (and b!789833 (not c!87937)) b!789838))

(assert (= (and b!789833 res!534790) b!789824))

(assert (= (and b!789824 res!534784) b!789836))

(declare-fun m!731387 () Bool)

(assert (=> b!789844 m!731387))

(assert (=> b!789844 m!731387))

(declare-fun m!731389 () Bool)

(assert (=> b!789844 m!731389))

(assert (=> b!789842 m!731387))

(assert (=> b!789842 m!731387))

(declare-fun m!731391 () Bool)

(assert (=> b!789842 m!731391))

(declare-fun m!731393 () Bool)

(assert (=> b!789829 m!731393))

(declare-fun m!731395 () Bool)

(assert (=> b!789837 m!731395))

(declare-fun m!731397 () Bool)

(assert (=> b!789832 m!731397))

(declare-fun m!731399 () Bool)

(assert (=> b!789832 m!731399))

(assert (=> b!789832 m!731397))

(declare-fun m!731401 () Bool)

(assert (=> b!789832 m!731401))

(declare-fun m!731403 () Bool)

(assert (=> b!789832 m!731403))

(declare-fun m!731405 () Bool)

(assert (=> b!789832 m!731405))

(assert (=> b!789831 m!731401))

(declare-fun m!731407 () Bool)

(assert (=> b!789831 m!731407))

(declare-fun m!731409 () Bool)

(assert (=> b!789845 m!731409))

(assert (=> b!789830 m!731387))

(assert (=> b!789830 m!731387))

(declare-fun m!731411 () Bool)

(assert (=> b!789830 m!731411))

(declare-fun m!731413 () Bool)

(assert (=> b!789839 m!731413))

(declare-fun m!731415 () Bool)

(assert (=> b!789834 m!731415))

(declare-fun m!731417 () Bool)

(assert (=> b!789840 m!731417))

(assert (=> b!789825 m!731387))

(assert (=> b!789825 m!731387))

(declare-fun m!731419 () Bool)

(assert (=> b!789825 m!731419))

(assert (=> b!789825 m!731419))

(assert (=> b!789825 m!731387))

(declare-fun m!731421 () Bool)

(assert (=> b!789825 m!731421))

(declare-fun m!731423 () Bool)

(assert (=> start!67996 m!731423))

(declare-fun m!731425 () Bool)

(assert (=> start!67996 m!731425))

(assert (=> b!789835 m!731387))

(assert (=> b!789835 m!731387))

(declare-fun m!731427 () Bool)

(assert (=> b!789835 m!731427))

(assert (=> b!789841 m!731387))

(assert (=> b!789841 m!731387))

(assert (=> b!789841 m!731411))

(assert (=> b!789846 m!731387))

(assert (=> b!789846 m!731387))

(declare-fun m!731429 () Bool)

(assert (=> b!789846 m!731429))

(declare-fun m!731431 () Bool)

(assert (=> b!789846 m!731431))

(declare-fun m!731433 () Bool)

(assert (=> b!789846 m!731433))

(declare-fun m!731435 () Bool)

(assert (=> b!789824 m!731435))

(declare-fun m!731437 () Bool)

(assert (=> b!789824 m!731437))

(check-sat (not b!789825) (not b!789835) (not b!789830) (not b!789829) (not b!789844) (not b!789824) (not b!789841) (not b!789842) (not b!789840) (not start!67996) (not b!789846) (not b!789834) (not b!789832) (not b!789839) (not b!789837))
(check-sat)
