; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67660 () Bool)

(assert start!67660)

(declare-fun b!782029 () Bool)

(declare-fun res!528869 () Bool)

(declare-fun e!435041 () Bool)

(assert (=> b!782029 (=> (not res!528869) (not e!435041))))

(declare-datatypes ((array!42643 0))(
  ( (array!42644 (arr!20407 (Array (_ BitVec 32) (_ BitVec 64))) (size!20827 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42643)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782029 (= res!528869 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782030 () Bool)

(declare-datatypes ((Unit!26917 0))(
  ( (Unit!26918) )
))
(declare-fun e!435035 () Unit!26917)

(declare-fun Unit!26919 () Unit!26917)

(assert (=> b!782030 (= e!435035 Unit!26919)))

(assert (=> b!782030 false))

(declare-fun res!528873 () Bool)

(assert (=> start!67660 (=> (not res!528873) (not e!435041))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67660 (= res!528873 (validMask!0 mask!3328))))

(assert (=> start!67660 e!435041))

(assert (=> start!67660 true))

(declare-fun array_inv!16266 (array!42643) Bool)

(assert (=> start!67660 (array_inv!16266 a!3186)))

(declare-fun b!782031 () Bool)

(declare-fun e!435040 () Bool)

(declare-fun e!435043 () Bool)

(assert (=> b!782031 (= e!435040 e!435043)))

(declare-fun res!528861 () Bool)

(assert (=> b!782031 (=> (not res!528861) (not e!435043))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7963 0))(
  ( (MissingZero!7963 (index!34220 (_ BitVec 32))) (Found!7963 (index!34221 (_ BitVec 32))) (Intermediate!7963 (undefined!8775 Bool) (index!34222 (_ BitVec 32)) (x!65337 (_ BitVec 32))) (Undefined!7963) (MissingVacant!7963 (index!34223 (_ BitVec 32))) )
))
(declare-fun lt!348480 () SeekEntryResult!7963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42643 (_ BitVec 32)) SeekEntryResult!7963)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782031 (= res!528861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20407 a!3186) j!159) mask!3328) (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!348480))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782031 (= lt!348480 (Intermediate!7963 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782032 () Bool)

(declare-fun res!528864 () Bool)

(assert (=> b!782032 (=> (not res!528864) (not e!435040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42643 (_ BitVec 32)) Bool)

(assert (=> b!782032 (= res!528864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!782033 () Bool)

(declare-fun e!435042 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42643 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!782033 (= e!435042 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) (Found!7963 j!159)))))

(declare-fun b!782034 () Bool)

(declare-fun res!528858 () Bool)

(assert (=> b!782034 (=> (not res!528858) (not e!435041))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782034 (= res!528858 (and (= (size!20827 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20827 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20827 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782035 () Bool)

(declare-fun res!528870 () Bool)

(assert (=> b!782035 (=> (not res!528870) (not e!435043))))

(assert (=> b!782035 (= res!528870 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20407 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782036 () Bool)

(declare-fun res!528859 () Bool)

(assert (=> b!782036 (=> (not res!528859) (not e!435043))))

(assert (=> b!782036 (= res!528859 e!435042)))

(declare-fun c!86996 () Bool)

(assert (=> b!782036 (= c!86996 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!348477 () SeekEntryResult!7963)

(declare-fun e!435036 () Bool)

(declare-fun b!782037 () Bool)

(assert (=> b!782037 (= e!435036 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!348477))))

(declare-fun b!782038 () Bool)

(declare-fun e!435038 () Bool)

(declare-fun e!435039 () Bool)

(assert (=> b!782038 (= e!435038 (not e!435039))))

(declare-fun res!528871 () Bool)

(assert (=> b!782038 (=> res!528871 e!435039)))

(declare-fun lt!348481 () SeekEntryResult!7963)

(get-info :version)

(assert (=> b!782038 (= res!528871 (or (not ((_ is Intermediate!7963) lt!348481)) (bvslt x!1131 (x!65337 lt!348481)) (not (= x!1131 (x!65337 lt!348481))) (not (= index!1321 (index!34222 lt!348481)))))))

(assert (=> b!782038 e!435036))

(declare-fun res!528867 () Bool)

(assert (=> b!782038 (=> (not res!528867) (not e!435036))))

(declare-fun lt!348474 () SeekEntryResult!7963)

(assert (=> b!782038 (= res!528867 (= lt!348474 lt!348477))))

(assert (=> b!782038 (= lt!348477 (Found!7963 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42643 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!782038 (= lt!348474 (seekEntryOrOpen!0 (select (arr!20407 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782038 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348476 () Unit!26917)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26917)

(assert (=> b!782038 (= lt!348476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782039 () Bool)

(declare-fun Unit!26920 () Unit!26917)

(assert (=> b!782039 (= e!435035 Unit!26920)))

(declare-fun b!782040 () Bool)

(declare-fun res!528865 () Bool)

(assert (=> b!782040 (=> res!528865 e!435039)))

(assert (=> b!782040 (= res!528865 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!348477)))))

(declare-fun b!782041 () Bool)

(declare-fun res!528857 () Bool)

(assert (=> b!782041 (=> (not res!528857) (not e!435041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782041 (= res!528857 (validKeyInArray!0 k0!2102))))

(declare-fun b!782042 () Bool)

(declare-fun res!528860 () Bool)

(assert (=> b!782042 (=> res!528860 e!435039)))

(declare-fun lt!348473 () (_ BitVec 64))

(assert (=> b!782042 (= res!528860 (= (select (store (arr!20407 a!3186) i!1173 k0!2102) index!1321) lt!348473))))

(declare-fun b!782043 () Bool)

(assert (=> b!782043 (= e!435043 e!435038)))

(declare-fun res!528868 () Bool)

(assert (=> b!782043 (=> (not res!528868) (not e!435038))))

(declare-fun lt!348475 () SeekEntryResult!7963)

(assert (=> b!782043 (= res!528868 (= lt!348475 lt!348481))))

(declare-fun lt!348479 () array!42643)

(assert (=> b!782043 (= lt!348481 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348473 lt!348479 mask!3328))))

(assert (=> b!782043 (= lt!348475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348473 mask!3328) lt!348473 lt!348479 mask!3328))))

(assert (=> b!782043 (= lt!348473 (select (store (arr!20407 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782043 (= lt!348479 (array!42644 (store (arr!20407 a!3186) i!1173 k0!2102) (size!20827 a!3186)))))

(declare-fun b!782044 () Bool)

(assert (=> b!782044 (= e!435041 e!435040)))

(declare-fun res!528863 () Bool)

(assert (=> b!782044 (=> (not res!528863) (not e!435040))))

(declare-fun lt!348472 () SeekEntryResult!7963)

(assert (=> b!782044 (= res!528863 (or (= lt!348472 (MissingZero!7963 i!1173)) (= lt!348472 (MissingVacant!7963 i!1173))))))

(assert (=> b!782044 (= lt!348472 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782045 () Bool)

(assert (=> b!782045 (= e!435042 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!348480))))

(declare-fun b!782046 () Bool)

(declare-fun res!528872 () Bool)

(assert (=> b!782046 (=> (not res!528872) (not e!435041))))

(assert (=> b!782046 (= res!528872 (validKeyInArray!0 (select (arr!20407 a!3186) j!159)))))

(declare-fun b!782047 () Bool)

(declare-fun res!528866 () Bool)

(assert (=> b!782047 (=> (not res!528866) (not e!435040))))

(declare-datatypes ((List!14316 0))(
  ( (Nil!14313) (Cons!14312 (h!15438 (_ BitVec 64)) (t!20623 List!14316)) )
))
(declare-fun arrayNoDuplicates!0 (array!42643 (_ BitVec 32) List!14316) Bool)

(assert (=> b!782047 (= res!528866 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14313))))

(declare-fun b!782048 () Bool)

(declare-fun res!528862 () Bool)

(assert (=> b!782048 (=> (not res!528862) (not e!435040))))

(assert (=> b!782048 (= res!528862 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20827 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20827 a!3186))))))

(declare-fun b!782049 () Bool)

(assert (=> b!782049 (= e!435039 true)))

(assert (=> b!782049 (= (select (store (arr!20407 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348478 () Unit!26917)

(assert (=> b!782049 (= lt!348478 e!435035)))

(declare-fun c!86995 () Bool)

(assert (=> b!782049 (= c!86995 (= (select (store (arr!20407 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67660 res!528873) b!782034))

(assert (= (and b!782034 res!528858) b!782046))

(assert (= (and b!782046 res!528872) b!782041))

(assert (= (and b!782041 res!528857) b!782029))

(assert (= (and b!782029 res!528869) b!782044))

(assert (= (and b!782044 res!528863) b!782032))

(assert (= (and b!782032 res!528864) b!782047))

(assert (= (and b!782047 res!528866) b!782048))

(assert (= (and b!782048 res!528862) b!782031))

(assert (= (and b!782031 res!528861) b!782035))

(assert (= (and b!782035 res!528870) b!782036))

(assert (= (and b!782036 c!86996) b!782045))

(assert (= (and b!782036 (not c!86996)) b!782033))

(assert (= (and b!782036 res!528859) b!782043))

(assert (= (and b!782043 res!528868) b!782038))

(assert (= (and b!782038 res!528867) b!782037))

(assert (= (and b!782038 (not res!528871)) b!782040))

(assert (= (and b!782040 (not res!528865)) b!782042))

(assert (= (and b!782042 (not res!528860)) b!782049))

(assert (= (and b!782049 c!86995) b!782030))

(assert (= (and b!782049 (not c!86995)) b!782039))

(declare-fun m!725489 () Bool)

(assert (=> b!782049 m!725489))

(declare-fun m!725491 () Bool)

(assert (=> b!782049 m!725491))

(declare-fun m!725493 () Bool)

(assert (=> b!782032 m!725493))

(declare-fun m!725495 () Bool)

(assert (=> b!782037 m!725495))

(assert (=> b!782037 m!725495))

(declare-fun m!725497 () Bool)

(assert (=> b!782037 m!725497))

(assert (=> b!782031 m!725495))

(assert (=> b!782031 m!725495))

(declare-fun m!725499 () Bool)

(assert (=> b!782031 m!725499))

(assert (=> b!782031 m!725499))

(assert (=> b!782031 m!725495))

(declare-fun m!725501 () Bool)

(assert (=> b!782031 m!725501))

(declare-fun m!725503 () Bool)

(assert (=> start!67660 m!725503))

(declare-fun m!725505 () Bool)

(assert (=> start!67660 m!725505))

(assert (=> b!782033 m!725495))

(assert (=> b!782033 m!725495))

(declare-fun m!725507 () Bool)

(assert (=> b!782033 m!725507))

(assert (=> b!782038 m!725495))

(assert (=> b!782038 m!725495))

(declare-fun m!725509 () Bool)

(assert (=> b!782038 m!725509))

(declare-fun m!725511 () Bool)

(assert (=> b!782038 m!725511))

(declare-fun m!725513 () Bool)

(assert (=> b!782038 m!725513))

(assert (=> b!782046 m!725495))

(assert (=> b!782046 m!725495))

(declare-fun m!725515 () Bool)

(assert (=> b!782046 m!725515))

(declare-fun m!725517 () Bool)

(assert (=> b!782035 m!725517))

(assert (=> b!782040 m!725495))

(assert (=> b!782040 m!725495))

(assert (=> b!782040 m!725507))

(declare-fun m!725519 () Bool)

(assert (=> b!782044 m!725519))

(assert (=> b!782045 m!725495))

(assert (=> b!782045 m!725495))

(declare-fun m!725521 () Bool)

(assert (=> b!782045 m!725521))

(declare-fun m!725523 () Bool)

(assert (=> b!782029 m!725523))

(declare-fun m!725525 () Bool)

(assert (=> b!782043 m!725525))

(declare-fun m!725527 () Bool)

(assert (=> b!782043 m!725527))

(declare-fun m!725529 () Bool)

(assert (=> b!782043 m!725529))

(declare-fun m!725531 () Bool)

(assert (=> b!782043 m!725531))

(assert (=> b!782043 m!725529))

(assert (=> b!782043 m!725489))

(declare-fun m!725533 () Bool)

(assert (=> b!782041 m!725533))

(declare-fun m!725535 () Bool)

(assert (=> b!782047 m!725535))

(assert (=> b!782042 m!725489))

(assert (=> b!782042 m!725491))

(check-sat (not b!782033) (not b!782038) (not start!67660) (not b!782045) (not b!782046) (not b!782040) (not b!782047) (not b!782037) (not b!782041) (not b!782031) (not b!782044) (not b!782043) (not b!782032) (not b!782029))
(check-sat)
