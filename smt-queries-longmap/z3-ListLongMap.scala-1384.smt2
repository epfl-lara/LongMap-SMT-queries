; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27158 () Bool)

(assert start!27158)

(declare-fun b!280959 () Bool)

(declare-fun e!178714 () Bool)

(declare-fun e!178713 () Bool)

(assert (=> b!280959 (= e!178714 e!178713)))

(declare-fun res!144030 () Bool)

(assert (=> b!280959 (=> (not res!144030) (not e!178713))))

(declare-datatypes ((SeekEntryResult!1788 0))(
  ( (MissingZero!1788 (index!9322 (_ BitVec 32))) (Found!1788 (index!9323 (_ BitVec 32))) (Intermediate!1788 (undefined!2600 Bool) (index!9324 (_ BitVec 32)) (x!27554 (_ BitVec 32))) (Undefined!1788) (MissingVacant!1788 (index!9325 (_ BitVec 32))) )
))
(declare-fun lt!138942 () SeekEntryResult!1788)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280959 (= res!144030 (or (= lt!138942 (MissingZero!1788 i!1267)) (= lt!138942 (MissingVacant!1788 i!1267))))))

(declare-datatypes ((array!13976 0))(
  ( (array!13977 (arr!6630 (Array (_ BitVec 32) (_ BitVec 64))) (size!6982 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13976)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13976 (_ BitVec 32)) SeekEntryResult!1788)

(assert (=> b!280959 (= lt!138942 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280960 () Bool)

(declare-fun res!144032 () Bool)

(assert (=> b!280960 (=> (not res!144032) (not e!178714))))

(declare-datatypes ((List!4438 0))(
  ( (Nil!4435) (Cons!4434 (h!5104 (_ BitVec 64)) (t!9520 List!4438)) )
))
(declare-fun arrayNoDuplicates!0 (array!13976 (_ BitVec 32) List!4438) Bool)

(assert (=> b!280960 (= res!144032 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4435))))

(declare-fun b!280961 () Bool)

(declare-fun res!144034 () Bool)

(assert (=> b!280961 (=> (not res!144034) (not e!178713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13976 (_ BitVec 32)) Bool)

(assert (=> b!280961 (= res!144034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280962 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280962 (= e!178713 (not (not (= i!1267 startIndex!26))))))

(assert (=> b!280962 (arrayNoDuplicates!0 (array!13977 (store (arr!6630 a!3325) i!1267 k0!2581) (size!6982 a!3325)) #b00000000000000000000000000000000 Nil!4435)))

(declare-datatypes ((Unit!8860 0))(
  ( (Unit!8861) )
))
(declare-fun lt!138943 () Unit!8860)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13976 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4438) Unit!8860)

(assert (=> b!280962 (= lt!138943 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4435))))

(declare-fun b!280964 () Bool)

(declare-fun res!144035 () Bool)

(assert (=> b!280964 (=> (not res!144035) (not e!178713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280964 (= res!144035 (validKeyInArray!0 (select (arr!6630 a!3325) startIndex!26)))))

(declare-fun b!280965 () Bool)

(declare-fun res!144029 () Bool)

(assert (=> b!280965 (=> (not res!144029) (not e!178714))))

(assert (=> b!280965 (= res!144029 (and (= (size!6982 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6982 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6982 a!3325))))))

(declare-fun b!280963 () Bool)

(declare-fun res!144036 () Bool)

(assert (=> b!280963 (=> (not res!144036) (not e!178713))))

(assert (=> b!280963 (= res!144036 (not (= startIndex!26 i!1267)))))

(declare-fun res!144031 () Bool)

(assert (=> start!27158 (=> (not res!144031) (not e!178714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27158 (= res!144031 (validMask!0 mask!3868))))

(assert (=> start!27158 e!178714))

(declare-fun array_inv!4593 (array!13976) Bool)

(assert (=> start!27158 (array_inv!4593 a!3325)))

(assert (=> start!27158 true))

(declare-fun b!280966 () Bool)

(declare-fun res!144028 () Bool)

(assert (=> b!280966 (=> (not res!144028) (not e!178714))))

(declare-fun arrayContainsKey!0 (array!13976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280966 (= res!144028 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280967 () Bool)

(declare-fun res!144033 () Bool)

(assert (=> b!280967 (=> (not res!144033) (not e!178714))))

(assert (=> b!280967 (= res!144033 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27158 res!144031) b!280965))

(assert (= (and b!280965 res!144029) b!280967))

(assert (= (and b!280967 res!144033) b!280960))

(assert (= (and b!280960 res!144032) b!280966))

(assert (= (and b!280966 res!144028) b!280959))

(assert (= (and b!280959 res!144030) b!280961))

(assert (= (and b!280961 res!144034) b!280963))

(assert (= (and b!280963 res!144036) b!280964))

(assert (= (and b!280964 res!144035) b!280962))

(declare-fun m!295335 () Bool)

(assert (=> b!280967 m!295335))

(declare-fun m!295337 () Bool)

(assert (=> b!280960 m!295337))

(declare-fun m!295339 () Bool)

(assert (=> start!27158 m!295339))

(declare-fun m!295341 () Bool)

(assert (=> start!27158 m!295341))

(declare-fun m!295343 () Bool)

(assert (=> b!280962 m!295343))

(declare-fun m!295345 () Bool)

(assert (=> b!280962 m!295345))

(declare-fun m!295347 () Bool)

(assert (=> b!280962 m!295347))

(declare-fun m!295349 () Bool)

(assert (=> b!280966 m!295349))

(declare-fun m!295351 () Bool)

(assert (=> b!280961 m!295351))

(declare-fun m!295353 () Bool)

(assert (=> b!280959 m!295353))

(declare-fun m!295355 () Bool)

(assert (=> b!280964 m!295355))

(assert (=> b!280964 m!295355))

(declare-fun m!295357 () Bool)

(assert (=> b!280964 m!295357))

(check-sat (not b!280961) (not b!280962) (not start!27158) (not b!280960) (not b!280959) (not b!280966) (not b!280964) (not b!280967))
(check-sat)
