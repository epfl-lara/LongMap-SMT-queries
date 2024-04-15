; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26696 () Bool)

(assert start!26696)

(declare-fun b!276941 () Bool)

(declare-fun res!140967 () Bool)

(declare-fun e!176809 () Bool)

(assert (=> b!276941 (=> (not res!140967) (not e!176809))))

(declare-datatypes ((array!13782 0))(
  ( (array!13783 (arr!6540 (Array (_ BitVec 32) (_ BitVec 64))) (size!6893 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13782)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276941 (= res!140967 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276942 () Bool)

(declare-fun e!176810 () Bool)

(assert (=> b!276942 (= e!176810 false)))

(declare-datatypes ((Unit!8664 0))(
  ( (Unit!8665) )
))
(declare-fun lt!137651 () Unit!8664)

(declare-fun e!176808 () Unit!8664)

(assert (=> b!276942 (= lt!137651 e!176808)))

(declare-fun c!45541 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276942 (= c!45541 (bvslt startIndex!26 (bvsub (size!6893 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!276943 () Bool)

(declare-fun res!140968 () Bool)

(assert (=> b!276943 (=> (not res!140968) (not e!176809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276943 (= res!140968 (validKeyInArray!0 k0!2581))))

(declare-fun b!276944 () Bool)

(declare-fun res!140966 () Bool)

(assert (=> b!276944 (=> (not res!140966) (not e!176810))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13782 (_ BitVec 32)) Bool)

(assert (=> b!276944 (= res!140966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276945 () Bool)

(declare-fun lt!137652 () Unit!8664)

(assert (=> b!276945 (= e!176808 lt!137652)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13782 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8664)

(assert (=> b!276945 (= lt!137652 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!276945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13783 (store (arr!6540 a!3325) i!1267 k0!2581) (size!6893 a!3325)) mask!3868)))

(declare-fun b!276946 () Bool)

(declare-fun res!140964 () Bool)

(assert (=> b!276946 (=> (not res!140964) (not e!176809))))

(declare-datatypes ((List!4321 0))(
  ( (Nil!4318) (Cons!4317 (h!4984 (_ BitVec 64)) (t!9394 List!4321)) )
))
(declare-fun arrayNoDuplicates!0 (array!13782 (_ BitVec 32) List!4321) Bool)

(assert (=> b!276946 (= res!140964 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4318))))

(declare-fun res!140962 () Bool)

(assert (=> start!26696 (=> (not res!140962) (not e!176809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26696 (= res!140962 (validMask!0 mask!3868))))

(assert (=> start!26696 e!176809))

(declare-fun array_inv!4512 (array!13782) Bool)

(assert (=> start!26696 (array_inv!4512 a!3325)))

(assert (=> start!26696 true))

(declare-fun b!276947 () Bool)

(assert (=> b!276947 (= e!176809 e!176810)))

(declare-fun res!140965 () Bool)

(assert (=> b!276947 (=> (not res!140965) (not e!176810))))

(declare-datatypes ((SeekEntryResult!1697 0))(
  ( (MissingZero!1697 (index!8958 (_ BitVec 32))) (Found!1697 (index!8959 (_ BitVec 32))) (Intermediate!1697 (undefined!2509 Bool) (index!8960 (_ BitVec 32)) (x!27229 (_ BitVec 32))) (Undefined!1697) (MissingVacant!1697 (index!8961 (_ BitVec 32))) )
))
(declare-fun lt!137650 () SeekEntryResult!1697)

(assert (=> b!276947 (= res!140965 (or (= lt!137650 (MissingZero!1697 i!1267)) (= lt!137650 (MissingVacant!1697 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13782 (_ BitVec 32)) SeekEntryResult!1697)

(assert (=> b!276947 (= lt!137650 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276948 () Bool)

(declare-fun res!140961 () Bool)

(assert (=> b!276948 (=> (not res!140961) (not e!176809))))

(assert (=> b!276948 (= res!140961 (and (= (size!6893 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6893 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6893 a!3325))))))

(declare-fun b!276949 () Bool)

(declare-fun Unit!8666 () Unit!8664)

(assert (=> b!276949 (= e!176808 Unit!8666)))

(declare-fun b!276950 () Bool)

(declare-fun res!140963 () Bool)

(assert (=> b!276950 (=> (not res!140963) (not e!176810))))

(assert (=> b!276950 (= res!140963 (= startIndex!26 i!1267))))

(assert (= (and start!26696 res!140962) b!276948))

(assert (= (and b!276948 res!140961) b!276943))

(assert (= (and b!276943 res!140968) b!276946))

(assert (= (and b!276946 res!140964) b!276941))

(assert (= (and b!276941 res!140967) b!276947))

(assert (= (and b!276947 res!140965) b!276944))

(assert (= (and b!276944 res!140966) b!276950))

(assert (= (and b!276950 res!140963) b!276942))

(assert (= (and b!276942 c!45541) b!276945))

(assert (= (and b!276942 (not c!45541)) b!276949))

(declare-fun m!291659 () Bool)

(assert (=> b!276943 m!291659))

(declare-fun m!291661 () Bool)

(assert (=> b!276945 m!291661))

(declare-fun m!291663 () Bool)

(assert (=> b!276945 m!291663))

(declare-fun m!291665 () Bool)

(assert (=> b!276945 m!291665))

(declare-fun m!291667 () Bool)

(assert (=> b!276944 m!291667))

(declare-fun m!291669 () Bool)

(assert (=> b!276946 m!291669))

(declare-fun m!291671 () Bool)

(assert (=> b!276941 m!291671))

(declare-fun m!291673 () Bool)

(assert (=> start!26696 m!291673))

(declare-fun m!291675 () Bool)

(assert (=> start!26696 m!291675))

(declare-fun m!291677 () Bool)

(assert (=> b!276947 m!291677))

(check-sat (not b!276941) (not b!276946) (not b!276947) (not b!276943) (not b!276945) (not start!26696) (not b!276944))
(check-sat)
