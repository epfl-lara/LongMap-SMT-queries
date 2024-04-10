; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25946 () Bool)

(assert start!25946)

(declare-fun b!267832 () Bool)

(declare-fun res!132111 () Bool)

(declare-fun e!173123 () Bool)

(assert (=> b!267832 (=> (not res!132111) (not e!173123))))

(declare-datatypes ((array!13043 0))(
  ( (array!13044 (arr!6171 (Array (_ BitVec 32) (_ BitVec 64))) (size!6523 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13043)

(declare-datatypes ((List!3979 0))(
  ( (Nil!3976) (Cons!3975 (h!4642 (_ BitVec 64)) (t!9061 List!3979)) )
))
(declare-fun arrayNoDuplicates!0 (array!13043 (_ BitVec 32) List!3979) Bool)

(assert (=> b!267832 (= res!132111 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3976))))

(declare-fun res!132113 () Bool)

(assert (=> start!25946 (=> (not res!132113) (not e!173123))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25946 (= res!132113 (validMask!0 mask!3868))))

(assert (=> start!25946 e!173123))

(declare-fun array_inv!4134 (array!13043) Bool)

(assert (=> start!25946 (array_inv!4134 a!3325)))

(assert (=> start!25946 true))

(declare-fun b!267833 () Bool)

(assert (=> b!267833 (= e!173123 false)))

(declare-datatypes ((SeekEntryResult!1329 0))(
  ( (MissingZero!1329 (index!7486 (_ BitVec 32))) (Found!1329 (index!7487 (_ BitVec 32))) (Intermediate!1329 (undefined!2141 Bool) (index!7488 (_ BitVec 32)) (x!25862 (_ BitVec 32))) (Undefined!1329) (MissingVacant!1329 (index!7489 (_ BitVec 32))) )
))
(declare-fun lt!134743 () SeekEntryResult!1329)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13043 (_ BitVec 32)) SeekEntryResult!1329)

(assert (=> b!267833 (= lt!134743 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!267834 () Bool)

(declare-fun res!132112 () Bool)

(assert (=> b!267834 (=> (not res!132112) (not e!173123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267834 (= res!132112 (validKeyInArray!0 k0!2581))))

(declare-fun b!267835 () Bool)

(declare-fun res!132114 () Bool)

(assert (=> b!267835 (=> (not res!132114) (not e!173123))))

(declare-fun arrayContainsKey!0 (array!13043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267835 (= res!132114 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267836 () Bool)

(declare-fun res!132110 () Bool)

(assert (=> b!267836 (=> (not res!132110) (not e!173123))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267836 (= res!132110 (and (= (size!6523 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6523 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6523 a!3325))))))

(assert (= (and start!25946 res!132113) b!267836))

(assert (= (and b!267836 res!132110) b!267834))

(assert (= (and b!267834 res!132112) b!267832))

(assert (= (and b!267832 res!132111) b!267835))

(assert (= (and b!267835 res!132114) b!267833))

(declare-fun m!284103 () Bool)

(assert (=> b!267834 m!284103))

(declare-fun m!284105 () Bool)

(assert (=> b!267835 m!284105))

(declare-fun m!284107 () Bool)

(assert (=> start!25946 m!284107))

(declare-fun m!284109 () Bool)

(assert (=> start!25946 m!284109))

(declare-fun m!284111 () Bool)

(assert (=> b!267832 m!284111))

(declare-fun m!284113 () Bool)

(assert (=> b!267833 m!284113))

(check-sat (not b!267832) (not b!267834) (not start!25946) (not b!267835) (not b!267833))
