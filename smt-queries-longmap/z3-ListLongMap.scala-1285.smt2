; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26270 () Bool)

(assert start!26270)

(declare-fun b!271890 () Bool)

(declare-fun res!135932 () Bool)

(declare-fun e!174621 () Bool)

(assert (=> b!271890 (=> (not res!135932) (not e!174621))))

(declare-datatypes ((array!13356 0))(
  ( (array!13357 (arr!6327 (Array (_ BitVec 32) (_ BitVec 64))) (size!6680 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13356)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13356 (_ BitVec 32)) Bool)

(assert (=> b!271890 (= res!135932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271891 () Bool)

(declare-fun res!135937 () Bool)

(assert (=> b!271891 (=> (not res!135937) (not e!174621))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271891 (= res!135937 (validKeyInArray!0 (select (arr!6327 a!3325) startIndex!26)))))

(declare-fun b!271892 () Bool)

(assert (=> b!271892 (= e!174621 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4108 0))(
  ( (Nil!4105) (Cons!4104 (h!4771 (_ BitVec 64)) (t!9181 List!4108)) )
))
(declare-fun arrayNoDuplicates!0 (array!13356 (_ BitVec 32) List!4108) Bool)

(assert (=> b!271892 (arrayNoDuplicates!0 (array!13357 (store (arr!6327 a!3325) i!1267 k0!2581) (size!6680 a!3325)) #b00000000000000000000000000000000 Nil!4105)))

(declare-datatypes ((Unit!8421 0))(
  ( (Unit!8422) )
))
(declare-fun lt!135731 () Unit!8421)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4108) Unit!8421)

(assert (=> b!271892 (= lt!135731 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4105))))

(declare-fun b!271894 () Bool)

(declare-fun res!135936 () Bool)

(declare-fun e!174620 () Bool)

(assert (=> b!271894 (=> (not res!135936) (not e!174620))))

(assert (=> b!271894 (= res!135936 (validKeyInArray!0 k0!2581))))

(declare-fun b!271895 () Bool)

(declare-fun res!135933 () Bool)

(assert (=> b!271895 (=> (not res!135933) (not e!174621))))

(assert (=> b!271895 (= res!135933 (not (= startIndex!26 i!1267)))))

(declare-fun res!135940 () Bool)

(assert (=> start!26270 (=> (not res!135940) (not e!174620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26270 (= res!135940 (validMask!0 mask!3868))))

(assert (=> start!26270 e!174620))

(declare-fun array_inv!4299 (array!13356) Bool)

(assert (=> start!26270 (array_inv!4299 a!3325)))

(assert (=> start!26270 true))

(declare-fun b!271893 () Bool)

(declare-fun res!135934 () Bool)

(assert (=> b!271893 (=> (not res!135934) (not e!174620))))

(assert (=> b!271893 (= res!135934 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4105))))

(declare-fun b!271896 () Bool)

(assert (=> b!271896 (= e!174620 e!174621)))

(declare-fun res!135935 () Bool)

(assert (=> b!271896 (=> (not res!135935) (not e!174621))))

(declare-datatypes ((SeekEntryResult!1484 0))(
  ( (MissingZero!1484 (index!8106 (_ BitVec 32))) (Found!1484 (index!8107 (_ BitVec 32))) (Intermediate!1484 (undefined!2296 Bool) (index!8108 (_ BitVec 32)) (x!26448 (_ BitVec 32))) (Undefined!1484) (MissingVacant!1484 (index!8109 (_ BitVec 32))) )
))
(declare-fun lt!135732 () SeekEntryResult!1484)

(assert (=> b!271896 (= res!135935 (or (= lt!135732 (MissingZero!1484 i!1267)) (= lt!135732 (MissingVacant!1484 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13356 (_ BitVec 32)) SeekEntryResult!1484)

(assert (=> b!271896 (= lt!135732 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271897 () Bool)

(declare-fun res!135938 () Bool)

(assert (=> b!271897 (=> (not res!135938) (not e!174620))))

(assert (=> b!271897 (= res!135938 (and (= (size!6680 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6680 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6680 a!3325))))))

(declare-fun b!271898 () Bool)

(declare-fun res!135939 () Bool)

(assert (=> b!271898 (=> (not res!135939) (not e!174620))))

(declare-fun arrayContainsKey!0 (array!13356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271898 (= res!135939 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26270 res!135940) b!271897))

(assert (= (and b!271897 res!135938) b!271894))

(assert (= (and b!271894 res!135936) b!271893))

(assert (= (and b!271893 res!135934) b!271898))

(assert (= (and b!271898 res!135939) b!271896))

(assert (= (and b!271896 res!135935) b!271890))

(assert (= (and b!271890 res!135932) b!271895))

(assert (= (and b!271895 res!135933) b!271891))

(assert (= (and b!271891 res!135937) b!271892))

(declare-fun m!286589 () Bool)

(assert (=> b!271890 m!286589))

(declare-fun m!286591 () Bool)

(assert (=> b!271896 m!286591))

(declare-fun m!286593 () Bool)

(assert (=> b!271898 m!286593))

(declare-fun m!286595 () Bool)

(assert (=> b!271894 m!286595))

(declare-fun m!286597 () Bool)

(assert (=> start!26270 m!286597))

(declare-fun m!286599 () Bool)

(assert (=> start!26270 m!286599))

(declare-fun m!286601 () Bool)

(assert (=> b!271891 m!286601))

(assert (=> b!271891 m!286601))

(declare-fun m!286603 () Bool)

(assert (=> b!271891 m!286603))

(declare-fun m!286605 () Bool)

(assert (=> b!271893 m!286605))

(declare-fun m!286607 () Bool)

(assert (=> b!271892 m!286607))

(declare-fun m!286609 () Bool)

(assert (=> b!271892 m!286609))

(declare-fun m!286611 () Bool)

(assert (=> b!271892 m!286611))

(check-sat (not b!271893) (not b!271896) (not start!26270) (not b!271891) (not b!271894) (not b!271892) (not b!271898) (not b!271890))
(check-sat)
