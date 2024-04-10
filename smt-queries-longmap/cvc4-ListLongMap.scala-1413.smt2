; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27508 () Bool)

(assert start!27508)

(declare-fun b!284259 () Bool)

(declare-fun e!180355 () Bool)

(assert (=> b!284259 (= e!180355 false)))

(declare-fun lt!140460 () Bool)

(declare-datatypes ((array!14158 0))(
  ( (array!14159 (arr!6718 (Array (_ BitVec 32) (_ BitVec 64))) (size!7070 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14158)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14158 (_ BitVec 32)) Bool)

(assert (=> b!284259 (= lt!140460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284260 () Bool)

(declare-fun res!146768 () Bool)

(declare-fun e!180356 () Bool)

(assert (=> b!284260 (=> (not res!146768) (not e!180356))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284260 (= res!146768 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!146767 () Bool)

(assert (=> start!27508 (=> (not res!146767) (not e!180356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27508 (= res!146767 (validMask!0 mask!3868))))

(assert (=> start!27508 e!180356))

(declare-fun array_inv!4681 (array!14158) Bool)

(assert (=> start!27508 (array_inv!4681 a!3325)))

(assert (=> start!27508 true))

(declare-fun b!284261 () Bool)

(assert (=> b!284261 (= e!180356 e!180355)))

(declare-fun res!146769 () Bool)

(assert (=> b!284261 (=> (not res!146769) (not e!180355))))

(declare-datatypes ((SeekEntryResult!1876 0))(
  ( (MissingZero!1876 (index!9674 (_ BitVec 32))) (Found!1876 (index!9675 (_ BitVec 32))) (Intermediate!1876 (undefined!2688 Bool) (index!9676 (_ BitVec 32)) (x!27883 (_ BitVec 32))) (Undefined!1876) (MissingVacant!1876 (index!9677 (_ BitVec 32))) )
))
(declare-fun lt!140461 () SeekEntryResult!1876)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284261 (= res!146769 (or (= lt!140461 (MissingZero!1876 i!1267)) (= lt!140461 (MissingVacant!1876 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14158 (_ BitVec 32)) SeekEntryResult!1876)

(assert (=> b!284261 (= lt!140461 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284262 () Bool)

(declare-fun res!146771 () Bool)

(assert (=> b!284262 (=> (not res!146771) (not e!180356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284262 (= res!146771 (validKeyInArray!0 k!2581))))

(declare-fun b!284263 () Bool)

(declare-fun res!146772 () Bool)

(assert (=> b!284263 (=> (not res!146772) (not e!180356))))

(declare-datatypes ((List!4526 0))(
  ( (Nil!4523) (Cons!4522 (h!5195 (_ BitVec 64)) (t!9608 List!4526)) )
))
(declare-fun arrayNoDuplicates!0 (array!14158 (_ BitVec 32) List!4526) Bool)

(assert (=> b!284263 (= res!146772 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4523))))

(declare-fun b!284264 () Bool)

(declare-fun res!146770 () Bool)

(assert (=> b!284264 (=> (not res!146770) (not e!180356))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284264 (= res!146770 (and (= (size!7070 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7070 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7070 a!3325))))))

(assert (= (and start!27508 res!146767) b!284264))

(assert (= (and b!284264 res!146770) b!284262))

(assert (= (and b!284262 res!146771) b!284263))

(assert (= (and b!284263 res!146772) b!284260))

(assert (= (and b!284260 res!146768) b!284261))

(assert (= (and b!284261 res!146769) b!284259))

(declare-fun m!299323 () Bool)

(assert (=> b!284263 m!299323))

(declare-fun m!299325 () Bool)

(assert (=> b!284260 m!299325))

(declare-fun m!299327 () Bool)

(assert (=> b!284259 m!299327))

(declare-fun m!299329 () Bool)

(assert (=> b!284262 m!299329))

(declare-fun m!299331 () Bool)

(assert (=> b!284261 m!299331))

(declare-fun m!299333 () Bool)

(assert (=> start!27508 m!299333))

(declare-fun m!299335 () Bool)

(assert (=> start!27508 m!299335))

(push 1)

(assert (not b!284262))

(assert (not b!284259))

(assert (not start!27508))

(assert (not b!284261))

(assert (not b!284260))

(assert (not b!284263))

(check-sat)

