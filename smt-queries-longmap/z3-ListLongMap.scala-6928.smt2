; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87120 () Bool)

(assert start!87120)

(declare-fun b!1010116 () Bool)

(declare-fun e!568269 () Bool)

(declare-fun e!568271 () Bool)

(assert (=> b!1010116 (= e!568269 e!568271)))

(declare-fun res!678577 () Bool)

(assert (=> b!1010116 (=> (not res!678577) (not e!568271))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!446314 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9563 0))(
  ( (MissingZero!9563 (index!40623 (_ BitVec 32))) (Found!9563 (index!40624 (_ BitVec 32))) (Intermediate!9563 (undefined!10375 Bool) (index!40625 (_ BitVec 32)) (x!88044 (_ BitVec 32))) (Undefined!9563) (MissingVacant!9563 (index!40626 (_ BitVec 32))) )
))
(declare-fun lt!446310 () SeekEntryResult!9563)

(declare-datatypes ((array!63577 0))(
  ( (array!63578 (arr!30606 (Array (_ BitVec 32) (_ BitVec 64))) (size!31110 (_ BitVec 32))) )
))
(declare-fun lt!446308 () array!63577)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63577 (_ BitVec 32)) SeekEntryResult!9563)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010116 (= res!678577 (not (= lt!446310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446314 mask!3464) lt!446314 lt!446308 mask!3464))))))

(declare-fun a!3219 () array!63577)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1010116 (= lt!446314 (select (store (arr!30606 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010116 (= lt!446308 (array!63578 (store (arr!30606 a!3219) i!1194 k0!2224) (size!31110 a!3219)))))

(declare-fun b!1010117 () Bool)

(declare-fun e!568272 () Bool)

(assert (=> b!1010117 (= e!568272 e!568269)))

(declare-fun res!678578 () Bool)

(assert (=> b!1010117 (=> (not res!678578) (not e!568269))))

(declare-fun lt!446311 () SeekEntryResult!9563)

(declare-fun lt!446313 () SeekEntryResult!9563)

(assert (=> b!1010117 (= res!678578 (= lt!446311 lt!446313))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1010117 (= lt!446311 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30606 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010118 () Bool)

(declare-fun e!568274 () Bool)

(assert (=> b!1010118 (= e!568274 e!568272)))

(declare-fun res!678584 () Bool)

(assert (=> b!1010118 (=> (not res!678584) (not e!568272))))

(assert (=> b!1010118 (= res!678584 (= lt!446310 lt!446313))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010118 (= lt!446313 (Intermediate!9563 false resIndex!38 resX!38))))

(assert (=> b!1010118 (= lt!446310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30606 a!3219) j!170) mask!3464) (select (arr!30606 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010115 () Bool)

(declare-fun res!678581 () Bool)

(declare-fun e!568270 () Bool)

(assert (=> b!1010115 (=> (not res!678581) (not e!568270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010115 (= res!678581 (validKeyInArray!0 k0!2224))))

(declare-fun res!678588 () Bool)

(assert (=> start!87120 (=> (not res!678588) (not e!568270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87120 (= res!678588 (validMask!0 mask!3464))))

(assert (=> start!87120 e!568270))

(declare-fun array_inv!23749 (array!63577) Bool)

(assert (=> start!87120 (array_inv!23749 a!3219)))

(assert (=> start!87120 true))

(declare-fun b!1010119 () Bool)

(declare-fun res!678589 () Bool)

(assert (=> b!1010119 (=> (not res!678589) (not e!568270))))

(assert (=> b!1010119 (= res!678589 (validKeyInArray!0 (select (arr!30606 a!3219) j!170)))))

(declare-fun b!1010120 () Bool)

(declare-fun res!678580 () Bool)

(assert (=> b!1010120 (=> (not res!678580) (not e!568274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63577 (_ BitVec 32)) Bool)

(assert (=> b!1010120 (= res!678580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010121 () Bool)

(declare-fun res!678585 () Bool)

(assert (=> b!1010121 (=> (not res!678585) (not e!568270))))

(declare-fun arrayContainsKey!0 (array!63577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010121 (= res!678585 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010122 () Bool)

(assert (=> b!1010122 (= e!568271 false)))

(declare-fun lt!446309 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010122 (= lt!446309 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010123 () Bool)

(declare-fun res!678582 () Bool)

(assert (=> b!1010123 (=> (not res!678582) (not e!568274))))

(declare-datatypes ((List!21348 0))(
  ( (Nil!21345) (Cons!21344 (h!22536 (_ BitVec 64)) (t!30340 List!21348)) )
))
(declare-fun arrayNoDuplicates!0 (array!63577 (_ BitVec 32) List!21348) Bool)

(assert (=> b!1010123 (= res!678582 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21345))))

(declare-fun b!1010124 () Bool)

(declare-fun res!678590 () Bool)

(assert (=> b!1010124 (=> (not res!678590) (not e!568271))))

(assert (=> b!1010124 (= res!678590 (not (= lt!446311 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446314 lt!446308 mask!3464))))))

(declare-fun b!1010125 () Bool)

(declare-fun res!678579 () Bool)

(assert (=> b!1010125 (=> (not res!678579) (not e!568274))))

(assert (=> b!1010125 (= res!678579 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31110 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31110 a!3219))))))

(declare-fun b!1010126 () Bool)

(assert (=> b!1010126 (= e!568270 e!568274)))

(declare-fun res!678587 () Bool)

(assert (=> b!1010126 (=> (not res!678587) (not e!568274))))

(declare-fun lt!446312 () SeekEntryResult!9563)

(assert (=> b!1010126 (= res!678587 (or (= lt!446312 (MissingVacant!9563 i!1194)) (= lt!446312 (MissingZero!9563 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63577 (_ BitVec 32)) SeekEntryResult!9563)

(assert (=> b!1010126 (= lt!446312 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010127 () Bool)

(declare-fun res!678586 () Bool)

(assert (=> b!1010127 (=> (not res!678586) (not e!568271))))

(assert (=> b!1010127 (= res!678586 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010128 () Bool)

(declare-fun res!678583 () Bool)

(assert (=> b!1010128 (=> (not res!678583) (not e!568270))))

(assert (=> b!1010128 (= res!678583 (and (= (size!31110 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31110 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31110 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!87120 res!678588) b!1010128))

(assert (= (and b!1010128 res!678583) b!1010119))

(assert (= (and b!1010119 res!678589) b!1010115))

(assert (= (and b!1010115 res!678581) b!1010121))

(assert (= (and b!1010121 res!678585) b!1010126))

(assert (= (and b!1010126 res!678587) b!1010120))

(assert (= (and b!1010120 res!678580) b!1010123))

(assert (= (and b!1010123 res!678582) b!1010125))

(assert (= (and b!1010125 res!678579) b!1010118))

(assert (= (and b!1010118 res!678584) b!1010117))

(assert (= (and b!1010117 res!678578) b!1010116))

(assert (= (and b!1010116 res!678577) b!1010124))

(assert (= (and b!1010124 res!678590) b!1010127))

(assert (= (and b!1010127 res!678586) b!1010122))

(declare-fun m!933961 () Bool)

(assert (=> b!1010124 m!933961))

(declare-fun m!933963 () Bool)

(assert (=> b!1010120 m!933963))

(declare-fun m!933965 () Bool)

(assert (=> b!1010126 m!933965))

(declare-fun m!933967 () Bool)

(assert (=> b!1010117 m!933967))

(assert (=> b!1010117 m!933967))

(declare-fun m!933969 () Bool)

(assert (=> b!1010117 m!933969))

(declare-fun m!933971 () Bool)

(assert (=> b!1010123 m!933971))

(declare-fun m!933973 () Bool)

(assert (=> start!87120 m!933973))

(declare-fun m!933975 () Bool)

(assert (=> start!87120 m!933975))

(declare-fun m!933977 () Bool)

(assert (=> b!1010115 m!933977))

(assert (=> b!1010118 m!933967))

(assert (=> b!1010118 m!933967))

(declare-fun m!933979 () Bool)

(assert (=> b!1010118 m!933979))

(assert (=> b!1010118 m!933979))

(assert (=> b!1010118 m!933967))

(declare-fun m!933981 () Bool)

(assert (=> b!1010118 m!933981))

(declare-fun m!933983 () Bool)

(assert (=> b!1010121 m!933983))

(assert (=> b!1010119 m!933967))

(assert (=> b!1010119 m!933967))

(declare-fun m!933985 () Bool)

(assert (=> b!1010119 m!933985))

(declare-fun m!933987 () Bool)

(assert (=> b!1010116 m!933987))

(assert (=> b!1010116 m!933987))

(declare-fun m!933989 () Bool)

(assert (=> b!1010116 m!933989))

(declare-fun m!933991 () Bool)

(assert (=> b!1010116 m!933991))

(declare-fun m!933993 () Bool)

(assert (=> b!1010116 m!933993))

(declare-fun m!933995 () Bool)

(assert (=> b!1010122 m!933995))

(check-sat (not b!1010119) (not b!1010116) (not b!1010124) (not b!1010123) (not b!1010126) (not b!1010118) (not b!1010121) (not b!1010115) (not b!1010117) (not b!1010122) (not b!1010120) (not start!87120))
(check-sat)
