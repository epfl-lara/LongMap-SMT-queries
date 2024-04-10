; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67878 () Bool)

(assert start!67878)

(declare-datatypes ((array!42855 0))(
  ( (array!42856 (arr!20514 (Array (_ BitVec 32) (_ BitVec 64))) (size!20935 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42855)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!789179 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8114 0))(
  ( (MissingZero!8114 (index!34824 (_ BitVec 32))) (Found!8114 (index!34825 (_ BitVec 32))) (Intermediate!8114 (undefined!8926 Bool) (index!34826 (_ BitVec 32)) (x!65767 (_ BitVec 32))) (Undefined!8114) (MissingVacant!8114 (index!34827 (_ BitVec 32))) )
))
(declare-fun lt!352101 () SeekEntryResult!8114)

(declare-fun e!438642 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42855 (_ BitVec 32)) SeekEntryResult!8114)

(assert (=> b!789179 (= e!438642 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20514 a!3186) j!159) a!3186 mask!3328) lt!352101))))

(declare-fun b!789180 () Bool)

(declare-fun res!534515 () Bool)

(declare-fun e!438639 () Bool)

(assert (=> b!789180 (=> (not res!534515) (not e!438639))))

(declare-fun lt!352108 () (_ BitVec 64))

(declare-fun lt!352102 () array!42855)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42855 (_ BitVec 32)) SeekEntryResult!8114)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42855 (_ BitVec 32)) SeekEntryResult!8114)

(assert (=> b!789180 (= res!534515 (= (seekEntryOrOpen!0 lt!352108 lt!352102 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352108 lt!352102 mask!3328)))))

(declare-fun b!789181 () Bool)

(declare-fun e!438645 () Bool)

(declare-fun e!438643 () Bool)

(assert (=> b!789181 (= e!438645 e!438643)))

(declare-fun res!534518 () Bool)

(assert (=> b!789181 (=> res!534518 e!438643)))

(declare-fun lt!352104 () (_ BitVec 64))

(assert (=> b!789181 (= res!534518 (= lt!352104 lt!352108))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789181 (= lt!352104 (select (store (arr!20514 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789182 () Bool)

(declare-fun e!438641 () Bool)

(declare-fun e!438644 () Bool)

(assert (=> b!789182 (= e!438641 e!438644)))

(declare-fun res!534503 () Bool)

(assert (=> b!789182 (=> (not res!534503) (not e!438644))))

(declare-fun lt!352110 () SeekEntryResult!8114)

(assert (=> b!789182 (= res!534503 (or (= lt!352110 (MissingZero!8114 i!1173)) (= lt!352110 (MissingVacant!8114 i!1173))))))

(assert (=> b!789182 (= lt!352110 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!789183 () Bool)

(declare-fun res!534520 () Bool)

(assert (=> b!789183 (=> (not res!534520) (not e!438644))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789183 (= res!534520 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20935 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20935 a!3186))))))

(declare-fun b!789184 () Bool)

(declare-fun res!534513 () Bool)

(assert (=> b!789184 (=> (not res!534513) (not e!438641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789184 (= res!534513 (validKeyInArray!0 k!2102))))

(declare-fun b!789185 () Bool)

(declare-datatypes ((Unit!27344 0))(
  ( (Unit!27345) )
))
(declare-fun e!438649 () Unit!27344)

(declare-fun Unit!27346 () Unit!27344)

(assert (=> b!789185 (= e!438649 Unit!27346)))

(declare-fun b!789186 () Bool)

(declare-fun e!438650 () Bool)

(declare-fun e!438648 () Bool)

(assert (=> b!789186 (= e!438650 e!438648)))

(declare-fun res!534508 () Bool)

(assert (=> b!789186 (=> (not res!534508) (not e!438648))))

(declare-fun lt!352111 () SeekEntryResult!8114)

(declare-fun lt!352106 () SeekEntryResult!8114)

(assert (=> b!789186 (= res!534508 (= lt!352111 lt!352106))))

(assert (=> b!789186 (= lt!352106 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352108 lt!352102 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789186 (= lt!352111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352108 mask!3328) lt!352108 lt!352102 mask!3328))))

(assert (=> b!789186 (= lt!352108 (select (store (arr!20514 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789186 (= lt!352102 (array!42856 (store (arr!20514 a!3186) i!1173 k!2102) (size!20935 a!3186)))))

(declare-fun b!789187 () Bool)

(declare-fun Unit!27347 () Unit!27344)

(assert (=> b!789187 (= e!438649 Unit!27347)))

(assert (=> b!789187 false))

(declare-fun b!789189 () Bool)

(declare-fun res!534521 () Bool)

(assert (=> b!789189 (=> (not res!534521) (not e!438641))))

(declare-fun arrayContainsKey!0 (array!42855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789189 (= res!534521 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789190 () Bool)

(assert (=> b!789190 (= e!438643 true)))

(assert (=> b!789190 e!438639))

(declare-fun res!534514 () Bool)

(assert (=> b!789190 (=> (not res!534514) (not e!438639))))

(assert (=> b!789190 (= res!534514 (= lt!352104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352103 () Unit!27344)

(assert (=> b!789190 (= lt!352103 e!438649)))

(declare-fun c!87748 () Bool)

(assert (=> b!789190 (= c!87748 (= lt!352104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789191 () Bool)

(declare-fun e!438647 () Bool)

(assert (=> b!789191 (= e!438647 e!438645)))

(declare-fun res!534506 () Bool)

(assert (=> b!789191 (=> res!534506 e!438645)))

(declare-fun lt!352112 () SeekEntryResult!8114)

(declare-fun lt!352109 () SeekEntryResult!8114)

(assert (=> b!789191 (= res!534506 (not (= lt!352112 lt!352109)))))

(assert (=> b!789191 (= lt!352112 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20514 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789192 () Bool)

(declare-fun res!534512 () Bool)

(assert (=> b!789192 (=> (not res!534512) (not e!438650))))

(assert (=> b!789192 (= res!534512 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20514 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789193 () Bool)

(declare-fun res!534511 () Bool)

(assert (=> b!789193 (=> (not res!534511) (not e!438641))))

(assert (=> b!789193 (= res!534511 (validKeyInArray!0 (select (arr!20514 a!3186) j!159)))))

(declare-fun b!789194 () Bool)

(assert (=> b!789194 (= e!438648 (not e!438647))))

(declare-fun res!534516 () Bool)

(assert (=> b!789194 (=> res!534516 e!438647)))

(assert (=> b!789194 (= res!534516 (or (not (is-Intermediate!8114 lt!352106)) (bvslt x!1131 (x!65767 lt!352106)) (not (= x!1131 (x!65767 lt!352106))) (not (= index!1321 (index!34826 lt!352106)))))))

(declare-fun e!438646 () Bool)

(assert (=> b!789194 e!438646))

(declare-fun res!534509 () Bool)

(assert (=> b!789194 (=> (not res!534509) (not e!438646))))

(declare-fun lt!352105 () SeekEntryResult!8114)

(assert (=> b!789194 (= res!534509 (= lt!352105 lt!352109))))

(assert (=> b!789194 (= lt!352109 (Found!8114 j!159))))

(assert (=> b!789194 (= lt!352105 (seekEntryOrOpen!0 (select (arr!20514 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42855 (_ BitVec 32)) Bool)

(assert (=> b!789194 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352107 () Unit!27344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27344)

(assert (=> b!789194 (= lt!352107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789195 () Bool)

(declare-fun res!534517 () Bool)

(assert (=> b!789195 (=> (not res!534517) (not e!438641))))

(assert (=> b!789195 (= res!534517 (and (= (size!20935 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20935 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20935 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789196 () Bool)

(declare-fun res!534504 () Bool)

(assert (=> b!789196 (=> (not res!534504) (not e!438644))))

(assert (=> b!789196 (= res!534504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789197 () Bool)

(assert (=> b!789197 (= e!438639 (= lt!352105 lt!352112))))

(declare-fun res!534507 () Bool)

(assert (=> start!67878 (=> (not res!534507) (not e!438641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67878 (= res!534507 (validMask!0 mask!3328))))

(assert (=> start!67878 e!438641))

(assert (=> start!67878 true))

(declare-fun array_inv!16310 (array!42855) Bool)

(assert (=> start!67878 (array_inv!16310 a!3186)))

(declare-fun b!789188 () Bool)

(declare-fun res!534510 () Bool)

(assert (=> b!789188 (=> (not res!534510) (not e!438650))))

(assert (=> b!789188 (= res!534510 e!438642)))

(declare-fun c!87747 () Bool)

(assert (=> b!789188 (= c!87747 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789198 () Bool)

(declare-fun res!534519 () Bool)

(assert (=> b!789198 (=> (not res!534519) (not e!438644))))

(declare-datatypes ((List!14516 0))(
  ( (Nil!14513) (Cons!14512 (h!15638 (_ BitVec 64)) (t!20831 List!14516)) )
))
(declare-fun arrayNoDuplicates!0 (array!42855 (_ BitVec 32) List!14516) Bool)

(assert (=> b!789198 (= res!534519 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14513))))

(declare-fun b!789199 () Bool)

(assert (=> b!789199 (= e!438646 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20514 a!3186) j!159) a!3186 mask!3328) lt!352109))))

(declare-fun b!789200 () Bool)

(assert (=> b!789200 (= e!438642 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20514 a!3186) j!159) a!3186 mask!3328) (Found!8114 j!159)))))

(declare-fun b!789201 () Bool)

(assert (=> b!789201 (= e!438644 e!438650)))

(declare-fun res!534505 () Bool)

(assert (=> b!789201 (=> (not res!534505) (not e!438650))))

(assert (=> b!789201 (= res!534505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20514 a!3186) j!159) mask!3328) (select (arr!20514 a!3186) j!159) a!3186 mask!3328) lt!352101))))

(assert (=> b!789201 (= lt!352101 (Intermediate!8114 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67878 res!534507) b!789195))

(assert (= (and b!789195 res!534517) b!789193))

(assert (= (and b!789193 res!534511) b!789184))

(assert (= (and b!789184 res!534513) b!789189))

(assert (= (and b!789189 res!534521) b!789182))

(assert (= (and b!789182 res!534503) b!789196))

(assert (= (and b!789196 res!534504) b!789198))

(assert (= (and b!789198 res!534519) b!789183))

(assert (= (and b!789183 res!534520) b!789201))

(assert (= (and b!789201 res!534505) b!789192))

(assert (= (and b!789192 res!534512) b!789188))

(assert (= (and b!789188 c!87747) b!789179))

(assert (= (and b!789188 (not c!87747)) b!789200))

(assert (= (and b!789188 res!534510) b!789186))

(assert (= (and b!789186 res!534508) b!789194))

(assert (= (and b!789194 res!534509) b!789199))

(assert (= (and b!789194 (not res!534516)) b!789191))

(assert (= (and b!789191 (not res!534506)) b!789181))

(assert (= (and b!789181 (not res!534518)) b!789190))

(assert (= (and b!789190 c!87748) b!789187))

(assert (= (and b!789190 (not c!87748)) b!789185))

(assert (= (and b!789190 res!534514) b!789180))

(assert (= (and b!789180 res!534515) b!789197))

(declare-fun m!730325 () Bool)

(assert (=> b!789196 m!730325))

(declare-fun m!730327 () Bool)

(assert (=> b!789184 m!730327))

(declare-fun m!730329 () Bool)

(assert (=> b!789181 m!730329))

(declare-fun m!730331 () Bool)

(assert (=> b!789181 m!730331))

(declare-fun m!730333 () Bool)

(assert (=> b!789180 m!730333))

(declare-fun m!730335 () Bool)

(assert (=> b!789180 m!730335))

(declare-fun m!730337 () Bool)

(assert (=> b!789179 m!730337))

(assert (=> b!789179 m!730337))

(declare-fun m!730339 () Bool)

(assert (=> b!789179 m!730339))

(declare-fun m!730341 () Bool)

(assert (=> start!67878 m!730341))

(declare-fun m!730343 () Bool)

(assert (=> start!67878 m!730343))

(declare-fun m!730345 () Bool)

(assert (=> b!789192 m!730345))

(declare-fun m!730347 () Bool)

(assert (=> b!789182 m!730347))

(assert (=> b!789191 m!730337))

(assert (=> b!789191 m!730337))

(declare-fun m!730349 () Bool)

(assert (=> b!789191 m!730349))

(assert (=> b!789199 m!730337))

(assert (=> b!789199 m!730337))

(declare-fun m!730351 () Bool)

(assert (=> b!789199 m!730351))

(declare-fun m!730353 () Bool)

(assert (=> b!789198 m!730353))

(declare-fun m!730355 () Bool)

(assert (=> b!789186 m!730355))

(assert (=> b!789186 m!730329))

(declare-fun m!730357 () Bool)

(assert (=> b!789186 m!730357))

(declare-fun m!730359 () Bool)

(assert (=> b!789186 m!730359))

(declare-fun m!730361 () Bool)

(assert (=> b!789186 m!730361))

(assert (=> b!789186 m!730359))

(declare-fun m!730363 () Bool)

(assert (=> b!789189 m!730363))

(assert (=> b!789201 m!730337))

(assert (=> b!789201 m!730337))

(declare-fun m!730365 () Bool)

(assert (=> b!789201 m!730365))

(assert (=> b!789201 m!730365))

(assert (=> b!789201 m!730337))

(declare-fun m!730367 () Bool)

(assert (=> b!789201 m!730367))

(assert (=> b!789194 m!730337))

(assert (=> b!789194 m!730337))

(declare-fun m!730369 () Bool)

(assert (=> b!789194 m!730369))

(declare-fun m!730371 () Bool)

(assert (=> b!789194 m!730371))

(declare-fun m!730373 () Bool)

(assert (=> b!789194 m!730373))

(assert (=> b!789200 m!730337))

(assert (=> b!789200 m!730337))

(assert (=> b!789200 m!730349))

(assert (=> b!789193 m!730337))

(assert (=> b!789193 m!730337))

(declare-fun m!730375 () Bool)

(assert (=> b!789193 m!730375))

(push 1)

