; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25974 () Bool)

(assert start!25974)

(declare-fun b!267889 () Bool)

(declare-fun res!132221 () Bool)

(declare-fun e!173100 () Bool)

(assert (=> b!267889 (=> (not res!132221) (not e!173100))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267889 (= res!132221 (validKeyInArray!0 k!2581))))

(declare-fun b!267890 () Bool)

(declare-fun res!132219 () Bool)

(assert (=> b!267890 (=> (not res!132219) (not e!173100))))

(declare-datatypes ((array!13060 0))(
  ( (array!13061 (arr!6179 (Array (_ BitVec 32) (_ BitVec 64))) (size!6532 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13060)

(declare-datatypes ((List!3960 0))(
  ( (Nil!3957) (Cons!3956 (h!4623 (_ BitVec 64)) (t!9033 List!3960)) )
))
(declare-fun arrayNoDuplicates!0 (array!13060 (_ BitVec 32) List!3960) Bool)

(assert (=> b!267890 (= res!132219 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3957))))

(declare-fun b!267891 () Bool)

(assert (=> b!267891 (= e!173100 false)))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1336 0))(
  ( (MissingZero!1336 (index!7514 (_ BitVec 32))) (Found!1336 (index!7515 (_ BitVec 32))) (Intermediate!1336 (undefined!2148 Bool) (index!7516 (_ BitVec 32)) (x!25900 (_ BitVec 32))) (Undefined!1336) (MissingVacant!1336 (index!7517 (_ BitVec 32))) )
))
(declare-fun lt!134592 () SeekEntryResult!1336)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13060 (_ BitVec 32)) SeekEntryResult!1336)

(assert (=> b!267891 (= lt!134592 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267892 () Bool)

(declare-fun res!132220 () Bool)

(assert (=> b!267892 (=> (not res!132220) (not e!173100))))

(declare-fun arrayContainsKey!0 (array!13060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267892 (= res!132220 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267893 () Bool)

(declare-fun res!132223 () Bool)

(assert (=> b!267893 (=> (not res!132223) (not e!173100))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267893 (= res!132223 (and (= (size!6532 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6532 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6532 a!3325))))))

(declare-fun res!132222 () Bool)

(assert (=> start!25974 (=> (not res!132222) (not e!173100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25974 (= res!132222 (validMask!0 mask!3868))))

(assert (=> start!25974 e!173100))

(declare-fun array_inv!4151 (array!13060) Bool)

(assert (=> start!25974 (array_inv!4151 a!3325)))

(assert (=> start!25974 true))

(assert (= (and start!25974 res!132222) b!267893))

(assert (= (and b!267893 res!132223) b!267889))

(assert (= (and b!267889 res!132221) b!267890))

(assert (= (and b!267890 res!132219) b!267892))

(assert (= (and b!267892 res!132220) b!267891))

(declare-fun m!283667 () Bool)

(assert (=> b!267891 m!283667))

(declare-fun m!283669 () Bool)

(assert (=> start!25974 m!283669))

(declare-fun m!283671 () Bool)

(assert (=> start!25974 m!283671))

(declare-fun m!283673 () Bool)

(assert (=> b!267890 m!283673))

(declare-fun m!283675 () Bool)

(assert (=> b!267892 m!283675))

(declare-fun m!283677 () Bool)

(assert (=> b!267889 m!283677))

(push 1)

(assert (not b!267890))

(assert (not start!25974))

(assert (not b!267891))

(assert (not b!267889))

(assert (not b!267892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

