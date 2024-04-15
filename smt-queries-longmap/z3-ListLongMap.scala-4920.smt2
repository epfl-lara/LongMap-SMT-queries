; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67742 () Bool)

(assert start!67742)

(declare-fun b!786820 () Bool)

(declare-fun e!437352 () Bool)

(declare-fun e!437351 () Bool)

(assert (=> b!786820 (= e!437352 e!437351)))

(declare-fun res!532908 () Bool)

(assert (=> b!786820 (=> (not res!532908) (not e!437351))))

(declare-datatypes ((array!42801 0))(
  ( (array!42802 (arr!20489 (Array (_ BitVec 32) (_ BitVec 64))) (size!20910 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42801)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8086 0))(
  ( (MissingZero!8086 (index!34712 (_ BitVec 32))) (Found!8086 (index!34713 (_ BitVec 32))) (Intermediate!8086 (undefined!8898 Bool) (index!34714 (_ BitVec 32)) (x!65661 (_ BitVec 32))) (Undefined!8086) (MissingVacant!8086 (index!34715 (_ BitVec 32))) )
))
(declare-fun lt!350822 () SeekEntryResult!8086)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42801 (_ BitVec 32)) SeekEntryResult!8086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786820 (= res!532908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20489 a!3186) j!159) mask!3328) (select (arr!20489 a!3186) j!159) a!3186 mask!3328) lt!350822))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786820 (= lt!350822 (Intermediate!8086 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786821 () Bool)

(declare-fun res!532906 () Bool)

(assert (=> b!786821 (=> (not res!532906) (not e!437352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42801 (_ BitVec 32)) Bool)

(assert (=> b!786821 (= res!532906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!532902 () Bool)

(declare-fun e!437354 () Bool)

(assert (=> start!67742 (=> (not res!532902) (not e!437354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67742 (= res!532902 (validMask!0 mask!3328))))

(assert (=> start!67742 e!437354))

(assert (=> start!67742 true))

(declare-fun array_inv!16372 (array!42801) Bool)

(assert (=> start!67742 (array_inv!16372 a!3186)))

(declare-fun b!786822 () Bool)

(declare-fun res!532903 () Bool)

(assert (=> b!786822 (=> (not res!532903) (not e!437354))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786822 (= res!532903 (validKeyInArray!0 k0!2102))))

(declare-fun b!786823 () Bool)

(declare-fun res!532912 () Bool)

(assert (=> b!786823 (=> (not res!532912) (not e!437351))))

(declare-fun e!437361 () Bool)

(assert (=> b!786823 (= res!532912 e!437361)))

(declare-fun c!87368 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!786823 (= c!87368 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!786824 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42801 (_ BitVec 32)) SeekEntryResult!8086)

(assert (=> b!786824 (= e!437361 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20489 a!3186) j!159) a!3186 mask!3328) (Found!8086 j!159)))))

(declare-fun b!786825 () Bool)

(declare-datatypes ((Unit!27212 0))(
  ( (Unit!27213) )
))
(declare-fun e!437357 () Unit!27212)

(declare-fun Unit!27214 () Unit!27212)

(assert (=> b!786825 (= e!437357 Unit!27214)))

(assert (=> b!786825 false))

(declare-fun b!786826 () Bool)

(declare-fun res!532913 () Bool)

(assert (=> b!786826 (=> (not res!532913) (not e!437352))))

(declare-datatypes ((List!14530 0))(
  ( (Nil!14527) (Cons!14526 (h!15649 (_ BitVec 64)) (t!20836 List!14530)) )
))
(declare-fun arrayNoDuplicates!0 (array!42801 (_ BitVec 32) List!14530) Bool)

(assert (=> b!786826 (= res!532913 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14527))))

(declare-fun b!786827 () Bool)

(declare-fun e!437356 () Bool)

(declare-fun e!437355 () Bool)

(assert (=> b!786827 (= e!437356 e!437355)))

(declare-fun res!532900 () Bool)

(assert (=> b!786827 (=> res!532900 e!437355)))

(declare-fun lt!350819 () (_ BitVec 64))

(declare-fun lt!350821 () (_ BitVec 64))

(assert (=> b!786827 (= res!532900 (= lt!350819 lt!350821))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786827 (= lt!350819 (select (store (arr!20489 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786828 () Bool)

(declare-fun res!532914 () Bool)

(declare-fun e!437362 () Bool)

(assert (=> b!786828 (=> (not res!532914) (not e!437362))))

(declare-fun lt!350817 () array!42801)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42801 (_ BitVec 32)) SeekEntryResult!8086)

(assert (=> b!786828 (= res!532914 (= (seekEntryOrOpen!0 lt!350821 lt!350817 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350821 lt!350817 mask!3328)))))

(declare-fun b!786829 () Bool)

(declare-fun e!437358 () Bool)

(assert (=> b!786829 (= e!437351 e!437358)))

(declare-fun res!532901 () Bool)

(assert (=> b!786829 (=> (not res!532901) (not e!437358))))

(declare-fun lt!350823 () SeekEntryResult!8086)

(declare-fun lt!350826 () SeekEntryResult!8086)

(assert (=> b!786829 (= res!532901 (= lt!350823 lt!350826))))

(assert (=> b!786829 (= lt!350826 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350821 lt!350817 mask!3328))))

(assert (=> b!786829 (= lt!350823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350821 mask!3328) lt!350821 lt!350817 mask!3328))))

(assert (=> b!786829 (= lt!350821 (select (store (arr!20489 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786829 (= lt!350817 (array!42802 (store (arr!20489 a!3186) i!1173 k0!2102) (size!20910 a!3186)))))

(declare-fun b!786830 () Bool)

(declare-fun res!532907 () Bool)

(assert (=> b!786830 (=> (not res!532907) (not e!437354))))

(assert (=> b!786830 (= res!532907 (and (= (size!20910 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20910 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20910 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786831 () Bool)

(declare-fun res!532904 () Bool)

(assert (=> b!786831 (=> (not res!532904) (not e!437354))))

(assert (=> b!786831 (= res!532904 (validKeyInArray!0 (select (arr!20489 a!3186) j!159)))))

(declare-fun b!786832 () Bool)

(declare-fun res!532905 () Bool)

(assert (=> b!786832 (=> (not res!532905) (not e!437352))))

(assert (=> b!786832 (= res!532905 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20910 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20910 a!3186))))))

(declare-fun b!786833 () Bool)

(declare-fun res!532915 () Bool)

(assert (=> b!786833 (=> (not res!532915) (not e!437351))))

(assert (=> b!786833 (= res!532915 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20489 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786834 () Bool)

(declare-fun Unit!27215 () Unit!27212)

(assert (=> b!786834 (= e!437357 Unit!27215)))

(declare-fun b!786835 () Bool)

(declare-fun lt!350818 () SeekEntryResult!8086)

(declare-fun lt!350828 () SeekEntryResult!8086)

(assert (=> b!786835 (= e!437362 (= lt!350818 lt!350828))))

(declare-fun b!786836 () Bool)

(declare-fun e!437359 () Bool)

(assert (=> b!786836 (= e!437358 (not e!437359))))

(declare-fun res!532909 () Bool)

(assert (=> b!786836 (=> res!532909 e!437359)))

(get-info :version)

(assert (=> b!786836 (= res!532909 (or (not ((_ is Intermediate!8086) lt!350826)) (bvslt x!1131 (x!65661 lt!350826)) (not (= x!1131 (x!65661 lt!350826))) (not (= index!1321 (index!34714 lt!350826)))))))

(declare-fun e!437360 () Bool)

(assert (=> b!786836 e!437360))

(declare-fun res!532910 () Bool)

(assert (=> b!786836 (=> (not res!532910) (not e!437360))))

(declare-fun lt!350824 () SeekEntryResult!8086)

(assert (=> b!786836 (= res!532910 (= lt!350818 lt!350824))))

(assert (=> b!786836 (= lt!350824 (Found!8086 j!159))))

(assert (=> b!786836 (= lt!350818 (seekEntryOrOpen!0 (select (arr!20489 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786836 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350825 () Unit!27212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27212)

(assert (=> b!786836 (= lt!350825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786837 () Bool)

(assert (=> b!786837 (= e!437360 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20489 a!3186) j!159) a!3186 mask!3328) lt!350824))))

(declare-fun b!786838 () Bool)

(declare-fun res!532917 () Bool)

(assert (=> b!786838 (=> (not res!532917) (not e!437354))))

(declare-fun arrayContainsKey!0 (array!42801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786838 (= res!532917 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786839 () Bool)

(assert (=> b!786839 (= e!437354 e!437352)))

(declare-fun res!532911 () Bool)

(assert (=> b!786839 (=> (not res!532911) (not e!437352))))

(declare-fun lt!350820 () SeekEntryResult!8086)

(assert (=> b!786839 (= res!532911 (or (= lt!350820 (MissingZero!8086 i!1173)) (= lt!350820 (MissingVacant!8086 i!1173))))))

(assert (=> b!786839 (= lt!350820 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786840 () Bool)

(assert (=> b!786840 (= e!437359 e!437356)))

(declare-fun res!532899 () Bool)

(assert (=> b!786840 (=> res!532899 e!437356)))

(assert (=> b!786840 (= res!532899 (not (= lt!350828 lt!350824)))))

(assert (=> b!786840 (= lt!350828 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20489 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786841 () Bool)

(assert (=> b!786841 (= e!437355 true)))

(assert (=> b!786841 e!437362))

(declare-fun res!532916 () Bool)

(assert (=> b!786841 (=> (not res!532916) (not e!437362))))

(assert (=> b!786841 (= res!532916 (= lt!350819 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350827 () Unit!27212)

(assert (=> b!786841 (= lt!350827 e!437357)))

(declare-fun c!87369 () Bool)

(assert (=> b!786841 (= c!87369 (= lt!350819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786842 () Bool)

(assert (=> b!786842 (= e!437361 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20489 a!3186) j!159) a!3186 mask!3328) lt!350822))))

(assert (= (and start!67742 res!532902) b!786830))

(assert (= (and b!786830 res!532907) b!786831))

(assert (= (and b!786831 res!532904) b!786822))

(assert (= (and b!786822 res!532903) b!786838))

(assert (= (and b!786838 res!532917) b!786839))

(assert (= (and b!786839 res!532911) b!786821))

(assert (= (and b!786821 res!532906) b!786826))

(assert (= (and b!786826 res!532913) b!786832))

(assert (= (and b!786832 res!532905) b!786820))

(assert (= (and b!786820 res!532908) b!786833))

(assert (= (and b!786833 res!532915) b!786823))

(assert (= (and b!786823 c!87368) b!786842))

(assert (= (and b!786823 (not c!87368)) b!786824))

(assert (= (and b!786823 res!532912) b!786829))

(assert (= (and b!786829 res!532901) b!786836))

(assert (= (and b!786836 res!532910) b!786837))

(assert (= (and b!786836 (not res!532909)) b!786840))

(assert (= (and b!786840 (not res!532899)) b!786827))

(assert (= (and b!786827 (not res!532900)) b!786841))

(assert (= (and b!786841 c!87369) b!786825))

(assert (= (and b!786841 (not c!87369)) b!786834))

(assert (= (and b!786841 res!532916) b!786828))

(assert (= (and b!786828 res!532914) b!786835))

(declare-fun m!727983 () Bool)

(assert (=> b!786821 m!727983))

(declare-fun m!727985 () Bool)

(assert (=> b!786836 m!727985))

(assert (=> b!786836 m!727985))

(declare-fun m!727987 () Bool)

(assert (=> b!786836 m!727987))

(declare-fun m!727989 () Bool)

(assert (=> b!786836 m!727989))

(declare-fun m!727991 () Bool)

(assert (=> b!786836 m!727991))

(declare-fun m!727993 () Bool)

(assert (=> b!786833 m!727993))

(declare-fun m!727995 () Bool)

(assert (=> b!786822 m!727995))

(assert (=> b!786824 m!727985))

(assert (=> b!786824 m!727985))

(declare-fun m!727997 () Bool)

(assert (=> b!786824 m!727997))

(declare-fun m!727999 () Bool)

(assert (=> b!786829 m!727999))

(declare-fun m!728001 () Bool)

(assert (=> b!786829 m!728001))

(declare-fun m!728003 () Bool)

(assert (=> b!786829 m!728003))

(declare-fun m!728005 () Bool)

(assert (=> b!786829 m!728005))

(declare-fun m!728007 () Bool)

(assert (=> b!786829 m!728007))

(assert (=> b!786829 m!728001))

(assert (=> b!786842 m!727985))

(assert (=> b!786842 m!727985))

(declare-fun m!728009 () Bool)

(assert (=> b!786842 m!728009))

(declare-fun m!728011 () Bool)

(assert (=> b!786839 m!728011))

(assert (=> b!786831 m!727985))

(assert (=> b!786831 m!727985))

(declare-fun m!728013 () Bool)

(assert (=> b!786831 m!728013))

(declare-fun m!728015 () Bool)

(assert (=> start!67742 m!728015))

(declare-fun m!728017 () Bool)

(assert (=> start!67742 m!728017))

(assert (=> b!786837 m!727985))

(assert (=> b!786837 m!727985))

(declare-fun m!728019 () Bool)

(assert (=> b!786837 m!728019))

(assert (=> b!786820 m!727985))

(assert (=> b!786820 m!727985))

(declare-fun m!728021 () Bool)

(assert (=> b!786820 m!728021))

(assert (=> b!786820 m!728021))

(assert (=> b!786820 m!727985))

(declare-fun m!728023 () Bool)

(assert (=> b!786820 m!728023))

(assert (=> b!786827 m!728005))

(declare-fun m!728025 () Bool)

(assert (=> b!786827 m!728025))

(assert (=> b!786840 m!727985))

(assert (=> b!786840 m!727985))

(assert (=> b!786840 m!727997))

(declare-fun m!728027 () Bool)

(assert (=> b!786838 m!728027))

(declare-fun m!728029 () Bool)

(assert (=> b!786826 m!728029))

(declare-fun m!728031 () Bool)

(assert (=> b!786828 m!728031))

(declare-fun m!728033 () Bool)

(assert (=> b!786828 m!728033))

(check-sat (not b!786831) (not start!67742) (not b!786829) (not b!786840) (not b!786836) (not b!786826) (not b!786828) (not b!786838) (not b!786820) (not b!786837) (not b!786842) (not b!786824) (not b!786822) (not b!786821) (not b!786839))
(check-sat)
