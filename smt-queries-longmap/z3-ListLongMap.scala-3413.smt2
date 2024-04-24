; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47390 () Bool)

(assert start!47390)

(declare-fun b!521307 () Bool)

(declare-fun res!319173 () Bool)

(declare-fun e!304142 () Bool)

(assert (=> b!521307 (=> (not res!319173) (not e!304142))))

(declare-datatypes ((array!33217 0))(
  ( (array!33218 (arr!15964 (Array (_ BitVec 32) (_ BitVec 64))) (size!16328 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33217)

(declare-datatypes ((List!10029 0))(
  ( (Nil!10026) (Cons!10025 (h!10947 (_ BitVec 64)) (t!16249 List!10029)) )
))
(declare-fun arrayNoDuplicates!0 (array!33217 (_ BitVec 32) List!10029) Bool)

(assert (=> b!521307 (= res!319173 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10026))))

(declare-fun b!521308 () Bool)

(declare-datatypes ((Unit!16159 0))(
  ( (Unit!16160) )
))
(declare-fun e!304143 () Unit!16159)

(declare-fun Unit!16161 () Unit!16159)

(assert (=> b!521308 (= e!304143 Unit!16161)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!238928 () Unit!16159)

(declare-fun lt!238931 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4387 0))(
  ( (MissingZero!4387 (index!19751 (_ BitVec 32))) (Found!4387 (index!19752 (_ BitVec 32))) (Intermediate!4387 (undefined!5199 Bool) (index!19753 (_ BitVec 32)) (x!48882 (_ BitVec 32))) (Undefined!4387) (MissingVacant!4387 (index!19754 (_ BitVec 32))) )
))
(declare-fun lt!238926 () SeekEntryResult!4387)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16159)

(assert (=> b!521308 (= lt!238928 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238931 #b00000000000000000000000000000000 (index!19753 lt!238926) (x!48882 lt!238926) mask!3524))))

(declare-fun res!319180 () Bool)

(declare-fun lt!238930 () array!33217)

(declare-fun lt!238927 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33217 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!521308 (= res!319180 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238931 lt!238927 lt!238930 mask!3524) (Intermediate!4387 false (index!19753 lt!238926) (x!48882 lt!238926))))))

(declare-fun e!304146 () Bool)

(assert (=> b!521308 (=> (not res!319180) (not e!304146))))

(assert (=> b!521308 e!304146))

(declare-fun b!521309 () Bool)

(declare-fun res!319169 () Bool)

(declare-fun e!304140 () Bool)

(assert (=> b!521309 (=> (not res!319169) (not e!304140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521309 (= res!319169 (validKeyInArray!0 k0!2280))))

(declare-fun b!521310 () Bool)

(declare-fun res!319174 () Bool)

(assert (=> b!521310 (=> (not res!319174) (not e!304140))))

(assert (=> b!521310 (= res!319174 (validKeyInArray!0 (select (arr!15964 a!3235) j!176)))))

(declare-fun b!521312 () Bool)

(declare-fun res!319178 () Bool)

(assert (=> b!521312 (=> (not res!319178) (not e!304140))))

(declare-fun arrayContainsKey!0 (array!33217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521312 (= res!319178 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521313 () Bool)

(assert (=> b!521313 (= e!304146 false)))

(declare-fun b!521314 () Bool)

(declare-fun res!319172 () Bool)

(declare-fun e!304145 () Bool)

(assert (=> b!521314 (=> res!319172 e!304145)))

(get-info :version)

(assert (=> b!521314 (= res!319172 (or (undefined!5199 lt!238926) (not ((_ is Intermediate!4387) lt!238926))))))

(declare-fun b!521315 () Bool)

(assert (=> b!521315 (= e!304140 e!304142)))

(declare-fun res!319179 () Bool)

(assert (=> b!521315 (=> (not res!319179) (not e!304142))))

(declare-fun lt!238933 () SeekEntryResult!4387)

(assert (=> b!521315 (= res!319179 (or (= lt!238933 (MissingZero!4387 i!1204)) (= lt!238933 (MissingVacant!4387 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33217 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!521315 (= lt!238933 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521316 () Bool)

(declare-fun res!319171 () Bool)

(assert (=> b!521316 (=> (not res!319171) (not e!304142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33217 (_ BitVec 32)) Bool)

(assert (=> b!521316 (= res!319171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!304144 () Bool)

(declare-fun b!521317 () Bool)

(assert (=> b!521317 (= e!304144 (= (seekEntryOrOpen!0 (select (arr!15964 a!3235) j!176) a!3235 mask!3524) (Found!4387 j!176)))))

(declare-fun res!319175 () Bool)

(assert (=> start!47390 (=> (not res!319175) (not e!304140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47390 (= res!319175 (validMask!0 mask!3524))))

(assert (=> start!47390 e!304140))

(assert (=> start!47390 true))

(declare-fun array_inv!11823 (array!33217) Bool)

(assert (=> start!47390 (array_inv!11823 a!3235)))

(declare-fun b!521311 () Bool)

(declare-fun res!319170 () Bool)

(assert (=> b!521311 (=> (not res!319170) (not e!304140))))

(assert (=> b!521311 (= res!319170 (and (= (size!16328 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16328 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16328 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521318 () Bool)

(declare-fun Unit!16162 () Unit!16159)

(assert (=> b!521318 (= e!304143 Unit!16162)))

(declare-fun b!521319 () Bool)

(assert (=> b!521319 (= e!304145 true)))

(assert (=> b!521319 (and (or (= (select (arr!15964 a!3235) (index!19753 lt!238926)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15964 a!3235) (index!19753 lt!238926)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15964 a!3235) (index!19753 lt!238926)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15964 a!3235) (index!19753 lt!238926)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238929 () Unit!16159)

(assert (=> b!521319 (= lt!238929 e!304143)))

(declare-fun c!61370 () Bool)

(assert (=> b!521319 (= c!61370 (= (select (arr!15964 a!3235) (index!19753 lt!238926)) (select (arr!15964 a!3235) j!176)))))

(assert (=> b!521319 (and (bvslt (x!48882 lt!238926) #b01111111111111111111111111111110) (or (= (select (arr!15964 a!3235) (index!19753 lt!238926)) (select (arr!15964 a!3235) j!176)) (= (select (arr!15964 a!3235) (index!19753 lt!238926)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15964 a!3235) (index!19753 lt!238926)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521320 () Bool)

(assert (=> b!521320 (= e!304142 (not e!304145))))

(declare-fun res!319177 () Bool)

(assert (=> b!521320 (=> res!319177 e!304145)))

(declare-fun lt!238932 () (_ BitVec 32))

(assert (=> b!521320 (= res!319177 (= lt!238926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238932 lt!238927 lt!238930 mask!3524)))))

(assert (=> b!521320 (= lt!238926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238931 (select (arr!15964 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521320 (= lt!238932 (toIndex!0 lt!238927 mask!3524))))

(assert (=> b!521320 (= lt!238927 (select (store (arr!15964 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521320 (= lt!238931 (toIndex!0 (select (arr!15964 a!3235) j!176) mask!3524))))

(assert (=> b!521320 (= lt!238930 (array!33218 (store (arr!15964 a!3235) i!1204 k0!2280) (size!16328 a!3235)))))

(assert (=> b!521320 e!304144))

(declare-fun res!319176 () Bool)

(assert (=> b!521320 (=> (not res!319176) (not e!304144))))

(assert (=> b!521320 (= res!319176 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238925 () Unit!16159)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16159)

(assert (=> b!521320 (= lt!238925 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47390 res!319175) b!521311))

(assert (= (and b!521311 res!319170) b!521310))

(assert (= (and b!521310 res!319174) b!521309))

(assert (= (and b!521309 res!319169) b!521312))

(assert (= (and b!521312 res!319178) b!521315))

(assert (= (and b!521315 res!319179) b!521316))

(assert (= (and b!521316 res!319171) b!521307))

(assert (= (and b!521307 res!319173) b!521320))

(assert (= (and b!521320 res!319176) b!521317))

(assert (= (and b!521320 (not res!319177)) b!521314))

(assert (= (and b!521314 (not res!319172)) b!521319))

(assert (= (and b!521319 c!61370) b!521308))

(assert (= (and b!521319 (not c!61370)) b!521318))

(assert (= (and b!521308 res!319180) b!521313))

(declare-fun m!502465 () Bool)

(assert (=> b!521308 m!502465))

(declare-fun m!502467 () Bool)

(assert (=> b!521308 m!502467))

(declare-fun m!502469 () Bool)

(assert (=> b!521309 m!502469))

(declare-fun m!502471 () Bool)

(assert (=> b!521312 m!502471))

(declare-fun m!502473 () Bool)

(assert (=> b!521320 m!502473))

(declare-fun m!502475 () Bool)

(assert (=> b!521320 m!502475))

(declare-fun m!502477 () Bool)

(assert (=> b!521320 m!502477))

(declare-fun m!502479 () Bool)

(assert (=> b!521320 m!502479))

(assert (=> b!521320 m!502477))

(declare-fun m!502481 () Bool)

(assert (=> b!521320 m!502481))

(assert (=> b!521320 m!502477))

(declare-fun m!502483 () Bool)

(assert (=> b!521320 m!502483))

(declare-fun m!502485 () Bool)

(assert (=> b!521320 m!502485))

(declare-fun m!502487 () Bool)

(assert (=> b!521320 m!502487))

(declare-fun m!502489 () Bool)

(assert (=> b!521320 m!502489))

(declare-fun m!502491 () Bool)

(assert (=> start!47390 m!502491))

(declare-fun m!502493 () Bool)

(assert (=> start!47390 m!502493))

(declare-fun m!502495 () Bool)

(assert (=> b!521316 m!502495))

(assert (=> b!521317 m!502477))

(assert (=> b!521317 m!502477))

(declare-fun m!502497 () Bool)

(assert (=> b!521317 m!502497))

(assert (=> b!521310 m!502477))

(assert (=> b!521310 m!502477))

(declare-fun m!502499 () Bool)

(assert (=> b!521310 m!502499))

(declare-fun m!502501 () Bool)

(assert (=> b!521315 m!502501))

(declare-fun m!502503 () Bool)

(assert (=> b!521307 m!502503))

(declare-fun m!502505 () Bool)

(assert (=> b!521319 m!502505))

(assert (=> b!521319 m!502477))

(check-sat (not b!521315) (not b!521316) (not b!521312) (not b!521308) (not b!521310) (not b!521309) (not b!521320) (not b!521317) (not b!521307) (not start!47390))
(check-sat)
