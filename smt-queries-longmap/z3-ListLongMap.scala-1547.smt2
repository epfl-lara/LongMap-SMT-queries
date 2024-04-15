; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29294 () Bool)

(assert start!29294)

(declare-fun b!296679 () Bool)

(declare-fun e!187498 () Bool)

(declare-fun e!187499 () Bool)

(assert (=> b!296679 (= e!187498 e!187499)))

(declare-fun res!156336 () Bool)

(assert (=> b!296679 (=> (not res!156336) (not e!187499))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2261 0))(
  ( (MissingZero!2261 (index!11214 (_ BitVec 32))) (Found!2261 (index!11215 (_ BitVec 32))) (Intermediate!2261 (undefined!3073 Bool) (index!11216 (_ BitVec 32)) (x!29449 (_ BitVec 32))) (Undefined!2261) (MissingVacant!2261 (index!11217 (_ BitVec 32))) )
))
(declare-fun lt!147230 () SeekEntryResult!2261)

(declare-fun lt!147226 () Bool)

(assert (=> b!296679 (= res!156336 (or lt!147226 (= lt!147230 (MissingVacant!2261 i!1256))))))

(assert (=> b!296679 (= lt!147226 (= lt!147230 (MissingZero!2261 i!1256)))))

(declare-datatypes ((array!15010 0))(
  ( (array!15011 (arr!7113 (Array (_ BitVec 32) (_ BitVec 64))) (size!7466 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15010)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15010 (_ BitVec 32)) SeekEntryResult!2261)

(assert (=> b!296679 (= lt!147230 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296680 () Bool)

(declare-fun res!156338 () Bool)

(assert (=> b!296680 (=> (not res!156338) (not e!187498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296680 (= res!156338 (validKeyInArray!0 k0!2524))))

(declare-fun b!296681 () Bool)

(declare-fun e!187497 () Bool)

(declare-fun e!187500 () Bool)

(assert (=> b!296681 (= e!187497 e!187500)))

(declare-fun res!156333 () Bool)

(assert (=> b!296681 (=> (not res!156333) (not e!187500))))

(declare-fun lt!147231 () SeekEntryResult!2261)

(declare-fun lt!147228 () Bool)

(assert (=> b!296681 (= res!156333 (and (or lt!147228 (not (undefined!3073 lt!147231))) (or lt!147228 (not (= (select (arr!7113 a!3312) (index!11216 lt!147231)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147228 (not (= (select (arr!7113 a!3312) (index!11216 lt!147231)) k0!2524))) (not lt!147228)))))

(get-info :version)

(assert (=> b!296681 (= lt!147228 (not ((_ is Intermediate!2261) lt!147231)))))

(declare-fun b!296682 () Bool)

(assert (=> b!296682 (= e!187500 (not true))))

(assert (=> b!296682 (and (= (select (arr!7113 a!3312) (index!11216 lt!147231)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11216 lt!147231) i!1256))))

(declare-fun res!156337 () Bool)

(assert (=> start!29294 (=> (not res!156337) (not e!187498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29294 (= res!156337 (validMask!0 mask!3809))))

(assert (=> start!29294 e!187498))

(assert (=> start!29294 true))

(declare-fun array_inv!5085 (array!15010) Bool)

(assert (=> start!29294 (array_inv!5085 a!3312)))

(declare-fun b!296683 () Bool)

(declare-fun res!156334 () Bool)

(assert (=> b!296683 (=> (not res!156334) (not e!187499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15010 (_ BitVec 32)) Bool)

(assert (=> b!296683 (= res!156334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296684 () Bool)

(declare-fun res!156335 () Bool)

(assert (=> b!296684 (=> (not res!156335) (not e!187498))))

(declare-fun arrayContainsKey!0 (array!15010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296684 (= res!156335 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296685 () Bool)

(declare-fun res!156339 () Bool)

(assert (=> b!296685 (=> (not res!156339) (not e!187498))))

(assert (=> b!296685 (= res!156339 (and (= (size!7466 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7466 a!3312))))))

(declare-fun b!296686 () Bool)

(assert (=> b!296686 (= e!187499 e!187497)))

(declare-fun res!156340 () Bool)

(assert (=> b!296686 (=> (not res!156340) (not e!187497))))

(assert (=> b!296686 (= res!156340 lt!147226)))

(declare-fun lt!147227 () SeekEntryResult!2261)

(declare-fun lt!147229 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15010 (_ BitVec 32)) SeekEntryResult!2261)

(assert (=> b!296686 (= lt!147227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147229 k0!2524 (array!15011 (store (arr!7113 a!3312) i!1256 k0!2524) (size!7466 a!3312)) mask!3809))))

(assert (=> b!296686 (= lt!147231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147229 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296686 (= lt!147229 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29294 res!156337) b!296685))

(assert (= (and b!296685 res!156339) b!296680))

(assert (= (and b!296680 res!156338) b!296684))

(assert (= (and b!296684 res!156335) b!296679))

(assert (= (and b!296679 res!156336) b!296683))

(assert (= (and b!296683 res!156334) b!296686))

(assert (= (and b!296686 res!156340) b!296681))

(assert (= (and b!296681 res!156333) b!296682))

(declare-fun m!309057 () Bool)

(assert (=> b!296684 m!309057))

(declare-fun m!309059 () Bool)

(assert (=> b!296686 m!309059))

(declare-fun m!309061 () Bool)

(assert (=> b!296686 m!309061))

(declare-fun m!309063 () Bool)

(assert (=> b!296686 m!309063))

(declare-fun m!309065 () Bool)

(assert (=> b!296686 m!309065))

(declare-fun m!309067 () Bool)

(assert (=> b!296679 m!309067))

(declare-fun m!309069 () Bool)

(assert (=> start!29294 m!309069))

(declare-fun m!309071 () Bool)

(assert (=> start!29294 m!309071))

(declare-fun m!309073 () Bool)

(assert (=> b!296683 m!309073))

(declare-fun m!309075 () Bool)

(assert (=> b!296681 m!309075))

(declare-fun m!309077 () Bool)

(assert (=> b!296680 m!309077))

(assert (=> b!296682 m!309075))

(check-sat (not b!296684) (not b!296686) (not start!29294) (not b!296679) (not b!296680) (not b!296683))
(check-sat)
