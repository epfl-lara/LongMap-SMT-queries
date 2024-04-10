; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26204 () Bool)

(assert start!26204)

(declare-fun b!270905 () Bool)

(declare-fun res!134900 () Bool)

(declare-fun e!174434 () Bool)

(assert (=> b!270905 (=> (not res!134900) (not e!174434))))

(declare-datatypes ((array!13301 0))(
  ( (array!13302 (arr!6300 (Array (_ BitVec 32) (_ BitVec 64))) (size!6652 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13301)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270905 (= res!134900 (and (= (size!6652 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6652 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6652 a!3325))))))

(declare-fun b!270906 () Bool)

(declare-fun e!174433 () Bool)

(assert (=> b!270906 (= e!174433 false)))

(declare-fun lt!135720 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4108 0))(
  ( (Nil!4105) (Cons!4104 (h!4771 (_ BitVec 64)) (t!9190 List!4108)) )
))
(declare-fun contains!1938 (List!4108 (_ BitVec 64)) Bool)

(assert (=> b!270906 (= lt!135720 (contains!1938 Nil!4105 k0!2581))))

(declare-fun b!270907 () Bool)

(declare-fun res!134903 () Bool)

(assert (=> b!270907 (=> (not res!134903) (not e!174434))))

(declare-fun arrayContainsKey!0 (array!13301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270907 (= res!134903 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270908 () Bool)

(declare-fun res!134907 () Bool)

(assert (=> b!270908 (=> (not res!134907) (not e!174433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270908 (= res!134907 (validKeyInArray!0 (select (arr!6300 a!3325) startIndex!26)))))

(declare-fun b!270909 () Bool)

(declare-fun res!134901 () Bool)

(assert (=> b!270909 (=> (not res!134901) (not e!174433))))

(assert (=> b!270909 (= res!134901 (not (contains!1938 Nil!4105 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270910 () Bool)

(declare-fun res!134902 () Bool)

(assert (=> b!270910 (=> (not res!134902) (not e!174433))))

(assert (=> b!270910 (= res!134902 (and (bvslt (size!6652 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6652 a!3325))))))

(declare-fun b!270911 () Bool)

(declare-fun res!134899 () Bool)

(assert (=> b!270911 (=> (not res!134899) (not e!174433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13301 (_ BitVec 32)) Bool)

(assert (=> b!270911 (= res!134899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!134906 () Bool)

(assert (=> start!26204 (=> (not res!134906) (not e!174434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26204 (= res!134906 (validMask!0 mask!3868))))

(assert (=> start!26204 e!174434))

(declare-fun array_inv!4263 (array!13301) Bool)

(assert (=> start!26204 (array_inv!4263 a!3325)))

(assert (=> start!26204 true))

(declare-fun b!270912 () Bool)

(declare-fun res!134905 () Bool)

(assert (=> b!270912 (=> (not res!134905) (not e!174433))))

(declare-fun noDuplicate!126 (List!4108) Bool)

(assert (=> b!270912 (= res!134905 (noDuplicate!126 Nil!4105))))

(declare-fun b!270913 () Bool)

(assert (=> b!270913 (= e!174434 e!174433)))

(declare-fun res!134897 () Bool)

(assert (=> b!270913 (=> (not res!134897) (not e!174433))))

(declare-datatypes ((SeekEntryResult!1458 0))(
  ( (MissingZero!1458 (index!8002 (_ BitVec 32))) (Found!1458 (index!8003 (_ BitVec 32))) (Intermediate!1458 (undefined!2270 Bool) (index!8004 (_ BitVec 32)) (x!26335 (_ BitVec 32))) (Undefined!1458) (MissingVacant!1458 (index!8005 (_ BitVec 32))) )
))
(declare-fun lt!135721 () SeekEntryResult!1458)

(assert (=> b!270913 (= res!134897 (or (= lt!135721 (MissingZero!1458 i!1267)) (= lt!135721 (MissingVacant!1458 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13301 (_ BitVec 32)) SeekEntryResult!1458)

(assert (=> b!270913 (= lt!135721 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270914 () Bool)

(declare-fun res!134898 () Bool)

(assert (=> b!270914 (=> (not res!134898) (not e!174434))))

(assert (=> b!270914 (= res!134898 (validKeyInArray!0 k0!2581))))

(declare-fun b!270915 () Bool)

(declare-fun res!134904 () Bool)

(assert (=> b!270915 (=> (not res!134904) (not e!174433))))

(assert (=> b!270915 (= res!134904 (not (contains!1938 Nil!4105 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270916 () Bool)

(declare-fun res!134896 () Bool)

(assert (=> b!270916 (=> (not res!134896) (not e!174434))))

(declare-fun arrayNoDuplicates!0 (array!13301 (_ BitVec 32) List!4108) Bool)

(assert (=> b!270916 (= res!134896 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4105))))

(declare-fun b!270917 () Bool)

(declare-fun res!134895 () Bool)

(assert (=> b!270917 (=> (not res!134895) (not e!174433))))

(assert (=> b!270917 (= res!134895 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26204 res!134906) b!270905))

(assert (= (and b!270905 res!134900) b!270914))

(assert (= (and b!270914 res!134898) b!270916))

(assert (= (and b!270916 res!134896) b!270907))

(assert (= (and b!270907 res!134903) b!270913))

(assert (= (and b!270913 res!134897) b!270911))

(assert (= (and b!270911 res!134899) b!270917))

(assert (= (and b!270917 res!134895) b!270908))

(assert (= (and b!270908 res!134907) b!270910))

(assert (= (and b!270910 res!134902) b!270912))

(assert (= (and b!270912 res!134905) b!270909))

(assert (= (and b!270909 res!134901) b!270915))

(assert (= (and b!270915 res!134904) b!270906))

(declare-fun m!286367 () Bool)

(assert (=> b!270909 m!286367))

(declare-fun m!286369 () Bool)

(assert (=> b!270911 m!286369))

(declare-fun m!286371 () Bool)

(assert (=> b!270912 m!286371))

(declare-fun m!286373 () Bool)

(assert (=> b!270913 m!286373))

(declare-fun m!286375 () Bool)

(assert (=> b!270906 m!286375))

(declare-fun m!286377 () Bool)

(assert (=> b!270907 m!286377))

(declare-fun m!286379 () Bool)

(assert (=> b!270915 m!286379))

(declare-fun m!286381 () Bool)

(assert (=> start!26204 m!286381))

(declare-fun m!286383 () Bool)

(assert (=> start!26204 m!286383))

(declare-fun m!286385 () Bool)

(assert (=> b!270916 m!286385))

(declare-fun m!286387 () Bool)

(assert (=> b!270914 m!286387))

(declare-fun m!286389 () Bool)

(assert (=> b!270908 m!286389))

(assert (=> b!270908 m!286389))

(declare-fun m!286391 () Bool)

(assert (=> b!270908 m!286391))

(check-sat (not b!270914) (not b!270916) (not b!270913) (not b!270907) (not b!270911) (not b!270908) (not b!270909) (not start!26204) (not b!270915) (not b!270912) (not b!270906))
(check-sat)
