; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49964 () Bool)

(assert start!49964)

(declare-fun b!547686 () Bool)

(declare-fun res!341241 () Bool)

(declare-fun e!316453 () Bool)

(assert (=> b!547686 (=> (not res!341241) (not e!316453))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34555 0))(
  ( (array!34556 (arr!16598 (Array (_ BitVec 32) (_ BitVec 64))) (size!16963 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34555)

(assert (=> b!547686 (= res!341241 (and (= (size!16963 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16963 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16963 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547687 () Bool)

(declare-fun res!341236 () Bool)

(assert (=> b!547687 (=> (not res!341236) (not e!316453))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547687 (= res!341236 (validKeyInArray!0 k0!1914))))

(declare-fun b!547688 () Bool)

(declare-fun e!316455 () Bool)

(assert (=> b!547688 (= e!316453 e!316455)))

(declare-fun res!341243 () Bool)

(assert (=> b!547688 (=> (not res!341243) (not e!316455))))

(declare-datatypes ((SeekEntryResult!5044 0))(
  ( (MissingZero!5044 (index!22403 (_ BitVec 32))) (Found!5044 (index!22404 (_ BitVec 32))) (Intermediate!5044 (undefined!5856 Bool) (index!22405 (_ BitVec 32)) (x!51355 (_ BitVec 32))) (Undefined!5044) (MissingVacant!5044 (index!22406 (_ BitVec 32))) )
))
(declare-fun lt!249453 () SeekEntryResult!5044)

(assert (=> b!547688 (= res!341243 (or (= lt!249453 (MissingZero!5044 i!1132)) (= lt!249453 (MissingVacant!5044 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34555 (_ BitVec 32)) SeekEntryResult!5044)

(assert (=> b!547688 (= lt!249453 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547689 () Bool)

(declare-fun res!341238 () Bool)

(assert (=> b!547689 (=> (not res!341238) (not e!316455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34555 (_ BitVec 32)) Bool)

(assert (=> b!547689 (= res!341238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547690 () Bool)

(assert (=> b!547690 (= e!316455 false)))

(declare-fun lt!249454 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!547690 (= lt!249454 (toIndex!0 (select (arr!16598 a!3118) j!142) mask!3119))))

(declare-fun res!341237 () Bool)

(assert (=> start!49964 (=> (not res!341237) (not e!316453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49964 (= res!341237 (validMask!0 mask!3119))))

(assert (=> start!49964 e!316453))

(assert (=> start!49964 true))

(declare-fun array_inv!12481 (array!34555) Bool)

(assert (=> start!49964 (array_inv!12481 a!3118)))

(declare-fun b!547691 () Bool)

(declare-fun res!341239 () Bool)

(assert (=> b!547691 (=> (not res!341239) (not e!316453))))

(declare-fun arrayContainsKey!0 (array!34555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547691 (= res!341239 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547692 () Bool)

(declare-fun res!341242 () Bool)

(assert (=> b!547692 (=> (not res!341242) (not e!316455))))

(declare-datatypes ((List!10717 0))(
  ( (Nil!10714) (Cons!10713 (h!11680 (_ BitVec 64)) (t!16936 List!10717)) )
))
(declare-fun arrayNoDuplicates!0 (array!34555 (_ BitVec 32) List!10717) Bool)

(assert (=> b!547692 (= res!341242 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10714))))

(declare-fun b!547693 () Bool)

(declare-fun res!341240 () Bool)

(assert (=> b!547693 (=> (not res!341240) (not e!316453))))

(assert (=> b!547693 (= res!341240 (validKeyInArray!0 (select (arr!16598 a!3118) j!142)))))

(assert (= (and start!49964 res!341237) b!547686))

(assert (= (and b!547686 res!341241) b!547693))

(assert (= (and b!547693 res!341240) b!547687))

(assert (= (and b!547687 res!341236) b!547691))

(assert (= (and b!547691 res!341239) b!547688))

(assert (= (and b!547688 res!341243) b!547689))

(assert (= (and b!547689 res!341238) b!547692))

(assert (= (and b!547692 res!341242) b!547690))

(declare-fun m!524315 () Bool)

(assert (=> b!547693 m!524315))

(assert (=> b!547693 m!524315))

(declare-fun m!524317 () Bool)

(assert (=> b!547693 m!524317))

(assert (=> b!547690 m!524315))

(assert (=> b!547690 m!524315))

(declare-fun m!524319 () Bool)

(assert (=> b!547690 m!524319))

(declare-fun m!524321 () Bool)

(assert (=> b!547687 m!524321))

(declare-fun m!524323 () Bool)

(assert (=> b!547692 m!524323))

(declare-fun m!524325 () Bool)

(assert (=> b!547689 m!524325))

(declare-fun m!524327 () Bool)

(assert (=> b!547688 m!524327))

(declare-fun m!524329 () Bool)

(assert (=> start!49964 m!524329))

(declare-fun m!524331 () Bool)

(assert (=> start!49964 m!524331))

(declare-fun m!524333 () Bool)

(assert (=> b!547691 m!524333))

(check-sat (not b!547689) (not b!547690) (not b!547687) (not b!547693) (not b!547688) (not start!49964) (not b!547692) (not b!547691))
(check-sat)
