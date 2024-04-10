; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27556 () Bool)

(assert start!27556)

(declare-fun b!284718 () Bool)

(declare-fun res!147230 () Bool)

(declare-fun e!180571 () Bool)

(assert (=> b!284718 (=> (not res!147230) (not e!180571))))

(declare-datatypes ((array!14206 0))(
  ( (array!14207 (arr!6742 (Array (_ BitVec 32) (_ BitVec 64))) (size!7094 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14206)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284718 (= res!147230 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284719 () Bool)

(declare-fun res!147228 () Bool)

(assert (=> b!284719 (=> (not res!147228) (not e!180571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284719 (= res!147228 (validKeyInArray!0 k!2581))))

(declare-fun b!284720 () Bool)

(declare-fun res!147229 () Bool)

(assert (=> b!284720 (=> (not res!147229) (not e!180571))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284720 (= res!147229 (and (= (size!7094 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7094 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7094 a!3325))))))

(declare-fun res!147227 () Bool)

(assert (=> start!27556 (=> (not res!147227) (not e!180571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27556 (= res!147227 (validMask!0 mask!3868))))

(assert (=> start!27556 e!180571))

(declare-fun array_inv!4705 (array!14206) Bool)

(assert (=> start!27556 (array_inv!4705 a!3325)))

(assert (=> start!27556 true))

(declare-fun b!284721 () Bool)

(declare-fun e!180572 () Bool)

(assert (=> b!284721 (= e!180572 false)))

(declare-fun lt!140595 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14206 (_ BitVec 32)) Bool)

(assert (=> b!284721 (= lt!140595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284722 () Bool)

(assert (=> b!284722 (= e!180571 e!180572)))

(declare-fun res!147226 () Bool)

(assert (=> b!284722 (=> (not res!147226) (not e!180572))))

(declare-datatypes ((SeekEntryResult!1900 0))(
  ( (MissingZero!1900 (index!9770 (_ BitVec 32))) (Found!1900 (index!9771 (_ BitVec 32))) (Intermediate!1900 (undefined!2712 Bool) (index!9772 (_ BitVec 32)) (x!27971 (_ BitVec 32))) (Undefined!1900) (MissingVacant!1900 (index!9773 (_ BitVec 32))) )
))
(declare-fun lt!140596 () SeekEntryResult!1900)

(assert (=> b!284722 (= res!147226 (or (= lt!140596 (MissingZero!1900 i!1267)) (= lt!140596 (MissingVacant!1900 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14206 (_ BitVec 32)) SeekEntryResult!1900)

(assert (=> b!284722 (= lt!140596 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284723 () Bool)

(declare-fun res!147231 () Bool)

(assert (=> b!284723 (=> (not res!147231) (not e!180571))))

(declare-datatypes ((List!4550 0))(
  ( (Nil!4547) (Cons!4546 (h!5219 (_ BitVec 64)) (t!9632 List!4550)) )
))
(declare-fun arrayNoDuplicates!0 (array!14206 (_ BitVec 32) List!4550) Bool)

(assert (=> b!284723 (= res!147231 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4547))))

(assert (= (and start!27556 res!147227) b!284720))

(assert (= (and b!284720 res!147229) b!284719))

(assert (= (and b!284719 res!147228) b!284723))

(assert (= (and b!284723 res!147231) b!284718))

(assert (= (and b!284718 res!147230) b!284722))

(assert (= (and b!284722 res!147226) b!284721))

(declare-fun m!299671 () Bool)

(assert (=> b!284718 m!299671))

(declare-fun m!299673 () Bool)

(assert (=> b!284719 m!299673))

(declare-fun m!299675 () Bool)

(assert (=> b!284721 m!299675))

(declare-fun m!299677 () Bool)

(assert (=> b!284723 m!299677))

(declare-fun m!299679 () Bool)

(assert (=> b!284722 m!299679))

(declare-fun m!299681 () Bool)

(assert (=> start!27556 m!299681))

(declare-fun m!299683 () Bool)

(assert (=> start!27556 m!299683))

(push 1)

(assert (not start!27556))

(assert (not b!284723))

(assert (not b!284719))

(assert (not b!284722))

(assert (not b!284721))

(assert (not b!284718))

(check-sat)

