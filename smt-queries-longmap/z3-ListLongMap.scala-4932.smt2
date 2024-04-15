; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67880 () Bool)

(assert start!67880)

(declare-fun b!789737 () Bool)

(declare-fun e!438924 () Bool)

(declare-fun e!438928 () Bool)

(assert (=> b!789737 (= e!438924 e!438928)))

(declare-fun res!535061 () Bool)

(assert (=> b!789737 (=> res!535061 e!438928)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42876 0))(
  ( (array!42877 (arr!20525 (Array (_ BitVec 32) (_ BitVec 64))) (size!20946 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42876)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!789737 (= res!535061 (or (not (= (select (arr!20525 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!8122 0))(
  ( (MissingZero!8122 (index!34856 (_ BitVec 32))) (Found!8122 (index!34857 (_ BitVec 32))) (Intermediate!8122 (undefined!8934 Bool) (index!34858 (_ BitVec 32)) (x!65802 (_ BitVec 32))) (Undefined!8122) (MissingVacant!8122 (index!34859 (_ BitVec 32))) )
))
(declare-fun lt!352356 () SeekEntryResult!8122)

(declare-fun lt!352355 () SeekEntryResult!8122)

(declare-fun lt!352364 () SeekEntryResult!8122)

(declare-fun lt!352366 () SeekEntryResult!8122)

(assert (=> b!789737 (and (= lt!352355 lt!352356) (= lt!352366 lt!352364))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352359 () (_ BitVec 64))

(declare-fun lt!352362 () array!42876)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42876 (_ BitVec 32)) SeekEntryResult!8122)

(assert (=> b!789737 (= lt!352356 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352359 lt!352362 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42876 (_ BitVec 32)) SeekEntryResult!8122)

(assert (=> b!789737 (= lt!352355 (seekEntryOrOpen!0 lt!352359 lt!352362 mask!3328))))

(declare-fun lt!352358 () (_ BitVec 64))

(assert (=> b!789737 (= lt!352358 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!27356 0))(
  ( (Unit!27357) )
))
(declare-fun lt!352363 () Unit!27356)

(declare-fun e!438921 () Unit!27356)

(assert (=> b!789737 (= lt!352363 e!438921)))

(declare-fun c!87749 () Bool)

(assert (=> b!789737 (= c!87749 (= lt!352358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789738 () Bool)

(declare-fun res!535074 () Bool)

(declare-fun e!438918 () Bool)

(assert (=> b!789738 (=> (not res!535074) (not e!438918))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789738 (= res!535074 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789739 () Bool)

(declare-fun res!535065 () Bool)

(assert (=> b!789739 (=> (not res!535065) (not e!438918))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789739 (= res!535065 (validKeyInArray!0 (select (arr!20525 a!3186) j!159)))))

(declare-fun b!789740 () Bool)

(declare-fun e!438923 () Bool)

(assert (=> b!789740 (= e!438918 e!438923)))

(declare-fun res!535059 () Bool)

(assert (=> b!789740 (=> (not res!535059) (not e!438923))))

(declare-fun lt!352367 () SeekEntryResult!8122)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789740 (= res!535059 (or (= lt!352367 (MissingZero!8122 i!1173)) (= lt!352367 (MissingVacant!8122 i!1173))))))

(assert (=> b!789740 (= lt!352367 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789741 () Bool)

(assert (=> b!789741 (= e!438928 true)))

(assert (=> b!789741 (= lt!352356 lt!352364)))

(declare-fun lt!352354 () Unit!27356)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42876 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27356)

(assert (=> b!789741 (= lt!352354 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789742 () Bool)

(declare-fun e!438925 () Bool)

(declare-fun e!438926 () Bool)

(assert (=> b!789742 (= e!438925 e!438926)))

(declare-fun res!535071 () Bool)

(assert (=> b!789742 (=> (not res!535071) (not e!438926))))

(declare-fun lt!352365 () SeekEntryResult!8122)

(declare-fun lt!352353 () SeekEntryResult!8122)

(assert (=> b!789742 (= res!535071 (= lt!352365 lt!352353))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42876 (_ BitVec 32)) SeekEntryResult!8122)

(assert (=> b!789742 (= lt!352353 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352359 lt!352362 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789742 (= lt!352365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352359 mask!3328) lt!352359 lt!352362 mask!3328))))

(assert (=> b!789742 (= lt!352359 (select (store (arr!20525 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789742 (= lt!352362 (array!42877 (store (arr!20525 a!3186) i!1173 k0!2102) (size!20946 a!3186)))))

(declare-fun e!438919 () Bool)

(declare-fun b!789743 () Bool)

(assert (=> b!789743 (= e!438919 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20525 a!3186) j!159) a!3186 mask!3328) (Found!8122 j!159)))))

(declare-fun b!789744 () Bool)

(declare-fun res!535068 () Bool)

(assert (=> b!789744 (=> (not res!535068) (not e!438925))))

(assert (=> b!789744 (= res!535068 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20525 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789745 () Bool)

(declare-fun e!438927 () Bool)

(assert (=> b!789745 (= e!438927 e!438924)))

(declare-fun res!535066 () Bool)

(assert (=> b!789745 (=> res!535066 e!438924)))

(assert (=> b!789745 (= res!535066 (= lt!352358 lt!352359))))

(assert (=> b!789745 (= lt!352358 (select (store (arr!20525 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789746 () Bool)

(declare-fun lt!352361 () SeekEntryResult!8122)

(assert (=> b!789746 (= e!438919 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20525 a!3186) j!159) a!3186 mask!3328) lt!352361))))

(declare-fun b!789747 () Bool)

(declare-fun e!438920 () Bool)

(assert (=> b!789747 (= e!438926 (not e!438920))))

(declare-fun res!535063 () Bool)

(assert (=> b!789747 (=> res!535063 e!438920)))

(get-info :version)

(assert (=> b!789747 (= res!535063 (or (not ((_ is Intermediate!8122) lt!352353)) (bvslt x!1131 (x!65802 lt!352353)) (not (= x!1131 (x!65802 lt!352353))) (not (= index!1321 (index!34858 lt!352353)))))))

(declare-fun e!438917 () Bool)

(assert (=> b!789747 e!438917))

(declare-fun res!535058 () Bool)

(assert (=> b!789747 (=> (not res!535058) (not e!438917))))

(declare-fun lt!352357 () SeekEntryResult!8122)

(assert (=> b!789747 (= res!535058 (= lt!352366 lt!352357))))

(assert (=> b!789747 (= lt!352357 (Found!8122 j!159))))

(assert (=> b!789747 (= lt!352366 (seekEntryOrOpen!0 (select (arr!20525 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42876 (_ BitVec 32)) Bool)

(assert (=> b!789747 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352360 () Unit!27356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27356)

(assert (=> b!789747 (= lt!352360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!789748 () Bool)

(assert (=> b!789748 (= e!438917 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20525 a!3186) j!159) a!3186 mask!3328) lt!352357))))

(declare-fun b!789749 () Bool)

(assert (=> b!789749 (= e!438923 e!438925)))

(declare-fun res!535070 () Bool)

(assert (=> b!789749 (=> (not res!535070) (not e!438925))))

(assert (=> b!789749 (= res!535070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20525 a!3186) j!159) mask!3328) (select (arr!20525 a!3186) j!159) a!3186 mask!3328) lt!352361))))

(assert (=> b!789749 (= lt!352361 (Intermediate!8122 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789750 () Bool)

(assert (=> b!789750 (= e!438920 e!438927)))

(declare-fun res!535072 () Bool)

(assert (=> b!789750 (=> res!535072 e!438927)))

(assert (=> b!789750 (= res!535072 (not (= lt!352364 lt!352357)))))

(assert (=> b!789750 (= lt!352364 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20525 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!535073 () Bool)

(assert (=> start!67880 (=> (not res!535073) (not e!438918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67880 (= res!535073 (validMask!0 mask!3328))))

(assert (=> start!67880 e!438918))

(assert (=> start!67880 true))

(declare-fun array_inv!16408 (array!42876) Bool)

(assert (=> start!67880 (array_inv!16408 a!3186)))

(declare-fun b!789751 () Bool)

(declare-fun res!535067 () Bool)

(assert (=> b!789751 (=> (not res!535067) (not e!438925))))

(assert (=> b!789751 (= res!535067 e!438919)))

(declare-fun c!87750 () Bool)

(assert (=> b!789751 (= c!87750 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789752 () Bool)

(declare-fun res!535064 () Bool)

(assert (=> b!789752 (=> (not res!535064) (not e!438923))))

(assert (=> b!789752 (= res!535064 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20946 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20946 a!3186))))))

(declare-fun b!789753 () Bool)

(declare-fun res!535057 () Bool)

(assert (=> b!789753 (=> (not res!535057) (not e!438918))))

(assert (=> b!789753 (= res!535057 (and (= (size!20946 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20946 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20946 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789754 () Bool)

(declare-fun res!535069 () Bool)

(assert (=> b!789754 (=> (not res!535069) (not e!438923))))

(declare-datatypes ((List!14566 0))(
  ( (Nil!14563) (Cons!14562 (h!15688 (_ BitVec 64)) (t!20872 List!14566)) )
))
(declare-fun arrayNoDuplicates!0 (array!42876 (_ BitVec 32) List!14566) Bool)

(assert (=> b!789754 (= res!535069 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14563))))

(declare-fun b!789755 () Bool)

(declare-fun Unit!27358 () Unit!27356)

(assert (=> b!789755 (= e!438921 Unit!27358)))

(declare-fun b!789756 () Bool)

(declare-fun res!535060 () Bool)

(assert (=> b!789756 (=> (not res!535060) (not e!438923))))

(assert (=> b!789756 (= res!535060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789757 () Bool)

(declare-fun res!535062 () Bool)

(assert (=> b!789757 (=> (not res!535062) (not e!438918))))

(assert (=> b!789757 (= res!535062 (validKeyInArray!0 k0!2102))))

(declare-fun b!789758 () Bool)

(declare-fun Unit!27359 () Unit!27356)

(assert (=> b!789758 (= e!438921 Unit!27359)))

(assert (=> b!789758 false))

(assert (= (and start!67880 res!535073) b!789753))

(assert (= (and b!789753 res!535057) b!789739))

(assert (= (and b!789739 res!535065) b!789757))

(assert (= (and b!789757 res!535062) b!789738))

(assert (= (and b!789738 res!535074) b!789740))

(assert (= (and b!789740 res!535059) b!789756))

(assert (= (and b!789756 res!535060) b!789754))

(assert (= (and b!789754 res!535069) b!789752))

(assert (= (and b!789752 res!535064) b!789749))

(assert (= (and b!789749 res!535070) b!789744))

(assert (= (and b!789744 res!535068) b!789751))

(assert (= (and b!789751 c!87750) b!789746))

(assert (= (and b!789751 (not c!87750)) b!789743))

(assert (= (and b!789751 res!535067) b!789742))

(assert (= (and b!789742 res!535071) b!789747))

(assert (= (and b!789747 res!535058) b!789748))

(assert (= (and b!789747 (not res!535063)) b!789750))

(assert (= (and b!789750 (not res!535072)) b!789745))

(assert (= (and b!789745 (not res!535066)) b!789737))

(assert (= (and b!789737 c!87749) b!789758))

(assert (= (and b!789737 (not c!87749)) b!789755))

(assert (= (and b!789737 (not res!535061)) b!789741))

(declare-fun m!730215 () Bool)

(assert (=> b!789743 m!730215))

(assert (=> b!789743 m!730215))

(declare-fun m!730217 () Bool)

(assert (=> b!789743 m!730217))

(assert (=> b!789739 m!730215))

(assert (=> b!789739 m!730215))

(declare-fun m!730219 () Bool)

(assert (=> b!789739 m!730219))

(declare-fun m!730221 () Bool)

(assert (=> b!789742 m!730221))

(declare-fun m!730223 () Bool)

(assert (=> b!789742 m!730223))

(declare-fun m!730225 () Bool)

(assert (=> b!789742 m!730225))

(declare-fun m!730227 () Bool)

(assert (=> b!789742 m!730227))

(declare-fun m!730229 () Bool)

(assert (=> b!789742 m!730229))

(assert (=> b!789742 m!730221))

(declare-fun m!730231 () Bool)

(assert (=> start!67880 m!730231))

(declare-fun m!730233 () Bool)

(assert (=> start!67880 m!730233))

(assert (=> b!789746 m!730215))

(assert (=> b!789746 m!730215))

(declare-fun m!730235 () Bool)

(assert (=> b!789746 m!730235))

(declare-fun m!730237 () Bool)

(assert (=> b!789757 m!730237))

(assert (=> b!789749 m!730215))

(assert (=> b!789749 m!730215))

(declare-fun m!730239 () Bool)

(assert (=> b!789749 m!730239))

(assert (=> b!789749 m!730239))

(assert (=> b!789749 m!730215))

(declare-fun m!730241 () Bool)

(assert (=> b!789749 m!730241))

(declare-fun m!730243 () Bool)

(assert (=> b!789737 m!730243))

(declare-fun m!730245 () Bool)

(assert (=> b!789737 m!730245))

(declare-fun m!730247 () Bool)

(assert (=> b!789737 m!730247))

(declare-fun m!730249 () Bool)

(assert (=> b!789741 m!730249))

(declare-fun m!730251 () Bool)

(assert (=> b!789740 m!730251))

(declare-fun m!730253 () Bool)

(assert (=> b!789744 m!730253))

(assert (=> b!789745 m!730225))

(declare-fun m!730255 () Bool)

(assert (=> b!789745 m!730255))

(assert (=> b!789748 m!730215))

(assert (=> b!789748 m!730215))

(declare-fun m!730257 () Bool)

(assert (=> b!789748 m!730257))

(declare-fun m!730259 () Bool)

(assert (=> b!789738 m!730259))

(assert (=> b!789750 m!730215))

(assert (=> b!789750 m!730215))

(assert (=> b!789750 m!730217))

(declare-fun m!730261 () Bool)

(assert (=> b!789754 m!730261))

(declare-fun m!730263 () Bool)

(assert (=> b!789756 m!730263))

(assert (=> b!789747 m!730215))

(assert (=> b!789747 m!730215))

(declare-fun m!730265 () Bool)

(assert (=> b!789747 m!730265))

(declare-fun m!730267 () Bool)

(assert (=> b!789747 m!730267))

(declare-fun m!730269 () Bool)

(assert (=> b!789747 m!730269))

(check-sat (not b!789757) (not b!789750) (not start!67880) (not b!789749) (not b!789746) (not b!789737) (not b!789739) (not b!789756) (not b!789740) (not b!789741) (not b!789742) (not b!789748) (not b!789747) (not b!789743) (not b!789754) (not b!789738))
(check-sat)
