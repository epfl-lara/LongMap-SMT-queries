; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26064 () Bool)

(assert start!26064)

(declare-fun b!268845 () Bool)

(declare-fun res!133127 () Bool)

(declare-fun e!173586 () Bool)

(assert (=> b!268845 (=> (not res!133127) (not e!173586))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268845 (= res!133127 (validKeyInArray!0 k!2581))))

(declare-fun res!133128 () Bool)

(assert (=> start!26064 (=> (not res!133128) (not e!173586))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26064 (= res!133128 (validMask!0 mask!3868))))

(assert (=> start!26064 e!173586))

(declare-datatypes ((array!13161 0))(
  ( (array!13162 (arr!6230 (Array (_ BitVec 32) (_ BitVec 64))) (size!6582 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13161)

(declare-fun array_inv!4193 (array!13161) Bool)

(assert (=> start!26064 (array_inv!4193 a!3325)))

(assert (=> start!26064 true))

(declare-fun b!268846 () Bool)

(declare-fun e!173587 () Bool)

(assert (=> b!268846 (= e!173586 e!173587)))

(declare-fun res!133124 () Bool)

(assert (=> b!268846 (=> (not res!133124) (not e!173587))))

(declare-datatypes ((SeekEntryResult!1388 0))(
  ( (MissingZero!1388 (index!7722 (_ BitVec 32))) (Found!1388 (index!7723 (_ BitVec 32))) (Intermediate!1388 (undefined!2200 Bool) (index!7724 (_ BitVec 32)) (x!26081 (_ BitVec 32))) (Undefined!1388) (MissingVacant!1388 (index!7725 (_ BitVec 32))) )
))
(declare-fun lt!135012 () SeekEntryResult!1388)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268846 (= res!133124 (or (= lt!135012 (MissingZero!1388 i!1267)) (= lt!135012 (MissingVacant!1388 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13161 (_ BitVec 32)) SeekEntryResult!1388)

(assert (=> b!268846 (= lt!135012 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268847 () Bool)

(assert (=> b!268847 (= e!173587 false)))

(declare-fun lt!135013 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13161 (_ BitVec 32)) Bool)

(assert (=> b!268847 (= lt!135013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268848 () Bool)

(declare-fun res!133126 () Bool)

(assert (=> b!268848 (=> (not res!133126) (not e!173586))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268848 (= res!133126 (and (= (size!6582 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6582 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6582 a!3325))))))

(declare-fun b!268849 () Bool)

(declare-fun res!133123 () Bool)

(assert (=> b!268849 (=> (not res!133123) (not e!173586))))

(declare-datatypes ((List!4038 0))(
  ( (Nil!4035) (Cons!4034 (h!4701 (_ BitVec 64)) (t!9120 List!4038)) )
))
(declare-fun arrayNoDuplicates!0 (array!13161 (_ BitVec 32) List!4038) Bool)

(assert (=> b!268849 (= res!133123 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4035))))

(declare-fun b!268850 () Bool)

(declare-fun res!133125 () Bool)

(assert (=> b!268850 (=> (not res!133125) (not e!173586))))

(declare-fun arrayContainsKey!0 (array!13161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268850 (= res!133125 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26064 res!133128) b!268848))

(assert (= (and b!268848 res!133126) b!268845))

(assert (= (and b!268845 res!133127) b!268849))

(assert (= (and b!268849 res!133123) b!268850))

(assert (= (and b!268850 res!133125) b!268846))

(assert (= (and b!268846 res!133124) b!268847))

(declare-fun m!284883 () Bool)

(assert (=> start!26064 m!284883))

(declare-fun m!284885 () Bool)

(assert (=> start!26064 m!284885))

(declare-fun m!284887 () Bool)

(assert (=> b!268846 m!284887))

(declare-fun m!284889 () Bool)

(assert (=> b!268845 m!284889))

(declare-fun m!284891 () Bool)

(assert (=> b!268849 m!284891))

(declare-fun m!284893 () Bool)

(assert (=> b!268847 m!284893))

(declare-fun m!284895 () Bool)

(assert (=> b!268850 m!284895))

(push 1)

(assert (not start!26064))

(assert (not b!268846))

(assert (not b!268847))

