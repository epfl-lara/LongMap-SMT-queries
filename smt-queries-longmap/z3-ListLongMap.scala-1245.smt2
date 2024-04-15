; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26030 () Bool)

(assert start!26030)

(declare-fun b!268374 () Bool)

(declare-fun res!132705 () Bool)

(declare-fun e!173323 () Bool)

(assert (=> b!268374 (=> (not res!132705) (not e!173323))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268374 (= res!132705 (validKeyInArray!0 k0!2581))))

(declare-fun b!268375 () Bool)

(declare-fun res!132704 () Bool)

(assert (=> b!268375 (=> (not res!132704) (not e!173323))))

(declare-datatypes ((array!13116 0))(
  ( (array!13117 (arr!6207 (Array (_ BitVec 32) (_ BitVec 64))) (size!6560 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13116)

(declare-fun arrayContainsKey!0 (array!13116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268375 (= res!132704 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268376 () Bool)

(declare-fun e!173325 () Bool)

(assert (=> b!268376 (= e!173325 false)))

(declare-fun lt!134724 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13116 (_ BitVec 32)) Bool)

(assert (=> b!268376 (= lt!134724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268377 () Bool)

(declare-fun res!132707 () Bool)

(assert (=> b!268377 (=> (not res!132707) (not e!173323))))

(declare-datatypes ((List!3988 0))(
  ( (Nil!3985) (Cons!3984 (h!4651 (_ BitVec 64)) (t!9061 List!3988)) )
))
(declare-fun arrayNoDuplicates!0 (array!13116 (_ BitVec 32) List!3988) Bool)

(assert (=> b!268377 (= res!132707 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3985))))

(declare-fun res!132706 () Bool)

(assert (=> start!26030 (=> (not res!132706) (not e!173323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26030 (= res!132706 (validMask!0 mask!3868))))

(assert (=> start!26030 e!173323))

(declare-fun array_inv!4179 (array!13116) Bool)

(assert (=> start!26030 (array_inv!4179 a!3325)))

(assert (=> start!26030 true))

(declare-fun b!268378 () Bool)

(declare-fun res!132708 () Bool)

(assert (=> b!268378 (=> (not res!132708) (not e!173323))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268378 (= res!132708 (and (= (size!6560 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6560 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6560 a!3325))))))

(declare-fun b!268379 () Bool)

(assert (=> b!268379 (= e!173323 e!173325)))

(declare-fun res!132709 () Bool)

(assert (=> b!268379 (=> (not res!132709) (not e!173325))))

(declare-datatypes ((SeekEntryResult!1364 0))(
  ( (MissingZero!1364 (index!7626 (_ BitVec 32))) (Found!1364 (index!7627 (_ BitVec 32))) (Intermediate!1364 (undefined!2176 Bool) (index!7628 (_ BitVec 32)) (x!26008 (_ BitVec 32))) (Undefined!1364) (MissingVacant!1364 (index!7629 (_ BitVec 32))) )
))
(declare-fun lt!134723 () SeekEntryResult!1364)

(assert (=> b!268379 (= res!132709 (or (= lt!134723 (MissingZero!1364 i!1267)) (= lt!134723 (MissingVacant!1364 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13116 (_ BitVec 32)) SeekEntryResult!1364)

(assert (=> b!268379 (= lt!134723 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26030 res!132706) b!268378))

(assert (= (and b!268378 res!132708) b!268374))

(assert (= (and b!268374 res!132705) b!268377))

(assert (= (and b!268377 res!132707) b!268375))

(assert (= (and b!268375 res!132704) b!268379))

(assert (= (and b!268379 res!132709) b!268376))

(declare-fun m!284039 () Bool)

(assert (=> b!268377 m!284039))

(declare-fun m!284041 () Bool)

(assert (=> start!26030 m!284041))

(declare-fun m!284043 () Bool)

(assert (=> start!26030 m!284043))

(declare-fun m!284045 () Bool)

(assert (=> b!268379 m!284045))

(declare-fun m!284047 () Bool)

(assert (=> b!268375 m!284047))

(declare-fun m!284049 () Bool)

(assert (=> b!268374 m!284049))

(declare-fun m!284051 () Bool)

(assert (=> b!268376 m!284051))

(check-sat (not b!268377) (not b!268376) (not b!268374) (not b!268375) (not b!268379) (not start!26030))
(check-sat)
