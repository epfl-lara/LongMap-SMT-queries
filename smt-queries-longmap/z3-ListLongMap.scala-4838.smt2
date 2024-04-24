; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66692 () Bool)

(assert start!66692)

(declare-fun b!767861 () Bool)

(declare-fun e!427649 () Bool)

(declare-fun e!427654 () Bool)

(assert (=> b!767861 (= e!427649 e!427654)))

(declare-fun res!519279 () Bool)

(assert (=> b!767861 (=> (not res!519279) (not e!427654))))

(declare-datatypes ((array!42280 0))(
  ( (array!42281 (arr!20239 (Array (_ BitVec 32) (_ BitVec 64))) (size!20659 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42280)

(declare-datatypes ((SeekEntryResult!7795 0))(
  ( (MissingZero!7795 (index!33548 (_ BitVec 32))) (Found!7795 (index!33549 (_ BitVec 32))) (Intermediate!7795 (undefined!8607 Bool) (index!33550 (_ BitVec 32)) (x!64624 (_ BitVec 32))) (Undefined!7795) (MissingVacant!7795 (index!33551 (_ BitVec 32))) )
))
(declare-fun lt!341559 () SeekEntryResult!7795)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42280 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!767861 (= res!519279 (= (seekEntryOrOpen!0 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341559))))

(assert (=> b!767861 (= lt!341559 (Found!7795 j!159))))

(declare-fun b!767862 () Bool)

(declare-fun e!427657 () Bool)

(declare-fun e!427653 () Bool)

(assert (=> b!767862 (= e!427657 (not e!427653))))

(declare-fun res!519277 () Bool)

(assert (=> b!767862 (=> res!519277 e!427653)))

(declare-fun lt!341558 () SeekEntryResult!7795)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!767862 (= res!519277 (or (not ((_ is Intermediate!7795) lt!341558)) (bvsge x!1131 (x!64624 lt!341558))))))

(assert (=> b!767862 e!427649))

(declare-fun res!519276 () Bool)

(assert (=> b!767862 (=> (not res!519276) (not e!427649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42280 (_ BitVec 32)) Bool)

(assert (=> b!767862 (= res!519276 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26395 0))(
  ( (Unit!26396) )
))
(declare-fun lt!341557 () Unit!26395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26395)

(assert (=> b!767862 (= lt!341557 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767864 () Bool)

(declare-fun res!519284 () Bool)

(declare-fun e!427650 () Bool)

(assert (=> b!767864 (=> (not res!519284) (not e!427650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767864 (= res!519284 (validKeyInArray!0 (select (arr!20239 a!3186) j!159)))))

(declare-fun b!767865 () Bool)

(declare-fun res!519275 () Bool)

(declare-fun e!427655 () Bool)

(assert (=> b!767865 (=> (not res!519275) (not e!427655))))

(assert (=> b!767865 (= res!519275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!341556 () SeekEntryResult!7795)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!767866 () Bool)

(declare-fun e!427652 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42280 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!767866 (= e!427652 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341556))))

(declare-fun b!767867 () Bool)

(declare-fun res!519281 () Bool)

(assert (=> b!767867 (=> (not res!519281) (not e!427650))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767867 (= res!519281 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!767868 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42280 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!767868 (= e!427654 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341559))))

(declare-fun b!767869 () Bool)

(declare-fun res!519286 () Bool)

(assert (=> b!767869 (=> (not res!519286) (not e!427650))))

(assert (=> b!767869 (= res!519286 (validKeyInArray!0 k0!2102))))

(declare-fun b!767870 () Bool)

(declare-fun e!427658 () Bool)

(assert (=> b!767870 (= e!427658 e!427657)))

(declare-fun res!519274 () Bool)

(assert (=> b!767870 (=> (not res!519274) (not e!427657))))

(declare-fun lt!341555 () SeekEntryResult!7795)

(assert (=> b!767870 (= res!519274 (= lt!341555 lt!341558))))

(declare-fun lt!341562 () (_ BitVec 64))

(declare-fun lt!341553 () array!42280)

(assert (=> b!767870 (= lt!341558 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341562 lt!341553 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767870 (= lt!341555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341562 mask!3328) lt!341562 lt!341553 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767870 (= lt!341562 (select (store (arr!20239 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767870 (= lt!341553 (array!42281 (store (arr!20239 a!3186) i!1173 k0!2102) (size!20659 a!3186)))))

(declare-fun b!767871 () Bool)

(assert (=> b!767871 (= e!427652 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328) (Found!7795 j!159)))))

(declare-fun b!767872 () Bool)

(declare-fun e!427651 () Bool)

(assert (=> b!767872 (= e!427651 true)))

(declare-fun lt!341554 () SeekEntryResult!7795)

(assert (=> b!767872 (= lt!341554 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20239 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767873 () Bool)

(declare-fun res!519271 () Bool)

(assert (=> b!767873 (=> (not res!519271) (not e!427650))))

(assert (=> b!767873 (= res!519271 (and (= (size!20659 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20659 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20659 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767863 () Bool)

(declare-fun res!519282 () Bool)

(assert (=> b!767863 (=> (not res!519282) (not e!427658))))

(assert (=> b!767863 (= res!519282 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20239 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!519287 () Bool)

(assert (=> start!66692 (=> (not res!519287) (not e!427650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66692 (= res!519287 (validMask!0 mask!3328))))

(assert (=> start!66692 e!427650))

(assert (=> start!66692 true))

(declare-fun array_inv!16098 (array!42280) Bool)

(assert (=> start!66692 (array_inv!16098 a!3186)))

(declare-fun b!767874 () Bool)

(assert (=> b!767874 (= e!427653 e!427651)))

(declare-fun res!519272 () Bool)

(assert (=> b!767874 (=> res!519272 e!427651)))

(assert (=> b!767874 (= res!519272 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341561 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767874 (= lt!341561 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!767875 () Bool)

(declare-fun res!519285 () Bool)

(assert (=> b!767875 (=> (not res!519285) (not e!427655))))

(declare-datatypes ((List!14148 0))(
  ( (Nil!14145) (Cons!14144 (h!15243 (_ BitVec 64)) (t!20455 List!14148)) )
))
(declare-fun arrayNoDuplicates!0 (array!42280 (_ BitVec 32) List!14148) Bool)

(assert (=> b!767875 (= res!519285 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14145))))

(declare-fun b!767876 () Bool)

(assert (=> b!767876 (= e!427655 e!427658)))

(declare-fun res!519283 () Bool)

(assert (=> b!767876 (=> (not res!519283) (not e!427658))))

(assert (=> b!767876 (= res!519283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20239 a!3186) j!159) mask!3328) (select (arr!20239 a!3186) j!159) a!3186 mask!3328) lt!341556))))

(assert (=> b!767876 (= lt!341556 (Intermediate!7795 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767877 () Bool)

(assert (=> b!767877 (= e!427650 e!427655)))

(declare-fun res!519278 () Bool)

(assert (=> b!767877 (=> (not res!519278) (not e!427655))))

(declare-fun lt!341560 () SeekEntryResult!7795)

(assert (=> b!767877 (= res!519278 (or (= lt!341560 (MissingZero!7795 i!1173)) (= lt!341560 (MissingVacant!7795 i!1173))))))

(assert (=> b!767877 (= lt!341560 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767878 () Bool)

(declare-fun res!519273 () Bool)

(assert (=> b!767878 (=> (not res!519273) (not e!427655))))

(assert (=> b!767878 (= res!519273 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20659 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20659 a!3186))))))

(declare-fun b!767879 () Bool)

(declare-fun res!519280 () Bool)

(assert (=> b!767879 (=> (not res!519280) (not e!427658))))

(assert (=> b!767879 (= res!519280 e!427652)))

(declare-fun c!84689 () Bool)

(assert (=> b!767879 (= c!84689 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66692 res!519287) b!767873))

(assert (= (and b!767873 res!519271) b!767864))

(assert (= (and b!767864 res!519284) b!767869))

(assert (= (and b!767869 res!519286) b!767867))

(assert (= (and b!767867 res!519281) b!767877))

(assert (= (and b!767877 res!519278) b!767865))

(assert (= (and b!767865 res!519275) b!767875))

(assert (= (and b!767875 res!519285) b!767878))

(assert (= (and b!767878 res!519273) b!767876))

(assert (= (and b!767876 res!519283) b!767863))

(assert (= (and b!767863 res!519282) b!767879))

(assert (= (and b!767879 c!84689) b!767866))

(assert (= (and b!767879 (not c!84689)) b!767871))

(assert (= (and b!767879 res!519280) b!767870))

(assert (= (and b!767870 res!519274) b!767862))

(assert (= (and b!767862 res!519276) b!767861))

(assert (= (and b!767861 res!519279) b!767868))

(assert (= (and b!767862 (not res!519277)) b!767874))

(assert (= (and b!767874 (not res!519272)) b!767872))

(declare-fun m!714055 () Bool)

(assert (=> b!767877 m!714055))

(declare-fun m!714057 () Bool)

(assert (=> start!66692 m!714057))

(declare-fun m!714059 () Bool)

(assert (=> start!66692 m!714059))

(declare-fun m!714061 () Bool)

(assert (=> b!767872 m!714061))

(assert (=> b!767872 m!714061))

(declare-fun m!714063 () Bool)

(assert (=> b!767872 m!714063))

(declare-fun m!714065 () Bool)

(assert (=> b!767869 m!714065))

(declare-fun m!714067 () Bool)

(assert (=> b!767863 m!714067))

(assert (=> b!767864 m!714061))

(assert (=> b!767864 m!714061))

(declare-fun m!714069 () Bool)

(assert (=> b!767864 m!714069))

(assert (=> b!767866 m!714061))

(assert (=> b!767866 m!714061))

(declare-fun m!714071 () Bool)

(assert (=> b!767866 m!714071))

(declare-fun m!714073 () Bool)

(assert (=> b!767875 m!714073))

(declare-fun m!714075 () Bool)

(assert (=> b!767867 m!714075))

(assert (=> b!767876 m!714061))

(assert (=> b!767876 m!714061))

(declare-fun m!714077 () Bool)

(assert (=> b!767876 m!714077))

(assert (=> b!767876 m!714077))

(assert (=> b!767876 m!714061))

(declare-fun m!714079 () Bool)

(assert (=> b!767876 m!714079))

(declare-fun m!714081 () Bool)

(assert (=> b!767870 m!714081))

(declare-fun m!714083 () Bool)

(assert (=> b!767870 m!714083))

(declare-fun m!714085 () Bool)

(assert (=> b!767870 m!714085))

(declare-fun m!714087 () Bool)

(assert (=> b!767870 m!714087))

(assert (=> b!767870 m!714081))

(declare-fun m!714089 () Bool)

(assert (=> b!767870 m!714089))

(assert (=> b!767871 m!714061))

(assert (=> b!767871 m!714061))

(assert (=> b!767871 m!714063))

(declare-fun m!714091 () Bool)

(assert (=> b!767874 m!714091))

(declare-fun m!714093 () Bool)

(assert (=> b!767862 m!714093))

(declare-fun m!714095 () Bool)

(assert (=> b!767862 m!714095))

(assert (=> b!767868 m!714061))

(assert (=> b!767868 m!714061))

(declare-fun m!714097 () Bool)

(assert (=> b!767868 m!714097))

(assert (=> b!767861 m!714061))

(assert (=> b!767861 m!714061))

(declare-fun m!714099 () Bool)

(assert (=> b!767861 m!714099))

(declare-fun m!714101 () Bool)

(assert (=> b!767865 m!714101))

(check-sat (not b!767869) (not b!767872) (not b!767870) (not b!767868) (not b!767874) (not b!767871) (not start!66692) (not b!767877) (not b!767865) (not b!767866) (not b!767864) (not b!767875) (not b!767862) (not b!767867) (not b!767876) (not b!767861))
(check-sat)
