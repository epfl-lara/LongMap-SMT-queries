; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26488 () Bool)

(assert start!26488)

(declare-fun b!274992 () Bool)

(declare-fun e!175972 () Bool)

(declare-fun e!175973 () Bool)

(assert (=> b!274992 (= e!175972 e!175973)))

(declare-fun res!138987 () Bool)

(assert (=> b!274992 (=> (not res!138987) (not e!175973))))

(declare-datatypes ((SeekEntryResult!1600 0))(
  ( (MissingZero!1600 (index!8570 (_ BitVec 32))) (Found!1600 (index!8571 (_ BitVec 32))) (Intermediate!1600 (undefined!2412 Bool) (index!8572 (_ BitVec 32)) (x!26853 (_ BitVec 32))) (Undefined!1600) (MissingVacant!1600 (index!8573 (_ BitVec 32))) )
))
(declare-fun lt!137238 () SeekEntryResult!1600)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274992 (= res!138987 (or (= lt!137238 (MissingZero!1600 i!1267)) (= lt!137238 (MissingVacant!1600 i!1267))))))

(declare-datatypes ((array!13585 0))(
  ( (array!13586 (arr!6442 (Array (_ BitVec 32) (_ BitVec 64))) (size!6794 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13585)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13585 (_ BitVec 32)) SeekEntryResult!1600)

(assert (=> b!274992 (= lt!137238 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274993 () Bool)

(declare-fun res!138982 () Bool)

(assert (=> b!274993 (=> (not res!138982) (not e!175972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274993 (= res!138982 (validKeyInArray!0 k!2581))))

(declare-fun b!274994 () Bool)

(declare-fun res!138983 () Bool)

(assert (=> b!274994 (=> (not res!138983) (not e!175972))))

(declare-datatypes ((List!4250 0))(
  ( (Nil!4247) (Cons!4246 (h!4913 (_ BitVec 64)) (t!9332 List!4250)) )
))
(declare-fun arrayNoDuplicates!0 (array!13585 (_ BitVec 32) List!4250) Bool)

(assert (=> b!274994 (= res!138983 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4247))))

(declare-fun res!138985 () Bool)

(assert (=> start!26488 (=> (not res!138985) (not e!175972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26488 (= res!138985 (validMask!0 mask!3868))))

(assert (=> start!26488 e!175972))

(declare-fun array_inv!4405 (array!13585) Bool)

(assert (=> start!26488 (array_inv!4405 a!3325)))

(assert (=> start!26488 true))

(declare-fun b!274995 () Bool)

(declare-fun res!138986 () Bool)

(assert (=> b!274995 (=> (not res!138986) (not e!175972))))

(declare-fun arrayContainsKey!0 (array!13585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274995 (= res!138986 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274996 () Bool)

(assert (=> b!274996 (= e!175973 false)))

(declare-fun lt!137239 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13585 (_ BitVec 32)) Bool)

(assert (=> b!274996 (= lt!137239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274997 () Bool)

(declare-fun res!138984 () Bool)

(assert (=> b!274997 (=> (not res!138984) (not e!175972))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274997 (= res!138984 (and (= (size!6794 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6794 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6794 a!3325))))))

(assert (= (and start!26488 res!138985) b!274997))

(assert (= (and b!274997 res!138984) b!274993))

(assert (= (and b!274993 res!138982) b!274994))

(assert (= (and b!274994 res!138983) b!274995))

(assert (= (and b!274995 res!138986) b!274992))

(assert (= (and b!274992 res!138987) b!274996))

(declare-fun m!290659 () Bool)

(assert (=> start!26488 m!290659))

(declare-fun m!290661 () Bool)

(assert (=> start!26488 m!290661))

(declare-fun m!290663 () Bool)

(assert (=> b!274996 m!290663))

(declare-fun m!290665 () Bool)

(assert (=> b!274992 m!290665))

(declare-fun m!290667 () Bool)

(assert (=> b!274994 m!290667))

(declare-fun m!290669 () Bool)

(assert (=> b!274993 m!290669))

(declare-fun m!290671 () Bool)

(assert (=> b!274995 m!290671))

(push 1)

(assert (not start!26488))

(assert (not b!274992))

(assert (not b!274993))

(assert (not b!274995))

(assert (not b!274994))

(assert (not b!274996))

(check-sat)

