; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27310 () Bool)

(assert start!27310)

(declare-fun b!283019 () Bool)

(declare-fun e!179575 () Bool)

(declare-fun e!179577 () Bool)

(assert (=> b!283019 (= e!179575 (not e!179577))))

(declare-fun res!146096 () Bool)

(assert (=> b!283019 (=> res!146096 e!179577)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14128 0))(
  ( (array!14129 (arr!6706 (Array (_ BitVec 32) (_ BitVec 64))) (size!7058 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14128)

(assert (=> b!283019 (= res!146096 (or (bvsge startIndex!26 (bvsub (size!7058 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14128 (_ BitVec 32)) Bool)

(assert (=> b!283019 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9012 0))(
  ( (Unit!9013) )
))
(declare-fun lt!139871 () Unit!9012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9012)

(assert (=> b!283019 (= lt!139871 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139873 () array!14128)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1864 0))(
  ( (MissingZero!1864 (index!9626 (_ BitVec 32))) (Found!1864 (index!9627 (_ BitVec 32))) (Intermediate!1864 (undefined!2676 Bool) (index!9628 (_ BitVec 32)) (x!27830 (_ BitVec 32))) (Undefined!1864) (MissingVacant!1864 (index!9629 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14128 (_ BitVec 32)) SeekEntryResult!1864)

(assert (=> b!283019 (= (seekEntryOrOpen!0 (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6706 a!3325) i!1267 k!2581) startIndex!26) lt!139873 mask!3868))))

(declare-fun lt!139872 () Unit!9012)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14128 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9012)

(assert (=> b!283019 (= lt!139872 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4514 0))(
  ( (Nil!4511) (Cons!4510 (h!5180 (_ BitVec 64)) (t!9596 List!4514)) )
))
(declare-fun arrayNoDuplicates!0 (array!14128 (_ BitVec 32) List!4514) Bool)

(assert (=> b!283019 (arrayNoDuplicates!0 lt!139873 #b00000000000000000000000000000000 Nil!4511)))

(declare-fun lt!139876 () Unit!9012)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14128 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4514) Unit!9012)

(assert (=> b!283019 (= lt!139876 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4511))))

(declare-fun res!146089 () Bool)

(declare-fun e!179578 () Bool)

(assert (=> start!27310 (=> (not res!146089) (not e!179578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27310 (= res!146089 (validMask!0 mask!3868))))

(assert (=> start!27310 e!179578))

(declare-fun array_inv!4669 (array!14128) Bool)

(assert (=> start!27310 (array_inv!4669 a!3325)))

(assert (=> start!27310 true))

(declare-fun b!283020 () Bool)

(declare-fun res!146094 () Bool)

(assert (=> b!283020 (=> (not res!146094) (not e!179578))))

(assert (=> b!283020 (= res!146094 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4511))))

(declare-fun b!283021 () Bool)

(declare-fun res!146093 () Bool)

(assert (=> b!283021 (=> (not res!146093) (not e!179578))))

(assert (=> b!283021 (= res!146093 (and (= (size!7058 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7058 a!3325))))))

(declare-fun b!283022 () Bool)

(declare-fun res!146090 () Bool)

(assert (=> b!283022 (=> (not res!146090) (not e!179578))))

(declare-fun arrayContainsKey!0 (array!14128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283022 (= res!146090 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283023 () Bool)

(declare-fun res!146088 () Bool)

(assert (=> b!283023 (=> (not res!146088) (not e!179575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283023 (= res!146088 (validKeyInArray!0 (select (arr!6706 a!3325) startIndex!26)))))

(declare-fun b!283024 () Bool)

(declare-fun e!179576 () Bool)

(assert (=> b!283024 (= e!179578 e!179576)))

(declare-fun res!146091 () Bool)

(assert (=> b!283024 (=> (not res!146091) (not e!179576))))

(declare-fun lt!139875 () SeekEntryResult!1864)

(assert (=> b!283024 (= res!146091 (or (= lt!139875 (MissingZero!1864 i!1267)) (= lt!139875 (MissingVacant!1864 i!1267))))))

(assert (=> b!283024 (= lt!139875 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283025 () Bool)

(assert (=> b!283025 (= e!179577 true)))

(assert (=> b!283025 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139873 mask!3868)))

(declare-fun lt!139874 () Unit!9012)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14128 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9012)

(assert (=> b!283025 (= lt!139874 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!283026 () Bool)

(declare-fun res!146095 () Bool)

(assert (=> b!283026 (=> (not res!146095) (not e!179576))))

(assert (=> b!283026 (= res!146095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283027 () Bool)

(assert (=> b!283027 (= e!179576 e!179575)))

(declare-fun res!146092 () Bool)

(assert (=> b!283027 (=> (not res!146092) (not e!179575))))

(assert (=> b!283027 (= res!146092 (not (= startIndex!26 i!1267)))))

(assert (=> b!283027 (= lt!139873 (array!14129 (store (arr!6706 a!3325) i!1267 k!2581) (size!7058 a!3325)))))

(declare-fun b!283028 () Bool)

(declare-fun res!146097 () Bool)

(assert (=> b!283028 (=> (not res!146097) (not e!179578))))

(assert (=> b!283028 (= res!146097 (validKeyInArray!0 k!2581))))

(assert (= (and start!27310 res!146089) b!283021))

(assert (= (and b!283021 res!146093) b!283028))

(assert (= (and b!283028 res!146097) b!283020))

(assert (= (and b!283020 res!146094) b!283022))

(assert (= (and b!283022 res!146090) b!283024))

(assert (= (and b!283024 res!146091) b!283026))

(assert (= (and b!283026 res!146095) b!283027))

(assert (= (and b!283027 res!146092) b!283023))

(assert (= (and b!283023 res!146088) b!283019))

(assert (= (and b!283019 (not res!146096)) b!283025))

(declare-fun m!297779 () Bool)

(assert (=> b!283027 m!297779))

(declare-fun m!297781 () Bool)

(assert (=> start!27310 m!297781))

(declare-fun m!297783 () Bool)

(assert (=> start!27310 m!297783))

(declare-fun m!297785 () Bool)

(assert (=> b!283026 m!297785))

(declare-fun m!297787 () Bool)

(assert (=> b!283022 m!297787))

(declare-fun m!297789 () Bool)

(assert (=> b!283028 m!297789))

(declare-fun m!297791 () Bool)

(assert (=> b!283024 m!297791))

(declare-fun m!297793 () Bool)

(assert (=> b!283023 m!297793))

(assert (=> b!283023 m!297793))

(declare-fun m!297795 () Bool)

(assert (=> b!283023 m!297795))

(declare-fun m!297797 () Bool)

(assert (=> b!283020 m!297797))

(declare-fun m!297799 () Bool)

(assert (=> b!283019 m!297799))

(declare-fun m!297801 () Bool)

(assert (=> b!283019 m!297801))

(assert (=> b!283019 m!297801))

(declare-fun m!297803 () Bool)

(assert (=> b!283019 m!297803))

(assert (=> b!283019 m!297779))

(declare-fun m!297805 () Bool)

(assert (=> b!283019 m!297805))

(assert (=> b!283019 m!297793))

(declare-fun m!297807 () Bool)

(assert (=> b!283019 m!297807))

(declare-fun m!297809 () Bool)

(assert (=> b!283019 m!297809))

(declare-fun m!297811 () Bool)

(assert (=> b!283019 m!297811))

(assert (=> b!283019 m!297793))

(declare-fun m!297813 () Bool)

(assert (=> b!283019 m!297813))

(declare-fun m!297815 () Bool)

(assert (=> b!283025 m!297815))

(declare-fun m!297817 () Bool)

(assert (=> b!283025 m!297817))

(push 1)

(assert (not b!283023))

(assert (not b!283022))

(assert (not b!283026))

(assert (not b!283028))

(assert (not b!283024))

(assert (not start!27310))

(assert (not b!283020))

(assert (not b!283025))

(assert (not b!283019))

(check-sat)

