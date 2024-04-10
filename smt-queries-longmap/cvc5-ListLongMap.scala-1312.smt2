; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26430 () Bool)

(assert start!26430)

(declare-fun b!274226 () Bool)

(declare-fun res!138222 () Bool)

(declare-fun e!175607 () Bool)

(assert (=> b!274226 (=> (not res!138222) (not e!175607))))

(declare-datatypes ((array!13527 0))(
  ( (array!13528 (arr!6413 (Array (_ BitVec 32) (_ BitVec 64))) (size!6765 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13527)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274226 (= res!138222 (validKeyInArray!0 (select (arr!6413 a!3325) startIndex!26)))))

(declare-fun b!274227 () Bool)

(declare-fun e!175610 () Bool)

(assert (=> b!274227 (= e!175610 true)))

(declare-fun lt!136822 () array!13527)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13527 (_ BitVec 32)) Bool)

(assert (=> b!274227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136822 mask!3868)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((Unit!8629 0))(
  ( (Unit!8630) )
))
(declare-fun lt!136824 () Unit!8629)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8629)

(assert (=> b!274227 (= lt!136824 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274228 () Bool)

(assert (=> b!274228 (= e!175607 (not e!175610))))

(declare-fun res!138219 () Bool)

(assert (=> b!274228 (=> res!138219 e!175610)))

(assert (=> b!274228 (= res!138219 (or (bvsge startIndex!26 (bvsub (size!6765 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274228 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136821 () Unit!8629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8629)

(assert (=> b!274228 (= lt!136821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1571 0))(
  ( (MissingZero!1571 (index!8454 (_ BitVec 32))) (Found!1571 (index!8455 (_ BitVec 32))) (Intermediate!1571 (undefined!2383 Bool) (index!8456 (_ BitVec 32)) (x!26752 (_ BitVec 32))) (Undefined!1571) (MissingVacant!1571 (index!8457 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13527 (_ BitVec 32)) SeekEntryResult!1571)

(assert (=> b!274228 (= (seekEntryOrOpen!0 (select (arr!6413 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6413 a!3325) i!1267 k!2581) startIndex!26) lt!136822 mask!3868))))

(declare-fun lt!136823 () Unit!8629)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8629)

(assert (=> b!274228 (= lt!136823 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4221 0))(
  ( (Nil!4218) (Cons!4217 (h!4884 (_ BitVec 64)) (t!9303 List!4221)) )
))
(declare-fun arrayNoDuplicates!0 (array!13527 (_ BitVec 32) List!4221) Bool)

(assert (=> b!274228 (arrayNoDuplicates!0 lt!136822 #b00000000000000000000000000000000 Nil!4218)))

(declare-fun lt!136825 () Unit!8629)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4221) Unit!8629)

(assert (=> b!274228 (= lt!136825 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4218))))

(declare-fun b!274229 () Bool)

(declare-fun res!138221 () Bool)

(declare-fun e!175608 () Bool)

(assert (=> b!274229 (=> (not res!138221) (not e!175608))))

(assert (=> b!274229 (= res!138221 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4218))))

(declare-fun b!274230 () Bool)

(declare-fun e!175606 () Bool)

(assert (=> b!274230 (= e!175606 e!175607)))

(declare-fun res!138220 () Bool)

(assert (=> b!274230 (=> (not res!138220) (not e!175607))))

(assert (=> b!274230 (= res!138220 (not (= startIndex!26 i!1267)))))

(assert (=> b!274230 (= lt!136822 (array!13528 (store (arr!6413 a!3325) i!1267 k!2581) (size!6765 a!3325)))))

(declare-fun b!274231 () Bool)

(declare-fun res!138216 () Bool)

(assert (=> b!274231 (=> (not res!138216) (not e!175608))))

(declare-fun arrayContainsKey!0 (array!13527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274231 (= res!138216 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138225 () Bool)

(assert (=> start!26430 (=> (not res!138225) (not e!175608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26430 (= res!138225 (validMask!0 mask!3868))))

(assert (=> start!26430 e!175608))

(declare-fun array_inv!4376 (array!13527) Bool)

(assert (=> start!26430 (array_inv!4376 a!3325)))

(assert (=> start!26430 true))

(declare-fun b!274232 () Bool)

(declare-fun res!138217 () Bool)

(assert (=> b!274232 (=> (not res!138217) (not e!175608))))

(assert (=> b!274232 (= res!138217 (and (= (size!6765 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6765 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6765 a!3325))))))

(declare-fun b!274233 () Bool)

(declare-fun res!138218 () Bool)

(assert (=> b!274233 (=> (not res!138218) (not e!175608))))

(assert (=> b!274233 (= res!138218 (validKeyInArray!0 k!2581))))

(declare-fun b!274234 () Bool)

(declare-fun res!138224 () Bool)

(assert (=> b!274234 (=> (not res!138224) (not e!175606))))

(assert (=> b!274234 (= res!138224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274235 () Bool)

(assert (=> b!274235 (= e!175608 e!175606)))

(declare-fun res!138223 () Bool)

(assert (=> b!274235 (=> (not res!138223) (not e!175606))))

(declare-fun lt!136820 () SeekEntryResult!1571)

(assert (=> b!274235 (= res!138223 (or (= lt!136820 (MissingZero!1571 i!1267)) (= lt!136820 (MissingVacant!1571 i!1267))))))

(assert (=> b!274235 (= lt!136820 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26430 res!138225) b!274232))

(assert (= (and b!274232 res!138217) b!274233))

(assert (= (and b!274233 res!138218) b!274229))

(assert (= (and b!274229 res!138221) b!274231))

(assert (= (and b!274231 res!138216) b!274235))

(assert (= (and b!274235 res!138223) b!274234))

(assert (= (and b!274234 res!138224) b!274230))

(assert (= (and b!274230 res!138220) b!274226))

(assert (= (and b!274226 res!138222) b!274228))

(assert (= (and b!274228 (not res!138219)) b!274227))

(declare-fun m!289677 () Bool)

(assert (=> b!274229 m!289677))

(declare-fun m!289679 () Bool)

(assert (=> b!274231 m!289679))

(declare-fun m!289681 () Bool)

(assert (=> b!274227 m!289681))

(declare-fun m!289683 () Bool)

(assert (=> b!274227 m!289683))

(declare-fun m!289685 () Bool)

(assert (=> start!26430 m!289685))

(declare-fun m!289687 () Bool)

(assert (=> start!26430 m!289687))

(declare-fun m!289689 () Bool)

(assert (=> b!274228 m!289689))

(declare-fun m!289691 () Bool)

(assert (=> b!274228 m!289691))

(declare-fun m!289693 () Bool)

(assert (=> b!274228 m!289693))

(assert (=> b!274228 m!289691))

(declare-fun m!289695 () Bool)

(assert (=> b!274228 m!289695))

(declare-fun m!289697 () Bool)

(assert (=> b!274228 m!289697))

(declare-fun m!289699 () Bool)

(assert (=> b!274228 m!289699))

(declare-fun m!289701 () Bool)

(assert (=> b!274228 m!289701))

(declare-fun m!289703 () Bool)

(assert (=> b!274228 m!289703))

(declare-fun m!289705 () Bool)

(assert (=> b!274228 m!289705))

(assert (=> b!274228 m!289699))

(declare-fun m!289707 () Bool)

(assert (=> b!274228 m!289707))

(declare-fun m!289709 () Bool)

(assert (=> b!274233 m!289709))

(declare-fun m!289711 () Bool)

(assert (=> b!274234 m!289711))

(declare-fun m!289713 () Bool)

(assert (=> b!274235 m!289713))

(assert (=> b!274230 m!289695))

(assert (=> b!274226 m!289699))

(assert (=> b!274226 m!289699))

(declare-fun m!289715 () Bool)

(assert (=> b!274226 m!289715))

(push 1)

