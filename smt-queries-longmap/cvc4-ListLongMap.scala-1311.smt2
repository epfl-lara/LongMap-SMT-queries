; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26428 () Bool)

(assert start!26428)

(declare-fun b!274197 () Bool)

(declare-fun res!138187 () Bool)

(declare-fun e!175594 () Bool)

(assert (=> b!274197 (=> (not res!138187) (not e!175594))))

(declare-datatypes ((array!13525 0))(
  ( (array!13526 (arr!6412 (Array (_ BitVec 32) (_ BitVec 64))) (size!6764 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13525)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274197 (= res!138187 (validKeyInArray!0 (select (arr!6412 a!3325) startIndex!26)))))

(declare-fun b!274198 () Bool)

(declare-fun res!138195 () Bool)

(declare-fun e!175592 () Bool)

(assert (=> b!274198 (=> (not res!138195) (not e!175592))))

(declare-datatypes ((List!4220 0))(
  ( (Nil!4217) (Cons!4216 (h!4883 (_ BitVec 64)) (t!9302 List!4220)) )
))
(declare-fun arrayNoDuplicates!0 (array!13525 (_ BitVec 32) List!4220) Bool)

(assert (=> b!274198 (= res!138195 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4217))))

(declare-fun b!274199 () Bool)

(declare-fun res!138192 () Bool)

(assert (=> b!274199 (=> (not res!138192) (not e!175592))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!274199 (= res!138192 (validKeyInArray!0 k!2581))))

(declare-fun b!274200 () Bool)

(declare-fun res!138193 () Bool)

(assert (=> b!274200 (=> (not res!138193) (not e!175592))))

(declare-fun arrayContainsKey!0 (array!13525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274200 (= res!138193 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274201 () Bool)

(declare-fun res!138190 () Bool)

(declare-fun e!175593 () Bool)

(assert (=> b!274201 (=> (not res!138190) (not e!175593))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13525 (_ BitVec 32)) Bool)

(assert (=> b!274201 (= res!138190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274202 () Bool)

(assert (=> b!274202 (= e!175592 e!175593)))

(declare-fun res!138188 () Bool)

(assert (=> b!274202 (=> (not res!138188) (not e!175593))))

(declare-datatypes ((SeekEntryResult!1570 0))(
  ( (MissingZero!1570 (index!8450 (_ BitVec 32))) (Found!1570 (index!8451 (_ BitVec 32))) (Intermediate!1570 (undefined!2382 Bool) (index!8452 (_ BitVec 32)) (x!26743 (_ BitVec 32))) (Undefined!1570) (MissingVacant!1570 (index!8453 (_ BitVec 32))) )
))
(declare-fun lt!136806 () SeekEntryResult!1570)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274202 (= res!138188 (or (= lt!136806 (MissingZero!1570 i!1267)) (= lt!136806 (MissingVacant!1570 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13525 (_ BitVec 32)) SeekEntryResult!1570)

(assert (=> b!274202 (= lt!136806 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274203 () Bool)

(assert (=> b!274203 (= e!175594 (not true))))

(assert (=> b!274203 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8627 0))(
  ( (Unit!8628) )
))
(declare-fun lt!136807 () Unit!8627)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274203 (= lt!136807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136803 () array!13525)

(assert (=> b!274203 (= (seekEntryOrOpen!0 (select (arr!6412 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6412 a!3325) i!1267 k!2581) startIndex!26) lt!136803 mask!3868))))

(declare-fun lt!136805 () Unit!8627)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13525 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274203 (= lt!136805 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274203 (arrayNoDuplicates!0 lt!136803 #b00000000000000000000000000000000 Nil!4217)))

(declare-fun lt!136804 () Unit!8627)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13525 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4220) Unit!8627)

(assert (=> b!274203 (= lt!136804 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4217))))

(declare-fun b!274204 () Bool)

(declare-fun res!138194 () Bool)

(assert (=> b!274204 (=> (not res!138194) (not e!175592))))

(assert (=> b!274204 (= res!138194 (and (= (size!6764 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6764 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6764 a!3325))))))

(declare-fun b!274205 () Bool)

(assert (=> b!274205 (= e!175593 e!175594)))

(declare-fun res!138189 () Bool)

(assert (=> b!274205 (=> (not res!138189) (not e!175594))))

(assert (=> b!274205 (= res!138189 (not (= startIndex!26 i!1267)))))

(assert (=> b!274205 (= lt!136803 (array!13526 (store (arr!6412 a!3325) i!1267 k!2581) (size!6764 a!3325)))))

(declare-fun res!138191 () Bool)

(assert (=> start!26428 (=> (not res!138191) (not e!175592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26428 (= res!138191 (validMask!0 mask!3868))))

(assert (=> start!26428 e!175592))

(declare-fun array_inv!4375 (array!13525) Bool)

(assert (=> start!26428 (array_inv!4375 a!3325)))

(assert (=> start!26428 true))

(assert (= (and start!26428 res!138191) b!274204))

(assert (= (and b!274204 res!138194) b!274199))

(assert (= (and b!274199 res!138192) b!274198))

(assert (= (and b!274198 res!138195) b!274200))

(assert (= (and b!274200 res!138193) b!274202))

(assert (= (and b!274202 res!138188) b!274201))

(assert (= (and b!274201 res!138190) b!274205))

(assert (= (and b!274205 res!138189) b!274197))

(assert (= (and b!274197 res!138187) b!274203))

(declare-fun m!289641 () Bool)

(assert (=> b!274201 m!289641))

(declare-fun m!289643 () Bool)

(assert (=> b!274205 m!289643))

(declare-fun m!289645 () Bool)

(assert (=> start!26428 m!289645))

(declare-fun m!289647 () Bool)

(assert (=> start!26428 m!289647))

(declare-fun m!289649 () Bool)

(assert (=> b!274202 m!289649))

(declare-fun m!289651 () Bool)

(assert (=> b!274198 m!289651))

(declare-fun m!289653 () Bool)

(assert (=> b!274200 m!289653))

(declare-fun m!289655 () Bool)

(assert (=> b!274197 m!289655))

(assert (=> b!274197 m!289655))

(declare-fun m!289657 () Bool)

(assert (=> b!274197 m!289657))

(declare-fun m!289659 () Bool)

(assert (=> b!274199 m!289659))

(declare-fun m!289661 () Bool)

(assert (=> b!274203 m!289661))

(declare-fun m!289663 () Bool)

(assert (=> b!274203 m!289663))

(declare-fun m!289665 () Bool)

(assert (=> b!274203 m!289665))

(assert (=> b!274203 m!289643))

(assert (=> b!274203 m!289655))

(declare-fun m!289667 () Bool)

(assert (=> b!274203 m!289667))

(declare-fun m!289669 () Bool)

(assert (=> b!274203 m!289669))

(assert (=> b!274203 m!289655))

(declare-fun m!289671 () Bool)

(assert (=> b!274203 m!289671))

(assert (=> b!274203 m!289665))

(declare-fun m!289673 () Bool)

(assert (=> b!274203 m!289673))

(declare-fun m!289675 () Bool)

(assert (=> b!274203 m!289675))

(push 1)

