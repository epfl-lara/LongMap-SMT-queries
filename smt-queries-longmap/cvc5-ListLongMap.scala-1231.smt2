; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25948 () Bool)

(assert start!25948)

(declare-fun b!267894 () Bool)

(declare-fun res!132146 () Bool)

(declare-fun e!173153 () Bool)

(assert (=> b!267894 (=> (not res!132146) (not e!173153))))

(declare-datatypes ((array!13044 0))(
  ( (array!13045 (arr!6171 (Array (_ BitVec 32) (_ BitVec 64))) (size!6523 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13044)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267894 (= res!132146 (and (= (size!6523 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6523 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6523 a!3325))))))

(declare-fun res!132148 () Bool)

(assert (=> start!25948 (=> (not res!132148) (not e!173153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25948 (= res!132148 (validMask!0 mask!3868))))

(assert (=> start!25948 e!173153))

(declare-fun array_inv!4121 (array!13044) Bool)

(assert (=> start!25948 (array_inv!4121 a!3325)))

(assert (=> start!25948 true))

(declare-fun b!267895 () Bool)

(declare-fun res!132150 () Bool)

(assert (=> b!267895 (=> (not res!132150) (not e!173153))))

(declare-datatypes ((List!3892 0))(
  ( (Nil!3889) (Cons!3888 (h!4555 (_ BitVec 64)) (t!8966 List!3892)) )
))
(declare-fun arrayNoDuplicates!0 (array!13044 (_ BitVec 32) List!3892) Bool)

(assert (=> b!267895 (= res!132150 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3889))))

(declare-fun b!267896 () Bool)

(assert (=> b!267896 (= e!173153 false)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1294 0))(
  ( (MissingZero!1294 (index!7346 (_ BitVec 32))) (Found!1294 (index!7347 (_ BitVec 32))) (Intermediate!1294 (undefined!2106 Bool) (index!7348 (_ BitVec 32)) (x!25827 (_ BitVec 32))) (Undefined!1294) (MissingVacant!1294 (index!7349 (_ BitVec 32))) )
))
(declare-fun lt!134805 () SeekEntryResult!1294)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13044 (_ BitVec 32)) SeekEntryResult!1294)

(assert (=> b!267896 (= lt!134805 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267897 () Bool)

(declare-fun res!132149 () Bool)

(assert (=> b!267897 (=> (not res!132149) (not e!173153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267897 (= res!132149 (validKeyInArray!0 k!2581))))

(declare-fun b!267898 () Bool)

(declare-fun res!132147 () Bool)

(assert (=> b!267898 (=> (not res!132147) (not e!173153))))

(declare-fun arrayContainsKey!0 (array!13044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267898 (= res!132147 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25948 res!132148) b!267894))

(assert (= (and b!267894 res!132146) b!267897))

(assert (= (and b!267897 res!132149) b!267895))

(assert (= (and b!267895 res!132150) b!267898))

(assert (= (and b!267898 res!132147) b!267896))

(declare-fun m!284321 () Bool)

(assert (=> start!25948 m!284321))

(declare-fun m!284323 () Bool)

(assert (=> start!25948 m!284323))

(declare-fun m!284325 () Bool)

(assert (=> b!267895 m!284325))

(declare-fun m!284327 () Bool)

(assert (=> b!267896 m!284327))

(declare-fun m!284329 () Bool)

(assert (=> b!267898 m!284329))

(declare-fun m!284331 () Bool)

(assert (=> b!267897 m!284331))

(push 1)

(assert (not start!25948))

(assert (not b!267898))

(assert (not b!267896))

(assert (not b!267895))

(assert (not b!267897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

