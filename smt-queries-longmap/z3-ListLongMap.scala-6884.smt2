; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86550 () Bool)

(assert start!86550)

(declare-fun b!1003123 () Bool)

(declare-fun res!672729 () Bool)

(declare-fun e!564997 () Bool)

(assert (=> b!1003123 (=> (not res!672729) (not e!564997))))

(declare-datatypes ((array!63298 0))(
  ( (array!63299 (arr!30474 (Array (_ BitVec 32) (_ BitVec 64))) (size!30978 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63298)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63298 (_ BitVec 32)) Bool)

(assert (=> b!1003123 (= res!672729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003124 () Bool)

(declare-fun e!564996 () Bool)

(assert (=> b!1003124 (= e!564996 e!564997)))

(declare-fun res!672740 () Bool)

(assert (=> b!1003124 (=> (not res!672740) (not e!564997))))

(declare-datatypes ((SeekEntryResult!9431 0))(
  ( (MissingZero!9431 (index!40095 (_ BitVec 32))) (Found!9431 (index!40096 (_ BitVec 32))) (Intermediate!9431 (undefined!10243 Bool) (index!40097 (_ BitVec 32)) (x!87518 (_ BitVec 32))) (Undefined!9431) (MissingVacant!9431 (index!40098 (_ BitVec 32))) )
))
(declare-fun lt!443397 () SeekEntryResult!9431)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003124 (= res!672740 (or (= lt!443397 (MissingVacant!9431 i!1194)) (= lt!443397 (MissingZero!9431 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63298 (_ BitVec 32)) SeekEntryResult!9431)

(assert (=> b!1003124 (= lt!443397 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!672725 () Bool)

(assert (=> start!86550 (=> (not res!672725) (not e!564996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86550 (= res!672725 (validMask!0 mask!3464))))

(assert (=> start!86550 e!564996))

(declare-fun array_inv!23617 (array!63298) Bool)

(assert (=> start!86550 (array_inv!23617 a!3219)))

(assert (=> start!86550 true))

(declare-fun b!1003125 () Bool)

(declare-fun res!672734 () Bool)

(assert (=> b!1003125 (=> (not res!672734) (not e!564996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003125 (= res!672734 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003126 () Bool)

(declare-fun e!565000 () Bool)

(assert (=> b!1003126 (= e!565000 false)))

(declare-fun lt!443396 () (_ BitVec 64))

(declare-fun lt!443400 () array!63298)

(declare-fun lt!443399 () SeekEntryResult!9431)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443398 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63298 (_ BitVec 32)) SeekEntryResult!9431)

(assert (=> b!1003126 (= lt!443399 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443398 lt!443396 lt!443400 mask!3464))))

(declare-fun b!1003127 () Bool)

(declare-fun res!672738 () Bool)

(declare-fun e!564995 () Bool)

(assert (=> b!1003127 (=> (not res!672738) (not e!564995))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003127 (= res!672738 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003128 () Bool)

(declare-fun res!672731 () Bool)

(assert (=> b!1003128 (=> (not res!672731) (not e!564996))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1003128 (= res!672731 (and (= (size!30978 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30978 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30978 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003129 () Bool)

(declare-fun res!672728 () Bool)

(assert (=> b!1003129 (=> (not res!672728) (not e!564997))))

(declare-datatypes ((List!21216 0))(
  ( (Nil!21213) (Cons!21212 (h!22389 (_ BitVec 64)) (t!30208 List!21216)) )
))
(declare-fun arrayNoDuplicates!0 (array!63298 (_ BitVec 32) List!21216) Bool)

(assert (=> b!1003129 (= res!672728 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21213))))

(declare-fun b!1003130 () Bool)

(declare-fun res!672737 () Bool)

(assert (=> b!1003130 (=> (not res!672737) (not e!565000))))

(declare-fun lt!443394 () SeekEntryResult!9431)

(assert (=> b!1003130 (= res!672737 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443398 (select (arr!30474 a!3219) j!170) a!3219 mask!3464) lt!443394))))

(declare-fun b!1003131 () Bool)

(declare-fun res!672736 () Bool)

(assert (=> b!1003131 (=> (not res!672736) (not e!564995))))

(declare-fun lt!443395 () SeekEntryResult!9431)

(assert (=> b!1003131 (= res!672736 (not (= lt!443395 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443396 lt!443400 mask!3464))))))

(declare-fun b!1003132 () Bool)

(declare-fun e!564999 () Bool)

(declare-fun e!565001 () Bool)

(assert (=> b!1003132 (= e!564999 e!565001)))

(declare-fun res!672727 () Bool)

(assert (=> b!1003132 (=> (not res!672727) (not e!565001))))

(assert (=> b!1003132 (= res!672727 (= lt!443395 lt!443394))))

(assert (=> b!1003132 (= lt!443395 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30474 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003133 () Bool)

(declare-fun res!672726 () Bool)

(assert (=> b!1003133 (=> (not res!672726) (not e!564996))))

(declare-fun arrayContainsKey!0 (array!63298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003133 (= res!672726 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003134 () Bool)

(assert (=> b!1003134 (= e!564995 e!565000)))

(declare-fun res!672733 () Bool)

(assert (=> b!1003134 (=> (not res!672733) (not e!565000))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003134 (= res!672733 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443398 #b00000000000000000000000000000000) (bvslt lt!443398 (size!30978 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003134 (= lt!443398 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003135 () Bool)

(assert (=> b!1003135 (= e!564997 e!564999)))

(declare-fun res!672730 () Bool)

(assert (=> b!1003135 (=> (not res!672730) (not e!564999))))

(declare-fun lt!443401 () SeekEntryResult!9431)

(assert (=> b!1003135 (= res!672730 (= lt!443401 lt!443394))))

(assert (=> b!1003135 (= lt!443394 (Intermediate!9431 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003135 (= lt!443401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30474 a!3219) j!170) mask!3464) (select (arr!30474 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003136 () Bool)

(declare-fun res!672732 () Bool)

(assert (=> b!1003136 (=> (not res!672732) (not e!564996))))

(assert (=> b!1003136 (= res!672732 (validKeyInArray!0 (select (arr!30474 a!3219) j!170)))))

(declare-fun b!1003137 () Bool)

(assert (=> b!1003137 (= e!565001 e!564995)))

(declare-fun res!672739 () Bool)

(assert (=> b!1003137 (=> (not res!672739) (not e!564995))))

(assert (=> b!1003137 (= res!672739 (not (= lt!443401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443396 mask!3464) lt!443396 lt!443400 mask!3464))))))

(assert (=> b!1003137 (= lt!443396 (select (store (arr!30474 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003137 (= lt!443400 (array!63299 (store (arr!30474 a!3219) i!1194 k0!2224) (size!30978 a!3219)))))

(declare-fun b!1003138 () Bool)

(declare-fun res!672735 () Bool)

(assert (=> b!1003138 (=> (not res!672735) (not e!564997))))

(assert (=> b!1003138 (= res!672735 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30978 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30978 a!3219))))))

(assert (= (and start!86550 res!672725) b!1003128))

(assert (= (and b!1003128 res!672731) b!1003136))

(assert (= (and b!1003136 res!672732) b!1003125))

(assert (= (and b!1003125 res!672734) b!1003133))

(assert (= (and b!1003133 res!672726) b!1003124))

(assert (= (and b!1003124 res!672740) b!1003123))

(assert (= (and b!1003123 res!672729) b!1003129))

(assert (= (and b!1003129 res!672728) b!1003138))

(assert (= (and b!1003138 res!672735) b!1003135))

(assert (= (and b!1003135 res!672730) b!1003132))

(assert (= (and b!1003132 res!672727) b!1003137))

(assert (= (and b!1003137 res!672739) b!1003131))

(assert (= (and b!1003131 res!672736) b!1003127))

(assert (= (and b!1003127 res!672738) b!1003134))

(assert (= (and b!1003134 res!672733) b!1003130))

(assert (= (and b!1003130 res!672737) b!1003126))

(declare-fun m!928339 () Bool)

(assert (=> b!1003134 m!928339))

(declare-fun m!928341 () Bool)

(assert (=> b!1003132 m!928341))

(assert (=> b!1003132 m!928341))

(declare-fun m!928343 () Bool)

(assert (=> b!1003132 m!928343))

(declare-fun m!928345 () Bool)

(assert (=> b!1003123 m!928345))

(declare-fun m!928347 () Bool)

(assert (=> b!1003126 m!928347))

(declare-fun m!928349 () Bool)

(assert (=> b!1003131 m!928349))

(assert (=> b!1003136 m!928341))

(assert (=> b!1003136 m!928341))

(declare-fun m!928351 () Bool)

(assert (=> b!1003136 m!928351))

(declare-fun m!928353 () Bool)

(assert (=> start!86550 m!928353))

(declare-fun m!928355 () Bool)

(assert (=> start!86550 m!928355))

(declare-fun m!928357 () Bool)

(assert (=> b!1003129 m!928357))

(declare-fun m!928359 () Bool)

(assert (=> b!1003124 m!928359))

(declare-fun m!928361 () Bool)

(assert (=> b!1003137 m!928361))

(assert (=> b!1003137 m!928361))

(declare-fun m!928363 () Bool)

(assert (=> b!1003137 m!928363))

(declare-fun m!928365 () Bool)

(assert (=> b!1003137 m!928365))

(declare-fun m!928367 () Bool)

(assert (=> b!1003137 m!928367))

(assert (=> b!1003135 m!928341))

(assert (=> b!1003135 m!928341))

(declare-fun m!928369 () Bool)

(assert (=> b!1003135 m!928369))

(assert (=> b!1003135 m!928369))

(assert (=> b!1003135 m!928341))

(declare-fun m!928371 () Bool)

(assert (=> b!1003135 m!928371))

(declare-fun m!928373 () Bool)

(assert (=> b!1003133 m!928373))

(declare-fun m!928375 () Bool)

(assert (=> b!1003125 m!928375))

(assert (=> b!1003130 m!928341))

(assert (=> b!1003130 m!928341))

(declare-fun m!928377 () Bool)

(assert (=> b!1003130 m!928377))

(check-sat (not start!86550) (not b!1003125) (not b!1003135) (not b!1003134) (not b!1003136) (not b!1003137) (not b!1003126) (not b!1003129) (not b!1003132) (not b!1003123) (not b!1003130) (not b!1003124) (not b!1003133) (not b!1003131))
(check-sat)
