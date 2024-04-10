; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25706 () Bool)

(assert start!25706)

(declare-fun b!266580 () Bool)

(declare-fun e!172455 () Bool)

(declare-fun e!172456 () Bool)

(assert (=> b!266580 (= e!172455 e!172456)))

(declare-fun res!130881 () Bool)

(assert (=> b!266580 (=> (not res!130881) (not e!172456))))

(declare-datatypes ((SeekEntryResult!1288 0))(
  ( (MissingZero!1288 (index!7322 (_ BitVec 32))) (Found!1288 (index!7323 (_ BitVec 32))) (Intermediate!1288 (undefined!2100 Bool) (index!7324 (_ BitVec 32)) (x!25621 (_ BitVec 32))) (Undefined!1288) (MissingVacant!1288 (index!7325 (_ BitVec 32))) )
))
(declare-fun lt!134463 () SeekEntryResult!1288)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266580 (= res!130881 (or (= lt!134463 (MissingZero!1288 i!1355)) (= lt!134463 (MissingVacant!1288 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((array!12885 0))(
  ( (array!12886 (arr!6097 (Array (_ BitVec 32) (_ BitVec 64))) (size!6449 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12885)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12885 (_ BitVec 32)) SeekEntryResult!1288)

(assert (=> b!266580 (= lt!134463 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266581 () Bool)

(declare-fun res!130880 () Bool)

(assert (=> b!266581 (=> (not res!130880) (not e!172455))))

(declare-fun arrayContainsKey!0 (array!12885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266581 (= res!130880 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266582 () Bool)

(declare-fun res!130879 () Bool)

(assert (=> b!266582 (=> (not res!130879) (not e!172455))))

(assert (=> b!266582 (= res!130879 (and (= (size!6449 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6449 a!3436))))))

(declare-fun b!266584 () Bool)

(declare-fun res!130877 () Bool)

(assert (=> b!266584 (=> (not res!130877) (not e!172455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266584 (= res!130877 (validKeyInArray!0 k!2698))))

(declare-fun b!266585 () Bool)

(assert (=> b!266585 (= e!172456 false)))

(declare-fun lt!134464 () Bool)

(declare-datatypes ((List!3911 0))(
  ( (Nil!3908) (Cons!3907 (h!4574 (_ BitVec 64)) (t!8993 List!3911)) )
))
(declare-fun arrayNoDuplicates!0 (array!12885 (_ BitVec 32) List!3911) Bool)

(assert (=> b!266585 (= lt!134464 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3908))))

(declare-fun b!266583 () Bool)

(declare-fun res!130878 () Bool)

(assert (=> b!266583 (=> (not res!130878) (not e!172456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12885 (_ BitVec 32)) Bool)

(assert (=> b!266583 (= res!130878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130876 () Bool)

(assert (=> start!25706 (=> (not res!130876) (not e!172455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25706 (= res!130876 (validMask!0 mask!4002))))

(assert (=> start!25706 e!172455))

(assert (=> start!25706 true))

(declare-fun array_inv!4060 (array!12885) Bool)

(assert (=> start!25706 (array_inv!4060 a!3436)))

(assert (= (and start!25706 res!130876) b!266582))

(assert (= (and b!266582 res!130879) b!266584))

(assert (= (and b!266584 res!130877) b!266581))

(assert (= (and b!266581 res!130880) b!266580))

(assert (= (and b!266580 res!130881) b!266583))

(assert (= (and b!266583 res!130878) b!266585))

(declare-fun m!283147 () Bool)

(assert (=> b!266580 m!283147))

(declare-fun m!283149 () Bool)

(assert (=> b!266584 m!283149))

(declare-fun m!283151 () Bool)

(assert (=> b!266585 m!283151))

(declare-fun m!283153 () Bool)

(assert (=> b!266581 m!283153))

(declare-fun m!283155 () Bool)

(assert (=> b!266583 m!283155))

(declare-fun m!283157 () Bool)

(assert (=> start!25706 m!283157))

(declare-fun m!283159 () Bool)

(assert (=> start!25706 m!283159))

(push 1)

(assert (not b!266581))

(assert (not b!266585))

(assert (not start!25706))

(assert (not b!266580))

(assert (not b!266584))

