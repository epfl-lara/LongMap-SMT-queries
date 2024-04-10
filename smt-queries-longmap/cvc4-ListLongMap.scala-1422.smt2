; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27562 () Bool)

(assert start!27562)

(declare-fun b!284772 () Bool)

(declare-fun res!147281 () Bool)

(declare-fun e!180597 () Bool)

(assert (=> b!284772 (=> (not res!147281) (not e!180597))))

(declare-datatypes ((array!14212 0))(
  ( (array!14213 (arr!6745 (Array (_ BitVec 32) (_ BitVec 64))) (size!7097 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14212)

(declare-datatypes ((List!4553 0))(
  ( (Nil!4550) (Cons!4549 (h!5222 (_ BitVec 64)) (t!9635 List!4553)) )
))
(declare-fun arrayNoDuplicates!0 (array!14212 (_ BitVec 32) List!4553) Bool)

(assert (=> b!284772 (= res!147281 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4550))))

(declare-fun res!147285 () Bool)

(assert (=> start!27562 (=> (not res!147285) (not e!180597))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27562 (= res!147285 (validMask!0 mask!3868))))

(assert (=> start!27562 e!180597))

(declare-fun array_inv!4708 (array!14212) Bool)

(assert (=> start!27562 (array_inv!4708 a!3325)))

(assert (=> start!27562 true))

(declare-fun b!284773 () Bool)

(declare-fun res!147283 () Bool)

(assert (=> b!284773 (=> (not res!147283) (not e!180597))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284773 (= res!147283 (validKeyInArray!0 k!2581))))

(declare-fun b!284774 () Bool)

(declare-fun e!180599 () Bool)

(assert (=> b!284774 (= e!180597 e!180599)))

(declare-fun res!147280 () Bool)

(assert (=> b!284774 (=> (not res!147280) (not e!180599))))

(declare-datatypes ((SeekEntryResult!1903 0))(
  ( (MissingZero!1903 (index!9782 (_ BitVec 32))) (Found!1903 (index!9783 (_ BitVec 32))) (Intermediate!1903 (undefined!2715 Bool) (index!9784 (_ BitVec 32)) (x!27982 (_ BitVec 32))) (Undefined!1903) (MissingVacant!1903 (index!9785 (_ BitVec 32))) )
))
(declare-fun lt!140613 () SeekEntryResult!1903)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284774 (= res!147280 (or (= lt!140613 (MissingZero!1903 i!1267)) (= lt!140613 (MissingVacant!1903 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14212 (_ BitVec 32)) SeekEntryResult!1903)

(assert (=> b!284774 (= lt!140613 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284775 () Bool)

(declare-fun res!147284 () Bool)

(assert (=> b!284775 (=> (not res!147284) (not e!180597))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284775 (= res!147284 (and (= (size!7097 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7097 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7097 a!3325))))))

(declare-fun b!284776 () Bool)

(declare-fun res!147282 () Bool)

(assert (=> b!284776 (=> (not res!147282) (not e!180597))))

(declare-fun arrayContainsKey!0 (array!14212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284776 (= res!147282 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284777 () Bool)

(assert (=> b!284777 (= e!180599 false)))

(declare-fun lt!140614 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14212 (_ BitVec 32)) Bool)

(assert (=> b!284777 (= lt!140614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27562 res!147285) b!284775))

(assert (= (and b!284775 res!147284) b!284773))

(assert (= (and b!284773 res!147283) b!284772))

(assert (= (and b!284772 res!147281) b!284776))

(assert (= (and b!284776 res!147282) b!284774))

(assert (= (and b!284774 res!147280) b!284777))

(declare-fun m!299713 () Bool)

(assert (=> b!284774 m!299713))

(declare-fun m!299715 () Bool)

(assert (=> b!284776 m!299715))

(declare-fun m!299717 () Bool)

(assert (=> start!27562 m!299717))

(declare-fun m!299719 () Bool)

(assert (=> start!27562 m!299719))

(declare-fun m!299721 () Bool)

(assert (=> b!284772 m!299721))

(declare-fun m!299723 () Bool)

(assert (=> b!284773 m!299723))

(declare-fun m!299725 () Bool)

(assert (=> b!284777 m!299725))

(push 1)

(assert (not b!284776))

(assert (not b!284773))

(assert (not b!284772))

(assert (not b!284777))

(assert (not b!284774))

(assert (not start!27562))

(check-sat)

