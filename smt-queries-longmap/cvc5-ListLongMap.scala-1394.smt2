; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27216 () Bool)

(assert start!27216)

(declare-fun b!281742 () Bool)

(declare-fun e!179005 () Bool)

(declare-fun e!179003 () Bool)

(assert (=> b!281742 (= e!179005 e!179003)))

(declare-fun res!144812 () Bool)

(assert (=> b!281742 (=> (not res!144812) (not e!179003))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281742 (= res!144812 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14034 0))(
  ( (array!14035 (arr!6659 (Array (_ BitVec 32) (_ BitVec 64))) (size!7011 (_ BitVec 32))) )
))
(declare-fun lt!139176 () array!14034)

(declare-fun a!3325 () array!14034)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!281742 (= lt!139176 (array!14035 (store (arr!6659 a!3325) i!1267 k!2581) (size!7011 a!3325)))))

(declare-fun b!281743 () Bool)

(declare-fun res!144817 () Bool)

(declare-fun e!179006 () Bool)

(assert (=> b!281743 (=> (not res!144817) (not e!179006))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281743 (= res!144817 (and (= (size!7011 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7011 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7011 a!3325))))))

(declare-fun b!281744 () Bool)

(declare-fun res!144819 () Bool)

(assert (=> b!281744 (=> (not res!144819) (not e!179006))))

(declare-fun arrayContainsKey!0 (array!14034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281744 (= res!144819 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281745 () Bool)

(assert (=> b!281745 (= e!179006 e!179005)))

(declare-fun res!144811 () Bool)

(assert (=> b!281745 (=> (not res!144811) (not e!179005))))

(declare-datatypes ((SeekEntryResult!1817 0))(
  ( (MissingZero!1817 (index!9438 (_ BitVec 32))) (Found!1817 (index!9439 (_ BitVec 32))) (Intermediate!1817 (undefined!2629 Bool) (index!9440 (_ BitVec 32)) (x!27663 (_ BitVec 32))) (Undefined!1817) (MissingVacant!1817 (index!9441 (_ BitVec 32))) )
))
(declare-fun lt!139174 () SeekEntryResult!1817)

(assert (=> b!281745 (= res!144811 (or (= lt!139174 (MissingZero!1817 i!1267)) (= lt!139174 (MissingVacant!1817 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14034 (_ BitVec 32)) SeekEntryResult!1817)

(assert (=> b!281745 (= lt!139174 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281747 () Bool)

(declare-fun res!144814 () Bool)

(assert (=> b!281747 (=> (not res!144814) (not e!179006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281747 (= res!144814 (validKeyInArray!0 k!2581))))

(declare-fun b!281748 () Bool)

(assert (=> b!281748 (= e!179003 (not (or (bvsgt #b00000000000000000000000000000000 (size!7011 a!3325)) (bvsle startIndex!26 (size!7011 a!3325)))))))

(assert (=> b!281748 (= (seekEntryOrOpen!0 (select (arr!6659 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6659 a!3325) i!1267 k!2581) startIndex!26) lt!139176 mask!3868))))

(declare-datatypes ((Unit!8918 0))(
  ( (Unit!8919) )
))
(declare-fun lt!139177 () Unit!8918)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14034 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8918)

(assert (=> b!281748 (= lt!139177 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4467 0))(
  ( (Nil!4464) (Cons!4463 (h!5133 (_ BitVec 64)) (t!9549 List!4467)) )
))
(declare-fun arrayNoDuplicates!0 (array!14034 (_ BitVec 32) List!4467) Bool)

(assert (=> b!281748 (arrayNoDuplicates!0 lt!139176 #b00000000000000000000000000000000 Nil!4464)))

(declare-fun lt!139175 () Unit!8918)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14034 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4467) Unit!8918)

(assert (=> b!281748 (= lt!139175 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4464))))

(declare-fun b!281749 () Bool)

(declare-fun res!144818 () Bool)

(assert (=> b!281749 (=> (not res!144818) (not e!179003))))

(assert (=> b!281749 (= res!144818 (validKeyInArray!0 (select (arr!6659 a!3325) startIndex!26)))))

(declare-fun b!281750 () Bool)

(declare-fun res!144815 () Bool)

(assert (=> b!281750 (=> (not res!144815) (not e!179005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14034 (_ BitVec 32)) Bool)

(assert (=> b!281750 (= res!144815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281746 () Bool)

(declare-fun res!144813 () Bool)

(assert (=> b!281746 (=> (not res!144813) (not e!179006))))

(assert (=> b!281746 (= res!144813 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4464))))

(declare-fun res!144816 () Bool)

(assert (=> start!27216 (=> (not res!144816) (not e!179006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27216 (= res!144816 (validMask!0 mask!3868))))

(assert (=> start!27216 e!179006))

(declare-fun array_inv!4622 (array!14034) Bool)

(assert (=> start!27216 (array_inv!4622 a!3325)))

(assert (=> start!27216 true))

(assert (= (and start!27216 res!144816) b!281743))

(assert (= (and b!281743 res!144817) b!281747))

(assert (= (and b!281747 res!144814) b!281746))

(assert (= (and b!281746 res!144813) b!281744))

(assert (= (and b!281744 res!144819) b!281745))

(assert (= (and b!281745 res!144811) b!281750))

(assert (= (and b!281750 res!144815) b!281742))

(assert (= (and b!281742 res!144812) b!281749))

(assert (= (and b!281749 res!144818) b!281748))

(declare-fun m!296103 () Bool)

(assert (=> b!281745 m!296103))

(declare-fun m!296105 () Bool)

(assert (=> b!281749 m!296105))

(assert (=> b!281749 m!296105))

(declare-fun m!296107 () Bool)

(assert (=> b!281749 m!296107))

(declare-fun m!296109 () Bool)

(assert (=> b!281750 m!296109))

(declare-fun m!296111 () Bool)

(assert (=> b!281747 m!296111))

(declare-fun m!296113 () Bool)

(assert (=> b!281744 m!296113))

(declare-fun m!296115 () Bool)

(assert (=> start!27216 m!296115))

(declare-fun m!296117 () Bool)

(assert (=> start!27216 m!296117))

(declare-fun m!296119 () Bool)

(assert (=> b!281746 m!296119))

(declare-fun m!296121 () Bool)

(assert (=> b!281742 m!296121))

(declare-fun m!296123 () Bool)

(assert (=> b!281748 m!296123))

(declare-fun m!296125 () Bool)

(assert (=> b!281748 m!296125))

(declare-fun m!296127 () Bool)

(assert (=> b!281748 m!296127))

(assert (=> b!281748 m!296125))

(assert (=> b!281748 m!296121))

(assert (=> b!281748 m!296105))

(declare-fun m!296129 () Bool)

(assert (=> b!281748 m!296129))

(declare-fun m!296131 () Bool)

(assert (=> b!281748 m!296131))

(assert (=> b!281748 m!296105))

(declare-fun m!296133 () Bool)

(assert (=> b!281748 m!296133))

(push 1)

(assert (not b!281744))

(assert (not b!281746))

(assert (not b!281748))

(assert (not b!281750))

(assert (not b!281749))

(assert (not b!281745))

(assert (not start!27216))

(assert (not b!281747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

