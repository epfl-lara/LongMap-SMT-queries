; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27160 () Bool)

(assert start!27160)

(declare-fun b!280986 () Bool)

(declare-fun res!144057 () Bool)

(declare-fun e!178724 () Bool)

(assert (=> b!280986 (=> (not res!144057) (not e!178724))))

(declare-datatypes ((array!13978 0))(
  ( (array!13979 (arr!6631 (Array (_ BitVec 32) (_ BitVec 64))) (size!6983 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13978)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13978 (_ BitVec 32)) Bool)

(assert (=> b!280986 (= res!144057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144060 () Bool)

(declare-fun e!178722 () Bool)

(assert (=> start!27160 (=> (not res!144060) (not e!178722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27160 (= res!144060 (validMask!0 mask!3868))))

(assert (=> start!27160 e!178722))

(declare-fun array_inv!4594 (array!13978) Bool)

(assert (=> start!27160 (array_inv!4594 a!3325)))

(assert (=> start!27160 true))

(declare-fun b!280987 () Bool)

(declare-fun res!144062 () Bool)

(assert (=> b!280987 (=> (not res!144062) (not e!178722))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280987 (= res!144062 (and (= (size!6983 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6983 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6983 a!3325))))))

(declare-fun b!280988 () Bool)

(assert (=> b!280988 (= e!178724 (not (not (= i!1267 startIndex!26))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4439 0))(
  ( (Nil!4436) (Cons!4435 (h!5105 (_ BitVec 64)) (t!9521 List!4439)) )
))
(declare-fun arrayNoDuplicates!0 (array!13978 (_ BitVec 32) List!4439) Bool)

(assert (=> b!280988 (arrayNoDuplicates!0 (array!13979 (store (arr!6631 a!3325) i!1267 k!2581) (size!6983 a!3325)) #b00000000000000000000000000000000 Nil!4436)))

(declare-datatypes ((Unit!8862 0))(
  ( (Unit!8863) )
))
(declare-fun lt!138948 () Unit!8862)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13978 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4439) Unit!8862)

(assert (=> b!280988 (= lt!138948 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4436))))

(declare-fun b!280989 () Bool)

(declare-fun res!144063 () Bool)

(assert (=> b!280989 (=> (not res!144063) (not e!178722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280989 (= res!144063 (validKeyInArray!0 k!2581))))

(declare-fun b!280990 () Bool)

(declare-fun res!144055 () Bool)

(assert (=> b!280990 (=> (not res!144055) (not e!178722))))

(declare-fun arrayContainsKey!0 (array!13978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280990 (= res!144055 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280991 () Bool)

(declare-fun res!144061 () Bool)

(assert (=> b!280991 (=> (not res!144061) (not e!178724))))

(assert (=> b!280991 (= res!144061 (not (= startIndex!26 i!1267)))))

(declare-fun b!280992 () Bool)

(assert (=> b!280992 (= e!178722 e!178724)))

(declare-fun res!144059 () Bool)

(assert (=> b!280992 (=> (not res!144059) (not e!178724))))

(declare-datatypes ((SeekEntryResult!1789 0))(
  ( (MissingZero!1789 (index!9326 (_ BitVec 32))) (Found!1789 (index!9327 (_ BitVec 32))) (Intermediate!1789 (undefined!2601 Bool) (index!9328 (_ BitVec 32)) (x!27555 (_ BitVec 32))) (Undefined!1789) (MissingVacant!1789 (index!9329 (_ BitVec 32))) )
))
(declare-fun lt!138949 () SeekEntryResult!1789)

(assert (=> b!280992 (= res!144059 (or (= lt!138949 (MissingZero!1789 i!1267)) (= lt!138949 (MissingVacant!1789 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13978 (_ BitVec 32)) SeekEntryResult!1789)

(assert (=> b!280992 (= lt!138949 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280993 () Bool)

(declare-fun res!144058 () Bool)

(assert (=> b!280993 (=> (not res!144058) (not e!178724))))

(assert (=> b!280993 (= res!144058 (validKeyInArray!0 (select (arr!6631 a!3325) startIndex!26)))))

(declare-fun b!280994 () Bool)

(declare-fun res!144056 () Bool)

(assert (=> b!280994 (=> (not res!144056) (not e!178722))))

(assert (=> b!280994 (= res!144056 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4436))))

(assert (= (and start!27160 res!144060) b!280987))

(assert (= (and b!280987 res!144062) b!280989))

(assert (= (and b!280989 res!144063) b!280994))

(assert (= (and b!280994 res!144056) b!280990))

(assert (= (and b!280990 res!144055) b!280992))

(assert (= (and b!280992 res!144059) b!280986))

(assert (= (and b!280986 res!144057) b!280991))

(assert (= (and b!280991 res!144061) b!280993))

(assert (= (and b!280993 res!144058) b!280988))

(declare-fun m!295359 () Bool)

(assert (=> b!280990 m!295359))

(declare-fun m!295361 () Bool)

(assert (=> b!280992 m!295361))

(declare-fun m!295363 () Bool)

(assert (=> b!280988 m!295363))

(declare-fun m!295365 () Bool)

(assert (=> b!280988 m!295365))

(declare-fun m!295367 () Bool)

(assert (=> b!280988 m!295367))

(declare-fun m!295369 () Bool)

(assert (=> start!27160 m!295369))

(declare-fun m!295371 () Bool)

(assert (=> start!27160 m!295371))

(declare-fun m!295373 () Bool)

(assert (=> b!280994 m!295373))

(declare-fun m!295375 () Bool)

(assert (=> b!280986 m!295375))

(declare-fun m!295377 () Bool)

(assert (=> b!280993 m!295377))

(assert (=> b!280993 m!295377))

(declare-fun m!295379 () Bool)

(assert (=> b!280993 m!295379))

(declare-fun m!295381 () Bool)

(assert (=> b!280989 m!295381))

(push 1)

(assert (not start!27160))

(assert (not b!280990))

(assert (not b!280992))

(assert (not b!280994))

(assert (not b!280989))

(assert (not b!280986))

(assert (not b!280988))

(assert (not b!280993))

(check-sat)

