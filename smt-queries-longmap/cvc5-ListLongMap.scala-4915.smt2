; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67734 () Bool)

(assert start!67734)

(declare-datatypes ((array!42774 0))(
  ( (array!42775 (arr!20475 (Array (_ BitVec 32) (_ BitVec 64))) (size!20896 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42774)

(declare-datatypes ((SeekEntryResult!8075 0))(
  ( (MissingZero!8075 (index!34668 (_ BitVec 32))) (Found!8075 (index!34669 (_ BitVec 32))) (Intermediate!8075 (undefined!8887 Bool) (index!34670 (_ BitVec 32)) (x!65615 (_ BitVec 32))) (Undefined!8075) (MissingVacant!8075 (index!34671 (_ BitVec 32))) )
))
(declare-fun lt!350520 () SeekEntryResult!8075)

(declare-fun b!786035 () Bool)

(declare-fun e!436973 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42774 (_ BitVec 32)) SeekEntryResult!8075)

(assert (=> b!786035 (= e!436973 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20475 a!3186) j!159) a!3186 mask!3328) lt!350520))))

(declare-fun b!786037 () Bool)

(declare-fun e!436966 () Bool)

(declare-fun e!436976 () Bool)

(assert (=> b!786037 (= e!436966 e!436976)))

(declare-fun res!532165 () Bool)

(assert (=> b!786037 (=> res!532165 e!436976)))

(declare-fun lt!350523 () (_ BitVec 64))

(declare-fun lt!350528 () (_ BitVec 64))

(assert (=> b!786037 (= res!532165 (= lt!350523 lt!350528))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!786037 (= lt!350523 (select (store (arr!20475 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786038 () Bool)

(declare-fun res!532157 () Bool)

(declare-fun e!436971 () Bool)

(assert (=> b!786038 (=> (not res!532157) (not e!436971))))

(assert (=> b!786038 (= res!532157 (and (= (size!20896 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20896 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20896 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786039 () Bool)

(declare-fun res!532166 () Bool)

(declare-fun e!436965 () Bool)

(assert (=> b!786039 (=> (not res!532166) (not e!436965))))

(declare-datatypes ((List!14477 0))(
  ( (Nil!14474) (Cons!14473 (h!15596 (_ BitVec 64)) (t!20792 List!14477)) )
))
(declare-fun arrayNoDuplicates!0 (array!42774 (_ BitVec 32) List!14477) Bool)

(assert (=> b!786039 (= res!532166 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14474))))

(declare-fun b!786040 () Bool)

(declare-fun res!532160 () Bool)

(assert (=> b!786040 (=> (not res!532160) (not e!436971))))

(declare-fun arrayContainsKey!0 (array!42774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786040 (= res!532160 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786041 () Bool)

(declare-fun res!532161 () Bool)

(assert (=> b!786041 (=> (not res!532161) (not e!436965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42774 (_ BitVec 32)) Bool)

(assert (=> b!786041 (= res!532161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786042 () Bool)

(declare-fun res!532170 () Bool)

(declare-fun e!436970 () Bool)

(assert (=> b!786042 (=> (not res!532170) (not e!436970))))

(assert (=> b!786042 (= res!532170 e!436973)))

(declare-fun c!87349 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786042 (= c!87349 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!786043 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42774 (_ BitVec 32)) SeekEntryResult!8075)

(assert (=> b!786043 (= e!436973 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20475 a!3186) j!159) a!3186 mask!3328) (Found!8075 j!159)))))

(declare-fun b!786044 () Bool)

(declare-fun res!532168 () Bool)

(assert (=> b!786044 (=> (not res!532168) (not e!436970))))

(assert (=> b!786044 (= res!532168 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20475 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786045 () Bool)

(assert (=> b!786045 (= e!436976 true)))

(declare-fun e!436967 () Bool)

(assert (=> b!786045 e!436967))

(declare-fun res!532158 () Bool)

(assert (=> b!786045 (=> (not res!532158) (not e!436967))))

(assert (=> b!786045 (= res!532158 (= lt!350523 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27188 0))(
  ( (Unit!27189) )
))
(declare-fun lt!350525 () Unit!27188)

(declare-fun e!436975 () Unit!27188)

(assert (=> b!786045 (= lt!350525 e!436975)))

(declare-fun c!87348 () Bool)

(assert (=> b!786045 (= c!87348 (= lt!350523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786046 () Bool)

(assert (=> b!786046 (= e!436965 e!436970)))

(declare-fun res!532163 () Bool)

(assert (=> b!786046 (=> (not res!532163) (not e!436970))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786046 (= res!532163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20475 a!3186) j!159) mask!3328) (select (arr!20475 a!3186) j!159) a!3186 mask!3328) lt!350520))))

(assert (=> b!786046 (= lt!350520 (Intermediate!8075 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!532172 () Bool)

(assert (=> start!67734 (=> (not res!532172) (not e!436971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67734 (= res!532172 (validMask!0 mask!3328))))

(assert (=> start!67734 e!436971))

(assert (=> start!67734 true))

(declare-fun array_inv!16271 (array!42774) Bool)

(assert (=> start!67734 (array_inv!16271 a!3186)))

(declare-fun b!786036 () Bool)

(declare-fun e!436974 () Bool)

(assert (=> b!786036 (= e!436970 e!436974)))

(declare-fun res!532167 () Bool)

(assert (=> b!786036 (=> (not res!532167) (not e!436974))))

(declare-fun lt!350519 () SeekEntryResult!8075)

(declare-fun lt!350518 () SeekEntryResult!8075)

(assert (=> b!786036 (= res!532167 (= lt!350519 lt!350518))))

(declare-fun lt!350526 () array!42774)

(assert (=> b!786036 (= lt!350518 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350528 lt!350526 mask!3328))))

(assert (=> b!786036 (= lt!350519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350528 mask!3328) lt!350528 lt!350526 mask!3328))))

(assert (=> b!786036 (= lt!350528 (select (store (arr!20475 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786036 (= lt!350526 (array!42775 (store (arr!20475 a!3186) i!1173 k!2102) (size!20896 a!3186)))))

(declare-fun b!786047 () Bool)

(assert (=> b!786047 (= e!436971 e!436965)))

(declare-fun res!532155 () Bool)

(assert (=> b!786047 (=> (not res!532155) (not e!436965))))

(declare-fun lt!350524 () SeekEntryResult!8075)

(assert (=> b!786047 (= res!532155 (or (= lt!350524 (MissingZero!8075 i!1173)) (= lt!350524 (MissingVacant!8075 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42774 (_ BitVec 32)) SeekEntryResult!8075)

(assert (=> b!786047 (= lt!350524 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786048 () Bool)

(declare-fun e!436968 () Bool)

(assert (=> b!786048 (= e!436974 (not e!436968))))

(declare-fun res!532164 () Bool)

(assert (=> b!786048 (=> res!532164 e!436968)))

(assert (=> b!786048 (= res!532164 (or (not (is-Intermediate!8075 lt!350518)) (bvslt x!1131 (x!65615 lt!350518)) (not (= x!1131 (x!65615 lt!350518))) (not (= index!1321 (index!34670 lt!350518)))))))

(declare-fun e!436972 () Bool)

(assert (=> b!786048 e!436972))

(declare-fun res!532156 () Bool)

(assert (=> b!786048 (=> (not res!532156) (not e!436972))))

(declare-fun lt!350522 () SeekEntryResult!8075)

(declare-fun lt!350517 () SeekEntryResult!8075)

(assert (=> b!786048 (= res!532156 (= lt!350522 lt!350517))))

(assert (=> b!786048 (= lt!350517 (Found!8075 j!159))))

(assert (=> b!786048 (= lt!350522 (seekEntryOrOpen!0 (select (arr!20475 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786048 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350521 () Unit!27188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27188)

(assert (=> b!786048 (= lt!350521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786049 () Bool)

(declare-fun Unit!27190 () Unit!27188)

(assert (=> b!786049 (= e!436975 Unit!27190)))

(assert (=> b!786049 false))

(declare-fun b!786050 () Bool)

(assert (=> b!786050 (= e!436972 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20475 a!3186) j!159) a!3186 mask!3328) lt!350517))))

(declare-fun b!786051 () Bool)

(declare-fun res!532171 () Bool)

(assert (=> b!786051 (=> (not res!532171) (not e!436967))))

(assert (=> b!786051 (= res!532171 (= (seekEntryOrOpen!0 lt!350528 lt!350526 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350528 lt!350526 mask!3328)))))

(declare-fun b!786052 () Bool)

(declare-fun Unit!27191 () Unit!27188)

(assert (=> b!786052 (= e!436975 Unit!27191)))

(declare-fun b!786053 () Bool)

(declare-fun res!532169 () Bool)

(assert (=> b!786053 (=> (not res!532169) (not e!436971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786053 (= res!532169 (validKeyInArray!0 (select (arr!20475 a!3186) j!159)))))

(declare-fun b!786054 () Bool)

(declare-fun lt!350527 () SeekEntryResult!8075)

(assert (=> b!786054 (= e!436967 (= lt!350522 lt!350527))))

(declare-fun b!786055 () Bool)

(declare-fun res!532162 () Bool)

(assert (=> b!786055 (=> (not res!532162) (not e!436971))))

(assert (=> b!786055 (= res!532162 (validKeyInArray!0 k!2102))))

(declare-fun b!786056 () Bool)

(assert (=> b!786056 (= e!436968 e!436966)))

(declare-fun res!532154 () Bool)

(assert (=> b!786056 (=> res!532154 e!436966)))

(assert (=> b!786056 (= res!532154 (not (= lt!350527 lt!350517)))))

(assert (=> b!786056 (= lt!350527 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20475 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786057 () Bool)

(declare-fun res!532159 () Bool)

(assert (=> b!786057 (=> (not res!532159) (not e!436965))))

(assert (=> b!786057 (= res!532159 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20896 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20896 a!3186))))))

(assert (= (and start!67734 res!532172) b!786038))

(assert (= (and b!786038 res!532157) b!786053))

(assert (= (and b!786053 res!532169) b!786055))

(assert (= (and b!786055 res!532162) b!786040))

(assert (= (and b!786040 res!532160) b!786047))

(assert (= (and b!786047 res!532155) b!786041))

(assert (= (and b!786041 res!532161) b!786039))

(assert (= (and b!786039 res!532166) b!786057))

(assert (= (and b!786057 res!532159) b!786046))

(assert (= (and b!786046 res!532163) b!786044))

(assert (= (and b!786044 res!532168) b!786042))

(assert (= (and b!786042 c!87349) b!786035))

(assert (= (and b!786042 (not c!87349)) b!786043))

(assert (= (and b!786042 res!532170) b!786036))

(assert (= (and b!786036 res!532167) b!786048))

(assert (= (and b!786048 res!532156) b!786050))

(assert (= (and b!786048 (not res!532164)) b!786056))

(assert (= (and b!786056 (not res!532154)) b!786037))

(assert (= (and b!786037 (not res!532165)) b!786045))

(assert (= (and b!786045 c!87348) b!786049))

(assert (= (and b!786045 (not c!87348)) b!786052))

(assert (= (and b!786045 res!532158) b!786051))

(assert (= (and b!786051 res!532171) b!786054))

(declare-fun m!727961 () Bool)

(assert (=> b!786036 m!727961))

(assert (=> b!786036 m!727961))

(declare-fun m!727963 () Bool)

(assert (=> b!786036 m!727963))

(declare-fun m!727965 () Bool)

(assert (=> b!786036 m!727965))

(declare-fun m!727967 () Bool)

(assert (=> b!786036 m!727967))

(declare-fun m!727969 () Bool)

(assert (=> b!786036 m!727969))

(declare-fun m!727971 () Bool)

(assert (=> b!786044 m!727971))

(declare-fun m!727973 () Bool)

(assert (=> b!786040 m!727973))

(assert (=> b!786037 m!727969))

(declare-fun m!727975 () Bool)

(assert (=> b!786037 m!727975))

(declare-fun m!727977 () Bool)

(assert (=> b!786051 m!727977))

(declare-fun m!727979 () Bool)

(assert (=> b!786051 m!727979))

(declare-fun m!727981 () Bool)

(assert (=> b!786041 m!727981))

(declare-fun m!727983 () Bool)

(assert (=> b!786043 m!727983))

(assert (=> b!786043 m!727983))

(declare-fun m!727985 () Bool)

(assert (=> b!786043 m!727985))

(assert (=> b!786046 m!727983))

(assert (=> b!786046 m!727983))

(declare-fun m!727987 () Bool)

(assert (=> b!786046 m!727987))

(assert (=> b!786046 m!727987))

(assert (=> b!786046 m!727983))

(declare-fun m!727989 () Bool)

(assert (=> b!786046 m!727989))

(assert (=> b!786050 m!727983))

(assert (=> b!786050 m!727983))

(declare-fun m!727991 () Bool)

(assert (=> b!786050 m!727991))

(declare-fun m!727993 () Bool)

(assert (=> b!786039 m!727993))

(assert (=> b!786035 m!727983))

(assert (=> b!786035 m!727983))

(declare-fun m!727995 () Bool)

(assert (=> b!786035 m!727995))

(assert (=> b!786053 m!727983))

(assert (=> b!786053 m!727983))

(declare-fun m!727997 () Bool)

(assert (=> b!786053 m!727997))

(declare-fun m!727999 () Bool)

(assert (=> b!786055 m!727999))

(assert (=> b!786048 m!727983))

(assert (=> b!786048 m!727983))

(declare-fun m!728001 () Bool)

(assert (=> b!786048 m!728001))

(declare-fun m!728003 () Bool)

(assert (=> b!786048 m!728003))

(declare-fun m!728005 () Bool)

(assert (=> b!786048 m!728005))

(assert (=> b!786056 m!727983))

(assert (=> b!786056 m!727983))

(assert (=> b!786056 m!727985))

(declare-fun m!728007 () Bool)

(assert (=> b!786047 m!728007))

(declare-fun m!728009 () Bool)

(assert (=> start!67734 m!728009))

(declare-fun m!728011 () Bool)

(assert (=> start!67734 m!728011))

(push 1)

