; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26086 () Bool)

(assert start!26086)

(declare-fun b!269043 () Bool)

(declare-fun res!133323 () Bool)

(declare-fun e!173686 () Bool)

(assert (=> b!269043 (=> (not res!133323) (not e!173686))))

(declare-datatypes ((array!13183 0))(
  ( (array!13184 (arr!6241 (Array (_ BitVec 32) (_ BitVec 64))) (size!6593 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13183)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269043 (= res!133323 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!133325 () Bool)

(assert (=> start!26086 (=> (not res!133325) (not e!173686))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26086 (= res!133325 (validMask!0 mask!3868))))

(assert (=> start!26086 e!173686))

(declare-fun array_inv!4204 (array!13183) Bool)

(assert (=> start!26086 (array_inv!4204 a!3325)))

(assert (=> start!26086 true))

(declare-fun b!269044 () Bool)

(declare-fun res!133322 () Bool)

(assert (=> b!269044 (=> (not res!133322) (not e!173686))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269044 (= res!133322 (and (= (size!6593 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6593 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6593 a!3325))))))

(declare-fun b!269045 () Bool)

(declare-fun e!173687 () Bool)

(assert (=> b!269045 (= e!173687 false)))

(declare-fun lt!135078 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13183 (_ BitVec 32)) Bool)

(assert (=> b!269045 (= lt!135078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269046 () Bool)

(assert (=> b!269046 (= e!173686 e!173687)))

(declare-fun res!133326 () Bool)

(assert (=> b!269046 (=> (not res!133326) (not e!173687))))

(declare-datatypes ((SeekEntryResult!1399 0))(
  ( (MissingZero!1399 (index!7766 (_ BitVec 32))) (Found!1399 (index!7767 (_ BitVec 32))) (Intermediate!1399 (undefined!2211 Bool) (index!7768 (_ BitVec 32)) (x!26116 (_ BitVec 32))) (Undefined!1399) (MissingVacant!1399 (index!7769 (_ BitVec 32))) )
))
(declare-fun lt!135079 () SeekEntryResult!1399)

(assert (=> b!269046 (= res!133326 (or (= lt!135079 (MissingZero!1399 i!1267)) (= lt!135079 (MissingVacant!1399 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13183 (_ BitVec 32)) SeekEntryResult!1399)

(assert (=> b!269046 (= lt!135079 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269047 () Bool)

(declare-fun res!133321 () Bool)

(assert (=> b!269047 (=> (not res!133321) (not e!173686))))

(declare-datatypes ((List!4049 0))(
  ( (Nil!4046) (Cons!4045 (h!4712 (_ BitVec 64)) (t!9131 List!4049)) )
))
(declare-fun arrayNoDuplicates!0 (array!13183 (_ BitVec 32) List!4049) Bool)

(assert (=> b!269047 (= res!133321 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4046))))

(declare-fun b!269048 () Bool)

(declare-fun res!133324 () Bool)

(assert (=> b!269048 (=> (not res!133324) (not e!173686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269048 (= res!133324 (validKeyInArray!0 k!2581))))

(assert (= (and start!26086 res!133325) b!269044))

(assert (= (and b!269044 res!133322) b!269048))

(assert (= (and b!269048 res!133324) b!269047))

(assert (= (and b!269047 res!133321) b!269043))

(assert (= (and b!269043 res!133323) b!269046))

(assert (= (and b!269046 res!133326) b!269045))

(declare-fun m!285037 () Bool)

(assert (=> b!269048 m!285037))

(declare-fun m!285039 () Bool)

(assert (=> b!269047 m!285039))

(declare-fun m!285041 () Bool)

(assert (=> b!269046 m!285041))

(declare-fun m!285043 () Bool)

(assert (=> b!269043 m!285043))

(declare-fun m!285045 () Bool)

(assert (=> start!26086 m!285045))

(declare-fun m!285047 () Bool)

(assert (=> start!26086 m!285047))

(declare-fun m!285049 () Bool)

(assert (=> b!269045 m!285049))

(push 1)

(assert (not b!269043))

(assert (not start!26086))

(assert (not b!269047))

(assert (not b!269046))

(assert (not b!269045))

(assert (not b!269048))

