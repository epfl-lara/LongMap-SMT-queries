; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27150 () Bool)

(assert start!27150)

(declare-fun b!280851 () Bool)

(declare-fun res!143923 () Bool)

(declare-fun e!178678 () Bool)

(assert (=> b!280851 (=> (not res!143923) (not e!178678))))

(declare-datatypes ((array!13968 0))(
  ( (array!13969 (arr!6626 (Array (_ BitVec 32) (_ BitVec 64))) (size!6978 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13968)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280851 (= res!143923 (and (= (size!6978 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6978 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6978 a!3325))))))

(declare-fun b!280852 () Bool)

(declare-fun res!143926 () Bool)

(declare-fun e!178677 () Bool)

(assert (=> b!280852 (=> (not res!143926) (not e!178677))))

(assert (=> b!280852 (= res!143926 (not (= startIndex!26 i!1267)))))

(declare-fun b!280853 () Bool)

(declare-fun res!143921 () Bool)

(assert (=> b!280853 (=> (not res!143921) (not e!178678))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280853 (= res!143921 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280854 () Bool)

(declare-fun res!143922 () Bool)

(assert (=> b!280854 (=> (not res!143922) (not e!178678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280854 (= res!143922 (validKeyInArray!0 k!2581))))

(declare-fun b!280855 () Bool)

(assert (=> b!280855 (= e!178678 e!178677)))

(declare-fun res!143928 () Bool)

(assert (=> b!280855 (=> (not res!143928) (not e!178677))))

(declare-datatypes ((SeekEntryResult!1784 0))(
  ( (MissingZero!1784 (index!9306 (_ BitVec 32))) (Found!1784 (index!9307 (_ BitVec 32))) (Intermediate!1784 (undefined!2596 Bool) (index!9308 (_ BitVec 32)) (x!27542 (_ BitVec 32))) (Undefined!1784) (MissingVacant!1784 (index!9309 (_ BitVec 32))) )
))
(declare-fun lt!138919 () SeekEntryResult!1784)

(assert (=> b!280855 (= res!143928 (or (= lt!138919 (MissingZero!1784 i!1267)) (= lt!138919 (MissingVacant!1784 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13968 (_ BitVec 32)) SeekEntryResult!1784)

(assert (=> b!280855 (= lt!138919 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280856 () Bool)

(declare-fun res!143927 () Bool)

(assert (=> b!280856 (=> (not res!143927) (not e!178678))))

(declare-datatypes ((List!4434 0))(
  ( (Nil!4431) (Cons!4430 (h!5100 (_ BitVec 64)) (t!9516 List!4434)) )
))
(declare-fun arrayNoDuplicates!0 (array!13968 (_ BitVec 32) List!4434) Bool)

(assert (=> b!280856 (= res!143927 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4431))))

(declare-fun b!280857 () Bool)

(declare-fun res!143924 () Bool)

(assert (=> b!280857 (=> (not res!143924) (not e!178677))))

(assert (=> b!280857 (= res!143924 (validKeyInArray!0 (select (arr!6626 a!3325) startIndex!26)))))

(declare-fun b!280859 () Bool)

(declare-fun res!143925 () Bool)

(assert (=> b!280859 (=> (not res!143925) (not e!178677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13968 (_ BitVec 32)) Bool)

(assert (=> b!280859 (= res!143925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!143920 () Bool)

(assert (=> start!27150 (=> (not res!143920) (not e!178678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27150 (= res!143920 (validMask!0 mask!3868))))

(assert (=> start!27150 e!178678))

(declare-fun array_inv!4589 (array!13968) Bool)

(assert (=> start!27150 (array_inv!4589 a!3325)))

(assert (=> start!27150 true))

(declare-fun b!280858 () Bool)

(assert (=> b!280858 (= e!178677 (not true))))

(assert (=> b!280858 (arrayNoDuplicates!0 (array!13969 (store (arr!6626 a!3325) i!1267 k!2581) (size!6978 a!3325)) #b00000000000000000000000000000000 Nil!4431)))

(declare-datatypes ((Unit!8852 0))(
  ( (Unit!8853) )
))
(declare-fun lt!138918 () Unit!8852)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13968 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4434) Unit!8852)

(assert (=> b!280858 (= lt!138918 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4431))))

(assert (= (and start!27150 res!143920) b!280851))

(assert (= (and b!280851 res!143923) b!280854))

(assert (= (and b!280854 res!143922) b!280856))

(assert (= (and b!280856 res!143927) b!280853))

(assert (= (and b!280853 res!143921) b!280855))

(assert (= (and b!280855 res!143928) b!280859))

(assert (= (and b!280859 res!143925) b!280852))

(assert (= (and b!280852 res!143926) b!280857))

(assert (= (and b!280857 res!143924) b!280858))

(declare-fun m!295239 () Bool)

(assert (=> b!280854 m!295239))

(declare-fun m!295241 () Bool)

(assert (=> b!280859 m!295241))

(declare-fun m!295243 () Bool)

(assert (=> b!280855 m!295243))

(declare-fun m!295245 () Bool)

(assert (=> start!27150 m!295245))

(declare-fun m!295247 () Bool)

(assert (=> start!27150 m!295247))

(declare-fun m!295249 () Bool)

(assert (=> b!280857 m!295249))

(assert (=> b!280857 m!295249))

(declare-fun m!295251 () Bool)

(assert (=> b!280857 m!295251))

(declare-fun m!295253 () Bool)

(assert (=> b!280853 m!295253))

(declare-fun m!295255 () Bool)

(assert (=> b!280856 m!295255))

(declare-fun m!295257 () Bool)

(assert (=> b!280858 m!295257))

(declare-fun m!295259 () Bool)

(assert (=> b!280858 m!295259))

(declare-fun m!295261 () Bool)

(assert (=> b!280858 m!295261))

(push 1)

