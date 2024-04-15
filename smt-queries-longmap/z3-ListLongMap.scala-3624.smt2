; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49970 () Bool)

(assert start!49970)

(declare-fun b!547758 () Bool)

(declare-fun res!341313 () Bool)

(declare-fun e!316481 () Bool)

(assert (=> b!547758 (=> (not res!341313) (not e!316481))))

(declare-datatypes ((array!34561 0))(
  ( (array!34562 (arr!16601 (Array (_ BitVec 32) (_ BitVec 64))) (size!16966 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34561)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547758 (= res!341313 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547760 () Bool)

(declare-fun res!341308 () Bool)

(assert (=> b!547760 (=> (not res!341308) (not e!316481))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547760 (= res!341308 (validKeyInArray!0 (select (arr!16601 a!3118) j!142)))))

(declare-fun b!547761 () Bool)

(declare-fun res!341310 () Bool)

(assert (=> b!547761 (=> (not res!341310) (not e!316481))))

(assert (=> b!547761 (= res!341310 (validKeyInArray!0 k0!1914))))

(declare-fun b!547762 () Bool)

(declare-fun res!341312 () Bool)

(declare-fun e!316480 () Bool)

(assert (=> b!547762 (=> (not res!341312) (not e!316480))))

(declare-datatypes ((List!10720 0))(
  ( (Nil!10717) (Cons!10716 (h!11683 (_ BitVec 64)) (t!16939 List!10720)) )
))
(declare-fun arrayNoDuplicates!0 (array!34561 (_ BitVec 32) List!10720) Bool)

(assert (=> b!547762 (= res!341312 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10717))))

(declare-fun b!547763 () Bool)

(assert (=> b!547763 (= e!316481 e!316480)))

(declare-fun res!341314 () Bool)

(assert (=> b!547763 (=> (not res!341314) (not e!316480))))

(declare-datatypes ((SeekEntryResult!5047 0))(
  ( (MissingZero!5047 (index!22415 (_ BitVec 32))) (Found!5047 (index!22416 (_ BitVec 32))) (Intermediate!5047 (undefined!5859 Bool) (index!22417 (_ BitVec 32)) (x!51366 (_ BitVec 32))) (Undefined!5047) (MissingVacant!5047 (index!22418 (_ BitVec 32))) )
))
(declare-fun lt!249472 () SeekEntryResult!5047)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547763 (= res!341314 (or (= lt!249472 (MissingZero!5047 i!1132)) (= lt!249472 (MissingVacant!5047 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34561 (_ BitVec 32)) SeekEntryResult!5047)

(assert (=> b!547763 (= lt!249472 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547764 () Bool)

(declare-fun res!341311 () Bool)

(assert (=> b!547764 (=> (not res!341311) (not e!316481))))

(assert (=> b!547764 (= res!341311 (and (= (size!16966 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16966 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16966 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547765 () Bool)

(declare-fun res!341309 () Bool)

(assert (=> b!547765 (=> (not res!341309) (not e!316480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34561 (_ BitVec 32)) Bool)

(assert (=> b!547765 (= res!341309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341315 () Bool)

(assert (=> start!49970 (=> (not res!341315) (not e!316481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49970 (= res!341315 (validMask!0 mask!3119))))

(assert (=> start!49970 e!316481))

(assert (=> start!49970 true))

(declare-fun array_inv!12484 (array!34561) Bool)

(assert (=> start!49970 (array_inv!12484 a!3118)))

(declare-fun b!547759 () Bool)

(assert (=> b!547759 (= e!316480 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!249471 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!547759 (= lt!249471 (toIndex!0 (select (arr!16601 a!3118) j!142) mask!3119))))

(assert (= (and start!49970 res!341315) b!547764))

(assert (= (and b!547764 res!341311) b!547760))

(assert (= (and b!547760 res!341308) b!547761))

(assert (= (and b!547761 res!341310) b!547758))

(assert (= (and b!547758 res!341313) b!547763))

(assert (= (and b!547763 res!341314) b!547765))

(assert (= (and b!547765 res!341309) b!547762))

(assert (= (and b!547762 res!341312) b!547759))

(declare-fun m!524375 () Bool)

(assert (=> b!547763 m!524375))

(declare-fun m!524377 () Bool)

(assert (=> b!547765 m!524377))

(declare-fun m!524379 () Bool)

(assert (=> b!547760 m!524379))

(assert (=> b!547760 m!524379))

(declare-fun m!524381 () Bool)

(assert (=> b!547760 m!524381))

(declare-fun m!524383 () Bool)

(assert (=> b!547761 m!524383))

(assert (=> b!547759 m!524379))

(assert (=> b!547759 m!524379))

(declare-fun m!524385 () Bool)

(assert (=> b!547759 m!524385))

(declare-fun m!524387 () Bool)

(assert (=> b!547762 m!524387))

(declare-fun m!524389 () Bool)

(assert (=> start!49970 m!524389))

(declare-fun m!524391 () Bool)

(assert (=> start!49970 m!524391))

(declare-fun m!524393 () Bool)

(assert (=> b!547758 m!524393))

(check-sat (not b!547759) (not b!547763) (not b!547765) (not start!49970) (not b!547761) (not b!547758) (not b!547760) (not b!547762))
(check-sat)
