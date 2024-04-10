; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27586 () Bool)

(assert start!27586)

(declare-fun b!285047 () Bool)

(declare-fun res!147556 () Bool)

(declare-fun e!180705 () Bool)

(assert (=> b!285047 (=> (not res!147556) (not e!180705))))

(declare-datatypes ((array!14236 0))(
  ( (array!14237 (arr!6757 (Array (_ BitVec 32) (_ BitVec 64))) (size!7109 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14236)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285047 (= res!147556 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285048 () Bool)

(declare-fun res!147557 () Bool)

(declare-fun e!180706 () Bool)

(assert (=> b!285048 (=> (not res!147557) (not e!180706))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285048 (= res!147557 (not (validKeyInArray!0 (select (arr!6757 a!3325) startIndex!26))))))

(declare-fun b!285049 () Bool)

(declare-fun res!147558 () Bool)

(assert (=> b!285049 (=> (not res!147558) (not e!180706))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285049 (= res!147558 (not (= startIndex!26 i!1267)))))

(declare-fun b!285050 () Bool)

(declare-fun res!147561 () Bool)

(assert (=> b!285050 (=> (not res!147561) (not e!180706))))

(assert (=> b!285050 (= res!147561 (and (bvslt startIndex!26 (bvsub (size!7109 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun res!147559 () Bool)

(assert (=> start!27586 (=> (not res!147559) (not e!180705))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27586 (= res!147559 (validMask!0 mask!3868))))

(assert (=> start!27586 e!180705))

(declare-fun array_inv!4720 (array!14236) Bool)

(assert (=> start!27586 (array_inv!4720 a!3325)))

(assert (=> start!27586 true))

(declare-fun b!285051 () Bool)

(declare-fun res!147555 () Bool)

(assert (=> b!285051 (=> (not res!147555) (not e!180705))))

(assert (=> b!285051 (= res!147555 (and (= (size!7109 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7109 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7109 a!3325))))))

(declare-fun b!285052 () Bool)

(declare-fun res!147563 () Bool)

(assert (=> b!285052 (=> (not res!147563) (not e!180706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14236 (_ BitVec 32)) Bool)

(assert (=> b!285052 (= res!147563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285053 () Bool)

(declare-fun res!147564 () Bool)

(assert (=> b!285053 (=> (not res!147564) (not e!180705))))

(declare-datatypes ((List!4565 0))(
  ( (Nil!4562) (Cons!4561 (h!5234 (_ BitVec 64)) (t!9647 List!4565)) )
))
(declare-fun arrayNoDuplicates!0 (array!14236 (_ BitVec 32) List!4565) Bool)

(assert (=> b!285053 (= res!147564 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4562))))

(declare-fun b!285054 () Bool)

(assert (=> b!285054 (= e!180706 (not true))))

(assert (=> b!285054 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14237 (store (arr!6757 a!3325) i!1267 k!2581) (size!7109 a!3325)) mask!3868)))

(declare-datatypes ((Unit!9036 0))(
  ( (Unit!9037) )
))
(declare-fun lt!140676 () Unit!9036)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9036)

(assert (=> b!285054 (= lt!140676 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!285055 () Bool)

(declare-fun res!147560 () Bool)

(assert (=> b!285055 (=> (not res!147560) (not e!180705))))

(assert (=> b!285055 (= res!147560 (validKeyInArray!0 k!2581))))

(declare-fun b!285056 () Bool)

(assert (=> b!285056 (= e!180705 e!180706)))

(declare-fun res!147562 () Bool)

(assert (=> b!285056 (=> (not res!147562) (not e!180706))))

(declare-datatypes ((SeekEntryResult!1915 0))(
  ( (MissingZero!1915 (index!9830 (_ BitVec 32))) (Found!1915 (index!9831 (_ BitVec 32))) (Intermediate!1915 (undefined!2727 Bool) (index!9832 (_ BitVec 32)) (x!28026 (_ BitVec 32))) (Undefined!1915) (MissingVacant!1915 (index!9833 (_ BitVec 32))) )
))
(declare-fun lt!140677 () SeekEntryResult!1915)

(assert (=> b!285056 (= res!147562 (or (= lt!140677 (MissingZero!1915 i!1267)) (= lt!140677 (MissingVacant!1915 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14236 (_ BitVec 32)) SeekEntryResult!1915)

(assert (=> b!285056 (= lt!140677 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27586 res!147559) b!285051))

(assert (= (and b!285051 res!147555) b!285055))

(assert (= (and b!285055 res!147560) b!285053))

(assert (= (and b!285053 res!147564) b!285047))

(assert (= (and b!285047 res!147556) b!285056))

(assert (= (and b!285056 res!147562) b!285052))

(assert (= (and b!285052 res!147563) b!285049))

(assert (= (and b!285049 res!147558) b!285048))

(assert (= (and b!285048 res!147557) b!285050))

(assert (= (and b!285050 res!147561) b!285054))

(declare-fun m!299913 () Bool)

(assert (=> b!285055 m!299913))

(declare-fun m!299915 () Bool)

(assert (=> b!285052 m!299915))

(declare-fun m!299917 () Bool)

(assert (=> start!27586 m!299917))

(declare-fun m!299919 () Bool)

(assert (=> start!27586 m!299919))

(declare-fun m!299921 () Bool)

(assert (=> b!285048 m!299921))

(assert (=> b!285048 m!299921))

(declare-fun m!299923 () Bool)

(assert (=> b!285048 m!299923))

(declare-fun m!299925 () Bool)

(assert (=> b!285054 m!299925))

(declare-fun m!299927 () Bool)

(assert (=> b!285054 m!299927))

(declare-fun m!299929 () Bool)

(assert (=> b!285054 m!299929))

(declare-fun m!299931 () Bool)

(assert (=> b!285053 m!299931))

(declare-fun m!299933 () Bool)

(assert (=> b!285056 m!299933))

(declare-fun m!299935 () Bool)

(assert (=> b!285047 m!299935))

(push 1)

(assert (not b!285047))

(assert (not b!285052))

(assert (not b!285048))

(assert (not start!27586))

(assert (not b!285055))

(assert (not b!285054))

(assert (not b!285056))

(assert (not b!285053))

(check-sat)

