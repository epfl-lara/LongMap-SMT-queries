; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25982 () Bool)

(assert start!25982)

(declare-fun res!132390 () Bool)

(declare-fun e!173231 () Bool)

(assert (=> start!25982 (=> (not res!132390) (not e!173231))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25982 (= res!132390 (validMask!0 mask!3868))))

(assert (=> start!25982 e!173231))

(declare-datatypes ((array!13079 0))(
  ( (array!13080 (arr!6189 (Array (_ BitVec 32) (_ BitVec 64))) (size!6541 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13079)

(declare-fun array_inv!4152 (array!13079) Bool)

(assert (=> start!25982 (array_inv!4152 a!3325)))

(assert (=> start!25982 true))

(declare-fun b!268111 () Bool)

(declare-fun res!132389 () Bool)

(assert (=> b!268111 (=> (not res!132389) (not e!173231))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268111 (= res!132389 (validKeyInArray!0 k0!2581))))

(declare-fun b!268112 () Bool)

(declare-fun res!132391 () Bool)

(assert (=> b!268112 (=> (not res!132391) (not e!173231))))

(declare-fun arrayContainsKey!0 (array!13079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268112 (= res!132391 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268113 () Bool)

(declare-fun res!132392 () Bool)

(assert (=> b!268113 (=> (not res!132392) (not e!173231))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268113 (= res!132392 (and (= (size!6541 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6541 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6541 a!3325))))))

(declare-fun b!268114 () Bool)

(declare-fun res!132393 () Bool)

(assert (=> b!268114 (=> (not res!132393) (not e!173231))))

(declare-datatypes ((List!3997 0))(
  ( (Nil!3994) (Cons!3993 (h!4660 (_ BitVec 64)) (t!9079 List!3997)) )
))
(declare-fun arrayNoDuplicates!0 (array!13079 (_ BitVec 32) List!3997) Bool)

(assert (=> b!268114 (= res!132393 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3994))))

(declare-fun b!268115 () Bool)

(assert (=> b!268115 (= e!173231 false)))

(declare-datatypes ((SeekEntryResult!1347 0))(
  ( (MissingZero!1347 (index!7558 (_ BitVec 32))) (Found!1347 (index!7559 (_ BitVec 32))) (Intermediate!1347 (undefined!2159 Bool) (index!7560 (_ BitVec 32)) (x!25928 (_ BitVec 32))) (Undefined!1347) (MissingVacant!1347 (index!7561 (_ BitVec 32))) )
))
(declare-fun lt!134788 () SeekEntryResult!1347)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13079 (_ BitVec 32)) SeekEntryResult!1347)

(assert (=> b!268115 (= lt!134788 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!25982 res!132390) b!268113))

(assert (= (and b!268113 res!132392) b!268111))

(assert (= (and b!268111 res!132389) b!268114))

(assert (= (and b!268114 res!132393) b!268112))

(assert (= (and b!268112 res!132391) b!268115))

(declare-fun m!284319 () Bool)

(assert (=> b!268112 m!284319))

(declare-fun m!284321 () Bool)

(assert (=> b!268114 m!284321))

(declare-fun m!284323 () Bool)

(assert (=> b!268111 m!284323))

(declare-fun m!284325 () Bool)

(assert (=> start!25982 m!284325))

(declare-fun m!284327 () Bool)

(assert (=> start!25982 m!284327))

(declare-fun m!284329 () Bool)

(assert (=> b!268115 m!284329))

(check-sat (not b!268112) (not start!25982) (not b!268115) (not b!268114) (not b!268111))
