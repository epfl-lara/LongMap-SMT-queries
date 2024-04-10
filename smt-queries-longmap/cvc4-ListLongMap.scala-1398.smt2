; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27244 () Bool)

(assert start!27244)

(declare-fun b!282120 () Bool)

(declare-fun res!145193 () Bool)

(declare-fun e!179173 () Bool)

(assert (=> b!282120 (=> (not res!145193) (not e!179173))))

(declare-datatypes ((array!14062 0))(
  ( (array!14063 (arr!6673 (Array (_ BitVec 32) (_ BitVec 64))) (size!7025 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14062)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282120 (= res!145193 (validKeyInArray!0 (select (arr!6673 a!3325) startIndex!26)))))

(declare-fun b!282121 () Bool)

(declare-fun res!145189 () Bool)

(declare-fun e!179172 () Bool)

(assert (=> b!282121 (=> (not res!145189) (not e!179172))))

(declare-datatypes ((List!4481 0))(
  ( (Nil!4478) (Cons!4477 (h!5147 (_ BitVec 64)) (t!9563 List!4481)) )
))
(declare-fun arrayNoDuplicates!0 (array!14062 (_ BitVec 32) List!4481) Bool)

(assert (=> b!282121 (= res!145189 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4478))))

(declare-fun b!282122 () Bool)

(assert (=> b!282122 (= e!179173 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14062 (_ BitVec 32)) Bool)

(assert (=> b!282122 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8946 0))(
  ( (Unit!8947) )
))
(declare-fun lt!139368 () Unit!8946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!282122 (= lt!139368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139369 () array!14062)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1831 0))(
  ( (MissingZero!1831 (index!9494 (_ BitVec 32))) (Found!1831 (index!9495 (_ BitVec 32))) (Intermediate!1831 (undefined!2643 Bool) (index!9496 (_ BitVec 32)) (x!27709 (_ BitVec 32))) (Undefined!1831) (MissingVacant!1831 (index!9497 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14062 (_ BitVec 32)) SeekEntryResult!1831)

(assert (=> b!282122 (= (seekEntryOrOpen!0 (select (arr!6673 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6673 a!3325) i!1267 k!2581) startIndex!26) lt!139369 mask!3868))))

(declare-fun lt!139371 () Unit!8946)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14062 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!282122 (= lt!139371 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282122 (arrayNoDuplicates!0 lt!139369 #b00000000000000000000000000000000 Nil!4478)))

(declare-fun lt!139372 () Unit!8946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14062 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4481) Unit!8946)

(assert (=> b!282122 (= lt!139372 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4478))))

(declare-fun b!282123 () Bool)

(declare-fun res!145195 () Bool)

(assert (=> b!282123 (=> (not res!145195) (not e!179172))))

(assert (=> b!282123 (= res!145195 (validKeyInArray!0 k!2581))))

(declare-fun b!282124 () Bool)

(declare-fun e!179171 () Bool)

(assert (=> b!282124 (= e!179171 e!179173)))

(declare-fun res!145192 () Bool)

(assert (=> b!282124 (=> (not res!145192) (not e!179173))))

(assert (=> b!282124 (= res!145192 (not (= startIndex!26 i!1267)))))

(assert (=> b!282124 (= lt!139369 (array!14063 (store (arr!6673 a!3325) i!1267 k!2581) (size!7025 a!3325)))))

(declare-fun b!282125 () Bool)

(assert (=> b!282125 (= e!179172 e!179171)))

(declare-fun res!145191 () Bool)

(assert (=> b!282125 (=> (not res!145191) (not e!179171))))

(declare-fun lt!139370 () SeekEntryResult!1831)

(assert (=> b!282125 (= res!145191 (or (= lt!139370 (MissingZero!1831 i!1267)) (= lt!139370 (MissingVacant!1831 i!1267))))))

(assert (=> b!282125 (= lt!139370 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282126 () Bool)

(declare-fun res!145190 () Bool)

(assert (=> b!282126 (=> (not res!145190) (not e!179172))))

(declare-fun arrayContainsKey!0 (array!14062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282126 (= res!145190 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282127 () Bool)

(declare-fun res!145196 () Bool)

(assert (=> b!282127 (=> (not res!145196) (not e!179171))))

(assert (=> b!282127 (= res!145196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282128 () Bool)

(declare-fun res!145194 () Bool)

(assert (=> b!282128 (=> (not res!145194) (not e!179172))))

(assert (=> b!282128 (= res!145194 (and (= (size!7025 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7025 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7025 a!3325))))))

(declare-fun res!145197 () Bool)

(assert (=> start!27244 (=> (not res!145197) (not e!179172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27244 (= res!145197 (validMask!0 mask!3868))))

(assert (=> start!27244 e!179172))

(declare-fun array_inv!4636 (array!14062) Bool)

(assert (=> start!27244 (array_inv!4636 a!3325)))

(assert (=> start!27244 true))

(assert (= (and start!27244 res!145197) b!282128))

(assert (= (and b!282128 res!145194) b!282123))

(assert (= (and b!282123 res!145195) b!282121))

(assert (= (and b!282121 res!145189) b!282126))

(assert (= (and b!282126 res!145190) b!282125))

(assert (= (and b!282125 res!145191) b!282127))

(assert (= (and b!282127 res!145196) b!282124))

(assert (= (and b!282124 res!145192) b!282120))

(assert (= (and b!282120 res!145193) b!282122))

(declare-fun m!296583 () Bool)

(assert (=> b!282125 m!296583))

(declare-fun m!296585 () Bool)

(assert (=> b!282123 m!296585))

(declare-fun m!296587 () Bool)

(assert (=> b!282122 m!296587))

(declare-fun m!296589 () Bool)

(assert (=> b!282122 m!296589))

(declare-fun m!296591 () Bool)

(assert (=> b!282122 m!296591))

(declare-fun m!296593 () Bool)

(assert (=> b!282122 m!296593))

(declare-fun m!296595 () Bool)

(assert (=> b!282122 m!296595))

(declare-fun m!296597 () Bool)

(assert (=> b!282122 m!296597))

(declare-fun m!296599 () Bool)

(assert (=> b!282122 m!296599))

(declare-fun m!296601 () Bool)

(assert (=> b!282122 m!296601))

(assert (=> b!282122 m!296597))

(declare-fun m!296603 () Bool)

(assert (=> b!282122 m!296603))

(assert (=> b!282122 m!296589))

(declare-fun m!296605 () Bool)

(assert (=> b!282122 m!296605))

(declare-fun m!296607 () Bool)

(assert (=> b!282127 m!296607))

(assert (=> b!282120 m!296597))

(assert (=> b!282120 m!296597))

(declare-fun m!296609 () Bool)

(assert (=> b!282120 m!296609))

(declare-fun m!296611 () Bool)

(assert (=> start!27244 m!296611))

(declare-fun m!296613 () Bool)

(assert (=> start!27244 m!296613))

(assert (=> b!282124 m!296593))

(declare-fun m!296615 () Bool)

(assert (=> b!282121 m!296615))

(declare-fun m!296617 () Bool)

(assert (=> b!282126 m!296617))

(push 1)

(assert (not b!282120))

