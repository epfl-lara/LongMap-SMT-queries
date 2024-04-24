; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32684 () Bool)

(assert start!32684)

(declare-fun b!326718 () Bool)

(declare-fun res!179802 () Bool)

(declare-fun e!201093 () Bool)

(assert (=> b!326718 (=> (not res!179802) (not e!201093))))

(declare-datatypes ((array!16734 0))(
  ( (array!16735 (arr!7921 (Array (_ BitVec 32) (_ BitVec 64))) (size!8273 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16734)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326718 (= res!179802 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326719 () Bool)

(declare-fun e!201092 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!326719 (= e!201092 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((Unit!10102 0))(
  ( (Unit!10103) )
))
(declare-fun lt!157409 () Unit!10102)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16734 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10102)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326719 (= lt!157409 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326720 () Bool)

(declare-fun res!179805 () Bool)

(assert (=> b!326720 (=> (not res!179805) (not e!201093))))

(declare-datatypes ((SeekEntryResult!3017 0))(
  ( (MissingZero!3017 (index!14244 (_ BitVec 32))) (Found!3017 (index!14245 (_ BitVec 32))) (Intermediate!3017 (undefined!3829 Bool) (index!14246 (_ BitVec 32)) (x!32596 (_ BitVec 32))) (Undefined!3017) (MissingVacant!3017 (index!14247 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16734 (_ BitVec 32)) SeekEntryResult!3017)

(assert (=> b!326720 (= res!179805 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3017 i!1250)))))

(declare-fun b!326721 () Bool)

(declare-fun res!179804 () Bool)

(assert (=> b!326721 (=> (not res!179804) (not e!201093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16734 (_ BitVec 32)) Bool)

(assert (=> b!326721 (= res!179804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!179801 () Bool)

(assert (=> start!32684 (=> (not res!179801) (not e!201093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32684 (= res!179801 (validMask!0 mask!3777))))

(assert (=> start!32684 e!201093))

(declare-fun array_inv!5871 (array!16734) Bool)

(assert (=> start!32684 (array_inv!5871 a!3305)))

(assert (=> start!32684 true))

(declare-fun b!326722 () Bool)

(declare-fun res!179807 () Bool)

(assert (=> b!326722 (=> (not res!179807) (not e!201092))))

(assert (=> b!326722 (= res!179807 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7921 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326723 () Bool)

(declare-fun res!179803 () Bool)

(assert (=> b!326723 (=> (not res!179803) (not e!201092))))

(assert (=> b!326723 (= res!179803 (and (= (select (arr!7921 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8273 a!3305))))))

(declare-fun b!326724 () Bool)

(declare-fun res!179806 () Bool)

(assert (=> b!326724 (=> (not res!179806) (not e!201092))))

(declare-fun lt!157410 () SeekEntryResult!3017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16734 (_ BitVec 32)) SeekEntryResult!3017)

(assert (=> b!326724 (= res!179806 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157410))))

(declare-fun b!326725 () Bool)

(declare-fun res!179808 () Bool)

(assert (=> b!326725 (=> (not res!179808) (not e!201093))))

(assert (=> b!326725 (= res!179808 (and (= (size!8273 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8273 a!3305))))))

(declare-fun b!326726 () Bool)

(declare-fun res!179800 () Bool)

(assert (=> b!326726 (=> (not res!179800) (not e!201093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326726 (= res!179800 (validKeyInArray!0 k0!2497))))

(declare-fun b!326727 () Bool)

(assert (=> b!326727 (= e!201093 e!201092)))

(declare-fun res!179799 () Bool)

(assert (=> b!326727 (=> (not res!179799) (not e!201092))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326727 (= res!179799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157410))))

(assert (=> b!326727 (= lt!157410 (Intermediate!3017 false resIndex!58 resX!58))))

(assert (= (and start!32684 res!179801) b!326725))

(assert (= (and b!326725 res!179808) b!326726))

(assert (= (and b!326726 res!179800) b!326718))

(assert (= (and b!326718 res!179802) b!326720))

(assert (= (and b!326720 res!179805) b!326721))

(assert (= (and b!326721 res!179804) b!326727))

(assert (= (and b!326727 res!179799) b!326723))

(assert (= (and b!326723 res!179803) b!326724))

(assert (= (and b!326724 res!179806) b!326722))

(assert (= (and b!326722 res!179807) b!326719))

(declare-fun m!333469 () Bool)

(assert (=> b!326723 m!333469))

(declare-fun m!333471 () Bool)

(assert (=> b!326726 m!333471))

(declare-fun m!333473 () Bool)

(assert (=> b!326727 m!333473))

(assert (=> b!326727 m!333473))

(declare-fun m!333475 () Bool)

(assert (=> b!326727 m!333475))

(declare-fun m!333477 () Bool)

(assert (=> b!326720 m!333477))

(declare-fun m!333479 () Bool)

(assert (=> b!326724 m!333479))

(declare-fun m!333481 () Bool)

(assert (=> b!326718 m!333481))

(declare-fun m!333483 () Bool)

(assert (=> start!32684 m!333483))

(declare-fun m!333485 () Bool)

(assert (=> start!32684 m!333485))

(declare-fun m!333487 () Bool)

(assert (=> b!326721 m!333487))

(declare-fun m!333489 () Bool)

(assert (=> b!326719 m!333489))

(assert (=> b!326719 m!333489))

(declare-fun m!333491 () Bool)

(assert (=> b!326719 m!333491))

(declare-fun m!333493 () Bool)

(assert (=> b!326722 m!333493))

(check-sat (not b!326726) (not start!32684) (not b!326718) (not b!326719) (not b!326720) (not b!326727) (not b!326721) (not b!326724))
(check-sat)
