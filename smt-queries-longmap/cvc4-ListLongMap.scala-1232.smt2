; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25954 () Bool)

(assert start!25954)

(declare-fun b!267900 () Bool)

(declare-fun res!132178 () Bool)

(declare-fun e!173146 () Bool)

(assert (=> b!267900 (=> (not res!132178) (not e!173146))))

(declare-datatypes ((array!13051 0))(
  ( (array!13052 (arr!6175 (Array (_ BitVec 32) (_ BitVec 64))) (size!6527 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13051)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267900 (= res!132178 (and (= (size!6527 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6527 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6527 a!3325))))))

(declare-fun b!267901 () Bool)

(declare-fun res!132181 () Bool)

(assert (=> b!267901 (=> (not res!132181) (not e!173146))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1333 0))(
  ( (MissingZero!1333 (index!7502 (_ BitVec 32))) (Found!1333 (index!7503 (_ BitVec 32))) (Intermediate!1333 (undefined!2145 Bool) (index!7504 (_ BitVec 32)) (x!25874 (_ BitVec 32))) (Undefined!1333) (MissingVacant!1333 (index!7505 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13051 (_ BitVec 32)) SeekEntryResult!1333)

(assert (=> b!267901 (= res!132181 (not (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) (MissingZero!1333 i!1267))))))

(declare-fun b!267902 () Bool)

(assert (=> b!267902 (= e!173146 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267903 () Bool)

(declare-fun res!132179 () Bool)

(assert (=> b!267903 (=> (not res!132179) (not e!173146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267903 (= res!132179 (validKeyInArray!0 k!2581))))

(declare-fun b!267904 () Bool)

(declare-fun res!132180 () Bool)

(assert (=> b!267904 (=> (not res!132180) (not e!173146))))

(declare-datatypes ((List!3983 0))(
  ( (Nil!3980) (Cons!3979 (h!4646 (_ BitVec 64)) (t!9065 List!3983)) )
))
(declare-fun arrayNoDuplicates!0 (array!13051 (_ BitVec 32) List!3983) Bool)

(assert (=> b!267904 (= res!132180 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3980))))

(declare-fun res!132183 () Bool)

(assert (=> start!25954 (=> (not res!132183) (not e!173146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25954 (= res!132183 (validMask!0 mask!3868))))

(assert (=> start!25954 e!173146))

(declare-fun array_inv!4138 (array!13051) Bool)

(assert (=> start!25954 (array_inv!4138 a!3325)))

(assert (=> start!25954 true))

(declare-fun b!267905 () Bool)

(declare-fun res!132182 () Bool)

(assert (=> b!267905 (=> (not res!132182) (not e!173146))))

(declare-fun arrayContainsKey!0 (array!13051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267905 (= res!132182 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25954 res!132183) b!267900))

(assert (= (and b!267900 res!132178) b!267903))

(assert (= (and b!267903 res!132179) b!267904))

(assert (= (and b!267904 res!132180) b!267905))

(assert (= (and b!267905 res!132182) b!267901))

(assert (= (and b!267901 res!132181) b!267902))

(declare-fun m!284151 () Bool)

(assert (=> start!25954 m!284151))

(declare-fun m!284153 () Bool)

(assert (=> start!25954 m!284153))

(declare-fun m!284155 () Bool)

(assert (=> b!267904 m!284155))

(declare-fun m!284157 () Bool)

(assert (=> b!267905 m!284157))

(declare-fun m!284159 () Bool)

(assert (=> b!267903 m!284159))

(declare-fun m!284161 () Bool)

(assert (=> b!267901 m!284161))

(push 1)

(assert (not b!267901))

(assert (not start!25954))

(assert (not b!267904))

(assert (not b!267905))

(assert (not b!267903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

