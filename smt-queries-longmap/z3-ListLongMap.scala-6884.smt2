; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86788 () Bool)

(assert start!86788)

(declare-fun b!1004587 () Bool)

(declare-fun res!673313 () Bool)

(declare-fun e!565933 () Bool)

(assert (=> b!1004587 (=> (not res!673313) (not e!565933))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004587 (= res!673313 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004588 () Bool)

(declare-fun e!565935 () Bool)

(declare-fun e!565930 () Bool)

(assert (=> b!1004588 (= e!565935 e!565930)))

(declare-fun res!673306 () Bool)

(assert (=> b!1004588 (=> (not res!673306) (not e!565930))))

(declare-datatypes ((SeekEntryResult!9391 0))(
  ( (MissingZero!9391 (index!39935 (_ BitVec 32))) (Found!9391 (index!39936 (_ BitVec 32))) (Intermediate!9391 (undefined!10203 Bool) (index!39937 (_ BitVec 32)) (x!87503 (_ BitVec 32))) (Undefined!9391) (MissingVacant!9391 (index!39938 (_ BitVec 32))) )
))
(declare-fun lt!444110 () SeekEntryResult!9391)

(declare-fun lt!444113 () SeekEntryResult!9391)

(assert (=> b!1004588 (= res!673306 (= lt!444110 lt!444113))))

(declare-datatypes ((array!63408 0))(
  ( (array!63409 (arr!30523 (Array (_ BitVec 32) (_ BitVec 64))) (size!31026 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63408)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63408 (_ BitVec 32)) SeekEntryResult!9391)

(assert (=> b!1004588 (= lt!444110 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30523 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004589 () Bool)

(declare-fun res!673315 () Bool)

(declare-fun e!565932 () Bool)

(assert (=> b!1004589 (=> (not res!673315) (not e!565932))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004589 (= res!673315 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31026 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31026 a!3219))))))

(declare-fun b!1004590 () Bool)

(declare-fun res!673309 () Bool)

(declare-fun e!565929 () Bool)

(assert (=> b!1004590 (=> (not res!673309) (not e!565929))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004590 (= res!673309 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004591 () Bool)

(declare-fun e!565934 () Bool)

(assert (=> b!1004591 (= e!565929 e!565934)))

(declare-fun res!673311 () Bool)

(assert (=> b!1004591 (=> (not res!673311) (not e!565934))))

(declare-fun lt!444107 () (_ BitVec 32))

(assert (=> b!1004591 (= res!673311 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444107 #b00000000000000000000000000000000) (bvslt lt!444107 (size!31026 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004591 (= lt!444107 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1004592 () Bool)

(declare-fun res!673318 () Bool)

(assert (=> b!1004592 (=> (not res!673318) (not e!565932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63408 (_ BitVec 32)) Bool)

(assert (=> b!1004592 (= res!673318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!673308 () Bool)

(assert (=> start!86788 (=> (not res!673308) (not e!565933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86788 (= res!673308 (validMask!0 mask!3464))))

(assert (=> start!86788 e!565933))

(declare-fun array_inv!23659 (array!63408) Bool)

(assert (=> start!86788 (array_inv!23659 a!3219)))

(assert (=> start!86788 true))

(declare-fun b!1004593 () Bool)

(assert (=> b!1004593 (= e!565934 false)))

(declare-fun lt!444109 () array!63408)

(declare-fun lt!444112 () SeekEntryResult!9391)

(declare-fun lt!444108 () (_ BitVec 64))

(assert (=> b!1004593 (= lt!444112 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444107 lt!444108 lt!444109 mask!3464))))

(declare-fun b!1004594 () Bool)

(assert (=> b!1004594 (= e!565930 e!565929)))

(declare-fun res!673317 () Bool)

(assert (=> b!1004594 (=> (not res!673317) (not e!565929))))

(declare-fun lt!444111 () SeekEntryResult!9391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004594 (= res!673317 (not (= lt!444111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444108 mask!3464) lt!444108 lt!444109 mask!3464))))))

(assert (=> b!1004594 (= lt!444108 (select (store (arr!30523 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004594 (= lt!444109 (array!63409 (store (arr!30523 a!3219) i!1194 k0!2224) (size!31026 a!3219)))))

(declare-fun b!1004595 () Bool)

(assert (=> b!1004595 (= e!565932 e!565935)))

(declare-fun res!673304 () Bool)

(assert (=> b!1004595 (=> (not res!673304) (not e!565935))))

(assert (=> b!1004595 (= res!673304 (= lt!444111 lt!444113))))

(assert (=> b!1004595 (= lt!444113 (Intermediate!9391 false resIndex!38 resX!38))))

(assert (=> b!1004595 (= lt!444111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30523 a!3219) j!170) mask!3464) (select (arr!30523 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004596 () Bool)

(declare-fun res!673314 () Bool)

(assert (=> b!1004596 (=> (not res!673314) (not e!565933))))

(assert (=> b!1004596 (= res!673314 (validKeyInArray!0 (select (arr!30523 a!3219) j!170)))))

(declare-fun b!1004597 () Bool)

(declare-fun res!673307 () Bool)

(assert (=> b!1004597 (=> (not res!673307) (not e!565934))))

(assert (=> b!1004597 (= res!673307 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444107 (select (arr!30523 a!3219) j!170) a!3219 mask!3464) lt!444113))))

(declare-fun b!1004598 () Bool)

(declare-fun res!673312 () Bool)

(assert (=> b!1004598 (=> (not res!673312) (not e!565933))))

(declare-fun arrayContainsKey!0 (array!63408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004598 (= res!673312 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004599 () Bool)

(declare-fun res!673310 () Bool)

(assert (=> b!1004599 (=> (not res!673310) (not e!565929))))

(assert (=> b!1004599 (= res!673310 (not (= lt!444110 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444108 lt!444109 mask!3464))))))

(declare-fun b!1004600 () Bool)

(declare-fun res!673319 () Bool)

(assert (=> b!1004600 (=> (not res!673319) (not e!565932))))

(declare-datatypes ((List!21170 0))(
  ( (Nil!21167) (Cons!21166 (h!22352 (_ BitVec 64)) (t!30163 List!21170)) )
))
(declare-fun arrayNoDuplicates!0 (array!63408 (_ BitVec 32) List!21170) Bool)

(assert (=> b!1004600 (= res!673319 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21167))))

(declare-fun b!1004601 () Bool)

(declare-fun res!673316 () Bool)

(assert (=> b!1004601 (=> (not res!673316) (not e!565933))))

(assert (=> b!1004601 (= res!673316 (and (= (size!31026 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31026 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31026 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004602 () Bool)

(assert (=> b!1004602 (= e!565933 e!565932)))

(declare-fun res!673305 () Bool)

(assert (=> b!1004602 (=> (not res!673305) (not e!565932))))

(declare-fun lt!444106 () SeekEntryResult!9391)

(assert (=> b!1004602 (= res!673305 (or (= lt!444106 (MissingVacant!9391 i!1194)) (= lt!444106 (MissingZero!9391 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63408 (_ BitVec 32)) SeekEntryResult!9391)

(assert (=> b!1004602 (= lt!444106 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86788 res!673308) b!1004601))

(assert (= (and b!1004601 res!673316) b!1004596))

(assert (= (and b!1004596 res!673314) b!1004587))

(assert (= (and b!1004587 res!673313) b!1004598))

(assert (= (and b!1004598 res!673312) b!1004602))

(assert (= (and b!1004602 res!673305) b!1004592))

(assert (= (and b!1004592 res!673318) b!1004600))

(assert (= (and b!1004600 res!673319) b!1004589))

(assert (= (and b!1004589 res!673315) b!1004595))

(assert (= (and b!1004595 res!673304) b!1004588))

(assert (= (and b!1004588 res!673306) b!1004594))

(assert (= (and b!1004594 res!673317) b!1004599))

(assert (= (and b!1004599 res!673310) b!1004590))

(assert (= (and b!1004590 res!673309) b!1004591))

(assert (= (and b!1004591 res!673311) b!1004597))

(assert (= (and b!1004597 res!673307) b!1004593))

(declare-fun m!930593 () Bool)

(assert (=> b!1004596 m!930593))

(assert (=> b!1004596 m!930593))

(declare-fun m!930595 () Bool)

(assert (=> b!1004596 m!930595))

(assert (=> b!1004588 m!930593))

(assert (=> b!1004588 m!930593))

(declare-fun m!930597 () Bool)

(assert (=> b!1004588 m!930597))

(declare-fun m!930599 () Bool)

(assert (=> b!1004602 m!930599))

(assert (=> b!1004597 m!930593))

(assert (=> b!1004597 m!930593))

(declare-fun m!930601 () Bool)

(assert (=> b!1004597 m!930601))

(declare-fun m!930603 () Bool)

(assert (=> b!1004593 m!930603))

(declare-fun m!930605 () Bool)

(assert (=> start!86788 m!930605))

(declare-fun m!930607 () Bool)

(assert (=> start!86788 m!930607))

(declare-fun m!930609 () Bool)

(assert (=> b!1004592 m!930609))

(declare-fun m!930611 () Bool)

(assert (=> b!1004599 m!930611))

(declare-fun m!930613 () Bool)

(assert (=> b!1004591 m!930613))

(declare-fun m!930615 () Bool)

(assert (=> b!1004594 m!930615))

(assert (=> b!1004594 m!930615))

(declare-fun m!930617 () Bool)

(assert (=> b!1004594 m!930617))

(declare-fun m!930619 () Bool)

(assert (=> b!1004594 m!930619))

(declare-fun m!930621 () Bool)

(assert (=> b!1004594 m!930621))

(declare-fun m!930623 () Bool)

(assert (=> b!1004600 m!930623))

(declare-fun m!930625 () Bool)

(assert (=> b!1004587 m!930625))

(assert (=> b!1004595 m!930593))

(assert (=> b!1004595 m!930593))

(declare-fun m!930627 () Bool)

(assert (=> b!1004595 m!930627))

(assert (=> b!1004595 m!930627))

(assert (=> b!1004595 m!930593))

(declare-fun m!930629 () Bool)

(assert (=> b!1004595 m!930629))

(declare-fun m!930631 () Bool)

(assert (=> b!1004598 m!930631))

(check-sat (not b!1004593) (not b!1004591) (not b!1004587) (not b!1004594) (not start!86788) (not b!1004598) (not b!1004602) (not b!1004596) (not b!1004597) (not b!1004600) (not b!1004595) (not b!1004592) (not b!1004599) (not b!1004588))
(check-sat)
