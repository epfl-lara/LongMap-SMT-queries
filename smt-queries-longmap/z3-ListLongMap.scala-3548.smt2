; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48860 () Bool)

(assert start!48860)

(declare-fun b!538250 () Bool)

(declare-fun res!333460 () Bool)

(declare-fun e!312123 () Bool)

(assert (=> b!538250 (=> (not res!333460) (not e!312123))))

(declare-datatypes ((array!34072 0))(
  ( (array!34073 (arr!16375 (Array (_ BitVec 32) (_ BitVec 64))) (size!16739 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34072)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34072 (_ BitVec 32)) Bool)

(assert (=> b!538250 (= res!333460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!333462 () Bool)

(declare-fun e!312124 () Bool)

(assert (=> start!48860 (=> (not res!333462) (not e!312124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48860 (= res!333462 (validMask!0 mask!3216))))

(assert (=> start!48860 e!312124))

(assert (=> start!48860 true))

(declare-fun array_inv!12171 (array!34072) Bool)

(assert (=> start!48860 (array_inv!12171 a!3154)))

(declare-fun b!538251 () Bool)

(assert (=> b!538251 (= e!312124 e!312123)))

(declare-fun res!333458 () Bool)

(assert (=> b!538251 (=> (not res!333458) (not e!312123))))

(declare-datatypes ((SeekEntryResult!4833 0))(
  ( (MissingZero!4833 (index!21556 (_ BitVec 32))) (Found!4833 (index!21557 (_ BitVec 32))) (Intermediate!4833 (undefined!5645 Bool) (index!21558 (_ BitVec 32)) (x!50480 (_ BitVec 32))) (Undefined!4833) (MissingVacant!4833 (index!21559 (_ BitVec 32))) )
))
(declare-fun lt!246669 () SeekEntryResult!4833)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538251 (= res!333458 (or (= lt!246669 (MissingZero!4833 i!1153)) (= lt!246669 (MissingVacant!4833 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34072 (_ BitVec 32)) SeekEntryResult!4833)

(assert (=> b!538251 (= lt!246669 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538252 () Bool)

(declare-fun e!312121 () Bool)

(assert (=> b!538252 (= e!312121 (not true))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246672 () SeekEntryResult!4833)

(declare-fun lt!246673 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34072 (_ BitVec 32)) SeekEntryResult!4833)

(assert (=> b!538252 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246673 (select (store (arr!16375 a!3154) i!1153 k0!1998) j!147) (array!34073 (store (arr!16375 a!3154) i!1153 k0!1998) (size!16739 a!3154)) mask!3216) lt!246672)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16850 0))(
  ( (Unit!16851) )
))
(declare-fun lt!246667 () Unit!16850)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34072 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16850)

(assert (=> b!538252 (= lt!246667 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246673 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538253 () Bool)

(declare-fun res!333466 () Bool)

(assert (=> b!538253 (=> (not res!333466) (not e!312123))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538253 (= res!333466 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16739 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16739 a!3154)) (= (select (arr!16375 a!3154) resIndex!32) (select (arr!16375 a!3154) j!147))))))

(declare-fun b!538254 () Bool)

(declare-fun res!333457 () Bool)

(assert (=> b!538254 (=> (not res!333457) (not e!312124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538254 (= res!333457 (validKeyInArray!0 (select (arr!16375 a!3154) j!147)))))

(declare-fun b!538255 () Bool)

(declare-fun res!333464 () Bool)

(assert (=> b!538255 (=> (not res!333464) (not e!312124))))

(assert (=> b!538255 (= res!333464 (and (= (size!16739 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16739 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16739 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538256 () Bool)

(declare-fun res!333455 () Bool)

(assert (=> b!538256 (=> (not res!333455) (not e!312123))))

(declare-datatypes ((List!10494 0))(
  ( (Nil!10491) (Cons!10490 (h!11433 (_ BitVec 64)) (t!16722 List!10494)) )
))
(declare-fun arrayNoDuplicates!0 (array!34072 (_ BitVec 32) List!10494) Bool)

(assert (=> b!538256 (= res!333455 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10491))))

(declare-fun b!538257 () Bool)

(declare-fun e!312126 () Bool)

(declare-fun e!312125 () Bool)

(assert (=> b!538257 (= e!312126 e!312125)))

(declare-fun res!333467 () Bool)

(assert (=> b!538257 (=> (not res!333467) (not e!312125))))

(assert (=> b!538257 (= res!333467 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246673 #b00000000000000000000000000000000) (bvslt lt!246673 (size!16739 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538257 (= lt!246673 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538258 () Bool)

(declare-fun res!333456 () Bool)

(assert (=> b!538258 (=> (not res!333456) (not e!312124))))

(assert (=> b!538258 (= res!333456 (validKeyInArray!0 k0!1998))))

(declare-fun b!538259 () Bool)

(declare-fun e!312120 () Bool)

(assert (=> b!538259 (= e!312120 e!312126)))

(declare-fun res!333463 () Bool)

(assert (=> b!538259 (=> (not res!333463) (not e!312126))))

(declare-fun lt!246668 () SeekEntryResult!4833)

(declare-fun lt!246671 () SeekEntryResult!4833)

(assert (=> b!538259 (= res!333463 (and (= lt!246671 lt!246668) (not (= (select (arr!16375 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16375 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16375 a!3154) index!1177) (select (arr!16375 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538259 (= lt!246671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16375 a!3154) j!147) mask!3216) (select (arr!16375 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538260 () Bool)

(assert (=> b!538260 (= e!312125 e!312121)))

(declare-fun res!333465 () Bool)

(assert (=> b!538260 (=> (not res!333465) (not e!312121))))

(declare-fun lt!246670 () SeekEntryResult!4833)

(assert (=> b!538260 (= res!333465 (and (= lt!246670 lt!246672) (= lt!246671 lt!246670)))))

(assert (=> b!538260 (= lt!246670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246673 (select (arr!16375 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538261 () Bool)

(assert (=> b!538261 (= e!312123 e!312120)))

(declare-fun res!333461 () Bool)

(assert (=> b!538261 (=> (not res!333461) (not e!312120))))

(assert (=> b!538261 (= res!333461 (= lt!246668 lt!246672))))

(assert (=> b!538261 (= lt!246672 (Intermediate!4833 false resIndex!32 resX!32))))

(assert (=> b!538261 (= lt!246668 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16375 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538262 () Bool)

(declare-fun res!333459 () Bool)

(assert (=> b!538262 (=> (not res!333459) (not e!312124))))

(declare-fun arrayContainsKey!0 (array!34072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538262 (= res!333459 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48860 res!333462) b!538255))

(assert (= (and b!538255 res!333464) b!538254))

(assert (= (and b!538254 res!333457) b!538258))

(assert (= (and b!538258 res!333456) b!538262))

(assert (= (and b!538262 res!333459) b!538251))

(assert (= (and b!538251 res!333458) b!538250))

(assert (= (and b!538250 res!333460) b!538256))

(assert (= (and b!538256 res!333455) b!538253))

(assert (= (and b!538253 res!333466) b!538261))

(assert (= (and b!538261 res!333461) b!538259))

(assert (= (and b!538259 res!333463) b!538257))

(assert (= (and b!538257 res!333467) b!538260))

(assert (= (and b!538260 res!333465) b!538252))

(declare-fun m!517345 () Bool)

(assert (=> b!538251 m!517345))

(declare-fun m!517347 () Bool)

(assert (=> b!538257 m!517347))

(declare-fun m!517349 () Bool)

(assert (=> b!538254 m!517349))

(assert (=> b!538254 m!517349))

(declare-fun m!517351 () Bool)

(assert (=> b!538254 m!517351))

(assert (=> b!538260 m!517349))

(assert (=> b!538260 m!517349))

(declare-fun m!517353 () Bool)

(assert (=> b!538260 m!517353))

(declare-fun m!517355 () Bool)

(assert (=> start!48860 m!517355))

(declare-fun m!517357 () Bool)

(assert (=> start!48860 m!517357))

(declare-fun m!517359 () Bool)

(assert (=> b!538258 m!517359))

(declare-fun m!517361 () Bool)

(assert (=> b!538262 m!517361))

(declare-fun m!517363 () Bool)

(assert (=> b!538252 m!517363))

(declare-fun m!517365 () Bool)

(assert (=> b!538252 m!517365))

(assert (=> b!538252 m!517365))

(declare-fun m!517367 () Bool)

(assert (=> b!538252 m!517367))

(declare-fun m!517369 () Bool)

(assert (=> b!538252 m!517369))

(declare-fun m!517371 () Bool)

(assert (=> b!538253 m!517371))

(assert (=> b!538253 m!517349))

(declare-fun m!517373 () Bool)

(assert (=> b!538250 m!517373))

(declare-fun m!517375 () Bool)

(assert (=> b!538259 m!517375))

(assert (=> b!538259 m!517349))

(assert (=> b!538259 m!517349))

(declare-fun m!517377 () Bool)

(assert (=> b!538259 m!517377))

(assert (=> b!538259 m!517377))

(assert (=> b!538259 m!517349))

(declare-fun m!517379 () Bool)

(assert (=> b!538259 m!517379))

(declare-fun m!517381 () Bool)

(assert (=> b!538256 m!517381))

(assert (=> b!538261 m!517349))

(assert (=> b!538261 m!517349))

(declare-fun m!517383 () Bool)

(assert (=> b!538261 m!517383))

(check-sat (not b!538256) (not start!48860) (not b!538261) (not b!538259) (not b!538260) (not b!538250) (not b!538251) (not b!538262) (not b!538254) (not b!538258) (not b!538252) (not b!538257))
(check-sat)
