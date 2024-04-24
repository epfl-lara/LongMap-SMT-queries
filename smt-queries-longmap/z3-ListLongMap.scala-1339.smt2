; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26592 () Bool)

(assert start!26592)

(declare-fun b!276125 () Bool)

(declare-fun e!176463 () Bool)

(declare-fun e!176465 () Bool)

(assert (=> b!276125 (= e!176463 e!176465)))

(declare-fun res!140091 () Bool)

(assert (=> b!276125 (=> (not res!140091) (not e!176465))))

(declare-datatypes ((SeekEntryResult!1616 0))(
  ( (MissingZero!1616 (index!8634 (_ BitVec 32))) (Found!1616 (index!8635 (_ BitVec 32))) (Intermediate!1616 (undefined!2428 Bool) (index!8636 (_ BitVec 32)) (x!27013 (_ BitVec 32))) (Undefined!1616) (MissingVacant!1616 (index!8637 (_ BitVec 32))) )
))
(declare-fun lt!137607 () SeekEntryResult!1616)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276125 (= res!140091 (or (= lt!137607 (MissingZero!1616 i!1267)) (= lt!137607 (MissingVacant!1616 i!1267))))))

(declare-datatypes ((array!13688 0))(
  ( (array!13689 (arr!6493 (Array (_ BitVec 32) (_ BitVec 64))) (size!6845 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13688)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13688 (_ BitVec 32)) SeekEntryResult!1616)

(assert (=> b!276125 (= lt!137607 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276126 () Bool)

(declare-fun res!140094 () Bool)

(assert (=> b!276126 (=> (not res!140094) (not e!176465))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276126 (= res!140094 (not (validKeyInArray!0 (select (arr!6493 a!3325) startIndex!26))))))

(declare-fun b!276127 () Bool)

(declare-fun res!140095 () Bool)

(assert (=> b!276127 (=> (not res!140095) (not e!176463))))

(declare-datatypes ((List!4214 0))(
  ( (Nil!4211) (Cons!4210 (h!4877 (_ BitVec 64)) (t!9288 List!4214)) )
))
(declare-fun arrayNoDuplicates!0 (array!13688 (_ BitVec 32) List!4214) Bool)

(assert (=> b!276127 (= res!140095 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4211))))

(declare-fun res!140096 () Bool)

(assert (=> start!26592 (=> (not res!140096) (not e!176463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26592 (= res!140096 (validMask!0 mask!3868))))

(assert (=> start!26592 e!176463))

(declare-fun array_inv!4443 (array!13688) Bool)

(assert (=> start!26592 (array_inv!4443 a!3325)))

(assert (=> start!26592 true))

(declare-fun b!276128 () Bool)

(declare-fun res!140089 () Bool)

(assert (=> b!276128 (=> (not res!140089) (not e!176465))))

(assert (=> b!276128 (= res!140089 (not (= startIndex!26 i!1267)))))

(declare-fun b!276129 () Bool)

(declare-fun res!140090 () Bool)

(assert (=> b!276129 (=> (not res!140090) (not e!176463))))

(declare-fun arrayContainsKey!0 (array!13688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276129 (= res!140090 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276130 () Bool)

(declare-fun res!140093 () Bool)

(assert (=> b!276130 (=> (not res!140093) (not e!176465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13688 (_ BitVec 32)) Bool)

(assert (=> b!276130 (= res!140093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276131 () Bool)

(declare-fun res!140092 () Bool)

(assert (=> b!276131 (=> (not res!140092) (not e!176463))))

(assert (=> b!276131 (= res!140092 (and (= (size!6845 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6845 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6845 a!3325))))))

(declare-fun b!276132 () Bool)

(declare-fun res!140097 () Bool)

(assert (=> b!276132 (=> (not res!140097) (not e!176463))))

(assert (=> b!276132 (= res!140097 (validKeyInArray!0 k0!2581))))

(declare-fun b!276133 () Bool)

(assert (=> b!276133 (= e!176465 (and (bvsge startIndex!26 (bvsub (size!6845 a!3325) #b00000000000000000000000000000001)) (bvsgt startIndex!26 (size!6845 a!3325))))))

(assert (= (and start!26592 res!140096) b!276131))

(assert (= (and b!276131 res!140092) b!276132))

(assert (= (and b!276132 res!140097) b!276127))

(assert (= (and b!276127 res!140095) b!276129))

(assert (= (and b!276129 res!140090) b!276125))

(assert (= (and b!276125 res!140091) b!276130))

(assert (= (and b!276130 res!140093) b!276128))

(assert (= (and b!276128 res!140089) b!276126))

(assert (= (and b!276126 res!140094) b!276133))

(declare-fun m!291713 () Bool)

(assert (=> b!276130 m!291713))

(declare-fun m!291715 () Bool)

(assert (=> b!276132 m!291715))

(declare-fun m!291717 () Bool)

(assert (=> b!276125 m!291717))

(declare-fun m!291719 () Bool)

(assert (=> b!276129 m!291719))

(declare-fun m!291721 () Bool)

(assert (=> start!26592 m!291721))

(declare-fun m!291723 () Bool)

(assert (=> start!26592 m!291723))

(declare-fun m!291725 () Bool)

(assert (=> b!276126 m!291725))

(assert (=> b!276126 m!291725))

(declare-fun m!291727 () Bool)

(assert (=> b!276126 m!291727))

(declare-fun m!291729 () Bool)

(assert (=> b!276127 m!291729))

(check-sat (not b!276126) (not b!276127) (not b!276130) (not b!276129) (not b!276125) (not b!276132) (not start!26592))
(check-sat)
