; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44314 () Bool)

(assert start!44314)

(declare-fun b!487344 () Bool)

(declare-fun e!286747 () Bool)

(declare-fun e!286748 () Bool)

(assert (=> b!487344 (= e!286747 e!286748)))

(declare-fun res!290735 () Bool)

(assert (=> b!487344 (=> (not res!290735) (not e!286748))))

(declare-datatypes ((SeekEntryResult!3643 0))(
  ( (MissingZero!3643 (index!16751 (_ BitVec 32))) (Found!3643 (index!16752 (_ BitVec 32))) (Intermediate!3643 (undefined!4455 Bool) (index!16753 (_ BitVec 32)) (x!45871 (_ BitVec 32))) (Undefined!3643) (MissingVacant!3643 (index!16754 (_ BitVec 32))) )
))
(declare-fun lt!220000 () SeekEntryResult!3643)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487344 (= res!290735 (or (= lt!220000 (MissingZero!3643 i!1204)) (= lt!220000 (MissingVacant!3643 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!31565 0))(
  ( (array!31566 (arr!15176 (Array (_ BitVec 32) (_ BitVec 64))) (size!15540 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31565)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31565 (_ BitVec 32)) SeekEntryResult!3643)

(assert (=> b!487344 (= lt!220000 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487345 () Bool)

(declare-fun res!290733 () Bool)

(assert (=> b!487345 (=> (not res!290733) (not e!286748))))

(declare-datatypes ((List!9334 0))(
  ( (Nil!9331) (Cons!9330 (h!10186 (_ BitVec 64)) (t!15562 List!9334)) )
))
(declare-fun arrayNoDuplicates!0 (array!31565 (_ BitVec 32) List!9334) Bool)

(assert (=> b!487345 (= res!290733 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9331))))

(declare-fun e!286749 () Bool)

(declare-fun b!487346 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487346 (= e!286749 (= (seekEntryOrOpen!0 (select (arr!15176 a!3235) j!176) a!3235 mask!3524) (Found!3643 j!176)))))

(declare-fun b!487347 () Bool)

(declare-fun res!290730 () Bool)

(assert (=> b!487347 (=> (not res!290730) (not e!286747))))

(declare-fun arrayContainsKey!0 (array!31565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487347 (= res!290730 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487348 () Bool)

(declare-fun res!290732 () Bool)

(assert (=> b!487348 (=> (not res!290732) (not e!286748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31565 (_ BitVec 32)) Bool)

(assert (=> b!487348 (= res!290732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487350 () Bool)

(assert (=> b!487350 (= e!286748 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!487350 e!286749))

(declare-fun res!290738 () Bool)

(assert (=> b!487350 (=> (not res!290738) (not e!286749))))

(assert (=> b!487350 (= res!290738 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14232 0))(
  ( (Unit!14233) )
))
(declare-fun lt!219999 () Unit!14232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14232)

(assert (=> b!487350 (= lt!219999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487351 () Bool)

(declare-fun res!290737 () Bool)

(assert (=> b!487351 (=> (not res!290737) (not e!286747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487351 (= res!290737 (validKeyInArray!0 (select (arr!15176 a!3235) j!176)))))

(declare-fun b!487352 () Bool)

(declare-fun res!290734 () Bool)

(assert (=> b!487352 (=> (not res!290734) (not e!286747))))

(assert (=> b!487352 (= res!290734 (and (= (size!15540 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15540 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15540 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487349 () Bool)

(declare-fun res!290736 () Bool)

(assert (=> b!487349 (=> (not res!290736) (not e!286747))))

(assert (=> b!487349 (= res!290736 (validKeyInArray!0 k!2280))))

(declare-fun res!290731 () Bool)

(assert (=> start!44314 (=> (not res!290731) (not e!286747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44314 (= res!290731 (validMask!0 mask!3524))))

(assert (=> start!44314 e!286747))

(assert (=> start!44314 true))

(declare-fun array_inv!10972 (array!31565) Bool)

(assert (=> start!44314 (array_inv!10972 a!3235)))

(assert (= (and start!44314 res!290731) b!487352))

(assert (= (and b!487352 res!290734) b!487351))

(assert (= (and b!487351 res!290737) b!487349))

(assert (= (and b!487349 res!290736) b!487347))

(assert (= (and b!487347 res!290730) b!487344))

(assert (= (and b!487344 res!290735) b!487348))

(assert (= (and b!487348 res!290732) b!487345))

(assert (= (and b!487345 res!290733) b!487350))

(assert (= (and b!487350 res!290738) b!487346))

(declare-fun m!467169 () Bool)

(assert (=> b!487347 m!467169))

(declare-fun m!467171 () Bool)

(assert (=> b!487346 m!467171))

(assert (=> b!487346 m!467171))

(declare-fun m!467173 () Bool)

(assert (=> b!487346 m!467173))

(declare-fun m!467175 () Bool)

(assert (=> b!487348 m!467175))

(declare-fun m!467177 () Bool)

(assert (=> start!44314 m!467177))

(declare-fun m!467179 () Bool)

(assert (=> start!44314 m!467179))

(declare-fun m!467181 () Bool)

(assert (=> b!487350 m!467181))

(declare-fun m!467183 () Bool)

(assert (=> b!487350 m!467183))

(declare-fun m!467185 () Bool)

(assert (=> b!487349 m!467185))

(declare-fun m!467187 () Bool)

(assert (=> b!487344 m!467187))

(assert (=> b!487351 m!467171))

(assert (=> b!487351 m!467171))

(declare-fun m!467189 () Bool)

(assert (=> b!487351 m!467189))

(declare-fun m!467191 () Bool)

(assert (=> b!487345 m!467191))

(push 1)

(assert (not b!487348))

(assert (not b!487347))

(assert (not b!487350))

(assert (not b!487346))

(assert (not b!487344))

(assert (not start!44314))

(assert (not b!487351))

(assert (not b!487345))

(assert (not b!487349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

