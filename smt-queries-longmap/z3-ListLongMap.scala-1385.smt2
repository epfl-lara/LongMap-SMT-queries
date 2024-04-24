; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27162 () Bool)

(assert start!27162)

(declare-fun b!281060 () Bool)

(declare-fun res!144107 () Bool)

(declare-fun e!178757 () Bool)

(assert (=> b!281060 (=> (not res!144107) (not e!178757))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281060 (= res!144107 (not (= startIndex!26 i!1267)))))

(declare-fun b!281062 () Bool)

(assert (=> b!281062 (= e!178757 (not true))))

(declare-datatypes ((array!13979 0))(
  ( (array!13980 (arr!6631 (Array (_ BitVec 32) (_ BitVec 64))) (size!6983 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13979)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4352 0))(
  ( (Nil!4349) (Cons!4348 (h!5018 (_ BitVec 64)) (t!9426 List!4352)) )
))
(declare-fun arrayNoDuplicates!0 (array!13979 (_ BitVec 32) List!4352) Bool)

(assert (=> b!281062 (arrayNoDuplicates!0 (array!13980 (store (arr!6631 a!3325) i!1267 k0!2581) (size!6983 a!3325)) #b00000000000000000000000000000000 Nil!4349)))

(declare-datatypes ((Unit!8838 0))(
  ( (Unit!8839) )
))
(declare-fun lt!139013 () Unit!8838)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13979 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4352) Unit!8838)

(assert (=> b!281062 (= lt!139013 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4349))))

(declare-fun b!281063 () Bool)

(declare-fun res!144109 () Bool)

(declare-fun e!178756 () Bool)

(assert (=> b!281063 (=> (not res!144109) (not e!178756))))

(assert (=> b!281063 (= res!144109 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4349))))

(declare-fun b!281064 () Bool)

(declare-fun res!144104 () Bool)

(assert (=> b!281064 (=> (not res!144104) (not e!178757))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13979 (_ BitVec 32)) Bool)

(assert (=> b!281064 (= res!144104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281065 () Bool)

(declare-fun res!144103 () Bool)

(assert (=> b!281065 (=> (not res!144103) (not e!178756))))

(declare-fun arrayContainsKey!0 (array!13979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281065 (= res!144103 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281066 () Bool)

(declare-fun res!144106 () Bool)

(assert (=> b!281066 (=> (not res!144106) (not e!178756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281066 (= res!144106 (validKeyInArray!0 k0!2581))))

(declare-fun b!281061 () Bool)

(declare-fun res!144110 () Bool)

(assert (=> b!281061 (=> (not res!144110) (not e!178756))))

(assert (=> b!281061 (= res!144110 (and (= (size!6983 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6983 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6983 a!3325))))))

(declare-fun res!144105 () Bool)

(assert (=> start!27162 (=> (not res!144105) (not e!178756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27162 (= res!144105 (validMask!0 mask!3868))))

(assert (=> start!27162 e!178756))

(declare-fun array_inv!4581 (array!13979) Bool)

(assert (=> start!27162 (array_inv!4581 a!3325)))

(assert (=> start!27162 true))

(declare-fun b!281067 () Bool)

(assert (=> b!281067 (= e!178756 e!178757)))

(declare-fun res!144111 () Bool)

(assert (=> b!281067 (=> (not res!144111) (not e!178757))))

(declare-datatypes ((SeekEntryResult!1754 0))(
  ( (MissingZero!1754 (index!9186 (_ BitVec 32))) (Found!1754 (index!9187 (_ BitVec 32))) (Intermediate!1754 (undefined!2566 Bool) (index!9188 (_ BitVec 32)) (x!27528 (_ BitVec 32))) (Undefined!1754) (MissingVacant!1754 (index!9189 (_ BitVec 32))) )
))
(declare-fun lt!139014 () SeekEntryResult!1754)

(assert (=> b!281067 (= res!144111 (or (= lt!139014 (MissingZero!1754 i!1267)) (= lt!139014 (MissingVacant!1754 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13979 (_ BitVec 32)) SeekEntryResult!1754)

(assert (=> b!281067 (= lt!139014 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281068 () Bool)

(declare-fun res!144108 () Bool)

(assert (=> b!281068 (=> (not res!144108) (not e!178757))))

(assert (=> b!281068 (= res!144108 (validKeyInArray!0 (select (arr!6631 a!3325) startIndex!26)))))

(assert (= (and start!27162 res!144105) b!281061))

(assert (= (and b!281061 res!144110) b!281066))

(assert (= (and b!281066 res!144106) b!281063))

(assert (= (and b!281063 res!144109) b!281065))

(assert (= (and b!281065 res!144103) b!281067))

(assert (= (and b!281067 res!144111) b!281064))

(assert (= (and b!281064 res!144104) b!281060))

(assert (= (and b!281060 res!144107) b!281068))

(assert (= (and b!281068 res!144108) b!281062))

(declare-fun m!295589 () Bool)

(assert (=> b!281066 m!295589))

(declare-fun m!295591 () Bool)

(assert (=> b!281062 m!295591))

(declare-fun m!295593 () Bool)

(assert (=> b!281062 m!295593))

(declare-fun m!295595 () Bool)

(assert (=> b!281062 m!295595))

(declare-fun m!295597 () Bool)

(assert (=> b!281064 m!295597))

(declare-fun m!295599 () Bool)

(assert (=> start!27162 m!295599))

(declare-fun m!295601 () Bool)

(assert (=> start!27162 m!295601))

(declare-fun m!295603 () Bool)

(assert (=> b!281065 m!295603))

(declare-fun m!295605 () Bool)

(assert (=> b!281068 m!295605))

(assert (=> b!281068 m!295605))

(declare-fun m!295607 () Bool)

(assert (=> b!281068 m!295607))

(declare-fun m!295609 () Bool)

(assert (=> b!281063 m!295609))

(declare-fun m!295611 () Bool)

(assert (=> b!281067 m!295611))

(check-sat (not b!281065) (not b!281066) (not b!281068) (not b!281062) (not start!27162) (not b!281067) (not b!281064) (not b!281063))
(check-sat)
