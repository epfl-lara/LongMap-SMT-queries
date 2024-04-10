; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27214 () Bool)

(assert start!27214)

(declare-fun b!281715 () Bool)

(declare-fun res!144786 () Bool)

(declare-fun e!178994 () Bool)

(assert (=> b!281715 (=> (not res!144786) (not e!178994))))

(declare-datatypes ((array!14032 0))(
  ( (array!14033 (arr!6658 (Array (_ BitVec 32) (_ BitVec 64))) (size!7010 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14032)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281715 (= res!144786 (validKeyInArray!0 (select (arr!6658 a!3325) startIndex!26)))))

(declare-fun b!281716 () Bool)

(assert (=> b!281716 (= e!178994 (not (bvsle #b00000000000000000000000000000000 (size!7010 a!3325))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139165 () array!14032)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1816 0))(
  ( (MissingZero!1816 (index!9434 (_ BitVec 32))) (Found!1816 (index!9435 (_ BitVec 32))) (Intermediate!1816 (undefined!2628 Bool) (index!9436 (_ BitVec 32)) (x!27654 (_ BitVec 32))) (Undefined!1816) (MissingVacant!1816 (index!9437 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14032 (_ BitVec 32)) SeekEntryResult!1816)

(assert (=> b!281716 (= (seekEntryOrOpen!0 (select (arr!6658 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6658 a!3325) i!1267 k!2581) startIndex!26) lt!139165 mask!3868))))

(declare-datatypes ((Unit!8916 0))(
  ( (Unit!8917) )
))
(declare-fun lt!139164 () Unit!8916)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14032 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8916)

(assert (=> b!281716 (= lt!139164 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4466 0))(
  ( (Nil!4463) (Cons!4462 (h!5132 (_ BitVec 64)) (t!9548 List!4466)) )
))
(declare-fun arrayNoDuplicates!0 (array!14032 (_ BitVec 32) List!4466) Bool)

(assert (=> b!281716 (arrayNoDuplicates!0 lt!139165 #b00000000000000000000000000000000 Nil!4463)))

(declare-fun lt!139163 () Unit!8916)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4466) Unit!8916)

(assert (=> b!281716 (= lt!139163 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4463))))

(declare-fun b!281717 () Bool)

(declare-fun e!178992 () Bool)

(assert (=> b!281717 (= e!178992 e!178994)))

(declare-fun res!144792 () Bool)

(assert (=> b!281717 (=> (not res!144792) (not e!178994))))

(assert (=> b!281717 (= res!144792 (not (= startIndex!26 i!1267)))))

(assert (=> b!281717 (= lt!139165 (array!14033 (store (arr!6658 a!3325) i!1267 k!2581) (size!7010 a!3325)))))

(declare-fun b!281718 () Bool)

(declare-fun e!178993 () Bool)

(assert (=> b!281718 (= e!178993 e!178992)))

(declare-fun res!144788 () Bool)

(assert (=> b!281718 (=> (not res!144788) (not e!178992))))

(declare-fun lt!139162 () SeekEntryResult!1816)

(assert (=> b!281718 (= res!144788 (or (= lt!139162 (MissingZero!1816 i!1267)) (= lt!139162 (MissingVacant!1816 i!1267))))))

(assert (=> b!281718 (= lt!139162 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!144790 () Bool)

(assert (=> start!27214 (=> (not res!144790) (not e!178993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27214 (= res!144790 (validMask!0 mask!3868))))

(assert (=> start!27214 e!178993))

(declare-fun array_inv!4621 (array!14032) Bool)

(assert (=> start!27214 (array_inv!4621 a!3325)))

(assert (=> start!27214 true))

(declare-fun b!281719 () Bool)

(declare-fun res!144784 () Bool)

(assert (=> b!281719 (=> (not res!144784) (not e!178993))))

(assert (=> b!281719 (= res!144784 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4463))))

(declare-fun b!281720 () Bool)

(declare-fun res!144789 () Bool)

(assert (=> b!281720 (=> (not res!144789) (not e!178993))))

(assert (=> b!281720 (= res!144789 (validKeyInArray!0 k!2581))))

(declare-fun b!281721 () Bool)

(declare-fun res!144785 () Bool)

(assert (=> b!281721 (=> (not res!144785) (not e!178993))))

(assert (=> b!281721 (= res!144785 (and (= (size!7010 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7010 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7010 a!3325))))))

(declare-fun b!281722 () Bool)

(declare-fun res!144787 () Bool)

(assert (=> b!281722 (=> (not res!144787) (not e!178993))))

(declare-fun arrayContainsKey!0 (array!14032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281722 (= res!144787 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281723 () Bool)

(declare-fun res!144791 () Bool)

(assert (=> b!281723 (=> (not res!144791) (not e!178992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14032 (_ BitVec 32)) Bool)

(assert (=> b!281723 (= res!144791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27214 res!144790) b!281721))

(assert (= (and b!281721 res!144785) b!281720))

(assert (= (and b!281720 res!144789) b!281719))

(assert (= (and b!281719 res!144784) b!281722))

(assert (= (and b!281722 res!144787) b!281718))

(assert (= (and b!281718 res!144788) b!281723))

(assert (= (and b!281723 res!144791) b!281717))

(assert (= (and b!281717 res!144792) b!281715))

(assert (= (and b!281715 res!144786) b!281716))

(declare-fun m!296071 () Bool)

(assert (=> b!281723 m!296071))

(declare-fun m!296073 () Bool)

(assert (=> b!281719 m!296073))

(declare-fun m!296075 () Bool)

(assert (=> b!281720 m!296075))

(declare-fun m!296077 () Bool)

(assert (=> start!27214 m!296077))

(declare-fun m!296079 () Bool)

(assert (=> start!27214 m!296079))

(declare-fun m!296081 () Bool)

(assert (=> b!281715 m!296081))

(assert (=> b!281715 m!296081))

(declare-fun m!296083 () Bool)

(assert (=> b!281715 m!296083))

(declare-fun m!296085 () Bool)

(assert (=> b!281722 m!296085))

(declare-fun m!296087 () Bool)

(assert (=> b!281717 m!296087))

(declare-fun m!296089 () Bool)

(assert (=> b!281716 m!296089))

(declare-fun m!296091 () Bool)

(assert (=> b!281716 m!296091))

(assert (=> b!281716 m!296087))

(assert (=> b!281716 m!296081))

(declare-fun m!296093 () Bool)

(assert (=> b!281716 m!296093))

(declare-fun m!296095 () Bool)

(assert (=> b!281716 m!296095))

(assert (=> b!281716 m!296089))

(declare-fun m!296097 () Bool)

(assert (=> b!281716 m!296097))

(assert (=> b!281716 m!296081))

(declare-fun m!296099 () Bool)

(assert (=> b!281716 m!296099))

(declare-fun m!296101 () Bool)

(assert (=> b!281718 m!296101))

(push 1)

(assert (not b!281720))

