; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25960 () Bool)

(assert start!25960)

(declare-fun b!267946 () Bool)

(declare-fun res!132224 () Bool)

(declare-fun e!173164 () Bool)

(assert (=> b!267946 (=> (not res!132224) (not e!173164))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267946 (= res!132224 (validKeyInArray!0 k!2581))))

(declare-fun b!267947 () Bool)

(assert (=> b!267947 (= e!173164 false)))

(declare-datatypes ((array!13057 0))(
  ( (array!13058 (arr!6178 (Array (_ BitVec 32) (_ BitVec 64))) (size!6530 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13057)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1336 0))(
  ( (MissingZero!1336 (index!7514 (_ BitVec 32))) (Found!1336 (index!7515 (_ BitVec 32))) (Intermediate!1336 (undefined!2148 Bool) (index!7516 (_ BitVec 32)) (x!25885 (_ BitVec 32))) (Undefined!1336) (MissingVacant!1336 (index!7517 (_ BitVec 32))) )
))
(declare-fun lt!134755 () SeekEntryResult!1336)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13057 (_ BitVec 32)) SeekEntryResult!1336)

(assert (=> b!267947 (= lt!134755 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267948 () Bool)

(declare-fun res!132225 () Bool)

(assert (=> b!267948 (=> (not res!132225) (not e!173164))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267948 (= res!132225 (and (= (size!6530 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6530 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6530 a!3325))))))

(declare-fun b!267949 () Bool)

(declare-fun res!132226 () Bool)

(assert (=> b!267949 (=> (not res!132226) (not e!173164))))

(declare-datatypes ((List!3986 0))(
  ( (Nil!3983) (Cons!3982 (h!4649 (_ BitVec 64)) (t!9068 List!3986)) )
))
(declare-fun arrayNoDuplicates!0 (array!13057 (_ BitVec 32) List!3986) Bool)

(assert (=> b!267949 (= res!132226 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3983))))

(declare-fun res!132228 () Bool)

(assert (=> start!25960 (=> (not res!132228) (not e!173164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25960 (= res!132228 (validMask!0 mask!3868))))

(assert (=> start!25960 e!173164))

(declare-fun array_inv!4141 (array!13057) Bool)

(assert (=> start!25960 (array_inv!4141 a!3325)))

(assert (=> start!25960 true))

(declare-fun b!267950 () Bool)

(declare-fun res!132227 () Bool)

(assert (=> b!267950 (=> (not res!132227) (not e!173164))))

(declare-fun arrayContainsKey!0 (array!13057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267950 (= res!132227 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25960 res!132228) b!267948))

(assert (= (and b!267948 res!132225) b!267946))

(assert (= (and b!267946 res!132224) b!267949))

(assert (= (and b!267949 res!132226) b!267950))

(assert (= (and b!267950 res!132227) b!267947))

(declare-fun m!284187 () Bool)

(assert (=> b!267947 m!284187))

(declare-fun m!284189 () Bool)

(assert (=> b!267950 m!284189))

(declare-fun m!284191 () Bool)

(assert (=> b!267949 m!284191))

(declare-fun m!284193 () Bool)

(assert (=> start!25960 m!284193))

(declare-fun m!284195 () Bool)

(assert (=> start!25960 m!284195))

(declare-fun m!284197 () Bool)

(assert (=> b!267946 m!284197))

(push 1)

(assert (not b!267950))

(assert (not b!267949))

(assert (not start!25960))

(assert (not b!267947))

(assert (not b!267946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

