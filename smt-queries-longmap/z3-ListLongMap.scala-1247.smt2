; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26040 () Bool)

(assert start!26040)

(declare-fun b!268676 () Bool)

(declare-fun res!132932 () Bool)

(declare-fun e!173502 () Bool)

(assert (=> b!268676 (=> (not res!132932) (not e!173502))))

(declare-datatypes ((array!13136 0))(
  ( (array!13137 (arr!6217 (Array (_ BitVec 32) (_ BitVec 64))) (size!6569 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13136)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268676 (= res!132932 (and (= (size!6569 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6569 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6569 a!3325))))))

(declare-fun res!132930 () Bool)

(assert (=> start!26040 (=> (not res!132930) (not e!173502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26040 (= res!132930 (validMask!0 mask!3868))))

(assert (=> start!26040 e!173502))

(declare-fun array_inv!4167 (array!13136) Bool)

(assert (=> start!26040 (array_inv!4167 a!3325)))

(assert (=> start!26040 true))

(declare-fun b!268677 () Bool)

(declare-fun res!132933 () Bool)

(assert (=> b!268677 (=> (not res!132933) (not e!173502))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268677 (= res!132933 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268678 () Bool)

(declare-fun e!173504 () Bool)

(assert (=> b!268678 (= e!173504 false)))

(declare-fun lt!135000 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13136 (_ BitVec 32)) Bool)

(assert (=> b!268678 (= lt!135000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268679 () Bool)

(assert (=> b!268679 (= e!173502 e!173504)))

(declare-fun res!132931 () Bool)

(assert (=> b!268679 (=> (not res!132931) (not e!173504))))

(declare-datatypes ((SeekEntryResult!1340 0))(
  ( (MissingZero!1340 (index!7530 (_ BitVec 32))) (Found!1340 (index!7531 (_ BitVec 32))) (Intermediate!1340 (undefined!2152 Bool) (index!7532 (_ BitVec 32)) (x!26001 (_ BitVec 32))) (Undefined!1340) (MissingVacant!1340 (index!7533 (_ BitVec 32))) )
))
(declare-fun lt!134999 () SeekEntryResult!1340)

(assert (=> b!268679 (= res!132931 (or (= lt!134999 (MissingZero!1340 i!1267)) (= lt!134999 (MissingVacant!1340 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13136 (_ BitVec 32)) SeekEntryResult!1340)

(assert (=> b!268679 (= lt!134999 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268680 () Bool)

(declare-fun res!132929 () Bool)

(assert (=> b!268680 (=> (not res!132929) (not e!173502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268680 (= res!132929 (validKeyInArray!0 k0!2581))))

(declare-fun b!268681 () Bool)

(declare-fun res!132928 () Bool)

(assert (=> b!268681 (=> (not res!132928) (not e!173502))))

(declare-datatypes ((List!3938 0))(
  ( (Nil!3935) (Cons!3934 (h!4601 (_ BitVec 64)) (t!9012 List!3938)) )
))
(declare-fun arrayNoDuplicates!0 (array!13136 (_ BitVec 32) List!3938) Bool)

(assert (=> b!268681 (= res!132928 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3935))))

(assert (= (and start!26040 res!132930) b!268676))

(assert (= (and b!268676 res!132932) b!268680))

(assert (= (and b!268680 res!132929) b!268681))

(assert (= (and b!268681 res!132928) b!268677))

(assert (= (and b!268677 res!132933) b!268679))

(assert (= (and b!268679 res!132931) b!268678))

(declare-fun m!284921 () Bool)

(assert (=> b!268678 m!284921))

(declare-fun m!284923 () Bool)

(assert (=> b!268680 m!284923))

(declare-fun m!284925 () Bool)

(assert (=> b!268677 m!284925))

(declare-fun m!284927 () Bool)

(assert (=> b!268681 m!284927))

(declare-fun m!284929 () Bool)

(assert (=> b!268679 m!284929))

(declare-fun m!284931 () Bool)

(assert (=> start!26040 m!284931))

(declare-fun m!284933 () Bool)

(assert (=> start!26040 m!284933))

(check-sat (not b!268678) (not b!268681) (not start!26040) (not b!268680) (not b!268677) (not b!268679))
(check-sat)
