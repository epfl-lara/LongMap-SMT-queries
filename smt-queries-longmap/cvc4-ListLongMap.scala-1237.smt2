; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25982 () Bool)

(assert start!25982)

(declare-fun b!268158 () Bool)

(declare-fun res!132411 () Bool)

(declare-fun e!173254 () Bool)

(assert (=> b!268158 (=> (not res!132411) (not e!173254))))

(declare-datatypes ((array!13078 0))(
  ( (array!13079 (arr!6188 (Array (_ BitVec 32) (_ BitVec 64))) (size!6540 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13078)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268158 (= res!132411 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268159 () Bool)

(declare-fun res!132410 () Bool)

(assert (=> b!268159 (=> (not res!132410) (not e!173254))))

(declare-datatypes ((List!3909 0))(
  ( (Nil!3906) (Cons!3905 (h!4572 (_ BitVec 64)) (t!8983 List!3909)) )
))
(declare-fun arrayNoDuplicates!0 (array!13078 (_ BitVec 32) List!3909) Bool)

(assert (=> b!268159 (= res!132410 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3906))))

(declare-fun res!132413 () Bool)

(assert (=> start!25982 (=> (not res!132413) (not e!173254))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25982 (= res!132413 (validMask!0 mask!3868))))

(assert (=> start!25982 e!173254))

(declare-fun array_inv!4138 (array!13078) Bool)

(assert (=> start!25982 (array_inv!4138 a!3325)))

(assert (=> start!25982 true))

(declare-fun b!268160 () Bool)

(declare-fun res!132414 () Bool)

(assert (=> b!268160 (=> (not res!132414) (not e!173254))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268160 (= res!132414 (and (= (size!6540 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6540 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6540 a!3325))))))

(declare-fun b!268161 () Bool)

(declare-fun res!132412 () Bool)

(assert (=> b!268161 (=> (not res!132412) (not e!173254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268161 (= res!132412 (validKeyInArray!0 k!2581))))

(declare-fun b!268162 () Bool)

(assert (=> b!268162 (= e!173254 false)))

(declare-datatypes ((SeekEntryResult!1311 0))(
  ( (MissingZero!1311 (index!7414 (_ BitVec 32))) (Found!1311 (index!7415 (_ BitVec 32))) (Intermediate!1311 (undefined!2123 Bool) (index!7416 (_ BitVec 32)) (x!25892 (_ BitVec 32))) (Undefined!1311) (MissingVacant!1311 (index!7417 (_ BitVec 32))) )
))
(declare-fun lt!134847 () SeekEntryResult!1311)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13078 (_ BitVec 32)) SeekEntryResult!1311)

(assert (=> b!268162 (= lt!134847 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!25982 res!132413) b!268160))

(assert (= (and b!268160 res!132414) b!268161))

(assert (= (and b!268161 res!132412) b!268159))

(assert (= (and b!268159 res!132410) b!268158))

(assert (= (and b!268158 res!132411) b!268162))

(declare-fun m!284525 () Bool)

(assert (=> b!268159 m!284525))

(declare-fun m!284527 () Bool)

(assert (=> b!268161 m!284527))

(declare-fun m!284529 () Bool)

(assert (=> b!268158 m!284529))

(declare-fun m!284531 () Bool)

(assert (=> b!268162 m!284531))

(declare-fun m!284533 () Bool)

(assert (=> start!25982 m!284533))

(declare-fun m!284535 () Bool)

(assert (=> start!25982 m!284535))

(push 1)

(assert (not start!25982))

(assert (not b!268159))

(assert (not b!268158))

(assert (not b!268162))

(assert (not b!268161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

