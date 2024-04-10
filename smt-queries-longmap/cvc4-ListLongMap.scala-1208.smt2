; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25718 () Bool)

(assert start!25718)

(declare-fun b!266689 () Bool)

(declare-fun e!172511 () Bool)

(declare-fun e!172509 () Bool)

(assert (=> b!266689 (= e!172511 e!172509)))

(declare-fun res!130988 () Bool)

(assert (=> b!266689 (=> (not res!130988) (not e!172509))))

(declare-datatypes ((SeekEntryResult!1294 0))(
  ( (MissingZero!1294 (index!7346 (_ BitVec 32))) (Found!1294 (index!7347 (_ BitVec 32))) (Intermediate!1294 (undefined!2106 Bool) (index!7348 (_ BitVec 32)) (x!25643 (_ BitVec 32))) (Undefined!1294) (MissingVacant!1294 (index!7349 (_ BitVec 32))) )
))
(declare-fun lt!134500 () SeekEntryResult!1294)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266689 (= res!130988 (or (= lt!134500 (MissingZero!1294 i!1355)) (= lt!134500 (MissingVacant!1294 i!1355))))))

(declare-datatypes ((array!12897 0))(
  ( (array!12898 (arr!6103 (Array (_ BitVec 32) (_ BitVec 64))) (size!6455 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12897)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12897 (_ BitVec 32)) SeekEntryResult!1294)

(assert (=> b!266689 (= lt!134500 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266690 () Bool)

(declare-fun res!130986 () Bool)

(assert (=> b!266690 (=> (not res!130986) (not e!172509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12897 (_ BitVec 32)) Bool)

(assert (=> b!266690 (= res!130986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266691 () Bool)

(assert (=> b!266691 (= e!172509 false)))

(declare-fun lt!134499 () Bool)

(declare-datatypes ((List!3917 0))(
  ( (Nil!3914) (Cons!3913 (h!4580 (_ BitVec 64)) (t!8999 List!3917)) )
))
(declare-fun arrayNoDuplicates!0 (array!12897 (_ BitVec 32) List!3917) Bool)

(assert (=> b!266691 (= lt!134499 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3914))))

(declare-fun b!266692 () Bool)

(declare-fun res!130987 () Bool)

(assert (=> b!266692 (=> (not res!130987) (not e!172511))))

(declare-fun arrayContainsKey!0 (array!12897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266692 (= res!130987 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266693 () Bool)

(declare-fun res!130985 () Bool)

(assert (=> b!266693 (=> (not res!130985) (not e!172511))))

(assert (=> b!266693 (= res!130985 (and (= (size!6455 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6455 a!3436))))))

(declare-fun res!130989 () Bool)

(assert (=> start!25718 (=> (not res!130989) (not e!172511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25718 (= res!130989 (validMask!0 mask!4002))))

(assert (=> start!25718 e!172511))

(assert (=> start!25718 true))

(declare-fun array_inv!4066 (array!12897) Bool)

(assert (=> start!25718 (array_inv!4066 a!3436)))

(declare-fun b!266688 () Bool)

(declare-fun res!130984 () Bool)

(assert (=> b!266688 (=> (not res!130984) (not e!172511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266688 (= res!130984 (validKeyInArray!0 k!2698))))

(assert (= (and start!25718 res!130989) b!266693))

(assert (= (and b!266693 res!130985) b!266688))

(assert (= (and b!266688 res!130984) b!266692))

(assert (= (and b!266692 res!130987) b!266689))

(assert (= (and b!266689 res!130988) b!266690))

(assert (= (and b!266690 res!130986) b!266691))

(declare-fun m!283231 () Bool)

(assert (=> b!266692 m!283231))

(declare-fun m!283233 () Bool)

(assert (=> start!25718 m!283233))

(declare-fun m!283235 () Bool)

(assert (=> start!25718 m!283235))

(declare-fun m!283237 () Bool)

(assert (=> b!266691 m!283237))

(declare-fun m!283239 () Bool)

(assert (=> b!266689 m!283239))

(declare-fun m!283241 () Bool)

(assert (=> b!266688 m!283241))

(declare-fun m!283243 () Bool)

(assert (=> b!266690 m!283243))

(push 1)

(assert (not b!266689))

(assert (not b!266691))

(assert (not start!25718))

(assert (not b!266688))

(assert (not b!266692))

