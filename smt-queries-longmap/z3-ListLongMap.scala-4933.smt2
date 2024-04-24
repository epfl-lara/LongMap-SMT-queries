; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68026 () Bool)

(assert start!68026)

(declare-fun b!790830 () Bool)

(declare-fun res!535600 () Bool)

(declare-fun e!439606 () Bool)

(assert (=> b!790830 (=> (not res!535600) (not e!439606))))

(declare-datatypes ((array!42883 0))(
  ( (array!42884 (arr!20524 (Array (_ BitVec 32) (_ BitVec 64))) (size!20944 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42883)

(declare-datatypes ((List!14433 0))(
  ( (Nil!14430) (Cons!14429 (h!15561 (_ BitVec 64)) (t!20740 List!14433)) )
))
(declare-fun arrayNoDuplicates!0 (array!42883 (_ BitVec 32) List!14433) Bool)

(assert (=> b!790830 (= res!535600 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14430))))

(declare-fun b!790831 () Bool)

(declare-fun res!535616 () Bool)

(declare-fun e!439595 () Bool)

(assert (=> b!790831 (=> (not res!535616) (not e!439595))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790831 (= res!535616 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20524 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790832 () Bool)

(declare-fun e!439598 () Bool)

(assert (=> b!790832 (= e!439598 e!439606)))

(declare-fun res!535604 () Bool)

(assert (=> b!790832 (=> (not res!535604) (not e!439606))))

(declare-datatypes ((SeekEntryResult!8080 0))(
  ( (MissingZero!8080 (index!34688 (_ BitVec 32))) (Found!8080 (index!34689 (_ BitVec 32))) (Intermediate!8080 (undefined!8892 Bool) (index!34690 (_ BitVec 32)) (x!65784 (_ BitVec 32))) (Undefined!8080) (MissingVacant!8080 (index!34691 (_ BitVec 32))) )
))
(declare-fun lt!353003 () SeekEntryResult!8080)

(assert (=> b!790832 (= res!535604 (or (= lt!353003 (MissingZero!8080 i!1173)) (= lt!353003 (MissingVacant!8080 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42883 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!790832 (= lt!353003 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790833 () Bool)

(declare-datatypes ((Unit!27385 0))(
  ( (Unit!27386) )
))
(declare-fun e!439604 () Unit!27385)

(declare-fun Unit!27387 () Unit!27385)

(assert (=> b!790833 (= e!439604 Unit!27387)))

(declare-fun b!790834 () Bool)

(declare-fun res!535614 () Bool)

(assert (=> b!790834 (=> (not res!535614) (not e!439606))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!790834 (= res!535614 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20944 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20944 a!3186))))))

(declare-fun e!439602 () Bool)

(declare-fun b!790835 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42883 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!790835 (= e!439602 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20524 a!3186) j!159) a!3186 mask!3328) (Found!8080 j!159)))))

(declare-fun b!790836 () Bool)

(declare-fun res!535611 () Bool)

(assert (=> b!790836 (=> (not res!535611) (not e!439595))))

(assert (=> b!790836 (= res!535611 e!439602)))

(declare-fun c!88027 () Bool)

(assert (=> b!790836 (= c!88027 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790837 () Bool)

(declare-fun res!535606 () Bool)

(assert (=> b!790837 (=> (not res!535606) (not e!439606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42883 (_ BitVec 32)) Bool)

(assert (=> b!790837 (= res!535606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790838 () Bool)

(declare-fun e!439603 () Bool)

(declare-fun e!439601 () Bool)

(assert (=> b!790838 (= e!439603 e!439601)))

(declare-fun res!535612 () Bool)

(assert (=> b!790838 (=> res!535612 e!439601)))

(assert (=> b!790838 (= res!535612 (or (not (= (select (arr!20524 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!353009 () SeekEntryResult!8080)

(declare-fun lt!353010 () SeekEntryResult!8080)

(declare-fun lt!353013 () SeekEntryResult!8080)

(declare-fun lt!353002 () SeekEntryResult!8080)

(assert (=> b!790838 (and (= lt!353013 lt!353002) (= lt!353010 lt!353009))))

(declare-fun lt!353012 () (_ BitVec 64))

(declare-fun lt!353006 () array!42883)

(assert (=> b!790838 (= lt!353002 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!353012 lt!353006 mask!3328))))

(assert (=> b!790838 (= lt!353013 (seekEntryOrOpen!0 lt!353012 lt!353006 mask!3328))))

(declare-fun lt!353000 () (_ BitVec 64))

(assert (=> b!790838 (= lt!353000 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!353005 () Unit!27385)

(assert (=> b!790838 (= lt!353005 e!439604)))

(declare-fun c!88028 () Bool)

(assert (=> b!790838 (= c!88028 (= lt!353000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!353004 () SeekEntryResult!8080)

(declare-fun b!790839 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42883 (_ BitVec 32)) SeekEntryResult!8080)

(assert (=> b!790839 (= e!439602 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20524 a!3186) j!159) a!3186 mask!3328) lt!353004))))

(declare-fun lt!353014 () SeekEntryResult!8080)

(declare-fun b!790840 () Bool)

(declare-fun e!439597 () Bool)

(assert (=> b!790840 (= e!439597 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20524 a!3186) j!159) a!3186 mask!3328) lt!353014))))

(declare-fun b!790841 () Bool)

(declare-fun res!535613 () Bool)

(assert (=> b!790841 (=> (not res!535613) (not e!439598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790841 (= res!535613 (validKeyInArray!0 (select (arr!20524 a!3186) j!159)))))

(declare-fun b!790842 () Bool)

(declare-fun res!535602 () Bool)

(assert (=> b!790842 (=> (not res!535602) (not e!439598))))

(declare-fun arrayContainsKey!0 (array!42883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790842 (= res!535602 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790843 () Bool)

(assert (=> b!790843 (= e!439606 e!439595)))

(declare-fun res!535609 () Bool)

(assert (=> b!790843 (=> (not res!535609) (not e!439595))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790843 (= res!535609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20524 a!3186) j!159) mask!3328) (select (arr!20524 a!3186) j!159) a!3186 mask!3328) lt!353004))))

(assert (=> b!790843 (= lt!353004 (Intermediate!8080 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790844 () Bool)

(declare-fun res!535603 () Bool)

(assert (=> b!790844 (=> (not res!535603) (not e!439598))))

(assert (=> b!790844 (= res!535603 (validKeyInArray!0 k0!2102))))

(declare-fun b!790845 () Bool)

(declare-fun res!535605 () Bool)

(assert (=> b!790845 (=> (not res!535605) (not e!439598))))

(assert (=> b!790845 (= res!535605 (and (= (size!20944 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20944 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20944 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790846 () Bool)

(declare-fun e!439599 () Bool)

(declare-fun e!439600 () Bool)

(assert (=> b!790846 (= e!439599 e!439600)))

(declare-fun res!535608 () Bool)

(assert (=> b!790846 (=> res!535608 e!439600)))

(assert (=> b!790846 (= res!535608 (not (= lt!353009 lt!353014)))))

(assert (=> b!790846 (= lt!353009 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20524 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790847 () Bool)

(declare-fun e!439605 () Bool)

(assert (=> b!790847 (= e!439595 e!439605)))

(declare-fun res!535617 () Bool)

(assert (=> b!790847 (=> (not res!535617) (not e!439605))))

(declare-fun lt!353008 () SeekEntryResult!8080)

(declare-fun lt!353001 () SeekEntryResult!8080)

(assert (=> b!790847 (= res!535617 (= lt!353008 lt!353001))))

(assert (=> b!790847 (= lt!353001 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353012 lt!353006 mask!3328))))

(assert (=> b!790847 (= lt!353008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353012 mask!3328) lt!353012 lt!353006 mask!3328))))

(assert (=> b!790847 (= lt!353012 (select (store (arr!20524 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790847 (= lt!353006 (array!42884 (store (arr!20524 a!3186) i!1173 k0!2102) (size!20944 a!3186)))))

(declare-fun b!790848 () Bool)

(assert (=> b!790848 (= e!439601 (= lt!353013 lt!353014))))

(assert (=> b!790848 (= lt!353002 lt!353009)))

(declare-fun lt!353007 () Unit!27385)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27385)

(assert (=> b!790848 (= lt!353007 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790849 () Bool)

(assert (=> b!790849 (= e!439600 e!439603)))

(declare-fun res!535610 () Bool)

(assert (=> b!790849 (=> res!535610 e!439603)))

(assert (=> b!790849 (= res!535610 (= lt!353000 lt!353012))))

(assert (=> b!790849 (= lt!353000 (select (store (arr!20524 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!790850 () Bool)

(declare-fun Unit!27388 () Unit!27385)

(assert (=> b!790850 (= e!439604 Unit!27388)))

(assert (=> b!790850 false))

(declare-fun res!535601 () Bool)

(assert (=> start!68026 (=> (not res!535601) (not e!439598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68026 (= res!535601 (validMask!0 mask!3328))))

(assert (=> start!68026 e!439598))

(assert (=> start!68026 true))

(declare-fun array_inv!16383 (array!42883) Bool)

(assert (=> start!68026 (array_inv!16383 a!3186)))

(declare-fun b!790851 () Bool)

(assert (=> b!790851 (= e!439605 (not e!439599))))

(declare-fun res!535607 () Bool)

(assert (=> b!790851 (=> res!535607 e!439599)))

(get-info :version)

(assert (=> b!790851 (= res!535607 (or (not ((_ is Intermediate!8080) lt!353001)) (bvslt x!1131 (x!65784 lt!353001)) (not (= x!1131 (x!65784 lt!353001))) (not (= index!1321 (index!34690 lt!353001)))))))

(assert (=> b!790851 e!439597))

(declare-fun res!535615 () Bool)

(assert (=> b!790851 (=> (not res!535615) (not e!439597))))

(assert (=> b!790851 (= res!535615 (= lt!353010 lt!353014))))

(assert (=> b!790851 (= lt!353014 (Found!8080 j!159))))

(assert (=> b!790851 (= lt!353010 (seekEntryOrOpen!0 (select (arr!20524 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!790851 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!353011 () Unit!27385)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27385)

(assert (=> b!790851 (= lt!353011 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!68026 res!535601) b!790845))

(assert (= (and b!790845 res!535605) b!790841))

(assert (= (and b!790841 res!535613) b!790844))

(assert (= (and b!790844 res!535603) b!790842))

(assert (= (and b!790842 res!535602) b!790832))

(assert (= (and b!790832 res!535604) b!790837))

(assert (= (and b!790837 res!535606) b!790830))

(assert (= (and b!790830 res!535600) b!790834))

(assert (= (and b!790834 res!535614) b!790843))

(assert (= (and b!790843 res!535609) b!790831))

(assert (= (and b!790831 res!535616) b!790836))

(assert (= (and b!790836 c!88027) b!790839))

(assert (= (and b!790836 (not c!88027)) b!790835))

(assert (= (and b!790836 res!535611) b!790847))

(assert (= (and b!790847 res!535617) b!790851))

(assert (= (and b!790851 res!535615) b!790840))

(assert (= (and b!790851 (not res!535607)) b!790846))

(assert (= (and b!790846 (not res!535608)) b!790849))

(assert (= (and b!790849 (not res!535610)) b!790838))

(assert (= (and b!790838 c!88028) b!790850))

(assert (= (and b!790838 (not c!88028)) b!790833))

(assert (= (and b!790838 (not res!535612)) b!790848))

(declare-fun m!732203 () Bool)

(assert (=> b!790840 m!732203))

(assert (=> b!790840 m!732203))

(declare-fun m!732205 () Bool)

(assert (=> b!790840 m!732205))

(declare-fun m!732207 () Bool)

(assert (=> b!790838 m!732207))

(declare-fun m!732209 () Bool)

(assert (=> b!790838 m!732209))

(declare-fun m!732211 () Bool)

(assert (=> b!790838 m!732211))

(declare-fun m!732213 () Bool)

(assert (=> b!790832 m!732213))

(assert (=> b!790846 m!732203))

(assert (=> b!790846 m!732203))

(declare-fun m!732215 () Bool)

(assert (=> b!790846 m!732215))

(declare-fun m!732217 () Bool)

(assert (=> start!68026 m!732217))

(declare-fun m!732219 () Bool)

(assert (=> start!68026 m!732219))

(assert (=> b!790843 m!732203))

(assert (=> b!790843 m!732203))

(declare-fun m!732221 () Bool)

(assert (=> b!790843 m!732221))

(assert (=> b!790843 m!732221))

(assert (=> b!790843 m!732203))

(declare-fun m!732223 () Bool)

(assert (=> b!790843 m!732223))

(declare-fun m!732225 () Bool)

(assert (=> b!790830 m!732225))

(assert (=> b!790835 m!732203))

(assert (=> b!790835 m!732203))

(assert (=> b!790835 m!732215))

(assert (=> b!790851 m!732203))

(assert (=> b!790851 m!732203))

(declare-fun m!732227 () Bool)

(assert (=> b!790851 m!732227))

(declare-fun m!732229 () Bool)

(assert (=> b!790851 m!732229))

(declare-fun m!732231 () Bool)

(assert (=> b!790851 m!732231))

(declare-fun m!732233 () Bool)

(assert (=> b!790849 m!732233))

(declare-fun m!732235 () Bool)

(assert (=> b!790849 m!732235))

(declare-fun m!732237 () Bool)

(assert (=> b!790847 m!732237))

(declare-fun m!732239 () Bool)

(assert (=> b!790847 m!732239))

(assert (=> b!790847 m!732237))

(assert (=> b!790847 m!732233))

(declare-fun m!732241 () Bool)

(assert (=> b!790847 m!732241))

(declare-fun m!732243 () Bool)

(assert (=> b!790847 m!732243))

(declare-fun m!732245 () Bool)

(assert (=> b!790837 m!732245))

(declare-fun m!732247 () Bool)

(assert (=> b!790848 m!732247))

(declare-fun m!732249 () Bool)

(assert (=> b!790842 m!732249))

(assert (=> b!790839 m!732203))

(assert (=> b!790839 m!732203))

(declare-fun m!732251 () Bool)

(assert (=> b!790839 m!732251))

(declare-fun m!732253 () Bool)

(assert (=> b!790831 m!732253))

(assert (=> b!790841 m!732203))

(assert (=> b!790841 m!732203))

(declare-fun m!732255 () Bool)

(assert (=> b!790841 m!732255))

(declare-fun m!732257 () Bool)

(assert (=> b!790844 m!732257))

(check-sat (not b!790846) (not start!68026) (not b!790844) (not b!790841) (not b!790848) (not b!790839) (not b!790847) (not b!790830) (not b!790851) (not b!790835) (not b!790838) (not b!790842) (not b!790840) (not b!790832) (not b!790837) (not b!790843))
(check-sat)
