; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27538 () Bool)

(assert start!27538)

(declare-fun res!147066 () Bool)

(declare-fun e!180489 () Bool)

(assert (=> start!27538 (=> (not res!147066) (not e!180489))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27538 (= res!147066 (validMask!0 mask!3868))))

(assert (=> start!27538 e!180489))

(declare-datatypes ((array!14188 0))(
  ( (array!14189 (arr!6733 (Array (_ BitVec 32) (_ BitVec 64))) (size!7085 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14188)

(declare-fun array_inv!4696 (array!14188) Bool)

(assert (=> start!27538 (array_inv!4696 a!3325)))

(assert (=> start!27538 true))

(declare-fun b!284556 () Bool)

(declare-fun res!147069 () Bool)

(assert (=> b!284556 (=> (not res!147069) (not e!180489))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284556 (= res!147069 (and (= (size!7085 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7085 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7085 a!3325))))))

(declare-fun b!284557 () Bool)

(declare-fun res!147068 () Bool)

(assert (=> b!284557 (=> (not res!147068) (not e!180489))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284557 (= res!147068 (validKeyInArray!0 k!2581))))

(declare-fun b!284558 () Bool)

(declare-fun res!147067 () Bool)

(assert (=> b!284558 (=> (not res!147067) (not e!180489))))

(declare-datatypes ((List!4541 0))(
  ( (Nil!4538) (Cons!4537 (h!5210 (_ BitVec 64)) (t!9623 List!4541)) )
))
(declare-fun arrayNoDuplicates!0 (array!14188 (_ BitVec 32) List!4541) Bool)

(assert (=> b!284558 (= res!147067 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4538))))

(declare-fun b!284559 () Bool)

(declare-fun e!180490 () Bool)

(assert (=> b!284559 (= e!180489 e!180490)))

(declare-fun res!147064 () Bool)

(assert (=> b!284559 (=> (not res!147064) (not e!180490))))

(declare-datatypes ((SeekEntryResult!1891 0))(
  ( (MissingZero!1891 (index!9734 (_ BitVec 32))) (Found!1891 (index!9735 (_ BitVec 32))) (Intermediate!1891 (undefined!2703 Bool) (index!9736 (_ BitVec 32)) (x!27938 (_ BitVec 32))) (Undefined!1891) (MissingVacant!1891 (index!9737 (_ BitVec 32))) )
))
(declare-fun lt!140542 () SeekEntryResult!1891)

(assert (=> b!284559 (= res!147064 (or (= lt!140542 (MissingZero!1891 i!1267)) (= lt!140542 (MissingVacant!1891 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14188 (_ BitVec 32)) SeekEntryResult!1891)

(assert (=> b!284559 (= lt!140542 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284560 () Bool)

(declare-fun res!147065 () Bool)

(assert (=> b!284560 (=> (not res!147065) (not e!180489))))

(declare-fun arrayContainsKey!0 (array!14188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284560 (= res!147065 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284561 () Bool)

(assert (=> b!284561 (= e!180490 false)))

(declare-fun lt!140541 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14188 (_ BitVec 32)) Bool)

(assert (=> b!284561 (= lt!140541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27538 res!147066) b!284556))

(assert (= (and b!284556 res!147069) b!284557))

(assert (= (and b!284557 res!147068) b!284558))

(assert (= (and b!284558 res!147067) b!284560))

(assert (= (and b!284560 res!147065) b!284559))

(assert (= (and b!284559 res!147064) b!284561))

(declare-fun m!299545 () Bool)

(assert (=> b!284559 m!299545))

(declare-fun m!299547 () Bool)

(assert (=> b!284557 m!299547))

(declare-fun m!299549 () Bool)

(assert (=> start!27538 m!299549))

(declare-fun m!299551 () Bool)

(assert (=> start!27538 m!299551))

(declare-fun m!299553 () Bool)

(assert (=> b!284560 m!299553))

(declare-fun m!299555 () Bool)

(assert (=> b!284561 m!299555))

(declare-fun m!299557 () Bool)

(assert (=> b!284558 m!299557))

(push 1)

(assert (not b!284559))

(assert (not b!284558))

(assert (not b!284560))

(assert (not b!284561))

(assert (not b!284557))

(assert (not start!27538))

(check-sat)

