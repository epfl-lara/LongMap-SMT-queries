; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26282 () Bool)

(assert start!26282)

(declare-fun b!272052 () Bool)

(declare-fun e!174675 () Bool)

(declare-fun e!174674 () Bool)

(assert (=> b!272052 (= e!174675 e!174674)))

(declare-fun res!136102 () Bool)

(assert (=> b!272052 (=> (not res!136102) (not e!174674))))

(declare-datatypes ((SeekEntryResult!1490 0))(
  ( (MissingZero!1490 (index!8130 (_ BitVec 32))) (Found!1490 (index!8131 (_ BitVec 32))) (Intermediate!1490 (undefined!2302 Bool) (index!8132 (_ BitVec 32)) (x!26470 (_ BitVec 32))) (Undefined!1490) (MissingVacant!1490 (index!8133 (_ BitVec 32))) )
))
(declare-fun lt!135767 () SeekEntryResult!1490)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272052 (= res!136102 (or (= lt!135767 (MissingZero!1490 i!1267)) (= lt!135767 (MissingVacant!1490 i!1267))))))

(declare-datatypes ((array!13368 0))(
  ( (array!13369 (arr!6333 (Array (_ BitVec 32) (_ BitVec 64))) (size!6686 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13368)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13368 (_ BitVec 32)) SeekEntryResult!1490)

(assert (=> b!272052 (= lt!135767 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272053 () Bool)

(declare-fun res!136099 () Bool)

(assert (=> b!272053 (=> (not res!136099) (not e!174675))))

(declare-datatypes ((List!4114 0))(
  ( (Nil!4111) (Cons!4110 (h!4777 (_ BitVec 64)) (t!9187 List!4114)) )
))
(declare-fun arrayNoDuplicates!0 (array!13368 (_ BitVec 32) List!4114) Bool)

(assert (=> b!272053 (= res!136099 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4111))))

(declare-fun b!272055 () Bool)

(declare-fun res!136100 () Bool)

(assert (=> b!272055 (=> (not res!136100) (not e!174675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272055 (= res!136100 (validKeyInArray!0 k0!2581))))

(declare-fun b!272056 () Bool)

(declare-fun res!136101 () Bool)

(assert (=> b!272056 (=> (not res!136101) (not e!174675))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272056 (= res!136101 (and (= (size!6686 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6686 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6686 a!3325))))))

(declare-fun b!272057 () Bool)

(declare-fun res!136097 () Bool)

(assert (=> b!272057 (=> (not res!136097) (not e!174674))))

(assert (=> b!272057 (= res!136097 (validKeyInArray!0 (select (arr!6333 a!3325) startIndex!26)))))

(declare-fun b!272058 () Bool)

(declare-fun res!136095 () Bool)

(assert (=> b!272058 (=> (not res!136095) (not e!174675))))

(declare-fun arrayContainsKey!0 (array!13368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272058 (= res!136095 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272059 () Bool)

(declare-fun res!136094 () Bool)

(assert (=> b!272059 (=> (not res!136094) (not e!174674))))

(assert (=> b!272059 (= res!136094 (not (= startIndex!26 i!1267)))))

(declare-fun b!272060 () Bool)

(declare-fun res!136096 () Bool)

(assert (=> b!272060 (=> (not res!136096) (not e!174674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13368 (_ BitVec 32)) Bool)

(assert (=> b!272060 (= res!136096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272054 () Bool)

(assert (=> b!272054 (= e!174674 (not true))))

(assert (=> b!272054 (arrayNoDuplicates!0 (array!13369 (store (arr!6333 a!3325) i!1267 k0!2581) (size!6686 a!3325)) #b00000000000000000000000000000000 Nil!4111)))

(declare-datatypes ((Unit!8433 0))(
  ( (Unit!8434) )
))
(declare-fun lt!135768 () Unit!8433)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4114) Unit!8433)

(assert (=> b!272054 (= lt!135768 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4111))))

(declare-fun res!136098 () Bool)

(assert (=> start!26282 (=> (not res!136098) (not e!174675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26282 (= res!136098 (validMask!0 mask!3868))))

(assert (=> start!26282 e!174675))

(declare-fun array_inv!4305 (array!13368) Bool)

(assert (=> start!26282 (array_inv!4305 a!3325)))

(assert (=> start!26282 true))

(assert (= (and start!26282 res!136098) b!272056))

(assert (= (and b!272056 res!136101) b!272055))

(assert (= (and b!272055 res!136100) b!272053))

(assert (= (and b!272053 res!136099) b!272058))

(assert (= (and b!272058 res!136095) b!272052))

(assert (= (and b!272052 res!136102) b!272060))

(assert (= (and b!272060 res!136096) b!272059))

(assert (= (and b!272059 res!136094) b!272057))

(assert (= (and b!272057 res!136097) b!272054))

(declare-fun m!286733 () Bool)

(assert (=> b!272053 m!286733))

(declare-fun m!286735 () Bool)

(assert (=> b!272058 m!286735))

(declare-fun m!286737 () Bool)

(assert (=> b!272060 m!286737))

(declare-fun m!286739 () Bool)

(assert (=> b!272052 m!286739))

(declare-fun m!286741 () Bool)

(assert (=> b!272057 m!286741))

(assert (=> b!272057 m!286741))

(declare-fun m!286743 () Bool)

(assert (=> b!272057 m!286743))

(declare-fun m!286745 () Bool)

(assert (=> b!272055 m!286745))

(declare-fun m!286747 () Bool)

(assert (=> b!272054 m!286747))

(declare-fun m!286749 () Bool)

(assert (=> b!272054 m!286749))

(declare-fun m!286751 () Bool)

(assert (=> b!272054 m!286751))

(declare-fun m!286753 () Bool)

(assert (=> start!26282 m!286753))

(declare-fun m!286755 () Bool)

(assert (=> start!26282 m!286755))

(check-sat (not b!272055) (not start!26282) (not b!272057) (not b!272053) (not b!272058) (not b!272052) (not b!272060) (not b!272054))
(check-sat)
