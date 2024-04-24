; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86752 () Bool)

(assert start!86752)

(declare-fun b!1003723 () Bool)

(declare-fun res!672446 () Bool)

(declare-fun e!565552 () Bool)

(assert (=> b!1003723 (=> (not res!672446) (not e!565552))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((array!63372 0))(
  ( (array!63373 (arr!30505 (Array (_ BitVec 32) (_ BitVec 64))) (size!31008 (_ BitVec 32))) )
))
(declare-fun lt!443674 () array!63372)

(declare-fun lt!443680 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9373 0))(
  ( (MissingZero!9373 (index!39863 (_ BitVec 32))) (Found!9373 (index!39864 (_ BitVec 32))) (Intermediate!9373 (undefined!10185 Bool) (index!39865 (_ BitVec 32)) (x!87437 (_ BitVec 32))) (Undefined!9373) (MissingVacant!9373 (index!39866 (_ BitVec 32))) )
))
(declare-fun lt!443679 () SeekEntryResult!9373)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63372 (_ BitVec 32)) SeekEntryResult!9373)

(assert (=> b!1003723 (= res!672446 (not (= lt!443679 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443680 lt!443674 mask!3464))))))

(declare-fun res!672443 () Bool)

(declare-fun e!565553 () Bool)

(assert (=> start!86752 (=> (not res!672443) (not e!565553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86752 (= res!672443 (validMask!0 mask!3464))))

(assert (=> start!86752 e!565553))

(declare-fun a!3219 () array!63372)

(declare-fun array_inv!23641 (array!63372) Bool)

(assert (=> start!86752 (array_inv!23641 a!3219)))

(assert (=> start!86752 true))

(declare-fun b!1003724 () Bool)

(declare-fun res!672445 () Bool)

(assert (=> b!1003724 (=> (not res!672445) (not e!565553))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003724 (= res!672445 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003725 () Bool)

(declare-fun e!565555 () Bool)

(assert (=> b!1003725 (= e!565552 e!565555)))

(declare-fun res!672442 () Bool)

(assert (=> b!1003725 (=> (not res!672442) (not e!565555))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443677 () (_ BitVec 32))

(assert (=> b!1003725 (= res!672442 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443677 #b00000000000000000000000000000000) (bvslt lt!443677 (size!31008 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003725 (= lt!443677 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003726 () Bool)

(declare-fun res!672440 () Bool)

(declare-fun e!565551 () Bool)

(assert (=> b!1003726 (=> (not res!672440) (not e!565551))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003726 (= res!672440 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31008 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31008 a!3219))))))

(declare-fun b!1003727 () Bool)

(declare-fun res!672447 () Bool)

(assert (=> b!1003727 (=> (not res!672447) (not e!565551))))

(declare-datatypes ((List!21152 0))(
  ( (Nil!21149) (Cons!21148 (h!22334 (_ BitVec 64)) (t!30145 List!21152)) )
))
(declare-fun arrayNoDuplicates!0 (array!63372 (_ BitVec 32) List!21152) Bool)

(assert (=> b!1003727 (= res!672447 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21149))))

(declare-fun b!1003728 () Bool)

(declare-fun res!672455 () Bool)

(assert (=> b!1003728 (=> (not res!672455) (not e!565553))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003728 (= res!672455 (and (= (size!31008 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31008 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31008 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003729 () Bool)

(declare-fun res!672444 () Bool)

(assert (=> b!1003729 (=> (not res!672444) (not e!565553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003729 (= res!672444 (validKeyInArray!0 (select (arr!30505 a!3219) j!170)))))

(declare-fun b!1003730 () Bool)

(declare-fun res!672451 () Bool)

(assert (=> b!1003730 (=> (not res!672451) (not e!565555))))

(declare-fun lt!443678 () SeekEntryResult!9373)

(assert (=> b!1003730 (= res!672451 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443677 (select (arr!30505 a!3219) j!170) a!3219 mask!3464) lt!443678))))

(declare-fun b!1003731 () Bool)

(assert (=> b!1003731 (= e!565555 false)))

(declare-fun lt!443681 () SeekEntryResult!9373)

(assert (=> b!1003731 (= lt!443681 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443677 lt!443680 lt!443674 mask!3464))))

(declare-fun b!1003732 () Bool)

(assert (=> b!1003732 (= e!565553 e!565551)))

(declare-fun res!672448 () Bool)

(assert (=> b!1003732 (=> (not res!672448) (not e!565551))))

(declare-fun lt!443676 () SeekEntryResult!9373)

(assert (=> b!1003732 (= res!672448 (or (= lt!443676 (MissingVacant!9373 i!1194)) (= lt!443676 (MissingZero!9373 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63372 (_ BitVec 32)) SeekEntryResult!9373)

(assert (=> b!1003732 (= lt!443676 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003733 () Bool)

(declare-fun e!565557 () Bool)

(assert (=> b!1003733 (= e!565557 e!565552)))

(declare-fun res!672452 () Bool)

(assert (=> b!1003733 (=> (not res!672452) (not e!565552))))

(declare-fun lt!443675 () SeekEntryResult!9373)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003733 (= res!672452 (not (= lt!443675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443680 mask!3464) lt!443680 lt!443674 mask!3464))))))

(assert (=> b!1003733 (= lt!443680 (select (store (arr!30505 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003733 (= lt!443674 (array!63373 (store (arr!30505 a!3219) i!1194 k0!2224) (size!31008 a!3219)))))

(declare-fun b!1003734 () Bool)

(declare-fun e!565554 () Bool)

(assert (=> b!1003734 (= e!565551 e!565554)))

(declare-fun res!672449 () Bool)

(assert (=> b!1003734 (=> (not res!672449) (not e!565554))))

(assert (=> b!1003734 (= res!672449 (= lt!443675 lt!443678))))

(assert (=> b!1003734 (= lt!443678 (Intermediate!9373 false resIndex!38 resX!38))))

(assert (=> b!1003734 (= lt!443675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30505 a!3219) j!170) mask!3464) (select (arr!30505 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003735 () Bool)

(declare-fun res!672441 () Bool)

(assert (=> b!1003735 (=> (not res!672441) (not e!565553))))

(assert (=> b!1003735 (= res!672441 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003736 () Bool)

(declare-fun res!672454 () Bool)

(assert (=> b!1003736 (=> (not res!672454) (not e!565551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63372 (_ BitVec 32)) Bool)

(assert (=> b!1003736 (= res!672454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003737 () Bool)

(declare-fun res!672450 () Bool)

(assert (=> b!1003737 (=> (not res!672450) (not e!565552))))

(assert (=> b!1003737 (= res!672450 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003738 () Bool)

(assert (=> b!1003738 (= e!565554 e!565557)))

(declare-fun res!672453 () Bool)

(assert (=> b!1003738 (=> (not res!672453) (not e!565557))))

(assert (=> b!1003738 (= res!672453 (= lt!443679 lt!443678))))

(assert (=> b!1003738 (= lt!443679 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30505 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86752 res!672443) b!1003728))

(assert (= (and b!1003728 res!672455) b!1003729))

(assert (= (and b!1003729 res!672444) b!1003735))

(assert (= (and b!1003735 res!672441) b!1003724))

(assert (= (and b!1003724 res!672445) b!1003732))

(assert (= (and b!1003732 res!672448) b!1003736))

(assert (= (and b!1003736 res!672454) b!1003727))

(assert (= (and b!1003727 res!672447) b!1003726))

(assert (= (and b!1003726 res!672440) b!1003734))

(assert (= (and b!1003734 res!672449) b!1003738))

(assert (= (and b!1003738 res!672453) b!1003733))

(assert (= (and b!1003733 res!672452) b!1003723))

(assert (= (and b!1003723 res!672446) b!1003737))

(assert (= (and b!1003737 res!672450) b!1003725))

(assert (= (and b!1003725 res!672442) b!1003730))

(assert (= (and b!1003730 res!672451) b!1003731))

(declare-fun m!929873 () Bool)

(assert (=> b!1003734 m!929873))

(assert (=> b!1003734 m!929873))

(declare-fun m!929875 () Bool)

(assert (=> b!1003734 m!929875))

(assert (=> b!1003734 m!929875))

(assert (=> b!1003734 m!929873))

(declare-fun m!929877 () Bool)

(assert (=> b!1003734 m!929877))

(declare-fun m!929879 () Bool)

(assert (=> b!1003732 m!929879))

(declare-fun m!929881 () Bool)

(assert (=> b!1003725 m!929881))

(declare-fun m!929883 () Bool)

(assert (=> b!1003727 m!929883))

(declare-fun m!929885 () Bool)

(assert (=> b!1003731 m!929885))

(declare-fun m!929887 () Bool)

(assert (=> b!1003733 m!929887))

(assert (=> b!1003733 m!929887))

(declare-fun m!929889 () Bool)

(assert (=> b!1003733 m!929889))

(declare-fun m!929891 () Bool)

(assert (=> b!1003733 m!929891))

(declare-fun m!929893 () Bool)

(assert (=> b!1003733 m!929893))

(assert (=> b!1003730 m!929873))

(assert (=> b!1003730 m!929873))

(declare-fun m!929895 () Bool)

(assert (=> b!1003730 m!929895))

(declare-fun m!929897 () Bool)

(assert (=> b!1003735 m!929897))

(assert (=> b!1003738 m!929873))

(assert (=> b!1003738 m!929873))

(declare-fun m!929899 () Bool)

(assert (=> b!1003738 m!929899))

(declare-fun m!929901 () Bool)

(assert (=> b!1003723 m!929901))

(assert (=> b!1003729 m!929873))

(assert (=> b!1003729 m!929873))

(declare-fun m!929903 () Bool)

(assert (=> b!1003729 m!929903))

(declare-fun m!929905 () Bool)

(assert (=> b!1003736 m!929905))

(declare-fun m!929907 () Bool)

(assert (=> b!1003724 m!929907))

(declare-fun m!929909 () Bool)

(assert (=> start!86752 m!929909))

(declare-fun m!929911 () Bool)

(assert (=> start!86752 m!929911))

(check-sat (not b!1003732) (not b!1003738) (not b!1003723) (not b!1003727) (not b!1003735) (not b!1003731) (not b!1003734) (not b!1003730) (not b!1003736) (not b!1003724) (not b!1003725) (not b!1003729) (not start!86752) (not b!1003733))
(check-sat)
