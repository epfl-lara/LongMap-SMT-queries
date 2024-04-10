; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25970 () Bool)

(assert start!25970)

(declare-fun b!268021 () Bool)

(declare-fun res!132300 () Bool)

(declare-fun e!173194 () Bool)

(assert (=> b!268021 (=> (not res!132300) (not e!173194))))

(declare-datatypes ((array!13067 0))(
  ( (array!13068 (arr!6183 (Array (_ BitVec 32) (_ BitVec 64))) (size!6535 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13067)

(declare-datatypes ((List!3991 0))(
  ( (Nil!3988) (Cons!3987 (h!4654 (_ BitVec 64)) (t!9073 List!3991)) )
))
(declare-fun arrayNoDuplicates!0 (array!13067 (_ BitVec 32) List!3991) Bool)

(assert (=> b!268021 (= res!132300 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3988))))

(declare-fun res!132299 () Bool)

(assert (=> start!25970 (=> (not res!132299) (not e!173194))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25970 (= res!132299 (validMask!0 mask!3868))))

(assert (=> start!25970 e!173194))

(declare-fun array_inv!4146 (array!13067) Bool)

(assert (=> start!25970 (array_inv!4146 a!3325)))

(assert (=> start!25970 true))

(declare-fun b!268022 () Bool)

(declare-fun res!132303 () Bool)

(assert (=> b!268022 (=> (not res!132303) (not e!173194))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268022 (= res!132303 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268023 () Bool)

(assert (=> b!268023 (= e!173194 false)))

(declare-datatypes ((SeekEntryResult!1341 0))(
  ( (MissingZero!1341 (index!7534 (_ BitVec 32))) (Found!1341 (index!7535 (_ BitVec 32))) (Intermediate!1341 (undefined!2153 Bool) (index!7536 (_ BitVec 32)) (x!25906 (_ BitVec 32))) (Undefined!1341) (MissingVacant!1341 (index!7537 (_ BitVec 32))) )
))
(declare-fun lt!134770 () SeekEntryResult!1341)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13067 (_ BitVec 32)) SeekEntryResult!1341)

(assert (=> b!268023 (= lt!134770 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268024 () Bool)

(declare-fun res!132301 () Bool)

(assert (=> b!268024 (=> (not res!132301) (not e!173194))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268024 (= res!132301 (and (= (size!6535 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6535 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6535 a!3325))))))

(declare-fun b!268025 () Bool)

(declare-fun res!132302 () Bool)

(assert (=> b!268025 (=> (not res!132302) (not e!173194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268025 (= res!132302 (validKeyInArray!0 k0!2581))))

(assert (= (and start!25970 res!132299) b!268024))

(assert (= (and b!268024 res!132301) b!268025))

(assert (= (and b!268025 res!132302) b!268021))

(assert (= (and b!268021 res!132300) b!268022))

(assert (= (and b!268022 res!132303) b!268023))

(declare-fun m!284247 () Bool)

(assert (=> b!268025 m!284247))

(declare-fun m!284249 () Bool)

(assert (=> start!25970 m!284249))

(declare-fun m!284251 () Bool)

(assert (=> start!25970 m!284251))

(declare-fun m!284253 () Bool)

(assert (=> b!268022 m!284253))

(declare-fun m!284255 () Bool)

(assert (=> b!268021 m!284255))

(declare-fun m!284257 () Bool)

(assert (=> b!268023 m!284257))

(check-sat (not start!25970) (not b!268023) (not b!268021) (not b!268025) (not b!268022))
