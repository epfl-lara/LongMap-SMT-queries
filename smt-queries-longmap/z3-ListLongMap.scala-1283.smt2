; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26258 () Bool)

(assert start!26258)

(declare-fun b!271902 () Bool)

(declare-fun e!174676 () Bool)

(declare-fun e!174677 () Bool)

(assert (=> b!271902 (= e!174676 e!174677)))

(declare-fun res!135896 () Bool)

(assert (=> b!271902 (=> (not res!135896) (not e!174677))))

(declare-datatypes ((SeekEntryResult!1485 0))(
  ( (MissingZero!1485 (index!8110 (_ BitVec 32))) (Found!1485 (index!8111 (_ BitVec 32))) (Intermediate!1485 (undefined!2297 Bool) (index!8112 (_ BitVec 32)) (x!26434 (_ BitVec 32))) (Undefined!1485) (MissingVacant!1485 (index!8113 (_ BitVec 32))) )
))
(declare-fun lt!135883 () SeekEntryResult!1485)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271902 (= res!135896 (or (= lt!135883 (MissingZero!1485 i!1267)) (= lt!135883 (MissingVacant!1485 i!1267))))))

(declare-datatypes ((array!13355 0))(
  ( (array!13356 (arr!6327 (Array (_ BitVec 32) (_ BitVec 64))) (size!6679 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13355)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13355 (_ BitVec 32)) SeekEntryResult!1485)

(assert (=> b!271902 (= lt!135883 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271903 () Bool)

(declare-fun res!135897 () Bool)

(assert (=> b!271903 (=> (not res!135897) (not e!174677))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271903 (= res!135897 (not (= startIndex!26 i!1267)))))

(declare-fun b!271904 () Bool)

(declare-fun res!135900 () Bool)

(assert (=> b!271904 (=> (not res!135900) (not e!174676))))

(declare-datatypes ((List!4135 0))(
  ( (Nil!4132) (Cons!4131 (h!4798 (_ BitVec 64)) (t!9217 List!4135)) )
))
(declare-fun arrayNoDuplicates!0 (array!13355 (_ BitVec 32) List!4135) Bool)

(assert (=> b!271904 (= res!135900 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4132))))

(declare-fun b!271905 () Bool)

(declare-fun res!135894 () Bool)

(assert (=> b!271905 (=> (not res!135894) (not e!174677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271905 (= res!135894 (validKeyInArray!0 (select (arr!6327 a!3325) startIndex!26)))))

(declare-fun b!271906 () Bool)

(declare-fun res!135899 () Bool)

(assert (=> b!271906 (=> (not res!135899) (not e!174677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13355 (_ BitVec 32)) Bool)

(assert (=> b!271906 (= res!135899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271907 () Bool)

(declare-fun res!135892 () Bool)

(assert (=> b!271907 (=> (not res!135892) (not e!174676))))

(assert (=> b!271907 (= res!135892 (and (= (size!6679 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6679 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6679 a!3325))))))

(declare-fun b!271908 () Bool)

(declare-fun res!135893 () Bool)

(assert (=> b!271908 (=> (not res!135893) (not e!174676))))

(assert (=> b!271908 (= res!135893 (validKeyInArray!0 k0!2581))))

(declare-fun res!135895 () Bool)

(assert (=> start!26258 (=> (not res!135895) (not e!174676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26258 (= res!135895 (validMask!0 mask!3868))))

(assert (=> start!26258 e!174676))

(declare-fun array_inv!4290 (array!13355) Bool)

(assert (=> start!26258 (array_inv!4290 a!3325)))

(assert (=> start!26258 true))

(declare-fun b!271909 () Bool)

(declare-fun res!135898 () Bool)

(assert (=> b!271909 (=> (not res!135898) (not e!174676))))

(declare-fun arrayContainsKey!0 (array!13355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271909 (= res!135898 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271910 () Bool)

(assert (=> b!271910 (= e!174677 (not true))))

(assert (=> b!271910 (arrayNoDuplicates!0 (array!13356 (store (arr!6327 a!3325) i!1267 k0!2581) (size!6679 a!3325)) #b00000000000000000000000000000000 Nil!4132)))

(declare-datatypes ((Unit!8457 0))(
  ( (Unit!8458) )
))
(declare-fun lt!135882 () Unit!8457)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4135) Unit!8457)

(assert (=> b!271910 (= lt!135882 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4132))))

(assert (= (and start!26258 res!135895) b!271907))

(assert (= (and b!271907 res!135892) b!271908))

(assert (= (and b!271908 res!135893) b!271904))

(assert (= (and b!271904 res!135900) b!271909))

(assert (= (and b!271909 res!135898) b!271902))

(assert (= (and b!271902 res!135896) b!271906))

(assert (= (and b!271906 res!135899) b!271903))

(assert (= (and b!271903 res!135897) b!271905))

(assert (= (and b!271905 res!135894) b!271910))

(declare-fun m!287061 () Bool)

(assert (=> b!271906 m!287061))

(declare-fun m!287063 () Bool)

(assert (=> b!271909 m!287063))

(declare-fun m!287065 () Bool)

(assert (=> b!271902 m!287065))

(declare-fun m!287067 () Bool)

(assert (=> start!26258 m!287067))

(declare-fun m!287069 () Bool)

(assert (=> start!26258 m!287069))

(declare-fun m!287071 () Bool)

(assert (=> b!271904 m!287071))

(declare-fun m!287073 () Bool)

(assert (=> b!271908 m!287073))

(declare-fun m!287075 () Bool)

(assert (=> b!271905 m!287075))

(assert (=> b!271905 m!287075))

(declare-fun m!287077 () Bool)

(assert (=> b!271905 m!287077))

(declare-fun m!287079 () Bool)

(assert (=> b!271910 m!287079))

(declare-fun m!287081 () Bool)

(assert (=> b!271910 m!287081))

(declare-fun m!287083 () Bool)

(assert (=> b!271910 m!287083))

(check-sat (not b!271906) (not b!271910) (not b!271902) (not start!26258) (not b!271908) (not b!271905) (not b!271904) (not b!271909))
(check-sat)
