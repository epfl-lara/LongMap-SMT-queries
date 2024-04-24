; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65364 () Bool)

(assert start!65364)

(declare-fun b!740021 () Bool)

(declare-fun res!497377 () Bool)

(declare-fun e!413872 () Bool)

(assert (=> b!740021 (=> res!497377 e!413872)))

(declare-fun e!413873 () Bool)

(assert (=> b!740021 (= res!497377 e!413873)))

(declare-fun c!81716 () Bool)

(declare-fun lt!328566 () Bool)

(assert (=> b!740021 (= c!81716 lt!328566)))

(declare-fun b!740022 () Bool)

(declare-fun e!413876 () Bool)

(declare-fun e!413878 () Bool)

(assert (=> b!740022 (= e!413876 e!413878)))

(declare-fun res!497372 () Bool)

(assert (=> b!740022 (=> (not res!497372) (not e!413878))))

(declare-datatypes ((array!41407 0))(
  ( (array!41408 (arr!19813 (Array (_ BitVec 32) (_ BitVec 64))) (size!20233 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41407)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7369 0))(
  ( (MissingZero!7369 (index!31844 (_ BitVec 32))) (Found!7369 (index!31845 (_ BitVec 32))) (Intermediate!7369 (undefined!8181 Bool) (index!31846 (_ BitVec 32)) (x!62995 (_ BitVec 32))) (Undefined!7369) (MissingVacant!7369 (index!31847 (_ BitVec 32))) )
))
(declare-fun lt!328568 () SeekEntryResult!7369)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41407 (_ BitVec 32)) SeekEntryResult!7369)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740022 (= res!497372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19813 a!3186) j!159) mask!3328) (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328568))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740022 (= lt!328568 (Intermediate!7369 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740023 () Bool)

(declare-fun e!413875 () Bool)

(declare-fun e!413879 () Bool)

(assert (=> b!740023 (= e!413875 e!413879)))

(declare-fun res!497364 () Bool)

(assert (=> b!740023 (=> (not res!497364) (not e!413879))))

(declare-fun lt!328565 () SeekEntryResult!7369)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41407 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!740023 (= res!497364 (= (seekEntryOrOpen!0 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328565))))

(assert (=> b!740023 (= lt!328565 (Found!7369 j!159))))

(declare-fun b!740024 () Bool)

(declare-fun res!497374 () Bool)

(assert (=> b!740024 (=> (not res!497374) (not e!413878))))

(declare-fun e!413869 () Bool)

(assert (=> b!740024 (= res!497374 e!413869)))

(declare-fun c!81714 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!740024 (= c!81714 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740025 () Bool)

(declare-fun res!497360 () Bool)

(assert (=> b!740025 (=> (not res!497360) (not e!413878))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740025 (= res!497360 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19813 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740026 () Bool)

(declare-fun res!497362 () Bool)

(assert (=> b!740026 (=> (not res!497362) (not e!413876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41407 (_ BitVec 32)) Bool)

(assert (=> b!740026 (= res!497362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740027 () Bool)

(declare-fun res!497369 () Bool)

(declare-fun e!413880 () Bool)

(assert (=> b!740027 (=> (not res!497369) (not e!413880))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740027 (= res!497369 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740028 () Bool)

(declare-fun res!497376 () Bool)

(assert (=> b!740028 (=> (not res!497376) (not e!413880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740028 (= res!497376 (validKeyInArray!0 k0!2102))))

(declare-fun b!740029 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41407 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!740029 (= e!413879 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328565))))

(declare-fun b!740030 () Bool)

(declare-fun res!497373 () Bool)

(assert (=> b!740030 (=> (not res!497373) (not e!413876))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!740030 (= res!497373 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20233 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20233 a!3186))))))

(declare-fun b!740031 () Bool)

(assert (=> b!740031 (= e!413869 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328568))))

(declare-fun b!740032 () Bool)

(declare-datatypes ((Unit!25249 0))(
  ( (Unit!25250) )
))
(declare-fun e!413871 () Unit!25249)

(declare-fun Unit!25251 () Unit!25249)

(assert (=> b!740032 (= e!413871 Unit!25251)))

(declare-fun lt!328571 () (_ BitVec 32))

(assert (=> b!740032 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328571 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328568)))

(declare-fun b!740033 () Bool)

(declare-fun lt!328577 () SeekEntryResult!7369)

(assert (=> b!740033 (= e!413873 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328571 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328577)))))

(declare-fun b!740034 () Bool)

(declare-fun res!497367 () Bool)

(assert (=> b!740034 (=> (not res!497367) (not e!413880))))

(assert (=> b!740034 (= res!497367 (and (= (size!20233 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20233 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20233 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740035 () Bool)

(declare-fun res!497371 () Bool)

(assert (=> b!740035 (=> (not res!497371) (not e!413880))))

(assert (=> b!740035 (= res!497371 (validKeyInArray!0 (select (arr!19813 a!3186) j!159)))))

(declare-fun res!497368 () Bool)

(assert (=> start!65364 (=> (not res!497368) (not e!413880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65364 (= res!497368 (validMask!0 mask!3328))))

(assert (=> start!65364 e!413880))

(assert (=> start!65364 true))

(declare-fun array_inv!15672 (array!41407) Bool)

(assert (=> start!65364 (array_inv!15672 a!3186)))

(declare-fun b!740036 () Bool)

(declare-fun res!497375 () Bool)

(assert (=> b!740036 (=> (not res!497375) (not e!413876))))

(declare-datatypes ((List!13722 0))(
  ( (Nil!13719) (Cons!13718 (h!14796 (_ BitVec 64)) (t!20029 List!13722)) )
))
(declare-fun arrayNoDuplicates!0 (array!41407 (_ BitVec 32) List!13722) Bool)

(assert (=> b!740036 (= res!497375 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13719))))

(declare-fun b!740037 () Bool)

(assert (=> b!740037 (= e!413872 true)))

(declare-fun lt!328578 () array!41407)

(declare-fun lt!328572 () (_ BitVec 64))

(declare-fun lt!328576 () SeekEntryResult!7369)

(assert (=> b!740037 (= lt!328576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328571 lt!328572 lt!328578 mask!3328))))

(declare-fun b!740038 () Bool)

(assert (=> b!740038 (= e!413873 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328571 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328568)))))

(declare-fun b!740039 () Bool)

(assert (=> b!740039 (= e!413869 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) (Found!7369 j!159)))))

(declare-fun b!740040 () Bool)

(declare-fun e!413874 () Bool)

(assert (=> b!740040 (= e!413878 e!413874)))

(declare-fun res!497363 () Bool)

(assert (=> b!740040 (=> (not res!497363) (not e!413874))))

(declare-fun lt!328573 () SeekEntryResult!7369)

(declare-fun lt!328574 () SeekEntryResult!7369)

(assert (=> b!740040 (= res!497363 (= lt!328573 lt!328574))))

(assert (=> b!740040 (= lt!328574 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328572 lt!328578 mask!3328))))

(assert (=> b!740040 (= lt!328573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328572 mask!3328) lt!328572 lt!328578 mask!3328))))

(assert (=> b!740040 (= lt!328572 (select (store (arr!19813 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740040 (= lt!328578 (array!41408 (store (arr!19813 a!3186) i!1173 k0!2102) (size!20233 a!3186)))))

(declare-fun b!740041 () Bool)

(declare-fun Unit!25252 () Unit!25249)

(assert (=> b!740041 (= e!413871 Unit!25252)))

(declare-fun lt!328569 () SeekEntryResult!7369)

(assert (=> b!740041 (= lt!328569 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740041 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328571 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328577)))

(declare-fun b!740042 () Bool)

(declare-fun e!413870 () Bool)

(assert (=> b!740042 (= e!413870 e!413872)))

(declare-fun res!497365 () Bool)

(assert (=> b!740042 (=> res!497365 e!413872)))

(assert (=> b!740042 (= res!497365 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328571 #b00000000000000000000000000000000) (bvsge lt!328571 (size!20233 a!3186))))))

(declare-fun lt!328575 () Unit!25249)

(assert (=> b!740042 (= lt!328575 e!413871)))

(declare-fun c!81715 () Bool)

(assert (=> b!740042 (= c!81715 lt!328566)))

(assert (=> b!740042 (= lt!328566 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740042 (= lt!328571 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!740043 () Bool)

(assert (=> b!740043 (= e!413880 e!413876)))

(declare-fun res!497361 () Bool)

(assert (=> b!740043 (=> (not res!497361) (not e!413876))))

(declare-fun lt!328567 () SeekEntryResult!7369)

(assert (=> b!740043 (= res!497361 (or (= lt!328567 (MissingZero!7369 i!1173)) (= lt!328567 (MissingVacant!7369 i!1173))))))

(assert (=> b!740043 (= lt!328567 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740044 () Bool)

(assert (=> b!740044 (= e!413874 (not e!413870))))

(declare-fun res!497370 () Bool)

(assert (=> b!740044 (=> res!497370 e!413870)))

(get-info :version)

(assert (=> b!740044 (= res!497370 (or (not ((_ is Intermediate!7369) lt!328574)) (bvsge x!1131 (x!62995 lt!328574))))))

(assert (=> b!740044 (= lt!328577 (Found!7369 j!159))))

(assert (=> b!740044 e!413875))

(declare-fun res!497366 () Bool)

(assert (=> b!740044 (=> (not res!497366) (not e!413875))))

(assert (=> b!740044 (= res!497366 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328570 () Unit!25249)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25249)

(assert (=> b!740044 (= lt!328570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65364 res!497368) b!740034))

(assert (= (and b!740034 res!497367) b!740035))

(assert (= (and b!740035 res!497371) b!740028))

(assert (= (and b!740028 res!497376) b!740027))

(assert (= (and b!740027 res!497369) b!740043))

(assert (= (and b!740043 res!497361) b!740026))

(assert (= (and b!740026 res!497362) b!740036))

(assert (= (and b!740036 res!497375) b!740030))

(assert (= (and b!740030 res!497373) b!740022))

(assert (= (and b!740022 res!497372) b!740025))

(assert (= (and b!740025 res!497360) b!740024))

(assert (= (and b!740024 c!81714) b!740031))

(assert (= (and b!740024 (not c!81714)) b!740039))

(assert (= (and b!740024 res!497374) b!740040))

(assert (= (and b!740040 res!497363) b!740044))

(assert (= (and b!740044 res!497366) b!740023))

(assert (= (and b!740023 res!497364) b!740029))

(assert (= (and b!740044 (not res!497370)) b!740042))

(assert (= (and b!740042 c!81715) b!740032))

(assert (= (and b!740042 (not c!81715)) b!740041))

(assert (= (and b!740042 (not res!497365)) b!740021))

(assert (= (and b!740021 c!81716) b!740038))

(assert (= (and b!740021 (not c!81716)) b!740033))

(assert (= (and b!740021 (not res!497377)) b!740037))

(declare-fun m!691857 () Bool)

(assert (=> b!740026 m!691857))

(declare-fun m!691859 () Bool)

(assert (=> start!65364 m!691859))

(declare-fun m!691861 () Bool)

(assert (=> start!65364 m!691861))

(declare-fun m!691863 () Bool)

(assert (=> b!740042 m!691863))

(declare-fun m!691865 () Bool)

(assert (=> b!740023 m!691865))

(assert (=> b!740023 m!691865))

(declare-fun m!691867 () Bool)

(assert (=> b!740023 m!691867))

(declare-fun m!691869 () Bool)

(assert (=> b!740025 m!691869))

(assert (=> b!740022 m!691865))

(assert (=> b!740022 m!691865))

(declare-fun m!691871 () Bool)

(assert (=> b!740022 m!691871))

(assert (=> b!740022 m!691871))

(assert (=> b!740022 m!691865))

(declare-fun m!691873 () Bool)

(assert (=> b!740022 m!691873))

(assert (=> b!740031 m!691865))

(assert (=> b!740031 m!691865))

(declare-fun m!691875 () Bool)

(assert (=> b!740031 m!691875))

(declare-fun m!691877 () Bool)

(assert (=> b!740044 m!691877))

(declare-fun m!691879 () Bool)

(assert (=> b!740044 m!691879))

(assert (=> b!740033 m!691865))

(assert (=> b!740033 m!691865))

(declare-fun m!691881 () Bool)

(assert (=> b!740033 m!691881))

(assert (=> b!740038 m!691865))

(assert (=> b!740038 m!691865))

(declare-fun m!691883 () Bool)

(assert (=> b!740038 m!691883))

(assert (=> b!740032 m!691865))

(assert (=> b!740032 m!691865))

(assert (=> b!740032 m!691883))

(declare-fun m!691885 () Bool)

(assert (=> b!740036 m!691885))

(assert (=> b!740035 m!691865))

(assert (=> b!740035 m!691865))

(declare-fun m!691887 () Bool)

(assert (=> b!740035 m!691887))

(declare-fun m!691889 () Bool)

(assert (=> b!740027 m!691889))

(assert (=> b!740029 m!691865))

(assert (=> b!740029 m!691865))

(declare-fun m!691891 () Bool)

(assert (=> b!740029 m!691891))

(declare-fun m!691893 () Bool)

(assert (=> b!740040 m!691893))

(declare-fun m!691895 () Bool)

(assert (=> b!740040 m!691895))

(declare-fun m!691897 () Bool)

(assert (=> b!740040 m!691897))

(declare-fun m!691899 () Bool)

(assert (=> b!740040 m!691899))

(declare-fun m!691901 () Bool)

(assert (=> b!740040 m!691901))

(assert (=> b!740040 m!691897))

(declare-fun m!691903 () Bool)

(assert (=> b!740037 m!691903))

(assert (=> b!740039 m!691865))

(assert (=> b!740039 m!691865))

(declare-fun m!691905 () Bool)

(assert (=> b!740039 m!691905))

(declare-fun m!691907 () Bool)

(assert (=> b!740043 m!691907))

(assert (=> b!740041 m!691865))

(assert (=> b!740041 m!691865))

(assert (=> b!740041 m!691905))

(assert (=> b!740041 m!691865))

(assert (=> b!740041 m!691881))

(declare-fun m!691909 () Bool)

(assert (=> b!740028 m!691909))

(check-sat (not b!740036) (not b!740026) (not b!740035) (not b!740040) (not start!65364) (not b!740023) (not b!740028) (not b!740037) (not b!740032) (not b!740042) (not b!740033) (not b!740027) (not b!740022) (not b!740031) (not b!740039) (not b!740029) (not b!740038) (not b!740041) (not b!740043) (not b!740044))
(check-sat)
