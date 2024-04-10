; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65430 () Bool)

(assert start!65430)

(declare-fun b!745060 () Bool)

(declare-fun e!416164 () Bool)

(declare-fun e!416165 () Bool)

(assert (=> b!745060 (= e!416164 (not e!416165))))

(declare-fun res!501981 () Bool)

(assert (=> b!745060 (=> res!501981 e!416165)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7515 0))(
  ( (MissingZero!7515 (index!32428 (_ BitVec 32))) (Found!7515 (index!32429 (_ BitVec 32))) (Intermediate!7515 (undefined!8327 Bool) (index!32430 (_ BitVec 32)) (x!63385 (_ BitVec 32))) (Undefined!7515) (MissingVacant!7515 (index!32431 (_ BitVec 32))) )
))
(declare-fun lt!331001 () SeekEntryResult!7515)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!745060 (= res!501981 (or (not ((_ is Intermediate!7515) lt!331001)) (bvslt x!1131 (x!63385 lt!331001)) (not (= x!1131 (x!63385 lt!331001))) (not (= index!1321 (index!32430 lt!331001)))))))

(declare-fun e!416163 () Bool)

(assert (=> b!745060 e!416163))

(declare-fun res!501991 () Bool)

(assert (=> b!745060 (=> (not res!501991) (not e!416163))))

(declare-datatypes ((array!41603 0))(
  ( (array!41604 (arr!19915 (Array (_ BitVec 32) (_ BitVec 64))) (size!20336 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41603)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41603 (_ BitVec 32)) Bool)

(assert (=> b!745060 (= res!501991 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25510 0))(
  ( (Unit!25511) )
))
(declare-fun lt!331002 () Unit!25510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25510)

(assert (=> b!745060 (= lt!331002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745061 () Bool)

(declare-fun res!501986 () Bool)

(declare-fun e!416159 () Bool)

(assert (=> b!745061 (=> (not res!501986) (not e!416159))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745061 (= res!501986 (validKeyInArray!0 k0!2102))))

(declare-fun b!745062 () Bool)

(declare-fun e!416162 () Bool)

(declare-fun e!416157 () Bool)

(assert (=> b!745062 (= e!416162 e!416157)))

(declare-fun res!501984 () Bool)

(assert (=> b!745062 (=> (not res!501984) (not e!416157))))

(declare-fun lt!331003 () SeekEntryResult!7515)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41603 (_ BitVec 32)) SeekEntryResult!7515)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745062 (= res!501984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19915 a!3186) j!159) mask!3328) (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!331003))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745062 (= lt!331003 (Intermediate!7515 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!330997 () SeekEntryResult!7515)

(declare-fun b!745063 () Bool)

(declare-fun e!416161 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41603 (_ BitVec 32)) SeekEntryResult!7515)

(assert (=> b!745063 (= e!416161 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!330997))))

(declare-fun b!745064 () Bool)

(declare-fun res!501988 () Bool)

(assert (=> b!745064 (=> (not res!501988) (not e!416162))))

(assert (=> b!745064 (= res!501988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745065 () Bool)

(declare-fun res!501992 () Bool)

(assert (=> b!745065 (=> (not res!501992) (not e!416162))))

(assert (=> b!745065 (= res!501992 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20336 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20336 a!3186))))))

(declare-fun b!745066 () Bool)

(assert (=> b!745066 (= e!416165 true)))

(declare-fun lt!330999 () SeekEntryResult!7515)

(assert (=> b!745066 (= lt!330999 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19915 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745067 () Bool)

(declare-fun res!501985 () Bool)

(assert (=> b!745067 (=> (not res!501985) (not e!416157))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745067 (= res!501985 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19915 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745068 () Bool)

(declare-fun res!501983 () Bool)

(assert (=> b!745068 (=> (not res!501983) (not e!416159))))

(assert (=> b!745068 (= res!501983 (and (= (size!20336 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20336 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20336 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745069 () Bool)

(declare-fun res!501980 () Bool)

(assert (=> b!745069 (=> (not res!501980) (not e!416157))))

(declare-fun e!416160 () Bool)

(assert (=> b!745069 (= res!501980 e!416160)))

(declare-fun c!81922 () Bool)

(assert (=> b!745069 (= c!81922 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745070 () Bool)

(declare-fun res!501989 () Bool)

(assert (=> b!745070 (=> (not res!501989) (not e!416162))))

(declare-datatypes ((List!13917 0))(
  ( (Nil!13914) (Cons!13913 (h!14985 (_ BitVec 64)) (t!20232 List!13917)) )
))
(declare-fun arrayNoDuplicates!0 (array!41603 (_ BitVec 32) List!13917) Bool)

(assert (=> b!745070 (= res!501989 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13914))))

(declare-fun b!745071 () Bool)

(assert (=> b!745071 (= e!416160 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!331003))))

(declare-fun b!745072 () Bool)

(declare-fun res!501978 () Bool)

(assert (=> b!745072 (=> (not res!501978) (not e!416159))))

(declare-fun arrayContainsKey!0 (array!41603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745072 (= res!501978 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745073 () Bool)

(assert (=> b!745073 (= e!416157 e!416164)))

(declare-fun res!501987 () Bool)

(assert (=> b!745073 (=> (not res!501987) (not e!416164))))

(declare-fun lt!330998 () SeekEntryResult!7515)

(assert (=> b!745073 (= res!501987 (= lt!330998 lt!331001))))

(declare-fun lt!330996 () (_ BitVec 64))

(declare-fun lt!331004 () array!41603)

(assert (=> b!745073 (= lt!331001 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330996 lt!331004 mask!3328))))

(assert (=> b!745073 (= lt!330998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330996 mask!3328) lt!330996 lt!331004 mask!3328))))

(assert (=> b!745073 (= lt!330996 (select (store (arr!19915 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745073 (= lt!331004 (array!41604 (store (arr!19915 a!3186) i!1173 k0!2102) (size!20336 a!3186)))))

(declare-fun b!745074 () Bool)

(assert (=> b!745074 (= e!416160 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) (Found!7515 j!159)))))

(declare-fun b!745075 () Bool)

(assert (=> b!745075 (= e!416163 e!416161)))

(declare-fun res!501979 () Bool)

(assert (=> b!745075 (=> (not res!501979) (not e!416161))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41603 (_ BitVec 32)) SeekEntryResult!7515)

(assert (=> b!745075 (= res!501979 (= (seekEntryOrOpen!0 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!330997))))

(assert (=> b!745075 (= lt!330997 (Found!7515 j!159))))

(declare-fun res!501982 () Bool)

(assert (=> start!65430 (=> (not res!501982) (not e!416159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65430 (= res!501982 (validMask!0 mask!3328))))

(assert (=> start!65430 e!416159))

(assert (=> start!65430 true))

(declare-fun array_inv!15711 (array!41603) Bool)

(assert (=> start!65430 (array_inv!15711 a!3186)))

(declare-fun b!745076 () Bool)

(assert (=> b!745076 (= e!416159 e!416162)))

(declare-fun res!501977 () Bool)

(assert (=> b!745076 (=> (not res!501977) (not e!416162))))

(declare-fun lt!331000 () SeekEntryResult!7515)

(assert (=> b!745076 (= res!501977 (or (= lt!331000 (MissingZero!7515 i!1173)) (= lt!331000 (MissingVacant!7515 i!1173))))))

(assert (=> b!745076 (= lt!331000 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745077 () Bool)

(declare-fun res!501990 () Bool)

(assert (=> b!745077 (=> (not res!501990) (not e!416159))))

(assert (=> b!745077 (= res!501990 (validKeyInArray!0 (select (arr!19915 a!3186) j!159)))))

(assert (= (and start!65430 res!501982) b!745068))

(assert (= (and b!745068 res!501983) b!745077))

(assert (= (and b!745077 res!501990) b!745061))

(assert (= (and b!745061 res!501986) b!745072))

(assert (= (and b!745072 res!501978) b!745076))

(assert (= (and b!745076 res!501977) b!745064))

(assert (= (and b!745064 res!501988) b!745070))

(assert (= (and b!745070 res!501989) b!745065))

(assert (= (and b!745065 res!501992) b!745062))

(assert (= (and b!745062 res!501984) b!745067))

(assert (= (and b!745067 res!501985) b!745069))

(assert (= (and b!745069 c!81922) b!745071))

(assert (= (and b!745069 (not c!81922)) b!745074))

(assert (= (and b!745069 res!501980) b!745073))

(assert (= (and b!745073 res!501987) b!745060))

(assert (= (and b!745060 res!501991) b!745075))

(assert (= (and b!745075 res!501979) b!745063))

(assert (= (and b!745060 (not res!501981)) b!745066))

(declare-fun m!695495 () Bool)

(assert (=> b!745070 m!695495))

(declare-fun m!695497 () Bool)

(assert (=> b!745060 m!695497))

(declare-fun m!695499 () Bool)

(assert (=> b!745060 m!695499))

(declare-fun m!695501 () Bool)

(assert (=> b!745072 m!695501))

(declare-fun m!695503 () Bool)

(assert (=> b!745061 m!695503))

(declare-fun m!695505 () Bool)

(assert (=> b!745076 m!695505))

(declare-fun m!695507 () Bool)

(assert (=> b!745064 m!695507))

(declare-fun m!695509 () Bool)

(assert (=> b!745066 m!695509))

(assert (=> b!745066 m!695509))

(declare-fun m!695511 () Bool)

(assert (=> b!745066 m!695511))

(assert (=> b!745062 m!695509))

(assert (=> b!745062 m!695509))

(declare-fun m!695513 () Bool)

(assert (=> b!745062 m!695513))

(assert (=> b!745062 m!695513))

(assert (=> b!745062 m!695509))

(declare-fun m!695515 () Bool)

(assert (=> b!745062 m!695515))

(declare-fun m!695517 () Bool)

(assert (=> b!745073 m!695517))

(declare-fun m!695519 () Bool)

(assert (=> b!745073 m!695519))

(declare-fun m!695521 () Bool)

(assert (=> b!745073 m!695521))

(declare-fun m!695523 () Bool)

(assert (=> b!745073 m!695523))

(declare-fun m!695525 () Bool)

(assert (=> b!745073 m!695525))

(assert (=> b!745073 m!695523))

(assert (=> b!745074 m!695509))

(assert (=> b!745074 m!695509))

(assert (=> b!745074 m!695511))

(assert (=> b!745075 m!695509))

(assert (=> b!745075 m!695509))

(declare-fun m!695527 () Bool)

(assert (=> b!745075 m!695527))

(assert (=> b!745063 m!695509))

(assert (=> b!745063 m!695509))

(declare-fun m!695529 () Bool)

(assert (=> b!745063 m!695529))

(assert (=> b!745071 m!695509))

(assert (=> b!745071 m!695509))

(declare-fun m!695531 () Bool)

(assert (=> b!745071 m!695531))

(declare-fun m!695533 () Bool)

(assert (=> b!745067 m!695533))

(declare-fun m!695535 () Bool)

(assert (=> start!65430 m!695535))

(declare-fun m!695537 () Bool)

(assert (=> start!65430 m!695537))

(assert (=> b!745077 m!695509))

(assert (=> b!745077 m!695509))

(declare-fun m!695539 () Bool)

(assert (=> b!745077 m!695539))

(check-sat (not b!745063) (not b!745076) (not b!745064) (not b!745062) (not b!745074) (not b!745071) (not b!745072) (not b!745060) (not b!745077) (not b!745075) (not b!745070) (not b!745073) (not b!745066) (not b!745061) (not start!65430))
(check-sat)
